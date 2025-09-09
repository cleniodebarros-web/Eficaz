unit URel_Cheques_Recebidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, rxToolEdit, IBCustomDataSet, IBQuery,
  QRCtrls, QuickRpt, Buttons, DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrmRel_Cheques_Recebidos = class(TForm)
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
    SummaryBand1: TQRBand;
    QRShape4: TQRShape;
    QRLabel2: TQRLabel;
    QRExpr3: TQRExpr;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    Tipo_Data: TRadioGroup;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText7: TQRDBText;
    QRel: TFDQuery;
    procedure btnRetornaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnExecutaClick(Sender: TObject);
    procedure DtmenEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Cheques_Recebidos: TFrmRel_Cheques_Recebidos;

implementation

uses
  UPrincipal, UData;

{$R *.dfm}

procedure TFrmRel_Cheques_Recebidos.btnExecutaClick(Sender: TObject);
begin
// 151, 325
  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT * FROM CHEQUES_RECEBIDOS');
    QRel.Sql.Add('WHERE');

    if Tipo_Data.ItemIndex = 0 then
    begin
      QRel.Sql.Add('(DT_CHEQUE BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('ORDER BY DT_CHEQUE, NOME_CLIENTE');
    end
    else if Tipo_Data.ItemIndex = 1 then
    begin
      QRel.Sql.Add('(DT_VENCIMENTO BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('ORDER BY DT_VENCIMENTO, NOME_CLIENTE');
    end
    else if Tipo_Data.ItemIndex = 2 then
    begin
      QRel.Sql.Add('(DT_LIQUIDACAO BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('ORDER BY DT_LIQUIDACAO, NOME_CLIENTE');
    end;

    QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime := Dtmai.Date;

    QRel.Prepare;
    QRel.Open;

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

procedure TFrmRel_Cheques_Recebidos.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRel_Cheques_Recebidos.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmRel_Cheques_Recebidos.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
   // Perform(Wm_NextDlgctl, 0, 0);
    
  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmRel_Cheques_Recebidos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmRel_Cheques_Recebidos.FormCreate(Sender: TObject);
begin
  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);
end;

end.
