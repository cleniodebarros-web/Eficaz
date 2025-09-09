unit UPagamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, rxCurrEdit, Buttons, StdCtrls, Mask, rxToolEdit, DB, IBCustomDataSet,
  IBQuery, ExtCtrls, DBCtrls, IBUpdateSQL, IBStoredProc, QRCtrls, QuickRpt, Math,
  ShellApi, RDprint;

type
  TFrmPagamento = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Vendedor: TCurrencyEdit;
    btnVendedor: TSpeedButton;
    Cliente: TCurrencyEdit;
    btnCliente: TSpeedButton;
    Finalizadora: TCurrencyEdit;
    btnFinalizadora: TSpeedButton;
    Acrescimo: TRxCalcEdit;
    Desconto: TRxCalcEdit;
    Dinheiro: TRxCalcEdit;
    Bevel1: TBevel;
    DataCliente: TDataSource;
    QCliente: TIBQuery;
    QVendedor: TIBQuery;
    DataVendedor: TDataSource;
    DBText2: TDBText;
    DBText6: TDBText;
    QFormas: TIBQuery;
    DataFormas: TDataSource;
    DBText1: TDBText;
    QLimite: TIBQuery;
    ID_Transacao: TIBStoredProc;
    QTransacao: TIBQuery;
    QTransitens: TIBQuery;
    QLogs: TIBQuery;
    QParcelas: TIBQuery;
    Cupom: TQuickRep;
    QRBand1: TQRBand;
    QRSysData1: TQRSysData;
    Cabec: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    QRDBText3: TQRDBText;
    QRLabel15: TQRLabel;
    QRShape3: TQRShape;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRExpr2: TQRExpr;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText14: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText16: TQRDBText;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape4: TQRShape;
    QRLabel14: TQRLabel;
    QRShape6: TQRShape;
    QRLabel20: TQRLabel;
    Vr_Acrescimo: TQRLabel;
    Vr_Desconto: TQRLabel;
    Vr_Compra: TQRLabel;
    Label3: TLabel;
    Serie: TEdit;
    Modelo: TEdit;
    CFOP: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    QCFOP: TIBQuery;
    btnExecuta: TBitBtn;
    btnRetorna: TBitBtn;
    Nome_Cliente: TEdit;
    Label10: TLabel;
    Endereco_Cliente: TEdit;
    Label11: TLabel;
    Bairro_Cliente: TEdit;
    Label12: TLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRel: TIBQuery;
    QRLabel24: TQRLabel;
    QRDBText8: TQRDBText;
    Label13: TLabel;
    Label14: TLabel;
    Destacar_ICMS_ST: TCheckBox;
    Label15: TLabel;
    Entrada: TRxCalcEdit;
    Label16: TLabel;
    Desc_Por: TRxCalcEdit;
    Label17: TLabel;
    Acr_Por: TRxCalcEdit;
    RDprint1: TRDprint;
    procedure btnVendedorClick(Sender: TObject);
    procedure btnClienteClick(Sender: TObject);
    procedure FinalizadoraKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnFinalizadoraClick(Sender: TObject);
    procedure VendedorExit(Sender: TObject);
    procedure ClienteExit(Sender: TObject);
    procedure FinalizadoraExit(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure CFOPKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure DinheiroExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DetailSearch(Tabela: String);
    function Validacao: Boolean;
  end;

var
  FrmPagamento: TFrmPagamento;
  Vr_Venda: Real;
  Ope_Caixa, Pr_Venda: String;
  Id_Orc: Integer;

  procedure Pagamento(Vl_Cupom: Real; Operador, Num_Comanda, CFOP: String; Num_Orc: Integer);

  function IniciaPorta(Porta: String): Integer; stdcall; far; external 'Mp2032.dll';
  function FechaPorta: Integer;  stdcall; far; external 'Mp2032.dll';
  function BematechTX(BufTrans: String): Integer; stdcall; far; external 'Mp2032.dll';
  function FormataTX(BufTras: String; TpoLtra:integer; Italic: Integer; Sublin: Integer; expand: Integer; enfat: Integer): Integer; stdcall; far; external 'Mp2032.dll';
  function ComandoTX (BufTrans: String; TamBufTrans: Integer): Integer; stdcall; far; external 'Mp2032.dll';
  function Status_Porta: Integer; stdcall; far; external 'Mp2032.dll';
  function AutenticaDoc(BufTras: String; Tempo: Integer): Integer; stdcall; far; external 'Mp2032.dll';
  function Le_Status: Integer; stdcall; far; external 'Mp2032.dll';
  function Le_Status_Gaveta: Integer; stdcall; far; external 'Mp2032.dll';
  function DocumentInserted: Integer; stdcall; far; external 'Mp2032.dll';
  function ConfiguraTamanhoExtrato(NumeroLinhas: Integer): Integer; stdcall; far; external 'Mp2032.dll';
  function HabilitaExtratoLongo(Flag: Integer): Integer; stdcall; far; external 'Mp2032.dll';
  function HabilitaEsperaImpressao(Flag: Integer): Integer; stdcall; far; external 'Mp2032.dll';
  function EsperaImpressao: Integer; stdcall; far; external 'Mp2032.dll';
  function ConfiguraModeloImpressora(ModeloImpressora: Integer): Integer; stdcall; far; external 'Mp2032.dll';
  function AcionaGuilhotina(Modo: Integer): Integer; stdcall; far; external 'Mp2032.dll';
  function HabilitaPresenterRetratil(Flag: Integer): Integer; stdcall; far; external 'Mp2032.dll';
  function ProgramaPresenterRetratil(Tempo: Integer): Integer; stdcall; far; external 'Mp2032.dll';
  function CaracterGrafico(Buffer: String; TamBuffer: Integer): Integer; stdcall; far; external 'Mp2032.dll';
  function VerificaPapelPresenter(): Integer; stdcall; far; external 'Mp2032.dll';

  // Funções para Impressão dos Códigos de Barras

  function ImprimeCodigoBarrasUPCA(Codigo: String): Integer; stdcall; far; external 'Mp2032.dll';
  function ImprimeCodigoBarrasUPCE(Codigo: String): Integer; stdcall; far; external 'Mp2032.dll';
  function ImprimeCodigoBarrasEAN13(Codigo: String): Integer; stdcall; far; external 'Mp2032.dll';
  function ImprimeCodigoBarrasEAN8(Codigo: String): Integer; stdcall; far; external 'Mp2032.dll';
  function ImprimeCodigoBarrasCODE39(Codigo: String): Integer; stdcall; far; external 'Mp2032.dll';
  function ImprimeCodigoBarrasCODE93(Codigo: String): Integer; stdcall; far; external 'Mp2032.dll';
  function ImprimeCodigoBarrasCODE128(Codigo: String): Integer; stdcall; far; external 'Mp2032.dll';
  function ImprimeCodigoBarrasITF(Codigo: String): Integer; stdcall; far; external 'Mp2032.dll';
  function ImprimeCodigoBarrasCODABAR(Codigo: String): Integer; stdcall; far; external 'Mp2032.dll';
  function ImprimeCodigoBarrasISBN(Codigo: String): Integer; stdcall; far; external 'Mp2032.dll';
  function ImprimeCodigoBarrasMSI(Codigo: String): Integer; stdcall; far; external 'Mp2032.dll';
  function ImprimeCodigoBarrasPLESSEY(Codigo: String): Integer; stdcall; far; external 'Mp2032.dll';
  function ImprimeCodigoBarrasPDF417(NivelCorrecaoErros , Altura , Largura , Colunas: Integer; Codigo: String): Integer; stdcall; far; external 'Mp2032.dll';
  function ConfiguraCodigoBarras(Altura, Largura, PosicaoCaracteres, Fonte, Margem: Integer): Integer; stdcall; far; external 'Mp2032.dll';

  // Função para Bitmaps

  function ImprimeBmpEspecial(Nome: String; xScale: integer; yScale: Integer; Angle: Integer): Integer; stdcall; far; external 'Mp2032.dll';
  function ImprimeBitmap(Nome: String; Mode: Integer): Integer; stdcall; far; external 'Mp2032.dll';
  function AjustaLarguraPapel(PaperWidth:  Integer): Integer; stdcall; far; external 'Mp2032.dll';
  function SelectDithering (DitherType:  Integer): Integer; stdcall; far; external 'Mp2032.dll';
  function ImprimePrn (Nome: String; Sleep:  Integer): Integer; stdcall; far; external 'Mp2032.dll';

implementation

uses
  UPrincipal, UData, UConsulta, UCaixa_Rapido, UParcelas, UEmite_Nota, UNFe,
  UConsulta_CFOP;

{$R *.dfm}

procedure Pagamento(Vl_Cupom: Real; Operador, Num_Comanda, CFOP: String; Num_Orc: Integer);
begin
  Vr_Venda  := Vl_Cupom;
  Ope_Caixa := Operador;
  Pr_Venda  := Num_Comanda;
  Id_Orc    := Num_Orc;

  Application.CreateForm(TFrmPagamento, FrmPagamento);
  try
    FrmPagamento.CFOP.Text := CFOP;

    FrmPagamento.ShowModal;
  finally
    FrmPagamento.Release;
  end;
end;

function TFrmPagamento.Validacao: Boolean;
begin
  Result := False;

  Cliente.Color      := clWindow;
  Vendedor.Color     := clWindow;
  Finalizadora.Color := clWindow;
  Dinheiro.Color     := clWindow;
  Desconto.Color     := clWindow;
  Entrada.Color      := clWindow;

  if QFormas.IsEmpty then
  begin
    Application.MessageBox('Finalizadora inexistente', PChar(Msg_Title), mb_IconSTop);

    Finalizadora.Color := clYellow;
    Finalizadora.SetFocus;

    exit;
  end;

  if QFormas.FieldByName('TIPO_TRANSACAO').AsString = '2' then
  begin
    if QCliente.IsEmpty then
    begin
      Application.MessageBox('Cliente inexistente', PChar(Msg_Title), mb_IconSTop);

      Cliente.Color := clYellow;
      Cliente.SetFocus;

      exit;
    end
    else
    begin
      if QCliente.FieldByName('BLOQUEADO').AsString = 'SIM' then
      begin
        Application.MessageBox('Cliente bloqueado', PChar(Msg_Title), mb_IconSTop);

        Cliente.Color := clYellow;
        Cliente.SetFocus;

        exit;
      end;

      if QCliente.FieldByName('LIMITE').AsFloat > 0 then
      begin
        QLimite.Close;

        QLimite.ParamByName('CLIENTE_ID').AsInteger     := StrToInt(Cliente.Text);
        QLimite.ParamByName('DT_VENCIMENTO').AsDateTime := StrToDate('31/12/2026');

        QLimite.Prepare;
        QLimite.Open;

        if (QLimite.FieldByName('DEBITO').AsFloat + Vr_Venda + Acrescimo.Value - Desconto.Value - Entrada.Value) > QCliente.FieldByName('LIMITE').AsFloat then
        begin
          Application.MessageBox('Valor acima do limite do cliente', PChar(Msg_Title), mb_IconStop);
          exit;
        end;
      end;
    end;
  end;

  if (Vendedor.Value > 0) and (QVendedor.IsEmpty) then
  begin
    Application.MessageBox('Vendedor inexistente', PChar(Msg_Title), mb_IconStop);

    Vendedor.Color := clYellow;
    Vendedor.SetFocus;

    exit;
  end;

  if (Cliente.Value > 0) and (QCliente.IsEmpty) then
  begin
    Application.MessageBox('Cliente inexistente', PChar(Msg_Title), mb_IconSTop);

    Cliente.Color := clYellow;
    Cliente.SetFocus;

    exit;
  end;

  if QCFOP.IsEmpty then
  begin
    Application.MessageBox('CFOP inexistente', PChar(Msg_Title), mb_IconStop);

    CFOP.Color := clYellow;
    CFOP.SetFocus;

    exit;
  end;

  if (FrmPrincipal.Config.FieldByName('DESC_MAXIMO').AsFloat = 0) and (Desconto.Value > 0) then
  begin
    Application.MessageBox('Desconto não permitido', PChar(Msg_Title), mb_IconStop);

    Desconto.Color := clYellow;
    Desconto.SetFocus;

    exit;
  end;

  if Entrada.Value >= Vr_Venda then
  begin
    Application.MessageBox('Entrada inválida', PChar(Msg_Title), mb_IconStop);

    Entrada.Color := clYellow;
    Entrada.SetFocus;

    exit;
  end;
  
  if Desconto.Value >= Vr_Venda then
  begin
    Application.MessageBox('Desconto inválido', PChar(Msg_Title), mb_IconStop);

    Desconto.Color := clYellow;
    Desconto.SetFocus;

    exit;
  end;

  if FrmPrincipal.Config.FieldByName('DESC_MAXIMO').AsFloat > 0 then
  begin
    if Desconto.Value > ((Vr_Venda * FrmPrincipal.Config.FieldByName('DESC_MAXIMO').AsFloat) / 100) then
    begin
      Application.MessageBox('Vr. Desconto maior do que o valor permitido', PChar(Msg_Title), mb_IconStop);

      Desconto.Color := clYellow;
      Desconto.SetFocus;

      exit;
    end;
  end;

  if (Dinheiro.Value = 0) and (QFormas.FieldByName('F_DIG_VALOR').AsString = 'True') then
  begin
    Application.MessageBox('Obrigatório digitar o Dinheiro recebido', PChar(Msg_Title), mb_IconSTop);

    Dinheiro.Color := clYellow;
    Dinheiro.SetFocus;

    exit;
  end;

  if (Dinheiro.Value - (Vr_Venda + Acrescimo.Value - Desconto.Value)) > QFormas.FieldByName('LIMTROCO').AsFloat then
  begin
    Application.MessageBox('Troco não permitido', PChar(Msg_Title), mb_IconSTop);

    Dinheiro.Color := clYellow;
    Dinheiro.SetFocus;

    exit;
  end;

  if (Dinheiro.Value > 0) and ((Dinheiro.Value + 0.01)  < (Vr_Venda + Acrescimo.Value - Desconto.Value)) then
  begin
    Application.MessageBox('Valor inválido', PChar(Msg_Title), mb_IconSTop);

    Dinheiro.Color := clYellow;
    Dinheiro.SetFocus;

    exit;
  end;

  Result := True;
end;

procedure TFrmPagamento.DetailSearch(Tabela: String);
begin
  if ((Tabela = '') or (Tabela = 'Finalizadora')) and (Finalizadora.Text <> '') then
  begin
    QFormas.Close;

    QFormas.ParamByName('FINALIZADORA_ID').AsInteger := StrToInt(Finalizadora.Text);

    QFormas.Prepare;
    QFormas.Open;

    if QFormas.FieldByName('TIPO_TRANSACAO').AsString = '2' then
      Entrada.Enabled := True
    else
    begin
      Entrada.Value   := 0;
      Entrada.Enabled := False;
    end;  
  end;

  if ((Tabela = '') or (Tabela = 'Cliente')) and (Cliente.Text <> '') then
  begin
    QCliente.Close;

    QCliente.ParamByName('CLIENTE_ID').AsInteger := StrToInt(Cliente.Text);

    QCliente.Prepare;
    QCliente.Open;

    if not QCliente.IsEmpty then
    begin
      Nome_Cliente.Text     := QCliente.FieldByName('NOME').AsString;
      Endereco_Cliente.Text := QCliente.FieldByName('ENDERECO').AsString;
      Bairro_Cliente.Text   := QCliente.FieldByName('BAIRRO').AsString;
    end;
  end;

  if ((Tabela = '') or (Tabela = 'Vendedor')) and (Vendedor.Text <> '') then
  begin
    QVendedor.Close;

    QVendedor.ParamByName('FUNCIONARIO_ID').AsInteger := StrToInt(Vendedor.Text);

    QVendedor.Prepare;
    QVendedor.Open;
  end;

  if ((Tabela = '') or (Tabela = 'CFOP')) and (CFOP.Text <> '') then
  begin
    QCFOP.Close;

    QCFOP.ParamByName('COD_CFOP').AsString := CFOP.Text;

    QCFOP.Prepare;
    QCFOP.Open;
  end;
end;

procedure TFrmPagamento.DinheiroExit(Sender: TObject);
begin
  if (Sender = Desc_Por) and (Desc_Por.Value > 0) then
    Desconto.Value := RoundTo(((Vr_Venda * Desc_Por.Value) / 100), -2);

  if (Sender = Acr_Por) and (Acr_Por.Value > 0) then
    Acrescimo.Value := RoundTo(((Vr_Venda * Acr_Por.Value) / 100), -2);

  if Sender = Acrescimo then
  begin
    if Acrescimo.Value > 0 then
      Acr_Por.Value := RoundTo(((Acrescimo.Value * 100) / Vr_Venda), -2)
    else
      Acr_Por.Value := 0;
  end;

  if Sender = Desconto then
  begin
    if Desconto.Value > 0 then
      Desc_Por.Value := RoundTo(((Desconto.Value * 100) / Vr_Venda), -2)
    else
      Desc_Por.Value := 0;  

    if Desconto.Value >= Vr_Venda then
    begin
      Application.MessageBox('Desconto inválido', PChar(Msg_Title), mb_IconStop);
      Desconto.SetFocus;
      abort;
    end;

    if (FrmPrincipal.Config.FieldByName('DESC_MAXIMO').AsFloat = 0) and (Desconto.Value > 0) then
    begin
      Application.MessageBox('Desconto não permitido', PChar(Msg_Title), mb_IconStop);
      Desconto.SetFocus;
      abort;
    end;

    if FrmPrincipal.Config.FieldByName('DESC_MAXIMO').AsFloat > 0 then
    begin
      if Desconto.Value > ((Vr_Venda * FrmPrincipal.Config.FieldByName('DESC_MAXIMO').AsFloat) / 100) then
      begin
        Application.MessageBox('Vr. Desconto maior do que o valor permitido', PChar(Msg_Title), mb_IconStop);
        Desconto.SetFocus;
        abort;
      end;
    end;
  end;

  Label13.Caption  := 'Vr. Venda: ' + FormatFloat('#,##0.00', (Vr_Venda + Acrescimo.Value - Desconto.Value));

  if Dinheiro.Value > (Vr_Venda + Acrescimo.Value - Desconto.Value) then
  begin
    Label14.Visible := True;
    Label14.Caption := 'Troco: ' + FormatFloat('#,##0.00', (Dinheiro.Value - (Vr_Venda + Acrescimo.Value - Desconto.Value)));
  end
  else
  begin
    Label14.Visible := False;
    Label14.Caption := 'Troco: ' + FormatFloat('#,##0.00', 0);
  end;
end;

procedure TFrmPagamento.btnClienteClick(Sender: TObject);
begin
  try
    Cliente.Value := GetConsulta('CLIENTES', 0, 0, StrToInt(Cliente.Text));
  except
    Cliente.Value := GetConsulta('CLIENTES', 0, 0, 0);
  end;
end;

procedure TFrmPagamento.btnExecutaClick(Sender: TObject);
var
ID, Copias, Linhas, Itens, Comando, Seq_Item, Dividir, Lin: Integer;
InputString, S, Buffer, Comunica: String;
MyFile: TextFile;
Base_ICMS_Normal, Vr_ICMS_Normal, Base_ICMS_ST, Vr_ICMS_ST, Unidades, Perc_Desconto, Desc_Especial, Base_ICMS_Normal_Acum, Vr_ICMS_Normal_Acum, Base_ICMS_ST_Acum, Vr_ICMS_ST_Acum, MVA, Aliquota_Inter_Estadual, Meio: Real;
Emitir_NFiscal: TModalResult;
begin
// 385, 417
  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    DetailSearch('');

    if Validacao then
    begin
      Emitir_NFiscal := Application.MessageBox('Deseja emitir Nota Fiscal?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2);

      if Emitir_NFiscal = IDYES then
        Modelo.Text := '55';

      if Dinheiro.Value > (Vr_Venda + Acrescimo.Value - Desconto.Value) then
      begin
        Label14.Visible := True;
        Label14.Caption := 'Troco: ' + FormatFloat('#,##0.00', (Dinheiro.Value - (Vr_Venda + Acrescimo.Value - Desconto.Value)));
      end;

      ID_Transacao.Prepare;
      ID_Transacao.ExecProc;

      ID := ID_Transacao.Params[0].Value;



      QTransacao.ParamByName('AUTORIZ_ID').AsInteger := FrmData.QAcesso.ParamByName('FUNCIONARIO_ID').AsInteger;
      QTransacao.ParamByName('BALANCO').AsString     := 'LIBERADO';

      if (QFormas.FieldByName('TIPO_TRANSACAO').AsString <> '2') and (QFormas.FieldByName('TIPO_TRANSACAO').AsString <> '3') then
      begin
        QTransacao.ParamByName('BANCO_ID').AsInteger        := StrToInt(LeIni(Arq_Ini, 'Sistema', 'Caixa'));
        QTransacao.ParamByName('FLUXO_CAIXA_ID').AsInteger  := 2;
      end;

      QTransacao.ParamByName('BANCO_ID_TRANSF').AsInteger := 0;
      QTransacao.ParamByName('BASE_ICMS_NORMAL').AsFloat  := 0;
      QTransacao.ParamByName('BASE_ICMS_ST').AsFloat      := 0;
      QTransacao.ParamByName('C_CUSTO_ID').AsInteger      := 1;
      QTransacao.ParamByName('CFOP').AsString             := CFOP.Text;
      QTransacao.ParamByName('CLIENTE_ID').AsInteger      := StrToInt(Cliente.Text);
      QTransacao.ParamByName('COMISSAO').AsFloat          := 0;
      QTransacao.ParamByName('COMPLEMENTO').AsString      := '';

      if QFormas.FieldByName('TIPO_TRANSACAO').AsString = '2' then
        QTransacao.ParamByName('COND_PAGTO').AsString := 'A PRAZO'
      else
        QTransacao.ParamByName('COND_PAGTO').AsString := 'A VISTA';

      QTransacao.ParamByName('CONDUTA').AsString          := '01';
      QTransacao.ParamByName('CONTA_ID').AsInteger        := FrmPrincipal.Config.FieldByName('CONTA_ESTOQUE').AsInteger;
      QTransacao.ParamByName('CONTAAUX_ID').AsInteger     := 0;
      QTransacao.ParamByName('DEPTO').AsString            := '07';
      QTransacao.ParamByName('DT_MOVIMENTO').AsDateTime   := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
      QTransacao.ParamByName('DT_TRANS').AsDateTime       := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
      QTransacao.ParamByName('EMPRESA_ID').AsInteger      := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
      QTransacao.ParamByName('EMPRESAAUX_ID').AsInteger   := 0;
      QTransacao.ParamByName('ENTRADA_ID').AsFloat        := 0;
      QTransacao.ParamByName('FINALIZADORA_ID').AsInteger := StrToInt(Finalizadora.Text);
      QTransacao.ParamByName('FORNECEDOR_ID').AsInteger   := 0;

      if QFormas.FieldByName('TIPO_TRANSACAO').AsString = '2' then
        QTransacao.ParamByName('HISTORICO').AsString := 'Venda a Prazo - ' + Copy(QCliente.FieldByName('NOME').AsString, 1, 70)
      else
        QTransacao.ParamByName('HISTORICO').AsString := 'Venda a Vista';

      QTransacao.ParamByName('NUM_CHEQUE').AsString := '';

      if Emitir_NFiscal = IDNO then
        QTransacao.ParamByName('NUM_DOC').AsString := StrZero(IntToStr(ID), 7, 0);

      QTransacao.ParamByName('ORCAMENTO_ID').AsInteger := 0;
      QTransacao.ParamByName('PARCELA_ID').AsInteger   := 0;
      QTransacao.ParamByName('PEDIDO_ID').AsInteger    := 0;
      QTransacao.ParamByName('SAIDA_ID').AsInteger     := 0;
      QTransacao.ParamByName('SERIE').AsString         := Serie.Text;
      QTransacao.ParamByName('SUB_CODIGO').AsString    := '1 - NORMAL';

      if ((LeIni(ExtractFilePath(ParamStr(0)) + 'NFe.Ini', 'NFe', 'NFe') = 'True') or (LeIni(Arq_Ini, 'Sistema', 'Nf. Pré-Impressa') = 'True')) and (Emitir_NFiscal = IDYES) then
        QTransacao.ParamByName('TPCTB').AsString := '2'
      else
        QTransacao.ParamByName('TPCTB').AsString := '3';

      QTransacao.ParamByName('TRANSACAO_ID').AsInteger    := ID;
      QTransacao.ParamByName('VALOR').AsFloat             := (Vr_Venda + Acrescimo.Value - Desconto.Value);
      QTransacao.ParamByName('VALOR_PARCELA').AsFloat     := 0;
      QTransacao.ParamByName('VALOR_PRODUTOS').AsFloat    := Vr_Venda;
      QTransacao.ParamByName('VENDEDOR_ID').AsInteger     := StrToInt(Vendedor.Text);
      QTransacao.ParamByName('VR_ACRESCIMO').AsFloat      := Acrescimo.Value;
      QTransacao.ParamByName('VR_DESCONTO').AsFloat       := Desconto.Value;
      QTransacao.ParamByName('VR_FRETE').AsFloat          := 0;
      QTransacao.ParamByName('VR_ICMS_NORMAL').AsFloat    := 0;
      QTransacao.ParamByName('VR_ICMS_ST').AsFloat        := 0;
      QTransacao.ParamByName('VR_IPI').AsFloat            := 0;
      QTransacao.ParamByName('DESCONTO_ESPECIAL').AsFloat := Desconto.Value;
      QTransacao.ParamByName('MODELO').AsString           := Modelo.Text;
      QTransacao.ParamByName('TIPO_VENDA').AsString       := 'VENDA';
      QTransacao.ParamByName('OPERADOR').AsString         := Copy(Ope_Caixa, 1, 14);
      QTransacao.ParamByName('HORA').AsString             := Copy(TimeToStr(time), 1, 8);

      QTransacao.Prepare;
      QTransacao.ExecSql;



      QLogs.Sql.Clear;
      QLogs.Sql.Add('SELECT * FROM LOG_ITENS');
      QLogs.Sql.Add('WHERE');
      QLogs.Sql.Add('(CUPOM = :CUPOM)');

      QLogs.ParamByName('CUPOM').AsString := SerialNum('C');

      QLogs.Prepare;
      QLogs.Open;

      Base_ICMS_Normal := 0;
      Vr_ICMS_Normal   := 0;
      Base_ICMS_ST     := 0;
      Vr_ICMS_ST       := 0;

      Base_ICMS_Normal_Acum := 0;
      Vr_ICMS_Normal_Acum   := 0;
      Base_ICMS_ST_Acum     := 0;
      Vr_ICMS_ST_Acum       := 0;

      Itens    := 0;
      Unidades := 0;
      Seq_Item := 1;

      if Desconto.Value > 0 then
        Perc_Desconto := ((Desconto.Value * 100) / Vr_Venda)
      else
        Perc_Desconto := 0;

      QLogs.First;
      while not QLogs.Eof do
      begin
        if Perc_Desconto > 0 then
          Desc_Especial := RoundTo(((Perc_Desconto * QLogs.FieldByName('VR_TOTAL').AsFloat) / 100), -2)
        else
          Desc_Especial := 0;

        if QLogs.FieldByName('ALIQUOTA_ICMS').AsFloat > 0 then
        begin
          Base_ICMS_Normal      := (QLogs.FieldByName('VR_TOTAL').AsFloat - Desc_Especial);
          Base_ICMS_Normal_Acum := (Base_ICMS_Normal_Acum + Base_ICMS_Normal);

          Vr_ICMS_Normal      := ((Base_ICMS_Normal * QLogs.FieldByName('ALIQUOTA_ICMS').AsFloat) / 100);
          Vr_ICMS_Normal_Acum := (Vr_ICMS_Normal_Acum + Vr_ICMS_Normal);
        end
        else
        begin
          Base_ICMS_Normal := 0;
          Vr_ICMS_Normal   := 0;
        end;

        if (QLogs.FieldByName('CST').AsString = '010') or (QLogs.FieldByName('CST').AsString = '030') or (QLogs.FieldByName('CST').AsString = '060') or (QLogs.FieldByName('CST').AsString = '070') then
        begin
          if Destacar_ICMS_St.Checked then
          begin
            if not QCliente.IsEmpty then
            begin
              QRel.Sql.Clear;
              QRel.Sql.Add('SELECT * FROM ESTADOS');
              QRel.Sql.Add('WHERE');
              QRel.Sql.Add('(UF = :UF)');

              QRel.ParamByName('UF').AsString := QCliente.FieldByName('ESTADO').AsString;

              QRel.Prepare;
              QRel.Open;

              Aliquota_Inter_Estadual := QRel.FieldByName('ICMS').AsFloat;
            end
            else
              Aliquota_Inter_Estadual := Aliquota_ICMS_Local;

            MVA               := RoundTo((((QLogs.FieldByName('VR_TOTAL').AsFloat + QLogs.FieldByName('IPI').AsFloat - Desc_Especial) * QLogs.FieldByName('MVA').AsFloat) / 100), -2);
            Base_ICMS_ST      := (QLogs.FieldByName('VR_TOTAL').AsFloat + QLogs.FieldByName('IPI').AsFloat - Desc_Especial + MVA);
            Base_ICMS_ST_Acum := (Base_ICMS_ST_Acum + Base_ICMS_ST);
            Vr_ICMS_ST        := RoundTo((((Base_ICMS_ST * Aliquota_ICMS_Local) / 100) - RoundTo((((QLogs.FieldByName('VR_TOTAL').AsFloat - Desc_Especial) * Aliquota_Inter_Estadual) / 100), -2)), -2);
            Vr_ICMS_ST_Acum   := (Vr_ICMS_ST_Acum + Vr_ICMS_ST);
          end
          else
          begin
            Base_ICMS_ST := 0;
            Vr_ICMS_ST   := 0;
          end;
        end
        else
        begin
          Base_ICMS_ST := 0;
          Vr_ICMS_ST   := 0;
        end;

        QTransItens.ParamByName('VALOR_OUTROS').AsFloat   := 0;
        QTransItens.ParamByName('VALOR_ISENTO').AsFloat   := 0;
        QTransItens.ParamByName('VALOR_ICMS').AsFloat     := Vr_ICMS_Normal;
        QTransItens.ParamByName('BASE_CALC_ICMS').AsFloat := Base_ICMS_Normal;
        QTransItens.ParamByName('BASE_CALC_ST').AsFloat   := Base_ICMS_ST;
        QTransItens.ParamByName('VALOR_ICMS_ST').AsFloat  := Vr_ICMS_ST;
        QTransItens.ParamByName('ALIQUOTA_ICMS').AsFloat  := QLogs.FieldByName('ALIQUOTA_ICMS').AsFloat;
        QTransItens.ParamByName('CONTA_ID').AsInteger     := FrmPrincipal.Config.FieldByName('CONTA_ESTOQUE').AsInteger;
        QTransItens.ParamByName('CST').AsString           := QLogs.FieldByName('CST').AsString;
        QTransItens.ParamByName('DESCRICAO').AsString     := QLogs.FieldByName('DESCRICAO').AsString;
        QTransItens.ParamByName('MVA').AsFloat            := QLogs.FieldByName('MVA').AsFloat;
        QTransItens.ParamByName('PRODUTO_ID').AsInteger   := QLogs.FieldByName('PRODUTO_ID').AsInteger;
        QTransItens.ParamByName('QUANTIDADE').AsFloat     := QLogs.FieldByName('QUANTIDADE').AsFloat;
        QTransItens.ParamByName('TP_PROD_SERV').AsString  := 'P';
        QTransItens.ParamByName('TRANSACAO_ID').AsInteger := ID;
        QTransItens.ParamByName('TRIBUTO_ID').AsInteger   := QLogs.FieldByName('TRIBUTO_ID').AsInteger;
        QTransItens.ParamByName('VR_DESCONTO').AsFloat    := QLogs.FieldByName('VR_DESCONTO').AsFloat;
        QTransItens.ParamByName('VR_IPI').AsFloat         := QLogs.FieldByName('IPI').AsFloat;
        QTransItens.ParamByName('VR_TOTAL').AsFloat       := QLogs.FieldByName('VR_TOTAL').AsFloat;
        QTransItens.ParamByName('VR_UNITARIO').AsFloat    := QLogs.FieldByName('VR_UNITARIO').AsFloat;
        QTransItens.ParamByName('CFOP').AsString          := QLogs.FieldByName('CFOP').AsString;
        QTransItens.ParamByName('SEQUENCIA').AsInteger    := Seq_Item;

        if (QLogs.FieldByName('CST').AsString = '040') or (QLogs.FieldByName('CST').AsString = '041') or (QLogs.FieldByName('CST').AsString = '050') then
          QTransItens.ParamByName('VALOR_ISENTO').AsFloat := QLogs.FieldByName('VR_TOTAL').AsFloat;

        QTransItens.Prepare;
        QTransItens.ExecSql;



        Itens    := (Itens + 1);
        Unidades := (Unidades + QLogs.FieldByName('QUANTIDADE').AsFloat);
        Seq_Item := (Seq_Item + 1);

        Application.ProcessMessages;
        QLogs.Next;
      end;

      QRel.Sql.Clear;
      QRel.Sql.Add('UPDATE TRANSACOES SET BASE_ICMS_NORMAL = :BASE_ICMS_NORMAL, VR_ICMS_NORMAL = :VR_ICMS_NORMAL, BASE_ICMS_ST = :BASE_ICMS_ST, VR_ICMS_ST = :VR_ICMS_ST, ITENS = :ITENS, UNIDADES = :UNIDADES');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

      QRel.ParamByName('BASE_ICMS_NORMAL').AsFloat := Base_ICMS_Normal_Acum;
      QRel.ParamByName('VR_ICMS_NORMAL').AsFloat   := Vr_ICMS_Normal_Acum;
      QRel.ParamByName('BASE_ICMS_ST').AsFloat     := Base_ICMS_ST_Acum;
      QRel.ParamByName('VR_ICMS_ST').AsFloat       := Vr_ICMS_ST_Acum;
      QRel.ParamByName('ITENS').AsInteger          := Itens;
      QRel.ParamByName('UNIDADES').AsFloat         := Unidades;
      QRel.ParamByName('TRANSACAO_ID').AsInteger   := ID;

      QRel.Prepare;
      QRel.ExecSql;



      QRel.Sql.Clear;
      QRel.Sql.Add('INSERT INTO FECHAMENTO_CUPOM(' +
                   'CUPOM,               CAIXA_ID,            OPERADOR_ID, ' +
                   'FINALIZADORA_ID,     LEGENDA,             DATA, ' +
                   'HORA,                VALOR_CUPOM,         ACRESCIMO, ' +
                   'DESCONTO,            VALOR_FINALIZADORA,  FISCAL) VALUES(' +
                   ':CUPOM,              :CAIXA_ID,           :OPERADOR_ID, ' +
                   ':FINALIZADORA_ID,    :LEGENDA,            :DATA, ' +
                   ':HORA,               :VALOR_CUPOM,        :ACRESCIMO, ' +
                   ':DESCONTO,           :VALOR_FINALIZADORA, :FISCAL)');

      QRel.ParamByName('CUPOM').AsString            := StrZero(IntToStr(ID), 8, 0);
      QRel.ParamByName('CAIXA_ID').AsInteger        := StrToInt(LeIni(Arq_Ini, 'Sistema', 'Caixa'));
      QRel.ParamByName('OPERADOR_ID').AsInteger     := 0;
      QRel.ParamByName('FINALIZADORA_ID').AsInteger := QFormas.FieldByName('FINALIZADORA_ID').AsInteger;
      QRel.ParamByName('LEGENDA').AsString          := QFormas.FieldByName('LEGENDA').AsString;
      QRel.ParamByName('DATA').AsDateTime           := date;
      QRel.ParamByName('HORA').AsString             := TimeToStr(time);
      QRel.ParamByName('VALOR_CUPOM').AsFloat       := Vr_Venda;
      QRel.ParamByName('ACRESCIMO').AsFloat         := Acrescimo.Value;
      QRel.ParamByName('DESCONTO').AsFloat          := Desconto.Value;

      if Dinheiro.Value > 0 then
        QRel.ParamByName('VALOR_FINALIZADORA').AsFloat := Dinheiro.Value
      else
        QRel.ParamByName('VALOR_FINALIZADORA').AsFloat := Vr_Venda;

      QRel.ParamByName('FISCAL').AsString := '';

      QRel.Prepare;
      QRel.ExecSql;



      if QFormas.FieldByName('TIPO_TRANSACAO').AsString = '2' then
      begin
        Divisao_Parcelas(ID, 'T','', True, FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime, (Vr_Venda + Acrescimo.Value - Desconto.Value));

        QRel.Sql.Clear;
        QRel.Sql.Add('UPDATE TRANSPARCELAS SET TIPO_TRANSACAO = :TIPO_TRANSACAO');
        QRel.Sql.Add('WHERE');
        QRel.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
        QRel.Sql.Add('AND (TIPO_TRANSACAO = :TIPO_TRANS)');

        QRel.ParamByName('TIPO_TRANSACAO').AsString := 'U';
        QRel.ParamByName('TRANSACAO_ID').AsInteger  := ID;
        QRel.ParamByName('TIPO_TRANS').AsString     := 'T';

        QRel.Prepare;
        QRel.ExecSql;


      end;

      if (LeIni(Arq_Ini, 'Sistema', 'Nf. Pré-Impressa') = 'True') and (Emitir_NFiscal = IDYES) then
        Nota_Fiscal(ID)
      else if (LeIni(ExtractFilePath(ParamStr(0)) + 'NFe.Ini', 'NFe', 'NFe') = 'True') and (Emitir_NFiscal = IDYES) then
      begin
        if DecryptMsg(FrmPrincipal.Config.FieldByName('VERSAO').AsString, 65) = 'LIGHT' then
          Nota_Fiscal(ID)
        else
          NFe(ID,0, CFOP.Text);
      end
      else
      begin
        if LeIni(Arq_Ini, 'Sistema', 'Imp. Orçamento') = 'Driver Bematech' then
        begin
          if Application.MessageBox('Deseja imprimir o comprovante?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = idYes then
          begin
            InputString := InputBox(PChar(Msg_Title), 'Cópias', '1');

            AssignFile(MyFile, ExtractFilePath(ParamStr(0)) + 'Cupom.Txt');
            Rewrite(MyFile);

            for Copias := 1 to StrToInt(InputString) do
            begin
              if LeIni(Arq_Ini, 'Sistema', 'Linha Cabeçalho') <> '' then
                WriteLn(MyFile, LeIni(Arq_Ini, 'Sistema', 'Linha Cabeçalho'))
              else
              begin
                Meio    := ((48 - Length(FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString)) / 2);
                Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));

                Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ') + FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString);

                Meio    := ((48 - Length(FrmPrincipal.QEmpresa.FieldByName('TELEFONE').AsString)) / 2);
                Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));

                Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ') + FrmPrincipal.QEmpresa.FieldByName('TELEFONE').AsString);

                Meio    := ((48 - Length(FrmPrincipal.QEmpresa.FieldByName('ENDERECO').AsString)) / 2);
                Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));

                Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ') + FrmPrincipal.QEmpresa.FieldByName('ENDERECO').AsString);

                Meio    := ((48 - Length(FrmPrincipal.QEmpresa.FieldByName('BAIRRO').AsString + ' - ' + FrmPrincipal.QEmpresa.FieldByName('MUNICIPIO').AsString)) / 2);
                Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));

                Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ') + FrmPrincipal.QEmpresa.FieldByName('BAIRRO').AsString + ' - ' + FrmPrincipal.QEmpresa.FieldByName('MUNICIPIO').AsString);

                Meio    := ((48 - Length('CEP: ' + FrmPrincipal.QEmpresa.FieldByName('CEP').AsString + ' - ' + 'CNPJ: ' + FrmPrincipal.QEmpresa.FieldByName('CNPJ').AsString)) / 2);
                Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));

                Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ') + 'CEP: ' + FrmPrincipal.QEmpresa.FieldByName('CEP').AsString + ' - ' + 'CNPJ: ' + FrmPrincipal.QEmpresa.FieldByName('CNPJ').AsString);

                Meio    := ((48 - Length('Hora: ' + TimeToStr(now) + '  Data: ' + DateToStr(date))) / 2);
                Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));

                Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ') + 'Hora: ' + TimeToStr(now) + '  Data: ' + DateToStr(date));
                Writeln(MyFile, '------------------------------------------------');

                Meio    := ((48 - Length('Venda: ' + IntToStr(ID))) / 2);
                Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));

                Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ') + 'Venda: ' + IntToStr(ID));

                if StrToInt(Vendedor.Text) > 0 then
                begin
                  Meio    := ((48 - Length('At.: ' + Copy(QVendedor.FieldByName('NOME').AsString, 1, 15))) / 2);
                  Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));
                  Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ') + 'At.: ' + Copy(QVendedor.FieldByName('NOME').AsString, 1, 15));
                end
                else
                begin
                  Meio    := ((48 - Length('At.: ' + Copy(FrmPrincipal.StatusBar.Panels[4].Text, 11, 15))) / 2);
                  Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));
                  Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ') + 'At.: ' + Copy(FrmPrincipal.StatusBar.Panels[4].Text, 11, 15));
                end;
              end;
              Writeln(MyFile, '------------------------------------------------');
              Writeln(MyFile, 'Código / Produto          Valor   Qtde     Total');
              Writeln(MyFile, '------------------------------------------------');

              QLogs.First;
              while not QLogs.Eof do
              begin
                Writeln(MyFile, StrZero(QLogs.FieldByName('PRODUTO_ID').AsString, 6, 0) + ' / ' +
                                ForcaComprimento(QLogs.FieldByName('DESCRICAO').AsString, 13, ' ') +
                                ForcaComprimento(' ', 9 - Length(FormatFloat('#,##0.00', QLogs.FieldByName('VR_UNITARIO').AsFloat)), ' ') +
                                FormatFloat('#,##0.00', QLogs.FieldByName('VR_UNITARIO').AsFloat) + ' ' +
                                ForcaComprimento(' ', 7 - Length(FormatFloat('#,##0.000', QLogs.FieldByName('QUANTIDADE').AsFloat)), ' ') +
                                FormatFloat('#,##0.00', QLogs.FieldByName('QUANTIDADE').AsFloat) + ' ' +
                                ForcaComprimento(' ', 9 - Length(FormatFloat('#,##0.00', QLogs.FieldByName('VR_TOTAL').AsFloat)), ' ') +
                                FormatFloat('#,##0.00', QLogs.FieldByName('VR_TOTAL').AsFloat));

                Application.ProcessMessages;

                QLogs.Next;
              end;

              Writeln(MyFile, '                                       ---------');

              if (Desconto.Value > 0) or (Acrescimo.Value > 0) then
              begin
                Writeln(MyFile, ForcaComprimento('Sub-Total', 48 - Length(FormatFloat('#,##0.00', Vr_Venda)), ' ') + FormatFloat('#,##0.00', Vr_Venda));

                if Acrescimo.Value > 0 then
                  Writeln(MyFile, ForcaComprimento('Acrescimo', 48 - Length(FormatFloat('#,##0.00', Acrescimo.Value)), ' ') + FormatFloat('#,##0.00', Acrescimo.Value));

                if Desconto.Value > 0 then
                  Writeln(MyFile, ForcaComprimento('Desconto', 48 - Length(FormatFloat('#,##0.00', Desconto.Value)), ' ') + FormatFloat('#,##0.00', Desconto.Value));

                if (Desconto.Value > 0) or (Acrescimo.Value > 0) then
                  Writeln(MyFile, '                                       =========');

                Writeln(MyFile, ForcaComprimento('Total', 48 - Length(FormatFloat('#,##0.00', Vr_Venda + Acrescimo.Value - Desconto.Value)), ' ') + FormatFloat('#,##0.00', Vr_Venda + Acrescimo.Value - Desconto.Value));
              end
              else
                Writeln(MyFile, ForcaComprimento('Total', 48 - Length(FormatFloat('#,##0.00', Vr_Venda + Acrescimo.Value - Desconto.Value)), ' ') + FormatFloat('#,##0.00', Vr_Venda + Acrescimo.Value - Desconto.Value));

              if Dinheiro.Value > 0 then
              begin
                Writeln(MyFile, ForcaComprimento('Valor Pago', 48 - Length(FormatFloat('#,##0.00', Dinheiro.Value)), ' ') + FormatFloat('#,##0.00', Dinheiro.Value));
                Writeln(MyFile, ForcaComprimento('Troco', 48 - Length(FormatFloat('#,##0.00', (Dinheiro.Value - (Vr_Venda + Acrescimo.Value - Desconto.Value)))), ' ') + FormatFloat('#,##0.00', (Dinheiro.Value - (Vr_Venda + Acrescimo.Value - Desconto.Value))));
              end;

              Writeln(MyFile, '');
              Writeln(MyFile, '');
              Writeln(MyFile, 'Forma Pagamento: ' + QFormas.FieldByName('LEGENDA').AsString);
              Writeln(MyFile, '');
              Writeln(MyFile, '');
              Writeln(MyFile, '');

              if QFormas.FieldByName('TIPO_TRANSACAO').AsString = '2' then
              begin
                Writeln(MyFile, 'Cliente: ' + QCliente.FieldByName('NOME').AsString);
                Writeln(MyFile, 'CPF/CNPJ: ' + QCliente.FieldByName('CNPJ').AsString);
                Writeln(MyFile, 'Endereco: ' + QCliente.FieldByName('ENDERECO').AsString + ', ' + QCliente.FieldByName('NUMERO').AsString);
                Writeln(MyFile, 'Bairro/Cidade: ' + QCliente.FieldByName('BAIRRO').AsString + ', ' + QCliente.FieldByName('MUNICIPIO').AsString);
                Writeln(MyFile, 'CEP: ' + QCliente.FieldByName('CEP').AsString);
                Writeln(MyFile, '');

                QParcelas.Sql.Clear;
                QParcelas.Sql.Add('SELECT * FROM TRANSPARCELAS');
                QParcelas.Sql.Add('WHERE');
                QParcelas.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
                QParcelas.Sql.Add('AND (TIPO_TRANSACAO = :TIPO_TRANSACAO)');

                QParcelas.ParamByName('TRANSACAO_ID').AsInteger  := ID;
                QParcelas.ParamByName('TIPO_TRANSACAO').AsString := 'T';

                QParcelas.Prepare;
                QParcelas.Open;

                QParcelas.First;
                while not QParcelas.Eof do
                begin
                  Writeln(MyFile, 'Vencimento: ' + QParcelas.FieldByName('DT_VENCIMENTO').AsString +
                                                   '          Valor : ' + FormatFloat('#,##0.00', QParcelas.FieldByName('VALOR').AsFloat));
                  Application.ProcessMessages;
                  QParcelas.Next;
                end;

                Writeln(MyFile, '');
                Writeln(MyFile, '');
                Writeln(MyFile, '       _________________________________        ');
                Writeln(MyFile, '             Assinatura do Cliente              ');
              end
              else
              begin
                Writeln(MyFile, '       _________________________________        ');
                Writeln(MyFile, '             Assinatura do Cliente              ');
              end;

              for Linhas := 1 to StrToInt(LeIni(Arq_Ini, 'Sistema', 'Linhas')) do
                Writeln(MyFile, ' ');
            end;

            CloseFile(MyFile);

            if LeIni(Arq_Ini, 'Sistema', 'Modelo Impressora') = '0' then
              Comando := ConfiguraModeloImpressora(0)
            else if LeIni(Arq_Ini, 'Sistema', 'Modelo Impressora') = '1' then
              Comando := ConfiguraModeloImpressora(1)
            else if LeIni(Arq_Ini, 'Sistema', 'Modelo Impressora') = '2' then
              Comando := ConfiguraModeloImpressora(2)
            else if LeIni(Arq_Ini, 'Sistema', 'Modelo Impressora') = '3' then
              Comando := ConfiguraModeloImpressora(3)
            else if LeIni(Arq_Ini, 'Sistema', 'Modelo Impressora') = '4' then
              Comando := ConfiguraModeloImpressora(4)
            else if LeIni(Arq_Ini, 'Sistema', 'Modelo Impressora') = '5' then
              Comando := ConfiguraModeloImpressora(5);

            if Comando <> 1 then
              Application.MessageBox('Erro de comunicação com a impressora Bematech (Configura Impressora)', PChar(Msg_Title), mb_IconInformation);

            if LeIni(Arq_Ini, 'Sistema', 'Porta Impressora') = 'USB' then
              Comunica := 'USB'#0
            else if LeIni(Arq_Ini, 'Sistema', 'Porta Impressora') = 'COM1' then
              Comunica := 'COM1'
            else if LeIni(Arq_Ini, 'Sistema', 'Porta Impressora') = 'COM2' then
              Comunica := 'COM2'
            else if LeIni(Arq_Ini, 'Sistema', 'Porta Impressora') = 'COM3' then
              Comunica := 'COM3'
            else if LeIni(Arq_Ini, 'Sistema', 'Porta Impressora') = 'COM4' then
              Comunica := 'COM4'
            else if LeIni(Arq_Ini, 'Sistema', 'Porta Impressora') = 'COM5' then
              Comunica := 'COM5'
            else if LeIni(Arq_Ini, 'Sistema', 'Porta Impressora') = 'COM6' then
              Comunica := 'COM6'
            else if LeIni(Arq_Ini, 'Sistema', 'Porta Impressora') = 'COM7' then
              Comunica := 'COM7'
            else if LeIni(Arq_Ini, 'Sistema', 'Porta Impressora') = 'COM8' then
              Comunica := 'COM8'
            else if LeIni(Arq_Ini, 'Sistema', 'Porta Impressora') = 'COM9' then
              Comunica := 'COM9'
            else if LeIni(Arq_Ini, 'Sistema', 'Porta Impressora') = 'COM10' then
              Comunica := 'COM10'
            else if LeIni(Arq_Ini, 'Sistema', 'Porta Impressora') = 'COM11' then
              Comunica := 'COM11'
            else if LeIni(Arq_Ini, 'Sistema', 'Porta Impressora') = 'COM12' then
              Comunica := 'COM12'
            else if LeIni(Arq_Ini, 'Sistema', 'Porta Impressora') = 'COM13' then
              Comunica := 'COM13'
            else if LeIni(Arq_Ini, 'Sistema', 'Porta Impressora') = 'COM14' then
              Comunica := 'COM14'
            else if LeIni(Arq_Ini, 'Sistema', 'Porta Impressora') = 'COM15' then
              Comunica := 'COM15'
            else if LeIni(Arq_Ini, 'Sistema', 'Porta Impressora') = 'LPT1' then
              Comunica := 'LPT1'
            else if LeIni(Arq_Ini, 'Sistema', 'Porta Impressora') = 'LPT2' then
              Comunica := 'LPT2'
            else if LeIni(Arq_Ini, 'Sistema', 'Porta Impressora') = 'LPT3' then
              Comunica := 'LPT3'
            else if LeIni(Arq_Ini, 'Sistema', 'Porta Impressora') = 'LPT4' then
              Comunica := 'LPT4';

            Comando := IniciaPorta(Pchar(Comunica));

            if Comando <> 1 then
              Application.MessageBox('Erro de comunicação com a impressora Bematech (Inicia Porta)', PChar(Msg_Title), mb_IconInformation);

