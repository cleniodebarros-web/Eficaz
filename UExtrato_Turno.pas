unit UExtrato_Turno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, rxCurrEdit, Mask, rxToolEdit, Buttons, QuickRpt,
  QRCtrls, DBTables, DB, IBCustomDataSet, IBQuery, Grids, DBGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmExtrato_Turno = class(TForm)
    Bevel1: TBevel;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    DataTurno: TDataSource;
    DBGrid1: TDBGrid;
    Resumo: TQuickRep;
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
    QRLabel9: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRGroup1: TQRGroup;
    QRDBText1: TQRDBText;
    QRBand1: TQRBand;
    QRShape2: TQRShape;
    QRExpr1: TQRExpr;
    QRShape4: TQRShape;
    QRExpr2: TQRExpr;
    QRShape5: TQRShape;
    QRExpr3: TQRExpr;
    QTurno: TFDQuery;
    QRel: TFDQuery;
    Table_Temp: TFDMemTable;
    procedure btnRetornaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExecutaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmExtrato_Turno: TFrmExtrato_Turno;

implementation

uses
  UPrincipal, UData;

{$R *.dfm}

procedure TFrmExtrato_Turno.btnExecutaClick(Sender: TObject);
var
Sub_Tit, Temp_Name: String;
begin
// 229, 428
  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    try
      with Table_Temp do
      begin

        Temp_Name    := Copy(TimeToStr(time), 1, 2) + Copy(TimeToStr(time), 4, 2) + Copy(TimeToStr(time), 7, 2);


        with FieldDefs do
        begin
          Clear;
          Add('ID', ftAutoInc, 0, False);
          Add('CONDUTA', ftString, 40, False);
          Add('DT_TRANS', ftDate, 0, False);
          Add('NUM_DOC', ftString, 7, False);
          Add('HISTORICO', ftString, 40, False);
          Add('ACRESCIMO', ftFloat, 0, False);
          Add('DESCONTO', ftFloat, 0, False);
          Add('VALOR', ftFloat, 0, False);
        end;

        with IndexDefs do
        begin
          Clear;
          Add('', 'ID', [ixPrimary, ixUnique]);
          Add('TEMP', 'CONDUTA', [ixCaseInsensitive, ixDescending]);
        end;


        Open;
      end;
    except
     Application.MessageBox('Ocorreu um erro ao criar um arquivo temporário', PChar(Msg_Title), mb_IconStop);
     exit;
    end;

    if QTurno.FieldByName('SALDO_INICIAL').AsFloat > 0 then
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('CONDUTA').AsString   := '*** Saldo Inicial ***';
      Table_Temp.FieldByName('DT_TRANS').AsString  := QTurno.FieldByName('DT_INICIAL').AsString;
      Table_Temp.FieldByName('NUM_DOC').AsString   := '';
      Table_Temp.FieldByName('HISTORICO').AsString := 'Saldo Inicial';
      Table_Temp.FieldByName('ACRESCIMO').AsFloat  := 0;
      Table_Temp.FieldByName('DESCONTO').AsFloat   := 0;
      Table_Temp.FieldByName('VALOR').AsFloat      := QTurno.FieldByName('SALDO_INICIAL').AsFloat;
      Table_Temp.Post;
    end;

    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT * FROM TRANSACOES');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
    QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');

    if QTurno.FieldByName('STATUS').AsString = 'F' then
    begin
      QRel.Sql.Add('AND (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('AND (TRANSACOES.HORA BETWEEN :HR_INICIAL AND :HR_FINAL)');
    end
    else
    begin
      QRel.Sql.Add('AND (TRANSACOES.DT_TRANS = :DT_INICIAL)');
      QRel.Sql.Add('AND (TRANSACOES.HORA > :HR_INICIAL)');
    end;

      QRel.Sql.Add('AND (TRANSACOES.OPERADOR = :OPERADOR)');
      QRel.Sql.Add('AND (TRANSACOES.BANCO_ID = :BANCO_ID)');
      QRel.Sql.Add('ORDER BY COND_PAGTO, DT_TRANS');

    QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    QRel.ParamByName('DT_INICIAL').AsDateTime := QTurno.FieldByName('DT_INICIAL').AsDateTime;
    QRel.ParamByName('HR_INICIAL').AsString   := QTurno.FieldByName('HORA_INICIAL').AsString;

    if QTurno.FieldByName('STATUS').AsString = 'F' then
    begin
      QRel.ParamByName('DT_FINAL').AsDateTime := QTurno.FieldByName('DT_FINAL').AsDateTime;
      QRel.ParamByName('HR_INICIAL').AsString := QTurno.FieldByName('HORA_INICIAL').AsString;
      QRel.ParamByName('HR_FINAL').AsString   := QTurno.FieldByName('HORA_FINAL').AsString;
    end;

      QRel.ParamByName('OPERADOR').AsString  := QTurno.FieldByName('OPERADOR').AsString;
      QRel.ParamByName('BANCO_ID').AsInteger := QTurno.FieldByName('CAIXA_ID').AsInteger;

    QRel.Prepare;
    QRel.Open;

    QRel.First;
    while not QRel.Eof do

    begin


      if (QRel.FieldByName('CONDUTA').AsString = '01') and (QRel.FieldByName('DEPTO').AsString = '07') and (QRel.FieldByName('COND_PAGTO').AsString = 'A VISTA') then
        Sub_Tit := '*** Venda a Vista ***';

      if (QRel.FieldByName('CONDUTA').AsString = '01') and (QRel.FieldByName('DEPTO').AsString <> '07') and (QRel.FieldByName('COND_PAGTO').AsString = 'A VISTA') then
        Sub_Tit := '*** Receita a Vista ***';

      if (QRel.FieldByName('CONDUTA').AsString = '02') and (QRel.FieldByName('DEPTO').AsString = '07') and (QRel.FieldByName('COND_PAGTO').AsString = 'A VISTA') then
        Sub_Tit := '*** Compra a Vista ***';

      if (QRel.FieldByName('CONDUTA').AsString = '02') and (QRel.FieldByName('DEPTO').AsString <> '07') and (QRel.FieldByName('COND_PAGTO').AsString = 'A VISTA') then
        Sub_Tit := '*** Despesa a Vista ***';

      if (QRel.FieldByName('CONDUTA').AsString = '01') and (QRel.FieldByName('DEPTO').AsString = '07') and (QRel.FieldByName('COND_PAGTO').AsString = 'A PRAZO') then
        Sub_Tit := '*** Venda a Prazo ***';

      if (QRel.FieldByName('CONDUTA').AsString = '01') and (QRel.FieldByName('DEPTO').AsString <> '07') and (QRel.FieldByName('COND_PAGTO').AsString = 'A PRAZO') then
        Sub_Tit := '*** Receita a Prazo ***';

      if (QRel.FieldByName('CONDUTA').AsString = '02') and (QRel.FieldByName('DEPTO').AsString = '07') and (QRel.FieldByName('COND_PAGTO').AsString = 'A PRAZO') then
        Sub_Tit := '*** Compra a Prazo ***';

      if (QRel.FieldByName('CONDUTA').AsString = '02') and (QRel.FieldByName('DEPTO').AsString <> '07') and (QRel.FieldByName('COND_PAGTO').AsString = 'A PRAZO') then
        Sub_Tit := '*** Despesa a Prazo ***';

      if (QRel.FieldByName('CONDUTA').AsString = '02') and (QRel.FieldByName('DEPTO').AsString = '04') then
        Sub_Tit := '*** Transf. Entre Contas ***';

      if (QRel.FieldByName('CONDUTA').AsString = '07') then
        Sub_Tit := '*** Recebimento de Contas ***';

      if (QRel.FieldByName('CONDUTA').AsString = '08') then
        Sub_Tit := '*** Pagamento de Contas ***';

      if QRel.FieldByName('CONDUTA').AsString = '17' then
        Sub_Tit := '*** Consumo de Estoque ***';

      if QRel.FieldByName('CONDUTA').AsString = '18' then
        Sub_Tit := '*** Dev. de Consumo de Estoque ***';

      Table_Temp.Append;
      Table_Temp.FieldByName('CONDUTA').AsString   := Sub_Tit;
      Table_Temp.FieldByName('DT_TRANS').AsString  := QRel.FieldByName('DT_TRANS').AsString;
      Table_Temp.FieldByName('NUM_DOC').AsString   := QRel.FieldByName('NUM_DOC').AsString;
      Table_Temp.FieldByName('HISTORICO').AsString := QRel.FieldByName('HISTORICO').AsString;
      Table_Temp.FieldByName('ACRESCIMO').AsFloat  := QRel.FieldByName('VR_ACRESCIMO').AsFloat;
      Table_Temp.FieldByName('DESCONTO').AsFloat   := QRel.FieldByName('VR_DESCONTO').AsFloat;
      Table_Temp.FieldByName('VALOR').AsFloat      := QRel.FieldByName('VALOR').AsFloat;
      Table_Temp.Post;

      Application.ProcessMessages;
      QRel.Next;
    end;

    QRLabel1.Caption := 'Turno: ' + QTurno.FieldByName('DT_INICIAL').AsString + ' - ' +
                                    QTurno.FieldByName('HORA_INICIAL').AsString + ' a ' +
                                    QTurno.FieldByName('DT_FINAL').AsString + ' - ' +
                                    QTurno.FieldByName('HORA_FINAL').AsString + ' (' +
                                    QTurno.FieldByName('OPERADOR').AsString + ')';

    if Table_Temp.IsEmpty then
      Application.MessageBox('Não há dados para os parâmetros informados', PChar(Msg_Title), mb_IconInformation)
    else
      Resumo.PreviewModal;

  finally
    Table_Temp.Close;


    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;

procedure TFrmExtrato_Turno.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmExtrato_Turno.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmExtrato_Turno.FormCreate(Sender: TObject);
begin
  DBGrid1.Columns[0].Width := 64;
  DBGrid1.Columns[1].Width := 52;
  DBGrid1.Columns[2].Width := 64;
  DBGrid1.Columns[3].Width := 52;
  DBGrid1.Columns[4].Width := 124;
  DBGrid1.Columns[5].Width := 35;

  QTurno.Open;
  QTurno.Last;
end;

end.
