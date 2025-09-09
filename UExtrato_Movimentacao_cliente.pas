unit UExtrato_Movimentacao_cliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, rxCurrEdit, rxToolEdit, Buttons, DBCtrls,
  DB, IBCustomDataSet, IBQuery, QuickRpt, QRCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,Math, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Async,
  FireDAC.DApt;

type
  TFrmExtrato_movimentacao_cliente = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    Dtmen: TDateEdit;
    Cliente_id: TCurrencyEdit;
    Dtmai: TDateEdit;
    btncliente_id: TSpeedButton;
    DataClientes: TDataSource;
    DBText1: TDBText;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    Chk_Empresas: TCheckBox;
    Extrato: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    QRSysData1: TQRSysData;
    Cabec: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    QRLabel13: TQRLabel;
    QRDBText4: TQRDBText;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRGroup1: TQRGroup;
    QRDBText3: TQRDBText;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRLabel10: TQRLabel;
    QRShape5: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape10: TQRShape;
    QRDBText9: TQRDBText;
    QRLabel18: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape2: TQRShape;
    Fdac_Temp: TFDMemTable;
    QRDBText10: TQRDBText;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape9: TQRShape;
    QRShape3: TQRShape;
    QRLabel2: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr6: TQRExpr;
    QRLabel23: TQRLabel;
    QRExpr7: TQRExpr;
    QRLabel22: TQRLabel;
    QRExpr8: TQRExpr;
    QRLabel21: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel24: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel12: TQRLabel;
    QClientes: TFDQuery;
    QRel: TFDQuery;
    procedure btnRetornaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btncliente_idClick(Sender: TObject);
    procedure Cliente_idKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Cliente_idChange(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure SummaryBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ExtratoBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure DtmenEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SearchBanco;
  end;

var
  FrmExtrato_movimentacao_cliente: TFrmExtrato_movimentacao_cliente;
  Saldo, Sd: Real;

implementation

uses
  UData, UConsulta, UPrincipal;

{$R *.dfm}

procedure TFrmExtrato_movimentacao_cliente.SearchBanco;
begin
  QClientes.Close;
  QClientes.ParamByName('CLIENTE_ID').AsInteger   := StrToInt(cliente_id.Text);
  QClientes.Prepare;
  QClientes.Open;

   if QClientes.IsEmpty then
    btnExecuta.Enabled := False
  else
    btnExecuta.Enabled := True;

end;

procedure TFrmExtrato_movimentacao_cliente.SummaryBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  {QRLabel2.Caption := FormatFloat('#,##0.00', Abs(Saldo));

  if SALDO >= 0 then
    QRLabel2.Left := 521
  else
    QRlabel2.Left := 615;  }
end;

procedure TFrmExtrato_movimentacao_cliente.btncliente_idClick(Sender: TObject);
begin
  try
    cliente_id.Value := GetConsulta('CLIENTES', 0, 0, StrToInt(cliente_id.Text));
  except
    cliente_id.Value := GetConsulta('CLIENTES', 0, 0, 0);
  end;
end;

procedure TFrmExtrato_movimentacao_cliente.btnExecutaClick(Sender: TObject);
var
X: Integer;
Dif,Correc,Multa: Real;
begin
  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    Saldo := 0;
    Sd    := 0;


    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT CLIENTE_ID,CONDUTA,DEPTO,NOME,TRANSACAO_ID, DT_TRANS, DT_VENCIMENTO, NUM_DOC, HISTORICO, VALOR_ORIGEM, JUROS, DESPESAS, DEBITO, CREDITO,ESPECIE,PARCELA_ID');
    QRel.Sql.Add('FROM(');
    QRel.Sql.Add('SELECT TRANSACOES.CLIENTE_ID, CONDUTA, DEPTO, CLIENTES.NOME, TRANSACAO_ID, DT_TRANS,  NULL DT_VENCIMENTO, NUM_DOC, ');
    QRel.Sql.Add('TRANSACOES.HISTORICO, VALOR VALOR_ORIGEM,  0 JUROS,0 DESPESAS, 0 DEBITO , 0 CREDITO,NULL ESPECIE, NULL PARCELA_ID');
    QRel.Sql.Add('FROM TRANSACOES');
    QRel.Sql.Add('INNER JOIN CLIENTES ON CLIENTES.CLIENTE_ID = TRANSACOES.CLIENTE_ID');
    QRel.Sql.Add('WHERE DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL');
    QRel.Sql.Add('AND CONDUTA = :CONDUTA');
    QRel.SQL.Add('AND COND_PAGTO = :COND_PAGTO');

    if Chk_Empresas.Checked  then
    begin
    QRel.Sql.Add('AND (EMPRESA_ID = :EMPRESA_ID)');
    QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    end;

    IF Cliente_id.Value > 0 then
    Begin
     QRel.Sql.Add('AND (TRANSACOES.CLIENTE_ID = :CLIENTE_ID)');
     QRel.ParamByName('CLIENTE_ID').AsInteger := StrToInt(Cliente_id.Text);
    End;

    QRel.Sql.Add('UNION ALL');
    QRel.Sql.Add('SELECT TRANSACOES.CLIENTE_ID, CONDUTA, DEPTO , NOME, TRANSACOES.TRANSACAO_ID, DT_TRANS, DT_VENCIMENTO, NULL NUM_DOC, TRANSACOES.HISTORICO,');
    QRel.Sql.Add('TRANSPARCELAS.VALOR_ORI  VALOR_ORIGEM, VALOR_JUROS JUROS, 0 DESPESAS,CASE WHEN TRANSPARCELAS.BANCO_ID > 0 THEN 0 ELSE TRANSPARCELAS.VALOR END RESTANTE , CASE WHEN (TRANSPARCELAS.PAGTO <> :PAGTO AND VALOR_ORI > 0)');
    QRel.Sql.Add('THEN  ((VALOR_ORI + VALOR_JUROS + VALOR_MULTA + VALOR_DESPESAS) - TRANSPARCELAS.VALOR) ELSE 0 END CREDITO, ESPECIE, TRANSPARCELAS.PARCELA_ID');
    QRel.Sql.Add('FROM TRANSPARCELAS');
    QRel.Sql.Add('INNER JOIN TRANSACOES ON TRANSACOES.TRANSACAO_ID = TRANSPARCELAS.TRANSACAO_ID');
    QRel.Sql.Add('INNER JOIN CLIENTES ON CLIENTES.CLIENTE_ID = TRANSACOES.CLIENTE_ID');
    QRel.Sql.Add('WHERE DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL');
    QRel.Sql.Add('AND (TRANSPARCELAS.TIPO_TRANSACAO = :TIPO_TRANSACAO)');
    QRel.Sql.Add('AND ((TRANSPARCELAS.AGRUPAMENTO = 0) OR (TRANSPARCELAS.AGRUPAMENTO IS NULL))');


    if Chk_Empresas.Checked  then
    begin
    QRel.Sql.Add('AND (EMPRESA_ID = :EMPRESA_ID)');
    QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    end;

    IF Cliente_id.Value > 0 then
    Begin
     QRel.Sql.Add('AND (TRANSACOES.CLIENTE_ID = :CLIENTE_ID)');
     QRel.ParamByName('CLIENTE_ID').AsInteger := StrToInt(Cliente_id.Text);
    End;

    QRel.Sql.Add(') AS TESTE');

     QRel.Sql.Add('ORDER BY  TRANSACAO_ID,DT_TRANS,DT_VENCIMENTO');

     QRel.ParamByName('CONDUTA').AsString      :='01';
     QRel.ParamByName('PAGTO').AsString        :='0';
     QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
     QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
     QRel.ParamByName('COND_PAGTO').AsString   := 'A PRAZO';
     QRel.ParamByName('TIPO_TRANSACAO').AsString   := 'T';


    QRel.Prepare;
    QRel.Open;

   Fdac_Temp.Close;

   TRY
    with Fdac_Temp.FieldDefs do
    begin
      Clear;
      Add('ACESSO', ftAutoInc, 0, False);
      Add('NOME', ftString, 70, False);
      Add('ENDERECO', ftString, 60, False);
      Add('NUMERO', ftString, 6, False);
      Add('TRANSACAO_ID', ftInteger, 0, False);
      Add('PARCELA_ID', ftString, 5, False);
      Add('TIPO_TRANSACAO', ftString, 1, False);
      Add('DT_TRANS', ftDate, 0, False);
      Add('DT_TRANS_EXIBIR', ftString, 13, False);
      Add('DT_VENCIMENTO', ftDate, 0, False);
      Add('DT_VENC_EXIBIR', ftString, 8, False);
      Add('BANCO_ID', ftInteger, 0, False);
      Add('VALOR_ORIGEM', ftFloat, 0, False);
      Add('PAGTO', ftString, 1, False);
      Add('DUPLICATA', ftString, 13, False);
      Add('ESPECIE', ftString, 10, False);
      Add('HISTORICO', ftString, 150, False);
      Add('NUM_DOC', ftString, 9, False);
      Add('CONTA_ID', ftInteger, 0, False);
      Add('VENDEDOR_ID', ftInteger, 0, False);
      Add('EMPRESA_ID', ftInteger, 0, False);
      Add('TPCTB', ftString, 0, False);
      Add('C_CUSTO_ID', ftInteger, 0, False);
      Add('CLIENTE_ID', ftInteger, 0, False);
      Add('MES_ANO', ftString, 7, False);
      Add('JUROS', ftFloat, 0, False);
      Add('VALOR_TOTAL', ftFloat, 0, False);
      Add('VALOR_DESPESAS', ftFloat, 0, False);
      Add('DT_VENC_ORI', ftDate, 0, False);
      Add('VALOR_ORI', ftFloat, 0, False);
      Add('VALOR_MULTA', ftFloat, 0, False);
      Add('DEBITO', ftFloat, 0, False);
      Add('CREDITO', ftFloat, 0, False);
      Add('PERDA', ftInteger, 0, False);
      Add('TP', ftString, 1, False);

    end;

    with Fdac_Temp.IndexDefs do
    begin
      Clear;
      Add('', 'ACESSO', [ixPrimary, ixUnique]);
      Add('TEMP', 'NOME;DT_TRANS', [ixCaseInsensitive]);
    end;
    Fdac_Temp.IndexName := 'TEMP';
    //Fdac_Temp.CreateDataSet;
    Fdac_Temp.Open;

   except on E: Exception do
     ShowMessage( E.Message );
   end;


  QRel.First;
   while not QRel.Eof do
   begin
    TRY
    Dif    := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime - (Qrel.FieldByName('DT_VENCIMENTO').AsDateTime + FrmPrincipal.Config.FieldByName('CARENCIA').AsInteger);
    Correc := ((((Qrel.FieldByName('DEBITO').AsFloat * FrmPrincipal.Config.FieldByName('JUROS_MENSAL').AsFloat) / 100) / 30) * Dif);
    Correc := RoundTo(Correc, -2);

    if   ((Qrel.FieldByName('DT_VENCIMENTO').AsDateTime + FrmPrincipal.Config.FieldByName('CARENCIA').AsInteger) <= Date) AND (Qrel.FieldByName('ESPECIE').AsString <> 'RESTANTE') then
    Begin
    Multa  := ((Qrel.FieldByName('DEBITO').AsFloat * FrmPrincipal.Config.FieldByName('MULTA').AsFloat) / 100);
    Multa  := RoundTo(Multa, -2);
    End
    Else
    Multa  := 0;

    Fdac_Temp.Append;
    Fdac_Temp.FieldByName('NOME').AsString             := Copy(Qrel.FieldByName('NOME').AsString, 1, 70);
   // Fdac_Temp.FieldByName('ENDERECO').AsString       := Copy(Qrel.FieldByName('ENDERECO').AsString, 1, 60);
   // Fdac_Temp.FieldByName('NUMERO').AsString         := Qrel.FieldByName('NUMERO').AsString;
    Fdac_Temp.FieldByName('TRANSACAO_ID').AsInteger    := Qrel.FieldByName('TRANSACAO_ID').AsInteger;
    Fdac_Temp.FieldByName('PARCELA_ID').AsString       := Qrel.FieldByName('PARCELA_ID').AsString;
   // Fdac_Temp.FieldByName('TIPO_TRANSACAO').AsString := Qrel.FieldByName('TIPO_TRANSACAO').AsString;
    Fdac_Temp.FieldByName('DT_TRANS').AsDateTime       := Qrel.FieldByName('DT_TRANS').AsDateTime;
    Fdac_Temp.FieldByName('DT_VENCIMENTO').AsDateTime  := Qrel.FieldByName('DT_VENCIMENTO').AsDateTime;
   // Fdac_Temp.FieldByName('BANCO_ID').AsInteger      := Qrel.FieldByName('BANCO_ID').AsInteger;
    Fdac_Temp.FieldByName('VALOR_ORIGEM').AsFloat      := Qrel.FieldByName('VALOR_ORIGEM').AsFloat;
   // Fdac_Temp.FieldByName('PAGTO').AsString          := Qrel.FieldByName('PAGTO').AsString;
   // Fdac_Temp.FieldByName('DUPLICATA').AsString      := Qrel.FieldByName('DUPLICATA').AsString;
    Fdac_Temp.FieldByName('ESPECIE').AsString          := Qrel.FieldByName('ESPECIE').AsString;
    Fdac_Temp.FieldByName('HISTORICO').AsString        := Qrel.FieldByName('HISTORICO').AsString;
    Fdac_Temp.FieldByName('NUM_DOC').AsString          := Qrel.FieldByName('NUM_DOC').AsString;
  //  Fdac_Temp.FieldByName('CONTA_ID').AsInteger      := Qrel.FieldByName('CONTA_ID').AsInteger;
  //  Fdac_Temp.FieldByName('VENDEDOR_ID').AsInteger   := Qrel.FieldByName('VENDEDOR_ID').AsInteger;
  //  Fdac_Temp.FieldByName('EMPRESA_ID').AsInteger    := Qrel.FieldByName('EMPRESA_ID').AsInteger;
  //  Fdac_Temp.FieldByName('TPCTB').AsString          := Qrel.FieldByName('TPCTB').AsString;
  //  Fdac_Temp.FieldByName('C_CUSTO_ID').AsInteger    := Qrel.FieldByName('C_CUSTO_ID').AsInteger;
    Fdac_Temp.FieldByName('CLIENTE_ID').AsInteger      := Qrel.FieldByName('CLIENTE_ID').AsInteger;
  //  Fdac_Temp.FieldByName('VALOR_DESPESAS').AsFloat  := Qrel.FieldByName('VALOR_DESPESAS').AsFloat ;
 //   Fdac_Temp.FieldByName('DT_VENC_ORI').AsDateTime  := Qrel.FieldByName('DT_VENC_ORI').AsDateTime;
  //  Fdac_Temp.FieldByName('VALOR_ORI').AsFloat       := Qrel.FieldByName('VALOR_ORI').AsFloat ;
    Fdac_Temp.FieldByName('VALOR_MULTA').AsFloat       := Multa;
    Fdac_Temp.FieldByName('DEBITO').AsFloat            := Qrel.FieldByName('DEBITO').AsFloat ;
    Fdac_Temp.FieldByName('CREDITO').AsFloat           := Qrel.FieldByName('CREDITO').AsFloat;

    Fdac_Temp.FieldByName('DT_TRANS_EXIBIR').AsString  := Copy(DateToStr(Qrel.FieldByName('DT_TRANS').AsDateTime),1,2) + '/'+
     Copy(DateToStr(Qrel.FieldByName('DT_TRANS').AsDateTime),4,2) + '/' + Copy(DateToStr(Qrel.FieldByName('DT_TRANS').AsDateTime),9,2);

     IF NOT Qrel.FieldByName('DT_VENCIMENTO').IsNull THEN
     Fdac_Temp.FieldByName('DT_VENC_EXIBIR').AsString  := Copy(DateToStr(Qrel.FieldByName('DT_VENCIMENTO').AsDateTime),1,2) + '/'+
     Copy(DateToStr(Qrel.FieldByName('DT_VENCIMENTO').AsDateTime),4,2) + '/' + Copy(DateToStr(Qrel.FieldByName('DT_VENCIMENTO').AsDateTime),9,2) + '-' +
     Qrel.FieldByName('PARCELA_ID').AsString
     else
     Fdac_Temp.FieldByName('DT_VENC_EXIBIR').AsString  :='';

    if ((Qrel.FieldByName('DT_VENCIMENTO').AsDateTime + FrmPrincipal.Config.FieldByName('CARENCIA').AsInteger) <= Date)  then
    Begin
    Fdac_Temp.FieldByName('JUROS').AsFloat             := Correc;
    Fdac_Temp.FieldByName('VALOR_TOTAL').AsFloat       := Qrel.FieldByName('DEBITO').AsFloat + Correc + Multa;
    End
    Else
    Begin
    Fdac_Temp.FieldByName('JUROS').AsFloat             := 0;
    Fdac_Temp.FieldByName('VALOR_TOTAL').AsFloat       := Qrel.FieldByName('DEBITO').AsFloat + Multa;
    End;

   // Fdac_Temp.FieldByName('PERDA').AsInteger           := Qrel.FieldByName('PERDA').AsInteger;

    if (QRel.FieldByName('CREDITO').AsFloat > 0) Then
    Fdac_Temp.FieldByName('TP').AsString := 'C'
    ELSE if (QRel.FieldByName('DEBITO').AsFloat > 0) Then
    Fdac_Temp.FieldByName('TP').AsString := 'D'
    Else if (QRel.FieldByName('CONDUTA').AsString = '01') AND (QRel.FieldByName('DEPTO').AsString = '07') and
      (QRel.FieldByName('CREDITO').AsFloat = 0)  AND (QRel.FieldByName('DEBITO').AsFloat = 0) Then
    Fdac_Temp.FieldByName('TP').AsString := 'V'
    Else if (QRel.FieldByName('CONDUTA').AsString = '01') AND (QRel.FieldByName('DEPTO').AsString = '03')  and
     (QRel.FieldByName('CREDITO').AsFloat = 0)  AND (QRel.FieldByName('DEBITO').AsFloat = 0) Then
    Fdac_Temp.FieldByName('TP').AsString := 'R';

    Fdac_Temp.Post;

    Application.ProcessMessages;
    except
     on E: Exception do
     ShowMessage( E.Message );
    END;

    Qrel.Next;
   end;

  Fdac_Temp.IndexFieldNames:='ACESSO';
  Fdac_Temp.Open;


    QRLabel13.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;

    if QRel.IsEmpty then
      Application.MessageBox('Não há dados para os parâmetros informados', PChar(Msg_Title), mb_IconInformation)
    else
      Extrato.PreviewModal;
  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;

  end;
end;

procedure TFrmExtrato_movimentacao_cliente.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmExtrato_movimentacao_cliente.Cliente_idChange(Sender: TObject);
begin
  if cliente_id.Value > 0 then
    SearchBanco;

end;

procedure TFrmExtrato_movimentacao_cliente.Cliente_idKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = cliente_id) then
    btncliente_idClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmExtrato_movimentacao_cliente.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if (Fdac_Temp.FieldByName('TP').AsString = 'V') OR  (Fdac_Temp.FieldByName('TP').AsString = 'R') then
  bEGIN
    QRDBText1.Font.Style := [FSBOLD];
    QRDBText8.Font.Style := [FSBOLD];
    QRDBText2.Font.Style := [FSBOLD];
    QRDBText5.Font.Style := [FSBOLD];
    QRDBText7.Font.Style := [FSBOLD];
    QRDBText10.Font.Style := [FSBOLD];
    QRDBText6.Font.Style := [FSBOLD];
  end
  else
  begin
    QRDBText1.Font.Style := [];
    QRDBText8.Font.Style := [];
    QRDBText2.Font.Style := [];
    QRDBText5.Font.Style := [];
    QRDBText7.Font.Style := [];
    QRDBText10.Font.Style := [];
    QRDBText6.Font.Style := [];
  end;

end;

procedure TFrmExtrato_movimentacao_cliente.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmExtrato_movimentacao_cliente.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmExtrato_movimentacao_cliente.ExtratoBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  Saldo := Sd;
end;

procedure TFrmExtrato_movimentacao_cliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmExtrato_movimentacao_cliente.FormCreate(Sender: TObject);
begin
  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);
end;

procedure TFrmExtrato_movimentacao_cliente.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  //QRLabel4.Caption := FormatFloat('#,##0.00', Abs(Saldo));
 {
  if Saldo >= 0 then
  Begin
    QRLabel4.Left := 521;
    QRLabel4.Caption := FormatFloat('#,##0.00', Abs(Saldo));
  End
  else
  Begin
    QRlabel4.Left := 615;
    QRLabel4.Caption := '-' + FormatFloat('#,##0.00', Abs(Saldo));
  End;
  }
end;

end.
