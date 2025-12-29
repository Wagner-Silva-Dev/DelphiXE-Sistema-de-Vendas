inherited ViewPessoasBuscar: TViewPessoasBuscar
  Caption = 'Pessoas Buscar'
  ClientWidth = 810
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  ExplicitWidth = 826
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pntopo: TPanel
    Width = 810
    ExplicitWidth = 810
    inherited Label1: TLabel
      Width = 806
    end
    inherited EditBuscar: TEdit
      Width = 688
      ExplicitWidth = 688
    end
  end
  inherited Pnrodape: TPanel
    Width = 810
    ExplicitWidth = 810
    inherited RdGroupFiltros: TRadioGroup
      Width = 404
      Columns = 3
      ItemIndex = 1
      Items.Strings = (
        'C'#243'digo (F1)'
        'Nome / Fantasia (F2)'
        'Cidade (F3)')
      ExplicitWidth = 404
    end
    inherited BtnCadastrar: TBitBtn
      Left = 405
      ExplicitLeft = 405
      ExplicitTop = 10
    end
    inherited BtnUtilizar: TBitBtn
      Left = 607
      ExplicitLeft = 607
    end
    inherited BtnFechar: TBitBtn
      Left = 708
      ExplicitLeft = 708
    end
    inherited BtnAlterar: TBitBtn
      Left = 506
      ExplicitLeft = 506
    end
  end
  inherited PnGrid: TPanel
    Width = 810
    ExplicitWidth = 810
    inherited DBGrid1: TDBGrid
      Width = 810
      PopupMenu = PopupMenu1
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Width = 37
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nome'
          Width = 287
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'fantasia'
          Width = 237
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cliente'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'fornecedor'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cod_uf'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nome_uf'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'uf'
          Width = 30
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'endereco'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'telefone'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'celular'
          Width = 64
          Visible = True
        end>
    end
    inherited PnTotal: TPanel
      Width = 810
      ExplicitWidth = 810
      inherited LbTotal: TLabel
        Left = 654
        ExplicitLeft = 654
      end
    end
  end
  inherited MyDataSource1: TMyDataSource
    DataSet = ModelPessoasDM.QPessoasBusca
    Left = 20
    Top = 104
  end
  inherited PopupMenu1: TPopupMenu
    Left = 112
    Top = 104
  end
end
