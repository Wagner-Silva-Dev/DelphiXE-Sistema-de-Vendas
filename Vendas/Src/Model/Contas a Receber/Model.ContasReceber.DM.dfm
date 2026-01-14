object ModelContasReceberDM: TModelContasReceberDM
  OldCreateOrder = False
  Height = 87
  Width = 287
  object QContasReceberCadastro: TMyQuery
    Connection = ModelConexaoDM.MyConnection1
    SQL.Strings = (
      'SELECT * FROM contas_receber cr')
    Left = 48
    Top = 8
  end
  object QContasReceberBusca: TMyQuery
    Connection = ModelConexaoDM.MyConnection1
    SQL.Strings = (
      'SELECT cr.ID_VENDA,'
      '       cr.ID_PESSOA,'
      '       p.nome,'
      '       p.fantasia,'
      '       cr.PARCELA,'
      '       cr.VALOR,'
      '       cr.DATA_EMISSAO,'
      '       cr.DATA_VENCIMENTO,'
      '       cr.STATUS FROM contas_receber cr'
      '  JOIN pessoas p ON cr.ID_PESSOA = p.ID'
      '  JOIN vendas v ON cr.ID_VENDA = v.ID;')
    Left = 176
    Top = 24
    object QContasReceberBuscaID_VENDA: TIntegerField
      DisplayLabel = 'Venda'
      FieldName = 'ID_VENDA'
    end
    object QContasReceberBuscaID_PESSOA: TIntegerField
      DisplayLabel = 'C'#243'd.Cliente'
      FieldName = 'ID_PESSOA'
    end
    object QContasReceberBuscanome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 60
    end
    object QContasReceberBuscafantasia: TStringField
      DisplayLabel = 'Fantasia'
      FieldName = 'fantasia'
      Size = 60
    end
    object QContasReceberBuscaPARCELA: TIntegerField
      DisplayLabel = 'Parcela'
      FieldName = 'PARCELA'
    end
    object QContasReceberBuscaVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
    end
    object QContasReceberBuscaDATA_EMISSAO: TDateField
      DisplayLabel = 'Emiss'#227'o'
      FieldName = 'DATA_EMISSAO'
    end
    object QContasReceberBuscaDATA_VENCIMENTO: TDateField
      DisplayLabel = 'Vencimento'
      FieldName = 'DATA_VENCIMENTO'
    end
    object QContasReceberBuscaSTATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      FixedChar = True
      Size = 1
    end
  end
end
