object FrmInclui_Saldo: TFrmInclui_Saldo
  Left = 600
  Top = 250
  BiDiMode = bdLeftToRight
  Caption = 'Adicionar Saldo'
  ClientHeight = 208
  ClientWidth = 416
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poDesigned
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 41
    Top = 53
    Width = 24
    Height = 13
    Caption = 'Valor'
  end
  object Label2: TLabel
    Left = 212
    Top = 53
    Width = 57
    Height = 13
    Caption = 'Finalizadora'
  end
  object LabelAtual: TLabel
    Left = 248
    Top = 18
    Width = 49
    Height = 16
    Alignment = taRightJustify
    Caption = 'R$ 0,00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 8270101
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelNovo: TLabel
    Left = 248
    Top = 125
    Width = 49
    Height = 16
    Alignment = taRightJustify
    Caption = 'R$ 0,00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 8270101
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 112
    Top = 18
    Width = 81
    Height = 16
    Alignment = taRightJustify
    Caption = 'Saldo ATUAL'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 8270101
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 119
    Top = 125
    Width = 74
    Height = 16
    Alignment = taRightJustify
    Caption = 'Saldo NOVO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 8270101
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 24
    Top = 91
    Width = 41
    Height = 13
    Caption = 'Hist'#243'rico'
  end
  object VALOR_LANCADO: TCurrencyEdit
    Left = 76
    Top = 50
    Width = 115
    Height = 21
    MaxValue = 9999999.000000000000000000
    TabOrder = 0
    OnChange = VALOR_LANCADOChange
  end
  object ComboBox1: TComboBox
    Left = 278
    Top = 50
    Width = 115
    Height = 21
    BiDiMode = bdLeftToRight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 1
    Text = 'ComboBox1'
  end
  object BitBtn1: TBitBtn
    Left = 237
    Top = 162
    Width = 75
    Height = 25
    Caption = 'Ok'
    ModalResult = 1
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 318
    Top = 162
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    ModalResult = 2
    TabOrder = 3
  end
  object HISTORICO: TEdit
    Left = 76
    Top = 88
    Width = 317
    Height = 21
    MaxLength = 100
    TabOrder = 4
    Text = 'ENTRADA DE SALDO'
  end
  object IQuery: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM FINALIZADORAS'
      'WHERE TIPO_TRANSACAO NOT IN (2,8)'
      'ORDER BY FINALIZADORA_ID')
    Left = 24
    Top = 154
  end
end
