object FrmConfig_NFe: TFrmConfig_NFe
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Configura'#231#227'o NFe/NFC-e'
  ClientHeight = 586
  ClientWidth = 575
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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label6: TLabel
    Left = 10
    Top = 396
    Width = 110
    Height = 13
    Caption = 'Informa'#231#245'es Adicionais'
  end
  object Panel1: TPanel
    Left = 0
    Top = 545
    Width = 575
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object btnRetorna: TBitBtn
      Left = 482
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
      NumGlyphs = 2
      TabOrder = 1
      OnClick = btnRetornaClick
    end
    object btnExecuta: TBitBtn
      Left = 383
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
  object GroupBox2: TGroupBox
    Left = 6
    Top = 9
    Width = 293
    Height = 233
    Caption = 'Certificado'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 41
      Height = 13
      Caption = 'Caminho'
    end
    object Label2: TLabel
      Left = 8
      Top = 56
      Width = 30
      Height = 13
      Caption = 'Senha'
    end
    object sbtnCaminhoCert: TSpeedButton
      Left = 221
      Top = 32
      Width = 23
      Height = 21
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
        333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
        0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
        07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
        0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
        B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
        3BB33773333773333773B333333B3333333B7333333733333337}
      NumGlyphs = 2
      OnClick = sbtnCaminhoCertClick
    end
    object Label25: TLabel
      Left = 8
      Top = 96
      Width = 103
      Height = 13
      Caption = 'N'#250'mero de S'#233'rie/Tipo'
    end
    object sbtnGetCert: TSpeedButton
      Left = 205
      Top = 112
      Width = 23
      Height = 21
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
        333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
        0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
        07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
        0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
        B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
        3BB33773333773333773B333333B3333333B7333333733333337}
      NumGlyphs = 2
      OnClick = sbtnGetCertClick
    end
    object Label13: TLabel
      Left = 8
      Top = 136
      Width = 68
      Height = 13
      Caption = 'IdCSC(NFC-e)'
    end
    object Label14: TLabel
      Left = 8
      Top = 174
      Width = 58
      Height = 13
      Caption = 'CSC(NFC-e)'
    end
    object Label7: TLabel
      Left = 205
      Top = 56
      Width = 43
      Height = 13
      Caption = 'Time Out'
    end
    object edtCaminho: TEdit
      Left = 8
      Top = 32
      Width = 211
      Height = 21
      TabOrder = 0
    end
    object edtSenha: TEdit
      Left = 8
      Top = 72
      Width = 191
      Height = 21
      MaxLength = 20
      PasswordChar = '*'
      TabOrder = 1
    end
    object edtNumSerie: TEdit
      Left = 8
      Top = 112
      Width = 193
      Height = 21
      TabOrder = 3
      OnKeyPress = edtNumSerieKeyPress
    end
    object cbCriptografia: TCheckBox
      Left = 10
      Top = 213
      Width = 114
      Height = 17
      Caption = 'Criptografia 2048'
      TabOrder = 6
    end
    object IdCSC: TEdit
      Left = 8
      Top = 152
      Width = 234
      Height = 21
      MaxLength = 8
      PasswordChar = '*'
      TabOrder = 4
    end
    object CSC: TEdit
      Left = 8
      Top = 190
      Width = 234
      Height = 21
      MaxLength = 40
      PasswordChar = '*'
      TabOrder = 5
    end
    object tp_certificado: TComboBox
      Left = 238
      Top = 112
      Width = 50
      Height = 21
      TabOrder = 7
      Items.Strings = (
        ''
        'A1'
        'A3'
        'USB/TOKEN')
    end
    object EdtTimeOut: TEdit
      Left = 205
      Top = 72
      Width = 85
      Height = 21
      MaxLength = 8
      TabOrder = 2
    end
  end
  object gbProxy: TGroupBox
    Left = 8
    Top = 248
    Width = 250
    Height = 105
    Caption = 'Proxy'
    TabOrder = 1
    object Label8: TLabel
      Left = 8
      Top = 16
      Width = 22
      Height = 13
      Caption = 'Host'
    end
    object Label9: TLabel
      Left = 192
      Top = 16
      Width = 26
      Height = 13
      Caption = 'Porta'
    end
    object Label10: TLabel
      Left = 8
      Top = 56
      Width = 36
      Height = 13
      Caption = 'Usu'#225'rio'
    end
    object Label11: TLabel
      Left = 130
      Top = 56
      Width = 30
      Height = 13
      Caption = 'Senha'
    end
    object edtProxyHost: TEdit
      Left = 8
      Top = 32
      Width = 177
      Height = 21
      TabOrder = 0
    end
    object edtProxyPorta: TEdit
      Left = 192
      Top = 32
      Width = 50
      Height = 21
      TabOrder = 1
    end
    object edtProxyUser: TEdit
      Left = 8
      Top = 72
      Width = 114
      Height = 21
      TabOrder = 2
    end
    object edtProxySenha: TEdit
      Left = 128
      Top = 72
      Width = 114
      Height = 21
      PasswordChar = '*'
      TabOrder = 3
    end
  end
  object GroupBox5: TGroupBox
    Left = 311
    Top = 9
    Width = 250
    Height = 261
    Caption = 'Email'
    TabOrder = 2
    object Label3: TLabel
      Left = 8
      Top = 16
      Width = 69
      Height = 13
      Caption = 'Servidor SMTP'
    end
    object Label4: TLabel
      Left = 198
      Top = 16
      Width = 26
      Height = 13
      Caption = 'Porta'
    end
    object Label5: TLabel
      Left = 8
      Top = 56
      Width = 36
      Height = 13
      Caption = 'Usu'#225'rio'
    end
    object Label26: TLabel
      Left = 129
      Top = 56
      Width = 30
      Height = 13
      Caption = 'Senha'
    end
    object Label27: TLabel
      Left = 8
      Top = 96
      Width = 122
      Height = 13
      Caption = 'Assunto do email enviado'
    end
    object Label28: TLabel
      Left = 8
      Top = 168
      Width = 93
      Height = 13
      Caption = 'Mensagem do Email'
    end
    object edtSmtpHost: TEdit
      Left = 8
      Top = 32
      Width = 185
      Height = 21
      TabOrder = 0
    end
    object edtSmtpPort: TEdit
      Left = 198
      Top = 32
      Width = 40
      Height = 21
      TabOrder = 1
    end
    object edtSmtpUser: TEdit
      Left = 8
      Top = 72
      Width = 110
      Height = 21
      TabOrder = 2
    end
    object edtSmtpPass: TEdit
      Left = 129
      Top = 72
      Width = 110
      Height = 21
      PasswordChar = '*'
      TabOrder = 3
    end
    object edtEmailAssunto: TEdit
      Left = 8
      Top = 112
      Width = 230
      Height = 21
      TabOrder = 4
    end
    object cbEmailSSL: TCheckBox
      Left = 10
      Top = 144
      Width = 167
      Height = 17
      Caption = 'SMTP exige conex'#227'o segura'
      TabOrder = 5
    end
    object mmEmailMsg: TMemo
      Left = 8
      Top = 186
      Width = 230
      Height = 71
      TabOrder = 6
    end
  end
  object Chk_Separar: TCheckBox
    Left = 10
    Top = 523
    Width = 167
    Height = 17
    Caption = 'Separar Notas por Cpf/Cnpj'
    TabOrder = 4
  end
  object Chk_Mensal: TCheckBox
    Left = 183
    Top = 523
    Width = 116
    Height = 17
    Caption = 'Criar Pasta mensal'
    TabOrder = 5
  end
  object BitBtn1: TBitBtn
    Left = 352
    Top = 367
    Width = 113
    Height = 25
    Caption = 'Enviar Email-Teste'
    TabOrder = 6
    OnClick = BitBtn1Click
  end
  object email_teste: TEdit
    Left = 8
    Top = 369
    Width = 324
    Height = 21
    TabOrder = 7
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 415
    Width = 553
    Height = 106
    ActivePage = TabSheet1
    TabOrder = 8
    object TabSheet1: TTabSheet
      Caption = 'Informa'#231#245'es Adicionais I'
      object Inf_Adicional: TMemo
        Left = 3
        Top = 5
        Width = 532
        Height = 65
        TabOrder = 0
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Informa'#231#245'es Adicionais II'
      ImageIndex = 1
      object Inf_Adicional2: TMemo
        Left = 3
        Top = 5
        Width = 532
        Height = 65
        TabOrder = 0
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Informa'#231#245'es Adicionais (Produtor Rural)'
      ImageIndex = 2
      object Inf_Adicional_Pr: TMemo
        Left = 3
        Top = 5
        Width = 532
        Height = 65
        TabOrder = 0
      end
    end
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*-nfe.XML'
    Filter = 
      'Arquivos NFE (*-nfe.XML)|*-nfe.XML|Arquivos XML (*.XML)|*.XML|To' +
      'dos os Arquivos (*.*)|*.*'
    Title = 'Selecione a NFe'
    Left = 269
    Top = 316
  end
  object QRel: TFDQuery
    Connection = FrmData.DbF_Eficaz
    Left = 472
    Top = 296
  end
end
