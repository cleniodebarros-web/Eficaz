object FrmTecla: TFrmTecla
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'C'#243'digo da Tecla'
  ClientHeight = 125
  ClientWidth = 325
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
    Top = 71
    Width = 313
    Height = 4
    Shape = bsTopLine
  end
  object Label1: TLabel
    Left = 6
    Top = 9
    Width = 25
    Height = 13
    Caption = 'Tecla'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 6
    Top = 35
    Width = 57
    Height = 13
    Caption = 'Finalizadora'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object btnExecuta: TButton
    Left = 164
    Top = 87
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 2
    OnClick = btnExecutaClick
  end
  object btnRetorna: TButton
    Left = 244
    Top = 87
    Width = 75
    Height = 25
    Caption = '&Retorna'
    ModalResult = 2
    TabOrder = 3
  end
  object Finalizadora: TEdit
    Left = 82
    Top = 32
    Width = 41
    Height = 21
    MaxLength = 40
    TabOrder = 1
  end
  object Tecla: TEdit
    Left = 82
    Top = 6
    Width = 73
    Height = 21
    MaxLength = 40
    TabOrder = 0
    OnKeyDown = TeclaKeyDown
    OnKeyPress = TeclaKeyPress
  end
  object QUpdate: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 24
    Top = 81
  end
end
