unit URel_Movimento_Pro_Soft;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, rxCurrEdit, rxToolEdit, Buttons, DBCtrls,
  DB, IBCustomDataSet, IBQuery, QuickRpt, QRCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Math, QRExport;

type
  TFrmRel_Movimento_Pro_Soft = class(TForm)
    Label1: TLabel;
    Bevel1: TBevel;
    Dtmen: TDateEdit;
    Dtmai: TDateEdit;
    Movimento_Sintetico: TQuickRep;
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
    SummaryBand1: TQRBand;
    QRLabel10: TQRLabel;
    QRShape4: TQRShape;
    QRLabel7: TQRLabel;
    QRExpr2: TQRExpr;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    QRLabel2: TQRLabel;
    QRSysData3: TQRSysData;
    DBText1: TDBText;
    btnFornecedor: TSpeedButton;
    Fornecedor: TCurrencyEdit;
    Label2: TLabel;
    QRel: TFDQuery;
    Label6: TLabel;
    Tipo_Entrada: TComboBox;
    QRDBText1: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QFornecedor: TFDQuery;
    chkExportarExcel: TCheckBox;
    procedure btnRetornaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnExecutaClick(Sender: TObject);
    procedure DtmenEnter(Sender: TObject);
    procedure btnFornecedorClick(Sender: TObject);
    procedure FornecedorChange(Sender: TObject);
    procedure FornecedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SearchFornecedor;
  end;

var
  FrmRel_Movimento_Pro_Soft: TFrmRel_Movimento_Pro_Soft;

implementation

uses
  UData, UPrincipal, UConsulta;

{$R *.dfm}

procedure TFrmRel_Movimento_Pro_Soft.SearchFornecedor;
begin
  try
    QFornecedor.Sql.Clear;
    QFornecedor.Sql.Add('SELECT * FROM FORNECEDORES');
    QFornecedor.Sql.Add('WHERE');
    QFornecedor.Sql.Add('(FORNECEDOR_ID = :FORNECEDOR_ID)');
    QFornecedor.Sql.Add('AND (STATUS = :STATUS)');

    QFornecedor.ParamByName('FORNECEDOR_ID').AsInteger := StrToInt(Fornecedor.Text);
    QFornecedor.ParamByName('STATUS').AsString         := 'A';

    QFornecedor.Prepare;
    QFornecedor.Open;
  except

  end;
end;

