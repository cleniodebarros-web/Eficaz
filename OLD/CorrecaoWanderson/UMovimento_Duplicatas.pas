unit UMovimento_Duplicatas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, rxToolEdit, DB, IBCustomDataSet, IBQuery,
  QRCtrls, QuickRpt, Buttons, DBCtrls, rxCurrEdit, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmMovimento_Duplicatas = class(TForm)
    Label1: TLabel;
    Dtmen: TDateEdit;
    Dtmai: TDateEdit;
    Label3: TLabel;
    Tipo_Duplicata: TComboBox;
    Label2: TLabel;
    Bevel1: TBevel;
    Classe: TEdit;
    Duplicatas: TQuickRep;
    QRBand1: TQRBand;
    QRSysData1: TQRSysData;
    Cabec: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    QRDBText3: TQRDBText;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel15: TQRLabel;
    QRShape3: TQRShape;
    btnExecuta: TBitBtn;
    btnRetorna: TBitBtn;
    Ordem: TComboBox;
    Label4: TLabel;
    QRBand4: TQRBand;
    QRExpr1: TQRExpr;
    QRBand3: TQRBand;
    QRExpr2: TQRExpr;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    Label5: TLabel;
    Id: TCurrencyEdit;
    btnFornecedor: TSpeedButton;
    DBText1: TDBText;
    DataFornecedor: TDataSource;
    QRLabel6: TQRLabel;
    QRDBText4: TQRDBText;
    Label16: TLabel;
    FINALIZADORA_ID: TDBLookupComboBox;
    DataFinalizadora: TDataSource;
    QRLabel7: TQRLabel;
    Chk_pagto_Cartao: TCheckBox;
    Operador: TEdit;
    Label6: TLabel;
    btn_operador: TSpeedButton;
    QRLabel8: TQRLabel;
    QRGroup1: TQRGroup;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel9: TQRLabel;
    DBText2: TDBText;
    DsOperadores: TDataSource;
    Duplicatas_Sintetico: TQuickRep;
    QRBand5: TQRBand;
    QRSysData3: TQRSysData;
    QRLabel13: TQRLabel;
    QRSysData4: TQRSysData;
    QRLabel14: TQRLabel;
    QRShape2: TQRShape;
    QRDBText9: TQRDBText;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape4: TQRShape;
    QRBand6: TQRBand;
    QRDBText10: TQRDBText;
    QRDBText13: TQRDBText;
    QRBand7: TQRBand;
    QRExpr3: TQRExpr;
    QRLabel26: TQRLabel;
    QRBand8: TQRBand;
    QRExpr4: TQRExpr;
    QRLabel27: TQRLabel;
    QRGroup2: TQRGroup;
    QRDBText16: TQRDBText;
    Chk_Sintetico: TCheckBox;
    QRLabel19: TQRLabel;
    Chk_Sintetico_Recebidas: TCheckBox;
    Duplicatas_Sintetico_Recebidas: TQuickRep;
    QRBand9: TQRBand;
    QRSysData5: TQRSysData;
    QRLabel22: TQRLabel;
    QRSysData6: TQRSysData;
    QRLabel23: TQRLabel;
    QRShape5: TQRShape;
    QRDBText11: TQRDBText;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRShape6: TQRShape;
    QRBand10: TQRBand;
    QRDBText12: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText17: TQRDBText;
    QRBand11: TQRBand;
    QRExpr5: TQRExpr;
    QRLabel36: TQRLabel;
    QRBand12: TQRBand;
    QRExpr6: TQRExpr;
    QRLabel37: TQRLabel;
    QFinalizadora: TFDQuery;
    QFornecedor: TFDQuery;
    QSearch: TFDQuery;
    QRel: TFDQuery;
    QOperador: TFDQuery;
    Chk_pagto: TCheckBox;
    Chk_Empresa: TCheckBox;
    procedure btnRetornaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Tipo_DuplicataKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DtmenEnter(Sender: TObject);
    procedure btnFornecedorClick(Sender: TObject);
    procedure Tipo_DuplicataChange(Sender: TObject);
    procedure IdExit(Sender: TObject);
    procedure Chk_pagtoClick(Sender: TObject);
    procedure Chk_pagto_CartaoClick(Sender: TObject);
    procedure btn_operadorClick(Sender: TObject);
    procedure OperadorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DuplicatasBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure OperadorExit(Sender: TObject);
    procedure Chk_SinteticoClick(Sender: TObject);
    procedure Chk_Sintetico_RecebidasClick(Sender: TObject);
  private
    procedure FuncionarioSearch;
    { Private declarations }
  public
    { Public declarations }
    procedure FornecedorSearch;
    procedure ClienteSearch;
  end;

var
  FrmMovimento_Duplicatas: TFrmMovimento_Duplicatas;

implementation

uses
  UPrincipal, UData,UConsulta;

{$R *.dfm}

