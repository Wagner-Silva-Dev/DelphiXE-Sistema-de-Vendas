unit Model.Pessoas.DM;

interface

uses
  SysUtils,
  Classes,
  Model.conexao.DM,
  DB,
  MemDS,
  DBAccess,
  MyAccess,
  Exceptions.FieldName;

type
  TModelPessoasDM = class(TDataModule)
    QPessoasCadastro: TMyQuery;
    QPessoasBusca: TMyQuery;
    QPessoasCadastroID: TIntegerField;
    QPessoasCadastronome: TStringField;
    QPessoasCadastrofantasia: TStringField;
    QPessoasCadastrocliente: TStringField;
    QPessoasCadastrofornecedor: TStringField;
    QPessoasCadastrocep: TStringField;
    QPessoasCadastrocod_uf: TIntegerField;
    QPessoasCadastroendereco: TStringField;
    QPessoasCadastronumero: TStringField;
    QPessoasCadastrobairro: TStringField;
    QPessoasCadastrocomplemento: TStringField;
    QPessoasCadastrotelefone: TStringField;
    QPessoasCadastrocelular: TStringField;
    QPessoasCadastroemail: TStringField;
    QPessoasCadastrotipo_juridico: TIntegerField;
    QPessoasCadastroCPF: TStringField;
    QPessoasCadastroRG: TStringField;
    QPessoasCadastroCNPJ: TStringField;
    QPessoasCadastroInsc_Estadual: TStringField;
    QPessoasCadastroativo: TStringField;
    QPessoasCadastronascimento: TDateField;
    QPessoasCadastrodh_cadastro: TDateTimeField;
    QPessoasBuscaID: TIntegerField;
    QPessoasBuscanome: TStringField;
    QPessoasBuscafantasia: TStringField;
    QPessoasBuscacliente: TStringField;
    QPessoasBuscafornecedor: TStringField;
    QPessoasBuscacod_uf: TIntegerField;
    QPessoasBuscanome_uf: TStringField;
    QPessoasBuscauf: TStringField;
    QPessoasBuscaendereco: TStringField;
    QPessoasBuscatelefone: TStringField;
    QPessoasBuscacelular: TStringField;
    procedure QPessoasCadastroAfterInsert(DataSet: TDataSet);
    procedure QPessoasCadastroBeforePost(DataSet: TDataSet);
  private
    procedure ValidarDadosQCadastro;
  public
    procedure CadastrarGet(const AIDPessoa: Integer);
    procedure PessoasBuscar(const ACondicao: string);
  end;

var
  ModelPessoasDM: TModelPessoasDM;

implementation

{$R *.dfm}

procedure TModelPessoasDM.CadastrarGet(const AIDPessoa: Integer);
begin
  QPessoasCadastro.Close;
  QPessoasCadastro.SQL.Clear;
  QPessoasCadastro.SQL.ADD('SELECT * FROM pessoas');
  QPessoasCadastro.SQL.ADD('where ID = :IDPessoa');
  QPessoasCadastro.ParamByName('IDPessoa').AsInteger := AIDPessoa;
  QPessoasCadastro.Open;
end;

procedure TModelPessoasDM.PessoasBuscar(const ACondicao: string);
begin
  QPessoasBusca.Close;
  QPessoasBusca.SQL.Clear;
  QPessoasBusca.SQL.ADD('SELECT p.ID, p.nome, p.fantasia, p.cliente, p.fornecedor, p.cod_uf, ');
  QPessoasBusca.SQL.ADD('uf.nome_uf, uf.uf, ');
  QPessoasBusca.SQL.ADD('p.endereco, p.telefone, p.celular ');
  QPessoasBusca.SQL.ADD('FROM pessoas p ');
  QPessoasBusca.SQL.ADD('INNER JOIN unidade_federal uf ON (p.cod_uf = uf.cod_uf)');
  QPessoasBusca.SQL.ADD(ACondicao);
  QPessoasBusca.Open;
end;

procedure TModelPessoasDM.QPessoasCadastroAfterInsert(DataSet: TDataSet);
begin
  QPessoasCadastroativo.AsString := 'S';
  QPessoasCadastrocliente.AsString := 'S';
  QPessoasCadastrofornecedor.AsString := 'S';
  QPessoasCadastrodh_cadastro.AsDateTime := Now;
  QPessoasCadastrotipo_juridico.AsString := '1';
end;

procedure TModelPessoasDM.QPessoasCadastroBeforePost(DataSet: TDataSet);
begin
  Self.ValidarDadosQCadastro;
end;

procedure TModelPessoasDM.ValidarDadosQCadastro;
begin
  if Trim(QPessoasCadastronome.AsString) = '' then
    raise ExceptionsFieldName.Create('Preencha o campo nome' , 'NOME');

  if Trim(QPessoasCadastrofantasia.AsString) = '' then
    raise ExceptionsFieldName.Create('Preencha o campo Fantasia' , 'FANTASIA');

  if (QPessoasCadastrocod_uf.AsInteger <= 0) then
    raise ExceptionsFieldName.Create('Preencha o campo Código Cidade' , 'cod_uf');
end;

end.
