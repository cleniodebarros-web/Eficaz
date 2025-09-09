unit URel_Doacoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, IBCustomDataSet, IBQuery, Buttons, ExtCtrls, Mask,
  rxToolEdit, QuickRpt, QRCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.DBCtrls, RxCurrEdit;

type
  TFrmRel_Doacoes = class(TForm)
    Label1: TLabel;
    Dtmen: TDateEdit;
    Dtmai: TDateEdit;
    Label2: TLabel;
    Bevel1: TBevel;
    btnExecuta: TBitBtn;
    btnRetorna: TBitBtn;
    Operador: TComboBox;
    Rel_Vendas_Doacao: TQuickRep;
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
    QRLabel4: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRBand1: TQRBand;
    QRShape4: TQRShape;
    QRLabel20: TQRLabel;
    QRExpr3: TQRExpr;
    QRGroup1: TQRGroup;
    QRDBText3: TQRDBText;
    QRBand2: TQRBand;
    QRShape3: TQRShape;
    QRLabel2: TQRLabel;
    QRExpr6: TQRExpr;
    QRDBText7: TQRDBText;
    QRGroup2: TQRGroup;
    QRDBText9: TQRDBText;
    QRBand3: TQRBand;
    QRLabel1: TQRLabel;
    QRExpr9: TQRExpr;
    QRShape5: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel9: TQRLabel;
    QRel: TFDQuery;
    Entidade: TCurrencyEdit;
    btnentidade: TSpeedButton;
    DBText1: TDBText;
    QEntidade: TFDQuery;
    DataEntidade: TDataSource;
    Label3: TLabel;
    procedure btnExecutaClick(Sender: TObject);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRetornaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure OperadorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DtmenEnter(Sender: TObject);
    procedure EntidadeExit(Sender: TObject);
    procedure btnentidadeClick(Sender: TObject);
    procedure EntidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Doacoes: TFrmRel_Doacoes;

implementation

uses
  UData, UPrincipal,Uconsulta;

{$R *.dfm}

procedure TFrmRel_Doacoes.btnentidadeClick(Sender: TObject);
begin
try
    Entidade.Value := GetConsulta('ENTIDADES', 0, 0, StrToInt(Entidade.Text));
  except
    Entidade.Value := GetConsulta('ENTIDADES', 0, 0, 0);
  end;
end;