//            ShellExecute(Handle, 'print', PChar(ExtractFilePath(ParamStr(0)) + 'Cupom.Txt'), nil, nil, SW_HIDE);
//            WinExec('NotePad.exe /p C:\showdelphi.txt', 0);

            AssignFile(MyFile, ExtractFilePath(ParamStr(0)) + 'Cupom.Txt');
            Reset(MyFile);

            Buffer := '';

            while not Eof(MyFile) do
            begin
              ReadLn(MyFile, S);

              Buffer  := S + Chr(13) + Chr(10);
              Comando := FormataTX(Buffer, 3, 0, 0, 0, 0);

              Application.ProcessMessages;
            end;

            CloseFile(MyFile);

            Comando := AcionaGuilhotina(1);

            if Comando <> 1 then
              Application.MessageBox('Erro de comunicação com a impressora Bematech (Guilhotina)', PChar(Msg_Title), mb_IconInformation);

            FechaPorta();
          end;
        end;

// aqui

        if LeIni(Arq_Ini, 'Sistema', 'Imp. Orçamento') = 'RDPrint' then
        begin
          if Application.MessageBox('Deseja imprimir o comprovante?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = idYes then
          begin
            InputString := InputBox(PChar(Msg_Title), 'Cópias', '1');

            AssignFile(MyFile, ExtractFilePath(ParamStr(0)) + 'Cupom.Txt');
            Rewrite(MyFile);

            for Copias := 1 to StrToInt(InputString) do
            begin
              if LeIni(Arq_Ini, 'Sistema', 'Linha Cabeçalho') <> '' then
                WriteLn(MyFile, LeIni(Arq_Ini, 'Sistema', 'Linha Cabeçalho'))
              else
              begin
                Meio    := ((48 - Length(FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString)) / 2);
                Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));

                Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ') + FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString);

                Meio    := ((48 - Length(FrmPrincipal.QEmpresa.FieldByName('TELEFONE').AsString)) / 2);
                Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));

                Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ') + FrmPrincipal.QEmpresa.FieldByName('TELEFONE').AsString);

                Meio    := ((48 - Length(FrmPrincipal.QEmpresa.FieldByName('ENDERECO').AsString)) / 2);
                Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));

                Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ') + FrmPrincipal.QEmpresa.FieldByName('ENDERECO').AsString);

                Meio    := ((48 - Length(FrmPrincipal.QEmpresa.FieldByName('BAIRRO').AsString + ' - ' + FrmPrincipal.QEmpresa.FieldByName('MUNICIPIO').AsString)) / 2);
                Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));

                Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ') + FrmPrincipal.QEmpresa.FieldByName('BAIRRO').AsString + ' - ' + FrmPrincipal.QEmpresa.FieldByName('MUNICIPIO').AsString);

                Meio    := ((48 - Length('CEP: ' + FrmPrincipal.QEmpresa.FieldByName('CEP').AsString + ' - ' + 'CNPJ: ' + FrmPrincipal.QEmpresa.FieldByName('CNPJ').AsString)) / 2);
                Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));

                Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ') + 'CEP: ' + FrmPrincipal.QEmpresa.FieldByName('CEP').AsString + ' - ' + 'CNPJ: ' + FrmPrincipal.QEmpresa.FieldByName('CNPJ').AsString);

                Meio    := ((48 - Length('Hora: ' + TimeToStr(now) + '  Data: ' + DateToStr(date))) / 2);
                Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));

                Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ') + 'Hora: ' + TimeToStr(now) + '  Data: ' + DateToStr(date));
                Writeln(MyFile, '------------------------------------------------');

                Meio    := ((48 - Length('Venda: ' + IntToStr(ID))) / 2);
                Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));

                Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ') + 'Venda: ' + IntToStr(ID));

                if StrToInt(Vendedor.Text) > 0 then
                begin
                  Meio    := ((48 - Length('At.: ' + Copy(QVendedor.FieldByName('NOME').AsString, 1, 15))) / 2);
                  Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));
                  Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ') + 'At.: ' + Copy(QVendedor.FieldByName('NOME').AsString, 1, 15));
                end
                else
                begin
                  Meio    := ((48 - Length('At.: ' + Copy(FrmPrincipal.StatusBar.Panels[4].Text, 11, 15))) / 2);
                  Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));
                  Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ') + 'At.: ' + Copy(FrmPrincipal.StatusBar.Panels[4].Text, 11, 15));
                end;
              end;
              Writeln(MyFile, '------------------------------------------------');
              Writeln(MyFile, 'Código / Produto          Valor   Qtde     Total');
              Writeln(MyFile, '------------------------------------------------');

              QLogs.First;
              while not QLogs.Eof do
              begin
                Writeln(MyFile, StrZero(QLogs.FieldByName('PRODUTO_ID').AsString, 6, 0) + ' / ' +
                                ForcaComprimento(QLogs.FieldByName('DESCRICAO').AsString, 13, ' ') +
                                ForcaComprimento(' ', 9 - Length(FormatFloat('#,##0.00', QLogs.FieldByName('VR_UNITARIO').AsFloat)), ' ') +
                                FormatFloat('#,##0.00', QLogs.FieldByName('VR_UNITARIO').AsFloat) + ' ' +
                                ForcaComprimento(' ', 7 - Length(FormatFloat('#,##0.000', QLogs.FieldByName('QUANTIDADE').AsFloat)), ' ') +
                                FormatFloat('#,##0.00', QLogs.FieldByName('QUANTIDADE').AsFloat) + ' ' +
                                ForcaComprimento(' ', 9 - Length(FormatFloat('#,##0.00', QLogs.FieldByName('VR_TOTAL').AsFloat)), ' ') +
                                FormatFloat('#,##0.00', QLogs.FieldByName('VR_TOTAL').AsFloat));

                Application.ProcessMessages;

                QLogs.Next;
              end;

              Writeln(MyFile, '                                       ---------');

              if (Desconto.Value > 0) or (Acrescimo.Value > 0) then
              begin
                Writeln(MyFile, ForcaComprimento('Sub-Total', 48 - Length(FormatFloat('#,##0.00', Vr_Venda)), ' ') + FormatFloat('#,##0.00', Vr_Venda));

                if Acrescimo.Value > 0 then
                  Writeln(MyFile, ForcaComprimento('Acrescimo', 48 - Length(FormatFloat('#,##0.00', Acrescimo.Value)), ' ') + FormatFloat('#,##0.00', Acrescimo.Value));

                if Desconto.Value > 0 then
                  Writeln(MyFile, ForcaComprimento('Desconto', 48 - Length(FormatFloat('#,##0.00', Desconto.Value)), ' ') + FormatFloat('#,##0.00', Desconto.Value));

                if (Desconto.Value > 0) or (Acrescimo.Value > 0) then
                  Writeln(MyFile, '                                       =========');

                Writeln(MyFile, ForcaComprimento('Total', 48 - Length(FormatFloat('#,##0.00', Vr_Venda + Acrescimo.Value - Desconto.Value)), ' ') + FormatFloat('#,##0.00', Vr_Venda + Acrescimo.Value - Desconto.Value));
              end
              else
                Writeln(MyFile, ForcaComprimento('Total', 48 - Length(FormatFloat('#,##0.00', Vr_Venda + Acrescimo.Value - Desconto.Value)), ' ') + FormatFloat('#,##0.00', Vr_Venda + Acrescimo.Value - Desconto.Value));

              if Dinheiro.Value > 0 then
              begin
                Writeln(MyFile, ForcaComprimento('Valor Pago', 48 - Length(FormatFloat('#,##0.00', Dinheiro.Value)), ' ') + FormatFloat('#,##0.00', Dinheiro.Value));
                Writeln(MyFile, ForcaComprimento('Troco', 48 - Length(FormatFloat('#,##0.00', (Dinheiro.Value - (Vr_Venda + Acrescimo.Value - Desconto.Value)))), ' ') + FormatFloat('#,##0.00', (Dinheiro.Value - (Vr_Venda + Acrescimo.Value - Desconto.Value))));
              end;

              Writeln(MyFile, '');
              Writeln(MyFile, '');
              Writeln(MyFile, 'Forma Pagamento: ' + QFormas.FieldByName('LEGENDA').AsString);
              Writeln(MyFile, '');
              Writeln(MyFile, '');
              Writeln(MyFile, '');

              if QFormas.FieldByName('TIPO_TRANSACAO').AsString = '2' then
              begin
                Writeln(MyFile, 'Cliente: ' + QCliente.FieldByName('NOME').AsString);
                Writeln(MyFile, 'CPF/CNPJ: ' + QCliente.FieldByName('CNPJ').AsString);
                Writeln(MyFile, 'Endereco: ' + QCliente.FieldByName('ENDERECO').AsString + ', ' + QCliente.FieldByName('NUMERO').AsString);
                Writeln(MyFile, 'Bairro/Cidade: ' + QCliente.FieldByName('BAIRRO').AsString + ', ' + QCliente.FieldByName('MUNICIPIO').AsString);
                Writeln(MyFile, 'CEP: ' + QCliente.FieldByName('CEP').AsString);
                Writeln(MyFile, '');

                QParcelas.Sql.Clear;
                QParcelas.Sql.Add('SELECT * FROM TRANSPARCELAS');
                QParcelas.Sql.Add('WHERE');
                QParcelas.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
                QParcelas.Sql.Add('AND (TIPO_TRANSACAO = :TIPO_TRANSACAO)');

                QParcelas.ParamByName('TRANSACAO_ID').AsInteger  := ID;
                QParcelas.ParamByName('TIPO_TRANSACAO').AsString := 'T';

                QParcelas.Prepare;
                QParcelas.Open;

                QParcelas.First;
                while not QParcelas.Eof do
                begin
                  Writeln(MyFile, 'Vencimento: ' + QParcelas.FieldByName('DT_VENCIMENTO').AsString +
                                                   '          Valor : ' + FormatFloat('#,##0.00', QParcelas.FieldByName('VALOR').AsFloat));
                  Application.ProcessMessages;
                  QParcelas.Next;
                end;

                Writeln(MyFile, '');
                Writeln(MyFile, '');
                Writeln(MyFile, '       _________________________________        ');
                Writeln(MyFile, '             Assinatura do Cliente              ');
              end
              else
              begin
                Writeln(MyFile, '       _________________________________        ');
                Writeln(MyFile, '             Assinatura do Cliente              ');
              end;

              for Linhas := 1 to StrToInt(LeIni(Arq_Ini, 'Sistema', 'Linhas')) do
                Writeln(MyFile, ' ');
            end;

            CloseFile(MyFile);

            AssignFile(MyFile, ExtractFilePath(ParamStr(0)) + 'Cupom.Txt');
            Reset(MyFile);

            Buffer := '';

            Lin := 1;

            RDprint1.Abrir;

            RDprint1.Impressora        := BOBINA;
            RDprint1.TamanhoQteLinhas  := 1;
            RDprint1.TamanhoQteColunas := 48;
            RDprint1.Acentuacao        := SemAcento;
            RDprint1.MostrarProgresso  := False;
            RDprint1.ImpASCII(01, 01, '27 64');

            while not Eof(MyFile) do
            begin
              ReadLn(MyFile, S);

              Buffer := S;

              RDprint1.Imp(Lin, 01, Buffer);

              Inc(Lin);

              Application.ProcessMessages;
            end;

            CloseFile(MyFile);

            RDprint1.Fechar;
          end;
        end;

