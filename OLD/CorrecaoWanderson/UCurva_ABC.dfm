object FrmCurva_ABC: TFrmCurva_ABC
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Planejamento Financeiro'
  ClientHeight = 229
  ClientWidth = 325
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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 6
    Top = 175
    Width = 313
    Height = 4
    Shape = bsTopLine
  end
  object Label1: TLabel
    Left = 6
    Top = 61
    Width = 76
    Height = 13
    Caption = 'Percentual de A'
  end
  object Label2: TLabel
    Left = 6
    Top = 87
    Width = 75
    Height = 13
    Caption = 'Percentual de B'
  end
  object Label3: TLabel
    Left = 6
    Top = 113
    Width = 76
    Height = 13
    Caption = 'Percentual de C'
  end
  object Label4: TLabel
    Left = 6
    Top = 139
    Width = 19
    Height = 13
    Caption = 'Ano'
    Visible = False
  end
  object Perc_A: TCurrencyEdit
    Left = 89
    Top = 58
    Width = 67
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    MaxValue = 100.000000000000000000
    TabOrder = 0
    Value = 70.000000000000000000
    ZeroEmpty = False
    OnKeyDown = Perc_AKeyDown
  end
  object Perc_B: TCurrencyEdit
    Left = 89
    Top = 84
    Width = 67
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    MaxValue = 100.000000000000000000
    TabOrder = 1
    Value = 20.000000000000000000
    ZeroEmpty = False
    OnKeyDown = Perc_AKeyDown
  end
  object Perc_C: TCurrencyEdit
    Left = 89
    Top = 110
    Width = 67
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    MaxValue = 100.000000000000000000
    TabOrder = 2
    Value = 10.000000000000000000
    ZeroEmpty = False
    OnKeyDown = Perc_AKeyDown
  end
  object Ano: TCurrencyEdit
    Left = 89
    Top = 136
    Width = 67
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    MaxValue = 2050.000000000000000000
    MinValue = 1900.000000000000000000
    TabOrder = 3
    Value = 1900.000000000000000000
    Visible = False
    ZeroEmpty = False
    OnKeyDown = Perc_AKeyDown
  end
  object Base: TComboBox
    Left = 89
    Top = 136
    Width = 121
    Height = 21
    Style = csDropDownList
    TabOrder = 4
    Visible = False
    OnKeyDown = Perc_AKeyDown
    Items.Strings = (
      'Compra'
      'Custo M'#233'dio'
      'Varejo'
      'Atacado')
  end
  object Dtmen: TDateEdit
    Left = 89
    Top = 136
    Width = 90
    Height = 21
    CheckOnExit = True
    DialogTitle = 'Selecione a Data'
    NumGlyphs = 2
    TabOrder = 5
    Visible = False
    OnEnter = DtmenEnter
    OnKeyDown = DtmenKeyDown
  end
  object Dtmai: TDateEdit
    Left = 193
    Top = 136
    Width = 90
    Height = 21
    CheckOnExit = True
    DialogTitle = 'Selecione a Data'
    NumGlyphs = 2
    TabOrder = 6
    Visible = False
    OnEnter = DtmenEnter
    OnKeyDown = DtmenKeyDown
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 325
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 7
    object Label5: TLabel
      Left = 6
      Top = 11
      Width = 313
      Height = 19
      Alignment = taCenter
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object btnRetorna: TBitBtn
    Left = 244
    Top = 185
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
    TabOrder = 8
    OnClick = btnRetornaClick
  end
  object btnExecuta: TBitBtn
    Left = 163
    Top = 185
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
    TabOrder = 9
    OnClick = btnExecutaClick
  end
  object QRel: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 264
    Top = 68
  end
  object Table3: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 206
    Top = 68
    object Table3MES: TStringField
      FieldName = 'DESCR'
      Size = 15
    end
    object Table3VALOR: TFloatField
      FieldName = 'PERCENTUAL'
    end
    object Table3MES2: TStringField
      FieldName = 'MES'
      Size = 15
    end
    object Table3VALOR2: TFloatField
      FieldName = 'VALOR'
    end
  end
  object Table4: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 202
    Top = 20
    object Table4DESCR: TStringField
      FieldName = 'DESCR'
      Size = 30
    end
    object Table4PERCENTUAL: TFloatField
      FieldName = 'PERCENTUAL'
    end
  end
  object Table5: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 256
    Top = 20
    object StringField1: TStringField
      FieldName = 'DESCR'
      Size = 30
    end
    object FloatField1: TFloatField
      FieldName = 'PERCENTUAL'
    end
  end
  object Table7: TFDMemTable
    Indexes = <
      item
      end>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 20
    Top = 180
  end
end
