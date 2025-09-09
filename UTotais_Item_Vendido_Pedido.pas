unit UTotais_Item_Vendido_Pedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, rxCurrEdit, rxToolEdit, Buttons, DBCtrls,
  DB, IBCustomDataSet, IBQuery, QuickRpt, QRCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmTotais_Item_Vendido_pedido = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    Dtmen: TDateEdit;
    Caixa_Banco: TCurrencyEdit;
    Dtmai: TDateEdit;
    btnCaixa_Banco: TSpeedButton;
    DataBanco: TDataSource;
    DBText1: TDBText;
    Itens_Vendidos_Total: TQuickRep;
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
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    QRLabel6: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel13: TQRLabel;
    QRBand1: TQRBand;
    QRExpr2: TQRExpr;
    QRLabel14: TQRLabel;
    QRGroup1: TQRGroup;
    QRDBText7: TQRDBText;
    QRBand2: TQRBand;
    QRShape2: TQRShape;
    QRLabel4: TQRLabel;
    QRExpr1: TQRExpr;
    QRel: TFDQuery;
    QBanco: TFDQuery;
    Chk_Produtos_Faturados: TCheckBox;
    procedure btnRetornaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnCaixa_BancoClick(Sender: TObject);
    procedure Caixa_BancoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Caixa_BancoChange(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure DtmenEnter(Sender: TObject);
    procedure Chk_Produtos_FaturadosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SearchBanco;
  end;

var
  FrmTotais_Item_Vendido_pedido: TFrmTotais_Item_Vendido_pedido;

implementation

uses
  UData, UConsulta, UPrincipal;

{$R *.dfm}

procedure TFrmTotais_Item_Vendido_pedido.SearchBanco;
begin
  QBanco.Close;

  QBanco.ParamByName('BANCO_ID').AsInteger   := StrToInt(Caixa_Banco.Text);
  QBanco.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;

  QBanco.Prepare;
  QBanco.Open;
end;

procedure TFrmTotais_Item_Vendido_pedido.btnCaixa_BancoClick(Sender: TObject);
begin
  try
    Caixa_Banco.Value := GetConsulta('BANCOS', 0, 0, StrToInt(Caixa_Banco.Text));
  except
    Caixa_Banco.Value := GetConsulta('BANCOS', 0, 0, 0);
  end;
end;

procedure TFrmTotais_Item_Vendido_pedido.btnExecutaClick(Sender: TObject);
begin
// 125, 325
  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT PEDITENS.PRODUTO_ID, PRODUTOS.DESCRICAO, PRODUTOS.QUANTIDADE_C, PRODUTOS.QUANTIDADE_G,');

    //MODIFICADO EM FUNÇÃO DO CHAMADO 442 DA PROGRAMÇAÃO / 19-02-2018
    //QRel.Sql.Add('TABELAS.DESCRICAO GRUPO, SUM(PEDITENS.QUANTIDADE) QUANTIDADE, SUM(PEDIDOS.VALOR) AS VR_TOTAL');
    QRel.Sql.Add('TABELAS.DESCRICAO GRUPO, SUM(PEDITENS.QUANTIDADE) QUANTIDADE, SUM(PEDITENS.VR_TOTAL) AS VR_TOTAL');

    QRel.Sql.Add('FROM PEDITENS');
    QRel.Sql.Add('INNER JOIN PRODUTOS');
    QRel.Sql.Add('ON (PEDITENS.PRODUTO_ID = PRODUTOS.PRODUTO_ID)');
    QRel.Sql.Add('INNER JOIN TABELAS');
    QRel.Sql.Add('ON (PRODUTOS.GRUPO_ID = TABELAS.TABELA_ID AND TABELAS.TIPO_TABELA =:TIPO_TABELA)');
    QRel.Sql.Add('INNER JOIN PEDIDOS');
    QRel.Sql.Add('ON (PEDITENS.PEDIDO_ID = PEDIDOS.PEDIDO_ID)');

    if Chk_Produtos_Faturados.Checked then
    begin
       QRel.Sql.Add('INNER JOIN TRANSACOES');
       QRel.Sql.Add('ON (PEDIDOS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
    end;


    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(PEDIDOS.DT_PEDIDO BETWEEN :DT_INICIAL AND :DT_FINAL)');


    if Chk_Produtos_Faturados.Checked then
    begin

      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID =:EMPRESA_ID)');

      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <=:TPCTB)');
      QRel.Sql.Add('AND (TRANSACOES.CONDUTA =:CONDUTA)');
      QRel.Sql.Add('AND (TRANSACOES.DEPTO =:DEPTO)');

       if (Caixa_Banco.Value > 0) then
       begin
         QRel.Sql.Add('AND (TRANSACOES.BANCO_ID  =:BANCO_ID)');
         QRel.ParamByName('BANCO_ID').AsInteger := StrToInt(Caixa_Banco.Text);
       end;

       QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
       QRel.ParamByName('CONDUTA').AsString      := '01';
       QRel.ParamByName('DEPTO').AsString        := '07';
       QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;

    end;


    QRel.Sql.Add('GROUP BY PEDITENS.PRODUTO_ID, PRODUTOS.DESCRICAO, PRODUTOS.QUANTIDADE_C, PRODUTOS.QUANTIDADE_G, TABELAS.DESCRICAO');
    QRel.Sql.Add('ORDER BY TABELAS.DESCRICAO, PRODUTOS.DESCRICAO');

    QRel.ParamByName('TIPO_TABELA').AsString  := '7';
    QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;

    QRel.Prepare;
    QRel.Open;





    QRLabel1.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;

    if QRel.IsEmpty then
      Application.MessageBox('Não há dados para os parâmetros informados', PChar(Msg_Title), mb_IconInformation)
    else
      Itens_Vendidos_Total.PreviewModal;
  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;

procedure TFrmTotais_Item_Vendido_pedido.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmTotais_Item_Vendido_pedido.Caixa_BancoChange(Sender: TObject);
begin
  if Caixa_Banco.Value > 0 then
    SearchBanco;
end;

procedure TFrmTotais_Item_Vendido_pedido.Caixa_BancoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = Caixa_Banco) then
    btnCaixa_BancoClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmTotais_Item_Vendido_pedido.Chk_Produtos_FaturadosClick(
  Sender: TObject);
begin
     if Chk_Produtos_Faturados.Checked then
     begin
         Caixa_Banco.Enabled := True;
         btnCaixa_Banco.Enabled      := True;
     end
     else
     begin
         Caixa_Banco.Enabled     := False;
         btnCaixa_Banco.Enabled  := False;
         Caixa_Banco.Value       := 0;
     end;

end;

procedure TFrmTotais_Item_Vendido_pedido.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmTotais_Item_Vendido_pedido.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    //Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmTotais_Item_Vendido_pedido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmTotais_Item_Vendido_pedido.FormCreate(Sender: TObject);
begin
  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);
end;

end.
