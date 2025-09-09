{

  Unit para retornar a quantidade de usuários conectados num banco Firebird

  Sintaxe:

    function UsuariosLogados(DBPath, Username, Password) : integer

  DBPath   -> path/nome do arquivo FDB. Ex: c:\programa\dados.fdb ou 192.168.0.1:c:\dados\banco.fdb
  Username -> Usuário que efetuará a conexão, geralmente SYSDBA
  Password -> senha para validar o usuário

  RETORNO
  -Retorna a quantidade(integer) de usuários conectados no banco, mais 1 referente
  a própria conexão que a Unit cria, então se existir 2 usuários conectados, o
  resultado será 3.

  -Retorna -1 caso acontecer algum erro e não ser capaz de conectar ao banco

  Baseado no exemplo criado por: Willian de Carvalho
  http://www.delphi.eti.br/downloads.php?id=4347

  -:-
  12/12/2006
  Enio Marconcini
  email/msn/gtalk: eniorm at gmail dot com
  skype: eniorm
  www.delfosistemas.com

}

unit UUsuarios_Logados;

interface

uses
  Windows, SysUtils, Dialogs;

const
  isc_dpb_version1    = 1;
  isc_dpb_user_name   = 28;
  isc_dpb_password    = 29;

  isc_info_end        = 1;
  isc_info_truncated  = 2;
  isc_info_error      = 3;
  isc_info_user_names = 53;

  IBASE_DLL           = 'GDS32.DLL'; // 'FBCLIENT.DLL';
  KILOBYTE            = 1024;

type
  ISC_LONG            = Longint;
  ISC_STATUS          = ISC_LONG;
  ISC_STATUS_VECTOR   = array[0..19] of ISC_STATUS;
  PSTATUS_VECTOR      = ^ISC_STATUS_VECTOR;
  PPSTATUS_VECTOR     = ^PSTATUS_VECTOR;

  Tisc_db_handle      = Pointer;
  pisc_db_handle      = ^Tisc_db_handle;

  TParamBlock         = array [0..KILOBYTE-1] of Char;
  TLargePB            = array [0..(4*KILOBYTE)-1] of Char;
  TSmallPB            = array [0..(KILOBYTE div 4)-1] of Char;

var
  E : Exception;
  UserFound: boolean;
  Mode: (mdDBName, mdUserName, mdPassword);
  s, DBName, UserName, Password: string;

  ErrorCode: ISC_STATUS;
  StatusVector: ISC_STATUS_VECTOR;
  DBHandle: Tisc_db_handle;
  DPB: TParamBlock;        //parameter block for database connection
  DPBLen: Integer;         //length of Paramblock
  ItemList:  TSmallPB;
  UserNames: TLargePB;
  UserCount: Integer;

  Item,           //InfoItem we are testing for
  Posicao,        //marker for position in array
  Len,            //Length of section
  namelength: SmallInt;
  UserStr: array[0..255] of char;

function isc_interprete(buffer: PChar; status_vector_ptr: PPSTATUS_VECTOR): ISC_STATUS;
  stdcall; external IBASE_DLL name 'isc_interprete';

function isc_attach_database(status_vector: PSTATUS_VECTOR; db_name_length: Short;
  db_name: PChar; db_handle: pisc_db_handle; parm_buffer_length: Short;
  parm_buffer: PChar): ISC_STATUS; stdcall; external IBASE_DLL name 'isc_attach_database';

function isc_database_info(status_vector: PSTATUS_VECTOR; db_handle: pisc_db_handle;
  item_list_buffer_length: Smallint; item_list_buffer: Pointer;
  result_buffer_length: Smallint; result_buffer: Pointer): ISC_STATUS;
  stdcall; external IBASE_DLL name 'isc_database_info';

function isc_vax_integer(result_buffer : PChar; result_length : SmallInt): ISC_LONG;
  stdcall; external IBASE_DLL name 'isc_vax_integer';

function isc_detach_database(status_vector: PSTATUS_VECTOR; db_handle:
  pisc_db_handle): ISC_STATUS; stdcall; external IBASE_DLL name 'isc_detach_database';

  procedure Error;
  procedure BuildPBString( var PB: array of char; var PBLen: Integer; item: byte; contents: string);
  function UsuariosLogados(DBFile,Username,Password : String) : Integer;


