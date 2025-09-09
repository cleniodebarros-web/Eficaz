unit UConfig_NFe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, ACBrNFeDANFEClass, ACBrNFe, IniFiles,
  Vcl.ComCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,ACBrDFeSSL;

type
  TFrmConfig_NFe = class(TForm)
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    sbtnCaminhoCert: TSpeedButton;
    Label25: TLabel;
    sbtnGetCert: TSpeedButton;
    edtCaminho: TEdit;
    edtSenha: TEdit;
    edtNumSerie: TEdit;
    gbProxy: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edtProxyHost: TEdit;
    edtProxyPorta: TEdit;
    edtProxyUser: TEdit;
    edtProxySenha: TEdit;
    GroupBox5: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    edtSmtpHost: TEdit;
    edtSmtpPort: TEdit;
    edtSmtpUser: TEdit;
    edtSmtpPass: TEdit;
    edtEmailAssunto: TEdit;
    cbEmailSSL: TCheckBox;
    mmEmailMsg: TMemo;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    Label6: TLabel;
    Chk_Separar: TCheckBox;
    Chk_Mensal: TCheckBox;
    BitBtn1: TBitBtn;
    email_teste: TEdit;
    OpenDialog1: TOpenDialog;
    cbCriptografia: TCheckBox;
    Label13: TLabel;
    IdCSC: TEdit;
    Label14: TLabel;
    CSC: TEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Inf_Adicional: TMemo;
    Inf_Adicional2: TMemo;
    Inf_Adicional_Pr: TMemo;
    tp_certificado: TComboBox;
    EdtTimeOut: TEdit;
    Label7: TLabel;
    QRel: TFDQuery;
    procedure sbtnCaminhoCertClick(Sender: TObject);
    procedure sbtnGetCertClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure btnRetornaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure edtNumSerieKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GravarConfiguracao;
    procedure LerConfiguracao;
  end;

var
  FrmConfig_NFe: TFrmConfig_NFe;

implementation

uses
  UPrincipal, pcnConversao,UData;

{$R *.dfm}

procedure TFrmConfig_NFe.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmConfig_NFe.edtNumSerieKeyPress(Sender: TObject; var Key: Char);
begin
  key:=#0;
end;

