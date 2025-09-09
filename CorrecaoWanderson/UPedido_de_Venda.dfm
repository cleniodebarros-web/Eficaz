object FrmPedido_de_venda: TFrmPedido_de_venda
  Left = 309
  Top = 169
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Pedido de Venda'
  ClientHeight = 571
  ClientWidth = 865
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  Visible = True
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label11: TLabel
    Left = 28
    Top = 223
    Width = 43
    Height = 13
    Caption = 'Munic'#237'pio'
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 865
    Height = 531
    ActivePage = Manutencao
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Consulta: TTabSheet
      Caption = '&Consulta'
      OnShow = ConsultaShow
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 857
        Height = 482
        Align = alClient
        Color = clInfoBk
        DataSource = DataTabela
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clBlue
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = DBGrid1DrawColumnCell
        OnDblClick = DBGrid1DblClick
        OnKeyPress = DBGrid1KeyPress
        OnTitleClick = DBGrid1TitleClick
        Columns = <
          item
            Expanded = False
            FieldName = 'pedido_id'
            Title.Caption = 'C'#243'digo'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dt_pedido'
            Title.Caption = 'Dt. Pedido'
            Width = 79
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dt_movimento'
            Title.Caption = 'Dt. Movimento'
            Width = 79
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Title.Caption = 'Nome'
            Width = 253
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'solicitante'
            Title.Caption = 'Solicitante'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valor'
            Title.Alignment = taRightJustify
            Title.Caption = 'Valor'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cond_pagto'
            Title.Caption = 'Cod. Pagto.'
            Width = 109
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'status'
            Title.Alignment = taCenter
            Title.Caption = 'Status'
            Width = 85
            Visible = True
          end>
      end
      object Dias: TTabSet
        Left = 0
        Top = 482
        Width = 857
        Height = 21
        Align = alBottom
        AutoScroll = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        SoftTop = True
        Style = tsModernTabs
        Tabs.Strings = (
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7'
          '8'
          '9'
          '10'
          '11'
          '12'
          '13'
          '14'
          '15'
          '16'
          '17'
          '18'
          '19'
          '20'
          '21'
          '22'
          '23'
          '24'
          '25'
          '26'
          '27'
          '28'
          '29'
          '30'
          '31'
          'Todos')
        TabIndex = 0
        OnClick = DiasClick
      end
    end
    object Manutencao: TTabSheet
      Caption = '&Manuten'#231#227'o'
      ImageIndex = 1
      OnShow = ManutencaoShow
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object DBText1: TDBText
        Left = 674
        Top = 61
        Width = 48
        Height = 13
        AutoSize = True
        DataField = 'RAZAO'
        DataSource = DataEmpresa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 33
        Top = 61
        Width = 58
        Height = 13
        Caption = 'Data Pedido'
      end
      object Label2: TLabel
        Left = 305
        Top = 61
        Width = 52
        Height = 13
        Caption = 'Dt. Movim.'
      end
      object Label3: TLabel
        Left = 33
        Top = 88
        Width = 39
        Height = 13
        Caption = 'Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label15: TLabel
        Left = 494
        Top = 61
        Width = 49
        Height = 13
        Caption = 'Empresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label16: TLabel
        Left = 471
        Top = 166
        Width = 86
        Height = 13
        Caption = 'Cond. Pagto./Fin.'
      end
      object btnEmpresa: TSpeedButton
        Left = 606
        Top = 58
        Width = 64
        Height = 21
        Cursor = crHandPoint
        Caption = '(F7)'
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
        OnClick = btnEmpresaClick
      end
      object btnFornecedor: TSpeedButton
        Left = 162
        Top = 85
        Width = 64
        Height = 21
        Cursor = crHandPoint
        Caption = '(F7)'
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
        OnClick = btnFornecedorClick
      end
      object btnParcelas: TSpeedButton
        Left = 624
        Top = 163
        Width = 23
        Height = 20
        Caption = '...'
        Enabled = False
        OnClick = btnParcelasClick
      end
      object Label4: TLabel
        Left = 494
        Top = 88
        Width = 27
        Height = 13
        Caption = 'Nome'
      end
      object Label5: TLabel
        Left = 33
        Top = 114
        Width = 61
        Height = 13
        Caption = 'Endere'#231'o/N'#186
      end
      object Label7: TLabel
        Left = 494
        Top = 114
        Width = 28
        Height = 13
        Caption = 'Bairro'
      end
      object Label9: TLabel
        Left = 33
        Top = 140
        Width = 43
        Height = 13
        Caption = 'Munic'#237'pio'
      end
      object Label8: TLabel
        Left = 494
        Top = 140
        Width = 33
        Height = 13
        Caption = 'Estado'
      end
      object Label10: TLabel
        Left = 33
        Top = 166
        Width = 19
        Height = 13
        Caption = 'CEP'
      end
      object Label6: TLabel
        Left = 298
        Top = 166
        Width = 67
        Height = 13
        Caption = 'Prev. Entrega'
      end
      object Label12: TLabel
        Left = 492
        Top = 195
        Width = 49
        Height = 13
        Caption = 'Solicitante'
      end
      object Label13: TLabel
        Left = 292
        Top = 221
        Width = 76
        Height = 13
        Caption = 'Data Solicita'#231#227'o'
      end
      object Label17: TLabel
        Left = 33
        Top = 222
        Width = 31
        Height = 13
        Caption = 'Status'
      end
      object Label18: TLabel
        Left = 494
        Top = 222
        Width = 36
        Height = 13
        Caption = 'Motivo.'
        Visible = False
      end
      object Label30: TLabel
        Left = 33
        Top = 195
        Width = 54
        Height = 13
        Caption = 'Vendedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnFuncionario: TSpeedButton
        Left = 135
        Top = 190
        Width = 64
        Height = 21
        Cursor = crHandPoint
        Caption = '(F7)'
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
        OnClick = btnFuncionarioClick
      end
      object DBText3: TDBText
        Left = 203
        Top = 195
        Width = 133
        Height = 13
        DataField = 'NOME'
        DataSource = DataFuncionario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label32: TLabel
        Left = 218
        Top = 61
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object DBText4: TDBText
        Left = 254
        Top = 61
        Width = 50
        Height = 13
        DataField = 'PEDIDO_ID'
        DataSource = DataTabela
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 857
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object btnPrior: TBitBtn
          Left = 81
          Top = 6
          Width = 75
          Height = 25
          Caption = 'Anterior'
          TabOrder = 0
          OnClick = btnPriorClick
        end
        object btnNext: TBitBtn
          Left = 187
          Top = 6
          Width = 75
          Height = 25
          Caption = 'Pr'#243'ximo'
          TabOrder = 1
          OnClick = btnNextClick
        end
        object btnInsert: TBitBtn
          Left = 293
          Top = 6
          Width = 75
          Height = 25
          Caption = '&Incluir'
          TabOrder = 2
          OnClick = btnInsertClick
        end
        object btnEdit: TBitBtn
          Left = 400
          Top = 6
          Width = 75
          Height = 25
          Caption = 'A&lterar'
          TabOrder = 3
          OnClick = btnEditClick
        end
        object btnDelete: TBitBtn
          Left = 506
          Top = 6
          Width = 75
          Height = 25
          Caption = '&Excluir'
          TabOrder = 4
          OnClick = btnDeleteClick
        end
        object btnSave: TBitBtn
          Left = 612
          Top = 6
          Width = 75
          Height = 25
          Caption = '&Salvar'
          TabOrder = 5
          OnClick = btnSaveClick
        end
        object btnDiscard: TBitBtn
          Left = 719
          Top = 6
          Width = 75
          Height = 25
          Caption = 'C&ancelar'
          TabOrder = 6
          OnClick = btnDiscardClick
        end
      end
      object DT_PEDIDO: TDateEdit
        Left = 112
        Top = 58
        Width = 90
        Height = 21
        CheckOnExit = True
        DialogTitle = 'Selecione a Data'
        Enabled = False
        NumGlyphs = 2
        TabOrder = 1
        OnEnter = DT_PEDIDOEnter
        OnKeyDown = DT_PEDIDOKeyDown
      end
      object EMPRESA_ID: TCurrencyEdit
        Left = 562
        Top = 58
        Width = 40
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0;-0'
        Enabled = False
        TabOrder = 3
        ZeroEmpty = False
        OnExit = EMPRESA_IDExit
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object CLIENTE_ID: TCurrencyEdit
        Left = 112
        Top = 84
        Width = 47
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0;-0'
        Enabled = False
        TabOrder = 4
        ZeroEmpty = False
        OnExit = CLIENTE_IDExit
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object DT_MOVIMENTO: TDateEdit
        Left = 373
        Top = 58
        Width = 90
        Height = 21
        CheckOnExit = True
        DialogTitle = 'Selecione a Data'
        Enabled = False
        NumGlyphs = 2
        TabOrder = 2
        OnEnter = DT_PEDIDOEnter
        OnKeyDown = DT_PEDIDOKeyDown
      end
      object Panel3: TPanel
        Left = 0
        Top = 387
        Width = 836
        Height = 117
        BevelOuter = bvNone
        TabOrder = 22
        object Label21: TLabel
          Left = 687
          Top = 14
          Width = 43
          Height = 13
          Caption = 'Vr. Prod.'
        end
        object Label22: TLabel
          Left = 687
          Top = 93
          Width = 39
          Height = 13
          Caption = 'Vr. Ped.'
        end
        object Label23: TLabel
          Left = 480
          Top = 14
          Width = 53
          Height = 13
          Caption = 'Valor Frete'
        end
        object Label24: TLabel
          Left = 685
          Top = 40
          Width = 44
          Height = 13
          Caption = 'Vr. Desc.'
        end
        object Label25: TLabel
          Left = 685
          Top = 66
          Width = 48
          Height = 13
          Caption = 'Vr. Acr'#233's.'
        end
        object Label26: TLabel
          Left = 33
          Top = 4
          Width = 58
          Height = 13
          Caption = 'Observa'#231#227'o'
        end
        object VALOR_PRODUTOS: TRxCalcEdit
          Left = 734
          Top = 11
          Width = 95
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
          Enabled = False
          NumGlyphs = 2
          ReadOnly = True
          TabOrder = 1
          ZeroEmpty = False
          OnKeyDown = EMPRESA_IDKeyDown
        end
        object VALOR: TRxCalcEdit
          Left = 734
          Top = 89
          Width = 95
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
          Enabled = False
          NumGlyphs = 2
          ReadOnly = True
          TabOrder = 5
          ZeroEmpty = False
          OnKeyDown = EMPRESA_IDKeyDown
        end
        object VR_FRETE: TRxCalcEdit
          Left = 544
          Top = 11
          Width = 95
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
          Enabled = False
          MaxValue = 99999.000000000000000000
          NumGlyphs = 2
          TabOrder = 0
          ZeroEmpty = False
          OnKeyDown = EMPRESA_IDKeyDown
        end
        object VR_DESCONTO: TRxCalcEdit
          Left = 734
          Top = 37
          Width = 95
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
          Enabled = False
          MaxValue = 99999.000000000000000000
          NumGlyphs = 2
          TabOrder = 3
          ZeroEmpty = False
          OnKeyDown = EMPRESA_IDKeyDown
        end
        object VR_ACRESCIMO: TRxCalcEdit
          Left = 734
          Top = 62
          Width = 95
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
          Enabled = False
          MaxValue = 99999.000000000000000000
          NumGlyphs = 2
          TabOrder = 4
          ZeroEmpty = False
          OnKeyDown = EMPRESA_IDKeyDown
        end
        object Observacao: TMemo
          Left = 33
          Top = 23
          Width = 412
          Height = 83
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Lines.Strings = (
            '')
          ParentFont = False
          TabOrder = 2
          WantReturns = False
        end
      end
      object StatusBar1: TStatusBar
        Left = 36
        Top = 369
        Width = 793
        Height = 19
        Align = alNone
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Panels = <
          item
            Text = '<F4> - Exclui Item'
            Width = 196
          end
          item
            Text = '<F5> - Imp. Or'#231'amento'
            Width = 196
          end
          item
            Text = '<F7> - Localiza Produto'
            Width = 196
          end
          item
            Text = '<F9> - Encerra'
            Width = 196
          end>
        UseSystemFont = False
      end
      object COND_PAGTO: TComboBox
        Left = 562
        Top = 163
        Width = 85
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 13
        OnChange = COND_PAGTOChange
        OnKeyDown = EMPRESA_IDKeyDown
        Items.Strings = (
          'A VISTA'
          'A PRAZO'
          'CARTAO')
      end
      object NOME: TEdit
        Left = 562
        Top = 85
        Width = 267
        Height = 21
        Enabled = False
        MaxLength = 40
        TabOrder = 5
        OnKeyDown = DT_PEDIDOKeyDown
      end
      object ENDERECO: TEdit
        Left = 112
        Top = 111
        Width = 301
        Height = 21
        Enabled = False
        MaxLength = 40
        TabOrder = 6
        OnKeyDown = DT_PEDIDOKeyDown
      end
      object BAIRRO: TEdit
        Left = 562
        Top = 111
        Width = 189
        Height = 21
        Enabled = False
        MaxLength = 20
        TabOrder = 8
        OnKeyDown = DT_PEDIDOKeyDown
      end
      object MUNICIPIO: TEdit
        Left = 112
        Top = 137
        Width = 175
        Height = 21
        Enabled = False
        MaxLength = 30
        TabOrder = 9
        OnKeyDown = DT_PEDIDOKeyDown
      end
      object ESTADO: TComboBox
        Left = 562
        Top = 137
        Width = 56
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 2
        ParentFont = False
        TabOrder = 10
        OnKeyDown = EMPRESA_IDKeyDown
        Items.Strings = (
          ''
          'AC'
          'AL'
          'AP'
          'AM'
          'BA'
          'CE'
          'DF'
          'ES'
          'GO'
          'MA'
          'MG'
          'MT'
          'MS'
          'PA'
          'PB'
          'PR'
          'PE'
          'PI'
          'RJ'
          'RN'
          'RS'
          'RO'
          'RR'
          'SC'
          'SP'
          'SE'
          'TO')
      end
      object CEP: TMaskEdit
        Left = 112
        Top = 163
        Width = 67
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
        Enabled = False
        EditMask = '99999-999;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 9
        ParentFont = False
        TabOrder = 11
        Text = '     -   '
        OnKeyDown = DT_PEDIDOKeyDown
      end
      object Pedido: TQuickRep
        Left = 181
        Top = 800
        Width = 794
        Height = 1123
        DataSet = QSub_Detail
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        Functions.Strings = (
          'PAGENUMBER'
          'COLUMNNUMBER'
          'REPORTTITLE')
        Functions.DATA = (
          '0'
          '0'
          #39#39)
        Options = [FirstPageHeader, LastPageFooter]
        Page.Columns = 1
        Page.Orientation = poPortrait
        Page.PaperSize = Default
        Page.Continuous = False
        Page.Values = (
          127.000000000000000000
          2970.000000000000000000
          127.000000000000000000
          2100.000000000000000000
          127.000000000000000000
          127.000000000000000000
          0.000000000000000000)
        PrinterSettings.Copies = 1
        PrinterSettings.OutputBin = First
        PrinterSettings.Duplex = False
        PrinterSettings.FirstPage = 0
        PrinterSettings.LastPage = 0
        PrinterSettings.UseStandardprinter = False
        PrinterSettings.UseCustomBinCode = False
        PrinterSettings.CustomBinCode = 0
        PrinterSettings.ExtendedDuplex = 0
        PrinterSettings.UseCustomPaperCode = False
        PrinterSettings.CustomPaperCode = 0
        PrinterSettings.PrintMetaFile = False
        PrinterSettings.PrintQuality = 0
        PrinterSettings.Collate = 0
        PrinterSettings.ColorOption = 0
        PrintIfEmpty = True
        ReportTitle = 'Pedido'
        SnapToGrid = True
        Units = MM
        Zoom = 100
        PrevFormStyle = fsNormal
        PreviewInitialState = wsMaximized
        PreviewWidth = 500
        PreviewHeight = 500
        PrevInitialZoom = qrZoomToWidth
        PreviewDefaultSaveType = stQRP
        PreviewLeft = 0
        PreviewTop = 0
        object QRBand1: TQRBand
          Left = 48
          Top = 48
          Width = 698
          Height = 153
          AlignToBottom = False
          TransparentBand = False
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            404.812500000000000000
            1846.791666666667000000)
          PreCaluculateBandHeight = False
          KeepOnOnePage = False
          BandType = rbPageHeader
          object QRShape1: TQRShape
            Left = 0
            Top = 51
            Width = 698
            Height = 4
            Size.Values = (
              10.583333333333330000
              0.000000000000000000
              134.937500000000000000
              1846.791666666667000000)
            XLColumn = 0
            Shape = qrsHorLine
            VertAdjust = 0
          end
          object QRLabel6: TQRLabel
            Left = 0
            Top = 74
            Width = 71
            Height = 15
            Size.Values = (
              39.687500000000000000
              0.000000000000000000
              195.791666666666700000
              187.854166666666700000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'Fornecedor'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel9: TQRLabel
            Left = 0
            Top = 91
            Width = 57
            Height = 15
            Size.Values = (
              39.687500000000000000
              0.000000000000000000
              240.770833333333300000
              150.812500000000000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'Endere'#231'o'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel11: TQRLabel
            Left = 0
            Top = 107
            Width = 43
            Height = 15
            Size.Values = (
              39.687500000000000000
              0.000000000000000000
              283.104166666666700000
              113.770833333333300000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'Cidade'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRDBText14: TQRDBText
            Left = 76
            Top = 107
            Width = 64
            Height = 15
            Size.Values = (
              39.687500000000000000
              201.083333333333300000
              283.104166666666700000
              169.333333333333300000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Color = clWhite
            DataSet = QSub_Detail
            DataField = 'MUNICIPIO'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FullJustify = False
            MaxBreakChars = 0
            FontSize = 8
          end
          object QRDBText12: TQRDBText
            Left = 76
            Top = 91
            Width = 57
            Height = 15
            Size.Values = (
              39.687500000000000000
              201.083333333333300000
              240.770833333333300000
              150.812500000000000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Color = clWhite
            DataSet = QSub_Detail
            DataField = 'ENDERECO'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FullJustify = False
            MaxBreakChars = 0
            FontSize = 8
          end
          object QRDBText9: TQRDBText
            Left = 76
            Top = 74
            Width = 29
            Height = 15
            Size.Values = (
              39.687500000000000000
              201.083333333333300000
              195.791666666666700000
              76.729166666666670000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Color = clWhite
            DataSet = QSub_Detail
            DataField = 'NOME'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FullJustify = False
            MaxBreakChars = 0
            FontSize = 8
          end
          object QRDBText13: TQRDBText
            Left = 387
            Top = 91
            Width = 43
            Height = 15
            Size.Values = (
              39.687500000000000000
              1023.937500000000000000
              240.770833333333300000
              113.770833333333300000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Color = clWhite
            DataSet = QSub_Detail
            DataField = 'BAIRRO'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FullJustify = False
            MaxBreakChars = 0
            FontSize = 8
          end
          object QRLabel10: TQRLabel
            Left = 324
            Top = 91
            Width = 43
            Height = 15
            Size.Values = (
              39.687500000000000000
              857.250000000000000000
              240.770833333333300000
              113.770833333333300000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'Bairro'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel12: TQRLabel
            Left = 324
            Top = 107
            Width = 22
            Height = 15
            Size.Values = (
              39.687500000000000000
              857.250000000000000000
              283.104166666666700000
              58.208333333333330000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'CEP'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRDBText15: TQRDBText
            Left = 387
            Top = 107
            Width = 22
            Height = 15
            Size.Values = (
              39.687500000000000000
              1023.937500000000000000
              283.104166666666700000
              58.208333333333330000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Color = clWhite
            DataSet = QSub_Detail
            DataField = 'CEP'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FullJustify = False
            MaxBreakChars = 0
            FontSize = 8
          end
          object QRShape2: TQRShape
            Left = 0
            Top = 124
            Width = 698
            Height = 4
            Size.Values = (
              10.583333333333330000
              0.000000000000000000
              328.083333333333300000
              1846.791666666667000000)
            XLColumn = 0
            Shape = qrsHorLine
            VertAdjust = 0
          end
          object QRLabel18: TQRLabel
            Left = 625
            Top = 130
            Width = 73
            Height = 15
            Size.Values = (
              39.687500000000000000
              1653.645833333333000000
              343.958333333333300000
              193.145833333333300000)
            XLColumn = 0
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            Caption = 'Pr. Total'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel17: TQRLabel
            Left = 520
            Top = 130
            Width = 73
            Height = 15
            Size.Values = (
              39.687500000000000000
              1375.833333333333000000
              343.958333333333300000
              193.145833333333300000)
            XLColumn = 0
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            Caption = 'Pr. Unit.'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel16: TQRLabel
            Left = 374
            Top = 130
            Width = 73
            Height = 15
            Size.Values = (
              39.687500000000000000
              989.541666666666700000
              343.958333333333300000
              193.145833333333300000)
            XLColumn = 0
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            Caption = 'Quantidade'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRShape3: TQRShape
            Left = 0
            Top = 147
            Width = 698
            Height = 4
            Size.Values = (
              10.583333333333330000
              0.000000000000000000
              388.937500000000000000
              1846.791666666667000000)
            XLColumn = 0
            Shape = qrsHorLine
            VertAdjust = 0
          end
          object QRLabel15: TQRLabel
            Left = 88
            Top = 130
            Width = 64
            Height = 15
            Size.Values = (
              39.687500000000000000
              232.833333333333300000
              343.958333333333300000
              169.333333333333300000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'Descri'#231#227'o'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel14: TQRLabel
            Left = 0
            Top = 130
            Width = 65
            Height = 15
            Size.Values = (
              39.687500000000000000
              0.000000000000000000
              343.958333333333300000
              171.979166666666700000)
            XLColumn = 0
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            Caption = 'ID'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRSysData1: TQRSysData
            Left = 0
            Top = 17
            Width = 162
            Height = 15
            Size.Values = (
              39.687500000000000000
              0.000000000000000000
              44.979166666666670000
              428.625000000000000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Color = clWhite
            Data = qrsDateTime
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            Text = 'Data/Hora : '
            Transparent = False
            ExportAs = exptText
            FontSize = 8
          end
          object Cabec: TQRLabel
            Left = 445
            Top = 1
            Width = 253
            Height = 15
            Size.Values = (
              39.687500000000000000
              1177.395833333333000000
              2.645833333333333000
              669.395833333333300000)
            XLColumn = 0
            Alignment = taRightJustify
            AlignToBand = True
            Caption = 'Sistema de Adm. de Empresas - Eficaz'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRSysData2: TQRSysData
            Left = 585
            Top = 17
            Width = 113
            Height = 15
            Size.Values = (
              39.687500000000000000
              1547.812500000000000000
              44.979166666666670000
              298.979166666666700000)
            XLColumn = 0
            Alignment = taRightJustify
            AlignToBand = True
            Color = clWhite
            Data = qrsPageNumber
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            Text = 'P'#225'gina : '
            Transparent = False
            ExportAs = exptText
            FontSize = 8
          end
          object QRLabel3: TQRLabel
            Left = 299
            Top = 34
            Width = 99
            Height = 15
            Size.Values = (
              39.687500000000000000
              791.104166666666700000
              89.958333333333330000
              261.937500000000000000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = True
            Caption = '*** PEDIDO ***'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRDBText1: TQRDBText
            Left = 0
            Top = 1
            Width = 36
            Height = 15
            Size.Values = (
              39.687500000000000000
              0.000000000000000000
              2.645833333333333000
              95.250000000000000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Color = clWhite
            DataSet = FrmPrincipal.QEmpresa
            DataField = 'RAZAO'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FullJustify = False
            MaxBreakChars = 0
            FontSize = 8
          end
          object QRLabel2: TQRLabel
            Left = 0
            Top = 57
            Width = 15
            Height = 15
            Size.Values = (
              39.687500000000000000
              0.000000000000000000
              150.812500000000000000
              39.687500000000000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'ID'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRDBText2: TQRDBText
            Left = 76
            Top = 57
            Width = 64
            Height = 15
            Size.Values = (
              39.687500000000000000
              201.083333333333300000
              150.812500000000000000
              169.333333333333300000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Color = clWhite
            DataSet = QSub_Detail
            DataField = 'PEDIDO_ID'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FullJustify = False
            MaxBreakChars = 0
            FontSize = 8
          end
          object QRLabel1: TQRLabel
            Left = 456
            Top = 130
            Width = 50
            Height = 15
            Size.Values = (
              39.687500000000000000
              1206.500000000000000000
              343.958333333333300000
              132.291666666666700000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'Unidade'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
        end
        object DetailBand1: TQRBand
          Left = 48
          Top = 201
          Width = 698
          Height = 16
          AlignToBottom = False
          TransparentBand = False
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            42.333333333333330000
            1846.791666666667000000)
          PreCaluculateBandHeight = False
          KeepOnOnePage = False
          BandType = rbDetail
          object QRDBText3: TQRDBText
            Left = 0
            Top = 0
            Width = 65
            Height = 15
            Size.Values = (
              39.687500000000000000
              0.000000000000000000
              0.000000000000000000
              171.979166666666700000)
            XLColumn = 0
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            Color = clWhite
            DataSet = QSub_Detail
            DataField = 'PRODUTO_ID'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FullJustify = False
            MaxBreakChars = 0
            FontSize = 8
          end
          object QRDBText4: TQRDBText
            Left = 88
            Top = 0
            Width = 64
            Height = 15
            Size.Values = (
              39.687500000000000000
              232.833333333333300000
              0.000000000000000000
              169.333333333333300000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Color = clWhite
            DataSet = QSub_Detail
            DataField = 'DESCRICAO'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FullJustify = False
            MaxBreakChars = 0
            FontSize = 8
          end
          object QRDBText5: TQRDBText
            Left = 374
            Top = 0
            Width = 73
            Height = 15
            Size.Values = (
              39.687500000000000000
              989.541666666666700000
              0.000000000000000000
              193.145833333333300000)
            XLColumn = 0
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            Color = clWhite
            DataSet = QSub_Detail
            DataField = 'QUANTIDADE'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            Mask = '#,##0.00'
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FullJustify = False
            MaxBreakChars = 0
            FontSize = 8
          end
          object QRDBText6: TQRDBText
            Left = 520
            Top = 0
            Width = 73
            Height = 15
            Size.Values = (
              39.687500000000000000
              1375.833333333333000000
              0.000000000000000000
              193.145833333333300000)
            XLColumn = 0
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            Color = clWhite
            DataSet = QSub_Detail
            DataField = 'VR_UNITARIO'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            Mask = '#,##0.00'
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FullJustify = False
            MaxBreakChars = 0
            FontSize = 8
          end
          object QRDBText7: TQRDBText
            Left = 625
            Top = 0
            Width = 73
            Height = 15
            Size.Values = (
              39.687500000000000000
              1653.645833333333000000
              0.000000000000000000
              193.145833333333300000)
            XLColumn = 0
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            Color = clWhite
            DataSet = QSub_Detail
            DataField = 'VR_TOTAL'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            Mask = '#,##0.00'
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FullJustify = False
            MaxBreakChars = 0
            FontSize = 8
          end
          object QRDBText10: TQRDBText
            Left = 456
            Top = 0
            Width = 50
            Height = 15
            Size.Values = (
              39.687500000000000000
              1206.500000000000000000
              0.000000000000000000
              132.291666666666700000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Color = clWhite
            DataSet = QSub_Detail
            DataField = 'UNIDADE'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FullJustify = False
            MaxBreakChars = 0
            FontSize = 8
          end
        end
        object QRBand2: TQRBand
          Left = 48
          Top = 217
          Width = 698
          Height = 133
          AlignToBottom = False
          TransparentBand = False
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            351.895833333333300000
            1846.791666666667000000)
          PreCaluculateBandHeight = False
          KeepOnOnePage = False
          BandType = rbSummary
          object QRLabel19: TQRLabel
            Left = 480
            Top = 56
            Width = 127
            Height = 15
            Size.Values = (
              39.687500000000000000
              1270.000000000000000000
              148.166666666666700000
              336.020833333333300000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'Total do Or'#231'amento'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRDBText8: TQRDBText
            Left = 625
            Top = 56
            Width = 73
            Height = 15
            Size.Values = (
              39.687500000000000000
              1653.645833333333000000
              148.166666666666700000
              193.145833333333300000)
            XLColumn = 0
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            Color = clWhite
            DataField = 'VALOR'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            Mask = '#,##0.00'
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FullJustify = False
            MaxBreakChars = 0
            FontSize = 8
          end
          object QRLabel25: TQRLabel
            Left = 480
            Top = 39
            Width = 57
            Height = 15
            Size.Values = (
              39.687500000000000000
              1270.000000000000000000
              103.187500000000000000
              150.812500000000000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'Desconto'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel26: TQRLabel
            Left = 480
            Top = 5
            Width = 120
            Height = 15
            Size.Values = (
              39.687500000000000000
              1270.000000000000000000
              13.229166666666670000
              317.500000000000000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'Total do Produtos'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRDBText23: TQRDBText
            Left = 625
            Top = 39
            Width = 73
            Height = 15
            Size.Values = (
              39.687500000000000000
              1653.645833333333000000
              103.187500000000000000
              193.145833333333300000)
            XLColumn = 0
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            Color = clWhite
            DataField = 'VR_DESCONTO'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            Mask = '#,##0.00'
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FullJustify = False
            MaxBreakChars = 0
            FontSize = 8
          end
          object QRDBText24: TQRDBText
            Left = 625
            Top = 22
            Width = 73
            Height = 15
            Size.Values = (
              39.687500000000000000
              1653.645833333333000000
              58.208333333333330000
              193.145833333333300000)
            XLColumn = 0
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            Color = clWhite
            DataField = 'VR_ACRESCIMO'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            Mask = '#,##0.00'
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FullJustify = False
            MaxBreakChars = 0
            FontSize = 8
          end
          object QRShape5: TQRShape
            Left = 625
            Top = 1
            Width = 73
            Height = 4
            Size.Values = (
              10.583333333333330000
              1653.645833333333000000
              2.645833333333333000
              193.145833333333300000)
            XLColumn = 0
            Shape = qrsHorLine
            VertAdjust = 0
          end
          object QRExpr1: TQRExpr
            Left = 625
            Top = 5
            Width = 73
            Height = 15
            Size.Values = (
              39.687500000000000000
              1653.645833333333000000
              13.229166666666670000
              193.145833333333300000)
            XLColumn = 0
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            Color = clWhite
            Master = Pedido
            ParentFont = False
            ResetAfterPrint = False
            Transparent = False
            Expression = 'Sum(VR_TOTAL)'
            Mask = '#,##0.00'
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel4: TQRLabel
            Left = 480
            Top = 22
            Width = 64
            Height = 15
            Size.Values = (
              39.687500000000000000
              1270.000000000000000000
              58.208333333333330000
              169.333333333333300000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'Acr'#233'scimo'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel28: TQRLabel
            Left = 131
            Top = 99
            Width = 435
            Height = 15
            Size.Values = (
              39.687500000000000000
              346.604166666666700000
              261.937500000000000000
              1150.937500000000000000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = True
            Caption = '______________________________________________________________'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel29: TQRLabel
            Left = 275
            Top = 116
            Width = 148
            Height = 15
            Size.Values = (
              39.687500000000000000
              727.604166666666700000
              306.916666666666700000
              391.583333333333300000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = True
            Caption = 'Assinatura do Cliente'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
        end
      end
      object DT_ENTREGA: TDateEdit
        Left = 373
        Top = 163
        Width = 90
        Height = 21
        CheckOnExit = True
        DialogTitle = 'Selecione a Data'
        Enabled = False
        NumGlyphs = 2
        TabOrder = 12
        OnEnter = DT_PEDIDOEnter
        OnKeyDown = DT_PEDIDOKeyDown
      end
      object DT_SOLICITACAO: TDateEdit
        Left = 373
        Top = 216
        Width = 90
        Height = 21
        CheckOnExit = True
        DialogTitle = 'Selecione a Data'
        Enabled = False
        NumGlyphs = 2
        TabOrder = 17
        OnEnter = DT_PEDIDOEnter
        OnKeyDown = DT_PEDIDOKeyDown
      end
      object Status: TComboBox
        Left = 112
        Top = 219
        Width = 90
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 2
        ParentFont = False
        TabOrder = 18
        Text = 'NORMAL'
        OnChange = StatusChange
        OnKeyDown = EMPRESA_IDKeyDown
        Items.Strings = (
          'NORMAL'
          'CANCELADO'
          '')
      end
      object Cancelamento: TEdit
        Left = 562
        Top = 219
        Width = 267
        Height = 21
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 40
        ParentFont = False
        TabOrder = 19
        Visible = False
        OnKeyDown = DT_PEDIDOKeyDown
      end
      object Itens: TDBGrid
        Left = 36
        Top = 246
        Width = 793
        Height = 125
        DataSource = DataSub_Detail
        Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
        TabOrder = 20
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnColEnter = ItensColEnter
        OnColExit = ItensColExit
        OnEnter = ItensEnter
        OnExit = ItensExit
        OnKeyDown = ItensKeyDown
        OnKeyPress = ItensKeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'PRODUTO_ID'
            Title.Alignment = taRightJustify
            Title.Caption = 'Prod.'
            Width = 45
            Visible = True
          end
          item
            Color = clSilver
            Expanded = False
            FieldName = 'DESCRICAO'
            ReadOnly = True
            Title.Caption = 'Descri'#231#227'o'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QUANTIDADE'
            Title.Alignment = taRightJustify
            Title.Caption = 'Quant.'
            Width = 50
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'UNIDADE'
            Title.Alignment = taRightJustify
            Title.Caption = 'Unid.'
            Width = 43
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VR_UNITARIO'
            ReadOnly = True
            Title.Alignment = taRightJustify
            Title.Caption = 'Vr. Unit.'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VR_DESCONTO'
            Title.Alignment = taRightJustify
            Title.Caption = 'Vr. Desc.'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VR_TOTAL'
            Title.Alignment = taRightJustify
            Title.Caption = 'Vr. Total'
            Width = 60
            Visible = True
          end>
      end
      object Solicitante: TEdit
        Left = 562
        Top = 190
        Width = 267
        Height = 21
        Enabled = False
        MaxLength = 20
        TabOrder = 16
        OnKeyDown = DT_PEDIDOKeyDown
      end
      object Funcionario_id: TCurrencyEdit
        Left = 112
        Top = 190
        Width = 47
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0;-0'
        Enabled = False
        TabOrder = 15
        ZeroEmpty = False
        OnExit = Funcionario_idExit
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object FINALIZADORA_ID: TDBLookupComboBox
        Left = 700
        Top = 163
        Width = 129
        Height = 21
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        KeyField = 'Finalizadora_ID'
        ListField = 'Legenda'
        ListFieldIndex = 1
        ListSource = DataFinalizadora
        ParentFont = False
        TabOrder = 14
      end
      object NUMERO: TEdit
        Left = 419
        Top = 111
        Width = 56
        Height = 21
        Enabled = False
        MaxLength = 6
        TabOrder = 7
        OnKeyDown = DT_PEDIDOKeyDown
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 531
    Width = 865
    Height = 40
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnRetorna: TBitBtn
      Left = 743
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
      TabOrder = 3
      OnClick = btnRetornaClick
    end
    object AUTORIZ_ID: TCurrencyEdit
      Left = 391
      Top = 10
      Width = 47
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = '0;-0'
      Enabled = False
      TabOrder = 5
      Visible = False
      ZeroEmpty = False
      OnExit = CLIENTE_IDExit
      OnKeyDown = EMPRESA_IDKeyDown
    end
    object btnPesquisa: TBitBtn
      Left = 506
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Pesquisa'
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
      TabOrder = 0
      OnClick = btnPesquisaClick
    end
    object btnPedido: TBitBtn
      Left = 586
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Impr. Pe&d.'
      TabOrder = 1
      OnClick = btnPedidoClick
    end
    object CheckBox1: TCheckBox
      Left = 344
      Top = 14
      Width = 104
      Height = 17
      Caption = 'Imp. HP/Samsung'
      TabOrder = 6
    end
    object TP_PEDIDO: TCurrencyEdit
      Left = 287
      Top = 10
      Width = 47
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = '0;-0'
      Enabled = False
      TabOrder = 4
      Visible = False
      ZeroEmpty = False
      OnExit = CLIENTE_IDExit
      OnKeyDown = EMPRESA_IDKeyDown
    end
    object btnLog: TButton
      Left = 665
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Gerar Log'
      TabOrder = 2
      OnClick = btnLogClick
    end
  end
  object DataTabela: TDataSource
    AutoEdit = False
    DataSet = QTabela
    Left = 16
    Top = 550
  end
  object DataEmpresa: TDataSource
    DataSet = QEmpresa
    Left = 56
    Top = 550
  end
  object DataSub_Detail: TDataSource
    DataSet = QSub_Detail
    Left = 88
    Top = 550
  end
  object RDprint1: TRDprint
    ImpressoraPersonalizada.NomeImpressora = 'Modelo Personalizado - (Epson)'
    ImpressoraPersonalizada.AvancaOitavos = '27 48'
    ImpressoraPersonalizada.AvancaSextos = '27 50'
    ImpressoraPersonalizada.SaltoPagina = '12'
    ImpressoraPersonalizada.TamanhoPagina = '27 67 66'
    ImpressoraPersonalizada.Negrito = '27 69'
    ImpressoraPersonalizada.Italico = '27 52'
    ImpressoraPersonalizada.Sublinhado = '27 45 49'
    ImpressoraPersonalizada.Expandido = '27 14'
    ImpressoraPersonalizada.Normal10 = '18 27 80'
    ImpressoraPersonalizada.Comprimir12 = '18 27 77'
    ImpressoraPersonalizada.Comprimir17 = '27 80 27 15'
    ImpressoraPersonalizada.Comprimir20 = '27 77 27 15'
    ImpressoraPersonalizada.Reset = '27 80 18 20 27 53 27 70 27 45 48'
    ImpressoraPersonalizada.Inicializar = '27 64'
    OpcoesPreview.PaginaZebrada = False
    OpcoesPreview.Remalina = False
    OpcoesPreview.CaptionPreview = 'Rdprint Preview'
    OpcoesPreview.PreviewZoom = 100
    OpcoesPreview.CorPapelPreview = clWhite
    OpcoesPreview.CorLetraPreview = clBlack
    OpcoesPreview.Preview = False
    OpcoesPreview.BotaoSetup = Ativo
    OpcoesPreview.BotaoImprimir = Ativo
    OpcoesPreview.BotaoGravar = Ativo
    OpcoesPreview.BotaoLer = Ativo
    OpcoesPreview.BotaoProcurar = Ativo
    OpcoesPreview.BotaoPDF = Ativo
    OpcoesPreview.BotaoEMAIL = Ativo
    Margens.Left = 10
    Margens.Right = 10
    Margens.Top = 10
    Margens.Bottom = 10
    Autor = Deltress
    RegistroUsuario.NomeRegistro = 'EFICAZ AUTOMA'#199'O E SISTEMAS LTDA '
    RegistroUsuario.SerieProduto = 'GROUP-0214/02002'
    RegistroUsuario.AutorizacaoKey = 'HE4F-X2AQ-8IYJ-211Q-IGUV'
    About = 'RDprint 5.0 - Registrado'
    Acentuacao = Transliterate
    CaptionSetup = 'Rdprint Setup'
    TitulodoRelatorio = 'Gerado por RDprint'
    UsaGerenciadorImpr = True
    CorForm = clBtnFace
    CorFonte = clBlack
    Impressora = Epson
    Mapeamento.Strings = (
      '//--- Grafico Compativel com Windows/USB ---//'
      '//'
      'GRAFICO=GRAFICO'
      'HP=GRAFICO'
      'DESKJET=GRAFICO'
      'LASERJET=GRAFICO'
      'INKJET=GRAFICO'
      'STYLUS=GRAFICO'
      'EPL=GRAFICO'
      'USB=GRAFICO'
      '//'
      '//--- Linha Epson Matricial 9 e 24 agulhas ---//'
      '//'
      'EPSON=EPSON'
      'GENERIC=EPSON'
      'TEXT=EPSON'
      'LX-300=EPSON'
      'LX-810=EPSON'
      'FX-2170=EPSON'
      'FX-1170=EPSON'
      'LQ-1170=EPSON'
      'LQ-2170=EPSON'
      'OKIDATA=EPSON'
      '//'
      '//--- Rima e Emilia ---//'
      '//'
      'RIMA=RIMA'
      'EMILIA=RIMA'
      '//'
      '//--- Linha HP/Xerox padr'#227'o PCL ---//'
      '//'
      'PCL=HP'
      '//'
      '//--- Impressoras 40 Colunas ---//'
      '//'
      'DARUMA=BOBINA'
      'SIGTRON=BOBINA'
      'SWEDA=BOBINA'
      'BEMATECH=BOBINA')
    MostrarProgresso = True
    TamanhoQteLinhas = 66
    TamanhoQteColunas = 80
    TamanhoQteLPP = Seis
    NumerodeCopias = 1
    FonteTamanhoPadrao = S10cpp
    FonteEstiloPadrao = []
    Orientacao = poPortrait
    OnNewPage = RDprint1NewPage
    OnBeforeNewPage = RDprint1BeforeNewPage
    Left = 232
    Top = 544
  end
  object DataFuncionario: TDataSource
    DataSet = QFuncionario
    Left = 160
    Top = 552
  end
  object DataFinalizadora: TDataSource
    DataSet = QFinalizadora
    Left = 195
    Top = 546
  end
  object QVencimento: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT CLIENTES.CLIENTE_ID, TRANSPARCELAS.DT_VENCIMENTO'
      'FROM CLIENTES CLIENTES'
      'INNER JOIN TRANSACOES TRANSACOES'
      'ON (CLIENTES.CLIENTE_ID = TRANSACOES.CLIENTE_ID)'
      'INNER JOIN TRANSPARCELAS TRANSPARCELAS'
      'ON (TRANSACOES.TRANSACAO_ID = TRANSPARCELAS.TRANSACAO_ID)'
      'WHERE'
      '(CLIENTES.CLIENTE_ID = :CLIENTE_ID)'
      'AND (TRANSPARCELAS.DT_VENCIMENTO <= :DT_VENCIMENTO)'
      'AND (TRANSPARCELAS.VALOR > 0)'
      'AND (TRANSPARCELAS.BANCO_ID = 0)'
      
        'AND ((TRANSPARCELAS.AGRUPAMENTO = 0) OR (TRANSPARCELAS.AGRUPAMEN' +
        'TO IS NULL))'
      'AND (TRANSPARCELAS.TIPO_TRANSACAO ='#39'T'#39')'
      'AND (TRANSACOES.COND_PAGTO = '#39'A PRAZO'#39')'
      'ORDER BY DT_VENCIMENTO')
    Left = 328
    Top = 544
    ParamData = <
      item
        Name = 'CLIENTE_ID'
        ParamType = ptInput
      end
      item
        Name = 'DT_VENCIMENTO'
        ParamType = ptInput
      end>
  end
  object QRel: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 296
    Top = 544
  end
  object QLimite: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT CLIENTES.CLIENTE_ID, SUM(TRANSPARCELAS.VALOR) AS DEBITO'
      'FROM CLIENTES CLIENTES'
      'INNER JOIN TRANSACOES TRANSACOES'
      'ON (CLIENTES.CLIENTE_ID = TRANSACOES.CLIENTE_ID)'
      'INNER JOIN TRANSPARCELAS TRANSPARCELAS'
      'ON (TRANSACOES.TRANSACAO_ID = TRANSPARCELAS.TRANSACAO_ID)'
      'WHERE'
      '(CLIENTES.CLIENTE_ID = :CLIENTE_ID)'
      'AND (TRANSPARCELAS.DT_VENCIMENTO <= :DT_VENCIMENTO)'
      'AND (TRANSPARCELAS.VALOR > 0)'
      'AND (TRANSPARCELAS.BANCO_ID = 0)'
      
        'AND ((TRANSPARCELAS.AGRUPAMENTO = 0) OR (TRANSPARCELAS.AGRUPAMEN' +
        'TO IS NULL))'
      'AND (TRANSPARCELAS.TIPO_TRANSACAO ='#39'T'#39')'
      'AND (TRANSACOES.COND_PAGTO = '#39'A PRAZO'#39')'
      'GROUP BY CLIENTES.CLIENTE_ID')
    Left = 264
    Top = 544
    ParamData = <
      item
        Name = 'CLIENTE_ID'
        ParamType = ptInput
      end
      item
        Name = 'DT_VENCIMENTO'
        ParamType = ptInput
      end>
  end
  object QFinalizadora: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM FINALIZADORAS')
    Left = 328
    Top = 496
  end
  object QFuncionario: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM FUNCIONARIOS'
      'WHERE'
      '(FUNCIONARIO_ID = :FUNCIONARIO_ID)'
      'AND (STATUS = '#39'A'#39')')
    Left = 296
    Top = 496
    ParamData = <
      item
        Name = 'FUNCIONARIO_ID'
        ParamType = ptInput
      end>
  end
  object QUpdate: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 264
    Top = 496
  end
  object QTributo: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM TRIBUTOS'
      'WHERE'
      '(TRIBUTO_ID = :TRIBUTO_ID)')
    Left = 232
    Top = 496
    ParamData = <
      item
        Name = 'TRIBUTO_ID'
        ParamType = ptInput
      end>
  end
  object QProduto: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM PRODUTOS'
      'WHERE'
      '(PRODUTO_ID = :PRODUTO_ID)'
      'AND (EMPRESA_ID = :EMPRESA_ID)'
      'AND (STATUS = '#39'A'#39')')
    Left = 200
    Top = 496
    ParamData = <
      item
        Name = 'PRODUTO_ID'
        ParamType = ptInput
      end
      item
        Name = 'EMPRESA_ID'
        ParamType = ptInput
      end>
  end
  object QCliente: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM CLIENTES'
      'WHERE'
      '(CLIENTE_ID = :CLIENTE_ID)'
      'AND (STATUS = '#39'A'#39')')
    Left = 168
    Top = 496
    ParamData = <
      item
        Name = 'CLIENTE_ID'
        ParamType = ptInput
      end>
  end
  object QSub_Detail: TFDQuery
    AfterOpen = QSub_DetailAfterOpen
    BeforeInsert = QSub_DetailBeforeInsert
    BeforeEdit = QSub_DetailBeforeEdit
    BeforePost = QSub_DetailBeforePost
    BeforeDelete = QSub_DetailBeforeDelete
    OnNewRecord = QSub_DetailNewRecord
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM PEDITENS'
      'WHERE'
      '(PEDIDO_ID = :PEDIDO_ID)')
    Left = 136
    Top = 496
    ParamData = <
      item
        Name = 'PEDIDO_ID'
        ParamType = ptInput
      end>
  end
  object QEmpresa: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM EMPRESAS'
      'WHERE'
      '(EMPRESA_ID = :EMPRESA_ID)'
      'AND (STATUS = '#39'A'#39')')
    Left = 96
    Top = 496
    ParamData = <
      item
        Name = 'EMPRESA_ID'
        ParamType = ptInput
      end>
  end
  object IQuery: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 56
    Top = 496
  end
  object QTabela: TFDQuery
    AfterOpen = QTabelaAfterOpen
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evMode, evItems, evRecsMax, evCache, evCursorKind, evAutoFetchAll]
    FetchOptions.CursorKind = ckDefault
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      ''
      'SELECT * FROM PEDIDOS')
    Left = 16
    Top = 496
  end
  object USql_PedItens: TFDUpdateSQL
    InsertSQL.Strings = (
      'insert into PEDITENS'
      
        '  (ALIQUOTA_ICMS, BASE_CALC_ICMS, CST, DESCRICAO, MVA, PEDIDO_ID' +
        ', PRODUTO_ID, '
      
        '   QUANTIDADE, TP_PROD_SERV, TRIBUTO_ID, UNIDADE, VR_DESCONTO, V' +
        'R_IPI, '
      '   VR_TOTAL, VR_UNITARIO)'
      'values'
      
        '  (:ALIQUOTA_ICMS, :BASE_CALC_ICMS, :CST, :DESCRICAO, :MVA, :PED' +
        'IDO_ID, '
      
        '   :PRODUTO_ID, :QUANTIDADE, :TP_PROD_SERV, :TRIBUTO_ID, :UNIDAD' +
        'E, :VR_DESCONTO, '
      '   :VR_IPI, :VR_TOTAL, :VR_UNITARIO)')
    ModifySQL.Strings = (
      'update PEDITENS'
      'set'
      '  ALIQUOTA_ICMS = :ALIQUOTA_ICMS,'
      '  BASE_CALC_ICMS = :BASE_CALC_ICMS,'
      '  CST = :CST,'
      '  DESCRICAO = :DESCRICAO,'
      '  MVA = :MVA,'
      '  PEDIDO_ID = :PEDIDO_ID,'
      '  PRODUTO_ID = :PRODUTO_ID,'
      '  QUANTIDADE = :QUANTIDADE,'
      '  TP_PROD_SERV = :TP_PROD_SERV,'
      '  TRIBUTO_ID = :TRIBUTO_ID,'
      '  UNIDADE = :UNIDADE,'
      '  VR_DESCONTO = :VR_DESCONTO,'
      '  VR_IPI = :VR_IPI,'
      '  VR_TOTAL = :VR_TOTAL,'
      '  VR_UNITARIO = :VR_UNITARIO'
      'where'
      '  PEDIDO_ID = :OLD_PEDIDO_ID and'
      '  PRODUTO_ID = :OLD_PRODUTO_ID and'
      '  TP_PROD_SERV = :OLD_TP_PROD_SERV')
    DeleteSQL.Strings = (
      'delete from PEDITENS'
      'where'
      '  PEDIDO_ID = :OLD_PEDIDO_ID and'
      '  PRODUTO_ID = :OLD_PRODUTO_ID and'
      '  TP_PROD_SERV = :OLD_TP_PROD_SERV')
    FetchRowSQL.Strings = (
      'Select '
      '  PEDIDO_ID,'
      '  PRODUTO_ID,'
      '  TP_PROD_SERV,'
      '  DESCRICAO,'
      '  TRIBUTO_ID,'
      '  CST,'
      '  MVA,'
      '  BASE_CALC_ICMS,'
      '  ALIQUOTA_ICMS,'
      '  VR_IPI,'
      '  QUANTIDADE,'
      '  UNIDADE,'
      '  VR_UNITARIO,'
      '  VR_DESCONTO,'
      '  VR_TOTAL'
      'from PEDITENS '
      'where'
      '  PEDIDO_ID = :PEDIDO_ID and'
      '  PRODUTO_ID = :PRODUTO_ID and'
      '  TP_PROD_SERV = :TP_PROD_SERV')
    Left = 124
    Top = 547
  end
end
