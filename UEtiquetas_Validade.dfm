object FrmEtiquetas_Validade: TFrmEtiquetas_Validade
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Etiquetas Fabrica'#231#227'o/Validade'
  ClientHeight = 339
  ClientWidth = 574
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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label6: TLabel
    Left = 6
    Top = 9
    Width = 54
    Height = 13
    Caption = 'Impressora'
  end
  object Bevel1: TBevel
    Left = 39
    Top = 288
    Width = 523
    Height = 1
    Shape = bsTopLine
  end
  object Label9: TLabel
    Left = 6
    Top = 35
    Width = 49
    Height = 13
    Caption = 'Mod. Etiq.'
  end
  object btnExecuta: TBitBtn
    Left = 373
    Top = 304
    Width = 75
    Height = 25
    Caption = '&OK'
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333377F3333333333000033334224333333333333
      337337F3333333330000333422224333333333333733337F3333333300003342
      222224333333333373333337F3333333000034222A22224333333337F337F333
      7F33333300003222A3A2224333333337F3737F337F33333300003A2A333A2224
      33333337F73337F337F33333000033A33333A222433333337333337F337F3333
      0000333333333A222433333333333337F337F33300003333333333A222433333
      333333337F337F33000033333333333A222433333333333337F337F300003333
      33333333A222433333333333337F337F00003333333333333A22433333333333
      3337F37F000033333333333333A223333333333333337F730000333333333333
      333A333333333333333337330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
    TabOrder = 4
    OnClick = btnExecutaClick
  end
  object btnRetorna: TBitBtn
    Left = 486
    Top = 304
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
    TabOrder = 6
    OnClick = btnRetornaClick
  end
  object Modelo: TComboBox
    Left = 73
    Top = 32
    Width = 129
    Height = 21
    TabOrder = 1
    Items.Strings = (
      '3 Colunas'
      '')
  end
  object Porta: TComboBox
    Left = 213
    Top = 32
    Width = 65
    Height = 21
    TabOrder = 2
    Items.Strings = (
      'LPT1'
      'LPT2'
      'LPT3'
      'LPT4'
      'COM1'
      'COM2'
      'COM3'
      'COM4'
      'COM5'
      'COM6'
      'IP(Eficaz.ini)'
      'C:\Eficaz7\etq.txt')
  end
  object Button1: TButton
    Left = 8
    Top = 59
    Width = 86
    Height = 22
    Caption = 'Incluir itens'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Impressora: TComboBox
    Left = 73
    Top = 5
    Width = 205
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnKeyDown = ImpressoraKeyDown
    Items.Strings = (
      'Argox'
      'Bematech LB-1000'
      'Bematech MP-4200(Bobina)'
      'Datamax (G'#244'ndola)'
      'Datamax (Produto)'
      'Elgin'
      'Matricial'
      'RDPrint Matricial'
      'RDPrint HP'
      'Tanca'
      'TTP-244 Plus'
      'Zebra'
      'Zebra GT800'
      '')
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 87
    Width = 558
    Height = 190
    ActivePage = TabSheet1
    TabOrder = 5
    object TabSheet1: TTabSheet
      Caption = 'Produtos'
      object Panel1: TPanel
        Left = -6
        Top = -2
        Width = 561
        Height = 166
        TabOrder = 0
        object StatusBar3: TStatusBar
          Left = 1
          Top = 146
          Width = 559
          Height = 19
          Panels = <
            item
              Text = '<F4> - Deletar'
              Width = 250
            end
            item
              Text = '<F9> - Gravar'
              Width = 164
            end>
        end
        object Grid_Etiquetas: TDBGrid
          Left = 7
          Top = 3
          Width = 543
          Height = 137
          DataSource = DataContad
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnEnter = Grid_EtiquetasEnter
          OnKeyDown = Grid_EtiquetasKeyDown
          OnKeyPress = Grid_EtiquetasKeyPress
          Columns = <
            item
              Expanded = False
              FieldName = 'Descricao'
              Title.Caption = 'Descri'#231#227'o'
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'fabricacao'
              Title.Alignment = taCenter
              Title.Caption = 'Fabrica'#231#227'o'
              Width = 118
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'Validade'
              Title.Alignment = taCenter
              Width = 117
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'Lote'
              Title.Alignment = taCenter
              Width = 47
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'Quantidade'
              Title.Alignment = taCenter
              Visible = True
            end>
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Detalhes'
      ImageIndex = 1
      object Panel2: TPanel
        Left = -6
        Top = -2
        Width = 561
        Height = 166
        TabOrder = 0
        object StatusBar1: TStatusBar
          Left = 1
          Top = 146
          Width = 559
          Height = 19
          Panels = <
            item
              Text = '<F4> - Deletar'
              Width = 250
            end
            item
              Text = '<F9> - Gravar'
              Width = 164
            end>
        end
        object Grid_Detalhes: TDBGrid
          Left = 7
          Top = 3
          Width = 543
          Height = 137
          DataSource = DataDetalhes
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnEnter = Grid_DetalhesEnter
          OnKeyDown = Grid_DetalhesKeyDown
          OnKeyPress = Grid_DetalhesKeyPress
          Columns = <
            item
              Expanded = False
              FieldName = 'Detalhe1'
              Title.Alignment = taCenter
              Title.Caption = 'Detalhe 1'
              Width = 220
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Detalhe2'
              Title.Alignment = taCenter
              Title.Caption = 'Detalhe 2'
              Width = 220
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Quantidade'
              Visible = True
            end>
        end
      end
    end
  end
  object QEstoque: TFDQuery
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
    Left = 16
    Top = 296
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
  object Table_Etiquetas: TFDMemTable
    AfterOpen = Table_EtiquetasAfterOpen
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 80
    Top = 296
    object Table_EtiquetasDescricao: TStringField
      FieldName = 'Descricao'
      Size = 25
    end
    object Table_Etiquetasfabricacao: TDateTimeField
      FieldName = 'fabricacao'
    end
    object Table_EtiquetasValidade: TDateTimeField
      FieldName = 'Validade'
    end
    object Table_EtiquetasLote: TStringField
      FieldName = 'Lote'
      Size = 5
    end
    object Table_EtiquetasQuantidade: TIntegerField
      FieldName = 'Quantidade'
    end
  end
  object DataContad: TDataSource
    DataSet = Table_Etiquetas
    Left = 146
    Top = 296
  end
  object DataDetalhes: TDataSource
    DataSet = Table_Detalhes
    Left = 274
    Top = 296
  end
  object Table_Detalhes: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 208
    Top = 296
    object Table_DetalhesDetalhe1: TStringField
      FieldName = 'Detalhe1'
      Size = 25
    end
    object Table_DetalhesDetalhe2: TStringField
      FieldName = 'Detalhe2'
      Size = 25
    end
    object Table_DetalhesQuantidade: TIntegerField
      FieldName = 'Quantidade'
    end
  end
end
