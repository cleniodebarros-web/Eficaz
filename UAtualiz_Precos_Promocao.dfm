object FrmAtualiz_Precos_Promocao: TFrmAtualiz_Precos_Promocao
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Atualiza'#231#227'o de Pre'#231'os (Produtos Promo'#231#227'o)'
  ClientHeight = 443
  ClientWidth = 782
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
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Itens: TDBGrid
    Left = 0
    Top = 41
    Width = 782
    Height = 321
    Align = alClient
    DataSource = DataProdutos
    Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgCancelOnExit, dgTitleClick]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnKeyDown = ItensKeyDown
    OnKeyPress = ItensKeyPress
    OnTitleClick = ItensTitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'produto_id'
        ReadOnly = True
        Title.Alignment = taRightJustify
        Title.Caption = 'C'#243'd. ID'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        ReadOnly = True
        Title.Caption = 'Descri'#231#227'o'
        Width = 242
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'valor_compra'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Vr. Compra'
        Width = 75
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'dt_preco'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Dt. Pre'#231'o'
        Width = 62
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'preco_varejo'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Pr. Venda'
        Width = 75
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'preco_promocao'
        Title.Alignment = taCenter
        Title.Caption = 'Pr. Promo'#231#227'o'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quantidade_p'
        Title.Alignment = taCenter
        Title.Caption = 'Quant. Vda.'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'supervisor'
        PickList.Strings = (
          'SIM'
          'N'#195'O')
        Title.Alignment = taCenter
        Title.Caption = 'Bloq. Descontos'
        Visible = True
      end>
  end
  object Alfabeto: TTabSet
    Left = 0
    Top = 381
    Width = 782
    Height = 21
    Align = alBottom
    AutoScroll = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    SoftTop = True
    Style = tsModernTabs
    Tabs.Strings = (
      'A'
      'B'
      'C'
      'D'
      'E'
      'F'
      'G'
      'H'
      'I'
      'J'
      'K'
      'L'
      'M'
      'N'
      'O'
      'P'
      'Q'
      'R'
      'S'
      'T'
      'U'
      'V'
      'W'
      'X'
      'Y'
      'Z'
      'Todos')
    OnClick = AlfabetoClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 402
    Width = 782
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object btnRetorna: TBitBtn
      Left = 683
      Top = 8
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
      TabOrder = 2
      OnClick = btnRetornaClick
    end
    object btnPesquisa: TBitBtn
      Left = 603
      Top = 8
      Width = 75
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
      TabOrder = 1
      OnClick = btnPesquisaClick
    end
    object btnImprime: TBitBtn
      Left = 523
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Rel. Conf.'
      TabOrder = 0
      OnClick = btnImprimeClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 782
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 6
      Top = 14
      Width = 70
      Height = 13
      Caption = 'Per. Promo'#231#227'o'
    end
    object Dtmen: TDateEdit
      Left = 85
      Top = 10
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
      Left = 189
      Top = 10
      Width = 90
      Height = 21
      CheckOnExit = True
      DialogTitle = 'Selecione a Data'
      NumGlyphs = 2
      TabOrder = 1
      OnEnter = DtmenEnter
      OnKeyDown = DtmenKeyDown
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 362
    Width = 782
    Height = 19
    Panels = <
      item
        Text = '<F5> - Localiz. C'#243'digo de Barras'
        Width = 214
      end
      item
        Text = '<F7> - Localiz. Descri'#231#227'o'
        Width = 214
      end
      item
        Text = '<F8> - Locliz. C'#243'digo do Produto '
        Width = 214
      end>
  end
  object Tabela_Produtos: TQuickRep
    Left = 24
    Top = 800
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
    ReportTitle = 'Tabela de Pre'#231'os'
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
      Height = 92
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        243.416666666666700000
        1846.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
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
      object QRLabel32: TQRLabel
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
      object QRLabel33: TQRLabel
        Left = 226
        Top = 31
        Width = 246
        Height = 15
        Size.Values = (
          39.687500000000000000
          597.958333333333300000
          82.020833333333330000
          650.875000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = True
        Caption = '*** TABELA DE PRE'#199'OS - PROMO'#199#195'O ***'
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
      object QRShape7: TQRShape
        Left = 0
        Top = 63
        Width = 698
        Height = 4
        Size.Values = (
          10.583333333333330000
          0.000000000000000000
          166.687500000000000000
          1846.791666666667000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRDBText23: TQRDBText
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
      object QRLabel34: TQRLabel
        Left = 2
        Top = 69
        Width = 45
        Height = 15
        Size.Values = (
          39.687500000000000000
          5.291666666666667000
          182.562500000000000000
          119.062500000000000000)
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
      object QRLabel35: TQRLabel
        Left = 55
        Top = 69
        Width = 71
        Height = 15
        Size.Values = (
          39.687500000000000000
          145.520833333333300000
          182.562500000000000000
          187.854166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'C'#243'd. Barra'
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
        Left = 155
        Top = 69
        Width = 64
        Height = 15
        Size.Values = (
          39.687500000000000000
          410.104166666666700000
          182.562500000000000000
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
      object QRLabel37: TQRLabel
        Left = 476
        Top = 69
        Width = 87
        Height = 15
        Size.Values = (
          39.687500000000000000
          1259.416666666667000000
          182.562500000000000000
          230.187500000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Pr. Atacado'
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
      object QRLabel38: TQRLabel
        Left = 611
        Top = 69
        Width = 87
        Height = 15
        Size.Values = (
          39.687500000000000000
          1616.604166666667000000
          182.562500000000000000
          230.187500000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Pr. Promo'#231#227'o'
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
      object QRShape8: TQRShape
        Left = 0
        Top = 86
        Width = 698
        Height = 4
        Size.Values = (
          10.583333333333330000
          0.000000000000000000
          227.541666666666700000
          1846.791666666667000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel40: TQRLabel
        Left = 0
        Top = 46
        Width = 57
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          121.708333333333300000
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
    end
    object QRBand6: TQRBand
      Left = 48
      Top = 140
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
      object QRDBText24: TQRDBText
        Left = 2
        Top = 1
        Width = 45
        Height = 15
        Size.Values = (
          39.687500000000000000
          5.291666666666667000
          2.645833333333333000
          119.062500000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
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
      object QRDBText25: TQRDBText
        Left = 55
        Top = 1
        Width = 64
        Height = 15
        Size.Values = (
          39.687500000000000000
          145.520833333333300000
          2.645833333333333000
          169.333333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QRel
        DataField = 'COD_BARRA'
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
      object QRDBText26: TQRDBText
        Left = 476
        Top = 1
        Width = 87
        Height = 15
        Size.Values = (
          39.687500000000000000
          1259.416666666667000000
          2.645833333333333000
          230.187500000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
        DataField = 'PRECO_VAREJO'
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
      object QRDBText27: TQRDBText
        Left = 155
        Top = 1
        Width = 299
        Height = 15
        Size.Values = (
          39.687500000000000000
          410.104166666666700000
          2.645833333333333000
          791.104166666666800000)
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
      object QRDBText29: TQRDBText
        Left = 611
        Top = 1
        Width = 87
        Height = 15
        Size.Values = (
          39.687500000000000000
          1616.604166666667000000
          2.645833333333333000
          230.187500000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QRel
        DataField = 'PRECO_PROMOCAO'
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
  end
  object DataProdutos: TDataSource
    DataSet = QProdutos
    Left = 64
    Top = 176
  end
  object QUpdate: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evItems, evRecsMax, evRowsetSize, evCache, evCursorKind, evAutoFetchAll]
    FetchOptions.CursorKind = ckDefault
    FetchOptions.RowsetSize = 1000
    FetchOptions.AutoFetchAll = afDisable
    Left = 152
    Top = 176
  end
  object QProdutos: TFDQuery
    Active = True
    AfterOpen = QProdutosAfterOpen
    BeforeInsert = QProdutosBeforeInsert
    AfterEdit = QProdutosAfterEdit
    BeforePost = QProdutosBeforePost
    AfterPost = QProdutosAfterPost
    BeforeDelete = QProdutosBeforeDelete
    OnNewRecord = QProdutosNewRecord
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evItems, evRecsMax, evRowsetSize, evCache, evCursorKind, evAutoFetchAll]
    FetchOptions.CursorKind = ckDefault
    FetchOptions.RowsetSize = 1000
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      'SELECT * FROM PRODUTOS')
    Left = 112
    Top = 176
  end
  object QRel: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evItems, evRecsMax, evRowsetSize, evCache, evCursorKind, evAutoFetchAll]
    FetchOptions.CursorKind = ckDefault
    FetchOptions.RowsetSize = 1000
    FetchOptions.AutoFetchAll = afDisable
    Left = 192
    Top = 176
  end
  object USql_Produtos: TFDUpdateSQL
    Connection = FrmData.DbF_Eficaz
    InsertSQL.Strings = (
      'insert into PRODUTOS'
      
        '  (ALIQUOTA_ICMS, APLICACAO, BALDPT, BALTECLA, BALTIPO, COD_BARR' +
        'A, COD_BARRA_AUX1, '
      
        '   COD_BARRA_AUX2, COD_BARRA_AUX3, COD_BARRA_AUX4, COD_GEN, COD_' +
        'ORIGINAL, '
      
        '   CODRED, COFINS, COMISSAO, CSOSN, CST_COFINS, CST_IPI, CST_PIS' +
        ', CTRL_SERIE, '
      
        '   CUSTO_COMPRA, CUSTOMEDIO, DEMANDA_MAX, DESC_MAXIMO, DESCRICAO' +
        ', DESPESAS, '
      
        '   DESV_PAD_SEM, DIF_ICMS, DT_ATUALIZACAO, DT_COMPRA, DT_ENTRADA' +
        ', DT_MOVIMENTO, '
      
        '   DT_PRECO, EMBALAGEM, EMPRESA_ID, EST_SEGURANCA, EST_TRABALHO,' +
        ' ESTOQUE_INICIAL, '
      
        '   ETIQUETA, FAMILIA_ID, FANTASIA, FORNECEDOR_ID, FRACAO_VENDA, ' +
        'GRUPO_ID, '
      
        '   IAT, IPI, IPPT, LOCALIZACAO_ID, MARCA, MARGEM_LUCRO, MD5, MED' +
        'IA_CONSUMO, '
      
        '   MOD_ICMS, MOD_ICMS_ST, MOD_IPI, MODELO_POSICAO, MVA, NCM, PAR' +
        '_FATURAMENTO, '
      
        '   PESAVEL, PESO, PESO_UNITARIO, PIS, PMZ, PONTO_PEDIDO, PRECO_A' +
        'TACADO, '
      
        '   PRECO_PROMOCAO, PRECO_SUGESTAO, PRECO_VAREJO, PRODUTO_ID, PRO' +
        'MO_FINAL, '
      
        '   PROMO_INICIAL, PROVQT, QUANT_MAXIMA, QUANT_MINIMA, QUANTIDADE' +
        '_A, QUANTIDADE_C, '
      
        '   QUANTIDADE_G, REDUCAO_ICMS, REFERENCIA, SPED, STATUS, SUBTIPO' +
        '_ID, SUPERVISOR, '
      
        '   TIPO, TIPO_ITEM, TRIBUTO_ID, ULT_QUANTIDADE, UNIDADE, UNIDADE' +
        '_VENDA, '
      
        '   VALIDADE, VALOR_COMPRA, VENDA_MEDIA_PON, VENDA_MEDIA_SEM, VIN' +
        'CULO,QUANTIDADE_P)'
      'values'
      
        '  (:ALIQUOTA_ICMS, :APLICACAO, :BALDPT, :BALTECLA, :BALTIPO, :CO' +
        'D_BARRA, '
      
        '   :COD_BARRA_AUX1, :COD_BARRA_AUX2, :COD_BARRA_AUX3, :COD_BARRA' +
        '_AUX4, '
      
        '   :COD_GEN, :COD_ORIGINAL, :CODRED, :COFINS, :COMISSAO, :CSOSN,' +
        ' :CST_COFINS, '
      
        '   :CST_IPI, :CST_PIS, :CTRL_SERIE, :CUSTO_COMPRA, :CUSTOMEDIO, ' +
        ':DEMANDA_MAX, '
      
        '   :DESC_MAXIMO, :DESCRICAO, :DESPESAS, :DESV_PAD_SEM, :DIF_ICMS' +
        ', :DT_ATUALIZACAO, '
      
        '   :DT_COMPRA, :DT_ENTRADA, :DT_MOVIMENTO, :DT_PRECO, :EMBALAGEM' +
        ', :EMPRESA_ID, '
      
        '   :EST_SEGURANCA, :EST_TRABALHO, :ESTOQUE_INICIAL, :ETIQUETA, :' +
        'FAMILIA_ID, '
      
        '   :FANTASIA, :FORNECEDOR_ID, :FRACAO_VENDA, :GRUPO_ID, :IAT, :I' +
        'PI, :IPPT, '
      
        '   :LOCALIZACAO_ID, :MARCA, :MARGEM_LUCRO, :MD5, :MEDIA_CONSUMO,' +
        ' :MOD_ICMS, '
      
        '   :MOD_ICMS_ST, :MOD_IPI, :MODELO_POSICAO, :MVA, :NCM, :PAR_FAT' +
        'URAMENTO, '
      
        '   :PESAVEL, :PESO, :PESO_UNITARIO, :PIS, :PMZ, :PONTO_PEDIDO, :' +
        'PRECO_ATACADO, '
      
        '   :PRECO_PROMOCAO, :PRECO_SUGESTAO, :PRECO_VAREJO, :PRODUTO_ID,' +
        ' :PROMO_FINAL, '
      
        '   :PROMO_INICIAL, :PROVQT, :QUANT_MAXIMA, :QUANT_MINIMA, :QUANT' +
        'IDADE_A, '
      
        '   :QUANTIDADE_C, :QUANTIDADE_G, :REDUCAO_ICMS, :REFERENCIA, :SP' +
        'ED, :STATUS, '
      
        '   :SUBTIPO_ID, :SUPERVISOR, :TIPO, :TIPO_ITEM, :TRIBUTO_ID, :UL' +
        'T_QUANTIDADE, '
      
        '   :UNIDADE, :UNIDADE_VENDA, :VALIDADE, :VALOR_COMPRA, :VENDA_ME' +
        'DIA_PON, '
      '   :VENDA_MEDIA_SEM, :VINCULO, :QUANTIDADE_P)')
    ModifySQL.Strings = (
      'update PRODUTOS'
      'set'
      '  PRECO_PROMOCAO = :PRECO_PROMOCAO,'
      '  PROMO_FINAL    = :PROMO_FINAL,'
      '  PROMO_INICIAL  = :PROMO_INICIAL,'
      '  DT_ATUALIZACAO = :DT_ATUALIZACAO,'
      '  QUANTIDADE_P   = :QUANTIDADE_P,'
      '  SUPERVISOR     = :SUPERVISOR'
      ''
      ''
      'where'
      '  PRODUTO_ID = :OLD_PRODUTO_ID')
    FetchRowSQL.Strings = (
      'Select '
      '  PRODUTO_ID,'
      '  DESCRICAO,'
      '  COD_BARRA,'
      '  VALOR_COMPRA,'
      '  DT_PRECO,'
      '  PRECO_VAREJO,'
      '  PRECO_PROMOCAO,'
      '  PROMO_INICIAL,'
      '  PROMO_FINAL,'
      '  FAMILIA_ID,'
      '  DT_ATUALIZACAO,'
      '  PRECO_PRAZO,'
      '  QUANTIDADE_P,'
      '  SUPERVISOR'
      'from PRODUTOS '
      'where'
      '  PRODUTO_ID = :PRODUTO_ID')
    Left = 16
    Top = 172
  end
end
