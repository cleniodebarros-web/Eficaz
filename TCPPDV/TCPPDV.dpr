program TCPPDV;

uses
  Forms,
  Windows,
  Fiado in 'Fiado.pas' {Form_Fiado},
  UUsuarios_Logados in '..\UUsuarios_Logados.pas';

{$R *.res}

var
Handle: THandle;
begin
  Handle := FindWindow('TForm_Fiado', Nil);
  if Handle <> 0 then
  begin
    Application.MessageBox('Este programa já está sendo executado.', 'TCPPdv', mb_IconWarning);
    Halt;
  end;
  Application.Initialize;
  Application.Title := 'TCPPdv';
  Application.CreateForm(TForm_Fiado, Form_Fiado);
  Application.Run;
end.
