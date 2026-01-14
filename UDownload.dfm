object FrmDownload: TFrmDownload
  Left = 441
  Top = 262
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Atualiza'#231#227'o de Vers'#227'o'
  ClientHeight = 116
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = True
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    447
    116)
  PixelsPerInch = 96
  TextHeight = 13
  object lConnectionInfo: TLabel
    Left = 345
    Top = 383
    Width = 77
    Height = 13
    Alignment = taRightJustify
    Caption = 'Connection Info'
    Color = clBtnFace
    ParentColor = False
    Visible = False
  end
  object lFile: TLabel
    Left = 24
    Top = 320
    Width = 61
    Height = 13
    Caption = 'Pasta Detino'
    Color = clBtnFace
    ParentColor = False
  end
  object Label1: TLabel
    Left = -76
    Top = 92
    Width = 49
    Height = 13
    Anchors = [akRight, akBottom]
    Caption = 'BufferSize'
    Color = clBtnFace
    ParentColor = False
    Visible = False
    ExplicitLeft = -91
    ExplicitTop = 88
  end
  object Label2: TLabel
    Left = 24
    Top = 240
    Width = 69
    Height = 13
    Caption = 'URL Download'
    Color = clBtnFace
    ParentColor = False
  end
  object Bevel1: TBevel
    Left = 6
    Top = 78
    Width = 436
    Height = 4
    Shape = bsTopLine
  end
  object Label11: TLabel
    Left = 138
    Top = 63
    Width = 3
    Height = 13
    Color = clBtnFace
    ParentColor = False
  end
  object LabelPdv: TLabel
    Left = 160
    Top = 88
    Width = 3
    Height = 13
    Visible = False
  end
  object edURL: TComboBox
    Left = 24
    Top = 255
    Width = 399
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Text = 'ftp://arilmaqmatriz.ddns.info:2121/Eficaz.zip'
  end
  object bDownload: TBitBtn
    Left = 6
    Top = 9
    Width = 99
    Height = 26
    Caption = 'Download'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33333333333333333333EEEEEEEEEEEEEEE333FFFFFFFFFFFFF3E00000000000
      00E337777777777777F3E0F77777777770E337F33333333337F3E0F333333333
      70E337F3333F333337F3E0F33303333370E337F3337FF33337F3E0F333003333
      70E337F33377FF3337F3E0F33300033370E337F333777FF337F3E0F333000033
      70E337F33377773337F3E0F33300033370E337F33377733337F3E0F333003333
      70E337F33377333337F3E0F33303333370E337F33373333337F3E0F333333333
      70E337F33333333337F3E0FFFFFFFFFFF0E337FFFFFFFFFFF7F3E00000000000
      00E33777777777777733EEEEEEEEEEEEEEE33333333333333333}
    NumGlyphs = 2
    TabOrder = 1
    OnClick = bDownloadClick
  end
  object bStop: TBitBtn
    Left = 340
    Top = 9
    Width = 99
    Height = 26
    Anchors = [akTop, akRight]
    Caption = 'Stop'
    Enabled = False
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33333333333333333333EEEEEEEEEEEEEEE333FFFFFFFFFFFFF3E00000000000
      00E337777777777777F3E0F77777777770E337F33333333337F3E0F333333333
      70E337F33333333337F3E0F33333333370E337F333FFFFF337F3E0F330000033
      70E337F3377777F337F3E0F33000003370E337F3377777F337F3E0F330000033
      70E337F3377777F337F3E0F33000003370E337F3377777F337F3E0F330000033
      70E337F33777773337F3E0F33333333370E337F33333333337F3E0F333333333
      70E337F33333333337F3E0FFFFFFFFFFF0E337FFFFFFFFFFF7F3E00000000000
      00E33777777777777733EEEEEEEEEEEEEEE33333333333333333}
    NumGlyphs = 2
    TabOrder = 2
    OnClick = bStopClick
  end
  object ProgressBar1: TProgressBar
    Left = 6
    Top = 42
    Width = 435
    Height = 20
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
  end
  object edFile: TEdit
    Left = 24
    Top = 339
    Width = 399
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 4
    Text = '.\Atualizar\'
  end
  object cbxBufferSize: TComboBox
    Left = 242
    Top = 91
    Width = 100
    Height = 21
    Style = csDropDownList
    Anchors = [akLeft, akBottom]
    ItemIndex = 6
    TabOrder = 5
    Text = '65536'
    Visible = False
    OnChange = cbxBufferSizeChange
    Items.Strings = (
      '1024'
      '2048'
      '4096'
      '8192'
      '16384'
      '32768'
      '65536')
  end
  object edtProt: TComboBox
    Left = 27
    Top = 119
    Width = 101
    Height = 21
    Style = csDropDownList
    Anchors = [akLeft, akTop, akRight]
    ItemIndex = 1
    TabOrder = 6
    Text = 'FTP'
    OnChange = edtProtChange
    Items.Strings = (
      'HTTP'
      'FTP')
  end
  object GroupBox1: TGroupBox
    Left = 23
    Top = 138
    Width = 399
    Height = 98
    Caption = 'FTP '
    Enabled = False
    TabOrder = 7
    DesignSize = (
      399
      98)
    object Label3: TLabel
      Left = 12
      Top = 16
      Width = 22
      Height = 13
      Caption = 'Host'
      Color = clBtnFace
      ParentColor = False
    end
    object Label4: TLabel
      Left = 203
      Top = 16
      Width = 26
      Height = 13
      Caption = 'Porta'
      Color = clBtnFace
      ParentColor = False
    end
    object Label5: TLabel
      Left = 12
      Top = 52
      Width = 36
      Height = 13
      Caption = 'Usu'#225'rio'
      Color = clBtnFace
      ParentColor = False
    end
    object Label6: TLabel
      Left = 203
      Top = 52
      Width = 30
      Height = 13
      Caption = 'Senha'
      Color = clBtnFace
      ParentColor = False
    end
    object edtHost: TEdit
      Left = 12
      Top = 32
      Width = 187
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Text = '10.0.0.55'
    end
    object edtPort: TEdit
      Left = 201
      Top = 32
      Width = 187
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Text = '21'
    end
    object edtUser: TEdit
      Left = 12
      Top = 68
      Width = 187
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Text = 'eficazcotacoes1'
    end
    object edtPass: TEdit
      Left = 201
      Top = 68
      Width = 187
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      Text = 'atu37411478'
    end
  end
  object GroupBox2: TGroupBox
    Left = 428
    Top = 138
    Width = 399
    Height = 98
    Caption = 'Proxy'
    TabOrder = 8
    DesignSize = (
      399
      98)
    object Label7: TLabel
      Left = 12
      Top = 16
      Width = 22
      Height = 13
      Caption = 'Host'
      Color = clBtnFace
      ParentColor = False
    end
    object Label8: TLabel
      Left = 203
      Top = 16
      Width = 26
      Height = 13
      Caption = 'Porta'
      Color = clBtnFace
      ParentColor = False
    end
    object Label9: TLabel
      Left = 12
      Top = 52
      Width = 36
      Height = 13
      Caption = 'Usu'#225'rio'
      Color = clBtnFace
      ParentColor = False
    end
    object Label10: TLabel
      Left = 203
      Top = 52
      Width = 30
      Height = 13
      Caption = 'Senha'
      Color = clBtnFace
      ParentColor = False
    end
    object edtProxyHost: TEdit
      Left = 12
      Top = 32
      Width = 187
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Text = 'ftp://10.0.0.55'
    end
    object edtProxyPort: TEdit
      Left = 201
      Top = 32
      Width = 187
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Text = '21'
    end
    object edtProxyUser: TEdit
      Left = 12
      Top = 68
      Width = 187
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Text = 'eficaz'
    end
    object edtProxyPass: TEdit
      Left = 201
      Top = 68
      Width = 187
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      Text = 'atu37411478'
    end
  end
  object CheckBox1: TCheckBox
    Left = 23
    Top = 381
    Width = 132
    Height = 17
    Caption = 'Fechar ap'#243's download'
    Checked = True
    State = cbChecked
    TabOrder = 9
    Visible = False
  end
  object btnRetorna: TBitBtn
    Left = 348
    Top = 82
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
    TabOrder = 10
    OnClick = btnRetornaClick
  end
  object edArq: TEdit
    Left = 26
    Top = 293
    Width = 397
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 11
    Text = 'Eficaz.zip'
  end
  object fACBrDownload: TACBrDownload
    SizeRecvBuffer = 0
    Proxy.ProxyTimeout = 90000
    FTP.FtpTimeout = 6000
    Protocolo = protFTP
    OnHookStatus = HookStatus
    OnHookMonitor = HookMonitor
    Left = 30
    Top = 78
  end
  object IdFTP1: TIdFTP
    OnWork = IdFTP1Work
    OnWorkBegin = IdFTP1WorkBegin
    IPVersion = Id_IPv4
    TransferType = ftBinary
    ListenTimeout = 30000
    NATKeepAlive.UseKeepAlive = False
    NATKeepAlive.IdleTimeMS = 0
    NATKeepAlive.IntervalMS = 0
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    Left = 72
    Top = 56
  end
  object VerificaPdvs: TFDConnection
    Left = 20
    Top = 416
  end
  object QPdv: TFDQuery
    Connection = VerificaPdvs
    FetchOptions.AssignedValues = [evItems, evRecsMax, evRowsetSize, evCache, evCursorKind, evAutoFetchAll]
    FetchOptions.CursorKind = ckDefault
    FetchOptions.RowsetSize = 1000
    FetchOptions.AutoFetchAll = afDisable
    Left = 88
    Top = 416
  end
  object QImpressoras: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      'SELECT * FROM licenca_if'
      'WHERE serial LIKE '#39'VR%'#39
      'AND length(banco) > 0'
      'AND length(ip) > 0'
      'AND length(senha) > 0'
      'AND length(usuario) > 0'
      'AND length(porta) > 0'
      'ORDER BY num_ecf')
    Left = 152
    Top = 416
  end
  object IdTCPClient1: TIdTCPClient
    ConnectTimeout = 0
    IPVersion = Id_IPv4
    Port = 0
    ReadTimeout = -1
    Left = 235
    Top = 424
  end
end
