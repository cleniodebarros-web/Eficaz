object FrmOperadores: TFrmOperadores
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Operadores'
  ClientHeight = 375
  ClientWidth = 766
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
    Width = 766
    Height = 334
    ActivePage = Manutencao
    Align = alClient
    TabOrder = 0
    object Consulta: TTabSheet
      Caption = '&Consulta'
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 758
        Height = 287
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
            FieldName = 'NOME'
            Title.Caption = 'Nome'
            Width = 251
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CANCELA_ITEM'
            Title.Caption = 'Canc. Item'
            Width = 84
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CANCELA_CUPOM'
            Title.Caption = 'Canc. Cupom'
            Width = 84
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LEITURA_Z'
            Title.Caption = 'Leitura Z'
            Width = 84
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ENTRADA_OPERADOR'
            Title.Caption = 'Entr. Operador'
            Width = 84
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SAIDA_VENDA'
            Title.Caption = 'Sa'#237'da Venda'
            Width = 84
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'status'
            Title.Alignment = taCenter
            Title.Caption = 'Status'
            Visible = True
          end>
      end
      object StatusBar1: TStatusBar
        Left = 0
        Top = 287
        Width = 758
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
      ImageIndex = 1
      OnShow = ManutencaoShow
      object Label3: TLabel
        Left = 6
        Top = 61
        Width = 60
        Height = 13
        Caption = 'ID Operador'
      end
      object Label4: TLabel
        Left = 6
        Top = 87
        Width = 27
        Height = 13
        Caption = 'Nome'
      end
      object Label2: TLabel
        Left = 6
        Top = 113
        Width = 79
        Height = 13
        Caption = 'Desc. M'#225'x. Item'
      end
      object DESCONTO_MAX_SUB_TOTAL: TLabel
        Left = 6
        Top = 139
        Width = 103
        Height = 13
        Caption = 'Desc. M'#225'x. Sub-Total'
      end
      object Label5: TLabel
        Left = 6
        Top = 165
        Width = 107
        Height = 13
        Caption = 'Vr. M'#225'x. Aprov. Cr'#233'd.'
      end
      object btnFuncionario: TSpeedButton
        Left = 310
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
        OnClick = btnFuncionarioClick
      end
      object Label1: TLabel
        Left = 216
        Top = 113
        Width = 83
        Height = 13
        Caption = 'Acres. M'#225'x. Item'
      end
      object Label6: TLabel
        Left = 216
        Top = 139
        Width = 107
        Height = 13
        Caption = 'Acres. M'#225'x. Sub-Total'
      end
      object OPERADOR_ID: TEdit
        Left = 118
        Top = 58
        Width = 106
        Height = 21
        Enabled = False
        MaxLength = 14
        PasswordChar = '*'
        TabOrder = 0
        OnKeyDown = OPERADOR_IDKeyDown
      end
      object NOME: TEdit
        Left = 118
        Top = 84
        Width = 186
        Height = 21
        Enabled = False
        MaxLength = 20
        TabOrder = 1
        OnKeyDown = OPERADOR_IDKeyDown
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 758
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 17
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
      object ENTRADA_OPERADOR: TCheckBox
        Left = 474
        Top = 86
        Width = 122
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Entrada Operador'
        Enabled = False
        TabOrder = 11
        OnKeyDown = OPERADOR_IDKeyDown
      end
      object SAIDA_SISTEMA: TCheckBox
        Left = 474
        Top = 112
        Width = 122
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Sangria'
        Enabled = False
        TabOrder = 12
        OnKeyDown = OPERADOR_IDKeyDown
      end
      object DESLIGAR: TCheckBox
        Left = 474
        Top = 137
        Width = 122
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Leitura X'
        Enabled = False
        TabOrder = 13
        OnKeyDown = OPERADOR_IDKeyDown
      end
      object SAIDA_VENDA: TCheckBox
        Left = 474
        Top = 161
        Width = 122
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Sa'#237'da Venda'
        Enabled = False
        TabOrder = 14
        OnKeyDown = OPERADOR_IDKeyDown
      end
      object DESCONTO_MAX_ITEM: TRxCalcEdit
        Left = 118
        Top = 110
        Width = 92
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DisplayFormat = '0.00;-0.00'
        Enabled = False
        NumGlyphs = 2
        TabOrder = 2
        ZeroEmpty = False
        OnKeyDown = DESCONTO_MAX_ITEMKeyDown
      end
      object DESCONTO_MAX_SUBTOTAL: TRxCalcEdit
        Left = 118
        Top = 136
        Width = 92
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DisplayFormat = '0.00;-0.00'
        Enabled = False
        NumGlyphs = 2
        TabOrder = 3
        ZeroEmpty = False
        OnKeyDown = DESCONTO_MAX_ITEMKeyDown
      end
      object LIMITE_APROVA: TRxCalcEdit
        Left = 118
        Top = 162
        Width = 92
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DisplayFormat = '0.00;-0.00'
        Enabled = False
        NumGlyphs = 2
        TabOrder = 6
        ZeroEmpty = False
        OnKeyDown = DESCONTO_MAX_ITEMKeyDown
      end
      object CANCELA_CUPOM: TCheckBox
        Left = 6
        Top = 191
        Width = 122
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Cancela Cupom'
        Enabled = False
        TabOrder = 7
        OnKeyDown = OPERADOR_IDKeyDown
      end
      object CANCELA_ITEM: TCheckBox
        Left = 6
        Top = 217
        Width = 122
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Cancela Item'
        Enabled = False
        TabOrder = 8
        OnKeyDown = OPERADOR_IDKeyDown
      end
      object LEITURA_Z: TCheckBox
        Left = 6
        Top = 243
        Width = 122
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Leitura Z'
        Enabled = False
        TabOrder = 9
        OnKeyDown = OPERADOR_IDKeyDown
      end
      object SAIDA_OPERADOR: TCheckBox
        Left = 6
        Top = 269
        Width = 122
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Sa'#237'da Operador'
        Enabled = False
        TabOrder = 10
        OnKeyDown = OPERADOR_IDKeyDown
      end
      object ENTRADA_SISTEMA: TCheckBox
        Left = 474
        Top = 190
        Width = 122
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Entrada Sistema'
        Enabled = False
        TabOrder = 15
        OnKeyDown = OPERADOR_IDKeyDown
      end
      object ENTRADA_VENDA: TCheckBox
        Left = 474
        Top = 216
        Width = 122
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Entrada Venda'
        Enabled = False
        TabOrder = 16
        OnKeyDown = OPERADOR_IDKeyDown
      end
      object Funcionario_id: TCurrencyEdit
        Left = 163
        Top = 203
        Width = 47
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0;-0'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 18
        Visible = False
        ZeroEmpty = False
        OnExit = Funcionario_idExit
      end
      object Status_os: TCheckBox
        Left = 474
        Top = 242
        Width = 122
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Status Ordem Sevi'#231'o'
        Enabled = False
        TabOrder = 19
        OnKeyDown = OPERADOR_IDKeyDown
      end
      object Terminal_Garcom: TCheckBox
        Left = 475
        Top = 268
        Width = 121
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Terminal Gar'#231'om'
        Enabled = False
        TabOrder = 20
        Visible = False
        OnKeyDown = OPERADOR_IDKeyDown
      end
      object RECEBIMENTO_PDV: TCheckBox
        Left = 618
        Top = 86
        Width = 121
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Recebimento Pdv'
        Enabled = False
        TabOrder = 21
        OnKeyDown = OPERADOR_IDKeyDown
      end
      object GERENCIAR_NFCE: TCheckBox
        Left = 618
        Top = 112
        Width = 121
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Gerenciamento Nfc-e'
        Enabled = False
        TabOrder = 22
        OnKeyDown = OPERADOR_IDKeyDown
      end
      object acrescimo_max_item: TRxCalcEdit
        Left = 343
        Top = 110
        Width = 92
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DisplayFormat = '0.00;-0.00'
        Enabled = False
        NumGlyphs = 2
        TabOrder = 5
        ZeroEmpty = False
        OnKeyDown = DESCONTO_MAX_ITEMKeyDown
      end
      object acrescimo_max_subtotal: TRxCalcEdit
        Left = 343
        Top = 136
        Width = 92
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DisplayFormat = '0.00;-0.00'
        Enabled = False
        NumGlyphs = 2
        TabOrder = 4
        ZeroEmpty = False
        OnKeyDown = DESCONTO_MAX_ITEMKeyDown
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 334
    Width = 766
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
  end
  object DataTabela: TDataSource
    AutoEdit = False
    DataSet = QTabela
    Left = 64
    Top = 344
  end
  object QFuncionario: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM FUNCIONARIOS'
      'WHERE'
      '(FUNCIONARIO_ID = :FUNCIONARIO_ID)'
      'AND (STATUS = '#39'A'#39')')
    Left = 128
    Top = 296
    ParamData = <
      item
        Name = 'FUNCIONARIO_ID'
        ParamType = ptInput
      end>
  end
  object IQuery: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 80
    Top = 288
  end
  object QTabela: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      'SELECT * FROM OPERADORES'
      '')
    Left = 40
    Top = 288
  end
end
