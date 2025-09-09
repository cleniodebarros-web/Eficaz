unit UVendas_Vendedor_Pedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBTables, DB, IBCustomDataSet, IBQuery, Buttons, ExtCtrls,
  rxCurrEdit, Mask, rxToolEdit, QRCtrls, QuickRpt, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmVendas_Vendedor_Pedido = class(TForm)
    Dtmen: TDateEdit;
    Label1: TLabel;
    Dtmai: TDateEdit;
    Label2: TLabel;
    Vendedor: TCurrencyEdit;
    btnVendedor: TSpeedButton;
    Bevel1: TBevel;
    btnRetorna: TBitBtn;
    DataVendedor: TDataSource;
    btnExecuta: TBitBtn;
    Rel_Vendas_Vendedor: TQuickRep;
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
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
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
    QRGroup2: TQRGroup;
    QRDBText9: TQRDBText;
    QRBand3: TQRBand;
    QRShape5: TQRShape;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRLabel1: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel9: TQRLabel;
    QRel: TFDQuery;
    QVendedor: TFDQuery;
    Chk_reduzir_historico: TCheckBox;
    procedure btnVendedorClick(Sender: TObject);
    procedure VendedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnExecutaClick(Sender: TObject);
    procedure DtmenEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnRetornaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmVendas_Vendedor_Pedido: TFrmVendas_Vendedor_Pedido;

implementation

uses
  UPrincipal, UData, UConsulta;

{$R *.dfm}

