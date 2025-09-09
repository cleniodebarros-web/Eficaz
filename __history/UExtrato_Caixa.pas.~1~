unit UExtrato_Caixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, rxCurrEdit, rxToolEdit, Buttons, DBCtrls,
  DB, IBCustomDataSet, IBQuery, QuickRpt, QRCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmExtrato_Caixa = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    Dtmen: TDateEdit;
    Caixa_Banco: TCurrencyEdit;
    Dtmai: TDateEdit;
    btnCaixa_Banco: TSpeedButton;
    DataBanco: TDataSource;
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
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText8: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabel10: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText4: TQRDBText;
    QRGroup1: TQRGroup;
    QRLabel4: TQRLabel;
    QRShape2: TQRShape;
    QRDBText5: TQRDBText;
    QRShape4: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText6: TQRDBText;
    Saldo_Anterior: TCheckBox;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    QRel: TFDQuery;
    QBanco: TFDQuery;
    QRLabel9: TQRLabel;
    QRLabel12: TQRLabel;
    procedure btnRetornaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnCaixa_BancoClick(Sender: TObject);
    procedure Caixa_BancoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Caixa_BancoChange(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure SummaryBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ExtratoBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure DtmenEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SearchBanco;
  end;

var
  FrmExtrato_Caixa: TFrmExtrato_Caixa;
  Saldo, Sd: Real;

implementation

uses
  UData, UConsulta, UPrincipal;

{$R *.dfm}

procedure TFrmExtrato_Caixa.SearchBanco;
begin
  QBanco.Close;
  QBanco.ParamByName('BANCO_ID').AsInteger   := StrToInt(Caixa_Banco.Text);
  QBanco.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  QBanco.Prepare;
  QBanco.Open;

  if QBanco.IsEmpty then
    btnExecuta.Enabled := False
  else
    btnExecuta.Enabled := True;
end;

procedure TFrmExtrato_Caixa.SummaryBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLabel2.Caption := FormatFloat('#,##0.00', Abs(Saldo));

  if SALDO >= 0 then
    QRLabel2.Left := 521
  else
  begin
    QRLabel2.Caption := '-' + FormatFloat('#,##0.00', Abs(Saldo));
    QRlabel2.Left := 615;
  end;
end;

procedure TFrmExtrato_Caixa.btnCaixa_BancoClick(Sender: TObject);
begin
  try
    Caixa_Banco.Value := GetConsulta('BANCOS', 0, 0, StrToInt(Caixa_Banco.Text));
  except
    Caixa_Banco.Value := GetConsulta('BANCOS', 0, 0, 0);
  end;
end;

procedure TFrmExtrato_Caixa.btnExecutaClick(Sender: TObject);
var
X: Integer;
begin
  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    Saldo := 0;
    Sd    := 0;

    if Saldo_Anterior.Checked then
    begin
      QRel.Sql.Clear;
      QRel.Sql.Add('SELECT * FROM BALANCO_CONTABIL');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(COD_CONTABIL = :COD_CONTABIL)');
      QRel.Sql.Add('AND (DT_BALANCO = :DT_BALANCO)');
      QRel.Sql.Add('AND (EMPRESA_ID = :EMPRESA_ID)');

      QRel.ParamByName('COD_CONTABIL').AsString := QBanco.FieldByName('COD_CONTABIL').AsString;
      QRel.ParamByName('DT_BALANCO').AsDateTime := FrmPrincipal.QEmpresa.FieldByName('DT_ULT_BALANCO').AsDateTime;
      QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;

      QRel.Prepare;
      QRel.Open;

      if not QRel.IsEmpty then
      begin
        if QRel.FieldByName('CRDB').AsString = 'D' then
          Saldo := Saldo + QRel.FieldByName('SALDO_ATUAL').AsFloat;

        if QRel.FieldByName('CRDB').AsString = 'C' then
          Saldo := Saldo - QRel.FieldByName('SALDO_ATUAL').AsFloat;
      end;

      for X := 1 to 2 do
      begin


        if FrmPrincipal.Config.FieldByName('SPED').AsString = 'True' then
        Begin
          QRel.Sql.Clear;
          QRel.Sql.Add('SELECT SUM(RAZAO.VALOR) AS VALOR');
          QRel.Sql.Add('FROM RAZAO');
          QRel.Sql.Add('INNER JOIN TRANSACOES ON RAZAO.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID');
          QRel.Sql.Add('WHERE');

          if X = 1 then
          QRel.Sql.Add('(CONTA_DB = :CONTA)')
          else
          QRel.Sql.Add('(CONTA_CR = :CONTA)');

          QRel.Sql.Add('AND (RAZAO.DT_TRANS < :DT_INICIAL)');
          QRel.Sql.Add('AND (RAZAO.EMPRESA_ID = :EMPRESA_ID)');
          QRel.Sql.Add('AND (RAZAO.TPCTB <= :TPCTB)');
          QRel.Sql.Add('AND ((CONDUTA = :COND_02 AND DEPTO= :DEPTO_02)');
          QRel.Sql.Add('OR (CONDUTA = :COND_01 AND DEPTO= :DEPTO_03)');
          QRel.Sql.Add('OR (CONDUTA = :COND_02 AND DEPTO= :DEPTO_07)');
          QRel.Sql.Add('OR (CONDUTA = :COND_02 AND DEPTO= :DEPTO_04)');
          QRel.Sql.Add('OR (CONDUTA = :COND_08) OR (CONDUTA = :COND_07) OR (MODELO = :MODELO) OR (MODELO = :MODELO1)');
          QRel.Sql.Add('OR (RAZAO.TRANSACAO_ID IN(SELECT TRANSACAO_ID FROM COMPL_NFISCAL))');
          QRel.Sql.Add('OR (RAZAO.TRANSACAO_ID IN(SELECT TRANSACAO_ID FROM COMPL_NFCEFISCAL)))');


          QRel.ParamByName('CONTA').AsString        := QBanco.FieldByName('COD_CONTABIL').AsString;
          QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
          QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
          QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
          QRel.ParamByName('COND_01').AsString      := '01';
          QRel.ParamByName('COND_02').AsString      := '02';
          QRel.ParamByName('COND_07').AsString      := '07';
          QRel.ParamByName('COND_08').AsString      := '08';
          QRel.ParamByName('DEPTO_02').AsString     := '02';
          QRel.ParamByName('DEPTO_03').AsString     := '03';
          QRel.ParamByName('DEPTO_04').AsString     := '04';
          QRel.ParamByName('DEPTO_07').AsString     := '07';
          QRel.ParamByName('MODELO').AsString       := '2D';
          QRel.ParamByName('MODELO1').AsString      := '65';


          QRel.Prepare;
          QRel.Open;

        End
        Else
        Begin

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
          QRel.Sql.Add('AND (TRANSACAO_ID NOT IN(SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
          QRel.Sql.Add('AND (TRANSACAO_ID NOT IN(SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

          QRel.ParamByName('CONTA').AsString        := QBanco.FieldByName('COD_CONTABIL').AsString;
          QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
          QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
          QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;

          QRel.Prepare;
          QRel.Open;
        End;

        if X = 1 then
          Saldo := SALDO + QRel.FieldByName('VALOR').AsFloat
        else
          Saldo := SALDO - QRel.FieldByName('VALOR').AsFloat;
      end;

      Sd := Saldo;
    end;

    // ALTERADO PARA SAIR NO RELATORIO SOMENTE MOVIMENTAÇÕES FISCAIS 03/07/14.

    if FrmPrincipal.Config.FieldByName('SPED').AsString = 'True' then
    Begin     
    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT RAZAO.DT_TRANS, RAZAO.NUM_DOC, RAZAO.HISTORICO, CASE');
    QRel.Sql.Add('WHEN CONTA_DB = :CONTA_DB THEN RAZAO.VALOR END CREDITO, CASE');
    QRel.Sql.Add('WHEN CONTA_CR = :CONTA_CR THEN RAZAO.VALOR END DEBITO');
    QRel.Sql.Add('FROM RAZAO');
    QRel.Sql.Add('INNER JOIN TRANSACOES ON RAZAO.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(RAZAO.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
    QRel.Sql.Add('AND (RAZAO.EMPRESA_ID = :EMPRESA_ID)');
    QRel.Sql.Add('AND (RAZAO.TPCTB <= :TPCTB)');
    QRel.Sql.Add('AND (CONTA_DB = :BANCO_DB OR CONTA_CR = :BANCO_CR)');
    QRel.Sql.Add('AND ((CONDUTA = :COND_02 AND DEPTO= :DEPTO_02)');
    QRel.Sql.Add('OR (CONDUTA = :COND_01 AND DEPTO= :DEPTO_03)');
    QRel.Sql.Add('OR (CONDUTA = :COND_02 AND DEPTO= :DEPTO_07)');
    QRel.Sql.Add('OR (CONDUTA = :COND_02 AND DEPTO= :DEPTO_04)');
    QRel.Sql.Add('OR (CONDUTA = :COND_08) OR (CONDUTA = :COND_07) OR (MODELO = :MODELO)');
    QRel.Sql.Add('OR (RAZAO.TRANSACAO_ID IN(SELECT TRANSACAO_ID FROM COMPL_NFCEFISCAL))');
    QRel.Sql.Add('OR (RAZAO.TRANSACAO_ID IN(SELECT TRANSACAO_ID FROM COMPL_NFISCAL)))');
    QRel.Sql.Add('ORDER BY RAZAO.DT_TRANS, RAZAO.TRANSACAO_ID');

    QRel.ParamByName('CONTA_DB').AsString     := QBanco.FieldByName('COD_CONTABIL').AsString;
    QRel.ParamByName('CONTA_CR').AsString     := QBanco.FieldByName('COD_CONTABIL').AsString;
    QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
    QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    QRel.ParamByName('BANCO_DB').AsString     := QBanco.FieldByName('COD_CONTABIL').AsString;
    QRel.ParamByName('BANCO_CR').AsString     := QBanco.FieldByName('COD_CONTABIL').AsString;
    QRel.ParamByName('COND_01').AsString      := '01';
    QRel.ParamByName('COND_02').AsString      := '02';
    QRel.ParamByName('COND_07').AsString      := '07';
    QRel.ParamByName('COND_08').AsString      := '08';
    QRel.ParamByName('DEPTO_02').AsString     := '02';
    QRel.ParamByName('DEPTO_03').AsString     := '03';
    QRel.ParamByName('DEPTO_04').AsString     := '04';
    QRel.ParamByName('DEPTO_07').AsString     := '07';
    QRel.ParamByName('MODELO').AsString       := '2D';
    QRel.ParamByName('MODELO').AsString       := '65';

    QRel.Prepare;
    QRel.Open;
    End
    Else
    Begin
    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT DT_TRANS, NUM_DOC, HISTORICO, CASE');
    QRel.Sql.Add('WHEN CONTA_DB = :CONTA_DB THEN VALOR END CREDITO, CASE');
    QRel.Sql.Add('WHEN CONTA_CR = :CONTA_CR THEN VALOR END DEBITO');
    QRel.Sql.Add('FROM RAZAO');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
    QRel.Sql.Add('AND (EMPRESA_ID = :EMPRESA_ID)');
    QRel.Sql.Add('AND (TPCTB <= :TPCTB)');
    QRel.Sql.Add('AND (CONTA_DB = :BANCO_DB OR CONTA_CR = :BANCO_CR)');
    QRel.Sql.Add('AND (TRANSACAO_ID NOT IN(SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
    QRel.Sql.Add('AND (TRANSACAO_ID NOT IN(SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

    QRel.Sql.Add('ORDER BY DT_TRANS, TRANSACAO_ID');

    QRel.ParamByName('CONTA_DB').AsString     := QBanco.FieldByName('COD_CONTABIL').AsString;
    QRel.ParamByName('CONTA_CR').AsString     := QBanco.FieldByName('COD_CONTABIL').AsString;
    QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
    QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    QRel.ParamByName('BANCO_DB').AsString     := QBanco.FieldByName('COD_CONTABIL').AsString;
    QRel.ParamByName('BANCO_CR').AsString     := QBanco.FieldByName('COD_CONTABIL').AsString;

    QRel.Prepare;
    QRel.Open;
    End;

    QRLabel1.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;

    if QRel.IsEmpty then
      Application.MessageBox('Não há dados para os parâmetros informados', PChar(Msg_Title), mb_IconInformation)
    else
      Extrato.PreviewModal;
  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;

procedure TFrmExtrato_Caixa.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmExtrato_Caixa.Caixa_BancoChange(Sender: TObject);
begin
  if Caixa_Banco.Value > 0 then
    SearchBanco;

  if QBanco.IsEmpty then
    btnExecuta.Enabled := False
  else
    btnExecuta.Enabled := True;
end;

procedure TFrmExtrato_Caixa.Caixa_BancoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = Caixa_Banco) then
    btnCaixa_BancoClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmExtrato_Caixa.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
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

procedure TFrmExtrato_Caixa.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmExtrato_Caixa.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
   // Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmExtrato_Caixa.ExtratoBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  Saldo := Sd;
end;

procedure TFrmExtrato_Caixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmExtrato_Caixa.FormCreate(Sender: TObject);
begin
  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);
end;

procedure TFrmExtrato_Caixa.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  //QRLabel4.Caption := FormatFloat('#,##0.00', Abs(Saldo));

  if Saldo >= 0 then
  Begin
    QRLabel4.Left := 521;
    QRLabel4.Caption := FormatFloat('#,##0.00', Abs(Saldo));
  End
  else
  Begin
    QRlabel4.Left := 615;
    QRLabel4.Caption := '-' + FormatFloat('#,##0.00', Abs(Saldo));
  End;
end;

end.
