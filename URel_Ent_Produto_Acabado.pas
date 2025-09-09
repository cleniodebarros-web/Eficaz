unit URel_Ent_Produto_Acabado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, rxCurrEdit, rxToolEdit, Buttons, DBCtrls,
  DB, IBCustomDataSet, IBQuery, QuickRpt, QRCtrls, RDprint, Printers, DBTables,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmRel_ent_produto_acabado = class(TForm)
    Label1: TLabel;
    Bevel1: TBevel;
    Dtmen: TDateEdit;
    Dtmai: TDateEdit;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    RDprint1: TRDprint;
    CheckBox1: TCheckBox;
    DBText1: TDBText;
    btnProduto: TSpeedButton;
    Produto: TCurrencyEdit;
    Label2: TLabel;
    DataProduto: TDataSource;
    QRel: TFDQuery;
    QProduto: TFDQuery;
    IQuery: TFDQuery;
    table_temp: TFDMemTable;
    procedure btnRetornaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnExecutaClick(Sender: TObject);
    procedure DtmenEnter(Sender: TObject);
    procedure Tipo_OrdemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnProdutoClick(Sender: TObject);
    procedure ProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RDprint1NewPage(Sender: TObject; Pagina: Integer);
    procedure SearchProduto;
    procedure ProdutoChange(Sender: TObject);
    procedure ProdutoExit(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    

  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  FrmRel_ent_produto_acabado: TFrmRel_ent_produto_acabado;
  Pagina, linha: Integer;
  Produto_Nome : String;

implementation

uses
  UData, UConsulta, UPrincipal;

{$R *.dfm}

procedure TFrmRel_ent_produto_acabado.SearchProduto;
begin

  if Produto.Value <> 0 then
  Begin
  QProduto.SQL.Clear;
  QProduto.SQL.Add('SELECT * FROM PRODUTOS');
  QProduto.SQL.Add('WHERE');
  QProduto.SQL.Add('(PRODUTO_ID = :PRODUTO_ID)');
  QProduto.SQL.Add('AND (EMPRESA_ID = :EMPRESA_ID)');
  QProduto.SQL.Add('AND STATUS = :STATUS');

  QProduto.ParamByName('PRODUTO_ID').AsInteger := StrToInt(Produto.Text);
  QProduto.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  QProduto.ParamByName('STATUS').AsString := 'A';

  QProduto.Prepare;
  QProduto.Open;
  End
  Else
  Begin
   {QProduto.SQL.Clear;
   QProduto.SQL.Add('SELECT DISTINCT PRODUTOS.PRODUTO_ID,  PRODUTOS.DESCRICAO');
   QProduto.SQL.Add('FROM PRODUTOS');
   QProduto.SQL.Add('INNER JOIN PRODUCAO_ITENS ON PRODUCAO_ITENS.PRODUTO_ID = PRODUTOS.PRODUTO_ID');
   QProduto.SQL.Add('WHERE EMPRESA_ID = :EMPRESA_ID');
   QProduto.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
   QProduto.Prepare;
   QProduto.Open;}
  End;

  {if QProduto.IsEmpty then
      btnExecuta.Enabled := False
     else
     tnExecuta.Enabled := True;}
end;

procedure TFrmRel_ent_produto_acabado.ProdutoChange(Sender: TObject);
begin
  if Produto.Value > 0 then
    SearchProduto;
end;

procedure TFrmRel_ent_produto_acabado.ProdutoExit(Sender: TObject);
begin
SearchProduto;
end;

procedure TFrmRel_ent_produto_acabado.btnExecutaClick(Sender: TObject);
var
Total_unitario, Total_Preco_Venda: Real;
begin
//125, 325
  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    if StrToInt(Produto.Text) = 0 then
    Begin

           if CheckBox1.Checked = True then
            Begin
            RDprint1.Impressora := HP;
            RDprint1.FonteTamanhoPadrao := S10cpp;
            End;

           RDprint1.TamanhoQteColunas:=130;
           RDprint1.OpcoesPreview.Preview     := True;
           RDprint1.MostrarProgresso          := True;
           RDprint1.Acentuacao                := SemAcento;
           RDprint1.TamanhoQteLinhas          := 1;
           RDprint1.Abrir;

            if linha > 66 then
            begin
              RDprint1.novapagina;
              Pagina := Pagina + 1;
            end;

            Pagina:= 1;
            Produto_Nome:= '';


          Table_Temp.First;
          while not Table_Temp.Eof do
          Begin
          QRel.Sql.Clear;
          QRel.Sql.Add('SELECT TRANSACOES.DT_MOVIMENTO, TRANSITENS.PRODUTO_ID INSUMO_ID , CAST(:LEGENDA AS VARCHAR(120)) AS PRODUTO , TRANSITENS.QUANTIDADE AS QTD,');
          QRel.Sql.Add('TRANSITENS.VR_UNITARIO, TRANSITENS.VR_TOTAL, TRANSITENS.DESCRICAO SUBITEM, PRODUTOS.PRECO_VAREJO PRECO_VENDA');
          QRel.Sql.Add('FROM TRANSITENS');
          QRel.Sql.Add('INNER JOIN TRANSACOES ON (TRANSACOES.TRANSACAO_ID = TRANSITENS.TRANSACAO_ID)');
          Qrel.SQL.Add('INNER JOIN PRODUTOS ON (TRANSITENS.PRODUTO_ID=PRODUTOS.PRODUTO_ID)');

          if StrToInt(Produto.Text) > 0 then
          QRel.Sql.Add('WHERE TRANSITENS.TRANSACAO_ID = (')
          Else
          QRel.Sql.Add('WHERE TRANSITENS.TRANSACAO_ID IN (');

          QRel.Sql.Add('SELECT (TRANSACOES.TRANSACAO_ID - 1)');
          QRel.Sql.Add('FROM TRANSACOES');
          QRel.Sql.Add('INNER JOIN TRANSITENS ON (TRANSACOES.TRANSACAO_ID = TRANSITENS.TRANSACAO_ID)');
          QRel.Sql.Add('WHERE TRANSACOES.CONDUTA = :CONDUTA AND TRANSACOES.DEPTO = :DEPTO');
          QRel.Sql.Add('AND TRANSACOES.DT_ENT_SAI BETWEEN :DT_INICIAL AND :DT_FINAL');

          if StrToInt(Produto.Text) > 0 then
          QRel.Sql.Add('AND TRANSITENS.PRODUTO_ID = :IDPRODUTO');

          QRel.Sql.Add(')');

          QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
          QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
          QRel.ParamByName('LEGENDA').AsString      := Table_Temp.FieldByName('DESCRICAO').AsString;

          if StrToInt(Produto.Text) > 0 then
          QRel.ParamByName('IDPRODUTO').AsInteger   := Table_Temp.FieldByName('PRODUTO_ID').AsInteger;

          QRel.ParamByName('CONDUTA').AsString      :=  '19';
          QRel.ParamByName('DEPTO').AsString        :=  '07';

          QRel.Prepare;
          QRel.Open;

           QRel.First;
           while not QRel.Eof do
           Begin
              if Table_Temp.FieldByName('DESCRICAO').AsString  <> Produto_Nome then
              Begin

              if Produto_nome <> '' then
              Begin
               RDprint1.LinhaH(linha, 68, 78, 0, false);
               RDprint1.LinhaH(linha, 116, 126, 0, false);
               Inc(linha);
               RDprint1.impval(linha,68,',###,##0.00', Total_unitario,[negrito]);
               RDprint1.impval(linha,116,',###,##0.00', Total_Preco_Venda ,[negrito]);

               Produto_Nome := Table_Temp.FieldByName('DESCRICAO').AsString;
               Total_unitario := 0;
               Total_Preco_Venda := 0;
              End;


              Inc(linha);
              Inc(linha);
              RDprint1.ImpF(linha, 01, Copy(Table_Temp.FieldByName('DESCRICAO').AsString, 1, 40), [negrito]);
              Produto_Nome := Table_Temp.FieldByName('DESCRICAO').AsString;
              Inc(linha);
              End;

            RDprint1.Imp(linha, 01, QRel.FieldByName('DT_MOVIMENTO').AsString);
            RDprint1.Imp(linha, 15, QRel.FieldByName('INSUMO_ID').AsString);
            RDprint1.Imp(linha, 25, QRel.FieldByName('SUBITEM').AsString);
            RDprint1.impval(linha,68,',###,##0.00', QRel.FieldByName('VR_UNITARIO').AsFloat,[]);
            RDprint1.impval(linha,92,',###,##0.00', QRel.FieldByName('QTD').AsFloat,[]);
            RDprint1.impval(linha,116,',###,##0.00', QRel.FieldByName('PRECO_VENDA').AsFloat,[]);

            Total_unitario := Total_unitario +  QRel.FieldByName('VR_UNITARIO').AsFloat;
            Total_Preco_Venda := Total_Preco_Venda + QRel.FieldByName('PRECO_VENDA').AsFloat;

            Inc(linha);
            QRel.Next;
           End;

            QRel.Close;


            if linha > 64 then
            begin
              RDprint1.novapagina;
              Pagina := Pagina + 1;
            end;



          Table_Temp.Next;
          End;



         RDprint1.LinhaH(linha, 68, 78, 0, false);
         RDprint1.LinhaH(linha, 116, 126, 0, false);
         Inc(linha);
         RDprint1.impval(linha,68,',###,##0.00', Total_unitario,[negrito]);
         RDprint1.impval(linha,116,',###,##0.00', Total_Preco_Venda ,[negrito]);

         Total_unitario := 0;
         Total_Preco_Venda := 0;

         Application.ProcessMessages;
         RDprint1.TamanhoQteLinhas:= 66;
         RDprint1.Fechar;


    End
    Else
    Begin
    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT TRANSACOES.DT_MOVIMENTO, TRANSITENS.PRODUTO_ID INSUMO_ID , CAST(:LEGENDA AS VARCHAR(120)) AS PRODUTO , TRANSITENS.QUANTIDADE AS QTD,');
    QRel.Sql.Add('TRANSITENS.VR_UNITARIO, TRANSITENS.VR_TOTAL, TRANSITENS.DESCRICAO SUBITEM, PRODUTOS.PRECO_VAREJO PRECO_VENDA');
    QRel.Sql.Add('FROM TRANSITENS');
    QRel.Sql.Add('INNER JOIN TRANSACOES ON (TRANSACOES.TRANSACAO_ID = TRANSITENS.TRANSACAO_ID)');
    Qrel.SQL.Add('INNER JOIN PRODUTOS ON (TRANSITENS.PRODUTO_ID=PRODUTOS.PRODUTO_ID)');

    if StrToInt(Produto.Text) > 0 then
    QRel.Sql.Add('WHERE TRANSITENS.TRANSACAO_ID = (')
    Else
    QRel.Sql.Add('WHERE TRANSITENS.TRANSACAO_ID IN (');

    QRel.Sql.Add('SELECT (TRANSACOES.TRANSACAO_ID - 1)');

    QRel.Sql.Add('FROM TRANSACOES');
    QRel.Sql.Add('INNER JOIN TRANSITENS ON (TRANSACOES.TRANSACAO_ID = TRANSITENS.TRANSACAO_ID)');
    QRel.SQL.Add('INNER JOIN PRODUTOS ON (TRANSITENS.PRODUTO_ID=PRODUTOS.PRODUTO_ID)');
    QRel.Sql.Add('WHERE TRANSACOES.CONDUTA = :CONDUTA AND TRANSACOES.DEPTO = :DEPTO');
    QRel.Sql.Add('AND TRANSACOES.DT_ENT_SAI BETWEEN :DT_INICIAL AND :DT_FINAL');

    if StrToInt(Produto.Text) > 0 then
     QRel.Sql.Add('AND TRANSITENS.PRODUTO_ID = :IDPRODUTO');

    QRel.Sql.Add(')');

    QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
    QRel.ParamByName('LEGENDA').AsString      := QProduto.FieldByName('DESCRICAO').AsString;
    QRel.ParamByName('CONDUTA').AsString      :=  '19';
    QRel.ParamByName('DEPTO').AsString        :=  '07';

    if Produto.Value > 0 then
    QRel.ParamByName('IDPRODUTO').AsInteger  := strToInt(Produto.Text);

    QRel.Prepare;
    QRel.Open;


    if QRel.IsEmpty then
      Application.MessageBox('Não há dados para os parâmetros informados', PChar(Msg_Title), mb_IconInformation)
    else
     Begin
       if CheckBox1.Checked = True then
         Begin
          RDprint1.Impressora := HP;
          RDprint1.FonteTamanhoPadrao := S10cpp;
         End;

        RDprint1.TamanhoQteColunas:=130;
        RDprint1.OpcoesPreview.Preview     := True;
        RDprint1.MostrarProgresso          := True;
        RDprint1.Acentuacao                := SemAcento;
        RDprint1.TamanhoQteLinhas          := 1;
        RDprint1.Abrir;


            if linha > 66 then
            begin
              RDprint1.novapagina;
              Pagina := Pagina + 1;
            end;

            Pagina:= 1;
            Produto_Nome:= '';

        while not QRel.Eof do
        Begin

        if QRel.FieldByName('PRODUTO').AsString  <> Produto_Nome then
        Begin
         if Produto.Value > 0 then
          Begin
          RDprint1.ImpF(linha, 01, Copy(QRel.FieldByName('PRODUTO').AsString, 1, 40), [negrito]);
          Inc(linha);
          Inc(linha);
          Produto_Nome := QRel.FieldByName('PRODUTO').AsString;
          End;
        End;

        RDprint1.Imp(linha, 01, QRel.FieldByName('DT_MOVIMENTO').AsString);
        RDprint1.Imp(linha, 15, QRel.FieldByName('INSUMO_ID').AsString);
        RDprint1.Imp(linha, 25, QRel.FieldByName('SUBITEM').AsString);
        RDprint1.impval(linha,68,',###,##0.00', QRel.FieldByName('VR_UNITARIO').AsFloat,[]);
        RDprint1.impval(linha,92,',###,##0.00', QRel.FieldByName('QTD').AsFloat,[]);
        RDprint1.impval(linha,116,',###,##0.00', QRel.FieldByName('PRECO_VENDA').AsFloat,[]);

        Total_unitario :=  Total_unitario + QRel.FieldByName('VR_UNITARIO').AsFloat;
        Total_Preco_Venda :=  Total_Preco_Venda+ QRel.FieldByName('PRECO_VENDA').AsFloat;

        Inc(linha);
        QRel.Next;
        End;

        RDprint1.LinhaH(linha, 68, 78, 0, false);
        RDprint1.LinhaH(linha, 116, 126, 0, false);
        Inc(linha);
        RDprint1.impval(linha,68,',###,##0.00', Total_unitario,[negrito]);
        RDprint1.impval(linha,116,',###,##0.00', Total_Preco_Venda ,[negrito]);

        Total_unitario := 0;
        Total_Preco_Venda := 0;



        Application.ProcessMessages;
        RDprint1.TamanhoQteLinhas:= 66;
        RDprint1.Fechar;
     End;
    End;



  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;

procedure TFrmRel_ent_produto_acabado.btnProdutoClick(Sender: TObject);
begin
 try
    Produto.Value := GetConsulta('ESTOQUE', 1, 0 , StrToInt(Produto.Text));
  except
    Produto.Value := GetConsulta('ESTOQUE', 0, 0, 0);
  end;
end;

procedure TFrmRel_ent_produto_acabado.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRel_ent_produto_acabado.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmRel_ent_produto_acabado.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    //Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmRel_ent_produto_acabado.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  //Table_Temp.Close;
  //Table_Temp.DeleteTable;
  Action := caFree;
end;

procedure TFrmRel_ent_produto_acabado.FormCreate(Sender: TObject);
var
Temp_Name: String;
begin
  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);

  Try
   With Table_Temp do
    begin

          Temp_Name    := Copy(TimeToStr(time), 1, 2) + Copy(TimeToStr(time), 4, 2) + Copy(TimeToStr(time), 7, 2);


          with FieldDefs do
          begin
            Clear;
            Add('PRODUTO_ID', ftInteger, 0, False);
            Add('DESCRICAO', ftString, 120, False);
          end;

          with IndexDefs do
          begin
            Clear;
            //Add('', 'ID', [ixPrimary, ixUnique]);
            //Add('TEMP', 'CONDUTA', [ixCaseInsensitive, ixDescending]);
          end;


          Open;
    end;
  Except
    Application.MessageBox('Ocorreu um erro ao criar um arquivo temporário', PChar(Msg_Title), mb_IconStop);
    exit;
  End;

  QProduto.Sql.Clear;
  QProduto.SQL.Add('SELECT DISTINCT PRODUTOS.PRODUTO_ID,  PRODUTOS.DESCRICAO');
  QProduto.SQL.Add('FROM PRODUTOS');
  QProduto.SQL.Add('INNER JOIN PRODUCAO_ITENS ON PRODUCAO_ITENS.PRODUTO_ID = PRODUTOS.PRODUTO_ID');
  QProduto.SQL.Add('WHERE EMPRESA_ID = :EMPRESA_ID ORDER BY DESCRICAO');
  QProduto.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  QProduto.Prepare;
  QProduto.Open;

  while not QProduto.Eof do
  Begin

  Table_Temp.Append;
  Table_Temp.FieldByName('PRODUTO_ID').AsString  := QProduto.FieldByName('PRODUTO_ID').AsString;
  Table_Temp.FieldByName('DESCRICAO').AsString   := QProduto.FieldByName('DESCRICAO').AsString;

  Table_Temp.Post;
  Application.ProcessMessages;

  QProduto.Next;
  End;


  QProduto.SQL.Clear;
  QProduto.Close;


