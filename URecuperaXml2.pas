unit URecuperaXml2;

interface

uses GifImage ,UrlMon, MSHtml, ACBrUtil, pcnAuxiliar, ActiveX, JPEG,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OleCtrls, SHDocVw, ExtCtrls, ComCtrls, WinInet, Menus;

type
  TfrmRecuperaXml2 = class(TForm)
    PgSefaz: TPageControl;
    tsCaptcha: TTabSheet;
    tsConsultaCompleta: TTabSheet;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edtChaveNFe: TEdit;
    edtCaptcha: TEdit;
    Panel4: TPanel;
    Image1: TImage;
    Label3: TLabel;
    Panel3: TPanel;
    btnNovaConsulta: TButton;
    btnGerarXML: TButton;
    btnPegarHTML: TButton;
    lblStatus: TLabel;
    ProgressBar1: TProgressBar;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Memo2: TMemo;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    WBXML: TWebBrowser;
    TabSheet3: TTabSheet;
    Label4: TLabel;
    Label5: TLabel;
    WebBrowser1: TWebBrowser;
    btnSair: TButton;
    procedure btnPegarHTMLClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure WebBrowser1DocumentComplete(Sender: TObject; const pDisp: IDispatch; var URL: OleVariant);
    procedure WebBrowser1ProgressChange(Sender: TObject; Progress, ProgressMax: Integer);
    procedure btnNovaConsultaClick(Sender: TObject);
    procedure btnGerarXMLClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPegarXMLClick(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure edtChaveNFeKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtCaptchaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
    function DownloadFile(SourceFile, DestFile: string): Boolean;
    function StripHTML(S: string): string;
    procedure DeleteIECache;
    procedure PegarHTML;
    procedure GeraXml;
    procedure NovaConsulta;
    procedure MostrarImagem;
  public
    { Public declarations }
    FPath: string;
  end;

var
  frmRecuperaXml2: TfrmRecuperaXml2;
  dest,WinTempDir: String;

implementation

uses  ACBrHTMLtoXML;

{$R *.dfm}

procedure TfrmRecuperaXml2.DeleteIECache;
var
  lpEntryInfo: PInternetCacheEntryInfo;
  hCacheDir: LongWord;
  dwEntrySize: LongWord;
begin { DeleteIECache }
  dwEntrySize := 0;

  FindFirstUrlCacheEntry(nil, TInternetCacheEntryInfo(nil^), dwEntrySize);

  GetMem(lpEntryInfo, dwEntrySize);

  if dwEntrySize>0 then
    lpEntryInfo^.dwStructSize := dwEntrySize;

  hCacheDir := FindFirstUrlCacheEntry(nil, lpEntryInfo^, dwEntrySize);

  if hCacheDir<>0 then
  begin
    repeat
      DeleteUrlCacheEntry(lpEntryInfo^.lpszSourceUrlName);
      FreeMem(lpEntryInfo, dwEntrySize);
      dwEntrySize := 0;
      FindNextUrlCacheEntry(hCacheDir, TInternetCacheEntryInfo(nil^), dwEntrySize);
      GetMem(lpEntryInfo, dwEntrySize);
      if dwEntrySize>0 then
        lpEntryInfo^.dwStructSize := dwEntrySize;
    until not FindNextUrlCacheEntry(hCacheDir, lpEntryInfo^, dwEntrySize)
  end; { hCacheDir<>0 }
  FreeMem(lpEntryInfo, dwEntrySize);

  FindCloseUrlCache(hCacheDir)
end; { DeleteIECache }


function TfrmRecuperaXml2.DownloadFile(SourceFile, DestFile: string): Boolean;
const BufferSize = 1024;
var
  hSession, hURL: HInternet;
  Buffer: array[1..BufferSize] of Byte;
  BufferLen: DWORD;
  f: File;
  sAppName: string;
begin
 sAppName := ExtractFileName(Application.ExeName);
 hSession := InternetOpen(PChar(sAppName),INTERNET_OPEN_TYPE_PRECONFIG,nil, nil, 0);
 try
   hURL := InternetOpenURL(hSession,PChar(SourceFile),nil,0,0,0);
   try
     AssignFile(f, DestFile);
     Rewrite(f,1);
     repeat
       InternetReadFile(hURL, @Buffer,SizeOf(Buffer), BufferLen);
       BlockWrite(f, Buffer, BufferLen)
     until BufferLen = 0;
     CloseFile(f);
     Result := True;
   finally
     InternetCloseHandle(hURL)
   end
 finally
   InternetCloseHandle(hSession)
 end;
end;
{begin
  try
    Result := UrlDownloadToFile(nil, PChar(SourceFile), PChar(DestFile), 0,
      nil) = 0;
  except
    Result := False;
  end;
end;   }

function TfrmRecuperaXml2.StripHTML(S: string): string;
var
  TagBegin, TagEnd, TagLength: integer;
begin
  TagBegin := Pos( '<', S);      // search position of first <
  while (TagBegin > 0) do begin  // while there is a < in S
    TagEnd    := Pos('>', S);              // find the matching >
    TagLength := TagEnd - TagBegin + 1;
    Delete(S, TagBegin, TagLength);     // delete the tag
    TagBegin := Pos( '<', S);            // search for next <
  end;
  Result := S;                   // give the result
end;

procedure TfrmRecuperaXml2.btnPegarHTMLClick(Sender: TObject);
begin
  PegarHTML;
end;

procedure TfrmRecuperaXml2.PegarHTML;
begin
  edtChaveNFe.Text := OnlyNumber(edtChaveNFe.Text);
  if not ValidarChave('NFe'+edtChaveNFe.Text) then
  begin
     MessageDlg('Chave Inválida.',mtError,[mbok],0);
     edtChaveNFe.SetFocus;
     exit;
  end;
  if trim(edtCaptcha.Text) = '' then
  begin
     MessageDlg('Digite o valor da imagem.',mtError,[mbok],0);
     edtCaptcha.SetFocus;
     exit;
  end;
  Memo2.Lines.Clear;
  //btnSalvarXML.Enabled    := False;
  btnPegarHTML.Enabled    := False;
  btnNovaConsulta.Enabled := False;
  btnGerarXML.Enabled     := False;
  try
     WebBrowser1.OleObject.Document.all.Item('ctl00$ContentPlaceHolder1$txtChaveAcessoCompleta', 0).value := edtChaveNFe.Text;
     WebBrowser1.OleObject.Document.all.Item('ctl00$ContentPlaceHolder1$txtCaptcha', 0).value := edtCaptcha.Text;
     WebBrowser1.OleObject.Document.all.Item('ctl00$ContentPlaceHolder1$btnConsultar', 0).click;
  except
     btnNovaConsulta.Enabled := True;
     raise;
  end;
  PageControl1.ActivePageIndex := 0;
end;

procedure TfrmRecuperaXml2.FormCreate(Sender: TObject);
begin
  NovaConsulta;
end;

procedure TfrmRecuperaXml2.WebBrowser1DocumentComplete(Sender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
var
  k, i: Integer;
  Source: string;
  textoNFe : IHTMLDocument2;
begin
  Application.ProcessMessages;
  if WebBrowser1.LocationURL = 'http://www.nfe.fazenda.gov.br/portal/consulta.aspx?tipoConsulta=completa&tipoConteudo=XbSeqxE8pl8=' then
  begin
       btnPegarHTML.Enabled := True;
  end
  else if WebBrowser1.LocationURL = 'https://www.nfe.fazenda.gov.br/portal/visualizacaoNFe/completa/Default.aspx' then
  begin
       WebBrowser1.Navigate('https://www.nfe.fazenda.gov.br/PORTAL/visualizacaoNFe/completa/impressao.aspx');
  end
  else if WebBrowser1.LocationURL = 'http://www.nfe.fazenda.gov.br/portal/consultaCompleta.aspx?tipoConteudo=XbSeqxE8pl8=' then
  begin
      textoNFe := WebBrowser1.Document as IHTMLDocument2;
      repeat
         Application.ProcessMessages;
      until Assigned(textoNFe.body);
      Memo2.Lines.Text := StripHTML(textoNFe.body.innerHTML);
      Memo2.Lines.Text := StringReplace(Memo2.Lines.Text,'&nbsp;','',[rfReplaceAll, rfIgnoreCase]);
      i := 0;
      while i < memo2.Lines.Count-1 do
      begin
        if trim(Memo2.Lines[i]) = '' then
        begin
          Memo2.Lines.Delete(i);
          i := i - 1;
        end;
        if pos('function',Memo2.lines[i])>0 then
        begin
          Memo2.Lines.Delete(i);
          i := i - 1;
        end;
        if pos('document',Memo2.lines[i])>0 then
        begin
          Memo2.Lines.Delete(i);
          i := i - 1;
        end;
        if pos('{',Memo2.lines[i])>0 then
        begin
          Memo2.Lines.Delete(i);
          i := i - 1;
        end;
        if pos('}',Memo2.lines[i])>0 then
        begin
          Memo2.Lines.Delete(i);
          i := i - 1;
        end;
        i := i + 1;
    end;
    Image1.Picture      := nil;
    btnGerarXML.Enabled := True;
    GeraXml;
  end
  else if WebBrowser1.LocationURL = 'https://www.nfe.fazenda.gov.br/portal/inexistente_completa.aspx' then
  begin
    MessageDlg('NF-e INEXISTENTE na base nacional, favor consultar esta NF-e no site da SEFAZ de origem.',mtError,[mbok],0);
    Image1.Picture          := nil;
    btnGerarXML.Enabled     := True;
    btnNovaConsulta.Enabled := True;
  end
  else
  begin
    MessageDlg('Erro carregando URL: '+WebBrowser1.LocationURL,mtError,[mbok],0);
    Image1.Picture          := nil;
    btnGerarXML.Enabled     := True;
    btnNovaConsulta.Enabled := True;
  end;
  pgSefaz.ActivePage:=tsCaptcha;
  edtChaveNFe.SetFocus;
  MostrarImagem;
end;

procedure TfrmRecuperaXml2.MostrarImagem;
var viewObject : IViewObject;
    r : TRect;
    bitmapdst, bitmap : TBitmap;
    RectOrigem, RectDestino: TRect;
    BitmapFont, BitmapDest, MyBMPImage: TBitmap;
begin
  try
      if WebBrowser1.Document <> nil then
      begin
          WebBrowser1.Document.QueryInterface(IViewObject, viewObject);
          if Assigned(viewObject) then
          begin
              try
                  bitmap := TBitmap.Create;
                  bitmapdst := TBitmap.Create;
                  try
                      bitmap.Height := WebBrowser1.Height;
                      bitmap.Width := WebBrowser1.Width;
                      r  := Rect(0, 0, bitmap.width-1, bitmap.height-1);
                      viewObject.Draw(DVASPECT_CONTENT, 1, nil, nil, Application.Handle, bitmap.Canvas.Handle, @r, nil, nil, 0);
                      RectOrigem  := Rect(20, 291, 372, 568);
                      RectDestino := Rect(0, 0, 351, 340);
                      Bitmapdst.Width  := 272;
                      Bitmapdst.Height := 154;
                      Bitmapdst.Canvas.CopyRect(RectDestino, Bitmap.Canvas, RectOrigem);
                      with TJPEGImage.Create do
                      try
                          Assign(bitmapdst);
                          //SaveToFile(ExtractFilePath(Application.ExeName)+'captcha.jpg');
                          SaveToFile( ExtractFilePath(ParamStr(0)) + 'captcha2.jpg'); //JPG
                      finally
                          Free;
                      end;
                  finally
                      bitmapdst.Free;
                      bitmap.Free;
                  end;
              finally
                    viewObject._Release;
              end;
              Image1.Picture.LoadFromFile( ExtractFilePath(ParamStr(0)) + 'captcha2.jpg' );
          end;
      end;
  except
  end;
end;

procedure TfrmRecuperaXml2.WebBrowser1ProgressChange(Sender: TObject; Progress,
  ProgressMax: Integer);
begin
 if ProgressMax = 0 then
  begin
    ProgressBar1.Visible := False;
    lblStatus.Visible    := False;
    exit;
  end
 else
  begin
    ProgressBar1.Visible := True;
    lblStatus.Visible    := True;
    try
       ProgressBar1.Max := ProgressMax;
       if (Progress <> -1) and (Progress <= ProgressMax) then
          ProgressBar1.Position := Progress
       else
        begin
          ProgressBar1.Visible := False;
          lblStatus.Visible    := False;
        end;
    except
       on EDivByZero do
         exit;
    end;
  end;
end;

procedure TfrmRecuperaXml2.btnNovaConsultaClick(Sender: TObject);
begin
  NovaConsulta;
end;

procedure TfrmRecuperaXml2.NovaConsulta;
begin
  btnNovaConsulta.Enabled := False;
  btnGerarXML.Enabled     := False;
  edtChaveNFe.Clear;
  edtcaptcha.Clear;
  //btnSalvarXML.Enabled    := True;
  DeleteIECache;
  Memo2.Lines.Clear;
  try
      WebBrowser1.Navigate('http://www.nfe.fazenda.gov.br/portal/consulta.aspx?tipoConsulta=completa&tipoConteudo=XbSeqxE8pl8=');
  except
      raise;
  end;
  pgSefaz.ActivePage:=tsConsultaCompleta;
end;

procedure TfrmRecuperaXml2.btnGerarXMLClick(Sender: TObject);
begin
  GeraXML;
end;

procedure TfrmRecuperaXml2.GeraXml;
begin
  FPath:=GerarXML(Memo2.Lines.Text);
  WBXML.Navigate(FPath);
  MessageBox(0,PChar('XML '+FPath+' gerado com sucesso!'),'Informação',
    MB_ICONINFORMATION+MB_TASKMODAL);
  btnNovaConsulta.Enabled := True;
  btnPegarHTML.Enabled    := True;

  edtChaveNFe.Clear;
  edtCaptcha.Clear;
  NovaConsulta;
end;

procedure TfrmRecuperaXml2.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=vk_escape then
    Close;
end;

procedure TfrmRecuperaXml2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmRecuperaXml2.btnSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmRecuperaXml2.btnPegarXMLClick(Sender: TObject);
begin
  PegarHTML;
end;

procedure TfrmRecuperaXml2.Label3Click(Sender: TObject);
begin
  NovaConsulta;
end;

procedure TfrmRecuperaXml2.edtChaveNFeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Length(edtChaveNFe.Text)=44 then
      Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmRecuperaXml2.edtCaptchaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_Return then
     // btnSalvarXML.Click;
end;

end.


