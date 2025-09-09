unit USolicitacao_compras;

interface


uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, rxCurrEdit, rxToolEdit, Buttons, DBCtrls,
  DB, IBCustomDataSet, IBQuery, QuickRpt, QRCtrls, RDprint, Printers,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmSolicitacao_Compras = class(TForm)
    Bevel1: TBevel;
    Orcamentos: TQuickRep;
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
    QRLabel10: TQRLabel;
    QRShape4: TQRShape;
    QRLabel7: TQRLabel;
    QRDBText1: TQRDBText;
    QRExpr2: TQRExpr;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRGroup1: TQRGroup;
    QRDBText9: TQRDBText;
    QRBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr6: TQRExpr;
    QRShape2: TQRShape;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRLabel9: TQRLabel;
    QRDBText10: TQRDBText;
    RDprint1: TRDprint;
    DataProduto: TDataSource;
    Label2: TLabel;
    Ordem: TComboBox;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    btnFornecedor: TSpeedButton;
    DBText1: TDBText;
    btnGrupo: TSpeedButton;
    DBText2: TDBText;
    btnSub_Tipo: TSpeedButton;
    DBText3: TDBText;
    btnLocalizacao: TSpeedButton;
    DBText4: TDBText;
    btnProd_Inicial: TSpeedButton;
    btnProd_final: TSpeedButton;
    Label7: TLabel;
    BtnTributacao: TSpeedButton;
    DBText5: TDBText;
    Fornecedor: TCurrencyEdit;
    Grupo: TCurrencyEdit;
    SubTipo: TCurrencyEdit;
    Localizacao: TCurrencyEdit;
    Prod_Inicial: TCurrencyEdit;
    Prod_Final: TCurrencyEdit;
    Tributacao: TCurrencyEdit;
    DataGrupo: TDataSource;
    DataFornecedor: TDataSource;
    DataSubtipo: TDataSource;
    DataTributos: TDataSource;
    DataLocalizacao: TDataSource;
    QGrupo: TFDQuery;
    QProduto_final: TFDQuery;
    QSubTipo: TFDQuery;
    QProduto_Inicial: TFDQuery;
    QRel: TFDQuery;
    QProduto: TFDQuery;
    QFornecedor: TFDQuery;
    QLocalizacao: TFDQuery;
    QTributos: TFDQuery;
    table_temp: TFDMemTable;
    QCompra: TFDQuery;
    Solicitacao_Compras: TQuickRep;
    QRBand2: TQRBand;
    QRSysData3: TQRSysData;
    QRLabel11: TQRLabel;
    QRSysData4: TQRSysData;
    QRLabel12: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRShape6: TQRShape;
    QRLabel18: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel106: TQRLabel;
    QRLabel108: TQRLabel;
    QRBand3: TQRBand;
    QRDBText12: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText70: TQRDBText;
    QRDBText72: TQRDBText;
    Label8: TLabel;
    table_tempproduto_id: TIntegerField;
    table_tempdescricao: TStringField;
    table_tempcusto: TFloatField;
    table_tempvenda: TFloatField;
    table_tempestoque: TFloatField;
    table_tempvenda7: TFloatField;
    table_tempvenda15: TFloatField;
    table_tempvenda30: TFloatField;
    QRShape7: TQRShape;
    QRLabel14: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel19: TQRLabel;
    QRShape5: TQRShape;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRRichText1: TQRRichText;
    QRRichText2: TQRRichText;
    QRRichText3: TQRRichText;
    QRRichText4: TQRRichText;
    QRRichText5: TQRRichText;
    QRLabel30: TQRLabel;
    QRRichText6: TQRRichText;
    procedure btnRetornaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExecutaClick(Sender: TObject);
    procedure FornecedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FornecedorExit(Sender: TObject);
    procedure GrupoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GrupoExit(Sender: TObject);
    procedure btnGrupoClick(Sender: TObject);
    procedure SubTipoExit(Sender: TObject);
    procedure btnSub_TipoClick(Sender: TObject);
    procedure LocalizacaoExit(Sender: TObject);
    procedure btnLocalizacaoClick(Sender: TObject);
    procedure TributacaoExit(Sender: TObject);
    procedure BtnTributacaoClick(Sender: TObject);
    procedure btnProd_InicialClick(Sender: TObject);
    procedure btnProd_finalClick(Sender: TObject);
    procedure btnFornecedorClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure DetailSearch(Tabela: String);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSolicitacao_Compras: TFrmSolicitacao_Compras;
  Pagina, linha, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15 : Integer;
  Condicao : String;
  Sub_Valor_Produtos, Sub_VR_Desconto, Sub_VR_Acrescimo, Sub_Valor,
  Total_Valor_Produtos, Total_VR_Desconto, Total_VR_Acrescimo, Total_Valor: Real;

