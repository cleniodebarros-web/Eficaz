object FrmSintegra: TFrmSintegra
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Sintegra'
  ClientHeight = 262
  ClientWidth = 421
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 6
    Top = 209
    Width = 409
    Height = 4
    Shape = bsTopLine
  end
  object Label3: TLabel
    Left = 6
    Top = 35
    Width = 93
    Height = 13
    Caption = 'Ident. do Conv'#234'nio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 6
    Top = 87
    Width = 103
    Height = 13
    Caption = 'Finalidade do Arquivo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 6
    Top = 61
    Width = 99
    Height = 13
    Caption = 'Natureza Opera'#231#245'es'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 6
    Top = 9
    Width = 36
    Height = 13
    Caption = 'Per'#237'odo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label10: TLabel
    Left = 6
    Top = 113
    Width = 95
    Height = 13
    Caption = 'Vers'#227'o do validador'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 6
    Top = 219
    Width = 78
    Height = 13
    Caption = 'Processando: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Label6: TLabel
    Left = 6
    Top = 165
    Width = 91
    Height = 13
    Caption = 'Data do Invent'#225'rio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object Label8: TLabel
    Left = 164
    Top = 165
    Width = 27
    Height = 13
    Caption = 'Pre'#231'o'
    Visible = False
  end
  object Label7: TLabel
    Left = 6
    Top = 140
    Width = 80
    Height = 13
    Caption = 'Gerar Invent'#225'rio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Convenio: TComboBox
    Left = 117
    Top = 32
    Width = 245
    Height = 21
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 2
    ParentFont = False
    TabOrder = 2
    Text = '3 - Conv'#234'nio 57/95 Alt. 76/03'
    OnKeyDown = ConvenioKeyDown
    Items.Strings = (
      '1 - Conv'#234'nio 57/95 Vers'#227'o 31/99 Alt. 30/02'
      '2 - Conv'#234'nio 57/95 Vers'#227'o 69/02 Alt. 142/02  '
      '3 - Conv'#234'nio 57/95 Alt. 76/03')
  end
  object Finalidade_Arquivo: TComboBox
    Left = 117
    Top = 84
    Width = 245
    Height = 21
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 0
    ParentFont = False
    TabOrder = 4
    Text = '1 - Normal'
    OnKeyDown = ConvenioKeyDown
    Items.Strings = (
      '1 - Normal'
      '2 - Retifica'#231#227'o Total de Arquivo'
      '5 - Desfazimento de Arquivo')
  end
  object Natureza_Operacoes: TComboBox
    Left = 117
    Top = 58
    Width = 282
    Height = 21
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 2
    ParentFont = False
    TabOrder = 3
    Text = '3 - Totalidade das opera'#231#245'es do informante'
    OnKeyDown = ConvenioKeyDown
    Items.Strings = (
      
        '1 - Interestaduais - Somente opera'#231#245'es sujeitas ao regime de Sub' +
        'stitui'#231#227'o Tribut'#225'ria'
      
        '2 - Interestaduais - Opera'#231#245'es com ou sem Substitui'#231#227'o Tribut'#225'ri' +
        'a'
      '3 - Totalidade das opera'#231#245'es do informante')
  end
  object Dtmen: TDateEdit
    Left = 117
    Top = 6
    Width = 90
    Height = 21
    CheckOnExit = True
    DialogTitle = 'Selecione a Data'
    NumGlyphs = 2
    TabOrder = 0
    OnEnter = DtmenEnter
    OnKeyDown = DtmenKeyDown
  end
  object Dtmai: TDateEdit
    Left = 221
    Top = 6
    Width = 90
    Height = 21
    CheckOnExit = True
    DialogTitle = 'Selecione a Data'
    NumGlyphs = 2
    TabOrder = 1
    OnEnter = DtmenEnter
    OnKeyDown = DtmenKeyDown
  end
  object Versao: TComboBox
    Left = 117
    Top = 110
    Width = 77
    Height = 21
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 1
    ParentFont = False
    TabOrder = 5
    Text = '5.2.4'
    OnKeyDown = ConvenioKeyDown
    Items.Strings = (
      '5.2.3'
      '5.2.4')
  end
  object btnExecuta: TBitBtn
    Left = 259
    Top = 214
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
    TabOrder = 6
    OnClick = btnExecutaClick
  end
  object btnRetorna: TBitBtn
    Left = 340
    Top = 214
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
    TabOrder = 7
    OnClick = btnRetornaClick
  end
  object Data: TComboBox
    Left = 6
    Top = 182
    Width = 145
    Height = 21
    Style = csDropDownList
    TabOrder = 8
    Visible = False
  end
  object Preco: TComboBox
    Left = 164
    Top = 182
    Width = 145
    Height = 21
    Style = csDropDownList
    TabOrder = 9
    Visible = False
    Items.Strings = (
      'Valor Compra'
      'Custo Compra'
      'Custom'#233'dio'
      'Pr. Varejo')
  end
  object Inventario: TComboBox
    Left = 117
    Top = 137
    Width = 77
    Height = 21
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 0
    ParentFont = False
    TabOrder = 10
    Text = 'N'#195'O'
    OnChange = InventarioChange
    OnKeyDown = ConvenioKeyDown
    Items.Strings = (
      'N'#195'O'
      'SIM')
  end
  object ACBrSintegra: TACBrSintegra
    VersaoValidador = vv523
    Informa88SME = False
    Informa88SMS = False
    Informa88EAN = False
    Informa88C = False
    InformaSapiMG = False
    Left = 216
    Top = 108
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'txt'
    Filter = 'Arquivos Texto|*.txt'
    Options = [ofHideReadOnly]
    Title = 'Salvar Arquivo'
    Left = 248
    Top = 108
  end
  object QDespesa: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evItems, evRowsetSize, evCache, evCursorKind, evAutoFetchAll]
    FetchOptions.CursorKind = ckDefault
    FetchOptions.RowsetSize = 1000
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      '')
    Left = 152
    Top = 216
  end
  object IQuery: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evItems, evRowsetSize, evCache, evCursorKind, evAutoFetchAll]
    FetchOptions.CursorKind = ckDefault
    FetchOptions.RowsetSize = 1000
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      '')
    Left = 128
    Top = 216
  end
  object QItens: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evItems, evRowsetSize, evCache, evCursorKind, evAutoFetchAll]
    FetchOptions.CursorKind = ckDefault
    FetchOptions.RowsetSize = 1000
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      ''
      'SELECT * FROM PRODUTOS'
      'WHERE'
      '(PRODUTO_ID = :PRODUTO_ID)'
      'AND (EMPRESA_ID = :EMPRESA_ID)'
      'AND (STATUS = '#39'A'#39')')
    Left = 96
    Top = 208
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
  object QParceiro: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evItems, evRowsetSize, evCache, evCursorKind, evAutoFetchAll]
    FetchOptions.CursorKind = ckDefault
    FetchOptions.RowsetSize = 1000
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      '')
    Left = 64
    Top = 212
  end
  object QRel: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evItems, evRowsetSize, evCache, evCursorKind, evAutoFetchAll]
    FetchOptions.CursorKind = ckDefault
    FetchOptions.RowsetSize = 1000
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      '')
    Left = 32
    Top = 212
  end
  object QProduto: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evItems, evRowsetSize, evCache, evCursorKind, evAutoFetchAll]
    FetchOptions.CursorKind = ckDefault
    FetchOptions.RowsetSize = 1000
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      ''
      'SELECT * FROM PRODUTOS'
      'WHERE'
      '(PRODUTO_ID = :PRODUTO_ID)'
      'AND (EMPRESA_ID = :EMPRESA_ID)'
      'AND (STATUS = '#39'A'#39')')
    Top = 212
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
end
