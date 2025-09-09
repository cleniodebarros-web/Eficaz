unit UConfig;

interface                                           

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Spin, ComCtrls, DB, DBTables, IBCustomDataSet,
  IBQuery, Mask, rxToolEdit, rxCurrEdit, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP ;

type
  TFrmConfig = class(TForm)
    Panel1: TPanel;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label9: TLabel;
    Conta_Estoque: TCurrencyEdit;
    btnConta_Estoque: TSpeedButton;
    Label36: TLabel;
    CONTA_ESTOQUE_ENT: TCurrencyEdit;
    BtnContaEstoqueEnt: TSpeedButton;
    Label11: TLabel;
    Caixa: TCurrencyEdit;
    btnCaixa: TSpeedButton;
    Label33: TLabel;
    COD_CTA: TCurrencyEdit;
    Label10: TLabel;
    Conta_Consumo: TCurrencyEdit;
    btnConta_Consumo_Estoque: TSpeedButton;
    Label26: TLabel;
    Localizacao: TCurrencyEdit;
    btnLocalizacao: TSpeedButton;
    Label27: TLabel;
    Simples_Nacional: TCurrencyEdit;
    Label13: TLabel;
    Tam_Pesavel: TCurrencyEdit;
    TabSheet2: TTabSheet;
    Label22: TLabel;
    Cta_Juros: TCurrencyEdit;
    btnConta_Juros_Recebidos: TSpeedButton;
    Label37: TLabel;
    Vendedor_id: TCurrencyEdit;
    btnVendedor_id: TSpeedButton;
    Label12: TLabel;
    Tam_Barra: TCurrencyEdit;
    Label2: TLabel;
    Marketing: TEdit;
    Label30: TLabel;
    Path_Download: TEdit;
    Label20: TLabel;
    SpeedButton3: TSpeedButton;
    Label8: TLabel;
    DT_ALTERACAO: TDateEdit;
    SpeedButton2: TSpeedButton;
    GroupBox1: TGroupBox;
    Gera_Digito: TCheckBox;
    Balanca: TCheckBox;
    Legenda_Minimo: TCheckBox;
    Iniciar: TCheckBox;
    Chk_ImpAutomatica: TCheckBox;
    Consulta_Simples: TCheckBox;
    Plano_Proprio: TCheckBox;
    Chk_Detalhe: TCheckBox;
    Label4: TLabel;
    Ambiente_NFe: TComboBox;
    SpeedButton1: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Versao_Nfe: TComboBox;
    NFe: TCheckBox;
    Codigo_Ean_Nfe: TCheckBox;
    Consiste_Entrada_NF: TCheckBox;
    TabSheet3: TTabSheet;
    Label18: TLabel;
    Cabecalho: TEdit;
    Label19: TLabel;
    Linhas: TCurrencyEdit;
    Label3: TLabel;
    Vias: TCurrencyEdit;
    Label24: TLabel;
    Largura_Papel: TCurrencyEdit;
    Altura_Papel: TCurrencyEdit;
    Label31: TLabel;
    Porta_Impressora: TComboBox;
    Label32: TLabel;
    Caminho_Zebra: TEdit;
    Label28: TLabel;
    Caminho_Impressora: TEdit;
    TabSheet4: TTabSheet;
    Label5: TLabel;
    Juros_Mensal: TCurrencyEdit;
    Juros_Diario: TCurrencyEdit;
    Label35: TLabel;
    Label23: TLabel;
    Desconto_Mensal: TCurrencyEdit;
    Label7: TLabel;
    Multa: TCurrencyEdit;
    Desc_Maximo: TCurrencyEdit;
    Label6: TLabel;
    Label1: TLabel;
    Carencia: TCurrencyEdit;
    Bloq_Devedores: TCheckBox;
    TabSheet5: TTabSheet;
    Val_preco_Promocao: TCheckBox;
    Tipo_Carga: TCheckBox;
    Carga_Automatica: TCheckBox;
    Carga_Temporaria: TCheckBox;
    Label34: TLabel;
    Intervalo: TCurrencyEdit;
    TabSheet6: TTabSheet;
    Replicar: TCheckBox;
    Gerar_Parcelas: TCheckBox;
    Alterar_Vda_ECF: TCheckBox;
    Exibir_foto_cliente_produto: TCheckBox;
    Estoque_Negativo: TCheckBox;
    Chk_senha_con_estoque: TCheckBox;
    Comparar_Precos: TCheckBox;
    Organizar_Janelas: TCheckBox;
    Vendas_Recebimento_Lote: TCheckBox;
    Desc_orc_usu: TCheckBox;
    Chk_Pgto_Devolucao: TCheckBox;
    TabSheet7: TTabSheet;
    Label15: TLabel;
    Tipo_Orcamento: TComboBox;
    Saldo_Orcamento: TCheckBox;
    Label25: TLabel;
    Objeto_Ordem: TComboBox;
    Label14: TLabel;
    DIAS_PEDIDO: TCurrencyEdit;
    Log_Orcamento: TEdit;
    Label17: TLabel;
    Excluir_Cx_Rapido: TCheckBox;
    Calc_est_ped_vda: TCheckBox;
    Chk_vda_ped: TCheckBox;
    Turno: TCheckBox;
    Label29: TLabel;
    Modelo_Impressora: TComboBox;
    Chk_Pgto_Devolucao_v: TCheckBox;
    H_Inicial: TMaskEdit;
    H_Final: TMaskEdit;
    chk_cadastro_telefone_cliente: TCheckBox;
    Chk_cpr_ped: TCheckBox;
    Chk_Similar: TCheckBox;
    ts1: TTabSheet;
    Servico_Sped: TCheckBox;
    Sped_Sintegra: TCheckBox;
    ICMS_ST_SPED: TCheckBox;
    Zerar_ICMS_ST_SPED: TCheckBox;
    SPED_CONTRIB_DESCONTO: TCheckBox;
    lbl1: TLabel;
    Cod_ins_trib: TCurrencyEdit;
    lbl2: TLabel;
    Btn_cod_Ativ_econ: TSpeedButton;
    COD_ATV_ECON: TEdit;
    lbl3: TLabel;
    Caixa_id: TCurrencyEdit;
    lbl4: TLabel;
    lbl5: TLabel;
    tipo_recibo: TComboBox;
    IP_IMPRESSORA: TEdit;
    Label21: TLabel;
    Dt_Carga: TDateEdit;
    SpeedButton5: TSpeedButton;
    Label38: TLabel;
    Label16: TLabel;
    Imp_Orcamento: TComboBox;
    Chk_ZerarCarga: TCheckBox;
    SerieNf: TComboBox;
    Label39: TLabel;
    Label40: TLabel;
    Chk_MeiaPagina: TCheckBox;
    Carga_Manual_Produtos: TCheckBox;
    Label41: TLabel;
    Cta_Desc: TCurrencyEdit;
    btnconta_desconto: TSpeedButton;
    Label42: TLabel;
    Chk_CustoProdutos: TCheckBox;
    QArq: TFDQuery;
    CHK_DIF_ICMS: TCheckBox;
    Label45: TLabel;
    Vr_Pis_Cofins_retido: TCurrencyEdit;
    SpeedButton6: TSpeedButton;
    ind_apuracao_sped: TComboBox;
    Label43: TLabel;
    Label44: TLabel;
    Label46: TLabel;
    lbl6: TLabel;
    Versao_Mdfe: TComboBox;
    Chk_HistoricoRec: TCheckBox;
    Sync: TTabSheet;
    Sync_Produtos_Manual: TCheckBox;
    Chk_Atualizar_Ecfs: TCheckBox;
    Chk_AtualizarNcm: TCheckBox;
    Label47: TLabel;
    TIMEOUT_ECFS: TCurrencyEdit;
    H_inicio_s: TMaskEdit;
    H_FIM_S: TMaskEdit;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Func_Salao: TCurrencyEdit;
    ICMS_ST_IPI_MERC: TCheckBox;
    QSearch: TFDQuery;
    QUpdate: TFDQuery;
    Chk_Auditoria: TCheckBox;
    TabSheet8: TTabSheet;
    GroupBox2: TGroupBox;
    email: TEdit;
    Label57: TLabel;
    IdHTTP1: TIdHTTP;
    IQuery: TFDQuery;
    Label51: TLabel;
    desc_funrural: TCurrencyEdit;
    Label52: TLabel;
    desc_cooperativa: TCurrencyEdit;
    chk_consistirpdv: TCheckBox;
    DT_CONSISTIR: TDateEdit;
    Label53: TLabel;
    Chk_Remover_Cdbarras_xml: TCheckBox;
    Chk_Remover_Cdfabri_xml: TCheckBox;
    Label54: TLabel;
    dias_perda: TCurrencyEdit;
    Mensagem_orc: TMemo;
    Label55: TLabel;
    Autorizacao: TMemo;
    Chk_BlocoK: TCheckBox;
    chk_DesativarCustos: TCheckBox;
    Chk_Controle_Validade: TCheckBox;
    Label58: TLabel;
    Casas_Decimais: TComboBox;
    Chk_unitarioxquantidade: TCheckBox;
    estoque_orcamento: TCheckBox;
    GroupBox3: TGroupBox;
    Label59: TLabel;
    Login_Connecta: TEdit;
    Label60: TLabel;
    Senha_connecta: TEdit;
    Label61: TLabel;
    Label62: TLabel;
    id_connecta: TEdit;
    user_auth: TEdit;
    Label56: TLabel;
    dias_consistir: TCurrencyEdit;
    Label63: TLabel;
    Time_Streaming: TCurrencyEdit;
    Chk_bl1400: TCheckBox;
    chk_consisitr: TCheckBox;
    Chk_Totalizar_G: TCheckBox;
    versao_sync: TEdit;
    Label64: TLabel;
    Label66: TLabel;
    versao_streaming: TEdit;
    Chk_Fixar_Barra_Atalhos_Lateral: TCheckBox;
    Chk_Nao_Exibir_Estoque_Fiscal_No_Gerencial: TCheckBox;
    GroupBox4: TGroupBox;
    Label65: TLabel;
    Chat: TEdit;
    Label67: TLabel;
    Email_Nfce: TEdit;
    Desconto_Percentual: TCheckBox;
    chk_contingencia: TCheckBox;
    Chk_cadastro_xml: TCheckBox;
    Label68: TLabel;
    Margem_Lucro: TCurrencyEdit;
    chk_estoque_filiais: TCheckBox;
    Localizacao_Descricao: TComboBox;
    Localizacao_id: TCurrencyEdit;
    localizacao_descricao_pdv: TComboBox;
    localizacao_id_pdv: TCurrencyEdit;
    Label69: TLabel;
    Label70: TLabel;
    Chk_Repetir_Itens: TCheckBox;
    Chk_filtro_plano: TCheckBox;
    chk_atualizar_ncm_streaming: TCheckBox;
    Mensagem_Ordem: TMemo;
    Label71: TLabel;
    chk_desc_operacao: TCheckBox;
    chk_codigo_orcamento: TCheckBox;
    raw_orcamento: TEdit;
    Label72: TLabel;
    Chk_PosicaoFim: TCheckBox;
    Label73: TLabel;
    Imp_recebimento: TComboBox;
    Label74: TLabel;
    raw_recebimento: TEdit;
    Label75: TLabel;
    vr_pontos: TCurrencyEdit;
    Label76: TLabel;
    Fluxo_Caixa_id: TCurrencyEdit;
    BtnFluxoCaixa: TSpeedButton;
    chk_impressao_normal: TCheckBox;
    Chk_Bloq_Desc_Orcamento: TCheckBox;
    Chk_Lembrete: TCheckBox;
    chk_parcelas_Compras: TCheckBox;
    chk_consistir: TCheckBox;
    chk_desconto_produto: TCheckBox;
    GroupBox5: TGroupBox;
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    senha_nuvem: TEdit;
    usuario_nuvem: TEdit;
    ip_nuvem: TEdit;
    banco_nuvem: TEdit;
    porta_nuvem: TEdit;
    Chk_IgnorarFracionamento: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConta_EstoqueClick(Sender: TObject);
    procedure btnCaixaClick(Sender: TObject);
    procedure btnConta_Consumo_EstoqueClick(Sender: TObject);
    procedure btnConta_Juros_RecebidosClick(Sender: TObject);
    procedure Conta_EstoqueKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnRetornaClick(Sender: TObject);
    procedure BalancaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnLocalizacaoClick(Sender: TObject);
    procedure Tipo_OrcamentoChange(Sender: TObject);
    procedure Ativar_SkinClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Juros_MensalExit(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure BtnContaEstoqueEntClick(Sender: TObject);
    procedure btnVendedor_idClick(Sender: TObject);
    procedure SPED_CONTRIB_DESCONTOClick(Sender: TObject);
    procedure Cod_ins_tribExit(Sender: TObject);
    procedure Btn_cod_Ativ_econClick(Sender: TObject);
    procedure Caixa_idExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Porta_ImpressoraChange(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure Imp_OrcamentoChange(Sender: TObject);
    procedure Carga_AutomaticaClick(Sender: TObject);
    procedure btnconta_descontoClick(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure Tipo_CargaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TabSheet5Show(Sender: TObject);
    procedure ts1Show(Sender: TObject);
    procedure chk_estoque_filiaisClick(Sender: TObject);
    procedure chk_consistirpdvClick(Sender: TObject);
    procedure Casas_DecimaisKeyPress(Sender: TObject; var Key: Char);
    procedure Localizacao_DescricaoExit(Sender: TObject);
    procedure localizacao_descricao_pdvExit(Sender: TObject);
  private
    function atualizar_EficazWeb(cnpj, user_auth: string): Boolean;
    { Private declarations }
  public
    { Public declarations }
    function Validacao: Boolean;
  end;

var
  FrmConfig: TFrmConfig;
  I, ID : Integer;
  Carrega_dados:Boolean;

implementation

uses
  UPrincipal, UConsulta, UData, UPasswordDlg, UEficaz_ini, UConsulta_Contribuicao;

{$R *.DFM}


function TFrmConfig.atualizar_EficazWeb(cnpj,user_auth:string):Boolean;
var
  Http: TIdHTTP;
  Parametros: TStringList;
  Resposta, API_KEY,url : string;
Begin
  try
    API_KEY    := 'F815084E9BB1E0827CF0A005A044348ED8866E27';
    Parametros := TStringList.Create;

    Parametros.Add('cnpj=' + cnpj);
    Parametros.Add('user_auth=' + user_auth);
    Parametros.Add('api_key='+API_KEY);
    Http := TIdHTTP.Create(nil);
    Http.Request.ContentEncoding := 'multipart/form-data';
    Http.Request.ContentType     := 'application/x-www-form-urlencoded';
    http.Request.UserAgent       := 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko';
    http.Request.Method          := 'POST';
    Http.ConnectTimeout          := 3000;

    URL := 'http://www.arilmaq.com/app/api/clientes/auth';

    Resposta := Http.Post(url , Parametros);



    if Resposta = '1' then
       Result := True
    else
    Begin
     Result := False;
     Application.MessageBox(PChar(resposta), PChar(Msg_Title), mb_IconInformation);
    End;

  except
     Application.MessageBox('Servidor EficazWeb não ativo ou sem conexão com internet.'+ #13'Favor verificar!', PChar(Msg_Title), mb_IconInformation);

    { on e:Exception do
        begin
          Application.MessageBox(PChar('Erro atualizar eficazweb:' + #13 +
            'Erro: ' + e.Message + Resposta), 'Erro', MB_ICONSTOP + MB_TASKMODAL);
        end;}
  end;
  Http.Free;
  Parametros.Free;
End;


function TFrmConfig.Validacao: Boolean;
begin
  Result := False;

  if (NFe.Checked) and (Ambiente_NFe.Text = '') then
  begin
    Application.MessageBox('Informe o Tipo de Ambiente da NFe', PChar(Msg_Title), mb_IconStop);

    Ambiente_NFe.Color := clYellow;
    Ambiente_NFe.SetFocus;

    exit;
  end;

  if Copy(Log_Orcamento.Text, length(Log_Orcamento.Text), 1) <> '\' then
  begin
    Application.MessageBox('O parâmetro Path Log. Orçamento está inválido. O último caractere deve ser \', PChar(Msg_Title), mb_IconStop);

    Log_Orcamento.Color := clYellow;
    Log_Orcamento.SetFocus;

    exit;
  end;

  if not DirectoryExists(Log_Orcamento.Text) then
  begin
    Application.MessageBox('O diretório Path Log. Orçamento não existe', PChar(Msg_Title), mb_IconStop);

    Log_Orcamento.Color := clYellow;
    Log_Orcamento.SetFocus;

    exit;
  end;

  QArq.Sql.Clear;
  QArq.Sql.Add('SELECT * FROM TABELAS');
  QArq.Sql.Add('WHERE');
  QArq.Sql.Add('(TABELA_ID = :TABELA_ID)');
  QArq.Sql.Add('AND (TIPO_TABELA = :TIPO_TABELA)');
  QArq.Sql.Add('AND (NIVEL =  :NIVEL)');
  QArq.Sql.Add('AND (STATUS = :STATUS)');

  QArq.ParamByName('TABELA_ID').AsInteger  := StrToInt(Conta_Estoque.Text);
  QArq.ParamByName('TIPO_TABELA').AsString := '4';
  QArq.ParamByName('NIVEL').AsString       := 'ANALÍTICA';
  QArq.ParamByName('STATUS').AsString      := 'A';

  QArq.Prepare;
  QArq.Open;

  if QArq.IsEmpty then
  begin
    Application.MessageBox('Conta Estoque inexistente', PChar(Msg_Title), mb_IconStop);

    Conta_Estoque.Color := clYellow;
    Conta_Estoque.SetFocus;

    exit;
  end;

  QArq.Sql.Clear;
  QArq.Sql.Add('SELECT * FROM TABELAS');
  QArq.Sql.Add('WHERE');
  QArq.Sql.Add('(TABELA_ID = :TABELA_ID)');
  QArq.Sql.Add('AND (TIPO_TABELA = :TIPO_TABELA)');
  QArq.Sql.Add('AND (NIVEL = :NIVEL)');
  QArq.Sql.Add('AND (STATUS = :STATUS)');

  QArq.ParamByName('TABELA_ID').AsInteger  := StrToInt(Conta_Consumo.Text);
  QArq.ParamByName('TIPO_TABELA').AsString := '4';
  QArq.ParamByName('NIVEL').AsString       := 'ANALÍTICA';
  QArq.ParamByName('STATUS').AsString      := 'A';

  QArq.Prepare;
  QArq.Open;

  if QArq.IsEmpty then
  begin
    Application.MessageBox('Conta Consumo de Estoque inexistente', PChar(Msg_Title), mb_IconStop);

    Conta_Consumo.Color := clYellow;
    Conta_Consumo.SetFocus;

    exit;
  end;

  QArq.Sql.Clear;
  QArq.Sql.Add('SELECT * FROM BANCOS');
  QArq.Sql.Add('WHERE');
  QArq.Sql.Add('(BANCO_ID = :BANCO_ID)');
  QArq.Sql.Add('AND (TIPO = :TIPO)');
  QArq.Sql.Add('AND (STATUS = :STATUS)');

  QArq.ParamByName('BANCO_ID').AsInteger := StrToInt(Caixa.Text);
  QArq.ParamByName('TIPO').AsString      := 'CAIXA';
  QArq.ParamByName('STATUS').AsString    := 'A';

  QArq.Prepare;
  QArq.Open;

  if QArq.IsEmpty then
  begin
    Application.MessageBox('Caixa inexistente', PChar(Msg_Title), mb_IconStop);

    Caixa.Color := clYellow;
    Caixa.SetFocus;

    exit;
  end;

  QArq.Sql.Clear;
  QArq.Sql.Add('SELECT * FROM TABELAS');
  QArq.Sql.Add('WHERE');
  QArq.Sql.Add('(TABELA_ID = :TABELA_ID)');
  QArq.Sql.Add('AND (TIPO_TABELA = :TIPO_TABELA)');
  QArq.Sql.Add('AND (NIVEL = :NIVEL)');
  QArq.Sql.Add('AND (STATUS = :STATUS)');

  QArq.ParamByName('TABELA_ID').AsInteger  := StrToInt(Cta_Juros.Text);
  QArq.ParamByName('TIPO_TABELA').AsString := '4';
  QArq.ParamByName('NIVEL').AsString       := 'ANALÍTICA';
  QArq.ParamByName('STATUS').AsString      := 'A';

  QArq.Prepare;
  QArq.Open;

  if QArq.IsEmpty then
  begin
    Application.MessageBox('Conta Juros Recebidos inexistente', PChar(Msg_Title), mb_IconStop);

    Cta_Juros.Color := clYellow;
    Cta_Juros.SetFocus;

    exit;
  end;

  if Localizacao.Value > 0 then
  begin
    QArq.Sql.Clear;
    QArq.Sql.Add('SELECT * FROM TABELAS');
    QArq.Sql.Add('WHERE');
    QArq.Sql.Add('(TABELA_ID = :TABELA_ID)');
    QArq.Sql.Add('AND (TIPO_TABELA = :TIPO_TABELA)');
    QArq.Sql.Add('AND (STATUS = :STATUS)');

    QArq.ParamByName('TABELA_ID').AsInteger  := StrToInt(Localizacao.Text);
    QArq.ParamByName('TIPO_TABELA').AsString := '8';
    QArq.ParamByName('STATUS').AsString      := 'A';

    QArq.Prepare;
    QArq.Open;

    if QArq.IsEmpty then
    begin
      Application.MessageBox('Localização inexistente', PChar(Msg_Title), mb_IconStop);

      Localizacao.Color := clYellow;
      Localizacao.SetFocus;

      exit;
    end;
  end;

  if (Porta_Impressora.Text = 'IP') AND (Length(IP_IMPRESSORA.Text) < 8) then
  begin
    Application.MessageBox('Configuração do IP da impressora Bematech incorreto', PChar(Msg_Title), mb_IconStop);

    IP_IMPRESSORA.Color := clYellow;
    IP_IMPRESSORA.SetFocus;

    exit;
  end;

  if (Email_Nfce.Text <> '') and (not ValidaEmail(PChar(Email_Nfce.Text))) and (Pos(';',Email_Nfce.Text) = 0) then
  begin
    Application.MessageBox('e-mail Inválido', PChar(Msg_Title), mb_IconStop);
    Email_Nfce.Color := clYellow;

    if Email_Nfce.CanFocus then
      Email_Nfce.SetFocus;

    exit;
  end;
  Result := True;
end;

procedure TFrmConfig.FormCreate(Sender: TObject);
var
I,  L, X,T: Integer;
CheckBox : TCheckBox;
begin

  FrmPrincipal.Config.Refresh;

  Conta_Estoque.Value     := FrmPrincipal.Config.FieldByName('CONTA_ESTOQUE').AsInteger;
  Conta_Estoque_Ent.Value := FrmPrincipal.Config.FieldByName('CONTA_ESTOQUE_ENT').AsInteger;
  Conta_Consumo.Value     := FrmPrincipal.Config.FieldByName('CONTA_CONSUMO').AsInteger;
  Cod_Cta.Value           := FrmPrincipal.Config.FieldByName('COD_CTA').AsInteger;

  if LeIni(Arq_Ini, 'Sistema', 'Caixa') <> '' then
    Caixa.Value := StrToInt(LeIni(Arq_Ini, 'Sistema', 'Caixa'));

  Tam_Barra.Value        := FrmPrincipal.Config.FieldByName('TAM_BARRAS').AsInteger;
  Tam_Pesavel.Value      := FrmPrincipal.Config.FieldByName('TAM_PESAVEIS').AsInteger;
  Desc_Maximo.Value      := FrmPrincipal.Config.FieldByName('DESC_MAXIMO').AsFloat;
  Simples_Nacional.Value := FrmPrincipal.Config.FieldByName('ALIQ_SIMPLES').AsFloat;
  Dt_Alteracao.Date      := FrmPrincipal.Config.FieldByName('DT_ALTERACAO').AsDateTime;
  DT_CONSISTIR.Date      := FrmPrincipal.Config.FieldByName('DT_CONSISTIR').AsDateTime;
  dias_consistir.Value   := FrmPrincipal.Config.FieldByName('DIAS_CONSISTIR').AsInteger;
  versao_sync.Text       := FrmPrincipal.Config.FieldByName('VERSAO_SYNC').AsString;
  versao_streaming.Text  := FrmPrincipal.Config.FieldByName('VERSAO_STREAMING').AsString;
  Localizacao_descricao.Text := FrmPrincipal.Config.FieldByName('LOCALIZACAO_DESCRICAO').AsString;
  Localizacao_id.Value   := FrmPrincipal.Config.FieldByName('LOCALIZACAO_ID').AsInteger;
  Localizacao_descricao_PDV.Text := FrmPrincipal.Config.FieldByName('LOCALIZACAO_DESCRICAO_PDV').AsString;
  Localizacao_id_PDV.Value       := FrmPrincipal.Config.FieldByName('LOCALIZACAO_ID_PDV').AsInteger;
  Fluxo_Caixa_id.Value           := FrmPrincipal.Config.FieldByName('FLUXO_CAIXA_ID').AsInteger;

  if FrmPrincipal.Config.FieldByName('GERA_DIGITO').AsString = 'True' then
    Gera_Digito.Checked := True
  else
    Gera_Digito.Checked := False;

  if FrmPrincipal.Config.FieldByName('TEM_BALANCA').AsString = 'True' then
    Balanca.Checked := True
  else
    Balanca.Checked := False;

  if FrmPrincipal.Config.FieldByName('PLANO_PROPRIO').AsString = 'True' then
    Plano_Proprio.Checked := True
  else
    Plano_Proprio.Checked := False;

  if FrmPrincipal.Config.FieldByName('TURNO').AsString = 'True' then
    Turno.Checked := True
  else
    Turno.Checked := False;

  if FrmPrincipal.Config.FieldByName('SPED').AsString = 'True' then
    Sped_Sintegra.Checked := True
  else
    Sped_Sintegra.Checked := False;

  if FrmPrincipal.Config.FieldByName('SPED_DESCONTO').AsString = 'True' then
    SPED_CONTRIB_DESCONTO.Checked := True
  else
    SPED_CONTRIB_DESCONTO.Checked := False;

  if FrmPrincipal.Config.FieldByName('EXIBE_FOTO').AsString = 'True' then
    Exibir_foto_cliente_produto.Checked := True
  else
    Exibir_foto_cliente_produto.Checked := False;

  if FrmPrincipal.Config.FieldByName('SPED_SERVICO').AsString = 'True' then
    Servico_Sped.Checked := True
  else
    Servico_Sped.Checked := False;


  if LeIni(ExtractFilePath(ParamStr(0)) + 'NFe.Ini', 'NFe', 'NFe') = 'True' then
    Nfe.Checked := True
  else
    Nfe.Checked := False;

  Ambiente_NFe.Text := LeIni(ExtractFilePath(ParamStr(0)) + 'NFe.Ini', 'NFe', 'Ambiente');

 { if FrmPrincipal.Config.FieldByName('VER_DESATIVADOS').AsString = 'True' then
    Desativados.Checked := True
  else
    Desativados.Checked := False; }


  if LeIni(Arq_Ini, 'Sistema', 'Não Exigir Senha ao Consistir Estoque') = 'True' then
    Chk_senha_con_estoque.Checked := True
    else
    Chk_senha_con_estoque.Checked := False;


  if LeIni(Arq_Ini, 'Sistema', 'Mod. Orçamento') <> '' then
    Begin
    Tipo_Orcamento.Text := LeIni(Arq_Ini, 'Sistema', 'Mod. Orçamento');
    if LeIni(Arq_Ini, 'Sistema', 'Mod. Orçamento') = '2' then
    Begin
    Saldo_Orcamento.Visible   := True;
    estoque_orcamento.Visible := True;
    End
    Else if LeIni(Arq_Ini, 'Sistema', 'Mod. Orçamento') = '1' then
    Desconto_Percentual.Visible := True
    Else
    Begin
    Saldo_Orcamento.Visible     := False;
    estoque_orcamento.Visible   := False;
    Desconto_Percentual.Visible := False
    End;
    End;

  Imp_Orcamento.Text   := LeIni(Arq_Ini, 'Sistema', 'Imp. Orçamento');
  Imp_Recebimento.Text := LeIni(Arq_Ini, 'Sistema', 'Imp. Recebimento');

  case Imp_Orcamento.Items.IndexOf(LeIni(Arq_Ini, 'Sistema', 'Imp. Orçamento')) of
    1: Imp_Orcamento.Hint := 'A4 - Laser Jato de Tinta Padrão';
    2: Imp_Orcamento.Hint := 'Impressora de Bobina';
    3: Imp_Orcamento.Hint := 'Térmica Bematech';
    4: Imp_Orcamento.Hint := 'A4 - Laser';
    5: Imp_Orcamento.Hint := 'Térmica Imp Padrão';
    6: Imp_Orcamento.Hint := 'A4 - Laser Jato de Tinta Meia Página';
    7: Imp_Orcamento.Hint := 'Meia Página com Logo';
    8: Imp_Orcamento.Hint := 'A4 - Laser Jato de Tinta Padrão';
  end;

  Cabecalho.Text     := LeIni(Arq_Ini, 'Sistema', 'Linha Cabeçalho');
  Log_Orcamento.Text := LeIni(Arq_Ini, 'Sistema', 'Path Orçamento');

  if LeIni(Arq_Ini, 'Sistema', 'Linhas') <> '' then
    Linhas.Value := StrToInt(LeIni(Arq_Ini, 'Sistema', 'Linhas'));

  if LeIni(Arq_Ini, 'Sistema', 'Vias') <> '' then
    Vias.Value := StrToInt(LeIni(Arq_Ini, 'Sistema', 'Vias'));

  Cta_Juros.Value        := FrmPrincipal.Config.FieldByName('CONTA_JUROS').AsInteger;
  Cta_Desc.Value         := FrmPrincipal.Config.FieldByName('CONTA_DESCONTO').AsInteger;
  desc_funrural.Value    := FrmPrincipal.Config.FieldByName('DESC_FUNRURAL').AsFloat;
  desc_cooperativa.Value := FrmPrincipal.Config.FieldByName('DESC_COOPERATIVA').AsFloat;

  if FrmPrincipal.Config.FieldByName('MOSTRAR_CADASTROS').AsString = 'True' then
    Iniciar.Checked := True
  else
    Iniciar.Checked := False;

  if FrmPrincipal.Config.FieldByName('BLOQ_DEVEDORES').AsString = 'True' then
    Bloq_Devedores.Checked := True
  else
    Bloq_Devedores.Checked := False;

  if FrmPrincipal.Config.FieldByName('CONSULTA_SIMPLES').AsString = 'True' then
    Consulta_simples.Checked := True
  else
    Consulta_simples.Checked := False;

   if FrmPrincipal.Config.FieldByName('DEV_PAGTO').AsString = 'True' then
    Chk_Pgto_Devolucao.Checked := True
  else
    Chk_Pgto_Devolucao.Checked := False;

    if FrmPrincipal.Config.FieldByName('DEV_RECEB').AsString = 'True' then
    Chk_Pgto_Devolucao_V.Checked := True
  else
    Chk_Pgto_Devolucao_V.Checked := False;

  if FrmPrincipal.Config.FieldByName('VDA_PEDV').AsString = 'True' then
    Chk_Vda_Ped.Checked := True
  else
    Chk_Vda_Ped.Checked := False;

  if FrmPrincipal.Config.FieldByName('CPR_PEDV').AsString = 'True' then
    Chk_CPR_Ped.Checked := True
  else
    Chk_CPR_Ped.Checked := False;

  if FrmPrincipal.Config.FieldByName('DESC_ORC_USU').AsString = 'True' then
    Desc_Orc_Usu.Checked := True
  else
    Desc_Orc_Usu.Checked := False;

  if FrmPrincipal.Config.FieldByName('CALC_EST_PED_VDA').AsString = 'True' then
    Calc_Est_Ped_vda.Checked := True
  else
    Calc_Est_Ped_vda.Checked := False;

  if FrmPrincipal.Config.FieldByName('CONS_SIMILAR').AsString = 'True' then
    Chk_Similar.Checked := True
  else
    Chk_Similar.Checked := False;

  if FrmPrincipal.Config.FieldByName('SPED_ICMS_ST_OUTROS').AsString = 'True' then
    icms_st_sped.Checked := True
  else
    icms_st_sped.Checked := False;

  if FrmPrincipal.Config.FieldByName('SPED_ICMS_ST_IPI_MERC').AsString = 'True' then
    icms_st_ipi_merc.Checked := True
  else
    icms_st_ipi_merc.Checked := False;

  if FrmPrincipal.Config.FieldByName('ESTOQUE_NEGATIVO').AsString = 'True' then
    Estoque_Negativo.Checked := True
  else
    Estoque_Negativo.Checked := False;

  if FrmPrincipal.Config.FieldByName('CARGA_MANUAL_PROD').AsString = 'True' then
    Sync_Produtos_Manual.Checked := True
  else
    Sync_Produtos_Manual.Checked := False;

  if FrmPrincipal.Config.FieldByName('CONTROLE_VALIDADE').AsString = 'True' then
    Chk_Controle_Validade.Checked := True
  else
    Chk_Controle_Validade.Checked := False;

  if FrmPrincipal.Config.FieldByName('AUDITORIA').AsString = 'True' then
    chk_Auditoria.Checked := True
  else
    chk_Auditoria.Checked := False;

  if FrmPrincipal.Config.FieldByName('CONSISTIR_PDV').AsString = 'True' then
  Begin
    chk_consistirpdv.Checked := True;
    DT_CONSISTIR.Enabled     := True;
  End
  else
  Begin
    chk_consistirpdv.Checked := False;
    DT_CONSISTIR.Enabled     := False;
  End;

  if LeIni(Arq_Ini, 'Sistema', 'Excluir Itens Caixa Rápido') = 'True' then
    Excluir_Cx_Rapido.Checked := True
  else
    Excluir_Cx_Rapido.Checked := False;

 { if LeIni(Arq_Ini, 'Sistema', 'Permitir Estoque Negativo') = 'True' then
    Estoque_Negativo.Checked := True
  else
    Estoque_Negativo.Checked := False;}

  if LeIni(Arq_Ini, 'Sistema', 'Consistir Digitação NF de Entrada') = 'True' then
    Consiste_Entrada_NF.Checked := True
  else
    Consiste_Entrada_NF.Checked := False;

  if LeIni(Arq_Ini, 'Sistema', 'Comparar Preço Atacado x Preço Varejo') = 'True' then
    Comparar_Precos.Checked := True
  else
    Comparar_Precos.Checked := False;

  if LeIni(Arq_Ini, 'Sistema', 'Zerar Base ICMS-ST Sped Pis/Cofins') = 'True' then
    Zerar_ICMS_ST_SPED.Checked := True
  else
    Zerar_ICMS_ST_SPED.Checked := False;

  if LeIni(Arq_Ini, 'Sistema', 'Carga Automática de Produtos') = 'True' then
  Begin
     Carga_Automatica.Checked := True;
     H_Inicial.Text := LeIni(Arq_Ini, 'TCPPDV', 'Hora Carga Inicial');
     H_Final.Text   := LeIni(Arq_Ini, 'TCPPDV', 'Hora Carga Final');
     Intervalo.Value := StrToInt(LeIni(Arq_Ini, 'TCPPDV', 'Timer Cargas'));

     if LeIni(Arq_Ini, 'Sistema', 'Carga Manual de Produtos') = 'True' then
     Carga_Manual_Produtos.Checked := True;

  End
  else
  Begin
     Carga_Automatica.Checked := False;
     Carga_Manual_Produtos.Checked := False;
     Carga_Manual_Produtos.Enabled := False;
     H_inicial.Text := '';
     H_Final.Text   := '';
     Intervalo.Value := 0;
  End;

  if LeIni(Arq_Ini, 'TCPPDV', 'Gerar Cargas Temporarias') = 'True' then
    Carga_Temporaria.Checked := True
  else
    Carga_Temporaria.Checked := False;

  if LeIni(Arq_Ini, 'Sistema', 'Replicar Produtos Filiais') = 'True' then
    Replicar.Checked := True
  else
    Replicar.Checked := False;

  if LeIni(Arq_Ini, 'Sistema', 'Organizar Janelas Automaticamente') = 'True' then
    Organizar_Janelas.Checked := True
  else
    Organizar_Janelas.Checked := False;

  if LeIni(Arq_Ini, 'Sistema', 'Permitir Alterar Venda de ECF') = 'True' then
    Alterar_Vda_ECF.Checked := True
  else
    Alterar_Vda_ECF.Checked := False;

  if LeIni(Arq_Ini, 'Sistema', 'Não Gerar Parcelas Agrupamento') = 'True' then
     Gerar_Parcelas.Checked := True
     else
     Gerar_Parcelas.Checked := False;

  if LeIni(Arq_Ini, 'Sistema', 'Exibir vendas TPCTB') = 'True' then
     Vendas_Recebimento_lote.Checked := True
     else
     Vendas_Recebimento_lote.Checked := False;

  if LeIni(Arq_Ini, 'Sistema', 'Preço Promoção Somente nos ECFs') = 'True' then
     Val_preco_Promocao.Checked := True
     else
     Val_preco_Promocao.Checked := False;

  if LeIni(Arq_Ini, 'Sistema', 'Limite Saldo Orçamento') = 'True' then
     Saldo_Orcamento.Checked := True
     else
     Saldo_Orcamento.Checked := False;

  if LeIni(Arq_Ini, 'Sistema', 'Desconto Percentual Orçamento') = 'True' then
     Desconto_Percentual.Checked := True
     else
     Desconto_Percentual.Checked := False;

  if LeIni(Arq_Ini, 'Sistema', 'Controle de Estoque no Orçamento') = 'True' then
     estoque_orcamento.Checked := True
     else
     estoque_orcamento.Checked := False;

  if LeIni(Arq_Ini, 'Sistema', 'Exibir Detalhe Produto') = 'True' then
    Chk_Detalhe.Checked := True
  else
    Chk_Detalhe.Checked := False;

  if LeIni(Arq_Ini, 'Sistema', 'Enviar Código EAN Nfe') = 'False' then
    Codigo_Ean_Nfe.Checked := True
  else
    Codigo_Ean_Nfe.Checked := False;

  if LeIni(Arq_Ini, 'Sistema', 'Importação Automática Eficaz') = 'True' then
    Chk_ImpAutomatica.Checked := True
  else
    Chk_ImpAutomatica.Checked := False;


  if LeIni(Arq_Ini, 'Sistema', 'Legenda Estoque Mínimo') = 'True' then
    Legenda_Minimo.Checked := True
  else
    Legenda_Minimo.Checked := False;

  if LeIni(Arq_Ini, 'Sistema', 'Cadastro obrigatório do telefone do Cliente') = 'True' then
    chk_cadastro_telefone_cliente.Checked := True
  else
    chk_cadastro_telefone_cliente.Checked := False;

  if LeIni(Arq_Ini, 'Sistema', 'Rdprint Meia Página') = 'True' then
    Chk_MeiaPagina.Checked := True
  else
    Chk_MeiaPagina.Checked := False;

  if Imp_Orcamento.Text =  'RDPrint' then
  Chk_MeiaPagina.Visible := True;

  if LeIni(Arq_Ini, 'Sistema', 'Fixar Barra Atalho Lateral') = 'True' then
  Chk_Fixar_Barra_Atalhos_Lateral.Checked := True
  else
  Chk_Fixar_Barra_Atalhos_Lateral.Checked := False;

  if LeIni(Arq_Ini, 'Sistema', 'Não Exibir Estoque F no G') = 'True' then
  Chk_Nao_Exibir_Estoque_Fiscal_No_Gerencial.Checked := True
  else
  Chk_Nao_Exibir_Estoque_Fiscal_No_Gerencial.Checked := False;

  if LeIni(Arq_Ini, 'Sistema', 'Alterar Preço de Custo Produtos') = 'True' then
  Chk_CustoProdutos.Checked := True
  else
  Chk_CustoProdutos.Checked := False;

  if LeIni(Arq_Ini, 'Sistema', 'Histórico Recebimento por Lote') = 'True' then
  Chk_HistoricoRec.Checked := True
  else
  Chk_HistoricoRec.Checked := False;

  if LeIni(Arq_Ini, 'Sistema', 'Lembrete') = 'True' then
  Chk_Lembrete.Checked := True
  else
  Chk_Lembrete.Checked := False;

  if LeIni(Arq_Ini, 'Sistema', 'Impressao Código para Importar Orçamento')= 'True' Then
   chk_codigo_orcamento.Checked := True
  Else
   chk_codigo_orcamento.Checked := False;
  if  FrmPrincipal.Config.FieldByName('CARGA').AsInteger = 1 then
  Chk_Atualizar_Ecfs.Checked := True
  Else
  Chk_Atualizar_Ecfs.Checked := False;

  if  FrmPrincipal.Config.FieldByName('ATUALIZAR_NCM_NF').AsString = 'True' then
  Chk_AtualizarNcm.Checked := True
  Else
  Chk_AtualizarNcm.Checked := False;

  if  FrmPrincipal.Config.FieldByName('ATUALIZAR_NCM_NFCE').AsString = 'True' then
  chk_atualizar_ncm_streaming.Checked := True
  Else
  chk_atualizar_ncm_streaming.Checked := False;

  if  FrmPrincipal.Config.FieldByName('REM_IMP_CODFAB_XML').AsString = 'True' then
  Chk_Remover_Cdfabri_xml.Checked := True
  Else
  Chk_Remover_Cdfabri_xml.Checked := False;

  if  FrmPrincipal.Config.FieldByName('REM_IMP_CODBARRA_XML').AsString = 'True' then
  Chk_Remover_Cdbarras_xml.Checked := True
  Else
  Chk_Remover_Cdbarras_xml.Checked := False;

  if  FrmPrincipal.Config.FieldByName('GERAR_BLOCOK').AsString = 'True' then
  Chk_BlocoK.Checked := True
  Else
  Chk_BlocoK.Checked := False;

  if  FrmPrincipal.Config.FieldByName('DESATIVAR_CUSTOS').AsString = 'True' then
  chk_DesativarCustos.Checked := True
  Else
  chk_DesativarCustos.Checked := False;

  if  FrmPrincipal.Config.FieldByName('VR_UNITARIO_X_QUANTIDADE').AsString = 'True' then
  Chk_unitarioxquantidade.Checked := True
  Else
  Chk_unitarioxquantidade.Checked := False;

  if  FrmPrincipal.Config.FieldByName('IGNORAR_FRACIONAMENTO').AsString = 'True' then
  Chk_IgnorarFracionamento.Checked := True
  Else
  Chk_IgnorarFracionamento.Checked := False;

  if  FrmPrincipal.Config.FieldByName('CONTINGENCIA').AsInteger = 1 then
  chk_contingencia.Checked := True
  Else
  chk_contingencia.Checked := False;

  if  FrmPrincipal.Config.FieldByName('CADASTRO_XML').AsString = 'True' then
  Chk_cadastro_xml.Checked := True
  Else
  Chk_cadastro_xml.Checked := False;

  if  FrmPrincipal.Config.FieldByName('ESTOQUE_FILIAIS').AsString = 'True' then
  chk_estoque_Filiais.Checked := True
  Else
  chk_estoque_Filiais.Checked := False;

  if  FrmPrincipal.Config.FieldByName('GERAR_BLOCO1400').AsString = 'True' then
  Chk_bl1400.Checked := True
  Else
  Chk_bl1400.Checked := False;

  if  FrmPrincipal.Config.FieldByName('CONSISTIR_GERENCIAL').AsString = 'True' then
  chk_consisitr.Checked := True
  Else
  chk_consisitr.Checked := False;

  if  FrmPrincipal.Config.FieldByName('DIFERENCA_ICMS').AsString = 'True' then
  CHK_DIF_ICMS.Checked := True
  Else
  CHK_DIF_ICMS.Checked := False;

  if  FrmPrincipal.Config.FieldByName('TOTALIZADOR_G').AsString = 'True' then
  Chk_Totalizar_G.Checked := True
  Else
  Chk_Totalizar_G.Checked := False;

  if  FrmPrincipal.Config.FieldByName('REPETIR_ITENS_ORC').AsString = 'True' then
  Chk_Repetir_Itens.Checked := True
  Else
  Chk_Repetir_Itens.Checked := False;

  if  FrmPrincipal.Config.FieldByName('FILTRO_PLANO').AsString = 'True' then
  Chk_filtro_plano.Checked := True
  Else
  Chk_filtro_plano.Checked := False;

  if  FrmPrincipal.Config.FieldByName('DESC_OPERACOES_CONTRIBUICOES').AsString = 'True' then
  chk_desc_operacao.Checked := True
  Else
  chk_desc_operacao.Checked := False;

  if  FrmPrincipal.Config.FieldByName('POSICAO_FIM_MES').AsString = 'True' then
  Chk_PosicaoFim.Checked := True
  Else
  Chk_PosicaoFim.Checked := False;

  if  FrmPrincipal.Config.FieldByName('CONSISTIR_ABERTURA').AsString = 'True' then
  Chk_Consistir.Checked := True
  Else
  Chk_Consistir.Checked := False;


  if  FrmPrincipal.Config.FieldByName('IMPRESSAO_NORMAL_ORCAMENTO').AsString = 'True' then
  Chk_Impressao_Normal.Checked := True
  Else
  Chk_Impressao_Normal.Checked := False;


  if  FrmPrincipal.Config.FieldByName('BLOQ_DESC_ORCAMENTO').AsString = 'True' then
  Chk_Bloq_Desc_Orcamento.Checked := True
  Else
  Chk_Bloq_Desc_Orcamento.Checked := False;


  if  FrmPrincipal.Config.FieldByName('IMPORTAR_BOLETOS_XML').AsString = 'True' then
  chk_parcelas_Compras.Checked := True
  Else
  chk_parcelas_Compras.Checked := False;

  if  FrmPrincipal.Config.FieldByName('DESCONTOS_PRODUTOS').AsString = 'True' then
  chk_desconto_produto.Checked := True
  Else
  chk_desconto_produto.Checked := False;





  //Orçamento
   email.Text         := FrmPrincipal.Config.FieldByName('WEB_EMAIL').AsString;
   user_auth.Text     := DecryptMsg(FrmPrincipal.Config.FieldByName('WEB_HTTP_USER').AsString, 65);

   //Connecta
   Login_Connecta.Text := FrmPrincipal.Config.FieldByName('LOGIN_CONNECTA').AsString;
   Senha_connecta.Text := DecryptMsg(FrmPrincipal.Config.FieldByName('SENHA_CONNECTA').AsString, 65);
   ID_Connecta.Text    := FrmPrincipal.Config.FieldByName('ID_CONNECTA').AsString;

   //Servidor Eficaz Filiais
   Banco_Nuvem.Text    := FrmPrincipal.Config.FieldByName('BANCO_NUVEM').AsString;
   Senha_Nuvem.Text    := FrmPrincipal.Config.FieldByName('SENHA_NUVEM').AsString;
   Porta_Nuvem.Text    := FrmPrincipal.Config.FieldByName('PORTA_NUVEM').AsString;
   IP_Nuvem.Text       := FrmPrincipal.Config.FieldByName('IP_NUVEM').AsString;
   USUARIO_Nuvem.Text  := FrmPrincipal.Config.FieldByName('USUARIO_NUVEM').AsString;


  Caixa_id.Text := LeIni(Arq_Ini, 'Caixas', 'Total');


  Objeto_Ordem.Text       := FrmPrincipal.Config.FieldByName('OBJETO_ORDEM').AsString;
  Carencia.Value          := FrmPrincipal.Config.FieldByName('CARENCIA').AsInteger;
  Juros_Mensal.Value      := FrmPrincipal.Config.FieldByName('JUROS_MENSAL').AsFloat;
  Multa.Value             := FrmPrincipal.Config.FieldByName('MULTA').AsFloat;
  Desconto_Mensal.Value   := FrmPrincipal.Config.FieldByName('DESCONTO_MENSAL').AsFloat;
  Dias_Pedido.Value       := FrmPrincipal.Config.FieldByName('DIAS_PEDIDO').AsInteger;
  Versao_Nfe.Text         := FrmPrincipal.Config.FieldByName('VERSAO_NFE').AsString;
  Versao_Mdfe.Text        := FrmPrincipal.Config.FieldByName('VERSAO_MDFE').AsString;
  Cod_ins_trib.Value      := FrmPrincipal.Config.FieldByName('COD_INS_TRIB').AsInteger;
  COD_ATV_ECON.Text       := FrmPrincipal.Config.FieldByName('COD_ATV_ECON').AsString;
  TimeOut_Ecfs.Value      := FrmPrincipal.Config.FieldByName('TIMEOUT_ECFS').AsInteger;
  h_inicio_s.Text         := FrmPrincipal.Config.FieldByName('H_INICIO_S').AsString;
  h_fim_s.Text            := FrmPrincipal.Config.FieldByName('H_FIM_S').AsString;
  Func_Salao.Value        := FrmPrincipal.Config.FieldByName('FUNC_SALAO').AsInteger;

  Marketing.Text            := LeIni(Arq_Ini, 'Sistema', 'Marketing');
  Largura_Papel.Text        := LeIni(Arq_Ini, 'Sistema', 'Largura Papel');
  Altura_Papel.Text         := LeIni(Arq_Ini, 'Sistema', 'Altura Papel');
  Localizacao.Text          := LeIni(Arq_Ini, 'Sistema', 'Localização');
  Caminho_Impressora.Text   := LeIni(Arq_Ini, 'Sistema', 'Path Impressora 40 Col.');
  Path_Download.Text        := LeIni(Arq_Ini, 'Atualização', 'Download');
  Modelo_Impressora.Text    := LeIni(Arq_Ini, 'Sistema', 'Modelo Impressora');
  Vr_Pis_Cofins_Retido.Text := LeIni(Arq_Ini,'Sistema',  'Valor Retenção Pis/Cofins');
  ind_apuracao_sped.Text    := LeIni(Arq_Ini,'Sped',  'Indicador da Apuração');
  dias_perda.value          := FrmPrincipal.Config.FieldByName('DIAS_PERDA').AsInteger;
  Autorizacao.Text          := FrmPrincipal.Config.FieldByName('AUTORIZACAO').AsString;
  Casas_Decimais.Text       := FrmPrincipal.Config.FieldByName('CASAS_DECIMAIS_DANFE').AsString;
  Time_Streaming.Value      := FrmPrincipal.Config.FieldByName('TIME_STREAMING').AsInteger;
  CHAT.Text                 := FrmPrincipal.Config.FieldByName('CHAT').AsString;
  Email_Nfce.Text           := FrmPrincipal.Config.FieldByName('EMAIL_NFCE').AsString;
  Margem_Lucro.Value        := FrmPrincipal.Config.FieldByName('MARGEM_LUCRO').AsFloat;
  Raw_Orcamento.Text        := LeIni(Arq_Ini, 'Sistema', 'RAW Código Orçamento');
  Raw_Recebimento.Text      := LeIni(Arq_Ini, 'Sistema', 'RAW Recebimento');
  Vr_Pontos.Value           := FrmPrincipal.Config.FieldByName('VR_PONTOS').AsFloat;

  if Length(LeIni(Arq_Ini, 'Sistema', 'Porta Impressora')) >= 8  then
  Begin
   IP_IMPRESSORA.Visible   := True;
   IP_IMPRESSORA.Text      := LeIni(Arq_Ini, 'Sistema', 'Porta Impressora');
   Porta_Impressora.Text   := 'IP'
  End
  Else
  Porta_Impressora.Text   := LeIni(Arq_Ini, 'Sistema', 'Porta Impressora');

  Caminho_Zebra.Text      := LeIni(Arq_Ini, 'Sistema', 'Path Impressora');
  Juros_diario.value      := Juros_Mensal.value / 30;
  Vendedor_id.Text        := LeIni(Arq_Ini, 'Sistema', 'Vendedor Padrão');
  tipo_recibo.Text        := LeIni(Arq_Ini, 'Sistema', 'Tipo Recibo');
  Mensagem_orc.Lines[0]     := LeIni(Arq_Ini, 'Sistema', 'Mensagem Orçamento');
  Mensagem_orc.Lines[1]     := LeIni(Arq_Ini, 'Sistema', 'Mensagem Orçamento 1');
  Mensagem_orc.Lines[2]     := LeIni(Arq_Ini, 'Sistema', 'Mensagem Orçamento 2');
  Mensagem_orc.Lines[3]     := LeIni(Arq_Ini, 'Sistema', 'Mensagem Orçamento 3');

  Mensagem_ordem.Lines.Clear;
  Mensagem_ordem.Lines.Add(LeIni(Arq_Ini, 'Sistema', 'Mensagem Ordem Serviço'));
  Mensagem_ordem.Lines.Add(LeIni(Arq_Ini, 'Sistema', 'Mensagem Ordem Serviço 1'));
  Mensagem_ordem.Lines.Add(LeIni(Arq_Ini, 'Sistema', 'Mensagem Ordem Serviço 2'));
  Mensagem_ordem.Lines.Add(LeIni(Arq_Ini, 'Sistema', 'Mensagem Ordem Serviço 3'));

  L := 14;
  I := 1;
  T := 192;

    for X := 1 to StrToInt(LeIni(Arq_Ini, 'Caixas', 'Total')) do
    begin
       if L > 500 then
       Begin
       L := 14;
       T := T + 23;
       End;

       CheckBox := TCheckBox.Create(TabSheet5);
       with CheckBox do
       begin

          Visible  := True;
          Left     := L;
          Top      := T;
          Width    := 86;
          Height   := 19;
          Caption  := 'Caixa'+ StrZero(IntToStr(X), 2, 0);
          TabOrder := I;
          Name     := 'Caixa'+ StrZero(IntToStr(X), 2, 0);
          Parent   := TabSheet5;

       end;

       L := L + 80;
       I := I + 1;

       if LeIni(Arq_Ini, 'Caixas', 'Caixa ' + StrZero(IntToStr(X), 2, 0)) <> '' then
        CheckBox.Checked := True;
    end;

    QArq.SQL.Clear;
    QArq.sql.Add('SELECT COUNT(PRODUTO_ID) REGISTROS FROM PRODUTOS WHERE DT_ATUALIZACAO = :DATE ');
    QArq.ParamByName('DATE').AsDateTime := Date;

    QArq.Prepare;
    QArq.Open;

     Label38.Caption :=  'Produtos Alterados hoje: ' + QArq.FieldByName('REGISTROS').AsString;
     Label44.caption :=  'Dias Off-Line : ' + DecryptMsg(FrmPrincipal.Config.FieldByName('DIAS_OFFLINE').ASSTRING,33);
     Label46.caption :=  'On-Line : ' + DecryptMsg(FrmPrincipal.Config.FieldByName('DT_CONEXAO').ASSTRING,33);


 if UpperCase(DecryptMsg(FrmPrincipal.Config.FieldByName('VERSAO').AsString, 65)) = 'LIGHT' then
 Begin
 TabSheet5.TabVisible := False;
 TabSheet4.TabVisible := False;
 TabSheet7.TabVisible := False;
 TabSheet8.TabVisible := False;
 Sync.TabVisible := False;
 ts1.TabVisible := False;
 End;

 if Casas_Decimais.Text = '' then
 Casas_Decimais.Text := '2' ;


  TabSheet1.Show;

  TabSheet1.Show;

end;

procedure TFrmConfig.FormShow(Sender: TObject);
begin
 // Carrega_dados := False;
end;

procedure TFrmConfig.Imp_OrcamentoChange(Sender: TObject);
begin
  case Imp_Orcamento.ItemIndex of
    1: Imp_Orcamento.Hint := 'A4 - Laser Jato de Tinta Padrão';
    2: Imp_Orcamento.Hint := 'Impressora de Bobina';
    3: Imp_Orcamento.Hint := 'Térmica Bematech';
    4: Imp_Orcamento.Hint := 'A4 - Laser';
    5: Imp_Orcamento.Hint := 'Térmica Imp Padrão';
    6: Imp_Orcamento.Hint := 'A4 - Laser Jato de Tinta Meia Página';
    7: Imp_Orcamento.Hint := 'Meia Página com Logo';
    8: Imp_Orcamento.Hint := 'A4 - Laser Jato de Tinta Padrão';
  end;

  if Imp_Orcamento.Text =  'RDPrint' then
  Chk_MeiaPagina.Visible := True
  else
  Begin
  Chk_MeiaPagina.Visible := False;
  Chk_MeiaPagina.Checked := False;
  End;
end;

procedure TFrmConfig.Juros_MensalExit(Sender: TObject);
begin
Juros_diario.value := Juros_Mensal.value / 30
end;

procedure TFrmConfig.Localizacao_DescricaoExit(Sender: TObject);
begin
     IQuery.Sql.Clear;
     IQuery.Sql.Text := 'SELECT TABELA_ID FROM TABELAS WHERE TIPO_TABELA = :TIPO_TABELA AND DESCRICAO = :DESCRICAO ORDER BY DESCRICAO';
     IQuery.ParamByName('TIPO_TABELA').AsString := 'L' ;
     IQuery.ParamByName('DESCRICAO').AsString   := Localizacao_Descricao.Text ;
     IQuery.Prepare;
     IQuery.Open;

     Localizacao_id.Value := IQuery.Fieldbyname('TABELA_ID').AsInteger;

end;

procedure TFrmConfig.localizacao_descricao_pdvExit(Sender: TObject);
begin
IQuery.Sql.Clear;
     IQuery.Sql.Text := 'SELECT TABELA_ID FROM TABELAS WHERE TIPO_TABELA = :TIPO_TABELA AND DESCRICAO = :DESCRICAO ORDER BY DESCRICAO';
     IQuery.ParamByName('TIPO_TABELA').AsString := 'L' ;
     IQuery.ParamByName('DESCRICAO').AsString   := Localizacao_Descricao_PDV.Text ;
     IQuery.Prepare;
     IQuery.Open;

     Localizacao_id_PDV.Value := IQuery.Fieldbyname('TABELA_ID').AsInteger;


end;

procedure TFrmConfig.Porta_ImpressoraChange(Sender: TObject);
begin
if (Porta_Impressora.Text =  'IP') or (Porta_Impressora.Text =  'USB') then
IP_IMPRESSORA.Visible := True
else
IP_IMPRESSORA.Visible:= False;


end;

procedure TFrmConfig.SPED_CONTRIB_DESCONTOClick(Sender: TObject);
begin

{Application.CreateForm(TFrmPasswordDlg, FrmPasswordDlg);
  try
    if FrmPasswordDlg.ShowModal = mrOk then
    begin
      if FrmPasswordDlg.Password.Text = Senha_Suporte then
      SPED_CONTRIB_DESCONTO.Checked := True
      else
       begin
        SPED_CONTRIB_DESCONTO.Checked := False;
        Application.MessageBox('Acesso negado', PChar(Msg_Title), mb_IconStop);
       end;
    end
    Else
    SPED_CONTRIB_DESCONTO.Checked := False;
  finally
  FrmPasswordDlg.Release;
  end;
  FrmPasswordDlg.Close;}

end;

procedure TFrmConfig.SpeedButton1Click(Sender: TObject);
var
InputString: String;
begin
  Application.CreateForm(TFrmPasswordDlg, FrmPasswordDlg);
  try
    if FrmPasswordDlg.ShowModal = mrOk then
    begin
     if (SerieNf.Text = '001') Then
     Begin
      if FrmPasswordDlg.Password.Text = Senha_Suporte then
      begin
       if (FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger = 1)  then
       Begin
        QArq.Sql.Clear;
        QArq.Sql.Add('SELECT NEXTVAL(:GEN_NFISCAL) ID');
        QArq.ParamByName('GEN_NFISCAL').AsString :='gen_nfiscal';

        QArq.Prepare;
        QArq.Open;

        InputString := InputBox(PChar(Msg_Title), 'Nº Próxima N. Fiscal:' , IntToStr(QArq.Fields[0].AsInteger));

        QArq.Sql.Clear;
        QArq.Sql.Add('ALTER SEQUENCE GEN_NFISCAL RESTART WITH ' + (inputstring));
        QArq.Prepare;
        QArq.ExecSql;

       End;

       if FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger = 2 then
       Begin
        QArq.Sql.Clear;
        QArq.Sql.Add('SELECT NEXTVAL(:GEN_NFISCAL) ID');
        QArq.ParamByName('GEN_NFISCAL').AsString :='gen_nfiscal02';

        QArq.Prepare;
        QArq.Open;

        InputString := InputBox(PChar(Msg_Title), 'Nº Próxima N. Fiscal:' , IntToStr(QArq.Fields[0].AsInteger));

        QArq.Sql.Clear;
        QArq.Sql.Add('ALTER SEQUENCE GEN_NFISCAL02 RESTART WITH ' + (inputstring));
        QArq.Prepare;
        QArq.ExecSql;

       End;

       if FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger = 3 then
       Begin
        QArq.Sql.Clear;
        QArq.Sql.Add('SELECT NEXTVAL(:GEN_NFISCAL) ID');
        QArq.ParamByName('GEN_NFISCAL').AsString :='gen_nfiscal03';

        QArq.Prepare;
        QArq.Open;

        InputString := InputBox(PChar(Msg_Title), 'Nº Próxima N. Fiscal:' , IntToStr(QArq.Fields[0].AsInteger));

        QArq.Sql.Clear;
        QArq.Sql.Add('ALTER SEQUENCE GEN_NFISCAL03 RESTART WITH ' + (inputstring));
        QArq.Prepare;
        QArq.ExecSql;

       End;

       if FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger = 4 then
       Begin
        QArq.Sql.Clear;
        QArq.Sql.Add('SELECT NEXTVAL(:GEN_NFISCAL) ID');
        QArq.ParamByName('GEN_NFISCAL').AsString :='gen_nfiscal04';

        QArq.Prepare;
        QArq.Open;

        InputString := InputBox(PChar(Msg_Title), 'Nº Próxima N. Fiscal:' , IntToStr(QArq.Fields[0].AsInteger));

        QArq.Sql.Clear;
        QArq.Sql.Add('ALTER SEQUENCE GEN_NFISCAL04 RESTART WITH ' + (inputstring));
        QArq.Prepare;
        QArq.ExecSql;



       End;

       if FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger = 5 then
       Begin
        QArq.Sql.Clear;
        QArq.Sql.Add('SELECT NEXTVAL(:GEN_NFISCAL) ID');
        QArq.ParamByName('GEN_NFISCAL').AsString :='gen_nfiscal05';

        QArq.Prepare;
        QArq.Open;

        InputString := InputBox(PChar(Msg_Title), 'Nº Próxima N. Fiscal:' , IntToStr(QArq.Fields[0].AsInteger));

        QArq.Sql.Clear;
        QArq.Sql.Add('ALTER SEQUENCE GEN_NFISCAL05 RESTART WITH ' + (inputstring));
        QArq.Prepare;
        QArq.ExecSql;

       End;

       if FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger = 6 then
       Begin
        QArq.Sql.Clear;
        QArq.Sql.Add('SELECT NEXTVAL(:GEN_NFISCAL) ID');
        QArq.ParamByName('GEN_NFISCAL').AsString :='gen_nfiscal06';

        QArq.Prepare;
        QArq.Open;

        InputString := InputBox(PChar(Msg_Title), 'Nº Próxima N. Fiscal:' , IntToStr(QArq.Fields[0].AsInteger));

        QArq.Sql.Clear;
        QArq.Sql.Add('ALTER SEQUENCE GEN_NFISCAL06 RESTART WITH ' + (inputstring));
        QArq.Prepare;
        QArq.ExecSql;

       End;

       if FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger = 7 then
       Begin
        QArq.Sql.Clear;
        QArq.Sql.Add('SELECT NEXTVAL(:GEN_NFISCAL) ID');
        QArq.ParamByName('GEN_NFISCAL').AsString :='gen_nfiscal07';

        QArq.Prepare;
        QArq.Open;

        InputString := InputBox(PChar(Msg_Title), 'Nº Próxima N. Fiscal:' , IntToStr(QArq.Fields[0].AsInteger));

        QArq.Sql.Clear;
        QArq.Sql.Add('ALTER SEQUENCE GEN_NFISCAL07 RESTART WITH ' + (inputstring));
        QArq.Prepare;
        QArq.ExecSql;

       End;


      end
      else
        Application.MessageBox('Acesso negado', PChar(Msg_Title), mb_IconStop);
     End

     Else if (SerieNf.Text = '002') Then
     Begin
      if FrmPasswordDlg.Password.Text = Senha_Suporte then
      begin
       if (FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger = 1)  then
       Begin
        QArq.Sql.Clear;
        QArq.Sql.Add('SELECT NEXTVAL(:GEN_NFISCAL) ID');
        QArq.ParamByName('GEN_NFISCAL').AsString :='gen_nfiscal_s002';

        QArq.Prepare;
        QArq.Open;

        InputString := InputBox(PChar(Msg_Title), 'Nº Próxima N. Fiscal:' , IntToStr(QArq.Fields[0].AsInteger));

        QArq.Sql.Clear;
        QArq.Sql.Add('ALTER SEQUENCE GEN_NFISCAL_S002 RESTART WITH ' + (inputstring));
        QArq.Prepare;
        QArq.ExecSql;


       End;

       if FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger = 2 then
       Begin
        QArq.Sql.Clear;
        QArq.Sql.Add('SELECT NEXTVAL(:GEN_NFISCAL) ID');
        QArq.ParamByName('GEN_NFISCAL').AsString :='gen_nfiscal02_S002';

        QArq.Prepare;
        QArq.Open;

        InputString := InputBox(PChar(Msg_Title), 'Nº Próxima N. Fiscal:' , IntToStr(QArq.Fields[0].AsInteger));

        QArq.Sql.Clear;
        QArq.Sql.Add('ALTER SEQUENCE GEN_NFISCAL02_S002 RESTART WITH ' + (inputstring));
        QArq.Prepare;
        QArq.ExecSql;


       End;

       if FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger = 3 then
       Begin
        QArq.Sql.Clear;
        QArq.Sql.Add('SELECT NEXTVAL(:GEN_NFISCAL) ID');
        QArq.ParamByName('GEN_NFISCAL').AsString :='gen_nfiscal03_s002';

        QArq.Prepare;
        QArq.Open;

        InputString := InputBox(PChar(Msg_Title), 'Nº Próxima N. Fiscal:' , IntToStr(QArq.Fields[0].AsInteger));

        QArq.Sql.Clear;
        QArq.Sql.Add('ALTER SEQUENCE GEN_NFISCAL03_S002 RESTART WITH ' + (inputstring));
        QArq.Prepare;
        QArq.ExecSql;


       End;

       if FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger = 4 then
       Begin
        QArq.Sql.Clear;
        QArq.Sql.Add('SELECT NEXTVAL(:GEN_NFISCAL) ID');
        QArq.ParamByName('GEN_NFISCAL').AsString :='gen_nfiscal04_s002';

        QArq.Prepare;
        QArq.Open;

        InputString := InputBox(PChar(Msg_Title), 'Nº Próxima N. Fiscal:' , IntToStr(QArq.Fields[0].AsInteger));

        QArq.Sql.Clear;
        QArq.Sql.Add('ALTER SEQUENCE GEN_NFISCAL04_S002 RESTART WITH ' + (inputstring));
        QArq.Prepare;
        QArq.ExecSql;

       End;

       if FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger = 5 then
       Begin
        QArq.Sql.Clear;
        QArq.Sql.Add('SELECT NEXTVAL(:GEN_NFISCAL) ID');
        QArq.ParamByName('GEN_NFISCAL').AsString :='gen_nfiscal05_S002';

        QArq.Prepare;
        QArq.Open;

        InputString := InputBox(PChar(Msg_Title), 'Nº Próxima N. Fiscal:' , IntToStr(QArq.Fields[0].AsInteger));

        QArq.Sql.Clear;
        QArq.Sql.Add('ALTER SEQUENCE GEN_NFISCAL05_S002 RESTART WITH ' + (inputstring));
        QArq.Prepare;
        QArq.ExecSql;

       End;

       if FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger = 6 then
       Begin
        QArq.Sql.Clear;
        QArq.Sql.Add('SELECT NEXTVAL(:GEN_NFISCAL) ID');
        QArq.ParamByName('GEN_NFISCAL').AsString :='gen_nfiscal06_S002';

        QArq.Prepare;
        QArq.Open;

        InputString := InputBox(PChar(Msg_Title), 'Nº Próxima N. Fiscal:' , IntToStr(QArq.Fields[0].AsInteger));

        QArq.Sql.Clear;
        QArq.Sql.Add('ALTER SEQUENCE GEN_NFISCAL06_S002 RESTART WITH ' + (inputstring));
        QArq.Prepare;
        QArq.ExecSql;

       End;

       if FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger = 7 then
       Begin
        QArq.Sql.Clear;
        QArq.Sql.Add('SELECT NEXTVAL(:GEN_NFISCAL) ID');
        QArq.ParamByName('GEN_NFISCAL').AsString :='gen_nfiscal07_S002';

        QArq.Prepare;
        QArq.Open;

        InputString := InputBox(PChar(Msg_Title), 'Nº Próxima N. Fiscal:' , IntToStr(QArq.Fields[0].AsInteger));

        QArq.Sql.Clear;
        QArq.Sql.Add('ALTER SEQUENCE GEN_NFISCAL07_S002 RESTART WITH ' + (inputstring));
        QArq.Prepare;
        QArq.ExecSql;

       End;
      end
      else
          Application.MessageBox('Acesso negado', PChar(Msg_Title), mb_IconStop);
     end
     Else if (SerieNf.Text = '003') Then
     Begin
      if FrmPasswordDlg.Password.Text = Senha_Suporte then
      begin
       if (FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger = 1)  then
       Begin
        QArq.Sql.Clear;
        QArq.Sql.Add('SELECT NEXTVAL(:GEN_NFISCAL) ID');
        QArq.ParamByName('GEN_NFISCAL').AsString :='gen_nfiscal_S003';

        QArq.Prepare;
        QArq.Open;

        InputString := InputBox(PChar(Msg_Title), 'Nº Próxima N. Fiscal:' , IntToStr(QArq.Fields[0].AsInteger));

        QArq.Sql.Clear;
        QArq.Sql.Add('ALTER SEQUENCE GEN_NFISCAL_S003 RESTART WITH ' + (inputstring));
        QArq.Prepare;
        QArq.ExecSql;

       End;

       if FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger = 2 then
       Begin
        QArq.Sql.Clear;
        QArq.Sql.Add('SELECT NEXTVAL(:GEN_NFISCAL) ID');
        QArq.ParamByName('GEN_NFISCAL').AsString :='gen_nfiscal02_s003';

        QArq.Prepare;
        QArq.Open;

        InputString := InputBox(PChar(Msg_Title), 'Nº Próxima N. Fiscal:' , IntToStr(QArq.Fields[0].AsInteger));

        QArq.Sql.Clear;
        QArq.Sql.Add('ALTER SEQUENCE GEN_NFISCAL02_S003 RESTART WITH ' + (inputstring));
        QArq.Prepare;
        QArq.ExecSql;


       End;

       if FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger = 3 then
       Begin
        QArq.Sql.Clear;
        QArq.Sql.Add('SELECT NEXTVAL(:GEN_NFISCAL) ID');
        QArq.ParamByName('GEN_NFISCAL').AsString :='gen_nfiscal03_s003';

        QArq.Prepare;
        QArq.Open;

        InputString := InputBox(PChar(Msg_Title), 'Nº Próxima N. Fiscal:' , IntToStr(QArq.Fields[0].AsInteger));

        QArq.Sql.Clear;
        QArq.Sql.Add('ALTER SEQUENCE GEN_NFISCAL03_S003 RESTART WITH ' + (inputstring));
        QArq.Prepare;
        QArq.ExecSql;


       End;

       if FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger = 4 then
       Begin
        QArq.Sql.Clear;
        QArq.Sql.Add('SELECT NEXTVAL(:GEN_NFISCAL) ID');
        QArq.ParamByName('GEN_NFISCAL').AsString :='gen_nfiscal04_s003';

        QArq.Prepare;
        QArq.Open;

        InputString := InputBox(PChar(Msg_Title), 'Nº Próxima N. Fiscal:' , IntToStr(QArq.Fields[0].AsInteger));

        QArq.Sql.Clear;
        QArq.Sql.Add('ALTER SEQUENCE GEN_NFISCAL04_S003 RESTART WITH ' + (inputstring));
        QArq.Prepare;
        QArq.ExecSql;


       End;

       if FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger = 5 then
       Begin

        QArq.Sql.Clear;
        QArq.Sql.Add('SELECT NEXTVAL(:GEN_NFISCAL) ID');
        QArq.ParamByName('GEN_NFISCAL').AsString :='gen_nfiscal05_s003';

        QArq.Prepare;
        QArq.Open;

        InputString := InputBox(PChar(Msg_Title), 'Nº Próxima N. Fiscal:' , IntToStr(QArq.Fields[0].AsInteger));

        QArq.Sql.Clear;
        QArq.Sql.Add('ALTER SEQUENCE GEN_NFISCAL05_S003 RESTART WITH ' + (inputstring));
        QArq.Prepare;
        QArq.ExecSql;
       End;
      end
      else
          Application.MessageBox('Acesso negado', PChar(Msg_Title), mb_IconStop);
     end; 
    end;
  finally
    FrmPasswordDlg.Release;
  end;
end;

procedure TFrmConfig.SpeedButton2Click(Sender: TObject);
var
InputString: String;
begin
  Application.CreateForm(TFrmPasswordDlg, FrmPasswordDlg);
  try
    if FrmPasswordDlg.ShowModal = mrOk then
    begin
      if FrmPasswordDlg.Password.Text = Senha_Suporte then
      begin
       Dt_Alteracao.Enabled := True;
       end
      else
        Application.MessageBox('Acesso negado', PChar(Msg_Title), mb_IconStop);
    end;
  finally
  FrmPasswordDlg.Release;
  end;
end;

procedure TFrmConfig.SpeedButton3Click(Sender: TObject);
begin
Application.CreateForm(TFrmPasswordDlg, FrmPasswordDlg);
  try
    if FrmPasswordDlg.ShowModal = mrOk then
    begin
      if FrmPasswordDlg.Password.Text = Senha_Suporte then
      begin
        Application.CreateForm(TFrmEficaz_ini, FrmEficaz_ini);
        try
        if FrmEficaz_ini.ShowModal = mrOk then
        Application.MessageBox('Arquivo salvo com sucesso', PChar(Msg_Title), mb_ok)
        Else
         Application.MessageBox('O Arquivo nao foi salvo', PChar(Msg_Title), mb_ok);
        finally
         FrmEficaz_ini.Release;
        end;
       end
      else
        Application.MessageBox('Acesso negado', PChar(Msg_Title), mb_IconStop);
    end;
  finally
  FrmPasswordDlg.Release;
  end;
end;

procedure TFrmConfig.SpeedButton4Click(Sender: TObject);
var
InputString: String;
begin
  Application.CreateForm(TFrmPasswordDlg, FrmPasswordDlg);
  try
    if FrmPasswordDlg.ShowModal = mrOk then
    begin
      if (SerieNf.Text = '001') Then
     Begin
      if FrmPasswordDlg.Password.Text = Senha_Suporte then
      begin
       if (FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger = 1)  then
       Begin
        QArq.Sql.Clear;
        QArq.Sql.Add('SELECT NEXTVAL(:GEN_CTEFISCAL) ID');
        QArq.ParamByName('GEN_CTEFISCAL').AsString :='GEN_CTEFISCAL';

        QArq.Prepare;
        QArq.Open;

        InputString := InputBox(PChar(Msg_Title), 'Nº Próxima N. Fiscal:' , IntToStr(QArq.Fields[0].AsInteger));

        QArq.Sql.Clear;
        QArq.Sql.Add('ALTER SEQUENCE GEN_CTEFISCAL RESTART WITH ' + (inputstring));
        QArq.Prepare;
        QArq.ExecSql;

       End;

       if FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger = 2 then
       Begin
        QArq.Sql.Clear;
        QArq.Sql.Add('SELECT NEXTVAL(:GEN_CTEFISCAL) ID');
        QArq.ParamByName('GEN_CTEFISCAL').AsString :='GEN_CTEFISCAL02';

        QArq.Prepare;
        QArq.Open;

        InputString := InputBox(PChar(Msg_Title), 'Nº Próxima N. Fiscal:' , IntToStr(QArq.Fields[0].AsInteger));

        QArq.Sql.Clear;
        QArq.Sql.Add('ALTER SEQUENCE GEN_CTEFISCAL02 RESTART WITH ' + (inputstring));
        QArq.Prepare;
        QArq.ExecSql;

       End;

       if FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger = 3 then
       Begin
        QArq.Sql.Clear;
        QArq.Sql.Add('SELECT NEXTVAL(:GEN_CTEFISCAL) ID');
        QArq.ParamByName('GEN_CTEFISCAL').AsString :='GEN_CTEFISCAL03';

        QArq.Prepare;
        QArq.Open;

        InputString := InputBox(PChar(Msg_Title), 'Nº Próxima N. Fiscal:' , IntToStr(QArq.Fields[0].AsInteger));

        QArq.Sql.Clear;
        QArq.Sql.Add('ALTER SEQUENCE GEN_CTEFISCAL03 RESTART WITH ' + (inputstring));
        QArq.Prepare;
        QArq.ExecSql;

       End;

       if FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger = 4 then
       Begin
        QArq.Sql.Clear;
        QArq.Sql.Add('SELECT NEXTVAL(:GEN_CTEFISCAL) ID');
        QArq.ParamByName('GEN_CTEFISCAL').AsString :='GEN_CTEFISCAL04';

        QArq.Prepare;
        QArq.Open;

        InputString := InputBox(PChar(Msg_Title), 'Nº Próxima N. Fiscal:' , IntToStr(QArq.Fields[0].AsInteger));

        QArq.Sql.Clear;
        QArq.Sql.Add('ALTER SEQUENCE GEN_CTEFISCAL04 RESTART WITH ' + (inputstring));
        QArq.Prepare;
        QArq.ExecSql;



       End;

       if FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger = 5 then
       Begin
        QArq.Sql.Clear;
        QArq.Sql.Add('SELECT NEXTVAL(:GEN_CTEFISCAL) ID');
        QArq.ParamByName('GEN_CTEFISCAL').AsString :='GEN_CTEFISCAL05';

        QArq.Prepare;
        QArq.Open;

        InputString := InputBox(PChar(Msg_Title), 'Nº Próxima N. Fiscal:' , IntToStr(QArq.Fields[0].AsInteger));

        QArq.Sql.Clear;
        QArq.Sql.Add('ALTER SEQUENCE GEN_CTEFISCAL05 RESTART WITH ' + (inputstring));
        QArq.Prepare;
        QArq.ExecSql;

       End;

       if FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger = 6 then
       Begin
        QArq.Sql.Clear;
        QArq.Sql.Add('SELECT NEXTVAL(:GEN_CTEFISCAL) ID');
        QArq.ParamByName('GEN_CTEFISCAL').AsString :='GEN_CTEFISCAL06';

        QArq.Prepare;
        QArq.Open;

        InputString := InputBox(PChar(Msg_Title), 'Nº Próxima N. Fiscal:' , IntToStr(QArq.Fields[0].AsInteger));

        QArq.Sql.Clear;
        QArq.Sql.Add('ALTER SEQUENCE GEN_CTEFISCAL06 RESTART WITH ' + (inputstring));
        QArq.Prepare;
        QArq.ExecSql;

       End;

       if FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger = 7 then
       Begin
        QArq.Sql.Clear;
        QArq.Sql.Add('SELECT NEXTVAL(:GEN_CTEFISCAL) ID');
        QArq.ParamByName('GEN_CTEFISCAL').AsString :='GEN_CTEFISCAL07';

        QArq.Prepare;
        QArq.Open;

        InputString := InputBox(PChar(Msg_Title), 'Nº Próxima N. Fiscal:' , IntToStr(QArq.Fields[0].AsInteger));

        QArq.Sql.Clear;
        QArq.Sql.Add('ALTER SEQUENCE GEN_CTEFISCAL07 RESTART WITH ' + (inputstring));
        QArq.Prepare;
        QArq.ExecSql;

       End;

       if FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger = 8 then
       Begin
        QArq.Sql.Clear;
        QArq.Sql.Add('SELECT NEXTVAL(:GEN_CTEFISCAL) ID');
        QArq.ParamByName('GEN_CTEFISCAL').AsString :='GEN_CTEFISCAL08';

        QArq.Prepare;
        QArq.Open;

        InputString := InputBox(PChar(Msg_Title), 'Nº Próxima N. Fiscal:' , IntToStr(QArq.Fields[0].AsInteger));

        QArq.Sql.Clear;
        QArq.Sql.Add('ALTER SEQUENCE GEN_CTEFISCAL08 RESTART WITH ' + (inputstring));
        QArq.Prepare;
        QArq.ExecSql;

       End;

       if FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger = 9 then
       Begin
        QArq.Sql.Clear;
        QArq.Sql.Add('SELECT NEXTVAL(:GEN_CTEFISCAL) ID');
        QArq.ParamByName('GEN_CTEFISCAL').AsString :='GEN_CTEFISCAL09';

        QArq.Prepare;
        QArq.Open;

        InputString := InputBox(PChar(Msg_Title), 'Nº Próxima N. Fiscal:' , IntToStr(QArq.Fields[0].AsInteger));

        QArq.Sql.Clear;
        QArq.Sql.Add('ALTER SEQUENCE GEN_CTEFISCAL09 RESTART WITH ' + (inputstring));
        QArq.Prepare;
        QArq.ExecSql;

       End;

       if FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger = 10 then
       Begin
        QArq.Sql.Clear;
        QArq.Sql.Add('SELECT NEXTVAL(:GEN_CTEFISCAL) ID');
        QArq.ParamByName('GEN_CTEFISCAL').AsString :='GEN_CTEFISCAL10';

        QArq.Prepare;
        QArq.Open;

        InputString := InputBox(PChar(Msg_Title), 'Nº Próxima N. Fiscal:' , IntToStr(QArq.Fields[0].AsInteger));

        QArq.Sql.Clear;
        QArq.Sql.Add('ALTER SEQUENCE GEN_CTEFISCAL10 RESTART WITH ' + (inputstring));
        QArq.Prepare;
        QArq.ExecSql;

       End;
      end
      else
        Application.MessageBox('Acesso negado', PChar(Msg_Title), mb_IconStop);
     End

     Else if (SerieNf.Text = '002') Then
     Begin
      if FrmPasswordDlg.Password.Text = Senha_Suporte then
      begin
       if (FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger = 1)  then
       Begin
        QArq.Sql.Clear;
        QArq.Sql.Add('SELECT NEXTVAL(:GEN_CTEFISCAL) ID');
        QArq.ParamByName('GEN_CTEFISCAL').AsString :='GEN_CTEFISCAL_s002';

        QArq.Prepare;
        QArq.Open;

        InputString := InputBox(PChar(Msg_Title), 'Nº Próxima N. Fiscal:' , IntToStr(QArq.Fields[0].AsInteger));

        QArq.Sql.Clear;
        QArq.Sql.Add('ALTER SEQUENCE GEN_CTEFISCAL_S002 RESTART WITH ' + (inputstring));
        QArq.Prepare;
        QArq.ExecSql;


       End;

       if FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger = 2 then
       Begin
        QArq.Sql.Clear;
        QArq.Sql.Add('SELECT NEXTVAL(:GEN_CTEFISCAL) ID');
        QArq.ParamByName('GEN_CTEFISCAL').AsString :='GEN_CTEFISCAL02_S002';

        QArq.Prepare;
        QArq.Open;

        InputString := InputBox(PChar(Msg_Title), 'Nº Próxima N. Fiscal:' , IntToStr(QArq.Fields[0].AsInteger));

        QArq.Sql.Clear;
        QArq.Sql.Add('ALTER SEQUENCE GEN_CTEFISCAL02_S002 RESTART WITH ' + (inputstring));
        QArq.Prepare;
        QArq.ExecSql;


       End;

       if FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger = 3 then
       Begin
        QArq.Sql.Clear;
        QArq.Sql.Add('SELECT NEXTVAL(:GEN_CTEFISCAL) ID');
        QArq.ParamByName('GEN_CTEFISCAL').AsString :='GEN_CTEFISCAL03_s002';

        QArq.Prepare;
        QArq.Open;

        InputString := InputBox(PChar(Msg_Title), 'Nº Próxima N. Fiscal:' , IntToStr(QArq.Fields[0].AsInteger));

        QArq.Sql.Clear;
        QArq.Sql.Add('ALTER SEQUENCE GEN_CTEFISCAL03_S002 RESTART WITH ' + (inputstring));
        QArq.Prepare;
        QArq.ExecSql;


       End;

       if FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger = 4 then
       Begin
        QArq.Sql.Clear;
        QArq.Sql.Add('SELECT NEXTVAL(:GEN_CTEFISCAL) ID');
        QArq.ParamByName('GEN_CTEFISCAL').AsString :='GEN_CTEFISCAL04_s002';

        QArq.Prepare;
        QArq.Open;

        InputString := InputBox(PChar(Msg_Title), 'Nº Próxima N. Fiscal:' , IntToStr(QArq.Fields[0].AsInteger));

        QArq.Sql.Clear;
        QArq.Sql.Add('ALTER SEQUENCE GEN_CTEFISCAL04_S002 RESTART WITH ' + (inputstring));
        QArq.Prepare;
        QArq.ExecSql;

       End;

       if FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger = 5 then
       Begin
        QArq.Sql.Clear;
        QArq.Sql.Add('SELECT NEXTVAL(:GEN_CTEFISCAL) ID');
        QArq.ParamByName('GEN_CTEFISCAL').AsString :='GEN_CTEFISCAL05_S002';

        QArq.Prepare;
        QArq.Open;

        InputString := InputBox(PChar(Msg_Title), 'Nº Próxima N. Fiscal:' , IntToStr(QArq.Fields[0].AsInteger));

        QArq.Sql.Clear;
        QArq.Sql.Add('ALTER SEQUENCE GEN_CTEFISCAL05_S002 RESTART WITH ' + (inputstring));
        QArq.Prepare;
        QArq.ExecSql;

       End;
      end
      else
          Application.MessageBox('Acesso negado', PChar(Msg_Title), mb_IconStop);
     end
     Else if (SerieNf.Text = '003') Then
     Begin
      if FrmPasswordDlg.Password.Text = Senha_Suporte then
      begin
       if (FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger = 1)  then
       Begin
        QArq.Sql.Clear;
        QArq.Sql.Add('SELECT NEXTVAL(:GEN_CTEFISCAL) ID');
        QArq.ParamByName('GEN_CTEFISCAL').AsString :='GEN_CTEFISCAL_S003';

        QArq.Prepare;
        QArq.Open;

        InputString := InputBox(PChar(Msg_Title), 'Nº Próxima Cte. Fiscal:' , IntToStr(QArq.Fields[0].AsInteger));

        QArq.Sql.Clear;
        QArq.Sql.Add('ALTER SEQUENCE GEN_CTEFISCAL_S003 RESTART WITH ' + (inputstring));
        QArq.Prepare;
        QArq.ExecSql;

       End;

       if FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger = 2 then
       Begin
        QArq.Sql.Clear;
        QArq.Sql.Add('SELECT NEXTVAL(:GEN_CTEFISCAL) ID');
        QArq.ParamByName('GEN_CTEFISCAL').AsString :='GEN_CTEFISCAL02_s003';

        QArq.Prepare;
        QArq.Open;

        InputString := InputBox(PChar(Msg_Title), 'Nº Próxima Cte. Fiscal:' , IntToStr(QArq.Fields[0].AsInteger));

        QArq.Sql.Clear;
        QArq.Sql.Add('ALTER SEQUENCE GEN_CTEFISCAL02_S003 RESTART WITH ' + (inputstring));
        QArq.Prepare;
        QArq.ExecSql;


       End;

       if FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger = 3 then
       Begin
        QArq.Sql.Clear;
        QArq.Sql.Add('SELECT NEXTVAL(:GEN_CTEFISCAL) ID');
        QArq.ParamByName('GEN_CTEFISCAL').AsString :='GEN_CTEFISCAL03_s003';

        QArq.Prepare;
        QArq.Open;

        InputString := InputBox(PChar(Msg_Title), 'Nº Próxima Cte. Fiscal:' , IntToStr(QArq.Fields[0].AsInteger));

        QArq.Sql.Clear;
        QArq.Sql.Add('ALTER SEQUENCE GEN_CTEFISCAL03_S003 RESTART WITH ' + (inputstring));
        QArq.Prepare;
        QArq.ExecSql;


       End;

       if FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger = 4 then
       Begin
        QArq.Sql.Clear;
        QArq.Sql.Add('SELECT NEXTVAL(:GEN_CTEFISCAL) ID');
        QArq.ParamByName('GEN_CTEFISCAL').AsString :='GEN_CTEFISCAL04_s003';

        QArq.Prepare;
        QArq.Open;

        InputString := InputBox(PChar(Msg_Title), 'Nº Próxima Cte. Fiscal:' , IntToStr(QArq.Fields[0].AsInteger));

        QArq.Sql.Clear;
        QArq.Sql.Add('ALTER SEQUENCE GEN_CTEFISCAL04_S003 RESTART WITH ' + (inputstring));
        QArq.Prepare;
        QArq.ExecSql;


       End;

       if FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger = 5 then
       Begin

        QArq.Sql.Clear;
        QArq.Sql.Add('SELECT NEXTVAL(:GEN_CTEFISCAL) ID');
        QArq.ParamByName('GEN_CTEFISCAL').AsString :='GEN_CTEFISCAL05_s003';

        QArq.Prepare;
        QArq.Open;

        InputString := InputBox(PChar(Msg_Title), 'Nº Próxima Cte. Fiscal:' , IntToStr(QArq.Fields[0].AsInteger));

        QArq.Sql.Clear;
        QArq.Sql.Add('ALTER SEQUENCE GEN_CTEFISCAL05_S003 RESTART WITH ' + (inputstring));
        QArq.Prepare;
        QArq.ExecSql;
       End;
      end
      else
          Application.MessageBox('Acesso negado', PChar(Msg_Title), mb_IconStop);
     end;
    end;
  finally
    FrmPasswordDlg.Release;
  end;
end;

procedure TFrmConfig.SpeedButton5Click(Sender: TObject);
var
InputString: String;
begin
  Application.CreateForm(TFrmPasswordDlg, FrmPasswordDlg);
  try
    if FrmPasswordDlg.ShowModal = mrOk then
    begin
      if FrmPasswordDlg.Password.Text = Senha_Suporte then
      begin
       Dt_Carga.Enabled := True;
       end
      else
        Application.MessageBox('Acesso negado', PChar(Msg_Title), mb_IconStop);
    end;
  finally
  FrmPasswordDlg.Release;
  end;
end;


procedure TFrmConfig.SpeedButton6Click(Sender: TObject);
var
InputString: String;
begin
  Application.CreateForm(TFrmPasswordDlg, FrmPasswordDlg);
  try
    if FrmPasswordDlg.ShowModal = mrOk then
    begin
      if FrmPasswordDlg.Password.Text = Senha_Suporte then
      begin
       if FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger = 1 then
       Begin
        QArq.Sql.Clear;
        QArq.Sql.Add('SELECT NEXTVAL(:GEN_MDEFISCAL) ID');
        QArq.ParamByName('GEN_MDEFISCAL').AsString :='GEN_MDEFISCAL';

        QArq.Prepare;
        QArq.Open;

        InputString := InputBox(PChar(Msg_Title), 'Nº Últ. MDF-e:' , QArq.Fields[0].AsString);

        QArq.Sql.Clear;
        QArq.Sql.Add('ALTER SEQUENCE GEN_MDEFISCAL RESTART WITH ' + InputString);

        QArq.Prepare;
        QArq.ExecSql;

       End;

       if FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger = 2 then
       Begin
        QArq.Sql.Clear;
        QArq.Sql.Add('SELECT NEXTVAL(:GEN_MDEFISCAL) ID');
        QArq.ParamByName('GEN_MDEFISCAL').AsString :='GEN_MDEFISCAL02';

        QArq.Prepare;
        QArq.Open;

        InputString := InputBox(PChar(Msg_Title), 'Nº Últ. MDF-e:' , QArq.Fields[0].AsString);

        QArq.Sql.Clear;
        QArq.Sql.Add('ALTER SEQUENCE GEN_MDEFISCAL02 RESTART WITH ' + InputString);

        QArq.Prepare;
        QArq.ExecSql;
       End;

       if FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger = 3 then
       Begin
        QArq.Sql.Clear;
        QArq.Sql.Add('SELECT NEXTVAL(:GEN_MDEFISCAL) ID');
        QArq.ParamByName('GEN_MDEFISCAL').AsString :='GEN_MDEFISCAL03';

        QArq.Prepare;
        QArq.Open;

        InputString := InputBox(PChar(Msg_Title), 'Nº Últ. MDF-e:' , QArq.Fields[0].AsString);

        QArq.Sql.Clear;
        QArq.Sql.Add('ALTER SEQUENCE GEN_MDEFISCAL03 RESTART WITH ' + InputString);

        QArq.Prepare;
        QArq.ExecSql;
       End;

       if FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger = 4 then
       Begin
        QArq.Sql.Clear;
        QArq.Sql.Add('SELECT NEXTVAL(:GEN_MDEFISCAL) ID');
        QArq.ParamByName('GEN_MDEFISCAL').AsString :='GEN_MDEFISCAL04';

        QArq.Prepare;
        QArq.Open;

        InputString := InputBox(PChar(Msg_Title), 'Nº Últ. MDF-e:' , QArq.Fields[0].AsString);

        QArq.Sql.Clear;
        QArq.Sql.Add('ALTER SEQUENCE GEN_MDEFISCAL04 RESTART WITH ' + InputString);

        QArq.Prepare;
        QArq.ExecSql;
       End;

       if FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger = 5 then
       Begin
        QArq.Sql.Clear;
        QArq.Sql.Add('SELECT NEXTVAL(:GEN_MDEFISCAL) ID');
        QArq.ParamByName('GEN_MDEFISCAL').AsString :='GEN_MDEFISCAL05';

        QArq.Prepare;
        QArq.Open;

        InputString := InputBox(PChar(Msg_Title), 'Nº Últ. MDF-e:' , QArq.Fields[0].AsString);

        QArq.Sql.Clear;
        QArq.Sql.Add('ALTER SEQUENCE GEN_MDEFISCAL05 RESTART WITH ' + InputString);

        QArq.Prepare;
        QArq.ExecSql;
       End;

      end
      else
        Application.MessageBox('Acesso negado', PChar(Msg_Title), mb_IconStop);
    end;
  finally
    FrmPasswordDlg.Release;
  end;

end;

procedure TFrmConfig.btnconta_descontoClick(Sender: TObject);
begin
  try
    Cta_Desc.Value := GetConsulta('PLANO', 0, 0, StrToInt(Cta_Juros.Text));
  except
    Cta_Desc.Value := GetConsulta('PLANO', 0, 0, 0);
  end;

end;

procedure TFrmConfig.btnVendedor_idClick(Sender: TObject);
begin
  try
    Vendedor_id.Value := GetConsulta('PESSOAL', 0, 0, StrToInt(Localizacao.Text));
  except
    Vendedor_id.Value := GetConsulta('PESSOAL', 0, 0, 0);
  end;

end;

procedure TFrmConfig.Btn_cod_Ativ_econClick(Sender: TObject);
begin
  try
    COD_ATV_ECON.Text := GetConsulta_CONTRIBUICAO('10', (COD_ATV_ECON.Text));
  except
    COD_ATV_ECON.Text := GetConsulta_CONTRIBUICAO('10', '0');
  end;
end;

procedure TFrmConfig.Button1Click(Sender: TObject);
begin
VerificaPagamento;
end;

procedure TFrmConfig.BtnContaEstoqueEntClick(Sender: TObject);
begin
  try
    Conta_Estoque_Ent.Value := GetConsulta('PLANO', 0, 0, StrToInt(Conta_Estoque.Text));
  except
    Conta_Estoque_Ent.Value := GetConsulta('PLANO', 0, 0, 0);
  end;
end;

procedure TFrmConfig.TabSheet5Show(Sender: TObject);
begin
 Carrega_Dados := True;
  if LeIni(Arq_Ini, 'Sistema', 'Carga de Produtos p/ Cód. ECF') = 'True' then
    Tipo_Carga.Checked := True
  else
    Tipo_Carga.Checked := False;
    Carrega_Dados := False;
end;

procedure TFrmConfig.Tipo_CargaClick(Sender: TObject);
begin
 if (not Carrega_dados) and (Tipo_carga.Checked = False) then
 Begin
  Application.CreateForm(TFrmPasswordDlg, FrmPasswordDlg);
  try
    if FrmPasswordDlg.ShowModal = mrOk then
    begin
      if FrmPasswordDlg.Password.Text = Senha_Suporte then
      begin

      end
      else
      Begin
        Tipo_carga.Checked := True;
        Application.MessageBox('Acesso negado', PChar(Msg_Title), mb_IconStop);
      End;
    end
    Else
    Tipo_carga.Checked := True;
  finally
  FrmPasswordDlg.Release;
  end;
 End;

end;

procedure TFrmConfig.Tipo_OrcamentoChange(Sender: TObject);
begin
if Tipo_Orcamento.Text = '2' then
  Begin
  Saldo_Orcamento.Visible   := True;
  estoque_orcamento.Visible := True;
  End
  Else if Tipo_Orcamento.Text = '1'  then
  Desconto_Percentual.Visible := True
  Else
  Begin
  Saldo_Orcamento.Visible     := False;
  estoque_orcamento.Visible   := False;
  Desconto_Percentual.Visible := False
  End;
end;

procedure TFrmConfig.ts1Show(Sender: TObject);
begin

  Carrega_dados := False;

end;

procedure TFrmConfig.Ativar_SkinClick(Sender: TObject);
begin
{if Ativar_Skin.Checked then
  Begin
    FrmPrincipal.sSkinManager1.Active := True;
    GravaIni(Arq_Ini, 'Skin', 'Ativo', 'True');
  End
  Else
  Begin
    FrmPrincipal.sSkinManager1.Active := False;
    GravaIni(Arq_Ini, 'Skin', 'Ativo', 'False');
  End;}

end;

procedure TFrmConfig.BalancaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmConfig.btnCaixaClick(Sender: TObject);
begin
  try
    Caixa.Value := GetConsulta('BANCOS', 0, 0, StrToInt(Caixa.Text));
  except
    Caixa.Value := GetConsulta('BANCOS', 0, 0, 0);
  end;
end;

procedure TFrmConfig.btnConta_Consumo_EstoqueClick(Sender: TObject);
begin
  try
    Conta_Consumo.Value := GetConsulta('PLANO', 0, 0, StrToInt(Conta_Consumo.Text));
  except
    Conta_Consumo.Value := GetConsulta('PLANO', 0, 0, 0);
  end;
end;

procedure TFrmConfig.btnConta_EstoqueClick(Sender: TObject);
begin
  try
    FLUXO_CAIXA_ID.Value := GetConsulta('FLUXO_CAIXA', 0, 0, StrToInt(FLUXO_CAIXA_ID.Text));
  except
    FLUXO_CAIXA_ID.Value := GetConsulta('FLUXO_CAIXA', 0, 0, 0);
  end;
end;

procedure TFrmConfig.btnConta_Juros_RecebidosClick(Sender: TObject);
begin
  try
    Cta_Juros.Value := GetConsulta('PLANO', 0, 0, StrToInt(Cta_Juros.Text));
  except
    Cta_Juros.Value := GetConsulta('PLANO', 0, 0, 0);
  end;
end;

procedure TFrmConfig.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmConfig.btnExecutaClick(Sender: TObject);
var
Temp: TComponent;
I:Integer;
begin
  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    if Validacao then
    begin
      try
          {
          if (Chk_Controle_estq_loc.Checked)   Then
          Begin
            if Localizacao_Descricao.Text <> '' Then
            Begin
             QSearch.Sql.Clear;
             QSearch.Sql.Text := 'SELECT * FROM LOCALIZACAO_ESTOQUE_PRODUTOS';
             QSearch.Prepare;
             QSearch.Open;

             if QSearch.isEmpty Then
             Begin
              try

               IQuery.Sql.Clear;
               IQuery.Sql.Text := 'SELECT TABELA_ID FROM TABELAS WHERE TIPO_TABELA = :TIPO_TABELA AND DESCRICAO = :DESCRICAO ORDER BY DESCRICAO';
               IQuery.ParamByName('TIPO_TABELA').AsString := 'L' ;
               IQuery.ParamByName('DESCRICAO').AsString   := Localizacao_Descricao.Text ;
               IQuery.Prepare;
               IQuery.Open;


              QUpdate.Sql.Clear;
              QUpdate.Sql.Text := 'INSERT INTO LOCALIZACAO_ESTOQUE_PRODUTOS (PRODUTO_ID,LOCALIZACAO_ID,DESCRICAO,QUANTIDADE,DT_ENTRADA,TRANSACAO_ID)' +
                                  'SELECT PRODUTO_ID, :LOCALIZACAO_ID, :SALDO DESCRICAO, QUANTIDADE_C QUANTIDADE, CURRENT_DATE DT_ENTRADA, 0 TRANSACAO_ID ' +
                                  'FROM PRODUTOS WHERE QUANTIDADE_C <> 0 AND STATUS = :STATUS';
              QUpdate.ParamByName('SALDO').AsString  := Localizacao_Descricao.Text;
              QUpdate.ParamByName('STATUS').AsString := 'A';
              QUpdate.ParamByName('LOCALIZACAO_ID').AsInteger := 0;//IQuery.FieldByName('TABELA_ID').AsInteger;

              QUpdate.Prepare;
              QUpdate.ExecSQL;

              Application.MessageBox('Saldo inicial da Localização do estoque lançado nos produtos.','Eficaz', MB_ICONINFORMATION + MB_OK);

              Except

                on e:Exception do
                begin
                  Application.MessageBox(PChar('Erro no lançamento do saldo inicial da localização do estoque:' + #13 +
                    'Erro: ' + e.Message), 'Erro', MB_ICONSTOP + MB_TASKMODAL);

                   Chk_Controle_estq_loc.Checked := False;

                end;

              end;

             End;
            End
            Else
            Begin
             Application.MessageBox('Favor indicar a localização inicial do estoque.','Eficaz', MB_ICONINFORMATION + MB_OK);
             Chk_Controle_estq_loc.Checked := False;
            End;

          End;
          }
        QArq.SQL.Clear;
        QArq.SQL.Add('UPDATE CONFIG SET CONTA_ESTOQUE = :CONTA_ESTOQUE, CONTA_ESTOQUE_ENT = :CONTA_ESTOQUE_ENT, CONTA_CONSUMO = :CONTA_CONSUMO,');
        QArq.SQL.Add('COD_CTA= :COD_CTA, TAM_BARRAS = :TAM_BARRAS, TAM_PESAVEIS = :TAM_PESAVEIS , DESC_MAXIMO = :DESC_MAXIMO, ALIQ_SIMPLES = :ALIQ_SIMPLES,');
        QArq.SQL.Add('DT_ALTERACAO = :DT_ALTERACAO,GERA_DIGITO = :GERA_DIGITO,TEM_BALANCA = :TEM_BALANCA,');
        QArq.SQL.Add('CONTA_JUROS = :CONTA_JUROS, CONTA_DESCONTO = :CONTA_DESCONTO,MOSTRAR_CADASTROS = :MOSTRAR_CADASTROS, BLOQ_DEVEDORES = :BLOQ_DEVEDORES,PLANO_PROPRIO = :PLANO_PROPRIO,');
        QArq.SQL.Add('TURNO = :TURNO, SPED = :SPED, SPED_DESCONTO = :SPED_DESCONTO, CONSULTA_SIMPLES = :CONSULTA_SIMPLES,DEV_PAGTO = :DEV_PAGTO,');
        QArq.SQL.Add('DEV_RECEB = :DEV_RECEB,VDA_PEDV = :VDA_PEDV,CPR_PEDV = :CPR_PEDV, DESC_ORC_USU = :DESC_ORC_USU,CALC_EST_PED_VDA = :CALC_EST_PED_VDA,');
        QArq.SQL.Add('SPED_ICMS_ST_OUTROS = :SPED_ICMS_ST_OUTROS,SPED_ICMS_ST_IPI_MERC = :SPED_ICMS_ST_IPI_MERC,CARENCIA= :CARENCIA, JUROS_MENSAL = :JUROS_MENSAL,ESTOQUE_NEGATIVO = :ESTOQUE_NEGATIVO,CARGA = :CARGA,');
        QArq.SQL.Add('MULTA = :MULTA , DESCONTO_MENSAL = :DESCONTO_MENSAL,OBJETO_ORDEM = :OBJETO_ORDEM, DIAS_PEDIDO = :DIAS_PEDIDO,VERSAO_NFE = :VERSAO_NFE,VERSAO_MDFE = :VERSAO_MDFE,');
        QArq.SQL.Add('COD_INS_TRIB = :COD_INS_TRIB, COD_ATV_ECON = :COD_ATV_ECON, EXIBE_FOTO = :EXIBE_FOTO,SPED_SERVICO= :SPED_SERVICO,CONS_SIMILAR =:CONS_SIMILAR,CARGA_MANUAL_PROD = :CARGA_MANUAL_PROD,');
        QArq.SQL.Add('ATUALIZAR_NCM_NF = :ATUALIZAR_NCM_NF, TIMEOUT_ECFS = :TIMEOUT_ECFS, H_INICIO_S = :H_INICIO_S, H_FIM_S = :H_FIM_S,FUNC_SALAO = :FUNC_SALAO,');
        QArq.SQL.Add('AUDITORIA = :AUDITORIA, DESC_COOPERATIVA = :DESC_COOPERATIVA, DESC_FUNRURAL = :DESC_FUNRURAL,CONSISTIR_PDV = :CONSISTIR_PDV, DT_CONSISTIR = :DT_CONSISTIR, REM_IMP_CODBARRA_XML = :REM_IMP_CODBARRA_XML,DIAS_PERDA = :DIAS_PERDA,');
        QArq.SQL.Add('REM_IMP_CODFAB_XML = :REM_IMP_CODFAB_XML,AUTORIZACAO = :AUTORIZACAO,GERAR_BLOCOK = :GERAR_BLOCOK,DESATIVAR_CUSTOS = :DESATIVAR_CUSTOS, CONTROLE_VALIDADE = :CONTROLE_VALIDADE, CASAS_DECIMAIS_DANFE = :CASAS_DECIMAIS,');
        QArq.SQL.Add('VR_UNITARIO_X_QUANTIDADE = :VR_UNITARIO_X_QUANTIDADE, LOGIN_CONNECTA = :LOGIN_CONNECTA, SENHA_CONNECTA = :SENHA_CONNECTA, ID_CONNECTA = :ID_CONNECTA,DIAS_CONSISTIR = :DIAS_CONSISTIR,TIME_STREAMING = :TIME_STREAMING,');
        QArq.SQL.Add('GERAR_BLOCO1400 = :GERAR_BLOCO1400, CONSISTIR_GERENCIAL = :CONSISTIR_GERENCIAL, DIFERENCA_ICMS = :DIFERENCA_ICMS,TOTALIZADOR_G = :TOTALIZADOR_G, CHAT = :CHAT,EMAIL_NFCE = :EMAIL_NFCE,CONTINGENCIA =:CONTINGENCIA, CADASTRO_XML = :CADASTRO_XML,');
        QArq.SQL.Add('MARGEM_LUCRO = :MARGEM_LUCRO, ESTOQUE_FILIAIS = :ESTOQUE_FILIAIS, LOCALIZACAO_DESCRICAO = :LOCALIZACAO_DESCRICAO, LOCALIZACAO_ID = :LOCALIZACAO_ID, LOCALIZACAO_DESCRICAO_PDV = :LOCALIZACAO_DESCRICAO_PDV, LOCALIZACAO_ID_PDV = :LOCALIZACAO_ID_PDV,');
        QArq.SQL.Add('REPETIR_ITENS_ORC = :REPETIR_ITENS_ORC, FILTRO_PLANO = :FILTRO_PLANO, ATUALIZAR_NCM_NFCE = :ATUALIZAR_NCM_NFCE, DESC_OPERACOES_CONTRIBUICOES = :DESC_OPERACOES_CONTRIBUICOES, POSICAO_FIM_MES = :POSICAO_FIM_MES,VR_PONTOS = :VR_PONTOS,');
        QArq.SQL.Add('FLUXO_CAIXA_ID = :FLUXO_CAIXA_ID, CONSISTIR_ABERTURA = :CONSISTIR_ABERTURA, IMPRESSAO_NORMAL_ORCAMENTO = :IMPRESSAO_NORMAL_ORCAMENTO,BLOQ_DESC_ORCAMENTO = :BLOQ_DESC_ORCAMENTO, IMPORTAR_BOLETOS_XML = :IMPORTAR_BOLETOS_XML ,');
        QArq.SQL.Add('DESCONTOS_PRODUTOS = :DESCONTOS_PRODUTOS,BANCO_NUVEM = :BANCO_NUVEM,IP_NUVEM = :IP_NUVEM,PORTA_NUVEM = :PORTA_NUVEM,SENHA_NUVEM = :SENHA_NUVEM,USUARIO_NUVEM = :USUARIO_NUVEM, IGNORAR_FRACIONAMENTO = :IGNORAR_FRACIONAMENTO');
        QArq.SQL.Add('WHERE EMPRESA_ID = :EMPRESA_ID');

        QArq.ParamByName('CONTA_ESTOQUE').AsInteger     := StrToInt(Conta_Estoque.Text);
        QArq.ParamByName('CONTA_ESTOQUE_ENT').AsInteger := StrToInt(Conta_Estoque_ent.Text);
        QArq.ParamByName('CONTA_CONSUMO').AsInteger := StrToInt(Conta_Consumo.Text);
        QArq.ParamByName('COD_CTA').AsInteger       := StrToInt(COD_CTA.Text);
        QArq.ParamByName('TAM_BARRAS').AsInteger    := StrToInt(Tam_Barra.Text);
        QArq.ParamByName('TAM_PESAVEIS').AsInteger  := StrToInt(Tam_Pesavel.Text);
        QArq.ParamByName('DESC_MAXIMO').AsFloat     := Desc_Maximo.Value;
        QArq.ParamByName('ALIQ_SIMPLES').AsFloat    := Simples_Nacional.Value;
        QArq.ParamByName('DT_ALTERACAO').AsDateTime := Dt_Alteracao.Date;
        QArq.ParamByName('CONTA_JUROS').AsInteger   := StrToInt(Cta_Juros.Text);
        QArq.ParamByName('CONTA_DESCONTO').AsInteger    := StrToInt(Cta_Desc.Text);
        QArq.ParamByName('DIAS_PERDA').AsInteger        := StrToInt(DIAS_PERDA.Text);
        QArq.ParamByName('CASAS_DECIMAIS').AsInteger    := StrToInt(Casas_Decimais.Text);
        QArq.ParamByName('LOCALIZACAO_DESCRICAO').AsString    := Localizacao_descricao.Text;
        QArq.ParamByName('LOCALIZACAO_ID').AsInteger    := StrToInt(LOCALIZACAO_ID.Text);
        QArq.ParamByName('LOCALIZACAO_DESCRICAO_PDV').AsString    := Localizacao_descricao_PDV.Text;
        QArq.ParamByName('LOCALIZACAO_ID_PDV').AsInteger    := StrToInt(LOCALIZACAO_ID_PDV.Text);
        QArq.ParamByName('FLUXO_CAIXA_ID').AsInteger        := StrToInt(FLUXO_CAIXA_ID.Text);
        QArq.ParamByName('EMPRESA_ID').AsInteger        := FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger;



        if Gera_Digito.Checked then
          QArq.ParamByName('GERA_DIGITO').AsString := 'True'
        else
          QArq.ParamByName('GERA_DIGITO').AsString := 'False';

        if Balanca.Checked then
          QArq.ParamByName('TEM_BALANCA').AsString := 'True'
        else
          QArq.ParamByName('TEM_BALANCA').AsString := 'False';
        {
        if Desativados.Checked then
          QArq.ParamByName('VER_DESATIVADOS').AsString := 'True'
        else
        QArq.ParamByName('VER_DESATIVADOS').AsString := 'False';
        }
        if Iniciar.Checked then
          QArq.ParamByName('MOSTRAR_CADASTROS').AsString := 'True'
        else
          QArq.ParamByName('MOSTRAR_CADASTROS').AsString := 'False';

        if Bloq_Devedores.Checked then
          QArq.ParamByName('BLOQ_DEVEDORES').AsString := 'True'
        else
          QArq.ParamByName('BLOQ_DEVEDORES').AsString := 'False';

        if Plano_Proprio.Checked then
          QArq.ParamByName('PLANO_PROPRIO').AsString := 'True'
        else
          QArq.ParamByName('PLANO_PROPRIO').AsString := 'False';

        if Turno.Checked then
          QArq.ParamByName('TURNO').AsString := 'True'
        else
          QArq.ParamByName('TURNO').AsString := 'False';

        if Sped_Sintegra.Checked then
          QArq.ParamByName('SPED').AsString := 'True'
        else
          QArq.ParamByName('SPED').AsString := 'False';

        if Sped_Contrib_Desconto.Checked then
          QArq.ParamByName('SPED_DESCONTO').AsString := 'True'
        else
          QArq.ParamByName('SPED_DESCONTO').AsString := 'False';

        if Consulta_Simples.Checked then
          QArq.ParamByName('CONSULTA_SIMPLES').AsString := 'True'
        else
          QArq.ParamByName('CONSULTA_SIMPLES').AsString := 'False';

        if Chk_Pgto_Devolucao.Checked then
          QArq.ParamByName('DEV_PAGTO').AsString := 'True'
        else
         QArq.ParamByName('DEV_PAGTO').AsString := 'False';

        if Chk_Pgto_Devolucao_V.Checked then
         QArq.ParamByName('DEV_RECEB').AsString := 'True'
        else
         QArq.ParamByName('DEV_RECEB').AsString := 'False';

        if Chk_Vda_ped.Checked then
          QArq.ParamByName('VDA_PEDV').AsString := 'True'
        else
          QArq.ParamByName('VDA_PEDV').AsString := 'False';

        if Chk_cpr_ped.Checked then
          QArq.ParamByName('CPR_PEDV').AsString := 'True'
        else
          QArq.ParamByName('CPR_PEDV').AsString := 'False';

        if Desc_orc_usu.Checked then
          QArq.ParamByName('DESC_ORC_USU').AsString := 'True'
        else
          QArq.ParamByName('DESC_ORC_USU').AsString := 'False';

        if Calc_est_ped_vda.Checked then
          QArq.ParamByName('CALC_EST_PED_VDA').AsString := 'True'
        else
          QArq.ParamByName('CALC_EST_PED_VDA').AsString := 'False';

        if Exibir_foto_cliente_produto.Checked then
          QArq.ParamByName('EXIBE_FOTO').AsString := 'True'
        else
          QArq.ParamByName('EXIBE_FOTO').AsString := 'False';

        if Servico_Sped.Checked then
          QArq.ParamByName('SPED_SERVICO').AsString := 'True'
        else
          QArq.ParamByName('SPED_SERVICO').AsString := 'False';

        if Chk_Similar.Checked then
          QArq.ParamByName('CONS_SIMILAR').AsString := 'True'
        else
          QArq.ParamByName('CONS_SIMILAR').AsString := 'False';

        if ICMS_ST_SPED.Checked then
          QArq.ParamByName('SPED_ICMS_ST_OUTROS').AsString := 'True'
        else
          QArq.ParamByName('SPED_ICMS_ST_OUTROS').AsString := 'False';

        If ICMS_ST_IPI_MERC.Checked then
          QArq.ParamByName('SPED_ICMS_ST_IPI_MERC').AsString := 'True'
        else
          QArq.ParamByName('SPED_ICMS_ST_IPI_MERC').AsString := 'False';

        if Estoque_Negativo.Checked then
          QArq.ParamByName('ESTOQUE_NEGATIVO').AsString := 'True'
        else
          QArq.ParamByName('ESTOQUE_NEGATIVO').AsString := 'False';

        IF Sync_Produtos_Manual.Checked Then
          QArq.ParamByName('CARGA_MANUAL_PROD').AsString := 'True'
        else
          QArq.ParamByName('CARGA_MANUAL_PROD').AsString := 'False';

        if Chk_Atualizar_Ecfs.Checked then
        QArq.ParamByName('CARGA').AsInteger := 1
        Else
        QArq.ParamByName('CARGA').AsInteger := 0;

        if Chk_AtualizarNcm.Checked then
        QArq.ParamByName('ATUALIZAR_NCM_NF').AsString := 'True'
        Else
        QArq.ParamByName('ATUALIZAR_NCM_NF').AsString := 'False';

         if chk_atualizar_ncm_streaming.Checked then
        QArq.ParamByName('ATUALIZAR_NCM_NFCE').AsString := 'True'
        Else
        QArq.ParamByName('ATUALIZAR_NCM_NFCE').AsString := 'False';


        if Chk_Estoque_Filiais.Checked then
        QArq.ParamByName('ESTOQUE_FILIAIS').AsString := 'True'
        Else
        QArq.ParamByName('ESTOQUE_FILIAIS').AsString := 'False';

        if Chk_AUDITORIA.Checked then
        QArq.ParamByName('AUDITORIA').AsString := 'True'
        Else
        QArq.ParamByName('AUDITORIA').AsString := 'False';

        if chk_consistirpdv.Checked then
        QArq.ParamByName('CONSISTIR_PDV').AsString := 'True'
        Else
        QArq.ParamByName('CONSISTIR_PDV').AsString := 'False';

        if Chk_Remover_Cdbarras_xml.Checked then
        QArq.ParamByName('REM_IMP_CODBARRA_XML').AsString := 'True'
        Else
        QArq.ParamByName('REM_IMP_CODBARRA_XML').AsString := 'False';

        if Chk_Remover_Cdfabri_xml.Checked then
        QArq.ParamByName('REM_IMP_CODFAB_XML').AsString := 'True'
        Else
        QArq.ParamByName('REM_IMP_CODFAB_XML').AsString := 'False';

        if Chk_BlocoK.Checked then
        QArq.ParamByName('GERAR_BLOCOK').AsString := 'True'
        Else
        QArq.ParamByName('GERAR_BLOCOK').AsString := 'False';

        if chk_DesativarCustos.Checked then
        QArq.ParamByName('DESATIVAR_CUSTOS').AsString := 'True'
        Else
        QArq.ParamByName('DESATIVAR_CUSTOS').AsString := 'False';

        if Chk_Controle_Validade.Checked then
        QArq.ParamByName('CONTROLE_VALIDADE').AsString := 'True'
        Else
        QArq.ParamByName('CONTROLE_VALIDADE').AsString := 'False';

        if Chk_unitarioxquantidade.Checked then
        QArq.ParamByName('VR_UNITARIO_X_QUANTIDADE').AsString := 'True'
        Else
        QArq.ParamByName('VR_UNITARIO_X_QUANTIDADE').AsString := 'False';

        if Chk_IgnorarFracionamento.Checked then
        QArq.ParamByName('IGNORAR_FRACIONAMENTO').AsString := 'True'
        Else
        QArq.ParamByName('IGNORAR_FRACIONAMENTO').AsString := 'False';

        if chk_contingencia.Checked then
        QArq.ParamByName('CONTINGENCIA').AsInteger := 1
        Else
        QArq.ParamByName('CONTINGENCIA').AsInteger := 0;

         if Chk_cadastro_xml.Checked then
        QArq.ParamByName('CADASTRO_XML').AsString := 'True'
        Else
        QArq.ParamByName('CADASTRO_XML').AsString := 'False';


        if Chk_bl1400 .Checked then
        QArq.ParamByName('GERAR_BLOCO1400').AsString := 'True'
        Else
        QArq.ParamByName('GERAR_BLOCO1400').AsString := 'False';

        if chk_consisitr.Checked then
        QArq.ParamByName('CONSISTIR_GERENCIAL').AsString := 'True'
        Else
        QArq.ParamByName('CONSISTIR_GERENCIAL').AsString := 'False';

        if CHK_DIF_ICMS.Checked then
        QArq.ParamByName('DIFERENCA_ICMS').AsString := 'True'
        Else
        QArq.ParamByName('DIFERENCA_ICMS').AsString := 'False';

        if Chk_Totalizar_G.Checked then
        QArq.ParamByName('TOTALIZADOR_G').AsString    := 'True'
        Else
        QArq.ParamByName('TOTALIZADOR_G').AsString    := 'False';

        if Chk_Repetir_Itens.Checked then
        QArq.ParamByName('REPETIR_ITENS_ORC').AsString    := 'True'
        Else
        QArq.ParamByName('REPETIR_ITENS_ORC').AsString    := 'False';

        if Chk_filtro_plano.Checked then
        QArq.ParamByName('FILTRO_PLANO').AsString    := 'True'
        Else
        QArq.ParamByName('FILTRO_PLANO').AsString    := 'False';

        if chk_desc_operacao.Checked then
        QArq.ParamByName('DESC_OPERACOES_CONTRIBUICOES').AsString    := 'True'
        Else
        QArq.ParamByName('DESC_OPERACOES_CONTRIBUICOES').AsString    := 'False';

        if Chk_PosicaoFim.Checked then
        QArq.ParamByName('POSICAO_FIM_MES').AsString    := 'True'
        Else
        QArq.ParamByName('POSICAO_FIM_MES').AsString    := 'False';

        if Chk_Consistir.Checked then
        QArq.ParamByName('CONSISTIR_ABERTURA').AsString    := 'True'
        Else
        QArq.ParamByName('CONSISTIR_ABERTURA').AsString    := 'False';

        if Chk_Impressao_normal.Checked then
        QArq.ParamByName('IMPRESSAO_NORMAL_ORCAMENTO').AsString    := 'True'
        Else
        QArq.ParamByName('IMPRESSAO_NORMAL_ORCAMENTO').AsString    := 'False';

        if Chk_Bloq_desc_orcamento.Checked then
        QArq.ParamByName('BLOQ_DESC_ORCAMENTO').AsString    := 'True'
        Else
        QArq.ParamByName('BLOQ_DESC_ORCAMENTO').AsString    := 'False';

        if Chk_Parcelas_Compras.Checked then
        QArq.ParamByName('IMPORTAR_BOLETOS_XML').AsString    := 'True'
        Else
        QArq.ParamByName('IMPORTAR_BOLETOS_XML').AsString    := 'False';

        if Chk_Desconto_Produto.Checked then
        QArq.ParamByName('DESCONTOS_PRODUTOS').AsString    := 'True'
        Else
        QArq.ParamByName('DESCONTOS_PRODUTOS').AsString    := 'False';



        QArq.ParamByName('CARENCIA').AsInteger       := StrToInt(Carencia.Text);
        QArq.ParamByName('JUROS_MENSAL').AsFloat     := Juros_Mensal.Value;
        QArq.ParamByName('MULTA').AsFloat            := Multa.Value;
        QArq.ParamByName('DESCONTO_MENSAL').AsFloat  := Desconto_Mensal.Value;
        QArq.ParamByName('OBJETO_ORDEM').AsString    := Objeto_Ordem.Text;
        QArq.ParamByName('DIAS_PEDIDO').AsInteger    := StrToInt(Dias_Pedido.Text);
        QArq.ParamByName('VERSAO_NFE').AsString      := Versao_Nfe.Text;
        QArq.ParamByName('VERSAO_MDFE').AsString     := Versao_Mdfe.Text;
        //QArq.ParamByName('VERSAO_CTE').AsString      := Versao_CTE.Text;
        QArq.ParamByName('COD_INS_TRIB').AsInteger   := StrToInt(Cod_ins_trib.Text);
        QArq.ParamByName('COD_ATV_ECON').AsString    := (COD_ATV_ECON.Text);
        QArq.ParamByName('TIMEOUT_ECFS').AsInteger   := StrToInt(TIMEOUT_ECFS.Text);
        QArq.ParamByName('H_INICIO_S').AsString      := H_INICIO_S.Text;
        QArq.ParamByName('H_FIM_S').AsString         := H_FIM_S.Text;
        QArq.ParamByName('FUNC_SALAO').AsInteger     := StrToInt(FUNC_SALAO.Text);
        QArq.ParamByName('DESC_FUNRURAL').AsFloat    := desc_funrural.Value;
        QArq.ParamByName('DESC_COOPERATIVA').AsFloat := desc_cooperativa.Value;
        QArq.ParamByName('DT_CONSISTIR').AsDateTime  := DT_CONSISTIR.Date;
        QArq.ParamByName('AUTORIZACAO').AsByteStr    := Autorizacao.Text;
        QArq.ParamByName('LOGIN_CONNECTA').AsString  := AllTrim(Login_Connecta.Text);
        QArq.ParamByName('SENHA_CONNECTA').AsString  := EncryptMsg(AllTrim(Senha_Connecta.Text),65);
        QArq.ParamByName('ID_CONNECTA').AsString     := AllTrim(ID_Connecta.Text);
        QArq.ParamByName('DIAS_CONSISTIR').AsInteger := StrToInt(dias_consistir.Text);
        QArq.ParamByName('TIME_STREAMING').AsInteger := StrToInt(Time_Streaming.Text);
        QArq.ParamByName('CHAT').AsString            := CHAT.Text;
        QArq.ParamByName('EMAIL_NFCE').AsString      := EMAIL_NFCE.Text;
        QArq.ParamByName('MARGEM_LUCRO').AsFloat     := Margem_Lucro.Value;
        QArq.ParamByName('VR_PONTOS').AsFloat        := Vr_Pontos.Value;
        QArq.ParamByName('BANCO_NUVEM').AsString     := AllTrim(BANCO_NUVEM.Text);
        QArq.ParamByName('SENHA_NUVEM').AsString     := AllTrim(SENHA_NUVEM.Text);
        QArq.ParamByName('PORTA_NUVEM').AsString     := AllTrim(PORTA_NUVEM.Text);
        QArq.ParamByName('USUARIO_NUVEM').AsString   := AllTrim(USUARIO_NUVEM.Text);
        QArq.ParamByName('IP_NUVEM').AsString        := AllTrim(IP_NUVEM.Text);



        QArq.Prepare;
        QArq.ExecSQL;

      except
        //Application.MessageBox('Ocorreu um erro ao executar a operação. Os dados serão desfeitos', PChar(Msg_Title), mb_IconInformation);

        on e:Exception do
        begin
          Application.MessageBox(PChar('Erro:' + #13 +
            'Erro: ' + e.Message), 'Erro', MB_ICONSTOP + MB_TASKMODAL);
        end;


      end;

      GravaIni(Arq_Ini, 'Sistema', 'Caixa', Caixa.Text);
      GravaIni(Arq_Ini, 'Sistema', 'Path Orçamento', Log_Orcamento.Text);

      if NFe.Checked then
        GravaIni(ExtractFilePath(ParamStr(0)) + 'NFe.Ini', 'NFe', 'NFe', 'True')
      else
        GravaIni(ExtractFilePath(ParamStr(0)) + 'NFe.Ini', 'NFe', 'NFe', 'False');

      if Excluir_Cx_Rapido.Checked then
        GravaIni(Arq_Ini, 'Sistema', 'Excluir Itens Caixa Rápido', 'True')
      else
        GravaIni(Arq_Ini, 'Sistema', 'Excluir Itens Caixa Rápido', 'False');

     { if Estoque_Negativo.Checked then
        GravaIni(Arq_Ini, 'Sistema', 'Permitir Estoque Negativo', 'True')
      else
        GravaIni(Arq_Ini, 'Sistema', 'Permitir Estoque Negativo', 'False');  }

      if Consiste_Entrada_NF.Checked then
        GravaIni(Arq_Ini, 'Sistema', 'Consistir Digitação NF de Entrada', 'True')
      else
        GravaIni(Arq_Ini, 'Sistema', 'Consistir Digitação NF de Entrada', 'False');

      if Comparar_Precos.Checked then
        GravaIni(Arq_Ini, 'Sistema', 'Comparar Preço Atacado x Preço Varejo', 'True')
      else
        GravaIni(Arq_Ini, 'Sistema', 'Comparar Preço Atacado x Preço Varejo', 'False');

      if Zerar_ICMS_ST_SPED.Checked then
        GravaIni(Arq_Ini, 'Sistema', 'Zerar Base ICMS-ST Sped Pis/Cofins', 'True')
      else
        GravaIni(Arq_Ini, 'Sistema', 'Zerar Base ICMS-ST Sped Pis/Cofins', 'False');

      if Tipo_Carga.Checked then
        GravaIni(Arq_Ini, 'Sistema', 'Carga de Produtos p/ Cód. ECF', 'True')
      else
        GravaIni(Arq_Ini, 'Sistema', 'Carga de Produtos p/ Cód. ECF', 'False');

      if Carga_Automatica.Checked then
        GravaIni(Arq_Ini, 'Sistema', 'Carga Automática de Produtos', 'True')
      else
        GravaIni(Arq_Ini, 'Sistema', 'Carga Automática de Produtos', 'False');

      if Carga_Manual_Produtos.Checked then
        GravaIni(Arq_Ini, 'Sistema', 'Carga Manual de Produtos', 'True')
      else
        GravaIni(Arq_Ini, 'Sistema', 'Carga Manual de Produtos', 'False');

      if Legenda_Minimo.Checked then
        GravaIni(Arq_Ini, 'Sistema', 'Legenda Estoque Mínimo', 'True')
      else
        GravaIni(Arq_Ini, 'Sistema', 'Legenda Estoque Mínimo', 'False');

      if Chk_MeiaPagina.Checked then
        GravaIni(Arq_Ini, 'Sistema', 'Rdprint Meia Página', 'True')
      else
        GravaIni(Arq_Ini, 'Sistema', 'Rdprint Meia Página', 'False');

      if Chk_CustoProdutos.Checked then
        GravaIni(Arq_Ini, 'Sistema', 'Alterar Preço de Custo Produtos', 'True')
      else
        GravaIni(Arq_Ini, 'Sistema', 'Alterar Preço de Custo Produtos', 'False');

      if Chk_Fixar_Barra_Atalhos_Lateral.Checked then
        GravaIni(Arq_Ini, 'Sistema', 'Fixar Barra Atalho Lateral', 'True')
      else
        GravaIni(Arq_Ini, 'Sistema', 'Fixar Barra Atalho Lateral', 'False');

      if Chk_Nao_Exibir_Estoque_Fiscal_No_Gerencial.Checked then
        GravaIni(Arq_Ini, 'Sistema', 'Não Exibir Estoque F no G', 'True')
      else
        GravaIni(Arq_Ini, 'Sistema', 'Não Exibir Estoque F no G', 'False');



      if Carga_Temporaria.Checked then
      Begin
        if (h_inicial.Text = '') or (H_Final.Text = '') then
        Begin
        MessageDlg('Intervalo de horas para Cargas temporárias inválida!',mtinformation,[mbok],0);
        Exit;
        End;
        if intervalo.Value = 0 then
        Begin
        MessageDlg('Intervalo em minutos para Cargas temporárias inválido!',mtinformation,[mbok],0);
        Exit;
        End;
        GravaIni(Arq_Ini, 'TCPPDV', 'Gerar Cargas Temporarias', 'True');
        GravaIni(Arq_Ini,'TCPPDV', 'Hora Carga Inicial',H_inicial.Text);
        GravaIni(Arq_Ini,'TCPPDV', 'Hora Carga Final',H_final.Text);
        GravaIni(Arq_Ini,'TCPPDV', 'Timer Cargas',Intervalo.Text);
      End
      else
      Begin
        GravaIni(Arq_Ini, 'TCPPDV', 'Gerar Cargas Temporarias', 'False');
        GravaIni(Arq_Ini,'TCPPDV', 'Hora Carga Inicial','');
        GravaIni(Arq_Ini,'TCPPDV', 'Hora Carga Final','');
        GravaIni(Arq_Ini,'TCPPDV', 'Timer Cargas','0');
      End;

      if Replicar.Checked then
        GravaIni(Arq_Ini, 'Sistema', 'Replicar Produtos Filiais', 'True')
      else
        GravaIni(Arq_Ini, 'Sistema', 'Replicar Produtos Filiais', 'False');

      if Organizar_Janelas.Checked then
        GravaIni(Arq_Ini, 'Sistema', 'Organizar Janelas Automaticamente', 'True')
      else
        GravaIni(Arq_Ini, 'Sistema', 'Organizar Janelas Automaticamente', 'False');

      if Alterar_Vda_ECF.Checked then
        GravaIni(Arq_Ini, 'Sistema', 'Permitir Alterar Venda de ECF', 'True')
      else
        GravaIni(Arq_Ini, 'Sistema', 'Permitir Alterar Venda de ECF', 'False');

      if Gerar_Parcelas.Checked then
        GravaIni(Arq_Ini, 'Sistema', 'Não Gerar Parcelas Agrupamento', 'True')
      else
        GravaIni(Arq_Ini, 'Sistema', 'Não Gerar Parcelas Agrupamento', 'False');

      if Vendas_Recebimento_Lote.Checked then
        GravaIni(Arq_Ini, 'Sistema', 'Exibir vendas TPCTB', 'True')
      else
        GravaIni(Arq_Ini, 'Sistema', 'Exibir vendas TPCTB', 'False');

       if Val_preco_Promocao.Checked then
        GravaIni(Arq_Ini, 'Sistema', 'Preço Promoção Somente nos ECFs', 'True')
      else
        GravaIni(Arq_Ini, 'Sistema', 'Preço Promoção Somente nos ECFs', 'False');

      if Saldo_Orcamento.Checked then
        GravaIni(Arq_Ini, 'Sistema', 'Limite Saldo Orçamento', 'True')
      else
        GravaIni(Arq_Ini, 'Sistema', 'Limite Saldo Orçamento', 'False');

      if desconto_Percentual.Checked then
        GravaIni(Arq_Ini, 'Sistema', 'Desconto Percentual Orçamento', 'True')
      else
        GravaIni(Arq_Ini, 'Sistema', 'Desconto Percentual Orçamento', 'False');

      if Chk_Detalhe.Checked then
        GravaIni(Arq_Ini, 'Sistema', 'Exibir Detalhe Produto', 'True')
      else
        GravaIni(Arq_Ini, 'Sistema', 'Exibir Detalhe Produto', 'False');

      if Codigo_Ean_Nfe.Checked then
        GravaIni(Arq_Ini, 'Sistema', 'Enviar Código EAN Nfe', 'False')
      else
        GravaIni(Arq_Ini, 'Sistema', 'Enviar Código EAN Nfe', 'True');

      if Chk_ImpAutomatica.Checked then
        GravaIni(Arq_Ini, 'Sistema', 'Importação Automática Eficaz', 'True')
      else
        GravaIni(Arq_Ini, 'Sistema', 'Importação Automática Eficaz', 'False');

      if Chk_senha_con_estoque.Checked then
        GravaIni(Arq_Ini, 'Sistema', 'Não Exigir Senha ao Consistir Estoque', 'True')
      else
        GravaIni(Arq_Ini, 'Sistema', 'Não Exigir Senha ao Consistir Estoque', 'False');

      if chk_cadastro_telefone_cliente.Checked then
        GravaIni(Arq_Ini, 'Sistema', 'Cadastro obrigatório do telefone do Cliente', 'True')
      else
        GravaIni(Arq_Ini, 'Sistema', 'Cadastro obrigatório do telefone do Cliente', 'False');


      if chk_HistoricoRec.Checked then
        GravaIni(Arq_Ini, 'Sistema', 'Histórico Recebimento por Lote', 'True')
      else
        GravaIni(Arq_Ini, 'Sistema', 'Histórico Recebimento por Lote', 'False');

      if estoque_orcamento.Checked then
        GravaIni(Arq_Ini, 'Sistema', 'Controle de Estoque no Orçamento', 'True')
      else
        GravaIni(Arq_Ini, 'Sistema', 'Controle de Estoque no Orçamento', 'False');

      if chk_codigo_orcamento.Checked Then
      GravaIni(Arq_Ini, 'Sistema', 'Impressao Código para Importar Orçamento', 'True')
      Else
      GravaIni(Arq_Ini, 'Sistema', 'Impressao Código para Importar Orçamento', 'False');



      GravaIni(ExtractFilePath(ParamStr(0)) + 'NFe.Ini', 'NFe', 'Ambiente', Ambiente_NFe.Text);
      GravaIni(Arq_Ini, 'Sistema', 'Mod. Orçamento', Tipo_Orcamento.Text);
      GravaIni(Arq_Ini, 'Sistema', 'Imp. Orçamento', Imp_Orcamento.Text);
      GravaIni(Arq_Ini, 'Sistema', 'Imp. Recebimento', Imp_Recebimento.Text);
      GravaIni(Arq_Ini, 'Sistema', 'Linhas', Linhas.Text);
      GravaIni(Arq_Ini, 'Sistema', 'Vias', Vias.Text);
      GravaIni(Arq_Ini, 'Sistema', 'Linha Cabeçalho', Cabecalho.Text);
      GravaIni(Arq_Ini, 'Sistema', 'Marketing', Marketing.Text);
      //GravaIni(Arq_Ini, 'Backup', 'Servidor', IP_Servidor.Text);
      //GravaIni(Arq_Ini, 'Backup', 'Banco Dados', Banco_Dados.Text);
      //GravaIni(Arq_Ini, 'Backup', 'Path Backup', Path_Backup.Text);
      GravaIni(Arq_Ini, 'Sistema', 'Largura Papel', Largura_Papel.Text);
      GravaIni(Arq_Ini, 'Sistema', 'Altura Papel', Altura_Papel.Text);
      GravaIni(Arq_Ini, 'Sistema', 'Localização', Localizacao.Text);
      GravaIni(Arq_Ini, 'Sistema', 'Path Impressora 40 Col.', Caminho_Impressora.Text);
      GravaIni(Arq_Ini, 'Atualização', 'Download', Path_Download.Text);
      GravaIni(Arq_Ini, 'Sistema', 'Modelo Impressora', Modelo_Impressora.Text);
      GravaIni(Arq_Ini, 'Sped', 'Indicador da Apuração', ind_apuracao_sped.Text);
      GravaIni(Arq_Ini, 'Sistema', 'RAW Código Orçamento', raw_orcamento.Text);
      GravaIni(Arq_Ini, 'Sistema', 'RAW Recebimento', raw_recebimento.Text);


      if (Porta_Impressora.Text = 'IP') OR (Porta_Impressora.Text = 'USB')  then
      GravaIni(Arq_Ini, 'Sistema', 'Porta Impressora', IP_IMPRESSORA.Text)
      else
      GravaIni(Arq_Ini, 'Sistema', 'Porta Impressora', Porta_Impressora.Text);

      If Chk_Lembrete.Checked Then
      GravaIni(Arq_Ini, 'Sistema', 'Lembrete', 'True')
      Else
      GravaIni(Arq_Ini, 'Sistema', 'Lembrete', 'False');


      try

         QUpdate.SQL.Clear;
         QUpdate.SQL.Add('UPDATE CONFIG_NFISCAL SET ');
         QUpdate.SQL.Add('AMBIENTE = :AMBIENTE');

         QUpdate.ParamByName('AMBIENTE').AsString    :=  Ambiente_NFe.Text;

         QUpdate.Prepare;
         QUpdate.ExecSQL;


         QUpdate.SQL.Clear;
         QUpdate.SQL.Add('UPDATE CONFIG SET');
         QUpdate.SQL.Add('WEB_EMAIL =:EMAIL, WEB_HTTP_USER =:USER_AUTH');


         QUpdate.ParamByName('EMAIL').AsString       :=  email.Text;
         QUpdate.ParamByName('USER_AUTH').AsString   :=  EncryptMsg(user_auth.Text, 65);

         QUpdate.Prepare;
         QUpdate.ExecSQL;


          if AllTrim(user_auth.Text) <> '' then
          begin
             atualizar_EficazWeb( FrmPrincipal.QEmpresa.FieldByName('CNPJ').AsString, user_auth.Text);
          end;


      except on E: Exception do
         begin
            //
         end;
      end;


      if AllTrim(user_auth.Text) <> '' then
      begin
         atualizar_EficazWeb( FrmPrincipal.QEmpresa.FieldByName('CNPJ').AsString, user_auth.Text);
      end;


      GravaIni(Arq_Ini, 'Sistema', 'Path Impressora', Caminho_Zebra.Text);
      GravaIni(Arq_Ini, 'Sistema', 'Vendedor Padrão', Vendedor_id.Text);
      GravaIni(Arq_Ini, 'Sistema', 'Tipo Recibo', tipo_recibo.Text);

      GravaIni(Arq_Ini, 'Sistema', 'Mensagem Orçamento', '');
      GravaIni(Arq_Ini, 'Sistema', 'Mensagem Orçamento 1', '');
      GravaIni(Arq_Ini, 'Sistema', 'Mensagem Orçamento 2', '');
      GravaIni(Arq_Ini, 'Sistema', 'Mensagem Orçamento 3', '');

      GravaIni(Arq_Ini, 'Sistema', 'Mensagem Ordem Serviço', '');
      GravaIni(Arq_Ini, 'Sistema', 'Mensagem Ordem Serviço 1', '');
      GravaIni(Arq_Ini, 'Sistema', 'Mensagem Ordem Serviço 2', '');
      GravaIni(Arq_Ini, 'Sistema', 'Mensagem Ordem Serviço 3', '');

      if Mensagem_Orc.Lines[0] <> '' Then
      GravaIni(Arq_Ini, 'Sistema', 'Mensagem Orçamento', Mensagem_Orc.Lines[0]);
      if Mensagem_Orc.Lines[1] <> '' Then
      GravaIni(Arq_Ini, 'Sistema', 'Mensagem Orçamento 1', Mensagem_Orc.Lines[1]);
      if Mensagem_Orc.Lines[2] <> '' Then
      GravaIni(Arq_Ini, 'Sistema', 'Mensagem Orçamento 2', Mensagem_Orc.Lines[2]);
      if Mensagem_Orc.Lines[3] <> '' Then
      GravaIni(Arq_Ini, 'Sistema', 'Mensagem Orçamento 3', Mensagem_Orc.Lines[3]);

      if Mensagem_Ordem.Lines[0] <> '' Then
      GravaIni(Arq_Ini, 'Sistema', 'Mensagem Ordem Serviço', Mensagem_Ordem.Lines[0]);
      if Mensagem_Ordem.Lines[1] <> '' Then
      GravaIni(Arq_Ini, 'Sistema', 'Mensagem Ordem Serviço 1', Mensagem_Ordem.Lines[1]);
      if Mensagem_Ordem.Lines[2] <> '' Then
      GravaIni(Arq_Ini, 'Sistema', 'Mensagem Ordem Serviço 2', Mensagem_Ordem.Lines[2]);
      if Mensagem_Ordem.Lines[3] <> '' Then
      GravaIni(Arq_Ini, 'Sistema', 'Mensagem Ordem Serviço 3', Mensagem_Ordem.Lines[3]);

      GravaIni(Arq_Ini, 'Sistema', 'Valor Retenção Pis/Cofins', Vr_Pis_Cofins_retido.Text);

      for I := 0 to StrToInt(Caixa_id.text) - 1 do
      Begin
      Id := Id + 1;
      if Leini(Arq_ini,'Caixas','Caixa ' + Strzero(IntToStr(id),2,0)) = '' then
      GravaIni(Arq_Ini, 'Caixas', 'Caixa ' + Strzero(IntToStr(id),2,0),'');
      End;
      GravaIni(Arq_Ini, 'Caixas', 'Total '  ,Strzero(IntToStr(id),2,0));
      Id := 0;

      for I := 0 to (TabSheet5.ComponentCount - 1) do
      begin
      Temp := TabSheet5.Components[I];

        if Temp is TCheckBox then
        begin
          if TCheckBox(Temp).Checked = True then
          GravaIni(Arq_Ini, 'Caixas', 'Caixa ' + Copy(TCheckBox(Temp).Name,6,2) ,Copy(TCheckBox(Temp).Name,6,2))
          else
          GravaIni(Arq_Ini, 'Caixas', 'Caixa ' + Copy(TCheckBox(Temp).Name,6,2) ,'')
        end;

      end;

      if Dt_Carga.Enabled  then
      begin
       QArq.SQL.Clear;
       QArq.Sql.Add('ALTER TABLE PRODUTOS DISABLE TRIGGER PRODUTOS_UP');
       QArq.Prepare;
       QArq.ExecSQL;



       QArq.SQL.Clear;
       QArq.SQL.Add('UPDATE PRODUTOS SET DT_ATUALIZACAO = :DT_ATUALIZACAO');
       QArq.ParamByName('DT_ATUALIZACAO').AsDateTime := Dt_Carga.Date;
       QArq.Prepare;
       QArq.ExecSQL;



       QArq.SQL.Clear;
       QArq.Sql.Add('ALTER TABLE PRODUTOS ENABLE TRIGGER PRODUTOS_UP');
       QArq.Prepare;
       QArq.ExecSQL;



      end;

      if Chk_ZerarCarga.Checked then
      begin

       QArq.SQL.Clear;
       QArq.Sql.Add('ALTER TABLE PRODUTOS DISABLE TRIGGER PRODUTOS_UP');
       QArq.Prepare;
       QArq.ExecSQL;



       QArq.SQL.Clear;
       QArq.SQL.Add('UPDATE PRODUTOS SET CARGA = 0');
       QArq.Prepare;
       QArq.ExecSQL;



       QArq.SQL.Clear;
       QArq.Sql.Add('ALTER TABLE PRODUTOS DISABLE TRIGGER PRODUTOS_UP');
       QArq.Prepare;
       QArq.ExecSQL;



      end;

      FrmPrincipal.config.Close;
      FrmPrincipal.config.Open;

      Close;
    end;
  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;

    FrmPrincipal.Config.close;
    FrmPrincipal.Config.open;

  end;

end;

procedure TFrmConfig.btnLocalizacaoClick(Sender: TObject);
begin
  try
    Localizacao.Value := GetConsulta('LOCAIS', 0, 0, StrToInt(Localizacao.Text));
  except
    Localizacao.Value := GetConsulta('LOCAIS', 0, 0, 0);
  end;
end;

procedure TFrmConfig.Conta_EstoqueKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = Conta_Estoque) then
    btnConta_EstoqueClick(Self);

  if (Key = Vk_F7) and (Sender = Conta_Consumo) then
    btnConta_Consumo_EstoqueClick(Self);

  if (Key = Vk_F7) and (Sender = Caixa) then
    btnCaixaClick(Self);

  if (Key = Vk_F7) and (Sender = Cta_Juros) then
    btnConta_Juros_RecebidosClick(Self);

  if (Key = Vk_F7) and (Sender = Cta_Desc) then
    btnConta_DescontoClick(Self);

  if (Key = Vk_F7) and (Sender = Localizacao) then
    btnLocalizacaoClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmConfig.Caixa_idExit(Sender: TObject);
var
I,  L, X,T,Y,G: Integer;
CheckBox : TCheckBox;
Temp: TComponent;
begin
      for Y := 1 to 40 do
      begin
        GravaIni(Arq_Ini, 'Caixas', 'Caixa ' + StrZero(IntToStr(Y), 2, 0) ,'')
      end;

      G := 0;

      for I := 0 to (TabSheet5.ComponentCount - 1) do
      begin
       Temp := TabSheet5.Components[I];

        if Temp is TCheckBox then
        Inc(G);
      end;

       L:= 14;
       I := 1;
       T:= 192;

      // ShowMessage(IntToStr(G));

        for X := G + 1 to StrToInt(LeIni(Arq_Ini, 'Caixas', 'Total')) do
        begin
           if L > 500 then
           Begin
           L := 14;
           T := T + 23;
           End;

           CheckBox := TCheckBox.Create(TabSheet5);
           with CheckBox do
           begin
              Visible  := True;
              Left     := L;
              Top      := T;
              Width    := 86;
              Height   := 19;
              Caption  := 'Caixa'+ StrZero(IntToStr(X), 2, 0);
              TabOrder := I;
              Name     := 'Caixa'+ StrZero(IntToStr(X), 2, 0);
              Parent   := TabSheet5;
           end;

           TabSheet5.Refresh;

           L := L + 80;
           I := I + 1;
        end;


end;

procedure TFrmConfig.Carga_AutomaticaClick(Sender: TObject);
begin
if Carga_Automatica.Checked = True then
 Carga_Manual_Produtos.Enabled := True
 Else
 Carga_Manual_Produtos.Enabled := False;
end;

procedure TFrmConfig.Casas_DecimaisKeyPress(Sender: TObject; var Key: Char);
begin
If not( key in['0'..'4',#08] ) then
  key:=#0;
end;

procedure TFrmConfig.chk_consistirpdvClick(Sender: TObject);
begin
if chk_consistirpdv.Checked then
dias_consistir.Enabled := True
else
dias_consistir.Enabled := False;
end;

procedure TFrmConfig.chk_estoque_filiaisClick(Sender: TObject);
begin
  {
  if Chk_Controle_Estq_Loc.Checked Then
  Begin
   QSearch.Sql.Clear;
   QSearch.Sql.Text := 'SELECT DESCRICAO FROM TABELAS WHERE TIPO_TABELA = :TIPO_TABELA ORDER BY DESCRICAO';
   QSearch.ParamByName('TIPO_TABELA').AsString := 'L' ;
   QSearch.Prepare;
   QSearch.Open;
   QSearch.First;
   Localizacao_Descricao.Items.Clear;
   Localizacao_Descricao_PDV.Items.Clear;

   While not QSearch.eof do
   Begin
   Localizacao_Descricao.Items.Add(QSearch.FieldByName('DESCRICAO').AsString);
   Localizacao_Descricao_PDV.Items.Add(QSearch.FieldByName('DESCRICAO').AsString);

   QSearch.Next;
   End;
  Localizacao_Descricao.Visible    := True;
  Localizacao_Descricao_PDV.Visible := True;
  End
  Else
  Begin
  Localizacao_Descricao.Visible    := False;
  Localizacao_Descricao_pdv.Visible := False;
  end;
  }

end;


procedure TFrmConfig.Cod_ins_tribExit(Sender: TObject);
begin
if Cod_ins_trib.Value = 1 then
Perform(Wm_NextDlgctl, 0, 0)
else if Cod_ins_trib.Value = 2 then
Perform(Wm_NextDlgctl, 0, 0)
else
begin
MessageDlg('Valores Inválidos!' + #13 + 'Digite:  1 – Contribuição Previdenciária apurada no período,exclusivamente com base na Receita Bruta. ' + #13 +
'2 – Contribuição Previdenciária apurada no período, com base na Receita Bruta e com base nas Remunerações pagas, na forma ' + #13 +
'dos nos incisos I e III do art. 22 da Lei no 8.212, de 1991. ',mtinformation,[mbok],0);

Cod_ins_trib.SetFocus;

end;


end;

procedure TFrmConfig.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
