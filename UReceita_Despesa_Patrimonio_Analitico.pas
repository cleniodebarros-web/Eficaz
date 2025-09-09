unit UReceita_Despesa_Patrimonio_Analitico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, rxCurrEdit, rxToolEdit, Buttons, DBCtrls,
  DB, IBCustomDataSet, IBQuery, QuickRpt, QRCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmReceita_Despesa_Patrimonio_Analitico = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    Dtmen: TDateEdit;
    Patrimonio: TCurrencyEdit;
    Dtmai: TDateEdit;
    btnPatrimonio: TSpeedButton;
    DataPatrimonio: TDataSource;
    DBText1: TDBText;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    RelReceita_Despesa_Patrimonio_Analitico: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    ColumnHeaderBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText14: TQRDBText;
    QRBand1: TQRBand;
    QRShape3: TQRShape;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRGroup1: TQRGroup;
    QRDBText13: TQRDBText;
    QRDBText15: TQRDBText;
    QRSysData1: TQRSysData;
    Cabec: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel1: TQRLabel;
    Label3: TLabel;
    Conta_Combustivel: TCurrencyEdit;
    btnConta: TSpeedButton;
    QRBand2: TQRBand;
    QRLabel25: TQRLabel;
    QRel: TFDQuery;
    QPatrimonio: TFDQuery;
    procedure btnRetornaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnPatrimonioClick(Sender: TObject);
    procedure PatrimonioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure PatrimonioChange(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure DtmenEnter(Sender: TObject);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure btnContaClick(Sender: TObject);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SearchPatrimonio;
  end;

var
  FrmReceita_Despesa_Patrimonio_Analitico: TFrmReceita_Despesa_Patrimonio_Analitico;
  REC, DESP, CTA, COMB, QT: Real;

implementation

uses
  UData, UConsulta, UPrincipal;

{$R *.dfm}

procedure TFrmReceita_Despesa_Patrimonio_Analitico.SearchPatrimonio;
begin
  QPatrimonio.Close;
  QPatrimonio.ParamByName('PATRIMONIO_ID').AsInteger := StrToInt(Patrimonio.Text);
  QPatrimonio.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;

  QPatrimonio.Prepare;
  QPatrimonio.Open;

  if QPatrimonio.IsEmpty then
    btnExecuta.Enabled := False
  else
    btnExecuta.Enabled := True;
end;

procedure TFrmReceita_Despesa_Patrimonio_Analitico.btnPatrimonioClick(Sender: TObject);
begin
  try
    Patrimonio.Value := GetConsulta('PATRIMÔNIO', 0, 0, StrToInt(Patrimonio.Text));
  except
    Patrimonio.Value := GetConsulta('PATRIMÔNIO', 0, 0, 0);
  end;
end;

procedure TFrmReceita_Despesa_Patrimonio_Analitico.btnContaClick(
  Sender: TObject);
begin
  try
    Conta_Combustivel.Value := GetConsulta('PLANO', 0, 0, StrToInt(Conta_Combustivel.Text));
  except
    Conta_Combustivel.Value := GetConsulta('PLANO', 0, 0, 0);
  end;
end;

procedure TFrmReceita_Despesa_Patrimonio_Analitico.btnExecutaClick(Sender: TObject);
var
X: Integer;
begin
// 151, 325

  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT TRANSACOES.*, TABELAS.DESCRICAO CONTA_DESPESA');
    QRel.Sql.Add('FROM TRANSACOES');
    QRel.Sql.Add('INNER JOIN TABELAS');
    QRel.Sql.Add('ON (TRANSACOES.CONTA_ID = TABELAS.TABELA_ID AND TABELAS.TIPO_TABELA = :TIPO_TABELA)');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
    QRel.Sql.Add('AND (TRANSACOES.PATRIMONIO_ID = :PATRIMONIO_ID)');
    QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
    QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
    QRel.Sql.Add('ORDER BY TABELAS.DESCRICAO, TRANSACOES.DT_TRANS, TRANSACOES.TRANSACAO_ID');

    QRel.ParamByName('TIPO_TABELA').AsString    := '4';
    QRel.ParamByName('DT_INICIAL').AsDateTime   := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime     := Dtmai.Date;
    QRel.ParamByName('PATRIMONIO_ID').AsInteger := StrToInt(Patrimonio.Text);
    QRel.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    QRel.ParamByName('TPCTB').AsString          := FrmData.QAcesso.FieldByName('TPCTB').AsString;

    QRel.Prepare;
    QRel.Open;
    
    QRLabel1.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;

    REC  := 0;
    DESP := 0;
    CTA  := 0;
    COMB := 0;
    QT   := 0;

    if QRel.IsEmpty then
      Application.MessageBox('Não há dados para os parâmetros informados', PChar(Msg_Title), mb_IconInformation)
    else
      RelReceita_Despesa_Patrimonio_Analitico.PreviewModal;
  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;

procedure TFrmReceita_Despesa_Patrimonio_Analitico.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmReceita_Despesa_Patrimonio_Analitico.PatrimonioChange(Sender: TObject);
begin
  if Patrimonio.Value > 0 then
    SearchPatrimonio;

  if QPatrimonio.IsEmpty then
    btnExecuta.Enabled := False
  else
    btnExecuta.Enabled := True;
end;

procedure TFrmReceita_Despesa_Patrimonio_Analitico.PatrimonioKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = Patrimonio) then
    btnPatrimonioClick(Self);

  if (Key = Vk_F7) and (Sender = Conta_Combustivel) then
    btnContaClick(Self);
    
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmReceita_Despesa_Patrimonio_Analitico.QRBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
KMI, KMF, QTF, DPF: Real;
begin
  KMF := 0;
  QTF := 0;
  KMI := 0;
  DPF := 0;

  QRel.Last;
  while not QRel.Bof do
  begin
    if QRel.FieldByName('ODOMETRO').AsFloat > 0 then
    begin
      if KMF = 0 then
        KMF := QRel.FieldByName('ODOMETRO').AsFloat;

      if QTF = 0 then
        QTF := QRel.FieldByName('QUANTIDADE').AsFloat;

      if DPF = 0 then
        DPF := QRel.FieldByName('VALOR').AsFloat;

      KMI := QRel.FieldByName('ODOMETRO').AsFloat;
    end;

    QRel.Prior;
  end;

  QRLabel17.Caption := 'Receitas do Patrimônio no Período -> ' + FormatFloat('#,##0.00', REC);
  QRLabel18.Caption := 'Despesas do Patrimônio no Período -> ' + FormatFloat('#,##0.00', DESP);
  QRLabel19.Caption := 'Custo Total de Combustível -> ' + FormatFloat('#,##0.00', COMB);
  QRLabel20.Caption := 'Consumo Total de Combustível -> ' + FormatFloat('#,##0.00', QT);
  QRLabel21.Caption := 'Custo de Diversos s/ Combustível -> ' + FormatFloat('#,##0.00', Abs(DESP - COMB));
  QRLabel22.Caption := 'Total de Hs. ou kms. Trabalhados -> ' + FormatFloat('#,##0.00', (KMF - KMI));
  QRLabel23.Caption := 'Média de Hs. ou Kms./Lts. de Combustível -> ' + FormatFloat('#,##0.00', (KMF - KMI) / Abs(QT - QTF));
  QRLabel24.Caption := 'Custo por Hs. ou Kms. Trabalhados -> ' + FormatFloat('#,##0.00', Abs(COMB - DPF) / (KMF - KMI));
