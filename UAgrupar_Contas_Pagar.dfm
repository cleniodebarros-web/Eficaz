object FrmAgrupar_Contas_Pagar: TFrmAgrupar_Contas_Pagar
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Agrupar Contas a Pagar'
  ClientHeight = 310
  ClientWidth = 679
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 679
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 6
      Top = 13
      Width = 36
      Height = 13
      Caption = 'Per'#237'odo'
    end
    object Label2: TLabel
      Left = 475
      Top = 13
      Width = 55
      Height = 13
      Caption = 'Fornecedor'
    end
    object btnFornecedor: TSpeedButton
      Left = 610
      Top = 10
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
      OnClick = btnFornecedorClick
    end
    object Label8: TLabel
      Left = 265
      Top = 13
      Width = 46
      Height = 13
      Caption = 'Esp. Doc.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Dtmen: TDateEdit
      Left = 57
      Top = 10
      Width = 90
      Height = 21
      CheckOnExit = True
      DialogTitle = 'Selecione a Data'
      NumGlyphs = 2
      TabOrder = 0
      OnEnter = DtmenEnter
      OnKeyDown = DtmenKeyDown
    end
    object Dtmai: TDateEdit
      Left = 161
      Top = 10
      Width = 90
      Height = 21
      CheckOnExit = True
      DialogTitle = 'Selecione a Data'
      NumGlyphs = 2
      TabOrder = 1
      OnEnter = DtmenEnter
      OnKeyDown = DtmenKeyDown
    end
    object Fornecedor: TCurrencyEdit
      Left = 540
      Top = 10
      Width = 67
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = '0;-0'
      TabOrder = 3
      ZeroEmpty = False
      OnExit = FornecedorExit
      OnKeyDown = FornecedorKeyDown
    end
    object Especie: TComboBox
      Left = 317
      Top = 10
      Width = 140
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 20
      ParentFont = False
      TabOrder = 2
      OnKeyDown = FornecedorKeyDown
      Items.Strings = (
        ''
        'BANC'#193'RIA'
        'CARTEIRA'
        'CHEQUE'
        'DUPLICATA'
        'JUR'#205'DICA'
        'NOTA PROMISS'#211'RIA'
        'PERDIDA')
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 269
    Width = 679
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object Label3: TLabel
      Left = 6
      Top = 14
      Width = 32
      Height = 13
      Caption = 'Soma'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label27: TLabel
      Left = 206
      Top = 14
      Width = 56
      Height = 13
      Caption = 'Vr. Agrupar'
    end
    object btnExecuta: TButton
      Left = 438
      Top = 8
      Width = 75
      Height = 25
      Caption = '&OK'
      TabOrder = 2
      OnClick = btnExecutaClick
    end
    object btnRetorna: TButton
      Left = 599
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Retorna'
      TabOrder = 4
      OnClick = btnRetornaClick
    end
    object btnSoma: TButton
      Left = 519
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Soma'
      TabOrder = 3
      OnClick = btnSomaClick
    end
    object Vr_Agrupar: TRxCalcEdit
      Left = 269
      Top = 10
      Width = 109
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
      NumGlyphs = 2
      TabOrder = 1
      ZeroEmpty = False
    end
    object Vr_Soma: TRxCalcEdit
      Left = 49
      Top = 10
      Width = 109
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      NumGlyphs = 2
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      ZeroEmpty = False
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 679
    Height = 188
    Align = alClient
    Color = clInfoBk
    DataSource = DataContas
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clBlue
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Nome'
        Width = 268
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESPECIE'
        Title.Caption = 'Tipo Doc.'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DUPLICATA'
        Title.Caption = 'N'#250'm. Doc.'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PARCELA_ID'
        Title.Caption = 'Parcela'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_VENCIMENTO'
        Title.Caption = 'Dt. Venc.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Title.Alignment = taRightJustify
        Title.Caption = 'Valor'
        Width = 90
        Visible = True
      end>
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 229
    Width = 679
    Height = 19
    Panels = <
      item
        Text = '<F3> - Seleciona'
        Width = 339
      end
      item
        Text = '<F4> - Exclui Sele'#231#227'o'
        Width = 340
      end>
  end
  object Alfabeto: TTabSet
    Left = 0
    Top = 248
    Width = 679
    Height = 21
    Align = alBottom
    AutoScroll = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    SoftTop = True
    Style = tsModernTabs
    Tabs.Strings = (
      'A'
      'B'
      'C'
      'D'
      'E'
      'F'
      'G'
      'H'
      'I'
      'J'
      'K'
      'L'
      'M'
      'N'
      'O'
      'P'
      'Q'
      'R'
      'S'
      'T'
      'U'
      'V'
      'W'
      'X'
      'Y'
      'Z')
    OnClick = AlfabetoClick
  end
  object DataContas: TDataSource
    AutoEdit = False
    DataSet = QContas
    Left = 152
    Top = 163
  end
  object QContas: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      ''
      
        'SELECT FORNECEDORES.NOME, FORNECEDORES.ENDERECO, FORNECEDORES.NU' +
        'MERO, TRANSPARCELAS.*, TRANSACOES.HISTORICO, TRANSACOES.NUM_DOC,' +
        ' TRANSACOES.CONTA_ID, TRANSACOES.VENDEDOR_ID, TRANSACOES.EMPRESA' +
        '_ID, TRANSACOES.TPCTB, TRANSACOES.C_CUSTO_ID, TRANSACOES.FORNECE' +
        'DOR_ID'
      'FROM FORNECEDORES'
      'INNER JOIN TRANSACOES'
      'ON (FORNECEDORES.FORNECEDOR_ID = TRANSACOES.FORNECEDOR_ID)'
      'INNER JOIN TRANSPARCELAS'
      'ON (TRANSACOES.TRANSACAO_ID = TRANSPARCELAS.TRANSACAO_ID)'
      'WHERE'
      '(TRANSACOES.COND_PAGTO = '#39'A PRAZO'#39')'
      'AND (TRANSPARCELAS.VALOR > 0)'
      'AND (TRANSPARCELAS.BANCO_ID = 0)'
      'ORDER BY FORNECEDORES.NOME, TRANSPARCELAS.DT_VENCIMENTO')
    Left = 104
    Top = 160
  end
  object Qrel: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      
        'SELECT FORNECEDORES.NOME, TRANSPARCELAS.*, TRANSACOES.HISTORICO,' +
        ' TRANSACOES.NUM_DOC, TRANSACOES.CONTA_ID, TRANSACOES.VENDEDOR_ID' +
        ', TRANSACOES.EMPRESA_ID, TRANSACOES.TPCTB, TRANSACOES.C_CUSTO_ID' +
        ', TRANSACOES.FORNECEDOR_ID'
      'FROM FORNECEDORES'
      'INNER JOIN TRANSACOES'
      'ON (FORNECEDORES.FORNECEDOR_ID = TRANSACOES.FORNECEDOR_ID)'
      'INNER JOIN TRANSPARCELAS'
      'ON (TRANSACOES.TRANSACAO_ID = TRANSPARCELAS.TRANSACAO_ID)'
      'WHERE'
      '(TRANSACOES.COND_PAGTO = '#39'A PRAZO'#39')'
      'AND (TRANSPARCELAS.VALOR > 0)'
      'AND (TRANSPARCELAS.BANCO_ID = 0)'
      'ORDER BY FORNECEDORES.NOME, TRANSPARCELAS.DT_VENCIMENTO'
      '')
    Left = 40
    Top = 160
  end
  object table_temp: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 264
    Top = 152
  end
end
