unit URelatorio_Pedido_Vendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, rxToolEdit, DB, IBCustomDataSet, IBQuery,
  QuickRpt, QRCtrls, Buttons, DBCtrls, rxCurrEdit, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmRelatorio_Pedido_Vendas = class(TForm)
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
    QRDBText10: TQRDBText;
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
  private
    { Private declarations }
  public
  procedure SearchCliente;
    { Public declarations }
    procedure SearchFuncionario;
  end;

var
  FrmRelatorio_Pedido_Vendas: TFrmRelatorio_Pedido_Vendas;

implementation

uses
  UData, UPrincipal,UConsulta;

{$R *.dfm}

procedure TFrmRelatorio_Pedido_Vendas.SearchFuncionario;
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

procedure TFrmRelatorio_Pedido_Vendas.SearchCliente;
begin
  QCliente.Close;
  QCliente.ParamByName('Cliente_ID').AsInteger := StrToInt(Cliente.Text);
  QCliente.Prepare;
  QCliente.Open;
end;


procedure TFrmRelatorio_Pedido_Vendas.btnExecutaClick(Sender: TObject);
begin
// 125
// 325

  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT FUNCIONARIOS.NOME VENDEDOR,PEDITENS.PRODUTO_ID,PRODUTOS.DESCRICAO, PRODUTOS.COD_BARRA, PEDIDOS.NOME CLIENTES,PEDIDOS.VR_DESCONTO,PEDIDOS.VR_ACRESCIMO, SUM(PEDITENS.QUANTIDADE) QTD_VENDA, ' +
                 'SUM(PEDITENS.VR_TOTAL - PEDITENS.DESC_RODAPE) VR_TOTAL, PEDIDOS.DT_ENTREGA,DT_PEDIDO,PEDIDOS.STATUS,PEDIDOS.PEDIDO_ID');
    QRel.Sql.Add('FROM PEDITENS');
    QRel.Sql.Add('INNER JOIN PEDIDOS');
    QRel.Sql.Add('ON (PEDITENS.PEDIDO_ID = PEDIDOS.PEDIDO_ID)');
    QRel.Sql.Add('INNER JOIN PRODUTOS');
    QRel.Sql.Add('ON (PEDITENS.PRODUTO_ID = PRODUTOS.PRODUTO_ID)');
    QRel.Sql.Add('LEFT JOIN FUNCIONARIOS ');
    QRel.Sql.Add('ON (FUNCIONARIOS.FUNCIONARIO_ID = PEDIDOS.FUNCIONARIO_ID)');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(PEDIDOS.DT_PEDIDO BETWEEN :DT_INICIAL AND :DT_FINAL)');
    QRel.Sql.Add('AND (PEDIDOS.EMPRESA_ID = :EMPRESA_ID)');
    QRel.Sql.Add('AND (PEDIDOS.TP_PEDIDO = 1)');
    QRel.Sql.Add('AND (PEDIDOS.STATUS = :STATUS)');

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
      QRel.SQL.Add('AND (PEDIDOS.CLIENTE_ID = :CLIENTE_ID)');
      QRel.ParamByName('CLIENTE_ID').AsInteger := StrToInt(Cliente.Text);
    End;

    if Produto.Value > 0 then
    Begin
    QRel.Sql.Add('AND (PEDITENS.PRODUTO_ID = :PRODUTO_ID)');
    QRel.ParamByName('PRODUTO_ID').AsInteger := StrToInt(Produto.Text);
    End;

     if Funcionario_id.Value > 0 then
    Begin
      QRel.SQL.Add('AND (PEDIDOS.FUNCIONARIO_ID = :FUNCIONARIO_ID)');
      QRel.ParamByName('FUNCIONARIO_ID').AsInteger := StrToInt(Funcionario_id.Text);
    End;

    QRel.Sql.Add('GROUP BY PEDIDOS.PEDIDO_ID,PEDIDOS.NOME, PEDITENS.PRODUTO_ID, PRODUTOS.DESCRICAO, PRODUTOS.COD_BARRA, PEDIDOS.DT_ENTREGA,DT_PEDIDO,PEDIDOS.STATUS,PEDIDOS.VR_DESCONTO,PEDIDOS.VR_ACRESCIMO,FUNCIONARIOS.NOME');

    if Ordem.Text = 'CLIENE' then
      QRel.Sql.Add('ORDER BY 4, 1')
    else if Ordem.Text = 'DESCRIÇÃO' then
      QRel.Sql.Add('ORDER BY 2, 4')
    else if Ordem.Text = 'DATA DO PEDIDO' then
      QRel.Sql.Add('ORDER BY 4, 8 DESC')
    else if Ordem.Text = 'DATA DA ENTREGA' then
      QRel.Sql.Add('ORDER BY 4, 7 DESC')
    else if Ordem.Text = 'VALOR DO PEDIDO' then
      QRel.Sql.Add('ORDER BY 7, 6 DESC')
    else if Ordem.Text = 'CÓDIGO DO PRODUTO' then
      QRel.Sql.Add('ORDER BY 1, 4  DESC')
    else if Ordem.Text = 'STATUS DO PEDIDO' then
      QRel.Sql.Add('ORDER BY 9, 4 DESC'); 


    QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
    QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;

    if Status.Text = '' then
    QRel.ParamByName('STATUS').AsString       := 'NORMAL'
    Else
    QRel.ParamByName('STATUS').AsString       := Status.Text;

    QRel.Prepare;
    QRel.Open;

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
  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;

