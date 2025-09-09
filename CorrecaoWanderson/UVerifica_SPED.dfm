object FrmVerificaSPED: TFrmVerificaSPED
  Left = 0
  Top = 0
  Caption = 'Analisar Notas'
  ClientHeight = 157
  ClientWidth = 678
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 574
    Top = 118
    Width = 85
    Height = 13
    Alignment = taRightJustify
    Caption = 'Registro 1 de 100'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object Label3: TLabel
    Left = 9
    Top = 78
    Width = 17
    Height = 13
    Caption = '0%'
    Visible = False
  end
  object lb_status: TLabel
    Left = 9
    Top = 118
    Width = 31
    Height = 13
    Caption = 'Status'
    Visible = False
  end
  object Dtmen: TDateEdit
    Left = 8
    Top = 25
    Width = 90
    Height = 21
    CheckOnExit = True
    DialogTitle = 'Selecione a Data'
    NumGlyphs = 2
    TabOrder = 0
    Visible = False
  end
  object Dtmai: TDateEdit
    Left = 8
    Top = 52
    Width = 90
    Height = 21
    CheckOnExit = True
    DialogTitle = 'Selecione a Data'
    NumGlyphs = 2
    TabOrder = 1
    Visible = False
  end
  object ProgressBar: TProgressBar
    Left = 9
    Top = 97
    Width = 650
    Height = 18
    TabOrder = 2
  end
  object CheckBox1: TCheckBox
    Left = 442
    Top = 40
    Width = 104
    Height = 16
    Caption = 'Imp. HP/Samsung'
    TabOrder = 3
  end
  object Btn_analisar_notas: TButton
    Left = 232
    Top = 31
    Width = 185
    Height = 33
    Caption = 'Analisar Notas'
    TabOrder = 4
    OnClick = Btn_analisar_notasClick
  end
  object Iquery: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evItems, evRecsMax, evRowsetSize, evCache, evCursorKind, evAutoFetchAll]
    FetchOptions.CursorKind = ckDefault
    FetchOptions.RowsetSize = 1000
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      '')
    Left = 568
    Top = 24
  end
  object Qempresa: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evItems, evRecsMax, evRowsetSize, evCache, evCursorKind, evAutoFetchAll]
    FetchOptions.CursorKind = ckDefault
    FetchOptions.RowsetSize = 1000
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      'SELECT * FROM EMPRESAS WHERE EMPRESA_ID =:EMPRESA_ID')
    Left = 408
    Top = 64
    ParamData = <
      item
        Name = 'EMPRESA_ID'
        ParamType = ptInput
      end>
  end
  object Qsearch: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evItems, evRecsMax, evRowsetSize, evCache, evCursorKind, evAutoFetchAll]
    FetchOptions.CursorKind = ckDefault
    FetchOptions.RowsetSize = 1000
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      'SELECT * FROM EMPRESAS WHERE EMPRESA_ID =:EMPRESA_ID')
    Left = 488
    Top = 56
    ParamData = <
      item
        Name = 'EMPRESA_ID'
        ParamType = ptInput
      end>
  end
  object QRel: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evItems, evRecsMax, evRowsetSize, evCache, evCursorKind, evAutoFetchAll]
    FetchOptions.CursorKind = ckDefault
    FetchOptions.RowsetSize = 1000
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      'SELECT * FROM EMPRESAS WHERE EMPRESA_ID =:EMPRESA_ID')
    Left = 632
    Top = 16
    ParamData = <
      item
        Name = 'EMPRESA_ID'
        ParamType = ptInput
      end>
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
    UsaGerenciadorImpr = True
    CorForm = clBtnFace
    CorFonte = clBlack
    Impressora = Epson
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
    MostrarProgresso = True
    TamanhoQteLinhas = 66
    TamanhoQteColunas = 80
    TamanhoQteLPP = Seis
    NumerodeCopias = 1
    FonteTamanhoPadrao = S10cpp
    FonteEstiloPadrao = []
    Orientacao = poLandscape
    OnNewPage = RDprint1NewPage
    Left = 455
    Top = 65528
  end
  object Qconta: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evItems, evRecsMax, evRowsetSize, evCache, evCursorKind, evAutoFetchAll]
    FetchOptions.CursorKind = ckDefault
    FetchOptions.RowsetSize = 1000
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      'SELECT * FROM EMPRESAS WHERE EMPRESA_ID =:EMPRESA_ID')
    Left = 136
    Top = 112
    ParamData = <
      item
        Name = 'EMPRESA_ID'
        ParamType = ptInput
      end>
  end
  object Qtabela: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evItems, evRecsMax, evRowsetSize, evCache, evCursorKind, evAutoFetchAll]
    FetchOptions.CursorKind = ckDefault
    FetchOptions.RowsetSize = 1000
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      'SELECT * FROM EMPRESAS WHERE EMPRESA_ID =:EMPRESA_ID')
    Left = 144
    Top = 16
    ParamData = <
      item
        Name = 'EMPRESA_ID'
        ParamType = ptInput
      end>
  end
end
