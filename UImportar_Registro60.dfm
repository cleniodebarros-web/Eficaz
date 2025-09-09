object FrmImportar_Registros60: TFrmImportar_Registros60
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsSingle
  Caption = 'Importar Registros 60'
  ClientHeight = 317
  ClientWidth = 716
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label19: TLabel
    Left = 120
    Top = 161
    Width = 36
    Height = 13
    Caption = 'Per'#237'odo'
  end
  object Panel1: TPanel
    Left = 0
    Top = 276
    Width = 716
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    ExplicitTop = 335
    ExplicitWidth = 736
    object btnRetorna: TBitBtn
      Left = 622
      Top = 12
      Width = 75
      Height = 25
      Caption = '&Fechar'
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
  object grp1: TGroupBox
    Left = 40
    Top = 10
    Width = 658
    Height = 131
    Caption = 'Ecfs Ativos'
    TabOrder = 1
    object Ecfi001: TCheckBox
      Left = 8
      Top = 16
      Width = 59
      Height = 17
      Caption = 'Ecf001'
      Enabled = False
      TabOrder = 0
      OnClick = Ecfi001Click
    end
    object Ecfi011: TCheckBox
      Left = 8
      Top = 39
      Width = 59
      Height = 17
      Caption = 'Ecf011'
      Enabled = False
      TabOrder = 1
    end
    object Ecfi021: TCheckBox
      Left = 8
      Top = 62
      Width = 59
      Height = 17
      Caption = 'Ecf021'
      Enabled = False
      TabOrder = 2
    end
    object Ecfi022: TCheckBox
      Left = 73
      Top = 62
      Width = 59
      Height = 17
      Caption = 'Ecf022'
      Enabled = False
      TabOrder = 3
    end
    object Ecfi012: TCheckBox
      Left = 73
      Top = 39
      Width = 59
      Height = 17
      Caption = 'Ecf012'
      Enabled = False
      TabOrder = 4
    end
    object Ecfi002: TCheckBox
      Left = 73
      Top = 16
      Width = 59
      Height = 17
      Caption = 'Ecf002'
      Enabled = False
      TabOrder = 5
      OnClick = Ecfi001Click
    end
    object Ecfi003: TCheckBox
      Left = 138
      Top = 16
      Width = 59
      Height = 17
      Caption = 'Ecf003'
      Enabled = False
      TabOrder = 6
      OnClick = Ecfi001Click
    end
    object Ecfi013: TCheckBox
      Left = 138
      Top = 39
      Width = 59
      Height = 17
      Caption = 'Ecf013'
      Enabled = False
      TabOrder = 7
    end
    object Ecfi023: TCheckBox
      Left = 138
      Top = 62
      Width = 59
      Height = 17
      Caption = 'Ecf023'
      Enabled = False
      TabOrder = 8
    end
    object Ecfi024: TCheckBox
      Left = 203
      Top = 62
      Width = 59
      Height = 17
      Caption = 'Ecf024'
      Enabled = False
      TabOrder = 9
    end
    object Ecfi014: TCheckBox
      Left = 203
      Top = 39
      Width = 59
      Height = 17
      Caption = 'Ecf014'
      Enabled = False
      TabOrder = 10
    end
    object Ecfi004: TCheckBox
      Left = 203
      Top = 16
      Width = 59
      Height = 17
      Caption = 'Ecf004'
      Enabled = False
      TabOrder = 11
      OnClick = Ecfi001Click
    end
    object Ecfi025: TCheckBox
      Left = 268
      Top = 62
      Width = 59
      Height = 17
      Caption = 'Ecf025'
      Enabled = False
      TabOrder = 12
    end
    object Ecfi015: TCheckBox
      Left = 268
      Top = 39
      Width = 59
      Height = 17
      Caption = 'Ecf015'
      Enabled = False
      TabOrder = 13
    end
    object Ecfi005: TCheckBox
      Left = 268
      Top = 16
      Width = 59
      Height = 17
      Caption = 'Ecf005'
      Enabled = False
      TabOrder = 14
    end
    object Ecfi026: TCheckBox
      Left = 333
      Top = 62
      Width = 59
      Height = 17
      Caption = 'Ecf026'
      Enabled = False
      TabOrder = 15
    end
    object Ecfi016: TCheckBox
      Left = 333
      Top = 39
      Width = 59
      Height = 17
      Caption = 'Ecf016'
      Enabled = False
      TabOrder = 16
    end
    object Ecfi006: TCheckBox
      Left = 333
      Top = 16
      Width = 59
      Height = 17
      Caption = 'Ecf006'
      Enabled = False
      TabOrder = 17
    end
    object Ecfi007: TCheckBox
      Left = 387
      Top = 16
      Width = 59
      Height = 17
      Caption = 'Ecf007'
      Enabled = False
      TabOrder = 18
    end
    object Ecfi017: TCheckBox
      Left = 387
      Top = 39
      Width = 59
      Height = 17
      Caption = 'Ecf017'
      Enabled = False
      TabOrder = 19
    end
    object Ecfi027: TCheckBox
      Left = 387
      Top = 62
      Width = 59
      Height = 17
      Caption = 'Ecf027'
      Enabled = False
      TabOrder = 20
    end
    object Ecfi028: TCheckBox
      Left = 452
      Top = 62
      Width = 59
      Height = 17
      Caption = 'Ecf028'
      Enabled = False
      TabOrder = 21
    end
    object Ecfi018: TCheckBox
      Left = 452
      Top = 39
      Width = 59
      Height = 17
      Caption = 'Ecf018'
      Enabled = False
      TabOrder = 22
    end
    object Ecfi008: TCheckBox
      Left = 452
      Top = 16
      Width = 59
      Height = 17
      Caption = 'Ecf008'
      Enabled = False
      TabOrder = 23
    end
    object Ecfi009: TCheckBox
      Left = 517
      Top = 16
      Width = 59
      Height = 17
      Caption = 'Ecf009'
      Enabled = False
      TabOrder = 24
    end
    object Ecfi019: TCheckBox
      Left = 517
      Top = 39
      Width = 59
      Height = 17
      Caption = 'Ecf019'
      Enabled = False
      TabOrder = 25
    end
    object Ecfi029: TCheckBox
      Left = 517
      Top = 62
      Width = 59
      Height = 17
      Caption = 'Ecf029'
      Enabled = False
      TabOrder = 26
    end
    object Ecfi030: TCheckBox
      Left = 582
      Top = 62
      Width = 59
      Height = 17
      Caption = 'Ecf030'
      Enabled = False
      TabOrder = 27
    end
    object Ecfi020: TCheckBox
      Left = 582
      Top = 39
      Width = 59
      Height = 17
      Caption = 'Ecf020'
      Enabled = False
      TabOrder = 28
    end
    object Ecfi010: TCheckBox
      Left = 582
      Top = 16
      Width = 59
      Height = 17
      Caption = 'Ecf010'
      Enabled = False
      TabOrder = 29
    end
    object Todas_ecfsi: TCheckBox
      Left = 268
      Top = 109
      Width = 90
      Height = 17
      Caption = 'Todas as Ecfs'
      TabOrder = 30
      OnClick = Todas_ecfsiClick
    end
    object Ecfi031: TCheckBox
      Left = 8
      Top = 85
      Width = 59
      Height = 17
      Caption = 'Ecf031'
      Enabled = False
      TabOrder = 31
    end
    object Ecfi032: TCheckBox
      Left = 73
      Top = 85
      Width = 59
      Height = 17
      Caption = 'Ecf032'
      Enabled = False
      TabOrder = 32
    end
    object Ecfi033: TCheckBox
      Left = 138
      Top = 85
      Width = 59
      Height = 17
      Caption = 'Ecf033'
      Enabled = False
      TabOrder = 33
    end
    object Ecfi034: TCheckBox
      Left = 203
      Top = 85
      Width = 59
      Height = 17
      Caption = 'Ecf034'
      Enabled = False
      TabOrder = 34
    end
    object Ecfi035: TCheckBox
      Left = 268
      Top = 85
      Width = 59
      Height = 17
      Caption = 'Ecf025'
      Enabled = False
      TabOrder = 35
    end
    object Ecfi036: TCheckBox
      Left = 333
      Top = 85
      Width = 59
      Height = 17
      Caption = 'Ecf026'
      Enabled = False
      TabOrder = 36
    end
    object Ecfi037: TCheckBox
      Left = 387
      Top = 85
      Width = 59
      Height = 17
      Caption = 'Ecf027'
      Enabled = False
      TabOrder = 37
    end
    object Ecfi038: TCheckBox
      Left = 452
      Top = 85
      Width = 59
      Height = 17
      Caption = 'Ecf038'
      Enabled = False
      TabOrder = 38
    end
    object Ecfi039: TCheckBox
      Left = 517
      Top = 85
      Width = 59
      Height = 17
      Caption = 'Ecf039'
      Enabled = False
      TabOrder = 39
    end
    object Ecfi040: TCheckBox
      Left = 582
      Top = 85
      Width = 59
      Height = 17
      Caption = 'Ecf040'
      Enabled = False
      TabOrder = 40
    end
  end
  object dtmem: TDateEdit
    Left = 178
    Top = 158
    Width = 90
    Height = 21
    CheckOnExit = True
    DialogTitle = 'Selecione a Data'
    Enabled = False
    NumGlyphs = 2
    TabOrder = 2
  end
  object dtmai: TDateEdit
    Left = 301
    Top = 158
    Width = 90
    Height = 21
    CheckOnExit = True
    DialogTitle = 'Selecione a Data'
    Enabled = False
    NumGlyphs = 2
    TabOrder = 3
  end
  object Button1: TButton
    Left = 411
    Top = 156
    Width = 150
    Height = 25
    Caption = 'Importar Registros 60'
    Enabled = False
    TabOrder = 4
    OnClick = Button1Click
  end
  object ProgressBar: TProgressBar
    Left = 40
    Top = 198
    Width = 658
    Height = 17
    Max = 1000
    TabOrder = 5
    Visible = False
  end
  object DataTabela: TDataSource
    AutoEdit = False
    DataSet = QTabela
    Left = 128
    Top = 251
  end
  object QTabela: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM LICENCA_IF')
    Left = 88
    Top = 248
  end
  object IQuery: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 168
    Top = 224
  end
  object VerificaPdvs: TFDConnection
    Left = 284
    Top = 240
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 236
    Top = 248
  end
  object IdTCPClient1: TIdTCPClient
    ConnectTimeout = 0
    IPVersion = Id_IPv4
    Port = 0
    ReadTimeout = -1
    Left = 388
    Top = 248
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    Left = 340
    Top = 248
  end
  object QUpdate: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      '')
    Left = 440
    Top = 248
  end
  object EventoRetornoImpressora: TFDEventAlerter
    Connection = FrmData.DbF_Eficaz
    Names.Strings = (
      'clientes_ok'
      'produtos_ok'
      'configuracoes_ok'
      'finalizadoras_ok'
      'tributos_ok'
      'operadores_ok'
      'ibpt_ok'
      'reiniciosync_ok')
    OnAlert = EventoRetornoImpressoraAlert
    Left = 488
    Top = 248
  end
  object BatchMove1: TBatchMove
    Left = 16
    Top = 144
  end
  object IQuery_Destino_Pdv: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 208
    Top = 216
  end
  object IQuery_update_pdv: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 248
    Top = 216
  end
  object QTransacoes: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 304
    Top = 216
  end
  object QTransacoes2: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 344
    Top = 216
  end
end
