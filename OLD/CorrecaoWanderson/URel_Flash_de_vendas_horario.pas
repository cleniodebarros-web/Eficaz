unit URel_Flash_de_vendas_horario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, IBCustomDataSet, IBQuery, Buttons, ExtCtrls, Mask,
  rxToolEdit, QuickRpt, QRCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrmRel_Flash_de_vendas_horario = class(TForm)
    Label1: TLabel;
    Dtmen: TDateEdit;
    Dtmai: TDateEdit;
    Bevel1: TBevel;
    btnExecuta: TBitBtn;
    btnRetorna: TBitBtn;
    Rel_Vendas_Operador: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    QRSysData1: TQRSysData;
    Cabec: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel8: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText6: TQRDBText;
    QRBand1: TQRBand;
    QRShape4: TQRShape;
    QRLabel20: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr3: TQRExpr;
    QRDBText7: TQRDBText;
    QRLabel11: TQRLabel;
    QRel: TFDQuery;
    procedure btnExecutaClick(Sender: TObject);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRetornaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure OperadorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DtmenEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Flash_de_vendas_horario: TFrmRel_Flash_de_vendas_horario;

implementation

uses
  UData, UPrincipal;

{$R *.dfm}

procedure TFrmRel_Flash_de_vendas_horario.btnExecutaClick(Sender: TObject);
begin
// 125, 327
  QRel.Sql.Clear;

  QRel.Sql.Add('SELECT HORA, VALOR, CAST(CLIENTES AS INTEGER) CLIENTES');
  QRel.Sql.Add('FROM(');
  QRel.Sql.Add('SELECT ' + #39 + '00:00 a 00:59' + #39 + ' HORA,  SUM(VALOR) VALOR, COUNT(CLIENTE_ID) clientes');
  QRel.Sql.Add('FROM TRANSACOES');
  QRel.Sql.Add('WHERE (CONDUTA =:CONDUTA) AND (DEPTO =:DEPTO)');
  QRel.Sql.Add('AND (MODELO = :MODELO)');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
  QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
  QRel.Sql.Add('AND (DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
  QRel.Sql.Add('AND (HORA BETWEEN ' + #39 + '00:00:00' + #39 + ' AND ' + #39 + '00:59:59' + #39 + ')');

  QRel.Sql.Add('UNION ALL');
  QRel.Sql.Add('SELECT ' + #39 + '01:00 a 01:59' + #39 + ' HORA,  SUM(VALOR) VALOR, COUNT(CLIENTE_ID) clientes');
  QRel.Sql.Add('FROM TRANSACOES');
  QRel.Sql.Add('WHERE CONDUTA = :CONDUTA AND DEPTO = :DEPTO');
  QRel.Sql.Add('AND MODELO = :MODELO');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
  QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
  QRel.Sql.Add('AND DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL');
  QRel.Sql.Add('AND HORA BETWEEN ' + #39 + '01:00:00' + #39 + ' AND ' + #39 + '01:59:59' + #39 + '');

  QRel.Sql.Add('UNION ALL');
  QRel.Sql.Add('SELECT ' + #39 + '02:00 a 02:59' + #39 + ' HORA,  SUM(VALOR) VALOR, COUNT(CLIENTE_ID) clientes');
  QRel.Sql.Add('FROM TRANSACOES');
  QRel.Sql.Add('WHERE CONDUTA = :CONDUTA AND DEPTO=:DEPTO');
  QRel.Sql.Add('AND MODELO = :MODELO');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
  QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
  QRel.Sql.Add('AND DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL');
  QRel.Sql.Add('AND HORA BETWEEN ' + #39 + '02:00:00' + #39 + ' AND ' + #39 + '02:59:59' + #39 + '');

  QRel.Sql.Add('UNION ALL');
  QRel.Sql.Add('SELECT ' + #39 + '03:00 a 03:59' + #39 + ' HORA,  SUM(VALOR) VALOR, COUNT(CLIENTE_ID) clientes');
  QRel.Sql.Add('FROM TRANSACOES');
  QRel.Sql.Add('WHERE CONDUTA = :CONDUTA AND DEPTO= :DEPTO');
  QRel.Sql.Add('AND MODELO = :MODELO');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
  QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
  QRel.Sql.Add('AND DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL');
  QRel.Sql.Add('AND HORA BETWEEN ' + #39 + '03:00:00' + #39 + ' AND ' + #39 + '03:59:59' + #39 + '');

  QRel.Sql.Add('UNION ALL');
  QRel.Sql.Add('SELECT ' + #39 + '04:00 a 04:59' + #39 + ' HORA,  SUM(VALOR) VALOR, COUNT(CLIENTE_ID) clientes');
  QRel.Sql.Add('FROM TRANSACOES');
  QRel.Sql.Add('WHERE CONDUTA = :CONDUTA AND DEPTO= :DEPTO');
  QRel.Sql.Add('AND MODELO = :MODELO');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
  QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
  QRel.Sql.Add('AND DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL');
  QRel.Sql.Add('AND HORA BETWEEN ' + #39 + '04:00:00' + #39 + ' AND ' + #39 + '04:59:59' + #39 + '');

  QRel.Sql.Add('UNION ALL');
  QRel.Sql.Add('SELECT ' + #39 + '05:00 a 05:59' + #39 + ' HORA,  SUM(VALOR) VALOR, COUNT(CLIENTE_ID) clientes');
  QRel.Sql.Add('FROM TRANSACOES');
  QRel.Sql.Add('WHERE CONDUTA = :CONDUTA AND DEPTO= :DEPTO');
  QRel.Sql.Add('AND MODELO = :MODELO');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
  QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
  QRel.Sql.Add('AND DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL');
  QRel.Sql.Add('AND HORA BETWEEN ' + #39 + '00:05:00' + #39 + ' AND ' + #39 + '05:59:59' + #39 + '');

  QRel.Sql.Add('UNION ALL');
  QRel.Sql.Add('SELECT ' + #39 + '06:00 a 06:59' + #39 + ' HORA,  SUM(VALOR) VALOR, COUNT(CLIENTE_ID) clientes');
  QRel.Sql.Add('FROM TRANSACOES');
  QRel.Sql.Add('WHERE CONDUTA = :CONDUTA AND DEPTO= :DEPTO');
  QRel.Sql.Add('AND MODELO = :MODELO');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
  QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
  QRel.Sql.Add('AND DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL');
  QRel.Sql.Add('AND HORA BETWEEN ' + #39 + '06:00:00' + #39 + ' AND ' + #39 + '06:59:59' + #39 + '');

  QRel.Sql.Add('UNION ALL');
  QRel.Sql.Add('SELECT ' + #39 + '07:00 a 07:59' + #39 + ' HORA,  SUM(VALOR) VALOR, COUNT(CLIENTE_ID) clientes');
  QRel.Sql.Add('FROM TRANSACOES');
  QRel.Sql.Add('WHERE CONDUTA = :CONDUTA AND DEPTO= :DEPTO');
  QRel.Sql.Add('AND MODELO = :MODELO');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
  QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
  QRel.Sql.Add('AND DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL');
  QRel.Sql.Add('AND HORA BETWEEN ' + #39 + '07:00:00' + #39 + ' AND ' + #39 + '07:59:59' + #39 + '');

  QRel.Sql.Add('UNION ALL');
  QRel.Sql.Add('SELECT ' + #39 + '08:00 a 08:59' + #39 + ' HORA,  SUM(VALOR) VALOR, COUNT(CLIENTE_ID) clientes');
  QRel.Sql.Add('FROM TRANSACOES');
  QRel.Sql.Add('WHERE CONDUTA = :CONDUTA AND DEPTO= :DEPTO');
  QRel.Sql.Add('AND MODELO = :MODELO');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
  QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
  QRel.Sql.Add('AND DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL');
  QRel.Sql.Add('AND HORA BETWEEN ' + #39 + '08:00:00' + #39 + ' AND ' + #39 + '08:59:59' + #39 + '');

  QRel.Sql.Add('UNION ALL');
  QRel.Sql.Add('SELECT ' + #39 + '09:00 a 09:59' + #39 + ' HORA,  SUM(VALOR) VALOR, COUNT(CLIENTE_ID) clientes');
  QRel.Sql.Add('FROM TRANSACOES');
  QRel.Sql.Add('WHERE CONDUTA = :CONDUTA AND DEPTO= :DEPTO');
  QRel.Sql.Add('AND MODELO = :MODELO');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
  QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
  QRel.Sql.Add('AND DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL');
  QRel.Sql.Add('AND HORA BETWEEN ' + #39 + '09:00:00' + #39 + ' AND ' + #39 + '09:59:59' + #39 + '');

  QRel.Sql.Add('UNION ALL');
  QRel.Sql.Add('SELECT ' + #39 + '10:00 a 10:59' + #39 + ' HORA,  SUM(VALOR) VALOR, COUNT(CLIENTE_ID) clientes');
  QRel.Sql.Add('FROM TRANSACOES');
  QRel.Sql.Add('WHERE CONDUTA = :CONDUTA AND DEPTO= :DEPTO');
  QRel.Sql.Add('AND MODELO = :MODELO');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
  QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
  QRel.Sql.Add('AND DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL');
  QRel.Sql.Add('AND HORA BETWEEN ' + #39 + '10:00:00' + #39 + ' AND ' + #39 + '10:59:59' + #39 + '');

  QRel.Sql.Add('UNION ALL');
  QRel.Sql.Add('SELECT ' + #39 + '11:00 a 11:59' + #39 + ' HORA,  SUM(VALOR) VALOR, COUNT(CLIENTE_ID) clientes');
  QRel.Sql.Add('FROM TRANSACOES');
  QRel.Sql.Add('WHERE CONDUTA = :CONDUTA AND DEPTO= :DEPTO');
  QRel.Sql.Add('AND MODELO = :MODELO');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
  QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
  QRel.Sql.Add('AND DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL');
  QRel.Sql.Add('AND HORA BETWEEN ' + #39 + '11:00:00' + #39 + ' AND ' + #39 + '11:59:59' + #39 + '');

  QRel.Sql.Add('UNION ALL');
  QRel.Sql.Add('SELECT ' + #39 + '12:00 a 12:59' + #39 + ' HORA,  SUM(VALOR) VALOR, COUNT(CLIENTE_ID) clientes');
  QRel.Sql.Add('FROM TRANSACOES');
  QRel.Sql.Add('WHERE CONDUTA = :CONDUTA AND DEPTO= :DEPTO');
  QRel.Sql.Add('AND MODELO = :MODELO');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
  QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
  QRel.Sql.Add('AND DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL');
  QRel.Sql.Add('AND HORA BETWEEN ' + #39 + '12:00:00' + #39 + ' AND ' + #39 + '12:59:59' + #39 + '');

  QRel.Sql.Add('UNION ALL');
  QRel.Sql.Add('SELECT ' + #39 + '13:00 a 13:59' + #39 + ' HORA,  SUM(VALOR) VALOR, COUNT(CLIENTE_ID) clientes');
  QRel.Sql.Add('FROM TRANSACOES');
  QRel.Sql.Add('WHERE CONDUTA = :CONDUTA AND DEPTO= :DEPTO');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
  QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
  QRel.Sql.Add('AND MODELO = :MODELO');
  QRel.Sql.Add('AND DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL');
  QRel.Sql.Add('AND HORA BETWEEN ' + #39 + '13:00:00' + #39 + ' AND ' + #39 + '13:59:59' + #39 + '');

  QRel.Sql.Add('UNION ALL');
  QRel.Sql.Add('SELECT ' + #39 + '14:00 a 14:59' + #39 + ' HORA,  SUM(VALOR) VALOR, COUNT(CLIENTE_ID) clientes');
  QRel.Sql.Add('FROM TRANSACOES');
  QRel.Sql.Add('WHERE CONDUTA = :CONDUTA AND DEPTO= :DEPTO');
  QRel.Sql.Add('AND MODELO = :MODELO');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
  QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
  QRel.Sql.Add('AND DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL');
  QRel.Sql.Add('AND HORA BETWEEN ' + #39 + '14:00:00' + #39 + ' AND ' + #39 + '14:59:59' + #39 + '');

  QRel.Sql.Add('UNION ALL');
  QRel.Sql.Add('SELECT ' + #39 + '15:00 a 15:59' + #39 + ' HORA,  SUM(VALOR) VALOR, COUNT(CLIENTE_ID) clientes');
  QRel.Sql.Add('FROM TRANSACOES');
  QRel.Sql.Add('WHERE CONDUTA = :CONDUTA AND DEPTO= :DEPTO');
  QRel.Sql.Add('AND MODELO = :MODELO');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
  QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
  QRel.Sql.Add('AND DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL');
  QRel.Sql.Add('AND HORA BETWEEN ' + #39 + '15:00:00' + #39 + ' AND ' + #39 + '15:59:59' + #39 + '');

  QRel.Sql.Add('UNION ALL');
  QRel.Sql.Add('SELECT ' + #39 + '16:00 a 16:59' + #39 + ' HORA,  SUM(VALOR) VALOR, COUNT(CLIENTE_ID) clientes');
  QRel.Sql.Add('FROM TRANSACOES');
  QRel.Sql.Add('WHERE CONDUTA = :CONDUTA AND DEPTO= :DEPTO');
  QRel.Sql.Add('AND MODELO = :MODELO');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
  QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
  QRel.Sql.Add('AND DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL');
  QRel.Sql.Add('AND HORA BETWEEN ' + #39 + '16:00:00' + #39 + ' AND ' + #39 + '16:59:59' + #39 + '');

  QRel.Sql.Add('UNION ALL');
  QRel.Sql.Add('SELECT ' + #39 + '17:00 a 17:59' + #39 + ' HORA,  SUM(VALOR) VALOR, COUNT(CLIENTE_ID) clientes');
  QRel.Sql.Add('FROM TRANSACOES');
  QRel.Sql.Add('WHERE CONDUTA = :CONDUTA AND DEPTO= :DEPTO');
  QRel.Sql.Add('AND MODELO = :MODELO');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
  QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
  QRel.Sql.Add('AND DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL');
  QRel.Sql.Add('AND HORA BETWEEN ' + #39 + '17:00:00' + #39 + ' AND ' + #39 + '17:59:59' + #39 + '');

  QRel.Sql.Add('UNION ALL');
  QRel.Sql.Add('SELECT ' + #39 + '18:00 a 18:59' + #39 + ' HORA,  SUM(VALOR) VALOR, COUNT(CLIENTE_ID) clientes');
  QRel.Sql.Add('FROM TRANSACOES');
  QRel.Sql.Add('WHERE CONDUTA = :CONDUTA AND DEPTO= :DEPTO');
  QRel.Sql.Add('AND MODELO = :MODELO');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
  QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
  QRel.Sql.Add('AND DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL');
  QRel.Sql.Add('AND HORA BETWEEN ' + #39 + '18:00:00' + #39 + ' AND ' + #39 + '18:59:59' + #39 + '');

  QRel.Sql.Add('UNION ALL');
  QRel.Sql.Add('SELECT ' + #39 + '19:00 a 19:59' + #39 + ' HORA,  SUM(VALOR) VALOR, COUNT(CLIENTE_ID) clientes');
  QRel.Sql.Add('FROM TRANSACOES');
  QRel.Sql.Add('WHERE CONDUTA = :CONDUTA AND DEPTO= :DEPTO');
  QRel.Sql.Add('AND MODELO = :MODELO');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
  QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
  QRel.Sql.Add('AND DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL');
  QRel.Sql.Add('AND HORA BETWEEN ' + #39 + '19:00:00' + #39 + ' AND ' + #39 + '19:59:59' + #39 + '');

  QRel.Sql.Add('UNION ALL');
  QRel.Sql.Add('SELECT ' + #39 + '20:00 a 20:59' + #39 + ' HORA,  SUM(VALOR) VALOR, COUNT(CLIENTE_ID) clientes');
  QRel.Sql.Add('FROM TRANSACOES');
  QRel.Sql.Add('WHERE CONDUTA = :CONDUTA AND DEPTO= :DEPTO');
  QRel.Sql.Add('AND MODELO = :MODELO');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
  QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
  QRel.Sql.Add('AND DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL');
  QRel.Sql.Add('AND HORA BETWEEN ' + #39 + '20:00:00' + #39 + ' AND ' + #39 + '20:59:59' + #39 + '');

  QRel.Sql.Add('UNION ALL');
  QRel.Sql.Add('SELECT ' + #39 + '21:00 a 21:59' + #39 + ' HORA,  SUM(VALOR) VALOR, COUNT(CLIENTE_ID) clientes');
  QRel.Sql.Add('FROM TRANSACOES');
  QRel.Sql.Add('WHERE CONDUTA = :CONDUTA AND DEPTO= :DEPTO');
  QRel.Sql.Add('AND MODELO = :MODELO');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
  QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
  QRel.Sql.Add('AND DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL');
  QRel.Sql.Add('AND HORA BETWEEN ' + #39 + '21:00:00' + #39 + ' AND ' + #39 + '21:59:59' + #39 + '');

  QRel.Sql.Add('UNION ALL ');
  QRel.Sql.Add('SELECT ' + #39 + '22:00 a 22:59' + #39 + ' HORA,  SUM(VALOR) VALOR, COUNT(CLIENTE_ID) clientes');
  QRel.Sql.Add('FROM TRANSACOES');
  QRel.Sql.Add('WHERE CONDUTA = :CONDUTA AND DEPTO= :DEPTO');
  QRel.Sql.Add('AND MODELO = :MODELO');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
  QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
  QRel.Sql.Add('AND DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL');
  QRel.Sql.Add('AND HORA BETWEEN ' + #39 + '22:00:00' + #39 + ' AND ' + #39 + '22:59:59' + #39 + '');

  QRel.Sql.Add('UNION ALL');
  QRel.Sql.Add('SELECT ' + #39 + '23:00 a 23:59' + #39 + ' HORA,  SUM(VALOR) VALOR, COUNT(CLIENTE_ID) clientes');
  QRel.Sql.Add('FROM TRANSACOES');
  QRel.Sql.Add('WHERE CONDUTA = :CONDUTA AND DEPTO= :DEPTO');
  QRel.Sql.Add('AND MODELO = :MODELO');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
  QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
  QRel.Sql.Add('AND DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL');
  QRel.Sql.Add('AND HORA BETWEEN ' + #39 + '23:00:00' + #39 + ' AND ' + #39 + '23:59:59' + #39 + ''); 
  QRel.Sql.Add(') AS CONSULTA');
  QRel.Sql.Add('WHERE CLIENTES > 0');
  QRel.Sql.Add('ORDER BY HORA');

  QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  QRel.ParamByName('CONDUTA').AsString      := '01';
  QRel.ParamByName('DEPTO').AsString        := '07';
  QRel.ParamByName('MODELO').AsString       := '2D';
  QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
  QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
  QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;

  QRel.Prepare;
  QRel.Open;

  QRLabel13.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;

  if QRel.IsEmpty then
    Application.MessageBox('Não há dados para serem impressos', PChar(Msg_Title), mb_IconInformation)
  else
    Rel_Vendas_Operador.PreviewModal;
end;

procedure TFrmRel_Flash_de_vendas_horario.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRel_Flash_de_vendas_horario.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmRel_Flash_de_vendas_horario.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
  //  Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmRel_Flash_de_vendas_horario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmRel_Flash_de_vendas_horario.FormCreate(Sender: TObject);
begin

  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);
end;

procedure TFrmRel_Flash_de_vendas_horario.OperadorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

end.
