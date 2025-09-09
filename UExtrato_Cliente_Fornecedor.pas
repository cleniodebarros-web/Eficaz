unit UExtrato_Cliente_Fornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, rxCurrEdit, Mask, rxToolEdit, Buttons, DBCtrls,
  DB, IBCustomDataSet, IBQuery, QuickRpt, QRCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmExtrato_Cliente_Fornecedor = class(TForm)
    Label1: TLabel;
    Dtmen: TDateEdit;
    Dtmai: TDateEdit;
    Label3: TLabel;
    Tipo_Extrato: TComboBox;
    Label2: TLabel;
    Forne_Cliente: TCurrencyEdit;
    Bevel1: TBevel;
    btnForne_Cliente: TSpeedButton;
    DataForne_Cliente: TDataSource;
    DBText1: TDBText;
    Extrato: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    QRDBText3: TQRDBText;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    Cabec: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel10: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText6: TQRDBText;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    SummaryBand1: TQRBand;
    QRShape4: TQRShape;
    QRLabel2: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel4: TQRLabel;
    QRShape2: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel12: TQRLabel;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    QRDBText7: TQRDBText;
    QRLabel13: TQRLabel;
    QForne_Cliente: TFDQuery;
    QRel: TFDQuery;
    procedure btnRetornaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnForne_ClienteClick(Sender: TObject);
    procedure Forne_ClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Tipo_ExtratoChange(Sender: TObject);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnExecutaClick(Sender: TObject);
    procedure Forne_ClienteChange(Sender: TObject);
    procedure SummaryBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ExtratoBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DtmenEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SearchForne_Cliente;
  end;

var
  FrmExtrato_Cliente_Fornecedor: TFrmExtrato_Cliente_Fornecedor;
  Saldo, Sd: Real;

implementation

uses
  UConsulta, UPrincipal, UData;

{$R *.dfm}

procedure TFrmExtrato_Cliente_Fornecedor.SearchForne_Cliente;
begin
  if Tipo_Extrato.Text = 'Fornecedor' then
  begin
    QForne_Cliente.Sql.Clear;
    QForne_Cliente.Sql.Add('SELECT * FROM FORNECEDORES');
    QForne_Cliente.Sql.Add('WHERE');
    QForne_Cliente.Sql.Add('(FORNECEDOR_ID = :FORNECEDOR_ID)');
    QForne_Cliente.Sql.Add('AND (STATUS = :STATUS)');

    QForne_Cliente.ParamByName('FORNECEDOR_ID').AsInteger := StrToInt(Forne_Cliente.Text);
    QForne_Cliente.ParamByName('STATUS').AsString         := 'A';

    QForne_Cliente.Prepare;
    QForne_Cliente.Open;
  end;

  if Tipo_Extrato.Text = 'Cliente' then
  begin
    QForne_Cliente.Sql.Clear;
    QForne_Cliente.Sql.Add('SELECT * FROM CLIENTES');
    QForne_Cliente.Sql.Add('WHERE');
    QForne_Cliente.Sql.Add('(CLIENTE_ID = :CLIENTE_ID)');
    QForne_Cliente.Sql.Add('AND (STATUS = :STATUS)');

    QForne_Cliente.ParamByName('CLIENTE_ID').AsInteger := StrToInt(Forne_Cliente.Text);
    QForne_Cliente.ParamByName('STATUS').AsString      := 'A';

    QForne_Cliente.Prepare;
    QForne_Cliente.Open;
  end;

  if QForne_Cliente.IsEmpty then
    btnExecuta.Enabled := False
  else
    btnExecuta.Enabled := True;
end;

procedure TFrmExtrato_Cliente_Fornecedor.SummaryBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  QRLabel2.Caption := FormatFloat('#,##0.00', Abs(Saldo));

  if SALDO >= 0 then
    QRLabel2.Left := 521
  else
    QRlabel2.Left := 615;
end;