procedure TFrmConfig_NFe.BitBtn1Click(Sender: TObject);
Var
E_mail :Boolean;
begin
  try
    if email_teste.Text <> '' then
    begin

      OpenDialog1.Title      := 'Selecione a NFE';
      OpenDialog1.DefaultExt := '*-nfe.XML';
      OpenDialog1.Filter     := 'Arquivos NFE (*-nfe.XML)|*-nfe.XML|Arquivos XML (*.XML)|*.XML|Todos os Arquivos (*.*)|*.*';
      OpenDialog1.InitialDir := FrmPrincipal.ACBrNFe1.Configuracoes.Arquivos.GetPathNFe;

      if OpenDialog1.Execute then
      begin

        FrmPrincipal.ACBrNFe1.NotasFiscais.Clear;
        FrmPrincipal.ACBrNFe1.NotasFiscais.LoadFromFile(OpenDialog1.FileName);



        if edtEmailAssunto.Text = '' then
        edtEmailAssunto.Text := FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString + ' Teste E-mail' + ' Data: ' + DateToStr(date);

        FrmPrincipal.MemoResp.Lines.Add('Teste Email');
        FrmPrincipal.MemoResp.Lines.Add('**********************Sistema Eficaz(38)37411478**********************');

        FrmPrincipal.ACBrMail1.Host      := edtSmtpHost.Text;
        FrmPrincipal.ACBrMail1.Port      := edtSmtpPort.Text;
        FrmPrincipal.ACBrMail1.Username  := edtSmtpUser.Text;
        FrmPrincipal.ACBrMail1.Password  := edtSmtpPass.Text;
        FrmPrincipal.ACBrMail1.From      := edtSmtpUser.Text;

        if cbEmailSSL.Checked then
        FrmPrincipal.ACBrMail1.SetSSL    := True            // SSL - ConexÃ£o Segura
        Else
        FrmPrincipal.ACBrMail1.SetSSL    := False;            // SSL - ConexÃ£o Segura

        FrmPrincipal.ACBrMail1.SetTLS    := True; // Auto TLS
        FrmPrincipal.ACBrMail1.ReadingConfirmation := False; //Pede confirmaÃ§Ã£o de leitura do email
        FrmPrincipal.ACBrMail1.UseThread := False;           //Aguarda Envio do Email(nÃ£o usa thread)
        FrmPrincipal.ACBrMail1.FromName  := 'Sistema Eficaz Automacao Ltda';

        FrmPrincipal.ACBrNFe1.NotasFiscais.Items[0].EnviarEmail(email_teste.Text , edtEmailAssunto.Text ,
                                                 FrmPrincipal.MemoResp.Lines
                                                 ,False  // Enviar PDF junto
                                                 ,nil //CC  Lista com emails que serÃ£o enviado cÃ³pias - TStrings
                                                 ,nil); // Lista de anexos - TStrings




        //FrmPrincipal.ACBrNFe1.NotasFiscais.Items[0].EnviarEmail(edtSmtpHost, edtSmtpPort, edtSmtpUser, edtSmtpPass, edtSmtpUser, QParceiro.FieldByName('EMAIL').AsString, edtEmailAssunto, FrmPrincipal.MemoResp.Lines, cbEmailSSL,True //Enviar PDF junto
        //, nil {Lista com emails que serão enviado cópias - TStrings}
        //, nil { Lista de anexos - TStrings}
        //, False {Pede confirmação de leitura do email}
        //, True  {Aguarda Envio do Email(não usa thread)}
        //, FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString //NOME do Rementente}
        //, True ); // Auto TLS););

        FrmPrincipal.MemoResp.Lines.Clear;
        E_mail := True;
      end;
    end;
  except
    Application.MessageBox('Não foi possível enviar o email verifique as configurações.', PChar(Msg_Title), mb_IconInformation);
    e_mail := False;
    {on e:Exception do
        begin
          Application.MessageBox(PChar('Erro enviar email:' + #13 +
            'Erro: ' + e.Message), 'Erro', MB_ICONSTOP + MB_TASKMODAL);
        end;}
  end;
  if e_mail then
   Application.MessageBox(Pchar('E-mail enviado com sucesso para :' + email_teste.Text), PChar(Msg_Title), mb_IconInformation);

end;

procedure TFrmConfig_NFe.btnExecutaClick(Sender: TObject);
begin
  GravarConfiguracao;
  Close;
end;

procedure TFrmConfig_NFe.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmConfig_NFe.FormCreate(Sender: TObject);
begin
  FrmPrincipal.QConfig_Nfiscal.Close;
  FrmPrincipal.QConfig_Nfiscal.Open();

   FrmPrincipal.ACBrNFe1.Configuracoes.Arquivos.PathNFe := ExtractFilePath(ParamStr(0)) + 'NFe\';

  if LeIni(ExtractFilePath(ParamStr(0)) + 'NFe.Ini', 'NFe', 'Ambiente') = 'Produção' then
    FrmPrincipal.ACBrNFe1.Configuracoes.WebServices.Ambiente := taProducao
  else
    FrmPrincipal.ACBrNFe1.Configuracoes.WebServices.Ambiente := taHomologacao;

  FrmPrincipal.ACBrNFe1.Configuracoes.WebServices.UF := FrmPrincipal.QEmpresa.FieldByName('ESTADO').AsString;

  FrmPrincipal.ACBrNFeDANFERL1.Email               := FrmPrincipal.QEmpresa.FieldByName('EMAIL').AsString;
  FrmPrincipal.ACBrNFeDANFERL1.Fax                 := FrmPrincipal.QEmpresa.FieldByName('TELEFONE').AsString;

  FrmPrincipal.ACBrNFeDANFERL1.Site                := FrmPrincipal.QEmpresa.FieldByName('URL').AsString;

  LerConfiguracao;