procedure TFrmMovimento_Duplicatas.FornecedorSearch;
begin
  QFornecedor.SQL.Clear;
  QFornecedor.SQL.Add('SELECT * FROM FORNECEDORES WHERE FORNECEDOR_ID = :FORNECEDOR_ID');
  QFornecedor.ParamByName('FORNECEDOR_ID').AsInteger := StrToInt(Id.Text);
  QFornecedor.Prepare;
  QFornecedor.Open;
end;

procedure TFrmMovimento_Duplicatas.Chk_pagtoClick(Sender: TObject);
begin
  if Chk_pagto.Checked then
  begin
    QFinalizadora.Close;
    QFinalizadora.SQL.Clear;
    QFinalizadora.Sql.Add('SELECT * FROM FINALIZADORAS WHERE (TIPO_TRANSACAO = 1) OR (TIPO_TRANSACAO = 3) ');
    QFinalizadora.Prepare;
    QFinalizadora.Open;

    Finalizadora_id.KeyValue := 1;
    FINALIZADORA_ID.Enabled  := True;
    Chk_pagto_Cartao.Enabled := True;
    Chk_Sintetico.enabled    := False;
    Chk_Sintetico.Checked    := False;
    Chk_Sintetico_Recebidas.Enabled := False;
    Chk_Sintetico_Recebidas.Checked := False;
  end
  else
  begin
    FINALIZADORA_ID.Enabled  := False;
    Chk_pagto_Cartao.Enabled := False;
    Chk_Sintetico.enabled    := True;
    Chk_Sintetico_Recebidas.Enabled := True;
  end;
end;

procedure TFrmMovimento_Duplicatas.Chk_pagto_CartaoClick(Sender: TObject);
begin
if Chk_pagto_Cartao.Checked then
FINALIZADORA_ID.Enabled := False
Else
FINALIZADORA_ID.Enabled := True;

end;

procedure TFrmMovimento_Duplicatas.Chk_SinteticoClick(Sender: TObject);
begin
  if not Chk_Sintetico.Checked then
  Begin
  Chk_Pagto.Enabled       := True;
  chk_sintetico_recebidas.Enabled := True;
  End
  Else
  Begin
  Chk_pagto.Checked       := False;
  Chk_Sintetico_Recebidas.Checked := False;
  Chk_pagto.Enabled       := False;
  Finalizadora_id.Enabled := False;
  chk_sintetico_recebidas.Enabled := False;
  End;
end;

procedure TFrmMovimento_Duplicatas.Chk_Sintetico_RecebidasClick(
  Sender: TObject);
begin
  if Chk_sintetico_recebidas.checked then
  Begin
  Chk_Sintetico.Enabled := False;
  Chk_Pagto.enabled     := False;
  Chk_sintetico.Checked := False;
  Chk_Pagto.Checked     := False;
  End
  Else
  Begin
  Chk_Sintetico.Enabled := True;
  Chk_Pagto.enabled     := True;
  End;

end;

procedure TFrmMovimento_Duplicatas.ClienteSearch;
begin
  QFornecedor.SQL.Clear;
  QFornecedor.SQL.Add('SELECT * FROM CLIENTES WHERE CLIENTE_ID = :CLIENTE_ID');
  QFornecedor.ParamByName('CLIENTE_ID').AsInteger := StrToInt(Id.Text);
  QFornecedor.Prepare;
  QFornecedor.Open;
end;

procedure TFrmMovimento_Duplicatas.FuncionarioSearch;
begin
  QOperador.Close; 
  QOperador.ParamByName('FUNCIONARIO_ID').AsInteger := StrToInt(Operador.Text);
  QOperador.Prepare;
  QOperador.Open;
end;


