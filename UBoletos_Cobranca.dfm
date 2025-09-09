object FrmBoletos_Cobranca: TFrmBoletos_Cobranca
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Boletos de Cobran'#231'a'
  ClientHeight = 260
  ClientWidth = 333
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
  object Label3: TLabel
    Left = 6
    Top = 35
    Width = 53
    Height = 13
    Caption = 'Tipo Boleto'
  end
  object Label4: TLabel
    Left = 6
    Top = 61
    Width = 59
    Height = 13
    Caption = 'Local Pagto.'
  end
  object Label2: TLabel
    Left = 8
    Top = 139
    Width = 33
    Height = 13
    Caption = 'Cliente'
  end
  object Label5: TLabel
    Left = 8
    Top = 165
    Width = 31
    Height = 13
    Caption = 'Classe'
  end
  object Label6: TLabel
    Left = 8
    Top = 191
    Width = 29
    Height = 13
    Caption = 'Banco'
  end
  object Bevel1: TBevel
    Left = 6
    Top = 216
    Width = 315
    Height = 4
    Shape = bsTopLine
  end
  object Label7: TLabel
    Left = 6
    Top = 87
    Width = 51
    Height = 13
    Caption = 'Instru'#231#245'es'
  end
  object btnCliente: TSpeedButton
    Left = 151
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
    OnClick = btnClienteClick
  end
  object btnBanco: TSpeedButton
    Left = 151
    Top = 188
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
  object DBText4: TDBText
    Left = 221
    Top = 191
    Width = 102
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
  object DBText2: TDBText
    Left = 221
    Top = 139
    Width = 102
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
  object Label8: TLabel
    Left = 391
    Top = 9
    Width = 44
    Height = 13
    Caption = 'Qtd. Vias'
    Visible = False
  end
  object Label10: TLabel
    Left = 388
    Top = 35
    Width = 64
    Height = 13
    Caption = 'Cond. Espec.'
    Visible = False
  end
  object Dtmen: TDateEdit
    Left = 81
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
    Left = 185
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
  object Tipo_Boleto: TComboBox
    Left = 81
    Top = 32
    Width = 145
    Height = 21
    Style = csDropDownList
    TabOrder = 2
    OnChange = Tipo_BoletoChange
    OnKeyDown = ClienteKeyDown
    Items.Strings = (
      'Duplicata Mercantil Mod. 1'
      'Duplicata Mercantil Mod. 2'
      'Duplicata Loca'#231#227'o'
      'Boleto Banc'#225'rio'
      'Boleto Pr'#233'-Impresso'
      'Boleto Simples'
      'Duplicata Pr'#233'-Impressa'
      'Carn'#234)
  end
  object Local_Pagto: TEdit
    Left = 81
    Top = 58
    Width = 240
    Height = 21
    Enabled = False
    TabOrder = 3
    OnKeyDown = DtmenKeyDown
  end
  object Cliente: TCurrencyEdit
    Left = 81
    Top = 136
    Width = 67
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 5
    ZeroEmpty = False
    OnExit = ClienteExit
    OnKeyDown = ClienteKeyDown
  end
  object Instrucoes: TMemo
    Left = 81
    Top = 87
    Width = 240
    Height = 42
    Enabled = False
    TabOrder = 4
  end
  object Classe: TEdit
    Left = 81
    Top = 162
    Width = 90
    Height = 21
    TabOrder = 6
    OnKeyDown = DtmenKeyDown
  end
  object Banco: TCurrencyEdit
    Left = 81
    Top = 188
    Width = 67
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 7
    ZeroEmpty = False
    OnExit = BancoExit
    OnKeyDown = ClienteKeyDown
  end
  object Boleto: TQuickRep
    Left = 95
    Top = 375
    Width = 794
    Height = 1123
    DataSet = QRel
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
    ReportTitle = 'Boleto de Cobran'#231'a'
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
      Height = 488
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        1291.166666666667000000
        1846.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRDBText1: TQRDBText
        Left = 2
        Top = 3
        Width = 66
        Height = 24
        Size.Values = (
          63.500000000000000000
          5.291666666666667000
          7.937500000000000000
          174.625000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = FrmPrincipal.QEmpresa
        DataField = 'RAZAO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 16
      end
      object QRShape1: TQRShape
        Left = 1
        Top = 29
        Width = 696
        Height = 4
        Size.Values = (
          10.583333333333330000
          2.645833333333333000
          76.729166666666670000
          1841.500000000000000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape2: TQRShape
        Left = 1
        Top = 64
        Width = 696
        Height = 4
        Size.Values = (
          10.583333333333330000
          2.645833333333333000
          169.333333333333300000
          1841.500000000000000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape3: TQRShape
        Left = 1
        Top = 98
        Width = 696
        Height = 4
        Size.Values = (
          10.583333333333330000
          2.645833333333333000
          259.291666666666700000
          1841.500000000000000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape4: TQRShape
        Left = 1
        Top = 132
        Width = 696
        Height = 4
        Size.Values = (
          10.583333333333330000
          2.645833333333333000
          349.250000000000000000
          1841.500000000000000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape5: TQRShape
        Left = 1
        Top = 166
        Width = 696
        Height = 4
        Size.Values = (
          10.583333333333330000
          2.645833333333333000
          439.208333333333300000
          1841.500000000000000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape6: TQRShape
        Left = 1
        Top = 336
        Width = 696
        Height = 4
        Size.Values = (
          10.583333333333330000
          2.645833333333333000
          889.000000000000000000
          1841.500000000000000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape19: TQRShape
        Left = 1
        Top = 425
        Width = 696
        Height = 4
        Size.Values = (
          10.583333333333330000
          2.645833333333333000
          1124.479166666667000000
          1841.500000000000000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape15: TQRShape
        Left = 562
        Top = 200
        Width = 134
        Height = 4
        Size.Values = (
          10.583333333333330000
          1486.958333333333000000
          529.166666666666700000
          354.541666666666700000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape16: TQRShape
        Left = 562
        Top = 234
        Width = 134
        Height = 4
        Size.Values = (
          10.583333333333330000
          1486.958333333333000000
          619.125000000000000000
          354.541666666666700000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape17: TQRShape
        Left = 562
        Top = 268
        Width = 134
        Height = 4
        Size.Values = (
          10.583333333333330000
          1486.958333333333000000
          709.083333333333300000
          354.541666666666700000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape18: TQRShape
        Left = 562
        Top = 302
        Width = 134
        Height = 4
        Size.Values = (
          10.583333333333330000
          1486.958333333333000000
          799.041666666666700000
          354.541666666666700000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape8: TQRShape
        Left = 104
        Top = 100
        Width = 4
        Height = 69
        Size.Values = (
          182.562500000000000000
          275.166666666666700000
          264.583333333333300000
          10.583333333333330000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape9: TQRShape
        Left = 240
        Top = 100
        Width = 4
        Height = 34
        Size.Values = (
          89.958333333333330000
          635.000000000000000000
          264.583333333333300000
          10.583333333333330000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape10: TQRShape
        Left = 344
        Top = 100
        Width = 4
        Height = 34
        Size.Values = (
          89.958333333333330000
          910.166666666666700000
          264.583333333333300000
          10.583333333333330000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape11: TQRShape
        Left = 432
        Top = 100
        Width = 4
        Height = 34
        Size.Values = (
          89.958333333333330000
          1143.000000000000000000
          264.583333333333300000
          10.583333333333330000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape7: TQRShape
        Left = 560
        Top = 31
        Width = 4
        Height = 308
        Size.Values = (
          814.916666666666700000
          1481.666666666667000000
          82.020833333333330000
          10.583333333333330000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape12: TQRShape
        Left = 152
        Top = 134
        Width = 4
        Height = 34
        Size.Values = (
          89.958333333333330000
          402.166666666666700000
          354.541666666666700000
          10.583333333333330000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape13: TQRShape
        Left = 200
        Top = 134
        Width = 4
        Height = 34
        Size.Values = (
          89.958333333333330000
          529.166666666666700000
          354.541666666666700000
          10.583333333333330000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape14: TQRShape
        Left = 376
        Top = 134
        Width = 4
        Height = 34
        Size.Values = (
          89.958333333333330000
          994.833333333333300000
          354.541666666666700000
          10.583333333333330000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRLabel3: TQRLabel
        Left = 3
        Top = 33
        Width = 127
        Height = 15
        Size.Values = (
          39.687500000000000000
          7.937500000000000000
          87.312500000000000000
          336.020833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Local de Pagamento'
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
        Left = 2
        Top = 49
        Width = 57
        Height = 17
        Size.Values = (
          44.979166666666670000
          5.291666666666667000
          129.645833333333300000
          150.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'QRLabel2'
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
        Left = 2
        Top = 68
        Width = 50
        Height = 15
        Size.Values = (
          39.687500000000000000
          5.291666666666667000
          179.916666666666700000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cedente'
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
      object QRDBText3: TQRDBText
        Left = 2
        Top = 83
        Width = 36
        Height = 15
        Size.Values = (
          39.687500000000000000
          5.291666666666667000
          219.604166666666700000
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
      object QRLabel7: TQRLabel
        Left = 2
        Top = 102
        Width = 99
        Height = 15
        Size.Values = (
          39.687500000000000000
          5.291666666666667000
          269.875000000000000000
          261.937500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Data Documento'
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
      object QRDBText5: TQRDBText
        Left = 2
        Top = 117
        Width = 57
        Height = 15
        Size.Values = (
          39.687500000000000000
          5.291666666666667000
          309.562500000000000000
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
      object QRLabel13: TQRLabel
        Left = 2
        Top = 136
        Width = 85
        Height = 15
        Size.Values = (
          39.687500000000000000
          5.291666666666667000
          359.833333333333300000
          224.895833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Uso do Banco'
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
        Left = 113
        Top = 102
        Width = 113
        Height = 15
        Size.Values = (
          39.687500000000000000
          298.979166666666700000
          269.875000000000000000
          298.979166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'N'#250'mero Documento'
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
      object QRDBText6: TQRDBText
        Left = 113
        Top = 117
        Width = 113
        Height = 15
        Size.Values = (
          39.687500000000000000
          298.979166666666700000
          309.562500000000000000
          298.979166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
        DataField = 'NUM_DOC'
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
      object QRLabel9: TQRLabel
        Left = 249
        Top = 102
        Width = 78
        Height = 15
        Size.Values = (
          39.687500000000000000
          658.812500000000000000
          269.875000000000000000
          206.375000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Esp. Docum.'
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
        Left = 353
        Top = 102
        Width = 43
        Height = 15
        Size.Values = (
          39.687500000000000000
          933.979166666666700000
          269.875000000000000000
          113.770833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Aceite'
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
        Left = 441
        Top = 102
        Width = 120
        Height = 15
        Size.Values = (
          39.687500000000000000
          1166.812500000000000000
          269.875000000000000000
          317.500000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Dt. Processamento'
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
      object QRSysData1: TQRSysData
        Left = 448
        Top = 115
        Width = 43
        Height = 17
        Size.Values = (
          44.979166666666670000
          1185.333333333333000000
          304.270833333333300000
          113.770833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsDate
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
      object QRLabel17: TQRLabel
        Left = 385
        Top = 136
        Width = 36
        Height = 15
        Size.Values = (
          39.687500000000000000
          1018.645833333333000000
          359.833333333333300000
          95.250000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
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
      object QRDBText15: TQRDBText
        Left = 428
        Top = 151
        Width = 93
        Height = 15
        Size.Values = (
          39.687500000000000000
          1132.416666666667000000
          399.520833333333300000
          246.062500000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
        DataField = 'VR_PARCELA'
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
      object QRLabel16: TQRLabel
        Left = 209
        Top = 136
        Width = 71
        Height = 15
        Size.Values = (
          39.687500000000000000
          552.979166666666700000
          359.833333333333300000
          187.854166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Quantidade'
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
        Left = 161
        Top = 136
        Width = 29
        Height = 15
        Size.Values = (
          39.687500000000000000
          425.979166666666700000
          359.833333333333300000
          76.729166666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Esp.'
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
        Left = 113
        Top = 136
        Width = 36
        Height = 15
        Size.Values = (
          39.687500000000000000
          298.979166666666700000
          359.833333333333300000
          95.250000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cart.'
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
        Left = 2
        Top = 170
        Width = 71
        Height = 15
        Size.Values = (
          39.687500000000000000
          5.291666666666667000
          449.791666666666700000
          187.854166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Instru'#231#245'es'
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
      object QRMemo1: TQRMemo
        Left = 2
        Top = 185
        Width = 558
        Height = 146
        Size.Values = (
          386.291666666666700000
          5.291666666666667000
          489.479166666666700000
          1476.375000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel25: TQRLabel
        Left = 2
        Top = 340
        Width = 43
        Height = 15
        Size.Values = (
          39.687500000000000000
          5.291666666666667000
          899.583333333333300000
          113.770833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sacado'
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
      object QRDBText4: TQRDBText
        Left = 2
        Top = 355
        Width = 29
        Height = 15
        Size.Values = (
          39.687500000000000000
          5.291666666666667000
          939.270833333333300000
          76.729166666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QCliente
        DataField = 'NOME'
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
      object QRDBText11: TQRDBText
        Left = 2
        Top = 385
        Width = 64
        Height = 15
        Size.Values = (
          39.687500000000000000
          5.291666666666667000
          1018.645833333333000000
          169.333333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QCliente
        DataField = 'MUNICIPIO'
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
      object QRLabel26: TQRLabel
        Left = 2
        Top = 408
        Width = 113
        Height = 15
        Size.Values = (
          39.687500000000000000
          5.291666666666667000
          1079.500000000000000000
          298.979166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sacador/Avalista'
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
        Left = 513
        Top = 340
        Width = 106
        Height = 15
        Size.Values = (
          39.687500000000000000
          1357.312500000000000000
          899.583333333333300000
          280.458333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'C'#243'digo de Baixa'
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
        Left = 370
        Top = 355
        Width = 29
        Height = 15
        Size.Values = (
          39.687500000000000000
          978.958333333333300000
          939.270833333333300000
          76.729166666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QCliente
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
      object QRDBText10: TQRDBText
        Left = 370
        Top = 370
        Width = 43
        Height = 15
        Size.Values = (
          39.687500000000000000
          978.958333333333300000
          978.958333333333300000
          113.770833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QCliente
        DataField = 'BAIRRO'
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
        Left = 370
        Top = 385
        Width = 22
        Height = 15
        Size.Values = (
          39.687500000000000000
          978.958333333333300000
          1018.645833333333000000
          58.208333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QCliente
        DataField = 'CEP'
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
      object QRLabel28: TQRLabel
        Left = 513
        Top = 408
        Width = 148
        Height = 15
        Size.Values = (
          39.687500000000000000
          1357.312500000000000000
          1079.500000000000000000
          391.583333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Autentica'#231#227'o Mec'#226'nica'
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
        Left = 569
        Top = 34
        Width = 71
        Height = 15
        Size.Values = (
          39.687500000000000000
          1505.479166666667000000
          89.958333333333330000
          187.854166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Vencimento'
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
      object QRDBText2: TQRDBText
        Left = 569
        Top = 49
        Width = 92
        Height = 15
        Size.Values = (
          39.687500000000000000
          1505.479166666667000000
          129.645833333333300000
          243.416666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QRel
        DataField = 'DT_VENCIMENTO'
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
      object QRLabel6: TQRLabel
        Left = 569
        Top = 68
        Width = 106
        Height = 15
        Size.Values = (
          39.687500000000000000
          1505.479166666667000000
          179.916666666666700000
          280.458333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Ag'#234'ncia/Cedente'
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
        Left = 569
        Top = 102
        Width = 85
        Height = 15
        Size.Values = (
          39.687500000000000000
          1505.479166666667000000
          269.875000000000000000
          224.895833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Nosso N'#250'mero'
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
      object QRDBText9: TQRDBText
        Left = 593
        Top = 117
        Width = 64
        Height = 15
        Size.Values = (
          39.687500000000000000
          1568.979166666667000000
          309.562500000000000000
          169.333333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QRel
        DataField = 'DUPLICATA'
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
        Left = 570
        Top = 136
        Width = 120
        Height = 15
        Size.Values = (
          39.687500000000000000
          1508.125000000000000000
          359.833333333333300000
          317.500000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '(=) Vr. Documento'
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
      object QRDBText16: TQRDBText
        Left = 569
        Top = 151
        Width = 93
        Height = 15
        Size.Values = (
          39.687500000000000000
          1505.479166666667000000
          399.520833333333300000
          246.062500000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
        DataField = 'VR_PARCELA'
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
      object QRLabel20: TQRLabel
        Left = 569
        Top = 170
        Width = 85
        Height = 15
        Size.Values = (
          39.687500000000000000
          1505.479166666667000000
          449.791666666666700000
          224.895833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '(-) Desconto'
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
        Left = 569
        Top = 204
        Width = 106
        Height = 15
        Size.Values = (
          39.687500000000000000
          1505.479166666667000000
          539.750000000000000000
          280.458333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '(-) Outras Ded.'
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
        Left = 569
        Top = 238
        Width = 99
        Height = 15
        Size.Values = (
          39.687500000000000000
          1505.479166666667000000
          629.708333333333300000
          261.937500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '(+) Mora/Multa'
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
        Left = 569
        Top = 272
        Width = 106
        Height = 15
        Size.Values = (
          39.687500000000000000
          1505.479166666667000000
          719.666666666666700000
          280.458333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '(+) Outros Acr.'
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
        Left = 569
        Top = 306
        Width = 120
        Height = 15
        Size.Values = (
          39.687500000000000000
          1505.479166666667000000
          809.625000000000000000
          317.500000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '(=) Valor Cobrado'
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
      object QRLabel54: TQRLabel
        Left = 3
        Top = 445
        Width = 65
        Height = 11
        Size.Values = (
          29.104166666666670000
          7.937500000000000000
          1177.395833333333000000
          171.979166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'DESTACAR AQUI'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRShape39: TQRShape
        Left = 0
        Top = 457
        Width = 698
        Height = 4
        Size.Values = (
          10.583333333333330000
          0.000000000000000000
          1209.145833333333000000
          1846.791666666667000000)
        XLColumn = 0
        Pen.Style = psDot
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRExpr1: TQRExpr
        Left = 2
        Top = 370
        Width = 155
        Height = 15
        Size.Values = (
          39.687500000000000000
          5.291666666666667000
          978.958333333333300000
          410.104166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Color = clWhite
        Master = Boleto
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'ENDERECO+'#39', '#39' + NUMERO'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
    end
    object ChildBand1: TQRChildBand
      Left = 48
      Top = 536
      Width = 698
      Height = 451
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        1193.270833333333000000
        1846.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = QRBand2
      PrintOrder = cboAfterParent
      object QRDBText13: TQRDBText
        Left = 2
        Top = 3
        Width = 66
        Height = 24
        Size.Values = (
          63.500000000000000000
          5.291666666666667000
          7.937500000000000000
          174.625000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = FrmPrincipal.QEmpresa
        DataField = 'RAZAO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 16
      end
      object QRLabel1: TQRLabel
        Left = 2
        Top = 34
        Width = 127
        Height = 15
        Size.Values = (
          39.687500000000000000
          5.291666666666667000
          89.958333333333330000
          336.020833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Local de Pagamento'
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
        Left = 2
        Top = 49
        Width = 57
        Height = 17
        Size.Values = (
          44.979166666666670000
          5.291666666666667000
          129.645833333333300000
          150.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'QRLabel2'
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
        Left = 2
        Top = 68
        Width = 50
        Height = 15
        Size.Values = (
          39.687500000000000000
          5.291666666666667000
          179.916666666666700000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cedente'
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
      object QRDBText14: TQRDBText
        Left = 2
        Top = 83
        Width = 36
        Height = 15
        Size.Values = (
          39.687500000000000000
          5.291666666666667000
          219.604166666666700000
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
      object QRLabel31: TQRLabel
        Left = 2
        Top = 102
        Width = 99
        Height = 15
        Size.Values = (
          39.687500000000000000
          5.291666666666667000
          269.875000000000000000
          261.937500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Data Documento'
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
      object QRDBText17: TQRDBText
        Left = 2
        Top = 117
        Width = 57
        Height = 15
        Size.Values = (
          39.687500000000000000
          5.291666666666667000
          309.562500000000000000
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
      object QRLabel32: TQRLabel
        Left = 2
        Top = 136
        Width = 85
        Height = 15
        Size.Values = (
          39.687500000000000000
          5.291666666666667000
          359.833333333333300000
          224.895833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Uso do Banco'
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
        Left = 113
        Top = 102
        Width = 113
        Height = 15
        Size.Values = (
          39.687500000000000000
          298.979166666666700000
          269.875000000000000000
          298.979166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'N'#250'mero Documento'
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
      object QRDBText18: TQRDBText
        Left = 113
        Top = 117
        Width = 113
        Height = 15
        Size.Values = (
          39.687500000000000000
          298.979166666666700000
          309.562500000000000000
          298.979166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
        DataField = 'NUM_DOC'
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
      object QRLabel34: TQRLabel
        Left = 249
        Top = 102
        Width = 78
        Height = 15
        Size.Values = (
          39.687500000000000000
          658.812500000000000000
          269.875000000000000000
          206.375000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Esp. Docum.'
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
      object QRLabel35: TQRLabel
        Left = 353
        Top = 102
        Width = 43
        Height = 15
        Size.Values = (
          39.687500000000000000
          933.979166666666700000
          269.875000000000000000
          113.770833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Aceite'
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
        Left = 441
        Top = 102
        Width = 120
        Height = 15
        Size.Values = (
          39.687500000000000000
          1166.812500000000000000
          269.875000000000000000
          317.500000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Dt. Processamento'
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
        Left = 441
        Top = 115
        Width = 43
        Height = 17
        Size.Values = (
          44.979166666666670000
          1166.812500000000000000
          304.270833333333300000
          113.770833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsDate
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
      object QRLabel37: TQRLabel
        Left = 385
        Top = 136
        Width = 36
        Height = 15
        Size.Values = (
          39.687500000000000000
          1018.645833333333000000
          359.833333333333300000
          95.250000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
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
      object QRDBText19: TQRDBText
        Left = 385
        Top = 151
        Width = 93
        Height = 15
        Size.Values = (
          39.687500000000000000
          1018.645833333333000000
          399.520833333333300000
          246.062500000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
        DataField = 'VR_PARCELA'
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
      object QRLabel38: TQRLabel
        Left = 209
        Top = 136
        Width = 71
        Height = 15
        Size.Values = (
          39.687500000000000000
          552.979166666666700000
          359.833333333333300000
          187.854166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Quantidade'
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
      object QRLabel39: TQRLabel
        Left = 161
        Top = 136
        Width = 29
        Height = 15
        Size.Values = (
          39.687500000000000000
          425.979166666666700000
          359.833333333333300000
          76.729166666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Esp.'
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
        Left = 113
        Top = 136
        Width = 36
        Height = 15
        Size.Values = (
          39.687500000000000000
          298.979166666666700000
          359.833333333333300000
          95.250000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cart.'
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
        Left = 569
        Top = 34
        Width = 71
        Height = 15
        Size.Values = (
          39.687500000000000000
          1505.479166666667000000
          89.958333333333330000
          187.854166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Vencimento'
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
      object QRDBText20: TQRDBText
        Left = 569
        Top = 49
        Width = 92
        Height = 15
        Size.Values = (
          39.687500000000000000
          1505.479166666667000000
          129.645833333333300000
          243.416666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QRel
        DataField = 'DT_VENCIMENTO'
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
      object QRLabel42: TQRLabel
        Left = 569
        Top = 68
        Width = 106
        Height = 15
        Size.Values = (
          39.687500000000000000
          1505.479166666667000000
          179.916666666666700000
          280.458333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Ag'#234'ncia/Cedente'
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
        Left = 569
        Top = 102
        Width = 85
        Height = 15
        Size.Values = (
          39.687500000000000000
          1505.479166666667000000
          269.875000000000000000
          224.895833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Nosso N'#250'mero'
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
      object QRDBText21: TQRDBText
        Left = 569
        Top = 117
        Width = 64
        Height = 15
        Size.Values = (
          39.687500000000000000
          1505.479166666667000000
          309.562500000000000000
          169.333333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QRel
        DataField = 'DUPLICATA'
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
      object QRLabel44: TQRLabel
        Left = 570
        Top = 136
        Width = 120
        Height = 15
        Size.Values = (
          39.687500000000000000
          1508.125000000000000000
          359.833333333333300000
          317.500000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '(=) Vr. Documento'
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
      object QRDBText22: TQRDBText
        Left = 569
        Top = 151
        Width = 93
        Height = 15
        Size.Values = (
          39.687500000000000000
          1505.479166666667000000
          399.520833333333300000
          246.062500000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
        DataField = 'VR_PARCELA'
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
      object QRLabel45: TQRLabel
        Left = 569
        Top = 170
        Width = 85
        Height = 15
        Size.Values = (
          39.687500000000000000
          1505.479166666667000000
          449.791666666666700000
          224.895833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '(-) Desconto'
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
        Left = 569
        Top = 204
        Width = 106
        Height = 15
        Size.Values = (
          39.687500000000000000
          1505.479166666667000000
          539.750000000000000000
          280.458333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '(-) Outras Ded.'
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
      object QRLabel47: TQRLabel
        Left = 569
        Top = 238
        Width = 99
        Height = 15
        Size.Values = (
          39.687500000000000000
          1505.479166666667000000
          629.708333333333300000
          261.937500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '(+) Mora/Multa'
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
      object QRLabel48: TQRLabel
        Left = 569
        Top = 272
        Width = 106
        Height = 15
        Size.Values = (
          39.687500000000000000
          1505.479166666667000000
          719.666666666666700000
          280.458333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '(+) Outros Acr.'
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
      object QRLabel49: TQRLabel
        Left = 569
        Top = 306
        Width = 120
        Height = 15
        Size.Values = (
          39.687500000000000000
          1505.479166666667000000
          809.625000000000000000
          317.500000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '(=) Valor Cobrado'
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
      object QRLabel50: TQRLabel
        Left = 513
        Top = 340
        Width = 106
        Height = 15
        Size.Values = (
          39.687500000000000000
          1357.312500000000000000
          899.583333333333300000
          280.458333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'C'#243'digo de Baixa'
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
      object QRDBText23: TQRDBText
        Left = 370
        Top = 355
        Width = 29
        Height = 15
        Size.Values = (
          39.687500000000000000
          978.958333333333300000
          939.270833333333300000
          76.729166666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QRel
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
      object QRDBText24: TQRDBText
        Left = 370
        Top = 370
        Width = 43
        Height = 15
        Size.Values = (
          39.687500000000000000
          978.958333333333300000
          978.958333333333300000
          113.770833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QRel
        DataField = 'BAIRRO'
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
      object QRDBText25: TQRDBText
        Left = 370
        Top = 385
        Width = 22
        Height = 15
        Size.Values = (
          39.687500000000000000
          978.958333333333300000
          1018.645833333333000000
          58.208333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QRel
        DataField = 'CEP'
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
      object QRLabel51: TQRLabel
        Left = 513
        Top = 408
        Width = 148
        Height = 15
        Size.Values = (
          39.687500000000000000
          1357.312500000000000000
          1079.500000000000000000
          391.583333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Autentica'#231#227'o Mec'#226'nica'
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
      object QRLabel52: TQRLabel
        Left = 2
        Top = 408
        Width = 113
        Height = 15
        Size.Values = (
          39.687500000000000000
          5.291666666666667000
          1079.500000000000000000
          298.979166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sacador/Avalista'
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
      object QRDBText26: TQRDBText
        Left = 2
        Top = 385
        Width = 64
        Height = 15
        Size.Values = (
          39.687500000000000000
          5.291666666666667000
          1018.645833333333000000
          169.333333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QRel
        DataField = 'MUNICIPIO'
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
      object QRDBText28: TQRDBText
        Left = 2
        Top = 355
        Width = 29
        Height = 15
        Size.Values = (
          39.687500000000000000
          5.291666666666667000
          939.270833333333300000
          76.729166666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QRel
        DataField = 'NOME'
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
      object QRLabel53: TQRLabel
        Left = 2
        Top = 340
        Width = 43
        Height = 15
        Size.Values = (
          39.687500000000000000
          5.291666666666667000
          899.583333333333300000
          113.770833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sacado'
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
      object QRShape20: TQRShape
        Left = 1
        Top = 29
        Width = 696
        Height = 4
        Size.Values = (
          10.583333333333330000
          2.645833333333333000
          76.729166666666670000
          1841.500000000000000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape21: TQRShape
        Left = 1
        Top = 64
        Width = 696
        Height = 4
        Size.Values = (
          10.583333333333330000
          2.645833333333333000
          169.333333333333300000
          1841.500000000000000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape22: TQRShape
        Left = 1
        Top = 98
        Width = 696
        Height = 4
        Size.Values = (
          10.583333333333330000
          2.645833333333333000
          259.291666666666700000
          1841.500000000000000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape23: TQRShape
        Left = 1
        Top = 132
        Width = 696
        Height = 4
        Size.Values = (
          10.583333333333330000
          2.645833333333333000
          349.250000000000000000
          1841.500000000000000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape24: TQRShape
        Left = 1
        Top = 166
        Width = 696
        Height = 4
        Size.Values = (
          10.583333333333330000
          2.645833333333333000
          439.208333333333300000
          1841.500000000000000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape25: TQRShape
        Left = 1
        Top = 336
        Width = 696
        Height = 4
        Size.Values = (
          10.583333333333330000
          2.645833333333333000
          889.000000000000000000
          1841.500000000000000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape26: TQRShape
        Left = 1
        Top = 425
        Width = 696
        Height = 4
        Size.Values = (
          10.583333333333330000
          2.645833333333333000
          1124.479166666667000000
          1841.500000000000000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape27: TQRShape
        Left = 104
        Top = 100
        Width = 4
        Height = 69
        Size.Values = (
          182.562500000000000000
          275.166666666666700000
          264.583333333333300000
          10.583333333333330000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape28: TQRShape
        Left = 240
        Top = 100
        Width = 4
        Height = 34
        Size.Values = (
          89.958333333333330000
          635.000000000000000000
          264.583333333333300000
          10.583333333333330000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape29: TQRShape
        Left = 344
        Top = 100
        Width = 4
        Height = 34
        Size.Values = (
          89.958333333333330000
          910.166666666666700000
          264.583333333333300000
          10.583333333333330000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape30: TQRShape
        Left = 432
        Top = 100
        Width = 4
        Height = 34
        Size.Values = (
          89.958333333333330000
          1143.000000000000000000
          264.583333333333300000
          10.583333333333330000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape31: TQRShape
        Left = 376
        Top = 134
        Width = 4
        Height = 34
        Size.Values = (
          89.958333333333330000
          994.833333333333300000
          354.541666666666700000
          10.583333333333330000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape32: TQRShape
        Left = 200
        Top = 134
        Width = 4
        Height = 34
        Size.Values = (
          89.958333333333330000
          529.166666666666700000
          354.541666666666700000
          10.583333333333330000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape33: TQRShape
        Left = 152
        Top = 134
        Width = 4
        Height = 34
        Size.Values = (
          89.958333333333330000
          402.166666666666700000
          354.541666666666700000
          10.583333333333330000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape34: TQRShape
        Left = 562
        Top = 200
        Width = 134
        Height = 4
        Size.Values = (
          10.583333333333330000
          1486.958333333333000000
          529.166666666666700000
          354.541666666666700000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape35: TQRShape
        Left = 562
        Top = 234
        Width = 134
        Height = 4
        Size.Values = (
          10.583333333333330000
          1486.958333333333000000
          619.125000000000000000
          354.541666666666700000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape36: TQRShape
        Left = 562
        Top = 268
        Width = 134
        Height = 4
        Size.Values = (
          10.583333333333330000
          1486.958333333333000000
          709.083333333333300000
          354.541666666666700000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape37: TQRShape
        Left = 562
        Top = 302
        Width = 134
        Height = 4
        Size.Values = (
          10.583333333333330000
          1486.958333333333000000
          799.041666666666700000
          354.541666666666700000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape38: TQRShape
        Left = 560
        Top = 31
        Width = 4
        Height = 308
        Size.Values = (
          814.916666666666700000
          1481.666666666667000000
          82.020833333333330000
          10.583333333333330000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRExpr2: TQRExpr
        Left = 2
        Top = 370
        Width = 155
        Height = 15
        Size.Values = (
          39.687500000000000000
          5.291666666666667000
          978.958333333333300000
          410.104166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Color = clWhite
        Master = Boleto
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'ENDERECO+'#39', '#39' + NUMERO'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel55: TQRLabel
        Left = 2
        Top = 170
        Width = 71
        Height = 15
        Size.Values = (
          39.687500000000000000
          5.291666666666667000
          449.791666666666700000
          187.854166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Instru'#231#245'es'
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
      object QRMemo2: TQRMemo
        Left = 2
        Top = 185
        Width = 558
        Height = 146
        Size.Values = (
          386.291666666666700000
          5.291666666666667000
          489.479166666666700000
          1476.375000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
    end
  end
  object Vias: TCurrencyEdit
    Left = 464
    Top = 6
    Width = 67
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    MaxValue = 2.000000000000000000
    MinValue = 1.000000000000000000
    TabOrder = 8
    Value = 1.000000000000000000
    Visible = False
    ZeroEmpty = False
    OnExit = BancoExit
    OnKeyDown = ClienteKeyDown
  end
  object btnRetorna: TBitBtn
    Left = 246
    Top = 224
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
    TabOrder = 10
    OnClick = btnRetornaClick
  end
  object btnExecuta: TBitBtn
    Left = 165
    Top = 224
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
    TabOrder = 9
    OnClick = btnExecutaClick
  end
  object Carne: TQuickRep
    Left = -257
    Top = 543
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
    ReportTitle = 'Carne de Cobran'#231'a'
    SnapToGrid = True
    Units = Inches
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
      Height = 241
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        637.645833333333300000
        1846.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRShape40: TQRShape
        Left = 16
        Top = 8
        Width = 227
        Height = 227
        Size.Values = (
          600.000000000000000000
          42.333333333333340000
          21.166666666666670000
          600.000000000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape41: TQRShape
        Left = 18
        Top = 48
        Width = 110
        Height = 36
        Size.Values = (
          95.250000000000000000
          47.625000000000000000
          127.000000000000000000
          291.041666666666700000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape42: TQRShape
        Left = 18
        Top = 86
        Width = 110
        Height = 36
        Size.Values = (
          95.250000000000000000
          47.625000000000000000
          227.541666666666700000
          291.041666666666700000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape43: TQRShape
        Left = 18
        Top = 162
        Width = 110
        Height = 36
        Size.Values = (
          95.250000000000000000
          47.625000000000000000
          428.625000000000000000
          291.041666666666700000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape44: TQRShape
        Left = 18
        Top = 124
        Width = 110
        Height = 36
        Size.Values = (
          95.250000000000000000
          47.625000000000000000
          328.083333333333400000
          291.041666666666700000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape45: TQRShape
        Left = 131
        Top = 86
        Width = 110
        Height = 36
        Size.Values = (
          95.250000000000000000
          346.604166666666700000
          227.541666666666700000
          291.041666666666700000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape46: TQRShape
        Left = 131
        Top = 48
        Width = 110
        Height = 36
        Size.Values = (
          95.250000000000000000
          346.604166666666700000
          127.000000000000000000
          291.041666666666700000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape47: TQRShape
        Left = 131
        Top = 124
        Width = 110
        Height = 36
        Size.Values = (
          95.250000000000000000
          346.604166666666700000
          328.083333333333400000
          291.041666666666700000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape48: TQRShape
        Left = 131
        Top = 162
        Width = 110
        Height = 36
        Size.Values = (
          95.250000000000000000
          346.604166666666700000
          428.625000000000000000
          291.041666666666700000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape49: TQRShape
        Left = 131
        Top = 10
        Width = 110
        Height = 36
        Size.Values = (
          95.250000000000000000
          346.604166666666700000
          26.458333333333330000
          291.041666666666700000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape50: TQRShape
        Left = 256
        Top = 8
        Width = 425
        Height = 227
        Size.Values = (
          600.604166666666700000
          677.333333333333400000
          21.166666666666670000
          1124.479166666667000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape51: TQRShape
        Left = 258
        Top = 86
        Width = 130
        Height = 36
        Size.Values = (
          95.250000000000000000
          682.625000000000000000
          227.541666666666700000
          343.958333333333400000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape52: TQRShape
        Left = 258
        Top = 124
        Width = 130
        Height = 36
        Size.Values = (
          95.250000000000000000
          682.625000000000000000
          328.083333333333400000
          343.958333333333400000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape53: TQRShape
        Left = 258
        Top = 162
        Width = 130
        Height = 36
        Size.Values = (
          95.250000000000000000
          682.625000000000000000
          428.625000000000000000
          343.958333333333400000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape54: TQRShape
        Left = 392
        Top = 86
        Width = 130
        Height = 36
        Size.Values = (
          95.250000000000000000
          1037.166666666667000000
          227.541666666666700000
          343.958333333333400000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape55: TQRShape
        Left = 392
        Top = 124
        Width = 130
        Height = 36
        Size.Values = (
          95.250000000000000000
          1037.166666666667000000
          328.083333333333400000
          343.958333333333400000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape56: TQRShape
        Left = 392
        Top = 162
        Width = 130
        Height = 36
        Size.Values = (
          95.250000000000000000
          1037.166666666667000000
          428.625000000000000000
          343.958333333333400000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape57: TQRShape
        Left = 526
        Top = 86
        Width = 153
        Height = 36
        Size.Values = (
          95.250000000000000000
          1391.708333333333000000
          227.541666666666700000
          404.812500000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape58: TQRShape
        Left = 526
        Top = 124
        Width = 153
        Height = 36
        Size.Values = (
          95.250000000000000000
          1391.708333333333000000
          328.083333333333400000
          404.812500000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape59: TQRShape
        Left = 526
        Top = 162
        Width = 153
        Height = 36
        Size.Values = (
          95.250000000000000000
          1391.708333333333000000
          428.625000000000000000
          404.812500000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape60: TQRShape
        Left = 526
        Top = 48
        Width = 153
        Height = 36
        Size.Values = (
          95.250000000000000000
          1391.708333333333000000
          127.000000000000000000
          404.812500000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape61: TQRShape
        Left = 526
        Top = 10
        Width = 153
        Height = 36
        Size.Values = (
          95.250000000000000000
          1391.708333333333000000
          26.458333333333330000
          404.812500000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel56: TQRLabel
        Left = 20
        Top = 50
        Width = 37
        Height = 15
        Size.Values = (
          39.687500000000000000
          52.916666666666670000
          132.291666666666700000
          97.895833333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Parcela'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel57: TQRLabel
        Left = 20
        Top = 88
        Width = 34
        Height = 15
        Size.Values = (
          39.687500000000000000
          52.916666666666670000
          232.833333333333300000
          89.958333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'C'#243'digo'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel58: TQRLabel
        Left = 20
        Top = 126
        Width = 58
        Height = 15
        Size.Values = (
          39.687500000000000000
          52.916666666666670000
          333.375000000000000000
          153.458333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Vencimento'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel59: TQRLabel
        Left = 20
        Top = 164
        Width = 76
        Height = 15
        Size.Values = (
          39.687500000000000000
          52.916666666666670000
          433.916666666666700000
          201.083333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Processamento'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel60: TQRLabel
        Left = 133
        Top = 12
        Width = 82
        Height = 15
        Size.Values = (
          39.687500000000000000
          351.895833333333300000
          31.750000000000000000
          216.958333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Valor da Compra'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel61: TQRLabel
        Left = 133
        Top = 50
        Width = 81
        Height = 15
        Size.Values = (
          39.687500000000000000
          351.895833333333300000
          132.291666666666700000
          214.312500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Valor da Parcela'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel62: TQRLabel
        Left = 133
        Top = 88
        Width = 26
        Height = 15
        Size.Values = (
          39.687500000000000000
          351.895833333333300000
          232.833333333333300000
          68.791666666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Multa'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel63: TQRLabel
        Left = 133
        Top = 126
        Width = 28
        Height = 15
        Size.Values = (
          39.687500000000000000
          351.895833333333300000
          333.375000000000000000
          74.083333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Juros'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel64: TQRLabel
        Left = 133
        Top = 164
        Width = 24
        Height = 15
        Size.Values = (
          39.687500000000000000
          351.895833333333300000
          433.916666666666700000
          63.500000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel65: TQRLabel
        Left = 260
        Top = 88
        Width = 37
        Height = 15
        Size.Values = (
          39.687500000000000000
          687.916666666666700000
          232.833333333333300000
          97.895833333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Parcela'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel66: TQRLabel
        Left = 260
        Top = 126
        Width = 34
        Height = 15
        Size.Values = (
          39.687500000000000000
          687.916666666666700000
          333.375000000000000000
          89.958333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'C'#243'digo'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel67: TQRLabel
        Left = 394
        Top = 88
        Width = 76
        Height = 15
        Size.Values = (
          39.687500000000000000
          1042.458333333333000000
          232.833333333333300000
          201.083333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Processamento'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel68: TQRLabel
        Left = 394
        Top = 126
        Width = 58
        Height = 15
        Size.Values = (
          39.687500000000000000
          1042.458333333333000000
          333.375000000000000000
          153.458333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Vencimento'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel69: TQRLabel
        Left = 528
        Top = 12
        Width = 82
        Height = 15
        Size.Values = (
          39.687500000000000000
          1397.000000000000000000
          31.750000000000000000
          216.958333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Valor da Compra'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel70: TQRLabel
        Left = 528
        Top = 50
        Width = 81
        Height = 15
        Size.Values = (
          39.687500000000000000
          1397.000000000000000000
          132.291666666666700000
          214.312500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Valor da Parcela'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel71: TQRLabel
        Left = 528
        Top = 88
        Width = 26
        Height = 15
        Size.Values = (
          39.687500000000000000
          1397.000000000000000000
          232.833333333333300000
          68.791666666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Multa'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel72: TQRLabel
        Left = 528
        Top = 126
        Width = 28
        Height = 15
        Size.Values = (
          39.687500000000000000
          1397.000000000000000000
          333.375000000000000000
          74.083333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Juros'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel73: TQRLabel
        Left = 528
        Top = 164
        Width = 24
        Height = 15
        Size.Values = (
          39.687500000000000000
          1397.000000000000000000
          433.916666666666700000
          63.500000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel74: TQRLabel
        Left = 18
        Top = 200
        Width = 222
        Height = 33
        Size.Values = (
          87.312500000000000000
          47.625000000000000000
          529.166666666666700000
          587.375000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 
          'O PAGAMENTO EFETUADO FORA DAS DATAS DE VENCIMENTO SUJEITAR'#193' O CL' +
          'IENTE A MULTA E JUROS (0,1666% AO DIA). JUROS DE 5% AO M'#202'S'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRDBText7: TQRDBText
        Left = 133
        Top = 29
        Width = 105
        Height = 15
        Size.Values = (
          39.687500000000000000
          351.895833333333400000
          76.729166666666670000
          277.812500000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
        DataField = 'VALOR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Mask = '#,##0.00'
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText27: TQRDBText
        Left = 528
        Top = 29
        Width = 148
        Height = 15
        Size.Values = (
          39.687500000000000000
          1397.000000000000000000
          76.729166666666670000
          391.583333333333400000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
        DataField = 'VALOR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Mask = '#,##0.00'
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText29: TQRDBText
        Left = 20
        Top = 67
        Width = 105
        Height = 15
        Size.Values = (
          39.687500000000000000
          52.916666666666660000
          177.270833333333300000
          277.812500000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
        DataField = 'PARCELA_ID'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText30: TQRDBText
        Left = 20
        Top = 105
        Width = 105
        Height = 15
        Size.Values = (
          39.687500000000000000
          52.916666666666660000
          277.812500000000000000
          277.812500000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
        DataField = 'DUPLICATA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText31: TQRDBText
        Left = 260
        Top = 105
        Width = 125
        Height = 15
        Size.Values = (
          39.687500000000000000
          687.916666666666700000
          277.812500000000000000
          330.729166666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
        DataField = 'PARCELA_ID'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText32: TQRDBText
        Left = 394
        Top = 105
        Width = 125
        Height = 15
        Size.Values = (
          39.687500000000000000
          1042.458333333333000000
          277.812500000000000000
          330.729166666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
        DataField = 'DT_TRANS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText33: TQRDBText
        Left = 20
        Top = 143
        Width = 105
        Height = 15
        Size.Values = (
          39.687500000000000000
          52.916666666666660000
          378.354166666666700000
          277.812500000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
        DataField = 'DT_VENCIMENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText34: TQRDBText
        Left = 260
        Top = 143
        Width = 125
        Height = 15
        Size.Values = (
          39.687500000000000000
          687.916666666666700000
          378.354166666666700000
          330.729166666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
        DataField = 'DUPLICATA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText35: TQRDBText
        Left = 394
        Top = 141
        Width = 125
        Height = 15
        Size.Values = (
          39.687500000000000000
          1042.458333333333000000
          373.062500000000000000
          330.729166666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
        DataField = 'DT_VENCIMENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText36: TQRDBText
        Left = 20
        Top = 181
        Width = 105
        Height = 15
        Size.Values = (
          39.687500000000000000
          52.916666666666660000
          478.895833333333400000
          277.812500000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
        DataField = 'DT_TRANS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText37: TQRDBText
        Left = 258
        Top = 11
        Width = 267
        Height = 15
        Size.Values = (
          39.687500000000000000
          682.625000000000000000
          29.104166666666670000
          706.437500000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
        DataField = 'NOME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText38: TQRDBText
        Left = 258
        Top = 32
        Width = 267
        Height = 15
        Size.Values = (
          39.687500000000000000
          682.625000000000000000
          84.666666666666670000
          706.437500000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
        DataField = 'CNPJ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText39: TQRDBText
        Left = 258
        Top = 49
        Width = 267
        Height = 15
        Size.Values = (
          39.687500000000000000
          682.625000000000000000
          129.645833333333300000
          706.437500000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
        DataField = 'ENDERECO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText40: TQRDBText
        Left = 258
        Top = 65
        Width = 267
        Height = 15
        Size.Values = (
          39.687500000000000000
          682.625000000000000000
          171.979166666666700000
          706.437500000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
        DataField = 'BAIRRO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel75: TQRLabel
        Left = 258
        Top = 200
        Width = 420
        Height = 33
        Size.Values = (
          87.312500000000000000
          682.625000000000000000
          529.166666666666700000
          1111.250000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 
          'O PAGAMENTO EFETUADO FORA DAS DATAS DE VENCIMENTO SUJEITAR'#193' O CL' +
          'IENTE A MULTA E JUROS (0,1666% AO DIA). JUROS DE 5% AO M'#202'S'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRDBText41: TQRDBText
        Left = 133
        Top = 67
        Width = 105
        Height = 15
        Size.Values = (
          39.687500000000000000
          351.895833333333400000
          177.270833333333300000
          277.812500000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
        DataField = 'VR_PARCELA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Mask = '#,##0.00'
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText42: TQRDBText
        Left = 528
        Top = 67
        Width = 148
        Height = 15
        Size.Values = (
          39.687500000000000000
          1397.000000000000000000
          177.270833333333300000
          391.583333333333400000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
        DataField = 'VR_PARCELA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Mask = '#,##0.00'
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel76: TQRLabel
        Left = 20
        Top = 12
        Width = 58
        Height = 15
        Size.Values = (
          39.687500000000000000
          52.916666666666670000
          31.750000000000000000
          153.458333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'C'#243'd. Cliente'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText43: TQRDBText
        Left = 20
        Top = 29
        Width = 105
        Height = 15
        Size.Values = (
          39.687500000000000000
          52.916666666666660000
          76.729166666666670000
          277.812500000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
        DataField = 'CLIENTE_ID'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
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
  end
  object Duplicata_Mercantil: TQuickRep
    Left = 3
    Top = 850
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
    ReportTitle = 'Duplicata Mercantil'
    SnapToGrid = True
    Units = Inches
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsMaximized
    PreviewWidth = 500
    PreviewHeight = 500
    PrevInitialZoom = qrZoomToWidth
    PreviewDefaultSaveType = stQRP
    PreviewLeft = 0
    PreviewTop = 0
    object QRBand1: TQRBand
      Left = 48
      Top = 48
      Width = 698
      Height = 618
      AlignToBottom = False
      BeforePrint = QRBand1BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        1635.125000000000000000
        1846.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRShape62: TQRShape
        Left = 4
        Top = 0
        Width = 694
        Height = 127
        Size.Values = (
          336.020833333333300000
          10.583333333333330000
          0.000000000000000000
          1836.208333333333000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel77: TQRLabel
        Left = 536
        Top = 4
        Width = 110
        Height = 23
        Size.Values = (
          60.854166666666670000
          1418.166666666667000000
          10.583333333333330000
          291.041666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'DUPLICATA'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 14
      end
      object QRLabel78: TQRLabel
        Left = 6
        Top = 25
        Width = 26
        Height = 15
        Size.Values = (
          39.687500000000000000
          15.875000000000000000
          66.145833333333330000
          68.791666666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'CNPJ'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel79: TQRLabel
        Left = 6
        Top = 42
        Width = 49
        Height = 15
        Size.Values = (
          39.687500000000000000
          15.875000000000000000
          111.125000000000000000
          129.645833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Inscr. Est.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape63: TQRShape
        Left = 4
        Top = 164
        Width = 506
        Size.Values = (
          171.979166666666700000
          10.583333333333330000
          433.916666666666700000
          1338.791666666667000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel81: TQRLabel
        Left = 23
        Top = 166
        Width = 58
        Height = 15
        Size.Values = (
          39.687500000000000000
          60.854166666666670000
          439.208333333333300000
          153.458333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'FATURA N'#186
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel82: TQRLabel
        Left = 128
        Top = 166
        Width = 103
        Height = 15
        Size.Values = (
          39.687500000000000000
          338.666666666666700000
          439.208333333333300000
          272.520833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'FATURA/DUPLICATA'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel83: TQRLabel
        Left = 151
        Top = 183
        Width = 54
        Height = 15
        Size.Values = (
          39.687500000000000000
          399.520833333333300000
          484.187500000000000000
          142.875000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'VALOR R$'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel84: TQRLabel
        Left = 280
        Top = 166
        Width = 112
        Height = 15
        Size.Values = (
          39.687500000000000000
          740.833333333333300000
          439.208333333333300000
          296.333333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'DUPLICATA N'#186' ORDEM'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel85: TQRLabel
        Left = 432
        Top = 166
        Width = 66
        Height = 15
        Size.Values = (
          39.687500000000000000
          1143.000000000000000000
          439.208333333333300000
          174.625000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'VENCIMENTO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape64: TQRShape
        Left = 522
        Top = 133
        Width = 176
        Height = 99
        Size.Values = (
          261.937500000000000000
          1381.125000000000000000
          351.895833333333300000
          465.666666666666700000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel86: TQRLabel
        Left = 528
        Top = 138
        Width = 161
        Height = 17
        Size.Values = (
          44.979166666666670000
          1397.000000000000000000
          365.125000000000000000
          425.979166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Para uso da institui'#231#227'o financeira'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape65: TQRShape
        Left = 4
        Top = 198
        Width = 506
        Height = 4
        Size.Values = (
          10.583333333333330000
          10.583333333333330000
          523.875000000000000000
          1338.791666666667000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape66: TQRShape
        Left = 98
        Top = 164
        Width = 4
        Size.Values = (
          171.979166666666700000
          259.291666666666700000
          433.916666666666700000
          10.583333333333330000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape67: TQRShape
        Left = 252
        Top = 165
        Width = 4
        Size.Values = (
          171.979166666666700000
          666.750000000000000000
          436.562500000000000000
          10.583333333333330000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape68: TQRShape
        Left = 413
        Top = 165
        Width = 4
        Size.Values = (
          171.979166666666700000
          1092.729166666667000000
          436.562500000000000000
          10.583333333333330000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRDBText44: TQRDBText
        Left = 6
        Top = 4
        Width = 55
        Height = 19
        Size.Values = (
          50.270833333333330000
          15.875000000000000000
          10.583333333333330000
          145.520833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = FrmPrincipal.QEmpresa
        DataField = 'RAZAO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 12
      end
      object QRDBText45: TQRDBText
        Left = 64
        Top = 25
        Width = 26
        Height = 15
        Size.Values = (
          39.687500000000000000
          169.333333333333300000
          66.145833333333330000
          68.791666666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = FrmPrincipal.QEmpresa
        DataField = 'CNPJ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText46: TQRDBText
        Left = 64
        Top = 42
        Width = 92
        Height = 15
        Size.Values = (
          39.687500000000000000
          169.333333333333300000
          111.125000000000000000
          243.416666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = FrmPrincipal.QEmpresa
        DataField = 'INSCR_ESTADUAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel87: TQRLabel
        Left = 6
        Top = 59
        Width = 47
        Height = 15
        Size.Values = (
          39.687500000000000000
          15.875000000000000000
          156.104166666666700000
          124.354166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Endere'#231'o'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText47: TQRDBText
        Left = 62
        Top = 59
        Width = 55
        Height = 15
        Size.Values = (
          39.687500000000000000
          164.041666666666700000
          156.104166666666700000
          145.520833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = FrmPrincipal.QEmpresa
        DataField = 'ENDERECO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel88: TQRLabel
        Left = 332
        Top = 59
        Width = 41
        Height = 15
        Size.Values = (
          39.687500000000000000
          878.416666666666700000
          156.104166666666700000
          108.479166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'N'#250'mero:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText48: TQRDBText
        Left = 382
        Top = 59
        Width = 44
        Height = 15
        Size.Values = (
          39.687500000000000000
          1010.708333333333000000
          156.104166666666700000
          116.416666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = FrmPrincipal.QEmpresa
        DataField = 'NUMERO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel89: TQRLabel
        Left = 6
        Top = 76
        Width = 30
        Height = 15
        Size.Values = (
          39.687500000000000000
          15.875000000000000000
          201.083333333333300000
          79.375000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Bairro'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText49: TQRDBText
        Left = 62
        Top = 76
        Width = 40
        Height = 15
        Size.Values = (
          39.687500000000000000
          164.041666666666700000
          201.083333333333300000
          105.833333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = FrmPrincipal.QEmpresa
        DataField = 'BAIRRO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel90: TQRLabel
        Left = 6
        Top = 93
        Width = 34
        Height = 15
        Size.Values = (
          39.687500000000000000
          15.875000000000000000
          246.062500000000000000
          89.958333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cidade'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText50: TQRDBText
        Left = 62
        Top = 93
        Width = 50
        Height = 15
        Size.Values = (
          39.687500000000000000
          164.041666666666700000
          246.062500000000000000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = FrmPrincipal.QEmpresa
        DataField = 'MUNICIPIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel91: TQRLabel
        Left = 332
        Top = 93
        Width = 23
        Height = 15
        Size.Values = (
          39.687500000000000000
          878.416666666666700000
          246.062500000000000000
          60.854166666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'CEP:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText51: TQRDBText
        Left = 382
        Top = 93
        Width = 20
        Height = 15
        Size.Values = (
          39.687500000000000000
          1010.708333333333000000
          246.062500000000000000
          52.916666666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = FrmPrincipal.QEmpresa
        DataField = 'CEP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel92: TQRLabel
        Left = 6
        Top = 110
        Width = 43
        Height = 15
        Size.Values = (
          39.687500000000000000
          15.875000000000000000
          291.041666666666700000
          113.770833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Telefone'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText52: TQRDBText
        Left = 62
        Top = 110
        Width = 52
        Height = 15
        Size.Values = (
          39.687500000000000000
          164.041666666666700000
          291.041666666666700000
          137.583333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = FrmPrincipal.QEmpresa
        DataField = 'TELEFONE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRShape69: TQRShape
        Left = 480
        Top = 0
        Width = 4
        Height = 127
        Size.Values = (
          336.020833333333300000
          1270.000000000000000000
          0.000000000000000000
          10.583333333333330000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRLabel80: TQRLabel
        Left = 4
        Top = 233
        Width = 245
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          616.479166666666700000
          648.229166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Desconto de 10% sobre R$ 100,00 at'#233' 31/12/2010'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel93: TQRLabel
        Left = 4
        Top = 250
        Width = 101
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          661.458333333333300000
          267.229166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Condi'#231#245'es Especiais'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape70: TQRShape
        Left = 4
        Top = 265
        Width = 694
        Height = 90
        Size.Values = (
          238.125000000000000000
          10.583333333333330000
          701.145833333333300000
          1836.208333333333000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel94: TQRLabel
        Left = 6
        Top = 267
        Width = 83
        Height = 15
        Size.Values = (
          39.687500000000000000
          15.875000000000000000
          706.437500000000000000
          219.604166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Nome do Sacado'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText53: TQRDBText
        Left = 96
        Top = 267
        Width = 30
        Height = 15
        Size.Values = (
          39.687500000000000000
          254.000000000000000000
          706.437500000000000000
          79.375000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QRel
        DataField = 'NOME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel95: TQRLabel
        Left = 6
        Top = 284
        Width = 47
        Height = 15
        Size.Values = (
          39.687500000000000000
          15.875000000000000000
          751.416666666666700000
          124.354166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Endere'#231'o'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel96: TQRLabel
        Left = 6
        Top = 301
        Width = 30
        Height = 15
        Size.Values = (
          39.687500000000000000
          15.875000000000000000
          796.395833333333300000
          79.375000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Bairro'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText55: TQRDBText
        Left = 96
        Top = 301
        Width = 40
        Height = 15
        Size.Values = (
          39.687500000000000000
          254.000000000000000000
          796.395833333333300000
          105.833333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QRel
        DataField = 'BAIRRO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel97: TQRLabel
        Left = 6
        Top = 318
        Width = 62
        Height = 15
        Size.Values = (
          39.687500000000000000
          15.875000000000000000
          841.375000000000000000
          164.041666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Pra'#231'a Pagto.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText56: TQRDBText
        Left = 96
        Top = 318
        Width = 50
        Height = 15
        Size.Values = (
          39.687500000000000000
          254.000000000000000000
          841.375000000000000000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QRel
        DataField = 'MUNICIPIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel98: TQRLabel
        Left = 6
        Top = 335
        Width = 48
        Height = 15
        Size.Values = (
          39.687500000000000000
          15.875000000000000000
          886.354166666666700000
          127.000000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'CNPJ/CPF'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText57: TQRDBText
        Left = 96
        Top = 335
        Width = 26
        Height = 15
        Size.Values = (
          39.687500000000000000
          254.000000000000000000
          886.354166666666700000
          68.791666666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QRel
        DataField = 'CNPJ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel99: TQRLabel
        Left = 438
        Top = 318
        Width = 34
        Height = 15
        Size.Values = (
          39.687500000000000000
          1158.875000000000000000
          841.375000000000000000
          89.958333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Estado'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText58: TQRDBText
        Left = 512
        Top = 318
        Width = 43
        Height = 15
        Size.Values = (
          39.687500000000000000
          1354.666666666667000000
          841.375000000000000000
          113.770833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QRel
        DataField = 'ESTADO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel100: TQRLabel
        Left = 438
        Top = 335
        Width = 67
        Height = 15
        Size.Values = (
          39.687500000000000000
          1158.875000000000000000
          886.354166666666700000
          177.270833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Inscr. Est./RG'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText59: TQRDBText
        Left = 512
        Top = 335
        Width = 56
        Height = 15
        Size.Values = (
          39.687500000000000000
          1354.666666666667000000
          886.354166666666700000
          148.166666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QRel
        DataField = 'INSCRICAO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText60: TQRDBText
        Left = 6
        Top = 206
        Width = 90
        Height = 15
        Size.Values = (
          39.687500000000000000
          15.875000000000000000
          545.041666666666700000
          238.125000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
        DataField = 'TRANSACAO_ID'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText61: TQRDBText
        Left = 105
        Top = 206
        Width = 144
        Height = 15
        Size.Values = (
          39.687500000000000000
          277.812500000000000000
          545.041666666666700000
          381.000000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
        DataField = 'VR_PARCELA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
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
      object QRDBText62: TQRDBText
        Left = 258
        Top = 206
        Width = 154
        Height = 15
        Size.Values = (
          39.687500000000000000
          682.625000000000000000
          545.041666666666700000
          407.458333333333300000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
        DataField = 'DUPLICATA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText63: TQRDBText
        Left = 419
        Top = 206
        Width = 85
        Height = 15
        Size.Values = (
          39.687500000000000000
          1108.604166666667000000
          545.041666666666700000
          224.895833333333300000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
        DataField = 'DT_VENCIMENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRShape71: TQRShape
        Left = 4
        Top = 360
        Width = 694
        Size.Values = (
          171.979166666666700000
          10.583333333333330000
          952.500000000000000000
          1836.208333333333000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel101: TQRLabel
        Left = 6
        Top = 367
        Width = 88
        Height = 15
        Size.Values = (
          39.687500000000000000
          15.875000000000000000
          971.020833333333300000
          232.833333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Valor por extenso'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape72: TQRShape
        Left = 100
        Top = 360
        Width = 4
        Size.Values = (
          171.979166666666700000
          264.583333333333300000
          952.500000000000000000
          10.583333333333330000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape73: TQRShape
        Left = 4
        Top = 483
        Width = 694
        Height = 50
        Size.Values = (
          132.291666666666700000
          10.583333333333330000
          1277.937500000000000000
          1836.208333333333000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel102: TQRLabel
        Left = 6
        Top = 487
        Width = 689
        Height = 44
        Size.Values = (
          116.416666666666700000
          15.875000000000000000
          1288.520833333333000000
          1822.979166666667000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 
          'Reconhecemos a exatid'#227'o desta DUPLICATA DE VENDA MERCANTIL, na i' +
          'mport'#226'ncia acima, que pagaremos '#224', ou '#224' sua ordem, na pra'#231'a e ve' +
          'ncimento indicados. N'#227'o sendo paga no dia do vencimento, cobrar ' +
          'juros de mora e despesas financeiras. N'#227'o conceder descontos mes' +
          'mo condicionalmente.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel103: TQRLabel
        Left = 108
        Top = 370
        Width = 580
        Height = 44
        Size.Values = (
          116.416666666666700000
          285.750000000000000000
          978.958333333333300000
          1534.583333333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'QRLabel103'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape74: TQRShape
        Left = 4
        Top = 534
        Width = 694
        Height = 51
        Size.Values = (
          134.937500000000000000
          10.583333333333330000
          1412.875000000000000000
          1836.208333333333000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel104: TQRLabel
        Left = 9
        Top = 536
        Width = 72
        Height = 15
        Size.Values = (
          39.687500000000000000
          23.812500000000000000
          1418.166666666667000000
          190.500000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Data do Aceite'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText64: TQRDBText
        Left = 88
        Top = 536
        Width = 55
        Height = 15
        Size.Values = (
          39.687500000000000000
          232.833333333333300000
          1418.166666666667000000
          145.520833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataField = 'DT_TRANS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRShape75: TQRShape
        Left = 400
        Top = 559
        Width = 289
        Height = 4
        Size.Values = (
          10.583333333333330000
          1058.333333333333000000
          1479.020833333333000000
          764.645833333333300000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel105: TQRLabel
        Left = 480
        Top = 566
        Width = 134
        Height = 15
        Size.Values = (
          39.687500000000000000
          1270.000000000000000000
          1497.541666666667000000
          354.541666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'ASSINATURA DO SACADO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText65: TQRDBText
        Left = 490
        Top = 52
        Width = 199
        Height = 23
        Size.Values = (
          60.854166666666670000
          1296.458333333333000000
          137.583333333333300000
          526.520833333333300000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = 'DUPLICATA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 14
      end
      object QRExpr4: TQRExpr
        Left = 98
        Top = 284
        Width = 126
        Height = 17
        Size.Values = (
          44.979166666666670000
          259.291666666666700000
          751.416666666666700000
          333.375000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        Master = Duplicata
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'ENDERECO+'#39', '#39' + NUMERO'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape103: TQRShape
        Left = 4
        Top = 131
        Width = 506
        Height = 32
        Size.Values = (
          84.666666666666670000
          10.583333333333330000
          346.604166666666700000
          1338.791666666667000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel163: TQRLabel
        Left = 8
        Top = 133
        Width = 127
        Height = 15
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          351.895833333333300000
          336.020833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Local de Pagamento'
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
      object QRLabel164: TQRLabel
        Left = 9
        Top = 145
        Width = 48
        Height = 17
        Enabled = False
        Size.Values = (
          44.979166666666670000
          23.812500000000000000
          383.645833333333300000
          127.000000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'QRLabel2'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape104: TQRShape
        Left = 4
        Top = 428
        Width = 694
        Height = 53
        Size.Values = (
          140.229166666666700000
          10.583333333333330000
          1132.416666666667000000
          1836.208333333333000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel165: TQRLabel
        Left = 6
        Top = 431
        Width = 52
        Height = 15
        Size.Values = (
          39.687500000000000000
          15.875000000000000000
          1140.354166666667000000
          137.583333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Instru'#231#245'es'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRMemo3: TQRMemo
        Left = 6
        Top = 443
        Width = 683
        Height = 34
        Size.Values = (
          89.958333333333330000
          15.875000000000000000
          1172.104166666667000000
          1807.104166666667000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
    end
  end
  object Duplicata: TQuickRep
    Left = 102
    Top = 850
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
    ReportTitle = 'Duplicata Mercantil'
    SnapToGrid = True
    Units = Inches
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsMaximized
    PreviewWidth = 500
    PreviewHeight = 500
    PrevInitialZoom = qrZoomToWidth
    PreviewDefaultSaveType = stQRP
    PreviewLeft = 0
    PreviewTop = 0
    object DetailBand1: TQRBand
      Left = 48
      Top = 48
      Width = 698
      Height = 509
      Frame.DrawTop = True
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
        1346.729166666667000000
        1846.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRShape76: TQRShape
        Left = 0
        Top = 58
        Width = 698
        Height = 1
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          153.458333333333300000
          1846.791666666667000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape77: TQRShape
        Left = 0
        Top = 145
        Width = 698
        Height = 1
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          383.645833333333300000
          1846.791666666667000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape78: TQRShape
        Left = 0
        Top = 224
        Width = 698
        Height = 1
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          592.666666666666700000
          1846.791666666667000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape79: TQRShape
        Left = 0
        Top = 318
        Width = 698
        Height = 1
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          841.375000000000000000
          1846.791666666667000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel106: TQRLabel
        Left = 12
        Top = 106
        Width = 89
        Height = 17
        Size.Values = (
          44.979166666666670000
          31.750000000000000000
          280.458333333333300000
          235.479166666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'N. FISCAL'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel107: TQRLabel
        Left = 136
        Top = 106
        Width = 89
        Height = 17
        Size.Values = (
          44.979166666666670000
          359.833333333333300000
          280.458333333333300000
          235.479166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'VR. N. FISCAL'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel108: TQRLabel
        Left = 256
        Top = 106
        Width = 89
        Height = 17
        Size.Values = (
          44.979166666666670000
          677.333333333333300000
          280.458333333333300000
          235.479166666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'VR. DUPLIC.'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel109: TQRLabel
        Left = 368
        Top = 106
        Width = 89
        Height = 17
        Size.Values = (
          44.979166666666670000
          973.666666666666700000
          280.458333333333300000
          235.479166666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'NR. DUPLIC.'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel110: TQRLabel
        Left = 480
        Top = 106
        Width = 89
        Height = 17
        Size.Values = (
          44.979166666666670000
          1270.000000000000000000
          280.458333333333300000
          235.479166666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'EMISS'#195'O'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel111: TQRLabel
        Left = 600
        Top = 106
        Width = 89
        Height = 17
        Size.Values = (
          44.979166666666670000
          1587.500000000000000000
          280.458333333333300000
          235.479166666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'VENCIM.'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel112: TQRLabel
        Left = 12
        Top = 148
        Width = 82
        Height = 17
        Size.Values = (
          44.979166666666670000
          31.750000000000000000
          391.583333333333300000
          216.958333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'SACADO :'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel113: TQRLabel
        Left = 456
        Top = 148
        Width = 77
        Height = 17
        Size.Values = (
          44.979166666666670000
          1206.500000000000000000
          391.583333333333300000
          203.729166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'TELEFONE :'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel114: TQRLabel
        Left = 12
        Top = 167
        Width = 82
        Height = 17
        Size.Values = (
          44.979166666666670000
          31.750000000000000000
          441.854166666666700000
          216.958333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'ENDERE'#199'O :'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel115: TQRLabel
        Left = 456
        Top = 167
        Width = 77
        Height = 17
        Size.Values = (
          44.979166666666670000
          1206.500000000000000000
          441.854166666666700000
          203.729166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'BAIRRO :'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel116: TQRLabel
        Left = 12
        Top = 186
        Width = 82
        Height = 17
        Size.Values = (
          44.979166666666670000
          31.750000000000000000
          492.125000000000000000
          216.958333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'CIDADE :'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel117: TQRLabel
        Left = 456
        Top = 186
        Width = 77
        Height = 17
        Size.Values = (
          44.979166666666670000
          1206.500000000000000000
          492.125000000000000000
          203.729166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'ESTADO :'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel118: TQRLabel
        Left = 12
        Top = 205
        Width = 82
        Height = 17
        Size.Values = (
          44.979166666666670000
          31.750000000000000000
          542.395833333333300000
          216.958333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'CPF/CGC :'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel119: TQRLabel
        Left = 456
        Top = 205
        Width = 77
        Height = 17
        Size.Values = (
          44.979166666666670000
          1206.500000000000000000
          542.395833333333300000
          203.729166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'INSC./RG :'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel120: TQRLabel
        Left = 12
        Top = 230
        Width = 141
        Height = 17
        Size.Values = (
          44.979166666666670000
          31.750000000000000000
          608.541666666666700000
          373.062500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'VALOR POR EXTENSO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel121: TQRLabel
        Left = 12
        Top = 323
        Width = 163
        Height = 17
        Size.Values = (
          44.979166666666670000
          31.750000000000000000
          854.604166666666700000
          431.270833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'ASSINATURA DO CLIENTE'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel122: TQRLabel
        Left = 12
        Top = 350
        Width = 679
        Height = 37
        Size.Values = (
          97.895833333333330000
          31.750000000000000000
          926.041666666666700000
          1796.520833333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'QRLabel17'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRShape80: TQRShape
        Left = 120
        Top = 105
        Width = 1
        Height = 40
        Size.Values = (
          105.833333333333300000
          317.500000000000000000
          277.812500000000000000
          2.645833333333333000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRDBText66: TQRDBText
        Left = 12
        Top = 2
        Width = 45
        Height = 17
        Size.Values = (
          44.979166666666670000
          31.750000000000000000
          5.291666666666667000
          119.062500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = FrmPrincipal.QEmpresa
        DataField = 'RAZAO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsUnderline]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText67: TQRDBText
        Left = 96
        Top = 21
        Width = 74
        Height = 17
        Size.Values = (
          44.979166666666670000
          254.000000000000000000
          55.562500000000000000
          195.791666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = FrmPrincipal.QEmpresa
        DataField = 'ENDERECO'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel123: TQRLabel
        Left = 12
        Top = 21
        Width = 78
        Height = 17
        Size.Values = (
          44.979166666666670000
          31.750000000000000000
          55.562500000000000000
          206.375000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'ENDERE'#199'O:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel124: TQRLabel
        Left = 392
        Top = 21
        Width = 73
        Height = 17
        Size.Values = (
          44.979166666666670000
          1037.166666666667000000
          55.562500000000000000
          193.145833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'TELEFONE:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRDBText68: TQRDBText
        Left = 472
        Top = 21
        Width = 69
        Height = 17
        Size.Values = (
          44.979166666666670000
          1248.833333333333000000
          55.562500000000000000
          182.562500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = FrmPrincipal.QEmpresa
        DataField = 'TELEFONE'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel125: TQRLabel
        Left = 12
        Top = 40
        Width = 78
        Height = 17
        Size.Values = (
          44.979166666666670000
          31.750000000000000000
          105.833333333333300000
          206.375000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'BAIRRO:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel126: TQRLabel
        Left = 392
        Top = 40
        Width = 73
        Height = 17
        Size.Values = (
          44.979166666666670000
          1037.166666666667000000
          105.833333333333300000
          193.145833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'CIDADE:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRDBText69: TQRDBText
        Left = 96
        Top = 40
        Width = 50
        Height = 17
        Size.Values = (
          44.979166666666670000
          254.000000000000000000
          105.833333333333300000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = FrmPrincipal.QEmpresa
        DataField = 'BAIRRO'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText70: TQRDBText
        Left = 472
        Top = 40
        Width = 67
        Height = 17
        Size.Values = (
          44.979166666666670000
          1248.833333333333000000
          105.833333333333300000
          177.270833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = FrmPrincipal.QEmpresa
        DataField = 'MUNICIPIO'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText71: TQRDBText
        Left = 12
        Top = 125
        Width = 89
        Height = 17
        Size.Values = (
          44.979166666666670000
          31.750000000000000000
          330.729166666666700000
          235.479166666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
        DataField = 'NUM_DOC'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText72: TQRDBText
        Left = 136
        Top = 125
        Width = 89
        Height = 17
        Size.Values = (
          44.979166666666670000
          359.833333333333300000
          330.729166666666700000
          235.479166666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
        DataField = 'VALOR'
        Mask = '#,##0.00'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText73: TQRDBText
        Left = 256
        Top = 125
        Width = 89
        Height = 17
        Size.Values = (
          44.979166666666670000
          677.333333333333300000
          330.729166666666700000
          235.479166666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
        DataField = 'VR_PARCELA'
        Mask = '#,##0.00'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText74: TQRDBText
        Left = 368
        Top = 125
        Width = 89
        Height = 17
        Size.Values = (
          44.979166666666670000
          973.666666666666700000
          330.729166666666700000
          235.479166666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
        DataField = 'DUPLICATA'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText75: TQRDBText
        Left = 480
        Top = 125
        Width = 89
        Height = 17
        Size.Values = (
          44.979166666666670000
          1270.000000000000000000
          330.729166666666700000
          235.479166666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
        DataField = 'DT_TRANS'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText76: TQRDBText
        Left = 600
        Top = 125
        Width = 89
        Height = 17
        Size.Values = (
          44.979166666666670000
          1587.500000000000000000
          330.729166666666700000
          235.479166666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
        DataField = 'DT_VENCIMENTO'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRShape81: TQRShape
        Left = 240
        Top = 106
        Width = 1
        Height = 40
        Size.Values = (
          105.833333333333300000
          635.000000000000000000
          280.458333333333300000
          2.645833333333333000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape82: TQRShape
        Left = 356
        Top = 105
        Width = 1
        Height = 40
        Size.Values = (
          105.833333333333300000
          941.916666666666700000
          277.812500000000000000
          2.645833333333333000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape83: TQRShape
        Left = 468
        Top = 105
        Width = 1
        Height = 40
        Size.Values = (
          105.833333333333300000
          1238.250000000000000000
          277.812500000000000000
          2.645833333333333000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape84: TQRShape
        Left = 584
        Top = 105
        Width = 1
        Height = 40
        Size.Values = (
          105.833333333333300000
          1545.166666666667000000
          277.812500000000000000
          2.645833333333333000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRLabel127: TQRLabel
        Left = 12
        Top = 249
        Width = 65
        Height = 17
        Size.Values = (
          44.979166666666670000
          31.750000000000000000
          658.812500000000000000
          171.979166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'QRLabel22'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRShape85: TQRShape
        Left = 0
        Top = 345
        Width = 698
        Height = 1
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          912.812500000000000000
          1846.791666666667000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRDBText77: TQRDBText
        Left = 104
        Top = 148
        Width = 40
        Height = 17
        Size.Values = (
          44.979166666666670000
          275.166666666666700000
          391.583333333333300000
          105.833333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QRel
        DataField = 'NOME'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText78: TQRDBText
        Left = 540
        Top = 148
        Width = 83
        Height = 17
        Size.Values = (
          44.979166666666670000
          1428.750000000000000000
          391.583333333333300000
          219.604166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QRel
        DataField = 'TELEFONE_1'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText80: TQRDBText
        Left = 540
        Top = 167
        Width = 50
        Height = 17
        Size.Values = (
          44.979166666666670000
          1428.750000000000000000
          441.854166666666700000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QRel
        DataField = 'BAIRRO'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText81: TQRDBText
        Left = 104
        Top = 186
        Width = 67
        Height = 17
        Size.Values = (
          44.979166666666670000
          275.166666666666700000
          492.125000000000000000
          177.270833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QRel
        DataField = 'MUNICIPIO'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText82: TQRDBText
        Left = 540
        Top = 186
        Width = 54
        Height = 17
        Size.Values = (
          44.979166666666670000
          1428.750000000000000000
          492.125000000000000000
          142.875000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QRel
        DataField = 'ESTADO'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText83: TQRDBText
        Left = 104
        Top = 205
        Width = 34
        Height = 17
        Size.Values = (
          44.979166666666670000
          275.166666666666700000
          542.395833333333300000
          89.958333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QRel
        DataField = 'CNPJ'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText84: TQRDBText
        Left = 540
        Top = 205
        Width = 71
        Height = 17
        Size.Values = (
          44.979166666666670000
          1428.750000000000000000
          542.395833333333300000
          187.854166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QRel
        DataField = 'INSCRICAO'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel128: TQRLabel
        Left = 392
        Top = 2
        Width = 73
        Height = 17
        Size.Values = (
          44.979166666666670000
          1037.166666666667000000
          5.291666666666667000
          193.145833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'CGC/IE :'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRDBText85: TQRDBText
        Left = 472
        Top = 2
        Width = 34
        Height = 17
        Size.Values = (
          44.979166666666670000
          1248.833333333333000000
          5.291666666666667000
          89.958333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = FrmPrincipal.QEmpresa
        DataField = 'CNPJ'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText86: TQRDBText
        Left = 594
        Top = 2
        Width = 115
        Height = 17
        Size.Values = (
          44.979166666666670000
          1571.625000000000000000
          5.291666666666667000
          304.270833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = FrmPrincipal.QEmpresa
        DataField = 'INSCR_ESTADUAL'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRShape86: TQRShape
        Left = 0
        Top = 392
        Width = 698
        Height = 1
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          1037.166666666667000000
          1846.791666666667000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape87: TQRShape
        Left = 0
        Top = 0
        Width = 1
        Height = 395
        Size.Values = (
          1045.104166666667000000
          0.000000000000000000
          0.000000000000000000
          2.645833333333333000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape88: TQRShape
        Left = 697
        Top = 0
        Width = 1
        Height = 393
        Size.Values = (
          1039.812500000000000000
          1844.145833333333000000
          0.000000000000000000
          2.645833333333333000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRExpr3: TQRExpr
        Left = 104
        Top = 167
        Width = 167
        Height = 17
        Size.Values = (
          44.979166666666670000
          275.166666666666700000
          441.854166666666700000
          441.854166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        Master = Duplicata
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'ENDERECO+'#39', '#39' + NUMERO'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRShape105: TQRShape
        Left = 0
        Top = 104
        Width = 698
        Height = 1
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          275.166666666666700000
          1846.791666666667000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape106: TQRShape
        Left = 0
        Top = 268
        Width = 698
        Height = 1
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          709.083333333333300000
          1846.791666666667000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel166: TQRLabel
        Left = 12
        Top = 63
        Width = 115
        Height = 16
        Size.Values = (
          42.333333333333330000
          31.750000000000000000
          166.687500000000000000
          304.270833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Local de Pagamento'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object QRLabel167: TQRLabel
        Left = 13
        Top = 81
        Width = 57
        Height = 17
        Enabled = False
        Size.Values = (
          44.979166666666670000
          34.395833333333330000
          214.312500000000000000
          150.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'QRLabel2'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object QRLabel168: TQRLabel
        Left = 12
        Top = 270
        Width = 59
        Height = 16
        Size.Values = (
          42.333333333333330000
          31.750000000000000000
          714.375000000000000000
          156.104166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Instru'#231#245'es'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object QRMemo4: TQRMemo
        Left = 12
        Top = 291
        Width = 683
        Height = 25
        Size.Values = (
          66.145833333333330000
          31.750000000000000000
          769.937500000000000000
          1807.104166666667000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
    end
  end
  object Duplicata_locacao: TQuickRep
    Left = -61
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
    ReportTitle = 'Duplicata Mercantil'
    SnapToGrid = True
    Units = Inches
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
      Height = 505
      AlignToBottom = False
      BeforePrint = QRBand3BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        1336.145833333333000000
        1846.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRShape89: TQRShape
        Left = 2
        Top = 0
        Width = 694
        Height = 127
        Size.Values = (
          336.020833333333300000
          5.291666666666667000
          0.000000000000000000
          1836.208333333333000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel129: TQRLabel
        Left = 483
        Top = 70
        Width = 174
        Height = 23
        Size.Values = (
          60.854166666666670000
          1277.937500000000000000
          185.208333333333300000
          460.375000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'FATURA DE LOCA'#199#195'O'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object QRLabel130: TQRLabel
        Left = 6
        Top = 25
        Width = 26
        Height = 15
        Size.Values = (
          39.687500000000000000
          15.875000000000000000
          66.145833333333330000
          68.791666666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'CNPJ'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel131: TQRLabel
        Left = 6
        Top = 42
        Width = 49
        Height = 15
        Size.Values = (
          39.687500000000000000
          15.875000000000000000
          111.125000000000000000
          129.645833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Inscr. Est.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape90: TQRShape
        Left = 2
        Top = 131
        Width = 506
        Size.Values = (
          171.979166666666700000
          5.291666666666667000
          346.604166666666700000
          1338.791666666667000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel132: TQRLabel
        Left = 18
        Top = 133
        Width = 58
        Height = 15
        Size.Values = (
          39.687500000000000000
          47.625000000000000000
          351.895833333333300000
          153.458333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'FATURA N'#186
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel133: TQRLabel
        Left = 128
        Top = 133
        Width = 103
        Height = 15
        Size.Values = (
          39.687500000000000000
          338.666666666666700000
          351.895833333333300000
          272.520833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'FATURA/DUPLICATA'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel134: TQRLabel
        Left = 151
        Top = 150
        Width = 54
        Height = 15
        Size.Values = (
          39.687500000000000000
          399.520833333333300000
          396.875000000000000000
          142.875000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'VALOR R$'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel135: TQRLabel
        Left = 280
        Top = 133
        Width = 112
        Height = 15
        Size.Values = (
          39.687500000000000000
          740.833333333333300000
          351.895833333333300000
          296.333333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'DUPLICATA N'#186' ORDEM'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel136: TQRLabel
        Left = 432
        Top = 133
        Width = 66
        Height = 15
        Size.Values = (
          39.687500000000000000
          1143.000000000000000000
          351.895833333333300000
          174.625000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'VENCIMENTO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape91: TQRShape
        Left = 520
        Top = 131
        Width = 176
        Height = 101
        Size.Values = (
          267.229166666666700000
          1375.833333333333000000
          346.604166666666700000
          465.666666666666700000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel137: TQRLabel
        Left = 528
        Top = 138
        Width = 161
        Height = 17
        Size.Values = (
          44.979166666666670000
          1397.000000000000000000
          365.125000000000000000
          425.979166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Para uso da institui'#231#227'o financeira'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape92: TQRShape
        Left = 2
        Top = 165
        Width = 506
        Height = 4
        Size.Values = (
          10.583333333333330000
          5.291666666666667000
          436.562500000000000000
          1338.791666666667000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape93: TQRShape
        Left = 98
        Top = 131
        Width = 4
        Size.Values = (
          171.979166666666700000
          259.291666666666700000
          346.604166666666700000
          10.583333333333330000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape94: TQRShape
        Left = 252
        Top = 131
        Width = 4
        Size.Values = (
          171.979166666666700000
          666.750000000000000000
          346.604166666666700000
          10.583333333333330000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape95: TQRShape
        Left = 413
        Top = 131
        Width = 4
        Size.Values = (
          171.979166666666700000
          1092.729166666667000000
          346.604166666666700000
          10.583333333333330000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRDBText54: TQRDBText
        Left = 6
        Top = 4
        Width = 55
        Height = 19
        Size.Values = (
          50.270833333333330000
          15.875000000000000000
          10.583333333333330000
          145.520833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = FrmPrincipal.QEmpresa
        DataField = 'RAZAO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 12
      end
      object QRDBText79: TQRDBText
        Left = 64
        Top = 25
        Width = 26
        Height = 15
        Size.Values = (
          39.687500000000000000
          169.333333333333300000
          66.145833333333330000
          68.791666666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = FrmPrincipal.QEmpresa
        DataField = 'CNPJ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText87: TQRDBText
        Left = 64
        Top = 42
        Width = 92
        Height = 15
        Size.Values = (
          39.687500000000000000
          169.333333333333300000
          111.125000000000000000
          243.416666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = FrmPrincipal.QEmpresa
        DataField = 'INSCR_ESTADUAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel138: TQRLabel
        Left = 6
        Top = 59
        Width = 47
        Height = 15
        Size.Values = (
          39.687500000000000000
          15.875000000000000000
          156.104166666666700000
          124.354166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Endere'#231'o'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText88: TQRDBText
        Left = 62
        Top = 59
        Width = 55
        Height = 15
        Size.Values = (
          39.687500000000000000
          164.041666666666700000
          156.104166666666700000
          145.520833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = FrmPrincipal.QEmpresa
        DataField = 'ENDERECO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel139: TQRLabel
        Left = 332
        Top = 59
        Width = 41
        Height = 15
        Size.Values = (
          39.687500000000000000
          878.416666666666700000
          156.104166666666700000
          108.479166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'N'#250'mero:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText89: TQRDBText
        Left = 382
        Top = 59
        Width = 44
        Height = 15
        Size.Values = (
          39.687500000000000000
          1010.708333333333000000
          156.104166666666700000
          116.416666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = FrmPrincipal.QEmpresa
        DataField = 'NUMERO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel140: TQRLabel
        Left = 6
        Top = 76
        Width = 30
        Height = 15
        Size.Values = (
          39.687500000000000000
          15.875000000000000000
          201.083333333333300000
          79.375000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Bairro'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText90: TQRDBText
        Left = 62
        Top = 76
        Width = 40
        Height = 15
        Size.Values = (
          39.687500000000000000
          164.041666666666700000
          201.083333333333300000
          105.833333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = FrmPrincipal.QEmpresa
        DataField = 'BAIRRO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel141: TQRLabel
        Left = 6
        Top = 93
        Width = 34
        Height = 15
        Size.Values = (
          39.687500000000000000
          15.875000000000000000
          246.062500000000000000
          89.958333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cidade'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText91: TQRDBText
        Left = 62
        Top = 93
        Width = 50
        Height = 15
        Size.Values = (
          39.687500000000000000
          164.041666666666700000
          246.062500000000000000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = FrmPrincipal.QEmpresa
        DataField = 'MUNICIPIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel142: TQRLabel
        Left = 332
        Top = 93
        Width = 23
        Height = 15
        Size.Values = (
          39.687500000000000000
          878.416666666666700000
          246.062500000000000000
          60.854166666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'CEP:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText92: TQRDBText
        Left = 382
        Top = 93
        Width = 20
        Height = 15
        Size.Values = (
          39.687500000000000000
          1010.708333333333000000
          246.062500000000000000
          52.916666666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = FrmPrincipal.QEmpresa
        DataField = 'CEP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel143: TQRLabel
        Left = 6
        Top = 110
        Width = 43
        Height = 15
        Size.Values = (
          39.687500000000000000
          15.875000000000000000
          291.041666666666700000
          113.770833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Telefone'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText93: TQRDBText
        Left = 62
        Top = 110
        Width = 52
        Height = 15
        Size.Values = (
          39.687500000000000000
          164.041666666666700000
          291.041666666666700000
          137.583333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = FrmPrincipal.QEmpresa
        DataField = 'TELEFONE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRShape96: TQRShape
        Left = 426
        Top = 1
        Width = 26
        Height = 125
        Size.Values = (
          330.729166666666700000
          1127.125000000000000000
          2.645833333333333000
          68.791666666666670000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRLabel144: TQRLabel
        Left = 2
        Top = 199
        Width = 245
        Height = 15
        Size.Values = (
          39.687500000000000000
          5.291666666666667000
          526.520833333333300000
          648.229166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Desconto de 10% sobre R$ 100,00 at'#233' 31/12/2010'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel145: TQRLabel
        Left = 4
        Top = 217
        Width = 101
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          574.145833333333300000
          267.229166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Condi'#231#245'es Especiais'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape97: TQRShape
        Left = 2
        Top = 234
        Width = 694
        Height = 90
        Size.Values = (
          238.125000000000000000
          5.291666666666667000
          619.125000000000000000
          1836.208333333333000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel146: TQRLabel
        Left = 6
        Top = 235
        Width = 83
        Height = 15
        Size.Values = (
          39.687500000000000000
          15.875000000000000000
          621.770833333333300000
          219.604166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Nome do Sacado'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText94: TQRDBText
        Left = 96
        Top = 235
        Width = 30
        Height = 15
        Size.Values = (
          39.687500000000000000
          254.000000000000000000
          621.770833333333300000
          79.375000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataField = 'NOME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel147: TQRLabel
        Left = 6
        Top = 252
        Width = 47
        Height = 15
        Size.Values = (
          39.687500000000000000
          15.875000000000000000
          666.750000000000000000
          124.354166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Endere'#231'o'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel148: TQRLabel
        Left = 6
        Top = 269
        Width = 30
        Height = 15
        Size.Values = (
          39.687500000000000000
          15.875000000000000000
          711.729166666666700000
          79.375000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Bairro'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText95: TQRDBText
        Left = 96
        Top = 269
        Width = 40
        Height = 15
        Size.Values = (
          39.687500000000000000
          254.000000000000000000
          711.729166666666700000
          105.833333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataField = 'BAIRRO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel149: TQRLabel
        Left = 6
        Top = 286
        Width = 62
        Height = 15
        Size.Values = (
          39.687500000000000000
          15.875000000000000000
          756.708333333333300000
          164.041666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Pra'#231'a Pagto.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText96: TQRDBText
        Left = 96
        Top = 286
        Width = 50
        Height = 15
        Size.Values = (
          39.687500000000000000
          254.000000000000000000
          756.708333333333300000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataField = 'MUNICIPIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel150: TQRLabel
        Left = 6
        Top = 303
        Width = 48
        Height = 15
        Size.Values = (
          39.687500000000000000
          15.875000000000000000
          801.687500000000000000
          127.000000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'CNPJ/CPF'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText97: TQRDBText
        Left = 96
        Top = 303
        Width = 26
        Height = 15
        Size.Values = (
          39.687500000000000000
          254.000000000000000000
          801.687500000000000000
          68.791666666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataField = 'CNPJ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel151: TQRLabel
        Left = 438
        Top = 286
        Width = 34
        Height = 15
        Size.Values = (
          39.687500000000000000
          1158.875000000000000000
          756.708333333333300000
          89.958333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Estado'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText98: TQRDBText
        Left = 512
        Top = 286
        Width = 43
        Height = 15
        Size.Values = (
          39.687500000000000000
          1354.666666666667000000
          756.708333333333300000
          113.770833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataField = 'ESTADO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel152: TQRLabel
        Left = 438
        Top = 303
        Width = 67
        Height = 15
        Size.Values = (
          39.687500000000000000
          1158.875000000000000000
          801.687500000000000000
          177.270833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Inscr. Est./RG'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText99: TQRDBText
        Left = 512
        Top = 303
        Width = 56
        Height = 15
        Size.Values = (
          39.687500000000000000
          1354.666666666667000000
          801.687500000000000000
          148.166666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataField = 'INSCRICAO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText100: TQRDBText
        Left = 6
        Top = 173
        Width = 90
        Height = 15
        Size.Values = (
          39.687500000000000000
          15.875000000000000000
          457.729166666666700000
          238.125000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = 'TRANSACAO_ID'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText101: TQRDBText
        Left = 105
        Top = 173
        Width = 144
        Height = 15
        Size.Values = (
          39.687500000000000000
          277.812500000000000000
          457.729166666666700000
          381.000000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = 'VR_PARCELA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
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
      object QRDBText102: TQRDBText
        Left = 258
        Top = 173
        Width = 154
        Height = 15
        Size.Values = (
          39.687500000000000000
          682.625000000000000000
          457.729166666666700000
          407.458333333333300000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = 'DUPLICATA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText103: TQRDBText
        Left = 419
        Top = 173
        Width = 85
        Height = 15
        Size.Values = (
          39.687500000000000000
          1108.604166666667000000
          457.729166666666700000
          224.895833333333300000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = 'DT_VENCIMENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRShape98: TQRShape
        Left = 2
        Top = 326
        Width = 694
        Size.Values = (
          171.979166666666700000
          5.291666666666667000
          862.541666666666700000
          1836.208333333333000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel153: TQRLabel
        Left = 6
        Top = 328
        Width = 88
        Height = 15
        Size.Values = (
          39.687500000000000000
          15.875000000000000000
          867.833333333333300000
          232.833333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Valor por extenso'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape99: TQRShape
        Left = 98
        Top = 326
        Width = 4
        Size.Values = (
          171.979166666666700000
          259.291666666666700000
          862.541666666666700000
          10.583333333333330000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape100: TQRShape
        Left = 2
        Top = 393
        Width = 694
        Height = 50
        Size.Values = (
          132.291666666666700000
          5.291666666666667000
          1039.812500000000000000
          1836.208333333333000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel154: TQRLabel
        Left = 4
        Top = 397
        Width = 689
        Height = 44
        Size.Values = (
          116.416666666666700000
          10.583333333333330000
          1050.395833333333000000
          1822.979166666667000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 
          'Reconhecemos a exatid'#227'o desta DUPLICATA DE VENDA MERCANTIL, na i' +
          'mport'#226'ncia acima, que pagaremos '#224', ou '#224' sua ordem, na pra'#231'a e ve' +
          'ncimento indicados. N'#227'o sendo paga no dia do vencimento, cobrar ' +
          'juros de mora e despesas financeiras. N'#227'o conceder descontos mes' +
          'mo condicionalmente.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel155: TQRLabel
        Left = 108
        Top = 328
        Width = 580
        Height = 44
        Size.Values = (
          116.416666666666700000
          285.750000000000000000
          867.833333333333300000
          1534.583333333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'QRLabel103'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape101: TQRShape
        Left = 2
        Top = 449
        Width = 694
        Height = 51
        Size.Values = (
          134.937500000000000000
          5.291666666666667000
          1187.979166666667000000
          1836.208333333333000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel156: TQRLabel
        Left = 269
        Top = 483
        Width = 72
        Height = 15
        Size.Values = (
          39.687500000000000000
          711.729166666666700000
          1277.937500000000000000
          190.500000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Data do Aceite'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText104: TQRDBText
        Left = 276
        Top = 462
        Width = 55
        Height = 15
        Size.Values = (
          39.687500000000000000
          730.250000000000000000
          1222.375000000000000000
          145.520833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataField = 'DT_TRANS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRShape102: TQRShape
        Left = 400
        Top = 474
        Width = 289
        Height = 4
        Size.Values = (
          10.583333333333330000
          1058.333333333333000000
          1254.125000000000000000
          764.645833333333300000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel157: TQRLabel
        Left = 480
        Top = 481
        Width = 134
        Height = 15
        Size.Values = (
          39.687500000000000000
          1270.000000000000000000
          1272.645833333333000000
          354.541666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'ASSINATURA DO SACADO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText105: TQRDBText
        Left = 443
        Top = 10
        Width = 202
        Height = 23
        Size.Values = (
          60.854166666666670000
          1172.104166666667000000
          26.458333333333330000
          534.458333333333300000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = FrmPrincipal.QEmpresa
        DataField = 'ENDERECO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object QRExpr5: TQRExpr
        Left = 98
        Top = 252
        Width = 126
        Height = 17
        Size.Values = (
          44.979166666666670000
          259.291666666666700000
          666.750000000000000000
          333.375000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        Master = Duplicata
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'ENDERECO+'#39', '#39' + NUMERO'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText106: TQRDBText
        Left = 443
        Top = 39
        Width = 89
        Height = 23
        Size.Values = (
          60.854166666666670000
          1172.104166666667000000
          103.187500000000000000
          235.479166666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = FrmPrincipal.QEmpresa
        DataField = 'CEP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object QRDBText107: TQRDBText
        Left = 538
        Top = 39
        Width = 120
        Height = 23
        Size.Values = (
          60.854166666666670000
          1423.458333333333000000
          103.187500000000000000
          317.500000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = FrmPrincipal.QEmpresa
        DataField = 'MUNICIPIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object QRDBText108: TQRDBText
        Left = 664
        Top = 39
        Width = 25
        Height = 23
        Size.Values = (
          60.854166666666670000
          1756.833333333333000000
          103.187500000000000000
          66.145833333333330000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = FrmPrincipal.QEmpresa
        DataField = 'ESTADO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object QRLabel158: TQRLabel
        Left = 445
        Top = 110
        Width = 69
        Height = 15
        Size.Values = (
          39.687500000000000000
          1177.395833333333000000
          291.041666666666700000
          182.562500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Data Emiss'#227'o:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText109: TQRDBText
        Left = 535
        Top = 110
        Width = 55
        Height = 15
        Size.Values = (
          39.687500000000000000
          1415.520833333333000000
          291.041666666666700000
          145.520833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataField = 'DT_TRANS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel159: TQRLabel
        Left = 111
        Top = 217
        Width = 101
        Height = 15
        Size.Values = (
          39.687500000000000000
          293.687500000000000000
          574.145833333333300000
          267.229166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Condi'#231#245'es Especiais'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText110: TQRDBText
        Left = 655
        Top = 10
        Width = 32
        Height = 23
        Size.Values = (
          60.854166666666670000
          1733.020833333333000000
          26.458333333333330000
          84.666666666666670000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = FrmPrincipal.QEmpresa
        DataField = 'NUMERO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object QRLabel160: TQRLabel
        Left = 9
        Top = 451
        Width = 131
        Height = 15
        Size.Values = (
          39.687500000000000000
          23.812500000000000000
          1193.270833333333000000
          346.604166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Anexo '#224' Resolu'#231#227'o n'#186' 102'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel161: TQRLabel
        Left = 12
        Top = 465
        Width = 119
        Height = 15
        Size.Values = (
          39.687500000000000000
          31.750000000000000000
          1230.312500000000000000
          314.854166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'de 26/11/1968 do Banco'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel162: TQRLabel
        Left = 26
        Top = 481
        Width = 83
        Height = 15
        Size.Values = (
          39.687500000000000000
          68.791666666666670000
          1272.645833333333000000
          219.604166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Central do Brasil.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
    end
  end
  object Cond_Espec: TEdit
    Left = 464
    Top = 32
    Width = 240
    Height = 21
    TabOrder = 16
    Visible = False
    OnKeyDown = DtmenKeyDown
  end
  object btn1: TButton
    Left = 84
    Top = 224
    Width = 75
    Height = 25
    Caption = 'R&etorno'
    TabOrder = 17
    Visible = False
    OnClick = btn1Click
  end
  object DataBanco: TDataSource
    DataSet = QBanco
    Left = 45
    Top = 152
  end
  object DataCliente: TDataSource
    DataSet = QCliente
    Left = 93
    Top = 128
  end
  object ACBrBoleto1: TACBrBoleto
    Banco.Numero = 748
    Banco.TamanhoMaximoNossoNum = 8
    Banco.TipoCobranca = cobSicred
    Banco.LayoutVersaoArquivo = 0
    Banco.LayoutVersaoLote = 0
    Banco.CasasDecimaisMoraJuros = 2
    Cedente.Nome = 'TodaObra Materias p/ Construcao'
    Cedente.CodigoCedente = '4266443'
    Cedente.Agencia = '0284'
    Cedente.AgenciaDigito = '5'
    Cedente.Conta = '79489'
    Cedente.ContaDigito = '9'
    Cedente.TipoInscricao = pOutras
    NomeArqRemessa = '.'
    NumeroArquivo = 0
    LayoutRemessa = c240
    Left = 16
    Top = 148
  end
  object OpenDialog1: TOpenDialog
    Left = 304
    Top = 144
  end
  object QBanco: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      'SELECT * FROM BANCOS'
      'WHERE'
      '(BANCO_ID = :BANCO_ID)'
      'AND (EMPRESA_ID = :EMPRESA_ID)'
      'AND (STATUS = '#39'A'#39')')
    Left = 96
    Top = 112
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
  object QRel: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afDisable
    Left = 64
    Top = 112
  end
  object QCliente: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      'SELECT * FROM CLIENTES'
      'WHERE'
      '(CLIENTE_ID = :CLIENTE_ID)'
      'AND (STATUS = '#39'A'#39')')
    Left = 32
    Top = 112
    ParamData = <
      item
        Name = 'CLIENTE_ID'
        ParamType = ptInput
      end>
  end
end
