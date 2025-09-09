unit UTrans_Recebimento_Lote_Cartao;

interface
                                       
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, StdCtrls, Tabs, ComCtrls, Grids,
  DBGrids, Buttons, rxCurrEdit, Mask, rxToolEdit, ExtCtrls, DBTables, QRCtrls,
  QuickRpt,Math, Menus, DBCtrls,DateUtils, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmTrans_Recebimento_Lote_Cartao = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Dtmen: TDateEdit;
    Dtmai: TDateEdit;
    Label2: TLabel;
    Cliente: TCurrencyEdit;
    btnCliente: TSpeedButton;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Alfabeto: TTabSet;
    btnExecuta: TButton;
    btnRetorna: TButton;
    DataContas: TDataSource;
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
    btnCaixa: TSpeedButton;
    Caixa: TCurrencyEdit;
    Especie: TComboBox;
    Label8: TLabel;
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
    Vr_Tx_Adm: TRxCalcEdit;
    Dias: TCurrencyEdit;
    Label11: TLabel;
    GroupBox1: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    PopupMenu1: TPopupMenu;
    Consulta_Valores: TMenuItem;
    Label15: TLabel;
    Vr_Multa: TRxCalcEdit;
    FINALIZADORA_ID: TDBLookupComboBox;
    Label16: TLabel;
    DataFinalizadora: TDataSource;
    DataConta: TDataSource;
    Label17: TLabel;
    CONTA_ID: TCurrencyEdit;
    btnConta: TSpeedButton;
    Chk_Perdas: TCheckBox;
    IQuery: TFDQuery;
    QOrcamento: TFDQuery;
    QRel: TFDQuery;
    QConta: TFDQuery;
    QCliente: TFDQuery;
    QSearch: TFDQuery;
    QFinalizadora: TFDQuery;
    Qcontas: TFDQuery;
    Fdac_Temp: TFDMemTable;
    Memo1: TMemo;
    Table_Temp_Agrupar: TFDMemTable;
    StatusBar1: TStatusBar;
    StatusBar2: TStatusBar;
    Finalizadora: TDBLookupComboBox;
    dataconsfinalizadora: TDataSource;
    QConsFinalizadora: TFDQuery;
    Label18: TLabel;
    Label19: TLabel;
    tp_cartao: TComboBox;
    chk_finalizadora: TCheckBox;
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
    procedure Consulta_ValoresClick(Sender: TObject);
    procedure btnContaClick(Sender: TObject);
    procedure CONTA_IDExit(Sender: TObject);
    procedure CONTA_IDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Vr_QuitarExit(Sender: TObject);
    procedure Chk_PerdasClick(Sender: TObject);
    procedure Fdac_TempAfterOpen(DataSet: TDataSet);
    procedure chk_finalizadoraClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Seleciona;
    procedure Soma;
    procedure Cria_Dados_Temporarios;
    procedure Cria_Dados_Temporarios_Agrupar;
  end;

var
  FrmTrans_Recebimento_Lote_Cartao: TFrmTrans_Recebimento_Lote_Cartao;
  Individual,Dif,Correc,Multa,soma_agrupar: Real;
  Fdac_Temp:Tfdmemtable;
  id_trans :Integer;

implementation

uses
  UPrincipal, UData, UConsulta, UProrroga, UAgrupamento_recebimento,UParcelas,
  UAgrupamento;

{$R *.dfm}

procedure TFrmTrans_Recebimento_Lote_Cartao.Cria_Dados_Temporarios_Agrupar;
begin
    Table_Temp_Agrupar.Append;
    Table_Temp_Agrupar.FieldByName('NOME').AsString             := Fdac_Temp.FieldByName('NOME').AsString;
    Table_Temp_Agrupar.FieldByName('ENDERECO').AsString         := Fdac_Temp.FieldByName('ENDERECO').AsString;
    Table_Temp_Agrupar.FieldByName('NUMERO').AsString           := Fdac_Temp.FieldByName('NUMERO').AsString;
    Table_Temp_Agrupar.FieldByName('TRANSACAO_ID').AsInteger    := Fdac_Temp.FieldByName('TRANSACAO_ID').AsInteger;
    Table_Temp_Agrupar.FieldByName('PARCELA_ID').AsString       := Fdac_Temp.FieldByName('PARCELA_ID').AsString;
    Table_Temp_Agrupar.FieldByName('TIPO_TRANSACAO').AsString   := Fdac_Temp.FieldByName('TIPO_TRANSACAO').AsString;
    Table_Temp_Agrupar.FieldByName('DT_VENCIMENTO').AsDateTime  := Fdac_Temp.FieldByName('DT_VENCIMENTO').AsDateTime;
    Table_Temp_Agrupar.FieldByName('BANCO_ID').AsInteger        := Fdac_Temp.FieldByName('BANCO_ID').AsInteger;
    Table_Temp_Agrupar.FieldByName('VALOR').AsFloat             := Fdac_Temp.FieldByName('VALOR').AsFloat;
    Table_Temp_Agrupar.FieldByName('PAGTO').AsString            := Fdac_Temp.FieldByName('PAGTO').AsString;
    Table_Temp_Agrupar.FieldByName('DUPLICATA').AsString        := Fdac_Temp.FieldByName('DUPLICATA').AsString;
    Table_Temp_Agrupar.FieldByName('ESPECIE').AsString          := Fdac_Temp.FieldByName('ESPECIE').AsString;
    Table_Temp_Agrupar.FieldByName('HISTORICO').AsString        := Fdac_Temp.FieldByName('HISTORICO').AsString;
    Table_Temp_Agrupar.FieldByName('NUM_DOC').AsString          := Fdac_Temp.FieldByName('NUM_DOC').AsString;
    Table_Temp_Agrupar.FieldByName('CONTA_ID').AsInteger        := Fdac_Temp.FieldByName('CONTA_ID').AsInteger;
    Table_Temp_Agrupar.FieldByName('VENDEDOR_ID').AsInteger     := Fdac_Temp.FieldByName('VENDEDOR_ID').AsInteger;
    Table_Temp_Agrupar.FieldByName('EMPRESA_ID').AsInteger      := Fdac_Temp.FieldByName('EMPRESA_ID').AsInteger;
    Table_Temp_Agrupar.FieldByName('TPCTB').AsString            := Fdac_Temp.FieldByName('TPCTB').AsString;
    Table_Temp_Agrupar.FieldByName('C_CUSTO_ID').AsInteger      := Fdac_Temp.FieldByName('C_CUSTO_ID').AsInteger;
    Table_Temp_Agrupar.FieldByName('CLIENTE_ID').AsInteger      := Fdac_Temp.FieldByName('CLIENTE_ID').AsInteger;
    Table_Temp_Agrupar.FieldByName('VALOR_DESPESAS').AsFloat    := Fdac_Temp.FieldByName('VALOR_DESPESAS').AsFloat ;
    Table_Temp_Agrupar.FieldByName('DT_VENC_ORI').AsDateTime    := Fdac_Temp.FieldByName('DT_VENC_ORI').AsDateTime;
    Table_Temp_Agrupar.FieldByName('VALOR_ORI').AsFloat         := Fdac_Temp.FieldByName('VALOR_ORI').AsFloat ;
    Table_Temp_Agrupar.FieldByName('VALOR_MULTA').AsFloat       := Fdac_Temp.FieldByName('VALOR_MULTA').AsFloat;
    Table_Temp_Agrupar.FieldByName('JUROS').AsFloat             := Fdac_Temp.FieldByName('JUROS').AsFloat;
    Table_Temp_Agrupar.FieldByName('VALOR_TOTAL').AsFloat       := Fdac_Temp.FieldByName('VALOR_TOTAL').AsFloat;
    Table_Temp_Agrupar.FieldByName('PERDA').AsInteger           := Fdac_Temp.FieldByName('PERDA').AsInteger;
    Table_Temp_Agrupar.Post;

    Table_Temp_Agrupar.First;
    soma_agrupar := 0;
    Memo1.Lines.Clear;
    Memo1.Lines.Add('              ***Agrupamento de Contas***');

    while not Table_Temp_Agrupar.Eof do
    Begin

    Memo1.Lines.Add(Table_Temp_Agrupar.FieldByName('NOME').AsString + ' -> ' + FormatFloat('#,##0.00', Table_Temp_Agrupar.FieldByName('VALOR_TOTAL').AsFloat));
    Soma_agrupar := Soma_agrupar + Table_Temp_Agrupar.FieldByName('VALOR_TOTAL').AsFloat;

    Application.ProcessMessages;
    Table_Temp_Agrupar.Next;
    End;
    Memo1.Lines.Add('-------------------------------------------------------------------------');
    Memo1.Lines.Add('Total-------------------------------------------------> R$' + FormatFloat('#,##0.00', soma_agrupar));

end;


