object FrmEnvio_Email: TFrmEnvio_Email
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Envio de Email com Autentica'#231#227'o'
  ClientHeight = 549
  ClientWidth = 655
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
  object Label1: TLabel
    Left = 6
    Top = 9
    Width = 98
    Height = 13
    Caption = 'Nome do Remetente'
  end
  object Label2: TLabel
    Left = 6
    Top = 35
    Width = 95
    Height = 13
    Caption = 'Email do Remetente'
  end
  object Label3: TLabel
    Left = 6
    Top = 61
    Width = 69
    Height = 13
    Caption = 'Servidor SMTP'
  end
  object Label4: TLabel
    Left = 6
    Top = 87
    Width = 26
    Height = 13
    Caption = 'Porta'
  end
  object Label5: TLabel
    Left = 6
    Top = 113
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
  object Label6: TLabel
    Left = 6
    Top = 139
    Width = 36
    Height = 13
    Caption = 'Usu'#225'rio'
  end
  object Label7: TLabel
    Left = 6
    Top = 165
    Width = 30
    Height = 13
    Caption = 'Senha'
  end
  object Label8: TLabel
    Left = 6
    Top = 191
    Width = 100
    Height = 13
    Caption = 'Email do Destinat'#225'rio'
  end
  object Label9: TLabel
    Left = 6
    Top = 217
    Width = 39
    Height = 13
    Caption = 'Assunto'
  end
  object Label10: TLabel
    Left = 6
    Top = 243
    Width = 51
    Height = 13
    Caption = 'Mensagem'
  end
  object Anexo: TLabel
    Left = 6
    Top = 347
    Width = 31
    Height = 13
    Caption = 'Anexo'
  end
  object mLog: TMemo
    Left = 6
    Top = 399
    Width = 635
    Height = 96
    ReadOnly = True
    TabOrder = 16
  end
  object Button6: TButton
    Left = 446
    Top = 6
    Width = 195
    Height = 73
    Caption = 'Alterna Configura'#231#227'o'
    TabOrder = 0
    OnClick = Button6Click
  end
  object cbHTML: TCheckBox
    Left = 6
    Top = 373
    Width = 201
    Height = 17
    Caption = 'Mensagem no Formato HTML'
    Checked = True
    State = cbChecked
    TabOrder = 15
  end
  object edtSenderName: TEdit
    Left = 112
    Top = 6
    Width = 321
    Height = 21
    TabOrder = 1
    OnKeyDown = edtSenderNameKeyDown
  end
  object edtSenderAddress: TEdit
    Left = 112
    Top = 32
    Width = 321
    Height = 21
    TabOrder = 2
    OnKeyDown = edtSenderNameKeyDown
  end
  object edtHost: TEdit
    Left = 112
    Top = 58
    Width = 321
    Height = 21
    TabOrder = 3
    OnKeyDown = edtSenderNameKeyDown
  end
  object edtPort: TEdit
    Left = 112
    Top = 84
    Width = 49
    Height = 21
    TabOrder = 4
    Text = '25'
    OnKeyDown = edtSenderNameKeyDown
  end
  object rbAuthNone: TRadioButton
    Left = 112
    Top = 110
    Width = 113
    Height = 17
    Caption = 'Nenhuma'
    TabOrder = 5
    OnKeyDown = edtSenderNameKeyDown
  end
  object rbAuthDefault: TRadioButton
    Left = 250
    Top = 110
    Width = 113
    Height = 17
    Caption = 'Padr'#227'o'
    Checked = True
    TabOrder = 6
    TabStop = True
    OnKeyDown = edtSenderNameKeyDown
  end
  object rbAuthSSL: TRadioButton
    Left = 389
    Top = 110
    Width = 113
    Height = 17
    Caption = 'SSL'
    TabOrder = 7
    OnKeyDown = edtSenderNameKeyDown
  end
  object rbAuthTLS: TRadioButton
    Left = 528
    Top = 110
    Width = 113
    Height = 17
    Caption = 'TLS'
    TabOrder = 8
    OnKeyDown = edtSenderNameKeyDown
  end
  object edtUsername: TEdit
    Left = 112
    Top = 136
    Width = 321
    Height = 21
    TabOrder = 9
    OnKeyDown = edtSenderNameKeyDown
  end
  object edtPassword: TEdit
    Left = 112
    Top = 162
    Width = 73
    Height = 21
    PasswordChar = '*'
    TabOrder = 10
    Text = 'ss151002'
    OnKeyDown = edtSenderNameKeyDown
  end
  object edtRecipients: TEdit
    Left = 112
    Top = 188
    Width = 321
    Height = 21
    TabOrder = 11
    OnKeyDown = edtSenderNameKeyDown
  end
  object edtSubject: TEdit
    Left = 112
    Top = 214
    Width = 321
    Height = 21
    TabOrder = 12
    Text = 'Cliente Eficaz'
    OnKeyDown = edtSenderNameKeyDown
  end
  object mBody: TMemo
    Left = 112
    Top = 240
    Width = 529
    Height = 96
    TabOrder = 13
  end
  object edtAttach: TEdit
    Left = 112
    Top = 344
    Width = 401
    Height = 21
    TabOrder = 14
    OnKeyDown = edtSenderNameKeyDown
  end
  object Panel1: TPanel
    Left = 0
    Top = 508
    Width = 655
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 17
    ExplicitTop = 504
    ExplicitWidth = 649
    object btnRetorna: TBitBtn
      Left = 570
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
      ModalResult = 2
      NumGlyphs = 2
      TabOrder = 1
    end
    object btnExecuta: TBitBtn
      Left = 490
      Top = 8
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
      TabOrder = 0
      OnClick = btnExecutaClick
    end
  end
  object IdSMTP: TIdSMTP
    OnStatus = IdSMTPStatus
    IOHandler = idHandle
    OnFailedRecipient = IdSMTPFailedRecipient
    SASLMechanisms = <>
    Left = 8
    Top = 272
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
    Left = 43
    Top = 272
  end
  object idHandle: TIdSSLIOHandlerSocketOpenSSL
    OnStatus = idHandleStatus
    Destination = ':25'
    MaxLineAction = maException
    Port = 25
    DefaultPort = 0
    SSLOptions.Method = sslvSSLv2
    SSLOptions.SSLVersions = [sslvSSLv2]
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    OnStatusInfo = idHandleStatusInfo
    Left = 80
    Top = 272
  end
end
