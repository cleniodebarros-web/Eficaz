object FrmSolicitacao_Compras: TFrmSolicitacao_Compras
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Sugest'#227'o de Pedido'
  ClientHeight = 307
  ClientWidth = 320
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = -1
    Top = 259
    Width = 394
    Height = 7
    Shape = bsTopLine
  end
  object Label2: TLabel
    Left = 10
    Top = 209
    Width = 40
    Height = 13
    Caption = 'Ordenar'
  end
  object Label1: TLabel
    Left = 10
    Top = 25
    Width = 55
    Height = 13
    Caption = 'Fornecedor'
  end
  object Label3: TLabel
    Left = 10
    Top = 55
    Width = 29
    Height = 13
    Caption = 'Grupo'
  end
  object Label4: TLabel
    Left = 10
    Top = 88
    Width = 42
    Height = 13
    Caption = 'Sub-Tipo'
  end
  object Label5: TLabel
    Left = 10
    Top = 116
    Width = 54
    Height = 13
    Caption = 'Localiza'#231#227'o'
  end
  object Label6: TLabel
    Left = 10
    Top = 177
    Width = 44
    Height = 13
    Caption = 'Intervalo'
  end
  object btnFornecedor: TSpeedButton
    Left = 123
    Top = 22
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
  object DBText1: TDBText
    Left = 193
    Top = 25
    Width = 48
    Height = 13
    AutoSize = True
    DataField = 'NOME'
    DataSource = DataFornecedor
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnGrupo: TSpeedButton
    Left = 123
    Top = 52
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
    OnClick = btnGrupoClick
  end
  object DBText2: TDBText
    Left = 195
    Top = 55
    Width = 48
    Height = 13
    AutoSize = True
    DataField = 'DESCRICAO'
    DataSource = DataGrupo
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnSub_Tipo: TSpeedButton
    Left = 123
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
    OnClick = btnSub_TipoClick
  end
  object DBText3: TDBText
    Left = 195
    Top = 88
    Width = 48
    Height = 13
    AutoSize = True
    DataField = 'DESCRICAO'
    DataSource = DataSubtipo
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnLocalizacao: TSpeedButton
    Left = 123
    Top = 113
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
    OnClick = btnLocalizacaoClick
  end
  object DBText4: TDBText
    Left = 195
    Top = 116
    Width = 48
    Height = 13
    AutoSize = True
    DataField = 'DESCRICAO'
    DataSource = DataLocalizacao
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnProd_Inicial: TSpeedButton
    Left = 124
    Top = 174
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
    OnClick = btnProd_InicialClick
  end
  object btnProd_final: TSpeedButton
    Left = 245
    Top = 174
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
    OnClick = btnProd_finalClick
  end
  object Label7: TLabel
    Left = 10
    Top = 144
    Width = 51
    Height = 13
    Caption = 'Tributa'#231#227'o'
  end
  object BtnTributacao: TSpeedButton
    Left = 123
    Top = 144
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
    OnClick = BtnTributacaoClick
  end
  object DBText5: TDBText
    Left = 193
    Top = 148
    Width = 48
    Height = 13
    AutoSize = True
    DataField = 'DESCRICAO'
    DataSource = DataTributos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 8
    Top = 237
    Width = 4
    Height = 16
    Alignment = taCenter
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Orcamentos: TQuickRep
    Left = -40
    Top = 800
    Width = 1123
    Height = 794
    DataSet = QRel
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poLandscape
    Page.PaperSize = A4
    Page.Continuous = False
    Page.Values = (
      127.000000000000000000
      2100.000000000000000000
      127.000000000000000000
      2970.000000000000000000
      150.000000000000000000
      220.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.OutputBin = Auto
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 0
    PrinterSettings.ExtendedDuplex = 0
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 0
    PrinterSettings.PrintMetaFile = False
    PrinterSettings.PrintQuality = 0
    PrinterSettings.Collate = 0
    PrinterSettings.ColorOption = 0
    PrintIfEmpty = True
    ReportTitle = 'Relat'#243'rio de Or'#231'amentos'
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsMaximized
    PreviewWidth = 500
    PreviewHeight = 500
    PrevInitialZoom = qrZoomToWidth
    PreviewDefaultSaveType = stQRP
    PreviewLeft = 0
    PreviewTop = 0
    object ColumnHeaderBand1: TQRBand
      Left = 57
      Top = 48
      Width = 983
      Height = 94
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        248.708333333333300000
        2600.854166666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbColumnHeader
      object QRDBText3: TQRDBText
        Left = 0
        Top = 1
        Width = 36
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          2.645833333333333000
          95.250000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = True
        Color = clWhite
        DataSet = FrmPrincipal.QEmpresa
        DataField = 'RAZAO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRSysData1: TQRSysData
        Left = 0
        Top = 16
        Width = 162
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          42.333333333333330000
          428.625000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = True
        Color = clWhite
        Data = qrsDateTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Text = 'Data/Hora : '
        Transparent = False
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel3: TQRLabel
        Left = 428
        Top = 31
        Width = 127
        Height = 15
        Size.Values = (
          39.687500000000000000
          1132.416666666667000000
          82.020833333333330000
          336.020833333333300000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = True
        Caption = '*** OR'#199'AMENTOS ***'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel1: TQRLabel
        Left = 0
        Top = 48
        Width = 57
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          127.000000000000000000
          150.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = True
        Caption = 'Per'#237'odo:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape1: TQRShape
        Left = 0
        Top = 65
        Width = 983
        Height = 4
        Size.Values = (
          10.583333333333330000
          0.000000000000000000
          171.979166666666700000
          2600.854166666667000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape3: TQRShape
        Left = 0
        Top = 88
        Width = 983
        Height = 4
        Size.Values = (
          10.583333333333330000
          0.000000000000000000
          232.833333333333300000
          2600.854166666667000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object Cabec: TQRLabel
        Left = 730
        Top = 1
        Width = 253
        Height = 15
        Size.Values = (
          39.687500000000000000
          1931.458333333333000000
          2.645833333333333000
          669.395833333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = True
        Caption = 'Sistema de Adm. de Empresas - Eficaz'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRSysData2: TQRSysData
        Left = 870
        Top = 16
        Width = 113
        Height = 15
        Size.Values = (
          39.687500000000000000
          2301.875000000000000000
          42.333333333333330000
          298.979166666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = True
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Text = 'P'#225'gina : '
        Transparent = False
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel10: TQRLabel
        Left = 58
        Top = 71
        Width = 29
        Height = 15
        Size.Values = (
          39.687500000000000000
          153.458333333333300000
          187.854166666666700000
          76.729166666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Data'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel7: TQRLabel
        Left = 881
        Top = 73
        Width = 102
        Height = 15
        Size.Values = (
          39.687500000000000000
          2330.979166666667000000
          193.145833333333300000
          269.875000000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Total'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel2: TQRLabel
        Left = 137
        Top = 71
        Width = 50
        Height = 15
        Size.Values = (
          39.687500000000000000
          362.479166666666700000
          187.854166666666700000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cliente'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel4: TQRLabel
        Left = 361
        Top = 71
        Width = 57
        Height = 15
        Size.Values = (
          39.687500000000000000
          955.145833333333300000
          187.854166666666700000
          150.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Vendedor'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel5: TQRLabel
        Left = 545
        Top = 71
        Width = 100
        Height = 15
        Size.Values = (
          39.687500000000000000
          1441.979166666667000000
          187.854166666666700000
          264.583333333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Sub-Total'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel6: TQRLabel
        Left = 657
        Top = 71
        Width = 100
        Height = 15
        Size.Values = (
          39.687500000000000000
          1738.312500000000000000
          187.854166666666700000
          264.583333333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Desconto'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel8: TQRLabel
        Left = 769
        Top = 71
        Width = 100
        Height = 15
        Size.Values = (
          39.687500000000000000
          2034.645833333333000000
          187.854166666666700000
          264.583333333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Acr'#233'scimo'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel9: TQRLabel
        Left = 0
        Top = 71
        Width = 49
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          187.854166666666700000
          129.645833333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'ID'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
    end
    object DetailBand1: TQRBand
      Left = 57
      Top = 178
      Width = 983
      Height = 18
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        47.625000000000000000
        2600.854166666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRDBText2: TQRDBText
        Left = 58
        Top = 1
        Width = 85
        Height = 15
        Size.Values = (
          39.687500000000000000
          153.458333333333300000
          2.645833333333333000
          224.895833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QRel
        DataField = 'DT_ORCAMENTO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText1: TQRDBText
        Left = 881
        Top = 1
        Width = 102
        Height = 15
        Size.Values = (
          39.687500000000000000
          2330.979166666667000000
          2.645833333333333000
          269.875000000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
        DataField = 'VALOR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Mask = '#,##0.00'
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText4: TQRDBText
        Left = 769
        Top = 1
        Width = 100
        Height = 15
        Size.Values = (
          39.687500000000000000
          2034.645833333333000000
          2.645833333333333000
          264.583333333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
        DataField = 'VR_ACRESCIMO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Mask = '#,##0.00'
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText5: TQRDBText
        Left = 657
        Top = 1
        Width = 100
        Height = 15
        Size.Values = (
          39.687500000000000000
          1738.312500000000000000
          2.645833333333333000
          264.583333333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
        DataField = 'VR_DESCONTO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Mask = '#,##0.00'
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText6: TQRDBText
        Left = 545
        Top = 1
        Width = 100
        Height = 15
        Size.Values = (
          39.687500000000000000
          1441.979166666667000000
          2.645833333333333000
          264.583333333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
        DataField = 'VALOR_PRODUTOS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Mask = '#,##0.00'
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText7: TQRDBText
        Left = 137
        Top = 1
        Width = 217
        Height = 15
        Size.Values = (
          39.687500000000000000
          362.479166666666700000
          2.645833333333333000
          574.145833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = 'NOME'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText8: TQRDBText
        Left = 361
        Top = 1
        Width = 176
        Height = 15
        Size.Values = (
          39.687500000000000000
          955.145833333333300000
          2.645833333333333000
          465.666666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
        DataField = 'VENDEDOR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText10: TQRDBText
        Left = 0
        Top = 1
        Width = 49
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          2.645833333333333000
          129.645833333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
        DataField = 'ORCAMENTO_ID'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
    end
    object SummaryBand1: TQRBand
      Left = 57
      Top = 232
      Width = 983
      Height = 22
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        58.208333333333330000
        2600.854166666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRShape4: TQRShape
        Left = 545
        Top = 1
        Width = 438
        Height = 4
        Size.Values = (
          10.583333333333330000
          1441.979166666667000000
          2.645833333333333000
          1158.875000000000000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRExpr2: TQRExpr
        Left = 881
        Top = 5
        Width = 102
        Height = 15
        Size.Values = (
          39.687500000000000000
          2330.979166666667000000
          13.229166666666670000
          269.875000000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Color = clWhite
        Master = Orcamentos
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'Sum(VALOR)'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRExpr3: TQRExpr
        Left = 769
        Top = 5
        Width = 100
        Height = 15
        Size.Values = (
          39.687500000000000000
          2034.645833333333000000
          13.229166666666670000
          264.583333333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Color = clWhite
        Master = Orcamentos
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'Sum(VR_ACRESCIMO)'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRExpr4: TQRExpr
        Left = 663
        Top = 6
        Width = 100
        Height = 15
        Size.Values = (
          39.687500000000000000
          1754.187500000000000000
          15.875000000000000000
          264.583333333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Color = clWhite
        Master = Orcamentos
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'Sum(VR_DESCONTO)'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRExpr5: TQRExpr
        Left = 545
        Top = 5
        Width = 100
        Height = 15
        Size.Values = (
          39.687500000000000000
          1441.979166666667000000
          13.229166666666670000
          264.583333333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Color = clWhite
        Master = Orcamentos
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'Sum(VALOR_PRODUTOS)'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
    end
    object QRGroup1: TQRGroup
      Left = 57
      Top = 142
      Width = 983
      Height = 36
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        95.250000000000000000
        2600.854166666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'COND_PAGTO'
      FooterBand = QRBand1
      Master = Orcamentos
      ReprintOnNewPage = False
      object QRDBText9: TQRDBText
        Left = 0
        Top = 6
        Width = 71
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          15.875000000000000000
          187.854166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QRel
        DataField = 'COND_PAGTO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
    end
    object QRBand1: TQRBand
      Left = 57
      Top = 196
      Width = 983
      Height = 36
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        95.250000000000000000
        2600.854166666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRExpr1: TQRExpr
        Left = 545
        Top = 5
        Width = 100
        Height = 15
        Size.Values = (
          39.687500000000000000
          1441.979166666667000000
          13.229166666666670000
          264.583333333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Color = clWhite
        Master = Orcamentos
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'Sum(VALOR_PRODUTOS)'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRExpr6: TQRExpr
        Left = 657
        Top = 5
        Width = 100
        Height = 15
        Size.Values = (
          39.687500000000000000
          1738.312500000000000000
          13.229166666666670000
          264.583333333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Color = clWhite
        Master = Orcamentos
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'Sum(VR_DESCONTO)'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape2: TQRShape
        Left = 545
        Top = 1
        Width = 438
        Height = 4
        Size.Values = (
          10.583333333333330000
          1441.979166666667000000
          2.645833333333333000
          1158.875000000000000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRExpr7: TQRExpr
        Left = 769
        Top = 5
        Width = 100
        Height = 15
        Size.Values = (
          39.687500000000000000
          2034.645833333333000000
          13.229166666666670000
          264.583333333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Color = clWhite
        Master = Orcamentos
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'Sum(VR_ACRESCIMO)'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRExpr8: TQRExpr
        Left = 881
        Top = 5
        Width = 102
        Height = 15
        Size.Values = (
          39.687500000000000000
          2330.979166666667000000
          13.229166666666670000
          269.875000000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Color = clWhite
        Master = Orcamentos
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'Sum(VALOR)'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
    end
  end
  object btnRetorna: TBitBtn
    Left = 220
    Top = 272
    Width = 81
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
    TabOrder = 1
    OnClick = btnRetornaClick
  end
  object btnExecuta: TBitBtn
    Left = 131
    Top = 272
    Width = 81
    Height = 25
    Caption = '&OK'
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333377F3333333333000033334224333333333333
      337337F3333333330000333422224333333333333733337F3333333300003342
      222224333333333373333337F3333333000034222A22224333333337F337F333
      7F33333300003222A3A2224333333337F3737F337F33333300003A2A333A2224
      33333337F73337F337F33333000033A33333A222433333337333337F337F3333
      0000333333333A222433333333333337F337F33300003333333333A222433333
      333333337F337F33000033333333333A222433333333333337F337F300003333
      33333333A222433333333333337F337F00003333333333333A22433333333333
      3337F37F000033333333333333A223333333333333337F730000333333333333
      333A333333333333333337330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
    TabOrder = 0
    OnClick = btnExecutaClick
  end
  object Ordem: TComboBox
    Left = 74
    Top = 206
    Width = 171
    Height = 21
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Items.Strings = (
      'C'#243'digo'
      'Descri'#231#227'o'
      'Pre'#231'o de Venda'
      'Venda 7 Dias'
      'Venda 15 Dias'
      'Venda 30 Dias')
  end
  object Fornecedor: TCurrencyEdit
    Left = 74
    Top = 22
    Width = 47
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 4
    ZeroEmpty = False
    OnExit = FornecedorExit
    OnKeyDown = FornecedorKeyDown
  end
  object Grupo: TCurrencyEdit
    Left = 74
    Top = 52
    Width = 47
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 5
    ZeroEmpty = False
    OnExit = GrupoExit
    OnKeyDown = FornecedorKeyDown
  end
  object SubTipo: TCurrencyEdit
    Left = 74
    Top = 83
    Width = 47
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 6
    ZeroEmpty = False
    OnExit = SubTipoExit
    OnKeyDown = FornecedorKeyDown
  end
  object Localizacao: TCurrencyEdit
    Left = 74
    Top = 113
    Width = 47
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 7
    ZeroEmpty = False
    OnExit = LocalizacaoExit
    OnKeyDown = FornecedorKeyDown
  end
  object Prod_Inicial: TCurrencyEdit
    Left = 74
    Top = 174
    Width = 47
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 8
    ZeroEmpty = False
    OnKeyDown = FornecedorKeyDown
  end
  object Prod_Final: TCurrencyEdit
    Left = 195
    Top = 174
    Width = 47
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 9
    ZeroEmpty = False
  end
  object Tributacao: TCurrencyEdit
    Left = 74
    Top = 144
    Width = 47
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 10
    ZeroEmpty = False
    OnExit = TributacaoExit
    OnKeyDown = FornecedorKeyDown
  end
  object Solicitacao_Compras: TQuickRep
    Left = 543
    Top = 113
    Width = 1123
    Height = 794
    DataSet = table_temp
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poLandscape
    Page.PaperSize = A4
    Page.Continuous = False
    Page.Values = (
      50.000000000000000000
      2100.000000000000000000
      50.000000000000000000
      2970.000000000000000000
      50.000000000000000000
      50.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.OutputBin = First
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 0
    PrinterSettings.ExtendedDuplex = 0
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 0
    PrinterSettings.PrintMetaFile = False
    PrinterSettings.PrintQuality = 0
    PrinterSettings.Collate = 0
    PrinterSettings.ColorOption = 0
    PrintIfEmpty = True
    ReportTitle = 'Estoque M'#237'nimo'
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsMaximized
    PreviewWidth = 500
    PreviewHeight = 500
    PrevInitialZoom = qrZoomToWidth
    PreviewDefaultSaveType = stQRP
    PreviewLeft = 0
    PreviewTop = 0
    object QRBand2: TQRBand
      Left = 19
      Top = 19
      Width = 1085
      Height = 113
      AlignToBottom = False
      TransparentBand = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        298.979166666666700000
        2870.729166666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object QRSysData3: TQRSysData
        Left = 0
        Top = 16
        Width = 218
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          42.333333333333330000
          576.791666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsDateTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Text = 'Data/Hora : '
        Transparent = False
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel11: TQRLabel
        Left = 801
        Top = 1
        Width = 253
        Height = 15
        Size.Values = (
          39.687500000000000000
          2119.312500000000000000
          2.645833333333333000
          669.395833333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Sistema de Adm. de Empresas - Eficaz'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRSysData4: TQRSysData
        Left = 983
        Top = 16
        Width = 71
        Height = 15
        Size.Values = (
          39.687500000000000000
          2600.854166666667000000
          42.333333333333330000
          187.854166666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Text = 'P'#225'gina : '
        Transparent = False
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel12: TQRLabel
        Left = 458
        Top = 31
        Width = 169
        Height = 15
        Size.Values = (
          39.687500000000000000
          1211.791666666667000000
          82.020833333333330000
          447.145833333333300000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = True
        Caption = '***SUGEST'#195'O DE PEDIDO***'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText11: TQRDBText
        Left = 0
        Top = 1
        Width = 36
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          2.645833333333333000
          95.250000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = FrmPrincipal.QEmpresa
        DataField = 'RAZAO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel13: TQRLabel
        Left = 2
        Top = 95
        Width = 50
        Height = 15
        Size.Values = (
          39.687500000000000000
          5.291666666666667000
          251.354166666666700000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'ID'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel15: TQRLabel
        Left = 58
        Top = 95
        Width = 64
        Height = 15
        Size.Values = (
          39.687500000000000000
          153.458333333333300000
          251.354166666666700000
          169.333333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Descri'#231#227'o'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel16: TQRLabel
        Left = 476
        Top = 95
        Width = 50
        Height = 15
        Size.Values = (
          39.687500000000000000
          1259.416666666667000000
          251.354166666666700000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Estoque'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel17: TQRLabel
        Left = 416
        Top = 95
        Width = 43
        Height = 15
        Size.Values = (
          39.687500000000000000
          1100.666666666667000000
          251.354166666666700000
          113.770833333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Vd.30D'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape6: TQRShape
        Left = -1
        Top = 90
        Width = 1089
        Height = 1
        Size.Values = (
          2.645833333333333000
          -2.645833333333333000
          238.125000000000000000
          2881.312500000000000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel18: TQRLabel
        Left = 367
        Top = 95
        Width = 43
        Height = 15
        Size.Values = (
          39.687500000000000000
          971.020833333333300000
          251.354166666666700000
          113.770833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Vd.15D'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel20: TQRLabel
        Left = 0
        Top = 74
        Width = 43
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          195.791666666666700000
          113.770833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = True
        Caption = 'Grupo:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel21: TQRLabel
        Left = 469
        Top = 46
        Width = 64
        Height = 15
        Size.Values = (
          39.687500000000000000
          1240.895833333333000000
          121.708333333333300000
          169.333333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sub-Tipo:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel22: TQRLabel
        Left = 969
        Top = 46
        Width = 85
        Height = 15
        Size.Values = (
          39.687500000000000000
          2563.812500000000000000
          121.708333333333300000
          224.895833333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Localiza'#231#227'o:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel106: TQRLabel
        Left = 313
        Top = 95
        Width = 43
        Height = 15
        Size.Values = (
          39.687500000000000000
          828.145833333333300000
          251.354166666666700000
          113.770833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Vd. 7D'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel108: TQRLabel
        Left = 535
        Top = 95
        Width = 36
        Height = 15
        Size.Values = (
          39.687500000000000000
          1415.520833333333000000
          251.354166666666700000
          95.250000000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Custo'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel14: TQRLabel
        Left = 706
        Top = 95
        Width = 71
        Height = 15
        Size.Values = (
          39.687500000000000000
          1867.958333333333000000
          251.354166666666700000
          187.854166666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Venda Novo'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel19: TQRLabel
        Left = 584
        Top = 95
        Width = 36
        Height = 15
        Size.Values = (
          39.687500000000000000
          1545.166666666667000000
          251.354166666666700000
          95.250000000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Venda'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape5: TQRShape
        Left = -1
        Top = 112
        Width = 1089
        Height = 1
        Size.Values = (
          2.645833333333333000
          -2.645833333333333000
          296.333333333333300000
          2881.312500000000000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel23: TQRLabel
        Left = 0
        Top = 46
        Width = 43
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          121.708333333333300000
          113.770833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = True
        Caption = 'Grupo:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel24: TQRLabel
        Left = 370
        Top = 74
        Width = 92
        Height = 15
        Size.Values = (
          39.687500000000000000
          978.958333333333300000
          195.791666666666700000
          243.416666666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Data Entrega:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel25: TQRLabel
        Left = 626
        Top = 74
        Width = 64
        Height = 15
        Size.Values = (
          39.687500000000000000
          1656.291666666667000000
          195.791666666666700000
          169.333333333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Vendedor:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel26: TQRLabel
        Left = 786
        Top = 95
        Width = 64
        Height = 15
        Size.Values = (
          39.687500000000000000
          2079.625000000000000000
          251.354166666666700000
          169.333333333333300000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Qt. Caixa'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel27: TQRLabel
        Left = 856
        Top = 95
        Width = 85
        Height = 15
        Size.Values = (
          39.687500000000000000
          2264.833333333333000000
          251.354166666666700000
          224.895833333333300000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Sugestao Qt.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel28: TQRLabel
        Left = 951
        Top = 95
        Width = 43
        Height = 15
        Size.Values = (
          39.687500000000000000
          2516.187500000000000000
          251.354166666666700000
          113.770833333333300000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Pedido'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel29: TQRLabel
        Left = 1029
        Top = 95
        Width = 50
        Height = 15
        Size.Values = (
          39.687500000000000000
          2722.562500000000000000
          251.354166666666700000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        Caption = 'TT Item'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel30: TQRLabel
        Left = 629
        Top = 95
        Width = 71
        Height = 15
        Size.Values = (
          39.687500000000000000
          1664.229166666667000000
          251.354166666666700000
          187.854166666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Custo Novo'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
    end
    object QRBand3: TQRBand
      Left = 19
      Top = 132
      Width = 1085
      Height = 26
      AlignToBottom = False
      TransparentBand = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        68.791666666666670000
        2870.729166666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRDBText12: TQRDBText
        Left = 2
        Top = 4
        Width = 50
        Height = 15
        Size.Values = (
          39.687500000000000000
          5.291666666666667000
          10.583333333333330000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = table_temp
        DataField = 'PRODUTO_ID'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText14: TQRDBText
        Left = 476
        Top = 4
        Width = 50
        Height = 15
        Size.Values = (
          39.687500000000000000
          1259.416666666667000000
          10.583333333333330000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = table_temp
        DataField = 'ESTOQUE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Mask = '#,###0.000'
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText15: TQRDBText
        Left = 58
        Top = 4
        Width = 253
        Height = 15
        Size.Values = (
          39.687500000000000000
          153.458333333333300000
          10.583333333333330000
          669.395833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = table_temp
        DataField = 'DESCRICAO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText16: TQRDBText
        Left = 426
        Top = 3
        Width = 50
        Height = 15
        Size.Values = (
          39.687500000000000000
          1127.125000000000000000
          7.937500000000000000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = table_temp
        DataField = 'venda30'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Mask = '#,##0.00'
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText17: TQRDBText
        Left = 352
        Top = 3
        Width = 58
        Height = 15
        Size.Values = (
          39.687500000000000000
          931.333333333333300000
          7.937500000000000000
          153.458333333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = table_temp
        DataField = 'venda15'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Mask = '#,##0.00'
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText70: TQRDBText
        Left = 313
        Top = 4
        Width = 43
        Height = 15
        Size.Values = (
          39.687500000000000000
          828.145833333333300000
          10.583333333333330000
          113.770833333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = table_temp
        DataField = 'venda7'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Mask = '#,##0.00'
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText72: TQRDBText
        Left = 535
        Top = 4
        Width = 36
        Height = 15
        Size.Values = (
          39.687500000000000000
          1415.520833333333000000
          10.583333333333330000
          95.250000000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = table_temp
        DataField = 'CUSTO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Mask = '#,##0.00'
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRShape7: TQRShape
        Left = 0
        Top = 19
        Width = 1091
        Height = 6
        Size.Values = (
          15.875000000000000000
          0.000000000000000000
          50.270833333333330000
          2886.604166666667000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRDBText13: TQRDBText
        Left = 584
        Top = 4
        Width = 36
        Height = 15
        Size.Values = (
          39.687500000000000000
          1545.166666666667000000
          10.583333333333330000
          95.250000000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = table_temp
        DataField = 'venda'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Mask = '#,##0.00'
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRRichText1: TQRRichText
        Left = 704
        Top = 3
        Width = 71
        Height = 17
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          44.979166666666670000
          1862.666666666667000000
          7.937500000000000000
          187.854166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AutoStretch = False
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
      end
      object QRRichText2: TQRRichText
        Left = 781
        Top = 3
        Width = 71
        Height = 17
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          44.979166666666670000
          2066.395833333333000000
          7.937500000000000000
          187.854166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AutoStretch = False
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
      end
      object QRRichText3: TQRRichText
        Left = 858
        Top = 3
        Width = 71
        Height = 17
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          44.979166666666670000
          2270.125000000000000000
          7.937500000000000000
          187.854166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AutoStretch = False
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
      end
      object QRRichText4: TQRRichText
        Left = 935
        Top = 3
        Width = 71
        Height = 17
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          44.979166666666670000
          2473.854166666667000000
          7.937500000000000000
          187.854166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AutoStretch = False
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
      end
      object QRRichText5: TQRRichText
        Left = 1012
        Top = 3
        Width = 71
        Height = 17
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          44.979166666666670000
          2677.583333333333000000
          7.937500000000000000
          187.854166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AutoStretch = False
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
      end
      object QRRichText6: TQRRichText
        Left = 629
        Top = 3
        Width = 71
        Height = 17
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          44.979166666666670000
          1664.229166666667000000
          7.937500000000000000
          187.854166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AutoStretch = False
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
      end
    end
  end
  object RDprint1: TRDprint
    ImpressoraPersonalizada.NomeImpressora = 'Modelo Personalizado - (Epson)'
    ImpressoraPersonalizada.AvancaOitavos = '27 48'
    ImpressoraPersonalizada.AvancaSextos = '27 50'
    ImpressoraPersonalizada.SaltoPagina = '12'
    ImpressoraPersonalizada.TamanhoPagina = '27 67 66'
    ImpressoraPersonalizada.Negrito = '27 69'
    ImpressoraPersonalizada.Italico = '27 52'
    ImpressoraPersonalizada.Sublinhado = '27 45 49'
    ImpressoraPersonalizada.Expandido = '27 14'
    ImpressoraPersonalizada.Normal10 = '18 27 80'
    ImpressoraPersonalizada.Comprimir12 = '18 27 77'
    ImpressoraPersonalizada.Comprimir17 = '27 80 27 15'
    ImpressoraPersonalizada.Comprimir20 = '27 77 27 15'
    ImpressoraPersonalizada.Reset = '27 80 18 20 27 53 27 70 27 45 48'
    ImpressoraPersonalizada.Inicializar = '27 64'
    OpcoesPreview.PaginaZebrada = False
    OpcoesPreview.Remalina = False
    OpcoesPreview.CaptionPreview = 'Rdprint Preview'
    OpcoesPreview.PreviewZoom = 100
    OpcoesPreview.CorPapelPreview = clWhite
    OpcoesPreview.CorLetraPreview = clBlack
    OpcoesPreview.Preview = False
    OpcoesPreview.BotaoSetup = Ativo
    OpcoesPreview.BotaoImprimir = Ativo
    OpcoesPreview.BotaoGravar = Ativo
    OpcoesPreview.BotaoLer = Ativo
    OpcoesPreview.BotaoProcurar = Ativo
    OpcoesPreview.BotaoPDF = Ativo
    OpcoesPreview.BotaoEMAIL = Ativo
    Margens.Left = 10
    Margens.Right = 10
    Margens.Top = 10
    Margens.Bottom = 10
    Autor = Deltress
    RegistroUsuario.NomeRegistro = 'EFICAZ AUTOMA'#199'O E SISTEMAS LTDA '
    RegistroUsuario.SerieProduto = 'GROUP-0214/02002'
    RegistroUsuario.AutorizacaoKey = 'HE4F-X2AQ-8IYJ-211Q-IGUV'
    About = 'RDprint 5.0 - Registrado'
    Acentuacao = Transliterate
    CaptionSetup = 'Rdprint Setup'
    TitulodoRelatorio = 'Gerado por RDprint'
    UsaGerenciadorImpr = True
    CorForm = clBtnFace
    CorFonte = clBlack
    Impressora = Epson
    Mapeamento.Strings = (
      '//--- Grafico Compativel com Windows/USB ---//'
      '//'
      'GRAFICO=GRAFICO'
      'HP=GRAFICO'
      'DESKJET=GRAFICO'
      'LASERJET=GRAFICO'
      'INKJET=GRAFICO'
      'STYLUS=GRAFICO'
      'EPL=GRAFICO'
      'USB=GRAFICO'
      '//'
      '//--- Linha Epson Matricial 9 e 24 agulhas ---//'
      '//'
      'EPSON=EPSON'
      'GENERIC=EPSON'
      'TEXT=EPSON'
      'LX-300=EPSON'
      'LX-810=EPSON'
      'FX-2170=EPSON'
      'FX-1170=EPSON'
      'LQ-1170=EPSON'
      'LQ-2170=EPSON'
      'OKIDATA=EPSON'
      '//'
      '//--- Rima e Emilia ---//'
      '//'
      'RIMA=RIMA'
      'EMILIA=RIMA'
      '//'
      '//--- Linha HP/Xerox padr'#227'o PCL ---//'
      '//'
      'PCL=HP'
      '//'
      '//--- Impressoras 40 Colunas ---//'
      '//'
      'DARUMA=BOBINA'
      'SIGTRON=BOBINA'
      'SWEDA=BOBINA'
      'BEMATECH=BOBINA')
    MostrarProgresso = True
    TamanhoQteLinhas = 66
    TamanhoQteColunas = 80
    TamanhoQteLPP = Seis
    NumerodeCopias = 1
    FonteTamanhoPadrao = S10cpp
    FonteEstiloPadrao = []
    Orientacao = poLandscape
    Left = 47
    Top = 416
  end
  object DataProduto: TDataSource
    DataSet = QProduto
    Left = 9
    Top = 340
  end
  object DataGrupo: TDataSource
    DataSet = QGrupo
    Left = 85
    Top = 340
  end
  object DataFornecedor: TDataSource
    DataSet = QFornecedor
    Left = 199
    Top = 340
  end
  object DataSubtipo: TDataSource
    DataSet = QSubTipo
    Left = 47
    Top = 340
  end
  object DataTributos: TDataSource
    DataSet = QTributos
    Left = 123
    Top = 340
  end
  object DataLocalizacao: TDataSource
    DataSet = QLocalizacao
    Left = 161
    Top = 340
  end
  object QGrupo: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      'SELECT * FROM TABELAS'
      'WHERE'
      '(TABELA_ID = :TABELA_ID)'
      'AND (TIPO_TABELA = '#39'7'#39')'
      'AND (STATUS = '#39'A'#39')')
    Left = 8
    Top = 424
    ParamData = <
      item
        Name = 'TABELA_ID'
        ParamType = ptInput
      end>
  end
  object QProduto_final: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      'SELECT * FROM PRODUTOS'
      'WHERE'
      '(PRODUTO_ID = :PRODUTO_ID)'
      'AND (EMPRESA_ID = :EMPRESA_ID)'
      'AND (STATUS = '#39'A'#39')')
    Left = 240
    Top = 344
    ParamData = <
      item
        Name = 'PRODUTO_ID'
        ParamType = ptInput
      end
      item
        Name = 'EMPRESA_ID'
        ParamType = ptInput
      end>
  end
  object QSubTipo: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      'SELECT * FROM TABELAS'
      'WHERE'
      '(TABELA_ID = :TABELA_ID)'
      'AND (TIPO_TABELA = '#39'5'#39')'
      'AND (STATUS = '#39'A'#39')')
    Left = 216
    Top = 384
    ParamData = <
      item
        Name = 'TABELA_ID'
        ParamType = ptInput
      end>
  end
  object QProduto_Inicial: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      'SELECT * FROM PRODUTOS'
      'WHERE'
      '(PRODUTO_ID = :PRODUTO_ID)'
      'AND (EMPRESA_ID = :EMPRESA_ID)'
      'AND (STATUS = '#39'A'#39')')
    Left = 176
    Top = 384
    ParamData = <
      item
        Name = 'PRODUTO_ID'
        ParamType = ptInput
      end
      item
        Name = 'EMPRESA_ID'
        ParamType = ptInput
      end>
  end
  object QRel: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afDisable
    Left = 144
    Top = 384
  end
  object QProduto: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      'SELECT * FROM PRODUTOS'
      'WHERE'
      '(PRODUTO_ID = :PRODUTO_ID)'
      'AND (EMPRESA_ID = :EMPRESA_ID)'
      'AND (STATUS = '#39'A'#39')')
    Left = 112
    Top = 384
    ParamData = <
      item
        Name = 'PRODUTO_ID'
        ParamType = ptInput
      end
      item
        Name = 'EMPRESA_ID'
        ParamType = ptInput
      end>
  end
  object QFornecedor: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      'SELECT * FROM FORNECEDORES'
      'WHERE'
      '(FORNECEDOR_ID = :FORNECEDOR_ID)'
      'AND (STATUS = '#39'A'#39')')
    Left = 80
    Top = 384
    ParamData = <
      item
        Name = 'FORNECEDOR_ID'
        ParamType = ptInput
      end>
  end
  object QLocalizacao: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      'SELECT * FROM TABELAS'
      'WHERE'
      '(TABELA_ID = :TABELA_ID)'
      'AND (TIPO_TABELA = '#39'8'#39')'
      'AND (STATUS = '#39'A'#39')')
    Left = 40
    Top = 376
    ParamData = <
      item
        Name = 'TABELA_ID'
        ParamType = ptInput
      end>
  end
  object QTributos: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      'SELECT * FROM TRIBUTOS'
      'WHERE'
      'TRIBUTO_ID = :TRIBUTO_ID')
    Left = 8
    Top = 376
    ParamData = <
      item
        Name = 'TRIBUTO_ID'
        ParamType = ptInput
      end>
  end
  object table_temp: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 40
    Top = 41
    object table_tempproduto_id: TIntegerField
      FieldName = 'produto_id'
    end
    object table_tempdescricao: TStringField
      FieldName = 'descricao'
      Size = 70
    end
    object table_tempcusto: TFloatField
      FieldName = 'custo'
    end
    object table_tempvenda: TFloatField
      FieldName = 'venda'
    end
    object table_tempestoque: TFloatField
      FieldName = 'estoque'
    end
    object table_tempvenda7: TFloatField
      FieldName = 'venda7'
    end
    object table_tempvenda15: TFloatField
      FieldName = 'venda15'
    end
    object table_tempvenda30: TFloatField
      FieldName = 'venda30'
    end
  end
  object QCompra: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      '')
    Left = 8
    Top = 296
  end
end
