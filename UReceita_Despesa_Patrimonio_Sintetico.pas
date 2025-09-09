unit UReceita_Despesa_Patrimonio_Sintetico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, rxCurrEdit, rxToolEdit, Buttons, DBCtrls,
  DB, IBCustomDataSet, IBQuery, QuickRpt, QRCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmReceita_Despesa_Patrimonio_Sintetico = class(TForm)
    Label1: TLabel;
    Bevel1: TBevel;
    Dtmen: TDateEdit;
    Dtmai: TDateEdit;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    RelReceita_Despesa_Patrimonio_Sintetico: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText12: TQRDBText;
    ColumnHeaderBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText15: TQRDBText;
    QRSysData1: TQRSysData;
    Cabec: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel1: TQRLabel;
    QRBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRShape3: TQRShape;
    QRel: TFDQuery;
    procedure btnRetornaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnExecutaClick(Sender: TObject);
    procedure DtmenEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmReceita_Despesa_Patrimonio_Sintetico: TFrmReceita_Despesa_Patrimonio_Sintetico;

implementation

uses
  UData, UConsulta, UPrincipal;

{$R *.dfm}

procedure TFrmReceita_Despesa_Patrimonio_Sintetico.btnExecutaClick(Sender: TObject);
var
X: Integer;
begin
// 99, 325

  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT PATRIMONIO.DESCRICAO,');
    QRel.Sql.Add('SUM(IIF((TRANSACOES.CONDUTA = :COND_CR), TRANSACOES.VALOR, 0)) CREDITO,');
    QRel.Sql.Add('SUM(IIF((TRANSACOES.CONDUTA = :COND_DB), TRANSACOES.VALOR, 0)) DEBITO');
    QRel.Sql.Add('FROM TRANSACOES');
    QRel.Sql.Add('INNER JOIN PATRIMONIO');
    QRel.Sql.Add('ON (TRANSACOES.PATRIMONIO_ID = PATRIMONIO.PATRIMONIO_ID)');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
    QRel.Sql.Add('AND (TRANSACOES.PATRIMONIO_ID > 0)');
    QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
    QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
    QRel.Sql.Add('GROUP BY PATRIMONIO.DESCRICAO');

    QRel.ParamByName('COND_CR').AsString      := '01';
    QRel.ParamByName('COND_DB').AsString      := '02';
    QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
    QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;

    QRel.Prepare;
    QRel.Open;

    QRLabel1.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;

    if QRel.IsEmpty then
      Application.MessageBox('Não há dados para os parâmetros informados', PChar(Msg_Title), mb_IconInformation)
    else
      RelReceita_Despesa_Patrimonio_Sintetico.PreviewModal;
  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;

procedure TFrmReceita_Despesa_Patrimonio_Sintetico.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmReceita_Despesa_Patrimonio_Sintetico.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmReceita_Despesa_Patrimonio_Sintetico.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
  //  Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmReceita_Despesa_Patrimonio_Sintetico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmReceita_Despesa_Patrimonio_Sintetico.FormCreate(Sender: TObject);
begin
  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);
end;

end.
