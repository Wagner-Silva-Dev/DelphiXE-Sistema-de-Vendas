object ModelPessoasDM: TModelPessoasDM
  OldCreateOrder = False
  Height = 114
  Width = 270
  object QPessoasCadastro: TMyQuery
    Connection = ModelConexaoDM.MyConnection1
    SQL.Strings = (
      'Select * from pessoas')
    AfterInsert = QPessoasCadastroAfterInsert
    BeforePost = QPessoasCadastroBeforePost
    Left = 48
    Top = 16
    object QPessoasCadastroID: TIntegerField
      AutoGenerateValue = arDefault
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
      Origin = 'pessoas.ID'
      ReadOnly = True
    end
    object QPessoasCadastronome: TStringField
      DisplayLabel = 'Nome/Raz'#227'o'
      FieldName = 'nome'
      Origin = 'pessoas.nome'
      Size = 60
    end
    object QPessoasCadastrofantasia: TStringField
      DisplayLabel = 'Fantasia'
      FieldName = 'fantasia'
      Origin = 'pessoas.fantasia'
      Size = 60
    end
    object QPessoasCadastrocliente: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'cliente'
      Origin = 'pessoas.cliente'
      FixedChar = True
      Size = 1
    end
    object QPessoasCadastrofornecedor: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'fornecedor'
      Origin = 'pessoas.fornecedor'
      FixedChar = True
      Size = 1
    end
    object QPessoasCadastrocep: TStringField
      DisplayLabel = 'CEP'
      FieldName = 'cep'
      Origin = 'pessoas.cep'
      EditMask = '99999-999'
      Size = 10
    end
    object QPessoasCadastrocod_uf: TIntegerField
      DisplayLabel = 'C'#243'digo Cidade'
      FieldName = 'cod_uf'
      Origin = 'pessoas.cod_uf'
    end
    object QPessoasCadastroendereco: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'endereco'
      Origin = 'pessoas.endereco'
      Size = 60
    end
    object QPessoasCadastronumero: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'numero'
      Origin = 'pessoas.numero'
    end
    object QPessoasCadastrobairro: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'bairro'
      Origin = 'pessoas.bairro'
      Size = 40
    end
    object QPessoasCadastrocomplemento: TStringField
      DisplayLabel = 'Complemento'
      FieldName = 'complemento'
      Origin = 'pessoas.complemento'
      Size = 40
    end
    object QPessoasCadastrotelefone: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'telefone'
      Origin = 'pessoas.telefone'
      EditMask = '(99) 9999-9999'
      Size = 15
    end
    object QPessoasCadastrocelular: TStringField
      DisplayLabel = 'Celular'
      FieldName = 'celular'
      Origin = 'pessoas.celular'
      EditMask = '(99) 99999-9999'
      Size = 15
    end
    object QPessoasCadastroemail: TStringField
      DisplayLabel = 'E-mail'
      FieldName = 'email'
      Origin = 'pessoas.email'
      Size = 50
    end
    object QPessoasCadastrotipo_juridico: TIntegerField
      DisplayLabel = 'Tipo Jur'#237'dico'
      FieldName = 'tipo_juridico'
      Origin = 'pessoas.tipo_juridico'
    end
    object QPessoasCadastroCPF: TStringField
      FieldName = 'CPF'
      Origin = 'pessoas.CPF'
      EditMask = '999.999.999-99'
      Size = 14
    end
    object QPessoasCadastroRG: TStringField
      FieldName = 'RG'
      Origin = 'pessoas.RG'
      EditMask = '99.999.999-9'
      Size = 14
    end
    object QPessoasCadastroCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'pessoas.CNPJ'
      EditMask = '99.999.999/999-99'
      Size = 18
    end
    object QPessoasCadastroInsc_Estadual: TStringField
      DisplayLabel = 'Insc.Estadual'
      FieldName = 'Insc_Estadual'
      Origin = 'pessoas.Insc_Estadual'
      Size = 14
    end
    object QPessoasCadastroativo: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'ativo'
      Origin = 'pessoas.ativo'
      FixedChar = True
      Size = 1
    end
    object QPessoasCadastronascimento: TDateField
      DisplayLabel = 'Nascimento'
      FieldName = 'nascimento'
      Origin = 'pessoas.nascimento'
      EditMask = '99/99/9999'
    end
    object QPessoasCadastrodh_cadastro: TDateTimeField
      DisplayLabel = 'Cadastro'
      FieldName = 'dh_cadastro'
      Origin = 'pessoas.dh_cadastro'
    end
  end
  object QPessoasBusca: TMyQuery
    Connection = ModelConexaoDM.MyConnection1
    SQL.Strings = (
      
        'SELECT p.ID, p.nome, p.fantasia, p.cliente, p.fornecedor, p.cod_' +
        'uf, uf.nome_uf, uf.uf,'
      'p.endereco, p.telefone, p.celular'
      ' FROM pessoas p'
      '  INNER JOIN unidade_federal uf ON (p.cod_uf = uf.cod_uf)')
    Left = 176
    Top = 16
    object QPessoasBuscaID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
    end
    object QPessoasBuscanome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 60
    end
    object QPessoasBuscafantasia: TStringField
      DisplayLabel = 'Fantasia'
      FieldName = 'fantasia'
      Size = 60
    end
    object QPessoasBuscacliente: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'cliente'
      FixedChar = True
      Size = 1
    end
    object QPessoasBuscafornecedor: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'fornecedor'
      FixedChar = True
      Size = 1
    end
    object QPessoasBuscacod_uf: TIntegerField
      DisplayLabel = 'C'#243'd - Cidade'
      FieldName = 'cod_uf'
    end
    object QPessoasBuscanome_uf: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'nome_uf'
      Size = 50
    end
    object QPessoasBuscauf: TStringField
      DisplayLabel = 'UF'
      FieldName = 'uf'
      FixedChar = True
      Size = 2
    end
    object QPessoasBuscaendereco: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'endereco'
      Size = 60
    end
    object QPessoasBuscatelefone: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'telefone'
      Size = 15
    end
    object QPessoasBuscacelular: TStringField
      DisplayLabel = 'Celular'
      FieldName = 'celular'
      Size = 15
    end
  end
end
