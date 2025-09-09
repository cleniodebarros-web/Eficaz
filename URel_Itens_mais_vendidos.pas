unit URel_Itens_mais_vendidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, IBCustomDataSet, IBQuery, Buttons, ExtCtrls, Mask,
  rxToolEdit, QuickRpt, QRCtrls;

type
  TFrmRel_itens_mais_vendidos = class(TForm)
    Label1: TLabel;
    Dtmen: TDateEdit;
    Dtmai: TDateEdit;
    Bevel1: TBevel;
    btnExecuta: TBitBtn;
    btnRetorna: TBitBtn;
    QRel: TIBQuery;
    Rel_Itens_Mais_Vendidosr: TQuickRep;
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
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QUpate: TIBQuery;
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
  FrmRel_itens_mais_vendidos: TFrmRel_itens_mais_vendidos;

implementation

uses
  UData, UPrincipal;

{$R *.dfm}

procedure TFrmRel_itens_mais_vendidos.btnExecutaClick(Sender: TObject);
begin
// 125, 327

 QUpate.SQL.Clear;
 QUpate.SQL.Add('ALTER SEQUENCE TMP_SEQUENCE RESTART WITH 0') ;
 QUpate.Prepare;
 QUpate.ExecSQL;




 QRel.Sql.Clear;
 QRel.Sql.Add('SELECT NEXT VALUE FOR TMP_SEQUENCE as SEQUENCIA ,TRANSITENS.PRODUTO_ID,');
 QRel.Sql.Add('COD_BARRA , TRANSITENS.DESCRICAO ,SUM(TRANSITENS.QUANTIDADE) QUANTIDADE,');
 QRel.Sql.Add('SUM(TRANSITENS.VR_TOTAL + TRANSITENS.VALOR_ICMS_ST + TRANSITENS.VR_FRETE +');
 QRel.Sql.Add('TRANSITENS.VR_ACRESCIMO + TRANSITENS.VR_IPI - TRANSITENS.DESC_RODAPE) VALOR');
 QRel.Sql.Add('FROM TRANSITENS');
 QRel.Sql.Add('INNER JOIN PRODUTOS ON PRODUTOS.PRODUTO_ID = TRANSITENS.PRODUTO_ID');
 QRel.Sql.Add('INNER JOIN TRANSACOES ON TRANSACOES.TRANSACAO_ID = TRANSITENS.TRANSACAO_ID');
 QRel.Sql.Add('WHERE DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL');
 QRel.Sql.Add('AND CONDUTA = :CONDUTA AND DEPTO = :DEPTO');
 QRel.Sql.Add('AND TRANSACOES.EMPRESA_ID = :EMPRESA_ID AND TPCTB = :TPCTB');
 QRel.Sql.Add('GROUP BY TRANSITENS.PRODUTO_ID,COD_BARRA,TRANSITENS.DESCRICAO');
 QRel.Sql.Add('ORDER BY QUANTIDADE DESC');

  QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  QRel.ParamByName('CONDUTA').AsString      := '01';
  QRel.ParamByName('DEPTO').AsString        := '07';
  QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
  QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
  QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;

  QRel.Prepare;
  QRel.Open;

  QRLabel13.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;

  if QRel.IsEmpty then
    Application.MessageBox('Não há dados para serem impressos', PChar(Msg_Title), mb_IconInformation)
  else
    Rel_Itens_Mais_Vendidosr.PreviewModal;
end;

procedure TFrmRel_itens_mais_vendidos.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRel_itens_mais_vendidos.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmRel_itens_mais_vendidos.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmRel_itens_mais_vendidos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmRel_itens_mais_vendidos.FormCreate(Sender: TObject);
begin

  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);
end;

procedure TFrmRel_itens_mais_vendidos.OperadorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;


end.
