object FrmFicha_Financeira: TFrmFicha_Financeira
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Ficha Financeira'
  ClientHeight = 521
  ClientWidth = 978
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 6
    Top = 247
    Width = 61
    Height = 13
    Caption = #218'lt. Compra:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label38: TLabel
    Left = 6
    Top = 273
    Width = 80
    Height = 13
    Caption = #218'lt. Quantidade:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object DBText3: TDBText
    Left = 88
    Top = 273
    Width = 73
    Height = 13
    Alignment = taRightJustify
    DataField = 'QTD'
    DataSource = DataProduto
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object DBText5: TDBText
    Left = 88
    Top = 299
    Width = 73
    Height = 13
    Alignment = taRightJustify
    DataField = 'VR_UNIT'
    DataSource = DataProduto
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 6
    Top = 299
    Width = 52
    Height = 13
    Caption = #218'lt. Custo:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label37: TLabel
    Left = 6
    Top = 325
    Width = 54
    Height = 13
    Caption = #218'lt. Venda:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object DBText2: TDBText
    Left = 88
    Top = 325
    Width = 73
    Height = 13
    Alignment = taRightJustify
    DataField = 'DT_MOVIMENTO'
    DataSource = DataProduto
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object DBText7: TDBText
    Left = 88
    Top = 351
    Width = 73
    Height = 13
    Alignment = taRightJustify
    DataField = 'PRECO_VAREJO'
    DataSource = DataProduto
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 6
    Top = 351
    Width = 46
    Height = 13
    Caption = 'Pr. Atual:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = -2
    Top = 418
    Width = 178
    Height = 24
    Alignment = taCenter
    AutoSize = False
    Caption = 'Sugest'#227'o Compra'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label13: TLabel
    Left = 2
    Top = 448
    Width = 178
    Height = 24
    Alignment = taCenter
    AutoSize = False
    Caption = '0,00'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 6
    Top = 381
    Width = 55
    Height = 13
    Cursor = crHandPoint
    Caption = 'Fornecedor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object DBText8: TDBText
    Left = 86
    Top = 381
    Width = 73
    Height = 13
    Alignment = taRightJustify
    DataField = 'FORN_ID'
    DataSource = DataProduto
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object DBText4: TDBText
    Left = 88
    Top = 247
    Width = 73
    Height = 13
    Alignment = taRightJustify
    DataField = 'DT_ENT'
    DataSource = DataProduto
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object DBText6: TDBText
    Left = 7
    Top = 401
    Width = 152
    Height = 13
    DataField = 'FORNECEDOR'
    DataSource = DataProduto
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 480
    Width = 978
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnRetorna: TBitBtn
      Left = 545
      Top = 9
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
      TabOrder = 0
      OnClick = btnRetornaClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 978
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 6
      Top = 14
      Width = 38
      Height = 13
      Caption = '&Produto'
      FocusControl = Produto
    end
    object btnProduto: TSpeedButton
      Left = 122
      Top = 10
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
      OnClick = btnProdutoClick
    end
    object DBText1: TDBText
      Left = 195
      Top = 14
      Width = 340
      Height = 13
      DataField = 'DESCRICAO'
      DataSource = DataProduto
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Produto: TCurrencyEdit
      Left = 52
      Top = 10
      Width = 67
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      DecimalPlaces = 0
      DisplayFormat = '0;-0'
      TabOrder = 0
      ZeroEmpty = False
      OnChange = ProdutoChange
      OnKeyDown = ProdutoKeyDown
    end
    object btnExecuta: TBitBtn
      Left = 545
      Top = 8
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
      TabOrder = 1
      OnClick = btnExecutaClick
    end
  end
  object Graf: TChart
    Left = 264
    Top = 241
    Width = 706
    Height = 237
    BackWall.Brush.Style = bsClear
    BackWall.Color = clBtnFace
    Gradient.Visible = True
    Title.Text.Strings = (
      '')
    BottomAxis.LabelsFormat.TextAlignment = taCenter
    DepthAxis.LabelsFormat.TextAlignment = taCenter
    DepthTopAxis.LabelsFormat.TextAlignment = taCenter
    LeftAxis.LabelsFormat.TextAlignment = taCenter
    RightAxis.LabelsFormat.TextAlignment = taCenter
    TopAxis.LabelsFormat.TextAlignment = taCenter
    Zoom.Animated = True
    Zoom.Pen.Mode = pmNotXor
    BevelOuter = bvLowered
    TabOrder = 2
    Visible = False
    DefaultCanvas = 'TGDIPlusCanvas'
    PrintMargins = (
      15
      23
      15
      23)
    ColorPaletteIndex = 13
    object Series1: TBarSeries
      Marks.Visible = False
      Title = '1'#186' Sem.'
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Bar'
      YValues.Order = loNone
      object TeeFunction1: TAddTeeFunction
        CalcByValue = False
      end
    end
    object Series2: TBarSeries
      Marks.Visible = False
      Title = '2'#186' Sem.'
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Bar'
      YValues.Order = loNone
      Data = {
        04060000000000000000406A40FF060000003F3F3F616E640000000000205740
        FF060000003F3F3F42616E0000000000002E40FF060000003F3F3F6765340000
        000000803B40FF060000003F3F3F6167650000000000002940FF060000003F3F
        3F656C610000000000405040FF060000003F3F3F616765}
    end
    object Series3: TBarSeries
      Marks.Visible = False
      Title = '3'#186' Sem.'
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Bar'
      YValues.Order = loNone
      Data = {
        04060000009A99999999D92140FF060000003F3F3F42616E3333333333034040
        FF060000003F3F3F676536CCCCCCCCCCCC3040FF060000003F3F3F616765CCCC
        CCCCCCCC3040FF060000003F3F3F69646F0300000000001540FF060000003F3F
        3F6765319A99999999B93940FF060000003F3F3F616765}
    end
    object Series4: TBarSeries
      Marks.Visible = False
      Title = '4'#186' Sem.'
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Bar'
      YValues.Order = loNone
      Data = {
        040600000066666666662E5640FF060000003F3F3F616765CCCCCCCCCC3C4F40
        FF060000003F3F3F616E64FFFFFFFFFF4F4640FF060000003F3F3F42616E6466
        666666863540FF060000003F3F3F42616E3233333333A34240FF060000003F3F
        3F676533CACCCCCCCCCC3040FF060000003F3F3F616765}
    end
  end
  object Ent_Sai: TStringGrid
    Left = 6
    Top = 41
    Width = 963
    Height = 194
    ColCount = 11
    DefaultColWidth = 86
    RowCount = 7
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    ParentFont = False
    TabOrder = 3
    OnDrawCell = Ent_SaiDrawCell
  end
  object DataProduto: TDataSource
    DataSet = QProduto
    Left = 480
    Top = 8
  end
  object QProduto: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      'SELECT PRODUTOS.*,'
      
        'TRANSITENS.QUANTIDADE QTD, to_char(TRANSITENS.VR_UNITARIO, '#39'FM99' +
        '9999D909'#39')::VARCHAR VR_UNIT,'
      'TRANSACOES.DT_ENT_SAI DT_ENT, TRANSACOES.FORNECEDOR_ID FORN_ID,'
      'FORNECEDORES.NOME FORNECEDOR'
      'FROM PRODUTOS'
      
        'left join TRANSITENS on TRANSITENS.PRODUTO_ID = PRODUTOS.PRODUTO' +
        '_ID'
      
        'left join TRANSACOES on TRANSACOES.TRANSACAO_ID = TRANSITENS.TRA' +
        'NSACAO_ID'
      
        'left join FORNECEDORES ON FORNECEDORES.FORNECEDOR_ID = TRANSACOE' +
        'S.FORNECEDOR_ID'
      'WHERE'
      '(PRODUTOS.PRODUTO_ID = :PRODUTO_ID)'
      'AND (PRODUTOS.EMPRESA_ID = :EMPRESA_ID)'
      'AND (PRODUTOS.STATUS = '#39'A'#39')'
      'and TRANSACOES.CONDUTA = '#39'02'#39' and TRANSACOES.DEPTO = '#39'07'#39
      'order by DT_ENT_SAI DESC;')
    Left = 448
    Top = 8
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
    Left = 512
    Top = 8
  end
end
