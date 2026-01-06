object ModelVendasDM: TModelVendasDM
  OldCreateOrder = False
  Height = 170
  Width = 274
  object QVendasCadastro: TMyQuery
    Connection = ModelConexaoDM.MyConnection1
    SQL.Strings = (
      'SELECT * FROM vendas v'
      '  WHERE v.ID = :IDVENDA')
    AfterInsert = QVendasCadastroAfterInsert
    Left = 40
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDVENDA'
      end>
    object QVendasCadastroID: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ID'
      ReadOnly = True
    end
    object QVendasCadastroID_Pessoa: TIntegerField
      FieldName = 'ID_Pessoa'
    end
    object QVendasCadastroDATA: TDateField
      FieldName = 'DATA'
    end
    object QVendasCadastroHora: TTimeField
      FieldName = 'Hora'
    end
    object QVendasCadastroTotal_Bruto: TFloatField
      FieldName = 'Total_Bruto'
      DisplayFormat = ',,0.00'
    end
    object QVendasCadastroTotal_Descontos: TFloatField
      FieldName = 'Total_Descontos'
      DisplayFormat = ',,0.00'
    end
    object QVendasCadastroTotal_Acrescimos: TFloatField
      FieldName = 'Total_Acrescimos'
      DisplayFormat = ',,0.00'
    end
    object QVendasCadastroTotal_Liquido: TFloatField
      FieldName = 'Total_Liquido'
      DisplayFormat = ',,0.00'
    end
  end
  object QVendasItensCadastrar: TMyQuery
    Connection = ModelConexaoDM.MyConnection1
    SQL.Strings = (
      'SELECT * FROM vendas_itens vi'
      '  WHERE vi.ID = :IDITEM')
    AfterInsert = QVendasItensCadastrarAfterInsert
    Left = 169
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDITEM'
      end>
    object QVendasItensCadastrarID: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ID'
      ReadOnly = True
    end
    object QVendasItensCadastrarID_Venda: TIntegerField
      FieldName = 'ID_Venda'
    end
    object QVendasItensCadastrarID_Produto: TIntegerField
      FieldName = 'ID_Produto'
    end
    object QVendasItensCadastrarquantidade: TFloatField
      FieldName = 'quantidade'
      DisplayFormat = ',,0.00'
    end
    object QVendasItensCadastrarvalor_unitario: TFloatField
      FieldName = 'valor_unitario'
      DisplayFormat = ',,0.00'
    end
    object QVendasItensCadastrardesconto: TFloatField
      FieldName = 'desconto'
      DisplayFormat = ',,0.00'
    end
    object QVendasItensCadastraracrescimo: TFloatField
      FieldName = 'acrescimo'
      DisplayFormat = ',,0.00'
    end
    object QVendasItensCadastrartotal_liquido: TFloatField
      FieldName = 'total_liquido'
      DisplayFormat = ',,0.00'
    end
    object QVendasItensCadastrarTotal_Bruto: TFloatField
      FieldName = 'Total_Bruto'
      DisplayFormat = ',,0.00'
    end
  end
  object QVendasItensListar: TMyQuery
    Connection = ModelConexaoDM.MyConnection1
    SQL.Strings = (
      'SELECT vi.*, '
      '  p.nome AS ProdutoNome,'
      '  p.Imagem FROM vendas_itens vi'
      '  INNER JOIN produtosof p ON (vi.ID_Produto = p.ID)'
      '  WHERE vi.ID_Venda = :IDVENDA')
    Left = 56
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDVENDA'
      end>
    object QVendasItensListarID: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID'
      Origin = 'vi.ID'
    end
    object QVendasItensListarID_Venda: TIntegerField
      FieldName = 'ID_Venda'
      Origin = 'vi.ID_Venda'
    end
    object QVendasItensListarID_Produto: TIntegerField
      FieldName = 'ID_Produto'
      Origin = 'vi.ID_Produto'
    end
    object QVendasItensListarquantidade: TFloatField
      FieldName = 'quantidade'
      Origin = 'vi.quantidade'
      DisplayFormat = ',,0.00'
    end
    object QVendasItensListarvalor_unitario: TFloatField
      FieldName = 'valor_unitario'
      Origin = 'vi.valor_unitario'
      DisplayFormat = ',,0.00'
    end
    object QVendasItensListardesconto: TFloatField
      FieldName = 'desconto'
      Origin = 'vi.desconto'
      DisplayFormat = ',,0.00'
    end
    object QVendasItensListaracrescimo: TFloatField
      FieldName = 'acrescimo'
      Origin = 'vi.acrescimo'
      DisplayFormat = ',,0.00'
    end
    object QVendasItensListartotal_liquido: TFloatField
      FieldName = 'total_liquido'
      Origin = 'vi.total_liquido'
      DisplayFormat = ',,0.00'
    end
    object QVendasItensListarProdutoNome: TStringField
      FieldName = 'ProdutoNome'
      Origin = 'p.nome'
      Size = 100
    end
    object QVendasItensListarTotal_Bruto: TFloatField
      FieldName = 'Total_Bruto'
      Origin = 'vi.Total_Bruto'
      DisplayFormat = ',,0.00'
    end
    object QVendasItensListarImagem: TStringField
      FieldName = 'Imagem'
      Origin = 'p.Imagem'
      Size = 200
    end
  end
  object QVendasTotalizar: TMyQuery
    Connection = ModelConexaoDM.MyConnection1
    SQL.Strings = (
      'SELECT SUM(vi.quantidade) AS TotalQuantidade,'
      ' SUM(vi.total_bruto) AS TotalBruto,'
      ' SUM(vi.desconto) AS TotalDesconto,'
      ' SUM(vi.acrescimo) AS TotalAcrescimo,'
      ' SUM(vi.total_liquido) AS TotalLiquido '
      'FROM vendas_itens vi'
      'WHERE (vi.ID_Venda = :ID_VENDA)')
    Left = 184
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_VENDA'
      end>
    object QVendasTotalizarTotalQuantidade: TFloatField
      FieldName = 'TotalQuantidade'
    end
    object QVendasTotalizarTotalBruto: TFloatField
      FieldName = 'TotalBruto'
    end
    object QVendasTotalizarTotalDesconto: TFloatField
      FieldName = 'TotalDesconto'
    end
    object QVendasTotalizarTotalAcrescimo: TFloatField
      FieldName = 'TotalAcrescimo'
    end
    object QVendasTotalizarTotalLiquido: TFloatField
      FieldName = 'TotalLiquido'
    end
  end
end
