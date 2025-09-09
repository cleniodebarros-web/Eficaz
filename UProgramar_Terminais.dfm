object FrmProgramar_Terminais: TFrmProgramar_Terminais
  Left = 0
  Top = 0
  BorderIcons = [biMinimize]
  BorderStyle = bsSingle
  Caption = 'Programar Terminais'
  ClientHeight = 358
  ClientWidth = 724
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
    Top = 305
    Width = 705
    Height = 10
    Shape = bsTopLine
  end
  object Gauge1: TGauge
    Left = 470
    Top = 269
    Width = 241
    Height = 20
    ForeColor = clBlue
    Progress = 0
    Visible = False
  end
  object btnRetorna: TBitBtn
    Left = 636
    Top = 321
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
    TabOrder = 14
    OnClick = btnRetornaClick
  end
  object btnExecuta: TBitBtn
    Left = 555
    Top = 321
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
    TabOrder = 13
    OnClick = btnExecutaClick
  end
  object GroupBox1: TGroupBox
    Left = 6
    Top = 9
    Width = 443
    Height = 281
    Caption = 'Terminais'
    TabOrder = 1
    object Pdv01: TCheckBox
      Left = 6
      Top = 21
      Width = 67
      Height = 17
      Caption = 'Caixa 1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnKeyDown = Pdv01KeyDown
    end
    object Pdv02: TCheckBox
      Left = 6
      Top = 47
      Width = 67
      Height = 17
      Caption = 'Caixa 2'
      TabOrder = 5
      OnKeyDown = Pdv01KeyDown
    end
    object Pdv03: TCheckBox
      Left = 6
      Top = 73
      Width = 67
      Height = 17
      Caption = 'Caixa 3'
      TabOrder = 10
      OnKeyDown = Pdv01KeyDown
    end
    object Pdv04: TCheckBox
      Left = 6
      Top = 99
      Width = 67
      Height = 17
      Caption = 'Caixa 4'
      TabOrder = 15
      OnKeyDown = Pdv01KeyDown
    end
    object Pdv05: TCheckBox
      Left = 6
      Top = 125
      Width = 67
      Height = 17
      Caption = 'Caixa 5'
      TabOrder = 20
      OnKeyDown = Pdv01KeyDown
    end
    object Pdv06: TCheckBox
      Left = 6
      Top = 151
      Width = 67
      Height = 17
      Caption = 'Caixa 6'
      TabOrder = 25
      OnKeyDown = Pdv01KeyDown
    end
    object Pdv07: TCheckBox
      Left = 6
      Top = 177
      Width = 67
      Height = 17
      Caption = 'Caixa 7'
      TabOrder = 30
      OnKeyDown = Pdv01KeyDown
    end
    object Pdv08: TCheckBox
      Left = 6
      Top = 203
      Width = 67
      Height = 17
      Caption = 'Caixa 8'
      TabOrder = 35
      OnKeyDown = Pdv01KeyDown
    end
    object Pdv09: TCheckBox
      Left = 6
      Top = 229
      Width = 67
      Height = 17
      Caption = 'Caixa 9'
      TabOrder = 40
      OnKeyDown = Pdv01KeyDown
    end
    object Pdv10: TCheckBox
      Left = 6
      Top = 255
      Width = 67
      Height = 17
      Caption = 'Caixa 10'
      TabOrder = 46
      OnKeyDown = Pdv01KeyDown
    end
    object Pdv11: TCheckBox
      Left = 75
      Top = 21
      Width = 67
      Height = 17
      Caption = 'Caixa 11'
      TabOrder = 1
      OnKeyDown = Pdv01KeyDown
    end
    object Pdv12: TCheckBox
      Left = 75
      Top = 47
      Width = 67
      Height = 17
      Caption = 'Caixa 12'
      TabOrder = 6
      OnKeyDown = Pdv01KeyDown
    end
    object Pdv13: TCheckBox
      Left = 75
      Top = 73
      Width = 67
      Height = 17
      Caption = 'Caixa 13'
      TabOrder = 11
      OnKeyDown = Pdv01KeyDown
    end
    object Pdv14: TCheckBox
      Left = 75
      Top = 99
      Width = 67
      Height = 17
      Caption = 'Caixa 14'
      TabOrder = 16
      OnKeyDown = Pdv01KeyDown
    end
    object Pdv15: TCheckBox
      Left = 75
      Top = 125
      Width = 67
      Height = 17
      Caption = 'Caixa 15'
      TabOrder = 21
      OnKeyDown = Pdv01KeyDown
    end
    object Pdv16: TCheckBox
      Left = 75
      Top = 151
      Width = 67
      Height = 17
      Caption = 'Caixa 16'
      TabOrder = 26
      OnKeyDown = Pdv01KeyDown
    end
    object Pdv17: TCheckBox
      Left = 75
      Top = 177
      Width = 67
      Height = 17
      Caption = 'Caixa 17'
      TabOrder = 31
      OnKeyDown = Pdv01KeyDown
    end
    object Pdv18: TCheckBox
      Left = 75
      Top = 203
      Width = 67
      Height = 17
      Caption = 'Caixa 18'
      TabOrder = 36
      OnKeyDown = Pdv01KeyDown
    end
    object Pdv19: TCheckBox
      Left = 75
      Top = 229
      Width = 67
      Height = 17
      Caption = 'Caixa 19'
      TabOrder = 41
      OnKeyDown = Pdv01KeyDown
    end
    object Pdv20: TCheckBox
      Left = 75
      Top = 255
      Width = 67
      Height = 17
      Caption = 'Caixa 20'
      TabOrder = 47
      OnKeyDown = Pdv01KeyDown
    end
    object Pdv21: TCheckBox
      Left = 144
      Top = 21
      Width = 67
      Height = 17
      Caption = 'Caixa 21'
      TabOrder = 2
      OnKeyDown = Pdv01KeyDown
    end
    object Pdv22: TCheckBox
      Left = 144
      Top = 47
      Width = 67
      Height = 17
      Caption = 'Caixa 22'
      TabOrder = 7
      OnKeyDown = Pdv01KeyDown
    end
    object Pdv23: TCheckBox
      Left = 144
      Top = 73
      Width = 67
      Height = 17
      Caption = 'Caixa 23'
      TabOrder = 12
      OnKeyDown = Pdv01KeyDown
    end
    object Pdv24: TCheckBox
      Left = 144
      Top = 99
      Width = 67
      Height = 17
      Caption = 'Caixa 24'
      TabOrder = 17
      OnKeyDown = Pdv01KeyDown
    end
    object Pdv25: TCheckBox
      Left = 144
      Top = 125
      Width = 67
      Height = 17
      Caption = 'Caixa 25'
      TabOrder = 22
      OnKeyDown = Pdv01KeyDown
    end
    object Pdv26: TCheckBox
      Left = 144
      Top = 151
      Width = 67
      Height = 17
      Caption = 'Caixa 26'
      TabOrder = 27
      OnKeyDown = Pdv01KeyDown
    end
    object Pdv27: TCheckBox
      Left = 144
      Top = 177
      Width = 67
      Height = 17
      Caption = 'Caixa 27'
      TabOrder = 32
      OnKeyDown = Pdv01KeyDown
    end
    object Pdv28: TCheckBox
      Left = 144
      Top = 203
      Width = 67
      Height = 17
      Caption = 'Caixa 28'
      TabOrder = 37
      OnKeyDown = Pdv01KeyDown
    end
    object Pdv29: TCheckBox
      Left = 144
      Top = 229
      Width = 67
      Height = 17
      Caption = 'Caixa 29'
      TabOrder = 42
      OnKeyDown = Pdv01KeyDown
    end
    object Pdv30: TCheckBox
      Left = 144
      Top = 255
      Width = 67
      Height = 17
      Caption = 'Caixa 30'
      TabOrder = 48
      OnKeyDown = Pdv01KeyDown
    end
    object Pdv31: TCheckBox
      Left = 213
      Top = 21
      Width = 67
      Height = 17
      Caption = 'Caixa 31'
      TabOrder = 3
      OnKeyDown = Pdv01KeyDown
    end
    object Pdv32: TCheckBox
      Left = 213
      Top = 47
      Width = 67
      Height = 17
      Caption = 'Caixa 32'
      TabOrder = 8
      OnKeyDown = Pdv01KeyDown
    end
    object Pdv33: TCheckBox
      Left = 213
      Top = 73
      Width = 67
      Height = 17
      Caption = 'Caixa 33'
      TabOrder = 13
      OnKeyDown = Pdv01KeyDown
    end
    object Pdv34: TCheckBox
      Left = 213
      Top = 102
      Width = 67
      Height = 17
      Caption = 'Caixa 34'
      TabOrder = 18
      OnKeyDown = Pdv01KeyDown
    end
    object Pdv35: TCheckBox
      Left = 213
      Top = 125
      Width = 67
      Height = 17
      Caption = 'Caixa 35'
      TabOrder = 23
      OnKeyDown = Pdv01KeyDown
    end
    object Pdv36: TCheckBox
      Left = 213
      Top = 151
      Width = 67
      Height = 17
      Caption = 'Caixa 36'
      TabOrder = 28
      OnKeyDown = Pdv01KeyDown
    end
    object Pdv37: TCheckBox
      Left = 213
      Top = 177
      Width = 67
      Height = 17
      Caption = 'Caixa 37'
      TabOrder = 33
      OnKeyDown = Pdv01KeyDown
    end
    object Pdv38: TCheckBox
      Left = 213
      Top = 203
      Width = 67
      Height = 17
      Caption = 'Caixa 38'
      TabOrder = 38
      OnKeyDown = Pdv01KeyDown
    end
    object Pdv39: TCheckBox
      Left = 213
      Top = 229
      Width = 67
      Height = 17
      Caption = 'Caixa 39'
      TabOrder = 43
      OnKeyDown = Pdv01KeyDown
    end
    object Pdv40: TCheckBox
      Left = 213
      Top = 252
      Width = 67
      Height = 17
      Caption = 'Caixa 40'
      TabOrder = 45
      OnKeyDown = Pdv01KeyDown
    end
    object Pdv41: TCheckBox
      Left = 292
      Top = 21
      Width = 67
      Height = 17
      Caption = 'Caixa 41'
      TabOrder = 4
      OnKeyDown = Pdv01KeyDown
    end
    object Pdv42: TCheckBox
      Left = 292
      Top = 47
      Width = 67
      Height = 17
      Caption = 'Caixa 42'
      TabOrder = 9
      OnKeyDown = Pdv01KeyDown
    end
    object Pdv43: TCheckBox
      Left = 292
      Top = 73
      Width = 67
      Height = 17
      Caption = 'Caixa 43'
      TabOrder = 14
      OnKeyDown = Pdv01KeyDown
    end
    object Pdv44: TCheckBox
      Left = 294
      Top = 102
      Width = 67
      Height = 17
      Caption = 'Caixa 44'
      TabOrder = 19
      OnKeyDown = Pdv01KeyDown
    end
    object Pdv45: TCheckBox
      Left = 292
      Top = 125
      Width = 67
      Height = 17
      Caption = 'Caixa 45'
      TabOrder = 24
      OnKeyDown = Pdv01KeyDown
    end
    object Pdv46: TCheckBox
      Left = 292
      Top = 151
      Width = 67
      Height = 17
      Caption = 'Caixa 46'
      TabOrder = 29
      OnKeyDown = Pdv01KeyDown
    end
    object Pdv47: TCheckBox
      Left = 292
      Top = 177
      Width = 67
      Height = 17
      Caption = 'Caixa 47'
      TabOrder = 34
      OnKeyDown = Pdv01KeyDown
    end
    object Pdv48: TCheckBox
      Left = 292
      Top = 203
      Width = 67
      Height = 17
      Caption = 'Caixa 48'
      TabOrder = 39
      OnKeyDown = Pdv01KeyDown
    end
    object Pdv49: TCheckBox
      Left = 294
      Top = 229
      Width = 67
      Height = 17
      Caption = 'Caixa 49'
      TabOrder = 44
      OnKeyDown = Pdv01KeyDown
    end
    object Pdv50: TCheckBox
      Left = 294
      Top = 255
      Width = 67
      Height = 17
      Caption = 'Caixa 50'
      TabOrder = 49
      OnKeyDown = Pdv01KeyDown
    end
  end
  object GroupBox2: TGroupBox
    Left = 470
    Top = 8
    Width = 241
    Height = 175
    Caption = 'Tabelas'
    TabOrder = 0
    object Produtos: TCheckBox
      Left = 6
      Top = 21
      Width = 97
      Height = 17
      Caption = 'Produtos Totais'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = ProdutosClick
    end
    object Alterados: TCheckBox
      Left = 6
      Top = 47
      Width = 115
      Height = 17
      Caption = 'Produtos Alterados'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = AlteradosClick
    end
    object Formas: TCheckBox
      Left = 6
      Top = 73
      Width = 89
      Height = 17
      Caption = 'Finalizadoras'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object Operadores: TCheckBox
      Left = 6
      Top = 99
      Width = 73
      Height = 17
      Caption = 'Operadores'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
    object Clientes: TCheckBox
      Left = 6
      Top = 125
      Width = 97
      Height = 17
      Caption = 'Clientes'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      OnClick = ClientesClick
    end
    object Tributos: TCheckBox
      Left = 6
      Top = 155
      Width = 97
      Height = 17
      Caption = 'Tributos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
    end
    object ECF: TCheckBox
      Left = 152
      Top = 47
      Width = 67
      Height = 17
      Caption = 'ECF'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object Teclado: TCheckBox
      Left = 152
      Top = 21
      Width = 67
      Height = 17
      Caption = 'Teclado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = ProdutosClick
    end
    object TCD: TCheckBox
      Left = 152
      Top = 73
      Width = 67
      Height = 17
      Caption = 'TCD'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object NCM: TCheckBox
      Left = 152
      Top = 125
      Width = 67
      Height = 17
      Caption = 'Ncm(Ibpt)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
    end
    object TCD_GERTEC: TCheckBox
      Left = 152
      Top = 98
      Width = 86
      Height = 17
      Caption = 'TCD(Gertec)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object Chk_Config: TCheckBox
      Left = 152
      Top = 148
      Width = 97
      Height = 17
      Caption = 'Config'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
    end
  end
  object GroupBox3: TGroupBox
    Left = 470
    Top = 186
    Width = 241
    Height = 76
    Caption = 'Legenda'
    TabOrder = 9
    object Label1: TLabel
      Left = 6
      Top = 21
      Width = 117
      Height = 13
      Caption = 'Sem Comunica'#231#227'o...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 6
      Top = 47
      Width = 110
      Height = 13
      Caption = 'Trafego Liberado...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Pdv60: TCheckBox
    Left = 373
    Top = 264
    Width = 67
    Height = 17
    Caption = 'Caixa 60'
    TabOrder = 12
    OnKeyDown = Pdv01KeyDown
  end
  object Pdv59: TCheckBox
    Left = 373
    Top = 238
    Width = 67
    Height = 17
    Caption = 'Caixa 59'
    TabOrder = 11
    OnKeyDown = Pdv01KeyDown
  end
  object Pdv58: TCheckBox
    Left = 373
    Top = 212
    Width = 67
    Height = 17
    Caption = 'Caixa 58'
    TabOrder = 10
    OnKeyDown = Pdv01KeyDown
  end
  object Pdv57: TCheckBox
    Left = 373
    Top = 186
    Width = 67
    Height = 17
    Caption = 'Caixa 57'
    TabOrder = 8
    OnKeyDown = Pdv01KeyDown
  end
  object Pdv56: TCheckBox
    Left = 373
    Top = 160
    Width = 67
    Height = 17
    Caption = 'Caixa 56'
    TabOrder = 7
    OnKeyDown = Pdv01KeyDown
  end
  object Pdv55: TCheckBox
    Left = 373
    Top = 134
    Width = 67
    Height = 17
    Caption = 'Caixa 55'
    TabOrder = 6
    OnKeyDown = Pdv01KeyDown
  end
  object Pdv54: TCheckBox
    Left = 373
    Top = 108
    Width = 67
    Height = 17
    Caption = 'Caixa 54'
    TabOrder = 5
    OnKeyDown = Pdv01KeyDown
  end
  object Pdv53: TCheckBox
    Left = 373
    Top = 83
    Width = 67
    Height = 17
    Caption = 'Caixa 53'
    TabOrder = 4
    OnKeyDown = Pdv01KeyDown
  end
  object Pdv52: TCheckBox
    Left = 373
    Top = 56
    Width = 67
    Height = 17
    Caption = 'Caixa 52'
    TabOrder = 3
    OnKeyDown = Pdv01KeyDown
  end
  object Pdv51: TCheckBox
    Left = 373
    Top = 30
    Width = 67
    Height = 17
    Caption = 'Caixa 51'
    TabOrder = 2
    OnKeyDown = Pdv01KeyDown
  end
  object Timer1: TTimer
    Interval = 500
    OnTimer = Timer1Timer
    Left = 48
    Top = 320
  end
  object QTabela: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Top = 320
  end
  object QSaldo: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 32
    Top = 320
  end
  object QVencimento: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 96
    Top = 320
  end
  object QRel: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 128
    Top = 320
  end
  object QSearch: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 168
    Top = 320
  end
end
