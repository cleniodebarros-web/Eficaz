unit URel_Controle_Estoque_Loc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, DB, IBCustomDataSet, IBQuery, StdCtrls,
  Buttons, Mask, rxToolEdit, DBCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, RxCurrEdit;

type
  TFrmRel_Controle_Estoque_Loc = class(TForm)
    Label1: TLabel;
    Dtmen: TDateEdit;
    Dtmai: TDateEdit;
    Label4: TLabel;
    Tipo_Rel: TComboBox;
    Bevel1: TBevel;
    btnExecuta: TBitBtn;
    btnRetorna: TBitBtn;
    Transferencia_Sintetico: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    QRDBText3: TQRDBText;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    Cabec: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel10: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    SummaryBand1: TQRBand;
    QRShape4: TQRShape;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr1: TQRExpr;
    QRExpr6: TQRExpr;
    QRSysData3: TQRSysData;
    Transferencia_Analitico: TQuickRep;
    QRBand1: TQRBand;
    QRSysData4: TQRSysData;
    QRLabel14: TQRLabel;
    QRSysData5: TQRSysData;
    QRLabel15: TQRLabel;
    QRShape2: TQRShape;
    QRLabel16: TQRLabel;
    QRShape5: TQRShape;
    QRLabel17: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel23: TQRLabel;
    QRBand2: TQRBand;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText20: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRBand3: TQRBand;
    QRLabel24: TQRLabel;
    QRShape6: TQRShape;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRShape7: TQRShape;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRBand4: TQRBand;
    QRLabel31: TQRLabel;
    QRExpr7: TQRExpr;
    QRShape8: TQRShape;
    QRBand5: TQRBand;
    QRSysData6: TQRSysData;
    QRExpr8: TQRExpr;
    QRLabel39: TQRLabel;
    Sumarizado: TQuickRep;
    QRBand6: TQRBand;
    QRDBText14: TQRDBText;
    QRSysData7: TQRSysData;
    QRLabel20: TQRLabel;
    QRLabel22: TQRLabel;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRLabel32: TQRLabel;
    QRSysData8: TQRSysData;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel40: TQRLabel;
    QRBand7: TQRBand;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRBand8: TQRBand;
    QRExpr9: TQRExpr;
    QRLabel41: TQRLabel;
    QRGroup1: TQRGroup;
    QRDBText33: TQRDBText;
    QRBand9: TQRBand;
    QRShape11: TQRShape;
    QRLabel42: TQRLabel;
    QRExpr10: TQRExpr;
    Label2: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DataEmpresa: TDataSource;
    CheckBox1: TCheckBox;
    QRLabel38: TQRLabel;
    QEmpresa: TFDQuery;
    QItens: TFDQuery;
    TIPO_TRANSACAO: TComboBox;
    Label3: TLabel;
    QRExpr11: TQRExpr;
    QRShape12: TQRShape;
    QRLabel35: TQRLabel;
    QRel: TFDQuery;
    QRDBText19: TQRDBText;
    QRLabel36: TQRLabel;
    Label5: TLabel;
    Produto_id: TCurrencyEdit;
    btnProduto: TSpeedButton;
    DBText1: TDBText;
    QProduto: TFDQuery;
    DataProduto: TDataSource;
    Totalizado: TQuickRep;
    QRBand10: TQRBand;
    QRDBText31: TQRDBText;
    QRSysData9: TQRSysData;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRLabel45: TQRLabel;
    QRSysData10: TQRSysData;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel52: TQRLabel;
    QRBand11: TQRBand;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText37: TQRDBText;
    QRBand12: TQRBand;
    QRExpr12: TQRExpr;
    QRLabel53: TQRLabel;
    QRGroup2: TQRGroup;
    QRDBText40: TQRDBText;
    QRBand13: TQRBand;
    QRShape15: TQRShape;
    QRLabel54: TQRLabel;
    QRExpr13: TQRExpr;
    procedure FormCreate(Sender: TObject);
    procedure Tipo_RelKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRetornaClick(Sender: TObject);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DtmenEnter(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure FormShow(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure SumarizadoBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure Tipo_RelChange(Sender: TObject);
    procedure btnProdutoClick(Sender: TObject);
    procedure Produto_idExit(Sender: TObject);
    procedure Produto_idKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Controle_Estoque_Loc: TFrmRel_Controle_Estoque_Loc;

implementation

uses
  UData, UPrincipal,Uconsulta;

{$R *.dfm}

procedure TFrmRel_Controle_Estoque_Loc.btnExecutaClick(Sender: TObject);
begin
// 125, 325
  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    if (Tipo_Rel.Text = 'Analítico') or (Tipo_Rel.Text = 'Sintético') then
    begin
      QRel.Sql.Clear;
      QRel.Sql.Add('SELECT TRANSACOES.*, TABELAS.DESCRICAO LOCALIZACAO_DESTINO');
      QRel.Sql.Add('FROM TRANSACOES');
      QRel.Sql.Add('INNER JOIN TABELAS');
      QRel.Sql.Add('ON (TRANSACOES.LOCALIZACAO_ID = TABELAS.TABELA_ID AND TABELAS.TIPO_TABELA = :TIPO_TABELA)');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSACOES.DT_ENT_SAI BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :CONDUTA)');
      QRel.Sql.Add('AND (TRANSACOES.DEPTO = :DEPTO)');

      if CheckBox1.Checked = False then
         QRel.Sql.Add('AND (TRANSACOES.LOCALIZACAO_ID = :LOCALIZACAO_ID)');

      QRel.Sql.Add('ORDER BY TRANSACOES.DT_ENT_SAI');

      QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
      QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
      QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
      QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
      QRel.ParamByName('TIPO_TABELA').AsString  := 'L';

      If Tipo_Transacao.Text = 'Entrada' Then
      Begin
      QRel.ParamByName('CONDUTA').AsString      := '02';
      QRel.ParamByName('DEPTO').AsString        := '07';
      End
      Else
      Begin
      QRel.ParamByName('CONDUTA').AsString      := '01';
      QRel.ParamByName('DEPTO').AsString        := '07';
      End;

      if CheckBox1.Checked = False then
      QRel.ParamByName('LOCALIZACAO_ID').AsInteger  := QEmpresa.FieldByName('TABELA_ID').AsInteger;

      QRel.Prepare;
      QRel.Open;
    end
    Else
    if  Tipo_Rel.Text = 'Totalizado' Then
    Begin


     QRel.Sql.Clear;
     QRel.Sql.Add('SELECT LOCALIZACAO_ESTOQUE_PRODUTOS.PRODUTO_ID,PRODUTOS.DESCRICAO, LOCALIZACAO_ESTOQUE_PRODUTOS.DESCRICAO LOCALIZACAO ,SUM(QUANTIDADE) QUANTIDADE');
     QRel.Sql.Add('FROM LOCALIZACAO_ESTOQUE_PRODUTOS');
     QRel.Sql.Add('INNER JOIN PRODUTOS ON PRODUTOS.PRODUTO_ID = LOCALIZACAO_ESTOQUE_PRODUTOS.PRODUTO_ID');

     if Produto_id.Value > 0 Then
     Begin
       QRel.Sql.Add('WHERE LOCALIZACAO_ESTOQUE_PRODUTOS.PRODUTO_ID = :PRODUTO_ID ');
       QRel.ParamByName('PRODUTO_ID').AsInteger  := StrToint(Produto_id.Text);

       if CheckBox1.Checked = False then
       Begin
       QRel.Sql.Add('AND LOCALIZACAO_ESTOQUE_PRODUTOS.DESCRICAO = :DESCRICAO ');
       QRel.ParamByName('DESCRICAO').AsString  := QEmpresa.FieldByName('DESCRICAO').AsString;
       End;
     End
     Else
     Begin
       if CheckBox1.Checked = False then
       Begin
       QRel.Sql.Add('WHERE LOCALIZACAO_ESTOQUE_PRODUTOS.DESCRICAO = :DESCRICAO ');
       QRel.ParamByName('DESCRICAO').AsString  := QEmpresa.FieldByName('DESCRICAO').AsString;
       End;
     End;

     QRel.Sql.Add('GROUP BY LOCALIZACAO_ESTOQUE_PRODUTOS.DESCRICAO ,LOCALIZACAO_ESTOQUE_PRODUTOS.PRODUTO_ID, PRODUTOS.DESCRICAO ');
     QRel.Sql.Add('ORDER BY LOCALIZACAO_ESTOQUE_PRODUTOS.DESCRICAO ');


     QRel.Prepare;
     QRel.Open;

    End
    else if Tipo_Rel.Text = 'Sumarizado' then
    begin
      QRel.Sql.Clear;
      QRel.Sql.Add('SELECT TRANSACOES.DT_ENT_SAI ,TRANSITENS.PRODUTO_ID, TRANSITENS.DESCRICAO, LOCALIZACAO_ESTOQUE_PRODUTOS.QUANTIDADE, TABELAS.DESCRICAO LOCALIZACAO_DESTINO ,' +
                   'SUM(LOCALIZACAO_ESTOQUE_PRODUTOS.QUANTIDADE) QUANTIDADE, SUM(TRANSITENS.VR_TOTAL) VR_TOTAL,TRANSACOES.LOCALIZACAO_ID');
      QRel.Sql.Add('FROM TRANSITENS');
      QRel.Sql.Add('INNER JOIN TRANSACOES');
      QRel.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
      QRel.Sql.Add('INNER JOIN TABELAS');
      QRel.Sql.Add('ON (TRANSACOES.LOCALIZACAO_ID = TABELAS.TABELA_ID AND TABELAS.TIPO_TABELA = :TIPO_TABELA)');
      QRel.Sql.Add('INNER JOIN LOCALIZACAO_ESTOQUE_PRODUTOS');
      QRel.Sql.Add('ON (TRANSACOES.LOCALIZACAO_ID = LOCALIZACAO_ESTOQUE_PRODUTOS.LOCALIZACAO_ID)');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSACOES.DT_ENT_SAI BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :CONDUTA)');
      QRel.Sql.Add('AND (TRANSACOES.DEPTO = :DEPTO)');

      if CheckBox1.Checked = False then
      QRel.Sql.Add('AND (TRANSACOES.LOCALIZACAO_ID = :LOCALIZACAO_ID)');

      QRel.Sql.Add('GROUP BY TRANSITENS.PRODUTO_ID, TRANSITENS.DESCRICAO, LOCALIZACAO_ESTOQUE_PRODUTOS.QUANTIDADE, TABELAS.DESCRICAO,TRANSACOES.LOCALIZACAO_ID,DT_ENT_SAI');
      QRel.Sql.Add('ORDER BY TABELAS.DESCRICAO, TRANSITENS.DESCRICAO');

      QRel.ParamByName('TIPO_TABELA').AsString  := 'L';
      QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
      QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
      QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
      QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;


      If Tipo_Transacao.Text = 'Entrada' Then
      Begin
      QRel.ParamByName('CONDUTA').AsString      := '02';
      QRel.ParamByName('DEPTO').AsString        := '07';
      End
      Else
      Begin
      QRel.ParamByName('CONDUTA').AsString      := '01';
      QRel.ParamByName('DEPTO').AsString        := '07';
      End;

      if CheckBox1.Checked = False then
      QRel.ParamByName('LOCALIZACAO_ID').AsInteger  := QEmpresa.FieldByName('TABELA_ID').AsInteger;

      QRel.Prepare;
      QRel.Open;
    end;

    QRLabel1.Caption  := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;
    QRLabel21.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;
    QRLabel22.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;
   
    if QRel.IsEmpty then
      Application.MessageBox('Não há dados para os parâmetros informados', PChar(Msg_Title), mb_IconInformation)
    else
    begin
      if Tipo_Rel.Text <> 'Sumarizado' then
      begin
        if Tipo_Rel.Text = 'Analítico' then
        Begin
          Transferencia_Analitico.Prepare;
          Transferencia_Analitico.PreviewModal;
        End
        else
        if Tipo_Rel.Text = 'Totalizado' Then
        Totalizado.PreviewModal
        Else
          Transferencia_Sintetico.PreviewModal;
      end
      else
        Sumarizado.PreviewModal;
    end;
  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;

