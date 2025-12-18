unit Model.SubGrupos.DM;

interface

uses
  SysUtils,
  Classes,
  DB,
  DBAccess,
  MyAccess,
  MemDS,
  Model.conexao.DM,
  Exceptions.FieldName;

type
  TModelSubGruposDM = class(TDataModule)
    QSubGruposCadastro: TMyQuery;
    QSubgruposBusca: TMyQuery;
    QLookup: TMyQuery;
    QLookupnome_uf: TStringField;
    QLookupuf: TStringField;
    QSubgruposBuscaID: TIntegerField;
    QSubgruposBuscaNome: TStringField;
    QSubGruposCadastroID: TIntegerField;
    QSubGruposCadastroNome: TStringField;
    procedure QSubGruposCadastroBeforePost(DataSet: TDataSet);

  private

  public
    procedure SubGruposBuscar(const ACondicao: string);
    procedure CadastrarGet(const AIdSubGrupos: Integer);
    procedure ValidarDadosQCadastro;
    procedure LookSubGrupos(const AIdSubGrupos: Integer);
  end;

var
  ModelSubGruposDM: TModelSubGruposDM;

implementation

{$R *.dfm}

{ TModelSubGruposDM }

procedure TModelSubGruposDM.CadastrarGet(const AIdSubGrupos: Integer);
begin
  QSubGruposCadastro.Close;
  QSubGruposCadastro.SQL.Clear;
  QSubGruposCadastro.SQL.ADD('SELECT * FROM SubGrupos');
  QSubGruposCadastro.SQL.ADD('where ID = :IDSubGrupos');
  QSubGruposCadastro.ParamByName('IDSubGrupos').AsInteger := AIdSubGrupos;
  QSubGruposCadastro.Open;
end;

procedure TModelSubGruposDM.SubGruposBuscar(const ACondicao: string);
begin
  QSubGruposBusca.Close;
  QSubGruposBusca.SQL.Clear;
  QSubGruposBusca.SQL.ADD('SELECT * FROM SubGrupos');
  QSubGruposBusca.SQL.ADD(ACondicao);
  QSubGruposBusca.Open;
end;

procedure TModelSubGruposDM.LookSubGrupos(const AIdSubGrupos: Integer);
begin
  QLookup.Close;
  QLookup.ParamByName('IDSubGrupos').AsInteger := AIdSubGrupos;
  QLookup.Open;
end;

procedure TModelSubGruposDM.QSubGruposCadastroBeforePost(DataSet: TDataSet);
begin
  Self.ValidarDadosQCadastro;
end;

procedure TModelSubGruposDM.ValidarDadosQCadastro;
begin
  if Trim(QSubgruposBuscaNome.AsString) = '' then
    raise ExceptionsFieldName.Create('Preencha o campo nome' , 'NOME');
end;

end.
