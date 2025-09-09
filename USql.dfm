object FrmSql: TFrmSql
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Scripts SQL'
  ClientHeight = 575
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
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 534
    Width = 794
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 4
    object btnRetorna: TBitBtn
      Left = 713
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
      TabOrder = 1
      OnClick = btnRetornaClick
    end
    object btnTxt: TBitBtn
      Left = 633
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Criar &Txt'
      Enabled = False
      TabOrder = 0
      OnClick = btnTxtClick
    end
  end
  object Memo1: TMemo
    Left = 6
    Top = 9
    Width = 655
    Height = 89
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object btnExecuta: TButton
    Left = 667
    Top = 9
    Width = 121
    Height = 40
    Caption = '&Executar'
    TabOrder = 1
    OnClick = btnExecutaClick
  end
  object btnAbre: TButton
    Left = 667
    Top = 57
    Width = 121
    Height = 40
    Caption = '&Abrir'
    TabOrder = 2
    OnClick = btnAbreClick
  end
  object DBGrid1: TDBGrid
    Left = 6
    Top = 113
    Width = 782
    Height = 421
    DataSource = DataTabela
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DataTabela: TDataSource
    AutoEdit = False
    DataSet = QSql
    Left = 40
    Top = 96
  end
  object QSql: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 8
    Top = 96
  end
end
