object FrmCarta_Correcao_Cte: TFrmCarta_Correcao_Cte
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Carta de Corre'#231#227'o CTe'
  ClientHeight = 266
  ClientWidth = 440
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
  object Bevel1: TBevel
    Left = 6
    Top = 218
    Width = 416
    Height = 4
    Shape = bsTopLine
  end
  object Label1: TLabel
    Left = 6
    Top = 9
    Width = 53
    Height = 13
    Caption = 'Chave CTe'
  end
  object Label2: TLabel
    Left = 6
    Top = 35
    Width = 50
    Height = 13
    Caption = 'Lote Envio'
  end
  object Label4: TLabel
    Left = 6
    Top = 57
    Width = 48
    Height = 13
    Caption = 'CPF/CNPJ'
  end
  object Label5: TLabel
    Left = 6
    Top = 83
    Width = 59
    Height = 13
    Caption = 'Seq. Evento'
  end
  object btnChaveCTe: TSpeedButton
    Left = 410
    Top = 7
    Width = 23
    Height = 21
    Caption = '...'
    OnClick = btnChaveCTeClick
  end
  object btnExecuta: TBitBtn
    Left = 266
    Top = 234
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
    TabOrder = 4
    OnClick = btnExecutaClick
  end
  object btnRetorna: TBitBtn
    Left = 347
    Top = 234
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
    TabOrder = 5
    OnClick = btnRetornaClick
  end
  object Chave: TEdit
    Left = 87
    Top = 7
    Width = 320
    Height = 21
    MaxLength = 44
    TabOrder = 0
    OnChange = ChaveChange
    OnKeyDown = ChaveKeyDown
  end
  object Lote: TCurrencyEdit
    Left = 87
    Top = 32
    Width = 67
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 1
    ZeroEmpty = False
    OnKeyDown = LoteKeyDown
  end
  object CNPJ_CPF: TEdit
    Left = 87
    Top = 54
    Width = 136
    Height = 21
    MaxLength = 14
    TabOrder = 2
    OnKeyDown = ChaveKeyDown
  end
  object Seq_Evento: TCurrencyEdit
    Left = 87
    Top = 80
    Width = 67
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 3
    ZeroEmpty = False
    OnKeyDown = LoteKeyDown
  end
  object Grid_Inadimplencia: TDBGrid
    Left = 8
    Top = 102
    Width = 425
    Height = 110
    DataSource = Data_Correcao
    Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'GRUPO_ALTERADO'
        Title.Alignment = taCenter
        Title.Caption = 'Grupo Alterado'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CAMPO_ALTERADO'
        Title.Alignment = taCenter
        Title.Caption = 'Campo Alterado'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ITEM_ALTERADO'
        Title.Caption = 'Item Alterado'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CORRECAO'
        Title.Alignment = taCenter
        Title.Caption = 'Corre'#231#227'o Aplicada'
        Width = 400
        Visible = True
      end>
  end
  object Temp_Correcao: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    StoreDefs = True
    Left = 40
    Top = 240
  end
  object Data_Correcao: TDataSource
    DataSet = Temp_Correcao
    Left = 144
    Top = 248
  end
end
