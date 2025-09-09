unit URel_Transferencia_Estoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, DB, IBCustomDataSet, IBQuery, StdCtrls,
  Buttons, Mask, rxToolEdit, DBCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, RxCurrEdit;

type
  TFrmRel_Transf_Estoque = class(TForm)
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
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel40: TQRLabel;
    QRBand7: TQRBand;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
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
    QRel: TFDQuery;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Transf_Estoque: TFrmRel_Transf_Estoque;

implementation

uses
  UData, UPrincipal;

{$R *.dfm}

procedure TFrmRel_Transf_Estoque.btnExecutaClick(Sender: TObject);
begin
// 125, 325
  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    if Tipo_Rel.Text <> 'Sumarizado' then
    begin
      QRel.Sql.Clear;
      QRel.Sql.Add('SELECT TRANSACOES.*, EMPRESAS.RAZAO EMPRESA_DESTINO');
      QRel.Sql.Add('FROM TRANSACOES');
      QRel.Sql.Add('INNER JOIN EMPRESAS');
      QRel.Sql.Add('ON (TRANSACOES.EMPRESAAUX_ID = EMPRESAS.EMPRESA_ID)');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :CONDUTA)');
      QRel.Sql.Add('AND (TRANSACOES.DEPTO = :DEPTO)');

      if CheckBox1.Checked = False then
         QRel.Sql.Add('AND (TRANSACOES.EMPRESAAUX_ID = :EMPRESA_DESTINO)');

      QRel.Sql.Add('ORDER BY TRANSACOES.TRANSACAO_ID, TRANSACOES.DT_TRANS');

      QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
      QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
      QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
      QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
      QRel.ParamByName('CONDUTA').AsString      := '20';
      QRel.ParamByName('DEPTO').AsString        := '07';


      if CheckBox1.Checked = False then
      QRel.ParamByName('EMPRESA_DESTINO').AsInteger  := QEmpresa.FieldByName('EMPRESA_ID').AsInteger;

      QRel.Prepare;
      QRel.Open;
    end
    else
    begin
      QRel.Sql.Clear;
      QRel.Sql.Add('SELECT TRANSITENS.PRODUTO_ID, PRODUTOS.DESCRICAO, PRODUTOS.QUANTIDADE_C, PRODUTOS.QUANTIDADE_G, TABELAS.DESCRICAO C_CUSTO, SUM(TRANSITENS.QUANTIDADE) QUANTIDADE, SUM(TRANSITENS.VR_TOTAL) VR_TOTAL');
      QRel.Sql.Add('FROM TRANSITENS');
      QRel.Sql.Add('INNER JOIN PRODUTOS');
      QRel.Sql.Add('ON (TRANSITENS.PRODUTO_ID = PRODUTOS.PRODUTO_ID)');
      QRel.Sql.Add('INNER JOIN TRANSACOES');
      QRel.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
      QRel.Sql.Add('INNER JOIN TABELAS');
      QRel.Sql.Add('ON (TRANSACOES.C_CUSTO_ID = TABELAS.TABELA_ID AND TABELAS.TIPO_TABELA = :TIPO_TABELA)');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :CONDUTA)');
      QRel.Sql.Add('AND (TRANSACOES.DEPTO = :DEPTO)');

      if CheckBox1.Checked = False then
      QRel.Sql.Add('AND (TRANSACOES.EMPRESAAUX_ID = :EMPRESA_DESTINO)');

      QRel.Sql.Add('GROUP BY TRANSITENS.PRODUTO_ID, PRODUTOS.DESCRICAO, PRODUTOS.QUANTIDADE_C, PRODUTOS.QUANTIDADE_G, TABELAS.DESCRICAO');
      QRel.Sql.Add('ORDER BY TABELAS.DESCRICAO, PRODUTOS.DESCRICAO');

      QRel.ParamByName('TIPO_TABELA').AsString  := '2';
      QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
      QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
      QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
      QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
      QRel.ParamByName('CONDUTA').AsString      := '20';
      QRel.ParamByName('DEPTO').AsString        := '07';

      if CheckBox1.Checked = False then
      QRel.ParamByName('EMPRESA_DESTINO').AsInteger  := QEmpresa.FieldByName('EMPRESA_ID').AsInteger;

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
          Transferencia_Analitico.PreviewModal
        else
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

procedure TFrmRel_Transf_Estoque.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRel_Transf_Estoque.CheckBox1Click(Sender: TObject);
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

procedure TFrmRel_Transf_Estoque.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmRel_Transf_Estoque.DtmenKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
   // Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmRel_Transf_Estoque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmRel_Transf_Estoque.FormCreate(Sender: TObject);
begin
  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);
end;

procedure TFrmRel_Transf_Estoque.FormShow(Sender: TObject);
begin
 QEmpresa.Open;

end;

procedure TFrmRel_Transf_Estoque.QRBand2BeforePrint(
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

procedure TFrmRel_Transf_Estoque.SumarizadoBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
if CheckBox1.Checked = False then
Begin
QRLabel38.Enabled := True;
QRLabel38.Caption  :='Empresa Destino: ' + QEmpresa.FieldByName('RAZAO').AsString;
End
Else
QRLabel38.Enabled := False;

end;

procedure TFrmRel_Transf_Estoque.Tipo_RelKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

end.
