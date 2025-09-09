unit UHistorico_Versoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TFrmHistorico_Versoes = class(TForm)
    Panel1: TPanel;
    btnRetorna: TBitBtn;
    Memo1: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRetornaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmHistorico_Versoes: TFrmHistorico_Versoes;

implementation

{$R *.dfm}

procedure TFrmHistorico_Versoes.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmHistorico_Versoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
