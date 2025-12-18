inherited ViewSubGruposCadastrar: TViewSubGruposCadastrar
  Caption = 'Cadastro de SubGrupos'
  ClientHeight = 211
  ClientWidth = 719
  OnShow = FormShow
  ExplicitWidth = 735
  ExplicitHeight = 250
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnRodape: TPanel
    Top = 170
    Width = 719
    ExplicitTop = 170
    ExplicitWidth = 719
    inherited BtnCancelar: TBitBtn
      Left = 618
      ExplicitLeft = 618
    end
    inherited BtnGravar: TBitBtn
      Left = 518
      ExplicitLeft = 518
      ExplicitTop = 6
    end
  end
  inherited PnDados: TPanel
    Width = 719
    Height = 170
    ExplicitWidth = 719
    ExplicitHeight = 170
    object Label1: TLabel
      Left = 45
      Top = 71
      Width = 38
      Height = 13
      Caption = 'C'#243'digo'
      FocusControl = EDTID
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 45
      Top = 119
      Width = 32
      Height = 13
      Caption = 'Nome'
      FocusControl = EdtNome
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EDTID: TDBEdit
      Left = 45
      Top = 92
      Width = 134
      Height = 21
      Color = clBtnFace
      DataField = 'ID'
      DataSource = MyDataSource1
      ReadOnly = True
      TabOrder = 0
    end
    object EdtNome: TDBEdit
      Left = 45
      Top = 137
      Width = 400
      Height = 21
      DataField = 'Nome'
      DataSource = MyDataSource1
      TabOrder = 1
    end
  end
  inherited MyDataSource1: TMyDataSource
    DataSet = ModelSubGruposDM.QSubGruposCadastro
    Left = 32
    Top = 8
  end
end
