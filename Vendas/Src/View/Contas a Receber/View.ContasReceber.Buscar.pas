unit View.ContasReceber.Buscar;

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
  Model.ContasReceber.DM;

type
  TViewContasReceberBuscar = class(TViewHerancasBuscar)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private

  public
    procedure BuscarDados; override;
  end;

var
  ViewContasReceberBuscar: TViewContasReceberBuscar;

implementation

{$R *.dfm}

procedure TViewContasReceberBuscar.BuscarDados;
var
  LStrBuscar: string;
  LCondicao: string;
begin
  LStrBuscar := QuotedStr('%' + Trim(EditBuscar.Text) + '%');
  LCondicao := '';

  case RdGroupFiltros.ItemIndex of
    0: LCondicao := 'WHERE cr.ID LIKE ' + LStrBuscar ;
    1: LCondicao := 'WHERE p.nome LIKE ' + LStrBuscar + ' or p.fantasia LIKE ' + LStrBuscar ;
    2: LCondicao := 'WHERE STATUS = "A"';
    3: LCondicao := 'WHERE STATUS = "P"';
  end;

  ModelContasReceberDM.ContasReceberBuscar(Lcondicao);
  inherited;
end;

procedure TViewContasReceberBuscar.FormCreate(Sender: TObject);
begin
  inherited;
  if (ModelContasReceberDM = nil) then
   ModelContasReceberDM := TModelContasReceberDM.Create(nil);
end;

procedure TViewContasReceberBuscar.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(ModelContasReceberDM);
end;

end.
