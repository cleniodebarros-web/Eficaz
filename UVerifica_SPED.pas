unit UVerifica_SPED;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, RxToolEdit,
  Vcl.ComCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, System.RegularExpressions,
  FireDAC.Comp.Client, StrUtils, RDprint, Vcl.Printers, Math, System.Types;

type
  TFrmVerificaSPED = class(TForm)
    Dtmen: TDateEdit;
    Dtmai: TDateEdit;
    Label2: TLabel;
    ProgressBar: TProgressBar;
    Label3: TLabel;
    Iquery: TFDQuery;
    Qempresa: TFDQuery;
    Qsearch: TFDQuery;
    QRel: TFDQuery;
    lb_status: TLabel;
    RDprint1: TRDprint;
    CheckBox1: TCheckBox;
    Btn_analisar_notas: TButton;
    Qconta: TFDQuery;
    Qtabela: TFDQuery;
    procedure RDprint1NewPage(Sender: TObject; Pagina: Integer);
    procedure Btn_analisar_notasClick(Sender: TObject);
  private
    procedure RecalcularPISCOFINS;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmVerificaSPED: TFrmVerificaSPED;

  procedure Verifica(Dt_Inicial, Dt_Final: TDateTime);

implementation

uses
   UPrincipal, UData;


var Linha, Pagina : Integer;
    Contador: Integer;
    Erros_Cabecalho: Array of String;
    Erros_Itens: Array of String;
    dt_consulta, chave_nfe_compl_nfiscal : string;
    status_erro, status_erro_itens : Boolean;


const
   modelo_nfe_compra : array[0..4] of string = ('55', '99', '01', '04', '1B');
   lista_cst_pis_entrada : array[0..22] of string = ('50', '51', '52', '53', '54', '55', '56', '60', '61', '62', '63', '64', '65', '66',
                                                    '67', '70', '71', '72', '73', '74', '75', '98', '99');

   lista_cst_pis_entrada_nao_tributada : array[0..7] of string  = ('70', '71', '72', '73', '74', '75', '98', '99');
   lista_cst_pis_entrada_tributada     : array[0..14] of string = ('50', '51', '52', '53', '54', '55', '56', '60', '61', '62', '63', '64', '65', '66','67');

{$R *.dfm}


procedure TFrmVerificaSPED.RecalcularPISCOFINS;
var
Vr_Pis, Vr_Cofins, Vr_Pis_St, Vr_Cofins_St : Real;
begin
    IQuery.Sql.Clear;
    IQuery.Sql.Add('ALTER TABLE PRODUTOS DISABLE TRIGGER PRODUTOS_UP');

    IQuery.Prepare;
    IQuery.ExecSql;

   lb_status.Visible := True;
   lb_status.Caption:= 'Recalculando Pis/Cofins';


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
      Begin  //Alterado dia 24/03/14 Regivaldo
        //or (QTabela.FieldByName('CFOP').AsString = '5927') or (QTabela.FieldByName('CFOP').AsString = '6927') or (QTabela.FieldByName('CFOP').AsString = '5929') then
        IQuery.Sql.Add('UPDATE TRANSITENS SET CST_PIS = :CST_PIS, CST_COFINS = :CST_COFINS, BASE_CALC_PIS = 0, ' +
                       'ALIQUOTA_PIS = :ALIQUOTA_PIS, VR_PIS = 0, BASE_CALC_COFINS = 0, ALIQUOTA_COFINS = :ALIQUOTA_COFINS, VR_COFINS = 0');

        if QRel.FieldByName('CFOP_SAIDA').AsString <> '' then
        IQuery.Sql.Add(',NAT_REC = :NAT_REC');

      End
      else
      begin
        IQuery.Sql.Add('UPDATE TRANSITENS SET CST_PIS = :CST_PIS, CST_COFINS = :CST_COFINS, BASE_CALC_PIS = (VR_TOTAL   - DESC_RODAPE ), ' +
                       'ALIQUOTA_PIS = :ALIQUOTA_PIS, VR_PIS = (((VR_TOTAL  - DESC_RODAPE ) * :ALIQUOTA_PIS) / 100), ' +
                       'BASE_CALC_COFINS = (VR_TOTAL  - DESC_RODAPE), ' +
                       'ALIQUOTA_COFINS = :ALIQUOTA_COFINS, VR_COFINS = (((VR_TOTAL - DESC_RODAPE) * :ALIQUOTA_COFINS) / 100)');

        if QRel.FieldByName('CFOP_SAIDA').AsString <> '' then
        IQuery.Sql.Add(',NAT_REC = :NAT_REC');


      end;



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


      IQuery.ParamByName('TRANSACAO_ID').AsInteger := QTabela.FieldByName('TRANSACAO_ID').AsInteger;
      IQuery.ParamByName('PRODUTO_ID').AsInteger   := QRel.FieldByName('PRODUTO_ID').AsInteger;

      IQuery.Prepare;
      IQuery.ExecSql;



      if (QRel.FieldByName('PIS_SAI').AsFloat = 0) AND (QRel.FieldByName('TP_PROD_SERV').AsString = 'P') then
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
    label3.Caption:= 'Recalculando Pis/Cofins(Saídas/Dev.Compras): ' + IntToStr(QTabela.FieldByName('TRANSACAO_ID').AsInteger);
    QTabela.Next;
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


        if (QRel.FieldByName('CFOP_ENTRADA').AsString <> '') OR ((QRel.FieldByName('SRV_CST_PIS_ENTR').AsString <> '50') AND (QRel.FieldByName('TP_PROD_SERV').AsString = 'S'))  then

        IQuery.Sql.Add('UPDATE TRANSITENS SET CST_PIS = :CST_PIS, CST_COFINS = :CST_COFINS, BASE_CALC_PIS = 0, ' +
                       'ALIQUOTA_PIS = :ALIQUOTA_PIS, VR_PIS = 0, BASE_CALC_COFINS = 0, ALIQUOTA_COFINS = :ALIQUOTA_COFINS, VR_COFINS = 0')
        else
        IQuery.Sql.Add('UPDATE TRANSITENS SET CST_PIS = :CST_PIS, CST_COFINS = :CST_COFINS, BASE_CALC_PIS = (VR_TOTAL  - DESC_RODAPE), ' +
                       'ALIQUOTA_PIS = :ALIQUOTA_PIS, VR_PIS = (((VR_TOTAL - DESC_RODAPE) * :ALIQUOTA_PIS) / 100), ' +
                       'BASE_CALC_COFINS = (VR_TOTAL  - DESC_RODAPE), ALIQUOTA_COFINS = :ALIQUOTA_COFINS, ' +
                       'VR_COFINS = (((VR_TOTAL  - DESC_RODAPE) * :ALIQUOTA_COFINS) / 100)');



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
    lb_status.Caption:= 'Recalculando Pis/Cofins(Compras/Dev.Saídas): ' + IntToStr(QTabela.FieldByName('TRANSACAO_ID').AsInteger);
    end;
    IQuery.Sql.Clear;
    IQuery.Sql.Add('ALTER TABLE PRODUTOS ENABLE TRIGGER PRODUTOS_UP');

    IQuery.Prepare;
    IQuery.ExecSql;


