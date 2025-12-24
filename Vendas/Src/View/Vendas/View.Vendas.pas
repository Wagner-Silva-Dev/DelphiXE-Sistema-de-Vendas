unit View.Vendas;

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
  StdCtrls,
  ExtCtrls,
  Mask,
  DBCtrls,
  Grids,
  DBGrids,
  pngimage,
  DB,
  DBAccess,
  MyAccess,
  Utils,
  Model.Vendas.DM,
  Model.Produtos.DM,
  Model.conexao.DM;

type
  TViewVendas = class(TForm)
    PnBackTudo: TPanel;
    lblTopo: TLabel;
    PNMsgTopo: TPanel;
    PNCorpo: TPanel;
    PNCorpoEsquerda: TPanel;
    PNCorpoDireita: TPanel;
    Label2: TLabel;
    EDTLancamento: TEdit;
    Panel1: TPanel;
    lblQuantidade: TLabel;
    EDTQuantidade: TDBEdit;
    lblValorUnitario: TLabel;
    EDTValorUnitario: TDBEdit;
    lblDesconto: TLabel;
    EDTDesconto: TDBEdit;
    lblAcrescimo: TLabel;
    EDTAcrescimo: TDBEdit;
    lblTotalLiquido: TLabel;
    EDTTotalLiquido: TDBEdit;
    Panel2: TPanel;
    Panel3: TPanel;
    IMGFoto: TImage;
    PNRodapeDireita: TPanel;
    DBGrid1: TDBGrid;
    PNRodapeEsquerda: TPanel;
    pnBackTotalVenda: TPanel;
    pnBackDadosDaVenda: TPanel;
    Panel6: TPanel;
    lblVendaNumero: TLabel;
    TDBDataVenda: TDBText;
    lblDataVenda: TLabel;
    TDBVendaNumero: TDBText;
    lblTotaldaVenda: TLabel;
    EDTTotaldaVenda: TDBEdit;
    lblNovaVenda: TLabel;
    lblFechaVenda: TLabel;
    lblCancelarVenda: TLabel;
    lblCFECHARVenda: TLabel;
    lblExcluirVenda: TLabel;
    DSVendasCadastrar: TMyDataSource;
    DSVendasItensListar: TMyDataSource;
    DSVendasItensCadastrar: TMyDataSource;
    lblHoraVenda: TLabel;
    TDBHoraVenda: TDBText;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure EDTLancamentoKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DSVendasItensListarDataChange(Sender: TObject; Field: TField);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    FVDM : TModelVendasDM;
    procedure ProcessarF2;
    procedure LimparTela;
    procedure ImagemPadrao;
    procedure ProcessarESC;
    procedure CancelarVenda;
    procedure ProcessarF3;
    procedure ProcessarEnterNoEdtLancamento;
    procedure TotalizarVenda;
    procedure ProcessarDelete;
    procedure DeletarItemSelecionado;
    procedure DeletarVendaAtual;

  public
    { Public declarations }
  end;

var
  ViewVendas: TViewVendas;

implementation

{$R *.dfm}



