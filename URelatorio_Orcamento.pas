unit URelatorio_Orcamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, rxToolEdit, DB, IBCustomDataSet, IBQuery,
  QuickRpt, QRCtrls, Buttons, DBCtrls, rxCurrEdit, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,QRExport;

type
  TFrmRelatorio_Orcamentos = class(TForm)
    Label1: TLabel;
    Dtmen: TDateEdit;
    Dtmai: TDateEdit;
    Bevel1: TBevel;
    Label2: TLabel;
    Ordem: TComboBox;
    Fim: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    QRSysData1: TQRSysData;
    Cabec: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    QRLabel7: TQRLabel;
    QRShape2: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRBand1: TQRBand;
    QRShape4: TQRShape;
    QRLabel20: TQRLabel;
    QRExpr1: TQRExpr;
    QRGroup1: TQRGroup;
    QRBand2: TQRBand;
    QRShape3: TQRShape;
    QRLabel2: TQRLabel;
    QRExpr4: TQRExpr;
    QRDBText3: TQRDBText;
    btnExecuta: TBitBtn;
    btnRetorna: TBitBtn;
    QRDBText7: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel5: TQRLabel;
    Label3: TLabel;
    Cliente: TCurrencyEdit;
    btnCliente: TSpeedButton;
    DBText1: TDBText;
    DataCliente: TDataSource;
    Label4: TLabel;
    Produto: TCurrencyEdit;
    btnProduto: TSpeedButton;
    DBText2: TDBText;
    DataProduto: TDataSource;
    Label5: TLabel;
    Status: TComboBox;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel11: TQRLabel;
    QRel: TFDQuery;
    QCliente: TFDQuery;
    QProduto: TFDQuery;
    Label6: TLabel;
    Funcionario_id: TCurrencyEdit;
    btnFuncionario: TSpeedButton;
    DBText3: TDBText;
    QFuncionario: TFDQuery;
    DataFuncionario: TDataSource;
    QRLabel12: TQRLabel;
    chk_agrupar: TCheckBox;
    QRDBText13: TQRDBText;
    AGRUPADO: TQuickRep;
    QRBand3: TQRBand;
    QRSysData3: TQRSysData;
    QRLabel14: TQRLabel;
    QRSysData4: TQRSysData;
    QRLabel15: TQRLabel;
    QRShape5: TQRShape;
    QRLabel18: TQRLabel;
    QRShape6: TQRShape;
    QRLabel19: TQRLabel;
    QRLabel21: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRBand4: TQRBand;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRBand5: TQRBand;
    QRShape7: TQRShape;
    QRLabel28: TQRLabel;
    QRExpr5: TQRExpr;
    QRLabel29: TQRLabel;
    QRExpr6: TQRExpr;
    QRLabel30: TQRLabel;
    QRExpr7: TQRExpr;
    QRBand6: TQRBand;
    QRShape8: TQRShape;
    QRLabel31: TQRLabel;
    QRExpr8: TQRExpr;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRDBText21: TQRDBText;
    QRLabel25: TQRLabel;
    QRLabel16: TQRLabel;
    chk_exportar: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure OrdemKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRetornaClick(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure DtmenEnter(Sender: TObject);
    procedure btnClienteClick(Sender: TObject);
    procedure ClienteChange(Sender: TObject);
    procedure ClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnProdutoClick(Sender: TObject);
    procedure ProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ProdutoExit(Sender: TObject);
    procedure Funcionario_idChange(Sender: TObject);
    procedure Funcionario_idKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnFuncionarioClick(Sender: TObject);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
  procedure SearchCliente;
    { Public declarations }
    procedure SearchFuncionario;
  end;

var
  FrmRelatorio_Orcamentos: TFrmRelatorio_Orcamentos;

implementation

uses
  UData, UPrincipal,UConsulta;

{$R *.dfm}

procedure TFrmRelatorio_Orcamentos.SearchFuncionario;
begin
  QFuncionario.Close;

  QFuncionario.ParamByName('FUNCIONARIO_ID').AsInteger   := StrToInt(FUNCIONARIO_ID.Text);

  QFuncionario.Prepare;
  QFuncionario.Open;

  if QFuncionario.IsEmpty then
    btnExecuta.Enabled := False
  else
    btnExecuta.Enabled := True;
end;

procedure TFrmRelatorio_Orcamentos.SearchCliente;
begin

  QCliente.Close;
  QCliente.ParamByName('Cliente_ID').AsInteger := StrToInt(Cliente.Text);
  QCliente.Prepare;
  QCliente.Open;

end;


procedure TFrmRelatorio_Orcamentos.btnExecutaClick(Sender: TObject);
begin
// 125
// 325

  try

    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    QRel.Sql.Clear;

    if chk_agrupar.Checked then
    begin
       QRel.Sql.Add('SELECT PRODUTO_ID, DESCRICAO, COD_BARRA, VR_UNITARIO, ');
       QRel.Sql.Add('SUM(QTD_VENDA) QTD_VENDA, SUM(VR_TOTAL) VR_TOTAL, STATUS FROM(');
    end;


    QRel.Sql.Add('SELECT FUNCIONARIOS.NOME VENDEDOR,ORCITENS.PRODUTO_ID,PRODUTOS.DESCRICAO,ORCITENS.VR_UNITARIO,  PRODUTOS.COD_BARRA, ORCAMENTOS.NOME CLIENTES,ORCAMENTOS.VR_DESCONTO,ORCAMENTOS.VR_ACRESCIMO, SUM(ORCITENS.QUANTIDADE) QTD_VENDA, ' +
                 'SUM(ORCITENS.VR_TOTAL - ORCITENS.VR_DESCONTO) VR_TOTAL, ORCAMENTOS.DT_ORCAMENTO,ORCAMENTOS.STATUS,ORCAMENTOS.ORCAMENTO_ID,ORCAMENTOS.TRANSACAO_ID');
    QRel.Sql.Add('FROM ORCITENS');
    QRel.Sql.Add('INNER JOIN ORCAMENTOS');
    QRel.Sql.Add('ON (ORCITENS.ORCAMENTO_ID = ORCAMENTOS.ORCAMENTO_ID)');
    QRel.Sql.Add('INNER JOIN PRODUTOS');
    QRel.Sql.Add('ON (ORCITENS.PRODUTO_ID = PRODUTOS.PRODUTO_ID)');
    QRel.Sql.Add('LEFT JOIN FUNCIONARIOS ');
    QRel.Sql.Add('ON (FUNCIONARIOS.FUNCIONARIO_ID = ORCAMENTOS.VENDEDOR_ID)');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(ORCAMENTOS.DT_ORCAMENTO BETWEEN :DT_INICIAL AND :DT_FINAL)');
    QRel.Sql.Add('AND (ORCAMENTOS.EMPRESA_ID = :EMPRESA_ID)');


    if STATUS.Text = 'NORMAL' then
    QRel.Sql.Add('AND (ORCAMENTOS.STATUS = ''NORMAL'') ')
    Else if STATUS.Text = 'FATURADO' then
    QRel.Sql.Add('AND (ORCAMENTOS.STATUS = ''FATURADO'')')
     Else if STATUS.Text = 'FATURADO' then
    QRel.Sql.Add('AND (ORCAMENTOS.STATUS = ''FATURADO'')')
    Else if STATUS.Text = 'CANCELADO' then
    QRel.Sql.Add('AND (ORCAMENTOS.STATUS = ''CANCELADO'')');


    if StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Fornecedor')) > 0 then
    begin
      QRel.Sql.Add('AND (PRODUTOS.FORNECEDOR_ID = :FORNECEDOR_ID)');

      QRel.ParamByName('FORNECEDOR_ID').AsInteger := StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Fornecedor'));
    end;

    if StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Grupo')) > 0 then
    begin
      QRel.Sql.Add('AND (PRODUTOS.GRUPO_ID = :GRUPO_ID)');

      QRel.ParamByName('GRUPO_ID').AsInteger := StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Grupo'));
    end;

    if StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'SubTipo')) > 0 then
    begin
      QRel.Sql.Add('AND (PRODUTOS.SUBTIPO_ID = :SUBTIPO_ID)');

      QRel.ParamByName('SUBTIPO_ID').AsInteger := StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'SubTipo'));
    end;

    if StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Localização')) > 0 then
    begin
      QRel.Sql.Add('AND (PRODUTOS.LOCALIZACAO_ID = :LOCALIZACAO_ID)');

      QRel.ParamByName('LOCALIZACAO_ID').AsInteger := StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Localização'));
    end;

    if StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Produto Inicial')) > 0 then
    begin
      QRel.Sql.Add('AND (PRODUTOS.PRODUTO_ID BETWEEN :PRODUTO_INICIAL AND :PRODUTO_FINAL)');

      QRel.ParamByName('PRODUTO_INICIAL').AsInteger := StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Produto Inicial'));
      QRel.ParamByName('PRODUTO_FINAL').AsInteger   := StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Produto Final'));
    end;

    if Cliente.Value > 0 then
    Begin
      QRel.SQL.Add('AND (ORCAMENTOS.CLIENTE_ID = :CLIENTE_ID)');
      QRel.ParamByName('CLIENTE_ID').AsInteger := StrToInt(Cliente.Text);
    End;

    if Produto.Value > 0 then
    Begin
    QRel.Sql.Add('AND (ORCITENS.PRODUTO_ID = :PRODUTO_ID)');
    QRel.ParamByName('PRODUTO_ID').AsInteger := StrToInt(Produto.Text);
    End;

     if Funcionario_id.Value > 0 then
    Begin
      QRel.SQL.Add('AND (ORCAMENTOS.VENDEDOR_ID = :VENDEDOR_ID)');
      QRel.ParamByName('VENDEDOR_ID').AsInteger := StrToInt(Funcionario_id.Text);
    End;



    QRel.Sql.Add('GROUP BY ORCAMENTOS.ORCAMENTO_ID,ORCAMENTOS.NOME, ORCITENS.PRODUTO_ID, PRODUTOS.DESCRICAO ,');
    QRel.Sql.Add('PRODUTOS.COD_BARRA, ORCAMENTOS.DT_ORCAMENTO,ORCAMENTOS.STATUS,ORCAMENTOS.VR_DESCONTO,ORCAMENTOS.VR_ACRESCIMO,FUNCIONARIOS.NOME,ORCITENS.VR_UNITARIO');

   if NOT chk_agrupar.Checked then

    begin

      if Ordem.Text = 'CLIENTE' then
        QRel.Sql.Add('ORDER BY 5')
      else if Ordem.Text = 'DESCRIÇÃO' then
        QRel.Sql.Add('ORDER BY 3')
      else if Ordem.Text = 'DATA DO PEDIDO' then
        QRel.Sql.Add('ORDER BY 11 ')
      else if Ordem.Text = 'DATA DA ENTREGA' then
        QRel.Sql.Add('ORDER BY 10 DESC')
      else if Ordem.Text = 'VALOR DO PEDIDO' then
        QRel.Sql.Add('ORDER BY 9 DESC')
      else if Ordem.Text = 'CÓDIGO DO PRODUTO' then
        QRel.Sql.Add('ORDER BY 2  ')
      else if Ordem.Text = 'STATUS DO PEDIDO' then
        QRel.Sql.Add('ORDER BY 12 ');

    End
    Else
   Begin

    QRel.Sql.Add(') AS RESULT GROUP BY PRODUTO_ID, DESCRICAO, COD_BARRA, STATUS,VR_UNITARIO');
    //QRel.Sql.Add('ORDER BY DESCRICAO');

    if Ordem.Text = 'DESCRIÇÃO' then
      QRel.Sql.Add('ORDER BY 2')
    else if Ordem.Text = 'CÓDIGO DO PRODUTO' then
      QRel.Sql.Add('ORDER BY 1  ')
    else if Ordem.Text = 'STATUS DO PEDIDO' then
      QRel.Sql.Add('ORDER BY 3 ');
   end;

    QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
    QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;

   // if Status.Text <> '' then
   // QRel.ParamByName('STATUS').AsString       := Status.Text;

    QRel.Prepare;
    QRel.Open;


    IF not Chk_Agrupar.Checked Then
    Begin
    QRLabel13.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;

    if Funcionario_id.Value > 0 then
    Begin
     QRlabel12.Visible := True;
     QRlabel12.Caption := 'Vendedor: ' + QRel.FieldByName('VENDEDOR').AsString;
    End
    Else
    QRlabel12.Caption := 'Vendedor: Todos' ;


    if QRel.IsEmpty then
      Application.MessageBox('Não há dados para os parâmetros informados', PChar(Msg_Title), mb_IconInformation)
    else

      Fim.PreviewModal;

      if chk_exportar.Checked Then
         Begin
         Fim.ExportToFilter(TQRXLSFilter.Create(ExtractFilePath(ParamStr(0)) + 'Exportados\Orçamento_' + QRel.FieldByName('ORCAMENTO_ID').AsString  + '.xls'));
         Application.MessageBox(PChar('Arquivo exportado para : ' + ExtractFilePath(ParamStr(0)) + 'Exportados\Orcamento_'  + QRel.FieldByName('ORCAMENTO_ID').AsString  + '.xls') , PChar(Msg_Title), mb_IconInformation);
         End;
    End
    Else
    Begin
    QRLabel21.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;

    if Funcionario_id.Value > 0 then
    Begin
     QRlabel27.Visible := True;
     QRlabel27.Caption := 'Vendedor: ' + QFuncionario.FieldByName('NOME').AsString;
    End
    Else
    QRlabel27.Caption := 'Vendedor: Todos' ;


    if QRel.IsEmpty then
      Application.MessageBox('Não há dados para os parâmetros informados', PChar(Msg_Title), mb_IconInformation)
    else
      Agrupado.PreviewModal;

      if chk_exportar.Checked Then
         Begin
         Fim.ExportToFilter(TQRXLSFilter.Create(ExtractFilePath(ParamStr(0)) + 'Exportados\Orçamento_Agrupado_' + QRel.FieldByName('ORCAMENTO_ID').AsString  + '.xls'));
         Application.MessageBox(PChar('Arquivo exportado para : ' + ExtractFilePath(ParamStr(0)) + 'Exportados\Orcamento_Agrupado_'  + QRel.FieldByName('ORCAMENTO_ID').AsString  + '.xls') , PChar(Msg_Title), mb_IconInformation);
         End;

    End;
  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;

