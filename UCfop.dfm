object FrmCfop: TFrmCfop
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'CFOP'
  ClientHeight = 390
  ClientWidth = 581
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
  object Label7: TLabel
    Left = 175
    Top = 110
    Width = 63
    Height = 13
    Caption = 'C'#243'digo CFOP'
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 581
    Height = 349
    ActivePage = Manutencao
    Align = alClient
    TabOrder = 0
    object Consulta: TTabSheet
      Caption = '&Consulta'
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 573
        Height = 321
        Align = alClient
        Color = clInfoBk
        DataSource = DataTabela
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clBlue
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = DBGrid1DblClick
        OnKeyPress = DBGrid1KeyPress
        OnTitleClick = DBGrid1TitleClick
        Columns = <
          item
            Expanded = False
            FieldName = 'COD_CFOP'
            Title.Caption = 'CFOP'
            Width = 36
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESC_CFOP'
            Title.Caption = 'Descri'#231#227'o'
            Width = 504
            Visible = True
          end>
      end
    end
    object Manutencao: TTabSheet
      Caption = '&Manuten'#231#227'o'
      ImageIndex = 1
      OnShow = ManutencaoShow
      object Label3: TLabel
        Left = 6
        Top = 61
        Width = 63
        Height = 13
        Caption = 'C'#243'digo CFOP'
      end
      object Label4: TLabel
        Left = 6
        Top = 170
        Width = 46
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object Label5: TLabel
        Left = 3
        Top = 197
        Width = 58
        Height = 13
        Caption = 'Observa'#231#227'o'
      end
      object Label1: TLabel
        Left = 6
        Top = 87
        Width = 59
        Height = 13
        Caption = 'CFOP Conv.'
      end
      object Label6: TLabel
        Left = 158
        Top = 61
        Width = 60
        Height = 13
        Caption = 'CST Entrada'
      end
      object Label8: TLabel
        Left = 158
        Top = 87
        Width = 48
        Height = 13
        Caption = 'CST Sa'#237'da'
      end
      object Label71: TLabel
        Left = 308
        Top = 61
        Width = 60
        Height = 13
        Caption = 'Nat. Receita'
      end
      object btnNat_Rec: TSpeedButton
        Left = 428
        Top = 58
        Width = 64
        Height = 21
        Cursor = crHandPoint
        Caption = 'F7'
        Enabled = False
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Glyph.Data = {
          06020000424D0602000000000000760000002800000028000000140000000100
          0400000000009001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333333FFFFF
          FFF00000333333333333333777773333333BFBFBFBF0FFF03333333333333337
          FFF73333333FFFFFFF000000333333333333337777773333333BFBFBF0FBFBFB
          333333333FFFF733FFFF3333333F00000FF000003333333377777FF777773333
          333B0FFF0000FFF0333333337FFF7777FFF73333333F00000FF000003333333F
          777773F777773333330BFBFBF0FBFBFB3333337FF333373FFFFF33333010FFFF
          FF00000033333777FF3333777777333330170BFBFBF0FFF0333337777FF33337
          FFF73333301170FFFFF0000033333777778F3337777333330711190BFBFBFBFB
          333377777378F3333333333308819990FFFFFFFF3333733733378F3333333330
          88FF9999033333333337333333FF7333333333088FFFF0003333333333733333
          F777333333333088FFF003333333333337333337733333333333088FFF033333
          333333337F33337333333333333308FFF09333333333333378F3373333333333
          333330FF0933333333333333378F733333333333333333003333333333333333
          33773333333333333333}
        NumGlyphs = 2
        ParentFont = False
        OnClick = btnNat_RecClick
      end
      object Label2: TLabel
        Left = 308
        Top = 87
        Width = 69
        Height = 13
        Caption = 'Conta contabil'
      end
      object btnConta: TSpeedButton
        Left = 432
        Top = 84
        Width = 64
        Height = 21
        Cursor = crHandPoint
        Caption = 'F7'
        Enabled = False
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Glyph.Data = {
          06020000424D0602000000000000760000002800000028000000140000000100
          0400000000009001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333333FFFFF
          FFF00000333333333333333777773333333BFBFBFBF0FFF03333333333333337
          FFF73333333FFFFFFF000000333333333333337777773333333BFBFBF0FBFBFB
          333333333FFFF733FFFF3333333F00000FF000003333333377777FF777773333
          333B0FFF0000FFF0333333337FFF7777FFF73333333F00000FF000003333333F
          777773F777773333330BFBFBF0FBFBFB3333337FF333373FFFFF33333010FFFF
          FF00000033333777FF3333777777333330170BFBFBF0FFF0333337777FF33337
          FFF73333301170FFFFF0000033333777778F3337777333330711190BFBFBFBFB
          333377777378F3333333333308819990FFFFFFFF3333733733378F3333333330
          88FF9999033333333337333333FF7333333333088FFFF0003333333333733333
          F777333333333088FFF003333333333337333337733333333333088FFF033333
          333333337F33337333333333333308FFF09333333333333378F3373333333333
          333330FF0933333333333333378F733333333333333333003333333333333333
          33773333333333333333}
        NumGlyphs = 2
        ParentFont = False
        OnClick = btnContaClick
      end
      object DBText3: TDBText
        Left = 383
        Top = 108
        Width = 187
        Height = 13
        DataField = 'DESCRICAO'
        DataSource = DataConta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object COD_CFOP: TEdit
        Left = 84
        Top = 58
        Width = 53
        Height = 21
        Enabled = False
        MaxLength = 4
        TabOrder = 1
        OnKeyDown = COD_CFOPKeyDown
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 573
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object btnPrior: TBitBtn
          Left = 6
          Top = 6
          Width = 75
          Height = 25
          Caption = 'Anterior'
          TabOrder = 0
          OnClick = btnPriorClick
        end
        object btnNext: TBitBtn
          Left = 87
          Top = 6
          Width = 75
          Height = 25
          Caption = 'Pr'#243'ximo'
          TabOrder = 1
          OnClick = btnNextClick
        end
        object btnInsert: TBitBtn
          Left = 168
          Top = 6
          Width = 75
          Height = 25
          Caption = '&Incluir'
          TabOrder = 2
          OnClick = btnInsertClick
        end
        object btnEdit: TBitBtn
          Left = 249
          Top = 6
          Width = 75
          Height = 25
          Caption = 'A&lterar'
          TabOrder = 3
          OnClick = btnEditClick
        end
        object btnDelete: TBitBtn
          Left = 330
          Top = 6
          Width = 75
          Height = 25
          Caption = '&Excluir'
          TabOrder = 4
          OnClick = btnDeleteClick
        end
        object btnSave: TBitBtn
          Left = 411
          Top = 6
          Width = 75
          Height = 25
          Caption = '&Salvar'
          TabOrder = 5
          OnClick = btnSaveClick
        end
        object btnDiscard: TBitBtn
          Left = 492
          Top = 6
          Width = 75
          Height = 25
          Caption = 'C&ancelar'
          TabOrder = 6
          OnClick = btnDiscardClick
        end
      end
      object DESC_CFOP: TEdit
        Left = 84
        Top = 167
        Width = 477
        Height = 21
        Enabled = False
        MaxLength = 250
        TabOrder = 3
        OnKeyDown = COD_CFOPKeyDown
      end
      object CFNOTA: TMemo
        Left = 84
        Top = 194
        Width = 477
        Height = 119
        Enabled = False
        TabOrder = 4
      end
      object CFOP_CONV: TEdit
        Left = 84
        Top = 84
        Width = 53
        Height = 21
        Enabled = False
        MaxLength = 4
        TabOrder = 2
        OnKeyDown = COD_CFOPKeyDown
      end
      object CST_ENTRADA: TEdit
        Left = 240
        Top = 58
        Width = 36
        Height = 21
        Enabled = False
        MaxLength = 2
        TabOrder = 5
        OnKeyDown = COD_CFOPKeyDown
      end
      object CST_SAIDA: TEdit
        Left = 240
        Top = 84
        Width = 36
        Height = 21
        Enabled = False
        MaxLength = 2
        TabOrder = 6
        OnKeyDown = COD_CFOPKeyDown
      end
      object Movimento: TCheckBox
        Left = 84
        Top = 144
        Width = 216
        Height = 17
        Caption = 'Sem movimenta'#231'ao f'#237'sica (SPED FISCAL)'
        TabOrder = 8
      end
      object NAT_REC: TEdit
        Left = 383
        Top = 58
        Width = 37
        Height = 21
        Enabled = False
        MaxLength = 3
        TabOrder = 9
      end
      object MOVIMENTO_PISCOFINS: TCheckBox
        Left = 84
        Top = 122
        Width = 192
        Height = 17
        Caption = 'Sem movimento (SPED PIS/COFINS)'
        TabOrder = 10
      end
      object CONTA_ID: TCurrencyEdit
        Left = 384
        Top = 84
        Width = 39
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0;-0'
        Enabled = False
        TabOrder = 7
        ZeroEmpty = False
        OnExit = CONTA_IDExit
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 349
    Width = 581
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnComeca_Com: TSpeedButton
      Left = 432
      Top = 10
      Width = 32
      Height = 21
      Cursor = crHandPoint
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Glyph.Data = {
        06020000424D0602000000000000760000002800000028000000140000000100
        0400000000009001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333333FFFFF
        FFF00000333333333333333777773333333BFBFBFBF0FFF03333333333333337
        FFF73333333FFFFFFF000000333333333333337777773333333BFBFBF0FBFBFB
        333333333FFFF733FFFF3333333F00000FF000003333333377777FF777773333
        333B0FFF0000FFF0333333337FFF7777FFF73333333F00000FF000003333333F
        777773F777773333330BFBFBF0FBFBFB3333337FF333373FFFFF33333010FFFF
        FF00000033333777FF3333777777333330170BFBFBF0FFF0333337777FF33337
        FFF73333301170FFFFF0000033333777778F3337777333330711190BFBFBFBFB
        333377777378F3333333333308819990FFFFFFFF3333733733378F3333333330
        88FF9999033333333337333333FF7333333333088FFFF0003333333333733333
        F777333333333088FFF003333333333337333337733333333333088FFF033333
        333333337F33337333333333333308FFF09333333333333378F3373333333333
        333330FF0933333333333333378F733333333333333333003333333333333333
        33773333333333333333}
      NumGlyphs = 2
      ParentFont = False
      OnClick = btnComeca_ComClick
    end
    object btnRetorna: TBitBtn
      Left = 502
      Top = 6
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
    object Comeca_Com: TLabeledEdit
      Left = 50
      Top = 10
      Width = 380
      Height = 21
      EditLabel.Width = 41
      EditLabel.Height = 13
      EditLabel.Caption = 'Localizar'
      LabelPosition = lpLeft
      TabOrder = 1
      OnKeyPress = Comeca_ComKeyPress
    end
  end
  object DataTabela: TDataSource
    AutoEdit = False
    DataSet = QTabela
    Left = 344
    Top = 80
  end
  object QTabela: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evItems, evRecsMax, evRowsetSize, evCache, evCursorKind, evAutoFetchAll]
    FetchOptions.CursorKind = ckDefault
    FetchOptions.RowsetSize = 1000
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      'SELECT * FROM CFOP')
    Left = 16
    Top = 240
  end
  object IQuery: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evItems, evRecsMax, evRowsetSize, evCache, evCursorKind, evAutoFetchAll]
    FetchOptions.CursorKind = ckDefault
    FetchOptions.RowsetSize = 1000
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      'SELECT * FROM CFOP')
    Left = 64
    Top = 248
  end
  object DataPedido: TDataSource
    Left = 488
    Top = 362
  end
  object Qconta: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM TABELAS'
      'WHERE'
      '(TABELA_ID = :CONTA_ID)'
      'AND (TIPO_TABELA = '#39'P'#39')'
      'AND (NIVEL = '#39'ANAL'#205'TICA'#39')'
      'AND (STATUS = '#39'A'#39')')
    Left = 448
    Top = 154
    ParamData = <
      item
        Name = 'CONTA_ID'
        ParamType = ptInput
      end>
  end
  object DataConta: TDataSource
    AutoEdit = False
    DataSet = Qconta
    Left = 296
    Top = 80
  end
end
