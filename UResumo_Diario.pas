unit UResumo_Diario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, rxCurrEdit, rxToolEdit, DBTables, DB,
  IBCustomDataSet, IBQuery, QRCtrls, QuickRpt, Buttons, DBCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Math;

type
  TFrmResumo_Diario = class(TForm)
    Label1: TLabel;
    Bevel1: TBevel;
    Dtmen: TDateEdit;
    Dtmai: TDateEdit;
    Resumo: TQuickRep;
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
    QRGroup1: TQRGroup;
    QRDBText1: TQRDBText;
    QRBand1: TQRBand;
    QRShape2: TQRShape;
    QRExpr1: TQRExpr;
    QRLabel10: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRShape4: TQRShape;
    QRExpr2: TQRExpr;
    QRShape5: TQRShape;
    QRExpr3: TQRExpr;
    btnExecuta: TBitBtn;
    btnRetorna: TBitBtn;
    Label2: TLabel;
    Caixa_Banco: TCurrencyEdit;
    btnCaixa_Banco: TSpeedButton;
    Resumo1: TQuickRep;
    QRBand2: TQRBand;
    QRDBText10: TQRDBText;
    QRSysData3: TQRSysData;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRLabel11: TQRLabel;
    QRSysData4: TQRSysData;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRBand3: TQRBand;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRGroup2: TQRGroup;
    QRDBText18: TQRDBText;
    QRBand4: TQRBand;
    QRShape8: TQRShape;
    QRExpr4: TQRExpr;
    QRShape9: TQRShape;
    QRExpr5: TQRExpr;
    QRShape10: TQRShape;
    QRExpr6: TQRExpr;
    Venda_prazo: TCheckBox;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    Label3: TLabel;
    Tipo_Rel: TComboBox;
    Detalhe_conta: TQuickRep;
    QRBand7: TQRBand;
    QRDBText21: TQRDBText;
    QRSysData7: TQRSysData;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRLabel29: TQRLabel;
    QRSysData8: TQRSysData;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel36: TQRLabel;
    QRBand8: TQRBand;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRGroup3: TQRGroup;
    QRDBText28: TQRDBText;
    QRBand9: TQRBand;
    QRShape16: TQRShape;
    QRExpr11: TQRExpr;
    QRShape18: TQRShape;
    QRExpr13: TQRExpr;
    Label4: TLabel;
    CONTA_ID: TCurrencyEdit;
    DBText3: TDBText;
    btnConta: TSpeedButton;
    DataConta: TDataSource;
    VENDA_FINALIZADORA: TCheckBox;
    DataFinalizadora: TDataSource;
    FinalizadoraBox: TDBLookupComboBox;
    Resumo_Sintetico_Cartao: TQuickRep;
    QRBand5: TQRBand;
    QRDBText9: TQRDBText;
    QRSysData5: TQRSysData;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRLabel22: TQRLabel;
    QRSysData6: TQRSysData;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel26: TQRLabel;
    QRBand6: TQRBand;
    QRDBText17: TQRDBText;
    v: TQRExpr;
    SummaryBand1: TQRBand;
    QRShape13: TQRShape;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    Resumo2: TQuickRep;
    QRBand10: TQRBand;
    QRDBText27: TQRDBText;
    QRSysData9: TQRSysData;
    QRLabel35: TQRLabel;
    QRLabel37: TQRLabel;
    QRShape17: TQRShape;
    QRShape19: TQRShape;
    QRLabel38: TQRLabel;
    QRSysData10: TQRSysData;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRBand11: TQRBand;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRGroup4: TQRGroup;
    QRDBText35: TQRDBText;
    QRBand12: TQRBand;
    QRShape20: TQRShape;
    QRExpr12: TQRExpr;
    QRShape21: TQRShape;
    QRExpr14: TQRExpr;
    QRShape22: TQRShape;
    QRExpr15: TQRExpr;
    QRLabel46: TQRLabel;
    QRDBText36: TQRDBText;
    Sel_Cartao: TCheckBox;
    QConta: TFDQuery;
    QFinalizadora: TFDQuery;
    QRel: TFDQuery;
    Table_Temp: TFDMemTable;
    Label9: TLabel;
    C_CUSTO_ID: TCurrencyEdit;
    btnCentro_Custo: TSpeedButton;
    DBText5: TDBText;
    QCusto: TFDQuery;
    DataCusto: TDataSource;
    QRLabel47: TQRLabel;
    QSearch: TFDQuery;
    Chk_Todos: TCheckBox;
    Detalhe_Conta_Funcionario: TQuickRep;
    QRBand13: TQRBand;
    QRDBText37: TQRDBText;
    QRSysData11: TQRSysData;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRLabel50: TQRLabel;
    QRSysData12: TQRSysData;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRBand14: TQRBand;
    QRDBText38: TQRDBText;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    QRDBText42: TQRDBText;
    QRGroup5: TQRGroup;
    QRDBText43: TQRDBText;
    QRBand15: TQRBand;
    QRShape25: TQRShape;
    QRExpr16: TQRExpr;
    QRShape26: TQRShape;
    QRExpr17: TQRExpr;
    QRLabel57: TQRLabel;
    QRExpr18: TQRExpr;
    QRExpr19: TQRExpr;
    QRShape27: TQRShape;
    QRExpr7: TQRExpr;
    Resumo_Sintetico: TQuickRep;
    QRBand16: TQRBand;
    QRDBText19: TQRDBText;
    QRSysData13: TQRSysData;
    QRLabel25: TQRLabel;
    QRLabel58: TQRLabel;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRLabel59: TQRLabel;
    QRSysData14: TQRSysData;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRBand17: TQRBand;
    QRDBText20: TQRDBText;
    QRDBText44: TQRDBText;
    QRDBText45: TQRDBText;
    QRExpr8: TQRExpr;
    QRBand18: TQRBand;
    QRShape30: TQRShape;
    QRExpr20: TQRExpr;
    QRExpr21: TQRExpr;
    QRExpr22: TQRExpr;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRExpr24: TQRExpr;
    QRExpr23: TQRExpr;
    procedure btnRetornaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnExecutaClick(Sender: TObject);
    procedure DtmenEnter(Sender: TObject);
    procedure btnCaixa_BancoClick(Sender: TObject);
    procedure QRBand2AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure ColumnHeaderBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure Caixa_BancoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnContaClick(Sender: TObject);
    procedure CONTA_IDExit(Sender: TObject);
    procedure CONTA_IDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Tipo_RelChange(Sender: TObject);
    procedure VENDA_FINALIZADORAClick(Sender: TObject);
    procedure Venda_prazoClick(Sender: TObject);
    procedure FinalizadoraBoxClick(Sender: TObject);
    procedure Sel_CartaoClick(Sender: TObject);
    procedure btnCentro_CustoClick(Sender: TObject);
    procedure QRBand5BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DetailSearch(Tabela: String);
  end;

var
  FrmResumo_Diario: TFrmResumo_Diario;

implementation

uses
  Uprincipal, UData, UConsulta;

{$R *.dfm}

procedure TFrmResumo_Diario.DetailSearch(Tabela: String);
Begin
if ((Tabela = '') or (Tabela = 'Conta')) and (CONTA_ID.Text <> '') then
  begin
    QConta.Close;

    QConta.ParamByName('TABELA_ID').AsInteger := StrToInt(CONTA_ID.Text);

    QConta.Prepare;
    QConta.Open;
  end;
End;



procedure TFrmResumo_Diario.btnCaixa_BancoClick(Sender: TObject);
begin
  try
    Caixa_Banco.Value := GetConsulta('BANCOS', 0, 0, StrToInt(Caixa_Banco.Text));
  except
    Caixa_Banco.Value := GetConsulta('BANCOS', 0, 0, 0);
  end;

end;

procedure TFrmResumo_Diario.btnCentro_CustoClick(Sender: TObject);
begin
 try
    C_CUSTO_ID.Value := GetConsulta('CCUSTO', 0, 0, StrToInt(C_CUSTO_ID.Text));
  except
    C_CUSTO_ID.Value := GetConsulta('CCUSTO', 0, 0, 0);
  end;
end;

procedure TFrmResumo_Diario.btnContaClick(Sender: TObject);
begin
  try
    CONTA_ID.Value := GetConsulta('CONTAS', 0, 0, StrToInt(CONTA_ID.Text));
  except
    CONTA_ID.Value := GetConsulta('CONTAS', 0, 0, 0);
  end;

  DetailSearch('Conta');

end;