procedure TFrmRel_Doacoes.btnExecutaClick(Sender: TObject);
begin
// 125, 327

   QRel.Sql.Clear;
   QRel.Sql.Add('SELECT  ENTIDADES_DOACAO.NOME,CLIENTES.NOME CLIENTE, FECHAMENTO_CUPOM.VALOR_FINALIZADORA VALOR,DATA,CUPOM,OPERADORES.NOME OPERADOR');
   QRel.Sql.Add('FROM FECHAMENTO_CUPOM');
   QRel.Sql.Add('INNER JOIN ENTIDADES_DOACAO ON ENTIDADES_DOACAO.ENTIDADE_ID = FECHAMENTO_CUPOM.ENTIDADE_ID');
   QRel.Sql.Add('INNER JOIN CLIENTES ON CLIENTES.CLIENTE_ID = FECHAMENTO_CUPOM.CLIENTE_ID');
   QRel.Sql.Add('INNER JOIN OPERADORES ON CAST(OPERADORES.OPERADOR_ID as INTEGER) = FECHAMENTO_CUPOM.OPERADOR_ID');
   QRel.Sql.Add('WHERE (DATA BETWEEN :DT_INICIAL AND :DT_FINAL)');
   QRel.Sql.Add('AND (LEGENDA = :LEGENDA)');


    if Operador.Text <> '' then
    begin
      QRel.Sql.Add('AND (OPERADORES.NOME = :NOME)');
      QRel.ParamByName('NOME').AsString := Operador.Text;
    end;

    if Entidade.Text <> '' then
    begin
      QRel.Sql.Add('AND (FECHAMENTO_CUPOM.ENTIDADE_ID = :ENTIDADE)');
      QRel.ParamByName('ENTIDADE').AsInteger := StrToInt(ENTIDADE.Text);
    end;

    QRel.ParamByName('LEGENDA').AsString      := 'Doação';
    QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;

    QRel.Prepare;
    QRel.Open;

 {

  QRel.Sql.Clear;
  QRel.Sql.Add('SELECT TRANSACAO_ID,DT_TRANS,HISTORICO,VR_ACRESCIMO,VR_DESCONTO,VALOR,NOME,LEGENDA');
  QRel.Sql.Add('FROM(');
  QRel.Sql.Add('SELECT TRANSACOES.TRANSACAO_ID,TRANSACOES.DT_TRANS,HISTORICO,VR_ACRESCIMO,VR_DESCONTO,VALOR, OPERADORES.NOME, FINALIZADORAS.LEGENDA');
  QRel.Sql.Add('FROM TRANSACOES');
  QRel.Sql.Add('INNER JOIN FINALIZADORAS');
  QRel.Sql.Add('ON (FINALIZADORAS.FINALIZADORA_ID = TRANSACOES.FINALIZADORA_ID)');
  QRel.Sql.Add('INNER JOIN OPERADORES');

  if FrmPrincipal.Config.FieldByName('TURNO').AsString = 'True' then

  QRel.Sql.Add('ON (TRANSACOES.OPERADOR = OPERADORES.NOME)')
  Else
  QRel.Sql.Add('ON (CAST(TRANSACOES.OPERADOR AS INTEGER) = CAST(OPERADORES.OPERADOR_ID AS INTEGER))');
 // QRel.Sql.Add('LEFT JOIN COMPL_NFISCAL');
 // QRel.Sql.Add('ON (TRANSACOES.TRANSACAO_ID = COMPL_NFISCAL.TRANSACAO_ID)');
  QRel.Sql.Add('WHERE');
  QRel.Sql.Add('(TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
  QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :CD_VDA)');
  QRel.Sql.Add('AND (TRANSACOES.DEPTO = :DP_VDA)');
  QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
  QRel.Sql.Add('AND (TRANSACOES.PARCELA_ID <> :MULTI)');
  QRel.Sql.Add('AND (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE) )');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS) )');

  if Operador.Text <> '' then
  begin
    QRel.Sql.Add('AND (OPERADORES.NOME = :NOME)');
    QRel.ParamByName('NOME').AsString := Operador.Text;
  end
  else
    QRel.Sql.Add('AND (TRANSACOES.OPERADOR IS NOT NULL)');

  QRel.Sql.Add('UNION ALL');
  QRel.Sql.Add('SELECT TRANSACOES.TRANSACAO_ID,TRANSACOES.DT_TRANS,HISTORICO,VR_ACRESCIMO,VR_DESCONTO,TRANSPARCELAS.VALOR, OPERADORES.NOME,');
  QRel.Sql.Add('CASE WHEN SUBSTRING (TRANSPARCELAS.PARCELA_ID FOR :FOR  FROM :FROM) = :PZ THEN :PRAZO');
  QRel.Sql.Add('WHEN SUBSTRING (TRANSPARCELAS.PARCELA_ID FOR :FOR  FROM :FROM) = :CT THEN :CARTAO');
  QRel.Sql.Add('WHEN SUBSTRING (TRANSPARCELAS.PARCELA_ID FOR :FOR  FROM :FROM) = :CH THEN :CHEQUE END LEGENDA');
  QRel.Sql.Add('FROM TRANSACOES');
  QRel.Sql.Add('INNER JOIN TRANSPARCELAS');
  QRel.Sql.Add('ON (TRANSPARCELAS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
  QRel.Sql.Add('INNER JOIN OPERADORES');

  if FrmPrincipal.Config.FieldByName('TURNO').AsString = 'True' then

  QRel.Sql.Add('ON (TRANSACOES.OPERADOR = OPERADORES.NOME)')
  Else
  QRel.Sql.Add('ON (CAST(TRANSACOES.OPERADOR AS INTEGER) = CAST(OPERADORES.OPERADOR_ID AS INTEGER))');
 // QRel.Sql.Add('LEFT JOIN COMPL_NFISCAL');
 // QRel.Sql.Add('ON (TRANSACOES.TRANSACAO_ID = COMPL_NFISCAL.TRANSACAO_ID)');
  QRel.Sql.Add('WHERE');
  QRel.Sql.Add('(TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
  QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :CD_VDA)');
  QRel.Sql.Add('AND (TRANSACOES.DEPTO = :DP_VDA)');
  QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
  QRel.Sql.Add('AND (TRANSACOES.PARCELA_ID = :MULTI)');
  QRel.Sql.Add('AND (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE) )');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS) )');

  if Operador.Text <> '' then
  begin
    QRel.Sql.Add('AND (OPERADORES.NOME = :NOME)');
    QRel.ParamByName('NOME').AsString := Operador.Text;
  end
  else
  QRel.Sql.Add('AND (TRANSACOES.OPERADOR IS NOT NULL)');

  QRel.Sql.Add(') AS TESTE');

  QRel.Sql.Add('ORDER BY NOME, LEGENDA, DT_TRANS');

  QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  QRel.ParamByName('CD_VDA').AsString       := '01';
  QRel.ParamByName('DP_VDA').AsString       := '07';
  QRel.ParamByName('PRAZO').AsString        := 'PRAZO';
  QRel.ParamByName('CARTAO').AsString       := 'CARTAO';
  QRel.ParamByName('CHEQUE').AsString       := 'CHEQUE';
  QRel.ParamByName('PZ').AsString           := '2';
  QRel.ParamByName('CT').AsString           := '3';
  QRel.ParamByName('CH').AsString           := '4';
  QRel.ParamByName('FOR').AsString          := '1';
  QRel.ParamByName('FROM').AsString         := '4';
  QRel.ParamByName('MULTI').AsString        := 'F';
  QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
  QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
  QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;

  QRel.Prepare;
  QRel.Open;
   }
  QRLabel13.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;

  if QRel.IsEmpty then
    Application.MessageBox('Não há dados para serem impressos', PChar(Msg_Title), mb_IconInformation)
  else
    Rel_Vendas_Doacao.PreviewModal;
end;

procedure TFrmRel_Doacoes.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRel_Doacoes.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmRel_Doacoes.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    //Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmRel_Doacoes.EntidadeExit(Sender: TObject);
begin
    QEntidade.Close;
    QEntidade.ParamByName('ENTIDADE').AsInteger   := StrToInt(ENTIDADE.Text);
    QEntidade.Prepare;
    QEntidade.Open;

end;

procedure TFrmRel_Doacoes.EntidadeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (Key = Vk_F7) and (Sender = entidade) then
    btnentidadeClick(Self);

    if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);

if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);

end;

procedure TFrmRel_Doacoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmRel_Doacoes.FormCreate(Sender: TObject);
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

procedure TFrmRel_Doacoes.OperadorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

end.
