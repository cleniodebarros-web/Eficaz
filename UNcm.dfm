object FrmNcm: TFrmNcm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'NCM'
  ClientHeight = 364
  ClientWidth = 716
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    716
    364)
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 716
    Height = 323
    ActivePage = Consulta
    Align = alClient
    TabOrder = 0
    ExplicitHeight = 320
    object Consulta: TTabSheet
      Caption = '&Consulta'
      ExplicitHeight = 292
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 708
        Height = 295
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
        OnKeyPress = DBGrid1KeyPress
        OnTitleClick = DBGrid1TitleClick
        Columns = <
          item
            Expanded = False
            FieldName = 'NCM'
            Width = 57
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESC_TIPI'
            Title.Caption = 'Descri'#231#227'o'
            Width = 618
            Visible = True
          end>
      end
    end
    object Manutencao: TTabSheet
      Caption = '&Manuten'#231#227'o'
      ImageIndex = 1
      OnShow = ManutencaoShow
      ExplicitHeight = 292
      object Label3: TLabel
        Left = 6
        Top = 61
        Width = 22
        Height = 13
        Caption = 'NCM'
      end
      object Label4: TLabel
        Left = 6
        Top = 87
        Width = 46
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object Label5: TLabel
        Left = 6
        Top = 113
        Width = 58
        Height = 13
        Caption = 'Observa'#231#227'o'
      end
      object NCM: TEdit
        Left = 70
        Top = 58
        Width = 75
        Height = 21
        Enabled = False
        MaxLength = 8
        TabOrder = 1
        OnKeyDown = NCMKeyDown
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 708
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        ParentBackground = False
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
      object DESC_TIPI: TEdit
        Left = 70
        Top = 84
        Width = 632
        Height = 21
        Enabled = False
        MaxLength = 250
        TabOrder = 2
        OnKeyDown = NCMKeyDown
      end
      object DESCRICAO: TMemo
        Left = 70
        Top = 110
        Width = 632
        Height = 71
        Enabled = False
        TabOrder = 3
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 323
    Width = 716
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 320
    object lbUltAtualizacao: TLabel
      Left = 339
      Top = 25
      Width = 109
      Height = 13
      Caption = 'Ultima Atualiza'#231#227'o:  ---'
    end
    object lbNumRegistros: TLabel
      Left = 339
      Top = 6
      Width = 113
      Height = 13
      Caption = 'Numero de Registros: 0'
    end
    object btnRetorna: TBitBtn
      Left = 631
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
    object BitBtn1: TBitBtn
      Left = 202
      Top = 6
      Width = 120
      Height = 25
      Caption = 'Atualizar Ncm(s)'
      TabOrder = 1
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 91
      Top = 4
      Width = 71
      Height = 25
      Caption = 'Validar Ncm'
      TabOrder = 2
      OnClick = BitBtn2Click
    end
    object Ncm_Validar: TsEdit
      Left = 4
      Top = 6
      Width = 81
      Height = 21
      TabOrder = 3
    end
  end
  object pCarregando: TPanel
    Left = 218
    Top = 137
    Width = 282
    Height = 62
    Anchors = []
    Caption = 'Aguarde Carregando na Tabela'
    TabOrder = 2
    Visible = False
    ExplicitTop = 136
  end
  object DataTabela: TDataSource
    AutoEdit = False
    DataSet = QtABELA
    Left = 120
    Top = 136
  end
  object QtABELA: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      'SELECT * FROM TIPI')
    Left = 184
    Top = 136
  end
  object IQuery: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afDisable
    Left = 232
    Top = 136
  end
  object ACBrNCMs1: TACBrNCMs
    ProxyPort = '8080'
    UrlConsulta = 
      'https://portalunico.siscomex.gov.br/classif/api/publico/nomencla' +
      'tura/download/json'
    CacheArquivo = 'ACBrNCM.json'
    Left = 300
    Top = 144
  end
  object QInsert: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      'SELECT * FROM TIPI')
    Left = 224
    Top = 80
  end
end
