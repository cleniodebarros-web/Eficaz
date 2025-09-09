unit UBalanco_Periodo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, rxToolEdit, DB, IBCustomDataSet, IBQuery,
  QuickRpt, QRCtrls, Buttons, DBCtrls, rxCurrEdit, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmBalanco_Periodo = class(TForm)
    Label1: TLabel;
    Dtmen: TDateEdit;
    Dtmai: TDateEdit;
    Bevel1: TBevel;
    Balanco: TQuickRep;
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
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText8: TQRDBText;
    SummaryBand1: TQRBand;
    QRExpr2: TQRExpr;
    QRLabel9: TQRLabel;
    QRGroup1: TQRGroup;
    QRDBText9: TQRDBText;
    QRBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    CONTA_ID: TCurrencyEdit;
    btnConta: TSpeedButton;
    DBText3: TDBText;
    DataConta: TDataSource;
    Label2: TLabel;
    QRel: TFDQuery;
    QConta: TFDQuery;
    procedure btnRetornaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExecutaClick(Sender: TObject);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DtmenEnter(Sender: TObject);
    procedure btnContaClick(Sender: TObject);
    procedure CONTA_IDExit(Sender: TObject);
    procedure CONTA_IDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DetailSearch(Tabela: String);
  end;

var
  FrmBalanco_Periodo: TFrmBalanco_Periodo;

implementation

uses
  UPrincipal, UData,UConsulta;
  
{$R *.dfm}

procedure TFrmBalanco_periodo.DetailSearch(Tabela: String);
Begin
if ((Tabela = '') or (Tabela = 'Conta')) and (CONTA_ID.Text <> '') then
  begin
    QConta.Close;

    QConta.ParamByName('TABELA_ID').AsInteger := StrToInt(CONTA_ID.Text);

    QConta.Prepare;
    QConta.Open;
  end;
End;

procedure TFrmBalanco_Periodo.btnContaClick(Sender: TObject);
begin
  try
    CONTA_ID.Value := GetConsulta('CONTAS', 0, 0, StrToInt(CONTA_ID.Text));
  except
    CONTA_ID.Value := GetConsulta('CONTAS', 0, 0, 0);
  end;
  DetailSearch('Conta');

end;

procedure TFrmBalanco_Periodo.btnExecutaClick(Sender: TObject);
begin
  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT TRANSACOES.DT_TRANS, TRANSACOES.HISTORICO, TABELAS.DESCRICAO, CASE');
    QRel.Sql.Add('WHEN TRANSACOES.CONDUTA = :CREDITO THEN TRANSACOES.VALOR');
    QRel.Sql.Add('WHEN TRANSACOES.CONDUTA = :DEBITO THEN (TRANSACOES.VALOR * -1)');
    QRel.Sql.Add('END VALOR');
    QRel.Sql.Add('FROM TRANSACOES');
    QRel.Sql.Add('INNER JOIN TABELAS');
    QRel.Sql.Add('ON (TRANSACOES.CONTA_ID = TABELAS.TABELA_ID)');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('((TRANSACOES.CONDUTA = :COND_CR) OR (TRANSACOES.CONDUTA = :COND_DB))');
    QRel.Sql.Add('AND (TRANSACOES.DEPTO <> :DEPTO)');
    QRel.Sql.Add('AND (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
    QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
    QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
    QRel.Sql.Add('AND (TABELAS.TIPO_TABELA = :TIPO_TABELA)');

    if Conta_id.Value > 0 then
       QRel.Sql.Add('AND (TABELAS.TABELA_ID = :TABELA_ID)');

    QRel.Sql.Add('ORDER BY TABELAS.DESCRICAO, TRANSACOES.DT_TRANS, TRANSACOES.TRANSACAO_ID');
    QRel.ParamByName('CREDITO').AsString      := '01';
    QRel.ParamByName('DEBITO').AsString       := '02';
    QRel.ParamByName('COND_CR').AsString      := '01';
    QRel.ParamByName('COND_DB').AsString      := '02';
    QRel.ParamByName('DEPTO').AsString        := '04';
    QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
    QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    QRel.ParamByName('TIPO_TABELA').AsString  := '4';

    if Conta_id.Value > 0 then
       QRel.ParamByName('TABELA_ID').AsInteger  := StrToInt(Conta_id.Text);

    QRel.Prepare;
    QRel.Open;

    QRLabel1.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;

    if QRel.IsEmpty then
      Application.MessageBox('Não há dados para os parâmetros informados', PChar(Msg_Title), mb_IconInformation)
    else
      Balanco.PreviewModal;
  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;

procedure TFrmBalanco_Periodo.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmBalanco_Periodo.CONTA_IDExit(Sender: TObject);
begin
DeTailSearch('Conta');
end;

procedure TFrmBalanco_Periodo.CONTA_IDKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = CONTA_ID) then
    btnContaClick(Self);

end;

procedure TFrmBalanco_Periodo.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmBalanco_Periodo.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
  //  Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmBalanco_Periodo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmBalanco_Periodo.FormCreate(Sender: TObject);
begin
  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);
end;

end.
