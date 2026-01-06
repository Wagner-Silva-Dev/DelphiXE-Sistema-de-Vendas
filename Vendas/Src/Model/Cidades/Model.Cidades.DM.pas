unit Model.Cidades.DM;

interface

uses
  SysUtils,
  Classes,
  DB,
  DBAccess,
  MyAccess,
  MemDS,
  Model.conexao.DM,
  Exceptions.FieldName;

type
  TModelCidadesDM = class(TDataModule)
    QCidadesCadastro: TMyQuery;
    QCidadesBusca: TMyQuery;
    C: TShortintField;
    QCidadesCadastrouf: TStringField;
    QCidadesCadastronome_uf: TStringField;
    QCidadesBuscacod_uf: TShortintField;
    QCidadesBuscauf: TStringField;
    QCidadesBuscanome_uf: TStringField;
    QLookup: TMyQuery;
    QLookupnome_uf: TStringField;
    QLookupuf: TStringField;
    procedure QCidadesCadastroBeforePost(DataSet: TDataSet);

  private

  public
    procedure CidadesBuscar(const ACondicao: string);
    procedure CadastrarGet(const AIdCidades: Integer);
    procedure ValidarDadosQCadastro;
    procedure GravarCidade(const ANome, AUF: string);
    procedure LookCidade(const AIdCidades: Integer);
  end;

var
  ModelCidadesDM: TModelCidadesDM;

implementation

{$R *.dfm}

{ TModelCidadesDM }

procedure TModelCidadesDM.CadastrarGet(const AIdCidades: Integer);
begin
  QCidadesCadastro.Close;
  QCidadesCadastro.SQL.Clear;
  QCidadesCadastro.SQL.ADD('SELECT * FROM unidade_federal');
  QCidadesCadastro.SQL.ADD('where cod_uf = :cod_uf');
  QCidadesCadastro.ParamByName('cod_uf').AsInteger := AIdCidades;
  QCidadesCadastro.Open;
end;

procedure TModelCidadesDM.CidadesBuscar(const ACondicao: string);
begin
  QCidadesBusca.Close;
  QCidadesBusca.SQL.Clear;
  QCidadesBusca.SQL.ADD('SELECT * FROM unidade_federal');
  QCidadesBusca.SQL.ADD(ACondicao);
  QCidadesBusca.Open;
end;

procedure TModelCidadesDM.LookCidade(const AIdCidades: Integer);
begin
  QLookup.Close;
  QLookup.ParamByName('cod_uf').AsInteger := AIdCidades;
  QLookup.Open;
end;

procedure TModelCidadesDM.GravarCidade(const ANome, AUF: string);
begin
  QCidadesCadastro.Edit;

  QCidadesCadastronome_uf.AsString := ANome;
  QCidadesCadastrouf.AsString := AUF;
  QCidadesCadastro.Post;
end;

procedure TModelCidadesDM.QCidadesCadastroBeforePost(DataSet: TDataSet);
begin
  Self.ValidarDadosQCadastro;
end;

procedure TModelCidadesDM.ValidarDadosQCadastro;
begin
  if Trim(QCidadesCadastronome_uf.AsString) = '' then
    raise ExceptionsFieldName.Create('Preencha o campo nome' , 'NOME');

  if Trim(QCidadesCadastrouf.AsString) = '' then
    raise ExceptionsFieldName.Create('Preencha o campo UF' , 'UF');
end;

end.
