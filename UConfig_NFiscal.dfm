object FrmConfig_NFiscal: TFrmConfig_NFiscal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Configura'#231#227'o de Nota Fiscal'
  ClientHeight = 433
  ClientWidth = 473
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 392
    Width = 473
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnRetorna: TBitBtn
      Left = 394
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
      TabOrder = 1
      OnClick = btnRetornaClick
    end
    object btnExecuta: TBitBtn
      Left = 314
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
    Top = 0
    Width = 473
    Height = 392
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Cabe'#231'alho'
      object Label49: TLabel
        Left = 6
        Top = 61
        Width = 68
        Height = 13
        Caption = 'Sa'#237'da/Entrada'
      end
      object Label50: TLabel
        Left = 6
        Top = 87
        Width = 55
        Height = 13
        Caption = 'N'#186' N. Fiscal'
      end
      object Label51: TLabel
        Left = 6
        Top = 113
        Width = 71
        Height = 13
        Caption = 'Nat. Opera'#231#227'o'
      end
      object Label52: TLabel
        Left = 6
        Top = 139
        Width = 27
        Height = 13
        Caption = 'CFOP'
      end
      object Label53: TLabel
        Left = 6
        Top = 165
        Width = 27
        Height = 13
        Caption = 'Nome'
      end
      object Label54: TLabel
        Left = 6
        Top = 191
        Width = 48
        Height = 13
        Caption = 'CNPJ/CPF'
      end
      object Label55: TLabel
        Left = 6
        Top = 217
        Width = 56
        Height = 13
        Caption = 'Dt. Emiss'#227'o'
      end
      object Label56: TLabel
        Left = 6
        Top = 243
        Width = 45
        Height = 13
        Caption = 'Endere'#231'o'
      end
      object Label57: TLabel
        Left = 6
        Top = 269
        Width = 28
        Height = 13
        Caption = 'Bairro'
      end
      object Label58: TLabel
        Left = 6
        Top = 295
        Width = 19
        Height = 13
        Caption = 'Cep'
      end
      object Label63: TLabel
        Left = 6
        Top = 321
        Width = 68
        Height = 13
        Caption = 'Dt. Sa'#237'da/Ent.'
      end
      object Label32: TLabel
        Left = 98
        Top = 9
        Width = 33
        Height = 13
        Caption = 'Coluna'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Bevel3: TBevel
        Left = 0
        Top = 35
        Width = 463
        Height = 4
        Shape = bsTopLine
      end
      object Label7: TLabel
        Left = 174
        Top = 61
        Width = 43
        Height = 13
        Caption = 'Munic'#237'pio'
      end
      object Label8: TLabel
        Left = 174
        Top = 87
        Width = 13
        Height = 13
        Caption = 'UF'
      end
      object Label9: TLabel
        Left = 174
        Top = 113
        Width = 68
        Height = 13
        Caption = 'Insc. Estadual'
      end
      object Label10: TLabel
        Left = 174
        Top = 139
        Width = 52
        Height = 13
        Caption = 'Hora Sa'#237'da'
      end
      object Label11: TLabel
        Left = 278
        Top = 9
        Width = 33
        Height = 13
        Caption = 'Coluna'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object hEnt_Sai: TMaskEdit
        Left = 98
        Top = 58
        Width = 30
        Height = 21
        MaxLength = 3
        TabOrder = 0
        Text = ''
        OnKeyDown = hEnt_SaiKeyDown
      end
      object hMunicipio: TMaskEdit
        Left = 278
        Top = 58
        Width = 30
        Height = 21
        MaxLength = 3
        TabOrder = 11
        Text = ''
        OnKeyDown = hEnt_SaiKeyDown
      end
      object hNum_Nf: TMaskEdit
        Left = 98
        Top = 84
        Width = 30
        Height = 21
        MaxLength = 3
        TabOrder = 1
        Text = ''
        OnKeyDown = hEnt_SaiKeyDown
      end
      object hUF: TMaskEdit
        Left = 278
        Top = 84
        Width = 30
        Height = 21
        MaxLength = 3
        TabOrder = 12
        Text = ''
        OnKeyDown = hEnt_SaiKeyDown
      end
      object hDesc_CFOP: TMaskEdit
        Left = 98
        Top = 110
        Width = 30
        Height = 21
        MaxLength = 3
        TabOrder = 2
        Text = ''
        OnKeyDown = hEnt_SaiKeyDown
      end
      object hInscricao: TMaskEdit
        Left = 278
        Top = 110
        Width = 30
        Height = 21
        MaxLength = 3
        TabOrder = 13
        Text = ''
        OnKeyDown = hEnt_SaiKeyDown
      end
      object hCFOP: TMaskEdit
        Left = 98
        Top = 136
        Width = 30
        Height = 21
        MaxLength = 3
        TabOrder = 3
        Text = ''
        OnKeyDown = hEnt_SaiKeyDown
      end
      object hHr_Saida: TMaskEdit
        Left = 278
        Top = 136
        Width = 30
        Height = 21
        MaxLength = 3
        TabOrder = 14
        Text = ''
        OnKeyDown = hEnt_SaiKeyDown
      end
      object hNome: TMaskEdit
        Left = 98
        Top = 162
        Width = 30
        Height = 21
        MaxLength = 3
        TabOrder = 4
        Text = ''
        OnKeyDown = hEnt_SaiKeyDown
      end
      object hCNPJ: TMaskEdit
        Left = 98
        Top = 188
        Width = 30
        Height = 21
        MaxLength = 3
        TabOrder = 5
        Text = ''
        OnKeyDown = hEnt_SaiKeyDown
      end
      object hDt_Emissao: TMaskEdit
        Left = 98
        Top = 214
        Width = 30
        Height = 21
        MaxLength = 3
        TabOrder = 6
        Text = ''
        OnKeyDown = hEnt_SaiKeyDown
      end
      object hEndereco: TMaskEdit
        Left = 98
        Top = 240
        Width = 30
        Height = 21
        MaxLength = 3
        TabOrder = 7
        Text = ''
        OnKeyDown = hEnt_SaiKeyDown
      end
      object hBairro: TMaskEdit
        Left = 98
        Top = 266
        Width = 30
        Height = 21
        MaxLength = 3
        TabOrder = 8
        Text = ''
        OnKeyDown = hEnt_SaiKeyDown
      end
      object hCEP: TMaskEdit
        Left = 98
        Top = 292
        Width = 30
        Height = 21
        MaxLength = 3
        TabOrder = 9
        Text = ''
        OnKeyDown = hEnt_SaiKeyDown
      end
      object hDt_Saida: TMaskEdit
        Left = 98
        Top = 318
        Width = 30
        Height = 21
        MaxLength = 3
        TabOrder = 10
        Text = ''
        OnKeyDown = hEnt_SaiKeyDown
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Corpo NF'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label59: TLabel
        Left = 6
        Top = 61
        Width = 64
        Height = 13
        Caption = 'C'#243'd. Produto'
      end
      object Label60: TLabel
        Left = 6
        Top = 87
        Width = 68
        Height = 13
        Caption = 'Desc. Produto'
      end
      object Label61: TLabel
        Left = 6
        Top = 139
        Width = 19
        Height = 13
        Caption = 'CST'
      end
      object Label62: TLabel
        Left = 6
        Top = 165
        Width = 52
        Height = 13
        Caption = 'Unid. Med.'
      end
      object Label64: TLabel
        Left = 6
        Top = 191
        Width = 56
        Height = 13
        Caption = 'Quantidade'
      end
      object Label65: TLabel
        Left = 6
        Top = 217
        Width = 54
        Height = 13
        Caption = 'Vr. Unit'#225'rio'
      end
      object Label66: TLabel
        Left = 6
        Top = 243
        Width = 41
        Height = 13
        Caption = 'Vr. Total'
      end
      object Label67: TLabel
        Left = 6
        Top = 269
        Width = 49
        Height = 13
        Caption = 'Al'#237'q. ICMS'
      end
      object Label2: TLabel
        Left = 98
        Top = 9
        Width = 33
        Height = 13
        Caption = 'Coluna'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Bevel1: TBevel
        Left = 0
        Top = 35
        Width = 463
        Height = 4
        Shape = bsTopLine
      end
      object Label4: TLabel
        Left = 6
        Top = 113
        Width = 57
        Height = 13
        Caption = 'C'#243'd. Barras'
      end
      object Label12: TLabel
        Left = 6
        Top = 295
        Width = 65
        Height = 13
        Caption = 'Qtd. de Itens'
      end
      object bCodigo: TMaskEdit
        Left = 98
        Top = 58
        Width = 30
        Height = 21
        MaxLength = 3
        TabOrder = 0
        Text = ''
        OnKeyDown = hEnt_SaiKeyDown
      end
      object bDescricao: TMaskEdit
        Left = 98
        Top = 84
        Width = 30
        Height = 21
        MaxLength = 3
        TabOrder = 1
        Text = ''
        OnKeyDown = hEnt_SaiKeyDown
      end
      object bCST: TMaskEdit
        Left = 98
        Top = 136
        Width = 30
        Height = 21
        MaxLength = 3
        TabOrder = 3
        Text = ''
        OnKeyDown = hEnt_SaiKeyDown
      end
      object bUnidade: TMaskEdit
        Left = 98
        Top = 162
        Width = 30
        Height = 21
        MaxLength = 3
        TabOrder = 4
        Text = ''
        OnKeyDown = hEnt_SaiKeyDown
      end
      object bQuantidade: TMaskEdit
        Left = 98
        Top = 188
        Width = 30
        Height = 21
        MaxLength = 3
        TabOrder = 5
        Text = ''
        OnKeyDown = hEnt_SaiKeyDown
      end
      object bVr_Unitario: TMaskEdit
        Left = 98
        Top = 214
        Width = 30
        Height = 21
        MaxLength = 3
        TabOrder = 6
        Text = ''
        OnKeyDown = hEnt_SaiKeyDown
      end
      object bVr_Total: TMaskEdit
        Left = 98
        Top = 240
        Width = 30
        Height = 21
        MaxLength = 3
        TabOrder = 7
        Text = ''
        OnKeyDown = hEnt_SaiKeyDown
      end
      object bICMS: TMaskEdit
        Left = 98
        Top = 266
        Width = 30
        Height = 21
        MaxLength = 3
        TabOrder = 8
        Text = ''
        OnKeyDown = hEnt_SaiKeyDown
      end
      object bBarras: TMaskEdit
        Left = 98
        Top = 110
        Width = 30
        Height = 21
        MaxLength = 3
        TabOrder = 2
        Text = ''
        OnKeyDown = hEnt_SaiKeyDown
      end
      object bQtde: TMaskEdit
        Left = 98
        Top = 292
        Width = 30
        Height = 21
        MaxLength = 3
        TabOrder = 9
        Text = ''
        OnKeyDown = hEnt_SaiKeyDown
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Rodap'#233
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label71: TLabel
        Left = 6
        Top = 61
        Width = 65
        Height = 13
        Caption = 'B. C'#225'lc. ICMS'
      end
      object Label72: TLabel
        Left = 6
        Top = 87
        Width = 42
        Height = 13
        Caption = 'Vr. ICMS'
      end
      object Label73: TLabel
        Left = 6
        Top = 113
        Width = 62
        Height = 13
        Caption = 'B. C. S. Trib.'
      end
      object Label74: TLabel
        Left = 6
        Top = 139
        Width = 52
        Height = 13
        Caption = 'Vr. S. Trib.'
      end
      object Label75: TLabel
        Left = 6
        Top = 165
        Width = 60
        Height = 13
        Caption = 'Vr. Produtos'
      end
      object Label76: TLabel
        Left = 6
        Top = 191
        Width = 43
        Height = 13
        Caption = 'Vr. Frete'
      end
      object Label77: TLabel
        Left = 6
        Top = 217
        Width = 51
        Height = 13
        Caption = 'Vr. Seguro'
      end
      object Label78: TLabel
        Left = 6
        Top = 243
        Width = 58
        Height = 13
        Caption = 'Desp. Aces.'
      end
      object Label79: TLabel
        Left = 6
        Top = 269
        Width = 31
        Height = 13
        Caption = 'Vr. IPI'
      end
      object Label80: TLabel
        Left = 6
        Top = 321
        Width = 67
        Height = 13
        Caption = 'Nome Transp.'
      end
      object Label81: TLabel
        Left = 174
        Top = 61
        Width = 57
        Height = 13
        Caption = 'Resp. Frete'
      end
      object Label5: TLabel
        Left = 98
        Top = 9
        Width = 33
        Height = 13
        Caption = 'Coluna'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 422
        Top = 9
        Width = 33
        Height = 13
        Caption = 'Coluna'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Bevel2: TBevel
        Left = 0
        Top = 35
        Width = 463
        Height = 4
        Shape = bsTopLine
      end
      object Label86: TLabel
        Left = 174
        Top = 87
        Width = 61
        Height = 13
        Caption = 'Placa Ve'#237'culo'
      end
      object Label87: TLabel
        Left = 174
        Top = 113
        Width = 13
        Height = 13
        Caption = 'UF'
      end
      object Label88: TLabel
        Left = 174
        Top = 139
        Width = 48
        Height = 13
        Caption = 'CNPJ/CPF'
      end
      object Label89: TLabel
        Left = 174
        Top = 165
        Width = 45
        Height = 13
        Caption = 'Endere'#231'o'
      end
      object Label90: TLabel
        Left = 174
        Top = 191
        Width = 43
        Height = 13
        Caption = 'Munic'#237'pio'
      end
      object Label91: TLabel
        Left = 174
        Top = 217
        Width = 13
        Height = 13
        Caption = 'UF'
      end
      object Label92: TLabel
        Left = 174
        Top = 243
        Width = 68
        Height = 13
        Caption = 'Insc. Estadual'
      end
      object Label93: TLabel
        Left = 174
        Top = 269
        Width = 56
        Height = 13
        Caption = 'Quantidade'
      end
      object Label94: TLabel
        Left = 174
        Top = 295
        Width = 36
        Height = 13
        Caption = 'Esp'#233'cie'
      end
      object Label95: TLabel
        Left = 174
        Top = 319
        Width = 29
        Height = 13
        Caption = 'Marca'
      end
      object Label96: TLabel
        Left = 350
        Top = 61
        Width = 37
        Height = 13
        Caption = 'N'#250'mero'
      end
      object Label97: TLabel
        Left = 350
        Top = 87
        Width = 52
        Height = 13
        Caption = 'Peso Bruto'
      end
      object Label98: TLabel
        Left = 350
        Top = 113
        Width = 59
        Height = 13
        Caption = 'Peso L'#237'quido'
      end
      object Label99: TLabel
        Left = 350
        Top = 139
        Width = 51
        Height = 13
        Caption = 'Instru'#231#245'es'
      end
      object Label100: TLabel
        Left = 350
        Top = 165
        Width = 55
        Height = 13
        Caption = 'N'#186' N. Fiscal'
      end
      object Label1: TLabel
        Left = 278
        Top = 9
        Width = 33
        Height = 13
        Caption = 'Coluna'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 6
        Top = 295
        Width = 69
        Height = 13
        Caption = 'Vr. Nota Fiscal'
      end
      object fBase_ICMS: TMaskEdit
        Left = 98
        Top = 58
        Width = 30
        Height = 21
        MaxLength = 3
        TabOrder = 0
        Text = ''
        OnKeyDown = hEnt_SaiKeyDown
      end
      object fVr_ICMS: TMaskEdit
        Left = 98
        Top = 84
        Width = 30
        Height = 21
        MaxLength = 3
        TabOrder = 1
        Text = ''
        OnKeyDown = hEnt_SaiKeyDown
      end
      object fBase_St: TMaskEdit
        Left = 98
        Top = 110
        Width = 30
        Height = 21
        MaxLength = 3
        TabOrder = 2
        Text = ''
        OnKeyDown = hEnt_SaiKeyDown
      end
      object fPeso_Bruto: TMaskEdit
        Left = 422
        Top = 84
        Width = 30
        Height = 21
        MaxLength = 3
        TabOrder = 23
        Text = ''
        OnKeyDown = hEnt_SaiKeyDown
      end
      object fVr_St: TMaskEdit
        Left = 98
        Top = 136
        Width = 30
        Height = 21
        MaxLength = 3
        TabOrder = 3
        Text = ''
        OnKeyDown = hEnt_SaiKeyDown
      end
      object fPeso_Liquido: TMaskEdit
        Left = 422
        Top = 110
        Width = 30
        Height = 21
        MaxLength = 3
        TabOrder = 24
        Text = ''
        OnKeyDown = hEnt_SaiKeyDown
      end
      object fVr_Produtos: TMaskEdit
        Left = 98
        Top = 162
        Width = 30
        Height = 21
        MaxLength = 3
        TabOrder = 4
        Text = ''
        OnKeyDown = hEnt_SaiKeyDown
      end
      object fInstrucoes: TMaskEdit
        Left = 422
        Top = 136
        Width = 30
        Height = 21
        MaxLength = 3
        TabOrder = 25
        Text = ''
        OnKeyDown = hEnt_SaiKeyDown
      end
      object fVr_Frete: TMaskEdit
        Left = 98
        Top = 188
        Width = 30
        Height = 21
        MaxLength = 3
        TabOrder = 5
        Text = ''
        OnKeyDown = hEnt_SaiKeyDown
      end
      object fNum_Nf: TMaskEdit
        Left = 422
        Top = 162
        Width = 30
        Height = 21
        MaxLength = 3
        TabOrder = 26
        Text = ''
        OnKeyDown = hEnt_SaiKeyDown
      end
      object fVr_Seguro: TMaskEdit
        Left = 98
        Top = 214
        Width = 30
        Height = 21
        MaxLength = 3
        TabOrder = 6
        Text = ''
        OnKeyDown = hEnt_SaiKeyDown
      end
      object fPlaca: TMaskEdit
        Left = 278
        Top = 84
        Width = 30
        Height = 21
        MaxLength = 3
        TabOrder = 12
        Text = ''
        OnKeyDown = hEnt_SaiKeyDown
      end
      object fDespesas: TMaskEdit
        Left = 98
        Top = 240
        Width = 30
        Height = 21
        MaxLength = 3
        TabOrder = 7
        Text = ''
        OnKeyDown = hEnt_SaiKeyDown
      end
      object fUF_Placa: TMaskEdit
        Left = 278
        Top = 110
        Width = 30
        Height = 21
        MaxLength = 3
        TabOrder = 13
        Text = ''
        OnKeyDown = hEnt_SaiKeyDown
      end
      object fVr_IPI: TMaskEdit
        Left = 98
        Top = 266
        Width = 30
        Height = 21
        MaxLength = 3
        TabOrder = 8
        Text = ''
        OnKeyDown = hEnt_SaiKeyDown
      end
      object fCNPJ: TMaskEdit
        Left = 278
        Top = 136
        Width = 30
        Height = 21
        MaxLength = 3
        TabOrder = 14
        Text = ''
        OnKeyDown = hEnt_SaiKeyDown
      end
      object fNome_Transp: TMaskEdit
        Left = 98
        Top = 318
        Width = 30
        Height = 21
        MaxLength = 3
        TabOrder = 10
        Text = ''
        OnKeyDown = hEnt_SaiKeyDown
      end
      object fEndereco: TMaskEdit
        Left = 278
        Top = 162
        Width = 30
        Height = 21
        MaxLength = 3
        TabOrder = 15
        Text = ''
        OnKeyDown = hEnt_SaiKeyDown
      end
      object fResp_Frete: TMaskEdit
        Left = 278
        Top = 58
        Width = 30
        Height = 21
        MaxLength = 3
        TabOrder = 11
        Text = ''
        OnKeyDown = hEnt_SaiKeyDown
      end
      object fMunicipio: TMaskEdit
        Left = 278
        Top = 188
        Width = 30
        Height = 21
        MaxLength = 3
        TabOrder = 16
        Text = ''
        OnKeyDown = hEnt_SaiKeyDown
      end
      object fUF_Transp: TMaskEdit
        Left = 278
        Top = 214
        Width = 30
        Height = 21
        MaxLength = 3
        TabOrder = 17
        Text = ''
        OnKeyDown = hEnt_SaiKeyDown
      end
      object fInscricao: TMaskEdit
        Left = 278
        Top = 240
        Width = 30
        Height = 21
        MaxLength = 3
        TabOrder = 18
        Text = ''
        OnKeyDown = hEnt_SaiKeyDown
      end
      object fQuantidade: TMaskEdit
        Left = 278
        Top = 266
        Width = 30
        Height = 21
        MaxLength = 3
        TabOrder = 19
        Text = ''
        OnKeyDown = hEnt_SaiKeyDown
      end
      object fEspecie: TMaskEdit
        Left = 278
        Top = 292
        Width = 30
        Height = 21
        MaxLength = 3
        TabOrder = 20
        Text = ''
        OnKeyDown = hEnt_SaiKeyDown
      end
      object fMarca: TMaskEdit
        Left = 278
        Top = 318
        Width = 30
        Height = 21
        MaxLength = 3
        TabOrder = 21
        Text = ''
        OnKeyDown = hEnt_SaiKeyDown
      end
      object fNumero: TMaskEdit
        Left = 422
        Top = 58
        Width = 30
        Height = 21
        MaxLength = 3
        TabOrder = 22
        Text = ''
        OnKeyDown = hEnt_SaiKeyDown
      end
      object fVr_Nota: TMaskEdit
        Left = 98
        Top = 292
        Width = 30
        Height = 21
        MaxLength = 3
        TabOrder = 9
        Text = ''
        OnKeyDown = hEnt_SaiKeyDown
      end
    end
  end
  object QRel: TFDQuery
    Connection = FrmData.DbF_Eficaz
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      '')
    Left = 40
    Top = 384
  end
end
