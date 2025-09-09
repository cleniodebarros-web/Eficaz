object FrmEmite_Nota: TFrmEmite_Nota
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Dados Complementares da Nota Fiscal'
  ClientHeight = 411
  ClientWidth = 507
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 6
    Top = 9
    Width = 52
    Height = 13
    Alignment = taRightJustify
    Caption = 'Data Sa'#237'da'
  end
  object Label4: TLabel
    Left = 214
    Top = 9
    Width = 44
    Height = 13
    Alignment = taRightJustify
    Caption = 'Hr. Sa'#237'da'
  end
  object Label2: TLabel
    Left = 384
    Top = 9
    Width = 28
    Height = 13
    Alignment = taRightJustify
    Caption = 'CFOP'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label33: TLabel
    Left = 6
    Top = 35
    Width = 72
    Height = 13
    Caption = 'Nome/R. Social'
  end
  object Label36: TLabel
    Left = 6
    Top = 61
    Width = 48
    Height = 13
    Caption = 'CNPJ/CPF'
  end
  object Label34: TLabel
    Left = 6
    Top = 87
    Width = 61
    Height = 13
    Caption = 'Placa Ve'#237'culo'
  end
  object Label35: TLabel
    Left = 214
    Top = 87
    Width = 13
    Height = 13
    Caption = 'UF'
  end
  object Label37: TLabel
    Left = 6
    Top = 113
    Width = 45
    Height = 13
    Caption = 'Endere'#231'o'
  end
  object Label38: TLabel
    Left = 6
    Top = 139
    Width = 43
    Height = 13
    Caption = 'Munic'#237'pio'
  end
  object Label39: TLabel
    Left = 214
    Top = 139
    Width = 13
    Height = 13
    Caption = 'UF'
  end
  object Label40: TLabel
    Left = 343
    Top = 139
    Width = 46
    Height = 13
    Caption = 'Insc. Est.'
  end
  object Label41: TLabel
    Left = 6
    Top = 165
    Width = 56
    Height = 13
    Caption = 'Quantidade'
  end
  object Label42: TLabel
    Left = 6
    Top = 191
    Width = 36
    Height = 13
    Caption = 'Esp'#233'cie'
  end
  object Label43: TLabel
    Left = 214
    Top = 191
    Width = 29
    Height = 13
    Caption = 'Marca'
  end
  object Label44: TLabel
    Left = 383
    Top = 191
    Width = 37
    Height = 13
    Caption = 'N'#250'mero'
  end
  object Label45: TLabel
    Left = 6
    Top = 217
    Width = 52
    Height = 13
    Caption = 'Peso Bruto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label46: TLabel
    Left = 214
    Top = 217
    Width = 59
    Height = 13
    Caption = 'Peso L'#237'quido'
  end
  object Label1: TLabel
    Left = 6
    Top = 243
    Width = 68
    Height = 13
    Caption = 'Inf. Adicionais'
  end
  object Bevel2: TBevel
    Left = 6
    Top = 357
    Width = 495
    Height = 4
    Shape = bsTopLine
  end
  object btnExecuta: TButton
    Left = 346
    Top = 373
    Width = 75
    Height = 25
    Caption = '&Imprimir'
    TabOrder = 20
    OnClick = btnExecutaClick
  end
  object DT_SAIDA: TDateEdit
    Left = 90
    Top = 6
    Width = 90
    Height = 21
    CheckOnExit = True
    DialogTitle = 'Selecione a Data'
    NumGlyphs = 2
    TabOrder = 0
    OnEnter = DT_SAIDAEnter
    OnKeyDown = DT_SAIDAKeyDown
  end
  object HR_SAIDA: TMaskEdit
    Left = 280
    Top = 6
    Width = 49
    Height = 21
    EditMask = '99:99'
    MaxLength = 5
    TabOrder = 1
    Text = '  :  '
    OnKeyDown = DT_SAIDAKeyDown
  end
  object CFOP_COMPL: TEdit
    Left = 426
    Top = 6
    Width = 75
    Height = 21
    MaxLength = 4
    TabOrder = 2
    OnExit = CFOP_COMPLExit
    OnKeyDown = DT_SAIDAKeyDown
  end
  object NOME_TRANSPORTADOR: TEdit
    Left = 90
    Top = 32
    Width = 271
    Height = 21
    MaxLength = 50
    TabOrder = 3
    OnKeyDown = DT_SAIDAKeyDown
  end
  object PLACA_VEICULO: TEdit
    Left = 90
    Top = 84
    Width = 73
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 7
    TabOrder = 6
    OnKeyDown = DT_SAIDAKeyDown
  end
  object ENDERECO_TRANSPORTADOR: TEdit
    Left = 90
    Top = 110
    Width = 380
    Height = 21
    MaxLength = 40
    TabOrder = 8
    OnKeyDown = DT_SAIDAKeyDown
  end
  object MUNICIPIO_TRANSPORTADOR: TEdit
    Left = 90
    Top = 136
    Width = 111
    Height = 21
    MaxLength = 30
    TabOrder = 9
    OnKeyDown = DT_SAIDAKeyDown
  end
  object INSCRICAO_TRANSPORTADOR: TEdit
    Left = 395
    Top = 136
    Width = 106
    Height = 21
    MaxLength = 15
    TabOrder = 11
    OnKeyDown = DT_SAIDAKeyDown
  end
  object PESO_BRUTO: TRxCalcEdit
    Left = 90
    Top = 214
    Width = 95
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    DisplayFormat = '0.00;-0.00'
    MaxValue = 99999.000000000000000000
    NumGlyphs = 2
    TabOrder = 16
    ZeroEmpty = False
    OnKeyDown = CNPJ_TRANSPORTADORKeyDown
  end
  object PESO_LIQUIDO: TRxCalcEdit
    Left = 280
    Top = 214
    Width = 95
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    DisplayFormat = '0.00;-0.00'
    MaxValue = 99999.000000000000000000
    NumGlyphs = 2
    TabOrder = 17
    ZeroEmpty = False
    OnKeyDown = CNPJ_TRANSPORTADORKeyDown
  end
  object QUANTIDADE_VOLUMES: TCurrencyEdit
    Left = 90
    Top = 162
    Width = 73
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 12
    ZeroEmpty = False
    OnKeyDown = CNPJ_TRANSPORTADORKeyDown
  end
  object UF_VEICULO: TComboBox
    Left = 280
    Top = 83
    Width = 56
    Height = 21
    CharCase = ecUpperCase
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 2
    ParentFont = False
    TabOrder = 7
    OnKeyDown = CNPJ_TRANSPORTADORKeyDown
    Items.Strings = (
      'AC'
      'AL'
      'AP'
      'AM'
      'BA'
      'CE'
      'DF'
      'ES'
      'GO'
      'MA'
      'MG'
      'MT'
      'MS'
      'PA'
      'PB'
      'PR'
      'PE'
      'PI'
      'RJ'
      'RN'
      'RS'
      'RO'
      'RR'
      'SC'
      'SP'
      'SE'
      'TO')
  end
  object UF_TRANSPORTADOR: TComboBox
    Left = 280
    Top = 136
    Width = 56
    Height = 21
    CharCase = ecUpperCase
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 2
    ParentFont = False
    TabOrder = 10
    OnKeyDown = CNPJ_TRANSPORTADORKeyDown
    Items.Strings = (
      'AC'
      'AL'
      'AP'
      'AM'
      'BA'
      'CE'
      'DF'
      'ES'
      'GO'
      'MA'
      'MG'
      'MT'
      'MS'
      'PA'
      'PB'
      'PR'
      'PE'
      'PI'
      'RJ'
      'RN'
      'RS'
      'RO'
      'RR'
      'SC'
      'SP'
      'SE'
      'TO')
  end
  object ESPECIE_VOLUMES: TEdit
    Left = 90
    Top = 188
    Width = 111
    Height = 21
    MaxLength = 20
    TabOrder = 13
    OnKeyDown = DT_SAIDAKeyDown
  end
  object MARCA_VOLUMES: TEdit
    Left = 280
    Top = 188
    Width = 73
    Height = 21
    MaxLength = 20
    TabOrder = 14
    OnKeyDown = DT_SAIDAKeyDown
  end
  object NUMERO_VOLUMES: TEdit
    Left = 425
    Top = 188
    Width = 76
    Height = 21
    MaxLength = 20
    TabOrder = 15
    OnKeyDown = DT_SAIDAKeyDown
  end
  object INSTRUCOES: TMemo
    Left = 88
    Top = 236
    Width = 411
    Height = 65
    ScrollBars = ssVertical
    TabOrder = 18
  end
  object TRANSACAO_ID: TCurrencyEdit
    Left = 57
    Top = 330
    Width = 73
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 22
    Visible = False
    ZeroEmpty = False
    OnKeyDown = CNPJ_TRANSPORTADORKeyDown
  end
  object NO_DOC_FISCAL: TCurrencyEdit
    Left = 137
    Top = 330
    Width = 73
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 23
    Visible = False
    ZeroEmpty = False
    OnKeyDown = CNPJ_TRANSPORTADORKeyDown
  end
  object CNPJ_TRANSPORTADOR: TEdit
    Left = 90
    Top = 58
    Width = 119
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 14
    TabOrder = 5
    OnKeyDown = DT_SAIDAKeyDown
  end
  object RESP_FRETE: TRadioGroup
    Left = 381
    Top = 35
    Width = 120
    Height = 55
    Caption = 'Frete por Conta'
    Items.Strings = (
      'Emitente'
      'Destinat'#225'rio')
    TabOrder = 4
    OnClick = RESP_FRETEClick
  end
  object Imprimir_Emitente: TCheckBox
    Left = 6
    Top = 321
    Width = 156
    Height = 17
    Caption = 'Impr. Raz'#227'o Social Emitente'
    TabOrder = 19
    OnKeyDown = DT_SAIDAKeyDown
  end
  object btnRetorna: TBitBtn
    Left = 426
    Top = 373
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
    TabOrder = 21
  end
  object Empresa_id: TCurrencyEdit
    Left = 57
    Top = 355
    Width = 73
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 24
    Visible = False
    ZeroEmpty = False
    OnKeyDown = CNPJ_TRANSPORTADORKeyDown
  end
  object IQuery: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 280
    Top = 272
  end
  object QTabela: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 248
    Top = 272
  end
  object QCfop: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM CFOP'
      'WHERE'
      '(COD_CFOP = :COD_CFOP)')
    Left = 216
    Top = 272
    ParamData = <
      item
        Name = 'COD_CFOP'
        ParamType = ptInput
      end>
  end
  object QProdutos: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 184
    Top = 272
  end
  object QParceiro: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 144
    Top = 272
  end
  object QNatOper: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 104
    Top = 272
  end
  object QTransacao: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 72
    Top = 272
  end
  object QItens: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 40
    Top = 272
  end
  object QConfig_Nfiscal: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 8
    Top = 272
  end
end
