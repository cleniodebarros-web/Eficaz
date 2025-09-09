unit UCartas_Cobranca_email;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, rxCurrEdit, Mask, rxToolEdit, Buttons, DB,
  IBCustomDataSet, IBQuery, QRCtrls, QuickRpt, DBCtrls, Math, RDprint,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ComCtrls, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdMessage,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP,
  IdText, FireDAC.Stan.Async, FireDAC.DApt;

type
  TFrmCartas_Cobranca_email = class(TForm)
    Label1: TLabel;
    Dtmen: TDateEdit;
    Dtmai: TDateEdit;
    Label3: TLabel;
    Modelo_Carta: TComboBox;
    Label2: TLabel;
    Cliente: TCurrencyEdit;
    Label5: TLabel;
    Bevel1: TBevel;
    Classe: TEdit;
    btnCliente: TSpeedButton;
    DBText2: TDBText;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    RDprint2: TRDprint;
    SrcList: TListBox;
    ExAllBtn: TSpeedButton;
    ExcludeBtn: TSpeedButton;
    IncAllBtn: TSpeedButton;
    IncludeBtn: TSpeedButton;
    DstList: TListBox;
    btnSelecao: TButton;
    Table_Temp: TFDMemTable;
    edtSenderName: TEdit;
    edtSenderAddress: TEdit;
    edtHost: TEdit;
    edtPort: TEdit;
    rbAuthNone: TRadioButton;
    rbAuthDefault: TRadioButton;
    rbAuthSSL: TRadioButton;
    rbAuthTLS: TRadioButton;
    edtUsername: TEdit;
    edtPassword: TEdit;
    edtRecipients: TEdit;
    edtSubject: TEdit;
    mbody2: TMemo;
    edtAttach: TEdit;
    mLog: TMemo;
    cbHTML: TCheckBox;
    IdSMTP: TIdSMTP;
    IdMessage: TIdMessage;
    idHandle: TIdSSLIOHandlerSocketOpenSSL;
    mbody1: TMemo;
    mBody: TMemo;
    btn_envio: TBitBtn;
    Label4: TLabel;
    DataCliente: TDataSource;
    Chk_Empresa: TCheckBox;
    QItens: TFDQuery;
    QCliente: TFDQuery;
    QRel: TFDQuery;
    QEmail: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRetornaClick(Sender: TObject);
    procedure btnClienteClick(Sender: TObject);
    procedure ClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnExecutaClick(Sender: TObject);
    procedure ClienteExit(Sender: TObject);
    procedure QRBand1AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure CartaBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRGroup1AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure DtmenEnter(Sender: TObject);
    procedure IncludeBtnClick(Sender: TObject);
    procedure IncAllBtnClick(Sender: TObject);
    procedure ExcludeBtnClick(Sender: TObject);
    procedure ExAllBtnClick(Sender: TObject);
    procedure btnSelecaoClick(Sender: TObject);
    procedure btn_envioClick(Sender: TObject);
    procedure IdSMTPFailedRecipient(Sender: TObject; const AAddress, ACode,
      AText: string; var VContinue: Boolean);
    procedure IdSMTPStatus(ASender: TObject; const AStatus: TIdStatus;
      const AStatusText: string);
    procedure idHandleStatus(ASender: TObject; const AStatus: TIdStatus;
      const AStatusText: string);
    procedure idHandleStatusInfo(const AMsg: string);
  private
    { Private declarations }
    procedure ConfigureSMTP;
    procedure ConfigureMessage;
    procedure SendMain;
  public
    { Public declarations }
    function Validacao: Boolean;
    procedure DetailSearch(Tabela: String);
    procedure SetItem(List: TListBox; Index: Integer);
    procedure SetButtons;
    function GetFirstSelection(List: TCustomListBox): Integer;
    procedure MoveSelected(List: TCustomListBox; Items: TStrings);
  end;

var
  FrmCartas_Cobranca_email: TFrmCartas_Cobranca_email;
  TT: Real;
  PG,contador: Integer;
  Erro_Envio: Boolean;

implementation

uses
  UConsulta, UPrincipal, UData,UEnvio_Email,UAguarde,IdAttachmentFile;

{$R *.dfm}
procedure TFrmCartas_Cobranca_email.SendMain;
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

