object FrmCorrespondencia: TFrmCorrespondencia
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Correspond'#234'ncias'
  ClientHeight = 584
  ClientWidth = 581
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
    Width = 581
    Height = 543
    ActivePage = Consulta
    Align = alClient
    TabOrder = 0
    object Consulta: TTabSheet
      Caption = '&Consulta'
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 573
        Height = 515
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
            FieldName = 'CARTA_ID'
            Title.Caption = 'ID'
            Width = 36
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESC_CARTA'
            Title.Caption = 'Descri'#231#227'o'
            Width = 504
            Visible = True
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
        Width = 53
        Height = 13
        Caption = 'Remetente'
      end
      object Label4: TLabel
        Left = 6
        Top = 347
        Width = 46
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object Label5: TLabel
        Left = 6
        Top = 373
        Width = 58
        Height = 13
        Caption = 'Observa'#231#227'o'
      end
      object Label1: TLabel
        Left = 6
        Top = 217
        Width = 58
        Height = 13
        Caption = 'Destinat'#225'rio'
      end
      object btnFornecedor: TSpeedButton
        Left = 117
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
        OnClick = btnFornecedorClick
      end
      object btnCliente: TSpeedButton
        Left = 118
        Top = 214
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
      object DBText2: TDBText
        Left = 190
        Top = 61
        Width = 48
        Height = 13
        AutoSize = True
        DataField = 'NOME'
        DataSource = DataFornecedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText1: TDBText
        Left = 190
        Top = 217
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
      object Label2: TLabel
        Left = 6
        Top = 87
        Width = 45
        Height = 13
        Caption = 'Endere'#231'o'
      end
      object Label25: TLabel
        Left = 441
        Top = 87
        Width = 37
        Height = 13
        Caption = 'N'#250'mero'
      end
      object Label7: TLabel
        Left = 6
        Top = 113
        Width = 28
        Height = 13
        Caption = 'Bairro'
      end
      object Label10: TLabel
        Left = 6
        Top = 165
        Width = 19
        Height = 13
        Caption = 'CEP'
      end
      object btnIBGE_REM: TSpeedButton
        Left = 133
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
        OnClick = btnIBGE_REMClick
      end
      object Label24: TLabel
        Left = 6
        Top = 139
        Width = 49
        Height = 13
        Caption = 'C'#243'd. IBGE'
      end
      object Bevel1: TBevel
        Left = 6
        Top = 191
        Width = 561
        Height = 4
        Shape = bsTopLine
      end
      object Label6: TLabel
        Left = 6
        Top = 243
        Width = 45
        Height = 13
        Caption = 'Endere'#231'o'
      end
      object Label8: TLabel
        Left = 441
        Top = 243
        Width = 37
        Height = 13
        Caption = 'N'#250'mero'
      end
      object Label9: TLabel
        Left = 6
        Top = 269
        Width = 28
        Height = 13
        Caption = 'Bairro'
      end
      object Label11: TLabel
        Left = 6
        Top = 295
        Width = 49
        Height = 13
        Caption = 'C'#243'd. IBGE'
      end
      object SpeedButton1: TSpeedButton
        Left = 133
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
        OnClick = btnIBGE_REMClick
      end
      object Label12: TLabel
        Left = 6
        Top = 321
        Width = 19
        Height = 13
        Caption = 'CEP'
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 573
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
          Left = 87
          Top = 6
          Width = 75
          Height = 25
          Caption = 'Pr'#243'ximo'
          TabOrder = 1
          OnClick = btnNextClick
        end
        object btnInsert: TBitBtn
          Left = 168
          Top = 6
          Width = 75
          Height = 25
          Caption = '&Incluir'
          TabOrder = 2
          OnClick = btnInsertClick
        end
        object btnEdit: TBitBtn
          Left = 249
          Top = 6
          Width = 75
          Height = 25
          Caption = 'A&lterar'
          TabOrder = 3
          OnClick = btnEditClick
        end
        object btnDelete: TBitBtn
          Left = 330
          Top = 6
          Width = 75
          Height = 25
          Caption = '&Excluir'
          TabOrder = 4
          OnClick = btnDeleteClick
        end
        object btnSave: TBitBtn
          Left = 411
          Top = 6
          Width = 75
          Height = 25
          Caption = '&Salvar'
          TabOrder = 5
          OnClick = btnSaveClick
        end
        object btnDiscard: TBitBtn
          Left = 492
          Top = 6
          Width = 75
          Height = 25
          Caption = 'C&ancelar'
          TabOrder = 6
          OnClick = btnDiscardClick
        end
      end
      object DESC_CARTA: TEdit
        Left = 68
        Top = 344
        Width = 493
        Height = 21
        Enabled = False
        MaxLength = 250
        TabOrder = 13
        OnKeyDown = REM_ENDERECOKeyDown
      end
      object OBSERVACAO: TMemo
        Left = 68
        Top = 370
        Width = 493
        Height = 143
        Enabled = False
        TabOrder = 14
      end
      object REMETENTE: TCurrencyEdit
        Left = 68
        Top = 58
        Width = 47
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0;-0'
        Enabled = False
        TabOrder = 1
        ZeroEmpty = False
        OnExit = REMETENTEExit
        OnKeyDown = REMETENTEKeyDown
      end
      object DESTINATARIO: TCurrencyEdit
        Left = 68
        Top = 214
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
        OnExit = DESTINATARIOExit
        OnKeyDown = REMETENTEKeyDown
      end
      object REM_ENDERECO: TEdit
        Left = 68
        Top = 84
        Width = 301
        Height = 21
        Enabled = False
        MaxLength = 60
        TabOrder = 2
        OnKeyDown = REM_ENDERECOKeyDown
      end
      object REM_NUMERO: TEdit
        Left = 505
        Top = 84
        Width = 56
        Height = 21
        Enabled = False
        MaxLength = 6
        TabOrder = 3
        OnKeyDown = REM_ENDERECOKeyDown
      end
      object REM_BAIRRO: TEdit
        Left = 68
        Top = 110
        Width = 175
        Height = 21
        Enabled = False
        MaxLength = 40
        TabOrder = 4
        OnKeyDown = REM_ENDERECOKeyDown
      end
      object REM_CEP: TMaskEdit
        Left = 68
        Top = 162
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
        TabOrder = 6
        Text = '     -   '
        OnKeyDown = REM_ENDERECOKeyDown
      end
      object REM_MUNICIPIO: TEdit
        Left = 68
        Top = 136
        Width = 61
        Height = 21
        Enabled = False
        MaxLength = 7
        TabOrder = 5
        OnKeyDown = REM_ENDERECOKeyDown
      end
      object DEST_ENDERECO: TEdit
        Left = 68
        Top = 240
        Width = 301
        Height = 21
        Enabled = False
        MaxLength = 60
        TabOrder = 8
        OnKeyDown = REM_ENDERECOKeyDown
      end
      object DEST_NUMERO: TEdit
        Left = 505
        Top = 240
        Width = 56
        Height = 21
        Enabled = False
        MaxLength = 6
        TabOrder = 9
        OnKeyDown = REM_ENDERECOKeyDown
      end
      object DEST_BAIRRO: TEdit
        Left = 68
        Top = 266
        Width = 175
        Height = 21
        Enabled = False
        MaxLength = 40
        TabOrder = 10
        OnKeyDown = REM_ENDERECOKeyDown
      end
      object DEST_MUNICIPIO: TEdit
        Left = 68
        Top = 292
        Width = 61
        Height = 21
        Enabled = False
        MaxLength = 7
        TabOrder = 11
        OnKeyDown = REM_ENDERECOKeyDown
      end
      object DEST_CEP: TMaskEdit
        Left = 68
        Top = 318
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
        TabOrder = 12
        Text = '     -   '
        OnKeyDown = REM_ENDERECOKeyDown
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 543
    Width = 581
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnRetorna: TBitBtn
      Left = 502
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
      TabOrder = 0
      OnClick = btnRetornaClick
    end
  end
  object DataTabela: TDataSource
    AutoEdit = False
    DataSet = QTabela
    Left = 40
    Top = 536
  end
  object DataCliente: TDataSource
    DataSet = QCliente
    Left = 131
    Top = 544
  end
  object DataFornecedor: TDataSource
    DataSet = QFornecedor
    Left = 192
    Top = 544
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
    Top = 488
    ParamData = <
      item
        Name = 'CLIENTE_ID'
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
    Top = 488
  end
  object QTabela: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM CARTAS')
    Left = 40
    Top = 488
  end
  object QFornecedor: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM FORNECEDORES'
      'WHERE'
      '(FORNECEDOR_ID = :FORNECEDOR_ID)'
      'AND (STATUS = '#39'A'#39')')
    Left = 192
    Top = 488
    ParamData = <
      item
        Name = 'FORNECEDOR_ID'
        ParamType = ptInput
      end>
  end
end
