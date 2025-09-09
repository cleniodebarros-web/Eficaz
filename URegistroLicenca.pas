unit URegistroLicenca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Mask, rxToolEdit, rxCurrEdit, DB,
  IBCustomDataSet, IBQuery,IdHashMessageDigest, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmRegistroLicenca = class(TForm)
    Bevel1: TBevel;
    Label1: TLabel;
    Licenca: TEdit;
    btnExecuta: TBitBtn;
    btnRetorna: TBitBtn;
    Label65: TLabel;
    QTD_LICENCA: TCurrencyEdit;
    QRel: TFDQuery;
    IQuery1: TFDQuery;
    procedure LicencaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnExecutaClick(Sender: TObject);
    procedure btnRetornaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRegistroLicenca: TFrmRegistroLicenca;

implementation

uses
  UPrincipal, Udata;

{$R *.dfm}

function LogEntry(Cmd, Msg: String; Dig: String): String;
begin
  Result := Format('%s%s' + '%s', [Cmd, Msg, Dig]);
end;

procedure TFrmRegistroLicenca.btnExecutaClick(Sender: TObject);
var
Md5 : TIdHashMessageDigest5;
begin
    Md5 :=  TIdHashMessageDigest5.Create;

    IQuery1.SQL.Clear;
    IQuery1.Sql.Add('SELECT COUNT(*) QTD FROM EMPRESAS WHERE STATUS = :STATUS');
    IQuery1.ParamByName('STATUS').AsString := 'A';
    IQuery1.Prepare;
    IQuery1.Open;

    //MessageDlg(FrmPrincipal.QEmpresa.FieldByName('CNPJ').AsString,mtinformation,[mbok],0);

    //MessageDlg(StrZero(QTD_LICENCA.Text,3,0),mtinformation,[mbok],0);

    //MessageDlg(StrZero(IQuery1.FieldByName('QTD').AsString,2,0),mtinformation,[mbok],0);

    //MessageDlg(LogEntry('', '', MD5String('AMO A DEUS E MINHA FAMILIA' + StrZero(IQuery1.FieldByName('QTD').AsString,2,0)  + StrZero(QTD_LICENCA.Text,3,0) + FrmPrincipal.QEmpresa.FieldByName('CNPJ').AsString)),mtinformation,[mbok],0);


    if Licenca.Text = LogEntry('', '', LowerCase(MD5.HashStringAsHex('AMO A DEUS E MINHA FAMILIA' + StrZero(IQuery1.FieldByName('QTD').AsString,2,0)  + StrZero(QTD_LICENCA.Text,3,0) + FrmPrincipal.QEmpresa.FieldByName('CNPJ').AsString))) Then
  begin
    QRel.Sql.Clear;
    QRel.SQL.Add('UPDATE EMPRESAS SET LICENCA = :LICENCA');
    //QRel.Sql.Add('WHERE EMPRESA_ID = :EMPRESA_ID');

    QRel.ParamByName('LICENCA').AsString     := EncryptMsg('AMO A DEUS E MIMHA FAMILIA'  + StrZero(IQuery1.FieldByName('QTD').AsString,2,0) + StrZero(QTD_LICENCA.Text,3,0) + FrmPrincipal.QEmpresa.FieldByName('CNPJ').AsString,65);
    //QRel.ParamByName('EMPRESA_ID').AsInteger := FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger;
    QRel.Prepare;
    QRel.ExecSQL;


    Application.MessageBox('Licenças adicionadas com sucesso', PChar(Msg_Title), mb_IconInformation);
    Close;
  end
  else
  begin
    Application.MessageBox('O valor digitado está incorreto', PChar(Msg_Title), mb_IconStop);
   // Application.Terminate;
  end;
end;

procedure TFrmRegistroLicenca.btnRetornaClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmRegistroLicenca.LicencaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

end.
