object ModelSubGruposDM: TModelSubGruposDM
  OldCreateOrder = False
  Height = 172
  Width = 272
  object QSubGruposCadastro: TMyQuery
    Connection = ModelConexaoDM.MyConnection1
    SQL.Strings = (
      'SELECT * FROM subgrupos')
    BeforePost = QSubGruposCadastroBeforePost
    Left = 56
    Top = 32
    object QSubGruposCadastroID: TIntegerField
      FieldName = 'ID'
    end
    object QSubGruposCadastroNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
  end
  object QSubgruposBusca: TMyQuery
    Connection = ModelConexaoDM.MyConnection1
    SQL.Strings = (
      'SELECT * FROM subgrupos')
    Left = 192
    Top = 32
    object QSubgruposBuscaID: TIntegerField
      FieldName = 'ID'
    end
    object QSubgruposBuscaNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
  end
  object QLookup: TMyQuery
    Connection = ModelConexaoDM.MyConnection1
    SQL.Strings = (
      'SELECT s.Nome FROM subgrupos s'
      'where (s.ID = :IDSubGrupos)')
    Left = 120
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDSubGrupos'
      end>
    object QLookupNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
  end
end
