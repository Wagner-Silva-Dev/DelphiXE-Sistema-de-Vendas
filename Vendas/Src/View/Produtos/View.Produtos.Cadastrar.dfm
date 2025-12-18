inherited ViewProdutosCadastrar: TViewProdutosCadastrar
  Caption = 'Cadastro de Produtos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnDados: TPanel
    ExplicitTop = -5
    object Label1: TLabel
      Left = 24
      Top = 8
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 164
      Top = 8
      Width = 27
      Height = 13
      Caption = 'Nome'
      FocusControl = DBEdit2
    end
    object Label3: TLabel
      Left = 439
      Top = 8
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
      FocusControl = DBEdit3
    end
    object DBEdit1: TDBEdit
      Left = 24
      Top = 24
      Width = 134
      Height = 21
      DataField = 'ID'
      DataSource = DataSource1
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 164
      Top = 24
      Width = 269
      Height = 21
      DataField = 'nome'
      DataSource = DataSource1
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 439
      Top = 24
      Width = 322
      Height = 21
      DataField = 'Descricao'
      DataSource = DataSource1
      TabOrder = 2
    end
  end
  inherited MyDataSource1: TMyDataSource
    Left = 0
    Top = 328
  end
  object DataSource1: TDataSource
    DataSet = ModelProdutosDM.QProdutosCadastro
    Left = 88
    Top = 312
  end
end
