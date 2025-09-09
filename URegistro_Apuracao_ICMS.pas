unit URegistro_Apuracao_ICMS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, StdCtrls, Mask, rxToolEdit, DBTables,
  DB, IBCustomDataSet, IBQuery, Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrmRegistro_Apuracao_ICMS = class(TForm)
    Label1: TLabel;
    Dtmen: TDateEdit;
    Dtmai: TDateEdit;
    Bevel1: TBevel;
    Apuracao_ICMS: TQuickRep;
    QRBand2: TQRBand;
    QRBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRShape2: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRGroup1: TQRGroup;
    QRShape3: TQRShape;
    QRLabel7: TQRLabel;
    QRShape4: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRBand3: TQRBand;
    QRShape13: TQRShape;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRShape15: TQRShape;
    QRLabel24: TQRLabel;
    QRShape14: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRSysData1: TQRSysData;
    QRLabel25: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    btnExecuta: TBitBtn;
    btnRetorna: TBitBtn;
    Chk_Outros: TCheckBox;
    QItens: TFDQuery;
    QRel: TFDQuery;
    Table_Temp: TFDMemTable;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRetornaClick(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DtmenEnter(Sender: TObject);
    procedure QRBand3AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRegistro_Apuracao_ICMS: TFrmRegistro_Apuracao_ICMS;

implementation

uses
  UPrincipal, UData;

{$R *.dfm}

procedure TFrmRegistro_Apuracao_ICMS.btnExecutaClick(Sender: TObject);
var
Cond, Temp_Name: String;
begin
// 151
// 325
  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;                    

    try
      with Table_Temp do
      begin

        Temp_Name    := Copy(TimeToStr(time), 1, 2) + Copy(TimeToStr(time), 4, 2) + Copy(TimeToStr(time), 7, 2);


        with FieldDefs do
        begin
          Clear;
          Add('ID', ftAutoInc, 0, False);
          Add('SUB_TIT', ftString, 10, False);
          Add('CFOP', ftString, 4, False);
          Add('CONTABIL', ftFloat, 0, False);
          Add('BASE_CALCULO', ftFloat, 0, False);
          Add('IMP_CREDITADO', ftFloat, 0, False);
          Add('ISENTAS', ftFloat, 0, False);
          Add('OUTRAS', ftFloat, 0, False);
        end;

        with IndexDefs do
        begin
          Clear;
          Add('', 'ID', [ixPrimary, ixUnique]);
          Add('TEMP', 'SUB_TIT;CFOP', [ixCaseInsensitive]);
        end;
        IndexName := 'TEMP';
        Open;
      end;
    except
     Application.MessageBox('Ocorreu um erro ao criar um arquivo temporário', PChar(Msg_Title), mb_IconStop);
     exit;
    end;

    // Compra

    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT * FROM TRANSACOES');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(DT_SPED BETWEEN :DT_INICIAL AND :DT_FINAL)');
    QRel.Sql.Add('AND (EMPRESA_ID = :EMPRESA_ID)');
    QRel.Sql.Add('AND (TPCTB <= :TPCTB)');
    QRel.Sql.Add('AND (CONDUTA = :CD_CPR)');
    QRel.Sql.Add('AND (MODELO <> :MODELO)');
    QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
    QRel.Sql.Add('ORDER BY NUM_DOC');

    QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
    QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    QRel.ParamByName('CD_CPR').AsString       := '02';
    QRel.ParamByName('MODELO').AsString       := '';

    QRel.Prepare;
    QRel.Open;

    QRel.First;
    while not QRel.Eof do
    begin
      if (QRel.FieldByName('DEPTO').AsString = '07') or (QRel.FieldByName('DEPTO').AsString = '10') then
      begin
        QItens.Sql.Clear;
        QItens.Sql.Add('SELECT CFOP, ALIQUOTA_ICMS,CASE WHEN(CST = :070 OR CST = :010) THEN 0 ELSE SUM(coalesce(BASE_CALC_ICMS,0)) END BASE_CALC_ICMS ,');
        QItens.Sql.Add('CASE WHEN(CST = :070 OR CST = :010) THEN 0 ELSE SUM(coalesce(VALOR_ICMS,0)) END VALOR_ICMS, SUM(coalesce(VALOR_ICMS_ST,0)) VALOR_ICMS_ST,');
        QItens.Sql.Add('SUM(coalesce(VR_TOTAL,0) + coalesce(VALOR_ICMS_ST,0) + coalesce(VR_FRETE,0) + coalesce(VR_ACRESCIMO,0) + coalesce(VR_IPI,0) + coalesce(VR_FCPST,0) + coalesce(VR_FCP,0) - coalesce(DESC_RODAPE,0) - coalesce(VALOR_ICMS_DESON,0)) VR_TOTAL,');
        QItens.Sql.Add('SUM(coalesce(VALOR_ISENTO,0)) VALOR_ISENTO, SUM(coalesce(VALOR_OUTROS,0)) VALOR_OUTROS');
        QItens.Sql.Add('FROM TRANSITENS');
        QItens.Sql.Add('WHERE');
        QItens.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
        QItens.Sql.Add('GROUP BY CFOP, ALIQUOTA_ICMS,CST');

        QItens.ParamByName('TRANSACAO_ID').AsInteger := QRel.FieldByName('TRANSACAO_ID').AsInteger;
        QItens.ParamByName('070').AsString := '070';
        QItens.ParamByName('010').AsString := '010';

        QItens.Prepare;
        QItens.Open;

        QItens.First;
        while not QItens.Eof do
        begin
          if QRel.FieldByName('CONDUTA').AsString = '02' then
            Cond := 'ENTRADAS'
          else
            Cond := 'SAIDAS';

          if Table_Temp.FindKey([Cond, QItens.FieldByName('CFOP').AsString]) then
            Table_Temp.Edit
          else
            Table_Temp.Append;

          Table_Temp.FieldByName('SUB_TIT').AsString      := Cond;
          Table_Temp.FieldByName('CFOP').AsString         := QItens.FieldByName('CFOP').AsString;
          Table_Temp.FieldByName('CONTABIL').AsFloat      := Table_Temp.FieldByName('CONTABIL').AsFloat + QItens.FieldByName('VR_TOTAL').AsFloat;
          Table_Temp.FieldByName('BASE_CALCULO').AsFloat  := Table_Temp.FieldByName('BASE_CALCULO').AsFloat + QItens.FieldByName('BASE_CALC_ICMS').AsFloat;
          Table_Temp.FieldByName('IMP_CREDITADO').AsFloat := Table_Temp.FieldByName('IMP_CREDITADO').AsFloat + QItens.FieldByName('VALOR_ICMS').AsFloat;
          Table_Temp.FieldByName('ISENTAS').AsFloat       := Table_Temp.FieldByName('ISENTAS').AsFloat + QItens.FieldByName('VALOR_ISENTO').AsFloat;
          Table_Temp.FieldByName('OUTRAS').AsFloat        := Table_Temp.FieldByName('OUTRAS').AsFloat + QItens.FieldByName('VALOR_OUTROS').AsFloat;
          Table_Temp.Post;

          Application.ProcessMessages;
          QItens.Next;
        end;
      end
      else
      begin
        if QRel.FieldByName('CONDUTA').AsString = '02' then
          Cond := 'ENTRADAS'
        else
          Cond := 'SAIDAS';

        if Table_Temp.FindKey([Cond, QRel.FieldByName('CFOP').AsString]) then
          Table_Temp.Edit
        else
          Table_Temp.Append;

        Table_Temp.FieldByName('SUB_TIT').AsString      := Cond;
        Table_Temp.FieldByName('CFOP').AsString         := QRel.FieldByName('CFOP').AsString;
        Table_Temp.FieldByName('CONTABIL').AsFloat      := Table_Temp.FieldByName('CONTABIL').AsFloat + QRel.FieldByName('VALOR').AsFloat;
        Table_Temp.FieldByName('BASE_CALCULO').AsFloat  := Table_Temp.FieldByName('BASE_CALCULO').AsFloat + QRel.FieldByName('BASE_ICMS_NORMAL').AsFloat;
        Table_Temp.FieldByName('IMP_CREDITADO').AsFloat := Table_Temp.FieldByName('IMP_CREDITADO').AsFloat + QRel.FieldByName('VR_ICMS_NORMAL').AsFloat;
        Table_Temp.FieldByName('ISENTAS').AsFloat       := Table_Temp.FieldByName('ISENTAS').AsFloat + QRel.FieldByName('VALOR_ISENTO').AsFloat;
        Table_Temp.FieldByName('OUTRAS').AsFloat        := Table_Temp.FieldByName('OUTRAS').AsFloat + QRel.FieldByName('VALOR_OUTROS').AsFloat;
        Table_Temp.Post;

        Application.ProcessMessages;
      end;

      Application.ProcessMessages;
      QRel.Next;
    end;

    // Venda

    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT COMPL_NFISCAL.PROTOCOLO, COMPL_NFISCAL.CHAVE_NFE, TRANSACOES.*');
    QRel.Sql.Add('FROM COMPL_NFISCAL');
    QRel.Sql.Add('INNER JOIN TRANSACOES');
    QRel.Sql.Add('ON (COMPL_NFISCAL.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(TRANSACOES.DT_SPED BETWEEN :DT_INICIAL AND :DT_FINAL)');
    QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
    QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
    QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :CD_CPR)');
    QRel.Sql.Add('AND (TRANSACOES.TIPO_VENDA = ''VENDA'')');
    QRel.Sql.Add('AND ((TRANSACOES.BALANCO <> :BALANCO) OR (TRANSACOES.BALANCO IS NULL))');
    QRel.Sql.Add('AND ((TRANSACOES.MODELO = :MODELO1) OR (TRANSACOES.MODELO = :MODELO2) OR (TRANSACOES.MODELO = :MODELO3) OR (TRANSACOES.MODELO = :MODELO4))');
    QRel.Sql.Add('ORDER BY TRANSACOES.NUM_DOC');

    QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
    QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    QRel.ParamByName('CD_CPR').AsString       := '01';
    // QRel.ParamByName('DEPTO').AsString        := '07';
    QRel.ParamByName('BALANCO').AsString      := 'AGRUPADO';
    QRel.ParamByName('MODELO1').AsString      := '01';
    QRel.ParamByName('MODELO2').AsString      := '1B';
    QRel.ParamByName('MODELO3').AsString      := '04';
    QRel.ParamByName('MODELO4').AsString      := '55';

    QRel.Prepare;
    QRel.Open;

    QRel.First;
    while not QRel.Eof do
    begin
      QItens.Sql.Clear;
      QItens.Sql.Add('SELECT CFOP, ALIQUOTA_ICMS, SUM(BASE_CALC_ICMS) BASE_CALC_ICMS, ' +
                     'SUM(VALOR_ICMS) VALOR_ICMS, SUM(VALOR_ICMS_ST) VALOR_ICMS_ST, SUM(VR_TOTAL + VALOR_ICMS_ST + VR_FRETE + VR_ACRESCIMO + VR_IPI - DESC_RODAPE) VR_TOTAL, SUM(VALOR_ISENTO) VALOR_ISENTO, SUM(VALOR_OUTROS - DESC_RODAPE) VALOR_OUTROS');
      QItens.Sql.Add('FROM TRANSITENS');
      QItens.Sql.Add('WHERE');
      QItens.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
      QItens.Sql.Add('GROUP BY CFOP, ALIQUOTA_ICMS');

      QItens.ParamByName('TRANSACAO_ID').AsInteger := QRel.FieldByName('TRANSACAO_ID').AsInteger;

      QItens.Prepare;
      QItens.Open;

      QItens.First;
      while not QItens.Eof do
      begin
        if Table_Temp.FindKey(['SAÍDAS', QItens.FieldByName('CFOP').AsString]) then
          Table_Temp.Edit
        else
          Table_Temp.Append;

        Table_Temp.FieldByName('SUB_TIT').AsString      := 'SAÍDAS';
        Table_Temp.FieldByName('CFOP').AsString         := QItens.FieldByName('CFOP').AsString;
        Table_Temp.FieldByName('CONTABIL').AsFloat      := Table_Temp.FieldByName('CONTABIL').AsFloat + QItens.FieldByName('VR_TOTAL').AsFloat;
        Table_Temp.FieldByName('BASE_CALCULO').AsFloat  := Table_Temp.FieldByName('BASE_CALCULO').AsFloat + QItens.FieldByName('BASE_CALC_ICMS').AsFloat;
        Table_Temp.FieldByName('IMP_CREDITADO').AsFloat := Table_Temp.FieldByName('IMP_CREDITADO').AsFloat + QItens.FieldByName('VALOR_ICMS').AsFloat;
        Table_Temp.FieldByName('ISENTAS').AsFloat       := Table_Temp.FieldByName('ISENTAS').AsFloat + QItens.FieldByName('VALOR_ISENTO').AsFloat;
        Table_Temp.FieldByName('OUTRAS').AsFloat        := Table_Temp.FieldByName('OUTRAS').AsFloat + QItens.FieldByName('VALOR_OUTROS').AsFloat;
        Table_Temp.Post;

        Application.ProcessMessages;
        QItens.Next;
      end;

      Application.ProcessMessages;
      QRel.Next;
    end;

     // Venda NFc-e

    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT TRANSACOES.* ');
    QRel.Sql.Add('FROM COMPL_NFCEFISCAL ');
    QRel.Sql.Add('INNER JOIN TRANSACOES');
    QRel.Sql.Add('ON (COMPL_NFCEFISCAL.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(TRANSACOES.DT_SPED BETWEEN :DT_INICIAL AND :DT_FINAL)');
    QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
    QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
    QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :CD_CPR)');
   // QRel.Sql.Add('AND (TRANSACOES.DEPTO = :DEPTO)');
   // QRel.Sql.Add('AND (TRANSACAO_ID NOT IN(SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');
    QRel.Sql.Add('AND ((TRANSACOES.BALANCO <> :BALANCO) OR (TRANSACOES.BALANCO IS NULL))');
    QRel.Sql.Add('AND (TRANSACOES.MODELO = :MODELO1) ');
    QRel.Sql.Add('ORDER BY TRANSACOES.NUM_DOC');

    QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
    QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    QRel.ParamByName('CD_CPR').AsString       := '01';
  //  QRel.ParamByName('DEPTO').AsString        := '07';
    QRel.ParamByName('BALANCO').AsString      := 'AGRUPADO';
    QRel.ParamByName('MODELO1').AsString      := '65';


    QRel.Prepare;
    QRel.Open;

    QRel.First;
    while not QRel.Eof do
    begin
      QItens.Sql.Clear;
      QItens.Sql.Add('SELECT CFOP, ALIQUOTA_ICMS, SUM(BASE_CALC_ICMS) BASE_CALC_ICMS, ' +
                     'SUM(VALOR_ICMS) VALOR_ICMS, SUM(VALOR_ICMS_ST) VALOR_ICMS_ST, SUM(VR_TOTAL + VALOR_ICMS_ST + VR_FRETE + VR_ACRESCIMO + VR_IPI - DESC_RODAPE) VR_TOTAL, SUM(VALOR_ISENTO) VALOR_ISENTO, SUM(VALOR_OUTROS - DESC_RODAPE) VALOR_OUTROS');
      QItens.Sql.Add('FROM TRANSITENS');
      QItens.Sql.Add('WHERE');
      QItens.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
      QItens.Sql.Add('GROUP BY CFOP, ALIQUOTA_ICMS');

      QItens.ParamByName('TRANSACAO_ID').AsInteger := QRel.FieldByName('TRANSACAO_ID').AsInteger;

      QItens.Prepare;
      QItens.Open;

      QItens.First;
      while not QItens.Eof do
      begin
        if Table_Temp.FindKey(['SAÍDAS', QItens.FieldByName('CFOP').AsString]) then
          Table_Temp.Edit
        else
          Table_Temp.Append;

        Table_Temp.FieldByName('SUB_TIT').AsString      := 'SAÍDAS';
        Table_Temp.FieldByName('CFOP').AsString         := QItens.FieldByName('CFOP').AsString;
        Table_Temp.FieldByName('CONTABIL').AsFloat      := Table_Temp.FieldByName('CONTABIL').AsFloat + QItens.FieldByName('VR_TOTAL').AsFloat;
        Table_Temp.FieldByName('BASE_CALCULO').AsFloat  := Table_Temp.FieldByName('BASE_CALCULO').AsFloat + QItens.FieldByName('BASE_CALC_ICMS').AsFloat;
        Table_Temp.FieldByName('IMP_CREDITADO').AsFloat := Table_Temp.FieldByName('IMP_CREDITADO').AsFloat + QItens.FieldByName('VALOR_ICMS').AsFloat;
        Table_Temp.FieldByName('ISENTAS').AsFloat       := Table_Temp.FieldByName('ISENTAS').AsFloat + QItens.FieldByName('VALOR_ISENTO').AsFloat;
        Table_Temp.FieldByName('OUTRAS').AsFloat        := Table_Temp.FieldByName('OUTRAS').AsFloat + QItens.FieldByName('VALOR_OUTROS').AsFloat;
        Table_Temp.Post;

        Application.ProcessMessages;
        QItens.Next;
      end;

      Application.ProcessMessages;
      QRel.Next;
    end;



    if not Chk_outros.Checked then
    Begin
    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT TRIBUTOS.CFOP,TRIBUTOS.ALIQUOTA_ICMS, SUM(REGISTRO_60A.VALOR_TOTALIZADOR) CONTABIL, SUM(REGISTRO_60A.VALOR_TOTALIZADOR) BASE_CALCULO,');
    QRel.Sql.Add('SUM((REGISTRO_60A.VALOR_TOTALIZADOR * ALIQUOTA_ICMS)/100)VALOR_ICMS');
    QRel.Sql.Add('FROM REGISTRO_60A');
    QRel.Sql.Add('INNER JOIN TRIBUTOS');
    QRel.Sql.Add('ON (TRIBUTOS.SIT_TRIBUTARIA_ECF = REGISTRO_60A.SIT_TRIBUTARIA)');
    QRel.Sql.Add('INNER JOIN LICENCA_IF');
    QRel.Sql.Add('ON (REGISTRO_60A.NUM_SERIE = LICENCA_IF.SERIAL)');
    QRel.Sql.Add('INNER JOIN EMPRESAS');
    QRel.Sql.Add('ON (LICENCA_IF.CNPJ = EMPRESAS.CNPJ)');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(REGISTRO_60A.DT_EMISSAO BETWEEN :DT_INICIAL AND :DT_FINAL)');
    QRel.Sql.Add('AND (REGISTRO_60A.SIT_TRIBUTARIA <> :SIT_TRIBUTARIA)');
    QRel.Sql.Add('AND (REGISTRO_60A.SIT_TRIBUTARIA <> :SIT_TRIBUTARIA1)');
    QRel.Sql.Add('GROUP BY TRIBUTOS.CFOP,TRIBUTOS.ALIQUOTA_ICMS');

    QRel.ParamByName('DT_INICIAL').AsDateTime    := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime      := Dtmai.Date;
    QRel.ParamByName('SIT_TRIBUTARIA').AsString  := 'CANC';
    QRel.ParamByName('SIT_TRIBUTARIA1').AsString := 'DESC';

    QRel.Prepare;
    QRel.Open;
    QRel.First;

    while not QRel.Eof do
      begin
        if Table_Temp.FindKey(['SAÍDAS', QRel.FieldByName('CFOP').AsString]) then
          Table_Temp.Edit
        else
          Table_Temp.Append;

        Table_Temp.FieldByName('SUB_TIT').AsString      := 'SAÍDAS';
        Table_Temp.FieldByName('CFOP').AsString         := QRel.FieldByName('CFOP').AsString;
        Table_Temp.FieldByName('CONTABIL').AsFloat      := Table_Temp.FieldByName('CONTABIL').AsFloat + QRel.FieldByName('CONTABIL').AsFloat;
        Table_Temp.FieldByName('BASE_CALCULO').AsFloat  := Table_Temp.FieldByName('BASE_CALCULO').AsFloat + QRel.FieldByName('BASE_CALCULO').AsFloat;
        Table_Temp.FieldByName('IMP_CREDITADO').AsFloat := Table_Temp.FieldByName('IMP_CREDITADO').AsFloat + QRel.FieldByName('VALOR_ICMS').AsFloat;
        Table_Temp.FieldByName('ISENTAS').AsFloat       := Table_Temp.FieldByName('ISENTAS').AsFloat + 0;
        //Table_Temp.FieldByName('OUTRAS').AsFloat        := Table_Temp.FieldByName('OUTRAS').AsFloat + QRel.FieldByName('VALOR_OUTROS').AsFloat;
        Table_Temp.Post;

        Application.ProcessMessages;
        QRel.Next;
      end;
    End
    Else
    Begin
    //ALTERADO 28/01/14  INCLUIR VALOR OUTROS NAS VENDAS ECF

    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT TRANSACOES.TRANSACAO_ID, SUM(REGISTRO_60I.BASE_CALC_ICMS)');
    QRel.Sql.Add('FROM REGISTRO_60I');
    QRel.Sql.Add('INNER JOIN PRODUTOS');
    QRel.Sql.Add('ON (REGISTRO_60I.COD_PRODUTO = PRODUTOS.COD_BARRA)');
    QRel.Sql.Add('INNER JOIN TRIBUTOS');
    QRel.Sql.Add('ON (PRODUTOS.TRIBUTO_ID = TRIBUTOS.TRIBUTO_ID)');
    QRel.Sql.Add('INNER JOIN LICENCA_IF');
    QRel.Sql.Add('ON (REGISTRO_60I.NUM_SERIE = LICENCA_IF.SERIAL)');
    QRel.Sql.Add('INNER JOIN EMPRESAS');
    QRel.Sql.Add('ON (LICENCA_IF.CNPJ = EMPRESAS.CNPJ)');
    QRel.Sql.Add('INNER JOIN TRANSACOES');
    QRel.Sql.Add('ON (TRANSACOES.NUM_DOC =  ' + #39 + '0' + #39 + ' ||REGISTRO_60I.NUM_ORDEM) AND ((TRANSACOES.MODELO =:MODELO AND TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)) ');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(REGISTRO_60I.DT_EMISSAO BETWEEN :DT_INICIAL AND :DT_FINAL)');
    QRel.Sql.Add('AND (REGISTRO_60I.SIT_TRIBUTARIA <> :SIT_TRIBUTARIA)');
    QRel.Sql.Add('AND (PRODUTOS.EMPRESA_ID = :EMPRESA_ID)');
    QRel.Sql.Add('GROUP BY TRANSACOES.TRANSACAO_ID');

    QRel.ParamByName('DT_INICIAL').AsDateTime   := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime     := Dtmai.Date;
    QRel.ParamByName('SIT_TRIBUTARIA').AsString := 'CANC';
    QRel.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    QRel.ParamByName('MODELO').AsString         := '2D';


    QRel.Prepare;
    QRel.Open;

    QRel.First;

     while not QRel.Eof do
      begin
        QItens.Sql.Clear;
        QItens.Sql.Add('SELECT CFOP, ALIQUOTA_ICMS, SUM(BASE_CALC_ICMS) BASE_CALC_ICMS, ' +
                       'SUM(VALOR_ICMS) VALOR_ICMS, SUM(VALOR_ICMS_ST) VALOR_ICMS_ST, SUM(VR_TOTAL + VALOR_ICMS_ST + VR_FRETE + VR_ACRESCIMO + VR_IPI + VR_FCPST  + VR_FCP - DESC_RODAPE - VALOR_ICMS_DESON)  VR_TOTAL, ' +
                       'SUM(VALOR_ISENTO) VALOR_ISENTO, SUM(VALOR_OUTROS - DESC_RODAPE) VALOR_OUTROS');
        QItens.Sql.Add('FROM TRANSITENS');
        QItens.Sql.Add('WHERE');
        QItens.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
        QItens.Sql.Add('GROUP BY CFOP, ALIQUOTA_ICMS');

        QItens.ParamByName('TRANSACAO_ID').AsInteger := QRel.FieldByName('TRANSACAO_ID').AsInteger;

        QItens.Prepare;
        QItens.Open;

        QItens.First;
        while not QItens.Eof do
        begin
          if Table_Temp.FindKey(['SAÍDAS', QItens.FieldByName('CFOP').AsString]) then
            Table_Temp.Edit
          else
            Table_Temp.Append;

          Table_Temp.FieldByName('SUB_TIT').AsString      := 'SAÍDAS';
          Table_Temp.FieldByName('CFOP').AsString         := QItens.FieldByName('CFOP').AsString;
          Table_Temp.FieldByName('CONTABIL').AsFloat      := Table_Temp.FieldByName('CONTABIL').AsFloat + QItens.FieldByName('VR_TOTAL').AsFloat;
          Table_Temp.FieldByName('BASE_CALCULO').AsFloat  := Table_Temp.FieldByName('BASE_CALCULO').AsFloat + QItens.FieldByName('BASE_CALC_ICMS').AsFloat;
          Table_Temp.FieldByName('IMP_CREDITADO').AsFloat := Table_Temp.FieldByName('IMP_CREDITADO').AsFloat + QItens.FieldByName('VALOR_ICMS').AsFloat;
          Table_Temp.FieldByName('ISENTAS').AsFloat       := Table_Temp.FieldByName('ISENTAS').AsFloat + QItens.FieldByName('VALOR_ISENTO').AsFloat;
          Table_Temp.FieldByName('OUTRAS').AsFloat        := Table_Temp.FieldByName('OUTRAS').AsFloat + QItens.FieldByName('VALOR_OUTROS').AsFloat;

          Table_Temp.Post;

          Application.ProcessMessages;
          QItens.Next;
        end;

        Application.ProcessMessages;
        QRel.Next;
      end;
    End;

    QRLabel25.Caption := Dtmen.Text + ' a ' + Dtmai.Text;

    Apuracao_ICMS.PreviewModal;
  finally
    Table_Temp.IndexName := '';
    Table_Temp.Close;

    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;

procedure TFrmRegistro_Apuracao_ICMS.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRegistro_Apuracao_ICMS.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmRegistro_Apuracao_ICMS.DtmenKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    //Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmRegistro_Apuracao_ICMS.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmRegistro_Apuracao_ICMS.FormCreate(Sender: TObject);
begin
  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);
end;

procedure TFrmRegistro_Apuracao_ICMS.QRBand3AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  Apuracao_ICMS.NewPage;
end;

procedure TFrmRegistro_Apuracao_ICMS.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if Table_Temp.FieldByName('SUB_TIT').AsString = 'ENTRADAS' then
    QRLabel7.Caption := 'E N T R A D A S'
  else
  Begin
    QRLabel7.Caption := 'S A Í D A S';
    QRLabel17.Caption := 'Imp. Debitado';
  End;
end;

end.