procedure TFrmRel_Controle_Estoque_Loc.btnProdutoClick(Sender: TObject);
begin
 try
    //MODIFICADO DIA 02-10-2017 a pedido de Regivaldo.
    //Produto.Value := GetConsulta('ESTOQUE', 0, 0, StrToInt(Produto.Text));
    Produto_id.Value := GetConsulta('ESTOQUE', FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger, 0, StrToInt(Produto_id.Text));

  except
    //Produto.Value := GetConsulta('ESTOQUE', 0, 0, 0);
    Produto_id.Value := GetConsulta('ESTOQUE', FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger, 0, 0);
  end;

end;

procedure TFrmRel_Controle_Estoque_Loc.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRel_Controle_Estoque_Loc.CheckBox1Click(Sender: TObject);
begin
 if CheckBox1.Checked = True then
 Begin
 DBLookupComboBox1.Enabled := False;
 Label2.Enabled            := False;
 End
 Else
 Begin
 DBLookupComboBox1.Enabled := True;
 Label2.Enabled            := True;
 End;

end;

procedure TFrmRel_Controle_Estoque_Loc.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmRel_Controle_Estoque_Loc.DtmenKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
   // Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmRel_Controle_Estoque_Loc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmRel_Controle_Estoque_Loc.FormCreate(Sender: TObject);
