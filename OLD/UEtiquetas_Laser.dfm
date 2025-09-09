object FrmEtiquetas_Laser: TFrmEtiquetas_Laser
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Etiquetas (Impr. Laser/Jato de Tinta)'
  ClientHeight = 196
  ClientWidth = 347
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
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
  object Bevel1: TBevel
    Left = 6
    Top = 149
    Width = 333
    Height = 4
    Shape = bsTopLine
  end
  object Image1: TImage
    Left = 210
    Top = 109
    Width = 129
    Height = 32
    Center = True
    Visible = False
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
    Value = 11.000000000000000000
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
    Value = 16.000000000000000000
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
    Value = 1.500000000000000000
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
    Value = 21.000000000000000000
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
    Value = 14.000000000000000000
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
    Value = 2.500000000000000000
    OnKeyDown = Compr_FolhaKeyDown
  end
  object btnRetorna: TBitBtn
    Left = 264
    Top = 165
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
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 11
  end
  object btnExecuta: TBitBtn
    Left = 183
    Top = 165
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
    TabOrder = 10
    OnClick = btnExecutaClick
  end
  object Etiq_Laser: TQuickRep
    Left = 42
    Top = 296
    Width = 794
    Height = 1172
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
      160.000000000000000000
      3100.000000000000000000
      140.000000000000000000
      2100.000000000000000000
      110.000000000000000000
      25.000000000000000000
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
      Left = 42
      Top = 53
      Width = 136
      Height = 57
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        150.812500000000000000
        359.833333333333300000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRDBText1: TQRDBText
        Left = 3
        Top = 46
        Width = 129
        Height = 11
        Size.Values = (
          29.104166666666670000
          7.937500000000000000
          121.708333333333300000
          341.312500000000000000)
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
        Top = 34
        Width = 129
        Height = 11
        Size.Values = (
          29.104166666666670000
          7.937500000000000000
          89.958333333333330000
          341.312500000000000000)
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
        Width = 129
        Height = 32
        Size.Values = (
          84.666666666666670000
          7.937500000000000000
          2.645833333333333000
          341.312500000000000000)
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
    Left = 26
    Top = 296
    Width = 794
    Height = 1172
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
      160.000000000000000000
      3100.000000000000000000
      140.000000000000000000
      2100.000000000000000000
      110.000000000000000000
      25.000000000000000000
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
      Left = 42
      Top = 53
      Width = 743
      Height = 63
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        166.687500000000000000
        1965.854166666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRShape5: TQRShape
        Left = 457
        Top = 1
        Width = 129
        Height = 60
        Size.Values = (
          158.750000000000000000
          1209.145833333333000000
          2.645833333333333000
          341.312500000000000000)
        XLColumn = 0
        Pen.Color = clWhite
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape4: TQRShape
        Left = 611
        Top = 1
        Width = 129
        Height = 60
        Size.Values = (
          158.750000000000000000
          1616.604166666667000000
          2.645833333333333000
          341.312500000000000000)
        XLColumn = 0
        Pen.Color = clWhite
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape2: TQRShape
        Left = 1
        Top = 1
        Width = 129
        Height = 60
        Size.Values = (
          158.750000000000000000
          2.645833333333333000
          2.645833333333333000
          341.312500000000000000)
        XLColumn = 0
        Pen.Color = clWhite
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape1: TQRShape
        Left = 149
        Top = 1
        Width = 129
        Height = 60
        Size.Values = (
          158.750000000000000000
          394.229166666666700000
          2.645833333333333000
          341.312500000000000000)
        XLColumn = 0
        Pen.Color = clWhite
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape3: TQRShape
        Left = 303
        Top = 1
        Width = 129
        Height = 60
        Size.Values = (
          158.750000000000000000
          801.687500000000000000
          2.645833333333333000
          341.312500000000000000)
        XLColumn = 0
        Pen.Color = clWhite
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRDBText3: TQRDBText
        Left = 1
        Top = 33
        Width = 129
        Height = 11
        Size.Values = (
          29.104166666666670000
          2.645833333333333000
          87.312500000000000000
          341.312500000000000000)
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
        Left = 149
        Top = 33
        Width = 129
        Height = 11
        Size.Values = (
          29.104166666666670000
          394.229166666666700000
          87.312500000000000000
          341.312500000000000000)
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
        Left = 303
        Top = 33
        Width = 129
        Height = 11
        Size.Values = (
          29.104166666666670000
          801.687500000000000000
          87.312500000000000000
          341.312500000000000000)
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
        Left = 457
        Top = 33
        Width = 129
        Height = 11
        Size.Values = (
          29.104166666666670000
          1209.145833333333000000
          87.312500000000000000
          341.312500000000000000)
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
        Left = 611
        Top = 33
        Width = 129
        Height = 11
        Size.Values = (
          29.104166666666670000
          1616.604166666667000000
          87.312500000000000000
          341.312500000000000000)
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
        Top = 8
        Width = 129
        Height = 32
        Size.Values = (
          84.666666666666670000
          2.645833333333333000
          21.166666666666670000
          341.312500000000000000)
        XLColumn = 0
        DataField = 'IMAGEM'
        DataSet = Table_Temp
      end
      object QRDBImage3: TQRDBImage
        Left = 149
        Top = 1
        Width = 129
        Height = 32
        Size.Values = (
          84.666666666666670000
          394.229166666666700000
          2.645833333333333000
          341.312500000000000000)
        XLColumn = 0
        DataField = 'IMAGEM'
        DataSet = Table_Temp
      end
      object QRDBImage4: TQRDBImage
        Left = 303
        Top = 1
        Width = 129
        Height = 32
        Size.Values = (
          84.666666666666670000
          801.687500000000000000
          2.645833333333333000
          341.312500000000000000)
        XLColumn = 0
        DataField = 'IMAGEM'
        DataSet = Table_Temp
      end
      object QRDBImage5: TQRDBImage
        Left = 457
        Top = 1
        Width = 129
        Height = 32
        Size.Values = (
          84.666666666666670000
          1209.145833333333000000
          2.645833333333333000
          341.312500000000000000)
        XLColumn = 0
        DataField = 'IMAGEM'
        DataSet = Table_Temp
      end
      object QRDBImage6: TQRDBImage
        Left = 611
        Top = 1
        Width = 129
        Height = 32
        Size.Values = (
          84.666666666666670000
          1616.604166666667000000
          2.645833333333333000
          341.312500000000000000)
        XLColumn = 0
        DataField = 'IMAGEM'
        DataSet = Table_Temp
      end
      object QRDBText14: TQRDBText
        Left = 1
        Top = 46
        Width = 129
        Height = 11
        Size.Values = (
          29.104166666666670000
          2.645833333333333000
          121.708333333333300000
          341.312500000000000000)
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
      object QRDBText15: TQRDBText
        Left = 149
        Top = 46
        Width = 129
        Height = 11
        Size.Values = (
          29.104166666666670000
          394.229166666666700000
          121.708333333333300000
          341.312500000000000000)
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
      object QRDBText16: TQRDBText
        Left = 303
        Top = 46
        Width = 129
        Height = 11
        Size.Values = (
          29.104166666666670000
          801.687500000000000000
          121.708333333333300000
          341.312500000000000000)
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
      object QRDBText17: TQRDBText
        Left = 457
        Top = 46
        Width = 129
        Height = 11
        Size.Values = (
          29.104166666666670000
          1209.145833333333000000
          121.708333333333300000
          341.312500000000000000)
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
      object QRDBText18: TQRDBText
        Left = 611
        Top = 46
        Width = 129
        Height = 11
        Size.Values = (
          29.104166666666670000
          1616.604166666667000000
          121.708333333333300000
          341.312500000000000000)
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
      object QRDBText10: TQRDBText
        Left = 149
        Top = 1
        Width = 51
        Height = 11
        Size.Values = (
          29.104166666666670000
          394.229166666666700000
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
      object QRDBText11: TQRDBText
        Left = 303
        Top = 1
        Width = 51
        Height = 11
        Size.Values = (
          29.104166666666670000
          801.687500000000000000
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
      object QRDBText12: TQRDBText
        Left = 457
        Top = 1
        Width = 51
        Height = 11
        Size.Values = (
          29.104166666666670000
          1209.145833333333000000
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
      object QRDBText13: TQRDBText
        Left = 611
        Top = 1
        Width = 51
        Height = 11
        Size.Values = (
          29.104166666666670000
          1616.604166666667000000
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
  object Impr_Legenda: TCheckBox
    Left = 183
    Top = 113
    Width = 114
    Height = 17
    Caption = 'Imprimir Legenda'
    TabOrder = 9
    OnKeyDown = Compr_FolhaKeyDown
  end
  object Data_Temp: TDataSource
    Left = 80
    Top = 144
  end
  object Table_Temp: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 16
    Top = 136
  end
end