end;

procedure TFrmConfig_NFe.sbtnCaminhoCertClick(Sender: TObject);
begin
  FrmPrincipal.OpenDialog1.Title      := 'Selecione o Certificado';
  FrmPrincipal.OpenDialog1.DefaultExt := '*.pfx';
  FrmPrincipal.OpenDialog1.Filter     := 'Arquivos PFX (*.pfx)|*.pfx|Todos os Arquivos (*.*)|*.*';
  FrmPrincipal.OpenDialog1.InitialDir := ExtractFilePath(ParamStr(0)) + 'NFe\';

  if FrmPrincipal.OpenDialog1.Execute then
  begin
    edtCaminho.Text := FrmPrincipal.OpenDialog1.FileName;
  end;
end;

procedure TFrmConfig_NFe.sbtnGetCertClick(Sender: TObject);

var
certificado_escolhido: string;

begin
  {$IFNDEF ACBrNFeOpenSSL}


      FrmPrincipal.ACBrNFe1.Configuracoes.Geral.SSLCryptLib :=  cryWinCrypt;
      FrmPrincipal.ACBrNFe1.Configuracoes.Geral.SSLLib      :=  libWinCrypt;
      FrmPrincipal.ACBrNFe1.Configuracoes.Geral.SSLHttpLib  :=  httpWinHttp;

      certificado_escolhido := FrmPrincipal.ACBrNFe1.SSL.SelecionarCertificado;

      if certificado_escolhido <> '' then
      begin
        edtNumSerie.Text := certificado_escolhido;
      end;

      //edtNumSerie.Text := FrmPrincipal.ACBrNFe1.SSL.SelecionarCertificado;

  {$ENDIF}
end;

