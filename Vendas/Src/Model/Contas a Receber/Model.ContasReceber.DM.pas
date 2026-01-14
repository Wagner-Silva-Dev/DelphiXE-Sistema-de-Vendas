unit Model.ContasReceber.DM;

interface

uses
  SysUtils,
  Classes,
  DB,
  MemDS,
  DBAccess,
  MyAccess,
  Model.conexao.DM;

type
  TModelContasReceberDM = class(TDataModule)
    QContasReceberCadastro: TMyQuery;
    QContasReceberBusca: TMyQuery;
    QContasReceberBuscaID_VENDA: TIntegerField;
    QContasReceberBuscaID_PESSOA: TIntegerField;
    QContasReceberBuscanome: TStringField;
    QContasReceberBuscafantasia: TStringField;
    QContasReceberBuscaPARCELA: TIntegerField;
    QContasReceberBuscaVALOR: TFloatField;
    QContasReceberBuscaDATA_EMISSAO: TDateField;
    QContasReceberBuscaDATA_VENCIMENTO: TDateField;
    QContasReceberBuscaSTATUS: TStringField;
  private

  public
    procedure ContasReceberBuscar(const ACondicao: string);
  end;

var
  ModelContasReceberDM: TModelContasReceberDM;

implementation

{$R *.dfm}

procedure TModelContasReceberDM.ContasReceberBuscar(const ACondicao: string);
begin
  QContasReceberBusca.Close;
  QContasReceberBusca.SQL.Clear;
  QContasReceberBusca.SQL.ADD('SELECT cr.ID_VENDA, cr.ID_PESSOA, p.nome, p.fantasia, ');
  QContasReceberBusca.SQL.ADD('cr.PARCELA, cr.VALOR, cr.DATA_EMISSAO, cr.DATA_VENCIMENTO, ');
  QContasReceberBusca.SQL.ADD('cr.STATUS FROM contas_receber cr ');
  QContasReceberBusca.SQL.ADD('JOIN pessoas p ON cr.ID_PESSOA = p.ID ');
  QContasReceberBusca.SQL.ADD('JOIN vendas v ON cr.ID_VENDA = v.ID ');
  QContasReceberBusca.SQL.ADD(ACondicao);
  QContasReceberBusca.Open;
end;


end.
