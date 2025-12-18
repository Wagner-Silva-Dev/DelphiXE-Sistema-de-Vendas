unit View.Pessoas.Buscar;

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
  Model.Pessoas.DM,
  View.Pessoas.Cadastrar;

type
  TViewPessoasBuscar = class(TViewHerancasBuscar)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FUltID: integer;
    FIDSelecionado: Integer;
  public
    procedure BuscarDados; override;
    procedure ChamarTelaCadastrar(const AId: Integer = 0); override;
    property UltID: integer read FUltID write FUltID;
    property IDSelecionado: Integer read FIDSelecionado write FIDSelecionado;
  end;

var
  ViewPessoasBuscar: TViewPessoasBuscar;

implementation



{$R *.dfm}

{ TViewPessoasBuscar }

procedure TViewPessoasBuscar.BuscarDados;
  var
  LStrBuscar: string;
  LCondicao: string;
begin
  LStrBuscar := QuotedStr('%' + Trim(EditBuscar.Text) + '%');
  LCondicao := '';

  case RdGroupFiltros.ItemIndex of
    0: LCondicao := 'WHERE p.ID LIKE ' + LStrBuscar ;
    1: LCondicao := 'WHERE p.nome LIKE ' + LStrBuscar + ' or p.fantasia LIKE ' + LStrBuscar;
    2: LCondicao := 'WHERE uf.nome_uf LIKE ' + LStrBuscar;
  end;
  ModelPessoasDM.PessoasBuscar(Lcondicao);
  inherited;
end;

procedure TViewPessoasBuscar.ChamarTelaCadastrar(const AId: Integer = 0);
var
   LViewPessoasCadastrar : TViewPessoasCadastrar;
begin
  inherited;
  LViewPessoasCadastrar :=  TViewPessoasCadastrar.Create(nil);
  try
    LViewPessoasCadastrar.IDRegistroAlterar := AId;
    if(LViewPessoasCadastrar.ShowModal = mrOk) then
    begin
      UltID :=  LViewPessoasCadastrar.UltID;
      Self.BuscarDados;
    end;

  finally
    LViewPessoasCadastrar.Free;
  end;
end;

procedure TViewPessoasBuscar.FormCreate(Sender: TObject);
begin
  inherited;
 if (ModelPessoasDM = nil) then
    ModelPessoasDM := TModelPessoasDM.Create(nil);
end;

procedure TViewPessoasBuscar.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(ModelPessoasDM);
end;

end.
