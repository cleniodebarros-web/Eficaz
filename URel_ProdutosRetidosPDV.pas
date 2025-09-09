unit URel_ProdutosRetidosPDV;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, rxToolEdit, IBCustomDataSet, IBQuery,
  QRCtrls, QuickRpt, Buttons, DB, IWVCLBaseControl, IWBaseControl,
  IWBaseHTMLControl, IWControl, IWCompObject, IWCompQuickTime, rxCurrEdit,
  DBCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmRel_ProdutosRetidosPDV = class(TForm)
    Label1: TLabel;
    Bevel1: TBevel;
    Dtmen: TDateEdit;
    Dtmai: TDateEdit;
    ProdutosRetidos: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    QRDBText3: TQRDBText;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    QRLabel1: TQRLabel;
    Cabec: TQRLabel;
    QRSysData2: TQRSysData;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    QRBand1: TQRBand;
    QRGroup1: TQRGroup;
    QRBand2: TQRBand;
    QRDBText34: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRExpr11: TQRExpr;
    QRDBText5: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel8: TQRLabel;
    Bevel2: TBevel;
    QRLabel9: TQRLabel;
    btnProduto: TSpeedButton;
    DBText1: TDBText;
    Produto: TCurrencyEdit;
    Label2: TLabel;
    DataProduto: TDataSource;
    Chk_Pedido: TCheckBox;
    QRel: TFDQuery;
    QProduto: TFDQuery;
    procedure btnRetornaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnExecutaClick(Sender: TObject);
    procedure DtmenEnter(Sender: TObject);
    procedure btnProdutoClick(Sender: TObject);
    procedure ProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ProdutoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_ProdutosRetidosPDV: TFrmRel_ProdutosRetidosPDV;

implementation

uses
  UPrincipal, UData, UConsulta;

{$R *.dfm}

procedure TFrmRel_ProdutosRetidosPDV.btnExecutaClick(Sender: TObject);
begin
// 151, 325


  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT PEDIDOS.PEDIDO_ID, PEDIDOS.DT_PEDIDO, PEDITENS.PRODUTO_ID, PRODUTOS.DESCRICAO,');
    QRel.Sql.Add('PEDIDOS.NOME NOME_CLIENTE,FUNCIONARIOS.NOME, SUM (PEDITENS.QUANTIDADE) RETIDO');
    QRel.Sql.Add('FROM PEDITENS INNER JOIN PEDIDOS ON PEDITENS.PEDIDO_ID = PEDIDOS.PEDIDO_ID');
    QRel.Sql.Add('INNER JOIN PRODUTOS ON PEDITENS.PRODUTO_ID = PRODUTOS.PRODUTO_ID');
    QRel.Sql.Add('INNER JOIN FUNCIONARIOS ON FUNCIONARIOS.FUNCIONARIO_ID = PEDIDOS.FUNCIONARIO_ID');
    QRel.Sql.Add('WHERE ((PEDIDOS.STATUS <> :FATURADO) AND (PEDIDOS.STATUS <> :CANCELADO))');
    QRel.Sql.Add('AND (PEDIDOS.TP_PEDIDO = :TP_PEDIDO)');
    QRel.Sql.Add('AND PEDITENS.TP_PROD_SERV = :TP_PROD_SERV AND PEDIDOS.DT_PEDIDO BETWEEN :DT_INICIAL AND :DT_FINAL ');
    if Produto.Value > 0 then
    QRel.Sql.Add('AND PEDITENS.PRODUTO_ID = :PRODUTO_ID');
    QRel.Sql.Add('GROUP BY  PEDIDOS.PEDIDO_ID,PEDITENS.PRODUTO_ID, PRODUTOS.DESCRICAO,');
    QRel.Sql.Add('PEDIDOS.NOME,FUNCIONARIOS.NOME,PEDIDOS.DT_PEDIDO');

    if Chk_pedido.Checked then
     QRel.Sql.Add('ORDER BY  PEDIDOS.PEDIDO_ID,PRODUTOS.DESCRICAO ,PEDIDOS.DT_PEDIDO')
    Else
     QRel.Sql.Add('ORDER BY  PRODUTOS.DESCRICAO ,PEDIDOS.DT_PEDIDO');


    QRel.ParamByName('FATURADO').AsString     := 'FATURADO';
    QRel.ParamByName('CANCELADO').AsString    := 'CANCELADO';
    QRel.ParamByName('TP_PROD_SERV').AsString := 'P';
    QRel.ParamByName('TP_PEDIDO').AsInteger   := 1;
    QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
    if Produto.Value > 0 then
    QRel.ParamByName('PRODUTO_ID').AsInteger := StrToInt(Produto.Text);

    QRel.Prepare;
    QRel.Open;

    QRLabel1.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;

    if QRel.IsEmpty then
      Application.MessageBox('Não há dados para os parâmetros informados', PChar(Msg_Title), mb_IconInformation)
    else
      ProdutosRetidos.PreviewModal;

  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;

procedure TFrmRel_ProdutosRetidosPDV.btnProdutoClick(Sender: TObject);
begin
  try
    Produto.Value := GetConsulta('ESTOQUE', 0, 0, StrToInt(Produto.Text));
  except
    Produto.Value := GetConsulta('ESTOQUE', 0, 0, 0);
  end;

end;

procedure TFrmRel_ProdutosRetidosPDV.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRel_ProdutosRetidosPDV.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmRel_ProdutosRetidosPDV.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
  // Perform(Wm_NextDlgctl, 0, 0);
    
  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmRel_ProdutosRetidosPDV.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmRel_ProdutosRetidosPDV.FormCreate(Sender: TObject);
begin
  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);
end;

procedure TFrmRel_ProdutosRetidosPDV.ProdutoExit(Sender: TObject);
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

procedure TFrmRel_ProdutosRetidosPDV.ProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if (Key = Vk_F7) and (Sender = Produto) then
    btnProdutoClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

end.
