object FrmControle_Export: TFrmControle_Export
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Delcara'#231#227'o de Importa'#231#227'o'
  ClientHeight = 268
  ClientWidth = 504
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 142
    Top = 21
    Width = 37
    Height = 13
    Caption = 'Label1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 21
    Width = 74
    Height = 13
    Caption = 'C'#243'digo Produto'
  end
  object Label3: TLabel
    Left = 8
    Top = 55
    Width = 122
    Height = 13
    Caption = 'N'#250'mero DI/DSI/DA/DRI-E'
  end
  object Label4: TLabel
    Left = 8
    Top = 83
    Width = 80
    Height = 13
    Caption = 'C'#243'd. Exportador'
  end
  object Label9: TLabel
    Left = 319
    Top = 55
    Width = 66
    Height = 13
    Caption = 'Data Registro'
  end
  object Label30: TLabel
    Left = 8
    Top = 110
    Width = 53
    Height = 13
    Caption = 'Chave NFe'
  end
  object Panel1: TPanel
    Left = 0
    Top = 229
    Width = 504
    Height = 39
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 7
    object btnRetorna: TBitBtn
      Left = 420
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
      TabOrder = 0
    end
    object btnOk: TBitBtn
      Left = 332
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
      TabOrder = 1
      OnClick = btnOkClick
    end
  end
  object Produto_id: TCurrencyEdit
    Left = 89
    Top = 18
    Width = 47
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    Enabled = False
    ReadOnly = True
    TabOrder = 5
    ZeroEmpty = False
  end
  object Transacao_id: TCurrencyEdit
    Left = 9
    Top = 219
    Width = 47
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    Enabled = False
    TabOrder = 6
    Visible = False
    ZeroEmpty = False
  end
  object N_DI: TEdit
    Left = 142
    Top = 52
    Width = 163
    Height = 21
    MaxLength = 12
    TabOrder = 0
  end
  object C_Exportador: TEdit
    Left = 94
    Top = 80
    Width = 211
    Height = 21
    MaxLength = 60
    TabOrder = 2
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 134
    Width = 487
    Height = 82
    Caption = 'Desembara'#231'o Aduaneiro'
    TabOrder = 4
    object Label5: TLabel
      Left = 4
      Top = 25
      Width = 38
      Height = 13
      Caption = 'Estado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 110
      Top = 25
      Width = 29
      Height = 13
      Caption = 'Local'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 4
      Top = 57
      Width = 27
      Height = 13
      Caption = 'Data'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object UF_DESEMB: TComboBox
      Left = 48
      Top = 22
      Width = 56
      Height = 21
      CharCase = ecUpperCase
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 2
      ParentFont = False
      TabOrder = 0
      Items.Strings = (
        'AC'
        'AL'
        'AP'
        'AM'
        'BA'
        'CE'
        'DF'
        'ES'
        'GO'
        'MA'
        'MG'
        'MT'
        'MS'
        'PA'
        'PB'
        'PR'
        'PE'
        'PI'
        'RJ'
        'RN'
        'RS'
        'RO'
        'RR'
        'SC'
        'SP'
        'SE'
        'TO')
    end
    object lOC_DESEMB: TEdit
      Left = 145
      Top = 22
      Width = 339
      Height = 21
      MaxLength = 60
      TabOrder = 1
    end
    object DT_DESEMB: TDateEdit
      Left = 48
      Top = 55
      Width = 90
      Height = 21
      CheckOnExit = True
      DialogTitle = 'Selecione a Data'
      NumGlyphs = 2
      TabOrder = 2
    end
  end
  object DT_DI: TDateEdit
    Left = 405
    Top = 52
    Width = 90
    Height = 21
    CheckOnExit = True
    DialogTitle = 'Selecione a Data'
    NumGlyphs = 2
    TabOrder = 1
  end
  object CHAVE_NFE: TEdit
    Left = 94
    Top = 107
    Width = 348
    Height = 21
    MaxLength = 44
    TabOrder = 3
  end
  object QTabela: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      'SELECT * FROM TRANSITENS_IMPORT'
      'WHERE'
      '(TRANSACAO_ID = :TRANSACAO_ID)')
    Left = 80
    Top = 224
    ParamData = <
      item
        Name = 'TRANSACAO_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object IQuery: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      'SELECT * FROM TRANSITENS_SERIE'
      'WHERE'
      '(TRANSACAO_ID = :TRANSACAO_ID)')
    Left = 152
    Top = 224
    ParamData = <
      item
        Name = 'TRANSACAO_ID'
        ParamType = ptInput
      end>
  end
end
