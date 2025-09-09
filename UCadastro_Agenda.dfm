object FrmCadastro_Agenda: TFrmCadastro_Agenda
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro Agendamentos Sal'#227'o'
  ClientHeight = 382
  ClientWidth = 421
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 347
    Width = 421
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object btnRetorna: TBitBtn
      Left = 336
      Top = 6
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
      TabOrder = 0
      OnClick = btnRetornaClick
    end
  end
  object Panel3: TPanel
    Left = 8
    Top = -1
    Width = 425
    Height = 342
    TabOrder = 1
    object Label1: TLabel
      Left = 4
      Top = 57
      Width = 23
      Height = 13
      Caption = 'Data'
    end
    object Label3: TLabel
      Left = 4
      Top = 86
      Width = 39
      Height = 13
      Caption = 'Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 4
      Top = 113
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object Label26: TLabel
      Left = 4
      Top = 175
      Width = 65
      Height = 13
      Caption = 'Profissional'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label25: TLabel
      Left = 4
      Top = 221
      Width = 35
      Height = 13
      Caption = 'Servi'#231'o'
    end
    object Label2: TLabel
      Left = 4
      Top = 253
      Width = 76
      Height = 13
      Caption = 'Cor Destaque'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 204
      Top = 57
      Width = 28
      Height = 13
      Caption = 'Horas'
    end
    object Label5: TLabel
      Left = 306
      Top = 57
      Width = 11
      Height = 13
      Caption = 'as'
    end
    object DBText6: TDBText
      Left = 85
      Top = 197
      Width = 258
      Height = 13
      DataField = 'NOME'
      DataSource = DataProfissional
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnVendedor: TSpeedButton
      Left = 135
      Top = 171
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
      OnClick = btnVendedorClick
    end
    object btnCliente: TSpeedButton
      Left = 134
      Top = 83
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
    object Label24: TLabel
      Left = 256
      Top = 312
      Width = 52
      Height = 13
      Caption = 'Vr. Servi'#231'o'
    end
    object Label7: TLabel
      Left = 4
      Top = 143
      Width = 42
      Height = 13
      Caption = 'Telefone'
    end
    object btnEdit: TBitBtn
      Left = 12
      Top = 7
      Width = 75
      Height = 25
      Caption = 'A&lterar'
      TabOrder = 0
      OnClick = btnEditClick
    end
    object btnDelete: TBitBtn
      Left = 120
      Top = 7
      Width = 75
      Height = 25
      Caption = '&Excluir'
      TabOrder = 1
      OnClick = btnDeleteClick
    end
    object btnSave: TBitBtn
      Left = 219
      Top = 7
      Width = 75
      Height = 25
      Caption = '&Salvar'
      TabOrder = 2
      OnClick = btnSaveClick
    end
    object btnDiscard: TBitBtn
      Left = 323
      Top = 7
      Width = 75
      Height = 25
      Caption = 'C&ancelar'
      TabOrder = 3
      OnClick = btnDiscardClick
    end
    object Colors: TColorBox
      Left = 85
      Top = 250
      Width = 85
      Height = 22
      NoneColorColor = clLime
      Selected = clYellow
      Enabled = False
      TabOrder = 12
      OnKeyDown = EMPRESA_IDKeyDown
    end
    object SERVICO: TComboBox
      Left = 85
      Top = 218
      Width = 325
      Height = 21
      CharCase = ecUpperCase
      Color = clWhite
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 40
      ParentFont = False
      TabOrder = 11
      OnChange = SERVICOChange
      OnExit = SERVICOExit
      OnKeyDown = EMPRESA_IDKeyDown
      Items.Strings = (
        'ARQ. MAGN'#201'TICOS'
        'ATENDIMENTO EXTERNO'
        'CONTRATO'
        'CORTESIA'
        'GARANTIA'
        'OR'#199'AMENTO'
        'OR'#199'AMENTO FABRICANTE'
        'SERV. APROVADO'
        'SERV. N'#195'O APROVADO'
        'SERV. SIST. PARTICULAR'
        'SISTEMA CONTRATO')
    end
    object FUNCIONARIO_ID: TCurrencyEdit
      Left = 85
      Top = 170
      Width = 47
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = '0;-0'
      Enabled = False
      TabOrder = 10
      ZeroEmpty = False
      OnExit = FUNCIONARIO_IDExit
      OnKeyDown = EMPRESA_IDKeyDown
    end
    object TRATAMENTO: TEdit
      Left = 85
      Top = 110
      Width = 210
      Height = 21
      Enabled = False
      MaxLength = 20
      TabOrder = 8
      OnKeyDown = EMPRESA_IDKeyDown
    end
    object CLIENTE_ID: TCurrencyEdit
      Left = 85
      Top = 83
      Width = 47
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = '0;-0'
      Enabled = False
      TabOrder = 7
      ZeroEmpty = False
      OnExit = CLIENTE_IDExit
      OnKeyDown = EMPRESA_IDKeyDown
    end
    object dt_agenda: TDateEdit
      Left = 85
      Top = 54
      Width = 90
      Height = 21
      CheckOnExit = True
      DialogTitle = 'Selecione a Data'
      Enabled = False
      NumGlyphs = 2
      TabOrder = 4
    end
    object HORA: TMaskEdit
      Left = 244
      Top = 54
      Width = 50
      Height = 21
      CharCase = ecUpperCase
      Color = clWhite
      Enabled = False
      EditMask = '!90:00;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 5
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
      Text = '  :  '
    end
    object HORA_FIM: TMaskEdit
      Left = 323
      Top = 54
      Width = 46
      Height = 21
      CharCase = ecUpperCase
      Color = clWhite
      Enabled = False
      EditMask = '!90:00;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 5
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
      Text = '  :  '
    end
    object Coluna: TCurrencyEdit
      Left = 204
      Top = 258
      Width = 47
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = '0;-0'
      Enabled = False
      TabOrder = 13
      Visible = False
      ZeroEmpty = False
      OnExit = FUNCIONARIO_IDExit
      OnKeyDown = EMPRESA_IDKeyDown
    end
    object VR_SERVICO: TRxCalcEdit
      Left = 315
      Top = 309
      Width = 95
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
      Enabled = False
      MaxValue = 99999.000000000000000000
      NumGlyphs = 2
      TabOrder = 14
      ZeroEmpty = False
      OnKeyDown = EMPRESA_IDKeyDown
    end
    object SERVICO_ID: TCurrencyEdit
      Left = 204
      Top = 285
      Width = 47
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = '0;-0'
      Enabled = False
      TabOrder = 15
      Visible = False
      ZeroEmpty = False
      OnExit = FUNCIONARIO_IDExit
      OnKeyDown = EMPRESA_IDKeyDown
    end
    object Telefone: TEdit
      Left = 85
      Top = 140
      Width = 210
      Height = 21
      Enabled = False
      MaxLength = 15
      TabOrder = 9
      OnKeyDown = EMPRESA_IDKeyDown
    end
  end
  object DataTabela: TDataSource
    AutoEdit = False
    DataSet = QTabela
    Left = 272
    Top = 72
  end
  object DataProfissional: TDataSource
    DataSet = QProfissional
    Left = 304
    Top = 88
  end
  object QTabela: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM AGENDA')
    Left = 280
    Top = 200
  end
  object IQuery: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 312
    Top = 200
  end
  object QEmpresa: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      'SELECT * FROM EMPRESAS'
      'WHERE'
      '(EMPRESA_ID = :EMPRESA_ID)'
      'AND (STATUS = '#39'A'#39')')
    Left = 360
    Top = 200
    ParamData = <
      item
        Name = 'EMPRESA_ID'
        ParamType = ptInput
      end>
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
    Left = 332
    Top = 132
    ParamData = <
      item
        Name = 'CLIENTE_ID'
        ParamType = ptInput
      end>
  end
  object QProfissional: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM FUNCIONARIOS'
      'WHERE'
      '(FUNCIONARIO_ID = :FUNCIONARIO_ID)'
      'AND (STATUS = '#39'A'#39')')
    Left = 364
    Top = 132
    ParamData = <
      item
        Name = 'FUNCIONARIO_ID'
        ParamType = ptInput
      end>
  end
  object QId_Func: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT FUNCIONARIO_ID FROM FUNCIONARIOS'
      'WHERE'
      '(APELIDO = :APELIDO)'
      'AND (STATUS = '#39'A'#39')')
    Left = 356
    Top = 84
    ParamData = <
      item
        Name = 'APELIDO'
        ParamType = ptInput
      end>
  end
end
