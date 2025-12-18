inherited ViewSubGruposBuscar: TViewSubGruposBuscar
  Caption = 'Subgrupos Buscar'
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pntopo: TPanel
    inherited EditBuscar: TEdit
      Left = -1
      Width = 734
      ExplicitLeft = -1
      ExplicitWidth = 734
    end
  end
  inherited Pnrodape: TPanel
    inherited RdGroupFiltros: TRadioGroup
      Columns = 3
      ItemIndex = 1
      Items.Strings = (
        'C'#243'digo(F1)'
        'Nome (F2)')
    end
  end
  inherited PnGrid: TPanel
    inherited DBGrid1: TDBGrid
      PopupMenu = PopupMenu1
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Nome'
          Visible = True
        end>
    end
    inherited PnTotal: TPanel
      inherited LbTotal: TLabel
        Height = 19
      end
    end
  end
  inherited MyDataSource1: TMyDataSource
    DataSet = ModelSubGruposDM.QSubgruposBusca
    Left = 32
    Top = 104
  end
  inherited PopupMenu1: TPopupMenu
    Left = 128
    Top = 96
  end
end
