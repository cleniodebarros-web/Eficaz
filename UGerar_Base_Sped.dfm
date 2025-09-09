object FrmGerar_Base_Sped: TFrmGerar_Base_Sped
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Gerar Base Sped Pis Coofins'
  ClientHeight = 203
  ClientWidth = 327
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
  object Label2: TLabel
    Left = 6
    Top = 9
    Width = 36
    Height = 13
    Caption = 'Per'#237'odo'
  end
  object Bevel1: TBevel
    Left = 6
    Top = 149
    Width = 313
    Height = 4
    Shape = bsTopLine
  end
  object Label6: TLabel
    Left = 6
    Top = 113
    Width = 74
    Height = 13
    Caption = 'Num. Rec. Ant.'
  end
  object Label4: TLabel
    Left = 6
    Top = 87
    Width = 57
    Height = 13
    Caption = 'Sit. Especial'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 6
    Top = 61
    Width = 53
    Height = 13
    Caption = 'Tipo Escrit.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label10: TLabel
    Left = 6
    Top = 35
    Width = 69
    Height = 13
    Caption = 'Vers'#227'o Layout'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object btnRetorna: TBitBtn
    Left = 244
    Top = 165
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
    TabOrder = 7
  end
  object btnExecuta: TBitBtn
    Left = 163
    Top = 165
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
    TabOrder = 6
    OnClick = btnExecutaClick
  end
  object Num_Recibo_Ant: TEdit
    Left = 89
    Top = 110
    Width = 230
    Height = 21
    TabOrder = 5
    OnKeyDown = DtmenKeyDown
  end
  object Situacao_Especial: TComboBox
    Left = 89
    Top = 84
    Width = 202
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 32
    ParentFont = False
    TabOrder = 4
    Text = '0 - Abertura'
    OnKeyDown = VersaoKeyDown
    Items.Strings = (
      ''
      '0 - Abertura'
      '1 - Cis'#227'o'
      '2 - Fus'#227'o'
      '3 - Incorpora'#231#227'o'
      '4 - Encerramento')
  end
  object Tipo_Escrituracao: TComboBox
    Left = 89
    Top = 58
    Width = 202
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 32
    ParentFont = False
    TabOrder = 3
    Text = 'Original'
    OnKeyDown = VersaoKeyDown
    Items.Strings = (
      'Original'
      'Retificadora')
  end
  object Versao: TComboBox
    Left = 89
    Top = 32
    Width = 77
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Text = '101'
    OnKeyDown = VersaoKeyDown
    Items.Strings = (
      '100'
      '101')
  end
  object Dtmai: TDateEdit
    Left = 195
    Top = 6
    Width = 90
    Height = 21
    CheckOnExit = True
    DialogTitle = 'Selecione a Data'
    NumGlyphs = 2
    TabOrder = 1
    OnEnter = DtmenEnter
    OnKeyDown = DtmenKeyDown
  end
  object Dtmen: TDateEdit
    Left = 89
    Top = 6
    Width = 90
    Height = 21
    CheckOnExit = True
    DialogTitle = 'Selecione a Data'
    NumGlyphs = 2
    TabOrder = 0
    OnEnter = DtmenEnter
    OnKeyDown = DtmenKeyDown
  end
  object Panel1: TPanel
    Left = 7
    Top = 81
    Width = 313
    Height = 41
    BevelOuter = bvNone
    TabOrder = 8
    Visible = False
    object Label1: TLabel
      Left = 6
      Top = 14
      Width = 301
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object QSped: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT * FROM BANCOS'
      'WHERE'
      '(BANCO_ID = :BANCO_ID)'
      'AND (EMPRESA_ID = :EMPRESA_ID)'
      'AND (STATUS = '#39'A'#39')')
    Left = 104
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'BANCO_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EMPRESA_ID'
        ParamType = ptUnknown
      end>
  end
  object QRel: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT * FROM BANCOS'
      'WHERE'
      '(BANCO_ID = :BANCO_ID)'
      'AND (EMPRESA_ID = :EMPRESA_ID)'
      'AND (STATUS = '#39'A'#39')')
    Left = 72
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'BANCO_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EMPRESA_ID'
        ParamType = ptUnknown
      end>
  end
  object QSub_Detalhe: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT * FROM BANCOS'
      'WHERE'
      '(BANCO_ID = :BANCO_ID)'
      'AND (EMPRESA_ID = :EMPRESA_ID)'
      'AND (STATUS = '#39'A'#39')')
    Left = 40
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'BANCO_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EMPRESA_ID'
        ParamType = ptUnknown
      end>
  end
  object QDetalhe: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT * FROM BANCOS'
      'WHERE'
      '(BANCO_ID = :BANCO_ID)'
      'AND (EMPRESA_ID = :EMPRESA_ID)'
      'AND (STATUS = '#39'A'#39')')
    Left = 8
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'BANCO_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EMPRESA_ID'
        ParamType = ptUnknown
      end>
  end
  object QRel_Sped: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT * FROM BANCOS'
      'WHERE'
      '(BANCO_ID = :BANCO_ID)'
      'AND (EMPRESA_ID = :EMPRESA_ID)'
      'AND (STATUS = '#39'A'#39')')
    Left = 136
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'BANCO_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EMPRESA_ID'
        ParamType = ptUnknown
      end>
  end
  object QProduto: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT * FROM BANCOS'
      'WHERE'
      '(BANCO_ID = :BANCO_ID)'
      'AND (EMPRESA_ID = :EMPRESA_ID)'
      'AND (STATUS = '#39'A'#39')')
    Left = 8
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'BANCO_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EMPRESA_ID'
        ParamType = ptUnknown
      end>
  end
end
