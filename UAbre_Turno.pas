unit UAbre_Turno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Mask, rxToolEdit, rxCurrEdit, DBCtrls,
  DB, IBCustomDataSet, IBQuery, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrmAbre_Turno = class(TForm)
    Bevel1: TBevel;
    Label1: TLabel;
    btnExecuta: TBitBtn;
    btnRetorna: TBitBtn;
    Label2: TLabel;
    Dt_Entrada: TDateEdit;
    Label3: TLabel;
    Operador: TComboBox;
    Label8: TLabel;
    Saldo_Inicial: TRxCalcEdit;
    Hora_Entrada: TMaskEdit;
    QRel: TFDQuery;
    procedure btnExecutaClick(Sender: TObject);
    procedure Dt_EntradaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Dt_EntradaEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure OperadorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    function Validacao: Boolean;
  end;

var
  FrmAbre_Turno: TFrmAbre_Turno;

implementation

uses
  UPrincipal, UData;

{$R *.dfm}

function TFrmAbre_Turno.Validacao: Boolean;
begin
  Result := False;

  Operador.Color := clWindow;

  if Operador.Text = '' then
  begin
    Application.MessageBox('Operador inexistente', PChar(Msg_Title), mb_IconStop);
    Operador.Color := clYellow;
    Operador.SetFocus;
    exit;
  end;

  Result := True;
end;

procedure TFrmAbre_Turno.btnExecutaClick(Sender: TObject);
begin
  if Validacao then
  begin
    try
      QRel.Sql.Clear;
      QRel.Sql.Add('INSERT INTO TURNO(DT_INICIAL, HORA_INICIAL, OPERADOR, CAIXA_ID, SALDO_INICIAL, STATUS) VALUES(:DT_INICIAL, :HORA_INICIAL, :OPERADOR, :CAIXA_ID, :SALDO_INICIAL, :STATUS)');

      QRel.ParamByName('DT_INICIAL').AsDateTime := Dt_Entrada.Date;
      QRel.ParamByName('HORA_INICIAL').AsString := Hora_Entrada.Text;
      QRel.ParamByName('OPERADOR').AsString     := Operador.Text;
      QRel.ParamByName('STATUS').AsString       := 'A';
      QRel.ParamByName('CAIXA_ID').AsInteger    := StrToInt(LeIni(Arq_Ini, 'Sistema', 'Caixa'));
      QRel.ParamByName('SALDO_INICIAL').AsFloat := Saldo_Inicial.Value;

      QRel.Prepare;
      QRel.ExecSql;



      Close;
    except
      Application.MessageBox('Ocorreu um erro ao abrir o turno. Verifique as informações', PChar(Msg_Title), mb_IconStop);
    end;
  end;
end;

procedure TFrmAbre_Turno.Dt_EntradaEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmAbre_Turno.Dt_EntradaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmAbre_Turno.FormCreate(Sender: TObject);
begin
  Operador.Items.Clear;

  QRel.Sql.Clear;
  QRel.Sql.Add('SELECT DISTINCT NOME FROM OPERADORES');
  QRel.Sql.Add('ORDER BY NOME');

  QRel.Prepare;
  QRel.Open;

  QRel.First;
  while not QRel.Eof do
  begin
    Operador.Items.Add(QRel.FieldByName('NOME').AsString);

    Application.ProcessMessages;
    QRel.Next;
  end;

  Dt_Entrada.Date   := date;
  Hora_Entrada.Text := TimeToStr(time);
end;

procedure TFrmAbre_Turno.OperadorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

end.