implementation

procedure Error;
  var
    buffer: array[0..511] of char;
    ErrorMessages, lastMsg: string;
    pStatus: PSTATUS_VECTOR;
begin
    fillchar(buffer,512,#0);
    pStatus:=@StatusVector;
    ErrorMessages:='';
    repeat
      ErrorCode := isc_interprete( @buffer, @pstatus);
      if lastMsg <> strPas( buffer) then
      begin
        lastMsg := strPas( buffer);
        if length(ErrorMessages) <> 0 then ErrorMessages := ErrorMessages+#13#10;
        ErrorMessages := ErrorMessages+lastMsg;
      end;
    until ErrorCode = 0;
    raise Exception.Create(ErrorMessages);
  end;

procedure BuildPBString( var PB: array of char; var PBLen: Integer; item: byte; contents: string);
  //Add a string value to a parameter block
  var len: Integer;
 begin
    PB[PBLen] := char(item);
    inc(PBLen);
    len:=Length(Contents);
    PB[PBLen] := char(len);
    inc(PBLen);
    StrPCopy(@PB[PBLen],Contents);
    inc(PBLen,len);
end;

// =============================================================================
// =============================================================================

function UsuariosLogados(DBFile,Username,Password : String) : Integer;
Var
  i: Integer;
begin
try
UserFound := false;
Mode := mdDBName;
//DBName := '';
DBName := trim(DBFile);

if ( UpperCase(ExtractFileExt(DBName)) <> '.FDB') then begin
  raise EAccessViolation.Create('Formato de arquivo inválido!');
  Abort;
end;

//UserName := '';
UserName := Trim(Username);
//Password := '';
Password := trim(Password);
if (DBName = '') or (UserName = '') then
   halt(2);
for i:= low(StatusVector) to high(StatusVector) do StatusVector[i] := 0;
   DBHandle := nil;
fillchar(DPB,sizeof(DPB),#0);
DPB[0] := char(isc_dpb_version1);
DPBLen := 1;
BuildPBString(DPB,DPBLen,isc_dpb_user_name,Username);
BuildPBString(DPB,DPBLen,isc_dpb_password,Password);
ErrorCode := isc_attach_database(@StatusVector, Length(DBName), PChar(DBName),
@DBHandle, DPBLen, @DPB);
if ErrorCode <> 0 then
   begin
   Error;
   halt;
   end;
fillchar(itemlist, sizeof(itemlist),#0);
ItemList[0] := char(isc_info_user_names);
fillchar(UserNames, sizeof(UserNames),#0);
ErrorCode := isc_database_info(@StatusVector, @DBHandle, 1, @itemlist, 1024, @UserNames);
if ErrorCode = 0 then
   begin
   item:=0;
   UserCount:=0;
   while not ((((UserNames[item])=char(isc_info_end)) or ((UserNames[item])=char(isc_info_error))) or ((UserNames[item])=char(isc_info_truncated))) do
      begin
      posicao:=item;                                      //isc_info_user_name
      inc(posicao);                                       //start of length byte pair
      len := isc_vax_integer(@UserNames[posicao],2);      //read the two-byte length and save it for Ron.
      inc(posicao,2);                                     //move forward to byte telling us length of name
      UserStr:='';
      NameLength:=byte(UserNames[posicao])+1;
      fillChar(UserStr,256,#0);
      for i:=1 to namelength-1 do UserStr[i-1] := UserNames[posicao+i];
      if not UserFound and (AnsiCompareText(UserName, UserStr) = 0) then
         begin
         UserFound := true;
         end;
      inc(UserCount);
      inc(item,len+3);
      end;
   Result := UserCount;
   exitcode := ord(UserCount > 1);
   end
else
   Error;
if assigned(DBHandle) then
   begin
   ErrorCode := isc_detach_database(@StatusVector, @DBHandle);
   if ErrorCode <> 0 then
      Error;
   end;
except
   on E:Exception do
   begin
   s := E.Message + #13#10;
   ShowMessage('Houve um erro: '+ s[1]);
   s := E.Message + #13#10;
   WriteFile(GetStdHandle(STD_ERROR_HANDLE), s[1], Length(s), DWORD(i), nil);
   Result := -1;
   ExitCode := 2;
   end;
end;
end;


end.
