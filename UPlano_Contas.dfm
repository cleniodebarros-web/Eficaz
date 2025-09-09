object FrmPlano_Contas: TFrmPlano_Contas
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Plano de Contas'
  ClientHeight = 390
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
    Width = 716
    Height = 349
    ActivePage = Consulta
    Align = alClient
    TabOrder = 0
    object Consulta: TTabSheet
      Caption = '&Consulta'
      object Alfabeto: TTabSet
        Left = 0
        Top = 300
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
        Top = 281
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
        Height = 281
        Align = alClient
        Color = clInfoBk
        DataSource = DataTabela
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
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
            FieldName = 'TABELA_ID'
            Title.Alignment = taRightJustify
            Title.Caption = 'ID'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Title.Caption = 'Descri'#231#227'o'
            Width = 267
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NIVEL'
            Title.Caption = 'N'#237'vel'
            Width = 105
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO_CONTA'
            Title.Caption = 'Tipo Conta'
            Width = 105
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COD_CONTABIL'
            Title.Caption = 'C'#243'd. Cont'#225'bil'
            Width = 105
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'STATUS'
            Title.Alignment = taCenter
            Title.Caption = 'Status'
            Width = 39
            Visible = True
          end>
      end
    end
    object Manutencao: TTabSheet
      Caption = '&Manuten'#231#227'o'
      ImageIndex = 1
      OnShow = ManutencaoShow
      object Label4: TLabel
        Left = 6
        Top = 61
        Width = 46
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object Label1: TLabel
        Left = 6
        Top = 87
        Width = 23
        Height = 13
        Caption = 'N'#237'vel'
      end
      object Label2: TLabel
        Left = 6
        Top = 113
        Width = 84
        Height = 13
        Caption = 'Sub-Categoria de'
      end
      object Label3: TLabel
        Left = 6
        Top = 139
        Width = 67
        Height = 13
        Caption = 'Tipo da Conta'
      end
      object Label5: TLabel
        Left = 6
        Top = 297
        Width = 55
        Height = 13
        Caption = 'Tipo Tabela'
        Visible = False
      end
      object DBText1: TDBText
        Left = 236
        Top = 113
        Width = 48
        Height = 13
        AutoSize = True
        DataField = 'DESCRICAO'
        DataSource = DataContas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnConta: TSpeedButton
        Left = 165
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
        OnClick = btnContaClick
      end
      object Label6: TLabel
        Left = 7
        Top = 165
        Width = 65
        Height = 13
        Caption = 'C'#243'd. Contabil'
      end
      object Label7: TLabel
        Left = 6
        Top = 191
        Width = 70
        Height = 13
        Caption = 'Conta Especial'
      end
      object Label8: TLabel
        Left = 448
        Top = 165
        Width = 64
        Height = 13
        Caption = 'Dt. Altera'#231#227'o'
      end
      object Label9: TLabel
        Left = 246
        Top = 165
        Width = 53
        Height = 13
        Caption = 'Conta Ref.'
      end
      object Label10: TLabel
        Left = 245
        Top = 191
        Width = 55
        Height = 13
        Caption = 'C'#243'd. Conta'
      end
      object Label11: TLabel
        Left = 6
        Top = 243
        Width = 87
        Height = 13
        Caption = 'Empresa Relat'#243'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object btnEmpresa: TSpeedButton
        Left = 165
        Top = 240
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
      object DBText2: TDBText
        Left = 235
        Top = 243
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
      object Label12: TLabel
        Left = 6
        Top = 218
        Width = 88
        Height = 13
        Caption = 'Descri'#231#227'o Contabil'
      end
      object Label13: TLabel
        Left = 284
        Top = 87
        Width = 31
        Height = 13
        Caption = 'Classe'
      end
      object Label14: TLabel
        Left = 6
        Top = 270
        Width = 55
        Height = 13
        Caption = 'Grupo  DRE'
      end
      object DESCRICAO: TEdit
        Left = 95
        Top = 58
        Width = 458
        Height = 21
        Enabled = False
        MaxLength = 70
        TabOrder = 1
        OnKeyDown = DESCRICAOKeyDown
      end
      object TIPO_CONTA: TComboBox
        Left = 95
        Top = 135
        Width = 209
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
        TabOrder = 4
        OnKeyDown = SUB_CATEGORIAKeyDown
        Items.Strings = (
          'ATIVO'
          'ATIVO CIRCULANTE'
          'REALIZ'#193'VEL'
          'REALIZ. LONGO PRAZO'
          'ATIVO PERMANENTE'
          'COMPENSA'#199#213'ES ATIVAS'
          'PASSIVO'
          'PASSIVO CIRCULANTE'
          'EXIG'#205'VEL'
          'EXIG. A LONGO PRAZO'
          'RES. EXERC. FUTUROS'
          'PATRIM'#212'NIO L'#205'QUIDO'
          'COMP. PASSIVAS'
          'RESULTADO')
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
          Left = 420
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
      object NIVEL: TComboBox
        Left = 95
        Top = 84
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
        TabOrder = 2
        OnKeyDown = SUB_CATEGORIAKeyDown
        Items.Strings = (
          'ANAL'#205'TICA'
          'SINT'#201'TICA'
          '----------------------'
          'CARACTER'#205'STICA'
          'CONTA DE PATRIM'#212'NIO'
          'CONTA DE RESULTADO'
          'ESTRUTURA PATRIMONIAL'
          'NATUREZA E FINALIDADE'
          'RESULTADO ECON'#212'MICO'
          'SISTEMA PR'#211'PRIO')
      end
      object SUB_CATEGORIA: TCurrencyEdit
        Left = 95
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
        OnExit = SUB_CATEGORIAExit
        OnKeyDown = SUB_CATEGORIAKeyDown
      end
      object TIPO_TABELA: TEdit
        Left = 95
        Top = 294
        Width = 29
        Height = 21
        Enabled = False
        MaxLength = 1
        TabOrder = 8
        Visible = False
        OnKeyDown = DESCRICAOKeyDown
      end
      object Plano: TQuickRep
        Left = 95
        Top = 364
        Width = 794
        Height = 1123
        DataSet = QPlano
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
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
        ReportTitle = 'Relat'#243'rio do Plano de Contas'
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
        object QRBand1: TQRBand
          Left = 48
          Top = 48
          Width = 698
          Height = 75
          AlignToBottom = False
          TransparentBand = False
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            198.437500000000000000
            1846.791666666667000000)
          PreCaluculateBandHeight = False
          KeepOnOnePage = False
          BandType = rbPageHeader
          object QRSysData1: TQRSysData
            Left = 0
            Top = 16
            Width = 162
            Height = 15
            Size.Values = (
              39.687500000000000000
              0.000000000000000000
              42.333333333333330000
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
          object Cabec: TQRLabel
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
          object QRSysData2: TQRSysData
            Left = 585
            Top = 16
            Width = 113
            Height = 15
            Size.Values = (
              39.687500000000000000
              1547.812500000000000000
              42.333333333333330000
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
          object QRLabel3: TQRLabel
            Left = 268
            Top = 31
            Width = 162
            Height = 15
            Size.Values = (
              39.687500000000000000
              709.083333333333300000
              82.020833333333330000
              428.625000000000000000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = True
            Caption = '*** PLANO DE CONTAS ***'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRShape1: TQRShape
            Left = 0
            Top = 46
            Width = 698
            Height = 4
            Size.Values = (
              10.583333333333330000
              0.000000000000000000
              121.708333333333300000
              1846.791666666667000000)
            XLColumn = 0
            Shape = qrsHorLine
            VertAdjust = 0
          end
          object QRDBText3: TQRDBText
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
          object QRLabel1: TQRLabel
            Left = 0
            Top = 52
            Width = 43
            Height = 15
            Size.Values = (
              39.687500000000000000
              0.000000000000000000
              137.583333333333300000
              113.770833333333300000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'C'#243'digo'
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
          object QRLabel10: TQRLabel
            Left = 150
            Top = 52
            Width = 64
            Height = 15
            Size.Values = (
              39.687500000000000000
              396.875000000000000000
              137.583333333333300000
              169.333333333333300000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'C'#243'd. Res.'
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
          object QRLabel2: TQRLabel
            Left = 230
            Top = 52
            Width = 64
            Height = 15
            Size.Values = (
              39.687500000000000000
              608.541666666666700000
              137.583333333333300000
              169.333333333333300000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'Descri'#231#227'o'
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
          object QRShape3: TQRShape
            Left = 0
            Top = 69
            Width = 698
            Height = 4
            Size.Values = (
              10.583333333333330000
              0.000000000000000000
              182.562500000000000000
              1846.791666666667000000)
            XLColumn = 0
            Shape = qrsHorLine
            VertAdjust = 0
          end
        end
        object QRBand2: TQRBand
          Left = 48
          Top = 123
          Width = 698
          Height = 17
          AlignToBottom = False
          BeforePrint = QRBand2BeforePrint
          TransparentBand = False
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            44.979166666666670000
            1846.791666666667000000)
          PreCaluculateBandHeight = False
          KeepOnOnePage = False
          BandType = rbDetail
          object QRDBText2: TQRDBText
            Left = 0
            Top = 1
            Width = 43
            Height = 15
            Size.Values = (
              39.687500000000000000
              0.000000000000000000
              2.645833333333333000
              113.770833333333300000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Color = clWhite
            DataSet = QPlano
            DataField = 'CODIGO'
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
          object QRDBText5: TQRDBText
            Left = 150
            Top = 1
            Width = 36
            Height = 15
            Size.Values = (
              39.687500000000000000
              396.875000000000000000
              2.645833333333333000
              95.250000000000000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Color = clWhite
            DataSet = QPlano
            DataField = 'CHAVE'
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
          object QRDBText6: TQRDBText
            Left = 230
            Top = 1
            Width = 64
            Height = 15
            Size.Values = (
              39.687500000000000000
              608.541666666666700000
              2.645833333333333000
              169.333333333333300000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Color = clWhite
            DataSet = QPlano
            DataField = 'DESCRICAO'
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
      object COD_CONTABIL: TEdit
        Left = 95
        Top = 162
        Width = 134
        Height = 21
        Enabled = False
        MaxLength = 20
        TabOrder = 5
        OnKeyDown = DESCRICAOKeyDown
      end
      object ESPECIAL: TComboBox
        Left = 95
        Top = 188
        Width = 67
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
        TabOrder = 10
        Items.Strings = (
          ''
          'SIM'
          'NAO')
      end
      object dt_alteracao: TDateEdit
        Left = 518
        Top = 162
        Width = 90
        Height = 21
        CheckOnExit = True
        DialogTitle = 'Selecione a Data'
        Enabled = False
        NumGlyphs = 2
        ReadOnly = True
        TabOrder = 11
      end
      object CONTA_REF: TEdit
        Left = 305
        Top = 162
        Width = 134
        Height = 21
        Enabled = False
        MaxLength = 20
        TabOrder = 6
        OnKeyDown = DESCRICAOKeyDown
      end
      object cod_conta_contabil: TEdit
        Left = 305
        Top = 188
        Width = 134
        Height = 21
        Enabled = False
        MaxLength = 20
        TabOrder = 12
        OnKeyDown = DESCRICAOKeyDown
      end
      object EMPRESA: TCurrencyEdit
        Left = 95
        Top = 240
        Width = 67
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DecimalPlaces = 0
        DisplayFormat = '0;-0'
        Enabled = False
        TabOrder = 14
        ZeroEmpty = False
        OnExit = EMPRESAExit
      end
      object DESCRICAO_CONTABIL: TEdit
        Left = 95
        Top = 214
        Width = 458
        Height = 21
        Enabled = False
        MaxLength = 70
        TabOrder = 13
        OnKeyDown = DESCRICAOKeyDown
      end
      object Classe: TComboBox
        Left = 321
        Top = 84
        Width = 37
        Height = 21
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 15
        Items.Strings = (
          ''
          '1'
          '2'
          '3'
          '4')
      end
      object Grupo_dre: TComboBox
        Left = 95
        Top = 267
        Width = 210
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
        TabOrder = 7
        OnKeyDown = SUB_CATEGORIAKeyDown
        Items.Strings = (
          'ANAL'#205'TICA'
          'SINT'#201'TICA'
          '----------------------'
          'CARACTER'#205'STICA'
          'CONTA DE PATRIM'#212'NIO'
          'CONTA DE RESULTADO'
          'ESTRUTURA PATRIMONIAL'
          'NATUREZA E FINALIDADE'
          'RESULTADO ECON'#212'MICO'
          'SISTEMA PR'#211'PRIO')
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 349
    Width = 716
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnRetorna: TBitBtn
      Left = 638
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
      TabOrder = 5
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
      TabOrder = 4
      OnClick = btnPesquisaClick
    end
    object btnGera: TBitBtn
      Left = 397
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Gerar Plano'
      TabOrder = 2
      OnClick = btnGeraClick
    end
    object btnImprime: TBitBtn
      Left = 317
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Impr. Plano'
      TabOrder = 1
      OnClick = btnImprimeClick
    end
    object btnImporta: TButton
      Left = 476
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Importar'
      TabOrder = 3
      OnClick = btnImportaClick
    end
    object Button1: TButton
      Left = 236
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Imp. Cta. An.'
      TabOrder = 0
      Visible = False
      OnClick = Button1Click
    end
  end
  object Panel3: TPanel
    Left = 113
    Top = 168
    Width = 489
    Height = 41
    Caption = 'Aguarde...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    Visible = False
  end
  object DataTabela: TDataSource
    AutoEdit = False
    DataSet = QTabela
    Left = 323
    Top = 48
  end
  object DataContas: TDataSource
    DataSet = Qcontas
    Left = 421
    Top = 48
  end
  object QTabela: TFDQuery
    Connection = FrmData.DbF_Eficaz
    SQL.Strings = (
      'SELECT * FROM TABELAS')
    Left = 292
    Top = 48
  end
  object IQuery: TFDQuery
    Connection = FrmData.DbF_Eficaz
    Left = 354
    Top = 48
  end
  object Qcontas: TFDQuery
    Connection = FrmData.DbF_Eficaz
    SQL.Strings = (
      'SELECT * FROM TABELAS'
      'WHERE'
      '(TABELA_ID = :TABELA_ID)'
      'AND (NIVEL = '#39'SINT'#201'TICA'#39')'
      'AND (TIPO_TABELA = '#39'4'#39')')
    Left = 387
    Top = 48
    ParamData = <
      item
        Name = 'TABELA_ID'
        ParamType = ptInput
      end>
  end
  object QPlano: TFDQuery
    Connection = FrmData.DbF_Eficaz
    Left = 454
    Top = 48
  end
  object Q2011: TFDQuery
    Connection = FrmData.DbF_Eficaz
    Left = 34
    Top = 152
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
    Left = 488
    Top = 46
    ParamData = <
      item
        Name = 'EMPRESA_ID'
        ParamType = ptInput
      end>
  end
  object DataEmpresa: TDataSource
    DataSet = QEmpresa
    Left = 528
    Top = 46
  end
end
