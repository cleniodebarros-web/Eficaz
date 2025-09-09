object frmRecuperaXml2: TfrmRecuperaXml2
  Left = 458
  Top = 180
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Recuperar XML NF-e'
  ClientHeight = 463
  ClientWidth = 679
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
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
  object PgSefaz: TPageControl
    Left = 8
    Top = 8
    Width = 665
    Height = 449
    ActivePage = tsCaptcha
    TabOrder = 0
    object tsCaptcha: TTabSheet
      Caption = 'Consultar NFe'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object lblStatus: TLabel
        Left = 0
        Top = 158
        Width = 649
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Conectando ao SEFAZ'
        FocusControl = ProgressBar1
        Visible = False
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 351
        Height = 101
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 8
          Width = 155
          Height = 13
          Caption = 'Chave de acesso da nota fiscal: '
        end
        object Label2: TLabel
          Left = 8
          Top = 48
          Width = 169
          Height = 13
          Caption = 'Digite o c'#243'digo da imagem ao lado: '
        end
        object edtChaveNFe: TEdit
          Left = 8
          Top = 24
          Width = 329
          Height = 21
          TabOrder = 0
          OnKeyUp = edtChaveNFeKeyUp
        end
        object edtCaptcha: TEdit
          Left = 8
          Top = 63
          Width = 73
          Height = 21
          TabOrder = 1
          OnKeyUp = edtCaptchaKeyUp
        end
      end
      object Panel4: TPanel
        Left = 353
        Top = -3
        Width = 293
        Height = 156
        TabOrder = 1
        object Image1: TImage
          Left = 15
          Top = 18
          Width = 262
          Height = 105
          Center = True
        end
        object Label3: TLabel
          Left = 1
          Top = 130
          Width = 291
          Height = 25
          Cursor = crHandPoint
          Alignment = taCenter
          AutoSize = False
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
      object Panel3: TPanel
        Left = 0
        Top = 104
        Width = 351
        Height = 49
        TabOrder = 2
        object btnNovaConsulta: TButton
          Left = 86
          Top = 14
          Width = 76
          Height = 27
          Caption = 'Nova Consulta'
          Enabled = False
          TabOrder = 0
          OnClick = btnPegarHTMLClick
        end
        object btnGerarXML: TButton
          Left = 168
          Top = 14
          Width = 76
          Height = 27
          Caption = 'Gerar XML'
          Enabled = False
          TabOrder = 1
          OnClick = btnGerarXMLClick
        end
        object btnPegarHTML: TButton
          Left = 4
          Top = 14
          Width = 76
          Height = 27
          Caption = 'Pegar HTML'
          TabOrder = 2
          OnClick = btnPegarXMLClick
        end
        object btnSair: TButton
          Left = 250
          Top = 14
          Width = 76
          Height = 27
          Caption = 'Sair'
          TabOrder = 3
          OnClick = btnSairClick
        end
      end
      object ProgressBar1: TProgressBar
        Left = 1
        Top = 176
        Width = 644
        Height = 17
        TabOrder = 3
        Visible = False
      end
      object PageControl1: TPageControl
        Left = 4
        Top = 200
        Width = 643
        Height = 193
        ActivePage = TabSheet1
        TabOrder = 4
        object TabSheet1: TTabSheet
          Caption = 'Dados HTML'
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object Memo2: TMemo
            Left = 0
            Top = 0
            Width = 635
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
            Width = 635
            Height = 165
            Align = alClient
            TabOrder = 0
            object WBXML: TWebBrowser
              Left = 1
              Top = 1
              Width = 633
              Height = 163
              Align = alClient
              TabOrder = 0
              ControlData = {
                4C0000006C410000D91000000000000000000000000000000000000000000000
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
            Width = 635
            Height = 65
            Align = alClient
            Caption = 
              'Projeto Recuperar XML'#13#10#13#10'Seu uso tem por objetivo fornecer os da' +
              'dos de NF-e utilizando busca basedo no layout do site da NF-e. E' +
              'ste site sofre modifica'#231#245'es constantes o que na maioria das veze' +
              's faz com que este projeto se torne incompat'#237'vel, portanto n'#227'o h' +
              #225' garantias de continuidade e manuten'#231#227'o deste projeto, use-o po' +
              'r conta e risco.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            WordWrap = True
          end
          object Label5: TLabel
            Left = 0
            Top = 139
            Width = 616
            Height = 26
            Align = alBottom
            Caption = 
              'OS ARQUIVOS GERADOS POR ESTE PROGRAMA N'#195'O SUBSTITUEM O XML ORIGI' +
              'NAL DA NF-E! Solicite aos fornecedores o envio do xml original, ' +
              'al'#233'm de obrigat'#243'rio, '#233' mais seguro.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            WordWrap = True
          end
        end
      end
    end
    object tsConsultaCompleta: TTabSheet
      Caption = '..........'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object WebBrowser1: TWebBrowser
        Left = 0
        Top = 0
        Width = 657
        Height = 420
        TabStop = False
        TabOrder = 0
        OnProgressChange = WebBrowser1ProgressChange
        ControlData = {
          4C000000E7430000692B00000000000000000000000000000000000000000000
          000000004C000000000000000000000001000000E0D057007335CF11AE690800
          2B2E12620A000000000000004C0000000114020000000000C000000000000046
          8000000000000000000000000000000000000000000000000000000000000000
          00000000000000000100000000000000000000000000000000000000}
      end
    end
  end
end
