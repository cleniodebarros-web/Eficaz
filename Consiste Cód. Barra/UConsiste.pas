unit UConsiste;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, IBDatabase, StdCtrls, Mask, rxToolEdit,
  rxCurrEdit, Buttons, ExtCtrls;

type
  TFrmConsiste_Codigo = class(TForm)
    Bevel1: TBevel;
    btnExecuta: TBitBtn;
    btnRetorna: TBitBtn;
    Transitens: TCheckBox;
    Produtos: TCheckBox;
    Id_Transacao: TCurrencyEdit;
    Label1: TLabel;
    DB_Eficaz: TIBDatabase;
    Trans_Eficaz: TIBTransaction;
    QRel: TIBQuery;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsiste_Codigo: TFrmConsiste_Codigo;

implementation

uses
  Funcoes;

{$R *.dfm}

procedure TFrmConsiste_Codigo.btnExecutaClick(Sender: TObject);
var
F1: TextFile;
Tem_Erro: Boolean;
begin
  if Transitens.Checked then
  begin
    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT TRANSITENS.*, PRODUTOS.COD_BARRA');
    QRel.Sql.Add('FROM TRANSITENS');
    QRel.Sql.Add('INNER JOIN PRODUTOS');
    QRel.Sql.Add('ON (TRANSITENS.PRODUTO_ID = PRODUTOS.PRODUTO_ID)');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(TRANSITENS.TRANSACAO_ID = :TRANSACAO_ID)');

    QRel.ParamByName('TRANSACAO_ID').AsInteger := StrToInt(Id_Transacao.Text);

    QRel.Prepare;
    QRel.Open;

    Tem_Erro := False;

    AssignFile(F1, ExtractFilePath(ParamStr(0)) + 'Erros.Txt');
    Rewrite(F1);

    QRel.First;
    while not QRel.Eof do
    begin
      if not Digito(QRel.FieldByName('COD_BARRA').AsString) then
      begin
        Tem_Erro := True;

        Writeln(F1, StrZero(QRel.FieldByName('PRODUTO_ID').AsString, 6, 0) + ' ' +
                    StrZero(QRel.FieldByName('COD_BARRA').AsString, 13, 0) + ' ' +
                    StrZero(Dig(QRel.FieldByName('PRODUTO_ID').AsString), 13, 0) + ' ' +
                    QRel.FieldByName('DESCRICAO').AsString);
      end;

      Label2.Caption := QRel.FieldByName('DESCRICAO').AsString;

      Application.ProcessMessages;

      QRel.Next;
    end;

    CloseFile(F1);

    if Tem_Erro then
      WinExec(PChar('NOTEPAD.EXE' + ' ' + ExtractFilePath(ParamStr(0)) + 'Erros.Txt'), SW_SHOW)
    else
      MessageDlg('Após a verificação dos dados não foi encontrada nenhuma inconsistência', mtInformation, [mbOK], 0);
  end;

  if Produtos.Checked then
  begin
    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT * FROM PRODUTOS');

    QRel.Prepare;
    QRel.Open;

    Tem_Erro := False;

    AssignFile(F1, ExtractFilePath(ParamStr(0)) + 'Erros.Txt');
    Rewrite(F1);

    QRel.First;
    while not QRel.Eof do
    begin
      if not Digito(QRel.FieldByName('COD_BARRA').AsString) then
      begin
        Tem_Erro := True;

        Writeln(F1, StrZero(QRel.FieldByName('PRODUTO_ID').AsString, 6, 0) + ' ' +
                    StrZero(QRel.FieldByName('COD_BARRA').AsString, 13, 0) + ' ' +
                    StrZero(Dig(QRel.FieldByName('PRODUTO_ID').AsString), 13, 0) + ' ' +
                    QRel.FieldByName('DESCRICAO').AsString);
      end;

      Label2.Caption := QRel.FieldByName('DESCRICAO').AsString;

      Application.ProcessMessages;

      QRel.Next;
    end;

    CloseFile(F1);

    if Tem_Erro then
      WinExec(PChar('NOTEPAD.EXE' + ' ' + ExtractFilePath(ParamStr(0)) + 'Erros.Txt'), SW_SHOW)
    else
      MessageDlg('Após a verificação dos dados não foi encontrada nenhuma inconsistência', mtInformation, [mbOK], 0);
  end;
end;

procedure TFrmConsiste_Codigo.FormCreate(Sender: TObject);
begin
  DB_Eficaz.Connected    := False;
  DB_Eficaz.DatabaseName := LeIni(ExtractFilePath(ParamStr(0)) + 'Eficaz.Ini', 'Conexão', 'Server Name');

  if (LeIni(ExtractFilePath(ParamStr(0)) + 'Eficaz.Ini', 'Conexão', 'User Name') <> '') and (LeIni(ExtractFilePath(ParamStr(0)) + 'Eficaz.Ini', 'Conexão', 'Password') <> '') then
  begin
    DB_Eficaz.Params.Clear;
    DB_Eficaz.Params.Add('user_name=' + DecryptMsg(LeIni(ExtractFilePath(ParamStr(0)) + 'Eficaz.Ini', 'Conexão', 'User Name'),65));
    DB_Eficaz.Params.Add('password=' + DecryptMsg(LeIni(ExtractFilePath(ParamStr(0)) + 'Eficaz.Ini', 'Conexão', 'Password'),65));
  end;
end;

end.