procedure TFrmMovimento_Duplicatas.btnExecutaClick(Sender: TObject);
begin
// 177, 327
  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    if Tipo_Duplicata.Text <> '' then
    begin
      QRel.Sql.Clear;

      if Tipo_Duplicata.Text = 'Emitidas pela Empresa' then
      begin

        QRel.Sql.Add('SELECT TRANSACOES.DT_TRANS, TRANSACOES.HISTORICO, TRANSACOES.VALOR, CLIENTES.NOME,');
        QRel.Sql.Add('CASE WHEN (DATE(:TODAY) - DATE(TRANSACOES.DT_TRANS)) > 0 THEN (DATE(:TODAY) - DATE(TRANSACOES.DT_TRANS))  ELSE 0 END ATRASO');
        QRel.Sql.Add('FROM TRANSACOES');
        QRel.Sql.Add('INNER JOIN CLIENTES');
        QRel.Sql.Add('ON (TRANSACOES.CLIENTE_ID = CLIENTES.CLIENTE_ID)');
        QRel.Sql.Add('WHERE');
        QRel.Sql.Add('(TRANSACOES.CONDUTA = :CONDUTA)');

        if not Chk_Empresa.Checked then
        QRel.Sql.Add('AND(TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');

        QRel.Sql.Add('AND (TRANSACOES.COND_PAGTO = :COND_PAGTO)');

        if Classe.Text <> '' then
        begin
          QRel.Sql.Add('AND (CLIENTES.TIPO = :CLASSE)');
          QRel.ParamByName('CLASSE').AsString := Classe.Text;
        end;

        if not Chk_Empresa.Checked then
        QRel.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;

        QRel.ParamByName('CONDUTA').AsString     := '01';
        QRel.ParamByName('COND_PAGTO').AsString  := 'A PRAZO';
        QRel.ParamByName('TODAY').AsString       := DateToStr(Date);

        QRDBText5.Enabled := False;
        QRLabel11.Enabled := False;
      end;

      if Tipo_Duplicata.Text = 'Emitidas Contra a Empresa' then
      begin

        QRel.Sql.Add('SELECT TRANSACOES.DT_TRANS, TRANSACOES.HISTORICO, TRANSACOES.VALOR, FORNECEDORES.NOME,');
        QRel.Sql.Add('CASE WHEN (DATE(:TODAY) - DATE(TRANSACOES.DT_TRANS)) > 0 THEN (DATE(:TODAY) - DATE(TRANSACOES.DT_TRANS))  ELSE 0 END ATRASO');
        QRel.Sql.Add('FROM TRANSACOES');
        QRel.Sql.Add('INNER JOIN FORNECEDORES');
        QRel.Sql.Add('ON (TRANSACOES.FORNECEDOR_ID = FORNECEDORES.FORNECEDOR_ID)');
        QRel.Sql.Add('WHERE');
        QRel.Sql.Add('(TRANSACOES.CONDUTA = :CONDUTA)');

        if not Chk_Empresa.Checked then
        QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');

        QRel.Sql.Add('AND (TRANSACOES.COND_PAGTO = :COND_PAGTO)');

        if Classe.Text <> '' then
        begin
          QRel.Sql.Add('AND (FORNECEDORES.TIPO = :CLASSE)');
          QRel.ParamByName('CLASSE').AsString := Classe.Text;
        end;

        if not Chk_Empresa.Checked then
        QRel.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;

        QRel.ParamByName('CONDUTA').AsString     := '02';
        QRel.ParamByName('COND_PAGTO').AsString  := 'A PRAZO';
        QRel.ParamByName('TODAY').AsDateTime     := Date;

        QRDBText5.Enabled := False;
        QRLabel11.Enabled := False;
      end;

      if Tipo_Duplicata.Text = 'Recebidas pela Empresa' then
      begin
        if chk_Sintetico.Checked then
        Begin

         QRel.Sql.Add('SELECT  FUNCIONARIO, FINALIZADORA, SUM(VALOR) VALOR');
         QRel.Sql.Add('FROM( ');
         QRel.Sql.Add('SELECT  FUNCIONARIOS.NOME FUNCIONARIO,  TRANSACOES.PAGAMENTO FINALIZADORA, CASE WHEN (TRANSACOES.SERIE = :SERIED) THEN (TRANSACOES.VALOR_PARCELA)');
         QRel.Sql.Add('WHEN (TRANSACOES.SERIE = :SERIEJ) THEN (TRANSACOES.VALOR_PARCELA) ELSE TRANSACOES.VALOR END VALOR ');
         QRel.Sql.Add('FROM TRANSACOES');
         QRel.Sql.Add('INNER JOIN TRANSPARCELAS');
         QRel.Sql.Add('ON (TRANSACOES.SAIDA_ID = TRANSPARCELAS.TRANSACAO_ID AND TRANSACOES.PARCELA_ID = TRANSPARCELAS.PARCELA_ID)');
         QRel.Sql.Add('INNER JOIN FUNCIONARIOS ON FUNCIONARIOS.FUNCIONARIO_ID = TRANSACOES.AUTORIZ_ID');
         QRel.Sql.Add('WHERE');
         QRel.Sql.Add('(TRANSACOES.CONDUTA = :CONDUTA)');

         if not Chk_Empresa.Checked then
         QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');

         QRel.Sql.Add('AND (CAST(TRANSACOES.TPCTB AS TEXT) <= :TPCTB)');
         QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM TRANSACOES WHERE HISTORICO LIKE ' + #39 + 'Ref. Devolução%' + #39 + '))');
         QRel.Sql.Add('AND (TRANSPARCELAS.TIPO_TRANSACAO = :TIPO_TRANSACAO)');
         QRel.Sql.Add('AND (CAST(TRANSACOES.TPCTB AS INTEGER) <= 2)');
         QRel.Sql.Add('AND (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');

         if  StrToInt(Operador.Text) > 0 then
         begin
          QRel.Sql.Add('AND (TRANSACOES.AUTORIZ_ID = :FUNCIONARIO_ID)');
          QRel.ParamByName('FUNCIONARIO_ID').AsInteger  := StrToInt(Operador.Text);
         end;

         QRel.Sql.Add('UNION ALL');
         QRel.Sql.Add('SELECT   FUNCIONARIOS.NOME FUNCIONARIO, TRANSACOES.PAGAMENTO FINALIZADORA, (TRANSACOES.VALOR - TRANSACOES.VALOR_PARCELA) VALOR');
         QRel.Sql.Add('FROM TRANSACOES');
         QRel.Sql.Add('INNER JOIN TRANSPARCELAS');
         QRel.Sql.Add('ON (TRANSACOES.SAIDA_ID = TRANSPARCELAS.TRANSACAO_ID AND TRANSACOES.PARCELA_ID = TRANSPARCELAS.PARCELA_ID)');
         QRel.Sql.Add('INNER JOIN FUNCIONARIOS ON FUNCIONARIOS.FUNCIONARIO_ID = TRANSACOES.AUTORIZ_ID ');
         QRel.Sql.Add('WHERE (TRANSACOES.CONDUTA = :CONDUTA) AND (TRANSACOES.SERIE = :SERIEJ) ');

         if not Chk_Empresa.Checked then
         QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID) ');

         QRel.Sql.Add('AND (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');

         if  StrToInt(Operador.Text) > 0 then
         begin
          QRel.Sql.Add('AND (TRANSACOES.AUTORIZ_ID = :FUNCIONARIO_ID)');
          QRel.ParamByName('FUNCIONARIO_ID').AsInteger  := StrToInt(Operador.Text);
         end;

         QRel.Sql.Add('UNION ALL');
         QRel.Sql.Add('SELECT FUNCIONARIOS.NOME FUNCIONARIO , TRANSACOES.PAGAMENTO FINALIZADORA, (TRANSACOES.VALOR - TRANSACOES.VALOR_PARCELA) VALOR');
         QRel.Sql.Add('FROM TRANSACOES');
         QRel.Sql.Add('INNER JOIN TRANSPARCELAS');
         QRel.Sql.Add('ON (TRANSACOES.SAIDA_ID = TRANSPARCELAS.TRANSACAO_ID AND TRANSACOES.PARCELA_ID = TRANSPARCELAS.PARCELA_ID)');
         QRel.Sql.Add('INNER JOIN FUNCIONARIOS ON FUNCIONARIOS.FUNCIONARIO_ID = TRANSACOES.AUTORIZ_ID');
         QRel.Sql.Add('WHERE (TRANSACOES.CONDUTA = :CONDUTA) AND (TRANSACOES.SERIE = :SERIED) ');

         if not Chk_Empresa.Checked then
            QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID) ');

         QRel.Sql.Add('AND (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');

         if  StrToInt(Operador.Text) > 0 then
         begin
         QRel.Sql.Add('AND (TRANSACOES.AUTORIZ_ID = :FUNCIONARIO_ID)');
         QRel.ParamByName('FUNCIONARIO_ID').AsInteger  := StrToInt(Operador.Text);
         end;
         QRel.Sql.Add(') as teste');
         QRel.Sql.Add('GROUP BY FUNCIONARIO, FINALIZADORA');

         QRel.ParamByName('TIPO_TRANSACAO').AsString := 'T';
         QRel.ParamByName('SERIEJ').AsString         := 'J';
         QRel.ParamByName('SERIED').AsString         := 'D';


        End
        Else if Chk_Sintetico_Recebidas.Checked then
        Begin
         QRel.Sql.Add('SELECT TRANSACOES.DT_TRANS, CLIENTES.NOME, SUM(TRANSACOES.VALOR) VALOR');
         QRel.Sql.Add('FROM TRANSACOES');
         QRel.Sql.Add('INNER JOIN CLIENTES ON CLIENTES.CLIENTE_ID = TRANSACOES.CLIENTE_ID');
         QRel.Sql.Add('WHERE');
         QRel.Sql.Add('(TRANSACOES.CONDUTA = :CONDUTA)');

          if not Chk_Empresa.Checked then
         QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');

         QRel.Sql.Add('AND (CAST(TRANSACOES.TPCTB AS TEXT) <= :TPCTB)');
         QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM TRANSACOES WHERE HISTORICO LIKE ' + #39 + 'Ref. Devolução%' + #39 + '))');
         QRel.Sql.Add('AND (CAST(TRANSACOES.TPCTB AS INTEGER) <= 2)');
         QRel.Sql.Add('AND (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');

         if  StrToInt(Operador.Text) > 0 then
         begin
          QRel.Sql.Add('AND (TRANSACOES.AUTORIZ_ID = :FUNCIONARIO_ID)');
          QRel.ParamByName('FUNCIONARIO_ID').AsInteger  := StrToInt(Operador.Text);
         end;

         QRel.Sql.Add('GROUP BY DT_TRANS, NOME');

        End
        Else
        Begin

        QRel.Sql.Add('SELECT DT_TRANS,HISTORICO,VALOR,DT_VENCIMENTO,NOME,ATRASO,SERIE');
        QRel.Sql.Add('FROM(');
        QRel.Sql.Add('SELECT TRANSACOES.DT_TRANS, TRANSACOES.HISTORICO, CASE WHEN (TRANSACOES.SERIE = :SERIED) THEN (TRANSACOES.VALOR_PARCELA)');
        QRel.Sql.Add('WHEN (TRANSACOES.SERIE = :SERIEJ) THEN (TRANSACOES.VALOR_PARCELA) ELSE TRANSACOES.VALOR END VALOR , TRANSPARCELAS.DT_VENCIMENTO, CLIENTES.NOME,');
        QRel.Sql.Add('CASE WHEN (TRANSACOES.DT_TRANS - TRANSPARCELAS.DT_VENCIMENTO) > 0 THEN (TRANSACOES.DT_TRANS - TRANSPARCELAS.DT_VENCIMENTO) ELSE 0 END ATRASO,TRANSACOES.SERIE');
        QRel.Sql.Add('FROM TRANSACOES');
        QRel.Sql.Add('INNER JOIN TRANSPARCELAS');
        QRel.Sql.Add('ON (TRANSACOES.SAIDA_ID = TRANSPARCELAS.TRANSACAO_ID AND TRANSACOES.PARCELA_ID = TRANSPARCELAS.PARCELA_ID)');
        QRel.Sql.Add('INNER JOIN CLIENTES');
        QRel.Sql.Add('ON (TRANSACOES.CLIENTE_ID = CLIENTES.CLIENTE_ID)');
        QRel.Sql.Add('WHERE');
        QRel.Sql.Add('(TRANSACOES.CONDUTA = :CONDUTA)');

        if not Chk_Empresa.Checked then
        QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');

        QRel.Sql.Add('AND (CAST(TRANSACOES.TPCTB AS TEXT) <= :TPCTB)');
        QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM TRANSACOES WHERE HISTORICO LIKE ' + #39 + 'Ref. Devolução%' + #39 + '))');
        QRel.Sql.Add('AND (TRANSPARCELAS.TIPO_TRANSACAO = :TIPO_TRANSACAO)');
        QRel.Sql.Add('AND (CAST(TRANSACOES.TPCTB AS TEXT) <= :TPCTB)');
        QRel.Sql.Add('AND (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');

          if Id.Value > 0 then
          begin
            QRel.Sql.Add('AND (CLIENTES.CLIENTE_ID = :CLIENTE_ID)');
            QRel.ParamByName('CLIENTE_ID').AsInteger := StrToInt(Id.Text);
          end;

          if Classe.Text <> '' then
          begin
            QRel.Sql.Add('AND (CLIENTES.TIPO = :CLASSE)');
            QRel.ParamByName('CLASSE').AsString := Classe.Text;
          end;

          if (Chk_pagto.Checked) and (not Chk_pagto_Cartao.Checked) then
          begin
           QRel.Sql.Add('AND (TRANSACOES.PAGAMENTO = :PAGAMENTO)');
           QRel.ParamByName('PAGAMENTO').AsString  := QFinalizadora.FieldByName('LEGENDA').AsString;
          end;

          if Chk_pagto_cartao.Checked then
          begin
           QRel.Sql.Add('AND (TRANSACOES.PAGAMENTO LIKE :PAGAMENTO)');
           QRel.ParamByName('PAGAMENTO').AsString  := 'Cart%';
          end;

          if  StrToInt(Operador.Text) > 0 then
          begin
           QRel.Sql.Add('AND (TRANSACOES.AUTORIZ_ID = :FUNCIONARIO_ID)');
           QRel.ParamByName('FUNCIONARIO_ID').AsInteger  := StrToInt(Operador.Text);
          end;

         QRel.Sql.Add('UNION ALL');
         QRel.Sql.Add('SELECT TRANSACOES.DT_TRANS, CAST(:JUROS AS VARCHAR(15)) HISTORICO, (TRANSACOES.VALOR - TRANSACOES.VALOR_PARCELA) VALOR,');
         QRel.Sql.Add('TRANSPARCELAS.DT_VENCIMENTO, CLIENTES.NOME, 0 ATRASO,TRANSACOES.SERIE');
         QRel.Sql.Add('FROM TRANSACOES');
         QRel.Sql.Add('INNER JOIN TRANSPARCELAS');
         QRel.Sql.Add('ON (TRANSACOES.SAIDA_ID = TRANSPARCELAS.TRANSACAO_ID AND TRANSACOES.PARCELA_ID = TRANSPARCELAS.PARCELA_ID)');
         QRel.Sql.Add('INNER JOIN CLIENTES');
         QRel.Sql.Add('ON (TRANSACOES.CLIENTE_ID = CLIENTES.CLIENTE_ID)');
         QRel.Sql.Add('WHERE (TRANSACOES.CONDUTA = :CONDUTA) AND (TRANSACOES.SERIE = :SERIEJ) ');

         if not Chk_Empresa.Checked then
         QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID) ');

         QRel.Sql.Add('AND (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');

         if Id.Value > 0 then
          begin
            QRel.Sql.Add('AND (CLIENTES.CLIENTE_ID = :CLIENTE_ID)');
            QRel.ParamByName('CLIENTE_ID').AsInteger := StrToInt(Id.Text);
          end;

          if Classe.Text <> '' then
          begin
            QRel.Sql.Add('AND (CLIENTES.TIPO = :CLASSE)');
            QRel.ParamByName('CLASSE').AsString := Classe.Text;
          end;

          if (Chk_pagto.Checked) and (not Chk_pagto_Cartao.Checked) then
          begin
           QRel.Sql.Add('AND (TRANSACOES.PAGAMENTO = :PAGAMENTO)');
           QRel.ParamByName('PAGAMENTO').AsString  := QFinalizadora.FieldByName('LEGENDA').AsString;
          end;

          if Chk_pagto_cartao.Checked then
          begin
           QRel.Sql.Add('AND (TRANSACOES.PAGAMENTO LIKE :PAGAMENTO)');
           QRel.ParamByName('PAGAMENTO').AsString  := QuotedStr('Cart%') ;
          end;

          if  StrToInt(Operador.Text) > 0 then
          begin
           QRel.Sql.Add('AND (TRANSACOES.AUTORIZ_ID = :FUNCIONARIO_ID)');
           QRel.ParamByName('FUNCIONARIO_ID').AsInteger  := StrToInt(Operador.Text);
          end;

         QRel.Sql.Add('UNION ALL');
         QRel.Sql.Add('SELECT TRANSACOES.DT_TRANS, CAST(:DESCONTOS AS VARCHAR(20)) HISTORICO, (TRANSACOES.VALOR - TRANSACOES.VALOR_PARCELA) VALOR,');
         QRel.Sql.Add('TRANSPARCELAS.DT_VENCIMENTO, CLIENTES.NOME, 0 ATRASO,TRANSACOES.SERIE');
         QRel.Sql.Add('FROM TRANSACOES');
         QRel.Sql.Add('INNER JOIN TRANSPARCELAS');
         QRel.Sql.Add('ON (TRANSACOES.SAIDA_ID = TRANSPARCELAS.TRANSACAO_ID AND TRANSACOES.PARCELA_ID = TRANSPARCELAS.PARCELA_ID)');
         QRel.Sql.Add('INNER JOIN CLIENTES');
         QRel.Sql.Add('ON (TRANSACOES.CLIENTE_ID = CLIENTES.CLIENTE_ID)');
         QRel.Sql.Add('WHERE (TRANSACOES.CONDUTA =:CONDUTA) AND (TRANSACOES.SERIE =:SERIED)');

         if not Chk_Empresa.Checked then
         QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');

         QRel.Sql.Add('AND (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');

          if Id.Value > 0 then
          begin
            QRel.Sql.Add('AND (CLIENTES.CLIENTE_ID = :CLIENTE_ID)');
            QRel.ParamByName('CLIENTE_ID').AsInteger := StrToInt(Id.Text);
          end;

          if Classe.Text <> '' then
          begin
            QRel.Sql.Add('AND (CLIENTES.TIPO = :CLASSE)');
            QRel.ParamByName('CLASSE').AsString := Classe.Text;
          end;

          if (Chk_pagto.Checked) and (not Chk_pagto_Cartao.Checked) then
          begin
           QRel.Sql.Add('AND (TRANSACOES.PAGAMENTO = :PAGAMENTO)');
           QRel.ParamByName('PAGAMENTO').AsString  := QFinalizadora.FieldByName('LEGENDA').AsString;
          end;

          if Chk_pagto_cartao.Checked then
          begin
           QRel.Sql.Add('AND (TRANSACOES.PAGAMENTO LIKE :PAGAMENTO)');
           QRel.ParamByName('PAGAMENTO').AsString  := QuotedStr('Cart%');
          end;

          if  StrToInt(Operador.Text) > 0 then
          begin
           QRel.Sql.Add('AND (TRANSACOES.AUTORIZ_ID = :FUNCIONARIO_ID)');
           QRel.ParamByName('FUNCIONARIO_ID').AsInteger  := StrToInt(Operador.Text);
          end;


         QRel.Sql.Add(') as teste');

          if Ordem.Text = 'DATA, NOME' then
            QRel.Sql.Add('ORDER BY DT_TRANS, NOME')
          else if Ordem.Text = 'NOME, DATA' then
            QRel.Sql.Add('ORDER BY NOME, DT_TRANS')
          else if Ordem.Text = 'NOME' then
            QRel.Sql.Add('ORDER BY NOME')
          else if Ordem.Text = 'DATA' then
            QRel.Sql.Add('ORDER BY DT_TRANS');

          QRDBText5.Enabled := True;
          QRLabel11.Enabled := True;

          QRel.ParamByName('TIPO_TRANSACAO').AsString := 'T';
          QRel.ParamByName('JUROS').AsString          :='JUROS RECEBIDOS';
          QRel.ParamByName('DESCONTOS').AsString      :='DESCONTOS CONCEDIDOS';
          QRel.ParamByName('SERIEJ').AsString         :='J';
          QRel.ParamByName('SERIED').AsString         :='D';

        End;

          if not Chk_Empresa.Checked then
          QRel.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;

          QRel.ParamByName('CONDUTA').AsString        := '07';
          QRel.ParamByName('TPCTB').AsString          := FrmData.QAcesso.FieldByName('TPCTB').AsString;

          QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
          QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;

      end;

      if Tipo_Duplicata.Text = 'Pagas pela Empresa' then
      begin

        QRel.Sql.Add('SELECT TRANSACOES.DT_TRANS, TRANSACOES.HISTORICO, TRANSACOES.VALOR, TRANSPARCELAS.DT_VENCIMENTO, FORNECEDORES.NOME,');
        QRel.Sql.Add('CASE WHEN (TRANSACOES.DT_TRANS - TRANSPARCELAS.DT_VENCIMENTO) > 0 THEN (TRANSACOES.DT_TRANS - TRANSPARCELAS.DT_VENCIMENTO) ELSE 0 END ATRASO');
        QRel.Sql.Add('FROM TRANSACOES');
        QRel.Sql.Add('INNER JOIN TRANSPARCELAS');
        QRel.Sql.Add('ON (TRANSACOES.ENTRADA_ID = TRANSPARCELAS.TRANSACAO_ID AND TRANSACOES.PARCELA_ID = TRANSPARCELAS.PARCELA_ID)');
        QRel.Sql.Add('INNER JOIN FORNECEDORES');
        QRel.Sql.Add('ON (TRANSACOES.FORNECEDOR_ID = FORNECEDORES.FORNECEDOR_ID)');
        QRel.Sql.Add('WHERE');
        QRel.Sql.Add('(TRANSACOES.CONDUTA = :CONDUTA)');

        if not Chk_Empresa.Checked then
        QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');



        QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM TRANSACOES WHERE HISTORICO LIKE ' + #39 + 'Ref. Devolução%' + #39 + '))');
        QRel.Sql.Add('AND (TRANSPARCELAS.TIPO_TRANSACAO = :TIPO_TRANSACAO)');

        if Id.Value > 0 then
        begin
          QRel.Sql.Add('AND (FORNECEDORES.FORNECEDOR_ID = :FORNECEDOR_ID)');
          QRel.ParamByName('FORNECEDOR_ID').AsInteger := StrToInt(Id.Text);
        end;


        if Classe.Text <> '' then
        begin
          QRel.Sql.Add('AND (FORNECEDORES.TIPO = :CLASSE)');
          QRel.ParamByName('CLASSE').AsString := Classe.Text;
        end;

        if not Chk_Empresa.Checked then
        QRel.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;

        QRel.ParamByName('CONDUTA').AsString        := '08';
        QRel.ParamByName('TIPO_TRANSACAO').AsString := 'T';

        QRDBText5.Enabled := True;
        QRLabel11.Enabled := True;

       { QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
        QRel.Sql.Add('AND (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');

        QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
        QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;}

      end;

      if (Tipo_Duplicata.Text <> 'Recebidas pela Empresa') then
       Begin
       QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
       QRel.Sql.Add('AND (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
       End;


      if (Tipo_Duplicata.Text = 'Emitidas pela Empresa') then
      begin
        if Ordem.Text = 'DATA, NOME' then
          QRel.Sql.Add('ORDER BY TRANSACOES.DT_TRANS, CLIENTES.NOME')
        else if Ordem.Text = 'NOME, DATA' then
          QRel.Sql.Add('ORDER BY CLIENTES.NOME, TRANSACOES.DT_TRANS')
        else if Ordem.Text = 'NOME' then
          QRel.Sql.Add('ORDER BY CLIENTES.NOME')
        else if Ordem.Text = 'DATA' then
          QRel.Sql.Add('ORDER BY TRANSACOES.DT_TRANS');
      end
      else if (Tipo_Duplicata.Text = 'Emitidas Contra a Empresa') or (Tipo_Duplicata.Text = 'Pagas pela Empresa') then
      begin
        if Ordem.Text = 'DATA, NOME' then
          QRel.Sql.Add('ORDER BY TRANSACOES.DT_TRANS, FORNECEDORES.NOME')
        else if Ordem.Text = 'NOME, DATA' then
          QRel.Sql.Add('ORDER BY FORNECEDORES.NOME, TRANSACOES.DT_TRANS')
        else if Ordem.Text = 'NOME' then
          QRel.Sql.Add('ORDER BY FORNECEDORES.NOME')
        else if Ordem.Text = 'DATA' then
          QRel.Sql.Add('ORDER BY TRANSACOES.DT_TRANS');
      end;

      if (Tipo_Duplicata.Text <> 'Recebidas pela Empresa') then
      Begin
      QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
      QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
      QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
      End;


      QRel.Prepare;
      QRel.Open;

      QRLabel2.Caption := 'Tipo: ' + Tipo_Duplicata.Text;
      QRLabel1.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;

      if (Chk_Sintetico.Checked) then
      Begin
      QRLabel16.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;
      QRLabel19.Caption := 'Tipo: ' + Tipo_Duplicata.Text;
      End;

      if (Chk_Sintetico_recebidas .Checked) then
      Begin
      QRLabel24.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;
      QRLabel25.Caption := 'Tipo: ' + Tipo_Duplicata.Text;
      End;

      if QRel.IsEmpty then
        Application.MessageBox('Não há dados para os parâmetros informados', PChar(Msg_Title), mb_IconInformation)
      else
      Begin
        if (Chk_pagto.Checked) and (not Chk_pagto_Cartao.Checked) then
        QRLabel7.Caption := QFinalizadora.FieldByName('LEGENDA').AsString
        else if Chk_pagto_Cartao.Checked then
        QRLabel7.Caption := 'Todos os Cartões'
        Else
        QRLabel7.Caption := '';

        if (Chk_Sintetico.Checked) then
          Duplicatas_Sintetico.PreviewModal
        Else  if  Chk_sintetico_Recebidas.Checked then
          Duplicatas_Sintetico_recebidas. PreviewModal
        Else
        Duplicatas.PreviewModal;

      End;
    end;
  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
    //Close;
  end;
end;

procedure TFrmMovimento_Duplicatas.btnFornecedorClick(Sender: TObject);
begin
  if Tipo_duplicata.Text = 'Pagas pela Empresa' then
  Begin
  Id.Enabled := True;
  try
    Id.Value := GetConsulta('FORNECEDORES', 0, 0, StrToInt(Id.Text));
  except
    Id.Value := GetConsulta('FORNECEDORES', 0, 0, 0);
  end;
  End;

  if Tipo_duplicata.Text = 'Recebidas pela Empresa' then
  Begin
  Id.Enabled := True;
  try
    Id.Value := GetConsulta('CLIENTES', 0, 0, StrToInt(Id.Text));
  except
    Id.Value := GetConsulta('CLIENTES', 0, 0, 0);
  end;
  End;
end;

procedure TFrmMovimento_Duplicatas.btn_operadorClick(Sender: TObject);
begin
      try
        Operador.Text := IntToStr(GetConsulta('PESSOAL', 0, 0, StrToInt(Operador.Text)));
      except
        Operador.Text := IntToStr(GetConsulta('PESSOAL', 0, 0, 0));
      end;
end;

procedure TFrmMovimento_Duplicatas.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmMovimento_Duplicatas.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmMovimento_Duplicatas.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key = Vk_F7) and (Sender = Operador) then
     btn_operadorClick(Self);

  if Key = Vk_Return then
  //  Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmMovimento_Duplicatas.DuplicatasBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin

   if StrToInt(Operador.Text)  > 0 then
   begin

     QSearch.Close;
     QSearch.SQL.Clear;
     QSearch.Sql.Add('SELECT NOME FROM FUNCIONARIOS');
     QSearch.Sql.Add('WHERE FUNCIONARIO_ID = :FUNCIONARIO_ID');
     QSearch.ParamByName('FUNCIONARIO_ID').AsInteger := StrToInt(Operador.Text);
     QSearch.Prepare;
     QSearch.Open;
     QRLabel8.Caption := 'OPERADOR: '+ Copy( QSearch.FieldByName('NOME').AsString, 1,40) ;

   end
   else
     QRLabel8.Caption := '';

