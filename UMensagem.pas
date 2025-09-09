unit UMensagem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  TFrmMensagem = class(TForm)
    Bevel1: TBevel;
    Texto: TMemo;
    btnRetorna: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMensagem: TFrmMensagem;
  procedure GetMensagem(Mensagem: String);

implementation

{$R *.dfm}

procedure GetMensagem(Mensagem: String);
begin
  FrmMensagem.Texto.Lines.Clear;
  FrmMensagem.Texto.Lines.Add(Mensagem);
  
  FrmMensagem.ShowModal;
end;

end.
