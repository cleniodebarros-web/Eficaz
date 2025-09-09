unit URegistros_Tipo60;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, rxToolEdit, QuickRpt, QRCtrls, DB,
  IBCustomDataSet, IBQuery, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrmRegistros_Tipo60 = class(TForm)
    Dtmen: TDateEdit;
    Registro: TComboBox;
    Label3: TLabel;
    Dtmai: TDateEdit;
    Label1: TLabel;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    Bevel1: TBevel;
    Registro60D: TQuickRep;
    QRBand1: TQRBand;
    QRDBText9: TQRDBText;
    QRSysData3: TQRSysData;
    QRLabel2: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape2: TQRShape;
    QRShape4: TQRShape;
    QRLabel9: TQRLabel;
    QRSysData4: TQRSysData;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRBand2: TQRBand;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRGroup2: TQRGroup;
    QRDBText16: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBText18: TQRDBText;
    Registro60R: TQuickRep;
    QRBand4: TQRBand;
    QRDBText19: TQRDBText;
    QRSysData5: TQRSysData;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel22: TQRLabel;
    QRSysData6: TQRSysData;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRBand5: TQRBand;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    Registro60A: TQuickRep;
    QRBand7: TQRBand;
    QRDBText22: TQRDBText;
    QRSysData7: TQRSysData;
    QRLabel26: TQRLabel;
    QRLabel31: TQRLabel;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRLabel32: TQRLabel;
    QRSysData8: TQRSysData;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel37: TQRLabel;
    QRBand8: TQRBand;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText32: TQRDBText;
    QRBand9: TQRBand;
    QRExpr4: TQRExpr;
    QRGroup4: TQRGroup;
    QRDBText35: TQRDBText;
    Registro60I: TQuickRep;
    QRBand10: TQRBand;
    QRDBText31: TQRDBText;
    QRSysData9: TQRSysData;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRLabel38: TQRLabel;
    QRSysData10: TQRSysData;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRBand11: TQRBand;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText36: TQRDBText;
    QRDBText37: TQRDBText;
    QRDBText38: TQRDBText;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    QRGroup5: TQRGroup;
    QRDBText42: TQRDBText;
    QRBand3: TQRBand;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr5: TQRExpr;
    QRBand6: TQRBand;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRBand12: TQRBand;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRBand13: TQRBand;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRSysData11: TQRSysData;
    QRSysData12: TQRSysData;
    QRSysData13: TQRSysData;
    QRSysData14: TQRSysData;
    QRSysData17: TQRSysData;
    QRel: TFDQuery;
    Registro60M: TQuickRep;
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
    QRLabel8: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel4: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    SummaryBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRSysData15: TQRSysData;
    QRGroup1: TQRGroup;
    QRDBText6: TQRDBText;
    QRBand14: TQRBand;
    QRSysData16: TQRSysData;
    QRExpr14: TQRExpr;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DtmenEnter(Sender: TObject);
    procedure RegistroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnRetornaClick(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRegistros_Tipo60: TFrmRegistros_Tipo60;

implementation

uses
  UData, UPrincipal;

{$R *.dfm}

procedure TFrmRegistros_Tipo60.btnExecutaClick(Sender: TObject);
begin
// 151, 325
  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    if Registro.Text = 'Registro 60M' then
    begin
      QRel.Sql.Clear;
      QRel.Sql.Add('SELECT * FROM REGISTRO_60M');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(DT_EMISSAO BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('ORDER BY NUM_SERIE, COO_INICIAL, COO_FINAL');

      QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
      QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;

      QRel.Prepare;
      QRel.Open;

      QRLabel1.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;

      if QRel.IsEmpty then
        Application.MessageBox('Não há dados para os parâmetros informados', PChar(Msg_Title), mb_IconInformation)
      else
        Registro60M.PreviewModal;
    end;

    if Registro.Text = 'Registro 60D' then
    begin
      QRel.Sql.Clear;
      QRel.Sql.Add('SELECT REGISTRO_60D.*, PRODUTOS.DESCRICAO');
      QRel.Sql.Add('FROM REGISTRO_60D');
      QRel.Sql.Add('INNER JOIN PRODUTOS');
      QRel.Sql.Add('ON (REGISTRO_60D.COD_PRODUTO = PRODUTOS.COD_BARRA)');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(REGISTRO_60D.DT_EMISSAO BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('ORDER BY REGISTRO_60D.NUM_SERIE, REGISTRO_60D.DT_EMISSAO, PRODUTOS.DESCRICAO');

      QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
      QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;

      QRel.Prepare;
      QRel.Open;

      QRLabel6.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;

      if QRel.IsEmpty then
        Application.MessageBox('Não há dados para os parâmetros informados', PChar(Msg_Title), mb_IconInformation)
      else
        Registro60D.PreviewModal;
    end;

    if Registro.Text = 'Registro 60R' then
    begin
      QRel.Sql.Clear;
      QRel.Sql.Add('SELECT REGISTRO_60R.*, PRODUTOS.DESCRICAO');
      QRel.Sql.Add('FROM REGISTRO_60R');
      QRel.Sql.Add('INNER JOIN PRODUTOS');
      QRel.Sql.Add('ON (REGISTRO_60R.COD_PRODUTO = PRODUTOS.COD_BARRA)');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(REGISTRO_60R.MES_ANO = :MES_ANO)');
      QRel.Sql.Add('ORDER BY PRODUTOS.DESCRICAO');

      if StrToInt(Copy(Dtmai.Text, 4, 2)) < 10 then
      QRel.ParamByName('MES_ANO').AsString := Copy(Dtmai.Text, 5, 7)
      Else
      QRel.ParamByName('MES_ANO').AsString := Copy(Dtmai.Text, 4, 7);

      QRel.Prepare;
      QRel.Open;

      QRLabel21.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;

      if QRel.IsEmpty then
        Application.MessageBox('Não há dados para os parâmetros informados', PChar(Msg_Title), mb_IconInformation)
      else
        Registro60R.PreviewModal;
    end;

    if Registro.Text = 'Registro 60A' then
    begin
      QRel.Sql.Clear;
      QRel.Sql.Add('SELECT * FROM REGISTRO_60A');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(DT_EMISSAO BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('ORDER BY NUM_SERIE, DT_EMISSAO');

      QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
      QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;

      QRel.Prepare;
      QRel.Open;

      QRLabel31.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;

      if QRel.IsEmpty then
        Application.MessageBox('Não há dados para os parâmetros informados', PChar(Msg_Title), mb_IconInformation)
      else
        Registro60A.PreviewModal;
    end;

    if Registro.Text = 'Registro 60I' then
    begin
      QRel.Sql.Clear;
      QRel.Sql.Add('SELECT REGISTRO_60I.*, PRODUTOS.DESCRICAO');
      QRel.Sql.Add('FROM REGISTRO_60I');
      QRel.Sql.Add('LEFT JOIN PRODUTOS');
      QRel.Sql.Add('ON (REGISTRO_60I.COD_PRODUTO = PRODUTOS.COD_BARRA)');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(REGISTRO_60I.DT_EMISSAO BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('ORDER BY REGISTRO_60I.NUM_SERIE, REGISTRO_60I.DT_EMISSAO, REGISTRO_60I.NUM_ORDEM, REGISTRO_60I.NUM_ITEM');

      QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
      QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;

      QRel.Prepare;
      QRel.Open;

      QRLabel36.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;

      if QRel.IsEmpty then
        Application.MessageBox('Não há dados para os parâmetros informados', PChar(Msg_Title), mb_IconInformation)
      else
        Registro60I.PreviewModal;
    end;
  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;

procedure TFrmRegistros_Tipo60.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRegistros_Tipo60.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmRegistros_Tipo60.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    //Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmRegistros_Tipo60.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmRegistros_Tipo60.FormCreate(Sender: TObject);
begin
  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);
end;

procedure TFrmRegistros_Tipo60.RegistroKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

end.
