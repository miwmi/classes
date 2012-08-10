inherited frmModeloRelatorio: TfrmModeloRelatorio
  Left = 218
  Top = 207
  Caption = 'Formul'#225'rio Modelo para Relat'#243'rios'
  ClientHeight = 340
  ClientWidth = 839
  OnCreate = FormCreate
  ExplicitWidth = 847
  ExplicitHeight = 367
  PixelsPerInch = 96
  TextHeight = 13
  object lblTituloRelat: TLabel
    Left = 9
    Top = 4
    Width = 108
    Height = 13
    Caption = 'T'#237'tulo do Relat'#243'rio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnSalvarTitulo: TSpeedButton
    Left = 796
    Top = 19
    Width = 41
    Height = 22
    Hint = 'Salvar T'#237'tulo'
    Caption = 'Salvar'
    Enabled = False
    Flat = True
    ParentShowHint = False
    ShowHint = True
  end
  object gbxPeriodo: TGroupBox
    Left = 9
    Top = 47
    Width = 410
    Height = 49
    Caption = 'Per'#237'odo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    DesignSize = (
      410
      49)
    object lblDataInicial: TLabel
      Left = 10
      Top = 26
      Width = 66
      Height = 13
      Caption = 'Data Inicial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblDataFinal: TLabel
      Left = 271
      Top = 26
      Width = 59
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Data Final'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object txtDataInicial: TMaskEdit
      Left = 80
      Top = 18
      Width = 65
      Height = 21
      EditMask = '!99/99/9999;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 0
      Text = '  /  /    '
    end
    object txtDataFinal: TMaskEdit
      Left = 335
      Top = 18
      Width = 65
      Height = 21
      Anchors = [akTop, akRight]
      EditMask = '!99/99/9999;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 1
      Text = '  /  /    '
    end
  end
  object txtTituloRelat: TEdit
    Left = 9
    Top = 19
    Width = 784
    Height = 21
    TabOrder = 0
    Text = 'Digite Aqui o T'#237'tulo do Relat'#243'rio'
  end
  object btnVisualizarImpressao: TBitBtn
    Left = 731
    Top = 308
    Width = 106
    Height = 25
    DoubleBuffered = True
    Kind = bkOK
    ParentDoubleBuffered = False
    TabOrder = 7
    OnClick = btnVisualizarImpressaoClick
  end
  object gbxEmpresaGeradora: TGroupBox
    Left = 9
    Top = 105
    Width = 410
    Height = 95
    Caption = 'Empresa Geradora'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    object btnGeradoraIncluir: TSpeedButton
      Left = 195
      Top = 16
      Width = 21
      Height = 17
      Caption = '>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = btnGeradoraIncluirClick
    end
    object btnGeradoraIncluirTodos: TSpeedButton
      Left = 195
      Top = 33
      Width = 21
      Height = 17
      Caption = '>>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = btnGeradoraIncluirTodosClick
    end
    object btnGeradoraExcluir: TSpeedButton
      Left = 195
      Top = 50
      Width = 21
      Height = 17
      Caption = '<'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = btnGeradoraExcluirClick
    end
    object btnGeradoraExcluirTodos: TSpeedButton
      Left = 195
      Top = 67
      Width = 21
      Height = 17
      Caption = '<<'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = btnGeradoraExcluirTodosClick
    end
    object lstEmpresaGeradoraDestino: TDBLookupListBox
      Left = 218
      Top = 16
      Width = 185
      Height = 69
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyField = 'ID_Fantasia'
      ListField = 'Descricao'
      ListSource = dtsEmpresaGeradoraDestino
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object lstEmpresaGeradoraOrigem: TDBLookupListBox
      Left = 7
      Top = 16
      Width = 185
      Height = 69
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyField = 'ID_Fantasia'
      ListField = 'Descricao'
      ListSource = dtsEmpresaGeradoraOrigem
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
  end
  object gbxSituacaoManifesto: TGroupBox
    Left = 9
    Top = 208
    Width = 410
    Height = 95
    Caption = 'Situa'#231#227'o do Manifesto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    object btnSituacaoIncluir: TSpeedButton
      Left = 195
      Top = 16
      Width = 21
      Height = 17
      Caption = '>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = btnSituacaoIncluirClick
    end
    object btnSituacaoIncluirTodos: TSpeedButton
      Left = 195
      Top = 33
      Width = 21
      Height = 17
      Caption = '>>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = btnSituacaoIncluirTodosClick
    end
    object btnSituacaoExcluir: TSpeedButton
      Left = 195
      Top = 50
      Width = 21
      Height = 17
      Caption = '<'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = btnSituacaoExcluirClick
    end
    object btnSituacaoExcluirTodos: TSpeedButton
      Left = 195
      Top = 67
      Width = 21
      Height = 17
      Caption = '<<'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = btnSituacaoExcluirTodosClick
    end
    object lstSituacaoOrigem: TDBLookupListBox
      Left = 7
      Top = 16
      Width = 185
      Height = 69
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyField = 'ID_Situacao'
      ListField = 'Descricao'
      ListSource = dtsSituacaoOrigem
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object lstSituacaoDestino: TDBLookupListBox
      Left = 218
      Top = 16
      Width = 185
      Height = 69
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyField = 'ID_Situacao'
      ListField = 'Descricao'
      ListSource = dtsSituacaoDestino
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
  end
  object gbxResiduo: TGroupBox
    Left = 427
    Top = 208
    Width = 410
    Height = 95
    Caption = 'Res'#237'duo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    object btnResiduoIncluir: TSpeedButton
      Left = 195
      Top = 16
      Width = 21
      Height = 17
      Caption = '>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = btnResiduoIncluirClick
    end
    object btnResiduoIncluirTodos: TSpeedButton
      Left = 195
      Top = 33
      Width = 21
      Height = 17
      Caption = '>>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = btnResiduoIncluirTodosClick
    end
    object btnResiduoExcluir: TSpeedButton
      Left = 195
      Top = 50
      Width = 21
      Height = 17
      Caption = '<'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = btnResiduoExcluirClick
    end
    object btnResiduoExcluirTodos: TSpeedButton
      Left = 195
      Top = 67
      Width = 21
      Height = 17
      Caption = '<<'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = btnResiduoExcluirTodosClick
    end
    object DBLookupListBox4: TDBLookupListBox
      Left = 218
      Top = 16
      Width = 185
      Height = 69
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyField = 'ID_Residuo'
      ListField = 'Descricao'
      ListSource = dtsResiduoDestino
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object DBLookupListBox5: TDBLookupListBox
      Left = 7
      Top = 16
      Width = 185
      Height = 69
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyField = 'ID_Residuo'
      ListField = 'Descricao'
      ListSource = dtsResiduoOrigem
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
  end
  object rdgTipoManifesto: TRadioGroup
    Left = 427
    Top = 47
    Width = 410
    Height = 49
    Caption = 'Tipo Manifesto'
    Columns = 3
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemIndex = 0
    Items.Strings = (
      'Sem CDF'
      'Com CDF'
      'Todos')
    ParentFont = False
    TabOrder = 2
  end
  object gbxEmpresaReceptora: TGroupBox
    Left = 427
    Top = 105
    Width = 410
    Height = 95
    Caption = 'Empresa Receptora'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    object btnReceptoraIncluir: TSpeedButton
      Left = 195
      Top = 16
      Width = 21
      Height = 17
      Caption = '>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = btnReceptoraIncluirClick
    end
    object btnReceptoraIncluirTodos: TSpeedButton
      Left = 195
      Top = 33
      Width = 21
      Height = 17
      Caption = '>>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = btnReceptoraIncluirTodosClick
    end
    object btnReceptoraExcluir: TSpeedButton
      Left = 195
      Top = 50
      Width = 21
      Height = 17
      Caption = '<'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = btnReceptoraExcluirClick
    end
    object btnReceptoraExcluirTodos: TSpeedButton
      Left = 195
      Top = 67
      Width = 21
      Height = 17
      Caption = '<<'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = btnReceptoraExcluirTodosClick
    end
    object lstEmpresaReceptoraDestino: TDBLookupListBox
      Left = 218
      Top = 16
      Width = 185
      Height = 69
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyField = 'ID_Empresa'
      ListField = 'RazaoSocial'
      ListSource = dtsEmpresaReceptoraDestino
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object lstEmpresaReceptoraOrigem: TDBLookupListBox
      Left = 7
      Top = 16
      Width = 185
      Height = 69
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyField = 'ID_Empresa'
      ListField = 'RazaoSocial'
      ListSource = dtsEmpresaReceptoraOrigem
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
  end
  object dspManifestos: TDataSetProvider
    Left = 231
    Top = 10
  end
  object cdsManifestos: TClientDataSetUrb
    Aggregates = <>
    Params = <>
    ProviderName = 'dspManifestos'
    Left = 259
    Top = 10
    object cdsManifestosNomeFantasia: TStringField
      FieldName = 'NomeFantasia'
      Required = True
      Size = 30
    end
    object cdsManifestosGerDtEntrega: TSQLTimeStampField
      FieldName = 'GerDtEntrega'
      Required = True
    end
    object cdsManifestosRazaoSocialRecep: TStringField
      FieldName = 'RazaoSocialRecep'
      Required = True
      Size = 50
    end
    object cdsManifestosProcedencia: TStringField
      FieldName = 'Procedencia'
      Required = True
      Size = 30
    end
    object cdsManifestosResiduo: TStringField
      FieldName = 'Residuo'
      Required = True
      Size = 50
    end
    object cdsManifestosGerID_Empresa: TIntegerField
      FieldName = 'GerID_Empresa'
      Required = True
    end
    object cdsManifestosRazaoSocial: TStringField
      FieldName = 'RazaoSocial'
      Required = True
      Size = 50
    end
    object cdsManifestosNumero: TStringField
      FieldName = 'Numero'
      Required = True
    end
    object cdsManifestosQuantidade: TFMTBCDField
      FieldName = 'Quantidade'
      Precision = 17
      Size = 6
    end
    object cdsManifestosCDF: TStringField
      FieldName = 'CDF'
      Size = 45
    end
    object cdsManifestosRecepID_Empresa: TIntegerField
      FieldName = 'RecepID_Empresa'
      Required = True
    end
    object cdsManifestosID_Residuo: TIntegerField
      FieldName = 'ID_Residuo'
      Required = True
    end
    object cdsManifestosValorMercado: TFloatField
      FieldName = 'ValorMercado'
    end
    object cdsManifestosValorReceber: TFloatField
      FieldName = 'ValorReceber'
    end
    object cdsManifestosID_Situacao: TIntegerField
      FieldName = 'ID_Situacao'
      Required = True
    end
    object cdsManifestosSituacao: TStringField
      FieldName = 'Situacao'
      Required = True
      Size = 30
    end
    object cdsManifestosID_Fantasia: TIntegerField
      FieldName = 'ID_Fantasia'
      Required = True
    end
    object cdsManifestosEndereco: TStringField
      FieldName = 'Endereco'
      Required = True
      Size = 80
    end
    object cdsManifestosMunicipio: TStringField
      FieldName = 'Municipio'
      Required = True
      Size = 30
    end
    object cdsManifestosUF: TStringField
      FieldName = 'UF'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsManifestosResponsavel: TStringField
      FieldName = 'Responsavel'
      Size = 50
    end
    object cdsManifestosID_Procedencia: TIntegerField
      FieldName = 'ID_Procedencia'
      Required = True
    end
    object cdsManifestosObs: TBlobField
      FieldName = 'Obs'
      Size = 1
    end
  end
  object dtsManifestos: TDataSourceUrb
    DataSet = cdsManifestos
    Left = 287
    Top = 10
  end
  object rdtsManifestos_Antigo: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = cdsManifestos
    Left = 315
    Top = 10
  end
  object dspSituacaoOrigem: TDataSetProvider
    Left = 17
    Top = 225
  end
  object cdsSituacaoOrigem: TClientDataSetUrb
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSituacaoOrigem'
    Left = 45
    Top = 225
    object cdsSituacaoOrigemID_Situacao: TIntegerField
      FieldName = 'ID_Situacao'
      Required = True
    end
    object cdsSituacaoOrigemDescricao: TStringField
      FieldName = 'Descricao'
      Required = True
      Size = 30
    end
  end
  object dtsSituacaoOrigem: TDataSourceUrb
    DataSet = cdsSituacaoOrigem
    Left = 73
    Top = 225
  end
  object dspEmpresaGeradoraOrigem: TDataSetProvider
    Left = 17
    Top = 122
  end
  object cdsEmpresaGeradoraOrigem: TClientDataSetUrb
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEmpresaGeradoraOrigem'
    Left = 45
    Top = 122
    object cdsEmpresaGeradoraOrigemID_Fantasia: TIntegerField
      FieldName = 'ID_Fantasia'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsEmpresaGeradoraOrigemDescricao: TStringField
      FieldName = 'Descricao'
      Required = True
      Size = 30
    end
  end
  object dtsEmpresaGeradoraOrigem: TDataSourceUrb
    DataSet = cdsEmpresaGeradoraOrigem
    Left = 73
    Top = 122
  end
  object cdsEmpresaGeradoraDestino: TClientDataSetUrb
    Aggregates = <>
    Params = <>
    Left = 228
    Top = 122
    object IntegerField1: TIntegerField
      FieldName = 'ID_Fantasia'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object StringField1: TStringField
      FieldName = 'Descricao'
      Required = True
      Size = 30
    end
  end
  object dtsEmpresaGeradoraDestino: TDataSourceUrb
    DataSet = cdsEmpresaGeradoraDestino
    Left = 256
    Top = 122
  end
  object dspResiduoOrigem: TDataSetProvider
    Left = 435
    Top = 225
  end
  object cdsResiduoOrigem: TClientDataSetUrb
    Aggregates = <>
    Params = <>
    ProviderName = 'dspResiduoOrigem'
    Left = 463
    Top = 225
    object cdsResiduoOrigemID_Residuo: TIntegerField
      FieldName = 'ID_Residuo'
      Required = True
    end
    object cdsResiduoOrigemDescricao: TStringField
      FieldName = 'Descricao'
      Required = True
      Size = 50
    end
  end
  object dtsResiduoOrigem: TDataSourceUrb
    DataSet = cdsResiduoOrigem
    Left = 491
    Top = 225
  end
  object cdsSituacaoDestino: TClientDataSetUrb
    Aggregates = <>
    Params = <>
    Left = 228
    Top = 225
    object IntegerField2: TIntegerField
      FieldName = 'ID_Situacao'
      Required = True
    end
    object StringField2: TStringField
      FieldName = 'Descricao'
      Required = True
      Size = 30
    end
  end
  object dtsSituacaoDestino: TDataSourceUrb
    DataSet = cdsSituacaoDestino
    Left = 256
    Top = 225
  end
  object cdsResiduoDestino: TClientDataSetUrb
    Aggregates = <>
    Params = <>
    Left = 646
    Top = 225
    object IntegerField3: TIntegerField
      FieldName = 'ID_Residuo'
      Required = True
    end
    object StringField3: TStringField
      FieldName = 'Descricao'
      Required = True
      Size = 50
    end
  end
  object dtsResiduoDestino: TDataSourceUrb
    DataSet = cdsResiduoDestino
    Left = 674
    Top = 225
  end
  object dspEmpresaReceptoraOrigem: TDataSetProvider
    Left = 435
    Top = 122
  end
  object cdsEmpresaReceptoraOrigem: TClientDataSetUrb
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEmpresaReceptoraOrigem'
    Left = 463
    Top = 122
    object cdsEmpresaReceptoraOrigemID_Empresa: TIntegerField
      FieldName = 'ID_Empresa'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsEmpresaReceptoraOrigemRazaoSocial: TStringField
      FieldName = 'RazaoSocial'
      Required = True
      Size = 50
    end
  end
  object dtsEmpresaReceptoraOrigem: TDataSourceUrb
    DataSet = cdsEmpresaReceptoraOrigem
    Left = 491
    Top = 122
  end
  object dtsEmpresaReceptoraDestino: TDataSourceUrb
    DataSet = cdsEmpresaReceptoraDestino
    Left = 674
    Top = 122
  end
  object cdsEmpresaReceptoraDestino: TClientDataSetUrb
    Aggregates = <>
    Params = <>
    Left = 646
    Top = 122
    object IntegerField5: TIntegerField
      FieldName = 'ID_Empresa'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object StringField5: TStringField
      FieldName = 'RazaoSocial'
      Required = True
      Size = 50
    end
  end
end
