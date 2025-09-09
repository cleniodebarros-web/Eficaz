unit URel_Devolucao_Entrada_Saida;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, StdCtrls, Buttons, ExtCtrls, DBCtrls,
  rxCurrEdit, Mask, rxToolEdit, QRCtrls, QuickRpt, RDprint, Printers,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmRel_Devolucao_Entrada_Saida = class(TForm)
    Label1: TLabel;
    Dtmen: TDateEdit;
    Dtmai: TDateEdit;                        
    Label2: TLabel;
    Cliente: TCurrencyEdit;
    btnCliente: TSpeedButton;
    DBText1: TDBText;
    Bevel1: TBevel;
    btnExecuta: TBitBtn;
    btnRetorna: TBitBtn;
    DataCliente: TDataSource;
    Rel_Vendas_Mensal_Analitico: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    QRSysData1: TQRSysData;
    Cabec: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    QRLabel7: TQRLabel;
    QRShape2: TQRShape;
    QRLabel10: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRDBText19: TQRDBText;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    QRDBText3: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRShape3: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape4: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel14: TQRLabel;
    QRBand2: TQRBand;
    QRLabel11: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRShape5: TQRShape;
    QRDBText5: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRShape6: TQRShape;
    QRLabel19: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText18: TQRDBText;
    QRMemo2: TQRMemo;
    QRBand3: TQRBand;
    QRSysData3: TQRSysData;
    QRExpr2: TQRExpr;
    QRLabel31: TQRLabel;
    QRLabel23: TQRLabel;
    QRDBText20: TQRDBText;
    Rel_Vendas_Mensal_Sintetico: TQuickRep;
    QRBand4: TQRBand;
    QRDBText21: TQRDBText;
    QRSysData4: TQRSysData;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRLabel26: TQRLabel;
    QRSysData5: TQRSysData;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRDBText22: TQRDBText;
    QRLabel39: TQRLabel;
    QRBand5: TQRBand;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    SummaryBand1: TQRBand;
    QRShape9: TQRShape;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRSysData6: TQRSysData;
    Label5: TLabel;
    Tipo: TComboBox;
    RDprint1: TRDprint;
    QVencimento: TFDQuery;
    QParcelas: TFDQuery;
    QItens: TFDQuery;
    QCliente: TFDQuery;
    QRel: TFDQuery;
    IQuery: TFDQuery;
    QCfop: TFDQuery;
    Label3: TLabel;
    tp_relatorio: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnClienteClick(Sender: TObject);
    procedure btnRetornaClick(Sender: TObject);
    procedure DtmenEnter(Sender: TObject);
    procedure ClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ClienteChange(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure RDprint1NewPage(Sender: TObject; Pagina: Integer);
  private
  procedure MoveSelected(List: TCustomListBox; Items: TStrings);
  procedure SetItem(List: TListBox; Index: Integer);
  function GetFirstSelection(List: TCustomListBox): Integer;
    { Private declarations }
  public
    { Public declarations }
    procedure SearchCliente;


  end;

var
  FrmRel_Devolucao_Entrada_Saida: TFrmRel_Devolucao_Entrada_Saida;
  linha, pagina: integer;
  Total, Subtotal, Total_IPI, Total_Frete, Total_Subtotal, Total_Desconto, Total_Acrescimo, Total_Geral, Soma: Real;
  contaQuebra: string;

implementation

uses
  UConsulta, UPrincipal, UData;

{$R *.dfm}

procedure TFrmRel_Devolucao_Entrada_Saida.MoveSelected(List: TCustomListBox; Items: TStrings);
var
I: Integer;
begin
  for I := List.Items.Count - 1 downto 0 do
  begin
    if List.Selected[I] then
    begin
      Items.AddObject(List.Items[I], List.Items.Objects[I]);
      List.Items.Delete(I);
    end;
  end;
end;

function TFrmRel_Devolucao_Entrada_Saida.GetFirstSelection(List: TCustomListBox): Integer;
begin
  for Result := 0 to List.Items.Count - 1 do
  begin
    if List.Selected[Result] then
      exit;
  end;
  Result := LB_ERR;
end;

procedure TFrmRel_Devolucao_Entrada_Saida.SetItem(List: TListBox; Index: Integer);
var
MaxIndex: Integer;
begin
  with List do
  begin
    SetFocus;
    MaxIndex := List.Items.Count - 1;

    if Index = LB_ERR then
      Index := 0
    else if Index > MaxIndex then
      Index := MaxIndex;

    Selected[Index] := True;
  end;

end;




procedure TFrmRel_Devolucao_Entrada_Saida.SearchCliente;
begin
  try
    QCliente.Sql.Clear;
    QCliente.Sql.Add('SELECT * FROM CLIENTES');
    QCliente.Sql.Add('WHERE');
    QCliente.Sql.Add('(CLIENTE_ID = :CLIENTE_ID)');
    QCliente.Sql.Add('AND (STATUS = :STATUS)');

    QCliente.ParamByName('CLIENTE_ID').AsInteger := StrToInt(Cliente.Text);
    QCliente.ParamByName('STATUS').AsString      := 'A';

    QCliente.Prepare;
    QCliente.Open;
  except

  end;
end;

procedure TFrmRel_Devolucao_Entrada_Saida.btnClienteClick(Sender: TObject);
begin
  try
    Cliente.Value := GetConsulta('CLIENTES', 0, 0, StrToInt(Cliente.Text));
  except
    Cliente.Value := GetConsulta('CLIENTES', 0, 0, 0);
  end;
end;

procedure TFrmRel_Devolucao_Entrada_Saida.btnExecutaClick(Sender: TObject);
var
 Nome_Cliente, Primeiro,Parametro : string;
 Ag_IPI, Ag_Frete, Ag_Subtotal, Ag_Desconto, Ag_Acrescimo, Ag_Geral, Total_qtd, Total_vr, markup,vr_lucro : Real;
 I:Integer;
begin
// 229, 325
  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    QRel.Sql.Clear;

    QRel.SQL.Text :='SELECT TRANSACOES.*, FUNCIONARIOS.NOME, TRIM(CLIENTES.NOME) NOME_CLIENTE ' +
                    'FROM TRANSACOES ' +
                    'LEFT JOIN FUNCIONARIOS ' +
                    'ON (TRANSACOES.VENDEDOR_ID = FUNCIONARIOS.FUNCIONARIO_ID) '+
                    'LEFT JOIN CLIENTES ' +
                    'ON (TRANSACOES.CLIENTE_ID = CLIENTES.CLIENTE_ID) ' +
                    'WHERE TRANSACOES.DEPTO = ''10'' ';

    if Tipo.Text ='Devolução de Entrada' then
    begin
      QRel.SQL.Text := QRel.SQL.Text  +
                      'AND (TRANSACOES.CONDUTA = ''01'') ';
    end
    else
    begin
      QRel.SQL.Text := QRel.SQL.Text  +
                      'AND (TRANSACOES.CONDUTA = ''02'') ';
    end;

    QRel.SQL.Text := QRel.SQL.Text  +
                    'AND DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL ' +
                    'AND TRANSACOES.EMPRESA_ID = :EMPRESA_ID ' +
                    'AND TRANSACOES.TPCTB = :TPCTB ' +
                    'AND TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS) ';


    QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
    QRel.ParamByName('TPCTB').AsString := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    QRel.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;

    QRel.Prepare;
    QRel.Open;

    QRLabel21.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;
    QRLabel25.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;


    if QRel.IsEmpty then
      Application.MessageBox('Não há dados para os parâmetros informados', PChar(Msg_Title), mb_IconInformation)
    else
   begin
      RDprint1.Orientacao:= poLandscape;
      RDprint1.TamanhoQteColunas:=132;
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

      Pagina          := 1;
      Total_IPI       := 0;
      Total_Frete     := 0;
      Total_Subtotal  := 0;
      Total_Desconto  := 0;
      Total_Acrescimo := 0;
      Total_Geral     := 0;
      Total_qtd       := 0;
      Total_vr        := 0;


      while not Qrel.Eof do
      begin

       if Tp_Relatorio.Text = 'Sintético' Then
       Begin

        RDprint1.ImpF(linha,1, Qrel.FieldByName('DT_TRANS').AsString,[comp12]);
        RDprint1.ImpF(linha,10, Copy(Qrel.FieldByName('NOME_CLIENTE').AsString, 1, 30),[comp12]);
        RDprint1.Imp(linha,38, Qrel.FieldByName('NUM_DOC').AsString);
        RDprint1.Imp(linha, 52, Qrel.FieldByName('SERIE').AsString);
        RDprint1.Imp(linha,59, Qrel.FieldByName('MODELO').AsString);
        RDprint1.ImpVal(linha,64,',#,##0.00',Qrel.FieldByName('VR_IPI').AsFloat,[]);
        RDprint1.ImpVal(linha,76,',#,##0.00',Qrel.FieldByName('VR_FRETE').AsFloat,[]);
        RDprint1.ImpVal(linha,89,',#,##0.00',(Qrel.FieldByName('VALOR').AsFloat + Qrel.FieldByName('VR_DESCONTO').AsFloat - Qrel.FieldByName('VR_ACRESCIMO').AsFloat) ,[]);
        RDprint1.ImpVal(linha,100,',#,##0.00',Qrel.FieldByName('VR_DESCONTO').AsFloat,[]);
        RDprint1.ImpVal(linha,111,',#,##0.00',Qrel.FieldByName('VR_ACRESCIMO').AsFloat,[]);
        RDprint1.ImpVal(linha,122,',#,##0.00',Qrel.FieldByName('VALOR').AsFloat,[]);


        Total_IPI := Total_IPI + Qrel.FieldByName('VR_IPI').AsFloat;
        Total_Frete := Total_Frete + Qrel.FieldByName('VR_FRETE').AsFloat;
        Total_Subtotal := Total_Subtotal + Qrel.FieldByName('VALOR').AsFloat + Qrel.FieldByName('VR_DESCONTO').AsFloat - Qrel.FieldByName('VR_ACRESCIMO').AsFloat ;
        Total_Desconto := Total_Desconto + Qrel.FieldByName('VR_DESCONTO').AsFloat;
        Total_Acrescimo := Total_Acrescimo + Qrel.FieldByName('VR_ACRESCIMO').AsFloat;
        Total_Geral := Total_Geral + Qrel.FieldByName('VALOR').AsFloat;

        if linha > 65 then
        begin
          RDprint1.novapagina;
          Pagina := Pagina + 1;
        end;

        Inc(linha);
       End
       Else
       Begin

         QItens.Sql.Clear;
         QItens.Sql.Text := 'SELECT * FROM TRANSITENS WHERE TRANSACAO_ID = :TRANSACAO_ID ORDER BY DESCRICAO';
         QItens.ParamByName('TRANSACAO_ID').AsInteger := QRel.FieldByName('TRANSACAO_ID').AsInteger;
         QItens.Prepare;
         QItens.Open;

         While not QItens.eof do
         Begin
          IQuery.Sql.Clear;
          IQuery.Sql.Text := 'SELECT CUSTO_COMPRA FROM PRODUTOS WHERE PRODUTO_ID = :PRODUTO_ID';
          IQuery.ParamByName('PRODUTO_ID').AsInteger := QItens.FieldByName('PRODUTO_ID').AsInteger;
          IQuery.Prepare;
          IQuery.Open;


          RDprint1.ImpF(linha,1, Qrel.FieldByName('DT_TRANS').AsString,[comp12]);
          RDprint1.Imp(linha,10, Qrel.FieldByName('NUM_DOC').AsString);
          RDprint1.Imp(linha,20, QItens.FieldByName('PRODUTO_ID').AsString);
          RDprint1.ImpF(linha,28, Copy(QItens.FieldByName('DESCRICAO').AsString, 1, 60),[comp12]);
          RDprint1.ImpVal(linha,88,',#,##0.00',IQuery.FieldByName('CUSTO_COMPRA').AsFloat,[]);
          RDprint1.ImpVal(linha,99,',#,##0.00',QItens.FieldByName('QUANTIDADE').AsFloat,[]);
          RDprint1.ImpVal(linha,110,',#,##0.00',QItens.FieldByName('VR_UNITARIO').AsFloat,[]);
          RDprint1.ImpVal(linha,121,',#,##0.00',QItens.FieldByName('VR_TOTAL').AsFloat,[]);
          Inc(linha);
          QItens.Next;
         End;

         if linha > 65 then
        begin
          RDprint1.novapagina;
          Pagina := Pagina + 1;
        end;

        RDprint1.LinhaH(linha,1,132,0,false);
        Inc(linha);

       End;

       // Inc(linha);
        Qrel.next;

      end;

      if linha > 65 then
      begin
        RDprint1.novapagina;
        Pagina := Pagina + 1;
      end;

      if Tp_Relatorio.Text = 'Sintético' Then
      Begin
       //rodape com valores totais
       RDprint1.LinhaH(linha,64,132,0,false);
       Inc(linha);
       RDprint1.ImpVal(linha,64,',#,##0.00',Total_IPI,[negrito]);
       RDprint1.ImpVal(linha,76,',#,##0.00',Total_Frete,[negrito]);
       RDprint1.ImpVal(linha,91,',#,##0.00',Total_Subtotal,[negrito]);
       RDprint1.ImpVal(linha,102,',#,##0.00',Total_Desconto,[negrito]);
       RDprint1.ImpVal(linha,111,',#,##0.00',Total_Acrescimo,[negrito]);
       RDprint1.ImpVal(linha,123,',#,##0.00',Total_Geral,[negrito]);

       Inc(Linha);
       Inc(Linha);

       if linha > 65 then
        begin
          RDprint1.novapagina;
          Pagina := Pagina + 1;
        end;
      End
      Else
      Begin

       //RDprint1.LinhaH(linha,1,132,0,false);
       //Inc(linha);
       {RDprint1.ImpVal(linha,64,',#,##0.00',Total_IPI,[negrito]);
       RDprint1.ImpVal(linha,76,',#,##0.00',Total_Frete,[negrito]);
       RDprint1.ImpVal(linha,91,',#,##0.00',Total_Subtotal,[negrito]);
       RDprint1.ImpVal(linha,102,',#,##0.00',Total_Desconto,[negrito]);
       RDprint1.ImpVal(linha,111,',#,##0.00',Total_Acrescimo,[negrito]);
       RDprint1.ImpVal(linha,123,',#,##0.00',Total_Geral,[negrito]);

       Inc(Linha);
       Inc(Linha);
       }
       if linha > 65 then
        begin
          RDprint1.novapagina;
          Pagina := Pagina + 1;
        end;

      End;

      Application.ProcessMessages;
      RDprint1.TamanhoQteLinhas:= 66;
      RDprint1.Fechar;

   end;

  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;

procedure TFrmRel_Devolucao_Entrada_Saida.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRel_Devolucao_Entrada_Saida.ClienteChange(Sender: TObject);
begin
  SearchCliente;
end;

procedure TFrmRel_Devolucao_Entrada_Saida.ClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = Cliente) then
    btnClienteClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmRel_Devolucao_Entrada_Saida.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRMemo2.Lines.Clear;

  QItens.Sql.Clear;
  QItens.Sql.Add('SELECT * FROM TRANSITENS');
  QItens.Sql.Add('WHERE');
  QItens.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

  QItens.ParamByName('TRANSACAO_ID').AsInteger := QRel.FieldByName('TRANSACAO_ID').AsInteger;

  QItens.Prepare;
  QItens.Open;

  if QRel.FieldByName('COND_PAGTO').AsString = 'A PRAZO' then
  begin
    QParcelas.Sql.Clear;
    QParcelas.Sql.Add('SELECT * FROM TRANSPARCELAS');
    QParcelas.Sql.Add('WHERE');
    QParcelas.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
    QParcelas.Sql.Add('AND (TIPO_TRANSACAO = :TIPO_TRANSACAO)');

    QParcelas.ParamByName('TRANSACAO_ID').AsInteger  := QRel.FieldByName('TRANSACAO_ID').AsInteger;
    QParcelas.ParamByName('TIPO_TRANSACAO').AsString := 'T';

    QParcelas.Prepare;
    QParcelas.Open;

    if not QParcelas.IsEmpty then
    begin
      QRMemo2.Lines.Clear;
      QRMemo2.Lines.Add('Parcelamento');
      QRMemo2.Lines.Add('============');

      QParcelas.First;
      while not QParcelas.Eof do
      begin
        if QParcelas.FieldByName('VALOR').AsFloat = 0 then
        begin
          QVencimento.Sql.Clear;
          QVencimento.Sql.Add('SELECT * FROM TRANSACOES');
          QVencimento.Sql.Add('WHERE');
          QVencimento.Sql.Add('(SAIDA_ID = :SAIDA_ID)');

          QVencimento.ParamByName('SAIDA_ID').AsInteger := QRel.FieldByName('TRANSACAO_ID').AsInteger;

          QVencimento.Prepare;
          QVencimento.Open;

          if QVencimento.FieldByName('DT_ENT_SAI').AsDateTime > QParcelas.FieldByName('DT_VENCIMENTO').AsDateTime then
            QRMemo2.Lines.Add('Venc.: ' + QParcelas.FieldByName('DT_VENCIMENTO').AsString + ' - ' +
                              FormatFloat('#,##0.00', QVencimento.FieldByName('VALOR_PARCELA').AsFloat) + ' Pagto.: ' +
                              QVencimento.FieldByName('DT_ENT_SAI').AsString + ' - ' + FormatFloat('#,##0.00', QVencimento.FieldByName('VALOR').AsFloat) +
                              ' Atr.: ' + FloatToStr((QVencimento.FieldByName('DT_ENT_SAI').AsDateTime - QParcelas.FieldByName('DT_VENCIMENTO').AsDateTime)) + ' dias')
          else
            QRMemo2.Lines.Add('Venc.: ' + QParcelas.FieldByName('DT_VENCIMENTO').AsString + ' - ' +
                              FormatFloat('#,##0.00', QVencimento.FieldByName('VALOR_PARCELA').AsFloat) + ' Pagto.: ' +
                              QVencimento.FieldByName('DT_ENT_SAI').AsString + ' - ' + FormatFloat('#,##0.00', QVencimento.FieldByName('VALOR').AsFloat));
        end
        else
        begin
          if QParcelas.FieldByName('DT_VENCIMENTO').AsDateTime <= FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime then
            QRMemo2.Lines.Add('Venc.: ' + QParcelas.FieldByName('DT_VENCIMENTO').AsString + ' - ' +
                              FormatFloat('#,##0.00', QParcelas.FieldByName('VALOR').AsFloat) +
                              ' Atr.: ' + FloatToStr((FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime - QParcelas.FieldByName('DT_VENCIMENTO').AsDateTime)) + ' dias')
          else
            QRMemo2.Lines.Add('Venc.: ' + QParcelas.FieldByName('DT_VENCIMENTO').AsString + ' - ' + FormatFloat('#,##0.00', QParcelas.FieldByName('VALOR').AsFloat));
        end;

        Application.ProcessMessages;

        QParcelas.Next;
      end;
    end;
  end;
