object FrmDebito_Pontos_Parceiro: TFrmDebito_Pontos_Parceiro
  Left = 257
  Top = 281
  BorderIcons = [biSystemMenu]
  Caption = 'D'#233'bito de pontos para Parceiros'
  ClientHeight = 354
  ClientWidth = 614
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 8
    Top = 100
    Width = 49
    Height = 14
    Caption = 'Parceiro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnCliente: TSpeedButton
    Left = 70
    Top = 117
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
  object DBText2: TDBText
    Left = 8
    Top = 144
    Width = 64
    Height = 18
    AutoSize = True
    DataField = 'NOME'
    DataSource = DataFuncionario
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 378
    Top = 280
    Width = 95
    Height = 18
    Caption = 'Valor Pontos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 8
    Top = 221
    Width = 78
    Height = 19
    Caption = 'Descri'#231#227'o'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 168
    Width = 29
    Height = 14
    Caption = 'Data'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Cliente: TCurrencyEdit
    Left = 9
    Top = 117
    Width = 55
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    ZeroEmpty = False
    OnExit = ClienteExit
    OnKeyDown = ClienteKeyDown
  end
  object Valor: TRxCalcEdit
    Left = 488
    Top = 281
    Width = 102
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
    NumGlyphs = 2
    TabOrder = 3
    ZeroEmpty = False
    OnKeyDown = ClienteKeyDown
  end
  object btnExecuta: TButton
    Left = 400
    Top = 317
    Width = 85
    Height = 25
    Caption = '&OK'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = btnExecutaClick
  end
  object btnRetorna: TButton
    Left = 505
    Top = 317
    Width = 85
    Height = 25
    Caption = '&Retorna'
    ModalResult = 2
    TabOrder = 5
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 614
    Height = 41
    Align = alTop
    TabOrder = 0
    object Label5: TLabel
      Left = 94
      Top = 3
      Width = 427
      Height = 33
      Caption = 'Abatimento de Pontos para Parceiro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object Descricao: TEdit
    Left = 8
    Top = 246
    Width = 582
    Height = 21
    MaxLength = 40
    TabOrder = 2
  end
  object DT_TRANS: TDateEdit
    Left = 8
    Top = 188
    Width = 83
    Height = 21
    CheckOnExit = True
    DialogTitle = 'Selecione a Data'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 6
  end
  object QFuncionario: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      'SELECT * FROM FUNCIONARIOS'
      'WHERE'
      'FUNCIONARIO_ID = :FUNCIONARIO'
      'AND (STATUS = '#39'A'#39')')
    Left = 304
    Top = 46
    ParamData = <
      item
        Name = 'FUNCIONARIO'
        ParamType = ptInput
      end>
  end
  object DataFuncionario: TDataSource
    DataSet = QFuncionario
    Left = 362
    Top = 46
  end
  object QUpdate: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      'SELECT * FROM CLIENTES'
      'WHERE'
      'CLIENTE_ID = :CLIENTE'
      'AND (STATUS = '#39'A'#39')')
    Left = 208
    Top = 46
    ParamData = <
      item
        Name = 'CLIENTE'
        ParamType = ptInput
      end>
  end
  object IQuery: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      'SELECT * FROM CLIENTES'
      'WHERE'
      'CLIENTE_ID = :CLIENTE'
      'AND (STATUS = '#39'A'#39')')
    Left = 256
    Top = 46
    ParamData = <
      item
        Name = 'CLIENTE'
        ParamType = ptInput
      end>
  end
  object Query: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      'SELECT * FROM CLIENTES'
      'WHERE'
      'CLIENTE_ID = :CLIENTE'
      'AND (STATUS = '#39'A'#39')')
    Left = 432
    Top = 46
    ParamData = <
      item
        Name = 'CLIENTE'
        ParamType = ptInput
      end>
  end
end
