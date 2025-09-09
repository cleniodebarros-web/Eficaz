object FrmRecuperar_Xml: TFrmRecuperar_Xml
  Left = 294
  Top = 175
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Recuperar Xml NFe'
  ClientHeight = 415
  ClientWidth = 649
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object lblStatus: TLabel
    Left = 6
    Top = 165
    Width = 637
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Conectando ao SEFAZ'
    FocusControl = ProgressBar1
    Visible = False
  end
  object ProgressBar1: TProgressBar
    Left = 6
    Top = 191
    Width = 637
    Height = 17
    TabOrder = 1
    Visible = False
  end
  object WebBrowser1: TWebBrowser
    Left = 280
    Top = 8
    Width = 0
    Height = 0
    TabStop = False
    TabOrder = 0
    OnProgressChange = WebBrowser1ProgressChange
    ControlData = {
      4C00000000000000000000000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E12620A000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object Panel2: TPanel
    Left = 6
    Top = 6
    Width = 341
    Height = 101
    TabOrder = 2
    object Label1: TLabel
      Left = 6
      Top = 8
      Width = 156
      Height = 13
      Caption = 'Chave de acesso da nota fiscal: '
    end
    object Label2: TLabel
      Left = 6
      Top = 48
      Width = 169
      Height = 13
      Caption = 'Digite o c'#243'digo da imagem ao lado: '
    end
    object edtChaveNFe: TEdit
      Left = 6
      Top = 24
      Width = 329
      Height = 21
      TabOrder = 0
    end
    object edtCaptcha: TEdit
      Left = 6
      Top = 63
      Width = 73
      Height = 21
      TabOrder = 1
    end
  end
  object Panel3: TPanel
    Left = 6
    Top = 110
    Width = 341
    Height = 49
    TabOrder = 3
    object btnPegarHTML: TButton
      Left = 6
      Top = 11
      Width = 76
      Height = 27
      Caption = 'Pegar HTML'
      Enabled = False
      TabOrder = 0
      OnClick = btnPegarHTMLClick
    end
    object btnNovaConsulta: TButton
      Left = 90
      Top = 11
      Width = 76
      Height = 27
      Caption = 'Nova Consulta'
      Enabled = False
      TabOrder = 1
      OnClick = btnNovaConsultaClick
    end
    object btnGerarXML: TButton
      Left = 175
      Top = 11
      Width = 76
      Height = 27
      Caption = 'Gerar XML'
      Enabled = False
      TabOrder = 2
      OnClick = btnGerarXMLClick
    end
    object btnSair: TButton
      Left = 259
      Top = 11
      Width = 76
      Height = 27
      Caption = 'Sair'
      TabOrder = 3
      OnClick = btnSairClick
    end
  end
  object Panel4: TPanel
    Left = 350
    Top = 6
    Width = 293
    Height = 153
    TabOrder = 4
    object Image1: TImage
      Left = 22
      Top = 9
      Width = 249
      Height = 99
      Center = True
    end
    object Label3: TLabel
      Left = 22
      Top = 113
      Width = 248
      Height = 12
      Cursor = crHandPoint
      Alignment = taCenter
      Caption = 'Clique aqui caso n'#227'o consiga visualizar a imagem'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = Label3Click
    end
  end
  object PageControl1: TPageControl
    Left = 6
    Top = 217
    Width = 637
    Height = 193
    ActivePage = TabSheet1
    TabOrder = 5
    object TabSheet1: TTabSheet
      Caption = 'Dados HTML'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Memo2: TMemo
        Left = 0
        Top = 0
        Width = 629
        Height = 165
        Align = alClient
        ScrollBars = ssBoth
        TabOrder = 0
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Dados XML'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 629
        Height = 165
        Align = alClient
        TabOrder = 0
        object WBXML: TWebBrowser
          Left = 1
          Top = 1
          Width = 627
          Height = 163
          Align = alClient
          TabOrder = 0
          ExplicitWidth = 633
          ControlData = {
            4C000000CD400000D91000000000000000000000000000000000000000000000
            000000004C000000000000000000000001000000E0D057007335CF11AE690800
            2B2E126208000000000000004C0000000114020000000000C000000000000046
            8000000000000000000000000000000000000000000000000000000000000000
            00000000000000000100000000000000000000000000000000000000}
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Sobre'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label4: TLabel
        Left = 0
        Top = 0
        Width = 628
        Height = 39
        Align = alTop
        Alignment = taCenter
        Caption = 
          'O objetivo desta op'#231#227'o '#233' fornecer os dados do DANFE utilizando b' +
          'usca basedo no layout do site da NF-e. Este site sofre modifica'#231 +
          #245'es constantes o que na maioria das vezes faz com que este proje' +
          'to se torne incompat'#237'vel, portanto n'#227'o h'#225' garantias de continuid' +
          'ade e manuten'#231#227'o deste projeto, use-o por conta e risco.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object Label5: TLabel
        Left = 0
        Top = 139
        Width = 501
        Height = 26
        Align = alBottom
        Alignment = taCenter
        Caption = 
          'OS ARQUIVOS GERADOS POR ESTE PROGRAMA N'#195'O SUBSTITUEM O XML ORIGI' +
          'NAL DA NF-E!'#13#10'Solicite aos fornecedores o envio do xml original,' +
          ' al'#233'm de obrigat'#243'rio, '#233' mais seguro.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
    end
  end
end