end;


procedure TFrmRel_ent_produto_acabado.FormDestroy(Sender: TObject);
begin
    Table_Temp.Close;

end;


procedure TFrmRel_ent_produto_acabado.ProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if (Key = Vk_F7) and (Sender = Produto) then
    btnProdutoClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;



procedure TFrmRel_ent_produto_acabado.RDprint1NewPage(Sender: TObject;
  Pagina: Integer);
begin
RDprint1.Imp(01, 01, FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString);
    RDprint1.ImpDir(01, (length(FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString)), 130, 'Sistema de Automação de empresas Eficaz', []);
    RDprint1.Imp(02, 01, 'Data/Hora: ' + DateToStr(date) + ' - ' + TimeToStr(now));
    RDprint1.impDir(02, 80, 130, 'Página: ' + IntToStr(Pagina), []);
    RDprint1.impC(03, 66, '*** ENTRADA DE PRODUTO ACABADO ***',[negrito]);
    RDprint1.imp(04, 01, 'Período:'+ datetoStr(dtmen.date) + ' à ' + datetoStr(dtmai.date));
    RDprint1.LinhaH(05,01,130,0,false);
    RDprint1.Imp(06, 08, 'Data');
    RDprint1.Imp(06, 15, 'Código');
    RDprint1.Imp(06, 25, 'Descrição');
    RDprint1.Imp(06, 70, 'Vr.Unitário');
    RDprint1.Imp(06, 96, 'Quantidade');
    RDprint1.Imp(06, 116,'Preço Venda');
    RDprint1.LinhaH(07,01,130,0,false);
    linha := 09;
end;

procedure TFrmRel_ent_produto_acabado.Tipo_OrdemKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

end.
