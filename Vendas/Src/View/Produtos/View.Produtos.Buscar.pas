unit View.Produtos.Buscar;

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
  View.Herancas.Buscar,
  Menus,
  DB,
  DBAccess,
  MyAccess,
  Grids,
  DBGrids,
  StdCtrls,
  Buttons,
  ExtCtrls,
  Model.Produtos.DM;

type
  TViewProdutosBuscar = class(TViewHerancasBuscar)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private

  public
    procedure BuscarDados; override;
    procedure ChamarTelaCadastrar (const AId: Integer = 0); override;

  end;

var
  ViewProdutosBuscar: TViewProdutosBuscar;

implementation

{$R *.dfm}

procedure TViewProdutosBuscar.BuscarDados;
var
  LStrBuscar: string;
  LCondicao: string;
begin
  LStrBuscar := QuotedStr('%' + Trim(EditBuscar.Text) + '%');
  LCondicao := '';

  case RdGroupFiltros.ItemIndex of
    0: LCondicao := 'WHERE p.id LIKE ' + LStrBuscar ;
    1: LCondicao := 'WHERE (upper(p.nome) LIKE ' + LStrBuscar + ')' ;
    2: LCondicao := 'WHERE (p.codigo_barras) LIKE ' + LStrBuscar;
    3: LCondicao := 'WHERE (upper(s.Nome) LIKE ' + LStrBuscar + ')';
  end;
  ModelProdutosDM.ProdutosBuscar(Lcondicao);
  inherited;

end;

procedure TViewProdutosBuscar.ChamarTelaCadastrar(const AId: Integer);
//var
begin
  inherited;

end;


procedure TViewProdutosBuscar.FormCreate(Sender: TObject);
begin
  inherited;
  if (ModelProdutosDM = nil) then
    ModelProdutosDM := TModelProdutosDM.Create(nil);
end;

procedure TViewProdutosBuscar.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(ModelProdutosDM);
end;

end.
