inherited ViewContasReceberBuscar: TViewContasReceberBuscar
  Caption = 'Contas a Receber'
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pntopo: TPanel
    inherited EditBuscar: TEdit
      Width = 760
      ExplicitWidth = 760
    end
  end
  inherited Pnrodape: TPanel
    inherited RdGroupFiltros: TRadioGroup
      Columns = 2
      ItemIndex = 1
      Items.Strings = (
        'ID (F1)'
        'Nome/Fantasia (F2)'
        'Pago (F3)'
        'Pendente (F4)')
      ExplicitLeft = -2
      ExplicitTop = 6
    end
  end
  inherited PnGrid: TPanel
    inherited DBGrid1: TDBGrid
      ParentFont = False
      PopupMenu = PopupMenu1
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ID_VENDA'
          Width = 50
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ID_PESSOA'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nome'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'fantasia'
          Width = 200
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'PARCELA'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR'
          Width = 75
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DATA_EMISSAO'
          Width = 75
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DATA_VENCIMENTO'
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STATUS'
          Width = 60
          Visible = True
        end>
    end
  end
  inherited MyDataSource1: TMyDataSource
    DataSet = ModelContasReceberDM.QContasReceberBusca
    Left = 724
    Top = 320
  end
  inherited PopupMenu1: TPopupMenu
    Left = 448
    Top = 304
  end
end
