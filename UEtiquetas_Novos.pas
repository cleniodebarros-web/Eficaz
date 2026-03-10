unit UEtiquetas_Novos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Winspool, Printers;

type
  TFrmEtiquetas_Novos = class(TForm)
    Impressora: TComboBox;
    Label4: TLabel;
    Modelo: TComboBox;
    Label2: TLabel;
    Preco: TCheckBox;
    btnExecuta: TBitBtn;
    btnRetorna: TBitBtn;
    Bevel1: TBevel;
    Porta: TComboBox;
    Label1: TLabel;
    procedure PrecoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ImpressoraKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure ImpressoraChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEtiquetas_Novos: TFrmEtiquetas_Novos;

implementation
Uses
UPrincipal;

{$R *.dfm}

procedure TFrmEtiquetas_Novos.btnExecutaClick(Sender: TObject);
begin
GravaIni(Arq_Ini, 'Impressora Código Barras','Impressora', Impressora.Text);
GravaIni(Arq_Ini, 'Impressora Código Barras','Modelo', Modelo.Text);
GravaIni(Arq_Ini, 'Impressora Código Barras','Porta', Porta.Text);

if Preco.Checked then
GravaIni(Arq_Ini, 'Impressora Código Barras','Imprime Preço','True')
Else
GravaIni(Arq_Ini, 'Impressora Código Barras','Imprime Preço','False');

end;

procedure TFrmEtiquetas_Novos.FormCreate(Sender: TObject);
begin

if LeIni(Arq_Ini, 'Impressora Código Barras','Impressora') <> '' then
Begin
Porta.Items.Clear;
Porta.Items.AddStrings(Printer.Printers);

Impressora.Text      := LeIni(Arq_Ini, 'Impressora Código Barras','Impressora');
Modelo.Text          := LeIni(Arq_Ini, 'Impressora Código Barras','Modelo');
Porta.Text           := LeIni(Arq_Ini, 'Impressora Código Barras','Porta');

 if LeIni(Arq_Ini, 'Impressora Código Barras','Imprime Preço') = 'True' then
    Preco.Checked := True
 else
    Preco.Checked := False;
End;

end;

procedure TFrmEtiquetas_Novos.ImpressoraChange(Sender: TObject);
begin

  if impressora.text = 'Bematech MP-4200(Bobina)'Then
  Begin
  modelo.Text := 'Bobina';
  Modelo.Enabled := False;
  End
  Else
  Begin
  Modelo.Enabled := True;
  modelo.Text := '';
  End;

end;

procedure TFrmEtiquetas_Novos.ImpressoraKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmEtiquetas_Novos.PrecoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

end.
