object FrmConf_Pesquisa: TFrmConf_Pesquisa
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Configura'#231#227'o de Pesquisa e Exibi'#231#227'o'
  ClientHeight = 363
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
    Height = 322
    ActivePage = Visualizacao
    Align = alClient
    TabOrder = 0
    object Visualizacao: TTabSheet
      Caption = '&Consulta'
      OnShow = VisualizacaoShow
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 708
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
            FieldName = 'DESCRICAO'
            Title.Caption = 'Texto a Exibir'
            Width = 182
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CAMPO'
            Title.Caption = 'Nome do Campo'
            Width = 138
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO_CAMPO'
            Title.Caption = 'Tipo do Campo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ORDEM'
            Title.Caption = 'Ordem de Sele'#231#227'o'
            Width = 138
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FORMULARIO'
            Title.Caption = 'Nome do Formul'#225'rio'
            Width = 138
            Visible = True
          end>
      end
    end
    object Manutencao: TTabSheet
      Caption = '&Manuten'#231#227'o'
      ImageIndex = 1
      OnShow = ManutencaoShow
      object Label2: TLabel
        Left = 6
        Top = 61
        Width = 73
        Height = 13
        Caption = 'Form. Pesquisa'
      end
      object Label3: TLabel
        Left = 6
        Top = 87
        Width = 78
        Height = 13
        Caption = 'Nome do Campo'
      end
      object Label4: TLabel
        Left = 6
        Top = 113
        Width = 66
        Height = 13
        Caption = 'Texto a Exibir'
      end
      object Label5: TLabel
        Left = 6
        Top = 139
        Width = 87
        Height = 13
        Caption = 'Ordem de Sele'#231#227'o'
      end
      object Label6: TLabel
        Left = 6
        Top = 165
        Width = 73
        Height = 13
        Caption = 'Form. Consulta'
      end
      object Label9: TLabel
        Left = 6
        Top = 191
        Width = 71
        Height = 13
        Caption = 'Tipo do Campo'
      end
      object CAMPO: TEdit
        Left = 109
        Top = 83
        Width = 244
        Height = 21
        CharCase = ecUpperCase
        Enabled = False
        MaxLength = 25
        TabOrder = 2
        OnChange = CAMPOChange
        OnKeyDown = CAMPOKeyDown
      end
      object DESCRICAO: TEdit
        Left = 109
        Top = 110
        Width = 268
        Height = 21
        Enabled = False
        MaxLength = 30
        TabOrder = 3
        OnKeyDown = CAMPOKeyDown
      end
      object ORDEM: TEdit
        Left = 109
        Top = 136
        Width = 301
        Height = 21
        CharCase = ecUpperCase
        Enabled = False
        MaxLength = 40
        TabOrder = 4
        OnKeyDown = CAMPOKeyDown
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
      object FORMULARIO: TComboBox
        Left = 109
        Top = 56
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
        MaxLength = 30
        ParentFont = False
        Sorted = True
        TabOrder = 1
        OnKeyDown = FORMULARIOKeyDown
        Items.Strings = (
          'BANCOS'
          'CHEQUES RECEBIDOS'
          'CLIENTES'
          'CONTAS'
          'ENTREGA FUTURA'
          'FORNECEDORES'
          'FUNCIONARIOS'
          'LANC CONTABEIS'
          'ORCAMENTO'
          'ORDEM'
          'PEDIDOS'
          'PRODUTOS'
          'TABELAS'
          'TRANS BANCOS'
          'TRANS COMPRA'
          'TRANS CONSUMO'
          'TRANS CREDITO'
          'TRANS DEBITO'
          'TRANS DEV. COMPRA'
          'TRANS DEV. VENDA'
          'TRANS PAGAMENTO'
          'TRANS PRODU'#199#195'O'
          'TRANS RECEBIMENTO'
          'TRANS VENDA'
          'TRANSFER'#202'NCIA ESTOQUE')
      end
      object TIPO_CAMPO: TComboBox
        Left = 109
        Top = 188
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
        MaxLength = 10
        ParentFont = False
        TabOrder = 6
        OnKeyDown = FORMULARIOKeyDown
        Items.Strings = (
          ''
          'DATA')
      end
      object CONSULTA: TComboBox
        Left = 109
        Top = 162
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
        Sorted = True
        TabOrder = 5
        OnKeyDown = FORMULARIOKeyDown
        Items.Strings = (
          ''
          'BANCOS'
          'CARGOS'
          'CCUSTO'
          'CLIENTES'
          'CONTAS'
          'CONTASSIN'
          'EMPRESAS'
          'ESTOQUE'
          'FORMAS'
          'FORNECEDORES'
          'GRUPOS'
          'LOCAIS'
          'OR'#199'AMENTO'
          'PEDIDO'
          'PESSOAL'
          'PLANO'
          'SUBTIPOS'
          'TRIBUTOS')
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 322
    Width = 716
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
    Left = 112
    Top = 224
  end
  object IQuery: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 152
    Top = 224
  end
  object QTabela: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM PESQUISA')
    Left = 72
    Top = 224
  end
end
