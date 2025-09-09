object FrmClientes_ligth: TFrmClientes_ligth
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Participantes'
  ClientHeight = 530
  ClientWidth = 759
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  Visible = True
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 759
    Height = 489
    ActivePage = Manutencao
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Consulta: TTabSheet
      Caption = '&Consulta'
      object Alfabeto: TTabSet
        Left = 0
        Top = 440
        Width = 751
        Height = 21
        Align = alBottom
        AutoScroll = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        SoftTop = True
        Style = tsModernTabs
        Tabs.Strings = (
          'A'
          'B'
          'C'
          'D'
          'E'
          'F'
          'G'
          'H'
          'I'
          'J'
          'K'
          'L'
          'M'
          'N'
          'O'
          'P'
          'Q'
          'R'
          'S'
          'T'
          'U'
          'V'
          'W'
          'X'
          'Y'
          'Z'
          'Todos')
        OnClick = AlfabetoClick
      end
      object StatusBar1: TStatusBar
        Left = 0
        Top = 421
        Width = 751
        Height = 19
        Panels = <
          item
            Text = '<F3> - Desativar'
            Width = 177
          end
          item
            Text = '<F4> - Reativar'
            Width = 177
          end
          item
            Text = '<F5> - Localizar p/ C'#243'digo'
            Width = 177
          end
          item
            Text = '<F7> - Localizar p/ Nome'
            Width = 177
          end>
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 751
        Height = 421
        Align = alClient
        Color = clInfoBk
        DataSource = DataTabela
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clBlue
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = DBGrid1DblClick
        OnKeyDown = DBGrid1KeyDown
        OnKeyPress = DBGrid1KeyPress
        OnTitleClick = DBGrid1TitleClick
        Columns = <
          item
            Expanded = False
            FieldName = 'CLIENTE_ID'
            Title.Alignment = taRightJustify
            Title.Caption = 'ID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO_CLIENTE'
            Title.Caption = 'Tp Particip.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Title.Caption = 'Nome'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CNPJ'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TELEFONE_1'
            Title.Caption = 'Telefone'
            Width = 59
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'STATUS'
            Title.Alignment = taCenter
            Title.Caption = 'Status'
            Width = 38
            Visible = True
          end>
      end
    end
    object Manutencao: TTabSheet
      Caption = '&Manuten'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ImageIndex = 1
      ParentFont = False
      OnShow = ManutencaoShow
      object Label3: TLabel
        Left = 10
        Top = 48
        Width = 71
        Height = 13
        Caption = 'Raz'#227'o Social'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label20: TLabel
        Left = 401
        Top = 48
        Width = 96
        Height = 13
        Caption = 'Tipo Participante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 10
        Top = 78
        Width = 71
        Height = 13
        Caption = 'Nome Fantasia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label14: TLabel
        Left = 10
        Top = 107
        Width = 66
        Height = 13
        Caption = 'Ins. Est./RG'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label16: TLabel
        Left = 10
        Top = 134
        Width = 76
        Height = 13
        Caption = 'Ramo/Atividade'
      end
      object Label15: TLabel
        Left = 401
        Top = 78
        Width = 53
        Height = 13
        Caption = 'CNPJ/CPF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 405
        Top = 134
        Width = 43
        Height = 13
        Caption = 'Dt. Ficha'
      end
      object Label21: TLabel
        Left = 1169
        Top = 107
        Width = 27
        Height = 13
        Caption = 'Limite'
      end
      object Label22: TLabel
        Left = 778
        Top = 50
        Width = 50
        Height = 13
        Caption = 'Bloqueado'
      end
      object Label34: TLabel
        Left = 7
        Top = 164
        Width = 58
        Height = 13
        Caption = 'Observa'#231#227'o'
      end
      object Label63: TLabel
        Left = 949
        Top = 51
        Width = 95
        Height = 13
        Caption = 'Bloqueio de Cheque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object Shape1: TShape
        Left = 639
        Top = 47
        Width = 110
        Height = 113
        Brush.Color = clBtnFace
        Pen.Color = clBtnHighlight
        Pen.Style = psDot
        Visible = False
      end
      object Foto: TImage
        Left = 647
        Top = 54
        Width = 97
        Height = 101
        Center = True
        Proportional = True
        Visible = False
      end
      object lbl2: TLabel
        Left = 778
        Top = 78
        Width = 67
        Height = 13
        Caption = 'Limite Cheque'
      end
      object Label48: TLabel
        Left = 994
        Top = 78
        Width = 40
        Height = 13
        Caption = 'Cr'#233'ditos'
        Visible = False
      end
      object Label49: TLabel
        Left = 809
        Top = 213
        Width = 56
        Height = 13
        Caption = 'Tratamento'
      end
      object Label17: TLabel
        Left = 401
        Top = 107
        Width = 39
        Height = 13
        Caption = 'Contato'
      end
      object NOME: TEdit
        Left = 94
        Top = 48
        Width = 301
        Height = 21
        CharCase = ecUpperCase
        Enabled = False
        MaxLength = 90
        TabOrder = 1
        OnKeyDown = NOMEKeyDown
      end
      object FANTASIA: TEdit
        Left = 94
        Top = 78
        Width = 245
        Height = 21
        Enabled = False
        MaxLength = 30
        TabOrder = 3
        OnKeyDown = NOMEKeyDown
      end
      object INSCRICAO: TEdit
        Left = 94
        Top = 107
        Width = 165
        Height = 21
        Enabled = False
        MaxLength = 15
        TabOrder = 5
        OnKeyDown = NOMEKeyDown
      end
      object CNPJ: TMaskEdit
        Left = 471
        Top = 78
        Width = 133
        Height = 21
        CharCase = ecUpperCase
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        Text = ''
        OnKeyDown = NOMEKeyDown
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 751
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object btnPrior: TBitBtn
          Left = 6
          Top = 6
          Width = 75
          Height = 25
          Caption = 'Anterior'
          TabOrder = 0
          OnClick = btnPriorClick
        end
        object btnNext: TBitBtn
          Left = 109
          Top = 6
          Width = 75
          Height = 25
          Caption = 'Pr'#243'ximo'
          TabOrder = 1
          OnClick = btnNextClick
        end
        object btnInsert: TBitBtn
          Left = 213
          Top = 6
          Width = 75
          Height = 25
          Caption = '&Incluir'
          TabOrder = 2
          OnClick = btnInsertClick
        end
        object btnEdit: TBitBtn
          Left = 316
          Top = 6
          Width = 75
          Height = 25
          Caption = 'A&lterar'
          TabOrder = 3
          OnClick = btnEditClick
        end
        object btnDelete: TBitBtn
          Left = 419
          Top = 6
          Width = 75
          Height = 25
          Caption = '&Excluir'
          TabOrder = 4
          OnClick = btnDeleteClick
        end
        object btnSave: TBitBtn
          Left = 529
          Top = 6
          Width = 75
          Height = 25
          Caption = '&Salvar'
          TabOrder = 5
          OnClick = btnSaveClick
        end
        object btnDiscard: TBitBtn
          Left = 627
          Top = 6
          Width = 75
          Height = 25
          Caption = 'C&ancelar'
          TabOrder = 6
          OnClick = btnDiscardClick
        end
      end
      object TIPO_CLIENTE: TComboBox
        Left = 503
        Top = 47
        Width = 151
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 15
        ParentFont = False
        TabOrder = 2
        OnChange = TIPO_CLIENTEChange
        OnKeyDown = TIPO_CLIENTEKeyDown
        Items.Strings = (
          'PESSOA F'#205'SICA'
          'PESSOA JUR'#205'DICA')
      end
      object ATIVIDADE: TEdit
        Left = 94
        Top = 134
        Width = 165
        Height = 21
        Enabled = False
        MaxLength = 30
        TabOrder = 7
        OnKeyDown = NOMEKeyDown
      end
      object TRATAMENTO: TEdit
        Left = 879
        Top = 212
        Width = 157
        Height = 21
        Enabled = False
        MaxLength = 20
        TabOrder = 13
        OnKeyDown = NOMEKeyDown
      end
      object DT_FICHA: TDateEdit
        Left = 471
        Top = 134
        Width = 90
        Height = 21
        CheckOnExit = True
        DialogTitle = 'Selecione a Data'
        Enabled = False
        NumGlyphs = 2
        TabOrder = 9
        OnEnter = DT_FICHAEnter
        OnKeyDown = NOMEKeyDown
      end
      object LIMITE: TRxCalcEdit
        Left = 879
        Top = 158
        Width = 90
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DisplayFormat = '0.00;-0.00'
        Enabled = False
        MaxValue = 99999.990000000000000000
        NumGlyphs = 2
        TabOrder = 12
        ZeroEmpty = False
        OnKeyDown = TIPO_CLIENTEKeyDown
      end
      object BLOQUEADO: TComboBox
        Left = 862
        Top = 50
        Width = 69
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 2
        ParentFont = False
        TabOrder = 14
        OnKeyDown = TIPO_CLIENTEKeyDown
        Items.Strings = (
          ''
          'SIM'
          'N'#195'O')
      end
      object COD_CONTABIL: TEdit
        Left = 265
        Top = 107
        Width = 99
        Height = 21
        Enabled = False
        MaxLength = 20
        TabOrder = 8
        Visible = False
        OnKeyDown = NOMEKeyDown
      end
      object OBSERVACAO: TEdit
        Left = 94
        Top = 161
        Width = 655
        Height = 21
        Enabled = False
        MaxLength = 80
        TabOrder = 10
        Visible = False
        OnKeyDown = NOMEKeyDown
      end
      object PageControl2: TPageControl
        Left = 3
        Top = 189
        Width = 746
        Height = 268
        ActivePage = TabSheet1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 11
        OnDrawTab = PageControl2DrawTab
        object TabSheet1: TTabSheet
          Caption = 'Endere'#231'o Principal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          object Label5: TLabel
            Left = 3
            Top = 9
            Width = 80
            Height = 13
            Caption = 'Endere'#231'o Prin.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label25: TLabel
            Left = 449
            Top = 9
            Width = 44
            Height = 13
            Caption = 'N'#250'mero'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label6: TLabel
            Left = 3
            Top = 35
            Width = 65
            Height = 13
            Caption = 'Complemento'
          end
          object Label7: TLabel
            Left = 450
            Top = 65
            Width = 34
            Height = 13
            Caption = 'Bairro'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label9: TLabel
            Left = 3
            Top = 61
            Width = 53
            Height = 13
            Caption = 'Munic'#237'pio'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label8: TLabel
            Left = 450
            Top = 87
            Width = 38
            Height = 13
            Caption = 'Estado'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label10: TLabel
            Left = 3
            Top = 87
            Width = 20
            Height = 13
            Caption = 'CEP'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label24: TLabel
            Left = 449
            Top = 35
            Width = 53
            Height = 13
            Caption = 'C'#243'd. IBGE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btnIBGE: TSpeedButton
            Left = 574
            Top = 32
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
            OnClick = btnIBGEClick
          end
          object Label18: TLabel
            Left = 3
            Top = 139
            Width = 54
            Height = 13
            Caption = 'Home Page'
          end
          object Label19: TLabel
            Left = 449
            Top = 139
            Width = 28
            Height = 13
            Caption = 'e-mail'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label35: TLabel
            Left = 3
            Top = 113
            Width = 50
            Height = 13
            Caption = 'C'#243'd. Pa'#237's'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btnPais: TSpeedButton
            Left = 147
            Top = 109
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
            OnClick = btnPaisClick
          end
          object Label1: TLabel
            Left = 3
            Top = 165
            Width = 59
            Height = 13
            Caption = 'Telefone 1'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label11: TLabel
            Left = 447
            Top = 165
            Width = 49
            Height = 13
            Caption = 'Tel. 2/Fax'
          end
          object ENDERECO: TEdit
            Left = 84
            Top = 6
            Width = 301
            Height = 21
            Enabled = False
            MaxLength = 60
            TabOrder = 0
            OnKeyDown = NOMEKeyDown
          end
          object NUMERO: TEdit
            Left = 507
            Top = 6
            Width = 56
            Height = 21
            Enabled = False
            MaxLength = 6
            TabOrder = 1
            OnKeyDown = NOMEKeyDown
          end
          object COMPLEMENTO: TEdit
            Left = 84
            Top = 32
            Width = 175
            Height = 21
            Enabled = False
            MaxLength = 20
            TabOrder = 2
            OnKeyDown = NOMEKeyDown
          end
          object BAIRRO: TEdit
            Left = 508
            Top = 58
            Width = 175
            Height = 21
            Enabled = False
            MaxLength = 40
            TabOrder = 5
            OnKeyDown = NOMEKeyDown
          end
          object MUNICIPIO: TEdit
            Left = 84
            Top = 58
            Width = 175
            Height = 21
            Enabled = False
            MaxLength = 30
            TabOrder = 4
            OnKeyDown = NOMEKeyDown
          end
          object ESTADO: TComboBox
            Left = 508
            Top = 84
            Width = 56
            Height = 21
            CharCase = ecUpperCase
            Color = clWhite
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 2
            ParentFont = False
            TabOrder = 7
            OnKeyDown = TIPO_CLIENTEKeyDown
            Items.Strings = (
              'AC'
              'AL'
              'AP'
              'AM'
              'BA'
              'CE'
              'DF'
              'ES'
              'GO'
              'MA'
              'MG'
              'MT'
              'MS'
              'PA'
              'PB'
              'PR'
              'PE'
              'PI'
              'RJ'
              'RN'
              'RS'
              'RO'
              'RR'
              'SC'
              'SP'
              'SE'
              'TO')
          end
          object CEP: TMaskEdit
            Left = 84
            Top = 84
            Width = 67
            Height = 21
            CharCase = ecUpperCase
            Color = clWhite
            Enabled = False
            EditMask = '99999-999;1;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 9
            ParentFont = False
            TabOrder = 6
            Text = '     -   '
            OnKeyDown = NOMEKeyDown
          end
          object IBGE: TEdit
            Left = 507
            Top = 32
            Width = 61
            Height = 21
            Enabled = False
            MaxLength = 7
            TabOrder = 3
            OnExit = IBGEExit
            OnKeyDown = NOMEKeyDown
          end
          object URL: TEdit
            Left = 84
            Top = 135
            Width = 301
            Height = 21
            CharCase = ecLowerCase
            Enabled = False
            MaxLength = 80
            TabOrder = 9
            OnKeyDown = NOMEKeyDown
          end
          object EMAIL: TEdit
            Left = 507
            Top = 136
            Width = 175
            Height = 21
            CharCase = ecLowerCase
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 120
            ParentFont = False
            TabOrder = 10
            OnKeyDown = NOMEKeyDown
          end
          object COD_PAIS: TEdit
            Left = 84
            Top = 109
            Width = 56
            Height = 21
            Enabled = False
            MaxLength = 5
            TabOrder = 8
            OnKeyDown = NOMEKeyDown
          end
          object TELEFONE_2: TMaskEdit
            Left = 507
            Top = 162
            Width = 75
            Height = 21
            CharCase = ecUpperCase
            Enabled = False
            EditMask = '99999-9999;1;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 10
            ParentFont = False
            TabOrder = 13
            Text = '     -    '
            OnKeyDown = NOMEKeyDown
          end
          object FAX: TMaskEdit
            Left = 599
            Top = 162
            Width = 86
            Height = 21
            CharCase = ecUpperCase
            Enabled = False
            EditMask = '(99) 9999-9999;1;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 14
            ParentFont = False
            TabOrder = 14
            Text = '(  )     -    '
            OnKeyDown = NOMEKeyDown
          end
          object DDD: TMaskEdit
            Left = 85
            Top = 162
            Width = 26
            Height = 21
            CharCase = ecUpperCase
            Enabled = False
            EditMask = '(99);1;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 4
            ParentFont = False
            TabOrder = 11
            Text = '(  )'
            OnChange = DDDChange
            OnKeyDown = NOMEKeyDown
          end
          object Repetir_Endereco: TCheckBox
            Left = 3
            Top = 214
            Width = 222
            Height = 17
            Caption = 'Repetir dados no endere'#231'o de cobran'#231'a'
            TabOrder = 16
            Visible = False
            OnClick = Repetir_EnderecoClick
          end
          object chk_0800: TCheckBox
            Left = 85
            Top = 189
            Width = 87
            Height = 17
            Caption = 'Celular/0800'
            Enabled = False
            TabOrder = 15
            Visible = False
            OnClick = chk_0800Click
          end
          object TELEFONE_1: TMaskEdit
            Left = 117
            Top = 162
            Width = 77
            Height = 21
            CharCase = ecUpperCase
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 15
            ParentFont = False
            TabOrder = 12
            Text = ''
            OnKeyDown = NOMEKeyDown
          end
        end
        object TabSheet2: TTabSheet
          Caption = 'Endere'#231'o de Cobran'#231'a'
          ImageIndex = 1
          TabVisible = False
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object Label27: TLabel
            Left = 6
            Top = 9
            Width = 75
            Height = 13
            Caption = 'Endere'#231'o Cobr.'
          end
          object Label28: TLabel
            Left = 449
            Top = 9
            Width = 37
            Height = 13
            Caption = 'N'#250'mero'
          end
          object Label32: TLabel
            Left = 449
            Top = 61
            Width = 33
            Height = 13
            Caption = 'Estado'
          end
          object Label30: TLabel
            Left = 449
            Top = 35
            Width = 28
            Height = 13
            Caption = 'Bairro'
          end
          object Label29: TLabel
            Left = 6
            Top = 35
            Width = 65
            Height = 13
            Caption = 'Complemento'
          end
          object Label31: TLabel
            Left = 6
            Top = 61
            Width = 43
            Height = 13
            Caption = 'Munic'#237'pio'
          end
          object Label33: TLabel
            Left = 6
            Top = 87
            Width = 19
            Height = 13
            Caption = 'CEP'
          end
          object ENDERECO_COBRANCA: TEdit
            Left = 84
            Top = 6
            Width = 301
            Height = 21
            Enabled = False
            MaxLength = 60
            TabOrder = 0
            OnKeyDown = NOMEKeyDown
          end
          object NUMERO_COBRANCA: TEdit
            Left = 507
            Top = 6
            Width = 56
            Height = 21
            Enabled = False
            MaxLength = 6
            TabOrder = 1
            OnKeyDown = NOMEKeyDown
          end
          object BAIRRO_COBRANCA: TEdit
            Left = 507
            Top = 32
            Width = 175
            Height = 21
            Enabled = False
            MaxLength = 40
            TabOrder = 3
            OnKeyDown = NOMEKeyDown
          end
          object ESTADO_COBRANCA: TComboBox
            Left = 507
            Top = 58
            Width = 56
            Height = 21
            CharCase = ecUpperCase
            Color = clWhite
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 2
            ParentFont = False
            TabOrder = 4
            OnKeyDown = TIPO_CLIENTEKeyDown
            Items.Strings = (
              'AC'
              'AL'
              'AP'
              'AM'
              'BA'
              'CE'
              'DF'
              'ES'
              'GO'
              'MA'
              'MG'
              'MT'
              'MS'
              'PA'
              'PB'
              'PR'
              'PE'
              'PI'
              'RJ'
              'RN'
              'RS'
              'RO'
              'RR'
              'SC'
              'SP'
              'SE'
              'TO')
          end
          object COMPL_COBRANCA: TEdit
            Left = 84
            Top = 32
            Width = 175
            Height = 21
            Enabled = False
            MaxLength = 20
            TabOrder = 2
            OnKeyDown = NOMEKeyDown
          end
          object MUNICIPIO_COBRANCA: TEdit
            Left = 84
            Top = 59
            Width = 175
            Height = 21
            Enabled = False
            MaxLength = 30
            TabOrder = 5
            OnKeyDown = NOMEKeyDown
          end
          object CEP_COBRANCA: TMaskEdit
            Left = 84
            Top = 84
            Width = 67
            Height = 21
            CharCase = ecUpperCase
            Color = clWhite
            Enabled = False
            EditMask = '99999-999;1;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 9
            ParentFont = False
            TabOrder = 6
            Text = '     -   '
            OnKeyDown = NOMEKeyDown
          end
        end
        object TabSheet3: TTabSheet
          Caption = 'Pessoa F'#237'sica'
          ImageIndex = 2
          TabVisible = False
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object Label12: TLabel
            Left = 6
            Top = 9
            Width = 59
            Height = 13
            Caption = 'Nome do Pai'
          end
          object Label37: TLabel
            Left = 6
            Top = 35
            Width = 65
            Height = 13
            Caption = 'Nome da M'#227'e'
          end
          object Label38: TLabel
            Left = 6
            Top = 61
            Width = 73
            Height = 13
            Caption = 'Dt. Nascimento'
          end
          object Label39: TLabel
            Left = 6
            Top = 87
            Width = 24
            Height = 13
            Caption = 'Sexo'
          end
          object Label40: TLabel
            Left = 6
            Top = 113
            Width = 41
            Height = 13
            Caption = 'Est. Civil'
          end
          object Label41: TLabel
            Left = 6
            Top = 139
            Width = 40
            Height = 13
            Caption = 'C'#244'njuge'
          end
          object PAI: TEdit
            Left = 84
            Top = 6
            Width = 301
            Height = 21
            MaxLength = 40
            TabOrder = 0
            OnKeyDown = NOMEKeyDown
          end
          object MAE: TEdit
            Left = 84
            Top = 32
            Width = 301
            Height = 21
            MaxLength = 40
            TabOrder = 1
            OnKeyDown = NOMEKeyDown
          end
          object NASCIMENTO: TDateEdit
            Left = 84
            Top = 58
            Width = 90
            Height = 21
            CheckOnExit = True
            DialogTitle = 'Selecione a Data'
            NumGlyphs = 2
            TabOrder = 2
            OnEnter = DT_FICHAEnter
            OnKeyDown = NOMEKeyDown
          end
          object SEXO: TComboBox
            Left = 84
            Top = 84
            Width = 151
            Height = 21
            CharCase = ecUpperCase
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 10
            ParentFont = False
            TabOrder = 3
            OnKeyDown = TIPO_CLIENTEKeyDown
            Items.Strings = (
              'MASCULINO'
              'FEMININO')
          end
          object ESTADO_CIVIL: TComboBox
            Left = 84
            Top = 110
            Width = 151
            Height = 21
            CharCase = ecUpperCase
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 10
            ParentFont = False
            TabOrder = 4
            OnKeyDown = TIPO_CLIENTEKeyDown
            Items.Strings = (
              ''
              'CASADO'
              'SOLTEIRO'
              'DIVORCIADO')
          end
          object CONJUGE: TEdit
            Left = 84
            Top = 136
            Width = 301
            Height = 21
            MaxLength = 40
            TabOrder = 5
            OnKeyDown = NOMEKeyDown
          end
        end
        object TabSheet4: TTabSheet
          Caption = 'Complemento'
          ImageIndex = 3
          TabVisible = False
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object Label42: TLabel
            Left = 4
            Top = 139
            Width = 64
            Height = 13
            Caption = 'Banco Pagto.'
            Visible = False
          end
          object Label43: TLabel
            Left = 4
            Top = 165
            Width = 75
            Height = 13
            Caption = 'Transportadora'
            Visible = False
          end
          object Label44: TLabel
            Left = 4
            Top = 87
            Width = 85
            Height = 13
            Caption = 'Per. Faturamento'
            Visible = False
          end
          object Label23: TLabel
            Left = 4
            Top = 113
            Width = 55
            Height = 13
            Caption = 'Vencimento'
            Visible = False
          end
          object Label58: TLabel
            Left = 7
            Top = 15
            Width = 42
            Height = 13
            Caption = 'Cart'#227'o 1'
          end
          object Label59: TLabel
            Left = 7
            Top = 41
            Width = 42
            Height = 13
            Caption = 'Cart'#227'o 2'
          end
          object Label60: TLabel
            Left = 234
            Top = 15
            Width = 42
            Height = 13
            Caption = 'Cart'#227'o 3'
          end
          object Label61: TLabel
            Left = 234
            Top = 41
            Width = 31
            Height = 13
            Caption = 'Classe'
          end
          object Label62: TLabel
            Left = 469
            Top = 15
            Width = 30
            Height = 13
            Caption = 'Senha'
          end
          object BANCO_PAGTO: TEdit
            Left = 92
            Top = 136
            Width = 197
            Height = 21
            Enabled = False
            MaxLength = 25
            TabOrder = 8
            Visible = False
          end
          object TRANSPORTADORA: TEdit
            Left = 92
            Top = 162
            Width = 237
            Height = 21
            Enabled = False
            MaxLength = 30
            TabOrder = 9
            Visible = False
          end
          object DIA_INI: TCurrencyEdit
            Left = 92
            Top = 84
            Width = 50
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            AutoSize = False
            DecimalPlaces = 0
            DisplayFormat = '0;-0'
            Enabled = False
            MaxValue = 31.000000000000000000
            MinValue = 1.000000000000000000
            TabOrder = 5
            Value = 1.000000000000000000
            Visible = False
            ZeroEmpty = False
            OnKeyDown = TIPO_CLIENTEKeyDown
          end
          object DIA_FIM: TCurrencyEdit
            Left = 148
            Top = 84
            Width = 50
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            AutoSize = False
            DecimalPlaces = 0
            DisplayFormat = '0;-0'
            Enabled = False
            MaxValue = 31.000000000000000000
            MinValue = 1.000000000000000000
            TabOrder = 6
            Value = 1.000000000000000000
            Visible = False
            ZeroEmpty = False
            OnKeyDown = TIPO_CLIENTEKeyDown
          end
          object VENCIMENTO: TCurrencyEdit
            Left = 92
            Top = 110
            Width = 50
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            AutoSize = False
            DecimalPlaces = 0
            DisplayFormat = '0;-0'
            Enabled = False
            MaxValue = 31.000000000000000000
            TabOrder = 7
            Value = 1.000000000000000000
            Visible = False
            ZeroEmpty = False
            OnKeyDown = TIPO_CLIENTEKeyDown
          end
          object CARTAO_IDENT1: TEdit
            Left = 60
            Top = 12
            Width = 146
            Height = 21
            Enabled = False
            MaxLength = 13
            TabOrder = 0
          end
          object CARTAO_IDENT2: TEdit
            Left = 60
            Top = 38
            Width = 146
            Height = 21
            Enabled = False
            MaxLength = 13
            TabOrder = 3
          end
          object CARTAO_IDENT3: TEdit
            Left = 287
            Top = 12
            Width = 146
            Height = 21
            Enabled = False
            MaxLength = 13
            TabOrder = 1
          end
          object CARTAO_IDENT4: TEdit
            Left = 287
            Top = 38
            Width = 146
            Height = 21
            Enabled = False
            MaxLength = 13
            TabOrder = 4
          end
          object SENHA: TEdit
            Left = 505
            Top = 12
            Width = 94
            Height = 21
            Enabled = False
            MaxLength = 9
            PasswordChar = '*'
            TabOrder = 2
          end
        end
        object TabSheet6: TTabSheet
          Caption = 'Anota'#231#245'es'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ImageIndex = 5
          ParentFont = False
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object Label64: TLabel
            Left = 3
            Top = 19
            Width = 51
            Height = 13
            Caption = 'Anota'#231#245'es'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object ANOTACOES: TMemo
            Left = 71
            Top = 15
            Width = 565
            Height = 202
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
        end
        object TabSheet7: TTabSheet
          Caption = 'Pessoas Autorizadas'
          ImageIndex = 6
          TabVisible = False
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object Grid_Autorizados: TDBGrid
            Left = 0
            Top = 0
            Width = 738
            Height = 221
            Align = alClient
            DataSource = DataAutorizados
            Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnKeyDown = Grid_AutorizadosKeyDown
            OnKeyPress = Grid_AutorizadosKeyPress
            Columns = <
              item
                Expanded = False
                FieldName = 'nome'
                Title.Caption = 'Nome'
                Width = 212
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'dt_nascimento'
                Title.Caption = 'Dt. Nasc.'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'endereco'
                Title.Caption = 'Endere'#231'o'
                Width = 212
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'numero'
                Title.Caption = 'N'#250'm.'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'funcao'
                Title.Alignment = taCenter
                Title.Caption = 'V'#237'nculo'
                Width = 123
                Visible = True
              end>
          end
          object StatusBar2: TStatusBar
            Left = 0
            Top = 221
            Width = 738
            Height = 19
            Panels = <
              item
                Text = '<F4> - Excluir'
                Width = 344
              end
              item
                Text = '<F9> - Finalizar'
                Width = 344
              end>
          end
        end
        object TabSheet5: TTabSheet
          Caption = 'Hist'#243'rico de Inadimpl'#234'ncia'
          ImageIndex = 7
          TabVisible = False
          OnShow = TabSheet5Show
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object Label26: TLabel
            Left = 7
            Top = 44
            Width = 29
            Height = 14
            Caption = 'Data'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label45: TLabel
            Left = 303
            Top = 44
            Width = 54
            Height = 14
            Caption = 'Hist'#243'rico'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label46: TLabel
            Left = 622
            Top = 44
            Width = 70
            Height = 14
            Caption = 'Funcion'#225'rio'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Anot_Inadimplencia: TRichEdit
            Left = 3
            Top = 64
            Width = 724
            Height = 209
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            ScrollBars = ssHorizontal
            TabOrder = 0
          end
          object btn_Incluir_Inadimplencia: TBitBtn
            Left = 3
            Top = 9
            Width = 134
            Height = 25
            Caption = 'Incluir/Alterar/Excluir'
            TabOrder = 1
            OnClick = btn_Incluir_InadimplenciaClick
          end
        end
      end
      object btn_load_image: TButton
        Left = 634
        Top = 164
        Width = 110
        Height = 22
        Caption = 'Carregar Imagem...'
        Enabled = False
        TabOrder = 15
        Visible = False
        OnClick = btn_load_imageClick
      end
      object Limite_Cheque: TRxCalcEdit
        Left = 862
        Top = 78
        Width = 90
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DisplayFormat = '0.00;-0.00'
        Enabled = False
        MaxValue = 99999.990000000000000000
        NumGlyphs = 2
        TabOrder = 16
        ZeroEmpty = False
        OnKeyDown = TIPO_CLIENTEKeyDown
      end
      object Contato: TEdit
        Left = 471
        Top = 107
        Width = 157
        Height = 21
        Enabled = False
        MaxLength = 30
        TabOrder = 6
        OnKeyDown = NOMEKeyDown
      end
      object Limite_cr: TRxCalcEdit
        Left = 1055
        Top = 78
        Width = 90
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DisplayFormat = '0.00;-0.00'
        Enabled = False
        MaxValue = 99999.990000000000000000
        MinValue = -99999.990000000000000000
        NumGlyphs = 2
        TabOrder = 17
        Visible = False
        ZeroEmpty = False
        OnKeyDown = TIPO_CLIENTEKeyDown
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 489
    Width = 759
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnComeca_Com: TSpeedButton
      Left = 436
      Top = 6
      Width = 32
      Height = 21
      Cursor = crHandPoint
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
      OnClick = btnComeca_ComClick
    end
    object btnRetorna: TBitBtn
      Left = 637
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
      TabOrder = 2
      OnClick = btnRetornaClick
    end
    object btnImprime: TBitBtn
      Left = 477
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Relat'#243'rio'
      TabOrder = 0
      OnClick = btnImprimeClick
    end
    object btnPesquisa: TBitBtn
      Left = 557
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Pesquisa'
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
      TabOrder = 1
      OnClick = btnPesquisaClick
    end
    object Comeca_Com: TLabeledEdit
      Left = 50
      Top = 10
      Width = 380
      Height = 21
      EditLabel.Width = 41
      EditLabel.Height = 13
      EditLabel.Caption = 'Localizar'
      LabelPosition = lpLeft
      TabOrder = 3
      OnEnter = Comeca_ComEnter
      OnKeyPress = Comeca_ComKeyPress
    end
  end
  object Rel_Series: TQuickRep
    Left = 4
    Top = 800
    Width = 794
    Height = 1123
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = Default
    Page.Continuous = False
    Page.Values = (
      127.000000000000000000
      2970.000000000000000000
      127.000000000000000000
      2100.000000000000000000
      127.000000000000000000
      127.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.OutputBin = First
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 0
    PrinterSettings.ExtendedDuplex = 0
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 0
    PrinterSettings.PrintMetaFile = False
    PrinterSettings.PrintQuality = 0
    PrinterSettings.Collate = 0
    PrinterSettings.ColorOption = 0
    PrintIfEmpty = True
    ReportTitle = 'Produ'#231#227'o'
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsMaximized
    PreviewWidth = 500
    PreviewHeight = 500
    PrevInitialZoom = qrZoomToWidth
    PreviewDefaultSaveType = stQRP
    PreviewLeft = 0
    PreviewTop = 0
    object QRBand4: TQRBand
      Left = 48
      Top = 48
      Width = 698
      Height = 57
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        150.812500000000000000
        1846.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object QRShape6: TQRShape
        Left = 2
        Top = 25
        Width = 684
        Height = 15
        Size.Values = (
          39.687500000000000000
          5.291666666666667000
          66.145833333333320000
          1809.750000000000000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel17: TQRLabel
        Left = 0
        Top = 33
        Width = 73
        Height = 17
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          87.312500000000000000
          193.145833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'CLIENTE: '
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRDBText17: TQRDBText
        Left = 0
        Top = 1
        Width = 36
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          2.645833333333333000
          95.250000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = FrmPrincipal.QEmpresa
        DataField = 'RAZAO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRSysData5: TQRSysData
        Left = 0
        Top = 17
        Width = 162
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          44.979166666666670000
          428.625000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsDateTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Text = 'Data/Hora : '
        Transparent = False
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel21: TQRLabel
        Left = 445
        Top = 1
        Width = 253
        Height = 15
        Size.Values = (
          39.687500000000000000
          1177.395833333333000000
          2.645833333333333000
          669.395833333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = True
        Caption = 'Sistema de Adm. de Empresas - Eficaz'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRSysData6: TQRSysData
        Left = 585
        Top = 17
        Width = 113
        Height = 15
        Size.Values = (
          39.687500000000000000
          1547.812500000000000000
          44.979166666666670000
          298.979166666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = True
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Text = 'P'#225'gina : '
        Transparent = False
        ExportAs = exptText
        FontSize = 8
      end
      object QRShape8: TQRShape
        Left = 0
        Top = 48
        Width = 686
        Height = 11
        Size.Values = (
          29.104166666666670000
          0.000000000000000000
          127.000000000000000000
          1815.041666666667000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel2: TQRLabel
        Left = 405
        Top = 33
        Width = 73
        Height = 17
        Size.Values = (
          44.979166666666670000
          1071.562500000000000000
          87.312500000000000000
          193.145833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Licen'#231'as:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel1: TQRLabel
        Left = 272
        Top = 33
        Width = 57
        Height = 17
        Size.Values = (
          44.979166666666670000
          719.666666666666800000
          87.312500000000000000
          150.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Serial:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
    end
    object QRBand5: TQRBand
      Left = 48
      Top = 105
      Width = 698
      Height = 152
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        402.166666666666700000
        1846.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRDBText19: TQRDBText
        Left = 0
        Top = 133
        Width = 78
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          351.895833333333300000
          206.375000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataField = 'S_TRIMESTRE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText20: TQRDBText
        Left = 389
        Top = 133
        Width = 78
        Height = 15
        Size.Values = (
          39.687500000000000000
          1029.229166666667000000
          351.895833333333300000
          206.375000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataField = 'Q_TRIMESTRE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText21: TQRDBText
        Left = 389
        Top = 86
        Width = 78
        Height = 15
        Size.Values = (
          39.687500000000000000
          1029.229166666667000000
          227.541666666666700000
          206.375000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataField = 'T_TRIMESTRE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText22: TQRDBText
        Left = 2
        Top = 86
        Width = 78
        Height = 20
        Size.Values = (
          52.916666666666670000
          5.291666666666667000
          227.541666666666700000
          206.375000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataField = 'P_TRIMESTRE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel15: TQRLabel
        Left = -8
        Top = 23
        Width = 59
        Height = 15
        Size.Values = (
          39.687500000000000000
          -21.166666666666670000
          60.854166666666680000
          156.104166666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Licen'#231'a'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel20: TQRLabel
        Left = 0
        Top = 65
        Width = 85
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          171.979166666666700000
          224.895833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '1'#186' Trimestre'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel22: TQRLabel
        Left = 2
        Top = 112
        Width = 85
        Height = 15
        Size.Values = (
          39.687500000000000000
          5.291666666666667000
          296.333333333333300000
          224.895833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '2'#186' Trimestre'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel16: TQRLabel
        Left = 389
        Top = 65
        Width = 85
        Height = 15
        Size.Values = (
          39.687500000000000000
          1029.229166666667000000
          171.979166666666700000
          224.895833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '3'#186' Trimestre'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel19: TQRLabel
        Left = 389
        Top = 112
        Width = 85
        Height = 15
        Size.Values = (
          39.687500000000000000
          1029.229166666667000000
          296.333333333333300000
          224.895833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '4'#186' Trimestre'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText2: TQRDBText
        Left = 0
        Top = 2
        Width = 33
        Height = 17
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          5.291666666666667000
          87.312500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataField = 'NOME'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText1: TQRDBText
        Left = 273
        Top = 2
        Width = 49
        Height = 17
        Size.Values = (
          44.979166666666670000
          722.312500000000000000
          5.291666666666667000
          129.645833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataField = 'SERIAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText3: TQRDBText
        Left = 405
        Top = 2
        Width = 89
        Height = 17
        Size.Values = (
          44.979166666666670000
          1071.562500000000000000
          5.291666666666667000
          235.479166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataField = 'QTD_LICENCA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText4: TQRDBText
        Left = 2
        Top = 44
        Width = 50
        Height = 20
        Size.Values = (
          52.916666666666670000
          5.291666666666667000
          116.416666666666700000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataField = 'LICENCA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
    end
  end
  object funcionario_id: TCurrencyEdit
    Left = 305
    Top = 458
    Width = 47
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    Enabled = False
    TabOrder = 3
    Visible = False
    ZeroEmpty = False
  end
  object DataTabela: TDataSource
    AutoEdit = False
    DataSet = QTabela
    Left = 360
    Top = 260
  end
  object DataAutorizados: TDataSource
    DataSet = Qautorizados
    Left = 400
    Top = 260
  end
  object DataSeriais: TDataSource
    DataSet = QSeriais
    Left = 440
    Top = 260
  end
  object OpenImage: TOpenPictureDialog
    Filter = 'JPEG Image File (*.jpg)|*.jpg'
    Left = 584
    Top = 180
  end
  object QTabela: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evItems, evRecsMax, evRowsetSize, evCache, evCursorKind, evAutoFetchAll]
    FetchOptions.CursorKind = ckDefault
    FetchOptions.RowsetSize = 1000
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      'SELECT * FROM CLIENTES')
    Left = 144
    Top = 576
  end
  object IQuery: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afDisable
    Left = 184
    Top = 576
  end
  object QIbge: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      'SELECT * FROM IBGE'
      'WHERE'
      '(CODIGO = :IBGE)')
    Left = 224
    Top = 576
    ParamData = <
      item
        Name = 'IBGE'
        ParamType = ptInput
      end>
  end
  object Qautorizados: TFDQuery
    AfterOpen = QautorizadosAfterOpen
    BeforeEdit = QautorizadosBeforeEdit
    BeforePost = QautorizadosBeforePost
    AfterPost = QautorizadosAfterPost
    OnNewRecord = QautorizadosNewRecord
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      'SELECT * FROM AUTORIZADOS'
      'WHERE'
      '(CLIENTE_ID = :CLIENTE_ID)')
    Left = 272
    Top = 576
    ParamData = <
      item
        Name = 'CLIENTE_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object QSeriais: TFDQuery
    BeforeEdit = QSeriaisBeforeEdit
    OnNewRecord = QSeriaisNewRecord
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afDisable
    UpdateObject = Usql_Seriais
    SQL.Strings = (
      'SELECT * FROM SERIAIS'
      'WHERE'
      '(CLIENTE_ID = :CLIENTE_ID)')
    Left = 480
    Top = 264
    ParamData = <
      item
        Name = 'CLIENTE_ID'
        ParamType = ptInput
      end>
  end
  object Usql_Seriais: TFDUpdateSQL
    Connection = FrmData.DbF_Eficaz
    InsertSQL.Strings = (
      'insert into SERIAIS'
      
        '  (CLIENTE_ID, LICENCA, P_TRIMESTRE, Q_TRIMESTRE, S_TRIMESTRE, S' +
        'ERIAL, '
      '   T_TRIMESTRE)'
      'values'
      
        '  (:CLIENTE_ID, :LICENCA, :P_TRIMESTRE, :Q_TRIMESTRE, :S_TRIMEST' +
        'RE, :SERIAL, '
      '   :T_TRIMESTRE)')
    ModifySQL.Strings = (
      'update SERIAIS'
      'set'
      '  CLIENTE_ID = :CLIENTE_ID,'
      '  LICENCA = :LICENCA,'
      '  P_TRIMESTRE = :P_TRIMESTRE,'
      '  Q_TRIMESTRE = :Q_TRIMESTRE,'
      '  S_TRIMESTRE = :S_TRIMESTRE,'
      '  SERIAL = :SERIAL,'
      '  T_TRIMESTRE = :T_TRIMESTRE'
      'where'
      '  CLIENTE_ID = :OLD_CLIENTE_ID and'
      '  SERIAL = :OLD_SERIAL')
    DeleteSQL.Strings = (
      'delete from SERIAIS'
      'where'
      '  CLIENTE_ID = :OLD_CLIENTE_ID and'
      '  SERIAL = :OLD_SERIAL')
    FetchRowSQL.Strings = (
      'Select '
      '  SERIAL,'
      '  CLIENTE_ID,'
      '  LICENCA,'
      '  P_TRIMESTRE,'
      '  S_TRIMESTRE,'
      '  T_TRIMESTRE,'
      '  Q_TRIMESTRE'
      'from SERIAIS '
      'where'
      '  CLIENTE_ID = :CLIENTE_ID and'
      '  SERIAL = :SERIAL')
    Left = 386
    Top = 579
  end
  object QInadimplencia: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      'SELECT * FROM INADIMPLENCIA WHERE CLIENTE_ID = :CLIENTE_ID')
    Left = 96
    Top = 576
    ParamData = <
      item
        Name = 'CLIENTE_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
end
