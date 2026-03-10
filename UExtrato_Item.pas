unit UExtrato_Item;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, rxCurrEdit, rxToolEdit, Buttons, DBCtrls,
  DB, IBCustomDataSet, IBQuery, QuickRpt, QRCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmExtrato_Item = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    Dtmen: TDateEdit;
    Produto: TCurrencyEdit;
    Dtmai: TDateEdit;
    btnProduto: TSpeedButton;
    DataProduto: TDataSource;
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
    QRDBText2: TQRDBText;
    QRDBText8: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabel10: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRShape4: TQRShape;
    QRLabel6: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRShape2: TQRShape;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRLabel2: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText12: TQRDBText;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRGroup1: TQRGroup;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    QRLabel22: TQRLabel;
    QRDBText13: TQRDBText;
    QProduto: TFDQuery;
    QRel: TFDQuery;
    Extrato_SemMovimento: TQuickRep;
    QRBand1: TQRBand;
    QRDBText14: TQRDBText;
    QRSysData3: TQRSysData;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRLabel25: TQRLabel;
    QRSysData4: TQRSysData;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRBand2: TQRBand;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRBand3: TQRBand;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr16: TQRExpr;
    QRExpr17: TQRExpr;
    QRExpr18: TQRExpr;
    QRExpr19: TQRExpr;
    QRExpr20: TQRExpr;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRGroup2: TQRGroup;
    QRLabel44: TQRLabel;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRLabel45: TQRLabel;
    Chk_SemMovimento: TCheckBox;
    chk_dt_entrada: TCheckBox;
    procedure btnRetornaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnProdutoClick(Sender: TObject);
    procedure ProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ProdutoChange(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ExtratoBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure SummaryBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DtmenEnter(Sender: TObject);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRGroup2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SearchProduto;
  end;

var
  FrmExtrato_Item: TFrmExtrato_Item;
  Saldo, Sd: Real;

implementation

uses
  UData, UConsulta, UPrincipal;

{$R *.dfm}

procedure TFrmExtrato_Item.SearchProduto;
begin
  QProduto.Close;
  QProduto.ParamByName('PRODUTO_ID').AsInteger := StrToInt(Produto.Text);
  QProduto.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  QProduto.Prepare;
  QProduto.Open;

  if QProduto.IsEmpty then
    btnExecuta.Enabled := False
  else
    btnExecuta.Enabled := True;
end;

procedure TFrmExtrato_Item.SummaryBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLabel17.Caption := FormatFloat('#,##0.00', Saldo);

  if Saldo >= 0 then
    QRLabel17.Left := 440
  else
    QRlabel17.Left := 712;
end;

procedure TFrmExtrato_Item.btnProdutoClick(Sender: TObject);
begin
  try
    Produto.Value := GetConsulta('ESTOQUE', FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger, 0 , StrToInt(Produto.Text));
  except
    Produto.Value := GetConsulta('ESTOQUE', 0, 0, 0);
  end;
end;

procedure TFrmExtrato_Item.btnExecutaClick(Sender: TObject);
var
Gerencial: Boolean;
begin
// 125, 325
  try
    if Produto.Value = 0 then
      abort;

    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    Saldo     := 0;

    if not Chk_SemMovimento.Checked then
    Begin
      QRel.Sql.Clear;
      QRel.Sql.Add('SELECT TRANSITENS.PRODUTO_ID,');

      QRel.Sql.Add('(SELECT SUM(TRANSITENS.QUANTIDADE)');
      QRel.Sql.Add('FROM TRANSITENS');
      QRel.Sql.Add('INNER JOIN TRANSACOES');
      QRel.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSITENS.PRODUTO_ID = :PRODUTO_ID)');
      QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :CD_CPR)');
      QRel.Sql.Add('AND (TRANSACOES.DEPTO = :DP_CPR)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (TRANSITENS.MOVIMENTO = 0)');
      QRel.Sql.Add('AND (TRANSITENS.TP_PROD_SERV = :TP_PROD_SERV)');

      if chk_dt_entrada.Checked Then
      QRel.Sql.Add('AND (TRANSACOES.DT_ENT_SAI < :DT_INICIAL)) COMPRA,')
      Else
      QRel.Sql.Add('AND (TRANSACOES.DT_TRANS < :DT_INICIAL)) COMPRA,');


      QRel.Sql.Add('(SELECT SUM(TRANSITENS.QUANTIDADE)');
      QRel.Sql.Add('FROM TRANSITENS');
      QRel.Sql.Add('INNER JOIN TRANSACOES');
      QRel.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSITENS.PRODUTO_ID = :PRODUTO_ID)');
      QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :CD_VDA)');
      QRel.Sql.Add('AND (TRANSACOES.DEPTO = :DP_VDA)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (TRANSITENS.MOVIMENTO = 0)');
      QRel.Sql.Add('AND (TRANSITENS.TP_PROD_SERV = :TP_PROD_SERV)');

      if chk_dt_entrada.Checked Then
      QRel.Sql.Add('AND (TRANSACOES.DT_ENT_SAI < :DT_INICIAL)) VENDA,')
      Else
      QRel.Sql.Add('AND (TRANSACOES.DT_TRANS < :DT_INICIAL)) VENDA,');

      QRel.Sql.Add('(SELECT SUM(TRANSITENS.QUANTIDADE)');
      QRel.Sql.Add('FROM TRANSITENS');
      QRel.Sql.Add('INNER JOIN TRANSACOES');
      QRel.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSITENS.PRODUTO_ID = :PRODUTO_ID)');
      QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :CD_DEV_CPR)');
      QRel.Sql.Add('AND (TRANSACOES.DEPTO = :DP_DEV_CPR)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (TRANSITENS.MOVIMENTO = 0)');
      QRel.Sql.Add('AND (TRANSITENS.TP_PROD_SERV = :TP_PROD_SERV)');

      if chk_dt_entrada.Checked Then
      QRel.Sql.Add('AND (TRANSACOES.DT_ENT_SAI < :DT_INICIAL)) DEV_COMPRA,')
      Else
      QRel.Sql.Add('AND (TRANSACOES.DT_TRANS < :DT_INICIAL)) DEV_COMPRA,');

      QRel.Sql.Add('(SELECT SUM(TRANSITENS.QUANTIDADE)');
      QRel.Sql.Add('FROM TRANSITENS');
      QRel.Sql.Add('INNER JOIN TRANSACOES');
      QRel.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSITENS.PRODUTO_ID = :PRODUTO_ID)');
      QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :CD_DEV_VDA)');
      QRel.Sql.Add('AND (TRANSACOES.DEPTO = :DP_DEV_VDA)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (TRANSITENS.MOVIMENTO = 0)');
      QRel.Sql.Add('AND (TRANSITENS.TP_PROD_SERV = :TP_PROD_SERV)');

      if chk_dt_entrada.Checked Then
      QRel.Sql.Add('AND (TRANSACOES.DT_ENT_SAI < :DT_INICIAL)) DEV_VENDA,')
      Else
      QRel.Sql.Add('AND (TRANSACOES.DT_TRANS < :DT_INICIAL)) DEV_VENDA,');

      QRel.Sql.Add('(SELECT SUM(TRANSITENS.QUANTIDADE)');
      QRel.Sql.Add('FROM TRANSITENS');
      QRel.Sql.Add('INNER JOIN TRANSACOES');
      QRel.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSITENS.PRODUTO_ID = :PRODUTO_ID)');
      QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :CD_CONSUMO)');
      QRel.Sql.Add('AND (TRANSACOES.DEPTO = :DP_CONSUMO OR TRANSACOES.CONDUTA = :CD_DESMANCHE)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (TRANSITENS.MOVIMENTO = 0)');
      QRel.Sql.Add('AND (TRANSITENS.TP_PROD_SERV = :TP_PROD_SERV)');

      if chk_dt_entrada.Checked Then
      QRel.Sql.Add('AND (TRANSACOES.DT_ENT_SAI < :DT_INICIAL)) CONSUMO,')
      Else
      QRel.Sql.Add('AND (TRANSACOES.DT_TRANS < :DT_INICIAL)) CONSUMO,');

      QRel.Sql.Add('(SELECT SUM(TRANSITENS.QUANTIDADE)');
      QRel.Sql.Add('FROM TRANSITENS');
      QRel.Sql.Add('INNER JOIN TRANSACOES');
      QRel.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSITENS.PRODUTO_ID = :PRODUTO_ID)');
      QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :CD_DEV_CONSUMO OR TRANSACOES.CONDUTA = :CD_ENTR_PRODUCAO)');
      QRel.Sql.Add('AND (TRANSACOES.DEPTO = :DP_DEV_CONSUMO)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (TRANSITENS.MOVIMENTO = 0)');
      QRel.Sql.Add('AND (TRANSITENS.TP_PROD_SERV = :TP_PROD_SERV)');

      if chk_dt_entrada.Checked Then
      QRel.Sql.Add('AND (TRANSACOES.DT_ENT_SAI < :DT_INICIAL)) DEV_CONSUMO,')
      Else
      QRel.Sql.Add('AND (TRANSACOES.DT_TRANS < :DT_INICIAL)) DEV_CONSUMO,');

      QRel.Sql.Add('(SELECT SUM(TRANSITENS.QUANTIDADE)');
      QRel.Sql.Add('FROM TRANSITENS');
      QRel.Sql.Add('INNER JOIN TRANSACOES');
      QRel.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSITENS.PRODUTO_ID = :PRODUTO_ID)');
      QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :CD_TRANSF)');
      QRel.Sql.Add('AND (TRANSACOES.DEPTO = :DP_TRANSF)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (TRANSITENS.MOVIMENTO = 0)');
      QRel.Sql.Add('AND (TRANSITENS.TP_PROD_SERV = :TP_PROD_SERV)');

      if chk_dt_entrada.Checked Then
      QRel.Sql.Add('AND (TRANSACOES.DT_ENT_SAI < :DT_INICIAL)) S_TRANSF,')
      Else
      QRel.Sql.Add('AND (TRANSACOES.DT_TRANS < :DT_INICIAL)) S_TRANSF,');

      QRel.Sql.Add('(SELECT SUM(TRANSITENS.QUANTIDADE)');
      QRel.Sql.Add('FROM TRANSITENS');
      QRel.Sql.Add('INNER JOIN TRANSACOES');
      QRel.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSITENS.PRODUTO_ID = :TRANSFERENCIA)');
      QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :CD_TRANSF)');
      QRel.Sql.Add('AND (TRANSACOES.DEPTO = :DP_TRANSF)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_TRANSF)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (TRANSITENS.MOVIMENTO = 0)');
      QRel.Sql.Add('AND (TRANSITENS.TP_PROD_SERV = :TP_PROD_SERV)');

      if chk_dt_entrada.Checked Then
      QRel.Sql.Add('AND (TRANSACOES.DT_ENT_SAI < :DT_INICIAL)) E_TRANSF')
      Else
      QRel.Sql.Add('AND (TRANSACOES.DT_TRANS < :DT_INICIAL)) E_TRANSF');

      QRel.Sql.Add('FROM TRANSITENS');
      QRel.Sql.Add('INNER JOIN TRANSACOES');
      QRel.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSITENS.PRODUTO_ID = :PRODUTO_ID)');
      QRel.Sql.Add('GROUP BY TRANSITENS.PRODUTO_ID');

      QRel.ParamByName('CD_CPR').AsString           := '02';
      QRel.ParamByName('DP_CPR').AsString           := '07';

      QRel.ParamByName('CD_VDA').AsString           := '01';
      QRel.ParamByName('DP_VDA').AsString           := '07';

      QRel.ParamByName('CD_DEV_CPR').AsString       := '01';
      QRel.ParamByName('DP_DEV_CPR').AsString       := '10';

      QRel.ParamByName('CD_DEV_VDA').AsString       := '02';
      QRel.ParamByName('DP_DEV_VDA').AsString       := '10';

      QRel.ParamByName('CD_CONSUMO').AsString       := '17';
      QRel.ParamByName('CD_DESMANCHE').AsString     := '21';
      QRel.ParamByName('DP_CONSUMO').AsString       := '07';

      QRel.ParamByName('CD_DEV_CONSUMO').AsString   := '18';
      QRel.ParamByName('CD_ENTR_PRODUCAO').AsString := '19';
      QRel.ParamByName('DP_DEV_CONSUMO').AsString   := '07';

      QRel.ParamByName('CD_TRANSF').AsString        := '20';
      QRel.ParamByName('DP_TRANSF').AsString        := '07';

      QRel.ParamByName('PRODUTO_ID').AsInteger      := StrToInt(Produto.Text);
      QRel.ParamByName('TRANSFERENCIA').AsInteger   := QProduto.FieldByName('VINCULO').AsInteger;
      QRel.ParamByName('DT_INICIAL').AsDateTime     := Dtmen.Date;
      QRel.ParamByName('EMPRESA_ID').AsInteger      := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
      QRel.ParamByName('EMPRESA_TRANSF').AsInteger  := QProduto.FieldByName('EMPRESA_ID').AsInteger;
      QRel.ParamByName('TPCTB').AsString            := FrmData.QAcesso.FieldByName('TPCTB').AsString;
      QRel.ParamByName('TP_PROD_SERV').AsString     := 'P';

      QRel.Prepare;
      QRel.Open;

      Saldo := QRel.FieldByName('COMPRA').AsFloat      + QRel.FieldByName('DEV_VENDA').AsFloat +
               QRel.FieldByName('DEV_CONSUMO').AsFloat + QRel.FieldByName('E_TRANSF').AsFloat -
               QRel.FieldByName('VENDA').AsFloat       - QRel.FieldByName('DEV_COMPRA').AsFloat -
               QRel.FieldByName('CONSUMO').AsFloat     - QRel.FieldByName('S_TRANSF').AsFloat;

      Sd := Saldo;

      QRel.Sql.Clear;





      if chk_dt_entrada.Checked Then
      QRel.Sql.Add('SELECT TRANSACOES.DT_ENT_SAI DT_TRANS, TRANSACOES.NUM_DOC, TRANSACOES.HISTORICO, CASE')
      Else
      QRel.Sql.Add('SELECT TRANSACOES.DT_TRANS, TRANSACOES.NUM_DOC, TRANSACOES.HISTORICO, CASE');

      QRel.Sql.Add('WHEN (TRANSACOES.CONDUTA = :CD_CPR) AND (TRANSACOES.DEPTO = :DP_CPR) THEN TRANSITENS.QUANTIDADE END COMPRA, CASE');
      QRel.Sql.Add('WHEN (TRANSACOES.CONDUTA = :CD_VDA) AND (TRANSACOES.DEPTO = :DP_VDA) THEN TRANSITENS.QUANTIDADE END VENDA, CASE');
      QRel.Sql.Add('WHEN (TRANSACOES.CONDUTA = :CD_DEV_CPR) AND (TRANSACOES.DEPTO = :DP_DEV_CPR) THEN TRANSITENS.QUANTIDADE END DEV_COMPRA, CASE');
      QRel.Sql.Add('WHEN (TRANSACOES.CONDUTA = :CD_DEV_VDA) AND (TRANSACOES.DEPTO = :DP_DEV_VDA) THEN TRANSITENS.QUANTIDADE END DEV_VENDA, CASE');
      QRel.Sql.Add('WHEN (TRANSACOES.CONDUTA = :CD_CONSUMO OR TRANSACOES.CONDUTA = :CD_DESMANCHE) AND (TRANSACOES.DEPTO = :DP_CONSUMO) THEN TRANSITENS.QUANTIDADE END CONSUMO, CASE');
      QRel.Sql.Add('WHEN (TRANSACOES.CONDUTA = :CD_DEV_CONSUMO OR TRANSACOES.CONDUTA = :CD_ENTR_PRODUCAO) AND (TRANSACOES.DEPTO = :DP_DEV_CONSUMO) THEN TRANSITENS.QUANTIDADE END DEV_CONSUMO, CASE');
      QRel.Sql.Add('WHEN (TRANSACOES.CONDUTA = :CD_TRANSF) AND (TRANSACOES.DEPTO = :DP_TRANSF) AND (TRANSITENS.PRODUTO_ID = :PRODUTO_ID) THEN TRANSITENS.QUANTIDADE END S_TRANSF, CASE');
      QRel.Sql.Add('WHEN (TRANSACOES.CONDUTA = :CD_TRANSF) AND (TRANSACOES.DEPTO = :DP_TRANSF) AND (TRANSITENS.PRODUTO_ID = :TRANSFERENCIA) THEN TRANSITENS.QUANTIDADE END E_TRANSF');
      QRel.Sql.Add('FROM TRANSITENS');
      QRel.Sql.Add('INNER JOIN TRANSACOES');
      QRel.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSITENS.PRODUTO_ID = :PRODUTO_ID OR TRANSITENS.PRODUTO_ID = :TRANSFERENCIA)');

      if chk_dt_entrada.Checked Then
      QRel.Sql.Add('AND (TRANSACOES.DT_ENT_SAI BETWEEN :DT_INICIAL AND :DT_FINAL)')
      Else
      QRel.Sql.Add('AND (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');

      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID OR TRANSACOES.EMPRESAAUX_ID = :EMPRESA_TRANSF)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (TRANSITENS.MOVIMENTO = 0)');
      QRel.Sql.Add('AND (TRANSITENS.TP_PROD_SERV = :TP_PROD_SERV)');

      if chk_dt_entrada.Checked Then
      QRel.Sql.Add('ORDER BY TRANSACOES.DT_ENT_SAI, TRANSACOES.TRANSACAO_ID')
      Else
      QRel.Sql.Add('ORDER BY TRANSACOES.DT_TRANS, TRANSACOES.TRANSACAO_ID');

      QRel.ParamByName('CD_CPR').AsString           := '02';
      QRel.ParamByName('DP_CPR').AsString           := '07';

      QRel.ParamByName('CD_VDA').AsString           := '01';
      QRel.ParamByName('DP_VDA').AsString           := '07';

      QRel.ParamByName('CD_DEV_CPR').AsString       := '01';
      QRel.ParamByName('DP_DEV_CPR').AsString       := '10';

      QRel.ParamByName('CD_DEV_VDA').AsString       := '02';
      QRel.ParamByName('DP_DEV_VDA').AsString       := '10';

      QRel.ParamByName('CD_CONSUMO').AsString       := '17';
      QRel.ParamByName('CD_DESMANCHE').AsString     := '21';
      QRel.ParamByName('DP_CONSUMO').AsString       := '07';

      QRel.ParamByName('CD_DEV_CONSUMO').AsString   := '18';
      QRel.ParamByName('CD_ENTR_PRODUCAO').AsSTring := '19';
      QRel.ParamByName('DP_DEV_CONSUMO').AsString   := '07';

      QRel.ParamByName('CD_TRANSF').AsString        := '20';
      QRel.ParamByName('DP_TRANSF').AsString        := '07';

      QRel.ParamByName('PRODUTO_ID').AsInteger      := StrToInt(Produto.Text);
      QRel.ParamByName('TRANSFERENCIA').AsInteger   := QProduto.FieldByName('VINCULO').AsInteger;
      QRel.ParamByName('DT_INICIAL').AsDateTime     := Dtmen.Date;
      QRel.ParamByName('DT_FINAL').AsDateTime       := Dtmai.Date;
      QRel.ParamByName('EMPRESA_ID').AsInteger      := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
      QRel.ParamByName('EMPRESA_TRANSF').AsInteger  := QProduto.FieldByName('EMPRESA_ID').AsInteger;
      QRel.ParamByName('TPCTB').AsString            := FrmData.QAcesso.FieldByName('TPCTB').AsString;
      QRel.ParamByName('TP_PROD_SERV').AsString     := 'P';

      QRel.Prepare;
      QRel.Open;




    End
    Else
    Begin

      QRel.Sql.Clear;
      QRel.Sql.Add('SELECT TRANSITENS.PRODUTO_ID,');

      QRel.Sql.Add('(SELECT SUM(TRANSITENS.QUANTIDADE)');
      QRel.Sql.Add('FROM TRANSITENS');
      QRel.Sql.Add('INNER JOIN TRANSACOES');
      QRel.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSITENS.PRODUTO_ID = :PRODUTO_ID)');
      QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :CD_CPR)');
      QRel.Sql.Add('AND (TRANSACOES.DEPTO = :DP_CPR)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (TRANSITENS.MOVIMENTO = 1)');

      if chk_dt_entrada.Checked Then
      QRel.Sql.Add('AND (TRANSACOES.DT_ENT_SAI < :DT_INICIAL)) COMPRA,')
      Else
      QRel.Sql.Add('AND (TRANSACOES.DT_TRANS < :DT_INICIAL)) COMPRA,');

      QRel.Sql.Add('(SELECT SUM(TRANSITENS.QUANTIDADE)');
      QRel.Sql.Add('FROM TRANSITENS');
      QRel.Sql.Add('INNER JOIN TRANSACOES');
      QRel.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSITENS.PRODUTO_ID = :PRODUTO_ID)');
      QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :CD_VDA)');
      QRel.Sql.Add('AND (TRANSACOES.DEPTO = :DP_VDA)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (TRANSITENS.MOVIMENTO = 1)');

      if chk_dt_entrada.Checked Then
      QRel.Sql.Add('AND (TRANSACOES.DT_ENT_SAI < :DT_INICIAL)) VENDA,')
      Else
      QRel.Sql.Add('AND (TRANSACOES.DT_TRANS < :DT_INICIAL)) VENDA,');

      QRel.Sql.Add('(SELECT SUM(TRANSITENS.QUANTIDADE)');
      QRel.Sql.Add('FROM TRANSITENS');
      QRel.Sql.Add('INNER JOIN TRANSACOES');
      QRel.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSITENS.PRODUTO_ID = :PRODUTO_ID)');
      QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :CD_DEV_CPR)');
      QRel.Sql.Add('AND (TRANSACOES.DEPTO = :DP_DEV_CPR)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (TRANSITENS.MOVIMENTO = 1)');

     if chk_dt_entrada.Checked Then
      QRel.Sql.Add('AND (TRANSACOES.DT_ENT_SAI < :DT_INICIAL)) DEV_COMPRA,')
      Else
      QRel.Sql.Add('AND (TRANSACOES.DT_TRANS < :DT_INICIAL)) DEV_COMPRA,');

      QRel.Sql.Add('(SELECT SUM(TRANSITENS.QUANTIDADE)');
      QRel.Sql.Add('FROM TRANSITENS');
      QRel.Sql.Add('INNER JOIN TRANSACOES');
      QRel.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSITENS.PRODUTO_ID = :PRODUTO_ID)');
      QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :CD_DEV_VDA)');
      QRel.Sql.Add('AND (TRANSACOES.DEPTO = :DP_DEV_VDA)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (TRANSITENS.MOVIMENTO = 1)');

     if chk_dt_entrada.Checked Then
      QRel.Sql.Add('AND (TRANSACOES.DT_ENT_SAI < :DT_INICIAL)) DEV_VENDA,')
      Else
      QRel.Sql.Add('AND (TRANSACOES.DT_TRANS < :DT_INICIAL)) DEV_VENDA,');

      QRel.Sql.Add('(SELECT SUM(TRANSITENS.QUANTIDADE)');
      QRel.Sql.Add('FROM TRANSITENS');
      QRel.Sql.Add('INNER JOIN TRANSACOES');
      QRel.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSITENS.PRODUTO_ID = :PRODUTO_ID)');
      QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :CD_CONSUMO)');
      QRel.Sql.Add('AND (TRANSACOES.DEPTO = :DP_CONSUMO OR TRANSACOES.CONDUTA = :CD_DESMANCHE)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (TRANSITENS.MOVIMENTO = 1)');

      if chk_dt_entrada.Checked Then
      QRel.Sql.Add('AND (TRANSACOES.DT_ENT_SAI < :DT_INICIAL)) CONSUMO,')
      Else
      QRel.Sql.Add('AND (TRANSACOES.DT_TRANS < :DT_INICIAL)) CONSUMO,');

      QRel.Sql.Add('(SELECT SUM(TRANSITENS.QUANTIDADE)');
      QRel.Sql.Add('FROM TRANSITENS');
      QRel.Sql.Add('INNER JOIN TRANSACOES');
      QRel.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSITENS.PRODUTO_ID = :PRODUTO_ID)');
      QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :CD_DEV_CONSUMO OR TRANSACOES.CONDUTA = :CD_ENTR_PRODUCAO)');
      QRel.Sql.Add('AND (TRANSACOES.DEPTO = :DP_DEV_CONSUMO)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (TRANSITENS.MOVIMENTO = 1)');

      if chk_dt_entrada.Checked Then
      QRel.Sql.Add('AND (TRANSACOES.DT_ENT_SAI < :DT_INICIAL)) DEV_CONSUMO,')
      Else
      QRel.Sql.Add('AND (TRANSACOES.DT_TRANS < :DT_INICIAL)) DEV_CONSUMO,');

      QRel.Sql.Add('(SELECT SUM(TRANSITENS.QUANTIDADE)');
      QRel.Sql.Add('FROM TRANSITENS');
      QRel.Sql.Add('INNER JOIN TRANSACOES');
      QRel.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSITENS.PRODUTO_ID = :PRODUTO_ID)');
      QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :CD_TRANSF)');
      QRel.Sql.Add('AND (TRANSACOES.DEPTO = :DP_TRANSF)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (TRANSITENS.MOVIMENTO = 1)');

     if chk_dt_entrada.Checked Then
      QRel.Sql.Add('AND (TRANSACOES.DT_ENT_SAI < :DT_INICIAL)) S_TRANSF')
      Else
      QRel.Sql.Add('AND (TRANSACOES.DT_TRANS < :DT_INICIAL)) S_TRANSF');

      QRel.Sql.Add('(SELECT SUM(TRANSITENS.QUANTIDADE)');
      QRel.Sql.Add('FROM TRANSITENS');
      QRel.Sql.Add('INNER JOIN TRANSACOES');
      QRel.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSITENS.PRODUTO_ID = :TRANSFERENCIA)');
      QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :CD_TRANSF)');
      QRel.Sql.Add('AND (TRANSACOES.DEPTO = :DP_TRANSF)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_TRANSF)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (TRANSITENS.MOVIMENTO = 1)');

      if chk_dt_entrada.Checked Then
      QRel.Sql.Add('AND (TRANSACOES.DT_ENT_SAI < :DT_INICIAL)) E_TRANSF,')
      Else
      QRel.Sql.Add('AND (TRANSACOES.DT_TRANS < :DT_INICIAL)) E_TRANSF,');

      QRel.Sql.Add('FROM TRANSITENS');
      QRel.Sql.Add('INNER JOIN TRANSACOES');
      QRel.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSITENS.PRODUTO_ID = :PRODUTO_ID)');
      QRel.Sql.Add('GROUP BY TRANSITENS.PRODUTO_ID');

      QRel.ParamByName('CD_CPR').AsString           := '02';
      QRel.ParamByName('DP_CPR').AsString           := '07';

      QRel.ParamByName('CD_VDA').AsString           := '01';
      QRel.ParamByName('DP_VDA').AsString           := '07';

      QRel.ParamByName('CD_DEV_CPR').AsString       := '01';
      QRel.ParamByName('DP_DEV_CPR').AsString       := '10';

      QRel.ParamByName('CD_DEV_VDA').AsString       := '02';
      QRel.ParamByName('DP_DEV_VDA').AsString       := '10';

      QRel.ParamByName('CD_CONSUMO').AsString       := '17';
      QRel.ParamByName('CD_DESMANCHE').AsString     := '21';
      QRel.ParamByName('DP_CONSUMO').AsString       := '07';

      QRel.ParamByName('CD_DEV_CONSUMO').AsString   := '18';
      QRel.ParamByName('CD_ENTR_PRODUCAO').AsString := '19';
      QRel.ParamByName('DP_DEV_CONSUMO').AsString   := '07';

      QRel.ParamByName('CD_TRANSF').AsString        := '20';
      QRel.ParamByName('DP_TRANSF').AsString        := '07';

      QRel.ParamByName('PRODUTO_ID').AsInteger      := StrToInt(Produto.Text);
      QRel.ParamByName('TRANSFERENCIA').AsInteger   := QProduto.FieldByName('VINCULO').AsInteger;
      QRel.ParamByName('DT_INICIAL').AsDateTime     := Dtmen.Date;
      QRel.ParamByName('EMPRESA_ID').AsInteger      := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
      QRel.ParamByName('EMPRESA_TRANSF').AsInteger  := QProduto.FieldByName('EMPRESA_ID').AsInteger;
      QRel.ParamByName('TPCTB').AsString            := FrmData.QAcesso.FieldByName('TPCTB').AsString;

      QRel.Prepare;
      QRel.Open;

      Saldo := QRel.FieldByName('COMPRA').AsFloat      + QRel.FieldByName('DEV_VENDA').AsFloat +
               QRel.FieldByName('DEV_CONSUMO').AsFloat + QRel.FieldByName('E_TRANSF').AsFloat -
               QRel.FieldByName('VENDA').AsFloat       - QRel.FieldByName('DEV_COMPRA').AsFloat -
               QRel.FieldByName('CONSUMO').AsFloat     - QRel.FieldByName('S_TRANSF').AsFloat;

      Sd := Saldo;


      QRel.Sql.Clear;

      if chk_dt_entrada.Checked Then
      QRel.Sql.Add('SELECT TRANSACOES.DT_ENT_SAI DT_TRANS , TRANSACOES.NUM_DOC, TRANSACOES.HISTORICO, CASE')
      Else
      QRel.Sql.Add('SELECT TRANSACOES.DT_TRANS, TRANSACOES.NUM_DOC, TRANSACOES.HISTORICO, CASE');

      QRel.Sql.Add('WHEN (TRANSACOES.CONDUTA = :CD_CPR) AND (TRANSACOES.DEPTO = :DP_CPR) THEN TRANSITENS.QUANTIDADE END COMPRA, CASE');
      QRel.Sql.Add('WHEN (TRANSACOES.CONDUTA = :CD_VDA) AND (TRANSACOES.DEPTO = :DP_VDA) THEN TRANSITENS.QUANTIDADE END VENDA, CASE');
      QRel.Sql.Add('WHEN (TRANSACOES.CONDUTA = :CD_DEV_CPR) AND (TRANSACOES.DEPTO = :DP_DEV_CPR) THEN TRANSITENS.QUANTIDADE END DEV_COMPRA, CASE');
      QRel.Sql.Add('WHEN (TRANSACOES.CONDUTA = :CD_DEV_VDA) AND (TRANSACOES.DEPTO = :DP_DEV_VDA) THEN TRANSITENS.QUANTIDADE END DEV_VENDA, CASE');
      QRel.Sql.Add('WHEN (TRANSACOES.CONDUTA = :CD_CONSUMO OR TRANSACOES.CONDUTA = :CD_DESMANCHE) AND (TRANSACOES.DEPTO = :DP_CONSUMO) THEN TRANSITENS.QUANTIDADE END CONSUMO, CASE');
      QRel.Sql.Add('WHEN (TRANSACOES.CONDUTA = :CD_DEV_CONSUMO OR TRANSACOES.CONDUTA = :CD_ENTR_PRODUCAO) AND (TRANSACOES.DEPTO = :DP_DEV_CONSUMO) THEN TRANSITENS.QUANTIDADE END DEV_CONSUMO, CASE');
      QRel.Sql.Add('WHEN (TRANSACOES.CONDUTA = :CD_TRANSF) AND (TRANSACOES.DEPTO = :DP_TRANSF) AND (TRANSITENS.PRODUTO_ID = :PRODUTO_ID) THEN TRANSITENS.QUANTIDADE END S_TRANSF, CASE');
      QRel.Sql.Add('WHEN (TRANSACOES.CONDUTA = :CD_TRANSF) AND (TRANSACOES.DEPTO = :DP_TRANSF) AND (TRANSITENS.PRODUTO_ID = :TRANSFERENCIA) THEN TRANSITENS.QUANTIDADE END E_TRANSF');
      QRel.Sql.Add('FROM TRANSITENS');
      QRel.Sql.Add('INNER JOIN TRANSACOES');
      QRel.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSITENS.PRODUTO_ID = :PRODUTO_ID OR TRANSITENS.PRODUTO_ID = :TRANSFERENCIA)');

      if chk_dt_entrada.Checked Then
      QRel.Sql.Add('AND (TRANSACOES.DT_ENT_SAI BETWEEN :DT_INICIAL AND :DT_FINAL)')
      Else
      QRel.Sql.Add('AND (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');

      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID OR TRANSACOES.EMPRESAAUX_ID = :EMPRESA_TRANSF)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (TRANSITENS.MOVIMENTO = 1)');

      if chk_dt_entrada.Checked Then
      QRel.Sql.Add('ORDER BY TRANSACOES.DT_ENT_SAI, TRANSACOES.TRANSACAO_ID')
      Else
      QRel.Sql.Add('ORDER BY TRANSACOES.DT_TRANS, TRANSACOES.TRANSACAO_ID');

      QRel.ParamByName('CD_CPR').AsString           := '02';
      QRel.ParamByName('DP_CPR').AsString           := '07';

      QRel.ParamByName('CD_VDA').AsString           := '01';
      QRel.ParamByName('DP_VDA').AsString           := '07';

      QRel.ParamByName('CD_DEV_CPR').AsString       := '01';
      QRel.ParamByName('DP_DEV_CPR').AsString       := '10';

      QRel.ParamByName('CD_DEV_VDA').AsString       := '02';
      QRel.ParamByName('DP_DEV_VDA').AsString       := '10';

      QRel.ParamByName('CD_CONSUMO').AsString       := '17';
      QRel.ParamByName('CD_DESMANCHE').AsString     := '21';
      QRel.ParamByName('DP_CONSUMO').AsString       := '07';

      QRel.ParamByName('CD_DEV_CONSUMO').AsString   := '18';
      QRel.ParamByName('CD_ENTR_PRODUCAO').AsSTring := '19';
      QRel.ParamByName('DP_DEV_CONSUMO').AsString   := '07';

      QRel.ParamByName('CD_TRANSF').AsString        := '20';
      QRel.ParamByName('DP_TRANSF').AsString        := '07';

      QRel.ParamByName('PRODUTO_ID').AsInteger      := StrToInt(Produto.Text);
      QRel.ParamByName('TRANSFERENCIA').AsInteger   := QProduto.FieldByName('VINCULO').AsInteger;
      QRel.ParamByName('DT_INICIAL').AsDateTime     := Dtmen.Date;
      QRel.ParamByName('DT_FINAL').AsDateTime       := Dtmai.Date;
      QRel.ParamByName('EMPRESA_ID').AsInteger      := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
      QRel.ParamByName('EMPRESA_TRANSF').AsInteger  := QProduto.FieldByName('EMPRESA_ID').AsInteger;
      QRel.ParamByName('TPCTB').AsString            := FrmData.QAcesso.FieldByName('TPCTB').AsString;

      QRel.Prepare;
      QRel.Open;

    End;

    if not Chk_SemMovimento.Checked then
    QRLabel1.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text
    Else
    QRLabel24.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;

    if QRel.IsEmpty then
      Application.MessageBox('Não há dados para os parâmetros informados', PChar(Msg_Title), mb_IconInformation)
    else
    Begin
      if not Chk_SemMovimento.Checked then
      Extrato.PreviewModal
      Else
      Begin
      Extrato_SemMovimento.PreviewModal;
      End;
    End;

  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;

