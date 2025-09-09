unit UServidor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TFrmServidor = class(TForm)
    Label1: TLabel;
    Nm_Server: TEdit;
    Label2: TLabel;
    Nm_DB: TEdit;
    Label3: TLabel;
    Nm_User: TEdit;
    Label4: TLabel;
    Password: TEdit;
    Bevel1: TBevel;
    btnExecuta: TBitBtn;
    btnRetorna: TBitBtn;
    BitBtn1: TBitBtn;
    procedure Nm_ServerKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnRetornaClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmServidor: TFrmServidor;

implementation

uses
  UPrincipal;

{$R *.dfm}

procedure TFrmServidor.BitBtn1Click(Sender: TObject);
begin
  FrmPrincipal.OpenDialog1.Title      := 'Selecione o BD';
  FrmPrincipal.OpenDialog1.DefaultExt := '*.FDB';
  FrmPrincipal.OpenDialog1.Filter     := 'Arquivos FDB (*.FDB)|*.FDB|Arquivos GDB (*.GDB)|*.GDB|Todos os Arquivos (*.*)|*.*';
  FrmPrincipal.OpenDialog1.InitialDir := ExtractFilePath(ParamStr(0));

  if FrmPrincipal.OpenDialog1.Execute then
    Nm_DB.Text := FrmPrincipal.OpenDialog1.FileName;
end;

procedure TFrmServidor.btnRetornaClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmServidor.Nm_ServerKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

end.
