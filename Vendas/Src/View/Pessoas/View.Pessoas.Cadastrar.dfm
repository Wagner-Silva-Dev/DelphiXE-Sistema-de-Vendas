inherited ViewPessoasCadastrar: TViewPessoasCadastrar
  Caption = 'Cadastro de Pessoas'
  ClientWidth = 884
  OnShow = FormShow
  ExplicitWidth = 900
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnRodape: TPanel
    Width = 884
    ExplicitWidth = 884
    inherited BtnCancelar: TBitBtn
      Left = 783
      ExplicitLeft = 783
      ExplicitTop = 1
    end
    inherited BtnGravar: TBitBtn
      Left = 683
      ExplicitLeft = 683
    end
  end
  inherited PnDados: TPanel
    Width = 884
    ExplicitWidth = 884
    object Label1: TLabel
      Left = 22
      Top = 4
      Width = 38
      Height = 13
      Caption = 'C'#243'digo'
      FocusControl = DBEdit1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 82
      Top = 4
      Width = 73
      Height = 13
      Caption = 'Nome/Raz'#227'o'
      FocusControl = EDTNome
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 463
      Top = 4
      Width = 48
      Height = 13
      Caption = 'Fantasia'
      FocusControl = EDTFantasia
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 17
      Top = 71
      Width = 19
      Height = 13
      Caption = 'CEP'
      FocusControl = EDTcep
    end
    object Label5: TLabel
      Left = 97
      Top = 71
      Width = 105
      Height = 13
      Caption = 'C'#243'digo Cidade [F8]'
      FocusControl = EDTcod_uf
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 459
      Top = 71
      Width = 45
      Height = 13
      Caption = 'Endere'#231'o'
      FocusControl = EDTendereco
    end
    object Label7: TLabel
      Left = 765
      Top = 71
      Width = 37
      Height = 13
      Caption = 'N'#250'mero'
      FocusControl = EDTnumero
    end
    object Label8: TLabel
      Left = 17
      Top = 114
      Width = 28
      Height = 13
      Caption = 'Bairro'
      FocusControl = EDTbairro
    end
    object Label9: TLabel
      Left = 463
      Top = 114
      Width = 65
      Height = 13
      Caption = 'Complemento'
      FocusControl = EDTcomplemento
    end
    object Label10: TLabel
      Left = 765
      Top = 114
      Width = 55
      Height = 13
      Caption = 'Nascimento'
      FocusControl = EDTnascimento
    end
    object Label11: TLabel
      Left = 16
      Top = 162
      Width = 42
      Height = 13
      Caption = 'Telefone'
      FocusControl = EDTtelefone
    end
    object Label12: TLabel
      Left = 242
      Top = 162
      Width = 33
      Height = 13
      Caption = 'Celular'
      FocusControl = EDTcelular
    end
    object Label13: TLabel
      Left = 463
      Top = 162
      Width = 28
      Height = 13
      Caption = 'E-mail'
      FocusControl = EDTemail
    end
    object Label14: TLabel
      Left = 238
      Top = 200
      Width = 19
      Height = 13
      Caption = 'CPF'
      FocusControl = EDTCPF
    end
    object Label15: TLabel
      Left = 396
      Top = 200
      Width = 14
      Height = 13
      Caption = 'RG'
      FocusControl = EDTRG
    end
    object Label16: TLabel
      Left = 550
      Top = 200
      Width = 25
      Height = 13
      Caption = 'CNPJ'
      FocusControl = EDTCNPJ
    end
    object Label17: TLabel
      Left = 715
      Top = 200
      Width = 65
      Height = 13
      Caption = 'Insc.Estadual'
      FocusControl = EDTInsc_Estadual
    end
    object Label18: TLabel
      Left = 17
      Top = 241
      Width = 44
      Height = 13
      Caption = 'Cadastro'
      FocusControl = EDTdh_cadastro
    end
    object DBEdit1: TDBEdit
      Left = 16
      Top = 19
      Width = 60
      Height = 21
      Color = clBtnFace
      DataField = 'ID'
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 0
    end
    object EDTNome: TDBEdit
      Left = 82
      Top = 19
      Width = 371
      Height = 21
      DataField = 'nome'
      DataSource = DataSource1
      TabOrder = 1
    end
    object EDTFantasia: TDBEdit
      Left = 459
      Top = 19
      Width = 406
      Height = 21
      DataField = 'fantasia'
      DataSource = DataSource1
      TabOrder = 2
    end
    object DBCHFouC: TDBCheckBox
      Left = 16
      Top = 48
      Width = 43
      Height = 17
      Caption = 'Ativo'
      DataField = 'ativo'
      DataSource = DataSource1
      TabOrder = 3
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object DBCHCliente: TDBCheckBox
      Left = 65
      Top = 48
      Width = 64
      Height = 17
      Caption = 'Cliente'
      DataField = 'cliente'
      DataSource = DataSource1
      TabOrder = 4
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object EDTcep: TDBEdit
      Left = 16
      Top = 87
      Width = 75
      Height = 21
      DataField = 'cep'
      DataSource = DataSource1
      TabOrder = 5
    end
    object EDTcod_uf: TDBEdit
      Left = 97
      Top = 87
      Width = 80
      Height = 21
      DataField = 'cod_uf'
      DataSource = DataSource1
      TabOrder = 6
      OnExit = EDTcod_ufExit
      OnKeyDown = EDTcod_ufKeyDown
    end
    object EDTCidade: TEdit
      Left = 183
      Top = 87
      Width = 270
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 7
    end
    object EDTendereco: TDBEdit
      Left = 459
      Top = 87
      Width = 300
      Height = 21
      DataField = 'endereco'
      DataSource = DataSource1
      TabOrder = 8
    end
    object EDTnumero: TDBEdit
      Left = 765
      Top = 87
      Width = 100
      Height = 21
      DataField = 'numero'
      DataSource = DataSource1
      TabOrder = 9
    end
    object EDTbairro: TDBEdit
      Left = 16
      Top = 128
      Width = 437
      Height = 21
      DataField = 'bairro'
      DataSource = DataSource1
      TabOrder = 10
    end
    object EDTcomplemento: TDBEdit
      Left = 459
      Top = 128
      Width = 300
      Height = 21
      DataField = 'complemento'
      DataSource = DataSource1
      TabOrder = 11
    end
    object EDTnascimento: TDBEdit
      Left = 765
      Top = 128
      Width = 100
      Height = 21
      DataField = 'nascimento'
      DataSource = DataSource1
      TabOrder = 12
    end
    object EDTtelefone: TDBEdit
      Left = 16
      Top = 173
      Width = 216
      Height = 21
      DataField = 'telefone'
      DataSource = DataSource1
      TabOrder = 13
    end
    object EDTcelular: TDBEdit
      Left = 242
      Top = 173
      Width = 215
      Height = 21
      DataField = 'celular'
      DataSource = DataSource1
      TabOrder = 14
    end
    object EDTemail: TDBEdit
      Left = 463
      Top = 173
      Width = 402
      Height = 21
      DataField = 'email'
      DataSource = DataSource1
      TabOrder = 15
    end
    object TDBRFouJ: TDBRadioGroup
      Left = 16
      Top = 200
      Width = 216
      Height = 36
      Caption = ' Tipo jur'#237'dico'
      Columns = 2
      DataField = 'tipo_juridico'
      DataSource = DataSource1
      Items.Strings = (
        'Pessoa Fisica'
        'Pessoa Jur'#237'dica')
      ParentBackground = True
      TabOrder = 16
      Values.Strings = (
        '1'
        '2')
      OnClick = TDBRFouJClick
    end
    object EDTCPF: TDBEdit
      Left = 238
      Top = 215
      Width = 150
      Height = 21
      DataField = 'CPF'
      DataSource = DataSource1
      TabOrder = 17
    end
    object EDTRG: TDBEdit
      Left = 394
      Top = 215
      Width = 150
      Height = 21
      DataField = 'RG'
      DataSource = DataSource1
      TabOrder = 18
    end
    object EDTCNPJ: TDBEdit
      Left = 550
      Top = 215
      Width = 159
      Height = 21
      DataField = 'CNPJ'
      DataSource = DataSource1
      TabOrder = 19
    end
    object EDTInsc_Estadual: TDBEdit
      Left = 715
      Top = 215
      Width = 150
      Height = 21
      DataField = 'Insc_Estadual'
      DataSource = DataSource1
      TabOrder = 20
    end
    object EDTdh_cadastro: TDBEdit
      Left = 16
      Top = 256
      Width = 216
      Height = 21
      Color = clBtnFace
      DataField = 'dh_cadastro'
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 21
    end
    object DBCHForncedor: TDBCheckBox
      Left = 118
      Top = 48
      Width = 75
      Height = 17
      Caption = 'Forncedor'
      DataField = 'fornecedor'
      DataSource = DataSource1
      TabOrder = 22
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
  end
  inherited MyDataSource1: TMyDataSource
    DataSet = ModelPessoasDM.QPessoasCadastro
    Top = 328
  end
  object DataSource1: TDataSource
    DataSet = ModelPessoasDM.QPessoasCadastro
    Left = 288
    Top = 272
  end
end
