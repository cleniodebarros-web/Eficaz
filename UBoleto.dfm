object FrmBoleto: TFrmBoleto
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Gerar Boleto'
  ClientHeight = 292
  ClientWidth = 618
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 6
    Top = 9
    Width = 609
    Height = 63
    Caption = 'Informa'#231#245'es Sobre a Cobran'#231'a'
    TabOrder = 0
    object Label2: TLabel
      Left = 6
      Top = 16
      Width = 67
      Height = 13
      Caption = 'Esp'#233'cie Docto'
    end
    object Label3: TLabel
      Left = 159
      Top = 16
      Width = 71
      Height = 13
      Caption = 'Esp'#233'cie Moeda'
    end
    object Label4: TLabel
      Left = 368
      Top = 16
      Width = 30
      Height = 13
      Caption = 'Aceite'
    end
    object Label5: TLabel
      Left = 560
      Top = 16
      Width = 39
      Height = 13
      Caption = 'Carteira'
    end
    object edtEspecieDoc: TEdit
      Left = 6
      Top = 32
      Width = 73
      Height = 21
      TabOrder = 0
      Text = 'DM'
    end
    object edtEspecieMod: TEdit
      Left = 159
      Top = 32
      Width = 76
      Height = 21
      TabOrder = 1
      Text = '$'
    end
    object cbxAceite: TComboBox
      Left = 368
      Top = 32
      Width = 73
      Height = 21
      TabOrder = 2
      Text = 'Sim'
      Items.Strings = (
        'Sim'
        'N'#227'o')
    end
    object edtCarteira: TEdit
      Left = 560
      Top = 32
      Width = 41
      Height = 21
      TabOrder = 3
      Text = '09'
    end
  end
  object GroupBox3: TGroupBox
    Left = 6
    Top = 87
    Width = 609
    Height = 114
    Caption = 'Mensagens/Instru'#231#245'es'
    TabOrder = 1
    object Label15: TLabel
      Left = 320
      Top = 16
      Width = 55
      Height = 13
      Caption = 'Instru'#231#227'o 1'
    end
    object Label16: TLabel
      Left = 464
      Top = 16
      Width = 55
      Height = 13
      Caption = 'Instru'#231#227'o 2'
    end
    object memMensagem: TMemo
      Left = 8
      Top = 16
      Width = 305
      Height = 89
      Lines.Strings = (
        '')
      TabOrder = 0
    end
    object edtInstrucoes1: TEdit
      Left = 321
      Top = 35
      Width = 137
      Height = 21
      TabOrder = 1
    end
    object edtInstrucoes2: TEdit
      Left = 464
      Top = 35
      Width = 137
      Height = 21
      TabOrder = 2
    end
    object Panel2: TPanel
      Left = 320
      Top = 64
      Width = 281
      Height = 41
      Caption = '* Informar o C'#243'digo da Instru'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 251
    Width = 618
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 6
    object btnRetorna: TBitBtn
      Left = 539
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
      Left = 459
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
      ModalResult = 1
      NumGlyphs = 2
      TabOrder = 0
      OnClick = btnExecutaClick
    end
  end
  object Gerar_HTML: TCheckBox
    Left = 176
    Top = 217
    Width = 97
    Height = 17
    Caption = 'Gerar HTML'
    TabOrder = 3
  end
  object Gerar_PDF: TCheckBox
    Left = 347
    Top = 217
    Width = 97
    Height = 17
    Caption = 'Gerar PDF'
    TabOrder = 4
  end
  object Gerar_Remessa: TCheckBox
    Left = 518
    Top = 217
    Width = 97
    Height = 17
    Caption = 'Gerar Remessa'
    TabOrder = 5
  end
  object Imprimir: TCheckBox
    Left = 6
    Top = 217
    Width = 97
    Height = 17
    Caption = 'Imprimir'
    Checked = True
    State = cbChecked
    TabOrder = 2
  end
  object ACBrBoleto1: TACBrBoleto
    Banco.Numero = 748
    Banco.TamanhoMaximoNossoNum = 5
    Banco.TipoCobranca = cobSicred
    Banco.LayoutVersaoArquivo = 81
    Banco.LayoutVersaoLote = 40
    Banco.CasasDecimaisMoraJuros = 2
    Cedente.Nome = 'TodaObra Materias p/ Construcao'
    Cedente.CodigoCedente = '4266443'
    Cedente.Agencia = '0284'
    Cedente.AgenciaDigito = '5'
    Cedente.Conta = '79489'
    Cedente.ContaDigito = '9'
    Cedente.TipoInscricao = pOutras
    NomeArqRemessa = '.'
    NumeroArquivo = 0
    LayoutRemessa = c240
    Configuracoes.Arquivos.LogRegistro = False
    Configuracoes.WebService.SSLHttpLib = httpOpenSSL
    Configuracoes.WebService.StoreName = 'My'
    Configuracoes.WebService.Ambiente = taHomologacao
    Configuracoes.WebService.Operacao = tpInclui
    Configuracoes.WebService.VersaoDF = '1.2'
    Left = 152
    Top = 252
  end
  object ACBrBoletoFCFortes1: TACBrBoletoFCFortes
    Left = 280
    Top = 232
  end
  object QRel: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afDisable
    Left = 64
    Top = 200
  end
  object QBanco: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      'SELECT * FROM BANCOS'
      'WHERE'
      '(BANCO_ID = :BANCO_ID)'
      'AND (EMPRESA_ID = :EMPRESA_ID)'
      'AND (STATUS = '#39'A'#39')')
    Left = 112
    Top = 200
    ParamData = <
      item
        Name = 'BANCO_ID'
        ParamType = ptInput
      end
      item
        Name = 'EMPRESA_ID'
        ParamType = ptInput
      end>
  end
end
