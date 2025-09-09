object FrmProrroga: TFrmProrroga
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Prorroga'
  ClientHeight = 279
  ClientWidth = 325
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 6
    Top = 229
    Width = 313
    Height = 4
    Shape = bsTopLine
  end
  object Label4: TLabel
    Left = 6
    Top = 9
    Width = 55
    Height = 13
    Caption = 'Vencimento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 6
    Top = 35
    Width = 46
    Height = 13
    Caption = 'Esp. Doc.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 6
    Top = 61
    Width = 37
    Height = 13
    Caption = 'N'#186' Doc.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 6
    Top = 87
    Width = 41
    Height = 13
    Caption = 'Despesa'
  end
  object Label3: TLabel
    Left = 6
    Top = 113
    Width = 29
    Height = 13
    Caption = 'Conta'
  end
  object btnConta: TSpeedButton
    Left = 135
    Top = 110
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
    OnClick = btnContaClick
  end
  object Label5: TLabel
    Left = 6
    Top = 139
    Width = 41
    Height = 13
    Caption = 'Hist'#243'rico'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 6
    Top = 166
    Width = 58
    Height = 13
    Caption = 'Observa'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object btnExecuta: TBitBtn
    Left = 144
    Top = 245
    Width = 85
    Height = 25
    Caption = '&OK'
    NumGlyphs = 2
    TabOrder = 8
    OnClick = btnExecutaClick
  end
  object btnRetorna: TBitBtn
    Left = 234
    Top = 245
    Width = 85
    Height = 25
    Caption = '&Retorna'
    NumGlyphs = 2
    TabOrder = 9
    OnClick = btnRetornaClick
  end
  object Especie: TComboBox
    Left = 66
    Top = 32
    Width = 215
    Height = 21
    AutoComplete = False
    Style = csDropDownList
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 20
    ParentFont = False
    TabOrder = 2
    OnKeyDown = EspecieKeyDown
    Items.Strings = (
      ''
      'BANC'#193'RIA'
      'CARTEIRA'
      'CHEQUE'
      'DUPLICATA'
      'JUR'#205'DICA'
      'NOTA PROMISS'#211'RIA'
      'PERDIDA'
      'CARTAO')
  end
  object Duplicata: TEdit
    Left = 66
    Top = 58
    Width = 172
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 20
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
    OnKeyDown = Dt_VencimentoKeyDown
  end
  object Dt_Vencimento: TDateEdit
    Left = 66
    Top = 6
    Width = 90
    Height = 21
    CheckOnExit = True
    DialogTitle = 'Selecione a Data'
    NumGlyphs = 2
    StartOfWeek = Sun
    TabOrder = 0
    OnKeyDown = Dt_VencimentoKeyDown
  end
  object Vr_Despesa: TRxCalcEdit
    Left = 66
    Top = 84
    Width = 113
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
    NumGlyphs = 2
    TabOrder = 4
    ZeroEmpty = False
    OnKeyDown = EspecieKeyDown
  end
  object Lancar_Despesa: TCheckBox
    Left = 200
    Top = 87
    Width = 119
    Height = 17
    Caption = 'Incluir Lanc. Despesa'
    TabOrder = 5
    OnClick = Lancar_DespesaClick
    OnKeyDown = Dt_VencimentoKeyDown
  end
  object Conta: TCurrencyEdit
    Left = 66
    Top = 110
    Width = 67
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    Enabled = False
    TabOrder = 6
    ZeroEmpty = False
    OnKeyDown = EspecieKeyDown
  end
  object Historico: TEdit
    Left = 66
    Top = 136
    Width = 251
    Height = 21
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 25
    ParentFont = False
    TabOrder = 7
    OnKeyDown = Dt_VencimentoKeyDown
  end
  object excluir_lancamento: TCheckBox
    Left = 182
    Top = 9
    Width = 119
    Height = 17
    Caption = 'Excluir Lan'#231'amento'
    Color = clRed
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 1
    OnClick = excluir_lancamentoClick
    OnKeyDown = Dt_VencimentoKeyDown
  end
  object Observacao: TMemo
    Left = 66
    Top = 163
    Width = 251
    Height = 54
    MaxLength = 150
    TabOrder = 10
  end
  object QInsert: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evItems, evRecsMax, evRowsetSize, evCache, evCursorKind, evAutoFetchAll]
    FetchOptions.CursorKind = ckDefault
    FetchOptions.RowsetSize = 1000
    FetchOptions.AutoFetchAll = afDisable
    Left = 64
    Top = 278
  end
  object QTransacao: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evItems, evRecsMax, evRowsetSize, evCache, evCursorKind, evAutoFetchAll]
    FetchOptions.CursorKind = ckDefault
    FetchOptions.RowsetSize = 1000
    FetchOptions.AutoFetchAll = afDisable
    Left = 32
    Top = 278
  end
  object QContas: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evItems, evRecsMax, evRowsetSize, evCache, evCursorKind, evAutoFetchAll]
    FetchOptions.CursorKind = ckDefault
    FetchOptions.RowsetSize = 1000
    FetchOptions.AutoFetchAll = afDisable
    Left = 96
    Top = 278
  end
  object IQuery: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evItems, evRecsMax, evRowsetSize, evCache, evCursorKind, evAutoFetchAll]
    FetchOptions.CursorKind = ckDefault
    FetchOptions.RowsetSize = 1000
    FetchOptions.AutoFetchAll = afDisable
    Left = 128
    Top = 278
  end
  object QSearch: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evItems, evRecsMax, evRowsetSize, evCache, evCursorKind, evAutoFetchAll]
    FetchOptions.CursorKind = ckDefault
    FetchOptions.RowsetSize = 1000
    FetchOptions.AutoFetchAll = afDisable
    Left = 160
    Top = 278
  end
end
