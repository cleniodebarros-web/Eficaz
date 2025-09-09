object FrmCaixas: TFrmCaixas
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Caixas/Bancos/Aplica'#231#245'es'
  ClientHeight = 400
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
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 716
    Height = 359
    ActivePage = Consulta
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
        Top = 310
        Width = 708
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
        Top = 291
        Width = 708
        Height = 19
        Panels = <
          item
            Text = '<F3> - Desativar'
            Width = 354
          end
          item
            Text = '<F4> - Reativar'
            Width = 354
          end>
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 708
        Height = 291
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
            FieldName = 'BANCO_ID'
            Title.Alignment = taRightJustify
            Title.Caption = 'ID'
            Width = 49
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO'
            Title.Caption = 'Tipo'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Title.Caption = 'Descri'#231#227'o'
            Width = 164
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_AGENCIA'
            Title.Caption = 'Ag'#234'ncia'
            Width = 153
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUM_AGENCIA'
            Title.Caption = 'N'#186' Ag'#234'ncia'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUM_BANCO'
            Title.Caption = 'N'#186' Banco'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUM_CONTA'
            Title.Caption = 'N'#186' Conta'
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
      ImageIndex = 1
      OnShow = ManutencaoShow
      object Label2: TLabel
        Left = 6
        Top = 61
        Width = 52
        Height = 13
        Caption = 'Tipo Banco'
      end
      object Label3: TLabel
        Left = 6
        Top = 87
        Width = 74
        Height = 13
        Caption = 'Nome do Banco'
      end
      object Label4: TLabel
        Left = 6
        Top = 113
        Width = 88
        Height = 13
        Caption = 'N'#250'm. Banco/D'#237'gito'
      end
      object Label5: TLabel
        Left = 6
        Top = 139
        Width = 83
        Height = 13
        Caption = 'Nome da Ag'#234'ncia'
      end
      object Label6: TLabel
        Left = 432
        Top = 139
        Width = 97
        Height = 13
        Caption = 'N'#250'm. Ag'#234'ncia/D'#237'gito'
      end
      object Label7: TLabel
        Left = 6
        Top = 165
        Width = 88
        Height = 13
        Caption = 'N'#250'm. Conta/D'#237'gito'
      end
      object Label9: TLabel
        Left = 6
        Top = 243
        Width = 65
        Height = 13
        Caption = 'Tipo de Limite'
      end
      object Label8: TLabel
        Left = 6
        Top = 269
        Width = 80
        Height = 13
        Caption = 'Limite de Cr'#233'dito'
      end
      object Label10: TLabel
        Left = 6
        Top = 295
        Width = 41
        Height = 13
        Caption = 'Empresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object DBText1: TDBText
        Left = 241
        Top = 295
        Width = 48
        Height = 13
        AutoSize = True
        DataField = 'RAZAO'
        DataSource = DataEmpresa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnEmpresa: TSpeedButton
        Left = 171
        Top = 292
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
      object Label1: TLabel
        Left = 432
        Top = 269
        Width = 65
        Height = 13
        Caption = 'C'#243'd. Contabil'
      end
      object Label11: TLabel
        Left = 6
        Top = 191
        Width = 77
        Height = 13
        Caption = 'C'#243'digo Cedente'
      end
      object Label12: TLabel
        Left = 432
        Top = 191
        Width = 73
        Height = 13
        Caption = 'N'#250'm. Conv'#234'nio'
      end
      object Label13: TLabel
        Left = 6
        Top = 217
        Width = 82
        Height = 13
        Caption = 'N'#250'm. Modalidade'
      end
      object Label14: TLabel
        Left = 432
        Top = 217
        Width = 74
        Height = 13
        Caption = 'N'#250'm. Resumido'
      end
      object DESCRICAO: TEdit
        Left = 101
        Top = 85
        Width = 301
        Height = 21
        Enabled = False
        MaxLength = 30
        TabOrder = 2
        OnKeyDown = DESCRICAOKeyDown
      end
      object NOME_AGENCIA: TEdit
        Left = 101
        Top = 136
        Width = 175
        Height = 21
        Enabled = False
        MaxLength = 30
        TabOrder = 5
        OnKeyDown = DESCRICAOKeyDown
      end
      object NUM_AGENCIA: TEdit
        Left = 535
        Top = 136
        Width = 95
        Height = 21
        Enabled = False
        MaxLength = 10
        TabOrder = 6
        OnKeyDown = DESCRICAOKeyDown
      end
      object NUM_CONTA: TEdit
        Left = 101
        Top = 162
        Width = 95
        Height = 21
        Enabled = False
        MaxLength = 12
        TabOrder = 8
        OnKeyDown = DESCRICAOKeyDown
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 708
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
          Left = 523
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
      object TIPO: TComboBox
        Left = 101
        Top = 58
        Width = 174
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
        TabOrder = 1
        OnKeyDown = EMPRESA_IDKeyDown
        Items.Strings = (
          'APLICA'#199#195'O'
          'BANCO'
          'CAIXA')
      end
      object TIPO_LIMITE: TComboBox
        Left = 101
        Top = 240
        Width = 174
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 20
        ParentFont = False
        TabOrder = 14
        OnKeyDown = EMPRESA_IDKeyDown
        Items.Strings = (
          ''
          'INCLUSO NO SALDO'
          'EXCLUSO DO SALDO')
      end
      object EMPRESA_ID: TCurrencyEdit
        Left = 101
        Top = 292
        Width = 67
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DecimalPlaces = 0
        DisplayFormat = '0;-0'
        Enabled = False
        TabOrder = 17
        ZeroEmpty = False
        OnExit = EMPRESA_IDExit
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object LIMITE: TRxCalcEdit
        Left = 101
        Top = 266
        Width = 92
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
        Enabled = False
        NumGlyphs = 2
        TabOrder = 15
        ZeroEmpty = False
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object COD_CONTABIL: TEdit
        Left = 535
        Top = 266
        Width = 134
        Height = 21
        Enabled = False
        MaxLength = 20
        TabOrder = 16
        OnKeyDown = DESCRICAOKeyDown
      end
      object NUM_BANCO: TCurrencyEdit
        Left = 101
        Top = 110
        Width = 67
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DecimalPlaces = 0
        DisplayFormat = '0;-0'
        Enabled = False
        TabOrder = 3
        ZeroEmpty = False
        OnChange = NUM_BANCOChange
        OnExit = EMPRESA_IDExit
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object DIG_BANCO: TCurrencyEdit
        Left = 171
        Top = 110
        Width = 41
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DecimalPlaces = 0
        DisplayFormat = '0;-0'
        Enabled = False
        TabOrder = 4
        ZeroEmpty = False
        OnExit = EMPRESA_IDExit
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object DIG_AGENCIA: TEdit
        Left = 633
        Top = 136
        Width = 36
        Height = 21
        Enabled = False
        MaxLength = 2
        TabOrder = 7
        OnKeyDown = DESCRICAOKeyDown
      end
      object DIG_CONTA: TEdit
        Left = 199
        Top = 162
        Width = 36
        Height = 21
        Enabled = False
        MaxLength = 2
        TabOrder = 9
        OnKeyDown = DESCRICAOKeyDown
      end
      object COD_CEDENTE: TEdit
        Left = 101
        Top = 188
        Width = 95
        Height = 21
        Enabled = False
        MaxLength = 10
        TabOrder = 10
        OnKeyDown = DESCRICAOKeyDown
      end
      object CONV_CEDENTE: TEdit
        Left = 535
        Top = 188
        Width = 95
        Height = 21
        Enabled = False
        MaxLength = 10
        TabOrder = 11
        OnKeyDown = DESCRICAOKeyDown
      end
      object MOD_CEDENTE: TEdit
        Left = 101
        Top = 214
        Width = 95
        Height = 21
        Enabled = False
        MaxLength = 10
        TabOrder = 12
        OnKeyDown = DESCRICAOKeyDown
      end
      object NUM_RES_CEDENTE: TEdit
        Left = 535
        Top = 214
        Width = 95
        Height = 21
        Enabled = False
        MaxLength = 10
        TabOrder = 13
        OnKeyDown = DESCRICAOKeyDown
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 359
    Width = 716
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
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
      TabOrder = 0
      OnClick = btnRetornaClick
    end
    object btnPesquisa: TBitBtn
      Left = 556
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
  end
  object DataTabela: TDataSource
    AutoEdit = False
    DataSet = QTabela
    Left = 176
    Top = 368
  end
  object DataEmpresa: TDataSource
    DataSet = QEmpresa
    Left = 232
    Top = 368
  end
  object QTabela: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM BANCOS')
    Left = 24
    Top = 368
  end
  object IQuery: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 72
    Top = 368
  end
  object QEmpresa: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      'SELECT * FROM EMPRESAS'
      'WHERE'
      '(EMPRESA_ID = :EMPRESA_ID)'
      'AND (STATUS = '#39'A'#39')')
    Left = 128
    Top = 368
    ParamData = <
      item
        Name = 'EMPRESA_ID'
        ParamType = ptInput
      end>
  end
end
