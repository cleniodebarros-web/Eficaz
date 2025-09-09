object FrmControle_Export_Nf_Ref: TFrmControle_Export_Nf_Ref
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Dados de Exporta'#231#227'o'
  ClientHeight = 216
  ClientWidth = 963
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
  object Label1: TLabel
    Left = 366
    Top = 8
    Width = 240
    Height = 16
    Caption = 'Relacionar Notas Fiscais de Refer'#234'cia'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 177
    Width = 963
    Height = 39
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = 136
    ExplicitWidth = 442
    object btnRetorna: TBitBtn
      Left = 870
      Top = 7
      Width = 75
      Height = 27
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
      TabOrder = 1
    end
    object btnOk: TBitBtn
      Left = 782
      Top = 7
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
      TabOrder = 0
      OnClick = btnOkClick
    end
  end
  object Grid_Notas: TDBGrid
    Left = 0
    Top = 33
    Width = 953
    Height = 136
    DataSource = DataNotas
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnKeyDown = Grid_NotasKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'NUM_DOC'
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' Nota Fiscal'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SERIE'
        Title.Alignment = taCenter
        Title.Caption = 'Serie'
        Width = 29
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MODELO'
        Title.Alignment = taCenter
        Title.Caption = 'Modelo'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_EMISSAO'
        Title.Alignment = taCenter
        Title.Caption = 'Emiss'#227'o'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CFOP'
        Title.Alignment = taCenter
        Title.Caption = 'Cfop'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BASE_ICMS_NORMAL'
        Title.Caption = 'Base Icms'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VR_ICMS_NORMAL'
        Title.Caption = 'Valor Icms'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BASE_ICMS_ST'
        Title.Caption = 'Base Icms St'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VR_ICMS_ST'
        Title.Caption = 'Icms St'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_PRODUTOS'
        Title.Caption = 'Vr. Produtos'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Title.Caption = 'Valor NF'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ROMANEIO'
        Title.Alignment = taCenter
        Title.Caption = 'Romaneio'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PEDIDO'
        Title.Alignment = taCenter
        Title.Caption = 'Pedido'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CHAVE_NFE'
        Title.Alignment = taCenter
        Title.Caption = 'Chave_Nfe'
        Visible = True
      end>
  end
  object IQuery: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 48
    Top = 171
  end
  object QTabela: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM TRANSITENS_SERIE'
      'WHERE'
      '(TRANSACAO_ID = :TRANSACAO_ID)')
    Left = 80
    Top = 171
    ParamData = <
      item
        Name = 'TRANSACAO_ID'
        ParamType = ptInput
      end>
  end
  object QNotas: TFDQuery
    AfterOpen = QNotasAfterOpen
    BeforeEdit = QNotasBeforeEdit
    OnNewRecord = QNotasNewRecord
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM TRANSITENS_NOTAS'
      'WHERE'
      '(TRANSACAO_ID = :TRANSACAO_ID)'
      'ORDER BY DT_EMISSAO, NUM_DOC')
    Left = 15
    Top = 169
    ParamData = <
      item
        Name = 'TRANSACAO_ID'
        ParamType = ptInput
      end>
  end
  object DataNotas: TDataSource
    DataSet = QNotas
    Left = 111
    Top = 173
  end
end
