object FrmConferirxml: TFrmConferirxml
  Left = 0
  Top = 0
  Caption = 'Conferir Xml'
  ClientHeight = 482
  ClientWidth = 1096
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 6
    Top = 9
    Width = 36
    Height = 13
    Caption = 'Per'#237'odo'
  end
  object lblCaixa: TLabel
    Left = 286
    Top = 9
    Width = 31
    Height = 13
    Caption = 'Caixa:'
  end
  object Label2: TLabel
    Left = 73
    Top = 47
    Width = 137
    Height = 24
    Caption = 'Notas Fiscais:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object sDBGrid1: TsDBGrid
    Left = 8
    Top = 82
    Width = 1081
    Height = 361
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Transacao_id'
        Title.Caption = 'Transa'#231#227'o'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Caixa'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Chave_Nfce'
        Width = 270
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'situacao'
        Title.Caption = 'Situa'#231#227'o'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Valor_Transacao'
        Title.Caption = 'Vr. Transa'#231#227'o'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Base_Transacao'
        Title.Caption = 'Base Icms Transa'#231#227'o'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Icms_Transacao'
        Title.Caption = 'Icms Transa'#231#227'o'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Valor_xml'
        Title.Caption = 'Valor XML'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Base_Xml'
        Title.Caption = 'Base Icms XML'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Icms_xml'
        Title.Caption = 'Icms XML'
        Width = 85
        Visible = True
      end>
  end
  object Dtmen: TDateEdit
    Left = 73
    Top = 6
    Width = 90
    Height = 21
    CheckOnExit = True
    DialogTitle = 'Selecione a Data'
    NumGlyphs = 2
    TabOrder = 1
  end
  object Dtmai: TDateEdit
    Left = 182
    Top = 6
    Width = 90
    Height = 21
    CheckOnExit = True
    DialogTitle = 'Selecione a Data'
    NumGlyphs = 2
    TabOrder = 2
  end
  object btnExecuta: TBitBtn
    Left = 440
    Top = 4
    Width = 75
    Height = 25
    Caption = '&Verificar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
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
    ParentFont = False
    TabOrder = 3
    OnClick = btnExecutaClick
  end
  object CaixaCb: TComboBox
    Left = 323
    Top = 6
    Width = 64
    Height = 21
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object btnRetorna: TBitBtn
    Left = 998
    Top = 449
    Width = 75
    Height = 25
    Caption = '&Retorna'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
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
    ParentFont = False
    TabOrder = 5
    OnClick = btnRetornaClick
  end
  object QDados: TFDQuery
    Connection = FrmData.DbF_Eficaz
    Left = 608
    Top = 8
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 552
    Top = 8
    object FDMemTable1Transacao_id: TIntegerField
      FieldName = 'Transacao_id'
    end
    object FDMemTable1Data: TDateField
      FieldName = 'Data'
    end
    object FDMemTable1Caixa: TIntegerField
      FieldName = 'Caixa'
    end
    object FDMemTable1Chave_Nfce: TStringField
      FieldName = 'Chave_Nfce'
      Size = 44
    end
    object FDMemTable1situacao: TStringField
      FieldName = 'situacao'
      Size = 10
    end
    object FDMemTable1Valor_Transacao: TFloatField
      FieldName = 'Valor_Transacao'
    end
    object FDMemTable1Base_Transacao: TFloatField
      FieldName = 'Base_Transacao'
    end
    object FDMemTable1Icms_Transacao: TFloatField
      FieldName = 'Icms_Transacao'
    end
    object FDMemTable1Valor_xml: TFloatField
      FieldName = 'Valor_xml'
    end
    object FDMemTable1Base_Xml: TFloatField
      FieldName = 'Base_Xml'
    end
    object FDMemTable1Icms_xml: TFloatField
      FieldName = 'Icms_xml'
    end
  end
  object XML: TXMLDocument
    Left = 744
    Top = 8
    DOMVendorDesc = 'MSXML'
  end
  object DataSource1: TDataSource
    DataSet = FDMemTable1
    Left = 688
    Top = 8
  end
end
