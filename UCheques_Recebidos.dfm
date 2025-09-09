object FrmCheques_Recebidos: TFrmCheques_Recebidos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cheques Recebidos'
  ClientHeight = 469
  ClientWidth = 804
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
  object Label19: TLabel
    Left = 445
    Top = 321
    Width = 55
    Height = 13
    Caption = 'Dt. Vencim.'
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 804
    Height = 432
    ActivePage = Manutencao
    Align = alClient
    TabOrder = 0
    object Consulta: TTabSheet
      Caption = '&Consulta'
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 796
        Height = 383
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
            FieldName = 'DT_CHEQUE'
            Title.Caption = 'Dt. Cheque'
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
            FieldName = 'NUM_CHEQUE'
            Title.Caption = 'N'#186' Cheque'
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
            FieldName = 'DT_VENCIMENTO'
            Title.Caption = 'Dt. Vencim.'
            Width = 73
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_CLIENTE'
            Title.Caption = 'Nome Cliente'
            Width = 160
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BLOQUEADO'
            Font.Charset = ANSI_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'Bloqueio'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LIQUIDADO'
            Title.Caption = 'Liquidado'
            Visible = True
          end>
      end
      object Dias: TTabSet
        Left = 0
        Top = 383
        Width = 796
        Height = 21
        Align = alBottom
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
      PopupMenu = PopupMenu1
      OnShow = ManutencaoShow
      object Label2: TLabel
        Left = 6
        Top = 61
        Width = 70
        Height = 13
        Caption = 'Dt. do Cheque'
      end
      object Label9: TLabel
        Left = 6
        Top = 87
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
      object Label3: TLabel
        Left = 6
        Top = 113
        Width = 39
        Height = 13
        Caption = 'Cliente'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 6
        Top = 297
        Width = 71
        Height = 13
        Caption = 'N'#186' do Cheque.'
      end
      object Label6: TLabel
        Left = 6
        Top = 323
        Width = 24
        Height = 13
        Caption = 'Valor'
      end
      object Label11: TLabel
        Left = 445
        Top = 295
        Width = 59
        Height = 13
        Caption = 'Nome Banco'
      end
      object DBText1: TDBText
        Left = 206
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
      object DBText2: TDBText
        Left = 206
        Top = 113
        Width = 48
        Height = 13
        AutoSize = True
        DataField = 'NOME'
        DataSource = DataCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnEmpresa: TSpeedButton
        Left = 136
        Top = 85
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
      object btnCliente: TSpeedButton
        Left = 136
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
        OnClick = btnClienteClick
      end
      object Label7: TLabel
        Left = 184
        Top = 61
        Width = 52
        Height = 13
        Caption = 'Dt. Movim.'
      end
      object Label1: TLabel
        Left = 445
        Top = 321
        Width = 55
        Height = 13
        Caption = 'Dt. Vencim.'
      end
      object Label4: TLabel
        Left = 6
        Top = 140
        Width = 48
        Height = 13
        Caption = 'CPF/CNPJ'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 6
        Top = 166
        Width = 78
        Height = 13
        Caption = 'Nome do Cliente'
      end
      object Label10: TLabel
        Left = 6
        Top = 192
        Width = 45
        Height = 13
        Caption = 'Endere'#231'o'
      end
      object Label12: TLabel
        Left = 6
        Top = 218
        Width = 28
        Height = 13
        Caption = 'Bairro'
      end
      object Label13: TLabel
        Left = 6
        Top = 244
        Width = 43
        Height = 13
        Caption = 'Munic'#237'pio'
      end
      object Label14: TLabel
        Left = 6
        Top = 270
        Width = 19
        Height = 13
        Caption = 'CEP'
      end
      object Label15: TLabel
        Left = 445
        Top = 269
        Width = 42
        Height = 13
        Caption = 'Telefone'
      end
      object Label22: TLabel
        Left = 606
        Top = 322
        Width = 50
        Height = 13
        Caption = 'Bloqueado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label16: TLabel
        Left = 356
        Top = 67
        Width = 75
        Height = 13
        Caption = 'Nome  Portador'
      end
      object Label17: TLabel
        Left = 355
        Top = 98
        Width = 90
        Height = 13
        Caption = 'Dados do Portador'
      end
      object Label18: TLabel
        Left = 184
        Top = 297
        Width = 45
        Height = 13
        Caption = 'Liquidado'
      end
      object Label20: TLabel
        Left = 289
        Top = 297
        Width = 23
        Height = 13
        Caption = 'Data'
      end
      object Label21: TLabel
        Left = 237
        Top = 323
        Width = 34
        Height = 13
        Caption = 'Banco'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText3: TDBText
        Left = 287
        Top = 323
        Width = 48
        Height = 13
        AutoSize = True
        DataField = 'DESCRICAO'
        DataSource = DataBanco
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl1: TLabel
        Left = 6
        Top = 351
        Width = 46
        Height = 13
        Caption = 'Operador'
      end
      object lbl2: TLabel
        Left = 7
        Top = 375
        Width = 40
        Height = 13
        Caption = 'Doc. Ecf'
      end
      object lbl3: TLabel
        Left = 214
        Top = 375
        Width = 15
        Height = 13
        Caption = 'Ecf'
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 796
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object btnPrior: TBitBtn
          Left = 85
          Top = 6
          Width = 75
          Height = 25
          Caption = 'Anterior'
          TabOrder = 0
          OnClick = btnPriorClick
        end
        object btnNext: TBitBtn
          Left = 166
          Top = 6
          Width = 75
          Height = 25
          Caption = 'Pr'#243'ximo'
          TabOrder = 1
          OnClick = btnNextClick
        end
        object btnInsert: TBitBtn
          Left = 247
          Top = 6
          Width = 75
          Height = 25
          Caption = '&Incluir'
          TabOrder = 2
          OnClick = btnInsertClick
        end
        object btnEdit: TBitBtn
          Left = 329
          Top = 6
          Width = 75
          Height = 25
          Caption = 'A&lterar'
          TabOrder = 3
          OnClick = btnEditClick
        end
        object btnDelete: TBitBtn
          Left = 409
          Top = 6
          Width = 75
          Height = 25
          Caption = '&Excluir'
          TabOrder = 4
          OnClick = btnDeleteClick
        end
        object btnSave: TBitBtn
          Left = 490
          Top = 6
          Width = 75
          Height = 25
          Caption = '&Salvar'
          TabOrder = 5
          OnClick = btnSaveClick
        end
        object btnDiscard: TBitBtn
          Left = 571
          Top = 6
          Width = 75
          Height = 25
          Caption = 'C&ancelar'
          TabOrder = 6
          OnClick = btnDiscardClick
        end
      end
      object DT_CHEQUE: TDateEdit
        Left = 87
        Top = 58
        Width = 90
        Height = 21
        CheckOnExit = True
        DialogTitle = 'Selecione a Data'
        Enabled = False
        NumGlyphs = 2
        TabOrder = 1
        OnEnter = DT_CHEQUEEnter
        OnKeyDown = DT_CHEQUEKeyDown
      end
      object EMPRESA_ID: TCurrencyEdit
        Left = 87
        Top = 84
        Width = 47
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0;-0'
        Enabled = False
        TabOrder = 3
        ZeroEmpty = False
        OnExit = EMPRESA_IDExit
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object CLIENTE_ID: TCurrencyEdit
        Left = 87
        Top = 110
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
        OnExit = CLIENTE_IDExit
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object NOME_BANCO: TEdit
        Left = 512
        Top = 292
        Width = 211
        Height = 21
        Enabled = False
        MaxLength = 30
        TabOrder = 14
        OnKeyDown = DT_CHEQUEKeyDown
      end
      object VALOR: TRxCalcEdit
        Left = 87
        Top = 320
        Width = 121
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
      object DT_MOVIMENTO: TDateEdit
        Left = 245
        Top = 58
        Width = 90
        Height = 21
        CheckOnExit = True
        DialogTitle = 'Selecione a Data'
        Enabled = False
        NumGlyphs = 2
        TabOrder = 2
        OnEnter = DT_CHEQUEEnter
        OnKeyDown = DT_CHEQUEKeyDown
      end
      object AUTORIZ_ID: TCurrencyEdit
        Left = 674
        Top = 11
        Width = 47
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0;-0'
        Enabled = False
        TabOrder = 17
        Visible = False
        ZeroEmpty = False
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object DT_VENCIMENTO: TDateEdit
        Left = 512
        Top = 318
        Width = 90
        Height = 21
        CheckOnExit = True
        DialogTitle = 'Selecione a Data'
        Enabled = False
        NumGlyphs = 2
        TabOrder = 16
        OnKeyDown = DT_CHEQUEKeyDown
      end
      object CPF_CNPJ: TCurrencyEdit
        Left = 87
        Top = 137
        Width = 121
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0;-0'
        Enabled = False
        TabOrder = 5
        ZeroEmpty = False
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object NOME_CLIENTE: TEdit
        Left = 87
        Top = 163
        Width = 344
        Height = 21
        Enabled = False
        MaxLength = 40
        TabOrder = 6
        OnKeyDown = DT_CHEQUEKeyDown
      end
      object ENDERECO: TEdit
        Left = 87
        Top = 187
        Width = 344
        Height = 21
        Enabled = False
        MaxLength = 40
        TabOrder = 7
        OnKeyDown = DT_CHEQUEKeyDown
      end
      object BAIRRO: TEdit
        Left = 87
        Top = 214
        Width = 344
        Height = 21
        Enabled = False
        MaxLength = 20
        TabOrder = 8
        OnKeyDown = DT_CHEQUEKeyDown
      end
      object MUNICIPIO: TEdit
        Left = 87
        Top = 241
        Width = 344
        Height = 21
        Enabled = False
        MaxLength = 30
        TabOrder = 9
        OnKeyDown = DT_CHEQUEKeyDown
      end
      object CEP: TMaskEdit
        Left = 87
        Top = 267
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
        TabOrder = 10
        Text = '     -   '
        OnKeyDown = DT_CHEQUEKeyDown
      end
      object DDD: TMaskEdit
        Left = 512
        Top = 266
        Width = 32
        Height = 21
        CharCase = ecUpperCase
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 11
        Text = ''
        OnKeyDown = DT_CHEQUEKeyDown
      end
      object TELEFONE: TMaskEdit
        Left = 550
        Top = 266
        Width = 77
        Height = 21
        CharCase = ecUpperCase
        Enabled = False
        EditMask = '9999-9999;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 9
        ParentFont = False
        TabOrder = 12
        Text = '    -    '
        OnKeyDown = DT_CHEQUEKeyDown
      end
      object NUM_CHEQUE: TCurrencyEdit
        Left = 87
        Top = 294
        Width = 90
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0;-0'
        Enabled = False
        TabOrder = 13
        ZeroEmpty = False
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object LIQUIDADO: TEdit
        Left = 237
        Top = 294
        Width = 36
        Height = 21
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 40
        ParentFont = False
        ReadOnly = True
        TabOrder = 18
        OnKeyDown = DT_CHEQUEKeyDown
      end
      object BLOQUEADO: TComboBox
        Left = 662
        Top = 318
        Width = 61
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
        TabOrder = 19
        Items.Strings = (
          ''
          'SIM'
          'N'#195'O')
      end
      object Terceiros: TCheckBox
        Left = 222
        Top = 139
        Width = 102
        Height = 17
        Caption = 'Cheque Terceiros'
        Enabled = False
        TabOrder = 20
        OnClick = TerceirosClick
      end
      object NOME_TER: TEdit
        Left = 450
        Top = 64
        Width = 282
        Height = 21
        Enabled = False
        MaxLength = 40
        TabOrder = 21
        OnKeyDown = DT_CHEQUEKeyDown
      end
      object Observacao: TMemo
        Left = 451
        Top = 91
        Width = 282
        Height = 169
        Enabled = False
        Lines.Strings = (
          '')
        TabOrder = 22
      end
      object CHEQUE_ID: TCurrencyEdit
        Left = 620
        Top = 37
        Width = 47
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0;-0'
        Enabled = False
        TabOrder = 23
        Visible = False
        ZeroEmpty = False
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object Dt_liquidacao: TDateEdit
        Left = 319
        Top = 294
        Width = 90
        Height = 21
        CheckOnExit = True
        DialogTitle = 'Selecione a Data'
        Enabled = False
        NumGlyphs = 2
        ReadOnly = True
        TabOrder = 24
        OnKeyDown = DT_CHEQUEKeyDown
      end
      object BANCO_ID: TCurrencyEdit
        Left = 674
        Top = 37
        Width = 47
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0;-0'
        Enabled = False
        ReadOnly = True
        TabOrder = 25
        Visible = False
        ZeroEmpty = False
      end
      object Operador: TEdit
        Left = 87
        Top = 346
        Width = 239
        Height = 21
        Enabled = False
        MaxLength = 40
        ReadOnly = True
        TabOrder = 26
        OnKeyDown = DT_CHEQUEKeyDown
      end
      object ecf: TCurrencyEdit
        Left = 237
        Top = 373
        Width = 49
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0;-0'
        Enabled = False
        ReadOnly = True
        TabOrder = 27
        ZeroEmpty = False
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object num_doc: TEdit
        Left = 87
        Top = 373
        Width = 115
        Height = 21
        Enabled = False
        MaxLength = 40
        ReadOnly = True
        TabOrder = 28
        OnKeyDown = DT_CHEQUEKeyDown
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 432
    Width = 804
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnRetorna: TBitBtn
      Left = 715
      Top = 7
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
      Left = 635
      Top = 7
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
    Left = 8
    Top = 428
  end
  object DataEmpresa: TDataSource
    DataSet = QEmpresa
    Left = 56
    Top = 428
  end
  object DataCliente: TDataSource
    DataSet = QCliente
    Left = 96
    Top = 428
  end
  object PopupMenu1: TPopupMenu
    Left = 152
    Top = 432
    object Liquida_Cheque: TMenuItem
      Caption = 'Liquida Cheque'
      OnClick = Liquida_ChequeClick
    end
  end
  object DataBanco: TDataSource
    DataSet = QBanco
    Left = 264
    Top = 439
  end
  object QBanco: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM BANCOS'
      'WHERE'
      '(BANCO_ID = :BANCO_ID)'
      'AND (EMPRESA_ID = :EMPRESA_ID)'
      'AND (STATUS = '#39'A'#39')')
    Left = 280
    Top = 360
    ParamData = <
      item
        Name = 'BANCO_ID'
        ParamType = ptInput
      end
      item
        Name = 'EMPRESA_ID'
        ParamType = ptInput
      end>
  end
  object QLiquida: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 224
    Top = 368
  end
  object iQuery2: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 176
    Top = 368
  end
  object QCliente: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM CLIENTES'
      'WHERE'
      '(CLIENTE_ID = :CLIENTE_ID)'
      'AND (STATUS = '#39'A'#39')')
    Left = 136
    Top = 368
    ParamData = <
      item
        Name = 'CLIENTE_ID'
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
    Top = 368
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
    Left = 64
    Top = 368
  end
  object QTabela: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM CHEQUES_RECEBIDOS')
    Left = 8
    Top = 368
  end
end