// até aqui

        if LeIni(Arq_Ini, 'Sistema', 'Imp. Orçamento') = '40 Colunas' then
        begin
          if Application.MessageBox('Deseja imprimir o comprovante?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = idYes then
          begin
            InputString := InputBox(PChar(Msg_Title), 'Cópias', '1');

            for Copias := 1 to StrToInt(InputString) do
            begin
              if LeIni(Arq_Ini, 'Sistema', 'Path Impressora 40 Col.') <> '' then
                AssignFile(MyFile, LeIni(Arq_Ini, 'Sistema', 'Path Impressora 40 Col.'))
              else
                AssignFile(MyFile, 'LPT1');

              Rewrite(MyFile);

              if LeIni(Arq_Ini, 'Sistema', 'Linha Cabeçalho') <> '' then
                WriteLn(MyFile, LeIni(Arq_Ini, 'Sistema', 'Linha Cabeçalho'))
              else
              begin
                Writeln(MyFile, FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString);
                Writeln(MyFile, FrmPrincipal.QEmpresa.FieldByName('ENDERECO').AsString);
                Writeln(MyFile, 'Telefone: ' + FrmPrincipal.QEmpresa.FieldByName('TELEFONE').AsString);
                Writeln(MyFile, '               O R C A M E N T O                ');
                Writeln(MyFile, '               ====  ===  ======                ');
              end;

              Writeln(MyFile, '------------------------------------------------');

              if QFormas.FieldByName('TIPO_TRANSACAO').AsString = '2' then
                Writeln(MyFile, 'Cliente: ' + StrZero(QCliente.FieldByName('CLIENTE_ID').AsString, 5, 0) + '-' + Copy(QCliente.FieldByName('NOME').AsString, 1, 33))
              else
                Writeln(MyFile, QFormas.FieldByName('LEGENDA').AsString);

              Writeln(MyFile, '------------------------------------------------');
              Writeln(MyFile, DateToStr(date) + ' - ' + TimeToStr(now) + ' - ' + Copy(QVendedor.FieldByName('NOME').AsString, 1, 15));
              Writeln(MyFile, '     Qtde Descricao                        Total');

              QLogs.First;
              while not QLogs.Eof do
              begin
                Writeln(MyFile, ForcaComprimento(' ', 9 - Length(FormatFloat('#,##0.000', QLogs.FieldByName('QUANTIDADE').AsFloat)), ' ') +
                                FormatFloat('#,##0.000', QLogs.FieldByName('QUANTIDADE').AsFloat) + ' ' +
                                StrZero(QLogs.FieldByName('PRODUTO_ID').AsString, 6, 0) + '-' +
                                ForcaComprimento(QLogs.FieldByName('DESCRICAO').AsString, 30 - Length(FormatFloat('#,##0.00', QLogs.FieldByName('VR_TOTAL').AsFloat)), ' ') + ' ' +
                                FormatFloat('#,##0.00', QLogs.FieldByName('VR_TOTAL').AsFloat));

                Application.ProcessMessages;
                QLogs.Next;
              end;

              Writeln(MyFile, '                                       ---------');

              if (Desconto.Value > 0) or (Acrescimo.Value > 0) then
              begin
                Writeln(MyFile, ForcaComprimento('Sub-Total', 48 - Length(FormatFloat('#,##0.00', Vr_Venda)), ' ') + FormatFloat('#,##0.00', Vr_Venda));

                if Acrescimo.Value > 0 then
                  Writeln(MyFile, ForcaComprimento('Acrescimo', 48 - Length(FormatFloat('#,##0.00', Acrescimo.Value)), ' ') + FormatFloat('#,##0.00', Acrescimo.Value));

                if Desconto.Value > 0 then
                  Writeln(MyFile, ForcaComprimento('Desconto', 48 - Length(FormatFloat('#,##0.00', Desconto.Value)), ' ') + FormatFloat('#,##0.00', Desconto.Value));

                if (Desconto.Value > 0) or (Acrescimo.Value > 0) then
                  Writeln(MyFile, '                                       =========');

                Writeln(MyFile, ForcaComprimento('Total', 48 - Length(FormatFloat('#,##0.00', Vr_Venda + Acrescimo.Value - Desconto.Value)), ' ') + FormatFloat('#,##0.00', Vr_Venda + Acrescimo.Value - Desconto.Value));
              end
              else
                Writeln(MyFile, ForcaComprimento('Total', 48 - Length(FormatFloat('#,##0.00', Vr_Venda + Acrescimo.Value - Desconto.Value)), ' ') + FormatFloat('#,##0.00', Vr_Venda + Acrescimo.Value - Desconto.Value));

              if Dinheiro.Value > 0 then
              begin
                Writeln(MyFile, ForcaComprimento('Dinheiro', 48 - Length(FormatFloat('#,##0.00', Dinheiro.Value)), ' ') + FormatFloat('#,##0.00', Dinheiro.Value));
                Writeln(MyFile, ForcaComprimento('Troco', 48 - Length(FormatFloat('#,##0.00', (Dinheiro.Value - (Vr_Venda + Acrescimo.Value - Desconto.Value)))), ' ') + FormatFloat('#,##0.00', (Dinheiro.Value - (Vr_Venda + Acrescimo.Value - Desconto.Value))));
              end;

              Writeln(MyFile, '');
              Writeln(MyFile, '');
              Writeln(MyFile, '');

              if QFormas.FieldByName('TIPO_TRANSACAO').AsString = '2' then
              begin
                QParcelas.Sql.Clear;
                QParcelas.Sql.Add('SELECT * FROM TRANSPARCELAS');
                QParcelas.Sql.Add('WHERE');
                QParcelas.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
                QParcelas.Sql.Add('AND (TIPO_TRANSACAO = :TIPO_TRANSACAO)');

                QParcelas.ParamByName('TRANSACAO_ID').AsInteger  := ID;
                QParcelas.ParamByName('TIPO_TRANSACAO').AsString := 'T';

                QParcelas.Prepare;
                QParcelas.Open;

                QParcelas.First;
                while not QParcelas.Eof do
                begin
                  Writeln(MyFile, 'Vencimento: ' + QParcelas.FieldByName('DT_VENCIMENTO').AsString +
                                                   '          Valor : ' + FormatFloat('#,##0.00', QParcelas.FieldByName('VALOR').AsFloat));
                  Application.ProcessMessages;
                  QParcelas.Next;
                end;

                Writeln(MyFile, '');
                Writeln(MyFile, '');
                Writeln(MyFile, '       _________________________________        ');
                Writeln(MyFile, '             Assinatura do Cliente              ');
              end;

              for Linhas := 1 to StrToInt(LeIni(Arq_Ini, 'Sistema', 'Linhas')) do
                Writeln(MyFile, ' ');

              CloseFile(MyFile);
            end;
          end;
        end;

        if LeIni(Arq_Ini, 'Sistema', 'Imp. Orçamento') = 'Normal' then
        begin
          QRel.Sql.Clear;
          QRel.Sql.Add('SELECT * FROM TRANSACOES');
          QRel.Sql.Add('WHERE');
          QRel.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

          QRel.ParamByName('TRANSACAO_ID').AsInteger := ID;

          QRel.Prepare;
          QRel.Open;

          QLogs.Sql.Clear;
          QLogs.Sql.Add('SELECT * FROM LOG_ITENS');
          QLogs.Sql.Add('WHERE');
          QLogs.Sql.Add('(CUPOM = :CUPOM)');

          QLogs.ParamByName('CUPOM').AsString := SerialNum('C');

          QLogs.Prepare;
          QLogs.Open;

          Cupom.PreviewModal;
        end;
      end;

      if QFormas.FieldByName('TIPO_TRANSACAO').AsString = '2' then
      begin
        QRel.Sql.Clear;
        QRel.Sql.Add('UPDATE TRANSPARCELAS SET TIPO_TRANSACAO = :TIPO_TRANSACAO');
        QRel.Sql.Add('WHERE');
        QRel.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
        QRel.Sql.Add('AND (TIPO_TRANSACAO = :TIPO_TRANS)');

        QRel.ParamByName('TIPO_TRANSACAO').AsString := 'T';
        QRel.ParamByName('TRANSACAO_ID').AsInteger  := ID;
        QRel.ParamByName('TIPO_TRANS').AsString     := 'U';

        QRel.Prepare;
        QRel.ExecSql;


      end;

      QLogs.Sql.Clear;
      QLogs.Sql.Add('DELETE FROM LOG_ITENS');
      QLogs.Sql.Add('WHERE');
      QLogs.Sql.Add('(CUPOM = :CUPOM)');

      QLogs.ParamByName('CUPOM').AsString := SerialNum('C');

      QLogs.Prepare;
      QLogs.ExecSql;



      QLogs.Sql.Clear;
      QLogs.Sql.Add('UPDATE ORCAMENTOS SET COMANDA = :NEW_COMANDA');
      QLogs.Sql.Add('WHERE');
      QLogs.Sql.Add('(COMANDA = :COMANDA)');
      QLogs.Sql.Add('AND (EMPRESA_ID = :EMPRESA_ID)');

      QLogs.ParamByName('NEW_COMANDA').AsString := 'A-' + Pr_Venda;
      QLogs.ParamByName('COMANDA').AsString     := Pr_Venda;
      QLogs.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;

      QLogs.Prepare;
      QLogs.ExecSql;



      QLogs.Sql.Clear;
      QLogs.Sql.Add('UPDATE ORCAMENTOS SET TRANSACAO_ID = :TRANSACAO_ID');
      QLogs.Sql.Add('WHERE');
      QLogs.Sql.Add('(ORCAMENTO_ID = :ORCAMENTO_ID)');
      QLogs.Sql.Add('AND (EMPRESA_ID = :EMPRESA_ID)');

      QLogs.ParamByName('TRANSACAO_ID').AsInteger := ID;
      QLogs.ParamByName('ORCAMENTO_ID').AsInteger := Id_Orc;
      QLogs.ParamByName('EMPRESA_ID').AsInteger   := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;

      QLogs.Prepare;
      QLogs.ExecSql;



      ModalResult := mrOk;
    end;
  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;

procedure TFrmPagamento.btnFinalizadoraClick(Sender: TObject);
begin
  try
    Finalizadora.Value := GetConsulta('FORMAS', 0, 0, StrToInt(Finalizadora.Text));
  except
    Finalizadora.Value := GetConsulta('FORMAS', 0, 0, 0);
  end;
end;

procedure TFrmPagamento.btnVendedorClick(Sender: TObject);
begin
  try
    Vendedor.Value := GetConsulta('PESSOAL', 0, 0, StrToInt(Vendedor.Text));
  except
    Vendedor.Value := GetConsulta('PESSOAL', 0, 0, 0);
  end;
end;

procedure TFrmPagamento.CFOPKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = CFOP) then
    CFOP.Text := GetConsulta_CFOP(CFOP.Text);

  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmPagamento.ClienteExit(Sender: TObject);