end;

procedure TFrmRel_Devolucao_Entrada_Saida.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmRel_Devolucao_Entrada_Saida.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    //Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmRel_Devolucao_Entrada_Saida.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmRel_Devolucao_Entrada_Saida.FormCreate(Sender: TObject);
begin
  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);
end;

procedure TFrmRel_Devolucao_Entrada_Saida.RDprint1NewPage(Sender: TObject; Pagina: Integer);
begin
  RDprint1.Imp(01, 01, FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString);
  RDprint1.ImpDir(01, (length(FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString)), 132, 'Sistema de Automação de empresas Eficaz', []);
  RDprint1.Imp(02, 01, 'Data/Hora: ' + DateToStr(date) + ' - ' + TimeToStr(now));
  RDprint1.impDir(02, 80, 132, 'Página: ' + IntToStr(Pagina), []);

  IF TP_RELATORIO.text = 'Sintético' Then
  RDprint1.impC(03, 56, '*** '+Tipo.Text+' ***',[negrito])
  Else
  RDprint1.impC(03, 56, '*** '+Tipo.Text+' Itens ***',[negrito]);

  RDprint1.imp(04, 01, 'Período:'+ datetoStr(dtmen.date) + ' à ' + datetoStr(dtmai.date));
  //RDprint1.Imp(04, 50, 'Cliente');
  RDprint1.LinhaH(05,01,132,0,false);

 IF TP_RELATORIO.text = 'Sintético' Then
 Begin

  RDprint1.Imp(06, 01, 'Data');
  RDprint1.Imp(06, 10, 'Cliente');
  RDprint1.Imp(06, 38, 'Nº Nota');
  RDprint1.Imp(06, 52, 'Série');
  RDprint1.Imp(06, 59, 'Modelo');
  RDprint1.Imp(06, 69, 'Vr IPI');
  RDprint1.Imp(06, 78, 'Vr. Frete');
  RDprint1.Imp(06, 91, 'Sub-Total');
  RDprint1.Imp(06, 103, 'Desconto');
  RDprint1.Imp(06, 113, 'Acréscimo');
  RDprint1.Imp(06, 128, 'Total');
  RDprint1.LinhaH(07,01,132,0,false);
  linha := 08;
 End
 Else
 Begin
  RDprint1.Imp(06, 01, 'Data');
  RDprint1.Imp(06, 10, 'Documento');
  RDprint1.Imp(06, 20, 'Código');
  RDprint1.Imp(06, 29, 'Descrição Produto');
  RDprint1.Imp(06, 88, 'Custo Compra');
  RDprint1.Imp(06, 104, 'Quant.');
  RDprint1.Imp(06, 113, 'Vr. Unit.');
  RDprint1.Imp(06, 123, 'Vr. Total');
  //RDprint1.Imp(06, 103, 'Desconto');
  //RDprint1.Imp(06, 113, 'Acréscimo');
  //RDprint1.Imp(06, 128, 'Total');
  RDprint1.LinhaH(07,01,132,0,false);
  linha := 08;
 End;
end;

end.
