unit URel_Cheques_Emitidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, rxToolEdit, IBCustomDataSet, IBQuery,
  QRCtrls, QuickRpt, Buttons, DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrmRel_Cheques_Emitidos = class(TForm)
    Label1: TLabel;
    Bevel1: TBevel;
    Dtmen: TDateEdit;
    Dtmai: TDateEdit;
    Cheques: TQuickRep;
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
    QRLabel11: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    Tipo_Data: TRadioGroup;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel5: TQRLabel;
    CheckBox1: TCheckBox;
    QRel: TFDQuery;
    QRGroup1: TQRGroup;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRBand1: TQRBand;
    QRExpr1: TQRExpr;
    SummaryBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape4: TQRShape;
    QRShape2: TQRShape;
    QRShape5: TQRShape;
    QRDBText7: TQRDBText;
    QRLabel8: TQRLabel;
    qrdbtxtnome_banco: TQRDBText;
    QRLabel12: TQRLabel;
    Chk_ordem_numero: TCheckBox;
    procedure btnRetornaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnExecutaClick(Sender: TObject);
    procedure DtmenEnter(Sender: TObject);
    procedure Tipo_DataClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Cheques_Emitidos: TFrmRel_Cheques_Emitidos;

implementation

uses
  UPrincipal, UData;

{$R *.dfm}

procedure TFrmRel_Cheques_Emitidos.btnExecutaClick(Sender: TObject);
VAR
Valor_Cheque : Real;
begin
// 151, 325
  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT SUM(CHEQUES_EMITIDOS.VALOR)VALOR_CHEQUE');
    QRel.Sql.Add('FROM CHEQUES_EMITIDOS');
    QRel.Sql.Add('WHERE');


    if Tipo_Data.ItemIndex = 0 then
    begin
      QRel.Sql.Add('(DT_CHEQUE BETWEEN :DT_INICIAL AND :DT_FINAL)');

       if not CheckBox1.Checked then
       QRel.Sql.Add('AND DT_LIQUIDACAO IS NULL');

    end
    else if Tipo_Data.ItemIndex = 1 then
    begin
      QRel.Sql.Add('(DT_PARA BETWEEN :DT_INICIAL AND :DT_FINAL)');

       if not CheckBox1.Checked then
       QRel.Sql.Add('AND DT_LIQUIDACAO IS NULL');

    end
    else if Tipo_Data.ItemIndex = 2 then
    begin
      QRel.Sql.Add('(DT_LIQUIDACAO BETWEEN :DT_INICIAL AND :DT_FINAL)');

    end;


    QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime := Dtmai.Date;

    QRel.Prepare;
    QRel.Open;

    Valor_Cheque := QRel.FieldByName('VALOR_CHEQUE').ASfLOAT;


    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT DT_CHEQUE, NOMINAL, DT_PARA, CHEQUES_EMITIDOS.NUM_CHEQUE CHEQUE_NUMERO, CHEQUES_EMITIDOS.VALOR VALOR_CHEQUE,');
    QRel.Sql.Add('BANCOS.DESCRICAO NOME_BANCO,TRANSACAO_ID,DT_ENT_SAI,FORNECEDORES.NOME FORNECEDOR, TRANSACOES.VALOR,CHEQUES_EMITIDOS.BANCO_ID,CHEQUES_EMITIDOS.HISTORICO');
    QRel.Sql.Add('FROM CHEQUES_EMITIDOS');
    QRel.Sql.Add('INNER JOIN BANCOS ON BANCOS.BANCO_ID = CHEQUES_EMITIDOS.BANCO_ID');
    QRel.Sql.Add('LEFT JOIN TRANSACOES ON TRANSACOES.NUM_CHEQUE  =  CAST(CHEQUES_EMITIDOS.NUM_CHEQUE AS VARCHAR(15))');
    QRel.Sql.Add('LEFT JOIN FORNECEDORES ON FORNECEDORES.FORNECEDOR_ID = TRANSACOES.FORNECEDOR_ID');
    QRel.Sql.Add('WHERE');


    if Tipo_Data.ItemIndex = 0 then
    begin
      QRel.Sql.Add('(DT_CHEQUE BETWEEN :DT_INICIAL AND :DT_FINAL)');

       if not CheckBox1.Checked then
       QRel.Sql.Add('AND DT_LIQUIDACAO IS NULL');

      if Chk_ordem_numero.Checked then
       QRel.Sql.Add('ORDER BY CHEQUES_EMITIDOS.NUM_CHEQUE, NOMINAL')
      Else
      QRel.Sql.Add('ORDER BY DT_CHEQUE,CHEQUES_EMITIDOS.NUM_CHEQUE, NOMINAL');
    end
    else if Tipo_Data.ItemIndex = 1 then
    begin
      QRel.Sql.Add('(DT_PARA BETWEEN :DT_INICIAL AND :DT_FINAL)');

       if not CheckBox1.Checked then
       QRel.Sql.Add('AND DT_LIQUIDACAO IS NULL');

       if Chk_ordem_numero.Checked then
       QRel.Sql.Add('ORDER BY CHEQUES_EMITIDOS.NUM_CHEQUE, NOMINAL')
       Else
       QRel.Sql.Add('ORDER BY DT_PARA,CHEQUES_EMITIDOS.NUM_CHEQUE, NOMINAL');


    end
    else if Tipo_Data.ItemIndex = 2 then
    begin
      QRel.Sql.Add('(DT_LIQUIDACAO BETWEEN :DT_INICIAL AND :DT_FINAL)');

      if Chk_ordem_numero.Checked then
       QRel.Sql.Add('ORDER BY CHEQUES_EMITIDOS.NUM_CHEQUE, NOMINAL')
      Else
      QRel.Sql.Add('ORDER BY DT_LIQUIDACAO,CHEQUES_EMITIDOS.NUM_CHEQUE, NOMINAL');
    end;


    QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime := Dtmai.Date;

    QRel.Prepare;
    QRel.Open;

    QRLabel8.Caption := 'R$' + FloatToStrf(Valor_cheque,ffNumber,15,2);
    QRLabel1.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;

    if QRel.IsEmpty then
      Application.MessageBox('Não há dados para os parâmetros informados', PChar(Msg_Title), mb_IconInformation)
    else
      Cheques.PreviewModal;

  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;

procedure TFrmRel_Cheques_Emitidos.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRel_Cheques_Emitidos.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmRel_Cheques_Emitidos.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
   // Perform(Wm_NextDlgctl, 0, 0);
    
  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmRel_Cheques_Emitidos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmRel_Cheques_Emitidos.FormCreate(Sender: TObject);
begin
  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);
end;

procedure TFrmRel_Cheques_Emitidos.Tipo_DataClick(Sender: TObject);
begin
if Tipo_Data.ItemIndex = 2 then
CheckBox1.Enabled := False
Else
CheckBox1.Enabled := True;

end;

end.
