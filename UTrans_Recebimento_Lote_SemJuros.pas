unit UTrans_Recebimento_Lote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, StdCtrls, Tabs, ComCtrls, Grids,
  DBGrids, Buttons, rxCurrEdit, Mask, rxToolEdit, ExtCtrls, DBTables, QRCtrls,
  QuickRpt,Math;

type
  TFrmTrans_Recebimento_Lote = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Dtmen: TDateEdit;
    Dtmai: TDateEdit;
    Label2: TLabel;
    Cliente: TCurrencyEdit;
    btnCliente: TSpeedButton;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    StatusBar1: TStatusBar;
    Alfabeto: TTabSet;
    btnExecuta: TButton;
    btnRetorna: TButton;
    DataContas: TDataSource;
    QContas: TIBQuery;
    Label3: TLabel;
    btnSoma: TButton;
    Vr_Quitar: TRxCalcEdit;
    Label27: TLabel;
    Vr_Soma: TRxCalcEdit;
    Recibo: TQuickRep;
    DetailBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRShape2: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape3: TQRShape;
    QRDBText3: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRBand3: TQRBand;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRShape4: TQRShape;
    QRLabel20: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRShape5: TQRShape;
    QRLabel27: TQRLabel;
    QRBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel19: TQRLabel;
    Table_Temp: TTable;
    btnCaixa: TSpeedButton;
    Caixa: TCurrencyEdit;
    QRel: TIBQuery;
    Especie: TComboBox;
    Label8: TLabel;
    QOrcamento: TIBQuery;
    DataOrcamento: TDataSource;
    Valor: TRxCalcEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Vr_Despesas: TRxCalcEdit;
    Label7: TLabel;
    Vr_Total: TRxCalcEdit;
    Label9: TLabel;
    Cod_Contabil: TEdit;
    Aguarde: TPanel;
    Label10: TLabel;
    Vr_Juros: TRxCalcEdit;
    Dias: TCurrencyEdit;
    Label11: TLabel;
    QCliente: TIBQuery;
    GroupBox1: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnClienteClick(Sender: TObject);
    procedure ClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ClienteExit(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnRetornaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AlfabetoClick(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure btnSomaClick(Sender: TObject);
    procedure DtmenEnter(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnCaixaClick(Sender: TObject);
    procedure QOrcamentoAfterOpen(DataSet: TDataSet);
    procedure QContasAfterOpen(DataSet: TDataSet);
    procedure DtmenExit(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Seleciona;
    procedure Soma;
    procedure Cria_Dados_Temporarios;
  end;

var
  FrmTrans_Recebimento_Lote: TFrmTrans_Recebimento_Lote;
  Individual,Dif,Correc: Real;

implementation

uses
  UPrincipal, UData, UConsulta, UProrroga, UAgrupamento;

{$R *.dfm}

procedure TFrmTrans_Recebimento_Lote.Cria_Dados_Temporarios;
begin
  Table_Temp.First;
  while not Table_Temp.Eof do
    Table_Temp.Delete;

  QContas.First;
  while not QContas.Eof do
  begin
    Table_Temp.Append;
    Table_Temp.FieldByName('NOME').AsString             := Copy(QContas.FieldByName('NOME').AsString, 1, 70);
    Table_Temp.FieldByName('ENDERECO').AsString         := Copy(QContas.FieldByName('ENDERECO').AsString, 1, 60);
    Table_Temp.FieldByName('NUMERO').AsString           := QContas.FieldByName('NUMERO').AsString;
    Table_Temp.FieldByName('TRANSACAO_ID').AsInteger    := QContas.FieldByName('TRANSACAO_ID').AsInteger;
    Table_Temp.FieldByName('PARCELA_ID').AsString       := QContas.FieldByName('PARCELA_ID').AsString;
    Table_Temp.FieldByName('TIPO_TRANSACAO').AsString   := QContas.FieldByName('TIPO_TRANSACAO').AsString;
    Table_Temp.FieldByName('DT_VENCIMENTO').AsDateTime  := QContas.FieldByName('DT_VENCIMENTO').AsDateTime;
    Table_Temp.FieldByName('BANCO_ID').AsInteger        := QContas.FieldByName('BANCO_ID').AsInteger;
    Table_Temp.FieldByName('VALOR').AsFloat             := QContas.FieldByName('VALOR').AsFloat;
    Table_Temp.FieldByName('PAGTO').AsString            := QContas.FieldByName('PAGTO').AsString;
    Table_Temp.FieldByName('DUPLICATA').AsString        := QContas.FieldByName('DUPLICATA').AsString;
    Table_Temp.FieldByName('ESPECIE').AsString          := QContas.FieldByName('ESPECIE').AsString;
    Table_Temp.FieldByName('HISTORICO').AsString        := QContas.FieldByName('HISTORICO').AsString;
    Table_Temp.FieldByName('NUM_DOC').AsString          := QContas.FieldByName('NUM_DOC').AsString;
    Table_Temp.FieldByName('CONTA_ID').AsInteger        := QContas.FieldByName('CONTA_ID').AsInteger;
    Table_Temp.FieldByName('VENDEDOR_ID').AsInteger     := QContas.FieldByName('VENDEDOR_ID').AsInteger;
    Table_Temp.FieldByName('EMPRESA_ID').AsInteger      := QContas.FieldByName('EMPRESA_ID').AsInteger;
    Table_Temp.FieldByName('TPCTB').AsString            := QContas.FieldByName('TPCTB').AsString;
    Table_Temp.FieldByName('C_CUSTO_ID').AsInteger      := QContas.FieldByName('C_CUSTO_ID').AsInteger;
    Table_Temp.FieldByName('CLIENTE_ID').AsInteger      := QContas.FieldByName('CLIENTE_ID').AsInteger;

    Table_Temp.Post;

    Application.ProcessMessages;
    QContas.Next;
  end;
end;

procedure TFrmTrans_Recebimento_Lote.Seleciona;
begin
  QContas.Sql.Clear;
  QContas.Sql.Add('SELECT CLIENTES.NOME, CLIENTES.ENDERECO, CLIENTES.NUMERO, TRANSPARCELAS.*, TRANSACOES.HISTORICO, TRANSACOES.NUM_DOC, TRANSACOES.CONTA_ID, TRANSACOES.VENDEDOR_ID, TRANSACOES.EMPRESA_ID, ' +
                  'TRANSACOES.TPCTB, TRANSACOES.C_CUSTO_ID, TRANSACOES.CLIENTE_ID ');
  QContas.Sql.Add('FROM CLIENTES');
  QContas.Sql.Add('INNER JOIN TRANSACOES');
  QContas.Sql.Add('ON (CLIENTES.CLIENTE_ID = TRANSACOES.CLIENTE_ID)');
  QContas.Sql.Add('INNER JOIN TRANSPARCELAS');
  QContas.Sql.Add('ON (TRANSACOES.TRANSACAO_ID = TRANSPARCELAS.TRANSACAO_ID)');
  QContas.Sql.Add('WHERE');
  QContas.Sql.Add('(TRANSACOES.COND_PAGTO = :COND_PAGTO)');

  if Cliente.Value > 0 then
  begin
    QContas.Sql.Add('AND (TRANSACOES.CLIENTE_ID = :CLIENTE_ID)');

    QContas.ParamByName('CLIENTE_ID').AsInteger := StrToInt(Cliente.Text);
  end;

  if Especie.Text <> '' then
  begin
    QContas.Sql.Add('AND (TRANSPARCELAS.ESPECIE = :ESPECIE)');
    QContas.ParamByName('ESPECIE').AsString := Especie.Text;
  end;

  if Cod_Contabil.Text <> '' then
  begin
    QContas.Sql.Add('AND (CLIENTES.COD_CONTABIL = :COD_CONTABIL)');
    QContas.ParamByName('COD_CONTABIL').AsString := Cod_Contabil.Text;
  end;

  if Valor.Value > 0 then
  begin
    QContas.Sql.Add('AND (TRANSPARCELAS.VALOR = :VALOR)');
    QContas.ParamByName('VALOR').AsFloat := Valor.Value;
  end;

  if LeIni(Arq_Ini, 'Sistema', 'Exibir vendas TPCTB') = 'True' then
  begin
    QContas.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
    QContas.ParamByName('TPCTB').AsString := FrmData.QAcesso.FieldByName('TPCTB').AsString;
  end;

  QContas.Sql.Add('AND (TRANSPARCELAS.DT_VENCIMENTO BETWEEN :DT_INICIAL AND :DT_FINAL)');
  QContas.Sql.Add('AND (TRANSPARCELAS.VALOR > 0)');
  QContas.Sql.Add('AND (TRANSPARCELAS.BANCO_ID = 0)');
  QContas.Sql.Add('AND (TRANSPARCELAS.TIPO_TRANSACAO = :TIPO_TRANSACAO)');
  QContas.Sql.Add('AND ((TRANSPARCELAS.AGRUPAMENTO = 0) OR (TRANSPARCELAS.AGRUPAMENTO IS NULL))');
  QContas.Sql.Add('ORDER BY CLIENTES.NOME, TRANSPARCELAS.DT_VENCIMENTO, TRANSPARCELAS.PARCELA_ID');

  QContas.ParamByName('COND_PAGTO').AsString     := 'A PRAZO';
  QContas.ParamByName('DT_INICIAL').AsDateTime   := Dtmen.Date;
  QContas.ParamByName('DT_FINAL').AsDateTime     := Dtmai.Date;
  QContas.ParamByName('TIPO_TRANSACAO').AsString := 'T';

  QContas.Prepare;
  QContas.Open;

  Cria_Dados_Temporarios;

  Soma;

  DBGrid1.SetFocus;
end;

procedure TFrmTrans_Recebimento_Lote.Soma;
begin
  try
    Aguarde.Visible := True;

    Vr_Soma.Value     := 0;
    Vr_Despesas.Value := 0;
    Vr_Total.Value    := 0;
    Vr_Juros.Value    := 0;
    Dias.Value        := 0;

    QContas.First;
    while not QContas.Eof do
    begin
      Vr_Soma.Value     := (Vr_Soma.Value + QContas.FieldByName('VALOR').AsFloat);
      Vr_Despesas.Value := (Vr_Despesas.Value + QContas.FieldByName('VALOR_DESPESAS').AsFloat);

      if (FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime > QContas.FieldByName('DT_VENCIMENTO').AsDateTime) and (FrmPrincipal.Config.FieldByName('JUROS_MENSAL').AsFloat > 0) then
      begin
        Dif    := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime - QContas.FieldByName('DT_VENCIMENTO').AsDateTime;
        Correc := ((((QContas.FieldByName('VALOR').AsFloat * FrmPrincipal.Config.FieldByName('JUROS_MENSAL').AsFloat) / 100) / 30) * Dif);
        Correc := RoundTo(Correc, -2);
        Vr_Juros.Value := Correc + Vr_Juros.Value;
        Dias.Value := Dias.Value + Dif;
        Label10.Visible  := True;
        Vr_Juros.Visible := True;
        Label11.Visible  := True;
        Dias.Visible     := True;
      end;

      Application.ProcessMessages;
      QContas.Next;
    end;

    Vr_Total.Value := (Vr_Soma.Value + Vr_Juros.Value);

    QContas.First;
  finally
    Aguarde.Visible := False;
  end;
end;

procedure TFrmTrans_Recebimento_Lote.AlfabetoClick(Sender: TObject);
begin
  QContas.Sql.Clear;
  QContas.Sql.Add('SELECT CLIENTES.NOME, CLIENTES.ENDERECO, CLIENTES.NUMERO, TRANSPARCELAS.*, TRANSACOES.HISTORICO, TRANSACOES.NUM_DOC, TRANSACOES.CONTA_ID, TRANSACOES.VENDEDOR_ID, TRANSACOES.EMPRESA_ID, ' +
                  'TRANSACOES.TPCTB, TRANSACOES.C_CUSTO_ID, TRANSACOES.CLIENTE_ID');
  QContas.Sql.Add('FROM CLIENTES');
  QContas.Sql.Add('INNER JOIN TRANSACOES');
  QContas.Sql.Add('ON (CLIENTES.CLIENTE_ID = TRANSACOES.CLIENTE_ID)');
  QContas.Sql.Add('INNER JOIN TRANSPARCELAS');
  QContas.Sql.Add('ON (TRANSACOES.TRANSACAO_ID = TRANSPARCELAS.TRANSACAO_ID)');
  QContas.Sql.Add('WHERE');
  QContas.Sql.Add('(CLIENTES.NOME LIKE :NOME)');
  QContas.Sql.Add('AND (TRANSACOES.COND_PAGTO = :COND_PAGTO)');

  if Especie.Text <> '' then
  begin
    QContas.Sql.Add('AND (TRANSPARCELAS.ESPECIE = :ESPECIE)');
    QContas.ParamByName('ESPECIE').AsString := Especie.Text;
  end;

  if Valor.Value > 0 then
  begin
    QContas.Sql.Add('AND (TRANSPARCELAS.VALOR = :VALOR)');
    QContas.ParamByName('VALOR').AsFloat := Valor.Value;
  end;

  if LeIni(Arq_Ini, 'Sistema', 'Exibir vendas TPCTB') = 'True' then
  begin
    QContas.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
    QContas.ParamByName('TPCTB').AsString := FrmData.QAcesso.FieldByName('TPCTB').AsString;
  end;


  QContas.Sql.Add('AND (TRANSPARCELAS.DT_VENCIMENTO BETWEEN :DT_INICIAL AND :DT_FINAL)');
  QContas.Sql.Add('AND (TRANSPARCELAS.VALOR > 0)');
  QContas.Sql.Add('AND (TRANSPARCELAS.BANCO_ID = 0)');
  QContas.Sql.Add('AND (TRANSPARCELAS.TIPO_TRANSACAO = :TIPO_TRANSACAO)');
  QContas.Sql.Add('AND ((TRANSPARCELAS.AGRUPAMENTO = 0) OR (TRANSPARCELAS.AGRUPAMENTO IS NULL))');
  QContas.Sql.Add('ORDER BY CLIENTES.NOME, TRANSPARCELAS.DT_VENCIMENTO, TRANSPARCELAS.PARCELA_ID');

  QContas.ParamByName('NOME').AsString           := Chr(Alfabeto.TabIndex + 65) + '%';
  QContas.ParamByName('COND_PAGTO').AsString     := 'A PRAZO';
  QContas.ParamByName('DT_INICIAL').AsDateTime   := Dtmen.Date;
  QContas.ParamByName('DT_FINAL').AsDateTime     := Dtmai.Date;
  QContas.ParamByName('TIPO_TRANSACAO').AsString := 'T';

  QContas.Prepare;
  QContas.Open;

  Cria_Dados_Temporarios;

  Soma;

  DBGrid1.SetFocus;
end;

procedure TFrmTrans_Recebimento_Lote.btnExecutaClick(Sender: TObject);
var
Valor, Percentual: Real;
begin
  if Application.MessageBox('Deseja realmente quitar os valores selecionados?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) <> IDYES then
    exit;

  if QContas.IsEmpty then
    exit;

  Valor             := Vr_Quitar.Value;
  Individual        := 0;
  Percentual        := 0;
  QRLabel18.Caption := 'Vr. rec. doc. ';

  if Vr_Quitar.Value > Vr_Soma.Value then
  begin
    Percentual := (((Vr_Quitar.Value - Vr_Soma.Value) * 100) / Vr_Soma.Value);
    Individual := Vr_Quitar.Value;
  end;

  DBGrid1.DataSource.DataSet.First;
  while not DBGrid1.DataSource.DataSet.Eof do
  begin
    if Vr_Quitar.Value > 0 then
    begin
      if Vr_Quitar.Value <= Vr_Soma.Value then
      begin
        if Valor > 0 then
        begin
          QRel.Sql.Clear;
          QRel.Sql.Add('INSERT INTO TRANSACOES(' +
                       'DT_TRANS,       DT_MOVIMENTO,      CONDUTA, ' +
                       'EMPRESA_ID,     CLIENTE_ID,        BANCO_ID, ' +
                       'NUM_DOC,        SERIE,             FLUXO_CAIXA_ID, ' +
                       'SAIDA_ID,       PARCELA_ID,        VALOR_PARCELA, ' +
                       'VALOR,          BALANCO,           TPCTB, ' +
                       'AUTORIZ_ID,     HISTORICO) VALUES(' +
                       ':DT_TRANS,      :DT_MOVIMENTO,     :CONDUTA, ' +
                       ':EMPRESA_ID,    :CLIENTE_ID,       :BANCO_ID, ' +
                       ':NUM_DOC,       :SERIE,            :FLUXO_CAIXA_ID, ' +
                       ':SAIDA_ID,      :PARCELA_ID,       :VALOR_PARCELA, ' +
                       ':VALOR,         :BALANCO,          :TPCTB, ' +
                       ':AUTORIZ_ID,    :HISTORICO)');

          QRel.ParamByName('DT_TRANS').AsDateTime     := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
          QRel.ParamByName('DT_MOVIMENTO').AsDateTime := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
          QRel.ParamByName('CONDUTA').AsString        := '07';
          QRel.ParamByName('EMPRESA_ID').AsInteger    := DBGrid1.DataSource.DataSet.FieldByName('EMPRESA_ID').AsInteger;
          QRel.ParamByName('CLIENTE_ID').AsInteger    := DBGrid1.DataSource.DataSet.FieldByName('CLIENTE_ID').AsInteger;

          if StrToInt(Caixa.Text) = 0 then
            QRel.ParamByName('BANCO_ID').AsInteger := StrToInt(LeIni(Arq_Ini, 'Sistema', 'Caixa'))
          else
            QRel.ParamByName('BANCO_ID').AsInteger := StrToInt(Caixa.Text);

          QRel.ParamByName('NUM_DOC').AsString         := DBGrid1.DataSource.DataSet.FieldByName('NUM_DOC').AsString;
          QRel.ParamByName('SERIE').AsString           := 'N';
          QRel.ParamByName('FLUXO_CAIXA_ID').AsInteger := 1;
          QRel.ParamByName('SAIDA_ID').AsInteger       := DBGrid1.DataSource.DataSet.FieldByName('TRANSACAO_ID').AsInteger;
          QRel.ParamByName('PARCELA_ID').AsString      := DBGrid1.DataSource.DataSet.FieldByName('PARCELA_ID').AsString;
          QRel.ParamByName('VALOR_PARCELA').AsFloat    := DBGrid1.DataSource.DataSet.FieldByName('VALOR').AsFloat;

          if Valor >= DBGrid1.DataSource.DataSet.FieldByName('VALOR').AsFloat then
          begin
            QRel.ParamByName('VALOR').AsFloat := DBGrid1.DataSource.DataSet.FieldByName('VALOR').AsFloat;

            Valor      := Valor - DBGrid1.DataSource.DataSet.FieldByName('VALOR').AsFloat;
            Individual := Individual + DBGrid1.DataSource.DataSet.FieldByName('VALOR').AsFloat;
          end
          else
          begin
            QRel.ParamByName('SERIE').AsString := 'P';
            QRel.ParamByName('VALOR').AsFloat  := Valor;

            Individual := Individual + Valor;
            Valor      := 0;
          end;

          QRel.ParamByName('BALANCO').AsString      := 'LIBERADO';
          QRel.ParamByName('TPCTB').AsString        := DBGrid1.DataSource.DataSet.FieldByName('TPCTB').AsString;
          QRel.ParamByName('AUTORIZ_ID').AsInteger  := FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger;
          QRel.ParamByName('HISTORICO').AsString    := DBGrid1.DataSource.DataSet.FieldByName('HISTORICO').AsString + ' Parcela: ' + DBGrid1.DataSource.DataSet.FieldByName('PARCELA_ID').AsString ;

          QRel.Prepare;
          QRel.ExecSql;



          FrmData.Trans_Eficaz.CommitRetaining;

          QRel.Sql.Clear;
          QRel.Sql.Add('UPDATE TRANSPARCELAS SET ESPECIE = :ESPECIE');
          QRel.Sql.Add('WHERE');
          QRel.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
          QRel.Sql.Add('AND (PARCELA_ID = :PARCELA_ID)');

          QRel.ParamByName('ESPECIE').AsString       := 'RESTANTE';
          QRel.ParamByName('TRANSACAO_ID').AsInteger := DBGrid1.DataSource.DataSet.FieldByName('TRANSACAO_ID').AsInteger;
          QRel.ParamByName('PARCELA_ID').AsString    := DBGrid1.DataSource.DataSet.FieldByName('PARCELA_ID').AsString;

          QRel.Prepare;
          QRel.ExecSql;

          FrmData.Trans_Eficaz.CommitRetaining;

          QRLabel18.Caption := QRLabel18.Caption + DBGrid1.DataSource.DataSet.FieldByName('DUPLICATA').AsString + ' ref. parc. ' + DBGrid1.DataSource.DataSet.FieldByName('PARCELA_ID').AsString + ', ';
        end;
      end
      else
      begin
        QRel.Sql.Clear;
        QRel.Sql.Add('INSERT INTO TRANSACOES(' +
                     'DT_TRANS,       DT_MOVIMENTO,      CONDUTA, ' +
                     'EMPRESA_ID,     CLIENTE_ID,        BANCO_ID, ' +
                     'NUM_DOC,        SERIE,             FLUXO_CAIXA_ID, ' +
                     'SAIDA_ID,       PARCELA_ID,        VALOR_PARCELA, ' +
                     'VALOR,          BALANCO,           TPCTB, ' +
                     'AUTORIZ_ID,     HISTORICO,         CONTA_ID, ' +
                     'COMPLEMENTO) VALUES(' +
                     ':DT_TRANS,      :DT_MOVIMENTO,     :CONDUTA, ' +
                     ':EMPRESA_ID,    :CLIENTE_ID,       :BANCO_ID, ' +
                     ':NUM_DOC,       :SERIE,            :FLUXO_CAIXA_ID, ' +
                     ':SAIDA_ID,      :PARCELA_ID,       :VALOR_PARCELA, ' +
                     ':VALOR,         :BALANCO,          :TPCTB, ' +
                     ':AUTORIZ_ID,    :HISTORICO,        :CONTA_ID, ' +
                     ':COMPLEMENTO)');

        QRel.ParamByName('DT_TRANS').AsDateTime     := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
        QRel.ParamByName('DT_MOVIMENTO').AsDateTime := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
        QRel.ParamByName('CONDUTA').AsString        := '07';
        QRel.ParamByName('EMPRESA_ID').AsInteger    := DBGrid1.DataSource.DataSet.FieldByName('EMPRESA_ID').AsInteger;
        QRel.ParamByName('CLIENTE_ID').AsInteger    := DBGrid1.DataSource.DataSet.FieldByName('CLIENTE_ID').AsInteger;

        if StrToInt(Caixa.Text) = 0 then
          QRel.ParamByName('BANCO_ID').AsInteger := StrToInt(LeIni(Arq_Ini, 'Sistema', 'Caixa'))
        else
          QRel.ParamByName('BANCO_ID').AsInteger := StrToInt(Caixa.Text);

        QRel.ParamByName('NUM_DOC').AsString         := DBGrid1.DataSource.DataSet.FieldByName('NUM_DOC').AsString;
        QRel.ParamByName('SERIE').AsString           := 'J';
        QRel.ParamByName('FLUXO_CAIXA_ID').AsInteger := 1;
        QRel.ParamByName('SAIDA_ID').AsInteger       := DBGrid1.DataSource.DataSet.FieldByName('TRANSACAO_ID').AsInteger;
        QRel.ParamByName('PARCELA_ID').AsString      := DBGrid1.DataSource.DataSet.FieldByName('PARCELA_ID').AsString;
        QRel.ParamByName('VALOR_PARCELA').AsFloat    := DBGrid1.DataSource.DataSet.FieldByName('VALOR').AsFloat;
        QRel.ParamByName('VALOR').AsFloat            := (DBGrid1.DataSource.DataSet.FieldByName('VALOR').AsFloat + ((DBGrid1.DataSource.DataSet.FieldByName('VALOR').AsFloat * Percentual) / 100));
        QRel.ParamByName('BALANCO').AsString         := 'LIBERADO';
        QRel.ParamByName('TPCTB').AsString           := DBGrid1.DataSource.DataSet.FieldByName('TPCTB').AsString;
        QRel.ParamByName('AUTORIZ_ID').AsInteger     := FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger;
        QRel.ParamByName('HISTORICO').AsString       := DBGrid1.DataSource.DataSet.FieldByName('HISTORICO').AsString;
        QRel.ParamByName('CONTA_ID').AsInteger       := FrmPrincipal.Config.FieldByName('CONTA_JUROS').AsInteger;
        QRel.ParamByName('COMPLEMENTO').AsString     := 'Vr. Ref. Despesas/Encargos';

        QRel.Prepare;
        QRel.ExecSql;

        FrmData.Trans_Eficaz.CommitRetaining;

        QRLabel18.Caption := QRLabel18.Caption + DBGrid1.DataSource.DataSet.FieldByName('DUPLICATA').AsString + ' ref. parc. ' + DBGrid1.DataSource.DataSet.FieldByName('PARCELA_ID').AsString + ', ';

        QRel.Sql.Clear;
        QRel.Sql.Add('UPDATE CLIENTES SET DT_ATUALIZACAO = :DATE');
        QRel.Sql.Add('WHERE');
        QRel.Sql.Add('(CLIENTE_ID = :CLIENTE_ID)');

        QRel.ParamByName('DATE').AsDateTime      := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
        QRel.ParamByName('Cliente_ID').AsInteger := DBGrid1.DataSource.DataSet.FieldByName('CLIENTE_ID').AsInteger;

        QRel.Prepare;
        QRel.ExecSql;

        FrmData.Trans_Eficaz.CommitRetaining;
      end;
    end
    else
    begin
      if DBGrid1.SelectedRows.CurrentRowSelected = True then
      begin
        QRel.Sql.Clear;
        QRel.Sql.Add('INSERT INTO TRANSACOES(' +
                     'DT_TRANS,       DT_MOVIMENTO,      CONDUTA, ' +
                     'EMPRESA_ID,     CLIENTE_ID,        BANCO_ID, ' +
                     'NUM_DOC,        SERIE,             FLUXO_CAIXA_ID, ' +
                     'SAIDA_ID,       PARCELA_ID,        VALOR_PARCELA, ' +
                     'VALOR,          BALANCO,           TPCTB, ' +
                     'AUTORIZ_ID,     HISTORICO) VALUES(' +
                     ':DT_TRANS,      :DT_MOVIMENTO,     :CONDUTA, ' +
                     ':EMPRESA_ID,    :CLIENTE_ID,       :BANCO_ID, ' +
                     ':NUM_DOC,       :SERIE,            :FLUXO_CAIXA_ID, ' +
                     ':SAIDA_ID,      :PARCELA_ID,       :VALOR_PARCELA, ' +
                     ':VALOR,         :BALANCO,          :TPCTB, ' +
                     ':AUTORIZ_ID,    :HISTORICO)');

        QRel.ParamByName('DT_TRANS').AsDateTime     := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
        QRel.ParamByName('DT_MOVIMENTO').AsDateTime := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
        QRel.ParamByName('CONDUTA').AsString        := '07';
        QRel.ParamByName('EMPRESA_ID').AsInteger    := DBGrid1.DataSource.DataSet.FieldByName('EMPRESA_ID').AsInteger;
        QRel.ParamByName('CLIENTE_ID').AsInteger    := DBGrid1.DataSource.DataSet.FieldByName('CLIENTE_ID').AsInteger;

        if StrToInt(Caixa.Text) = 0 then
          QRel.ParamByName('BANCO_ID').AsInteger := StrToInt(LeIni(Arq_Ini, 'Sistema', 'Caixa'))
        else
          QRel.ParamByName('BANCO_ID').AsInteger := StrToInt(Caixa.Text);

        QRel.ParamByName('NUM_DOC').AsString         := DBGrid1.DataSource.DataSet.FieldByName('NUM_DOC').AsString;
        QRel.ParamByName('SERIE').AsString           := 'N';
        QRel.ParamByName('FLUXO_CAIXA_ID').AsInteger := 1;
        QRel.ParamByName('SAIDA_ID').AsInteger       := DBGrid1.DataSource.DataSet.FieldByName('TRANSACAO_ID').AsInteger;
        QRel.ParamByName('PARCELA_ID').AsString      := DBGrid1.DataSource.DataSet.FieldByName('PARCELA_ID').AsString;
        QRel.ParamByName('VALOR_PARCELA').AsFloat    := DBGrid1.DataSource.DataSet.FieldByName('VALOR').AsFloat;
        QRel.ParamByName('VALOR').AsFloat            := DBGrid1.DataSource.DataSet.FieldByName('VALOR').AsFloat;
        QRel.ParamByName('BALANCO').AsString         := 'LIBERADO';
        QRel.ParamByName('TPCTB').AsString           := DBGrid1.DataSource.DataSet.FieldByName('TPCTB').AsString;
        QRel.ParamByName('AUTORIZ_ID').AsInteger     := FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger;
        QRel.ParamByName('HISTORICO').AsString       := DBGrid1.DataSource.DataSet.FieldByName('HISTORICO').AsString + ' Parcela: ' + DBGrid1.DataSource.DataSet.FieldByName('PARCELA_ID').AsString ;

        QRel.Prepare;
        QRel.ExecSql;

        FrmData.Trans_Eficaz.CommitRetaining;

        QRel.Sql.Clear;
        QRel.Sql.Add('UPDATE TRANSPARCELAS SET ESPECIE = :ESPECIE');
        QRel.Sql.Add('WHERE');
        QRel.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
        QRel.Sql.Add('AND (PARCELA_ID = :PARCELA_ID)');

        QRel.ParamByName('ESPECIE').AsString       := 'RESTANTE';
        QRel.ParamByName('TRANSACAO_ID').AsInteger := DBGrid1.DataSource.DataSet.FieldByName('TRANSACAO_ID').AsInteger;
        QRel.ParamByName('PARCELA_ID').AsString    := DBGrid1.DataSource.DataSet.FieldByName('PARCELA_ID').AsString;

        QRel.Prepare;
        QRel.ExecSql;

        FrmData.Trans_Eficaz.CommitRetaining;

        Individual := Individual + DBGrid1.DataSource.DataSet.FieldByName('VALOR').AsFloat;

        QRLabel18.Caption := QRLabel18.Caption + DBGrid1.DataSource.DataSet.FieldByName('DUPLICATA').AsString + ' ref. parc. ' + DBGrid1.DataSource.DataSet.FieldByName('PARCELA_ID').AsString + ', ';
      end;
    end;
    Application.ProcessMessages;

    DBGrid1.DataSource.DataSet.Next;
  end;

  if Individual = 0  then
  Begin
  Application.MessageBox('Selecione um valor para quitação por favor!', PChar(Msg_Title), mb_IconInformation);
  Exit;
  End;


  QContas.Close;
  QContas.Open;
  QCliente.Close;
  QCliente.ParamByName('CLIENTE_ID').AsInteger := StrToInt(Cliente.Text);
  QCliente.Open;

  Soma;

  QRLabel19.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;
  QRLabel1.Caption  := 'Nº: LOTE';
  QRLabel2.Caption  := 'Valor: ' + FormatFloat('#,##0.00', Individual);
  QRLabel8.Caption  := Extenso(Individual);
  QRLabel10.Caption := FrmPrincipal.QEmpresa.FieldByName('MUNICIPIO').AsString + '(' +
                       FrmPrincipal.QEmpresa.FieldByName('ESTADO').AsString + '), ' +
                       Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 1, 2) + ' de ' +
                       NomeMes(StrToInt(Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 4, 2))) + ' de ' +
                       Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 7, 4);
  QRLabel12.Caption := QCliente.FieldByName('ENDERECO').AsString + ', ' + QCliente.FieldByName('NUMERO').AsString;
  QRLabel17.Caption := FrmPrincipal.QEmpresa.FieldByName('ENDERECO').AsString + ', ' + FrmPrincipal.QEmpresa.FieldByName('NUMERO').AsString;

  if Application.MessageBox('Deseja imprimir o recibo de quitação?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = IDYES then
    Recibo.PreviewModal;

  try
    if (LeIni(Arq_Ini, 'Sistema', 'Carga Automática de Produtos') = 'True') and (FrmPrincipal.QEmpresa.FieldByName('CARGA').AsString = 'SIM') then
      Carga_PDV_Off_Line(0, StrToInt(Cliente.Text));
  except

  end;

  Vr_Quitar.Value := 0;
end;

procedure TFrmTrans_Recebimento_Lote.btnCaixaClick(Sender: TObject);
begin
  try
    Caixa.Value := GetConsulta('BANCOS', 0, 0, StrToInt(Caixa.Text));
  except
    Caixa.Value := GetConsulta('BANCOS', 0, 0, 0);
  end;
end;

procedure TFrmTrans_Recebimento_Lote.btnClienteClick(Sender: TObject);
begin
  try
    Cliente.Value := GetConsulta('CLIENTES', 0, 0, StrToInt(Cliente.Text));
  except
    Cliente.Value := GetConsulta('CLIENTES', 0, 0, 0);
  end;

  Seleciona;
end;

procedure TFrmTrans_Recebimento_Lote.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmTrans_Recebimento_Lote.btnSomaClick(Sender: TObject);

begin
  Vr_Soma.Value     := 0;
  Vr_Despesas.Value := 0;
  Vr_Total.Value    := 0;
  Vr_Juros.Value    := 0;
  Dias.Value        := 0;

  DBGrid1.DataSource.DataSet.First;
  while not DBGrid1.DataSource.DataSet.Eof do
  begin
    if DBGrid1.SelectedRows.CurrentRowSelected = True then
    begin
      Vr_Soma.Value     := (Vr_Soma.Value + DBGrid1.DataSource.DataSet.FieldByName('VALOR').AsFloat);
      Vr_Despesas.Value := (Vr_Despesas.Value + DBGrid1.DataSource.DataSet.FieldByName('VALOR_DESPESAS').AsFloat);

      if (FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime > DBGrid1.DataSource.DataSet.FieldByName('DT_VENCIMENTO').AsDateTime) and (FrmPrincipal.Config.FieldByName('JUROS_MENSAL').AsFloat > 0) then
      begin
        Dif    := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime - DBGrid1.DataSource.DataSet.FieldByName('DT_VENCIMENTO').AsDateTime;
        Correc := ((((DBGrid1.DataSource.DataSet.FieldByName('VALOR').AsFloat * FrmPrincipal.Config.FieldByName('JUROS_MENSAL').AsFloat) / 100) / 30) * Dif);
        Correc := RoundTo(Correc, -2);
        Vr_Juros.Value := Correc + Vr_Juros.Value;
        Dias.Value := Dias.Value + Dif;
        Label10.Visible  := True;
        Vr_Juros.Visible := True;
        Label11.Visible  := True;
        Dias.Visible     := True;
      end;
    end;

    Application.ProcessMessages;
    DBGrid1.DataSource.DataSet.Next;
  end;

  Vr_Total.Value := (Vr_Soma.Value + Vr_Juros.Value);

  DBGrid1.DataSource.DataSet.First;
end;

procedure TFrmTrans_Recebimento_Lote.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  OldBkMode: Integer;
begin
  if QContas.FieldByName('DT_VENCIMENTO').AsDatetime > Date then
    TDBGrid(Sender).Canvas.Font.Color := clGreen

  else if  QContas.FieldByName('DT_VENCIMENTO').AsDateTime < Date then
    TDBGrid(Sender).Canvas.Font.Color := clRed

  Else if QContas.FieldByName('DT_VENCIMENTO').AsDateTime = Date then
    TDBGrid(Sender).Canvas.Font.Color := clBlue;

 { if gdSelected in State then
  begin
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color :=  clInfoBk;

      FillRect(Rect);

      Brush.Color := clInfoBk;
      OldBkMode   := SetBkMode(Handle, TRANSPARENT);

      SetBkMode(Handle, OldBkMode);

      Font.Style := [fsBold];
    end;
  end;}
  TDBGrid(Sender).DefaultDrawDataCell(Rect, TDBGrid(Sender).Columns[DataCol].Field, State);

end;

procedure TFrmTrans_Recebimento_Lote.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_F3) and (not QContas.IsEmpty) then
  begin

    Prorroga(QContas.FieldByName('TRANSACAO_ID').AsInteger, QContas.FieldByName('PARCELA_ID').AsString, QContas.FieldByName('TIPO_TRANSACAO').AsString);
    Seleciona;
  end;


  if Key = VK_F9 then
    Perform(Wm_NextDlgCtl, 0, 0);

  if Key = VK_Return then
  begin
    QOrcamento.Sql.Clear;
    QOrcamento.Sql.Add('SELECT DISTINCT TRANSACOES.TRANSACAO_ID, TRANSACOES.DT_TRANS, TRANSACOES.NUM_DOC, TRANSACOES.HISTORICO, TRANSACOES.VALOR');
    QOrcamento.Sql.Add('FROM TRANSACOES');
    QOrcamento.Sql.Add('INNER JOIN TRANSPARCELAS');
    QOrcamento.Sql.Add('ON (TRANSACOES.TRANSACAO_ID = TRANSPARCELAS.TRANSACAO_ID)');
    QOrcamento.Sql.Add('WHERE');
    QOrcamento.Sql.Add('(TRANSPARCELAS.AGRUPAMENTO = :AGRUPAMENTO)');
    QOrcamento.Sql.Add('ORDER BY TRANSACOES.DT_TRANS');

    QOrcamento.ParamByName('AGRUPAMENTO').AsInteger := QContas.FieldByName('TRANSACAO_ID').AsInteger;

    QOrcamento.Prepare;
    QOrcamento.Open;

    if not QOrcamento.IsEmpty then
    begin
      Application.CreateForm(TFrmAgrupamento, FrmAgrupamento);
      try
        FrmAgrupamento.ShowModal;
      finally
        FrmAgrupamento.Release;
      end;
    end
    else
      Application.MessageBox('Não há agrupamento para este lançamento', PChar(Msg_Title), mb_IconInformation);
  end;
end;

procedure TFrmTrans_Recebimento_Lote.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmTrans_Recebimento_Lote.DtmenExit(Sender: TObject);
begin
  Dtmai.Date    := Ult_Dia_Mes(Dtmen.Date);
  Dtmai.MinDate := Dtmen.Date;
end;

procedure TFrmTrans_Recebimento_Lote.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmTrans_Recebimento_Lote.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmTrans_Recebimento_Lote.FormCreate(Sender: TObject);
var
Temp_Name: String;
begin
  with Table_Temp do
  begin
    DatabaseName := ExtractFilePath(ParamStr(0));
    Temp_Name    := Copy(TimeToStr(time), 1, 2) + Copy(TimeToStr(time), 4, 2) + Copy(TimeToStr(time), 7, 2);
    TableName    := Temp_Name;

    with FieldDefs do
    begin
      Clear;
      Add('ACESSO', ftAutoInc, 0, False);
      Add('NOME', ftString, 70, False);
      Add('ENDERECO', ftString, 60, False);
      Add('NUMERO', ftString, 6, False);
      Add('TRANSACAO_ID', ftInteger, 0, False);
      Add('PARCELA_ID', ftString, 5, False);
      Add('TIPO_TRANSACAO', ftString, 1, False);
      Add('DT_VENCIMENTO', ftDate, 0, False);
      Add('BANCO_ID', ftInteger, 0, False);
      Add('VALOR', ftFloat, 0, False);
      Add('PAGTO', ftString, 1, False);
      Add('DUPLICATA', ftString, 1, False);
      Add('ESPECIE', ftString, 1, False);
      Add('HISTORICO', ftString, 150, False);
      Add('NUM_DOC', ftString, 7, False);
      Add('CONTA_ID', ftInteger, 0, False);
      Add('VENDEDOR_ID', ftInteger, 0, False);
      Add('EMPRESA_ID', ftInteger, 0, False);
      Add('TPCTB', ftString, 0, False);
      Add('C_CUSTO_ID', ftInteger, 0, False);
      Add('CLIENTE_ID', ftInteger, 0, False);
      Add('MES_ANO', ftString, 7, False);
    end;

    with IndexDefs do
    begin
      Clear;
      Add('', 'ACESSO', [ixPrimary, ixUnique]);
      Add('TEMP', 'NOME;DT_VENCIMENTO', [ixCaseInsensitive]);
    end;

    CreateTable;
    IndexName := 'TEMP';
    Open;
  end;

  Dtmen.Date    := StrToDate('01/01/1900');
  Dtmai.Date    := StrToDate('01/01/2050'); // FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
  Dtmai.MinDate := Dtmen.Date;
  Caixa.Text    := LeIni(Arq_Ini, 'Sistema', 'Caixa');
end;

procedure TFrmTrans_Recebimento_Lote.FormDestroy(Sender: TObject);
begin
  Table_Temp.IndexName := '';
  Table_Temp.Close;
  Table_Temp.DeleteTable;
end;

procedure TFrmTrans_Recebimento_Lote.QContasAfterOpen(DataSet: TDataSet);
begin
  TFloatField(QContas.FieldByName('VALOR')).DisplayFormat          := '#,##0.00';
  TFloatField(QContas.FieldByName('VALOR_DESPESAS')).DisplayFormat := '#,##0.00';

  DBGrid1.Columns[0].Width := 300;
  DBGrid1.Columns[1].Width := 400;
  DBGrid1.Columns[2].Width := 113;
  DBGrid1.Columns[3].Width := 97;
  DBGrid1.Columns[4].Width := 56;
  DBGrid1.Columns[5].Width := 70;
  DBGrid1.Columns[6].Width := 90;
  //DBGrid1.Columns[7].Width := 90;
end;

procedure TFrmTrans_Recebimento_Lote.QOrcamentoAfterOpen(DataSet: TDataSet);
begin
  TFloatField(QOrcamento.FieldByName('VALOR')).DisplayFormat := '#,##0.00';
end;

procedure TFrmTrans_Recebimento_Lote.ClienteExit(Sender: TObject);
begin
  Seleciona;
end;

procedure TFrmTrans_Recebimento_Lote.ClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = Cliente) then
    btnClienteClick(Self);

  if (Key = Vk_F7) and (Sender = Caixa) then
    btnCaixaClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

end.
