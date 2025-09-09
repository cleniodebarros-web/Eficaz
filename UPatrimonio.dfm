object FrmPatrimonio: TFrmPatrimonio
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Patrim'#244'nio'
  ClientHeight = 464
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 716
    Height = 423
    ActivePage = Consulta
    Align = alClient
    TabOrder = 0
    object Consulta: TTabSheet
      Caption = '&Consulta'
      object Alfabeto: TTabSet
        Left = 0
        Top = 374
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
        Top = 355
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
        Height = 355
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
            FieldName = 'PATRIMONIO_ID'
            Title.Alignment = taRightJustify
            Title.Caption = 'ID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Title.Caption = 'Descri'#231#227'o'
            Width = 280
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_AQUISICAO'
            Title.Caption = 'Dt. Aquisi'#231#227'o'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NFISCAL'
            Title.Caption = 'N. Fiscal'
            Width = 95
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ESTADO'
            Title.Caption = 'Estado'
            Width = 95
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'STATUS'
            Title.Alignment = taCenter
            Title.Caption = 'Status'
            Width = 37
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
        Width = 46
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object Label3: TLabel
        Left = 6
        Top = 87
        Width = 65
        Height = 13
        Caption = 'Complemento'
      end
      object Label4: TLabel
        Left = 6
        Top = 191
        Width = 62
        Height = 13
        Caption = 'Dt. Corre'#231#227'o'
      end
      object Label6: TLabel
        Left = 6
        Top = 217
        Width = 60
        Height = 13
        Caption = 'Vr. Corrigido'
      end
      object Label7: TLabel
        Left = 6
        Top = 243
        Width = 78
        Height = 13
        Caption = 'Tx. Deprecia'#231#227'o'
      end
      object Label5: TLabel
        Left = 462
        Top = 191
        Width = 33
        Height = 13
        Caption = 'Estado'
      end
      object Label10: TLabel
        Left = 6
        Top = 269
        Width = 55
        Height = 13
        Caption = 'Cta. Depr.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label21: TLabel
        Left = 6
        Top = 295
        Width = 49
        Height = 13
        Caption = 'Empresa'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label22: TLabel
        Left = 6
        Top = 321
        Width = 65
        Height = 13
        Caption = 'Localiza'#231#227'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label23: TLabel
        Left = 6
        Top = 113
        Width = 58
        Height = 13
        Caption = 'Cta. Imob.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label27: TLabel
        Left = 6
        Top = 347
        Width = 58
        Height = 13
        Caption = 'Observa'#231#227'o'
      end
      object Label12: TLabel
        Left = 6
        Top = 139
        Width = 63
        Height = 13
        Caption = 'Dt. Aquisi'#231#227'o'
      end
      object Label13: TLabel
        Left = 462
        Top = 139
        Width = 82
        Height = 13
        Caption = 'Dt. Incorpora'#231#227'o'
      end
      object Label14: TLabel
        Left = 6
        Top = 165
        Width = 62
        Height = 13
        Caption = 'Vr. Aquisi'#231#227'o'
      end
      object Label15: TLabel
        Left = 462
        Top = 165
        Width = 40
        Height = 13
        Caption = 'N. Fiscal'
      end
      object DBText1: TDBText
        Left = 232
        Top = 295
        Width = 183
        Height = 13
        DataField = 'RAZAO'
        DataSource = DataEmpresa
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText2: TDBText
        Left = 232
        Top = 321
        Width = 183
        Height = 13
        DataField = 'DESCRICAO'
        DataSource = DataLocalizacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText3: TDBText
        Left = 232
        Top = 113
        Width = 183
        Height = 13
        DataField = 'DESCRICAO'
        DataSource = DataConta_Imob
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnEmpresa: TSpeedButton
        Left = 162
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
      object btnLocalizacao: TSpeedButton
        Left = 162
        Top = 318
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
        OnClick = btnLocalizacaoClick
      end
      object btnConta_Imob: TSpeedButton
        Left = 162
        Top = 110
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
        OnClick = btnConta_ImobClick
      end
      object btnConta_Depr: TSpeedButton
        Left = 162
        Top = 266
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
        OnClick = btnConta_DeprClick
      end
      object DBText4: TDBText
        Left = 232
        Top = 269
        Width = 183
        Height = 13
        DataField = 'DESCRICAO'
        DataSource = DataConta_Depr
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 462
        Top = 243
        Width = 73
        Height = 13
        Caption = 'Vida '#218'til (Anos)'
      end
      object DESCRICAO: TEdit
        Left = 92
        Top = 58
        Width = 573
        Height = 21
        Enabled = False
        MaxLength = 150
        TabOrder = 1
        OnKeyDown = DESCRICAOKeyDown
      end
      object COMPLEMENTO: TEdit
        Left = 92
        Top = 84
        Width = 573
        Height = 21
        Enabled = False
        MaxLength = 150
        TabOrder = 2
        OnKeyDown = DESCRICAOKeyDown
      end
      object OBSERVACAO: TEdit
        Left = 92
        Top = 344
        Width = 573
        Height = 21
        Enabled = False
        MaxLength = 150
        TabOrder = 16
        OnKeyDown = DESCRICAOKeyDown
      end
      object DT_AQUISICAO: TDateEdit
        Left = 92
        Top = 136
        Width = 90
        Height = 21
        CheckOnExit = True
        DialogTitle = 'Selecione a Data'
        Enabled = False
        NumGlyphs = 2
        TabOrder = 4
        OnEnter = DT_AQUISICAOEnter
        OnKeyDown = DESCRICAOKeyDown
      end
      object DT_INCORPORA: TDateEdit
        Left = 554
        Top = 135
        Width = 90
        Height = 21
        CheckOnExit = True
        DialogTitle = 'Selecione a Data'
        Enabled = False
        NumGlyphs = 2
        TabOrder = 5
        OnEnter = DT_AQUISICAOEnter
        OnKeyDown = DESCRICAOKeyDown
      end
      object ESTADO: TComboBox
        Left = 554
        Top = 188
        Width = 119
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
        TabOrder = 9
        OnKeyDown = EMPRESA_IDKeyDown
        Items.Strings = (
          'BOM'
          #211'TIMO'
          'REGULAR'
          'P'#201'SSIMO')
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
      object NFISCAL: TEdit
        Left = 554
        Top = 162
        Width = 90
        Height = 21
        Enabled = False
        MaxLength = 6
        TabOrder = 7
        OnKeyDown = DESCRICAOKeyDown
      end
      object EMPRESA_ID: TCurrencyEdit
        Left = 92
        Top = 291
        Width = 67
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DecimalPlaces = 0
        DisplayFormat = '0;-0'
        Enabled = False
        TabOrder = 14
        ZeroEmpty = False
        OnExit = EMPRESA_IDExit
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object LOCALIZACAO_ID: TCurrencyEdit
        Left = 92
        Top = 318
        Width = 67
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DecimalPlaces = 0
        DisplayFormat = '0;-0'
        Enabled = False
        TabOrder = 15
        ZeroEmpty = False
        OnExit = LOCALIZACAO_IDExit
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object CONTA_ATIVO: TCurrencyEdit
        Left = 92
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
        OnExit = CONTA_ATIVOExit
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object VR_AQUISICAO: TRxCalcEdit
        Left = 92
        Top = 161
        Width = 134
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
        Enabled = False
        MaxValue = 999999.990000000000000000
        MinValue = 0.010000000000000000
        NumGlyphs = 2
        TabOrder = 6
        Value = 0.010000000000000000
        ZeroEmpty = False
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object DT_CORRECAO: TDateEdit
        Left = 92
        Top = 188
        Width = 90
        Height = 21
        CheckOnExit = True
        DialogTitle = 'Selecione a Data'
        Enabled = False
        NumGlyphs = 2
        TabOrder = 8
        OnEnter = DT_AQUISICAOEnter
        OnKeyDown = DESCRICAOKeyDown
      end
      object VR_CORRIGIDO: TRxCalcEdit
        Left = 92
        Top = 214
        Width = 134
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
        Enabled = False
        MaxValue = 999999.990000000000000000
        MinValue = 0.010000000000000000
        NumGlyphs = 2
        TabOrder = 10
        Value = 0.010000000000000000
        ZeroEmpty = False
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object TX_DEPRECIACAO: TRxCalcEdit
        Left = 92
        Top = 241
        Width = 90
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
        Enabled = False
        MaxValue = 999.990000000000000000
        NumGlyphs = 2
        TabOrder = 11
        ZeroEmpty = False
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object CTA_DEPRECIACAO: TCurrencyEdit
        Left = 92
        Top = 266
        Width = 67
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DecimalPlaces = 0
        DisplayFormat = '0;-0'
        Enabled = False
        TabOrder = 13
        ZeroEmpty = False
        OnExit = CTA_DEPRECIACAOExit
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object VIDA_UTIL: TCurrencyEdit
        Left = 554
        Top = 240
        Width = 67
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DecimalPlaces = 0
        DisplayFormat = '0;-0'
        Enabled = False
        MaxValue = 999.000000000000000000
        TabOrder = 12
        ZeroEmpty = False
        OnExit = CONTA_ATIVOExit
        OnKeyDown = EMPRESA_IDKeyDown
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 423
    Width = 716
    Height = 41
    Align = alBottom
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
      TabOrder = 1
      OnClick = btnRetornaClick
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
      TabOrder = 0
      OnClick = btnPesquisaClick
    end
  end
  object DataTabela: TDataSource
    AutoEdit = False
    DataSet = QTabela
    Left = 56
    Top = 429
  end
  object DataEmpresa: TDataSource
    DataSet = QEmpresa
    Left = 152
    Top = 429
  end
  object DataLocalizacao: TDataSource
    DataSet = QLocalizacao
    Left = 216
    Top = 429
  end
  object DataConta_Imob: TDataSource
    DataSet = QConta_Imob
    Left = 280
    Top = 429
  end
  object DataConta_Depr: TDataSource
    DataSet = Qconta_Depr
    Left = 344
    Top = 429
  end
  object Qconta_Depr: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM TABELAS'
      'WHERE'
      '(TABELA_ID = :TABELA_ID)'
      'AND (TIPO_TABELA = '#39'4'#39')'
      'AND (NIVEL = '#39'ANAL'#205'TICA'#39')'
      'AND (STATUS = '#39'A'#39')')
    Left = 312
    Top = 428
    ParamData = <
      item
        Name = 'TABELA_ID'
        ParamType = ptInput
      end>
  end
  object QConta_Imob: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM TABELAS'
      'WHERE'
      '(TABELA_ID = :TABELA_ID)'
      'AND (TIPO_TABELA = '#39'4'#39')'
      'AND (NIVEL = '#39'ANAL'#205'TICA'#39')'
      'AND (STATUS = '#39'A'#39')')
    Left = 248
    Top = 432
    ParamData = <
      item
        Name = 'TABELA_ID'
        ParamType = ptInput
      end>
  end
  object QLocalizacao: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM TABELAS'
      'WHERE'
      '(TABELA_ID = :TABELA_ID)'
      'AND (TIPO_TABELA = '#39'8'#39')'
      'AND (STATUS = '#39'A'#39')')
    Left = 184
    Top = 432
    ParamData = <
      item
        Name = 'TABELA_ID'
        ParamType = ptInput
      end>
  end
  object QEmpresa: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM EMPRESAS'
      'WHERE'
      '(EMPRESA_ID = :EMPRESA_ID)'
      'AND (STATUS = '#39'A'#39')')
    Left = 120
    Top = 432
    ParamData = <
      item
        Name = 'EMPRESA_ID'
        ParamType = ptInput
      end>
  end
  object IQuery: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 88
    Top = 432
  end
  object QTabela: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM PATRIMONIO')
    Left = 16
    Top = 424
  end
end
