object FrmSoftware_House: TFrmSoftware_House
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Software House'
  ClientHeight = 395
  ClientWidth = 716
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
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 354
    Width = 716
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object btnRetorna: TBitBtn
      Left = 637
      Top = 8
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
      TabOrder = 0
      OnClick = btnRetornaClick
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 716
    Height = 354
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = '&Manuten'#231#227'o'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label13: TLabel
        Left = 6
        Top = 269
        Width = 47
        Height = 13
        Caption = 'C'#243'd. MD5'
      end
      object Label6: TLabel
        Left = 6
        Top = 87
        Width = 25
        Height = 13
        Caption = 'CNPJ'
      end
      object Label4: TLabel
        Left = 6
        Top = 217
        Width = 49
        Height = 13
        Caption = 'Nome PAF'
      end
      object Label3: TLabel
        Left = 432
        Top = 191
        Width = 74
        Height = 13
        Caption = 'Inscr. Municipal'
      end
      object Label19: TLabel
        Left = 6
        Top = 61
        Width = 27
        Height = 13
        Caption = 'Nome'
      end
      object Label2: TLabel
        Left = 6
        Top = 191
        Width = 72
        Height = 13
        Caption = 'Inscr. Estadual'
      end
      object Label15: TLabel
        Left = 6
        Top = 295
        Width = 49
        Height = 13
        Caption = 'Vers'#227'o ER'
      end
      object Label23: TLabel
        Left = 6
        Top = 243
        Width = 55
        Height = 13
        Caption = 'Vers'#227'o PAF'
      end
      object Label1: TLabel
        Left = 6
        Top = 165
        Width = 42
        Height = 13
        Caption = 'Telefone'
      end
      object Label5: TLabel
        Left = 6
        Top = 113
        Width = 45
        Height = 13
        Caption = 'Endere'#231'o'
      end
      object Label7: TLabel
        Left = 6
        Top = 139
        Width = 39
        Height = 13
        Caption = 'Contato'
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 708
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 11
        object btnEdit: TBitBtn
          Left = 6
          Top = 8
          Width = 75
          Height = 25
          Caption = 'A&lterar'
          TabOrder = 0
          OnClick = btnEditClick
        end
        object btnSave: TBitBtn
          Left = 316
          Top = 8
          Width = 75
          Height = 25
          Caption = '&Salvar'
          TabOrder = 1
          OnClick = btnSaveClick
        end
        object btnDiscard: TBitBtn
          Left = 627
          Top = 8
          Width = 75
          Height = 25
          Caption = 'C&ancelar'
          TabOrder = 2
          OnClick = btnDiscardClick
        end
      end
      object VERSAO_ER: TEdit
        Left = 105
        Top = 292
        Width = 81
        Height = 21
        Enabled = False
        MaxLength = 7
        TabOrder = 10
        OnKeyDown = NOMEKeyDown
      end
      object COD_MD5: TEdit
        Left = 105
        Top = 266
        Width = 586
        Height = 21
        Enabled = False
        MaxLength = 128
        TabOrder = 9
        OnKeyDown = NOMEKeyDown
      end
      object CNPJ: TMaskEdit
        Left = 105
        Top = 84
        Width = 116
        Height = 21
        Enabled = False
        EditMask = '99.999.999/9999-99'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 18
        ParentFont = False
        TabOrder = 1
        Text = '  .   .   /    -  '
        OnKeyDown = NOMEKeyDown
      end
      object NOME_PAF: TEdit
        Left = 105
        Top = 214
        Width = 256
        Height = 21
        Enabled = False
        MaxLength = 30
        TabOrder = 7
        OnKeyDown = NOMEKeyDown
      end
      object INSCR_MUNICIPAL: TEdit
        Left = 523
        Top = 188
        Width = 168
        Height = 21
        Enabled = False
        MaxLength = 15
        TabOrder = 6
        OnKeyDown = NOMEKeyDown
      end
      object INSCR_ESTADUAL: TEdit
        Left = 105
        Top = 188
        Width = 168
        Height = 21
        Enabled = False
        MaxLength = 15
        TabOrder = 5
        OnKeyDown = NOMEKeyDown
      end
      object NOME: TEdit
        Left = 105
        Top = 58
        Width = 305
        Height = 21
        Enabled = False
        MaxLength = 40
        TabOrder = 0
        OnKeyDown = NOMEKeyDown
      end
      object VERSAO_PAF: TEdit
        Left = 105
        Top = 240
        Width = 104
        Height = 21
        Enabled = False
        MaxLength = 7
        TabOrder = 8
        OnKeyDown = NOMEKeyDown
      end
      object TELEFONE: TMaskEdit
        Left = 105
        Top = 162
        Width = 90
        Height = 21
        CharCase = ecUpperCase
        Enabled = False
        EditMask = '(99) 9999-9999;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 14
        ParentFont = False
        TabOrder = 4
        Text = '(  )     -    '
        OnKeyDown = NOMEKeyDown
      end
      object ENDERECO: TEdit
        Left = 105
        Top = 110
        Width = 305
        Height = 21
        Enabled = False
        MaxLength = 40
        TabOrder = 2
        OnKeyDown = NOMEKeyDown
      end
      object CONTATO: TEdit
        Left = 105
        Top = 136
        Width = 305
        Height = 21
        Enabled = False
        MaxLength = 40
        TabOrder = 3
        OnKeyDown = NOMEKeyDown
      end
    end
  end
  object DataTabela: TDataSource
    AutoEdit = False
    DataSet = QTabela
    Left = 56
    Top = 358
  end
  object IQuery: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 88
    Top = 360
  end
  object QTabela: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM SOFTWARE_HOUSE')
    Left = 16
    Top = 360
  end
end
