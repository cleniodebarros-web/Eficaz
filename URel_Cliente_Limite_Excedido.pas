unit URel_Cliente_Limite_Excedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, rxCurrEdit, rxToolEdit, Buttons, DBCtrls,
  DB, IBCustomDataSet, IBQuery, QuickRpt, QRCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,Math;

type
  TFrmRel_Cliente_Limite_Excedido = class(TForm)
    Label1: TLabel;
    Bevel1: TBevel;
    Dtmen: TDateEdit;
    Dtmai: TDateEdit;
    Compras_Sintetico: TQuickRep;
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
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr6: TQRExpr;
    QRSysData3: TQRSysData;
    QRDBText19: TQRDBText;
    QRLabel22: TQRLabel;
    REL_SALDO_EXCEDIDO: TQuickRep;
    QRBand1: TQRBand;
    QRSysData4: TQRSysData;
    QRLabel14: TQRLabel;
    QRSysData5: TQRSysData;
    QRLabel15: TQRLabel;
    QRShape2: TQRShape;
    QRLabel16: TQRLabel;
    QRShape5: TQRShape;
    QRLabel17: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel9: TQRLabel;
    QRExpr9: TQRExpr;
    QRLabel11: TQRLabel;
    QRLabel38: TQRLabel;
    QRDBText9: TQRDBText;
    QRExpr10: TQRExpr;
    QRel: TFDQuery;
    QRBand2: TQRBand;
    qrdb_nome_cliente: TQRDBText;
    qrdb_cliente_id: TQRDBText;
    qrdb_saldo_devedor: TQRExpr;
    qrdb_saldo_limite: TQRExpr;
    ComboBox_Ordem: TComboBox;
    Ordem: TLabel;
    procedure btnRetornaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnExecutaClick(Sender: TObject);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormShow(Sender: TObject);
    procedure ComboBox_OrdemKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Cliente_Limite_Excedido: TFrmRel_Cliente_Limite_Excedido;

implementation

uses
  UData, UPrincipal, UConsulta;

{$R *.dfm}

procedure TFrmRel_Cliente_Limite_Excedido.btnExecutaClick(Sender: TObject);
begin
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    QRel.SQL.Clear;
    QRel.SQL.Add('SELECT CLIENTES.CLIENTE_ID, CLIENTES.NOME, TESTE.* FROM ');
    QRel.SQL.Add('(');
    QRel.SQL.Add('SELECT CLIENTES.CLIENTE_ID ID_CLIENTE, SUM(TRANSPARCELAS.VALOR) SALDO_DEVEDOR, CLIENTES.LIMITE SALDO_LIMITE');
    QRel.SQL.Add('FROM TRANSPARCELAS');
    QRel.SQL.Add('INNER JOIN TRANSACOES ON (TRANSPARCELAS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
    QRel.SQL.Add('INNER JOIN CLIENTES ON (CLIENTES.CLIENTE_ID = TRANSACOES.CLIENTE_ID)');
    QRel.SQL.Add('WHERE');
    QRel.SQL.Add('(TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
    QRel.SQL.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
    QRel.SQL.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
    QRel.SQL.Add('AND (TRANSACOES.COND_PAGTO = :COND_PAGTO)');
    QRel.SQL.Add('AND (TRANSACOES.CONDUTA = :CONDUTA)');
    QRel.SQL.Add('AND (TRANSACOES.BALANCO <> :BALANCO)');
    QRel.SQL.Add('AND ((TRANSPARCELAS.AGRUPAMENTO = 0) OR (TRANSPARCELAS.AGRUPAMENTO IS NULL))');
    QRel.SQL.Add('AND (TRANSPARCELAS.TIPO_TRANSACAO = :TIPO_TRANSACAO)');
    QRel.SQL.Add('AND (TRANSPARCELAS.VALOR > 0)');
    QRel.SQL.Add('AND (TRANSPARCELAS.BANCO_ID = 0)');
    QRel.SQL.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
    QRel.SQL.Add('AND (CLIENTES.LIMITE > 0)');
    QRel.SQL.Add('GROUP BY CLIENTES.CLIENTE_ID');
    QRel.SQL.Add(') AS TESTE');
    QRel.SQL.Add('INNER JOIN CLIENTES ON CLIENTES.CLIENTE_ID = ID_CLIENTE');
    QRel.SQL.Add('WHERE SALDO_DEVEDOR > SALDO_LIMITE');

    if (ComboBox_Ordem.Text = 'ID') then
      QRel.SQL.Add('ORDER BY CLIENTES.CLIENTE_ID')
    else
      QRel.SQL.Add('ORDER BY CLIENTES.NOME');

    QRel.ParamByName('DT_INICIAL').AsDateTime   := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime     := Dtmai.Date;
    QRel.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    QRel.ParamByName('TPCTB').AsString          := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    QRel.ParamByName('CONDUTA').AsString        := '01';
    QRel.ParamByName('COND_PAGTO').AsString     := 'A PRAZO';
    QRel.ParamByName('TIPO_TRANSACAO').AsString := 'T';
    QRel.ParamByName('BALANCO').AsString        := 'AGRUPADO';

    QRel.Open();

    QRLabel21.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;

    if QRel.IsEmpty then
      Application.MessageBox('Não há dados para serem impressos', PChar(Msg_Title), mb_IconInformation)
    else
      REL_SALDO_EXCEDIDO.PreviewModal;

    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;


end;

procedure TFrmRel_Cliente_Limite_Excedido.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRel_Cliente_Limite_Excedido.ComboBox_OrdemKeyPress(
  Sender: TObject; var Key: Char);
begin
  key:=#0;
end;

procedure TFrmRel_Cliente_Limite_Excedido.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  //QRLabel11.Caption := FormatFloat('#,##0.00', QRel.FieldByName('VALOR_VENDA').AsFloat);
end;


procedure TFrmRel_Cliente_Limite_Excedido.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    //Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmRel_Cliente_Limite_Excedido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmRel_Cliente_Limite_Excedido.FormShow(Sender: TObject);
begin
  Dtmen.Date := Now;
  Dtmai.Date := Now;
end;

end.