procedure TFrmRel_Movimento_Pro_Soft.btnExecutaClick(Sender: TObject);
begin
// 203, 325
  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT TRANSACOES.*,');
    QRel.Sql.Add('CASE');
    QRel.Sql.Add('WHEN (TRANSACOES.CONDUTA = :CONDUTA_01 AND TRANSACOES.DEPTO = :DEPTO_07) THEN ''VENDA''');
    QRel.Sql.Add('WHEN (TRANSACOES.CONDUTA = :CONDUTA_02 AND TRANSACOES.DEPTO = :DEPTO_07) THEN ''COMPRA''');
    QRel.Sql.Add('WHEN (TRANSACOES.CONDUTA = :CONDUTA_01 AND TRANSACOES.DEPTO = :DEPTO_10) THEN ''DEVOLUÇÃO DE COMPRA''');
    QRel.Sql.Add('WHEN (TRANSACOES.CONDUTA = :CONDUTA_02 AND TRANSACOES.DEPTO = :DEPTO_10) THEN ''DEVOLUÇÃO DE VENDA''');
    QRel.Sql.Add('WHEN (TRANSACOES.CONDUTA = :CONDUTA_17 AND TRANSACOES.DEPTO = :DEPTO_07) THEN ''CONSUMO DE ESTOQUE''');
    QRel.Sql.Add('WHEN (TRANSACOES.CONDUTA = :CONDUTA_18 AND TRANSACOES.DEPTO = :DEPTO_07) THEN ''DEVOLUÇÃO DE CONSUMO''');
    QRel.Sql.Add('WHEN (TRANSACOES.CONDUTA = :CONDUTA_19 AND TRANSACOES.DEPTO = :DEPTO_07) THEN ''ENTRADA DE PRODUTO ACABADO''');
    QRel.Sql.Add('WHEN (TRANSACOES.CONDUTA = :CONDUTA_21 AND TRANSACOES.DEPTO = :DEPTO_07) THEN ''SAIDA DE PRODUTO ACABADO-DESMANCHE''');
    QRel.Sql.Add('WHEN (TRANSACOES.CONDUTA = :CONDUTA_20 AND TRANSACOES.DEPTO = :DEPTO_07) THEN ''TRANSFERÊNCIA''');
    QRel.Sql.Add('WHEN (TRANSACOES.CONDUTA = :CONDUTA_01 AND TRANSACOES.DEPTO = :DEPTO_03) THEN ''RECEITA''');
    QRel.Sql.Add('WHEN (TRANSACOES.CONDUTA = :CONDUTA_02 AND TRANSACOES.DEPTO = :DEPTO_02) THEN ''DESPESA''');
    QRel.Sql.Add('WHEN (TRANSACOES.CONDUTA = :CONDUTA_07) THEN ''RECEBIMENTO DE CONTA''');
    QRel.Sql.Add('WHEN (TRANSACOES.CONDUTA = :CONDUTA_08) THEN ''PAGAMENTO DE CONTA''');

    QRel.Sql.Add('ELSE ''DESCONHECIDO'' END OPERACAO');
    QRel.Sql.Add('FROM TRANSACOES');

    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(TRANSACOES.DT_ENT_SAI BETWEEN :DT_INICIAL AND :DT_FINAL)');
    QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
    QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
    QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
    QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');
    QRel.Sql.Add('ORDER BY TRANSACAO_ID');

    QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
    QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    QRel.ParamByName('CONDUTA_01').AsString   := '01';
    QRel.ParamByName('CONDUTA_02').AsString   := '02';
    QRel.ParamByName('CONDUTA_07').AsString   := '07';
    QRel.ParamByName('CONDUTA_08').AsString   := '08';
    QRel.ParamByName('CONDUTA_17').AsString   := '17';
    QRel.ParamByName('CONDUTA_18').AsString   := '18';
    QRel.ParamByName('CONDUTA_19').AsString   := '19';
    QRel.ParamByName('CONDUTA_20').AsString   := '20';
    QRel.ParamByName('CONDUTA_21').AsString   := '21';
    QRel.ParamByName('DEPTO_02').AsString   := '02';
    QRel.ParamByName('DEPTO_03').AsString   := '03';
    QRel.ParamByName('DEPTO_07').AsString   := '07';
    QRel.ParamByName('DEPTO_10').AsString   := '10';


    QRel.Prepare;
    QRel.Open;

    QRLabel1.Caption  := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;

    if QRel.IsEmpty then
      Application.MessageBox('Não há dados para os parâmetros informados', PChar(Msg_Title), mb_IconInformation)
    else
    begin
      Movimento_Sintetico.Prepare;
      Movimento_Sintetico.PreviewModal;

      if chkExportarExcel.Checked Then
      Begin
        //Movimento_Sintetico.ExportToFilter(TQRXLSFilter.Create(ExtractFilePath(ParamStr(0)) + 'Exportados\Movimento_Pro_Soft_' + Copy(Dtmen.Text,1,2) + Copy(Dtmen.Text,4,2) + Copy(Dtmen.Text,7,4)  + '.xls'));
        Movimento_Sintetico.ExportToFilter(TQRXLSFilter.Create(ExtractFilePath(ParamStr(0)) + 'Exportados\Movimento_Pro_Soft_' + Copy(Dtmen.Text,1,2) + '_' + Copy(Dtmen.Text,4,2) + '_' + Copy(Dtmen.Text,7,4) + '-' + Copy(Dtmai.Text,1,2) + '_' + Copy(Dtmai.Text,4,2) + '_' + Copy(Dtmai.Text,7,4) + '.xls'));
        Application.MessageBox(PChar('Arquivo exportado para : ' + ExtractFilePath(ParamStr(0)) + 'Exportados\Movimento_Pro_Soft_' + Copy(Dtmen.Text,1,2) + '_' + Copy(Dtmen.Text,4,2) + '_' + Copy(Dtmen.Text,7,4) + '-' + Copy(Dtmai.Text,1,2) + '_' + Copy(Dtmai.Text,4,2) + '_' + Copy(Dtmai.Text,7,4) + '.xls') , PChar(Msg_Title), mb_IconInformation);
      End;


    end;
  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;

procedure TFrmRel_Movimento_Pro_Soft.btnFornecedorClick(Sender: TObject);
begin
  try
    Fornecedor.Value := GetConsulta('FORNECEDORES', 0, 0, StrToInt(Fornecedor.Text));
  except
    Fornecedor.Value := GetConsulta('FORNECEDORES', 0, 0, 0);
  end;
end;

procedure TFrmRel_Movimento_Pro_Soft.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRel_Movimento_Pro_Soft.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  //QRLabel11.Caption := FormatFloat('#,##0.00', QRel.FieldByName('VALOR_VENDA').AsFloat);
end;




procedure TFrmRel_Movimento_Pro_Soft.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmRel_Movimento_Pro_Soft.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    //Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmRel_Movimento_Pro_Soft.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmRel_Movimento_Pro_Soft.FormCreate(Sender: TObject);
begin
  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);
end;

procedure TFrmRel_Movimento_Pro_Soft.FornecedorChange(Sender: TObject);
begin
  SearchFornecedor;
end;

procedure TFrmRel_Movimento_Pro_Soft.FornecedorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = Fornecedor) then
    btnFornecedorClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

end.
