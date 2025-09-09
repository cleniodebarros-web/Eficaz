object frmBackupNovo: TfrmBackupNovo
  Left = 0
  Top = 0
  Caption = 'Backup'
  ClientHeight = 453
  ClientWidth = 577
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = -8
    Top = 0
    Width = 609
    Height = 457
    TabOrder = 0
    object btnIniciarBackup: TButton
      Left = 460
      Top = 178
      Width = 101
      Height = 33
      Caption = 'Iniciar'
      TabOrder = 0
      OnClick = btnIniciarBackupClick
    end
    object Animate1: TAnimate
      Left = 152
      Top = 166
      Width = 272
      Height = 60
      Color = clHighlightText
      CommonAVI = aviCopyFile
      ParentColor = False
      StopFrame = 22
    end
    object Memo1: TMemo
      Left = 8
      Top = 232
      Width = 577
      Height = 201
      Lines.Strings = (
        '')
      TabOrder = 2
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 8
      Width = 577
      Height = 137
      Caption = 'Configura'#231#245'es'
      TabOrder = 3
      object lblCaminhoBackup: TLabel
        Left = 49
        Top = 25
        Width = 79
        Height = 13
        Caption = 'Pasta do Backup'
      end
      object SpeedButton1: TSpeedButton
        Left = 484
        Top = 22
        Width = 23
        Height = 22
        Caption = '...'
        OnClick = SpeedButton1Click
      end
      object lblBancoDados: TLabel
        Left = 51
        Top = 60
        Width = 77
        Height = 13
        Caption = 'Banco de Dados'
      end
      object lblIp: TLabel
        Left = 267
        Top = 60
        Width = 10
        Height = 13
        Caption = 'Ip'
      end
      object lblPorta: TLabel
        Left = 102
        Top = 98
        Width = 26
        Height = 13
        Caption = 'Porta'
      end
      object edtPastaBackup: TEdit
        Left = 134
        Top = 22
        Width = 344
        Height = 21
        TabOrder = 0
        OnKeyPress = edtPastaBackupKeyPress
      end
      object edtBancoDados: TEdit
        Left = 134
        Top = 57
        Width = 121
        Height = 21
        TabOrder = 1
        OnKeyPress = edtBancoDadosKeyPress
      end
      object edtIp: TEdit
        Left = 283
        Top = 57
        Width = 121
        Height = 21
        TabOrder = 2
        OnKeyPress = edtIpKeyPress
      end
      object edtPorta: TEdit
        Left = 134
        Top = 95
        Width = 60
        Height = 21
        TabOrder = 3
        OnKeyPress = edtPortaKeyPress
      end
      object RadioGroup1: TRadioGroup
        Left = 283
        Top = 84
        Width = 109
        Height = 41
        Caption = 'Vers'#227'o'
        Columns = 2
        Items.Strings = (
          'Pg 9'
          'Pg 11')
        TabOrder = 4
      end
    end
  end
  object FileOpenDialog1: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <>
    Options = [fdoPickFolders]
    Left = 544
    Top = 200
  end
end
