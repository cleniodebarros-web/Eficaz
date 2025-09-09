object FrmComposicao_Produtos: TFrmComposicao_Produtos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Composi'#231#227'o Produtos'
  ClientHeight = 225
  ClientWidth = 411
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label73: TLabel
    Left = 6
    Top = 9
    Width = 57
    Height = 13
    Caption = 'Composi'#231#227'o'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object btnComp: TSpeedButton
    Left = 118
    Top = 6
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
    OnClick = btnCompClick
  end
  object Label1: TLabel
    Left = 6
    Top = 35
    Width = 46
    Height = 13
    Caption = 'Descri'#231#227'o'
  end
  object Panel1: TPanel
    Left = 0
    Top = 184
    Width = 411
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object btnRetorna: TBitBtn
      Left = 332
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
      ModalResult = 2
      NumGlyphs = 2
      TabOrder = 0
    end
  end
  object Grid_Producao: TDBGrid
    Left = 0
    Top = 61
    Width = 411
    Height = 123
    Align = alBottom
    DataSource = DataProducao
    Enabled = False
    Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnColExit = Grid_ProducaoColExit
    OnKeyDown = Grid_ProducaoKeyDown
    OnKeyPress = Grid_ProducaoKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'INSUMO_ID'
        Title.Caption = 'C'#243'd. Insumo'
        Visible = True
      end
      item
        Color = clSilver
        Expanded = False
        FieldName = 'DESCRICAO'
        ReadOnly = True
        Title.Caption = 'Descri'#231#227'o'
        Width = 240
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTIDADE'
        Title.Alignment = taRightJustify
        Title.Caption = 'Quant.'
        Width = 72
        Visible = True
      end>
  end
  object COMPOSICAO_ID: TCurrencyEdit
    Left = 68
    Top = 6
    Width = 47
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 0
    ZeroEmpty = False
    OnChange = COMPOSICAO_IDChange
    OnKeyDown = COMPOSICAO_IDKeyDown
  end
  object NOME_COMP: TEdit
    Left = 68
    Top = 32
    Width = 335
    Height = 21
    MaxLength = 40
    TabOrder = 1
    OnExit = NOME_COMPExit
  end
  object DataProducao: TDataSource
    DataSet = QProducao
    Left = 168
    Top = 128
  end
  object IQuery: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 16
    Top = 125
  end
  object QProducao: TFDQuery
    BeforeEdit = QProducaoBeforeEdit
    BeforePost = QProducaoBeforePost
    AfterPost = QProducaoAfterPost
    BeforeDelete = QProducaoBeforeDelete
    AfterDelete = QProducaoAfterDelete
    OnNewRecord = QProducaoNewRecord
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    UpdateObject = USql_Producao
    SQL.Strings = (
      ''
      'SELECT * FROM COMP_PRODUTO'
      'WHERE'
      '(COMPOSICAO_ID = :COMPOSICAO_ID)')
    Left = 64
    Top = 125
    ParamData = <
      item
        Name = 'COMPOSICAO_ID'
        ParamType = ptInput
      end>
  end
  object QProdutos: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 120
    Top = 125
  end
  object USql_Producao: TFDUpdateSQL
    Connection = FrmData.DbF_Eficaz
    InsertSQL.Strings = (
      'insert into COMP_PRODUTO'
      '  (COMPOSICAO_ID, DESCRICAO, INSUMO_ID, NOME_COMP, QUANTIDADE)'
      'values'
      
        '  (:COMPOSICAO_ID, :DESCRICAO, :INSUMO_ID, :NOME_COMP, :QUANTIDA' +
        'DE)')
    ModifySQL.Strings = (
      'update COMP_PRODUTO'
      'set'
      '  COMPOSICAO_ID = :COMPOSICAO_ID,'
      '  DESCRICAO = :DESCRICAO,'
      '  INSUMO_ID = :INSUMO_ID,'
      '  NOME_COMP = :NOME_COMP,'
      '  QUANTIDADE = :QUANTIDADE'
      'where'
      '  COMPOSICAO_ID = :OLD_COMPOSICAO_ID and'
      '  INSUMO_ID = :OLD_INSUMO_ID')
    DeleteSQL.Strings = (
      'delete from COMP_PRODUTO'
      'where'
      '  COMPOSICAO_ID = :OLD_COMPOSICAO_ID and'
      '  INSUMO_ID = :OLD_INSUMO_ID')
    FetchRowSQL.Strings = (
      'Select '
      '  COMPOSICAO_ID,'
      '  INSUMO_ID,'
      '  NOME_COMP,'
      '  DESCRICAO,'
      '  QUANTIDADE'
      'from COMP_PRODUTO '
      'where'
      '  COMPOSICAO_ID = :COMPOSICAO_ID and'
      '  INSUMO_ID = :INSUMO_ID')
    Left = 216
    Top = 128
  end
end