procedure TViewVendas.EDTLancamentoKeyPress(Sender: TObject; var Key: Char);
begin
  if(Key = #13)then
    Self.ProcessarEnterNoEdtLancamento;
end;

procedure TViewVendas.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if FVDM.QVendasCadastro.State in dsEditModes then
  begin
    if Application.MessageBox('Existe uma venda em andamento. Deseja sair sem salvar?',
      'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> IDYES
    then
      CanClose := False;
      Exit;
  end;

  if ModelConexaoDM.MyConnection1.InTransaction then
    ModelConexaoDM.MyConnection1.Rollback;

  FVDM.QVendasCadastro.Cancel;
  CanClose := True;
end;

procedure TViewVendas.FormCreate(Sender: TObject);
begin
  if(ModelVendasDM = nil) then
    ModelVendasDM := TModelVendasDM.Create(nil);
  FVDM := ModelVendasDM;

  if (ModelProdutosDM = nil) then
    ModelProdutosDM := TModelProdutosDM.Create(nil);
end;

procedure TViewVendas.FormDestroy(Sender: TObject);
begin
  FreeAndNil(ModelProdutosDM);
  FreeAndNil(ModelVendasDM);
end;

procedure TViewVendas.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case (Key) of
    VK_F2:
      Self.ProcessarF2;
    VK_F3:
      Self.ProcessarF3;
    VK_F4:
    begin
      if (ssAlt in Shift) then
        Key := 0;
    end;
    VK_ESCAPE:
      Self.ProcessarESC;
    VK_UP:
     begin
       DBGrid1.DataSource.DataSet.Prior;
       Key := 0;
     end;
     VK_DOWN:
     begin
       DBGrid1.DataSource.DataSet.Next;
       Key := 0;
     end;
     VK_DELETE:
     begin
      Self.ProcessarDelete;
     end;
  end;
end;



procedure TViewVendas.ProcessarF2;
begin
    if (FVDM.QVendasCadastro.State in dsEditModes) then
      Exit;

    if not ModelConexaoDM.MyConnection1.InTransaction then
      ModelConexaoDM.MyConnection1.StartTransaction;

    Self.LimparTela;
    FVDM.QVendasCadastro.Append;

    lblTopo.Caption := 'Inserindo produtos na venda';
    EDTLancamento.SetFocus;
end;

procedure TViewVendas.ProcessarF3;
begin
  if not(FVDM.QVendasCadastro.State in dsEditModes) then
    Exit;

  FVDM.QVendasCadastro.Post;

  if ModelConexaoDM.MyConnection1.InTransaction then
    ModelConexaoDM.MyConnection1.Commit;

  Self.LimparTela;
  EDTLancamento.SetFocus;
end;

procedure TViewVendas.ProcessarESC;
begin
  if(FVDM.QVendasCadastro.State in dsEditModes) then
    Self.CancelarVenda
  else
    Self.Close;
end;

procedure TViewVendas.ProcessarDelete;
begin
  if FVDM.QVendasCadastro.State in dsEditModes then
    Self.DeletarItemSelecionado
  else
    Self.DeletarVendaAtual;
end;

procedure TViewVendas.DeletarItemSelecionado;
begin
  if not(FVDM.QVendasCadastro.State in dsEditModes) then
    Exit;

  if FVDM.QVendasItensListar.IsEmpty then
    raise Exception.Create('Selecione um item para ser excluido');

  if(Application.MessageBox('Confirma Exclusâo do Item Selecionado?', 'Confirmação',
    MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> IDYES)
  then
    Exit;

  FVDM.QVendasItensListar.Delete;
  Self.TotalizarVenda

end;

procedure TViewVendas.DeletarVendaAtual;
begin
  ShowMessage('Deletar a Venda em Desenvolvimento!');
end;

procedure TViewVendas.ProcessarEnterNoEdtLancamento;
var
  LCodBarras: string;
  LQtd: Double;
  LDesconto: Double;
  LAcrescimo: Double;
begin
  if not(FVDM.QVendasCadastro.State in dsEditModes) then
    Exit;

  if Trim(EDTLancamento.Text) = '' then
    Exit;

  TUtils.PegarDadosLancamento(edtLancamento.Text, LCodBarras, LQtd, LDesconto, LAcrescimo);;

  if(not ModelProdutosDM.LookProdutos(LCodBarras)) then
  begin
    raise Exception.Create('Produto não encontrado');
    EDTLancamento.SetFocus;
    Exit;
  end;

  if(FVDM.QVendasCadastro.State in [dsInsert])then
  begin
    FVDM.QVendasCadastro.Post;
    FVDM.QVendasCadastro.Edit;
  end;

  FVDM.QVendasItensCadastrar.Append;
  FVDM.QVendasItensCadastrarID_Venda.AsInteger := FVDM.QVendasCadastroID.AsInteger;
  FVDM.QVendasItensCadastrarID_Produto.AsInteger := ModelProdutosDM.QLookupID.AsInteger;
  FVDM.QVendasItensCadastrarquantidade.AsFloat := LQtd;
  FVDM.QVendasItensCadastrarvalor_unitario.AsFloat := ModelProdutosDM.QLookuppreco_venda.Asfloat;
  FVDM.QVendasItensCadastrarTotal_Bruto.AsFloat :=
    FVDM.QVendasItensCadastrarquantidade.AsFloat * FVDM.QVendasItensCadastrarvalor_unitario.AsFloat;
  FVDM.QVendasItensCadastrardesconto.AsFloat := LDesconto;
  FVDM.QVendasItensCadastraracrescimo.asfloat := LAcrescimo;
  FVDM.QVendasItensCadastrartotal_liquido.AsFloat := FVDM.QVendasItensCadastrarTotal_Bruto.AsFloat -
    FVDM.QVendasItensCadastrardesconto.AsFloat + FVDM.QVendasItensCadastraracrescimo.asfloat;
  FVDM.QVendasItensCadastrar.Post;

  FVDM.VendasItensListar(FVDM.QVendasCadastroID.AsInteger, FVDM.QVendasItensCadastrarID.AsInteger);

  Self.TotalizarVenda;

  EDTLancamento.Clear;
  EDTLancamento.SetFocus;
end;

procedure TViewVendas.TotalizarVenda;
begin
  if not(FVDM.QVendasCadastro.State in dsEditModes) then
    Exit;

  FVDM.VendaTotalizar(FVDM.QVendasCadastroID.AsInteger);
  FVDM.QVendasCadastroTotal_Bruto.AsFloat := FVDM.QVendasTotalizarTotalBruto.AsFloat;
  FVDM.QVendasCadastroTotal_Descontos.AsFloat := FVDM.QVendasTotalizarTotalDesconto.AsFloat;
  FVDM.QVendasCadastroTotal_Acrescimos.AsFloat := FVDM.QVendasTotalizarTotalAcrescimo.AsFloat;
  FVDM.QVendasCadastroTotal_Liquido.AsFloat := FVDM.QVendasTotalizarTotalLiquido.AsFloat;
//  FVDM.QVendasCadastro.Post;
//  FVDM.QVendasCadastro.Edit;
end;

procedure TViewVendas.LimparTela;
begin
  FVDM.VendasGet;
  FVDM.VendasItensGet;
  FVDM.VendasItensListar;
  Self.ImagemPadrao;
  lblTopo.Caption := 'Tecle F2 para iniciar uma nova venda';
end;

procedure TViewVendas.ImagemPadrao;
begin
  IMGFoto.Picture.LoadFromFile(TUtils.GetPastaImg + 'Add-Imagem.png');
end;


procedure TViewVendas.CancelarVenda;
begin
  if(Application.MessageBox('Confirma Cancelamento desta Venda?', 'Confirmação',
    MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> IDYES)
  then
    Exit;

  if ModelConexaoDM.MyConnection1.InTransaction then
    ModelConexaoDM.MyConnection1.Rollback;
  FVDM.QVendasCadastro.Cancel;
  Self.LimparTela;
end;

procedure TViewVendas.DSVendasItensListarDataChange(Sender: TObject;
  Field: TField);


var
  LFIleImg : string;
begin
  if (FVDM.QVendasItensListar.IsEmpty) then
    Exit;

  if (FVDM.QVendasItensListarID.AsInteger <= 0) then
    Exit;

  if Trim(FVDM.QVendasItensListarImagem.AsString) = '' then
   begin
     Self.ImagemPadrao;
     Exit;
   end;

  LFIleImg := TUtils.GetPastaImgProdutos + Trim(FVDM.QVendasItensListarImagem.AsString);

  if (not FileExists(LFIleImg)) then
  begin
    Self.ImagemPadrao;
    Exit;
  end;

  IMGFoto.Picture.LoadFromFile(LFIleImg);
end;

procedure TViewVendas.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if(not Odd(DBGrid1.DataSource.DataSet.RecNo))then
    DBGrid1.Canvas.Brush.Color := $00D6D6D6;

  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
