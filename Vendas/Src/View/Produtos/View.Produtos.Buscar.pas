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
  Model.Produtos.DM,
  View.Produtos.Cadastrar;

type
  TViewProdutosBuscar = class(TViewHerancasBuscar)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnCadastrarClick(Sender: TObject);
    procedure Excluir1Click(Sender: TObject);

  private
    FUltID: integer;

  public
    procedure BuscarDados; override;
    procedure ChamarTelaCadastrar (const AId: Integer = 0); override;
    property UltID: integer read FUltID write FUltID;

  end;

var
  ViewProdutosBuscar: TViewProdutosBuscar;

implementation

{$R *.dfm}

procedure TViewProdutosBuscar.BtnCadastrarClick(Sender: TObject);
begin
  inherited;
    FUltID := 0;
    if (not MyDataSource1.DataSet.IsEmpty) then
      FUltID := MyDataSource1.DataSet.FieldByName('ID').AsInteger;
end;

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

  if (FUltID > 0) then
    MyDataSource1.DataSet.Locate('ID', FUltID, []);

  inherited;

end;

procedure TViewProdutosBuscar.ChamarTelaCadastrar(const AId: Integer);
var
   LViewProdutosCadastrar : TViewProdutosCadastrar;
begin
  inherited;
  LViewProdutosCadastrar :=  TViewProdutosCadastrar.Create(nil);
  try
    LViewProdutosCadastrar.IDRegistroAlterar := AId;
    if(LViewProdutosCadastrar.ShowModal = mrOk) then
    begin
      inherited;
      UltID :=  LViewProdutosCadastrar.UltID;
      Self.BuscarDados;
    end;

  finally
    LViewProdutosCadastrar.Free;
  end;
end;


procedure TViewProdutosBuscar.Excluir1Click(Sender: TObject);
begin
  if(ModelProdutosDM.QProdutosBuscaID.AsInteger = 1) then
    raise Exception.Create('O produto com o código 1 nâo pode ser excluído');
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
