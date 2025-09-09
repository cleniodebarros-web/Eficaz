object FrmConhecimentos_Emitidos: TFrmConhecimentos_Emitidos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Conhecimnteos de Transporte emitidos'
  ClientHeight = 443
  ClientWidth = 794
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
  object Notas: TDBGrid
    Left = 0
    Top = 41
    Width = 794
    Height = 342
    Align = alClient
    DataSource = DataNotas
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit]
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = NotasDblClick
    OnKeyDown = NotasKeyDown
    OnKeyPress = NotasKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'TRANSACAO_ID'
        Title.Alignment = taRightJustify
        Title.Caption = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NO_DOC_FISCAL'
        Title.Alignment = taRightJustify
        Title.Caption = 'N'#186' Doc.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_SAIDA'
        Title.Caption = 'Dt. Sa'#237'da'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HR_SAIDA'
        Title.Caption = 'Hr. Sa'#237'da'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CHAVE_NFE'
        Title.Caption = 'Chave NFe'
        Width = 272
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROTOCOLO'
        Title.Caption = 'Protocolo'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RECIBO'
        Title.Caption = 'Recibo'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SINTEGRA'
        Title.Caption = 'Status'
        Width = 40
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 402
    Width = 794
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object btnRetorna: TBitBtn
      Left = 715
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
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 794
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 6
      Top = 14
      Width = 36
      Height = 13
      Caption = 'Per'#237'odo'
    end
    object btnSelecionar: TSpeedButton
      Left = 243
      Top = 10
      Width = 64
      Height = 21
      Cursor = crHandPoint
      Caption = 'Sel.'
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
      OnClick = btnSelecionarClick
    end
    object Dtmen: TDateEdit
      Left = 53
      Top = 10
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
      Left = 149
      Top = 10
      Width = 90
      Height = 21
      CheckOnExit = True
      DialogTitle = 'Selecione a Data'
      NumGlyphs = 2
      TabOrder = 1
      OnEnter = DtmenEnter
      OnKeyDown = DtmenKeyDown
      OnKeyPress = DtmaiKeyPress
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 383
    Width = 794
    Height = 19
    Panels = <
      item
        Text = '<F3> - N'#227'o Gerar Sintegra'
        Width = 264
      end
      item
        Text = '<F4> - Gerar Sintegra'
        Width = 264
      end
      item
        Text = '<ENTER> - Visualizar Transa'#231#227'o'
        Width = 266
      end>
  end
  object DataNotas: TDataSource
    DataSet = QNotas
    Left = 72
    Top = 344
  end
  object PopupMenu1: TPopupMenu
    Left = 120
    Top = 344
    object Alterar_NFe: TMenuItem
      Caption = 'Alterar CTe'
      OnClick = Alterar_NFeClick
    end
  end
  object QNotas: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM COMPL_CTEFISCAL'
      'WHERE EMPRESA_ID = :EMPRESA_ID')
    Left = 40
    Top = 296
    ParamData = <
      item
        Name = 'EMPRESA_ID'
        ParamType = ptInput
      end>
  end
  object QRel: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 104
    Top = 296
  end
  object IQuery: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 160
    Top = 296
  end
end
