object FrmTrans_Debito: TFrmTrans_Debito
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Trans. Mov. Financeira - D'#233'bito'
  ClientHeight = 483
  ClientWidth = 1002
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 1002
    Height = 442
    ActivePage = Manutencao
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Consulta: TTabSheet
      Caption = '&Consulta'
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 994
        Height = 393
        Align = alClient
        Color = clInfoBk
        DataSource = DataTabela
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clBlue
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = DBGrid1DblClick
        OnKeyPress = DBGrid1KeyPress
        OnTitleClick = DBGrid1TitleClick
        Columns = <
          item
            Expanded = False
            FieldName = 'TRANSACAO_ID'
            Title.Alignment = taRightJustify
            Title.Caption = 'ID'
            Width = 54
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_TRANS'
            Title.Caption = 'Dt. Transa'#231#227'o'
            Width = 76
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_MOVIMENTO'
            Title.Caption = 'Dt. Movimento'
            Width = 77
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUM_DOC'
            Title.Caption = 'N'#186' Documento'
            Width = 78
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SERIE'
            Title.Caption = 'S'#233'rie'
            Width = 35
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MODELO'
            Title.Caption = 'Modelo'
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CFOP'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'HISTORICO'
            Title.Caption = 'Hist'#243'rico'
            Width = 318
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BALANCO'
            Title.Caption = 'Balan'#231'o'
            Width = 73
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COND_PAGTO'
            Title.Caption = 'Cond. Pagto.'
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR'
            Title.Alignment = taRightJustify
            Title.Caption = 'Valor'
            Width = 75
            Visible = True
          end>
      end
      object Dias: TTabSet
        Left = 0
        Top = 393
        Width = 994
        Height = 21
        Align = alBottom
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        SoftTop = True
        Style = tsModernTabs
        Tabs.Strings = (
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7'
          '8'
          '9'
          '10'
          '11'
          '12'
          '13'
          '14'
          '15'
          '16'
          '17'
          '18'
          '19'
          '20'
          '21'
          '22'
          '23'
          '24'
          '25'
          '26'
          '27'
          '28'
          '29'
          '30'
          '31'
          'Todos')
        TabIndex = 0
        OnClick = DiasClick
      end
    end
    object Manutencao: TTabSheet
      Caption = '&Manuten'#231#227'o'
      ImageIndex = 1
      OnShow = ManutencaoShow
      object Label2: TLabel
        Left = 6
        Top = 61
        Width = 23
        Height = 13
        Caption = 'Data'
      end
      object Label9: TLabel
        Left = 6
        Top = 87
        Width = 49
        Height = 13
        Caption = 'Empresa'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 556
        Top = 87
        Width = 64
        Height = 13
        Caption = 'Fornecedor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 6
        Top = 113
        Width = 73
        Height = 13
        Caption = 'Cta. Despesa'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 586
        Top = 61
        Width = 65
        Height = 13
        Caption = 'NF/S'#233'rie/Mod'
      end
      object Label6: TLabel
        Left = 6
        Top = 191
        Width = 24
        Height = 13
        Caption = 'Valor'
      end
      object Label18: TLabel
        Left = 800
        Top = 139
        Width = 37
        Height = 13
        Caption = 'Balan'#231'o'
        Visible = False
      end
      object Label11: TLabel
        Left = 6
        Top = 243
        Width = 41
        Height = 13
        Caption = 'Hist'#243'rico'
      end
      object DBText1: TDBText
        Left = 204
        Top = 87
        Width = 296
        Height = 13
        DataField = 'RAZAO'
        DataSource = DataEmpresa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText2: TDBText
        Left = 743
        Top = 87
        Width = 233
        Height = 13
        DataField = 'NOME'
        DataSource = DataCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText3: TDBText
        Left = 204
        Top = 113
        Width = 296
        Height = 13
        DataField = 'DESCRICAO'
        DataSource = DataConta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 6
        Top = 139
        Width = 71
        Height = 13
        Caption = 'Caixa/Banco'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText4: TDBText
        Left = 204
        Top = 139
        Width = 296
        Height = 13
        DataField = 'DESCRICAO'
        DataSource = DataBanco
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 556
        Top = 113
        Width = 62
        Height = 13
        Caption = 'C. de Custo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText5: TDBText
        Left = 743
        Top = 113
        Width = 233
        Height = 13
        DataField = 'DESCRICAO'
        DataSource = DataCusto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 556
        Top = 139
        Width = 52
        Height = 13
        Caption = 'N'#186' Cheque'
      end
      object btnEmpresa: TSpeedButton
        Left = 135
        Top = 84
        Width = 64
        Height = 21
        Cursor = crHandPoint
        Caption = '(F7)'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Glyph.Data = {
          06020000424D0602000000000000760000002800000028000000140000000100
          0400000000009001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333333FFFFF
          FFF00000333333333333333777773333333BFBFBFBF0FFF03333333333333337
          FFF73333333FFFFFFF000000333333333333337777773333333BFBFBF0FBFBFB
          333333333FFFF733FFFF3333333F00000FF000003333333377777FF777773333
          333B0FFF0000FFF0333333337FFF7777FFF73333333F00000FF000003333333F
          777773F777773333330BFBFBF0FBFBFB3333337FF333373FFFFF33333010FFFF
          FF00000033333777FF3333777777333330170BFBFBF0FFF0333337777FF33337
          FFF73333301170FFFFF0000033333777778F3337777333330711190BFBFBFBFB
          333377777378F3333333333308819990FFFFFFFF3333733733378F3333333330
          88FF9999033333333337333333FF7333333333088FFFF0003333333333733333
          F777333333333088FFF003333333333337333337733333333333088FFF033333
          333333337F33337333333333333308FFF09333333333333378F3373333333333
          333330FF0933333333333333378F733333333333333333003333333333333333
          33773333333333333333}
        NumGlyphs = 2
        ParentFont = False
        OnClick = btnEmpresaClick
      end
      object btnFornecedor: TSpeedButton
        Left = 674
        Top = 83
        Width = 64
        Height = 21
        Cursor = crHandPoint
        Caption = '(F7)'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Glyph.Data = {
          06020000424D0602000000000000760000002800000028000000140000000100
          0400000000009001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333333FFFFF
          FFF00000333333333333333777773333333BFBFBFBF0FFF03333333333333337
          FFF73333333FFFFFFF000000333333333333337777773333333BFBFBF0FBFBFB
          333333333FFFF733FFFF3333333F00000FF000003333333377777FF777773333
          333B0FFF0000FFF0333333337FFF7777FFF73333333F00000FF000003333333F
          777773F777773333330BFBFBF0FBFBFB3333337FF333373FFFFF33333010FFFF
          FF00000033333777FF3333777777333330170BFBFBF0FFF0333337777FF33337
          FFF73333301170FFFFF0000033333777778F3337777333330711190BFBFBFBFB
          333377777378F3333333333308819990FFFFFFFF3333733733378F3333333330
          88FF9999033333333337333333FF7333333333088FFFF0003333333333733333
          F777333333333088FFF003333333333337333337733333333333088FFF033333
          333333337F33337333333333333308FFF09333333333333378F3373333333333
          333330FF0933333333333333378F733333333333333333003333333333333333
          33773333333333333333}
        NumGlyphs = 2
        ParentFont = False
        OnClick = btnFornecedorClick
      end
      object btnConta: TSpeedButton
        Left = 135
        Top = 110
        Width = 64
        Height = 21
        Cursor = crHandPoint
        Caption = '(F7)'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Glyph.Data = {
          06020000424D0602000000000000760000002800000028000000140000000100
          0400000000009001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333333FFFFF
          FFF00000333333333333333777773333333BFBFBFBF0FFF03333333333333337
          FFF73333333FFFFFFF000000333333333333337777773333333BFBFBF0FBFBFB
          333333333FFFF733FFFF3333333F00000FF000003333333377777FF777773333
          333B0FFF0000FFF0333333337FFF7777FFF73333333F00000FF000003333333F
          777773F777773333330BFBFBF0FBFBFB3333337FF333373FFFFF33333010FFFF
          FF00000033333777FF3333777777333330170BFBFBF0FFF0333337777FF33337
          FFF73333301170FFFFF0000033333777778F3337777333330711190BFBFBFBFB
          333377777378F3333333333308819990FFFFFFFF3333733733378F3333333330
          88FF9999033333333337333333FF7333333333088FFFF0003333333333733333
          F777333333333088FFF003333333333337333337733333333333088FFF033333
          333333337F33337333333333333308FFF09333333333333378F3373333333333
          333330FF0933333333333333378F733333333333333333003333333333333333
          33773333333333333333}
        NumGlyphs = 2
        ParentFont = False
        OnClick = btnContaClick
      end
      object btnBanco: TSpeedButton
        Left = 135
        Top = 136
        Width = 64
        Height = 21
        Cursor = crHandPoint
        Caption = '(F7)'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Glyph.Data = {
          06020000424D0602000000000000760000002800000028000000140000000100
          0400000000009001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333333FFFFF
          FFF00000333333333333333777773333333BFBFBFBF0FFF03333333333333337
          FFF73333333FFFFFFF000000333333333333337777773333333BFBFBF0FBFBFB
          333333333FFFF733FFFF3333333F00000FF000003333333377777FF777773333
          333B0FFF0000FFF0333333337FFF7777FFF73333333F00000FF000003333333F
          777773F777773333330BFBFBF0FBFBFB3333337FF333373FFFFF33333010FFFF
          FF00000033333777FF3333777777333330170BFBFBF0FFF0333337777FF33337
          FFF73333301170FFFFF0000033333777778F3337777333330711190BFBFBFBFB
          333377777378F3333333333308819990FFFFFFFF3333733733378F3333333330
          88FF9999033333333337333333FF7333333333088FFFF0003333333333733333
          F777333333333088FFF003333333333337333337733333333333088FFF033333
          333333337F33337333333333333308FFF09333333333333378F3373333333333
          333330FF0933333333333333378F733333333333333333003333333333333333
          33773333333333333333}
        NumGlyphs = 2
        ParentFont = False
        OnClick = btnBancoClick
      end
      object btnCentro_Custo: TSpeedButton
        Left = 673
        Top = 110
        Width = 64
        Height = 21
        Cursor = crHandPoint
        Caption = '(F7)'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Glyph.Data = {
          06020000424D0602000000000000760000002800000028000000140000000100
          0400000000009001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333333FFFFF
          FFF00000333333333333333777773333333BFBFBFBF0FFF03333333333333337
          FFF73333333FFFFFFF000000333333333333337777773333333BFBFBF0FBFBFB
          333333333FFFF733FFFF3333333F00000FF000003333333377777FF777773333
          333B0FFF0000FFF0333333337FFF7777FFF73333333F00000FF000003333333F
          777773F777773333330BFBFBF0FBFBFB3333337FF333373FFFFF33333010FFFF
          FF00000033333777FF3333777777333330170BFBFBF0FFF0333337777FF33337
          FFF73333301170FFFFF0000033333777778F3337777333330711190BFBFBFBFB
          333377777378F3333333333308819990FFFFFFFF3333733733378F3333333330
          88FF9999033333333337333333FF7333333333088FFFF0003333333333733333
          F777333333333088FFF003333333333337333337733333333333088FFF033333
          333333337F33337333333333333308FFF09333333333333378F3373333333333
          333330FF0933333333333333378F733333333333333333003333333333333333
          33773333333333333333}
        NumGlyphs = 2
        ParentFont = False
        OnClick = btnCentro_CustoClick
      end
      object Label16: TLabel
        Left = 556
        Top = 191
        Width = 64
        Height = 13
        Caption = 'Cond. Pagto.'
      end
      object btnParcelas: TSpeedButton
        Left = 747
        Top = 188
        Width = 23
        Height = 20
        Caption = '...'
        Enabled = False
        OnClick = btnParcelasClick
      end
      object Label8: TLabel
        Left = 6
        Top = 217
        Width = 64
        Height = 13
        Caption = 'Fluxo Caixa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnFluxoCaixa: TSpeedButton
        Left = 135
        Top = 214
        Width = 64
        Height = 21
        Cursor = crHandPoint
        Caption = '(F7)'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Glyph.Data = {
          06020000424D0602000000000000760000002800000028000000140000000100
          0400000000009001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333333FFFFF
          FFF00000333333333333333777773333333BFBFBFBF0FFF03333333333333337
          FFF73333333FFFFFFF000000333333333333337777773333333BFBFBF0FBFBFB
          333333333FFFF733FFFF3333333F00000FF000003333333377777FF777773333
          333B0FFF0000FFF0333333337FFF7777FFF73333333F00000FF000003333333F
          777773F777773333330BFBFBF0FBFBFB3333337FF333373FFFFF33333010FFFF
          FF00000033333777FF3333777777333330170BFBFBF0FFF0333337777FF33337
          FFF73333301170FFFFF0000033333777778F3337777333330711190BFBFBFBFB
          333377777378F3333333333308819990FFFFFFFF3333733733378F3333333330
          88FF9999033333333337333333FF7333333333088FFFF0003333333333733333
          F777333333333088FFF003333333333337333337733333333333088FFF033333
          333333337F33337333333333333308FFF09333333333333378F3373333333333
          333330FF0933333333333333378F733333333333333333003333333333333333
          33773333333333333333}
        NumGlyphs = 2
        ParentFont = False
        OnClick = btnFluxoCaixaClick
      end
      object DBText6: TDBText
        Left = 204
        Top = 217
        Width = 296
        Height = 13
        DataField = 'DESCRICAO'
        DataSource = DataFluxo_Caixa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 800
        Top = 61
        Width = 40
        Height = 13
        Caption = 'C.F.O.P.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnCFOP: TSpeedButton
        Left = 912
        Top = 58
        Width = 64
        Height = 21
        Cursor = crHandPoint
        Caption = '(F7)'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Glyph.Data = {
          06020000424D0602000000000000760000002800000028000000140000000100
          0400000000009001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333333FFFFF
          FFF00000333333333333333777773333333BFBFBFBF0FFF03333333333333337
          FFF73333333FFFFFFF000000333333333333337777773333333BFBFBF0FBFBFB
          333333333FFFF733FFFF3333333F00000FF000003333333377777FF777773333
          333B0FFF0000FFF0333333337FFF7777FFF73333333F00000FF000003333333F
          777773F777773333330BFBFBF0FBFBFB3333337FF333373FFFFF33333010FFFF
          FF00000033333777FF3333777777333330170BFBFBF0FFF0333337777FF33337
          FFF73333301170FFFFF0000033333777778F3337777333330711190BFBFBFBFB
          333377777378F3333333333308819990FFFFFFFF3333733733378F3333333330
          88FF9999033333333337333333FF7333333333088FFFF0003333333333733333
          F777333333333088FFF003333333333337333337733333333333088FFF033333
          333333337F33337333333333333308FFF09333333333333378F3373333333333
          333330FF0933333333333333378F733333333333333333003333333333333333
          33773333333333333333}
        NumGlyphs = 2
        ParentFont = False
        OnClick = btnCFOPClick
      end
      object Label34: TLabel
        Left = 6
        Top = 165
        Width = 65
        Height = 13
        Caption = 'Funcion'#225'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnVendedor: TSpeedButton
        Left = 135
        Top = 162
        Width = 64
        Height = 21
        Cursor = crHandPoint
        Caption = '(F7)'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Glyph.Data = {
          06020000424D0602000000000000760000002800000028000000140000000100
          0400000000009001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333333FFFFF
          FFF00000333333333333333777773333333BFBFBFBF0FFF03333333333333337
          FFF73333333FFFFFFF000000333333333333337777773333333BFBFBF0FBFBFB
          333333333FFFF733FFFF3333333F00000FF000003333333377777FF777773333
          333B0FFF0000FFF0333333337FFF7777FFF73333333F00000FF000003333333F
          777773F777773333330BFBFBF0FBFBFB3333337FF333373FFFFF33333010FFFF
          FF00000033333777FF3333777777333330170BFBFBF0FFF0333337777FF33337
          FFF73333301170FFFFF0000033333777778F3337777333330711190BFBFBFBFB
          333377777378F3333333333308819990FFFFFFFF3333733733378F3333333330
          88FF9999033333333337333333FF7333333333088FFFF0003333333333733333
          F777333333333088FFF003333333333337333337733333333333088FFF033333
          333333337F33337333333333333308FFF09333333333333378F3373333333333
          333330FF0933333333333333378F733333333333333333003333333333333333
          33773333333333333333}
        NumGlyphs = 2
        ParentFont = False
        OnClick = btnVendedorClick
      end
      object DBText8: TDBText
        Left = 204
        Top = 165
        Width = 296
        Height = 13
        DataField = 'NOME'
        DataSource = DataVendedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label35: TLabel
        Left = 556
        Top = 217
        Width = 45
        Height = 13
        Caption = 'Chv. NFe'
      end
      object Btn_Cheque: TSpeedButton
        Left = 720
        Top = 136
        Width = 64
        Height = 21
        Cursor = crHandPoint
        Caption = '(F7)'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Glyph.Data = {
          06020000424D0602000000000000760000002800000028000000140000000100
          0400000000009001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333333FFFFF
          FFF00000333333333333333777773333333BFBFBFBF0FFF03333333333333337
          FFF73333333FFFFFFF000000333333333333337777773333333BFBFBF0FBFBFB
          333333333FFFF733FFFF3333333F00000FF000003333333377777FF777773333
          333B0FFF0000FFF0333333337FFF7777FFF73333333F00000FF000003333333F
          777773F777773333330BFBFBF0FBFBFB3333337FF333373FFFFF33333010FFFF
          FF00000033333777FF3333777777333330170BFBFBF0FFF0333337777FF33337
          FFF73333301170FFFFF0000033333777778F3337777333330711190BFBFBFBFB
          333377777378F3333333333308819990FFFFFFFF3333733733378F3333333330
          88FF9999033333333337333333FF7333333333088FFFF0003333333333733333
          F777333333333088FFF003333333333337333337733333333333088FFF033333
          333333337F33337333333333333308FFF09333333333333378F3373333333333
          333330FF0933333333333333378F733333333333333333003333333333333333
          33773333333333333333}
        NumGlyphs = 2
        ParentFont = False
        OnClick = Btn_ChequeClick
      end
      object Label7: TLabel
        Left = 171
        Top = 61
        Width = 42
        Height = 13
        Caption = 'Dt. Entr.'
      end
      object Label33: TLabel
        Left = 304
        Top = 61
        Width = 52
        Height = 13
        Caption = 'Dt. Movim.'
      end
      object Label40: TLabel
        Left = 451
        Top = 61
        Width = 46
        Height = 13
        Caption = 'Dt. Sped.'
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 994
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 4
        object btnPrior: TBitBtn
          Left = 6
          Top = 6
          Width = 95
          Height = 25
          Caption = 'Anterior'
          Spacing = 10
          TabOrder = 0
          OnClick = btnPriorClick
        end
        object btnNext: TBitBtn
          Left = 152
          Top = 6
          Width = 95
          Height = 25
          Caption = 'Pr'#243'ximo'
          Spacing = 10
          TabOrder = 1
          OnClick = btnNextClick
        end
        object btnInsert: TBitBtn
          Left = 299
          Top = 6
          Width = 95
          Height = 25
          Caption = '&Incluir'
          Spacing = 10
          TabOrder = 2
          OnClick = btnInsertClick
        end
        object btnEdit: TBitBtn
          Left = 445
          Top = 6
          Width = 95
          Height = 25
          Caption = 'A&lterar'
          Spacing = 10
          TabOrder = 3
          OnClick = btnEditClick
        end
        object btnDelete: TBitBtn
          Left = 592
          Top = 6
          Width = 95
          Height = 25
          Caption = '&Excluir'
          Spacing = 10
          TabOrder = 4
          OnClick = btnDeleteClick
        end
        object btnSave: TBitBtn
          Left = 738
          Top = 6
          Width = 95
          Height = 25
          Caption = '&Salvar'
          Spacing = 10
          TabOrder = 5
          OnClick = btnSaveClick
        end
        object btnDiscard: TBitBtn
          Left = 885
          Top = 6
          Width = 95
          Height = 25
          Caption = 'C&ancelar'
          Spacing = 10
          TabOrder = 6
          OnClick = btnDiscardClick
        end
      end
      object BALANCO: TComboBox
        Left = 848
        Top = 136
        Width = 128
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 15
        Visible = False
        OnKeyDown = EMPRESA_IDKeyDown
        Items.Strings = (
          'AGRUPADO'
          'BLOQUEADO'
          'LIBERADO')
      end
      object EMPRESA_ID: TCurrencyEdit
        Left = 85
        Top = 84
        Width = 47
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0;-0'
        Enabled = False
        TabOrder = 9
        ZeroEmpty = False
        OnExit = EMPRESA_IDExit
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object FORNECEDOR_ID: TCurrencyEdit
        Left = 624
        Top = 84
        Width = 47
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0;-0'
        Enabled = False
        TabOrder = 10
        ZeroEmpty = False
        OnExit = FORNECEDOR_IDExit
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object CONTA_ID: TCurrencyEdit
        Left = 85
        Top = 110
        Width = 47
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0;-0'
        Enabled = False
        TabOrder = 11
        ZeroEmpty = False
        OnExit = CONTA_IDExit
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object HISTORICO: TEdit
        Left = 85
        Top = 240
        Width = 454
        Height = 21
        Enabled = False
        MaxLength = 150
        TabOrder = 21
        OnKeyDown = DT_TRANSKeyDown
      end
      object NUM_DOC: TEdit
        Left = 654
        Top = 58
        Width = 60
        Height = 21
        Enabled = False
        MaxLength = 9
        TabOrder = 5
        OnKeyDown = DT_TRANSKeyDown
        OnKeyPress = NUM_DOCKeyPress
      end
      object CONDUTA: TEdit
        Left = 334
        Top = 188
        Width = 46
        Height = 21
        Enabled = False
        MaxLength = 2
        TabOrder = 23
        Visible = False
        OnKeyDown = DT_TRANSKeyDown
      end
      object DEPTO: TEdit
        Left = 386
        Top = 188
        Width = 46
        Height = 21
        Enabled = False
        MaxLength = 2
        TabOrder = 24
        Visible = False
        OnKeyDown = DT_TRANSKeyDown
      end
      object TPCTB: TEdit
        Left = 438
        Top = 188
        Width = 46
        Height = 21
        Enabled = False
        MaxLength = 2
        TabOrder = 25
        Visible = False
        OnKeyDown = DT_TRANSKeyDown
      end
      object BANCO_ID: TCurrencyEdit
        Left = 85
        Top = 136
        Width = 47
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0;-0'
        Enabled = False
        TabOrder = 13
        ZeroEmpty = False
        OnExit = BANCO_IDExit
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object C_CUSTO_ID: TCurrencyEdit
        Left = 624
        Top = 110
        Width = 47
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0;-0'
        Enabled = False
        TabOrder = 12
        ZeroEmpty = False
        OnExit = C_CUSTO_IDExit
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object NUM_CHEQUE: TEdit
        Left = 624
        Top = 136
        Width = 90
        Height = 21
        Enabled = False
        MaxLength = 15
        TabOrder = 14
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object VALOR: TRxCalcEdit
        Left = 85
        Top = 188
        Width = 121
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
        Enabled = False
        NumGlyphs = 2
        TabOrder = 17
        ZeroEmpty = False
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object AUTORIZ_ID: TCurrencyEdit
        Left = 281
        Top = 188
        Width = 47
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0;-0'
        Enabled = False
        TabOrder = 26
        Visible = False
        ZeroEmpty = False
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object COND_PAGTO: TComboBox
        Left = 620
        Top = 187
        Width = 121
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 18
        OnKeyDown = EMPRESA_IDKeyDown
        Items.Strings = (
          'A VISTA'
          'A PRAZO')
      end
      object FLUXO_CAIXA_ID: TCurrencyEdit
        Left = 85
        Top = 214
        Width = 47
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0;-0'
        Enabled = False
        TabOrder = 19
        ZeroEmpty = False
        OnExit = FLUXO_CAIXA_IDExit
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object SERIE: TEdit
        Left = 718
        Top = 58
        Width = 34
        Height = 21
        Enabled = False
        MaxLength = 3
        TabOrder = 6
        OnKeyDown = DT_TRANSKeyDown
      end
      object MODELO: TEdit
        Left = 758
        Top = 58
        Width = 34
        Height = 21
        Enabled = False
        MaxLength = 2
        ParentShowHint = False
        ShowHint = False
        TabOrder = 7
        OnKeyDown = DT_TRANSKeyDown
      end
      object CFOP: TEdit
        Left = 848
        Top = 58
        Width = 61
        Height = 21
        Enabled = False
        MaxLength = 4
        TabOrder = 8
        OnExit = CFOPExit
        OnKeyDown = DT_TRANSKeyDown
        OnKeyPress = NUM_DOCKeyPress
      end
      object PageControl2: TPageControl
        Left = 0
        Top = 269
        Width = 994
        Height = 145
        ActivePage = TabSheet1
        Align = alBottom
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 22
        object TabSheet1: TTabSheet
          Caption = 'Fiscal'
          object Label15: TLabel
            Left = 318
            Top = 9
            Width = 47
            Height = 13
            Caption = 'CST ICMS'
          end
          object Label23: TLabel
            Left = 780
            Top = 9
            Width = 52
            Height = 13
            Caption = 'Valor ICMS'
          end
          object Label24: TLabel
            Left = 6
            Top = 35
            Width = 78
            Height = 13
            Caption = 'Base C'#225'lc. PIS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label25: TLabel
            Left = 318
            Top = 35
            Width = 43
            Height = 13
            Caption = 'CST PIS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label26: TLabel
            Left = 780
            Top = 35
            Width = 51
            Height = 13
            Caption = 'Valor PIS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label28: TLabel
            Left = 6
            Top = 61
            Width = 82
            Height = 13
            Caption = 'B. C'#225'lc. COFINS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label27: TLabel
            Left = 318
            Top = 61
            Width = 64
            Height = 13
            Caption = 'CST COFINS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label29: TLabel
            Left = 780
            Top = 61
            Width = 72
            Height = 13
            Caption = 'Valor COFINS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label19: TLabel
            Left = 6
            Top = 87
            Width = 60
            Height = 13
            Caption = 'Valor Outros'
          end
          object Label17: TLabel
            Left = 318
            Top = 87
            Width = 58
            Height = 13
            Caption = 'Valor Isento'
          end
          object Label14: TLabel
            Left = 6
            Top = 9
            Width = 78
            Height = 13
            Caption = 'Base C'#225'lc. ICMS'
          end
          object Label30: TLabel
            Left = 556
            Top = 9
            Width = 49
            Height = 13
            Caption = 'Al'#237'q. ICMS'
          end
          object Label31: TLabel
            Left = 556
            Top = 35
            Width = 69
            Height = 13
            Caption = 'Al'#237'quota PIS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label32: TLabel
            Left = 556
            Top = 61
            Width = 67
            Height = 13
            Caption = 'Al'#237'q. COFINS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btnCst_Pis: TSpeedButton
            Left = 421
            Top = 32
            Width = 64
            Height = 21
            Cursor = crHandPoint
            Caption = '(F7)'
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            Glyph.Data = {
              06020000424D0602000000000000760000002800000028000000140000000100
              0400000000009001000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333333FFFFF
              FFF00000333333333333333777773333333BFBFBFBF0FFF03333333333333337
              FFF73333333FFFFFFF000000333333333333337777773333333BFBFBF0FBFBFB
              333333333FFFF733FFFF3333333F00000FF000003333333377777FF777773333
              333B0FFF0000FFF0333333337FFF7777FFF73333333F00000FF000003333333F
              777773F777773333330BFBFBF0FBFBFB3333337FF333373FFFFF33333010FFFF
              FF00000033333777FF3333777777333330170BFBFBF0FFF0333337777FF33337
              FFF73333301170FFFFF0000033333777778F3337777333330711190BFBFBFBFB
              333377777378F3333333333308819990FFFFFFFF3333733733378F3333333330
              88FF9999033333333337333333FF7333333333088FFFF0003333333333733333
              F777333333333088FFF003333333333337333337733333333333088FFF033333
              333333337F33337333333333333308FFF09333333333333378F3373333333333
              333330FF0933333333333333378F733333333333333333003333333333333333
              33773333333333333333}
            NumGlyphs = 2
            ParentFont = False
            OnClick = btnCst_PisClick
          end
          object btnCst_Cofins: TSpeedButton
            Left = 421
            Top = 58
            Width = 64
            Height = 21
            Cursor = crHandPoint
            Caption = '(F7)'
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            Glyph.Data = {
              06020000424D0602000000000000760000002800000028000000140000000100
              0400000000009001000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333333FFFFF
              FFF00000333333333333333777773333333BFBFBFBF0FFF03333333333333337
              FFF73333333FFFFFFF000000333333333333337777773333333BFBFBF0FBFBFB
              333333333FFFF733FFFF3333333F00000FF000003333333377777FF777773333
              333B0FFF0000FFF0333333337FFF7777FFF73333333F00000FF000003333333F
              777773F777773333330BFBFBF0FBFBFB3333337FF333373FFFFF33333010FFFF
              FF00000033333777FF3333777777333330170BFBFBF0FFF0333337777FF33337
              FFF73333301170FFFFF0000033333777778F3337777333330711190BFBFBFBFB
              333377777378F3333333333308819990FFFFFFFF3333733733378F3333333330
              88FF9999033333333337333333FF7333333333088FFFF0003333333333733333
              F777333333333088FFF003333333333337333337733333333333088FFF033333
              333333337F33337333333333333308FFF09333333333333378F3373333333333
              333330FF0933333333333333378F733333333333333333003333333333333333
              33773333333333333333}
            NumGlyphs = 2
            ParentFont = False
            OnClick = btnCst_CofinsClick
          end
          object btnCst_Icms: TSpeedButton
            Left = 421
            Top = 6
            Width = 64
            Height = 21
            Cursor = crHandPoint
            Caption = '(F7)'
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            Glyph.Data = {
              06020000424D0602000000000000760000002800000028000000140000000100
              0400000000009001000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333333FFFFF
              FFF00000333333333333333777773333333BFBFBFBF0FFF03333333333333337
              FFF73333333FFFFFFF000000333333333333337777773333333BFBFBF0FBFBFB
              333333333FFFF733FFFF3333333F00000FF000003333333377777FF777773333
              333B0FFF0000FFF0333333337FFF7777FFF73333333F00000FF000003333333F
              777773F777773333330BFBFBF0FBFBFB3333337FF333373FFFFF33333010FFFF
              FF00000033333777FF3333777777333330170BFBFBF0FFF0333337777FF33337
              FFF73333301170FFFFF0000033333777778F3337777333330711190BFBFBFBFB
              333377777378F3333333333308819990FFFFFFFF3333733733378F3333333330
              88FF9999033333333337333333FF7333333333088FFFF0003333333333733333
              F777333333333088FFF003333333333337333337733333333333088FFF033333
              333333337F33337333333333333308FFF09333333333333378F3373333333333
              333330FF0933333333333333378F733333333333333333003333333333333333
              33773333333333333333}
            NumGlyphs = 2
            ParentFont = False
            OnClick = btnCst_IcmsClick
          end
          object CST_ICMS: TEdit
            Left = 385
            Top = 6
            Width = 34
            Height = 21
            Enabled = False
            MaxLength = 3
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnKeyDown = DT_TRANSKeyDown
          end
          object ALIQUOTA_ICMS: TRxCalcEdit
            Left = 628
            Top = 6
            Width = 83
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            DisplayFormat = '0.00;-0.00'
            Enabled = False
            NumGlyphs = 2
            TabOrder = 2
            ZeroEmpty = False
            OnKeyDown = EMPRESA_IDKeyDown
          end
          object VR_ICMS_NORMAL: TRxCalcEdit
            Left = 854
            Top = 6
            Width = 121
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
            Enabled = False
            NumGlyphs = 2
            TabOrder = 3
            ZeroEmpty = False
            OnKeyDown = EMPRESA_IDKeyDown
          end
          object BASE_CALC_PIS: TRxCalcEdit
            Left = 92
            Top = 32
            Width = 121
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
            Enabled = False
            NumGlyphs = 2
            TabOrder = 4
            ZeroEmpty = False
            OnExit = BASE_CALC_PISExit
            OnKeyDown = EMPRESA_IDKeyDown
          end
          object CST_PIS: TEdit
            Left = 385
            Top = 32
            Width = 34
            Height = 21
            Enabled = False
            MaxLength = 2
            ParentShowHint = False
            ShowHint = True
            TabOrder = 5
            OnChange = CST_PISChange
            OnKeyDown = DT_TRANSKeyDown
          end
          object ALIQUOTA_PIS: TRxCalcEdit
            Left = 628
            Top = 32
            Width = 83
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            DisplayFormat = '0.00;-0.00'
            Enabled = False
            NumGlyphs = 2
            TabOrder = 6
            ZeroEmpty = False
            OnKeyDown = EMPRESA_IDKeyDown
          end
          object VR_PIS: TRxCalcEdit
            Left = 854
            Top = 32
            Width = 121
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
            Enabled = False
            NumGlyphs = 2
            TabOrder = 7
            ZeroEmpty = False
            OnKeyDown = EMPRESA_IDKeyDown
          end
          object BASE_CALC_COFINS: TRxCalcEdit
            Left = 92
            Top = 58
            Width = 121
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
            Enabled = False
            NumGlyphs = 2
            TabOrder = 8
            ZeroEmpty = False
            OnExit = BASE_CALC_COFINSExit
            OnKeyDown = EMPRESA_IDKeyDown
          end
          object CST_COFINS: TEdit
            Left = 385
            Top = 58
            Width = 34
            Height = 21
            Enabled = False
            MaxLength = 2
            ParentShowHint = False
            ShowHint = True
            TabOrder = 9
            OnChange = CST_COFINSChange
            OnKeyDown = DT_TRANSKeyDown
          end
          object ALIQUOTA_COFINS: TRxCalcEdit
            Left = 628
            Top = 58
            Width = 83
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            DisplayFormat = '0.00;-0.00'
            Enabled = False
            NumGlyphs = 2
            TabOrder = 10
            ZeroEmpty = False
            OnKeyDown = EMPRESA_IDKeyDown
          end
          object VR_COFINS: TRxCalcEdit
            Left = 854
            Top = 58
            Width = 121
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
            Enabled = False
            NumGlyphs = 2
            TabOrder = 11
            ZeroEmpty = False
            OnKeyDown = EMPRESA_IDKeyDown
          end
          object VALOR_OUTROS: TRxCalcEdit
            Left = 92
            Top = 84
            Width = 121
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
            Enabled = False
            NumGlyphs = 2
            TabOrder = 12
            ZeroEmpty = False
            OnKeyDown = EMPRESA_IDKeyDown
          end
          object VALOR_ISENTO: TRxCalcEdit
            Left = 385
            Top = 84
            Width = 121
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
            Enabled = False
            NumGlyphs = 2
            TabOrder = 13
            ZeroEmpty = False
            OnKeyDown = EMPRESA_IDKeyDown
          end
          object BASE_ICMS_NORMAL: TRxCalcEdit
            Left = 92
            Top = 6
            Width = 121
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
            Enabled = False
            NumGlyphs = 2
            TabOrder = 0
            ZeroEmpty = False
            OnKeyDown = EMPRESA_IDKeyDown
          end
        end
        object TabSheet2: TTabSheet
          Caption = 'Imobilizado'
          ImageIndex = 1
          object Label20: TLabel
            Left = 6
            Top = 9
            Width = 62
            Height = 13
            Caption = 'Patrim'#244'nio'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btnPatrimonio: TSpeedButton
            Left = 138
            Top = 6
            Width = 64
            Height = 21
            Cursor = crHandPoint
            Caption = '(F7)'
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            Glyph.Data = {
              06020000424D0602000000000000760000002800000028000000140000000100
              0400000000009001000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333333FFFFF
              FFF00000333333333333333777773333333BFBFBFBF0FFF03333333333333337
              FFF73333333FFFFFFF000000333333333333337777773333333BFBFBF0FBFBFB
              333333333FFFF733FFFF3333333F00000FF000003333333377777FF777773333
              333B0FFF0000FFF0333333337FFF7777FFF73333333F00000FF000003333333F
              777773F777773333330BFBFBF0FBFBFB3333337FF333373FFFFF33333010FFFF
              FF00000033333777FF3333777777333330170BFBFBF0FFF0333337777FF33337
              FFF73333301170FFFFF0000033333777778F3337777333330711190BFBFBFBFB
              333377777378F3333333333308819990FFFFFFFF3333733733378F3333333330
              88FF9999033333333337333333FF7333333333088FFFF0003333333333733333
              F777333333333088FFF003333333333337333337733333333333088FFF033333
              333333337F33337333333333333308FFF09333333333333378F3373333333333
              333330FF0933333333333333378F733333333333333333003333333333333333
              33773333333333333333}
            NumGlyphs = 2
            ParentFont = False
            OnClick = btnPatrimonioClick
          end
          object DBText7: TDBText
            Left = 208
            Top = 9
            Width = 48
            Height = 13
            AutoSize = True
            DataField = 'DESCRICAO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label21: TLabel
            Left = 6
            Top = 35
            Width = 48
            Height = 13
            Caption = 'Od'#244'metro'
          end
          object Label22: TLabel
            Left = 6
            Top = 61
            Width = 56
            Height = 13
            Caption = 'Quantidade'
          end
          object PATRIMONIO_ID: TCurrencyEdit
            Left = 89
            Top = 6
            Width = 47
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            AutoSize = False
            DecimalPlaces = 0
            DisplayFormat = '0;-0'
            Enabled = False
            TabOrder = 0
            ZeroEmpty = False
            OnExit = PATRIMONIO_IDExit
            OnKeyDown = EMPRESA_IDKeyDown
          end
          object ODOMETRO: TRxCalcEdit
            Left = 89
            Top = 32
            Width = 121
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            DisplayFormat = '0.00;-0.00'
            Enabled = False
            NumGlyphs = 2
            TabOrder = 1
            ZeroEmpty = False
            OnKeyDown = EMPRESA_IDKeyDown
          end
          object QUANTIDADE: TRxCalcEdit
            Left = 89
            Top = 58
            Width = 121
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            DisplayFormat = '0.00;-0.00'
            Enabled = False
            NumGlyphs = 2
            TabOrder = 2
            ZeroEmpty = False
            OnKeyDown = EMPRESA_IDKeyDown
          end
        end
      end
      object VENDEDOR_ID: TCurrencyEdit
        Left = 85
        Top = 162
        Width = 47
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0;-0'
        Enabled = False
        TabOrder = 16
        ZeroEmpty = False
        OnExit = VENDEDOR_IDExit
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object CHAVE_NFE: TEdit
        Left = 620
        Top = 214
        Width = 356
        Height = 21
        Enabled = False
        MaxLength = 44
        TabOrder = 20
        OnKeyDown = DT_TRANSKeyDown
        OnKeyPress = NUM_DOCKeyPress
      end
      object DT_TRANS: TDateEdit
        Left = 85
        Top = 59
        Width = 83
        Height = 21
        CheckOnExit = True
        DialogTitle = 'Selecione a Data'
        Enabled = False
        NumGlyphs = 2
        TabOrder = 0
        OnEnter = DT_TRANSEnter
        OnKeyDown = DT_TRANSKeyDown
      end
      object DT_ENT_SAI: TDateEdit
        Left = 218
        Top = 59
        Width = 83
        Height = 21
        CheckOnExit = True
        DialogTitle = 'Selecione a Data'
        Enabled = False
        NumGlyphs = 2
        TabOrder = 1
        OnEnter = DT_TRANSEnter
        OnKeyDown = DT_TRANSKeyDown
      end
      object DT_MOVIMENTO: TDateEdit
        Left = 363
        Top = 59
        Width = 83
        Height = 21
        CheckOnExit = True
        DialogTitle = 'Selecione a Data'
        Enabled = False
        NumGlyphs = 2
        TabOrder = 2
        OnEnter = DT_TRANSEnter
        OnKeyDown = DT_TRANSKeyDown
      end
      object DT_SPED: TDateEdit
        Left = 499
        Top = 59
        Width = 83
        Height = 21
        CheckOnExit = True
        DialogTitle = 'Selecione a Data'
        Enabled = False
        NumGlyphs = 2
        TabOrder = 3
        OnEnter = DT_TRANSEnter
        OnKeyDown = DT_TRANSKeyDown
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 442
    Width = 1002
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnRetorna: TBitBtn
      Left = 893
      Top = 6
      Width = 95
      Height = 25
      Caption = '&Retorna'
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00377777777788
        F8F878F7777777777333333F00004444400777FFF444447777777777F333FF7F
        000033334D5008FFF4333377777777773337777F0000333345D50FFFF4333333
        337F777F3337F33F000033334D5D0FFFF43333333377877F3337F33F00003333
        45D50FEFE4333333337F787F3337F33F000033334D5D0FFFF43333333377877F
        3337F33F0000333345D50FEFE4333333337F787F3337F33F000033334D5D0FFF
        F43333333377877F3337F33F0000333345D50FEFE4333333337F787F3337F33F
        000033334D5D0EFEF43333333377877F3337F33F0000333345D50FEFE4333333
        337F787F3337F33F000033334D5D0EFEF43333333377877F3337F33F00003333
        4444444444333333337F7F7FFFF7F33F00003333333333333333333333777777
        7777333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
        333333333333777777F3333F00003333330000003333333333337FFFF7F3333F
        0000}
      NumGlyphs = 2
      Spacing = 10
      TabOrder = 1
      OnClick = btnRetornaClick
    end
    object btnPesquisa: TBitBtn
      Left = 793
      Top = 6
      Width = 95
      Height = 25
      Caption = '&Pesquisa'
      Glyph.Data = {
        06020000424D0602000000000000760000002800000028000000140000000100
        0400000000009001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333333FFFFF
        FFF00000333333333333333777773333333BFBFBFBF0FFF03333333333333337
        FFF73333333FFFFFFF000000333333333333337777773333333BFBFBF0FBFBFB
        333333333FFFF733FFFF3333333F00000FF000003333333377777FF777773333
        333B0FFF0000FFF0333333337FFF7777FFF73333333F00000FF000003333333F
        777773F777773333330BFBFBF0FBFBFB3333337FF333373FFFFF33333010FFFF
        FF00000033333777FF3333777777333330170BFBFBF0FFF0333337777FF33337
        FFF73333301170FFFFF0000033333777778F3337777333330711190BFBFBFBFB
        333377777378F3333333333308819990FFFFFFFF3333733733378F3333333330
        88FF9999033333333337333333FF7333333333088FFFF0003333333333733333
        F777333333333088FFF003333333333337333337733333333333088FFF033333
        333333337F33337333333333333308FFF09333333333333378F3373333333333
        333330FF0933333333333333378F733333333333333333003333333333333333
        33773333333333333333}
      NumGlyphs = 2
      Spacing = 10
      TabOrder = 0
      OnClick = btnPesquisaClick
    end
  end
  object QVendedor: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM FUNCIONARIOS'
      'WHERE'
      '(FUNCIONARIO_ID = :FUNCIONARIO_ID)'
      'AND (STATUS = '#39'A'#39')')
    Left = 172
    Top = 412
    ParamData = <
      item
        Name = 'FUNCIONARIO_ID'
        ParamType = ptInput
      end>
  end
  object DataVendedor: TDataSource
    DataSet = QVendedor
    Left = 202
    Top = 411
  end
  object QPatrimonio: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM PATRIMONIO'
      'WHERE'
      '(PATRIMONIO_ID = :PATRIMONIO_ID)'
      'AND (STATUS = '#39'A'#39')')
    Left = 232
    Top = 413
    ParamData = <
      item
        Name = 'PATRIMONIO_ID'
        ParamType = ptInput
      end>
  end
  object DataPatrimonio: TDataSource
    DataSet = QPatrimonio
    Left = 264
    Top = 411
  end
  object QFluxo_Caixa: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM FLUXO_CAIXA'
      'WHERE'
      '(FLUXO_CAIXA_ID = :FLUXO_CAIXA_ID)')
    Left = 296
    Top = 408
    ParamData = <
      item
        Name = 'FLUXO_CAIXA_ID'
        ParamType = ptInput
      end>
  end
  object DataFluxo_Caixa: TDataSource
    DataSet = QFluxo_Caixa
    Left = 328
    Top = 411
  end
  object QTabela: TFDQuery
    AfterOpen = QTabelaAfterOpen
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM TRANSACOES')
    Left = 8
    Top = 448
  end
  object DataTabela: TDataSource
    AutoEdit = False
    DataSet = QTabela
    Left = 43
    Top = 449
  end
  object IQuery: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 72
    Top = 448
  end
  object QEmpresa: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM EMPRESAS'
      'WHERE'
      '(EMPRESA_ID = :EMPRESA_ID)'
      'AND (STATUS = '#39'A'#39')')
    Left = 104
    Top = 448
    ParamData = <
      item
        Name = 'EMPRESA_ID'
        ParamType = ptInput
      end>
  end
  object DataEmpresa: TDataSource
    DataSet = QEmpresa
    Left = 139
    Top = 449
  end
  object QBanco: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM BANCOS'
      'WHERE'
      '(BANCO_ID = :BANCO_ID)'
      'AND (EMPRESA_ID = :EMPRESA_ID)'
      'AND (STATUS = '#39'A'#39')')
    Left = 168
    Top = 448
    ParamData = <
      item
        Name = 'BANCO_ID'
        ParamType = ptInput
      end
      item
        Name = 'EMPRESA_ID'
        ParamType = ptInput
      end>
  end
  object DataBanco: TDataSource
    DataSet = QBanco
    Left = 203
    Top = 449
  end
  object QFornecedor: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM FORNECEDORES'
      'WHERE'
      '(FORNECEDOR_ID = :FORNECEDOR_ID)'
      'AND (STATUS = '#39'A'#39')')
    Left = 232
    Top = 448
    ParamData = <
      item
        Name = 'FORNECEDOR_ID'
        ParamType = ptInput
      end>
  end
  object DataCliente: TDataSource
    DataSet = QFornecedor
    Left = 267
    Top = 449
  end
  object QConta: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM TABELAS'
      'WHERE'
      '(TABELA_ID = :TABELA_ID)'
      'AND (TIPO_TABELA = '#39'4'#39')'
      'AND (NIVEL = '#39'ANAL'#205'TICA'#39')'
      'AND (STATUS = '#39'A'#39')')
    Left = 296
    Top = 448
    ParamData = <
      item
        Name = 'TABELA_ID'
        ParamType = ptInput
      end>
  end
  object DataConta: TDataSource
    DataSet = QConta
    Left = 331
    Top = 449
  end
  object QCusto: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM TABELAS'
      'WHERE'
      '(TABELA_ID = :TABELA_ID)'
      'AND (TIPO_TABELA = '#39'2'#39')'
      'AND (STATUS = '#39'A'#39')')
    Left = 360
    Top = 448
    ParamData = <
      item
        Name = 'TABELA_ID'
        ParamType = ptInput
      end>
  end
  object DataCusto: TDataSource
    DataSet = QCusto
    Left = 395
    Top = 449
  end
  object QLimite: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT CLIENTES.CLIENTE_ID, SUM(TRANSPARCELAS.VALOR) AS DEBITO'
      'FROM CLIENTES CLIENTES'
      'INNER JOIN TRANSACOES TRANSACOES'
      'ON (CLIENTES.CLIENTE_ID = TRANSACOES.CLIENTE_ID)'
      'INNER JOIN TRANSPARCELAS TRANSPARCELAS'
      'ON (TRANSACOES.TRANSACAO_ID = TRANSPARCELAS.TRANSACAO_ID)'
      'WHERE'
      '(CLIENTES.CLIENTE_ID = :CLIENTE_ID)'
      'AND (TRANSPARCELAS.DT_VENCIMENTO <= :DT_VENCIMENTO)'
      'AND (TRANSPARCELAS.VALOR > 0)'
      'AND (TRANSPARCELAS.BANCO_ID = 0)'
      'AND (TRANSACOES.COND_PAGTO = '#39'A PRAZO'#39')'
      'GROUP BY CLIENTES.CLIENTE_ID')
    Left = 432
    Top = 448
    ParamData = <
      item
        Name = 'CLIENTE_ID'
        ParamType = ptInput
      end
      item
        Name = 'DT_VENCIMENTO'
        ParamType = ptInput
      end>
  end
  object QCfop: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM CFOP'
      'WHERE'
      '(COD_CFOP = :COD_CFOP)')
    Left = 360
    Top = 408
    ParamData = <
      item
        Name = 'COD_CFOP'
        ParamType = ptInput
      end>
  end
end