procedure TFrmRelatorio_Orcamentos.btnFuncionarioClick(Sender: TObject);
begin
  try
    Funcionario_id.Value := GetConsulta('PESSOAL', 0, 0, StrToInt(Funcionario_id.Text));
  except
    Funcionario_id.Value := GetConsulta('PESSOAL', 0, 0, 0);
  end;

end;

procedure TFrmRelatorio_Orcamentos.btnProdutoClick(Sender: TObject);
begin
  try
    Produto.Value := GetConsulta('ESTOQUE', 0, 0, StrToInt(Produto.Text));
  except
    Produto.Value := GetConsulta('ESTOQUE', 0, 0, 0);
  end;

end;

procedure TFrmRelatorio_Orcamentos.btnClienteClick(Sender: TObject);
begin
  try
    Cliente.Value := GetConsulta('CLIENTES', 0, 0 , StrToInt(Cliente.Text));
  except
    Cliente.Value := GetConsulta('CLIENTES', 0, 0, 0);
  end;

end;

procedure TFrmRelatorio_Orcamentos.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRelatorio_Orcamentos.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmRelatorio_Orcamentos.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    //Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmRelatorio_Orcamentos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmRelatorio_Orcamentos.FormCreate(Sender: TObject);
begin
  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);
end;

procedure TFrmRelatorio_Orcamentos.Funcionario_idChange(Sender: TObject);
begin
 if Funcionario_id.Value > 0 then
    SearchFuncionario
 ELSE
    QFuncionario.close;

