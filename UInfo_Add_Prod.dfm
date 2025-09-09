object FrmInfo_Add_Prod: TFrmInfo_Add_Prod
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Informa'#231#245'es Adicionais do Produto'
  ClientHeight = 217
  ClientWidth = 456
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
  object Panel1: TPanel
    Left = 0
    Top = 178
    Width = 456
    Height = 39
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnRetorna: TBitBtn
      Left = 326
      Top = 11
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
      OnClick = btnRetornaClick
    end
    object btnOk: TBitBtn
      Left = 238
      Top = 11
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
    object NUM_SERIE: TEdit
      Left = 53
      Top = 10
      Width = 57
      Height = 21
      MaxLength = 10
      TabOrder = 2
      Text = '1'
      Visible = False
    end
    object Transacao_id: TCurrencyEdit
      Left = 0
      Top = 10
      Width = 47
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      DecimalPlaces = 0
      DisplayFormat = '0;-0'
      Enabled = False
      TabOrder = 3
      Visible = False
      ZeroEmpty = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 456
    Height = 90
    Align = alTop
    TabOrder = 2
    object Label2: TLabel
      Left = 8
      Top = 17
      Width = 74
      Height = 13
      Caption = 'C'#243'digo Produto'
    end
    object Label1: TLabel
      Left = 142
      Top = 17
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
    object Label4: TLabel
      Left = 8
      Top = 41
      Width = 110
      Height = 13
      Caption = 'Informa'#231#245'es Adicionais'
    end
    object Produto_id: TCurrencyEdit
      Left = 89
      Top = 14
      Width = 47
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      DecimalPlaces = 0
      DisplayFormat = '0;-0'
      Enabled = False
      ReadOnly = True
      TabOrder = 0
      ZeroEmpty = False
    end
    object AddProd: TEdit
      Left = 8
      Top = 60
      Width = 433
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 500
      TabOrder = 1
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 90
    Width = 456
    Height = 83
    Align = alTop
    TabOrder = 0
    Visible = False
    object Label3: TLabel
      Left = 14
      Top = 19
      Width = 61
      Height = 13
      Caption = 'N'#250'mero Lote'
    end
    object Label5: TLabel
      Left = 14
      Top = 54
      Width = 68
      Height = 13
      Caption = 'C'#243'digo Anvisa'
    end
    object Label7: TLabel
      Left = 235
      Top = 54
      Width = 66
      Height = 13
      Caption = 'Data Validade'
    end
    object Label6: TLabel
      Left = 235
      Top = 19
      Width = 78
      Height = 13
      Caption = 'Data Fabrica'#231#227'o'
    end
    object PROD_ANVISA: TEdit
      Left = 89
      Top = 51
      Width = 104
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 500
      TabOrder = 1
      Text = 'ISENTO'
    end
    object LOTE: TEdit
      Left = 89
      Top = 19
      Width = 72
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 500
      TabOrder = 0
    end
    object DT_FAB: TDateEdit
      Left = 334
      Top = 19
      Width = 83
      Height = 21
      CheckOnExit = True
      DialogTitle = 'Selecione a Data'
      NumGlyphs = 2
      TabOrder = 2
    end
    object DT_VAL: TDateEdit
      Left = 334
      Top = 46
      Width = 83
      Height = 21
      CheckOnExit = True
      DialogTitle = 'Selecione a Data'
      NumGlyphs = 2
      TabOrder = 3
    end
  end
  object IQuery: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 344
    Top = 11
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
    Left = 400
    Top = 11
    ParamData = <
      item
        Name = 'TRANSACAO_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
end
