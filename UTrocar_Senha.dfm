object FrmTrocar_Senha: TFrmTrocar_Senha
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Alterar Senha'
  ClientHeight = 125
  ClientWidth = 327
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 6
    Top = 71
    Width = 315
    Height = 4
    Shape = bsTopLine
  end
  object Label4: TLabel
    Left = 6
    Top = 9
    Width = 58
    Height = 13
    Caption = 'Nova Senha'
  end
  object Label1: TLabel
    Left = 6
    Top = 35
    Width = 47
    Height = 13
    Caption = 'Confirmar'
  end
  object Old_Senha: TEdit
    Left = 84
    Top = 5
    Width = 73
    Height = 21
    MaxLength = 9
    PasswordChar = '*'
    TabOrder = 0
    OnKeyDown = Old_SenhaKeyDown
  end
  object New_Senha: TEdit
    Left = 84
    Top = 32
    Width = 73
    Height = 21
    MaxLength = 9
    PasswordChar = '*'
    TabOrder = 1
    OnKeyDown = Old_SenhaKeyDown
  end
  object btnExecuta: TBitBtn
    Left = 246
    Top = 87
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
    TabOrder = 2
    OnClick = btnExecutaClick
  end
  object QUpdate: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 16
    Top = 89
  end
end