procedure TFrmTrans_Recebimento_Lote_Cartao.Cria_Dados_Temporarios;
begin

   Table_Temp_Agrupar.Free;
   Table_Temp_Agrupar := TFDMemTable.Create(nil);

  with Table_Temp_Agrupar do
  begin
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
      Add('TX_ADM', ftFloat, 0, False);
      Add('VALOR_TOTAL', ftFloat, 0, False);
      Add('VALOR_DESPESAS', ftFloat, 0, False);
      Add('DT_VENC_ORI', ftDate, 0, False);
      Add('VALOR_ORI', ftFloat, 0, False);
      Add('VALOR_TX_ADM', ftFloat, 0, False);
      Add('PERDA', ftInteger, 0, False);

    end;

    with IndexDefs do
    begin
      Clear;
      Add('', 'ACESSO', [ixPrimary, ixUnique]);
      Add('TEMP', 'NOME;DT_VENCIMENTO', [ixCaseInsensitive]);
    end;

   // CreateTable;
    IndexName := 'TEMP';
    Open;

  End;

    Memo1.Lines.Clear;
    Memo1.Visible      := False;
    StatusBar1.Visible := False;



  Fdac_Temp.Free;
  Fdac_Temp := TFDMemTable.Create(nil);

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
      Add('DT_VENCIMENTO', ftDate, 0, False);
      Add('BANCO_ID', ftInteger, 0, False);
      Add('VALOR', ftFloat, 0, False);
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
      Add('TX_ADM', ftFloat, 0, False);
      Add('VALOR_TOTAL', ftFloat, 0, False);
      Add('VALOR_DESPESAS', ftFloat, 0, False);
      Add('DT_VENC_ORI', ftDate, 0, False);
      Add('VALOR_ORI', ftFloat, 0, False);
      Add('VALOR_TX_ADM', ftFloat, 0, False);
      Add('PERDA', ftInteger, 0, False);

    end;

    with Fdac_Temp.IndexDefs do
    begin
      Clear;
      Add('', 'ACESSO', [ixPrimary, ixUnique]);
      Add('TEMP', 'NOME;DT_VENCIMENTO', [ixCaseInsensitive]);
    end;
    Fdac_Temp.IndexName := 'TEMP';
    Fdac_Temp.CreateDataSet;
    Fdac_Temp.Open;

    except on E: Exception do
     ShowMessage( E.Message );
  end;

   Fdac_temp.LogChanges                 := False;
   Fdac_Temp.FetchOptions.RecsMax       := 300000;
   Fdac_Temp.ResourceOptions.SilentMode := True;
   Fdac_Temp.UpdateOptions.LockMode     := lmNone;
   Fdac_Temp.UpdateOptions.LockPoint    := lpDeferred;
   Fdac_Temp.UpdateOptions.FetchGeneratorsPoint := gpImmediate;

   Fdac_Temp.BeginBatch();
   try
      QContas.First;
      while not QContas.Eof do
      begin

        //Dif    := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime - (QContas.FieldByName('DT_VENCIMENTO').AsDateTime + FrmPrincipal.Config.FieldByName('CARENCIA').AsInteger);
        Correc := (((QContas.FieldByName('VALOR').AsFloat * QContas.FieldByName('TX_ADM').AsFloat) / 100) );
        Correc := RoundTo(Correc, -2);

       { if ((QContas.FieldByName('DT_VENCIMENTO').AsDateTime + FrmPrincipal.Config.FieldByName('CARENCIA').AsInteger) <= Date) AND (QContas.FieldByName('ESPECIE').AsString <> 'RESTANTE') then
        Begin
        Multa  := ((QContas.FieldByName('VALOR').AsFloat * FrmPrincipal.Config.FieldByName('MULTA').AsFloat) / 100);
        Multa  := RoundTo(Multa, -2);
        End
        Else
        Multa  := 0;


        if (QContas.FieldByName('DUPLICATA').AsString = 'MENSALIDADE') Then
        begin
        Multa  := 0;
        Correc := 0;
        end;
             }

        Fdac_Temp.Append;
        Fdac_Temp.FieldByName('NOME').AsString             := Copy(QContas.FieldByName('NOME').AsString, 1, 70);
        Fdac_Temp.FieldByName('ENDERECO').AsString         := Copy(QContas.FieldByName('ENDERECO').AsString, 1, 60);
        Fdac_Temp.FieldByName('NUMERO').AsString           := QContas.FieldByName('NUMERO').AsString;
        Fdac_Temp.FieldByName('TRANSACAO_ID').AsInteger    := QContas.FieldByName('TRANSACAO_ID').AsInteger;
        Fdac_Temp.FieldByName('PARCELA_ID').AsString       := QContas.FieldByName('PARCELA_ID').AsString;
        Fdac_Temp.FieldByName('TIPO_TRANSACAO').AsString   := QContas.FieldByName('TIPO_TRANSACAO').AsString;
        Fdac_Temp.FieldByName('DT_VENCIMENTO').AsDateTime  := QContas.FieldByName('DT_VENCIMENTO').AsDateTime;
        Fdac_Temp.FieldByName('BANCO_ID').AsInteger        := QContas.FieldByName('BANCO_ID').AsInteger;
        Fdac_Temp.FieldByName('VALOR').AsFloat             := QContas.FieldByName('VALOR').AsFloat;
        Fdac_Temp.FieldByName('PAGTO').AsString            := QContas.FieldByName('PAGTO').AsString;
        Fdac_Temp.FieldByName('DUPLICATA').AsString        := QContas.FieldByName('DUPLICATA').AsString;
        Fdac_Temp.FieldByName('ESPECIE').AsString          := QContas.FieldByName('ESPECIE').AsString;
        Fdac_Temp.FieldByName('HISTORICO').AsString        := QContas.FieldByName('HISTORICO').AsString;
        Fdac_Temp.FieldByName('NUM_DOC').AsString          := QContas.FieldByName('NUM_DOC').AsString;
        Fdac_Temp.FieldByName('CONTA_ID').AsInteger        := QContas.FieldByName('CONTA_ID').AsInteger;
        Fdac_Temp.FieldByName('VENDEDOR_ID').AsInteger     := QContas.FieldByName('VENDEDOR_ID').AsInteger;
        Fdac_Temp.FieldByName('EMPRESA_ID').AsInteger      := QContas.FieldByName('EMPRESA_ID').AsInteger;
        Fdac_Temp.FieldByName('TPCTB').AsString            := QContas.FieldByName('TPCTB').AsString;
        Fdac_Temp.FieldByName('C_CUSTO_ID').AsInteger      := QContas.FieldByName('C_CUSTO_ID').AsInteger;
        Fdac_Temp.FieldByName('CLIENTE_ID').AsInteger      := QContas.FieldByName('CLIENTE_ID').AsInteger;
        Fdac_Temp.FieldByName('VALOR_DESPESAS').AsFloat    := QContas.FieldByName('VALOR_DESPESAS').AsFloat ;
        Fdac_Temp.FieldByName('DT_VENC_ORI').AsDateTime    := QContas.FieldByName('DT_VENC_ORI').AsDateTime;
        Fdac_Temp.FieldByName('VALOR_ORI').AsFloat         := QContas.FieldByName('VALOR_ORI').AsFloat ;
        Fdac_Temp.FieldByName('TX_ADM').AsFloat            := QContas.FieldByName('TX_ADM').AsFloat;

      {  if ((QContas.FieldByName('DT_VENCIMENTO').AsDateTime + FrmPrincipal.Config.FieldByName('CARENCIA').AsInteger) <= Date) AND (QContas.FieldByName('DESPESA_ID').AsInteger = 0) then
        Begin

        End
        Else
        Begin
        Fdac_Temp.FieldByName('JUROS').AsFloat             := 0;
        Fdac_Temp.FieldByName('VALOR_TOTAL').AsFloat       := QContas.FieldByName('VALOR').AsFloat + Multa;
        End; }

        Fdac_Temp.FieldByName('VALOR_TX_ADM').AsFloat      := Correc;
        Fdac_Temp.FieldByName('VALOR_TOTAL').AsFloat       := QContas.FieldByName('VALOR').AsFloat - Correc ;
        Fdac_Temp.FieldByName('PERDA').AsInteger           := QContas.FieldByName('PERDA').AsInteger;


        Fdac_Temp.Post;

        Application.ProcessMessages;

        QContas.Next;
      end;

   Finally
    Fdac_Temp.EndBatch;
   End;
  DataContas.DataSet := Fdac_Temp;


  TFloatField(Fdac_Temp.FieldByName('VALOR')).DisplayFormat        := '#,##0.00';
  TFloatField(Fdac_Temp.FieldByName('TX_ADM')).DisplayFormat       := '#,##0.00';
  TFloatField(Fdac_Temp.FieldByName('VALOR_TOTAL')).DisplayFormat  := '#,##0.00';
  TFloatField(Fdac_Temp.FieldByName('VALOR_TX_ADM')).DisplayFormat := '#,##0.00';


  Fdac_Temp.Open;


end;

procedure TFrmTrans_Recebimento_Lote_Cartao.Seleciona;
begin

  QContas.Sql.Clear;
  QContas.Sql.Add('SELECT CLIENTES.NOME, CLIENTES.ENDERECO, CLIENTES.NUMERO, TRANSPARCELAS.*, TRANSACOES.HISTORICO, TRANSACOES.NUM_DOC, TRANSACOES.CONTA_ID, TRANSACOES.VENDEDOR_ID, TRANSACOES.EMPRESA_ID, ' +
                  'TRANSACOES.TPCTB, TRANSACOES.C_CUSTO_ID, TRANSACOES.CLIENTE_ID,TRANSPARCELAS.PERDA,FINALIZADORAS.TX_ADM ');
  QContas.Sql.Add('FROM CLIENTES');
  QContas.Sql.Add('INNER JOIN TRANSACOES');
  QContas.Sql.Add('ON (CLIENTES.CLIENTE_ID = TRANSACOES.CLIENTE_ID)');
  QContas.Sql.Add('INNER JOIN FINALIZADORAS');
  QContas.Sql.Add('ON ((FINALIZADORAS.FINALIZADORA_ID = TRANSACOES.FINALIZADORA_ID) AND ((FINALIZADORAS.CLIENTE_ID > 0) AND (TRANSACOES.PARCELA_ID <> :PARCELA_ID)))');
  QContas.Sql.Add('INNER JOIN TRANSPARCELAS');
  QContas.Sql.Add('ON (TRANSACOES.TRANSACAO_ID = TRANSPARCELAS.TRANSACAO_ID)');
  QContas.Sql.Add('WHERE');
  QContas.Sql.Add('(TRANSACOES.COND_PAGTO = :COND_PAGTO OR TRANSACOES.FINALIZADORA_ID = 6) AND (TRANSACOES.DT_TRANS >= :DT_INICIO)');


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

  IF not QConsFinalizadora.IsEmpty  then
  begin
   QContas.Sql.Add('AND (TRANSACOES.FINALIZADORA_ID = :FINALIZADORA_ID)');
   QContas.ParamByName('FINALIZADORA_ID').AsInteger := Finalizadora.KeyValue;
  end;

  IF tp_cartao.Text = 'DEBITO' then
  begin
   QContas.Sql.Add('AND (FINALIZADORAS.C_DEBITO = :C_DEBITO)');
   QContas.ParamByName('C_DEBITO').AsString := 'True';
  end;

  IF tp_cartao.Text = 'CREDITO' then
  begin
   QContas.Sql.Add('AND (FINALIZADORAS.C_CREDITO = :C_CREDITO)');
   QContas.ParamByName('C_CREDITO').AsString := 'True';
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

  if chk_Perdas.Checked = False then
  BEGIN
    if Cliente.Value > 0 then
    begin
     QContas.Sql.Add('AND ((TRANSACOES.CLIENTE_ID = :CLIENTE_ID) AND (TRANSPARCELAS.PERDA <> 1) OR (TRANSPARCELAS.PERDA IS NULL)) ');
    end
    Else
     QContas.Sql.Add('AND ((TRANSPARCELAS.PERDA <> 1) OR (TRANSPARCELAS.PERDA IS NULL)) ');
  END;

  QContas.Sql.Add('ORDER BY CLIENTES.NOME, TRANSPARCELAS.DT_VENCIMENTO, TRANSPARCELAS.PARCELA_ID');

  QContas.ParamByName('COND_PAGTO').AsString     := 'A PRAZO';
  QContas.ParamByName('DT_INICIAL').AsDateTime   := Dtmen.Date;
  QContas.ParamByName('DT_FINAL').AsDateTime     := Dtmai.Date;
  QContas.ParamByName('TIPO_TRANSACAO').AsString := 'T';
  QContas.ParamByName('DT_INICIO').AsDateTime    := StrToDate('09/11/17');
  QContas.ParamByName('PARCELA_ID').AsString     := '000F';

  QContas.Prepare;
  QContas.Open;

  if not QContas.IsEmpty then
  Consulta_Valores.Enabled := True
  Else
  Consulta_Valores.Enabled := True;


  Cria_Dados_Temporarios;

  Soma;

  DBGrid1.SetFocus;

  if Cliente.Value > 0 then
  Vr_Quitar.Enabled := True;

