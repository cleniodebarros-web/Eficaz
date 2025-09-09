unit URelatorio_Duplicatas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, rxToolEdit, DB, IBCustomDataSet, IBQuery,
  QRCtrls, QuickRpt, Buttons, DBCtrls, rxCurrEdit, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Datasnap.DBClient, frxClass,
  frxDBSet, frxExportBaseDialog, frxExportXLSX;

type
  TFrmRelatorio_Duplicatas = class(TForm)
    Label1: TLabel;
    Dtmen: TDateEdit;
    Dtmai: TDateEdit;
    Label3: TLabel;
    Tipo_Lancamento: TComboBox;
    Label2: TLabel;
    Bevel1: TBevel;
    Classe: TEdit;
    btnExecuta: TBitBtn;
    btnRetorna: TBitBtn;
    Ordem: TComboBox;
    Label4: TLabel;
    Label5: TLabel;
    Id: TCurrencyEdit;
    btnFornecedor: TSpeedButton;
    DBText1: TDBText;
    DataFornecedor: TDataSource;
    Label16: TLabel;
    FINALIZADORA_ID: TDBLookupComboBox;
    DataFinalizadora: TDataSource;
    Chk_pagto_Cartao: TCheckBox;
    Operador: TEdit;
    Label6: TLabel;
    btn_operador: TSpeedButton;
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
    QRDBText15: TQRDBText;
    QRDBText18: TQRDBText;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRLabel29: TQRLabel;
    QRLabel32: TQRLabel;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    Duplicatas_Empresa: TQuickRep;
    QRBand13: TQRBand;
    QRSysData7: TQRSysData;
    QRLabel34: TQRLabel;
    QRSysData8: TQRSysData;
    QRLabel35: TQRLabel;
    QRShape7: TQRShape;
    QRDBText21: TQRDBText;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRShape8: TQRShape;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRBand14: TQRBand;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRBand15: TQRBand;
    QRExpr11: TQRExpr;
    QRLabel48: TQRLabel;
    QRBand16: TQRBand;
    QRExpr12: TQRExpr;
    QRLabel49: TQRLabel;
    QRGroup3: TQRGroup;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRLabel50: TQRLabel;
    QRDBText30: TQRDBText;
    QConta: TFDQuery;
    DataConta: TDataSource;
    Duplicatas_Sintetico_Funcionario: TQuickRep;
    QRBand17: TQRBand;
    QRSysData9: TQRSysData;
    QRLabel51: TQRLabel;
    QRSysData10: TQRSysData;
    QRLabel52: TQRLabel;
    QRShape9: TQRShape;
    QRDBText31: TQRDBText;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel57: TQRLabel;
    QRShape10: TQRShape;
    QRLabel58: TQRLabel;
    QRBand18: TQRBand;
    QRDBText32: TQRDBText;
    QRBand19: TQRBand;
    QRExpr13: TQRExpr;
    QRLabel59: TQRLabel;
    QRBand20: TQRBand;
    QRExpr14: TQRExpr;
    QRLabel60: TQRLabel;
    QRGroup4: TQRGroup;
    QRDBText34: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    QRDBText37: TQRDBText;
    QRDBText38: TQRDBText;
    QRLabel56: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    Chk_sintetico_funcionario: TCheckBox;
    Label7: TLabel;
    CONTA_ID: TCurrencyEdit;
    DBText3: TDBText;
    btnConta: TSpeedButton;
    Label8: TLabel;
    Forne_Cliente: TCurrencyEdit;
    btnForne_Cliente: TSpeedButton;
    chk_pagos_recebidos: TCheckBox;
    Relatorio_Principal: TfrxReport;
    FrxDSCredito: TfrxDBDataset;
    Button1: TButton;
    QLayoutFastReport: TFDQuery;
    DadosRelatorio: TFDMemTable;
    DadosRelatorioLANCAMENTO: TStringField;
    DadosRelatorioDT_TRANS: TDateField;
    DadosRelatorioDT_VENCIMENTO: TDateField;
    DadosRelatorioPLANO_CONTA: TStringField;
    DadosRelatorioCONTA_BANCO: TStringField;
    DadosRelatorioDOCUMENTO: TStringField;
    DadosRelatorioDEBITO: TFloatField;
    DadosRelatorioCREDITO: TFloatField;
    DadosRelatorioDT_PAGAMENTO: TStringField;
    Label9: TLabel;
    tipo: TComboBox;
    frxXLSXExport1: TfrxXLSXExport;
    Relatorio_Editar: TfrxReport;
    Label10: TLabel;
    DadosRelatorioCOND_PAGTO: TStringField;
    DadosRelatorioID: TIntegerField;
    DadosRelatorioNOME: TStringField;
    Cmb_Finalizadora: TComboBox;
    Cmb_Cond_Pagto: TComboBox;
    Label11: TLabel;
    cmb_pagos: TComboBox;
    procedure btnRetornaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Tipo_LancamentoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DtmenEnter(Sender: TObject);
    procedure btnFornecedorClick(Sender: TObject);
    procedure Tipo_LancamentoChange(Sender: TObject);
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
    procedure Duplicatas_EmpresaBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure CONTA_IDExit(Sender: TObject);
    procedure btnContaClick(Sender: TObject);
    procedure btnForne_ClienteClick(Sender: TObject);
    procedure CONTA_IDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Relatorio_PrincipalLoadTemplate(Report: TfrxReport;
      const TemplateName: string);
    procedure Button1Click(Sender: TObject);
  private
    procedure FuncionarioSearch;
    { Private declarations }
  public
    { Public declarations }
    procedure FornecedorSearch;
    procedure ClienteSearch;

  end;

var
  FrmRelatorio_Duplicatas: TFrmRelatorio_Duplicatas;

implementation

uses
  UPrincipal, UData,UConsulta;

{$R *.dfm}



procedure TFrmRelatorio_Duplicatas.FornecedorSearch;
begin
  QFornecedor.SQL.Clear;
  QFornecedor.SQL.Add('SELECT * FROM FORNECEDORES WHERE FORNECEDOR_ID = :FORNECEDOR_ID');
  QFornecedor.ParamByName('FORNECEDOR_ID').AsInteger := StrToInt(Id.Text);
  QFornecedor.Prepare;
  QFornecedor.Open;
end;

procedure TFrmRelatorio_Duplicatas.Chk_pagtoClick(Sender: TObject);
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


procedure TFrmRelatorio_Duplicatas.Chk_pagto_CartaoClick(Sender: TObject);
begin
if Chk_pagto_Cartao.Checked then
FINALIZADORA_ID.Enabled := False
Else
FINALIZADORA_ID.Enabled := True;

end;

procedure TFrmRelatorio_Duplicatas.Chk_SinteticoClick(Sender: TObject);
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

