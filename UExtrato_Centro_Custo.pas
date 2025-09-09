unit UExtrato_Centro_Custo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, rxCurrEdit, Mask, rxToolEdit, Buttons, DBTables,
  DB, IBCustomDataSet, IBQuery, QuickRpt, QRCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmExtrato_Centro_Custo = class(TForm)
    Label1: TLabel;
    Dtmen: TDateEdit;
    Dtmai: TDateEdit;
    Label2: TLabel;
    Centro_Custo: TCurrencyEdit;
    Bevel1: TBevel;
    btnCentro_Custo: TSpeedButton;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    DataConta: TDataSource;
    Fluxo: TQuickRep;
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
    QRLabel6: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText4: TQRDBText;
    SummaryBand1: TQRBand;
    QRShape4: TQRShape;
    QRExpr2: TQRExpr;
    QRGroup1: TQRGroup;
    QRDBText1: TQRDBText;
    QRBand1: TQRBand;
    QRShape2: TQRShape;
    QRExpr1: TQRExpr;
    QRGroup2: TQRGroup;
    QRDBText6: TQRDBText;
    QRel: TFDQuery;
    QConta: TFDQuery;
    Table_Temp: TFDMemTable;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    procedure btnRetornaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnCentro_CustoClick(Sender: TObject);
    procedure Centro_CustoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnExecutaClick(Sender: TObject);
    procedure Centro_CustoChange(Sender: TObject);
    procedure DtmenEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SearchConta;
  end;

var
  FrmExtrato_Centro_Custo: TFrmExtrato_Centro_Custo;

implementation

uses
  UConsulta, UPrincipal, UData;

{$R *.dfm}

procedure TFrmExtrato_Centro_Custo.SearchConta;
begin
  QConta.Close;
  QConta.ParamByName('TABELA_ID').AsInteger := StrToInt(Centro_Custo.Text);
  QConta.Prepare;
  QConta.Open;
end;

procedure TFrmExtrato_Centro_Custo.btnCentro_CustoClick(Sender: TObject);
begin
  try
    Centro_Custo.Value := GetConsulta('CCUSTO', 0, 0, StrToInt(Centro_Custo.Text));
  except
    Centro_Custo.Value := GetConsulta('CCUSTO', 0, 0, 0);
  end;
end;

