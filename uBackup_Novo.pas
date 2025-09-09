unit uBackup_Novo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.Buttons, ShellApi, inifiles;

type
  TfrmBackupNovo = class(TForm)
    Panel1: TPanel;
    btnIniciarBackup: TButton;
    Animate1: TAnimate;
    FileOpenDialog1: TFileOpenDialog;
    Memo1: TMemo;
    GroupBox1: TGroupBox;
    lblCaminhoBackup: TLabel;
    edtPastaBackup: TEdit;
    SpeedButton1: TSpeedButton;
    lblBancoDados: TLabel;
    edtBancoDados: TEdit;
    lblIp: TLabel;
    edtIp: TEdit;
    lblPorta: TLabel;
    edtPorta: TEdit;
    RadioGroup1: TRadioGroup;
    procedure Validacao();
    function CaptureConsoleOutput(const ACommand, AParameters: String; AMemo: TMemo): Longint;
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnIniciarBackupClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtPastaBackupKeyPress(Sender: TObject; var Key: Char);
    procedure edtBancoDadosKeyPress(Sender: TObject; var Key: Char);
    procedure edtPortaKeyPress(Sender: TObject; var Key: Char);
    procedure edtIpKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    Arq_Ini: TIniFile;
  end;

var
  frmBackupNovo: TfrmBackupNovo;

implementation

uses
  UPrincipal;

{$R *.dfm}