end;

procedure TFrmTrans_Recebimento_Lote_Cartao.Soma;
begin
  try
    Aguarde.Visible := True;

    Vr_Soma.Value     := 0;
    Vr_Despesas.Value := 0;
    Vr_Total.Value    := 0;
    Vr_tx_adm.Value   := 0;
    Dias.Value        := 0;
    Vr_Multa.Value    := 0;

    QContas.First;
    while not QContas.Eof do
    begin


      Vr_Soma.Value     := (Vr_Soma.Value + QContas.FieldByName('VALOR').AsFloat);
     // Vr_Despesas.Value := (Vr_Despesas.Value + QContas.FieldByName('VALOR_DESPESAS').AsFloat);

     // if (FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime >= (QContas.FieldByName('DT_VENCIMENTO').AsDateTime + FrmPrincipal.Config.FieldByName('CARENCIA').AsInteger)) and (FrmPrincipal.Config.FieldByName('JUROS_MENSAL').AsFloat > 0)
     //     AND (QContas.FieldByName('DUPLICATA').AsString <> 'MENSALIDADE') then
     // begin
      //  Dif    := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime - (QContas.FieldByName('DT_VENCIMENTO').AsDateTime + FrmPrincipal.Config.FieldByName('CARENCIA').AsInteger);
        Correc := (((QContas.FieldByName('VALOR').AsFloat * QContas.FieldByName('TX_ADM').AsFloat) /100));
        Correc := RoundTo(Correc, -2);
        Vr_TX_ADM.Value := Correc + Vr_TX_ADM.Value;

     { if (FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime >= (QContas.FieldByName('DT_VENCIMENTO').AsDateTime + FrmPrincipal.Config.FieldByName('CARENCIA').AsInteger)) AND (QContas.FieldByName('ESPECIE').AsString <> 'RESTANTE')
          and (FrmPrincipal.Config.FieldByName('MULTA').AsFloat > 0)  AND (QContas.FieldByName('DUPLICATA').AsString <> 'MENSALIDADE') then
      Begin
      Multa  := ((QContas.FieldByName('VALOR').AsFloat * FrmPrincipal.Config.FieldByName('MULTA').AsFloat) / 100);
      Multa  := RoundTo(Multa, -2);
      Vr_Multa.Value := Multa + Vr_Multa.Value;

      Label15.Visible :=  True;
      Vr_Multa.Visible := True
      End;  }

      Application.ProcessMessages;
      QContas.Next;
    end;

    Vr_Total.Value := (Vr_Soma.Value - Vr_tx_adm.Value);

    QContas.First;
  finally
    Aguarde.Visible := False;
  end;
end;

procedure TFrmTrans_Recebimento_Lote_Cartao.Vr_QuitarExit(Sender: TObject);
begin
if Vr_Quitar.Value > Vr_Total.Value then
Conta_id.value :=  FrmPrincipal.Config.FieldByName('CONTA_JUROS').AsInteger;

if Vr_Quitar.Value < Vr_Total.Value then
Conta_id.value :=  FrmPrincipal.Config.FieldByName('CONTA_DESCONTO').AsInteger;
end;

procedure TFrmTrans_Recebimento_Lote_Cartao.AlfabetoClick(Sender: TObject);
begin
  QContas.Sql.Clear;
  QContas.Sql.Add('SELECT CLIENTES.NOME, CLIENTES.ENDERECO, CLIENTES.NUMERO, TRANSPARCELAS.*, TRANSACOES.HISTORICO, TRANSACOES.NUM_DOC, TRANSACOES.CONTA_ID, TRANSACOES.VENDEDOR_ID, TRANSACOES.EMPRESA_ID, ' +
                  'TRANSACOES.TPCTB, TRANSACOES.C_CUSTO_ID, TRANSACOES.CLIENTE_ID,TRANSPARCELAS.PERDA,FINALIZADORAS.TX_ADM ');
  QContas.Sql.Add('FROM CLIENTES');
  QContas.Sql.Add('INNER JOIN TRANSACOES');
  QContas.Sql.Add('ON (CLIENTES.CLIENTE_ID = TRANSACOES.CLIENTE_ID)');
  QContas.Sql.Add('INNER JOIN FINALIZADORAS');
  QContas.Sql.Add('ON ((FINALIZADORAS.FINALIZADORA_ID = TRANSACOES.FINALIZADORA_ID) AND (FINALIZADORAS.CLIENTE_ID > 0)) ');
  QContas.Sql.Add('INNER JOIN TRANSPARCELAS');
  QContas.Sql.Add('ON (TRANSACOES.TRANSACAO_ID = TRANSPARCELAS.TRANSACAO_ID)');
  QContas.Sql.Add('WHERE');
  QContas.Sql.Add('(CLIENTES.NOME LIKE :NOME)');
  QContas.Sql.Add(' AND (TRANSACOES.COND_PAGTO = :COND_PAGTO) AND (TRANSACOES.DT_TRANS >= :DT_INICIO) ');


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

  if chk_Perdas.Checked = False then
     QContas.Sql.Add('AND ((CLIENTES.NOME LIKE :NOME) AND (TRANSPARCELAS.PERDA <> 1) OR (TRANSPARCELAS.PERDA IS NULL)) ');


  QContas.Sql.Add('ORDER BY CLIENTES.NOME, TRANSPARCELAS.DT_VENCIMENTO, TRANSPARCELAS.PARCELA_ID');

  QContas.ParamByName('NOME').AsString           := Chr(Alfabeto.TabIndex + 65) + '%';
  QContas.ParamByName('COND_PAGTO').AsString     := 'A PRAZO';
  QContas.ParamByName('DT_INICIAL').AsDateTime   := Dtmen.Date;
  QContas.ParamByName('DT_FINAL').AsDateTime     := Dtmai.Date;
  QContas.ParamByName('DT_INICIO').AsDateTime    := StrToDate('09/11/2017');
  QContas.ParamByName('TIPO_TRANSACAO').AsString := 'T';


  QContas.Prepare;
  QContas.Open;

  if not QContas.IsEmpty then
  Consulta_Valores.Enabled := True
  Else
  Consulta_Valores.Enabled := True;

  Cria_Dados_Temporarios;

  Soma;

  DBGrid1.SetFocus;
end;

