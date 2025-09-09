object FrmRemarca: TFrmRemarca
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Remarca'#231#227'o de Pre'#231'os'
  ClientHeight = 295
  ClientWidth = 656
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
  object Label15: TLabel
    Left = 6
    Top = 35
    Width = 48
    Height = 13
    Caption = 'Cst. Atual'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label16: TLabel
    Left = 6
    Top = 325
    Width = 74
    Height = 13
    Caption = 'Desp. Vari'#225'veis'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object Label17: TLabel
    Left = 6
    Top = 64
    Width = 67
    Height = 13
    Caption = 'Margem Lucro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label23: TLabel
    Left = 6
    Top = 377
    Width = 20
    Height = 13
    Caption = 'PMZ'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object Label20: TLabel
    Left = 223
    Top = 34
    Width = 67
    Height = 13
    Caption = 'Pr. Vda. Atual'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label18: TLabel
    Left = 223
    Top = 377
    Width = 59
    Height = 13
    Caption = 'Pr. Sugerido'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object Label19: TLabel
    Left = 223
    Top = 64
    Width = 46
    Height = 13
    Caption = 'Remarcar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object DBText1: TDBText
    Left = -1
    Top = 186
    Width = 645
    Height = 22
    Alignment = taCenter
    DataField = 'DESCRICAO'
    DataSource = DataTabela
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 223
    Top = 126
    Width = 66
    Height = 13
    Caption = 'Margem Atual'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 6
    Top = 96
    Width = 56
    Height = 13
    Caption = 'Quantidade'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 426
    Top = 35
    Width = 75
    Height = 13
    Caption = 'Pr. Prazo  Atual'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 426
    Top = 377
    Width = 89
    Height = 13
    Caption = 'Pr. Prazo Sugerido'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object Label5: TLabel
    Left = 422
    Top = 64
    Width = 93
    Height = 13
    Caption = 'Remarcar Pr. Prazo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl1: TLabel
    Left = 223
    Top = 156
    Width = 66
    Height = 13
    Caption = 'Estoq. M'#237'nimo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 466
    Top = 126
    Width = 70
    Height = 13
    Caption = 'Pre'#231'o Atacado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 453
    Top = 156
    Width = 87
    Height = 13
    Caption = 'Qtd.Vda. Atacado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Tipo_Remarca: TRadioGroup
    Left = 223
    Top = 323
    Width = 419
    Height = 41
    Caption = 'Tipo Remarca'#231#227'o'
    Columns = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 1
    Items.Strings = (
      'Real'
      'Convencional')
    ParentFont = False
    TabOrder = 15
    Visible = False
    OnClick = Tipo_RemarcaClick
  end
  object Custo_Atual: TRxCalcEdit
    Left = 87
    Top = 32
    Width = 95
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
    MaxValue = 99999.000000000000000000
    NumGlyphs = 2
    ReadOnly = True
    TabOrder = 5
    ZeroEmpty = False
  end
  object Despesas: TRxCalcEdit
    Left = 87
    Top = 322
    Width = 95
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    DisplayFormat = '0.00;-0.00'
    MaxValue = 99999.000000000000000000
    NumGlyphs = 2
    ReadOnly = True
    TabOrder = 6
    Visible = False
    ZeroEmpty = False
  end
  object Margem_Lucro: TRxCalcEdit
    Left = 87
    Top = 64
    Width = 95
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    DisplayFormat = '0.00;-0.00'
    MaxValue = 99999.000000000000000000
    NumGlyphs = 2
    ReadOnly = True
    TabOrder = 7
    ZeroEmpty = False
  end
  object PMZ: TRxCalcEdit
    Left = 87
    Top = 374
    Width = 95
    Height = 21
    Hint = 
      'O PMZ '#233' o Pre'#231'o com Margem Zero (l'#237'quida). '#201' um valor calculado ' +
      #13#10'para vender o produto sem ter nenhum ganho, somente pagando os' +
      ' '#13#10'impostos e outras despesas operacionais (tais despesas devem ' +
      'ser '#13#10'cadastradas previamente; detalhes). O PMZ serve como base ' +
      'para '#13#10'formular novos pre'#231'os.'
    Margins.Left = 4
    Margins.Top = 1
    DisplayFormat = '0.00;-0.00'
    MaxValue = 99999.000000000000000000
    NumGlyphs = 2
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 8
    Visible = False
    ZeroEmpty = False
  end
  object Pr_Venda_Atual: TRxCalcEdit
    Left = 296
    Top = 32
    Width = 120
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
    MaxValue = 99999.000000000000000000
    NumGlyphs = 2
    ReadOnly = True
    TabOrder = 9
    ZeroEmpty = False
  end
  object Preco_Sugerido: TRxCalcEdit
    Left = 296
    Top = 374
    Width = 120
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
    MaxValue = 99999.000000000000000000
    NumGlyphs = 2
    ReadOnly = True
    TabOrder = 10
    Visible = False
    ZeroEmpty = False
  end
  object Novo_Preco: TRxCalcEdit
    Left = 296
    Top = 64
    Width = 120
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
    MaxValue = 99999.000000000000000000
    NumGlyphs = 2
    TabOrder = 0
    ZeroEmpty = False
    OnExit = Novo_PrecoExit
  end
  object Panel1: TPanel
    Left = 0
    Top = 254
    Width = 656
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 4
    object btnRetorna: TBitBtn
      Left = 554
      Top = 8
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
      ModalResult = 1
      NumGlyphs = 2
      TabOrder = 2
    end
    object btnRemarca: TBitBtn
      Left = 243
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Re&marcar'
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
      OnClick = btnRemarcaClick
    end
    object BtnRemarcaT: TBitBtn
      Left = 324
      Top = 8
      Width = 109
      Height = 25
      Caption = 'R&emarcar Todos'
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
      OnClick = BtnRemarcaTClick
    end
    object BtnRemarcaCusto: TBitBtn
      Left = 439
      Top = 8
      Width = 109
      Height = 25
      Caption = 'Remarcar C&usto'
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
      TabOrder = 3
      OnClick = BtnRemarcaCustoClick
    end
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 0
    Width = 656
    Height = 25
    DataSource = DataTabela
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    Align = alTop
    Flat = True
    TabOrder = 11
    OnClick = DBNavigator1Click
  end
  object Margem_Atual: TRxCalcEdit
    Left = 296
    Top = 123
    Width = 120
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    DisplayFormat = '0.00;-0.00'
    MaxValue = 99999.000000000000000000
    NumGlyphs = 2
    TabOrder = 3
    ZeroEmpty = False
    OnExit = Margem_AtualExit
  end
  object Rem_Margem_Atual: TCheckBox
    Left = 8
    Top = 126
    Width = 176
    Height = 17
    Caption = 'Remarcar Margem Atual'
    TabOrder = 2
  end
  object Quantidade: TRxCalcEdit
    Left = 87
    Top = 93
    Width = 95
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    DisplayFormat = '0.00;-0.00'
    MaxValue = 99999.000000000000000000
    NumGlyphs = 2
    ReadOnly = True
    TabOrder = 12
    ZeroEmpty = False
  end
  object Pr_Prazo_Atual: TRxCalcEdit
    Left = 522
    Top = 32
    Width = 120
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
    MaxValue = 99999.000000000000000000
    NumGlyphs = 2
    ReadOnly = True
    TabOrder = 13
    ZeroEmpty = False
  end
  object Preco_Prazo_Sugerido: TRxCalcEdit
    Left = 522
    Top = 374
    Width = 120
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
    MaxValue = 99999.000000000000000000
    NumGlyphs = 2
    ReadOnly = True
    TabOrder = 14
    Visible = False
    ZeroEmpty = False
  end
  object NOVO_PRECO_PRAZO: TRxCalcEdit
    Left = 522
    Top = 64
    Width = 120
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
    MaxValue = 99999.000000000000000000
    NumGlyphs = 2
    TabOrder = 1
    ZeroEmpty = False
    OnExit = Novo_PrecoExit
  end
  object Atualiz_Estoque_Minimo: TCheckBox
    Left = 8
    Top = 155
    Width = 176
    Height = 17
    Caption = 'Atualizar Estoque M'#237'nimo'
    TabOrder = 16
    OnClick = Atualiz_Estoque_MinimoClick
  end
  object Estoque_minimo: TRxCalcEdit
    Left = 296
    Top = 151
    Width = 120
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    DisplayFormat = '0.00;-0.00'
    Enabled = False
    MaxValue = 99999.000000000000000000
    NumGlyphs = 2
    TabOrder = 17
    ZeroEmpty = False
    OnExit = Margem_AtualExit
  end
  object QUANT_MAXIMA: TRxCalcEdit
    Left = 547
    Top = 151
    Width = 95
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    DisplayFormat = '0.00;-0.00'
    MaxValue = 99999.000000000000000000
    NumGlyphs = 2
    TabOrder = 18
    ZeroEmpty = False
  end
  object PRECO_ATACADO: TRxCalcEdit
    Left = 547
    Top = 123
    Width = 95
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    DisplayFormat = '0.00;-0.00'
    MaxValue = 99999.000000000000000000
    NumGlyphs = 2
    TabOrder = 19
    ZeroEmpty = False
  end
  object DataTabela: TDataSource
    DataSet = QTabela
    Left = 139
    Top = 241
  end
  object QTabela: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 8
    Top = 240
  end
  object QUpdate: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 104
    Top = 240
  end
  object QCalculos: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 72
    Top = 240
  end
  object QIndices: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT SUM(VALOR) AS VALOR'
      'FROM INDICES')
    Left = 40
    Top = 240
  end
end