procedure TFrmCartas_Cobranca_email.ConfigureMessage;
var
l:Integer;
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

        for l := 0 to mbody.Lines.Count do
        begin
            Body.Add(mbody.Lines.Strings[l]);
        end;

        for l := 0 to mbody1.Lines.Count do
        begin
            Body.add (mbody1.Lines.Strings[l]);
        end;

         for l := 0 to mbody2.Lines.Count do
        begin
            Body.Add (mbody2.Lines.Strings[l]);
        end;


      ContentType := 'text/plain; charset=iso-8859-1';
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
        for l := 0 to mbody.Lines.Count do
        begin
            Body.Add(mbody.Lines.Strings[l]);
        end;

        for l := 0 to mbody1.Lines.Count do
        begin
            Body.add(mbody1.Lines.Strings[l]);
        end;

         for l := 0 to mbody2.Lines.Count do
        begin
            Body.add(mbody2.Lines.Strings[l]);
        end;

        ContentType := 'text/plain; charset=iso-8859-1';
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

    ReceiptRecipient.Text := From.Text; // Auto Resposta

  end;


end;
procedure TFrmCartas_Cobranca_email.ConfigureSMTP;
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

procedure TFrmCartas_Cobranca_email.MoveSelected(List: TCustomListBox; Items: TStrings);
var
I: Integer;
begin
  for I := List.Items.Count - 1 downto 0 do
  begin
    if List.Selected[I] then
    begin
      Items.AddObject(List.Items[I], List.Items.Objects[I]);
      List.Items.Delete(I);
    end;
  end;
end;


function TFrmCartas_Cobranca_email.GetFirstSelection(List: TCustomListBox): Integer;
begin
  for Result := 0 to List.Items.Count - 1 do
  begin
    if List.Selected[Result] then
      exit;
  end;

  Result := LB_ERR;
end;

procedure TFrmCartas_Cobranca_email.idHandleStatus(ASender: TObject;
  const AStatus: TIdStatus; const AStatusText: string);
begin
  mLog.Lines.Add('OIHandle Status: ' + AStatusText);
end;

procedure TFrmCartas_Cobranca_email.idHandleStatusInfo(const AMsg: string);
begin
    mLog.Lines.Add('OIHandle StatusInfo: ' + AMsg);
end;

procedure TFrmCartas_Cobranca_email.SetButtons;
var
SrcEmpty, DstEmpty: Boolean;
begin
  SrcEmpty           := SrcList.Items.Count = 0;
  DstEmpty           := DstList.Items.Count = 0;
  IncludeBtn.Enabled := not SrcEmpty;
  IncAllBtn.Enabled  := not SrcEmpty;
  ExcludeBtn.Enabled := not DstEmpty;
  ExAllBtn.Enabled   := not DstEmpty;
end;

procedure TFrmCartas_Cobranca_email.SetItem(List: TListBox; Index: Integer);
var
MaxIndex: Integer;
begin
  with List do
  begin
    SetFocus;
    MaxIndex := List.Items.Count - 1;

    if Index = LB_ERR then
      Index := 0
    else if Index > MaxIndex then
      Index := MaxIndex;

    Selected[Index] := True;
  end;

  SetButtons;
end;

function TFrmCartas_Cobranca_email.Validacao: Boolean;
begin
  Result := False;

  Dtmen.Color        := clWindow;
  Dtmai.Color        := clWindow;
  Modelo_Carta.Color := clWindow;
  Cliente.Color      := clWindow;

  if Dtmai.Date < Dtmen.Date then
  begin
    Application.MessageBox('Data final inválida', PChar(Msg_Title), mb_IconStop);
    Dtmai.Color := clYellow;
    Dtmai.SetFocus;
    exit;
  end;

  if Modelo_Carta.Text = '' then
  begin
    Application.MessageBox('Informe o modelo do E-mail', PChar(Msg_Title), mb_IconStop);
    Modelo_Carta.Color := clYellow;
    Modelo_Carta.SetFocus;
    exit;
  end;

  if Cliente.Value > 0 then
  begin
    if QCliente.IsEmpty then
    begin
      Application.MessageBox('Cliente inexistente', PChar(Msg_Title), mb_IconSTop);
      Cliente.Color := clYellow;
      Cliente.SetFocus;
      exit;
    end
  end;

  if (DstList.Items.Count) <= 0 then
  begin
      Application.MessageBox('Favlor selecionar Clientes para o envio do e-mail.', PChar(Msg_Title), mb_IconSTop);
      SrcList.Color := clYellow;
      SrcList.SetFocus;
      Exit;
  end;

  Result := True;
end;

procedure TFrmCartas_Cobranca_email.DetailSearch(Tabela: String);
begin
  if ((Tabela = '') or (Tabela = 'Cliente')) and (Cliente.Text <> '') then
  begin
    QCliente.Close;
    QCliente.ParamByName('CLIENTE_ID').AsInteger := StrToInt(Cliente.Text);
    QCliente.Prepare;
    QCliente.Open;
  end;
end;

procedure TFrmCartas_Cobranca_email.btnClienteClick(Sender: TObject);
begin
  try
    Cliente.Value := GetConsulta('CLIENTES', 0, 0, StrToInt(Cliente.Text));
  except
    Cliente.Value := GetConsulta('CLIENTES', 0, 0, 0);
  end;