procedure TFrmTrans_Recebimento_Lote_Cartao.btnExecutaClick(Sender: TObject);
var
Valor, Valor_j, Percentual,Valor_Help: Real;
ID : Integer;
InputString,Vencimento_Help,Funcionario,h_Agrupado:string;
begin

  if (Cliente.Value = 0) Then
     exit;

  if (Application.MessageBox('Deseja realmente quitar os valores selecionados?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) <> IDYES) then
    exit;

  if QContas.IsEmpty then
    exit;

  Valor             := Vr_Quitar.Value;
  Valor_j           := Vr_Quitar.Value;
  Individual        := 0;
  Percentual        := 0;
  Valor_help        := 0;
  Vencimento_Help   := '';
  Funcionario       := '';
  QRLabel18.Caption := 'Vr. rec. doc. ';

  if Vr_Quitar.Value > Vr_Total.Value then
  begin
    if (Application.MessageBox('O valor a ser quitado e superior a soma total dos recebmentos deseja continuar?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) <> IDYES) then
    Exit;

    QConta.Close;
    QConta.ParamByName('TABELA_ID').AsInteger := StrToInt(CONTA_ID.Text);
    QConta.Prepare;
    QConta.Open;
    if QConta.IsEmpty then
    begin
      Application.MessageBox('Campo conta Juros está incompleto', PChar(Msg_Title), mb_IconStop);
      CONTA_ID.Color := clYellow;
      CONTA_ID.SetFocus;
      exit;
    end;
    
    Percentual := (((Vr_Quitar.Value - Vr_Total.Value) * 100) / Vr_Total.Value);
    Individual := Vr_Quitar.Value;
  end;

  QCliente.Close;
  QCliente.ParamByName('CLIENTE_ID').AsInteger := StrToInt(Cliente.Text);
  QCliente.Open;

  if vr_Quitar.value > 0 then
  Begin
    if Vr_Quitar.Value < Vr_Total.Value then
    begin
      if (Application.MessageBox('O valor a ser quitado e inferior a soma total dos recebmentos deseja continuar?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) <> IDYES) then
      Exit;

      QConta.Close;
      QConta.ParamByName('TABELA_ID').AsInteger := StrToInt(CONTA_ID.Text);
      QConta.Prepare;
      QConta.Open;


      if QConta.IsEmpty then
      begin
        Application.MessageBox('Campo conta Desconto está incompleto', PChar(Msg_Title), mb_IconStop);
        CONTA_ID.Color := clYellow;
        CONTA_ID.SetFocus;
        exit;
      end;

      //Percentual := (((Vr_Quitar.Value - Vr_Total.Value) * 100) / Vr_Total.Value);
      //Individual := Vr_Quitar.Value;
    end;
  End;

  DBGrid1.DataSource.DataSet.First;
  while not DBGrid1.DataSource.DataSet.Eof do
  begin
    if Vr_Quitar.Value > 0 then
    begin
      if Vr_Quitar.Value <= Vr_Total.Value then
      begin
        if Valor > 0 then
        begin

          IQuery.SQL.Clear;
          IQuery.SQL.Add('SELECT NEXTVAL(:GEN_TRANSACOES) ID');
          IQuery.ParamByName('GEN_TRANSACOES').AsString :=  'GEN_TRANSACOES';

          IQuery.Prepare;
          IQuery.Open;

          Id := IQuery.FieldByName('ID').AsInteger;

          if  LeIni(Arq_Ini, 'Sistema', 'Histórico Recebimento por Lote') = 'True' Then
          if (Application.MessageBox('Deseja inserir detalhe para este recebimento?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = IDYES) then
          InputString := InputBox('Histórico do Recebimento', 'Histórico:', '')
          else
          InputString := '';

          if (FrmPrincipal.QEmpresa.FieldByName('CNPJ').AsString = '05.835.195/0001-03') and
           (DBGrid1.DataSource.DataSet.FieldByName('DUPLICATA').AsString = 'MENSALIDADE') then
          bEGIN
           AtualizarHelpDesk(SemMascara(QCliente.FieldByName('cnpj').AsString),'NÃO',FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsString);
          {
          Vencimento_Help := DateToStr(DBGrid1.DataSource.DataSet.FieldByName('DT_VENCIMENTO').AsDateTime);
          Funcionario     := FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsString;

          if AtualizarPagamento(SemMascara(QCliente.FieldByName('cnpj').AsString),Copy(vencimento_help,4,2),Copy(vencimento_help,7,4),Copy(vencimento_help,1,2),DateToStr(date),Funcionario,valor_help,0) then
          Application.MessageBox('Pagamento atualizado no Help Desk!', PChar(Msg_Title), mb_IconInformation)
          Else
            Begin
            Application.MessageBox('Pagamento não atualizado no Help Desk favor verificar!', PChar(Msg_Title), mb_IconInformation);
            Abort;
            End; }
          end;

          if copy (DBGrid1.DataSource.DataSet.FieldByName('HISTORICO').AsString,1,11) ='Agrupamento' Then
          Begin
           QSearch.SQL.Clear;
           QSearch.SQL.Add('SELECT DUPLICATA FROM TRANSPARCELAS WHERE AGRUPAMENTO =:TRANSACAO_ID');
           QSearch.ParamByName('TRANSACAO_ID').AsInteger :=  DBGrid1.DataSource.DataSet.FieldByName('TRANSACAO_ID').AsInteger;
           QSearch.Prepare;
           QSearch.Open;
           QSearch.First;

           while not QSearch.Eof do
           begin
           h_Agrupado := h_Agrupado + QSearch.FieldByName('DUPLICATA').AsString + '-' ;
           Application.ProcessMessages;
           QSearch.Next;
           end;
          End;



          QRel.Sql.Clear;
          QRel.Sql.Add('INSERT INTO TRANSACOES(TRANSACAO_ID, ' +
                       'DT_TRANS,       DT_MOVIMENTO,      CONDUTA, ' +
                       'EMPRESA_ID,     CLIENTE_ID,        BANCO_ID, ' +
                       'NUM_DOC,        SERIE,             FLUXO_CAIXA_ID, ' +
                       'SAIDA_ID,       PARCELA_ID,        VALOR_PARCELA, ' +
                       'VALOR,          BALANCO,           TPCTB, ' +
                       'AUTORIZ_ID,     HISTORICO,         HORA, PAGAMENTO,COMPLEMENTO,SUB_CODIGO,TIPO_VENDA) VALUES(:TRANSACAO_ID,' +
                       ':DT_TRANS,      :DT_MOVIMENTO,     :CONDUTA, ' +
                       ':EMPRESA_ID,    :CLIENTE_ID,       :BANCO_ID, ' +
                       ':NUM_DOC,       :SERIE,            :FLUXO_CAIXA_ID, ' +
                       ':SAIDA_ID,      :PARCELA_ID,       :VALOR_PARCELA, ' +
                       ':VALOR,         :BALANCO,          :TPCTB, ' +
                       ':AUTORIZ_ID,    :HISTORICO,        :HORA, :PAGAMENTO,:COMPLEMENTO,:SUB_CODIGO,:TIPO_VENDA)');

          QRel.ParamByName('TRANSACAO_ID').AsInteger  := ID;
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

          if Valor >= DBGrid1.DataSource.DataSet.FieldByName('VALOR_TOTAL').AsFloat then
          begin
            QRel.ParamByName('VALOR').AsFloat := DBGrid1.DataSource.DataSet.FieldByName('VALOR_TOTAL').AsFloat;

            Valor      := Valor - DBGrid1.DataSource.DataSet.FieldByName('VALOR_TOTAL').AsFloat;
            Individual := Individual + DBGrid1.DataSource.DataSet.FieldByName('VALOR_TOTAL').AsFloat;

          end
          else
          begin

            QRel.ParamByName('SERIE').AsString := 'P';
            QRel.ParamByName('VALOR').AsFloat  := Valor;

            Individual := Individual + Valor;
            Valor      := 0;

          end;

          QRel.ParamByName('BALANCO').AsString      := 'LIBERADO';
          QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
          QRel.ParamByName('AUTORIZ_ID').AsInteger  := FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger;

          if copy (DBGrid1.DataSource.DataSet.FieldByName('HISTORICO').AsString,1,11) ='Agrupamento' Then
          QRel.ParamByName('HISTORICO').AsString    := 'Notas Agrup.: ' + h_Agrupado + InputString
          else
          QRel.ParamByName('HISTORICO').AsString    := DBGrid1.DataSource.DataSet.FieldByName('HISTORICO').AsString + ' Parcela: ' + DBGrid1.DataSource.DataSet.FieldByName('PARCELA_ID').AsString + '-' + InputString ;


          QRel.ParamByName('HORA').AsString         := TimeToStr(time); //Copy(DBGrid1.DataSource.DataSet.FieldByName('DT_VENCIMENTO').AsString,4,3) + Copy(DBGrid1.DataSource.DataSet.FieldByName('DT_VENCIMENTO').AsString,1,3) + Copy(DBGrid1.DataSource.DataSet.FieldByName('DT_VENCIMENTO').AsString,9,2);
          QRel.ParamByName('PAGAMENTO').AsString    := QFinalizadora.FieldByName('LEGENDA').AsString;
          QRel.ParamByName('COMPLEMENTO').AsString  := 'Doc: ' + DBGrid1.DataSource.DataSet.FieldByName('NUM_DOC').AsString + ' - Venc.: ' + DBGrid1.DataSource.DataSet.FieldByName('DT_VENCIMENTO').AsString;
          QRel.ParamByName('SUB_CODIGO').AsString   := DBGrid1.DataSource.DataSet.FieldByName('DUPLICATA').AsString;
          QRel.ParamByName('TIPO_VENDA').AsString   :='PAGTO CARTAO';

          QRel.Prepare;
          QRel.ExecSql;


         {if  DBGrid1.DataSource.DataSet.FieldByName('JUROS').AsFloat  >= 0 then
         Begin

          if valor_j < DBGrid1.DataSource.DataSet.FieldByName('VALOR_TOTAL').AsFloat then
          Begin

            if Application.MessageBox(Pchar('Criar parcela valor restante de R$ ' + FloatToStr(RoundTo(DBGrid1.DataSource.DataSet.FieldByName('VALOR_TOTAL').AsFloat - Valor_j , -2 )) + #13 +
                                          'Valor Principal: ' + FloatToStr(DBGrid1.DataSource.DataSet.FieldByName('VALOR').AsFloat)  + #13 +
                                          'Duplicata : ' + DBGrid1.DataSource.DataSet.FieldByName('DUPLICATA').AsString  + #13 +
                                          'Vencimento: ' + DateToStr(DBGrid1.DataSource.DataSet.FieldByName('DT_VENCIMENTO').AsDateTime)), PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton1) = IDYES then
            Begin

            QRel.Sql.Clear;
            QRel.Sql.Add('UPDATE TRANSPARCELAS SET ESPECIE = :ESPECIE, VALOR = :VALOR, VALOR_JUROS = :VALOR_JUROS,');
            QRel.Sql.Add('DT_PAGAMENTO = :DT_PAGAMENTO, VALOR_ORI = :VALOR_ORI, DT_VENC_ORI = :DT_VENC_ORI');
            QRel.Sql.Add('WHERE');
            QRel.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
            QRel.Sql.Add('AND (PARCELA_ID = :PARCELA_ID)');


            QRel.ParamByName('ESPECIE').AsString       := 'RESTANTE';
            QRel.ParamByName('TRANSACAO_ID').AsInteger := DBGrid1.DataSource.DataSet.FieldByName('TRANSACAO_ID').AsInteger;
            QRel.ParamByName('PARCELA_ID').AsString    := DBGrid1.DataSource.DataSet.FieldByName('PARCELA_ID').AsString;
            QRel.ParamByName('VALOR').AsFloat          := DBGrid1.DataSource.DataSet.FieldByName('VALOR_TOTAL').AsFloat - Valor_j;
            QRel.ParamByName('VALOR_JUROS').AsFloat    := DBGrid1.DataSource.DataSet.FieldByName('JUROS').AsFloat;
            QRel.ParamByName('DT_PAGAMENTO').AsDate      := Date;
            QRel.ParamByName('VALOR_ORI').AsFloat      := DBGrid1.DataSource.DataSet.FieldByName('VALOR').AsFloat;
            QRel.ParamByName('DT_VENC_ORI').AsDate     := DBGrid1.DataSource.DataSet.FieldByName('DT_VENCIMENTO').AsDateTime;


            QRel.Prepare;
            QRel.ExecSql;




           // Valor_j := Valor_j - DBGrid1.DataSource.DataSet.FieldByName('VALOR_TOTAL').AsFloat;

            End
            Else
            Begin

              QRel.Sql.Clear;
              QRel.Sql.Add('UPDATE TRANSACOES SET SERIE = :SERIE , CONTA_ID = :CONTA_ID');
              QRel.Sql.Add('WHERE');
              QRel.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');


              QRel.ParamByName('SERIE').AsString         := 'D';
              QRel.ParamByName('CONTA_ID').AsInteger     := StrToInt(Conta_Id.Text);
              QRel.ParamByName('TRANSACAO_ID').AsInteger := ID;


              QRel.Prepare;
              QRel.ExecSql;


              QRel.Sql.Clear;
              QRel.Sql.Add('UPDATE TRANSPARCELAS SET ESPECIE = :ESPECIE, VALOR = :VALOR,VALOR_ORI = :VALOR_ORI, DT_VENC_ORI = :DT_VENC_ORI,');
              QRel.Sql.Add('VALOR_MULTA =:VALOR_MULTA, VALOR_JUROS =:VALOR_JUROS,DT_PAGAMENTO =:DT_PAGAMENTO');
              QRel.Sql.Add('WHERE');
              QRel.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
              QRel.Sql.Add('AND (PARCELA_ID = :PARCELA_ID)');


              QRel.ParamByName('ESPECIE').AsString       := 'RESTANTE';
              QRel.ParamByName('TRANSACAO_ID').AsInteger := DBGrid1.DataSource.DataSet.FieldByName('TRANSACAO_ID').AsInteger;
              QRel.ParamByName('PARCELA_ID').AsString    := DBGrid1.DataSource.DataSet.FieldByName('PARCELA_ID').AsString;
              QRel.ParamByName('VALOR').AsFloat          := 0;
              QRel.ParamByName('VALOR_ORI').AsFloat      := DBGrid1.DataSource.DataSet.FieldByName('VALOR').AsFloat;
              QRel.ParamByName('DT_VENC_ORI').AsDate     := DBGrid1.DataSource.DataSet.FieldByName('DT_VENCIMENTO').AsDateTime;
              QRel.ParamByName('VALOR_MULTA').AsFloat    := DBGrid1.DataSource.DataSet.FieldByName('VALOR_MULTA').AsFloat;
              QRel.ParamByName('VALOR_JUROS').AsFloat    := DBGrid1.DataSource.DataSet.FieldByName('JUROS').AsFloat;
              QRel.ParamByName('DT_PAGAMENTO').AsDate    := Date;


              QRel.Prepare;
              QRel.ExecSql;



            End;
          End;

          Valor_j    := Valor_j  - DBGrid1.DataSource.DataSet.FieldByName('VALOR_TOTAL').AsFloat;

         End
         Else }
         Begin 

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



         End;

          QRLabel18.Caption := QRLabel18.Caption + DBGrid1.DataSource.DataSet.FieldByName('DUPLICATA').AsString + ' ref. parc. ' + DBGrid1.DataSource.DataSet.FieldByName('PARCELA_ID').AsString + ', ';

         QRel.Sql.Clear;
         QRel.Sql.Add('UPDATE CLIENTES SET DT_ATUALIZACAO = :DATE');
         QRel.Sql.Add('WHERE');
         QRel.Sql.Add('(CLIENTE_ID = :CLIENTE_ID)');

         QRel.ParamByName('DATE').AsDateTime      := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
         QRel.ParamByName('Cliente_ID').AsInteger := DBGrid1.DataSource.DataSet.FieldByName('CLIENTE_ID').AsInteger;

         QRel.Prepare;
         QRel.ExecSql;


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
                       'COMPLEMENTO,    HORA,              PAGAMENTO, TIPO_VENDA) VALUES(' +
                       ':DT_TRANS,      :DT_MOVIMENTO,     :CONDUTA, ' +
                       ':EMPRESA_ID,    :CLIENTE_ID,       :BANCO_ID, ' +
                       ':NUM_DOC,       :SERIE,            :FLUXO_CAIXA_ID, ' +
                       ':SAIDA_ID,      :PARCELA_ID,       :VALOR_PARCELA, ' +
                       ':VALOR,         :BALANCO,          :TPCTB, ' +
                       ':AUTORIZ_ID,    :HISTORICO,        :CONTA_ID, ' +
                       ':COMPLEMENTO,   :HORA,             :PAGAMENTO, :TIPO_VENDA)');

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
          QRel.ParamByName('VALOR_PARCELA').AsFloat    := DBGrid1.DataSource.DataSet.FieldByName('VALOR_TOTAL').AsFloat;
          QRel.ParamByName('VALOR').AsFloat            := (DBGrid1.DataSource.DataSet.FieldByName('VALOR_TOTAL').AsFloat + ((DBGrid1.DataSource.DataSet.FieldByName('VALOR_TOTAL').AsFloat * Percentual) / 100));
          QRel.ParamByName('BALANCO').AsString         := 'LIBERADO';
          QRel.ParamByName('TPCTB').AsString           := FrmData.QAcesso.FieldByName('TPCTB').AsString;
          QRel.ParamByName('AUTORIZ_ID').AsInteger     := FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger;
          QRel.ParamByName('HISTORICO').AsString       := DBGrid1.DataSource.DataSet.FieldByName('HISTORICO').AsString;
          QRel.ParamByName('CONTA_ID').AsInteger       := StrToInt(Conta_id.Text) ;//FrmPrincipal.Config.FieldByName('CONTA_JUROS').AsInteger;
          QRel.ParamByName('HORA').AsString            := TimeToStr(time); //Copy(DBGrid1.DataSource.DataSet.FieldByName('DT_VENCIMENTO').AsString,4,3) + Copy(DBGrid1.DataSource.DataSet.FieldByName('DT_VENCIMENTO').AsString,1,3) + Copy(DBGrid1.DataSource.DataSet.FieldByName('DT_VENCIMENTO').AsString,9,2);
          QRel.ParamByName('PAGAMENTO').AsString       := QFinalizadora.FieldByName('LEGENDA').AsString;
          QRel.ParamByName('COMPLEMENTO').AsString     := 'Doc: ' + DBGrid1.DataSource.DataSet.FieldByName('NUM_DOC').AsString + ' - Venc.: ' + DBGrid1.DataSource.DataSet.FieldByName('DT_VENCIMENTO').AsString;
          QRel.ParamByName('TIPO_VENDA').AsString      :='PAGTO CARTAO';

          QRel.Prepare;
          QRel.ExecSql;



          QRLabel18.Caption := QRLabel18.Caption + DBGrid1.DataSource.DataSet.FieldByName('DUPLICATA').AsString + ' ref. parc. ' + DBGrid1.DataSource.DataSet.FieldByName('PARCELA_ID').AsString + ', ';

          QRel.Sql.Clear;
          QRel.Sql.Add('UPDATE CLIENTES SET DT_ATUALIZACAO = :DATE');
          QRel.Sql.Add('WHERE');
          QRel.Sql.Add('(CLIENTE_ID = :CLIENTE_ID)');

          QRel.ParamByName('DATE').AsDateTime      := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
          QRel.ParamByName('Cliente_ID').AsInteger := DBGrid1.DataSource.DataSet.FieldByName('CLIENTE_ID').AsInteger;

          QRel.Prepare;
          QRel.ExecSql;


      end;
    end
    else
    begin
      if DBGrid1.SelectedRows.CurrentRowSelected = True then
      begin
         if  LeIni(Arq_Ini, 'Sistema', 'Histórico Recebimento por Lote') = 'True' Then
         if (Application.MessageBox('Deseja inserir detalhe para este recebimento?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = IDYES) then
         InputString := InputBox('Histórico do Recebimento', 'Histórico:', '')
         else
         InputString := '';

         if (FrmPrincipal.QEmpresa.FieldByName('CNPJ').AsString = '05.835.195/0001-03') and
           (DBGrid1.DataSource.DataSet.FieldByName('DUPLICATA').AsString = 'MENSALIDADE') then
          bEGIN
           AtualizarHelpDesk(SemMascara(QCliente.FieldByName('cnpj').AsString),'NÃO',FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsString);
          {
          Vencimento_Help := DateToStr(DBGrid1.DataSource.DataSet.FieldByName('DT_VENCIMENTO').AsDateTime);
          Funcionario     := FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsString;

          if AtualizarPagamento(SemMascara(QCliente.FieldByName('cnpj').AsString),Copy(vencimento_help,4,2),Copy(vencimento_help,7,4),Copy(vencimento_help,1,2),DateToStr(date),Funcionario,valor_help,0) then
          Application.MessageBox('Pagamento atualizado no Help Desk!', PChar(Msg_Title), mb_IconInformation)
          Else
            Begin
            Application.MessageBox('Pagamento não atualizado no Help Desk favor verificar!', PChar(Msg_Title), mb_IconInformation);
            Abort;
            End; }
          end;

         if copy (DBGrid1.DataSource.DataSet.FieldByName('HISTORICO').AsString,1,11) ='Agrupamento' Then
         Begin
           QSearch.SQL.Clear;
           QSearch.SQL.Add('SELECT DUPLICATA FROM TRANSPARCELAS WHERE AGRUPAMENTO =:TRANSACAO_ID');
           QSearch.ParamByName('TRANSACAO_ID').AsInteger :=  DBGrid1.DataSource.DataSet.FieldByName('TRANSACAO_ID').AsInteger;
           QSearch.Prepare;
           QSearch.Open;
           QSearch.First;

           while not QSearch.Eof do
           begin
           h_Agrupado := h_Agrupado + QSearch.FieldByName('DUPLICATA').AsString + '-' ;
           Application.ProcessMessages;
           QSearch.Next;
           end;
         End;



        QRel.Sql.Clear;
        QRel.Sql.Add('INSERT INTO TRANSACOES(' +
                     'DT_TRANS,       DT_MOVIMENTO,      CONDUTA, ' +
                     'EMPRESA_ID,     CLIENTE_ID,        BANCO_ID, ' +
                     'NUM_DOC,        SERIE,             FLUXO_CAIXA_ID, ' +
                     'SAIDA_ID,       PARCELA_ID,        VALOR_PARCELA, ' +
                     'VALOR,          BALANCO,           TPCTB, ' +
                     'AUTORIZ_ID,     HISTORICO,         HORA, PAGAMENTO,COMPLEMENTO,SUB_CODIGO,TIPO_VENDA) VALUES(' +
                     ':DT_TRANS,      :DT_MOVIMENTO,     :CONDUTA, ' +
                     ':EMPRESA_ID,    :CLIENTE_ID,       :BANCO_ID, ' +
                     ':NUM_DOC,       :SERIE,            :FLUXO_CAIXA_ID, ' +
                     ':SAIDA_ID,      :PARCELA_ID,       :VALOR_PARCELA, ' +
                     ':VALOR,         :BALANCO,          :TPCTB, ' +
                     ':AUTORIZ_ID,    :HISTORICO,        :HORA,  :PAGAMENTO, :COMPLEMENTO,:SUB_CODIGO,:TIPO_VENDA)');

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
        QRel.ParamByName('VALOR').AsFloat            := DBGrid1.DataSource.DataSet.FieldByName('VALOR_TOTAL').AsFloat;
        QRel.ParamByName('BALANCO').AsString         := 'LIBERADO';
        QRel.ParamByName('TPCTB').AsString           := FrmData.QAcesso.FieldByName('TPCTB').AsString;
        QRel.ParamByName('AUTORIZ_ID').AsInteger     := FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger;

        if copy (DBGrid1.DataSource.DataSet.FieldByName('HISTORICO').AsString,1,11) ='Agrupamento' Then
          QRel.ParamByName('HISTORICO').AsString    := 'Notas Agrup.: ' + h_Agrupado + InputString
        else
          QRel.ParamByName('HISTORICO').AsString    := DBGrid1.DataSource.DataSet.FieldByName('HISTORICO').AsString + ' Parcela: ' + DBGrid1.DataSource.DataSet.FieldByName('PARCELA_ID').AsString + '-' + InputString ;


        QRel.ParamByName('HORA').AsString            := TimeToStr(time); //Copy(DBGrid1.DataSource.DataSet.FieldByName('DT_VENCIMENTO').AsString,4,3) + Copy(DBGrid1.DataSource.DataSet.FieldByName('DT_VENCIMENTO').AsString,1,3) + Copy(DBGrid1.DataSource.DataSet.FieldByName('DT_VENCIMENTO').AsString,9,2);
        QRel.ParamByName('PAGAMENTO').AsString       := QFinalizadora.FieldByName('LEGENDA').AsString;
        QRel.ParamByName('COMPLEMENTO').AsString     := 'Doc: ' + DBGrid1.DataSource.DataSet.FieldByName('NUM_DOC').AsString + ' - Venc.: ' + DBGrid1.DataSource.DataSet.FieldByName('DT_VENCIMENTO').AsString;
        QRel.ParamByName('SUB_CODIGO').AsString      := DBGrid1.DataSource.DataSet.FieldByName('DUPLICATA').AsString;
        QRel.ParamByName('TIPO_VENDA').AsString      := 'PAGTO CARTAO';

        QRel.Prepare;
        QRel.ExecSql;


          QRel.Sql.Clear;
          QRel.Sql.Add('UPDATE TRANSPARCELAS SET  VALOR_ORI = :VALOR_ORI, DT_VENC_ORI = :DT_VENC_ORI, DT_PAGAMENTO =:DT_PAGAMENTO');
          QRel.Sql.Add('WHERE');
          QRel.Sql.Add('(TRANSACAO_ID   = :TRANSACAO_ID)');
          QRel.Sql.Add('AND (PARCELA_ID = :PARCELA_ID)');


          QRel.ParamByName('TRANSACAO_ID').AsInteger := DBGrid1.DataSource.DataSet.FieldByName('TRANSACAO_ID').AsInteger;
          QRel.ParamByName('PARCELA_ID').AsString    := DBGrid1.DataSource.DataSet.FieldByName('PARCELA_ID').AsString;
          QRel.ParamByName('VALOR_ORI').AsFloat      := DBGrid1.DataSource.DataSet.FieldByName('VALOR').AsFloat;
          QRel.ParamByName('DT_VENC_ORI').AsDate     := DBGrid1.DataSource.DataSet.FieldByName('DT_VENCIMENTO').AsDateTime;
         // QRel.ParamByName('VALOR_JUROS').AsFloat    := DBGrid1.DataSource.DataSet.FieldByName('JUROS').AsFloat;
          QRel.ParamByName('DT_PAGAMENTO').AsDate    := Date;

          QRel.Prepare;
          QRel.ExecSql;



         // End;

        Individual := Individual + DBGrid1.DataSource.DataSet.FieldByName('VALOR_TOTAL').AsFloat;

        QRLabel18.Caption := QRLabel18.Caption + DBGrid1.DataSource.DataSet.FieldByName('DUPLICATA').AsString + ' ref. parc. ' + DBGrid1.DataSource.DataSet.FieldByName('PARCELA_ID').AsString + ', ';

        QRel.Sql.Clear;
        QRel.Sql.Add('UPDATE CLIENTES SET DT_ATUALIZACAO = :DATE');
        QRel.Sql.Add('WHERE');
        QRel.Sql.Add('(CLIENTE_ID = :CLIENTE_ID)');

        QRel.ParamByName('DATE').AsDateTime      := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
        QRel.ParamByName('Cliente_ID').AsInteger := DBGrid1.DataSource.DataSet.FieldByName('CLIENTE_ID').AsInteger;

        QRel.Prepare;
        QRel.ExecSql;




      end;
    end;
    Application.ProcessMessages;

    DBGrid1.DataSource.DataSet.Next;
  end;

  if Individual = 0  then
  Begin
  Application.MessageBox('Selecione um valor para quitação por favor.', PChar(Msg_Title), mb_IconInformation);
  Exit;
  End;


  QContas.Close;
  QContas.Open;

  Seleciona;

  Fdac_Temp.First;

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


  Vr_Quitar.Value := 0;

end;

procedure TFrmTrans_Recebimento_Lote_Cartao.btnCaixaClick(Sender: TObject);
begin
  try
    Caixa.Value := GetConsulta('BANCOS', 0, 0, StrToInt(Caixa.Text));
  except
    Caixa.Value := GetConsulta('BANCOS', 0, 0, 0);
  end;
end;

procedure TFrmTrans_Recebimento_Lote_Cartao.btnClienteClick(Sender: TObject);
begin

  try
    Cliente.Value := GetConsulta('CLIENTES', 0, 0, StrToInt(Cliente.Text));
  except
    Cliente.Value := GetConsulta('CLIENTES', 0, 0, 0);
  end;

  Seleciona;

  QFinalizadora.Close;
  QFinalizadora.SQL.Clear;
  QFinalizadora.Sql.Add('SELECT * FROM FINALIZADORAS WHERE (TIPO_TRANSACAO = 1) OR (TIPO_TRANSACAO = 3) ');
  QFinalizadora.Prepare;
  QFinalizadora.Open;

  Finalizadora_id.KeyValue := 1;
  Finalizadora_id.Enabled  := True;


end;

procedure TFrmTrans_Recebimento_Lote_Cartao.btnContaClick(Sender: TObject);
begin
  try
    CONTA_ID.Value := GetConsulta('PLANO', 0, 0, StrToInt(CONTA_ID.Text));
  except
    CONTA_ID.Value := GetConsulta('PLANO', 0, 0, 0);
  end;

end;

procedure TFrmTrans_Recebimento_Lote_Cartao.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmTrans_Recebimento_Lote_Cartao.btnSomaClick(Sender: TObject);

begin
  Vr_Soma.Value     := 0;
  Vr_Despesas.Value := 0;
  Vr_Total.Value    := 0;
  Vr_TX_ADM.Value    := 0;
  Dias.Value        := 0;
  Vr_Multa.Value    := 0;   

  DBGrid1.DataSource.DataSet.First;
  while not DBGrid1.DataSource.DataSet.Eof do
  begin
    if DBGrid1.SelectedRows.CurrentRowSelected = True then
    begin
      Vr_Soma.Value     := (Vr_Soma.Value + DBGrid1.DataSource.DataSet.FieldByName('VALOR').AsFloat);
     // Vr_Despesas.Value := (Vr_Despesas.Value + DBGrid1.DataSource.DataSet.FieldByName('VALOR_DESPESAS').AsFloat);

      //if (FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime > (DBGrid1.DataSource.DataSet.FieldByName('DT_VENCIMENTO').AsDateTime + FrmPrincipal.Config.FieldByName('CARENCIA').AsInteger)) and (FrmPrincipal.Config.FieldByName('JUROS_MENSAL').AsFloat > 0)  then
      //begin
      //  Dif    := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime - (DBGrid1.DataSource.DataSet.FieldByName('DT_VENCIMENTO').AsDateTime + FrmPrincipal.Config.FieldByName('CARENCIA').AsInteger);
        Correc := ((((DBGrid1.DataSource.DataSet.FieldByName('VALOR').AsFloat * DBGrid1.DataSource.DataSet.FieldByName('TX_ADM').AsFloat) / 100)));
        Correc := RoundTo(Correc, -2);
        Vr_TX_ADM.Value := Correc + Vr_TX_ADM.Value;

    {
      if (FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime > DBGrid1.DataSource.DataSet.FieldByName('DT_VENCIMENTO').AsDateTime) AND (DBGrid1.DataSource.DataSet.FieldByName('ESPECIE').AsString <> 'RESTANTE')
          and (FrmPrincipal.Config.FieldByName('MULTA').AsFloat > 0) then
      Begin
      Multa  := ((DBGrid1.DataSource.DataSet.FieldByName('VALOR').AsFloat * FrmPrincipal.Config.FieldByName('MULTA').AsFloat) / 100);
      Multa  := RoundTo(Multa, -2);
      Vr_Multa.Value := Multa + Vr_Multa.Value;
      Label15.Visible :=  True;
      Vr_Multa.Visible := True
      End;
     }
    end;

    Application.ProcessMessages;
    DBGrid1.DataSource.DataSet.Next;
  end;

  Vr_Total.Value := (Vr_Soma.Value - Vr_TX_ADM.Value );

  DBGrid1.DataSource.DataSet.First;
end;

procedure TFrmTrans_Recebimento_Lote_Cartao.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  OldBkMode: Integer;
begin
  if Fdac_Temp.FieldByName('DT_VENCIMENTO').AsDatetime > Date then
    TDBGrid(Sender).Canvas.Font.Color := clGreen

  else if  Fdac_Temp.FieldByName('DT_VENCIMENTO').AsDateTime < Date then
   Begin
    if Fdac_Temp.FieldByName('PERDA').Asinteger = 1 then
    TDBGrid(Sender).Canvas.Font.Color := clBlack
    Else
    TDBGrid(Sender).Canvas.Font.Color := clRed;
   End

  Else if Fdac_Temp.FieldByName('DT_VENCIMENTO').AsDateTime = Date then
    TDBGrid(Sender).Canvas.Font.Color := clBlue;



if gdSelected in State then
  begin
    with (Sender as TDBGrid).Canvas do
    begin
      if  TDBGrid(Sender).Canvas.Font.Color = clRed Then
      Brush.Color := clAqua //$004080FF
      else if TDBGrid(Sender).Canvas.Font.Color = clBlue Then
      Brush.Color := clYellow //$004080FF
      Else if TDBGrid(Sender).Canvas.Font.Color = clGreen Then
      Brush.Color := clYellow //$004080FF
      Else if TDBGrid(Sender).Canvas.Font.Color = clBlack  Then
       Brush.Color := clWhite //$004080FF
      else
        Brush.Color := $004080FF;
      FillRect(Rect);
      Font.Style := [fsBold];
    end;
  end;
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

procedure TFrmTrans_Recebimento_Lote_Cartao.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
Inputstring,H_Agrupar :string;

begin
 if (key = VK_F6)and (not Fdac_Temp.IsEmpty) and (Copy(Fdac_Temp.FieldByName('HISTORICO').AsString,1,11) <> 'Agrupamento') then
 begin

   if (Fdac_Temp.FieldByName('CLIENTE_ID').AsInteger = StrToInt(cliente.Text))  then
   Begin
   if not Table_Temp_Agrupar.Locate('TRANSACAO_ID;PARCELA_ID', VarArrayOf([Fdac_Temp.FieldByName('TRANSACAO_ID').AsInteger, Fdac_Temp.FieldByName('PARCELA_ID').AsString]), [loCaseInsensitive]) then
    Begin
     Memo1.Visible      := True;
     StatusBar1.Visible := True;
     Cria_Dados_Temporarios_Agrupar;
     Application.ProcessMessages;
     Fdac_Temp.Next;
    End;
   End
   else
    Application.MessageBox('Necessario informar um único cliente para efetuar o agrupamento.','Eficaz', MB_IconInformation + MB_OK);
 end;

 if (key = VK_F6)and (not Fdac_Temp.IsEmpty) and (Copy(Fdac_Temp.FieldByName('HISTORICO').AsString,1,11) = 'Agrupamento') then
 begin
  if (Application.MessageBox('Confirma a exclusão do  agrupamento selecionado?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton1) = IDYES) then
     Begin
         TRY

          QRel.Sql.Clear;
          QRel.Sql.Add('UPDATE TRANSPARCELAS SET AGRUPAMENTO = 0,');
          QRel.Sql.Add('VALOR_DESPESAS =:VALOR_DESPESAS,VALOR_JUROS =:VALOR_JUROS, VALOR_ORI =:VALOR_ORI, DT_VENC_ORI = :DT_VENC_ORI,VALOR_MULTA =:VALOR_MULTA');
          QRel.Sql.Add('WHERE');
          QRel.Sql.Add('(AGRUPAMENTO = :AGRUPAMENTO)');


          QRel.ParamByName('AGRUPAMENTO').AsInteger   := Fdac_Temp.FieldByName('TRANSACAO_ID').AsInteger;
          QRel.ParamByName('VALOR_DESPESAS').AsFloat  := 0;
          QRel.ParamByName('VALOR_JUROS').AsFloat     := 0;
          QRel.ParamByName('VALOR_ORI').AsFloat       := 0;
          QRel.ParamByName('VALOR_MULTA').AsFloat     := 0;
          QRel.ParamByName('DT_VENC_ORI').AsDateTime  := Date;

          QRel.Prepare;
          QRel.ExecSql;




          QRel.SQL.Clear;
          QRel.SQL.Add('DELETE FROM TRANSACOES WHERE TRANSACAO_ID = :TRANSACAO_ID');
          QRel.ParamByName('TRANSACAO_ID').AsInteger := Fdac_Temp.FieldByName('TRANSACAO_ID').AsInteger;

          QRel.Prepare;
          QRel.ExecSql;





          Application.ProcessMessages;


           Seleciona;
         FINALLY

         Application.MessageBox('Agrupamento excluído com sucesso.','Eficaz', MB_IconInformation + MB_OK);

         END;

     End;
 end;


 if (key = VK_F7)and (not Fdac_Temp.IsEmpty) then
 begin

   Table_Temp_Agrupar.Free;
   Table_Temp_Agrupar := TFDMemTable.Create(nil);

  with Table_Temp_Agrupar do
  begin
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
      Add('PERDA', ftInteger, 0, False);

    end;

    with IndexDefs do
    begin
      Clear;
      Add('', 'ACESSO', [ixPrimary, ixUnique]);
      Add('TEMP', 'NOME;DT_VENCIMENTO', [ixCaseInsensitive]);
    end;

   // CreateTable;
    IndexName := 'TEMP';
    Open;
  end;

    Memo1.Lines.Clear;
    Memo1.Visible      := False;
    StatusBar1.Visible := False;

    Application.MessageBox('Agrupamento excuído com sucesso','Eficaz', MB_IconInformation + MB_OK);
 end;


 if (key = VK_F10) then
 begin
    if (not Table_Temp_Agrupar.IsEmpty) then
    Begin
     if (Application.MessageBox('Confirma o agrupamento das contas selecionadas?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton1) = IDYES) then
     Begin

        if (Application.MessageBox('O agrupamento e referente a notas emitidas?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton1) = IDYES) then
        Begin
          H_Agrupar := 'Agrupamento de Faturamento';
        End
        Else
          H_Agrupar := 'Agrupamento de Renegociação';


        if (Application.MessageBox(Pchar('Deseja alterar o valor agrupado de R$' + FormatFloat('#,##0.00', soma_agrupar) + '?'), PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton1) = IDYES) then
        Begin
          InputString := InputBox('Digite o novo valor', 'Valor Negociado:', FloatToStr(soma_agrupar));

          If Inputstring = '' then
          Inputstring := FloatToStr(soma_agrupar)

        End
        Else
        Inputstring := FloatToStr(soma_agrupar);

        try
        soma_agrupar := StrToFloat(Inputstring);
        except
         Application.MessageBox('Favor inserir um valor válido.', PChar(Msg_Title), mb_IconSTop);
         Abort;
        end;

              IQuery.SQL.Clear;
              IQuery.SQL.Add('SELECT NEXTVAL(:GEN_TRANSACOES) ID');
              IQuery.ParamByName('GEN_TRANSACOES').AsString :=  'GEN_TRANSACOES';

              IQuery.Prepare;
              IQuery.Open;

              Id_Trans := IQuery.FieldByName('ID').AsInteger;


      QRel.Sql.Clear;
      QRel.Sql.Add('INSERT INTO TRANSACOES( ' +
                   'TRANSACAO_ID,  DT_TRANS,    DT_MOVIMENTO,  CONDUTA, ' +
                   'DEPTO,         EMPRESA_ID,  CONTA_ID,      C_CUSTO_ID, ' +
                   'VALOR,         TPCTB,       AUTORIZ_ID,    HISTORICO, ' +
                   'CONTAAUX_ID,   NUM_DOC,     BANCO_ID,      BALANCO, ' +
                   'COND_PAGTO,    CLIENTE_ID) VALUES(' +
                   ':TRANSACAO_ID, :DT_TRANS,   :DT_MOVIMENTO, :CONDUTA, ' +
                   ':DEPTO,        :EMPRESA_ID, :CONTA_ID,     :C_CUSTO_ID, ' +
                   ':VALOR,        :TPCTB,      :AUTORIZ_ID,   :HISTORICO, ' +
                   ':CONTAAUX_ID,  :NUM_DOC,    :BANCO_ID,     :BALANCO, ' +
                   ':COND_PAGTO,   :CLIENTE_ID)');

      QRel.ParamByName('TRANSACAO_ID').AsInteger  := Id_Trans;
      QRel.ParamByName('DT_TRANS').AsDateTime     := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
      QRel.ParamByName('DT_MOVIMENTO').AsDateTime := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
      QRel.ParamByName('CONDUTA').AsString        := '01';
      QRel.ParamByName('DEPTO').AsString          := '03';
      QRel.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
      QRel.ParamByName('CONTA_ID').AsInteger      := 0;
      QRel.ParamByName('C_CUSTO_ID').AsInteger    := 1;
      QRel.ParamByName('VALOR').AsFloat           := soma_agrupar;
      QRel.ParamByName('TPCTB').AsString          := '2';
      QRel.ParamByName('AUTORIZ_ID').AsInteger    := 0;
      QRel.ParamByName('HISTORICO').AsString      := H_Agrupar;
      QRel.ParamByName('CONTAAUX_ID').AsInteger   := 0;
      QRel.ParamByName('NUM_DOC').AsString        := '0000000';
      QRel.ParamByName('BANCO_ID').AsInteger      := 0;
      QRel.ParamByName('BALANCO').AsString        := 'AGRUPADO';
      QRel.ParamByName('COND_PAGTO').AsString     := 'A PRAZO';
      QRel.ParamByName('CLIENTE_ID').AsInteger    := StrToInt(Cliente.Text);

      QRel.Prepare;
      QRel.ExecSql;



      if soma_agrupar > 0 then
      begin

          Divisao_Parcelas(Id_Trans, 'T','', True,FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime, soma_agrupar);

      end
      else
        Application.MessageBox('Valor não pode ser igual a 0', PChar(Msg_Title), mb_IconSTop);


        Table_Temp_Agrupar.First;
        while not Table_Temp_Agrupar.Eof do
        begin


          QRel.Sql.Clear;
          QRel.Sql.Add('UPDATE TRANSPARCELAS SET AGRUPAMENTO = :AGRUPAMENTO,');
          QRel.Sql.Add('VALOR_DESPESAS =:VALOR_DESPESAS,VALOR_JUROS =:VALOR_JUROS, VALOR_ORI =:VALOR_ORI, DT_VENC_ORI = :DT_VENC_ORI,VALOR_MULTA =:VALOR_MULTA');
          QRel.Sql.Add('WHERE');
          QRel.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
          QRel.Sql.Add('AND (PARCELA_ID = :PARCELA_ID)');

          QRel.ParamByName('AGRUPAMENTO').AsInteger   := Id_Trans;
          QRel.ParamByName('TRANSACAO_ID').AsInteger  := Table_Temp_Agrupar.FieldByName('TRANSACAO_ID').AsInteger;
          QRel.ParamByName('PARCELA_ID').AsString     := Table_Temp_Agrupar.FieldByName('PARCELA_ID').AsString;
          QRel.ParamByName('VALOR_DESPESAS').AsFloat  := Table_Temp_Agrupar.FieldByName('VALOR_DESPESAS').AsFloat;
          QRel.ParamByName('VALOR_JUROS').AsFloat     := Table_Temp_Agrupar.FieldByName('JUROS').AsFloat;
          QRel.ParamByName('VALOR_ORI').AsFloat       := Table_Temp_Agrupar.FieldByName('VALOR_TOTAL').AsFloat;
          QRel.ParamByName('VALOR_MULTA').AsFloat     := Table_Temp_Agrupar.FieldByName('VALOR_MULTA').AsFloat;
          QRel.ParamByName('DT_VENC_ORI').AsDateTime  := Date;

          QRel.Prepare;
          QRel.ExecSql;



          Application.ProcessMessages;

          Table_Temp_Agrupar.Next;

        end;
       Memo1.Visible      := False;
       StatusBar1.Visible := False;
       Seleciona;

      Application.MessageBox('Agrupamento efetuado com sucesso.','Eficaz', MB_IconInformation + MB_OK);
     End
    End
    else
    Application.MessageBox('Não existem contas para agrupamento.','Eficaz', MB_IconInformation + MB_OK);
 end;

  if (Key = VK_F3) and (not QContas.IsEmpty) then
  begin

    Prorroga(DBGrid1.DataSource.DataSet.FieldByName('TRANSACAO_ID').AsInteger, DBGrid1.DataSource.DataSet.FieldByName('PARCELA_ID').AsString, DBGrid1.DataSource.DataSet.FieldByName('TIPO_TRANSACAO').AsString,'R');
    Seleciona;
  end;

  if (Key = VK_F4) and (not QContas.IsEmpty) then
  begin

    If (DBGrid1.DataSource.DataSet.FieldByName('PERDA').AsInteger <> 1) AND
      ( Date - DBGrid1.DataSource.DataSet.FieldByName('DT_VENCIMENTO').AsDateTime  >= 365  ) Then
    Begin
     if Application.MessageBox('Deseja marcar este recebimento como perda?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = IDYES then
     Begin
      QRel.Sql.Clear;
      QRel.Sql.add('UPDATE TRANSPARCELAS SET PERDA = 1 ,ESPECIE = :ESPECIE WHERE TRANSACAO_ID = :TRANSACAO_ID');
      QRel.Sql.add('AND PARCELA_ID = :PARCELA_ID');

      QRel.ParamByName('TRANSACAO_ID').ASInteger := DBGrid1.DataSource.DataSet.FieldByName('TRANSACAO_ID').AsInteger;
      QRel.ParamByName('PARCELA_ID').AsString    := DBGrid1.DataSource.DataSet.FieldByName('PARCELA_ID').AsString;
      QRel.ParamByName('ESPECIE').AsString       := 'PERDA';

      QRel.Prepare;
      QRel.ExecSQL;



      Seleciona;

     End;
    end
    Else
    if ( Date - DBGrid1.DataSource.DataSet.FieldByName('DT_VENCIMENTO').AsDateTime   < 365 ) and (DBGrid1.DataSource.DataSet.FieldByName('PERDA').AsInteger <> 1) Then
    Application.MessageBox('Conta recebimento possui menos de 1 ano de vencido!' + #13 + 'Não é possível ser marcada como perda.','Eficaz', MB_IconInformation + MB_OK);
  end;

  if (Key = VK_F5) and (not QContas.IsEmpty) then
  begin
   If DBGrid1.DataSource.DataSet.FieldByName('PERDA').AsInteger = 1 Then
   Begin
     if Application.MessageBox('Deseja Reativar esta conta?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = IDYES then
     Begin
      QRel.Sql.Clear;
      QRel.Sql.add('UPDATE TRANSPARCELAS SET PERDA = 0 ,ESPECIE = :ESPECIE WHERE TRANSACAO_ID = :TRANSACAO_ID');
      QRel.Sql.add('AND PARCELA_ID = :PARCELA_ID');

      QRel.ParamByName('TRANSACAO_ID').ASInteger := DBGrid1.DataSource.DataSet.FieldByName('TRANSACAO_ID').AsInteger;
      QRel.ParamByName('PARCELA_ID').AsString    := DBGrid1.DataSource.DataSet.FieldByName('PARCELA_ID').AsString;
      QRel.ParamByName('ESPECIE').AsString       := '';

      QRel.Prepare;
      QRel.ExecSQL;



      Seleciona;
     End;
   End;
  end;

  if Key = VK_F9 then
    Perform(Wm_NextDlgCtl, 0, 0);

  if Key = VK_Return then
  begin
    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT *');
    QRel.Sql.Add('FROM TRANSPARCELAS');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(AGRUPAMENTO = :AGRUPAMENTO)');
    QRel.Sql.Add('ORDER BY DT_VENCIMENTO');

    QRel.ParamByName('AGRUPAMENTO').AsInteger := Fdac_Temp.FieldByName('TRANSACAO_ID').AsInteger;



    QRel.Prepare;
    QRel.Open;

    TFloatField(QRel.FieldByName('VALOR')).DisplayFormat       := '#,##0.00';
    TFloatField(QRel.FieldByName('VALOR_JUROS')).DisplayFormat := '#,##0.00';
    TFloatField(QRel.FieldByName('VALOR_MULTA')).DisplayFormat := '#,##0.00';
    TFloatField(QRel.FieldByName('VALOR_ORI')).DisplayFormat   := '#,##0.00';


    if not QRel.IsEmpty then
    begin
      Application.CreateForm(TFrmAgrupamento_Recebimento, FrmAgrupamento_Recebimento);
      try
        FrmAgrupamento_Recebimento.ShowModal;
      finally
        FrmAgrupamento_Recebimento.Release;
      end;
    end
    else
      Application.MessageBox('Não há agrupamento para este lançamento', PChar(Msg_Title), mb_IconInformation);
  end;
end;

procedure TFrmTrans_Recebimento_Lote_Cartao.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmTrans_Recebimento_Lote_Cartao.DtmenExit(Sender: TObject);
begin
  Dtmai.Date    := Ult_Dia_Mes(Dtmen.Date);
  Dtmai.MinDate := Dtmen.Date;
end;

procedure TFrmTrans_Recebimento_Lote_Cartao.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
  //  Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmTrans_Recebimento_Lote_Cartao.Fdac_TempAfterOpen(DataSet: TDataSet);
begin
  TFloatField(Fdac_Temp.FieldByName('VALOR')).DisplayFormat       := '#,##0.00';
  TFloatField(Fdac_Temp.FieldByName('JUROS')).DisplayFormat       := '#,##0.00';
  TFloatField(Fdac_Temp.FieldByName('VALOR_TOTAL')).DisplayFormat := '#,##0.00';
  TFloatField(Fdac_Temp.FieldByName('VALOR_MULTA')).DisplayFormat := '#,##0.00';

  DBGrid1.Columns[0].Width := 266;
  DBGrid1.Columns[1].Width := 340;
  DBGrid1.Columns[2].Width := 90;
  DBGrid1.Columns[3].Width := 87;
  DBGrid1.Columns[4].Width := 56;
  DBGrid1.Columns[5].Width := 80;
  DBGrid1.Columns[6].Width := 65;
  DBGrid1.Columns[8].Width := 65;
  DBGrid1.Columns[9].Width := 65;
  DBGrid1.Columns[9].Width := 65;
end;

procedure TFrmTrans_Recebimento_Lote_Cartao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmTrans_Recebimento_Lote_Cartao.FormCreate(Sender: TObject);
var
Temp_Name: String;
begin
   { TRY
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
      Add('DT_VENCIMENTO', ftDate, 0, False);
      Add('BANCO_ID', ftInteger, 0, False);
      Add('VALOR', ftFloat, 0, False);
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
      Add('PERDA', ftInteger, 0, False);

    end;

    with Fdac_Temp.IndexDefs do
    begin
      Clear;
      Add('', 'ACESSO', [ixPrimary, ixUnique]);
      Add('TEMP', 'NOME;DT_VENCIMENTO', [ixCaseInsensitive]);
    end;
    Fdac_Temp.IndexName := 'TEMP';
    Fdac_Temp.Open;

    except on E: Exception do
     ShowMessage( E.Message );
  end;



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
      Add('PERDA', ftInteger, 0, False);

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
  end; }

  Dtmen.Date    := StrToDate('01/01/1900');
  Dtmai.Date    := StrToDate('01/01/2050'); // FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
  Dtmai.MinDate := Dtmen.Date;
  Caixa.Text    := LeIni(Arq_Ini, 'Sistema', 'Caixa');
end;

procedure TFrmTrans_Recebimento_Lote_Cartao.FormDestroy(Sender: TObject);
begin
  {Fdac_Temp.IndexName := '';
  Fdac_Temp.Close;
  Fdac_Temp.DeleteTable;}

  Fdac_Temp.IndexName := '';
  Fdac_Temp.Close;
  Fdac_Temp.Free;
end;

procedure TFrmTrans_Recebimento_Lote_Cartao.QContasAfterOpen(DataSet: TDataSet);
begin
  {TFloatField(QContas.FieldByName('VALOR')).DisplayFormat          := '#,##0.00';
  TFloatField(QContas.FieldByName('VALOR_DESPESAS')).DisplayFormat := '#,##0.00';

  DBGrid1.Columns[0].Width := 266;
  DBGrid1.Columns[1].Width := 368;
  DBGrid1.Columns[2].Width := 90;
  DBGrid1.Columns[3].Width := 97;
  DBGrid1.Columns[4].Width := 56;
  DBGrid1.Columns[5].Width := 70;
  DBGrid1.Columns[6].Width := 90;
  DBGrid1.Columns[7].Width := 90;
  DBGrid1.Columns[8].Width := 90; }
end;

procedure TFrmTrans_Recebimento_Lote_Cartao.QOrcamentoAfterOpen(DataSet: TDataSet);
begin
  TFloatField(QOrcamento.FieldByName('VALOR')).DisplayFormat := '#,##0.00';
end;

procedure TFrmTrans_Recebimento_Lote_Cartao.chk_finalizadoraClick(Sender: TObject);
begin
 if  chk_finalizadora.Checked Then
 Begin
 QConsFinalizadora.Close;
//  QConsFinalizadora.SQL.Clear;
//  QConsFinalizadora.Sql.Add('SELECT * FROM FINALIZADORAS WHERE (TIPO_TRANSACAO = 1) OR (TIPO_TRANSACAO = 3) ');
  QConsFinalizadora.Prepare;
  QConsFinalizadora.Open;

  Finalizadora.KeyValue := 1;
  Finalizadora.Enabled  := True;
 End
 Else
 QConsFinalizadora.Close;


end;

procedure TFrmTrans_Recebimento_Lote_Cartao.Chk_PerdasClick(Sender: TObject);
begin
Seleciona;
end;

procedure TFrmTrans_Recebimento_Lote_Cartao.ClienteExit(Sender: TObject);
begin
  Seleciona;

  if Cliente.Value = 0 then
  Begin
  Vr_Quitar.Enabled := False;
  Finalizadora_id.Enabled  := False;
  end
  else
  Begin

  QFinalizadora.Close;
  QFinalizadora.SQL.Clear;
  QFinalizadora.Sql.Add('SELECT * FROM FINALIZADORAS WHERE (TIPO_TRANSACAO = 1) OR (TIPO_TRANSACAO = 3) ');
  QFinalizadora.Prepare;
  QFinalizadora.Open;

  Finalizadora_id.KeyValue := 1;
  Finalizadora_id.Enabled  := True;

  End;
  
end;

procedure TFrmTrans_Recebimento_Lote_Cartao.ClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = Cliente) then
    btnClienteClick(Self);

  if (Key = Vk_F7) and (Sender = Caixa) then
    btnCaixaClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmTrans_Recebimento_Lote_Cartao.Consulta_ValoresClick(Sender: TObject);
var
Vencimento:String;
begin
if DateToStr(DBGrid1.DataSource.DataSet.FieldByName('DT_VENC_ORI').AsDateTime) = '30/12/1899' then
Vencimento := 'Conta Original'
Else
Vencimento := DateToStr(DBGrid1.DataSource.DataSet.FieldByName('DT_VENC_ORI').AsDateTime);


MessageDlg(Pchar('Documento Número: ' + DBGrid1.DataSource.DataSet.FieldByName('DUPLICATA').AsString + #13 +
                                          'Valor Principal: ' + FloatToStr(DBGrid1.DataSource.DataSet.FieldByName('VALOR_ORI').AsFloat)  + #13 +
                                          'Vencimento Anterior: ' + Vencimento),mtinformation,[mbok],0);
end;

procedure TFrmTrans_Recebimento_Lote_Cartao.CONTA_IDExit(Sender: TObject);
begin

    QConta.Close;
    QConta.ParamByName('TABELA_ID').AsInteger := StrToInt(CONTA_ID.Text);
    QConta.Prepare;
    QConta.Open;

end;

procedure TFrmTrans_Recebimento_Lote_Cartao.CONTA_IDKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if (Key = Vk_F7) and (Sender = CONTA_ID) then
    btnContaClick(Self);

    if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

end.
