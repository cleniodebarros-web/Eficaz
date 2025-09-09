unit UComanda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFrmComanda = class(TForm)
    Comanda: TEdit;
    procedure ComandaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmComanda: TFrmComanda;

implementation

{$R *.dfm}

procedure TFrmComanda.ComandaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    ModalResult := mrOK;

  if Key = #27 then
    Close;
end;

end.