end;

procedure TFrmCartas_Cobranca_email.btnExecutaClick(Sender: TObject);
var
Linha,I,X: Integer;
Dif, Correc,Multa,Valor_corrigido,TT_parcela, TT_Corrigido,vr_parcela,corrigido: Real;
Parcela,especie,duplicata,vencimento,Temporario,Endereco,Result,email :string;

begin
// 200, 327
  try
    btnExecuta.Enabled    := False;
    btnRetorna.Enabled    := False;
    DetailSearch('');

    if Validacao then
    begin

      Dtmen.Color        := clWindow;
      Dtmai.Color        := clWindow;
      Modelo_Carta.Color := clWindow;
      Cliente.Color      := clWindow;



     for I := 0 to (DstList.Items.Count - 1) do
     begin
      if DstList.Items.Strings[I] <> '' then
      begin
        try

         //if (FrmAguarde = nil) then
         FrmAguarde := TFrmAguarde.Create(Application);

         FrmAguarde.Label1.Caption := 'Enviando e-mail para: ' + #13  + Copy(DstList.Items.Strings[I],7,35) + #13 +'Aguarde...';
         FrmAguarde.Show;
         FrmAguarde.BringToFront;
         FrmAguarde.Refresh;

         Qemail.SQL.Clear;
         Qemail.SQL.Add('SELECT EMAIL FROM CLIENTES WHERE CLIENTE_ID = :CLIENTE_ID');
         Qemail.ParamByName('CLIENTE_ID').AsInteger := StrToInt(Copy(DstList.Items.Strings[I],1,5));
         Qemail.Prepare;
         Qemail.Open;

         email := LowerCase(Qemail.FieldByName('EMAIL').AsString);





          edtSenderName.Text    := 'Cobrança';
          edtSenderAddress.Text := 'eficaz@eficazautomacao.com.br';
          edtHost.Text          := 'smtp.eficazautomacao.com.br';
          edtPort.Text          := '587';
          rbAuthDefault.Checked := True;
          edtUsername.Text      := 'eficaz=eficazautomacao.com.br';
          edtPassword.Text      := 'EficazSuporteArilmaq421';
          edtSubject.Text       := Copy(DstList.Items.Strings[I],7,35);
          edtRecipients.Text    := email;


         { mBody.Lines.Add('Razão Social: ' + QEmpresa.FieldByName('RAZAO').AsString);
          mBody.Lines.Add('Inscrição: ' + QEmpresa.FieldByName('INSCR_ESTADUAL').AsString);
          mBody.Lines.Add('CNPJ: ' + QEmpresa.FieldByName('CNPJ').AsString);
          mBody.Lines.Add('Endereço: ' + QEmpresa.FieldByName('ENDERECO').AsString + ', ' + QEmpresa.FieldByName('NUMERO').AsString);
          mBody.Lines.Add('Telefone: ' + QEmpresa.FieldByName('TELEFONE').AsString);
          mBody.Lines.Add('Bairro: ' + QEmpresa.FieldByName('BAIRRO').AsString);
          mBody.Lines.Add('Cidade: ' + QEmpresa.FieldByName('MUNICIPIO').AsString);
          mBody.Lines.Add('Email: ' + QEmpresa.FieldByName('EMAIL').AsString);
          mBody.Lines.Add('Serial: ' + QRel.FieldByName('SERIAL').AsString);
          mBody.Lines.Add('Quantidade de Empresas no Banco: ' + IQuery.FieldByName('QTD').AsString);
          mBody.Lines.Add('Ip-Cliente: ' + Result);
          mBody.Lines.Add('Data: ' + DateToStr(Date) + ' Hora: ' + TimeToStr(Time));  }



          mBody.Lines.Clear;
          mbody2.Lines.Clear;

          if Modelo_Carta.Text = 'E-mail de Cobrança (Suave)' then
          begin
            mBody.Lines.Add('');
            mBody.Lines.Add(FrmPrincipal.QEmpresa.FieldByName('MUNICIPIO').AsString);
            mBody.Lines.Add(DateToStr(DATE));
            mBody.Lines.Add('');
            mBody.Lines.Add(Copy(DstList.Items.Strings[I],7,35)+'   -   ' + Copy(DstList.Items.Strings[I],1,5) );
            mBody.Lines.Add('');
            mBody.Lines.Add('');

            mBody.Lines.Add('                            Prezado Cliente,' + #13#10);
            mBody.Lines.Add('');
            mBody.Lines.Add(''+ #13);
            mBody.Lines.Add(''+ #13);
            mBody.Lines.Add('             Consultamos nossos registros e verificamos  que  não consta  o pagamento da(s) ' + #13);
            mBody.Lines.Add('             fatura(s)  relacionada(s) abaixo. :' + #13);
            mBody.Lines.Add(''+ #13);
            mBody2.Lines.Add('            Entre em contato conosco para que possamos solucionar essa(s) pendência(s). ' + #13);
            mBody2.Lines.Add('            Caso já tenha efetuado o pagamento, favor desconsiderar este aviso.' + #13);
            mBody2.Lines.Add(''+ #13);
            mBody2.Lines.Add(''+ #13);
            mBody2.Lines.Add(''+ #13);
            mBody2.Lines.Add(''+ #13);
            mBody2.Lines.Add('                           Atenciosamente,'+ #13);
            mBody2.Lines.Add('');
            mBody2.Lines.Add('');
            mBody2.Lines.Add('');
            mBody2.Lines.Add(FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString);
            mBody2.Lines.Add(FrmPrincipal.QEmpresa.FieldByName('TELEFONE').AsString);
            mBody2.Lines.Add(FrmPrincipal.QEmpresa.FieldByName('ENDERECO').AsString + ', Nº' + FrmPrincipal.QEmpresa.FieldByName('NUMERO').AsString );
            mBody2.Lines.Add(FrmPrincipal.QEmpresa.FieldByName('BAIRRO').AsString);
            mBody2.Lines.Add(FrmPrincipal.QEmpresa.FieldByName('MUNICIPIO').AsString);
            mBody2.Lines.Add(FrmPrincipal.QEmpresa.FieldByName('CEP').AsString);
          end

          else if Modelo_Carta.Text = 'E-mail de Cobrança (Média)' then
          begin

            mBody.Lines.Add(Copy(DstList.Items.Strings[I],7,35)+'   -   ' + Copy(DstList.Items.Strings[I],1,5) );
            mBody.Lines.Add('');
            mBody.Lines.Add('');

            mBody.Lines.Add('                              Prezado Cliente,');
            mBody.Lines.Add('');
            mBody.Lines.Add('');
            mBody.Lines.Add('');
            mBody.Lines.Add('                              Conforme aviso anterior verificamos ' +
                                  'em nossos registros que as faturas abaixo continuam em aberto ' +
                                  'motivo pelo qual pedimos a V. Sa. sua imediata regularização.');

            mBody2.Lines.Add('                              Tendo em vista que a emissão deste ' +
                                  'aviso é automática, por computador, caso V. Sa. já tenha quitado ' +
                                  'até a data da entrega do mesmo, solicitamos inutilizá-lo.');
            mBody2.Lines.Add('');
            mBody2.Lines.Add('');
            mBody2.Lines.Add('');
            mBody2.Lines.Add('                              Atenciosamente,');
            mBody2.Lines.Add('');
            mBody2.Lines.Add('');
            mBody2.Lines.Add('');
            mBody2.Lines.Add(FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString);
            mBody2.Lines.Add(FrmPrincipal.QEmpresa.FieldByName('ENDERECO').AsString + ', Nº' + FrmPrincipal.QEmpresa.FieldByName('NUMERO').AsString );
            mBody2.Lines.Add(FrmPrincipal.QEmpresa.FieldByName('BAIRRO').AsString);
            mBody2.Lines.Add(FrmPrincipal.QEmpresa.FieldByName('MUNICIPIO').AsString);
            mBody2.Lines.Add(FrmPrincipal.QEmpresa.FieldByName('CEP').AsString);
          end
          else if Modelo_Carta.Text = 'E-mail de Cobrança (Pesada)' then
          begin

            mBody.Lines.Add(Copy(DstList.Items.Strings[I],7,35)+'   -   ' + Copy(DstList.Items.Strings[I],1,5) );
            mBody.Lines.Add('');
            mBody.Lines.Add('');
            mBody.Lines.Add('                              Prezado Cliente,');
            mBody.Lines.Add('');
            mBody.Lines.Add('');
            mBody.Lines.Add('');
            mBody.Lines.Add('                              V.Sa. não nos procurou para regularização ' +
                                  'das fatruas em aberto. Comunicamos que as duplicatas abaixo relacionadas' +
                                  'serão inclusas no cadastro do SERASA.');

            mBody2.Lines.Add('                              Pedimos a V. Sa. que regularize urgentemente ' +
                                  'essa situação; caso contrário, seremos obrigados a encaminhar o assunto ao nosso ' +
                                  'Departamento Jurídico.');
            mBody2.Lines.Add('');
            mBody2.Lines.Add('');
            mBody2.Lines.Add('');
            mBody2.Lines.Add('                              Atenciosamente,');
            mBody2.Lines.Add('');
            mBody2.Lines.Add('');
            mBody2.Lines.Add('');
            mBody2.Lines.Add(FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString);
            mBody2.Lines.Add(FrmPrincipal.QEmpresa.FieldByName('ENDERECO').AsString + ', Nº' + FrmPrincipal.QEmpresa.FieldByName('NUMERO').AsString );
            mBody2.Lines.Add(FrmPrincipal.QEmpresa.FieldByName('BAIRRO').AsString);
            mBody2.Lines.Add(FrmPrincipal.QEmpresa.FieldByName('MUNICIPIO').AsString);
            mBody2.Lines.Add(FrmPrincipal.QEmpresa.FieldByName('CEP').AsString);
          end
          else if Modelo_Carta.Text = 'E-mail de Cobrança (3º Aviso)' then
          begin

            mBody.Lines.Add(Copy(DstList.Items.Strings[I],7,35)+'   -   ' + Copy(DstList.Items.Strings[I],1,5) );
            mBody.Lines.Add('');
            mBody.Lines.Add('');

            mBody.Lines.Add('                              Prezado Cliente,');
            mBody.Lines.Add('');
            mBody.Lines.Add('');
            mBody.Lines.Add('');
            mBody.Lines.Add('                              Solicitamos o seu comparecimento em até 2 dias após ' +
                                  'o recebimento deste em nosso escritório, a fim de efetuar o pagamento da(s) Duplicata(s), ' +
                                  'de seu aceite, abaixo relacionada(s).');

            mBody2.Lines.Add('                              O seu não comparecimento nos obrigará a tomar medidas judiciais.');
            mBody2.Lines.Add('');
            mBody2.Lines.Add('');
            mBody2.Lines.Add('');
            mBody2.Lines.Add('                              Atenciosamente,');
            mBody2.Lines.Add('');
            mBody2.Lines.Add('');
            mBody2.Lines.Add('');
            mBody2.Lines.Add(FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString);
            mBody2.Lines.Add(FrmPrincipal.QEmpresa.FieldByName('ENDERECO').AsString + ', Nº' + FrmPrincipal.QEmpresa.FieldByName('NUMERO').AsString );
            mBody2.Lines.Add(FrmPrincipal.QEmpresa.FieldByName('BAIRRO').AsString);
            mBody2.Lines.Add(FrmPrincipal.QEmpresa.FieldByName('MUNICIPIO').AsString);
            mBody2.Lines.Add(FrmPrincipal.QEmpresa.FieldByName('CEP').AsString);
          end
          else if Modelo_Carta.Text = 'E-mail de Cobrança (4º Aviso)' then
          begin

            mBody.Lines.Add(Copy(DstList.Items.Strings[I],7,35)+'   -   ' + Copy(DstList.Items.Strings[I],1,5) );
            mBody.Lines.Add('');
            mBody.Lines.Add('');

            mBody.Lines.Add('                              Prezado Cliente,');
            mBody.Lines.Add('');
            mBody.Lines.Add('');
            mBody.Lines.Add('');
            mBody.Lines.Add('                              Tendo em vista que V. Sa. não nos procurou no prazo estipulado em nosso ' +
                                  'último aviso, comunicamos que a(s) Duplicata(s) abaixo relacionada(s) está(ão) sendo levada(s) a protesto ' +
                                  'e o seu CPF será incluso no cadastro SPC/SERASA.');

            mBody2.Lines.Add('                              Esta medida que estamos intentando contra V. Sa., será automaticamente ' +
                                  'desfeita tão logo seja efetuada a quitação da(s) referida(s) Duplicatas.');
            mBody2.Lines.Add('');
            mBody2.Lines.Add('');
            mBody2.Lines.Add('');
            mBody2.Lines.Add('                              Atenciosamente,');
            mBody2.Lines.Add('');
            mBody2.Lines.Add('');
            mBody2.Lines.Add('');
            mBody2.Lines.Add(FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString);
            mBody2.Lines.Add(FrmPrincipal.QEmpresa.FieldByName('ENDERECO').AsString + ', Nº' + FrmPrincipal.QEmpresa.FieldByName('NUMERO').AsString );
            mBody2.Lines.Add(FrmPrincipal.QEmpresa.FieldByName('BAIRRO').AsString);
            mBody2.Lines.Add(FrmPrincipal.QEmpresa.FieldByName('MUNICIPIO').AsString);
            mBody2.Lines.Add(FrmPrincipal.QEmpresa.FieldByName('CEP').AsString);
          end;


          QRel.Sql.Clear;
          QRel.Sql.Add('SELECT CLIENTES.NOME, CLIENTES.ENDERECO, CLIENTES.NUMERO, CLIENTES.MUNICIPIO, CLIENTES.CNPJ,');
          QRel.Sql.Add('CLIENTES.BAIRRO, CLIENTES.CEP, CLIENTES.ESTADO, CLIENTES.TELEFONE_1, CLIENTES.CLIENTE_ID, CLIENTES.INSCRICAO ');


          QRel.Sql.Add(',TRANSACOES.DT_TRANS, TRANSACOES.NUM_DOC, TRANSACOES.VALOR, TRANSPARCELAS.ESPECIE,');
          QRel.Sql.Add('TRANSPARCELAS.DT_VENCIMENTO, TRANSPARCELAS.VALOR AS VR_PARCELA, TRANSPARCELAS.DUPLICATA, TRANSPARCELAS.PARCELA_ID');


          QRel.Sql.Add('FROM TRANSPARCELAS');
          QRel.Sql.Add('INNER JOIN TRANSACOES');
          QRel.Sql.Add('ON (TRANSPARCELAS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
          QRel.Sql.Add('INNER JOIN CLIENTES');
          QRel.Sql.Add('ON (TRANSACOES.CLIENTE_ID = CLIENTES.CLIENTE_ID)');
          QRel.Sql.Add('WHERE');
          QRel.Sql.Add('(TRANSACOES.CONDUTA = :CONDUTA)');
          QRel.Sql.Add('AND (TRANSACOES.COND_PAGTO = :COND_PAGTO)');
          QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');


          QRel.Sql.Add('AND (CLIENTES.CLIENTE_ID = :CLIENTE_ID)');
          QRel.ParamByName('CLIENTE_ID').AsInteger := StrToInt(Copy(DstList.Items.Strings[I],1,5));


          QRel.Sql.Add('AND (TRANSPARCELAS.VALOR > 0)');
          QRel.Sql.Add('AND (TRANSPARCELAS.BANCO_ID = 0)');
          QRel.Sql.Add('AND (TRANSPARCELAS.DT_VENCIMENTO BETWEEN :DT_INICIAL AND :DT_FINAL)');
          QRel.Sql.Add('AND (TRANSPARCELAS.TIPO_TRANSACAO = :TIPO_TRANSACAO)');
          QRel.Sql.Add('AND ((TRANSPARCELAS.AGRUPAMENTO = 0) OR (TRANSPARCELAS.AGRUPAMENTO IS NULL))');

          if Chk_Empresa.Checked Then
          Begin
          QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
          QRel.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
          End;


          if Classe.Text <> '' then
          begin
            QRel.Sql.Add('AND (CLIENTES.TIPO = :CLASSE)');
            QRel.ParamByName('CLASSE').AsString := Classe.Text;
          end;

          QRel.Sql.Add('ORDER BY CLIENTES.NOME, TRANSPARCELAS.DT_VENCIMENTO');


          QRel.ParamByName('TIPO_TRANSACAO').AsString := 'T';
          QRel.ParamByName('CONDUTA').AsString        := '01';
          QRel.ParamByName('COND_PAGTO').AsString     := 'A PRAZO';
          QRel.ParamByName('TPCTB').AsString          := FrmData.QAcesso.FieldByName('TPCTB').AsString;
          QRel.ParamByName('DT_INICIAL').AsDateTime   := Dtmen.Date;
          QRel.ParamByName('DT_FINAL').AsDateTime     := Dtmai.Date;

          QRel.Prepare;
          QRel.Open;
          QRel.First;

          mbody1.Lines.Clear;
          mBody1.Lines.Add('Parcela              Especie            Duplicata           Vencimento        Parcela          Corrigido  ');

          while not QRel.Eof do
          Begin


            vr_parcela       := 0;
            Valor_corrigido  := 0;
            TT               := 0;
            Dif              := 0;
            Multa            := 0;
            Correc           := 0;

            if (FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime > QRel.FieldByName('DT_VENCIMENTO').AsDateTime) and (FrmPrincipal.Config.FieldByName('JUROS_MENSAL').AsFloat > 0) then
            begin
              Dif    := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime - QRel.FieldByName('DT_VENCIMENTO').AsDateTime;
              Correc := ((((QRel.FieldByName('VR_PARCELA').AsFloat * FrmPrincipal.Config.FieldByName('JUROS_MENSAL').AsFloat) / 100) / 30) * Dif);
              Correc := RoundTo(Correc, -2);
              TT     := TT + QRel.FieldByName('VR_PARCELA').AsFloat + Correc;
            end;

            if ((QRel.FieldByName('DT_VENCIMENTO').AsDateTime + FrmPrincipal.Config.FieldByName('CARENCIA').AsInteger) <= Date) AND (QRel.FieldByName('ESPECIE').AsString <> 'RESTANTE') then
            Begin
            Multa  := ((QRel.FieldByName('VALOR').AsFloat * FrmPrincipal.Config.FieldByName('MULTA').AsFloat) / 100);
            Multa  := RoundTo(Multa, -2);
            End
            Else
            Multa  := 0;

            Valor_corrigido := QRel.FieldByName('VR_PARCELA').AsFloat + Correc + Multa;
            TT_parcela      := TT_parcela+ QRel.FieldByName('VR_PARCELA').AsFloat;
            TT_Corrigido    := TT_Corrigido + Valor_corrigido;

            Parcela    := QRel.FieldByName('PARCELA_ID').AsString;
            especie    := ForcaComprimento(QRel.FieldByName('ESPECIE').AsString, 11, ' ');
            Duplicata  := ForcaComprimento(QRel.FieldByName('DUPLICATA').AsString, 11, ' ');
            Vencimento := DateToStr(QRel.FieldByName('DT_VENCIMENTO').AsDateTime);
            vr_parcela := (QRel.FieldByName('VR_PARCELA').AsFloat);
            corrigido  := (Valor_corrigido);


            mBody1.Lines.Add(Parcela +'          '+ Especie +'                         '+ Duplicata +'         '+ Vencimento +'       R$'+ FormatFloat('#,##0.00',vr_parcela) +'             R$' + FormatFloat('#,##0.00',corrigido) +#13);


            QRel.Next;

          End;
            mBody1.Lines.Add(''+#13);
            mBody1.Lines.Add('                                                              Total----->                    R$'+FormatFloat('#,##0.00',tt_parcela) +'             R$' + FormatFloat('#,##0.00',tt_corrigido) +#13);



          cbHTML.Checked := True;


          btn_envioClick(Sender);

          edtRecipients.Text    := 'clenioeficaz@yahoo.com.br';

          btn_envioClick(Sender);


        finally


          FrmAguarde.Release;


        end;

      end;
     end;
    end;
  finally
    btnExecuta.Enabled    := True;
    btnRetorna.Enabled    := True;
    DstList.Clear;
  end;
end;

procedure TFrmCartas_Cobranca_email.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCartas_Cobranca_email.btnSelecaoClick(Sender: TObject);
begin
      SrcList.Clear;

      QRel.Sql.Clear;
      QRel.Sql.Add('SELECT CLIENTES.NOME, CLIENTES.ENDERECO, CLIENTES.NUMERO, CLIENTES.MUNICIPIO, CLIENTES.CNPJ,');
      QRel.Sql.Add('CLIENTES.BAIRRO, CLIENTES.CEP, CLIENTES.ESTADO, CLIENTES.TELEFONE_1, CLIENTES.CLIENTE_ID, CLIENTES.INSCRICAO ');
      QRel.Sql.Add(',SUM(TRANSACOES.VALOR) VALOR,');
      QRel.Sql.Add('SUM(TRANSPARCELAS.VALOR) AS VR_PARCELA');

      QRel.Sql.Add('FROM TRANSPARCELAS');
      QRel.Sql.Add('INNER JOIN TRANSACOES');
      QRel.Sql.Add('ON (TRANSPARCELAS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
      QRel.Sql.Add('INNER JOIN CLIENTES');
      QRel.Sql.Add('ON (TRANSACOES.CLIENTE_ID = CLIENTES.CLIENTE_ID)');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSACOES.CONDUTA = :CONDUTA)');
      QRel.Sql.Add('AND (TRANSACOES.COND_PAGTO = :COND_PAGTO)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (CLIENTES.EMAIL <> :VAZIO)');

      if Cliente.Value > 0 then
      begin
        QRel.Sql.Add('AND (CLIENTES.CLIENTE_ID = :CLIENTE_ID)');
        QRel.ParamByName('CLIENTE_ID').AsInteger := StrToInt(Cliente.Text);
      end;

      QRel.Sql.Add('AND (TRANSPARCELAS.VALOR > 0)');
      QRel.Sql.Add('AND (TRANSPARCELAS.BANCO_ID = 0)');
      QRel.Sql.Add('AND (TRANSPARCELAS.DT_VENCIMENTO BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('AND (TRANSPARCELAS.TIPO_TRANSACAO = :TIPO_TRANSACAO)');
      QRel.Sql.Add('AND ((TRANSPARCELAS.AGRUPAMENTO = 0) OR (TRANSPARCELAS.AGRUPAMENTO IS NULL))');

      if Classe.Text <> '' then
      begin
        QRel.Sql.Add('AND (CLIENTES.TIPO = :CLASSE)');
        QRel.ParamByName('CLASSE').AsString := Classe.Text;
      end;


      if Chk_Empresa.Checked Then
      Begin
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
      End;

      QRel.Sql.Add('GROUP BY CLIENTES.CLIENTE_ID,CLIENTES.NOME,CLIENTES.ENDERECO,CLIENTES.NUMERO,CLIENTES.MUNICIPIO,CLIENTES.CNPJ,');
      QRel.Sql.Add('CLIENTES.BAIRRO,CLIENTES.CEP, CLIENTES.ESTADO,CLIENTES.TELEFONE_1,CLIENTES.INSCRICAO');
      QRel.Sql.Add('ORDER BY CLIENTES.NOME');

      QRel.ParamByName('TIPO_TRANSACAO').AsString := 'T';


      QRel.ParamByName('CONDUTA').AsString        := '01';
      QRel.ParamByName('COND_PAGTO').AsString     := 'A PRAZO';
      QRel.ParamByName('TPCTB').AsString          := FrmData.QAcesso.FieldByName('TPCTB').AsString;
      QRel.ParamByName('DT_INICIAL').AsDateTime   := Dtmen.Date;
      QRel.ParamByName('DT_FINAL').AsDateTime     := Dtmai.Date;
      QRel.ParamByName('VAZIO').AsString          := '';

      QRel.Prepare;
      QRel.Open;
      QRel.First;

      while NOT QRel.Eof do
      Begin
      SrcList.Items.Add(StrZero(QRel.FieldByName('CLIENTE_ID').AsString, 5, 0) +'-'+ ForcaComprimento(QRel.FieldByName('NOME').AsString,35,' ') + ' - '
      + 'R$ ' + FormatFloat('#,##0.00', QRel.FieldByName('VR_PARCELA').AsFloat));
      QRel.Next;
      End;

  if not QRel.IsEmpty then
  begin
    IncludeBtn.Enabled := True;
    IncAllBtn.Enabled  := True;
    SrcList.Enabled    := True;
    DstList.Enabled    := True;

    SrcList.SetFocus;
    Keybd_Event(VK_LEFT, 0, 0, 0);
  end
  else
  begin
     Application.MessageBox('Não há dados com esses parâmetros', PChar(Msg_Title), mb_IconInformation);
     Dtmen.SetFocus;
  end;

end;


procedure TFrmCartas_Cobranca_email.btn_envioClick(Sender: TObject);
begin
try
    ConfigureSMTP;
    ConfigureMessage;
    SendMain;
  except
   Erro_Envio := True;
  end;
end;

procedure TFrmCartas_Cobranca_email.CartaBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  TT := 0;
  PG := 1;
end;

procedure TFrmCartas_Cobranca_email.ClienteExit(Sender: TObject);
begin
  DetailSearch('Cliente');
end;

procedure TFrmCartas_Cobranca_email.ClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = Cliente) then
    btnClienteClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmCartas_Cobranca_email.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmCartas_Cobranca_email.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmCartas_Cobranca_email.ExAllBtnClick(Sender: TObject);
var
I: Integer;
begin
  QItens.Close;

  for I := 0 to DstList.Items.Count - 1 do
    SrcList.Items.AddObject(DstList.Items[I], DstList.Items.Objects[I]);

  DstList.Items.Clear;
  SetItem(DstList, 0);

end;

procedure TFrmCartas_Cobranca_email.ExcludeBtnClick(Sender: TObject);
var
Index: Integer;
begin
  QItens.Close;

  Index := GetFirstSelection(DstList);
  MoveSelected(DstList, SrcList.Items);
  SetItem(DstList, Index);

end;


procedure TFrmCartas_Cobranca_email.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmCartas_Cobranca_email.FormCreate(Sender: TObject);
begin
  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);

  TT := 0;
  PG := 1;

  SrcList.Style := lbOwnerDrawFixed;
  DstList.Style := lbOwnerDrawFixed;
  Erro_Envio := False;
end;

procedure TFrmCartas_Cobranca_email.IdSMTPFailedRecipient(Sender: TObject;
  const AAddress, ACode, AText: string; var VContinue: Boolean);
begin
begin
  mLog.Lines.Add(Format('SMTP FaliledRecipient: Address %s, Code %s, AText %s', [AAddress, ACode, AText]));
  VContinue := False;
end;

end;

procedure TFrmCartas_Cobranca_email.IdSMTPStatus(ASender: TObject;
  const AStatus: TIdStatus; const AStatusText: string);
begin
   mLog.Lines.Add('SMTP Status: ' + AStatusText);
end;

procedure TFrmCartas_Cobranca_email.IncAllBtnClick(Sender: TObject);
var
I: Integer;
begin
  QItens.Close;

  for I := 0 to SrcList.Items.Count - 1 do
    DstList.Items.AddObject(SrcList.Items[I], SrcList.Items.Objects[I]);

  SrcList.Items.Clear;
  SetItem(SrcList, 0);

end;

procedure TFrmCartas_Cobranca_email.IncludeBtnClick(Sender: TObject);
var
Index: Integer;
begin
  QItens.Close;

  Index := GetFirstSelection(SrcList);
  MoveSelected(SrcList, DstList.Items);
  SetItem(SrcList, Index);

end;

procedure TFrmCartas_Cobranca_email.QRBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  TT := 0;
end;

procedure TFrmCartas_Cobranca_email.QRGroup1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  Inc(PG);
end;

end.
