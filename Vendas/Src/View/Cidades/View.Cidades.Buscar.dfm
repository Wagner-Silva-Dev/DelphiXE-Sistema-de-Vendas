inherited ViewCidadesBuscar: TViewCidadesBuscar
  Caption = 'Cidades Buscar'
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pntopo: TPanel
    inherited Label1: TLabel
      ExplicitLeft = -1
      ExplicitTop = -2
      ExplicitWidth = 813
      ExplicitHeight = 57
    end
    inherited EditBuscar: TEdit
      Left = -1
      Width = 726
      ExplicitLeft = -1
      ExplicitWidth = 726
    end
  end
  inherited Pnrodape: TPanel
    inherited RdGroupFiltros: TRadioGroup
      Columns = 3
      ItemIndex = 1
      Items.Strings = (
        'C'#243'digo(F1)'
        'Nome (F2)'
        'UF(F3)')
    end
  end
  inherited PnGrid: TPanel
    inherited DBGrid1: TDBGrid
      PopupMenu = PopupMenu1
      Columns = <
        item
          Expanded = False
          FieldName = 'cod_uf'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'uf'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nome_uf'
          Width = 180
          Visible = True
        end>
    end
  end
  inherited MyDataSource1: TMyDataSource
    DataSet = ModelCidadesDM.QCidadesBusca
    Left = 32
    Top = 104
  end
  inherited PopupMenu1: TPopupMenu
    Left = 128
  end
end