procedure TFrmRelatorio_Duplicatas.Chk_Sintetico_RecebidasClick(
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

procedure TFrmRelatorio_Duplicatas.ClienteSearch;
begin
  QFornecedor.SQL.Clear;
  QFornecedor.SQL.Add('SELECT * FROM CLIENTES WHERE CLIENTE_ID = :CLIENTE_ID');
  QFornecedor.ParamByName('CLIENTE_ID').AsInteger := StrToInt(Id.Text);
  QFornecedor.Prepare;
  QFornecedor.Open;
end;

procedure TFrmRelatorio_Duplicatas.CONTA_IDExit(Sender: TObject);
begin
if (CONTA_ID.Text <> '') then
  begin
    QConta.Close;

    QConta.ParamByName('TABELA_ID').AsInteger := StrToInt(CONTA_ID.Text);

    QConta.Prepare;
    QConta.Open;
  end;
End;



procedure TFrmRelatorio_Duplicatas.CONTA_IDKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

 if (Key = Vk_F7) and (Sender = CONTA_ID) then
    btnContaClick(Self);

end;

procedure TFrmRelatorio_Duplicatas.FuncionarioSearch;
begin
  QOperador.Close; 
  QOperador.ParamByName('FUNCIONARIO_ID').AsInteger := StrToInt(Operador.Text);
  QOperador.Prepare;
  QOperador.Open;
end;


procedure TFrmRelatorio_Duplicatas.btnContaClick(Sender: TObject);
begin
  try
    CONTA_ID.Value := GetConsulta('CONTAS', 0, 0, StrToInt(CONTA_ID.Text));
  except
    CONTA_ID.Value := GetConsulta('CONTAS', 0, 0, 0);
  end;

end;

procedure TFrmRelatorio_Duplicatas.btnExecutaClick(Sender: TObject);
begin
// 177, 327
  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

      if cmb_pagos.Text = 'Todos' Then
      BEGIN
      QRel.Sql.Clear;
      QRel.Sql.Add('SELECT LANCAMENTO, FINALIZADORA_ID , FINALIZADORA, TRANSACAO_ID, COND_PAGTO, DT_TRANS, DT_PAGAMENTO ,FORNECEDOR_ID, CLIENTE_ID ,  DOCUMENTO, CONTA , PLANO_CONTA , CONTA_BANCO, DEBITO ,CREDITO ,DT_VENCIMENTO, NOME, DDD , TELEFONE');
      QRel.Sql.Add('ATRASO ');
      QRel.Sql.Add('FROM(');

        IF Tipo_Lancamento.Text = 'Receita' Then
        Begin
        QRel.Sql.Add('SELECT DISTINCT ''RECEITA'' LANCAMENTO, TRANSACOES.FINALIZADORA_ID , TRANSACOES.COND_PAGTO FINALIZADORA, TRANSACOES.TRANSACAO_ID, ');
        QRel.Sql.Add('TRANSACOES.CLIENTE_ID CLIENTE_ID , 0 FORNECEDOR_ID ,');


        QRel.Sql.Add('ENTRADA.DT_TRANS DT_TRANS,');
        QRel.Sql.Add('TRANSACOES.DT_TRANS DT_PAGAMENTO,');
        QRel.Sql.Add('ENTRADA.NUM_DOC DOCUMENTO,');
        QRel.Sql.Add('ENTRADA.COND_PAGTO,');


        QRel.Sql.Add('TRANSACOES.CONTA_ID CONTA, TABELAS.DESCRICAO PLANO_CONTA , BANCOS.NUM_CONTA CONTA_BANCO,0 DEBITO , ');

        QRel.Sql.Add('TRANSACOES.VALOR CREDITO,');


        QRel.Sql.Add('TRANSPARCELAS.DT_VENCIMENTO , CLIENTES.NOME, CLIENTES.DDD, CLIENTES.TELEFONE_1 TELEFONE,');
        QRel.Sql.Add('0  ATRASO');
        QRel.Sql.Add('FROM TRANSACOES');


        QRel.Sql.Add('INNER JOIN TRANSACOES ENTRADA');
        QRel.Sql.Add('ON ENTRADA.TRANSACAO_ID = TRANSACOES.SAIDA_ID');
        QRel.Sql.Add('INNER JOIN TRANSPARCELAS');
        QRel.Sql.Add('ON (TRANSACOES.SAIDA_ID = TRANSPARCELAS.TRANSACAO_ID AND TRANSACOES.PARCELA_ID = TRANSPARCELAS.PARCELA_ID)');



        QRel.Sql.Add('LEFT JOIN BANCOS');
        QRel.Sql.Add('ON BANCOS.BANCO_ID = TRANSACOES.BANCO_ID');
        QRel.Sql.Add('LEFT JOIN CLIENTES');
        QRel.Sql.Add('ON (TRANSACOES.CLIENTE_ID = CLIENTES.CLIENTE_ID)');


        QRel.Sql.Add('LEFT JOIN TABELAS');
        QRel.Sql.Add('ON ((ENTRADA.CONTA_ID = TABELAS.TABELA_ID) AND (TABELAS.TIPO_TABELA = ''4''))');


        QRel.Sql.Add('WHERE');
        QRel.Sql.Add('(TRANSACOES.CONDUTA = ''07'')');


        QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM TRANSACOES WHERE HISTORICO LIKE  ''Ref. Devolução%''))');
        QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
        QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

        QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
        QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');


           QRel.Sql.Add('UNION ALL');
           QRel.Sql.Add('SELECT DISTINCT ''RECEITA'' LANCAMENTO, TRANSACOES.FINALIZADORA_ID,  TRANSACOES.COND_PAGTO FINALIZADORA,  TRANSACOES.TRANSACAO_ID, ');
           QRel.Sql.Add('TRANSACOES.CLIENTE_ID  , 0 FORNECEDOR_ID ,');
           QRel.Sql.Add('TRANSACOES.DT_TRANS DT_TRANS,');
           QRel.Sql.Add('CAST (''01/01/00'' AS DATE) DT_PAGAMENTO,');
           QRel.Sql.Add('NUM_DOC DOCUMENTO, TRANSACOES.COND_PAGTO,');
           QRel.Sql.Add('TRANSACOES.CONTA_ID CONTA, TABELAS.DESCRICAO PLANO_CONTA , BANCOS.NUM_CONTA CONTA_BANCO,');
           QRel.Sql.Add('0 DEBITO ,');
           QRel.Sql.Add('TRANSACOES.VALOR CREDITO,');
           QRel.Sql.Add('CAST (''01/01/00'' AS DATE) DT_VENCIMENTO, CLIENTES.NOME, CLIENTES.DDD, CLIENTES.TELEFONE_1 TELEFONE,');
           QRel.Sql.Add('0 ATRASO');
           QRel.Sql.Add('FROM TRANSACOES');
           QRel.Sql.Add('LEFT JOIN BANCOS');
           QRel.Sql.Add('ON BANCOS.BANCO_ID = TRANSACOES.BANCO_ID');
           QRel.Sql.Add('LEFT JOIN CLIENTES');
           QRel.Sql.Add('ON (TRANSACOES.CLIENTE_ID = CLIENTES.CLIENTE_ID)');
           QRel.Sql.Add('LEFT JOIN TABELAS');
           QRel.Sql.Add('ON ((TRANSACOES.CONTA_ID = TABELAS.TABELA_ID) AND (TABELAS.TIPO_TABELA = ''4''))');
           QRel.Sql.Add('WHERE');
           QRel.Sql.Add('(TRANSACOES.CONDUTA = ''01'') AND ((TRANSACOES.COND_PAGTO = ''A VISTA'') or (TRANSACOES.COND_PAGTO = ''CARTAO'')) ');

           QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM TRANSACOES WHERE HISTORICO LIKE  ''Ref. Devolução%''))');
           QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
           QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

           QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
           QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');



        QRel.Sql.Add('UNION ALL');
        QRel.Sql.Add('SELECT DISTINCT ''RECEITA'' LANCAMENTO, TRANSACOES.FINALIZADORA_ID , TRANSACOES.COND_PAGTO FINALIZADORA, TRANSACOES.TRANSACAO_ID, ');
        QRel.Sql.Add('TRANSACOES.CLIENTE_ID CLIENTE_ID , 0 FORNECEDOR_ID ,');


        QRel.Sql.Add('TRANSACOES.DT_TRANS DT_TRANS,');
        QRel.Sql.Add('CAST (''01/01/00'' AS DATE) DT_PAGAMENTO,');
        QRel.Sql.Add('NUM_DOC DOCUMENTO,');
        QRel.Sql.Add('TRANSACOES.COND_PAGTO,');



        QRel.Sql.Add('TRANSACOES.CONTA_ID CONTA, TABELAS.DESCRICAO PLANO_CONTA , BANCOS.NUM_CONTA CONTA_BANCO,0 DEBITO , ');



        QRel.Sql.Add('TRANSACOES.VALOR CREDITO,');
        QRel.Sql.Add('TRANSPARCELAS.DT_VENCIMENTO , CLIENTES.NOME, CLIENTES.DDD, CLIENTES.TELEFONE_1 TELEFONE,');
        QRel.Sql.Add('0  ATRASO');
        QRel.Sql.Add('FROM TRANSACOES');

        QRel.Sql.Add('LEFT JOIN TRANSPARCELAS');
        QRel.Sql.Add('ON (TRANSACOES.TRANSACAO_ID = TRANSPARCELAS.TRANSACAO_ID)');


        QRel.Sql.Add('LEFT JOIN BANCOS');
        QRel.Sql.Add('ON BANCOS.BANCO_ID = TRANSACOES.BANCO_ID');
        QRel.Sql.Add('LEFT JOIN CLIENTES');
        QRel.Sql.Add('ON (TRANSACOES.CLIENTE_ID = CLIENTES.CLIENTE_ID)');

        QRel.Sql.Add('LEFT JOIN TABELAS');
        QRel.Sql.Add('ON ((TRANSACOES.CONTA_ID = TABELAS.TABELA_ID) AND (TABELAS.TIPO_TABELA = ''4''))');

        QRel.Sql.Add('WHERE');

        QRel.Sql.Add('(TRANSACOES.CONDUTA = ''01'')  AND (TRANSACOES.COND_PAGTO = ''A PRAZO'')');
        QRel.Sql.Add('AND (TRANSPARCELAS.VALOR > 0) AND (TRANSPARCELAS.AGRUPAMENTO = 0)');
        QRel.Sql.Add('AND ((TRANSPARCELAS.ESPECIE <> ''EXCLUIDO'') OR (TRANSPARCELAS.ESPECIE IS NULL))');



        QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM TRANSACOES WHERE HISTORICO LIKE  ''Ref. Devolução%''))');
        QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
        QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

        QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
        QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');

        End;

        IF Tipo_Lancamento.Text = 'Despesa' Then
        Begin

        QRel.Sql.Add('SELECT DISTINCT ''DESPESA'' LANCAMENTO, TRANSACOES.FINALIZADORA_ID ,TRANSACOES.COND_PAGTO FINALIZADORA ,  TRANSACOES.TRANSACAO_ID,  ');
        QRel.Sql.Add('TRANSACOES.FORNECEDOR_ID FORNECEDOR_ID , 0 CLIENTE_ID ,');


        QRel.Sql.Add('ENTRADA.DT_TRANS DT_TRANS,');
        QRel.Sql.Add('TRANSACOES.DT_TRANS DT_PAGAMENTO,');
        QRel.Sql.Add('ENTRADA.NUM_DOC DOCUMENTO,  TRANSACOES.COND_PAGTO,');


        QRel.Sql.Add('TRANSACOES.CONTA_ID CONTA, TABELAS.DESCRICAO PLANO_CONTA , BANCOS.NUM_CONTA CONTA_BANCO, 0 CREDITO,');


        QRel.Sql.Add('TRANSACOES.VALOR DEBITO,');

        QRel.Sql.Add('TRANSPARCELAS.DT_VENCIMENTO, FORNECEDORES.NOME, FORNECEDORES.DDD, FORNECEDORES.TELEFONE_1 TELEFONE,');
        QRel.Sql.Add(' 0  ATRASO');
        QRel.Sql.Add('FROM TRANSACOES');


        QRel.Sql.Add('INNER JOIN TRANSACOES ENTRADA');
        QRel.Sql.Add('ON ENTRADA.TRANSACAO_ID = TRANSACOES.ENTRADA_ID');
        QRel.Sql.Add('INNER JOIN TRANSPARCELAS');
        QRel.Sql.Add('ON (TRANSACOES.ENTRADA_ID = TRANSPARCELAS.TRANSACAO_ID AND TRANSACOES.PARCELA_ID = TRANSPARCELAS.PARCELA_ID )');



        QRel.Sql.Add('LEFT JOIN BANCOS');
        QRel.Sql.Add('ON BANCOS.BANCO_ID = TRANSACOES.BANCO_ID');
        QRel.Sql.Add('LEFT JOIN FORNECEDORES');
        QRel.Sql.Add('ON (TRANSACOES.FORNECEDOR_ID = FORNECEDORES.FORNECEDOR_ID)');
          //PAGOS

        QRel.Sql.Add('LEFT JOIN TABELAS');
        QRel.Sql.Add('ON ((ENTRADA.CONTA_ID = TABELAS.TABELA_ID) AND (TABELAS.TIPO_TABELA = ''4''))');


        QRel.Sql.Add('WHERE');

        QRel.Sql.Add('(TRANSACOES.CONDUTA = ''08'')');

        QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM TRANSACOES WHERE HISTORICO LIKE  ''Ref. Devolução%''))');

        QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
        QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');

        {
        QRel.Sql.Add('UNION ALL');
        QRel.Sql.Add('SELECT DISTINCT ''DESPESA'' LANCAMENTO, TRANSACOES.FINALIZADORA_ID,  TRANSACOES.COND_PAGTO FINALIZADORA,  TRANSACOES.TRANSACAO_ID, ');
        QRel.Sql.Add('TRANSACOES.FORNECEDOR_ID  , 0 CLIENTE_ID ,');
        QRel.Sql.Add('TRANSACOES.DT_TRANS DT_TRANS,');
        QRel.Sql.Add('CAST (''01/01/00'' AS DATE) DT_PAGAMENTO,');
        QRel.Sql.Add('NUM_DOC DOCUMENTO, TRANSACOES.COND_PAGTO,');
        QRel.Sql.Add('TRANSACOES.CONTA_ID CONTA, TABELAS.DESCRICAO PLANO_CONTA , BANCOS.NUM_CONTA CONTA_BANCO,');
        QRel.Sql.Add('0 CREDITO ,');
        QRel.Sql.Add('TRANSACOES.VALOR DEBITO,');
        QRel.Sql.Add('CAST (''01/01/00'' AS DATE) DT_VENCIMENTO, FORNECEDORES.NOME, FORNECEDORES.DDD, FORNECEDORES.TELEFONE_1 TELEFONE,');
        QRel.Sql.Add('0 ATRASO');
        QRel.Sql.Add('FROM TRANSACOES');
        QRel.Sql.Add('LEFT JOIN BANCOS');
        QRel.Sql.Add('ON BANCOS.BANCO_ID = TRANSACOES.BANCO_ID');
        QRel.Sql.Add('LEFT JOIN FORNECEDORES');
        QRel.Sql.Add('ON (TRANSACOES.FORNECEDOR_ID = FORNECEDORES.FORNECEDOR_ID)');
        QRel.Sql.Add('LEFT JOIN TABELAS');
        QRel.Sql.Add('ON ((TRANSACOES.CONTA_ID = TABELAS.TABELA_ID) AND (TABELAS.TIPO_TABELA = ''4''))');
        QRel.Sql.Add('WHERE');
        QRel.Sql.Add('(TRANSACOES.CONDUTA = ''02'') AND ((TRANSACOES.COND_PAGTO = ''A VISTA'')) ');

        QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM TRANSACOES WHERE HISTORICO LIKE  ''Ref. Devolução%''))');
        QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
        QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

        QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
        QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
        }
        QRel.Sql.Add('UNION ALL');

        QRel.Sql.Add('SELECT DISTINCT ''DESPESA'' LANCAMENTO, TRANSACOES.FINALIZADORA_ID ,TRANSACOES.COND_PAGTO FINALIZADORA ,  TRANSACOES.TRANSACAO_ID,  ');
        QRel.Sql.Add('TRANSACOES.FORNECEDOR_ID FORNECEDOR_ID , 0 CLIENTE_ID ,');


        QRel.Sql.Add('TRANSACOES.DT_TRANS DT_TRANS,');
        QRel.Sql.Add('CAST (''01/01/00'' AS DATE) DT_PAGAMENTO,');
        QRel.Sql.Add('NUM_DOC DOCUMENTO, TRANSACOES.COND_PAGTO,');

        QRel.Sql.Add('TRANSACOES.CONTA_ID CONTA, TABELAS.DESCRICAO PLANO_CONTA , BANCOS.NUM_CONTA CONTA_BANCO, 0 CREDITO,');


        QRel.Sql.Add('TRANSPARCELAS.VALOR DEBITO,');

        QRel.Sql.Add('TRANSPARCELAS.DT_VENCIMENTO, FORNECEDORES.NOME, FORNECEDORES.DDD, FORNECEDORES.TELEFONE_1 TELEFONE,');
        QRel.Sql.Add('CASE WHEN (TRANSACOES.DT_TRANS - TRANSPARCELAS.DT_VENCIMENTO) > 0 THEN (TRANSACOES.DT_TRANS - TRANSPARCELAS.DT_VENCIMENTO) ELSE 0 END ATRASO');
        QRel.Sql.Add('FROM TRANSACOES');

        QRel.Sql.Add('LEFT JOIN TRANSPARCELAS');
        QRel.Sql.Add('ON (TRANSACOES.TRANSACAO_ID = TRANSPARCELAS.TRANSACAO_ID)');


        QRel.Sql.Add('LEFT JOIN BANCOS');
        QRel.Sql.Add('ON BANCOS.BANCO_ID = TRANSACOES.BANCO_ID');
        QRel.Sql.Add('LEFT JOIN FORNECEDORES');
        QRel.Sql.Add('ON (TRANSACOES.FORNECEDOR_ID = FORNECEDORES.FORNECEDOR_ID)');

        QRel.Sql.Add('LEFT JOIN TABELAS');
        QRel.Sql.Add('ON ((TRANSACOES.CONTA_ID = TABELAS.TABELA_ID) AND (TABELAS.TIPO_TABELA = ''4''))');

        QRel.Sql.Add('WHERE');

        QRel.Sql.Add('(TRANSACOES.CONDUTA = ''02'') AND (TRANSACOES.COND_PAGTO = ''A PRAZO'')');
        QRel.Sql.Add('AND (TRANSPARCELAS.VALOR > 0) AND (TRANSPARCELAS.AGRUPAMENTO = 0)');
        QRel.Sql.Add('AND ((TRANSPARCELAS.ESPECIE <> ''EXCLUIDO'') OR (TRANSPARCELAS.ESPECIE IS NULL))');

        QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM TRANSACOES WHERE HISTORICO LIKE  ''Ref. Devolução%''))');

        QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
        QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');

        End;




       QRel.Sql.Add(') AS DUPLICATA');

       if tipo.Text = 'Data Vencimento' Then
       QRel.Sql.Add('WHERE DUPLICATA.DT_VENCIMENTO BETWEEN :DT_INICIAL AND :DT_FINAL')
       Else if tipo.Text = 'Data Pagamento' Then
       QRel.Sql.Add('WHERE DUPLICATA.DT_PAGAMENTO BETWEEN :DT_INICIAL AND :DT_FINAL')
       Else
       QRel.Sql.Add('WHERE DUPLICATA.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL');

       IF CONTA_ID.Value > 0 Then
        Begin
        QRel.Sql.Add('AND DUPLICATA.CONTA = :CONTA_ID ');
        QRel.ParamByName('CONTA_ID').AsInteger := StrToInt(CONTA_ID.Text);
        End;

        if forne_cliente.Value > 0 then
        begin
          IF Tipo_Lancamento.Text = 'Receita' Then
          QRel.Sql.Add('AND (DUPLICATA.CLIENTE_ID = :FORNECEDOR_ID)')
          Else
          QRel.Sql.Add('AND (DUPLICATA.FORNECEDOR_ID = :FORNECEDOR_ID)');

          QRel.ParamByName('FORNECEDOR_ID').AsInteger := StrToInt(forne_cliente.Text);
        end;

        if not chk_pagos_Recebidos.Checked Then
        Begin
         if Cmb_Cond_Pagto.Text = 'A Vista' Then
         QRel.Sql.Add('AND DUPLICATA.COND_PAGTO = ''A VISTA'' ')
         Else if  Cmb_Cond_Pagto.Text = 'A Prazo' Then
         QRel.Sql.Add('AND DUPLICATA.COND_PAGTO = ''A PRAZO'' ');
        End;

        IF Cmb_Finalizadora.Text <> '' Then
        Begin
          IF Tipo_Lancamento.Text = 'Receita' Then
          Begin
           QFinalizadora.Sql.Clear;
           QFinalizadora.Sql.Add('SELECT * FROM FINALIZADORAS WHERE DESCRICAO = :DESCRICAO');
           QFinalizadora.ParamByName('DESCRICAO').AsString :=  Cmb_Finalizadora.Text;
           QFinalizadora.Prepare;
           QFinalizadora.Open;

           QRel.Sql.Add('AND DUPLICATA.FINALIZADORA_ID = :FINALIZADORA_ID ');
           QRel.ParamByName('FINALIZADORA_ID').AsInteger := QFinalizadora.FieldByName('FINALIZADORA_ID').AsInteger;
          End
          Else
          Begin

           QRel.Sql.Add('AND DUPLICATA.FINALIZADORA = :FINALIZADORA ');
           QRel.ParamByName('FINALIZADORA').AsString := Cmb_Finalizadora.Text;

          End;

        End;



       if tipo.Text = 'Data Vencimento' Then
       Begin
        if Ordem.Text = 'DATA, NOME' then
          QRel.Sql.Add('ORDER BY DUPLICATA.DT_VENCIMENTO, DUPLICATA.NOME')
        else if Ordem.Text = 'NOME, DATA' then
          QRel.Sql.Add('ORDER BY DUPLICATA.PLANO_CONTA, DUPLICATA.VENCIMENTO')
        else if Ordem.Text = 'DATA' then
          QRel.Sql.Add('ORDER BY DUPLICATA.DT_VENCIMENTO')
        else if Ordem.Text = 'NOME' then
          QRel.Sql.Add('ORDER BY DUPLICATA.PLANO_CONTA');
       End
       Else if tipo.Text = 'Data Pagamento' Then
       Begin
        if Ordem.Text = 'DATA, NOME' then
          QRel.Sql.Add('ORDER BY DUPLICATA.DT_PAGAMENTO, DUPLICATA.NOME')
        else if Ordem.Text = 'NOME, DATA' then
          QRel.Sql.Add('ORDER BY DUPLICATA.PLANO_CONTA, DUPLICATA.DT_PAGAMENTO')
        else if Ordem.Text = 'DATA' then
          QRel.Sql.Add('ORDER BY DUPLICATA.DT_PAGAMENTO')
        else if Ordem.Text = 'NOME' then
          QRel.Sql.Add('ORDER BY DUPLICATA.PLANO_CONTA');
       End
       Else
       Begin

        if Ordem.Text = 'DATA, NOME' then
          QRel.Sql.Add('ORDER BY DUPLICATA.DT_TRANS, DUPLICATA.NOME')
        else if Ordem.Text = 'NOME, DATA' then
          QRel.Sql.Add('ORDER BY DUPLICATA.PLANO_CONTA, DUPLICATA.DT_TRANS')
        else if Ordem.Text = 'DATA' then
          QRel.Sql.Add('ORDER BY DUPLICATA.DT_TRANS')
        else if Ordem.Text = 'NOME' then
          QRel.Sql.Add('ORDER BY DUPLICATA.PLANO_CONTA');
       End;



       QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
       QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
       QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
       QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;




       QRel.Prepare;
       QRel.Open;

      END
      Else
      Begin



      QRel.Sql.Clear;
      QRel.Sql.Add('SELECT LANCAMENTO, FINALIZADORA_ID , FINALIZADORA, TRANSACAO_ID, COND_PAGTO, DT_TRANS, DT_PAGAMENTO ,FORNECEDOR_ID, CLIENTE_ID ,  DOCUMENTO, CONTA , PLANO_CONTA , CONTA_BANCO, DEBITO ,CREDITO ,DT_VENCIMENTO, NOME, DDD , TELEFONE');
      QRel.Sql.Add('ATRASO ');
      QRel.Sql.Add('FROM(');

        IF Tipo_Lancamento.Text = 'Receita' Then
        Begin
        QRel.Sql.Add('SELECT DISTINCT ''RECEITA'' LANCAMENTO, TRANSACOES.FINALIZADORA_ID , TRANSACOES.COND_PAGTO FINALIZADORA, TRANSACOES.TRANSACAO_ID, ');
        QRel.Sql.Add('TRANSACOES.CLIENTE_ID CLIENTE_ID , 0 FORNECEDOR_ID ,');

          if cmb_pagos.Text = 'Pagos/Recebidos' Then
          Begin
          QRel.Sql.Add('ENTRADA.DT_TRANS DT_TRANS,');
          QRel.Sql.Add('TRANSACOES.DT_TRANS DT_PAGAMENTO,');
          QRel.Sql.Add('ENTRADA.NUM_DOC DOCUMENTO,');
          QRel.Sql.Add('ENTRADA.COND_PAGTO,');
          End
          //NAO PAGOS
          Else if cmb_pagos.Text = 'Não Pagos/Não Recebidos' Then
          Begin
          QRel.Sql.Add('TRANSACOES.DT_TRANS DT_TRANS,');
          QRel.Sql.Add('CAST (''01/01/00'' AS DATE) DT_PAGAMENTO,');
          QRel.Sql.Add('NUM_DOC DOCUMENTO,');
          QRel.Sql.Add('TRANSACOES.COND_PAGTO,');
          End;


        QRel.Sql.Add('TRANSACOES.CONTA_ID CONTA, TABELAS.DESCRICAO PLANO_CONTA , BANCOS.NUM_CONTA CONTA_BANCO,0 DEBITO , ');


         {
         if (cmb_pagos.Text = 'Pagos/Recebidos') Then
         QRel.Sql.Add('TRANSPARCELAS.VALOR CREDITO,')

         Else if cmb_pagos.Text = 'Não Pagos/Não Recebidos' Then
         }
         QRel.Sql.Add('TRANSACOES.VALOR CREDITO,');

        //QRel.Sql.Add('CAST (''01/01/00'' AS DATE) DT_VENCIMENTO,');
        QRel.Sql.Add('TRANSPARCELAS.DT_VENCIMENTO , CLIENTES.NOME, CLIENTES.DDD, CLIENTES.TELEFONE_1 TELEFONE,');
        QRel.Sql.Add('0  ATRASO');
        QRel.Sql.Add('FROM TRANSACOES');
          //PAGOS
         if cmb_pagos.Text = 'Pagos/Recebidos' Then
         Begin
         //PAGOS
         QRel.Sql.Add('INNER JOIN TRANSACOES ENTRADA');
         QRel.Sql.Add('ON ENTRADA.TRANSACAO_ID = TRANSACOES.SAIDA_ID');
         QRel.Sql.Add('INNER JOIN TRANSPARCELAS');
         QRel.Sql.Add('ON (TRANSACOES.SAIDA_ID = TRANSPARCELAS.TRANSACAO_ID AND TRANSACOES.PARCELA_ID = TRANSPARCELAS.PARCELA_ID)');
         End
         Else if cmb_pagos.Text = 'Não Pagos/Não Recebidos' Then
         Begin
         //NAO PAGOS
         QRel.Sql.Add('LEFT JOIN TRANSPARCELAS');
         QRel.Sql.Add('ON (TRANSACOES.TRANSACAO_ID = TRANSPARCELAS.TRANSACAO_ID)');
         End;

        QRel.Sql.Add('LEFT JOIN BANCOS');
        QRel.Sql.Add('ON BANCOS.BANCO_ID = TRANSACOES.BANCO_ID');
        QRel.Sql.Add('LEFT JOIN CLIENTES');
        QRel.Sql.Add('ON (TRANSACOES.CLIENTE_ID = CLIENTES.CLIENTE_ID)');
          //PAGOS
         if cmb_pagos.Text = 'Pagos/Recebidos' Then
         Begin
         QRel.Sql.Add('LEFT JOIN TABELAS');
         QRel.Sql.Add('ON ((ENTRADA.CONTA_ID = TABELAS.TABELA_ID) AND (TABELAS.TIPO_TABELA = ''4''))');
         End
         Else if cmb_pagos.Text = 'Não Pagos/Não Recebidos' Then
         Begin
          //NAO PAGOS
         QRel.Sql.Add('LEFT JOIN TABELAS');
         QRel.Sql.Add('ON ((TRANSACOES.CONTA_ID = TABELAS.TABELA_ID) AND (TABELAS.TIPO_TABELA = ''4''))');
         End;
        QRel.Sql.Add('WHERE');
         //PAGOS
         if cmb_pagos.Text = 'Pagos/Recebidos' Then
         QRel.Sql.Add('(TRANSACOES.CONDUTA = ''07'')')
         //NAO PAGOS
         Else if cmb_pagos.Text = 'Não Pagos/Não Recebidos' Then
         Begin
          QRel.Sql.Add('(TRANSACOES.CONDUTA = ''01'')  AND (TRANSACOES.COND_PAGTO = ''A PRAZO'')');
          QRel.Sql.Add('AND (TRANSPARCELAS.VALOR > 0) AND (TRANSPARCELAS.AGRUPAMENTO = 0)');
          QRel.Sql.Add('AND ((TRANSPARCELAS.ESPECIE <> ''EXCLUIDO'') OR (TRANSPARCELAS.ESPECIE IS NULL))');

         End;

        QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM TRANSACOES WHERE HISTORICO LIKE  ''Ref. Devolução%''))');
        QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
        QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

        QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
        QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
         {
          if tipo.Text = 'Data Vencimento' Then
        //Vencimento
          QRel.Sql.Add('AND (TRANSPARCELAS.DT_VENCIMENTO BETWEEN :DT_INICIAL AND :DT_FINAL)')
          Else
        //PAGAMENTO'
          QRel.Sql.Add('AND (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
          }
          if cmb_pagos.Text = 'Pagos/Recebidos' Then
          Begin

           QRel.Sql.Add('UNION ALL');
           QRel.Sql.Add('SELECT DISTINCT ''RECEITA'' LANCAMENTO, TRANSACOES.FINALIZADORA_ID,  TRANSACOES.COND_PAGTO FINALIZADORA,  TRANSACOES.TRANSACAO_ID, ');
           QRel.Sql.Add('TRANSACOES.CLIENTE_ID  , 0 FORNECEDOR_ID ,');
           QRel.Sql.Add('TRANSACOES.DT_TRANS DT_TRANS,');
           QRel.Sql.Add('CAST (''01/01/00'' AS DATE) DT_PAGAMENTO,');
           QRel.Sql.Add('NUM_DOC DOCUMENTO, TRANSACOES.COND_PAGTO,');
           QRel.Sql.Add('TRANSACOES.CONTA_ID CONTA, TABELAS.DESCRICAO PLANO_CONTA , BANCOS.NUM_CONTA CONTA_BANCO,');
           QRel.Sql.Add('0 DEBITO ,');
           QRel.Sql.Add('TRANSACOES.VALOR CREDITO,');
           QRel.Sql.Add('CAST (''01/01/00'' AS DATE) DT_VENCIMENTO, CLIENTES.NOME, CLIENTES.DDD, CLIENTES.TELEFONE_1 TELEFONE,');
           QRel.Sql.Add('0 ATRASO');
           QRel.Sql.Add('FROM TRANSACOES');
           QRel.Sql.Add('LEFT JOIN BANCOS');
           QRel.Sql.Add('ON BANCOS.BANCO_ID = TRANSACOES.BANCO_ID');
           QRel.Sql.Add('LEFT JOIN CLIENTES');
           QRel.Sql.Add('ON (TRANSACOES.CLIENTE_ID = CLIENTES.CLIENTE_ID)');
           QRel.Sql.Add('LEFT JOIN TABELAS');
           QRel.Sql.Add('ON ((TRANSACOES.CONTA_ID = TABELAS.TABELA_ID) AND (TABELAS.TIPO_TABELA = ''4''))');
           QRel.Sql.Add('WHERE');
           QRel.Sql.Add('(TRANSACOES.CONDUTA = ''01'') AND ((TRANSACOES.COND_PAGTO = ''A VISTA'') or (TRANSACOES.COND_PAGTO = ''CARTAO'')) ');

           QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM TRANSACOES WHERE HISTORICO LIKE  ''Ref. Devolução%''))');
           QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
           QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

           QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
           QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
           //QRel.Sql.Add('AND (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');

          End;

        End;

        IF Tipo_Lancamento.Text = 'Despesa' Then
        Begin
        QRel.Sql.Add('SELECT DISTINCT ''DESPESA'' LANCAMENTO, TRANSACOES.FINALIZADORA_ID ,TRANSACOES.COND_PAGTO FINALIZADORA ,  TRANSACOES.TRANSACAO_ID,  ');
        QRel.Sql.Add('TRANSACOES.FORNECEDOR_ID FORNECEDOR_ID , 0 CLIENTE_ID ,');

          if cmb_pagos.Text = 'Pagos/Recebidos' Then
          Begin
          QRel.Sql.Add('ENTRADA.DT_TRANS DT_TRANS,');
          QRel.Sql.Add('TRANSACOES.DT_TRANS DT_PAGAMENTO,');
          QRel.Sql.Add('ENTRADA.NUM_DOC DOCUMENTO,  TRANSACOES.COND_PAGTO,');
          End
          //NAO PAGOS
          Else if cmb_pagos.Text = 'Não Pagos/Não Recebidos' Then
          Begin
          QRel.Sql.Add('TRANSACOES.DT_TRANS DT_TRANS,');
          QRel.Sql.Add('CAST (''01/01/00'' AS DATE) DT_PAGAMENTO,');
          QRel.Sql.Add('NUM_DOC DOCUMENTO, TRANSACOES.COND_PAGTO,');

          End;

        QRel.Sql.Add('TRANSACOES.CONTA_ID CONTA, TABELAS.DESCRICAO PLANO_CONTA , BANCOS.NUM_CONTA CONTA_BANCO, 0 CREDITO,');

         if (tipo.Text = 'Data Vencimento') and (not chk_pagos_recebidos.Checked) Then
         QRel.Sql.Add('TRANSPARCELAS.VALOR DEBITO,')
         Else
         QRel.Sql.Add('TRANSACOES.VALOR DEBITO,');

        QRel.Sql.Add('TRANSPARCELAS.DT_VENCIMENTO, FORNECEDORES.NOME, FORNECEDORES.DDD, FORNECEDORES.TELEFONE_1 TELEFONE,');
        QRel.Sql.Add('CASE WHEN (TRANSACOES.DT_TRANS - TRANSPARCELAS.DT_VENCIMENTO) > 0 THEN (TRANSACOES.DT_TRANS - TRANSPARCELAS.DT_VENCIMENTO) ELSE 0 END ATRASO');
        QRel.Sql.Add('FROM TRANSACOES');
          //PAGOS
         if cmb_pagos.Text = 'Pagos/Recebidos' Then
         Begin
         //PAGOS
         QRel.Sql.Add('INNER JOIN TRANSACOES ENTRADA');
         QRel.Sql.Add('ON ENTRADA.TRANSACAO_ID = TRANSACOES.ENTRADA_ID');
         QRel.Sql.Add('INNER JOIN TRANSPARCELAS');
         QRel.Sql.Add('ON (TRANSACOES.ENTRADA_ID = TRANSPARCELAS.TRANSACAO_ID AND TRANSACOES.PARCELA_ID = TRANSPARCELAS.PARCELA_ID )');
         End
         Else if cmb_pagos.Text = 'Não Pagos/Não Recebidos' Then
         Begin
          //NAO PAGOS
         QRel.Sql.Add('LEFT JOIN TRANSPARCELAS');
         QRel.Sql.Add('ON (TRANSACOES.TRANSACAO_ID = TRANSPARCELAS.TRANSACAO_ID)');
         End;

        QRel.Sql.Add('LEFT JOIN BANCOS');
        QRel.Sql.Add('ON BANCOS.BANCO_ID = TRANSACOES.BANCO_ID');
        QRel.Sql.Add('LEFT JOIN FORNECEDORES');
        QRel.Sql.Add('ON (TRANSACOES.FORNECEDOR_ID = FORNECEDORES.FORNECEDOR_ID)');
          //PAGOS
         if cmb_pagos.Text = 'Pagos/Recebidos' Then
         Begin
         QRel.Sql.Add('LEFT JOIN TABELAS');
         QRel.Sql.Add('ON ((ENTRADA.CONTA_ID = TABELAS.TABELA_ID) AND (TABELAS.TIPO_TABELA = ''4''))');
         End
         Else if cmb_pagos.Text = 'Não Pagos/Não Recebidos' Then
         Begin
          //NAO PAGOS
         QRel.Sql.Add('LEFT JOIN TABELAS');
         QRel.Sql.Add('ON ((TRANSACOES.CONTA_ID = TABELAS.TABELA_ID) AND (TABELAS.TIPO_TABELA = ''4''))');
         End;
        QRel.Sql.Add('WHERE');

         if cmb_pagos.Text = 'Pagos/Recebidos' Then
          //PAGOS
         QRel.Sql.Add('(TRANSACOES.CONDUTA = ''08'')')
         Else if cmb_pagos.Text = 'Não Pagos/Não Recebidos' Then
          //NAO PAGOS
         Begin

          QRel.Sql.Add('(TRANSACOES.CONDUTA = ''02'') AND (TRANSACOES.COND_PAGTO = ''A PRAZO'')');
          QRel.Sql.Add('AND (TRANSPARCELAS.VALOR > 0) AND (TRANSPARCELAS.AGRUPAMENTO = 0)');
          QRel.Sql.Add('AND ((TRANSPARCELAS.ESPECIE <> ''EXCLUIDO'') OR (TRANSPARCELAS.ESPECIE IS NULL))');


         End;


        QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM TRANSACOES WHERE HISTORICO LIKE  ''Ref. Devolução%''))');

        QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
        QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');

          if cmb_pagos.Text = 'Pagos/Recebidos' Then
          Begin

           QRel.Sql.Add('UNION ALL');
           QRel.Sql.Add('SELECT DISTINCT ''DESPESA'' LANCAMENTO, TRANSACOES.FINALIZADORA_ID,  TRANSACOES.COND_PAGTO FINALIZADORA,  TRANSACOES.TRANSACAO_ID, ');
           QRel.Sql.Add('TRANSACOES.FORNECEDOR_ID  , 0 CLIENTE_ID ,');
           QRel.Sql.Add('TRANSACOES.DT_TRANS DT_TRANS,');
           QRel.Sql.Add('CAST (''01/01/00'' AS DATE) DT_PAGAMENTO,');
           QRel.Sql.Add('NUM_DOC DOCUMENTO, TRANSACOES.COND_PAGTO,');
           QRel.Sql.Add('TRANSACOES.CONTA_ID CONTA, TABELAS.DESCRICAO PLANO_CONTA , BANCOS.NUM_CONTA CONTA_BANCO,');
           QRel.Sql.Add('0 CREDITO ,');
           QRel.Sql.Add('TRANSACOES.VALOR DEBITO,');
           QRel.Sql.Add('CAST (''01/01/00'' AS DATE) DT_VENCIMENTO, FORNECEDORES.NOME, FORNECEDORES.DDD, FORNECEDORES.TELEFONE_1 TELEFONE,');
           QRel.Sql.Add('0 ATRASO');
           QRel.Sql.Add('FROM TRANSACOES');
           QRel.Sql.Add('LEFT JOIN BANCOS');
           QRel.Sql.Add('ON BANCOS.BANCO_ID = TRANSACOES.BANCO_ID');
           QRel.Sql.Add('LEFT JOIN FORNECEDORES');
           QRel.Sql.Add('ON (TRANSACOES.FORNECEDOR_ID = FORNECEDORES.FORNECEDOR_ID)');
           QRel.Sql.Add('LEFT JOIN TABELAS');
           QRel.Sql.Add('ON ((TRANSACOES.CONTA_ID = TABELAS.TABELA_ID) AND (TABELAS.TIPO_TABELA = ''4''))');
           QRel.Sql.Add('WHERE');
           QRel.Sql.Add('(TRANSACOES.CONDUTA = ''02'') AND ((TRANSACOES.COND_PAGTO = ''A VISTA'') or (TRANSACOES.COND_PAGTO = ''CARTAO'')) ');

           QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM TRANSACOES WHERE HISTORICO LIKE  ''Ref. Devolução%''))');
           QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
           QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

           QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
           QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
           //QRel.Sql.Add('AND (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');

          End;

        End;


       QRel.Sql.Add(') AS DUPLICATA');

        if tipo.Text = 'Data Vencimento' Then
        QRel.Sql.Add('WHERE DUPLICATA.DT_VENCIMENTO BETWEEN :DT_INICIAL AND :DT_FINAL')
        Else if tipo.Text = 'Data Pagamento' Then
        QRel.Sql.Add('WHERE DUPLICATA.DT_PAGAMENTO BETWEEN :DT_INICIAL AND :DT_FINAL')
        Else
        QRel.Sql.Add('WHERE DUPLICATA.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL');

        IF CONTA_ID.Value > 0 Then
        Begin
        QRel.Sql.Add('AND DUPLICATA.CONTA = :CONTA_ID ');
        QRel.ParamByName('CONTA_ID').AsInteger := StrToInt(CONTA_ID.Text);
        End;

        if forne_cliente.Value > 0 then
        begin
          IF Tipo_Lancamento.Text = 'Receita' Then
          QRel.Sql.Add('AND (DUPLICATA.CLIENTE_ID = :FORNECEDOR_ID)')
          Else
          QRel.Sql.Add('AND (DUPLICATA.FORNECEDOR_ID = :FORNECEDOR_ID)');

          QRel.ParamByName('FORNECEDOR_ID').AsInteger := StrToInt(forne_cliente.Text);
        end;

        if not chk_pagos_Recebidos.Checked Then
        Begin
         if Cmb_Cond_Pagto.Text = 'A Vista' Then
         QRel.Sql.Add('AND DUPLICATA.COND_PAGTO = ''A VISTA'' ')
         Else if  Cmb_Cond_Pagto.Text = 'A Prazo' Then
         QRel.Sql.Add('AND DUPLICATA.COND_PAGTO = ''A PRAZO'' ');
        End;

        IF Cmb_Finalizadora.Text <> '' Then
        Begin
          IF Tipo_Lancamento.Text = 'Receita' Then
          Begin
           QFinalizadora.Sql.Clear;
           QFinalizadora.Sql.Add('SELECT * FROM FINALIZADORAS WHERE DESCRICAO = :DESCRICAO');
           QFinalizadora.ParamByName('DESCRICAO').AsString :=  Cmb_Finalizadora.Text;
           QFinalizadora.Prepare;
           QFinalizadora.Open;

           QRel.Sql.Add('AND DUPLICATA.FINALIZADORA_ID = :FINALIZADORA_ID ');
           QRel.ParamByName('FINALIZADORA_ID').AsInteger := QFinalizadora.FieldByName('FINALIZADORA_ID').AsInteger;
          End
          Else
          Begin

           QRel.Sql.Add('AND DUPLICATA.FINALIZADORA = :FINALIZADORA ');
           QRel.ParamByName('FINALIZADORA').AsString := Cmb_Finalizadora.Text;

          End;

        End;



       if tipo.Text = 'Data Vencimento' Then
       Begin
        if Ordem.Text = 'DATA, NOME' then
          QRel.Sql.Add('ORDER BY DUPLICATA.DT_VENCIMENTO, DUPLICATA.NOME')
        else if Ordem.Text = 'NOME, DATA' then
          QRel.Sql.Add('ORDER BY DUPLICATA.PLANO_CONTA, DUPLICATA.VENCIMENTO')
        else if Ordem.Text = 'DATA' then
          QRel.Sql.Add('ORDER BY DUPLICATA.DT_VENCIMENTO')
        else if Ordem.Text = 'NOME' then
          QRel.Sql.Add('ORDER BY DUPLICATA.PLANO_CONTA');
       End
       Else if tipo.Text = 'Data Pagamento' Then
       Begin
        if Ordem.Text = 'DATA, NOME' then
          QRel.Sql.Add('ORDER BY DUPLICATA.DT_PAGAMENTO, DUPLICATA.NOME')
        else if Ordem.Text = 'NOME, DATA' then
          QRel.Sql.Add('ORDER BY DUPLICATA.PLANO_CONTA, DUPLICATA.DT_PAGAMENTO')
        else if Ordem.Text = 'DATA' then
          QRel.Sql.Add('ORDER BY DUPLICATA.DT_PAGAMENTO')
        else if Ordem.Text = 'NOME' then
          QRel.Sql.Add('ORDER BY DUPLICATA.PLANO_CONTA');
       End
       Else
       Begin

        if Ordem.Text = 'DATA, NOME' then
          QRel.Sql.Add('ORDER BY DUPLICATA.DT_TRANS, DUPLICATA.NOME')
        else if Ordem.Text = 'NOME, DATA' then
          QRel.Sql.Add('ORDER BY DUPLICATA.PLANO_CONTA, DUPLICATA.DT_TRANS')
        else if Ordem.Text = 'DATA' then
          QRel.Sql.Add('ORDER BY DUPLICATA.DT_TRANS')
        else if Ordem.Text = 'NOME' then
          QRel.Sql.Add('ORDER BY DUPLICATA.PLANO_CONTA');
       End;



       QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
       QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
       QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
       QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;




       QRel.Prepare;
       QRel.Open;
      End;

      if QRel.IsEmpty then
        Application.MessageBox('Não há dados para os parâmetros informados', PChar(Msg_Title), mb_IconInformation)
      else
      Begin
        try

         QLayoutFastReport.SQL.Clear;
         QLayoutFastReport.SQL.Add('SELECT NOME_ARQUIVO, ARQUIVO_RELATORIO FROM CONFIG_RELATORIOS');
         QLayoutFastReport.SQL.Add('WHERE NOME_RELATORIO = :NOME_RELATORIO');
         QLayoutFastReport.SQL.Add('OR NOME_RELATORIO = :BASE;');
         QLayoutFastReport.ParamByName('NOME_RELATORIO').AsString := 'URelatorio_Duplicatas';
         QLayoutFastReport.ParamByName('BASE').AsString := 'base';
         QLayoutFastReport.Open();


        Except
        on e:Exception do
        begin
          Application.MessageBox(PChar('Erro:' + #13 +
            'Erro: ' + e.Message), 'Erro', MB_ICONSTOP + MB_TASKMODAL);
        end;


        end;


        Relatorio_Principal.Clear;


        DadosRelatorio.Open;
        DadosRelatorio.EmptyDataSet;


        while not QRel.eof Do
        Begin
        DadosRelatorio.append;

        DadosRelatorio.FieldByName('LANCAMENTO').AsString      := QRel.FieldByName('LANCAMENTO').AsString;
        DadosRelatorio.FieldByName('DT_TRANS').AsDateTime      := QRel.FieldByName('DT_TRANS').AsDateTime;
        DadosRelatorio.FieldByName('DT_PAGAMENTO').AsString    := (QRel.FieldByName('DT_PAGAMENTO').AsString);
        DadosRelatorio.FieldByName('DT_VENCIMENTO').AsDateTime := QRel.FieldByName('DT_VENCIMENTO').AsDateTime;
        DadosRelatorio.FieldByName('PLANO_CONTA').AsString     := QRel.FieldByName('PLANO_CONTA').AsString;
        DadosRelatorio.FieldByName('CONTA_BANCO').AsString     := QRel.FieldByName('CONTA_BANCO').AsString;
        DadosRelatorio.FieldByName('DOCUMENTO').AsString       := QRel.FieldByName('DOCUMENTO').AsString;
        DadosRelatorio.FieldByName('DEBITO').AsFloat           := QRel.FieldByName('DEBITO').AsFloat;
        DadosRelatorio.FieldByName('CREDITO').AsFloat          := QRel.FieldByName('CREDITO').AsFloat;
        DadosRelatorio.FieldByName('COND_PAGTO').AsString      := QRel.FieldByName('COND_PAGTO').AsString;
        DadosRelatorio.FieldByName('ID').AsInteger             := QRel.FieldByName('TRANSACAO_ID').AsInteger;
        DadosRelatorio.FieldByName('NOME').AsString            := Copy(QRel.FieldByName('NOME').AsString,1,45);


        DadosRelatorio.Post;

        QRel.Next;

        End;



        Relatorio_Principal.Clear;

        Relatorio_Principal.InheritFromTemplate('URelatorio_Duplicatas.fr3');

        IF Cmb_Finalizadora.Text <> '' Then
        Relatorio_Principal := FrmPrincipal.Configura_Relatorio_FastReport(Relatorio_Principal, 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text, 'Relatório de Contas: ' + QFinalizadora.FieldByName('DESCRICAO').AsString)
        Else
        Relatorio_Principal := FrmPrincipal.Configura_Relatorio_FastReport(Relatorio_Principal, 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text, 'Relatório de Contas');



        //Relatorio_Principal.InheritFromTemplate('URelatorio_Duplicatas.fr3');

       // Relatorio_Principal.LoadFromFile('c:\Eficaz7\URelatorio_Duplicatas.fr3');


        Relatorio_Principal.ShowReport(true);;



        //Duplicatas.Prepare;
        //Duplicatas.PreviewModal;


       { if (Chk_pagto.Checked) and (not Chk_pagto_Cartao.Checked) then
        QRLabel7.Caption := QFinalizadora.FieldByName('LEGENDA').AsString
        else if Chk_pagto_Cartao.Checked then
        QRLabel7.Caption := 'Todos os Cartões'
        Else
        QRLabel7.Caption := '';

        if (Chk_Sintetico.Checked) then
          Duplicatas_Sintetico.PreviewModal
        Else  if  Chk_sintetico_Recebidas.Checked then
          Duplicatas_Sintetico_recebidas.PreviewModal
        Else if Chk_sintetico_funcionario.Checked Then
          Duplicatas_Sintetico_Funcionario.PreviewModal
        Else if (Tipo_Duplicata.Text = 'Emitidas pela Empresa') OR (Tipo_Duplicata.Text = 'Pagas pela Empresa')  then
        Begin
          Duplicatas_Empresa.Prepare;
          Duplicatas_Empresa.PreviewModal;
        End
        Else
        Begin
          Duplicatas.Prepare;
          Duplicatas.PreviewModal;
        End;
         }
      End;

  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
    //Close;
  end;