procedure TFrmConfig_NFe.LerConfiguracao;
var
IniFile: String;
Ini: TIniFile;
StreamMemo: TMemoryStream;
begin
  IniFile := ChangeFileExt(ExtractFilePath(ParamStr(0)) + 'NFe', '.Ini');

  Ini := TIniFile.Create(IniFile);
  try
    chk_Separar.Checked   := Ini.ReadBool('NFe', 'Separar Cnpj', False);
    chk_Mensal.Checked    := Ini.ReadBool('NFe', 'Pasta Mensal', False);


    edtCaminho.Text         := Ini.ReadString('Certificado', 'Caminho', '');
    edtSenha.Text           := Ini.ReadString('Certificado', 'Senha',   '');
    edtNumSerie.Text        := Ini.ReadString('Certificado', 'NumSerie', '');
    EdtTimeOut.Text         := Ini.ReadString('Certificado', 'TimeOut', '');
    IdCSC.Text              := Ini.ReadString('Certificado', 'IdCSC', '');
    CSC.Text                := Ini.ReadString('Certificado', 'CSC', '');
    cbCriptografia.Checked  := Ini.ReadBool('Certificado', 'Criptografia 2048', False);
    tp_certificado.Text     := Ini.ReadString('Certificado', 'Tipo Certificado', '');

    edtProxyHost.Text    := Ini.ReadString('Proxy', 'Host',  '');
    edtProxyPorta.Text   := Ini.ReadString('Proxy', 'Porta', '');
    edtProxyUser.Text    := Ini.ReadString('Proxy', 'User',  '');
    edtProxySenha.Text   := Ini.ReadString('Proxy', 'Pass',  '');

    edtSmtpHost.Text     := Ini.ReadString('Email', 'Host',    '');
    edtSmtpPort.Text     := Ini.ReadString('Email', 'Port',    '');
    edtSmtpUser.Text     := Ini.ReadString('Email', 'User',    '');
    edtSmtpPass.Text     := Ini.ReadString('Email', 'Pass',    '');
    edtSmtpPass.Text     := DecryptMsg(edtSmtpPass.Text, 5);
    edtEmailAssunto.Text := Ini.ReadString('Email', 'Assunto', '');
    cbEmailSSL.Checked   := Ini.ReadBool('Email', 'SSL', False);
    email_teste.Text     := Ini.ReadString('Email', 'Email Teste', '');

    StreamMemo           := TMemoryStream.Create;

    Ini.ReadBinaryStream('Email', 'Mensagem', StreamMemo);
    mmEmailMsg.Lines.LoadFromStream(StreamMemo);

    Ini.ReadBinaryStream('Informações Adicionais', 'Texto', StreamMemo);
    Inf_Adicional.Lines.LoadFromStream(StreamMemo);

    Ini.ReadBinaryStream('Informações Adicionais2', 'Texto', StreamMemo);
    Inf_Adicional2.Lines.LoadFromStream(StreamMemo);

    Ini.ReadBinaryStream('Informações Adicionais Pr', 'Texto', StreamMemo);
    Inf_Adicional_Pr.Lines.LoadFromStream(StreamMemo);

    StreamMemo.Free;
  finally
    Ini.Free;
  end;

  QRel.SQL.Clear;
  QRel.SQL.Add('SELECT * FROM CONFIG_NFISCAL');
  QRel.Prepare;
  QRel.Open();

  //if QRel.FieldByName('CERTIFICADO').AsString <> '' then
  //begin

    edtSenha.Text           := QRel.FieldByName('SENHA_CERTIFICADO').AsString;
    edtNumSerie.Text        := QRel.FieldByName('NUMERO').AsString;
    EdtTimeOut.Text         := QRel.FieldByName('TIME_OUT').AsString;
    IdCSC.Text              := QRel.FieldByName('IDCSC').AsString;
    CSC.Text                := QRel.FieldByName('CSC').AsString;
    tp_certificado.Text     := QRel.FieldByName('TP_CERTIFICADO').AsString;
    edtSmtpHost.Text        := QRel.FieldByName('SERVIDOR_SMTP').AsString;
    edtSmtpPort.Text        := QRel.FieldByName('PORTA').AsString;
    edtSmtpUser.Text        := QRel.FieldByName('USUARIO').AsString;
    edtSmtpPass.Text        := DecryptMsg(QRel.FieldByName('SENHA_EMAIL').AsString,5);

    IF QRel.FieldByName('SSL').AsString = 'True' Then
    cbEmailSSL.Checked      := True
    else
    cbEmailSSL.Checked      := False;


 // end;
end;

