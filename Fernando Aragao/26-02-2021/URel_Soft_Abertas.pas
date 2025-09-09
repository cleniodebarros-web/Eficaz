unit URel_Soft_Abertas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBTables, DB, IBCustomDataSet, IBQuery, Buttons, ExtCtrls,
  rxCurrEdit, Mask, rxToolEdit, QRCtrls, QuickRpt, DBCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;
  

type
  TFrmRel_Soft_Abertas = class(TForm)
    Dtmen: TDateEdit;
    Label1: TLabel;
    Dtmai: TDateEdit;
    Bevel1: TBevel;
    btnRetorna: TBitBtn;
    DataVendedor: TDataSource;
    btnExecuta: TBitBtn;
    DataAcesso: TDataSource;
    Rel_Comandas_Abertas: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    QRSysData1: TQRSysData;
    Cabec: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    QRLabel7: TQRLabel;
    QRShape2: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText8: TQRDBText;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText7: TQRDBText;
    QRBand1: TQRBand;
    QRShape4: TQRShape;
    QRLabel20: TQRLabel;
    QRExpr3: TQRExpr;
    QRGroup1: TQRGroup;
    QRDBText3: TQRDBText;
    QRLabel6: TQRLabel;
    QRBand2: TQRBand;
    QRShape3: TQRShape;
    QRLabel2: TQRLabel;
    QRExpr6: TQRExpr;
    QRGroup2: TQRGroup;
    QRDBText9: TQRDBText;
    QRLabel9: TQRLabel;
    QRBand3: TQRBand;
    QRLabel1: TQRLabel;
    QRExpr9: TQRExpr;
    QRShape5: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText5: TQRDBText;
    Tipo: TComboBox;
    Label2: TLabel;
    QRLabel4: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel8: TQRLabel;
    Label3: TLabel;
    Produto: TCurrencyEdit;
    btnProduto: TSpeedButton;
    DBText1: TDBText;
    DataProduto: TDataSource;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr4: TQRExpr;
    Label4: TLabel;
    Mesa: TCurrencyEdit;
    Qvendedor: TFDQuery;
    QAcesso: TFDQuery;
    QProduto: TFDQuery;
    QRel: TFDQuery;
    procedure FuncionarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnExecutaClick(Sender: TObject);
    procedure DtmenEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnRetornaClick(Sender: TObject);
    procedure btnProdutoClick(Sender: TObject);
    procedure ProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ProdutoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     procedure SearchProduto;
  end;

var
  FrmRel_Soft_Abertas: TFrmRel_Soft_Abertas;

implementation

uses
  UPrincipal, UData, UConsulta;

{$R *.dfm}

procedure TFrmRel_Soft_Abertas.SearchProduto;
begin
  QProduto.Close;
  QProduto.ParamByName('PRODUTO_ID').AsInteger := StrToInt(Produto.Text);
  QProduto.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  QProduto.Prepare;
  QProduto.Open;

  if Qproduto.IsEmpty then
  DBText1.Visible := False
  else
  DBText1.Visible := True;
  


end;


procedure TFrmRel_Soft_Abertas.btnExecutaClick(Sender: TObject);
begin
// 125, 327

  QRel.Sql.Clear;
  //QRel.Sql.Add('SELECT BAR.*, FUNCIONARIOS.NOME FUNCIONARIO, CLIENTES.NOME NOME_CLIENTE');
  QRel.Sql.Add('SELECT BAR.*, CLIENTES.NOME NOME_CLIENTE');
  QRel.Sql.Add('FROM BAR');
//  QRel.Sql.Add('INNER JOIN FUNCIONARIOS');
//  QRel.Sql.Add('ON (FUNCIONARIOS.FUNCIONARIO_ID = BAR.GARCOM)');
  QRel.Sql.Add('LEFT JOIN CLIENTES');
  QRel.Sql.Add('ON (CLIENTES.CLIENTE_ID = BAR.CLIENTE)');
  QRel.Sql.Add('WHERE');
  QRel.Sql.Add('(CANCELADO = :CANCELADO) AND (BAR.STATUS = :STATUS)');
  QRel.Sql.Add('AND (BAR.DATA BETWEEN :DT_INICIAL AND :DT_FINAL)');

  if Produto.Value > 0 then
  begin
  QRel.Sql.Add('AND (COD_PRODUTO = :COD_PRODUTO)');
  QRel.ParamByName('COD_PRODUTO').AsInteger := StrToInt(Produto.Text);
  end;

  if Mesa.Value > 0 then
  begin
  QRel.Sql.Add('AND (MESA = :MESA)');
  QRel.ParamByName('MESA').AsInteger := StrToInt(Mesa.Text);
  end
  else
  begin
    QRel.Sql.Add('AND (MESA < 600)');
  end;

  //QRel.Sql.Add('ORDER BY BAR.DATA, BAR.MESA,BAR.HORA,FUNCIONARIOS.NOME');
  QRel.Sql.Add('ORDER BY BAR.DATA, BAR.MESA,BAR.HORA');

  QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
  QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
  QRel.ParamByName('CANCELADO').AsString    := '0';

  if Tipo.Text = 'Fechada' then
  QRel.ParamByName('STATUS').AsString       := 'F'
  else
  QRel.ParamByName('STATUS').AsString       := 'A';

  QRel.Prepare;
  QRel.Open;

  QRLabel13.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;

  if Tipo.Text = 'Fechada' then
  QRLabel3.Caption := '***COMANDAS FECHADAS***'
  Else
  QRLabel3.Caption := '***COMANDAS EM ABERTO***';

  if QRel.IsEmpty then
    Application.MessageBox('Não há dados para serem impressos', PChar(Msg_Title), mb_IconInformation)
  else
    Rel_Comandas_Abertas.PreviewModal;
end;

procedure TFrmRel_Soft_Abertas.btnProdutoClick(Sender: TObject);
begin
  try
    Produto.Value := GetConsulta('ESTOQUE', FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger, 0 , StrToInt(Produto.Text));
  except
    Produto.Value := GetConsulta('ESTOQUE', 0, 0, 0);
  end;

end;

procedure TFrmRel_Soft_Abertas.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRel_Soft_Abertas.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmRel_Soft_Abertas.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
   // Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmRel_Soft_Abertas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmRel_Soft_Abertas.FormCreate(Sender: TObject);
begin
  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);
end;

procedure TFrmRel_Soft_Abertas.FuncionarioKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmRel_Soft_Abertas.ProdutoChange(Sender: TObject);
begin
  if Produto.Value > 0 then
    SearchProduto;


end;

procedure TFrmRel_Soft_Abertas.ProdutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = Produto) then
    btnProdutoClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);

end;

end.
