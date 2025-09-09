object FrmTrans_Recebimento_Lote_Cartao: TFrmTrans_Recebimento_Lote_Cartao
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 
    'Trans. Mov. Financeira - Recebimento de Contas  p/ Lote Cart'#245'es ' +
    'de Cr'#233'dito'
  ClientHeight = 582
  ClientWidth = 1214
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
    Width = 1214
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 62
      Top = 15
      Width = 36
      Height = 13
      Caption = 'Per'#237'odo'
    end
    object Label2: TLabel
      Left = 1051
      Top = 18
      Width = 33
      Height = 13
      Caption = 'Cliente'
    end
    object btnCliente: TSpeedButton
      Left = 1146
      Top = 14
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
    object Label8: TLabel
      Left = 312
      Top = 14
      Width = 46
      Height = 13
      Caption = 'Esp. Doc.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object Label4: TLabel
      Left = 554
      Top = 22
      Width = 24
      Height = 13
      Caption = 'Valor'
      Visible = False
    end
    object Label9: TLabel
      Left = 394
      Top = 22
      Width = 65
      Height = 13
      Caption = 'C'#243'd. Cont'#225'bil'
      Visible = False
    end
    object Label18: TLabel
      Left = 688
      Top = 18
      Width = 57
      Height = 13
      Caption = 'Finalizadora'
    end
    object Label19: TLabel
      Left = 891
      Top = 18
      Width = 56
      Height = 13
      Caption = 'Tipo Cart'#227'o'
    end
    object Dtmen: TDateEdit
      Left = 104
      Top = 11
      Width = 90
      Height = 21
      CheckOnExit = True
      DialogTitle = 'Selecione a Data'
      NumGlyphs = 2
      StartOfWeek = Sun
      TabOrder = 0
      OnEnter = DtmenEnter
      OnKeyDown = DtmenKeyDown
    end
    object Dtmai: TDateEdit
      Left = 216
      Top = 11
      Width = 90
      Height = 21
      CheckOnExit = True
      DialogTitle = 'Selecione a Data'
      NumGlyphs = 2
      StartOfWeek = Sun
      TabOrder = 1
      OnEnter = DtmenEnter
      OnKeyDown = DtmenKeyDown
    end
    object Cliente: TCurrencyEdit
      Left = 1090
      Top = 14
      Width = 55
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = '0;-0'
      TabOrder = 6
      ZeroEmpty = False
      OnExit = ClienteExit
      OnKeyDown = ClienteKeyDown
    end
    object Especie: TComboBox
      Left = 356
      Top = 14
      Width = 132
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 20
      ParentFont = False
      TabOrder = 5
      Visible = False
      OnKeyDown = ClienteKeyDown
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
    object Valor: TRxCalcEdit
      Left = 466
      Top = -5
      Width = 114
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
      NumGlyphs = 2
      TabOrder = 8
      Visible = False
      ZeroEmpty = False
      OnKeyDown = ClienteKeyDown
    end
    object Cod_Contabil: TEdit
      Left = 422
      Top = 14
      Width = 121
      Height = 21
      MaxLength = 20
      TabOrder = 7
      Visible = False
      OnKeyDown = DtmenKeyDown
    end
    object Chk_Perdas: TCheckBox
      Left = 10
      Top = 0
      Width = 132
      Height = 17
      Caption = 'Exibir Perdas(inativos)'
      TabOrder = 9
      Visible = False
      OnClick = Chk_PerdasClick
    end
    object Finalizadora: TDBLookupComboBox
      Left = 751
      Top = 14
      Width = 134
      Height = 21
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      KeyField = 'Finalizadora_ID'
      ListField = 'Legenda'
      ListSource = dataconsfinalizadora
      ParentFont = False
      TabOrder = 3
    end
    object tp_cartao: TComboBox
      Left = 953
      Top = 14
      Width = 92
      Height = 21
      TabOrder = 4
      Items.Strings = (
        ''
        'DEBITO'
        'CREDITO')
    end
    object chk_finalizadora: TCheckBox
      Left = 568
      Top = 17
      Width = 114
      Height = 17
      Caption = 'Filtro Finalizadora'
      TabOrder = 2
      OnClick = chk_finalizadoraClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 524
    Width = 1214
    Height = 58
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 7
    object Label3: TLabel
      Left = 10
      Top = 6
      Width = 29
      Height = 13
      Caption = 'Total'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label27: TLabel
      Left = 602
      Top = 9
      Width = 47
      Height = 13
      Caption = 'Vr. Quitar'
    end
    object btnCaixa: TSpeedButton
      Left = 714
      Top = 30
      Width = 54
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
      OnClick = btnCaixaClick
    end
    object Label5: TLabel
      Left = 602
      Top = 33
      Width = 50
      Height = 13
      Caption = 'Cx./Banco'
    end
    object Label6: TLabel
      Left = 10
      Top = 34
      Width = 98
      Height = 13
      Caption = 'Despesas / Multa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label7: TLabel
      Left = 331
      Top = 6
      Width = 157
      Height = 13
      Caption = 'Vr. Total -Valor Taxa Admin.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 429
      Top = 33
      Width = 59
      Height = 13
      Caption = 'Tx. Admin.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 226
      Top = 8
      Width = 24
      Height = 13
      Caption = 'Dias'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label15: TLabel
      Left = 224
      Top = 35
      Width = 32
      Height = 13
      Caption = 'Multa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label16: TLabel
      Left = 768
      Top = 9
      Width = 32
      Height = 13
      Caption = 'Pagto.'
      Visible = False
    end
    object Label17: TLabel
      Left = 769
      Top = 35
      Width = 40
      Height = 13
      Caption = 'Cta. J/D'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object btnConta: TSpeedButton
      Left = 852
      Top = 31
      Width = 61
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
      OnClick = btnContaClick
    end
    object btnExecuta: TButton
      Left = 919
      Top = 6
      Width = 85
      Height = 25
      Caption = '&OK'
      TabOrder = 4
      OnClick = btnExecutaClick
    end
    object btnRetorna: TButton
      Left = 1123
      Top = 6
      Width = 85
      Height = 25
      Caption = '&Retorna'
      TabOrder = 6
      OnClick = btnRetornaClick
    end
    object btnSoma: TButton
      Left = 1021
      Top = 6
      Width = 85
      Height = 25
      Caption = 'Soma'
      TabOrder = 5
      OnClick = btnSomaClick
    end
    object Vr_Quitar: TRxCalcEdit
      Left = 656
      Top = 6
      Width = 102
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
      Enabled = False
      NumGlyphs = 2
      TabOrder = 2
      ZeroEmpty = False
      OnExit = Vr_QuitarExit
      OnKeyDown = ClienteKeyDown
    end
    object Vr_Soma: TRxCalcEdit
      Left = 118
      Top = 6
      Width = 102
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
      OnKeyDown = ClienteKeyDown
    end
    object Caixa: TCurrencyEdit
      Left = 656
      Top = 30
      Width = 42
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = '0;-0'
      MaxValue = 999999.000000000000000000
      TabOrder = 11
      ZeroEmpty = False
      OnKeyDown = ClienteKeyDown
    end
    object Vr_Despesas: TRxCalcEdit
      Left = 118
      Top = 30
      Width = 102
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
      TabOrder = 7
      Visible = False
      ZeroEmpty = False
      OnKeyDown = ClienteKeyDown
    end
    object Vr_Total: TRxCalcEdit
      Left = 492
      Top = 6
      Width = 102
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
      TabOrder = 1
      ZeroEmpty = False
      OnKeyDown = ClienteKeyDown
    end
    object Vr_Tx_Adm: TRxCalcEdit
      Left = 492
      Top = 30
      Width = 102
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      NumGlyphs = 2
      ParentFont = False
      ReadOnly = True
      TabOrder = 10
      ZeroEmpty = False
      OnKeyDown = ClienteKeyDown
    end
    object Dias: TCurrencyEdit
      Left = 264
      Top = 5
      Width = 28
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = '0;-0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      MaxValue = 999999.000000000000000000
      ParentFont = False
      ReadOnly = True
      TabOrder = 9
      Visible = False
      ZeroEmpty = False
      OnKeyDown = ClienteKeyDown
    end
    object GroupBox1: TGroupBox
      Left = 919
      Top = 30
      Width = 291
      Height = 27
      BiDiMode = bdLeftToRight
      Caption = 'Legenda'
      ParentBiDiMode = False
      TabOrder = 12
      object Label12: TLabel
        Left = 123
        Top = 10
        Width = 42
        Height = 13
        Caption = 'Vencidas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 204
        Top = 10
        Width = 43
        Height = 13
        Caption = 'A Vencer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label14: TLabel
        Left = 33
        Top = 10
        Width = 54
        Height = 13
        Caption = 'Vence Hoje'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
    end
    object Vr_Multa: TRxCalcEdit
      Left = 264
      Top = 30
      Width = 102
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      NumGlyphs = 2
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
      Visible = False
      ZeroEmpty = False
      OnKeyDown = ClienteKeyDown
    end
    object FINALIZADORA_ID: TDBLookupComboBox
      Left = 803
      Top = 6
      Width = 104
      Height = 21
      Enabled = False
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
      Visible = False
    end
    object CONTA_ID: TCurrencyEdit
      Left = 816
      Top = 31
      Width = 35
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = '0;-0'
      TabOrder = 13
      ZeroEmpty = False
      OnExit = CONTA_IDExit
      OnKeyDown = CONTA_IDKeyDown
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 1214
    Height = 443
    Align = alClient
    Color = clInfoBk
    DataSource = DataContas
    Font.Charset = ANSI_CHARSET
    Font.Color = clAqua
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentFont = False
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clBlue
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Nome'
        Width = 296
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HISTORICO'
        Title.Caption = 'Hist'#243'rico'
        Width = 274
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESPECIE'
        Title.Caption = 'Tipo Doc.'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DUPLICATA'
        Title.Caption = 'N'#250'm. Doc.'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PARCELA_ID'
        Title.Caption = 'Parcela'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_VENCIMENTO'
        Title.Caption = 'Dt. Venc.'
        Width = 70
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'VALOR'
        Title.Alignment = taRightJustify
        Title.Caption = 'Valor'
        Width = 90
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'VALOR_DESPESAS'
        Title.Alignment = taRightJustify
        Title.Caption = 'Vr. Despesas'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'TX_ADM'
        Title.Alignment = taRightJustify
        Title.Caption = 'Tx. Adm.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_TX_ADM'
        Title.Alignment = taRightJustify
        Title.Caption = 'Valor Tx. Adm.'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_TOTAL'
        Title.Alignment = taRightJustify
        Title.Caption = 'Total'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_VENC_ORI'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'VALOR_ORI'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'TIPO_TRANSACAO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PERDA'
        Visible = False
      end>
  end
  object Alfabeto: TTabSet
    Left = 0
    Top = 503
    Width = 1214
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
  object Recibo: TQuickRep
    Left = 382
    Top = 800
    Width = 794
    Height = 1123
    DataSet = Qcontas
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Continuous = False
    Page.Values = (
      127.000000000000000000
      2970.000000000000000000
      127.000000000000000000
      2100.000000000000000000
      127.000000000000000000
      127.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.OutputBin = Auto
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 0
    PrinterSettings.ExtendedDuplex = 0
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 0
    PrinterSettings.PrintMetaFile = False
    PrinterSettings.PrintQuality = 0
    PrinterSettings.Collate = 0
    PrinterSettings.ColorOption = 0
    PrintIfEmpty = True
    ReportTitle = 'Recibo'
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsMaximized
    PreviewWidth = 500
    PreviewHeight = 500
    PrevInitialZoom = qrZoomToWidth
    PreviewDefaultSaveType = stQRP
    PreviewLeft = 0
    PreviewTop = 0
    object DetailBand1: TQRBand
      Left = 48
      Top = 48
      Width = 698
      Height = 523
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        1383.770833333333000000
        1846.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object QRLabel3: TQRLabel
        Left = 244
        Top = 17
        Width = 210
        Height = 23
        Size.Values = (
          60.854166666666670000
          645.583333333333300000
          44.979166666666670000
          555.625000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = True
        Caption = '*** R E C I B O ***'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 14
      end
      object QRShape1: TQRShape
        Left = 0
        Top = 2
        Width = 166
        Height = 45
        Size.Values = (
          119.062500000000000000
          0.000000000000000000
          5.291666666666667000
          439.208333333333300000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel1: TQRLabel
        Left = 4
        Top = 13
        Width = 34
        Height = 23
        Size.Values = (
          60.854166666666670000
          10.583333333333330000
          34.395833333333330000
          89.958333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'N'#186':'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 14
      end
      object QRShape2: TQRShape
        Left = 532
        Top = 2
        Width = 166
        Height = 45
        Size.Values = (
          119.062500000000000000
          1407.583333333333000000
          5.291666666666667000
          439.208333333333300000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel2: TQRLabel
        Left = 536
        Top = 13
        Width = 67
        Height = 23
        Size.Values = (
          60.854166666666670000
          1418.166666666667000000
          34.395833333333330000
          177.270833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Valor:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 14
      end
      object QRLabel4: TQRLabel
        Left = 2
        Top = 88
        Width = 92
        Height = 15
        Size.Values = (
          39.687500000000000000
          5.291666666666667000
          232.833333333333300000
          243.416666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Recebemos de:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel5: TQRLabel
        Left = 2
        Top = 105
        Width = 64
        Height = 15
        Size.Values = (
          39.687500000000000000
          5.291666666666667000
          277.812500000000000000
          169.333333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Endere'#231'o:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel6: TQRLabel
        Left = 2
        Top = 122
        Width = 120
        Height = 15
        Size.Values = (
          39.687500000000000000
          5.291666666666667000
          322.791666666666700000
          317.500000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'A import'#226'ncia de:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel7: TQRLabel
        Left = 2
        Top = 156
        Width = 71
        Height = 15
        Size.Values = (
          39.687500000000000000
          5.291666666666667000
          412.750000000000000000
          187.854166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Referente:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape3: TQRShape
        Left = 0
        Top = 48
        Width = 698
        Height = 4
        Size.Values = (
          10.583333333333330000
          0.000000000000000000
          127.000000000000000000
          1846.791666666667000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRDBText3: TQRDBText
        Left = 132
        Top = 88
        Width = 29
        Height = 17
        Size.Values = (
          44.979166666666670000
          349.250000000000000000
          232.833333333333300000
          76.729166666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QCliente
        DataField = 'NOME'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel8: TQRLabel
        Left = 132
        Top = 122
        Width = 120
        Height = 15
        Size.Values = (
          39.687500000000000000
          349.250000000000000000
          322.791666666666700000
          317.500000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'A import'#226'ncia de:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel9: TQRLabel
        Left = 2
        Top = 207
        Width = 267
        Height = 15
        Size.Values = (
          39.687500000000000000
          5.291666666666667000
          547.687500000000000000
          706.437500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Para maior clareza firmamos o presente'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel10: TQRLabel
        Left = 2
        Top = 241
        Width = 232
        Height = 15
        Size.Values = (
          39.687500000000000000
          5.291666666666667000
          637.645833333333300000
          613.833333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Pirapora(MG), 21 de Abril de 2010'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel11: TQRLabel
        Left = 2
        Top = 377
        Width = 78
        Height = 15
        Size.Values = (
          39.687500000000000000
          5.291666666666667000
          997.479166666666700000
          206.375000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Assinatura:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel13: TQRLabel
        Left = 2
        Top = 326
        Width = 64
        Height = 15
        Size.Values = (
          39.687500000000000000
          5.291666666666667000
          862.541666666666700000
          169.333333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Endere'#231'o:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText7: TQRDBText
        Left = 84
        Top = 309
        Width = 29
        Height = 17
        Size.Values = (
          44.979166666666670000
          222.250000000000000000
          817.562500000000000000
          76.729166666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = FrmPrincipal.QEmpresa
        DataField = 'CNPJ'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel14: TQRLabel
        Left = 2
        Top = 309
        Width = 36
        Height = 15
        Size.Values = (
          39.687500000000000000
          5.291666666666667000
          817.562500000000000000
          95.250000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'CNPJ:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText8: TQRDBText
        Left = 84
        Top = 292
        Width = 36
        Height = 17
        Size.Values = (
          44.979166666666670000
          222.250000000000000000
          772.583333333333300000
          95.250000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = FrmPrincipal.QEmpresa
        DataField = 'RAZAO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel15: TQRLabel
        Left = 2
        Top = 292
        Width = 64
        Height = 15
        Size.Values = (
          39.687500000000000000
          5.291666666666667000
          772.583333333333300000
          169.333333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Emitente:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel16: TQRLabel
        Left = 92
        Top = 377
        Width = 491
        Height = 15
        Size.Values = (
          39.687500000000000000
          243.416666666666700000
          997.479166666666700000
          1299.104166666667000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          '________________________________________________________________' +
          '______'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel12: TQRLabel
        Left = 132
        Top = 105
        Width = 64
        Height = 15
        Size.Values = (
          39.687500000000000000
          349.250000000000000000
          277.812500000000000000
          169.333333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Endere'#231'o:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel17: TQRLabel
        Left = 84
        Top = 326
        Width = 64
        Height = 15
        Size.Values = (
          39.687500000000000000
          222.250000000000000000
          862.541666666666700000
          169.333333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Endere'#231'o:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel18: TQRLabel
        Left = 132
        Top = 156
        Width = 550
        Height = 45
        Size.Values = (
          119.062500000000000000
          349.250000000000000000
          412.750000000000000000
          1455.208333333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Referente:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel27: TQRLabel
        Left = 238
        Top = 432
        Width = 222
        Height = 34
        Size.Values = (
          89.958333333333330000
          629.708333333333300000
          1143.000000000000000000
          587.375000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = True
        Caption = 'SALDO DEVEDOR'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -29
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 22
      end
      object QRLabel19: TQRLabel
        Left = 304
        Top = 469
        Width = 89
        Height = 22
        Size.Values = (
          58.208333333333330000
          804.333333333333300000
          1240.895833333333000000
          235.479166666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Per'#237'odo:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 14
      end
    end
    object QRBand3: TQRBand
      Left = 48
      Top = 571
      Width = 698
      Height = 18
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        47.625000000000000000
        1846.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRDBText11: TQRDBText
        Left = 127
        Top = 2
        Width = 220
        Height = 15
        Size.Values = (
          39.687500000000000000
          336.020833333333300000
          5.291666666666667000
          582.083333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = Qcontas
        DataField = 'HISTORICO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText12: TQRDBText
        Left = 2
        Top = 1
        Width = 92
        Height = 15
        Size.Values = (
          39.687500000000000000
          5.291666666666667000
          2.645833333333333000
          243.416666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = Qcontas
        DataField = 'DT_VENCIMENTO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText13: TQRDBText
        Left = 353
        Top = 2
        Width = 50
        Height = 15
        Size.Values = (
          39.687500000000000000
          933.979166666666700000
          5.291666666666667000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = Qcontas
        DataField = 'NUM_DOC'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText14: TQRDBText
        Left = 449
        Top = 1
        Width = 71
        Height = 15
        Size.Values = (
          39.687500000000000000
          1187.979166666667000000
          2.645833333333333000
          187.854166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = Qcontas
        DataField = 'PARCELA_ID'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText16: TQRDBText
        Left = 553
        Top = 1
        Width = 64
        Height = 15
        Size.Values = (
          39.687500000000000000
          1463.145833333333000000
          2.645833333333333000
          169.333333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = Qcontas
        DataField = 'DUPLICATA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText17: TQRDBText
        Left = 625
        Top = 1
        Width = 73
        Height = 15
        Size.Values = (
          39.687500000000000000
          1653.645833333333000000
          2.645833333333333000
          193.145833333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = Qcontas
        DataField = 'VALOR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Mask = '#,##0.00'
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
    end
    object QRShape4: TQRShape
      Left = 48
      Top = 543
      Width = 698
      Height = 4
      Size.Values = (
        10.583333333333330000
        127.000000000000000000
        1436.687500000000000000
        1846.791666666667000000)
      XLColumn = 0
      Shape = qrsHorLine
      VertAdjust = 0
    end
    object QRLabel20: TQRLabel
      Left = 50
      Top = 549
      Width = 78
      Height = 15
      Size.Values = (
        39.687500000000000000
        132.291666666666700000
        1452.562500000000000000
        206.375000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Dt. Vencim.'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel24: TQRLabel
      Left = 175
      Top = 549
      Width = 64
      Height = 15
      Size.Values = (
        39.687500000000000000
        463.020833333333300000
        1452.562500000000000000
        169.333333333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Hist'#243'rico'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel21: TQRLabel
      Left = 401
      Top = 549
      Width = 64
      Height = 15
      Size.Values = (
        39.687500000000000000
        1060.979166666667000000
        1452.562500000000000000
        169.333333333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Num. Doc.'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel22: TQRLabel
      Left = 497
      Top = 549
      Width = 36
      Height = 15
      Size.Values = (
        39.687500000000000000
        1314.979166666667000000
        1452.562500000000000000
        95.250000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Parc.'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel25: TQRLabel
      Left = 601
      Top = 549
      Width = 64
      Height = 15
      Size.Values = (
        39.687500000000000000
        1590.145833333333000000
        1452.562500000000000000
        169.333333333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Ch./Dupl.'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel26: TQRLabel
      Left = 673
      Top = 549
      Width = 73
      Height = 15
      Size.Values = (
        39.687500000000000000
        1780.645833333333000000
        1452.562500000000000000
        193.145833333333300000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'Valor'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRShape5: TQRShape
      Left = 48
      Top = 566
      Width = 698
      Height = 4
      Size.Values = (
        10.583333333333330000
        127.000000000000000000
        1497.541666666667000000
        1846.791666666667000000)
      XLColumn = 0
      Shape = qrsHorLine
      VertAdjust = 0
    end
    object QRBand1: TQRBand
      Left = 48
      Top = 589
      Width = 698
      Height = 91
      Frame.DrawTop = True
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        240.770833333333300000
        1846.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRExpr1: TQRExpr
        Left = 625
        Top = 5
        Width = 73
        Height = 15
        Size.Values = (
          39.687500000000000000
          1653.645833333333000000
          13.229166666666670000
          193.145833333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Color = clWhite
        Master = Recibo
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'Sum(VALOR)'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel28: TQRLabel
        Left = 2
        Top = 5
        Width = 582
        Height = 17
        Size.Values = (
          44.979166666666670000
          5.291666666666667000
          13.229166666666670000
          1539.875000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          'Reconhe'#231'o a minha d'#237'vida no per'#237'odo de vencimento e valor inform' +
          'ado neste relat'#243'rio'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel29: TQRLabel
        Left = 2
        Top = 55
        Width = 78
        Height = 15
        Size.Values = (
          39.687500000000000000
          5.291666666666667000
          145.520833333333300000
          206.375000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Assinatura:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel30: TQRLabel
        Left = 92
        Top = 55
        Width = 491
        Height = 15
        Size.Values = (
          39.687500000000000000
          243.416666666666700000
          145.520833333333300000
          1299.104166666667000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          '________________________________________________________________' +
          '______'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText1: TQRDBText
        Left = 92
        Top = 74
        Width = 29
        Height = 15
        Size.Values = (
          39.687500000000000000
          243.416666666666700000
          195.791666666666700000
          76.729166666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataField = 'NOME'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
    end
  end
  object Aguarde: TPanel
    Left = 400
    Top = 229
    Width = 400
    Height = 49
    Caption = 'Aguarde...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -29
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    Visible = False
  end
  object Memo1: TMemo
    Left = 2
    Top = 305
    Width = 370
    Height = 177
    Lines.Strings = (
      '***CONTAS PARA AGRUPAMENTO***')
    TabOrder = 3
    Visible = False
  end
  object StatusBar1: TStatusBar
    Left = 372
    Top = 462
    Width = 847
    Height = 19
    Align = alNone
    Panels = <
      item
        Text = '<F7> - Excluir Agrupamento'
        Width = 420
      end
      item
        Text = '<F10> - Gravar Agrupamento'
        Width = 230
      end>
    Visible = False
  end
  object StatusBar2: TStatusBar
    Left = 0
    Top = 484
    Width = 1214
    Height = 19
    Panels = <
      item
        Text = '<F9> - Continua'
        Width = 500
      end
      item
        Text = 'Selecione as Parcelas ou Digite o Valor'
        Width = 256
      end>
  end
  object DataContas: TDataSource
    AutoEdit = False
    DataSet = Qcontas
    Left = 168
    Top = 251
  end
  object DataOrcamento: TDataSource
    DataSet = QOrcamento
    Left = 8
    Top = 259
  end
  object PopupMenu1: TPopupMenu
    Left = 56
    Top = 256
    object Consulta_Valores: TMenuItem
      Caption = 'Consultar valores originais da parcela'
      Enabled = False
      OnClick = Consulta_ValoresClick
    end
  end
  object DataFinalizadora: TDataSource
    DataSet = QFinalizadora
    Left = 267
    Top = 250
  end
  object DataConta: TDataSource
    DataSet = QConta
    Left = 96
    Top = 256
  end
  object IQuery: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      '')
    Left = 16
    Top = 392
  end
  object QOrcamento: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 64
    Top = 392
  end
  object QRel: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 112
    Top = 392
  end
  object QConta: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM TABELAS'
      'WHERE'
      '(TABELA_ID = :TABELA_ID)'
      'AND (TIPO_TABELA = '#39'4'#39')'
      'AND (NIVEL = '#39'ANAL'#205'TICA'#39')'
      'AND (STATUS = '#39'A'#39')')
    Left = 152
    Top = 392
    ParamData = <
      item
        Name = 'TABELA_ID'
        ParamType = ptInput
      end>
  end
  object QCliente: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM CLIENTES WHERE CLIENTE_ID = :CLIENTE_ID')
    Left = 208
    Top = 392
    ParamData = <
      item
        Name = 'CLIENTE_ID'
        ParamType = ptInput
      end>
  end
  object QSearch: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 264
    Top = 392
  end
  object QFinalizadora: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM FINALIZADORAS'
      'WHERE CLIENTE_ID >  0')
    Left = 328
    Top = 392
  end
  object Qcontas: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evItems, evRecsMax, evRowsetSize, evCache, evCursorKind, evAutoFetchAll]
    FetchOptions.CursorKind = ckDefault
    FetchOptions.RowsetSize = 1000
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      '')
    Left = 400
    Top = 392
  end
  object Fdac_Temp: TFDMemTable
    AfterOpen = Fdac_TempAfterOpen
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 256
    Top = 160
  end
  object Table_Temp_Agrupar: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 168
    Top = 161
  end
  object dataconsfinalizadora: TDataSource
    DataSet = QConsFinalizadora
    Left = 323
    Top = 250
  end
  object QConsFinalizadora: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM FINALIZADORAS'
      'WHERE CLIENTE_ID >  0')
    Left = 320
    Top = 328
  end
end
