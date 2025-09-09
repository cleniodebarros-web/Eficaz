object FrmTransf_Loc_Estoque: TFrmTransf_Loc_Estoque
  Left = 0
  Top = 0
  Caption = 'Transfer'#234'ncia de localiza'#231#227'o do estoque'
  ClientHeight = 172
  ClientWidth = 695
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 695
    Height = 172
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label92: TLabel
      Left = 8
      Top = 33
      Width = 27
      Height = 13
      Caption = 'Data'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 163
      Top = 65
      Width = 98
      Height = 13
      Caption = 'QTd. Loc. Estoque'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 429
      Top = 33
      Width = 75
      Height = 13
      Caption = 'Loca. Destino'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 163
      Top = 33
      Width = 66
      Height = 13
      Caption = 'Loca. Oriem'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 429
      Top = 65
      Width = 101
      Height = 13
      Caption = 'QTd. Loc. Estoque '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 429
      Top = 105
      Width = 132
      Height = 13
      Caption = 'Quantidade a transferir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label_Produto: TLabel
      Left = 8
      Top = 5
      Width = 57
      Height = 16
      Caption = 'Produto:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Qtd_loc_ori: TRxCalcEdit
      Left = 302
      Top = 62
      Width = 92
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      DisplayFormat = '0.00;-0.00'
      Enabled = False
      MaxValue = 99999.990000000000000000
      NumGlyphs = 2
      ReadOnly = True
      TabOrder = 1
      ZeroEmpty = False
    end
    object btnRetorna: TBitBtn
      Left = 603
      Top = 137
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
      ModalResult = 1
      NumGlyphs = 2
      TabOrder = 5
    end
    object BtnGrava: TBitBtn
      Left = 518
      Top = 137
      Width = 75
      Height = 25
      Caption = '&Gravar'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
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
      ParentFont = False
      TabOrder = 4
      OnClick = BtnGravaClick
    end
    object DT_TRANSF: TDateEdit
      Left = 52
      Top = 30
      Width = 83
      Height = 21
      CheckOnExit = True
      DialogTitle = 'Selecione a Data'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      NumGlyphs = 2
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object Qtd_Loc_dest: TRxCalcEdit
      Left = 586
      Top = 62
      Width = 92
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      DisplayFormat = '0.00;-0.00'
      Enabled = False
      MaxValue = 99999.990000000000000000
      NumGlyphs = 2
      ReadOnly = True
      TabOrder = 2
      ZeroEmpty = False
    end
    object Qtd_Estoque_atual: TRxCalcEdit
      Left = 586
      Top = 102
      Width = 92
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      DisplayFormat = '0.00;-0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxValue = 99999.990000000000000000
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 3
      ZeroEmpty = False
      OnChange = Qtd_Estoque_atualChange
    end
  end
  object localizacao_id_ori: TDBLookupComboBox
    Left = 265
    Top = 30
    Width = 129
    Height = 21
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    KeyField = 'tabela_id'
    ListField = 'descricao'
    ListSource = DataLocEstoque
    ParentFont = False
    TabOrder = 1
    OnCloseUp = localizacao_id_oriCloseUp
  end
  object localizacao_id_dest: TDBLookupComboBox
    Left = 549
    Top = 30
    Width = 129
    Height = 21
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    KeyField = 'tabela_id'
    ListField = 'descricao'
    ListSource = DataLocEstoqdest
    ParentFont = False
    TabOrder = 2
    OnCloseUp = localizacao_id_destCloseUp
  end
  object Qlocalizacao_Estoque: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      
        'SELECT SUM(QUANTIDADE) QUANTIDADE FROM LOCALIZACAO_ESTOQUE_PRODU' +
        'TOS'
      'WHERE'
      '(PRODUTO_ID = :PRODUTO_ID) AND (DESCRICAO =:DESCRICAO)')
    Left = 152
    Top = 125
    ParamData = <
      item
        Name = 'PRODUTO_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object QRel: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      '')
    Left = 24
    Top = 121
  end
  object QUpdate: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      '')
    Left = 72
    Top = 121
  end
  object QLoc_Estoque: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM TABELAS WHERE TIPO_TABELA = '#39'L'#39
      'ORDER BY DESCRICAO')
    Left = 24
    Top = 72
  end
  object DataLocEstoque: TDataSource
    DataSet = QLoc_Estoque
    Left = 139
    Top = 72
  end
  object DataLocEstoqdest: TDataSource
    DataSet = QLoc_Estoque_dest
    Left = 99
    Top = 72
  end
  object QLoc_Estoque_dest: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM TABELAS WHERE TIPO_TABELA = '#39'L'#39
      'ORDER BY DESCRICAO')
    Left = 64
    Top = 72
  end
end
