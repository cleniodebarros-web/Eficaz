object FrmRelatorio_Custo_Compra_Venda: TFrmRelatorio_Custo_Compra_Venda
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Custo Compra/Venda'
  ClientHeight = 147
  ClientWidth = 365
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
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 6
    Top = 6
    Width = 36
    Height = 13
    Caption = 'Per'#237'odo'
  end
  object Bevel1: TBevel
    Left = 8
    Top = 99
    Width = 329
    Height = 7
    Shape = bsTopLine
  end
  object Label2: TLabel
    Left = 8
    Top = 66
    Width = 38
    Height = 13
    Caption = 'Produto'
  end
  object btnProduto: TSpeedButton
    Left = 122
    Top = 66
    Width = 62
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
    OnClick = btnProdutoClick
  end
  object DBText1: TDBText
    Left = 190
    Top = 66
    Width = 154
    Height = 21
    DataField = 'DESCRICAO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 6
    Top = 36
    Width = 54
    Height = 13
    Caption = 'Filtrar por: '
  end
  object Dtmen: TDateEdit
    Left = 60
    Top = 6
    Width = 90
    Height = 21
    CheckOnExit = True
    DialogTitle = 'Selecione a Data'
    NumGlyphs = 2
    TabOrder = 0
    OnEnter = DtmenEnter
    OnKeyDown = DtmenKeyDown
  end
  object Dtmai: TDateEdit
    Left = 186
    Top = 6
    Width = 90
    Height = 21
    CheckOnExit = True
    DialogTitle = 'Selecione a Data'
    NumGlyphs = 2
    TabOrder = 1
    OnEnter = DtmenEnter
    OnKeyDown = DtmenKeyDown
  end
  object Resumo: TQuickRep
    Left = 133
    Top = 800
    Width = 794
    Height = 1123
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
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Continuous = False
    Page.Values = (
      127.000000000000000000
      2970.000000000000000000
      127.000000000000000000
      2100.000000000000000000
      127.000000000000000000
      127.000000000000000000
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
    ReportTitle = 'Resumo do Movimento Di'#225'rio'
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
      Left = 48
      Top = 48
      Width = 698
      Height = 94
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        248.708333333333300000
        1846.791666666667000000)
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
        Left = 194
        Top = 31
        Width = 309
        Height = 15
        Size.Values = (
          39.687500000000000000
          513.291666666666700000
          82.020833333333330000
          817.562500000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = True
        Caption = '*** RESUMO DO MOV. DI'#193'RIO (CAIXA/BANCOS) ***'
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
        Width = 698
        Height = 4
        Size.Values = (
          10.583333333333330000
          0.000000000000000000
          171.979166666666700000
          1846.791666666667000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape3: TQRShape
        Left = 0
        Top = 88
        Width = 698
        Height = 4
        Size.Values = (
          10.583333333333330000
          0.000000000000000000
          232.833333333333300000
          1846.791666666667000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object Cabec: TQRLabel
        Left = 445
        Top = 1
        Width = 253
        Height = 15
        Size.Values = (
          39.687500000000000000
          1177.395833333333000000
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
        Left = 585
        Top = 16
        Width = 113
        Height = 15
        Size.Values = (
          39.687500000000000000
          1547.812500000000000000
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
        Left = 0
        Top = 71
        Width = 29
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
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
      object QRLabel9: TQRLabel
        Left = 75
        Top = 71
        Width = 50
        Height = 15
        Size.Values = (
          39.687500000000000000
          198.437500000000000000
          187.854166666666700000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'N'#186' Doc.'
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
        Left = 168
        Top = 73
        Width = 64
        Height = 15
        Size.Values = (
          39.687500000000000000
          444.500000000000000000
          193.145833333333300000
          169.333333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Hist'#243'rico'
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
        Left = 458
        Top = 71
        Width = 73
        Height = 15
        Size.Values = (
          39.687500000000000000
          1211.791666666667000000
          187.854166666666700000
          193.145833333333300000)
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
      object QRLabel4: TQRLabel
        Left = 541
        Top = 71
        Width = 73
        Height = 15
        Size.Values = (
          39.687500000000000000
          1431.395833333333000000
          187.854166666666700000
          193.145833333333300000)
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
      object QRLabel5: TQRLabel
        Left = 625
        Top = 71
        Width = 73
        Height = 15
        Size.Values = (
          39.687500000000000000
          1653.645833333333000000
          187.854166666666700000
          193.145833333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Valor'
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
        Left = 319
        Top = 52
        Width = 22
        Height = 15
        Enabled = False
        Size.Values = (
          39.687500000000000000
          844.020833333333300000
          137.583333333333300000
          58.208333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'ECF'
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
      Left = 48
      Top = 176
      Width = 698
      Height = 18
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        47.625000000000000000
        1846.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRDBText2: TQRDBText
        Left = 0
        Top = 1
        Width = 57
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          2.645833333333333000
          150.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QRel
        DataField = 'DT_TRANS'
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
      object QRDBText4: TQRDBText
        Left = 75
        Top = 1
        Width = 50
        Height = 15
        Size.Values = (
          39.687500000000000000
          198.437500000000000000
          2.645833333333333000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QRel
        DataField = 'NUM_DOC'
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
        Left = 167
        Top = 2
        Width = 285
        Height = 15
        Size.Values = (
          39.687500000000000000
          441.854166666666700000
          5.291666666666667000
          754.062500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
        DataField = 'HISTORICO'
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
      object QRDBText6: TQRDBText
        Left = 458
        Top = 1
        Width = 73
        Height = 15
        Size.Values = (
          39.687500000000000000
          1211.791666666667000000
          2.645833333333333000
          193.145833333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
        DataField = 'ACRESCIMO'
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
        Left = 541
        Top = 1
        Width = 73
        Height = 15
        Size.Values = (
          39.687500000000000000
          1431.395833333333000000
          2.645833333333333000
          193.145833333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
        DataField = 'DESCONTO'
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
      object QRDBText8: TQRDBText
        Left = 625
        Top = 1
        Width = 73
        Height = 15
        Size.Values = (
          39.687500000000000000
          1653.645833333333000000
          2.645833333333333000
          193.145833333333300000)
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
    end
    object QRGroup1: TQRGroup
      Left = 48
      Top = 142
      Width = 698
      Height = 34
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        89.958333333333330000
        1846.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'Table_Temp.CONDUTA'
      FooterBand = QRBand1
      Master = Resumo
      ReprintOnNewPage = False
      object QRDBText1: TQRDBText
        Left = 0
        Top = 18
        Width = 50
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          47.625000000000000000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QRel
        DataField = 'CONDUTA'
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
      Left = 48
      Top = 194
      Width = 698
      Height = 24
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        63.500000000000000000
        1846.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRShape2: TQRShape
        Left = 458
        Top = 1
        Width = 73
        Height = 4
        Size.Values = (
          10.583333333333330000
          1211.791666666667000000
          2.645833333333333000
          193.145833333333300000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRExpr1: TQRExpr
        Left = 458
        Top = 5
        Width = 73
        Height = 15
        Size.Values = (
          39.687500000000000000
          1211.791666666667000000
          13.229166666666670000
          193.145833333333300000)
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
        Master = Resumo
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'Sum(Table_Temp.ACRESCIMO)'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape4: TQRShape
        Left = 625
        Top = 1
        Width = 73
        Height = 4
        Size.Values = (
          10.583333333333330000
          1653.645833333333000000
          2.645833333333333000
          193.145833333333300000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRExpr2: TQRExpr
        Left = 625
        Top = 5
        Width = 73
        Height = 15
        Size.Values = (
          39.687500000000000000
          1653.645833333333000000
          13.229166666666670000
          193.145833333333300000)
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
        Master = Resumo
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'Sum(Table_Temp.VALOR)'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape5: TQRShape
        Left = 541
        Top = 1
        Width = 73
        Height = 4
        Size.Values = (
          10.583333333333330000
          1431.395833333333000000
          2.645833333333333000
          193.145833333333300000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRExpr3: TQRExpr
        Left = 541
        Top = 5
        Width = 73
        Height = 15
        Size.Values = (
          39.687500000000000000
          1431.395833333333000000
          13.229166666666670000
          193.145833333333300000)
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
        Master = Resumo
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'Sum(Table_Temp.DESCONTO)'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
    end
  end
  object btnExecuta: TBitBtn
    Left = 178
    Top = 112
    Width = 75
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
    TabOrder = 4
    OnClick = btnExecutaClick
  end
  object btnRetorna: TBitBtn
    Left = 259
    Top = 112
    Width = 75
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
    TabOrder = 5
    OnClick = btnRetornaClick
  end
  object Resumo1: TQuickRep
    Left = 246
    Top = 800
    Width = 794
    Height = 1123
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
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Continuous = False
    Page.Values = (
      127.000000000000000000
      2970.000000000000000000
      127.000000000000000000
      2100.000000000000000000
      127.000000000000000000
      127.000000000000000000
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
    ReportTitle = 'Resumo do Movimento Di'#225'rio'
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
      Left = 48
      Top = 48
      Width = 698
      Height = 94
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        248.708333333333300000
        1846.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbColumnHeader
      object QRDBText10: TQRDBText
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
      object QRSysData3: TQRSysData
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
      object QRLabel6: TQRLabel
        Left = 191
        Top = 31
        Width = 316
        Height = 15
        Size.Values = (
          39.687500000000000000
          505.354166666666700000
          82.020833333333330000
          836.083333333333300000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = True
        Caption = '*** RELAT'#211'RIO DE VENDAS POR FINALIZADORAS ***'
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
      object QRLabel7: TQRLabel
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
      object QRShape6: TQRShape
        Left = 0
        Top = 65
        Width = 698
        Height = 4
        Size.Values = (
          10.583333333333330000
          0.000000000000000000
          171.979166666666700000
          1846.791666666667000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape7: TQRShape
        Left = 0
        Top = 88
        Width = 698
        Height = 4
        Size.Values = (
          10.583333333333330000
          0.000000000000000000
          232.833333333333300000
          1846.791666666667000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel11: TQRLabel
        Left = 445
        Top = 1
        Width = 253
        Height = 15
        Size.Values = (
          39.687500000000000000
          1177.395833333333000000
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
      object QRSysData4: TQRSysData
        Left = 585
        Top = 16
        Width = 113
        Height = 15
        Size.Values = (
          39.687500000000000000
          1547.812500000000000000
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
      object QRLabel12: TQRLabel
        Left = 0
        Top = 71
        Width = 29
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
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
      object QRLabel13: TQRLabel
        Left = 73
        Top = 71
        Width = 50
        Height = 15
        Size.Values = (
          39.687500000000000000
          193.145833333333300000
          187.854166666666700000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'N'#186' Doc.'
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
        Left = 138
        Top = 71
        Width = 50
        Height = 15
        Size.Values = (
          39.687500000000000000
          365.125000000000000000
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
      object QRLabel15: TQRLabel
        Left = 458
        Top = 71
        Width = 73
        Height = 15
        Size.Values = (
          39.687500000000000000
          1211.791666666667000000
          187.854166666666700000
          193.145833333333300000)
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
      object QRLabel16: TQRLabel
        Left = 541
        Top = 71
        Width = 73
        Height = 15
        Size.Values = (
          39.687500000000000000
          1431.395833333333000000
          187.854166666666700000
          193.145833333333300000)
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
      object QRLabel17: TQRLabel
        Left = 625
        Top = 71
        Width = 73
        Height = 15
        Size.Values = (
          39.687500000000000000
          1653.645833333333000000
          187.854166666666700000
          193.145833333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Valor'
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
      object QRLabel18: TQRLabel
        Left = 319
        Top = 52
        Width = 22
        Height = 15
        Enabled = False
        Size.Values = (
          39.687500000000000000
          844.020833333333300000
          137.583333333333300000
          58.208333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'ECF'
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
      object QRLabel46: TQRLabel
        Left = 408
        Top = 71
        Width = 50
        Height = 15
        Size.Values = (
          39.687500000000000000
          1079.500000000000000000
          187.854166666666700000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Parcela'
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
      Left = 48
      Top = 176
      Width = 698
      Height = 18
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        47.625000000000000000
        1846.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRDBText11: TQRDBText
        Left = 0
        Top = 1
        Width = 57
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          2.645833333333333000
          150.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QRel
        DataField = 'DT_TRANS'
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
      object QRDBText12: TQRDBText
        Left = 75
        Top = 1
        Width = 50
        Height = 15
        Size.Values = (
          39.687500000000000000
          198.437500000000000000
          2.645833333333333000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QRel
        DataField = 'NUM_DOC'
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
      object QRDBText13: TQRDBText
        Left = 138
        Top = 2
        Width = 265
        Height = 15
        Size.Values = (
          39.687500000000000000
          365.125000000000000000
          5.291666666666667000
          701.145833333333200000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
        DataField = 'NOME'
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
      object QRDBText14: TQRDBText
        Left = 458
        Top = 1
        Width = 73
        Height = 15
        Size.Values = (
          39.687500000000000000
          1211.791666666667000000
          2.645833333333333000
          193.145833333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
        DataField = 'ACRESCIMO'
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
      object QRDBText15: TQRDBText
        Left = 541
        Top = 1
        Width = 73
        Height = 15
        Size.Values = (
          39.687500000000000000
          1431.395833333333000000
          2.645833333333333000
          193.145833333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
        DataField = 'DESCONTO'
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
      object QRDBText16: TQRDBText
        Left = 625
        Top = 1
        Width = 73
        Height = 15
        Size.Values = (
          39.687500000000000000
          1653.645833333333000000
          2.645833333333333000
          193.145833333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
        DataField = 'VALOR_REC'
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
      object QRDBText36: TQRDBText
        Left = 409
        Top = 2
        Width = 64
        Height = 15
        Size.Values = (
          39.687500000000000000
          1082.145833333333000000
          5.291666666666667000
          169.333333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QRel
        DataField = 'historico'
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
    end
    object QRGroup2: TQRGroup
      Left = 48
      Top = 142
      Width = 698
      Height = 34
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        89.958333333333330000
        1846.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'Table_Temp.CONDUTA'
      FooterBand = QRBand4
      Master = Resumo1
      ReprintOnNewPage = False
      object QRDBText18: TQRDBText
        Left = 0
        Top = 18
        Width = 50
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          47.625000000000000000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QRel
        DataField = 'CONDUTA'
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
    object QRBand4: TQRBand
      Left = 48
      Top = 194
      Width = 698
      Height = 24
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        63.500000000000000000
        1846.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRShape8: TQRShape
        Left = 458
        Top = 1
        Width = 73
        Height = 4
        Size.Values = (
          10.583333333333330000
          1211.791666666667000000
          2.645833333333333000
          193.145833333333300000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRExpr4: TQRExpr
        Left = 458
        Top = 5
        Width = 73
        Height = 15
        Size.Values = (
          39.687500000000000000
          1211.791666666667000000
          13.229166666666670000
          193.145833333333300000)
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
        Master = Resumo1
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'Sum(Table_Temp.ACRESCIMO)'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape9: TQRShape
        Left = 625
        Top = 1
        Width = 73
        Height = 4
        Size.Values = (
          10.583333333333330000
          1653.645833333333000000
          2.645833333333333000
          193.145833333333300000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRExpr5: TQRExpr
        Left = 625
        Top = 5
        Width = 73
        Height = 15
        Size.Values = (
          39.687500000000000000
          1653.645833333333000000
          13.229166666666670000
          193.145833333333300000)
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
        Master = Resumo1
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'Sum(Table_Temp.VALOR_REC)'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape10: TQRShape
        Left = 541
        Top = 1
        Width = 73
        Height = 4
        Size.Values = (
          10.583333333333330000
          1431.395833333333000000
          2.645833333333333000
          193.145833333333300000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRExpr6: TQRExpr
        Left = 541
        Top = 5
        Width = 73
        Height = 15
        Size.Values = (
          39.687500000000000000
          1431.395833333333000000
          13.229166666666670000
          193.145833333333300000)
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
        Master = Resumo1
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'Sum(Table_Temp.DESCONTO)'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
    end
  end
  object Detalhe_conta: TQuickRep
    Left = 202
    Top = 800
    Width = 794
    Height = 1123
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
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Continuous = False
    Page.Values = (
      127.000000000000000000
      2970.000000000000000000
      127.000000000000000000
      2100.000000000000000000
      127.000000000000000000
      127.000000000000000000
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
    ReportTitle = 'Resumo do Movimento Di'#225'rio'
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
    object QRBand7: TQRBand
      Left = 48
      Top = 48
      Width = 698
      Height = 94
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        248.708333333333300000
        1846.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbColumnHeader
      object QRDBText21: TQRDBText
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
      object QRSysData7: TQRSysData
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
      object QRLabel27: TQRLabel
        Left = 170
        Top = 31
        Width = 358
        Height = 15
        Size.Values = (
          39.687500000000000000
          449.791666666666700000
          82.020833333333330000
          947.208333333333300000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = True
        Caption = '*** RESUMO DO MOV. DI'#193'RIO (DETALHADO POR CONTA) ***'
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
      object QRLabel28: TQRLabel
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
      object QRShape14: TQRShape
        Left = 0
        Top = 65
        Width = 698
        Height = 4
        Size.Values = (
          10.583333333333330000
          0.000000000000000000
          171.979166666666700000
          1846.791666666667000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape15: TQRShape
        Left = 0
        Top = 88
        Width = 698
        Height = 4
        Size.Values = (
          10.583333333333330000
          0.000000000000000000
          232.833333333333300000
          1846.791666666667000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel29: TQRLabel
        Left = 445
        Top = 1
        Width = 253
        Height = 15
        Size.Values = (
          39.687500000000000000
          1177.395833333333000000
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
      object QRSysData8: TQRSysData
        Left = 585
        Top = 16
        Width = 113
        Height = 15
        Size.Values = (
          39.687500000000000000
          1547.812500000000000000
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
      object QRLabel30: TQRLabel
        Left = 0
        Top = 71
        Width = 29
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
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
      object QRLabel31: TQRLabel
        Left = 75
        Top = 71
        Width = 50
        Height = 15
        Size.Values = (
          39.687500000000000000
          198.437500000000000000
          187.854166666666700000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'N'#186' Doc.'
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
      object QRLabel32: TQRLabel
        Left = 167
        Top = 71
        Width = 64
        Height = 15
        Size.Values = (
          39.687500000000000000
          441.854166666666700000
          187.854166666666700000
          169.333333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Hist'#243'rico'
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
      object QRLabel33: TQRLabel
        Left = 538
        Top = 71
        Width = 73
        Height = 15
        Size.Values = (
          39.687500000000000000
          1423.458333333333000000
          187.854166666666700000
          193.145833333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Cr'#233'dito'
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
      object QRLabel34: TQRLabel
        Left = 621
        Top = 71
        Width = 73
        Height = 15
        Size.Values = (
          39.687500000000000000
          1643.062500000000000000
          187.854166666666700000
          193.145833333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'D'#233'bito'
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
      object QRLabel36: TQRLabel
        Left = 319
        Top = 52
        Width = 64
        Height = 15
        Enabled = False
        Size.Values = (
          39.687500000000000000
          844.020833333333300000
          137.583333333333300000
          169.333333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'RELAT'#211'RIO'
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
    object QRBand8: TQRBand
      Left = 48
      Top = 164
      Width = 698
      Height = 18
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        47.625000000000000000
        1846.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRDBText22: TQRDBText
        Left = 0
        Top = 1
        Width = 57
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          2.645833333333333000
          150.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QRel
        DataField = 'DT_TRANS'
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
      object QRDBText23: TQRDBText
        Left = 75
        Top = 1
        Width = 50
        Height = 15
        Size.Values = (
          39.687500000000000000
          198.437500000000000000
          2.645833333333333000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QRel
        DataField = 'NUM_DOC'
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
      object QRDBText24: TQRDBText
        Left = 167
        Top = 2
        Width = 341
        Height = 15
        Size.Values = (
          39.687500000000000000
          441.854166666666700000
          5.291666666666667000
          902.229166666666800000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
        DataField = 'HISTORICO'
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
      object QRDBText25: TQRDBText
        Left = 540
        Top = 1
        Width = 73
        Height = 15
        Size.Values = (
          39.687500000000000000
          1428.750000000000000000
          2.645833333333333000
          193.145833333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
        DataField = 'CREDITO'
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
      object QRDBText26: TQRDBText
        Left = 623
        Top = 1
        Width = 73
        Height = 15
        Size.Values = (
          39.687500000000000000
          1648.354166666667000000
          2.645833333333333000
          193.145833333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
        DataField = 'DEBITO'
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
    end
    object QRGroup3: TQRGroup
      Left = 48
      Top = 142
      Width = 698
      Height = 22
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        58.208333333333330000
        1846.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'QRel.Descricao'
      FooterBand = QRBand9
      Master = Detalhe_conta
      ReprintOnNewPage = False
      object QRDBText28: TQRDBText
        Left = 0
        Top = 3
        Width = 64
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          7.937500000000000000
          169.333333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QRel
        DataField = 'DESCRICAO'
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
    object QRBand9: TQRBand
      Left = 48
      Top = 182
      Width = 698
      Height = 24
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        63.500000000000000000
        1846.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRShape16: TQRShape
        Left = 544
        Top = 1
        Width = 73
        Height = 4
        Size.Values = (
          10.583333333333330000
          1439.333333333333000000
          2.645833333333333000
          193.145833333333300000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRExpr11: TQRExpr
        Left = 542
        Top = 5
        Width = 73
        Height = 15
        Size.Values = (
          39.687500000000000000
          1434.041666666667000000
          13.229166666666670000
          193.145833333333300000)
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
        Master = Detalhe_conta
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'Sum(QRel.CREDITO)'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape18: TQRShape
        Left = 627
        Top = 1
        Width = 73
        Height = 4
        Size.Values = (
          10.583333333333330000
          1658.937500000000000000
          2.645833333333333000
          193.145833333333300000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRExpr13: TQRExpr
        Left = 625
        Top = 5
        Width = 73
        Height = 15
        Size.Values = (
          39.687500000000000000
          1653.645833333333000000
          13.229166666666670000
          193.145833333333300000)
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
        Master = Detalhe_conta
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'Sum(QREL.DEBITO)'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
    end
  end
  object Resumo_Sintetico: TQuickRep
    Left = 181
    Top = 800
    Width = 794
    Height = 1123
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
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Continuous = False
    Page.Values = (
      127.000000000000000000
      2970.000000000000000000
      127.000000000000000000
      2100.000000000000000000
      127.000000000000000000
      127.000000000000000000
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
    ReportTitle = 'Fluxo da Movimenta'#231#227'o Financeira'
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
    object QRBand5: TQRBand
      Left = 48
      Top = 48
      Width = 698
      Height = 94
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        248.708333333333300000
        1846.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object QRDBText9: TQRDBText
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
      object QRSysData5: TQRSysData
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
      object QRLabel20: TQRLabel
        Left = 163
        Top = 31
        Width = 372
        Height = 15
        Size.Values = (
          39.687500000000000000
          431.270833333333300000
          82.020833333333330000
          984.250000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = True
        Caption = '*** DEMONSTRATIVO FLUXO FINANCEIRO (CAIXA/BANCOS) ***'
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
      object QRLabel21: TQRLabel
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
      object QRShape11: TQRShape
        Left = 0
        Top = 65
        Width = 698
        Height = 4
        Size.Values = (
          10.583333333333330000
          0.000000000000000000
          171.979166666666700000
          1846.791666666667000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape12: TQRShape
        Left = 0
        Top = 88
        Width = 698
        Height = 4
        Size.Values = (
          10.583333333333330000
          0.000000000000000000
          232.833333333333300000
          1846.791666666667000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel22: TQRLabel
        Left = 445
        Top = 5
        Width = 253
        Height = 15
        Size.Values = (
          39.687500000000000000
          1177.395833333333000000
          13.229166666666670000
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
      object QRSysData6: TQRSysData
        Left = 585
        Top = 16
        Width = 113
        Height = 15
        Size.Values = (
          39.687500000000000000
          1547.812500000000000000
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
      object QRLabel23: TQRLabel
        Left = 0
        Top = 71
        Width = 127
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          187.854166666666700000
          336.020833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Descri'#231#227'o da Conta'
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
        Left = 521
        Top = 71
        Width = 83
        Height = 15
        Size.Values = (
          39.687500000000000000
          1378.479166666667000000
          187.854166666666700000
          219.604166666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'D'#233'bito'
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
        Left = 615
        Top = 71
        Width = 83
        Height = 15
        Size.Values = (
          39.687500000000000000
          1627.187500000000000000
          187.854166666666700000
          219.604166666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Saldo'
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
        Left = 427
        Top = 71
        Width = 83
        Height = 15
        Size.Values = (
          39.687500000000000000
          1129.770833333333000000
          187.854166666666700000
          219.604166666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Cr'#233'dito'
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
    object QRBand6: TQRBand
      Left = 48
      Top = 142
      Width = 698
      Height = 18
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        47.625000000000000000
        1846.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRDBText17: TQRDBText
        Left = 0
        Top = 1
        Width = 409
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          2.645833333333333000
          1082.145833333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
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
      object QRDBText19: TQRDBText
        Left = 521
        Top = 1
        Width = 83
        Height = 15
        Size.Values = (
          39.687500000000000000
          1378.479166666667000000
          2.645833333333333000
          219.604166666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
        DataField = 'DEBITO'
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
      object QRDBText20: TQRDBText
        Left = 427
        Top = 1
        Width = 83
        Height = 15
        Size.Values = (
          39.687500000000000000
          1129.770833333333000000
          2.645833333333333000
          219.604166666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
        DataField = 'CREDITO'
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
      object QRExpr7: TQRExpr
        Left = 610
        Top = 4
        Width = 83
        Height = 15
        Size.Values = (
          39.687500000000000000
          1613.958333333333000000
          10.583333333333330000
          219.604166666666700000)
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
        Master = Resumo_Sintetico
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = '(QRel.CREDITO - QRel.DEBITO)'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
    end
    object SummaryBand1: TQRBand
      Left = 48
      Top = 160
      Width = 698
      Height = 24
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        63.500000000000000000
        1846.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRShape13: TQRShape
        Left = 427
        Top = 1
        Width = 271
        Height = 4
        Size.Values = (
          10.583333333333330000
          1129.770833333333000000
          2.645833333333333000
          717.020833333333200000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRExpr8: TQRExpr
        Left = 427
        Top = 7
        Width = 83
        Height = 15
        Size.Values = (
          39.687500000000000000
          1129.770833333333000000
          18.520833333333330000
          219.604166666666700000)
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
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'Sum(QRel.CREDITO)'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRExpr9: TQRExpr
        Left = 521
        Top = 7
        Width = 83
        Height = 15
        Size.Values = (
          39.687500000000000000
          1378.479166666667000000
          18.520833333333330000
          219.604166666666700000)
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
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'Sum(QRel.DEBITO)'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRExpr10: TQRExpr
        Left = 615
        Top = 7
        Width = 83
        Height = 15
        Size.Values = (
          39.687500000000000000
          1627.187500000000000000
          18.520833333333330000
          219.604166666666700000)
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
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'Sum(QRel.CREDITO - QRel.DEBITO)'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
    end
  end
  object Resumo2: TQuickRep
    Left = 246
    Top = 800
    Width = 794
    Height = 1123
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
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Continuous = False
    Page.Values = (
      127.000000000000000000
      2970.000000000000000000
      127.000000000000000000
      2100.000000000000000000
      127.000000000000000000
      127.000000000000000000
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
    ReportTitle = 'Resumo do Movimento Di'#225'rio'
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
    object QRBand10: TQRBand
      Left = 48
      Top = 48
      Width = 698
      Height = 94
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        248.708333333333300000
        1846.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbColumnHeader
      object QRDBText27: TQRDBText
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
      object QRSysData9: TQRSysData
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
      object QRLabel35: TQRLabel
        Left = 191
        Top = 31
        Width = 316
        Height = 15
        Size.Values = (
          39.687500000000000000
          505.354166666666700000
          82.020833333333330000
          836.083333333333300000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = True
        Caption = '*** RELAT'#211'RIO DE VENDAS POR FINALIZADORAS ***'
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
      object QRLabel37: TQRLabel
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
      object QRShape17: TQRShape
        Left = 0
        Top = 65
        Width = 698
        Height = 4
        Size.Values = (
          10.583333333333330000
          0.000000000000000000
          171.979166666666700000
          1846.791666666667000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape19: TQRShape
        Left = 0
        Top = 88
        Width = 698
        Height = 4
        Size.Values = (
          10.583333333333330000
          0.000000000000000000
          232.833333333333300000
          1846.791666666667000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel38: TQRLabel
        Left = 445
        Top = 1
        Width = 253
        Height = 15
        Size.Values = (
          39.687500000000000000
          1177.395833333333000000
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
      object QRSysData10: TQRSysData
        Left = 585
        Top = 16
        Width = 113
        Height = 15
        Size.Values = (
          39.687500000000000000
          1547.812500000000000000
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
      object QRLabel39: TQRLabel
        Left = 0
        Top = 71
        Width = 29
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          187.854166666666700000
          76.729166666666680000)
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
      object QRLabel40: TQRLabel
        Left = 75
        Top = 71
        Width = 50
        Height = 15
        Size.Values = (
          39.687500000000000000
          198.437500000000000000
          187.854166666666700000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'N'#186' Doc.'
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
      object QRLabel41: TQRLabel
        Left = 167
        Top = 71
        Width = 85
        Height = 15
        Size.Values = (
          39.687500000000000000
          441.854166666666700000
          187.854166666666700000
          224.895833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Finalizadora'
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
      object QRLabel42: TQRLabel
        Left = 458
        Top = 71
        Width = 73
        Height = 15
        Size.Values = (
          39.687500000000000000
          1211.791666666667000000
          187.854166666666700000
          193.145833333333300000)
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
      object QRLabel43: TQRLabel
        Left = 541
        Top = 71
        Width = 73
        Height = 15
        Size.Values = (
          39.687500000000000000
          1431.395833333333000000
          187.854166666666700000
          193.145833333333300000)
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
      object QRLabel44: TQRLabel
        Left = 625
        Top = 71
        Width = 73
        Height = 15
        Size.Values = (
          39.687500000000000000
          1653.645833333333000000
          187.854166666666700000
          193.145833333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Valor'
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
      object QRLabel45: TQRLabel
        Left = 319
        Top = 52
        Width = 22
        Height = 15
        Enabled = False
        Size.Values = (
          39.687500000000000000
          844.020833333333200000
          137.583333333333300000
          58.208333333333320000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'ECF'
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
    object QRBand11: TQRBand
      Left = 48
      Top = 176
      Width = 698
      Height = 18
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        47.625000000000000000
        1846.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRDBText29: TQRDBText
        Left = 0
        Top = 1
        Width = 57
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          2.645833333333333000
          150.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataField = 'DT_TRANS'
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
      object QRDBText30: TQRDBText
        Left = 75
        Top = 1
        Width = 50
        Height = 15
        Size.Values = (
          39.687500000000000000
          198.437500000000000000
          2.645833333333333000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataField = 'NUM_DOC'
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
      object QRDBText31: TQRDBText
        Left = 167
        Top = 2
        Width = 285
        Height = 15
        Size.Values = (
          39.687500000000000000
          441.854166666666700000
          5.291666666666667000
          754.062500000000000000)
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
      object QRDBText32: TQRDBText
        Left = 458
        Top = 1
        Width = 73
        Height = 15
        Size.Values = (
          39.687500000000000000
          1211.791666666667000000
          2.645833333333333000
          193.145833333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = 'ACRESCIMO'
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
      object QRDBText33: TQRDBText
        Left = 541
        Top = 1
        Width = 73
        Height = 15
        Size.Values = (
          39.687500000000000000
          1431.395833333333000000
          2.645833333333333000
          193.145833333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = 'DESCONTO'
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
      object QRDBText34: TQRDBText
        Left = 625
        Top = 1
        Width = 73
        Height = 15
        Size.Values = (
          39.687500000000000000
          1653.645833333333000000
          2.645833333333333000
          193.145833333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
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
    end
    object QRGroup4: TQRGroup
      Left = 48
      Top = 142
      Width = 698
      Height = 34
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        89.958333333333330000
        1846.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'Table_Temp.CONDUTA'
      FooterBand = QRBand12
      Master = Resumo2
      ReprintOnNewPage = False
      object QRDBText35: TQRDBText
        Left = 0
        Top = 18
        Width = 50
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          47.625000000000000000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataField = 'CONDUTA'
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
    object QRBand12: TQRBand
      Left = 48
      Top = 194
      Width = 698
      Height = 24
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        63.500000000000000000
        1846.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRShape20: TQRShape
        Left = 458
        Top = 1
        Width = 73
        Height = 4
        Size.Values = (
          10.583333333333330000
          1211.791666666667000000
          2.645833333333333000
          193.145833333333300000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRExpr12: TQRExpr
        Left = 458
        Top = 5
        Width = 73
        Height = 15
        Size.Values = (
          39.687500000000000000
          1211.791666666667000000
          13.229166666666670000
          193.145833333333300000)
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
        Master = Resumo2
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'Sum(Table_Temp.ACRESCIMO)'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape21: TQRShape
        Left = 625
        Top = 1
        Width = 73
        Height = 4
        Size.Values = (
          10.583333333333330000
          1653.645833333333000000
          2.645833333333333000
          193.145833333333300000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRExpr14: TQRExpr
        Left = 625
        Top = 5
        Width = 73
        Height = 15
        Size.Values = (
          39.687500000000000000
          1653.645833333333000000
          13.229166666666670000
          193.145833333333300000)
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
        Master = Resumo2
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'Sum(Table_Temp.VALOR)'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape22: TQRShape
        Left = 541
        Top = 1
        Width = 73
        Height = 4
        Size.Values = (
          10.583333333333330000
          1431.395833333333000000
          2.645833333333333000
          193.145833333333300000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRExpr15: TQRExpr
        Left = 541
        Top = 5
        Width = 73
        Height = 15
        Size.Values = (
          39.687500000000000000
          1431.395833333333000000
          13.229166666666670000
          193.145833333333300000)
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
        Master = Resumo2
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'Sum(Table_Temp.DESCONTO)'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
    end
  end
  object CheckBox1: TCheckBox
    Left = 8
    Top = 112
    Width = 104
    Height = 17
    Caption = 'Imp. HP/Samsung'
    TabOrder = 6
  end
  object Produto: TCurrencyEdit
    Left = 60
    Top = 66
    Width = 62
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 3
    ZeroEmpty = False
    OnKeyDown = ProdutoKeyDown
  end
  object Cbx_filtro: TComboBox
    Left = 60
    Top = 36
    Width = 145
    Height = 21
    Style = csDropDownList
    CharCase = ecUpperCase
    TabOrder = 2
    Items.Strings = (
      'DATA DA COMPRA'
      'DATA DA VENDA')
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
    FonteTamanhoPadrao = S17cpp
    FonteEstiloPadrao = []
    Orientacao = poPortrait
    OnNewPage = RDprint1NewPage
    Left = 80
    Top = 192
  end
  object DataProduto: TDataSource
    DataSet = QProduto
    Left = 16
    Top = 190
  end
  object QRel: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      'SELECT * FROM EMPRESAS'
      'WHERE'
      '(EMPRESA_ID = :EMPRESA_ID)'
      'AND (STATUS = '#39'A'#39')')
    Left = 8
    Top = 144
    ParamData = <
      item
        Name = 'EMPRESA_ID'
        ParamType = ptInput
        Value = Null
      end>
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
    Left = 48
    Top = 144
    ParamData = <
      item
        Name = 'PRODUTO_ID'
        ParamType = ptInput
      end
      item
        Name = 'EMPRESA_ID'
        ParamType = ptInput
        Value = Null
      end>
  end
end
