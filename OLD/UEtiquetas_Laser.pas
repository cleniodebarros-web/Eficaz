unit UEtiquetas_Laser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Spin, Mask, rxToolEdit, rxCurrEdit, DB,
  DBTables, IBCustomDataSet, IBQuery, QRCtrls, QuickRpt, ACBrBarCode, ACBrBase,
  ACBrBoleto, ACBrBoletoFCFR, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmEtiquetas_Laser = class(TForm)
    Label4: TLabel;
    Compr_Folha: TCurrencyEdit;
    Label5: TLabel;
    Altura_Folha: TCurrencyEdit;
    Margem_Esquerda: TCurrencyEdit;
    Margem_Inferior: TCurrencyEdit;
    Espacamento: TCurrencyEdit;
    Label3: TLabel;
    Label9: TLabel;
    Label7: TLabel;
    Altura_Etiqueta: TCurrencyEdit;
    Colunas: TSpinEdit;
    Margem_Superior: TCurrencyEdit;
    Margem_Direita: TCurrencyEdit;
    Label6: TLabel;
    Label8: TLabel;
    Label2: TLabel;
    Label10: TLabel;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    Bevel1: TBevel;
    Etiq_Laser: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    Etiq_Jato: TQuickRep;
    QRBand1: TQRBand;
    QRShape5: TQRShape;
    QRShape4: TQRShape;
    QRShape2: TQRShape;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    Image1: TImage;
    QRDBImage1: TQRDBImage;
    QRDBText8: TQRDBText;
    QRDBImage2: TQRDBImage;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBImage3: TQRDBImage;
    QRDBText11: TQRDBText;
    QRDBImage4: TQRDBImage;
    QRDBText12: TQRDBText;
    QRDBImage5: TQRDBImage;
    QRDBText13: TQRDBText;
    QRDBImage6: TQRDBImage;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    Data_Temp: TDataSource;
    Impr_Legenda: TCheckBox;
    Table_Temp: TFDMemTable;
    procedure btnExecutaClick(Sender: TObject);
    procedure Compr_FolhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEtiquetas_Laser: TFrmEtiquetas_Laser;

implementation

uses
  UPrincipal, UData, UEtiq_Zebra;

{$R *.dfm}

procedure TFrmEtiquetas_Laser.btnExecutaClick(Sender: TObject);
begin
// 203, 345

  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    Table_Temp.First;

    QRDBText8.Enabled  := Impr_Legenda.Checked;
    QRDBText9.Enabled  := Impr_Legenda.Checked;
    QRDBText10.Enabled := Impr_Legenda.Checked;
    QRDBText11.Enabled := Impr_Legenda.Checked;
    QRDBText12.Enabled := Impr_Legenda.Checked;
    QRDBText13.Enabled := Impr_Legenda.Checked;

    if Colunas.Value = 0 then
    begin
      Etiq_Jato.Page.BottomMargin := Margem_Inferior.Value;
      Etiq_Jato.Page.LeftMargin   := Margem_Esquerda.Value;
      Etiq_Jato.Page.Length       := Altura_Folha.Value;
      Etiq_Jato.Page.RightMargin  := Margem_Direita.Value;
      Etiq_Jato.Page.TopMargin    := Margem_Superior.Value;
      Etiq_Jato.Page.Width        := Compr_Folha.Value;
      QRBand1.Size.Height         := Altura_Etiqueta.Value;

      Etiq_Jato.PreviewModal;
    end
    else
    begin
      Etiq_Laser.Page.BottomMargin := Margem_Inferior.Value;
      Etiq_Laser.Page.Columns      := StrToInt(Colunas.Text);
      Etiq_Laser.Page.ColumnSpace  := Espacamento.Value;
      Etiq_Laser.Page.LeftMargin   := Margem_Esquerda.Value;
      Etiq_Laser.Page.Length       := Altura_Folha.Value;
      Etiq_Laser.Page.RightMargin  := Margem_Direita.Value;
      Etiq_Laser.Page.TopMargin    := Margem_Superior.Value;
      Etiq_Laser.Page.Width        := Compr_Folha.Value;
      DetailBand1.Size.Height      := Altura_Etiqueta.Value;

      Etiq_Laser.PreviewModal;
    end;

    Table_Temp.Close;

    Close;
  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;

procedure TFrmEtiquetas_Laser.Compr_FolhaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmEtiquetas_Laser.FormCreate(Sender: TObject);
var
Temp_Name: String;
begin
  with Table_Temp do
  begin

    Temp_Name    := Copy(TimeToStr(time), 1, 2) + Copy(TimeToStr(time), 4, 2) + Copy(TimeToStr(time), 7, 2);


    with FieldDefs do
    begin
      Clear;
      Add('COD_BARRA', ftString, 13, False);
      Add('DESCRICAO', ftString, 24, False);
      Add('PRECO_VAREJO', ftFloat, 0, False);
      Add('IMAGEM', ftBlob, 0, False);
    end;

    with IndexDefs do
    begin
      Clear;
    end;


    Open;
  end;
end;

end.
