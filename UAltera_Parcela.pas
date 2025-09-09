unit UAltera_Parcela;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DBCtrls, rxCurrEdit, RXDBCtrl, Mask,
  rxToolEdit;

type
  TFrmAltera_Parcela = class(TForm)
    Panel1: TPanel;
    btnRetorna: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btnExecuta: TBitBtn;
    DT_VENCIMENTO: TDateEdit;
    ESPECIE: TComboBox;
    VALOR: TRxCalcEdit;
    DUPLICATA: TEdit;
    procedure DUPLICATAKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ESPECIEKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure DT_VENCIMENTOEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAltera_Parcela: TFrmAltera_Parcela;

implementation

uses
  UParcelas;

{$R *.dfm}

procedure TFrmAltera_Parcela.DT_VENCIMENTOEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmAltera_Parcela.DUPLICATAKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmAltera_Parcela.ESPECIEKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
   // Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmAltera_Parcela.FormShow(Sender: TObject);
begin
  DT_VENCIMENTO.Date := FrmParcelas.QTabela.FieldByName('DT_VENCIMENTO').AsDateTime;
  VALOR.Value        := FrmParcelas.QTabela.FieldByName('VALOR').AsFloat;
  ESPECIE.Text       := FrmParcelas.QTabela.FieldByName('ESPECIE').AsString;
  DUPLICATA.Text     := FrmParcelas.QTabela.FieldByName('DUPLICATA').AsString;

  if Copy(FrmParcelas.QTabela.FieldByName('PARCELA_ID').AsString, 1, 2) = Copy(FrmParcelas.QTabela.FieldByName('PARCELA_ID').AsString, 4, 2)then
    VALOR.ReadOnly := True;
end;

end.
