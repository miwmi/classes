inherited frmCadModuloUsuario: TfrmCadModuloUsuario
  Caption = 'Cadastro de M'#243'dulo Para Usuarios'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlManutencaoBD: TPanel
    inherited pgcManutencaoBD: TPageControl
      inherited tbsListagem: TTabSheet
        OnShow = tbsListagemShow
      end
      inherited tbsCadastro: TTabSheet
        OnShow = tbsCadastroShow
        inherited pnlCadastro: TPanel
          object Label1: TLabel
            Left = 39
            Top = 63
            Width = 44
            Height = 13
            Caption = 'Usu'#225'rio'
            FocusControl = dblUsuario
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label4: TLabel
            Left = 39
            Top = 103
            Width = 42
            Height = 13
            Caption = 'M'#243'dulo'
            FocusControl = dblModulo
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dblUsuario: TDBLookupComboBox
            Left = 39
            Top = 79
            Width = 250
            Height = 21
            DataField = 'DescUsuario'
            DataSource = dtsManuBD
            TabOrder = 0
          end
          object dblModulo: TDBLookupComboBox
            Left = 39
            Top = 119
            Width = 250
            Height = 21
            DataField = 'DescModulo'
            DataSource = dtsManuBD
            TabOrder = 1
          end
        end
      end
    end
  end
  inherited cdsManuBD: TClientDataSetUrb
    object cdsManuBDID_Usuario_Modulo: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'ID. Usu. x M'#243'd.'
      FieldName = 'ID_Usuario_Modulo'
      Required = True
      DisplayFormat = '000000'
    end
    object cdsManuBDID_Usuario: TIntegerField
      FieldName = 'ID_Usuario'
      Required = True
      Visible = False
    end
    object cdsManuBDID_Modulo: TIntegerField
      FieldName = 'ID_Modulo'
      Required = True
      Visible = False
    end
    object cdsManuBDDescUsuario: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldKind = fkLookup
      FieldName = 'DescUsuario'
      LookupDataSet = cdsUsuario
      LookupKeyFields = 'ID_Usuario'
      LookupResultField = 'Nome'
      KeyFields = 'ID_Usuario'
      Size = 50
      Lookup = True
    end
    object cdsManuBDDescModulo: TStringField
      DisplayLabel = 'M'#243'dulo'
      FieldKind = fkLookup
      FieldName = 'DescModulo'
      LookupDataSet = cdsModulo
      LookupKeyFields = 'ID_Modulo'
      LookupResultField = 'Descricao'
      KeyFields = 'ID_Modulo'
      Size = 30
      Lookup = True
    end
  end
  object cdsUsuario: TClientDataSetUrb
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUsuario'
    Left = 106
    Top = 74
    object cdsUsuarioID_Usuario: TIntegerField
      FieldName = 'ID_Usuario'
      Required = True
    end
    object cdsUsuarioNome: TStringField
      FieldName = 'Nome'
      Required = True
      Size = 30
    end
  end
  object dtsUsuario: TDataSourceUrb
    AutoEdit = False
    DataSet = cdsUsuario
    Left = 134
    Top = 74
  end
  object cdsModulo: TClientDataSetUrb
    Aggregates = <>
    Params = <>
    ProviderName = 'dspModulo'
    Left = 98
    Top = 114
    object cdsModuloID_Modulo: TIntegerField
      FieldName = 'ID_Modulo'
      Required = True
    end
    object cdsModuloDescricao: TStringField
      FieldName = 'Descricao'
      Required = True
      Size = 30
    end
  end
  object dtsModulo: TDataSourceUrb
    AutoEdit = False
    DataSet = cdsModulo
    Left = 126
    Top = 114
  end
  object dspUsuario: TDataSetProviderUrb
    DataSet = sqlUsuario
    Options = [poAllowCommandText]
    Left = 78
    Top = 74
  end
  object dspModulo: TDataSetProviderUrb
    DataSet = sqlModulo
    Options = [poAllowCommandText]
    Left = 71
    Top = 115
  end
  object sqlUsuario: TSQLDataSet
    GetMetadata = False
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = frmPrincipal.ConexaoBD
    Left = 50
    Top = 74
  end
  object sqlModulo: TSQLDataSet
    GetMetadata = False
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = frmPrincipal.ConexaoBD
    Left = 43
    Top = 116
  end
end
