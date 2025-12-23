unit Model.Produtos.DM;

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
  TModelProdutosDM = class(TDataModule)
    QProdutosCadastro: TMyQuery;
    QProdutosBusca: TMyQuery;
    QLookup: TMyQuery;
    QLookupNome: TStringField;
    QProdutosCadastroID: TIntegerField;
    QProdutosCadastroID_Subgrupo: TIntegerField;
    QProdutosCadastronome: TStringField;
    QProdutosCadastropreco_custo: TFloatField;
    QProdutosCadastroporcentagem: TFloatField;
    QProdutosCadastropreco_venda: TFloatField;
    QProdutosCadastrounidade: TStringField;
    QProdutosCadastrocodigo_barras: TStringField;
    QProdutosBuscaID: TIntegerField;
    QProdutosBuscanome: TStringField;
    QProdutosBuscapreco_custo: TFloatField;
    QProdutosBuscaporcentagem: TFloatField;
    QProdutosBuscapreco_venda: TFloatField;
    QProdutosBuscaunidade: TStringField;
    QProdutosBuscacodigo_barras: TStringField;
    QProdutosBuscaSubGrupoNOME: TStringField;
    QProdutosBuscaID_Subgrupo: TIntegerField;
    QProdutosCadastroDescricao: TStringField;
    QProdutosCadastroImagem: TStringField;
    QLookupID: TIntegerField;
    QLookuppreco_venda: TFloatField;
    QLookupunidade: TStringField;
    procedure QProdutosCadastroAfterInsert(DataSet: TDataSet);
    procedure QProdutosCadastroBeforePost(DataSet: TDataSet);
  private

  public
    procedure ProdutosBuscar(const ACondicao: string);
    procedure CadastrarGet(const AIdProdutos: Integer);
    procedure ValidarDadosQCadastro;
    function LookProdutos(const ACodBarras: string): Boolean;

  end;

var
  ModelProdutosDM: TModelProdutosDM;

implementation

{$R *.dfm}



procedure TModelProdutosDM.CadastrarGet(const AIdProdutos: Integer);
begin
  QProdutosCadastro.Close;
  QProdutosCadastro.SQL.Clear;
  QProdutosCadastro.SQL.ADD('SELECT * FROM Produtosof');
  QProdutosCadastro.SQL.ADD('where ID = :IDProdutos');
  QProdutosCadastro.ParamByName('IDProdutos').AsInteger := AIdProdutos;
  QProdutosCadastro.Open;
end;

function TModelProdutosDM.LookProdutos(const ACodBarras: string): Boolean;
begin
  QLookup.Close;
  QLookup.ParamByName('CodBarras').AsString := ACodBarras;
  QLookup.Open;

  Result := not QLookup.IsEmpty;
end;

procedure TModelProdutosDM.ProdutosBuscar(const ACondicao: string);
begin
  QProdutosBusca.Close;
  QProdutosBusca.SQL.Clear;
  QProdutosBusca.SQL.ADD('SELECT p.ID, p.nome, p.preco_custo, p.porcentagem, p.preco_venda,');
  QProdutosBusca.SQL.ADD('p.unidade, p.codigo_barras,');
  QProdutosBusca.SQL.ADD('p.ID_Subgrupo, ');
  QProdutosBusca.SQL.ADD('s.Nome AS SubGrupoNOME FROM produtosof p');
  QProdutosBusca.SQL.ADD('JOIN subgrupos s ON (s.ID = p.ID_Subgrupo)');
  QProdutosBusca.SQL.ADD(ACondicao);
  QProdutosBusca.Open;

end;

procedure TModelProdutosDM.QProdutosCadastroAfterInsert(DataSet: TDataSet);
begin
  QProdutosCadastropreco_custo.AsFloat := 0;
  QProdutosCadastroporcentagem.AsFloat := 0;
  QProdutosCadastropreco_venda.AsFloat := 0;
  QProdutosCadastrounidade.AsString := 'UN';
end;

procedure TModelProdutosDM.QProdutosCadastroBeforePost(DataSet: TDataSet);
begin
  Self.ValidarDadosQCadastro
end;

procedure TModelProdutosDM.ValidarDadosQCadastro;
begin
  if Trim(QProdutosCadastronome.AsString) = '' then
    raise ExceptionsFieldName.Create('Preencha o campo nome' , 'Nome');

  if (QProdutosCadastroID_Subgrupo.AsInteger <= 0) then
    raise ExceptionsFieldName.Create('SubGrupo não informado ' , 'ID_Subgrupo');

  if (QProdutosCadastropreco_custo.AsFloat < 0) then
    raise ExceptionsFieldName.Create('Preço de custo inválido ' , 'preco_custo');

  if (QProdutosCadastroporcentagem.AsFloat < 0) then
    raise ExceptionsFieldName.Create('Porcentagem Inválida ' , 'porcentagem');

  if (QProdutosCadastropreco_venda.AsFloat <= 0) then
    raise ExceptionsFieldName.Create('Preço de venda inválido ' , 'preco_venda');

  if (QProdutosCadastropreco_venda.AsFloat < QProdutosCadastropreco_custo.AsFloat) then
    raise ExceptionsFieldName.Create('Preço de venda não pode ser menor que o preço de custo ' , 'preco_venda');

  if Trim(QProdutosCadastrounidade.AsString) = '' then
    raise ExceptionsFieldName.Create('Informe a Unidade ' , 'unidade');

  if Trim(QProdutosCadastrocodigo_barras.AsString) = '' then
    raise ExceptionsFieldName.Create('Informe o código de barras ' , 'codigo_barras');

end;

end.
