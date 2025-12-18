object ModelCidadesDm: TModelCidadesDm
  OldCreateOrder = False
  Height = 482
  Width = 817
  object QCidadesCadastro: TMyQuery
    Connection = ModelConexaoDM.MyConnection1
    SQL.Strings = (
      'select * from unidade_federal')
    Left = 24
  end
  object QCidadesBusca: TMyQuery
    Connection = ModelConexaoDM.MyConnection1
    Left = 120
  end
  object DS_QCidadesCadastro: TDataSource
    DataSet = QCidadesCadastro
    Left = 24
    Top = 56
  end
  object DS_QCidadesBusca: TDataSource
    DataSet = QCidadesBusca
    Left = 120
    Top = 56
  end
end
