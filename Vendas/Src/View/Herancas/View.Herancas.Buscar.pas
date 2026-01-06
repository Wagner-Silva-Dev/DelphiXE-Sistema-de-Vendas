unit View.Herancas.Buscar;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  Grids,
  DBGrids,
  StdCtrls,
  Buttons,
  ExtCtrls,
  DB,
  DBAccess,
  MyAccess,
  Menus;

type
  TViewHerancasBuscar = class(TForm)
    Pntopo: TPanel;
    Pnrodape: TPanel;
    PnGrid: TPanel;
    Label1: TLabel;
    EditBuscar: TEdit;
    RdGroupFiltros: TRadioGroup;
    BtnCadastrar: TBitBtn;
    BtnUtilizar: TBitBtn;
    BtnFechar: TBitBtn;
    DBGrid1: TDBGrid;
    PnTotal: TPanel;
    LbTotal: TLabel;
    MyDataSource1: TMyDataSource;
    BtnAlterar: TBitBtn;
    PopupMenu1: TPopupMenu;
    Atualizar1: TMenuItem;
    N1: TMenuItem;
    Excluir1: TMenuItem;
    procedure BtnFecharClick(Sender: TObject);
    procedure BtnUtilizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditBuscarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditBuscarKeyPress(Sender: TObject; var Key: Char);
    procedure EditBuscarChange(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure RdGroupFiltrosClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure Atualizar1Click(Sender: TObject);
    procedure Excluir1Click(Sender: TObject);
    procedure BtnCadastrarClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
{essas variaveis  abaixo foram pq como é uma tela de cadastro e eu fiz com diversos tipos de campos de pesquisa não apenas
'ID' o que me fez fazer em cada tela, depois tenho fazer um função para automatizar}
    FUltID: integer;
    FIDSelecionado: Integer;

  protected
    procedure BuscarDados; virtual;
    procedure ChamarTelaCadastrar(const AId: Integer = 0); virtual; abstract;


  public
    property UltID: integer read FUltID write FUltID;
    property IDSelecionado: Integer read FIDSelecionado write FIDSelecionado;
  end;

var
  ViewHerancasBuscar: TViewHerancasBuscar;

implementation

{$R *.dfm}

procedure TViewHerancasBuscar.Atualizar1Click(Sender: TObject);
begin
  Self.BuscarDados;
end;

procedure TViewHerancasBuscar.BtnAlterarClick(Sender: TObject);
  var
  Campo: TField;
  ValorID: Integer;
begin
  if (MyDataSource1.DataSet.IsEmpty) then
    raise Exception.Create('Selecione um registro');

  // tenta pegar cod_uf
  Campo := MyDataSource1.DataSet.FindField('cod_uf');

  if Campo <> nil then
    ValorID := Campo.AsInteger
  else
    ValorID := MyDataSource1.DataSet.FieldByName('ID').AsInteger;

  // agora aplica nos dois lugares
  FUltID := ValorID;
  Self.ChamarTelaCadastrar(ValorID);

end;

procedure TViewHerancasBuscar.BtnCadastrarClick(Sender: TObject);
begin
  Self.ChamarTelaCadastrar;
end;

procedure TViewHerancasBuscar.BtnFecharClick(Sender: TObject);
begin
  Self.Close;
  Self.ModalResult := mrCancel;
end;

procedure TViewHerancasBuscar.BtnUtilizarClick(Sender: TObject);
var
Campo : TField;
begin
  if (MyDataSource1.DataSet.IsEmpty) then
    raise Exception.Create('Selecione um registro');

  // tenta pegar cod_uf
  Campo := MyDataSource1.DataSet.FindField('cod_uf');

  if Campo <> nil then
    FIDSelecionado := Campo.AsInteger
  else
    FIDSelecionado := MyDataSource1.DataSet.FieldByName('ID').AsInteger;

  Self.Close;
  Self.ModalResult := mrOK;

end;

procedure TViewHerancasBuscar.EditBuscarChange(Sender: TObject);
begin
  Self.BuscarDados;
end;

procedure TViewHerancasBuscar.BuscarDados;

var
  Campo: TField;
  IDCampo: string;
Begin
  LbTotal.Caption := 'Registros Localizados: 000000';
  if (MyDataSource1.DataSet.IsEmpty) then
    Exit;

  LbTotal.Caption := 'Registros Localizados: ' + FormatFloat('000000', MyDataSource1.DataSet.RecordCount);

  Campo := MyDataSource1.DataSet.FindField('cod_uf');

  if Campo <> nil then
    IDCampo := 'cod_uf'
  else
    IDCampo := 'ID';

  if FUltID > 0 then
    MyDataSource1.DataSet.Locate(IDCampo, FUltID, []);

End;

procedure TViewHerancasBuscar.DBGrid1DblClick(Sender: TObject);
begin
  BtnUtilizar.Click;
end;

procedure TViewHerancasBuscar.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if(not Odd(MyDataSource1.DataSet.RecNo))then
    DBGrid1.Canvas.Brush.Color := $00D6D6D6;

  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TViewHerancasBuscar.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
    BtnUtilizar.Click;

end;

procedure TViewHerancasBuscar.DBGrid1TitleClick(Column: TColumn);
var
  LCampo : string;
begin
  if (MyDataSource1.DataSet.IsEmpty) then
    Exit;

  LCampo :=  Trim(Column.FieldName);
  if (LCampo = '') or (Column.Field.FieldKind = fkCalculated) then
    Exit;

  TMyQuery(MyDataSource1.DataSet).IndexFieldNames := LCampo;

end;

procedure TViewHerancasBuscar.EditBuscarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case (key) of
    VK_UP: MyDataSource1.DataSet.Prior;  
    VK_DOWN: MyDataSource1.DataSet.Next
  end;
end;

procedure TViewHerancasBuscar.EditBuscarKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13)and not (MyDataSource1.DataSet.IsEmpty) then
    BtnUtilizar.Click;
end;

procedure TViewHerancasBuscar.Excluir1Click(Sender: TObject);
begin
  if(MyDataSource1.DataSet.IsEmpty) then
    raise Exception.Create('Selecione um Registro');

  if (Application.MessageBox(
    'Confirma exclussão desse registro?',
    'Confirma Exclusão?',
    MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> IDYES)
  then
    Exit;

  MyDataSource1.DataSet.Delete;
  Self.BuscarDados;
end;

procedure TViewHerancasBuscar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case (key) of
    VK_F4:
    begin
      if (ssAlt in Shift) then
        Key := 0
    end;
    VK_ESCAPE: BtnFechar.Click;
  end;

  if(Key in [VK_F1..VK_F12]) then
    begin
      if (RdGroupFiltros.Items.Count >= Key - VK_F1) then
      RdGroupFiltros.ItemIndex := key - VK_F1;
    end;
end;

procedure TViewHerancasBuscar.FormShow(Sender: TObject);
begin
  Self.ModalResult := mrCancel;
  FIDSelecionado := 0;
  EditBuscar.SetFocus;
end;

procedure TViewHerancasBuscar.RdGroupFiltrosClick(Sender: TObject);
begin
  EditBuscar.SetFocus;
end;

end.
