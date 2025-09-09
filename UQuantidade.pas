unit UQuantidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, rxToolEdit, rxCurrEdit;

type
  TFrmQuantidade = class(TForm)
    Quantidade: TCurrencyEdit;
    procedure QuantidadeKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmQuantidade: TFrmQuantidade;

implementation

{$R *.dfm}

procedure TFrmQuantidade.QuantidadeKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) or (Key = #27) then
    Close;
end;

end.
