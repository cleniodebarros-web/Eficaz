object FrmImpressoras_Fiscais: TFrmImpressoras_Fiscais
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsSingle
  Caption = 'Impressoras Fiscais'
  ClientHeight = 400
  ClientWidth = 736
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
  object Label12: TLabel
    Left = 10
    Top = 253
    Width = 46
    Height = 13
    Caption = 'Insc. Est.'
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 736
    Height = 359
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
        Width = 728
        Height = 312
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
            FieldName = 'SERIAL'
            Title.Caption = 'Serial'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO_ECF'
            Title.Caption = 'Tipo ECF'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MARCA_ECF'
            Title.Caption = 'Marca ECF'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MODELO'
            Title.Caption = 'Modelo ECF'
            Width = 130
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'num_ecf'
            Title.Alignment = taCenter
            Title.Caption = 'Ecf'
            Width = 42
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'status'
            Title.Caption = 'Status'
            Visible = True
          end>
      end
      object StatusBar1: TStatusBar
        Left = 0
        Top = 312
        Width = 728
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
        Left = 6
        Top = 61
        Width = 26
        Height = 13
        Caption = 'Serial'
      end
      object Label20: TLabel
        Left = 447
        Top = 61
        Width = 18
        Height = 13
        Caption = 'CNI'
      end
      object Label4: TLabel
        Left = 6
        Top = 87
        Width = 42
        Height = 13
        Caption = 'Tipo ECF'
      end
      object Label14: TLabel
        Left = 6
        Top = 139
        Width = 56
        Height = 13
        Caption = 'Dt. Inst. SB'
      end
      object Label16: TLabel
        Left = 6
        Top = 165
        Width = 47
        Height = 13
        Caption = 'Num. ECF'
      end
      object Label13: TLabel
        Left = 447
        Top = 113
        Width = 48
        Height = 13
        Caption = 'Vers'#227'o SB'
      end
      object Label15: TLabel
        Left = 447
        Top = 139
        Width = 56
        Height = 13
        Caption = 'Hr. Inst. SB'
      end
      object Label17: TLabel
        Left = -8
        Top = 384
        Width = 61
        Height = 13
        Caption = 'Num. Vers'#227'o'
        Visible = False
      end
      object Label21: TLabel
        Left = 6
        Top = 409
        Width = 42
        Height = 13
        Caption = 'Gr. Total'
        Visible = False
      end
      object Label22: TLabel
        Left = 6
        Top = 191
        Width = 25
        Height = 13
        Caption = 'CNPJ'
      end
      object Label26: TLabel
        Left = 447
        Top = 87
        Width = 29
        Height = 13
        Caption = 'Marca'
      end
      object Label36: TLabel
        Left = 6
        Top = 113
        Width = 34
        Height = 13
        Caption = 'Modelo'
      end
      object Label45: TLabel
        Left = 6
        Top = 218
        Width = 46
        Height = 13
        Caption = 'Insc. Est.'
      end
      object Label1: TLabel
        Left = 6
        Top = 435
        Width = 35
        Height = 13
        Caption = 'Licen'#231'a'
        Visible = False
      end
      object btnCNI: TSpeedButton
        Left = 604
        Top = 58
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
        OnClick = btnCNIClick
      end
      object Label5: TLabel
        Left = 447
        Top = 166
        Width = 50
        Height = 13
        Caption = 'Banco Pdv'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 447
        Top = 218
        Width = 36
        Height = 13
        Caption = 'Usu'#225'rio'
      end
      object Label7: TLabel
        Left = 447
        Top = 191
        Width = 61
        Height = 13
        Caption = 'IP/Porta Pdv'
      end
      object Label8: TLabel
        Left = 448
        Top = 245
        Width = 30
        Height = 13
        Caption = 'Senha'
      end
      object Label9: TLabel
        Left = 144
        Top = 159
        Width = 79
        Height = 24
        Caption = 'STATUS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object Label10: TLabel
        Left = 479
        Top = 274
        Width = 130
        Height = 24
        Caption = 'Conex'#227'o Pdv'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 6
        Top = 245
        Width = 55
        Height = 13
        Caption = 'Atualiza'#231#227'o'
      end
      object Label18: TLabel
        Left = 6
        Top = 271
        Width = 107
        Height = 13
        Caption = 'Path Nfce Serv. Recb.'
      end
      object Label19: TLabel
        Left = 6
        Top = 298
        Width = 101
        Height = 13
        Caption = 'Path Nfce Serv. Env.'
      end
      object SERIAL: TEdit
        Left = 68
        Top = 58
        Width = 301
        Height = 21
        Enabled = False
        MaxLength = 30
        TabOrder = 1
        OnKeyDown = SERIALKeyDown
      end
      object TIPO_ECF: TEdit
        Left = 68
        Top = 84
        Width = 169
        Height = 21
        Enabled = False
        MaxLength = 15
        TabOrder = 3
        OnKeyDown = SERIALKeyDown
      end
      object VERSAO_SB: TEdit
        Left = 523
        Top = 110
        Width = 179
        Height = 21
        Enabled = False
        MaxLength = 20
        ReadOnly = True
        TabOrder = 6
        OnKeyDown = SERIALKeyDown
      end
      object IE: TEdit
        Left = 68
        Top = 215
        Width = 165
        Height = 21
        Enabled = False
        MaxLength = 20
        TabOrder = 15
        OnKeyDown = SERIALKeyDown
      end
      object CNPJ: TMaskEdit
        Left = 68
        Top = 188
        Width = 132
        Height = 21
        CharCase = ecUpperCase
        Enabled = False
        EditMask = '99.999.999/9999-99;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 18
        ParentFont = False
        TabOrder = 12
        Text = '  .   .   /    -  '
        OnKeyDown = SERIALKeyDown
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 728
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
          Left = 525
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
      object NUM_ECF: TEdit
        Left = 68
        Top = 162
        Width = 45
        Height = 21
        Enabled = False
        MaxLength = 3
        TabOrder = 9
        OnKeyDown = SERIALKeyDown
      end
      object NUM_VERSAO: TEdit
        Left = 68
        Top = 381
        Width = 165
        Height = 21
        Enabled = False
        MaxLength = 10
        TabOrder = 22
        Visible = False
        OnKeyDown = SERIALKeyDown
      end
      object DT_INST_SB: TDateEdit
        Left = 68
        Top = 135
        Width = 90
        Height = 21
        CheckOnExit = True
        DialogTitle = 'Selecione a Data'
        Enabled = False
        NumGlyphs = 2
        TabOrder = 7
        OnEnter = DT_INST_SBEnter
        OnKeyDown = SERIALKeyDown
      end
      object GRANDE_TOTAL: TRxCalcEdit
        Left = 68
        Top = 406
        Width = 92
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DisplayFormat = '0.00;-0.00'
        Enabled = False
        MaxValue = 99999.990000000000000000
        NumGlyphs = 2
        TabOrder = 23
        Visible = False
        ZeroEmpty = False
      end
      object MARCA_ECF: TEdit
        Left = 523
        Top = 84
        Width = 179
        Height = 21
        Enabled = False
        MaxLength = 30
        TabOrder = 4
        OnKeyDown = SERIALKeyDown
      end
      object MODELO: TEdit
        Left = 68
        Top = 110
        Width = 245
        Height = 21
        Enabled = False
        MaxLength = 20
        TabOrder = 5
        OnKeyDown = SERIALKeyDown
      end
      object HR_INST_SB: TMaskEdit
        Left = 523
        Top = 136
        Width = 61
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
        Enabled = False
        EditMask = '99:99:99'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 8
        ParentFont = False
        TabOrder = 8
        Text = '  :  :  '
        OnKeyDown = SERIALKeyDown
      end
      object CNI: TEdit
        Left = 523
        Top = 58
        Width = 77
        Height = 21
        Enabled = False
        MaxLength = 6
        TabOrder = 2
        OnExit = CNIExit
        OnKeyDown = SERIALKeyDown
      end
      object LICENCA: TEdit
        Left = 68
        Top = 432
        Width = 301
        Height = 21
        Enabled = False
        MaxLength = 32
        TabOrder = 24
        Visible = False
        OnKeyDown = SERIALKeyDown
      end
      object ip: TEdit
        Left = 523
        Top = 188
        Width = 102
        Height = 21
        Enabled = False
        MaxLength = 15
        TabOrder = 13
        OnKeyDown = SERIALKeyDown
      end
      object usuario: TEdit
        Left = 523
        Top = 215
        Width = 183
        Height = 21
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 20
        ParentFont = False
        TabOrder = 16
        OnKeyDown = SERIALKeyDown
      end
      object senha: TEdit
        Left = 523
        Top = 242
        Width = 183
        Height = 21
        Enabled = False
        MaxLength = 20
        PasswordChar = '*'
        TabOrder = 18
        OnKeyDown = SERIALKeyDown
      end
      object banco: TEdit
        Left = 523
        Top = 163
        Width = 102
        Height = 21
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 30
        ParentFont = False
        TabOrder = 10
        OnKeyDown = SERIALKeyDown
      end
      object BitBtn1: TBitBtn
        Left = 631
        Top = 160
        Width = 75
        Height = 25
        Caption = 'Conectar'
        TabOrder = 11
        OnClick = BitBtn1Click
      end
      object porta: TEdit
        Left = 639
        Top = 188
        Width = 69
        Height = 21
        Enabled = False
        MaxLength = 4
        NumbersOnly = True
        TabOrder = 14
        OnKeyDown = SERIALKeyDown
      end
      object Gerar_Sped: TCheckBox
        Left = 631
        Top = 138
        Width = 75
        Height = 17
        Caption = 'Gerar Sped'
        Enabled = False
        TabOrder = 25
      end
      object pathnfce_local: TEdit
        Left = 113
        Top = 242
        Width = 305
        Height = 21
        CharCase = ecUpperCase
        Enabled = False
        MaxLength = 60
        ReadOnly = True
        TabOrder = 17
        OnKeyDown = SERIALKeyDown
      end
      object pathnfce_servidor: TEdit
        Left = 113
        Top = 269
        Width = 305
        Height = 21
        CharCase = ecUpperCase
        Enabled = False
        MaxLength = 60
        TabOrder = 19
        OnKeyDown = SERIALKeyDown
      end
      object dt_sync: TDateEdit
        Left = 175
        Top = 135
        Width = 90
        Height = 21
        CheckOnExit = True
        DialogTitle = 'Selecione a Data'
        Enabled = False
        NumGlyphs = 2
        TabOrder = 21
        Visible = False
        OnEnter = DT_INST_SBEnter
        OnKeyDown = SERIALKeyDown
      end
      object dt_sync_cli: TDateEdit
        Left = 271
        Top = 135
        Width = 90
        Height = 21
        CheckOnExit = True
        DialogTitle = 'Selecione a Data'
        Enabled = False
        NumGlyphs = 2
        TabOrder = 26
        Visible = False
        OnEnter = DT_INST_SBEnter
        OnKeyDown = SERIALKeyDown
      end
      object pathnfce_servidor_env: TEdit
        Left = 113
        Top = 296
        Width = 305
        Height = 21
        CharCase = ecUpperCase
        Enabled = False
        MaxLength = 60
        TabOrder = 20
        OnKeyDown = SERIALKeyDown
      end
    end
    object Tab_AtivarPdvs: TTabSheet
      Caption = 'Atualiza'#231#227'o Pdvs'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ImageIndex = 2
      ParentFont = False
      TabVisible = False
      OnShow = Tab_AtivarPdvsShow
      object Label11: TLabel
        Left = 204
        Top = 209
        Width = 98
        Height = 14
        Caption = #218'ltima Execu'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_exportar_cliente: TButton
        Left = 35
        Top = 139
        Width = 158
        Height = 25
        Caption = 'Carga Clientes p/ Pdv'
        Enabled = False
        TabOrder = 0
        OnClick = btn_exportar_clienteClick
      end
      object btn_tributos: TButton
        Left = 35
        Top = 174
        Width = 158
        Height = 25
        Caption = 'Carga Tributos'
        Enabled = False
        TabOrder = 1
        OnClick = btn_tributosClick
      end
      object btn_exportar_produto: TButton
        Left = 204
        Top = 139
        Width = 158
        Height = 25
        Caption = 'Carga Produtos p/ Pdv'
        Enabled = False
        TabOrder = 2
        OnClick = btn_exportar_produtoClick
      end
      object btn_operadores: TButton
        Left = 204
        Top = 174
        Width = 158
        Height = 25
        Caption = 'Carga Operadores'
        Enabled = False
        TabOrder = 3
        OnClick = btn_operadoresClick
      end
      object btn_finalizadoras: TButton
        Left = 369
        Top = 139
        Width = 158
        Height = 25
        Caption = 'Carga Finalizadoras'
        Enabled = False
        TabOrder = 4
        OnClick = btn_finalizadorasClick
      end
      object Btn_Ibtp: TButton
        Left = 369
        Top = 175
        Width = 158
        Height = 25
        Caption = 'Carga Tabela Ibpt'
        Enabled = False
        TabOrder = 5
        OnClick = Btn_IbtpClick
      end
      object Btn_Configuracoes: TButton
        Left = 532
        Top = 139
        Width = 158
        Height = 25
        Caption = 'Carga Configura'#231#245'es'
        Enabled = False
        TabOrder = 6
        OnClick = Btn_ConfiguracoesClick
      end
      object Chk_Total: TCheckBox
        Left = 537
        Top = 181
        Width = 142
        Height = 17
        Caption = 'Exportar todos Registros'
        TabOrder = 7
      end
      object GroupBox1: TGroupBox
        Left = 32
        Top = 2
        Width = 658
        Height = 131
        Caption = 'Ecfs Ativos'
        TabOrder = 8
        object Ecf001: TCheckBox
          Left = 8
          Top = 16
          Width = 59
          Height = 17
          Caption = 'Ecf001'
          Enabled = False
          TabOrder = 0
          OnClick = Ecf001Click
        end
        object Ecf011: TCheckBox
          Left = 8
          Top = 39
          Width = 59
          Height = 17
          Caption = 'Ecf011'
          Enabled = False
          TabOrder = 1
          OnClick = Ecf001Click
        end
        object Ecf021: TCheckBox
          Left = 8
          Top = 62
          Width = 59
          Height = 17
          Caption = 'Ecf021'
          Enabled = False
          TabOrder = 2
          OnClick = Ecf001Click
        end
        object Ecf022: TCheckBox
          Left = 73
          Top = 62
          Width = 59
          Height = 17
          Caption = 'Ecf022'
          Enabled = False
          TabOrder = 3
          OnClick = Ecf001Click
        end
        object Ecf012: TCheckBox
          Left = 73
          Top = 39
          Width = 59
          Height = 17
          Caption = 'Ecf012'
          Enabled = False
          TabOrder = 4
          OnClick = Ecf001Click
        end
        object Ecf002: TCheckBox
          Left = 73
          Top = 16
          Width = 59
          Height = 17
          Caption = 'Ecf002'
          Enabled = False
          TabOrder = 5
          OnClick = Ecf001Click
        end
        object Ecf003: TCheckBox
          Left = 138
          Top = 16
          Width = 59
          Height = 17
          Caption = 'Ecf003'
          Enabled = False
          TabOrder = 6
          OnClick = Ecf001Click
        end
        object Ecf013: TCheckBox
          Left = 138
          Top = 39
          Width = 59
          Height = 17
          Caption = 'Ecf013'
          Enabled = False
          TabOrder = 7
          OnClick = Ecf001Click
        end
        object Ecf023: TCheckBox
          Left = 138
          Top = 62
          Width = 59
          Height = 17
          Caption = 'Ecf023'
          Enabled = False
          TabOrder = 8
          OnClick = Ecf001Click
        end
        object Ecf024: TCheckBox
          Left = 203
          Top = 62
          Width = 59
          Height = 17
          Caption = 'Ecf024'
          Enabled = False
          TabOrder = 9
          OnClick = Ecf001Click
        end
        object Ecf014: TCheckBox
          Left = 203
          Top = 39
          Width = 59
          Height = 17
          Caption = 'Ecf014'
          Enabled = False
          TabOrder = 10
          OnClick = Ecf001Click
        end
        object Ecf004: TCheckBox
          Left = 203
          Top = 16
          Width = 59
          Height = 17
          Caption = 'Ecf004'
          Enabled = False
          TabOrder = 11
          OnClick = Ecf001Click
        end
        object Ecf025: TCheckBox
          Left = 268
          Top = 62
          Width = 59
          Height = 17
          Caption = 'Ecf025'
          Enabled = False
          TabOrder = 12
          OnClick = Ecf001Click
        end
        object Ecf015: TCheckBox
          Left = 268
          Top = 39
          Width = 59
          Height = 17
          Caption = 'Ecf015'
          Enabled = False
          TabOrder = 13
          OnClick = Ecf001Click
        end
        object Ecf005: TCheckBox
          Left = 268
          Top = 16
          Width = 59
          Height = 17
          Caption = 'Ecf005'
          Enabled = False
          TabOrder = 14
          OnClick = Ecf001Click
        end
        object Ecf026: TCheckBox
          Left = 333
          Top = 62
          Width = 59
          Height = 17
          Caption = 'Ecf026'
          Enabled = False
          TabOrder = 15
          OnClick = Ecf001Click
        end
        object Ecf016: TCheckBox
          Left = 333
          Top = 39
          Width = 59
          Height = 17
          Caption = 'Ecf016'
          Enabled = False
          TabOrder = 16
          OnClick = Ecf001Click
        end
        object Ecf006: TCheckBox
          Left = 333
          Top = 16
          Width = 59
          Height = 17
          Caption = 'Ecf006'
          Enabled = False
          TabOrder = 17
          OnClick = Ecf001Click
        end
        object Ecf007: TCheckBox
          Left = 387
          Top = 16
          Width = 59
          Height = 17
          Caption = 'Ecf007'
          Enabled = False
          TabOrder = 18
          OnClick = Ecf001Click
        end
        object Ecf017: TCheckBox
          Left = 387
          Top = 39
          Width = 59
          Height = 17
          Caption = 'Ecf017'
          Enabled = False
          TabOrder = 19
          OnClick = Ecf001Click
        end
        object Ecf027: TCheckBox
          Left = 387
          Top = 62
          Width = 59
          Height = 17
          Caption = 'Ecf027'
          Enabled = False
          TabOrder = 20
          OnClick = Ecf001Click
        end
        object Ecf028: TCheckBox
          Left = 452
          Top = 62
          Width = 59
          Height = 17
          Caption = 'Ecf028'
          Enabled = False
          TabOrder = 21
          OnClick = Ecf001Click
        end
        object Ecf018: TCheckBox
          Left = 452
          Top = 39
          Width = 59
          Height = 17
          Caption = 'Ecf018'
          Enabled = False
          TabOrder = 22
          OnClick = Ecf001Click
        end
        object Ecf008: TCheckBox
          Left = 452
          Top = 16
          Width = 59
          Height = 17
          Caption = 'Ecf008'
          Enabled = False
          TabOrder = 23
          OnClick = Ecf001Click
        end
        object Ecf009: TCheckBox
          Left = 517
          Top = 16
          Width = 59
          Height = 17
          Caption = 'Ecf009'
          Enabled = False
          TabOrder = 24
          OnClick = Ecf001Click
        end
        object Ecf019: TCheckBox
          Left = 517
          Top = 39
          Width = 59
          Height = 17
          Caption = 'Ecf019'
          Enabled = False
          TabOrder = 25
          OnClick = Ecf001Click
        end
        object Ecf029: TCheckBox
          Left = 517
          Top = 62
          Width = 59
          Height = 17
          Caption = 'Ecf029'
          Enabled = False
          TabOrder = 26
          OnClick = Ecf001Click
        end
        object Ecf030: TCheckBox
          Left = 582
          Top = 62
          Width = 59
          Height = 17
          Caption = 'Ecf030'
          Enabled = False
          TabOrder = 27
          OnClick = Ecf001Click
        end
        object Ecf020: TCheckBox
          Left = 582
          Top = 39
          Width = 59
          Height = 17
          Caption = 'Ecf020'
          Enabled = False
          TabOrder = 28
          OnClick = Ecf001Click
        end
        object Ecf010: TCheckBox
          Left = 582
          Top = 16
          Width = 59
          Height = 17
          Caption = 'Ecf010'
          Enabled = False
          TabOrder = 29
          OnClick = Ecf001Click
        end
        object Todas_Ecfs: TCheckBox
          Left = 268
          Top = 109
          Width = 90
          Height = 17
          Caption = 'Todas as Ecfs'
          TabOrder = 30
          OnClick = Todas_EcfsClick
        end
        object Ecf031: TCheckBox
          Left = 8
          Top = 85
          Width = 59
          Height = 17
          Caption = 'Ecf031'
          Enabled = False
          TabOrder = 31
          OnClick = Ecf001Click
        end
        object Ecf032: TCheckBox
          Left = 73
          Top = 85
          Width = 59
          Height = 17
          Caption = 'Ecf032'
          Enabled = False
          TabOrder = 32
          OnClick = Ecf001Click
        end
        object Ecf033: TCheckBox
          Left = 138
          Top = 85
          Width = 59
          Height = 17
          Caption = 'Ecf033'
          Enabled = False
          TabOrder = 33
          OnClick = Ecf001Click
        end
        object Ecf034: TCheckBox
          Left = 203
          Top = 85
          Width = 59
          Height = 17
          Caption = 'Ecf034'
          Enabled = False
          TabOrder = 34
          OnClick = Ecf001Click
        end
        object Ecf035: TCheckBox
          Left = 268
          Top = 85
          Width = 59
          Height = 17
          Caption = 'Ecf025'
          Enabled = False
          TabOrder = 35
          OnClick = Ecf001Click
        end
        object Ecf036: TCheckBox
          Left = 333
          Top = 85
          Width = 59
          Height = 17
          Caption = 'Ecf026'
          Enabled = False
          TabOrder = 36
          OnClick = Ecf001Click
        end
        object Ecf037: TCheckBox
          Left = 387
          Top = 85
          Width = 59
          Height = 17
          Caption = 'Ecf027'
          Enabled = False
          TabOrder = 37
          OnClick = Ecf001Click
        end
        object Ecf038: TCheckBox
          Left = 452
          Top = 85
          Width = 59
          Height = 17
          Caption = 'Ecf038'
          Enabled = False
          TabOrder = 38
          OnClick = Ecf001Click
        end
        object Ecf039: TCheckBox
          Left = 517
          Top = 85
          Width = 59
          Height = 17
          Caption = 'Ecf039'
          Enabled = False
          TabOrder = 39
          OnClick = Ecf001Click
        end
        object Ecf040: TCheckBox
          Left = 582
          Top = 85
          Width = 59
          Height = 17
          Caption = 'Ecf040'
          Enabled = False
          TabOrder = 40
          OnClick = Ecf001Click
        end
      end
      object Btn_ReiniciaSync: TButton
        Left = 35
        Top = 205
        Width = 158
        Height = 25
        Caption = 'Reiniciar EficazSync'
        TabOrder = 9
        OnClick = Btn_ReiniciaSyncClick
      end
      object ProgressBar1: TProgressBar
        Left = 35
        Top = 256
        Width = 652
        Height = 17
        Max = 1000
        TabOrder = 10
        Visible = False
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 359
    Width = 736
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
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
  end
  object DataTabela: TDataSource
    AutoEdit = False
    DataSet = QTabela
    Left = 160
    Top = 347
  end
  object QTabela: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM LICENCA_IF')
    Left = 120
    Top = 344
  end
  object IQuery: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 192
    Top = 344
  end
  object VerificaPdvs: TFDConnection
    Left = 316
    Top = 336
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 268
    Top = 344
  end
  object IdTCPClient1: TIdTCPClient
    ConnectTimeout = 0
    IPVersion = Id_IPv4
    Port = 0
    ReadTimeout = -1
    Left = 420
    Top = 344
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    Left = 372
    Top = 344
  end
  object QUpdate: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      '')
    Left = 472
    Top = 344
  end
  object EventoRetornoImpressora: TFDEventAlerter
    Connection = FrmData.DbF_Eficaz
    Names.Strings = (
      'clientes_ok'
      'produtos_ok'
      'configuracoes_ok'
      'finalizadoras_ok'
      'tributos_ok'
      'operadores_ok'
      'ibpt_ok'
      'reiniciosync_ok')
    OnAlert = EventoRetornoImpressoraAlert
    Left = 520
    Top = 344
  end
  object BatchMove2: TBatchMove
    Left = 128
    Top = 192
  end
end
