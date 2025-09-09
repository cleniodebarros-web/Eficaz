unit UFlash_Vendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, rxCurrEdit, rxToolEdit, Buttons, DBCtrls,
  DB, IBCustomDataSet, IBQuery, QuickRpt, QRCtrls, DBTables;

type
  TFrmFlash_Vendas = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    Dtmen: TDateEdit;
    Caixa_Banco: TCurrencyEdit;
    Dtmai: TDateEdit;
    btnCaixa_Banco: TSpeedButton;
    QBanco: TIBQuery;
    DataBanco: TDataSource;
    DBText1: TDBText;
    QRel: TIBQuery;
    Flash: TQuickRep;
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
    QRLabel6: TQRLabel;
    QRDBText6: TQRDBText;
    QRGroup2: TQRGroup;
    QRDBText7: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText1: TQRDBText;
    QRBand1: TQRBand;
    QRShape2: TQRShape;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    QRLabel2: TQRLabel;
    QRDBText4: TQRDBText;
    QRShape5: TQRShape;
    QRExpr3: TQRExpr;
    QRShape6: TQRShape;
    QRExpr4: TQRExpr;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
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
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SearchBanco;
  end;

var
  FrmFlash_Vendas: TFrmFlash_Vendas;

implementation

uses
  UData, UConsulta, UPrincipal;

{$R *.dfm}

procedure TFrmFlash_Vendas.SearchBanco;
begin
  QBanco.Close;
  QBanco.ParamByName('BANCO_ID').AsInteger   := StrToInt(Caixa_Banco.Text);
  QBanco.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  QBanco.Prepare;
  QBanco.Open;
end;

procedure TFrmFlash_Vendas.btnCaixa_BancoClick(Sender: TObject);
begin
  try
    Caixa_Banco.Value := GetConsulta('BANCOS', 0, 0, StrToInt(Caixa_Banco.Text));
  except
    Caixa_Banco.Value := GetConsulta('BANCOS', 0, 0, 0);
  end;
end;

procedure TFrmFlash_Vendas.btnExecutaClick(Sender: TObject);
begin
// 123, 325
  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT CAIXA_ID, LEGENDA, SUM(VALOR) VALOR, SUM(VR_DESCONTO) VR_DESCONTO, SUM(ICMS_RETIDO) ICMS_RETIDO, SUM(CUSTO_COMPRA) CUSTO_COMPRA FROM');
    QRel.Sql.Add('(');

    QRel.Sql.Add('SELECT CAIXA_ID, LEGENDA, SUM(VALOR_FINALIZADORA) VALOR, 0 VR_DESCONTO, 0 ICMS_RETIDO, 0 CUSTO_COMPRA');
    QRel.Sql.Add('FROM FECHAMENTO_CUPOM');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(DATA BETWEEN :DT_INICIAL AND :DT_FINAL)');
    QRel.Sql.Add('AND (FISCAL <> :FISCAL)');
    QRel.Sql.Add('AND (CAIXA_ID IN (SELECT BANCO_ID FROM BANCOS WHERE TIPO_LIMITE <> ' +#39 + 'EXCLUSO DO SALDO' + #39' ))');
    QRel.Sql.Add('GROUP BY CAIXA_ID, LEGENDA');

    QRel.Sql.Add('UNION ALL');

    QRel.Sql.Add('SELECT TRANSACOES.BANCO_ID CAIXA_ID, FINALIZADORAS.LEGENDA, 0 VALOR, SUM(TRANSACOES.VR_DESCONTO) VR_DESCONTO, 0 ICMS_RETIDO, 0 CUSTO_COMPRA');
    QRel.Sql.Add('FROM TRANSACOES');
    QRel.Sql.Add('INNER JOIN FINALIZADORAS');
    QRel.Sql.Add('ON (TRANSACOES.FINALIZADORA_ID = FINALIZADORAS.FINALIZADORA_ID)');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
    QRel.Sql.Add('AND (TRANSACOES.BANCO_ID IN (SELECT BANCO_ID FROM BANCOS WHERE TIPO_LIMITE <> ' +#39 + 'EXCLUSO DO SALDO' + #39' ))');
    QRel.Sql.Add('GROUP BY TRANSACOES.BANCO_ID, FINALIZADORAS.LEGENDA');

    QRel.Sql.Add('UNION ALL');

    QRel.Sql.Add('SELECT TRANSACOES.BANCO_ID CAIXA_ID, FINALIZADORAS.LEGENDA, 0 VALOR, 0 VR_DESCONTO, SUM(((TRANSITENS.BASE_CALC_ICMS * TRANSITENS.ALIQUOTA_ICMS) / 100)) ICMS_RETIDO, SUM(TRANSITENS.QUANTIDADE * PRODUTOS.CUSTO_COMPRA) CUSTO_COMPRA');
    QRel.Sql.Add('FROM TRANSITENS');
    QRel.Sql.Add('INNER JOIN TRANSACOES');
    QRel.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
    QRel.Sql.Add('INNER JOIN FINALIZADORAS');
    QRel.Sql.Add('ON (TRANSACOES.FINALIZADORA_ID = FINALIZADORAS.FINALIZADORA_ID)');
    QRel.Sql.Add('INNER JOIN PRODUTOS');
    QRel.Sql.Add('ON (TRANSITENS.PRODUTO_ID = PRODUTOS.PRODUTO_ID)');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
    QRel.Sql.Add('AND (TRANSACOES.BANCO_ID IN (SELECT BANCO_ID FROM BANCOS WHERE TIPO_LIMITE <> ' +#39 + 'EXCLUSO DO SALDO' + #39' ))');
    QRel.Sql.Add('GROUP BY TRANSACOES.BANCO_ID, FINALIZADORAS.LEGENDA');

    QRel.Sql.Add(')');

    if Caixa_Banco.Value > 0 then
    begin
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(CAIXA_ID = :CAIXA_ID)');

      QRel.ParamByName('CAIXA_ID').AsInteger := StrToInt(Caixa_Banco.Text);
    end;

    QRel.Sql.Add('GROUP BY CAIXA_ID, LEGENDA');
    QRel.Sql.Add('ORDER BY CAIXA_ID, LEGENDA');

    QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
    QRel.ParamByName('FISCAL').AsString       := '';
    

    QRel.Prepare;
    QRel.Open;

    QRLabel1.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;

    if QRel.IsEmpty then
      Application.MessageBox('Não há dados para os parâmetros informados', PChar(Msg_Title), mb_IconInformation)
    else
      Flash.PreviewModal;
  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;

procedure TFrmFlash_Vendas.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmFlash_Vendas.Caixa_BancoChange(Sender: TObject);
begin
  if Caixa_Banco.Value > 0 then
    SearchBanco;
end;

procedure TFrmFlash_Vendas.Caixa_BancoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = Caixa_Banco) then
    btnCaixa_BancoClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmFlash_Vendas.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLabel8.Caption := FormatFloat('#,##0.00', QRel.FieldByName('CUSTO_COMPRA').AsFloat);
  QRLabel9.Caption := FormatFloat('#,##0.00', QRel.FieldByName('ICMS_RETIDO').AsFloat);
end;

procedure TFrmFlash_Vendas.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmFlash_Vendas.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmFlash_Vendas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmFlash_Vendas.FormCreate(Sender: TObject);
begin
  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);
end;

end.
