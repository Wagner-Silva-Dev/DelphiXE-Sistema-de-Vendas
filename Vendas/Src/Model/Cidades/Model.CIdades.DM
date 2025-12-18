unit Model.CIdades;

interface


uses
  SysUtils, Classes, DB, MemDS, DBAccess, MyAccess, Model.conexao.DM;

type
  TModelCidadesDm = class(TDataModule)
    QCidadesCadastro: TMyQuery;
    QCidadesBusca: TMyQuery;
    DS_QCidadesCadastro: TDataSource;
    DS_QCidadesBusca: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  ModelCidadesDm: TModelCidadesDm;

implementation

{$R *.dfm}

end.
