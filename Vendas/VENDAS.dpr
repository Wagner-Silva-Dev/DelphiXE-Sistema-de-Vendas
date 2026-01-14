program VENDAS;

uses
  Forms,
  Model.conexao.DM in 'Src\Model\Conexao\Model.conexao.DM.pas' {ModelConexaoDM: TDataModule},
  Principal in 'Src\View\Principal.pas' {ViewPrincipal},
  View.Herancas.Buscar in 'Src\View\Herancas\View.Herancas.Buscar.pas' {ViewHerancasBuscar},
  View.SubGrupos.Buscar in 'Src\View\SubGrupos\View.SubGrupos.Buscar.pas' {ViewSubGruposBuscar},
  View.Herancas.Cadastrar in 'Src\View\Herancas\View.Herancas.Cadastrar.pas' {ViewHerencasCadastrar},
  View.SubGrupos.Cadastrar in 'Src\View\SubGrupos\View.SubGrupos.Cadastrar.pas' {ViewSubGruposCadastrar},
  Model.Pessoas.DM in 'Src\Model\Pessoas\Model.Pessoas.DM.pas' {ModelPessoasDM: TDataModule},
  View.Pessoas.Buscar in 'Src\View\Pessoas\View.Pessoas.Buscar.pas' {ViewPessoasBuscar},
  Exceptions.FieldName in 'Src\Exceptions\Exceptions.FieldName.pas',
  RTTI.FieldName in 'Src\RTTI\RTTI.FieldName.pas',
  Utils in 'Src\Utils\Utils.pas',
  View.Pessoas.Cadastrar in 'Src\View\Pessoas\View.Pessoas.Cadastrar.pas' {ViewHerencasCadastrar1},
  Model.SubGrupos.DM in 'Src\Model\SubGrupos\Model.SubGrupos.DM.pas' {ModelSubGruposDM},
  Model.Cidades.DM in 'Src\Model\Cidades\Model.Cidades.DM.pas' {ModelCidadesDM: TDataModule},
  View.Cidades.Buscar in 'Src\View\Cidades\View.Cidades.Buscar.pas' {ViewCidadesBuscar},
  View.Cidades.Cadastrar in 'Src\View\Cidades\View.Cidades.Cadastrar.pas' {ViewHerencasCidadesCadastrar},
  Model.Produtos.DM in 'Src\Model\Produtos\Model.Produtos.DM.pas' {ModelProdutosDM: TDataModule},
  View.Produtos.Buscar in 'Src\View\Produtos\View.Produtos.Buscar.pas' {ViewProdutosBuscar},
  View.Produtos.Cadastrar in 'Src\View\Produtos\View.Produtos.Cadastrar.pas' {ViewProdutosCadastrar},
  View.Vendas in 'Src\View\Vendas\View.Vendas.pas' {ViewVendas},
  Model.Vendas.DM in 'Src\Model\Vendas\Model.Vendas.DM.pas' {ModelVendasDM: TDataModule},
  Model.ContasReceber.DM in 'Src\Model\Contas a Receber\Model.ContasReceber.DM.pas' {ModelContasReceberDM: TDataModule},
  View.ContasReceber.Buscar in 'Src\View\Contas a Receber\View.ContasReceber.Buscar.pas' {ViewContasReceberBuscar};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Vendas';
  Application.CreateForm(TModelConexaoDM, ModelConexaoDM);
  Application.CreateForm(TViewPrincipal, ViewPrincipal);
  Application.Run;
end.