end;

procedure TFrmRelatorio_Duplicatas.btnFornecedorClick(Sender: TObject);
begin
  if Tipo_LANCAMENTO.Text = 'Pagas pela Empresa' then
  Begin
  Id.Enabled := True;
  try
    Id.Value := GetConsulta('FORNECEDORES', 0, 0, StrToInt(Id.Text));
  except
    Id.Value := GetConsulta('FORNECEDORES', 0, 0, 0);
  end;
  End;

  if Tipo_LANCAMENTO.Text = 'Recebidas pela Empresa' then
  Begin
  Id.Enabled := True;
  try
    Id.Value := GetConsulta('CLIENTES', 0, 0, StrToInt(Id.Text));
  except
    Id.Value := GetConsulta('CLIENTES', 0, 0, 0);
  end;
  End;
end;

procedure TFrmRelatorio_Duplicatas.btnForne_ClienteClick(Sender: TObject);
begin
if Tipo_LANCAMENTO.Text = 'Despesa' then
  begin
    try
      Forne_Cliente.Value := GetConsulta('FORNECEDORES', 0, 0, StrToInt(Forne_Cliente.Text));
    except
      Forne_Cliente.Value := GetConsulta('FORNECEDORES', 0, 0, 0);
    end;
  end;

  if Tipo_LANCAMENTO.Text = 'Receita' then
  begin
    try
      Forne_Cliente.Value := GetConsulta('CLIENTES', 0, 0, StrToInt(Forne_Cliente.Text));
    except
      Forne_Cliente.Value := GetConsulta('CLIENTES', 0, 0, 0);
    end;
  end;
