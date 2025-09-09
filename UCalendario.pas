unit UCalendario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Buttons;

type
  TFrmCalendario = class(TForm)
    MonthCalendar1: TMonthCalendar;
    Panel1: TPanel;
    btnRetorna: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRetornaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCalendario: TFrmCalendario;

implementation

{$R *.dfm}

procedure TFrmCalendario.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCalendario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
