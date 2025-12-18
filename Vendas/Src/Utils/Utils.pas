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
    class procedure TratarExceptionsFieldName(const AForm : TForm; const E : ExceptionsFieldName);
  end;
implementation

{ TUtils }

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

end.