procedure TFrmRelatorio_Pedido_Vendas.btnFuncionarioClick(Sender: TObject);
begin
  try
    Funcionario_id.Value := GetConsulta('PESSOAL', 0, 0, StrToInt(Funcionario_id.Text));
  except
    Funcionario_id.Value := GetConsulta('PESSOAL', 0, 0, 0);
  end;

end;

procedure TFrmRelatorio_Pedido_Vendas.btnProdutoClick(Sender: TObject);
begin
  try
    Produto.Value := GetConsulta('ESTOQUE', 0, 0, StrToInt(Produto.Text));
  except
    Produto.Value := GetConsulta('ESTOQUE', 0, 0, 0);
  end;

end;

procedure TFrmRelatorio_Pedido_Vendas.btnClienteClick(Sender: TObject);
begin
  try
    Cliente.Value := GetConsulta('CLIENTES', 0, 0 , StrToInt(Cliente.Text));
  except
    Cliente.Value := GetConsulta('CLIENTES', 0, 0, 0);
  end;

end;

procedure TFrmRelatorio_Pedido_Vendas.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRelatorio_Pedido_Vendas.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmRelatorio_Pedido_Vendas.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    //Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmRelatorio_Pedido_Vendas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmRelatorio_Pedido_Vendas.FormCreate(Sender: TObject);
begin
  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);
end;

procedure TFrmRelatorio_Pedido_Vendas.Funcionario_idChange(Sender: TObject);
begin
if Funcionario_id.Value > 0 then
    SearchFuncionario;
end;

procedure TFrmRelatorio_Pedido_Vendas.Funcionario_idKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if (Key = Vk_F7) and (Sender = Funcionario_id) then
    btnFuncionarioClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmRelatorio_Pedido_Vendas.OrdemKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmRelatorio_Pedido_Vendas.ProdutoExit(Sender: TObject);
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
      QProduto.Sql.Clear;
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
      QProduto.Open;
    end;
end;

procedure TFrmRelatorio_Pedido_Vendas.ProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if (Key = Vk_F7) and (Sender = Produto) then
    btnProdutoClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);

end;

procedure TFrmRelatorio_Pedido_Vendas.ClienteChange(Sender: TObject);
begin
if Cliente.Value > 0 then
    SearchCliente;
end;

procedure TFrmRelatorio_Pedido_Vendas.ClienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if (Key = Vk_F7) and (Sender = Cliente) then
    btnClienteClick(Self);

end;

end.
