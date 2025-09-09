object FrmOrdem_Servico_Salao: TFrmOrdem_Servico_Salao
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Trans. de Estoque - Ordem de Servi'#231'o Sal'#227'o'
  ClientHeight = 625
  ClientWidth = 731
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 731
    Height = 586
    ActivePage = Manutencao
    Align = alClient
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
        Width = 723
        Height = 518
        Align = alClient
        Color = clInfoBk
        DataSource = DataTabela
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick]
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
        OnKeyDown = DBGrid1KeyDown
        OnKeyPress = DBGrid1KeyPress
        OnTitleClick = DBGrid1TitleClick
        Columns = <
          item
            Expanded = False
            FieldName = 'ORDEM_ID'
            Title.Caption = 'C'#243'digo'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_ORDEM'
            Title.Caption = 'Dt. Ordem'
            Width = 79
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_MOVIMENTO'
            Title.Caption = 'Dt. Movimento'
            Width = 79
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_CLIENTE'
            Title.Caption = 'Nome'
            Width = 227
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'STATUS'
            Title.Caption = 'Status'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO_ATENDIMENTO'
            Title.Caption = 'Tipo Atendimento'
            Visible = True
          end>
      end
      object Dias: TTabSet
        Left = 0
        Top = 537
        Width = 723
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
      object StatusBar2: TStatusBar
        Left = 0
        Top = 518
        Width = 723
        Height = 19
        Panels = <
          item
            Text = '<F5> - Localizar p/ N'#250'mero da OS'
            Width = 240
          end
          item
            Text = '<F7> - Localizar p/ Nome do Cliente'
            Width = 240
          end
          item
            Text = '<F4> - Localizar p/ N'#250'mero de Serie'
            Width = 240
          end>
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
        Left = 304
        Top = 415
        Width = 184
        Height = 13
        DataField = 'RAZAO'
        DataSource = DataEmpresa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object DBText2: TDBText
        Left = 202
        Top = 86
        Width = 189
        Height = 13
        DataField = 'NOME'
        DataSource = DataCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 2
        Top = 57
        Width = 50
        Height = 13
        Caption = 'Dt. Ordem'
      end
      object Label2: TLabel
        Left = 206
        Top = 57
        Width = 52
        Height = 13
        Caption = 'Dt. Movim.'
      end
      object Label3: TLabel
        Left = 2
        Top = 86
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
        Left = 104
        Top = 415
        Width = 49
        Height = 13
        Caption = 'Empresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object Label16: TLabel
        Left = 2
        Top = 194
        Width = 31
        Height = 13
        Caption = 'Status'
      end
      object btnEmpresa: TSpeedButton
        Left = 237
        Top = 412
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
        Visible = False
        OnClick = btnEmpresaClick
      end
      object btnCliente: TSpeedButton
        Left = 134
        Top = 83
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
        OnClick = btnClienteClick
      end
      object Label27: TLabel
        Left = 496
        Top = 219
        Width = 45
        Height = 13
        Caption = 'Comiss'#227'o'
      end
      object Label4: TLabel
        Left = 2
        Top = 110
        Width = 27
        Height = 13
        Caption = 'Nome'
      end
      object Label5: TLabel
        Left = 2
        Top = 139
        Width = 74
        Height = 13
        Caption = 'Endere'#231'o/Num.'
      end
      object Label7: TLabel
        Left = 399
        Top = 139
        Width = 28
        Height = 13
        Caption = 'Bairro'
      end
      object Label9: TLabel
        Left = 2
        Top = 165
        Width = 43
        Height = 13
        Caption = 'Munic'#237'pio'
      end
      object Label6: TLabel
        Left = 399
        Top = 57
        Width = 28
        Height = 13
        Caption = 'Horas'
      end
      object Label11: TLabel
        Left = 627
        Top = 57
        Width = 48
        Height = 13
        Caption = 'Prioridade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object Label12: TLabel
        Left = 399
        Top = 166
        Width = 42
        Height = 13
        Caption = 'Telefone'
      end
      object Label18: TLabel
        Left = 399
        Top = 194
        Width = 63
        Height = 13
        Caption = 'Dt./Hr. Prev.'
      end
      object btnAgenda: TSpeedButton
        Left = 626
        Top = 191
        Width = 23
        Height = 20
        Caption = '...'
        Enabled = False
        OnClick = btnAgendaClick
      end
      object Label31: TLabel
        Left = 202
        Top = 193
        Width = 59
        Height = 13
        Caption = 'Dt. Fecham.'
      end
      object DBText4: TDBText
        Left = 543
        Top = 57
        Width = 81
        Height = 13
        DataField = 'ORDEM_ID'
        DataSource = DataTabela
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label32: TLabel
        Left = 528
        Top = 57
        Width = 11
        Height = 13
        Caption = 'ID'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label26: TLabel
        Left = 2
        Top = 219
        Width = 65
        Height = 13
        Caption = 'Profissional'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnVendedor: TSpeedButton
        Left = 135
        Top = 215
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
        OnClick = btnVendedorClick
      end
      object DBText6: TDBText
        Left = 203
        Top = 219
        Width = 258
        Height = 13
        DataField = 'NOME'
        DataSource = DataVendedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 397
        Top = 86
        Width = 64
        Height = 13
        Caption = 'Cond. Pagto.'
      end
      object btnParcelas: TSpeedButton
        Left = 589
        Top = 84
        Width = 23
        Height = 20
        Caption = '...'
        Enabled = False
        OnClick = btnParcelasClick
      end
      object Label14: TLabel
        Left = 1
        Top = 378
        Width = 78
        Height = 13
        Caption = 'Resumo Agenda'
      end
      object Label29: TLabel
        Left = 564
        Top = 167
        Width = 45
        Height = 13
        Caption = 'C. Custo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object btnCentro_Custo: TSpeedButton
        Left = 661
        Top = 164
        Width = 54
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
        Visible = False
        OnClick = btnCentro_CustoClick
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 723
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
          Left = 112
          Top = 6
          Width = 75
          Height = 25
          Caption = 'Pr'#243'ximo'
          TabOrder = 1
          OnClick = btnNextClick
        end
        object btnInsert: TBitBtn
          Left = 218
          Top = 6
          Width = 75
          Height = 25
          Caption = '&Incluir'
          TabOrder = 2
          OnClick = btnInsertClick
        end
        object btnEdit: TBitBtn
          Left = 325
          Top = 6
          Width = 75
          Height = 25
          Caption = 'A&lterar'
          TabOrder = 3
          OnClick = btnEditClick
        end
        object btnDelete: TBitBtn
          Left = 431
          Top = 6
          Width = 75
          Height = 25
          Caption = '&Excluir'
          TabOrder = 4
          OnClick = btnDeleteClick
        end
        object btnSave: TBitBtn
          Left = 537
          Top = 6
          Width = 75
          Height = 25
          Caption = '&Salvar'
          TabOrder = 5
          OnClick = btnSaveClick
        end
        object btnDiscard: TBitBtn
          Left = 644
          Top = 6
          Width = 75
          Height = 25
          Caption = 'C&ancelar'
          TabOrder = 6
          OnClick = btnDiscardClick
        end
      end
      object DT_ORDEM: TDateEdit
        Left = 85
        Top = 54
        Width = 90
        Height = 21
        CheckOnExit = True
        DialogTitle = 'Selecione a Data'
        Enabled = False
        NumGlyphs = 2
        TabOrder = 1
        OnEnter = DT_ORDEMEnter
        OnKeyDown = DT_ORDEMKeyDown
      end
      object EMPRESA_ID: TCurrencyEdit
        Left = 187
        Top = 412
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
        OnExit = EMPRESA_IDExit
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object CLIENTE_ID: TCurrencyEdit
        Left = 84
        Top = 83
        Width = 47
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0;-0'
        Enabled = False
        TabOrder = 6
        ZeroEmpty = False
        OnExit = CLIENTE_IDExit
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object DT_MOVIMENTO: TDateEdit
        Left = 274
        Top = 54
        Width = 90
        Height = 21
        CheckOnExit = True
        DialogTitle = 'Selecione a Data'
        Enabled = False
        NumGlyphs = 2
        TabOrder = 2
        OnEnter = DT_ORDEMEnter
        OnKeyDown = DT_ORDEMKeyDown
      end
      object Panel3: TPanel
        Left = 0
        Top = 407
        Width = 1370
        Height = 143
        BevelOuter = bvNone
        TabOrder = 22
        object Label21: TLabel
          Left = 578
          Top = 44
          Width = 42
          Height = 13
          Caption = 'Vr. Itens'
        end
        object Label22: TLabel
          Left = 578
          Top = 96
          Width = 39
          Height = 13
          Caption = 'Vr. Ord.'
        end
        object Label24: TLabel
          Left = 578
          Top = 70
          Width = 44
          Height = 13
          Caption = 'Vr. Desc.'
        end
        object VALOR_ITENS: TRxCalcEdit
          Left = 625
          Top = 41
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
          Left = 625
          Top = 93
          Width = 95
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
          Enabled = False
          NumGlyphs = 2
          ReadOnly = True
          TabOrder = 3
          ZeroEmpty = False
          OnKeyDown = EMPRESA_IDKeyDown
        end
        object DESCONTO: TRxCalcEdit
          Left = 625
          Top = 67
          Width = 95
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
          Enabled = False
          MaxValue = 99999.000000000000000000
          NumGlyphs = 2
          TabOrder = 2
          ZeroEmpty = False
          OnKeyDown = EMPRESA_IDKeyDown
        end
        object VALOR_SERVICOS: TRxCalcEdit
          Left = 431
          Top = 9
          Width = 95
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
          Enabled = False
          NumGlyphs = 2
          ReadOnly = True
          TabOrder = 4
          Visible = False
          ZeroEmpty = False
          OnKeyDown = EMPRESA_IDKeyDown
        end
        object VALOR_PECAS: TRxCalcEdit
          Left = 431
          Top = 34
          Width = 95
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
          Enabled = False
          NumGlyphs = 2
          ReadOnly = True
          TabOrder = 5
          Visible = False
          ZeroEmpty = False
          OnKeyDown = EMPRESA_IDKeyDown
        end
        object PageControl2: TPageControl
          Left = 7
          Top = 6
          Width = 565
          Height = 130
          ActivePage = OrcDados
          TabOrder = 0
          object OrcDados: TTabSheet
            Caption = 'Dados'
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
            object Label19: TLabel
              Left = 1
              Top = 10
              Width = 57
              Height = 13
              Caption = 'Dt. Retorno'
            end
            object Label23: TLabel
              Left = 1
              Top = 37
              Width = 58
              Height = 13
              Caption = 'Observa'#231#227'o'
            end
            object Label20: TLabel
              Left = 166
              Top = 10
              Width = 35
              Height = 13
              Caption = 'Servi'#231'o'
            end
            object OBSERVACAO: TMemo
              Left = 65
              Top = 34
              Width = 476
              Height = 65
              MaxLength = 240
              TabOrder = 0
            end
            object DT_RETORNO: TDateEdit
              Left = 65
              Top = 7
              Width = 90
              Height = 21
              CheckOnExit = True
              DialogTitle = 'Selecione a Data'
              Enabled = False
              NumGlyphs = 2
              TabOrder = 1
              OnEnter = DT_ORDEMEnter
              OnKeyDown = DT_ORDEMKeyDown
            end
            object GARANTIA: TEdit
              Left = 213
              Top = 7
              Width = 328
              Height = 21
              Enabled = False
              MaxLength = 50
              TabOrder = 2
              OnKeyDown = DT_ORDEMKeyDown
            end
          end
        end
      end
      object StatusBar1: TStatusBar
        Left = 5
        Top = 347
        Width = 713
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
            Width = 237
          end
          item
            Text = '<F7> - Localiza Produto'
            Width = 237
          end
          item
            Text = '<F9> - Encerra'
            Width = 239
          end>
        UseSystemFont = False
      end
      object Itens: TDBGrid
        Left = 4
        Top = 243
        Width = 713
        Height = 103
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
            FieldName = 'TP_PROD_SERV'
            Title.Caption = 'P/S'
            Width = 35
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGO_ITEM'
            Title.Alignment = taRightJustify
            Title.Caption = 'Prod.'
            Width = 50
            Visible = True
          end
          item
            Color = clSilver
            Expanded = False
            FieldName = 'DESCRICAO'
            ReadOnly = True
            Title.Caption = 'Descri'#231#227'o'
            Width = 206
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QUANTIDADE'
            Title.Alignment = taRightJustify
            Title.Caption = 'Quant.'
            Width = 59
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VR_UNITARIO'
            Title.Alignment = taRightJustify
            Title.Caption = 'Vr. Unit.'
            Width = 54
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VR_DESCONTO'
            Title.Alignment = taRightJustify
            Title.Caption = 'Vr. Desc.'
            Width = 54
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VR_TOTAL'
            Title.Alignment = taRightJustify
            Title.Caption = 'Vr. Total'
            Visible = True
          end>
      end
      object STATUS: TComboBox
        Left = 85
        Top = 190
        Width = 114
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 15
        ParentFont = False
        TabOrder = 14
        OnChange = STATUSChange
        OnKeyDown = EMPRESA_IDKeyDown
        Items.Strings = (
          'ABERTA'
          'AGENDADA'
          'CANCELADA'
          'EXECUTADA'
          'IMPRODUTIVA'
          'PENDENTE')
      end
      object COMISSAO: TRxCalcEdit
        Left = 564
        Top = 215
        Width = 85
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DisplayFormat = '0.00;-0.00'
        Enabled = False
        MaxValue = 99999.000000000000000000
        NumGlyphs = 2
        TabOrder = 18
        ZeroEmpty = False
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object NOME_CLIENTE: TEdit
        Left = 85
        Top = 110
        Width = 252
        Height = 21
        Enabled = False
        MaxLength = 70
        TabOrder = 8
        OnKeyDown = DT_ORDEMKeyDown
      end
      object ENDERECO: TEdit
        Left = 85
        Top = 136
        Width = 236
        Height = 21
        Enabled = False
        MaxLength = 60
        TabOrder = 9
        OnKeyDown = DT_ORDEMKeyDown
      end
      object BAIRRO: TEdit
        Left = 467
        Top = 136
        Width = 189
        Height = 21
        Enabled = False
        MaxLength = 40
        TabOrder = 11
        OnKeyDown = DT_ORDEMKeyDown
      end
      object MUNICIPIO: TEdit
        Left = 85
        Top = 162
        Width = 175
        Height = 21
        Enabled = False
        MaxLength = 30
        TabOrder = 12
        OnKeyDown = DT_ORDEMKeyDown
      end
      object HORAS: TMaskEdit
        Left = 467
        Top = 54
        Width = 56
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
        Enabled = False
        EditMask = '!90:00;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 5
        ParentFont = False
        TabOrder = 3
        Text = '  :  '
        OnKeyDown = DT_ORDEMKeyDown
      end
      object NO_ORDEM: TCurrencyEdit
        Left = 680
        Top = 54
        Width = 19
        Height = 21
        Hint = 
          '1 - Alta Prioridade - (A)'#13#10'2 - M'#233'dia Prioridade - (B)'#13#10'3 - Baixa' +
          ' Prioridade - (C)'
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0;-0'
        Enabled = False
        MaxValue = 3.000000000000000000
        MinValue = 1.000000000000000000
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        Value = 1.000000000000000000
        Visible = False
        ZeroEmpty = False
        OnExit = NO_ORDEMExit
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object TELEFONE: TMaskEdit
        Left = 467
        Top = 163
        Width = 84
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 13
        Text = ''
        OnKeyDown = DT_ORDEMKeyDown
      end
      object HORA_ATEND: TMaskEdit
        Left = 564
        Top = 191
        Width = 56
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
        Enabled = False
        EditMask = '!90:00;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 5
        ParentFont = False
        TabOrder = 16
        Text = '  :  '
        OnKeyDown = DT_ORDEMKeyDown
      end
      object PREV_ATEND: TDateEdit
        Left = 467
        Top = 191
        Width = 90
        Height = 21
        CheckOnExit = True
        DialogTitle = 'Selecione a Data'
        Enabled = False
        NumGlyphs = 2
        TabOrder = 15
        OnEnter = DT_ORDEMEnter
        OnKeyDown = DT_ORDEMKeyDown
      end
      object Check_List: TQuickRep
        Left = -4
        Top = 800
        Width = 794
        Height = 1123
        DataSet = QCheckList_Moto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
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
        ReportTitle = 'Ordem de Servi'#231'o'
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
        object QRBand3: TQRBand
          Left = 48
          Top = 48
          Width = 698
          Height = 761
          AlignToBottom = False
          BeforePrint = QRBand3BeforePrint
          TransparentBand = False
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            2013.479166666667000000
            1846.791666666667000000)
          PreCaluculateBandHeight = False
          KeepOnOnePage = False
          BandType = rbPageHeader
          object QRShape7: TQRShape
            Left = 0
            Top = 46
            Width = 698
            Height = 4
            Size.Values = (
              10.583333333333330000
              0.000000000000000000
              121.708333333333300000
              1846.791666666667000000)
            XLColumn = 0
            Shape = qrsHorLine
            VertAdjust = 0
          end
          object QRLabel25: TQRLabel
            Left = 0
            Top = 50
            Width = 33
            Height = 15
            Size.Values = (
              39.687500000000000000
              0.000000000000000000
              132.291666666666700000
              87.312500000000000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'Cliente'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel26: TQRLabel
            Left = 0
            Top = 65
            Width = 45
            Height = 15
            Size.Values = (
              39.687500000000000000
              0.000000000000000000
              171.979166666666700000
              119.062500000000000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'Insc. Est.'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel31: TQRLabel
            Left = 0
            Top = 80
            Width = 47
            Height = 15
            Size.Values = (
              39.687500000000000000
              0.000000000000000000
              211.666666666666700000
              124.354166666666700000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'Endere'#231'o'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel32: TQRLabel
            Left = 0
            Top = 95
            Width = 34
            Height = 15
            Size.Values = (
              39.687500000000000000
              0.000000000000000000
              251.354166666666700000
              89.958333333333330000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'Cidade'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRDBText23: TQRDBText
            Left = 52
            Top = 95
            Width = 50
            Height = 15
            Size.Values = (
              39.687500000000000000
              137.583333333333300000
              251.354166666666700000
              132.291666666666700000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Color = clWhite
            DataSet = QCheckList_Moto
            DataField = 'MUNICIPIO'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FullJustify = False
            MaxBreakChars = 0
            FontSize = 8
          end
          object QRDBText24: TQRDBText
            Left = 52
            Top = 80
            Width = 55
            Height = 15
            Size.Values = (
              39.687500000000000000
              137.583333333333300000
              211.666666666666700000
              145.520833333333300000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Color = clWhite
            DataSet = QCheckList_Moto
            DataField = 'ENDERECO'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FullJustify = False
            MaxBreakChars = 0
            FontSize = 8
          end
          object QRDBText29: TQRDBText
            Left = 52
            Top = 65
            Width = 56
            Height = 15
            Size.Values = (
              39.687500000000000000
              137.583333333333300000
              171.979166666666700000
              148.166666666666700000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Color = clWhite
            DataSet = QCheckList_Moto
            DataField = 'INSCRICAO'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FullJustify = False
            MaxBreakChars = 0
            FontSize = 8
          end
          object QRDBText30: TQRDBText
            Left = 51
            Top = 49
            Width = 76
            Height = 15
            Size.Values = (
              39.687500000000000000
              134.937500000000000000
              129.645833333333300000
              201.083333333333300000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Color = clWhite
            DataSet = QCheckList_Moto
            DataField = 'NOME_CLIENTE'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FullJustify = False
            MaxBreakChars = 0
            FontSize = 8
          end
          object QRLabel33: TQRLabel
            Left = 324
            Top = 65
            Width = 48
            Height = 15
            Size.Values = (
              39.687500000000000000
              857.250000000000000000
              171.979166666666700000
              127.000000000000000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'CNPJ/CPF'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRDBText31: TQRDBText
            Left = 384
            Top = 65
            Width = 26
            Height = 15
            Size.Values = (
              39.687500000000000000
              1016.000000000000000000
              171.979166666666700000
              68.791666666666670000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Color = clWhite
            DataSet = QCheckList_Moto
            DataField = 'CNPJ'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FullJustify = False
            MaxBreakChars = 0
            FontSize = 8
          end
          object QRDBText32: TQRDBText
            Left = 384
            Top = 80
            Width = 40
            Height = 15
            Size.Values = (
              39.687500000000000000
              1016.000000000000000000
              211.666666666666700000
              105.833333333333300000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Color = clWhite
            DataSet = QCheckList_Moto
            DataField = 'BAIRRO'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FullJustify = False
            MaxBreakChars = 0
            FontSize = 8
          end
          object QRLabel34: TQRLabel
            Left = 324
            Top = 80
            Width = 30
            Height = 15
            Size.Values = (
              39.687500000000000000
              857.250000000000000000
              211.666666666666700000
              79.375000000000000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'Bairro'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel35: TQRLabel
            Left = 324
            Top = 95
            Width = 20
            Height = 15
            Size.Values = (
              39.687500000000000000
              857.250000000000000000
              251.354166666666700000
              52.916666666666670000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'CEP'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRDBText33: TQRDBText
            Left = 384
            Top = 95
            Width = 20
            Height = 15
            Size.Values = (
              39.687500000000000000
              1016.000000000000000000
              251.354166666666700000
              52.916666666666670000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Color = clWhite
            DataSet = QCheckList_Moto
            DataField = 'CEP'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FullJustify = False
            MaxBreakChars = 0
            FontSize = 8
          end
          object QRLabel36: TQRLabel
            Left = 480
            Top = 95
            Width = 43
            Height = 15
            Size.Values = (
              39.687500000000000000
              1270.000000000000000000
              251.354166666666700000
              113.770833333333300000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'Telefone'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRDBText34: TQRDBText
            Left = 528
            Top = 95
            Width = 52
            Height = 15
            Size.Values = (
              39.687500000000000000
              1397.000000000000000000
              251.354166666666700000
              137.583333333333300000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Color = clWhite
            DataSet = QCheckList_Moto
            DataField = 'TELEFONE'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FullJustify = False
            MaxBreakChars = 0
            FontSize = 8
          end
          object QRShape8: TQRShape
            Left = 0
            Top = 180
            Width = 698
            Height = 4
            Size.Values = (
              10.583333333333330000
              0.000000000000000000
              476.250000000000000000
              1846.791666666667000000)
            XLColumn = 0
            Shape = qrsHorLine
            VertAdjust = 0
          end
          object QRLabel37: TQRLabel
            Left = 456
            Top = 184
            Width = 154
            Height = 15
            Size.Values = (
              39.687500000000000000
              1206.500000000000000000
              486.833333333333300000
              407.458333333333400000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = 'Combust'#237'vel'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel38: TQRLabel
            Left = 136
            Top = 184
            Width = 204
            Height = 15
            Size.Values = (
              39.687500000000000000
              359.833333333333400000
              486.833333333333300000
              539.750000000000000000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = 'Check List'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRSysData3: TQRSysData
            Left = 0
            Top = 16
            Width = 113
            Height = 15
            Size.Values = (
              39.687500000000000000
              0.000000000000000000
              42.333333333333330000
              298.979166666666700000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Color = clWhite
            Data = qrsDateTime
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Text = 'Data/Hora : '
            Transparent = False
            ExportAs = exptText
            FontSize = 8
          end
          object QRLabel39: TQRLabel
            Left = 510
            Top = 1
            Width = 188
            Height = 15
            Size.Values = (
              39.687500000000000000
              1349.375000000000000000
              2.645833333333333000
              497.416666666666700000)
            XLColumn = 0
            Alignment = taRightJustify
            AlignToBand = True
            Caption = 'Sistema de Adm. de Empresas - Eficaz'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRSysData4: TQRSysData
            Left = 618
            Top = 16
            Width = 80
            Height = 15
            Size.Values = (
              39.687500000000000000
              1635.125000000000000000
              42.333333333333330000
              211.666666666666700000)
            XLColumn = 0
            Alignment = taRightJustify
            AlignToBand = True
            Color = clWhite
            Data = qrsPageNumber
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Text = 'P'#225'gina : '
            Transparent = False
            ExportAs = exptText
            FontSize = 8
          end
          object QRLabel40: TQRLabel
            Left = 302
            Top = 31
            Width = 94
            Height = 15
            Size.Values = (
              39.687500000000000000
              799.041666666666700000
              82.020833333333330000
              248.708333333333300000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = True
            Caption = '*** CHECK LIST ***'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRDBText35: TQRDBText
            Left = 0
            Top = 1
            Width = 39
            Height = 15
            Size.Values = (
              39.687500000000000000
              0.000000000000000000
              2.645833333333333000
              103.187500000000000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Color = clWhite
            DataSet = FrmPrincipal.QEmpresa
            DataField = 'RAZAO'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FullJustify = False
            MaxBreakChars = 0
            FontSize = 8
          end
          object QRShape9: TQRShape
            Left = 0
            Top = 110
            Width = 698
            Height = 4
            Size.Values = (
              10.583333333333330000
              0.000000000000000000
              291.041666666666700000
              1846.791666666667000000)
            XLColumn = 0
            Shape = qrsHorLine
            VertAdjust = 0
          end
          object QRLabel41: TQRLabel
            Left = 0
            Top = 114
            Width = 35
            Height = 15
            Size.Values = (
              39.687500000000000000
              0.000000000000000000
              301.625000000000000000
              92.604166666666670000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'Modelo'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel42: TQRLabel
            Left = 0
            Top = 131
            Width = 18
            Height = 15
            Size.Values = (
              39.687500000000000000
              0.000000000000000000
              346.604166666666700000
              47.625000000000000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'Cor'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel43: TQRLabel
            Left = 0
            Top = 148
            Width = 21
            Height = 15
            Size.Values = (
              39.687500000000000000
              0.000000000000000000
              391.583333333333300000
              55.562500000000000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'Ano'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel44: TQRLabel
            Left = 0
            Top = 165
            Width = 27
            Height = 15
            Size.Values = (
              39.687500000000000000
              0.000000000000000000
              436.562500000000000000
              71.437500000000000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'Placa'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel45: TQRLabel
            Left = 216
            Top = 165
            Width = 16
            Height = 15
            Size.Values = (
              39.687500000000000000
              571.500000000000000000
              436.562500000000000000
              42.333333333333330000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'KM'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel46: TQRLabel
            Left = 324
            Top = 50
            Width = 23
            Height = 15
            Size.Values = (
              39.687500000000000000
              857.250000000000000000
              132.291666666666700000
              60.854166666666670000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'Data'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRDBText36: TQRDBText
            Left = 384
            Top = 50
            Width = 56
            Height = 15
            Size.Values = (
              39.687500000000000000
              1016.000000000000000000
              132.291666666666700000
              148.166666666666700000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Color = clWhite
            DataSet = QCheckList_Moto
            DataField = 'DT_ORDEM'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FullJustify = False
            MaxBreakChars = 0
            FontSize = 8
          end
          object QRLabel47: TQRLabel
            Left = 480
            Top = 50
            Width = 30
            Height = 15
            Size.Values = (
              39.687500000000000000
              1270.000000000000000000
              132.291666666666700000
              79.375000000000000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'Horas'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRDBText37: TQRDBText
            Left = 528
            Top = 50
            Width = 38
            Height = 15
            Size.Values = (
              39.687500000000000000
              1397.000000000000000000
              132.291666666666700000
              100.541666666666700000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Color = clWhite
            DataSet = QCheckList_Moto
            DataField = 'HORAS'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FullJustify = False
            MaxBreakChars = 0
            FontSize = 8
          end
          object QRLabel48: TQRLabel
            Left = 136
            Top = 218
            Width = 60
            Height = 15
            Size.Values = (
              39.687500000000000000
              359.833333333333400000
              576.791666666666700000
              158.750000000000000000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = 'Conservado'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel49: TQRLabel
            Left = 208
            Top = 218
            Width = 60
            Height = 15
            Size.Values = (
              39.687500000000000000
              550.333333333333400000
              576.791666666666700000
              158.750000000000000000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = 'Arranhado'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel50: TQRLabel
            Left = 280
            Top = 218
            Width = 60
            Height = 15
            Size.Values = (
              39.687500000000000000
              740.833333333333400000
              576.791666666666700000
              158.750000000000000000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = 'Quebrado'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel51: TQRLabel
            Left = 136
            Top = 201
            Width = 60
            Height = 15
            Size.Values = (
              39.687500000000000000
              359.833333333333400000
              531.812500000000000000
              158.750000000000000000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel52: TQRLabel
            Left = 208
            Top = 201
            Width = 60
            Height = 15
            Size.Values = (
              39.687500000000000000
              550.333333333333300000
              531.812500000000000000
              158.750000000000000000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel53: TQRLabel
            Left = 280
            Top = 201
            Width = 60
            Height = 15
            Size.Values = (
              39.687500000000000000
              740.833333333333400000
              531.812500000000000000
              158.750000000000000000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel54: TQRLabel
            Left = 456
            Top = 201
            Width = 42
            Height = 15
            Size.Values = (
              39.687500000000000000
              1206.500000000000000000
              531.812500000000000000
              111.125000000000000000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel55: TQRLabel
            Left = 512
            Top = 201
            Width = 42
            Height = 15
            Size.Values = (
              39.687500000000000000
              1354.666666666667000000
              531.812500000000000000
              111.125000000000000000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel56: TQRLabel
            Left = 568
            Top = 201
            Width = 42
            Height = 15
            Size.Values = (
              39.687500000000000000
              1502.833333333333000000
              531.812500000000000000
              111.125000000000000000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel57: TQRLabel
            Left = 456
            Top = 218
            Width = 42
            Height = 15
            Size.Values = (
              39.687500000000000000
              1206.500000000000000000
              576.791666666666700000
              111.125000000000000000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '4/4'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel58: TQRLabel
            Left = 512
            Top = 218
            Width = 42
            Height = 15
            Size.Values = (
              39.687500000000000000
              1354.666666666667000000
              576.791666666666700000
              111.125000000000000000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '1/2'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel59: TQRLabel
            Left = 568
            Top = 218
            Width = 42
            Height = 15
            Size.Values = (
              39.687500000000000000
              1502.833333333333000000
              576.791666666666700000
              111.125000000000000000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = 'Reserva'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel60: TQRLabel
            Left = 0
            Top = 252
            Width = 114
            Height = 15
            Size.Values = (
              39.687500000000000000
              0.000000000000000000
              666.750000000000000000
              301.625000000000000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'Estado Geral da Pintura'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel61: TQRLabel
            Left = 0
            Top = 269
            Width = 118
            Height = 15
            Size.Values = (
              39.687500000000000000
              0.000000000000000000
              711.729166666666700000
              312.208333333333300000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'Tampa Lateral Esquerda'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel62: TQRLabel
            Left = 0
            Top = 286
            Width = 102
            Height = 15
            Size.Values = (
              39.687500000000000000
              0.000000000000000000
              756.708333333333300000
              269.875000000000000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'Tampa Lateral Direita'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel63: TQRLabel
            Left = 0
            Top = 303
            Width = 98
            Height = 15
            Size.Values = (
              39.687500000000000000
              0.000000000000000000
              801.687500000000000000
              259.291666666666700000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'Tanque Combust'#237'vel'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel64: TQRLabel
            Left = 0
            Top = 320
            Width = 90
            Height = 15
            Size.Values = (
              39.687500000000000000
              0.000000000000000000
              846.666666666666700000
              238.125000000000000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'Paralama Dianteiro'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel65: TQRLabel
            Left = 0
            Top = 337
            Width = 100
            Height = 15
            Size.Values = (
              39.687500000000000000
              0.000000000000000000
              891.645833333333300000
              264.583333333333300000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'Retrovisor Esquerdo'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel66: TQRLabel
            Left = 0
            Top = 354
            Width = 84
            Height = 15
            Size.Values = (
              39.687500000000000000
              0.000000000000000000
              936.625000000000000000
              222.250000000000000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'Retrovisor Direito'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel67: TQRLabel
            Left = 0
            Top = 371
            Width = 70
            Height = 15
            Size.Values = (
              39.687500000000000000
              0.000000000000000000
              981.604166666666700000
              185.208333333333300000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'Pisca Traseiro'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel68: TQRLabel
            Left = 0
            Top = 388
            Width = 72
            Height = 15
            Size.Values = (
              39.687500000000000000
              0.000000000000000000
              1026.583333333333000000
              190.500000000000000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'Pisca Dianteiro'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel69: TQRLabel
            Left = 0
            Top = 405
            Width = 40
            Height = 15
            Size.Values = (
              39.687500000000000000
              0.000000000000000000
              1071.562500000000000000
              105.833333333333300000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'Farolete'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel70: TQRLabel
            Left = 0
            Top = 422
            Width = 36
            Height = 15
            Size.Values = (
              39.687500000000000000
              0.000000000000000000
              1116.541666666667000000
              95.250000000000000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'Manete'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel71: TQRLabel
            Left = 0
            Top = 439
            Width = 44
            Height = 15
            Size.Values = (
              39.687500000000000000
              0.000000000000000000
              1161.520833333333000000
              116.416666666666700000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'Manicoto'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel72: TQRLabel
            Left = 0
            Top = 456
            Width = 97
            Height = 15
            Size.Values = (
              39.687500000000000000
              0.000000000000000000
              1206.500000000000000000
              256.645833333333300000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'Jogo de Ferramenta'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel73: TQRLabel
            Left = 0
            Top = 473
            Width = 44
            Height = 15
            Size.Values = (
              39.687500000000000000
              0.000000000000000000
              1251.479166666667000000
              116.416666666666700000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'El'#225'sticos'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel74: TQRLabel
            Left = 0
            Top = 490
            Width = 35
            Height = 15
            Size.Values = (
              39.687500000000000000
              0.000000000000000000
              1296.458333333333000000
              92.604166666666670000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'Flanela'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel75: TQRLabel
            Left = 136
            Top = 252
            Width = 60
            Height = 15
            Size.Values = (
              39.687500000000000000
              359.833333333333400000
              666.750000000000000000
              158.750000000000000000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel76: TQRLabel
            Left = 208
            Top = 252
            Width = 60
            Height = 15
            Size.Values = (
              39.687500000000000000
              550.333333333333400000
              666.750000000000000000
              158.750000000000000000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel77: TQRLabel
            Left = 280
            Top = 252
            Width = 60
            Height = 15
            Size.Values = (
              39.687500000000000000
              740.833333333333400000
              666.750000000000000000
              158.750000000000000000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel78: TQRLabel
            Left = 136
            Top = 269
            Width = 60
            Height = 15
            Size.Values = (
              39.687500000000000000
              359.833333333333400000
              711.729166666666700000
              158.750000000000000000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel79: TQRLabel
            Left = 208
            Top = 269
            Width = 60
            Height = 15
            Size.Values = (
              39.687500000000000000
              550.333333333333400000
              711.729166666666700000
              158.750000000000000000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel80: TQRLabel
            Left = 280
            Top = 269
            Width = 60
            Height = 15
            Size.Values = (
              39.687500000000000000
              740.833333333333400000
              711.729166666666700000
              158.750000000000000000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel81: TQRLabel
            Left = 136
            Top = 286
            Width = 60
            Height = 15
            Size.Values = (
              39.687500000000000000
              359.833333333333400000
              756.708333333333400000
              158.750000000000000000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel82: TQRLabel
            Left = 208
            Top = 286
            Width = 60
            Height = 15
            Size.Values = (
              39.687500000000000000
              550.333333333333400000
              756.708333333333400000
              158.750000000000000000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel83: TQRLabel
            Left = 280
            Top = 286
            Width = 60
            Height = 15
            Size.Values = (
              39.687500000000000000
              740.833333333333400000
              756.708333333333400000
              158.750000000000000000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel84: TQRLabel
            Left = 136
            Top = 303
            Width = 60
            Height = 15
            Size.Values = (
              39.687500000000000000
              359.833333333333400000
              801.687500000000100000
              158.750000000000000000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel85: TQRLabel
            Left = 208
            Top = 303
            Width = 60
            Height = 15
            Size.Values = (
              39.687500000000000000
              550.333333333333400000
              801.687500000000100000
              158.750000000000000000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel86: TQRLabel
            Left = 280
            Top = 303
            Width = 60
            Height = 15
            Size.Values = (
              39.687500000000000000
              740.833333333333400000
              801.687500000000100000
              158.750000000000000000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel87: TQRLabel
            Left = 136
            Top = 320
            Width = 60
            Height = 15
            Size.Values = (
              39.687500000000000000
              359.833333333333400000
              846.666666666666600000
              158.750000000000000000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel88: TQRLabel
            Left = 208
            Top = 320
            Width = 60
            Height = 15
            Size.Values = (
              39.687500000000000000
              550.333333333333400000
              846.666666666666600000
              158.750000000000000000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel89: TQRLabel
            Left = 280
            Top = 320
            Width = 60
            Height = 15
            Size.Values = (
              39.687500000000000000
              740.833333333333400000
              846.666666666666600000
              158.750000000000000000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel90: TQRLabel
            Left = 136
            Top = 337
            Width = 60
            Height = 15
            Size.Values = (
              39.687500000000000000
              359.833333333333400000
              891.645833333333300000
              158.750000000000000000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel91: TQRLabel
            Left = 208
            Top = 337
            Width = 60
            Height = 15
            Size.Values = (
              39.687500000000000000
              550.333333333333400000
              891.645833333333300000
              158.750000000000000000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel92: TQRLabel
            Left = 280
            Top = 337
            Width = 60
            Height = 15
            Size.Values = (
              39.687500000000000000
              740.833333333333400000
              891.645833333333300000
              158.750000000000000000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel93: TQRLabel
            Left = 136
            Top = 354
            Width = 60
            Height = 15
            Size.Values = (
              39.687500000000000000
              359.833333333333400000
              936.625000000000100000
              158.750000000000000000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel94: TQRLabel
            Left = 208
            Top = 354
            Width = 60
            Height = 15
            Size.Values = (
              39.687500000000000000
              550.333333333333400000
              936.625000000000100000
              158.750000000000000000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel95: TQRLabel
            Left = 280
            Top = 354
            Width = 60
            Height = 15
            Size.Values = (
              39.687500000000000000
              740.833333333333400000
              936.625000000000100000
              158.750000000000000000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel96: TQRLabel
            Left = 136
            Top = 371
            Width = 60
            Height = 15
            Size.Values = (
              39.687500000000000000
              359.833333333333400000
              981.604166666666700000
              158.750000000000000000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel97: TQRLabel
            Left = 208
            Top = 371
            Width = 60
            Height = 15
            Size.Values = (
              39.687500000000000000
              550.333333333333400000
              981.604166666666700000
              158.750000000000000000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel98: TQRLabel
            Left = 280
            Top = 371
            Width = 60
            Height = 15
            Size.Values = (
              39.687500000000000000
              740.833333333333400000
              981.604166666666700000
              158.750000000000000000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel99: TQRLabel
            Left = 136
            Top = 388
            Width = 60
            Height = 15
            Size.Values = (
              39.687500000000000000
              359.833333333333400000
              1026.583333333333000000
              158.750000000000000000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel100: TQRLabel
            Left = 208
            Top = 388
            Width = 60
            Height = 15
            Size.Values = (
              39.687500000000000000
              550.333333333333400000
              1026.583333333333000000
              158.750000000000000000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel101: TQRLabel
            Left = 280
            Top = 388
            Width = 60
            Height = 15
            Size.Values = (
              39.687500000000000000
              740.833333333333400000
              1026.583333333333000000
              158.750000000000000000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel102: TQRLabel
            Left = 136
            Top = 405
            Width = 60
            Height = 15
            Size.Values = (
              39.687500000000000000
              359.833333333333400000
              1071.562500000000000000
              158.750000000000000000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel103: TQRLabel
            Left = 208
            Top = 405
            Width = 60
            Height = 15
            Size.Values = (
              39.687500000000000000
              550.333333333333400000
              1071.562500000000000000
              158.750000000000000000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel104: TQRLabel
            Left = 280
            Top = 405
            Width = 60
            Height = 15
            Size.Values = (
              39.687500000000000000
              740.833333333333400000
              1071.562500000000000000
              158.750000000000000000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel105: TQRLabel
            Left = 136
            Top = 422
            Width = 60
            Height = 15
            Size.Values = (
              39.687500000000000000
              359.833333333333400000
              1116.541666666667000000
              158.750000000000000000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel106: TQRLabel
            Left = 208
            Top = 422
            Width = 60
            Height = 15
            Size.Values = (
              39.687500000000000000
              550.333333333333400000
              1116.541666666667000000
              158.750000000000000000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel107: TQRLabel
            Left = 280
            Top = 422
            Width = 60
            Height = 15
            Size.Values = (
              39.687500000000000000
              740.833333333333400000
              1116.541666666667000000
              158.750000000000000000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel108: TQRLabel
            Left = 136
            Top = 439
            Width = 60
            Height = 15
            Size.Values = (
              39.687500000000000000
              359.833333333333400000
              1161.520833333333000000
              158.750000000000000000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel109: TQRLabel
            Left = 208
            Top = 439
            Width = 60
            Height = 15
            Size.Values = (
              39.687500000000000000
              550.333333333333400000
              1161.520833333333000000
              158.750000000000000000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel110: TQRLabel
            Left = 280
            Top = 439
            Width = 60
            Height = 15
            Size.Values = (
              39.687500000000000000
              740.833333333333400000
              1161.520833333333000000
              158.750000000000000000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel111: TQRLabel
            Left = 136
            Top = 456
            Width = 60
            Height = 15
            Size.Values = (
              39.687500000000000000
              359.833333333333400000
              1206.500000000000000000
              158.750000000000000000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel112: TQRLabel
            Left = 280
            Top = 456
            Width = 60
            Height = 15
            Size.Values = (
              39.687500000000000000
              740.833333333333400000
              1206.500000000000000000
              158.750000000000000000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel113: TQRLabel
            Left = 136
            Top = 473
            Width = 60
            Height = 15
            Size.Values = (
              39.687500000000000000
              359.833333333333400000
              1251.479166666667000000
              158.750000000000000000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel114: TQRLabel
            Left = 280
            Top = 473
            Width = 60
            Height = 15
            Size.Values = (
              39.687500000000000000
              740.833333333333400000
              1251.479166666667000000
              158.750000000000000000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel115: TQRLabel
            Left = 136
            Top = 490
            Width = 60
            Height = 15
            Size.Values = (
              39.687500000000000000
              359.833333333333400000
              1296.458333333333000000
              158.750000000000000000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel116: TQRLabel
            Left = 280
            Top = 490
            Width = 60
            Height = 15
            Size.Values = (
              39.687500000000000000
              740.833333333333400000
              1296.458333333333000000
              158.750000000000000000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel117: TQRLabel
            Left = 352
            Top = 456
            Width = 24
            Height = 15
            Size.Values = (
              39.687500000000000000
              931.333333333333300000
              1206.500000000000000000
              63.500000000000000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'N'#195'O'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel118: TQRLabel
            Left = 352
            Top = 473
            Width = 24
            Height = 15
            Size.Values = (
              39.687500000000000000
              931.333333333333300000
              1251.479166666667000000
              63.500000000000000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'N'#195'O'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel119: TQRLabel
            Left = 352
            Top = 490
            Width = 24
            Height = 15
            Size.Values = (
              39.687500000000000000
              931.333333333333300000
              1296.458333333333000000
              63.500000000000000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'N'#195'O'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel120: TQRLabel
            Left = 208
            Top = 456
            Width = 18
            Height = 15
            Size.Values = (
              39.687500000000000000
              550.333333333333300000
              1206.500000000000000000
              47.625000000000000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'SIM'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel121: TQRLabel
            Left = 208
            Top = 473
            Width = 18
            Height = 15
            Size.Values = (
              39.687500000000000000
              550.333333333333300000
              1251.479166666667000000
              47.625000000000000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'SIM'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel122: TQRLabel
            Left = 208
            Top = 490
            Width = 18
            Height = 15
            Size.Values = (
              39.687500000000000000
              550.333333333333300000
              1296.458333333333000000
              47.625000000000000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'SIM'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel123: TQRLabel
            Left = 416
            Top = 252
            Width = 40
            Height = 15
            Size.Values = (
              39.687500000000000000
              1100.666666666667000000
              666.750000000000000000
              105.833333333333300000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'Revis'#227'o'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel124: TQRLabel
            Left = 416
            Top = 269
            Width = 45
            Height = 15
            Size.Values = (
              39.687500000000000000
              1100.666666666667000000
              711.729166666666700000
              119.062500000000000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'Lavagem'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel125: TQRLabel
            Left = 416
            Top = 286
            Width = 109
            Height = 15
            Size.Values = (
              39.687500000000000000
              1100.666666666667000000
              756.708333333333300000
              288.395833333333300000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'Troca de Transmiss'#227'o'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel126: TQRLabel
            Left = 416
            Top = 303
            Width = 84
            Height = 15
            Size.Values = (
              39.687500000000000000
              1100.666666666667000000
              801.687500000000000000
              222.250000000000000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'Troca de Dire'#231#227'o'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel127: TQRLabel
            Left = 416
            Top = 320
            Width = 115
            Height = 15
            Size.Values = (
              39.687500000000000000
              1100.666666666667000000
              846.666666666666700000
              304.270833333333300000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'Troca Retentor Bengala'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel128: TQRLabel
            Left = 416
            Top = 337
            Width = 109
            Height = 15
            Size.Values = (
              39.687500000000000000
              1100.666666666667000000
              891.645833333333300000
              288.395833333333300000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'Troca Rolam. Dianteiro'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel129: TQRLabel
            Left = 416
            Top = 354
            Width = 107
            Height = 15
            Size.Values = (
              39.687500000000000000
              1100.666666666667000000
              936.625000000000000000
              283.104166666666700000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'Troca Rolam. Traseiro'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel130: TQRLabel
            Left = 416
            Top = 371
            Width = 125
            Height = 15
            Size.Values = (
              39.687500000000000000
              1100.666666666667000000
              981.604166666666700000
              330.729166666666700000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'Troca Retent. Embreagem'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel131: TQRLabel
            Left = 416
            Top = 388
            Width = 28
            Height = 15
            Size.Values = (
              39.687500000000000000
              1100.666666666667000000
              1026.583333333333000000
              74.083333333333330000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'Motor'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel132: TQRLabel
            Left = 416
            Top = 405
            Width = 106
            Height = 15
            Size.Values = (
              39.687500000000000000
              1100.666666666667000000
              1071.562500000000000000
              280.458333333333300000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'Trocar Patim Dianteiro'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel133: TQRLabel
            Left = 416
            Top = 422
            Width = 110
            Height = 15
            Size.Values = (
              39.687500000000000000
              1100.666666666667000000
              1116.541666666667000000
              291.041666666666700000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'Trocar Patim Transeiro'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel134: TQRLabel
            Left = 416
            Top = 439
            Width = 128
            Height = 15
            Size.Values = (
              39.687500000000000000
              1100.666666666667000000
              1161.520833333333000000
              338.666666666666700000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'Trocar Agulha Carburador'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel135: TQRLabel
            Left = 416
            Top = 456
            Width = 66
            Height = 15
            Size.Values = (
              39.687500000000000000
              1100.666666666667000000
              1206.500000000000000000
              174.625000000000000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'Trocar Pe'#231'as'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel136: TQRLabel
            Left = 416
            Top = 473
            Width = 92
            Height = 15
            Size.Values = (
              39.687500000000000000
              1100.666666666667000000
              1251.479166666667000000
              243.416666666666700000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'Trocar Acess'#243'rios'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel137: TQRLabel
            Left = 544
            Top = 473
            Width = 40
            Height = 15
            Size.Values = (
              39.687500000000000000
              1439.333333333333000000
              1251.479166666667000000
              105.833333333333300000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel138: TQRLabel
            Left = 592
            Top = 473
            Width = 18
            Height = 15
            Size.Values = (
              39.687500000000000000
              1566.333333333333000000
              1251.479166666667000000
              47.625000000000000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'SIM'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel139: TQRLabel
            Left = 592
            Top = 456
            Width = 18
            Height = 15
            Size.Values = (
              39.687500000000000000
              1566.333333333333000000
              1206.500000000000000000
              47.625000000000000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'SIM'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel140: TQRLabel
            Left = 544
            Top = 456
            Width = 40
            Height = 15
            Size.Values = (
              39.687500000000000000
              1439.333333333333000000
              1206.500000000000000000
              105.833333333333300000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel141: TQRLabel
            Left = 544
            Top = 439
            Width = 40
            Height = 15
            Size.Values = (
              39.687500000000000000
              1439.333333333333000000
              1161.520833333333000000
              105.833333333333300000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel142: TQRLabel
            Left = 592
            Top = 439
            Width = 18
            Height = 15
            Size.Values = (
              39.687500000000000000
              1566.333333333333000000
              1161.520833333333000000
              47.625000000000000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'SIM'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel143: TQRLabel
            Left = 592
            Top = 422
            Width = 18
            Height = 15
            Size.Values = (
              39.687500000000000000
              1566.333333333333000000
              1116.541666666667000000
              47.625000000000000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'SIM'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel144: TQRLabel
            Left = 544
            Top = 422
            Width = 40
            Height = 15
            Size.Values = (
              39.687500000000000000
              1439.333333333333000000
              1116.541666666667000000
              105.833333333333300000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel145: TQRLabel
            Left = 544
            Top = 405
            Width = 40
            Height = 15
            Size.Values = (
              39.687500000000000000
              1439.333333333333000000
              1071.562500000000000000
              105.833333333333300000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel146: TQRLabel
            Left = 544
            Top = 388
            Width = 40
            Height = 15
            Size.Values = (
              39.687500000000000000
              1439.333333333333000000
              1026.583333333333000000
              105.833333333333300000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel147: TQRLabel
            Left = 544
            Top = 371
            Width = 40
            Height = 15
            Size.Values = (
              39.687500000000000000
              1439.333333333333000000
              981.604166666666700000
              105.833333333333300000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel148: TQRLabel
            Left = 544
            Top = 354
            Width = 40
            Height = 15
            Size.Values = (
              39.687500000000000000
              1439.333333333333000000
              936.625000000000100000
              105.833333333333300000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel149: TQRLabel
            Left = 544
            Top = 337
            Width = 40
            Height = 15
            Size.Values = (
              39.687500000000000000
              1439.333333333333000000
              891.645833333333300000
              105.833333333333300000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel150: TQRLabel
            Left = 544
            Top = 320
            Width = 40
            Height = 15
            Size.Values = (
              39.687500000000000000
              1439.333333333333000000
              846.666666666666600000
              105.833333333333300000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel151: TQRLabel
            Left = 544
            Top = 303
            Width = 40
            Height = 15
            Size.Values = (
              39.687500000000000000
              1439.333333333333000000
              801.687500000000100000
              105.833333333333300000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel152: TQRLabel
            Left = 544
            Top = 286
            Width = 40
            Height = 15
            Size.Values = (
              39.687500000000000000
              1439.333333333333000000
              756.708333333333400000
              105.833333333333300000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel153: TQRLabel
            Left = 544
            Top = 269
            Width = 40
            Height = 15
            Size.Values = (
              39.687500000000000000
              1439.333333333333000000
              711.729166666666700000
              105.833333333333300000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel154: TQRLabel
            Left = 544
            Top = 252
            Width = 40
            Height = 15
            Size.Values = (
              39.687500000000000000
              1439.333333333333000000
              666.750000000000000000
              105.833333333333300000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel155: TQRLabel
            Left = 592
            Top = 252
            Width = 18
            Height = 15
            Size.Values = (
              39.687500000000000000
              1566.333333333333000000
              666.750000000000000000
              47.625000000000000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'SIM'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel156: TQRLabel
            Left = 592
            Top = 269
            Width = 18
            Height = 15
            Size.Values = (
              39.687500000000000000
              1566.333333333333000000
              711.729166666666700000
              47.625000000000000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'SIM'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel157: TQRLabel
            Left = 592
            Top = 286
            Width = 18
            Height = 15
            Size.Values = (
              39.687500000000000000
              1566.333333333333000000
              756.708333333333300000
              47.625000000000000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'SIM'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel158: TQRLabel
            Left = 592
            Top = 303
            Width = 18
            Height = 15
            Size.Values = (
              39.687500000000000000
              1566.333333333333000000
              801.687500000000000000
              47.625000000000000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'SIM'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel159: TQRLabel
            Left = 592
            Top = 320
            Width = 18
            Height = 15
            Size.Values = (
              39.687500000000000000
              1566.333333333333000000
              846.666666666666700000
              47.625000000000000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'SIM'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel160: TQRLabel
            Left = 592
            Top = 337
            Width = 18
            Height = 15
            Size.Values = (
              39.687500000000000000
              1566.333333333333000000
              891.645833333333300000
              47.625000000000000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'SIM'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel161: TQRLabel
            Left = 592
            Top = 354
            Width = 18
            Height = 15
            Size.Values = (
              39.687500000000000000
              1566.333333333333000000
              936.625000000000000000
              47.625000000000000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'SIM'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel162: TQRLabel
            Left = 592
            Top = 371
            Width = 18
            Height = 15
            Size.Values = (
              39.687500000000000000
              1566.333333333333000000
              981.604166666666700000
              47.625000000000000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'SIM'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel163: TQRLabel
            Left = 592
            Top = 388
            Width = 18
            Height = 15
            Size.Values = (
              39.687500000000000000
              1566.333333333333000000
              1026.583333333333000000
              47.625000000000000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'SIM'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel164: TQRLabel
            Left = 592
            Top = 405
            Width = 18
            Height = 15
            Size.Values = (
              39.687500000000000000
              1566.333333333333000000
              1071.562500000000000000
              47.625000000000000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'SIM'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel165: TQRLabel
            Left = 624
            Top = 252
            Width = 40
            Height = 15
            Size.Values = (
              39.687500000000000000
              1651.000000000000000000
              666.750000000000000000
              105.833333333333300000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel166: TQRLabel
            Left = 672
            Top = 252
            Width = 24
            Height = 15
            Size.Values = (
              39.687500000000000000
              1778.000000000000000000
              666.750000000000000000
              63.500000000000000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'N'#195'O'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel167: TQRLabel
            Left = 624
            Top = 269
            Width = 40
            Height = 15
            Size.Values = (
              39.687500000000000000
              1651.000000000000000000
              711.729166666666700000
              105.833333333333300000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel168: TQRLabel
            Left = 672
            Top = 269
            Width = 24
            Height = 15
            Size.Values = (
              39.687500000000000000
              1778.000000000000000000
              711.729166666666700000
              63.500000000000000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'N'#195'O'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel169: TQRLabel
            Left = 672
            Top = 286
            Width = 24
            Height = 15
            Size.Values = (
              39.687500000000000000
              1778.000000000000000000
              756.708333333333300000
              63.500000000000000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'N'#195'O'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel170: TQRLabel
            Left = 672
            Top = 303
            Width = 24
            Height = 15
            Size.Values = (
              39.687500000000000000
              1778.000000000000000000
              801.687500000000000000
              63.500000000000000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'N'#195'O'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel171: TQRLabel
            Left = 672
            Top = 320
            Width = 24
            Height = 15
            Size.Values = (
              39.687500000000000000
              1778.000000000000000000
              846.666666666666700000
              63.500000000000000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'N'#195'O'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel172: TQRLabel
            Left = 672
            Top = 337
            Width = 24
            Height = 15
            Size.Values = (
              39.687500000000000000
              1778.000000000000000000
              891.645833333333300000
              63.500000000000000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'N'#195'O'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel173: TQRLabel
            Left = 672
            Top = 354
            Width = 24
            Height = 15
            Size.Values = (
              39.687500000000000000
              1778.000000000000000000
              936.625000000000000000
              63.500000000000000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'N'#195'O'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel174: TQRLabel
            Left = 672
            Top = 371
            Width = 24
            Height = 15
            Size.Values = (
              39.687500000000000000
              1778.000000000000000000
              981.604166666666700000
              63.500000000000000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'N'#195'O'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel175: TQRLabel
            Left = 672
            Top = 388
            Width = 24
            Height = 15
            Size.Values = (
              39.687500000000000000
              1778.000000000000000000
              1026.583333333333000000
              63.500000000000000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'N'#195'O'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel176: TQRLabel
            Left = 672
            Top = 405
            Width = 24
            Height = 15
            Size.Values = (
              39.687500000000000000
              1778.000000000000000000
              1071.562500000000000000
              63.500000000000000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'N'#195'O'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel177: TQRLabel
            Left = 672
            Top = 422
            Width = 24
            Height = 15
            Size.Values = (
              39.687500000000000000
              1778.000000000000000000
              1116.541666666667000000
              63.500000000000000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'N'#195'O'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel178: TQRLabel
            Left = 672
            Top = 439
            Width = 24
            Height = 15
            Size.Values = (
              39.687500000000000000
              1778.000000000000000000
              1161.520833333333000000
              63.500000000000000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'N'#195'O'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel179: TQRLabel
            Left = 672
            Top = 456
            Width = 24
            Height = 15
            Size.Values = (
              39.687500000000000000
              1778.000000000000000000
              1206.500000000000000000
              63.500000000000000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'N'#195'O'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel180: TQRLabel
            Left = 672
            Top = 473
            Width = 24
            Height = 15
            Size.Values = (
              39.687500000000000000
              1778.000000000000000000
              1251.479166666667000000
              63.500000000000000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'N'#195'O'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel181: TQRLabel
            Left = 624
            Top = 473
            Width = 40
            Height = 15
            Size.Values = (
              39.687500000000000000
              1651.000000000000000000
              1251.479166666667000000
              105.833333333333300000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel182: TQRLabel
            Left = 624
            Top = 456
            Width = 40
            Height = 15
            Size.Values = (
              39.687500000000000000
              1651.000000000000000000
              1206.500000000000000000
              105.833333333333300000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel183: TQRLabel
            Left = 624
            Top = 439
            Width = 40
            Height = 15
            Size.Values = (
              39.687500000000000000
              1651.000000000000000000
              1161.520833333333000000
              105.833333333333300000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel184: TQRLabel
            Left = 624
            Top = 422
            Width = 40
            Height = 15
            Size.Values = (
              39.687500000000000000
              1651.000000000000000000
              1116.541666666667000000
              105.833333333333300000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel185: TQRLabel
            Left = 624
            Top = 405
            Width = 40
            Height = 15
            Size.Values = (
              39.687500000000000000
              1651.000000000000000000
              1071.562500000000000000
              105.833333333333300000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel186: TQRLabel
            Left = 624
            Top = 388
            Width = 40
            Height = 15
            Size.Values = (
              39.687500000000000000
              1651.000000000000000000
              1026.583333333333000000
              105.833333333333300000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel187: TQRLabel
            Left = 624
            Top = 371
            Width = 40
            Height = 15
            Size.Values = (
              39.687500000000000000
              1651.000000000000000000
              981.604166666666700000
              105.833333333333300000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel188: TQRLabel
            Left = 624
            Top = 354
            Width = 40
            Height = 15
            Size.Values = (
              39.687500000000000000
              1651.000000000000000000
              936.625000000000100000
              105.833333333333300000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel189: TQRLabel
            Left = 624
            Top = 337
            Width = 40
            Height = 15
            Size.Values = (
              39.687500000000000000
              1651.000000000000000000
              891.645833333333300000
              105.833333333333300000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel190: TQRLabel
            Left = 624
            Top = 320
            Width = 40
            Height = 15
            Size.Values = (
              39.687500000000000000
              1651.000000000000000000
              846.666666666666600000
              105.833333333333300000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel191: TQRLabel
            Left = 624
            Top = 303
            Width = 40
            Height = 15
            Size.Values = (
              39.687500000000000000
              1651.000000000000000000
              801.687500000000100000
              105.833333333333300000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel192: TQRLabel
            Left = 624
            Top = 286
            Width = 40
            Height = 15
            Size.Values = (
              39.687500000000000000
              1651.000000000000000000
              756.708333333333400000
              105.833333333333300000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Caption = '(        )'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRShape10: TQRShape
            Left = 0
            Top = 507
            Width = 698
            Height = 4
            Size.Values = (
              10.583333333333330000
              0.000000000000000000
              1341.437500000000000000
              1846.791666666667000000)
            XLColumn = 0
            Shape = qrsHorLine
            VertAdjust = 0
          end
          object QRLabel193: TQRLabel
            Left = 291
            Top = 513
            Width = 116
            Height = 17
            Size.Values = (
              44.979166666666670000
              769.937500000000000000
              1357.312500000000000000
              306.916666666666700000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = True
            Caption = 'REQUISI'#199#195'O DE PE'#199'AS'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRShape11: TQRShape
            Left = 0
            Top = 530
            Width = 698
            Height = 4
            Size.Values = (
              10.583333333333330000
              0.000000000000000000
              1402.291666666667000000
              1846.791666666667000000)
            XLColumn = 0
            Shape = qrsHorLine
            VertAdjust = 0
          end
          object QRMemo1: TQRMemo
            Left = 0
            Top = 544
            Width = 698
            Height = 217
            Size.Values = (
              574.145833333333400000
              0.000000000000000000
              1439.333333333333000000
              1846.791666666667000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            Color = clWhite
            Lines.Strings = (
              
                '________________________________________________________________' +
                '____________________________________'
              
                '________________________________________________________________' +
                '____________________________________'
              
                '________________________________________________________________' +
                '____________________________________'
              
                '________________________________________________________________' +
                '____________________________________'
              
                '________________________________________________________________' +
                '____________________________________'
              
                '________________________________________________________________' +
                '____________________________________'
              
                '________________________________________________________________' +
                '____________________________________')
            Transparent = False
            FullJustify = False
            MaxBreakChars = 0
            FontSize = 10
          end
          object QRLabel197: TQRLabel
            Left = 306
            Top = 201
            Width = 8
            Height = 15
            Size.Values = (
              39.687500000000000000
              809.625000000000000000
              531.812500000000000000
              21.166666666666670000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'X'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel198: TQRLabel
            Left = 586
            Top = 201
            Width = 8
            Height = 15
            Size.Values = (
              39.687500000000000000
              1550.458333333333000000
              531.812500000000000000
              21.166666666666670000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'X'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel199: TQRLabel
            Left = 306
            Top = 252
            Width = 8
            Height = 15
            Size.Values = (
              39.687500000000000000
              809.625000000000000000
              666.750000000000000000
              21.166666666666670000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'X'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel200: TQRLabel
            Left = 306
            Top = 269
            Width = 8
            Height = 15
            Size.Values = (
              39.687500000000000000
              809.625000000000000000
              711.729166666666700000
              21.166666666666670000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'X'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel201: TQRLabel
            Left = 306
            Top = 286
            Width = 8
            Height = 15
            Size.Values = (
              39.687500000000000000
              809.625000000000000000
              756.708333333333300000
              21.166666666666670000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'X'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel202: TQRLabel
            Left = 306
            Top = 303
            Width = 8
            Height = 15
            Size.Values = (
              39.687500000000000000
              809.625000000000000000
              801.687500000000000000
              21.166666666666670000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'X'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel203: TQRLabel
            Left = 306
            Top = 320
            Width = 8
            Height = 15
            Size.Values = (
              39.687500000000000000
              809.625000000000000000
              846.666666666666700000
              21.166666666666670000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'X'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel204: TQRLabel
            Left = 306
            Top = 337
            Width = 8
            Height = 15
            Size.Values = (
              39.687500000000000000
              809.625000000000000000
              891.645833333333300000
              21.166666666666670000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'X'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel205: TQRLabel
            Left = 306
            Top = 354
            Width = 8
            Height = 15
            Size.Values = (
              39.687500000000000000
              809.625000000000000000
              936.625000000000000000
              21.166666666666670000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'X'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel206: TQRLabel
            Left = 306
            Top = 371
            Width = 8
            Height = 15
            Size.Values = (
              39.687500000000000000
              809.625000000000000000
              981.604166666666700000
              21.166666666666670000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'X'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel207: TQRLabel
            Left = 306
            Top = 388
            Width = 8
            Height = 15
            Size.Values = (
              39.687500000000000000
              809.625000000000000000
              1026.583333333333000000
              21.166666666666670000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'X'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel208: TQRLabel
            Left = 306
            Top = 405
            Width = 8
            Height = 15
            Size.Values = (
              39.687500000000000000
              809.625000000000000000
              1071.562500000000000000
              21.166666666666670000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'X'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel209: TQRLabel
            Left = 306
            Top = 422
            Width = 8
            Height = 15
            Size.Values = (
              39.687500000000000000
              809.625000000000000000
              1116.541666666667000000
              21.166666666666670000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'X'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel210: TQRLabel
            Left = 306
            Top = 439
            Width = 8
            Height = 15
            Size.Values = (
              39.687500000000000000
              809.625000000000000000
              1161.520833333333000000
              21.166666666666670000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'X'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel211: TQRLabel
            Left = 306
            Top = 456
            Width = 8
            Height = 15
            Size.Values = (
              39.687500000000000000
              809.625000000000000000
              1206.500000000000000000
              21.166666666666670000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'X'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel212: TQRLabel
            Left = 306
            Top = 473
            Width = 8
            Height = 15
            Size.Values = (
              39.687500000000000000
              809.625000000000000000
              1251.479166666667000000
              21.166666666666670000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'X'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel213: TQRLabel
            Left = 306
            Top = 490
            Width = 8
            Height = 15
            Size.Values = (
              39.687500000000000000
              809.625000000000000000
              1296.458333333333000000
              21.166666666666670000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'X'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel214: TQRLabel
            Left = 640
            Top = 252
            Width = 8
            Height = 15
            Size.Values = (
              39.687500000000000000
              1693.333333333333000000
              666.750000000000000000
              21.166666666666670000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'X'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel215: TQRLabel
            Left = 640
            Top = 269
            Width = 8
            Height = 15
            Size.Values = (
              39.687500000000000000
              1693.333333333333000000
              711.729166666666700000
              21.166666666666670000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'X'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel216: TQRLabel
            Left = 640
            Top = 286
            Width = 8
            Height = 15
            Size.Values = (
              39.687500000000000000
              1693.333333333333000000
              756.708333333333300000
              21.166666666666670000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'X'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel217: TQRLabel
            Left = 640
            Top = 303
            Width = 8
            Height = 15
            Size.Values = (
              39.687500000000000000
              1693.333333333333000000
              801.687500000000000000
              21.166666666666670000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'X'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel218: TQRLabel
            Left = 640
            Top = 320
            Width = 8
            Height = 15
            Size.Values = (
              39.687500000000000000
              1693.333333333333000000
              846.666666666666700000
              21.166666666666670000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'X'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel219: TQRLabel
            Left = 640
            Top = 337
            Width = 8
            Height = 15
            Size.Values = (
              39.687500000000000000
              1693.333333333333000000
              891.645833333333300000
              21.166666666666670000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'X'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel220: TQRLabel
            Left = 640
            Top = 354
            Width = 8
            Height = 15
            Size.Values = (
              39.687500000000000000
              1693.333333333333000000
              936.625000000000000000
              21.166666666666670000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'X'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel221: TQRLabel
            Left = 640
            Top = 371
            Width = 8
            Height = 15
            Size.Values = (
              39.687500000000000000
              1693.333333333333000000
              981.604166666666700000
              21.166666666666670000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'X'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel222: TQRLabel
            Left = 640
            Top = 388
            Width = 8
            Height = 15
            Size.Values = (
              39.687500000000000000
              1693.333333333333000000
              1026.583333333333000000
              21.166666666666670000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'X'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel223: TQRLabel
            Left = 640
            Top = 405
            Width = 8
            Height = 15
            Size.Values = (
              39.687500000000000000
              1693.333333333333000000
              1071.562500000000000000
              21.166666666666670000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'X'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel224: TQRLabel
            Left = 640
            Top = 422
            Width = 8
            Height = 15
            Size.Values = (
              39.687500000000000000
              1693.333333333333000000
              1116.541666666667000000
              21.166666666666670000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'X'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel225: TQRLabel
            Left = 640
            Top = 439
            Width = 8
            Height = 15
            Size.Values = (
              39.687500000000000000
              1693.333333333333000000
              1161.520833333333000000
              21.166666666666670000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'X'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel226: TQRLabel
            Left = 640
            Top = 456
            Width = 8
            Height = 15
            Size.Values = (
              39.687500000000000000
              1693.333333333333000000
              1206.500000000000000000
              21.166666666666670000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'X'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel227: TQRLabel
            Left = 640
            Top = 473
            Width = 8
            Height = 15
            Size.Values = (
              39.687500000000000000
              1693.333333333333000000
              1251.479166666667000000
              21.166666666666670000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'X'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRDBText40: TQRDBText
            Left = 52
            Top = 114
            Width = 44
            Height = 15
            Size.Values = (
              39.687500000000000000
              137.583333333333300000
              301.625000000000000000
              116.416666666666700000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Color = clWhite
            DataSet = QCheckList_Moto
            DataField = 'MODELO'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FullJustify = False
            MaxBreakChars = 0
            FontSize = 8
          end
          object QRDBText41: TQRDBText
            Left = 52
            Top = 131
            Width = 23
            Height = 15
            Size.Values = (
              39.687500000000000000
              137.583333333333300000
              346.604166666666700000
              60.854166666666670000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Color = clWhite
            DataSet = QCheckList_Moto
            DataField = 'COR'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FullJustify = False
            MaxBreakChars = 0
            FontSize = 8
          end
          object QRDBText42: TQRDBText
            Left = 52
            Top = 148
            Width = 24
            Height = 15
            Size.Values = (
              39.687500000000000000
              137.583333333333300000
              391.583333333333300000
              63.500000000000000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Color = clWhite
            DataSet = QCheckList_Moto
            DataField = 'ANO'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FullJustify = False
            MaxBreakChars = 0
            FontSize = 8
          end
          object QRDBText43: TQRDBText
            Left = 52
            Top = 165
            Width = 36
            Height = 15
            Size.Values = (
              39.687500000000000000
              137.583333333333300000
              436.562500000000000000
              95.250000000000000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Color = clWhite
            DataSet = QCheckList_Moto
            DataField = 'PLACA'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FullJustify = False
            MaxBreakChars = 0
            FontSize = 8
          end
          object QRDBText44: TQRDBText
            Left = 248
            Top = 165
            Width = 16
            Height = 15
            Size.Values = (
              39.687500000000000000
              656.166666666666700000
              436.562500000000000000
              42.333333333333330000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Color = clWhite
            DataField = 'KM'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
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
          object QRDBText46: TQRDBText
            Left = 640
            Top = 50
            Width = 52
            Height = 15
            Size.Values = (
              39.687500000000000000
              1693.333333333333000000
              132.291666666666700000
              137.583333333333300000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Color = clWhite
            DataSet = QCheckList_Moto
            DataField = 'ORDEM_ID'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FullJustify = False
            MaxBreakChars = 0
            FontSize = 8
          end
          object QRLabel229: TQRLabel
            Left = 624
            Top = 50
            Width = 10
            Height = 15
            Size.Values = (
              39.687500000000000000
              1651.000000000000000000
              132.291666666666700000
              26.458333333333330000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'ID'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
        end
        object QRBand4: TQRBand
          Left = 48
          Top = 809
          Width = 698
          Height = 120
          AlignToBottom = False
          TransparentBand = False
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            317.500000000000000000
            1846.791666666667000000)
          PreCaluculateBandHeight = False
          KeepOnOnePage = False
          BandType = rbSummary
          object QRLabel194: TQRLabel
            Left = 0
            Top = 1
            Width = 385
            Height = 15
            Size.Values = (
              39.687500000000000000
              0.000000000000000000
              2.645833333333333000
              1018.645833333333000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 
              'Estou ciente das condi'#231#245'es apresentadas da minha motocicleta nes' +
              'te check list'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel195: TQRLabel
            Left = 0
            Top = 20
            Width = 383
            Height = 15
            Size.Values = (
              39.687500000000000000
              0.000000000000000000
              52.916666666666670000
              1013.354166666667000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 
              'Assinatura do Cliente __________________________________________' +
              '____'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRDBText38: TQRDBText
            Left = 106
            Top = 39
            Width = 76
            Height = 15
            Size.Values = (
              39.687500000000000000
              280.458333333333300000
              103.187500000000000000
              201.083333333333300000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Color = clWhite
            DataField = 'NOME_CLIENTE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FullJustify = False
            MaxBreakChars = 0
            FontSize = 8
          end
          object QRLabel196: TQRLabel
            Left = 0
            Top = 77
            Width = 383
            Height = 15
            Size.Values = (
              39.687500000000000000
              0.000000000000000000
              203.729166666666700000
              1013.354166666667000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 
              'Assinatura do T'#233'cnico __________________________________________' +
              '___'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRDBText39: TQRDBText
            Left = 112
            Top = 94
            Width = 30
            Height = 15
            Size.Values = (
              39.687500000000000000
              296.333333333333300000
              248.708333333333300000
              79.375000000000000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Color = clWhite
            DataField = 'NOME'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
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
      end
      object NUMERO: TEdit
        Left = 327
        Top = 137
        Width = 59
        Height = 21
        Enabled = False
        MaxLength = 6
        TabOrder = 10
        OnKeyDown = DT_ORDEMKeyDown
      end
      object DT_FECHAMENTO: TDateEdit
        Left = 262
        Top = 190
        Width = 83
        Height = 21
        CheckOnExit = True
        DialogTitle = 'Selecione a Data'
        Enabled = False
        NumGlyphs = 2
        ReadOnly = True
        TabOrder = 25
        OnEnter = DT_ORDEMEnter
        OnKeyDown = DT_ORDEMKeyDown
      end
      object H_FECHAMENTO: TMaskEdit
        Left = 347
        Top = 190
        Width = 39
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
        Enabled = False
        EditMask = '!90:00;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 5
        ParentFont = False
        ReadOnly = True
        TabOrder = 26
        Text = '  :  '
        OnKeyDown = DT_ORDEMKeyDown
      end
      object FUNCIONARIO: TCurrencyEdit
        Left = 85
        Top = 216
        Width = 47
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0;-0'
        Enabled = False
        TabOrder = 17
        ZeroEmpty = False
        OnExit = FUNCIONARIOExit
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object COND_PAGTO: TComboBox
        Left = 467
        Top = 83
        Width = 120
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemIndex = 0
        MaxLength = 7
        ParentFont = False
        TabOrder = 7
        Text = 'A VISTA'
        OnKeyDown = EMPRESA_IDKeyDown
        Items.Strings = (
          'A VISTA'
          'A PRAZO')
      end
      object Resumo_Ag: TEdit
        Left = 85
        Top = 377
        Width = 634
        Height = 21
        Enabled = False
        MaxLength = 200
        TabOrder = 19
        OnKeyDown = DT_ORDEMKeyDown
      end
      object C_CUSTO_ID: TCurrencyEdit
        Left = 612
        Top = 164
        Width = 47
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0;-0'
        Enabled = False
        TabOrder = 24
        Value = 1.000000000000000000
        Visible = False
        ZeroEmpty = False
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object Panel4: TPanel
        Left = 95
        Top = 137
        Width = 489
        Height = 41
        Caption = 'Aguarde...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 27
        Visible = False
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 586
    Width = 731
    Height = 39
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnRetorna: TBitBtn
      Left = 655
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
      TabOrder = 2
      OnClick = btnRetornaClick
    end
    object btnPesquisa: TBitBtn
      Left = 493
      Top = 6
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
    object btnOrdem: TBitBtn
      Left = 574
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Impr. &Ordem'
      TabOrder = 1
      OnClick = btnOrdemClick
    end
    object CheckBox1: TCheckBox
      Left = 344
      Top = 10
      Width = 104
      Height = 17
      Caption = 'Imp. HP/Samsung'
      TabOrder = 3
    end
  end
  object Ordem: TQuickRep
    Left = 627
    Top = 1000
    Width = 794
    Height = 1123
    DataSet = QSub_Detail
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
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
    Page.PaperSize = Custom
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
    ReportTitle = 'Ordem de Servi'#231'o'
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
      Height = 216
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        571.500000000000000000
        1846.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object QRShape1: TQRShape
        Left = 0
        Top = 52
        Width = 698
        Height = 4
        Size.Values = (
          10.583333333333330000
          0.000000000000000000
          137.583333333333300000
          1846.791666666667000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel6: TQRLabel
        Left = 0
        Top = 75
        Width = 50
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          198.437500000000000000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cliente'
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
      object QRLabel7: TQRLabel
        Left = 0
        Top = 92
        Width = 71
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          243.416666666666700000
          187.854166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Insc. Est.'
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
        Top = 109
        Width = 57
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          288.395833333333300000
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
        Left = 3
        Top = 124
        Width = 43
        Height = 15
        Size.Values = (
          39.687500000000000000
          7.937500000000000000
          328.083333333333300000
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
        Top = 124
        Width = 64
        Height = 17
        Size.Values = (
          44.979166666666670000
          201.083333333333300000
          328.083333333333300000
          169.333333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QTabela
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
        Top = 109
        Width = 57
        Height = 15
        Size.Values = (
          39.687500000000000000
          201.083333333333300000
          288.395833333333300000
          150.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QTabela
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
      object QRDBText10: TQRDBText
        Left = 76
        Top = 92
        Width = 64
        Height = 15
        Size.Values = (
          39.687500000000000000
          201.083333333333300000
          243.416666666666700000
          169.333333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QTabela
        DataField = 'INSCRICAO'
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
        Top = 75
        Width = 85
        Height = 15
        Size.Values = (
          39.687500000000000000
          201.083333333333300000
          198.437500000000000000
          224.895833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QTabela
        DataField = 'NOME_CLIENTE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel8: TQRLabel
        Left = 324
        Top = 92
        Width = 57
        Height = 15
        Size.Values = (
          39.687500000000000000
          857.250000000000000000
          243.416666666666700000
          150.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'CNPJ/CPF'
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
      object QRDBText11: TQRDBText
        Left = 394
        Top = 92
        Width = 29
        Height = 15
        Size.Values = (
          39.687500000000000000
          1042.458333333333000000
          243.416666666666700000
          76.729166666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QTabela
        DataField = 'CNPJ'
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
        Left = 544
        Top = 109
        Width = 43
        Height = 15
        Size.Values = (
          39.687500000000000000
          1439.333333333333000000
          288.395833333333300000
          113.770833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QTabela
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
        Left = 480
        Top = 109
        Width = 43
        Height = 15
        Size.Values = (
          39.687500000000000000
          1270.000000000000000000
          288.395833333333300000
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
        Top = 124
        Width = 22
        Height = 15
        Size.Values = (
          39.687500000000000000
          857.250000000000000000
          328.083333333333300000
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
        Left = 394
        Top = 124
        Width = 22
        Height = 15
        Size.Values = (
          39.687500000000000000
          1042.458333333333000000
          328.083333333333300000
          58.208333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QTabela
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
      object QRLabel13: TQRLabel
        Left = 480
        Top = 124
        Width = 57
        Height = 15
        Size.Values = (
          39.687500000000000000
          1270.000000000000000000
          328.083333333333300000
          150.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Telefone'
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
      object QRDBText16: TQRDBText
        Left = 544
        Top = 124
        Width = 57
        Height = 15
        Size.Values = (
          39.687500000000000000
          1439.333333333333000000
          328.083333333333300000
          150.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QTabela
        DataField = 'TELEFONE'
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
        Top = 187
        Width = 698
        Height = 4
        Size.Values = (
          10.583333333333330000
          0.000000000000000000
          494.770833333333300000
          1846.791666666667000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel18: TQRLabel
        Left = 625
        Top = 193
        Width = 73
        Height = 15
        Size.Values = (
          39.687500000000000000
          1653.645833333333000000
          510.645833333333300000
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
        Top = 193
        Width = 73
        Height = 15
        Size.Values = (
          39.687500000000000000
          1375.833333333333000000
          510.645833333333300000
          193.145833333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Pr. Unit'#225'rio'
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
        Left = 401
        Top = 195
        Width = 73
        Height = 15
        Size.Values = (
          39.687500000000000000
          1060.979166666667000000
          515.937500000000000000
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
        Top = 211
        Width = 698
        Height = 4
        Size.Values = (
          10.583333333333330000
          0.000000000000000000
          558.270833333333300000
          1846.791666666667000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel15: TQRLabel
        Left = 88
        Top = 195
        Width = 64
        Height = 15
        Size.Values = (
          39.687500000000000000
          232.833333333333300000
          515.937500000000000000
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
        Left = 3
        Top = 195
        Width = 43
        Height = 15
        Size.Values = (
          39.687500000000000000
          7.937500000000000000
          515.937500000000000000
          113.770833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'C'#243'digo'
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
        Left = 3
        Top = 35
        Width = 162
        Height = 15
        Size.Values = (
          39.687500000000000000
          7.937500000000000000
          92.604166666666670000
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
        Top = 18
        Width = 113
        Height = 15
        Size.Values = (
          39.687500000000000000
          1547.812500000000000000
          47.625000000000000000
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
        Left = 243
        Top = 35
        Width = 211
        Height = 15
        Size.Values = (
          39.687500000000000000
          642.937500000000000000
          92.604166666666670000
          558.270833333333300000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = True
        Caption = '*** ORDEM DE SERVI'#199'O SAL'#195'O ***'
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
      object QRShape4: TQRShape
        Left = 0
        Top = 158
        Width = 698
        Height = 4
        Size.Values = (
          10.583333333333330000
          0.000000000000000000
          418.041666666666700000
          1846.791666666667000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel29: TQRLabel
        Left = 1
        Top = 170
        Width = 127
        Height = 15
        Size.Values = (
          39.687500000000000000
          2.645833333333333000
          449.791666666666700000
          336.020833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Previs'#227'o de Atend.'
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
      object QRDBText27: TQRDBText
        Left = 134
        Top = 168
        Width = 71
        Height = 15
        Size.Values = (
          39.687500000000000000
          354.541666666666700000
          444.500000000000000000
          187.854166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QTabela
        DataField = 'PREV_ATEND'
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
      object QRLabel30: TQRLabel
        Left = 324
        Top = 168
        Width = 36
        Height = 15
        Size.Values = (
          39.687500000000000000
          857.250000000000000000
          444.500000000000000000
          95.250000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Horas'
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
      object QRDBText28: TQRDBText
        Left = 394
        Top = 168
        Width = 71
        Height = 15
        Size.Values = (
          39.687500000000000000
          1042.458333333333000000
          444.500000000000000000
          187.854166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QTabela
        DataField = 'HORA_ATEND'
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
      object QRLabel4: TQRLabel
        Left = 0
        Top = 58
        Width = 29
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          153.458333333333300000
          76.729166666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Data'
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
      object QRDBText17: TQRDBText
        Left = 76
        Top = 58
        Width = 57
        Height = 15
        Size.Values = (
          39.687500000000000000
          201.083333333333300000
          153.458333333333300000
          150.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QTabela
        DataField = 'DT_ORDEM'
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
      object QRLabel5: TQRLabel
        Left = 324
        Top = 58
        Width = 36
        Height = 15
        Size.Values = (
          39.687500000000000000
          857.250000000000000000
          153.458333333333300000
          95.250000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Horas'
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
      object QRDBText18: TQRDBText
        Left = 394
        Top = 58
        Width = 36
        Height = 15
        Size.Values = (
          39.687500000000000000
          1042.458333333333000000
          153.458333333333300000
          95.250000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QTabela
        DataField = 'HORAS'
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
      object QRDBText45: TQRDBText
        Left = 544
        Top = 58
        Width = 57
        Height = 15
        Size.Values = (
          39.687500000000000000
          1439.333333333333000000
          153.458333333333300000
          150.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QTabela
        DataField = 'ORDEM_ID'
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
      object QRLabel228: TQRLabel
        Left = 480
        Top = 58
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          1270.000000000000000000
          153.458333333333300000
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
      object QRLabel230: TQRLabel
        Left = 324
        Top = 109
        Width = 43
        Height = 15
        Size.Values = (
          39.687500000000000000
          857.250000000000000000
          288.395833333333300000
          113.770833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'N'#250'mero'
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
      object QRDBText47: TQRDBText
        Left = 394
        Top = 109
        Width = 43
        Height = 15
        Size.Values = (
          39.687500000000000000
          1042.458333333333000000
          288.395833333333300000
          113.770833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QTabela
        DataField = 'NUMERO'
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
      object QRLabel231: TQRLabel
        Left = 0
        Top = 141
        Width = 50
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          373.062500000000000000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Contato'
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
      object QRDBText48: TQRDBText
        Left = 76
        Top = 141
        Width = 50
        Height = 15
        Size.Values = (
          39.687500000000000000
          201.083333333333300000
          373.062500000000000000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QCliente
        DataField = 'CONTATO'
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
      object QRLabel232: TQRLabel
        Left = 324
        Top = 141
        Width = 64
        Height = 15
        Size.Values = (
          39.687500000000000000
          857.250000000000000000
          373.062500000000000000
          169.333333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Atendente'
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
      object QRDBText49: TQRDBText
        Left = 394
        Top = 141
        Width = 29
        Height = 15
        Size.Values = (
          39.687500000000000000
          1042.458333333333000000
          373.062500000000000000
          76.729166666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QAtendente
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
      object QRDBText69: TQRDBText
        Left = 70
        Top = 18
        Width = 57
        Height = 15
        Size.Values = (
          39.687500000000000000
          185.208333333333300000
          47.625000000000000000
          150.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = FrmPrincipal.QEmpresa
        DataField = 'TELEFONE'
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
      object QRLabel329: TQRLabel
        Left = 0
        Top = 18
        Width = 64
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          47.625000000000000000
          169.333333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = True
        Caption = 'Telefone:'
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
      Top = 264
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
        Width = 78
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          0.000000000000000000
          206.375000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QSub_Detail
        DataField = 'CODIGO_ITEM'
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
        Left = 400
        Top = 0
        Width = 73
        Height = 15
        Size.Values = (
          39.687500000000000000
          1058.333333333333000000
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
    end
    object QRBand2: TQRBand
      Left = 48
      Top = 280
      Width = 698
      Height = 148
      AlignToBottom = False
      BeforePrint = QRBand2BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        391.583333333333300000
        1846.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRLabel19: TQRLabel
        Left = 552
        Top = 5
        Width = 64
        Height = 15
        Size.Values = (
          39.687500000000000000
          1460.500000000000000000
          13.229166666666670000
          169.333333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sub-Total'
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
        Master = Ordem
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'Sum(VR_TOTAL)'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape6: TQRShape
        Left = 0
        Top = 56
        Width = 700
        Height = 4
        Size.Values = (
          10.583333333333330000
          0.000000000000000000
          148.166666666666700000
          1852.083333333333000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel21: TQRLabel
        Left = 0
        Top = 62
        Width = 176
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          164.041666666666700000
          465.666666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Autorizo a Execu'#231#227'o Desta'
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
      object QRLabel22: TQRLabel
        Left = 0
        Top = 81
        Width = 477
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          214.312500000000000000
          1262.062500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          'Assinatura do Cliente __________________________________________' +
          '____'
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
        Left = 154
        Top = 100
        Width = 30
        Height = 15
        Size.Values = (
          39.687500000000000000
          407.458333333333300000
          264.583333333333300000
          79.375000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QTabela
        DataField = 'NOME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel23: TQRLabel
        Left = 0
        Top = 114
        Width = 512
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          301.625000000000000000
          1354.666666666667000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          'Assinatura do Profissional _____________________________________' +
          '_________'
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
      object QRDBText21: TQRDBText
        Left = 154
        Top = 131
        Width = 29
        Height = 15
        Size.Values = (
          39.687500000000000000
          407.458333333333300000
          346.604166666666700000
          76.729166666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QVendedor
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
      object QRLabel2: TQRLabel
        Left = 3
        Top = 5
        Width = 78
        Height = 15
        Size.Values = (
          39.687500000000000000
          7.937500000000000000
          13.229166666666670000
          206.375000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Observa'#231#227'o:'
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
      object QRDBText8: TQRDBText
        Left = 74
        Top = 7
        Width = 471
        Height = 49
        Size.Values = (
          129.645833333333300000
          195.791666666666700000
          18.520833333333330000
          1246.187500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QTabela
        DataField = 'OBSERVACAO'
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
        Left = 552
        Top = 22
        Width = 57
        Height = 15
        Size.Values = (
          39.687500000000000000
          1460.500000000000000000
          58.208333333333330000
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
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText19: TQRDBText
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
        DataSet = QTabela
        DataField = 'DESCONTO'
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
      object QRLabel24: TQRLabel
        Left = 552
        Top = 39
        Width = 36
        Height = 15
        Size.Values = (
          39.687500000000000000
          1460.500000000000000000
          103.187500000000000000
          95.250000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Valor'
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
      object QRDBText20: TQRDBText
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
        DataSet = QTabela
        DataField = 'VALOR'
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
    end
  end
  object Check_List_Informatica: TQuickRep
    Left = 8
    Top = 800
    Width = 794
    Height = 1123
    DataSet = QCheckList_Moto
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
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
    ReportTitle = 'Ordem de Servi'#231'o'
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
    object QRBand6: TQRBand
      Left = 48
      Top = 809
      Width = 698
      Height = 120
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        317.500000000000000000
        1846.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRLabel430: TQRLabel
        Left = 0
        Top = 1
        Width = 351
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          2.645833333333333000
          928.687500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          'Estou ciente das condi'#231#245'es apresentadas da minha CPU neste check' +
          ' list'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel431: TQRLabel
        Left = 0
        Top = 20
        Width = 383
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          52.916666666666670000
          1013.354166666667000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          'Assinatura do Cliente __________________________________________' +
          '____'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText67: TQRDBText
        Left = 106
        Top = 39
        Width = 76
        Height = 15
        Size.Values = (
          39.687500000000000000
          280.458333333333300000
          103.187500000000000000
          201.083333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataField = 'NOME_CLIENTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel432: TQRLabel
        Left = 0
        Top = 77
        Width = 383
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          203.729166666666700000
          1013.354166666667000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          'Assinatura do T'#233'cnico __________________________________________' +
          '___'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText68: TQRDBText
        Left = 112
        Top = 94
        Width = 30
        Height = 15
        Size.Values = (
          39.687500000000000000
          296.333333333333300000
          248.708333333333300000
          79.375000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataField = 'NOME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
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
    object QRBand5: TQRBand
      Left = 48
      Top = 48
      Width = 698
      Height = 761
      AlignToBottom = False
      BeforePrint = QRBand3BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        2013.479166666667000000
        1846.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object QRShape12: TQRShape
        Left = 0
        Top = 46
        Width = 698
        Height = 4
        Size.Values = (
          10.583333333333330000
          0.000000000000000000
          121.708333333333300000
          1846.791666666667000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel233: TQRLabel
        Left = 0
        Top = 50
        Width = 33
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          132.291666666666700000
          87.312500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cliente'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel234: TQRLabel
        Left = 0
        Top = 65
        Width = 45
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          171.979166666666700000
          119.062500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Insc. Est.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel235: TQRLabel
        Left = 0
        Top = 80
        Width = 47
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          211.666666666666700000
          124.354166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Endere'#231'o'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel236: TQRLabel
        Left = 0
        Top = 95
        Width = 34
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          251.354166666666700000
          89.958333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cidade'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText50: TQRDBText
        Left = 52
        Top = 95
        Width = 50
        Height = 15
        Size.Values = (
          39.687500000000000000
          137.583333333333300000
          251.354166666666700000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QCheckList_Moto
        DataField = 'MUNICIPIO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText51: TQRDBText
        Left = 52
        Top = 80
        Width = 55
        Height = 15
        Size.Values = (
          39.687500000000000000
          137.583333333333300000
          211.666666666666700000
          145.520833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QCheckList_Moto
        DataField = 'ENDERECO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText52: TQRDBText
        Left = 52
        Top = 65
        Width = 56
        Height = 15
        Size.Values = (
          39.687500000000000000
          137.583333333333300000
          171.979166666666700000
          148.166666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QCheckList_Moto
        DataField = 'INSCRICAO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText53: TQRDBText
        Left = 52
        Top = 50
        Width = 76
        Height = 15
        Size.Values = (
          39.687500000000000000
          137.583333333333300000
          132.291666666666700000
          201.083333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QCheckList_Moto
        DataField = 'NOME_CLIENTE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel237: TQRLabel
        Left = 324
        Top = 65
        Width = 48
        Height = 15
        Size.Values = (
          39.687500000000000000
          857.250000000000000000
          171.979166666666700000
          127.000000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'CNPJ/CPF'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText54: TQRDBText
        Left = 384
        Top = 65
        Width = 26
        Height = 15
        Size.Values = (
          39.687500000000000000
          1016.000000000000000000
          171.979166666666700000
          68.791666666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QCheckList_Moto
        DataField = 'CNPJ'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText55: TQRDBText
        Left = 384
        Top = 80
        Width = 40
        Height = 15
        Size.Values = (
          39.687500000000000000
          1016.000000000000000000
          211.666666666666700000
          105.833333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QCheckList_Moto
        DataField = 'BAIRRO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel238: TQRLabel
        Left = 324
        Top = 80
        Width = 30
        Height = 15
        Size.Values = (
          39.687500000000000000
          857.250000000000000000
          211.666666666666700000
          79.375000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Bairro'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel239: TQRLabel
        Left = 324
        Top = 95
        Width = 20
        Height = 15
        Size.Values = (
          39.687500000000000000
          857.250000000000000000
          251.354166666666700000
          52.916666666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'CEP'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText56: TQRDBText
        Left = 384
        Top = 95
        Width = 20
        Height = 15
        Size.Values = (
          39.687500000000000000
          1016.000000000000000000
          251.354166666666700000
          52.916666666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QCheckList_Moto
        DataField = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel240: TQRLabel
        Left = 480
        Top = 95
        Width = 43
        Height = 15
        Size.Values = (
          39.687500000000000000
          1270.000000000000000000
          251.354166666666700000
          113.770833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Telefone'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText57: TQRDBText
        Left = 528
        Top = 95
        Width = 52
        Height = 15
        Size.Values = (
          39.687500000000000000
          1397.000000000000000000
          251.354166666666700000
          137.583333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QCheckList_Moto
        DataField = 'TELEFONE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRShape13: TQRShape
        Left = 0
        Top = 180
        Width = 698
        Height = 4
        Size.Values = (
          10.583333333333330000
          0.000000000000000000
          476.250000000000000000
          1846.791666666667000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel242: TQRLabel
        Left = 136
        Top = 184
        Width = 204
        Height = 15
        Size.Values = (
          39.687500000000000000
          359.833333333333400000
          486.833333333333300000
          539.750000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Check List'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRSysData5: TQRSysData
        Left = 0
        Top = 16
        Width = 113
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          42.333333333333330000
          298.979166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsDateTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = 'Data/Hora : '
        Transparent = False
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel243: TQRLabel
        Left = 510
        Top = 1
        Width = 188
        Height = 15
        Size.Values = (
          39.687500000000000000
          1349.375000000000000000
          2.645833333333333000
          497.416666666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = True
        Caption = 'Sistema de Adm. de Empresas - Eficaz'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRSysData6: TQRSysData
        Left = 618
        Top = 16
        Width = 80
        Height = 15
        Size.Values = (
          39.687500000000000000
          1635.125000000000000000
          42.333333333333330000
          211.666666666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = True
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = 'P'#225'gina : '
        Transparent = False
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel244: TQRLabel
        Left = 302
        Top = 31
        Width = 94
        Height = 15
        Size.Values = (
          39.687500000000000000
          799.041666666666700000
          82.020833333333330000
          248.708333333333300000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = True
        Caption = '*** CHECK LIST ***'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText58: TQRDBText
        Left = 0
        Top = 1
        Width = 39
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          2.645833333333333000
          103.187500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = FrmPrincipal.QEmpresa
        DataField = 'RAZAO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRShape14: TQRShape
        Left = 0
        Top = 110
        Width = 698
        Height = 4
        Size.Values = (
          10.583333333333330000
          0.000000000000000000
          291.041666666666700000
          1846.791666666667000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel245: TQRLabel
        Left = 0
        Top = 114
        Width = 35
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          301.625000000000000000
          92.604166666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Modelo'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel246: TQRLabel
        Left = 0
        Top = 131
        Width = 41
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          346.604166666666700000
          108.479166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Mem'#243'ria'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel248: TQRLabel
        Left = 0
        Top = 149
        Width = 21
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          394.229166666666700000
          55.562500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'CPU'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel249: TQRLabel
        Left = 1
        Top = 165
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          2.645833333333333000
          436.562500000000000000
          39.687500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'HD'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel250: TQRLabel
        Left = 324
        Top = 50
        Width = 23
        Height = 15
        Size.Values = (
          39.687500000000000000
          857.250000000000000000
          132.291666666666700000
          60.854166666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Data'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText59: TQRDBText
        Left = 384
        Top = 50
        Width = 56
        Height = 15
        Size.Values = (
          39.687500000000000000
          1016.000000000000000000
          132.291666666666700000
          148.166666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QCheckList_Moto
        DataField = 'DT_ORDEM'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel251: TQRLabel
        Left = 480
        Top = 50
        Width = 30
        Height = 15
        Size.Values = (
          39.687500000000000000
          1270.000000000000000000
          132.291666666666700000
          79.375000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Horas'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText60: TQRDBText
        Left = 528
        Top = 50
        Width = 38
        Height = 15
        Size.Values = (
          39.687500000000000000
          1397.000000000000000000
          132.291666666666700000
          100.541666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QCheckList_Moto
        DataField = 'HORAS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel252: TQRLabel
        Left = 136
        Top = 218
        Width = 60
        Height = 15
        Size.Values = (
          39.687500000000000000
          359.833333333333400000
          576.791666666666700000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Conservado'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel253: TQRLabel
        Left = 208
        Top = 218
        Width = 60
        Height = 15
        Size.Values = (
          39.687500000000000000
          550.333333333333400000
          576.791666666666700000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Arranhado'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel254: TQRLabel
        Left = 280
        Top = 218
        Width = 60
        Height = 15
        Size.Values = (
          39.687500000000000000
          740.833333333333400000
          576.791666666666700000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Quebrado'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel255: TQRLabel
        Left = 136
        Top = 201
        Width = 60
        Height = 15
        Size.Values = (
          39.687500000000000000
          359.833333333333400000
          531.812500000000000000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = '(        )'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel256: TQRLabel
        Left = 208
        Top = 201
        Width = 60
        Height = 15
        Size.Values = (
          39.687500000000000000
          550.333333333333300000
          531.812500000000000000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = '(        )'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel257: TQRLabel
        Left = 280
        Top = 201
        Width = 60
        Height = 15
        Size.Values = (
          39.687500000000000000
          740.833333333333400000
          531.812500000000000000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = '(        )'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel264: TQRLabel
        Left = 0
        Top = 252
        Width = 114
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          666.750000000000000000
          301.625000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Estado Geral da Pintura'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel265: TQRLabel
        Left = 0
        Top = 269
        Width = 118
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          711.729166666666700000
          312.208333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Tampa Lateral Esquerda'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel266: TQRLabel
        Left = 0
        Top = 286
        Width = 102
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          756.708333333333300000
          269.875000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Tampa Lateral Direita'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel267: TQRLabel
        Left = 352
        Top = 252
        Width = 39
        Height = 15
        Size.Values = (
          39.687500000000000000
          931.333333333333300000
          666.750000000000000000
          103.187500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cd-Rom'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel268: TQRLabel
        Left = 352
        Top = 269
        Width = 35
        Height = 15
        Size.Values = (
          39.687500000000000000
          931.333333333333300000
          711.729166666666700000
          92.604166666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cd-Rw'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel269: TQRLabel
        Left = 352
        Top = 286
        Width = 45
        Height = 15
        Size.Values = (
          39.687500000000000000
          931.333333333333300000
          756.708333333333300000
          119.062500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Dvd-Rom'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel270: TQRLabel
        Left = 352
        Top = 303
        Width = 41
        Height = 15
        Size.Values = (
          39.687500000000000000
          931.333333333333300000
          801.687500000000000000
          108.479166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Dvd-Rw'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel271: TQRLabel
        Left = 352
        Top = 320
        Width = 85
        Height = 15
        Size.Values = (
          39.687500000000000000
          931.333333333333300000
          846.666666666666700000
          224.895833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Unidade Disquete'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel272: TQRLabel
        Left = 352
        Top = 337
        Width = 88
        Height = 15
        Size.Values = (
          39.687500000000000000
          931.333333333333300000
          891.645833333333300000
          232.833333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cabo Energia CPU'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel273: TQRLabel
        Left = 0
        Top = 428
        Width = 100
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          1132.416666666667000000
          264.583333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sistema Operacional'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel274: TQRLabel
        Left = 351
        Top = 355
        Width = 39
        Height = 15
        Size.Values = (
          39.687500000000000000
          928.687500000000000000
          939.270833333333300000
          103.187500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Teclado'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel275: TQRLabel
        Left = 351
        Top = 372
        Width = 33
        Height = 15
        Size.Values = (
          39.687500000000000000
          928.687500000000000000
          984.250000000000000000
          87.312500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Mouse'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel276: TQRLabel
        Left = 0
        Top = 308
        Width = 41
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          814.916666666666700000
          108.479166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Manuais'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel277: TQRLabel
        Left = 0
        Top = 325
        Width = 66
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          859.895833333333300000
          174.625000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cds-Originais'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel279: TQRLabel
        Left = 136
        Top = 252
        Width = 60
        Height = 15
        Size.Values = (
          39.687500000000000000
          359.833333333333400000
          666.750000000000000000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = '(        )'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel280: TQRLabel
        Left = 208
        Top = 252
        Width = 60
        Height = 15
        Size.Values = (
          39.687500000000000000
          550.333333333333400000
          666.750000000000000000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = '(        )'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel281: TQRLabel
        Left = 280
        Top = 252
        Width = 60
        Height = 15
        Size.Values = (
          39.687500000000000000
          740.833333333333400000
          666.750000000000000000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = '(        )'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel282: TQRLabel
        Left = 136
        Top = 269
        Width = 60
        Height = 15
        Size.Values = (
          39.687500000000000000
          359.833333333333400000
          711.729166666666700000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = '(        )'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel283: TQRLabel
        Left = 208
        Top = 269
        Width = 60
        Height = 15
        Size.Values = (
          39.687500000000000000
          550.333333333333400000
          711.729166666666700000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = '(        )'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel284: TQRLabel
        Left = 280
        Top = 269
        Width = 60
        Height = 15
        Size.Values = (
          39.687500000000000000
          740.833333333333400000
          711.729166666666700000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = '(        )'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel285: TQRLabel
        Left = 136
        Top = 286
        Width = 60
        Height = 15
        Size.Values = (
          39.687500000000000000
          359.833333333333400000
          756.708333333333400000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = '(        )'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel286: TQRLabel
        Left = 208
        Top = 286
        Width = 60
        Height = 15
        Size.Values = (
          39.687500000000000000
          550.333333333333400000
          756.708333333333400000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = '(        )'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel287: TQRLabel
        Left = 280
        Top = 286
        Width = 60
        Height = 15
        Size.Values = (
          39.687500000000000000
          740.833333333333400000
          756.708333333333400000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = '(        )'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel288: TQRLabel
        Left = 488
        Top = 252
        Width = 60
        Height = 15
        Size.Values = (
          39.687500000000000000
          1291.166666666667000000
          666.750000000000000000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = '(        )'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel289: TQRLabel
        Left = 560
        Top = 252
        Width = 60
        Height = 15
        Size.Values = (
          39.687500000000000000
          1481.666666666667000000
          666.750000000000000000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = '(        )'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel290: TQRLabel
        Left = 632
        Top = 252
        Width = 60
        Height = 15
        Size.Values = (
          39.687500000000000000
          1672.166666666667000000
          666.750000000000000000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = '(        )'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel291: TQRLabel
        Left = 488
        Top = 269
        Width = 60
        Height = 15
        Size.Values = (
          39.687500000000000000
          1291.166666666667000000
          711.729166666666700000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = '(        )'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel292: TQRLabel
        Left = 560
        Top = 269
        Width = 60
        Height = 15
        Size.Values = (
          39.687500000000000000
          1481.666666666667000000
          711.729166666666700000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = '(        )'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel293: TQRLabel
        Left = 632
        Top = 269
        Width = 60
        Height = 15
        Size.Values = (
          39.687500000000000000
          1672.166666666667000000
          711.729166666666700000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = '(        )'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel294: TQRLabel
        Left = 488
        Top = 286
        Width = 60
        Height = 15
        Size.Values = (
          39.687500000000000000
          1291.166666666667000000
          756.708333333333300000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = '(        )'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel295: TQRLabel
        Left = 560
        Top = 286
        Width = 60
        Height = 15
        Size.Values = (
          39.687500000000000000
          1481.666666666667000000
          756.708333333333300000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = '(        )'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel296: TQRLabel
        Left = 632
        Top = 286
        Width = 60
        Height = 15
        Size.Values = (
          39.687500000000000000
          1672.166666666667000000
          756.708333333333300000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = '(        )'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel297: TQRLabel
        Left = 488
        Top = 303
        Width = 60
        Height = 15
        Size.Values = (
          39.687500000000000000
          1291.166666666667000000
          801.687500000000000000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = '(        )'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel298: TQRLabel
        Left = 560
        Top = 303
        Width = 60
        Height = 15
        Size.Values = (
          39.687500000000000000
          1481.666666666667000000
          801.687500000000000000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = '(        )'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel299: TQRLabel
        Left = 632
        Top = 303
        Width = 60
        Height = 15
        Size.Values = (
          39.687500000000000000
          1672.166666666667000000
          801.687500000000000000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = '(        )'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel300: TQRLabel
        Left = 488
        Top = 320
        Width = 60
        Height = 15
        Size.Values = (
          39.687500000000000000
          1291.166666666667000000
          846.666666666666700000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = '(        )'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel301: TQRLabel
        Left = 560
        Top = 320
        Width = 60
        Height = 15
        Size.Values = (
          39.687500000000000000
          1481.666666666667000000
          846.666666666666700000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = '(        )'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel302: TQRLabel
        Left = 632
        Top = 320
        Width = 60
        Height = 15
        Size.Values = (
          39.687500000000000000
          1672.166666666667000000
          846.666666666666700000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = '(        )'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel303: TQRLabel
        Left = 488
        Top = 337
        Width = 60
        Height = 15
        Size.Values = (
          39.687500000000000000
          1291.166666666667000000
          891.645833333333300000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = '(        )'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel304: TQRLabel
        Left = 560
        Top = 337
        Width = 60
        Height = 15
        Size.Values = (
          39.687500000000000000
          1481.666666666667000000
          891.645833333333300000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = '(        )'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel305: TQRLabel
        Left = 632
        Top = 337
        Width = 60
        Height = 15
        Size.Values = (
          39.687500000000000000
          1672.166666666667000000
          891.645833333333300000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = '(        )'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel306: TQRLabel
        Left = 135
        Top = 428
        Width = 60
        Height = 15
        Size.Values = (
          39.687500000000000000
          357.187500000000000000
          1132.416666666667000000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = '(        )'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel307: TQRLabel
        Left = 267
        Top = 428
        Width = 60
        Height = 15
        Size.Values = (
          39.687500000000000000
          706.437500000000000000
          1132.416666666667000000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = '(        )'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel308: TQRLabel
        Left = 427
        Top = 428
        Width = 60
        Height = 15
        Size.Values = (
          39.687500000000000000
          1129.770833333333000000
          1132.416666666667000000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = '(        )'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel309: TQRLabel
        Left = 487
        Top = 355
        Width = 60
        Height = 15
        Size.Values = (
          39.687500000000000000
          1288.520833333333000000
          939.270833333333300000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = '(        )'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel311: TQRLabel
        Left = 631
        Top = 355
        Width = 60
        Height = 15
        Size.Values = (
          39.687500000000000000
          1669.520833333333000000
          939.270833333333300000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = '(        )'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel312: TQRLabel
        Left = 487
        Top = 372
        Width = 60
        Height = 15
        Size.Values = (
          39.687500000000000000
          1288.520833333333000000
          984.250000000000000000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = '(        )'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel314: TQRLabel
        Left = 631
        Top = 372
        Width = 60
        Height = 15
        Size.Values = (
          39.687500000000000000
          1669.520833333333000000
          984.250000000000000000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = '(        )'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel315: TQRLabel
        Left = 136
        Top = 308
        Width = 60
        Height = 15
        Size.Values = (
          39.687500000000000000
          359.833333333333300000
          814.916666666666700000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = '(        )'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel316: TQRLabel
        Left = 236
        Top = 308
        Width = 60
        Height = 15
        Size.Values = (
          39.687500000000000000
          624.416666666666700000
          814.916666666666700000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = '(        )'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel317: TQRLabel
        Left = 136
        Top = 325
        Width = 60
        Height = 15
        Size.Values = (
          39.687500000000000000
          359.833333333333300000
          859.895833333333300000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = '(        )'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel318: TQRLabel
        Left = 236
        Top = 325
        Width = 60
        Height = 15
        Size.Values = (
          39.687500000000000000
          624.416666666666700000
          859.895833333333300000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = '(        )'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel321: TQRLabel
        Left = 308
        Top = 308
        Width = 24
        Height = 15
        Size.Values = (
          39.687500000000000000
          814.916666666666700000
          814.916666666666700000
          63.500000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'N'#195'O'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel322: TQRLabel
        Left = 308
        Top = 325
        Width = 24
        Height = 15
        Size.Values = (
          39.687500000000000000
          814.916666666666700000
          859.895833333333300000
          63.500000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'N'#195'O'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel324: TQRLabel
        Left = 208
        Top = 308
        Width = 18
        Height = 15
        Size.Values = (
          39.687500000000000000
          550.333333333333300000
          814.916666666666700000
          47.625000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'SIM'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel325: TQRLabel
        Left = 208
        Top = 325
        Width = 18
        Height = 15
        Size.Values = (
          39.687500000000000000
          550.333333333333300000
          859.895833333333300000
          47.625000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'SIM'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape15: TQRShape
        Left = 0
        Top = 507
        Width = 698
        Height = 4
        Size.Values = (
          10.583333333333330000
          0.000000000000000000
          1341.437500000000000000
          1846.791666666667000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel397: TQRLabel
        Left = 291
        Top = 513
        Width = 116
        Height = 17
        Size.Values = (
          44.979166666666670000
          769.937500000000000000
          1357.312500000000000000
          306.916666666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = True
        Caption = 'REQUISI'#199#195'O DE PE'#199'AS'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape16: TQRShape
        Left = 0
        Top = 530
        Width = 698
        Height = 4
        Size.Values = (
          10.583333333333330000
          0.000000000000000000
          1402.291666666667000000
          1846.791666666667000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRMemo2: TQRMemo
        Left = 0
        Top = 544
        Width = 698
        Height = 217
        Size.Values = (
          574.145833333333400000
          0.000000000000000000
          1439.333333333333000000
          1846.791666666667000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Lines.Strings = (
          
            '________________________________________________________________' +
            '____________________________________'
          
            '________________________________________________________________' +
            '____________________________________'
          
            '________________________________________________________________' +
            '____________________________________'
          
            '________________________________________________________________' +
            '____________________________________'
          
            '________________________________________________________________' +
            '____________________________________'
          
            '________________________________________________________________' +
            '____________________________________'
          
            '________________________________________________________________' +
            '____________________________________')
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel398: TQRLabel
        Left = 306
        Top = 202
        Width = 8
        Height = 15
        Size.Values = (
          39.687500000000000000
          809.625000000000000000
          534.458333333333300000
          21.166666666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'X'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel400: TQRLabel
        Left = 306
        Top = 252
        Width = 8
        Height = 15
        Size.Values = (
          39.687500000000000000
          809.625000000000000000
          666.750000000000000000
          21.166666666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'X'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel401: TQRLabel
        Left = 306
        Top = 269
        Width = 8
        Height = 15
        Size.Values = (
          39.687500000000000000
          809.625000000000000000
          711.729166666666700000
          21.166666666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'X'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel402: TQRLabel
        Left = 306
        Top = 286
        Width = 8
        Height = 15
        Size.Values = (
          39.687500000000000000
          809.625000000000000000
          756.708333333333300000
          21.166666666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'X'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel409: TQRLabel
        Left = 160
        Top = 429
        Width = 8
        Height = 15
        Size.Values = (
          39.687500000000000000
          423.333333333333300000
          1135.062500000000000000
          21.166666666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'X'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel412: TQRLabel
        Left = 264
        Top = 308
        Width = 8
        Height = 15
        Size.Values = (
          39.687500000000000000
          698.500000000000000000
          814.916666666666700000
          21.166666666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'X'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel413: TQRLabel
        Left = 264
        Top = 325
        Width = 8
        Height = 15
        Size.Values = (
          39.687500000000000000
          698.500000000000000000
          859.895833333333300000
          21.166666666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'X'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText61: TQRDBText
        Left = 52
        Top = 114
        Width = 44
        Height = 15
        Size.Values = (
          39.687500000000000000
          137.583333333333300000
          301.625000000000000000
          116.416666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QCheckList_Moto
        DataField = 'MODELO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText62: TQRDBText
        Left = 52
        Top = 131
        Width = 23
        Height = 15
        Size.Values = (
          39.687500000000000000
          137.583333333333300000
          346.604166666666700000
          60.854166666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QCheckList_Moto
        DataField = 'COR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText64: TQRDBText
        Left = 52
        Top = 149
        Width = 36
        Height = 15
        Size.Values = (
          39.687500000000000000
          137.583333333333300000
          394.229166666666700000
          95.250000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QCheckList_Moto
        DataField = 'PLACA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText65: TQRDBText
        Left = 53
        Top = 166
        Width = 24
        Height = 15
        Size.Values = (
          39.687500000000000000
          140.229166666666700000
          439.208333333333300000
          63.500000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QCheckList_Moto
        DataField = 'ANO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Mask = '#,####'
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText66: TQRDBText
        Left = 640
        Top = 50
        Width = 52
        Height = 15
        Size.Values = (
          39.687500000000000000
          1693.333333333333000000
          132.291666666666700000
          137.583333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QCheckList_Moto
        DataField = 'ORDEM_ID'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel429: TQRLabel
        Left = 624
        Top = 50
        Width = 10
        Height = 15
        Size.Values = (
          39.687500000000000000
          1651.000000000000000000
          132.291666666666700000
          26.458333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'ID'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel258: TQRLabel
        Left = 201
        Top = 428
        Width = 60
        Height = 15
        Size.Values = (
          39.687500000000000000
          531.812500000000000000
          1132.416666666667000000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Windows'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel259: TQRLabel
        Left = 351
        Top = 428
        Width = 60
        Height = 15
        Size.Values = (
          39.687500000000000000
          928.687500000000000000
          1132.416666666667000000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Linux'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel260: TQRLabel
        Left = 493
        Top = 428
        Width = 60
        Height = 15
        Size.Values = (
          39.687500000000000000
          1304.395833333333000000
          1132.416666666667000000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Outro'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel261: TQRLabel
        Left = 487
        Top = 223
        Width = 60
        Height = 15
        Size.Values = (
          39.687500000000000000
          1288.520833333333000000
          590.020833333333300000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Sim'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel262: TQRLabel
        Left = 559
        Top = 223
        Width = 60
        Height = 15
        Size.Values = (
          39.687500000000000000
          1479.020833333333000000
          590.020833333333300000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'N'#227'o'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel263: TQRLabel
        Left = 631
        Top = 223
        Width = 60
        Height = 15
        Size.Values = (
          39.687500000000000000
          1669.520833333333000000
          590.020833333333300000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Quebrado'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel241: TQRLabel
        Left = 560
        Top = 372
        Width = 60
        Height = 15
        Size.Values = (
          39.687500000000000000
          1481.666666666667000000
          984.250000000000000000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = '(        )'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel247: TQRLabel
        Left = 560
        Top = 355
        Width = 60
        Height = 15
        Size.Values = (
          39.687500000000000000
          1481.666666666667000000
          939.270833333333300000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = '(        )'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel278: TQRLabel
        Left = 658
        Top = 252
        Width = 8
        Height = 15
        Size.Values = (
          39.687500000000000000
          1740.958333333333000000
          666.750000000000000000
          21.166666666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'X'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel310: TQRLabel
        Left = 658
        Top = 269
        Width = 8
        Height = 15
        Size.Values = (
          39.687500000000000000
          1740.958333333333000000
          711.729166666666700000
          21.166666666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'X'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel313: TQRLabel
        Left = 658
        Top = 286
        Width = 8
        Height = 15
        Size.Values = (
          39.687500000000000000
          1740.958333333333000000
          756.708333333333300000
          21.166666666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'X'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel319: TQRLabel
        Left = 658
        Top = 303
        Width = 8
        Height = 15
        Size.Values = (
          39.687500000000000000
          1740.958333333333000000
          801.687500000000000000
          21.166666666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'X'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel320: TQRLabel
        Left = 658
        Top = 320
        Width = 8
        Height = 15
        Size.Values = (
          39.687500000000000000
          1740.958333333333000000
          846.666666666666700000
          21.166666666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'X'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel323: TQRLabel
        Left = 658
        Top = 337
        Width = 8
        Height = 15
        Size.Values = (
          39.687500000000000000
          1740.958333333333000000
          891.645833333333300000
          21.166666666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'X'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel326: TQRLabel
        Left = 658
        Top = 355
        Width = 8
        Height = 15
        Size.Values = (
          39.687500000000000000
          1740.958333333333000000
          939.270833333333300000
          21.166666666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'X'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel327: TQRLabel
        Left = 658
        Top = 373
        Width = 8
        Height = 15
        Size.Values = (
          39.687500000000000000
          1740.958333333333000000
          986.895833333333300000
          21.166666666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'X'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel328: TQRLabel
        Left = 83
        Top = 166
        Width = 16
        Height = 15
        Size.Values = (
          39.687500000000000000
          219.604166666666700000
          439.208333333333300000
          42.333333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'GB'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
    end
  end
  object DataTabela: TDataSource
    AutoEdit = False
    DataSet = QTabela
    Left = 88
    Top = 304
  end
  object DataEmpresa: TDataSource
    DataSet = QEmpresa
    Left = 184
    Top = 320
  end
  object DataCliente: TDataSource
    DataSet = QCliente
    Left = 312
    Top = 352
  end
  object DataSub_Detail: TDataSource
    DataSet = QSub_Detail
    Left = 392
    Top = 352
  end
  object DataVendedor: TDataSource
    DataSet = QVendedor
    Left = 488
    Top = 352
  end
  object DataAtendente: TDataSource
    DataSet = QAtendente
    Left = 208
    Top = 352
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
    OpcoesPreview.Remalina = True
    OpcoesPreview.CaptionPreview = 'Preview'
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
    CaptionSetup = 'Configura'#231#227'o Impress'#227'o'
    TitulodoRelatorio = 'Or'#231'amento'
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
      'GENERICO=EPSON'
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
    TamanhoQteLinhas = 32
    TamanhoQteColunas = 80
    TamanhoQteLPP = Seis
    NumerodeCopias = 1
    FonteTamanhoPadrao = S10cpp
    FonteEstiloPadrao = []
    Orientacao = poPortrait
    OnBeforeNewPage = RDprint1BeforeNewPage
    Left = 248
    Top = 350
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
    Left = 456
    Top = 352
    ParamData = <
      item
        Name = 'CLIENTE_ID'
        ParamType = ptInput
      end>
  end
  object QVendedor: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM FUNCIONARIOS'
      'WHERE'
      '(FUNCIONARIO_ID = :FUNCIONARIO_ID)'
      'AND (STATUS = '#39'A'#39')')
    Left = 232
    Top = 312
    ParamData = <
      item
        Name = 'FUNCIONARIO_ID'
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
    Left = 152
    Top = 304
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
    Left = 120
    Top = 304
  end
  object QTabela: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evItems, evRecsMax, evCache, evAutoFetchAll]
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      ''
      'SELECT * FROM ORDEM_SERVICO')
    Left = 48
    Top = 304
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
      'SELECT * FROM ORDEM_ITENS'
      'WHERE'
      '(ORDEM_ID = :ORDEM_ID)')
    Left = 352
    Top = 352
    ParamData = <
      item
        Name = 'ORDEM_ID'
        ParamType = ptInput
      end>
  end
  object QAtendente: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM FUNCIONARIOS'
      'WHERE'
      '(FUNCIONARIO_ID = :FUNCIONARIO_ID)'
      'AND (STATUS = '#39'A'#39')')
    Left = 176
    Top = 352
    ParamData = <
      item
        Name = 'FUNCIONARIO_ID'
        ParamType = ptInput
      end>
  end
  object QCheckList_Moto: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 144
    Top = 352
  end
  object QServico: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM SERVICOS'
      'WHERE'
      '(SERVICO_ID = :SERVICO_ID)'
      'AND (STATUS = '#39'A'#39')')
    Left = 112
    Top = 352
    ParamData = <
      item
        Name = 'SERVICO_ID'
        ParamType = ptInput
      end>
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
    Left = 80
    Top = 352
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
    Left = 48
    Top = 352
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
  object USql_OrcItens: TFDUpdateSQL
    InsertSQL.Strings = (
      'insert into ORDEM_ITENS'
      
        '  (ALIQUOTA_ICMS, BASE_CALC_ICMS, CODIGO_ITEM, CST, DESCRICAO, M' +
        'VA, ORDEM_ID, '
      
        '   QUANTIDADE, TP_PROD_SERV, TRIBUTO_ID, VR_DESCONTO, VR_IPI, VR' +
        '_TOTAL, '
      '   VR_UNITARIO)'
      'values'
      
        '  (:ALIQUOTA_ICMS, :BASE_CALC_ICMS, :CODIGO_ITEM, :CST, :DESCRIC' +
        'AO, :MVA, '
      
        '   :ORDEM_ID, :QUANTIDADE, :TP_PROD_SERV, :TRIBUTO_ID, :VR_DESCO' +
        'NTO, :VR_IPI, '
      '   :VR_TOTAL, :VR_UNITARIO)')
    ModifySQL.Strings = (
      'update ORDEM_ITENS'
      'set'
      '  ALIQUOTA_ICMS = :ALIQUOTA_ICMS,'
      '  BASE_CALC_ICMS = :BASE_CALC_ICMS,'
      '  CODIGO_ITEM = :CODIGO_ITEM,'
      '  CST = :CST,'
      '  DESCRICAO = :DESCRICAO,'
      '  MVA = :MVA,'
      '  ORDEM_ID = :ORDEM_ID,'
      '  QUANTIDADE = :QUANTIDADE,'
      '  TP_PROD_SERV = :TP_PROD_SERV,'
      '  TRIBUTO_ID = :TRIBUTO_ID,'
      '  VR_DESCONTO = :VR_DESCONTO,'
      '  VR_IPI = :VR_IPI,'
      '  VR_TOTAL = :VR_TOTAL,'
      '  VR_UNITARIO = :VR_UNITARIO'
      'where'
      '  CODIGO_ITEM = :OLD_CODIGO_ITEM and'
      '  ORDEM_ID = :OLD_ORDEM_ID')
    DeleteSQL.Strings = (
      'delete from ORDEM_ITENS'
      'where'
      '  CODIGO_ITEM = :OLD_CODIGO_ITEM and'
      '  ORDEM_ID = :OLD_ORDEM_ID')
    FetchRowSQL.Strings = (
      'Select '
      '  ORDEM_ID,'
      '  CODIGO_ITEM,'
      '  TP_PROD_SERV,'
      '  DESCRICAO,'
      '  TRIBUTO_ID,'
      '  CST,'
      '  MVA,'
      '  BASE_CALC_ICMS,'
      '  ALIQUOTA_ICMS,'
      '  VR_IPI,'
      '  QUANTIDADE,'
      '  VR_UNITARIO,'
      '  VR_DESCONTO,'
      '  VR_TOTAL'
      'from ORDEM_ITENS '
      'where'
      '  CODIGO_ITEM = :CODIGO_ITEM and'
      '  ORDEM_ID = :ORDEM_ID')
    Left = 276
    Top = 351
  end
  object QOrdem_Lacre: TFDQuery
    BeforeInsert = QOrdem_LacreBeforeInsert
    BeforeEdit = QOrdem_LacreBeforeEdit
    BeforeDelete = QOrdem_LacreBeforeDelete
    OnNewRecord = QOrdem_LacreNewRecord
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM ORDEM_LACRE'
      'WHERE'
      '(ORDEM_ID = :ORDEM_ID)')
    Left = 424
    Top = 352
    ParamData = <
      item
        Name = 'ORDEM_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object DataOrdemLacre: TDataSource
    DataSet = QOrdem_Lacre
    Left = 496
    Top = 560
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
      'AND (TRANSPARCELAS.TIPO_TRANSACAO ='#39'T'#39')'
      'AND (TRANSACOES.COND_PAGTO = '#39'A PRAZO'#39')'
      'ORDER BY DT_VENCIMENTO')
    Left = 544
    Top = 352
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
      'AND (TRANSPARCELAS.TIPO_TRANSACAO ='#39'T'#39')'
      'AND (TRANSACOES.COND_PAGTO = '#39'A PRAZO'#39')'
      'ORDER BY DT_VENCIMENTO')
    Left = 584
    Top = 352
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
  object QUpdate: TFDQuery
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
      'AND (TRANSPARCELAS.TIPO_TRANSACAO ='#39'T'#39')'
      'AND (TRANSACOES.COND_PAGTO = '#39'A PRAZO'#39')'
      'ORDER BY DT_VENCIMENTO')
    Left = 624
    Top = 352
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
  object QSearch: TFDQuery
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
      'AND (TRANSPARCELAS.TIPO_TRANSACAO ='#39'T'#39')'
      'AND (TRANSACOES.COND_PAGTO = '#39'A PRAZO'#39')'
      'ORDER BY DT_VENCIMENTO')
    Left = 584
    Top = 312
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
end
