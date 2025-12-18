object ModelCidadesDM: TModelCidadesDM
  OldCreateOrder = False
  Height = 172
  Width = 272
  object QCidadesCadastro: TMyQuery
    Connection = ModelConexaoDM.MyConnection1
    SQL.Strings = (
      'SELECT * FROM unidade_federal uf')
    BeforePost = QCidadesCadastroBeforePost
    Left = 88
    Top = 32
    object C: TShortintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'cod_uf'
      ProviderFlags = [pfInWhere]
    end
    object QCidadesCadastrouf: TStringField
      DisplayLabel = 'UF'
      FieldName = 'uf'
      FixedChar = True
      Size = 2
    end
    object QCidadesCadastronome_uf: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome_uf'
      Size = 50
    end
  end
  object QCidadesBusca: TMyQuery
    Connection = ModelConexaoDM.MyConnection1
    SQL.Strings = (
      'SELECT * FROM unidade_federal uf')
    Left = 192
    Top = 32
    object QCidadesBuscacod_uf: TShortintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'cod_uf'
      ProviderFlags = [pfInWhere]
    end
    object QCidadesBuscauf: TStringField
      DisplayLabel = 'UF'
      FieldName = 'uf'
      FixedChar = True
      Size = 2
    end
    object QCidadesBuscanome_uf: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome_uf'
      Size = 50
    end
  end
  object QLookup: TMyQuery
    Connection = ModelConexaoDM.MyConnection1
    SQL.Strings = (
      'SELECT uf.nome_uf, uf.uf FROM unidade_federal uf'
      'where (cod_uf = :cod_uf)')
    Left = 120
    Top = 96
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cod_uf'
        ParamType = ptInput
      end>
    object QLookupnome_uf: TStringField
      FieldName = 'nome_uf'
      Size = 50
    end
    object QLookupuf: TStringField
      FieldName = 'uf'
      FixedChar = True
      Size = 2
    end
  end
end
