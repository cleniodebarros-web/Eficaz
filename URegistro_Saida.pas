unit URegistro_Saida;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, StdCtrls, Mask, rxToolEdit, DBTables,
  DB, IBCustomDataSet, IBQuery, Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrmRegistro_Saida = class(TForm)
    Label1: TLabel;
    Dtmen: TDateEdit;
    Dtmai: TDateEdit;
    Bevel1: TBevel;
    Registro_Entrada: TQuickRep;
    QRBand2: TQRBand;
    QRBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRSysData1: TQRSysData;
    QRLabel25: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel26: TQRLabel;
    QRShape2: TQRShape;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRBand3: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    btnExecuta: TBitBtn;
    btnRetorna: TBitBtn;
    QRLabel31: TQRLabel;
    QRDBText19: TQRDBText;
    QRExpr4: TQRExpr;
    Chk_Sintetico: TCheckBox;
    Registro_Entrada_Sintetico: TQuickRep;
    QRBand4: TQRBand;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText31: TQRDBText;
    QRLabel54: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRShape3: TQRShape;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRBand5: TQRBand;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    QRSysData2: TQRSysData;
    QRLabel38: TQRLabel;
    QRLabel42: TQRLabel;
    QRShape4: TQRShape;
    QRel: TFDQuery;
    QItens: TFDQuery;
    Table_Temp: TFDMemTable;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRetornaClick(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DtmenEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRegistro_Saida: TFrmRegistro_Saida;

implementation

uses
  UPrincipal, UData;

{$R *.dfm}

procedure TFrmRegistro_Saida.btnExecutaClick(Sender: TObject);
var
Temp_Name: String;
begin
// 151
// 325
  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    if not Chk_Sintetico.Checked then
    Begin
    try
      with Table_Temp do
      begin

        Temp_Name    := Copy(TimeToStr(time), 1, 2) + Copy(TimeToStr(time), 4, 2) + Copy(TimeToStr(time), 7, 2);


        with FieldDefs do
        begin
          Clear;
          Add('ID', ftAutoInc, 0, False);
          Add('TRANSACAO_ID', ftInteger, 0, False);
          Add('DT_TRANS', ftDate, 0, False);
          Add('ESPECIE', ftString, 4, False);
          Add('SERIE', ftString, 3, False);
          Add('NUM_DOC', ftString, 9, False);
          Add('CNPJ', ftString, 18, False);
          Add('UF', ftString, 2, False);
          Add('VR_CONTABIL', ftFloat, 0, False);
          Add('COD_CONTABIL', ftString, 4, False);
          Add('CFOP', ftString, 4, False);
          Add('SIT_IMPOSTO', ftString, 4, False);
          Add('COD_IMPOSTO', ftString, 1, False);
          Add('BASE_CALCULO', ftFloat, 0, False);
          Add('ALIQUOTA_ICMS', ftFloat, 0, False);
          Add('IMPOSTO', ftFloat, 0, False);
          Add('VR_OUTROS', ftFloat, 0, False);
        end;

        with IndexDefs do
        begin
          Clear;
          Add('', 'ID', [ixPrimary, ixUnique]);
          Add('TEMP', 'DT_TRANS;TRANSACAO_ID', [ixCaseInsensitive]);
        end;


        IndexName := 'TEMP';
        Open;
      end;
    except
     Application.MessageBox('Ocorreu um erro ao criar um arquivo temporário', PChar(Msg_Title), mb_IconStop);
     exit;
    end;

    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT TRANSITENS.TRANSACAO_ID, TRANSACOES.DT_SPED DT_TRANS, TRANSACOES.SERIE, TRANSACOES.MODELO, TRANSACOES.NUM_DOC, ' +
                 'CLIENTES.CNPJ, CLIENTES.ESTADO, TRANSITENS.CFOP, ' +
                 'SUM(TRANSITENS.VR_TOTAL + TRANSITENS.VALOR_ICMS_ST + TRANSITENS.VR_FRETE + TRANSITENS.VR_ACRESCIMO + ' +
                 'TRANSITENS.VR_IPI - TRANSITENS.DESC_RODAPE) VR_CONTABIL, TRANSITENS.ALIQUOTA_ICMS, SUM(TRANSITENS.VALOR_ICMS) VALOR_ICMS, SUM(TRANSITENS.VALOR_OUTROS) VALOR_OUTROS, SUM(TRANSITENS.BASE_CALC_ICMS) BASE_CALC_ICMS');
    QRel.Sql.Add('FROM TRANSITENS');
    QRel.Sql.Add('INNER JOIN TRANSACOES');
    QRel.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
    QRel.Sql.Add('LEFT JOIN CLIENTES');
    QRel.Sql.Add('ON (TRANSACOES.CLIENTE_ID = CLIENTES.CLIENTE_ID)');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(TRANSACOES.DT_SPED BETWEEN :DT_INICIAL AND :DT_FINAL)');
    QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
    QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
    QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :CD_CPR)');
    QRel.Sql.Add('AND (TRANSACOES.DEPTO = :DEPTO)');
    QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN(SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
    QRel.Sql.Add('GROUP BY TRANSITENS.TRANSACAO_ID, TRANSACOES.DT_SPED, TRANSACOES.SERIE, TRANSACOES.NUM_DOC, CLIENTES.CNPJ, CLIENTES.ESTADO, TRANSITENS.CFOP, TRANSITENS.ALIQUOTA_ICMS,TRANSACOES.MODELO');
    QRel.Sql.Add('ORDER BY TRANSACOES.DT_SPED');

    QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
    QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    QRel.ParamByName('CD_CPR').AsString       := '01';
    QRel.ParamByName('DEPTO').AsString        := '07';

    QRel.Prepare;
    QRel.Open;

    QRel.First;
    while not QRel.Eof do
    begin
      Table_Temp.Append;

      Table_Temp.FieldByName('TRANSACAO_ID').AsInteger := QRel.FieldByName('TRANSACAO_ID').AsInteger;
      Table_Temp.FieldByName('DT_TRANS').AsDateTime    := QRel.FieldByName('DT_TRANS').AsDateTime;

      if QRel.FieldByName('MODELO').AsString = '2D' then
      Table_Temp.FieldByName('ESPECIE').AsString       := 'CF'
      Else if QRel.FieldByName('MODELO').AsString = '65' then
      Table_Temp.FieldByName('ESPECIE').AsString       := 'NFce'
      Else
      Table_Temp.FieldByName('ESPECIE').AsString       := 'NFe';

      Table_Temp.FieldByName('SERIE').AsString         := QRel.FieldByName('SERIE').AsString;
      Table_Temp.FieldByName('NUM_DOC').AsString       := QRel.FieldByName('NUM_DOC').AsString;
      Table_Temp.FieldByName('CNPJ').AsString          := QRel.FieldByName('CNPJ').AsString;
      Table_Temp.FieldByName('UF').AsString            := QRel.FieldByName('ESTADO').AsString;
      Table_Temp.FieldByName('VR_CONTABIL').AsFloat    := QRel.FieldByName('VR_CONTABIL').AsFloat;
      Table_Temp.FieldByName('CFOP').AsString          := QRel.FieldByName('CFOP').AsString;
      Table_Temp.FieldByName('BASE_CALCULO').AsFloat   := QRel.FieldByName('BASE_CALC_ICMS').AsFloat;
      Table_Temp.FieldByName('ALIQUOTA_ICMS').AsFloat  := QRel.FieldByName('ALIQUOTA_ICMS').AsFloat;
      Table_Temp.FieldByName('IMPOSTO').AsFloat        := QRel.FieldByName('VALOR_ICMS').AsFloat;
      Table_Temp.FieldByName('VR_OUTROS').AsFloat      := QRel.FieldByName('VALOR_OUTROS').AsFloat;

      if QRel.FieldByName('ALIQUOTA_ICMS').AsFloat > 0 then
      begin
        Table_Temp.FieldByName('SIT_IMPOSTO').AsString := 'ICMS';
        Table_Temp.FieldByName('COD_IMPOSTO').AsString := '1';
      end;

      Table_Temp.Post;

      Application.ProcessMessages;
      QRel.Next;
    end;

    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT TRANSACOES.*, CLIENTES.CNPJ, CLIENTES.ESTADO');
    QRel.Sql.Add('FROM TRANSACOES');
    QRel.Sql.Add('INNER JOIN CLIENTES');
    QRel.Sql.Add('ON (TRANSACOES.CLIENTE_ID = CLIENTES.CLIENTE_ID)');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(TRANSACOES.DT_SPED BETWEEN :DT_INICIAL AND :DT_FINAL)');
    QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
    QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
    QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :CD_CPR)');
    QRel.Sql.Add('AND (TRANSACOES.DEPTO = :DEPTO)');
    QRel.Sql.Add('AND (TRANSACOES.CFOP <> :NULO)');
    QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN(SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
    QRel.Sql.Add('ORDER BY TRANSACOES.DT_SPED');

    QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
    QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    QRel.ParamByName('CD_CPR').AsString       := '01';
    QRel.ParamByName('DEPTO').AsString        := '03';
    QRel.ParamByName('NULO').AsString         := '';

    QRel.Prepare;
    QRel.Open;

    QRel.First;
    while not QRel.Eof do
    begin
      Table_Temp.Append;

      Table_Temp.FieldByName('TRANSACAO_ID').AsInteger := QRel.FieldByName('TRANSACAO_ID').AsInteger;
      Table_Temp.FieldByName('DT_TRANS').AsDateTime    := QRel.FieldByName('DT_TRANS').AsDateTime;
      Table_Temp.FieldByName('ESPECIE').AsString       := 'NFF';
      Table_Temp.FieldByName('SERIE').AsString         := QRel.FieldByName('SERIE').AsString;
      Table_Temp.FieldByName('NUM_DOC').AsString       := QRel.FieldByName('NUM_DOC').AsString;
      Table_Temp.FieldByName('CNPJ').AsString          := QRel.FieldByName('CNPJ').AsString;
      Table_Temp.FieldByName('UF').AsString            := QRel.FieldByName('ESTADO').AsString;
      Table_Temp.FieldByName('VR_CONTABIL').AsFloat    := QRel.FieldByName('VALOR').AsFloat;
      Table_Temp.FieldByName('CFOP').AsString          := QRel.FieldByName('CFOP').AsString;
      Table_Temp.FieldByName('BASE_CALCULO').AsFloat   := QRel.FieldByName('BASE_ICMS_NORMAL').AsFloat;
      Table_Temp.FieldByName('ALIQUOTA_ICMS').AsFloat  := ((QRel.FieldByName('VR_ICMS_NORMAL').AsFloat * 100) / QRel.FieldByName('VALOR').AsFloat);
      Table_Temp.FieldByName('IMPOSTO').AsFloat        := QRel.FieldByName('VR_ICMS_NORMAL').AsFloat;

      if QRel.FieldByName('VR_ICMS_NORMAL').AsFloat > 0 then
      begin
        Table_Temp.FieldByName('SIT_IMPOSTO').AsString := 'ICMS';
        Table_Temp.FieldByName('COD_IMPOSTO').AsString := '1';
      end;

      Table_Temp.Post;

      Application.ProcessMessages;
      QRel.Next;
    end;

    QRLabel25.Caption := Dtmen.Text + ' a ' + Dtmai.Text;
    Registro_Entrada.PreviewModal;
    End
    Else
    Begin

      QRel.Sql.Clear;
      QRel.Sql.Add('SELECT SUM(VR_CONTABIL) VR_CONTABIL ,  SUM(VALOR_ICMS) VALOR_ICMS, SUM(BASE_CALC_ICMS) BASE_CALC_ICMS');
      QRel.Sql.Add('FROM (');
      QRel.Sql.Add('SELECT SUM(TRANSITENS.VR_TOTAL + TRANSITENS.VALOR_ICMS_ST + TRANSITENS.VR_FRETE + TRANSITENS.VR_ACRESCIMO + ');
      QRel.Sql.Add('TRANSITENS.VR_IPI - TRANSITENS.DESC_RODAPE) VR_CONTABIL,  SUM(TRANSITENS.VALOR_ICMS) VALOR_ICMS, SUM(TRANSITENS.BASE_CALC_ICMS) BASE_CALC_ICMS');
      QRel.Sql.Add('FROM TRANSITENS');
      QRel.Sql.Add('INNER JOIN TRANSACOES');
      QRel.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
      QRel.Sql.Add('LEFT JOIN FORNECEDORES');
      QRel.Sql.Add('ON (TRANSACOES.FORNECEDOR_ID = FORNECEDORES.FORNECEDOR_ID)');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSACOES.DT_SPED BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :CD_VDA)');
      QRel.Sql.Add('AND (TRANSACOES.DEPTO = :DEPTO)');
      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN(SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
      QRel.Sql.Add('GROUP BY TRANSITENS.TRANSACAO_ID, TRANSACOES.DT_SPED, TRANSACOES.SERIE, TRANSACOES.NUM_DOC, FORNECEDORES.CNPJ, FORNECEDORES.ESTADO, TRANSITENS.CFOP, TRANSITENS.ALIQUOTA_ICMS');

      QRel.Sql.Add('UNION ALL');

      QRel.Sql.Add('SELECT SUM(TRANSACOES.VALOR) VR_CONTABIL, SUM(TRANSACOES.VR_ICMS_NORMAL) VALOR_ICMS, SUM(TRANSACOES.BASE_ICMS_NORMAL) BASE_CALC_ICMS');
      QRel.Sql.Add('FROM TRANSACOES');
      QRel.Sql.Add('INNER JOIN FORNECEDORES  ON (TRANSACOES.FORNECEDOR_ID = FORNECEDORES.FORNECEDOR_ID)');
      QRel.Sql.Add('WHERE  (TRANSACOES.DT_SPED BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :CD_VDA)');
      QRel.Sql.Add('AND (TRANSACOES.DEPTO = :DEPTO2)');
      QRel.Sql.Add('AND (TRANSACOES.CFOP <> :VAZIO)');
      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN(SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
      QRel.Sql.Add('GROUP BY TRANSACAO_ID, TRANSACOES.DT_SPED, SERIE, NUM_DOC, CNPJ, ESTADO, TRANSACOES.CFOP');
      QRel.Sql.Add(')as teste');


      QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
      QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
      QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
      QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
      QRel.ParamByName('CD_VDA').AsString       := '01';
      QRel.ParamByName('DEPTO').AsString        := '07';
      QRel.ParamByName('DEPTO2').AsString       := '03';
      QRel.ParamByName('VAZIO').AsString        := '';


      QRel.Prepare;
      QRel.Open;

     QRLabel38.Caption := Dtmen.Text + ' a ' + Dtmai.Text;
     Registro_Entrada_Sintetico.PreviewModal;
    End;

  finally
    if not Chk_Sintetico.Checked then
    Begin
    Table_Temp.IndexName := '';
    Table_Temp.Close;
    End;

    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;

procedure TFrmRegistro_Saida.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRegistro_Saida.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmRegistro_Saida.DtmenKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    //Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmRegistro_Saida.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmRegistro_Saida.FormCreate(Sender: TObject);
begin
  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);
end;

procedure TFrmRegistro_Saida.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin

  if Table_Temp.FieldByName('CONDUTA').AsString = 'ENTRADAS' then
    QRLabel7.Caption := 'E N T R A D A S'
  else
    QRLabel7.Caption := 'S A Í D A S';

end;

end.
