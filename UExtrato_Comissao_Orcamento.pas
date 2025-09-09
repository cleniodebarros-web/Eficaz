unit UExtrato_Comissao_Orcamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBTables, DB, IBCustomDataSet, IBQuery, Buttons, ExtCtrls,
  rxCurrEdit, Mask, rxToolEdit, QRCtrls, QuickRpt, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmExtrato_Comissao_Orcamento = class(TForm)
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
    Label3: TLabel;
    Comissao: TCurrencyEdit;
    Extrato_Comissao: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    QRSysData1: TQRSysData;
    Cabec: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape2: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRGroup1: TQRGroup;
    QRDBText3: TQRDBText;
    QRBand1: TQRBand;
    QRShape3: TQRShape;
    QRShape5: TQRShape;
    QRBand2: TQRBand;
    QRShape4: TQRShape;
    QRShape6: TQRShape;
    QRExpr5: TQRExpr;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    Label4: TLabel;
    Tipo_Orcamento: TComboBox;
    QExterno: TFDQuery;
    QVendedor: TFDQuery;
    QREl: TFDQuery;
    Relat: TFDMemTable;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    Extrato_Comissao_Por_Item: TQuickRep;
    QRBand3: TQRBand;
    QRSysData3: TQRSysData;
    QRLabel11: TQRLabel;
    QRSysData4: TQRSysData;
    QRLabel12: TQRLabel;
    QRShape7: TQRShape;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape8: TQRShape;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel19: TQRLabel;
    QRLabel21: TQRLabel;
    QRBand4: TQRBand;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText15: TQRDBText;
    QRGroup2: TQRGroup;
    QRDBText16: TQRDBText;
    QRBand5: TQRBand;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRExpr4: TQRExpr;
    QRExpr6: TQRExpr;
    QRLabel22: TQRLabel;
    QRBand6: TQRBand;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRLabel23: TQRLabel;
    Chk_Comissao_Por_Item: TCheckBox;
    REL_PRODUTOS_SEM_COMISSAO: TQuickRep;
    QRBand7: TQRBand;
    QRSysData5: TQRSysData;
    QRLabel20: TQRLabel;
    QRSysData6: TQRSysData;
    QRLabel24: TQRLabel;
    QRShape13: TQRShape;
    QRLabel27: TQRLabel;
    QRShape14: TQRShape;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel31: TQRLabel;
    QRBand8: TQRBand;
    QRDBText17: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText21: TQRDBText;
    procedure btnVendedorClick(Sender: TObject);
    procedure VendedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnExecutaClick(Sender: TObject);
    procedure DtmenEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnRetornaClick(Sender: TObject);
    procedure Rel_Comissao_Por_Item();
    procedure Chk_Comissao_Por_ItemClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmExtrato_Comissao_Orcamento: TFrmExtrato_Comissao_Orcamento;

implementation

uses
  UPrincipal, UData, UConsulta;

{$R *.dfm}

