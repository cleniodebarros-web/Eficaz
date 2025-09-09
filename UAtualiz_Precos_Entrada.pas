unit UAtualiz_Precos_Entrada;

interface                             

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBCustomDataSet, IBUpdateSQL, DB, IBQuery, StdCtrls, Buttons,
  ExtCtrls, Tabs, ComCtrls, Grids, DBGrids, Mask, rxToolEdit, DBTables,Math,
  FireDAC.Stan.Intf, FireDAC.Stan.Param, FireDAC.Phys.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmAtualiz_Precos_Entrada = class(TForm)
    Itens: TDBGrid;
    Panel1: TPanel;
    btnRetorna: TBitBtn;
    DataProdutos: TDataSource;
    StatusBar1: TStatusBar;
    Data_entrada: TDataSource;
    USql_Produtos: TFDUpdateSQL;
    QProdutos: TFDQuery;
    QIndices: TFDQuery;
    QUpdate: TFDQuery;
    QCalculos: TFDQuery;
    QRel: TFDQuery;
    table_temp: TFDMemTable;
    Panel2: TPanel;
    Label1: TLabel;
    Dtmen: TDateEdit;
    Dtmai: TDateEdit;
    btnSelecionar: TSpeedButton;
    QSearch: TFDQuery;
    QSimilar: TFDQuery;
    QBuscaSimilar: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure ItensKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ItensKeyPress(Sender: TObject; var Key: Char);
    procedure QProdutosBeforeDelete(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRetornaClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnPesquisaClick(Sender: TObject);
    procedure QProdutosNewRecord(DataSet: TDataSet);
    procedure btnSelecionarClick(Sender: TObject);
    procedure Table_TempAfterOpen(DataSet: TDataSet);
    procedure FormDestroy(Sender: TObject);
    procedure btnRemarcaClick(Sender: TObject);
    procedure Table_TempBeforePost(DataSet: TDataSet);
    procedure ItensColExit(Sender: TObject);
    procedure ItensTitleClick(Column: TColumn);
    procedure ItensDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
    CmdSelect: String;
    CmdOrderBy: String;
    CmdSelectNull: String;
  end;

var
  FrmAtualiz_Precos_Entrada: TFrmAtualiz_Precos_Entrada;
  Produto: Integer;
  Base_Calc_Desc_Rodape, Vl_Prod, Perc_Desc, Perc_Frt, Perc_Desp, New_Custo, Vl_Sbt, Perc_Sub, Desc_Footer, ICMS_Sub: Real;
  New_IPI, New_Frt, New_Desp, Cst_Entr, New_PMZ, New_Sugestao, Perc_IPI: Real;
  Inserindo :Boolean;
implementation

uses
  UData, UPrincipal, UPesquisa;

{$R *.dfm}

procedure TFrmAtualiz_Precos_Entrada.btnPesquisaClick(Sender: TObject);
var
Condicao: String;
begin
  Condicao := GetPesquisa('PRODUTOS');

  if Condicao <> '' then
  begin
    if FrmData.QAcesso.FieldByName('DESATIVADOS').AsString = 'True' then
      CmdSelectNull := Condicao
    else
      CmdSelectNull := Condicao + ' AND (STATUS = ' + #39 + 'A' + #39 + ')';
  end;

  CmdSelectNull := CmdSelectNull + ' AND (EMPRESA_ID = ' + FrmData.QAcesso.FieldByName('EMPRESA_ID').AsString + ')';

  CmdOrderBy := 'ORDER BY PRODUTO_ID';

  QProdutos.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

  QProdutos.Prepare;
  QProdutos.Open;
end;

procedure TFrmAtualiz_Precos_Entrada.btnRemarcaClick(Sender: TObject);
begin
{Table_Temp.Edit;
Table_Temp.Post;

Table_Temp.First;  }


end;

procedure TFrmAtualiz_Precos_Entrada.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmAtualiz_Precos_Entrada.btnSelecionarClick(Sender: TObject);
begin

  Table_Temp.EmptyDataSet;

  //Table_Temp.First;

  //while not Table_Temp.Eof do

  Table_Temp.Filtered := False;


  QRel.Sql.Clear;
  QRel.Sql.Add('SELECT TRIBUTOS.DESCRICAO TRIBUTOS,TRANSITENS.PRODUTO_ID,DT_ENT_SAI,TRANSACOES.TRANSACAO_ID, TRANSACOES.NUM_DOC, TRANSACOES.VALOR_PRODUTOS,TRANSACOES.VR_DESCONTO,TRANSITENS.QUANTIDADE ,');
  QRel.Sql.Add('TRANSACOES.VR_FRETE,TRANSACOES.VR_OUTROS,TRANSACOES.VR_ICMS_ST, TRANSITENS.VR_UNITARIO,TRANSITENS.DESC_RODAPE AS DESC_ITEM,');
  QRel.Sql.Add('TRANSITENS.VR_DESCONTO ITEM_DESC,TRANSITENS.VR_ACRESCIMO ACRES_ITEM,TRANSACOES.VR_IPI,TRANSITENS.VALOR_ICMS_ST,TRANSITENS.CONFERENCIA,');
  QRel.Sql.Add('TRANSITENS.ALIQUOTA_ICMS AS ICMS_ENTRADA, PRODUTOS.QUANT_MINIMA, PRODUTOS.CUSTOMEDIO, PRODUTOS.ESTOQUE_INICIAL, PRODUTOS.MARGEM_LUCRO, PRODUTOS.FAMILIA_ID,');
  QRel.Sql.Add('PRODUTOS.ALIQUOTA_ICMS AS ICMS_SAIDA, PRODUTOS.PRECO_VAREJO, PRODUTOS.PRECO_PRAZO, PRODUTOS.DESCRICAO,PRODUTOS.DT_PRECO,PRODUTOS.COD_BARRA,PRODUTOS.CUSTO_COMPRA,');
  QRel.Sql.Add('PRODUTOS.CST_PIS as CST_PIS_COFINS_SAI, PRODUTOS.CST_PIS_ENTR as CST_PIS_COFINS_ENT, PRODUTOS.PIS as ALIQ_PIS, PRODUTOS.COFINS as ALIQ_COFINS');
  QRel.Sql.Add('FROM PRODUTOS');
  QRel.Sql.Add('INNER JOIN TRANSITENS ON TRANSITENS.PRODUTO_ID = PRODUTOS.PRODUTO_ID');
  QRel.Sql.Add('INNER JOIN TRANSACOES ON TRANSACOES.TRANSACAO_ID = TRANSITENS.TRANSACAO_ID');
  QRel.Sql.Add('INNER JOIN TRIBUTOS ON TRIBUTOS.TRIBUTO_ID = PRODUTOS.TRIBUTO_ID');
  QRel.Sql.Add('WHERE DT_ENT_SAI BETWEEN :DT_INICIAL AND :DT_FINAL');
  QRel.Sql.Add('AND CONDUTA = :CONDUTA AND DEPTO = :DEPTO');
  QRel.Sql.Add('AND (TP_PROD_SERV = :TP_PROD_SERV)');

  QRel.ParamByName('DT_INICIAL').AsDateTime := DtMen.Date;
  QRel.ParamByName('DT_FINAL').AsDateTime   := DtMai.Date;
  QRel.ParamByName('CONDUTA').AsString      := '02';
  QRel.ParamByName('DEPTO').AsString        := '07';
  QRel.ParamByName('TP_PROD_SERV').AsString := 'P';

  QRel.Prepare;
  QRel.Open;


  QRel.First;

  QIndices.Open;
  Inserindo := True;
  while not QRel.eof do
  Begin
    try


     {
      Base_Calc_Desc_Rodape := QRel.FieldByName('VALOR_PRODUTOS').AsFloat;
      Vl_Prod               := QRel.FieldByName('VALOR_PRODUTOS').AsFloat;

      if (QRel.FieldByName('VR_DESCONTO').AsFloat > 0) and (Base_Calc_Desc_Rodape > 0) then
        Perc_Desc := ((QRel.FieldByName('VR_DESCONTO').AsFloat * 100) / Base_Calc_Desc_Rodape)
      else
        Perc_Desc := 0;

      if (QRel.FieldByName('VR_FRETE').AsFloat > 0) and (Vl_Prod > 0) then
        Perc_Frt := ((QRel.FieldByName('VR_FRETE').AsFloat * 100) / Vl_Prod)
      else
        Perc_Frt := 0;

    {  if (QTabela.FieldByName('VR_ACRESCIMO').AsFloat > 0) and (Vl_Prod > 0) then
        Perc_Desp := ((QTabela.FieldByName('VR_ACRESCIMO').AsFloat * 100) / Vl_Prod)
      else
        Perc_Desp := 0;



      if (QRel.FieldByName('VR_OUTROS').AsFloat > 0) and (Vl_Prod > 0) then
        Perc_Desp := (Perc_Desp + ((QRel.FieldByName('VR_OUTROS').AsFloat * 100) / Vl_Prod))
      else
        Perc_Desp := Perc_Desp;

      QCalculos.Sql.Clear;
      QCalculos.Sql.Add('SELECT SUM(VR_TOTAL) AS VALOR');
      QCalculos.Sql.Add('FROM TRANSITENS');
      QCalculos.Sql.Add('WHERE');
      QCalculos.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
      QCalculos.Sql.Add('AND (CST LIKE :CST1 OR CST LIKE :CST2 OR CST LIKE :CST3 OR CST LIKE :CST4)');

      QCalculos.ParamByName('TRANSACAO_ID').AsInteger := QRel.FieldByName('TRANSACAO_ID').AsInteger;
      QCalculos.ParamByName('CST1').AsString          := '%10';
      QCalculos.ParamByName('CST2').AsString          := '%30';
      QCalculos.ParamByName('CST3').AsString          := '%60';
      QCalculos.ParamByName('CST4').AsString          := '%70';

      QCalculos.Prepare;
      QCalculos.Open;

      Vl_Sbt := QCalculos.FieldByName('VALOR').AsFloat;

      if (QRel.FieldByName('VR_ICMS_ST').AsFloat > 0) and (Vl_Sbt > 0) then
        Perc_Sub := ((QRel.FieldByName('VR_ICMS_ST').AsFloat * 100) / Vl_Sbt)
      else
        Perc_Sub := 0;

      New_Custo := (QRel.FieldByName('VR_UNITARIO').AsFloat - QRel.FieldByName('ITEM_DESC').AsFloat + (QRel.FieldByName('ACRES_ITEM').AsFloat/QRel.FieldByName('QUANTIDADE').AsFloat) - (QRel.FieldByName('DESC_ITEM').AsFloat/QRel.FieldByName('QUANTIDADE').AsFloat));


      if (Perc_Desc > 0)  then
        Desc_Footer := ((Perc_Desc * New_Custo) / 100)
      else
        Desc_Footer := 0;

     // New_Custo := New_Custo - Desc_Footer;
      ICMS_Sub  := 0;

      if QRel.FieldByName('VR_IPI').AsFloat > 0  then
      begin
        New_IPI  := (QRel.FieldByName('VR_IPI').AsFloat / QRel.FieldByName('QUANTIDADE').AsFloat);
        Perc_IPI := ((New_IPI * 100) / (QRel.FieldByName('VR_UNITARIO').AsFloat - (QRel.FieldByName('DESC_ITEM').AsFloat/QRel.FieldByName('QUANTIDADE').AsFloat)));
      end
      else
      begin
        New_IPI  := 0;
        Perc_IPI := 0;
      end;

      if Perc_Frt > 0 then
        New_Frt := ((New_Custo * Perc_Frt) / 100)
      else
        New_Frt := 0;

      if Perc_Desp > 0 then
        New_Desp := ((New_Custo * Perc_Desp) / 100)
      else
        New_Desp := 0;


    //Alterado a pedido de Regivaldo 20/04/15
    //  if (Copy(QTabela.FieldByName('CST').AsString, 2, 2) = '10') or (Copy(QTabela.FieldByName('CST').AsString, 2, 2) = '30') or
    //     (Copy(QTabela.FieldByName('CST').AsString, 2, 2) = '60') or (Copy(QTabela.FieldByName('CST').AsString, 2, 2) = '70') then
   //   begin
    //    if (QTabela.FieldByName('VR_ICMS_ST').AsFloat > 0) and (Vl_Sbt > 0) then
    //      ICMS_Sub := ((New_Custo * Perc_Sub) / 100);
        //Ratear icms_st somente para os itens que possuirem valor

        if QRel.FieldByName('VALOR_ICMS_ST').AsFloat > 0 then
          ICMS_Sub := (QRel.FieldByName('VALOR_ICMS_ST').AsFloat / QRel.FieldByName('QUANTIDADE').AsFloat);


    //  end;

      Cst_Entr := New_Custo + New_IPI + New_Frt + New_Desp + ICMS_Sub;

      if ICMS_Sub = 0 then
      begin
        New_PMZ      := ((New_Custo - ((New_Custo * QRel.FieldByName('ICMS_ENTRADA').AsFloat) / 100)) / (1 - ((QIndices.FieldByName('VALOR').AsFloat + Perc_IPI + Perc_Frt + Perc_Desp + Perc_Sub + QRel.FieldByName('ICMS_SAIDA').AsFloat) / 100)));
        New_Sugestao := ((New_Custo - ((New_Custo * QRel.FieldByName('ICMS_ENTRADA').AsFloat) / 100)) / (1 - ((QIndices.FieldByName('VALOR').AsFloat + Perc_IPI + Perc_Frt + Perc_Desp + Perc_Sub + QRel.FieldByName('ICMS_SAIDA').AsFloat + QRel.FieldByName('MARGEM_LUCRO').AsFloat) / 100)));
      end
      else
      begin

        New_PMZ      := (New_Custo / (1 - ((QIndices.FieldByName('VALOR').AsFloat + Perc_IPI + Perc_Frt + Perc_Desp + Perc_Sub + QRel.FieldByName('ICMS_SAIDA').AsFloat) / 100)));
        New_Sugestao := (New_Custo / (1 - ((QIndices.FieldByName('VALOR').AsFloat + Perc_IPI + Perc_Frt + Perc_Desp + Perc_Sub + QRel.FieldByName('ICMS_SAIDA').AsFloat + QRel.FieldByName('MARGEM_LUCRO').AsFloat) / 100)));

      end;   }

       Table_Temp.Append;
       Table_Temp.FieldByName('PRODUTO_ID').AsInteger     := QRel.FieldByName('PRODUTO_ID').AsInteger;
       Table_Temp.FieldByName('TRANSACAO_ID').AsInteger   := QRel.FieldByName('TRANSACAO_ID').AsInteger;
       Table_Temp.FieldByName('DESCRICAO').AsString       := Copy(QRel.FieldByName('DESCRICAO').AsString,1,40);
       Table_Temp.FieldByName('VALOR_COMPRA').AsFloat     := QRel.FieldByName('CUSTO_COMPRA').AsFloat;
       Table_Temp.FieldByName('DT_PRECO').AsDateTime      := QRel.FieldByName('DT_PRECO').AsDateTime;
       Table_Temp.FieldByName('PRECO_VAREJO').AsFloat     := QRel.FieldByName('PRECO_VAREJO').AsFloat;
       Table_Temp.FieldByName('PRECO_PRAZO').AsFloat      := QRel.FieldByName('PRECO_PRAZO').AsFloat;
       Table_Temp.FieldByName('MARGEM_LUCRO').AsFloat     := QRel.FieldByName('MARGEM_LUCRO').AsFloat;
       Table_Temp.FieldByName('MARGEM_SUGERIDA').AsFloat  := QRel.FieldByName('MARGEM_LUCRO').AsFloat; //RoundTo((((New_Sugestao - Cst_Entr) * 100) / Cst_Entr), -2);
       Table_Temp.FieldByName('PRECO_SUGERIDO').AsFloat   := QRel.FieldByName('PRECO_VAREJO').AsFloat;
       Table_Temp.FieldByName('DT_ENTRADA').AsDateTime    := QRel.FieldByName('DT_ENT_SAI').AsDateTime;
       Table_Temp.FieldByName('COD_BARRA').AsString       := QRel.FieldByName('COD_BARRA').AsString;
       Table_Temp.FieldByName('QUANTIDADE').AsFloat       := QRel.FieldByName('QUANTIDADE').AsFloat;
       Table_Temp.FieldByName('QUANT_MINIMA').AsFloat     := QRel.FieldByName('QUANT_MINIMA').AsFloat;
       Table_Temp.FieldByName('NOVO_PRECO').AsFloat       := QRel.FieldByName('PRECO_VAREJO').AsFloat;
       Table_Temp.FieldByName('NOVO_PRECO_PRAZO').AsFloat := QRel.FieldByName('PRECO_PRAZO').AsFloat;
       Table_Temp.FieldByName('FAMILIA_ID').AsInteger     := QRel.FieldByName('FAMILIA_ID').AsInteger;
       Table_Temp.FieldByName('NUM_DOC').AsString         := QRel.FieldByName('NUM_DOC').AsString;
       Table_Temp.FieldByName('TRIBUTOS').AsString        := QRel.FieldByName('TRIBUTOS').AsString;
       Table_Temp.FieldByName('CST_PIS_COFINS_SAI').AsString := QRel.FieldByName('CST_PIS_COFINS_SAI').AsString;
       Table_Temp.FieldByName('CST_PIS_COFINS_ENT').AsString := QRel.FieldByName('CST_PIS_COFINS_ENT').AsString;
       Table_Temp.FieldByName('ALIQ_PIS').AsFloat         := QRel.FieldByName('ALIQ_PIS').AsFloat;
       Table_Temp.FieldByName('ALIQ_COFINS').AsFloat      := QRel.FieldByName('ALIQ_COFINS').AsFloat;


       QSearch.sql.Clear;
       QSearch.Sql.Text   := 'SELECT CUSTO_COMPRA FROM TRANSITENS_CUSTO WHERE PRODUTO_ID = :PRODUTO_ID ORDER BY DT_EMISSAO DESC';
       QSearch.ParamByName('PRODUTO_ID').AsInteger := QRel.FieldByName('PRODUTO_ID').AsInteger;
       QSearch.Prepare;
       QSearch.Open;
       QSearch.Next;

       Table_Temp.FieldByName('ULTIMO_CUSTO').AsFloat       := QSearch.FieldByName('CUSTO_COMPRA').AsFloat;

       IF QRel.FieldByName('CONFERENCIA').AsInteger  = 1 tHEN
       Table_Temp.FieldByName('CONFERENCIA').AsString :='SIM'
       Else
       Table_Temp.FieldByName('CONFERENCIA').AsString :='NÃO';

       Table_Temp.Post;

       QSimilar.Sql.Clear;
       QSimilar.Sql.Text := 'SELECT * FROM SIMILAR_PRODUTOS  WHERE PRODUTO_ID = :PRODUTO_ID';
       QSimilar.ParamByName('PRODUTO_ID').AsInteger :=  QRel.FieldByName('PRODUTO_ID').AsInteger;
       QSimilar.Prepare;
       QSimilar.Open;
       QSimilar.first;

       if not QSimilar.IsEmpty Then
       Begin

        while not QSimilar.eof do
        Begin

         QBuscaSimilar.Sql.Clear;
         QBuscaSimilar.Sql.Text := 'SELECT * FROM PRODUTOS WHERE PRODUTO_ID = :PRODUTO_ID';
         QBuscaSimilar.ParamByName('PRODUTO_ID').AsInteger := QSimilar.FieldByName('SIMILAR_ID').AsInteger;
         QBuscaSimilar.Prepare;
         QBuscaSimilar.open;


         Table_Temp.Append;
         Table_Temp.FieldByName('PRODUTO_ID').AsInteger     := QBuscaSimilar.FieldByName('PRODUTO_ID').AsInteger;
         Table_Temp.FieldByName('TRANSACAO_ID').AsInteger   := QRel.FieldByName('TRANSACAO_ID').AsInteger;
         Table_Temp.FieldByName('DESCRICAO').AsString       := Copy(QBuscaSimilar.FieldByName('DESCRICAO').AsString,1,40);
         Table_Temp.FieldByName('VALOR_COMPRA').AsFloat     := QBuscaSimilar.FieldByName('CUSTO_COMPRA').AsFloat;
         Table_Temp.FieldByName('DT_PRECO').AsDateTime      := QBuscaSimilar.FieldByName('DT_PRECO').AsDateTime;
         Table_Temp.FieldByName('PRECO_VAREJO').AsFloat     := QBuscaSimilar.FieldByName('PRECO_VAREJO').AsFloat;
         Table_Temp.FieldByName('PRECO_PRAZO').AsFloat      := QBuscaSimilar.FieldByName('PRECO_PRAZO').AsFloat;
         Table_Temp.FieldByName('MARGEM_LUCRO').AsFloat     := QBuscaSimilar.FieldByName('MARGEM_LUCRO').AsFloat;
         Table_Temp.FieldByName('MARGEM_SUGERIDA').AsFloat  := QBuscaSimilar.FieldByName('MARGEM_LUCRO').AsFloat; //RoundTo((((New_Sugestao - Cst_Entr) * 100) / Cst_Entr), -2);
         Table_Temp.FieldByName('PRECO_SUGERIDO').AsFloat   := QBuscaSimilar.FieldByName('PRECO_VAREJO').AsFloat;
         Table_Temp.FieldByName('DT_ENTRADA').AsDateTime    := QRel.FieldByName('DT_ENT_SAI').AsDateTime;
         Table_Temp.FieldByName('COD_BARRA').AsString       := QBuscaSimilar.FieldByName('COD_BARRA').AsString;
         Table_Temp.FieldByName('QUANTIDADE').AsFloat       := 0; //QBuscaSimilar.FieldByName('QUANTIDADE').AsFloat;
         Table_Temp.FieldByName('QUANT_MINIMA').AsFloat     := QBuscaSimilar.FieldByName('QUANT_MINIMA').AsFloat;
         Table_Temp.FieldByName('NOVO_PRECO').AsFloat       := QBuscaSimilar.FieldByName('PRECO_VAREJO').AsFloat;
         Table_Temp.FieldByName('NOVO_PRECO_PRAZO').AsFloat := QBuscaSimilar.FieldByName('PRECO_PRAZO').AsFloat;
         Table_Temp.FieldByName('FAMILIA_ID').AsInteger     := QBuscaSimilar.FieldByName('FAMILIA_ID').AsInteger;
         Table_Temp.FieldByName('NUM_DOC').AsString         := QRel.FieldByName('NUM_DOC').AsString;
         Table_Temp.FieldByName('TRIBUTOS').AsString        := 'Produto Similar';
         Table_Temp.FieldByName('CST_PIS_COFINS_SAI').AsString := QRel.FieldByName('CST_PIS_COFINS_SAI').AsString;
         Table_Temp.FieldByName('CST_PIS_COFINS_ENT').AsString := QRel.FieldByName('CST_PIS_COFINS_ENT').AsString;
         Table_Temp.FieldByName('ALIQ_PIS').AsFloat         := QRel.FieldByName('ALIQ_PIS').AsFloat;
         Table_Temp.FieldByName('ALIQ_COFINS').AsFloat      := QRel.FieldByName('ALIQ_COFINS').AsFloat;


         QSearch.sql.Clear;
         QSearch.Sql.Text   := 'SELECT CUSTO_COMPRA FROM TRANSITENS_CUSTO WHERE PRODUTO_ID = :PRODUTO_ID ORDER BY DT_EMISSAO DESC';
         QSearch.ParamByName('PRODUTO_ID').AsInteger := QSimilar.FieldByName('PRODUTO_ID').AsInteger;
         QSearch.Prepare;
         QSearch.Open;
         QSearch.Next;

         Table_Temp.FieldByName('ULTIMO_CUSTO').AsFloat       := QSearch.FieldByName('CUSTO_COMPRA').AsFloat;

         IF QRel.FieldByName('CONFERENCIA').AsInteger  = 1 tHEN
         Table_Temp.FieldByName('CONFERENCIA').AsString :='SIM'
         Else
         Table_Temp.FieldByName('CONFERENCIA').AsString :='NÃO';

         Table_Temp.Post;

        QSimilar.Next;

        End;

       End;


     { Custo_Atual.Value    := Cst_Entr;
      Despesas.Value       := (QIndices.FieldByName('VALOR').AsFloat + QTabela.FieldByName('ICMS_SAIDA').AsFloat);
      Margem_Lucro.Value   := QTabela.FieldByName('MARGEM_LUCRO').AsFloat;
      PMZ.Value            := New_PMZ;
      Pr_Venda_Atual.Value := QProdutos.FieldByName('PRECO_VAREJO').AsFloat;
      Preco_Sugerido.Value := New_Sugestao;
      Pr_Prazo_Atual.Value := QProdutos.FieldByName('PRECO_PRAZO').AsFloat;
      Preco_Prazo_Sugerido.Value := New_Sugestao;
      Quantidade.Value     := QTabela.FieldByName('QUANTIDADE').AsFloat;
      Estoque_minimo.Value := QTabela.FieldByName('QUANT_MINIMA').AsFloat;

      try
        Margem_Atual.Value   := RoundTo((((Pr_Venda_Atual.Value - Custo_Atual.Value) * 100) / Custo_Atual.Value), -2);
      except

      end;

      if Tipo_Remarca.ItemIndex = 1 then
      Begin
        Novo_Preco.Value       := (Cst_Entr + ((Cst_Entr * QTabela.FieldByName('MARGEM_LUCRO').AsFloat) / 100));
        Novo_Preco_Prazo.Value := (Cst_Entr + ((Cst_Entr * QTabela.FieldByName('MARGEM_LUCRO').AsFloat) / 100));
      End
      else
      Begin
        Novo_Preco.Value       := New_Sugestao;
        Novo_Preco_Prazo.Value := New_Sugestao;
      End;  }


    finally

    end;
    QRel.Next;
  End;
  Inserindo:= False;
  Table_Temp.Open;
  Table_Temp.First;
end;

procedure TFrmAtualiz_Precos_Entrada.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  Action := caFree;
end;

procedure TFrmAtualiz_Precos_Entrada.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if QProdutos.State in [dsInsert, dsEdit] then
  begin
    Application.MessageBox('É melhor salvar as alterações antes de continuar', PChar(Msg_Title), mb_IconStop);
    CanClose := False;
  end;
end;

procedure TFrmAtualiz_Precos_Entrada.FormCreate(Sender: TObject);
var
Temp_Name: String;
begin

 with Table_Temp do
  begin


    Temp_Name    := Copy(TimeToStr(time), 1, 2) + Copy(TimeToStr(time), 4, 2) + Copy(TimeToStr(time), 7, 2);


    with FieldDefs do
    begin
      Clear;
      Add('ACESSO', ftAutoInc, 0, False);
      Add('PRODUTO_ID', ftInteger, 0, False);
      Add('DESCRICAO', ftString, 40, False);
      Add('COD_BARRA', ftString, 14, False);
      Add('PRECO_VAREJO', ftFloat, 0, False);
      Add('NOVO_PRECO', ftFloat, 0, False);
      Add('NOVO_PRECO_PRAZO', ftFloat, 0, False);
      Add('PRECO_PRAZO', ftFloat, 0, False);
      Add('VALOR_COMPRA', ftFloat, 0, False);
      Add('MARGEM_LUCRO', ftFloat, 0, False);
      Add('MARGEM_SUGERIDA', ftFloat, 0, False);
      Add('PRECO_SUGERIDO', ftFloat, 0, False);
      Add('DT_PRECO', ftDate, 0, False);
      Add('DT_ENTRADA', ftDate, 0, False);
      Add('TRANSACAO_ID', ftInteger, 0, False);
      Add('QUANTIDADE', ftFloat, 0, False);
      Add('QUANT_MINIMA', ftFloat, 0, False);
      Add('FAMILIA_ID', ftInteger, 0, False);
      Add('NUM_DOC', ftString, 20, False);
      Add('TRIBUTOS', ftString, 25, False);
      Add('CONFERENCIA', ftString, 5, False);
      Add('ULTIMO_CUSTO', ftFloat, 0, False);
      Add('CST_PIS_COFINS_SAI', ftString, 2, False);
      Add('CST_PIS_COFINS_ENT', ftString, 2, False);
      Add('ALIQ_PIS', ftFloat, 0, False);
      Add('ALIQ_COFINS', ftFloat, 0, False);

    end;

    with IndexDefs do
    begin
      Clear;
      Add('', 'ACESSO', [ixPrimary, ixUnique]);
      Add('TEMP', 'DESCRICAO;DT_ENTRADA', [ixCaseInsensitive]);
      Add('DESCRICAO', 'DESCRICAO', [ixCaseInsensitive]);
      Add('PRODUTO_ID', 'PRODUTO_ID', [ixCaseInsensitive]);
      Add('DT_PRECO', 'DT_PRECO', [ixCaseInsensitive]);
      Add('VALOR_COMPRA', 'VALOR_COMPRA', [ixCaseInsensitive]);
      Add('PRECO_VAREJO', 'PRECO_VAREJO', [ixCaseInsensitive]);
      Add('MARGEM_LUCRO', 'MARGEM_LUCRO', [ixCaseInsensitive]);
      Add('PRECO_SUGERIDO', 'PRECO_SUGERIDO', [ixCaseInsensitive]);
      Add('MARGEM_SUGERIDA', 'MARGEM_SUGERIDA', [ixCaseInsensitive]);
      Add('DT_ENTRADA', 'DT_ENTRADA', [ixCaseInsensitive]);

    end;
    IndexName := 'TEMP';
    Open;
  end;


  Dtmen.Date := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
  Dtmai.Date := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;


  Itens.Columns[0].Width := 69;
  Itens.Columns[1].Width := 242;
  Itens.Columns[2].Width := 75;
  Itens.Columns[3].Width := 75;
  Itens.Columns[4].Width := 70;
  Itens.Columns[5].Width := 75;
  Itens.Columns[6].Width := 75;
  Itens.Columns[7].Width := 80;
  Itens.Columns[8].Width := 80;
  Itens.Columns[9].Width := 80;
  Itens.Columns[10].Width := 87;
  Itens.Columns[11].Width := 80;
  Itens.Columns[12].Width := 75;
  Itens.Columns[13].Width := 78;
  Itens.Columns[14].Width := 100;
  Itens.Columns[15].Width := 150;
  Itens.Columns[16].Width := 64;


  Table_Temp.First;
  while not Table_Temp.Eof do
  Table_Temp.Delete;


  QRel.Sql.Clear;
  QRel.Sql.Add('SELECT TRIBUTOS.DESCRICAO TRIBUTOS,DT_ENT_SAI,TRANSACOES.TRANSACAO_ID, TRANSACOES.NUM_DOC , TRANSACOES.VALOR_PRODUTOS,TRANSACOES.VR_DESCONTO,TRANSITENS.QUANTIDADE ,');
  QRel.Sql.Add('TRANSACOES.VR_FRETE,TRANSACOES.VR_OUTROS,TRANSACOES.VR_ICMS_ST, TRANSITENS.VR_UNITARIO,TRANSITENS.DESC_RODAPE AS DESC_ITEM,');
  QRel.Sql.Add('TRANSITENS.PRODUTO_ID,TRANSITENS.VR_DESCONTO ITEM_DESC,TRANSITENS.VR_ACRESCIMO ACRES_ITEM,TRANSACOES.VR_IPI,TRANSITENS.VALOR_ICMS_ST,TRANSITENS.CONFERENCIA,');
  QRel.Sql.Add('TRANSITENS.ALIQUOTA_ICMS AS ICMS_ENTRADA, PRODUTOS.QUANT_MINIMA, PRODUTOS.CUSTOMEDIO, PRODUTOS.ESTOQUE_INICIAL, PRODUTOS.MARGEM_LUCRO, PRODUTOS.FAMILIA_ID,');
  QRel.Sql.Add('PRODUTOS.ALIQUOTA_ICMS AS ICMS_SAIDA, PRODUTOS.PRECO_VAREJO, PRODUTOS.PRECO_PRAZO, PRODUTOS.DESCRICAO,PRODUTOS.DT_PRECO,PRODUTOS.COD_BARRA,PRODUTOS.CUSTO_COMPRA,');
  QRel.Sql.Add('PRODUTOS.CST_PIS as CST_PIS_COFINS_SAI, PRODUTOS.CST_PIS_ENTR as CST_PIS_COFINS_ENT, PRODUTOS.PIS as ALIQ_PIS, PRODUTOS.COFINS as ALIQ_COFINS');
  QRel.Sql.Add('FROM PRODUTOS');
  QRel.Sql.Add('INNER JOIN TRANSITENS ON TRANSITENS.PRODUTO_ID = PRODUTOS.PRODUTO_ID');
  QRel.Sql.Add('INNER JOIN TRANSACOES ON TRANSACOES.TRANSACAO_ID = TRANSITENS.TRANSACAO_ID');
  QRel.Sql.Add('INNER JOIN TRIBUTOS ON TRIBUTOS.TRIBUTO_ID = PRODUTOS.TRIBUTO_ID');
  QRel.Sql.Add('WHERE DT_ENT_SAI BETWEEN :DT_INICIAL AND :DT_FINAL');
  QRel.Sql.Add('AND CONDUTA = :CONDUTA AND DEPTO = :DEPTO');
  QRel.Sql.Add('AND (TP_PROD_SERV = :TP_PROD_SERV)');

  QRel.ParamByName('DT_INICIAL').AsDateTime := DtMen.Date;
  QRel.ParamByName('DT_FINAL').AsDateTime   := DtMai.Date;
  QRel.ParamByName('CONDUTA').AsString      := '02';
  QRel.ParamByName('DEPTO').AsString        := '07';
  QRel.ParamByName('TP_PROD_SERV').AsString := 'P';

  QRel.Prepare;
  QRel.Open;
  QRel.First;

  QIndices.Open;
  Inserindo := True;
  
  while not QRel.eof do
  Begin
    try



      {
      Base_Calc_Desc_Rodape := QRel.FieldByName('VALOR_PRODUTOS').AsFloat;
      Vl_Prod               := QRel.FieldByName('VALOR_PRODUTOS').AsFloat;

      if (QRel.FieldByName('VR_DESCONTO').AsFloat > 0) and (Base_Calc_Desc_Rodape > 0) then
        Perc_Desc := ((QRel.FieldByName('VR_DESCONTO').AsFloat * 100) / Base_Calc_Desc_Rodape)
      else
        Perc_Desc := 0;

      if (QRel.FieldByName('VR_FRETE').AsFloat > 0) and (Vl_Prod > 0) then
        Perc_Frt := ((QRel.FieldByName('VR_FRETE').AsFloat * 100) / Vl_Prod)
      else
        Perc_Frt := 0;

    {  if (QTabela.FieldByName('VR_ACRESCIMO').AsFloat > 0) and (Vl_Prod > 0) then
        Perc_Desp := ((QTabela.FieldByName('VR_ACRESCIMO').AsFloat * 100) / Vl_Prod)
      else
        Perc_Desp := 0;



      if (QRel.FieldByName('VR_OUTROS').AsFloat > 0) and (Vl_Prod > 0) then
        Perc_Desp := (Perc_Desp + ((QRel.FieldByName('VR_OUTROS').AsFloat * 100) / Vl_Prod))
      else
        Perc_Desp := Perc_Desp;

      QCalculos.Sql.Clear;
      QCalculos.Sql.Add('SELECT SUM(VR_TOTAL) AS VALOR');
      QCalculos.Sql.Add('FROM TRANSITENS');
      QCalculos.Sql.Add('WHERE');
      QCalculos.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
      QCalculos.Sql.Add('AND (CST LIKE :CST1 OR CST LIKE :CST2 OR CST LIKE :CST3 OR CST LIKE :CST4)');

      QCalculos.ParamByName('TRANSACAO_ID').AsInteger := QRel.FieldByName('TRANSACAO_ID').AsInteger;
      QCalculos.ParamByName('CST1').AsString          := '%10';
      QCalculos.ParamByName('CST2').AsString          := '%30';
      QCalculos.ParamByName('CST3').AsString          := '%60';
      QCalculos.ParamByName('CST4').AsString          := '%70';

      QCalculos.Prepare;
      QCalculos.Open;

      Vl_Sbt := QCalculos.FieldByName('VALOR').AsFloat;

      if (QRel.FieldByName('VR_ICMS_ST').AsFloat > 0) and (Vl_Sbt > 0) then
        Perc_Sub := ((QRel.FieldByName('VR_ICMS_ST').AsFloat * 100) / Vl_Sbt)
      else
        Perc_Sub := 0;

      New_Custo := (QRel.FieldByName('VR_UNITARIO').AsFloat - QRel.FieldByName('ITEM_DESC').AsFloat + (QRel.FieldByName('ACRES_ITEM').AsFloat/QRel.FieldByName('QUANTIDADE').AsFloat) - (QRel.FieldByName('DESC_ITEM').AsFloat/QRel.FieldByName('QUANTIDADE').AsFloat));


      if (Perc_Desc > 0)  then
        Desc_Footer := ((Perc_Desc * New_Custo) / 100)
      else
        Desc_Footer := 0;

     // New_Custo := New_Custo - Desc_Footer;
      ICMS_Sub  := 0;

      if QRel.FieldByName('VR_IPI').AsFloat > 0  then
      begin
        New_IPI  := (QRel.FieldByName('VR_IPI').AsFloat / QRel.FieldByName('QUANTIDADE').AsFloat);
        Perc_IPI := ((New_IPI * 100) / (QRel.FieldByName('VR_UNITARIO').AsFloat - (QRel.FieldByName('DESC_ITEM').AsFloat/QRel.FieldByName('QUANTIDADE').AsFloat)));
      end
      else
      begin
        New_IPI  := 0;
        Perc_IPI := 0;
      end;

      if Perc_Frt > 0 then
        New_Frt := ((New_Custo * Perc_Frt) / 100)
      else
        New_Frt := 0;

      if Perc_Desp > 0 then
        New_Desp := ((New_Custo * Perc_Desp) / 100)
      else
        New_Desp := 0;


    //Alterado a pedido de Regivaldo 20/04/15
    //  if (Copy(QTabela.FieldByName('CST').AsString, 2, 2) = '10') or (Copy(QTabela.FieldByName('CST').AsString, 2, 2) = '30') or
    //     (Copy(QTabela.FieldByName('CST').AsString, 2, 2) = '60') or (Copy(QTabela.FieldByName('CST').AsString, 2, 2) = '70') then
   //   begin
    //    if (QTabela.FieldByName('VR_ICMS_ST').AsFloat > 0) and (Vl_Sbt > 0) then
    //      ICMS_Sub := ((New_Custo * Perc_Sub) / 100);
        //Ratear icms_st somente para os itens que possuirem valor

        if QRel.FieldByName('VALOR_ICMS_ST').AsFloat > 0 then
          ICMS_Sub := (QRel.FieldByName('VALOR_ICMS_ST').AsFloat / QRel.FieldByName('QUANTIDADE').AsFloat);


    //  end;

      Cst_Entr := New_Custo + New_IPI + New_Frt + New_Desp + ICMS_Sub;

      if ICMS_Sub = 0 then
      begin
        New_PMZ      := ((New_Custo - ((New_Custo * QRel.FieldByName('ICMS_ENTRADA').AsFloat) / 100)) / (1 - ((QIndices.FieldByName('VALOR').AsFloat + Perc_IPI + Perc_Frt + Perc_Desp + Perc_Sub + QRel.FieldByName('ICMS_SAIDA').AsFloat) / 100)));
        New_Sugestao := ((New_Custo - ((New_Custo * QRel.FieldByName('ICMS_ENTRADA').AsFloat) / 100)) / (1 - ((QIndices.FieldByName('VALOR').AsFloat + Perc_IPI + Perc_Frt + Perc_Desp + Perc_Sub + QRel.FieldByName('ICMS_SAIDA').AsFloat + QRel.FieldByName('MARGEM_LUCRO').AsFloat) / 100)));
      end
      else
      begin

        New_PMZ      := (New_Custo / (1 - ((QIndices.FieldByName('VALOR').AsFloat + Perc_IPI + Perc_Frt + Perc_Desp + Perc_Sub + QRel.FieldByName('ICMS_SAIDA').AsFloat) / 100)));
        New_Sugestao := (New_Custo / (1 - ((QIndices.FieldByName('VALOR').AsFloat + Perc_IPI + Perc_Frt + Perc_Desp + Perc_Sub + QRel.FieldByName('ICMS_SAIDA').AsFloat + QRel.FieldByName('MARGEM_LUCRO').AsFloat) / 100)));

      end;  }

       Table_Temp.Append;
       Table_Temp.FieldByName('PRODUTO_ID').AsInteger     := QRel.FieldByName('PRODUTO_ID').AsInteger;
       Table_Temp.FieldByName('TRANSACAO_ID').AsInteger   := QRel.FieldByName('TRANSACAO_ID').AsInteger;
       Table_Temp.FieldByName('DESCRICAO').AsString       := Copy(QRel.FieldByName('DESCRICAO').AsString,1,40);
       Table_Temp.FieldByName('VALOR_COMPRA').AsFloat     := QRel.FieldByName('CUSTO_COMPRA').AsFloat;
       Table_Temp.FieldByName('DT_PRECO').AsDateTime      := QRel.FieldByName('DT_PRECO').AsDateTime;
       Table_Temp.FieldByName('PRECO_VAREJO').AsFloat     := QRel.FieldByName('PRECO_VAREJO').AsFloat;
       Table_Temp.FieldByName('PRECO_PRAZO').AsFloat      := QRel.FieldByName('PRECO_PRAZO').AsFloat;
       Table_Temp.FieldByName('MARGEM_LUCRO').AsFloat     := QRel.FieldByName('MARGEM_LUCRO').AsFloat;
       Table_Temp.FieldByName('MARGEM_SUGERIDA').AsFloat  := QRel.FieldByName('MARGEM_LUCRO').AsFloat;//RoundTo((((New_Sugestao - Cst_Entr) * 100) / Cst_Entr), -2);
       Table_Temp.FieldByName('PRECO_SUGERIDO').AsFloat   := QRel.FieldByName('PRECO_VAREJO').AsFloat;  //New_Sugestao;
       Table_Temp.FieldByName('DT_ENTRADA').AsDateTime    := QRel.FieldByName('DT_ENT_SAI').AsDateTime;
       Table_Temp.FieldByName('COD_BARRA').AsString       := QRel.FieldByName('COD_BARRA').AsString;
       Table_Temp.FieldByName('QUANTIDADE').AsFloat       := QRel.FieldByName('QUANTIDADE').AsFloat;
       Table_Temp.FieldByName('QUANT_MINIMA').AsFloat     := QRel.FieldByName('QUANT_MINIMA').AsFloat;
       Table_Temp.FieldByName('NOVO_PRECO').AsFloat       := QRel.FieldByName('PRECO_VAREJO').AsFloat;
       Table_Temp.FieldByName('NOVO_PRECO_PRAZO').AsFloat := QRel.FieldByName('PRECO_PRAZO').AsFloat;
       Table_Temp.FieldByName('FAMILIA_ID').AsInteger     := QRel.FieldByName('FAMILIA_ID').AsInteger;
       Table_Temp.FieldByName('NUM_DOC').AsString         := QRel.FieldByName('NUM_DOC').AsString;
       Table_Temp.FieldByName('TRIBUTOS').AsString        := QRel.FieldByName('TRIBUTOS').AsString;
       Table_Temp.FieldByName('CST_PIS_COFINS_SAI').AsString := QRel.FieldByName('CST_PIS_COFINS_SAI').AsString;
       Table_Temp.FieldByName('CST_PIS_COFINS_ENT').AsString := QRel.FieldByName('CST_PIS_COFINS_ENT').AsString;
       Table_Temp.FieldByName('ALIQ_PIS').AsFloat         := QRel.FieldByName('ALIQ_PIS').AsFloat;
       Table_Temp.FieldByName('ALIQ_COFINS').AsFloat      := QRel.FieldByName('ALIQ_COFINS').AsFloat;

       QSearch.sql.Clear;
       QSearch.Sql.Text   := 'SELECT CUSTO_COMPRA FROM TRANSITENS_CUSTO WHERE PRODUTO_ID = :PRODUTO_ID ORDER BY DT_EMISSAO DESC';
       QSearch.ParamByName('PRODUTO_ID').AsInteger := QRel.FieldByName('PRODUTO_ID').AsInteger;
       QSearch.Prepare;
       QSearch.Open;
       QSearch.Next;

       Table_Temp.FieldByName('ULTIMO_CUSTO').AsFloat       := QSearch.FieldByName('CUSTO_COMPRA').AsFloat;


       IF QRel.FieldByName('CONFERENCIA').AsInteger  = 1 tHEN
       Table_Temp.FieldByName('CONFERENCIA').AsString :='SIM'
       Else
       Table_Temp.FieldByName('CONFERENCIA').AsString :='NÃO';

       Table_Temp.Post;



     { Custo_Atual.Value    := Cst_Entr;
      Despesas.Value       := (QIndices.FieldByName('VALOR').AsFloat + QTabela.FieldByName('ICMS_SAIDA').AsFloat);
      Margem_Lucro.Value   := QTabela.FieldByName('MARGEM_LUCRO').AsFloat;
      PMZ.Value            := New_PMZ;
      Pr_Venda_Atual.Value := QProdutos.FieldByName('PRECO_VAREJO').AsFloat;
      Preco_Sugerido.Value := New_Sugestao;
      Pr_Prazo_Atual.Value := QProdutos.FieldByName('PRECO_PRAZO').AsFloat;
      Preco_Prazo_Sugerido.Value := New_Sugestao;
      Quantidade.Value     := QTabela.FieldByName('QUANTIDADE').AsFloat;
      Estoque_minimo.Value := QTabela.FieldByName('QUANT_MINIMA').AsFloat;

      try
        Margem_Atual.Value   := RoundTo((((Pr_Venda_Atual.Value - Custo_Atual.Value) * 100) / Custo_Atual.Value), -2);
      except

      end;

      if Tipo_Remarca.ItemIndex = 1 then
      Begin
        Novo_Preco.Value       := (Cst_Entr + ((Cst_Entr * QTabela.FieldByName('MARGEM_LUCRO').AsFloat) / 100));
        Novo_Preco_Prazo.Value := (Cst_Entr + ((Cst_Entr * QTabela.FieldByName('MARGEM_LUCRO').AsFloat) / 100));
      End
      else
      Begin
        Novo_Preco.Value       := New_Sugestao;
        Novo_Preco_Prazo.Value := New_Sugestao;
      End;  }


    finally

    end;
    QRel.Next;
  End;
  Inserindo := False;
  Table_Temp.Open;
  Table_Temp.First;

end;

procedure TFrmAtualiz_Precos_Entrada.FormDestroy(Sender: TObject);
begin
  Table_Temp.IndexName := '';
  Table_Temp.Close;

end;

procedure TFrmAtualiz_Precos_Entrada.ItensColExit(Sender: TObject);
begin

  if (Itens.SelectedField.FieldName = 'MARGEM_SUGERIDA') and (Table_Temp.State in [dsInsert, dsEdit])  then
  Begin
    Table_Temp.FieldByName('PRECO_SUGERIDO').AsFloat := TruncVal(Table_Temp.FieldByName('VALOR_COMPRA').AsFloat  + ((Table_Temp.FieldByName('VALOR_COMPRA').AsFloat * Table_Temp.FieldByName('MARGEM_SUGERIDA').AsFloat)/100),-2) ;
  End;

  if (Itens.SelectedField.FieldName = 'PRECO_SUGERIDO') and (Table_Temp.FieldByName('VALOR_COMPRA').AsFloat > 0) and (Table_Temp.State in [dsInsert, dsEdit])  then
  Begin
    Table_Temp.FieldByName('MARGEM_SUGERIDA').AsFloat := TruncVal(((Table_Temp.FieldByName('PRECO_SUGERIDO').AsFloat - Table_Temp.FieldByName('VALOR_COMPRA').AsFloat) * 100 ) /  Table_Temp.FieldByName('VALOR_COMPRA').AsFloat,-2);
  End;

  if (Itens.SelectedField.FieldName = 'PRECO_SUGERIDO') and (Table_Temp.State in [dsInsert, dsEdit]) Then
  Begin
    Table_Temp.Edit;
    Table_Temp.FieldByName('CONFERENCIA').AsString := 'SIM';
    Table_Temp.Post;
  End;

end;

procedure TFrmAtualiz_Precos_Entrada.ItensDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
 if (Table_temp.FieldByName('CONFERENCIA').AsString = 'SIM') Then
 Begin
   TDBGrid(Sender).Canvas.Font.Color := clGreen;
 End;

 if gdSelected in State then
  begin

    with (Sender as TDBGrid).Canvas do
    begin
      if  TDBGrid(Sender).Canvas.Font.Color = clRed Then
      Brush.Color := clAqua //$004080FF
      else if TDBGrid(Sender).Canvas.Font.Color = clPurple Then
      Brush.Color := clYellow //$004080FF
      Else if TDBGrid(Sender).Canvas.Font.Color = clGreen Then
      Brush.Color := clYellow //$004080FF
      Else if TDBGrid(Sender).Canvas.Font.Color = clMoneyGreen  Then
       Brush.Color := clWhite //$004080FF
      else
      Brush.Color := $004080FF;
      FillRect(Rect);
      Font.Style := [fsBold];
    End;

  end;
 TDBGrid(Sender).DefaultDrawDataCell(Rect, TDBGrid(Sender).Columns[DataCol].Field, State);

end;

procedure TFrmAtualiz_Precos_Entrada.ItensKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
InputString: String;
begin
  if Key = VK_F5 then
  begin
    InputString := InputBox('Localizar', 'Cód. de Barras:', '');

    if InputString <> '' then
    begin
       Table_Temp.locate('COD_BARRA',InputString,[loCaseInsensitive, loPartialKey]);
       Table_Temp.Filtered := False;
       Table_Temp.Filter   := 'COD_BARRA=' +QuotedStr(InputString + '*');
       Table_Temp.Filtered := True;
    end;
  end;

  if Key = VK_F7 then
  begin
    InputString := InputBox('Localizar', 'Descrição:', '');

    if InputString <> '' then
    begin
       Table_Temp.locate('DESCRICAO',InputString,[loCaseInsensitive, loPartialKey]);
       Table_Temp.Filtered := False;
       Table_Temp.Filter   := 'DESCRICAO =' +QuotedStr(UpperCase(InputString) + '*');
       Table_Temp.Filtered := True;
    end;
  end;

   if Key = VK_F8 then
   begin

    Begin
      InputString := InputBox('Localizar', 'Código do Produto:', '');
      if InputString <> '' then
      Begin
       InputString := UpperCase(InputString);
       Table_Temp.locate('PRODUTO_ID',InputString,[loCaseInsensitive, loPartialKey]);
       Table_Temp.Filtered := False;
       Table_Temp.Filter   := 'PRODUTO_ID=' +QuotedStr(InputString);
       Table_Temp.Filtered := True;
      End
      Else
      Table_Temp.Filtered := False;
    End;
   end;


  if ((Key = Vk_Up) or (Key = Vk_Down)) and (Table_Temp.State in [dsInsert, dsEdit]) then
    Key := 0;

end;

procedure TFrmAtualiz_Precos_Entrada.ItensKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #46 then
    Key := #44;

  if Key = #13 then
    Keybd_Event(VK_TAB, 0, 0, 0);

end;

procedure TFrmAtualiz_Precos_Entrada.ItensTitleClick(Column: TColumn);
begin
Table_TEMP.IndexFieldNames := Column.FieldName;
TaBle_Temp.Refresh;
end;

procedure TFrmAtualiz_Precos_Entrada.QProdutosBeforeDelete(DataSet: TDataSet);
begin
  abort;
end;

procedure TFrmAtualiz_Precos_Entrada.QProdutosNewRecord(DataSet: TDataSet);
begin
  QProdutos.Cancel;
end;

procedure TFrmAtualiz_Precos_Entrada.Table_TempAfterOpen(DataSet: TDataSet);
begin
TFloatField(Table_Temp.FieldByName('PRECO_VAREJO')).DisplayFormat     := '#,##0.000';
TFloatField(Table_Temp.FieldByName('PRECO_PRAZO')).DisplayFormat      := '#,##0.000';
TFloatField(Table_Temp.FieldByName('VALOR_COMPRA')).DisplayFormat     := '#,##0.000';
TFloatField(Table_Temp.FieldByName('MARGEM_SUGERIDA')).DisplayFormat  := '#,##0.00';
TFloatField(Table_Temp.FieldByName('MARGEM_LUCRO')).DisplayFormat     := '#,##0.00';
TFloatField(Table_Temp.FieldByName('PRECO_SUGERIDO')).DisplayFormat   := '#,##0.000';
TFloatField(Table_Temp.FieldByName('NOVO_PRECO')).DisplayFormat       := '#,##0.000';
TFloatField(Table_Temp.FieldByName('NOVO_PRECO_PRAZO')).DisplayFormat := '#,##0.000';


  Itens.Columns[0].Width := 69;
  Itens.Columns[1].Width := 242;
  Itens.Columns[2].Width := 75;
  Itens.Columns[3].Width := 70;
  Itens.Columns[4].Width := 75;
  Itens.Columns[5].Width := 75;
  Itens.Columns[6].Width := 80;
  Itens.Columns[7].Width := 70;
  Itens.Columns[8].Width := 80;
  Itens.Columns[9].Width := 85;
end;

procedure TFrmAtualiz_Precos_Entrada.Table_TempBeforePost(DataSet: TDataSet);
begin

 if (Itens.SelectedField.FieldName = 'MARGEM_SUGERIDA') and (Table_Temp.State in [dsInsert, dsEdit])  then
  Begin
     // Table_Temp.FieldByName('PRECO_SUGERIDO').AsFloat := Table_Temp.FieldByName('VALOR_COMPRA').AsFloat  + ((Table_Temp.FieldByName('VALOR_COMPRA').AsFloat * Table_Temp.FieldByName('MARGEM_SUGERIDA').AsFloat)/100) ;
  End;


 if not Inserindo then
 Begin
  TRY
     TRY
      QUpdate.Sql.Clear;
      QUpdate.Sql.Add('UPDATE PRODUTOS SET PRECO_VAREJO = :PRECO_VAREJO, PRECO_PRAZO = :PRECO_PRAZO, DT_PRECO = :DT_PRECO, ' +
                       'ULT_QUANTIDADE = :ULT_QUANTIDADE, MARGEM_LUCRO = :MARGEM_LUCRO, QUANT_MINIMA = :ESTOQUE_MINIMO, FUNCIONARIO_ID = :FUNCIONARIO_ID ' +
                                           'WHERE ' +
                                           '(PRODUTO_ID = :PRODUTO_ID) AND ((PRECO_VAREJO <> :PRECO_VAREJO) OR (PRECO_PRAZO <> :PRECO_PRAZO) )');

      QUpdate.ParamByName('PRECO_VAREJO').AsFloat   := Table_Temp.FieldByName('PRECO_SUGERIDO').AsFloat;
      QUpdate.ParamByName('PRECO_PRAZO').AsFloat    := Table_Temp.FieldByName('PRECO_SUGERIDO').AsFloat;
      QUpdate.ParamByName('DT_PRECO').AsDateTime    := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
      QUpdate.ParamByName('PRODUTO_ID').AsInteger   := Table_Temp.FieldByName('PRODUTO_ID').AsInteger;
      QUpdate.ParamByName('ULT_QUANTIDADE').AsFloat := Table_Temp.FieldByName('QUANTIDADE').AsFloat;
      QUpdate.ParamByName('ESTOQUE_MINIMO').AsFloat := Table_Temp.FieldByName('QUANT_MINIMA').AsFloat;
      QUpdate.ParamByName('MARGEM_LUCRO').AsFloat   := Table_Temp.FieldByName('MARGEM_SUGERIDA').AsFloat;
      QUpdate.ParamByName('FUNCIONARIO_ID').AsInteger :=  FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger;

      QUpdate.Prepare;
      QUpdate.ExecSql;

      IF Table_Temp.FieldByName('CONFERENCIA').AsString = 'SIM' Then
      Begin
      QUpdate.Sql.Clear;
      QUpdate.Sql.Text :='UPDATE TRANSITENS SET CONFERENCIA = 1 WHERE PRODUTO_ID = :PRODUTO_ID AND TRANSACAO_ID = :TRANSACAO_ID ';

      QUpdate.ParamByName('PRODUTO_ID').AsInteger     := Table_Temp.FieldByName('PRODUTO_ID').AsInteger;
      QUpdate.ParamByName('TRANSACAO_ID').AsInteger   := Table_Temp.FieldByName('TRANSACAO_ID').AsInteger;
      QUpdate.Prepare;
      QUpdate.ExecSql;
      End
      Else
      Begin
      QUpdate.Sql.Clear;
      QUpdate.Sql.Text :='UPDATE TRANSITENS SET CONFERENCIA = 0 WHERE PRODUTO_ID = :PRODUTO_ID AND TRANSACAO_ID = :TRANSACAO_ID ';

      QUpdate.ParamByName('PRODUTO_ID').AsInteger     := Table_Temp.FieldByName('PRODUTO_ID').AsInteger;
      QUpdate.ParamByName('TRANSACAO_ID').AsInteger   := Table_Temp.FieldByName('TRANSACAO_ID').AsInteger;
      QUpdate.Prepare;
      QUpdate.ExecSql;

      End;


     Except
       Application.MessageBox(Pchar('Erro de gravação Favor Verificar!' + #13 + 'Produto: ' +
       Table_Temp.FieldByName('PRODUTO_ID').AsString + #13 + 'Descricao: ' + Table_Temp.FieldByName('DESCRICAO').AsString) , PChar(Msg_Title), mb_IconInformation);
     END;



    Produto := Table_Temp.FieldByName('PRODUTO_ID').AsInteger;

    Table_Temp.FieldByName('DT_PRECO').AsDateTime := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;

    if Table_Temp.FieldByName('FAMILIA_ID').AsInteger > 0 then
    begin

      QUpdate.Sql.Clear;
      QUpdate.Sql.Add('UPDATE PRODUTOS SET PRECO_VAREJO = :PRECO_VAREJO, PRECO_PRAZO = :PRECO_PRAZO, DT_PRECO = :DT_PRECO, FUNCIONARIO_ID = :FUNCIONARIO_ID ' +
                                           'WHERE ' +
                                           '(FAMILIA_ID = :FAMILIA_ID)' +
                                           'AND (PRODUTO_ID <> :PRODUTO_ID)');

      QUpdate.ParamByName('PRECO_VAREJO').AsFloat := Table_Temp.FieldByName('PRECO_SUGERIDO').AsFloat;
      QUpdate.ParamByName('PRECO_PRAZO').AsFloat  := Table_Temp.FieldByName('PRECO_PRAZO').AsFloat;
      QUpdate.ParamByName('DT_PRECO').AsDateTime  := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
      QUpdate.ParamByName('FAMILIA_ID').AsInteger := Table_Temp.FieldByName('FAMILIA_ID').AsInteger;
      QUpdate.ParamByName('PRODUTO_ID').AsInteger := Table_Temp.FieldByName('PRODUTO_ID').AsInteger;
      QUpdate.ParamByName('FUNCIONARIO_ID').AsInteger := FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger;

      QUpdate.Prepare;
      QUpdate.ExecSql;

    end;

  FINALLY
   // Application.MessageBox('Preço Atualizados com sucesso!', PChar(Msg_Title), mb_IconInformation);
  END;
 End;
end;

end.