begin
  DetailSearch('Cliente');
end;

procedure TFrmPagamento.FinalizadoraExit(Sender: TObject);
begin
  DetailSearch('Finalizadora');
end;

procedure TFrmPagamento.FinalizadoraKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = Finalizadora) then
    btnFinalizadoraClick(Self);

  if (Key = Vk_F7) and (Sender = Cliente) then
    btnClienteClick(Self);

  if (Key = Vk_F7) and (Sender = Vendedor) then
    btnVendedorClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmPagamento.FormCreate(Sender: TObject);
begin
// h = 333, w = 417
  Label13.Caption  := 'Vr. Venda: ' + FormatFloat('#,##0.00', Vr_Venda);
  Serie.Text       := '01';
  Entrada.MaxValue := Vr_Venda - 1;

  if (LeIni(ExtractFilePath(ParamStr(0)) + 'NFe.Ini', 'NFe', 'NFe') = 'True') or (LeIni(Arq_Ini, 'Sistema', 'Nf. Pré-Impressa') = 'True') then
  begin
    CFOP.Enabled   := True;
    Serie.Enabled  := True;
    Modelo.Enabled := True;
  end
  else
  begin
    CFOP.Enabled   := False;
    Serie.Enabled  := False;
    Modelo.Enabled := False;
  end;
end;

procedure TFrmPagamento.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if QCliente.IsEmpty then
  begin
    QRLabel21.Enabled := True;
    QRLabel22.Enabled := True;
    QRLabel23.Enabled := True;

    QRLabel21.Caption := Nome_Cliente.Text;
    QRLabel22.Caption := Endereco_Cliente.Text;
    QRLabel23.Caption := Bairro_Cliente.Text;
  end
  else
  begin
    QRLabel21.Enabled := False;
    QRLabel22.Enabled := False;
    QRLabel23.Enabled := False;
  end;
end;

procedure TFrmPagamento.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  Vr_Acrescimo.Caption := FormatFloat('#,##0.00', Acrescimo.Value);
  Vr_Desconto.Caption  := FormatFloat('#,##0.00', Desconto.Value);
  Vr_Compra.Caption    := FormatFloat('#,##0.00', Vr_Venda + Acrescimo.Value - Desconto.Value);
end;

procedure TFrmPagamento.VendedorExit(Sender: TObject);
begin
  DetailSearch('Vendedor');
end;

end.
