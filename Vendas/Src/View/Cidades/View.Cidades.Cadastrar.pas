unit View.Cidades.Cadastrar;

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
  Model.Cidades.DM,
  Mask,
  DBCtrls,
  RTTI.FieldName,
  ComCtrls;

type
  TViewHerencasCidadesCadastrar = class(TViewHerencasCadastrar)
    Label1: TLabel;
    EdtCodigp: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;

    [FieldName('NOME')]
    EdtNome: TDBEdit;

    [FieldName('UF')]

    CboxUF: TDBComboBox;
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

procedure TViewHerencasCidadesCadastrar.FormShow(Sender: TObject);
begin
  inherited;

  ModelCidadesDM.CadastrarGet(inherited IDRegistroAlterar);
  if(MyDataSource1.DataSet.IsEmpty) then
    MyDataSource1.DataSet.Append
  else
    MyDataSource1.DataSet.Edit;

    EdtNome.SetFocus;
end;

procedure TViewHerencasCidadesCadastrar.BtnGravarClick(Sender: TObject);
begin
  FUltID := MyDataSource1.DataSet.FieldByName('cod_uf').AsInteger;
  self.close;
  Self.ModalResult := mrOk;
    try
      {MyDataSource1.DataSet.Post;
     O TDComboBox aparece a mensagem que sempre esta vazio por isso usei o de baixo}

      ModelCidadesDM.GravarCidade(EdtNome.Text, CboxUF.Text);
      ModelCidadesDM.ValidarDadosQCadastro;
    except
      on E: ExceptionsFieldName do
      TUtils.TratarExceptionsFieldName(Self, E);
      //Testando a mensagem de erro
      {begin
        ShowMessage('Erro: ' + E.Message + sLineBreak + 'FieldName: ' + E.FieldName);
        Exit;
      end;}
    end;

  //Antes das funções
  //if Trim(EdtNome.Text) = '' then  begin  EdtNome.SetFocus;  raise Exception.Create('Preencha o campo nome');  end; //if Trim(CboxUF.Text) = '' then  begin   CboxUF.SetFocus;    //raise Exception.Create('Preencha o campo UF');  //end; //MyDataSource1.DataSet.FieldByName('uf').AsString := CboxUF.Text; // Para ele dar o insert na UF que escolher na lista    //MyDataSource1.DataSet.Post;

    inherited;
end;


end.
