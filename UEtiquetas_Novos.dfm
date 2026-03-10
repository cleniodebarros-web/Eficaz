object FrmEtiquetas_Novos: TFrmEtiquetas_Novos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Etiquetas'
  ClientHeight = 191
  ClientWidth = 353
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
  object Label4: TLabel
    Left = 6
    Top = 9
    Width = 91
    Height = 13
    Caption = 'Modelo Impressora'
  end
  object Label2: TLabel
    Left = 6
    Top = 35
    Width = 77
    Height = 13
    Caption = 'Modelo Etiqueta'
  end
  object Bevel1: TBevel
    Left = 8
    Top = 135
    Width = 337
    Height = 10
    Shape = bsTopLine
  end
  object Label1: TLabel
    Left = 6
    Top = 62
    Width = 54
    Height = 13
    Caption = 'Impressora'
  end
  object Impressora: TComboBox
    Left = 103
    Top = 6
    Width = 171
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnChange = ImpressoraChange
    OnKeyDown = ImpressoraKeyDown
    Items.Strings = (
      'Argox'
      'Bematech LB-1000'
      'Bematech MP-4200(Bobina)'
      'Datamax (G'#244'ndola)'
      'Datamax (Produto)'
      'Elgin'
      'Matricial'
      'RDPrint Matricial'
      'RDPrint HP'
      'Tanca'
      'TTP-244 Plus'
      'Zebra'
      'Zebra GT800'
      '')
  end
  object Modelo: TComboBox
    Left = 103
    Top = 32
    Width = 234
    Height = 21
    TabOrder = 1
    OnKeyDown = ImpressoraKeyDown
    Items.Strings = (
      '1 Coluna'
      '2 Colunas'
      '3 Colunas'
      '3 Colunas Especial'
      '4 Colunas'
      'G'#244'ndola (2 Colunas)'
      '3 Colunas (S/Barra)'
      'G'#244'ndola Individual'
      'G'#244'ndola Individual 2 Pre'#231'os(A Vista/A Prazo)'
      'G'#244'ndola Individual 2 Pre'#231'os(A Vista/Atacado)')
  end
  object Preco: TCheckBox
    Left = 6
    Top = 99
    Width = 75
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Imp. Pre'#231'o'
    TabOrder = 2
    OnKeyDown = PrecoKeyDown
  end
  object btnExecuta: TBitBtn
    Left = 165
    Top = 151
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
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 4
    OnClick = btnExecutaClick
  end
  object btnRetorna: TBitBtn
    Left = 262
    Top = 151
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
    TabOrder = 5
  end
  object Porta: TComboBox
    Left = 103
    Top = 59
    Width = 234
    Height = 21
    TabOrder = 3
    Items.Strings = (
      'LPT1'
      'LPT2'
      'LPT3'
      'LPT4'
      'COM1'
      'COM2'
      'COM3'
      'COM4'
      'COM5'
      'COM6'
      'USB001'
      'USB002'
      'IP:(Eficaz.ini)'
      'c:\Eficaz7\etiqueta.txt')
  end
end