end;

procedure TFrmRelatorio_Orcamentos.Funcionario_idKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if (Key = Vk_F7) and (Sender = Funcionario_id) then
    btnFuncionarioClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmRelatorio_Orcamentos.OrdemKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmRelatorio_Orcamentos.ProdutoExit(Sender: TObject);
begin
if Produto.Value > 0 then
    begin
      QProduto.Sql.Clear;
      QProduto.Sql.Add('SELECT * FROM PRODUTOS');
      QProduto.Sql.Add('WHERE');
      QProduto.Sql.Add('(PRODUTO_ID = :PRODUTO_ID)');
      QProduto.Sql.Add('AND (EMPRESA_ID = :EMPRESA_ID)');
      QProduto.Sql.Add('AND (STATUS = :STATUS)');

      if StrToInt(LeIni(Arq_Ini, 'Sistema', 'Localização')) > 0 then
      begin
        QProduto.Sql.Add('AND (LOCALIZACAO_ID = :LOCALIZACAO_ID)');

        QProduto.ParamByName('LOCALIZACAO_ID').AsInteger := StrToInt(LeIni(Arq_Ini, 'Sistema', 'Localização'));
      end;

      QProduto.Sql.Add('ORDER BY DESCRICAO');

      QProduto.ParamByName('PRODUTO_ID').AsInteger := StrToInt(Produto.Text);
      QProduto.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
      QProduto.ParamByName('STATUS').AsString      := 'A';

      QProduto.Prepare;
      QProduto.Open;
    end
    else
    begin
      {QProduto.Sql.Clear;
      QProduto.Sql.Add('SELECT * FROM PRODUTOS');
      QProduto.Sql.Add('WHERE');
      QProduto.Sql.Add('(PRODUTO_ID >= 0)');
      QProduto.Sql.Add('AND (EMPRESA_ID = :EMPRESA_ID)');
      QProduto.Sql.Add('AND (STATUS = :STATUS)');

      if StrToInt(LeIni(Arq_Ini, 'Sistema', 'Localização')) > 0 then
      begin
        QProduto.Sql.Add('AND (LOCALIZACAO_ID = :LOCALIZACAO_ID)');
        QProduto.ParamByName('LOCALIZACAO_ID').AsInteger := StrToInt(LeIni(Arq_Ini, 'Sistema', 'Localização'));
      end;

      QProduto.Sql.Add('ORDER BY DESCRICAO');

      QProduto.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
      QProduto.ParamByName('STATUS').AsString      := 'A';

      QProduto.Prepare;
      QProduto.Open; }
    end;
end;

procedure TFrmRelatorio_Orcamentos.ProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if (Key = Vk_F7) and (Sender = Produto) then
    btnProdutoClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);

end;

procedure TFrmRelatorio_Orcamentos.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin

  if QRel.FieldByName('STATUS').AsString = 'CANCELADO' Then
  QRLabel16.Caption := 'CANCELADO';

   if QRel.FieldByName('STATUS').AsString = 'NORMAL' Then
  QRLabel16.Caption := 'NORMAL';

   if QRel.FieldByName('STATUS').AsString = 'FATURADO' Then
  QRLabel16.Caption := 'FATURADO';

end;

procedure TFrmRelatorio_Orcamentos.ClienteChange(Sender: TObject);
begin
if Cliente.Value > 0 then
    SearchCliente;
end;

procedure TFrmRelatorio_Orcamentos.ClienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if (Key = Vk_F7) and (Sender = Cliente) then
    btnClienteClick(Self);

end;

end.
