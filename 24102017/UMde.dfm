object FrmMde: TFrmMde
  Left = 411
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Manifesto de Documentos Fiscais Eletronico - MDF-e'
  ClientHeight = 670
  ClientWidth = 723
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDesigned
  Scaled = False
  Visible = True
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 4
    Top = 159
    Width = 647
    Height = 0
    Shape = bsTopLine
  end
  object Label8: TLabel
    Left = 431
    Top = 82
    Width = 46
    Height = 13
    Caption = 'Insc. Est.'
  end
  object Label13: TLabel
    Left = 422
    Top = 226
    Width = 71
    Height = 13
    Caption = 'UF Descarrega'
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 723
    Height = 631
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
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 715
        Height = 582
        Align = alClient
        Color = clInfoBk
        DataSource = DataTabela
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clBlue
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = DBGrid1DrawColumnCell
        OnDblClick = DBGrid1DblClick
        OnKeyPress = DBGrid1KeyPress
        OnTitleClick = DBGrid1TitleClick
        Columns = <
          item
            Expanded = False
            FieldName = 'MDEFISCAL_ID'
            Title.Caption = 'C'#243'digo'
            Width = 54
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_SAIDA'
            Title.Caption = 'Dt. Sa'#237'da'
            Width = 76
            Visible = True
          end
          item
            DropDownRows = 9
            Expanded = False
            FieldName = 'NO_DOC_FISCAL'
            Title.Caption = 'N'#186' Documento'
            Width = 78
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SERIE'
            Title.Caption = 'S'#233'rie'
            Width = 35
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MODELO'
            Title.Caption = 'Modelo'
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'chave_mdf'
            Title.Caption = 'Chave MDF-e'
            Width = 319
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'STATUS'
            Title.Alignment = taCenter
            Title.Caption = 'Status'
            Width = 132
            Visible = True
          end>
      end
      object Dias: TTabSet
        Left = 0
        Top = 582
        Width = 715
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
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7'
          '8'
          '9'
          '10'
          '11'
          '12'
          '13'
          '14'
          '15'
          '16'
          '17'
          '18'
          '19'
          '20'
          '21'
          '22'
          '23'
          '24'
          '25'
          '26'
          '27'
          '28'
          '29'
          '30'
          '31'
          'Todos')
        TabIndex = 0
        OnClick = DiasClick
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
        Left = 459
        Top = 118
        Width = 90
        Height = 13
        Alignment = taRightJustify
        Caption = 'Data/hora Emiss'#227'o'
      end
      object Label46: TLabel
        Left = 165
        Top = 341
        Width = 22
        Height = 13
        Caption = 'Tara'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 8
        Top = 368
        Width = 20
        Height = 13
        Caption = 'Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 521
        Top = 169
        Width = 85
        Height = 13
        Caption = 'Forma Emiss'#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 8
        Top = 313
        Width = 34
        Height = 13
        Caption = 'RNTRC'
      end
      object Label12: TLabel
        Left = 8
        Top = 169
        Width = 54
        Height = 13
        Caption = 'Modalidade'
      end
      object Label17: TLabel
        Left = 8
        Top = 144
        Width = 99
        Height = 13
        Alignment = taRightJustify
        Caption = 'Dt./Hr. Inicio Viagem'
      end
      object Label33: TLabel
        Left = 8
        Top = 55
        Width = 85
        Height = 13
        Caption = 'Nome/R. Social'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label36: TLabel
        Left = 8
        Top = 82
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
      object Label34: TLabel
        Left = 8
        Top = 340
        Width = 61
        Height = 13
        Caption = 'Placa Ve'#237'culo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label35: TLabel
        Left = 165
        Top = 313
        Width = 50
        Height = 13
        Caption = 'UF/Ve'#237'culo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label39: TLabel
        Left = 353
        Top = 169
        Width = 13
        Height = 13
        Caption = 'UF'
      end
      object Label40: TLabel
        Left = 486
        Top = 82
        Width = 50
        Height = 13
        Caption = 'Insc. Est.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl1: TLabel
        Left = 429
        Top = 502
        Width = 53
        Height = 13
        Caption = 'C'#243'd. IBGE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object btnIBGE: TSpeedButton
        Left = 569
        Top = 499
        Width = 62
        Height = 21
        Cursor = crHandPoint
        Caption = '(F7)'
        Enabled = False
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
        Visible = False
        OnClick = btnIBGEClick
      end
      object Label15: TLabel
        Left = 8
        Top = 116
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
      object Label22: TLabel
        Left = 246
        Top = 115
        Width = 29
        Height = 13
        Caption = 'Serie'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label23: TLabel
        Left = 354
        Top = 117
        Width = 41
        Height = 13
        Caption = 'Modelo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label24: TLabel
        Left = 351
        Top = 143
        Width = 65
        Height = 13
        Caption = 'Tipo Emitente'
      end
      object Label25: TLabel
        Left = 173
        Top = 217
        Width = 85
        Height = 13
        Caption = 'UF Carregamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label26: TLabel
        Left = 207
        Top = 196
        Width = 306
        Height = 13
        Caption = 'Informa'#231#245'es sobre o Carregamento/Percurso/Descarregamento'
      end
      object Label27: TLabel
        Left = 2
        Top = 247
        Width = 43
        Height = 13
        Caption = 'Municipio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Bevel5: TBevel
        Left = 8
        Top = 306
        Width = 701
        Height = 2
        Shape = bsTopLine
      end
      object Label28: TLabel
        Left = 154
        Top = 273
        Width = 101
        Height = 13
        Caption = 'UF Descarregamento'
      end
      object Bevel8: TBevel
        Left = 8
        Top = 104
        Width = 701
        Height = 8
        Shape = bsTopLine
      end
      object Label29: TLabel
        Left = 8
        Top = 217
        Width = 25
        Height = 13
        Caption = 'CIOT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label30: TLabel
        Left = 294
        Top = 470
        Width = 115
        Height = 13
        Caption = 'Rela'#231#227'o de Documentos'
      end
      object Bevel9: TBevel
        Left = 8
        Top = 193
        Width = 701
        Height = 2
        Shape = bsTopLine
      end
      object Bevel6: TBevel
        Left = 8
        Top = 391
        Width = 701
        Height = 7
        Shape = bsTopLine
      end
      object Label2: TLabel
        Left = 542
        Top = 425
        Width = 61
        Height = 13
        Caption = 'Valor Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 221
        Top = 425
        Width = 63
        Height = 13
        Caption = 'Peso Carga'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 8
        Top = 425
        Width = 71
        Height = 13
        Caption = 'Un. da Carga'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 5
        Top = 399
        Width = 60
        Height = 13
        Caption = 'Inf. Compl.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 548
        Top = 55
        Width = 37
        Height = 13
        Caption = 'Status'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 9
        Top = 451
        Width = 38
        Height = 13
        Caption = 'Chave '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Bevel3: TBevel
        Left = 3
        Top = 470
        Width = 711
        Height = 13
        Shape = bsTopLine
      end
      object DT_SAIDA: TDateEdit
        Left = 553
        Top = 115
        Width = 88
        Height = 21
        CheckOnExit = True
        DialogTitle = 'Selecione a Data'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 15
        OnEnter = DT_SAIDAEnter
        OnExit = DT_SAIDAExit
        OnKeyDown = DT_SAIDAKeyDown
      end
      object TARA: TRxCalcEdit
        Left = 221
        Top = 339
        Width = 102
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DecimalPlaces = 3
        DisplayFormat = '0'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 33
        ZeroEmpty = False
        OnKeyDown = CNPJ_TRANSPORTADORKeyDown
      end
      object NO_DOC_FISCAL: TCurrencyEdit
        Left = 83
        Top = 115
        Width = 127
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DecimalPlaces = 0
        DisplayFormat = '0;-0'
        Enabled = False
        TabOrder = 12
        ZeroEmpty = False
        OnKeyDown = CNPJ_TRANSPORTADORKeyDown
      end
      object FORMA_EMISSAO: TComboBox
        Left = 614
        Top = 170
        Width = 95
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
        TabOrder = 22
        OnClick = FORMA_EMISSAOClick
        OnKeyDown = CNPJ_TRANSPORTADORKeyDown
        Items.Strings = (
          'NORMAL'
          'CONTING'#202'NCIA FS')
      end
      object Empresa_id: TCurrencyEdit
        Left = 345
        Top = 77
        Width = 71
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DecimalPlaces = 0
        DisplayFormat = '0;-0'
        TabOrder = 9
        Visible = False
        ZeroEmpty = False
        OnKeyDown = CNPJ_TRANSPORTADORKeyDown
      end
      object TIPO_TRANSPORTE: TComboBox
        Left = 98
        Top = 168
        Width = 116
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
        TabOrder = 20
        Text = 'RODOVI'#193'RIO'
        OnKeyDown = CNPJ_TRANSPORTADORKeyDown
        Items.Strings = (
          'RODOVI'#193'RIO'
          'AQUAVI'#193'RIO')
      end
      object DT_PREVISAO: TDateEdit
        Left = 123
        Top = 140
        Width = 87
        Height = 21
        CheckOnExit = True
        DialogTitle = 'Selecione a Data'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 17
        OnEnter = DT_SAIDAEnter
        OnKeyDown = DT_SAIDAKeyDown
      end
      object HR_PREVISAO: TMaskEdit
        Left = 221
        Top = 141
        Width = 48
        Height = 21
        Enabled = False
        EditMask = '99:99'
        MaxLength = 5
        TabOrder = 18
        Text = '  :  '
        OnKeyDown = DT_SAIDAKeyDown
      end
      object Grid_Notas: TDBGrid
        Left = 8
        Top = 489
        Width = 703
        Height = 97
        DataSource = DataNotas
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
        ParentFont = False
        TabOrder = 42
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnColExit = Grid_NotasColExit
        OnEnter = Grid_NotasEnter
        OnExit = Grid_NotasExit
        OnKeyDown = Grid_NotasKeyDown
        OnKeyPress = Grid_NotasKeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'MUNICIPIO_DESCARREGA'
            Title.Alignment = taCenter
            Title.Caption = 'Municipio Dest.'
            Width = 93
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IBGE'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Ibge'
            Width = 47
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CTE'
            Title.Alignment = taCenter
            Title.Caption = 'Chave Cte'
            Width = 260
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NFE'
            Title.Alignment = taCenter
            Title.Caption = 'Chave Nfe'
            Width = 254
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LACRE'
            Title.Alignment = taCenter
            Title.Caption = 'Lacre'
            Visible = False
          end>
      end
      object StatusBar2: TStatusBar
        Left = 8
        Top = 583
        Width = 703
        Height = 19
        Align = alNone
        Panels = <
          item
            Text = '<F7> - Loc. Chave NFe'
            Width = 163
          end
          item
            Text = '<F8> - Loc. Chave CTe'
            Width = 160
          end
          item
            Text = '<F9> - Gravar'
            Width = 163
          end
          item
            Text = '<Ctrl + Del> - Apagar'
            Width = 163
          end>
      end
      object NOME_TRANSPORTADOR: TEdit
        Left = 99
        Top = 52
        Width = 401
        Height = 21
        Enabled = False
        MaxLength = 50
        ReadOnly = True
        TabOrder = 7
        OnKeyDown = DT_SAIDAKeyDown
      end
      object PLACA_VEICULO: TEdit
        Left = 71
        Top = 339
        Width = 90
        Height = 21
        CharCase = ecUpperCase
        Enabled = False
        MaxLength = 7
        TabOrder = 32
        OnKeyDown = DT_SAIDAKeyDown
      end
      object INSCRICAO_TRANSPORTADOR: TEdit
        Left = 545
        Top = 79
        Width = 164
        Height = 21
        Enabled = False
        MaxLength = 15
        ReadOnly = True
        TabOrder = 11
        OnKeyDown = DT_SAIDAKeyDown
      end
      object UF_VEICULO: TComboBox
        Left = 221
        Top = 312
        Width = 55
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
        TabOrder = 30
        OnClick = UF_VEICULOClick
        OnKeyDown = CNPJ_TRANSPORTADORKeyDown
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
      object UF_TRANSPORTADOR: TComboBox
        Left = 376
        Top = 170
        Width = 55
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
        TabOrder = 21
        OnKeyDown = CNPJ_TRANSPORTADORKeyDown
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
      object CNPJ_TRANSPORTADOR: TEdit
        Left = 99
        Top = 79
        Width = 213
        Height = 21
        CharCase = ecUpperCase
        Enabled = False
        MaxLength = 14
        ReadOnly = True
        TabOrder = 10
        OnKeyDown = DT_SAIDAKeyDown
      end
      object CIOT: TEdit
        Left = 42
        Top = 215
        Width = 112
        Height = 21
        Enabled = False
        MaxLength = 12
        TabOrder = 23
        OnKeyDown = DT_SAIDAKeyDown
      end
      object IBGE_CARREGA: TEdit
        Left = 639
        Top = 441
        Width = 60
        Height = 21
        Enabled = False
        MaxLength = 7
        TabOrder = 40
        Visible = False
      end
      object TIPO_VEICULO: TComboBox
        Left = 71
        Top = 365
        Width = 195
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
        TabOrder = 34
        OnClick = TIPO_VEICULOClick
        OnKeyDown = CNPJ_TRANSPORTADORKeyDown
        Items.Strings = (
          'REBOQUE'
          'TRA'#199#195'O')
      end
      object SERIE: TEdit
        Left = 281
        Top = 115
        Width = 47
        Height = 21
        Enabled = False
        MaxLength = 3
        TabOrder = 13
      end
      object MODELO: TEdit
        Left = 398
        Top = 115
        Width = 33
        Height = 21
        Enabled = False
        MaxLength = 2
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 14
        Text = '58'
      end
      object TIPO_EMITENTE: TComboBox
        Left = 421
        Top = 143
        Width = 288
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
        TabOrder = 19
        OnClick = TIPO_EMITENTEClick
        OnKeyDown = CNPJ_TRANSPORTADORKeyDown
        Items.Strings = (
          'PRESTADOR DE SERVI'#199'O DE TRANSPORTE'
          'N'#195'O PRESTADOR DE SERVI'#199'O DE TRANSPORTE')
      end
      object UF_CARREGA: TComboBox
        Left = 264
        Top = 215
        Width = 55
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
        TabOrder = 24
        OnClick = UF_CARREGAClick
        OnExit = UF_CARREGAExit
        OnKeyDown = CNPJ_TRANSPORTADORKeyDown
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
      object UF_DESCARREGA: TComboBox
        Left = 264
        Top = 272
        Width = 52
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
        TabOrder = 28
        OnClick = UF_DESCARREGAClick
        OnKeyDown = CNPJ_TRANSPORTADORKeyDown
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
      object btnPrior: TBitBtn
        Left = 65
        Top = 9
        Width = 79
        Height = 25
        Caption = 'Anterior'
        Spacing = 10
        TabOrder = 0
        OnClick = btnPriorClick
      end
      object btnNext: TBitBtn
        Left = 150
        Top = 9
        Width = 79
        Height = 25
        Caption = 'Pr'#243'ximo'
        Spacing = 10
        TabOrder = 1
        OnClick = btnNextClick
      end
      object btnInsert: TBitBtn
        Left = 236
        Top = 9
        Width = 79
        Height = 25
        Caption = '&Incluir'
        Spacing = 10
        TabOrder = 2
        OnClick = btnInsertClick
      end
      object btnEdit: TBitBtn
        Left = 322
        Top = 9
        Width = 79
        Height = 25
        Caption = 'A&lterar'
        Spacing = 10
        TabOrder = 3
        OnClick = btnEditClick
      end
      object btnDelete: TBitBtn
        Left = 408
        Top = 9
        Width = 79
        Height = 25
        Caption = '&Excluir'
        Spacing = 10
        TabOrder = 4
        OnClick = btnDeleteClick
      end
      object btnSave: TBitBtn
        Left = 580
        Top = 9
        Width = 79
        Height = 25
        Caption = '&Salvar'
        Spacing = 10
        TabOrder = 6
        OnClick = btnSaveClick
      end
      object btnDiscard: TBitBtn
        Left = 494
        Top = 9
        Width = 79
        Height = 25
        Caption = 'C&ancelar'
        Spacing = 10
        TabOrder = 5
        OnClick = btnDiscardClick
      end
      object HR_SAIDA: TMaskEdit
        Left = 653
        Top = 115
        Width = 56
        Height = 21
        Enabled = False
        EditMask = '99:99:99;1;_'
        MaxLength = 8
        TabOrder = 16
        Text = '  :  :  '
        OnKeyDown = DT_SAIDAKeyDown
      end
      object municipio_carrega: TComboBox
        Left = 65
        Top = 246
        Width = 145
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
        TabOrder = 27
        OnKeyDown = CNPJ_TRANSPORTADORKeyDown
      end
      object RNTRC: TEdit
        Left = 58
        Top = 312
        Width = 103
        Height = 21
        Enabled = False
        MaxLength = 8
        TabOrder = 29
        OnKeyDown = DT_SAIDAKeyDown
      end
      object ListBox1: TListBox
        Left = 590
        Top = 520
        Width = 121
        Height = 51
        ItemHeight = 13
        TabOrder = 44
        Visible = False
      end
      object Valor_carga: TRxCalcEdit
        Left = 609
        Top = 423
        Width = 100
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DecimalPlaces = 3
        DisplayFormat = '0.000;-0.000'
        Enabled = False
        NumGlyphs = 2
        TabOrder = 39
        ZeroEmpty = False
        OnKeyDown = CNPJ_TRANSPORTADORKeyDown
      end
      object Peso_Carga: TRxCalcEdit
        Left = 291
        Top = 423
        Width = 100
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DecimalPlaces = 3
        DisplayFormat = '0.000;-0.000'
        Enabled = False
        NumGlyphs = 2
        TabOrder = 38
        ZeroEmpty = False
        OnKeyDown = CNPJ_TRANSPORTADORKeyDown
      end
      object Unidade: TComboBox
        Left = 85
        Top = 423
        Width = 49
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 3
        ParentFont = False
        TabOrder = 37
        OnClick = UnidadeClick
        Items.Strings = (
          'KG'
          'TON'
          'M3'
          'UN'
          'LT')
      end
      object STATUS: TEdit
        Left = 591
        Top = 52
        Width = 118
        Height = 21
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        MaxLength = 15
        ParentFont = False
        ReadOnly = True
        TabOrder = 8
        OnKeyDown = DT_SAIDAKeyDown
      end
      object Chave_Mdf: TEdit
        Left = 73
        Top = 448
        Width = 636
        Height = 21
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        MaxLength = 150
        ParentFont = False
        ReadOnly = True
        TabOrder = 41
        OnKeyDown = DT_SAIDAKeyDown
      end
      object Grid_Notas_Uf: TDBGrid
        Left = 376
        Top = 215
        Width = 335
        Height = 71
        DataSource = Datauf
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
        ParentFont = False
        TabOrder = 25
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnEnter = Grid_Notas_UfEnter
        OnExit = Grid_Notas_UfExit
        OnKeyDown = Grid_Notas_UfKeyDown
        OnKeyPress = Grid_Notas_UfKeyPress
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'UF_PERCURSO'
            Title.Alignment = taCenter
            Title.Caption = 'Estado(s)  para o Percurso'
            Width = 347
            Visible = True
          end>
      end
      object StatusBar1: TStatusBar
        Left = 376
        Top = 286
        Width = 335
        Height = 19
        Align = alNone
        Panels = <
          item
            Text = '<F9> - Gravar'
            Width = 163
          end
          item
            Text = '<Ctrl + Del> - Apagar'
            Width = 163
          end>
      end
      object ListBox2: TListBox
        Left = 548
        Top = 229
        Width = 121
        Height = 51
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 26
        Visible = False
      end
      object instrucoes: TMemo
        Left = 83
        Top = 395
        Width = 628
        Height = 24
        Enabled = False
        Lines.Strings = (
          '')
        TabOrder = 36
      end
      object Grid_Notas_Motorista: TDBGrid
        Left = 329
        Top = 312
        Width = 382
        Height = 58
        DataSource = DataMotorista
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
        ParentFont = False
        TabOrder = 31
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnColExit = Grid_Notas_MotoristaColExit
        OnEnter = Grid_Notas_MotoristaEnter
        OnExit = Grid_Notas_MotoristaExit
        OnKeyDown = Grid_Notas_MotoristaKeyDown
        OnKeyPress = Grid_Notas_MotoristaKeyPress
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'nome_motorista'
            Title.Alignment = taCenter
            Title.Caption = 'Motorista'
            Width = 202
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cpf_motorista'
            Title.Caption = 'Cpf Motorista'
            Width = 161
            Visible = True
          end>
      end
      object StatusBar3: TStatusBar
        Left = 329
        Top = 370
        Width = 382
        Height = 19
        Align = alNone
        Panels = <
          item
            Text = '<F9> - Gravar'
            Width = 180
          end
          item
            Text = '<Ctrl + Del> - Apagar'
            Width = 163
          end>
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 631
    Width = 723
    Height = 39
    Align = alBottom
    TabOrder = 1
    object btnGera: TButton
      Left = 551
      Top = 6
      Width = 73
      Height = 25
      Caption = '&Gerar MDF-e'
      TabOrder = 2
      OnClick = btnGeraClick
    end
    object btnRetorna: TBitBtn
      Left = 630
      Top = 6
      Width = 73
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
      TabOrder = 3
      OnClick = btnRetornaClick
    end
    object btnPesquisa: TBitBtn
      Left = 369
      Top = 6
      Width = 95
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
      Spacing = 10
      TabOrder = 0
      OnClick = btnPesquisaClick
    end
    object btnImprime: TBitBtn
      Left = 470
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Relat'#243'rio'
      TabOrder = 1
      OnClick = btnImprimeClick
    end
  end
  object Rel_MdeFiscal: TQuickRep
    Left = 57
    Top = 800
    Width = 794
    Height = 1123
    DataSet = QTabela
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
    ReportTitle = 'Relat'#243'rio de Produtos'
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
        Left = 145
        Top = 31
        Width = 407
        Height = 15
        Size.Values = (
          39.687500000000000000
          383.645833333333300000
          82.020833333333330000
          1076.854166666667000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = True
        Caption = '*** MANISFESTO  DOCUMENTO FISCAL ELETRONICO  -   MDF-e ***'
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
        Width = 48
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          137.583333333333300000
          127.000000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'DATA'
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
        Left = 60
        Top = 52
        Width = 1
        Height = 15
        Size.Values = (
          39.687500000000000000
          158.750000000000000000
          137.583333333333300000
          2.645833333333333000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = ''
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
        Left = 66
        Top = 52
        Width = 85
        Height = 15
        Size.Values = (
          39.687500000000000000
          174.625000000000000000
          137.583333333333300000
          224.895833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Chave  MDF-e'
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
      object QRLabel4: TQRLabel
        Left = 382
        Top = 52
        Width = 56
        Height = 15
        Size.Values = (
          39.687500000000000000
          1010.708333333333000000
          137.583333333333300000
          148.166666666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Protocolo'
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
      object QRLabel5: TQRLabel
        Left = 464
        Top = 52
        Width = 71
        Height = 15
        Size.Values = (
          39.687500000000000000
          1227.666666666667000000
          137.583333333333300000
          187.854166666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'UF Destino'
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
      object QRLabel6: TQRLabel
        Left = 619
        Top = 53
        Width = 74
        Height = 15
        Size.Values = (
          39.687500000000000000
          1637.770833333333000000
          140.229166666666700000
          195.791666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Valor'
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
      object QRLabel7: TQRLabel
        Left = 541
        Top = 52
        Width = 58
        Height = 15
        Size.Values = (
          39.687500000000000000
          1431.395833333333000000
          137.583333333333300000
          153.458333333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Status'
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
    end
    object QRBand2: TQRBand
      Left = 48
      Top = 123
      Width = 698
      Height = 17
      AlignToBottom = False
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
        Width = 76
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          2.645833333333333000
          201.083333333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QTabela
        DataField = 'dt_saida'
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
        Left = 82
        Top = 0
        Width = 64
        Height = 15
        Size.Values = (
          39.687500000000000000
          216.958333333333300000
          0.000000000000000000
          169.333333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QTabela
        DataField = 'chave_mdf'
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
      object QRDBText1: TQRDBText
        Left = 617
        Top = 0
        Width = 78
        Height = 15
        Size.Values = (
          39.687500000000000000
          1632.479166666667000000
          0.000000000000000000
          206.375000000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QTabela
        DataField = 'valor_carga'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Mask = '#,##0.00'
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText4: TQRDBText
        Left = 472
        Top = -1
        Width = 56
        Height = 15
        Size.Values = (
          39.687500000000000000
          1248.833333333333000000
          -2.645833333333333000
          148.166666666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QTabela
        DataField = 'uf_descarrega'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Mask = '#,##0.00'
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText7: TQRDBText
        Left = 396
        Top = 0
        Width = 79
        Height = 15
        Size.Values = (
          39.687500000000000000
          1047.750000000000000000
          0.000000000000000000
          209.020833333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QTabela
        DataField = 'protocolo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Mask = '#,##0.00'
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText5: TQRDBText
        Left = 533
        Top = 0
        Width = 78
        Height = 15
        Size.Values = (
          39.687500000000000000
          1410.229166666667000000
          0.000000000000000000
          206.375000000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QTabela
        DataField = 'status'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Mask = '#,##0.00'
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
  object DataNotas: TDataSource
    DataSet = QNotas
    Left = 24
    Top = 564
  end
  object DataTabela: TDataSource
    DataSet = QTabela
    Left = 120
    Top = 616
  end
  object Datauf: TDataSource
    DataSet = Qnotas_uf
    Left = 272
    Top = 252
  end
  object QSearch: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evItems, evRecsMax, evRowsetSize, evCache, evCursorKind, evAutoFetchAll]
    FetchOptions.CursorKind = ckDefault
    FetchOptions.RowsetSize = 1000
    FetchOptions.AutoFetchAll = afDisable
    Left = 192
    Top = 616
  end
  object iquery: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evItems, evRecsMax, evRowsetSize, evCache, evCursorKind, evAutoFetchAll]
    FetchOptions.CursorKind = ckDefault
    FetchOptions.RowsetSize = 1000
    FetchOptions.AutoFetchAll = afDisable
    Left = 160
    Top = 616
  end
  object QCfop: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evItems, evRecsMax, evRowsetSize, evCache, evCursorKind, evAutoFetchAll]
    FetchOptions.CursorKind = ckDefault
    FetchOptions.RowsetSize = 1000
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      'SELECT * FROM CFOP'
      'WHERE'
      '(COD_CFOP = :COD_CFOP)')
    Left = 80
    Top = 616
    ParamData = <
      item
        Name = 'COD_CFOP'
        ParamType = ptInput
      end>
  end
  object QTabela: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evItems, evRecsMax, evRowsetSize, evCache, evCursorKind, evAutoFetchAll]
    FetchOptions.CursorKind = ckDefault
    FetchOptions.RowsetSize = 1000
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      'SELECT * FROM COMPL_MDEFISCAL')
    Left = 40
    Top = 616
  end
  object QDetalhe: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evItems, evRecsMax, evRowsetSize, evCache, evCursorKind, evAutoFetchAll]
    FetchOptions.CursorKind = ckDefault
    FetchOptions.RowsetSize = 1000
    FetchOptions.AutoFetchAll = afDisable
    Left = 8
    Top = 616
  end
  object QNotas: TFDQuery
    BeforeEdit = FDQuery12BeforeEdit
    BeforePost = FDQuery12BeforePost
    OnNewRecord = FDQuery12NewRecord
    OnPostError = FDQuery12PostError
    OnUpdateError = FDQuery12UpdateError
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evItems, evRecsMax, evRowsetSize, evCache, evCursorKind, evAutoFetchAll]
    FetchOptions.CursorKind = ckDefault
    FetchOptions.RowsetSize = 1000
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      'SELECT * FROM COMPL_MDEFISCAL_NOTAS'
      'WHERE'
      '(MDEFISCAL_ID = :MDEFISCAL_ID)'
      'ORDER BY LACRE'
      '')
    Left = 56
    Top = 568
    ParamData = <
      item
        Name = 'MDEFISCAL_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object Qnotas_uf: TFDQuery
    BeforeEdit = QNotas_UFBeforeEdit
    BeforePost = QNotas_UFBeforePost
    OnNewRecord = Qnotas_ufNewRecord
    OnPostError = QNotas_UFPostError
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evItems, evRecsMax, evRowsetSize, evCache, evCursorKind, evAutoFetchAll]
    FetchOptions.CursorKind = ckDefault
    FetchOptions.RowsetSize = 1000
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      'SELECT *  FROM COMPL_MDEFISCAL_UF WHERE'
      'MDEFISCAL_ID = :MDEFISCAL_ID')
    Left = 224
    Top = 256
    ParamData = <
      item
        Name = 'MDEFISCAL_ID'
        ParamType = ptInput
      end>
  end
  object usql_uf: TFDUpdateSQL
    Connection = FrmData.DbF_Eficaz
    InsertSQL.Strings = (
      'insert into COMPL_MDEFISCAL_UF'
      '  (MDEFISCAL_ID, UF_PERCURSO)'
      'values'
      '  (:MDEFISCAL_ID, :UF_PERCURSO)')
    ModifySQL.Strings = (
      'update COMPL_MDEFISCAL_UF'
      'set'
      '  MDEFISCAL_ID = :MDEFISCAL_ID,'
      '  UF_PERCURSO = :UF_PERCURSO'
      'where'
      '  MDEFISCAL_ID = :OLD_MDEFISCAL_ID and'
      '  UF_PERCURSO = :OLD_UF_PERCURSO')
    DeleteSQL.Strings = (
      'delete from COMPL_MDEFISCAL_UF'
      'where'
      '  MDEFISCAL_ID = :OLD_MDEFISCAL_ID and'
      '  UF_PERCURSO = :OLD_UF_PERCURSO')
    FetchRowSQL.Strings = (
      'Select '
      '  MDEFISCAL_ID,'
      '  UF_PERCURSO'
      'from COMPL_MDEFISCAL_UF '
      'where'
      '  MDEFISCAL_ID = :MDEFISCAL_ID')
    Left = 324
    Top = 256
  end
  object usql_notas: TFDUpdateSQL
    InsertSQL.Strings = (
      'insert into COMPL_MDEFISCAL_NOTAS'
      
        '  (CTE, IBGE, ID_TRANSPORTE, LACRE, MDEFISCAL_ID, MUNICIPIO_DESC' +
        'ARREGA, '
      '   NFE, TP_TRANSPORTE)'
      'values'
      
        '  (:CTE, :IBGE, :ID_TRANSPORTE, :LACRE, :MDEFISCAL_ID, :MUNICIPI' +
        'O_DESCARREGA, '
      '   :NFE, :TP_TRANSPORTE)')
    ModifySQL.Strings = (
      'update COMPL_MDEFISCAL_NOTAS'
      'set'
      '  CTE = :CTE,'
      '  IBGE = :IBGE,'
      '  ID_TRANSPORTE = :ID_TRANSPORTE,'
      '  LACRE = :LACRE,'
      '  MDEFISCAL_ID = :MDEFISCAL_ID,'
      '  MUNICIPIO_DESCARREGA = :MUNICIPIO_DESCARREGA,'
      '  NFE = :NFE,'
      '  TP_TRANSPORTE = :TP_TRANSPORTE'
      'where'
      '  MDEFISCAL_ID = :OLD_MDEFISCAL_ID'
      ' AND IBGE = :OLD_IBGE')
    DeleteSQL.Strings = (
      'delete from COMPL_MDEFISCAL_NOTAS'
      'where'
      ' '
      '  MDEFISCAL_ID = :OLD_MDEFISCAL_ID'
      'AND IBGE = :OLD_IBGE ')
    FetchRowSQL.Strings = (
      'Select '
      '  MDEFISCAL_ID,'
      '  IBGE,'
      '  MUNICIPIO_DESCARREGA,'
      '  CTE,'
      '  NFE,'
      '  TP_TRANSPORTE,'
      '  ID_TRANSPORTE,'
      '  LACRE'
      'from COMPL_MDEFISCAL_NOTAS '
      'where'
      '  MDEFISCAL_ID = :MDEFISCAL_ID'
      '')
    Left = 100
    Top = 568
  end
  object RDprint1: TRDprint
    ImpressoraPersonalizada.NomeImpressora = 'Modelo Personalizado - (Epson)'
    ImpressoraPersonalizada.AvancaOitavos = '27 48'
    ImpressoraPersonalizada.AvancaSextos = '27 50'
    ImpressoraPersonalizada.SaltoPagina = '12'
    ImpressoraPersonalizada.TamanhoPagina = '27 67 66'
    ImpressoraPersonalizada.Negrito = '27 69'
    ImpressoraPersonalizada.Italico = '27 52'
    ImpressoraPersonalizada.Sublinhado = '27 45 49'
    ImpressoraPersonalizada.Expandido = '27 14'
    ImpressoraPersonalizada.Normal10 = '18 27 80'
    ImpressoraPersonalizada.Comprimir12 = '18 27 77'
    ImpressoraPersonalizada.Comprimir17 = '27 80 27 15'
    ImpressoraPersonalizada.Comprimir20 = '27 77 27 15'
    ImpressoraPersonalizada.Reset = '27 80 18 20 27 53 27 70 27 45 48'
    ImpressoraPersonalizada.Inicializar = '27 64'
    OpcoesPreview.PaginaZebrada = False
    OpcoesPreview.Remalina = False
    OpcoesPreview.CaptionPreview = 'Rdprint Preview'
    OpcoesPreview.PreviewZoom = 100
    OpcoesPreview.CorPapelPreview = clWhite
    OpcoesPreview.CorLetraPreview = clBlack
    OpcoesPreview.Preview = False
    OpcoesPreview.BotaoSetup = Ativo
    OpcoesPreview.BotaoImprimir = Ativo
    OpcoesPreview.BotaoGravar = Ativo
    OpcoesPreview.BotaoLer = Ativo
    OpcoesPreview.BotaoProcurar = Ativo
    OpcoesPreview.BotaoPDF = Ativo
    OpcoesPreview.BotaoEMAIL = Ativo
    Margens.Left = 10
    Margens.Right = 10
    Margens.Top = 10
    Margens.Bottom = 10
    Autor = Deltress
    RegistroUsuario.NomeRegistro = 'EFICAZ AUTOMA'#199'O E SISTEMAS LTDA '
    RegistroUsuario.SerieProduto = 'GROUP-0214/02002'
    RegistroUsuario.AutorizacaoKey = 'HE4F-X2AQ-8IYJ-211Q-IGUV'
    About = 'RDprint 5.0 - Registrado'
    Acentuacao = Transliterate
    CaptionSetup = 'Rdprint Setup'
    TitulodoRelatorio = 'Gerado por RDprint'
    UsaGerenciadorImpr = True
    CorForm = clBtnFace
    CorFonte = clBlack
    Impressora = Epson
    Mapeamento.Strings = (
      '//--- Grafico Compativel com Windows/USB ---//'
      '//'
      'GRAFICO=GRAFICO'
      'HP=GRAFICO'
      'DESKJET=GRAFICO'
      'LASERJET=GRAFICO'
      'INKJET=GRAFICO'
      'STYLUS=GRAFICO'
      'EPL=GRAFICO'
      'USB=GRAFICO'
      '//'
      '//--- Linha Epson Matricial 9 e 24 agulhas ---//'
      '//'
      'EPSON=EPSON'
      'GENERIC=EPSON'
      'TEXT=EPSON'
      'LX-300=EPSON'
      'LX-810=EPSON'
      'FX-2170=EPSON'
      'FX-1170=EPSON'
      'LQ-1170=EPSON'
      'LQ-2170=EPSON'
      'OKIDATA=EPSON'
      '//'
      '//--- Rima e Emilia ---//'
      '//'
      'RIMA=RIMA'
      'EMILIA=RIMA'
      '//'
      '//--- Linha HP/Xerox padr'#227'o PCL ---//'
      '//'
      'PCL=HP'
      '//'
      '//--- Impressoras 40 Colunas ---//'
      '//'
      'DARUMA=BOBINA'
      'SIGTRON=BOBINA'
      'SWEDA=BOBINA'
      'BEMATECH=BOBINA')
    MostrarProgresso = True
    TamanhoQteLinhas = 66
    TamanhoQteColunas = 80
    TamanhoQteLPP = Seis
    NumerodeCopias = 1
    FonteTamanhoPadrao = S10cpp
    FonteEstiloPadrao = []
    Orientacao = poPortrait
    Left = 229
    Top = 618
  end
  object QNotas_Motorista: TFDQuery
    AfterOpen = QNotas_MotoristaAfterOpen
    BeforeEdit = QNotas_MotoristaBeforeEdit
    BeforePost = QNotas_MotoristaBeforePost
    OnNewRecord = QNotas_MotoristaNewRecord
    OnPostError = QNotas_MotoristaPostError
    OnUpdateError = QNotas_MotoristaUpdateError
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evItems, evRecsMax, evRowsetSize, evCache, evCursorKind, evAutoFetchAll]
    FetchOptions.CursorKind = ckDefault
    FetchOptions.RowsetSize = 1000
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      'SELECT *  FROM COMPL_MDEFISCAL_MOTORISTA WHERE'
      'MDEFISCAL_ID = :MDEFISCAL_ID')
    Left = 560
    Top = 360
    ParamData = <
      item
        Name = 'MDEFISCAL_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object DataMotorista: TDataSource
    DataSet = QNotas_Motorista
    Left = 664
    Top = 356
  end
  object USql_Motorista: TFDUpdateSQL
    Connection = FrmData.DbF_Eficaz
    InsertSQL.Strings = (
      'insert into COMPL_MDEFISCAL_UF'
      '  (MDEFISCAL_ID, UF_PERCURSO)'
      'values'
      '  (:MDEFISCAL_ID, :UF_PERCURSO)')
    ModifySQL.Strings = (
      'update COMPL_MDEFISCAL_UF'
      'set'
      '  MDEFISCAL_ID = :MDEFISCAL_ID,'
      '  UF_PERCURSO = :UF_PERCURSO'
      'where'
      '  MDEFISCAL_ID = :OLD_MDEFISCAL_ID and'
      '  UF_PERCURSO = :OLD_UF_PERCURSO')
    DeleteSQL.Strings = (
      'delete from COMPL_MDEFISCAL_UF'
      'where'
      '  MDEFISCAL_ID = :OLD_MDEFISCAL_ID and'
      '  UF_PERCURSO = :OLD_UF_PERCURSO')
    FetchRowSQL.Strings = (
      'Select '
      '  MDEFISCAL_ID,'
      '  UF_PERCURSO'
      'from COMPL_MDEFISCAL_UF '
      'where'
      '  MDEFISCAL_ID = :MDEFISCAL_ID')
    Left = 508
    Top = 360
  end
end
