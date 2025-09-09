object FrmCadastro_Produtos: TFrmCadastro_Produtos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Produtos'
  ClientHeight = 653
  ClientWidth = 1052
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnMouseEnter = FormMouseEnter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 1052
    Height = 586
    ActivePage = Consulta
    Align = alClient
    TabOrder = 0
    object Consulta: TTabSheet
      Caption = '&Consulta'
      OnShow = ConsultaShow
      object Alfabeto: TTabSet
        Left = 0
        Top = 518
        Width = 1044
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
          'A'
          'B'
          'C'
          'D'
          'E'
          'F'
          'G'
          'H'
          'I'
          'J'
          'K'
          'L'
          'M'
          'N'
          'O'
          'P'
          'Q'
          'R'
          'S'
          'T'
          'U'
          'V'
          'W'
          'X'
          'Y'
          'Z'
          'Todos')
        OnClick = AlfabetoClick
      end
      object StatusBar1: TStatusBar
        Left = 0
        Top = 539
        Width = 1044
        Height = 19
        Panels = <
          item
            Text = '<F3> - Desativar'
            Width = 100
          end
          item
            Text = '<F4> - Reativar'
            Width = 100
          end
          item
            Text = '<F5> - Localiz. C'#243'digos de Barras'
            Width = 184
          end
          item
            Text = '<F6> - Ficha Financeira'
            Width = 140
          end
          item
            Text = '<F7> - Localiz. Descri'#231#227'o'
            Width = 140
          end
          item
            Text = '<F8> - Localiz. C'#243'd. Prod.'
            Width = 140
          end
          item
            Text = '<F9> - Localiz. C'#243'd. Barras Principal'
            Width = 50
          end>
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 1044
        Height = 518
        Align = alClient
        Color = clInfoBk
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
        OnCellClick = DBGrid1CellClick
        OnDrawColumnCell = DBGrid1DrawColumnCell
        OnDblClick = DBGrid1DblClick
        OnKeyDown = DBGrid1KeyDown
        OnKeyPress = DBGrid1KeyPress
        OnKeyUp = DBGrid1KeyUp
        OnTitleClick = DBGrid1TitleClick
        Columns = <
          item
            Expanded = False
            FieldName = 'PRODUTO_ID'
            Title.Caption = 'C'#243'digo'
            Width = 59
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COD_BARRA'
            Title.Caption = 'C'#243'd. de Barra'
            Width = 89
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODRED'
            Title.Caption = 'C'#243'd. Pes'#225'vel'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Title.Caption = 'Descri'#231#227'o'
            Width = 260
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NCM'
            Title.Caption = 'C'#243'd. Ncm'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRECO_VAREJO'
            Title.Alignment = taRightJustify
            Title.Caption = 'Pr. Varejo'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRECO_PRAZO'
            Title.Alignment = taRightJustify
            Title.Caption = 'Pr. Prazo'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRECO_PROMOCAO'
            Title.Alignment = taRightJustify
            Title.Caption = 'Quantidade'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UNIDADE_VENDA'
            Title.Caption = 'Unid.'
            Width = 43
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CUSTO_COMPRA'
            Title.Alignment = taRightJustify
            Title.Caption = 'Pr. Custo'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MARGEM_LUCRO'
            Title.Alignment = taRightJustify
            Title.Caption = 'Mgl. Lucro'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QUANT_MINIMA'
            Title.Alignment = taRightJustify
            Title.Caption = 'Qtd. M'#237'n.'
            Width = 60
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'STATUS'
            Title.Alignment = taCenter
            Title.Caption = 'Status'
            Width = 34
            Visible = True
          end>
      end
    end
    object Manutencao: TTabSheet
      Caption = '&Manuten'#231#227'o'
      ImageIndex = 1
      PopupMenu = PopupMenu2
      OnShow = ManutencaoShow
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label9: TLabel
        Left = 6
        Top = 61
        Width = 46
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object Label42: TLabel
        Left = 6
        Top = 87
        Width = 52
        Height = 13
        Caption = 'Desc. Res.'
      end
      object Label30: TLabel
        Left = 6
        Top = 113
        Width = 62
        Height = 13
        Caption = 'C'#243'digo Barra'
      end
      object Label44: TLabel
        Left = 810
        Top = 63
        Width = 51
        Height = 13
        Caption = 'Supervisor'
        Visible = False
      end
      object Label18: TLabel
        Left = 6
        Top = 477
        Width = 48
        Height = 13
        Caption = 'Pr. Varejo'
      end
      object Label22: TLabel
        Left = 6
        Top = 503
        Width = 57
        Height = 13
        Caption = 'Qtd. M'#237'nima'
      end
      object Label43: TLabel
        Left = 300
        Top = 139
        Width = 67
        Height = 13
        Caption = 'C'#243'd. Pes'#225'vel.'
      end
      object Label45: TLabel
        Left = 300
        Top = 191
        Width = 43
        Height = 13
        Caption = 'Multiplica'
      end
      object Label17: TLabel
        Left = 818
        Top = 451
        Width = 57
        Height = 13
        Caption = 'Pr. Atacado'
      end
      object Label1: TLabel
        Left = 292
        Top = 503
        Width = 61
        Height = 13
        Caption = 'Qtd. M'#225'xima'
      end
      object Label29: TLabel
        Left = 289
        Top = 451
        Width = 54
        Height = 13
        Caption = 'Desc. M'#225'x.'
      end
      object Label39: TLabel
        Left = 6
        Top = 451
        Width = 55
        Height = 13
        Caption = '% M. Lucro'
      end
      object Label40: TLabel
        Left = 568
        Top = 504
        Width = 59
        Height = 13
        Caption = '% Comiss'#227'o'
        Visible = False
      end
      object Label27: TLabel
        Left = 525
        Top = 165
        Width = 52
        Height = 13
        Caption = 'C'#243'd. Trib.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 525
        Top = 139
        Width = 41
        Height = 13
        Caption = 'Localiz.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 525
        Top = 113
        Width = 50
        Height = 13
        Caption = 'Sub-Tipo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 525
        Top = 87
        Width = 34
        Height = 13
        Caption = 'Grupo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label19: TLabel
        Left = 565
        Top = 477
        Width = 64
        Height = 13
        Caption = 'Pr. Promo'#231#227'o'
      end
      object Empresa: TLabel
        Left = 525
        Top = 61
        Width = 49
        Height = 13
        Caption = 'Empresa'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText1: TDBText
        Left = 710
        Top = 61
        Width = 272
        Height = 13
        DataField = 'RAZAO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText2: TDBText
        Left = 710
        Top = 87
        Width = 272
        Height = 13
        DataField = 'DESCRICAO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText3: TDBText
        Left = 710
        Top = 113
        Width = 272
        Height = 13
        DataField = 'DESCRICAO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText4: TDBText
        Left = 710
        Top = 139
        Width = 272
        Height = 13
        DataField = 'DESCRICAO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText5: TDBText
        Left = 710
        Top = 165
        Width = 272
        Height = 13
        DataField = 'DESCRICAO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Bevel4: TBevel
        Left = 0
        Top = 45
        Width = 986
        Height = 4
        Shape = bsTopLine
      end
      object Bevel3: TBevel
        Left = 515
        Top = 46
        Width = 4
        Height = 391
        Shape = bsLeftLine
      end
      object Bevel1: TBevel
        Left = 0
        Top = 435
        Width = 516
        Height = 4
        Shape = bsTopLine
      end
      object btnEmpresa: TSpeedButton
        Left = 640
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
      object btnGrupo: TSpeedButton
        Left = 640
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
        OnClick = btnGrupoClick
      end
      object btnSub_Tipo: TSpeedButton
        Left = 640
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
        OnClick = btnSub_TipoClick
      end
      object btnLocalizacao: TSpeedButton
        Left = 640
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
        OnClick = btnLocalizacaoClick
      end
      object btnTributo: TSpeedButton
        Left = 640
        Top = 162
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
        OnClick = btnTributoClick
      end
      object Label4: TLabel
        Left = 525
        Top = 243
        Width = 52
        Height = 13
        Caption = 'Mod. ICMS'
      end
      object Label6: TLabel
        Left = 565
        Top = 451
        Width = 31
        Height = 13
        Caption = 'Vr. IPI'
      end
      object Label8: TLabel
        Left = 525
        Top = 295
        Width = 41
        Height = 13
        Caption = 'Mod. IPI'
      end
      object Label16: TLabel
        Left = 6
        Top = 139
        Width = 48
        Height = 13
        Caption = 'C'#243'd. NCM'
      end
      object Label49: TLabel
        Left = 525
        Top = 217
        Width = 32
        Height = 13
        Caption = 'Fam'#237'lia'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object btnFamilia: TSpeedButton
        Left = 640
        Top = 214
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
        OnClick = btnFamiliaClick
      end
      object DBText6: TDBText
        Left = 710
        Top = 217
        Width = 272
        Height = 13
        DataField = 'DESCRICAO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label59: TLabel
        Left = 525
        Top = 191
        Width = 60
        Height = 13
        Caption = 'C'#243'd. CSOSN'
      end
      object Label56: TLabel
        Left = 300
        Top = 165
        Width = 59
        Height = 13
        Caption = 'IPPT (P/T)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label55: TLabel
        Left = 6
        Top = 165
        Width = 54
        Height = 13
        Caption = 'IAT (A/T)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label60: TLabel
        Left = 6
        Top = 191
        Width = 45
        Height = 13
        Caption = 'Tipo Item'
      end
      object Label61: TLabel
        Left = 6
        Top = 217
        Width = 61
        Height = 13
        Caption = 'C'#243'd. G'#234'nero'
      end
      object btnGenero: TSpeedButton
        Left = 128
        Top = 214
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
        OnClick = btnGeneroClick
      end
      object Label64: TLabel
        Left = 300
        Top = 217
        Width = 63
        Height = 13
        Caption = 'Ctrl. N'#186' S'#233'rie'
      end
      object btnNCM: TSpeedButton
        Left = 153
        Top = 135
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
        OnClick = btnNCMClick
      end
      object Label66: TLabel
        Left = 525
        Top = 269
        Width = 61
        Height = 13
        Caption = 'Mod. ICM ST'
      end
      object Label79: TLabel
        Left = 292
        Top = 477
        Width = 44
        Height = 13
        Caption = 'Pr. Prazo'
      end
      object Label81: TLabel
        Left = 303
        Top = 87
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object Label89: TLabel
        Left = 300
        Top = 113
        Width = 48
        Height = 13
        Caption = 'C'#243'd. Cest'
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 1044
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
          Left = 156
          Top = 6
          Width = 75
          Height = 25
          Caption = 'Pr'#243'ximo'
          TabOrder = 1
          OnClick = btnNextClick
        end
        object btnInsert: TBitBtn
          Left = 309
          Top = 6
          Width = 75
          Height = 25
          Caption = '&Incluir'
          TabOrder = 2
          OnClick = btnInsertClick
        end
        object btnEdit: TBitBtn
          Left = 456
          Top = 6
          Width = 75
          Height = 25
          Caption = 'A&lterar'
          TabOrder = 3
          OnClick = btnEditClick
        end
        object btnDelete: TBitBtn
          Left = 606
          Top = 6
          Width = 75
          Height = 25
          Caption = '&Excluir'
          TabOrder = 4
          OnClick = btnDeleteClick
        end
        object btnSave: TBitBtn
          Left = 756
          Top = 6
          Width = 75
          Height = 25
          Caption = '&Salvar'
          TabOrder = 5
          OnClick = btnSaveClick
        end
        object btnDiscard: TBitBtn
          Left = 907
          Top = 6
          Width = 75
          Height = 25
          Caption = 'C&ancelar'
          TabOrder = 6
          OnClick = btnDiscardClick
        end
      end
      object DESCRICAO: TEdit
        Left = 78
        Top = 58
        Width = 429
        Height = 21
        Enabled = False
        MaxLength = 120
        TabOrder = 1
        OnExit = DESCRICAOExit
        OnKeyDown = DESCRICAOKeyDown
      end
      object FANTASIA: TEdit
        Left = 78
        Top = 84
        Width = 210
        Height = 21
        Enabled = False
        MaxLength = 24
        TabOrder = 4
        OnKeyDown = DESCRICAOKeyDown
      end
      object COD_BARRA: TEdit
        Left = 78
        Top = 110
        Width = 121
        Height = 21
        Enabled = False
        MaxLength = 14
        TabOrder = 7
        OnExit = COD_BARRAExit
        OnKeyDown = DESCRICAOKeyDown
      end
      object CODRED: TEdit
        Left = 368
        Top = 136
        Width = 75
        Height = 21
        Enabled = False
        MaxLength = 7
        TabOrder = 12
        OnKeyDown = DESCRICAOKeyDown
      end
      object SUPERVISOR: TComboBox
        Left = 882
        Top = 60
        Width = 75
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 3
        ParentFont = False
        TabOrder = 3
        Visible = False
        OnKeyDown = EMPRESA_IDKeyDown
        Items.Strings = (
          'SIM'
          'N'#195'O')
      end
      object PROVQT: TComboBox
        Left = 368
        Top = 188
        Width = 75
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 3
        ParentFont = False
        TabOrder = 19
        OnKeyDown = EMPRESA_IDKeyDown
        Items.Strings = (
          'SIM'
          'N'#195'O')
      end
      object GRUPO_ID: TCurrencyEdit
        Left = 590
        Top = 84
        Width = 47
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DecimalPlaces = 0
        DisplayFormat = '0;-0'
        Enabled = False
        TabOrder = 5
        ZeroEmpty = False
        OnExit = GRUPO_IDExit
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object SUBTIPO_ID: TCurrencyEdit
        Left = 590
        Top = 110
        Width = 47
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DecimalPlaces = 0
        DisplayFormat = '0;-0'
        Enabled = False
        TabOrder = 10
        ZeroEmpty = False
        OnExit = SUBTIPO_IDExit
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object LOCALIZACAO_ID: TCurrencyEdit
        Left = 590
        Top = 136
        Width = 47
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DecimalPlaces = 0
        DisplayFormat = '0;-0'
        Enabled = False
        TabOrder = 13
        ZeroEmpty = False
        OnExit = LOCALIZACAO_IDExit
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object TRIBUTO_ID: TCurrencyEdit
        Left = 590
        Top = 162
        Width = 47
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DecimalPlaces = 0
        DisplayFormat = '0;-0'
        Enabled = False
        TabOrder = 17
        ZeroEmpty = False
        OnExit = TRIBUTO_IDExit
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object QUANT_MINIMA: TCurrencyEdit
        Left = 78
        Top = 500
        Width = 92
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DisplayFormat = '0.00;-0.00'
        Enabled = False
        MaxValue = 99999.990000000000000000
        TabOrder = 37
        ZeroEmpty = False
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object QUANT_MAXIMA: TCurrencyEdit
        Left = 360
        Top = 500
        Width = 92
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DisplayFormat = '0.00;-0.00'
        Enabled = False
        MaxValue = 99999.990000000000000000
        TabOrder = 38
        ZeroEmpty = False
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object EMPRESA_ID: TCurrencyEdit
        Left = 590
        Top = 58
        Width = 47
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DecimalPlaces = 0
        DisplayFormat = '0;-0'
        Enabled = False
        TabOrder = 2
        ZeroEmpty = False
        OnExit = EMPRESA_IDExit
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object COMISSAO: TRxCalcEdit
        Left = 636
        Top = 501
        Width = 92
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DisplayFormat = '0.00;-0.00'
        Enabled = False
        MaxValue = 9999.990000000000000000
        NumGlyphs = 2
        TabOrder = 39
        Visible = False
        ZeroEmpty = False
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object MARGEM_LUCRO: TRxCalcEdit
        Left = 78
        Top = 448
        Width = 92
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DisplayFormat = '0.00;-0.00'
        Enabled = False
        MaxValue = 9999.990000000000000000
        NumGlyphs = 2
        TabOrder = 29
        ZeroEmpty = False
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object DESC_MAXIMO: TRxCalcEdit
        Left = 360
        Top = 448
        Width = 92
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
        Enabled = False
        MaxValue = 99999.990000000000000000
        NumGlyphs = 2
        TabOrder = 31
        ZeroEmpty = False
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object PRECO_VAREJO: TRxCalcEdit
        Left = 78
        Top = 474
        Width = 92
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DecimalPlaces = 3
        DisplayFormat = 'R$ ,0.000;-R$ ,0.000'
        Enabled = False
        MaxValue = 999999.999000000000000000
        MinValue = 0.010000000000000000
        NumGlyphs = 2
        TabOrder = 34
        Value = 0.010000000000000000
        ZeroEmpty = False
        OnExit = PRECO_VAREJOExit
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object PRECO_ATACADO: TRxCalcEdit
        Left = 882
        Top = 448
        Width = 92
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DecimalPlaces = 3
        DisplayFormat = 'R$ ,0.000;-R$ ,0.000'
        Enabled = False
        MaxValue = 999999.999000000000000000
        MinValue = 0.010000000000000000
        NumGlyphs = 2
        TabOrder = 33
        Value = 0.010000000000000000
        ZeroEmpty = False
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object PRECO_PROMOCAO: TRxCalcEdit
        Left = 636
        Top = 474
        Width = 92
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DecimalPlaces = 3
        DisplayFormat = 'R$ ,0.000;-R$ ,0.000'
        Enabled = False
        MaxValue = 999999.999000000000000000
        MinValue = 0.010000000000000000
        NumGlyphs = 2
        TabOrder = 36
        Value = 0.010000000000000000
        ZeroEmpty = False
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object Produtos: TQuickRep
        Left = 3
        Top = 700
        Width = 794
        Height = 1123
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
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
        ReportTitle = 'Relat'#243'rio de Produtos'
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
          Height = 75
          AlignToBottom = False
          TransparentBand = False
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            198.437500000000000000
            1846.791666666667000000)
          PreCaluculateBandHeight = False
          KeepOnOnePage = False
          BandType = rbPageHeader
          object QRSysData1: TQRSysData
            Left = 0
            Top = 16
            Width = 162
            Height = 15
            Size.Values = (
              39.687500000000000000
              0.000000000000000000
              42.333333333333330000
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
            Top = 16
            Width = 113
            Height = 15
            Size.Values = (
              39.687500000000000000
              1547.812500000000000000
              42.333333333333330000
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
            Left = 187
            Top = 31
            Width = 323
            Height = 15
            Size.Values = (
              39.687500000000000000
              494.770833333333300000
              82.020833333333330000
              854.604166666666700000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = True
            Caption = '*** RELAT'#211'RIO DE PRODUTOS PARA CONFER'#202'NCIA ***'
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
          object QRShape1: TQRShape
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
          object QRDBText3: TQRDBText
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
          object QRLabel1: TQRLabel
            Left = 0
            Top = 52
            Width = 48
            Height = 15
            Size.Values = (
              39.687500000000000000
              0.000000000000000000
              137.583333333333300000
              127.000000000000000000)
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
          object QRLabel10: TQRLabel
            Left = 60
            Top = 52
            Width = 71
            Height = 15
            Size.Values = (
              39.687500000000000000
              158.750000000000000000
              137.583333333333300000
              187.854166666666700000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Caption = 'C'#243'd. Barra'
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
          object QRLabel2: TQRLabel
            Left = 159
            Top = 52
            Width = 64
            Height = 15
            Size.Values = (
              39.687500000000000000
              420.687500000000000000
              137.583333333333300000
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
          object QRShape3: TQRShape
            Left = 0
            Top = 69
            Width = 698
            Height = 4
            Size.Values = (
              10.583333333333330000
              0.000000000000000000
              182.562500000000000000
              1846.791666666667000000)
            XLColumn = 0
            Shape = qrsHorLine
            VertAdjust = 0
          end
          object QRLabel4: TQRLabel
            Left = 490
            Top = 52
            Width = 56
            Height = 15
            Size.Values = (
              39.687500000000000000
              1296.458333333333000000
              137.583333333333300000
              148.166666666666700000)
            XLColumn = 0
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            Caption = '% ICMS'
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
          object QRLabel5: TQRLabel
            Left = 557
            Top = 52
            Width = 56
            Height = 15
            Size.Values = (
              39.687500000000000000
              1473.729166666667000000
              137.583333333333300000
              148.166666666666700000)
            XLColumn = 0
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            Caption = 'Estoque'
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
          object QRLabel6: TQRLabel
            Left = 620
            Top = 52
            Width = 78
            Height = 15
            Size.Values = (
              39.687500000000000000
              1640.416666666667000000
              137.583333333333300000
              206.375000000000000000)
            XLColumn = 0
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            Caption = 'Pre'#231'o Venda'
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
        object QRBand2: TQRBand
          Left = 48
          Top = 123
          Width = 698
          Height = 17
          AlignToBottom = False
          TransparentBand = False
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            44.979166666666670000
            1846.791666666667000000)
          PreCaluculateBandHeight = False
          KeepOnOnePage = False
          BandType = rbDetail
          object QRDBText2: TQRDBText
            Left = 0
            Top = 1
            Width = 48
            Height = 15
            Size.Values = (
              39.687500000000000000
              0.000000000000000000
              2.645833333333333000
              127.000000000000000000)
            XLColumn = 0
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            Color = clWhite
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
          object QRDBText5: TQRDBText
            Left = 60
            Top = 1
            Width = 64
            Height = 15
            Size.Values = (
              39.687500000000000000
              158.750000000000000000
              2.645833333333333000
              169.333333333333300000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Color = clWhite
            DataField = 'COD_BARRA'
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
          object QRDBText6: TQRDBText
            Left = 159
            Top = 1
            Width = 64
            Height = 15
            Size.Values = (
              39.687500000000000000
              420.687500000000000000
              2.645833333333333000
              169.333333333333300000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            Color = clWhite
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
          object QRDBText1: TQRDBText
            Left = 620
            Top = 1
            Width = 78
            Height = 15
            Size.Values = (
              39.687500000000000000
              1640.416666666667000000
              2.645833333333333000
              206.375000000000000000)
            XLColumn = 0
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            Color = clWhite
            DataField = 'PRECO_VAREJO'
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
          object QRDBText4: TQRDBText
            Left = 557
            Top = 1
            Width = 56
            Height = 15
            Size.Values = (
              39.687500000000000000
              1473.729166666667000000
              2.645833333333333000
              148.166666666666700000)
            XLColumn = 0
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            Color = clWhite
            DataField = 'QUANTIDADE_C'
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
            Left = 490
            Top = 1
            Width = 56
            Height = 15
            Size.Values = (
              39.687500000000000000
              1296.458333333333000000
              2.645833333333333000
              148.166666666666700000)
            XLColumn = 0
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            Color = clWhite
            DataField = 'ALIQUOTA_ICMS'
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
      object MOD_ICMS: TComboBox
        Left = 590
        Top = 240
        Width = 270
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 25
        ParentFont = False
        TabOrder = 24
        OnKeyDown = EMPRESA_IDKeyDown
        Items.Strings = (
          ''
          'MVA'
          'PAUTA'
          'PR. TABELADO'
          'VALOR DA OPERA'#199#195'O')
      end
      object IPI: TRxCalcEdit
        Left = 636
        Top = 448
        Width = 92
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DisplayFormat = '0.00;-0.00'
        Enabled = False
        MaxValue = 99999.990000000000000000
        NumGlyphs = 2
        TabOrder = 32
        ZeroEmpty = False
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object MOD_IPI: TComboBox
        Left = 590
        Top = 292
        Width = 270
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 25
        ParentFont = False
        TabOrder = 27
        OnKeyDown = EMPRESA_IDKeyDown
        Items.Strings = (
          '50-SA'#205'DA TRIBUTADA'
          '51-SA'#205'DA TRIB. C/ AL'#205'Q. 0'
          '52-SA'#205'DA ISENTA'
          '53-SA'#205'DA N/ TRIBUTADA'
          '54-SA'#205'DA IMUNE'
          '55-SA'#205'DA C/ SUSPENS'#195'O'
          '99-OUTRAS SA'#205'DAS')
      end
      object PageControl2: TPageControl
        Left = 6
        Top = 243
        Width = 501
        Height = 174
        ActivePage = TabSheet5
        TabOrder = 25
        OnEnter = PageControl2Enter
        object TabSheet2: TTabSheet
          Caption = 'Embalagem'
          ImageIndex = 1
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object GroupBox1: TGroupBox
            Left = 10
            Top = 10
            Width = 166
            Height = 111
            Caption = 'Compra'
            TabOrder = 1
            object Label10: TLabel
              Left = 6
              Top = 35
              Width = 54
              Height = 13
              Caption = 'Embalagem'
            end
            object Label25: TLabel
              Left = 6
              Top = 61
              Width = 54
              Height = 13
              Caption = 'Fr. Compra'
            end
            object Btn_embcp: TSpeedButton
              Left = 140
              Top = 33
              Width = 21
              Height = 21
              Cursor = crHandPoint
              Caption = 'F7'
              Flat = True
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              NumGlyphs = 2
              ParentFont = False
              OnClick = Btn_embcpClick
            end
            object UNIDADE: TEdit
              Left = 67
              Top = 32
              Width = 67
              Height = 21
              Enabled = False
              MaxLength = 6
              TabOrder = 0
              OnExit = UNIDADEExit
              OnKeyDown = DESCRICAOKeyDown
            end
            object EMBALAGEM: TCurrencyEdit
              Left = 67
              Top = 58
              Width = 67
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              DisplayFormat = '0.00;-0.00'
              Enabled = False
              TabOrder = 1
              ZeroEmpty = False
              OnKeyDown = EMPRESA_IDKeyDown
            end
          end
          object GroupBox2: TGroupBox
            Left = 176
            Top = 9
            Width = 315
            Height = 111
            Caption = 'Venda'
            TabOrder = 0
            object Label13: TLabel
              Left = 6
              Top = 35
              Width = 54
              Height = 13
              Caption = 'Embalagem'
            end
            object Label14: TLabel
              Left = 6
              Top = 61
              Width = 47
              Height = 13
              Caption = 'Fr. Venda'
            end
            object Label24: TLabel
              Left = 172
              Top = 35
              Width = 50
              Height = 13
              Caption = 'Peso Emb.'
            end
            object Label15: TLabel
              Left = 172
              Top = 61
              Width = 49
              Height = 13
              Caption = 'Peso Unit.'
            end
            object Btn_embvd: TSpeedButton
              Left = 136
              Top = 32
              Width = 21
              Height = 21
              Cursor = crHandPoint
              Caption = 'F7'
              Flat = True
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              NumGlyphs = 2
              ParentFont = False
              OnClick = Btn_embvdClick
            end
            object UNIDADE_VENDA: TEdit
              Left = 67
              Top = 32
              Width = 67
              Height = 21
              Enabled = False
              MaxLength = 6
              TabOrder = 0
              OnExit = UNIDADE_VENDAExit
              OnKeyDown = DESCRICAOKeyDown
            end
            object FRACAO_VENDA: TCurrencyEdit
              Left = 67
              Top = 58
              Width = 67
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              DisplayFormat = '0.00;-0.00'
              Enabled = False
              TabOrder = 2
              ZeroEmpty = False
              OnKeyDown = EMPRESA_IDKeyDown
            end
            object PESO: TCurrencyEdit
              Left = 233
              Top = 32
              Width = 67
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              DisplayFormat = '0.00;-0.00'
              Enabled = False
              TabOrder = 1
              ZeroEmpty = False
              OnKeyDown = EMPRESA_IDKeyDown
            end
            object PESO_UNITARIO: TCurrencyEdit
              Left = 233
              Top = 58
              Width = 67
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              DisplayFormat = '0.00;-0.00'
              Enabled = False
              TabOrder = 3
              ZeroEmpty = False
              OnKeyDown = EMPRESA_IDKeyDown
            end
          end
        end
        object TabSheet3: TTabSheet
          Caption = 'Balan'#231'a'
          ImageIndex = 2
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object Label3: TLabel
            Left = 6
            Top = 35
            Width = 37
            Height = 13
            Caption = 'Pes'#225'vel'
          end
          object Label37: TLabel
            Left = 6
            Top = 61
            Width = 67
            Height = 13
            Caption = 'Mod. Etiqueta'
          end
          object Label41: TLabel
            Left = 6
            Top = 87
            Width = 65
            Height = 13
            Caption = 'Tecla Balan'#231'a'
          end
          object Label32: TLabel
            Left = 351
            Top = 35
            Width = 61
            Height = 13
            Caption = 'Dpt. Pes'#225'vel'
          end
          object Label28: TLabel
            Left = 351
            Top = 87
            Width = 64
            Height = 13
            Caption = 'Validade-Dias'
          end
          object Label38: TLabel
            Left = 351
            Top = 61
            Width = 60
            Height = 13
            Caption = 'Tipo Pes'#225'vel'
          end
          object PESAVEL: TComboBox
            Left = 78
            Top = 32
            Width = 75
            Height = 21
            CharCase = ecUpperCase
            Color = clWhite
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 3
            ParentFont = False
            TabOrder = 0
            OnKeyDown = EMPRESA_IDKeyDown
            Items.Strings = (
              'SIM'
              'N'#195'O')
          end
          object ETIQUETA: TCurrencyEdit
            Left = 78
            Top = 58
            Width = 67
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            DecimalPlaces = 0
            DisplayFormat = '0;-0'
            Enabled = False
            TabOrder = 2
            ZeroEmpty = False
            OnKeyDown = EMPRESA_IDKeyDown
          end
          object BALTECLA: TCurrencyEdit
            Left = 78
            Top = 84
            Width = 67
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            DecimalPlaces = 0
            DisplayFormat = '0;-0'
            Enabled = False
            TabOrder = 4
            ZeroEmpty = False
            OnKeyDown = EMPRESA_IDKeyDown
          end
          object BALDPT: TCurrencyEdit
            Left = 420
            Top = 32
            Width = 67
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            DecimalPlaces = 0
            DisplayFormat = '0;-0'
            Enabled = False
            TabOrder = 1
            ZeroEmpty = False
            OnKeyDown = EMPRESA_IDKeyDown
          end
          object BALTIPO: TCurrencyEdit
            Left = 420
            Top = 58
            Width = 67
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            DecimalPlaces = 0
            DisplayFormat = '0;-0'
            Enabled = False
            TabOrder = 3
            ZeroEmpty = False
            OnKeyDown = EMPRESA_IDKeyDown
          end
          object VALIDADE: TCurrencyEdit
            Left = 420
            Top = 84
            Width = 67
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            DecimalPlaces = 0
            DisplayFormat = '0;-0'
            Enabled = False
            TabOrder = 5
            ZeroEmpty = False
            OnKeyDown = EMPRESA_IDKeyDown
          end
        end
        object TabSheet1: TTabSheet
          Caption = 'Complemento'
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object Label33: TLabel
            Left = 6
            Top = 9
            Width = 62
            Height = 13
            Caption = 'C'#243'd. Original'
          end
          object Label34: TLabel
            Left = 294
            Top = 9
            Width = 29
            Height = 13
            Caption = 'Marca'
          end
          object Label26: TLabel
            Left = 294
            Top = 35
            Width = 52
            Height = 13
            Caption = 'Refer'#234'ncia'
          end
          object Label35: TLabel
            Left = 6
            Top = 35
            Width = 49
            Height = 13
            Caption = 'Mod./Pos.'
          end
          object Label51: TLabel
            Left = 6
            Top = 87
            Width = 59
            Height = 13
            Caption = 'C'#243'd. Barra I'
          end
          object Label52: TLabel
            Left = 294
            Top = 87
            Width = 63
            Height = 13
            Caption = 'C'#243'd. Barra II'
          end
          object Label53: TLabel
            Left = 294
            Top = 113
            Width = 65
            Height = 13
            Caption = 'C'#243'd. Barra IV'
          end
          object Label54: TLabel
            Left = 6
            Top = 113
            Width = 67
            Height = 13
            Caption = 'C'#243'd. Barra III'
          end
          object Label65: TLabel
            Left = 6
            Top = 61
            Width = 45
            Height = 13
            Caption = 'Aplica'#231#227'o'
          end
          object COD_ORIGINAL: TEdit
            Left = 78
            Top = 6
            Width = 121
            Height = 21
            Enabled = False
            MaxLength = 20
            TabOrder = 0
            OnExit = COD_ORIGINALExit
            OnKeyDown = DESCRICAOKeyDown
          end
          object MARCA: TEdit
            Left = 366
            Top = 6
            Width = 121
            Height = 21
            Enabled = False
            MaxLength = 30
            TabOrder = 2
            OnKeyDown = DESCRICAOKeyDown
          end
          object REFERENCIA: TEdit
            Left = 366
            Top = 32
            Width = 121
            Height = 21
            Enabled = False
            MaxLength = 13
            TabOrder = 3
            OnExit = REFERENCIAExit
            OnKeyDown = DESCRICAOKeyDown
          end
          object MODELO_POSICAO: TEdit
            Left = 78
            Top = 32
            Width = 121
            Height = 21
            Enabled = False
            MaxLength = 30
            TabOrder = 1
            OnKeyDown = DESCRICAOKeyDown
          end
          object COD_BARRA_AUX1: TEdit
            Left = 78
            Top = 84
            Width = 121
            Height = 21
            Enabled = False
            MaxLength = 14
            TabOrder = 5
            OnKeyDown = DESCRICAOKeyDown
          end
          object COD_BARRA_AUX2: TEdit
            Left = 366
            Top = 84
            Width = 121
            Height = 21
            Enabled = False
            MaxLength = 14
            TabOrder = 6
            OnKeyDown = DESCRICAOKeyDown
          end
          object COD_BARRA_AUX4: TEdit
            Left = 366
            Top = 110
            Width = 121
            Height = 21
            Enabled = False
            MaxLength = 14
            TabOrder = 8
            OnKeyDown = DESCRICAOKeyDown
          end
          object COD_BARRA_AUX3: TEdit
            Left = 78
            Top = 110
            Width = 121
            Height = 21
            Enabled = False
            MaxLength = 14
            TabOrder = 7
            OnKeyDown = DESCRICAOKeyDown
          end
          object APLICACAO: TEdit
            Left = 78
            Top = 58
            Width = 409
            Height = 21
            Enabled = False
            MaxLength = 250
            ParentShowHint = False
            ShowHint = True
            TabOrder = 4
            OnKeyDown = DESCRICAOKeyDown
            OnMouseEnter = APLICACAOMouseEnter
          end
        end
        object TabSheet4: TTabSheet
          Caption = 'Custo/Impostos'
          ImageIndex = 3
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object Label20: TLabel
            Left = 6
            Top = 9
            Width = 68
            Height = 13
            Caption = 'Custo Compra'
          end
          object Label21: TLabel
            Left = 6
            Top = 35
            Width = 64
            Height = 13
            Caption = 'Valor Compra'
          end
          object Label23: TLabel
            Left = 6
            Top = 61
            Width = 59
            Height = 13
            Caption = 'Custo M'#233'dio'
          end
          object Label31: TLabel
            Left = 350
            Top = 9
            Width = 55
            Height = 13
            Caption = 'Dt. Compra'
          end
          object Label46: TLabel
            Left = 350
            Top = 35
            Width = 56
            Height = 13
            Caption = 'Dt. Entrada'
          end
          object Label47: TLabel
            Left = 350
            Top = 61
            Width = 45
            Height = 13
            Caption = 'Dt. Pre'#231'o'
          end
          object Label48: TLabel
            Left = 350
            Top = 87
            Width = 48
            Height = 13
            Caption = 'Dt. Venda'
          end
          object Label50: TLabel
            Left = 6
            Top = 113
            Width = 55
            Height = 13
            Caption = 'Fornecedor'
          end
          object DBText7: TDBText
            Left = 173
            Top = 113
            Width = 198
            Height = 13
            DataField = 'NOME'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label82: TLabel
            Left = 177
            Top = 9
            Width = 52
            Height = 13
            Caption = 'Vr. Icms St'
          end
          object Label83: TLabel
            Left = 177
            Top = 35
            Width = 53
            Height = 13
            Caption = 'Valor Frete'
          end
          object Label84: TLabel
            Left = 177
            Top = 61
            Width = 39
            Height = 13
            Caption = 'Valor Ipi'
          end
          object Label85: TLabel
            Left = 177
            Top = 87
            Width = 63
            Height = 13
            Caption = 'Vr. Despesas'
          end
          object DBEdit1: TDBEdit
            Left = 80
            Top = 6
            Width = 85
            Height = 21
            DataField = 'CUSTO_COMPRA'
            ReadOnly = True
            TabOrder = 2
            Visible = False
          end
          object DBEdit2: TDBEdit
            Left = 80
            Top = 32
            Width = 85
            Height = 21
            DataField = 'VALOR_COMPRA'
            ReadOnly = True
            TabOrder = 4
            Visible = False
          end
          object DBEdit3: TDBEdit
            Left = 80
            Top = 58
            Width = 85
            Height = 21
            DataField = 'CUSTOMEDIO'
            ReadOnly = True
            TabOrder = 9
            Visible = False
          end
          object DBEdit4: TDBEdit
            Left = 420
            Top = 5
            Width = 67
            Height = 21
            DataField = 'DT_COMPRA'
            Enabled = False
            ReadOnly = True
            TabOrder = 0
          end
          object DBEdit5: TDBEdit
            Left = 420
            Top = 32
            Width = 67
            Height = 21
            DataField = 'DT_ENTRADA'
            Enabled = False
            ReadOnly = True
            TabOrder = 7
          end
          object DBEdit6: TDBEdit
            Left = 420
            Top = 58
            Width = 67
            Height = 21
            DataField = 'DT_PRECO'
            Enabled = False
            ReadOnly = True
            TabOrder = 11
          end
          object DBEdit7: TDBEdit
            Left = 420
            Top = 84
            Width = 67
            Height = 21
            DataField = 'DT_MOVIMENTO'
            Enabled = False
            ReadOnly = True
            TabOrder = 13
          end
          object DBEdit8: TDBEdit
            Left = 80
            Top = 110
            Width = 85
            Height = 21
            DataField = 'FORNECEDOR_ID'
            ReadOnly = True
            TabOrder = 14
          end
          object CUSTO_COMPRA: TRxCalcEdit
            Left = 80
            Top = 6
            Width = 92
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
          object VALOR_COMPRA: TRxCalcEdit
            Left = 80
            Top = 32
            Width = 92
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
          object CUSTOMEDIO: TRxCalcEdit
            Left = 80
            Top = 58
            Width = 92
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
          object VR_IPI: TRxCalcEdit
            Left = 248
            Top = 58
            Width = 92
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
            Enabled = False
            NumGlyphs = 2
            TabOrder = 10
            ZeroEmpty = False
            OnKeyDown = EMPRESA_IDKeyDown
          end
          object VR_FRETE: TRxCalcEdit
            Left = 248
            Top = 32
            Width = 92
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
          object VR_ICMSST: TRxCalcEdit
            Left = 248
            Top = 6
            Width = 92
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
            Enabled = False
            NumGlyphs = 2
            TabOrder = 3
            ZeroEmpty = False
            OnKeyDown = EMPRESA_IDKeyDown
          end
          object VR_DESPESAS: TRxCalcEdit
            Left = 248
            Top = 84
            Width = 92
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
            Enabled = False
            NumGlyphs = 2
            TabOrder = 12
            ZeroEmpty = False
            OnKeyDown = EMPRESA_IDKeyDown
          end
        end
        object TabSheet6: TTabSheet
          Caption = 'Produ'#231#227'o'
          ImageIndex = 5
          OnShow = TabSheet6Show
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object Label73: TLabel
            Left = 6
            Top = 9
            Width = 57
            Height = 13
            Caption = 'Composi'#231#227'o'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object btnComp: TSpeedButton
            Left = 118
            Top = 6
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
            OnClick = btnCompClick
          end
          object Grid_Producao: TDBGrid
            Left = 0
            Top = 28
            Width = 493
            Height = 99
            Align = alBottom
            Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnColExit = Grid_ProducaoColExit
            OnKeyDown = Grid_ProducaoKeyDown
            OnKeyPress = Grid_ProducaoKeyPress
            Columns = <
              item
                Expanded = False
                FieldName = 'INSUMO_ID'
                Title.Caption = 'C'#243'd. Insumo'
                Width = 75
                Visible = True
              end
              item
                Color = clSilver
                Expanded = False
                FieldName = 'DESCRICAO'
                ReadOnly = True
                Title.Caption = 'Descri'#231#227'o'
                Width = 299
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'QUANTIDADE'
                Title.Alignment = taRightJustify
                Title.Caption = 'Quant.'
                Width = 85
                Visible = True
              end>
          end
          object COMPOSICAO_ID: TCurrencyEdit
            Left = 68
            Top = 6
            Width = 47
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            DecimalPlaces = 0
            DisplayFormat = '0;-0'
            Enabled = False
            TabOrder = 0
            ZeroEmpty = False
            OnExit = FAMILIA_IDExit
            OnKeyDown = EMPRESA_IDKeyDown
          end
          object StatusBar3: TStatusBar
            Left = 0
            Top = 127
            Width = 493
            Height = 19
            Panels = <
              item
                Text = '<F7> - Loc. Produto'
                Width = 164
              end
              item
                Text = '<F4> - Deletar'
                Width = 164
              end
              item
                Text = '<F9> - Gravar'
                Width = 164
              end>
          end
        end
        object TabSheet7: TTabSheet
          Caption = 'Num. S'#233'rie'
          ImageIndex = 6
          OnShow = TabSheet7Show
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object Grid_Serie: TDBGrid
            Left = 0
            Top = 0
            Width = 493
            Height = 127
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnKeyDown = Grid_SerieKeyDown
            OnKeyPress = Grid_SerieKeyPress
            Columns = <
              item
                Expanded = False
                FieldName = 'NUM_SERIE'
                Title.Caption = 'N'#186' S'#233'rie'
                Width = 223
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DT_COMPRA'
                Title.Caption = 'Dt. Cpr.'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NUM_DOC'
                Title.Caption = 'N'#186' Doc.'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'QUANTIDADE'
                Title.Alignment = taRightJustify
                Title.Caption = 'Quant.'
                Width = 85
                Visible = True
              end>
          end
          object StatusBar2: TStatusBar
            Left = 0
            Top = 127
            Width = 493
            Height = 19
            Panels = <
              item
                Text = '<F7> - Loc. Num. S'#233'rie'
                Width = 164
              end
              item
                Text = '<F10> - Hist'#243'rico'
                Width = 164
              end
              item
                Text = '<Ctrl + Del> - Apagar'
                Width = 164
              end>
          end
        end
        object TabSheet11: TTabSheet
          Caption = 'Combust'#237'vel'
          ImageIndex = 7
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object Label74: TLabel
            Left = 6
            Top = 9
            Width = 46
            Height = 13
            Caption = 'C'#243'd. ANP'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label75: TLabel
            Left = 6
            Top = 35
            Width = 32
            Height = 13
            Caption = 'CODIF'
          end
          object Label76: TLabel
            Left = 6
            Top = 61
            Width = 42
            Height = 13
            Caption = 'Bc. CIDE'
          end
          object Label77: TLabel
            Left = 3
            Top = 87
            Width = 44
            Height = 13
            Caption = 'Alic. Cide'
          end
          object Label78: TLabel
            Left = 6
            Top = 113
            Width = 21
            Height = 13
            Caption = 'Cide'
          end
          object COD_ANP: TCurrencyEdit
            Left = 62
            Top = 6
            Width = 91
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            DecimalPlaces = 0
            DisplayFormat = '0;-0'
            Enabled = False
            TabOrder = 0
            ZeroEmpty = False
            OnExit = FAMILIA_IDExit
            OnKeyDown = EMPRESA_IDKeyDown
          end
          object CODIF: TEdit
            Left = 62
            Top = 32
            Width = 210
            Height = 21
            Enabled = False
            MaxLength = 21
            TabOrder = 1
            OnKeyDown = DESCRICAOKeyDown
          end
          object BC_CIDE: TRxCalcEdit
            Left = 62
            Top = 58
            Width = 92
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            DisplayFormat = '0.0000;-0.0000'
            Enabled = False
            MaxValue = 9999.990000000000000000
            NumGlyphs = 2
            TabOrder = 2
            ZeroEmpty = False
            OnKeyDown = EMPRESA_IDKeyDown
          end
          object ALIQ_CIDE: TRxCalcEdit
            Left = 62
            Top = 84
            Width = 92
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            DisplayFormat = '0.0000;-0.0000'
            Enabled = False
            MaxValue = 9999.990000000000000000
            NumGlyphs = 2
            TabOrder = 3
            ZeroEmpty = False
            OnKeyDown = EMPRESA_IDKeyDown
          end
          object CIDE: TRxCalcEdit
            Left = 62
            Top = 110
            Width = 92
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            DisplayFormat = '0.0000;-0.0000'
            Enabled = False
            MaxValue = 9999.990000000000000000
            NumGlyphs = 2
            TabOrder = 4
            ZeroEmpty = False
            OnKeyDown = EMPRESA_IDKeyDown
          end
        end
        object Inventario: TTabSheet
          Caption = 'Corre'#231#227'o do Estoque'
          ImageIndex = 8
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object DBGrid2: TDBGrid
            Left = 191
            Top = 4
            Width = 132
            Height = 37
            TabStop = False
            Enabled = False
            Options = [dgTitles, dgIndicator, dgRowLines, dgTabs]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnKeyDown = Grid_SerieKeyDown
            OnKeyPress = Grid_SerieKeyPress
            Columns = <
              item
                Expanded = False
                FieldName = 'QUANTIDADE_C'
                ReadOnly = True
                Title.Caption = 'Estoque Atual'
                Width = 100
                Visible = True
              end>
          end
          object BtnInventario: TBitBtn
            Left = 31
            Top = 60
            Width = 428
            Height = 38
            Caption = 'Realizar Corre'#231#227'o do Estoque'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            OnClick = BtnInventarioClick
          end
        end
        object TabSheet5: TTabSheet
          Caption = 'Fabricante'
          ImageIndex = 8
          OnShow = TabSheet5Show
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object Grid_Fabricante: TDBGrid
            Left = 0
            Top = 0
            Width = 493
            Height = 127
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnColExit = Grid_FabricanteColExit
            OnKeyDown = Grid_FabricanteKeyDown
            OnKeyPress = Grid_FabricanteKeyPress
            Columns = <
              item
                Expanded = False
                FieldName = 'FORNECEDOR_ID'
                Title.Caption = 'C'#243'd. Fabricante'
                Width = 84
                Visible = True
              end
              item
                Color = clSilver
                Expanded = False
                FieldName = 'NOME'
                ReadOnly = True
                Title.Caption = 'Fornecedor/Fabricante'
                Width = 288
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'COD_FABRICANTE'
                Title.Alignment = taRightJustify
                Title.Caption = 'C'#243'd. Fabricante'
                Width = 85
                Visible = True
              end>
          end
          object StatusBar4: TStatusBar
            Left = 0
            Top = 127
            Width = 493
            Height = 19
            Panels = <
              item
                Text = '<F7> - Loc. Fornec/Fab.'
                Width = 164
              end
              item
                Text = '<F4> - Deletar'
                Width = 164
              end
              item
                Text = '<F9> - Gravar'
                Width = 164
              end>
          end
        end
      end
      object NCM: TEdit
        Left = 78
        Top = 136
        Width = 73
        Height = 21
        Enabled = False
        MaxLength = 8
        TabOrder = 11
        OnKeyDown = DESCRICAOKeyDown
      end
      object FAMILIA_ID: TCurrencyEdit
        Left = 590
        Top = 214
        Width = 47
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DecimalPlaces = 0
        DisplayFormat = '0;-0'
        Enabled = False
        TabOrder = 23
        ZeroEmpty = False
        OnExit = FAMILIA_IDExit
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object DT_ATUALIZACAO: TDateEdit
        Left = 111
        Top = 162
        Width = 90
        Height = 21
        CheckOnExit = True
        DialogTitle = 'Selecione a Data'
        Enabled = False
        NumGlyphs = 2
        TabOrder = 15
        Visible = False
      end
      object CSOSN: TEdit
        Left = 590
        Top = 188
        Width = 47
        Height = 21
        Enabled = False
        MaxLength = 3
        TabOrder = 20
        OnKeyDown = DESCRICAOKeyDown
      end
      object IAT: TEdit
        Left = 78
        Top = 162
        Width = 27
        Height = 21
        Enabled = False
        MaxLength = 1
        TabOrder = 14
        OnKeyDown = DESCRICAOKeyDown
      end
      object IPPT: TEdit
        Left = 368
        Top = 162
        Width = 27
        Height = 21
        Enabled = False
        MaxLength = 1
        TabOrder = 16
        OnKeyDown = DESCRICAOKeyDown
      end
      object TIPO_ITEM: TComboBox
        Left = 78
        Top = 188
        Width = 210
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 30
        ParentFont = False
        TabOrder = 18
        OnKeyDown = EMPRESA_IDKeyDown
        Items.Strings = (
          '00 - MERCADORIA PARA REVENDA'
          '01 - MATERIA PRIMA'
          '02 - EMBALAGEM'
          '03 - PRODUTO EM PROCESSO'
          '04 - PRODUTO ACABADO'
          '05 - SUBPRODUTO'
          '06 - PRODUTO INTERMEDIARIO'
          '07 - MATERIAL DE USO E CONSUMO'
          '08 - ATIVO IMOBILIZADO'
          '09 - SERVICOS'
          '10 - OUTROS INSUMOS'
          '99 - OUTRAS')
      end
      object COD_GEN: TEdit
        Left = 78
        Top = 214
        Width = 47
        Height = 21
        Enabled = False
        MaxLength = 2
        TabOrder = 21
        OnKeyDown = DESCRICAOKeyDown
      end
      object CTRL_SERIE: TComboBox
        Left = 368
        Top = 214
        Width = 75
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 3
        ParentFont = False
        TabOrder = 22
        OnChange = CTRL_SERIEChange
        OnKeyDown = EMPRESA_IDKeyDown
        Items.Strings = (
          'SIM'
          'N'#195'O')
      end
      object MOD_ICMS_ST: TComboBox
        Left = 590
        Top = 266
        Width = 270
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 25
        ParentFont = False
        TabOrder = 26
        OnKeyDown = EMPRESA_IDKeyDown
        Items.Strings = (
          ''
          'MVA'
          'PAUTA'
          'PR. TABELADO'
          'LISTA NEGATIVA'
          'LISTA POSITIVA'
          'LISTA NEUTRA')
      end
      object PageControl3: TPageControl
        Left = 525
        Top = 321
        Width = 457
        Height = 116
        ActivePage = TabSheet10
        TabOrder = 28
        object TabSheet8: TTabSheet
          Caption = 'Al'#237'quotas'
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object Label2: TLabel
            Left = 6
            Top = 9
            Width = 49
            Height = 13
            Caption = 'Al'#237'q. ICMS'
          end
          object Label36: TLabel
            Left = 10
            Top = 33
            Width = 56
            Height = 13
            Caption = '% Redu'#231#227'o'
          end
          object Label12: TLabel
            Left = 318
            Top = 9
            Width = 35
            Height = 13
            Caption = '% MVA'
          end
          object Label72: TLabel
            Left = 6
            Top = 61
            Width = 57
            Height = 13
            Caption = 'C'#243'd. Contr.'
          end
          object REDUCAO_ICMS: TRxCalcEdit
            Left = 67
            Top = 32
            Width = 82
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            DisplayFormat = '0.00;-0.00'
            Enabled = False
            MaxValue = 100.000000000000000000
            NumGlyphs = 2
            TabOrder = 2
            ZeroEmpty = False
            OnKeyDown = EMPRESA_IDKeyDown
          end
          object ALIQUOTA_ICMS: TRxCalcEdit
            Left = 67
            Top = 6
            Width = 82
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            DisplayFormat = '0.00;-0.00'
            Enabled = False
            MaxValue = 100.000000000000000000
            NumGlyphs = 2
            TabOrder = 0
            ZeroEmpty = False
            OnKeyDown = EMPRESA_IDKeyDown
          end
          object MVA: TRxCalcEdit
            Left = 361
            Top = 6
            Width = 82
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            DisplayFormat = '0.00;-0.00'
            Enabled = False
            MaxValue = 100.000000000000000000
            NumGlyphs = 2
            TabOrder = 1
            ZeroEmpty = False
            OnKeyDown = EMPRESA_IDKeyDown
          end
          object COD_CONT: TEdit
            Left = 67
            Top = 58
            Width = 42
            Height = 21
            Enabled = False
            MaxLength = 2
            TabOrder = 3
            OnChange = CST_COFINSChange
            OnKeyDown = DESCRICAOKeyDown
          end
        end
        object TabSheet9: TTabSheet
          Caption = 'Pis/Cofins (Entrada)'
          ImageIndex = 1
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object Label68: TLabel
            Left = 6
            Top = 9
            Width = 38
            Height = 13
            Caption = 'CST PIS'
          end
          object btnCst_Pis_Entr: TSpeedButton
            Left = 111
            Top = 6
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
            OnClick = btnCst_Pis_EntrClick
          end
          object Label70: TLabel
            Left = 6
            Top = 35
            Width = 60
            Height = 13
            Caption = 'CST COFINS'
          end
          object btnCst_Cofins_Entr: TSpeedButton
            Left = 111
            Top = 32
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
            OnClick = btnCst_Cofins_EntrClick
          end
          object Label67: TLabel
            Left = 6
            Top = 61
            Width = 40
            Height = 13
            Caption = 'Al'#237'q. PIS'
          end
          object Label69: TLabel
            Left = 294
            Top = 61
            Width = 62
            Height = 13
            Caption = 'Al'#237'q. COFINS'
          end
          object CST_PIS_ENTR: TEdit
            Left = 72
            Top = 6
            Width = 35
            Height = 21
            Enabled = False
            MaxLength = 2
            TabOrder = 0
            OnChange = CST_PIS_ENTRChange
            OnKeyDown = DESCRICAOKeyDown
          end
          object CST_COFINS_ENTR: TEdit
            Left = 72
            Top = 32
            Width = 35
            Height = 21
            Enabled = False
            MaxLength = 2
            TabOrder = 1
            OnChange = CST_COFINS_ENTRChange
            OnKeyDown = DESCRICAOKeyDown
          end
          object PIS_ENTR: TRxCalcEdit
            Left = 72
            Top = 58
            Width = 82
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            DecimalPlaces = 4
            DisplayFormat = '0.0000;-0.0000'
            Enabled = False
            MaxValue = 100.000000000000000000
            NumGlyphs = 2
            TabOrder = 2
            ZeroEmpty = False
            OnKeyDown = EMPRESA_IDKeyDown
          end
          object COFINS_ENTR: TRxCalcEdit
            Left = 361
            Top = 58
            Width = 82
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            DecimalPlaces = 4
            DisplayFormat = '0.0000;-0.0000'
            Enabled = False
            MaxValue = 100.000000000000000000
            NumGlyphs = 2
            TabOrder = 3
            ZeroEmpty = False
            OnKeyDown = EMPRESA_IDKeyDown
          end
        end
        object TabSheet10: TTabSheet
          Caption = 'Pis/Cofins (Sa'#237'da)'
          ImageIndex = 2
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object btnCst_Pis: TSpeedButton
            Left = 111
            Top = 6
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
            OnClick = btnCst_PisClick
          end
          object Label62: TLabel
            Left = 6
            Top = 9
            Width = 38
            Height = 13
            Caption = 'CST PIS'
          end
          object Label63: TLabel
            Left = 6
            Top = 35
            Width = 60
            Height = 13
            Caption = 'CST COFINS'
          end
          object btnCst_Cofins: TSpeedButton
            Left = 111
            Top = 32
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
            OnClick = btnCst_CofinsClick
          end
          object Label58: TLabel
            Left = 6
            Top = 61
            Width = 40
            Height = 13
            Caption = 'Al'#237'q. PIS'
          end
          object Label57: TLabel
            Left = 270
            Top = 61
            Width = 62
            Height = 13
            Caption = 'Al'#237'q. COFINS'
          end
          object Label71: TLabel
            Left = 270
            Top = 35
            Width = 60
            Height = 13
            Caption = 'Nat. Receita'
          end
          object btnNat_Rec: TSpeedButton
            Left = 379
            Top = 32
            Width = 64
            Height = 21
            Cursor = crHandPoint
            Caption = 'F7'
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
          object CST_PIS: TEdit
            Left = 72
            Top = 6
            Width = 35
            Height = 21
            Enabled = False
            MaxLength = 2
            TabOrder = 0
            OnChange = CST_PISChange
            OnKeyDown = DESCRICAOKeyDown
          end
          object CST_COFINS: TEdit
            Left = 72
            Top = 32
            Width = 35
            Height = 21
            Enabled = False
            MaxLength = 2
            TabOrder = 1
            OnChange = CST_COFINSChange
            OnKeyDown = DESCRICAOKeyDown
          end
          object PIS: TRxCalcEdit
            Left = 72
            Top = 58
            Width = 82
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            DecimalPlaces = 4
            DisplayFormat = '0.0000;-0.0000'
            Enabled = False
            MaxValue = 100.000000000000000000
            NumGlyphs = 2
            TabOrder = 3
            ZeroEmpty = False
            OnKeyDown = EMPRESA_IDKeyDown
          end
          object COFINS: TRxCalcEdit
            Left = 337
            Top = 58
            Width = 82
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            DecimalPlaces = 4
            DisplayFormat = '0.0000;-0.0000'
            Enabled = False
            MaxValue = 100.000000000000000000
            NumGlyphs = 2
            TabOrder = 4
            ZeroEmpty = False
            OnKeyDown = EMPRESA_IDKeyDown
          end
          object NAT_REC: TEdit
            Left = 337
            Top = 32
            Width = 37
            Height = 21
            Enabled = False
            MaxLength = 3
            TabOrder = 2
            OnChange = CST_COFINSChange
            OnKeyDown = DESCRICAOKeyDown
          end
        end
      end
      object VINCULO: TCurrencyEdit
        Left = 203
        Top = 448
        Width = 47
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DecimalPlaces = 0
        DisplayFormat = '0;-0'
        Enabled = False
        TabOrder = 30
        Visible = False
        ZeroEmpty = False
        OnExit = FAMILIA_IDExit
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object Preco_Prazo: TRxCalcEdit
        Left = 360
        Top = 474
        Width = 92
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DecimalPlaces = 3
        DisplayFormat = 'R$ ,0.000;-R$ ,0.000'
        Enabled = False
        MaxValue = 999999.999000000000000000
        MinValue = 0.010000000000000000
        NumGlyphs = 2
        TabOrder = 35
        Value = 0.010000000000000000
        ZeroEmpty = False
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object cad_simples: TCheckBox
        Left = 10
        Top = 538
        Width = 122
        Height = 17
        Caption = 'Cadastro Simplificado'
        Enabled = False
        TabOrder = 6
        OnClick = cad_simplesClick
      end
      object Produto_id: TCurrencyEdit
        Left = 368
        Top = 84
        Width = 75
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        Color = cl3DLight
        DecimalPlaces = 0
        DisplayFormat = '0;-0'
        Enabled = False
        ReadOnly = True
        TabOrder = 9
        ZeroEmpty = False
        OnExit = FAMILIA_IDExit
        OnKeyDown = EMPRESA_IDKeyDown
      end
      object Cest: TEdit
        Left = 368
        Top = 110
        Width = 73
        Height = 21
        Enabled = False
        MaxLength = 7
        TabOrder = 8
        OnKeyDown = DESCRICAOKeyDown
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 586
    Width = 1052
    Height = 67
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnComeca_Com: TSpeedButton
      Left = 359
      Top = 37
      Width = 64
      Height = 21
      Cursor = crHandPoint
      Caption = 'F7'
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
    object Label80: TLabel
      Left = 7
      Top = 6
      Width = 89
      Height = 13
      Caption = 'Estoque Parcial:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object btnRetorna: TBitBtn
      Left = 968
      Top = 37
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
      TabOrder = 5
      OnClick = btnRetornaClick
    end
    object btnPesquisa: TBitBtn
      Left = 888
      Top = 37
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
      TabOrder = 4
      OnClick = btnPesquisaClick
    end
    object btnImprime: TBitBtn
      Left = 809
      Top = 37
      Width = 75
      Height = 25
      Caption = 'Rel. Conf.'
      TabOrder = 3
      OnClick = btnImprimeClick
    end
    object btnComposicao: TBitBtn
      Left = 728
      Top = 37
      Width = 75
      Height = 25
      Caption = 'Comp. Prod.'
      TabOrder = 2
      OnClick = btnComposicaoClick
    end
    object Comeca_Com: TLabeledEdit
      Left = 47
      Top = 37
      Width = 306
      Height = 21
      EditLabel.Width = 41
      EditLabel.Height = 13
      EditLabel.Caption = 'Localizar'
      LabelPosition = lpLeft
      TabOrder = 0
      OnEnter = Comeca_ComEnter
      OnKeyPress = Comeca_ComKeyPress
    end
    object btnParcial: TButton
      Left = 648
      Top = 37
      Width = 75
      Height = 25
      Caption = 'Est. Parcial'
      TabOrder = 1
      OnClick = btnParcialClick
    end
    object LegendaBox: TGroupBox
      Left = 690
      Top = 2
      Width = 353
      Height = 33
      BiDiMode = bdLeftToRight
      Caption = 'Legenda'
      ParentBiDiMode = False
      TabOrder = 6
      Visible = False
      object Label86: TLabel
        Left = 260
        Top = 13
        Width = 83
        Height = 13
        Caption = 'Abaixo do M'#237'nimo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label87: TLabel
        Left = 140
        Top = 13
        Width = 74
        Height = 13
        Caption = 'Igual ao M'#237'nimo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label88: TLabel
        Left = 3
        Top = 13
        Width = 78
        Height = 13
        Caption = 'Acima do M'#237'nimo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
    end
  end
  object Rel_Composicao: TQuickRep
    Left = 8
    Top = 700
    Width = 794
    Height = 1123
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
    ReportTitle = 'Produ'#231#227'o'
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
    object PageHeaderBand1: TQRBand
      Left = 48
      Top = 48
      Width = 698
      Height = 102
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        269.875000000000000000
        1846.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object QRShape2: TQRShape
        Left = 0
        Top = 33
        Width = 698
        Height = 4
        Size.Values = (
          10.583333333333330000
          0.000000000000000000
          87.312500000000000000
          1846.791666666667000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape4: TQRShape
        Left = 0
        Top = 96
        Width = 698
        Height = 4
        Size.Values = (
          10.583333333333330000
          0.000000000000000000
          254.000000000000000000
          1846.791666666667000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel7: TQRLabel
        Left = 0
        Top = 80
        Width = 64
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          211.666666666666700000
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
      object QRLabel8: TQRLabel
        Left = 350
        Top = 80
        Width = 73
        Height = 15
        Size.Values = (
          39.687500000000000000
          926.041666666666700000
          211.666666666666700000
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
      object QRLabel9: TQRLabel
        Left = 0
        Top = 39
        Width = 177
        Height = 17
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          103.187500000000000000
          468.312500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Descri'#231#227'o do Produto: '
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRDBText8: TQRDBText
        Left = 176
        Top = 39
        Width = 73
        Height = 17
        Size.Values = (
          44.979166666666670000
          465.666666666666700000
          103.187500000000000000
          193.145833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataField = 'DESCRICAO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel12: TQRLabel
        Left = 0
        Top = 57
        Width = 145
        Height = 17
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          150.812500000000000000
          383.645833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Pre'#231'o do Produto: '
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRDBText9: TQRDBText
        Left = 176
        Top = 57
        Width = 97
        Height = 17
        Size.Values = (
          44.979166666666670000
          465.666666666666700000
          150.812500000000000000
          256.645833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataField = 'PRECO_VAREJO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Mask = '#,##0.00'
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel11: TQRLabel
        Left = 494
        Top = 80
        Width = 73
        Height = 15
        Size.Values = (
          39.687500000000000000
          1307.041666666667000000
          211.666666666666700000
          193.145833333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Pre'#231'o Unit'#225'rio'
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
      object QRLabel13: TQRLabel
        Left = 625
        Top = 81
        Width = 73
        Height = 15
        Size.Values = (
          39.687500000000000000
          1653.645833333333000000
          214.312500000000000000
          193.145833333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = True
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
      object QRDBText10: TQRDBText
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
      object QRSysData3: TQRSysData
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
      object QRLabel14: TQRLabel
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
      object QRSysData4: TQRSysData
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
      object QRShape5: TQRShape
        Left = 0
        Top = 75
        Width = 698
        Height = 4
        Size.Values = (
          10.583333333333330000
          0.000000000000000000
          198.437500000000000000
          1846.791666666667000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
    object DetailBand1: TQRBand
      Left = 48
      Top = 150
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
      object QRDBText11: TQRDBText
        Left = 0
        Top = 0
        Width = 64
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          0.000000000000000000
          169.333333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
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
      object QRDBText12: TQRDBText
        Left = 350
        Top = 0
        Width = 73
        Height = 15
        Size.Values = (
          39.687500000000000000
          926.041666666666700000
          0.000000000000000000
          193.145833333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
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
      object QRDBText13: TQRDBText
        Left = 494
        Top = 0
        Width = 73
        Height = 15
        Size.Values = (
          39.687500000000000000
          1307.041666666667000000
          0.000000000000000000
          193.145833333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = 'PRECO_VAREJO'
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
      object QRDBText14: TQRDBText
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
        DataField = 'VR_SOMA_TOT'
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
    object QRBand3: TQRBand
      Left = 48
      Top = 166
      Width = 698
      Height = 18
      Frame.DrawTop = True
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        47.625000000000000000
        1846.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRExpr2: TQRExpr
        Left = 625
        Top = 1
        Width = 73
        Height = 15
        Size.Values = (
          39.687500000000000000
          1653.645833333333000000
          2.645833333333333000
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
        Master = Rel_Composicao
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'Sum(VR_SOMA_TOT)'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
    end
  end
  object Rel_Series: TQuickRep
    Left = 67
    Top = 700
    Width = 794
    Height = 1123
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
    ReportTitle = 'Produ'#231#227'o'
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
    object QRBand4: TQRBand
      Left = 48
      Top = 48
      Width = 698
      Height = 102
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        269.875000000000000000
        1846.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object QRShape6: TQRShape
        Left = 0
        Top = 33
        Width = 698
        Height = 4
        Size.Values = (
          10.583333333333330000
          0.000000000000000000
          87.312500000000000000
          1846.791666666667000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape7: TQRShape
        Left = 0
        Top = 96
        Width = 698
        Height = 4
        Size.Values = (
          10.583333333333330000
          0.000000000000000000
          254.000000000000000000
          1846.791666666667000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel15: TQRLabel
        Left = 0
        Top = 80
        Width = 60
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          211.666666666666700000
          158.750000000000000000)
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
      object QRLabel16: TQRLabel
        Left = 540
        Top = 80
        Width = 71
        Height = 15
        Size.Values = (
          39.687500000000000000
          1428.750000000000000000
          211.666666666666700000
          187.854166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Doc. Entr.'
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
        Left = 0
        Top = 39
        Width = 177
        Height = 17
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          103.187500000000000000
          468.312500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Descri'#231#227'o do Produto: '
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRDBText15: TQRDBText
        Left = 176
        Top = 39
        Width = 73
        Height = 17
        Size.Values = (
          44.979166666666670000
          465.666666666666700000
          103.187500000000000000
          193.145833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataField = 'DESCRICAO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel18: TQRLabel
        Left = 0
        Top = 57
        Width = 145
        Height = 17
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          150.812500000000000000
          383.645833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Pre'#231'o do Produto: '
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRDBText16: TQRDBText
        Left = 176
        Top = 57
        Width = 97
        Height = 17
        Size.Values = (
          44.979166666666670000
          465.666666666666700000
          150.812500000000000000
          256.645833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataField = 'PRECO_VAREJO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Mask = '#,##0.00'
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel19: TQRLabel
        Left = 625
        Top = 80
        Width = 71
        Height = 15
        Size.Values = (
          39.687500000000000000
          1653.645833333333000000
          211.666666666666700000
          187.854166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Doc. Sa'#237'da'
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
      object QRSysData5: TQRSysData
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
      object QRLabel21: TQRLabel
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
      object QRSysData6: TQRSysData
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
      object QRShape8: TQRShape
        Left = 0
        Top = 75
        Width = 698
        Height = 4
        Size.Values = (
          10.583333333333330000
          0.000000000000000000
          198.437500000000000000
          1846.791666666667000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel20: TQRLabel
        Left = 72
        Top = 80
        Width = 64
        Height = 15
        Size.Values = (
          39.687500000000000000
          190.500000000000000000
          211.666666666666700000
          169.333333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Hist'#243'rico'
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
        Left = 152
        Top = 80
        Width = 64
        Height = 15
        Size.Values = (
          39.687500000000000000
          402.166666666666700000
          211.666666666666700000
          169.333333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Hist'#243'rico'
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
      object QRLabel23: TQRLabel
        Left = 387
        Top = 57
        Width = 97
        Height = 17
        Size.Values = (
          44.979166666666670000
          1023.937500000000000000
          150.812500000000000000
          256.645833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Num. S'#233'rie: '
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRDBText23: TQRDBText
        Left = 496
        Top = 57
        Width = 73
        Height = 17
        Size.Values = (
          44.979166666666670000
          1312.333333333333000000
          150.812500000000000000
          193.145833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataField = 'NUM_SERIE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Mask = '#,##0.00'
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
    end
    object QRBand5: TQRBand
      Left = 48
      Top = 150
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
      object QRDBText18: TQRDBText
        Left = 0
        Top = 0
        Width = 60
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          0.000000000000000000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = 'TRANSACAO_ID'
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
      object QRDBText19: TQRDBText
        Left = 152
        Top = 0
        Width = 377
        Height = 15
        Size.Values = (
          39.687500000000000000
          402.166666666666700000
          0.000000000000000000
          997.479166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = 'HISTORICO'
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
      object QRDBText20: TQRDBText
        Left = 540
        Top = 0
        Width = 73
        Height = 15
        Size.Values = (
          39.687500000000000000
          1428.750000000000000000
          0.000000000000000000
          193.145833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = 'ENTRADA'
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
      object QRDBText21: TQRDBText
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
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = 'SAIDA'
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
      object QRDBText22: TQRDBText
        Left = 72
        Top = 0
        Width = 57
        Height = 15
        Size.Values = (
          39.687500000000000000
          190.500000000000000000
          0.000000000000000000
          150.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataField = 'DT_TRANS'
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
  end
  object PopupMenu1: TPopupMenu
    Left = 688
    Top = 360
    object AtualizarNCMProdutosSelecionados1: TMenuItem
      Caption = 'Atualizar NCM (Produtos Selecionados)'
      OnClick = AtualizarNCMProdutosSelecionados1Click
    end
    object AtualizarNCMTodosdaTela1: TMenuItem
      Caption = 'Atualizar NCM (Todos da Tela)'
      OnClick = AtualizarNCMTodosdaTela1Click
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 720
    Top = 360
    object MenuItem1: TMenuItem
      Caption = 'Imprimir Etiquetas'
      OnClick = MenuItem1Click
    end
  end
  object USql_Fabricante: TFDUpdateSQL
    Connection = FrmData.DbF_Eficaz
    Left = 132
    Top = 492
  end
  object USql_Producao: TFDUpdateSQL
    Connection = FrmData.DbF_Eficaz
    InsertSQL.Strings = (
      'insert into PRODUCAO_ITENS'
      '  (DESCRICAO, INSUMO_ID, PRODUTO_ID, QUANTIDADE)'
      'values'
      '  (:DESCRICAO, :INSUMO_ID, :PRODUTO_ID, :QUANTIDADE)')
    ModifySQL.Strings = (
      'update PRODUCAO_ITENS'
      'set'
      '  DESCRICAO = :DESCRICAO,'
      '  INSUMO_ID = :INSUMO_ID,'
      '  PRODUTO_ID = :PRODUTO_ID,'
      '  QUANTIDADE = :QUANTIDADE'
      'where'
      '  INSUMO_ID = :OLD_INSUMO_ID and'
      '  PRODUTO_ID = :OLD_PRODUTO_ID')
    DeleteSQL.Strings = (
      'delete from PRODUCAO_ITENS'
      'where'
      '  INSUMO_ID = :OLD_INSUMO_ID and'
      '  PRODUTO_ID = :OLD_PRODUTO_ID')
    FetchRowSQL.Strings = (
      'Select '
      '  PRODUTO_ID,'
      '  INSUMO_ID,'
      '  DESCRICAO,'
      '  QUANTIDADE'
      'from PRODUCAO_ITENS '
      'where'
      '  INSUMO_ID = :INSUMO_ID and'
      '  PRODUTO_ID = :PRODUTO_ID')
    Left = 96
    Top = 492
  end
  object USql_Controlados: TFDUpdateSQL
    Connection = FrmData.DbF_Eficaz
    InsertSQL.Strings = (
      'insert into LOTE_PRODUTOS'
      '  (DT_FABRICACAO, DT_VALIDADE, LOTE_ID, PRODUTO_ID, QUANTIDADE)'
      'values'
      
        '  (:DT_FABRICACAO, :DT_VALIDADE, :LOTE_ID, :PRODUTO_ID, :QUANTID' +
        'ADE)')
    ModifySQL.Strings = (
      'update LOTE_PRODUTOS'
      'set'
      '  DT_FABRICACAO = :DT_FABRICACAO,'
      '  DT_VALIDADE = :DT_VALIDADE,'
      '  LOTE_ID = :LOTE_ID,'
      '  PRODUTO_ID = :PRODUTO_ID,'
      '  QUANTIDADE = :QUANTIDADE'
      'where'
      '  LOTE_ID = :OLD_LOTE_ID and'
      '  PRODUTO_ID = :OLD_PRODUTO_ID')
    DeleteSQL.Strings = (
      'delete from LOTE_PRODUTOS'
      'where'
      '  LOTE_ID = :OLD_LOTE_ID and'
      '  PRODUTO_ID = :OLD_PRODUTO_ID')
    Left = 60
    Top = 492
  end
  object USql_Serie: TFDUpdateSQL
    Connection = FrmData.DbF_Eficaz
    InsertSQL.Strings = (
      'insert into SERIE_PRODUTOS'
      
        '  (DT_COMPRA, FORNECEDOR_ID, NUM_DOC, NUM_SERIE, PRODUTO_ID, QUA' +
        'NTIDADE)'
      'values'
      
        '  (:DT_COMPRA, :FORNECEDOR_ID, :NUM_DOC, :NUM_SERIE, :PRODUTO_ID' +
        ', :QUANTIDADE)')
    ModifySQL.Strings = (
      'update SERIE_PRODUTOS'
      'set'
      '  DT_COMPRA = :DT_COMPRA,'
      '  FORNECEDOR_ID = :FORNECEDOR_ID,'
      '  NUM_DOC = :NUM_DOC,'
      '  NUM_SERIE = :NUM_SERIE,'
      '  PRODUTO_ID = :PRODUTO_ID,'
      '  QUANTIDADE = :QUANTIDADE'
      'where'
      '  NUM_SERIE = :OLD_NUM_SERIE and'
      '  PRODUTO_ID = :OLD_PRODUTO_ID')
    DeleteSQL.Strings = (
      'delete from SERIE_PRODUTOS'
      'where'
      '  NUM_SERIE = :OLD_NUM_SERIE and'
      '  PRODUTO_ID = :OLD_PRODUTO_ID')
    FetchRowSQL.Strings = (
      'Select '
      '  NUM_SERIE,'
      '  PRODUTO_ID,'
      '  QUANTIDADE,'
      '  DT_COMPRA,'
      '  FORNECEDOR_ID,'
      '  NUM_DOC'
      'from SERIE_PRODUTOS '
      'where'
      '  NUM_SERIE = :NUM_SERIE and'
      '  PRODUTO_ID = :PRODUTO_ID')
    Left = 20
    Top = 492
  end
  object DataTabela: TDataSource
    DataSet = QTabela
    Left = 19
    Top = 438
  end
  object DataControlados: TDataSource
    DataSet = QControlados
    Left = 52
    Top = 436
  end
  object DataProducao: TDataSource
    DataSet = QProducao
    Left = 84
    Top = 436
  end
  object DataFamilia: TDataSource
    DataSet = QFamilia
    Left = 116
    Top = 436
  end
  object DataFabricante: TDataSource
    DataSet = QFabricante
    Left = 148
    Top = 436
  end
  object DataEmpresa: TDataSource
    DataSet = QEmpresa
    Left = 180
    Top = 436
  end
  object DataGrupo: TDataSource
    DataSet = QGrupo
    Left = 212
    Top = 436
  end
  object DataSubTipo: TDataSource
    DataSet = QSubTipo
    Left = 244
    Top = 436
  end
  object DataLocalizacao: TDataSource
    DataSet = QLocalizacao
    Left = 276
    Top = 436
  end
  object DataTributo: TDataSource
    DataSet = QTributo
    Left = 316
    Top = 436
  end
  object DataSerie: TDataSource
    DataSet = QSerie
    Left = 356
    Top = 436
  end
  object DataFornecedor: TDataSource
    DataSet = QFornecedor
    Left = 404
    Top = 436
  end
  object QSerie: TFDQuery
    MasterFields = 'object QEmpresa: TFDQuery'
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afDisable
    UpdateObject = USql_Serie
    SQL.Strings = (
      'SELECT * FROM SERIE_PRODUTOS'
      'WHERE'
      '(PRODUTO_ID = :PRODUTO_ID)'
      'ORDER BY DT_COMPRA,NUM_SERIE DESC')
    Left = 432
    Top = 390
    ParamData = <
      item
        Name = 'PRODUTO_ID'
        ParamType = ptInput
      end>
  end
  object QTributo: TFDQuery
    MasterFields = 'object QEmpresa: TFDQuery'
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      'SELECT * FROM TRIBUTOS'
      'WHERE'
      '(TRIBUTO_ID = :TRIBUTO_ID)')
    Left = 392
    Top = 390
    ParamData = <
      item
        Name = 'TRIBUTO_ID'
        ParamType = ptInput
      end>
  end
  object QLocalizacao: TFDQuery
    MasterFields = 'object QEmpresa: TFDQuery'
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      'SELECT * FROM TABELAS'
      'WHERE'
      '(TABELA_ID = :TABELA_ID)'
      'AND (TIPO_TABELA = '#39'8'#39')'
      'AND (STATUS = '#39'A'#39')')
    Left = 352
    Top = 390
    ParamData = <
      item
        Name = 'TABELA_ID'
        ParamType = ptInput
      end>
  end
  object QSubTipo: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      'SELECT * FROM TABELAS'
      'WHERE'
      '(TABELA_ID = :TABELA_ID)'
      'AND (TIPO_TABELA = '#39'5'#39')'
      'AND (STATUS = '#39'A'#39')')
    Left = 312
    Top = 390
    ParamData = <
      item
        Name = 'TABELA_ID'
        ParamType = ptInput
      end>
  end
  object QGrupo: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      'SELECT * FROM TABELAS'
      'WHERE'
      '(TABELA_ID = :TABELA_ID)'
      'AND (TIPO_TABELA = '#39'7'#39')'
      'AND (STATUS = '#39'A'#39')')
    Left = 280
    Top = 390
    ParamData = <
      item
        Name = 'TABELA_ID'
        ParamType = ptInput
      end>
  end
  object QEmpresa: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      'SELECT * FROM EMPRESAS'
      'WHERE'
      '(EMPRESA_ID = :EMPRESA_ID)'
      'AND (STATUS = '#39'A'#39')')
    Left = 248
    Top = 390
    ParamData = <
      item
        Name = 'EMPRESA_ID'
        ParamType = ptInput
      end>
  end
  object QFabricante: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      'SELECT * FROM FABRICANTE_PRODUTOS'
      'WHERE'
      '(PRODUTO_ID = :PRODUTO_ID)'
      'ORDER BY FORNECEDOR_ID')
    Left = 216
    Top = 389
    ParamData = <
      item
        Name = 'PRODUTO_ID'
        ParamType = ptInput
      end>
  end
  object QReplicar_produto: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afDisable
    Left = 184
    Top = 389
  end
  object QFamilia: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      'SELECT * FROM TABELAS'
      'WHERE'
      '(TABELA_ID = :TABELA_ID)'
      'AND (TIPO_TABELA = '#39'F'#39')'
      'AND (STATUS = '#39'A'#39')')
    Left = 152
    Top = 388
    ParamData = <
      item
        Name = 'TABELA_ID'
        ParamType = ptInput
      end>
  end
  object QFuncionario: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afDisable
    Left = 120
    Top = 386
  end
  object QProducao: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      'SELECT * FROM PRODUCAO_ITENS'
      'WHERE'
      '(PRODUTO_ID = :PRODUTO_ID)')
    Left = 88
    Top = 386
    ParamData = <
      item
        Name = 'PRODUTO_ID'
        ParamType = ptInput
      end>
  end
  object QControlados: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afDisable
    Left = 56
    Top = 385
  end
  object QPedido: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afDisable
    Left = 24
    Top = 385
  end
  object Qordem: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      'SELECT * FROM EMPRESAS'
      'WHERE'
      '(EMPRESA_ID = :EMPRESA_ID)'
      'AND (STATUS = '#39'A'#39')')
    Left = 24
    Top = 337
    ParamData = <
      item
        Name = 'EMPRESA_ID'
        ParamType = ptInput
      end>
  end
  object QUnidade: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      'SELECT * FROM TABELAS WHERE'
      'TIPO_TABELA = '#39'9'#39
      'AND STATUS = '#39'A'#39
      'AND DESCRICAO =  :DESCRICAO')
    Left = 56
    Top = 337
    ParamData = <
      item
        Name = 'DESCRICAO'
        ParamType = ptInput
      end>
  end
  object Qunidade_Venda: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      'SELECT * FROM TABELAS WHERE'
      'TIPO_TABELA = '#39'9'#39
      'AND STATUS = '#39'A'#39
      'AND DESCRICAO =  :DESCRICAO')
    Left = 88
    Top = 337
    ParamData = <
      item
        Name = 'DESCRICAO'
        ParamType = ptInput
      end>
  end
  object QRel: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      '')
    Left = 120
    Top = 337
  end
  object QArq: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afDisable
    Left = 152
    Top = 337
  end
  object QPedido1: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      '')
    Left = 184
    Top = 337
  end
  object QFornecedor: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      'SELECT * FROM FORNECEDORES'
      'WHERE'
      '(FORNECEDOR_ID = :FORNECEDOR_ID)'
      'AND (STATUS = '#39'A'#39')')
    Left = 216
    Top = 337
    ParamData = <
      item
        Name = 'FORNECEDOR_ID'
        ParamType = ptInput
      end>
  end
  object QPedidoVenda: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afDisable
    SQL.Strings = (
      'SELECT * FROM EMPRESAS'
      'WHERE'
      '(EMPRESA_ID = :EMPRESA_ID)'
      'AND (STATUS = '#39'A'#39')')
    Left = 248
    Top = 337
    ParamData = <
      item
        Name = 'EMPRESA_ID'
        ParamType = ptInput
      end>
  end
  object QTabela: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      'SELECT PRODUTOS. *  , 0.00 RETIDO  '
      'FROM PRODUTOS')
    Left = 280
    Top = 337
  end
  object IQuery: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afDisable
    Left = 312
    Top = 337
  end
  object QOrcamento: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afDisable
    Left = 344
    Top = 338
  end
end
