object FrmInventario_Produtos: TFrmInventario_Produtos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Invent'#225'rio de Produtos'
  ClientHeight = 443
  ClientWidth = 682
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Itens: TDBGrid
    Left = 0
    Top = 0
    Width = 682
    Height = 362
    Align = alClient
    DataSource = DataProdutos
    Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick]
    TabOrder = 0
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
        FieldName = 'PRODUTO_ID'
        ReadOnly = True
        Title.Alignment = taRightJustify
        Title.Caption = 'C'#243'd. ID'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_BARRA'
        ReadOnly = True
        Title.Caption = 'C'#243'd. de Barra'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        ReadOnly = True
        Title.Caption = 'Descri'#231#227'o'
        Width = 242
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECO_VAREJO'
        ReadOnly = True
        Title.Alignment = taRightJustify
        Title.Caption = 'Pre'#231'o'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTIDADE_G'
        ReadOnly = True
        Title.Alignment = taRightJustify
        Title.Caption = 'Quantidade'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTIDADE_A'
        Title.Alignment = taRightJustify
        Title.Caption = 'Qtde. Ajuste'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 85
        Visible = True
      end>
  end
  object Alfabeto: TTabSet
    Left = 0
    Top = 381
    Width = 682
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
    Width = 682
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object Label1: TLabel
      Left = 6
      Top = 14
      Width = 72
      Height = 13
      Caption = 'C'#243'd. de Barras'
    end
    object Add_Quantidade: TSpeedButton
      Left = 207
      Top = 10
      Width = 23
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Glyph.Data = {
        DE000000424DDE0000000000000076000000280000000D0000000D0000000100
        0400000000006800000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        700077777777777770007777700077777000777770C077777000777770C07777
        7000770000C000077000770CCCCCCC077000770000C000077000777770C07777
        7000777770C07777700077777000777770007777777777777000777777777777
        7000}
      ParentFont = False
      OnClick = Add_QuantidadeClick
    end
    object btnRetorna: TBitBtn
      Left = 603
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
    object Cod_Scan: TEdit
      Left = 83
      Top = 10
      Width = 121
      Height = 21
      MaxLength = 13
      TabOrder = 0
      OnExit = Cod_ScanExit
      OnKeyDown = Cod_ScanKeyDown
    end
    object btnPesquisa: TBitBtn
      Left = 523
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
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 362
    Width = 682
    Height = 19
    Panels = <
      item
        Text = '<F5> - Localiz. C'#243'digo de Barras'
        Width = 227
      end
      item
        Text = '<F7> - Localiz. Descri'#231#227'o'
        Width = 227
      end
      item
        Text = '<F8> - Localiz. C'#243'digo do Produto'
        Width = 227
      end>
  end
  object DataProdutos: TDataSource
    DataSet = QProdutos
    Left = 56
    Top = 320
  end
  object QProdutos: TFDQuery
    BeforeDelete = QProdutosBeforeDelete
    OnNewRecord = QProdutosNewRecord
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    UpdateObject = U_Sql
    SQL.Strings = (
      ''
      'SELECT * FROM INVENTARIO_PRODUTOS')
    Left = 24
    Top = 320
  end
  object QRel: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 120
    Top = 320
  end
  object U_Sql: TFDUpdateSQL
    Connection = FrmData.DbF_Eficaz
    InsertSQL.Strings = (
      'insert into INVENTARIO_PRODUTOS'
      '  (QUANTIDADE_A)'
      'values'
      '  (:QUANTIDADE_A)')
    ModifySQL.Strings = (
      'update INVENTARIO_PRODUTOS'
      'set'
      '  QUANTIDADE_A = :QUANTIDADE_A'
      'where'
      '  DT_INVENTARIO = :OLD_DT_INVENTARIO and'
      '  PRODUTO_ID = :OLD_PRODUTO_ID')
    DeleteSQL.Strings = (
      'delete from INVENTARIO_PRODUTOS'
      'where'
      '  DT_INVENTARIO = :OLD_DT_INVENTARIO and'
      '  PRODUTO_ID = :OLD_PRODUTO_ID')
    FetchRowSQL.Strings = (
      'Select '
      '  PRODUTO_ID,'
      '  DT_INVENTARIO,'
      '  EMPRESA_ID,'
      '  GRUPO_ID,'
      '  SUBTIPO_ID,'
      '  LOCALIZACAO_ID,'
      '  FORNECEDOR_ID,'
      '  DESCRICAO,'
      '  UNIDADE,'
      '  COD_BARRA,'
      '  TRIBUTO_ID,'
      '  ALIQUOTA_ICMS,'
      '  VALOR_COMPRA,'
      '  CUSTOMEDIO,'
      '  CUSTO_COMPRA,'
      '  PRECO_VAREJO,'
      '  QUANTIDADE_C,'
      '  QUANTIDADE_G,'
      '  QUANTIDADE_A,'
      '  STATUS,'
      '  ST_INVENTARIO'
      'from INVENTARIO_PRODUTOS '
      'where'
      '  DT_INVENTARIO = :DT_INVENTARIO and'
      '  PRODUTO_ID = :PRODUTO_ID')
    Left = 88
    Top = 320
  end
end