function TfrmBackupNovo.CaptureConsoleOutput(const ACommand, AParameters: String; AMemo: TMemo): Longint;
 const
   CReadBuffer = 2400;
 var
   saSecurity: TSecurityAttributes;
   hRead: THandle;
   hWrite: THandle;
   suiStartup: TStartupInfo;
   piProcess: TProcessInformation;
   pBuffer: array[0..CReadBuffer] of AnsiChar;
   dRead: DWord;
   dRunning: DWord;
   bOK: Boolean;
   lastErr: LongWord;
   erro_memo: string;
   senha_bd : string;
 begin
   saSecurity.nLength := SizeOf(TSecurityAttributes);
   saSecurity.bInheritHandle := True;
   saSecurity.lpSecurityDescriptor := nil;

   if CreatePipe(hRead, hWrite, @saSecurity, 0) then
   begin
     FillChar(suiStartup, SizeOf(TStartupInfo), #0);
     suiStartup.cb := SizeOf(TStartupInfo);
     suiStartup.hStdInput := hRead;
     suiStartup.hStdOutput := hWrite;
     suiStartup.hStdError := hWrite;
     suiStartup.dwFlags := STARTF_USESTDHANDLES or STARTF_USESHOWWINDOW;
     suiStartup.wShowWindow := SW_HIDE;

     //SetEnvironmentVariable('PGPASSWORD', 'eficaz1478');
     SetEnvironmentVariable('PGPASSWORD', PChar(DecryptMsg(Arq_Ini.ReadString('Conexão Postgres', 'Password',  senha_bd), 3)));

     bOK := CreateProcess(nil, PChar(ACommand + ' ' + AParameters), @saSecurity, @saSecurity, True, NORMAL_PRIORITY_CLASS, nil, nil, suiStartup, piProcess);

    if bOK then
      begin
       repeat
         dRunning  := WaitForSingleObject(piProcess.hProcess, 100);
         Application.ProcessMessages();
         repeat
           dRead := 0;
           ReadFile(hRead, pBuffer[0], CReadBuffer, dRead, nil);
           pBuffer[dRead] := #0;
           AMemo.Lines.Add(String(pBuffer));
           //OutputDebugString(PChar(string(pBuffer)));
           //OutputDebugString(PChar(IntToStr(lastErr)));

           //GetExitCodeProcess(piProcess.hProcess, lastErr);

         until (dRead < CReadBuffer);

         GetExitCodeProcess(piProcess.hProcess, lastErr);

         //Coloquei este sleep pois ao terminar, estava travando a tela
         OutputDebugString(PChar('Acabou ---------->' + IntToStr(lastErr) ));
         //if (lastErr <> 259) and (lastErr >= 0) then

         if (lastErr <> 259)  then
           begin
            Sleep(1);
            //bOk := False;
            //CloseHandle(piProcess.hProcess);
            //CloseHandle(piProcess.hThread);
            //CloseHandle(hRead);
            //CloseHandle(hWrite);
            Break;
           end;

         Sleep(1000);
       until (dRunning <> WAIT_TIMEOUT);

        OutputDebugString(PChar('Final ---------->' + IntToStr(lastErr) ));

       CloseHandle(piProcess.hProcess);
       CloseHandle(piProcess.hThread);
      end;
     CloseHandle(hRead);
     CloseHandle(hWrite);

     if lastErr <> 0 then
      begin
        Application.MessageBox(PChar('Erro ao fazer Backup'), 'Erro com backup', MB_ICONHAND + MB_OK + MB_TASKMODAL);
      end
     else
      begin
        Application.MessageBox(PChar('Backup Concluído!'), PChar(Msg_Title), mb_IconInformation);
        Memo1.Lines.Clear;
        Memo1.Lines.Add('Backup Concluído!')
      end;

     Animate1.Active    := False;
     btnIniciarBackup.Enabled := True;
   end;
end;

procedure TfrmBackupNovo.edtBancoDadosKeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;

procedure TfrmBackupNovo.edtIpKeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;

procedure TfrmBackupNovo.edtPastaBackupKeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;

procedure TfrmBackupNovo.Validacao();

var
  pg_11_ini : string;

begin
    //Verifico se existe algum caminho para ser salvo o backup.
    if Trim(edtPastaBackup.Text) = '' then
    begin
      Application.MessageBox(PChar('Escolha a pasta para salvar os backups.'), 'Erro backup', MB_ICONHAND + MB_OK + MB_TASKMODAL);
      Abort;
    end;

    //Verifico se a pasta realmente está criada no computador, caso contrário tento criar.
    if not DirectoryExists(edtPastaBackup.Text) then
      begin
        if not ForceDirectories(edtPastaBackup.Text) then
          begin
            Application.MessageBox(PChar('A pasta selecionada para salvar os backups não existe!'), 'Erro backup', MB_ICONHAND + MB_OK + MB_TASKMODAL);
            Abort;
          end;
      end;

    //Se o caminho existir, vou salvar novamente no ini
    Arq_Ini.WriteString('Backup', 'Path Backup', edtPastaBackup.Text);

    //Verifico se existe a flag do pg 11
    pg_11_ini := Arq_Ini.ReadString('Backup', 'Postgres 11',  pg_11_ini);

    if LowerCase(Trim(pg_11_ini)) = '' then
      begin
        Arq_Ini.WriteString('Backup', 'Postgres 11', 'False');
      end;

end;

procedure TfrmBackupNovo.edtPortaKeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;

function ExecuteProcess(const FileName, Params: string; Folder: string; WaitUntilTerminated, WaitUntilIdle, RunMinimized: boolean;
  var ErrorCode: integer): boolean;
var
  CmdLine: string;
  WorkingDirP: pchar;
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
begin
  Result := true;
  CmdLine := '"' + FileName + '" ' + Params;
  if Folder = '' then Folder := ExcludeTrailingPathDelimiter(ExtractFilePath(FileName));
  ZeroMemory(@StartupInfo, SizeOf(StartupInfo));
  StartupInfo.cb := SizeOf(StartupInfo);
  if RunMinimized then
    begin
      StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
      StartupInfo.wShowWindow := SW_SHOWMINIMIZED;
    end;
  if Folder <> '' then WorkingDirP := pchar(Folder)
  else WorkingDirP := nil;
  if not CreateProcess(nil, pchar(CmdLine), nil, nil, false, 0, nil, WorkingDirP, StartupInfo, ProcessInfo) then
    begin
      Result := false;
      ErrorCode := GetLastError;
      exit;
    end;
  with ProcessInfo do
    begin
      CloseHandle(hThread);
      if WaitUntilIdle then WaitForInputIdle(hProcess, INFINITE);
      if WaitUntilTerminated then
        repeat
          Application.ProcessMessages;
        until MsgWaitForMultipleObjects(1, hProcess, false, INFINITE, QS_ALLINPUT) <> WAIT_OBJECT_0 + 1;
      CloseHandle(hProcess);
    end;
end;

function ShellExecuteAndWait(Operation, FileName, Parameter, Directory: String; Show: Word; bWait: Boolean): Longint;
var
  bOK: Boolean;
  Info: TShellExecuteInfo;
begin
  FillChar(Info, SizeOf(Info), Chr(0));
  Info.cbSize := SizeOf(Info);
  Info.fMask := SEE_MASK_NOCLOSEPROCESS;
  Info.lpVerb := PChar(Operation);
  Info.lpFile := PChar(FileName);
  Info.lpParameters := PChar(Parameter);
  Info.lpDirectory := PChar(Directory);
  Info.nShow := Show;
  bOK := Boolean(ShellExecuteEx(@Info));
  if bOK then
  begin
    if bWait then
    begin
      while WaitForSingleObject(Info.hProcess, 100) = WAIT_TIMEOUT do
        Application.ProcessMessages;
      bOK := GetExitCodeProcess(Info.hProcess, DWORD(Result));
    end
    else
      Result := 0;
  end;
  if not bOK then
    Result := -1;
end;

procedure TfrmBackupNovo.btnIniciarBackupClick(Sender: TObject);

var
  comando: String;
  pasta_pg: string;
  I: integer;
  Arq_Bck, driver, diretorio, pg_11_ini, senha_bd : string;

begin

  Validacao();

  btnIniciarBackup.Enabled := False;

  pg_11_ini := Arq_Ini.ReadString('Backup', 'Postgres 11',  pg_11_ini);

  driver := ExtractFileDrive(edtPastaBackup.Text);
  diretorio := ExtractFileDir(edtPastaBackup.Text);

  senha_bd := DecryptMsg(Arq_Ini.ReadString('Conexão Postgres', 'Password',  senha_bd), 3);

  {Verifico se foi escolhido algum driver, como o disco local C ou D ou qualquer outro, pois tentei salvar o backup
  diretamente no disco local de um pendrive e não deu certo, então se for um driver o escolhido, vou criar uma
  pasta chamada eficaz_backup, e salvar o backup nesta pasta}


  {
  if diretorio = (driver + '\') then
    begin
      ShowMessage('Será criada a pasta eficaz_backup no disco ' + driver +' para salvar seu backup.');
      if not DirectoryExists(edtPastaBackup.Text + 'eficaz_backup') then
        begin
          ForceDirectories(edtPastaBackup.Text + 'eficaz_backup');
          edtPastaBackup.Text := edtPastaBackup.Text + 'eficaz_backup\';
        end;
    end
  else
    begin
      if not DirectoryExists(edtPastaBackup.Text) then
        begin
          ForceDirectories(edtPastaBackup.Text);
        end;
    end;
  }
  Animate1.Active    := True;
  Animate1.CommonAVI := aviCopyFile;

  Memo1.Lines.Clear;

  Arq_Bck := edtPastaBackup.Text + edtBancoDados.Text + '_'+ Copy(DateToStr(date), 1, 2) + Copy(DateToStr(date), 4, 2) + Copy(DateToStr(date), 7, 4) + Copy(TimeToStr(time), 1, 2) + Copy(TimeToStr(time), 4, 2) + Copy(TimeToStr(time), 7, 2) + '.Backup';


  if (RadioGroup1.ItemIndex = 0) then
    begin
      pasta_pg := ExtractFilePath(Application.ExeName) + 'DllsPG\pg_dump.exe';
      Arq_Ini.WriteString('Backup', 'Postgres 11', 'False');
    end
  else
    begin
      pasta_pg := ExtractFilePath(Application.ExeName) + 'DllsPG11\pg_dump.exe';
      Arq_Ini.WriteString('Backup', 'Postgres 11', 'True');
    end;

  comando := ' --dbname=postgresql://postgres:'+ senha_bd +'@%s:%s/%s --format=custom --compress=6 --verbose --file=%s';

  CaptureConsoleOutput(pasta_pg, Format(comando, [edtIp.Text, edtPorta.Text, edtBancoDados.Text, Arq_Bck]), Memo1);

end;

procedure TfrmBackupNovo.FormCreate(Sender: TObject);

var
  pg_11_ini: string;

begin
  Arq_Ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Eficaz.Ini');

  edtPastaBackup.Text := Arq_Ini.ReadString('Backup', 'Path Backup', edtPastaBackup.Text);
  edtBancoDados.Text := Arq_Ini.ReadString('Conexão Postgres', 'Base Name', edtBancoDados.Text);
  edtIp.Text := Arq_Ini.ReadString('Conexão Postgres', 'Server Name', edtIp.Text);
  edtPorta.Text := Arq_Ini.ReadString('Conexão Postgres', 'Porta', edtPorta.Text);
  //edtPastaBackup.Text        := LeIni(Arq_Ini, 'Backup', 'Path Backup');
  //edtBancoDados.Text        := LeIni(Arq_Ini, 'Backup', 'Banco Dados');
  //edtIp.Text        := LeIni(Arq_Ini, 'Backup', 'Servidor');
  //edtPorta.Text              := LeIni(Arq_Ini, 'Backup', 'Porta');

  pg_11_ini := Arq_Ini.ReadString('Backup', 'Postgres 11',  pg_11_ini);

  if (LowerCase(Trim(pg_11_ini)) = '') or (LowerCase(Trim(pg_11_ini)) = 'false') then
    begin
      RadioGroup1.ItemIndex := 0;
    end
  else
    begin
      RadioGroup1.ItemIndex := 1;
    end;
end;

procedure TfrmBackupNovo.SpeedButton1Click(Sender: TObject);
begin
  FileOpenDialog1.Title :=  'Escolha a Pasta';
  if FileOpenDialog1.Execute then Begin
    begin
      //ShowMessage(Copy(dialogCaminhoPasta.FileName, Length(dialogCaminhoPasta.FileName), Length(dialogCaminhoPasta.FileName)));
      if Copy(FileOpenDialog1.FileName, Length(FileOpenDialog1.FileName), Length(FileOpenDialog1.FileName)) = '\' then
        edtPastaBackup.Text := FileOpenDialog1.FileName
      else
        edtPastaBackup.Text := FileOpenDialog1.FileName + '\';
    end;
  End;
end;

end.
