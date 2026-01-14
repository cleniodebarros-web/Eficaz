unit UApuracao_Pis_Cofins;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, rxCurrEdit, rxToolEdit, Buttons, DBCtrls,
  DB, IBCustomDataSet, IBQuery, QuickRpt, QRCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmApuracao_Pis_Cofins = class(TForm)
    Label1: TLabel;
    Bevel1: TBevel;
    Dtmen: TDateEdit;
    Dtmai: TDateEdit;
    Extrato_Pis_Cofins_LR: TQuickRep;
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
    SummaryBand1: TQRBand;
    QRLabel11: TQRLabel;
    QRDBText4: TQRDBText;
    QRShape4: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText10: TQRDBText;
    QRShape2: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel19: TQRLabel;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    QRLabel10: TQRLabel;
    QRExpr10: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    Extrato_Pis_Cofins_LP: TQuickRep;
    QRBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRSysData3: TQRSysData;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel16: TQRLabel;
    QRSysData4: TQRSysData;
    QRLabel17: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRBand2: TQRBand;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRExpr15: TQRExpr;
    QRExpr16: TQRExpr;
    QRBand3: TQRBand;
    QRShape8: TQRShape;
    QRLabel27: TQRLabel;
    QRExpr19: TQRExpr;
    QRExpr20: TQRExpr;
    QRExpr21: TQRExpr;
    QRLabel18: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText8: TQRDBText;
    Tipo_Rel: TComboBox;
    Label2: TLabel;
    Extrato_Pis_Cofins_Sintetico: TQuickRep;
    QRBand4: TQRBand;
    QRDBText9: TQRDBText;
    QRSysData5: TQRSysData;
    QRLabel22: TQRLabel;
    QRLabel24: TQRLabel;
    QRShape7: TQRShape;
    QRShape9: TQRShape;
    QRLabel28: TQRLabel;
    QRSysData6: TQRSysData;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRBand5: TQRBand;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText14: TQRDBText;
    QRBand6: TQRBand;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRLabel39: TQRLabel;
    QRExpr24: TQRExpr;
    QRExpr25: TQRExpr;
    QRExpr27: TQRExpr;
    QRExpr28: TQRExpr;
    QRExpr29: TQRExpr;
    QRExpr30: TQRExpr;
    QRLabel40: TQRLabel;
    QRExpr32: TQRExpr;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRLabel32: TQRLabel;
    QRExpr17: TQRExpr;
    QRDBText13: TQRDBText;
    CST_PIS: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    cst_pis_ent: TEdit;
    btn_cst_pis_ent: TSpeedButton;
    btnCst_Pis: TSpeedButton;
    Extrato_cst_ent: TQuickRep;
    QRBand7: TQRBand;
    QRDBText19: TQRDBText;
    QRSysData7: TQRSysData;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRLabel43: TQRLabel;
    QRSysData8: TQRSysData;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRBand8: TQRBand;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRExpr18: TQRExpr;
    QRExpr22: TQRExpr;
    QRDBText22: TQRDBText;
    QRBand9: TQRBand;
    QRShape14: TQRShape;
    QRLabel50: TQRLabel;
    QRExpr23: TQRExpr;
    QRExpr26: TQRExpr;
    QRExpr31: TQRExpr;
    Extrato_cst: TQuickRep;
    QRBand10: TQRBand;
    QRDBText23: TQRDBText;
    QRSysData9: TQRSysData;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRLabel58: TQRLabel;
    QRSysData10: TQRSysData;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel68: TQRLabel;
    QRBand11: TQRBand;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRExpr43: TQRExpr;
    QRExpr44: TQRExpr;
    QRDBText27: TQRDBText;
    QRBand12: TQRBand;
    QRShape19: TQRShape;
    QRLabel69: TQRLabel;
    QRExpr48: TQRExpr;
    QRExpr49: TQRExpr;
    QRExpr50: TQRExpr;
    QRel: TFDQuery;
    QSintetico: TFDQuery;
    QTabela: TFDQuery;
    CheckBox1: TCheckBox;
    IQuery: TFDQuery;
    Label5: TLabel;
    procedure btnRetornaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnExecutaClick(Sender: TObject);
    procedure DtmenEnter(Sender: TObject);
    procedure Tipo_RelKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ibqryQSinteticoAfterOpen(DataSet: TDataSet);
    procedure CST_PISChange(Sender: TObject);
    procedure cst_pis_entChange(Sender: TObject);
    procedure btnCst_PisClick(Sender: TObject);
    procedure btn_cst_pis_entClick(Sender: TObject);
    procedure Tipo_RelChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RecalcularPISCOFINS;
  end;

var
  FrmApuracao_Pis_Cofins: TFrmApuracao_Pis_Cofins;

implementation

uses
  UData, UPrincipal,UConsulta_Cst;

{$R *.dfm}

