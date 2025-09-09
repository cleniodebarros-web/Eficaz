object FrmFim_Vendas: TFrmFim_Vendas
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Fim de Vendas'
  ClientHeight = 308
  ClientWidth = 435
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
  object Bevel1: TBevel
    Left = 6
    Top = 263
    Width = 416
    Height = 4
    Shape = bsTopLine
  end
  object Label2: TLabel
    Left = 6
    Top = 35
    Width = 32
    Height = 13
    Caption = 'Ordem'
  end
  object Label3: TLabel
    Left = 6
    Top = 61
    Width = 27
    Height = 13
    Caption = 'Pre'#231'o'
  end
  object Label4: TLabel
    Left = 6
    Top = 115
    Width = 53
    Height = 13
    Caption = 'Tipo Venda'
  end
  object Label5: TLabel
    Left = 6
    Top = 175
    Width = 42
    Height = 13
    Caption = 'Tipo Rel.'
  end
  object Label6: TLabel
    Left = 6
    Top = 88
    Width = 67
    Height = 13
    Caption = 'Modelo Venda'
  end
  object Label9: TLabel
    Left = 5
    Top = 202
    Width = 45
    Height = 13
    Caption = 'C. Custo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnCentro_Custo: TSpeedButton
    Left = 132
    Top = 200
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
  object DBText5: TDBText
    Left = 80
    Top = 221
    Width = 278
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
  object Label7: TLabel
    Left = 183
    Top = 88
    Width = 66
    Height = 13
    Caption = 'No. Doc/Serie'
  end
  object Label8: TLabel
    Left = 6
    Top = 144
    Width = 46
    Height = 13
    Caption = 'Vendedor'
  end
  object btnVendedor: TSpeedButton
    Left = 149
    Top = 142
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
  object Dtmen: TDateEdit
    Left = 78
    Top = 5
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
    Left = 297
    Top = 5
    Width = 90
    Height = 21
    CheckOnExit = True
    DialogTitle = 'Selecione a Data'
    NumGlyphs = 2
    TabOrder = 1
    OnEnter = DtmenEnter
    OnKeyDown = DtmenKeyDown
  end
  object Ordem: TComboBox
    Left = 78
    Top = 32
    Width = 160
    Height = 21
    Style = csDropDownList
    TabOrder = 2
    OnKeyDown = OrdemKeyDown
    Items.Strings = (
      'C'#211'DIGO'
      'DESCRI'#199#195'O'
      'QTD. VENDA'
      'VALOR VENDA')
  end
  object Fim: TQuickRep
    Left = 515
    Top = 20
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
    ReportTitle = 'Fim de Vendas'
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
      Height = 84
      AlignToBottom = False
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
        222.250000000000000000
        1846.791666666667000000)
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
      object QRLabel3: TQRLabel
        Left = 275
        Top = 28
        Width = 148
        Height = 15
        Size.Values = (
          39.687500000000000000
          727.604166666666700000
          74.083333333333330000
          391.583333333333300000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = True
        Caption = '*** FIM DE VENDAS ***'
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
      object QRShape1: TQRShape
        Left = 0
        Top = 61
        Width = 698
        Height = 4
        Size.Values = (
          10.583333333333330000
          0.000000000000000000
          161.395833333333300000
          1846.791666666667000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel7: TQRLabel
        Left = 55
        Top = 65
        Width = 78
        Height = 15
        Size.Values = (
          39.687500000000000000
          145.520833333333300000
          171.979166666666700000
          206.375000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'C'#243'd. Barras'
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
        Left = 537
        Top = 65
        Width = 80
        Height = 15
        Size.Values = (
          39.687500000000000000
          1420.812500000000000000
          171.979166666666700000
          211.666666666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Vr. Cst.'
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
      object QRShape2: TQRShape
        Left = 0
        Top = 80
        Width = 698
        Height = 4
        Size.Values = (
          10.583333333333330000
          0.000000000000000000
          211.666666666666700000
          1846.791666666667000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel10: TQRLabel
        Left = 0
        Top = 65
        Width = 40
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          171.979166666666700000
          105.833333333333300000)
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
      object QRLabel13: TQRLabel
        Left = 0
        Top = 28
        Width = 127
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          74.083333333333330000
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
      object QRLabel11: TQRLabel
        Left = 618
        Top = 65
        Width = 80
        Height = 15
        Size.Values = (
          39.687500000000000000
          1635.125000000000000000
          171.979166666666700000
          211.666666666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = '(Vda-Cst)'
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
      object QRLabel4: TQRLabel
        Left = 144
        Top = 65
        Width = 64
        Height = 15
        Size.Values = (
          39.687500000000000000
          381.000000000000000000
          171.979166666666700000
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
      object QRLabel8: TQRLabel
        Left = 456
        Top = 65
        Width = 80
        Height = 15
        Size.Values = (
          39.687500000000000000
          1206.500000000000000000
          171.979166666666700000
          211.666666666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Vr. Vd.'
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
        Left = 374
        Top = 65
        Width = 80
        Height = 15
        Size.Values = (
          39.687500000000000000
          989.541666666666700000
          171.979166666666700000
          211.666666666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Qtd. Vd.'
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
      object lbl_Vendedor2: TQRLabel
        Left = 0
        Top = 46
        Width = 148
        Height = 15
        Enabled = False
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          121.708333333333300000
          391.583333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = True
        Caption = '*** FIM DE VENDAS ***'
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
    end
    object DetailBand1: TQRBand
      Left = 48
      Top = 166
      Width = 698
      Height = 17
      AlignToBottom = False
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
        1846.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRDBText1: TQRDBText
        Left = 0
        Top = 1
        Width = 40
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          2.645833333333333000
          105.833333333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
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
      object QRDBText2: TQRDBText
        Left = 47
        Top = 1
        Width = 64
        Height = 15
        Size.Values = (
          39.687500000000000000
          124.354166666666700000
          2.645833333333333000
          169.333333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QRel
        DataField = 'cod_barra'
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
        Left = 144
        Top = 1
        Width = 225
        Height = 15
        Size.Values = (
          39.687500000000000000
          381.000000000000000000
          2.645833333333333000
          595.312500000000000000)
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
      object QRDBText5: TQRDBText
        Left = 374
        Top = 1
        Width = 80
        Height = 15
        Size.Values = (
          39.687500000000000000
          989.541666666666700000
          2.645833333333333000
          211.666666666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
        DataField = 'QTD_VENDA'
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
        Left = 456
        Top = 1
        Width = 80
        Height = 15
        Size.Values = (
          39.687500000000000000
          1206.500000000000000000
          2.645833333333333000
          211.666666666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
        DataField = 'VR_VENDA'
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
        Left = 537
        Top = 1
        Width = 80
        Height = 15
        Size.Values = (
          39.687500000000000000
          1420.812500000000000000
          2.645833333333333000
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
        Master = Fim
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'CUSTO'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRExpr8: TQRExpr
        Left = 618
        Top = 1
        Width = 80
        Height = 15
        Size.Values = (
          39.687500000000000000
          1635.125000000000000000
          2.645833333333333000
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
        Master = Fim
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = '(VR_VENDA - CUSTO)'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
    end
    object QRBand1: TQRBand
      Left = 48
      Top = 205
      Width = 698
      Height = 100
      AlignToBottom = False
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
        264.583333333333300000
        1846.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRShape4: TQRShape
        Left = 280
        Top = 1
        Width = 418
        Height = 4
        Size.Values = (
          10.583333333333330000
          740.833333333333300000
          2.645833333333333000
          1105.958333333333000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel20: TQRLabel
        Left = 279
        Top = 29
        Width = 36
        Height = 15
        Size.Values = (
          39.687500000000000000
          738.187500000000000000
          76.729166666666670000
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
      object QRExpr1: TQRExpr
        Left = 456
        Top = 28
        Width = 80
        Height = 15
        Size.Values = (
          39.687500000000000000
          1206.500000000000000000
          74.083333333333330000
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
        Master = Fim
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'Sum(VR_VENDA)'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRExpr2: TQRExpr
        Left = 537
        Top = 28
        Width = 80
        Height = 15
        Size.Values = (
          39.687500000000000000
          1420.812500000000000000
          74.083333333333330000
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
        Master = Fim
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'Sum(CUSTO)'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRExpr3: TQRExpr
        Left = 618
        Top = 28
        Width = 80
        Height = 15
        Size.Values = (
          39.687500000000000000
          1635.125000000000000000
          74.083333333333330000
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
        Master = Fim
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'Sum((VR_VENDA - CUSTO))'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRExpr16: TQRExpr
        Left = 618
        Top = 8
        Width = 76
        Height = 15
        Size.Values = (
          39.687500000000000000
          1635.125000000000000000
          21.166666666666670000
          201.083333333333300000)
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
        Master = Fim
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'Sum(DESCONTO)'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel23: TQRLabel
        Left = 548
        Top = 8
        Width = 64
        Height = 15
        Size.Values = (
          39.687500000000000000
          1449.916666666667000000
          21.166666666666670000
          169.333333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Desconto:'
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
      object QRExpr17: TQRExpr
        Left = 370
        Top = 27
        Width = 80
        Height = 15
        Size.Values = (
          39.687500000000000000
          978.958333333333300000
          71.437500000000000000
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
        Master = Fim
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'Sum(QTD_VENDA)'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
    end
    object QRGroup1: TQRGroup
      Left = 48
      Top = 132
      Width = 698
      Height = 34
      AlignToBottom = False
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
        89.958333333333330000
        1846.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'GRUPO'
      FooterBand = QRBand2
      Master = Fim
      ReprintOnNewPage = False
      object QRDBText3: TQRDBText
        Left = 0
        Top = 9
        Width = 36
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          23.812500000000000000
          95.250000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QRel
        DataField = 'GRUPO'
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
    object QRBand2: TQRBand
      Left = 48
      Top = 183
      Width = 698
      Height = 22
      AlignToBottom = False
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
        58.208333333333330000
        1846.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRShape3: TQRShape
        Left = 280
        Top = 1
        Width = 418
        Height = 4
        Size.Values = (
          10.583333333333330000
          740.833333333333300000
          2.645833333333333000
          1105.958333333333000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel2: TQRLabel
        Left = 280
        Top = 5
        Width = 64
        Height = 15
        Size.Values = (
          39.687500000000000000
          740.833333333333300000
          13.229166666666670000
          169.333333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
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
      object QRExpr4: TQRExpr
        Left = 456
        Top = 5
        Width = 80
        Height = 15
        Size.Values = (
          39.687500000000000000
          1206.500000000000000000
          13.229166666666670000
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
        Master = Fim
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'Sum(VR_VENDA)'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRExpr5: TQRExpr
        Left = 537
        Top = 5
        Width = 80
        Height = 15
        Size.Values = (
          39.687500000000000000
          1420.812500000000000000
          13.229166666666670000
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
        Master = Fim
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'Sum(CUSTO)'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRExpr6: TQRExpr
        Left = 618
        Top = 5
        Width = 80
        Height = 15
        Size.Values = (
          39.687500000000000000
          1635.125000000000000000
          13.229166666666670000
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
        Master = Fim
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'Sum((VR_VENDA - CUSTO))'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRExpr20: TQRExpr
        Left = 375
        Top = 5
        Width = 75
        Height = 15
        Size.Values = (
          39.687500000000000000
          992.187500000000000000
          13.229166666666670000
          198.437500000000000000)
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
        Master = Fim
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'Sum(QTD_VENDA)'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
    end
  end
  object btnRetorna: TBitBtn
    Left = 312
    Top = 273
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
    TabOrder = 9
    OnClick = btnRetornaClick
  end
  object btnExecuta: TBitBtn
    Left = 209
    Top = 273
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
    TabOrder = 8
    OnClick = btnExecutaClick
  end
  object Preco: TComboBox
    Left = 78
    Top = 58
    Width = 160
    Height = 21
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 3
    Text = 'Custo de Compra'
    OnKeyDown = OrdemKeyDown
    Items.Strings = (
      'Custo de Compra'
      'Valor de Compra'
      'Custom'#233'dio')
  end
  object Tipo_Venda: TComboBox
    Left = 78
    Top = 112
    Width = 125
    Height = 21
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnKeyDown = OrdemKeyDown
    Items.Strings = (
      ''
      'AVARIA'
      'BONIFICA'#199#195'O'
      'REMESSA'
      'VENDA')
  end
  object Tipo_Rel: TComboBox
    Left = 78
    Top = 173
    Width = 125
    Height = 21
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 7
    Text = 'Anal'#237'tico'
    OnKeyDown = OrdemKeyDown
    Items.Strings = (
      'Anal'#237'tico'
      'Sint'#233'tico')
  end
  object Sintetico: TQuickRep
    Left = 58
    Top = 1000
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
    ReportTitle = 'Fim de Vendas'
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
    object QRBand3: TQRBand
      Left = 48
      Top = 48
      Width = 698
      Height = 84
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        222.250000000000000000
        1846.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
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
      object QRLabel1: TQRLabel
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
      object QRLabel6: TQRLabel
        Left = 275
        Top = 27
        Width = 148
        Height = 15
        Size.Values = (
          39.687500000000000000
          727.604166666666700000
          71.437500000000000000
          391.583333333333300000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = True
        Caption = '*** FIM DE VENDAS ***'
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
      object QRShape5: TQRShape
        Left = 0
        Top = 61
        Width = 698
        Height = 4
        Size.Values = (
          10.583333333333330000
          0.000000000000000000
          161.395833333333300000
          1846.791666666667000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel14: TQRLabel
        Left = 508
        Top = 65
        Width = 84
        Height = 15
        Size.Values = (
          39.687500000000000000
          1344.083333333333000000
          171.979166666666700000
          222.250000000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Vr. Cst.'
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
        Top = 78
        Width = 698
        Height = 4
        Size.Values = (
          10.583333333333330000
          0.000000000000000000
          206.375000000000000000
          1846.791666666667000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel16: TQRLabel
        Left = 0
        Top = 28
        Width = 127
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          74.083333333333330000
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
      object QRLabel17: TQRLabel
        Left = 609
        Top = 65
        Width = 84
        Height = 15
        Size.Values = (
          39.687500000000000000
          1611.312500000000000000
          171.979166666666700000
          222.250000000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = '(Vda-Cst)'
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
      object QRDBText7: TQRDBText
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
      object QRLabel18: TQRLabel
        Left = 0
        Top = 65
        Width = 36
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          171.979166666666700000
          95.250000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Grupo'
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
        Top = 65
        Width = 84
        Height = 15
        Size.Values = (
          39.687500000000000000
          844.020833333333300000
          171.979166666666700000
          222.250000000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Vr. Vd.'
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
        Left = 231
        Top = 65
        Width = 84
        Height = 15
        Size.Values = (
          39.687500000000000000
          611.187500000000000000
          171.979166666666700000
          222.250000000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Qtd. Vd.'
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
      object QRLabel12: TQRLabel
        Left = 411
        Top = 65
        Width = 84
        Height = 15
        Size.Values = (
          39.687500000000000000
          1087.437500000000000000
          171.979166666666700000
          222.250000000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Vr. Desc.'
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
      object lbl_Vendedor: TQRLabel
        Left = 0
        Top = 45
        Width = 148
        Height = 15
        Enabled = False
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          119.062500000000000000
          391.583333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = True
        Caption = '*** FIM DE VENDAS ***'
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
    end
    object QRBand4: TQRBand
      Left = 48
      Top = 132
      Width = 698
      Height = 17
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        44.979166666666670000
        1846.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRDBText11: TQRDBText
        Left = 0
        Top = 1
        Width = 225
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          2.645833333333333000
          595.312500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
        DataField = 'GRUPO'
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
      object QRDBText12: TQRDBText
        Left = 231
        Top = 2
        Width = 84
        Height = 15
        Size.Values = (
          39.687500000000000000
          611.187500000000000000
          5.291666666666667000
          222.250000000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
        DataField = 'QTD_VENDA'
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
        Left = 319
        Top = 1
        Width = 84
        Height = 15
        Size.Values = (
          39.687500000000000000
          844.020833333333300000
          2.645833333333333000
          222.250000000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
        DataField = 'VR_VENDA'
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
      object QRExpr9: TQRExpr
        Left = 501
        Top = 1
        Width = 84
        Height = 15
        Size.Values = (
          39.687500000000000000
          1325.562500000000000000
          2.645833333333333000
          222.250000000000000000)
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
        Master = Sintetico
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'CUSTO'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRExpr10: TQRExpr
        Left = 609
        Top = 1
        Width = 84
        Height = 15
        Size.Values = (
          39.687500000000000000
          1611.312500000000000000
          2.645833333333333000
          222.250000000000000000)
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
        Master = Sintetico
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = '(VR_VENDA - CUSTO)'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText9: TQRDBText
        Left = 411
        Top = 2
        Width = 84
        Height = 15
        Size.Values = (
          39.687500000000000000
          1087.437500000000000000
          5.291666666666667000
          222.250000000000000000)
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
    end
    object QRBand5: TQRBand
      Left = 48
      Top = 149
      Width = 698
      Height = 84
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        222.250000000000000000
        1846.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRShape7: TQRShape
        Left = 157
        Top = 1
        Width = 541
        Height = 4
        Size.Values = (
          10.583333333333330000
          415.395833333333300000
          2.645833333333333000
          1431.395833333333000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel22: TQRLabel
        Left = 157
        Top = 5
        Width = 36
        Height = 15
        Size.Values = (
          39.687500000000000000
          415.395833333333300000
          13.229166666666670000
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
      object QRExpr11: TQRExpr
        Left = 311
        Top = 5
        Width = 92
        Height = 15
        Size.Values = (
          39.687500000000000000
          822.854166666666700000
          13.229166666666670000
          243.416666666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Color = clWhite
        Master = Sintetico
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'Sum(VR_VENDA)'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRExpr12: TQRExpr
        Left = 508
        Top = 5
        Width = 84
        Height = 15
        Size.Values = (
          39.687500000000000000
          1344.083333333333000000
          13.229166666666670000
          222.250000000000000000)
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
        Master = Sintetico
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'Sum(CUSTO)'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRExpr13: TQRExpr
        Left = 609
        Top = 5
        Width = 84
        Height = 15
        Size.Values = (
          39.687500000000000000
          1611.312500000000000000
          13.229166666666670000
          222.250000000000000000)
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
        Master = Sintetico
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'Sum((VR_VENDA - CUSTO))'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRExpr14: TQRExpr
        Left = 411
        Top = 5
        Width = 84
        Height = 15
        Size.Values = (
          39.687500000000000000
          1087.437500000000000000
          13.229166666666670000
          222.250000000000000000)
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
        Master = Sintetico
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'Sum(DESCONTO)'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel27: TQRLabel
        Left = 356
        Top = 50
        Width = 78
        Height = 15
        Size.Values = (
          39.687500000000000000
          941.916666666666700000
          132.291666666666700000
          206.375000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'MARKUP (%):'
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
      object QRExpr19: TQRExpr
        Left = 431
        Top = 51
        Width = 64
        Height = 15
        Size.Values = (
          39.687500000000000000
          1140.354166666667000000
          134.937500000000000000
          169.333333333333300000)
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
        Master = Sintetico
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = '(Sum((VR_VENDA - CUSTO)) * 100 ) / Sum(CUSTO)'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel26: TQRLabel
        Left = 541
        Top = 50
        Width = 92
        Height = 15
        Size.Values = (
          39.687500000000000000
          1431.395833333333000000
          132.291666666666700000
          243.416666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'MARKDOWN (%):'
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
      object QRExpr18: TQRExpr
        Left = 631
        Top = 51
        Width = 64
        Height = 15
        Size.Values = (
          39.687500000000000000
          1669.520833333333000000
          134.937500000000000000
          169.333333333333300000)
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
        Master = Sintetico
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = '(Sum((VR_VENDA - CUSTO)) * 100 ) / Sum(VR_VENDA)'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRExpr15: TQRExpr
        Left = 198
        Top = 5
        Width = 99
        Height = 15
        Size.Values = (
          39.687500000000000000
          523.875000000000000000
          13.229166666666670000
          261.937500000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Color = clWhite
        Master = Sintetico
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'Sum(QTD_VENDA)'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
    end
  end
  object ComboBox1: TComboBox
    Left = 78
    Top = 85
    Width = 99
    Height = 21
    Style = csDropDownList
    TabOrder = 12
    OnKeyDown = OrdemKeyDown
    Items.Strings = (
      ''
      'NFE'
      'NFC-e'
      'Cupom Fiscal')
  end
  object chk_exportar: TCheckBox
    Left = 79
    Top = 244
    Width = 130
    Height = 17
    Caption = 'Exportar para Excel'
    TabOrder = 13
  end
  object C_CUSTO_ID: TCurrencyEdit
    Left = 79
    Top = 200
    Width = 47
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 14
    ZeroEmpty = False
    OnExit = C_CUSTO_IDExit
    OnKeyDown = C_CUSTO_IDKeyDown
  end
  object NUM_DOC: TEdit
    Left = 256
    Top = 85
    Width = 62
    Height = 21
    MaxLength = 9
    TabOrder = 5
  end
  object SERIE: TEdit
    Left = 324
    Top = 85
    Width = 33
    Height = 21
    MaxLength = 3
    TabOrder = 6
  end
  object Vendedor: TCurrencyEdit
    Left = 78
    Top = 142
    Width = 67
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 15
    ZeroEmpty = False
    OnExit = VendedorExit
  end
  object MEMO_PARAMETROS: TMemo
    Left = 209
    Top = 107
    Width = 213
    Height = 103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Lines.Strings = (
      '')
    ParentFont = False
    ReadOnly = True
    TabOrder = 16
    Visible = False
  end
  object QRel: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 8
    Top = 219
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
    Left = 48
    Top = 228
    ParamData = <
      item
        Name = 'TABELA_ID'
        ParamType = ptInput
      end>
  end
  object DataCusto: TDataSource
    DataSet = QCusto
    Left = 90
    Top = 236
  end
  object QVendedor: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      'SELECT * FROM FUNCIONARIOS'
      'WHERE FUNCIONARIO_ID = :VENDEDOR_ID')
    Left = 16
    Top = 268
    ParamData = <
      item
        Name = 'VENDEDOR_ID'
        ParamType = ptInput
      end>
  end
end
