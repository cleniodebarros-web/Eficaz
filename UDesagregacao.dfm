object FrmDesagregacao: TFrmDesagregacao
  Left = 360
  Top = 169
  BorderStyle = bsSingle
  Caption = 'Desagrega'#231#227'o de Produtos'
  ClientHeight = 410
  ClientWidth = 648
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 8
    Top = 173
    Width = 90
    Height = 13
    Caption = 'Quantidade(KG)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnExecuta: TBitBtn
    Left = 473
    Top = 377
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
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 3
    OnClick = btnExecutaClick
  end
  object btnRetorna: TBitBtn
    Left = 554
    Top = 377
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
    TabOrder = 4
    OnClick = btnRetornaClick
  end
  object DBGrid1: TDBGrid
    Left = 9
    Top = 198
    Width = 625
    Height = 145
    DataSource = DataDesagregacao
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'codigo'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descricao'
        Title.Alignment = taCenter
        Title.Caption = 'Descri'#231#227'o'
        Width = 232
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Categoria'
        Title.Alignment = taCenter
        Width = 116
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quantidade'
        Title.Alignment = taCenter
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quantidade_perda'
        Title.Alignment = taCenter
        Title.Caption = 'Qtd.  Perda'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quantidade_Total'
        Title.Alignment = taCenter
        Title.Caption = 'Qtd. Total'
        Width = 65
        Visible = True
      end>
  end
  object btnIncluir: TBitBtn
    Left = 525
    Top = 167
    Width = 75
    Height = 25
    Caption = '&Incluir'
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
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 2
    OnClick = btnIncluirClick
  end
  object Quantidade: TRxCalcEdit
    Left = 105
    Top = 169
    Width = 107
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    DisplayFormat = '0.00;-R$ ,0.00'
    MaxValue = 9999999.000000000000000000
    NumGlyphs = 2
    TabOrder = 1
    ZeroEmpty = False
    OnKeyDown = Produto_IDKeyDown
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 8
    Width = 625
    Height = 153
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Produto'
      object Label3: TLabel
        Left = 6
        Top = 20
        Width = 45
        Height = 13
        Caption = 'Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 6
        Top = 47
        Width = 55
        Height = 13
        Caption = 'Descri'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 6
        Top = 74
        Width = 55
        Height = 13
        Caption = 'Categoria'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnProduto: TSpeedButton
        Left = 160
        Top = 17
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
        OnClick = btnProdutoClick
      end
      object DBEdit4: TDBEdit
        Left = 89
        Top = 71
        Width = 382
        Height = 21
        Color = clInfoBk
        DataField = 'CATEGORIA'
        DataSource = DataProdutos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnKeyDown = Produto_IDKeyDown
      end
      object DBEdit2: TDBEdit
        Left = 89
        Top = 44
        Width = 382
        Height = 21
        Color = clInfoBk
        DataField = 'DESCRICAO'
        DataSource = DataProdutos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnKeyDown = Produto_IDKeyDown
      end
      object Produto_ID: TCurrencyEdit
        Left = 89
        Top = 17
        Width = 47
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0;-0'
        TabOrder = 0
        ZeroEmpty = False
        OnExit = Produto_IDExit
        OnKeyDown = Produto_IDKeyDown
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Perda'
      ImageIndex = 1
      object Label5: TLabel
        Left = 3
        Top = 16
        Width = 81
        Height = 13
        Caption = 'Produto Perda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 2
        Top = 43
        Width = 91
        Height = 13
        Caption = 'Descri'#231#227'o Perda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnperda: TSpeedButton
        Left = 177
        Top = 13
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
        OnClick = btnperdaClick
      end
      object Perda_id: TCurrencyEdit
        Left = 112
        Top = 13
        Width = 47
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0;-0'
        TabOrder = 0
        ZeroEmpty = False
        OnExit = Perda_idExit
        OnKeyDown = Produto_IDKeyDown
      end
      object DBEdit1: TDBEdit
        Left = 112
        Top = 40
        Width = 382
        Height = 21
        Color = clInfoBk
        DataField = 'DESCRICAO'
        DataSource = DataPerda
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnKeyDown = Produto_IDKeyDown
      end
    end
  end
  object StatusBar6: TStatusBar
    Left = 8
    Top = 342
    Width = 626
    Height = 19
    Align = alNone
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
  object QProdutos: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      
        'SELECT ALIQUOTA_ICMS,TRIBUTO_ID,PRODUTO_ID,PRODUTOS.DESCRICAO,TA' +
        'BELAS.DESCRICAO CATEGORIA'
      'FROM PRODUTOS'
      'INNER JOIN TABELAS ON PRODUTOS.CATEGORIA_ID = TABELAS.TABELA_ID'
      'WHERE TIPO_TABELA = '#39'O'#39' AND PRODUTOS.STATUS = '#39'A'#39
      'AND PRODUTO_ID = :PRODUTO_ID')
    Left = 696
    Top = 80
    ParamData = <
      item
        Name = 'PRODUTO_ID'
        ParamType = ptInput
        Value = Null
      end>
  end
  object DataProdutos: TDataSource
    AutoEdit = False
    DataSet = QProdutos
    Left = 744
    Top = 77
  end
  object DataDesagregacao: TDataSource
    DataSet = FdDesagregacao
    Left = 986
    Top = 40
  end
  object FdDesagregacao: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 928
    Top = 24
    object FdDesagregacaocodigo: TIntegerField
      FieldName = 'codigo'
    end
    object FdDesagregacaoDescricao: TStringField
      FieldName = 'Descricao'
      Size = 150
    end
    object FdDesagregacaoCategoria: TStringField
      FieldName = 'Categoria'
      Size = 150
    end
    object FdDesagregacaoQuantidade_perda: TFloatField
      FieldName = 'Quantidade_perda'
    end
    object FdDesagregacaoQuantidade_Total: TFloatField
      FieldName = 'Quantidade_Total'
    end
    object FdDesagregacaoQuantidade: TFloatField
      FieldName = 'Quantidade'
    end
  end
  object FdQuery: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    Left = 712
    Top = 16
  end
  object IQuery: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    Left = 656
    Top = 16
  end
  object QRel: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    Left = 1112
    Top = 24
  end
  object QTributo: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    Left = 1064
    Top = 32
  end
  object QUPDATE: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    Left = 1024
    Top = 24
  end
  object QPerda: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      
        'SELECT ALIQUOTA_ICMS,TRIBUTO_ID,PRODUTO_ID,PRODUTOS.DESCRICAO,TA' +
        'BELAS.DESCRICAO CATEGORIA'
      'FROM PRODUTOS'
      'INNER JOIN TABELAS ON PRODUTOS.CATEGORIA_ID = TABELAS.TABELA_ID'
      'WHERE TIPO_TABELA = '#39'O'#39' AND PRODUTOS.STATUS = '#39'A'#39
      'AND PRODUTO_ID = :PRODUTO_ID')
    Left = 688
    Top = 152
    ParamData = <
      item
        Name = 'PRODUTO_ID'
        ParamType = ptInput
        Value = Null
      end>
  end
  object DataPerda: TDataSource
    AutoEdit = False
    DataSet = QPerda
    Left = 752
    Top = 157
  end
  object QSearch: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    Left = 768
    Top = 16
  end
end
