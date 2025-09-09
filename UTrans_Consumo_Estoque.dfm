object FrmTrans_Consumo_Estoque: TFrmTrans_Consumo_Estoque
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consumo'
  ClientHeight = 498
  ClientWidth = 733
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
    Width = 733
    Height = 457
    ActivePage = Consulta
    Align = alClient
    TabOrder = 0
    object Consulta: TTabSheet
      Caption = '&Consulta'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 725
        Height = 408
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
        OnKeyPress = DBGrid1KeyPress
        OnTitleClick = DBGrid1TitleClick
        Columns = <
          item
            Expanded = False
            FieldName = 'TRANSACAO_ID'
            Title.Alignment = taRightJustify
            Title.Caption = 'ID'
            Width = 54
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_TRANS'
            Title.Caption = 'Dt. Transa'#231#227'o'
            Width = 76
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_MOVIMENTO'
            Title.Caption = 'Dt. Movimento'
            Width = 77
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUM_DOC'
            Title.Caption = 'N'#186' Documento'
            Width = 78
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR'
            Title.Alignment = taRightJustify
            Title.Caption = 'Valor'
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'HISTORICO'
            Title.Caption = 'Hist'#243'rico'
            Width = 331
            Visible = True
          end>
      end
      object Dias: TTabSet
        Left = 0
        Top = 408
        Width = 725
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
      ImageIndex = 1
      OnShow = ManutencaoShow
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object DBText1: TDBText
        Left = 203
        Top = 87
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
      object DBText3: TDBText
        Left = 203
        Top = 139
        Width = 48
        Height = 13
        AutoSize = True
        DataField = 'DESCRICAO'
        DataSource = DataConta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText5: TDBText
        Left = 203
        Top = 113
        Width = 48
        Height = 13
        AutoSize = True
        DataField = 'DESCRICAO'
        DataSource = DataCusto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 6
        Top = 61
        Width = 70
        Height = 13
        Caption = 'Data Consumo'
      end
      object Label2: TLabel
        Left = 309
        Top = 61
        Width = 52
        Height = 13
        Caption = 'Dt. Movim.'
      end
      object Label4: TLabel
        Left = 573
        Top = 61
        Width = 37
        Height = 13
        Caption = 'N'#186' Doc.'
      end
      object Label15: TLabel
        Left = 6
        Top = 87
        Width = 49
        Height = 13
        Caption = 'Empresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 6
        Top = 139
        Width = 70
        Height = 13
        Caption = 'Cta. Estoque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 6
        Top = 113
        Width = 45
        Height = 13
        Caption = 'C. Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 6
        Top = 191
        Width = 41
        Height = 13
        Caption = 'Hist'#243'rico'
      end
      object btnEmpresa: TSpeedButton
        Left = 135
        Top = 84
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
      object btnConta: TSpeedButton
        Left = 135
        Top = 136
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
      object btnCentro_Custo: TSpeedButton
        Left = 135
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
        OnClick = btnCentro_CustoClick
      end
      object Label3: TLabel
        Left = 6
        Top = 165
        Width = 77
        Height = 13
        Caption = 'Cta. Consumo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnContaAux: TSpeedButton
        Left = 135
        Top = 162
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
        OnClick = btnContaAuxClick
      end
      object DBText2: TDBText
        Left = 203
        Top = 165
        Width = 48
        Height = 13
        AutoSize = True
        DataField = 'DESCRICAO'
        DataSource = DataConta_Aux
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 725
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
          Left = 112
          Top = 6
          Width = 75
          Height = 25
          Caption = 'Pr'#243'ximo'
          TabOrder = 1
          OnClick = btnNextClick
        end
        object btnInsert: TBitBtn
          Left = 218
          Top = 6
          Width = 75
          Height = 25
          Caption = '&Incluir'
          TabOrder = 2
          OnClick = btnInsertClick
        end
        object btnEdit: TBitBtn
          Left = 325
          Top = 6
          Width = 75
          Height = 25
          Caption = 'A&lterar'
          TabOrder = 3
          OnClick = btnEditClick
        end
        object btnDelete: TBitBtn
          Left = 431
          Top = 6
          Width = 75
          Height = 25
          Caption = '&Excluir'
          TabOrder = 4
          OnClick = btnDeleteClick
        end
        object btnSave: TBitBtn
          Left = 537
          Top = 6
          Width = 75
          Height = 25
          Caption = '&Salvar'
          TabOrder = 5
          OnClick = btnSaveClick
        end
        object btnDiscard: TBitBtn
          Left = 644
          Top = 6
          Width = 75
          Height = 25
          Caption = 'C&ancelar'
          TabOrder = 6
          OnClick = btnDiscardClick
        end
      end
      object DT_TRANS: TDateEdit
        Left = 85
        Top = 58
        Width = 90
        Height = 21
        CheckOnExit = True
        DialogTitle = 'Selecione a Data'
        Enabled = False
        NumGlyphs = 2
        TabOrder = 1
        OnEnter = DT_TRANSEnter
        OnKeyDown = DT_TRANSKeyDown
      end
      object EMPRESA_ID: TCurrencyEdit
        Left = 85
        Top = 84
        Width = 47
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0;-0'
        Enabled = False
        TabOrder = 4
        ZeroEmpty = False
        OnExit = EMPRESA_IDExit
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object CONTA_ID: TCurrencyEdit
        Left = 85
        Top = 136
        Width = 47
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0;-0'
        Enabled = False
        TabOrder = 6
        ZeroEmpty = False
        OnExit = CONTA_IDExit
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object HISTORICO: TEdit
        Left = 85
        Top = 188
        Width = 287
        Height = 21
        Enabled = False
        MaxLength = 150
        TabOrder = 8
        OnKeyDown = DT_TRANSKeyDown
      end
      object NUM_DOC: TEdit
        Left = 621
        Top = 58
        Width = 60
        Height = 21
        Enabled = False
        MaxLength = 7
        TabOrder = 3
        OnKeyDown = DT_TRANSKeyDown
      end
      object C_CUSTO_ID: TCurrencyEdit
        Left = 85
        Top = 110
        Width = 47
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0;-0'
        Enabled = False
        TabOrder = 5
        ZeroEmpty = False
        OnExit = C_CUSTO_IDExit
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object DT_MOVIMENTO: TDateEdit
        Left = 377
        Top = 58
        Width = 90
        Height = 21
        CheckOnExit = True
        DialogTitle = 'Selecione a Data'
        Enabled = False
        NumGlyphs = 2
        TabOrder = 2
        OnEnter = DT_TRANSEnter
        OnKeyDown = DT_TRANSKeyDown
      end
      object Panel3: TPanel
        Left = 0
        Top = 388
        Width = 725
        Height = 41
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 10
        object Label21: TLabel
          Left = 577
          Top = 14
          Width = 43
          Height = 13
          Caption = 'Vr. Prod.'
        end
        object VALOR: TRxCalcEdit
          Left = 624
          Top = 10
          Width = 95
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
          Enabled = False
          NumGlyphs = 2
          ReadOnly = True
          TabOrder = 0
          ZeroEmpty = False
          OnKeyDown = EMPRESA_IDKeyDown
        end
      end
      object StatusBar1: TStatusBar
        Left = 6
        Top = 361
        Width = 713
        Height = 19
        Align = alNone
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Panels = <
          item
            Text = '<F4> - Exclui Item'
            Width = 237
          end
          item
            Text = '<F7> - Localiza Produto'
            Width = 237
          end
          item
            Text = '<F9> - Encerra'
            Width = 239
          end>
        UseSystemFont = False
      end
      object Itens: TDBGrid
        Left = 6
        Top = 217
        Width = 713
        Height = 144
        DataSource = DataSub_Detail
        Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
        TabOrder = 9
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnColEnter = ItensColEnter
        OnColExit = ItensColExit
        OnEnter = ItensEnter
        OnExit = ItensExit
        OnKeyDown = ItensKeyDown
        OnKeyPress = ItensKeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'PRODUTO_ID'
            Title.Alignment = taRightJustify
            Title.Caption = 'Prod.'
            Width = 63
            Visible = True
          end
          item
            Color = clSilver
            Expanded = False
            FieldName = 'DESCRICAO'
            ReadOnly = True
            Title.Caption = 'Descri'#231#227'o'
            Width = 365
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QUANTIDADE'
            Title.Alignment = taRightJustify
            Title.Caption = 'Quant.'
            Width = 83
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VR_UNITARIO'
            Title.Alignment = taRightJustify
            Title.Caption = 'Vr. Unit.'
            Width = 83
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VR_TOTAL'
            Title.Alignment = taRightJustify
            Title.Caption = 'Vr. Total'
            Width = 83
            Visible = True
          end>
      end
      object CONTAAUX_ID: TCurrencyEdit
        Left = 85
        Top = 162
        Width = 47
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0;-0'
        Enabled = False
        TabOrder = 7
        ZeroEmpty = False
        OnExit = CONTAAUX_IDExit
        OnKeyDown = EMPRESA_IDKeyDown
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 457
    Width = 733
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnRetorna: TBitBtn
      Left = 654
      Top = 6
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
    object CONDUTA: TEdit
      Left = 387
      Top = 10
      Width = 46
      Height = 21
      Enabled = False
      MaxLength = 2
      TabOrder = 2
      Visible = False
    end
    object DEPTO: TEdit
      Left = 439
      Top = 10
      Width = 46
      Height = 21
      Enabled = False
      MaxLength = 2
      TabOrder = 3
      Visible = False
    end
    object TPCTB: TEdit
      Left = 502
      Top = 10
      Width = 46
      Height = 21
      Enabled = False
      MaxLength = 2
      TabOrder = 4
      Visible = False
    end
    object AUTORIZ_ID: TCurrencyEdit
      Left = 555
      Top = 10
      Width = 47
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = '0;-0'
      Enabled = False
      TabOrder = 5
      Visible = False
      ZeroEmpty = False
      OnKeyDown = EMPRESA_IDKeyDown
    end
    object btnPesquisa: TBitBtn
      Left = 574
      Top = 6
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
    Left = 40
    Top = 455
  end
  object DataEmpresa: TDataSource
    DataSet = QEmpresa
    Left = 136
    Top = 455
  end
  object DataConta: TDataSource
    DataSet = QConta
    Left = 296
    Top = 456
  end
  object DataCusto: TDataSource
    DataSet = QCusto
    Left = 360
    Top = 456
  end
  object DataSub_Detail: TDataSource
    DataSet = QSub_Detail
    Left = 424
    Top = 456
  end
  object DataConta_Aux: TDataSource
    DataSet = Qconta_Aux
    Left = 232
    Top = 456
  end
  object QProduto: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM PRODUTOS'
      'WHERE'
      '(PRODUTO_ID = :PRODUTO_ID)'
      'AND (EMPRESA_ID = :EMPRESA_ID)'
      'AND (STATUS = '#39'A'#39')')
    Left = 488
    Top = 456
    ParamData = <
      item
        Name = 'PRODUTO_ID'
        ParamType = ptInput
      end
      item
        Name = 'EMPRESA_ID'
        ParamType = ptInput
      end>
  end
  object QSub_Detail: TFDQuery
    BeforeOpen = QSub_DetailBeforeOpen
    BeforeInsert = QSub_DetailBeforeInsert
    BeforeEdit = QSub_DetailBeforeEdit
    BeforePost = QSub_DetailBeforePost
    BeforeDelete = QSub_DetailBeforeDelete
    OnNewRecord = QSub_DetailNewRecord
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM TRANSITENS'
      'WHERE'
      '(TRANSACAO_ID = :TRANSACAO_ID)')
    Left = 384
    Top = 456
    ParamData = <
      item
        Name = 'TRANSACAO_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object QCusto: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM TABELAS'
      'WHERE'
      '(TABELA_ID = :TABELA_ID)'
      'AND (TIPO_TABELA = '#39'2'#39')'
      'AND (STATUS = '#39'A'#39')')
    Left = 328
    Top = 456
    ParamData = <
      item
        Name = 'TABELA_ID'
        ParamType = ptInput
      end>
  end
  object QConta: TFDQuery
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
    Left = 264
    Top = 456
    ParamData = <
      item
        Name = 'TABELA_ID'
        ParamType = ptInput
      end>
  end
  object Qconta_Aux: TFDQuery
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
    Left = 200
    Top = 456
    ParamData = <
      item
        Name = 'TABELA_ID'
        ParamType = ptInput
      end>
  end
  object QLimite: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT CLIENTES.CLIENTE_ID, SUM(TRANSPARCELAS.VALOR) AS DEBITO'
      'FROM CLIENTES CLIENTES'
      'INNER JOIN TRANSACOES TRANSACOES'
      'ON (CLIENTES.CLIENTE_ID = TRANSACOES.CLIENTE_ID)'
      'INNER JOIN TRANSPARCELAS TRANSPARCELAS'
      'ON (TRANSACOES.TRANSACAO_ID = TRANSPARCELAS.TRANSACAO_ID)'
      'WHERE'
      '(CLIENTES.CLIENTE_ID = :CLIENTE_ID)'
      'AND (TRANSPARCELAS.DT_VENCIMENTO <= :DT_VENCIMENTO)'
      'AND (TRANSPARCELAS.VALOR > 0)'
      'AND (TRANSPARCELAS.BANCO_ID = 0)'
      'AND (TRANSACOES.CONDUTA = '#39'01'#39')'
      'AND (TRANSACOES.DEPTO = '#39'03'#39')'
      'AND (TRANSACOES.COND_PAGTO = '#39'A PRAZO'#39')'
      'GROUP BY CLIENTES.CLIENTE_ID')
    Left = 168
    Top = 452
    ParamData = <
      item
        Name = 'CLIENTE_ID'
        ParamType = ptInput
      end
      item
        Name = 'DT_VENCIMENTO'
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
    Left = 104
    Top = 456
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
    Left = 72
    Top = 456
  end
  object QTabela: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM TRANSACOES')
    Left = 8
    Top = 456
  end
  object QTributo: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM TRIBUTOS'
      'WHERE'
      '(TRIBUTO_ID = :TRIBUTO_ID)')
    Left = 520
    Top = 456
    ParamData = <
      item
        Name = 'TRIBUTO_ID'
        ParamType = ptInput
      end>
  end
end
