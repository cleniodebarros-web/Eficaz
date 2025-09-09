object FrmCheck_List_Moto: TFrmCheck_List_Moto
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Check-List (Moto)'
  ClientHeight = 528
  ClientWidth = 726
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
  object Label5: TLabel
    Left = 6
    Top = 9
    Width = 34
    Height = 13
    Caption = 'Modelo'
  end
  object Label7: TLabel
    Left = 399
    Top = 9
    Width = 17
    Height = 13
    Caption = 'Cor'
  end
  object Label9: TLabel
    Left = 6
    Top = 35
    Width = 19
    Height = 13
    Caption = 'Ano'
  end
  object Label13: TLabel
    Left = 6
    Top = 61
    Width = 14
    Height = 13
    Caption = 'KM'
  end
  object Label14: TLabel
    Left = 399
    Top = 35
    Width = 25
    Height = 13
    Caption = 'Placa'
  end
  object DBRadioGroup1: TDBRadioGroup
    Left = 6
    Top = 87
    Width = 273
    Height = 41
    Caption = 'Check-List'
    Columns = 3
    DataField = 'CHECK_LIST'
    DataSource = DataSub_Detail
    Items.Strings = (
      'Conservado'
      'Arranhada'
      'Quebrado')
    TabOrder = 5
    Values.Strings = (
      '0'
      '1'
      '2')
  end
  object Panel1: TPanel
    Left = 0
    Top = 487
    Width = 726
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    ExplicitTop = 489
    object btnRetorna: TBitBtn
      Left = 647
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
      ModalResult = 2
      NumGlyphs = 2
      TabOrder = 1
    end
    object btnExecuta: TBitBtn
      Left = 567
      Top = 8
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
      TabOrder = 0
      OnClick = btnExecutaClick
    end
  end
  object DBRadioGroup2: TDBRadioGroup
    Left = 449
    Top = 87
    Width = 273
    Height = 41
    Caption = 'Combust'#237'vel'
    Columns = 3
    DataField = 'COMBUSTIVEL'
    DataSource = DataSub_Detail
    Items.Strings = (
      '4/4'
      '1/2'
      'Reserva')
    TabOrder = 6
    Values.Strings = (
      '0'
      '1'
      '2')
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 139
    Width = 726
    Height = 348
    ActivePage = TabSheet1
    Align = alBottom
    TabOrder = 7
    object TabSheet1: TTabSheet
      Caption = 'P'#225'gina 1'
      object DBRadioGroup3: TDBRadioGroup
        Left = 6
        Top = 9
        Width = 250
        Height = 41
        Caption = 'Estado Geral da Pintura'
        Columns = 3
        DataField = 'ESTADO_PINTURA'
        DataSource = DataSub_Detail
        Items.Strings = (
          'Conservado'
          'Arranhada'
          'Quebrado')
        TabOrder = 0
        Values.Strings = (
          '0'
          '1'
          '2')
      end
      object DBRadioGroup4: TDBRadioGroup
        Left = 6
        Top = 61
        Width = 250
        Height = 41
        Caption = 'Tampa Lateral Esquerda'
        Columns = 3
        DataField = 'TAMPA_LAT_ESQ'
        DataSource = DataSub_Detail
        Items.Strings = (
          'Conservado'
          'Arranhada'
          'Quebrado')
        TabOrder = 1
        Values.Strings = (
          '0'
          '1'
          '2')
      end
      object DBRadioGroup5: TDBRadioGroup
        Left = 6
        Top = 113
        Width = 250
        Height = 41
        Caption = 'Tampa Lateral Direita'
        Columns = 3
        DataField = 'TAMPA_LAT_DIR'
        DataSource = DataSub_Detail
        Items.Strings = (
          'Conservado'
          'Arranhada'
          'Quebrado')
        TabOrder = 2
        Values.Strings = (
          '0'
          '1'
          '2')
      end
      object DBRadioGroup6: TDBRadioGroup
        Left = 6
        Top = 165
        Width = 250
        Height = 41
        Caption = 'Tanque Combust'#237'vel'
        Columns = 3
        DataField = 'TANQUE_COMB'
        DataSource = DataSub_Detail
        Items.Strings = (
          'Conservado'
          'Arranhada'
          'Quebrado')
        TabOrder = 3
        Values.Strings = (
          '0'
          '1'
          '2')
      end
      object DBRadioGroup7: TDBRadioGroup
        Left = 6
        Top = 217
        Width = 250
        Height = 41
        Caption = 'Paralama Dianteiro'
        Columns = 3
        DataField = 'PARALAMA_DIANT'
        DataSource = DataSub_Detail
        Items.Strings = (
          'Conservado'
          'Arranhada'
          'Quebrado')
        TabOrder = 4
        Values.Strings = (
          '0'
          '1'
          '2')
      end
      object DBRadioGroup8: TDBRadioGroup
        Left = 6
        Top = 269
        Width = 250
        Height = 41
        Caption = 'Retrovisor Esquerdo'
        Columns = 3
        DataField = 'RETROVISOR_ESQ'
        DataSource = DataSub_Detail
        Items.Strings = (
          'Conservado'
          'Arranhada'
          'Quebrado')
        TabOrder = 5
        Values.Strings = (
          '0'
          '1'
          '2')
      end
      object DBRadioGroup9: TDBRadioGroup
        Left = 271
        Top = 9
        Width = 250
        Height = 41
        Caption = 'Retrovisor Direito'
        Columns = 3
        DataField = 'RETROVISOR_DIR'
        DataSource = DataSub_Detail
        Items.Strings = (
          'Conservado'
          'Arranhada'
          'Quebrado')
        TabOrder = 6
        Values.Strings = (
          '0'
          '1'
          '2')
      end
      object DBRadioGroup10: TDBRadioGroup
        Left = 271
        Top = 61
        Width = 250
        Height = 41
        Caption = 'Pisca Traseiro'
        Columns = 3
        DataField = 'PISCA_TRASEIRO'
        DataSource = DataSub_Detail
        Items.Strings = (
          'Conservado'
          'Arranhada'
          'Quebrado')
        TabOrder = 7
        Values.Strings = (
          '0'
          '1'
          '2')
      end
      object DBRadioGroup11: TDBRadioGroup
        Left = 271
        Top = 113
        Width = 250
        Height = 41
        Caption = 'Pisca Dianteiro'
        Columns = 3
        DataField = 'PISCA_DIANTEIRO'
        DataSource = DataSub_Detail
        Items.Strings = (
          'Conservado'
          'Arranhada'
          'Quebrado')
        TabOrder = 8
        Values.Strings = (
          '0'
          '1'
          '2')
      end
      object DBRadioGroup12: TDBRadioGroup
        Left = 271
        Top = 165
        Width = 250
        Height = 41
        Caption = 'Farolete'
        Columns = 3
        DataField = 'FAROLETE'
        DataSource = DataSub_Detail
        Items.Strings = (
          'Conservado'
          'Arranhada'
          'Quebrado')
        TabOrder = 9
        Values.Strings = (
          '0'
          '1'
          '2')
      end
      object DBRadioGroup13: TDBRadioGroup
        Left = 271
        Top = 217
        Width = 250
        Height = 41
        Caption = 'Manete'
        Columns = 3
        DataField = 'MANETE'
        DataSource = DataSub_Detail
        Items.Strings = (
          'Conservado'
          'Arranhada'
          'Quebrado')
        TabOrder = 10
        Values.Strings = (
          '0'
          '1'
          '2')
      end
      object DBRadioGroup14: TDBRadioGroup
        Left = 271
        Top = 269
        Width = 250
        Height = 41
        Caption = 'Manicoto'
        Columns = 3
        DataField = 'MANICOTO'
        DataSource = DataSub_Detail
        Items.Strings = (
          'Conservado'
          'Arranhada'
          'Quebrado')
        TabOrder = 11
        Values.Strings = (
          '0'
          '1'
          '2')
      end
      object DBRadioGroup15: TDBRadioGroup
        Left = 538
        Top = 9
        Width = 180
        Height = 41
        Caption = 'Jogo de Ferramenta'
        Columns = 2
        DataField = 'JOGO_FERRAMENTA'
        DataSource = DataSub_Detail
        Items.Strings = (
          'Sim'
          'N'#227'o')
        TabOrder = 12
        Values.Strings = (
          '0'
          '1')
      end
      object DBRadioGroup16: TDBRadioGroup
        Left = 538
        Top = 61
        Width = 180
        Height = 41
        Caption = 'El'#225'sticos'
        Columns = 2
        DataField = 'ELASTICOS'
        DataSource = DataSub_Detail
        Items.Strings = (
          'Sim'
          'N'#227'o')
        TabOrder = 13
        Values.Strings = (
          '0'
          '1')
      end
      object DBRadioGroup17: TDBRadioGroup
        Left = 538
        Top = 113
        Width = 180
        Height = 41
        Caption = 'Flanela'
        Columns = 2
        DataField = 'FLANELA'
        DataSource = DataSub_Detail
        Items.Strings = (
          'Sim'
          'N'#227'o')
        TabOrder = 14
        Values.Strings = (
          '0'
          '1')
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'P'#225'gina 2'
      ImageIndex = 1
      object DBRadioGroup18: TDBRadioGroup
        Left = 6
        Top = 113
        Width = 180
        Height = 41
        Caption = 'Troca de Transmiss'#227'o'
        Columns = 2
        DataField = 'TROCA_TRANSMISSAO'
        DataSource = DataSub_Detail
        Items.Strings = (
          'Sim'
          'N'#227'o')
        TabOrder = 2
        Values.Strings = (
          '0'
          '1')
      end
      object DBRadioGroup19: TDBRadioGroup
        Left = 6
        Top = 61
        Width = 180
        Height = 41
        Caption = 'Lavagem'
        Columns = 2
        DataField = 'LAVAGEM'
        DataSource = DataSub_Detail
        Items.Strings = (
          'Sim'
          'N'#227'o')
        TabOrder = 1
        Values.Strings = (
          '0'
          '1')
      end
      object DBRadioGroup20: TDBRadioGroup
        Left = 6
        Top = 9
        Width = 180
        Height = 41
        Caption = 'Revis'#227'o'
        Columns = 2
        DataField = 'REVISAO'
        DataSource = DataSub_Detail
        Items.Strings = (
          'Sim'
          'N'#227'o')
        TabOrder = 0
        Values.Strings = (
          '0'
          '1')
      end
      object DBRadioGroup21: TDBRadioGroup
        Left = 6
        Top = 269
        Width = 180
        Height = 41
        Caption = 'Troca Rolamento Dianteiro'
        Columns = 2
        DataField = 'TROCA_ROL_DIANT'
        DataSource = DataSub_Detail
        Items.Strings = (
          'Sim'
          'N'#227'o')
        TabOrder = 5
        Values.Strings = (
          '0'
          '1')
      end
      object DBRadioGroup22: TDBRadioGroup
        Left = 6
        Top = 217
        Width = 180
        Height = 41
        Caption = 'Troca Retentor Bengala'
        Columns = 2
        DataField = 'TROCA_RET_BENGALA'
        DataSource = DataSub_Detail
        Items.Strings = (
          'Sim'
          'N'#227'o')
        TabOrder = 4
        Values.Strings = (
          '0'
          '1')
      end
      object DBRadioGroup23: TDBRadioGroup
        Left = 6
        Top = 165
        Width = 180
        Height = 41
        Caption = 'Troca de Dire'#231#227'o'
        Columns = 2
        DataField = 'TROCA_DIRECAO'
        DataSource = DataSub_Detail
        Items.Strings = (
          'Sim'
          'N'#227'o')
        TabOrder = 3
        Values.Strings = (
          '0'
          '1')
      end
      object DBRadioGroup25: TDBRadioGroup
        Left = 538
        Top = 61
        Width = 180
        Height = 41
        Caption = 'Troca Acess'#243'rios'
        Columns = 2
        DataField = 'TROCA_ACESSORIOS'
        DataSource = DataSub_Detail
        Items.Strings = (
          'Sim'
          'N'#227'o')
        TabOrder = 13
        Values.Strings = (
          '0'
          '1')
      end
      object DBRadioGroup26: TDBRadioGroup
        Left = 538
        Top = 9
        Width = 180
        Height = 41
        Caption = 'Troca Pe'#231'as'
        Columns = 2
        DataField = 'TROCA_PECAS'
        DataSource = DataSub_Detail
        Items.Strings = (
          'Sim'
          'N'#227'o')
        TabOrder = 12
        Values.Strings = (
          '0'
          '1')
      end
      object DBRadioGroup27: TDBRadioGroup
        Left = 272
        Top = 113
        Width = 180
        Height = 41
        Caption = 'Motor'
        Columns = 2
        DataField = 'MOTOR'
        DataSource = DataSub_Detail
        Items.Strings = (
          'Sim'
          'N'#227'o')
        TabOrder = 8
        Values.Strings = (
          '0'
          '1')
      end
      object DBRadioGroup28: TDBRadioGroup
        Left = 272
        Top = 269
        Width = 180
        Height = 41
        Caption = 'Troca Agulha Carburador'
        Columns = 2
        DataField = 'TROCA_AGULHA_CARB'
        DataSource = DataSub_Detail
        Items.Strings = (
          'Sim'
          'N'#227'o')
        TabOrder = 11
        Values.Strings = (
          '0'
          '1')
      end
      object DBRadioGroup29: TDBRadioGroup
        Left = 272
        Top = 217
        Width = 180
        Height = 41
        Caption = 'Troca Patim Traseiro'
        Columns = 2
        DataField = 'TROCA_PATIM_TRAS'
        DataSource = DataSub_Detail
        Items.Strings = (
          'Sim'
          'N'#227'o')
        TabOrder = 10
        Values.Strings = (
          '0'
          '1')
      end
      object DBRadioGroup30: TDBRadioGroup
        Left = 272
        Top = 165
        Width = 180
        Height = 41
        Caption = 'Troca Patim Dianteiro'
        Columns = 2
        DataField = 'TROCA_PATIM_DIANT'
        DataSource = DataSub_Detail
        Items.Strings = (
          'Sim'
          'N'#227'o')
        TabOrder = 9
        Values.Strings = (
          '0'
          '1')
      end
      object DBRadioGroup31: TDBRadioGroup
        Left = 272
        Top = 61
        Width = 180
        Height = 41
        Caption = 'Troca Retentor Embreagem'
        Columns = 2
        DataField = 'TROCA_RET_EMBREAGEM'
        DataSource = DataSub_Detail
        Items.Strings = (
          'Sim'
          'N'#227'o')
        TabOrder = 7
        Values.Strings = (
          '0'
          '1')
      end
      object DBRadioGroup32: TDBRadioGroup
        Left = 272
        Top = 9
        Width = 180
        Height = 41
        Caption = 'Troca Rolamento Traseiro'
        Columns = 2
        DataField = 'TROCA_ROL_TRAS'
        DataSource = DataSub_Detail
        Items.Strings = (
          'Sim'
          'N'#227'o')
        TabOrder = 6
        Values.Strings = (
          '0'
          '1')
      end
    end
  end
  object DBEdit1: TDBEdit
    Left = 48
    Top = 6
    Width = 317
    Height = 21
    DataField = 'MODELO'
    DataSource = DataSub_Detail
    TabOrder = 0
    OnKeyDown = DBEdit1KeyDown
  end
  object DBEdit2: TDBEdit
    Left = 440
    Top = 6
    Width = 282
    Height = 21
    DataField = 'COR'
    DataSource = DataSub_Detail
    TabOrder = 1
    OnKeyDown = DBEdit1KeyDown
  end
  object DBEdit3: TDBEdit
    Left = 440
    Top = 32
    Width = 121
    Height = 21
    DataField = 'PLACA'
    DataSource = DataSub_Detail
    TabOrder = 3
    OnKeyDown = DBEdit1KeyDown
  end
  object DBEdit4: TDBEdit
    Left = 48
    Top = 58
    Width = 121
    Height = 21
    DataField = 'KM'
    DataSource = DataSub_Detail
    TabOrder = 4
    OnKeyDown = DBEdit1KeyDown
  end
  object DBComboBox1: TDBComboBox
    Left = 48
    Top = 32
    Width = 89
    Height = 21
    DataField = 'ANO'
    DataSource = DataSub_Detail
    Items.Strings = (
      '1980'
      '1981'
      '1982'
      '1983'
      '1984'
      '1985'
      '1986'
      '1987'
      '1988'
      '1989'
      '1990'
      '1991'
      '1992'
      '1993'
      '1994'
      '1995'
      '1996'
      '1997'
      '1998'
      '1999'
      '2000'
      '2001'
      '2002'
      '2003'
      '2004'
      '2005'
      '2006'
      '2007'
      '2008'
      '2009'
      '2010'
      '2011'
      '2012'
      '2013'
      '2014'
      '2015'
      '2016'
      '2017'
      '2018'
      '2019'
      '2020')
    TabOrder = 2
    OnKeyDown = DBComboBox1KeyDown
  end
  object DataSub_Detail: TDataSource
    DataSet = Qsub_Detail
    Left = 112
    Top = 480
  end
  object Qsub_Detail: TFDQuery
    OnNewRecord = QSub_DetailNewRecord
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM CHECKLIST_MOTO'
      'WHERE'
      '(ORDEM_ID = :ORDEM_ID)')
    Left = 48
    Top = 480
    ParamData = <
      item
        Name = 'ORDEM_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
end
