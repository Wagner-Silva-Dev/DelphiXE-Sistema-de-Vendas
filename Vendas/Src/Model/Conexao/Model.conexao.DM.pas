unit Model.conexao.DM;

interface


uses
  SysUtils,
  Classes,
  DB,
  SqlExpr,
  DBXMSSQL,
  MemDS,
  DBAccess,
  MyAccess;

type
  TModelConexaoDM = class(TDataModule)
    MyConnection1: TMyConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ModelConexaoDM: TModelConexaoDM;

implementation

{$R *.dfm}

end.
