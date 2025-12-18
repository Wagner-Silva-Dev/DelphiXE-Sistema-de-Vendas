unit Model.Produtos.DM;

interface

uses
  SysUtils,
  Classes,
  Model.conexao.DM,
  DB,
  MemDS,
  DBAccess,
  MyAccess;

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
  private
    { Private declarations }
  public
    procedure ProdutosBuscar(const ACondicao: string);
    procedure CadastrarGet(const AIdProdutos: Integer);
    procedure ValidarDadosQCadastro;
    procedure LookProdutos(const AIdProdutos: Integer);

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

procedure TModelProdutosDM.LookProdutos(const AIdProdutos: Integer);
begin
  QLookup.Close;
  QLookup.ParamByName('IDProdutos)').AsInteger := AIdProdutos;
  QLookup.Open;
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

procedure TModelProdutosDM.ValidarDadosQCadastro;
begin
//
end;

end.
