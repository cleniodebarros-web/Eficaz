object FrmControle_Series: TFrmControle_Series
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Controle de S'#233'ries'
  ClientHeight = 230
  ClientWidth = 338
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 189
    Width = 338
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnRetorna: TBitBtn
      Left = 258
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
      ModalResult = 1
      NumGlyphs = 2
      TabOrder = 0
    end
  end
  object Grid_Itens: TDBGrid
    Left = 0
    Top = 0
    Width = 338
    Height = 189
    Align = alClient
    DataSource = DataSub_Detail
    Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnKeyDown = Grid_ItensKeyDown
    OnKeyPress = Grid_ItensKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'num_serie'
        Title.Caption = 'Num. de S'#233'rie'
        Width = 186
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quantidade'
        ReadOnly = True
        Title.Alignment = taRightJustify
        Title.Caption = 'Quantidade'
        Visible = True
      end>
  end
  object DataSub_Detail: TDataSource
    DataSet = QSub_Detail
    Left = 240
    Top = 104
  end
  object QRel: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afDisable
    Left = 88
    Top = 112
  end
  object QSub_Detail: TFDQuery
    BeforePost = QSub_DetailBeforePost
    OnNewRecord = QSub_DetailNewRecord
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      ''
      ''
      '')
    Left = 24
    Top = 104
  end
  object USql_Transest: TFDUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO transitens_serie'
      '(num_serie, produto_id, multiplicador, quantidade)'
      
        'VALUES (:new_num_serie, :new_produto_id, :new_multiplicador, :ne' +
        'w_quantidade)'
      'RETURNING num_serie, produto_id, multiplicador, quantidade')
    ModifySQL.Strings = (
      'UPDATE transitens_serie'
      
        'SET num_serie = :new_num_serie, produto_id = :new_produto_id, mu' +
        'ltiplicador = :new_multiplicador, '
      '  quantidade = :new_quantidade'
      'WHERE transacao_id = :old_transacao_id and'
      '  produto_id = :old_produto_id '
      '  '
      'RETURNING num_serie, produto_id, multiplicador, quantidade')
    DeleteSQL.Strings = (
      'DELETE FROM transitens_serie'
      'WHERE transacao_id = :old_transacao_id AND '
      '  produto_id = :old_produto_id ')
    FetchRowSQL.Strings = (
      
        'SELECT transacao_id, num_serie, produto_id, multiplicador, quant' +
        'idade'
      'FROM transitens_serie'
      'WHERE transacao_id = :transacao_id  AND '
      '  produto_id = :produto_id A')
    Left = 156
    Top = 114
  end
end