procedure TFrmExtrato_Comissao_Orcamento.Rel_Comissao_Por_Item();
begin
  QREl.SQL.Clear;
  QREl.SQL.Add('SELECT DISTINCT ORCITENS.PRODUTO_ID, ORCITENS.DESCRICAO, PRODUTOS.COMISSAO FROM ORCITENS');
  QREl.SQL.Add('INNER JOIN PRODUTOS ON PRODUTOS.PRODUTO_ID = ORCITENS.PRODUTO_ID');
  QREl.SQL.Add('INNER JOIN ORCAMENTOS ON ORCAMENTOS.ORCAMENTO_ID = ORCITENS.ORCAMENTO_ID');
  QREl.SQL.Add('WHERE (ORCAMENTOS.EMPRESA_ID = :EMPRESA_ID)');
  QREl.SQL.Add('AND (ORCAMENTOS.DT_ORCAMENTO BETWEEN :DT_INICIAL AND :DT_FINAL)');
  QREl.SQL.Add('AND PRODUTOS.COMISSAO <= 0');
  QREl.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  QREl.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
  QREl.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;

  QREl.Open();

  if not QREl.IsEmpty then
  begin
    Application.MessageBox('Existem produtos que não possuem a comissão configurada, faça a correção através do relatório e tente novamente.', PChar(Msg_Title), MB_ICONEXCLAMATION);
    QRLabel13.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;
    REL_PRODUTOS_SEM_COMISSAO.PreviewModal;
    Abort;
  end;



  QREl.SQL.Clear;
  QREl.SQL.Add('SELECT * FROM (');
  QREl.SQL.Add('SELECT FUNCIONARIOS.NOME VENDEDOR, ORCAMENTOS.DT_ORCAMENTO, ORCAMENTOS.VALOR, CAST(COMISSAO.ORCAMENTO_ID AS VARCHAR) ORCAMENTO_ID,');
  QREl.SQL.Add('COMISSAO.VALOR_COMISSAO, ORCAMENTOS.NOME CLIENTE FROM ');
  QREl.SQL.Add('(');
  QREl.SQL.Add('SELECT ORCITENS.ORCAMENTO_ID, SUM(( (ORCITENS.VR_TOTAL - ((ORCITENS.VR_TOTAL / ORCAMENTOS.VALOR_PRODUTOS) * (ORCAMENTOS.VR_DESCONTO))');
  QREl.SQL.Add('+ ((ORCITENS.VR_TOTAL / ORCAMENTOS.VALOR_PRODUTOS) * (ORCAMENTOS.VR_ACRESCIMO)) )  * PRODUTOS.COMISSAO / 100)) VALOR_COMISSAO from ORCITENS');
  QREl.SQL.Add('INNER JOIN PRODUTOS ON PRODUTOS.PRODUTO_ID = ORCITENS.PRODUTO_ID');
  QREl.SQL.Add('INNER JOIN ORCAMENTOS ON ORCAMENTOS.ORCAMENTO_ID = ORCITENS.ORCAMENTO_ID');
  QREl.SQL.Add('GROUP BY ORCITENS.ORCAMENTO_ID');
  QREl.SQL.Add(') AS COMISSAO');
  QREl.SQL.Add('INNER JOIN ORCAMENTOS ON ORCAMENTOS.ORCAMENTO_ID = COMISSAO.ORCAMENTO_ID');
  QREl.SQL.Add('INNER JOIN FUNCIONARIOS ON (FUNCIONARIOS.FUNCIONARIO_ID = ORCAMENTOS.VENDEDOR_ID)');
  QREl.SQL.Add('WHERE');
  QREl.SQL.Add('(ORCAMENTOS.EMPRESA_ID = :EMPRESA_ID)');
  QREl.SQL.Add('AND (ORCAMENTOS.DT_ORCAMENTO BETWEEN :DT_INICIAL AND :DT_FINAL)');
  QREl.SQL.Add('AND (ORCAMENTOS.COMANDA IS NULL)');

  if Vendedor.Value > 0 then
  begin
    QREl.Sql.Add('AND (ORCAMENTOS.VENDEDOR_ID = :VENDEDOR_ID)');
    QREl.ParamByName('VENDEDOR_ID').AsInteger := StrToInt(Vendedor.Text);
  end
  else
    QREl.Sql.Add('AND (ORCAMENTOS.VENDEDOR_ID > 0)');

  if Tipo_Orcamento.Text = 'Orc. Agrupados' then
    QREl.Sql.Add('AND (ORCAMENTOS.TRANSACAO_ID > 0)');

  if Tipo_Orcamento.Text = 'Orc. n/ Agrupados' then
    QREl.Sql.Add('AND ((ORCAMENTOS.TRANSACAO_ID = 0) OR (ORCAMENTOS.TRANSACAO_ID IS NULL))');

  QREl.SQL.Add('UNION ALL');

  QREl.SQL.Add('SELECT FUNCIONARIOS.NOME VENDEDOR, ORCAMENTOS.DT_ORCAMENTO, ORCAMENTOS.VALOR, CAST(COMISSAO.ORCAMENTO_ID AS VARCHAR) ORCAMENTO_ID,');
  QREl.SQL.Add('COMISSAO.VALOR_COMISSAO, ORCAMENTOS.NOME CLIENTE FROM ');
  QREl.SQL.Add('(');
  QREl.SQL.Add('SELECT ORCITENS.ORCAMENTO_ID, SUM(( (ORCITENS.VR_TOTAL - ((ORCITENS.VR_TOTAL / ORCAMENTOS.VALOR_PRODUTOS) * (ORCAMENTOS.VR_DESCONTO))');
  QREl.SQL.Add('+ ((ORCITENS.VR_TOTAL / ORCAMENTOS.VALOR_PRODUTOS) * (ORCAMENTOS.VR_ACRESCIMO)) )  * PRODUTOS.COMISSAO / 100)) VALOR_COMISSAO from ORCITENS');
  QREl.SQL.Add('INNER JOIN PRODUTOS ON PRODUTOS.PRODUTO_ID = ORCITENS.PRODUTO_ID');
  QREl.SQL.Add('INNER JOIN ORCAMENTOS ON ORCAMENTOS.ORCAMENTO_ID = ORCITENS.ORCAMENTO_ID');
  QREl.SQL.Add('GROUP BY ORCITENS.ORCAMENTO_ID');
  QREl.SQL.Add(') AS COMISSAO');
  QREl.SQL.Add('INNER JOIN ORCAMENTOS ON ORCAMENTOS.ORCAMENTO_ID = COMISSAO.ORCAMENTO_ID');
  QREl.SQL.Add('INNER JOIN FUNCIONARIOS ON (FUNCIONARIOS.FUNCIONARIO_ID = ORCAMENTOS.VENDEDOR_ID_2)');
  QREl.SQL.Add('WHERE');
  QREl.SQL.Add('(ORCAMENTOS.EMPRESA_ID = :EMPRESA_ID)');
  QREl.SQL.Add('AND (ORCAMENTOS.DT_ORCAMENTO BETWEEN :DT_INICIAL AND :DT_FINAL)');
  QREl.SQL.Add('AND (ORCAMENTOS.COMANDA IS NULL)');

  if Vendedor.Value > 0 then
  begin
    QREl.Sql.Add('AND (ORCAMENTOS.VENDEDOR_ID_2 = :VENDEDOR_ID)');
    QREl.ParamByName('VENDEDOR_ID').AsInteger := StrToInt(Vendedor.Text);
  end
  else
    QREl.Sql.Add('AND (ORCAMENTOS.VENDEDOR_ID_2 > 0)');

  if Tipo_Orcamento.Text = 'Orc. Agrupados' then
    QREl.Sql.Add('AND (ORCAMENTOS.TRANSACAO_ID > 0)');

  if Tipo_Orcamento.Text = 'Orc. n/ Agrupados' then
    QREl.Sql.Add('AND ((ORCAMENTOS.TRANSACAO_ID = 0) OR (ORCAMENTOS.TRANSACAO_ID IS NULL))');


  QREl.SQL.Add(') AS TESTE');

  QREl.Sql.Add('ORDER BY VENDEDOR, DT_ORCAMENTO');

  QREl.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  QREl.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
  QREl.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;

  QREl.Open();

  QRLabel13.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;

  if QREl.IsEmpty then
    Application.MessageBox('Não há dados para serem impressos', PChar(Msg_Title), mb_IconInformation)
  else
    Extrato_Comissao_Por_Item.PreviewModal;


