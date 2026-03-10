unit UVendas_Vendedor_Pedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBTables, DB, IBCustomDataSet, IBQuery, Buttons, ExtCtrls,
  rxCurrEdit, Mask, rxToolEdit, QRCtrls, QuickRpt, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, QRPDFFilt;

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
    QRShape2: TQRShape;
    QRLabel13: TQRLabel;
    QRDBText8: TQRDBText;
    QRBand1: TQRBand;
    QRShape4: TQRShape;
    QRLabel20: TQRLabel;
    QRGroup1: TQRGroup;
    QRDBText3: TQRDBText;
    QRBand2: TQRBand;
    QRShape3: TQRShape;
    QRLabel2: TQRLabel;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRLabel6: TQRLabel;
    QRel: TFDQuery;
    QVendedor: TFDQuery;
    Label17: TLabel;
    Status: TComboBox;
    QQtd_Pedidos: TFDQuery;
    QRLabel9: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    DetailBand1: TQRBand;
    QRDBText9: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRLabel4: TQRLabel;
    QRDBText4: TQRDBText;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    Label3: TLabel;
    ORDEM: TComboBox;
    QRPDFFilter1: TQRPDFFilter;
    procedure btnVendedorClick(Sender: TObject);
    procedure VendedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnExecutaClick(Sender: TObject);
    procedure DtmenEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnRetornaClick(Sender: TObject);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
    qdt_pedidos:INTEGER;
    Total_pedido : Real;

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



   // QRel.Sql.Add('SELECT PEDIDOS.VR_ACRESCIMO ACRESCIMO, PEDIDOS.VR_DESCONTO DESCONTO , SUM(PEDITENS.VR_DESCONTO * PEDITENS.QUANTIDADE) DESCONTO_ITEM, SUM(PEDITENS.VR_TOTAL) VALOR ,');
   // QRel.Sql.Add('PEDIDOS.PEDIDO_ID, PEDIDOS.DT_PEDIDO,PEDIDOS.STATUS, FUNCIONARIOS.NOME VENDEDOR,TRANSACOES.NUM_DOC DOCUMENTO,PEDIDOS.NOME CLIENTES, PEDIDOS.VALOR_PRODUTOS');

    QRel.Sql.Add('SELECT (PEDIDOS.VALOR_PRODUTOS + SUM(PEDITENS.VR_DESCONTO * PEDITENS.QUANTIDADE)) VALOR_PRODUTOS, ');
    QRel.Sql.Add('(PEDIDOS.VR_ACRESCIMO + PEDIDOS.VR_FRETE)  ACRESCIMO,');
    QRel.Sql.Add('PEDIDOS.VR_DESCONTO DESCONTO , SUM(PEDITENS.VR_DESCONTO * PEDITENS.QUANTIDADE) DESCONTO_ITEM, PEDIDOS.VALOR ,');
    QRel.Sql.Add('PEDIDOS.PEDIDO_ID, PEDIDOS.DT_PEDIDO,PEDIDOS.STATUS, FUNCIONARIOS.NOME VENDEDOR,TRANSACOES.NUM_DOC DOCUMENTO,PEDIDOS.NOME CLIENTES');


    QRel.Sql.Add('FROM PEDITENS');
    QRel.Sql.Add('INNER JOIN PEDIDOS ON PEDIDOS.PEDIDO_ID = PEDITENS.PEDIDO_ID');
    QRel.Sql.Add('INNER JOIN FUNCIONARIOS ON (FUNCIONARIOS.FUNCIONARIO_ID = PEDIDOS.FUNCIONARIO_ID) AND (PEDIDOS.FUNCIONARIO_ID > 1)');
    QRel.Sql.Add('LEFT JOIN TRANSACOES ON (TRANSACOES.TRANSACAO_ID = PEDIDOS.TRANSACAO_ID)');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(PEDIDOS.EMPRESA_ID = :EMPRESA_ID)');

    if Status.Text = 'FATURADO' then
    QRel.Sql.Add('AND (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)')
    Else
    QRel.Sql.Add('AND (PEDIDOS.DT_PEDIDO BETWEEN :DT_INICIAL AND :DT_FINAL)');


    QRel.Sql.Add('AND (PEDIDOS.TP_PEDIDO = 1)');
    //QRel.Sql.Add('AND (TRANSACOES.MODELO <> :MODELO)');
    //QRel.Sql.Add('AND (TRANSACOES.TIPO_IMP = 1)');

      if StrToInt(Vendedor.Text) > 0 then
      begin
        QRel.Sql.Add('AND (PEDIDOS.FUNCIONARIO_ID = :VENDEDOR_ID)');
        QRel.ParamByName('VENDEDOR_ID').AsInteger := StrToInt(Vendedor.Text);
      end
      else
        QRel.Sql.Add('AND (PEDIDOS.FUNCIONARIO_ID <> 0)');

      if Status.Text <> '' then
      begin
        QRel.Sql.Add('AND (PEDIDOS.STATUS = :STATUS)');

        QRel.ParamByName('STATUS').AsString := Status.Text;
      end;

      if Status.Text = 'FATURADO' then
      Begin
      QRel.Sql.Add('GROUP BY PEDIDOS.PEDIDO_ID,TRANSACOES.DT_ENT_SAI ,PEDIDOS.STATUS,FUNCIONARIOS.NOME,TRANSACOES.NUM_DOC,PEDIDOS.NOME');

       IF ORDEM.TEXT = 'DATA FATURAMENTO' tHEN
       QRel.Sql.Add('ORDER BY FUNCIONARIOS.NOME, TRANSACOES.DT_ENT_SAI,PEDIDOS.PEDIDO_ID')
       eLSE
       QRel.Sql.Add('ORDER BY FUNCIONARIOS.NOME, PEDIDOS.DT_PEDIDO,PEDIDOS.PEDIDO_ID');

      End
      Else
      Begin
      QRel.Sql.Add('GROUP BY PEDIDOS.PEDIDO_ID,PEDIDOS.dt_pedido ,PEDIDOS.STATUS,FUNCIONARIOS.NOME,TRANSACOES.NUM_DOC,PEDIDOS.NOME');
      QRel.Sql.Add('ORDER BY FUNCIONARIOS.NOME, PEDIDOS.DT_PEDIDO,PEDIDOS.PEDIDO_ID');
      End;


  QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
 // QRel.ParamByName('CD_VDA').AsString       := '01';
 // QRel.ParamByName('DP_VDA').AsString       := '07';
 // QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
  QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
  QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
 //  QRel.ParamByName('TIPO_VENDA').AsString   := 'VENDA';
 // QRel.ParamByName('MODELO').AsString       := '99';

  QRel.Prepare;
  QRel.Open;


  QRLabel13.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;

  if QRel.IsEmpty then
    Application.MessageBox('Não há dados para serem impressos', PChar(Msg_Title), mb_IconInformation)
  else
    Rel_Vendas_Vendedor.PreviewModal;
 end;

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

procedure TFrmVendas_Vendedor_Pedido.DetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
 inc(Qdt_Pedidos);
 Total_pedido := QRel.FieldByName('VALOR').AsFloat + Total_Pedido;
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
 // Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
 //0210 Dtmai.Date := Ult_Dia_Mes(date);

  Dtmen.Date := IncMonth(StrToDate('01/' + Copy(DateToStr(date), 4, 7)),-1);
  Dtmai.Date := Ult_Dia_Mes(Dtmen.Date);
end;

procedure TFrmVendas_Vendedor_Pedido.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin

   Qrlabel17.Caption := 'Quantidade de Pedidos: ' + IntToStr(qdt_pedidos);

   Qrlabel18.Caption := 'Ticket Médio: '  + FloatToStrF((total_pedido / qdt_pedidos) ,ffnumber,15,2);

end;

procedure TFrmVendas_Vendedor_Pedido.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
 Qdt_Pedidos := 0;
 Total_pedido := 0;
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
