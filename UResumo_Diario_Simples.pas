unit UResumo_Diario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, rxCurrEdit, rxToolEdit, DBTables, DB,
  IBCustomDataSet, IBQuery, QRCtrls, QuickRpt, Buttons, DBCtrls;

type
  TFrmResumo_Diario = class(TForm)
    Label1: TLabel;
    Bevel1: TBevel;
    Dtmen: TDateEdit;
    Dtmai: TDateEdit;
    QRel: TIBQuery;
    Table_Temp: TTable;
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
    QConta: TIBQuery;
    DataConta: TDataSource;
    VENDA_FINALIZADORA: TCheckBox;
    QFinalizadora: TIBQuery;
    DataFinalizadora: TDataSource;
    FinalizadoraBox: TDBLookupComboBox;
    Resumo_Sintetico: TQuickRep;
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
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRBand6: TQRBand;
    QRDBText17: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRExpr7: TQRExpr;
    SummaryBand1: TQRBand;
    QRShape13: TQRShape;
    QRExpr8: TQRExpr;
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
    procedure FormShow(Sender: TObject);
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
          DatabaseName := ExtractFilePath(ParamStr(0));
          Temp_Name    := Copy(TimeToStr(time), 1, 2) + Copy(TimeToStr(time), 4, 2) + Copy(TimeToStr(time), 7, 2);
          TableName    := Temp_Name;

          with FieldDefs do
          begin
            Clear;
            Add('ID', ftAutoInc, 0, False);
            Add('CONDUTA', ftString, 40, False);
            Add('DT_TRANS', ftDate, 0, False);
            Add('NUM_DOC', ftString, 7, False);
            Add('HISTORICO', ftString, 40, False);
            Add('ACRESCIMO', ftFloat, 0, False);
            Add('DESCONTO', ftFloat, 0, False);
            Add('VALOR', ftFloat, 0, False);
            Add('BANCO_ID',ftInteger,0,False);
            Add('CLIENTE_ID',ftInteger,0,False);
            Add('NOME',ftString,40,False);
            Add('VALOR_REC',ftFloat,0,False);
          end;

          with IndexDefs do
          begin
            Clear;
            Add('', 'ID', [ixPrimary, ixUnique]);
            Add('TEMP', 'CONDUTA', [ixCaseInsensitive, ixDescending]);
          end;

          CreateTable;
          Open;
        end;
      except
       Application.MessageBox('Ocorreu um erro ao criar um arquivo temporário', PChar(Msg_Title), mb_IconStop);
       exit;
      end;

      QRel.Sql.Clear;
      QRel.Sql.Add('SELECT TRANSACOES.*, CLIENTES.NOME , CLIENTES.CLIENTE_ID FROM TRANSACOES ');
      QRel.SQL.Add('LEFT JOIN CLIENTES ON CLIENTES.CLIENTE_ID = TRANSACOES.CLIENTE_ID ');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL) ');

      if Caixa_banco.Value <> 0 then
       QRel.Sql.Add('AND (TRANSACOES.BANCO_ID = :BANCO_ID)');

      if venda_prazo.Checked then
      Begin
      QRel.Sql.Clear;
      QRel.Sql.Add('SELECT TRANSACOES.*, CLIENTES.NOME , CLIENTES.CLIENTE_ID, TRANSPARCELAS.VALOR VALOR_REC FROM TRANSACOES ');
      QRel.SQL.Add('LEFT JOIN CLIENTES ON CLIENTES.CLIENTE_ID = TRANSACOES.CLIENTE_ID ');
      QRel.SQL.Add('LEFT JOIN TRANSPARCELAS ON TRANSPARCELAS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID ');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL) ');
      QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :CONDUTA)');
      QRel.Sql.Add('AND (TRANSACOES.DEPTO = :DEPTO)');
      QRel.Sql.Add('AND (TRANSACOES.COND_PAGTO = :COND_PAGTO)');
      QRel.Sql.Add('AND (TRANSPARCELAS.VALOR > 0)');
      QRel.SQL.Add('AND (TRANSPARCELAS.BANCO_ID = 0)');
      QRel.Sql.Add('AND (TRANSPARCELAS.AGRUPAMENTO = 0)');
      QRel.Sql.Add('AND (TRANSPARCELAS.TIPO_TRANSACAO = :TIPO) ');
      QRel.Sql.Add('AND (TRANSACOES.FINALIZADORA_ID > 0)');

       if Caixa_banco.Value <> 0 then
       QRel.Sql.Add('AND (TRANSACOES.BANCO_ID = :BANCO_ID)');

      QRel.Sql.Add('ORDER BY DT_TRANS, NOME');

      End;


      if venda_Finalizadora.Checked then
      Begin
      QRel.Sql.Clear;
      QRel.Sql.Add('SELECT TRANSACOES.*, FINALIZADORAS.DESCRICAO NOME FROM TRANSACOES ');
      QRel.SQL.Add('INNER JOIN FINALIZADORAS ON FINALIZADORAS.FINALIZADORA_ID = TRANSACOES.FINALIZADORA_ID ');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL) ');
      QRel.Sql.Add('AND (TRANSACOES.FINALIZADORA_ID > 0)');

      if Qfinalizadora.IsEmpty then
      QRel.Sql.Add('AND (FINALIZADORAS.DESCRICAO LIKE :CARTAO)')
      Else
      QRel.Sql.Add('AND (TRANSACOES.FINALIZADORA_ID = :FINALIZADORA_ID) ');

      if Caixa_banco.Value <> 0 then
      QRel.Sql.Add('AND (TRANSACOES.BANCO_ID = :BANCO_ID)');
      End;

      QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
      QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
      QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
      QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;

      if Caixa_banco.Value <> 0 then
      QRel.ParamByName('BANCO_ID').AsInteger    := StrToInt(Caixa_banco.Text);

      If venda_prazo.Checked then
      Begin
      QRel.ParamByName('CONDUTA').AsString    := '01';
      QRel.ParamByName('DEPTO').AsString      := '07';
      QRel.ParamByName('COND_PAGTO').AsString := 'A PRAZO';
      QRel.ParamByName('TIPO').AsString := 'T';
      End;

      if venda_Finalizadora.Checked then
      if QFinalizadora.IsEmpty then
      QRel.ParamByName('CARTAO').AsString := '%'+'CARTAO'
      Else
      QRel.ParamByName('FINALIZADORA_ID').AsInteger := QFinalizadora.FieldByName('FINALIZADORA_ID').AsInteger;

      QRel.Prepare;
      QRel.Open;

      QRel.First;
      while not QRel.Eof do
      begin
        if (QRel.FieldByName('CONDUTA').AsString = '01') and (QRel.FieldByName('DEPTO').AsString = '07') and (QRel.FieldByName('COND_PAGTO').AsString = 'A VISTA') and (QRel.FieldByName('TIPO_VENDA').AsString = 'VENDA') then
          Sub_Tit := '*** Venda a Vista ***';

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

        if (QRel.FieldByName('CONDUTA').AsString = '01') and (QRel.FieldByName('DEPTO').AsString = '07') and (QRel.FieldByName('COND_PAGTO').AsString = 'A PRAZO') then
          Sub_Tit := '*** Venda a Prazo ***';

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

        if (QRel.FieldByName('CONDUTA').AsString = '07') then
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
        Table_Temp.FieldByName('HISTORICO').AsString   := QRel.FieldByName('HISTORICO').AsString;
        Table_Temp.FieldByName('ACRESCIMO').AsFloat    := QRel.FieldByName('VR_ACRESCIMO').AsFloat;
        Table_Temp.FieldByName('DESCONTO').AsFloat     := QRel.FieldByName('VR_DESCONTO').AsFloat;
        Table_Temp.FieldByName('VALOR').AsFloat        := QRel.FieldByName('VALOR').AsFloat;
        Table_Temp.FieldByName('BANCO_ID').AsInteger   := QRel.FieldByName('BANCO_ID').AsInteger;
        Table_Temp.FieldByName('CLIENTE_ID').AsInteger := QRel.FieldByName('CLIENTE_ID').AsInteger;
        Table_Temp.FieldByName('NOME').AsString        := QRel.FieldByName('NOME').AsString;

        if venda_prazo.Checked then
        Table_Temp.FieldByName('VALOR_REC').AsFloat    := QRel.FieldByName('VALOR_REC').AsFloat;

        Table_Temp.Post;

        Application.ProcessMessages;
        QRel.Next;
      end;

      If (not venda_prazo.Checked) AND (not Venda_Finalizadora.Checked) then
      Begin
      QRel.Sql.Clear;
      QRel.Sql.Add('SELECT TRANSACOES.*, TRANSPARCELAS.VALOR AS VR_RECEBIMENTO');
      QRel.Sql.Add('FROM TRANSACOES');
      QRel.Sql.Add('LEFT JOIN TRANSPARCELAS');
      QRel.Sql.Add('ON (TRANSACOES.TRANSACAO_ID = TRANSPARCELAS.TRANSACAO_ID)');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('AND (TRANSPARCELAS.BANCO_ID > 0)');
      QRel.Sql.Add('AND (TRANSPARCELAS.TIPO_TRANSACAO = :TIPO_TRANSACAO) ');
       if Caixa_banco.Value <> 0 then
       QRel.Sql.Add('AND (TRANSACOES.BANCO_ID = :BANCO_ID)');

      QRel.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
      QRel.ParamByName('TPCTB').AsString          := FrmData.QAcesso.FieldByName('TPCTB').AsString;
      QRel.ParamByName('DT_INICIAL').AsDateTime   := Dtmen.Date;
      QRel.ParamByName('DT_FINAL').AsDateTime     := Dtmai.Date;
      QRel.ParamByName('TIPO_TRANSACAO').AsString := 'T';

       if Caixa_banco.Value <> 0 then
      QRel.ParamByName('BANCO_ID').AsInteger    := StrToInt(Caixa_banco.Text);


      QRel.Prepare;
      QRel.Open;

      QRel.First;
      while not QRel.Eof do
      begin
        if (QRel.FieldByName('CONDUTA').AsString = '01') and (QRel.FieldByName('COND_PAGTO').AsString = 'A PRAZO') then
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
          Else If (Venda_finalizadora.Checked) Then
          Resumo2.PreviewModal
          Else
          Resumo.PreviewModal
       End;
    finally
      Table_Temp.Close;
      Table_Temp.DeleteTable;

      btnExecuta.Enabled := True;
      btnRetorna.Enabled := True;
    end;
  end;

  if Tipo_Rel.Text = 'Sintético' then
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
      if Caixa_banco.Value <> 0 then
      QRel.Sql.Add('AND (TRANSACOES.BANCO_ID = :BANCO_ID)');
      QRel.Sql.Add('AND (TRANSACOES.SERIE = :NORMAL)');

      QRel.Sql.Add('UNION ALL');

      QRel.Sql.Add('SELECT TABELAS.DESCRICAO, COALESCE(TRANSACOES.VALOR_PARCELA, 0) CREDITO, 0 DEBITO');
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
      if Caixa_banco.Value <> 0 then
      QRel.Sql.Add('AND (TRANSACOES.BANCO_ID = :BANCO_ID)');
      QRel.Sql.Add('AND (TRANSACOES.SERIE = :NORMAL)');

      QRel.Sql.Add('UNION ALL');

      QRel.Sql.Add('SELECT TABELAS.DESCRICAO, 0 CREDITO, COALESCE(TRANSACOES.VALOR_PARCELA, 0) DEBITO');
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

      QRel.Sql.Add(')');

      QRel.Sql.Add('GROUP BY DESCRICAO');

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
      QRel.ParamByName('BANCO_ID').AsInteger    := StrToInt(Caixa_banco.Text);

      QRel.Prepare;
      QRel.Open;

      QRLabel7.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;

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
     QRel.Sql.Add('SELECT TABELAS.DESCRICAO,TRANSACOES.DT_TRANS, TRANSACOES.NUM_DOC,TRANSACOES.HISTORICO,0 CREDITO,COALESCE(TRANSACOES.VALOR_PARCELA, 0) DEBITO');
     QRel.Sql.Add('FROM TRANSACOES');
     QRel.Sql.Add('INNER JOIN TRANSACOES ORIGEM ON (TRANSACOES.ENTRADA_ID = ORIGEM.TRANSACAO_ID)');
     QRel.Sql.Add('INNER JOIN TABELAS ON ((ORIGEM.CONTA_ID = TABELAS.TABELA_ID) AND (TABELAS.TIPO_TABELA = :TIPO_TABELA))');
     QRel.Sql.Add('WHERE (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
     QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID) AND (TRANSACOES.TPCTB <= :TPCTB) AND (TRANSACOES.CONDUTA = :COND_PAGTO)');
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

      QRel.Sql.Add('SELECT TABELAS.DESCRICAO, TRANSACOES.DT_TRANS , TRANSACOES.NUM_DOC, TRANSACOES.HISTORICO, 0 CREDITO, COALESCE(TRANSACOES.VALOR_PARCELA, 0) DEBITO');
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
      if Caixa_banco.Value <> 0 then
      QRel.Sql.Add('AND (TRANSACOES.BANCO_ID = :BANCO_ID)');
      QRel.Sql.Add('AND (TRANSACOES.SERIE = :NORMAL)');


     QRel.Sql.Add(')');
     if Conta_id.Value > 0  then
     QRel.Sql.Add('WHERE DESCRICAO = :DESCRICAO_CONTA');

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
   on e:Exception do
        begin
          Application.MessageBox(PChar('Erro ao importar produtos!' + #13 +
            'Erro: ' + e.Message), 'Erro', MB_ICONSTOP + MB_TASKMODAL);
        end;
  
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
    Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
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

procedure TFrmResumo_Diario.FormShow(Sender: TObject);
begin
try
    QFinalizadora.Open;
  except
    Application.MessageBox('Erro ao conectar com o Banco de Dados', PChar(Msg_Title), mb_IconStop);
    Application.Terminate;
  end;

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

procedure TFrmResumo_Diario.Tipo_RelChange(Sender: TObject);
begin

if Tipo_Rel.Text = 'Detalhado por Conta' then
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
  Venda_Finalizadora.Visible := False;
  Finalizadorabox.Visible    := False;
  End;



  end;
procedure TFrmResumo_Diario.VENDA_FINALIZADORAClick(Sender: TObject);
begin
if Venda_Finalizadora.Checked then
   Begin
   Venda_prazo.Enabled := False;
   FinalizadoraBox.Visible    := True;
   End
   Else
   Begin
   Venda_prazo.Enabled        := True;
   FinalizadoraBox.Visible    := False;
   End; 

end;

procedure TFrmResumo_Diario.Venda_prazoClick(Sender: TObject);
begin
if Venda_Prazo.Checked then
   Venda_Finalizadora.Enabled := False
   Else
   Venda_Finalizadora.Enabled := True;
end;

end.