procedure TFrmApuracao_Pis_Cofins.RecalcularPISCOFINS;
var
Vr_Pis, Vr_Cofins, Vr_Pis_St, Vr_Cofins_St : Real;
begin
    IQuery.Sql.Clear;
    IQuery.Sql.Add('ALTER TABLE PRODUTOS DISABLE TRIGGER PRODUTOS_UP');

    IQuery.Prepare;
    IQuery.ExecSql;


  QTabela.Sql.Clear;
  QTabela.Sql.Add('SELECT * FROM TRANSACOES WHERE DT_SPED BETWEEN :DT_INICIAL AND :DT_FINAL');
  QTabela.Sql.Add('AND ((TRANSACOES.CONDUTA = :CD_VDA) AND ((TRANSACOES.DEPTO = :DPT_DEV) OR (TRANSACOES.DEPTO = :DPT_ENT_SAI)))');
  QTabela.Sql.Add('AND (MODELO <> :MODELO)');
  QTabela.ParamByName('CD_VDA').AsString       := '01';
  QTabela.ParamByName('DPT_ENT_SAI').AsString  := '07';
  QTabela.ParamByName('DPT_DEV').AsString      := '10';
  QTabela.ParamByName('MODELO').AsString       := '2D';
  // QTabela.ParamByName('CD_CPR').AsString       := '02';
  QTabela.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
  QTabela.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;

  QTabela.Prepare;
  QTabela.Open;


  QTabela.First;
  while not QTabela.Eof do

  begin
    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT CONDUTA, DEPTO, TRANSITENS.*, PRODUTOS.PIS PIS_SAI, PRODUTOS.COFINS COFINS_SAI, PRODUTOS.CST_PIS CST_PIS_SAI, ' +
                 'PRODUTOS.PIS_ENTR, PRODUTOS.COFINS_ENTR, PRODUTOS.CST_PIS_ENTR, PRODUTOS.CST_COFINS_ENTR,' +
                 'PRODUTOS.CST_COFINS CST_COFINS_SAI, CFOP.CST_SAIDA CFOP_SAIDA, CFOP.NAT_REC CFOP_NAT_REC, SERVICOS.PIS SRV_PIS_SAI, SERVICOS.COFINS ' +
                 'SRV_COFINS_SAI, SERVICOS.CST_PIS SRV_CST_PIS_SAI, SERVICOS.CST_COFINS SRV_CST_COFINS_SAI ');
    QRel.Sql.Add('FROM TRANSITENS');
    QRel.Sql.Add('INNER JOIN TRANSACOES');
    QRel.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
    QRel.Sql.Add('LEFT JOIN PRODUTOS');
    QRel.Sql.Add('ON (TRANSITENS.PRODUTO_ID = PRODUTOS.PRODUTO_ID)');
    QRel.Sql.Add('LEFT JOIN SERVICOS');
    QRel.Sql.Add('ON (TRANSITENS.PRODUTO_ID = SERVICOS.SERVICO_ID)');
    QRel.Sql.Add('LEFT JOIN CFOP');
    QRel.Sql.Add('ON (TRANSITENS.CFOP = CFOP.COD_CFOP)');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(TRANSITENS.TRANSACAO_ID = :TRANSACAO_ID)');

    QRel.ParamByName('TRANSACAO_ID').AsInteger := QTabela.FieldByName('TRANSACAO_ID').AsInteger;

    QRel.Prepare;
    QRel.Open;

    QRel.First;
    while not QRel.Eof do
    begin
        IQuery.Sql.Clear;
      if (QTabela.FieldByName('BALANCO').AsString = 'AGRUPADO') OR (QTabela.FieldByName('TIPO_VENDA').AsString = 'REMESSA') OR ((QRel.FieldByName('SRV_CST_PIS_SAI').AsString = '49') AND (QRel.FieldByName('TP_PROD_SERV').AsString = 'S')) OR (QRel.FieldByName('CFOP_SAIDA').AsString <> '' ) then
      Begin
         //Alterado dia 24/03/14 Regivaldo
        //or (QTabela.FieldByName('CFOP').AsString = '5927') or (QTabela.FieldByName('CFOP').AsString = '6927') or (QTabela.FieldByName('CFOP').AsString = '5929') then

        IQuery.Sql.Add('UPDATE TRANSITENS SET CST_PIS = :CST_PIS, CST_COFINS = :CST_COFINS, BASE_CALC_PIS = 0, ' +
                       'ALIQUOTA_PIS = :ALIQUOTA_PIS, VR_PIS = 0, BASE_CALC_COFINS = 0, ALIQUOTA_COFINS = :ALIQUOTA_COFINS, VR_COFINS = 0');

        if QRel.FieldByName('CFOP_SAIDA').AsString <> '' then
        IQuery.Sql.Add(',NAT_REC = :NAT_REC');

      End
      else
      begin

        IQuery.Sql.Add('UPDATE TRANSITENS SET CST_PIS = :CST_PIS, CST_COFINS = :CST_COFINS, BASE_CALC_PIS = (VR_TOTAL  - DESC_RODAPE  ), ' +
                       'ALIQUOTA_PIS = :ALIQUOTA_PIS, VR_PIS = ROUND((((VR_TOTAL  - (DESC_RODAPE) ) * CAST(:ALIQUOTA_PIS AS NUMERIC(15,2))) / 100),2), ' +
                       'BASE_CALC_COFINS = (VR_TOTAL  - DESC_RODAPE ), ' +
                       'ALIQUOTA_COFINS = :ALIQUOTA_COFINS, VR_COFINS = ROUND((((VR_TOTAL - DESC_RODAPE) * CAST(:ALIQUOTA_COFINS AS NUMERIC(15,2))) / 100),2)');

        if QRel.FieldByName('CFOP_SAIDA').AsString <> '' then
        IQuery.Sql.Add(',NAT_REC = :NAT_REC');


      end;

      //+ QSub_Detail.FieldByName('VR_IPI').AsFloat + QSub_Detail.FieldByName('VALOR_ICMS_ST').AsFloat;
      // Lei 9718 de 1998 art 3º  14/07/14
      //Foi retirado:
      // + VALOR_ICMS_ST
      //Incluido  campos 14/08/14 Regivaldo
      //+ VR_IPI + VR_FRETE

     {Retirado da base de calculo
     VR_ACRESCIMO + VR_IPI + VR_FRETE - DESC_RODAPE
     Regivaldo 16/05/15}

      IQuery.Sql.Add('WHERE');
      IQuery.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
      IQuery.Sql.Add('AND (PRODUTO_ID = :PRODUTO_ID)');


          if QRel.FieldByName('TP_PROD_SERV').AsString = 'S' then
          Begin
          IQuery.ParamByName('CST_PIS').AsString        := QRel.FieldByName('SRV_CST_PIS_SAI').AsString;
          IQuery.ParamByName('CST_COFINS').AsString     := QRel.FieldByName('SRV_CST_COFINS_SAI').AsString;
          IQuery.ParamByName('ALIQUOTA_PIS').AsFloat    := QRel.FieldByName('SRV_PIS_SAI').AsFloat;
          IQuery.ParamByName('ALIQUOTA_COFINS').AsFloat := QRel.FieldByName('SRV_COFINS_SAI').AsFloat;
          End
          Else
          Begin
          if (QRel.FieldByName('CONDUTA').AsString = '02') AND (QRel.FieldByName('DEPTO').AsString = '10') then

          Begin
          IQuery.ParamByName('CST_PIS').AsString        := QRel.FieldByName('CST_PIS_ENTR').AsString;
          IQuery.ParamByName('CST_COFINS').AsString     := QRel.FieldByName('CST_COFINS_ENTR').AsString;
          IQuery.ParamByName('ALIQUOTA_PIS').AsFloat    := QRel.FieldByName('PIS_ENTR').AsFloat;
          IQuery.ParamByName('ALIQUOTA_COFINS').AsFloat := QRel.FieldByName('COFINS_SAI').AsFloat;
          End
          Else
          IQuery.ParamByName('CST_PIS').AsString        := QRel.FieldByName('CST_PIS_SAI').AsString;
          IQuery.ParamByName('CST_COFINS').AsString     := QRel.FieldByName('CST_COFINS_SAI').AsString;
          IQuery.ParamByName('ALIQUOTA_PIS').AsFloat    := QRel.FieldByName('PIS_SAI').AsFloat;
          IQuery.ParamByName('ALIQUOTA_COFINS').AsFloat := QRel.FieldByName('COFINS_SAI').AsFloat;
          End;


      if (QTabela.FieldByName('BALANCO').AsString = 'AGRUPADO') and ((QTabela.FieldByName('CFOP').AsString = '5929') or  (QTabela.FieldByName('CFOP').AsString = '6929')) then
      begin
        IQuery.ParamByName('CST_PIS').AsString        := '49';
        IQuery.ParamByName('CST_COFINS').AsString     := '49';
        IQuery.ParamByName('ALIQUOTA_PIS').AsFloat    := 0;
        IQuery.ParamByName('ALIQUOTA_COFINS').AsFloat := 0;
      end;

      if QRel.FieldByName('CFOP_SAIDA').AsString <> '' then
      begin
        IQuery.ParamByName('CST_PIS').AsString        := QRel.FieldByName('CFOP_SAIDA').AsString;
        IQuery.ParamByName('CST_COFINS').AsString     := QRel.FieldByName('CFOP_SAIDA').AsString;
        IQuery.ParamByName('ALIQUOTA_PIS').AsFloat    := 0;
        IQuery.ParamByName('ALIQUOTA_COFINS').AsFloat := 0;
        IQuery.ParamByName('NAT_REC').AsString        := QRel.FieldByName('CFOP_NAT_REC').AsString;
      end;

      if QRel.FieldByName('CST_PIS').AsString = '05' Then
      begin
      IQuery.ParamByName('ALIQUOTA_PIS').AsFloat    := 0.65;
      IQuery.ParamByName('ALIQUOTA_COFINS').AsFloat := 3;
      end;


      IQuery.ParamByName('TRANSACAO_ID').AsInteger := QTabela.FieldByName('TRANSACAO_ID').AsInteger;
      IQuery.ParamByName('PRODUTO_ID').AsInteger   := QRel.FieldByName('PRODUTO_ID').AsInteger;

      IQuery.Prepare;
      IQuery.ExecSql;




      if ((QRel.FieldByName('PIS_SAI').AsFloat = 0) AND (QRel.FieldByName('TP_PROD_SERV').AsString = 'P')) and (QRel.FieldByName('CST_PIS').AsString <> '05') then
      begin
        IQuery.Sql.Clear;
        IQuery.Sql.Add('UPDATE TRANSITENS SET BASE_CALC_PIS = 0, BASE_CALC_COFINS = 0, VR_COFINS = 0, VR_PIS = 0');
        IQuery.Sql.Add('WHERE');
        IQuery.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
        IQuery.Sql.Add('AND (PRODUTO_ID = :PRODUTO_ID)');

        IQuery.ParamByName('TRANSACAO_ID').AsInteger := QTabela.FieldByName('TRANSACAO_ID').AsInteger;
        IQuery.ParamByName('PRODUTO_ID').AsInteger   := QRel.FieldByName('PRODUTO_ID').AsInteger;

        IQuery.Prepare;
        IQuery.ExecSql;

      end;

      if (QRel.FieldByName('CST_PIS').AsString = '05')  then
      begin
        IQuery.Sql.Clear;
        IQuery.Sql.Add('UPDATE TRANSITENS SET BASE_CALC_PIS = 0, BASE_CALC_COFINS = 0, VR_COFINS = 0, VR_PIS = 0');
        IQuery.Sql.Add('WHERE');
        IQuery.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
        IQuery.Sql.Add('AND (PRODUTO_ID = :PRODUTO_ID)');

        IQuery.ParamByName('TRANSACAO_ID').AsInteger := QTabela.FieldByName('TRANSACAO_ID').AsInteger;
        IQuery.ParamByName('PRODUTO_ID').AsInteger   := QRel.FieldByName('PRODUTO_ID').AsInteger;

        IQuery.Prepare;
        IQuery.ExecSql;

      end;

      if (QRel.FieldByName('CST_PIS').AsString = '06')  then
      begin
        IQuery.Sql.Clear;
        IQuery.Sql.Add('UPDATE TRANSITENS SET ALIQUOTA_PIS = 0, ALIQUOTA_COFINS = 0, BASE_CALC_PIS = 0, BASE_CALC_COFINS = 0, VR_COFINS = 0, VR_PIS = 0');
        IQuery.Sql.Add('WHERE');
        IQuery.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
        IQuery.Sql.Add('AND (PRODUTO_ID = :PRODUTO_ID)');

        IQuery.ParamByName('TRANSACAO_ID').AsInteger := QTabela.FieldByName('TRANSACAO_ID').AsInteger;
        IQuery.ParamByName('PRODUTO_ID').AsInteger   := QRel.FieldByName('PRODUTO_ID').AsInteger;

        IQuery.Prepare;
        IQuery.ExecSql;

      end;



      Application.ProcessMessages;
      QRel.Next;
    end;

    IQuery.Sql.Clear;
    IQuery.Sql.Add('SELECT SUM(VR_PIS) VR_PIS, SUM(VR_COFINS) VR_COFINS');
    IQuery.Sql.Add('FROM TRANSITENS');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

    IQuery.ParamByName('TRANSACAO_ID').AsInteger  := QTabela.FieldByName('TRANSACAO_ID').AsInteger;

    IQuery.Prepare;
    IQuery.Open;

    Vr_Pis    := IQuery.FieldByName('VR_PIS').AsFloat;
    Vr_Cofins := IQuery.FieldByName('VR_COFINS').AsFloat;

    IQuery.Sql.Clear;
    IQuery.Sql.Add('SELECT SUM(VR_PIS) VR_PIS, SUM(VR_COFINS) VR_COFINS');
    IQuery.Sql.Add('FROM TRANSITENS');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('((CST_PIS = :VAR1) OR (CST_PIS = :VAR2) OR (CST_COFINS = :VAR1) OR (CST_COFINS = :VAR2))');
    IQuery.Sql.Add('AND (TRANSACAO_ID = :TRANSACAO_ID)');

    IQuery.ParamByName('VAR1').AsString           := '05';
    IQuery.ParamByName('VAR2').AsString           := '75';
    IQuery.ParamByName('TRANSACAO_ID').AsInteger  := QTabela.FieldByName('TRANSACAO_ID').AsInteger;

    IQuery.Prepare;
    IQuery.Open;

    Vr_Pis_St    := IQuery.FieldByName('VR_PIS').AsFloat;
    Vr_Cofins_St := IQuery.FieldByName('VR_COFINS').AsFloat;

    if QTabela.FieldByName('COND_PAGTO').AsString = 'A PRAZO' then
    begin
      IQuery.Sql.Clear;
      IQuery.Sql.Add('UPDATE TRANSPARCELAS SET TIPO_TRANSACAO = :TIPO_TRANSACAO');
      IQuery.Sql.Add('WHERE');
      IQuery.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
      IQuery.Sql.Add('AND (TIPO_TRANSACAO = :TIPO_TRANS)');

      IQuery.ParamByName('TIPO_TRANSACAO').AsString := 'U';
      IQuery.ParamByName('TRANSACAO_ID').AsInteger  := QTabela.FieldByName('TRANSACAO_ID').AsInteger;
      IQuery.ParamByName('TIPO_TRANS').AsString     := 'T';

      IQuery.Prepare;
      IQuery.ExecSql;


    end;

    IQuery.Sql.Clear;
    IQuery.Sql.Add('UPDATE TRANSACOES SET VR_PIS = :VR_PIS, VR_COFINS = :VR_COFINS, VR_PIS_ST = :VR_PIS_ST, VR_COFINS_ST = :VR_COFINS_ST');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

    IQuery.ParamByName('VR_PIS').AsFloat          := Vr_Pis;
    IQuery.ParamByName('VR_COFINS').AsFloat       := Vr_Cofins;
    IQuery.ParamByName('VR_PIS_ST').AsFloat       := Vr_Pis_St;
    IQuery.ParamByName('VR_COFINS_ST').AsFloat    := Vr_Cofins_St;
    IQuery.ParamByName('TRANSACAO_ID').AsInteger  := QTabela.FieldByName('TRANSACAO_ID').AsInteger;

    IQuery.Prepare;
    IQuery.ExecSql;



    if QTabela.FieldByName('COND_PAGTO').AsString = 'A PRAZO' then
    begin
      IQuery.Sql.Clear;
      IQuery.Sql.Add('UPDATE TRANSPARCELAS SET TIPO_TRANSACAO = :TIPO_TRANSACAO');
      IQuery.Sql.Add('WHERE');
      IQuery.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
      IQuery.Sql.Add('AND (TIPO_TRANSACAO = :TIPO_TRANS)');

      IQuery.ParamByName('TIPO_TRANSACAO').AsString := 'T';
      IQuery.ParamByName('TRANSACAO_ID').AsInteger  := QTabela.FieldByName('TRANSACAO_ID').AsInteger;
      IQuery.ParamByName('TIPO_TRANS').AsString     := 'U';

      IQuery.Prepare;
      IQuery.ExecSql;


    end;

    Application.ProcessMessages;
    QTabela.Next;
    label5.Caption:= 'Recalculando Pis/Cofins(Saídas/Dev.Compras): ' + IntToStr(QTabela.FieldByName('TRANSACAO_ID').AsInteger);
  end;

  QTabela.Sql.Clear;
  QTabela.Sql.Add('SELECT * FROM TRANSACOES WHERE DT_SPED BETWEEN :DT_INICIAL AND :DT_FINAL');
  QTabela.Sql.Add('AND ((TRANSACOES.CONDUTA = :CD_CPR) AND ((TRANSACOES.DEPTO = :DPT_DEV) OR (TRANSACOES.DEPTO = :DPT_ENT_SAI)))');
  //QTabela.ParamByName('CD_VDA').AsString       := '01';
  QTabela.ParamByName('DPT_ENT_SAI').AsString  := '07';
  QTabela.ParamByName('DPT_DEV').AsString      := '10';
  QTabela.ParamByName('CD_CPR').AsString       := '02';
  QTabela.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
  QTabela.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;

  QTabela.Prepare;
  QTabela.Open;


  QTabela.First;
  while not QTabela.Eof do

  begin
    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT CONDUTA, DEPTO, TRANSITENS.*, PRODUTOS.PIS_ENTR, PRODUTOS.COFINS_ENTR, PRODUTOS.CST_PIS_ENTR, PRODUTOS.CST_COFINS_ENTR, ' +
                 'PRODUTOS.PIS PIS_SAI, PRODUTOS.COFINS COFINS_SAI, PRODUTOS.CST_PIS CST_PIS_SAI, PRODUTOS.CST_COFINS CST_COFINS_SAI, ' +
                 'CFOP.CST_ENTRADA CFOP_ENTRADA, SERVICOS.PIS_ENTR SRV_PIS_ENTR, SERVICOS.COFINS_ENTR SRV_COFINS_ENTR, ' +
                 'SERVICOS.CST_PIS_ENTR SRV_CST_PIS_ENTR, SERVICOS.CST_COFINS_ENTR SRV_CST_COFINS_ENTR');
    QRel.Sql.Add('FROM TRANSITENS');
    QRel.Sql.Add('INNER JOIN TRANSACOES');
    QRel.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
    QRel.Sql.Add('LEFT JOIN PRODUTOS');
    QRel.Sql.Add('ON (TRANSITENS.PRODUTO_ID = PRODUTOS.PRODUTO_ID)');
    QRel.Sql.Add('LEFT JOIN SERVICOS');
    QRel.Sql.Add('ON (TRANSITENS.PRODUTO_ID = SERVICOS.SERVICO_ID)');
    QRel.Sql.Add('LEFT JOIN CFOP');
    QRel.Sql.Add('ON (TRANSITENS.CFOP = CFOP.COD_CFOP)');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(TRANSITENS.TRANSACAO_ID = :TRANSACAO_ID)');

    QRel.ParamByName('TRANSACAO_ID').AsInteger := QTabela.FieldByName('TRANSACAO_ID').AsInteger;



    QRel.Prepare;
    QRel.Open;

    QRel.First;
    while not QRel.Eof do
    begin
      IQuery.Sql.Clear;
      {  if (QTabela.FieldByName('CFOP').AsString = '1910') or (QTabela.FieldByName('CFOP').AsString = '2910') or
         (QTabela.FieldByName('CFOP').AsString = '1556') or (QTabela.FieldByName('CFOP').AsString = '2556') or
         (QTabela.FieldByName('CFOP').AsString = '1152') or (QTabela.FieldByName('CFOP').AsString = '2152') or
         (QTabela.FieldByName('CFOP').AsString = '1409') or (QTabela.FieldByName('CFOP').AsString = '2409') or
         (QTabela.FieldByName('CFOP').AsString = '1551') or (QTabela.FieldByName('CFOP').AsString = '2551') or
         (QTabela.FieldByName('CFOP').AsString = '1949') or (QTabela.FieldByName('CFOP').AsString = '2949') or
         (QTabela.FieldByName('CFOP').AsString = '1908') or (QTabela.FieldByName('CFOP').AsString = '2908') then }

        if (QRel.FieldByName('CFOP_ENTRADA').AsString <> '') OR ((QRel.FieldByName('SRV_CST_PIS_ENTR').AsString <> '50') AND (QRel.FieldByName('TP_PROD_SERV').AsString = 'S'))  then

        IQuery.Sql.Add('UPDATE TRANSITENS SET CST_PIS = :CST_PIS, CST_COFINS = :CST_COFINS, BASE_CALC_PIS = 0, ' +
                       'ALIQUOTA_PIS = :ALIQUOTA_PIS, VR_PIS = 0, BASE_CALC_COFINS = 0, ALIQUOTA_COFINS = :ALIQUOTA_COFINS, VR_COFINS = 0')
        else
        IQuery.Sql.Add('UPDATE TRANSITENS SET CST_PIS = :CST_PIS, CST_COFINS = :CST_COFINS, BASE_CALC_PIS = (VR_TOTAL  - DESC_RODAPE ), ' +
                       'ALIQUOTA_PIS = :ALIQUOTA_PIS, VR_PIS = ROUND((((VR_TOTAL  - DESC_RODAPE  ) * CAST(:ALIQUOTA_PIS AS NUMERIC(15,2))) / 100),2), ' +
                       'BASE_CALC_COFINS = (VR_TOTAL  - DESC_RODAPE), ALIQUOTA_COFINS = :ALIQUOTA_COFINS, ' +
                       'VR_COFINS  = ROUND((((VR_TOTAL - DESC_RODAPE) * CAST(:ALIQUOTA_COFINS AS NUMERIC(15,2))) / 100),2) ');

     //+ QSub_Detail.FieldByName('VR_IPI').AsFloat + QSub_Detail.FieldByName('VALOR_ICMS_ST').AsFloat;
     // Lei 9718 de 1998 art 3º  14/07/14
     //Foi retirado:
     // + VALOR_ICMS_ST
     //Incluido data 14/08/14 Regivaldo
     //+ VR_IPI + VR_FRETE

     {Retirado da base de calculo
     VR_ACRESCIMO + VR_IPI + VR_FRETE - DESC_RODAPE
     Regivaldo 16/05/15}


      IQuery.Sql.Add('WHERE');
      IQuery.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
      IQuery.Sql.Add('AND (PRODUTO_ID = :PRODUTO_ID)');


        if QRel.FieldByName('CFOP_ENTRADA').AsString <> '' then
        begin
          IQuery.ParamByName('CST_PIS').AsString        := QRel.FieldByName('CFOP_ENTRADA').AsString;
          IQuery.ParamByName('CST_COFINS').AsString     := QRel.FieldByName('CFOP_ENTRADA').AsString;
          IQuery.ParamByName('ALIQUOTA_PIS').AsFloat    := 0;
          IQuery.ParamByName('ALIQUOTA_COFINS').AsFloat := 0;
        end
        else
        begin
         if QRel.FieldByName('TP_PROD_SERV').AsString = 'S' then
         Begin
          IQuery.ParamByName('CST_PIS').AsString        := QRel.FieldByName('SRV_CST_PIS_ENTR').AsString;
          IQuery.ParamByName('CST_COFINS').AsString     := QRel.FieldByName('SRV_CST_COFINS_ENTR').AsString;
          IQuery.ParamByName('ALIQUOTA_PIS').AsFloat    := QRel.FieldByName('SRV_PIS_ENTR').AsFloat;
          IQuery.ParamByName('ALIQUOTA_COFINS').AsFloat := QRel.FieldByName('SRV_COFINS_ENTR').AsFloat;
         End
         Else
         Begin
          if (QRel.FieldByName('CONDUTA').AsString = '01') AND (QRel.FieldByName('DEPTO').AsString = '10') then
          Begin
          IQuery.ParamByName('CST_PIS').AsString        := QRel.FieldByName('CST_PIS_SAI').AsString;
          IQuery.ParamByName('CST_COFINS').AsString     := QRel.FieldByName('CST_COFINS_SAI').AsString;
          IQuery.ParamByName('ALIQUOTA_PIS').AsFloat    := QRel.FieldByName('PIS_SAI').AsFloat;
          IQuery.ParamByName('ALIQUOTA_COFINS').AsFloat := QRel.FieldByName('COFINS_SAI').AsFloat;
          End
          Else
          Begin
          IQuery.ParamByName('CST_PIS').AsString        := QRel.FieldByName('CST_PIS_ENTR').AsString;
          IQuery.ParamByName('CST_COFINS').AsString     := QRel.FieldByName('CST_COFINS_ENTR').AsString;
          IQuery.ParamByName('ALIQUOTA_PIS').AsFloat    := QRel.FieldByName('PIS_ENTR').AsFloat;
          IQuery.ParamByName('ALIQUOTA_COFINS').AsFloat := QRel.FieldByName('COFINS_ENTR').AsFloat;
          End;
         End;
        end;

     { if (QTabela.FieldByName('CFOP').AsString = '1949') or (QTabela.FieldByName('CFOP').AsString = '2949') or
         (QTabela.FieldByName('CFOP').AsString = '1908') or (QTabela.FieldByName('CFOP').AsString = '2908') then
      begin
        IQuery.ParamByName('CST_PIS').AsString        := '98';
        IQuery.ParamByName('CST_COFINS').AsString     := '98';
        IQuery.ParamByName('ALIQUOTA_PIS').AsFloat    := 0;
        IQuery.ParamByName('ALIQUOTA_COFINS').AsFloat := 0;
      end; }

      IQuery.ParamByName('TRANSACAO_ID').AsInteger := QTabela.FieldByName('TRANSACAO_ID').AsInteger;
      IQuery.ParamByName('PRODUTO_ID').AsInteger   := QRel.FieldByName('PRODUTO_ID').AsInteger;

      IQuery.Prepare;
      IQuery.ExecSql;



      if (QRel.FieldByName('PIS_ENTR').AsFloat = 0) and (QRel.FieldByName('TP_PROD_SERV').AsString = 'P') then
      begin
        IQuery.Sql.Clear;
        IQuery.Sql.Add('UPDATE TRANSITENS SET BASE_CALC_PIS = 0, BASE_CALC_COFINS = 0, VR_COFINS = 0, VR_PIS = 0');
        IQuery.Sql.Add('WHERE');
        IQuery.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
        IQuery.Sql.Add('AND (PRODUTO_ID = :PRODUTO_ID)');

        IQuery.ParamByName('TRANSACAO_ID').AsInteger := QTabela.FieldByName('TRANSACAO_ID').AsInteger;
        IQuery.ParamByName('PRODUTO_ID').AsInteger   := QRel.FieldByName('PRODUTO_ID').AsInteger;

        IQuery.Prepare;
        IQuery.ExecSql;


      end;

      Application.ProcessMessages;
      QRel.Next;
    end;

    IQuery.Sql.Clear;
    IQuery.Sql.Add('SELECT SUM(VR_PIS) VR_PIS, SUM(VR_COFINS) VR_COFINS');
    IQuery.Sql.Add('FROM TRANSITENS');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

    IQuery.ParamByName('TRANSACAO_ID').AsInteger  := QTabela.FieldByName('TRANSACAO_ID').AsInteger;

    IQuery.Prepare;
    IQuery.Open;

    Vr_Pis    := IQuery.FieldByName('VR_PIS').AsFloat;
    Vr_Cofins := IQuery.FieldByName('VR_COFINS').AsFloat;

    IQuery.Sql.Clear;
    IQuery.Sql.Add('SELECT SUM(VR_PIS) VR_PIS, SUM(VR_COFINS) VR_COFINS');
    IQuery.Sql.Add('FROM TRANSITENS');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('((CST_PIS = :VAR1) OR (CST_PIS = :VAR2) OR (CST_COFINS = :VAR1) OR (CST_COFINS = :VAR2))');
    IQuery.Sql.Add('AND (TRANSACAO_ID = :TRANSACAO_ID)');

    IQuery.ParamByName('VAR1').AsString           := '05';
    IQuery.ParamByName('VAR2').AsString           := '75';
    IQuery.ParamByName('TRANSACAO_ID').AsInteger  := QTabela.FieldByName('TRANSACAO_ID').AsInteger;

    IQuery.Prepare;
    IQuery.Open;

    Vr_Pis_St    := IQuery.FieldByName('VR_PIS').AsFloat;
    Vr_Cofins_St := IQuery.FieldByName('VR_COFINS').AsFloat;

    if QTabela.FieldByName('COND_PAGTO').AsString = 'A PRAZO' then
    begin
      IQuery.Sql.Clear;
      IQuery.Sql.Add('UPDATE TRANSPARCELAS SET TIPO_TRANSACAO = :TIPO_TRANSACAO');
      IQuery.Sql.Add('WHERE');
      IQuery.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
      IQuery.Sql.Add('AND (TIPO_TRANSACAO = :TIPO_TRANS)');

      IQuery.ParamByName('TIPO_TRANSACAO').AsString := 'U';
      IQuery.ParamByName('TRANSACAO_ID').AsInteger  := QTabela.FieldByName('TRANSACAO_ID').AsInteger;
      IQuery.ParamByName('TIPO_TRANS').AsString     := 'T';

      IQuery.Prepare;
      IQuery.ExecSql;


    end;

    IQuery.Sql.Clear;
    IQuery.Sql.Add('UPDATE TRANSACOES SET VR_PIS = :VR_PIS, VR_COFINS = :VR_COFINS, VR_PIS_ST = :VR_PIS_ST, VR_COFINS_ST = :VR_COFINS_ST');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

    IQuery.ParamByName('VR_PIS').AsFloat          := Vr_Pis;
    IQuery.ParamByName('VR_COFINS').AsFloat       := Vr_Cofins;
    IQuery.ParamByName('VR_PIS_ST').AsFloat       := Vr_Pis_St;
    IQuery.ParamByName('VR_COFINS_ST').AsFloat    := Vr_Cofins_St;
    IQuery.ParamByName('TRANSACAO_ID').AsInteger  := QTabela.FieldByName('TRANSACAO_ID').AsInteger;

    IQuery.Prepare;
    IQuery.ExecSql;



    if QTabela.FieldByName('COND_PAGTO').AsString = 'A PRAZO' then
    begin
      IQuery.Sql.Clear;
      IQuery.Sql.Add('UPDATE TRANSPARCELAS SET TIPO_TRANSACAO = :TIPO_TRANSACAO');
      IQuery.Sql.Add('WHERE');
      IQuery.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
      IQuery.Sql.Add('AND (TIPO_TRANSACAO = :TIPO_TRANS)');

      IQuery.ParamByName('TIPO_TRANSACAO').AsString := 'T';
      IQuery.ParamByName('TRANSACAO_ID').AsInteger  := QTabela.FieldByName('TRANSACAO_ID').AsInteger;
      IQuery.ParamByName('TIPO_TRANS').AsString     := 'U';

      IQuery.Prepare;
      IQuery.ExecSql;


    end;

    Application.ProcessMessages;
    QTabela.Next;
    label5.Caption:= 'Recalculando Pis/Cofins(Compras/Dev.Saídas): ' + IntToStr(QTabela.FieldByName('TRANSACAO_ID').AsInteger);
  end;
    IQuery.Sql.Clear;
    IQuery.Sql.Add('ALTER TABLE PRODUTOS ENABLE TRIGGER PRODUTOS_UP');

    IQuery.Prepare;
    IQuery.ExecSql;


