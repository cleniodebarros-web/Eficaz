unit UAtualiza_Hotel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  TFrmAtualiza = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAtualiza: TFrmAtualiza;

implementation

uses
  Funcoes;

{$R *.dfm}

procedure TFrmAtualiza.FormCreate(Sender: TObject);
var
Janela: HWND;
Local, Server, Old: String;
begin
  Janela := FindWindow('TFrmPrincipal', nil);

  if Janela <> 0 then
    PostMessage(Janela, WM_QUIT, 0, 0);

  Old    := ExtractFilePath(ParamStr(0)) + 'EficazHotel.Old';
  Local  := ExtractFilePath(ParamStr(0)) + 'EficazHotel.Exe';
  Server := LeIni(ExtractFilePath(ParamStr(0)) + 'SysRest.Ini', 'Atualização', 'Download') + 'EficazHotel.Exe';

  DeleteFile(Old);
  RenameFile(Local, Old);
  CopyFile(PChar(Server), PChar(Local), False);

  WinExec(PChar(Local), SW_SHOWNORMAL);
end;

end.
