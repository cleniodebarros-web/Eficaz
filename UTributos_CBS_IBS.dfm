object FrmTributos_CBS_IBS: TFrmTributos_CBS_IBS
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 
    'ReformaTributaria (em conformidade com a NT 2025/002 vers'#227'o 1.30' +
    ')'
  ClientHeight = 292
  ClientWidth = 727
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
    Width = 727
    Height = 251
    ActivePage = Consulta
    Align = alClient
    TabOrder = 0
    object Consulta: TTabSheet
      Caption = '&Consulta'
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 719
        Height = 223
        Align = alClient
        Color = clInfoBk
        DataSource = DataTabela
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
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
            FieldName = 'tributo_cbs_ibs_id'
            Title.Alignment = taRightJustify
            Title.Caption = 'C'#243'd Cbs/Ibs'
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descricao'
            Title.Caption = 'Descricao'
            Width = 461
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'aliquota_cbs'
            Title.Alignment = taRightJustify
            Title.Caption = 'Al'#237'quota Cbs'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'classtrib'
            Title.Caption = 'Class. Tributa'#231#227'o'
            Width = 124
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
        Top = 89
        Width = 46
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object Label8: TLabel
        Left = 6
        Top = 192
        Width = 77
        Height = 13
        Caption = 'P. Redu'#231#227'o CBS'
      end
      object Label9: TLabel
        Left = 491
        Top = 56
        Width = 56
        Height = 13
        Caption = 'Cst Cbs/Ibs'
      end
      object btnTributo_cbs_ibs: TSpeedButton
        Left = 188
        Top = 55
        Width = 64
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
        OnClick = btnTributo_cbs_ibsClick
      end
      object Label1: TLabel
        Left = 6
        Top = 56
        Width = 82
        Height = 13
        Caption = 'C'#243'd. Classe Trib.'
      end
      object Label2: TLabel
        Left = 187
        Top = 192
        Width = 74
        Height = 13
        Caption = 'P. Redu'#231#227'o IBS'
      end
      object Label6: TLabel
        Left = 258
        Top = 56
        Width = 80
        Height = 13
        Caption = 'Classe Tribut'#225'ria'
      end
      object Label7: TLabel
        Left = 6
        Top = 165
        Width = 61
        Height = 13
        Caption = 'Al'#237'quota CBS'
      end
      object Label10: TLabel
        Left = 184
        Top = 165
        Width = 77
        Height = 13
        Caption = 'Al'#237'quota Ibs UF.'
      end
      object Label11: TLabel
        Left = 370
        Top = 165
        Width = 91
        Height = 13
        Caption = 'Al'#237'quota Ibs Munic.'
      end
      object DESCRICAO: TEdit
        Left = 102
        Top = 86
        Width = 528
        Height = 21
        Enabled = False
        MaxLength = 500
        TabOrder = 3
        OnKeyDown = DESCRICAOKeyDown
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 719
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
      object aliquota_cbs: TCurrencyEdit
        Left = 102
        Top = 162
        Width = 69
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        DisplayFormat = '0.00;-0.00'
        Enabled = False
        TabOrder = 4
        ZeroEmpty = False
        OnKeyDown = ALIQUOTA_ICMSKeyDown
      end
      object PREDCBS: TCurrencyEdit
        Left = 102
        Top = 189
        Width = 69
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        DisplayFormat = '0.00;-0.00'
        Enabled = False
        TabOrder = 5
        ZeroEmpty = False
        OnKeyDown = ALIQUOTA_ICMSKeyDown
      end
      object cod_classtrib_id: TCurrencyEdit
        Left = 102
        Top = 55
        Width = 63
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DecimalPlaces = 0
        DisplayFormat = '0;-0'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        ZeroEmpty = False
        OnExit = cod_classtrib_idExit
        OnKeyDown = ALIQUOTA_ICMSKeyDown
      end
      object PREDIBS: TCurrencyEdit
        Left = 274
        Top = 189
        Width = 69
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        DisplayFormat = '0.00;-0.00'
        Enabled = False
        TabOrder = 6
        ZeroEmpty = False
        OnKeyDown = ALIQUOTA_ICMSKeyDown
      end
      object Classtrib: TEdit
        Left = 350
        Top = 55
        Width = 59
        Height = 21
        Enabled = False
        MaxLength = 5
        TabOrder = 2
        OnKeyDown = DESCRICAOKeyDown
      end
      object cst_ibs_cbs: TCurrencyEdit
        Left = 587
        Top = 55
        Width = 43
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DecimalPlaces = 0
        DisplayFormat = '0;-0'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        ZeroEmpty = False
        OnExit = cod_classtrib_idExit
        OnKeyDown = ALIQUOTA_ICMSKeyDown
      end
      object aliquota_ibs_uf: TCurrencyEdit
        Left = 274
        Top = 162
        Width = 69
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        DisplayFormat = '0.00;-0.00'
        Enabled = False
        TabOrder = 8
        ZeroEmpty = False
        OnKeyDown = ALIQUOTA_ICMSKeyDown
      end
      object aliquota_ibs_munic: TCurrencyEdit
        Left = 468
        Top = 162
        Width = 69
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        DisplayFormat = '0.00;-0.00'
        Enabled = False
        TabOrder = 9
        ZeroEmpty = False
        OnKeyDown = ALIQUOTA_ICMSKeyDown
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 251
    Width = 727
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
    Left = 80
    Top = 248
  end
  object QTributos_cbs_ibs: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM COD_CLASSTRIB'
      'where COD_CLASSTRIB_ID = :COD_CLASSTRIB_ID  '
      '')
    Left = 184
    Top = 248
    ParamData = <
      item
        Name = 'COD_CLASSTRIB_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object IQuery: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 120
    Top = 240
  end
  object QTabela: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM TRIBUTOS_CBS_IBS')
    Left = 32
    Top = 240
  end
end
