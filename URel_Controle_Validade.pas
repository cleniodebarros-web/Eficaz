unit URel_Controle_Validade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, rxCurrEdit, rxToolEdit, Buttons, DBCtrls,
  DB, IBCustomDataSet, IBQuery, QuickRpt, QRCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, qrpctrls;

type
  TFrmRel_Controle_Validade = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    Dtmen: TDateEdit;
    Produto_id: TCurrencyEdit;
    Dtmai: TDateEdit;
    btnProduto: TSpeedButton;
    DataProduto: TDataSource;
    DBText1: TDBText;
    Controle_Validade: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    QRDBText3: TQRDBText;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    Cabec: TQRLabel;
    QRSysData2: TQRSysData;
    DetailBand1: TQRBand;
    QRDBText2: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText5: TQRDBText;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel13: TQRLabel;
    QRBand1: TQRBand;
    QRGroup1: TQRGroup;
    QRDBText7: TQRDBText;
    QRBand2: TQRBand;
    QRShape2: TQRShape;
    QRLabel4: TQRLabel;
    QRel: TFDQuery;
    QProduto: TFDQuery;
    QRDBText8: TQRDBText;
    QRDBText1: TQRDBText;
    QRPExpr1: TQRPExpr;
    procedure btnRetornaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnProdutoClick(Sender: TObject);
    procedure Produto_idKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Produto_idChange(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure DtmenEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SearchBanco;
  end;

var
  FrmRel_Controle_Validade: TFrmRel_Controle_Validade;

implementation

uses
  UData, UConsulta, UPrincipal;

{$R *.dfm}

procedure TFrmRel_Controle_Validade.SearchBanco;
begin
  QProduto.Close;

  QProduto.ParamByName('PRODUTO_ID').AsInteger   := StrToInt(Produto_id.Text);
  QProduto.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;

  QProduto.Prepare;
  QProduto.Open;
end;

procedure TFrmRel_Controle_Validade.btnProdutoClick(Sender: TObject);
begin
  try
    Produto_id.Value := GetConsulta('ESTOQUE', 0, 0, StrToInt(Produto_id.Text));
  except
    Produto_id.Value := GetConsulta('ESTOQUE', 0, 0, 0);
  end;
end;

procedure TFrmRel_Controle_Validade.btnExecutaClick(Sender: TObject);
begin
// 125, 325
  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;
    {
    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT TRANSITENS.PRODUTO_ID, PRODUTOS.DESCRICAO, PRODUTOS.QUANTIDADE_C, PRODUTOS.QUANTIDADE_G, TABELAS.DESCRICAO GRUPO, ' +
                 'SUM(TRANSITENS.QUANTIDADE) QUANTIDADE, SUM(TRANSITENS.VR_TOTAL + TRANSITENS.VALOR_ICMS_ST + TRANSITENS.VR_FRETE + TRANSITENS.VR_ACRESCIMO + TRANSITENS.VR_IPI - TRANSITENS.DESC_RODAPE) VR_TOTAL');
    QRel.Sql.Add('FROM TRANSITENS');
    QRel.Sql.Add('INNER JOIN PRODUTOS');
    QRel.Sql.Add('ON (TRANSITENS.PRODUTO_ID = PRODUTOS.PRODUTO_ID)');
    QRel.Sql.Add('INNER JOIN TABELAS');
    QRel.Sql.Add('ON (PRODUTOS.GRUPO_ID = TABELAS.TABELA_ID AND TABELAS.TIPO_TABELA = :TIPO_TABELA)');
    QRel.Sql.Add('INNER JOIN TRANSACOES');
    QRel.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
    QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
    QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
    QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');

    if Caixa_Banco.Value > 0 then
      QRel.Sql.Add('AND (TRANSACOES.BANCO_ID = :BANCO_ID)');

    QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :CONDUTA)');
    QRel.Sql.Add('AND (TRANSACOES.DEPTO = :DEPTO)');
    QRel.Sql.Add('GROUP BY TRANSITENS.PRODUTO_ID, PRODUTOS.DESCRICAO, PRODUTOS.QUANTIDADE_C, PRODUTOS.QUANTIDADE_G, TABELAS.DESCRICAO');
    QRel.Sql.Add('ORDER BY TABELAS.DESCRICAO, PRODUTOS.DESCRICAO');

    QRel.ParamByName('TIPO_TABELA').AsString  := '7';
    QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
    QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;

    if Caixa_Banco.Value > 0 then
      QRel.ParamByName('BANCO_ID').AsInteger := StrToInt(Caixa_Banco.Text);

    QRel.ParamByName('CONDUTA').AsString := '01';
    QRel.ParamByName('DEPTO').AsString   := '07';

    QRel.Prepare;
    QRel.Open;
    }

    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT LOTE_PRODUTOS.*,PRODUTOS.DESCRICAO,FORNECEDORES.NOME ');
    QRel.Sql.Add('FROM LOTE_PRODUTOS ');
    QRel.Sql.Add('INNER JOIN PRODUTOS ON PRODUTOS.PRODUTO_ID = LOTE_PRODUTOS.PRODUTO_ID ');
    QRel.Sql.Add('LEFT JOIN FORNECEDORES ON FORNECEDORES.FORNECEDOR_ID = LOTE_PRODUTOS.FORNECEDOR_ID ');
    QRel.Sql.Add('WHERE (DT_VALIDADE BETWEEN :DT_INICIAL AND :DT_FINAL) ');

    if Produto_id.Value > 0 then
      QRel.Sql.Add('AND (PRODUTOS.PRODUTO_ID = :PRODUTO_ID)');

    QRel.Sql.Add('ORDER BY DT_VALIDADE,PRODUTO_ID,LOTE_ID');

    if Produto_id.Value > 0 then
      QRel.ParamByName('PRODUTO_ID').AsInteger := StrToInt(Produto_id.Text);

    QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
    QRel.Prepare;
    QRel.Open;

    QRLabel1.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;

    if QRel.IsEmpty then
      Application.MessageBox('Não há dados para os parâmetros informados', PChar(Msg_Title), mb_IconInformation)
    else
      Controle_Validade.PreviewModal;
  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;

procedure TFrmRel_Controle_Validade.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRel_Controle_Validade.Produto_idChange(Sender: TObject);
begin
  if Produto_id.Value > 0 then
    SearchBanco;
end;

procedure TFrmRel_Controle_Validade.Produto_idKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = Produto_id) then
    btnProdutoClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmRel_Controle_Validade.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmRel_Controle_Validade.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    //Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmRel_Controle_Validade.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmRel_Controle_Validade.FormCreate(Sender: TObject);
begin
  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);
end;

end.
