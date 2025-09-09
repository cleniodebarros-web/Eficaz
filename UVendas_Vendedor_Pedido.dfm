object FrmVendas_Vendedor_Pedido: TFrmVendas_Vendedor_Pedido
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Vendas por Vendedor - Pedido'
  ClientHeight = 173
  ClientWidth = 340
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
    Top = 9
    Width = 36
    Height = 13
    Caption = 'Per'#237'odo'
  end
  object Label2: TLabel
    Left = 6
    Top = 35
    Width = 46
    Height = 13
    Caption = 'Vendedor'
  end
  object btnVendedor: TSpeedButton
    Left = 158
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
    OnClick = btnVendedorClick
  end
  object Bevel1: TBevel
    Left = 8
    Top = 121
    Width = 315
    Height = 7
    Shape = bsTopLine
  end
  object Label17: TLabel
    Left = 9
    Top = 61
    Width = 31
    Height = 13
    Caption = 'Status'
  end
  object Label3: TLabel
    Left = 8
    Top = 88
    Width = 32
    Height = 13
    Caption = 'Ordem'
  end
  object Dtmen: TDateEdit
    Left = 88
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
    Left = 192
    Top = 6
    Width = 90
    Height = 21
    CheckOnExit = True
    DialogTitle = 'Selecione a Data'
    NumGlyphs = 2
    TabOrder = 1
    OnEnter = DtmenEnter
    OnKeyDown = VendedorKeyDown
  end
  object Vendedor: TCurrencyEdit
    Left = 88
    Top = 31
    Width = 67
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 2
    ZeroEmpty = False
    OnKeyDown = VendedorKeyDown
  end
  object btnRetorna: TBitBtn
    Left = 253
    Top = 134
    Width = 75
    Height = 28
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
    TabOrder = 4
    OnClick = btnRetornaClick
  end
  object btnExecuta: TBitBtn
    Left = 172
    Top = 134
    Width = 75
    Height = 28
    Caption = '&OK'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
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
    ParentFont = False
    TabOrder = 3
    OnClick = btnExecutaClick
  end
  object Rel_Vendas_Vendedor: TQuickRep
    Left = 547
    Top = 31
    Width = 794
    Height = 1123
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
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
    Page.PaperSize = Default
    Page.Continuous = False
    Page.Values = (
      127.000000000000000000
      2970.000000000000000000
      107.000000000000000000
      2100.000000000000000000
      107.000000000000000000
      107.000000000000000000
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
    ReportTitle = 'Vendas por Vendedor'
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
      Left = 40
      Top = 40
      Width = 713
      Height = 73
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        193.145833333333300000
        1886.479166666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
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
      object Cabec: TQRLabel
        Left = 460
        Top = 1
        Width = 253
        Height = 15
        Size.Values = (
          39.687500000000000000
          1217.083333333333000000
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
        Left = 600
        Top = 16
        Width = 113
        Height = 15
        Size.Values = (
          39.687500000000000000
          1587.500000000000000000
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
      object QRLabel3: TQRLabel
        Left = 261
        Top = 31
        Width = 190
        Height = 15
        Size.Values = (
          39.687500000000000000
          690.562500000000000000
          82.020833333333330000
          502.708333333333300000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = True
        Caption = '*** PEDIDOS POR VENDEDOR***'
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
      object QRShape2: TQRShape
        Left = 0
        Top = 80
        Width = 713
        Height = 3
        Size.Values = (
          7.937500000000000000
          0.000000000000000000
          211.666666666666700000
          1886.479166666667000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel13: TQRLabel
        Left = 0
        Top = 54
        Width = 127
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          142.875000000000000000
          336.020833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Per'#237'odo Analisado:'
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
      object QRDBText8: TQRDBText
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
    end
    object QRBand1: TQRBand
      Left = 40
      Top = 193
      Width = 713
      Height = 38
      AlignToBottom = False
      TransparentBand = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      LinkBand = QRBand2
      ParentFont = False
      Size.Values = (
        100.541666666666700000
        1886.479166666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRShape4: TQRShape
        Left = 310
        Top = -1
        Width = 365
        Height = 9
        Size.Values = (
          23.812500000000000000
          820.208333333333300000
          -2.645833333333333000
          965.729166666666700000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel20: TQRLabel
        Left = 244
        Top = 6
        Width = 36
        Height = 15
        Size.Values = (
          39.687500000000000000
          645.583333333333300000
          15.875000000000000000
          95.250000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
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
      object QRExpr2: TQRExpr
        Left = 365
        Top = 6
        Width = 73
        Height = 15
        Size.Values = (
          39.687500000000000000
          965.729166666666700000
          15.875000000000000000
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
        Master = Rel_Vendas_Vendedor
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'Sum(ACRESCIMO)'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRExpr3: TQRExpr
        Left = 442
        Top = 6
        Width = 67
        Height = 15
        Size.Values = (
          39.687500000000000000
          1169.458333333333000000
          15.875000000000000000
          177.270833333333300000)
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
        Master = Rel_Vendas_Vendedor
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'Sum(DESCONTO)'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRExpr4: TQRExpr
        Left = 587
        Top = 6
        Width = 80
        Height = 15
        Size.Values = (
          39.687500000000000000
          1553.104166666667000000
          15.875000000000000000
          211.666666666666700000)
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
        Master = Rel_Vendas_Vendedor
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'Sum(VALOR)'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRExpr8: TQRExpr
        Left = 515
        Top = 6
        Width = 67
        Height = 15
        Size.Values = (
          39.687500000000000000
          1362.604166666667000000
          15.875000000000000000
          177.270833333333300000)
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
        Master = Rel_Vendas_Vendedor
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'Sum(Qrel.DESCONTO_ITEM)'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRExpr10: TQRExpr
        Left = 286
        Top = 6
        Width = 73
        Height = 15
        Size.Values = (
          39.687500000000000000
          756.708333333333300000
          15.875000000000000000
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
        Master = Rel_Vendas_Vendedor
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
      Left = 40
      Top = 113
      Width = 713
      Height = 35
      AlignToBottom = False
      BeforePrint = QRGroup1BeforePrint
      TransparentBand = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        92.604166666666670000
        1886.479166666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'VENDEDOR'
      FooterBand = QRBand2
      Master = Rel_Vendas_Vendedor
      ReprintOnNewPage = False
      object QRDBText3: TQRDBText
        Left = 72
        Top = 3
        Width = 57
        Height = 15
        Size.Values = (
          39.687500000000000000
          190.500000000000000000
          7.937500000000000000
          150.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QRel
        DataField = 'VENDEDOR'
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
      object QRLabel6: TQRLabel
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
      object QRLabel9: TQRLabel
        Left = 5
        Top = 18
        Width = 31
        Height = 15
        Size.Values = (
          39.687500000000000000
          13.229166666666670000
          47.625000000000000000
          82.020833333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Pedido'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel7: TQRLabel
        Left = 58
        Top = 18
        Width = 51
        Height = 15
        Size.Values = (
          39.687500000000000000
          153.458333333333300000
          47.625000000000000000
          134.937500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Documento:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel14: TQRLabel
        Left = 123
        Top = 18
        Width = 26
        Height = 15
        Size.Values = (
          39.687500000000000000
          325.437500000000000000
          47.625000000000000000
          68.791666666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Data:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel16: TQRLabel
        Left = 174
        Top = 16
        Width = 41
        Height = 15
        Size.Values = (
          39.687500000000000000
          460.375000000000000000
          42.333333333333330000
          108.479166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cliente:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel15: TQRLabel
        Left = 666
        Top = 18
        Width = 36
        Height = 15
        Size.Values = (
          39.687500000000000000
          1762.125000000000000000
          47.625000000000000000
          95.250000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Status:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel12: TQRLabel
        Left = 379
        Top = 19
        Width = 67
        Height = 15
        Size.Values = (
          39.687500000000000000
          1002.770833333333000000
          50.270833333333330000
          177.270833333333300000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Acr'#233'scimo'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel8: TQRLabel
        Left = 457
        Top = 19
        Width = 62
        Height = 15
        Size.Values = (
          39.687500000000000000
          1209.145833333333000000
          50.270833333333330000
          164.041666666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Desconto'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel11: TQRLabel
        Left = 593
        Top = 19
        Width = 67
        Height = 15
        Size.Values = (
          39.687500000000000000
          1568.979166666667000000
          50.270833333333330000
          177.270833333333300000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Valor'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel1: TQRLabel
        Left = 521
        Top = 19
        Width = 62
        Height = 15
        Size.Values = (
          39.687500000000000000
          1378.479166666667000000
          50.270833333333330000
          164.041666666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Desc. Item'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel4: TQRLabel
        Left = 310
        Top = 19
        Width = 67
        Height = 15
        Size.Values = (
          39.687500000000000000
          820.208333333333300000
          50.270833333333330000
          177.270833333333300000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Vr. Produtos'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
    end
    object QRBand2: TQRBand
      Left = 40
      Top = 165
      Width = 713
      Height = 28
      AlignToBottom = False
      BeforePrint = QRBand2BeforePrint
      TransparentBand = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      LinkBand = DetailBand1
      ParentFont = False
      Size.Values = (
        74.083333333333330000
        1886.479166666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRShape3: TQRShape
        Left = 304
        Top = 1
        Width = 358
        Height = 7
        Size.Values = (
          18.520833333333330000
          804.333333333333300000
          2.645833333333333000
          947.208333333333300000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel2: TQRLabel
        Left = 252
        Top = 6
        Width = 46
        Height = 15
        Size.Values = (
          39.687500000000000000
          666.750000000000000000
          15.875000000000000000
          121.708333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sub-Total'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRExpr5: TQRExpr
        Left = 369
        Top = 6
        Width = 80
        Height = 15
        Size.Values = (
          39.687500000000000000
          976.312500000000000000
          15.875000000000000000
          211.666666666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Courier New'
        Font.Style = []
        Color = clWhite
        Master = Rel_Vendas_Vendedor
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'Sum(Qrel.ACRESCIMO)'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRExpr6: TQRExpr
        Left = 455
        Top = 6
        Width = 61
        Height = 15
        Size.Values = (
          39.687500000000000000
          1203.854166666667000000
          15.875000000000000000
          161.395833333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Courier New'
        Font.Style = []
        Color = clWhite
        Master = Rel_Vendas_Vendedor
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'Sum(Qrel.DESCONTO)'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel17: TQRLabel
        Left = 5
        Top = 6
        Width = 46
        Height = 15
        Size.Values = (
          39.687500000000000000
          13.229166666666670000
          15.875000000000000000
          121.708333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sub-Total'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel18: TQRLabel
        Left = 146
        Top = 6
        Width = 46
        Height = 15
        Size.Values = (
          39.687500000000000000
          386.291666666666700000
          15.875000000000000000
          121.708333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sub-Total'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRExpr1: TQRExpr
        Left = 582
        Top = 6
        Width = 85
        Height = 15
        Size.Values = (
          39.687500000000000000
          1539.875000000000000000
          15.875000000000000000
          224.895833333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Courier New'
        Font.Style = []
        Color = clWhite
        Master = Rel_Vendas_Vendedor
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'Sum(QRel.VALOR)'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRExpr7: TQRExpr
        Left = 520
        Top = 7
        Width = 61
        Height = 15
        Size.Values = (
          39.687500000000000000
          1375.833333333333000000
          18.520833333333330000
          161.395833333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Courier New'
        Font.Style = []
        Color = clWhite
        Master = Rel_Vendas_Vendedor
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'Sum(Qrel.DESCONTO_ITEM)'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRExpr9: TQRExpr
        Left = 304
        Top = 6
        Width = 66
        Height = 15
        Size.Values = (
          39.687500000000000000
          804.333333333333300000
          15.875000000000000000
          174.625000000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Courier New'
        Font.Style = []
        Color = clWhite
        Master = Rel_Vendas_Vendedor
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'Sum(Qrel.valor_produtos)'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
    end
    object DetailBand1: TQRBand
      Left = 40
      Top = 148
      Width = 713
      Height = 17
      AlignToBottom = False
      BeforePrint = DetailBand1BeforePrint
      TransparentBand = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        44.979166666666670000
        1886.479166666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRDBText9: TQRDBText
        Left = 5
        Top = 3
        Width = 46
        Height = 15
        Size.Values = (
          39.687500000000000000
          13.229166666666670000
          7.937500000000000000
          121.708333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QRel
        DataField = 'pedido_id'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
      object QRDBText12: TQRDBText
        Left = 58
        Top = 3
        Width = 46
        Height = 15
        Size.Values = (
          39.687500000000000000
          153.458333333333300000
          7.937500000000000000
          121.708333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QRel
        DataField = 'DOCUMENTO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
      object QRDBText2: TQRDBText
        Left = 116
        Top = 3
        Width = 46
        Height = 15
        Size.Values = (
          39.687500000000000000
          306.916666666666700000
          7.937500000000000000
          121.708333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QRel
        DataField = 'DT_PEDIDO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
      object QRDBText13: TQRDBText
        Left = 171
        Top = 3
        Width = 150
        Height = 15
        Size.Values = (
          39.687500000000000000
          452.437500000000000000
          7.937500000000000000
          396.875000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
        DataField = 'clientes'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
      object QRDBText6: TQRDBText
        Left = 384
        Top = 3
        Width = 65
        Height = 15
        Size.Values = (
          39.687500000000000000
          1016.000000000000000000
          7.937500000000000000
          171.979166666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
        DataField = 'acrescimo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Mask = '#,##0.00'
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
      object QRDBText5: TQRDBText
        Left = 460
        Top = 3
        Width = 54
        Height = 15
        Size.Values = (
          39.687500000000000000
          1217.083333333333000000
          7.937500000000000000
          142.875000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
        DataField = 'desconto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Mask = '#,##0.00'
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
      object QRDBText7: TQRDBText
        Left = 582
        Top = 3
        Width = 80
        Height = 15
        Size.Values = (
          39.687500000000000000
          1539.875000000000000000
          7.937500000000000000
          211.666666666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
        DataField = 'valor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Mask = '#,##0.00'
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
      object QRDBText11: TQRDBText
        Left = 668
        Top = 3
        Width = 31
        Height = 15
        Size.Values = (
          39.687500000000000000
          1767.416666666667000000
          7.937500000000000000
          82.020833333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QRel
        DataField = 'STATUS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
      object QRDBText1: TQRDBText
        Left = 522
        Top = 3
        Width = 54
        Height = 15
        Size.Values = (
          39.687500000000000000
          1381.125000000000000000
          7.937500000000000000
          142.875000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
        DataField = 'DESCONTO_ITEM'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Mask = '#,##0.00'
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
      object QRDBText4: TQRDBText
        Left = 313
        Top = 2
        Width = 65
        Height = 15
        Size.Values = (
          39.687500000000000000
          828.145833333333300000
          5.291666666666667000
          171.979166666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
        DataField = 'valor_produtos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Mask = '#,##0.00'
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
    end
  end
  object Status: TComboBox
    Left = 88
    Top = 58
    Width = 134
    Height = 21
    CharCase = ecUpperCase
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 2
    ParentFont = False
    TabOrder = 6
    Items.Strings = (
      ''
      'NORMAL'
      'CANCELADO'
      'FATURADO')
  end
  object ORDEM: TComboBox
    Left = 88
    Top = 85
    Width = 134
    Height = 21
    CharCase = ecUpperCase
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 2
    ParentFont = False
    TabOrder = 7
    Items.Strings = (
      ''
      'DATA FATURAMENTO'
      'DATA PEDIDO'
      '')
  end
  object DataVendedor: TDataSource
    DataSet = QVendedor
    Left = 96
    Top = 190
  end
  object QRel: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      
        'SELECT PEDIDOS.VR_ACRESCIMO ACRESCIMO,PEDIDOS.VR_DESCONTO DESCON' +
        'TO, PEDIDOS.VALOR ,PEDIDOS.PEDIDO_ID, PEDIDOS.DT_PEDIDO,PEDIDOS.' +
        'STATUS, FUNCIONARIOS.NOME VENDEDOR,'
      'TRANSACOES.NUM_DOC DOCUMENTO,PEDIDOS.NOME CLIENTES'
      'FROM PEDIDOS'
      ''
      
        'INNER JOIN FUNCIONARIOS ON (FUNCIONARIOS.FUNCIONARIO_ID = PEDIDO' +
        'S.FUNCIONARIO_ID)'
      
        'LEFT JOIN TRANSACOES ON (TRANSACOES.TRANSACAO_ID = PEDIDOS.TRANS' +
        'ACAO_ID)')
    Left = 128
    Top = 264
  end
  object QVendedor: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      'SELECT * FROM TABELAS'
      'WHERE'
      '(TABELA_ID = :TABELA_ID)'
      'AND (TIPO_TABELA = '#39'4'#39')'
      'AND (NIVEL = '#39'ANAL'#205'TICA'#39')'
      'AND (STATUS = '#39'A'#39')')
    Left = 56
    Top = 176
    ParamData = <
      item
        Name = 'TABELA_ID'
        ParamType = ptInput
      end>
  end
  object QQtd_Pedidos: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      
        'SELECT PEDIDOS.PEDIDO_ID, PEDIDOS.DT_PEDIDO,PEDIDOS.STATUS, FUNC' +
        'IONARIOS.NOME VENDEDOR, PEDITENS.*,TRANSACOES.NUM_DOC DOCUMENTO,' +
        'PEDIDOS.NOME CLIENTES'
      'FROM PEDIDOS'
      'INNER JOIN PEDITENS ON(PEDIDOS.PEDIDO_ID = PEDITENS.PEDIDO_ID)'
      
        'INNER JOIN FUNCIONARIOS ON (FUNCIONARIOS.FUNCIONARIO_ID = PEDIDO' +
        'S.FUNCIONARIO_ID)'
      
        'LEFT JOIN TRANSACOES ON (TRANSACOES.TRANSACAO_ID = PEDIDOS.TRANS' +
        'ACAO_ID)')
    Left = 168
    Top = 272
  end
  object QRPDFFilter1: TQRPDFFilter
    CompressionOn = False
    TextEncoding = AnsiEncoding
    Codepage = '1252'
    Left = 344
    Top = 248
  end
end
