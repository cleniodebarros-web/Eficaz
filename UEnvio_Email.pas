unit UEnvio_Email;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL,
  IdSSLOpenSSL, IdMessage, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase,
  IdSMTP, IdText, ExtCtrls, Buttons;

type
  TFrmEnvio_Email = class(TForm)
    IdSMTP: TIdSMTP;
    IdMessage: TIdMessage;
    mLog: TMemo;
    Button6: TButton;
    cbHTML: TCheckBox;
    idHandle: TIdSSLIOHandlerSocketOpenSSL;
    Label1: TLabel;
    edtSenderName: TEdit;
    Label2: TLabel;
    edtSenderAddress: TEdit;
    Label3: TLabel;
    edtHost: TEdit;
    Label4: TLabel;
    edtPort: TEdit;
    Label5: TLabel;
    rbAuthNone: TRadioButton;
    rbAuthDefault: TRadioButton;
    rbAuthSSL: TRadioButton;
    rbAuthTLS: TRadioButton;
    Label6: TLabel;
    Label7: TLabel;
    edtUsername: TEdit;
    edtPassword: TEdit;
    Label8: TLabel;
    edtRecipients: TEdit;
    Label9: TLabel;
    edtSubject: TEdit;
    Label10: TLabel;
    mBody: TMemo;
    Anexo: TLabel;
    edtAttach: TEdit;
    Panel1: TPanel;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    procedure Button6Click(Sender: TObject);
    procedure idHandleStatus(ASender: TObject;
      const AStatus: TIdStatus; const AStatusText: string);
    procedure idHandleStatusInfo(Msg: string);
    procedure IdSMTPFailedRecipient(Sender: TObject; const AAddress, ACode,
      AText: string; var VContinue: Boolean);
    procedure IdSMTPStatus(ASender: TObject; const AStatus: TIdStatus;
      const AStatusText: string);
    procedure btnExecutaClick(Sender: TObject);
    procedure edtSenderNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure ConfigureSMTP;
    procedure ConfigureMessage;
    procedure SendMain;
  public
    { Public declarations }
  end;

var
  FrmEnvio_Email: TFrmEnvio_Email;
  Erro_Envio: Boolean;

implementation

uses IdAttachmentFile;

{$R *.dfm}

procedure TFrmEnvio_Email.btnExecutaClick(Sender: TObject);
begin
  try
    ConfigureSMTP;
    ConfigureMessage;
    SendMain;
  except
    Erro_Envio := True;
  end;
end;

procedure TFrmEnvio_Email.Button6Click(Sender: TObject);
begin
  if Button6.Tag >= 3 then
    Button6.Tag := -1;

  Button6.Tag := Button6.Tag + 1;

  if Button6.Tag = 0 then
  begin
    edtSenderName.Text    := 'Clenio';
    edtSenderAddress.Text := 'cleniobarros@eficazautomacao.com.br';
    edtHost.Text          := 'smtps.eficazautomacao.com.br';
    edtPort.Text          := '587';
    rbAuthNone.Checked    := True;
    edtUsername.Text      := '';
    edtPassword.Text      := '';
    edtRecipients.Text    := 'registro@eficazautomacao.com.br';
    edtSubject.Text       := 'Teste envio de e-mail sem autenticacao';
  end
  else if Button6.Tag = 1 then
  begin
    edtSenderName.Text    := 'Clenio';
    edtSenderAddress.Text := 'cleniobarros@eficazautomacao.com.br';
    edtHost.Text          := 'smtps.eficazautomacao.com.br';
    edtPort.Text          := '587';
    rbAuthDefault.Checked := True;
    edtUsername.Text      := 'cleniobarros=eficazautomacao.com.br';
    edtPassword.Text      := 'C%,Sam469521;;.';
    edtRecipients.Text    := 'registro@eficazautomacao.com.br';
    edtSubject.Text       := 'Teste envio de e-mail com autenticacao padrão';
  end
  else if Button6.Tag = 2 then
  begin
    edtSenderName.Text    := 'Clenio';
    edtSenderAddress.Text := 'cleniobarros@eficazautomacao.com.br';
    edtHost.Text          := 'smtps.eficazautomacao.com.br';
    edtPort.Text          := '587';
    rbAuthSSL.Checked     := True;
    edtUsername.Text      := 'cleniobarros=eficazautomacao.com.br';
    edtPassword.Text      := 'C%,Sam469521;;.';
    edtRecipients.Text    := 'registro@eficazautomacao.com.br';
    edtSubject.Text       := 'Teste envio de e-mail com autenticacao SSL';
  end
  else if Button6.Tag = 3 then
  begin
    edtSenderName.Text    := 'Clenio';
    edtSenderAddress.Text := 'cleniobarros@eficazautomacao.com.br';
    edtHost.Text          := 'smtps.eficazautomacao.com.br';
    edtPort.Text          := '587';
    rbAuthTLS.Checked     := True;
    edtUsername.Text      := 'cleniobarros=eficazautomacao.com.br';
    edtPassword.Text      := 'C%,Sam469521;;.';
    edtRecipients.Text    := 'registro@eficazautomacao.com.br';
    edtSubject.Text       := 'Teste envio de e-mail com autenticacao TLS';
  end;

  if cbHTML.Checked then
    mBody.Text := '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"' +
                  '"http://www.w3.org/TR/html4/loose.dtd">' +
                  '<html>' +
                  '<body>' +
                  '<h1>Mensagem: ' + edtSubject.Text + '</h1>' +
                  '</body>' +
                  '</html>'
  else
    mBody.Text := 'Mensagem: ' + edtSubject.Text;

  edtAttach.Text := '';