end;

procedure TFrmReceita_Despesa_Patrimonio_Analitico.QRBand2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  QRLabel25.Caption := 'Sub-Total -> ' + FormatFloat('#,##0.00', CTA);

  CTA := 0;
end;

procedure TFrmReceita_Despesa_Patrimonio_Analitico.DetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if QRel.FieldByName('CONDUTA').AsString = '02' then
  begin
    QRDBText12.Left := 548;

    DESP := DESP + QRel.FieldByName('VALOR').AsFloat;
    CTA  := CTA - QRel.FieldByName('VALOR').AsFloat;

    if QRel.FieldByName('CONTA_ID').AsInteger = StrToInt(Conta_Combustivel.Text) then
    begin
      COMB := COMB + QRel.FieldByName('VALOR').AsFloat;
      QT   := QT + QRel.FieldByName('QUANTIDADE').AsFloat;
    end;
  end
  else
  begin
    QRDBText12.Left := 625;

    REC := REC + QRel.FieldByName('VALOR').AsFloat;
    CTA := CTA + QRel.FieldByName('VALOR').AsFloat;
  end;
end;

procedure TFrmReceita_Despesa_Patrimonio_Analitico.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmReceita_Despesa_Patrimonio_Analitico.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
   // Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmReceita_Despesa_Patrimonio_Analitico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmReceita_Despesa_Patrimonio_Analitico.FormCreate(Sender: TObject);
begin
  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);
end;

end.
