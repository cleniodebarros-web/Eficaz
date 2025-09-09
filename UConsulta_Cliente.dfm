object FrmConsulta_Cliente: TFrmConsulta_Cliente
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta Cliente'
  ClientHeight = 123
  ClientWidth = 449
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 6
    Top = 35
    Width = 33
    Height = 13
    Caption = '&Cliente'
    FocusControl = Cliente
  end
  object btnCliente: TSpeedButton
    Left = 146
    Top = 32
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
    OnClick = btnClienteClick
  end
  object DBText1: TDBText
    Left = 219
    Top = 35
    Width = 201
    Height = 13
    DataField = 'NOME'
    DataSource = DataCliente
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label16: TLabel
    Left = 6
    Top = 9
    Width = 64
    Height = 13
    Caption = 'Cond. Pagto.'
  end
  object Bevel1: TBevel
    Left = 6
    Top = 71
    Width = 433
    Height = 10
    Shape = bsTopLine
  end
  object Label34: TLabel
    Left = 242
    Top = 9
    Width = 57
    Height = 13
    Caption = 'Finalizadora'
  end
  object Cliente: TCurrencyEdit
    Left = 76
    Top = 32
    Width = 67
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 1
    ZeroEmpty = False
    OnChange = ClienteChange
    OnKeyDown = Cond_PagtoKeyDown
  end
  object Cond_Pagto: TComboBox
    Left = 76
    Top = 6
    Width = 134
    Height = 21
    Style = csDropDownList
    CharCase = ecUpperCase
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 0
    MaxLength = 7
    ParentFont = False
    TabOrder = 0
    Text = 'A VISTA'
    OnChange = Cond_PagtoChange
    OnKeyDown = Cond_PagtoKeyDown
    Items.Strings = (
      'A VISTA'
      'A PRAZO'
      'CARTAO'
      'CHEQUE'
      '')
  end
  object btnExecuta: TBitBtn
    Left = 345
    Top = 87
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
    TabOrder = 2
    OnClick = btnExecutaClick
  end
  object FINALIZADORA_ID: TDBLookupComboBox
    Left = 310
    Top = 6
    Width = 129
    Height = 21
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    KeyField = 'Finalizadora_ID'
    ListField = 'Legenda'
    ListSource = DataFinalizadora
    ParentFont = False
    TabOrder = 3
  end
  object DataCliente: TDataSource
    DataSet = QCliente
    Left = 64
    Top = 88
  end
  object QCliente: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM CLIENTES'
      'WHERE'
      '(CLIENTE_ID = :CLIENTE_ID)'
      'AND (STATUS = '#39'A'#39')')
    Left = 16
    Top = 81
    ParamData = <
      item
        Name = 'CLIENTE_ID'
        ParamType = ptInput
      end>
  end
  object QFinalizadora: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM FINALIZADORAS'
      'WHERE CLIENTE_ID >  0')
    Left = 128
    Top = 96
  end
  object DataFinalizadora: TDataSource
    DataSet = QFinalizadora
    Left = 163
    Top = 98
  end
end