end;

procedure TFrmEnvio_Email.ConfigureMessage;
begin
  with IdMessage do
  begin
    Clear;

    ContentType        := 'multipart/alternative';
    ContentDisposition := 'inline';
    Priority           := mpNormal;

    with TIdText.Create(MessageParts) do
    begin
      if not cbHTML.Checked then
        Body.Text := 'Texto Comum'
      else
        Body.Text := mBody.Text;

      ContentType := 'text/plain';
    end;

    with TIdText.Create(MessageParts) do
    begin
      ContentType := 'multipart/related';
      Body.Clear;
    end;

    if cbHTML.Checked then
    begin
      with TIdText.Create(MessageParts) do
      begin
        Body.Text   := mBody.Text;
        ContentType := 'text/html';
        ParentPart  := 1;
      end;
    end;

    if FileExists(edtAttach.Text) then
    begin
      with TIdAttachmentFile.Create(MessageParts, edtAttach.Text) do
      begin
        FileName       := ExtractFileName(edtAttach.Text);
        FileIsTempFile := False;
        ParentPart     := 1;
      end;
    end;

    Subject      := edtSubject.Text;
    From.Address := edtSenderAddress.Text;
    From.Name    := edtSenderName.Text;

    with Recipients.Add do
      Address := edtRecipients.Text;
  end;
end;

procedure TFrmEnvio_Email.ConfigureSMTP;
begin
  IdSMTP.Host := edtHost.Text;
  idSMTP.Port := StrToInt(edtPort.Text);

  if rbAuthNone.Checked then
  begin
    IdSMTP.IOHandler := nil;
    IdSMTP.AuthType  := SatNone;
    IdSMTP.Username  := '';
    IdSMTP.Password  := '';
    IdSMTP.UseTLS    := utNoTLSSupport;
    IdSMTP.Port      := StrToInt(edtPort.Text);
  end
  else if rbAuthDefault.Checked then
  begin
    IdSMTP.IOHandler := nil;
    IdSMTP.AuthType  := SatDefault;
    IdSMTP.Username  := edtUsername.Text;
    IdSMTP.Password  := edtPassword.Text;
    IdSMTP.UseTLS    := utNoTLSSupport;
    IdSMTP.Port      := StrToInt(edtPort.Text);
  end
  else if rbAuthSSL.Checked then
  begin
    IdSMTP.IOHandler := idHandle;
    IdSMTP.AuthType  := SatDefault;
    IdSMTP.Username  := edtUsername.Text;
    IdSMTP.Password  := edtPassword.Text;
    IdSMTP.UseTLS    := utUseImplicitTLS;
    IdSMTP.Port      := StrToInt(edtPort.Text);

    idHandle.SSLOptions.Method := sslvSSLv23;
  end
  else if rbAuthTLS.Checked then
  begin
    IdSMTP.IOHandler := idHandle;
    IdSMTP.AuthType  := SatDefault;
    IdSMTP.Username  := edtUsername.Text;
    IdSMTP.Password  := edtPassword.Text;
    IdSMTP.UseTLS    := utUseRequireTLS;
    IdSMTP.Port      := StrToInt(edtPort.Text);

    idHandle.SSLOptions.Method := sslvSSLv3;
  end;
end;

procedure TFrmEnvio_Email.edtSenderNameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmEnvio_Email.FormCreate(Sender: TObject);
begin
  Erro_Envio := False;
end;

procedure TFrmEnvio_Email.idHandleStatus(ASender: TObject;
  const AStatus: TIdStatus; const AStatusText: string);
begin
  mLog.Lines.Add('OIHandle Status: ' + AStatusText);
end;

procedure TFrmEnvio_Email.idHandleStatusInfo(Msg: string);
begin
  mLog.Lines.Add('OIHandle StatusInfo: ' + Msg);
end;

procedure TFrmEnvio_Email.IdSMTPFailedRecipient(Sender: TObject; const AAddress, ACode,
  AText: string; var VContinue: Boolean);
begin
  mLog.Lines.Add(Format('SMTP FaliledRecipient: Address %s, Code %s, AText %s', [AAddress, ACode, AText]));
  VContinue := False;
end;

procedure TFrmEnvio_Email.IdSMTPStatus(ASender: TObject; const AStatus: TIdStatus;
  const AStatusText: string);
begin
  mLog.Lines.Add('SMTP Status: ' + AStatusText);
end;

procedure TFrmEnvio_Email.SendMain;
begin
  IdSMTP.Connect;
  try
    if IdSMTP.AuthType <> SatNone then
      IdSMTP.Authenticate;
    IdSMTP.Send(IdMessage);
  finally
    IdSMTP.Disconnect();
  end;
end;

end.
