object FrmRegistro_Apuracao_ICMS: TFrmRegistro_Apuracao_ICMS
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Registro de Apura'#231#227'o do ICMS (P9)'
  ClientHeight = 146
  ClientWidth = 319
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
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 6
    Top = 97
    Width = 300
    Height = 9
    Shape = bsTopLine
  end
  object Dtmen: TDateEdit
    Left = 69
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
    Left = 216
    Top = 8
    Width = 90
    Height = 21
    CheckOnExit = True
    DialogTitle = 'Selecione a Data'
    NumGlyphs = 2
    TabOrder = 1
    OnEnter = DtmenEnter
    OnKeyDown = DtmenKeyDown
  end
  object Apuracao_ICMS: TQuickRep
    Left = 45
    Top = 328
    Width = 794
    Height = 1123
    DataSet = Table_Temp
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
    Page.Orientation = poPortrait
    Page.PaperSize = Default
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
    ReportTitle = 'Apura'#231#227'o do ICMS'
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
      Top = 237
      Width = 698
      Height = 36
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        95.250000000000000000
        1846.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRShape20: TQRShape
        Left = 2
        Top = 2
        Width = 694
        Height = 34
        Size.Values = (
          89.958333333333330000
          5.291666666666667000
          5.291666666666667000
          1836.208333333333000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape22: TQRShape
        Left = 64
        Top = 3
        Width = 4
        Height = 33
        Size.Values = (
          87.312500000000000000
          169.333333333333300000
          7.937500000000000000
          10.583333333333330000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape23: TQRShape
        Left = 334
        Top = 3
        Width = 4
        Height = 33
        Size.Values = (
          87.312500000000000000
          883.708333333333300000
          7.937500000000000000
          10.583333333333330000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape24: TQRShape
        Left = 458
        Top = 3
        Width = 4
        Height = 33
        Size.Values = (
          87.312500000000000000
          1211.791666666667000000
          7.937500000000000000
          10.583333333333330000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape25: TQRShape
        Left = 580
        Top = 3
        Width = 4
        Height = 33
        Size.Values = (
          87.312500000000000000
          1534.583333333333000000
          7.937500000000000000
          10.583333333333330000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape26: TQRShape
        Left = 116
        Top = 3
        Width = 4
        Height = 33
        Size.Values = (
          87.312500000000000000
          306.916666666666700000
          7.937500000000000000
          10.583333333333330000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape27: TQRShape
        Left = 220
        Top = 3
        Width = 4
        Height = 33
        Size.Values = (
          87.312500000000000000
          582.083333333333300000
          7.937500000000000000
          10.583333333333330000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRDBText3: TQRDBText
        Left = 69
        Top = 12
        Width = 47
        Height = 15
        Size.Values = (
          39.687500000000000000
          182.562500000000000000
          31.750000000000000000
          124.354166666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = Table_Temp
        DataField = 'CFOP'
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
      object QRDBText5: TQRDBText
        Left = 120
        Top = 12
        Width = 100
        Height = 15
        Size.Values = (
          39.687500000000000000
          317.500000000000000000
          31.750000000000000000
          264.583333333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = Table_Temp
        DataField = 'CONTABIL'
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
        Left = 224
        Top = 12
        Width = 110
        Height = 15
        Size.Values = (
          39.687500000000000000
          592.666666666666700000
          31.750000000000000000
          291.041666666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = Table_Temp
        DataField = 'BASE_CALCULO'
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
        Left = 339
        Top = 12
        Width = 119
        Height = 15
        Size.Values = (
          39.687500000000000000
          896.937500000000000000
          31.750000000000000000
          314.854166666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = Table_Temp
        DataField = 'IMP_CREDITADO'
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
        Left = 462
        Top = 12
        Width = 116
        Height = 15
        Size.Values = (
          39.687500000000000000
          1222.375000000000000000
          31.750000000000000000
          306.916666666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = Table_Temp
        DataField = 'ISENTAS'
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
      object QRDBText9: TQRDBText
        Left = 584
        Top = 12
        Width = 110
        Height = 15
        Size.Values = (
          39.687500000000000000
          1545.166666666667000000
          31.750000000000000000
          291.041666666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = Table_Temp
        DataField = 'OUTRAS'
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
    object QRBand1: TQRBand
      Left = 48
      Top = 48
      Width = 698
      Height = 90
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        238.125000000000000000
        1846.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object QRShape1: TQRShape
        Left = 2
        Top = 0
        Width = 694
        Height = 88
        Size.Values = (
          232.833333333333300000
          5.291666666666667000
          0.000000000000000000
          1836.208333333333000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel1: TQRLabel
        Left = 166
        Top = 5
        Width = 365
        Height = 24
        Size.Values = (
          63.500000000000000000
          439.208333333333300000
          13.229166666666670000
          965.729166666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = True
        Caption = 'REGISTRO DE APURA'#199#195'O DO ICMS'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 16
      end
      object QRShape2: TQRShape
        Left = 2
        Top = 29
        Width = 694
        Height = 4
        Size.Values = (
          10.583333333333330000
          5.291666666666667000
          76.729166666666670000
          1836.208333333333000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel2: TQRLabel
        Left = 4
        Top = 35
        Width = 85
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          92.604166666666670000
          224.895833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Contribuinte'
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
      object QRLabel3: TQRLabel
        Left = 4
        Top = 52
        Width = 106
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          137.583333333333300000
          280.458333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Inscr. Estadual'
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
        Left = 4
        Top = 69
        Width = 43
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          182.562500000000000000
          113.770833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'P'#225'gina'
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
        Left = 392
        Top = 52
        Width = 29
        Height = 15
        Size.Values = (
          39.687500000000000000
          1037.166666666667000000
          137.583333333333300000
          76.729166666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'CNPJ'
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
        Left = 392
        Top = 69
        Width = 50
        Height = 15
        Size.Values = (
          39.687500000000000000
          1037.166666666667000000
          182.562500000000000000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Per'#237'odo'
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
      object QRDBText1: TQRDBText
        Left = 120
        Top = 35
        Width = 36
        Height = 15
        Size.Values = (
          39.687500000000000000
          317.500000000000000000
          92.604166666666670000
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
      object QRDBText2: TQRDBText
        Left = 120
        Top = 52
        Width = 99
        Height = 15
        Size.Values = (
          39.687500000000000000
          317.500000000000000000
          137.583333333333300000
          261.937500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = FrmPrincipal.QEmpresa
        DataField = 'INSCR_ESTADUAL'
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
        Left = 456
        Top = 52
        Width = 29
        Height = 15
        Size.Values = (
          39.687500000000000000
          1206.500000000000000000
          137.583333333333300000
          76.729166666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = FrmPrincipal.QEmpresa
        DataField = 'CNPJ'
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
        Left = 120
        Top = 69
        Width = 50
        Height = 15
        Size.Values = (
          39.687500000000000000
          317.500000000000000000
          182.562500000000000000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Text = ''
        Transparent = False
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel25: TQRLabel
        Left = 456
        Top = 69
        Width = 50
        Height = 15
        Size.Values = (
          39.687500000000000000
          1206.500000000000000000
          182.562500000000000000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Per'#237'odo'
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
    object QRGroup1: TQRGroup
      Left = 48
      Top = 138
      Width = 698
      Height = 99
      AlignToBottom = False
      BeforePrint = QRGroup1BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        261.937500000000000000
        1846.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'SUB_TIT'
      FooterBand = QRBand3
      Master = Apuracao_ICMS
      ReprintOnNewPage = False
      object QRShape3: TQRShape
        Left = 2
        Top = 2
        Width = 694
        Height = 97
        Size.Values = (
          256.645833333333300000
          5.291666666666667000
          5.291666666666667000
          1836.208333333333000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel7: TQRLabel
        Left = 251
        Top = 5
        Width = 196
        Height = 24
        Size.Values = (
          63.500000000000000000
          664.104166666666700000
          13.229166666666670000
          518.583333333333300000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = True
        Caption = 'E N T R A D A S'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 16
      end
      object QRShape4: TQRShape
        Left = 2
        Top = 29
        Width = 694
        Height = 4
        Size.Values = (
          10.583333333333330000
          5.291666666666667000
          76.729166666666670000
          1836.208333333333000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel8: TQRLabel
        Left = 5
        Top = 35
        Width = 111
        Height = 23
        Size.Values = (
          60.854166666666670000
          13.229166666666670000
          92.604166666666670000
          293.687500000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'CODIFICA'#199#195'O'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object QRLabel9: TQRLabel
        Left = 5
        Top = 66
        Width = 58
        Height = 15
        Size.Values = (
          39.687500000000000000
          13.229166666666670000
          174.625000000000000000
          153.458333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Cont'#225'bil'
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
      object QRLabel10: TQRLabel
        Left = 69
        Top = 66
        Width = 47
        Height = 15
        Size.Values = (
          39.687500000000000000
          182.562500000000000000
          174.625000000000000000
          124.354166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Fiscal'
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
      object QRLabel11: TQRLabel
        Left = 224
        Top = 35
        Width = 470
        Height = 15
        Size.Values = (
          39.687500000000000000
          592.666666666666700000
          92.604166666666670000
          1243.541666666667000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'ICMS - VALORES FISCAIS'
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
      object QRLabel12: TQRLabel
        Left = 120
        Top = 49
        Width = 100
        Height = 15
        Size.Values = (
          39.687500000000000000
          317.500000000000000000
          129.645833333333300000
          264.583333333333300000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Valores'
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
        Left = 120
        Top = 66
        Width = 100
        Height = 15
        Size.Values = (
          39.687500000000000000
          317.500000000000000000
          174.625000000000000000
          264.583333333333300000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Cont'#225'beis'
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
        Left = 224
        Top = 58
        Width = 234
        Height = 15
        Size.Values = (
          39.687500000000000000
          592.666666666666700000
          153.458333333333300000
          619.125000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Opera'#231#245'es com Cr'#233'dito do Imposto'
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
        Left = 462
        Top = 58
        Width = 232
        Height = 15
        Size.Values = (
          39.687500000000000000
          1222.375000000000000000
          153.458333333333300000
          613.833333333333300000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Opera'#231#245'es sem Cr'#233'dito do Imposto'
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
        Left = 224
        Top = 80
        Width = 110
        Height = 15
        Size.Values = (
          39.687500000000000000
          592.666666666666700000
          211.666666666666700000
          291.041666666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Base de C'#225'lculo'
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
        Left = 339
        Top = 80
        Width = 119
        Height = 15
        Size.Values = (
          39.687500000000000000
          896.937500000000000000
          211.666666666666700000
          314.854166666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Imp. Creditado'
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
        Left = 462
        Top = 79
        Width = 116
        Height = 15
        Size.Values = (
          39.687500000000000000
          1222.375000000000000000
          209.020833333333300000
          306.916666666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Ise/N. Trib.'
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
        Top = 80
        Width = 110
        Height = 15
        Size.Values = (
          39.687500000000000000
          1545.166666666667000000
          211.666666666666700000
          291.041666666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Outras'
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
        Left = 2
        Top = 60
        Width = 116
        Height = 4
        Size.Values = (
          10.583333333333330000
          5.291666666666667000
          158.750000000000000000
          306.916666666666700000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape6: TQRShape
        Left = 116
        Top = 31
        Width = 4
        Height = 67
        Size.Values = (
          177.270833333333300000
          306.916666666666700000
          82.020833333333330000
          10.583333333333330000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape7: TQRShape
        Left = 220
        Top = 31
        Width = 4
        Height = 67
        Size.Values = (
          177.270833333333300000
          582.083333333333300000
          82.020833333333330000
          10.583333333333330000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape8: TQRShape
        Left = 222
        Top = 52
        Width = 474
        Height = 4
        Size.Values = (
          10.583333333333330000
          587.375000000000000000
          137.583333333333300000
          1254.125000000000000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape9: TQRShape
        Left = 222
        Top = 74
        Width = 474
        Height = 4
        Size.Values = (
          10.583333333333330000
          587.375000000000000000
          195.791666666666700000
          1254.125000000000000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape10: TQRShape
        Left = 458
        Top = 54
        Width = 4
        Height = 44
        Size.Values = (
          116.416666666666700000
          1211.791666666667000000
          142.875000000000000000
          10.583333333333330000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape11: TQRShape
        Left = 334
        Top = 76
        Width = 4
        Height = 22
        Size.Values = (
          58.208333333333330000
          883.708333333333300000
          201.083333333333300000
          10.583333333333330000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape12: TQRShape
        Left = 580
        Top = 76
        Width = 4
        Height = 22
        Size.Values = (
          58.208333333333330000
          1534.583333333333000000
          201.083333333333300000
          10.583333333333330000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape21: TQRShape
        Left = 64
        Top = 62
        Width = 4
        Height = 36
        Size.Values = (
          95.250000000000000000
          169.333333333333300000
          164.041666666666700000
          10.583333333333330000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
    end
    object QRBand3: TQRBand
      Left = 48
      Top = 273
      Width = 698
      Height = 113
      AfterPrint = QRBand3AfterPrint
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        298.979166666666700000
        1846.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRShape13: TQRShape
        Left = 2
        Top = 2
        Width = 694
        Height = 111
        Size.Values = (
          293.687500000000000000
          5.291666666666667000
          5.291666666666667000
          1836.208333333333000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel20: TQRLabel
        Left = 5
        Top = 5
        Width = 111
        Height = 19
        Size.Values = (
          50.270833333333330000
          13.229166666666670000
          13.229166666666670000
          293.687500000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'SUB-TOTAIS'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object QRLabel21: TQRLabel
        Left = 5
        Top = 28
        Width = 64
        Height = 15
        Size.Values = (
          39.687500000000000000
          13.229166666666670000
          74.083333333333330000
          169.333333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Do Estado'
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
        Left = 5
        Top = 45
        Width = 99
        Height = 15
        Size.Values = (
          39.687500000000000000
          13.229166666666670000
          119.062500000000000000
          261.937500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Outros Estados'
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
      object QRLabel23: TQRLabel
        Left = 5
        Top = 62
        Width = 78
        Height = 15
        Size.Values = (
          39.687500000000000000
          13.229166666666670000
          164.041666666666700000
          206.375000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Do Exterior'
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
      object QRShape15: TQRShape
        Left = 2
        Top = 79
        Width = 694
        Height = 4
        Size.Values = (
          10.583333333333330000
          5.291666666666667000
          209.020833333333300000
          1836.208333333333000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel24: TQRLabel
        Left = 5
        Top = 87
        Width = 111
        Height = 19
        Size.Values = (
          50.270833333333330000
          13.229166666666670000
          230.187500000000000000
          293.687500000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'TOTAIS'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object QRShape14: TQRShape
        Left = 116
        Top = 3
        Width = 4
        Height = 111
        Size.Values = (
          293.687500000000000000
          306.916666666666700000
          7.937500000000000000
          10.583333333333330000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape16: TQRShape
        Left = 220
        Top = 3
        Width = 4
        Height = 111
        Size.Values = (
          293.687500000000000000
          582.083333333333300000
          7.937500000000000000
          10.583333333333330000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape17: TQRShape
        Left = 334
        Top = 3
        Width = 4
        Height = 111
        Size.Values = (
          293.687500000000000000
          883.708333333333300000
          7.937500000000000000
          10.583333333333330000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape18: TQRShape
        Left = 458
        Top = 3
        Width = 4
        Height = 111
        Size.Values = (
          293.687500000000000000
          1211.791666666667000000
          7.937500000000000000
          10.583333333333330000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape19: TQRShape
        Left = 580
        Top = 3
        Width = 4
        Height = 111
        Size.Values = (
          293.687500000000000000
          1534.583333333333000000
          7.937500000000000000
          10.583333333333330000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRExpr1: TQRExpr
        Left = 120
        Top = 87
        Width = 100
        Height = 19
        Size.Values = (
          50.270833333333330000
          317.500000000000000000
          230.187500000000000000
          264.583333333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Color = clWhite
        Master = Apuracao_ICMS
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'Sum(Table_Temp.CONTABIL)'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRExpr2: TQRExpr
        Left = 224
        Top = 87
        Width = 110
        Height = 19
        Size.Values = (
          50.270833333333330000
          592.666666666666700000
          230.187500000000000000
          291.041666666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Color = clWhite
        Master = Apuracao_ICMS
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'Sum(Table_Temp.BASE_CALCULO)'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRExpr3: TQRExpr
        Left = 339
        Top = 87
        Width = 119
        Height = 19
        Size.Values = (
          50.270833333333330000
          896.937500000000000000
          230.187500000000000000
          314.854166666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Color = clWhite
        Master = Apuracao_ICMS
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'Sum(Table_Temp.IMP_CREDITADO)'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRExpr4: TQRExpr
        Left = 462
        Top = 87
        Width = 116
        Height = 19
        Size.Values = (
          50.270833333333330000
          1222.375000000000000000
          230.187500000000000000
          306.916666666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Color = clWhite
        Master = Apuracao_ICMS
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'Sum(Table_Temp.ISENTAS)'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRExpr5: TQRExpr
        Left = 584
        Top = 87
        Width = 110
        Height = 19
        Size.Values = (
          50.270833333333330000
          1545.166666666667000000
          230.187500000000000000
          291.041666666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Color = clWhite
        Master = Apuracao_ICMS
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'Sum(Table_Temp.OUTRAS)'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
    end
  end
  object btnExecuta: TBitBtn
    Left = 122
    Top = 113
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
    TabOrder = 3
    OnClick = btnExecutaClick
  end
  object btnRetorna: TBitBtn
    Left = 231
    Top = 113
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
    TabOrder = 4
    OnClick = btnRetornaClick
  end
  object Chk_Outros: TCheckBox
    Left = 69
    Top = 48
    Width = 175
    Height = 17
    Caption = 'Incluir Valores de Outros (Ecf) '
    TabOrder = 2
  end
  object QItens: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM PRODUTOS'
      'WHERE'
      '(PRODUTO_ID = :PRODUTO_ID)'
      'AND (EMPRESA_ID = :EMPRESA_ID)'
      'AND (STATUS = '#39'A'#39')')
    Left = 56
    Top = 60
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
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 24
    Top = 60
  end
  object Table_Temp: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 96
    Top = 64
  end
end
