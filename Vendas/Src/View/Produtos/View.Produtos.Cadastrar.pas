unit View.Produtos.Cadastrar;

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
  DB, DBAccess,
  MyAccess,
  StdCtrls,
  Buttons,
  ExtCtrls,
  Model.Produtos.DM, Mask, DBCtrls;

type
  TViewProdutosCadastrar = class(TViewHerencasCadastrar)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewProdutosCadastrar: TViewProdutosCadastrar;

implementation

{$R *.dfm}

end.
