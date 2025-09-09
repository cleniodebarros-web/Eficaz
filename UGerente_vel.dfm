object FrmGerente_vel: TFrmGerente_vel
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Supervisor'
  ClientHeight = 71
  ClientWidth = 443
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 18
    Top = 16
    Width = 406
    Height = 39
    Caption = 'Passe o cart'#227'o do supervisor'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object GetOperador: TEdit
    Left = 208
    Top = -100
    Width = 121
    Height = 21
    TabOrder = 0
    OnKeyDown = GetOperadorKeyDown
    OnKeyPress = GetOperadorKeyPress
  end
  object QTeclado: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      'SELECT * FROM TECLADO'
      '')
    Left = 16
    Top = 3
  end
  object QOperador: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 56
    Top = 3
  end
end