end;

procedure TFrmRelatorio_Duplicatas.btn_operadorClick(Sender: TObject);
begin
      try
        Operador.Text := IntToStr(GetConsulta('PESSOAL', 0, 0, StrToInt(Operador.Text)));
      except
        Operador.Text := IntToStr(GetConsulta('PESSOAL', 0, 0, 0));
      end;
end;

procedure TFrmRelatorio_Duplicatas.Button1Click(Sender: TObject);
begin
FrmPrincipal.Salva_Relatorio_FastReport_Bd(UnitName, 'vendas');
end;

procedure TFrmRelatorio_Duplicatas.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRelatorio_Duplicatas.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmRelatorio_Duplicatas.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key = Vk_F7) and (Sender = Operador) then
     btn_operadorClick(Self);

  if Key = Vk_Return then
  //  Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmRelatorio_Duplicatas.DuplicatasBeforePrint(
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

    
     //QRLabel8.Caption := 'OPERADOR: '+ Copy( QSearch.FieldByName('NOME').AsString, 1,40);

   end
   else
   Begin
    if Tipo_LANCAMENTO.Text = 'Emitidas pela Empresa' then
    QRLabel46.Caption := ''
    Else
    //QRLabel8.Caption := '';
   End;

end;

procedure TFrmRelatorio_Duplicatas.Duplicatas_EmpresaBeforePrint(
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


     QRLabel45.Caption := 'OPERADOR: '+ Copy( QSearch.FieldByName('NOME').AsString, 1,40);

   end
   else
   QRLabel45.Caption := '';

end;

procedure TFrmRelatorio_Duplicatas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmRelatorio_Duplicatas.FormCreate(Sender: TObject);
begin
  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);

  QFinalizadora.Open;

  Cmb_Finalizadora.Items.Clear;
  Cmb_Finalizadora.Items.Add(' ');
  QFinalizadora.First;

  While not QFinalizadora.eof do
  Begin
  Cmb_Finalizadora.Items.Add(QFinalizadora.FieldByName('DESCRICAO').AsString);
  QFinalizadora.Next;
  End;

