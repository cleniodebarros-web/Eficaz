object FrmAgrupamento_Recebimento: TFrmAgrupamento_Recebimento
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Agrupamento (Recebimentos)'
  ClientHeight = 230
  ClientWidth = 752
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 189
    Width = 752
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnRetorna: TBitBtn
      Left = 655
      Top = 6
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
      TabOrder = 0
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 752
    Height = 189
    Align = alClient
    Color = clInfoBk
    DataSource = DataOrcamento
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clBlue
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'DT_VENCIMENTO'
        Title.Caption = 'Vencimento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PARCELA_ID'
        Title.Caption = 'Parcela'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DUPLICATA'
        Title.Caption = 'Duplicata'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Title.Alignment = taRightJustify
        Title.Caption = 'Valor'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_JUROS'
        Title.Alignment = taRightJustify
        Title.Caption = 'Juros'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_MULTA'
        Title.Alignment = taRightJustify
        Title.Caption = 'Multa'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_ORI'
        Title.Alignment = taRightJustify
        Title.Caption = 'Valor Total'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_VENC_ORI'
        Title.Caption = 'Data Agrupamento'
        Visible = True
      end>
  end
  object DataOrcamento: TDataSource
    DataSet = FrmTrans_Recebimento_Lote.QRel
    Left = 512
    Top = 187
  end
end