procedure TFrmConfig_NFe.GravarConfiguracao;
var
IniFile: String;
Ini: TIniFile;
StreamMemo: TMemoryStream;
FS: TFileStream;
begin
  IniFile := ChangeFileExt(ExtractFilePath(ParamStr(0)) + 'NFe', '.Ini');

  Ini := TIniFile.Create(IniFile);
  try

    Ini.WriteBool('NFe', 'Separar Cnpj',  chk_Separar.Checked);
    Ini.WriteBool('NFe', 'Pasta Mensal',  chk_Mensal.Checked);

    Ini.WriteString('Certificado', 'Caminho',  edtCaminho.Text);
    Ini.WriteString('Certificado', 'Senha',    edtSenha.Text);
    Ini.WriteString('Certificado', 'NumSerie', edtNumSerie.Text);
    Ini.WriteString('Certificado', 'TimeOut', EdtTimeOut.Text);
    Ini.WriteString('Certificado', 'IdCSC', IdCSC.Text);
    Ini.WriteString('Certificado', 'CSC', CSC.Text);
    Ini.WriteBool('Certificado', 'Criptografia 2048', cbCriptografia.Checked);
    Ini.WriteString('Certificado', 'Tipo Certificado', tp_certificado.Text);

    Ini.WriteString('Proxy', 'Host',  edtProxyHost.Text);
    Ini.WriteString('Proxy', 'Porta', edtProxyPorta.Text);
    Ini.WriteString('Proxy', 'User',  edtProxyUser.Text);
    Ini.WriteString('Proxy', 'Pass',  edtProxySenha.Text);

    Ini.WriteString('Email', 'Host',    edtSmtpHost.Text);
    Ini.WriteString('Email', 'Port',    edtSmtpPort.Text);
    Ini.WriteString('Email', 'User',    edtSmtpUser.Text);
    Ini.WriteString('Email', 'Pass',    EncryptMsg(edtSmtpPass.Text, 5));
    Ini.WriteString('Email', 'Assunto', edtEmailAssunto.Text);
    Ini.WriteBool('Email', 'SSL', cbEmailSSL.Checked);
    Ini.WriteString('Email', 'Email Teste', email_teste.Text);

    StreamMemo := TMemoryStream.Create;
    mmEmailMsg.Lines.SaveToStream(StreamMemo);
    StreamMemo.Seek(0, soFromBeginning);
    Ini.WriteBinaryStream('Email', 'Mensagem', StreamMemo);
    StreamMemo.Free;

    StreamMemo := TMemoryStream.Create;
    Inf_Adicional.Lines.SaveToStream(StreamMemo);
    StreamMemo.Seek(0, soFromBeginning);
    Ini.WriteBinaryStream('Informações Adicionais', 'Texto', StreamMemo);
    StreamMemo.Free;

    StreamMemo := TMemoryStream.Create;
    Inf_Adicional2.Lines.SaveToStream(StreamMemo);
    StreamMemo.Seek(0, soFromBeginning);
    Ini.WriteBinaryStream('Informações Adicionais2', 'Texto', StreamMemo);
    StreamMemo.Free;

    StreamMemo := TMemoryStream.Create;
    Inf_Adicional_Pr.Lines.SaveToStream(StreamMemo);
    StreamMemo.Seek(0, soFromBeginning);
    Ini.WriteBinaryStream('Informações Adicionais Pr', 'Texto', StreamMemo);
    StreamMemo.Free;



    QRel.SQL.Clear;
    QRel.SQL.Add('UPDATE CONFIG_NFISCAL SET SENHA_CERTIFICADO = :SENHA, IDCSC = :IDCSC, ');
    QRel.SQL.Add('CSC = :CSC, NUMERO = :NUMERO, TIME_OUT = :TIME_OUT, SERVIDOR_SMTP = :SERVIDOR , PORTA = :PORTA,');
    QRel.SQL.Add('USUARIO = :USUARIO, SENHA_EMAIL = :SENHA_EMAIL, SSL = :SSL,TP_CERTIFICADO = :TP_CERTIFICADO');
    QRel.SQL.Add(',CERTIFICADO = :CERTIFICADO');

    if tp_certificado.Text = 'A1' then
     QRel.ParamByName('CERTIFICADO').LoadFromFile(edtCaminho.Text, FTBlob)
     else
     QRel.ParamByName('CERTIFICADO').AsByteStr := '';


    QRel.ParamByName('SENHA').AsString          := edtSenha.Text;
    QRel.ParamByName('IDCSC').AsString          := IdCSC.Text;
    QRel.ParamByName('CSC').AsString            := CSC.Text;
    QRel.ParamByName('NUMERO').AsString         := edtNumSerie.Text;
    QRel.ParamByName('TIME_OUT').AsString       := EdtTimeOut.Text;
    QRel.ParamByName('SERVIDOR').AsString       := edtSmtpHost.Text;
    QRel.ParamByName('PORTA').AsString          := edtSmtpPort.Text;
    QRel.ParamByName('USUARIO').AsString        := edtSmtpUser.Text;
    QRel.ParamByName('SENHA_EMAIL').AsString    := EncryptMsg(edtSmtpPass.Text, 5);
    QRel.ParamByName('TP_CERTIFICADO').AsString := tp_certificado.Text;

    if cbEmailSSL.Checked then
    QRel.ParamByName('SSL').AsString            := 'True'
    Else
    QRel.ParamByName('SSL').AsString            := 'False';


    QRel.Prepare;
    QRel.ExecSQL;

  finally
     Ini.Free;
  end;
end;

end.
