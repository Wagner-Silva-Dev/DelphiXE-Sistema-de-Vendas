unit Utils;

interface

uses

  SysUtils,
  Classes,
  Rtti,
  Forms,
  Controls,
  ComCtrls,
  Exceptions.FieldName,
  RTTI.FieldName;

type
  TUtils = class
  private
    class procedure SetFocusComponents(const AWinCOntrol: TWinControl);



  public
    class procedure PegarDadosLancamento(const AValue: string; var ACodigo: string; var AQtd, ADesconto, AAcrescimo: Double);
    class function GetPastaRaiz : string;
    class function GetPastaImg : string;
    class function GetPastaImgProdutos : string;
    class procedure TratarExceptionsFieldName(const AForm : TForm; const E : ExceptionsFieldName);
  end;
implementation

class procedure TUtils.PegarDadosLancamento(const AValue: string;
  var ACodigo: string; var AQtd, ADesconto, AAcrescimo: Double);
var
  LValue: string;
  LPosAsterisco: Integer;
  LPosMais: Integer;
  LPosMenos: Integer;
  i: Integer;
  LQtd: string;
  LDesconto: string;
  LAcrescimo: string;
begin
  LValue := Trim(AValue);
  ACodigo := '';
  AQtd := 1;
  ADesconto := 0;
  AAcrescimo := 0;

  LPosAsterisco := Pos('*', LValue);
  LPosMais := Pos('+', LValue);
  LPosMenos := Pos('-', LValue);

  if (LPosAsterisco <= 0) and (LPosMais <= 0) and (LPosMenos <= 0) then
  begin
    ACodigo := LValue;
    Exit;
  end;

  //PEGAR O CÓDIGO
  for i := Length(LValue) downto 1 do
  begin
    if (LValue[i] = '*') or (LValue[i] = '-') or (LValue[i] = '+') then
      Break;

    ACodigo := LValue[i] + ACodigo;
  end;

  if(LPosMais > 0) then
  begin
    for i := Pred(LPosMais) downto 1 do
    begin
      if (LValue[i] = '*') or (LValue[i] = '-') then
        Break;

      LAcrescimo := LValue[i] + LAcrescimo;
    end;

    AAcrescimo := StrToFloatDef(LAcrescimo, 0);

  end;

  if(LPosMenos > 0) then
  begin
    for i := Pred(LPosMenos) downto 1 do
    begin
      if (LValue[i] = '*') or (LValue[i] = '+') then
        Break;

      LDesconto := LValue[i] + LDesconto;
    end;

    ADesconto := StrToFloatDef(LDesconto, 0);

  end;

  if(LPosAsterisco > 0) then
  begin
    for i := Pred(LPosAsterisco) downto 1 do
    begin
      if (LValue[i] = '+') or (LValue[i] = '-') then
        Break;

      LQtd := LValue[i] + LQtd;
    end;

    AQtd := StrToFloatDef(LQtd, 0);

  end;
end;

class function TUtils.GetPastaRaiz: string;
begin
  Result := IncludeTrailingPathDelimiter(ExtractFileDir(ParamStr(0)));
end;

class function TUtils.GetPastaImg: string;
begin
  Result := IncludeTrailingPathDelimiter(Self.GetPastaRaiz + 'Img');
end;

class function TUtils.GetPastaImgProdutos: string;
begin
    Result := IncludeTrailingPathDelimiter(Self.GetPastaImg + 'Produtos');
end;

class procedure TUtils.TratarExceptionsFieldName(const AForm: TForm;
  const E: ExceptionsFieldName);
var
  LRttiContext : TRttiContext;
  LRttiType : TRttiType;
  LRttiField : TRttiField;
  LCustomAtributte : TCustomAttribute;
  LFieldName : FieldName;
  LComponent : TComponent;
begin
  LRttiContext := TRttiContext.Create;
  LRttiType := LRttiContext.GetType(AForm.ClassInfo);

  for LRttiField in LRttiType.GetFields do
  begin
    if (LRttiField.Parent <> LRttiType) then
      Continue;

    for LCustomAtributte in  LRttiField.GetAttributes do
    begin
      if not (LCustomAtributte is FieldName) then
        Continue;

      LFieldName := FieldName(LCustomAtributte);
      if (LFieldName.Name <> E.FieldName) then
        Continue;

      LComponent := AForm.FindComponent(LRttiField.Name);
      if (LComponent = nil) then
        Continue;

      if not (LComponent is TWinControl) then
        continue;

      Self.SetFocusComponents(TWinControl(LComponent));

    end;
  end;

  raise Exception.Create(E.Message);
end;


class procedure TUtils.SetFocusComponents(const AWinCOntrol : TWinControl);
var
  LParent : TComponent;
begin
  LParent := AWinCOntrol.Parent;
  while (LParent <> nil) and (LParent.ClassParent <> TForm) do
  begin
    if(LParent is TTabSheet) then
      if not (TTabSheet(LParent).Showing) then
        TTabSheet(LParent).Show;

    LParent := TWinControl(LParent).Parent;
  end;


  if (AWinCOntrol.CanFocus) then
  AWinCOntrol.SetFocus;
end;

initialization
  ForceDirectories(TUtils.GetPastaImgProdutos)
end.
