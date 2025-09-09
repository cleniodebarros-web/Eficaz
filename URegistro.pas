unit URegistro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Mask, rxToolEdit,IdHashMessageDigest,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrmRegistro = class(TForm)
    Bevel1: TBevel;
    Label1: TLabel;
    Licenca: TEdit;
    Serial: TLabel;
    btnExecuta: TBitBtn;
    btnRetorna: TBitBtn;
    Dt_Limite: TDateEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    CNPJ: TMaskEdit;
    TIPO_CLIENTE: TComboBox;
    QUpdate: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure LicencaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnExecutaClick(Sender: TObject);
    procedure btnRetornaClick(Sender: TObject);
    procedure LicencaKeyPress(Sender: TObject; var Key: Char);
    procedure TIPO_CLIENTEChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRegistro: TFrmRegistro;
  Especial:Boolean;
  Md5 : TIdHashMessageDigest5;
  Serial_Hd :string;

implementation

uses
  UPrincipal, Udata,UPasswordDlg;

{$R *.dfm}

function LogEntry(Cmd, Msg: String; Dig:String): String;
begin
  Result := Format('%s%s' + '%s', [Cmd, Msg, Dig]);
end;

procedure TFrmRegistro.btnExecutaClick(Sender: TObject);
begin
Md5 :=  TIdHashMessageDigest5.Create;

  if Especial then
  Begin
   QUpdate.SQL.Clear;
   QUpdate.SQL.Add('UPDATE LICENCA SET DT_LIMITE = :DT_LIMITE');
   QUpdate.ParamByName('DT_LIMITE').AsString := EncryptMsg(Dt_Limite.Text, 39);
   QUpdate.Prepare;
   QUpdate.ExecSQL;



  {FrmPrincipal.Licenca.Edit;
  FrmPrincipal.Licenca.Fields[11].AsString := EncryptMsg(Dt_Limite.Text, 39);
  FrmPrincipal.Licenca.Post; }

  FrmPrincipal.Licenca.Refresh;

   Application.MessageBox(Pchar('Registro temporário válido até: ' + DateToStr(Dt_Limite.Date) +  ' ,efetuado com sucesso.'), PChar(Msg_Title), mb_IconInformation);

   Close;
  End
  Else
  Begin
    //Licenca.Text := LogEntry('', '', LowerCase(MD5.HashStringAsHex(DecryptMsg(FrmPrincipal.Licenca.Fields[1].AsString , 39) + CNPJ.Text + SERIAL_HD)));
    if Licenca.Text = LogEntry('', '', LowerCase(MD5.HashStringAsHex(DecryptMsg(FrmPrincipal.Licenca.Fields[1].AsString , 39) + CNPJ.Text + SERIAL_HD))) then
    begin

      QUpdate.SQL.Clear;
      QUpdate.SQL.Add('UPDATE LICENCA SET LICENCA =:LICENCA, DT_LIMITE = :DT_LIMITE WHERE SERIAL =:SERIAL');
      QUpdate.ParamByName('LICENCA').AsString := EncryptMsg(Licenca.Text, 65);
      QUpdate.ParamByName('SERIAL').AsString := SERIAL_HD;

      QUpdate.ParamByName('DT_LIMITE').AsString := '';
      QUpdate.Prepare;
      QUpdate.ExecSQL;



    {  FrmPrincipal.Licenca.Edit;
      FrmPrincipal.Licenca.Fields[2].AsString  := EncryptMsg(Licenca.Text, 65);
      FrmPrincipal.Licenca.Fields[11].AsString := '';
      FrmPrincipal.Licenca.Post;}

      FrmPrincipal.Licenca.Refresh;


       QUpdate.SQL.Clear;
       QUpdate.SQL.Add('UPDATE EMPRESAS SET CNPJ = :CNPJ WHERE EMPRESA_ID = :EMPRESA_ID');

       QUpdate.ParamByName('CNPJ').AsString        := CNPJ.Text ;
       QUpdate.ParamByName('EMPRESA_ID').AsInteger := FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger ;

       QUpdate.Prepare;
       QUpdate.ExecSQL;


      Application.MessageBox('Registro efetuado com sucesso', PChar(Msg_Title), mb_IconInformation);

      Close;
    end
    else
    begin
      Application.MessageBox('O valor digitado está incorreto', PChar(Msg_Title), mb_IconStop);
      Application.Terminate;
    end;
  End;
end;

procedure TFrmRegistro.btnRetornaClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmRegistro.FormCreate(Sender: TObject);
begin

   if LeIni(ExtractFilePath(ParamStr(0))+ 'Eficaz.ini', 'Sistema', 'HD_SSD') = 'True' then
   SERIAL_HD := GetSerialID
   Else
   SERIAL_HD := SerialNum('C');


  Serial.Caption := SERIAL_HD;
  Especial := False;



  if (FrmPrincipal.QEmpresa.FieldByName('CNPJ').AsString = '') or (FrmPrincipal.QEmpresa.FieldByName('CNPJ').IsNull) or
     (FrmPrincipal.QEmpresa.FieldByName('CNPJ').AsString = '00.000.000/0000-00 ') then

  begin
    TIPO_CLIENTE.Enabled := True;
    CNPJ.ReadOnly := False;
  end
  else
  begin
    TIPO_CLIENTE.Text := FrmPrincipal.QEmpresa.FieldByName('TIPO_EMPRESA').AsString;
    CNPJ.Text := FrmPrincipal.QEmpresa.FieldByName('CNPJ').AsString;
  end;


end;

procedure TFrmRegistro.LicencaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);

end;

procedure TFrmRegistro.LicencaKeyPress(Sender: TObject; var Key: Char);
begin
Md5 :=  TIdHashMessageDigest5.Create;
if Key = #018 then
 Begin
 Application.CreateForm(TFrmPasswordDlg, FrmPasswordDlg);
  try
    FrmPasswordDlg.Label1.Caption := 'Insira o Registro temporário:';
    if FrmPasswordDlg.ShowModal = mrOk then
    begin
       if  Copy(FrmPasswordDlg.Password.Text,1,32) = LogEntry('', '', LowerCase(MD5.HashStringAsHex(DecryptMsg(FrmPrincipal.Licenca.Fields[1].AsString , 39) + CNPJ.Text + SERIAL_HD))) then
      begin
      Dt_Limite.Date     := StrToDate(DecryptMsg(UpperCase(Copy(FrmPasswordDlg.Password.Text,33,10)),39));
      Especial           := True;
      BtnExecuta.OnClick(btnexecuta);
      end
      else
        Application.MessageBox('Acesso negado', PChar(Msg_Title), mb_IconStop);
    end;
  finally
  FrmPasswordDlg.Release;
  end;
 End;
end;

procedure TFrmRegistro.TIPO_CLIENTEChange(Sender: TObject);
begin
  if TIPO_CLIENTE.Text = 'PESSOA JURÍDICA' then
  begin
    CNPJ.EditMask := '99.999.999/9999-99;1;_';
  end
  else
  begin
    CNPJ.EditMask := '999.999.999-99;1;_';
  end;

end;

end.
