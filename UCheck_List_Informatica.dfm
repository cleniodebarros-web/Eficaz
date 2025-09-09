object FrmCheck_List_Informatica: TFrmCheck_List_Informatica
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Check-List (Inform'#225'tica)'
  ClientHeight = 499
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
    Left = 394
    Top = 9
    Width = 40
    Height = 13
    Caption = 'Mem'#243'ria'
  end
  object Label13: TLabel
    Left = 8
    Top = 35
    Width = 14
    Height = 13
    Caption = 'HD'
  end
  object Label14: TLabel
    Left = 369
    Top = 35
    Width = 59
    Height = 13
    Caption = 'Processador'
  end
  object Label1: TLabel
    Left = 175
    Top = 35
    Width = 13
    Height = 13
    Caption = 'GB'
  end
  object DBRadioGroup1: TDBRadioGroup
    Left = 8
    Top = 66
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
    TabOrder = 4
    Values.Strings = (
      '0'
      '1'
      '2')
  end
  object Panel1: TPanel
    Left = 0
    Top = 458
    Width = 726
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 6
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
  object PageControl1: TPageControl
    Left = 0
    Top = 110
    Width = 726
    Height = 348
    ActivePage = TabSheet1
    Align = alBottom
    TabOrder = 5
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
        Caption = 'Cd-Rom'
        Columns = 3
        DataField = 'TANQUE_COMB'
        DataSource = DataSub_Detail
        Items.Strings = (
          'Sim'
          'N'#227'o'
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
        Caption = 'Cd-Rw'
        Columns = 3
        DataField = 'PARALAMA_DIANT'
        DataSource = DataSub_Detail
        Items.Strings = (
          'Sim'
          'N'#227'o'
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
        Caption = 'Dvd-Rom'
        Columns = 3
        DataField = 'RETROVISOR_ESQ'
        DataSource = DataSub_Detail
        Items.Strings = (
          'Sim'
          'N'#227'o'
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
        Caption = 'Dvd-Rw'
        Columns = 3
        DataField = 'RETROVISOR_DIR'
        DataSource = DataSub_Detail
        Items.Strings = (
          'Sim'
          'N'#227'o'
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
        Caption = 'Unidade de Diskete'
        Columns = 3
        DataField = 'PISCA_TRASEIRO'
        DataSource = DataSub_Detail
        Items.Strings = (
          'Sim'
          'N'#227'o'
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
        Caption = 'Cabo Energia Cpu'
        Columns = 3
        DataField = 'PISCA_DIANTEIRO'
        DataSource = DataSub_Detail
        Items.Strings = (
          'Sim '
          'N'#227'o'
          'Defeito')
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
        Caption = 'Sistema Operacional'
        Columns = 3
        DataField = 'FAROLETE'
        DataSource = DataSub_Detail
        Items.Strings = (
          'Windows'
          'Linux'
          'Outro')
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
        Caption = 'Teclado'
        Columns = 3
        DataField = 'MANETE'
        DataSource = DataSub_Detail
        Items.Strings = (
          'Sim'
          'N'#227'o'
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
        Caption = 'Mouse'
        Columns = 3
        DataField = 'MANICOTO'
        DataSource = DataSub_Detail
        Items.Strings = (
          'Sim'
          'N'#227'o'
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
        Caption = 'Manuais'
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
        Caption = 'Cds-Originais'
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
    TabOrder = 2
    OnKeyDown = DBEdit1KeyDown
  end
  object DBEdit4: TDBEdit
    Left = 48
    Top = 33
    Width = 121
    Height = 21
    DataField = 'ANO'
    DataSource = DataSub_Detail
    TabOrder = 3
    OnKeyDown = DBEdit1KeyDown
  end
  object DataSub_Detail: TDataSource
    DataSet = QSub_Detail
    Left = 104
    Top = 446
  end
  object QSub_Detail: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    UpdateObject = USql_OrcItens
    SQL.Strings = (
      ''
      'SELECT * FROM CHECKLIST_MOTO'
      'WHERE'
      '(ORDEM_ID = :ORDEM_ID)')
    Left = 32
    Top = 448
    ParamData = <
      item
        Name = 'ORDEM_ID'
        ParamType = ptInput
      end>
  end
  object USql_OrcItens: TFDUpdateSQL
    InsertSQL.Strings = (
      'insert into CHECKLIST_MOTO'
      
        '  (ANO, CHECK_LIST, COMBUSTIVEL, COR, ELASTICOS, ESTADO_PINTURA,' +
        ' FAROLETE, '
      
        '   FLANELA, JOGO_FERRAMENTA, KM, LAVAGEM, MANETE, MANICOTO, MODE' +
        'LO, MOTOR, '
      
        '   ORDEM_ID, PARALAMA_DIANT, PISCA_DIANTEIRO, PISCA_TRASEIRO, PL' +
        'ACA, RETROVISOR_DIR, '
      
        '   RETROVISOR_ESQ, REVISAO, TAMPA_LAT_DIR, TAMPA_LAT_ESQ, TANQUE' +
        '_COMB, '
      
        '   TROCA_ACESSORIOS, TROCA_AGULHA_CARB, TROCA_DIRECAO, TROCA_PAT' +
        'IM_DIANT, '
      
        '   TROCA_PATIM_TRAS, TROCA_PECAS, TROCA_RET_BENGALA, TROCA_RET_E' +
        'MBREAGEM, '
      '   TROCA_ROL_DIANT, TROCA_ROL_TRAS, TROCA_TRANSMISSAO)'
      'values'
      
        '  (:ANO, :CHECK_LIST, :COMBUSTIVEL, :COR, :ELASTICOS, :ESTADO_PI' +
        'NTURA, '
      
        '   :FAROLETE, :FLANELA, :JOGO_FERRAMENTA, :KM, :LAVAGEM, :MANETE' +
        ', :MANICOTO, '
      
        '   :MODELO, :MOTOR, :ORDEM_ID, :PARALAMA_DIANT, :PISCA_DIANTEIRO' +
        ', :PISCA_TRASEIRO, '
      
        '   :PLACA, :RETROVISOR_DIR, :RETROVISOR_ESQ, :REVISAO, :TAMPA_LA' +
        'T_DIR, '
      
        '   :TAMPA_LAT_ESQ, :TANQUE_COMB, :TROCA_ACESSORIOS, :TROCA_AGULH' +
        'A_CARB, '
      
        '   :TROCA_DIRECAO, :TROCA_PATIM_DIANT, :TROCA_PATIM_TRAS, :TROCA' +
        '_PECAS, '
      
        '   :TROCA_RET_BENGALA, :TROCA_RET_EMBREAGEM, :TROCA_ROL_DIANT, :' +
        'TROCA_ROL_TRAS, '
      '   :TROCA_TRANSMISSAO)')
    ModifySQL.Strings = (
      'update CHECKLIST_MOTO'
      'set'
      '  ANO = :ANO,'
      '  CHECK_LIST = :CHECK_LIST,'
      '  COMBUSTIVEL = :COMBUSTIVEL,'
      '  COR = :COR,'
      '  ELASTICOS = :ELASTICOS,'
      '  ESTADO_PINTURA = :ESTADO_PINTURA,'
      '  FAROLETE = :FAROLETE,'
      '  FLANELA = :FLANELA,'
      '  JOGO_FERRAMENTA = :JOGO_FERRAMENTA,'
      '  KM = :KM,'
      '  LAVAGEM = :LAVAGEM,'
      '  MANETE = :MANETE,'
      '  MANICOTO = :MANICOTO,'
      '  MODELO = :MODELO,'
      '  MOTOR = :MOTOR,'
      '  ORDEM_ID = :ORDEM_ID,'
      '  PARALAMA_DIANT = :PARALAMA_DIANT,'
      '  PISCA_DIANTEIRO = :PISCA_DIANTEIRO,'
      '  PISCA_TRASEIRO = :PISCA_TRASEIRO,'
      '  PLACA = :PLACA,'
      '  RETROVISOR_DIR = :RETROVISOR_DIR,'
      '  RETROVISOR_ESQ = :RETROVISOR_ESQ,'
      '  REVISAO = :REVISAO,'
      '  TAMPA_LAT_DIR = :TAMPA_LAT_DIR,'
      '  TAMPA_LAT_ESQ = :TAMPA_LAT_ESQ,'
      '  TANQUE_COMB = :TANQUE_COMB,'
      '  TROCA_ACESSORIOS = :TROCA_ACESSORIOS,'
      '  TROCA_AGULHA_CARB = :TROCA_AGULHA_CARB,'
      '  TROCA_DIRECAO = :TROCA_DIRECAO,'
      '  TROCA_PATIM_DIANT = :TROCA_PATIM_DIANT,'
      '  TROCA_PATIM_TRAS = :TROCA_PATIM_TRAS,'
      '  TROCA_PECAS = :TROCA_PECAS,'
      '  TROCA_RET_BENGALA = :TROCA_RET_BENGALA,'
      '  TROCA_RET_EMBREAGEM = :TROCA_RET_EMBREAGEM,'
      '  TROCA_ROL_DIANT = :TROCA_ROL_DIANT,'
      '  TROCA_ROL_TRAS = :TROCA_ROL_TRAS,'
      '  TROCA_TRANSMISSAO = :TROCA_TRANSMISSAO'
      'where'
      '  ORDEM_ID = :OLD_ORDEM_ID')
    DeleteSQL.Strings = (
      'delete from CHECKLIST_MOTO'
      'where'
      '  ORDEM_ID = :OLD_ORDEM_ID')
    FetchRowSQL.Strings = (
      'Select '
      '  ORDEM_ID,'
      '  MODELO,'
      '  COR,'
      '  ANO,'
      '  PLACA,'
      '  KM,'
      '  CHECK_LIST,'
      '  COMBUSTIVEL,'
      '  ESTADO_PINTURA,'
      '  TAMPA_LAT_ESQ,'
      '  TAMPA_LAT_DIR,'
      '  TANQUE_COMB,'
      '  PARALAMA_DIANT,'
      '  RETROVISOR_ESQ,'
      '  RETROVISOR_DIR,'
      '  PISCA_TRASEIRO,'
      '  PISCA_DIANTEIRO,'
      '  FAROLETE,'
      '  MANETE,'
      '  MANICOTO,'
      '  JOGO_FERRAMENTA,'
      '  ELASTICOS,'
      '  FLANELA,'
      '  REVISAO,'
      '  LAVAGEM,'
      '  TROCA_TRANSMISSAO,'
      '  TROCA_DIRECAO,'
      '  TROCA_RET_BENGALA,'
      '  TROCA_ROL_DIANT,'
      '  TROCA_ROL_TRAS,'
      '  TROCA_RET_EMBREAGEM,'
      '  MOTOR,'
      '  TROCA_PATIM_DIANT,'
      '  TROCA_PATIM_TRAS,'
      '  TROCA_AGULHA_CARB,'
      '  TROCA_PECAS,'
      '  TROCA_ACESSORIOS'
      'from CHECKLIST_MOTO '
      'where'
      '  ORDEM_ID = :ORDEM_ID')
    Left = 168
    Top = 450
  end
end
