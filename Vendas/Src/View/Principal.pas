unit Principal;

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
  Menus,
  ExtCtrls,
  StdCtrls,
  pngimage,
  ShellAPI,
  IWDataModulePool;

type
  TViewPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Financeiro1: TMenuItem;
    Fiscal1: TMenuItem;
    Empresas1: TMenuItem;
    Cidades1: TMenuItem;
    Pessoas1: TMenuItem;
    N1: TMenuItem;
    Subgruposdeprodutos1: TMenuItem;
    Produtos1: TMenuItem;
    ContasaReceber1: TMenuItem;
    Configuraes1: TMenuItem;
    NFCe1: TMenuItem;
    Movimentaes1: TMenuItem;
    Vendas1: TMenuItem;
    pnlogo: TPanel;
    Panel4: TPanel;
    Image1: TImage;
    panel5: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    IWDataModulePool1: TIWDataModulePool;
    procedure lbyoutubeClick(Sender: TObject);
    procedure lbyoutubeMouseEnter(Sender: TObject);
    procedure lbyoutubeMouseLeave(Sender: TObject);
    procedure Cidades1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Pessoas1Click(Sender: TObject);
    procedure Subgruposdeprodutos1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure Vendas1Click(Sender: TObject);
    procedure ContasaReceber1Click(Sender: TObject);
    procedure Empresas1Click(Sender: TObject);
    procedure Configuraes1Click(Sender: TObject);
    procedure NFCe1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewPrincipal: TViewPrincipal;

implementation

{$R *.dfm}

uses
  View.Cidades.Buscar,
  View.Pessoas.Buscar,
  View.SubGrupos.Buscar,
  View.Produtos.Buscar,
  View.Vendas,
  View.ContasReceber.Buscar;


procedure TViewPrincipal.Configuraes1Click(Sender: TObject);
begin
  ShowMessage('Em Desenvolvimento!');
end;

procedure TViewPrincipal.Empresas1Click(Sender: TObject);
begin
  ShowMessage('Em Desenvolvimento!');
end;

procedure TViewPrincipal.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
end;

procedure TViewPrincipal.lbyoutubeClick(Sender: TObject);
begin
  shellexecute(0, nil, PChar(TLabel(Sender).caption), '', '', SW_SHOWNORMAL);
end;

procedure TViewPrincipal.lbyoutubeMouseEnter(Sender: TObject);
begin
  TLabel(Sender).Font.color := clred;
end;

procedure TViewPrincipal.lbyoutubeMouseLeave(Sender: TObject);
begin
  TLabel(Sender).Font.Color := clWindowText;
end;

procedure TViewPrincipal.NFCe1Click(Sender: TObject);
begin
  ShowMessage('Em Desenvolvimento!');
end;

procedure TViewPrincipal.Cidades1Click(Sender: TObject);
begin
  ViewCidadesBuscar:= TViewCidadesBuscar.Create(nil);
  try
    ViewCidadesBuscar.ShowModal;
  finally
    FreeAndNil(ViewCidadesBuscar);
  end;
end;


procedure TViewPrincipal.Pessoas1Click(Sender: TObject);
begin
  ViewPessoasBuscar:= TViewPessoasBuscar.Create(nil);
  try
    ViewPessoasBuscar.ShowModal;
  finally
    FreeAndNil(ViewPessoasBuscar);
  end;
end;

procedure TViewPrincipal.Subgruposdeprodutos1Click(Sender: TObject);
begin
    ViewSubGruposBuscar:= TViewSubGruposBuscar.Create(nil);
  try
    ViewSubGruposBuscar.ShowModal;
  finally
    FreeAndNil(ViewSubGruposBuscar);
  end;
end;


procedure TViewPrincipal.Produtos1Click(Sender: TObject);
begin
    ViewProdutosBuscar:= TViewProdutosBuscar.Create(nil);
  try
    ViewProdutosBuscar.ShowModal;
  finally
    FreeAndNil(ViewProdutosBuscar);
  end;
end;

procedure TViewPrincipal.Vendas1Click(Sender: TObject);
begin
    ViewVendas:= TViewVendas.Create(nil);
  try
    ViewVendas.ShowModal;
  finally
    FreeAndNil(ViewVendas);
  end;
end;

procedure TViewPrincipal.ContasaReceber1Click(Sender: TObject);
begin
  ViewContasReceberBuscar:= TViewContasReceberBuscar.Create(nil);
  try
    ViewContasReceberBuscar.ShowModal;
  finally
    FreeAndNil(ViewContasReceberBuscar);
  end;
end;

end.
