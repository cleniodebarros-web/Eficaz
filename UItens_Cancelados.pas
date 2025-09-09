unit UItens_Cancelados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBTables, DB, IBCustomDataSet, IBQuery, Buttons, ExtCtrls,
  rxCurrEdit, Mask, rxToolEdit, QRCtrls, QuickRpt, DBCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmItens_Cancelados = class(TForm)
    Dtmen: TDateEdit;
    Label1: TLabel;
    Dtmai: TDateEdit;
    Label2: TLabel;
    Bevel1: TBevel;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    Rel_Vendas_Vendedor: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    QRSysData1: TQRSysData;
    Cabec: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel13: TQRLabel;
    QRDBText8: TQRDBText;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRBand1: TQRBand;
    DBLookupComboBox1: TDBLookupComboBox;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText6: TQRDBText;
    QRShape3: TQRShape;
    QRLabel6: TQRLabel;
    Chk_Todos: TCheckBox;
    QRDBText7: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel11: TQRLabel;
    QRExpr2: TQRExpr;
    QRExpr1: TQRExpr;
    QAcesso: TFDQuery;
    QVendedor: TFDQuery;
    QRel: TFDQuery;
    DataSource1: TDataSource;
    procedure FuncionarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnExecutaClick(Sender: TObject);
    procedure DtmenEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnRetornaClick(Sender: TObject);
    procedure Chk_TodosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmItens_Cancelados: TFrmItens_Cancelados;

implementation

uses
  UPrincipal, UData, UConsulta;

{$R *.dfm}

procedure TFrmItens_Cancelados.btnExecutaClick(Sender: TObject);
begin
// 125, 327
  QRel.Sql.Clear;
  QRel.Sql.Add('SELECT BAR.*, OPERADORES.NOME,FUNCIONARIOS.NOME GARCOM_CANC');
  QRel.Sql.Add('FROM BAR');
  QRel.Sql.Add('INNER JOIN OPERADORES');
  QRel.Sql.Add('ON (OPERADORES.OPERADOR_ID = BAR.OPERADOR)');
  QRel.Sql.Add('LEFT JOIN FUNCIONARIOS');
  QRel.Sql.Add('ON (FUNCIONARIOS.FUNCIONARIO_ID = BAR.FUNCIONARIO_ID)');
  QRel.Sql.Add('WHERE');
  QRel.Sql.Add('(CANCELADO = :CANCELADO)');
  QRel.Sql.Add('AND (DATA BETWEEN :DT_INICIAL AND :DT_FINAL)');

  if not QAcesso.IsEmpty then
  begin
    QRel.Sql.Add('AND (OPERADOR = :OPERADOR_ID)');
    QRel.ParamByName('OPERADOR_ID').AsString := QAcesso.FieldByName('OPERADOR_ID').AsString;
  end;

  QRel.Sql.Add('ORDER BY OPERADORES.NOME, BAR.DATA');

  QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
  QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
  QRel.ParamByName('CANCELADO').AsString    := '1';

  QRel.Prepare;
  QRel.Open;

  QRLabel13.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;

  if QRel.IsEmpty then
    Application.MessageBox('Não há dados para serem impressos', PChar(Msg_Title), mb_IconInformation)
  else
    Rel_Vendas_Vendedor.PreviewModal;
end;

procedure TFrmItens_Cancelados.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmItens_Cancelados.Chk_TodosClick(Sender: TObject);
begin
  if Chk_Todos.Checked then
  begin
    QAcesso.Close;
    DBLookupComboBox1.Enabled := False;
  end
  Else
  Begin
    QAcesso.Open;
    DBLookupComboBox1.Enabled := True;
  End;
end;

procedure TFrmItens_Cancelados.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmItens_Cancelados.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmItens_Cancelados.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmItens_Cancelados.FormCreate(Sender: TObject);
begin
  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);

  QAcesso.Open();

end;

procedure TFrmItens_Cancelados.FuncionarioKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

end.
