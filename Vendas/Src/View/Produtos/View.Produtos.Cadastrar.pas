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
  DB,
  DBAccess,
  MyAccess,
  StdCtrls,
  Buttons,
  ExtCtrls,
  Mask,
  DBCtrls,
  pngimage,
  Menus,
  Model.Produtos.DM,
  Model.SubGrupos.DM,
  View.SubGrupos.Buscar,
  RTTI.FieldName,
  Exceptions.FieldName,
  Utils,
  JPEG;

type
  TViewProdutosCadastrar = class(TViewHerencasCadastrar)
    Label1: TLabel;
    EDTID: TDBEdit;
    DataSource1: TDataSource;
    Label2: TLabel;

    [FieldName('Nome')]
    EDTNome: TDBEdit;
    Label3: TLabel;

    EDTDescricao: TDBEdit;
    Label4: TLabel;

    [FieldName('ID_Subgrupo')]
    EDTID_Subgrupo: TDBEdit;

    EDTSubGrupo: TEdit;
    Label5: TLabel;

    [FieldName('preco_custo')]
    EDTpreco_custo: TDBEdit;
    Label6: TLabel;

    [FieldName('porcentagem')]
    EDTporcentagem: TDBEdit;
    Label7: TLabel;

    [FieldName('preco_venda')]
    EDTpreco_venda: TDBEdit;
    Label8: TLabel;

    [FieldName('unidade')]
    EDTunidade: TDBEdit;
    Label9: TLabel;

    [FieldName('codigo_barras')]
    EDTcodigo_barras: TDBEdit;

    Panel1: TPanel;
    IMGFoto: TImage;
    pMenuFoto: TPopupMenu;
    BuscarFoto1: TMenuItem;
    LimparFoto1: TMenuItem;
    DLGFotos: TOpenDialog;
    procedure EDTID_SubgrupoExit(Sender: TObject);
    procedure EDTID_SubgrupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure EDTpreco_custoExit(Sender: TObject);
    procedure EDTporcentagemExit(Sender: TObject);
    procedure EDTpreco_vendaExit(Sender: TObject);
    procedure BuscarFoto1Click(Sender: TObject);
    procedure LimparFoto1Click(Sender: TObject);
  private
    FAlterarFoto: Boolean;
    FFotoOrigemAlterar: string;
    FUltID: integer;
    procedure CalcularPrecoVenda;
    procedure CalcularPocentagem;
    procedure ProcessarImagemaoGravar;
    procedure CarregarFotoAtual;


  public
    property UltID: integer read FUltID write FUltID;
  end;

var
  ViewProdutosCadastrar: TViewProdutosCadastrar;

implementation

{$R *.dfm}


procedure TViewProdutosCadastrar.BtnGravarClick(Sender: TObject);
begin

  try
    DataSource1.DataSet.Post;
    DataSource1.DataSet.Edit;
    ProcessarImagemaoGravar;
    DataSource1.DataSet.Post;
  except
    on E: ExceptionsFieldName do
    begin
      TUtils.TratarExceptionsFieldName(Self, E);
      Exit;
    end;
  end;



  FUltID := DataSource1.DataSet.FieldByName('ID').AsInteger;

  Self.ModalResult := mrOk;
  Self.Close;

  inherited;
end;

procedure TViewProdutosCadastrar.ProcessarImagemaoGravar;
var
  LimgNome : string;
  LDestino : string;
begin
  if (IMGFoto.Picture.Graphic = nil) then
  begin
    if (Trim(ModelProdutosDM.QProdutosCadastroImagem.AsString) = '') then
      Exit;

    LDestino := TUtils.GetPastaImgProdutos + Trim(ModelProdutosDM.QProdutosCadastroImagem.AsString);
    DeleteFile(LDestino);
    ModelProdutosDM.QProdutosCadastroImagem.Clear;
  end;

  if Trim(FFotoOrigemAlterar) <> '' then
  begin
    LimgNome := Trim(ModelProdutosDM.QProdutosCadastroImagem.AsString);
    if not (LimgNome = '') then
    begin
      LDestino := TUtils.GetPastaImgProdutos + LimgNome;
      DeleteFile(LDestino);
    end;

    LimgNome := FormatDateTime('YYYYmmdd_HHnnss_zzz', Now) + ExtractFileExt(FFotoOrigemAlterar);
    LDestino := TUtils.GetPastaImgProdutos + LimgNome;


    CopyFile(PWideChar(FFotoOrigemAlterar), PWideChar(LDestino), False);
    ModelProdutosDM.QProdutosCadastroImagem.AsString := LimgNome;
  end;
end;

procedure TViewProdutosCadastrar.EDTID_SubgrupoExit(Sender: TObject);
  var
  LModelSubGruposDM: TModelSubGruposDM;
