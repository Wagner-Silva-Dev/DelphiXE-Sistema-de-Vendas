unit View.Cidades.Buscar;

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
  DB,
  DBAccess,
  MyAccess,
  Grids,
  DBGrids,
  StdCtrls,
  Buttons,
  ExtCtrls,
  Model.Cidades.DM, Menus;

type
  TViewCidadesBuscar = class(TViewHerancasBuscar)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnCadastrarClick(Sender: TObject);
  private
    FUltID: integer;

     protected
    procedure BuscarDados; override;
    procedure ChamarTelaCadastrar(const AId: Integer = 0); override;
  public
    property UltID: integer read FUltID write FUltID;
  end;

var
  ViewCidadesBuscar: TViewCidadesBuscar;

implementation

{$R *.dfm}

  uses
    View.Cidades.Cadastrar;


procedure TViewCidadesBuscar.BtnCadastrarClick(Sender: TObject);
begin
  inherited;
  FUltID := 0;
    if (not MyDataSource1.DataSet.IsEmpty) then
      FUltID := MyDataSource1.DataSet.FieldByName('cod_uf').AsInteger;
end;

procedure TViewCidadesBuscar.BuscarDados;
var
  LStrBuscar: string;
  LCondicao: string;
begin
  LStrBuscar := QuotedStr('%' + Trim(EditBuscar.Text) + '%');
  LCondicao := '';

  case RdGroupFiltros.ItemIndex of
    0: LCondicao := 'WHERE cod_uf LIKE ' + LStrBuscar;
    1: LCondicao := 'WHERE nome_uf LIKE ' + LStrBuscar;
    2: LCondicao := 'WHERE uf LIKE ' + LStrBuscar;
  end;
  ModelCidadesDM.CidadesBuscar(Lcondicao);
    if (FUltID > 0) then
      MyDataSource1.DataSet.Locate('cod_uf', FUltID, []);
  inherited;
end;

procedure TViewCidadesBuscar.ChamarTelaCadastrar(const AId: Integer = 0);
var
      LViewHerencasCidadesCadastrar: TViewHerencasCidadesCadastrar;
begin
  inherited;
  LViewHerencasCidadesCadastrar :=  TViewHerencasCidadesCadastrar.Create(nil);
  try
    LViewHerencasCidadesCadastrar.IDRegistroAlterar := AId;
    if(LViewHerencasCidadesCadastrar.ShowModal = mrOk) then
    begin
      inherited;
      UltID :=  LViewHerencasCidadesCadastrar.UltID;
      Self.BuscarDados;
    end;

  finally
    LViewHerencasCidadesCadastrar.Free;                               
  end;
end;

procedure TViewCidadesBuscar.FormCreate(Sender: TObject);
begin
  inherited;
  if (ModelCidadesDM = nil) then
    ModelCidadesDM := TModelCidadesDM.Create(nil);
end;

procedure TViewCidadesBuscar.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(ModelCidadesDM);
end;

end.
