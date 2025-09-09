object FrmIndices: TFrmIndices
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Indices p/ Custo e Venda'
  ClientHeight = 230
  ClientWidth = 376
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
  object Panel1: TPanel
    Left = 0
    Top = 189
    Width = 376
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnRetorna: TBitBtn
      Left = 297
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
      TabOrder = 0
      OnClick = btnRetornaClick
    end
  end
  object Itens: TDBGrid
    Left = 0
    Top = 25
    Width = 376
    Height = 164
    Align = alClient
    DataSource = DataTabela
    Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnExit = ItensExit
    OnKeyDown = ItensKeyDown
    OnKeyPress = ItensKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Title.Caption = 'Descri'#231#227'o'
        Width = 267
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Title.Alignment = taRightJustify
        Title.Caption = 'Valor'
        Width = 76
        Visible = True
      end>
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 0
    Width = 376
    Height = 25
    DataSource = DataTabela
    Align = alTop
    Flat = True
    ConfirmDelete = False
    TabOrder = 2
  end
  object DataTabela: TDataSource
    AutoEdit = False
    Left = 88
    Top = 156
  end
  object QTabela: TFDQuery
    BeforeInsert = QTabelaBeforeInsert
    BeforeEdit = QTabelaBeforeEdit
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    UpdateObject = USql_Transest
    SQL.Strings = (
      ''
      'SELECT * FROM INDICES')
    Left = 8
    Top = 152
  end
  object USql_Transest: TFDUpdateSQL
    InsertSQL.Strings = (
      'insert into INDICES'
      '  (DESCRICAO, VALOR)'
      'values'
      '  (:DESCRICAO, :VALOR)')
    ModifySQL.Strings = (
      'update INDICES'
      'set'
      '  DESCRICAO = :DESCRICAO,'
      '  VALOR = :VALOR'
      'where'
      '  DESCRICAO = :OLD_DESCRICAO')
    DeleteSQL.Strings = (
      'delete from INDICES'
      'where'
      '  DESCRICAO = :OLD_DESCRICAO')
    FetchRowSQL.Strings = (
      'Select '
      '  DESCRICAO,'
      '  VALOR'
      'from INDICES '
      'where'
      '  DESCRICAO = :DESCRICAO')
    Left = 48
    Top = 152
  end
end
