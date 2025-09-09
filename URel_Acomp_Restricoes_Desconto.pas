unit URel_Acomp_Restricoes_Desconto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, IBCustomDataSet, IBQuery, Buttons, ExtCtrls, Mask,
  rxToolEdit, QuickRpt, QRCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrmRel_Acomp_Restricoes_Desconto = class(TForm)
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
    QRLabel6: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel12: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBText9: TQRDBText;
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
  FrmRel_Acomp_Restricoes_Desconto: TFrmRel_Acomp_Restricoes_Desconto;

implementation

uses
  UData, UPrincipal;

{$R *.dfm}

procedure TFrmRel_Acomp_Restricoes_Desconto.btnExecutaClick(Sender: TObject);
begin
// 125, 327

  QRel.Sql.Clear;
  QRel.Sql.Add('SELECT TRANSACOES.*, OPERADORES.NOME, FUNCIONARIOS.NOME NOME_FUNCIONARIO, CLIENTES.NOME NOME_CLIENTE,FINALIZADORAS.LEGENDA');
  QRel.Sql.Add('FROM TRANSACOES');
  QRel.Sql.Add('LEFT JOIN FUNCIONARIOS');
  QRel.Sql.Add('ON (FUNCIONARIOS.FUNCIONARIO_ID = TRANSACOES.FUNCIONARIO_ID)');
  QRel.Sql.Add('LEFT JOIN CLIENTES');
  QRel.Sql.Add('ON (CLIENTES.CLIENTE_ID = TRANSACOES.CLIENTE_ID)');
  QRel.Sql.Add('INNER JOIN FINALIZADORAS');
  QRel.Sql.Add('ON (FINALIZADORAS.FINALIZADORA_ID = TRANSACOES.FINALIZADORA_ID)');
  QRel.Sql.Add('LEFT JOIN OPERADORES');

  if FrmPrincipal.Config.FieldByName('TURNO').AsString = 'True' then
  QRel.Sql.Add('ON (TRANSACOES.OPERADOR = OPERADORES.NOME)')
  Else
  QRel.Sql.Add('ON (CAST(TRANSACOES.OPERADOR AS INTEGER) = CAST(OPERADORES.OPERADOR_ID AS INTEGER))');

  QRel.Sql.Add('WHERE');
  QRel.Sql.Add('(TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
  QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :CD_VDA)');
  QRel.Sql.Add('AND (TRANSACOES.DEPTO = :DP_VDA)');
  QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
  QRel.Sql.Add('AND (TRANSACOES.MODELO = :MODELO)');
  QRel.Sql.Add('AND ((TRANSACOES.VR_DESCONTO > 0) OR (TRANSACOES.FUNCIONARIO_ID > 0))');
  QRel.Sql.Add('AND (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');

  if Operador.Text <> '' then
  begin
    QRel.Sql.Add('AND (OPERADORES.NOME = :NOME)');
    QRel.ParamByName('NOME').AsString := Operador.Text;
  end;

  QRel.Sql.Add('ORDER BY OPERADORES.NOME, TRANSACOES.DT_TRANS');

  QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  QRel.ParamByName('CD_VDA').AsString       := '01';
  QRel.ParamByName('DP_VDA').AsString       := '07';
  QRel.ParamByName('MODELO').AsString       := '65';
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

procedure TFrmRel_Acomp_Restricoes_Desconto.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRel_Acomp_Restricoes_Desconto.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmRel_Acomp_Restricoes_Desconto.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
   // Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmRel_Acomp_Restricoes_Desconto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmRel_Acomp_Restricoes_Desconto.FormCreate(Sender: TObject);
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

procedure TFrmRel_Acomp_Restricoes_Desconto.OperadorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

end.