end;

procedure TFrmExtrato_Comissao_Orcamento.btnExecutaClick(Sender: TObject);
var
Vl_Venda, Per_Com, Per_Acr: Double;
Temp_Name: String;
begin
// 151, 327

  if Chk_Comissao_Por_Item.Checked then
  begin
    Rel_Comissao_Por_Item();
    Abort;
  end;


  try
    with Relat do
    begin

      Temp_Name    := Copy(TimeToStr(time), 1, 2) + Copy(TimeToStr(time), 4, 2) + Copy(TimeToStr(time), 7, 2);


      with FieldDefs do
      begin
        Clear;
        Add('CODIGO', ftAutoInc, 0, False);
        Add('NOME', ftString, 40, False);
        Add('DATA', ftDate, 0, False);
        Add('NUM_DOC', ftString, 6, False);
        Add('HISTORICO', ftString, 40, False);
        Add('VR_VENDA', ftFloat, 0, False);
        Add('PERCENT', ftFloat, 0, False);
        Add('VR_COMISSAO', ftFloat, 0, False);
      end;

      with IndexDefs do
      begin
        Clear;
        Add('', 'CODIGO', [ixPrimary, ixUnique]);
        Add('TEMP', 'NOME;DATA', [ixCaseInsensitive]);
      end;
      IndexName := 'TEMP';
      Open;
    end;

    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT * FROM (');
    QRel.Sql.Add('SELECT ORCAMENTOS.*, FUNCIONARIOS.NOME VENDEDOR');
    QRel.Sql.Add('FROM ORCAMENTOS');
    QRel.Sql.Add('INNER JOIN FUNCIONARIOS');
    QRel.Sql.Add('ON (FUNCIONARIOS.FUNCIONARIO_ID = ORCAMENTOS.VENDEDOR_ID)');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(ORCAMENTOS.EMPRESA_ID = :EMPRESA_ID)');
    QRel.Sql.Add('AND (ORCAMENTOS.DT_ORCAMENTO BETWEEN :DT_INICIAL AND :DT_FINAL)');
    QRel.Sql.Add('AND (ORCAMENTOS.COMANDA IS NULL)');

    if Vendedor.Value > 0 then
    begin
      QRel.Sql.Add('AND (ORCAMENTOS.VENDEDOR_ID = :VENDEDOR_ID)');
      QRel.ParamByName('VENDEDOR_ID').AsInteger := StrToInt(Vendedor.Text);
    end
    else
      QRel.Sql.Add('AND (ORCAMENTOS.VENDEDOR_ID > 0)');

    if Tipo_Orcamento.Text = 'Orc. Agrupados' then
      QRel.Sql.Add('AND (ORCAMENTOS.TRANSACAO_ID > 0)');

    if Tipo_Orcamento.Text = 'Orc. n/ Agrupados' then
      QRel.Sql.Add('AND ((ORCAMENTOS.TRANSACAO_ID = 0) OR (ORCAMENTOS.TRANSACAO_ID IS NULL))');

    QREl.SQL.Add('UNION ALL');

    QRel.Sql.Add('SELECT ORCAMENTOS.*, FUNCIONARIOS.NOME VENDEDOR');
    QRel.Sql.Add('FROM ORCAMENTOS');
    QRel.Sql.Add('INNER JOIN FUNCIONARIOS');
    QRel.Sql.Add('ON (FUNCIONARIOS.FUNCIONARIO_ID = ORCAMENTOS.VENDEDOR_ID_2)');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(ORCAMENTOS.EMPRESA_ID = :EMPRESA_ID)');
    QRel.Sql.Add('AND (ORCAMENTOS.DT_ORCAMENTO BETWEEN :DT_INICIAL AND :DT_FINAL)');
    QRel.Sql.Add('AND (ORCAMENTOS.COMANDA IS NULL)');

    if Vendedor.Value > 0 then
    begin
      QRel.Sql.Add('AND (ORCAMENTOS.VENDEDOR_ID_2 = :VENDEDOR_ID)');
      QRel.ParamByName('VENDEDOR_ID').AsInteger := StrToInt(Vendedor.Text);
    end
    else
      QRel.Sql.Add('AND (ORCAMENTOS.VENDEDOR_ID_2 > 0)');

    if Tipo_Orcamento.Text = 'Orc. Agrupados' then
      QRel.Sql.Add('AND (ORCAMENTOS.TRANSACAO_ID > 0)');

    if Tipo_Orcamento.Text = 'Orc. n/ Agrupados' then
      QRel.Sql.Add('AND ((ORCAMENTOS.TRANSACAO_ID = 0) OR (ORCAMENTOS.TRANSACAO_ID IS NULL))');

    QRel.Sql.Add(')AS TESTE');

    QRel.Sql.Add('ORDER BY NOME, DT_ORCAMENTO');

    QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;

    QRel.Prepare;
    QRel.Open;

    QRel.First;
    while not QRel.Eof do
    begin
      if Comissao.Value = 0 then
        Per_Com := QRel.FieldByName('COMISSAO').AsFloat
      else
        Per_Com := Comissao.Value;

      Vl_Venda := QRel.FieldByName('VALOR').AsFloat - QRel.FieldByName('VR_ACRESCIMO').AsFloat;

      if (Vl_Venda * Per_Com) <> 0 then
      begin
        Relat.Append;
        Relat.FieldByName('NOME').AsString       := QRel.FieldByName('VENDEDOR').AsString;
        Relat.FieldByName('DATA').AsString       := QRel.FieldByName('DT_ORCAMENTO').AsString;
        Relat.FieldByName('NUM_DOC').AsString    := StrZero(QRel.FieldByName('ORCAMENTO_ID').AsString, 6, 0);
        Relat.FieldByName('HISTORICO').AsString  := QRel.FieldByName('NOME').AsString;
        Relat.FieldByName('VR_VENDA').AsFloat    := Vl_Venda;
        Relat.FieldByName('PERCENT').AsFloat     := Per_Com;
        Relat.FieldByName('VR_COMISSAO').AsFloat := ((Relat.FieldByName('VR_VENDA').AsFloat * Relat.FieldByName('PERCENT').AsFloat) / 100);
        Relat.Post;
      end;

      Application.ProcessMessages;
      QRel.Next;
    end;       

    QRLabel13.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;

    if Relat.IsEmpty then
      Application.MessageBox('Não há dados para serem impressos', PChar(Msg_Title), mb_IconInformation)
    else
      Extrato_Comissao.PreviewModal;
  finally
    Relat.IndexName := '';
    Relat.Close;

  end;
end;

procedure TFrmExtrato_Comissao_Orcamento.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmExtrato_Comissao_Orcamento.btnVendedorClick(Sender: TObject);
begin
  try
    Vendedor.Value := GetConsulta('PESSOAL', 0, 0, StrToInt(Vendedor.Text));
  except
    Vendedor.Value := GetConsulta('PESSOAL', 0, 0, 0);
  end;
end;

procedure TFrmExtrato_Comissao_Orcamento.Chk_Comissao_Por_ItemClick(
  Sender: TObject);
begin
  if Chk_Comissao_Por_Item.Checked then
    Comissao.Enabled := False
  else
    Comissao.Enabled := True;

end;

procedure TFrmExtrato_Comissao_Orcamento.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmExtrato_Comissao_Orcamento.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    //Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmExtrato_Comissao_Orcamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmExtrato_Comissao_Orcamento.FormCreate(Sender: TObject);
begin
  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);
end;

procedure TFrmExtrato_Comissao_Orcamento.VendedorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = Vendedor) then
    btnVendedorClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

end.