procedure TFrmResumo_Diario.btnExecutaClick(Sender: TObject);
var
Sub_Tit, Temp_Name: String;
begin
  if Tipo_Rel.Text = 'Analítico' then
  begin
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
            Add('CONDUTA', ftString, 40, False);
            Add('DT_TRANS', ftDate, 0, False);
            Add('NUM_DOC', ftString, 9, False);
            Add('HISTORICO', ftString, 40, False);
            Add('ACRESCIMO', ftFloat, 0, False);
            Add('DESCONTO', ftFloat, 0, False);
            Add('VALOR', ftFloat, 0, False);
            Add('BANCO_ID',ftInteger,0,False);
            Add('BANCO_ID_PAGTO',ftInteger,0,False);
            Add('CLIENTE_ID',ftInteger,0,False);
            Add('NOME',ftString,40,False);
            Add('VALOR_REC',ftFloat,0,False);
            Add('TX_ADM',ftFloat,0,False);
          end;

          with IndexDefs do
          begin
            Clear;
            Add('', 'ID', [ixPrimary, ixUnique]);
            Add('TEMP', 'CONDUTA', [ixCaseInsensitive, ixDescending]);
          end;
          Open;
        end;
      except
       Application.MessageBox('Ocorreu um erro ao criar um arquivo temporário', PChar(Msg_Title), mb_IconStop);
       exit;
      end;
      {
      QRel.Sql.Clear;
      QRel.Sql.Add('SELECT TRANSACOES.*, CLIENTES.NOME , FINALIZADORAS.TIPO_TRANSACAO, CLIENTES.CLIENTE_ID, TRANSPARCELAS.BANCO_ID BANCO_ID_PAGTO, TRANSPARCELAS.VALOR VALOR_REC, TRANSPARCELAS.PARCELA_ID PARCELAS FROM TRANSACOES ');
      QRel.SQL.Add('LEFT JOIN CLIENTES ON CLIENTES.CLIENTE_ID = TRANSACOES.CLIENTE_ID ');
      QRel.SQL.Add('LEFT JOIN FINALIZADORAS ON FINALIZADORAS.FINALIZADORA_ID = TRANSACOES.FINALIZADORA_ID ');
      QRel.SQL.Add('LEFT JOIN TRANSPARCELAS ON TRANSPARCELAS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID ');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND ((TRANSPARCELAS.BANCO_ID = 0) OR (TRANSPARCELAS.BANCO_ID IS NULL))');
      QRel.Sql.Add('AND (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL) ');
      QRel.Sql.Add('AND (TRANSACOES.BALANCO <> :BALANCO)');
      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');
       }

      QRel.Sql.Clear;
      QRel.Sql.Add('SELECT TABELAS.DESCRICAO NOME_CONTA, TRANSACOES.*, CLIENTES.NOME , FINALIZADORAS.TIPO_TRANSACAO, CLIENTES.CLIENTE_ID, TRANSPARCELAS.BANCO_ID BANCO_ID_PAGTO, TRANSPARCELAS.VALOR VALOR_REC, TRANSPARCELAS.PARCELA_ID PARCELAS FROM TRANSACOES ');
      QRel.Sql.Add('LEFT JOIN TABELAS');
      QRel.Sql.Add('ON ((TRANSACOES.CONTA_ID = TABELAS.TABELA_ID) AND (TABELAS.TIPO_TABELA = :TIPO_TABELA))');
      QRel.SQL.Add('LEFT JOIN CLIENTES ON CLIENTES.CLIENTE_ID = TRANSACOES.CLIENTE_ID ');
      QRel.SQL.Add('LEFT JOIN FINALIZADORAS ON FINALIZADORAS.FINALIZADORA_ID = TRANSACOES.FINALIZADORA_ID ');
      QRel.SQL.Add('LEFT JOIN TRANSPARCELAS ON TRANSPARCELAS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID ');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSACOES.TPCTB <= :TPCTB)');
      QRel.SQL.Add('AND TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.DT_ENT_SAI BETWEEN :DT_INICIAL AND :DT_FINAL) ');
      QRel.Sql.Add('AND (TRANSACOES.BALANCO <> :BALANCO)');
      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');



      if Caixa_banco.Value <> 0 then
       QRel.Sql.Add('AND (TRANSACOES.BANCO_ID = :BANCO_ID)');

       if C_Custo_id.Value <> 0 then
       QRel.Sql.Add('AND (TRANSACOES.C_CUSTO_ID = :CUSTO_ID)');

       QRel.Sql.Add('ORDER BY DT_TRANS, NUM_DOC , NOME ');

      if venda_prazo.Checked then
      Begin
      QRel.Sql.Clear;
      QRel.Sql.Add('SELECT TRANSACOES.*, CLIENTES.NOME , CLIENTES.CLIENTE_ID, TRANSPARCELAS.VALOR VALOR_REC, TRANSPARCELAS.BANCO_ID BANCO_ID_PAGTO, FINALIZADORAS.TIPO_TRANSACAO, TRANSPARCELAS.PARCELA_ID PARCELAS FROM TRANSACOES ');
      QRel.SQL.Add('LEFT JOIN CLIENTES ON CLIENTES.CLIENTE_ID = TRANSACOES.CLIENTE_ID ');
      QRel.SQL.Add('LEFT JOIN TRANSPARCELAS ON TRANSPARCELAS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID ');
      QRel.SQL.Add('LEFT JOIN FINALIZADORAS ON FINALIZADORAS.FINALIZADORA_ID = TRANSACOES.FINALIZADORA_ID ');
      QRel.Sql.Add('LEFT JOIN TABELAS');
      QRel.Sql.Add('ON ((TRANSACOES.CONTA_ID = TABELAS.TABELA_ID) AND (TABELAS.TIPO_TABELA = :TIPO_TABELA))');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL) ');
      QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :CONDUTA)');
      QRel.Sql.Add('AND (TRANSACOES.DEPTO = :DEPTO)');
      QRel.Sql.Add('AND (TRANSACOES.COND_PAGTO = :COND_PAGTO)');
      QRel.Sql.Add('AND (TRANSPARCELAS.VALOR > 0)');
      QRel.SQL.Add('AND (TRANSPARCELAS.BANCO_ID = 0)');
      QRel.Sql.Add('AND ((TRANSPARCELAS.AGRUPAMENTO = 0) OR (TRANSPARCELAS.AGRUPAMENTO IS NULL))');
      QRel.Sql.Add('AND (TRANSPARCELAS.TIPO_TRANSACAO = :TIPO) ');
      QRel.Sql.Add('AND (TRANSACOES.FINALIZADORA_ID > 0) ');
      QRel.Sql.Add('AND (TRANSACOES.BALANCO <> :BALANCO)');
      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

       if Caixa_banco.Value <> 0 then
       QRel.Sql.Add('AND (TRANSACOES.BANCO_ID = :BANCO_ID)');

       if C_Custo_id.Value <> 0 then
       QRel.Sql.Add('AND (TRANSACOES.C_CUSTO_ID = :CUSTO_ID)');

      QRel.Sql.Add('ORDER BY NOME, DT_TRANS, NUM_DOC');

      QRlabel6.Caption :='*** RELATÓRIO DE VENDAS A PRAZO ***'
      End;

      if venda_Finalizadora.Checked then
      Begin
        QRel.Sql.Clear;
        QRel.Sql.Add('SELECT TRANSACOES.*, FINALIZADORAS.DESCRICAO NOME, FINALIZADORAS.TIPO_TRANSACAO, FINALIZADORAS.TX_ADM TAXAS, TRANSPARCELAS.PARCELA_ID PARCELAS , 0 BANCO_ID_PAGTO,TRANSPARCELAS.VALOR VALOR_REC FROM TRANSACOES ');
        QRel.SQL.Add('INNER JOIN FINALIZADORAS ON FINALIZADORAS.FINALIZADORA_ID = TRANSACOES.FINALIZADORA_ID ');
        QRel.SQL.Add('LEFT JOIN TRANSPARCELAS ON TRANSPARCELAS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID ');
        QRel.Sql.Add('LEFT JOIN TABELAS');
        QRel.Sql.Add('ON ((TRANSACOES.CONTA_ID = TABELAS.TABELA_ID) AND (TABELAS.TIPO_TABELA = :TIPO_TABELA))');
        QRel.Sql.Add('WHERE');
        QRel.Sql.Add('(TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
        QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
        QRel.Sql.Add('AND (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL) ');
        QRel.Sql.Add('AND (TRANSACOES.FINALIZADORA_ID > 0)');
        QRel.Sql.Add('AND (TRANSACOES.BALANCO <> :BALANCO)');
        QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
        QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');
        QRel.Sql.Add('AND (TRANSACOES.COND_PAGTO ILIKE ''CART%'')');

        if NOT Qfinalizadora.IsEmpty then
        QRel.Sql.Add('AND (TRANSACOES.FINALIZADORA_ID = :FINALIZADORA_ID) ');

        if Caixa_banco.Value <> 0 then
        QRel.Sql.Add('AND (TRANSACOES.BANCO_ID = :BANCO_ID)');

        if C_Custo_id.Value <> 0 then
        QRel.Sql.Add('AND (TRANSACOES.C_CUSTO_ID = :CUSTO_ID)');

      End;


      if (venda_Finalizadora.Checked) then
      Begin
        QRel.Sql.Clear;
        QRel.Sql.Add('SELECT TRANSACOES.*, FINALIZADORAS.DESCRICAO NOME, FINALIZADORAS.TIPO_TRANSACAO, FINALIZADORAS.TX_ADM TAXAS, TRANSPARCELAS.PARCELA_ID PARCELAS , 0 BANCO_ID_PAGTO,TRANSPARCELAS.VALOR VALOR_REC FROM TRANSACOES ');
        QRel.SQL.Add('INNER JOIN FINALIZADORAS ON FINALIZADORAS.FINALIZADORA_ID = TRANSACOES.FINALIZADORA_ID ');
        QRel.SQL.Add('LEFT JOIN TRANSPARCELAS ON TRANSPARCELAS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID ');
        QRel.Sql.Add('LEFT JOIN TABELAS');
        QRel.Sql.Add('ON ((TRANSACOES.CONTA_ID = TABELAS.TABELA_ID) AND (TABELAS.TIPO_TABELA = :TIPO_TABELA))');
        QRel.Sql.Add('WHERE');
        QRel.Sql.Add('(TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
        QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
        QRel.Sql.Add('AND (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL) ');
        QRel.Sql.Add('AND (TRANSACOES.FINALIZADORA_ID > 0)');
        QRel.Sql.Add('AND (TRANSACOES.BALANCO <> :BALANCO)');
        QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
        QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');
        QRel.Sql.Add('AND (TRANSACOES.COND_PAGTO ILIKE ''CART%'')');

        if NOT Qfinalizadora.IsEmpty then
        QRel.Sql.Add('AND (TRANSACOES.FINALIZADORA_ID = :FINALIZADORA_ID) ');

        if Caixa_banco.Value <> 0 then
        QRel.Sql.Add('AND (TRANSACOES.BANCO_ID = :BANCO_ID)');

        if C_Custo_id.Value <> 0 then
        QRel.Sql.Add('AND (TRANSACOES.C_CUSTO_ID = :CUSTO_ID)');

      End;


      QRel.ParamByName('TIPO_TABELA').AsString  := '4';
      QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
      QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
      QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
      QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
      QRel.ParamByName('BALANCO').AsString      := 'AGRUPADO';

      if Caixa_banco.Value <> 0 then
      QRel.ParamByName('BANCO_ID').AsInteger    := StrToInt(Caixa_banco.Text);

      if C_CUSTO_ID.Value <> 0 then
      QRel.ParamByName('CUSTO_ID').AsInteger    := StrToInt(C_CUSTO_ID.Text);

        If venda_prazo.Checked then
        Begin
        QRel.ParamByName('CONDUTA').AsString    := '01';
        QRel.ParamByName('DEPTO').AsString      := '07';
        QRel.ParamByName('COND_PAGTO').AsString := 'A PRAZO';
        QRel.ParamByName('TIPO').AsString       := 'T';
        End;

      if venda_Finalizadora.Checked then


      if not QFinalizadora.IsEmpty then
        QRel.ParamByName('FINALIZADORA_ID').AsInteger := QFinalizadora.FieldByName('FINALIZADORA_ID').AsInteger;

      QRel.Prepare;
      QRel.Open;

      QRel.First;
      while not QRel.Eof do
      begin

        if (QRel.FieldByName('PARCELA_ID').AsString = 'F') OR (QRel.FieldByName('PARCELA_ID').AsString = '0000F')  Then
        Begin
        if (QRel.FieldByName('CONDUTA').AsString = '01') and (QRel.FieldByName('DEPTO').AsString = '07') and (QRel.FieldByName('BANCO_ID_PAGTO').AsInteger > 0) and (QRel.FieldByName('TIPO_VENDA').AsString = 'VENDA')
            and (Copy(QRel.FieldByName('PARCELAS').AsString,4,2) = '00') then
              Sub_Tit := '*** Venda a Vista ***';

        if (QRel.FieldByName('CONDUTA').AsString = '01') and (QRel.FieldByName('DEPTO').AsString = '07') and (QRel.FieldByName('BANCO_ID_PAGTO').AsInteger > 0) and (QRel.FieldByName('TIPO_VENDA').AsString = 'VENDA')
            and (Copy(QRel.FieldByName('PARCELAS').AsString,4,2) = '02') then
              Sub_Tit := '*** Venda Cheque ***';

        if (QRel.FieldByName('CONDUTA').AsString = '01') and (QRel.FieldByName('DEPTO').AsString = '07') and (QRel.FieldByName('BANCO_ID_PAGTO').AsInteger > 0) and (QRel.FieldByName('TIPO_VENDA').AsString = 'VENDA')
            and (Copy(QRel.FieldByName('PARCELAS').AsString,4,2) >= '03') then
              Sub_Tit := '*** Venda a Cartão ***';

        if (QRel.FieldByName('CONDUTA').AsString = '01') and (QRel.FieldByName('DEPTO').AsString = '07') and (QRel.FieldByName('BANCO_ID_PAGTO').AsInteger > 0) and (QRel.FieldByName('TIPO_VENDA').AsString = 'VENDA')
            and (Copy(QRel.FieldByName('PARCELAS').AsString,4,2) >= '04') then
              Sub_Tit := '*** Venda Pix ***';



        if (QRel.FieldByName('CONDUTA').AsString = '01') and (QRel.FieldByName('DEPTO').AsString = '07')  AND (QRel.FieldByName('CLIENTE_ID').AsInteger > 0) AND (QRel.FieldByName('BANCO_ID_PAGTO').AsInteger = 0) then
              Sub_Tit := '*** Venda a Prazo ***';


        if (QRel.FieldByName('CONDUTA').AsString = '01') and (QRel.FieldByName('DEPTO').AsString = '07') and (QRel.FieldByName('COND_PAGTO').AsString = 'A PRAZO') AND (QRel.FieldByName('BANCO_ID_PAGTO').AsInteger = 0) AND (QRel.FieldByName('VALOR_REC').AsFloat > 0) then
            Sub_Tit := '*** Parcelas a Receber ***';
        End
        Else
        Begin
        if (QRel.FieldByName('CONDUTA').AsString = '01') and (QRel.FieldByName('DEPTO').AsString = '07') and (QRel.FieldByName('COND_PAGTO').AsString = 'A VISTA') and (QRel.FieldByName('TIPO_VENDA').AsString = 'VENDA') then
            Sub_Tit := '*** Venda a Vista ***';

        if (QRel.FieldByName('CONDUTA').AsString = '01') and (QRel.FieldByName('DEPTO').AsString = '07') and (QRel.FieldByName('COND_PAGTO').AsString = 'A PRAZO') and (QRel.FieldByName('BANCO_ID_PAGTO').AsInteger > 0)  then
          Sub_Tit := '*** Entrada de venda a Prazo ***';

        if (QRel.FieldByName('CONDUTA').AsString = '01') and (QRel.FieldByName('DEPTO').AsString = '07') and (QRel.FieldByName('COND_PAGTO').AsString = 'A PRAZO') AND (QRel.FieldByName('BANCO_ID_PAGTO').AsInteger = 0) AND (QRel.FieldByName('VALOR_REC').AsFloat > 0) then
            Sub_Tit := '*** Parcelas a Receber ***';

         if (QRel.FieldByName('CONDUTA').AsString = '01') and (QRel.FieldByName('DEPTO').AsString = '07') and (QRel.FieldByName('COND_PAGTO').AsString = 'CARTAO') AND (QRel.FieldByName('BANCO_ID_PAGTO').AsInteger = 0) then
            Sub_Tit := '*** Venda a Cartão ***';

          if (QRel.FieldByName('CONDUTA').AsString = '01') and (QRel.FieldByName('DEPTO').AsString = '07') and (QRel.FieldByName('COND_PAGTO').AsString = 'CHEQUE') AND (QRel.FieldByName('BANCO_ID_PAGTO').AsInteger = 0) then
            Sub_Tit := '*** Venda Cheque ***';

          if (QRel.FieldByName('CONDUTA').AsString = '01') and (QRel.FieldByName('DEPTO').AsString = '07') and (QRel.FieldByName('COND_PAGTO').AsString = 'PIX') AND (QRel.FieldByName('BANCO_ID_PAGTO').AsInteger = 0) then
            Sub_Tit := '*** Venda Pix ***';

        End;

        if (QRel.FieldByName('CONDUTA').AsString = '01') and (QRel.FieldByName('DEPTO').AsString = '07') and (QRel.FieldByName('TIPO_VENDA').AsString <> 'VENDA') then
          Sub_Tit := '*** Outras Vendas ***';

        if (QRel.FieldByName('CONDUTA').AsString = '01') and (QRel.FieldByName('DEPTO').AsString <> '07') and (QRel.FieldByName('COND_PAGTO').AsString = 'A VISTA') then
          Sub_Tit := '*** Receita a Vista ***';

        if (QRel.FieldByName('CONDUTA').AsString = '02') and (QRel.FieldByName('DEPTO').AsString = '07') and (QRel.FieldByName('COND_PAGTO').AsString = 'A VISTA') and (QRel.FieldByName('TIPO_COMPRA').AsString = 'COMPRA') then
          Sub_Tit := '*** Compra a Vista ***';

        if (QRel.FieldByName('CONDUTA').AsString = '02') and (QRel.FieldByName('DEPTO').AsString = '07') and (QRel.FieldByName('TIPO_COMPRA').AsString <> 'COMPRA') then
          Sub_Tit := '*** Outras Compras ***';

        if (QRel.FieldByName('CONDUTA').AsString = '02') and (QRel.FieldByName('DEPTO').AsString <> '07') and (QRel.FieldByName('COND_PAGTO').AsString = 'A VISTA') then
          Sub_Tit := '*** Despesa a Vista ***';

        if (QRel.FieldByName('CONDUTA').AsString = '01') and (QRel.FieldByName('DEPTO').AsString <> '07') and (QRel.FieldByName('COND_PAGTO').AsString = 'A PRAZO') then
          Sub_Tit := '*** Receita a Prazo ***';

        if (QRel.FieldByName('CONDUTA').AsString = '02') and (QRel.FieldByName('DEPTO').AsString = '07') and (QRel.FieldByName('COND_PAGTO').AsString = 'A PRAZO') then
          Sub_Tit := '*** Compra a Prazo ***';

        if (QRel.FieldByName('CONDUTA').AsString = '02') and (QRel.FieldByName('DEPTO').AsString <> '07') and (QRel.FieldByName('COND_PAGTO').AsString = 'A PRAZO') then
          Sub_Tit := '*** Despesa a Prazo ***';

        if (QRel.FieldByName('CONDUTA').AsString = '02') and (QRel.FieldByName('DEPTO').AsString = '10') then
          Sub_Tit := '*** Devolução de Venda ***';

        if (QRel.FieldByName('CONDUTA').AsString = '01') and (QRel.FieldByName('DEPTO').AsString = '10') then
          Sub_Tit := '*** Devolução de Compra ***';

        if (QRel.FieldByName('CONDUTA').AsString = '02') and (QRel.FieldByName('DEPTO').AsString = '04') then
          Sub_Tit := '*** Transf. Entre Contas ***';

        if (QRel.FieldByName('CONDUTA').AsString = '07') and (QRel.FieldByName('BANCO_ID_PAGTO').AsInteger = 0)   then
          Sub_Tit := '*** Recebimento de Contas ***';

        if (QRel.FieldByName('CONDUTA').AsString = '08') then
          Sub_Tit := '*** Pagamento de Contas ***';

        if QRel.FieldByName('CONDUTA').AsString = '17' then
          Sub_Tit := '*** Consumo de Estoque ***';

        if QRel.FieldByName('CONDUTA').AsString = '18' then
          Sub_Tit := '*** Dev. de Consumo de Estoque ***';

        if (QRel.FieldByName('CONDUTA').AsString = '19') and (QRel.FieldByName('DEPTO').AsString = '07') then
          Sub_Tit := '*** Entrada de Produto Acabado ***';

        if (QRel.FieldByName('CONDUTA').AsString = '20') and (QRel.FieldByName('DEPTO').AsString = '07') then
          Sub_Tit := '*** Transferência de Estoque ***';

        Table_Temp.Append;
        Table_Temp.FieldByName('CONDUTA').AsString     := Sub_Tit;
        Table_Temp.FieldByName('DT_TRANS').AsString    := QRel.FieldByName('DT_TRANS').AsString;
        Table_Temp.FieldByName('NUM_DOC').AsString     := QRel.FieldByName('NUM_DOC').AsString;
        Table_Temp.FieldByName('HISTORICO').AsString   := QRel.FieldByName('HISTORICO').AsString + ' Parc.:' + QRel.FieldByName('PARCELAS').AsString;
        Table_Temp.FieldByName('ACRESCIMO').AsFloat    := QRel.FieldByName('VR_ACRESCIMO').AsFloat;

        if (venda_Finalizadora.Checked) then
        Table_Temp.FieldByName('TX_ADM').AsFloat       :=  RoundTo((QRel.FieldByName('TAXAS').AsFloat * QRel.FieldByName('VALOR').AsFloat / 100), -2)
        Else
        Table_Temp.FieldByName('TX_ADM').AsFloat       := 0;

        if (QRel.FieldByName('PARCELA_ID').AsString = 'F') OR (QRel.FieldByName('PARCELA_ID').AsString = '0000F')  Then
        Begin
        Table_Temp.FieldByName('VALOR').AsFloat        := QRel.FieldByName('VALOR_REC').AsFloat;
        Table_Temp.FieldByName('DESCONTO').AsFloat     := 0;
        End
        Else
        Begin
        Table_Temp.FieldByName('VALOR').AsFloat        := QRel.FieldByName('VALOR').AsFloat;
        Table_Temp.FieldByName('DESCONTO').AsFloat     := QRel.FieldByName('VR_DESCONTO').AsFloat;
        End;

        Table_Temp.FieldByName('BANCO_ID').AsInteger         := QRel.FieldByName('BANCO_ID').AsInteger;
        Table_Temp.FieldByName('BANCO_ID_PAGTO').AsInteger   := QRel.FieldByName('BANCO_ID_PAGTO').AsInteger;
        Table_Temp.FieldByName('CLIENTE_ID').AsInteger       := QRel.FieldByName('CLIENTE_ID').AsInteger;
        Table_Temp.FieldByName('NOME').AsString              := QRel.FieldByName('NOME').AsString;

        if (venda_prazo.Checked)  THEN
        Begin
        Table_Temp.FieldByName('VALOR_REC').AsFloat    := QRel.FieldByName('VALOR_REC').AsFloat;
        Table_Temp.FieldByName('HISTORICO').AsString   := QRel.FieldByName('PARCELAS').AsString;
        End;

        if (((QRel.FieldByName('CONDUTA').AsString = '01') OR (QRel.FieldByName('CONDUTA').AsString = '02') ) and (QRel.FieldByName('COND_PAGTO').AsString = 'A PRAZO')) then
        Begin
        Table_Temp.FieldByName('VALOR').AsFloat        := QRel.FieldByName('VALOR_REC').AsFloat;
        Table_Temp.FieldByName('DESCONTO').AsFloat     := 0;
        End;


        Table_Temp.Post;

        Application.ProcessMessages;
        QRel.Next;
      end;

      If (not venda_prazo.Checked) AND (not Venda_Finalizadora.Checked) then
      Begin
        QRel.Sql.Clear;
        QRel.Sql.Add('SELECT TRANSACOES.*,  TRANSPARCELAS.VALOR AS VR_RECEBIMENTO, TRANSPARCELAS.DT_VENCIMENTO,TRANSPARCELAS.PARCELA_ID PARCELAS ');
        QRel.Sql.Add('FROM TRANSACOES');
        QRel.Sql.Add('LEFT JOIN TRANSPARCELAS');
        QRel.Sql.Add('ON (TRANSACOES.TRANSACAO_ID = TRANSPARCELAS.TRANSACAO_ID)');
        QRel.Sql.Add('WHERE');
        QRel.Sql.Add('(TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
        QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
        QRel.Sql.Add('AND (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
        QRel.Sql.Add('AND (TRANSACOES.DT_TRANS <> TRANSPARCELAS.DT_VENCIMENTO)');
        QRel.Sql.Add('AND (TRANSPARCELAS.BANCO_ID > 0)');
        QRel.Sql.Add('AND ((TRANSPARCELAS.AGRUPAMENTO = 0) OR (TRANSPARCELAS.AGRUPAMENTO IS NULL))');
        QRel.Sql.Add('AND (TRANSPARCELAS.TIPO_TRANSACAO = :TIPO_TRANSACAO) ');
        QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
        QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

         if Caixa_banco.Value <> 0 then
         QRel.Sql.Add('AND (TRANSACOES.BANCO_ID = :BANCO_ID)');

           if C_Custo_id.Value <> 0 then
        QRel.Sql.Add('AND (TRANSACOES.C_CUSTO_ID = :CUSTO_ID)');


        QRel.Sql.Add('ORDER BY TRANSACOES.DT_TRANS, TRANSACOES.NUM_DOC ');


        QRel.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
        QRel.ParamByName('TPCTB').AsString          := FrmData.QAcesso.FieldByName('TPCTB').AsString;
        QRel.ParamByName('DT_INICIAL').AsDateTime   := Dtmen.Date;
        QRel.ParamByName('DT_FINAL').AsDateTime     := Dtmai.Date;
        QRel.ParamByName('TIPO_TRANSACAO').AsString := 'T';

         if Caixa_banco.Value <> 0 then
        QRel.ParamByName('BANCO_ID').AsInteger    := StrToInt(Caixa_banco.Text);

        if C_CUSTO_ID.Value <> 0 then
        QRel.ParamByName('CUSTO_ID').AsInteger    := StrToInt(C_CUSTO_ID.Text);



        QRel.Prepare;
        QRel.Open;

        QRel.First;
        while not QRel.Eof do
        begin
          if (QRel.FieldByName('CONDUTA').AsString = '01') and (QRel.FieldByName('COND_PAGTO').AsString = 'A PRAZO') AND (QRel.FieldByName('DT_VENCIMENTO').AsDateTime = QRel.FieldByName('DT_TRANS').AsDateTime) AND
             (QRel.FieldByName('PARCELAS').AsString = '01/11')  then
            Sub_Tit := '*** Entrada de venda a Prazo   ***';

          if (QRel.FieldByName('CONDUTA').AsString = '01') and (QRel.FieldByName('COND_PAGTO').AsString = 'A PRAZO') AND (QRel.FieldByName('DT_VENCIMENTO').AsDateTime <> QRel.FieldByName('DT_TRANS').AsDateTime)  then
            Sub_Tit := '*** Recebimento de Contas ***';

          if (QRel.FieldByName('CONDUTA').AsString = '02') and (QRel.FieldByName('COND_PAGTO').AsString = 'A PRAZO') then
            Sub_Tit := '*** Pagamento de Contas ***';

          Table_Temp.Append;
          Table_Temp.FieldByName('CONDUTA').AsString   := Sub_Tit;
          Table_Temp.FieldByName('DT_TRANS').AsString  := QRel.FieldByName('DT_TRANS').AsString;
          Table_Temp.FieldByName('NUM_DOC').AsString   := QRel.FieldByName('NUM_DOC').AsString;
          Table_Temp.FieldByName('HISTORICO').AsString := QRel.FieldByName('HISTORICO').AsString;
          Table_Temp.FieldByName('ACRESCIMO').AsFloat  := 0;
          Table_Temp.FieldByName('DESCONTO').AsFloat   := 0;
          Table_Temp.FieldByName('VALOR').AsFloat      := QRel.FieldByName('VR_RECEBIMENTO').AsFloat;
          Table_Temp.Post;

          Application.ProcessMessages;
          QRel.Next;
        end;
      End;
      
      QRel.Sql.Clear;
      QRel.Sql.Add('SELECT TRANSACOES.*, CLIENTES.NOME CLIENTE');
      QRel.Sql.Add('FROM TRANSACOES');
      QRel.Sql.Add('INNER JOIN CLIENTES ON TRANSACOES.CLIENTE_ID = CLIENTES.CLIENTE_ID');
      QRel.Sql.Add('WHERE ');
      QRel.Sql.Add('(CONDUTA = :CONDUTA) AND (DEPTO = :DEPTO)');
      QRel.Sql.Add('AND (COND_PAGTO = :COND_PAGTO)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (TRANSACOES.PARCELA_ID <> :PARCELA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL) ');
      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

      if venda_Finalizadora.Checked then
      Begin
      QRel.Sql.Add('AND (TRANSACOES.FINALIZADORA_ID > 0)');

      if not Qfinalizadora.IsEmpty then
      QRel.Sql.Add('AND (TRANSACOES.FINALIZADORA_ID = :FINALIZADORA_ID) ');
      End;

      if Caixa_banco.Value <> 0 then
      QRel.Sql.Add('AND (TRANSACOES.BANCO_ID = :BANCO_ID)');

      QRel.Sql.Add('ORDER BY DT_TRANS, CLIENTE, NUM_DOC');

      QRel.ParamByName('CONDUTA').AsString      := '01';
      QRel.ParamByName('DEPTO').AsString        := '07';

      if venda_Finalizadora.Checked then
      QRel.ParamByName('COND_PAGTO').AsString   := 'CARTAO'
      Else
      QRel.ParamByName('COND_PAGTO').AsString   := 'A PRAZO';

      QRel.ParamByName('PARCELA_ID').AsString   := 'F';
      QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
      QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
      QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
      QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;

      if Caixa_banco.Value <> 0 then
      QRel.ParamByName('BANCO_ID').AsInteger    := StrToInt(Caixa_banco.Text);

      if venda_Finalizadora.Checked then
      if not QFinalizadora.IsEmpty then
      QRel.ParamByName('FINALIZADORA_ID').AsInteger := QFinalizadora.FieldByName('FINALIZADORA_ID').AsInteger;


      QRel.Prepare;
      QRel.Open;
      QRel.First;

        while not QRel.Eof do
        Begin

          Sub_Tit := '*** Venda a Prazo ***';

          Table_Temp.Append;
          Table_Temp.FieldByName('CONDUTA').AsString     := Sub_Tit;
          Table_Temp.FieldByName('DT_TRANS').AsString    := QRel.FieldByName('DT_TRANS').AsString;
          Table_Temp.FieldByName('NUM_DOC').AsString     := QRel.FieldByName('NUM_DOC').AsString;

          if (venda_prazo.Checked)  THEN
          Table_Temp.FieldByName('HISTORICO').AsString   := ''
          Else
          Table_Temp.FieldByName('HISTORICO').AsString   := QRel.FieldByName('HISTORICO').AsString;

          Table_Temp.FieldByName('ACRESCIMO').AsFloat    := QRel.FieldByName('VR_ACRESCIMO').AsFloat;
          Table_Temp.FieldByName('VALOR').AsFloat        := QRel.FieldByName('VALOR').AsFloat;
          Table_Temp.FieldByName('VALOR_REC').AsFloat    := QRel.FieldByName('VALOR').AsFloat;
          Table_Temp.FieldByName('DESCONTO').AsFloat     := QRel.FieldByName('VR_DESCONTO').AsFloat;
          Table_Temp.FieldByName('BANCO_ID').AsInteger   := QRel.FieldByName('BANCO_ID').AsInteger;
          Table_Temp.FieldByName('CLIENTE_ID').AsInteger := QRel.FieldByName('CLIENTE_ID').AsInteger;
          Table_Temp.FieldByName('NOME').AsString        := QRel.FieldByName('CLIENTE').AsString;

          Table_Temp.Post;


          Application.ProcessMessages;
          QRel.Next;

        End;

      // venda a prazo muitiplos pagamentos!!

      QRel.Sql.Clear;
      QRel.Sql.Add('SELECT TRANSACOES.*, CLIENTES.NOME CLIENTE, TRANSPARCELAS.VALOR VALOR_REC, TRANSPARCELAS.BANCO_ID BANCO_ID_PAGTO');
      QRel.Sql.Add('FROM TRANSACOES');
      QRel.Sql.Add('LEFT JOIN CLIENTES ON TRANSACOES.CLIENTE_ID = CLIENTES.CLIENTE_ID');
      QRel.Sql.Add('INNER JOIN TRANSPARCELAS ON TRANSACOES.TRANSACAO_ID = TRANSPARCELAS.TRANSACAO_ID');
      QRel.Sql.Add('WHERE ');
      QRel.Sql.Add('(CONDUTA = :CONDUTA) AND (DEPTO = :DEPTO)');
      QRel.Sql.Add('AND (COND_PAGTO = :COND_PAGTO)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND ((TRANSACOES.PARCELA_ID = :PARCELA_ID) OR (TRANSACOES.PARCELA_ID = :PARCELA_ID1) )');
      QRel.Sql.Add('AND (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL) ');
      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

      if venda_Finalizadora.Checked then
      Begin
      QRel.Sql.Add('AND (TRANSPARCELAS.BANCO_ID > 0)');
      QRel.Sql.Add('AND (SUBSTRING(TRANSPARCELAS.PARCELA_ID FROM 4 FOR 2) >= :PARCELAS)');
      QRel.Sql.Add('AND (TRANSACOES.FINALIZADORA_ID > 0)');
        if not Qfinalizadora.IsEmpty then
        QRel.Sql.Add('AND (TRANSACOES.FINALIZADORA_ID = :FINALIZADORA_ID) ');
      End
      Else
      QRel.Sql.Add('AND (TRANSPARCELAS.BANCO_ID = 0)');

      if Caixa_banco.Value <> 0 then
      QRel.Sql.Add('AND (TRANSACOES.BANCO_ID = :BANCO_ID)');

      QRel.Sql.Add('ORDER BY DT_TRANS, CLIENTE, NUM_DOC');

      QRel.ParamByName('CONDUTA').AsString      := '01';
      QRel.ParamByName('DEPTO').AsString        := '07';
      QRel.ParamByName('COND_PAGTO').AsString   := 'A PRAZO';
      QRel.ParamByName('PARCELA_ID').AsString   := '0000F';
      QRel.ParamByName('PARCELA_ID1').AsString  := 'F';
      QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
      QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
      QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
      QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;

      if Caixa_banco.Value <> 0 then
      QRel.ParamByName('BANCO_ID').AsInteger    := StrToInt(Caixa_banco.Text);

      if venda_Finalizadora.Checked then
      Begin
      QRel.ParamByName('PARCELAS').AsString   := '03';

      if not QFinalizadora.IsEmpty then
      QRel.ParamByName('FINALIZADORA_ID').AsInteger := QFinalizadora.FieldByName('FINALIZADORA_ID').AsInteger;
      End;

      QRel.Prepare;
      QRel.Open;
      QRel.First;

        while not QRel.Eof do
        Begin

          if venda_Finalizadora.Checked then
          Sub_Tit := '*** Venda a Cartão ***'
          Else
          Sub_Tit := '*** Venda a Prazo ***';

          Table_Temp.Append;
          Table_Temp.FieldByName('CONDUTA').AsString     := Sub_Tit;
          Table_Temp.FieldByName('DT_TRANS').AsString    := QRel.FieldByName('DT_TRANS').AsString;
          Table_Temp.FieldByName('NUM_DOC').AsString     := QRel.FieldByName('NUM_DOC').AsString;

          if (venda_prazo.Checked)  THEN
          Table_Temp.FieldByName('HISTORICO').AsString   := ''
          Else
          Table_Temp.FieldByName('HISTORICO').AsString   := QRel.FieldByName('HISTORICO').AsString;

          Table_Temp.FieldByName('ACRESCIMO').AsFloat    := QRel.FieldByName('VR_ACRESCIMO').AsFloat;
          Table_Temp.FieldByName('VALOR').AsFloat        := QRel.FieldByName('VALOR_REC').AsFloat;
          Table_Temp.FieldByName('VALOR_REC').AsFloat    := QRel.FieldByName('VALOR_REC').AsFloat;
          Table_Temp.FieldByName('DESCONTO').AsFloat     := QRel.FieldByName('VR_DESCONTO').AsFloat;
          Table_Temp.FieldByName('BANCO_ID').AsInteger   := QRel.FieldByName('BANCO_ID').AsInteger;
          Table_Temp.FieldByName('CLIENTE_ID').AsInteger := QRel.FieldByName('CLIENTE_ID').AsInteger;
          Table_Temp.FieldByName('NOME').AsString        := QRel.FieldByName('CLIENTE').AsString;

          Table_Temp.Post;


          Application.ProcessMessages;
          QRel.Next;

        End;


      Table_Temp.IndexName := 'TEMP';

      if Table_Temp.IsEmpty then
        Application.MessageBox('Não há dados para os parâmetros informados', PChar(Msg_Title), mb_IconInformation)
      Else
      Begin
        If (venda_prazo.Checked)  then
        Begin
        QRLabel7.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;

        QRLabel1.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;
        End;

        If (Venda_Finalizadora.Checked) then
        Begin
        QRLabel37.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;

        QRLabel1.Caption  := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;
        End;

        if caixa_banco.Value <> 0 then
        Begin
           QRlabel18.Enabled := True;
           QRLabel18.Caption := 'Caixa/Banco : 00' + Caixa_banco.Text;
           QRlabel19.Enabled := True;
           QRLabel19.Caption := 'Caixa/Banco : 00' + Caixa_banco.Text;
        End
        ELSE
        Begin
          QRlabel18.Enabled := False;
           QRlabel19.Enabled := False;
        End;
        If (venda_prazo.Checked)  then
            Resumo1.PreviewModal
        Else
        If (Venda_finalizadora.Checked) Then
            Resumo2.PreviewModal
        Else
            Resumo.PreviewModal;
      End;
    finally
      Table_Temp.Close;
      btnExecuta.Enabled := True;
      btnRetorna.Enabled := True;
    end;
  end;

  if Tipo_Rel.Text = 'Sintético' then
  begin
    try
     IF VENDA_FINALIZADORA.Checked Then
     Begin

      QRel.Sql.Clear;
      QRel.Sql.Add('select SUM(VALOR) VALOR , NOME ,  SUM(TAXAS) TAXAS');
      QRel.Sql.Add('From(');
      QRel.Sql.Add(' SELECT (TRANSACOES.VALOR) VALOR, FINALIZADORAS.DESCRICAO NOME,  round((FINALIZADORAS.TX_ADM *TRANSACOES.VALOR)/100,2)  TAXAS ');
      QRel.Sql.Add(' FROM TRANSACOES');
      QRel.Sql.Add(' INNER JOIN FINALIZADORAS ON FINALIZADORAS.FINALIZADORA_ID = TRANSACOES.FINALIZADORA_ID');
      QRel.Sql.Add(' LEFT JOIN TRANSPARCELAS ON TRANSPARCELAS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID');
      QRel.Sql.Add(' LEFT JOIN TABELAS');
      QRel.Sql.Add(' ON ((TRANSACOES.CONTA_ID = TABELAS.TABELA_ID) AND (TABELAS.TIPO_TABELA = ''4''))');
      QRel.Sql.Add(' WHERE');
      QRel.Sql.Add(' (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add(' AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add(' AND (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('AND (TRANSACOES.COND_PAGTO ILIKE ''CART%'')');
      QRel.Sql.Add(' ) as TESTE');
      QRel.Sql.Add('group by NOME');

      QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
      QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
      QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
      QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
      QRel.Prepare;
      QRel.Open;

      QRLabel21.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;

      if QRel.IsEmpty then
        Application.MessageBox('Não há dados para os parâmetros informados.', PChar(Msg_Title), mb_IconInformation)
      else
        Resumo_Sintetico_cartao.PreviewModal;


     End
     Else
     Begin

      QRel.Sql.Clear;
      QRel.Sql.Add('SELECT DESCRICAO, SUM(COALESCE(CREDITO, 0)) CREDITO, SUM(COALESCE(DEBITO, 0)) DEBITO FROM');
      QRel.Sql.Add('(');

      QRel.Sql.Add('SELECT TABELAS.DESCRICAO, CASE');
      QRel.Sql.Add('WHEN ((TRANSACOES.CONDUTA = :COND_CRED) AND ((TRANSACOES.DEPTO = :DPT_CRED) OR (TRANSACOES.DEPTO = :DPT_EST))) THEN COALESCE(TRANSACOES.VALOR, 0) END CREDITO, CASE');
      QRel.Sql.Add('WHEN ((TRANSACOES.CONDUTA = :COND_DEB) AND ((TRANSACOES.DEPTO = :DPT_DEB) OR (TRANSACOES.DEPTO = :DPT_EST))) THEN COALESCE(TRANSACOES.VALOR, 0) END DEBITO');
      QRel.Sql.Add('FROM TRANSACOES');
      QRel.Sql.Add('INNER JOIN TABELAS');
      QRel.Sql.Add('ON ((TRANSACOES.CONTA_ID = TABELAS.TABELA_ID) AND (TABELAS.TIPO_TABELA = :TIPO_TABELA))');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

      If Not Chk_Todos.Checked Then
      QRel.Sql.Add('AND (TRANSACOES.COND_PAGTO = :VISTA)');

      if Caixa_banco.Value <> 0 then
      QRel.Sql.Add('AND (TRANSACOES.BANCO_ID = :BANCO_ID)');

      QRel.Sql.Add('AND (TRANSACOES.BALANCO <> :BALANCO)');

      QRel.Sql.Add('UNION ALL');

      If Not Chk_Todos.Checked Then
      Begin
      QRel.Sql.Add('SELECT TABELAS.DESCRICAO, COALESCE(TRANSACOES.VALOR, 0) CREDITO, 0 DEBITO');
      QRel.Sql.Add('FROM TRANSACOES');
      QRel.Sql.Add('INNER JOIN TRANSACOES ORIGEM');
      QRel.Sql.Add('ON (TRANSACOES.SAIDA_ID = ORIGEM.TRANSACAO_ID)');
      QRel.Sql.Add('INNER JOIN TABELAS');
      QRel.Sql.Add('ON ((ORIGEM.CONTA_ID = TABELAS.TABELA_ID) AND (TABELAS.TIPO_TABELA = :TIPO_TABELA))');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :COND_REC)');
      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

      if Caixa_banco.Value <> 0 then
      QRel.Sql.Add('AND (TRANSACOES.BANCO_ID = :BANCO_ID)');

      QRel.Sql.Add('AND (TRANSACOES.SERIE = :NORMAL)');

      QRel.Sql.Add('UNION ALL');
      End;

      QRel.Sql.Add('SELECT TABELAS.DESCRICAO, COALESCE(TRANSACOES.VALOR, 0) CREDITO, 0 DEBITO');
      QRel.Sql.Add('FROM TRANSACOES');
      QRel.Sql.Add('INNER JOIN TRANSACOES ORIGEM');
      QRel.Sql.Add('ON (TRANSACOES.SAIDA_ID = ORIGEM.TRANSACAO_ID)');
      QRel.Sql.Add('INNER JOIN TABELAS');
      QRel.Sql.Add('ON ((ORIGEM.CONTA_ID = TABELAS.TABELA_ID) AND (TABELAS.TIPO_TABELA = :TIPO_TABELA))');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :COND_REC)');
      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');


      if Caixa_banco.Value <> 0 then
      QRel.Sql.Add('AND (TRANSACOES.BANCO_ID = :BANCO_ID)');

      QRel.Sql.Add('AND (TRANSACOES.SERIE <> :NORMAL)');


      QRel.Sql.Add('UNION ALL');

      QRel.Sql.Add('SELECT TABELAS.DESCRICAO, 0 CREDITO, COALESCE(TRANSACOES.VALOR, 0) DEBITO');
      QRel.Sql.Add('FROM TRANSACOES');
      QRel.Sql.Add('INNER JOIN TRANSACOES ORIGEM');
      QRel.Sql.Add('ON (TRANSACOES.ENTRADA_ID = ORIGEM.TRANSACAO_ID)');
      QRel.Sql.Add('INNER JOIN TABELAS');
      QRel.Sql.Add('ON ((ORIGEM.CONTA_ID = TABELAS.TABELA_ID) AND (TABELAS.TIPO_TABELA = :TIPO_TABELA))');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :COND_PAGTO)');
      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

      if Caixa_banco.Value <> 0 then
      QRel.Sql.Add('AND (TRANSACOES.BANCO_ID = :BANCO_ID)');

      QRel.Sql.Add('AND (TRANSACOES.SERIE = :NORMAL)');

      QRel.Sql.Add('UNION ALL');

      QRel.Sql.Add('SELECT TABELAS.DESCRICAO, 0 CREDITO, COALESCE(TRANSACOES.VALOR, 0) DEBITO');
      QRel.Sql.Add('FROM TRANSACOES');
      QRel.Sql.Add('INNER JOIN TRANSACOES ORIGEM');
      QRel.Sql.Add('ON (TRANSACOES.ENTRADA_ID = ORIGEM.TRANSACAO_ID)');
      QRel.Sql.Add('INNER JOIN TABELAS');
      QRel.Sql.Add('ON ((ORIGEM.CONTA_ID = TABELAS.TABELA_ID) AND (TABELAS.TIPO_TABELA = :TIPO_TABELA))');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :COND_PAGTO)');
      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');


      if Caixa_banco.Value <> 0 then
      QRel.Sql.Add('AND (TRANSACOES.BANCO_ID = :BANCO_ID)');

      QRel.Sql.Add('AND (TRANSACOES.SERIE <> :NORMAL)');

      QRel.Sql.Add('UNION ALL');

      QRel.Sql.Add('SELECT TABELAS.DESCRICAO, CASE');
      QRel.Sql.Add('WHEN (TRANSACOES.SERIE = :DESCONTO) THEN COALESCE((TRANSACOES.VALOR_PARCELA - TRANSACOES.VALOR), 0) END CREDITO, CASE');
      QRel.Sql.Add('WHEN (TRANSACOES.SERIE = :JUROS) THEN COALESCE((TRANSACOES.VALOR - TRANSACOES.VALOR_PARCELA), 0) END DEBITO');
      QRel.Sql.Add('FROM TRANSACOES');
      QRel.Sql.Add('INNER JOIN TABELAS');
      QRel.Sql.Add('ON ((TRANSACOES.CONTA_ID = TABELAS.TABELA_ID) AND (TABELAS.TIPO_TABELA = :TIPO_TABELA))');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND ((TRANSACOES.CONDUTA = :COND_PAGTO) or (TRANSACOES.CONDUTA = :COND_REC))');
      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

      if Caixa_banco.Value <> 0 then
      QRel.Sql.Add('AND (TRANSACOES.BANCO_ID = :BANCO_ID)');

      QRel.Sql.Add('AND ((TRANSACOES.SERIE = :JUROS) OR (TRANSACOES.SERIE = :DESCONTO))');

      QRel.Sql.Add('UNION ALL');

      QRel.Sql.Add('SELECT TABELAS.DESCRICAO, CASE');
      QRel.Sql.Add('WHEN ((TRANSACOES.CONDUTA = :COND_CRED) AND ((TRANSACOES.DEPTO = :DPT_CRED) OR (TRANSACOES.DEPTO = :DPT_EST))) THEN COALESCE(TRANSPARCELAS.VALOR, 0) END CREDITO, CASE');
      QRel.Sql.Add('WHEN ((TRANSACOES.CONDUTA = :COND_DEB) AND ((TRANSACOES.DEPTO = :DPT_DEB) OR (TRANSACOES.DEPTO = :DPT_EST))) THEN COALESCE(TRANSPARCELAS.VALOR, 0) END DEBITO');
      QRel.Sql.Add('FROM TRANSPARCELAS');
      QRel.Sql.Add('INNER JOIN TRANSACOES');
      QRel.Sql.Add('ON (TRANSPARCELAS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
      QRel.Sql.Add('INNER JOIN TABELAS');
      QRel.Sql.Add('ON ((TRANSACOES.CONTA_ID = TABELAS.TABELA_ID) AND (TABELAS.TIPO_TABELA = :TIPO_TABELA))');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (TRANSACOES.COND_PAGTO = :PRAZO)');
      QRel.Sql.Add('AND (TRANSACOES.BALANCO <> :BALANCO)');
      QRel.Sql.Add('AND (TRANSPARCELAS.BANCO_ID > 0)');

      if Caixa_banco.Value <> 0 then
      QRel.Sql.Add('AND (TRANSACOES.BANCO_ID = :BANCO_ID)');

      QRel.Sql.Add('AND (TRANSPARCELAS.TIPO_TRANSACAO = :TIPO_TRANSACAO)');

      QRel.Sql.Add(') as teste');

      QRel.Sql.Add('GROUP BY DESCRICAO');

      QRel.Sql.Add('ORDER BY DESCRICAO');

      QRel.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
      QRel.ParamByName('TPCTB').AsString          := FrmData.QAcesso.FieldByName('TPCTB').AsString;
      QRel.ParamByName('DT_INICIAL').AsDateTime   := Dtmen.Date;
      QRel.ParamByName('DT_FINAL').AsDateTime     := Dtmai.Date;
      QRel.ParamByName('TIPO_TRANSACAO').AsString := 'T';
      QRel.ParamByName('BALANCO').AsString        := 'AGRUPADO';

      If not Chk_Todos.Checked Then
      QRel.ParamByName('VISTA').AsString          := 'A VISTA';

      QRel.ParamByName('PRAZO').AsString          := 'A PRAZO';
      QRel.ParamByName('COND_CRED').AsString      := '01';
      QRel.ParamByName('DPT_CRED').AsString       := '03';
      QRel.ParamByName('COND_DEB').AsString       := '02';
      QRel.ParamByName('DPT_DEB').AsString        := '02';
      QRel.ParamByName('DPT_EST').AsString        := '07';
      QRel.ParamByName('COND_REC').AsString       := '07';
      QRel.ParamByName('TIPO_TABELA').AsString    := '4';
      QRel.ParamByName('COND_PAGTO').AsString     := '08';
      QRel.ParamByName('DESCONTO').AsString       := 'D';
      QRel.ParamByName('JUROS').AsString          := 'J';
      QRel.ParamByName('NORMAL').AsString         := 'N';

      if Caixa_banco.Value <> 0 then
      QRel.ParamByName('BANCO_ID').AsInteger    := StrToInt(Caixa_banco.Text);

      QRel.Prepare;
      QRel.Open;

      QRLabel58.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;

      if QRel.IsEmpty then
        Application.MessageBox('Não há dados para os parâmetros informados', PChar(Msg_Title), mb_IconInformation)
      else
        Resumo_Sintetico.PreviewModal;
     End;
    except

    on e:Exception do
        begin
          Application.MessageBox(PChar('Erro:' + #13 +
            'Erro: ' + e.Message), 'Erro', MB_ICONSTOP + MB_TASKMODAL);
        end;

    end;
  end;

  if Tipo_Rel.Text = 'Sintético(Conta Especial)' then
  begin
    try
      QRel.Sql.Clear;
      QRel.Sql.Add('SELECT DESCRICAO, SUM(COALESCE(CREDITO, 0)) CREDITO, SUM(COALESCE(DEBITO, 0)) DEBITO FROM');
      QRel.Sql.Add('(');

      QRel.Sql.Add('SELECT TABELAS.DESCRICAO, CASE');
      QRel.Sql.Add('WHEN ((TRANSACOES.CONDUTA = :COND_CRED) AND ((TRANSACOES.DEPTO = :DPT_CRED) OR (TRANSACOES.DEPTO = :DPT_EST))) THEN COALESCE(TRANSACOES.VALOR, 0) END CREDITO, CASE');
      QRel.Sql.Add('WHEN ((TRANSACOES.CONDUTA = :COND_DEB) AND ((TRANSACOES.DEPTO = :DPT_DEB) OR (TRANSACOES.DEPTO = :DPT_EST))) THEN COALESCE(TRANSACOES.VALOR, 0) END DEBITO');
      QRel.Sql.Add('FROM TRANSACOES');
      QRel.Sql.Add('INNER JOIN TABELAS');
      QRel.Sql.Add('ON ((TRANSACOES.CONTA_ID = TABELAS.TABELA_ID) AND (TABELAS.TIPO_TABELA = :TIPO_TABELA))');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (TRANSACOES.COND_PAGTO = :VISTA)');
      QRel.Sql.Add('AND (TABELAS.ESPECIAL = :ESPECIAL)');
      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

      if Caixa_banco.Value <> 0 then
      QRel.Sql.Add('AND (TRANSACOES.BANCO_ID = :BANCO_ID)');

      QRel.Sql.Add('AND (TRANSACOES.BALANCO <> :BALANCO)');

      QRel.Sql.Add('UNION ALL');

      QRel.Sql.Add('SELECT TABELAS.DESCRICAO, COALESCE(TRANSACOES.VALOR, 0) CREDITO, 0 DEBITO');
      QRel.Sql.Add('FROM TRANSACOES');
      QRel.Sql.Add('INNER JOIN TRANSACOES ORIGEM');
      QRel.Sql.Add('ON (TRANSACOES.SAIDA_ID = ORIGEM.TRANSACAO_ID)');
      QRel.Sql.Add('INNER JOIN TABELAS');
      QRel.Sql.Add('ON ((ORIGEM.CONTA_ID = TABELAS.TABELA_ID) AND (TABELAS.TIPO_TABELA = :TIPO_TABELA))');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :COND_REC)');
      QRel.Sql.Add('AND (TABELAS.ESPECIAL = :ESPECIAL)');

      if Caixa_banco.Value <> 0 then
      QRel.Sql.Add('AND (TRANSACOES.BANCO_ID = :BANCO_ID)');

      QRel.Sql.Add('AND (TRANSACOES.SERIE = :NORMAL)');

      QRel.Sql.Add('UNION ALL');

      QRel.Sql.Add('SELECT TABELAS.DESCRICAO, COALESCE(TRANSACOES.VALOR, 0) CREDITO, 0 DEBITO');
      QRel.Sql.Add('FROM TRANSACOES');
      QRel.Sql.Add('INNER JOIN TRANSACOES ORIGEM');
      QRel.Sql.Add('ON (TRANSACOES.SAIDA_ID = ORIGEM.TRANSACAO_ID)');
      QRel.Sql.Add('INNER JOIN TABELAS');
      QRel.Sql.Add('ON ((ORIGEM.CONTA_ID = TABELAS.TABELA_ID) AND (TABELAS.TIPO_TABELA = :TIPO_TABELA))');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :COND_REC)');
      QRel.Sql.Add('AND (TABELAS.ESPECIAL = :ESPECIAL)');
      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

      if Caixa_banco.Value <> 0 then
      QRel.Sql.Add('AND (TRANSACOES.BANCO_ID = :BANCO_ID)');

      QRel.Sql.Add('AND (TRANSACOES.SERIE <> :NORMAL)');

      QRel.Sql.Add('UNION ALL');

      QRel.Sql.Add('SELECT TABELAS.DESCRICAO, 0 CREDITO, COALESCE(TRANSACOES.VALOR, 0) DEBITO');
      QRel.Sql.Add('FROM TRANSACOES');
      QRel.Sql.Add('INNER JOIN TRANSACOES ORIGEM');
      QRel.Sql.Add('ON (TRANSACOES.ENTRADA_ID = ORIGEM.TRANSACAO_ID)');
      QRel.Sql.Add('INNER JOIN TABELAS');
      QRel.Sql.Add('ON ((ORIGEM.CONTA_ID = TABELAS.TABELA_ID) AND (TABELAS.TIPO_TABELA = :TIPO_TABELA))');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :COND_PAGTO)');
      QRel.Sql.Add('AND (TABELAS.ESPECIAL = :ESPECIAL)');
      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

      if Caixa_banco.Value <> 0 then
      QRel.Sql.Add('AND (TRANSACOES.BANCO_ID = :BANCO_ID)');

      QRel.Sql.Add('AND (TRANSACOES.SERIE = :NORMAL)');

      QRel.Sql.Add('UNION ALL');

      QRel.Sql.Add('SELECT TABELAS.DESCRICAO, 0 CREDITO, COALESCE(TRANSACOES.VALOR, 0) DEBITO');
      QRel.Sql.Add('FROM TRANSACOES');
      QRel.Sql.Add('INNER JOIN TRANSACOES ORIGEM');
      QRel.Sql.Add('ON (TRANSACOES.ENTRADA_ID = ORIGEM.TRANSACAO_ID)');
      QRel.Sql.Add('INNER JOIN TABELAS');
      QRel.Sql.Add('ON ((ORIGEM.CONTA_ID = TABELAS.TABELA_ID) AND (TABELAS.TIPO_TABELA = :TIPO_TABELA))');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :COND_PAGTO)');
      QRel.Sql.Add('AND (TABELAS.ESPECIAL = :ESPECIAL)');
      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

      if Caixa_banco.Value <> 0 then
      QRel.Sql.Add('AND (TRANSACOES.BANCO_ID = :BANCO_ID)');

      QRel.Sql.Add('AND (TRANSACOES.SERIE <> :NORMAL)');

      QRel.Sql.Add('UNION ALL');

      QRel.Sql.Add('SELECT TABELAS.DESCRICAO, CASE');
      QRel.Sql.Add('WHEN (TRANSACOES.SERIE = :DESCONTO) THEN COALESCE((TRANSACOES.VALOR_PARCELA - TRANSACOES.VALOR), 0) END CREDITO, CASE');
      QRel.Sql.Add('WHEN (TRANSACOES.SERIE = :JUROS) THEN COALESCE((TRANSACOES.VALOR - TRANSACOES.VALOR_PARCELA), 0) END DEBITO');
      QRel.Sql.Add('FROM TRANSACOES');
      QRel.Sql.Add('INNER JOIN TABELAS');
      QRel.Sql.Add('ON ((TRANSACOES.CONTA_ID = TABELAS.TABELA_ID) AND (TABELAS.TIPO_TABELA = :TIPO_TABELA))');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND ((TRANSACOES.CONDUTA = :COND_PAGTO) or (TRANSACOES.CONDUTA = :COND_REC))');
      QRel.Sql.Add('AND (TABELAS.ESPECIAL = :ESPECIAL)');
      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

      if Caixa_banco.Value <> 0 then
      QRel.Sql.Add('AND (TRANSACOES.BANCO_ID = :BANCO_ID)');

      QRel.Sql.Add('AND ((TRANSACOES.SERIE = :JUROS) OR (TRANSACOES.SERIE = :DESCONTO))');

      QRel.Sql.Add('UNION ALL');

      QRel.Sql.Add('SELECT TABELAS.DESCRICAO, CASE');
      QRel.Sql.Add('WHEN ((TRANSACOES.CONDUTA = :COND_CRED) AND ((TRANSACOES.DEPTO = :DPT_CRED) OR (TRANSACOES.DEPTO = :DPT_EST))) THEN COALESCE(TRANSPARCELAS.VALOR, 0) END CREDITO, CASE');
      QRel.Sql.Add('WHEN ((TRANSACOES.CONDUTA = :COND_DEB) AND ((TRANSACOES.DEPTO = :DPT_DEB) OR (TRANSACOES.DEPTO = :DPT_EST))) THEN COALESCE(TRANSPARCELAS.VALOR, 0) END DEBITO');
      QRel.Sql.Add('FROM TRANSPARCELAS');
      QRel.Sql.Add('INNER JOIN TRANSACOES');
      QRel.Sql.Add('ON (TRANSPARCELAS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
      QRel.Sql.Add('INNER JOIN TABELAS');
      QRel.Sql.Add('ON ((TRANSACOES.CONTA_ID = TABELAS.TABELA_ID) AND (TABELAS.TIPO_TABELA = :TIPO_TABELA))');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (TRANSACOES.COND_PAGTO = :PRAZO)');
      QRel.Sql.Add('AND (TRANSACOES.BALANCO <> :BALANCO)');
      QRel.Sql.Add('AND (TRANSPARCELAS.BANCO_ID > 0)');
      QRel.Sql.Add('AND (TABELAS.ESPECIAL = :ESPECIAL)');

      if Caixa_banco.Value <> 0 then
      QRel.Sql.Add('AND (TRANSACOES.BANCO_ID = :BANCO_ID)');

      QRel.Sql.Add('AND (TRANSPARCELAS.TIPO_TRANSACAO = :TIPO_TRANSACAO)');

      QRel.Sql.Add(') as teste');

      QRel.Sql.Add('GROUP BY DESCRICAO');
      QRel.Sql.Add('ORDER BY DESCRICAO');

      QRel.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
      QRel.ParamByName('TPCTB').AsString          := FrmData.QAcesso.FieldByName('TPCTB').AsString;
      QRel.ParamByName('DT_INICIAL').AsDateTime   := Dtmen.Date;
      QRel.ParamByName('DT_FINAL').AsDateTime     := Dtmai.Date;
      QRel.ParamByName('TIPO_TRANSACAO').AsString := 'T';
      QRel.ParamByName('BALANCO').AsString        := 'AGRUPADO';
      QRel.ParamByName('VISTA').AsString          := 'A VISTA';
      QRel.ParamByName('PRAZO').AsString          := 'A PRAZO';
      QRel.ParamByName('COND_CRED').AsString      := '01';
      QRel.ParamByName('DPT_CRED').AsString       := '03';
      QRel.ParamByName('COND_DEB').AsString       := '02';
      QRel.ParamByName('DPT_DEB').AsString        := '02';
      QRel.ParamByName('DPT_EST').AsString        := '07';
      QRel.ParamByName('COND_REC').AsString       := '07';
      QRel.ParamByName('TIPO_TABELA').AsString    := '4';
      QRel.ParamByName('COND_PAGTO').AsString     := '08';
      QRel.ParamByName('DESCONTO').AsString       := 'D';
      QRel.ParamByName('JUROS').AsString          := 'J';
      QRel.ParamByName('NORMAL').AsString         := 'N';
      QRel.ParamByName('ESPECIAL').AsString       := 'SIM';

      if Caixa_banco.Value <> 0 then
      QRel.ParamByName('BANCO_ID').AsInteger    := StrToInt(Caixa_banco.Text);

      QRel.Prepare;
      QRel.Open;

      QRLabel21.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;

      if QRel.IsEmpty then
        Application.MessageBox('Não há dados para os parâmetros informados', PChar(Msg_Title), mb_IconInformation)
      else
        Resumo_Sintetico.PreviewModal;
    except

    end;
  end;

  if Tipo_Rel.Text = 'Detalhado por Conta' then
  Begin
   Try
     QRel.Sql.Clear;
     QRel.Sql.Add('SELECT DESCRICAO, DT_TRANS,  NUM_DOC, HISTORICO , CREDITO, DEBITO  FROM');
     QRel.Sql.Add('(');
     QRel.Sql.Add('SELECT TABELAS.DESCRICAO,TRANSACOES.DT_TRANS, TRANSACOES.NUM_DOC,TRANSACOES.HISTORICO,0 CREDITO,COALESCE(TRANSACOES.VALOR, 0) DEBITO');
     QRel.Sql.Add('FROM TRANSACOES');
     QRel.Sql.Add('INNER JOIN TRANSACOES ORIGEM ON (TRANSACOES.ENTRADA_ID = ORIGEM.TRANSACAO_ID)');
     QRel.Sql.Add('INNER JOIN TABELAS ON ((ORIGEM.CONTA_ID = TABELAS.TABELA_ID) AND (TABELAS.TIPO_TABELA = :TIPO_TABELA))');
     QRel.Sql.Add('WHERE (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
     QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID) AND (TRANSACOES.TPCTB <= :TPCTB) AND (TRANSACOES.CONDUTA = :COND_PAGTO)');
     QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
     QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

     if Caixa_banco.Value <> 0 then
     QRel.Sql.Add('AND (TRANSACOES.BANCO_ID = :BANCO_ID)');
     QRel.Sql.Add('AND (TRANSACOES.SERIE = :NORMAL)');

     QRel.Sql.Add('UNION ALL');

     QRel.Sql.Add('SELECT TABELAS.DESCRICAO,TRANSACOES.DT_TRANS , TRANSACOES.NUM_DOC, TRANSACOES.HISTORICO, CASE ');
     QRel.Sql.Add('WHEN (TRANSACOES.SERIE = :DESCONTO) THEN COALESCE((TRANSACOES.VALOR_PARCELA - TRANSACOES.VALOR), 0) END CREDITO, CASE');
     QRel.Sql.Add('WHEN (TRANSACOES.SERIE = :JUROS) THEN COALESCE((TRANSACOES.VALOR - TRANSACOES.VALOR_PARCELA), 0) END DEBITO');
     QRel.Sql.Add('FROM TRANSACOES');
     QRel.Sql.Add('INNER JOIN TABELAS ON ((TRANSACOES.CONTA_ID = TABELAS.TABELA_ID) AND (TABELAS.TIPO_TABELA = :TIPO_TABELA))');
     QRel.Sql.Add('WHERE (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
     QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID) AND (TRANSACOES.TPCTB <= :TPCTB)');
     QRel.Sql.Add('AND ((TRANSACOES.CONDUTA = :COND_PAGTO) or (TRANSACOES.CONDUTA = :COND_REC))');
     QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
     QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

     if Caixa_banco.Value <> 0 then
     QRel.Sql.Add('AND (TRANSACOES.BANCO_ID = :BANCO_ID)');
     QRel.Sql.Add('AND ((TRANSACOES.SERIE = :JUROS) OR (TRANSACOES.SERIE = :DESCONTO))');

     QRel.Sql.Add('UNION ALL');

      QRel.Sql.Add('SELECT TABELAS.DESCRICAO, TRANSACOES.DT_TRANS , TRANSACOES.NUM_DOC, TRANSACOES.HISTORICO, CASE');
      QRel.Sql.Add('WHEN ((TRANSACOES.CONDUTA = :COND_CRED) AND ((TRANSACOES.DEPTO = :DPT_CRED) OR (TRANSACOES.DEPTO = :DPT_EST))) THEN COALESCE(TRANSPARCELAS.VALOR, 0) END CREDITO, CASE');
      QRel.Sql.Add('WHEN ((TRANSACOES.CONDUTA = :COND_DEB) AND ((TRANSACOES.DEPTO = :DPT_DEB) OR (TRANSACOES.DEPTO = :DPT_EST))) THEN COALESCE(TRANSPARCELAS.VALOR, 0) END DEBITO');
      QRel.Sql.Add('FROM TRANSPARCELAS');
      QRel.Sql.Add('INNER JOIN TRANSACOES');
      QRel.Sql.Add('ON (TRANSPARCELAS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
      QRel.Sql.Add('INNER JOIN TABELAS');
      QRel.Sql.Add('ON ((TRANSACOES.CONTA_ID = TABELAS.TABELA_ID) AND (TABELAS.TIPO_TABELA = :TIPO_TABELA))');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (TRANSACOES.COND_PAGTO = :PRAZO)');
      QRel.Sql.Add('AND (TRANSACOES.BALANCO <> :BALANCO)');
      QRel.Sql.Add('AND (TRANSPARCELAS.BANCO_ID > 0)');
      if Caixa_banco.Value <> 0 then
      QRel.Sql.Add('AND (TRANSACOES.BANCO_ID = :BANCO_ID)');
      QRel.Sql.Add('AND (TRANSPARCELAS.TIPO_TRANSACAO = :TIPO_TRANSACAO)');

      QRel.Sql.Add('UNION ALL');

      QRel.Sql.Add('SELECT TABELAS.DESCRICAO, TRANSACOES.DT_TRANS , TRANSACOES.NUM_DOC, TRANSACOES.HISTORICO, 0 CREDITO, COALESCE(TRANSACOES.VALOR, 0) DEBITO');
      QRel.Sql.Add('FROM TRANSACOES');
      QRel.Sql.Add('INNER JOIN TRANSACOES ORIGEM');
      QRel.Sql.Add('ON (TRANSACOES.ENTRADA_ID = ORIGEM.TRANSACAO_ID)');
      QRel.Sql.Add('INNER JOIN TABELAS');
      QRel.Sql.Add('ON ((ORIGEM.CONTA_ID = TABELAS.TABELA_ID) AND (TABELAS.TIPO_TABELA = :TIPO_TABELA))');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :COND_PAGTO)');
      if Caixa_banco.Value <> 0 then
      QRel.Sql.Add('AND (TRANSACOES.BANCO_ID = :BANCO_ID)');
      QRel.Sql.Add('AND (TRANSACOES.SERIE <> :NORMAL)');
      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

      QRel.Sql.Add('UNION ALL');

      QRel.Sql.Add('SELECT TABELAS.DESCRICAO, TRANSACOES.DT_TRANS , TRANSACOES.NUM_DOC, TRANSACOES.HISTORICO, CASE');
      QRel.Sql.Add('WHEN ((TRANSACOES.CONDUTA = :COND_CRED) AND ((TRANSACOES.DEPTO = :DPT_CRED) OR (TRANSACOES.DEPTO = :DPT_EST))) THEN COALESCE(TRANSACOES.VALOR, 0) END CREDITO, CASE');
      QRel.Sql.Add('WHEN ((TRANSACOES.CONDUTA = :COND_DEB) AND ((TRANSACOES.DEPTO = :DPT_DEB) OR (TRANSACOES.DEPTO = :DPT_EST))) THEN COALESCE(TRANSACOES.VALOR, 0) END DEBITO');
      QRel.Sql.Add('FROM TRANSACOES');
      QRel.Sql.Add('INNER JOIN TABELAS');
      QRel.Sql.Add('ON ((TRANSACOES.CONTA_ID = TABELAS.TABELA_ID) AND (TABELAS.TIPO_TABELA = :TIPO_TABELA))');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (TRANSACOES.COND_PAGTO = :VISTA)');
      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

      if Caixa_banco.Value <> 0 then
      QRel.Sql.Add('AND (TRANSACOES.BANCO_ID = :BANCO_ID)');
      QRel.Sql.Add('AND (TRANSACOES.BALANCO <> :BALANCO)');

      QRel.Sql.Add('UNION ALL');

      QRel.Sql.Add('SELECT TABELAS.DESCRICAO, TRANSACOES.DT_TRANS , TRANSACOES.NUM_DOC, TRANSACOES.HISTORICO, COALESCE(TRANSACOES.VALOR, 0) CREDITO, 0 DEBITO');
      QRel.Sql.Add('FROM TRANSACOES');
      QRel.Sql.Add('INNER JOIN TRANSACOES ORIGEM');
      QRel.Sql.Add('ON (TRANSACOES.SAIDA_ID = ORIGEM.TRANSACAO_ID)');
      QRel.Sql.Add('INNER JOIN TABELAS');
      QRel.Sql.Add('ON ((ORIGEM.CONTA_ID = TABELAS.TABELA_ID) AND (TABELAS.TIPO_TABELA = :TIPO_TABELA))');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :COND_REC)');
      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

      if Caixa_banco.Value <> 0 then
      QRel.Sql.Add('AND (TRANSACOES.BANCO_ID = :BANCO_ID)');

      QRel.Sql.Add('AND (TRANSACOES.SERIE = :NORMAL)');


     QRel.Sql.Add(') AS TESTE');

     if Conta_id.Value > 0  then
     QRel.Sql.Add('WHERE DESCRICAO = :DESCRICAO_CONTA');

     QRel.Sql.Add('ORDER BY DESCRICAO,DT_TRANS,HISTORICO');

     QRel.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
     QRel.ParamByName('TPCTB').AsString          := FrmData.QAcesso.FieldByName('TPCTB').AsString;
     QRel.ParamByName('DT_INICIAL').AsDateTime   := Dtmen.Date;
     QRel.ParamByName('DT_FINAL').AsDateTime     := Dtmai.Date;
     QRel.ParamByName('TIPO_TRANSACAO').AsString := 'T';
     QRel.ParamByName('BALANCO').AsString        := 'AGRUPADO';
     QRel.ParamByName('VISTA').AsString          := 'A VISTA';
     QRel.ParamByName('PRAZO').AsString          := 'A PRAZO';
     QRel.ParamByName('COND_CRED').AsString      := '01';
     QRel.ParamByName('DPT_CRED').AsString       := '03';
     QRel.ParamByName('COND_DEB').AsString       := '02';
     QRel.ParamByName('DPT_DEB').AsString        := '02';
     QRel.ParamByName('DPT_EST').AsString        := '07';
     QRel.ParamByName('COND_REC').AsString       := '07';
     QRel.ParamByName('TIPO_TABELA').AsString    := '4';
     QRel.ParamByName('COND_PAGTO').AsString     := '08';
     QRel.ParamByName('DESCONTO').AsString       := 'D';
     QRel.ParamByName('JUROS').AsString          := 'J';
     QRel.ParamByName('NORMAL').AsString         := 'N';

    if Caixa_banco.Value <> 0 then
      QRel.ParamByName('BANCO_ID').AsInteger        := StrToInt(Caixa_banco.Text);

    if Conta_id.Value > 0  then
      QRel.ParamByName('DESCRICAO_CONTA').AsString  := QConta.FieldByname('DESCRICAO').AsString ;

      QRel.Prepare;
      QRel.Open;

      QRLabel28.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;

      if QRel.IsEmpty then
        Application.MessageBox('Não há dados para os parâmetros informados', PChar(Msg_Title), mb_IconInformation)
      else
        Detalhe_Conta.PreviewModal;

   except
   {on e:Exception do
        begin
          Application.MessageBox(PChar('Erro ao importar produtos!' + #13 +
            'Erro: ' + e.Message), 'Erro', MB_ICONSTOP + MB_TASKMODAL);
        end; }

   End;
  End;
  if Tipo_Rel.Text = 'Detalhado por Conta(Funcionário)' then
  Begin
   Try
     QRel.Sql.Clear;
     QRel.Sql.Add('SELECT DESCRICAO, DT_TRANS,  NUM_DOC, FUNCIONARIO , CREDITO, DEBITO  FROM');
     QRel.Sql.Add('(');

      QRel.Sql.Add('SELECT TABELAS.DESCRICAO, TRANSACOES.DT_TRANS , TRANSACOES.NUM_DOC, FUNCIONARIOS.NOME FUNCIONARIO, CASE');
      QRel.Sql.Add('WHEN ((TRANSACOES.CONDUTA = :COND_CRED) AND ((TRANSACOES.DEPTO = :DPT_CRED) OR (TRANSACOES.DEPTO = :DPT_EST))) THEN COALESCE(TRANSPARCELAS.VALOR, 0) END CREDITO, CASE');
      QRel.Sql.Add('WHEN ((TRANSACOES.CONDUTA = :COND_DEB) AND ((TRANSACOES.DEPTO = :DPT_DEB) OR (TRANSACOES.DEPTO = :DPT_EST))) THEN COALESCE(TRANSPARCELAS.VALOR, 0) END DEBITO');
      QRel.Sql.Add('FROM TRANSPARCELAS');
      QRel.Sql.Add('INNER JOIN TRANSACOES');
      QRel.Sql.Add('ON (TRANSPARCELAS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
      QRel.Sql.Add('INNER JOIN TABELAS');
      QRel.Sql.Add('ON ((TRANSACOES.CONTA_ID = TABELAS.TABELA_ID) AND (TABELAS.TIPO_TABELA = :TIPO_TABELA))');
      QRel.Sql.Add('LEFT JOIN FUNCIONARIOS');
      QRel.Sql.Add('ON (TRANSACOES.VENDEDOR_ID = FUNCIONARIOS.FUNCIONARIO_ID)');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (TRANSACOES.COND_PAGTO = :PRAZO)');
      QRel.Sql.Add('AND (TRANSACOES.BALANCO <> :BALANCO)');
      QRel.Sql.Add('AND (TRANSPARCELAS.BANCO_ID > 0)');
      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

      if Caixa_banco.Value <> 0 then
      QRel.Sql.Add('AND (TRANSACOES.BANCO_ID = :BANCO_ID)');

      QRel.Sql.Add('AND (TRANSPARCELAS.TIPO_TRANSACAO = :TIPO_TRANSACAO)');

      QRel.Sql.Add('UNION ALL');

      QRel.Sql.Add('SELECT TABELAS.DESCRICAO, TRANSACOES.DT_TRANS , TRANSACOES.NUM_DOC, FUNCIONARIOS.NOME FUNCIONARIO, CASE');
      QRel.Sql.Add('WHEN ((TRANSACOES.CONDUTA = :COND_CRED) AND ((TRANSACOES.DEPTO = :DPT_CRED) OR (TRANSACOES.DEPTO = :DPT_EST))) THEN COALESCE(TRANSACOES.VALOR, 0) END CREDITO, CASE');
      QRel.Sql.Add('WHEN ((TRANSACOES.CONDUTA = :COND_DEB) AND ((TRANSACOES.DEPTO = :DPT_DEB) OR (TRANSACOES.DEPTO = :DPT_EST))) THEN COALESCE(TRANSACOES.VALOR, 0) END DEBITO');
      QRel.Sql.Add('FROM TRANSACOES');
      QRel.Sql.Add('INNER JOIN TABELAS');
      QRel.Sql.Add('ON ((TRANSACOES.CONTA_ID = TABELAS.TABELA_ID) AND (TABELAS.TIPO_TABELA = :TIPO_TABELA))');
      QRel.Sql.Add('LEFT JOIN FUNCIONARIOS');
      QRel.Sql.Add('ON (TRANSACOES.VENDEDOR_ID = FUNCIONARIOS.FUNCIONARIO_ID)');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (TRANSACOES.COND_PAGTO = :VISTA)');
      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

      if Caixa_banco.Value <> 0 then
      QRel.Sql.Add('AND (TRANSACOES.BANCO_ID = :BANCO_ID)');

      QRel.Sql.Add('AND (TRANSACOES.BALANCO <> :BALANCO)');

      QRel.Sql.Add('UNION ALL');

      QRel.Sql.Add('SELECT TABELAS.DESCRICAO, TRANSACOES.DT_TRANS , TRANSACOES.NUM_DOC, FUNCIONARIOS.NOME FUNCIONARIO, 0 CREDITO, COALESCE(TRANSACOES.VALOR, 0) DEBITO');
      QRel.Sql.Add('FROM TRANSACOES');
      QRel.Sql.Add('INNER JOIN TRANSACOES ORIGEM');
      QRel.Sql.Add('ON (TRANSACOES.ENTRADA_ID = ORIGEM.TRANSACAO_ID)');
      QRel.Sql.Add('INNER JOIN TABELAS');
      QRel.Sql.Add('ON ((ORIGEM.CONTA_ID = TABELAS.TABELA_ID) AND (TABELAS.TIPO_TABELA = :TIPO_TABELA))');
      QRel.Sql.Add('LEFT JOIN FUNCIONARIOS');
      QRel.Sql.Add('ON (ORIGEM.VENDEDOR_ID = FUNCIONARIOS.FUNCIONARIO_ID)');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :COND_PAGTO)');
      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

      if Caixa_banco.Value <> 0 then
      QRel.Sql.Add('AND (TRANSACOES.BANCO_ID = :BANCO_ID)');

     QRel.Sql.Add(') AS TESTE');

      if Conta_id.Value > 0  then
     QRel.Sql.Add('WHERE DESCRICAO = :DESCRICAO_CONTA');


     QRel.Sql.Add('ORDER BY DESCRICAO,DT_TRANS,FUNCIONARIO');

     QRel.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
     QRel.ParamByName('TPCTB').AsString          := FrmData.QAcesso.FieldByName('TPCTB').AsString;
     QRel.ParamByName('DT_INICIAL').AsDateTime   := Dtmen.Date;
     QRel.ParamByName('DT_FINAL').AsDateTime     := Dtmai.Date;
     QRel.ParamByName('TIPO_TRANSACAO').AsString := 'T';
     QRel.ParamByName('BALANCO').AsString        := 'AGRUPADO';
     QRel.ParamByName('VISTA').AsString          := 'A VISTA';
     QRel.ParamByName('PRAZO').AsString          := 'A PRAZO';
     QRel.ParamByName('COND_CRED').AsString      := '01';
     QRel.ParamByName('DPT_CRED').AsString       := '03';
     QRel.ParamByName('COND_DEB').AsString       := '02';
     QRel.ParamByName('DPT_DEB').AsString        := '02';
     QRel.ParamByName('DPT_EST').AsString        := '07';
     QRel.ParamByName('TIPO_TABELA').AsString    := '4';
     QRel.ParamByName('COND_PAGTO').AsString     := '08';

     if Caixa_banco.Value <> 0 then
     QRel.ParamByName('BANCO_ID').AsInteger        := StrToInt(Caixa_banco.Text);

     if Conta_id.Value > 0  then
     QRel.ParamByName('DESCRICAO_CONTA').AsString  := QConta.FieldByname('DESCRICAO').AsString ;


     QRel.Prepare;
     QRel.Open;

      QRLabel49.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;

      if QRel.IsEmpty then
        Application.MessageBox('Não há dados para os parâmetros informados', PChar(Msg_Title), mb_IconInformation)
      else
        Detalhe_Conta_Funcionario.PreviewModal;


   Finally

   End;
  End;
  if Tipo_Rel.Text = 'Detalhado por Conta Especial' then
  Begin
   Try
     QRel.Sql.Clear;
     QRel.Sql.Add('SELECT DESCRICAO, DT_TRANS,  NUM_DOC, HISTORICO , CREDITO, DEBITO  FROM');
     QRel.Sql.Add('(');
     QRel.Sql.Add('SELECT TABELAS.DESCRICAO,TRANSACOES.DT_TRANS, TRANSACOES.NUM_DOC,TRANSACOES.HISTORICO,0 CREDITO,COALESCE(TRANSACOES.VALOR, 0) DEBITO');
     QRel.Sql.Add('FROM TRANSACOES');
     QRel.Sql.Add('INNER JOIN TRANSACOES ORIGEM ON (TRANSACOES.ENTRADA_ID = ORIGEM.TRANSACAO_ID)');
     QRel.Sql.Add('INNER JOIN TABELAS ON ((ORIGEM.CONTA_ID = TABELAS.TABELA_ID) AND (TABELAS.TIPO_TABELA = :TIPO_TABELA))');
     QRel.Sql.Add('WHERE (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
     QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID) AND (TRANSACOES.TPCTB <= :TPCTB) AND (TRANSACOES.CONDUTA = :COND_PAGTO)');
     QRel.Sql.Add('AND TABELAS.ESPECIAL = :ESPECIAL');
     QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
     QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

     if Caixa_banco.Value <> 0 then
     QRel.Sql.Add('AND (TRANSACOES.BANCO_ID = :BANCO_ID)');

     QRel.Sql.Add('AND (TRANSACOES.SERIE = :NORMAL)');

     QRel.Sql.Add('UNION ALL');

     QRel.Sql.Add('SELECT TABELAS.DESCRICAO,TRANSACOES.DT_TRANS , TRANSACOES.NUM_DOC, TRANSACOES.HISTORICO, CASE ');
     QRel.Sql.Add('WHEN (TRANSACOES.SERIE = :DESCONTO) THEN COALESCE((TRANSACOES.VALOR_PARCELA - TRANSACOES.VALOR), 0) END CREDITO, CASE');
     QRel.Sql.Add('WHEN (TRANSACOES.SERIE = :JUROS) THEN COALESCE((TRANSACOES.VALOR - TRANSACOES.VALOR_PARCELA), 0) END DEBITO');
     QRel.Sql.Add('FROM TRANSACOES');
     QRel.Sql.Add('INNER JOIN TABELAS ON ((TRANSACOES.CONTA_ID = TABELAS.TABELA_ID) AND (TABELAS.TIPO_TABELA = :TIPO_TABELA))');
     QRel.Sql.Add('WHERE (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
     QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID) AND (TRANSACOES.TPCTB <= :TPCTB)');
     QRel.Sql.Add('AND ((TRANSACOES.CONDUTA = :COND_PAGTO) or (TRANSACOES.CONDUTA = :COND_REC))');
     QRel.Sql.Add('AND TABELAS.ESPECIAL = :ESPECIAL');
     QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
     QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

     if Caixa_banco.Value <> 0 then
     QRel.Sql.Add('AND (TRANSACOES.BANCO_ID = :BANCO_ID)');

     QRel.Sql.Add('AND ((TRANSACOES.SERIE = :JUROS) OR (TRANSACOES.SERIE = :DESCONTO))');

     QRel.Sql.Add('UNION ALL');

      QRel.Sql.Add('SELECT TABELAS.DESCRICAO, TRANSACOES.DT_TRANS , TRANSACOES.NUM_DOC, TRANSACOES.HISTORICO, CASE');
      QRel.Sql.Add('WHEN ((TRANSACOES.CONDUTA = :COND_CRED) AND ((TRANSACOES.DEPTO = :DPT_CRED) OR (TRANSACOES.DEPTO = :DPT_EST))) THEN COALESCE(TRANSPARCELAS.VALOR, 0) END CREDITO, CASE');
      QRel.Sql.Add('WHEN ((TRANSACOES.CONDUTA = :COND_DEB) AND ((TRANSACOES.DEPTO = :DPT_DEB) OR (TRANSACOES.DEPTO = :DPT_EST))) THEN COALESCE(TRANSPARCELAS.VALOR, 0) END DEBITO');
      QRel.Sql.Add('FROM TRANSPARCELAS');
      QRel.Sql.Add('INNER JOIN TRANSACOES');
      QRel.Sql.Add('ON (TRANSPARCELAS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
      QRel.Sql.Add('INNER JOIN TABELAS');
      QRel.Sql.Add('ON ((TRANSACOES.CONTA_ID = TABELAS.TABELA_ID) AND (TABELAS.TIPO_TABELA = :TIPO_TABELA))');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (TRANSACOES.COND_PAGTO = :PRAZO)');
      QRel.Sql.Add('AND (TRANSACOES.BALANCO <> :BALANCO)');
      QRel.Sql.Add('AND (TRANSPARCELAS.BANCO_ID > 0)');
      QRel.Sql.Add('AND TABELAS.ESPECIAL = :ESPECIAL');
      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

      if Caixa_banco.Value <> 0 then
      QRel.Sql.Add('AND (TRANSACOES.BANCO_ID = :BANCO_ID)');

      QRel.Sql.Add('AND (TRANSPARCELAS.TIPO_TRANSACAO = :TIPO_TRANSACAO)');

      QRel.Sql.Add('UNION ALL');

      QRel.Sql.Add('SELECT TABELAS.DESCRICAO, TRANSACOES.DT_TRANS , TRANSACOES.NUM_DOC, TRANSACOES.HISTORICO, 0 CREDITO, COALESCE(TRANSACOES.VALOR, 0) DEBITO');
      QRel.Sql.Add('FROM TRANSACOES');
      QRel.Sql.Add('INNER JOIN TRANSACOES ORIGEM');
      QRel.Sql.Add('ON (TRANSACOES.ENTRADA_ID = ORIGEM.TRANSACAO_ID)');
      QRel.Sql.Add('INNER JOIN TABELAS');
      QRel.Sql.Add('ON ((ORIGEM.CONTA_ID = TABELAS.TABELA_ID) AND (TABELAS.TIPO_TABELA = :TIPO_TABELA))');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :COND_PAGTO)');
      QRel.Sql.Add('AND TABELAS.ESPECIAL = :ESPECIAL');
      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

      if Caixa_banco.Value <> 0 then
      QRel.Sql.Add('AND (TRANSACOES.BANCO_ID = :BANCO_ID)');

      QRel.Sql.Add('AND (TRANSACOES.SERIE <> :NORMAL)');

      QRel.Sql.Add('UNION ALL');

      QRel.Sql.Add('SELECT TABELAS.DESCRICAO, TRANSACOES.DT_TRANS , TRANSACOES.NUM_DOC, TRANSACOES.HISTORICO, CASE');
      QRel.Sql.Add('WHEN ((TRANSACOES.CONDUTA = :COND_CRED) AND ((TRANSACOES.DEPTO = :DPT_CRED) OR (TRANSACOES.DEPTO = :DPT_EST))) THEN COALESCE(TRANSACOES.VALOR, 0) END CREDITO, CASE');
      QRel.Sql.Add('WHEN ((TRANSACOES.CONDUTA = :COND_DEB) AND ((TRANSACOES.DEPTO = :DPT_DEB) OR (TRANSACOES.DEPTO = :DPT_EST))) THEN COALESCE(TRANSACOES.VALOR, 0) END DEBITO');
      QRel.Sql.Add('FROM TRANSACOES');
      QRel.Sql.Add('INNER JOIN TABELAS');
      QRel.Sql.Add('ON ((TRANSACOES.CONTA_ID = TABELAS.TABELA_ID) AND (TABELAS.TIPO_TABELA = :TIPO_TABELA))');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (TRANSACOES.COND_PAGTO = :VISTA)');
      QRel.Sql.Add('AND TABELAS.ESPECIAL = :ESPECIAL');
      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

      if Caixa_banco.Value <> 0 then
      QRel.Sql.Add('AND (TRANSACOES.BANCO_ID = :BANCO_ID)');

      QRel.Sql.Add('AND (TRANSACOES.BALANCO <> :BALANCO)');

      QRel.Sql.Add('UNION ALL');

      QRel.Sql.Add('SELECT TABELAS.DESCRICAO, TRANSACOES.DT_TRANS , TRANSACOES.NUM_DOC, TRANSACOES.HISTORICO, COALESCE(TRANSACOES.VALOR, 0) CREDITO, 0 DEBITO');
      QRel.Sql.Add('FROM TRANSACOES');
      QRel.Sql.Add('INNER JOIN TRANSACOES ORIGEM');
      QRel.Sql.Add('ON (TRANSACOES.SAIDA_ID = ORIGEM.TRANSACAO_ID)');
      QRel.Sql.Add('INNER JOIN TABELAS');
      QRel.Sql.Add('ON ((ORIGEM.CONTA_ID = TABELAS.TABELA_ID) AND (TABELAS.TIPO_TABELA = :TIPO_TABELA))');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :COND_REC)');
      QRel.Sql.Add('AND TABELAS.ESPECIAL = :ESPECIAL');
      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

      if Caixa_banco.Value <> 0 then
      QRel.Sql.Add('AND (TRANSACOES.BANCO_ID = :BANCO_ID)');
      QRel.Sql.Add('AND (TRANSACOES.SERIE = :NORMAL)');


     QRel.Sql.Add(')as teste');
     if Conta_id.Value > 0  then
     QRel.Sql.Add('WHERE DESCRICAO = :DESCRICAO_CONTA');

     QRel.Sql.Add('ORDER BY DESCRICAO,DT_TRANS,HISTORICO');

     QRel.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
     QRel.ParamByName('TPCTB').AsString          := FrmData.QAcesso.FieldByName('TPCTB').AsString;
     QRel.ParamByName('DT_INICIAL').AsDateTime   := Dtmen.Date;
     QRel.ParamByName('DT_FINAL').AsDateTime     := Dtmai.Date;
     QRel.ParamByName('TIPO_TRANSACAO').AsString := 'T';
     QRel.ParamByName('BALANCO').AsString        := 'AGRUPADO';
     QRel.ParamByName('VISTA').AsString          := 'A VISTA';
     QRel.ParamByName('PRAZO').AsString          := 'A PRAZO';
     QRel.ParamByName('COND_CRED').AsString      := '01';
     QRel.ParamByName('DPT_CRED').AsString       := '03';
     QRel.ParamByName('COND_DEB').AsString       := '02';
     QRel.ParamByName('DPT_DEB').AsString        := '02';
     QRel.ParamByName('DPT_EST').AsString        := '07';
     QRel.ParamByName('COND_REC').AsString       := '07';
     QRel.ParamByName('TIPO_TABELA').AsString    := '4';
     QRel.ParamByName('COND_PAGTO').AsString     := '08';
     QRel.ParamByName('DESCONTO').AsString       := 'D';
     QRel.ParamByName('JUROS').AsString          := 'J';
     QRel.ParamByName('NORMAL').AsString         := 'N';
     QRel.ParamByName('ESPECIAL').AsString       := 'SIM';

    if Caixa_banco.Value <> 0 then
      QRel.ParamByName('BANCO_ID').AsInteger        := StrToInt(Caixa_banco.Text);

    if Conta_id.Value > 0  then
      QRel.ParamByName('DESCRICAO_CONTA').AsString  := QConta.FieldByname('DESCRICAO').AsString ;

      QRel.Prepare;
      QRel.Open;

      QRLabel28.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;

      if QRel.IsEmpty then
        Application.MessageBox('Não há dados para os parâmetros informados', PChar(Msg_Title), mb_IconInformation)
      else
        Detalhe_Conta.PreviewModal;

   except
   {on e:Exception do
        begin
          Application.MessageBox(PChar('Erro ao importar produtos!' + #13 +
            'Erro: ' + e.Message), 'Erro', MB_ICONSTOP + MB_TASKMODAL);
        end;}

   End;
  End;