implementation

uses
  UData, UConsulta, UPrincipal;

{$R *.dfm}


procedure TFrmSolicitacao_Compras.btnExecutaClick(Sender: TObject);
begin
try
     DetailSearch('');

      QRel.Sql.Clear;
      QRel.Sql.Add('SELECT PRODUTO_ID ');
      QRel.Sql.Add('FROM PRODUTOS WHERE STATUS = :STATUS');

         //FILTRO FORNECEDOR
        if StrToInt(Fornecedor.Text) > 0 then
        begin
          QRel.Sql.Add('AND (PRODUTOS.FORNECEDOR_ID = :FORNECEDOR_ID)');
          QRel.ParamByName('FORNECEDOR_ID').AsInteger := StrToInt(Fornecedor.Text);
        end;

        //FILTRO GRUPO
        if StrToInt(Grupo.Text) > 0 then
        begin
          QRel.Sql.Add('AND (PRODUTOS.GRUPO_ID = :GRUPO_ID)');
          QRel.ParamByName('GRUPO_ID').AsInteger := StrToInt(Grupo.Text);
        end;

        // FILTRO TRIBUTAÇÃO
        if StrToInt(Tributacao.Text) > 0 then
        begin
          QRel.Sql.Add('AND (PRODUTOS.TRIBUTO_ID = :TRIBUTO_ID)');
          QRel.ParamByName('TRIBUTO_ID').AsInteger := StrToInt(Tributacao.Text);
        end;

        //FILTRO SUBTIPO
        if StrToInt(SubTipo.Text) > 0 then
        begin
          QRel.Sql.Add('AND (PRODUTOS.SUBTIPO_ID = :SUBTIPO_ID)');
          QRel.ParamByName('SUBTIPO_ID').AsInteger := StrToInt(SubTipo.Text);
        end;

        //FILTRO LOCALIZAÇÃO
        if StrToInt(Localizacao.Text) > 0 then
        begin
          QRel.Sql.Add('AND (PRODUTOS.LOCALIZACAO_ID = :LOCALIZACAO_ID)');
          QRel.ParamByName('LOCALIZACAO_ID').AsInteger := StrToInt(Localizacao.Text);
        end;

         //FILTRO INTERVALO
        if  (StrToInt(Prod_Inicial.Text) >= 0) AND ( StrToInt(Prod_Final.Text) > 0 )  then
        begin
          QRel.Sql.Add('AND (PRODUTOS.PRODUTO_ID BETWEEN :PRODUTO_INICIAL AND :PRODUTO_FINAL)');
          QRel.ParamByName('PRODUTO_INICIAL').AsInteger := StrToInt(Prod_Inicial.Text);
          QRel.ParamByName('PRODUTO_FINAL').AsInteger   := StrToInt(Prod_Final.Text);
        end;


      //QRel.Sql.Add('AND STATUS = :STATUS');
      QRel.ParamByName('STATUS').AsString  := 'A';


     // QRel.ParamByName('DT_INICIAL').AsDateTime   :=  Dtmen.Date;
     // QRel.ParamByName('DT_FINAL').AsDateTime     :=  Dtmai.Date;

     QRel.Prepare;
     QRel.Open;

     Table_Temp.open;
     Table_Temp.EmptyDataSet;

    if QRel.IsEmpty then
      Application.MessageBox('Não há dados para serem impressos', PChar(Msg_Title), mb_IconInformation)
    else
    begin

      while not Qrel.eof do
      begin

          QCompra.sql.clear;
          QCompra.sql.add('select produto_id, descricao,sum(custo) custo, sum(venda) venda, sum(estoque) estoque, sum(venda7) venda7, sum(venda15) venda15,sum(venda30) venda30');
          QCompra.sql.add('from(select produto_id , descricao, custo_compra custo ,preco_varejo venda, 0 venda7,0 venda15, 0 venda30, quantidade_c ESTOQUE');
          QCompra.sql.add('from produtos where produto_id = :produto_id');
          QCompra.sql.add('union all');
          QCompra.sql.add('select produto_id, descricao, 0 custo ,0 venda, sum(transitens.QUANTIDADE) VENDA7, 0  venda15, 0 venda30, 0 ESTOQUE');
          QCompra.sql.add('from transitens');
          QCompra.sql.add('inner join TRANSACOES on TRANSITENS.transacao_id  = transacoes.transacao_id');
          QCompra.sql.add('where transacoes.dt_trans between current_date - 7 and current_date');
          QCompra.sql.add('and produto_id = :produto_id');
          QCompra.sql.add('group by produto_id,descricao');
          QCompra.sql.add('union all');
          QCompra.sql.add('select produto_id, descricao, 0 custo ,0 venda, 0 VENDA7, sum(transitens.QUANTIDADE)  venda15, 0 venda30, 0 ESTOQUE');
          QCompra.sql.add('from transitens');
          QCompra.sql.add('inner join TRANSACOES on TRANSITENS.transacao_id  = transacoes.transacao_id');
          QCompra.sql.add('where transacoes.dt_trans between current_date - 15 and current_date');
          QCompra.sql.add('and produto_id = :produto_id');
          QCompra.sql.add('group by produto_id,descricao');
          QCompra.sql.add('union all');
          QCompra.sql.add('select produto_id, descricao, 0 custo ,0 venda, 0 VENDA7,  0 venda15, sum(transitens.QUANTIDADE) venda30, 0 ESTOQUE');
          QCompra.sql.add('from transitens');
          QCompra.sql.add('inner join TRANSACOES on TRANSITENS.transacao_id  = transacoes.transacao_id');
          QCompra.sql.add('where transacoes.dt_trans between current_date - 30 and current_date');
          QCompra.sql.add('and produto_id = :produto_id');
          QCompra.sql.add('group by produto_id,descricao');
          QCompra.sql.add(') as teste');
          QCompra.sql.add('group by produto_id,descricao');


          QCompra.ParamByName('PRODUTO_ID').AsInteger := QRel.FieldByName('PRODUTO_ID').AsInteger;

          QCompra.Prepare;
          QCompra.open;

          Label8.Visible := True;


          if not QCompra.IsEmpty Then
          Begin


           Table_Temp.Append;
           Table_Temp.FieldByName('PRODUTO_ID').AsInteger   := QCompra.Fieldbyname('PRODUTO_ID').AsInteger;
           Table_Temp.FieldByName('DESCRICAO').AsString     := copy(QCompra.Fieldbyname('DESCRICAO').AsString,1,70);
           Table_Temp.FieldByName('CUSTO').AsFloat          := QCompra.Fieldbyname('CUSTO').AsFloat;
           Table_Temp.FieldByName('VENDA').AsFloat          := QCompra.Fieldbyname('VENDA').AsFloat;
           Table_Temp.FieldByName('ESTOQUE').AsFloat        := QCompra.Fieldbyname('ESTOQUE').AsFloat;
           Table_Temp.FieldByName('VENDA7').AsFloat         := QCompra.Fieldbyname('VENDA7').AsFloat;
           Table_Temp.FieldByName('VENDA15').AsFloat        := QCompra.Fieldbyname('VENDA15').AsFloat;
           Table_Temp.FieldByName('VENDA30').AsFloat        := QCompra.Fieldbyname('VENDA30').AsFloat;
           Table_Temp.post;


          End; ;

         Application.ProcessMessages;

         Label8.Caption :=   QCompra.Fieldbyname('PRODUTO_ID').AsString + ' - ' + QCompra.Fieldbyname('DESCRICAO').AsString;

         QRel.next;

      end;


      Table_Temp.EndBatch;


          if ordem.Text = 'Código' Then
          Table_Temp.IndexFieldNames := 'PRODUTO_ID'
          Else if ordem.Text = 'Descrição' Then
          Table_Temp.IndexFieldNames := 'DESCRICAO'
          Else if ordem.Text = 'Custo' Then
          Table_Temp.IndexFieldNames := 'CUSTO'
          Else if ordem.Text = 'Preço de Venda' Then
          Table_Temp.IndexFieldNames := 'VENDA'
          Else if ordem.Text = 'Venda 7 Dias' Then
          Table_Temp.IndexFieldNames := 'VENDA7'
          Else if ordem.Text = 'Venda 15 Dias' Then
          Table_Temp.IndexFieldNames := 'VENDA15'
          Else if ordem.Text = 'Venda 30 Dias' Then
          Table_Temp.IndexFieldNames := 'VENDA30';



      if  QFornecedor.IsEmpty Then
       QRLabel20.Caption := 'Fornecedor: TODOS'
      Else
       QRLabel20.Caption := 'Fornecedor: ' + QFornecedor.FieldByName('NOME').AsString;



      if LeIni(Arq_Ini, 'Parâmetros Estoque', 'Grupo') = '0' then
        QRLabel23.Caption := 'Grupo: TODOS'
      else
        QRLabel23.Caption := 'Grupo: ' + Search_Tabela(StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Grupo')), '7');


      if LeIni(Arq_Ini, 'Parâmetros Estoque', 'SubTipo') = '0' then
        QRLabel21.Caption := 'Sub-Tipo: TODOS'
      else
        QRLabel21.Caption := 'Sub-Tipo: ' + Search_Tabela(StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'SubTipo')), '5');


      if LeIni(Arq_Ini, 'Parâmetros Estoque', 'Localização') = '0' then
        QRLabel22.Caption := 'Localização: TODAS'
      else
        QRLabel22.Caption := 'Localização: ' + Search_Tabela(StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Localização')), '8');


        Solicitacao_compras.Prepare;
        Solicitacao_compras.PreviewModal;


    end;


  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
    Label8.Visible := False;
  end;
end;


procedure TFrmSolicitacao_Compras.DetailSearch(Tabela: String);
begin
  if ((Tabela = '') or (Tabela = 'Fornecedor')) and (Fornecedor.Text <> '') then
  begin
    QFornecedor.Close;
    QFornecedor.ParamByName('FORNECEDOR_ID').AsInteger := StrToInt(Fornecedor.Text);
    QFornecedor.Prepare;
    QFornecedor.Open;
  end;

  if ((Tabela = '') or (Tabela = 'Grupo')) and (Grupo.Text <> '') then
  begin
    QGrupo.Close;
    QGrupo.ParamByName('TABELA_ID').AsInteger := StrToInt(Grupo.Text);
    QGrupo.Prepare;
    QGrupo.Open;
  end;

  if ((Tabela = '') or (Tabela = 'Subtipo')) and (SubTipo.Text <> '') then
  begin
    QSubtipo.Close;
    QSubtipo.ParamByName('TABELA_ID').AsInteger := StrToInt(SubTipo.Text);
    QSubtipo.Prepare;
    QSubtipo.Open;
  end;

  if ((Tabela = '') or (Tabela = 'Localização')) and (Localizacao.Text <> '') then
  begin
    QLocalizacao.Close;
    QLocalizacao.ParamByName('TABELA_ID').AsInteger := StrToInt(Localizacao.Text);
    QLocalizacao.Prepare;
    QLocalizacao.Open;
  end;

  if ((Tabela = '') or (Tabela = 'Tributação')) and (Tributacao.Text <> '') then
  begin
    QTributos.Close;
    QTributos.ParamByName('TRIBUTO_ID').AsInteger := StrToInt(Tributacao.Text);
    QTributos.Prepare;
    QTributos.Open;
  end;

  if ((Tabela = '') or (Tabela = 'Produto Inicial')) and (Prod_Inicial.Text <> '') then
  begin
    QProduto_Inicial.Close;
    QProduto_Inicial.ParamByName('PRODUTO_ID').AsInteger := StrToInt(Prod_Inicial.Text);
    QProduto_Inicial.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    QProduto_Inicial.Prepare;
    QProduto_Inicial.Open;
  end;

  if ((Tabela = '') or (Tabela = 'Produto Final')) and (Prod_Final.Text <> '') then
  begin
    QProduto_Final.Close;
    QProduto_Final.ParamByName('PRODUTO_ID').AsInteger := StrToInt(Prod_Final.Text);
    QProduto_Final.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    QProduto_Final.Prepare;
    QProduto_Final.Open;
  end;
end;


procedure TFrmSolicitacao_Compras.SubTipoExit(Sender: TObject);
begin
     DetailSearch('Subtipo');
end;

procedure TFrmSolicitacao_Compras.TributacaoExit(Sender: TObject);
begin
  DetailSearch('Tributação');
end;

procedure TFrmSolicitacao_Compras.btnFornecedorClick(Sender: TObject);
begin
   try
    Fornecedor.Value := GetConsulta('FORNECEDORES', 0, 0, StrToInt(Fornecedor.Text));
  except
    Fornecedor.Value := GetConsulta('FORNECEDORES', 0, 0, 0);
  end;
end;

procedure TFrmSolicitacao_Compras.btnGrupoClick(Sender: TObject);
begin
 try
    Grupo.Value := GetConsulta('GRUPOS', 0, 0, StrToInt(Grupo.Text));
  except
    Grupo.Value := GetConsulta('GRUPOS', 0, 0, 0);
  end;
end;

procedure TFrmSolicitacao_Compras.btnLocalizacaoClick(Sender: TObject);
begin
  try
    Localizacao.Value := GetConsulta('LOCAIS', 0, 0, StrToInt(Localizacao.Text));
  except
    Localizacao.Value := GetConsulta('LOCAIS', 0, 0, 0);
  end;
end;

procedure TFrmSolicitacao_Compras.btnProd_finalClick(Sender: TObject);
begin
    try
    Prod_Final.Value := GetConsulta('ESTOQUE', FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger, 0, StrToInt(Prod_Final.Text));
  except
    Prod_Final.Value := GetConsulta('ESTOQUE', FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger, 0, 0);
  end;
end;

procedure TFrmSolicitacao_Compras.btnProd_InicialClick(Sender: TObject);
begin
  try
    Prod_Inicial.Value := GetConsulta('ESTOQUE', FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger, 0, StrToInt(Prod_Inicial.Text));
  except
    Prod_Inicial.Value := GetConsulta('ESTOQUE', FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger, 0, 0);
  end;
end;

procedure TFrmSolicitacao_Compras.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmSolicitacao_Compras.btnSub_TipoClick(Sender: TObject);
begin
 try
    SubTipo.Value := GetConsulta('SUBTIPOS', 0, 0, StrToInt(SubTipo.Text));
  except
    SubTipo.Value := GetConsulta('SUBTIPOS', 0, 0, 0);
  end;
end;

procedure TFrmSolicitacao_Compras.BtnTributacaoClick(Sender: TObject);
begin
  try
    Tributacao.Value := GetConsulta('TRIBUTOS', 0, 0, StrToInt(Localizacao.Text));
  except
    Tributacao.Value := GetConsulta('TRIBUTOS', 0, 0, 0);
  end; 
end;

procedure TFrmSolicitacao_Compras.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmSolicitacao_Compras.FormCreate(Sender: TObject);
begin
  {
   Table_Temp.Free;
   Table_Temp := TFDMemTable.Create(nil);

  with Table_Temp do
  begin
    with FieldDefs do
    begin
      Clear;
      Add('PRODUTO_ID', ftInteger, 0, False);
      Add('DESCRICAO', ftString, 70, False);
      Add('CUSTO', ftFloat, 0, False);
      Add('VENDA', ftFloat, 0, False);
      Add('ESTOQUE', ftFloat, 0, False);
      Add('VENDA7', ftFloat, 0, False);
      Add('VENDA15', ftFloat, 0, False);
      Add('VENDA30', ftFloat, 0, False);
    end;

    with IndexDefs do
    begin
      Clear;
      Add('', 'PRODUTO_ID', [ixPrimary, ixUnique]);
      Add('TEMP', 'DESCRICAO', [ixCaseInsensitive]);
    end;

   // CreateTable;
    IndexName := 'TEMP';
    Open;

  End;
  }
end;

procedure TFrmSolicitacao_Compras.FormShow(Sender: TObject);
begin
  if LeIni(Arq_Ini, 'Parâmetros Estoque', 'Fornecedor') <> '' then
    Fornecedor.Value := StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Fornecedor'));

  if LeIni(Arq_Ini, 'Parâmetros Estoque', 'Grupo') <> '' then
    Grupo.Value := StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Grupo'));

  if LeIni(Arq_Ini, 'Parâmetros Estoque', 'SubTipo') <> '' then
    SubTipo.Value := StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'SubTipo'));

  if LeIni(Arq_Ini, 'Parâmetros Estoque', 'Localização') <> '' then
    Localizacao.Value := StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Localização'));

  if LeIni(Arq_Ini, 'Parâmetros Estoque', 'Tributação') <> '' then
    Tributacao.Value := StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Tributação'));

  if LeIni(Arq_Ini, 'Parâmetros Estoque', 'Produto Inicial') <> '' then
    Prod_Inicial.Value := StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Produto Inicial'));

  if LeIni(Arq_Ini, 'Parâmetros Estoque', 'Produto Final') <> '' then
    Prod_Final.Value := StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Produto Final'));
