unit View.SubGrupos.Buscar;

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
  Model.SubGrupos.DM,
  Menus;

type
  TViewSubGruposBuscar = class(TViewHerancasBuscar)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
  private
    FUltID: integer;
    FIDSelecionado: Integer;
     protected
    procedure BuscarDados; override;
    procedure ChamarTelaCadastrar(const AId: Integer = 0); override;
  public
    property UltID: integer read FUltID write FUltID;
    property IDSelecionado: Integer read FIDSelecionado write FIDSelecionado;

  end;

var
  ViewSubGruposBuscar: TViewSubGruposBuscar;

implementation

{$R *.dfm}

  uses
    View.SubGrupos.Cadastrar;


procedure TViewSubGruposBuscar.BtnAlterarClick(Sender: TObject);
begin
  inherited;
  FUltID := (MyDataSource1.DataSet.FieldByName('ID').AsInteger);
  Self.ChamarTelaCadastrar(MyDataSource1.DataSet.FieldByName('ID').AsInteger);
end;

procedure TViewSubGruposBuscar.BuscarDados;
var
  LStrBuscar: string;
  LCondicao: string;
begin
  LStrBuscar := QuotedStr('%' + Trim(EditBuscar.Text) + '%');
  LCondicao := '';

  case RdGroupFiltros.ItemIndex of
    0: LCondicao := 'WHERE (upper(ID) LIKE ' + LStrBuscar + ')';
    1: LCondicao := 'WHERE (upper(nome) LIKE ' + LStrBuscar + ')';
  end;

  ModelSubGruposDM.SubGruposBuscar(Lcondicao);

  inherited;
end;

procedure TViewSubGruposBuscar.ChamarTelaCadastrar(const AId: Integer = 0);
var
      LViewSubGruposCadastrar: TViewSubGruposCadastrar;
Begin
 inherited;
  LViewSubGruposCadastrar :=  TViewSubGruposCadastrar.create(nil);
  try
    LViewSubGruposCadastrar.IDRegistroAlterar := AId;
    if(LViewSubGruposCadastrar.ShowModal = mrOk) then
    begin
      Self.BuscarDados;
    end;

  finally
    LViewSubGruposCadastrar.Free;
  end;
end;

procedure TViewSubGruposBuscar.FormCreate(Sender: TObject);
begin
  inherited;
  if (ModelSubGruposDM = nil) then
    ModelSubGruposDM := TModelSubGruposDM.Create(nil);
end;

procedure TViewSubGruposBuscar.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(ModelSubGruposDM);
end;

end.