begin
  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);
end;

procedure TFrmRel_Controle_Estoque_Loc.FormShow(Sender: TObject);
begin
 QEmpresa.Open;

end;

procedure TFrmRel_Controle_Estoque_Loc.Produto_idExit(Sender: TObject);
begin
 QProduto.close;

  if Produto_id.Value <> 0 then
  Begin
  QProduto.SQL.Clear;
  QProduto.SQL.Add('SELECT * FROM PRODUTOS');
  QProduto.SQL.Add('WHERE');
  QProduto.SQL.Add('(PRODUTO_ID = :PRODUTO_ID)');
  QProduto.SQL.Add('AND (EMPRESA_ID = :EMPRESA_ID)');
  QProduto.SQL.Add('AND STATUS = :STATUS');

  QProduto.ParamByName('PRODUTO_ID').AsInteger := StrToInt(Produto_id.Text);
  QProduto.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  QProduto.ParamByName('STATUS').AsString := 'A';

  QProduto.Prepare;
  QProduto.Open;
  End
end;

procedure TFrmRel_Controle_Estoque_Loc.Produto_idKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if (Key = Vk_F7) and (Sender = Produto_id) then
    btnProdutoClick(Self);
end;

procedure TFrmRel_Controle_Estoque_Loc.QRBand2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  QItens.Sql.Clear;
  QItens.Sql.Add('SELECT * FROM TRANSITENS');
  QItens.Sql.Add('WHERE');
  QItens.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

  QItens.ParamByName('TRANSACAO_ID').AsInteger := QRel.FieldByName('TRANSACAO_ID').AsInteger;

  QItens.Prepare;
  QItens.Open;


end;

procedure TFrmRel_Controle_Estoque_Loc.SumarizadoBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
if CheckBox1.Checked = False then
Begin
QRLabel38.Enabled := True;
QRLabel38.Caption  :='Localização Estoque: ' + QEmpresa.FieldByName('DESCRICAO').AsString;
End
Else
QRLabel38.Enabled := False;

end;

procedure TFrmRel_Controle_Estoque_Loc.Tipo_RelChange(Sender: TObject);
begin
 IF TIPO_REL.Text = 'Totalizado' Then
 Begin
 Produto_id.enabled := True;
 Btnproduto.Enabled := True;
 Tipo_transacao.Enabled := False;
 End
 Else
 Begin
 Produto_id.enabled := False;
 Btnproduto.Enabled := False;
 Tipo_transacao.Enabled := True;
 End;
end;

procedure TFrmRel_Controle_Estoque_Loc.Tipo_RelKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

end.