procedure TFrmExtrato_Cliente_Fornecedor.btnExecutaClick(Sender: TObject);
var
X: Integer;
begin
// 151 - 325
  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT * FROM BALANCO_CONTABIL');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(COD_CONTABIL = :COD_CONTABIL)');
    QRel.Sql.Add('AND (DT_BALANCO = :DT_BALANCO)');
    QRel.Sql.Add('AND (EMPRESA_ID = :EMPRESA_ID)');

    QRel.ParamByName('COD_CONTABIL').AsString := QForne_Cliente.FieldByName('COD_CONTABIL').AsString;
    QRel.ParamByName('DT_BALANCO').AsDateTime := FrmPrincipal.QEmpresa.FieldByName('DT_ULT_BALANCO').AsDateTime;
    QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;

    QRel.Prepare;
    QRel.Open;

    if Tipo_Extrato.Text = 'Fornecedor' then
    begin
      Saldo := (QRel.FieldByName('SALDO_ATUAL').AsFloat * -1);
      Sd    := (QRel.FieldByName('SALDO_ATUAL').AsFloat * -1);
    end
    else
    begin
      Saldo := QRel.FieldByName('SALDO_ATUAL').AsFloat;
      Sd    := QRel.FieldByName('SALDO_ATUAL').AsFloat;
    end;

    for X := 1 to 2 do
    begin
      QRel.Sql.Clear;
      QRel.Sql.Add('SELECT SUM(VALOR) AS VALOR');
      QRel.Sql.Add('FROM RAZAO');
      QRel.Sql.Add('WHERE');

      if X = 1 then
        QRel.Sql.Add('(CONTA_DB = :CONTA)')
      else
        QRel.Sql.Add('(CONTA_CR = :CONTA)');

      QRel.Sql.Add('AND (DT_TRANS < :DT_INICIAL)');
      QRel.Sql.Add('AND (EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TPCTB <= :TPCTB)');

      QRel.ParamByName('CONTA').AsString        := QForne_Cliente.FieldByName('COD_CONTABIL').AsString;
      QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
      QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
      QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;

      QRel.Prepare;
      QRel.Open;

      if X = 1 then
        Saldo := SALDO + QRel.FieldByName('VALOR').AsFloat
      else
        Saldo := SALDO - QRel.FieldByName('VALOR').AsFloat;
    end;

    Sd := Saldo;

    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT RAZAO.DT_TRANS, RAZAO.NUM_DOC, RAZAO.HISTORICO, SUBSTRING(TRANSACOES.COMPLEMENTO FROM 12 FOR 15) COMPLEMENTO , CASE');
    QRel.Sql.Add('WHEN CONTA_DB = :CONTA_DB THEN RAZAO.VALOR END CREDITO, CASE');
    QRel.Sql.Add('WHEN CONTA_CR = :CONTA_CR THEN RAZAO.VALOR END DEBITO');
    QRel.Sql.Add('FROM RAZAO');
    QRel.Sql.Add('LEFT JOIN TRANSACOES ON TRANSACOES.TRANSACAO_ID = RAZAO.TRANSACAO_ID');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(RAZAO.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
    QRel.Sql.Add('AND (RAZAO.EMPRESA_ID = :EMPRESA_ID)');
    QRel.Sql.Add('AND (RAZAO.TPCTB <= :TPCTB)');
    QRel.Sql.Add('AND (CONTA_DB = :CLIFOR_DB OR CONTA_CR = :CLIFOR_CR)');
    QRel.Sql.Add('ORDER BY RAZAO.DT_TRANS, RAZAO.TRANSACAO_ID');

    QRel.ParamByName('CONTA_DB').AsString     := QForne_Cliente.FieldByName('COD_CONTABIL').AsString;
    QRel.ParamByName('CONTA_CR').AsString     := QForne_Cliente.FieldByName('COD_CONTABIL').AsString;
    QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
    QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    QRel.ParamByName('CLIFOR_DB').AsString    := QForne_Cliente.FieldByName('COD_CONTABIL').AsString;
    QRel.ParamByName('CLIFOR_CR').AsString    := QForne_Cliente.FieldByName('COD_CONTABIL').AsString;

    QRel.Prepare;
    QRel.Open;

    QRLabel1.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;

    if Tipo_Extrato.Text = 'Fornecedor' then
    begin
      QRLabel3.Caption := '*** EXTRATO DE FORNECEDOR ***';
      QRLabel5.Caption := 'Pagamento';
      QRLabel11.Caption := 'Compra';
    end
    else
    begin
      QRLabel3.Caption := '*** EXTRATO DE CLIENTE ***';
      QRLabel5.Caption := 'Venda';
      QRLabel11.Caption := 'Recebimento';
    end;

    if QRel.IsEmpty then
      Application.MessageBox('Não há dados para os parâmetros informados', PChar(Msg_Title), mb_IconInformation)
    else
      Extrato.PreviewModal;
  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;

procedure TFrmExtrato_Cliente_Fornecedor.btnForne_ClienteClick(Sender: TObject);
begin
  if Tipo_Extrato.Text = 'Fornecedor' then
  begin
    try
      Forne_Cliente.Value := GetConsulta('FORNECEDORES', 0, 0, StrToInt(Forne_Cliente.Text));
    except
      Forne_Cliente.Value := GetConsulta('FORNECEDORES', 0, 0, 0);
    end;
  end;

  if Tipo_Extrato.Text = 'Cliente' then
  begin
    try
      Forne_Cliente.Value := GetConsulta('CLIENTES', 0, 0, StrToInt(Forne_Cliente.Text));
    except
      Forne_Cliente.Value := GetConsulta('CLIENTES', 0, 0, 0);
    end;
  end;
end;

procedure TFrmExtrato_Cliente_Fornecedor.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmExtrato_Cliente_Fornecedor.DetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if QRel.FieldByName('CREDITO').AsFloat = 0 then
    QRDBText8.Enabled := False
  else
    QRDBText8.Enabled := True;

  if QRel.FieldByName('DEBITO').AsFloat = 0 then
    QRDBText4.Enabled := False
  else
    QRDBText4.Enabled := True;

  Saldo := Saldo + QRel.FieldByName('CREDITO').AsFloat - QRel.FieldByName('DEBITO').AsFloat;
end;

procedure TFrmExtrato_Cliente_Fornecedor.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmExtrato_Cliente_Fornecedor.DtmenKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
   // Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmExtrato_Cliente_Fornecedor.ExtratoBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  Saldo := Sd;
end;

procedure TFrmExtrato_Cliente_Fornecedor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmExtrato_Cliente_Fornecedor.FormCreate(Sender: TObject);
begin
  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);
end;

procedure TFrmExtrato_Cliente_Fornecedor.Forne_ClienteChange(Sender: TObject);
begin
  if Forne_Cliente.Value > 0 then
    SearchForne_Cliente;
end;

procedure TFrmExtrato_Cliente_Fornecedor.Forne_ClienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = Forne_Cliente) then
    btnForne_ClienteClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmExtrato_Cliente_Fornecedor.QRGroup1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  QRLabel4.Caption := FormatFloat('#,##0.00', Abs(Saldo));

  if Saldo >= 0 then
    QRLabel4.Left := 521
  else
    QRlabel4.Left := 615;
end;

procedure TFrmExtrato_Cliente_Fornecedor.Tipo_ExtratoChange(Sender: TObject);
begin
  if (Tipo_Extrato.Text = 'Cliente') or (Tipo_Extrato.Text = 'Fornecedor') then
    btnForne_Cliente.Visible := True
  else
    btnForne_Cliente.Visible := False;

  Forne_Cliente.Value := 0;
  SearchForne_Cliente;
end;

end.
