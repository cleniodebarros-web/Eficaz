object FrmMenu: TFrmMenu
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Config. Menu'
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
    OnDblClick = ItensDblClick
    OnExit = ItensExit
    OnKeyDown = ItensKeyDown
    OnKeyPress = ItensKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        ReadOnly = True
        Title.Caption = 'Descri'#231#227'o'
        Width = 293
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATUS'
        Title.Caption = 'Status'
        Width = 50
        Visible = True
      end>
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 0
    Width = 376
    Height = 25
    DataSource = DataTabela
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbEdit, nbPost, nbCancel, nbRefresh]
    Align = alTop
    Flat = True
    ConfirmDelete = False
    TabOrder = 2
  end
  object DataTabela: TDataSource
    AutoEdit = False
    Left = 40
    Top = 196
  end
  object USql_Transest: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  NOME,'
      '  DESCRICAO,'
      '  STATUS'
      'from CONFIG_MENU '
      'where'
      '  NOME = :NOME')
    ModifySQL.Strings = (
      'update CONFIG_MENU'
      'set'
      '  STATUS = :STATUS'
      'where'
      '  NOME = :OLD_NOME')
    InsertSQL.Strings = (
      'insert into CONFIG_MENU'
      '  (STATUS)'
      'values'
      '  (:STATUS)')
    DeleteSQL.Strings = (
      'delete from CONFIG_MENU'
      'where'
      '  NOME = :OLD_NOME')
    Left = 72
    Top = 196
  end
  object QTabela: TFDQuery
    BeforeInsert = QTabelaBeforeInsert
    BeforePost = QTabelaBeforePost
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM CONFIG_MENU')
    Left = 112
    Top = 192
  end
end
