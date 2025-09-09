unit UTrocar_Senha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, IBCustomDataSet, IBQuery, Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmTrocar_Senha = class(TForm)
    Bevel1: TBevel;
    Label4: TLabel;
    Old_Senha: TEdit;
    Label1: TLabel;
    New_Senha: TEdit;
    btnExecuta: TBitBtn;
    QUpdate: TFDQuery;
    procedure FormShow(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure Old_SenhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTrocar_Senha: TFrmTrocar_Senha;

implementation

uses
  UData, UPrincipal;

{$R *.dfm}

procedure TFrmTrocar_Senha.btnExecutaClick(Sender: TObject);
begin
  if Old_Senha.Text = New_Senha.Text then
  begin
    QUpdate.Sql.Clear;
    QUpdate.Sql.Add('UPDATE ACESSO SET SENHA = :SENHA, TROCAR_SENHA = :TROCAR_SENHA');
    QUpdate.Sql.Add('WHERE');
    QUpdate.Sql.Add('(FUNCIONARIO_ID = :FUNCIONARIO_ID)');
    QUpdate.Sql.Add('AND (SENHA = :SENHA2)');

    QUpdate.ParamByName('SENHA').AsString           := EncryptMsg(New_Senha.Text, 65);
    QUpdate.ParamByName('TROCAR_SENHA').AsString    := 'NÃO';
    QUpdate.ParamByName('FUNCIONARIO_ID').AsInteger := FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger;
    QUpdate.ParamByName('SENHA2').AsString          := FrmData.QAcesso.FieldByName('SENHA').AsString;

    QUpdate.Prepare;
    QUpdate.ExecSql;

    Application.MessageBox('Senha alterada com sucesso.', PChar(Msg_Title), MB_ICONINFORMATION);

    Close;
  end
  else
    Application.MessageBox('Os valores digitados não conferem', PChar(Msg_Title), mb_IconStop);
end;

procedure TFrmTrocar_Senha.FormShow(Sender: TObject);
begin
  Old_Senha.Text := DecryptMsg(FrmData.QAcesso.FieldByName('SENHA').AsString, 65);
  New_Senha.Text := DecryptMsg(FrmData.QAcesso.FieldByName('SENHA').AsString, 65);
end;

procedure TFrmTrocar_Senha.Old_SenhaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

end.
