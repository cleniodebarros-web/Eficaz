object FrmConfig_Bordero: TFrmConfig_Bordero
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Configura'#231#227'o de Border'#244
  ClientHeight = 437
  ClientWidth = 488
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
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 6
    Top = 9
    Width = 58
    Height = 13
    Caption = 'ID do Banco'
  end
  object Label30: TLabel
    Left = 114
    Top = 35
    Width = 38
    Height = 13
    Caption = 'Imprime'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label31: TLabel
    Left = 162
    Top = 35
    Width = 25
    Height = 13
    Caption = 'Linha'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label32: TLabel
    Left = 210
    Top = 35
    Width = 33
    Height = 13
    Caption = 'Coluna'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label33: TLabel
    Left = 258
    Top = 35
    Width = 51
    Height = 13
    Caption = 'Tam. M'#225'x.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Bevel3: TBevel
    Left = 6
    Top = 61
    Width = 476
    Height = 4
    Shape = bsTopLine
  end
  object Label34: TLabel
    Left = 6
    Top = 87
    Width = 96
    Height = 13
    Caption = 'Local de Pagamento'
  end
  object Label35: TLabel
    Left = 6
    Top = 113
    Width = 55
    Height = 13
    Caption = 'Vencimento'
  end
  object Label36: TLabel
    Left = 6
    Top = 139
    Width = 41
    Height = 13
    Caption = 'Cedente'
  end
  object Label37: TLabel
    Left = 6
    Top = 165
    Width = 79
    Height = 13
    Caption = 'C'#243'd. da Ag'#234'ncia'
  end
  object Label38: TLabel
    Left = 6
    Top = 191
    Width = 72
    Height = 13
    Caption = 'Dt. Documento'
  end
  object Label39: TLabel
    Left = 6
    Top = 217
    Width = 82
    Height = 13
    Caption = 'Num. Documento'
  end
  object Label40: TLabel
    Left = 6
    Top = 240
    Width = 71
    Height = 13
    Caption = 'Vr. Documento'
  end
  object Label41: TLabel
    Left = 6
    Top = 269
    Width = 51
    Height = 13
    Caption = 'Instru'#231#245'es'
  end
  object Label42: TLabel
    Left = 6
    Top = 295
    Width = 35
    Height = 13
    Caption = 'Sacado'
  end
  object Label44: TLabel
    Left = 6
    Top = 321
    Width = 60
    Height = 13
    Caption = 'N'#186' '#218'lt. Linha'
  end
  object Label103: TLabel
    Left = 6
    Top = 347
    Width = 120
    Height = 13
    Caption = 'Tam. Form. (Larg/Altura)'
  end
  object Bevel2: TBevel
    Left = 6
    Top = 383
    Width = 476
    Height = 4
    Shape = bsTopLine
  end
  object btnCaixa_Banco: TSpeedButton
    Left = 143
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
    OnClick = btnCaixa_BancoClick
  end
  object DBText4: TDBText
    Left = 215
    Top = 9
    Width = 48
    Height = 13
    AutoSize = True
    DataField = 'DESCRICAO'
    DataSource = DataBanco
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Banco: TCurrencyEdit
    Left = 73
    Top = 6
    Width = 67
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 0
    ZeroEmpty = False
    OnExit = BancoExit
    OnKeyDown = BancoKeyDown
  end
  object Imprime_Local: TCheckBox
    Left = 114
    Top = 84
    Width = 15
    Height = 17
    TabOrder = 1
    OnKeyDown = Imprime_LocalKeyDown
  end
  object Imprime_Cedente: TCheckBox
    Left = 114
    Top = 136
    Width = 15
    Height = 17
    TabOrder = 7
    OnKeyDown = Imprime_LocalKeyDown
  end
  object Imprime_Agencia: TCheckBox
    Left = 114
    Top = 162
    Width = 15
    Height = 17
    TabOrder = 10
    OnKeyDown = Imprime_LocalKeyDown
  end
  object Local_Lin: TCurrencyEdit
    Left = 162
    Top = 84
    Width = 40
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 2
    ZeroEmpty = False
    OnKeyDown = BancoKeyDown
  end
  object Local_Col: TCurrencyEdit
    Left = 210
    Top = 84
    Width = 40
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 3
    ZeroEmpty = False
    OnKeyDown = BancoKeyDown
  end
  object Local_Tam: TCurrencyEdit
    Left = 258
    Top = 84
    Width = 40
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 4
    ZeroEmpty = False
    OnKeyDown = BancoKeyDown
  end
  object Venc_Lin: TCurrencyEdit
    Left = 162
    Top = 110
    Width = 40
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 5
    ZeroEmpty = False
    OnKeyDown = BancoKeyDown
  end
  object Venc_Col: TCurrencyEdit
    Left = 210
    Top = 110
    Width = 40
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 6
    ZeroEmpty = False
    OnKeyDown = BancoKeyDown
  end
  object Cedente_Lin: TCurrencyEdit
    Left = 162
    Top = 136
    Width = 40
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 8
    ZeroEmpty = False
    OnKeyDown = BancoKeyDown
  end
  object Cedente_Col: TCurrencyEdit
    Left = 210
    Top = 136
    Width = 40
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 9
    ZeroEmpty = False
    OnKeyDown = BancoKeyDown
  end
  object Agencia_Lin: TCurrencyEdit
    Left = 162
    Top = 162
    Width = 40
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 11
    ZeroEmpty = False
    OnKeyDown = BancoKeyDown
  end
  object Agencia_Col: TCurrencyEdit
    Left = 210
    Top = 162
    Width = 40
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 12
    ZeroEmpty = False
    OnKeyDown = BancoKeyDown
  end
  object Data_Lin: TCurrencyEdit
    Left = 162
    Top = 188
    Width = 40
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 13
    ZeroEmpty = False
    OnKeyDown = BancoKeyDown
  end
  object Data_Col: TCurrencyEdit
    Left = 210
    Top = 188
    Width = 40
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 14
    ZeroEmpty = False
    OnKeyDown = BancoKeyDown
  end
  object Doc_Lin: TCurrencyEdit
    Left = 162
    Top = 214
    Width = 40
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 15
    ZeroEmpty = False
    OnKeyDown = BancoKeyDown
  end
  object Doc_Col: TCurrencyEdit
    Left = 210
    Top = 214
    Width = 40
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 16
    ZeroEmpty = False
    OnKeyDown = BancoKeyDown
  end
  object Valor_Lin: TCurrencyEdit
    Left = 162
    Top = 240
    Width = 40
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 17
    ZeroEmpty = False
    OnKeyDown = BancoKeyDown
  end
  object Valor_Col: TCurrencyEdit
    Left = 211
    Top = 240
    Width = 40
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 18
    ZeroEmpty = False
    OnKeyDown = BancoKeyDown
  end
  object Valor_Tam: TCurrencyEdit
    Left = 258
    Top = 240
    Width = 40
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 19
    ZeroEmpty = False
    OnKeyDown = BancoKeyDown
  end
  object Instrucoes_Lin: TCurrencyEdit
    Left = 162
    Top = 266
    Width = 40
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 20
    ZeroEmpty = False
    OnKeyDown = BancoKeyDown
  end
  object Instrucoes_Col: TCurrencyEdit
    Left = 210
    Top = 266
    Width = 40
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 21
    ZeroEmpty = False
    OnKeyDown = BancoKeyDown
  end
  object Instrucoes_Tam: TCurrencyEdit
    Left = 258
    Top = 266
    Width = 40
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 22
    ZeroEmpty = False
    OnKeyDown = BancoKeyDown
  end
  object Sacado_Lin: TCurrencyEdit
    Left = 162
    Top = 292
    Width = 40
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 23
    ZeroEmpty = False
    OnKeyDown = BancoKeyDown
  end
  object Sacado_Col: TCurrencyEdit
    Left = 210
    Top = 292
    Width = 40
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 24
    ZeroEmpty = False
    OnKeyDown = BancoKeyDown
  end
  object Ult_Lin: TCurrencyEdit
    Left = 162
    Top = 318
    Width = 40
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 25
    ZeroEmpty = False
    OnKeyDown = BancoKeyDown
  end
  object Largura_Papel: TCurrencyEdit
    Left = 162
    Top = 344
    Width = 70
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 26
    ZeroEmpty = False
    OnKeyDown = BancoKeyDown
  end
  object Altura_Papel: TCurrencyEdit
    Left = 258
    Top = 344
    Width = 70
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 27
    ZeroEmpty = False
    OnKeyDown = BancoKeyDown
  end
  object btnRetorna: TBitBtn
    Left = 407
    Top = 399
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
    TabOrder = 29
    OnClick = btnRetornaClick
  end
  object btnExecuta: TBitBtn
    Left = 326
    Top = 399
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
    TabOrder = 28
    OnClick = btnExecutaClick
  end
  object DataBanco: TDataSource
    DataSet = QBanco
    Left = 48
    Top = 373
  end
  object QBanco: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM BANCOS'
      'WHERE'
      '(BANCO_ID = :BANCO_ID)'
      'AND (EMPRESA_ID = :EMPRESA_ID)'
      'AND (STATUS = '#39'A'#39')')
    Left = 16
    Top = 376
    ParamData = <
      item
        Name = 'BANCO_ID'
        ParamType = ptInput
      end
      item
        Name = 'EMPRESA_ID'
        ParamType = ptInput
      end>
  end
  object QRel: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 80
    Top = 376
  end
end