begin
  inherited;

  EDTSubGrupo.Clear;
  if(Trim(EDTID_Subgrupo.Text) = '') then
    Exit;

  LModelSubGruposDM := TModelSubGruposDM.Create(nil);

  try
    LModelSubGruposDM.LookSubGrupos(StrToIntDef(EDTID_Subgrupo.Text, 0));
    if (LModelSubGruposDM.QLookup.IsEmpty) then
    begin
      EDTID_Subgrupo.SetFocus;
      raise Exception.Create('SubGrupo não localizado');
    end;

    EDTSubGrupo.Text := LModelSubGruposDM.QLookupNome.AsString;
  finally
    LModelSubGruposDM.Free;
  end;
end;

procedure TViewProdutosCadastrar.EDTID_SubgrupoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if(Key = VK_F8) then
  begin
    ViewSubGruposBuscar := TViewSubGruposBuscar.Create(nil);

    try
      if(ViewSubGruposBuscar.ShowModal = mrOk) then
        EDTID_Subgrupo.Text := IntToStr(ViewSubGruposBuscar.IDSelecionado);
    finally
      FreeAndNil(ViewSubGruposBuscar);
    end;
  end;

end;



procedure TViewProdutosCadastrar.FormShow(Sender: TObject);
begin
  inherited;
  FAlterarFoto := False;
  FFotoOrigemAlterar := '';

  ModelProdutosDM.CadastrarGet(inherited IDRegistroAlterar);

 if Assigned(DataSource1.DataSet) then
  begin
    if DataSource1.DataSet.IsEmpty then
      DataSource1.DataSet.Append
    else
    begin
      DataSource1.DataSet.Edit;
      EDTID_SubgrupoExit(EDTID_Subgrupo);
      Self.CarregarFotoAtual;
    end;
  end;

  EDTNome.SetFocus;

end;


procedure TViewProdutosCadastrar.CarregarFotoAtual;
var
  LFilePath : string;
begin
  LFilePath := TUtils.GetPastaImgProdutos + Trim(ModelProdutosDM.QProdutosCadastroImagem.AsString);
  if (FileExists(LFilePath)) then
    IMGFoto.Picture.LoadFromFile(LFilePath);

end;

procedure TViewProdutosCadastrar.EDTpreco_custoExit(Sender: TObject);
begin
  inherited;
  Self.CalcularPrecoVenda;
end;



procedure TViewProdutosCadastrar.EDTporcentagemExit(Sender: TObject);
begin
  inherited;
  Self.CalcularPrecoVenda;
end;

procedure TViewProdutosCadastrar.CalcularPrecoVenda;
begin
  if(EDTpreco_custo.Field.AsFloat < 0) then
    EDTpreco_custo.Field.AsFloat := 0;

  if(EDTporcentagem.Field.AsFloat < 0) then
    EDTporcentagem.Field.AsFloat := 0;

  if(EDTpreco_custo.Field.AsFloat = 0) or (EDTporcentagem.Field.AsFloat = 0) then
    exit;

  EDTpreco_venda.Field.AsFloat := EDTpreco_custo.Field.AsFloat +
  ((EDTpreco_custo.Field.AsFloat * EDTporcentagem.Field.AsFloat) / 100);
end;

procedure TViewProdutosCadastrar.EDTpreco_vendaExit(Sender: TObject);
begin
  inherited;
  Self.CalcularPocentagem
end;



procedure TViewProdutosCadastrar.CalcularPocentagem;
begin
  if(EDTpreco_venda.Field.AsFloat < 0) then
    EDTpreco_venda.Field.AsFloat := 0;

  if(EDTpreco_venda.Field.AsFloat  = 0) then
  begin
    EDTporcentagem.Field.AsFloat := 0;
    exit;
  end;

  EDTporcentagem.Field.AsFloat := ((EDTpreco_venda.Field.AsFloat / EDTpreco_custo.Field.AsFloat) *100)-100;
    if(EDTporcentagem.Field.AsFloat < 0) then
    EDTporcentagem.Field.AsFloat := 0;
end;

procedure TViewProdutosCadastrar.BuscarFoto1Click(Sender: TObject);
begin
  if(not DLGFotos.Execute) then
    exit;

  IMGFoto.Picture.LoadFromFile(DLGFotos.FileName);
  FAlterarFoto := True;
  FFotoOrigemAlterar := DLGFotos.FileName;

end;

procedure TViewProdutosCadastrar.LimparFoto1Click(Sender: TObject);
begin
  IMGFoto.Picture := nil;
  FAlterarFoto := True;
  FFotoOrigemAlterar := '';
end;

end.
