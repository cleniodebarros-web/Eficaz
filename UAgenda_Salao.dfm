object FrmAgenda_Salao: TFrmAgenda_Salao
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Agenda Sal'#227'o'
  ClientHeight = 465
  ClientWidth = 1212
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
  object Panel1: TPanel
    Left = 0
    Top = 424
    Width = 1212
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = 422
    ExplicitWidth = 1250
    object btnRetorna: TBitBtn
      Left = 1137
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
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 1212
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitWidth = 1250
    object Label1: TLabel
      Left = 6
      Top = 9
      Width = 129
      Height = 23
      Caption = 'Agenda Sal'#227'o'
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
    Width = 1212
    Height = 368
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
        FieldName = 'NOME_CLIENTE'
        Title.Caption = 'Nome do Cliente'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RESUMO_AG'
        Title.Caption = 'Servi'#231'o Agendado'
        Width = 391
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PREV_ATEND'
        Title.Caption = 'Dt. Agenda'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'hora_atend'
        Title.Caption = 'Hora Agenda'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Profissional'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Title.Alignment = taCenter
        Title.Caption = 'Valor'
        Width = 93
        Visible = True
      end>
  end
  object QContas_Pagar: TFDQuery
    AfterOpen = QContas_PagarAfterOpen
    Connection = FrmData.DbF_Eficaz
    Left = 32
    Top = 224
  end
  object QCheques_Emitidos: TFDQuery
    Connection = FrmData.DbF_Eficaz
    Left = 152
    Top = 208
  end
  object QLiquida: TFDQuery
    Connection = FrmData.DbF_Eficaz
    Left = 256
    Top = 208
  end
  object DataContas_Pagar: TDataSource
    AutoEdit = False
    DataSet = QContas_Pagar
    Left = 56
    Top = 301
  end
  object DataCheques_Emitidos: TDataSource
    AutoEdit = False
    DataSet = QCheques_Emitidos
    Left = 152
    Top = 301
  end
end
