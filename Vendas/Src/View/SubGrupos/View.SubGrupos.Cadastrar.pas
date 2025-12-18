unit View.SubGrupos.Cadastrar;

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
  View.Herancas.Cadastrar,
  DB,
  DBAccess,
  MyAccess,
  StdCtrls,
  Buttons,
  ExtCtrls,
  Model.SubGrupos.DM,
  Mask,
  DBCtrls,
  RTTI.FieldName,
  ComCtrls;

type
  TViewSubGruposCadastrar = class(TViewHerencasCadastrar)
    Label1: TLabel;
    EDTID: TDBEdit;

    [FieldName('NOME')]

    Label3: TLabel;
    EdtNome: TDBEdit;
    procedure BtnGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FUltID: integer;
    FIDSelecionado: Integer;

  public
    property UltID: integer read FUltID write FUltID;
    property IDSelecionado: Integer read FIDSelecionado write FIDSelecionado;
  end;

implementation

{$R *.dfm}

uses
  Exceptions.FieldName,
  Utils;

procedure TViewSubGruposCadastrar.FormShow(Sender: TObject);
begin
  inherited;

  ModelSubGruposDM.CadastrarGet(inherited IDRegistroAlterar);
  if(MyDataSource1.DataSet.IsEmpty) then
    MyDataSource1.DataSet.Append
  else
    MyDataSource1.DataSet.Edit;

    EdtNome.SetFocus;
end;

procedure TViewSubGruposCadastrar.BtnGravarClick(Sender: TObject);
begin
  FUltID := MyDataSource1.DataSet.FieldByName('ID').AsInteger;
  self.close;
  Self.ModalResult := mrOk;
  try
    MyDataSource1.DataSet.Post;
  except
    on E: ExceptionsFieldName do
      TUtils.TratarExceptionsFieldName(Self, E);
  end;

  inherited;
    inherited;
end;


end.
