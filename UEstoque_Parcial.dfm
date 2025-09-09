object FrmEstoque_Parcial: TFrmEstoque_Parcial
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Estoque Parcial'
  ClientHeight = 180
  ClientWidth = 308
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label64: TLabel
    Left = 6
    Top = 9
    Width = 81
    Height = 13
    Caption = 'Estoque Atual:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label65: TLabel
    Left = 6
    Top = 35
    Width = 47
    Height = 13
    Caption = 'Pedidos:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label66: TLabel
    Left = 6
    Top = 61
    Width = 72
    Height = 13
    Caption = 'Or'#231'amentos:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label67: TLabel
    Left = 6
    Top = 87
    Width = 84
    Height = 13
    Caption = 'Est. Dispon'#237'vel:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 6
    Top = 123
    Width = 279
    Height = 10
    Shape = bsTopLine
  end
  object btnRetorna: TBitBtn
    Left = 210
    Top = 139
    Width = 75
    Height = 25
    Caption = '&Retorna'
    ModalResult = 2
    TabOrder = 0
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
  end
  object Estoque: TRxCalcEdit
    Left = 105
    Top = 6
    Width = 180
    Height = 21
    Margins.Left = 1
    Margins.Top = 1
    DisplayFormat = '0.00;-R$ ,0.00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    NumGlyphs = 2
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    ZeroEmpty = False
  end
  object Pedidos: TRxCalcEdit
    Left = 192
    Top = 32
    Width = 93
    Height = 21
    Margins.Left = 1
    Margins.Top = 1
    DisplayFormat = '0.00;-R$ ,0.00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    NumGlyphs = 2
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
    ZeroEmpty = False
  end
  object Orcamentos: TRxCalcEdit
    Left = 105
    Top = 58
    Width = 180
    Height = 21
    Margins.Left = 1
    Margins.Top = 1
    DisplayFormat = '0.00;-R$ ,0.00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    NumGlyphs = 2
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
    ZeroEmpty = False
  end
  object Parcial: TRxCalcEdit
    Left = 105
    Top = 84
    Width = 180
    Height = 21
    Margins.Left = 1
    Margins.Top = 1
    DisplayFormat = '0.00;-R$ ,0.00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    NumGlyphs = 2
    ParentFont = False
    ReadOnly = True
    TabOrder = 4
    ZeroEmpty = False
  end
  object DT_PEDIDO: TDateEdit
    Left = 105
    Top = 32
    Width = 83
    Height = 21
    CheckOnExit = True
    DialogTitle = 'Selecione a Data'
    Enabled = False
    NumGlyphs = 2
    TabOrder = 5
  end
end
