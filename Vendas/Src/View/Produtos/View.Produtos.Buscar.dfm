inherited ViewProdutosBuscar: TViewProdutosBuscar
  Caption = 'Produtos Buscar'
  ClientHeight = 492
  ClientWidth = 780
  PopupMenu = PopupMenu1
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  ExplicitWidth = 796
  ExplicitHeight = 531
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pntopo: TPanel
    Width = 780
    ExplicitWidth = 780
    inherited Label1: TLabel
      Width = 776
    end
    inherited EditBuscar: TEdit
      Width = 622
      ExplicitWidth = 622
    end
  end
  inherited Pnrodape: TPanel
    Top = 442
    Width = 780
    ExplicitTop = 442
    ExplicitWidth = 780
    inherited RdGroupFiltros: TRadioGroup
      Width = 374
      Columns = 2
      ItemIndex = 1
      Items.Strings = (
        'C'#243'digo(F1)'
        'Nome(F2)'
        'C'#243'digo de Barras(F3)'
        'SubGrupo(F4)')
      ExplicitWidth = 374
    end
    inherited BtnCadastrar: TBitBtn
      Left = 375
      ExplicitLeft = 375
    end
    inherited BtnUtilizar: TBitBtn
      Left = 577
      ExplicitLeft = 577
    end
    inherited BtnFechar: TBitBtn
      Left = 678
      ExplicitLeft = 678
    end
    inherited BtnAlterar: TBitBtn
      Left = 476
      ExplicitLeft = 476
    end
  end
  inherited PnGrid: TPanel
    Width = 780
    Height = 383
    ExplicitWidth = 780
    ExplicitHeight = 383
    inherited DBGrid1: TDBGrid
      Width = 780
      Height = 362
      PopupMenu = PopupMenu1
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Width = 45
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nome'
          Width = 275
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'preco_custo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'porcentagem'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'preco_venda'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'unidade'
          Width = 53
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'codigo_barras'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SubGrupoNOME'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_Subgrupo'
          Visible = True
        end>
    end
    inherited PnTotal: TPanel
      Top = 362
      Width = 780
      ExplicitTop = 362
      ExplicitWidth = 780
      inherited LbTotal: TLabel
        Left = 624
        ExplicitLeft = 624
      end
    end
  end
  inherited MyDataSource1: TMyDataSource
    DataSet = ModelProdutosDM.QProdutosBusca
    Left = 44
    Top = 112
  end
  inherited PopupMenu1: TPopupMenu
    Left = 136
    Top = 112
  end
end
