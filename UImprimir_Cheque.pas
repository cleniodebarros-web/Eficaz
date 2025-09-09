{$I ACBr.inc}

unit UImprimir_Cheque;

interface

uses ACBrCHQ, ACBrECF, ACBrBase, ACBrExtenso, StdCtrls, Controls, Forms, Dialogs,
     Buttons, Graphics, Classes, ExtCtrls, ComCtrls;

type
  TFrmImprimir_Cheque = class(TForm)
    ACBrExtenso1: TACBrExtenso;
    ACBrECF1: TACBrECF;
    ACBrCHQ1: TACBrCHQ;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    btnRetorna: TBitBtn;
    pFrente: TPanel;
    Image1: TImage;
    lExtenso2: TLabel;
    lExtenso1: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    sbECF: TSpeedButton;
    edValor: TEdit;
    edFavorecido: TEdit;
    edDia: TEdit;
    edCidade: TEdit;
    edBanco: TEdit;
    edAno: TEdit;
    cbxPorta: TComboBox;
    cbxModelo: TComboBox;
    cbVerifica: TCheckBox;
    cbMes: TComboBox;
    bImprimir: TButton;
    pVerso: TPanel;
    Image2: TImage;
    bImpVerso: TButton;
    mVerso: TMemo;
    procedure edValorExit(Sender: TObject);
    procedure edValorKeyPress(Sender: TObject; var Key: Char);
    procedure bImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edBancoExit(Sender: TObject);
    procedure sbECFClick(Sender: TObject);
    procedure cbxModeloChange(Sender: TObject);
    procedure cbxPortaChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bImpVersoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmImprimir_Cheque: TFrmImprimir_Cheque;

implementation

uses SysUtils,
   {$IFDEF Delphi6_UP} DateUtils, {$ELSE} ACBrD5,{$ENDIF}
   ACBrUtil, ACBrCHQPerto, UCheques_Emitidos, UPrincipal;

{$R *.dfm}

procedure TFrmImprimir_Cheque.FormCreate(Sender: TObject);
begin
  cbxModelo.ItemIndex := 2;

  cbxModeloChange(Sender);
  cbxPortaChange(Sender);
end;

procedure TFrmImprimir_Cheque.edValorExit(Sender: TObject);
var
Texto, Tracos: String;
Pos, Tamanho: Integer;
begin
  ACBrExtenso1.Valor := StrToFloatDef(edValor.Text, 0);

  { Verificando se o extenso cabe na linha de cima }
  Tracos := '';
  Texto  := '( ' + Trim(ACBrExtenso1.Texto) + ' )';
  Pos    := Length(Texto);

  with FrmImprimir_Cheque.Canvas do
  begin
    Font    := lExtenso1.Font;
    Tamanho := TextWidth(Texto);

    while (Tamanho > lExtenso1.Width) do
    begin
      { Acha um espaço }

      while (Texto[Pos] <> ' ') and (Pos > 0) do
        Pos := Pos - 1;

      Pos := Pos - 1;
      Tamanho := TextWidth(Copy(Texto, 1, Pos));
    end;

    { Inserindo traços no inicio }

    if Pos < Length(Texto) then
    begin
      while (Tamanho < lExtenso1.Width) do
      begin
        Tracos  := Tracos + '-' ;
        Tamanho := TextWidth(Tracos + Copy(Texto, 1, Pos));
      end;

      Tracos := Copy(Tracos, 1, Length(Tracos) - 1);
    end;
  end;
                 
  lExtenso1.Caption := Tracos + Copy(Texto, 1, Pos);
  lExtenso2.Caption := Copy(Texto, Pos + 2, Length(Texto));
end;

procedure TFrmImprimir_Cheque.edValorKeyPress(Sender: TObject; var Key: Char);
VAR
DecimalSeparator :Char;
begin

  if Key in [',', '.'] then
    Key := DecimalSeparator;
end;

procedure TFrmImprimir_Cheque.bImprimirClick(Sender: TObject);
var
Data: TDateTime;
begin
  Data := EncodeDate(StrToIntDef(edAno.Text, YearOf(now)),
                     cbMes.Items.IndexOf(cbMes.Text ) + 1,
                     StrToIntDef(edDia.Text, DayOf(now)));

  if cbVerifica.Checked and (not ACBrCHQ1.ChequePronto) then
  begin
    MessageDlg('Cheque não está posicionado na Impressora', mtError, [mbOk], 0);
    bImprimir.SetFocus;
    exit;
  end;

  ACBrCHQ1.Banco      := edBanco.Text;
  ACBrCHQ1.Valor      := StrToFloat(edValor.Text);
  ACBrCHQ1.Data       := Data;
  ACBrCHQ1.Favorecido := edFavorecido.Text;
  ACBrCHQ1.Cidade     := edCidade.Text;

  ACBrCHQ1.ImprimirCheque;
end;

procedure TFrmImprimir_Cheque.edBancoExit(Sender: TObject);
begin
  edBanco.Text := IntToStrZero(StrToIntDef(edBanco.Text, 0), 3);
end;

procedure TFrmImprimir_Cheque.sbECFClick(Sender: TObject);
begin
  ACBrECF1.Ativar;
  ACBrECF1.TestarDialog;
end;

procedure TFrmImprimir_Cheque.cbxModeloChange(Sender: TObject);
var
OldModelo: TACBrCHQModelo;
begin
  ACBrCHQ1.Desativar;
  
  OldModelo := ACBrCHQ1.Modelo;

  try
    ACBrCHQ1.Modelo := TACBrCHQModelo(cbxModelo.ItemIndex);

    if ACBrCHQ1.Modelo = chqImpressoraECF then
    begin
       ACBrCHQ1.ECF := ACBrECF1;
       ACBrECF1.Ativar;
    end;
  except
     ACBrCHQ1.Modelo := OldModelo;
  end;

  cbxModelo.ItemIndex := Integer(ACBrCHQ1.Modelo);
  cbxPorta.Text       := ACBrCHQ1.Porta;
end;

procedure TFrmImprimir_Cheque.cbxPortaChange(Sender: TObject);
begin
  if ACBrCHQ1.Modelo <> chqImpressoraECF then
  begin
    ACBrCHQ1.Desativar;
    ACBrCHQ1.Porta := cbxPorta.Text;
  end;
end;

procedure TFrmImprimir_Cheque.FormShow(Sender: TObject);
begin
  edValorExit(Sender);

  edBanco.SetFocus;
  edBanco.SelectAll;
end;

procedure TFrmImprimir_Cheque.bImpVersoClick(Sender: TObject);
begin
  ACBrCHQ1.ImprimirVerso(mVerso.Lines);
end;

end.
