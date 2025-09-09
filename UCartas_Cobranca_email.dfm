object FrmCartas_Cobranca_email: TFrmCartas_Cobranca_email
  Left = 51
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cartas de Cobran'#231'a por email'
  ClientHeight = 441
  ClientWidth = 1262
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDesigned
  Scaled = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 6
    Top = 9
    Width = 66
    Height = 13
    Caption = 'Per'#237'odo Venc.'
  end
  object Label3: TLabel
    Left = 276
    Top = 9
    Width = 65
    Height = 13
    Caption = 'Modelo E-mail'
  end
  object Label2: TLabel
    Left = 183
    Top = 35
    Width = 33
    Height = 13
    Caption = 'Cliente'
  end
  object Label5: TLabel
    Left = 8
    Top = 33
    Width = 31
    Height = 13
    Caption = 'Classe'
  end
  object Bevel1: TBevel
    Left = 7
    Top = 350
    Width = 1268
    Height = 5
    Shape = bsTopLine
  end
  object btnCliente: TSpeedButton
    Left = 326
    Top = 31
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
    Left = 396
    Top = 35
    Width = 339
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
  object ExAllBtn: TSpeedButton
    Left = 357
    Top = 236
    Width = 24
    Height = 24
    Caption = '<<'
    Enabled = False
    OnClick = ExAllBtnClick
  end
  object ExcludeBtn: TSpeedButton
    Left = 357
    Top = 184
    Width = 24
    Height = 24
    Caption = '<'
    Enabled = False
    OnClick = ExcludeBtnClick
  end
  object IncAllBtn: TSpeedButton
    Left = 357
    Top = 133
    Width = 24
    Height = 24
    Caption = '>>'
    Enabled = False
    OnClick = IncAllBtnClick
  end
  object IncludeBtn: TSpeedButton
    Left = 357
    Top = 82
    Width = 24
    Height = 24
    Caption = '>'
    Enabled = False
    OnClick = IncludeBtnClick
  end
  object Label4: TLabel
    Left = 8
    Top = 358
    Width = 61
    Height = 13
    Caption = 'Log de envio'
  end
  object Label6: TLabel
    Left = 6
    Top = 278
    Width = 98
    Height = 13
    Caption = 'Nome do Remetente'
  end
  object Label7: TLabel
    Left = 7
    Top = 302
    Width = 95
    Height = 13
    Caption = 'Email do Remetente'
  end
  object Label8: TLabel
    Left = 8
    Top = 331
    Width = 69
    Height = 13
    Caption = 'Servidor SMTP'
  end
  object Label9: TLabel
    Left = 650
    Top = 300
    Width = 26
    Height = 13
    Caption = 'Porta'
  end
  object Label10: TLabel
    Left = 368
    Top = 327
    Width = 75
    Height = 13
    Caption = 'Autentica'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label11: TLabel
    Left = 368
    Top = 273
    Width = 36
    Height = 13
    Caption = 'Usu'#225'rio'
  end
  object Label12: TLabel
    Left = 368
    Top = 302
    Width = 30
    Height = 13
    Caption = 'Senha'
  end
  object Label13: TLabel
    Left = 8
    Top = 499
    Width = 39
    Height = 13
    Caption = 'Assunto'
  end
  object Dtmen: TDateEdit
    Left = 81
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
  object Dtmai: TDateEdit
    Left = 184
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
  object Modelo_Carta: TComboBox
    Left = 350
    Top = 6
    Width = 145
    Height = 21
    Style = csDropDownList
    TabOrder = 2
    OnKeyDown = ClienteKeyDown
    Items.Strings = (
      'E-mail de Cobran'#231'a (Suave)'
      'E-mail de Cobran'#231'a (M'#233'dia)'
      'E-mail de Cobran'#231'a (Pesada)')
  end
  object Cliente: TCurrencyEdit
    Left = 256
    Top = 31
    Width = 67
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 7
    ZeroEmpty = False
    OnExit = ClienteExit
    OnKeyDown = ClienteKeyDown
  end
  object Classe: TEdit
    Left = 81
    Top = 31
    Width = 90
    Height = 21
    TabOrder = 6
    OnKeyDown = DtmenKeyDown
  end
  object btnRetorna: TBitBtn
    Left = 1179
    Top = 408
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
    TabOrder = 21
    OnClick = btnRetornaClick
  end
  object btnExecuta: TBitBtn
    Left = 1098
    Top = 408
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
    TabOrder = 20
    OnClick = btnExecutaClick
  end
  object SrcList: TListBox
    Left = 6
    Top = 58
    Width = 341
    Height = 202
    Enabled = False
    ItemHeight = 13
    MultiSelect = True
    Sorted = True
    TabOrder = 8
  end
  object DstList: TListBox
    Left = 394
    Top = 58
    Width = 341
    Height = 202
    Enabled = False
    ItemHeight = 13
    MultiSelect = True
    TabOrder = 9
  end
  object btnSelecao: TButton
    Left = 660
    Top = 8
    Width = 75
    Height = 21
    Caption = 'Selecionar'
    TabOrder = 4
    OnClick = btnSelecaoClick
  end
  object edtSenderName: TEdit
    Left = 110
    Top = 270
    Width = 237
    Height = 21
    TabOrder = 10
  end
  object edtSenderAddress: TEdit
    Left = 110
    Top = 297
    Width = 237
    Height = 21
    TabOrder = 12
  end
  object edtHost: TEdit
    Left = 110
    Top = 324
    Width = 234
    Height = 21
    TabOrder = 15
  end
  object edtPort: TEdit
    Left = 686
    Top = 297
    Width = 49
    Height = 21
    TabOrder = 14
    Text = '25'
  end
  object rbAuthNone: TRadioButton
    Left = 449
    Top = 326
    Width = 64
    Height = 17
    Caption = 'Nenhuma'
    TabOrder = 16
  end
  object rbAuthDefault: TRadioButton
    Left = 557
    Top = 327
    Width = 61
    Height = 17
    Caption = 'Padr'#227'o'
    Checked = True
    TabOrder = 17
    TabStop = True
  end
  object rbAuthSSL: TRadioButton
    Left = 674
    Top = 327
    Width = 40
    Height = 17
    Caption = 'SSL'
    TabOrder = 18
  end
  object rbAuthTLS: TRadioButton
    Left = 1166
    Top = 562
    Width = 113
    Height = 17
    Caption = 'TLS'
    TabOrder = 24
  end
  object edtUsername: TEdit
    Left = 414
    Top = 270
    Width = 321
    Height = 21
    TabOrder = 11
  end
  object edtPassword: TEdit
    Left = 414
    Top = 297
    Width = 164
    Height = 21
    PasswordChar = '*'
    TabOrder = 13
    Text = 'ss151002'
  end
  object edtRecipients: TEdit
    Left = 8
    Top = 595
    Width = 321
    Height = 21
    TabOrder = 28
  end
  object edtSubject: TEdit
    Left = 54
    Top = 492
    Width = 321
    Height = 21
    TabOrder = 22
    Text = 'Cliente Eficaz'
  end
  object mbody2: TMemo
    Left = 441
    Top = 591
    Width = 517
    Height = 96
    TabOrder = 27
  end
  object edtAttach: TEdit
    Left = 8
    Top = 568
    Width = 401
    Height = 21
    TabOrder = 26
  end
  object mLog: TMemo
    Left = 6
    Top = 373
    Width = 729
    Height = 60
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 19
  end
  object cbHTML: TCheckBox
    Left = 425
    Top = 606
    Width = 201
    Height = 17
    Caption = 'Mensagem no Formato HTML'
    Checked = True
    State = cbChecked
    TabOrder = 29
  end
  object mbody1: TMemo
    Left = 479
    Top = 565
    Width = 517
    Height = 122
    TabOrder = 25
  end
  object mBody: TMemo
    Left = 557
    Top = 562
    Width = 517
    Height = 187
    TabOrder = 23
  end
  object btn_envio: TBitBtn
    Left = 266
    Top = 622
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
    TabOrder = 30
    OnClick = btn_envioClick
  end
  object Chk_Empresa: TCheckBox
    Left = 501
    Top = 8
    Width = 131
    Height = 17
    Caption = 'Somente esta empresa'
    TabOrder = 3
  end
  object Carta: TMemo
    Left = 741
    Top = 8
    Width = 517
    Height = 337
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 5
  end
  object RDprint2: TRDprint
    ImpressoraPersonalizada.NomeImpressora = 'Modelo Personalizado - (Epson)'
    ImpressoraPersonalizada.AvancaOitavos = '27 48'
    ImpressoraPersonalizada.AvancaSextos = '27 50'
    ImpressoraPersonalizada.SaltoPagina = '12'
    ImpressoraPersonalizada.TamanhoPagina = '27 67 66'
    ImpressoraPersonalizada.Negrito = '27 69'
    ImpressoraPersonalizada.Italico = '27 52'
    ImpressoraPersonalizada.Sublinhado = '27 45 49'
    ImpressoraPersonalizada.Expandido = '27 14'
    ImpressoraPersonalizada.Normal10 = '18 27 80'
    ImpressoraPersonalizada.Comprimir12 = '18 27 77'
    ImpressoraPersonalizada.Comprimir17 = '27 80 27 15'
    ImpressoraPersonalizada.Comprimir20 = '27 77 27 15'
    ImpressoraPersonalizada.Reset = '27 80 18 20 27 53 27 70 27 45 48'
    ImpressoraPersonalizada.Inicializar = '27 64'
    OpcoesPreview.PaginaZebrada = False
    OpcoesPreview.Remalina = False
    OpcoesPreview.CaptionPreview = 'Visualiza'#231#227'o da Etiqueta'
    OpcoesPreview.PreviewZoom = 100
    OpcoesPreview.CorPapelPreview = clWhite
    OpcoesPreview.CorLetraPreview = clBlack
    OpcoesPreview.Preview = True
    OpcoesPreview.BotaoSetup = Ativo
    OpcoesPreview.BotaoImprimir = Ativo
    OpcoesPreview.BotaoGravar = Ativo
    OpcoesPreview.BotaoLer = Ativo
    OpcoesPreview.BotaoProcurar = Ativo
    OpcoesPreview.BotaoPDF = Ativo
    OpcoesPreview.BotaoEMAIL = Ativo
    Margens.Left = 10
    Margens.Right = 10
    Margens.Top = 10
    Margens.Bottom = 10
    Autor = Deltress
    RegistroUsuario.NomeRegistro = 'EFICAZ AUTOMA'#199'O E SISTEMAS LTDA '
    RegistroUsuario.SerieProduto = 'GROUP-0214/02002'
    RegistroUsuario.AutorizacaoKey = 'HE4F-X2AQ-8IYJ-211Q-IGUV'
    About = 'RDprint 5.0 - Registrado'
    Acentuacao = Transliterate
    CaptionSetup = 'Configura'#231#227'o de Impress'#227'o'
    TitulodoRelatorio = 'Etiquetas em Folha Solta'
    UsaGerenciadorImpr = True
    CorForm = clBtnFace
    CorFonte = clBlack
    Impressora = HP
    Mapeamento.Strings = (
      '//--- Grafico Compativel com Windows/USB ---//'
      '//'
      'GRAFICO=GRAFICO'
      'HP=GRAFICO'
      'DESKJET=GRAFICO'
      'LASERJET=GRAFICO'
      'INKJET=GRAFICO'
      'STYLUS=GRAFICO'
      'EPL=GRAFICO'
      'USB=GRAFICO'
      '//'
      '//--- Linha Epson Matricial 9 e 24 agulhas ---//'
      '//'
      'EPSON=EPSON'
      'GENERICO=EPSON'
      'LX-300=EPSON'
      'LX-810=EPSON'
      'FX-2170=EPSON'
      'FX-1170=EPSON'
      'LQ-1170=EPSON'
      'LQ-2170=EPSON'
      'OKIDATA=EPSON'
      '//'
      '//--- Rima e Emilia ---//'
      '//'
      'RIMA=RIMA'
      'EMILIA=RIMA'
      '//'
      '//--- Linha HP/Xerox padr'#227'o PCL ---//'
      '//'
      'PCL=HP'
      '//'
      '//--- Impressoras 40 Colunas ---//'
      '//'
      'DARUMA=BOBINA'
      'SIGTRON=BOBINA'
      'SWEDA=BOBINA'
      'BEMATECH=BOBINA')
    PortaComunicacao = 'LPT1'
    MostrarProgresso = True
    TamanhoQteLinhas = 66
    TamanhoQteColunas = 80
    TamanhoQteLPP = Seis
    NumerodeCopias = 1
    FonteTamanhoPadrao = S10cpp
    FonteEstiloPadrao = []
    Orientacao = poPortrait
    Left = 275
    Top = 457
  end
  object Table_Temp: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 315
    Top = 452
  end
  object IdSMTP: TIdSMTP
    OnStatus = IdSMTPStatus
    IOHandler = idHandle
    OnFailedRecipient = IdSMTPFailedRecipient
    SASLMechanisms = <>
    Left = 65456
    Top = 544
  end
  object IdMessage: TIdMessage
    AttachmentEncoding = 'MIME'
    BccList = <>
    CCList = <>
    ContentType = 'text/html'
    Encoding = meMIME
    FromList = <
      item
      end>
    Recipients = <>
    ReplyTo = <>
    ConvertPreamble = True
    Left = 65491
    Top = 544
  end
  object idHandle: TIdSSLIOHandlerSocketOpenSSL
    OnStatus = idHandleStatus
    Destination = ':25'
    MaxLineAction = maException
    Port = 25
    DefaultPort = 0
    SSLOptions.Method = sslvSSLv3
    SSLOptions.SSLVersions = [sslvSSLv3]
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    OnStatusInfo = idHandleStatusInfo
    Left = 46
    Top = 444
  end
  object DataCliente: TDataSource
    DataSet = QCliente
    Left = 240
    Top = 449
  end
  object QEmail: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evItems, evRecsMax, evRowsetSize, evCache, evCursorKind, evAutoFetchAll]
    FetchOptions.CursorKind = ckDefault
    FetchOptions.RowsetSize = 1000
    FetchOptions.AutoFetchAll = afDisable
    Left = 88
    Top = 440
  end
  object QRel: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evItems, evRecsMax, evRowsetSize, evCache, evCursorKind, evAutoFetchAll]
    FetchOptions.CursorKind = ckDefault
    FetchOptions.RowsetSize = 1000
    FetchOptions.AutoFetchAll = afDisable
    Left = 120
    Top = 440
  end
  object QCliente: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evItems, evRecsMax, evRowsetSize, evCache, evCursorKind, evAutoFetchAll]
    FetchOptions.CursorKind = ckDefault
    FetchOptions.RowsetSize = 1000
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      'SELECT * FROM CLIENTES'
      'WHERE'
      '(CLIENTE_ID = :CLIENTE_ID)'
      'AND (STATUS = '#39'A'#39')')
    Left = 160
    Top = 440
    ParamData = <
      item
        Name = 'CLIENTE_ID'
        ParamType = ptInput
      end>
  end
  object QItens: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evItems, evRecsMax, evRowsetSize, evCache, evCursorKind, evAutoFetchAll]
    FetchOptions.CursorKind = ckDefault
    FetchOptions.RowsetSize = 1000
    FetchOptions.AutoFetchAll = afDisable
    Left = 200
    Top = 440
  end
  object RDprint1: TRDprint
    ImpressoraPersonalizada.NomeImpressora = 'Modelo Personalizado - (Epson)'
    ImpressoraPersonalizada.AvancaOitavos = '27 48'
    ImpressoraPersonalizada.AvancaSextos = '27 50'
    ImpressoraPersonalizada.SaltoPagina = '12'
    ImpressoraPersonalizada.TamanhoPagina = '27 67 66'
    ImpressoraPersonalizada.Negrito = '27 69'
    ImpressoraPersonalizada.Italico = '27 52'
    ImpressoraPersonalizada.Sublinhado = '27 45 49'
    ImpressoraPersonalizada.Expandido = '27 14'
    ImpressoraPersonalizada.Normal10 = '18 27 80'
    ImpressoraPersonalizada.Comprimir12 = '18 27 77'
    ImpressoraPersonalizada.Comprimir17 = '27 80 27 15'
    ImpressoraPersonalizada.Comprimir20 = '27 77 27 15'
    ImpressoraPersonalizada.Reset = '27 80 18 20 27 53 27 70 27 45 48'
    ImpressoraPersonalizada.Inicializar = '27 64'
    OpcoesPreview.PaginaZebrada = False
    OpcoesPreview.Remalina = False
    OpcoesPreview.CaptionPreview = 'Rdprint Preview'
    OpcoesPreview.PreviewZoom = 100
    OpcoesPreview.CorPapelPreview = clWhite
    OpcoesPreview.CorLetraPreview = clBlack
    OpcoesPreview.Preview = False
    OpcoesPreview.BotaoSetup = Ativo
    OpcoesPreview.BotaoImprimir = Ativo
    OpcoesPreview.BotaoGravar = Ativo
    OpcoesPreview.BotaoLer = Ativo
    OpcoesPreview.BotaoProcurar = Ativo
    OpcoesPreview.BotaoPDF = Ativo
    OpcoesPreview.BotaoEMAIL = Ativo
    Margens.Left = 10
    Margens.Right = 10
    Margens.Top = 10
    Margens.Bottom = 10
    Autor = Deltress
    RegistroUsuario.NomeRegistro = 'EFICAZ AUTOMA'#199'O E SISTEMAS LTDA '
    RegistroUsuario.SerieProduto = 'GROUP-0214/02002'
    RegistroUsuario.AutorizacaoKey = 'HE4F-X2AQ-8IYJ-211Q-IGUV'
    About = 'RDprint 5.0 - Registrado'
    Acentuacao = Transliterate
    CaptionSetup = 'Rdprint Setup'
    TitulodoRelatorio = 'Gerado por RDprint'
    UsaGerenciadorImpr = False
    CorForm = clBtnFace
    CorFonte = clBlack
    Impressora = HP
    Mapeamento.Strings = (
      '//--- Grafico Compativel com Windows/USB ---//'
      '//'
      'GRAFICO=GRAFICO'
      'HP=GRAFICO'
      'DESKJET=GRAFICO'
      'LASERJET=GRAFICO'
      'INKJET=GRAFICO'
      'STYLUS=GRAFICO'
      'EPL=GRAFICO'
      'USB=GRAFICO'
      '//'
      '//--- Linha Epson Matricial 9 e 24 agulhas ---//'
      '//'
      'EPSON=EPSON'
      'GENERIC=EPSON'
      'TEXT=EPSON'
      'LX-300=EPSON'
      'LX-810=EPSON'
      'FX-2170=EPSON'
      'FX-1170=EPSON'
      'LQ-1170=EPSON'
      'LQ-2170=EPSON'
      'OKIDATA=EPSON'
      '//'
      '//--- Rima e Emilia ---//'
      '//'
      'RIMA=RIMA'
      'EMILIA=RIMA'
      '//'
      '//--- Linha HP/Xerox padr'#227'o PCL ---//'
      '//'
      'PCL=HP'
      '//'
      '//--- Impressoras 40 Colunas ---//'
      '//'
      'DARUMA=BOBINA'
      'SIGTRON=BOBINA'
      'SWEDA=BOBINA'
      'BEMATECH=BOBINA')
    MostrarProgresso = False
    TamanhoQteLinhas = 100
    TamanhoQteColunas = 125
    TamanhoQteLPP = Seis
    NumerodeCopias = 1
    FonteTamanhoPadrao = S12cpp
    FonteEstiloPadrao = []
    Orientacao = poPortrait
    Left = 760
    Top = 368
  end
end
