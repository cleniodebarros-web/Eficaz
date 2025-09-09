unit UConsulta_Connecta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.StdCtrls,IdHTTP,
  IdBaseComponent, IdComponent, IdServerIOHandler, IdSSL, IdSSLOpenSSL,
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack,DBXJSON ;

  Const
StrJson =
  '['+
  '{"EventType":49,"Code":"234","EventDate":"20050202", "Result":1},'+
  '{"EventType":48,"Code":"0120","EventDate":"20130201", "Group":"g1"}'+
  ']';

type
  TFrmConsulta_Connecta = class(TForm)
    Label1: TLabel;
    Label5: TLabel;
    ENDERECO: TEdit;
    NUMERO: TEdit;
    Label9: TLabel;
    MUNICIPIO: TEdit;
    Label7: TLabel;
    BAIRRO: TEdit;
    ESTADO: TComboBox;
    Label8: TLabel;
    Label10: TLabel;
    CEP: TMaskEdit;
    Label4: TLabel;
    Nome: TEdit;
    Label15: TLabel;
    CNPJ: TMaskEdit;
    Label2: TLabel;
    Consultar: TButton;
    Memo1: TMemo;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    procedure ConsultarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  FrmConsulta_Connecta: TFrmConsulta_Connecta;
  procedure ParseJson(aStringJson : string);

implementation
uses
UPrincipal,UConnecta;


{$R *.dfm}

procedure ParseJson(aStringJson : string);
var
  LJsonArr   : TJSONArray;
  LJsonValue : TJSONValue;
  LItem      : TJSONValue;
  TXT        :TextFile;
begin
   LJsonArr    := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(aStringJson),0) as TJSONArray;
   AssignFile(TXT,'C:\eficaz7\NewEficazPG\teste.txt');
   Rewrite(TXT);

   for LJsonValue in LJsonArr do
   begin
      for LItem in TJSONArray(LJsonValue) do
        Writeln(TXT,Format('%s : %s',[TJSONPair(LItem).JsonString.Value, TJSONPair(LItem).JsonValue.Value]));
     Writeln;
   end;
   Close(TXT);

end;


procedure TFrmConsulta_Connecta.ConsultarClick(Sender: TObject);
var
Http: TIdHTTP;
Parametros: TStringList;
Resposta, API_KEY,url,CNPJ,login, password,idclient,consulta,tpdocumento,documento,cep,telefone,uf : string;

begin
   API_KEY    := 'bd43be98abc3b5418e1fbe0ff9f2c6f1';
  Parametros := TStringList.Create;

  Parametros.Add('login=415779');
  Parametros.Add('password=141943');
  Parametros.Add('idclient=129');
  Parametros.Add('apikey='+ API_KEY);
  Parametros.Add('documento=18278820000105');
  Parametros.Add('tipodocumento=f');
  Parametros.Add('cep=');
  Parametros.Add('telefone=');
  Parametros.Add('uf=');
  Parametros.Add('estatica=s');
  Parametros.Add('tiporesposta=j');
  Parametros.Add('agregados=');
  Parametros.Add('consulta=CREDNET_LIGHT');

  Http := TIdHTTP.Create(nil);
  Http.Request.ContentEncoding := 'multipart/form-data';
  Http.Request.ContentType     := 'application/x-www-form-urlencoded';
  http.Request.UserAgent       := 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko';
  http.Request.Method          := 'POST';
  Http.ConnectTimeout          := 3000;
  Http.IOHandler               := IdSSLIOHandlerSocketOpenSSL1;

  URL := 'https://sistemas.connectsa.com.br/mercurio/ws_consulta/';

  Resposta := Http.Post(url, Parametros);

  Begin
    try
      ParseJson(Resposta);

    except
      on E: Exception do
        Writeln(E.ClassName, ': ', E.Message);
    end;
    //Readln;
  end;

     Memo1.Text := Resposta;

  {
  try


    // Memo1.Clear;


     //Memo1.Lines.Add('');

    Memo1.Lines.Add(TPROTESTOClass.FromJsonString(Resposta).alerta);
    Memo1.Lines.Add(TPROTESTOClass.FromJsonString(Resposta).dataMaisAntigo);
    Memo1.Lines.Add(TPROTESTOClass.FromJsonString(Resposta).dataMaisRecente);
    Memo1.Lines.Add(TPROTESTOClass.FromJsonString(Resposta).nomeMaisRecente);
    Memo1.Lines.Add(TPROTESTOClass.FromJsonString(Resposta).nomeRegistro);
    Memo1.Lines.Add(TPROTESTOClass.FromJsonString(Resposta).periodo);
    Memo1.Lines.Add(TPROTESTOClass.FromJsonString(Resposta).quantidade);
    Memo1.Lines.Add(TPROTESTOClass.FromJsonString(Resposta).valorTotal);


  except
     //Application.MessageBox('Servidor help não ativo favor verificart!', PChar(Msg_Title), mb_IconInformation);

     on e:Exception do
        begin
          Application.MessageBox(PChar('Erro:' + #13 +
            'Erro: ' + e.Message), 'Erro', MB_ICONSTOP + MB_TASKMODAL);
        end;
  end;
   }

  Http.Free;
  Parametros.Free;


end;


procedure TFrmConsulta_Connecta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.

