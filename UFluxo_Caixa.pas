unit UFluxo_Caixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, rxCurrEdit, rxToolEdit, QuickRpt, QRCtrls,
  DB, IBCustomDataSet, IBQuery, Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrmFluxo_Caixa = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    Ano: TCurrencyEdit;
    Mes_Ini: TCurrencyEdit;
    Mes_Fin: TCurrencyEdit;
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
    QRLabel11: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    SummaryBand1: TQRBand;
    QRShape4: TQRShape;
    QRGroup1: TQRGroup;
    QRExpr1: TQRExpr;
    QRBand1: TQRBand;
    QRShape2: TQRShape;
    QRExpr2: TQRExpr;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    QRLabel5: TQRLabel;
    QRDBText5: TQRDBText;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRel: TFDQuery;
    procedure btnRetornaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Mes_IniKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnExecutaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFluxo_Caixa: TFrmFluxo_Caixa;

implementation

uses
  UPrincipal, UData;

{$R *.dfm}

procedure TFrmFluxo_Caixa.btnExecutaClick(Sender: TObject);
begin
// 123, 325
  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT FLUXO_CAIXA.TITULO, FLUXO_CAIXA.DESCRICAO, CASE');
    QRel.Sql.Add('WHEN SUBSTRING(FLUXO_CAIXA.DESCRICAO FROM 2 FOR 1) = :POSITIVO THEN SUM(RAZAO.VALOR) END CREDITO, CASE');
    QRel.Sql.Add('WHEN SUBSTRING(FLUXO_CAIXA.DESCRICAO FROM 2 FOR 1) = :NEGATIVO THEN SUM(RAZAO.VALOR) END DEBITO');
    QRel.Sql.Add('FROM RAZAO');
    QRel.Sql.Add('INNER JOIN FLUXO_CAIXA');
    QRel.Sql.Add('ON (RAZAO.FLUXO_CAIXA_ID = FLUXO_CAIXA.FLUXO_CAIXA_ID)');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(RAZAO.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
    QRel.Sql.Add('AND (RAZAO.EMPRESA_ID = :EMPRESA_ID)');
    QRel.Sql.Add('AND (RAZAO.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');

    QRel.Sql.Add('AND (RAZAO.TPCTB <= :TPCTB)');
    QRel.Sql.Add('GROUP BY FLUXO_CAIXA.TITULO, FLUXO_CAIXA.DESCRICAO');
    QRel.Sql.Add('ORDER BY 2');

    QRel.ParamByName('POSITIVO').AsString     := '+';
    QRel.ParamByName('NEGATIVO').AsString     := '-';
    QRel.ParamByName('DT_INICIAL').AsDateTime := StrToDate('01/' + StrZero(Mes_Ini.Text, 2, 0) + '/' + Copy(DateToStr(date), 7, 4));
    QRel.ParamByName('DT_FINAL').AsDateTime   := Ult_Dia_Mes(StrToDate('01/' + StrZero(Mes_Ini.Text, 2, 0) + '/' + Copy(DateToStr(date), 7, 4)));
    QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;

    QRel.Prepare;
    QRel.Open;

    QRLabel1.Caption := 'Período: ' + '01/' + StrZero(Mes_Ini.Text, 2, 0) + '/' + Copy(DateToStr(date), 7, 4) + ' a ' + DateToStr(Ult_Dia_Mes(StrToDate('01/' + StrZero(Mes_Ini.Text, 2, 0) + '/' + Copy(DateToStr(date), 7, 4))));

    if QRel.IsEmpty then
      Application.MessageBox('Não há dados para os parâmetros informados', PChar(Msg_Title), mb_IconInformation)
    else
      Fluxo.PreviewModal;
  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;

procedure TFrmFluxo_Caixa.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmFluxo_Caixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmFluxo_Caixa.FormCreate(Sender: TObject);
begin
  Mes_Ini.Value := StrToInt(Copy(DateToStr(date), 4, 2));
  Mes_Fin.Value := StrToInt(Copy(DateToStr(date), 4, 2));
  Ano.Value     := StrToInt(Copy(DateToStr(date), 7, 4));
end;

procedure TFrmFluxo_Caixa.Mes_IniKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

end.
