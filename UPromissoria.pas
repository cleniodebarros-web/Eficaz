unit UPromissoria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, RxToolEdit, QRCtrls, QuickRpt,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, RxCurrEdit,
  Vcl.Imaging.pngimage, Soap.SOAPHTTPTrans,DateUtils;

type
  TFrmPromissoria = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    BtnImprimir: TBitBtn;
    GroupBox6: TGroupBox;
    Label5: TLabel;
    Cliente: TCurrencyEdit;
    btnCliente: TSpeedButton;
    DBText2: TDBText;
    DBGrid1: TDBGrid;
    Label9: TLabel;
    Label10: TLabel;
    Label2: TLabel;
    Dtmen: TDateEdit;
    Dtmai: TDateEdit;
    Qrel: TFDQuery;
    QBanco: TFDQuery;
    QCliente: TFDQuery;
    DataCliente: TDataSource;
    DataTabela: TDataSource;
    IQuery: TFDQuery;
    DBText1: TDBText;
    DBText3: TDBText;
    DataEmpresa: TDataSource;
    PromissoriaRep: TQuickRep;
    TitleBand1: TQRBand;
    QRImage3: TQRImage;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    BitBtn1: TBitBtn;
    DataSource1: TDataSource;
    Label1: TLabel;
    TRANSACAO_ID: TDBLookupComboBox;
    DBText4: TDBText;
    QSearch: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure ClienteExit(Sender: TObject);
    procedure btnClienteClick(Sender: TObject);
    procedure IQueryAfterOpen(DataSet: TDataSet);
    procedure BtnImprimirClick(Sender: TObject);
    procedure TitleBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QSearchAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DetailSearch(Tabela: String);
  end;

var
  FrmPromissoria: TFrmPromissoria;
  data_extenso: string;

implementation
uses UPrincipal,Udata,UConsulta;



{$R *.dfm}

procedure TFrmPromissoria.DetailSearch(Tabela: String);
begin
  if ((Tabela = '') or (Tabela = 'Cliente')) and (Cliente.Text <> '') then
  begin
    QCliente.Close;
    QCliente.ParamByName('CLIENTE_ID').AsInteger := StrToInt(Cliente.Text);
    QCliente.Prepare;
    QCliente.Open;
  end;
end;


procedure TFrmPromissoria.BtnImprimirClick(Sender: TObject);
begin
//IQuery.First;
//PromissoriaRep.Prepare;
  Iquery.Close;
  Iquery.SQL.Clear;
  IQuery.SQL.Add('SELECT TRANSPARCELAS.DT_VENCIMENTO, TRANSACOES.NUM_DOC, TRANSACOES.COND_PAGTO,TRANSACOES.DT_TRANS,TRANSPARCELAS.VALOR FROM TRANSACOES');
  IQuery.SQL.Add('INNER JOIN CLIENTES');
  IQuery.SQL.Add('ON (TRANSACOES.CLIENTE_ID = CLIENTES.CLIENTE_ID)');
  IQuery.SQL.Add('INNER JOIN TRANSPARCELAS');
  IQuery.SQL.Add('ON (TRANSACOES.TRANSACAO_ID = TRANSPARCELAS.TRANSACAO_ID)');
  IQuery.SQL.Add('WHERE');
  IQuery.SQL.Add('(TRANSACOES.TRANSACAO_ID  =:TRANSACAO_ID)');

  Iquery.ParamByName('TRANSACAO_ID').AsInteger      := QSearch.FieldByName('TRANSACAO_ID').AsInteger;

  Iquery.Prepare;
  Iquery.Open;

 PromissoriaRep.Prepare;
 PromissoriaRep.PreviewModal;
end;

procedure TFrmPromissoria.BitBtn1Click(Sender: TObject);
begin
 Close;
end;

procedure TFrmPromissoria.btnClienteClick(Sender: TObject);
begin
  try
    Cliente.Value := GetConsulta('CLIENTES', 0, 0, StrToInt(Cliente.Text));
  except
    Cliente.Value := GetConsulta('CLIENTES', 0, 0, 0);
  end;
  ClienteExit(self);
end;

