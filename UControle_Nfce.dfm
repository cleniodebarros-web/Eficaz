object FrmControle_Nfce: TFrmControle_Nfce
  Left = 257
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Central de envio Nfc-e  Sistema Eficaz'
  ClientHeight = 558
  ClientWidth = 901
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 13
    Top = 8
    Width = 125
    Height = 24
    Caption = 'Nfc-e Geradas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 13
    Top = 169
    Width = 131
    Height = 24
    Caption = 'Nfc-e Enviadas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 13
    Top = 371
    Width = 152
    Height = 24
    Caption = 'Pend'#234'ncias Nfc-e'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Msg_If: TLabel
    Left = 203
    Top = 371
    Width = 515
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label4: TLabel
    Left = 252
    Top = 527
    Width = 36
    Height = 13
    Caption = 'Per'#237'odo'
  end
  object Label5: TLabel
    Left = 13
    Top = 522
    Width = 99
    Height = 19
    Caption = 'Nfc-e em Erro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object Label6: TLabel
    Left = 153
    Top = 14
    Width = 60
    Height = 13
    Caption = 'Chave Nfc-e'
  end
  object Label7: TLabel
    Left = 153
    Top = 203
    Width = 60
    Height = 13
    Caption = 'Chave Nfc-e'
  end
  object DBgrid_recebidas: TDBGrid
    Left = 8
    Top = 38
    Width = 881
    Height = 129
    DataSource = Data_Recebidas
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBgrid_recebidasCellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'arquivo_xml'
        Title.Alignment = taCenter
        Title.Caption = 'Xml'
        Visible = False
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'dt_emissao'
        Title.Alignment = taCenter
        Title.Caption = 'Data'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'hr_saida'
        Title.Alignment = taCenter
        Title.Caption = 'Hora'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ecf'
        Title.Alignment = taCenter
        Title.Caption = 'Ecf'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'no_doc_fiscal'
        Title.Caption = 'Documento'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'chave_nfce'
        Title.Alignment = taCenter
        Title.Caption = 'Chave Nfc-e'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'valor'
        Title.Alignment = taCenter
        Title.Caption = 'Valor'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'transmissao'
        Title.Alignment = taCenter
        Title.Caption = 'Nota Enviada'
        Width = 75
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'pathnfce_local'
        Title.Alignment = taCenter
        Title.Caption = 'Local Xml '
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'transacao_id'
        Visible = False
      end>
  end
  object DBGrid_Enviadas: TDBGrid
    Left = 8
    Top = 229
    Width = 881
    Height = 131
    DataSource = Data_Enviadas
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid_EnviadasCellClick
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'arquivo_xml'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = 'Xml'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'dt_emissao'
        Title.Alignment = taCenter
        Title.Caption = 'Data'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'hr_saida'
        Title.Alignment = taCenter
        Title.Caption = 'Hora'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ecf'
        Title.Alignment = taCenter
        Title.Caption = 'Ecf'
        Width = 51
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'no_doc_fiscal'
        Title.Caption = 'Documento'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'chave_nfce'
        Title.Alignment = taCenter
        Title.Caption = 'Chave Nfc-e'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'valor'
        Title.Alignment = taCenter
        Title.Caption = 'Valor'
        Width = 49
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'transmissao'
        Title.Alignment = taRightJustify
        Title.Caption = 'Nota Enviada'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'protocolo'
        Title.Alignment = taCenter
        Title.Caption = 'Protocolo'
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'transacao_id'
        Visible = False
      end>
  end
  object DBGrid2: TDBGrid
    Left = 8
    Top = 403
    Width = 682
    Height = 113
    DataSource = Data_erro
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid2DrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'transacao_id'
        Title.Alignment = taCenter
        Title.Caption = 'Transa'#231#227'o'
        Width = 57
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'dt_trans'
        Title.Alignment = taCenter
        Title.Caption = 'Data'
        Width = 62
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'hora'
        Title.Alignment = taCenter
        Title.Caption = 'Hora'
        Width = 63
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'serie'
        Title.Alignment = taCenter
        Title.Caption = 'Ecf'
        Width = 38
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'num_doc'
        Title.Caption = 'Documento'
        Width = 58
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'chave_nfce'
        Title.Alignment = taCenter
        Title.Caption = 'Chave Nfc-e'
        Width = 276
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'valor'
        Title.Alignment = taCenter
        Title.Caption = 'Valor'
        Width = 56
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 760
    Top = 7
    Width = 129
    Height = 25
    Caption = 'Consultar'
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 640
    Top = 520
    Width = 129
    Height = 25
    Caption = 'Status do Servi'#231'o'
    TabOrder = 13
    OnClick = BitBtn2Click
  end
  object Chk_exibir: TCheckBox
    Left = 554
    Top = 11
    Width = 80
    Height = 17
    Caption = 'Exibir Erros'
    Checked = True
    State = cbChecked
    TabOrder = 4
  end
  object BitBtn3: TBitBtn
    Left = 792
    Top = 173
    Width = 97
    Height = 25
    Caption = 'Apagar Nfc-e'
    TabOrder = 9
    OnClick = BitBtn3Click
  end
  object BitBtn4: TBitBtn
    Left = 672
    Top = 173
    Width = 97
    Height = 25
    Caption = 'Imprimir Nfc-e'
    TabOrder = 8
    OnClick = ImprimirNfce1Click
  end
  object BitBtn5: TBitBtn
    Left = 563
    Top = 173
    Width = 97
    Height = 25
    Caption = 'Emviar Email Nfc-e'
    TabOrder = 7
    OnClick = BitBtn5Click
  end
  object BtnAtualizar: TBitBtn
    Left = 505
    Top = 520
    Width = 129
    Height = 25
    Caption = 'Atualizar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 12
    OnClick = BtnAtualizarClick
  end
  object Dtmen: TDateEdit
    Left = 397
    Top = 522
    Width = 90
    Height = 21
    CheckOnExit = True
    DialogTitle = 'Selecione a Data'
    NumGlyphs = 2
    StartOfWeek = Sun
    TabOrder = 11
  end
  object Dtmai: TDateEdit
    Left = 295
    Top = 522
    Width = 90
    Height = 21
    CheckOnExit = True
    DialogTitle = 'Selecione a Data'
    NumGlyphs = 2
    StartOfWeek = Sun
    TabOrder = 10
  end
  object btnRetorna: TButton
    Left = 804
    Top = 520
    Width = 85
    Height = 25
    Caption = '&Retorna'
    TabOrder = 14
    OnClick = btnRetornaClick
  end
  object BitBtn7: TBitBtn
    Left = 452
    Top = 173
    Width = 97
    Height = 25
    Caption = 'Cancelar NFC-e'
    TabOrder = 6
    OnClick = BitBtn7Click
  end
  object Memoresp: TMemo
    Left = 704
    Top = 248
    Width = 185
    Height = 89
    Lines.Strings = (
      'Memoresp')
    TabOrder = 15
    Visible = False
  end
  object BitBtn8: TBitBtn
    Left = 341
    Top = 173
    Width = 97
    Height = 25
    Caption = 'Consultar NFC-e'
    TabOrder = 5
    OnClick = BitBtn8Click
  end
  object BitBtn6: TBitBtn
    Left = 720
    Top = 200
    Width = 169
    Height = 25
    Caption = 'Marcar Nfc-e como n'#227'o enviada'
    TabOrder = 16
    OnClick = BitBtn6Click
  end
  object BitBtn9: TBitBtn
    Left = 166
    Top = 173
    Width = 169
    Height = 25
    Caption = 'Marcar Nfc-e como enviada'
    TabOrder = 17
    OnClick = BitBtn9Click
  end
  object BitBtn10: TBitBtn
    Left = 657
    Top = 7
    Width = 97
    Height = 25
    Caption = 'Imprimir Nfc-e'
    TabOrder = 18
    OnClick = BitBtn10Click
  end
  object ChaveRec_Edt: TEdit
    Left = 235
    Top = 11
    Width = 270
    Height = 21
    ReadOnly = True
    TabOrder = 19
  end
  object ChaveEnv_edt: TEdit
    Left = 235
    Top = 200
    Width = 270
    Height = 21
    ReadOnly = True
    TabOrder = 20
  end
  object BitBtn11: TBitBtn
    Left = 736
    Top = 370
    Width = 153
    Height = 25
    Caption = 'Corrigir Nfc-e(s)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 21
    OnClick = BitBtn11Click
  end
  object Monitor: TRichEdit
    Left = 688
    Top = 403
    Width = 201
    Height = 113
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      '')
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 22
  end
  object QNfce_Recebidas: TFDQuery
    AfterOpen = QNfce_RecebidasAfterOpen
    Connection = FrmData.DbF_Eficaz
    SQL.Strings = (
      'SELECT * FROM COMPL_NFCEFISCAL WHERE'
      'TRANSMISSAO = '#39'NAO'#39
      'AND DT_SAIDA BETWEEN :DT_INICIO AND :DT_FIM'
      'ORDER BY TRANSACAO_ID DESC')
    Left = 24
    Top = 16
    ParamData = <
      item
        Name = 'DT_INICIO'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DT_FIM'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end>
    object QNfce_Recebidastransacao_id: TIntegerField
      FieldName = 'transacao_id'
      Origin = 'transacao_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QNfce_Recebidasdt_saida: TDateField
      FieldName = 'dt_saida'
      Origin = 'dt_saida'
    end
    object QNfce_Recebidashr_saida: TStringField
      FieldName = 'hr_saida'
      Origin = 'hr_saida'
      Size = 8
    end
    object QNfce_Recebidasrecibo: TStringField
      FieldName = 'recibo'
      Origin = 'recibo'
      Size = 32
    end
    object QNfce_Recebidasprotocolo: TStringField
      FieldName = 'protocolo'
      Origin = 'protocolo'
      Size = 32
    end
    object QNfce_Recebidaschave_nfce: TStringField
      FieldName = 'chave_nfce'
      Origin = 'chave_nfce'
      Size = 44
    end
    object QNfce_Recebidasempresa_id: TIntegerField
      FieldName = 'empresa_id'
      Origin = 'empresa_id'
    end
    object QNfce_Recebidasecf: TStringField
      FieldName = 'ecf'
      Origin = 'ecf'
      Size = 3
    end
    object QNfce_Recebidastransmissao: TStringField
      FieldName = 'transmissao'
      Origin = 'transmissao'
      Size = 5
    end
    object QNfce_Recebidaspathnfce_servidor: TStringField
      FieldName = 'pathnfce_servidor'
      Origin = 'pathnfce_servidor'
      Size = 60
    end
    object QNfce_Recebidaspathnfce_local: TStringField
      FieldName = 'pathnfce_local'
      Origin = 'pathnfce_local'
      Size = 60
    end
    object QNfce_Recebidasdt_emissao: TDateField
      FieldName = 'dt_emissao'
      Origin = 'dt_emissao'
    end
    object QNfce_Recebidasdt_transmissao: TDateField
      FieldName = 'dt_transmissao'
      Origin = 'dt_transmissao'
    end
    object QNfce_Recebidasexportado: TIntegerField
      FieldName = 'exportado'
      Origin = 'exportado'
    end
    object QNfce_Recebidasvalor: TBCDField
      FieldName = 'valor'
      Origin = 'valor'
      Precision = 15
      Size = 3
    end
    object QNfce_Recebidasno_doc_fiscal: TIntegerField
      FieldName = 'no_doc_fiscal'
      Origin = 'no_doc_fiscal'
    end
    object QNfce_Recebidassintegra: TStringField
      FieldName = 'sintegra'
      Origin = 'sintegra'
      Size = 1
    end
    object QNfce_Recebidascond_pagto: TStringField
      FieldName = 'cond_pagto'
      Origin = 'cond_pagto'
      Size = 7
    end
    object QNfce_Recebidaspathnfce_servidor_env: TStringField
      FieldName = 'pathnfce_servidor_env'
      Origin = 'pathnfce_servidor_env'
      Size = 60
    end
    object QNfce_Recebidasarquivo_xml: TBlobField
      FieldName = 'arquivo_xml'
      Origin = 'arquivo_xml'
      OnGetText = QNfce_Recebidasarquivo_xmlGetText
    end
  end
  object QNfce_Erro: TFDQuery
    AfterOpen = QNfce_ErroAfterOpen
    Connection = FrmData.DbF_Eficaz
    SQL.Strings = (
      
        'SELECT TRANSACOES.TRANSACAO_ID,DT_TRANS,HORA,SERIE,NUM_DOC,CHAVE' +
        '_NFE CHAVE_NFCE,'
      'TRANSACOES.VALOR,TRANSACAO_ORIGEM'
      'FROM TRANSACOES '
      'WHERE DT_TRANS BETWEEN :DT_INICIO AND :DT_FIM'
      'AND MODELO = '#39'65'#39
      
        'AND TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM  COMPL_NFCEFIS' +
        'CAL '
      'WHERE DT_SAIDA BETWEEN :DT_INICIO AND :DT_FIM )'
      'ORDER BY TRANSACOES.TRANSACAO_ID')
    Left = 24
    Top = 288
    ParamData = <
      item
        Name = 'DT_INICIO'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DT_FIM'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end>
  end
  object Data_Recebidas: TDataSource
    DataSet = QNfce_Recebidas
    Left = 72
    Top = 16
  end
  object Data_Enviadas: TDataSource
    DataSet = QNfce_Enviadas
    Left = 88
    Top = 160
  end
  object Data_erro: TDataSource
    DataSet = Fdac_Temp
    Left = 88
    Top = 288
  end
  object QNfce_Enviadas: TFDQuery
    AfterOpen = QNfce_EnviadasAfterOpen
    Connection = FrmData.DbF_Eficaz
    SQL.Strings = (
      'SELECT * FROM COMPL_NFCEFISCAL WHERE'
      'TRANSMISSAO = '#39'SIM'#39' AND'
      'DT_SAIDA BETWEEN :DT_INICIO AND :DT_FIM'
      'ORDER BY TRANSACAO_ID DESC')
    Left = 24
    Top = 160
    ParamData = <
      item
        Name = 'DT_INICIO'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DT_FIM'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end>
    object QNfce_Enviadastransacao_id: TIntegerField
      FieldName = 'transacao_id'
      Origin = 'transacao_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QNfce_Enviadasdt_saida: TDateField
      FieldName = 'dt_saida'
      Origin = 'dt_saida'
    end
    object QNfce_Enviadashr_saida: TStringField
      FieldName = 'hr_saida'
      Origin = 'hr_saida'
      Size = 8
    end
    object QNfce_Enviadasrecibo: TStringField
      FieldName = 'recibo'
      Origin = 'recibo'
      Size = 32
    end
    object QNfce_Enviadasprotocolo: TStringField
      FieldName = 'protocolo'
      Origin = 'protocolo'
      Size = 32
    end
    object QNfce_Enviadaschave_nfce: TStringField
      FieldName = 'chave_nfce'
      Origin = 'chave_nfce'
      Size = 44
    end
    object QNfce_Enviadasempresa_id: TIntegerField
      FieldName = 'empresa_id'
      Origin = 'empresa_id'
    end
    object QNfce_Enviadasecf: TStringField
      FieldName = 'ecf'
      Origin = 'ecf'
      Size = 3
    end
    object QNfce_Enviadastransmissao: TStringField
      FieldName = 'transmissao'
      Origin = 'transmissao'
      Size = 5
    end
    object QNfce_Enviadaspathnfce_servidor: TStringField
      FieldName = 'pathnfce_servidor'
      Origin = 'pathnfce_servidor'
      Size = 60
    end
    object QNfce_Enviadaspathnfce_local: TStringField
      FieldName = 'pathnfce_local'
      Origin = 'pathnfce_local'
      Size = 60
    end
    object QNfce_Enviadasdt_emissao: TDateField
      FieldName = 'dt_emissao'
      Origin = 'dt_emissao'
    end
    object QNfce_Enviadasdt_transmissao: TDateField
      FieldName = 'dt_transmissao'
      Origin = 'dt_transmissao'
    end
    object QNfce_Enviadasexportado: TIntegerField
      FieldName = 'exportado'
      Origin = 'exportado'
    end
    object QNfce_Enviadasvalor: TBCDField
      FieldName = 'valor'
      Origin = 'valor'
      Precision = 15
      Size = 3
    end
    object QNfce_Enviadasno_doc_fiscal: TIntegerField
      FieldName = 'no_doc_fiscal'
      Origin = 'no_doc_fiscal'
    end
    object QNfce_Enviadassintegra: TStringField
      FieldName = 'sintegra'
      Origin = 'sintegra'
      Size = 1
    end
    object QNfce_Enviadascond_pagto: TStringField
      FieldName = 'cond_pagto'
      Origin = 'cond_pagto'
      Size = 7
    end
    object QNfce_Enviadaspathnfce_servidor_env: TStringField
      FieldName = 'pathnfce_servidor_env'
      Origin = 'pathnfce_servidor_env'
      Size = 60
    end
    object QNfce_Enviadasarquivo_xml: TBlobField
      FieldName = 'arquivo_xml'
      Origin = 'arquivo_xml'
      OnGetText = QNfce_Enviadasarquivo_xmlGetText
    end
  end
  object config: TFDTable
    Connection = FrmData.DbF_Eficaz
    UpdateOptions.UpdateTableName = 'config'
    TableName = 'config'
    Left = 64
    Top = 40
  end
  object QEmpresa: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evItems, evRecsMax, evRowsetSize, evCache, evCursorKind, evAutoFetchAll]
    FetchOptions.CursorKind = ckDefault
    FetchOptions.RowsetSize = 1000
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      'SELECT * FROM EMPRESAS'
      'WHERE'
      '(EMPRESA_ID = :EMPRESA_ID)'
      'AND (STATUS = '#39'A'#39')')
    Left = 112
    Top = 40
    ParamData = <
      item
        Name = 'EMPRESA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object QRel: TFDQuery
    Connection = FrmData.DbF_Eficaz
    SQL.Strings = (
      '')
    Left = 160
    Top = 40
  end
  object QUpdate: TFDQuery
    Connection = FrmData.DbF_Eficaz
    SQL.Strings = (
      '')
    Top = 65520
  end
  object MainMenu1: TMainMenu
    Left = 120
    Top = 80
    object Nfce1: TMenuItem
      Caption = 'Nfc-e'
      object ImprimirNfce1: TMenuItem
        Caption = 'Imprimir Nfc-e'
        OnClick = ImprimirNfce1Click
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 96
    Top = 65512
  end
  object IQuery: TFDQuery
    Connection = FrmData.DbF_Eficaz
    SQL.Strings = (
      '')
    Left = 280
    Top = 80
  end
  object QCancelamento: TFDQuery
    Connection = FrmData.DbF_Eficaz
    SQL.Strings = (
      '')
    Left = 200
    Top = 80
  end
  object QArq: TFDQuery
    Connection = FrmData.DbF_Eficaz
    SQL.Strings = (
      '')
    Left = 240
    Top = 80
  end
  object QSearch: TFDQuery
    Connection = FrmData.DbF_Eficaz
    SQL.Strings = (
      '')
    Left = 200
    Top = 40
  end
  object ImageList1: TImageList
    Left = 552
    Top = 304
    Bitmap = {
      494C010102000800640010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000E4E4E41CD2D2
      D22DD2D2D22DD2D2D22DD2D2D22DD2D2D22DD2D2D22DD2D2D22DD2D2D22DD2D2
      D22DDCDCDC240000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B1B1B193D8D8
      D8FFD8D8D8FFD8D8D8FFD8D8D8FFDCDCDCFFD4D4D4FFDBDBDBFFDBDBDBFFDBDB
      DBFFBFBFBFC7000000000000000000000000000000000000000000000000FDFD
      FD026464B0AD4A4ABDD15252BED14E4EBED14545BED13B3BBDD12F2FBCD1D2D2
      D72D000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A9A9A9D5B4B4B4E9B6B6B6E9D8D8
      D8FFD8D8D8FFD8D8D8FFD8D8D8FFD8D8D8FFD8D8D8FFD8D8D8FFD8D8D8FFD8D8
      D8FFA4A4A4EAB4B4B4E9B4B4B4E9DDDDDD260000000000000000F8F8F9072525
      D2E30000E2FF0000E4FF0000E5FF0000E6FF0000E5FF0000E4FF0000E1FF0000
      DEFFACACB9530000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D0D0D0FFD0D0D0FFD3D3D3FF2C2C
      2CFF313131FF2F2F2FFF2E2E2EFF2D2D2DFF2D2D2DFF2C2C2CFF2C2C2CFF2B2B
      2BFF939393FFD2D2D2FFD3D3D3FFB9B9B95900000000EAEAEC150606D9F93A3A
      E6FF8989FFFF9E9EFFFFB3B3FFFFC2C2FFFFC9C9FFFFC2C2FFFFB3B3FFFFADAD
      FEFF0000D4FF7B7BA38400000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DDDDDDFFDDDDDDFFDDDDDDFFA5A5
      A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA6A6
      A6FFDDDDDDFFDADADAFFDDDDDDFFB8B8B859D1D1D62E0000CEFF4F4FEEFF6767
      FFFF6464FEFF8E8EFFFF9E9EFFFFA9A9FFFFAEAEFFFFA9A9FFFF8E8EFCFF8E8E
      FFFF8484FFFF0404CBFF4747A3B8FEFEFE010000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EAEAEAFFEAEAEAFFEAEAEAFFEAEA
      EAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEA
      EAFFEAEAEAFFEAEAEAFFEAEAEAFFB8B8B8590000C2FF4242F7FF4646FFFF4B4B
      F6FFFFFFFFFF8181FFFF8787FFFF9090FFFF9393FFFF7474FDFFFFFFFFFF9E9E
      F1FF6A6AFFFF5B5BFFFF1010C8FFBBBBD0440000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F8F8F8FFFDFDFDFFFDFDFDFFFCEB
      DEFFBF7839FFBF8146FFBF854DFFBF834AFFBF7C3EFFBF6D2FFFBF5A1EFFF1C1
      AAFFFDFDFDFFFDFDFDFFFCFCFCFFB8B8B8591E1EFDFF2727FFFF3838FFFFFFFF
      FFFFFFFFFFFFFFFFFFFF9C9CFFFF7777FFFF5F5FFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF7474FFFF4949FFFF3838FFFF8B8BB4760000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFEFFFEFEFEFFFEFEFEFFF8E0
      D1FFDE965FFFD7965AFFD79A5EFFE4AC77FFD78F55FFD78249FFDD7B46FFECB3
      98FFFEFEFEFFFEFEFEFFFEFEFEFFC4C4C4500B0BFFFF1B1BFFFF4242FFFF5E5E
      FFFFFDFDFFFFFFFFFFFFFFFFFFFFB1B1FEFFFFFFFFFFFFFFFFFFFFFFFFFF6969
      FFFF4545FFFF3737FFFF2929FFFF9898CF690000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E9E9E9F5FEFEFEFFFEFEFEFFF4D4
      C5FFD5A890FFD9AA8DFFDEA880FFDEA57DFFDD9F77FFE09D77FFEAA585FFE6AC
      91FFFEFEFEFFFEFEFEFFFEFEFEFFFAFAFA072727FFFF8F8FFFFF9494FFFF9898
      FFFF9C9CFFFFF8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6D6DFFFF3B3B
      FFFF3131FFFF2626FFFF1919FFFFB1B1CF4E0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE01D5D5D587E8E8E8F6EFC5
      B2FFF5CBBAFFF4CDB9FFF4CCB9FFF4CBB7FFF4C7B3FFF4C4B0FFF3C4AEFFE2AF
      96FFE0E0E0FFC9C9C9AAEFEFEF2D000000002626FFFF9999FFFF9B9BFFFF9E9E
      FFFFA1A1FFFFC6C6F6FFFFFFFFFFFFFFFFFFFFFFFFFFF4F4FCFFA5A5FEFFA3A3
      FFFF5959FFFF1414FFFF0A0AFFFFC3C3DB3C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000ADADAD89C4C4
      C4FFFEFEFEFFF6EEEAFFF1E9E6FFEBE4E0FFE6DEDBFFE2E0DFFFE0E0E0FFD4D4
      D4FFB5B5B5B50000000000000000000000002020FEFFA5A5FFFFA5A5FFFFA6A6
      FFFFDCDCF6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFEFFA9A9
      FDFFA7A7FFFFA0A0FFFF0000FFFFDBDBED240000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AEAEAE89D3D3
      D3FFFEFEFEFFFEFEFEFFFDFDFDFFF6F6F6FFEFEFEFFFE9E9E9FFE3E3E3FFD5D5
      D5FFB5B5B5B50000000000000000000000002121FBFFB1B1FFFFB1B1FFFFECEC
      FAFFFFFFFFFFFFFFFFFFFAFAFFFFB2B2FFFFDDDDFFFFFFFFFFFFFFFFFFFFFEFE
      FEFFB1B1FCFFB1B1FFFFA5A5FFFFF5F5F90A0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000ACACAC89DADA
      DAFFFEFEFEFFFEFEFEFFFEFEFEFFFAFAFAFFF3F3F3FFEDEDEDFFE7E7E7FFD7D7
      D7FFB5B5B5B5000000000000000000000000EFEFFC134949FBFFBDBDFFFFE8E8
      FFFFFFFFFFFFF6F6FFFFBDBDFFFFBDBDFFFFBDBDFFFFD6D6FFFFFFFFFFFFFDFD
      FFFFBDBDFFFFA6A6FFFF8686E984000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B5B5B573D5D5
      D5FBFEFEFEFFFEFEFEFFFEFEFEFFFDFDFDFFF7F7F7FFF0F0F0FFEAEAEAFFD8D8
      D8FFB5B5B5B500000000000000000000000000000000000000001F1FF0F9C8C8
      FFFFDADAFFFFC8C8FFFFC8C8FFFFC8C8FFFFC8C8FFFFC8C8FFFFD3D3FFFFC8C8
      FFFF7B7BFEFFD8D8F73000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B8B8
      B8C2FEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFBFBFBFFF4F4F4FFEEEEEEFFDADA
      DAFFB4B4B4B50000000000000000000000000000000000000000000000002D2D
      E3D8D3D3FFFFD3D3FFFFD3D3FFFFD3D3FFFFD3D3FFFFD3D3FFFFD3D3FFFF3A3A
      F8FFFAFAFE060000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D8D8
      D85BD3D3D382D3D3D382D3D3D382D3D3D382D3D3D382D3D3D382D3D3D382CACA
      CAA2C3C3C3990000000000000000000000000000000000000000000000000000
      00007878E4912D2DE7E02D2DE7E02D2DE7E02D2DE7E02D2DE7E02B2BE2D50000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00C007FFFF00000000C007E00F00000000
      0000C00700000000000080030000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000001000000000000
      C007000000000000C007000000000000C007000100000000C007C00300000000
      E007E00700000000E007F01F0000000000000000000000000000000000000000
      000000000000}
  end
  object ACBrNFeDANFCeFortes1: TACBrNFeDANFCeFortes
    Sistema = 'Projeto ACBr - www.projetoacbr.com.br'
    MargemInferior = 0.800000000000000000
    MargemSuperior = 0.800000000000000000
    MargemEsquerda = 0.600000000000000000
    MargemDireita = 0.510000000000000000
    ExpandeLogoMarcaConfig.Altura = 0
    ExpandeLogoMarcaConfig.Esquerda = 0
    ExpandeLogoMarcaConfig.Topo = 0
    ExpandeLogoMarcaConfig.Largura = 0
    ExpandeLogoMarcaConfig.Dimensionar = False
    ExpandeLogoMarcaConfig.Esticar = True
    CasasDecimais.Formato = tdetInteger
    CasasDecimais.qCom = 2
    CasasDecimais.vUnCom = 2
    CasasDecimais.MaskqCom = ',0.00'
    CasasDecimais.MaskvUnCom = ',0.00'
    ACBrNFe = ACBrNFe1
    TipoDANFE = tiNFCe
    ImprimeQRCodeLateral = True
    FormularioContinuo = True
    TamanhoLogoHeight = 0
    TamanhoLogoWidth = 0
    FonteLinhaItem.Charset = DEFAULT_CHARSET
    FonteLinhaItem.Color = clWindowText
    FonteLinhaItem.Height = -9
    FonteLinhaItem.Name = 'Lucida Console'
    FonteLinhaItem.Style = []
    Left = 200
  end
  object ACBrNFe1: TACBrNFe
    MAIL = ACBrMail1
    Configuracoes.Geral.SSLLib = libCustom
    Configuracoes.Geral.SSLCryptLib = cryWinCrypt
    Configuracoes.Geral.SSLHttpLib = httpIndy
    Configuracoes.Geral.SSLXmlSignLib = xsMsXml
    Configuracoes.Geral.FormatoAlerta = 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.'
    Configuracoes.Geral.ModeloDF = moNFCe
    Configuracoes.Arquivos.OrdenacaoPath = <>
    Configuracoes.Arquivos.EmissaoPathNFe = True
    Configuracoes.WebServices.UF = 'MG'
    Configuracoes.WebServices.AguardarConsultaRet = 15000
    Configuracoes.WebServices.AjustaAguardaConsultaRet = True
    Configuracoes.WebServices.QuebradeLinha = '|'
    Configuracoes.Certificados.NumeroSerie = '00D17205'
    Configuracoes.Certificados.Senha = 'Eficaz2020'
    Configuracoes.RespTec.IdCSRT = 0
    DANFE = ACBrNFeDANFCeFortes1
    Left = 157
  end
  object ACBrNFeDANFeRL1: TACBrNFeDANFeRL
    Sistema = 'Eficaz Automa'#231#227'o e Sistemas Ltda'
    Site = 'www.eficazautomacao.com.br'
    MargemInferior = 0.700000000000000000
    MargemSuperior = 0.700000000000000000
    MargemEsquerda = 0.700000000000000000
    MargemDireita = 0.700000000000000000
    ExpandeLogoMarcaConfig.Altura = 0
    ExpandeLogoMarcaConfig.Esquerda = 0
    ExpandeLogoMarcaConfig.Topo = 0
    ExpandeLogoMarcaConfig.Largura = 0
    ExpandeLogoMarcaConfig.Dimensionar = False
    ExpandeLogoMarcaConfig.Esticar = True
    CasasDecimais.Formato = tdetInteger
    CasasDecimais.qCom = 2
    CasasDecimais.vUnCom = 2
    CasasDecimais.MaskqCom = ',0.00'
    CasasDecimais.MaskvUnCom = ',0.00'
    ImprimeNomeFantasia = True
    Left = 264
  end
  object ACBrMail1: TACBrMail
    Host = '127.0.0.1'
    Port = '25'
    SetSSL = False
    SetTLS = False
    Attempts = 3
    DefaultCharset = UTF_8
    IDECharset = CP1252
    Left = 40
    Top = 65520
  end
  object QItens: TFDQuery
    Connection = FrmData.DbF_Eficaz
    SQL.Strings = (
      '')
    Left = 72
    Top = 88
  end
  object QProdutos: TFDQuery
    Connection = FrmData.DbF_Eficaz
    SQL.Strings = (
      '')
    Left = 32
    Top = 88
  end
  object QSearchPdv: TFDQuery
    Connection = FrmData.DbF_Eficaz
    SQL.Strings = (
      '')
    Left = 328
    Top = 80
  end
  object QInsert: TFDQuery
    Connection = FrmData.DbF_Eficaz
    SQL.Strings = (
      '')
    Left = 368
    Top = 80
  end
  object Eficaz_pdv: TFDConnection
    Left = 584
    Top = 112
  end
  object Fdac_Temp: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 160
    Top = 288
  end
end
