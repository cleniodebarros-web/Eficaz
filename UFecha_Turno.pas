unit UFecha_Turno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Mask, rxToolEdit, rxCurrEdit, DBCtrls,
  DB, IBCustomDataSet, IBQuery, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrmFecha_Turno = class(TForm)
    Bevel1: TBevel;
    btnExecuta: TBitBtn;
    btnRetorna: TBitBtn;
    Label2: TLabel;
    Dt_Saida: TDateEdit;
    Label3: TLabel;
    Label8: TLabel;
    Saldo_Final: TRxCalcEdit;
    Hora_Saida: TMaskEdit;
    QTurno: TFDQuery;
    QRel: TFDQuery;
    procedure btnExecutaClick(Sender: TObject);
    procedure Dt_SaidaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Dt_SaidaEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Saldo_FinalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFecha_Turno: TFrmFecha_Turno;

implementation

uses
  UPrincipal, UData;

{$R *.dfm}

procedure TFrmFecha_Turno.btnExecutaClick(Sender: TObject);
begin
  try
    QRel.Sql.Clear;
    QRel.Sql.Add('UPDATE TURNO SET DT_FINAL = :DT_FINAL, HORA_FINAL = :HORA_FINAL, SALDO_FINAL = :SALDO_FINAL, STATUS = :STATUS_ATUAL WHERE CAIXA_ID = :CAIXA_ID AND STATUS = :STATUS');

    QRel.ParamByName('DT_FINAL').AsDateTime   := Dt_Saida.Date;
    QRel.ParamByName('HORA_FINAL').AsString   := Hora_Saida.Text;
    QRel.ParamByName('SALDO_FINAL').AsFloat   := Saldo_Final.Value;
    QRel.ParamByName('STATUS_ATUAL').AsString := 'F';
    QRel.ParamByName('CAIXA_ID').AsInteger    := StrToInt(LeIni(Arq_Ini, 'Sistema', 'Caixa'));
    QRel.ParamByName('STATUS').AsString       := 'A';

    QRel.Prepare;
    QRel.ExecSql;



    Close;
  except
    Application.MessageBox('Ocorreu um erro ao fechar o turno. Verifique as informações', PChar(Msg_Title), mb_IconStop);
  end;
end;

procedure TFrmFecha_Turno.Dt_SaidaEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmFecha_Turno.Dt_SaidaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmFecha_Turno.FormCreate(Sender: TObject);
begin
  Dt_Saida.Date   := date;
  Hora_Saida.Text := TimeToStr(time);
end;

procedure TFrmFecha_Turno.FormShow(Sender: TObject);
begin
  QTurno.Sql.Clear;
  QTurno.Sql.Add('SELECT * FROM TURNO');
  QTurno.Sql.Add('WHERE');
  QTurno.Sql.Add('(STATUS = :STATUS)');
  QTurno.Sql.Add('AND (CAIXA_ID = :CAIXA_ID)');

  QTurno.ParamByName('STATUS').AsString    := 'A';
  QTurno.ParamByName('CAIXA_ID').AsInteger := StrToInt(LeIni(Arq_Ini, 'Sistema', 'Caixa'));

  QTurno.Prepare;
  QTurno.Open;

  QRel.Sql.Clear;
  QRel.Sql.Add('SELECT SUM(VALOR) VALOR');
  QRel.Sql.Add('FROM TRANSACOES');
  QRel.Sql.Add('WHERE');
  QRel.Sql.Add('(TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
  QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
  QRel.Sql.Add('AND (TRANSACOES.DT_TRANS = :DT_INICIAL)');
  QRel.Sql.Add('AND (TRANSACOES.HORA > :HR_INICIAL)');
  QRel.Sql.Add('AND (TRANSACOES.OPERADOR = :OPERADOR)');
  QRel.Sql.Add('AND (TRANSACOES.BANCO_ID = :BANCO_ID)');

  QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
  QRel.ParamByName('DT_INICIAL').AsDateTime := QTurno.FieldByName('DT_INICIAL').AsDateTime;
  QRel.ParamByName('HR_INICIAL').AsString   := QTurno.FieldByName('HORA_INICIAL').AsString;
  QRel.ParamByName('OPERADOR').AsString     := Copy(QTurno.FieldByName('OPERADOR').AsString, 1, 14);
  QRel.ParamByName('BANCO_ID').AsInteger    := QTurno.FieldByName('CAIXA_ID').AsInteger;

  QRel.Prepare;
  QRel.Open;

  Saldo_Final.Value := (QTurno.FieldByName('SALDO_INICIAL').AsFloat + QRel.FieldByName('VALOR').AsFloat);
end;

procedure TFrmFecha_Turno.Saldo_FinalKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

end.
