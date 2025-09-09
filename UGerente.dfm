object FrmGerente: TFrmGerente
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Supervisor'
  ClientHeight = 86
  ClientWidth = 341
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
  object Label1: TLabel
    Left = 50
    Top = 10
    Width = 247
    Height = 25
    Alignment = taCenter
    AutoSize = False
    Caption = 'Digite a senha'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 88
    Top = 134
    Width = 303
    Height = 30
    Caption = 'Aguarde... Processando Dados'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    Visible = False
  end
  object GetOperador: TEdit
    Left = 65
    Top = 45
    Width = 209
    Height = 21
    BiDiMode = bdLeftToRight
    CharCase = ecLowerCase
    ParentBiDiMode = False
    PasswordChar = '*'
    TabOrder = 1
    OnKeyDown = GetOperadorKeyDown
    OnKeyPress = GetOperadorKeyPress
  end
  object QTeclado: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      '')
    Left = 64
    Top = 67
  end
  object QOperador: TFDQuery
    MasterFields = 'object QTeclado: TFDQuery'
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      '')
    Left = 112
    Top = 67
  end
end
