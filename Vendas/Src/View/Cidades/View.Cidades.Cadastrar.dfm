inherited ViewHerencasCidadesCadastrar: TViewHerencasCidadesCadastrar
  Caption = 'Cadastro de Cidades'
  ClientHeight = 328
  ClientWidth = 692
  OnShow = FormShow
  ExplicitWidth = 708
  ExplicitHeight = 367
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnRodape: TPanel
    Top = 287
    Width = 692
    ExplicitTop = 287
    ExplicitWidth = 692
    inherited BtnCancelar: TBitBtn
      Left = 591
      ExplicitLeft = 591
    end
    inherited BtnGravar: TBitBtn
      Left = 491
      ExplicitLeft = 485
      ExplicitTop = 6
    end
  end
  inherited PnDados: TPanel
    Width = 692
    Height = 287
    ExplicitWidth = 692
    ExplicitHeight = 287
    object Label1: TLabel
      Left = 45
      Top = 71
      Width = 38
      Height = 13
      Caption = 'C'#243'digo'
      FocusControl = EdtCodigp
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 45
      Top = 164
      Width = 14
      Height = 13
      Caption = 'UF'
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
    object EdtCodigp: TDBEdit
      Left = 45
      Top = 92
      Width = 134
      Height = 21
      Color = clBtnFace
      DataField = 'cod_uf'
      DataSource = MyDataSource1
      ReadOnly = True
      TabOrder = 0
    end
    object CboxUF: TDBComboBox
      Left = 45
      Top = 183
      Width = 145
      Height = 21
      Style = csDropDownList
      Color = clBtnFace
      DataField = 'uf'
      DataSource = MyDataSource1
      Items.Strings = (
        'RO'
        'AC'
        'AM'
        'RR'
        'PA'
        'AP'
        'TO'
        'MA'
        'PI'
        'CE'
        'RN'
        'PB'
        'PE'
        'AL'
        'SE'
        'BA'
        'MG'
        'ES'
        'RJ'
        'SP'
        'PR'
        'SC'
        'RS'
        'MS'
        'MT'
        'GO'
        'DF')
      ReadOnly = True
      TabOrder = 1
    end
    object EdtNome: TDBEdit
      Left = 45
      Top = 137
      Width = 400
      Height = 21
      DataField = 'nome_uf'
      DataSource = MyDataSource1
      TabOrder = 2
    end
  end
  inherited MyDataSource1: TMyDataSource
    DataSet = ModelCidadesDM.QCidadesCadastro
    Left = 32
    Top = 8
  end
end
