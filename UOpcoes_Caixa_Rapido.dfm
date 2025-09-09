object FrmOpcoes_Caixa_Rapido: TFrmOpcoes_Caixa_Rapido
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Menu Caixa R'#225'pido'
  ClientHeight = 201
  ClientWidth = 229
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object btnEntrada_Operador: TButton
    Left = 6
    Top = 9
    Width = 217
    Height = 25
    Caption = 'Entrada Operador'
    TabOrder = 0
    OnClick = btnEntrada_OperadorClick
  end
  object btnSaida_Operador: TButton
    Left = 6
    Top = 61
    Width = 217
    Height = 25
    Caption = 'Sa'#237'da Operador'
    TabOrder = 1
    OnClick = btnSaida_OperadorClick
  end
  object btnVenda: TButton
    Left = 6
    Top = 113
    Width = 217
    Height = 25
    Caption = 'Venda'
    TabOrder = 2
    OnClick = btnVendaClick
  end
  object btnRetorna: TButton
    Left = 6
    Top = 165
    Width = 217
    Height = 25
    Caption = 'Retornar'
    TabOrder = 3
    OnClick = btnRetornaClick
  end
  object QRel: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 96
    Top = 173
  end
end
