unit View.Pessoas.Cadastrar;

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
  Model.Pessoas.DM,
  Mask, DBCtrls,
  RTTI.FieldName,
  Exceptions.FieldName,
  Utils,
  View.Cidades.Buscar;

type
  TViewPessoasCadastrar = class(TViewHerencasCadastrar)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DBEdit1: TDBEdit;

    [FieldName('NOME')]
    EDTNome: TDBEdit;

    [FieldName('FANTASIA')]
    EDTFantasia: TDBEdit;

    DBCHFouC: TDBCheckBox;
    DBCHCliente: TDBCheckBox;
    EDTcep: TDBEdit;

    [FieldName('cod_uf')]
    EDTcod_uf: TDBEdit;

    EDTCidade: TEdit;
    EDTendereco: TDBEdit;
    EDTnumero: TDBEdit;
    EDTbairro: TDBEdit;
    EDTcomplemento: TDBEdit;
    EDTnascimento: TDBEdit;
    Label11: TLabel;
    EDTtelefone: TDBEdit;
    Label12: TLabel;
    EDTcelular: TDBEdit;
    Label13: TLabel;
    EDTemail: TDBEdit;
    TDBRFouJ: TDBRadioGroup;
    Label14: TLabel;
    EDTCPF: TDBEdit;
    Label15: TLabel;
    EDTRG: TDBEdit;
    Label16: TLabel;
    EDTCNPJ: TDBEdit;
    Label17: TLabel;
    EDTInsc_Estadual: TDBEdit;
    Label18: TLabel;
    EDTdh_cadastro: TDBEdit;
    DataSource1: TDataSource;
    DBCHForncedor: TDBCheckBox;
    procedure FormShow(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure EDTcod_ufKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EDTcod_ufExit(Sender: TObject);
    procedure TDBRFouJClick(Sender: TObject);

  private
    FUltID: integer;
    FIDSelecionado: Integer;
    procedure ConfigurarTipoJuridico;
  public
    property UltID: integer read FUltID write FUltID;
    property IDSelecionado: Integer read FIDSelecionado write FIDSelecionado;
  end;

    var
  ViewPessoasCadastrar: TViewPessoasCadastrar;

implementation

uses
  Model.Cidades.DM;

{$R *.dfm}

procedure TViewPessoasCadastrar.EDTcod_ufExit(Sender: TObject);
var
  LModelCidadesDM: TModelCidadesDM;
begin
  inherited;

  EDTCidade.Clear;
  if(Trim(EDTcod_uf.Text) = '') then
    Exit;

  LModelCidadesDM := TModelCidadesDM.Create(nil);

  try
    LModelCidadesDM.LookCidade(StrToIntDef(EDTcod_uf.Text, 0));
    if (LModelCidadesDM.QLookup.IsEmpty) then
    begin
      EDTcod_uf.SetFocus;
      raise Exception.Create('Cidade não localizada');
    end;

    EDTCidade.Text := LModelCidadesDM.QLookupnome_uf.AsString + ' / ' +
                      LModelCidadesDM.QLookupuf.AsString;
  finally
    LModelCidadesDM.Free;
  end;
end;

procedure TViewPessoasCadastrar.EDTcod_ufKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if(Key = VK_F8) then
  begin
    ViewCidadesBuscar := TViewCidadesBuscar.Create(nil);

    try
      if(ViewCidadesBuscar.ShowModal = mrOk) then
        EDTcod_uf.Text := IntToStr(ViewCidadesBuscar.IDSelecionado);
    finally
      FreeAndNil(ViewCidadesBuscar);
    end;
  end;
end;

procedure TViewPessoasCadastrar.FormShow(Sender: TObject);
begin

  inherited;

  ModelPessoasDM.CadastrarGet(inherited IDRegistroAlterar);

 if Assigned(DataSource1.DataSet) then
  begin
    if DataSource1.DataSet.IsEmpty then
      DataSource1.DataSet.Append
    else
    begin
      DataSource1.DataSet.Edit;
      EDTcod_ufExit(EDTcod_uf);
    end;
  end;

  Self.ConfigurarTipoJuridico;

  EDTNome.SetFocus;
end;

procedure TViewPessoasCadastrar.TDBRFouJClick(Sender: TObject);
begin
  inherited;
  Self.ConfigurarTipoJuridico;
end;

procedure TViewPessoasCadastrar.BtnGravarClick(Sender: TObject);
begin

  try
    DataSource1.DataSet.Post;
  except
    on E: ExceptionsFieldName do
      TUtils.TratarExceptionsFieldName(Self, E);
  end;

  FUltID := MyDataSource1.DataSet.FieldByName('cod_uf').AsInteger;
  self.close;
  Self.ModalResult := mrOk;
  inherited;
end;

procedure TViewPessoasCadastrar.ConfigurarTipoJuridico;
begin
  EDTCPF.Enabled := True;
  EDTRG.Enabled := True;
  EDTCNPJ.Enabled := True;
  EDTInsc_Estadual.Enabled := True;

  if (TDBRFouJ.ItemIndex = 0) then
  begin
    EDTCNPJ.Enabled := False;
  end
  else
  begin
    EDTCPF.Enabled := False;
    EDTRG.Enabled := False;
  end;
end;

end.

