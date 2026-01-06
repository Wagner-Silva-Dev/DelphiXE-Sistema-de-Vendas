unit Model.Vendas.DM;

interface

uses
  Windows,
  SysUtils,
  Classes,
  Model.conexao.DM,
  DB,
  MemDS,
  Forms,
  DBAccess,
  MyAccess;

type
  TModelVendasDM = class(TDataModule)
    QVendasCadastro: TMyQuery;
    QVendasItensCadastrar: TMyQuery;
    QVendasItensListar: TMyQuery;
    QVendasCadastroID: TIntegerField;
    QVendasCadastroID_Pessoa: TIntegerField;
    QVendasCadastroDATA: TDateField;
    QVendasCadastroHora: TTimeField;
    QVendasCadastroTotal_Bruto: TFloatField;
    QVendasCadastroTotal_Descontos: TFloatField;
    QVendasCadastroTotal_Acrescimos: TFloatField;
    QVendasCadastroTotal_Liquido: TFloatField;
    QVendasItensCadastrarID: TIntegerField;
    QVendasItensCadastrarID_Venda: TIntegerField;
    QVendasItensCadastrarID_Produto: TIntegerField;
    QVendasItensCadastrarquantidade: TFloatField;
    QVendasItensCadastrarvalor_unitario: TFloatField;
    QVendasItensCadastrardesconto: TFloatField;
    QVendasItensCadastraracrescimo: TFloatField;
    QVendasItensCadastrartotal_liquido: TFloatField;
    QVendasItensListarID: TIntegerField;
    QVendasItensListarID_Venda: TIntegerField;
    QVendasItensListarID_Produto: TIntegerField;
    QVendasItensListarquantidade: TFloatField;
    QVendasItensListarvalor_unitario: TFloatField;
    QVendasItensListardesconto: TFloatField;
    QVendasItensListaracrescimo: TFloatField;
    QVendasItensListartotal_liquido: TFloatField;
    QVendasItensListarProdutoNome: TStringField;
    QVendasItensCadastrarTotal_Bruto: TFloatField;
    QVendasItensListarTotal_Bruto: TFloatField;
    QVendasTotalizar: TMyQuery;
    QVendasTotalizarTotalQuantidade: TFloatField;
    QVendasTotalizarTotalBruto: TFloatField;
    QVendasTotalizarTotalDesconto: TFloatField;
    QVendasTotalizarTotalAcrescimo: TFloatField;
    QVendasTotalizarTotalLiquido: TFloatField;
    QVendasItensListarImagem: TStringField;
    procedure QVendasCadastroAfterInsert(DataSet: TDataSet);
    procedure QVendasItensCadastrarAfterInsert(DataSet: TDataSet);
  private

  public
      procedure VendasGet(const AIdVenda: Integer = 0);
      procedure VendasItensGet(const AIdItem: Integer = 0);
      procedure VendasItensListar(const AIdVenda: Integer = 0; const AIdItemVendaFocar: Integer = 0);
      procedure VendaTotalizar(const AIdVenda: Integer);
  end;

var
  ModelVendasDM: TModelVendasDM;

implementation

{$R *.dfm}

{ TModelVendasDM }



procedure TModelVendasDM.VendasGet(const AIdVenda: Integer = 0);
begin
  QVendasCadastro.Close;
  QVendasCadastro.ParamByName('IDVENDA').AsInteger := AIdVenda;
  QVendasCadastro.Open;
end;

procedure TModelVendasDM.VendasItensGet(const AIdItem: Integer);
begin
  QVendasItensCadastrar.Close;
  QVendasItensCadastrar.ParamByName('IDITEM').AsInteger := AIdItem;
  QVendasItensCadastrar.Open;
end;

procedure TModelVendasDM.VendasItensListar(const AIdVenda: Integer = 0; const AIdItemVendaFocar: Integer = 0);
begin
  QVendasItensListar.DisableControls;
  try
    QVendasItensListar.Close;
    QVendasItensListar.ParamByName('IDVENDA').AsInteger := AIdVenda;
    QVendasItensListar.Open;

    if (AIdItemVendaFocar > 0) then
      QVendasItensListar.Locate('ID', AIdItemVendaFocar, [loCaseInsensitive]);
  finally
    QVendasItensListar.EnableControls;
  end;
end;

procedure TModelVendasDM.QVendasCadastroAfterInsert(DataSet: TDataSet);
begin
  QVendasCadastroID_Pessoa.AsInteger := 1;
  QVendasCadastroDATA.AsDateTime := Date;
  QVendasCadastroHora.AsDateTime := Time;
  QVendasCadastroTotal_Bruto.AsFloat := 0;
  QVendasCadastroTotal_Descontos.AsFloat := 0;
  QVendasCadastroTotal_Acrescimos.AsFloat := 0;
  QVendasCadastroTotal_Liquido.AsFloat := 0;
end;

procedure TModelVendasDM.QVendasItensCadastrarAfterInsert(DataSet: TDataSet);
begin
  QVendasItensCadastrarquantidade.AsFloat := 1;
  QVendasItensCadastrarvalor_unitario.AsFloat := 0;
  QVendasItensCadastrarTotal_Bruto.AsFloat := 0;
  QVendasItensCadastrardesconto.AsFloat := 0;
  QVendasItensCadastraracrescimo.AsFloat := 0;
  QVendasItensCadastrartotal_liquido.AsFloat := 0;
end;

procedure TModelVendasDM.VendaTotalizar(const AIdVenda: Integer);
begin
  QVendasTotalizar.Close;
  QVendasTotalizar.ParamByName('ID_VENDA').AsInteger := AIdVenda;
  QVendasTotalizar.Open;
end;
end.