end;

procedure TFrmRelatorio_Duplicatas.IdExit(Sender: TObject);
begin
if Tipo_LANCAMENTO.Text = 'Recebidas pela Empresa' then
ClienteSearch;
if Tipo_LANCAMENTO.Text = 'Pagas pela Empresa' then
FornecedorSearch;

end;

procedure TFrmRelatorio_Duplicatas.OperadorExit(Sender: TObject);
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

procedure TFrmRelatorio_Duplicatas.OperadorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

    if (Key = Vk_F7) and (Sender = Operador) then
     btn_operadorClick(Self);

    if (Key = Vk_F7) and (Sender = ID) then
     btnFORNECEDORClick(Self);

   if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);

end;

procedure TFrmRelatorio_Duplicatas.Relatorio_PrincipalLoadTemplate(
  Report: TfrxReport; const TemplateName: string);
var
  BlobStream: TStream;

begin
  QLayoutFastReport.First;
  while not QLayoutFastReport.Eof do
  begin
    //ShowMessage(TemplateName + ' ' + QLayoutFastReport.FieldByName('NOME_RELATORIO').AsString);
    if AnsiCompareText(QLayoutFastReport.FieldByName('NOME_ARQUIVO').AsString, TemplateName) = 0 then
    begin
      //ShowMessage(TemplateName + ' ' + QLayoutFastReport.FieldByName('NOME_ARQUIVO').AsString);
      //ShowMessage('Cheguei aqui');
      BlobStream := TMemoryStream.Create;
      TBlobField(QLayoutFastReport.FieldByName('ARQUIVO_RELATORIO')).SaveToStream(BlobStream);
      BlobStream.Position := 0;
      Report.LoadFromStream(BlobStream);
      BlobStream.Free;
      break;
    end;
    QLayoutFastReport.Next;
  end;
