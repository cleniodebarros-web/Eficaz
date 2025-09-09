object FrmIntegracao: TFrmIntegracao
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Integra'#231#227'o'
  ClientHeight = 151
  ClientWidth = 325
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
    Top = 97
    Width = 313
    Height = 4
    Shape = bsTopLine
  end
  object Label1: TLabel
    Left = 6
    Top = 61
    Width = 313
    Height = 13
    Alignment = taCenter
    AutoSize = False
  end
  object Cadastro_Produtos: TCheckBox
    Left = 6
    Top = 9
    Width = 139
    Height = 17
    Caption = 'Cadastro de Produtos'
    TabOrder = 0
  end
  object Preco_Venda: TCheckBox
    Left = 202
    Top = 8
    Width = 97
    Height = 17
    Caption = 'Pre'#231'o de Venda'
    TabOrder = 1
  end
  object Preco_Custo: TCheckBox
    Left = 6
    Top = 35
    Width = 139
    Height = 17
    Caption = 'Pre'#231'o de Custo'
    TabOrder = 2
  end
  object Posicao_Estoque: TCheckBox
    Left = 202
    Top = 35
    Width = 117
    Height = 17
    Caption = 'Posi'#231#227'o do Estoque'
    TabOrder = 3
  end
  object btnRetorna: TBitBtn
    Left = 244
    Top = 113
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
  object btnExecuta: TBitBtn
    Left = 163
    Top = 113
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
  object QUpdate: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 13
    Top = 109
  end
  object QSearch: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 45
    Top = 109
  end
  object ID_Transacao: TIBStoredProc
    StoredProcName = 'PROC_GENTRANSACOES'
    Left = 394
    Top = 63696
  end
  object IBStoredProc1: TIBStoredProc
    StoredProcName = 'PROC_GENTRANSACOES'
    Left = 79
    Top = 109
  end
  object DB_Pharmacy: TIBDatabase
    DatabaseName = '127.0.0.1:C:\Apps\Pharmacy\Dados\Pharmacy.FDB'
    Params.Strings = (
      'password=ph'
      'user_name=PHCADM')
    LoginPrompt = False
    DefaultTransaction = Trans_Pharmacy
    ServerType = 'IBServer'
    Left = 112
    Top = 109
  end
  object Trans_Pharmacy: TIBTransaction
    DefaultAction = TACommitRetaining
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 144
    Top = 109
  end
  object QPharmacy: TIBQuery
    Database = DB_Pharmacy
    Transaction = Trans_Pharmacy
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 173
    Top = 109
  end
end
