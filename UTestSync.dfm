object FrmTeste: TFrmTeste
  Left = 0
  Top = 0
  Caption = 'Asynchronous Command'
  ClientHeight = 366
  ClientWidth = 644
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 573
    Top = 8
    Width = 63
    Height = 23
    Alignment = taRightJustify
    Caption = 'Label1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Open: TButton
    Left = 520
    Top = 280
    Width = 116
    Height = 45
    Caption = 'Open'
    TabOrder = 0
    OnClick = OpenClick
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 8
    Width = 628
    Height = 237
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Descricao'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Produto_id'
        Width = 72
        Visible = True
      end>
  end
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 280
    Width = 506
    Height = 45
    Caption = 'Op'#231#245'es'
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      'Normal'
      'amAsync'
      'amCancelDialog')
    TabOrder = 2
  end
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 337
    Width = 644
    Height = 29
    Align = alBottom
    TabOrder = 3
  end
  object FDQuery_original: TFDQuery
    BeforeOpen = FDQuery_originalBeforeOpen
    AfterOpen = FDQuery_originalAfterOpen
    AfterGetRecords = FDQuery_originalAfterGetRecords
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evMode, evItems]
    FetchOptions.Mode = fmManual
    FetchOptions.Items = [fiMeta]
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvRefreshMode, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.UpdateChangedFields = False
    UpdateOptions.RefreshMode = rmManual
    UpdateOptions.CheckRequired = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.CheckUpdatable = False
    SQL.Strings = (
      'select * from clientes')
    Left = 120
    Top = 80
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 200
    Top = 80
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 40
    Top = 80
  end
  object FDQuery1: TFDQuery
    AfterOpen = FDQuery1AfterOpen
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evMode, evItems, evCache, evUnidirectional]
    FetchOptions.Mode = fmManual
    FetchOptions.Unidirectional = True
    FetchOptions.Items = [fiMeta]
    FetchOptions.Cache = []
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvRefreshMode, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.UpdateChangedFields = False
    UpdateOptions.RefreshMode = rmManual
    UpdateOptions.CheckRequired = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.CheckUpdatable = False
    SQL.Strings = (
      'select cliente_id, nome, endereco from clientes')
    Left = 312
    Top = 80
  end
  object DataSource2: TDataSource
    DataSet = FDQuery1
    Left = 360
    Top = 160
  end
  object FDQuery2: TFDQuery
    AfterOpen = FDQuery1AfterOpen
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evMode, evItems, evCache, evUnidirectional]
    FetchOptions.Unidirectional = True
    FetchOptions.Items = [fiBlobs, fiDetails]
    FetchOptions.Cache = []
    SQL.Strings = (
      'select cliente_id, nome, endereco from clientes')
    Left = 392
    Top = 88
  end
  object FDPhysOracleDriverLink1: TFDPhysOracleDriverLink
    Left = 400
    Top = 152
  end
end
