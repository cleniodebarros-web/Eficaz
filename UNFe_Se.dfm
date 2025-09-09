object FrmNFe_Se: TFrmNFe_Se
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Dados Complementares da Nota Fiscal de Servi'#231'os'
  ClientHeight = 495
  ClientWidth = 511
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = Menu_GeraXML
  Position = poScreenCenter
  OnCreate = FormCreate
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
    Left = 199
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
    Left = 169
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
    Font.Name = 'Tahoma'
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
    Top = 435
    Width = 495
    Height = 4
    Shape = bsTopLine
  end
  object Label5: TLabel
    Left = 6
    Top = 347
    Width = 71
    Height = 13
    Caption = 'Forma Emiss'#227'o'
  end
  object Label6: TLabel
    Left = 6
    Top = 373
    Width = 59
    Height = 13
    Caption = 'Fin. Emiss'#227'o'
  end
  object btnFornecedor: TSpeedButton
    Left = 214
    Top = 58
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
  object Label7: TLabel
    Left = 214
    Top = 321
    Width = 51
    Height = 13
    Caption = 'Local Emb.'
  end
  object Label8: TLabel
    Left = 6
    Top = 321
    Width = 64
    Height = 13
    Caption = 'UF Embarque'
  end
  object Label9: TLabel
    Left = 6
    Top = 401
    Width = 58
    Height = 13
    Caption = 'Cod. Pagto.'
  end
  object Label10: TLabel
    Left = 6
    Top = 291
    Width = 79
    Height = 13
    Caption = 'Inf. Adicionais II'
  end
  object Label11: TLabel
    Left = 255
    Top = 86
    Width = 22
    Height = 13
    Caption = 'Rntc'
  end
  object btnGera: TButton
    Left = 345
    Top = 451
    Width = 75
    Height = 25
    Caption = '&Gerar NFe'
    TabOrder = 29
    OnClick = btnGeraClick
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
    OnExit = DT_SAIDAExit
    OnKeyDown = DT_SAIDAKeyDown
  end
  object HR_SAIDA: TMaskEdit
    Left = 265
    Top = 6
    Width = 56
    Height = 21
    EditMask = '99:99:99;1;_'
    MaxLength = 8
    TabOrder = 1
    Text = '  :  :  '
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
    Width = 283
    Height = 21
    MaxLength = 50
    TabOrder = 3
    OnKeyDown = DT_SAIDAKeyDown
  end
  object PLACA_VEICULO: TEdit
    Left = 90
    Top = 83
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
    Width = 283
    Height = 21
    MaxLength = 40
    TabOrder = 9
    OnKeyDown = DT_SAIDAKeyDown
  end
  object MUNICIPIO_TRANSPORTADOR: TEdit
    Left = 90
    Top = 136
    Width = 111
    Height = 21
    MaxLength = 30
    TabOrder = 10
    OnKeyDown = DT_SAIDAKeyDown
  end
  object INSCRICAO_TRANSPORTADOR: TEdit
    Left = 395
    Top = 136
    Width = 106
    Height = 21
    MaxLength = 15
    TabOrder = 12
    OnKeyDown = DT_SAIDAKeyDown
  end
  object PESO_BRUTO: TRxCalcEdit
    Left = 90
    Top = 213
    Width = 95
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    DecimalPlaces = 4
    DisplayFormat = '0.0000;-0.0000'
    NumGlyphs = 2
    TabOrder = 17
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
    DecimalPlaces = 4
    DisplayFormat = '0.0000;-0.0000'
    NumGlyphs = 2
    TabOrder = 18
    ZeroEmpty = False
    OnKeyDown = CNPJ_TRANSPORTADORKeyDown
  end
  object QUANTIDADE_VOLUMES: TCurrencyEdit
    Left = 90
    Top = 161
    Width = 73
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 13
    ZeroEmpty = False
    OnKeyDown = CNPJ_TRANSPORTADORKeyDown
  end
  object UF_VEICULO: TComboBox
    Left = 188
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
    TabOrder = 11
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
    TabOrder = 14
    OnKeyDown = DT_SAIDAKeyDown
  end
  object MARCA_VOLUMES: TEdit
    Left = 280
    Top = 188
    Width = 73
    Height = 21
    MaxLength = 20
    TabOrder = 15
    OnKeyDown = DT_SAIDAKeyDown
  end
  object NUMERO_VOLUMES: TEdit
    Left = 425
    Top = 188
    Width = 76
    Height = 21
    MaxLength = 20
    TabOrder = 16
    OnKeyDown = DT_SAIDAKeyDown
  end
  object INSTRUCOES: TMemo
    Left = 90
    Top = 241
    Width = 411
    Height = 48
    MaxLength = 2000
    ScrollBars = ssVertical
    TabOrder = 19
  end
  object TRANSACAO_ID: TCurrencyEdit
    Left = 9
    Top = 428
    Width = 73
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 27
    Visible = False
    ZeroEmpty = False
    OnKeyDown = CNPJ_TRANSPORTADORKeyDown
  end
  object NO_DOC_FISCAL: TCurrencyEdit
    Left = 395
    Top = 347
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
    Left = 379
    Top = 32
    Width = 120
    Height = 101
    Caption = 'Frete por Conta'
    ItemIndex = 3
    Items.Strings = (
      'Emitente'
      'Destinat'#225'rio'
      'Terceiros'
      'Sem Frete')
    TabOrder = 4
    OnClick = RESP_FRETEClick
  end
  object FORMA_EMISSAO: TComboBox
    Left = 90
    Top = 343
    Width = 285
    Height = 21
    CharCase = ecUpperCase
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 25
    ParentFont = False
    TabOrder = 23
    OnKeyDown = CNPJ_TRANSPORTADORKeyDown
    Items.Strings = (
      'NORMAL'
      'CONTING'#202'NCIA FS'
      'CONTING'#202'NCIA C/ SVCAN'
      'CONTING'#202'NCIA VIA DPEC'
      'CONTING'#202'NCIA FS-DA')
  end
  object FINALIDADE_EMISSAO: TComboBox
    Left = 90
    Top = 370
    Width = 285
    Height = 21
    CharCase = ecUpperCase
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 25
    ParentFont = False
    TabOrder = 25
    OnKeyDown = CNPJ_TRANSPORTADORKeyDown
    Items.Strings = (
      '1-NFE NORMAL'
      '2-NFE COMPLEMENTAR'
      '3-NFE DE AJUSTE'
      '4-DEVOLU'#199#195'O/RETORNO')
  end
  object btnRetorna: TBitBtn
    Left = 426
    Top = 451
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
    TabOrder = 30
  end
  object LOCAL_EMBARQUE: TEdit
    Left = 280
    Top = 318
    Width = 219
    Height = 21
    MaxLength = 30
    TabOrder = 22
    OnKeyDown = DT_SAIDAKeyDown
  end
  object UF_EMBARQUE: TComboBox
    Left = 90
    Top = 319
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
    TabOrder = 21
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
  object COND_PAGTO: TComboBox
    Left = 90
    Top = 398
    Width = 111
    Height = 21
    CharCase = ecUpperCase
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 7
    ParentFont = False
    TabOrder = 26
    Text = 'A VISTA'
    OnKeyDown = CNPJ_TRANSPORTADORKeyDown
    Items.Strings = (
      'A VISTA'
      'A PRAZO'
      'CARTAO'
      'CHEQUE'
      'OUTROS'
      'NENHUM')
  end
  object Empresa_id: TCurrencyEdit
    Left = 208
    Top = 428
    Width = 73
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 28
    Visible = False
    ZeroEmpty = False
    OnKeyDown = CNPJ_TRANSPORTADORKeyDown
  end
  object INSTRUCOES_2: TMemo
    Left = 90
    Top = 292
    Width = 411
    Height = 24
    MaxLength = 5000
    ScrollBars = ssVertical
    TabOrder = 20
  end
  object RNTC: TEdit
    Left = 280
    Top = 83
    Width = 93
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 20
    TabOrder = 8
    OnKeyDown = DT_SAIDAKeyDown
  end
  object Menu_GeraXML: TPopupMenu
    Left = 328
    Top = 430
    object GerarXML: TMenuItem
      Caption = 'Gerar XML'
      OnClick = GerarXMLClick
    end
  end
  object QConfig_nfiscal: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Top = 432
  end
  object QTransacao: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 32
    Top = 432
  end
  object QNatoper: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 64
    Top = 432
  end
  object QParceiro: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 104
    Top = 432
  end
  object QProdutos: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 136
    Top = 432
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
    Left = 168
    Top = 432
    ParamData = <
      item
        Name = 'COD_CFOP'
        ParamType = ptInput
      end>
  end
  object QTabela: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 200
    Top = 432
  end
  object FDQuery2: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 232
    Top = 432
  end
  object IQuery: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 264
    Top = 432
  end
  object QDetalhe_Import: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 296
    Top = 432
  end
  object QItens: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 120
    Top = 464
  end
  object QDetalhe: TFDQuery
    MasterFields = 'object QRel: TFDQuery'
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 88
    Top = 464
  end
  object QOrigem: TFDQuery
    MasterFields = 'object QRel: TFDQuery'
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 48
    Top = 464
  end
  object QParcelas: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Top = 464
  end
  object QNotas: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM TRANSITENS_NOTAS'
      'WHERE'
      '(TRANSACAO_ID = :TRANSACAO_ID)'
      'ORDER BY DT_EMISSAO, NUM_DOC')
    Left = 159
    Top = 465
    ParamData = <
      item
        Name = 'TRANSACAO_ID'
        ParamType = ptInput
      end>
  end
end