procedure TFrmExtrato_Item.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmExtrato_Item.ProdutoChange(Sender: TObject);
begin
  if Produto.Value > 0 then
    SearchProduto;
end;

procedure TFrmExtrato_Item.ProdutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = Produto) then
    btnProdutoClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmExtrato_Item.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Begin
  if QRel.FieldByName('COMPRA').AsFloat = 0 then
    QRDBText17.Enabled := False
  else
    QRDBText17.Enabled := True;

  if QRel.FieldByName('DEV_VENDA').AsFloat = 0 then
    QRDBText18.Enabled := False
  else
    QRDBText18.Enabled := True;

  if QRel.FieldByName('DEV_CONSUMO').AsFloat = 0 then
    QRDBText20.Enabled := False
  else
    QRDBText20.Enabled := True;

  if QRel.FieldByName('E_TRANSF').AsFloat = 0 then
    QRDBText24.Enabled := False
  else
    QRDBText24.Enabled := True;

  if QRel.FieldByName('VENDA').AsFloat = 0 then
    QRDBText21.Enabled := False
  else
    QRDBText21.Enabled := True;

  if QRel.FieldByName('DEV_COMPRA').AsFloat = 0 then
    QRDBText22.Enabled := False
  else
    QRDBText22.Enabled := True;

  if QRel.FieldByName('CONSUMO').AsFloat = 0 then
    QRDBText23.Enabled := False
  else
    QRDBText23.Enabled := True;

  if QRel.FieldByName('S_TRANSF').AsFloat = 0 then
    QRDBText25.Enabled := False
  else
    QRDBText25.Enabled := True;

  Saldo := Saldo + QRel.FieldByName('COMPRA').AsFloat      + QRel.FieldByName('DEV_VENDA').AsFloat +
                   QRel.FieldByName('DEV_CONSUMO').AsFloat + QRel.FieldByName('E_TRANSF').AsFloat -
                   QRel.FieldByName('VENDA').AsFloat       - QRel.FieldByName('DEV_COMPRA').AsFloat -
                   QRel.FieldByName('CONSUMO').AsFloat     - QRel.FieldByName('S_TRANSF').AsFloat;

