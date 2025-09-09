object FrmLembrete: TFrmLembrete
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Lembrete'
  ClientHeight = 463
  ClientWidth = 1070
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 422
    Width = 1070
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object btnRetorna: TBitBtn
      Left = 965
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Fechar'
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
      TabOrder = 0
    end
    object Chk_Mostrar_Lembrete: TCheckBox
      Left = 6
      Top = 12
      Width = 227
      Height = 17
      Caption = 'Mostrar este lembrete no pr'#243'ximo acesso'
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 1070
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 6
      Top = 9
      Width = 143
      Height = 23
      Caption = 'Contas a Pagar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Contas_Pagar: TDBGrid
    Left = 0
    Top = 41
    Width = 1070
    Height = 170
    Align = alTop
    Color = clInfoBk
    DataSource = DataContas_Pagar
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clBlue
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Fornecedor'
        Width = 350
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_DOC'
        Title.Caption = 'N'#186' Doc.'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HISTORICO'
        Title.Caption = 'Hist'#243'rico'
        Width = 391
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_TRANS'
        Title.Caption = 'Dt. Conta'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_VENCIMENTO'
        Title.Caption = 'Dt. Venc.'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Title.Alignment = taRightJustify
        Title.Caption = 'Valor'
        Width = 93
        Visible = True
      end>
  end
  object Panel3: TPanel
    Left = 0
    Top = 211
    Width = 1070
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
    object Label2: TLabel
      Left = 6
      Top = 9
      Width = 294
      Height = 23
      Caption = 'Cheques Pr'#233'-Datados Emitidos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Cheques_Emitidos: TDBGrid
    Left = 0
    Top = 252
    Width = 1070
    Height = 170
    Align = alClient
    Color = clInfoBk
    DataSource = DataCheques_Emitidos
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 4
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clBlue
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = Cheques_EmitidosDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'DT_CHEQUE'
        Title.Caption = 'Dt. Cheque'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_CHEQUE'
        Title.Alignment = taRightJustify
        Title.Caption = 'N'#186' Cheque'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HISTORICO'
        Title.Caption = 'Hist'#243'rico'
        Width = 190
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMINAL'
        Title.Caption = 'Favorecido'
        Width = 190
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_PARA'
        Title.Caption = 'Bom Para'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Title.Caption = 'Valor'
        Width = 93
        Visible = True
      end>
  end
  object QContas_Pagar: TFDQuery
    Connection = FrmData.DbF_Eficaz
    Left = 72
    Top = 328
  end
  object QCheques_Emitidos: TFDQuery
    Connection = FrmData.DbF_Eficaz
    Left = 136
    Top = 328
  end
  object QLiquida: TFDQuery
    Connection = FrmData.DbF_Eficaz
    Left = 192
    Top = 320
  end
  object DataContas_Pagar: TDataSource
    AutoEdit = False
    DataSet = QContas_Pagar
    Left = 88
    Top = 389
  end
  object DataCheques_Emitidos: TDataSource
    AutoEdit = False
    DataSet = QCheques_Emitidos
    Left = 152
    Top = 389
  end
end
