object FrmEstados: TFrmEstados
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Estados'
  ClientHeight = 363
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
    Height = 322
    ActivePage = Consulta
    Align = alClient
    TabOrder = 0
    object Consulta: TTabSheet
      Caption = '&Consulta'
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 573
        Height = 294
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
            FieldName = 'UF'
            Width = 35
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ESTADO'
            Title.Caption = 'Estado'
            Width = 400
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ICMS'
            Title.Alignment = taRightJustify
            Width = 104
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
        Width = 22
        Height = 13
        Caption = 'Sigla'
      end
      object Label4: TLabel
        Left = 6
        Top = 87
        Width = 33
        Height = 13
        Caption = 'Estado'
      end
      object Label5: TLabel
        Left = 6
        Top = 113
        Width = 135
        Height = 13
        Caption = 'Al'#237'quota ICMS Interestadual'
      end
      object Label2: TLabel
        Left = 6
        Top = 168
        Width = 78
        Height = 13
        Caption = 'Aliquota Partilha'
      end
      object Label6: TLabel
        Left = 6
        Top = 193
        Width = 169
        Height = 13
        Caption = 'Al'#237'quota Fundo Combate a Pobreza'
      end
      object Label1: TLabel
        Left = 6
        Top = 141
        Width = 106
        Height = 13
        Caption = 'Al'#237'quota ICMS Interna'
      end
      object ESTADO: TEdit
        Left = 147
        Top = 84
        Width = 221
        Height = 21
        Enabled = False
        MaxLength = 30
        TabOrder = 2
        OnKeyDown = ESTADOKeyDown
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
      object ICMS: TCurrencyEdit
        Left = 147
        Top = 110
        Width = 77
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        DisplayFormat = '0.00;-0.00'
        Enabled = False
        TabOrder = 3
        ZeroEmpty = False
        OnKeyDown = UFKeyDown
      end
      object UF: TComboBox
        Left = 147
        Top = 58
        Width = 56
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
        TabOrder = 1
        OnKeyDown = UFKeyDown
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
      object ALIQ_FCP: TCurrencyEdit
        Left = 181
        Top = 190
        Width = 77
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        DisplayFormat = '0.00;-0.00'
        Enabled = False
        TabOrder = 6
        ZeroEmpty = False
        OnKeyDown = UFKeyDown
      end
      object ICMS_PARTILHA: TCurrencyEdit
        Left = 147
        Top = 165
        Width = 77
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        DisplayFormat = '0.00;-0.00'
        Enabled = False
        TabOrder = 5
        ZeroEmpty = False
        OnKeyDown = UFKeyDown
      end
      object ICMS_INTERNO: TCurrencyEdit
        Left = 147
        Top = 138
        Width = 77
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        DisplayFormat = '0.00;-0.00'
        Enabled = False
        TabOrder = 4
        ZeroEmpty = False
        OnKeyDown = UFKeyDown
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 322
    Width = 581
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnRetorna: TBitBtn
      Left = 500
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
    Left = 72
    Top = 328
  end
  object IQuery: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 152
    Top = 328
  end
  object QTabela: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      'SELECT * FROM ESTADOS')
    Left = 112
    Top = 328
  end
end
