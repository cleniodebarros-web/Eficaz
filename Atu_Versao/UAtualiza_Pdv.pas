unit UAtualiza_Pdv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,ShellApi;

type
  TFrmAtualiza = class(TForm)
    procedure FormCreate(Sender: TObject);
    function AddDeleteServico(comando: string): boolean;
    function WinExecAndWait32(FileName: String; WorkDir: String; Visibility: integer): integer;
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
function TFrmAtualiza.WinExecAndWait32(FileName: String; WorkDir: String; Visibility: integer): integer;
var
   zAppName: array[0..512] of char;
   zCurDir: array[0..255] of char;
   StartupInfo: TStartupInfo;
   ProcessInfo: TProcessInformation;
begin
  StrPCopy(zAppName,FileName);
  StrPCopy(zCurDir,WorkDir);
  FillChar(StartupInfo,Sizeof(StartupInfo),#0);
  StartupInfo.cb:=Sizeof(StartupInfo);
  StartupInfo.dwFlags:=STARTF_USESHOWWINDOW;
  StartupInfo.wShowWindow:=Visibility;

  if not CreateProcess(nil,zAppName,nil,nil,False,CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS,nil,zCurDir,StartupInfo,ProcessInfo) then
     Result:=-1
  else
  begin
     WaitforSingleObject(ProcessInfo.hProcess,INFINITE);
     GetExitCodeProcess(ProcessInfo.hProcess,DWORD(Result));
  end;
end;


function TFrmAtualiza.AddDeleteServico(comando: string): boolean;
var
   txt: TextFile;
   dir: string;
   ret: boolean;
begin
  ret:=False;
  try
     dir:=ExtractFilePath(Application.ExeName);
     AssignFile(txt, dir + 'User.bat');
     Rewrite(txt);
     Write(txt,comando);

     CloseFile(txt);
     if WinExecAndWait32(dir + 'User.bat',dir,SW_ShowNormal) = 0 then
         ret:=True;
     DeleteFile(dir + 'User.bat');
  finally
     AddDeleteServico:=ret;
  end;
end;



procedure TFrmAtualiza.FormCreate(Sender: TObject);
var
Janela: HWND;
Local, Server,local_dll,Server_dll, Old,kill: String;
begin
 KILL := 'TASKKILL /F /IM PDVEFICAZ.EXE' ;

 AddDeleteServico(KILL);

  Janela := FindWindow('TFrmPrincipal', nil);

  if Janela <> 0 then
    PostMessage(Janela, WM_QUIT, 0, 0);

  Old    := ExtractFilePath(ParamStr(0)) + 'PdvEficaz.Old';
  Local  := ExtractFilePath(ParamStr(0)) + 'PdvEficaz.Exe';
  Server := ExtractFilePath(ParamStr(0)) + '/Atualizar/PdvEficaz.Exe';
  DeleteFile(Old);
  RenameFile(Local, Old);
  CopyFile(PChar(Server), PChar(Local), False);

//AX6R32.DLL
Local_dll := ExtractFilePath(ParamStr(0)) + '/Atualizar/Dlls/AX6R32.DLL';
Server_dll :='c:\windows\system32\AX6R32.DLL';
CopyFile(PChar(Local_dll), PChar(Server_dll), False);

//BemaFI32.dll
Local_dll := ExtractFilePath(ParamStr(0)) + '/Atualizar/Dlls/BemaFI32.dll';
Server_dll :='c:\windows\system32\BemaFI32.dll';
CopyFile(PChar(Local_dll), PChar(Server_dll), False);

//BemaFI32.ini
Local_dll := ExtractFilePath(ParamStr(0)) + '/Atualizar/Dlls/Bemafi32.ini';
Server_dll :='c:\windows\system32\Bemafi32.ini';
CopyFile(PChar(Local_dll), PChar(Server_dll), False);

//BemaMFD.dll
Local_dll := ExtractFilePath(ParamStr(0)) + '/Atualizar/Dlls/BemaMFD.dll';
Server_dll :='c:\windows\system32\BemaMFD.dll';
CopyFile(PChar(Local_dll), PChar(Server_dll), False);

//BemaMFD2.dll
Local_dll := ExtractFilePath(ParamStr(0)) + '/Atualizar/Dlls/BemaMFD2.dll';
Server_dll :='c:\windows\system32\BemaMFD2.dll';
CopyFile(PChar(Local_dll), PChar(Server_dll), False);

//BemaMFD3.dll
Local_dll := ExtractFilePath(ParamStr(0)) + '/Atualizar/Dlls/BemaMFD3.dll';
Server_dll :='c:\windows\system32\BemaMFD3.dll';
CopyFile(PChar(Local_dll), PChar(Server_dll), False);

//DAO350.DLL
Local_dll := ExtractFilePath(ParamStr(0)) + '/Atualizar/Dlls/DAO350.DLL';
Server_dll :='c:\windows\system32\DAO350.DLL';
CopyFile(PChar(Local_dll), PChar(Server_dll), False);

//DarumaFrameWork.dll
Local_dll := ExtractFilePath(ParamStr(0)) + '/Atualizar/Dlls/DarumaFrameWork.dll';
Server_dll :='c:\windows\system32\DarumaFrameWork.dll';
CopyFile(PChar(Local_dll), PChar(Server_dll), False);

//DarumaFrameWork.xml
Local_dll := ExtractFilePath(ParamStr(0)) + '/Atualizar/Dlls/DarumaFrameWork.xml';
Server_dll :='c:\windows\system32\DarumaFrameWork.xmll';
CopyFile(PChar(Local_dll), PChar(Server_dll), False);

//GNE_Framework.dll
Local_dll := ExtractFilePath(ParamStr(0)) + '/Atualizar/Dlls/GNE_Framework.dll';
Server_dll :='c:\windows\system32\GNE_Framework.dll';
CopyFile(PChar(Local_dll), PChar(Server_dll), False);

//hwinterface.sys
Local_dll := ExtractFilePath(ParamStr(0)) + '/Atualizar/Dlls/hwinterface.sys';
Server_dll :='c:\windows\system32\hwinterface.sys';
CopyFile(PChar(Local_dll), PChar(Server_dll), False);

//lebin.dll
Local_dll := ExtractFilePath(ParamStr(0)) + '/Atualizar/Dlls/lebin.dll';
Server_dll :='c:\windows\system32\lebin.dll';
CopyFile(PChar(Local_dll), PChar(Server_dll), False);

//LeituraMFDBin.dll
Local_dll := ExtractFilePath(ParamStr(0)) + '/Atualizar/Dlls/LeituraMFDBin.dll';
Server_dll :='c:\windows\system32\LeituraMFDBin.dll';
CopyFile(PChar(Local_dll), PChar(Server_dll), False);

//libeay32.dll
Local_dll := ExtractFilePath(ParamStr(0)) + '/Atualizar/Dlls/libeay32.dll';
Server_dll :='c:\windows\system32\libeay32.dll';
CopyFile(PChar(Local_dll), PChar(Server_dll), False);


//MSJET35.dll
Local_dll := ExtractFilePath(ParamStr(0)) + '/Atualizar/Dlls/MSJET35.dll';
Server_dll :='c:\windows\system32\MSJET35.dll';
CopyFile(PChar(Local_dll), PChar(Server_dll), False);

//QrCode_DarumaFramework.dll
Local_dll := ExtractFilePath(ParamStr(0)) + '/Atualizar/Dlls/QrCode_DarumaFramework.dll';
Server_dll :='c:\windows\system32\QrCode_DarumaFramework.dll';
CopyFile(PChar(Local_dll), PChar(Server_dll), False);

//sign_bema.dll
Local_dll := ExtractFilePath(ParamStr(0)) + '/Atualizar/Dlls/sign_bema.dll';
Server_dll :='c:\windows\system32\sign_bema.dll';
CopyFile(PChar(Local_dll), PChar(Server_dll), False);

//WS_Framework.dll
Local_dll := ExtractFilePath(ParamStr(0)) + '/Atualizar/Dlls/WS_Framework.dll';
Server_dll :='c:\windows\system32\WS_Framework.dll';
CopyFile(PChar(Local_dll), PChar(Server_dll), False);



  ShellExecute(handle,'open',PChar(local), '','',SW_SHOWNORMAL);


  KILL := 'TASKKILL /F /IM Atu_Versao_Pdv.EXE' ;

  AddDeleteServico(KILL);

 // WinExec(PChar(Local), SW_SHOWNORMAL);

end;

end.
