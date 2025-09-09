object FrmDistribuicaoDfe: TFrmDistribuicaoDfe
  Left = 0
  Top = 0
  Caption = 'Distribui'#231#227'o Dfe'
  ClientHeight = 507
  ClientWidth = 1041
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1041
    Height = 41
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object lblAtualizar: TLabel
      Left = 402
      Top = 9
      Width = 78
      Height = 24
      Caption = 'Atualizar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object Label2: TLabel
      Left = 7
      Top = 5
      Width = 372
      Height = 29
      Caption = 'Distribui'#231#227'o de Documentos Fiscais'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 1041
    Height = 466
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 1039
      Height = 160
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object PageControl2: TPageControl
        Left = 2
        Top = -2
        Width = 1020
        Height = 157
        ActivePage = TabSheet16
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object TabSheet16: TTabSheet
          Caption = 'Consultar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          object Label44: TLabel
            Left = 221
            Top = 33
            Width = 27
            Height = 26
            Caption = 'CNPJ'#13#10
          end
          object Label45: TLabel
            Left = 157
            Top = 76
            Width = 23
            Height = 13
            Caption = 'NSU'
          end
          object Label48: TLabel
            Left = 157
            Top = 6
            Width = 31
            Height = 13
            Caption = 'Chave'
          end
          object Label49: TLabel
            Left = 269
            Top = 76
            Width = 42
            Height = 13
            Caption = #218'lt. NSU'
          end
          object Label50: TLabel
            Left = 167
            Top = 103
            Width = 42
            Height = 13
            Caption = 'UF Autor'
            Visible = False
          end
          object Label51: TLabel
            Left = 442
            Top = 76
            Width = 50
            Height = 13
            Caption = 'Qtd. Cons.'
          end
          object btnEmpresa: TSpeedButton
            Left = 151
            Top = 28
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
            OnClick = btnEmpresaClick
          end
          object DBText1: TDBText
            Left = 157
            Top = 55
            Width = 388
            Height = 13
            DataField = 'RAZAO'
            DataSource = DataEmpresa
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RadioGroup1: TRadioGroup
            Left = 11
            Top = 3
            Width = 134
            Height = 122
            Caption = 'Tipo de Consulta'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemIndex = 2
            Items.Strings = (
              'Normal'
              'Chave'
              'Ult. NSU'
              'NSU Esp.')
            ParentFont = False
            TabOrder = 0
          end
          object Button6: TButton
            Left = 367
            Top = 100
            Width = 178
            Height = 25
            Caption = 'Consultar DFe'
            TabOrder = 1
            OnClick = Button6Click
          end
          object memoConsultaDFe: TMemo
            Left = 551
            Top = 3
            Width = 458
            Height = 123
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Lines.Strings = (
              '')
            ParentFont = False
            ScrollBars = ssVertical
            TabOrder = 2
          end
          object ed_CNPJ: TEdit
            Left = 254
            Top = 30
            Width = 291
            Height = 21
            TabOrder = 3
          end
          object ed_NSU: TEdit
            Left = 188
            Top = 73
            Width = 77
            Height = 21
            TabOrder = 4
          end
          object ed_Chave: TEdit
            Left = 200
            Top = 3
            Width = 345
            Height = 21
            TabOrder = 5
          end
          object ed_Ult_NSU: TEdit
            Left = 317
            Top = 73
            Width = 116
            Height = 21
            TabOrder = 6
          end
          object ed_UF_Autor: TEdit
            Left = 215
            Top = 100
            Width = 50
            Height = 21
            TabOrder = 7
            Visible = False
          end
          object ed_Qtd_Cons: TSpinEdit
            Left = 496
            Top = 73
            Width = 49
            Height = 22
            MaxValue = 0
            MinValue = 0
            TabOrder = 8
            Value = 10
          end
          object EMPRESA_ID: TCurrencyEdit
            Left = 272
            Top = 101
            Width = 47
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            AutoSize = False
            DecimalPlaces = 0
            DisplayFormat = '0;-0'
            Enabled = False
            TabOrder = 9
            Visible = False
            ZeroEmpty = False
          end
        end
        object TabSheet17: TTabSheet
          Caption = 'Manifestar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ImageIndex = 1
          ParentFont = False
          object Label43: TLabel
            Left = 302
            Top = 41
            Width = 27
            Height = 26
            Caption = 'CNPJ'#13#10
          end
          object Label52: TLabel
            Left = 237
            Top = 13
            Width = 31
            Height = 13
            Caption = 'Chave'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label53: TLabel
            Left = 503
            Top = 84
            Width = 21
            Height = 13
            Caption = 'Lote'
          end
          object SpeedButton2: TSpeedButton
            Left = 229
            Top = 35
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
            OnClick = SpeedButton2Click
          end
          object DBText2: TDBText
            Left = 237
            Top = 62
            Width = 343
            Height = 13
            DataField = 'RAZAO'
            DataSource = DataEmpresa
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RadioGroup2: TRadioGroup
            Left = 3
            Top = 3
            Width = 182
            Height = 122
            Caption = 'Tipo de Manifesto'
            Enabled = False
            ItemIndex = 2
            Items.Strings = (
              'teManifDestCiencia'
              'teManifDestDesconhecimento'
              'teManifDestConfirmacao'
              'teManifDestOperNaoRealizada')
            TabOrder = 0
          end
          object ed_CNPJM: TEdit
            Left = 340
            Top = 35
            Width = 240
            Height = 21
            TabOrder = 1
          end
          object ed_ChaveM: TEdit
            Left = 274
            Top = 8
            Width = 306
            Height = 21
            TabOrder = 2
          end
          object ed_LoteM: TEdit
            Left = 530
            Top = 81
            Width = 50
            Height = 21
            TabOrder = 3
          end
          object Button8: TButton
            Left = 602
            Top = 6
            Width = 178
            Height = 25
            Caption = 'Manifestar DFe'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            OnClick = Button8Click
          end
        end
        object TabSheet1: TTabSheet
          Caption = 'Logs'
          ImageIndex = 2
          object Panel5: TPanel
            Left = 0
            Top = 0
            Width = 1012
            Height = 31
            Align = alTop
            TabOrder = 0
            object Label1: TLabel
              Left = 6
              Top = 7
              Width = 38
              Height = 13
              Caption = 'Per'#237'odo'
            end
            object Dtmen: TDateEdit
              Left = 61
              Top = 4
              Width = 90
              Height = 21
              CheckOnExit = True
              DialogTitle = 'Selecione a Data'
              NumGlyphs = 2
              TabOrder = 0
            end
            object Dtmai: TDateEdit
              Left = 165
              Top = 4
              Width = 90
              Height = 21
              CheckOnExit = True
              DialogTitle = 'Selecione a Data'
              NumGlyphs = 2
              TabOrder = 1
            end
            object btnExecuta: TBitBtn
              Left = 277
              Top = 4
              Width = 75
              Height = 25
              BiDiMode = bdRightToLeft
              Caption = '&OK'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
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
              ParentBiDiMode = False
              ParentFont = False
              TabOrder = 2
              OnClick = btnExecutaClick
            end
          end
          object Panel6: TPanel
            Left = 0
            Top = 31
            Width = 1012
            Height = 98
            Align = alClient
            TabOrder = 1
            object DBGrid2: TDBGrid
              Left = 1
              Top = 1
              Width = 1010
              Height = 96
              Align = alClient
              DataSource = DataDistribuicao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
              ParentFont = False
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
            end
          end
        end
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 161
      Width = 1039
      Height = 304
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object pgRespostas: TPageControl
        Left = 1
        Top = 1
        Width = 1037
        Height = 302
        ActivePage = TabSheet5
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object TabSheet5: TTabSheet
          Caption = 'Respostas'
          object MemoResp: TMemo
            Left = 0
            Top = 0
            Width = 1029
            Height = 274
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
        object TabSheet6: TTabSheet
          Caption = 'XML Resposta'
          ImageIndex = 1
          object WBResposta: TWebBrowser
            Left = 0
            Top = 0
            Width = 1029
            Height = 274
            Align = alClient
            TabOrder = 0
            ExplicitWidth = 566
            ExplicitHeight = 278
            ControlData = {
              4C0000005A6A0000521C00000000000000000000000000000000000000000000
              000000004C000000000000000000000001000000E0D057007335CF11AE690800
              2B2E126200000000000000004C0000000114020000000000C000000000000046
              8000000000000000000000000000000000000000000000000000000000000000
              00000000000000000100000000000000000000000000000000000000}
          end
        end
        object TabSheet8: TTabSheet
          Caption = 'Log'
          ImageIndex = 2
          object memoLog: TMemo
            Left = 0
            Top = 0
            Width = 1029
            Height = 274
            Align = alClient
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
        object TabSheet9: TTabSheet
          Caption = 'NFe'
          ImageIndex = 3
          object trvwNFe: TTreeView
            Left = 0
            Top = 0
            Width = 1029
            Height = 274
            Align = alClient
            Indent = 19
            TabOrder = 0
          end
        end
        object TabSheet10: TTabSheet
          Caption = 'Retorno Completo WS'
          ImageIndex = 4
          object memoRespWS: TMemo
            Left = 0
            Top = 0
            Width = 1029
            Height = 274
            Align = alClient
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
        object Dados: TTabSheet
          Caption = 'Dados'
          ImageIndex = 5
          object MemoDados: TMemo
            Left = 0
            Top = 0
            Width = 1029
            Height = 274
            Align = alClient
            Lines.Strings = (
              '')
            ScrollBars = ssVertical
            TabOrder = 0
            WordWrap = False
          end
        end
        object TabSheet11: TTabSheet
          Caption = 'RetornoConsulta NFe'
          ImageIndex = 6
          object TreeViewRetornoConsulta: TTreeView
            Left = 0
            Top = 0
            Width = 1029
            Height = 274
            Align = alClient
            Indent = 19
            TabOrder = 0
          end
        end
        object tabConsultaDFe: TTabSheet
          Caption = 'Consulta DFe'
          ImageIndex = 7
          object SpeedButton1: TSpeedButton
            Left = 496
            Top = 128
            Width = 23
            Height = 22
          end
          object DBGrid1: TDBGrid
            Left = 0
            Top = 0
            Width = 1029
            Height = 274
            Align = alClient
            DataSource = DataSource1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
          end
        end
      end
    end
  end
  object VirtualTable1: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'Sserie'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Snumero'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'sChave'
        DataType = ftString
        Size = 44
      end
      item
        Name = 'Snome'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'siest'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'STipoNfe'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Snsu'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'SEmissao'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Valor'
        DataType = ftCurrency
        Precision = 19
      end
      item
        Name = 'impresso'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'sCnpj'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'dt_consulta'
        DataType = ftDateTime
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    StoreDefs = True
    Left = 161
    Top = 314
    object VirtualTable1SEmissao: TStringField
      DisplayLabel = 'Dt Emiss'#227'o'
      DisplayWidth = 14
      FieldName = 'SEmissao'
      Size = 10
    end
    object VirtualTable1Snome: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 44
      FieldName = 'Snome'
      Size = 100
    end
    object VirtualTable1Snumero: TStringField
      DisplayLabel = 'Numero'
      DisplayWidth = 12
      FieldName = 'Snumero'
      Size = 10
    end
    object VirtualTable1Sserie: TStringField
      DisplayLabel = 'Serie'
      DisplayWidth = 5
      FieldName = 'Sserie'
      Size = 3
    end
    object VirtualTable1sChave: TStringField
      DisplayLabel = 'Chave'
      DisplayWidth = 36
      FieldName = 'sChave'
      Size = 44
    end
    object VirtualTable1dt_consulta: TDateTimeField
      DisplayLabel = 'Dt Consulta'
      DisplayWidth = 22
      FieldName = 'dt_consulta'
    end
    object VirtualTable1siest: TStringField
      DisplayLabel = 'Inscr.'
      DisplayWidth = 20
      FieldName = 'siest'
      Size = 15
    end
    object VirtualTable1sCnpj: TStringField
      DisplayLabel = 'Cnpj'
      DisplayWidth = 18
      FieldName = 'sCnpj'
      Size = 15
    end
    object VirtualTable1STipoNfe: TStringField
      DisplayLabel = 'Tipo_Nfe'
      DisplayWidth = 26
      FieldName = 'STipoNfe'
    end
    object VirtualTable1Snsu: TStringField
      DisplayLabel = 'Nsu'
      DisplayWidth = 14
      FieldName = 'Snsu'
      Size = 10
    end
    object VirtualTable1Valor: TCurrencyField
      DisplayWidth = 13
      FieldName = 'Valor'
    end
    object VirtualTable1impresso: TStringField
      DisplayWidth = 24
      FieldName = 'impresso'
    end
  end
  object DataSource1: TDataSource
    DataSet = VirtualTable1
    Left = 241
    Top = 317
  end
  object QDistribuicao: TFDQuery
    AfterOpen = QDistribuicaoAfterOpen
    Connection = FrmData.DbF_Eficaz
    SQL.Strings = (
      'select * from distribuicaonotas'
      'where dt_consulta between :dtinicio and :dtfim'
      'and empresa_id = :empresa_id '
      'AND VALOR > 0'
      'order by dt_consulta')
    Left = 182
    Top = 243
    ParamData = <
      item
        Name = 'DTINICIO'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DTFIM'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'EMPRESA_ID'
        ParamType = ptInput
      end>
    object QDistribuicaodt_emissao: TDateField
      DisplayLabel = 'Dt. Emiss'#227'o'
      DisplayWidth = 12
      FieldName = 'dt_emissao'
      Origin = 'dt_emissao'
    end
    object QDistribuicaonumero: TStringField
      DisplayLabel = 'Nf.  N'#250'mero'
      DisplayWidth = 18
      FieldName = 'numero'
      Origin = 'numero'
      Size = 15
    end
    object QDistribuicaochave_nfe: TStringField
      DisplayLabel = 'Chave Xml'
      DisplayWidth = 56
      FieldName = 'chave_nfe'
      Origin = 'chave_nfe'
      Size = 44
    end
    object QDistribuicaonome: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 42
      FieldName = 'nome'
      Origin = 'nome'
      Size = 35
    end
    object QDistribuicaovalor: TBCDField
      Alignment = taCenter
      DisplayLabel = 'Valor'
      DisplayWidth = 19
      FieldName = 'valor'
      Origin = 'valor'
      Precision = 15
      Size = 2
    end
    object QDistribuicaoimpresso: TStringField
      DisplayLabel = 'Autoriza'#231#227'o'
      DisplayWidth = 18
      FieldName = 'impresso'
      Origin = 'impresso'
      Size = 15
    end
    object QDistribuicaonsu: TStringField
      DisplayLabel = 'N S U'
      DisplayWidth = 18
      FieldName = 'nsu'
      Origin = 'nsu'
      Size = 15
    end
    object QDistribuicaoserie: TStringField
      FieldName = 'serie'
      Origin = 'serie'
      Visible = False
      Size = 3
    end
    object QDistribuicaoinscricao: TStringField
      FieldName = 'inscricao'
      Origin = 'inscricao'
      Visible = False
      Size = 25
    end
    object QDistribuicaotipo_nfe: TStringField
      FieldName = 'tipo_nfe'
      Origin = 'tipo_nfe'
      Visible = False
      Size = 25
    end
    object QDistribuicaocnpj: TStringField
      FieldName = 'cnpj'
      Origin = 'cnpj'
      Visible = False
      Size = 15
    end
    object QDistribuicaoarquivo_xml: TBlobField
      FieldName = 'arquivo_xml'
      Origin = 'arquivo_xml'
      Visible = False
    end
    object QDistribuicaodt_consulta: TSQLTimeStampField
      FieldName = 'dt_consulta'
      Origin = 'dt_consulta'
      Visible = False
    end
    object QDistribuicaofuncionario_id: TIntegerField
      FieldName = 'funcionario_id'
      Origin = 'funcionario_id'
      Visible = False
    end
    object QDistribuicaoentrada_id: TIntegerField
      FieldName = 'entrada_id'
      Origin = 'entrada_id'
    end
  end
  object DataDistribuicao: TDataSource
    DataSet = QDistribuicao
    Left = 249
    Top = 261
  end
  object QSearch: TFDQuery
    Connection = FrmData.DbF_Eficaz
    SQL.Strings = (
      'select * from distribuicaonotas'
      'where dt_consulta between :dtinicio and :dtfim'
      'order by dt_consulta')
    Left = 126
    Top = 259
    ParamData = <
      item
        Name = 'DTINICIO'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DTFIM'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end>
  end
  object QInsert: TFDQuery
    Connection = FrmData.DbF_Eficaz
    SQL.Strings = (
      'select * from distribuicaonotas'
      'where dt_consulta between :dtinicio and :dtfim'
      'order by dt_consulta')
    Left = 70
    Top = 259
    ParamData = <
      item
        Name = 'DTINICIO'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DTFIM'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end>
  end
  object Qempresa: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM EMPRESAS'
      'WHERE (STATUS = '#39'A'#39')'
      'ORDER BY EMPRESA_ID')
    Left = 360
    Top = 288
  end
  object DataEmpresa: TDataSource
    DataSet = Qempresa
    Left = 424
    Top = 289
  end
  object Qnsu: TFDQuery
    Connection = FrmData.DbF_Eficaz
    SQL.Strings = (
      'select ult_nsu from distribuicaonotas d'
      'where ult_nsu notnull'
      'and empresa_id = :empresa_id'
      'ORDER BY ult_nsu DESC LIMIT 1')
    Left = 70
    Top = 323
    ParamData = <
      item
        Name = 'EMPRESA_ID'
        ParamType = ptInput
      end>
  end
  object IQuery: TFDQuery
    Connection = FrmData.DbF_Eficaz
    SQL.Strings = (
      'select ult_nsu from distribuicaonotas d'
      'where ult_nsu notnull'
      'ORDER BY ult_nsu DESC LIMIT 1')
    Left = 358
    Top = 355
  end
  object FDVerificar: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'chave_nfe'
        DataType = ftString
        Size = 44
      end
      item
        Name = 'entrada_id'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    StoreDefs = True
    Left = 537
    Top = 298
    object StringField5: TStringField
      DisplayLabel = 'Chave'
      DisplayWidth = 36
      FieldName = 'chave_nfe'
      Size = 44
    end
    object StringField10: TStringField
      DisplayWidth = 24
      FieldName = 'entrada_id'
    end
  end
end
