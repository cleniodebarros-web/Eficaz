unit URelatorio_Pedido_Compras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, rxToolEdit, DB, IBCustomDataSet, IBQuery,
  QuickRpt, QRCtrls, Buttons, DBCtrls, rxCurrEdit, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmRelatorio_Pedido_Compras = class(TForm)
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
    Produto: TCurrencyEdit;
    btnProduto: TSpeedButton;
    DBText1: TDBText;
    DataProduto: TDataSource;
    Chk_pedidos: TCheckBox;
    QRel: TFDQuery;
    QProduto: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure OrdemKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRetornaClick(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure DtmenEnter(Sender: TObject);
    procedure btnProdutoClick(Sender: TObject);
    procedure ProdutoChange(Sender: TObject);
    procedure ProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
  procedure SearchProduto;
    { Public declarations }
  end;

var
  FrmRelatorio_Pedido_Compras: TFrmRelatorio_Pedido_Compras;

implementation

uses
  UData, UPrincipal,UConsulta;

{$R *.dfm}

procedure TFrmRelatorio_pedido_compras.SearchProduto;
begin
  QProduto.Close;
  QProduto.ParamByName('PRODUTO_ID').AsInteger := StrToInt(Produto.Text);
  QProduto.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  QProduto.Prepare;
  QProduto.Open;
end;


procedure TFrmRelatorio_Pedido_Compras.btnExecutaClick(Sender: TObject);
begin
// 125
// 325

  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT PEDITENS.PRODUTO_ID,PRODUTOS.DESCRICAO, PRODUTOS.COD_BARRA, PEDIDOS.NOME FORNECEDORES, SUM(PEDITENS.QUANTIDADE) QTD_COMPRA, ' +
                 'SUM(PEDITENS.VR_TOTAL + PEDITENS.VR_IPI - PEDITENS.VR_DESCONTO) VR_TOTAL, PEDIDOS.DT_ENTREGA,DT_PEDIDO,PEDIDOS.STATUS,PEDIDOS.PEDIDO_ID');
    QRel.Sql.Add('FROM PEDITENS');
    QRel.Sql.Add('INNER JOIN PEDIDOS');
    QRel.Sql.Add('ON (PEDITENS.PEDIDO_ID = PEDIDOS.PEDIDO_ID)');
    QRel.Sql.Add('INNER JOIN PRODUTOS');
    QRel.Sql.Add('ON (PEDITENS.PRODUTO_ID = PRODUTOS.PRODUTO_ID)');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(PEDIDOS.DT_PEDIDO BETWEEN :DT_INICIAL AND :DT_FINAL)');
    QRel.Sql.Add('AND (PEDIDOS.EMPRESA_ID = :EMPRESA_ID)');
    QRel.Sql.Add('AND (PEDIDOS.TP_PEDIDO = 0)');
    if Chk_pedidos.Checked then
    QRel.Sql.Add('AND (PEDITENS.IMPORTADO = :IMPORTADO)');


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

    if Produto.Value > 0 then
    Begin
      QRel.SQL.Add('AND (PEDITENS.PRODUTO_ID = :PRODUTO_ID)');
      QRel.ParamByName('PRODUTO_ID').AsInteger := StrToInt(Produto.Text);
    End;

    QRel.Sql.Add('GROUP BY PEDITENS.PRODUTO_ID, PRODUTOS.DESCRICAO, PRODUTOS.COD_BARRA, PEDIDOS.NOME,PEDIDOS.DT_ENTREGA,DT_PEDIDO,PEDIDOS.PEDIDO_ID,PEDIDOS.STATUS');

    if Ordem.Text = 'FORNECEDOR' then
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

    if Chk_pedidos.Checked then
    QRel.ParamByName('IMPORTADO').AsString    := 'N';

    QRel.Prepare;
    QRel.Open;

    QRLabel13.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;

    if QRel.IsEmpty then
      Application.MessageBox('Não há dados para os parâmetros informados', PChar(Msg_Title), mb_IconInformation)
    else
      Fim.PreviewModal;
  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;

procedure TFrmRelatorio_Pedido_Compras.btnProdutoClick(Sender: TObject);
begin
  try
    Produto.Value := GetConsulta('ESTOQUE', FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger, 0 , StrToInt(Produto.Text));
  except
    Produto.Value := GetConsulta('ESTOQUE', 0, 0, 0);
  end;

end;

procedure TFrmRelatorio_Pedido_Compras.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRelatorio_Pedido_Compras.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmRelatorio_Pedido_Compras.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
  //  Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmRelatorio_Pedido_Compras.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmRelatorio_Pedido_Compras.FormCreate(Sender: TObject);
begin
  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);
end;

procedure TFrmRelatorio_Pedido_Compras.OrdemKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmRelatorio_Pedido_Compras.ProdutoChange(Sender: TObject);
begin
if Produto.Value > 0 then
    SearchProduto;
end;

procedure TFrmRelatorio_Pedido_Compras.ProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if (Key = Vk_F7) and (Sender = Produto) then
    btnprodutoClick(Self);
end;

end.