procedure TFrmVendas_Vendedor_Pedido.btnExecutaClick(Sender: TObject);
begin
// 125, 327
 QRel.Sql.Clear;

  {if Chk_reduzir_historico.Checked then
     QRel.Sql.Add('SELECT TRANSACOES.*, SUBSTRING( TRANSACOES.historico FROM 7 for 40) as HIST, FUNCIONARIOS.NOME, FINALIZADORAS.LEGENDA')
  else
     QRel.Sql.Add('SELECT TRANSACOES.*, FUNCIONARIOS.NOME, FINALIZADORAS.LEGENDA');

  QRel.Sql.Add('FROM TRANSACOES');
  QRel.Sql.Add('INNER JOIN FUNCIONARIOS');
  QRel.Sql.Add('ON (FUNCIONARIOS.FUNCIONARIO_ID = TRANSACOES.VENDEDOR_ID)');
  QRel.Sql.Add('LEFT JOIN FINALIZADORAS');
  QRel.Sql.Add('ON (FINALIZADORAS.FINALIZADORA_ID = TRANSACOES.FINALIZADORA_ID)');
  QRel.Sql.Add('LEFT JOIN COMPL_NFISCAL');
  QRel.Sql.Add('ON (TRANSACOES.TRANSACAO_ID = COMPL_NFISCAL.TRANSACAO_ID)');
  QRel.Sql.Add('WHERE');
  QRel.Sql.Add('(TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
  QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :CD_VDA)');
  QRel.Sql.Add('AND (TRANSACOES.DEPTO = :DP_VDA)');
  QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
  QRel.Sql.Add('AND (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
  QRel.Sql.Add('AND (TIPO_VENDA = :TIPO_VENDA)');
  QRel.Sql.Add('AND (TRANSACOES.MODELO <> :MODELO)');

  if FrmPrincipal.Config.FieldByName('VDA_PEDV').AsString = 'True' then
     QRel.Sql.Add('AND (TRANSACOES.TIPO_IMP = 1)');

  if StrToInt(Vendedor.Text) > 0 then
  begin
    QRel.Sql.Add('AND (TRANSACOES.VENDEDOR_ID = :VENDEDOR_ID)');
    QRel.ParamByName('VENDEDOR_ID').AsInteger := StrToInt(Vendedor.Text);
  end
  else
    QRel.Sql.Add('AND (TRANSACOES.VENDEDOR_ID > 0)');

  QRel.Sql.Add('ORDER BY FUNCIONARIOS.NOME, FINALIZADORAS.LEGENDA, TRANSACOES.DT_TRANS'); }


    QRel.Sql.Add('SELECT TRANSACOES.*, FUNCIONARIOS.NOME, FINALIZADORAS.LEGENDA');
    QRel.Sql.Add('FROM PEDIDOS');
    QRel.Sql.Add('INNER JOIN TRANSACOES ON(TRANSACOES.TRANSACAO_ID = PEDIDOS.TRANSACAO_ID)');
    QRel.Sql.Add('INNER JOIN FUNCIONARIOS ON (FUNCIONARIOS.FUNCIONARIO_ID = TRANSACOES.VENDEDOR_ID)');
    QRel.Sql.Add('LEFT JOIN FINALIZADORAS');
    QRel.Sql.Add('ON (FINALIZADORAS.FINALIZADORA_ID = TRANSACOES.FINALIZADORA_ID)');
   // QRel.Sql.Add('LEFT JOIN COMPL_NFISCAL');
   // QRel.Sql.Add('ON (TRANSACOES.TRANSACAO_ID = COMPL_NFISCAL.TRANSACAO_ID)');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
    QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :CD_VDA)');
    QRel.Sql.Add('AND (TRANSACOES.DEPTO = :DP_VDA)');
    QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
    QRel.Sql.Add('AND (PEDIDOS.DT_PEDIDO BETWEEN :DT_INICIAL AND :DT_FINAL)');
    QRel.Sql.Add('AND (TIPO_VENDA = :TIPO_VENDA)');
    QRel.Sql.Add('AND (TRANSACOES.MODELO <> :MODELO)');
    QRel.Sql.Add('AND (TRANSACOES.TIPO_IMP = 1)');

      if StrToInt(Vendedor.Text) > 0 then
      begin
        QRel.Sql.Add('AND (TRANSACOES.VENDEDOR_ID = :VENDEDOR_ID)');
        QRel.ParamByName('VENDEDOR_ID').AsInteger := StrToInt(Vendedor.Text);
      end
      else
        QRel.Sql.Add('AND (TRANSACOES.VENDEDOR_ID <> 0)');

    QRel.Sql.Add('ORDER BY FUNCIONARIOS.NOME, FINALIZADORAS.LEGENDA, TRANSACOES.DT_TRANS');


  QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  QRel.ParamByName('CD_VDA').AsString       := '01';
  QRel.ParamByName('DP_VDA').AsString       := '07';
  QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
  QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
  QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
  QRel.ParamByName('TIPO_VENDA').AsString   := 'VENDA';
  QRel.ParamByName('MODELO').AsString       := '99';

  QRel.Prepare;
  QRel.Open;


  if Chk_reduzir_historico.Checked then
     QRDBText4.DataField := 'HIST'
  else
     QRDBText4.DataField := 'HISTORICO';


  QRLabel13.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;

  if QRel.IsEmpty then
    Application.MessageBox('Não há dados para serem impressos', PChar(Msg_Title), mb_IconInformation)
  else
    Rel_Vendas_Vendedor.PreviewModal;end;

procedure TFrmVendas_Vendedor_Pedido.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmVendas_Vendedor_Pedido.btnVendedorClick(Sender: TObject);
begin
  try
    Vendedor.Value := GetConsulta('PESSOAL', 0, 0, StrToInt(Vendedor.Text));
  except
    Vendedor.Value := GetConsulta('PESSOAL', 0, 0, 0);
  end;
end;

procedure TFrmVendas_Vendedor_Pedido.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmVendas_Vendedor_Pedido.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
   // Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmVendas_Vendedor_Pedido.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmVendas_Vendedor_Pedido.FormCreate(Sender: TObject);
begin
  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);
end;

procedure TFrmVendas_Vendedor_Pedido.VendedorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = Vendedor) then
    btnVendedorClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

end.