end;

procedure TFrmExtrato_Item.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLabel40.Caption := FormatFloat('#,##0.00', Saldo);

  if Saldo >= 0 then
    QRLabel40.Left := 440
  else
    QRlabel40.Left := 712;
end;

procedure TFrmExtrato_Item.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin

  QRLabel16.Caption := FormatFloat('#,##0.00', Saldo);

  if Saldo >= 0 then
    QRLabel16.Left := 440
  else
    QRlabel16.Left := 712;
end;

procedure TFrmExtrato_Item.QRGroup2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin

  QRLabel44.Caption := FormatFloat('#,##0.00', Saldo);

  if Saldo >= 0 then
    QRLabel44.Left := 440
  else
    QRlabel44.Left := 712;
end;

procedure TFrmExtrato_Item.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if QRel.FieldByName('COMPRA').AsFloat = 0 then
    QRDBText8.Enabled := False
  else
    QRDBText8.Enabled := True;

  if QRel.FieldByName('DEV_VENDA').AsFloat = 0 then
    QRDBText4.Enabled := False
  else
    QRDBText4.Enabled := True;

  if QRel.FieldByName('DEV_CONSUMO').AsFloat = 0 then
    QRDBText7.Enabled := False
  else
    QRDBText7.Enabled := True;

  if QRel.FieldByName('E_TRANSF').AsFloat = 0 then
    QRDBText1.Enabled := False
  else
    QRDBText1.Enabled := True;

  if QRel.FieldByName('VENDA').AsFloat = 0 then
    QRDBText9.Enabled := False
  else
    QRDBText9.Enabled := True;

  if QRel.FieldByName('DEV_COMPRA').AsFloat = 0 then
    QRDBText10.Enabled := False
  else
    QRDBText10.Enabled := True;

  if QRel.FieldByName('CONSUMO').AsFloat = 0 then
    QRDBText11.Enabled := False
  else
    QRDBText11.Enabled := True;

  if QRel.FieldByName('S_TRANSF').AsFloat = 0 then
    QRDBText12.Enabled := False
  else
    QRDBText12.Enabled := True;

  Saldo := Saldo + QRel.FieldByName('COMPRA').AsFloat      + QRel.FieldByName('DEV_VENDA').AsFloat +
                   QRel.FieldByName('DEV_CONSUMO').AsFloat + QRel.FieldByName('E_TRANSF').AsFloat -
                   QRel.FieldByName('VENDA').AsFloat       - QRel.FieldByName('DEV_COMPRA').AsFloat -
                   QRel.FieldByName('CONSUMO').AsFloat     - QRel.FieldByName('S_TRANSF').AsFloat;
end;

procedure TFrmExtrato_Item.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmExtrato_Item.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
   // Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmExtrato_Item.ExtratoBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  Saldo := Sd;
end;

procedure TFrmExtrato_Item.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmExtrato_Item.FormCreate(Sender: TObject);
begin
  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);
end;

end.
