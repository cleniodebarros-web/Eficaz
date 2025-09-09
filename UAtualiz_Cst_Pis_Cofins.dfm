object FrmAtualiz_Cst_Pis_Cofins: TFrmAtualiz_Cst_Pis_Cofins
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Atualiza'#231#227'o de CST Pis/Cofins'
  ClientHeight = 445
  ClientWidth = 1180
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
    Width = 1180
    Height = 364
    Align = alClient
    DataSource = DataProdutos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnColEnter = ItensColEnter
    OnColExit = ItensColExit
    OnEnter = ItensEnter
    OnExit = ItensExit
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
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        ReadOnly = True
        Title.Caption = 'Descri'#231#227'o'
        Width = 314
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CST_PIS_ENTR'
        Title.Caption = 'CST PIS Entr.'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CST_PIS'
        Title.Caption = 'CST PIS Sa'#237'da'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAT_REC'
        Title.Caption = 'Nat. Receita'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PIS_ENTR'
        Title.Alignment = taRightJustify
        Title.Caption = 'PIS Entrada'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PIS'
        Title.Alignment = taRightJustify
        Title.Caption = 'PIS Sa'#237'da'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COFINS_ENTR'
        Title.Alignment = taRightJustify
        Title.Caption = 'COFINS Entr.'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COFINS'
        Title.Alignment = taRightJustify
        Title.Caption = 'COFINS Sa'#237'da'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NCM'
        Title.Caption = 'C'#243'd. NCM'
        Width = 54
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CEST'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'd. CEST'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'GRUPO_ID'
        Title.Alignment = taCenter
        Title.Caption = 'Grupo'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'tributo_id'
        Title.Caption = 'C'#243'd. Tributo'
        Visible = True
      end>
  end
  object Alfabeto: TTabSet
    Left = 0
    Top = 383
    Width = 1180
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
    Top = 404
    Width = 1180
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object btnRetorna: TBitBtn
      Left = 1093
      Top = 6
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
      TabOrder = 1
      OnClick = btnRetornaClick
    end
    object btnPesquisa: TBitBtn
      Left = 1013
      Top = 6
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
      TabOrder = 0
      OnClick = btnPesquisaClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 364
    Width = 1180
    Height = 19
    Panels = <
      item
        Text = '<F5> - Localiz. C'#243'digo de Barras'
        Width = 393
      end
      item
        Text = '<F7> - Localiz. Descri'#231#227'o'
        Width = 393
      end
      item
        Text = '<F8> - Locliz. C'#243'digo do Produto '
        Width = 393
      end>
  end
  object DataProdutos: TDataSource
    DataSet = QProdutos
    Left = 56
    Top = 408
  end
  object QProdutos: TFDQuery
    BeforePost = QProdutosBeforePost
    AfterPost = QProdutosAfterPost
    BeforeDelete = QProdutosBeforeDelete
    OnNewRecord = QProdutosNewRecord
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM PRODUTOS')
    Left = 24
    Top = 408
  end
  object IQuery: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 96
    Top = 400
  end
  object USql_Produtos: TFDUpdateSQL
    InsertSQL.Strings = (
      'insert into PRODUTOS'
      
        '  (CST_COFINS, CST_COFINS_ENTR, CST_PIS, CST_PIS_ENTR, NAT_REC, ' +
        'PIS_ENTR, PIS, COFINS_ENTR, COFINS, NCM,GRUPO_ID)'
      'values'
      
        '  (:CST_COFINS, :CST_COFINS_ENTR, :CST_PIS, :CST_PIS_ENTR, :NAT_' +
        'REC, :PIS_ENTR, :PIS, :COFINS_ENTR, :COFINS,:NCM,:GRUPO_ID)')
    ModifySQL.Strings = (
      'update PRODUTOS'
      'set'
      '  CST_COFINS = :CST_COFINS,'
      '  CST_COFINS_ENTR = :CST_COFINS_ENTR,'
      '  CST_PIS = :CST_PIS,'
      '  CST_PIS_ENTR = :CST_PIS_ENTR,'
      '  NAT_REC = :NAT_REC,'
      '  PIS_ENTR = :PIS_ENTR,'
      '  PIS = :PIS,'
      '  COFINS_ENTR = :COFINS_ENTR,'
      '  COFINS = :COFINS,'
      ' NCM= :NCM,'
      'GRUPO_ID = :GRUPO_ID'
      'where'
      '  PRODUTO_ID = :OLD_PRODUTO_ID')
    DeleteSQL.Strings = (
      'delete from PRODUTOS'
      'where'
      '  PRODUTO_ID = :OLD_PRODUTO_ID')
    FetchRowSQL.Strings = (
      'Select '
      '  PRODUTO_ID,'
      '  EMPRESA_ID,'
      '  TIPO,'
      '  TIPO_ITEM,'
      '  DESCRICAO,'
      '  FANTASIA,'
      '  UNIDADE,'
      '  UNIDADE_VENDA,'
      '  COD_BARRA,'
      '  COD_BARRA_AUX1,'
      '  COD_BARRA_AUX2,'
      '  COD_BARRA_AUX3,'
      '  COD_BARRA_AUX4,'
      '  IAT,'
      '  IPPT,'
      '  CSOSN,'
      '  NCM,'
      '  CODRED,'
      '  SUPERVISOR,'
      '  CTRL_SERIE,'
      '  PROVQT,'
      '  EMBALAGEM,'
      '  FRACAO_VENDA,'
      '  PESO,'
      '  PESO_UNITARIO,'
      '  PESAVEL,'
      '  BALDPT,'
      '  ETIQUETA,'
      '  BALTIPO,'
      '  BALTECLA,'
      '  VALIDADE,'
      '  COD_ORIGINAL,'
      '  MARCA,'
      '  MODELO_POSICAO,'
      '  REFERENCIA,'
      '  APLICACAO,'
      '  DT_COMPRA,'
      '  DT_ENTRADA,'
      '  DT_PRECO,'
      '  DT_MOVIMENTO,'
      '  GRUPO_ID,'
      '  SUBTIPO_ID,'
      '  FAMILIA_ID,'
      '  LOCALIZACAO_ID,'
      '  FORNECEDOR_ID,'
      '  TRIBUTO_ID,'
      '  COD_GEN,'
      '  MOD_ICMS,'
      '  MOD_ICMS_ST,'
      '  ALIQUOTA_ICMS,'
      '  PIS,'
      '  CST_PIS,'
      '  CST_PIS_ENTR,'
      '  COFINS,'
      '  CST_COFINS,'
      '  CST_COFINS_ENTR,'
      '  REDUCAO_ICMS,'
      '  IPI,'
      '  CST_IPI,'
      '  MOD_IPI,'
      '  MVA,'
      '  COMISSAO,'
      '  MARGEM_LUCRO,'
      '  DESC_MAXIMO,'
      '  ULT_QUANTIDADE,'
      '  CUSTO_COMPRA,'
      '  VALOR_COMPRA,'
      '  CUSTOMEDIO,'
      '  DESPESAS,'
      '  DIF_ICMS,'
      '  PMZ,'
      '  PRECO_SUGESTAO,'
      '  PRECO_VAREJO,'
      '  PRECO_ATACADO,'
      '  PRECO_PROMOCAO,'
      '  DT_ATUALIZACAO,'
      '  PROMO_INICIAL,'
      '  PROMO_FINAL,'
      '  QUANT_MINIMA,'
      '  QUANT_MAXIMA,'
      '  QUANTIDADE_C,'
      '  QUANTIDADE_G,'
      '  QUANTIDADE_A,'
      '  ESTOQUE_INICIAL,'
      '  EST_TRABALHO,'
      '  EST_SEGURANCA,'
      '  DEMANDA_MAX,'
      '  PONTO_PEDIDO,'
      '  PAR_FATURAMENTO,'
      '  VENDA_MEDIA_PON,'
      '  VENDA_MEDIA_SEM,'
      '  DESV_PAD_SEM,'
      '  VINCULO,'
      '  MEDIA_CONSUMO,'
      '  MD5,'
      '  SPED,'
      '  STATUS,'
      '  PIS_ENTR,'
      '  COFINS_ENTR,'
      '  NAT_REC,'
      '  NAT_BC_REC,'
      '  COD_CONT'
      'from PRODUTOS '
      'where'
      '  PRODUTO_ID = :PRODUTO_ID')
    Left = 144
    Top = 408
  end
  object QUpdate: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    UpdateObject = USql_Produtos
    SQL.Strings = (
      '')
    Left = 96
    Top = 336
  end
end