end;

procedure TFrmResumo_Diario.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmResumo_Diario.Caixa_BancoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmResumo_Diario.Sel_CartaoClick(Sender: TObject);
begin
if Sel_Cartao.Checked then
   Begin
   QFinalizadora.Open;
   FinalizadoraBox.Visible    := True;
   End
   Else
   Begin
   QFinalizadora.Close;
   FinalizadoraBox.Visible    := False;
   End;

end;

procedure TFrmResumo_Diario.ColumnHeaderBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
if caixa_banco.Value <> 0 then
Begin
  QRlabel19.Enabled := True;
  QRLabel19.Caption := 'Caixa/Banco : ' + Caixa_banco.Text;
End;

end;

procedure TFrmResumo_Diario.CONTA_IDExit(Sender: TObject);
begin
DeTailSearch('Conta');
end;

procedure TFrmResumo_Diario.CONTA_IDKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = CONTA_ID) then
    btnContaClick(Self);

end;

procedure TFrmResumo_Diario.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmResumo_Diario.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    //Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmResumo_Diario.FinalizadoraBoxClick(Sender: TObject);
begin
try
    QFinalizadora.Open;
  except
    Application.MessageBox('Erro ao conectar com o Banco de Dados', PChar(Msg_Title), mb_IconStop);
    Application.Terminate;
  end;

