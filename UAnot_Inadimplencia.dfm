object FrmAnot_Inadimplencia: TFrmAnot_Inadimplencia
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Anota'#231#245'es de Inadimpl'#234'ncia'
  ClientHeight = 251
  ClientWidth = 769
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 212
    Width = 769
    Height = 39
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object btnRetorna: TBitBtn
      Left = 646
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
      ModalResult = 1
      NumGlyphs = 2
      TabOrder = 0
    end
  end
  object Grid_Inadimplencia: TDBGrid
    Left = 0
    Top = 0
    Width = 769
    Height = 193
    Align = alClient
    DataSource = Data_Inadimplencia
    Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnKeyDown = Grid_InadimplenciaKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'historico'
        Title.Alignment = taCenter
        Title.Caption = 'Hist'#243'rico'
        Width = 448
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dt_cadastro'
        ReadOnly = True
        Title.Caption = 'Data'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'funcionario'
        ReadOnly = True
        Title.Caption = 'Funcion'#225'rio'
        Width = 232
        Visible = True
      end>
  end
  object StatusBar2: TStatusBar
    Left = 0
    Top = 193
    Width = 769
    Height = 19
    Panels = <
      item
        Text = '<F9> -Gravar'
        Width = 384
      end
      item
        Text = '<Ctrl + Del> - Apagar'
        Width = 384
      end>
  end
  object IQuery: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 16
    Top = 219
  end
  object QTabela: TFDQuery
    BeforeEdit = QTabelaBeforeEdit
    BeforeDelete = QTabelaBeforeDelete
    OnNewRecord = QTabelaNewRecord
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM INADIMPLENCIA'
      'WHERE'
      '(CLIENTE_ID = :CLIENTE_ID)')
    Left = 56
    Top = 219
    ParamData = <
      item
        Name = 'CLIENTE_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object Data_Inadimplencia: TDataSource
    DataSet = QTabela
    Left = 96
    Top = 216
  end
end