end;


procedure TFrmApuracao_Pis_Cofins.btnCst_PisClick(Sender: TObject);
begin
CST_PIS.Text := GetConsulta_CST('CST_PIS', CST_PIS.Text);
end;

procedure TFrmApuracao_Pis_Cofins.btnExecutaClick(Sender: TObject);
var
Cst_E, Cst_S: String;
begin
// 123, 325
  try
    if CheckBox1.Checked = True then
     RecalcularPISCOFINS;

    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    Cst_E := CST_PIS_ENT.Text;
    Cst_S := CST_PIS.Text;

    if CST_PIS_ENT.Text <> '' then
      Cst_S := '##';

    if CST_PIS.Text <> '' then
      Cst_E := '##';

    if Tipo_Rel.Text = 'Analítico' then
    begin
      if (FrmPrincipal.QEmpresa.FieldByName('CRT').AsString = '4 - REGIME NORMAL - LUCRO REAL') OR (FrmPrincipal.QEmpresa.FieldByName('CRT').AsString = '1 - SIMPLES NACIONAL') or (FrmPrincipal.QEmpresa.FieldByName('CRT').AsString = '5 - SIMPLES NACIONAL - SUBLIMITE') then
      begin
        QRel.Sql.Clear;
        QRel.Sql.Add('SELECT PRODUTO_ID, DESCRICAO, PIS, COFINS, SUM(VR_CREDITO) VR_CREDITO, SUM(VR_DEBITO) VR_DEBITO FROM');

        QRel.Sql.Add('(');

        if Cst_E <> '' then
        begin
          QRel.Sql.Add('SELECT PRODUTOS.PRODUTO_ID, PRODUTOS.DESCRICAO, TRANSITENS.ALIQUOTA_PIS PIS, TRANSITENS.ALIQUOTA_COFINS COFINS, ' +
                       'SUM((TRANSITENS.VR_TOTAL  - TRANSITENS.DESC_RODAPE)) VR_CREDITO, 0 VR_DEBITO');
          QRel.Sql.Add('FROM TRANSITENS');
          QRel.Sql.Add('INNER JOIN TRANSACOES');
          QRel.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
          QRel.Sql.Add('INNER JOIN PRODUTOS');
          QRel.Sql.Add('ON (TRANSITENS.PRODUTO_ID = PRODUTOS.PRODUTO_ID)');
          QRel.Sql.Add('WHERE');
          QRel.Sql.Add('(TRANSITENS.PRODUTO_ID = PRODUTOS.PRODUTO_ID)');
          QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :CD_CPR)');
          QRel.Sql.Add('AND ((TRANSACOES.DEPTO = :DP_CPR) OR (TRANSACOES.DEPTO = :DP_DEV_VDA))');
          QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
         // QRel.Sql.Add('AND (TRANSACOES.BALANCO <> :BALANCO)');
          QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
          QRel.Sql.Add('AND (TRANSACOES.DT_ENT_SAI BETWEEN :DT_INICIAL AND :DT_FINAL)');
          QRel.Sql.Add('AND (PRODUTOS.CST_PIS_ENTR = :CST_PIS_ENTR)');
        end
        else
        begin
          QRel.Sql.Add('SELECT PRODUTOS.PRODUTO_ID, PRODUTOS.DESCRICAO, TRANSITENS.ALIQUOTA_PIS PIS, TRANSITENS.ALIQUOTA_COFINS COFINS, ' +
                       'SUM((TRANSITENS.VR_TOTAL  - TRANSITENS.DESC_RODAPE)) VR_CREDITO, 0 VR_DEBITO');
          QRel.Sql.Add('FROM TRANSITENS');
          QRel.Sql.Add('INNER JOIN TRANSACOES');
          QRel.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
          QRel.Sql.Add('INNER JOIN PRODUTOS');
          QRel.Sql.Add('ON (TRANSITENS.PRODUTO_ID = PRODUTOS.PRODUTO_ID)');
          QRel.Sql.Add('WHERE');
          QRel.Sql.Add('(TRANSITENS.PRODUTO_ID = PRODUTOS.PRODUTO_ID)');
          QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :CD_CPR)');
          QRel.Sql.Add('AND ((TRANSACOES.DEPTO = :DP_CPR) OR (TRANSACOES.DEPTO = :DP_DEV_VDA))');
          QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
         // QRel.Sql.Add('AND (TRANSACOES.BALANCO <> :BALANCO)');
          QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
          QRel.Sql.Add('AND (TRANSACOES.DT_ENT_SAI BETWEEN :DT_INICIAL AND :DT_FINAL)');
        end;

        QRel.Sql.Add('GROUP BY PRODUTOS.PRODUTO_ID, PRODUTOS.DESCRICAO, TRANSITENS.ALIQUOTA_PIS, TRANSITENS.ALIQUOTA_COFINS');

        QRel.Sql.Add('UNION ALL');

        if Cst_S <> '' then
        begin
          QRel.Sql.Add('SELECT PRODUTOS.PRODUTO_ID, PRODUTOS.DESCRICAO, TRANSITENS.ALIQUOTA_PIS PIS, TRANSITENS.ALIQUOTA_COFINS COFINS, 0 VR_CREDITO, ' +
                       'SUM((TRANSITENS.VR_TOTAL  - TRANSITENS.DESC_RODAPE)) VR_DEBITO');
          QRel.Sql.Add('FROM TRANSITENS');
          QRel.Sql.Add('INNER JOIN TRANSACOES');
          QRel.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
          QRel.Sql.Add('INNER JOIN PRODUTOS');
          QRel.Sql.Add('ON (TRANSITENS.PRODUTO_ID = PRODUTOS.PRODUTO_ID)');
          QRel.Sql.Add('INNER JOIN COMPL_NFISCAL');
          QRel.Sql.Add('ON (COMPL_NFISCAL.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
          QRel.Sql.Add('WHERE');
          QRel.Sql.Add('(TRANSITENS.PRODUTO_ID = PRODUTOS.PRODUTO_ID)');
          QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :CD_VDA)');
          QRel.Sql.Add('AND ((TRANSACOES.DEPTO = :DP_VDA) OR (TRANSACOES.DEPTO = :DP_DEV_CPR))');
          QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
          QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
         // QRel.Sql.Add('AND (TRANSACOES.BALANCO <> :BALANCO)');
          QRel.Sql.Add('AND (TRANSACOES.DT_ENT_SAI BETWEEN :DT_INICIAL AND :DT_FINAL)');
          QRel.Sql.Add('AND ((TRANSACOES.MODELO = :MODELO1) OR (TRANSACOES.MODELO = :MODELO2) OR (TRANSACOES.MODELO = :MODELO3) OR (TRANSACOES.MODELO = :MODELO4) OR (TRANSACOES.MODELO = :MODELO5) OR (TRANSACOES.MODELO = :MODELO6))');
          QRel.Sql.Add('AND (PRODUTOS.CST_PIS = :CST_PIS)');
          QRel.Sql.Add('GROUP BY PRODUTOS.PRODUTO_ID, PRODUTOS.DESCRICAO, TRANSITENS.ALIQUOTA_PIS, TRANSITENS.ALIQUOTA_COFINS');

          QRel.Sql.Add('UNION ALL');

          QRel.Sql.Add('SELECT PRODUTOS.PRODUTO_ID, PRODUTOS.DESCRICAO, TRANSITENS.ALIQUOTA_PIS PIS, TRANSITENS.ALIQUOTA_COFINS COFINS, 0 VR_CREDITO, ' +
                       'SUM((TRANSITENS.VR_TOTAL  - TRANSITENS.DESC_RODAPE)) VR_DEBITO');
          QRel.Sql.Add('FROM TRANSITENS');
          QRel.Sql.Add('INNER JOIN TRANSACOES');
          QRel.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
          QRel.Sql.Add('INNER JOIN PRODUTOS');
          QRel.Sql.Add('ON (TRANSITENS.PRODUTO_ID = PRODUTOS.PRODUTO_ID)');
          QRel.Sql.Add('INNER JOIN COMPL_NFCEFISCAL');
          QRel.Sql.Add('ON (COMPL_NFCEFISCAL.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
          QRel.Sql.Add('WHERE');
          QRel.Sql.Add('(TRANSITENS.PRODUTO_ID = PRODUTOS.PRODUTO_ID)');
          QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :CD_VDA)');
          QRel.Sql.Add('AND ((TRANSACOES.DEPTO = :DP_VDA) OR (TRANSACOES.DEPTO = :DP_DEV_CPR))');
          QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
          QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
         // QRel.Sql.Add('AND (TRANSACOES.BALANCO <> :BALANCO)');
          QRel.Sql.Add('AND (TRANSACOES.DT_ENT_SAI BETWEEN :DT_INICIAL AND :DT_FINAL)');
          QRel.Sql.Add('AND (TRANSACOES.MODELO = :MODELO6)');
          QRel.Sql.Add('AND (PRODUTOS.CST_PIS = :CST_PIS)');

        end
        else
        begin
          QRel.Sql.Add('SELECT PRODUTOS.PRODUTO_ID, PRODUTOS.DESCRICAO, TRANSITENS.ALIQUOTA_PIS PIS, TRANSITENS.ALIQUOTA_COFINS COFINS, 0 VR_CREDITO, ' +
                       'SUM((TRANSITENS.VR_TOTAL + TRANSITENS.VALOR_ICMS_ST + TRANSITENS.VR_FRETE + TRANSITENS.VR_ACRESCIMO + TRANSITENS.VR_IPI - TRANSITENS.DESC_RODAPE) ) VR_DEBITO');
          QRel.Sql.Add('FROM TRANSITENS');
          QRel.Sql.Add('INNER JOIN TRANSACOES');
          QRel.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
          QRel.Sql.Add('INNER JOIN PRODUTOS');
          QRel.Sql.Add('ON (TRANSITENS.PRODUTO_ID = PRODUTOS.PRODUTO_ID)');
          QRel.Sql.Add('INNER JOIN COMPL_NFISCAL');
          QRel.Sql.Add('ON (COMPL_NFISCAL.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
          QRel.Sql.Add('WHERE');
          QRel.Sql.Add('(TRANSITENS.PRODUTO_ID = PRODUTOS.PRODUTO_ID)');
          QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :CD_VDA)');
          QRel.Sql.Add('AND ((TRANSACOES.DEPTO = :DP_VDA) OR (TRANSACOES.DEPTO = :DP_DEV_CPR))');
          QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
          QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
         // QRel.Sql.Add('AND (TRANSACOES.BALANCO <> :BALANCO)');
          QRel.Sql.Add('AND (TRANSACOES.DT_ENT_SAI BETWEEN :DT_INICIAL AND :DT_FINAL)');
          QRel.Sql.Add('AND ((TRANSACOES.MODELO = :MODELO1) OR (TRANSACOES.MODELO = :MODELO2) OR (TRANSACOES.MODELO = :MODELO3) OR (TRANSACOES.MODELO = :MODELO4)  OR (TRANSACOES.MODELO = :MODELO5) OR (TRANSACOES.MODELO = :MODELO6))');
          QRel.Sql.Add('GROUP BY PRODUTOS.PRODUTO_ID, PRODUTOS.DESCRICAO, TRANSITENS.ALIQUOTA_PIS, TRANSITENS.ALIQUOTA_COFINS');

          QRel.Sql.Add('UNION ALL');

          QRel.Sql.Add('SELECT PRODUTOS.PRODUTO_ID, PRODUTOS.DESCRICAO, TRANSITENS.ALIQUOTA_PIS PIS, TRANSITENS.ALIQUOTA_COFINS COFINS, 0 VR_CREDITO, ' +
                       'SUM((TRANSITENS.VR_TOTAL + TRANSITENS.VALOR_ICMS_ST + TRANSITENS.VR_FRETE + TRANSITENS.VR_ACRESCIMO + TRANSITENS.VR_IPI - TRANSITENS.DESC_RODAPE) ) VR_DEBITO');
          QRel.Sql.Add('FROM TRANSITENS');
          QRel.Sql.Add('INNER JOIN TRANSACOES');
          QRel.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
          QRel.Sql.Add('INNER JOIN PRODUTOS');
          QRel.Sql.Add('ON (TRANSITENS.PRODUTO_ID = PRODUTOS.PRODUTO_ID)');
          QRel.Sql.Add('INNER JOIN COMPL_NFCEFISCAL');
          QRel.Sql.Add('ON (COMPL_NFCEFISCAL.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
          QRel.Sql.Add('WHERE');
          QRel.Sql.Add('(TRANSITENS.PRODUTO_ID = PRODUTOS.PRODUTO_ID)');
          QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :CD_VDA)');
          QRel.Sql.Add('AND ((TRANSACOES.DEPTO = :DP_VDA) OR (TRANSACOES.DEPTO = :DP_DEV_CPR))');
          QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
          QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
         // QRel.Sql.Add('AND (TRANSACOES.BALANCO <> :BALANCO)');
          QRel.Sql.Add('AND (TRANSACOES.DT_ENT_SAI BETWEEN :DT_INICIAL AND :DT_FINAL)');
          QRel.Sql.Add('AND (TRANSACOES.MODELO = :MODELO6) ');

        end;

        QRel.Sql.Add('GROUP BY PRODUTOS.PRODUTO_ID, PRODUTOS.DESCRICAO, TRANSITENS.ALIQUOTA_PIS, TRANSITENS.ALIQUOTA_COFINS');

        QRel.Sql.Add('UNION ALL');

        if Cst_S <> '' then
        begin
          QRel.Sql.Add('SELECT PRODUTOS.PRODUTO_ID, PRODUTOS.DESCRICAO, PRODUTOS.PIS, PRODUTOS.COFINS, 0 VR_CREDITO, SUM(REGISTRO_60I.BASE_CALC_ICMS) VR_DEBITO');
          QRel.Sql.Add('FROM REGISTRO_60I');
          QRel.Sql.Add('INNER JOIN PRODUTOS');
          QRel.Sql.Add('ON (REGISTRO_60I.COD_PRODUTO = PRODUTOS.COD_BARRA)');
          QRel.Sql.Add('INNER JOIN CST_PIS');
          QRel.Sql.Add('ON (PRODUTOS.CST_PIS = CST_PIS.CODIGO)');
          QRel.Sql.Add('INNER JOIN LICENCA_IF');
          QRel.Sql.Add('ON (REGISTRO_60I.NUM_SERIE = LICENCA_IF.SERIAL)');
          QRel.Sql.Add('INNER JOIN EMPRESAS');
          QRel.Sql.Add('ON (LICENCA_IF.CNPJ = EMPRESAS.CNPJ)');
          QRel.Sql.Add('WHERE');
          QRel.Sql.Add('(REGISTRO_60I.DT_EMISSAO BETWEEN :DT_INICIAL AND :DT_FINAL)');
          QRel.Sql.Add('AND (REGISTRO_60I.SIT_TRIBUTARIA <> :SIT_TRIBUTARIA)');
          QRel.Sql.Add('AND (EMPRESAS.EMPRESA_ID = :EMPRESA_ID)');
          QRel.Sql.Add('AND (PRODUTOS.CST_PIS = :CST_PIS)');
        end
        else
        begin
          QRel.Sql.Add('SELECT PRODUTOS.PRODUTO_ID, PRODUTOS.DESCRICAO, PRODUTOS.PIS, PRODUTOS.COFINS, 0 VR_CREDITO, SUM(REGISTRO_60I.BASE_CALC_ICMS) VR_DEBITO');
          QRel.Sql.Add('FROM REGISTRO_60I');
          QRel.Sql.Add('INNER JOIN PRODUTOS');
          QRel.Sql.Add('ON (REGISTRO_60I.COD_PRODUTO = PRODUTOS.COD_BARRA)');
          QRel.Sql.Add('INNER JOIN CST_PIS');
          QRel.Sql.Add('ON (PRODUTOS.CST_PIS = CST_PIS.CODIGO)');
          QRel.Sql.Add('INNER JOIN LICENCA_IF');
          QRel.Sql.Add('ON (REGISTRO_60I.NUM_SERIE = LICENCA_IF.SERIAL)');
          QRel.Sql.Add('INNER JOIN EMPRESAS');
          QRel.Sql.Add('ON (LICENCA_IF.CNPJ = EMPRESAS.CNPJ)');
          QRel.Sql.Add('WHERE');
          QRel.Sql.Add('(REGISTRO_60I.DT_EMISSAO BETWEEN :DT_INICIAL AND :DT_FINAL)');
          QRel.Sql.Add('AND (REGISTRO_60I.SIT_TRIBUTARIA <> :SIT_TRIBUTARIA)');
          QRel.Sql.Add('AND (EMPRESAS.EMPRESA_ID = :EMPRESA_ID)');
        end;

        QRel.Sql.Add('GROUP BY PRODUTOS.PRODUTO_ID, PRODUTOS.DESCRICAO, PRODUTOS.PIS, PRODUTOS.COFINS');

        QRel.Sql.Add(')AS TESTE');
        QRel.Sql.Add('GROUP BY PRODUTO_ID, DESCRICAO, PIS, COFINS');
        QRel.Sql.Add('ORDER BY DESCRICAO');

        QRel.ParamByName('CD_CPR').AsString         := '02';
        QRel.ParamByName('DP_CPR').AsString         := '07';
        QRel.ParamByName('DP_DEV_VDA').AsString     := '10';
      //  QRel.ParamByName('BALANCO').AsString        := 'AGRUPADO';
        QRel.ParamByName('CD_VDA').AsString         := '01';
        QRel.ParamByName('DP_VDA').AsString         := '07';
        QRel.ParamByName('DP_DEV_CPR').AsString     := '10';
        QRel.ParamByName('MODELO1').AsString        := '01';
        QRel.ParamByName('MODELO2').AsString        := '1B';
        QRel.ParamByName('MODELO3').AsString        := '04';
        QRel.ParamByName('MODELO4').AsString        := '55';
        QRel.ParamByName('MODELO5').AsString        := '57';
        QRel.ParamByName('MODELO6').AsString        := '65';
        QRel.ParamByName('SIT_TRIBUTARIA').AsString := 'CANC';
        QRel.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
        QRel.ParamByName('TPCTB').AsString          := FrmData.QAcesso.FieldByName('TPCTB').AsString;
        QRel.ParamByName('DT_INICIAL').AsDateTime   := Dtmen.Date;
        QRel.ParamByName('DT_FINAL').AsDateTime     := Dtmai.Date;

        if Cst_S <> '' then
          QRel.ParamByName('CST_PIS').AsString := Cst_S;

        if Cst_E <> '' then
          QRel.ParamByName('CST_PIS_ENTR').AsString := Cst_E;

        QRel.Prepare;
        QRel.Open;



        QRLabel1.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;

        if QRel.IsEmpty then
          Application.MessageBox('Não há dados para os parâmetros informados', PChar(Msg_Title), mb_IconInformation)
        else
          Extrato_Pis_Cofins_LR.PreviewModal;
      end
      else if FrmPrincipal.QEmpresa.FieldByName('CRT').AsString = '3 - REGIME NORMAL - LUCRO PRESUMIDO' then
      begin
        QRel.Sql.Clear;
        QRel.Sql.Add('SELECT PRODUTOS.PRODUTO_ID, PRODUTOS.DESCRICAO, PRODUTOS.PIS, PRODUTOS.COFINS,');

        QRel.Sql.Add('(SELECT SUM(TRANSITENS.VR_TOTAL)');
        QRel.Sql.Add('FROM TRANSITENS');
        QRel.Sql.Add('INNER JOIN TRANSACOES');
        QRel.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
        QRel.Sql.Add('WHERE');
        QRel.Sql.Add('(TRANSITENS.PRODUTO_ID = PRODUTOS.PRODUTO_ID)');
        QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :CD_VDA)');
        QRel.Sql.Add('AND (TRANSACOES.DEPTO = :DP_VDA)');
        QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
        QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
     //   QRel.Sql.Add('AND (TRANSACOES.BALANCO <> :BALANCO)');
        QRel.Sql.Add('AND (TRANSACOES.DT_ENT_SAI BETWEEN :DT_INICIAL AND :DT_FINAL)) VR_DEBITO');

        QRel.Sql.Add('FROM TRANSITENS');
        QRel.Sql.Add('INNER JOIN TRANSACOES');
        QRel.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
        QRel.Sql.Add('INNER JOIN PRODUTOS');
        QRel.Sql.Add('ON (TRANSITENS.PRODUTO_ID = PRODUTOS.PRODUTO_ID)');
        QRel.Sql.Add('GROUP BY PRODUTOS.PRODUTO_ID, PRODUTOS.DESCRICAO, PRODUTOS.PIS, PRODUTOS.COFINS');
        QRel.Sql.Add('ORDER BY PRODUTOS.DESCRICAO');

        QRel.ParamByName('CD_VDA').AsString       := '01';
        QRel.ParamByName('DP_VDA').AsString       := '07';
       // QRel.ParamByName('BALANCO').AsString      := 'AGRUPADO';
        QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
        QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
        QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
        QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;

        QRel.Prepare;
        QRel.Open;

        QRLabel9.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;

        if QRel.IsEmpty then
          Application.MessageBox('Não há dados para os parâmetros informados', PChar(Msg_Title), mb_IconInformation)
        else
          Extrato_Pis_Cofins_LP.PreviewModal;
     end
    end
    else
    begin
      QSintetico.Sql.Clear;
      QSintetico.Sql.Add('SELECT CST, DESCRICAO, SUM(COMPRAS) COMPRAS, SUM(VENDAS) VENDAS, SUM(CREDITO_PIS) CREDITO_PIS, SUM(DEBITO_PIS) DEBITO_PIS, SUM(CREDITO_COFINS) CREDITO_COFINS,  SUM(DEBITO_COFINS) DEBITO_COFINS FROM');
      QSintetico.Sql.Add('(');

      QSintetico.Sql.Add('SELECT TRANSITENS.CST_PIS CST, CST_PIS.DESCRICAO, SUM((TRANSITENS.VR_TOTAL - TRANSITENS.DESC_RODAPE)) COMPRAS, 0 VENDAS, ' +
                        'SUM((((TRANSITENS.VR_TOTAL  - TRANSITENS.DESC_RODAPE) * PRODUTOS.PIS_ENTR) / 100)) CREDITO_PIS, 0 DEBITO_PIS, ' +
                        'SUM((TRANSITENS.VR_TOTAL  - TRANSITENS.DESC_RODAPE)) BASE_CALC_COFINS, ' +
                        'SUM((((TRANSITENS.VR_TOTAL  - TRANSITENS.DESC_RODAPE) * PRODUTOS.COFINS_ENTR) / 100)) CREDITO_COFINS, 0 DEBITO_COFINS');
      QSintetico.Sql.Add('FROM TRANSITENS');
      QSintetico.Sql.Add('INNER JOIN PRODUTOS');
      QSintetico.Sql.Add('ON (TRANSITENS.PRODUTO_ID = PRODUTOS.PRODUTO_ID)');
      QSintetico.Sql.Add('INNER JOIN CST_PIS');
      QSintetico.Sql.Add('ON (TRANSITENS.CST_PIS = CST_PIS.CODIGO)');
      QSintetico.Sql.Add('INNER JOIN TRANSACOES');
      QSintetico.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
      QSintetico.Sql.Add('WHERE');
      QSintetico.Sql.Add('(TRANSACOES.DT_ENT_SAI BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QSintetico.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QSintetico.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QSintetico.Sql.Add('AND ((TRANSACOES.MODELO = :MODELO1) OR (TRANSACOES.MODELO = :MODELO2) OR (TRANSACOES.MODELO = :MODELO3) OR (TRANSACOES.MODELO = :MODELO4) OR (TRANSACOES.MODELO = :MODELO15)  )');
      QSintetico.Sql.Add('AND (TRANSACOES.CONDUTA = :CD_ENTR)');
      QSintetico.Sql.Add('AND ((TRANSACOES.DEPTO = :DEPTO1) OR (TRANSACOES.DEPTO = :DEPTO2))');
      QSintetico.Sql.Add('GROUP BY TRANSITENS.CST_PIS, CST_PIS.DESCRICAO');

      QSintetico.Sql.Add('UNION ALL');

      QSintetico.Sql.Add('SELECT CST_PIS CST, CST_PIS.DESCRICAO, VALOR COMPRAS, 0 VENDAS, ' +
                        'SUM((VALOR * ALIQUOTA_PIS) / 100) CREDITO_PIS, 0 DEBITO_PIS, ' +
                        'BASE_CALC_COFINS, ' +
                        'SUM(VALOR * ALIQUOTA_COFINS / 100) CREDITO_COFINS, 0 DEBITO_COFINS');
      QSintetico.Sql.Add('FROM TRANSACOES');
      QSintetico.Sql.Add('INNER JOIN CST_PIS');
      QSintetico.Sql.Add('ON (CST_PIS = CST_PIS.CODIGO)');
      QSintetico.Sql.Add('WHERE');
      QSintetico.Sql.Add('(TRANSACOES.DT_ENT_SAI BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QSintetico.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QSintetico.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QSintetico.Sql.Add('AND ((TRANSACOES.MODELO = :MODELO6) OR (TRANSACOES.MODELO = :MODELO7) OR (TRANSACOES.MODELO = :MODELO8) OR (TRANSACOES.MODELO = :MODELO9) OR (TRANSACOES.MODELO = :MODELO10)');
      QSintetico.Sql.Add('OR  (TRANSACOES.MODELO = :MODELO11) OR (TRANSACOES.MODELO = :MODELO12) OR (TRANSACOES.MODELO = :MODELO13) OR (TRANSACOES.MODELO = :MODELO14) OR (TRANSACOES.MODELO = :MODELO5))');
      QSintetico.Sql.Add('AND (TRANSACOES.CONDUTA = :CD_ENTR)');
      QSintetico.Sql.Add('AND (TRANSACOES.DEPTO = :CD_ENTR)');
      QSintetico.Sql.Add('GROUP BY CST_PIS, CST_PIS.DESCRICAO, VALOR, BASE_CALC_COFINS');

      QSintetico.Sql.Add('UNION ALL');

      QSintetico.Sql.Add('SELECT TRANSITENS.CST_PIS CST, CST_PIS.DESCRICAO, 0 COMPRAS, SUM((TRANSITENS.VR_TOTAL  - TRANSITENS.DESC_RODAPE)) VENDAS, ' +
                         '0 CREDITO_PIS, SUM((((TRANSITENS.VR_TOTAL  - TRANSITENS.DESC_RODAPE) * PRODUTOS.PIS) / 100)) DEBITO_PIS, ' +
                         'SUM((TRANSITENS.VR_TOTAL  - TRANSITENS.DESC_RODAPE)) BASE_CALC_COFINS, 0 CREDITO_COFINS, ' +
                         'SUM((((TRANSITENS.VR_TOTAL  - TRANSITENS.DESC_RODAPE) * PRODUTOS.COFINS) / 100)) DEBITO_COFINS');
      QSintetico.Sql.Add('FROM TRANSITENS');
      QSintetico.Sql.Add('INNER JOIN PRODUTOS');
      QSintetico.Sql.Add('ON (TRANSITENS.PRODUTO_ID = PRODUTOS.PRODUTO_ID)');
      QSintetico.Sql.Add('INNER JOIN CST_PIS');
      QSintetico.Sql.Add('ON (TRANSITENS.CST_PIS = CST_PIS.CODIGO)');
      QSintetico.Sql.Add('INNER JOIN TRANSACOES');
      QSintetico.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
      QSintetico.Sql.Add('INNER JOIN COMPL_NFISCAL');
      QSintetico.Sql.Add('ON (COMPL_NFISCAL.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
      QSintetico.Sql.Add('WHERE');
      QSintetico.Sql.Add('(TRANSACOES.DT_ENT_SAI BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QSintetico.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QSintetico.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QSintetico.Sql.Add('AND ((TRANSACOES.MODELO = :MODELO1) OR (TRANSACOES.MODELO = :MODELO2) OR (TRANSACOES.MODELO = :MODELO3) OR (TRANSACOES.MODELO = :MODELO4) OR (TRANSACOES.MODELO = :MODELO5) OR (TRANSACOES.MODELO = :MODELO15))');
      QSintetico.Sql.Add('AND (TRANSACOES.CONDUTA = :CD_SAIDA)');
      QSintetico.Sql.Add('AND ((TRANSACOES.DEPTO = :DEPTO1) OR (TRANSACOES.DEPTO = :DEPTO2))');

      QSintetico.Sql.Add('GROUP BY TRANSITENS.CST_PIS, CST_PIS.DESCRICAO');

      QSintetico.Sql.Add('UNION ALL');

      QSintetico.Sql.Add('SELECT TRANSITENS.CST_PIS CST, CST_PIS.DESCRICAO, 0 COMPRAS, SUM((TRANSITENS.VR_TOTAL  - TRANSITENS.DESC_RODAPE)) VENDAS, ' +
                         '0 CREDITO_PIS, SUM((((TRANSITENS.VR_TOTAL  - TRANSITENS.DESC_RODAPE) * PRODUTOS.PIS) / 100)) DEBITO_PIS, ' +
                         'SUM((TRANSITENS.VR_TOTAL  - TRANSITENS.DESC_RODAPE)) BASE_CALC_COFINS, 0 CREDITO_COFINS, ' +
                         'SUM((((TRANSITENS.VR_TOTAL  - TRANSITENS.DESC_RODAPE) * PRODUTOS.COFINS) / 100)) DEBITO_COFINS');
      QSintetico.Sql.Add('FROM TRANSITENS');
      QSintetico.Sql.Add('INNER JOIN PRODUTOS');
      QSintetico.Sql.Add('ON (TRANSITENS.PRODUTO_ID = PRODUTOS.PRODUTO_ID)');
      QSintetico.Sql.Add('INNER JOIN CST_PIS');
      QSintetico.Sql.Add('ON (TRANSITENS.CST_PIS = CST_PIS.CODIGO)');
      QSintetico.Sql.Add('INNER JOIN TRANSACOES');
      QSintetico.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
      QSintetico.Sql.Add('INNER JOIN COMPL_NFCEFISCAL');
      QSintetico.Sql.Add('ON (COMPL_NFCEFISCAL.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
      QSintetico.Sql.Add('WHERE');
      QSintetico.Sql.Add('(TRANSACOES.DT_ENT_SAI BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QSintetico.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QSintetico.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QSintetico.Sql.Add('AND (TRANSACOES.MODELO = :MODELO15)');
      QSintetico.Sql.Add('AND (TRANSACOES.CONDUTA = :CD_SAIDA)');
      QSintetico.Sql.Add('AND ((TRANSACOES.DEPTO = :DEPTO1) OR (TRANSACOES.DEPTO = :DEPTO2))');

      QSintetico.Sql.Add('GROUP BY TRANSITENS.CST_PIS, CST_PIS.DESCRICAO');

      QSintetico.Sql.Add('UNION ALL');

      QSintetico.Sql.Add('SELECT PRODUTOS.CST_PIS CST, CST_PIS.DESCRICAO, 0 COMPRAS, SUM(REGISTRO_60I.BASE_CALC_ICMS) VENDAS, 0 CREDITO_PIS, SUM(((REGISTRO_60I.BASE_CALC_ICMS * PRODUTOS.PIS) / 100)) DEBITO_PIS, SUM(REGISTRO_60I.BASE_CALC_ICMS) VENDAS, ' +
                         '0 CREDITO_COFINS, SUM(((REGISTRO_60I.BASE_CALC_ICMS * PRODUTOS.COFINS) / 100)) DEBITO_COFINS');
      QSintetico.Sql.Add('FROM REGISTRO_60I');
      QSintetico.Sql.Add('INNER JOIN PRODUTOS');
      QSintetico.Sql.Add('ON (REGISTRO_60I.COD_PRODUTO = PRODUTOS.COD_BARRA)');
      QSintetico.Sql.Add('INNER JOIN CST_PIS');
      QSintetico.Sql.Add('ON (PRODUTOS.CST_PIS = CST_PIS.CODIGO)');
      QSintetico.Sql.Add('INNER JOIN LICENCA_IF');
      QSintetico.Sql.Add('ON (REGISTRO_60I.NUM_SERIE = LICENCA_IF.SERIAL)');
      QSintetico.Sql.Add('INNER JOIN EMPRESAS');
      QSintetico.Sql.Add('ON (LICENCA_IF.CNPJ = EMPRESAS.CNPJ)');
      QSintetico.Sql.Add('WHERE');
      QSintetico.Sql.Add('(REGISTRO_60I.DT_EMISSAO BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QSintetico.Sql.Add('AND (REGISTRO_60I.SIT_TRIBUTARIA <> :SIT_TRIBUTARIA)');
      QSintetico.Sql.Add('AND (EMPRESAS.EMPRESA_ID = :EMPRESA_ID)');
      QSintetico.Sql.Add('GROUP BY PRODUTOS.CST_PIS, CST_PIS.DESCRICAO');

      QSintetico.Sql.Add(')AS TESTE');
      QSintetico.Sql.Add('GROUP BY CST, DESCRICAO');
      QSintetico.Sql.Add('ORDER BY CST');

      QSintetico.ParamByName('CD_ENTR').AsString        := '02';
      QSintetico.ParamByName('CD_SAIDA').AsString       := '01';
      QSintetico.ParamByName('DEPTO1').AsString         := '07';
      QSintetico.ParamByName('DEPTO2').AsString         := '10';
      QSintetico.ParamByName('MODELO1').AsString        := '01';
      QSintetico.ParamByName('MODELO2').AsString        := '1B';
      QSintetico.ParamByName('MODELO3').AsString        := '04';
      QSintetico.ParamByName('MODELO4').AsString        := '55';
      QSintetico.ParamByName('MODELO5').AsString        := '57';
      QSintetico.ParamByName('MODELO6').AsString        := '06';
      QSintetico.ParamByName('MODELO7').AsString        := '07';
      QSintetico.ParamByName('MODELO8').AsString        := '08';
      QSintetico.ParamByName('MODELO9').AsString        := '09';
      QSintetico.ParamByName('MODELO10').AsString       := '10';
      QSintetico.ParamByName('MODELO11').AsString       := '11';
      QSintetico.ParamByName('MODELO12').AsString       := '21';
      QSintetico.ParamByName('MODELO13').AsString       := '22';
      QSintetico.ParamByName('MODELO14').AsString       := '28';
      QSintetico.ParamByName('MODELO15').AsString       := '65';
      QSintetico.ParamByName('SIT_TRIBUTARIA').AsString := 'CANC';
      QSintetico.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
      QSintetico.ParamByName('TPCTB').AsString          := FrmData.QAcesso.FieldByName('TPCTB').AsString;
      QSintetico.ParamByName('DT_INICIAL').AsDateTime   := Dtmen.Date;
      QSintetico.ParamByName('DT_FINAL').AsDateTime     := Dtmai.Date;


      QSintetico.Prepare;
      QSintetico.Open;

      QRLabel24.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;

      if QSintetico.IsEmpty then
        Application.MessageBox('Não há dados para os parâmetros informados', PChar(Msg_Title), mb_IconInformation)
      else
        Extrato_Pis_Cofins_Sintetico.PreviewModal;
    end;

  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;

procedure TFrmApuracao_Pis_Cofins.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmApuracao_Pis_Cofins.btn_cst_pis_entClick(Sender: TObject);
begin
CST_PIS.Text := GetConsulta_CST('CST_PIS', CST_PIS.Text);
end;

procedure TFrmApuracao_Pis_Cofins.CST_PISChange(Sender: TObject);
begin
if cst_pis.Text <> '' then
Begin
cst_pis_ent.Visible := False;
label4.Visible := False;
btn_cst_pis_ent.Visible := False;
Cst_Pis_ent.Text := '';
End
Else
Begin
cst_pis_ent.Visible := True;
label4.Visible := True;
Btn_cst_pis_ent.Visible := True;
End;
end;

procedure TFrmApuracao_Pis_Cofins.cst_pis_entChange(Sender: TObject);
begin
if cst_pis_ent.Text <> '' then
Begin
cst_pis.Visible := False;
label3.Visible := False;
Btncst_pis.Visible := False;
cst_pis.Text := '';
End
Else
Begin
cst_pis.Visible := True;
label3.Visible := True;
Btncst_pis.Visible :=True;
End;
end;

procedure TFrmApuracao_Pis_Cofins.Tipo_RelChange(Sender: TObject);
begin
 if  (Tipo_Rel.Text = 'Analítico') then
      Begin
      Label3.Visible := True;
      Cst_pis.Visible := True;
      BtnCst_Pis.Visible := True;
      label4.Visible := True;
      Cst_pis_ent.Visible := True;
      Btn_cst_pis_ent.Visible :=True;
      End
      Else
      Begin
      Label3.Visible := False;
      Cst_pis.Visible := False;
      BtnCst_Pis.Visible :=False;
      label4.Visible := False;
      Cst_pis_ent.Visible := False;
      Btn_cst_pis_ent.Visible :=False;
      End;
end;

procedure TFrmApuracao_Pis_Cofins.Tipo_RelKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmApuracao_Pis_Cofins.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmApuracao_Pis_Cofins.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
   // Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmApuracao_Pis_Cofins.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmApuracao_Pis_Cofins.FormCreate(Sender: TObject);
begin
  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);
end;

procedure TFrmApuracao_Pis_Cofins.ibqryQSinteticoAfterOpen(DataSet: TDataSet);
begin
  TFloatField(QSintetico.FieldByName('COMPRAS')).DisplayFormat        := '#,##0.00';
  TFloatField(QSintetico.FieldByName('VENDAS')).DisplayFormat         := '#,##0.00';
  TFloatField(QSintetico.FieldByName('CREDITO_PIS')).DisplayFormat    := '#,##0.00';
  TFloatField(QSintetico.FieldByName('DEBITO_PIS')).DisplayFormat     := '#,##0.00';
  TFloatField(QSintetico.FieldByName('CREDITO_COFINS')).DisplayFormat := '#,##0.00';
  TFloatField(QSintetico.FieldByName('DEBITO_COFINS')).DisplayFormat  := '#,##0.00';
end;

end.
