object FrmConsiste_Codigo: TFrmConsiste_Codigo
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consistir C'#243'digos de Barra'
  ClientHeight = 148
  ClientWidth = 329
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
    Top = 97
    Width = 317
    Height = 4
    Shape = bsTopLine
  end
  object Label1: TLabel
    Left = 168
    Top = 9
    Width = 64
    Height = 13
    Caption = 'ID Transa'#231#227'o'
  end
  object Label2: TLabel
    Left = 6
    Top = 71
    Width = 317
    Height = 13
    Alignment = taCenter
    AutoSize = False
  end
  object btnExecuta: TBitBtn
    Left = 147
    Top = 113
    Width = 85
    Height = 25
    Caption = '&OK'
    TabOrder = 2
    OnClick = btnExecutaClick
    NumGlyphs = 2
  end
  object btnRetorna: TBitBtn
    Left = 238
    Top = 113
    Width = 85
    Height = 25
    Caption = '&Retorna'
    TabOrder = 3
    NumGlyphs = 2
  end
  object Transitens: TCheckBox
    Left = 6
    Top = 9
    Width = 131
    Height = 17
    Caption = 'Tabela Transitens'
    TabOrder = 0
  end
  object Produtos: TCheckBox
    Left = 6
    Top = 35
    Width = 131
    Height = 17
    Caption = 'Tabela Produtos'
    TabOrder = 1
  end
  object Id_Transacao: TCurrencyEdit
    Left = 238
    Top = 6
    Width = 85
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    TabOrder = 4
    ZeroEmpty = False
  end
  object DB_Eficaz: TIBDatabase
    DatabaseName = 'C:\Eficaz7\Server\EFICAZ_0.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = Trans_Eficaz
    Left = 16
    Top = 112
  end
  object Trans_Eficaz: TIBTransaction
    DefaultAction = TACommitRetaining
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 56
    Top = 112
  end
  object QRel: TIBQuery
    Database = DB_Eficaz
    Transaction = Trans_Eficaz
    Left = 96
    Top = 112
  end
end