end;

procedure TFrmRelatorio_Duplicatas.Tipo_LancamentoChange(Sender: TObject);
begin

 if (Tipo_LANCAMENTO.Text = 'Receita')  then
 Begin
  QFinalizadora.Open;

  Cmb_Finalizadora.Items.Clear;
  Cmb_Finalizadora.Items.Add(' ');
  QFinalizadora.First;

  While not QFinalizadora.eof do
  Begin
  Cmb_Finalizadora.Items.Add(QFinalizadora.FieldByName('DESCRICAO').AsString);
  QFinalizadora.Next;
  End;

 End
 Else
 Begin

  Cmb_Finalizadora.Items.Clear;
  Cmb_Finalizadora.Items.Add(' ');
  Cmb_Finalizadora.Items.Add('A VISTA');
  Cmb_Finalizadora.Items.Add('A PRAZO');
  Cmb_Finalizadora.Items.Add('CHEQUE');
  Cmb_Finalizadora.Items.Add('CARTAO');
  Cmb_Finalizadora.Items.Add('PIX');

 End;

 {
 if (Tipo_LANCAMENTO.Text = 'Recebidas pela Empresa') then
  begin

    btn_operador.Enabled  := True;
    Operador.Enabled      := True;
    Chk_sintetico.Enabled := True;
    Chk_sintetico_Recebidas.Enabled := True;
    Chk_pagto.Enabled     := True;
    Chk_sintetico_funcionario.Enabled := True;


  end
 Else
 begin
      btn_operador.Enabled  := False;
      Operador.Enabled      := False;
      Chk_sintetico.Enabled := False;
      Chk_sintetico_Recebidas.Enabled := False;
      Chk_pagto.Enabled     := False;
      Chk_sintetico_funcionario.Enabled := False;
 end;
  }
end;

procedure TFrmRelatorio_Duplicatas.Tipo_LancamentoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

end.
