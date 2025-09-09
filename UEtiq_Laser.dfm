object FrmEtiq_Laser: TFrmEtiq_Laser
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Etiquetas (Impr. Laser/Jato de Tinta)'
  ClientHeight = 274
  ClientWidth = 344
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
  object Label4: TLabel
    Left = 6
    Top = 9
    Width = 64
    Height = 13
    Caption = 'Compr. Folha'
  end
  object Label5: TLabel
    Left = 183
    Top = 9
    Width = 58
    Height = 13
    Caption = 'Altura Folha'
  end
  object Label3: TLabel
    Left = 183
    Top = 87
    Width = 64
    Height = 13
    Caption = 'Espa'#231'amento'
  end
  object Label9: TLabel
    Left = 183
    Top = 61
    Width = 77
    Height = 13
    Caption = 'Margem Inferior'
  end
  object Label7: TLabel
    Left = 183
    Top = 35
    Width = 86
    Height = 13
    Caption = 'Margem Esquerda'
  end
  object Label6: TLabel
    Left = 6
    Top = 35
    Width = 72
    Height = 13
    Caption = 'Margem Direita'
  end
  object Label8: TLabel
    Left = 6
    Top = 61
    Width = 81
    Height = 13
    Caption = 'Margem Superior'
  end
  object Label2: TLabel
    Left = 6
    Top = 87
    Width = 38
    Height = 13
    Caption = 'Colunas'
  end
  object Label10: TLabel
    Left = 6
    Top = 113
    Width = 72
    Height = 13
    Caption = 'Altura Etiqueta'
  end
  object Label1: TLabel
    Left = 6
    Top = 165
    Width = 38
    Height = 13
    Caption = 'C'#243'digos'
  end
  object Label11: TLabel
    Left = 6
    Top = 191
    Width = 55
    Height = 13
    Caption = 'Fornecedor'
  end
  object Bevel1: TBevel
    Left = 6
    Top = 227
    Width = 333
    Height = 4
    Shape = bsTopLine
  end
  object btnProduto1: TSpeedButton
    Left = 147
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
    OnClick = btnProduto1Click
  end
  object btnProduto2: TSpeedButton
    Left = 275
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
    OnClick = btnProduto2Click
  end
  object btnForne_Cliente: TSpeedButton
    Left = 156
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
    Visible = False
    OnClick = btnForne_ClienteClick
  end
  object Label12: TLabel
    Left = 6
    Top = 139
    Width = 75
    Height = 13
    Caption = 'Per'#237'odo Atualiz.'
  end
  object Image1: TImage
    Left = 226
    Top = 189
    Width = 112
    Height = 32
    AutoSize = True
    Visible = False
  end
  object ACBrBarCode1: TACBrBarCode
    Left = 403
    Top = 8
    Width = 200
    Height = 50
    Modul = 2
    Ratio = 2.000000000000000000
    Typ = bcCodeEAN13
    ShowTextFont.Charset = DEFAULT_CHARSET
    ShowTextFont.Color = clWindowText
    ShowTextFont.Height = -11
    ShowTextFont.Name = 'Tahoma'
    ShowTextFont.Style = []
  end
  object Compr_Folha: TCurrencyEdit
    Left = 90
    Top = 6
    Width = 65
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DisplayFormat = '0.00;0.00'
    TabOrder = 0
    Value = 210.000000000000000000
    OnKeyDown = Compr_FolhaKeyDown
  end
  object Altura_Folha: TCurrencyEdit
    Left = 274
    Top = 6
    Width = 65
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DisplayFormat = '0.00;0.00'
    TabOrder = 1
    Value = 310.000000000000000000
    OnKeyDown = Compr_FolhaKeyDown
  end
  object Margem_Esquerda: TCurrencyEdit
    Left = 274
    Top = 32
    Width = 65
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DisplayFormat = '0.00;0.00'
    TabOrder = 3
    Value = 9.000000000000000000
    OnKeyDown = Compr_FolhaKeyDown
  end
  object Margem_Inferior: TCurrencyEdit
    Left = 274
    Top = 58
    Width = 65
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DisplayFormat = '0.00;0.00'
    TabOrder = 5
    Value = 11.000000000000000000
    OnKeyDown = Compr_FolhaKeyDown
  end
  object Espacamento: TCurrencyEdit
    Left = 274
    Top = 84
    Width = 65
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DisplayFormat = '0.00;0.00'
    TabOrder = 7
    Value = 4.000000000000000000
    OnKeyDown = Compr_FolhaKeyDown
  end
  object Altura_Etiqueta: TCurrencyEdit
    Left = 90
    Top = 110
    Width = 65
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DisplayFormat = '0.00;0.00'
    TabOrder = 8
    Value = 21.400000000000000000
    OnKeyDown = Compr_FolhaKeyDown
  end
  object Colunas: TSpinEdit
    Left = 90
    Top = 82
    Width = 57
    Height = 22
    MaxValue = 5
    MinValue = 0
    TabOrder = 6
    Value = 5
    OnKeyDown = Compr_FolhaKeyDown
  end
  object Margem_Superior: TCurrencyEdit
    Left = 90
    Top = 58
    Width = 65
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DisplayFormat = '0.00;0.00'
    TabOrder = 4
    Value = 13.500000000000000000
    OnKeyDown = Compr_FolhaKeyDown
  end
  object Margem_Direita: TCurrencyEdit
    Left = 90
    Top = 32
    Width = 65
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DisplayFormat = '0.00;0.00'
    TabOrder = 2
    Value = 5.000000000000000000
    OnKeyDown = Compr_FolhaKeyDown
  end
  object btnRetorna: TBitBtn
    Left = 264
    Top = 243
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
    TabOrder = 15
    OnClick = btnRetornaClick
  end
  object btnExecuta: TBitBtn
    Left = 183
    Top = 243
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
    TabOrder = 14
    OnClick = btnExecutaClick
  end
  object Codigo_Inicial: TCurrencyEdit
    Left = 90
    Top = 162
    Width = 55
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 11
    ZeroEmpty = False
    OnKeyDown = Compr_FolhaKeyDown
  end
  object Codigo_Final: TCurrencyEdit
    Left = 218
    Top = 162
    Width = 55
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 12
    ZeroEmpty = False
    OnKeyDown = Compr_FolhaKeyDown
  end
  object Forne: TCurrencyEdit
    Left = 90
    Top = 188
    Width = 63
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 13
    ZeroEmpty = False
    OnKeyDown = Compr_FolhaKeyDown
  end
  object Etiq_Laser: TQuickRep
    Left = 139
    Top = 332
    Width = 627
    Height = 1141
    DataSet = Table_Temp
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
    Page.Columns = 5
    Page.Orientation = poPortrait
    Page.PaperSize = Custom
    Page.Continuous = False
    Page.Values = (
      110.000000000000000000
      3020.000000000000000000
      135.000000000000000000
      1660.000000000000000000
      90.000000000000000000
      50.000000000000000000
      40.000000000000000000)
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
    ReportTitle = 'Etiquetas'
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
    object DetailBand1: TQRBand
      Left = 34
      Top = 51
      Width = 102
      Height = 57
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        150.812500000000000000
        269.875000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRDBText1: TQRDBText
        Left = 3
        Top = 46
        Width = 96
        Height = 11
        Size.Values = (
          29.104166666666670000
          7.937500000000000000
          121.708333333333300000
          254.000000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = Table_Temp
        DataField = 'PRECO_VAREJO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Mask = '#,##0.00'
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 6
      end
      object QRDBText2: TQRDBText
        Left = 3
        Top = 33
        Width = 96
        Height = 11
        Size.Values = (
          29.104166666666670000
          7.937500000000000000
          87.312500000000000000
          254.000000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = Table_Temp
        DataField = 'DESCRICAO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 6
      end
      object QRDBImage1: TQRDBImage
        Left = 3
        Top = 1
        Width = 96
        Height = 32
        Size.Values = (
          84.666666666666670000
          7.937500000000000000
          2.645833333333333000
          254.000000000000000000)
        XLColumn = 0
        DataField = 'IMAGEM'
        DataSet = Table_Temp
      end
      object QRDBText8: TQRDBText
        Left = 3
        Top = 1
        Width = 51
        Height = 11
        Size.Values = (
          29.104166666666670000
          7.937500000000000000
          2.645833333333333000
          134.937500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = Table_Temp
        DataField = 'COD_BARRA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 6
      end
    end
  end
  object Etiq_Jato: TQuickRep
    Left = 114
    Top = 315
    Width = 794
    Height = 1123
    DataSet = Table_Temp
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
    Page.PaperSize = Custom
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
    object QRBand1: TQRBand
      Left = 48
      Top = 48
      Width = 698
      Height = 63
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        166.687500000000000000
        1846.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRShape5: TQRShape
        Left = 458
        Top = 1
        Width = 98
        Height = 60
        Size.Values = (
          160.000000000000000000
          1211.791666666667000000
          2.645833333333333000
          259.291666666666700000)
        XLColumn = 0
        Pen.Color = clWhite
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape4: TQRShape
        Left = 344
        Top = 1
        Width = 98
        Height = 60
        Size.Values = (
          160.000000000000000000
          910.166666666666600000
          2.645833333333333000
          259.291666666666700000)
        XLColumn = 0
        Pen.Color = clWhite
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape2: TQRShape
        Left = 0
        Top = 1
        Width = 98
        Height = 60
        Size.Values = (
          160.000000000000000000
          0.000000000000000000
          2.645833333333333000
          260.000000000000000000)
        XLColumn = 0
        Pen.Color = clWhite
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape1: TQRShape
        Left = 116
        Top = 1
        Width = 98
        Height = 60
        Size.Values = (
          160.000000000000000000
          306.916666666666700000
          2.645833333333333000
          259.291666666666700000)
        XLColumn = 0
        Pen.Color = clWhite
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape3: TQRShape
        Left = 230
        Top = 1
        Width = 98
        Height = 60
        Size.Values = (
          160.000000000000000000
          608.541666666666700000
          2.645833333333333000
          259.291666666666700000)
        XLColumn = 0
        Pen.Color = clWhite
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRDBText3: TQRDBText
        Left = 1
        Top = 33
        Width = 96
        Height = 11
        Size.Values = (
          29.104166666666670000
          2.645833333333333000
          87.312500000000000000
          254.000000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = Table_Temp
        DataField = 'DESCRICAO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 6
      end
      object QRDBText4: TQRDBText
        Left = 117
        Top = 33
        Width = 96
        Height = 11
        Size.Values = (
          29.104166666666670000
          309.562500000000000000
          87.312500000000000000
          254.000000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = Table_Temp
        DataField = 'DESCRICAO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 6
      end
      object QRDBText5: TQRDBText
        Left = 231
        Top = 33
        Width = 96
        Height = 11
        Size.Values = (
          29.104166666666670000
          611.187500000000000000
          87.312500000000000000
          254.000000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = Table_Temp
        DataField = 'DESCRICAO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 6
      end
      object QRDBText6: TQRDBText
        Left = 345
        Top = 33
        Width = 96
        Height = 11
        Size.Values = (
          29.104166666666670000
          912.812500000000000000
          87.312500000000000000
          254.000000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = Table_Temp
        DataField = 'DESCRICAO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 6
      end
      object QRDBText7: TQRDBText
        Left = 459
        Top = 33
        Width = 96
        Height = 11
        Size.Values = (
          29.104166666666670000
          1214.437500000000000000
          87.312500000000000000
          254.000000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = Table_Temp
        DataField = 'DESCRICAO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 6
      end
      object QRDBImage2: TQRDBImage
        Left = 1
        Top = 1
        Width = 96
        Height = 32
        Size.Values = (
          84.666666666666670000
          2.645833333333333000
          2.645833333333333000
          254.000000000000000000)
        XLColumn = 0
        DataField = 'IMAGEM'
        DataSet = Table_Temp
      end
      object QRDBText9: TQRDBText
        Left = 1
        Top = 1
        Width = 51
        Height = 11
        Size.Values = (
          29.104166666666670000
          2.645833333333333000
          2.645833333333333000
          134.937500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = Table_Temp
        DataField = 'COD_BARRA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 6
      end
      object QRDBImage3: TQRDBImage
        Left = 117
        Top = 1
        Width = 96
        Height = 32
        Size.Values = (
          84.666666666666670000
          309.562500000000000000
          2.645833333333333000
          254.000000000000000000)
        XLColumn = 0
        DataField = 'IMAGEM'
        DataSet = Table_Temp
      end
      object QRDBText10: TQRDBText
        Left = 117
        Top = 1
        Width = 51
        Height = 11
        Size.Values = (
          29.104166666666670000
          309.562500000000000000
          2.645833333333333000
          134.937500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = Table_Temp
        DataField = 'COD_BARRA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 6
      end
      object QRDBImage4: TQRDBImage
        Left = 231
        Top = 1
        Width = 96
        Height = 32
        Size.Values = (
          84.666666666666670000
          611.187500000000000000
          2.645833333333333000
          254.000000000000000000)
        XLColumn = 0
        DataField = 'IMAGEM'
        DataSet = Table_Temp
      end
      object QRDBText11: TQRDBText
        Left = 231
        Top = 1
        Width = 51
        Height = 11
        Size.Values = (
          29.104166666666670000
          611.187500000000000000
          2.645833333333333000
          134.937500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = Table_Temp
        DataField = 'COD_BARRA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 6
      end
      object QRDBImage5: TQRDBImage
        Left = 345
        Top = 1
        Width = 96
        Height = 32
        Size.Values = (
          84.666666666666670000
          912.812500000000000000
          2.645833333333333000
          254.000000000000000000)
        XLColumn = 0
        DataField = 'IMAGEM'
        DataSet = Table_Temp
      end
      object QRDBText12: TQRDBText
        Left = 345
        Top = 1
        Width = 51
        Height = 11
        Size.Values = (
          29.104166666666670000
          912.812500000000000000
          2.645833333333333000
          134.937500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = Table_Temp
        DataField = 'COD_BARRA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 6
      end
      object QRDBImage6: TQRDBImage
        Left = 459
        Top = 1
        Width = 96
        Height = 32
        Size.Values = (
          84.666666666666670000
          1214.437500000000000000
          2.645833333333333000
          254.000000000000000000)
        XLColumn = 0
        DataField = 'IMAGEM'
        DataSet = Table_Temp
      end
      object QRDBText13: TQRDBText
        Left = 459
        Top = 1
        Width = 51
        Height = 11
        Size.Values = (
          29.104166666666670000
          1214.437500000000000000
          2.645833333333333000
          134.937500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = Table_Temp
        DataField = 'COD_BARRA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 6
      end
    end
  end
  object Dtmen: TDateEdit
    Left = 90
    Top = 136
    Width = 90
    Height = 21
    CheckOnExit = True
    DialogTitle = 'Selecione a Data'
    NumGlyphs = 2
    TabOrder = 9
    OnKeyDown = DtmenKeyDown
  end
  object Dtmai: TDateEdit
    Left = 194
    Top = 136
    Width = 90
    Height = 21
    CheckOnExit = True
    DialogTitle = 'Selecione a Data'
    NumGlyphs = 2
    TabOrder = 10
    OnKeyDown = DtmenKeyDown
  end
  object QEstoque: TFDQuery
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
    Left = 16
    Top = 240
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
  object Table_Temp: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 72
    Top = 240
  end
end
