object ModelProdutosDM: TModelProdutosDM
  OldCreateOrder = False
  Height = 171
  Width = 242
  object QProdutosCadastro: TMyQuery
    Connection = ModelConexaoDM.MyConnection1
    SQL.Strings = (
      'SELECT * FROM produtosof p')
    Left = 48
    Top = 32
    object QProdutosCadastroID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
    end
    object QProdutosCadastroID_Subgrupo: TIntegerField
      DisplayLabel = 'C'#243'd.SubGrupo'
      FieldName = 'ID_Subgrupo'
    end
    object QProdutosCadastronome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 100
    end
    object QProdutosCadastropreco_custo: TFloatField
      DisplayLabel = 'Pre'#231'o de Custo'
      FieldName = 'preco_custo'
      EditFormat = ',,0.00'
    end
    object QProdutosCadastroporcentagem: TFloatField
      DisplayLabel = 'Porcentagem'
      FieldName = 'porcentagem'
      EditFormat = ',,0.00'
    end
    object QProdutosCadastropreco_venda: TFloatField
      DisplayLabel = 'Pre'#231'o de Venda'
      FieldName = 'preco_venda'
      EditFormat = ',,0.00'
    end
    object QProdutosCadastrounidade: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'unidade'
    end
    object QProdutosCadastrocodigo_barras: TStringField
      DisplayLabel = 'C'#243'digo de Barras'
      FieldName = 'codigo_barras'
    end
    object QProdutosCadastroDescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'Descricao'
      Size = 150
    end
    object QProdutosCadastroImagem: TStringField
      FieldName = 'Imagem'
      Size = 200
    end
  end
  object QProdutosBusca: TMyQuery
    Connection = ModelConexaoDM.MyConnection1
    SQL.Strings = (
      'SELECT p.ID, p.nome, '
      
        'p.preco_custo, p.porcentagem, p.preco_venda,p.unidade, p.codigo_' +
        'barras,'
      '  p.ID_Subgrupo, '
      '  s.Nome AS '#39'SubGrupoNOME'#39' FROM produtosof p'
      '  JOIN subgrupos s ON (s.ID = p.ID_Subgrupo)')
    Left = 152
    Top = 32
    object QProdutosBuscaID: TIntegerField
      AutoGenerateValue = arAutoInc
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
      Origin = 'p.ID'
    end
    object QProdutosBuscanome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Origin = 'p.nome'
      Size = 100
    end
    object QProdutosBuscapreco_custo: TFloatField
      DisplayLabel = 'Pre'#231'o de Custo'
      FieldName = 'preco_custo'
      Origin = 'p.preco_custo'
      DisplayFormat = ',,0.00'
    end
    object QProdutosBuscaporcentagem: TFloatField
      DisplayLabel = 'Porcentagem'
      FieldName = 'porcentagem'
      Origin = 'p.porcentagem'
      DisplayFormat = ',,0.00'
    end
    object QProdutosBuscapreco_venda: TFloatField
      DisplayLabel = 'Pre'#231'o de Venda'
      FieldName = 'preco_venda'
      Origin = 'p.preco_venda'
      DisplayFormat = ',,0.00'
    end
    object QProdutosBuscaunidade: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'unidade'
      Origin = 'p.unidade'
    end
    object QProdutosBuscacodigo_barras: TStringField
      DisplayLabel = 'C'#243'digo de Barras'
      FieldName = 'codigo_barras'
      Origin = 'p.codigo_barras'
    end
    object QProdutosBuscaSubGrupoNOME: TStringField
      DisplayLabel = 'SubGrupo'
      FieldName = 'SubGrupoNOME'
      Origin = 's.Nome'
      Size = 50
    end
    object QProdutosBuscaID_Subgrupo: TIntegerField
      DisplayLabel = 'C'#243'd_SubGrupo'
      FieldName = 'ID_Subgrupo'
      Origin = 'p.ID_Subgrupo'
    end
  end
  object QLookup: TMyQuery
    Connection = ModelConexaoDM.MyConnection1
    SQL.Strings = (
      'SELECT p.Nome FROM produtosof p'
      'where (p.ID = :IDProdutos)')
    Left = 104
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDProdutos'
      end>
    object QLookupNome: TStringField
      FieldName = 'Nome'
      Size = 100
    end
  end
end
