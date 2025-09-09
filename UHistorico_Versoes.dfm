object FrmHistorico_Versoes: TFrmHistorico_Versoes
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Hist'#243'rico de Vers'#245'es'
  ClientHeight = 475
  ClientWidth = 744
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
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 434
    Width = 744
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object btnRetorna: TBitBtn
      Left = 665
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
      TabOrder = 0
      OnClick = btnRetornaClick
    end
  end
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 744
    Height = 434
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      
        'S'#237'mbolo: Legenda ([ + ] - Novo recurso - [ * ] - Recurso modific' +
        'ado/melhorado - [ - ] - Corre'#231#227'o de Bug)'
      ''
      'Vers'#227'o 7.0.7.2   05/10/2012'
      
        'ALTER TABLE CLIENTES ADD ANOTACOES BLOB SUB_TYPE 1 SEGMENT SIZE ' +
        '80'
      ''
      'Vers'#227'o 7.0.6.8   14/04/2012'
      
        '[ - ] - Corre'#231#227'o dos campos al'#237'quotas PIS e COFINS da tabela tra' +
        'nsitens (3 casas decimais)'
      ''
      'Vers'#227'o 7.0.6.8   09/04/2012'
      
        '[ + ] - Op'#231#227'o de informar o atendente e data de fechamento da or' +
        'dem de servi'#231'o'
      ''
      'Vers'#227'o 7.0.6.7   05/04/2012'
      
        '[ + ] - Op'#231#227'o de imprimir etiquetas p/ impressora TSC TTP-244 Pl' +
        'us'
      ''
      'Vers'#227'o 7.0.6.7   20/03/2012'
      
        '[ + ] - Op'#231#227'o de configurar etiqueta de pes'#225'veis como no PDVEfic' +
        'az'
      
        '[ + ] - Op'#231#227'o de configurar se consiste ou n'#227'o a digita'#231#227'o das N' +
        'F'#39's de compra'
      ''
      'Vers'#227'o 7.0.6.7   19/03/2012'
      '[ + ] - Op'#231#227'o de fazer download das atualiza'#231#245'es no site'
      
        '[ + ] - Op'#231#227'o de atualizar as vers'#245'es automaticamente atrav'#233's da' +
        ' rede'
      ''
      'Vers'#227'o 7.0.6.7   15/03/2012'
      
        '[ * ] - Melhorias na gera'#231#227'o da carga para balan'#231'a Filizola (KG ' +
        '- P, KU - UN). Se Un/Peso <> '#39#39', prevalece Un/Peso'
      ''
      'Vers'#227'o 7.0.6.7   14/03/2012'
      
        '[ + ] - Op'#231#227'o de n'#227'o permitir vender produtos com saldo insufici' +
        'ente no Caixa R'#225'pido'
      
        '[ + ] - Op'#231#227'o de imprimir em impressora n'#227'o fiscal (paralela) em' +
        ' rede'
      ''
      'Vers'#227'o 7.0.6.7   09/03/2012'
      '[ * ] - Melhorias na gera'#231#227'o do SPED PIS/COFINS'
      
        '[ + ] - Cria'#231#227'o das op'#231#245'es de lan'#231'amentos de entradas/sa'#237'das Sim' +
        'ples Remessa'
      '[ + ] - Adi'#231#227'o da al'#237'quota do Simples Nacional'
      '[ + ] - Agrupamento de vendas atrav'#233's do n'#250'mero do cupom'
      ''
      'Vers'#227'o 7.0.5.6   06/01/2012'
      '[ + ] - Cria'#231#227'o da op'#231#227'o de cadastro de impressoras fiscais'
      '[ + ] - Cria'#231#227'o da op'#231#227'o de cadastro de configura'#231#227'o de teclado'
      '[ + ] - Cria'#231#227'o da tabela TIPI'
      '[ + ] - Cria'#231#227'o da tabela CNAE'
      '[ * ] - Melhorias na tabela IBGE'
      ''
      'Vers'#227'o 7.0.4.8   30/11/2011'
      '[ + ] - Cria'#231#227'o da op'#231#227'o de vendas atrav'#233's de Cart'#227'o de Consumo'
      
        '[ - ] - Corre'#231#227'o da impress'#227'o da venda na impressora Bematech n'#227 +
        'o fiscal'
      
        '[ + ] - Cria'#231#227'o da op'#231#227'o de transfer'#234'ncia de produtos entre loca' +
        'liza'#231#245'es'
      ''
      'Vers'#227'o 7.0.4.4   11/11/2011'
      '[ - ] - Corre'#231#227'o na gera'#231#227'o do SPED Fiscal'
      ''
      'Vers'#227'o 7.0.4.3   04/11/2011'
      
        '[ + ] - Cria'#231#227'o da op'#231#227'o Check-List na rotina Ordem de Servi'#231'o (' +
        'oficina de motos)'
      ''
      'Vers'#227'o 7.0.4.2   27/10/2011'
      '[ * ] - Melhorias na rotina Ordem de Servi'#231'o'
      ''
      'Vers'#227'o 7.0.4.1   12/08/2011'
      '[ - ] - Corre'#231#227'o da rotina C'#243'pia de Seguran'#231'a'
      
        '[ + ] - Verifica'#231#227'o de duplicidade do C'#243'digo Original no cadastr' +
        'o de produtos'
      
        '[ + ] - Verifica'#231#227'o de duplicidade do C'#243'digo de Refer'#234'ncia no ca' +
        'dastro de produtos'
      
        '[ + ] - Cria'#231#227'o de quitar contas a receber (individual) por c'#243'di' +
        'go do cliente'
      ''
      'Vers'#227'o 7.0.3.9   09/07/2011'
      
        '[ * ] - Foi adicionado '#224' tabela Clientes 1 campo para controle d' +
        'e vendas a prazo atrav'#233's do PDV'
      
        '[ * ] - Altera'#231#227'o do '#250'ltimo pre'#231'o de compra na entrada de notas ' +
        'fiscais (Custo da Compra -> Valor da Compra)'
      ''
      'Vers'#227'o 7.0.2.3   01/03/2011'
      '[ + ] - Cria'#231#227'o de corre'#231#227'o do c'#243'digo de barras inv'#225'lido'
      '[ + ] - Cria'#231#227'o de cadastro de Patrim'#244'nio'
      '[ + ] - Cria'#231#227'o de cadastro de Servi'#231'os'
      '[ - ] - Corre'#231#227'o do c'#225'lculo do custom'#233'dio gerencial'
      ''
      'Vers'#227'o 7.0.2.2   15/02/2011'
      '[ + ] - Cria'#231#227'o de cadastro de produ'#231#227'o'
      ''
      'Vers'#227'o 7.0.2.0   29/12/2010'
      '[ + ] - Otimiza'#231#227'o para emiss'#227'o de boletos banc'#225'rios'
      ''
      'Obs.: Necess'#225'rio fazer: ALTER TABLE BANCOS DROP NUM_BANCO'
      'ALTER TABLE BANCOS ADD NUM_BANCO INTEGER DEFAULT 0'
      ''
      'Vers'#227'o 7.0.1.9   23/12/2010'
      
        '[ + ] - Cria'#231#227'o de campo para desconto m'#225'ximo na venda e/ou or'#231'a' +
        'mento'
      
        '[ + ] - Verifica'#231#227'o do pre'#231'o m'#237'nimo e m'#225'ximo de venda e/ou or'#231'am' +
        'ento'
      
        '[ + ] - Verifica'#231#227'o do produto na venda e/ou or'#231'amento (pre'#231'o pr' +
        'omo'#231#227'o)'
      '[ + ] - Inclus'#227'o do campo CFOP na devolu'#231#227'o de compra'
      
        '[ + ] - Valida'#231#227'o dos valores de base de c'#225'lculo de impostos c/ ' +
        'o valor da N. Fiscal de compra'
      ''
      'Vers'#227'o 7.0.1.6   18/11/2010'
      '--------------------------------'
      
        '[ + ] - Melhoramento da barra de menu c/ inclus'#227'o de novos '#237'cone' +
        's'
      '[ + ] - Inclus'#227'o da op'#231#227'o de Devolu'#231#227'o de Consumo de Estoque'
      ''
      'Vers'#227'o 7.0.1.6   04/11/2010'
      '--------------------------------'
      '[ + ] - Visualiza'#231#227'o das Notas canceladas e emitidas'
      
        '[ + ] - Permite incluir/excluir Notas canceladas/emitidas no SIN' +
        'TEGRA'
      '[ + ] - Permite estornar os itens das notas canceladas'
      ''
      'Vers'#227'o 7.0.1.5   03/11/2010'
      '--------------------------------'
      '[ - ] - Corre'#231#227'o da gera'#231#227'o do SINTEGRA'
      ''
      'Vers'#227'o 7.0.1.5   25/10/2010'
      '--------------------------------'
      
        '[ + ] - Dispon'#237'vel m'#243'dulo Cont'#225'bil (SPED Cont'#225'bil, SPED Fiscal, ' +
        'etc)'
      
        '[ + ] - Dispon'#237'vel op'#231#227'o de Emiss'#227'o de Cheque (ECF, Impr. Comum,' +
        ' Bematech, Chronos, Schalter, Perto, Sotomaq, Urano)'
      ''
      'Vers'#227'o 7.0.1.3   30/09/2010'
      '--------------------------------'
      
        '[ + ] - A partir de agora passa a gravar o Recibo, Protocolo e C' +
        'have da NFe no Banco de Dados'
      
        '[ + ] - Emiss'#227'o do email do DANFE da NFe autom'#225'tico, logo ap'#243's a' +
        ' emiss'#227'o da mesma'
      ''
      'Vers'#227'o 7.0.1.2   18/08/2010'
      '--------------------------------'
      '[ - ] - Corre'#231#227'o da gera'#231#227'o do SINTEGRA'
      '[ - ] - Corre'#231#227'o do Relat'#243'rio de Apura'#231#227'o do ICMS (P9)'
      '[ + ] - Relat'#243'rio Registro de Entradas (P1A)'
      ''
      'Vers'#227'o 7.0.1.1   09/06/2010'
      '--------------------------------'
      '[ - ] - Corre'#231#227'o da gera'#231#227'o do SINTEGRA'
      ''
      'Vers'#227'o 7.0.1.0   20/05/2010'
      '--------------------------------'
      
        '[ + ] - Foi implementada a op'#231#227'o de importar dados do coletor de' +
        ' dados (Invent'#225'rio)'
      
        '[ * ] - Foi adicionado '#224' tabela Produtos 4 campos para c'#243'digo de' +
        ' barras adicionais'
      
        '[ * ] - Ao importar a NFe os dados referentes ao n'#186' do lote do p' +
        'roduto fica gravado no banco de dados'
      ''
      'Vers'#227'o 7.0.0.9   18/05/2010'
      '--------------------------------'
      
        '[ + ] - Foi implementada a op'#231#227'o de importar or'#231'amentos na op'#231#227'o' +
        ' Caixa R'#225'pido'
      ''
      'Vers'#227'o 7.0.0.9   17/05/2010'
      '--------------------------------'
      
        '[ + ] - Foi implementada a op'#231#227'o de ratear o valor do ICMS ST pa' +
        'ra os itens desta condi'#231#227'o automaticamente'
      '[ * ] - Foi melhorada a op'#231#227'o de corre'#231#227'o do arquivo sintegra'
      '[ - ] - Foi corrigido o erro de gera'#231#227'o do XML ao gerar a NFe'
      ''
      'Vers'#227'o 7.0.0.8   06/05/2010'
      '--------------------------------'
      
        '[ - ] - Foi corrigido o erro quando do encerramento/abertura do ' +
        'dia (posi'#231#227'o de produtos)'
      ''
      'Vers'#227'o 7.0.0.8   03/05/2010'
      '--------------------------------'
      
        '[ + ] - Foi implementada a op'#231#227'o de convers'#227'o de CFOP na importa' +
        #231#227'o do XML da NFe'
      ''
      'Vers'#227'o 7.0.0.7   26/04/2010'
      '--------------------------------'
      
        '[ + ] - Foi implementada a op'#231#227'o de emiss'#227'o de cartas de cobran'#231 +
        'a com v'#225'rios modelos'
      
        '[ + ] - Foi implementada a op'#231#227'o de cadastro de fam'#237'lia de produ' +
        'tos p/ permitir a remarca'#231#227'o de pre'#231'os por lote'
      '[ * ] - Implemantado pesquisa avan'#231'ada na cota'#231#227'o de produtos'
      '[ - ] - Corre'#231#227'o do erro de invent'#225'rio de produtos'
      ''
      'Vers'#227'o 7.0.0.6   23/04/2010'
      '--------------------------------'
      '[ - ] - Corre'#231#227'o do erro ao pesquisar produtos com a tecla <F7>'
      '[ - ] - Corre'#231#227'o do campo Unidade de Venda na tela de produtos'
      
        '[ - ] - Corre'#231#227'o do campo Quantidade ao importar o XML de entrad' +
        'a (DANFE)'
      ''
      'Vers'#227'o 7.0.0.6   22/04/2010'
      '--------------------------------'
      
        '[ + ] - Foi implementada a corre'#231#227'o de valores de contas a receb' +
        'er'
      '[ + ] - Emiss'#227'o do recibo de quita'#231#227'o'
      
        '[ + ] - Foi adicionado o recurso de pesquisar CFOP atrav'#233's da te' +
        'cla <F7>'
      
        '[ - ] - Corre'#231#227'o do erro ao pressionar a tecla <F7> para consult' +
        'a do IBGE'
      '[ - ] - Corre'#231#227'o da fonte da tela de fornecedores'
      
        '[ - ] - Corre'#231#227'o dos lan'#231'amentos que exigem ID do Fluxo de Caixa' +
        ' (verifica situa'#231#227'o da transa'#231#227'o - Cr'#233'dito/D'#233'bito)'
      
        '[ - ] - Corre'#231#227'o dos lan'#231'amentos sem conta gerada no plano de co' +
        'ntas'
      
        '[ * ] - Implemantado campos no lan'#231'amento de despesa necess'#225'rios' +
        ' para gera'#231#227'o do registro 70 do Sintegra'
      ''
      'Vers'#227'o 7.0.0.5   16/04/2010'
      '--------------------------------'
      '[ + ] - Foi implementada a op'#231#227'o de cota'#231#227'o de pre'#231'os'
      '[ + ] - Foi implementada a op'#231#227'o de emitir NFe na op'#231#227'o compra')
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 1
    WantTabs = True
    ExplicitTop = 8
  end
end
