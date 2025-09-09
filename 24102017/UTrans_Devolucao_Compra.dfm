object FrmTrans_Devolucao_Compra: TFrmTrans_Devolucao_Compra
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Devolu'#231#227'o de Entrada'
  ClientHeight = 635
  ClientWidth = 853
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 853
    Height = 584
    ActivePage = Manutencao
    Align = alClient
    TabOrder = 0
    object Consulta: TTabSheet
      Caption = '&Consulta'
      OnShow = ConsultaShow
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 845
        Height = 535
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
        PopupMenu = PopupMenu1
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
            FieldName = 'TRANSACAO_ID'
            Title.Alignment = taRightJustify
            Title.Caption = 'ID'
            Width = 54
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_TRANS'
            Title.Caption = 'Dt. Transa'#231#227'o'
            Width = 76
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_MOVIMENTO'
            Title.Caption = 'Dt. Movimento'
            Width = 77
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUM_DOC'
            Title.Caption = 'N'#186' Documento'
            Width = 78
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR'
            Title.Alignment = taRightJustify
            Title.Caption = 'Valor'
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BALANCO'
            Title.Caption = 'Balan'#231'o'
            Width = 73
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'HISTORICO'
            Title.Caption = 'Hist'#243'rico'
            Width = 257
            Visible = True
          end>
      end
      object Dias: TTabSet
        Left = 0
        Top = 535
        Width = 845
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
      object DBText1: TDBText
        Left = 700
        Top = 87
        Width = 135
        Height = 13
        DataField = 'RAZAO'
        DataSource = DataEmpresa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText2: TDBText
        Left = 203
        Top = 87
        Width = 169
        Height = 13
        DataField = 'NOME'
        DataSource = DataFornecedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText3: TDBText
        Left = 203
        Top = 113
        Width = 169
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
      object DBText4: TDBText
        Left = 203
        Top = 165
        Width = 169
        Height = 13
        DataField = 'DESCRICAO'
        DataSource = DataBanco
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText5: TDBText
        Left = 700
        Top = 113
        Width = 135
        Height = 13
        DataField = 'DESCRICAO'
        DataSource = DataCusto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 6
        Top = 61
        Width = 66
        Height = 13
        Caption = 'Data N. Fiscal'
      end
      object Label2: TLabel
        Left = 347
        Top = 61
        Width = 52
        Height = 13
        Caption = 'Dt. Movim.'
      end
      object Label4: TLabel
        Left = 515
        Top = 61
        Width = 65
        Height = 13
        Caption = 'NF/S'#233'rie/Mod'
      end
      object Label5: TLabel
        Left = 728
        Top = 61
        Width = 40
        Height = 13
        Caption = 'C.F.O.P.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 6
        Top = 87
        Width = 64
        Height = 13
        Caption = 'Fornecedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label15: TLabel
        Left = 515
        Top = 87
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
      object Label6: TLabel
        Left = 6
        Top = 113
        Width = 70
        Height = 13
        Caption = 'Cta. Estoque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 515
        Top = 113
        Width = 45
        Height = 13
        Caption = 'C. Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 6
        Top = 139
        Width = 41
        Height = 13
        Caption = 'Hist'#243'rico'
      end
      object Label12: TLabel
        Left = 6
        Top = 165
        Width = 71
        Height = 13
        Caption = 'Caixa/Banco'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnEmpresa: TSpeedButton
        Left = 633
        Top = 84
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
        Left = 135
        Top = 84
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
      object btnConta: TSpeedButton
        Left = 135
        Top = 110
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
        OnClick = btnContaClick
      end
      object btnBanco: TSpeedButton
        Left = 133
        Top = 161
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
        OnClick = btnBancoClick
      end
      object btnCentro_Custo: TSpeedButton
        Left = 633
        Top = 110
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
        OnClick = btnCentro_CustoClick
      end
      object Label7: TLabel
        Left = 515
        Top = 139
        Width = 60
        Height = 13
        Caption = 'Entrada ID'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 6
        Top = 191
        Width = 64
        Height = 13
        Caption = 'Fluxo Caixa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnFluxoCaixa: TSpeedButton
        Left = 133
        Top = 188
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
        OnClick = btnFluxoCaixaClick
      end
      object DBText6: TDBText
        Left = 203
        Top = 191
        Width = 48
        Height = 13
        AutoSize = True
        DataField = 'DESCRICAO'
        DataSource = DataFluxo_Caixa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnTrans: TSpeedButton
        Left = 633
        Top = 136
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
        OnClick = btnTransClick
      end
      object Label31: TLabel
        Left = 199
        Top = 61
        Width = 44
        Height = 13
        Caption = 'Dt. Sa'#237'da'
      end
      object Label32: TLabel
        Left = 6
        Top = 216
        Width = 19
        Height = 13
        Caption = 'Obs'
      end
      object Label18: TLabel
        Left = 501
        Top = 227
        Width = 79
        Height = 13
        Caption = 'Ch. Nfe/NF Ref'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label37: TLabel
        Left = 556
        Top = 166
        Width = 23
        Height = 13
        Caption = 'Hora'
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 845
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object btnPrior: TBitBtn
          Left = 63
          Top = 9
          Width = 75
          Height = 25
          Caption = 'Anterior'
          TabOrder = 0
          OnClick = btnPriorClick
        end
        object btnNext: TBitBtn
          Left = 169
          Top = 9
          Width = 75
          Height = 25
          Caption = 'Pr'#243'ximo'
          TabOrder = 1
          OnClick = btnNextClick
        end
        object btnInsert: TBitBtn
          Left = 275
          Top = 9
          Width = 75
          Height = 25
          Caption = '&Incluir'
          TabOrder = 2
          OnClick = btnInsertClick
        end
        object btnEdit: TBitBtn
          Left = 382
          Top = 9
          Width = 75
          Height = 25
          Caption = 'A&lterar'
          TabOrder = 3
          OnClick = btnEditClick
        end
        object btnDelete: TBitBtn
          Left = 488
          Top = 9
          Width = 75
          Height = 25
          Caption = '&Excluir'
          TabOrder = 4
          OnClick = btnDeleteClick
        end
        object btnSave: TBitBtn
          Left = 598
          Top = 9
          Width = 75
          Height = 25
          Caption = '&Salvar'
          TabOrder = 5
          OnClick = btnSaveClick
        end
        object btnDiscard: TBitBtn
          Left = 701
          Top = 9
          Width = 75
          Height = 25
          Caption = 'C&ancelar'
          TabOrder = 6
          OnClick = btnDiscardClick
        end
      end
      object DT_TRANS: TDateEdit
        Left = 85
        Top = 58
        Width = 90
        Height = 21
        CheckOnExit = True
        DialogTitle = 'Selecione a Data'
        Enabled = False
        NumGlyphs = 2
        TabOrder = 1
        OnEnter = DT_TRANSEnter
        OnKeyDown = DT_TRANSKeyDown
      end
      object EMPRESA_ID: TCurrencyEdit
        Left = 583
        Top = 84
        Width = 47
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0;-0'
        Enabled = False
        TabOrder = 9
        ZeroEmpty = False
        OnExit = EMPRESA_IDExit
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object FORNECEDOR_ID: TCurrencyEdit
        Left = 85
        Top = 84
        Width = 47
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0;-0'
        Enabled = False
        TabOrder = 8
        ZeroEmpty = False
        OnExit = FORNECEDOR_IDExit
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object CONTA_ID: TCurrencyEdit
        Left = 85
        Top = 110
        Width = 47
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0;-0'
        Enabled = False
        TabOrder = 10
        ZeroEmpty = False
        OnExit = CONTA_IDExit
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object HISTORICO: TEdit
        Left = 85
        Top = 136
        Width = 412
        Height = 21
        Enabled = False
        MaxLength = 150
        TabOrder = 12
        OnKeyDown = DT_TRANSKeyDown
      end
      object NUM_DOC: TEdit
        Left = 583
        Top = 58
        Width = 60
        Height = 21
        Enabled = False
        MaxLength = 7
        TabOrder = 4
        OnKeyDown = DT_TRANSKeyDown
      end
      object BANCO_ID: TCurrencyEdit
        Left = 85
        Top = 161
        Width = 47
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0;-0'
        Enabled = False
        TabOrder = 14
        ZeroEmpty = False
        OnExit = BANCO_IDExit
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object C_CUSTO_ID: TCurrencyEdit
        Left = 583
        Top = 110
        Width = 47
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0;-0'
        Enabled = False
        TabOrder = 11
        ZeroEmpty = False
        OnExit = C_CUSTO_IDExit
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object DT_MOVIMENTO: TDateEdit
        Left = 407
        Top = 58
        Width = 90
        Height = 21
        CheckOnExit = True
        DialogTitle = 'Selecione a Data'
        Enabled = False
        NumGlyphs = 2
        TabOrder = 3
        OnEnter = DT_TRANSEnter
        OnKeyDown = DT_TRANSKeyDown
      end
      object CFOP: TEdit
        Left = 774
        Top = 58
        Width = 61
        Height = 21
        Enabled = False
        MaxLength = 4
        TabOrder = 7
        OnExit = CFOPExit
        OnKeyDown = DT_TRANSKeyDown
      end
      object Panel3: TPanel
        Left = 0
        Top = 474
        Width = 845
        Height = 82
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 21
        object Label13: TLabel
          Left = 6
          Top = 9
          Width = 65
          Height = 13
          Caption = 'B. C'#225'lc. ICMS'
        end
        object Label17: TLabel
          Left = 231
          Top = 9
          Width = 42
          Height = 13
          Caption = 'Vr. ICMS'
        end
        object Label20: TLabel
          Left = 451
          Top = 9
          Width = 80
          Height = 13
          Caption = 'B. C'#225'lc. ICMS ST'
        end
        object Label21: TLabel
          Left = 671
          Top = 6
          Width = 43
          Height = 13
          Caption = 'Vr. Prod.'
        end
        object Label14: TLabel
          Left = 6
          Top = 35
          Width = 57
          Height = 13
          Caption = 'Vr. ICMS ST'
        end
        object Label19: TLabel
          Left = 231
          Top = 35
          Width = 31
          Height = 13
          Caption = 'Vr. IPI'
        end
        object Label25: TLabel
          Left = 451
          Top = 35
          Width = 65
          Height = 13
          Caption = 'Vr. Acr'#233'scimo'
        end
        object Label24: TLabel
          Left = 674
          Top = 35
          Width = 44
          Height = 13
          Caption = 'Vr. Desc.'
        end
        object Label10: TLabel
          Left = 6
          Top = 61
          Width = 68
          Height = 13
          Caption = 'Desc. Especial'
        end
        object Label16: TLabel
          Left = 231
          Top = 61
          Width = 70
          Height = 13
          Caption = 'Desc. Fin. (%)'
        end
        object Label23: TLabel
          Left = 451
          Top = 61
          Width = 53
          Height = 13
          Caption = 'Valor Frete'
        end
        object Label22: TLabel
          Left = 674
          Top = 61
          Width = 40
          Height = 13
          Caption = 'Valor NF'
        end
        object BASE_ICMS_NORMAL: TRxCalcEdit
          Left = 79
          Top = 6
          Width = 95
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
          Enabled = False
          NumGlyphs = 2
          TabOrder = 0
          ZeroEmpty = False
          OnKeyDown = EMPRESA_IDKeyDown
        end
        object VR_ICMS_NORMAL: TRxCalcEdit
          Left = 305
          Top = 6
          Width = 95
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
          Enabled = False
          NumGlyphs = 2
          TabOrder = 1
          ZeroEmpty = False
          OnKeyDown = EMPRESA_IDKeyDown
        end
        object BASE_ICMS_ST: TRxCalcEdit
          Left = 539
          Top = 6
          Width = 95
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
          Enabled = False
          NumGlyphs = 2
          TabOrder = 2
          ZeroEmpty = False
          OnKeyDown = EMPRESA_IDKeyDown
        end
        object VALOR_PRODUTOS: TRxCalcEdit
          Left = 721
          Top = 6
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
        object VR_ICMS_ST: TRxCalcEdit
          Left = 79
          Top = 32
          Width = 95
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
          Enabled = False
          NumGlyphs = 2
          TabOrder = 4
          ZeroEmpty = False
          OnKeyDown = EMPRESA_IDKeyDown
        end
        object VR_IPI: TRxCalcEdit
          Left = 305
          Top = 32
          Width = 95
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
          Enabled = False
          NumGlyphs = 2
          TabOrder = 5
          ZeroEmpty = False
          OnKeyDown = EMPRESA_IDKeyDown
        end
        object VR_ACRESCIMO: TRxCalcEdit
          Left = 539
          Top = 32
          Width = 95
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
          Enabled = False
          NumGlyphs = 2
          TabOrder = 6
          ZeroEmpty = False
          OnKeyDown = EMPRESA_IDKeyDown
        end
        object VR_DESCONTO: TRxCalcEdit
          Left = 721
          Top = 32
          Width = 95
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
          Enabled = False
          NumGlyphs = 2
          ReadOnly = True
          TabOrder = 7
          ZeroEmpty = False
          OnKeyDown = EMPRESA_IDKeyDown
        end
        object DESCONTO_ESPECIAL: TRxCalcEdit
          Left = 79
          Top = 58
          Width = 95
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
          Enabled = False
          NumGlyphs = 2
          TabOrder = 8
          ZeroEmpty = False
          OnKeyDown = EMPRESA_IDKeyDown
        end
        object DESCONTO_FINANCEIRO: TRxCalcEdit
          Left = 305
          Top = 58
          Width = 95
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          DecimalPlaces = 4
          DisplayFormat = '0.0000;-0.0000'
          Enabled = False
          NumGlyphs = 2
          TabOrder = 9
          ZeroEmpty = False
          OnKeyDown = EMPRESA_IDKeyDown
        end
        object VR_FRETE: TRxCalcEdit
          Left = 539
          Top = 58
          Width = 95
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
          Enabled = False
          MaxValue = 99999.000000000000000000
          NumGlyphs = 2
          TabOrder = 10
          ZeroEmpty = False
          OnExit = VR_FRETEExit
          OnKeyDown = EMPRESA_IDKeyDown
        end
        object VALOR: TRxCalcEdit
          Left = 721
          Top = 58
          Width = 95
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
          Enabled = False
          NumGlyphs = 2
          ReadOnly = True
          TabOrder = 11
          ZeroEmpty = False
          OnKeyDown = EMPRESA_IDKeyDown
        end
      end
      object StatusBar1: TStatusBar
        Left = 6
        Top = 456
        Width = 829
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
            Text = '<F5> - Imp. Itens do Pedido'
            Width = 166
          end
          item
            Text = '<F4> - Exclui Item'
            Width = 166
          end
          item
            Text = '<F6> - Impostos'
            Width = 166
          end
          item
            Text = '<F7> - Localiza Produto'
            Width = 166
          end
          item
            Text = '<F9> - Encerra'
            Width = 145
          end>
        UseSystemFont = False
      end
      object Grid_Itens: TDBGrid
        Left = 3
        Top = 253
        Width = 826
        Height = 205
        DataSource = DataSub_Detail
        Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
        TabOrder = 20
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnColEnter = Grid_ItensColEnter
        OnColExit = Grid_ItensColExit
        OnEnter = Grid_ItensEnter
        OnExit = Grid_ItensExit
        OnKeyDown = Grid_ItensKeyDown
        OnKeyPress = Grid_ItensKeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'PRODUTO_ID'
            Title.Alignment = taRightJustify
            Title.Caption = 'Prod.'
            Width = 40
            Visible = True
          end
          item
            Color = clSilver
            Expanded = False
            FieldName = 'DESCRICAO'
            ReadOnly = True
            Title.Caption = 'Descri'#231#227'o'
            Width = 138
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CONTA_ID'
            Title.Alignment = taRightJustify
            Title.Caption = 'Cta.'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TRIBUTO_ID'
            Title.Alignment = taRightJustify
            Title.Caption = 'Trib.'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CFOP'
            Width = 32
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CST'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ALIQUOTA_ICMS'
            ReadOnly = True
            Title.Alignment = taRightJustify
            Title.Caption = '% ICMS'
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_ICMS_ST'
            Title.Caption = 'Icms-St'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MVA'
            Title.Alignment = taRightJustify
            Width = 35
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VR_IPI'
            Title.Alignment = taRightJustify
            Title.Caption = 'Vr. IPI'
            Width = 44
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QUANTIDADE'
            Title.Alignment = taRightJustify
            Title.Caption = 'Quant.'
            Width = 39
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
            Width = 54
            Visible = True
          end>
      end
      object SERIE: TEdit
        Left = 647
        Top = 58
        Width = 34
        Height = 21
        Enabled = False
        MaxLength = 3
        TabOrder = 5
        OnKeyDown = DT_TRANSKeyDown
      end
      object ENTRADA_ID: TCurrencyEdit
        Left = 583
        Top = 136
        Width = 47
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0;-0'
        Enabled = False
        TabOrder = 13
        ZeroEmpty = False
        OnExit = ENTRADA_IDExit
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object FLUXO_CAIXA_ID: TCurrencyEdit
        Left = 85
        Top = 188
        Width = 47
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0;-0'
        Enabled = False
        TabOrder = 16
        ZeroEmpty = False
        OnExit = FLUXO_CAIXA_IDExit
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object MODELO: TEdit
        Left = 685
        Top = 58
        Width = 34
        Height = 21
        Enabled = False
        MaxLength = 2
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        OnKeyDown = DT_TRANSKeyDown
      end
      object Destacar_ICMS_ST: TCheckBox
        Left = 728
        Top = 165
        Width = 91
        Height = 17
        Caption = 'Dest. ICMS ST'
        TabOrder = 15
        OnKeyDown = DT_TRANSKeyDown
      end
      object IPI_ICMS: TCheckBox
        Left = 728
        Top = 191
        Width = 107
        Height = 17
        Caption = 'Inc. IPI Base ICMS'
        TabOrder = 18
        OnKeyDown = DT_TRANSKeyDown
      end
      object VR_COFINS: TRxCalcEdit
        Left = 277
        Top = 190
        Width = 92
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DisplayFormat = '0.00;-0.00'
        Enabled = False
        NumGlyphs = 2
        TabOrder = 23
        Visible = False
        ZeroEmpty = False
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object VR_PIS: TRxCalcEdit
        Left = 277
        Top = 161
        Width = 92
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DisplayFormat = '0.00;-0.00'
        Enabled = False
        NumGlyphs = 2
        TabOrder = 24
        Visible = False
        ZeroEmpty = False
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object VR_COFINS_ST: TRxCalcEdit
        Left = 277
        Top = 111
        Width = 92
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DisplayFormat = '0.00;-0.00'
        Enabled = False
        NumGlyphs = 2
        TabOrder = 25
        Visible = False
        ZeroEmpty = False
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object VR_PIS_ST: TRxCalcEdit
        Left = 277
        Top = 82
        Width = 92
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DisplayFormat = '0.00;-0.00'
        Enabled = False
        NumGlyphs = 2
        TabOrder = 26
        Visible = False
        ZeroEmpty = False
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object DT_ENT_SAI: TDateEdit
        Left = 252
        Top = 58
        Width = 90
        Height = 21
        CheckOnExit = True
        DialogTitle = 'Selecione a Data'
        Enabled = False
        NumGlyphs = 2
        TabOrder = 2
        OnEnter = DT_TRANSEnter
        OnExit = DT_ENT_SAIExit
        OnKeyDown = DT_TRANSKeyDown
      end
      object Frete_Icms: TCheckBox
        Left = 615
        Top = 191
        Width = 107
        Height = 17
        Caption = 'Inc. Frete B. ICMS'
        TabOrder = 27
        OnKeyDown = DT_TRANSKeyDown
      end
      object Observacao: TMemo
        Left = 85
        Top = 214
        Width = 412
        Height = 33
        Enabled = False
        Lines.Strings = (
          '')
        ScrollBars = ssVertical
        TabOrder = 17
        WantReturns = False
        OnEnter = ObservacaoEnter
      end
      object Chave_Nfe_Ref: TEdit
        Left = 583
        Top = 224
        Width = 252
        Height = 21
        Enabled = False
        MaxLength = 44
        TabOrder = 19
        OnKeyDown = DT_TRANSKeyDown
      end
      object Hora: TEdit
        Left = 583
        Top = 163
        Width = 61
        Height = 21
        Enabled = False
        MaxLength = 8
        ReadOnly = True
        TabOrder = 28
        OnKeyDown = DT_TRANSKeyDown
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 584
    Width = 853
    Height = 51
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnRetorna: TBitBtn
      Left = 762
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
    object CONDUTA: TEdit
      Left = 346
      Top = 10
      Width = 46
      Height = 21
      Enabled = False
      MaxLength = 2
      TabOrder = 4
      Visible = False
    end
    object DEPTO: TEdit
      Left = 398
      Top = 10
      Width = 46
      Height = 21
      Enabled = False
      MaxLength = 2
      TabOrder = 5
      Visible = False
    end
    object TPCTB: TEdit
      Left = 450
      Top = 10
      Width = 46
      Height = 21
      Enabled = False
      MaxLength = 2
      TabOrder = 6
      Visible = False
    end
    object AUTORIZ_ID: TCurrencyEdit
      Left = 503
      Top = 10
      Width = 47
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = '0;-0'
      Enabled = False
      TabOrder = 7
      Visible = False
      ZeroEmpty = False
      OnExit = FORNECEDOR_IDExit
      OnKeyDown = EMPRESA_IDKeyDown
    end
    object btnPesquisa: TBitBtn
      Left = 522
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
    object btnNotaFiscal: TBitBtn
      Left = 682
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Nota Fiscal'
      TabOrder = 2
      OnClick = btnNotaFiscalClick
    end
    object UNIDADES: TRxCalcEdit
      Left = 110
      Top = 10
      Width = 92
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      DisplayFormat = '0.00;-0.00'
      Enabled = False
      NumGlyphs = 2
      TabOrder = 8
      Visible = False
      ZeroEmpty = False
      OnKeyDown = EMPRESA_IDKeyDown
    end
    object ITENS: TCurrencyEdit
      Left = 212
      Top = 10
      Width = 47
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = '0;-0'
      Enabled = False
      TabOrder = 9
      Visible = False
      ZeroEmpty = False
      OnExit = FORNECEDOR_IDExit
      OnKeyDown = EMPRESA_IDKeyDown
    end
    object btnImpostos: TBitBtn
      Left = 602
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Impostos'
      TabOrder = 1
      OnClick = btnImpostosClick
    end
    object Complemento: TEdit
      Left = 294
      Top = 10
      Width = 46
      Height = 21
      Enabled = False
      MaxLength = 2
      TabOrder = 10
      Visible = False
    end
    object LegendaBox: TGroupBox
      Left = 15
      Top = 6
      Width = 361
      Height = 33
      BiDiMode = bdLeftToRight
      Caption = 'Legenda'
      ParentBiDiMode = False
      TabOrder = 11
      object Label86: TLabel
        Left = 260
        Top = 13
        Width = 86
        Height = 13
        Caption = 'Notas Canceladas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label87: TLabel
        Left = 12
        Top = 13
        Width = 74
        Height = 13
        Caption = 'Notas enviadas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label88: TLabel
        Left = 129
        Top = 13
        Width = 85
        Height = 13
        Caption = 'Notas Denegadas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clPurple
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
    end
  end
  object Cond_Pagto: TEdit
    Left = 398
    Top = 614
    Width = 46
    Height = 21
    Enabled = False
    MaxLength = 2
    TabOrder = 2
    Visible = False
  end
  object DataTabela: TDataSource
    AutoEdit = False
    DataSet = QTabela
    Left = 64
    Top = 336
  end
  object DataEmpresa: TDataSource
    DataSet = QEmpresa
    Left = 160
    Top = 336
  end
  object DataBanco: TDataSource
    DataSet = QBanco
    Left = 224
    Top = 336
  end
  object DataFornecedor: TDataSource
    DataSet = QFornecedor
    Left = 288
    Top = 336
  end
  object DataConta: TDataSource
    DataSet = QConta
    Left = 200
    Top = 304
  end
  object DataCusto: TDataSource
    DataSet = QCusto
    Left = 264
    Top = 304
  end
  object DataSub_Detail: TDataSource
    DataSet = QSub_Detail
    Left = 328
    Top = 304
  end
  object DataFluxo_Caixa: TDataSource
    DataSet = QFluxo_Caixa
    Left = 384
    Top = 336
  end
  object PopupMenu1: TPopupMenu
    Left = 488
    Top = 304
    object RecalcularPISCOFINS1: TMenuItem
      Caption = 'Recalcular PIS/COFINS'
      OnClick = RecalcularPISCOFINS1Click
    end
    object AlterarNFe1: TMenuItem
      Caption = 'Alterar NFe'
      OnClick = AlterarNFe1Click
    end
  end
  object QTabela: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM TRANSACOES')
    Left = 32
    Top = 336
  end
  object IQuery: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 96
    Top = 336
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
    Left = 128
    Top = 336
    ParamData = <
      item
        Name = 'EMPRESA_ID'
        ParamType = ptInput
      end>
  end
  object QBanco: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM BANCOS'
      'WHERE'
      '(BANCO_ID = :BANCO_ID)'
      'AND (EMPRESA_ID = :EMPRESA_ID)'
      'AND (STATUS = '#39'A'#39')')
    Left = 192
    Top = 336
    ParamData = <
      item
        Name = 'BANCO_ID'
        ParamType = ptInput
      end
      item
        Name = 'EMPRESA_ID'
        ParamType = ptInput
      end>
  end
  object QConta: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM TABELAS'
      'WHERE'
      '(TABELA_ID = :TABELA_ID)'
      'AND (TIPO_TABELA = '#39'4'#39')'
      'AND (NIVEL = '#39'ANAL'#205'TICA'#39')'
      'AND (STATUS = '#39'A'#39')')
    Left = 168
    Top = 304
    ParamData = <
      item
        Name = 'TABELA_ID'
        ParamType = ptInput
      end>
  end
  object QCusto: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM TABELAS'
      'WHERE'
      '(TABELA_ID = :TABELA_ID)'
      'AND (TIPO_TABELA = '#39'2'#39')'
      'AND (STATUS = '#39'A'#39')')
    Left = 232
    Top = 304
    ParamData = <
      item
        Name = 'TABELA_ID'
        ParamType = ptInput
      end>
  end
  object QFornecedor: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM FORNECEDORES'
      'WHERE'
      '(FORNECEDOR_ID = :FORNECEDOR_ID)'
      'AND (STATUS = '#39'A'#39')')
    Left = 256
    Top = 336
    ParamData = <
      item
        Name = 'FORNECEDOR_ID'
        ParamType = ptInput
      end>
  end
  object QEntrada: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM TRANSACOES'
      'WHERE'
      '(TRANSACAO_ID = :TRANSACAO_ID)'
      'AND (EMPRESA_ID = :EMPRESA_ID)'
      'AND (CONDUTA = '#39'02'#39')'
      'AND ((DEPTO = '#39'07'#39') OR (DEPTO = '#39'10'#39'))')
    Left = 320
    Top = 336
    ParamData = <
      item
        Name = 'TRANSACAO_ID'
        ParamType = ptInput
      end
      item
        Name = 'EMPRESA_ID'
        ParamType = ptInput
      end>
  end
  object QFluxo_Caixa: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM FLUXO_CAIXA'
      'WHERE'
      '(FLUXO_CAIXA_ID = :FLUXO_CAIXA_ID)')
    Left = 352
    Top = 336
    ParamData = <
      item
        Name = 'FLUXO_CAIXA_ID'
        ParamType = ptInput
      end>
  end
  object QSub_Detail: TFDQuery
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
      'SELECT * FROM TRANSITENS'
      'WHERE'
      '(TRANSACAO_ID = :TRANSACAO_ID)')
    Left = 296
    Top = 304
    ParamData = <
      item
        Name = 'TRANSACAO_ID'
        ParamType = ptInput
      end>
  end
  object USql_Transest: TFDUpdateSQL
    Left = 364
    Top = 304
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
    Left = 392
    Top = 304
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
  object QConta_Estoque: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM TABELAS'
      'WHERE'
      '(TABELA_ID = :TABELA_ID)'
      'AND (TIPO_TABELA = '#39'4'#39')'
      'AND (NIVEL = '#39'ANAL'#205'TICA'#39')'
      'AND (STATUS = '#39'A'#39')')
    Left = 416
    Top = 336
    ParamData = <
      item
        Name = 'TABELA_ID'
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
    Left = 424
    Top = 304
    ParamData = <
      item
        Name = 'TRIBUTO_ID'
        ParamType = ptInput
      end>
  end
  object QUpdate: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 440
    Top = 336
  end
  object QCfop: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM CFOP'
      'WHERE'
      '(COD_CFOP = :COD_CFOP)')
    Left = 456
    Top = 304
    ParamData = <
      item
        Name = 'COD_CFOP'
        ParamType = ptInput
      end>
  end
  object QCfop_Estoque: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      ''
      'SELECT * FROM CFOP'
      'WHERE'
      '(COD_CFOP = :COD_CFOP)')
    Left = 472
    Top = 336
    ParamData = <
      item
        Name = 'COD_CFOP'
        ParamType = ptInput
      end>
  end
  object QEstorno: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 504
    Top = 336
  end
  object QQuitacao: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 544
    Top = 336
  end
  object QRel: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 520
    Top = 304
  end
end
