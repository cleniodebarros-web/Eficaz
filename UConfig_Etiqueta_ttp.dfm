object FrmConfig_Etiqueta_ttp: TFrmConfig_Etiqueta_ttp
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Config. de Etiqueta TTP-244 Plus'
  ClientHeight = 259
  ClientWidth = 459
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label107: TLabel
    Left = 8
    Top = 16
    Width = 120
    Height = 13
    Caption = 'ETIQUETA TTP-244 PLUS'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label110: TLabel
    Left = 6
    Top = 61
    Width = 81
    Height = 13
    Caption = 'Coluna Esquerda'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label111: TLabel
    Left = 6
    Top = 87
    Width = 67
    Height = 13
    Caption = 'Coluna Direita'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label112: TLabel
    Left = 6
    Top = 113
    Width = 107
    Height = 13
    Caption = 'Linha ID Etiq. Superior'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label113: TLabel
    Left = 6
    Top = 139
    Width = 127
    Height = 13
    Caption = 'Linha Descr. Etiq. Superior'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label114: TLabel
    Left = 6
    Top = 165
    Width = 123
    Height = 13
    Caption = 'Linha Pre'#231'o Etiq. Superior'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label115: TLabel
    Left = 246
    Top = 61
    Width = 148
    Height = 13
    Caption = 'Linha C'#243'd. Barra Etiq. Superior'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label116: TLabel
    Left = 246
    Top = 87
    Width = 122
    Height = 13
    Caption = 'Linha Barra Etiq. Superior'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label117: TLabel
    Left = 246
    Top = 113
    Width = 103
    Height = 13
    Caption = 'Linha ID Etiq. Inferior'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label118: TLabel
    Left = 246
    Top = 139
    Width = 123
    Height = 13
    Caption = 'Linha Descr. Etiq. Inferior'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label106: TLabel
    Left = 244
    Top = 165
    Width = 119
    Height = 13
    Caption = 'Linha Pre'#231'o Etiq. Inferior'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Bevel3: TBevel
    Left = 6
    Top = 35
    Width = 476
    Height = 4
    Shape = bsTopLine
  end
  object Bevel2: TBevel
    Left = 8
    Top = 207
    Width = 476
    Height = 4
    Shape = bsTopLine
  end
  object Col_Direita: TCurrencyEdit
    Left = 162
    Top = 84
    Width = 40
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 1
    ZeroEmpty = False
    OnKeyDown = Col_EsquerdaKeyDown
  end
  object Linha_Id_Etiqueta_Superior: TCurrencyEdit
    Left = 162
    Top = 110
    Width = 40
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 2
    ZeroEmpty = False
    OnKeyDown = Col_EsquerdaKeyDown
  end
  object Linha_Desc_Etiqueta_Superior: TCurrencyEdit
    Left = 162
    Top = 136
    Width = 40
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 3
    ZeroEmpty = False
    OnKeyDown = Col_EsquerdaKeyDown
  end
  object Linha_Preco_Etiqueta_Superior: TCurrencyEdit
    Left = 162
    Top = 162
    Width = 40
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 4
    ZeroEmpty = False
    OnKeyDown = Col_EsquerdaKeyDown
  end
  object Linha_Cod_Barra_Etiq_Superior: TCurrencyEdit
    Left = 402
    Top = 58
    Width = 40
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 5
    ZeroEmpty = False
    OnKeyDown = Col_EsquerdaKeyDown
  end
  object Linha_Barra_Etiq_Superior: TCurrencyEdit
    Left = 402
    Top = 84
    Width = 40
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 6
    ZeroEmpty = False
    OnKeyDown = Col_EsquerdaKeyDown
  end
  object Linha_ID_Etiq_Inferior: TCurrencyEdit
    Left = 402
    Top = 110
    Width = 40
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 7
    ZeroEmpty = False
    OnKeyDown = Col_EsquerdaKeyDown
  end
  object Linha_Desc_Etiq_Inferior: TCurrencyEdit
    Left = 402
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
    OnKeyDown = Col_EsquerdaKeyDown
  end
  object Linha_Preco_Etiq_Inferior: TCurrencyEdit
    Left = 402
    Top = 162
    Width = 40
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 9
    ZeroEmpty = False
    OnKeyDown = Col_EsquerdaKeyDown
  end
  object Col_Esquerda: TCurrencyEdit
    Left = 162
    Top = 58
    Width = 40
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 0
    ZeroEmpty = False
    OnKeyDown = Col_EsquerdaKeyDown
  end
  object btnRetorna: TBitBtn
    Left = 369
    Top = 217
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
    TabOrder = 11
    OnClick = btnRetornaClick
  end
  object btnExecuta: TBitBtn
    Left = 288
    Top = 217
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
    TabOrder = 10
    OnClick = btnExecutaClick
  end
  object QRel: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 16
    Top = 213
  end
end
