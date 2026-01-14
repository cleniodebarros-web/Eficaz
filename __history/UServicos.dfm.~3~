object FrmServicos: TFrmServicos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Servi'#231'os'
  ClientHeight = 366
  ClientWidth = 791
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
    Width = 791
    Height = 325
    ActivePage = Manutencao
    Align = alClient
    TabOrder = 0
    object Consulta: TTabSheet
      Caption = '&Consulta'
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 783
        Height = 257
        Align = alClient
        Color = clInfoBk
        DataSource = DataTabela
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick]
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
            FieldName = 'SERVICO_ID'
            Title.Alignment = taRightJustify
            Title.Caption = 'ID'
            Width = 57
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Title.Caption = 'Descri'#231#227'o'
            Width = 263
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRECO'
            Title.Alignment = taRightJustify
            Title.Caption = 'Pre'#231'o'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IR'
            Title.Alignment = taRightJustify
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ISS'
            Title.Alignment = taRightJustify
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'STATUS'
            Title.Caption = 'Status'
            Width = 50
            Visible = True
          end>
      end
      object StatusBar1: TStatusBar
        Left = 0
        Top = 278
        Width = 783
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
      object Alfabeto: TTabSet
        Left = 0
        Top = 257
        Width = 783
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
    end
    object Manutencao: TTabSheet
      Caption = '&Manuten'#231#227'o'
      ImageIndex = 1
      OnShow = ManutencaoShow
      object Label3: TLabel
        Left = 6
        Top = 61
        Width = 46
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object Label4: TLabel
        Left = 6
        Top = 139
        Width = 27
        Height = 13
        Caption = 'Pre'#231'o'
      end
      object Label5: TLabel
        Left = 438
        Top = 139
        Width = 45
        Height = 13
        Caption = 'Comiss'#227'o'
      end
      object Label1: TLabel
        Left = 6
        Top = 87
        Width = 62
        Height = 13
        Caption = 'C'#243'd. Interno'
      end
      object Label2: TLabel
        Left = 438
        Top = 87
        Width = 39
        Height = 13
        Caption = 'Unidade'
      end
      object Label16: TLabel
        Left = 6
        Top = 113
        Width = 48
        Height = 13
        Caption = 'C'#243'd. NCM'
      end
      object btnNCM: TSpeedButton
        Left = 148
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
        OnClick = btnNCMClick
      end
      object Label61: TLabel
        Left = 438
        Top = 113
        Width = 61
        Height = 13
        Caption = 'C'#243'd. G'#234'nero'
      end
      object btnGenero: TSpeedButton
        Left = 560
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
        OnClick = btnGeneroClick
      end
      object Label59: TLabel
        Left = 290
        Top = 139
        Width = 60
        Height = 13
        Caption = 'C'#243'd. CSOSN'
      end
      object DESCRICAO: TEdit
        Left = 73
        Top = 58
        Width = 331
        Height = 21
        Enabled = False
        MaxLength = 40
        TabOrder = 1
        OnKeyDown = DESCRICAOKeyDown
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 783
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object btnPrior: TBitBtn
          Left = 6
          Top = 6
          Width = 85
          Height = 25
          Caption = 'Anterior'
          Spacing = 10
          TabOrder = 0
          OnClick = btnPriorClick
        end
        object btnNext: TBitBtn
          Left = 107
          Top = 6
          Width = 85
          Height = 25
          Caption = 'Pr'#243'ximo'
          Spacing = 10
          TabOrder = 1
          OnClick = btnNextClick
        end
        object btnInsert: TBitBtn
          Left = 209
          Top = 6
          Width = 85
          Height = 25
          Caption = '&Incluir'
          Spacing = 10
          TabOrder = 2
          OnClick = btnInsertClick
        end
        object btnEdit: TBitBtn
          Left = 311
          Top = 6
          Width = 85
          Height = 25
          Caption = 'A&lterar'
          Spacing = 10
          TabOrder = 3
          OnClick = btnEditClick
        end
        object btnDelete: TBitBtn
          Left = 413
          Top = 6
          Width = 85
          Height = 25
          Caption = '&Excluir'
          Spacing = 10
          TabOrder = 4
          OnClick = btnDeleteClick
        end
        object btnSave: TBitBtn
          Left = 515
          Top = 6
          Width = 85
          Height = 25
          Caption = '&Salvar'
          Spacing = 10
          TabOrder = 5
          OnClick = btnSaveClick
        end
        object btnDiscard: TBitBtn
          Left = 617
          Top = 6
          Width = 85
          Height = 25
          Caption = 'C&ancelar'
          Spacing = 10
          TabOrder = 6
          OnClick = btnDiscardClick
        end
      end
      object PRECO: TCurrencyEdit
        Left = 73
        Top = 136
        Width = 114
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        DisplayFormat = '0.00;-0.00'
        Enabled = False
        MaxValue = 99999.990000000000000000
        MinValue = 0.010000000000000000
        TabOrder = 5
        Value = 0.010000000000000000
        ZeroEmpty = False
        OnKeyDown = PRECOKeyDown
      end
      object COMISSAO: TCurrencyEdit
        Left = 510
        Top = 136
        Width = 114
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        DisplayFormat = '0.00;-0.00'
        Enabled = False
        MaxValue = 999.990000000000000000
        TabOrder = 7
        ZeroEmpty = False
        OnKeyDown = PRECOKeyDown
      end
      object UNIDADE: TEdit
        Left = 510
        Top = 84
        Width = 118
        Height = 21
        Enabled = False
        MaxLength = 6
        TabOrder = 2
        OnKeyDown = DESCRICAOKeyDown
      end
      object NCM: TEdit
        Left = 73
        Top = 110
        Width = 73
        Height = 21
        Enabled = False
        MaxLength = 8
        TabOrder = 3
        OnKeyDown = DESCRICAOKeyDown
      end
      object COD_GEN: TEdit
        Left = 510
        Top = 110
        Width = 47
        Height = 21
        Enabled = False
        MaxLength = 2
        TabOrder = 4
        OnKeyDown = DESCRICAOKeyDown
      end
      object PageControl3: TPageControl
        Left = 0
        Top = 163
        Width = 783
        Height = 134
        ActivePage = TabSheet8
        Align = alBottom
        TabOrder = 8
        object TabSheet8: TTabSheet
          Caption = 'Al'#237'quotas/Desconto'
          object Label6: TLabel
            Left = 6
            Top = 9
            Width = 35
            Height = 13
            Caption = 'Al'#237'q. IR'
          end
          object Label7: TLabel
            Left = 434
            Top = 9
            Width = 40
            Height = 13
            Caption = 'Al'#237'q. ISS'
          end
          object Label8: TLabel
            Left = 6
            Top = 35
            Width = 49
            Height = 13
            Caption = 'Al'#237'q. ICMS'
          end
          object Label9: TLabel
            Left = 6
            Top = 61
            Width = 52
            Height = 13
            Caption = 'Mod. ICMS'
          end
          object Label11: TLabel
            Left = 434
            Top = 34
            Width = 47
            Height = 13
            Caption = 'Al'#237'q. INSS'
          end
          object Label10: TLabel
            Left = 434
            Top = 58
            Width = 68
            Height = 13
            Caption = '% Desc. M'#225'x.'
          end
          object IR: TCurrencyEdit
            Left = 73
            Top = 6
            Width = 88
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            AutoSize = False
            DisplayFormat = '0.00;-0.00'
            Enabled = False
            MaxValue = 999.990000000000000000
            TabOrder = 0
            ZeroEmpty = False
            OnKeyDown = PRECOKeyDown
          end
          object ISS: TCurrencyEdit
            Left = 510
            Top = 6
            Width = 88
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            AutoSize = False
            DisplayFormat = '0.00;-0.00'
            Enabled = False
            MaxValue = 999.990000000000000000
            TabOrder = 1
            ZeroEmpty = False
            OnKeyDown = PRECOKeyDown
          end
          object ICMS: TCurrencyEdit
            Left = 73
            Top = 32
            Width = 88
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            AutoSize = False
            DisplayFormat = '0.00;-0.00'
            Enabled = False
            MaxValue = 999.990000000000000000
            TabOrder = 2
            ZeroEmpty = False
            OnKeyDown = PRECOKeyDown
          end
          object MOD_ICMS: TComboBox
            Left = 73
            Top = 58
            Width = 270
            Height = 21
            CharCase = ecUpperCase
            Color = clWhite
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 25
            ParentFont = False
            TabOrder = 3
            Items.Strings = (
              ''
              'MVA'
              'PAUTA'
              'PR. TABELADO'
              'VALOR DA OPERA'#199#195'O')
          end
          object ALIQ_ISS: TCurrencyEdit
            Left = 510
            Top = 31
            Width = 88
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            AutoSize = False
            DisplayFormat = '0.00;-0.00'
            Enabled = False
            MaxValue = 999.990000000000000000
            TabOrder = 4
            ZeroEmpty = False
            OnKeyDown = PRECOKeyDown
          end
          object DESC_MAXIMO: TCurrencyEdit
            Left = 510
            Top = 58
            Width = 88
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            AutoSize = False
            DisplayFormat = '0.00;-0.00'
            Enabled = False
            MaxValue = 999.990000000000000000
            TabOrder = 5
            ZeroEmpty = False
            OnKeyDown = PRECOKeyDown
          end
        end
        object TabSheet9: TTabSheet
          Caption = 'Pis/Cofins (Entrada)'
          ImageIndex = 1
          object Label68: TLabel
            Left = 6
            Top = 9
            Width = 38
            Height = 13
            Caption = 'CST PIS'
          end
          object btnCst_Pis_Entr: TSpeedButton
            Left = 111
            Top = 6
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
            OnClick = btnCst_Pis_EntrClick
          end
          object Label70: TLabel
            Left = 6
            Top = 35
            Width = 60
            Height = 13
            Caption = 'CST COFINS'
          end
          object btnCst_Cofins_Entr: TSpeedButton
            Left = 111
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
            OnClick = btnCst_Cofins_EntrClick
          end
          object Label67: TLabel
            Left = 6
            Top = 61
            Width = 40
            Height = 13
            Caption = 'Al'#237'q. PIS'
          end
          object Label69: TLabel
            Left = 294
            Top = 61
            Width = 62
            Height = 13
            Caption = 'Al'#237'q. COFINS'
          end
          object CST_PIS_ENTR: TEdit
            Left = 72
            Top = 7
            Width = 35
            Height = 21
            Enabled = False
            MaxLength = 2
            TabOrder = 0
            OnExit = CST_PIS_ENTRExit
            OnKeyDown = DESCRICAOKeyDown
          end
          object CST_COFINS_ENTR: TEdit
            Left = 72
            Top = 32
            Width = 35
            Height = 21
            Enabled = False
            MaxLength = 2
            TabOrder = 1
            OnExit = CST_COFINS_ENTRExit
            OnKeyDown = DESCRICAOKeyDown
          end
          object PIS_ENTR: TRxCalcEdit
            Left = 72
            Top = 58
            Width = 82
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            DecimalPlaces = 4
            DisplayFormat = '0.0000;-0.0000'
            Enabled = False
            MaxValue = 100.000000000000000000
            NumGlyphs = 2
            TabOrder = 2
            ZeroEmpty = False
            OnKeyDown = PRECOKeyDown
          end
          object COFINS_ENTR: TRxCalcEdit
            Left = 361
            Top = 58
            Width = 82
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            DecimalPlaces = 4
            DisplayFormat = '0.0000;-0.0000'
            Enabled = False
            MaxValue = 100.000000000000000000
            NumGlyphs = 2
            TabOrder = 3
            ZeroEmpty = False
            OnKeyDown = PRECOKeyDown
          end
        end
        object TabSheet10: TTabSheet
          Caption = 'Pis/Cofins (Sa'#237'da)'
          ImageIndex = 2
          object btnCst_Pis: TSpeedButton
            Left = 111
            Top = 16
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
            OnClick = btnCst_PisClick
          end
          object Label62: TLabel
            Left = 6
            Top = 19
            Width = 38
            Height = 13
            Caption = 'CST PIS'
          end
          object Label63: TLabel
            Left = 6
            Top = 45
            Width = 60
            Height = 13
            Caption = 'CST COFINS'
          end
          object btnCst_Cofins: TSpeedButton
            Left = 111
            Top = 42
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
            OnClick = btnCst_CofinsClick
          end
          object Label58: TLabel
            Left = 6
            Top = 73
            Width = 40
            Height = 13
            Caption = 'Al'#237'q. PIS'
          end
          object Label57: TLabel
            Left = 249
            Top = 73
            Width = 62
            Height = 13
            Caption = 'Al'#237'q. COFINS'
          end
          object Label71: TLabel
            Left = 249
            Top = 45
            Width = 112
            Height = 13
            Caption = 'Nat. Base Calc. Cr'#233'dito'
          end
          object CST_PIS: TEdit
            Left = 72
            Top = 16
            Width = 35
            Height = 21
            Enabled = False
            MaxLength = 2
            TabOrder = 0
            OnExit = CST_PISExit
            OnKeyDown = DESCRICAOKeyDown
          end
          object CST_COFINS: TEdit
            Left = 72
            Top = 42
            Width = 35
            Height = 21
            Enabled = False
            MaxLength = 2
            TabOrder = 1
            OnExit = CST_COFINSExit
            OnKeyDown = DESCRICAOKeyDown
          end
          object PIS: TRxCalcEdit
            Left = 72
            Top = 70
            Width = 82
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            DecimalPlaces = 4
            DisplayFormat = '0.0000;-0.0000'
            Enabled = False
            MaxValue = 100.000000000000000000
            NumGlyphs = 2
            TabOrder = 2
            ZeroEmpty = False
            OnKeyDown = PRECOKeyDown
          end
          object COFINS: TRxCalcEdit
            Left = 316
            Top = 70
            Width = 82
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            DecimalPlaces = 4
            DisplayFormat = '0.0000;-0.0000'
            Enabled = False
            MaxValue = 100.000000000000000000
            NumGlyphs = 2
            TabOrder = 3
            ZeroEmpty = False
            OnKeyDown = PRECOKeyDown
          end
          object Memo1: TMemo
            Left = 404
            Top = 11
            Width = 347
            Height = 86
            Lines.Strings = (
              '                         Natureza base c'#225'lculo de cr'#233'dito'
              '03 - Aquisi'#231#227'o de servi'#231'os utilizados como insumo'
              '05 - Alugu'#233'is de pr'#233'dios'
              '06 - Alugu'#233'is de m'#225'quinas e equipamentos'
              '07 - Armazenagem de mercadoria e frete na opera'#231#227'o de venda'
              '13 - Outras Opera'#231#245'es com Direito a Cr'#233'dito'
              '15 - Atividade Imobili'#225'ria - Custo Incorrido de Unidade '
              'Imobili'#225'ria')
            ReadOnly = True
            ScrollBars = ssVertical
            TabOrder = 4
          end
          object nat_rec: TEdit
            Left = 379
            Top = 42
            Width = 19
            Height = 21
            Enabled = False
            MaxLength = 2
            TabOrder = 5
            OnExit = CST_COFINSExit
            OnKeyDown = DESCRICAOKeyDown
          end
        end
      end
      object COD_INTERNO: TCurrencyEdit
        Left = 73
        Top = 83
        Width = 73
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0;-0'
        Enabled = False
        TabOrder = 9
        ZeroEmpty = False
      end
      object CSOSN: TEdit
        Left = 357
        Top = 136
        Width = 47
        Height = 21
        Enabled = False
        MaxLength = 3
        TabOrder = 6
        OnKeyDown = DESCRICAOKeyDown
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 325
    Width = 791
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnRetorna: TBitBtn
      Left = 625
      Top = 8
      Width = 85
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
      Spacing = 10
      TabOrder = 0
      OnClick = btnRetornaClick
    end
  end
  object DataTabela: TDataSource
    AutoEdit = False
    DataSet = QTabela
    Left = 48
    Top = 312
  end
  object IQuery: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 88
    Top = 314
  end
  object QTabela: TFDQuery
    AfterOpen = QTabelaAfterOpen
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM SERVICOS')
    Left = 8
    Top = 314
  end
end