end;

procedure TFrmMovimento_Duplicatas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmMovimento_Duplicatas.FormCreate(Sender: TObject);
begin
  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);

end;

procedure TFrmMovimento_Duplicatas.IdExit(Sender: TObject);
begin
if Tipo_duplicata.Text = 'Recebidas pela Empresa' then
ClienteSearch;
if Tipo_duplicata.Text = 'Pagas pela Empresa' then
FornecedorSearch;

end;

procedure TFrmMovimento_Duplicatas.OperadorExit(Sender: TObject);
begin
  FuncionarioSearch;

  if (QOperador.IsEmpty) and (Operador.Text <> '0') then
  begin
    Application.MessageBox('Funcionário não Localizado.', 'Movimento Duplicatas', MB_IconStop + MB_OK);
    Operador.Text := '0';
    Operador.SetFocus;
    Abort;
  end;

end;

procedure TFrmMovimento_Duplicatas.OperadorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if (Key = Vk_F7) and (Sender = Operador) then
     btn_operadorClick(Self);

    if (Key = Vk_F7) and (Sender = ID) then
     btnFORNECEDORClick(Self);

   if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmMovimento_Duplicatas.Tipo_DuplicataChange(Sender: TObject);
begin
 if (Tipo_Duplicata.Text = 'Recebidas pela Empresa') OR (Tipo_Duplicata.Text = 'Pagas pela Empresa')  then
 Begin
 Id.Enabled              := True;
 BtnFornecedor.Enabled   := True;
 Id.Value                := 0; 
 End
 Else
 Begin
 Id.Enabled              := False;
 BtnFornecedor.Enabled   := False;
 Id.Value                := 0;
 End;

 if (Tipo_Duplicata.Text = 'Recebidas pela Empresa') then
  begin
    btn_operador.Enabled  := True;
    Operador.Enabled      := True;
    Chk_sintetico.Enabled := True;
    Chk_sintetico_Recebidas.Enabled := True;
    Chk_pagto.Enabled     := True;


  end
 Else
 begin
      btn_operador.Enabled  := False;
      Operador.Enabled      := False;
      Chk_sintetico.Enabled := False;
      Chk_sintetico_Recebidas.Enabled := False;
      Chk_pagto.Enabled     := False;
 end;

end;

procedure TFrmMovimento_Duplicatas.Tipo_DuplicataKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

end.
