unit USplash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, jpeg, sGauge, StdCtrls, Vcl.Imaging.pngimage,
  acPNG;

type
  TFrmSplash = class(TForm)
    img1: TImage;
    Versao: TLabel;
    Data: TLabel;
    Progresso: TProgressBar;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSplash: TFrmSplash;

  procedure Splash;

implementation

uses UPrincipal;

{$R *.dfm}

Procedure Splash;
begin
  Application.CreateForm(TFrmSplash, FrmSplash);
 try
    FrmSplash.ShowModal;
  finally
    FrmSplash.Release;
  end;

end;

procedure TFrmSplash.FormCreate(Sender: TObject);
begin
 DrawControl(Progresso);
end;

end.