procedure TFrmExtrato_Centro_Custo.btnExecutaClick(Sender: TObject);
var
Temp_Name: String;
begin
// 125, 327
  try
    try
      with Table_Temp do
      begin

        Temp_Name    := Copy(TimeToStr(time), 1, 2) + Copy(TimeToStr(time), 4, 2) + Copy(TimeToStr(time), 7, 2);


        with FieldDefs do
        begin
          Clear;
          Add('ID', ftAutoInc, 0, False);
          Add('C_CUSTO', ftString, 20, False);
          Add('CONTA', ftString, 20, False);
          Add('DESCRICAO', ftString, 40, False);
          Add('DT_TRANS', ftDate, 0, False);
          Add('HISTORICO', ftString, 50, False);
          Add('VALOR', ftFloat, 0, False);
        end;

        with IndexDefs do
        begin
          Clear;
          Add('', 'ID', [ixPrimary, ixUnique]);
          Add('TEMP', 'C_CUSTO;CONTA;DT_TRANS', [ixCaseInsensitive]);
        end;


        IndexName := 'TEMP';
        Open;
      end;
    except
     Application.MessageBox('Ocorreu um erro ao criar um arquivo temporário', PChar(Msg_Title), mb_IconStop);
     exit;
    end;

    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT TABELAS.DESCRICAO C_CUSTO, PLANO.CODIGO, PLANO.DESCRICAO, RAZAO.DT_TRANS, RAZAO.VALOR, RAZAO.HISTORICO');
    QRel.Sql.Add('FROM RAZAO');
    QRel.Sql.Add('INNER JOIN PLANO');
    QRel.Sql.Add('ON (RAZAO.CONTA_CR = PLANO.CODIGO)');
    QRel.Sql.Add('INNER JOIN TABELAS');
    QRel.Sql.Add('ON ((RAZAO.C_CUSTO_ID = TABELAS.TABELA_ID) AND (TABELAS.TIPO_TABELA = :TIPO_TABELA))');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(RAZAO.EMPRESA_ID = :EMPRESA_ID)');
    QRel.Sql.Add('AND (RAZAO.TPCTB <= :TPCTB)');
    QRel.Sql.Add('AND (RAZAO.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
    QRel.Sql.Add('AND (PLANO.CHAVE LIKE :CHAVE)');

    if Centro_Custo.Value > 0 then
    begin
      QRel.Sql.Add('AND (RAZAO.C_CUSTO_ID = :C_CUSTO)');
      QRel.ParamByName('C_CUSTO').AsInteger := QConta.FieldByName('TABELA_ID').AsInteger;
    end
    else
      QRel.Sql.Add('AND (RAZAO.C_CUSTO_ID > 0)');

    QRel.ParamByName('TIPO_TABELA').AsString  := '2';
    QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
    QRel.ParamByName('CHAVE').AsString        := 'A%';

    QRel.Prepare;
    QRel.Open;

    QRel.First;
    while not QRel.Eof do
    begin
      Table_Temp.Append;

      Table_Temp.FieldByName('C_CUSTO').AsString    := QRel.FieldByName('C_CUSTO').AsString;
      Table_Temp.FieldByName('CONTA').AsString      := QRel.FieldByName('CODIGO').AsString;
      Table_Temp.FieldByName('DESCRICAO').AsString  := QRel.FieldByName('DESCRICAO').AsString;
      Table_Temp.FieldByName('DT_TRANS').AsDateTime := QRel.FieldByName('DT_TRANS').AsDateTime;
      Table_Temp.FieldByName('HISTORICO').AsString  := QRel.FieldByName('HISTORICO').AsString;
      Table_Temp.FieldByName('VALOR').AsFloat       := QRel.FieldByName('VALOR').AsFloat;
      Table_Temp.Post;

      Application.ProcessMessages;
      QRel.Next;
    end;

    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT TABELAS.DESCRICAO C_CUSTO, PLANO.CODIGO, PLANO.DESCRICAO, RAZAO.DT_TRANS, RAZAO.VALOR, RAZAO.HISTORICO');
    QRel.Sql.Add('FROM RAZAO');
    QRel.Sql.Add('INNER JOIN PLANO');
    QRel.Sql.Add('ON (RAZAO.CONTA_DB = PLANO.CODIGO)');
    QRel.Sql.Add('INNER JOIN TABELAS');
    QRel.Sql.Add('ON ((RAZAO.C_CUSTO_ID = TABELAS.TABELA_ID) AND (TABELAS.TIPO_TABELA = :TIPO_TABELA))');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(EMPRESA_ID = :EMPRESA_ID)');
    QRel.Sql.Add('AND (TPCTB <= :TPCTB)');
    QRel.Sql.Add('AND (DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
    QRel.Sql.Add('AND (PLANO.CHAVE LIKE :CHAVE)');

    if Centro_Custo.Value > 0 then
    begin
      QRel.Sql.Add('AND (RAZAO.C_CUSTO_ID = :C_CUSTO)');
      QRel.ParamByName('C_CUSTO').AsInteger := QConta.FieldByName('TABELA_ID').AsInteger;
    end
    else
      QRel.Sql.Add('AND (RAZAO.C_CUSTO_ID > 0)');

    QRel.ParamByName('TIPO_TABELA').AsString  := '2';
    QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
    QRel.ParamByName('CHAVE').AsString        := 'A%';

    QRel.Prepare;
    QRel.Open;

    QRel.First;
    while not QRel.Eof do
    begin
      Table_Temp.Append;

      Table_Temp.FieldByName('C_CUSTO').AsString    := QRel.FieldByName('C_CUSTO').AsString;
      Table_Temp.FieldByName('CONTA').AsString      := QRel.FieldByName('CODIGO').AsString;
      Table_Temp.FieldByName('DESCRICAO').AsString  := QRel.FieldByName('DESCRICAO').AsString;
      Table_Temp.FieldByName('DT_TRANS').AsDateTime := QRel.FieldByName('DT_TRANS').AsDateTime;
      Table_Temp.FieldByName('HISTORICO').AsString  := QRel.FieldByName('HISTORICO').AsString;
      Table_Temp.FieldByName('VALOR').AsFloat       := (QRel.FieldByName('VALOR').AsFloat * -1);
      Table_Temp.Post;

      Application.ProcessMessages;
      QRel.Next;
    end;

    QRLabel1.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;

    if Table_Temp.IsEmpty then
      Application.MessageBox('Não há dados para os parâmetros informados', PChar(Msg_Title), mb_IconInformation)
    else
      Fluxo.PreviewModal;

  finally
    Table_Temp.Close;
  end;
end;

procedure TFrmExtrato_Centro_Custo.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmExtrato_Centro_Custo.Centro_CustoChange(Sender: TObject);
begin
  if Centro_Custo.Value > 0 then
    SearchConta;
end;

procedure TFrmExtrato_Centro_Custo.Centro_CustoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = Centro_Custo) then
    btnCentro_CustoClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmExtrato_Centro_Custo.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmExtrato_Centro_Custo.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
  //  Perform(Wm_NextDlgctl, 0, 0);
    
  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmExtrato_Centro_Custo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmExtrato_Centro_Custo.FormCreate(Sender: TObject);
begin
  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);
end;

end.
