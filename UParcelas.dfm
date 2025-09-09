object FrmParcelas: TFrmParcelas
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Parcelas'
  ClientHeight = 242
  ClientWidth = 582
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
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 582
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object btnGera: TBitBtn
      Left = 6
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Gerar Parcela'
      TabOrder = 0
      OnClick = btnGeraClick
    end
    object btnEdit: TBitBtn
      Left = 87
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Alterar'
      TabOrder = 1
      OnClick = btnEditClick
    end
    object btnDuplicatas: TButton
      Left = 167
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Duplicatas'
      TabOrder = 2
      OnClick = btnDuplicatasClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 201
    Width = 582
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object btnRetorna: TBitBtn
      Left = 501
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
  object Parcelas: TDBGrid
    Left = 6
    Top = 41
    Width = 570
    Height = 160
    DataSource = DataTabela
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBlue
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = btnEditClick
    OnKeyPress = ParcelasKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'BANCO_ID'
        Title.Alignment = taRightJustify
        Title.Caption = 'Cx/Bco.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PARCELA_ID'
        Title.Caption = 'Parcela'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_VENCIMENTO'
        Title.Caption = 'Vencimento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Title.Alignment = taRightJustify
        Title.Caption = 'Valor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESPECIE'
        Title.Caption = 'Esp. Documento'
        Width = 123
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DUPLICATA'
        Title.Caption = 'N'#186' Documento'
        Width = 123
        Visible = True
      end>
  end
  object DataTabela: TDataSource
    DataSet = QTabela
    Left = 56
    Top = 208
  end
  object QTabela: TFDQuery
    AfterOpen = QTabelaAfterOpen
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM TRANSPARCELAS'
      'WHERE'
      '(TRANSACAO_ID = :TRANSACAO_ID)'
      'AND (TIPO_TRANSACAO = :TIPO_TRANSACAO)'
      'ORDER BY PARCELA_ID')
    Left = 24
    Top = 144
    ParamData = <
      item
        Name = 'TRANSACAO_ID'
        ParamType = ptInput
      end
      item
        Name = 'TIPO_TRANSACAO'
        ParamType = ptInput
      end>
  end
  object IQuery: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 72
    Top = 144
  end
  object QTransacao: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM TRANSACOES'
      'WHERE'
      '(TRANSACAO_ID = :TRANSACAO_ID)')
    Left = 120
    Top = 144
    ParamData = <
      item
        Name = 'TRANSACAO_ID'
        ParamType = ptInput
      end>
  end
end
