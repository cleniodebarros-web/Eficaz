object FrmAltera_NFCe: TFrmAltera_NFCe
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Dados Complementares da Nota Fiscal(NFc-e)'
  ClientHeight = 184
  ClientWidth = 507
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = Menu_GeraXML
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 6
    Top = 9
    Width = 52
    Height = 13
    Alignment = taRightJustify
    Caption = 'Data Sa'#237'da'
  end
  object Label4: TLabel
    Left = 214
    Top = 9
    Width = 44
    Height = 13
    Alignment = taRightJustify
    Caption = 'Hr. Sa'#237'da'
  end
  object Bevel2: TBevel
    Left = 4
    Top = 140
    Width = 495
    Height = 4
    Shape = bsTopLine
  end
  object Label9: TLabel
    Left = 6
    Top = 64
    Width = 62
    Height = 13
    Caption = 'Chave NFc-e'
  end
  object Label10: TLabel
    Left = 6
    Top = 90
    Width = 32
    Height = 13
    Caption = 'Recibo'
  end
  object Label11: TLabel
    Left = 6
    Top = 116
    Width = 45
    Height = 13
    Caption = 'Protocolo'
  end
  object Label12: TLabel
    Left = 6
    Top = 37
    Width = 58
    Height = 13
    Caption = 'Cod. Pagto.'
  end
  object btnGera: TButton
    Left = 343
    Top = 150
    Width = 75
    Height = 25
    Caption = '&OK'
    TabOrder = 9
    OnClick = btnGeraClick
  end
  object DT_SAIDA: TDateEdit
    Left = 90
    Top = 6
    Width = 90
    Height = 21
    CheckOnExit = True
    DialogTitle = 'Selecione a Data'
    NumGlyphs = 2
    TabOrder = 0
    OnEnter = DT_SAIDAEnter
    OnKeyDown = DT_SAIDAKeyDown
  end
  object TRANSACAO_ID: TCurrencyEdit
    Left = 396
    Top = 86
    Width = 73
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 2
    Visible = False
    ZeroEmpty = False
    OnKeyDown = CNPJ_TRANSPORTADORKeyDown
  end
  object NO_DOC_FISCAL: TCurrencyEdit
    Left = 316
    Top = 111
    Width = 73
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 3
    Visible = False
    ZeroEmpty = False
    OnKeyDown = CNPJ_TRANSPORTADORKeyDown
  end
  object btnRetorna: TBitBtn
    Left = 424
    Top = 150
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
    TabOrder = 10
  end
  object CHAVE_NFCE: TEdit
    Left = 90
    Top = 61
    Width = 409
    Height = 21
    MaxLength = 44
    TabOrder = 6
    OnKeyDown = DT_SAIDAKeyDown
  end
  object RECIBO: TEdit
    Left = 90
    Top = 87
    Width = 219
    Height = 21
    MaxLength = 32
    ReadOnly = True
    TabOrder = 7
    OnKeyDown = DT_SAIDAKeyDown
  end
  object PROTOCOLO: TEdit
    Left = 90
    Top = 113
    Width = 219
    Height = 21
    MaxLength = 32
    ReadOnly = True
    TabOrder = 8
    OnKeyDown = DT_SAIDAKeyDown
  end
  object COND_PAGTO: TComboBox
    Left = 90
    Top = 34
    Width = 111
    Height = 21
    Style = csDropDownList
    CharCase = ecUpperCase
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 7
    ParentFont = False
    TabOrder = 4
    OnKeyDown = CNPJ_TRANSPORTADORKeyDown
    Items.Strings = (
      'A VISTA'
      'A PRAZO')
  end
  object EMPRESA_ID: TCurrencyEdit
    Left = 316
    Top = 86
    Width = 73
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 5
    Visible = False
    ZeroEmpty = False
    OnKeyDown = CNPJ_TRANSPORTADORKeyDown
  end
  object HR_SAIDA: TMaskEdit
    Left = 280
    Top = 6
    Width = 56
    Height = 21
    EditMask = '99:99:99;1;_'
    MaxLength = 8
    TabOrder = 1
    Text = '  :  :  '
    OnKeyDown = DT_SAIDAKeyDown
  end
  object Menu_GeraXML: TPopupMenu
    Left = 184
    Top = 190
    object GerarXML: TMenuItem
      Caption = 'Gerar XML'
      OnClick = GerarXMLClick
    end
  end
  object QConfig_Nfiscal: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 8
    Top = 144
  end
  object QItens: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 48
    Top = 144
  end
  object QTransacao: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 80
    Top = 144
  end
  object QNatOper: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 112
    Top = 144
  end
  object QParceiro: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 144
    Top = 144
  end
  object QTabela: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 176
    Top = 144
  end
  object IQuery: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 208
    Top = 144
  end
  object QParcelas: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 240
    Top = 144
  end
  object QCfop: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM CFOP'
      'WHERE'
      '(COD_CFOP = :COD_CFOP)')
    Left = 144
    Top = 192
    ParamData = <
      item
        Name = 'COD_CFOP'
        ParamType = ptInput
      end>
  end
  object QProdutos: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 112
    Top = 192
  end
  object QOrigem: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 80
    Top = 192
  end
  object QDetalhe_Import: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 48
    Top = 192
  end
  object QDetalhe: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 8
    Top = 192
  end
  object QNotas: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM TRANSITENS_NOTAS'
      'WHERE'
      '(TRANSACAO_ID = :TRANSACAO_ID)'
      'ORDER BY DT_EMISSAO, NUM_DOC')
    Left = 223
    Top = 193
    ParamData = <
      item
        Name = 'TRANSACAO_ID'
        ParamType = ptInput
      end>
  end
end
