unit UFechamento_Periodo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, rxCurrEdit, rxToolEdit, Buttons, DBCtrls,
  DB, IBCustomDataSet, IBQuery, QuickRpt, QRCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids;

type
  TFrmFechamento_Periodo = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    Dtmen: TDateEdit;
    Caixa_Banco: TCurrencyEdit;
    Dtmai: TDateEdit;
    btnCaixa_Banco: TSpeedButton;
    DataBanco: TDataSource;
    DBText1: TDBText;
    Extrato: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    QRDBText3: TQRDBText;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    Cabec: TQRLabel;
    QRSysData2: TQRSysData;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText8: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabel7: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText4: TQRDBText;
    QRShape4: TQRShape;
    QRLabel6: TQRLabel;
    QRDBText6: TQRDBText;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRGroup1: TQRGroup;
    QRDBText2: TQRDBText;
    QRBand1: TQRBand;
    QRExpr5: TQRExpr;
    QRShape2: TQRShape;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    Despesa: TCheckBox;
    Receita: TCheckBox;
    Saldo_Anterior: TCheckBox;
    QRLabel10: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape6: TQRShape;
    DBLookupComboBox1: TDBLookupComboBox;
    Label3: TLabel;
    DataFinalizadora: TDataSource;
    Label4: TLabel;
    Recebimento: TCheckBox;
    Pagamento: TCheckBox;
    VendaNfe: TCheckBox;
    Compra: TCheckBox;
    VendaEcf: TCheckBox;
    QRDBText5: TQRDBText;
    Chk_Devolucoes: TCheckBox;
    QBanco: TFDQuery;
    QRel: TFDQuery;
    QFinalizadora: TFDQuery;
    QArq: TFDQuery;
    vendanfce: TCheckBox;
    Fdac_Temp: TFDMemTable;
    DBGrid1: TDBGrid;
    Data_Banco: TDataSource;
    QSearch: TFDQuery;
    Chk_Caixas: TCheckBox;
    Memo1: TMemo;
    BitBtn1: TBitBtn;
    QConsulta: TFDQuery;
    procedure btnRetornaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnCaixa_BancoClick(Sender: TObject);
    procedure Caixa_BancoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Caixa_BancoChange(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DtmenEnter(Sender: TObject);
    procedure SummaryBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ExtratoBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure DBLookupComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure ReceitaClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Chk_CaixasClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SearchBanco;
    Procedure Recupera_Saldos;
    function exibesql(Q: TFDQuery): string;
  end;

var
  FrmFechamento_Periodo: TFrmFechamento_Periodo;
  Saldo, Sd: Real;

implementation

uses
  UData, UConsulta, UPrincipal,URecupera_Saldos;

{$R *.dfm}

function TFrmFechamento_Periodo.exibesql(Q: TFDQuery): string;
var
  i: Integer;
  r: string;
begin
  Result := Q.SQL.Text;
  for i := 0 to Q.Params.Count - 1 do
  begin
    case Q.Params.Items[i].DataType of
      ftString, ftDate, ftDateTime: r := QuotedStr(Q.Params[i].AsString);
    else
      r := Q.Params[i].AsString;
    end;
    Result := StringReplace(Result, ':' + Q.Params.Items[i].Name, r,[rfReplaceAll, rfIgnoreCase]);
  end;
end;



procedure TFrmFechamento_Periodo.SearchBanco;
begin
  QBanco.Close;
  QBanco.ParamByName('BANCO_ID').AsInteger   := StrToInt(Caixa_Banco.Text);
  QBanco.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  QBanco.Prepare;
  QBanco.Open;

  if QBanco.IsEmpty then
    btnExecuta.Enabled := False
  else
    btnExecuta.Enabled := True;
end;
procedure TFrmFechamento_Periodo.Recupera_Saldos;
begin
 try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    QArq.Sql.Clear;
    QArq.Sql.Add('DELETE FROM RAZAO');
    QArq.Sql.Add('WHERE');
    QArq.Sql.Add('(TIPO_TRANSACAO <> :TIPO_TRANSACAO)');
    QArq.Sql.Add('AND (DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');

    QArq.ParamByName('TIPO_TRANSACAO').AsString := 'M';
    QArq.ParamByName('DT_INICIAL').AsDateTime   := Dtmen.Date;
    QArq.ParamByName('DT_FINAL').AsDateTime     := Dtmai.Date;

    QArq.Prepare;
    QArq.ExecSql;



    // Transação Entre Bancos (DB Destino - CR Origem)

    QArq.Sql.Clear;
    QArq.Sql.Add('INSERT INTO RAZAO(TRANSACAO_ID, TIPO_TRANSACAO, DT_TRANS, DT_MOVIMENTO, CONTA_DB, CONTA_CR, EMPRESA_ID, C_CUSTO_ID, TPCTB, HISTORICO, VALOR, AUTORIZ_ID, NUM_DOC)');
    QArq.Sql.Add('SELECT TRANSACOES.TRANSACAO_ID, :TIPO_TRANSACAO, TRANSACOES.DT_TRANS, TRANSACOES.DT_MOVIMENTO, BCO_DEBITO.COD_CONTABIL, BCO_CREDITO.COD_CONTABIL, TRANSACOES.EMPRESA_ID, TRANSACOES.C_CUSTO_ID, ' +
                 'TRANSACOES.TPCTB, TRANSACOES.HISTORICO, TRANSACOES.VALOR, TRANSACOES.AUTORIZ_ID, TRANSACOES.NUM_DOC');
    QArq.Sql.Add('FROM TRANSACOES');
    QArq.Sql.Add('INNER JOIN BANCOS BCO_DEBITO');
    QArq.Sql.Add('ON (TRANSACOES.BANCO_ID_TRANSF = BCO_DEBITO.BANCO_ID)');
    QArq.Sql.Add('INNER JOIN BANCOS BCO_CREDITO');
    QArq.Sql.Add('ON (TRANSACOES.BANCO_ID = BCO_CREDITO.BANCO_ID)');
    QArq.Sql.Add('WHERE');
    QArq.Sql.Add('(TRANSACOES.CONDUTA = :CONDUTA)');
    QArq.Sql.Add('AND (TRANSACOES.DEPTO = :DEPTO)');
    QArq.Sql.Add('AND (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');

    QArq.ParamByName('TIPO_TRANSACAO').AsString := 'T';
    QArq.ParamByName('CONDUTA').AsString        := '02';
    QArq.ParamByName('DEPTO').AsString          := '04';
    QArq.ParamByName('DT_INICIAL').AsDateTime   := Dtmen.Date;
    QArq.ParamByName('DT_FINAL').AsDateTime     := Dtmai.Date;

    QArq.Prepare;
    QArq.ExecSql;



    // Crédito a Vista (DB Cx/Bco - CR Cta.)

    QArq.Sql.Clear;
    QArq.Sql.Add('INSERT INTO RAZAO(TRANSACAO_ID, TIPO_TRANSACAO, DT_TRANS, DT_MOVIMENTO, CONTA_DB, CONTA_CR, EMPRESA_ID, C_CUSTO_ID, TPCTB, HISTORICO, VALOR, AUTORIZ_ID, NUM_DOC, FLUXO_CAIXA_ID)');
    QArq.Sql.Add('SELECT TRANSACOES.TRANSACAO_ID, :TIPO_TRANSACAO, TRANSACOES.DT_TRANS, TRANSACOES.DT_MOVIMENTO, BANCOS.COD_CONTABIL, TABELAS.COD_CONTABIL, TRANSACOES.EMPRESA_ID, TRANSACOES.C_CUSTO_ID, ' +
                 'TRANSACOES.TPCTB, TRANSACOES.HISTORICO, TRANSACOES.VALOR, TRANSACOES.AUTORIZ_ID, TRANSACOES.NUM_DOC, TRANSACOES.FLUXO_CAIXA_ID');
    QArq.Sql.Add('FROM TRANSACOES');
    QArq.Sql.Add('INNER JOIN BANCOS');
    QArq.Sql.Add('ON (TRANSACOES.BANCO_ID = BANCOS.BANCO_ID)');
    QArq.Sql.Add('INNER JOIN TABELAS');
    QArq.Sql.Add('ON (TRANSACOES.CONTA_ID = TABELAS.TABELA_ID AND TABELAS.TIPO_TABELA = :TIPO_TABELA)');
    QArq.Sql.Add('WHERE');
    QArq.Sql.Add('(TRANSACOES.CONDUTA = :CONDUTA)');
    QArq.Sql.Add('AND (TRANSACOES.DEPTO = :DEPTO)');
    QArq.Sql.Add('AND (TRANSACOES.COND_PAGTO = :COND_PAGTO)');
    QArq.Sql.Add('AND (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');

    QArq.ParamByName('TIPO_TRANSACAO').AsString := 'T';
    QArq.ParamByName('TIPO_TABELA').AsString    := '4';
    QArq.ParamByName('CONDUTA').AsString        := '01';
    QArq.ParamByName('DEPTO').AsString          := '03';
    QArq.ParamByName('COND_PAGTO').AsString     := 'A VISTA';
    QArq.ParamByName('DT_INICIAL').AsDateTime   := Dtmen.Date;
    QArq.ParamByName('DT_FINAL').AsDateTime     := Dtmai.Date;

    QArq.Prepare;
    QArq.ExecSql;



    // Crédito a Prazo (DB Cliente - CR Cta.)

    QArq.Sql.Clear;
    QArq.Sql.Add('INSERT INTO RAZAO(TRANSACAO_ID, TIPO_TRANSACAO, DT_TRANS, DT_MOVIMENTO, CONTA_DB, CONTA_CR, EMPRESA_ID, C_CUSTO_ID, TPCTB, HISTORICO, VALOR, AUTORIZ_ID, NUM_DOC)');
    QArq.Sql.Add('SELECT TRANSACOES.TRANSACAO_ID, :TIPO_TRANSACAO, TRANSACOES.DT_TRANS, TRANSACOES.DT_MOVIMENTO, CLIENTES.COD_CONTABIL, TABELAS.COD_CONTABIL, TRANSACOES.EMPRESA_ID, TRANSACOES.C_CUSTO_ID, ' +
                 'TRANSACOES.TPCTB, TRANSACOES.HISTORICO, TRANSACOES.VALOR, TRANSACOES.AUTORIZ_ID, TRANSACOES.NUM_DOC');
    QArq.Sql.Add('FROM TRANSACOES');
    QArq.Sql.Add('INNER JOIN CLIENTES');
    QArq.Sql.Add('ON (TRANSACOES.CLIENTE_ID = CLIENTES.CLIENTE_ID)');
    QArq.Sql.Add('INNER JOIN TABELAS');
    QArq.Sql.Add('ON (TRANSACOES.CONTA_ID = TABELAS.TABELA_ID AND TABELAS.TIPO_TABELA = :TIPO_TABELA)');
    QArq.Sql.Add('WHERE');
    QArq.Sql.Add('(TRANSACOES.CONDUTA = :CONDUTA)');
    QArq.Sql.Add('AND (TRANSACOES.DEPTO = :DEPTO)');
    QArq.Sql.Add('AND (TRANSACOES.COND_PAGTO = :COND_PAGTO)');
    QArq.Sql.Add('AND (TRANSACOES.BALANCO <> :BALANCO)');
    QArq.Sql.Add('AND (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');

    QArq.ParamByName('TIPO_TRANSACAO').AsString := 'T';
    QArq.ParamByName('TIPO_TABELA').AsString    := '4';
    QArq.ParamByName('CONDUTA').AsString        := '01';
    QArq.ParamByName('DEPTO').AsString          := '03';
    QArq.ParamByName('COND_PAGTO').AsString     := 'A PRAZO';
    QArq.ParamByName('BALANCO').AsString        := 'AGRUPADO';
    QArq.ParamByName('DT_INICIAL').AsDateTime   := Dtmen.Date;
    QArq.ParamByName('DT_FINAL').AsDateTime     := Dtmai.Date;

    QArq.Prepare;
    QArq.ExecSql;



    // Recebimento c/ Desconto (DB Cx/Bco - CR Cliente) - (DB Cta. - CR Cliente)

    QArq.Sql.Clear;
    QArq.Sql.Add('INSERT INTO RAZAO(TRANSACAO_ID, TIPO_TRANSACAO, DT_TRANS, DT_MOVIMENTO, CONTA_DB, CONTA_CR, EMPRESA_ID, C_CUSTO_ID, TPCTB, HISTORICO, VALOR, AUTORIZ_ID, NUM_DOC, FLUXO_CAIXA_ID)');
    QArq.Sql.Add('SELECT TRANSACOES.TRANSACAO_ID, :TIPO_TRANSACAO, TRANSACOES.DT_TRANS, TRANSACOES.DT_MOVIMENTO, BANCOS.COD_CONTABIL, CLIENTES.COD_CONTABIL, TRANSACOES.EMPRESA_ID, TRANSACOES.C_CUSTO_ID, ' +
                 'TRANSACOES.TPCTB, TRANSACOES.HISTORICO, TRANSACOES.VALOR, TRANSACOES.AUTORIZ_ID, TRANSACOES.NUM_DOC, TRANSACOES.FLUXO_CAIXA_ID');
    QArq.Sql.Add('FROM TRANSACOES');
    QArq.Sql.Add('INNER JOIN BANCOS');
    QArq.Sql.Add('ON (TRANSACOES.BANCO_ID = BANCOS.BANCO_ID)');
    QArq.Sql.Add('INNER JOIN CLIENTES');
    QArq.Sql.Add('ON (TRANSACOES.CLIENTE_ID = CLIENTES.CLIENTE_ID)');
    QArq.Sql.Add('WHERE');
    QArq.Sql.Add('(TRANSACOES.CONDUTA = :CONDUTA)');
    QArq.Sql.Add('AND (TRANSACOES.SERIE = :SERIE)');
    QArq.Sql.Add('AND (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');

    QArq.ParamByName('TIPO_TRANSACAO').AsString := 'T';
    QArq.ParamByName('CONDUTA').AsString        := '07';
    QArq.ParamByName('SERIE').AsString          := 'D';
    QArq.ParamByName('DT_INICIAL').AsDateTime   := Dtmen.Date;
    QArq.ParamByName('DT_FINAL').AsDateTime     := Dtmai.Date;

    QArq.Prepare;
    QArq.ExecSql;



    QArq.Sql.Clear;
    QArq.Sql.Add('INSERT INTO RAZAO(TRANSACAO_ID, TIPO_TRANSACAO, DT_TRANS, DT_MOVIMENTO, CONTA_DB, CONTA_CR, EMPRESA_ID, C_CUSTO_ID, TPCTB, HISTORICO, VALOR, AUTORIZ_ID, NUM_DOC)');
    QArq.Sql.Add('SELECT TRANSACOES.TRANSACAO_ID, :TIPO_TRANSACAO, TRANSACOES.DT_TRANS, TRANSACOES.DT_MOVIMENTO, TABELAS.COD_CONTABIL, CLIENTES.COD_CONTABIL, TRANSACOES.EMPRESA_ID, TRANSACOES.C_CUSTO_ID, ' +
                 'TRANSACOES.TPCTB, TRANSACOES.COMPLEMENTO, (TRANSACOES.VALOR_PARCELA - TRANSACOES.VALOR), TRANSACOES.AUTORIZ_ID, TRANSACOES.NUM_DOC');
    QArq.Sql.Add('FROM TRANSACOES');
    QArq.Sql.Add('INNER JOIN TABELAS');
    QArq.Sql.Add('ON (TRANSACOES.CONTA_ID = TABELAS.TABELA_ID AND TABELAS.TIPO_TABELA = :TIPO_TABELA)');
    QArq.Sql.Add('INNER JOIN CLIENTES');
    QArq.Sql.Add('ON (TRANSACOES.CLIENTE_ID = CLIENTES.CLIENTE_ID)');
    QArq.Sql.Add('WHERE');
    QArq.Sql.Add('(TRANSACOES.CONDUTA = :CONDUTA)');
    QArq.Sql.Add('AND (TRANSACOES.SERIE = :SERIE)');
    QArq.Sql.Add('AND (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');

    QArq.ParamByName('TIPO_TRANSACAO').AsString := 'T';
    QArq.ParamByName('TIPO_TABELA').AsString    := '4';
    QArq.ParamByName('CONDUTA').AsString        := '07';
    QArq.ParamByName('SERIE').AsString          := 'D';
    QArq.ParamByName('DT_INICIAL').AsDateTime   := Dtmen.Date;
    QArq.ParamByName('DT_FINAL').AsDateTime     := Dtmai.Date;

    QArq.Prepare;
    QArq.ExecSql;



    // Recebimento c/ Juros (DB Cx/Bco - CR Cliente) - (DB Cx/Bco - CR Cta.)

    QArq.Sql.Clear;
    QArq.Sql.Add('INSERT INTO RAZAO(TRANSACAO_ID, TIPO_TRANSACAO, DT_TRANS, DT_MOVIMENTO, CONTA_DB, CONTA_CR, EMPRESA_ID, C_CUSTO_ID, TPCTB, HISTORICO, VALOR, AUTORIZ_ID, NUM_DOC, FLUXO_CAIXA_ID)');
    QArq.Sql.Add('SELECT TRANSACOES.TRANSACAO_ID, :TIPO_TRANSACAO, TRANSACOES.DT_TRANS, TRANSACOES.DT_MOVIMENTO, BANCOS.COD_CONTABIL, CLIENTES.COD_CONTABIL, TRANSACOES.EMPRESA_ID, TRANSACOES.C_CUSTO_ID, ' +
                 'TRANSACOES.TPCTB, TRANSACOES.HISTORICO, TRANSACOES.VALOR_PARCELA, TRANSACOES.AUTORIZ_ID, TRANSACOES.NUM_DOC, TRANSACOES.FLUXO_CAIXA_ID');
    QArq.Sql.Add('FROM TRANSACOES');
    QArq.Sql.Add('INNER JOIN BANCOS');
    QArq.Sql.Add('ON (TRANSACOES.BANCO_ID = BANCOS.BANCO_ID)');
    QArq.Sql.Add('INNER JOIN CLIENTES');
    QArq.Sql.Add('ON (TRANSACOES.CLIENTE_ID = CLIENTES.CLIENTE_ID)');
    QArq.Sql.Add('WHERE');
    QArq.Sql.Add('(TRANSACOES.CONDUTA = :CONDUTA)');
    QArq.Sql.Add('AND (TRANSACOES.SERIE = :SERIE)');
    QArq.Sql.Add('AND (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');

    QArq.ParamByName('TIPO_TRANSACAO').AsString := 'T';
    QArq.ParamByName('CONDUTA').AsString        := '07';
    QArq.ParamByName('SERIE').AsString          := 'J';
    QArq.ParamByName('DT_INICIAL').AsDateTime   := Dtmen.Date;
    QArq.ParamByName('DT_FINAL').AsDateTime     := Dtmai.Date;

    QArq.Prepare;
    QArq.ExecSql;



    QArq.Sql.Clear;
    QArq.Sql.Add('INSERT INTO RAZAO(TRANSACAO_ID, TIPO_TRANSACAO, DT_TRANS, DT_MOVIMENTO, CONTA_DB, CONTA_CR, EMPRESA_ID, C_CUSTO_ID, TPCTB, HISTORICO, VALOR, AUTORIZ_ID, NUM_DOC, FLUXO_CAIXA_ID)');
    QArq.Sql.Add('SELECT TRANSACOES.TRANSACAO_ID, :TIPO_TRANSACAO, TRANSACOES.DT_TRANS, TRANSACOES.DT_MOVIMENTO, BANCOS.COD_CONTABIL, TABELAS.COD_CONTABIL, TRANSACOES.EMPRESA_ID, TRANSACOES.C_CUSTO_ID, ' +
                 'TRANSACOES.TPCTB, TRANSACOES.COMPLEMENTO, (TRANSACOES.VALOR - TRANSACOES.VALOR_PARCELA), TRANSACOES.AUTORIZ_ID, TRANSACOES.NUM_DOC, TRANSACOES.FLUXO_CAIXA_ID');
    QArq.Sql.Add('FROM TRANSACOES');
    QArq.Sql.Add('INNER JOIN BANCOS');
    QArq.Sql.Add('ON (TRANSACOES.BANCO_ID = BANCOS.BANCO_ID)');
    QArq.Sql.Add('INNER JOIN TABELAS');
    QArq.Sql.Add('ON (TRANSACOES.CONTA_ID = TABELAS.TABELA_ID AND TABELAS.TIPO_TABELA = :TIPO_TABELA)');
    QArq.Sql.Add('WHERE');
    QArq.Sql.Add('(TRANSACOES.CONDUTA = :CONDUTA)');
    QArq.Sql.Add('AND (TRANSACOES.SERIE = :SERIE)');
    QArq.Sql.Add('AND (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');

    QArq.ParamByName('TIPO_TRANSACAO').AsString := 'T';
    QArq.ParamByName('TIPO_TABELA').AsString    := '4';
    QArq.ParamByName('CONDUTA').AsString        := '07';
    QArq.ParamByName('SERIE').AsString          := 'J';
    QArq.ParamByName('DT_INICIAL').AsDateTime   := Dtmen.Date;
    QArq.ParamByName('DT_FINAL').AsDateTime     := Dtmai.Date;

    QArq.Prepare;
    QArq.ExecSql;



    // Recebimento Integral (DB Cx/Bco - CR Cliente)

    QArq.Sql.Clear;
    QArq.Sql.Add('INSERT INTO RAZAO(TRANSACAO_ID, TIPO_TRANSACAO, DT_TRANS, DT_MOVIMENTO, CONTA_DB, CONTA_CR, EMPRESA_ID, C_CUSTO_ID, TPCTB, HISTORICO, VALOR, AUTORIZ_ID, NUM_DOC, FLUXO_CAIXA_ID)');
    QArq.Sql.Add('SELECT TRANSACOES.TRANSACAO_ID, :TIPO_TRANSACAO, TRANSACOES.DT_TRANS, TRANSACOES.DT_MOVIMENTO, BANCOS.COD_CONTABIL, CLIENTES.COD_CONTABIL, TRANSACOES.EMPRESA_ID, TRANSACOES.C_CUSTO_ID, ' +
                 'TRANSACOES.TPCTB, TRANSACOES.HISTORICO, TRANSACOES.VALOR, TRANSACOES.AUTORIZ_ID, TRANSACOES.NUM_DOC, TRANSACOES.FLUXO_CAIXA_ID');
    QArq.Sql.Add('FROM TRANSACOES');
    QArq.Sql.Add('INNER JOIN BANCOS');
    QArq.Sql.Add('ON (TRANSACOES.BANCO_ID = BANCOS.BANCO_ID)');
    QArq.Sql.Add('INNER JOIN CLIENTES');
    QArq.Sql.Add('ON (TRANSACOES.CLIENTE_ID = CLIENTES.CLIENTE_ID)');
    QArq.Sql.Add('WHERE');
    QArq.Sql.Add('(TRANSACOES.CONDUTA = :CONDUTA)');
    QArq.Sql.Add('AND (TRANSACOES.SERIE = :SERIE)');
    QArq.Sql.Add('AND (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');

    QArq.ParamByName('TIPO_TRANSACAO').AsString := 'T';
    QArq.ParamByName('CONDUTA').AsString        := '07';
    QArq.ParamByName('SERIE').AsString          := 'N';
    QArq.ParamByName('DT_INICIAL').AsDateTime   := Dtmen.Date;
    QArq.ParamByName('DT_FINAL').AsDateTime     := Dtmai.Date;

    QArq.Prepare;
    QArq.ExecSql;



    // Recebimento Parcial (DB Cx/Bco - CR Cliente)

    QArq.Sql.Clear;
    QArq.Sql.Add('INSERT INTO RAZAO(TRANSACAO_ID, TIPO_TRANSACAO, DT_TRANS, DT_MOVIMENTO, CONTA_DB, CONTA_CR, EMPRESA_ID, C_CUSTO_ID, TPCTB, HISTORICO, VALOR, AUTORIZ_ID, NUM_DOC, FLUXO_CAIXA_ID)');
    QArq.Sql.Add('SELECT TRANSACOES.TRANSACAO_ID, :TIPO_TRANSACAO, TRANSACOES.DT_TRANS, TRANSACOES.DT_MOVIMENTO, BANCOS.COD_CONTABIL, CLIENTES.COD_CONTABIL, TRANSACOES.EMPRESA_ID, TRANSACOES.C_CUSTO_ID, ' +
                 'TRANSACOES.TPCTB, TRANSACOES.HISTORICO, TRANSACOES.VALOR, TRANSACOES.AUTORIZ_ID, TRANSACOES.NUM_DOC, TRANSACOES.FLUXO_CAIXA_ID');
    QArq.Sql.Add('FROM TRANSACOES');
    QArq.Sql.Add('INNER JOIN BANCOS');
    QArq.Sql.Add('ON (TRANSACOES.BANCO_ID = BANCOS.BANCO_ID)');
    QArq.Sql.Add('INNER JOIN CLIENTES');
    QArq.Sql.Add('ON (TRANSACOES.CLIENTE_ID = CLIENTES.CLIENTE_ID)');
    QArq.Sql.Add('WHERE');
    QArq.Sql.Add('(TRANSACOES.CONDUTA = :CONDUTA)');
    QArq.Sql.Add('AND (TRANSACOES.SERIE = :SERIE)');
    QArq.Sql.Add('AND (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');

    QArq.ParamByName('TIPO_TRANSACAO').AsString := 'T';
    QArq.ParamByName('CONDUTA').AsString        := '07';
    QArq.ParamByName('SERIE').AsString          := 'P';
    QArq.ParamByName('DT_INICIAL').AsDateTime   := Dtmen.Date;
    QArq.ParamByName('DT_FINAL').AsDateTime     := Dtmai.Date;

    QArq.Prepare;
    QArq.ExecSql;



    // Débito a Vista (CR Cx/Bco - DB Cta.)

    QArq.Sql.Clear;
    QArq.Sql.Add('INSERT INTO RAZAO(TRANSACAO_ID, TIPO_TRANSACAO, DT_TRANS, DT_MOVIMENTO, CONTA_DB, CONTA_CR, EMPRESA_ID, C_CUSTO_ID, TPCTB, HISTORICO, VALOR, AUTORIZ_ID, NUM_DOC, FLUXO_CAIXA_ID)');
    QArq.Sql.Add('SELECT TRANSACOES.TRANSACAO_ID, :TIPO_TRANSACAO, TRANSACOES.DT_ENT_SAI, TRANSACOES.DT_MOVIMENTO, TABELAS.COD_CONTABIL, BANCOS.COD_CONTABIL, TRANSACOES.EMPRESA_ID, TRANSACOES.C_CUSTO_ID, ' +
                 'TRANSACOES.TPCTB, TRANSACOES.HISTORICO, TRANSACOES.VALOR, TRANSACOES.AUTORIZ_ID, TRANSACOES.NUM_DOC, TRANSACOES.FLUXO_CAIXA_ID');
    QArq.Sql.Add('FROM TRANSACOES');
    QArq.Sql.Add('INNER JOIN TABELAS');
    QArq.Sql.Add('ON (TRANSACOES.CONTA_ID = TABELAS.TABELA_ID AND TABELAS.TIPO_TABELA = :TIPO_TABELA)');
    QArq.Sql.Add('INNER JOIN BANCOS');
    QArq.Sql.Add('ON (TRANSACOES.BANCO_ID = BANCOS.BANCO_ID)');
    QArq.Sql.Add('WHERE');
    QArq.Sql.Add('(TRANSACOES.CONDUTA = :CONDUTA)');
    QArq.Sql.Add('AND (TRANSACOES.DEPTO = :DEPTO)');
    QArq.Sql.Add('AND (TRANSACOES.COND_PAGTO = :COND_PAGTO)');
    QArq.Sql.Add('AND (TRANSACOES.DT_ENT_SAI BETWEEN :DT_INICIAL AND :DT_FINAL)');

    QArq.ParamByName('TIPO_TRANSACAO').AsString := 'T';
    QArq.ParamByName('TIPO_TABELA').AsString    := '4';
    QArq.ParamByName('CONDUTA').AsString        := '02';
    QArq.ParamByName('DEPTO').AsString          := '02';
    QArq.ParamByName('COND_PAGTO').AsString     := 'A VISTA';
    QArq.ParamByName('DT_INICIAL').AsDateTime   := Dtmen.Date;
    QArq.ParamByName('DT_FINAL').AsDateTime     := Dtmai.Date;

    QArq.Prepare;
    QArq.ExecSql;



    // Débito a Prazo (DB Cta. - CR Fornecedor)

    QArq.Sql.Clear;
    QArq.Sql.Add('INSERT INTO RAZAO(TRANSACAO_ID, TIPO_TRANSACAO, DT_TRANS, DT_MOVIMENTO, CONTA_DB, CONTA_CR, EMPRESA_ID, C_CUSTO_ID, TPCTB, HISTORICO, VALOR, AUTORIZ_ID, NUM_DOC)');
    QArq.Sql.Add('SELECT TRANSACOES.TRANSACAO_ID, :TIPO_TRANSACAO, TRANSACOES.DT_ENT_SAI, TRANSACOES.DT_MOVIMENTO, TABELAS.COD_CONTABIL, FORNECEDORES.COD_CONTABIL, TRANSACOES.EMPRESA_ID, TRANSACOES.C_CUSTO_ID, ' +
                 'TRANSACOES.TPCTB, TRANSACOES.HISTORICO, TRANSACOES.VALOR, TRANSACOES.AUTORIZ_ID, TRANSACOES.NUM_DOC');
    QArq.Sql.Add('FROM TRANSACOES');
    QArq.Sql.Add('INNER JOIN TABELAS');
    QArq.Sql.Add('ON (TRANSACOES.CONTA_ID = TABELAS.TABELA_ID AND TABELAS.TIPO_TABELA = :TIPO_TABELA)');
    QArq.Sql.Add('INNER JOIN FORNECEDORES');
    QArq.Sql.Add('ON (TRANSACOES.FORNECEDOR_ID = FORNECEDORES.FORNECEDOR_ID)');
    QArq.Sql.Add('WHERE');
    QArq.Sql.Add('(TRANSACOES.CONDUTA = :CONDUTA)');
    QArq.Sql.Add('AND (TRANSACOES.DEPTO = :DEPTO)');
    QArq.Sql.Add('AND (TRANSACOES.COND_PAGTO = :COND_PAGTO)');
    QArq.Sql.Add('AND (TRANSACOES.BALANCO <> :BALANCO)');
    QArq.Sql.Add('AND (TRANSACOES.DT_ENT_SAI BETWEEN :DT_INICIAL AND :DT_FINAL)');

    QArq.ParamByName('TIPO_TRANSACAO').AsString := 'T';
    QArq.ParamByName('TIPO_TABELA').AsString    := '4';
    QArq.ParamByName('CONDUTA').AsString        := '02';
    QArq.ParamByName('DEPTO').AsString          := '02';
    QArq.ParamByName('COND_PAGTO').AsString     := 'A PRAZO';
    QArq.ParamByName('BALANCO').AsString        := 'AGRUPADO';
    QArq.ParamByName('DT_INICIAL').AsDateTime   := Dtmen.Date;
    QArq.ParamByName('DT_FINAL').AsDateTime     := Dtmai.Date;

    QArq.Prepare;
    QArq.ExecSql;



    // Pagamento c/ Desconto (DB Fornecedor - CR Cx/Bco.) - (DB Fornecedor - CR Cta.)

    QArq.Sql.Clear;
    QArq.Sql.Add('INSERT INTO RAZAO(TRANSACAO_ID, TIPO_TRANSACAO, DT_TRANS, DT_MOVIMENTO, CONTA_DB, CONTA_CR, EMPRESA_ID, C_CUSTO_ID, TPCTB, HISTORICO, VALOR, AUTORIZ_ID, NUM_DOC, FLUXO_CAIXA_ID)');
    QArq.Sql.Add('SELECT TRANSACOES.TRANSACAO_ID, :TIPO_TRANSACAO, TRANSACOES.DT_TRANS, TRANSACOES.DT_MOVIMENTO, FORNECEDORES.COD_CONTABIL, BANCOS.COD_CONTABIL, TRANSACOES.EMPRESA_ID, TRANSACOES.C_CUSTO_ID, ' +
                 'TRANSACOES.TPCTB, TRANSACOES.HISTORICO, TRANSACOES.VALOR, TRANSACOES.AUTORIZ_ID, TRANSACOES.NUM_DOC, TRANSACOES.FLUXO_CAIXA_ID');
    QArq.Sql.Add('FROM TRANSACOES');
    QArq.Sql.Add('INNER JOIN FORNECEDORES');
    QArq.Sql.Add('ON (TRANSACOES.FORNECEDOR_ID = FORNECEDORES.FORNECEDOR_ID)');
    QArq.Sql.Add('INNER JOIN BANCOS');
    QArq.Sql.Add('ON (TRANSACOES.BANCO_ID = BANCOS.BANCO_ID)');
    QArq.Sql.Add('WHERE');
    QArq.Sql.Add('(TRANSACOES.CONDUTA = :CONDUTA)');
    QArq.Sql.Add('AND (TRANSACOES.SERIE = :SERIE)');
    QArq.Sql.Add('AND (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');

    QArq.ParamByName('TIPO_TRANSACAO').AsString := 'T';
    QArq.ParamByName('CONDUTA').AsString        := '08';
    QArq.ParamByName('SERIE').AsString          := 'D';
    QArq.ParamByName('DT_INICIAL').AsDateTime   := Dtmen.Date;
    QArq.ParamByName('DT_FINAL').AsDateTime     := Dtmai.Date;

    QArq.Prepare;
    QArq.ExecSql;



    QArq.Sql.Clear;
    QArq.Sql.Add('INSERT INTO RAZAO(TRANSACAO_ID, TIPO_TRANSACAO, DT_TRANS, DT_MOVIMENTO, CONTA_DB, CONTA_CR, EMPRESA_ID, C_CUSTO_ID, TPCTB, HISTORICO, VALOR, AUTORIZ_ID, NUM_DOC)');
    QArq.Sql.Add('SELECT TRANSACOES.TRANSACAO_ID, :TIPO_TRANSACAO, TRANSACOES.DT_TRANS, TRANSACOES.DT_MOVIMENTO, FORNECEDORES.COD_CONTABIL, TABELAS.COD_CONTABIL, TRANSACOES.EMPRESA_ID, TRANSACOES.C_CUSTO_ID, ' +
                 'TRANSACOES.TPCTB, TRANSACOES.COMPLEMENTO, (TRANSACOES.VALOR_PARCELA - TRANSACOES.VALOR), TRANSACOES.AUTORIZ_ID, TRANSACOES.NUM_DOC');
    QArq.Sql.Add('FROM TRANSACOES');
    QArq.Sql.Add('INNER JOIN FORNECEDORES');
    QArq.Sql.Add('ON (TRANSACOES.FORNECEDOR_ID = FORNECEDORES.FORNECEDOR_ID)');
    QArq.Sql.Add('INNER JOIN TABELAS');
    QArq.Sql.Add('ON (TRANSACOES.CONTA_ID = TABELAS.TABELA_ID AND TABELAS.TIPO_TABELA = :TIPO_TABELA)');
    QArq.Sql.Add('WHERE');
    QArq.Sql.Add('(TRANSACOES.CONDUTA = :CONDUTA)');
    QArq.Sql.Add('AND (TRANSACOES.SERIE = :SERIE)');
    QArq.Sql.Add('AND (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');

    QArq.ParamByName('TIPO_TRANSACAO').AsString := 'T';
    QArq.ParamByName('TIPO_TABELA').AsString    := '4';
    QArq.ParamByName('CONDUTA').AsString        := '08';
    QArq.ParamByName('SERIE').AsString          := 'D';
    QArq.ParamByName('DT_INICIAL').AsDateTime   := Dtmen.Date;
    QArq.ParamByName('DT_FINAL').AsDateTime     := Dtmai.Date;

    QArq.Prepare;
    QArq.ExecSql;



    // Pagamento c/ Juros (DB Fornecedor - CR Cx/Bco.) - (DB Cta. - CR Cx/Bco.)

    QArq.Sql.Clear;
    QArq.Sql.Add('INSERT INTO RAZAO(TRANSACAO_ID, TIPO_TRANSACAO, DT_TRANS, DT_MOVIMENTO, CONTA_DB, CONTA_CR, EMPRESA_ID, C_CUSTO_ID, TPCTB, HISTORICO, VALOR, AUTORIZ_ID, NUM_DOC, FLUXO_CAIXA_ID)');
    QArq.Sql.Add('SELECT TRANSACOES.TRANSACAO_ID, :TIPO_TRANSACAO, TRANSACOES.DT_TRANS, TRANSACOES.DT_MOVIMENTO, FORNECEDORES.COD_CONTABIL, BANCOS.COD_CONTABIL, TRANSACOES.EMPRESA_ID, TRANSACOES.C_CUSTO_ID, ' +
                 'TRANSACOES.TPCTB, TRANSACOES.HISTORICO, TRANSACOES.VALOR_PARCELA, TRANSACOES.AUTORIZ_ID, TRANSACOES.NUM_DOC, TRANSACOES.FLUXO_CAIXA_ID');
    QArq.Sql.Add('FROM TRANSACOES');
    QArq.Sql.Add('INNER JOIN FORNECEDORES');
    QArq.Sql.Add('ON (TRANSACOES.FORNECEDOR_ID = FORNECEDORES.FORNECEDOR_ID)');
    QArq.Sql.Add('INNER JOIN BANCOS');
    QArq.Sql.Add('ON (TRANSACOES.BANCO_ID = BANCOS.BANCO_ID)');
    QArq.Sql.Add('WHERE');
    QArq.Sql.Add('(TRANSACOES.CONDUTA = :CONDUTA)');
    QArq.Sql.Add('AND (TRANSACOES.SERIE = :SERIE)');
    QArq.Sql.Add('AND (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');

    QArq.ParamByName('TIPO_TRANSACAO').AsString := 'T';
    QArq.ParamByName('CONDUTA').AsString        := '08';
    QArq.ParamByName('SERIE').AsString          := 'J';
    QArq.ParamByName('DT_INICIAL').AsDateTime   := Dtmen.Date;
    QArq.ParamByName('DT_FINAL').AsDateTime     := Dtmai.Date;

    QArq.Prepare;
    QArq.ExecSql;



    QArq.Sql.Clear;
    QArq.Sql.Add('INSERT INTO RAZAO(TRANSACAO_ID, TIPO_TRANSACAO, DT_TRANS, DT_MOVIMENTO, CONTA_DB, CONTA_CR, EMPRESA_ID, C_CUSTO_ID, TPCTB, HISTORICO, VALOR, AUTORIZ_ID, NUM_DOC, FLUXO_CAIXA_ID)');
    QArq.Sql.Add('SELECT TRANSACOES.TRANSACAO_ID, :TIPO_TRANSACAO, TRANSACOES.DT_TRANS, TRANSACOES.DT_MOVIMENTO, TABELAS.COD_CONTABIL, BANCOS.COD_CONTABIL, TRANSACOES.EMPRESA_ID, TRANSACOES.C_CUSTO_ID, ' +
                 'TRANSACOES.TPCTB, TRANSACOES.COMPLEMENTO, (TRANSACOES.VALOR - TRANSACOES.VALOR_PARCELA), TRANSACOES.AUTORIZ_ID, TRANSACOES.NUM_DOC, TRANSACOES.FLUXO_CAIXA_ID');
    QArq.Sql.Add('FROM TRANSACOES');
    QArq.Sql.Add('INNER JOIN TABELAS');
    QArq.Sql.Add('ON (TRANSACOES.CONTA_ID = TABELAS.TABELA_ID AND TABELAS.TIPO_TABELA = :TIPO_TABELA)');
    QArq.Sql.Add('INNER JOIN BANCOS');
    QArq.Sql.Add('ON (TRANSACOES.BANCO_ID = BANCOS.BANCO_ID)');
    QArq.Sql.Add('WHERE');
    QArq.Sql.Add('(TRANSACOES.CONDUTA = :CONDUTA)');
    QArq.Sql.Add('AND (TRANSACOES.SERIE = :SERIE)');
    QArq.Sql.Add('AND (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');

    QArq.ParamByName('TIPO_TRANSACAO').AsString := 'T';
    QArq.ParamByName('TIPO_TABELA').AsString    := '4';
    QArq.ParamByName('CONDUTA').AsString        := '08';
    QArq.ParamByName('SERIE').AsString          := 'J';
    QArq.ParamByName('DT_INICIAL').AsDateTime   := Dtmen.Date;
    QArq.ParamByName('DT_FINAL').AsDateTime     := Dtmai.Date;

    QArq.Prepare;
    QArq.ExecSql;



    // Pagamento Integral (DB Fornecedor - CR Cx/Bco.)

    QArq.Sql.Clear;
    QArq.Sql.Add('INSERT INTO RAZAO(TRANSACAO_ID, TIPO_TRANSACAO, DT_TRANS, DT_MOVIMENTO, CONTA_DB, CONTA_CR, EMPRESA_ID, C_CUSTO_ID, TPCTB, HISTORICO, VALOR, AUTORIZ_ID, NUM_DOC, FLUXO_CAIXA_ID)');
    QArq.Sql.Add('SELECT TRANSACOES.TRANSACAO_ID, :TIPO_TRANSACAO, TRANSACOES.DT_TRANS, TRANSACOES.DT_MOVIMENTO, FORNECEDORES.COD_CONTABIL, BANCOS.COD_CONTABIL, TRANSACOES.EMPRESA_ID, TRANSACOES.C_CUSTO_ID, ' +
                 'TRANSACOES.TPCTB, TRANSACOES.HISTORICO, TRANSACOES.VALOR, TRANSACOES.AUTORIZ_ID, TRANSACOES.NUM_DOC, TRANSACOES.FLUXO_CAIXA_ID');
    QArq.Sql.Add('FROM TRANSACOES');
    QArq.Sql.Add('INNER JOIN FORNECEDORES');
    QArq.Sql.Add('ON (TRANSACOES.FORNECEDOR_ID = FORNECEDORES.FORNECEDOR_ID)');
    QArq.Sql.Add('INNER JOIN BANCOS');
    QArq.Sql.Add('ON (TRANSACOES.BANCO_ID = BANCOS.BANCO_ID)');
    QArq.Sql.Add('WHERE');
    QArq.Sql.Add('(TRANSACOES.CONDUTA = :CONDUTA)');
    QArq.Sql.Add('AND (TRANSACOES.SERIE = :SERIE)');
    QArq.Sql.Add('AND (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');

    QArq.ParamByName('TIPO_TRANSACAO').AsString := 'T';
    QArq.ParamByName('CONDUTA').AsString        := '08';
    QArq.ParamByName('SERIE').AsString          := 'N';
    QArq.ParamByName('DT_INICIAL').AsDateTime   := Dtmen.Date;
    QArq.ParamByName('DT_FINAL').AsDateTime     := Dtmai.Date;

    QArq.Prepare;
    QArq.ExecSql;



    // Pagamento Parcial (DB Fornecedor - CR Cx/Bco.)

    QArq.Sql.Clear;
    QArq.Sql.Add('INSERT INTO RAZAO(TRANSACAO_ID, TIPO_TRANSACAO, DT_TRANS, DT_MOVIMENTO, CONTA_DB, CONTA_CR, EMPRESA_ID, C_CUSTO_ID, TPCTB, HISTORICO, VALOR, AUTORIZ_ID, NUM_DOC, FLUXO_CAIXA_ID)');
    QArq.Sql.Add('SELECT TRANSACOES.TRANSACAO_ID, :TIPO_TRANSACAO, TRANSACOES.DT_TRANS, TRANSACOES.DT_MOVIMENTO, FORNECEDORES.COD_CONTABIL, BANCOS.COD_CONTABIL, TRANSACOES.EMPRESA_ID, TRANSACOES.C_CUSTO_ID, ' +
                 'TRANSACOES.TPCTB, TRANSACOES.HISTORICO, TRANSACOES.VALOR, TRANSACOES.AUTORIZ_ID, TRANSACOES.NUM_DOC, TRANSACOES.FLUXO_CAIXA_ID');
    QArq.Sql.Add('FROM TRANSACOES');
    QArq.Sql.Add('INNER JOIN FORNECEDORES');
    QArq.Sql.Add('ON (TRANSACOES.FORNECEDOR_ID = FORNECEDORES.FORNECEDOR_ID)');
    QArq.Sql.Add('INNER JOIN BANCOS');
    QArq.Sql.Add('ON (TRANSACOES.BANCO_ID = BANCOS.BANCO_ID)');
    QArq.Sql.Add('WHERE');
    QArq.Sql.Add('(TRANSACOES.CONDUTA = :CONDUTA)');
    QArq.Sql.Add('AND (TRANSACOES.SERIE = :SERIE)');
    QArq.Sql.Add('AND (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');

    QArq.ParamByName('TIPO_TRANSACAO').AsString := 'T';
    QArq.ParamByName('CONDUTA').AsString        := '08';
    QArq.ParamByName('SERIE').AsString          := 'P';
    QArq.ParamByName('DT_INICIAL').AsDateTime   := Dtmen.Date;
    QArq.ParamByName('DT_FINAL').AsDateTime     := Dtmai.Date;

    QArq.Prepare;
    QArq.ExecSql;



    // Compra a Vista (DB Cta. - CR Cx/Bco.)

    QArq.Sql.Clear;
    QArq.Sql.Add('INSERT INTO RAZAO(TRANSACAO_ID, TIPO_TRANSACAO, DT_TRANS, DT_MOVIMENTO, CONTA_DB, CONTA_CR, EMPRESA_ID, C_CUSTO_ID, TPCTB, HISTORICO, VALOR, AUTORIZ_ID, NUM_DOC, FLUXO_CAIXA_ID)');
    QArq.Sql.Add('SELECT TRANSACOES.TRANSACAO_ID, :TIPO_TRANSACAO, TRANSACOES.DT_ENT_SAI, TRANSACOES.DT_MOVIMENTO, TABELAS.COD_CONTABIL, BANCOS.COD_CONTABIL, TRANSACOES.EMPRESA_ID, TRANSACOES.C_CUSTO_ID, ' +
                 'TRANSACOES.TPCTB, TRANSACOES.HISTORICO, TRANSACOES.VALOR, TRANSACOES.AUTORIZ_ID, TRANSACOES.NUM_DOC, TRANSACOES.FLUXO_CAIXA_ID');
    //SUM(TRANSITENS.VR_TOTAL + TRANSITENS.VALOR_ICMS_ST + TRANSITENS.VR_FRETE + TRANSITENS.VR_ACRESCIMO + TRANSITENS.VR_IPI - TRANSITENS.DESC_RODAPE)
    QArq.Sql.Add('FROM TRANSACOES');
    //QArq.Sql.Add('INNER JOIN TRANSACOES');
    //QArq.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
    QArq.Sql.Add('INNER JOIN BANCOS');
    QArq.Sql.Add('ON (TRANSACOES.BANCO_ID = BANCOS.BANCO_ID)');
    QArq.Sql.Add('INNER JOIN TABELAS');
    QArq.Sql.Add('ON (TRANSACOES.CONTA_ID = TABELAS.TABELA_ID AND TABELAS.TIPO_TABELA = :TIPO_TABELA)');
    QArq.Sql.Add('WHERE');
    QArq.Sql.Add('(TRANSACOES.CONDUTA = :CONDUTA)');
    QArq.Sql.Add('AND (TRANSACOES.DEPTO = :DEPTO)');
    QArq.Sql.Add('AND (TRANSACOES.COND_PAGTO = :COND_PAGTO)');
    QArq.Sql.Add('AND (TRANSACOES.DT_ENT_SAI BETWEEN :DT_INICIAL AND :DT_FINAL)');
    //QArq.Sql.Add('GROUP BY TRANSITENS.TRANSACAO_ID, TRANSACOES.DT_ENT_SAI, TRANSACOES.DT_MOVIMENTO, TABELAS.COD_CONTABIL, BANCOS.COD_CONTABIL, TRANSACOES.EMPRESA_ID, TRANSACOES.C_CUSTO_ID, ' +
    //             'TRANSACOES.TPCTB, TRANSACOES.HISTORICO, TRANSACOES.AUTORIZ_ID, TRANSACOES.NUM_DOC, TRANSACOES.FLUXO_CAIXA_ID');

    QArq.ParamByName('TIPO_TRANSACAO').AsString := 'T';
    QArq.ParamByName('TIPO_TABELA').AsString    := '4';
    QArq.ParamByName('CONDUTA').AsString        := '02';
    QArq.ParamByName('DEPTO').AsString          := '07';
    QArq.ParamByName('COND_PAGTO').AsString     := 'A VISTA';
    QArq.ParamByName('DT_INICIAL').AsDateTime   := Dtmen.Date;
    QArq.ParamByName('DT_FINAL').AsDateTime     := Dtmai.Date;

    QArq.Prepare;
    QArq.ExecSql;



    // Compra a Prazo (DB Cta. - CR Fornecedor)

    QArq.Sql.Clear;
    QArq.Sql.Add('INSERT INTO RAZAO(TRANSACAO_ID, TIPO_TRANSACAO, DT_TRANS, DT_MOVIMENTO, CONTA_DB, CONTA_CR, EMPRESA_ID, C_CUSTO_ID, TPCTB, HISTORICO, VALOR, AUTORIZ_ID, NUM_DOC)');
    QArq.Sql.Add('SELECT TRANSACOES.TRANSACAO_ID, :TIPO_TRANSACAO, TRANSACOES.DT_ENT_SAI, TRANSACOES.DT_MOVIMENTO, TABELAS.COD_CONTABIL, FORNECEDORES.COD_CONTABIL, TRANSACOES.EMPRESA_ID, TRANSACOES.C_CUSTO_ID, ' +
                 'TRANSACOES.TPCTB, TRANSACOES.HISTORICO,TRANSACOES.VALOR , TRANSACOES.AUTORIZ_ID, TRANSACOES.NUM_DOC');
    //SUM(TRANSITENS.VR_TOTAL + TRANSITENS.VALOR_ICMS_ST + TRANSITENS.VR_FRETE + TRANSITENS.VR_ACRESCIMO + TRANSITENS.VR_IPI - TRANSITENS.DESC_RODAPE)
    QArq.Sql.Add('FROM TRANSACOES');
    //QArq.Sql.Add('INNER JOIN TRANSACOES');
    //QArq.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
    QArq.Sql.Add('INNER JOIN FORNECEDORES');
    QArq.Sql.Add('ON (TRANSACOES.FORNECEDOR_ID = FORNECEDORES.FORNECEDOR_ID)');
    QArq.Sql.Add('INNER JOIN TABELAS');
    QArq.Sql.Add('ON (TRANSACOES.CONTA_ID = TABELAS.TABELA_ID AND TABELAS.TIPO_TABELA = :TIPO_TABELA)');
    QArq.Sql.Add('WHERE');
    QArq.Sql.Add('(TRANSACOES.CONDUTA = :CONDUTA)');
    QArq.Sql.Add('AND (TRANSACOES.DEPTO = :DEPTO)');
    QArq.Sql.Add('AND (TRANSACOES.COND_PAGTO = :COND_PAGTO)');
    QArq.Sql.Add('AND (TRANSACOES.BALANCO <> :BALANCO)');
    QArq.Sql.Add('AND (TRANSACOES.DT_ENT_SAI BETWEEN :DT_INICIAL AND :DT_FINAL)');
  //  QArq.Sql.Add('GROUP BY TRANSITENS.TRANSACAO_ID, TRANSACOES.DT_ENT_SAI, TRANSACOES.DT_MOVIMENTO, TABELAS.COD_CONTABIL, FORNECEDORES.COD_CONTABIL, TRANSACOES.EMPRESA_ID, TRANSACOES.C_CUSTO_ID, ' +
  //               'TRANSACOES.TPCTB, TRANSACOES.HISTORICO, TRANSACOES.AUTORIZ_ID, TRANSACOES.NUM_DOC');

    QArq.ParamByName('TIPO_TRANSACAO').AsString := 'T';
    QArq.ParamByName('TIPO_TABELA').AsString    := '4';
    QArq.ParamByName('CONDUTA').AsString        := '02';
    QArq.ParamByName('DEPTO').AsString          := '07';
    QArq.ParamByName('COND_PAGTO').AsString     := 'A PRAZO';
    QArq.ParamByName('BALANCO').AsString        := 'AGRUPADO';
    QArq.ParamByName('DT_INICIAL').AsDateTime   := Dtmen.Date;
    QArq.ParamByName('DT_FINAL').AsDateTime     := Dtmai.Date;

    QArq.Prepare;
    QArq.ExecSql;



    // Devolução de Compra (DB Cta. - CR Cx/Bco.)

    QArq.Sql.Clear;
    QArq.Sql.Add('INSERT INTO RAZAO(TRANSACAO_ID, TIPO_TRANSACAO, DT_TRANS, DT_MOVIMENTO, CONTA_DB, CONTA_CR, EMPRESA_ID, C_CUSTO_ID, TPCTB, HISTORICO, VALOR, AUTORIZ_ID, NUM_DOC, FLUXO_CAIXA_ID)');
    QArq.Sql.Add('SELECT TRANSACOES.TRANSACAO_ID, :TIPO_TRANSACAO, TRANSACOES.DT_TRANS, TRANSACOES.DT_MOVIMENTO, BANCOS.COD_CONTABIL, TABELAS.COD_CONTABIL, TRANSACOES.EMPRESA_ID, TRANSACOES.C_CUSTO_ID, ' +
                 'TRANSACOES.TPCTB, TRANSACOES.HISTORICO,TRANSACOES.VALOR , TRANSACOES.AUTORIZ_ID, TRANSACOES.NUM_DOC, TRANSACOES.FLUXO_CAIXA_ID');
    //SUM(TRANSITENS.VR_TOTAL + TRANSITENS.VALOR_ICMS_ST + TRANSITENS.VR_FRETE + TRANSITENS.VR_ACRESCIMO + TRANSITENS.VR_IPI - TRANSITENS.DESC_RODAPE)
    QArq.Sql.Add('FROM TRANSACOES');
    //QArq.Sql.Add('INNER JOIN TRANSACOES');
    //QArq.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
    QArq.Sql.Add('INNER JOIN BANCOS');
    QArq.Sql.Add('ON (TRANSACOES.BANCO_ID = BANCOS.BANCO_ID)');
    QArq.Sql.Add('INNER JOIN TABELAS');
    QArq.Sql.Add('ON (TRANSACOES.CONTA_ID = TABELAS.TABELA_ID AND TABELAS.TIPO_TABELA = :TIPO_TABELA)');
    QArq.Sql.Add('WHERE');
    QArq.Sql.Add('(TRANSACOES.CONDUTA = :CONDUTA)');
    QArq.Sql.Add('AND (TRANSACOES.DEPTO = :DEPTO)');
    QArq.Sql.Add('AND (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
  //  QArq.Sql.Add('GROUP BY TRANSITENS.TRANSACAO_ID, TRANSACOES.DT_TRANS, TRANSACOES.DT_MOVIMENTO, BANCOS.COD_CONTABIL, TABELAS.COD_CONTABIL, TRANSACOES.EMPRESA_ID, TRANSACOES.C_CUSTO_ID, ' +
  //               'TRANSACOES.TPCTB, TRANSACOES.HISTORICO, TRANSACOES.AUTORIZ_ID, TRANSACOES.NUM_DOC, TRANSACOES.FLUXO_CAIXA_ID');

    QArq.ParamByName('TIPO_TRANSACAO').AsString := 'T';
    QArq.ParamByName('TIPO_TABELA').AsString    := '4';
    QArq.ParamByName('CONDUTA').AsString        := '01';
    QArq.ParamByName('DEPTO').AsString          := '10';
    QArq.ParamByName('DT_INICIAL').AsDateTime   := Dtmen.Date;
    QArq.ParamByName('DT_FINAL').AsDateTime     := Dtmai.Date;

    QArq.Prepare;
    QArq.ExecSql;



    // Venda a Vista (DB Cx/Bco. - CR Cta.)

    QArq.Sql.Clear;
    QArq.Sql.Add('INSERT INTO RAZAO(TRANSACAO_ID, TIPO_TRANSACAO, DT_TRANS, DT_MOVIMENTO, CONTA_DB, CONTA_CR, EMPRESA_ID, C_CUSTO_ID, TPCTB, HISTORICO, VALOR, AUTORIZ_ID, NUM_DOC, FLUXO_CAIXA_ID)');
    QArq.Sql.Add('SELECT TRANSACOES.TRANSACAO_ID, :TIPO_TRANSACAO, TRANSACOES.DT_TRANS, TRANSACOES.DT_MOVIMENTO, BANCOS.COD_CONTABIL, TABELAS.COD_CONTABIL, TRANSACOES.EMPRESA_ID, TRANSACOES.C_CUSTO_ID, ' +
                 'TRANSACOES.TPCTB, TRANSACOES.HISTORICO, TRANSACOES.VALOR , TRANSACOES.AUTORIZ_ID, TRANSACOES.NUM_DOC, TRANSACOES.FLUXO_CAIXA_ID');
    //SUM(TRANSITENS.VR_TOTAL + TRANSITENS.VALOR_ICMS_ST + TRANSITENS.VR_FRETE + TRANSITENS.VR_ACRESCIMO + TRANSITENS.VR_IPI - TRANSITENS.DESC_RODAPE)
    QArq.Sql.Add('FROM TRANSACOES');
    //QArq.Sql.Add('INNER JOIN TRANSACOES');
    //QArq.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
    QArq.Sql.Add('INNER JOIN BANCOS');
    QArq.Sql.Add('ON (TRANSACOES.BANCO_ID = BANCOS.BANCO_ID)');
    QArq.Sql.Add('INNER JOIN TABELAS');
    QArq.Sql.Add('ON (TRANSACOES.CONTA_ID = TABELAS.TABELA_ID AND TABELAS.TIPO_TABELA = :TIPO_TABELA)');
    QArq.Sql.Add('WHERE');
    QArq.Sql.Add('(TRANSACOES.CONDUTA = :CONDUTA)');
    QArq.Sql.Add('AND (TRANSACOES.DEPTO = :DEPTO)');
     QArq.Sql.Add('AND (TRANSACOES.MODELO = :MODELO)');
    QArq.Sql.Add('AND ((TRANSACOES.COND_PAGTO = :COND_PAGTO) OR (TRANSACOES.COND_PAGTO = :COND_PAGTO1))');
    QArq.Sql.Add('AND (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
//    QArq.Sql.Add('GROUP BY TRANSITENS.TRANSACAO_ID, TRANSACOES.DT_TRANS, TRANSACOES.DT_MOVIMENTO, TABELAS.COD_CONTABIL, BANCOS.COD_CONTABIL, TRANSACOES.EMPRESA_ID, TRANSACOES.C_CUSTO_ID, ' +
//                 'TRANSACOES.TPCTB, TRANSACOES.HISTORICO, TRANSACOES.AUTORIZ_ID, TRANSACOES.NUM_DOC, TRANSACOES.FLUXO_CAIXA_ID');

    QArq.ParamByName('TIPO_TRANSACAO').AsString := 'T';
    QArq.ParamByName('TIPO_TABELA').AsString    := '4';
    QArq.ParamByName('CONDUTA').AsString        := '01';
    QArq.ParamByName('DEPTO').AsString          := '07';
    QArq.ParamByName('MODELO').AsString         := '2D';
    QArq.ParamByName('COND_PAGTO').AsString     := 'A VISTA';
    QArq.ParamByName('COND_PAGTO1').AsString     := 'CARTAO';
    QArq.ParamByName('DT_INICIAL').AsDateTime   := Dtmen.Date;
    QArq.ParamByName('DT_FINAL').AsDateTime     := Dtmai.Date;

    QArq.Prepare;
    QArq.ExecSql;



    //REMESSA/BONIFICACAO

    QArq.Sql.Clear;
    QArq.Sql.Add('INSERT INTO RAZAO(TRANSACAO_ID, TIPO_TRANSACAO, DT_TRANS, DT_MOVIMENTO, CONTA_DB, CONTA_CR, EMPRESA_ID, C_CUSTO_ID, TPCTB, HISTORICO, VALOR, AUTORIZ_ID, NUM_DOC, FLUXO_CAIXA_ID)');
    QArq.Sql.Add('SELECT TRANSACOES.TRANSACAO_ID, :TIPO_TRANSACAO, TRANSACOES.DT_ENT_SAI, TRANSACOES.DT_MOVIMENTO, BANCOS.COD_CONTABIL, TABELAS.COD_CONTABIL, TRANSACOES.EMPRESA_ID, TRANSACOES.C_CUSTO_ID, ' +
                 'TRANSACOES.TPCTB, TRANSACOES.HISTORICO, TRANSACOES.VALOR , TRANSACOES.AUTORIZ_ID, TRANSACOES.NUM_DOC, TRANSACOES.FLUXO_CAIXA_ID');
    //SUM(TRANSITENS.VR_TOTAL + TRANSITENS.VALOR_ICMS_ST + TRANSITENS.VR_FRETE + TRANSITENS.VR_ACRESCIMO + TRANSITENS.VR_IPI - TRANSITENS.DESC_RODAPE)
    QArq.Sql.Add('FROM TRANSACOES');
    //QArq.Sql.Add('INNER JOIN TRANSACOES');
    //QArq.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
    QArq.Sql.Add('LEFT JOIN BANCOS');
    QArq.Sql.Add('ON (TRANSACOES.BANCO_ID = BANCOS.BANCO_ID)');
    QArq.Sql.Add('INNER JOIN TABELAS');
    QArq.Sql.Add('ON (TRANSACOES.CONTA_ID = TABELAS.TABELA_ID AND TABELAS.TIPO_TABELA = :TIPO_TABELA)');
    QArq.Sql.Add('WHERE');
    QArq.Sql.Add('(TRANSACOES.CONDUTA = :CONDUTA)');
    QArq.Sql.Add('AND ((TRANSACOES.TIPO_VENDA = :TIPO_VENDA) OR (TRANSACOES.TIPO_VENDA = :TIPO_VENDA1))');
    QArq.Sql.Add('AND (TRANSACOES.DEPTO = :DEPTO)');
    QArq.Sql.Add('AND (TRANSACOES.MODELO = :MODELO)');
    QArq.Sql.Add('AND (TRANSACOES.COND_PAGTO = :COND_PAGTO)');
    QArq.Sql.Add('AND (TRANSACOES.DT_ENT_SAI BETWEEN :DT_INICIAL AND :DT_FINAL)');
//    QArq.Sql.Add('GROUP BY TRANSITENS.TRANSACAO_ID, TRANSACOES.DT_TRANS, TRANSACOES.DT_MOVIMENTO, TABELAS.COD_CONTABIL, BANCOS.COD_CONTABIL, TRANSACOES.EMPRESA_ID, TRANSACOES.C_CUSTO_ID, ' +
//                 'TRANSACOES.TPCTB, TRANSACOES.HISTORICO, TRANSACOES.AUTORIZ_ID, TRANSACOES.NUM_DOC, TRANSACOES.FLUXO_CAIXA_ID');

    QArq.ParamByName('TIPO_TRANSACAO').AsString := 'T';
    QArq.ParamByName('TIPO_VENDA').AsString     := 'REMESSA';
    QArq.ParamByName('TIPO_VENDA1').AsString    := 'BONIFICACAO';
    QArq.ParamByName('TIPO_TABELA').AsString    := '4';
    QArq.ParamByName('CONDUTA').AsString        := '01';
    QArq.ParamByName('DEPTO').AsString          := '07';
    QArq.ParamByName('MODELO').AsString         := '55';
    QArq.ParamByName('COND_PAGTO').AsString     := 'A VISTA';
    QArq.ParamByName('DT_INICIAL').AsDateTime   := Dtmen.Date;
    QArq.ParamByName('DT_FINAL').AsDateTime     := Dtmai.Date;

    QArq.Prepare;
    QArq.ExecSql;





    // Venda a Prazo (DB Cliente - CR Cta.)

    QArq.Sql.Clear;
    QArq.Sql.Add('INSERT INTO RAZAO(TRANSACAO_ID, TIPO_TRANSACAO, DT_TRANS, DT_MOVIMENTO, CONTA_DB, CONTA_CR, EMPRESA_ID, C_CUSTO_ID, TPCTB, HISTORICO, VALOR, AUTORIZ_ID, NUM_DOC)');
    QArq.Sql.Add('SELECT TRANSACOES.TRANSACAO_ID, :TIPO_TRANSACAO, TRANSACOES.DT_TRANS, TRANSACOES.DT_MOVIMENTO, CLIENTES.COD_CONTABIL, TABELAS.COD_CONTABIL, TRANSACOES.EMPRESA_ID, TRANSACOES.C_CUSTO_ID, ' +
                 'TRANSACOES.TPCTB, TRANSACOES.HISTORICO, TRANSACOES.VALOR , TRANSACOES.AUTORIZ_ID, TRANSACOES.NUM_DOC');
    //SUM(TRANSITENS.VR_TOTAL + TRANSITENS.VALOR_ICMS_ST + TRANSITENS.VR_FRETE + TRANSITENS.VR_ACRESCIMO + TRANSITENS.VR_IPI - TRANSITENS.DESC_RODAPE)

    QArq.Sql.Add('FROM TRANSACOES');
   // QArq.Sql.Add('INNER JOIN TRANSACOES');
   // QArq.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
    QArq.Sql.Add('LEFT JOIN CLIENTES');
    QArq.Sql.Add('ON (TRANSACOES.CLIENTE_ID = CLIENTES.CLIENTE_ID)');
    QArq.Sql.Add('INNER JOIN TABELAS');
    QArq.Sql.Add('ON (TRANSACOES.CONTA_ID = TABELAS.TABELA_ID AND TABELAS.TIPO_TABELA = :TIPO_TABELA)');
    QArq.Sql.Add('WHERE');
    QArq.Sql.Add('(TRANSACOES.CONDUTA = :CONDUTA)');
    QArq.Sql.Add('AND (TRANSACOES.DEPTO = :DEPTO)');
    QArq.Sql.Add('AND (TRANSACOES.MODELO = :MODELO)');
    QArq.Sql.Add('AND (TRANSACOES.COND_PAGTO = :COND_PAGTO)');
    QArq.Sql.Add('AND (TRANSACOES.BALANCO <> :BALANCO)');
    QArq.Sql.Add('AND (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
 //   QArq.Sql.Add('GROUP BY TRANSITENS.TRANSACAO_ID, TRANSACOES.DT_TRANS, TRANSACOES.DT_MOVIMENTO, CLIENTES.COD_CONTABIL, TABELAS.COD_CONTABIL, TRANSACOES.EMPRESA_ID, TRANSACOES.C_CUSTO_ID, ' +
 //                'TRANSACOES.TPCTB, TRANSACOES.HISTORICO, TRANSACOES.AUTORIZ_ID, TRANSACOES.NUM_DOC');

    QArq.ParamByName('TIPO_TRANSACAO').AsString := 'T';
    QArq.ParamByName('TIPO_TABELA').AsString    := '4';
    QArq.ParamByName('CONDUTA').AsString        := '01';
    QArq.ParamByName('DEPTO').AsString          := '07';
    QArq.ParamByName('MODELO').AsString         := '2D';
    QArq.ParamByName('COND_PAGTO').AsString     := 'A PRAZO';
    QArq.ParamByName('BALANCO').AsString        := 'AGRUPADO';
    QArq.ParamByName('DT_INICIAL').AsDateTime   := Dtmen.Date;
    QArq.ParamByName('DT_FINAL').AsDateTime     := Dtmai.Date;

    QArq.Prepare;
    QArq.ExecSql;



    // Venda a Vista Nfe (DB Cx/Bco. - CR Cta.)

    QArq.Sql.Clear;
    QArq.Sql.Add('INSERT INTO RAZAO(TRANSACAO_ID, TIPO_TRANSACAO, DT_TRANS, DT_MOVIMENTO, CONTA_DB, CONTA_CR, EMPRESA_ID, C_CUSTO_ID, TPCTB, HISTORICO, VALOR, AUTORIZ_ID, NUM_DOC, FLUXO_CAIXA_ID)');
    QArq.Sql.Add('SELECT TRANSACOES.TRANSACAO_ID, :TIPO_TRANSACAO, TRANSACOES.DT_ENT_SAI, TRANSACOES.DT_MOVIMENTO, BANCOS.COD_CONTABIL, TABELAS.COD_CONTABIL, TRANSACOES.EMPRESA_ID, TRANSACOES.C_CUSTO_ID, ' +
                 'TRANSACOES.TPCTB, TRANSACOES.HISTORICO, TRANSACOES.VALOR , TRANSACOES.AUTORIZ_ID, TRANSACOES.NUM_DOC, TRANSACOES.FLUXO_CAIXA_ID');
    //SUM(TRANSITENS.VR_TOTAL + TRANSITENS.VALOR_ICMS_ST + TRANSITENS.VR_FRETE + TRANSITENS.VR_ACRESCIMO + TRANSITENS.VR_IPI - TRANSITENS.DESC_RODAPE)
    QArq.Sql.Add('FROM TRANSACOES');
    //QArq.Sql.Add('INNER JOIN TRANSACOES');
    //QArq.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
    QArq.Sql.Add('INNER JOIN BANCOS');
    QArq.Sql.Add('ON (TRANSACOES.BANCO_ID = BANCOS.BANCO_ID)');
    QArq.Sql.Add('INNER JOIN TABELAS');
    QArq.Sql.Add('ON (TRANSACOES.CONTA_ID = TABELAS.TABELA_ID AND TABELAS.TIPO_TABELA = :TIPO_TABELA)');
    QArq.Sql.Add('WHERE');
    QArq.Sql.Add('(TRANSACOES.CONDUTA = :CONDUTA)');
    QArq.Sql.Add('AND (TRANSACOES.DEPTO = :DEPTO)');
    QArq.Sql.Add('AND (TRANSACOES.MODELO <> :MODELO)');
    QArq.Sql.Add('AND (TRANSACOES.COND_PAGTO = :COND_PAGTO)');
    QArq.Sql.Add('AND (TRANSACOES.BALANCO <> :BALANCO)');
    QArq.Sql.Add('AND (TRANSACOES.DT_ENT_SAI BETWEEN :DT_INICIAL AND :DT_FINAL)');
//    QArq.Sql.Add('GROUP BY TRANSITENS.TRANSACAO_ID, TRANSACOES.DT_TRANS, TRANSACOES.DT_MOVIMENTO, TABELAS.COD_CONTABIL, BANCOS.COD_CONTABIL, TRANSACOES.EMPRESA_ID, TRANSACOES.C_CUSTO_ID, ' +
//                 'TRANSACOES.TPCTB, TRANSACOES.HISTORICO, TRANSACOES.AUTORIZ_ID, TRANSACOES.NUM_DOC, TRANSACOES.FLUXO_CAIXA_ID');

    QArq.ParamByName('TIPO_TRANSACAO').AsString := 'T';
    QArq.ParamByName('TIPO_TABELA').AsString    := '4';
    QArq.ParamByName('CONDUTA').AsString        := '01';
    QArq.ParamByName('DEPTO').AsString          := '07';
    QArq.ParamByName('MODELO').AsString         := '2D';
    QArq.ParamByName('COND_PAGTO').AsString     := 'A VISTA';
    QArq.ParamByName('BALANCO').AsString        := 'AGRUPADO';
    QArq.ParamByName('DT_INICIAL').AsDateTime   := Dtmen.Date;
    QArq.ParamByName('DT_FINAL').AsDateTime     := Dtmai.Date;

    QArq.Prepare;
    QArq.ExecSql;



    // Venda a Prazo Nfe (DB Cliente - CR Cta.)

    QArq.Sql.Clear;
    QArq.Sql.Add('INSERT INTO RAZAO(TRANSACAO_ID, TIPO_TRANSACAO, DT_TRANS, DT_MOVIMENTO, CONTA_DB, CONTA_CR, EMPRESA_ID, C_CUSTO_ID, TPCTB, HISTORICO, VALOR, AUTORIZ_ID, NUM_DOC)');
    QArq.Sql.Add('SELECT TRANSACOES.TRANSACAO_ID, :TIPO_TRANSACAO, TRANSACOES.DT_ENT_SAI, TRANSACOES.DT_MOVIMENTO, CLIENTES.COD_CONTABIL, TABELAS.COD_CONTABIL, TRANSACOES.EMPRESA_ID, TRANSACOES.C_CUSTO_ID, ' +
                 'TRANSACOES.TPCTB, TRANSACOES.HISTORICO, TRANSACOES.VALOR , TRANSACOES.AUTORIZ_ID, TRANSACOES.NUM_DOC');
    //SUM(TRANSITENS.VR_TOTAL + TRANSITENS.VALOR_ICMS_ST + TRANSITENS.VR_FRETE + TRANSITENS.VR_ACRESCIMO + TRANSITENS.VR_IPI - TRANSITENS.DESC_RODAPE)

    QArq.Sql.Add('FROM TRANSACOES');
   // QArq.Sql.Add('INNER JOIN TRANSACOES');
   // QArq.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
    QArq.Sql.Add('INNER JOIN CLIENTES');
    QArq.Sql.Add('ON (TRANSACOES.CLIENTE_ID = CLIENTES.CLIENTE_ID)');
    QArq.Sql.Add('INNER JOIN TABELAS');
    QArq.Sql.Add('ON (TRANSACOES.CONTA_ID = TABELAS.TABELA_ID AND TABELAS.TIPO_TABELA = :TIPO_TABELA)');
    QArq.Sql.Add('WHERE');
    QArq.Sql.Add('(TRANSACOES.CONDUTA = :CONDUTA)');
    QArq.Sql.Add('AND (TRANSACOES.DEPTO = :DEPTO)');
    QArq.Sql.Add('AND (TRANSACOES.MODELO <> :MODELO)');
    QArq.Sql.Add('AND (TRANSACOES.COND_PAGTO = :COND_PAGTO)');
    QArq.Sql.Add('AND (TRANSACOES.BALANCO <> :BALANCO)');
    QArq.Sql.Add('AND (TRANSACOES.DT_ENT_SAI BETWEEN :DT_INICIAL AND :DT_FINAL)');
 //   QArq.Sql.Add('GROUP BY TRANSITENS.TRANSACAO_ID, TRANSACOES.DT_TRANS, TRANSACOES.DT_MOVIMENTO, CLIENTES.COD_CONTABIL, TABELAS.COD_CONTABIL, TRANSACOES.EMPRESA_ID, TRANSACOES.C_CUSTO_ID, ' +
 //                'TRANSACOES.TPCTB, TRANSACOES.HISTORICO, TRANSACOES.AUTORIZ_ID, TRANSACOES.NUM_DOC');

    QArq.ParamByName('TIPO_TRANSACAO').AsString := 'T';
    QArq.ParamByName('TIPO_TABELA').AsString    := '4';
    QArq.ParamByName('CONDUTA').AsString        := '01';
    QArq.ParamByName('DEPTO').AsString          := '07';
    QArq.ParamByName('MODELO').AsString         := '2D';
    QArq.ParamByName('COND_PAGTO').AsString     := 'A PRAZO';
    QArq.ParamByName('BALANCO').AsString        := 'AGRUPADO';
    QArq.ParamByName('DT_INICIAL').AsDateTime   := Dtmen.Date;
    QArq.ParamByName('DT_FINAL').AsDateTime     := Dtmai.Date;

    QArq.Prepare;
    QArq.ExecSql;






    // Devolução de Venda (DB Cx/Bco. - CR Cta.)

    QArq.Sql.Clear;
    QArq.Sql.Add('INSERT INTO RAZAO(TRANSACAO_ID, TIPO_TRANSACAO, DT_TRANS, DT_MOVIMENTO, CONTA_DB, CONTA_CR, EMPRESA_ID, C_CUSTO_ID, TPCTB, HISTORICO, VALOR, AUTORIZ_ID, NUM_DOC, FLUXO_CAIXA_ID)');
    QArq.Sql.Add('SELECT TRANSACOES.TRANSACAO_ID, :TIPO_TRANSACAO, TRANSACOES.DT_TRANS, TRANSACOES.DT_MOVIMENTO, TABELAS.COD_CONTABIL, BANCOS.COD_CONTABIL, TRANSACOES.EMPRESA_ID, TRANSACOES.C_CUSTO_ID, ' +
                 'TRANSACOES.TPCTB, TRANSACOES.HISTORICO,TRANSACOES.VALOR , TRANSACOES.AUTORIZ_ID, TRANSACOES.NUM_DOC, TRANSACOES.FLUXO_CAIXA_ID');
    //SUM(TRANSITENS.VR_TOTAL + TRANSITENS.VALOR_ICMS_ST + TRANSITENS.VR_FRETE + TRANSITENS.VR_ACRESCIMO + TRANSITENS.VR_IPI - TRANSITENS.DESC_RODAPE)
    QArq.Sql.Add('FROM TRANSACOES');
    //QArq.Sql.Add('INNER JOIN TRANSACOES');
    //QArq.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
    QArq.Sql.Add('INNER JOIN BANCOS');
    QArq.Sql.Add('ON (TRANSACOES.BANCO_ID = BANCOS.BANCO_ID)');
    QArq.Sql.Add('INNER JOIN TABELAS');
    QArq.Sql.Add('ON (TRANSACOES.CONTA_ID = TABELAS.TABELA_ID AND TABELAS.TIPO_TABELA = :TIPO_TABELA)');
    QArq.Sql.Add('WHERE');
    QArq.Sql.Add('(TRANSACOES.CONDUTA = :CONDUTA)');
    QArq.Sql.Add('AND (TRANSACOES.DEPTO = :DEPTO)');
    QArq.Sql.Add('AND (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
    //QArq.Sql.Add('GROUP BY TRANSITENS.TRANSACAO_ID, TRANSACOES.DT_TRANS, TRANSACOES.DT_MOVIMENTO, BANCOS.COD_CONTABIL, TABELAS.COD_CONTABIL, TRANSACOES.EMPRESA_ID, TRANSACOES.C_CUSTO_ID, ' +
    //             'TRANSACOES.TPCTB, TRANSACOES.HISTORICO, TRANSACOES.AUTORIZ_ID, TRANSACOES.NUM_DOC, TRANSACOES.FLUXO_CAIXA_ID');

    QArq.ParamByName('TIPO_TRANSACAO').AsString := 'T';
    QArq.ParamByName('TIPO_TABELA').AsString    := '4';
    QArq.ParamByName('CONDUTA').AsString        := '02';
    QArq.ParamByName('DEPTO').AsString          := '10';
    QArq.ParamByName('DT_INICIAL').AsDateTime   := Dtmen.Date;
    QArq.ParamByName('DT_FINAL').AsDateTime     := Dtmai.Date;

    QArq.Prepare;
    QArq.ExecSql;



    // Venda a Prazo c/ Entrada (DB Cx/Bco. - CR Cliente)

    QArq.Sql.Clear;
    QArq.Sql.Add('INSERT INTO RAZAO(TRANSACAO_ID, TIPO_TRANSACAO, DT_TRANS, DT_MOVIMENTO, CONTA_DB, CONTA_CR, EMPRESA_ID, C_CUSTO_ID, TPCTB, HISTORICO, VALOR, AUTORIZ_ID, NUM_DOC, FLUXO_CAIXA_ID)');
    QArq.Sql.Add('SELECT TRANSACOES.TRANSACAO_ID, :TIPO_TRANSACAO, TRANSACOES.DT_TRANS, TRANSACOES.DT_MOVIMENTO, BANCOS.COD_CONTABIL, CLIENTES.COD_CONTABIL, TRANSACOES.EMPRESA_ID, TRANSACOES.C_CUSTO_ID, ' +
                 'TRANSACOES.TPCTB, TRANSACOES.HISTORICO, TRANSPARCELAS.VALOR, TRANSACOES.AUTORIZ_ID, TRANSACOES.NUM_DOC, :FLUXO_CAIXA_ID');
    QArq.Sql.Add('FROM TRANSPARCELAS');
    QArq.Sql.Add('INNER JOIN TRANSACOES');
    QArq.Sql.Add('ON (TRANSPARCELAS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
    QArq.Sql.Add('INNER JOIN BANCOS');
    QArq.Sql.Add('ON (TRANSPARCELAS.BANCO_ID = BANCOS.BANCO_ID)');
    QArq.Sql.Add('LEFT JOIN CLIENTES');
    QArq.Sql.Add('ON (TRANSACOES.CLIENTE_ID = CLIENTES.CLIENTE_ID)');
    QArq.Sql.Add('WHERE');
    QArq.Sql.Add('(TRANSPARCELAS.BANCO_ID > 0)');
    QArq.Sql.Add('AND (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');

    QArq.ParamByName('TIPO_TRANSACAO').AsString  := 'R';
    QArq.ParamByName('FLUXO_CAIXA_ID').AsInteger := 1;
    QArq.ParamByName('DT_INICIAL').AsDateTime    := Dtmen.Date;
    QArq.ParamByName('DT_FINAL').AsDateTime      := Dtmai.Date;

    QArq.Prepare;
    QArq.ExecSql;



    // Compra a Prazo c/ Entrada (DB Fornecedor - CR Cx/Bco.)

    QArq.Sql.Clear;
    QArq.Sql.Add('INSERT INTO RAZAO(TRANSACAO_ID, TIPO_TRANSACAO, DT_TRANS, DT_MOVIMENTO, CONTA_DB, CONTA_CR, EMPRESA_ID, C_CUSTO_ID, TPCTB, HISTORICO, VALOR, AUTORIZ_ID, NUM_DOC, FLUXO_CAIXA_ID)');
    QArq.Sql.Add('SELECT TRANSACOES.TRANSACAO_ID, :TIPO_TRANSACAO, TRANSACOES.DT_TRANS, TRANSACOES.DT_MOVIMENTO, FORNECEDORES.COD_CONTABIL, BANCOS.COD_CONTABIL, TRANSACOES.EMPRESA_ID, TRANSACOES.C_CUSTO_ID, ' +
                 'TRANSACOES.TPCTB, TRANSACOES.HISTORICO, TRANSPARCELAS.VALOR, TRANSACOES.AUTORIZ_ID, TRANSACOES.NUM_DOC, :FLUXO_CAIXA_ID');
    QArq.Sql.Add('FROM TRANSPARCELAS');
    QArq.Sql.Add('INNER JOIN TRANSACOES');
    QArq.Sql.Add('ON (TRANSPARCELAS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
    QArq.Sql.Add('INNER JOIN BANCOS');
    QArq.Sql.Add('ON (TRANSPARCELAS.BANCO_ID = BANCOS.BANCO_ID)');
    QArq.Sql.Add('INNER JOIN FORNECEDORES');
    QArq.Sql.Add('ON (TRANSACOES.FORNECEDOR_ID = FORNECEDORES.FORNECEDOR_ID)');
    QArq.Sql.Add('WHERE');
    QArq.Sql.Add('(TRANSPARCELAS.BANCO_ID > 0)');
    QArq.Sql.Add('AND (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');

    QArq.ParamByName('TIPO_TRANSACAO').AsString  := 'R';
    QArq.ParamByName('FLUXO_CAIXA_ID').AsInteger := 3;
    QArq.ParamByName('DT_INICIAL').AsDateTime    := Dtmen.Date;
    QArq.ParamByName('DT_FINAL').AsDateTime      := Dtmai.Date;

    QArq.Prepare;
    QArq.ExecSql;



  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;


procedure TFrmFechamento_Periodo.SummaryBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
if Saldo_Anterior.Checked then
  Begin
   QRLabel16.Enabled := True;
   QRLabel12.Enabled := True;
   QRLabel12.Caption := FormatFloat('#,##0.00', Abs(Saldo));

  if SALDO >= 0 then
    QRLabel12.Left := 521
  else
  Begin
    QRlabel12.Left := 615;
    QRlabel12.Caption := '-' + QRlabel12.Caption;
  End;
  End;

end;

procedure TFrmFechamento_Periodo.BitBtn1Click(Sender: TObject);
begin
 if not ThereIs('Recuperação de Saldos') then
    TFrmRecupera_Saldos.Create(Application);

  if LeIni(Arq_Ini, 'Sistema', 'Organizar Janelas Automaticamente') = 'True' then
    Cascade;
end;

procedure TFrmFechamento_Periodo.btnCaixa_BancoClick(Sender: TObject);
begin
  try
    Caixa_Banco.Value := GetConsulta('BANCOS', 0, 0, StrToInt(Caixa_Banco.Text));
  except
    Caixa_Banco.Value := GetConsulta('BANCOS', 0, 0, 0);
  end;
end;

procedure TFrmFechamento_Periodo.btnExecutaClick(Sender: TObject);
var
X,COD: Integer;
contas: string;
Marcado : Boolean;
begin

// 122, 325
  try
    if Chk_Caixas.Checked then
    Begin
     Fdac_Temp.First;
     Marcado := False;
     while not Fdac_Temp.Eof do
     begin

      if Fdac_Temp.FieldByName('MARCAR').AsString = 'X' Then
         Marcado := True;

      Fdac_Temp.Next;

     end;

     if not Marcado then
     Begin
     Application.MessageBox('Favor selecionar um caixa.', PChar(Msg_Title), mb_IconInformation);
     DBGrid1.SetFocus;
     Abort;
     End;

    End;

    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    Saldo := 0;
    Sd    := 0;
    if (Dtmen.Date) <> (Dtmai.Date) then
    Recupera_Saldos;

    if Saldo_Anterior.Checked then
    begin
     QRShape6.Enabled  := True;
     QRLabel10.Enabled := True;
     QRlabel13.Enabled := True;
     QRLabel16.Enabled := True;
     QRLabel12.Enabled := True;

      if Caixa_banco.Value = 0 then
      Begin
      QRel.Sql.Clear;
      QRel.Sql.Add('SELECT BALANCO_CONTABIL.* FROM BALANCO_CONTABIL ');
      QRel.Sql.Add('INNER JOIN BANCOS ON (BALANCO_CONTABIL.COD_CONTABIL = BANCOS.COD_CONTABIL)');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(BALANCO_CONTABIL.DT_BALANCO = :DT_BALANCO)');
      QRel.Sql.Add('AND (BALANCO_CONTABIL.EMPRESA_ID = :EMPRESA_ID)');

      QRel.ParamByName('DT_BALANCO').AsDateTime := FrmPrincipal.QEmpresa.FieldByName('DT_ULT_BALANCO').AsDateTime;
      QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;

      QRel.Prepare;
      QRel.Open;

        if not QRel.IsEmpty then
        begin
          if QRel.FieldByName('CRDB').AsString = 'D' then
            Saldo := Saldo + QRel.FieldByName('SALDO_ATUAL').AsFloat;

          if QRel.FieldByName('CRDB').AsString = 'C' then
            Saldo := Saldo - QRel.FieldByName('SALDO_ATUAL').AsFloat;
        end;

        for X := 1 to 2 do
        begin
          QRel.Sql.Clear;
          QRel.Sql.Add('SELECT SUM(RAZAO.VALOR) AS VALOR ');
          QRel.Sql.Add('FROM RAZAO ');
          QRel.SQL.Add('INNER JOIN BANCOS ON ((RAZAO.CONTA_DB = BANCOS.COD_CONTABIL) or (RAZAO.CONTA_CR = BANCOS.COD_CONTABIL))');
          QRel.Sql.Add('INNER JOIN TRANSACOES ON TRANSACOES.TRANSACAO_ID = RAZAO.TRANSACAO_ID ');
          QRel.Sql.Add('WHERE');

          if X = 1 then
          begin

            if Chk_Caixas.Checked then
            Begin
             Fdac_Temp.First;
             QRel.SQL.Text := QRel.SQL.Text  + ' ( ';
             COD:= 1;
             while not Fdac_Temp.Eof do
             begin


              if (Fdac_Temp.FieldByName('MARCAR').AsString = 'X') and (Fdac_Temp.FieldByName('COD_CONTABIL').AsString <> '') Then
               Begin
                QRel.SQL.Text := QRel.SQL.Text  + ' (RAZAO.CONTA_DB = :COD_CONTABIL_' + StrZero(IntToStr(COD),2,0) + ')  OR ' ;
                QRel.ParamByName('COD_CONTABIL_'+ StrZero(IntToStr(COD),2,0)).AsString := Fdac_Temp.FieldByName('COD_CONTABIL').AsString;
               End;

               Fdac_Temp.Next;

               Inc(COD)
             end;
             QRel.SQL.Text := Copy (QRel.SQL.Text , 1 ,  Length(QRel.SQL.Text) - 5)  + ')';
            End
            Else
            QRel.Sql.Add('(RAZAO.CONTA_DB = BANCOS.COD_CONTABIL)');



          end
          else
          Begin
            if Chk_Caixas.Checked then
            Begin
             Fdac_Temp.First;
             QRel.SQL.Text := QRel.SQL.Text  + ' ( ';
             COD:= 1;
             while not Fdac_Temp.Eof do
             begin


              if (Fdac_Temp.FieldByName('MARCAR').AsString = 'X') and (Fdac_Temp.FieldByName('COD_CONTABIL').AsString <> '') Then
               Begin
                QRel.SQL.Text := QRel.SQL.Text  + ' (RAZAO.CONTA_CR = :COD_CONTABIL_' + StrZero(IntToStr(COD),2,0) + ')  OR ' ;
                QRel.ParamByName('COD_CONTABIL_'+ StrZero(IntToStr(COD),2,0)).AsString := Fdac_Temp.FieldByName('COD_CONTABIL').AsString;
               End;

               Fdac_Temp.Next;

               Inc(COD)
             end;
             QRel.SQL.Text := Copy (QRel.SQL.Text , 1 ,  Length(QRel.SQL.Text) - 5)  + ')';
            End
            Else
             QRel.Sql.Add('(RAZAO.CONTA_CR = BANCOS.COD_CONTABIL)');
          End;

          QRel.Sql.Add('AND ((TRANSACOES.FINALIZADORA_ID = :FINALIZADORA) OR (TRANSACOES.FINALIZADORA_ID = 0) OR (RAZAO.TIPO_TRANSACAO = :TIPO_TRANSACAO)) ');
          QRel.Sql.Add('AND (RAZAO.DT_TRANS < :DT_INICIAL)');
          QRel.Sql.Add('AND (RAZAO.EMPRESA_ID = :EMPRESA_ID)');
          QRel.Sql.Add('AND (RAZAO.TPCTB <= :TPCTB)');
          QRel.Sql.Add('AND (TRANSACOES.BALANCO <> :BALANCO)');
          QRel.Sql.Add('AND (RAZAO.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM TRANSACOES WHERE (CONDUTA = :COND_07 OR CONDUTA = :COND_08) AND HISTORICO LIKE ' + #39 + 'Ref. Devolução%' + #39 + '))');
          QRel.Sql.Add('AND (RAZAO.TRANSACAO_ID NOT IN (SELECT RAZAO.TRANSACAO_ID FROM RAZAO ');
          QRel.Sql.Add('INNER JOIN TRANSACOES ON TRANSACOES.TRANSACAO_ID=RAZAO.TRANSACAO_ID ');
          QRel.Sql.Add('WHERE DEPTO = :DEPTO AND COND_PAGTO = :COND_PAGTO))');
          QRel.Sql.Add('AND (RAZAO.TRANSACAO_ID NOT IN (SELECT RAZAO.TRANSACAO_ID FROM RAZAO');
          QRel.Sql.Add('INNER JOIN NOTAS_CANCELADAS ON NOTAS_CANCELADAS.TRANSACAO_ID=RAZAO.TRANSACAO_ID))');
          QRel.Sql.Add(' AND (RAZAO.TRANSACAO_ID NOT IN(SELECT TRANSACAO_ID FROM TRANSACOES WHERE TIPO_VENDA = :TIPO_VENDA))');

          QRel.ParamByName('FINALIZADORA').AsInteger     := QFinalizadora.FieldByName('FINALIZADORA_ID').AsInteger;
          QRel.ParamByName('DT_INICIAL').AsDateTime      := Dtmen.Date;
          QRel.ParamByName('EMPRESA_ID').AsInteger       := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
          QRel.ParamByName('TPCTB').AsString             := FrmData.QAcesso.FieldByName('TPCTB').AsString;
          QRel.ParamByName('DEPTO').AsString             := '10';
          QRel.ParamByName('COND_07').AsString           := '07';
          QRel.ParamByName('COND_08').AsString           := '08';
          QRel.ParamByName('COND_PAGTO').AsString        := 'A PRAZO';
          QRel.ParamByName('TIPO_TRANSACAO').AsString    := 'R';
          QRel.ParamByName('TIPO_VENDA').AsString        := 'PAGTO CARTAO';
          QRel.ParamByName('BALANCO').AsString           := 'AGRUPADO';


          QRel.Prepare;
          QRel.Open;

          if X = 1 then
            Saldo := SALDO + QRel.FieldByName('VALOR').AsFloat
          else
            Saldo := SALDO - QRel.FieldByName('VALOR').AsFloat;
        end;

      Sd := Saldo;

      //showmessage(FloatToStr(saldo));


      End
      Else
      Begin
      QRel.Sql.Clear;
      QRel.Sql.Add('SELECT * FROM BALANCO_CONTABIL ');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(COD_CONTABIL = :COD_CONTABIL)');
      QRel.Sql.Add('AND (DT_BALANCO = :DT_BALANCO)');
      QRel.Sql.Add('AND (EMPRESA_ID = :EMPRESA_ID)');

      QRel.ParamByName('COD_CONTABIL').AsString := QBanco.FieldByName('COD_CONTABIL').AsString;
      QRel.ParamByName('DT_BALANCO').AsDateTime := FrmPrincipal.QEmpresa.FieldByName('DT_ULT_BALANCO').AsDateTime;
      QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;

      QRel.Prepare;
      QRel.Open;

        if not QRel.IsEmpty then
        begin
          if QRel.FieldByName('CRDB').AsString = 'D' then
            Saldo := Saldo + QRel.FieldByName('SALDO_ATUAL').AsFloat;

          if QRel.FieldByName('CRDB').AsString = 'C' then
            Saldo := Saldo - QRel.FieldByName('SALDO_ATUAL').AsFloat;
        end;

        for X := 1 to 2 do
        begin
          QRel.Sql.Clear;
          QRel.Sql.Add('SELECT SUM(RAZAO.VALOR) AS VALOR');
          QRel.Sql.Add('FROM RAZAO');
          QRel.Sql.Add('INNER JOIN TRANSACOES ON TRANSACOES.TRANSACAO_ID = RAZAO.TRANSACAO_ID');
          QRel.Sql.Add('WHERE');

           if X = 1 then
            begin

              if Chk_Caixas.Checked then
              Begin
               Fdac_Temp.First;
               QRel.SQL.Text := QRel.SQL.Text  + ' ( ';
               COD:= 1;
               while not Fdac_Temp.Eof do
               begin


                if (Fdac_Temp.FieldByName('MARCAR').AsString = 'X') and (Fdac_Temp.FieldByName('COD_CONTABIL').AsString <> '') Then
                 Begin
                  QRel.SQL.Text := QRel.SQL.Text  + ' (RAZAO.CONTA_DB = :COD_CONTABIL_' + StrZero(IntToStr(COD),2,0) + ')  OR ' ;
                  QRel.ParamByName('COD_CONTABIL_'+ StrZero(IntToStr(COD),2,0)).AsString := Fdac_Temp.FieldByName('COD_CONTABIL').AsString;
                 End;

                 Fdac_Temp.Next;

                 Inc(COD)
               end;
               QRel.SQL.Text := Copy (QRel.SQL.Text , 1 ,  Length(QRel.SQL.Text) - 5)  + ')';
              End
              Else
              QRel.Sql.Add('(RAZAO.CONTA_DB = BANCOS.COD_CONTABIL)');



            end
           else
           Begin
            if Chk_Caixas.Checked then
            Begin
             Fdac_Temp.First;
             QRel.SQL.Text := QRel.SQL.Text  + ' ( ';
             COD:= 1;
             while not Fdac_Temp.Eof do
             begin


              if (Fdac_Temp.FieldByName('MARCAR').AsString = 'X') and (Fdac_Temp.FieldByName('COD_CONTABIL').AsString <> '') Then
               Begin
                QRel.SQL.Text := QRel.SQL.Text  + ' (RAZAO.CONTA_CR = :COD_CONTABIL_' + StrZero(IntToStr(COD),2,0) + ')  OR ' ;
                QRel.ParamByName('COD_CONTABIL_'+ StrZero(IntToStr(COD),2,0)).AsString := Fdac_Temp.FieldByName('COD_CONTABIL').AsString;
               End;

               Fdac_Temp.Next;

               Inc(COD)
             end;
             QRel.SQL.Text := Copy (QRel.SQL.Text , 1 ,  Length(QRel.SQL.Text) - 5)  + ')';
            End
            Else
             QRel.Sql.Add('(RAZAO.CONTA_CR = BANCOS.COD_CONTABIL)');
           End;

          QRel.Sql.Add('AND (RAZAO.DT_TRANS < :DT_INICIAL)');
          QRel.Sql.Add('AND (RAZAO.EMPRESA_ID = :EMPRESA_ID)');
          QRel.Sql.Add('AND (RAZAO.TPCTB <= :TPCTB)');
          QRel.Sql.Add('AND (TRANSACOES.BALANCO <> :BALANCO)');
          QRel.Sql.Add('AND ((TRANSACOES.FINALIZADORA_ID = :FINALIZADORA) OR (TRANSACOES.FINALIZADORA_ID = 0) OR (RAZAO.TIPO_TRANSACAO = :TIPO_TRANSACAO)) ');
          QRel.Sql.Add('AND (RAZAO.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM TRANSACOES WHERE (CONDUTA = :COND_07 OR CONDUTA = :COND_08) AND HISTORICO LIKE ' + #39 + 'Ref. Devolução%' + #39 + '))');
          QRel.Sql.Add('AND (RAZAO.TRANSACAO_ID NOT IN (SELECT RAZAO.TRANSACAO_ID FROM RAZAO ');
          QRel.Sql.Add('INNER JOIN TRANSACOES ON TRANSACOES.TRANSACAO_ID=RAZAO.TRANSACAO_ID ');
          QRel.Sql.Add('WHERE DEPTO = :DEPTO AND COND_PAGTO = :COND_PAGTO))');
          QRel.Sql.Add('AND (RAZAO.TRANSACAO_ID NOT IN (SELECT RAZAO.TRANSACAO_ID FROM RAZAO');
          QRel.Sql.Add('INNER JOIN NOTAS_CANCELADAS ON NOTAS_CANCELADAS.TRANSACAO_ID=RAZAO.TRANSACAO_ID))');
          QRel.Sql.Add('AND (RAZAO.TRANSACAO_ID NOT IN(SELECT TRANSACAO_ID FROM TRANSACOES WHERE TIPO_VENDA = :TIPO_VENDA))');


          QRel.ParamByName('FINALIZADORA').AsInteger     := QFinalizadora.FieldByName('FINALIZADORA_ID').AsInteger;
          QRel.ParamByName('CONTA').AsString             := QBanco.FieldByName('COD_CONTABIL').AsString;
          QRel.ParamByName('DT_INICIAL').AsDateTime      := Dtmen.Date;
          QRel.ParamByName('EMPRESA_ID').AsInteger       := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
          QRel.ParamByName('TPCTB').AsString             := FrmData.QAcesso.FieldByName('TPCTB').AsString;
          QRel.ParamByName('DEPTO').AsString             := '10';
          QRel.ParamByName('COND_07').AsString           := '07';
          QRel.ParamByName('COND_08').AsString           := '08';
          QRel.ParamByName('COND_PAGTO').AsString        := 'A PRAZO';
          QRel.ParamByName('TIPO_TRANSACAO').AsString    := 'R';
          QRel.ParamByName('TIPO_VENDA').AsString        := 'PAGTO CARTAO';
          QRel.ParamByName('BALANCO').AsString           := 'AGRUPADO';


          QRel.Prepare;
          QRel.Open;

          if X = 1 then
            Saldo := SALDO + QRel.FieldByName('VALOR').AsFloat
          else
            Saldo := SALDO - QRel.FieldByName('VALOR').AsFloat;
        end;

      Sd := Saldo;
      End;
    end
    Else
    Begin
     QRShape6.Enabled  := False;
     QRLabel10.Enabled := False;
     QRlabel13.Enabled := False;
     QRLabel16.Enabled := False;
     QRLabel12.Enabled := False;
    End;



    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT DT_TRANS, LEGENDA ,HISTORICO, DEBITO, CREDITO');
    QRel.Sql.Add('FROM');
    QRel.Sql.Add('(');

    //if VendaEcf.Checked then
    //begin

    QRel.Sql.Add('SELECT RAZAO.DT_TRANS, NULL LEGENDA , ' + #39 + '01 - VENDAS ECF' + #39 + ' HISTORICO , 0 DEBITO, SUM(RAZAO.VALOR) CREDITO');
    QRel.Sql.Add('FROM RAZAO');
    QRel.Sql.Add('INNER JOIN TRANSACOES ON TRANSACOES.TRANSACAO_ID = RAZAO.TRANSACAO_ID');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(RAZAO.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
    QRel.Sql.Add('AND (RAZAO.EMPRESA_ID = :EMPRESA_ID)');
    QRel.Sql.Add('AND (RAZAO.TPCTB <= :TPCTB)');
    QRel.Sql.Add('AND (RAZAO.HISTORICO <> :SUPRIMENTO)');
    QRel.Sql.Add('AND (RAZAO.CONTA_DB IN (SELECT COD_CONTABIL FROM BANCOS WHERE TIPO_LIMITE <> ' +#39 + 'EXCLUSO DO SALDO' + #39' ))');
    QRel.Sql.Add('AND ((TRANSACOES.FINALIZADORA_ID = :FINALIZADORA) OR (TRANSACOES.FINALIZADORA_ID = 0))');
    QRel.Sql.Add('AND (TRANSACOES.MODELO = :MODELO)');
    QRel.Sql.Add('AND (COND_PAGTO <> :COND_PAGTO02)');

    if Caixa_Banco.Value > 0 then
    QRel.Sql.Add('AND (RAZAO.CONTA_DB = :CONTA_DB)')
    else if Chk_Caixas.Checked then
    Begin
     Fdac_Temp.First;
     QRel.SQL.Text := QRel.SQL.Text  + ' AND ( ';
     COD:= 1;
     while not Fdac_Temp.Eof do
     begin


      if (Fdac_Temp.FieldByName('MARCAR').AsString = 'X') and (Fdac_Temp.FieldByName('COD_CONTABIL').AsString <> '') Then
       Begin
        QRel.SQL.Text := QRel.SQL.Text  + ' (RAZAO.CONTA_DB = :COD_CONTABIL_' + StrZero(IntToStr(COD),2,0) + ')  OR ' ;
        QRel.ParamByName('COD_CONTABIL_'+ StrZero(IntToStr(COD),2,0)).AsString := Fdac_Temp.FieldByName('COD_CONTABIL').AsString;
       End;

       Fdac_Temp.Next;

       Inc(COD)
     end;
     QRel.SQL.Text := Copy (QRel.SQL.Text , 1 ,  Length(QRel.SQL.Text) - 5)  + ')';
    End;


    QRel.Sql.Add('GROUP BY RAZAO.DT_TRANS');

    if Caixa_Banco.Value > 0 then
    Begin
    SearchBanco;
    QRel.ParamByName('CONTA_DB').AsString     := QBanco.FieldByName('COD_CONTABIL').AsString;
    End;

    QRel.Sql.Add('UNION ALL');

    QRel.Sql.Add('SELECT RAZAO.DT_TRANS, NULL LEGENDA , ' + #39 + '02 - VENDAS COM ENTRADA' + #39 + ' HISTORICO , 0 DEBITO, SUM(RAZAO.VALOR) CREDITO');
    QRel.Sql.Add('FROM RAZAO');
    QRel.Sql.Add('INNER JOIN TRANSACOES ON TRANSACOES.TRANSACAO_ID = RAZAO.TRANSACAO_ID');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(RAZAO.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
    QRel.Sql.Add('AND (RAZAO.EMPRESA_ID = :EMPRESA_ID)');
    QRel.Sql.Add('AND (RAZAO.TPCTB <= :TPCTB)');
    QRel.Sql.Add('AND (RAZAO.HISTORICO <> :SUPRIMENTO)');
    QRel.Sql.Add('AND (RAZAO.CONTA_DB IN (SELECT COD_CONTABIL FROM BANCOS WHERE TIPO_LIMITE <> ' +#39 + 'EXCLUSO DO SALDO' + #39' ))');
   // QRel.Sql.Add('AND (TRANSACOES.FINALIZADORA_ID = :FINALIZADORA)');
    QRel.Sql.Add('AND (TRANSACOES.MODELO = :MODELO)');
    QRel.Sql.Add('AND (RAZAO.TIPO_TRANSACAO =  :TIPO_TRANSACAO)');

    if Caixa_Banco.Value > 0 then
    QRel.Sql.Add('AND (RAZAO.CONTA_DB = :CONTA_DB)')

    else if Chk_Caixas.Checked then
    Begin
     Fdac_Temp.First;
     QRel.SQL.Text := QRel.SQL.Text  + ' AND ( ';
     COD:= 1;
     while not Fdac_Temp.Eof do
     begin


      if (Fdac_Temp.FieldByName('MARCAR').AsString = 'X') and (Fdac_Temp.FieldByName('COD_CONTABIL').AsString <> '') Then
       Begin
        QRel.SQL.Text := QRel.SQL.Text  + ' (RAZAO.CONTA_DB = :COD_CONTABIL_' + StrZero(IntToStr(COD),2,0) + ')  OR ' ;
        QRel.ParamByName('COD_CONTABIL_'+ StrZero(IntToStr(COD),2,0)).AsString := Fdac_Temp.FieldByName('COD_CONTABIL').AsString;
       End;

       Fdac_Temp.Next;

       Inc(COD)
     end;
     QRel.SQL.Text := Copy (QRel.SQL.Text , 1 ,  Length(QRel.SQL.Text) - 5)  + ')';
    End;


    QRel.Sql.Add('GROUP BY RAZAO.DT_TRANS');


    if Caixa_Banco.Value > 0 then
    Begin
    SearchBanco;
    QRel.ParamByName('CONTA_DB').AsString     := QBanco.FieldByName('COD_CONTABIL').AsString;
    End;
     {
    if Chk_Caixas.Checked then
    begin
     Fdac_Temp.First;
     contas := '';
     while not Fdac_Temp.Eof do
     begin
     if contas = '' Then
     contas := contas + Fdac_Temp.FieldByName('COD_CONTABIL').AsString
     else
     contas := contas + ',' + Fdac_Temp.FieldByName('COD_CONTABIL').AsString;

     Fdac_Temp.Next;
     end;

     QRel.ParamByName('CONTA_DB').AsString     := contas;

    end;
    }
    QRel.Sql.Add('UNION ALL');

    QRel.Sql.Add('SELECT DT_TRANS, NULL LEGENDA , ' + #39 + '03 - SUPRIMENTO' + #39 + ' HISTORICO , 0 DEBITO, SUM(VALOR) CREDITO');
    QRel.Sql.Add('FROM RAZAO');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
    QRel.Sql.Add('AND (EMPRESA_ID = :EMPRESA_ID)');
    QRel.Sql.Add('AND (TPCTB <= :TPCTB)');
    QRel.Sql.Add('AND (HISTORICO = :SUPRIMENTO)');
    QRel.Sql.Add('AND (CONTA_DB IN (SELECT COD_CONTABIL FROM BANCOS WHERE TIPO_LIMITE <> ' +#39 + 'EXCLUSO DO SALDO' + #39' ))');

    if Caixa_Banco.Value > 0 then
    QRel.Sql.Add('AND (RAZAO.CONTA_DB = :CONTA_DB)')

    else if Chk_Caixas.Checked then
    Begin
     Fdac_Temp.First;
     QRel.SQL.Text := QRel.SQL.Text  + ' AND ( ';
     COD:= 1;
     while not Fdac_Temp.Eof do
     begin


      if (Fdac_Temp.FieldByName('MARCAR').AsString = 'X') and (Fdac_Temp.FieldByName('COD_CONTABIL').AsString <> '') Then
       Begin
        QRel.SQL.Text := QRel.SQL.Text  + ' (RAZAO.CONTA_DB = :COD_CONTABIL_' + StrZero(IntToStr(COD),2,0) + ')  OR ' ;
        QRel.ParamByName('COD_CONTABIL_'+ StrZero(IntToStr(COD),2,0)).AsString := Fdac_Temp.FieldByName('COD_CONTABIL').AsString;
       End;

       Fdac_Temp.Next;

       Inc(COD)
     end;
     QRel.SQL.Text := Copy (QRel.SQL.Text , 1 ,  Length(QRel.SQL.Text) - 5)  + ')';
    End;

    QRel.Sql.Add('GROUP BY DT_TRANS');

    if Caixa_Banco.Value > 0 then
    Begin
    SearchBanco;
    QRel.ParamByName('CONTA_DB').AsString     := QBanco.FieldByName('COD_CONTABIL').AsString;
    End;


    QRel.Sql.Add('UNION ALL');

    QRel.Sql.Add('SELECT DT_TRANS, NULL LEGENDA ,' + #39 + '04 - SANGRIA' + #39 + ' HISTORICO, SUM(VALOR) DEBITO, 0 CREDITO');
    QRel.Sql.Add('FROM TRANSACOES');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
    QRel.Sql.Add('AND (EMPRESA_ID = :EMPRESA_ID)');
    QRel.Sql.Add('AND (TPCTB <= :TPCTB)');
    QRel.Sql.Add('AND (CONDUTA = :COND_02)');
    QRel.Sql.Add('AND (DEPTO = :DEPTO_02)');
    QRel.Sql.Add('AND (COND_PAGTO = :COND_PAGTO)');
    QRel.Sql.Add('AND (HISTORICO = :HIST_SANGRIA)');

    if Caixa_Banco.Value > 0 then
    Begin
    QRel.Sql.Add('AND (BANCO_ID = :BANCO_ID)');
    QRel.ParamByName('BANCO_ID').AsInteger := StrToInt(Caixa_Banco.Text);
    End

    else if Chk_Caixas.Checked then
    Begin
     Fdac_Temp.First;
     QRel.SQL.Text := QRel.SQL.Text  + ' AND ( ';
     while not Fdac_Temp.Eof do
     begin

     if Fdac_Temp.FieldByName('MARCAR').AsString = 'X' Then
     QRel.SQL.Text := QRel.SQL.Text  + ' (BANCO_ID = '+ Fdac_Temp.FieldByName('BANCO_ID').AsString + ')  OR ' ;
     Fdac_Temp.Next;

     end;
     QRel.SQL.Text := Copy (QRel.SQL.Text , 1 ,  Length(QRel.SQL.Text) - 5)  + ')';

    End
    Else
    QRel.Sql.Add('AND (BANCO_ID > 0)');


    QRel.Sql.Add('GROUP BY DT_TRANS, HISTORICO');


    QRel.ParamByName('SUPRIMENTO').AsString    :='SUPRIMENTO';
    QRel.ParamByName('FINALIZADORA').AsInteger := QFinalizadora.FieldByName('FINALIZADORA_ID').AsInteger;
    QRel.ParamByName('COND_PAGTO02').AsString  :='A PRAZO';
    QRel.ParamByName('HIST_SANGRIA').AsString  := 'SANGRIA';
    QRel.ParamByName('COND_02').AsString       := '02';
    QRel.ParamByName('DEPTO_02').AsString      := '02';
   // QRel.ParamByName('PARCELA_ID').AsString    := '00';


  //end;


    //if Compra.Checked then
    //begin
     //if VendaEcf.Checked then
        QRel.Sql.Add('UNION ALL');

      if not Compra.Checked then
      QRel.Sql.Add('SELECT DT_ENT_SAI DT_TRANS, NULL LEGENDA , ' + #39 + '05 - COMPRA SINTÉTICO ' + #39 + '   HISTORICO, SUM(VALOR) DEBITO , 0 CREDITO ')
      Else
      QRel.Sql.Add('SELECT TRANSACOES.DT_ENT_SAI DT_TRANS,NULL LEGENDA , ' + #39 + '05 - ' + #39 + ' || HISTORICO HISTORICO , TRANSACOES.VALOR DEBITO, 0 CREDITO');

      QRel.Sql.Add('FROM TRANSACOES');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSACOES.DT_ENT_SAI BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
     // QRel.Sql.Add('AND ((TRANSACOES.MODELO = :MODELO_01) OR (TRANSACOES.MODELO = :MODELO_02) OR (TRANSACOES.MODELO = :MODELO_03) OR (TRANSACOES.MODELO = :MODELO_04))');
      QRel.Sql.Add('AND (TRANSACOES.COND_PAGTO = :COND_PAGTO)');
      QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :COND_02)');
      QRel.Sql.Add('AND (TRANSACOES.DEPTO = :DEPTO_07)');
      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT RAZAO.TRANSACAO_ID FROM RAZAO');
      QRel.Sql.Add('INNER JOIN NOTAS_CANCELADAS ON NOTAS_CANCELADAS.TRANSACAO_ID=RAZAO.TRANSACAO_ID ))');


      if Caixa_Banco.Value > 0 then
      Begin
      QRel.Sql.Add('AND (BANCO_ID = :BANCO_ID)');
      QRel.ParamByName('BANCO_ID').AsInteger := StrToInt(Caixa_Banco.Text);
      End

      else if Chk_Caixas.Checked then
      Begin
       Fdac_Temp.First;
       QRel.SQL.Text := QRel.SQL.Text  + ' AND ( ';
       while not Fdac_Temp.Eof do
       begin

       if Fdac_Temp.FieldByName('MARCAR').AsString = 'X' Then
       QRel.SQL.Text := QRel.SQL.Text  + ' (BANCO_ID = '+ Fdac_Temp.FieldByName('BANCO_ID').AsString + ')  OR ' ;
       Fdac_Temp.Next;

       end;
       QRel.SQL.Text := Copy (QRel.SQL.Text , 1 ,  Length(QRel.SQL.Text) - 5)  + ')';

      End
      Else
      QRel.Sql.Add('AND (BANCO_ID > 0)');


      QRel.ParamByName('COND_PAGTO').AsString   := 'A VISTA';
      QRel.ParamByName('COND_02').AsString      := '02';
      QRel.ParamByName('DEPTO_07').AsString     := '07';
    {  QRel.ParamByName('MODELO_01').AsString    := '01';
      QRel.ParamByName('MODELO_02').AsString    := '1B';
      QRel.ParamByName('MODELO_03').AsString    := '04';
      QRel.ParamByName('MODELO_04').AsString    := '55';
      QRel.ParamByName('RECIBO').AsString       :='INUTILIZADA'; }


      if not Compra.Checked then
        QRel.Sql.Add('GROUP BY DT_ENT_SAI' );


    //end;

    //if VendaNfe.Checked then
    //begin
    // if (Compra.Checked) OR (VendaEcf.Checked) then
         QRel.Sql.Add('UNION ALL');

      if not VendaNfe.Checked then
      QRel.Sql.Add('SELECT DT_ENT_SAI DT_TRANS,NULL LEGENDA , ' + #39 + '06 - VENDA SINTÉTICO ' + #39 + '   HISTORICO, 0 DEBITO, SUM(VALOR) CREDITO')
      Else
      QRel.Sql.Add('SELECT TRANSACOES.DT_ENT_SAI DT_TRANS, NULL LEGENDA , ' + #39 + '06 - ' + #39 + ' || HISTORICO HISTORICO ,  0 DEBITO, TRANSACOES.VALOR CREDITO');

      QRel.Sql.Add('FROM TRANSACOES');
      // QRel.Sql.Add('INNER JOIN COMPL_NFISCAL ON COMPL_NFISCAL.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID ');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSACOES.DT_ENT_SAI BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND ((TRANSACOES.MODELO = :MODELO1) OR (TRANSACOES.MODELO = :MODELO2) OR (TRANSACOES.MODELO = :MODELO3) OR (TRANSACOES.MODELO = :MODELO4))');
      QRel.Sql.Add('AND (TRANSACOES.COND_PAGTO = :COND_PAGTO)');
      QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :COND_01)');
      QRel.Sql.Add('AND (TRANSACOES.DEPTO = :DEPTO_07)');
      QRel.Sql.Add('AND (TRANSACOES.BALANCO <> :BALANCO)');
      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT RAZAO.TRANSACAO_ID FROM RAZAO');
      QRel.Sql.Add('INNER JOIN NOTAS_CANCELADAS ON NOTAS_CANCELADAS.TRANSACAO_ID=RAZAO.TRANSACAO_ID ))');

      if Caixa_Banco.Value > 0 then
      QRel.Sql.Add('AND (BANCO_ID = :BANCO_ID)')

      else if Chk_Caixas.Checked then
      Begin
       Fdac_Temp.First;
       QRel.SQL.Text := QRel.SQL.Text  + ' AND ( ';
       while not Fdac_Temp.Eof do
       begin

       if Fdac_Temp.FieldByName('MARCAR').AsString = 'X' Then
       QRel.SQL.Text := QRel.SQL.Text  + ' (BANCO_ID = '+ Fdac_Temp.FieldByName('BANCO_ID').AsString + ')  OR ' ;
       Fdac_Temp.Next;

       end;
       QRel.SQL.Text := Copy (QRel.SQL.Text , 1 ,  Length(QRel.SQL.Text) - 5)  + ')';

      End
      Else
      QRel.Sql.Add('AND (BANCO_ID > 0)');


      if not VendaNfe.Checked then
      QRel.Sql.Add('GROUP BY DT_ENT_SAI' );

      if Caixa_Banco.Value > 0 then
      QRel.ParamByName('BANCO_ID').AsInteger := StrToInt(Caixa_Banco.Text);

      QRel.ParamByName('COND_PAGTO').AsString := 'A VISTA';
      QRel.ParamByName('DEPTO_07').AsString   := '07';
      QRel.ParamByName('COND_01').AsString    := '01';
      QRel.ParamByName('MODELO1').AsString    := '01';
      QRel.ParamByName('MODELO2').AsString    := '02';
      QRel.ParamByName('MODELO3').AsString    := '04';
      QRel.ParamByName('MODELO4').AsString    := '55';
      QRel.ParamByName('BALANCO').AsString    := 'AGRUPADO';


    //end;

    //if Despesa.Checked then
    //begin
     // if (VendaNfe.Checked) or (Compra.Checked) OR (VendaEcf.Checked) then
      QRel.Sql.Add('UNION ALL');
      {
      //Chamado 934 , Backup do sql antigo

      if not VendaNfce.Checked then
      QRel.Sql.Add('SELECT DT_ENT_SAI DT_TRANS,NULL LEGENDA , ' + #39 + '07 - VENDA NfC-e SINTÉTICO ' + #39 + '   HISTORICO, 0 DEBITO, SUM(VALOR) CREDITO')
      Else
      QRel.Sql.Add('SELECT TRANSACOES.DT_ENT_SAI DT_TRANS, NULL LEGENDA , ' + #39 + '07 - ' + #39 + ' || HISTORICO HISTORICO ,  0 DEBITO, TRANSACOES.VALOR CREDITO');

      QRel.Sql.Add('FROM TRANSACOES');
      // QRel.Sql.Add('INNER JOIN COMPL_NFISCAL ON COMPL_NFISCAL.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID ');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSACOES.DT_ENT_SAI BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (TRANSACOES.MODELO = :MODELO_02)');
      QRel.Sql.Add('AND (TRANSACOES.COND_PAGTO = :COND_PAGTO)');
      QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :COND_01)');
      QRel.Sql.Add('AND (TRANSACOES.DEPTO = :DEPTO_07)');
      QRel.Sql.Add('AND (TRANSACOES.BALANCO <> :BALANCO)');
      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT RAZAO.TRANSACAO_ID FROM RAZAO');
      QRel.Sql.Add('INNER JOIN NOTAS_CANCELADAS ON NOTAS_CANCELADAS.TRANSACAO_ID=RAZAO.TRANSACAO_ID ))');
      }

      //Encontra o valor da 'PARCELA' da finalizadora
      QConsulta.SQL.Clear;
      QConsulta.SQL.Add('SELECT CAST(PARCELAS AS CHAR) FROM FINALIZADORAS WHERE LOWER(DESCRICAO) = ''dinheiro''');
      Qconsulta.Open();

      if not VendaNfce.Checked then
      QRel.Sql.Add('SELECT DT_TRANS,NULL LEGENDA , ''07 - VENDA NfC-e SINTÉTICO ''   HISTORICO, 0 DEBITO, SUM(CREDITO) CREDITO')
      Else
      QRel.Sql.Add('SELECT DT_TRANS, NULL LEGENDA , ''07 - '' || HISTORICO HISTORICO ,  0 DEBITO, CREDITO');
      QRel.Sql.Add('FROM(');

      if not VendaNfce.Checked then
      QRel.Sql.Add('SELECT DT_ENT_SAI DT_TRANS,NULL LEGENDA , ''07 - VENDA NfC-e SINTÉTICO ''   HISTORICO, 0 DEBITO, VALOR CREDITO')
      Else
      QRel.Sql.Add('SELECT DT_ENT_SAI DT_TRANS, NULL LEGENDA , '''' || HISTORICO HISTORICO ,  0 DEBITO, VALOR CREDITO');

      QRel.Sql.Add('FROM TRANSACOES');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSACOES.DT_ENT_SAI BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (TRANSACOES.MODELO = :MODELO_02)');
      QRel.Sql.Add('AND (UPPER(TRANSACOES.COND_PAGTO) = :COND_PAGTO)');
      QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :COND_01)');
      QRel.Sql.Add('AND (TRANSACOES.DEPTO = :DEPTO_07)');
      QRel.Sql.Add('AND (TRANSACOES.BALANCO <> :BALANCO)');
      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT RAZAO.TRANSACAO_ID FROM RAZAO');
      QRel.Sql.Add('INNER JOIN NOTAS_CANCELADAS ON NOTAS_CANCELADAS.TRANSACAO_ID=RAZAO.TRANSACAO_ID ))');

      if Caixa_Banco.Value > 0 then
      QRel.Sql.Add('AND (TRANSACOES.BANCO_ID = :BANCO_ID)')
      else if Chk_Caixas.Checked then
      Begin
       Fdac_Temp.First;
       QRel.SQL.Text := QRel.SQL.Text  + ' AND ( ';

       while not Fdac_Temp.Eof do
       begin
       if Fdac_Temp.FieldByName('MARCAR').AsString = 'X' Then
       QRel.SQL.Text := QRel.SQL.Text  + ' (TRANSACOES.BANCO_ID = '+ Fdac_Temp.FieldByName('BANCO_ID').AsString + ')  OR ' ;
       Fdac_Temp.Next;
       end;

       QRel.SQL.Text := Copy (QRel.SQL.Text , 1 ,  Length(QRel.SQL.Text) - 5)  + ')';
      End
      Else
      QRel.Sql.Add('AND (TRANSACOES.BANCO_ID > 0)');

      QRel.Sql.Add('UNION ALL');

      if not VendaNfce.Checked then
      QRel.Sql.Add('SELECT DT_ENT_SAI DT_TRANS,NULL LEGENDA , ''07 - VENDA NfC-e SINTÉTICO ''   HISTORICO, 0 DEBITO, SUM(TRANSPARCELAS.VALOR) CREDITO')
      Else
      QRel.Sql.Add('SELECT DT_ENT_SAI DT_TRANS, NULL LEGENDA , HISTORICO ,  0 DEBITO, SUM(TRANSPARCELAS.VALOR) CREDITO');

      QRel.Sql.Add('FROM TRANSACOES');
      QRel.Sql.Add('INNER JOIN TRANSPARCELAS ON TRANSPARCELAS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSACOES.DT_ENT_SAI BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (TRANSACOES.MODELO = :MODELO_02)');
      QRel.Sql.Add('AND (TRANSACOES.PARCELA_ID = ''F'')');
      QRel.Sql.Add('AND (TRANSPARCELAS.PARCELA_ID LIKE :PARCELA_FINALIZADORA)');
      QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :COND_01)');
      QRel.Sql.Add('AND (TRANSACOES.DEPTO = :DEPTO_07)');
      QRel.Sql.Add('AND (TRANSACOES.BALANCO <> :BALANCO)');
      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT RAZAO.TRANSACAO_ID FROM RAZAO');
      QRel.Sql.Add('INNER JOIN NOTAS_CANCELADAS ON NOTAS_CANCELADAS.TRANSACAO_ID=RAZAO.TRANSACAO_ID ))');

      if Caixa_Banco.Value > 0 then
      QRel.Sql.Add('AND (TRANSACOES.BANCO_ID = :BANCO_ID)')
      else if Chk_Caixas.Checked then
      Begin
       Fdac_Temp.First;
       QRel.SQL.Text := QRel.SQL.Text  + ' AND ( ';
       while not Fdac_Temp.Eof do
       begin
       if Fdac_Temp.FieldByName('MARCAR').AsString = 'X' Then
       QRel.SQL.Text := QRel.SQL.Text  + ' (TRANSACOES.BANCO_ID = '+ Fdac_Temp.FieldByName('BANCO_ID').AsString + ')  OR ' ;
       Fdac_Temp.Next;
       end;
       QRel.SQL.Text := Copy (QRel.SQL.Text , 1 ,  Length(QRel.SQL.Text) - 5)  + ')';
      End
      Else
      QRel.Sql.Add('AND (TRANSACOES.BANCO_ID > 0)');

      if not VendaNfce.Checked then
      QRel.Sql.Add('GROUP BY dt_ent_sai')
      Else
      QRel.Sql.Add('GROUP BY DT_ENT_SAI, HISTORICO');

      QRel.Sql.Add(') AS TESTE');

      if not VendaNfce.Checked then
        // Bck - QRel.Sql.Add('GROUP BY DT_ENT_SAI' );
        QRel.Sql.Add('GROUP BY dt_TRANS');

      if Caixa_Banco.Value > 0 then
      QRel.ParamByName('BANCO_ID').AsInteger := StrToInt(Caixa_Banco.Text);
    {
      if Chk_Caixas.Checked then
      begin
       Fdac_Temp.First;
       contas := '';
       while not Fdac_Temp.Eof do
       begin
       if contas = '' Then
       contas := contas +  '' + Fdac_Temp.FieldByName('BANCO_ID').AsString + ''
       else
       contas := contas + ',' + '' + Fdac_Temp.FieldByName('BANCO_ID').AsString + '' ;

       Fdac_Temp.Next;
       end;

       QRel.ParamByName('BANCO_ID').AsString     := contas;

      end;
      }
       Memo1.Text := exibesql(QRel);


      QRel.ParamByName('COND_PAGTO').AsString             := 'A VISTA';
      QRel.ParamByName('DEPTO_07').AsString               := '07';
      QRel.ParamByName('COND_01').AsString                := '01';
      QRel.ParamByName('MODELO_02').AsString              := '65';
      QRel.ParamByName('BALANCO').AsString                := 'AGRUPADO';
      QRel.ParamByName('PARCELA_FINALIZADORA').AsString   := '%' + QConsulta.FieldByName('PARCELAS').AsString;


    //end;

    //if Despesa.Checked then
    //begin
     // if (VendaNfe.Checked) or (Compra.Checked) OR (VendaEcf.Checked) then
      QRel.Sql.Add('UNION ALL');

      if not Despesa.Checked then
      QRel.Sql.Add('SELECT DT_ENT_SAI DT_TRANS, NULL LEGENDA , ' + #39 + '08 - DESPESA SINTÉTICO ' + #39 + '   HISTORICO, SUM(VALOR) DEBITO, 0 CREDITO')
      Else
      QRel.Sql.Add('SELECT DT_ENT_SAI DT_TRANS,NULL LEGENDA , ' + #39 + '08 - ' + #39 + ' ||  HISTORICO HISTORICO, VALOR DEBITO, 0 CREDITO');

      QRel.Sql.Add('FROM TRANSACOES');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(DT_ENT_SAI BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('AND (EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (CONDUTA = :COND_02)');
      QRel.Sql.Add('AND (DEPTO = :DEPTO_02)');
      QRel.Sql.Add('AND (COND_PAGTO = :COND_PAGTO)');
      QRel.Sql.Add('AND (HISTORICO <> :HIST_SANGRIA)');

      if Caixa_Banco.Value > 0 then
      QRel.Sql.Add('AND (BANCO_ID = :BANCO_ID)')

      else if Chk_Caixas.Checked then
      Begin
       Fdac_Temp.First;
       QRel.SQL.Text := QRel.SQL.Text  + ' AND ( ';
       while not Fdac_Temp.Eof do
       begin

       if Fdac_Temp.FieldByName('MARCAR').AsString = 'X' Then
       QRel.SQL.Text := QRel.SQL.Text  + ' (BANCO_ID = '+ Fdac_Temp.FieldByName('BANCO_ID').AsString + ')  OR ' ;
       Fdac_Temp.Next;

       end;
       QRel.SQL.Text := Copy (QRel.SQL.Text , 1 ,  Length(QRel.SQL.Text) - 5)  + ')';

      End
      Else
      QRel.Sql.Add('AND (BANCO_ID > 0)');


      if not Despesa.Checked then
        QRel.Sql.Add('GROUP BY DT_ENT_SAI,LEGENDA' );

      if Caixa_Banco.Value > 0 then
      QRel.ParamByName('BANCO_ID').AsInteger := StrToInt(Caixa_Banco.Text);

      QRel.ParamByName('COND_02').AsString         := '02';
      QRel.ParamByName('DEPTO_02').AsString        := '02';
      QRel.ParamByName('HIST_SANGRIA').AsString    := 'SANGRIA';
      QRel.ParamByName('COND_PAGTO').AsString      := 'A VISTA';
    //end;

    //if Receita.Checked then
    //begin
     // if (VendaNfe.Checked) or (Compra.Checked) or (Despesa.Checked) OR (VendaEcf.Checked) then
      QRel.Sql.Add('UNION ALL');

      if not Receita.Checked then
      QRel.Sql.Add('SELECT DT_ENT_SAI DT_TRANS,NULL LEGENDA , ' + #39 + '09 - RECEITA SINTÉTICO' + #39 + '  HISTORICO, 0 DEBITO, SUM(VALOR) CREDITO')
      Else
      QRel.Sql.Add('SELECT DT_ENT_SAI DT_TRANS ,NULL LEGENDA , ' + #39 + '09 - ' + #39 + ' || HISTORICO HISTORICO, 0 DEBITO, VALOR CREDITO');

      QRel.Sql.Add('FROM TRANSACOES');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(DT_ENT_SAI BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('AND (EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (CONDUTA = :COND_01)');
      QRel.Sql.Add('AND (DEPTO = :DEPTO_03)');
      QRel.Sql.Add('AND (COND_PAGTO = :COND_PAGTO)');
      QRel.Sql.Add('AND (HISTORICO <> :HIST_SUPRIMENTO)');

      if Caixa_Banco.Value > 0 then
      QRel.Sql.Add('AND (BANCO_ID = :BANCO_ID)')

      else if Chk_Caixas.Checked then
      Begin
       Fdac_Temp.First;
       QRel.SQL.Text := QRel.SQL.Text  + ' AND ( ';
       while not Fdac_Temp.Eof do
       begin

       if Fdac_Temp.FieldByName('MARCAR').AsString = 'X' Then
       QRel.SQL.Text := QRel.SQL.Text  + ' (BANCO_ID = '+ Fdac_Temp.FieldByName('BANCO_ID').AsString + ')  OR ' ;
       Fdac_Temp.Next;

       end;
       QRel.SQL.Text := Copy (QRel.SQL.Text , 1 ,  Length(QRel.SQL.Text) - 5)  + ')';

      End
      Else
      QRel.Sql.Add('AND (BANCO_ID > 0)');


      if not Receita.Checked then
        QRel.Sql.Add('GROUP BY DT_ENT_SAI,LEGENDA');

      if Caixa_Banco.Value > 0 then
      QRel.ParamByName('BANCO_ID').AsInteger := StrToInt(Caixa_Banco.Text);


      QRel.ParamByName('COND_01').AsString         := '01';
      QRel.ParamByName('DEPTO_03').AsString        := '03';
      QRel.ParamByName('HIST_SUPRIMENTO').AsString := 'SUPRIMENTO';
      QRel.ParamByName('COND_PAGTO').AsString      := 'A VISTA';
    //end;

    //if Recebimento.Checked then
    //begin
     // if (VendaNfe.Checked) or (Compra.Checked) or (Despesa.Checked) or (Receita.Checked) OR (VendaEcf.Checked) then
      QRel.Sql.Add('UNION ALL');

      if not Recebimento.Checked then
      QRel.Sql.Add('SELECT TRANSACOES.DT_TRANS, NULL LEGENDA , ' + #39 + '10 - RECEBIMENTO SINTÉTICO ' + #39 + '  HISTORICO, 0 DEBITO, SUM(TRANSACOES.VALOR) CREDITO')
      Else
      QRel.Sql.Add('SELECT TRANSACOES.DT_TRANS, NULL LEGENDA ,' + #39 + '10 - RECEBIMENTO ' + #39 + ' || CLIENTES.NOME HISTORICO, 0 DEBITO, TRANSACOES.VALOR CREDITO');

      QRel.Sql.Add('FROM TRANSACOES');
      QRel.Sql.Add('INNER JOIN CLIENTES');
      QRel.Sql.Add('ON (TRANSACOES.CLIENTE_ID = CLIENTES.CLIENTE_ID)');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :COND_07)');
      QRel.Sql.Add('AND (TRANSACOES.TIPO_VENDA IS NULL)');
      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM TRANSACOES WHERE HISTORICO LIKE ' + #39 + 'Ref. Devolução%' + #39 + '))');

      if Caixa_Banco.Value > 0 then
      QRel.Sql.Add('AND (BANCO_ID = :BANCO_ID)')

      else if Chk_Caixas.Checked then
      Begin
       Fdac_Temp.First;
       QRel.SQL.Text := QRel.SQL.Text  + ' AND ( ';
       while not Fdac_Temp.Eof do
       begin

       if Fdac_Temp.FieldByName('MARCAR').AsString = 'X' Then
       QRel.SQL.Text := QRel.SQL.Text  + ' (BANCO_ID = '+ Fdac_Temp.FieldByName('BANCO_ID').AsString + ')  OR ' ;
       Fdac_Temp.Next;

       end;
       QRel.SQL.Text := Copy (QRel.SQL.Text , 1 ,  Length(QRel.SQL.Text) - 5)  + ')';

      End
      Else
      QRel.Sql.Add('AND (BANCO_ID > 0)');

      if not Recebimento.Checked then
        QRel.Sql.Add('GROUP BY DT_TRANS, LEGENDA');

      if Caixa_Banco.Value > 0 then
      QRel.ParamByName('BANCO_ID').AsInteger := StrToInt(Caixa_Banco.Text);

      QRel.ParamByName('COND_07').AsString         := '07';
      //QRel.ParamByName('TIPO_VENDA').AsString      := '';

    //end;

    //if tipo_rel.Text = 'Sintético' then
    //  QRel.Sql.Add('GROUP BY DT_TRANS');

   // if Pagamento.Checked then
    //begin
      //if (VendaNfe.Checked) or (Compra.Checked) or (Despesa.Checked) or (Receita.Checked) or (Recebimento.Checked) OR (VendaEcf.Checked) then
      QRel.Sql.Add('UNION ALL');

      if not Pagamento.Checked then
      QRel.Sql.Add('SELECT TRANSACOES.DT_TRANS, NULL LEGENDA , ' + #39 + '11 - PAGAMENTO SINTÉTICO ' + #39 + '  HISTORICO, SUM(TRANSACOES.VALOR) DEBITO, 0 CREDITO')
      Else
      QRel.Sql.Add('SELECT TRANSACOES.DT_TRANS, NULL LEGENDA , ' + #39 + '11 - PAGAMENTO ' + #39 + ' || FORNECEDORES.NOME HISTORICO, TRANSACOES.VALOR DEBITO, 0 CREDITO');

      QRel.Sql.Add('FROM TRANSACOES');
      QRel.Sql.Add('INNER JOIN FORNECEDORES');
      QRel.Sql.Add('ON (TRANSACOES.FORNECEDOR_ID = FORNECEDORES.FORNECEDOR_ID)');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :COND_08)');
      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM TRANSACOES WHERE HISTORICO LIKE ' + #39 + 'Ref. Devolução%' + #39 + '))');


      if Caixa_Banco.Value > 0 then
      QRel.Sql.Add('AND (BANCO_ID = :BANCO_ID)')

      else if Chk_Caixas.Checked then
      Begin
       Fdac_Temp.First;
       QRel.SQL.Text := QRel.SQL.Text  + ' AND ( ';
       while not Fdac_Temp.Eof do
       begin

       if Fdac_Temp.FieldByName('MARCAR').AsString = 'X' Then
       QRel.SQL.Text := QRel.SQL.Text  + ' (BANCO_ID = '+ Fdac_Temp.FieldByName('BANCO_ID').AsString + ')  OR ' ;
       Fdac_Temp.Next;

       end;
       QRel.SQL.Text := Copy (QRel.SQL.Text , 1 ,  Length(QRel.SQL.Text) - 5)  + ')';

      End
      Else
      QRel.Sql.Add('AND (BANCO_ID > 0)');


      if Caixa_Banco.Value > 0 then
      QRel.ParamByName('BANCO_ID').AsInteger := StrToInt(Caixa_Banco.Text);

      QRel.ParamByName('COND_08').AsString      := '08';


    if not Pagamento.Checked then
      QRel.Sql.Add('GROUP BY DT_TRANS');

    //end;


    QRel.Sql.Add('UNION ALL');

   // if not Chk_Devolucoes.Checked then
   // QRel.Sql.Add('SELECT DT_TRANS , ' + #39 + '12 - DEV. COMPRAS  ' + #39 + ' LEGENDA ,HISTORICO, DEBITO , CREDITO')
   // Else
   // QRel.Sql.Add('SELECT DT_TRANS , ' + #39 + '12 - DEV. COMPRA- ' + #39 + ' LEGENDA ,HISTORICO, DEBITO, CREDITO');

   // QRel.Sql.Add('FROM (');

    if not Chk_Devolucoes.Checked then
    QRel.Sql.Add('SELECT TRANSACOES.DT_TRANS,' + #39 + '12 - DEV. COMPRAS' + #39 + ' LEGENDA , ' + #39 + '' + #39 + ' HISTORICO, 0 DEBITO , SUM(TRANSACOES.VALOR) CREDITO')
    Else
    QRel.Sql.Add('SELECT TRANSACOES.DT_TRANS,' + #39 + '12 - DEV. COMPRAS' + #39 + ' LEGENDA , FORNECEDORES.NOME HISTORICO, 0 DEBITO , TRANSACOES.VALOR CREDITO');

    QRel.Sql.Add('FROM TRANSACOES');
    QRel.Sql.Add('LEFT JOIN FORNECEDORES');
    QRel.Sql.Add('ON (TRANSACOES.FORNECEDOR_ID = FORNECEDORES.FORNECEDOR_ID)');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
    QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
    QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
    QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :COND_01)');
    QRel.Sql.Add('AND (TRANSACOES.DEPTO =   :DEPTO_10)');
    QRel.Sql.Add('AND (TRANSACOES.COND_PAGTO =   :COND_PAGTO)');
    QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACOES.TRANSACAO_ID FROM TRANSACOES');
    QRel.Sql.Add('INNER JOIN NOTAS_CANCELADAS ON NOTAS_CANCELADAS.TRANSACAO_ID=TRANSACOES.TRANSACAO_ID ))');

    if Caixa_Banco.Value > 0 then
      QRel.Sql.Add('AND (TRANSACOES.BANCO_ID = :BANCO_ID)');

    if not Chk_Devolucoes.Checked then
      QRel.Sql.Add('GROUP BY DT_TRANS');


   // QRel.Sql.Add(') AS TESTE');

      QRel.Sql.Add('UNION ALL');

   // if not Chk_Devolucoes.Checked Then
   // QRel.Sql.Add('SELECT DT_TRANS , ' + #39 + '13 - DEV. VENDAS  ' + #39 + ' LEGENDA ,HISTORICO, DEBITO , CREDITO')
   // Else
   // QRel.Sql.Add('SELECT DT_TRANS , ' + #39 + '13 - DEV. VENDA - ' + #39 + ' LEGENDA , HISTORICO, DEBITO, CREDITO');

   // QRel.Sql.Add('FROM (');
    if not Chk_Devolucoes.Checked then
    QRel.Sql.Add('SELECT TRANSACOES.DT_TRANS, ' + #39 + '12 - DEV. VENDAS' + #39 + ' LEGENDA , ' + #39 + '' + #39 + ' HISTORICO, SUM(TRANSACOES.VALOR) DEBITO , 0  CREDITO')
    Else
    QRel.Sql.Add('SELECT TRANSACOES.DT_TRANS,' + #39 + '12 - DEV. VENDAS' + #39 + '  LEGENDA , CLIENTES.NOME HISTORICO, TRANSACOES.VALOR DEBITO , 0 CREDITO');

    QRel.Sql.Add('FROM TRANSACOES');
    QRel.Sql.Add('LEFT JOIN CLIENTES');
    QRel.Sql.Add('ON (TRANSACOES.CLIENTE_ID = CLIENTES.CLIENTE_ID)');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
    QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
    QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
    QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :COND_02)');
    QRel.Sql.Add('AND (TRANSACOES.DEPTO =   :DEPTO_10)');
    QRel.Sql.Add('AND ((TRANSACOES.COND_PAGTO =   :COND_PAGTO) OR (TRANSACOES.COND_PAGTO = :COND_PAGTO1))');
    QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACOES.TRANSACAO_ID FROM TRANSACOES');
    QRel.Sql.Add('INNER JOIN NOTAS_CANCELADAS ON NOTAS_CANCELADAS.TRANSACAO_ID=TRANSACOES.TRANSACAO_ID ))');

    if Caixa_Banco.Value > 0 then
      QRel.Sql.Add('AND (TRANSACOES.BANCO_ID = :BANCO_ID)');

    if not Chk_Devolucoes.Checked then
      QRel.Sql.Add('GROUP BY DT_TRANS');

   // QRel.Sql.Add(') AS TESTE');


    QRel.Sql.Add(')AS TESTE');

    QRel.Sql.Add('ORDER BY DT_TRANS, LEGENDA, HISTORICO');

    QRel.ParamByName('DT_INICIAL').AsDateTime   := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime     := Dtmai.Date;
    QRel.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    QRel.ParamByName('TPCTB').AsString          := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    QRel.ParamByName('DEPTO_10').AsString       := '10';
    QRel.ParamByName('COND_PAGTO').AsString     := 'A VISTA';
    QRel.ParamByName('COND_PAGTO1').AsString    := 'CARTAO';
    QRel.ParamByName('COND_02').AsString        := '02';
    QRel.ParamByName('COND_01').AsString        := '01';
    QRel.ParamByName('MODELO').AsString         := '2D';
    QRel.ParamByName('TIPO_TRANSACAO').AsString := 'R';

    QRel.Prepare;
    QRel.Open;

    QRLabel1.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;



    if QRel.IsEmpty then
      Application.MessageBox('Não há dados para os parâmetros informados', PChar(Msg_Title), mb_IconInformation)
    else
      Extrato.PreviewModal;
  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;

procedure TFrmFechamento_Periodo.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmFechamento_Periodo.Caixa_BancoChange(Sender: TObject);
begin
  if Caixa_Banco.Value > 0 then
     SearchBanco
     Else
     Qbanco.Close;


end;

procedure TFrmFechamento_Periodo.Caixa_BancoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = Caixa_Banco) then
    btnCaixa_BancoClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmFechamento_Periodo.Chk_CaixasClick(Sender: TObject);
begin

 if Chk_Caixas.Checked  Then
 begin
 Caixa_Banco.Text    := '0';
 Caixa_Banco.Enabled := False;
 DBGrid1.Enabled     := True;
 //Saldo_Anterior.Checked := False;
 //Saldo_Anterior.Enabled := False;
 end
 else
 Begin
 DBGrid1.Enabled        := False;
 Caixa_Banco.Enabled    := True;
 Saldo_Anterior.Enabled := True;
 End;


end;

procedure TFrmFechamento_Periodo.DBGrid1CellClick(Column: TColumn);
begin
 Caixa_Banco.Text := '0';

 if (DBGrid1.SelectedField.FieldName = 'MARCAR')  then
  bEGIN
   Fdac_Temp.Edit;

    if Fdac_Temp.FieldByName('MARCAR').AsString = 'X' then
    Fdac_Temp.FieldByName('MARCAR').AsString := ''
    else
    Fdac_Temp.FieldByName('MARCAR').AsString:= 'X';

    Fdac_Temp.Post;
  end;

end;

procedure TFrmFechamento_Periodo.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
Check: Integer;
R: TRect;
begin

  if Column.FieldName = 'MARCAR' then
  begin
  DBGrid1.Canvas.FillRect(Rect);
  Check := 0;

  if Fdac_Temp.FieldByName('MARCAR').AsString = 'X' then
  Check := DFCS_CHECKED
  else
  Check := 0;

  R:=Rect;
  InflateRect(R,-2,-2); {Diminue o tamanho do CheckBox}
  DrawFrameControl(DBGrid1.Canvas.Handle,R,DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;

end;

procedure TFrmFechamento_Periodo.DBLookupComboBox1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmFechamento_Periodo.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if QRel.FieldByName('CREDITO').AsFloat = 0 then
    QRDBText8.Enabled := False
  else
    QRDBText8.Enabled := True;

  if QRel.FieldByName('DEBITO').AsFloat = 0 then
    QRDBText4.Enabled := False
  else
    QRDBText4.Enabled := True;

    Saldo := Saldo + QRel.FieldByName('CREDITO').AsFloat - QRel.FieldByName('DEBITO').AsFloat;
end;

procedure TFrmFechamento_Periodo.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmFechamento_Periodo.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
  //  Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmFechamento_Periodo.ExtratoBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin

Saldo  := Sd;
end;

procedure TFrmFechamento_Periodo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmFechamento_Periodo.FormCreate(Sender: TObject);
begin
  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);

  TRY
    with Fdac_Temp.FieldDefs do
    begin
      Clear;
      Add('ACESSO', ftAutoInc, 0, False);
      Add('DESCRICAO', ftString, 44, False);
      Add('COD_CONTABIL', ftString, 20, False);
      Add('MARCAR', ftString, 1, False);
      Add('BANCO_ID', ftInteger, 0, False);

    end;

    with Fdac_Temp.IndexDefs do
    begin
      Clear;
      Add('', 'ACESSO', [ixPrimary, ixUnique]);
      Add('TEMP', 'BANCO_ID', [ixCaseInsensitive]);
    end;
    Fdac_Temp.IndexName := 'TEMP';
    Fdac_Temp.Open;

  except on E: Exception do
     ShowMessage( E.Message );
  end;


  QSearch.SQL.Clear;
  QSearch.SQL.Add('SELECT * FROM BANCOS WHERE STATUS= :STATUS AND TIPO_LIMITE = :TIPO AND COD_CONTABIL <> :VAZIO');
  QSearch.ParamByName('STATUS').AsString  := 'A';
  QSearch.ParamByName('TIPO').AsString    := 'INCLUSO NO SALDO';
  QSearch.ParamByName('VAZIO').AsString   :='';
  QSearch.Prepare;
  QSearch.Open();

  QSearch.First;
  while not QSearch.Eof do
  begin
     Fdac_Temp.Append;

     Fdac_Temp.FieldByName('BANCO_ID').AsInteger    := QSearch.FieldByName('BANCO_ID').AsInteger;
     Fdac_Temp.FieldByName('DESCRICAO').AsString    := QSearch.FieldByName('DESCRICAO').AsString;
     Fdac_Temp.FieldByName('COD_CONTABIL').AsString := QSearch.FieldByName('COD_CONTABIL').AsString;
     Fdac_Temp.FieldByName('MARCAR').AsString       := 'X';

     Fdac_Temp.Post;


    QSearch.Next;
  end;


    DBGrid1.Columns.Add;
    DBGrid1.Columns.Add;
    DBGrid1.Columns.Add;

   // DBGrid1.Columns.Add;

    DBGrid1.Columns[0].FieldName := 'BANCO_ID';
    DBGrid1.Columns[1].FieldName := 'DESCRICAO';
    DBGrid1.Columns[2].FieldName := 'MARCAR';


    DBGrid1.Columns[0].Title.Caption := 'Banco';
    DBGrid1.Columns[1].Title.Caption := 'Descrição';
    DBGrid1.Columns[2].Title.Caption := 'MARCAR';


    DBGrid1.Columns[0].Width := 50;
    DBGrid1.Columns[1].Width := 150;
    DBGrid1.Columns[2].Width := 20;

    DBGrid1.Columns[0].Title.Alignment := taCenter;
    DBGrid1.Columns[1].Title.Alignment := taCenter;
    DBGrid1.Columns[2].Title.Alignment := taCenter;

    DBGrid1.Columns[0].Alignment := taCenter;
    DBGrid1.Columns[1].Alignment := taCenter;
    DBGrid1.Columns[2].Alignment := taCenter;
    DBGrid1.Columns[2].Title.Caption := 'X';

    DBGrid1.Columns[0].ReadOnly := True;
    DBGrid1.Columns[1].ReadOnly := True;


    DbGrid1.Columns[2].Color    := clblue ;


  Data_Banco.DataSet := Fdac_temp;
  Fdac_temp.Open;


end;

procedure TFrmFechamento_Periodo.FormShow(Sender: TObject);
begin
try
    QFinalizadora.Open;
    DBLookupComboBox1.KeyValue := 1 ; 
  except
    Application.MessageBox('Erro ao conectar com o Banco de Dados', PChar(Msg_Title), mb_IconStop);
    Application.Terminate;
  end;
end;

procedure TFrmFechamento_Periodo.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
 if Saldo_Anterior.Checked then
 Begin


  QRShape6.Enabled  := True;
  QRLabel10.Enabled := True;
  QRlabel13.Enabled := True;


  QRLabel10.Caption := FormatFloat('#,##0.00', Abs(saldo));

  if Saldo >= 0 then
    QRLabel10.Left := 521
  else
  Begin
    QRlabel10.Left := 615;
    QRlabel10.Caption := '-' + FormatFloat('#,##0.00', Abs(saldo));
  End;
 End;
end;

procedure TFrmFechamento_Periodo.ReceitaClick(Sender: TObject);
begin
{iF (Receita.Checked) and (Despesa.Checked) and (Pagamento.Checked) and (Recebimento.Checked)
   and (VendaNfe.Checked) and (Compra.Checked) and (VendaEcf.Checked) Then
  Begin
  Saldo_Anterior.Enabled := True;
  Saldo_Anterior.Checked := True;
  End
  Else
  Begin
  Saldo_Anterior.Enabled := False;
  Saldo_Anterior.Checked := False;
  End;

  iF (Receita.Checked) or (Despesa.Checked) or (Pagamento.Checked) or (Recebimento.Checked) or (VendaNfe.Checked)
     or (Compra.Checked) or (VendaEcf.Checked)  then
  btnExecuta.Enabled := True
  Else
  btnExecuta.Enabled := False;}
end;
end.