procedure TFrmPromissoria.ClienteExit(Sender: TObject);
begin
 DetailSearch('Cliente');

      if(StrToInt(Cliente.text) > 0) then
      begin
          QSearch.Close;
          QSearch.SQL.Clear;
          QSearch.SQL.Add('SELECT TRANSACOES.TRANSACAO_ID ,TRANSACOES.VALOR VALOR_TOTAL,TRANSPARCELAS.PARCELA_ID, ');
          QSearch.SQL.Add('TRANSPARCELAS.DT_VENCIMENTO, TRANSACOES.NUM_DOC, TRANSACOES.COND_PAGTO,TRANSACOES.DT_TRANS,TRANSPARCELAS.VALOR FROM TRANSACOES');
          QSearch.SQL.Add('INNER JOIN CLIENTES');
          QSearch.SQL.Add('ON (TRANSACOES.CLIENTE_ID = CLIENTES.CLIENTE_ID)');
          QSearch.SQL.Add('INNER JOIN TRANSPARCELAS');
          QSearch.SQL.Add('ON (TRANSACOES.TRANSACAO_ID = TRANSPARCELAS.TRANSACAO_ID)');
          QSearch.SQL.Add('WHERE');
          QSearch.SQL.Add('(TRANSACOES.EMPRESA_ID  =:EMPRESA_ID)');
          QSearch.SQL.Add('AND (TRANSACOES.CONDUTA = :CONDUTA) AND (TRANSACOES.DEPTO = :DEPTO OR DEPTO = :DEPTO_DOIS)');
          QSearch.SQL.Add('AND (TRANSACOES.COND_PAGTO = :COND_PAGTO)');
          QSearch.SQL.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
          QSearch.SQL.Add('AND (TRANSACOES.CLIENTE_ID = :CLIENTE_ID)');
          QSearch.SQL.Add('AND (TRANSPARCELAS.DT_VENCIMENTO BETWEEN :DT_INICIAL AND :DT_FINAL)');
          QSearch.Sql.Add('AND (TRANSPARCELAS.VALOR > 0)');
          QSearch.Sql.Add('AND (TRANSPARCELAS.BANCO_ID = 0)');
          QSearch.SQL.Add('ORDER BY TRANSPARCELAS.DT_VENCIMENTO');

          QSearch.ParamByName('EMPRESA_ID').AsInteger      := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
          QSearch.ParamByName('CONDUTA').AsString          := '01';
          QSearch.ParamByName('COND_PAGTO').AsString       := 'A PRAZO';
          QSearch.ParamByName('TPCTB').AsString            := FrmData.QAcesso.FieldByName('TPCTB').AsString;
          QSearch.ParamByName('CLIENTE_ID').AsInteger      := StrToInt(Cliente.text);
          QSearch.ParamByName('DEPTO').AsString            := '07';
          QSearch.ParamByName('DEPTO_DOIS').AsString       := '03';
          QSearch.ParamByName('DT_INICIAL').AsDateTime     := Dtmen.Date;
          QSearch.ParamByName('DT_FINAL').AsDateTime       := Dtmai.Date;

          QSearch.Prepare;
          QSearch.Open;

          TRANSACAO_ID.KeyValue := 1;


          if not  QSearch.IsEmpty then
          BtnImprimir.Enabled := True
          Else
          BtnImprimir.Enabled := False;

      end;


end;

procedure TFrmPromissoria.ClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);
  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmPromissoria.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action := caFree;
end;

procedure TFrmPromissoria.FormCreate(Sender: TObject);
begin
 Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
 Dtmai.Date := Ult_Dia_Mes(date);
end;

procedure TFrmPromissoria.QSearchAfterOpen(DataSet: TDataSet);
begin
 TFloatField(QSearch.FieldByName('VALOR')).DisplayFormat  := '#,##0.00';
 TFloatField(QSearch.FieldByName('VALOR_TOTAL')).DisplayFormat  := '#,##0.00';
end;

procedure TFrmPromissoria.IQueryAfterOpen(DataSet: TDataSet);
begin
TFloatField(IQuery.FieldByName('VALOR')).DisplayFormat  := '#,##0.00';

end;

procedure TFrmPromissoria.TitleBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var
  Cidade,Vencimento:string;

begin
 Cidade     := FrmPrincipal.QEmpresa.FieldByName('MUNICIPIO').AsString;
 Vencimento := DateToStr(IQuery.FieldByName('DT_VENCIMENTO').AsDateTime);
 QRLabel8.Caption := '';
 QRLabel3.Caption := '';
 QRLabel2.Caption := '';
 QRLabel4.Caption := '';
 QRLabel5.Caption := '';
 QRLabel6.Caption := '';
 QRLabel7.Caption := '';

 QRLabel3.Caption := NomeMes(StrToInt(Copy(DateToStr(IQuery.FieldByName('DT_VENCIMENTO').AsDateTime),4,2)));
 QRLabel2.Caption := Copy(Extenso(IQuery.FieldByName('VALOR').AsFloat),1,55);

 if Length(Extenso(IQuery.FieldByName('VALOR').AsFloat)) > 55 then
 begin
   QRLabel8.Caption := Copy(Extenso(IQuery.FieldByName('VALOR').AsFloat),55,100);
 end;

 QRLabel4.Caption := Copy(DateToStr(IQuery.FieldByName('DT_VENCIMENTO').AsDateTime),1,2);
 QRLabel5.Caption := Copy(DateToStr(IQuery.FieldByName('DT_VENCIMENTO').AsDateTime),7,4);
 QRLabel6.Caption := DateToStr(date);
 QRLabel7.Caption := DataPorExtenso(Cidade,StrToDate(Vencimento));

 end;

end.
