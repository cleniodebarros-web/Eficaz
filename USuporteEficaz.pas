unit USuporteEficaz;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.OleCtrls, SHDocVw,Registry;

type
  TFrmSuporteEficaz = class(TForm)
    WebBrowser1: TWebBrowser;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSuporteEficaz: TFrmSuporteEficaz;
  procedure registroeficaz;

implementation
uses
UPrincipal;

{$R *.dfm}

procedure registroeficaz;
Var
Registro:TRegistry;
chave:string;
valor:integer;
begin
chave := 'SOFTWARE\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_BROWSER_EMULATION\';
valor := 11001;
  Registro := TRegistry.Create;
  Registro.RootKey:= HKEY_CURRENT_USER;
  registro.OpenKey(chave,false);
  Registro.WriteInteger('Eficaz.exe', valor);

 {
  begin
    valor := Registro.ReadString('Eficaz.exe');
  end;
  }
  registro.CloseKey;
  registro.Free;
end;


procedure TFrmSuporteEficaz.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action := caFree;
end;


procedure TFrmSuporteEficaz.FormShow(Sender: TObject);
begin

 try
  registroeficaz;

      // Eficaz: WebBrowser1.Navigate('https://tawk.to/chat/607837eb067c2605c0c2b656/1f3apkseu');

      //Elmer: '/https://tawk.to/chat/5eacaf9d203e206707f8c3a6/default'

   if FrmPrincipal.config.FieldByName('CHAT').AsString <> '' then
   WebBrowser1.Navigate(FrmPrincipal.config.FieldByName('CHAT').AsString)
   else
   WebBrowser1.Navigate('https://tawk.to/chat/607837eb067c2605c0c2b656/1ggcmc16q');


  // WBLoadHTML( WebBrowser1,'<a>GOTO</a>' +
  //         '<b>Show Delphi</b>');

 // WBLoadHTML( WebBrowser1,'<p>Confira o <a href="https://tawk.to/chat/607837eb067c2605c0c2b656/1f3apkseu//" target="_blank" rel="noopener noreferrer">freeCodeCamp</a>.</p>');

  {
  WBLoadHTML( WebBrowser1,'<!--[if IE]>'+
  '<object classid="clsid:25336920-03F9-11CF-8FD0-00AA00686F13" data="https://tawk.to/chat/607837eb067c2605c0c2b656/1f3apkseu/">'+
  '<p>conteúdo alternativo para tecnologias que não suportam OBJECT</p>'+
  '</object>'+
  '<![endif]-->'+
  '<!--[if !IE]> <-->'+
  '<object type="text/html" data="https://tawk.to/chat/607837eb067c2605c0c2b656/1f3apkseu/">'+
  '<p>conteúdo alternativo para tecnologias que não suportam OBJECT</p>'+
  '</object>'+
  '<!--> <![endif]-->');

  }

  Application.ProcessMessages;
  except

  end;



end;

end.
