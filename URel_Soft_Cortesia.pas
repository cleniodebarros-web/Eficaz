unit URel_Soft_Cortesia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, IBCustomDataSet, IBQuery, Buttons, ExtCtrls, Mask,
  rxToolEdit, QuickRpt, QRCtrls, DBCtrls, rxCurrEdit, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmRel_Soft_Cortesia = class(TForm)
    Label1: TLabel;
    Dtmen: TDateEdit;
    Dtmai: TDateEdit;
    Label2: TLabel;
    Bevel1: TBevel;
    btnExecuta: TBitBtn;
    btnRetorna: TBitBtn;
    Operador: TComboBox;
    Rel_Vendas_Operador: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    QRSysData1: TQRSysData;
    Cabec: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape2: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel8: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRBand1: TQRBand;
    QRShape4: TQRShape;
    QRLabel20: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRGroup1: TQRGroup;
    QRDBText3: TQRDBText;
    QRBand2: TQRBand;
    QRShape3: TQRShape;
    QRLabel2: TQRLabel;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRGroup2: TQRGroup;
    QRDBText9: TQRDBText;
    QRBand3: TQRBand;
    QRLabel1: TQRLabel;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRShape5: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel9: TQRLabel;
    Label8: TLabel;
    Cliente: TCurrencyEdit;
    DBText1: TDBText;
    btnCliente: TSpeedButton;
    DataCliente: TDataSource;
    QCliente: TFDQuery;
    QRel: TFDQuery;
    procedure btnExecutaClick(Sender: TObject);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRetornaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure OperadorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DtmenEnter(Sender: TObject);
    procedure btnClienteClick(Sender: TObject);
    procedure ClienteChange(Sender: TObject);
    procedure SearchCliente;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Soft_Cortesia: TFrmRel_Soft_Cortesia;

implementation

uses
  UData, UPrincipal,UConsulta;

{$R *.dfm}
procedure TFrmRel_Soft_Cortesia.SearchCliente;
begin
  QCliente.Close;
  QCliente.ParamByName('CLIENTE_ID').AsInteger := StrToInt(Cliente.Text);
  QCliente.Prepare;
  QCliente.Open;
end;

procedure TFrmRel_Soft_Cortesia.btnClienteClick(Sender: TObject);
begin
  try
    Cliente.Value := GetConsulta('CLIENTES', 0, 0, StrToInt(Cliente.Text));
  except
    Cliente.Value := GetConsulta('CLIENTES', 0, 0, 0);
  end;

end;

procedure TFrmRel_Soft_Cortesia.btnExecutaClick(Sender: TObject);
begin
// 125, 327

  QRel.Sql.Clear;
  QRel.Sql.Add('SELECT TRANSACOES.*, OPERADORES.NOME, CLIENTES.NOME CORTESIA');
  QRel.Sql.Add('FROM TRANSACOES');
  QRel.Sql.Add('LEFT JOIN OPERADORES');
  QRel.Sql.Add('ON (CAST(TRANSACOES.OPERADOR AS INTEGER) = CAST(OPERADORES.OPERADOR_ID AS INTEGER))');
  QRel.Sql.Add('INNER JOIN CLIENTES ON CLIENTES.CLIENTE_ID = TRANSACOES.CLIENTE_ID');
  QRel.Sql.Add('WHERE');
  QRel.Sql.Add('(TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
  QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :CD_VDA)');
  QRel.Sql.Add('AND (TRANSACOES.DEPTO = :DP_VDA)');
  QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
  QRel.Sql.Add('AND (TRANSACOES.DT_ENT_SAI BETWEEN :DT_INICIAL AND :DT_FINAL)');
  QRel.Sql.Add('AND (TRANSACOES.OBSERVACAO LIKE :OBS)');

  if Cliente.Value > 0 then
  begin
    QRel.Sql.Add('AND (CLIENTE_ID = :CLIENTE_ID)');
    QRel.ParamByName('CLIENTE_ID').AsInteger := StrToInt(Cliente.Text);
  end;

  if Operador.Text <> '' then
  begin
    QRel.Sql.Add('AND (OPERADORES.NOME = :NOME)');
    QRel.ParamByName('NOME').AsString := Operador.Text;
  end
  else
    QRel.Sql.Add('AND (TRANSACOES.OPERADOR IS NOT NULL)');


  QRel.Sql.Add('ORDER BY OPERADORES.NOME, TRANSACOES.DT_ENT_SAI');

  QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  QRel.ParamByName('CD_VDA').AsString       := '01';
  QRel.ParamByName('DP_VDA').AsString       := '07';
  QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
  QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
  QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
  QRel.ParamByName('OBS').AsByteStr         := 'Cortesia%';

  QRel.Prepare;
  QRel.Open;

  QRLabel13.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;

  if QRel.IsEmpty then
    Application.MessageBox('Não há dados para serem impressos', PChar(Msg_Title), mb_IconInformation)
  else
    Rel_Vendas_Operador.PreviewModal;
end;

procedure TFrmRel_Soft_Cortesia.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRel_Soft_Cortesia.ClienteChange(Sender: TObject);
begin
if Cliente.Value > 0 then
     SearchCliente;
end;

procedure TFrmRel_Soft_Cortesia.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmRel_Soft_Cortesia.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
 //   Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmRel_Soft_Cortesia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmRel_Soft_Cortesia.FormCreate(Sender: TObject);
begin
  QRel.Sql.Clear;
  QRel.Sql.Add('SELECT * FROM OPERADORES');
  QRel.Sql.Add('ORDER BY NOME');

  QRel.Prepare;
  QRel.Open;

  Operador.Items.Add('');

  QRel.First;
  while not QRel.Eof do
  begin
    Operador.Items.Add(QRel.FieldByName('NOME').AsString);

    Application.ProcessMessages;
    QRel.Next;
  end;

  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);
end;

procedure TFrmRel_Soft_Cortesia.OperadorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

end.
