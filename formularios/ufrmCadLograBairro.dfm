inherited frmCadLograBairro: TfrmCadLograBairro
  Left = 380
  Top = 199
  Caption = 'Cadastro de Bairros'
  ClientHeight = 268
  ClientWidth = 427
  ExplicitWidth = 435
  ExplicitHeight = 295
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlManutencaoBD: TPanel
    Width = 338
    Height = 234
    inherited pgcManutencaoBD: TPageControl
      Width = 318
      Height = 216
      inherited tbsListagem: TTabSheet
        inherited pnlListagem: TPanel
          Width = 310
          Height = 206
          inherited dbgManutencaoBD: TDBGridUrb
            Width = 308
            Height = 204
          end
        end
      end
      inherited tbsCadastro: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 6
        ExplicitWidth = 507
        ExplicitHeight = 260
        inherited Panel1: TPanel
          Width = 310
          Height = 206
          ExplicitWidth = 507
          ExplicitHeight = 260
          object lblDescricao: TLabel
            Left = 64
            Top = 83
            Width = 48
            Height = 13
            Caption = 'Descri'#231#227'o'
            FocusControl = txtDescricao
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object txtDescricao: TDBEdit
            Left = 64
            Top = 99
            Width = 200
            Height = 21
            DataField = 'Descricao'
            DataSource = dtsManuBD
            TabOrder = 0
          end
        end
      end
    end
  end
  inherited stbManutencaoBD: TStatusBar
    Top = 249
    Width = 427
  end
  inherited pnlBotoes: TPanel
    Left = 349
    Height = 234
  end
  inherited cdsManuBD: TClientDataSetUrb
    object cdsManuBDID_Bairro: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Id.'
      FieldName = 'ID_Logra_Bairro'
      Required = True
      DisplayFormat = '000000'
    end
    object cdsManuBDDescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 34
      FieldName = 'Descricao'
      Required = True
      FixedChar = True
      Size = 30
    end
  end
  inherited sqlManuBD: TSQLDataSet
    SchemaName = 'andre'
    CommandText = 'SELECT ID_Logra_Bairro, Descricao FROM logra_bairro;'
  end
end
