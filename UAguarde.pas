unit UAguarde;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, sGauge, StdCtrls, DB, IBCustomDataSet, IBQuery,
  sSkinManager, sSkinProvider, ImgList, acAlphaImageList, Vcl.ComCtrls;

type
  TFrmAguarde = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Timer1: TTimer;
    Label2: TLabel;
    Progresso: TProgressBar;
    Label3: TLabel;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAguarde: TFrmAguarde;
  X,y:Integer;
implementation

{$R *.dfm}

procedure TFrmAguarde.Timer1Timer(Sender: TObject);
begin
  For X := 1 to Progresso.Max Do
  Begin
  Progresso.Position := Progresso.Position + 1;
  Application.ProcessMessages;
  Sleep(200);
  End;

end;

end.
