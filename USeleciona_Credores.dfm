object FrmSeleciona_Credores: TFrmSeleciona_Credores
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Credores'
  ClientHeight = 310
  ClientWidth = 748
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 269
    Width = 748
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object btnRetorna: TBitBtn
      Left = 667
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
      ModalResult = 2
      NumGlyphs = 2
      TabOrder = 1
    end
    object btnPesquisa: TBitBtn
      Left = 587
      Top = 8
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
  object Contas: TDBGrid
    Left = 8
    Top = 2
    Width = 736
    Height = 269
    DataSource = DataTabela
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = ContasDblClick
    OnKeyDown = ContasKeyDown
    OnKeyPress = ContasKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'PARCELA_ID'
        Title.Caption = 'Parcela'
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Nome do Cliente'
        Width = 216
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CNPJ'
        Title.Caption = 'CPF/CNPJ'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESPECIE'
        Title.Caption = 'Tp. Documento'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DUPLICATA'
        Title.Caption = 'N'#186' Documento'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_VENCIMENTO'
        Title.Caption = 'Vencimento'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Title.Alignment = taRightJustify
        Title.Caption = 'Valor'
        Width = 82
        Visible = True
      end>
  end
  object DataTabela: TDataSource
    AutoEdit = False
    DataSet = QTabela
    Left = 64
    Top = 272
  end
  object QTabela: TFDQuery
    AfterOpen = QTabelaAfterOpen
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 24
    Top = 272
  end
end