end;

procedure TFrmResumo_Diario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmResumo_Diario.FormCreate(Sender: TObject);
begin
  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);

end;

procedure TFrmResumo_Diario.QRBand2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
if caixa_banco.Value <> 0 then
Begin
  QRlabel18.Enabled := True;
  QRLabel18.Caption := 'Caixa/Banco : ' + Caixa_banco.Text;
End;
end;

procedure TFrmResumo_Diario.QRBand5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
 QRLabel47.Caption := '';

 QSearch.Sql.Clear;
 QSearch.Sql.Text := 'SELECT DESCRICAO FROM TABELAS WHERE TIPO_TABELA = :TIPO_TABELA AND TABELA_ID = :TABELA_ID';
 QSearch.ParamByName('TIPO_TABELA').AsString := '2';
 QSearch.ParamByName('TABELA_ID').AsInteger  := StrToInt(C_CUSTO_ID.Text);
 QSearch.Prepare;
 QSearch.open;

 QRLabel47.Caption := QSearch.FieldByName('DESCRICAO').AsString;


end;

procedure TFrmResumo_Diario.Tipo_RelChange(Sender: TObject);
begin

if (Tipo_Rel.Text = 'Detalhado por Conta') OR (Tipo_Rel.Text = 'Detalhado por Conta(Funcionário)') then
Begin
  Label4.Visible      := True;
  Conta_Id.Visible    := True;
  BtnConta.Visible    := True;
  DBText3.Visible     := True;
  Venda_Prazo.Visible := False;
  Venda_Finalizadora.Visible := False;
  Finalizadorabox.Visible :=False
  End;

  if Tipo_Rel.Text = 'Analítico' then
  Begin
  Label4.Visible             := False;
  Conta_Id.Visible           := False;
  BtnConta.Visible           := False;
  DBtext3.Visible            := False;
  Venda_Prazo.Visible        := True;
  Venda_Finalizadora.Visible := True;


  End;

  if Tipo_Rel.Text = 'Sintético' then
  Begin
  Label4.Visible             := False;
  Conta_Id.Visible           := False;
  BtnConta.Visible           := False;
  DBtext3.Visible            := False;
  Venda_Prazo.Visible        := False;
  //Venda_Finalizadora.Visible := False;
  Finalizadorabox.Visible    := False;
  End;



  end;
procedure TFrmResumo_Diario.VENDA_FINALIZADORAClick(Sender: TObject);
begin
   if Venda_Finalizadora.Checked then

   Venda_prazo.Enabled    := False
   Else
   Venda_prazo.Enabled    := True;
   
end;

procedure TFrmResumo_Diario.Venda_prazoClick(Sender: TObject);
begin
if Venda_Prazo.Checked then
   Venda_Finalizadora.Enabled := False
   Else
   Venda_Finalizadora.Enabled := True;
end;

end.
