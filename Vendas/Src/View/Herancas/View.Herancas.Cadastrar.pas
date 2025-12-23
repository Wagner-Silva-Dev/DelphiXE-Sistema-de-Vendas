unit View.Herancas.Cadastrar;

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
  DB,
  DBAccess,
  MyAccess,
  StdCtrls,
  Buttons,
  ExtCtrls;

type
  TViewHerencasCadastrar = class(TForm)
    PnRodape: TPanel;
    PnDados: TPanel;
    BtnCancelar: TBitBtn;
    BtnGravar: TBitBtn;
    MyDataSource1: TMyDataSource;
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    FIDRegistroAlterar: Integer;
    FUltID: integer;
  public
    property IDRegistroAlterar: Integer read FIDRegistroAlterar write FIDRegistroAlterar;
    property UltID: integer read FUltID;

  end;

var
  ViewHerencasCadastrar: TViewHerencasCadastrar;

implementation

{$R *.dfm}

procedure TViewHerencasCadastrar.BtnCancelarClick(Sender: TObject);
begin
  if (MyDataSource1.DataSet.State in [dsInsert, dsEdit]) then
  begin
    MyDataSource1.DataSet.Cancel;
  end;
//    Self.Close;
    Self.ModalResult := mrCancel;
end;

procedure TViewHerencasCadastrar.BtnGravarClick(Sender: TObject);
begin
//  FUltID := MyDataSource1.DataSet.FieldByName('cod_uf').AsInteger;
//  self.close;
//  Self.ModalResult := mrOk;
end;

procedure TViewHerencasCadastrar.FormCreate(Sender: TObject);
begin
  FIDRegistroAlterar := 0;
end;

procedure TViewHerencasCadastrar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case (key) of
    VK_F3 : BtnGravar.Click;
    VK_F4 :
    begin
      if (ssAlt in Shift) then
        Key := 0;
    end;
    VK_ESCAPE : BtnCancelar.Click;
  end;
end;

procedure TViewHerencasCadastrar.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    begin
      Perform(CM_DIALOGKEY, VK_TAB, 0);
      Key := #0;
    end;
end;

end.