end;

procedure TFrmSolicitacao_Compras.FornecedorExit(Sender: TObject);
begin
 DetailSearch('Fornecedor');
end;

procedure TFrmSolicitacao_Compras.FornecedorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if (Key = Vk_F7) and (Sender = Fornecedor) then
    btnFornecedorClick(Self);

  if (Key = Vk_F7) and (Sender = Grupo) then
    btnGrupoClick(Self);

  if (Key = Vk_F7) and (Sender = SubTipo) then
    btnSub_TipoClick(Self);

  if (Key = Vk_F7) and (Sender = Localizacao) then
    btnLocalizacaoClick(Self);

  if (Key = Vk_F7) and (Sender = Tributacao) then
    BtnTributacaoClick(Self);

  if (Key = Vk_F7) and (Sender = Prod_Inicial) then
    btnProd_InicialClick(Self);

  if (Key = Vk_F7) and (Sender = Prod_Final) then
    btnProd_FinalClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmSolicitacao_Compras.GrupoExit(Sender: TObject);
begin
 DetailSearch('Grupo');
end;

procedure TFrmSolicitacao_Compras.GrupoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = Fornecedor) then
    btnFornecedorClick(Self);

  if (Key = Vk_F7) and (Sender = Grupo) then
    btnGrupoClick(Self);

  if (Key = Vk_F7) and (Sender = SubTipo) then
    btnSub_TipoClick(Self);

  if (Key = Vk_F7) and (Sender = Localizacao) then
    btnLocalizacaoClick(Self);

  if (Key = Vk_F7) and (Sender = Tributacao) then
    BtnTributacaoClick(Self);

  if (Key = Vk_F7) and (Sender = Prod_Inicial) then
    btnProd_InicialClick(Self);

  if (Key = Vk_F7) and (Sender = Prod_Final) then
    btnProd_FinalClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmSolicitacao_Compras.LocalizacaoExit(Sender: TObject);
begin
 DetailSearch('Localização');
end;

end.