end;


procedure Verifica(Dt_Inicial, Dt_Final: TDateTime);
begin

  Application.CreateForm(TFrmVerificaSPED, FrmVerificaSPED);
  try
    FrmVerificaSPED.Dtmen.Date := Dt_Inicial;
    FrmVerificaSPED.Dtmai.Date := Dt_Final;

    FrmVerificaSPED.ShowModal;
  finally
    FrmVerificaSPED.Release;
  end;

end;




procedure TFrmVerificaSPED.Btn_analisar_notasClick(Sender: TObject);
var Ponteiro : Real;
    Registro : Integer;
    RegularExpression : TRegEx;
    Match : TMatch;
    Response, Total_Registros: Integer;
    I, Marcador: Integer;
    StringSeparada : TStringDynArray;
    soma_vr_ipi_itens,
    soma_base_calc_icms_normal,
    soma_valor_icms_normal, soma_base_icms_st, soma_valor_icm_st,
    soma_desconto_rodape, soma_vr_acrescimo, soma_vr_fcpst, soma_vr_icms_deson,
    soma_vr_fcp, soma_vr_frete, cst_pis_entr_produto,
    pis_entr_produto, cst_cofins_entr_produto, cofins_entr_produto: Real;
begin
          try
                Btn_analisar_notas.Enabled := False;

                RecalcularPISCOFINS();


                Qempresa.Close;
                Qempresa.ParamByName('EMPRESA_ID').AsInteger := FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger;
                Qempresa.Prepare;
                Qempresa.Open();


                Iquery.Sql.Clear();
                Iquery.Sql.Add('SELECT');
                Iquery.Sql.Add('TRANSACAO_ID, DT_TRANS, DT_SPED, FORNECEDOR_ID, NUM_DOC, OBSERVACAO, ');
                Iquery.Sql.Add('ALIQ_ICMS_SIMPLES, VL_ICMS_SIMPLES, MODELO, CHAVE_NFE, SUB_SERIE, ');
                Iquery.Sql.Add('VR_IPI, BASE_ICMS_NORMAL, VR_ICMS_NORMAL, BASE_ICMS_ST, VR_ICMS_ST, ');
                Iquery.Sql.Add('VR_DESCONTO, VR_ACRESCIMO, VR_FCPST, VR_ICMS_DESON, VR_FCP, VR_FRETE ');
                Iquery.Sql.Add('FROM');
                Iquery.Sql.Add('TRANSACOES');
                Iquery.Sql.Add('WHERE');

                if (Qempresa.FieldByName('CRT').AsString = '3') and (Qempresa.FieldByName('CRT').AsString = '4') then
                   Iquery.Sql.Add('DT_SPED BETWEEN :DT_INICIAL AND :DT_FINAL')
                else
                   Iquery.Sql.Add('DT_ENT_SAI BETWEEN :DT_INICIAL AND :DT_FINAL');

                Iquery.Sql.Add('AND CONDUTA =:CONDUTA ');
                Iquery.Sql.Add('AND DEPTO =:DEPARTAMENTO ');
                Iquery.Sql.Add('AND TPCTB =:TPCTB ');
                Iquery.Sql.Add('AND EMPRESA_ID =:EMPRESA_ID ');
                Iquery.Sql.Add('AND TRANSACAO_ID <> 0');
                Iquery.Sql.Add('ORDER BY');
                Iquery.Sql.Add('TRANSACAO_ID');

                Iquery.ParamByName('DT_INICIAL').AsDate     := Dtmen.Date;
                Iquery.ParamByName('DT_FINAL').AsDate       := Dtmai.Date;
                Iquery.ParamByName('CONDUTA').AsString      := '02';
                Iquery.ParamByName('DEPARTAMENTO').AsString := '07';
                Iquery.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
                Iquery.ParamByName('EMPRESA_ID').AsInteger  := FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger;

                Iquery.Prepare();
                Iquery.Open();


              if not Iquery.isEmpty then
              begin

                    status_erro          := False;
                    status_erro_itens    := False;
                    Label2.Visible       := True;
                    lb_status.Visible    := True;
                    Label3.Visible       := True;
                    Contador             := 0;


                    if CheckBox1.Checked = True then
                    Begin
                       RDprint1.Impressora := HP;
                       RDprint1.FonteTamanhoPadrao   := S10cpp;
                    End;

                    RDprint1.TamanhoQteColunas       := 100;
                    RDprint1.OpcoesPreview.Preview   := True;
                    RDprint1.MostrarProgresso        := True;
                    RDprint1.Acentuacao              := SemAcento;
                    RDprint1.TamanhoQteLinhas        := 1;
                    RDprint1.Orientacao              := poLandscape;
                    RDprint1.Abrir;


                   Iquery.Last;
                   Total_Registros := Iquery.RecordCount;

                   Iquery.First;
                   while not Iquery.Eof do
                   begin
                        status_erro       := False;
                        status_erro_itens := False;


                        try
                                // Data sped menor que dt_trans
                                if ( Copy(Qempresa.FieldByName('CRT').AsString, 1, 1) = '3') or (Copy(Qempresa.FieldByName('CRT').AsString, 1, 1) = '4') then
                                begin
                                  if (Iquery.FieldByName('DT_TRANS').AsDateTime >  Iquery.FieldByName('DT_SPED').AsDateTime) then
                                  begin
                                       status_erro := True;
                                       SetLength(Erros_Cabecalho, Contador + 1 );
                                       Erros_Cabecalho[Contador] := 'Data SPED menor que a data da transacao';
                                       Contador := Contador + 1;
                                  end;
                                end;


                                // Nota sem fornecedor
                                if Iquery.FieldByName('FORNECEDOR_ID').AsInteger = 0 then
                                begin
                                   status_erro := True;
                                   SetLength(Erros_Cabecalho, Contador + 1 );
                                   Erros_Cabecalho[Contador]:= 'Nota sem fornecedor';
                                   Contador := Contador + 1;
                                end;

                                // Número do documento inválido
                                RegularExpression.Create('^[0-9]*$');
                                Match := RegularExpression.Match(Iquery.FieldByName('NUM_DOC').AsString);

                                if not Match.Success then
                                begin
                                   status_erro := True;
                                   SetLength(Erros_Cabecalho, Contador + 1 );
                                   Erros_Cabecalho[Contador]:= 'Número do documento inválido. Aceito apenas números.';
                                   Contador := Contador + 1;
                                end;


                                // NFE marcada como simples nacional mas sem aliq e valor icms
                                if ( Copy(Qempresa.FieldByName('CRT').AsString, 1, 1) = '3') or (Copy(Qempresa.FieldByName('CRT').AsString, 1, 1) = '4') then
                                begin

                                  Response := pos('Simples Nacional', Iquery.FieldByName('OBSERVACAO').AsString);

                                  if Response = 1 then
                                  begin
                                    if (Iquery.FieldByName('VL_ICMS_SIMPLES').AsFloat <= 0) or (Iquery.FieldByName('VL_ICMS_SIMPLES').AsFloat <= 0) then
                                    begin
                                       status_erro := True;
                                       SetLength(Erros_Cabecalho, Contador + 1 );
                                       Erros_Cabecalho[Contador]:= 'NFe marcada como Simples Nacional mas sem aliquota e valor de ICMS';
                                       Contador := Contador + 1;
                                    end;
                                  end;
                                end;


                                //NFe modelo 55 sem chave de acesso
                                if AllTrim(Iquery.FieldByName('SUB_SERIE').AsString) = '' then
                                begin
                                    if (Iquery.FieldByName('MODELO').AsString = '55') and (Iquery.FieldByName('CHAVE_NFE').AsString = '') then
                                    begin
                                       status_erro := True;
                                       SetLength(Erros_Cabecalho, Contador + 1 );
                                       Erros_Cabecalho[Contador]:= 'NFe modelo 55 sem chave de acesso';
                                       Contador := Contador + 1;
                                    end;

                                end
                                else if  AllTrim(Iquery.FieldByName('SUB_SERIE').AsString) = 'P' then
                                begin

                                    Qsearch.SQL.Clear;
                                    Qsearch.SQL.Add('SELECT CHAVE_NFE FROM COMPL_NFISCAL WHERE TRANSACAO_ID =:TRANSACAO_ID');
                                    Qsearch.ParamByName('TRANSACAO_ID').AsInteger := Iquery.FieldByName('TRANSACAO_ID').AsInteger;
                                    Qsearch.Prepare;
                                    Qsearch.Open();

                                    QRel.SQL.Clear;
                                    QRel.SQL.Add('SELECT CHAVE_NFE FROM NOTAS_CANCELADAS WHERE TRANSACAO_ID =:TRANSACAO_ID');
                                    QRel.ParamByName('TRANSACAO_ID').AsInteger := Iquery.FieldByName('TRANSACAO_ID').AsInteger;
                                    QRel.Prepare;
                                    QRel.Open();

                                    if (Qsearch.IsEmpty) and (QRel.IsEmpty) then
                                    begin
                                       status_erro := True;
                                       status_erro := True;
                                       SetLength(Erros_Cabecalho, Contador + 1 );
                                       Erros_Cabecalho[Contador]:= 'NFe emissão própria número:'+ Iquery.FieldByName('NUM_DOC').AsString +', transacao_id: '
                                                                   + Iquery.FieldByName('TRANSACAO_ID').AsString +
                                                                   ' não possui compl_nfiscal, nem notas_canceladas!';
                                       Contador := Contador + 1;
                                    end
                                    else if ( not Qsearch.IsEmpty) and ( not QRel.IsEmpty) then
                                    begin
                                       status_erro := True;
                                       status_erro := True;
                                       SetLength(Erros_Cabecalho, Contador + 1 );
                                       Erros_Cabecalho[Contador]:= 'NFe emissão própria número:'+ Iquery.FieldByName('NUM_DOC').AsString +', transacao_id: '
                                                                   + Iquery.FieldByName('TRANSACAO_ID').AsString +
                                                                   ' possui compl_nfiscal e notas_canceladas!';
                                       Contador := Contador + 1;
                                    end
                                    else if (not Qsearch.IsEmpty) and (QRel.IsEmpty) then
                                    begin
                                        chave_nfe_compl_nfiscal := Qsearch.FieldByName('CHAVE_NFE').AsString;
                                    end
                                    else
                                       chave_nfe_compl_nfiscal := Qrel.FieldByName('CHAVE_NFE').AsString;

                                      //Chave NFe Compl_Nfiscal vazia
                                      if chave_nfe_compl_nfiscal = '' then
                                      begin
                                        status_erro := True;
                                        SetLength(Erros_Cabecalho, Contador + 1);
                                        Erros_Cabecalho[Contador] := 'Chave NFe Compl_Nfiscal vazia';
                                        Contador := Contador + 1;
                                      end;
                                end;


                                // Modelo da nota diferente de 55, 99, 01, 04 ou 1B
                                if not MatchStr(Iquery.FieldByName('MODELO').AsString, modelo_nfe_compra) then
                                begin
                                   status_erro := True;
                                   SetLength(Erros_Cabecalho, Contador + 1);
                                   Erros_Cabecalho[Contador] := 'Modelo da nota diferente de 55, 99, 01, 04 ou 1B';
                                   Contador := Contador + 1;
                                end;


                                if status_erro then
                                begin
                                    RDprint1.ImpF(linha, 01, Iquery.FieldByName('TRANSACAO_ID').AsString, [negrito]);
                                    RDprint1.ImpF(linha, 15, Iquery.FieldByName('NUM_DOC').AsString, [negrito]);
                                    RDprint1.ImpF(linha, 50, Iquery.FieldByName('CHAVE_NFE').AsString, [negrito]);
                                    Inc(Linha);
                                    RDprint1.LinhaH(linha, 01, 100, 0, false);
                                    Inc(Linha);

                                    for I := 0 to (Contador - 1) do
                                    begin

                                        if I = 0 then
                                        begin
                                            RDprint1.ImpF(linha, 5, 'Erros no cabeçalho da nota', [negrito]);
                                            Inc(Linha);
                                            RDprint1.LinhaH(linha, 5, 100, 0, false);
                                            Inc(Linha);
                                        end;

                                        RDprint1.ImpF(linha, 15, IntToStr(I + 1) + ' - ' +  Erros_Cabecalho[I], []);
                                        Inc(Linha);

                                        if linha > 65 then
                                        begin
                                            RDprint1.Novapagina;
                                            Pagina := Pagina + 1;
                                        end;

                                    end;

                                    Inc(Linha);
                                    Inc(Linha);

                                    Contador := 0;
                                end;


                                QRel.SQL.Clear;
                                Qrel.Sql.Add('SELECT PRODUTO_ID, CONTA_ID, CST, DESCRICAO, VR_IPI,');
                                Qrel.Sql.Add('BASE_CALC_ICMS, VALOR_ICMS, BASE_CALC_ST, VALOR_ICMS_ST, DESC_RODAPE,');
                                Qrel.Sql.Add('VR_ACRESCIMO, VR_FCPST, VALOR_ICMS_DESON, TP_PROD_SERV, VR_FCP, VR_FRETE');
                                Qrel.Sql.Add('FROM TRANSITENS WHERE TRANSACAO_ID = :TRANSACAO_ID');

                                QRel.ParamByName('TRANSACAO_ID').AsInteger := Iquery.FieldByName('TRANSACAO_ID').AsInteger;

                                QRel.Prepare;
                                QRel.Open();

                                QRel.First;
                                if not QRel.IsEmpty then
                                begin

                                    soma_vr_ipi_itens          := 0;
                                    soma_base_calc_icms_normal := 0;
                                    soma_valor_icms_normal     := 0;
                                    soma_base_icms_st          := 0;
                                    soma_valor_icm_st          := 0;
                                    soma_desconto_rodape       := 0;
                                    soma_vr_acrescimo          := 0;
                                    soma_vr_fcpst              := 0;
                                    soma_vr_icms_deson         := 0;
                                    soma_vr_fcp                := 0;
                                    soma_vr_frete              := 0;
                                    Marcador                   := 0;
                                    Contador                   := 0;

                                    QRel.First;
                                    while not QRel.Eof do
                                    begin

                                        soma_vr_ipi_itens          :=  soma_vr_ipi_itens  + QRel.FieldByName('VR_IPI').AsFloat;
                                        soma_base_calc_icms_normal :=  soma_base_calc_icms_normal +  QRel.FieldByName('BASE_CALC_ICMS').AsFloat;
                                        soma_valor_icms_normal     :=  soma_valor_icms_normal + QRel.FieldByName('VALOR_ICMS').AsFloat;
                                        soma_base_icms_st          :=  soma_base_icms_st + QRel.FieldByName('BASE_CALC_ST').AsFloat;
                                        soma_valor_icm_st          :=  soma_valor_icm_st + QRel.FieldByName('VALOR_ICMS_ST').AsFloat;
                                        soma_desconto_rodape       :=  soma_desconto_rodape + QRel.FieldByName('DESC_RODAPE').AsFloat;
                                        soma_vr_acrescimo          :=  soma_vr_acrescimo + QRel.FieldByName('VR_ACRESCIMO').AsFloat;
                                        soma_vr_fcpst              :=  soma_vr_fcpst + QRel.FieldByName('VR_FCPST').AsFloat;
                                        soma_vr_icms_deson         :=  soma_vr_icms_deson + QRel.FieldByName('VALOR_ICMS_DESON').AsFloat;
                                        soma_vr_fcp                :=  soma_vr_fcp + QRel.FieldByName('VR_FCP').AsFloat;
                                        soma_vr_frete              :=  soma_vr_frete + QRel.FieldByName('VR_FRETE').AsFloat;


                                       Qsearch.SQL.Clear;
                                       Qsearch.SQL.Add('SELECT CST_PIS_ENTR, PIS_ENTR, CST_COFINS_ENTR, COFINS_ENTR, NCM, COD_GEN FROM PRODUTOS');

                                       if QRel.FieldByName('TP_PROD_SERV').AsString  = 'P' then
                                          Qsearch.SQL.Add('WHERE PRODUTO_ID=:PRODUTO_ID')
                                       else
                                          Qsearch.SQL.Add('WHERE SERVICO_ID=:PRODUTO_ID');


                                       Qsearch.ParamByName('PRODUTO_ID').AsInteger := QRel.FieldByName('PRODUTO_ID').AsInteger;
                                       Qsearch.Prepare;
                                       Qsearch.Open();


                                       try
                                          cst_pis_entr_produto  := Qsearch.FieldByName('CST_PIS_ENTR').AsFloat;
                                       except
                                          cst_pis_entr_produto  := 0;
                                       end;

                                       try
                                           pis_entr_produto     := Qsearch.FieldByName('PIS_ENTR').AsFloat;
                                       except
                                           pis_entr_produto     := 0;
                                       end;

                                       try
                                          cst_cofins_entr_produto := Qsearch.FieldByName('CST_COFINS_ENTR').AsFloat;
                                       except
                                          cst_cofins_entr_produto := 0;
                                       end;


                                       try
                                          cofins_entr_produto     := Qsearch.FieldByName('COFINS_ENTR').AsFloat;
                                       except
                                          cofins_entr_produto     := 0;
                                       end;


                                       if Qsearch.FieldByName('NCM').AsString <> '' then
                                       begin

                                         if ( AllTrim(Qsearch.FieldByName('COD_GEN').AsString) = '') then
                                         begin
                                             status_erro_itens := True;
                                             SetLength(Erros_itens, Contador + 1);
                                             Erros_itens[Contador] := Qrel.FieldByName('DESCRICAO').AsString +  '|' +
                                                                      IntToStr(QRel.FieldByName('PRODUTO_ID').AsInteger) + '|' +
                                                                      'Código do gênero não informado.';
                                             Contador := Contador + 1;
                                         end
                                         else
                                         begin
                                             RegularExpression.Create('^[0-9]*$');
                                             Match := RegularExpression.Match(Qsearch.FieldByName('COD_GEN').AsString);

                                             if not Match.Success then
                                             begin
                                                status_erro_itens := True;
                                                SetLength(Erros_itens, Contador + 1);
                                                Erros_itens[Contador] := Qrel.FieldByName('DESCRICAO').AsString +  '|' +
                                                                         IntToStr(QRel.FieldByName('PRODUTO_ID').AsInteger) + '|' +
                                                                         'Código do gênero fora do padrão (Apenas números são aceitos).';
                                                Contador := Contador + 1;
                                             end;
                                         end;


                                       end;



                                       if (Copy(Qempresa.FieldByName('CRT').AsString, 1,1) = '4') then
                                       begin
                                          if QRel.FieldByName('CONTA_ID').AsInteger <= 0 then
                                          begin
                                             status_erro_itens := True;
                                             SetLength(Erros_itens, Contador + 1);

                                          end
                                          else if QRel.FieldByName('CONTA_ID').AsInteger > 0 then
                                          begin

                                              Qconta.SQL.Clear;
                                              Qconta.SQL.Add('SELECT CONTA_REF, COD_CONTA_CONTABIL FROM TABELAS WHERE');
                                              Qconta.SQL.Add('TABELA_ID =:TABELA_ID AND TIPO_TABELA =:TIPO_TABELA');

                                              Qconta.ParamByName('TABELA_ID').AsString   := QRel.FieldByName('CONTA_ID').AsString;
                                              Qconta.ParamByName('TIPO_TABELA').AsString := '4';


                                             if not Qconta.IsEmpty then
                                             begin
                                                 if (Qconta.FieldByName('CONTA_REF').AsString = '') or (Qconta.FieldByName('COD_CONTA_CONTABIL').AsString = '') then
                                                 begin
                                                     status_erro_itens := True;
                                                     SetLength(Erros_itens, Contador + 1);
                                                     Erros_itens[Contador] := Qrel.FieldByName('DESCRICAO').AsString +  '|' +
                                                                              IntToStr(QRel.FieldByName('PRODUTO_ID').AsInteger) + '|' +
                                                                              'Conta existe mas conta referência ou código da conta não configurados';
                                                     Contador := Contador + 1;
                                                 end;
                                             end;


                                          end;
                                       end;

                                       if AllTrim(QRel.FieldByName('CST').AsString) = '' then
                                       begin
                                          status_erro_itens := True;
                                          SetLength(Erros_itens, Contador + 1);
                                          Erros_itens[Contador] :=  Qrel.FieldByName('DESCRICAO').AsString +  '|' +
                                                                    IntToStr(QRel.FieldByName('PRODUTO_ID').AsInteger) + '|' +
                                                                   'Cst incorreto';
                                          Contador := Contador + 1;
                                       end;



                                        //CST PIS COFINS de entrada do produto inválido
                                        if (Copy(Qempresa.FieldByName('CRT').AsString, 1,1) = '4') then
                                        begin

                                            if (not MatchStr(Qsearch.FieldByName('CST_PIS_ENTR').AsString, lista_cst_pis_entrada))
                                               or (not MatchStr(Qsearch.FieldByName('CST_COFINS_ENTR').AsString, lista_cst_pis_entrada))
                                            then
                                            begin
                                               status_erro_itens := True;
                                               SetLength(Erros_itens, Contador + 1);
                                               Erros_itens[Contador] :=  Qrel.FieldByName('DESCRICAO').AsString +  '|' +
                                                                        IntToStr(QRel.FieldByName('PRODUTO_ID').AsInteger) + '|' +
                                                                       'Cst pis cofins de entrada do produto inválido';
                                               Contador := Contador + 1;
                                            end;

                                        end;


                                        // CST PIS de entrada tributado com alíquota incorreta
                                        if (Copy(Qempresa.FieldByName('CRT').AsString, 1,1) = '4') then
                                        begin
                                            if (MatchStr(Qsearch.FieldByName('CST_PIS_ENTR').AsString, lista_cst_pis_entrada_tributada)) and
                                               (Qsearch.FieldByName('PIS_ENTR').AsFloat <> 1.65)
                                            then
                                            begin
                                               status_erro_itens := True;
                                               SetLength(Erros_itens, Contador + 1);
                                               Erros_itens[Contador] :=  Qrel.FieldByName('DESCRICAO').AsString +  '|' +
                                                                         IntToStr(QRel.FieldByName('PRODUTO_ID').AsInteger) + '|' +
                                                                         'CST PIS de entrada tributado com alíquota incorreta';
                                               Contador := Contador + 1;
                                            end;
                                        end;


                                        // Se a consulta vier vazia, o item não possui cadastro
                                        if Iquery.IsEmpty then
                                        begin
                                               status_erro_itens := True;
                                               SetLength(Erros_itens, Contador + 1);
                                               Erros_itens[Contador] :=  Qrel.FieldByName('DESCRICAO').AsString +  '|' +
                                                                         IntToStr(QRel.FieldByName('PRODUTO_ID').AsInteger) + '|' +
                                                                         'Ítem sem cadastro';
                                               Contador := Contador + 1;
                                        end;

                                        // CST PIS isento com alíquota difernete de 0
                                        if (Copy(Qempresa.FieldByName('CRT').AsString, 1,1) = '4') then
                                        begin
                                            if (MatchStr(Qsearch.FieldByName('CST_PIS_ENTR').AsString, lista_cst_pis_entrada_nao_tributada)) and
                                               (Qsearch.FieldByName('PIS_ENTR').AsFloat <> 0)
                                            then
                                            begin
                                               status_erro_itens := True;
                                               SetLength(Erros_itens, Contador + 1);
                                               Erros_itens[Contador] :=  Qrel.FieldByName('DESCRICAO').AsString +  '|' +
                                                                         IntToStr(QRel.FieldByName('PRODUTO_ID').AsInteger) + '|' +
                                                                         'CST PIS isento com alíquota diferente de 0';
                                               Contador := Contador + 1;
                                            end;
                                        end;

                                        // CST COFINS isento com alíquota difernete de 0
                                        if (Copy(Qempresa.FieldByName('CRT').AsString, 1,1) = '4') then
                                        begin
                                          if (MatchStr(Qsearch.FieldByName('CST_COFINS_ENTR').AsString, lista_cst_pis_entrada_nao_tributada)) and
                                             (Qsearch.FieldByName('cofins_entr').AsFloat <> 0)
                                          then
                                          begin
                                               status_erro_itens := True;
                                               SetLength(Erros_itens, Contador + 1);
                                               Erros_itens[Contador] :=  Qrel.FieldByName('DESCRICAO').AsString +  '|' +
                                                                         IntToStr(QRel.FieldByName('PRODUTO_ID').AsInteger) + '|' +
                                                                         'Cst cofins isento com alíquota difernete de 0';
                                               Contador := Contador + 1;
                                          end;
                                        end;



                                        if status_erro_itens then
                                        begin

                                            if not status_erro then
                                            begin
                                                RDprint1.ImpF(linha, 01, Iquery.FieldByName('TRANSACAO_ID').AsString, [negrito]);
                                                RDprint1.ImpF(linha, 10, Iquery.FieldByName('NUM_DOC').AsString, [negrito]);
                                                RDprint1.ImpF(linha, 50, Iquery.FieldByName('CHAVE_NFE').AsString, [negrito]);
                                                Inc(Linha);
                                                RDprint1.LinhaH(linha, 01, 100, 0, false);
                                                Inc(Linha);

                                                RDprint1.ImpF(linha, 5, 'Erro nos ítens da nota', [negrito]);
                                                Inc(Linha);
                                                RDprint1.LinhaH(linha, 5, 100, 0, false);
                                                Inc(Linha);


                                                if linha > 65 then
                                                begin
                                                   RDprint1.Novapagina;
                                                   Pagina := Pagina + 1;
                                                end;

                                                status_erro := True;
                                            end;

                                            for I := 0 to Contador - 1 do
                                            begin

                                                StringSeparada := SplitString(Erros_itens[I], '|');

                                                if I = 0 then
                                                begin
                                                    RDprint1.ImpF(linha, 5, 'COD.: ' + StringSeparada[1], []);
                                                    RDprint1.ImpF(linha, 20, StringSeparada[0], [negrito]);
                                                    Inc(Linha);
                                                end;

                                                RDprint1.ImpF(linha, 5, IntToStr(I + 1) + ' - ' + StringSeparada[2], []);
                                                Inc(Linha);

                                                if linha > 65 then
                                                begin
                                                    RDprint1.Novapagina;
                                                    Pagina := Pagina + 1;
                                                end;

                                            end;

                                            Inc(linha);

                                        end;


                                        if linha > 65 then
                                        begin
                                            RDprint1.Novapagina;
                                            Pagina := Pagina + 1;
                                        end;


                                        status_erro_itens := False;
                                        Contador := 0;

                                        Application.ProcessMessages;
                                        QRel.Next;
                                    end;


                                    if RoundTo(Iquery.FieldByName('VR_IPI').AsFloat, 2) <>  RoundTo(soma_vr_ipi_itens, 2)  then
                                    begin
                                        status_erro := True;
                                        SetLength(Erros_Cabecalho, Contador + 1);
                                        Erros_Cabecalho[Contador] := 'Valor IPI difere da soma dos itens. | Itens = '+ FormatFloat('#,##0.00', soma_vr_ipi_itens) +' - Rodapé = ' + FormatFloat('#,##0.00', Iquery.FieldByName('VR_IPI').AsFloat);
                                        Contador := Contador + 1;
                                    end;


                                    if RoundTo(Iquery.FieldByName('BASE_ICMS_NORMAL').AsFloat, 2) <> RoundTo(soma_base_calc_icms_normal, 2) then
                                    begin
                                        status_erro := True;
                                        SetLength(Erros_Cabecalho, Contador + 1);
                                        Erros_Cabecalho[Contador] := 'Base ICMS normal difere da soma dos itens. | Itens = '+ FormatFloat('#,##0.00', soma_base_calc_icms_normal) +' - Rodapé = ' + FormatFloat('#,##0.00', Iquery.FieldByName('BASE_ICMS_NORMAL').AsFloat);
                                        Contador := Contador + 1;
                                    end;


                                    if  RoundTo(Iquery.FieldByName('VR_ICMS_NORMAL').AsFloat, 2) <> RoundTo(soma_valor_icms_normal, 2) then
                                    begin
                                        status_erro := True;
                                        SetLength(Erros_Cabecalho, Contador + 1);
                                        Erros_Cabecalho[Contador] := 'Valor ICMS normal difere da soma dos itens. | Itens = '+ FormatFloat('#,##0.00', soma_valor_icms_normal) +' - Rodapé = ' + FormatFloat('#,##0.00', Iquery.FieldByName('VR_ICMS_NORMAL').AsFloat);
                                        Contador := Contador + 1;
                                    end;


                                    if RoundTo(Iquery.FieldByName('BASE_ICMS_ST').AsFloat, 2) <>  RoundTo(soma_base_icms_st, 2)  then
                                    begin
                                        status_erro := True;
                                        SetLength(Erros_Cabecalho, Contador + 1);
                                        Erros_Cabecalho[Contador] := 'Base ICMS ST difere da soma dos itens. | Itens = '+ FormatFloat('#,##0.00', soma_base_icms_st) +' - Rodapé = ' + FormatFloat('#,##0.00', Iquery.FieldByName('BASE_ICMS_ST').AsFloat);
                                        Contador := Contador + 1;
                                    end;



                                    if RoundTo(Iquery.FieldByName('VR_ICMS_ST').AsFloat, 2) <> RoundTo(soma_valor_icm_st, 2)  then
                                    begin
                                        status_erro := True;
                                        SetLength(Erros_Cabecalho, Contador + 1);
                                        Erros_Cabecalho[Contador] := 'Valor ICMS ST difere da soma dos itens. | Itens = '+ FormatFloat('#,##0.00', soma_valor_icm_st) +' | Rodapé = ' + FormatFloat('#,##0.00', Iquery.FieldByName('VR_ICMS_ST').AsFloat);
                                        Contador := Contador + 1;
                                    end;


                                    if RoundTo(Iquery.FieldByName('VR_DESCONTO').AsFloat, 2) <> RoundTo(soma_desconto_rodape, 2) then
                                    begin
                                        status_erro := True;
                                        SetLength(Erros_Cabecalho, Contador + 1);
                                        Erros_Cabecalho[Contador] := 'Desconto rodapé difere da soma dos itens. | Itens = '+ FormatFloat('#,##0.00', soma_desconto_rodape) +' | Rodapé = ' + FormatFloat('#,##0.00', Iquery.FieldByName('VR_DESCONTO').AsFloat);
                                        Contador := Contador + 1;
                                    end;



                                    if RoundTo(Iquery.FieldByName('VR_ACRESCIMO').AsFloat, 2) <> RoundTo(soma_vr_acrescimo, 2) then
                                    begin
                                        status_erro := True;
                                        SetLength(Erros_Cabecalho, Contador + 1);
                                        Erros_Cabecalho[Contador] := 'Valor do acréscimo rodapé difere da soma dos itens. | Itens = '+ FormatFloat('#,##0.00', soma_vr_acrescimo) +' | Rodapé = ' + FormatFloat('#,##0.00', Iquery.FieldByName('VR_ACRESCIMO').AsFloat);
                                        Contador := Contador + 1;
                                    end;



                                    if RoundTo(Iquery.FieldByName('VR_FCPST').AsFloat, 2) <> RoundTo(soma_vr_fcpst, 2) then
                                    begin
                                        status_erro := True;
                                        SetLength(Erros_Cabecalho, Contador + 1);
                                        Erros_Cabecalho[Contador] := 'Valor do FCPST rodapé difere da soma dos itens. | Itens = '+ FormatFloat('#,##0.00', soma_vr_fcpst) +' | Rodapé = ' + FormatFloat('#,##0.00', Iquery.FieldByName('VR_FCPST').AsFloat);
                                        Contador := Contador + 1;
                                    end;


                                    if RoundTo(Iquery.FieldByName('VR_FCPST').AsFloat, 2) <> RoundTo(soma_vr_fcpst, 2) then
                                    begin
                                        status_erro := True;
                                        SetLength(Erros_Cabecalho, Contador + 1);
                                        Erros_Cabecalho[Contador] := 'FCP retido por ST difere da soma dos itens. | Itens = '+ FormatFloat('#,##0.00', soma_vr_fcpst) +' | Rodapé = ' + FormatFloat('#,##0.00', Iquery.FieldByName('VR_FCPST').AsFloat);
                                        Contador := Contador + 1;
                                    end;


                                    if RoundTo(Iquery.FieldByName('VR_ICMS_DESON').AsFloat, 2) <> RoundTo(soma_vr_icms_deson, 2) then
                                    begin
                                        status_erro := True;
                                        SetLength(Erros_Cabecalho, Contador + 1);
                                        Erros_Cabecalho[Contador] := 'ICMS desonerado difere da soma dos itens. | Itens = '+ FormatFloat('#,##0.00', soma_vr_icms_deson) +' | Rodapé = ' + FormatFloat('#,##0.00', Iquery.FieldByName('VR_ICMS_DESON').AsFloat);
                                        Contador := Contador + 1;
                                    end;


                                    if (Iquery.FieldByName('MODELO').AsString <> '99') and (QRel.FieldByName('TP_PROD_SERV').AsString = 'S') then
                                    begin
                                        status_erro := True;
                                        SetLength(Erros_Cabecalho, Contador + 1);
                                        Erros_Cabecalho[Contador] := 'Itens lançados incorretamente. Nota de produtos, porém contém serviços';
                                        Contador := Contador + 1;
                                    end
                                    else if (Iquery.FieldByName('MODELO').AsString = '99') and (QRel.FieldByName('TP_PROD_SERV').AsString = 'P') then
                                    begin
                                        status_erro := True;
                                        SetLength(Erros_Cabecalho, Contador + 1);
                                        Erros_Cabecalho[Contador] := 'Itens lançados incorretamente. Nota de serviço, porém contém produtos.';
                                        Contador := Contador + 1;
                                    end;


                                    if RoundTo(Iquery.FieldByName('VR_FCP').AsFloat, 2) <> RoundTo(soma_vr_fcp, 2) then
                                    begin
                                        status_erro := True;
                                        SetLength(Erros_Cabecalho, Contador + 1);
                                        Erros_Cabecalho[Contador] := 'FCP difere da soma dos itens. | Itens = '+ FormatFloat('#,##0.00', soma_vr_fcp) +' | Rodapé = ' + FormatFloat('#,##0.00', Iquery.FieldByName('VR_FCP').AsFloat);
                                        Contador := Contador + 1;
                                    end;

                                    if RoundTo(Iquery.FieldByName('VR_FRETE').AsFloat, 2) <> RoundTo(soma_vr_frete, 2) then
                                    begin
                                        status_erro := True;
                                        SetLength(Erros_Cabecalho, Contador + 1);
                                        Erros_Cabecalho[Contador] := 'Valor do Frete difere da soma dos itens. | Itens = '+ FormatFloat('#,##0.00', soma_vr_frete) +' | Rodapé = ' + FormatFloat('#,##0.00', Iquery.FieldByName('VR_FRETE').AsFloat);
                                        Contador := Contador + 1;
                                    end;



                                    if status_erro then
                                    begin

                                        for I := 0 to (Contador - 1) do
                                        begin

                                            if I = 0 then
                                            begin
                                                RDprint1.ImpF(linha, 5, 'Erro no rodapé da nota', [negrito]);
                                                Inc(Linha);
                                                RDprint1.LinhaH(linha, 5, 100, 0, false);
                                                Inc(Linha);
                                            end;


                                            RDprint1.ImpF(linha, 5, IntToStr(I + 1) + ' - ' +  Erros_Cabecalho[I], []);
                                            Inc(Linha);

                                            if linha > 65 then
                                            begin
                                                RDprint1.Novapagina;
                                                Pagina := Pagina + 1;
                                            end;

                                        end;

                                        Inc(Linha);
                                        Inc(Linha);

                                        Contador := 0;
                                    end;



                                end
                                else
                                begin
                                    Inc(Linha);
                                    RDprint1.ImpF(linha, 01, Iquery.FieldByName('TRANSACAO_ID').AsString, [negrito]);
                                    RDprint1.ImpF(linha, 10, Iquery.FieldByName('NUM_DOC').AsString, [negrito]);
                                    RDprint1.ImpF(linha, 50, Iquery.FieldByName('CHAVE_NFE').AsString, [negrito]);
                                    Inc(Linha);
                                    RDprint1.LinhaH(linha, 01, 100, 0, false);
                                    Inc(Linha);
                                    RDprint1.ImpF(linha, 15, 'Nota sem ítens', [negrito]);
                                    Inc(Linha);
                                    Inc(Linha);
                                    Inc(Linha);
                                end;




                              Registro := Registro + 1;
                              Ponteiro := ((Registro * 100) / Total_Registros);

                              if Round(Ponteiro) <= 100 then
                              begin
                                  ProgressBar.Position := Round(Ponteiro);
                                  Label3.Caption       := FloatToStr(Round(Ponteiro)) + '%';
                                  Label3.Left          := Trunc(((ProgressBar.Position * ProgressBar.Width)  / 100));
                              end;

                              Label2.Caption := 'Registro ' + IntToStr(Registro) + ' de ' + IntToStr(Total_Registros);
                              lb_status.Caption := 'Analizando documento número: ' + Iquery.FieldByName('NUM_DOC').AsString;


                              status_erro       := False;
                              status_erro_itens := False;


                              Application.ProcessMessages;
                              Iquery.next;

                        except on E: Exception do
                             ShowMessage(e.Message);
                        end;

                   end;

                    RDprint1.TamanhoQteLinhas:= 66;
                    RDprint1.Fechar;

                    Close;

              end
              else
              begin
                  MessageBox(0, 'Sem dados de venda para serem analisados.', 'Eficaz', MB_ICONWARNING or MB_OK);
              end;


              Label2.Visible       := False;
              lb_status.Visible    := False;
              Label3.Visible       := False;
              ProgressBar.Position := 0;
              Label3.Left          := ProgressBar.Left;

              Btn_analisar_notas.Enabled := True;

          finally
            //RDprint1.Destroy;
          end;

end;



procedure TFrmVerificaSPED.RDprint1NewPage(Sender: TObject;
  Pagina: Integer);
begin

      RDprint1.Imp(01, 01, FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString);
      RDprint1.ImpDir(01, (length(FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString)), 100, 'Sistema de Automação de empresas Eficaz', []);
      RDprint1.Imp(02, 01, 'Data/Hora: ' + DateToStr(date) + ' - ' + TimeToStr(now));
      RDprint1.impDir(02, 80, 100, 'Página: ' + IntToStr(Pagina), []);
      RDprint1.impF(03, 36, '*** Análise de Notas ***',[negrito]);
      RDprint1.imp(04, 01, 'Período:'+ datetoStr(dtmen.date) + ' à ' + datetoStr(dtmai.date));
      RDprint1.LinhaH(05,01,100,0,false);
      RDprint1.ImpF(06, 01, 'Código',[negrito]);
      RDprint1.ImpF(06, 10, 'Num. do Documento', [negrito]);
      RDprint1.ImpF(06, 50, 'Chave', [negrito]);

      RDprint1.LinhaH(07,01,100,0,false);
      Linha := 08;


end;

end.
