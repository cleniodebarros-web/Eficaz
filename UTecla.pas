unit UTecla;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, IBCustomDataSet, IBQuery, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmTecla = class(TForm)
    Bevel1: TBevel;
    btnExecuta: TButton;
    btnRetorna: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Finalizadora: TEdit;
    Tecla: TEdit;
    QUpdate: TFDQuery;
    procedure TeclaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure TeclaKeyPress(Sender: TObject; var Key: Char);
    procedure btnExecutaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTecla: TFrmTecla;

implementation

uses
  UData, UConf_Teclado;

{$R *.dfm}

procedure TFrmTecla.btnExecutaClick(Sender: TObject);
begin
  if Fnc = 'F' then
    Fnc := Fnc + Finalizadora.Text;

  QUpdate.Sql.Clear;
  QUpdate.Sql.Add('DELETE FROM TECLADO');
  QUpdate.Sql.Add('WHERE');
  QUpdate.Sql.Add('(FUNCAO = :FUNCAO)');

  QUpdate.ParamByName('FUNCAO').AsString := Fnc;

  QUpdate.Prepare;
  QUpdate.ExecSql;

  QUpdate.Sql.Clear;
  QUpdate.Sql.Add('SELECT * FROM TECLADO');
  QUpdate.Sql.Add('WHERE');
  QUpdate.Sql.Add('(TECLA = :TECLA)');

  QUpdate.ParamByName('TECLA').AsInteger := StrToInt(Tecla.Text);

  QUpdate.Prepare;
  QUpdate.Open;

  if QUpdate.IsEmpty then
  begin
    QUpdate.Sql.Clear;
    QUpdate.Sql.Add('INSERT INTO TECLADO(' +
                    'TECLA,               FUNCAO,              FINALIZADORA_ID, ' +
                    'CONTEUDO) VALUES(' +
                    ':TECLA,              :FUNCAO,             :FINALIZADORA_ID, ' +
                    ':CONTEUDO)');

    QUpdate.ParamByName('TECLA').AsInteger := StrToInt(Tecla.Text);
    QUpdate.ParamByName('FUNCAO').AsString := Fnc;

    if Finalizadora.Text <> '' then
      QUpdate.ParamByName('FINALIZADORA_ID').AsInteger := StrToInt(Finalizadora.Text)
    else
      QUpdate.ParamByName('FINALIZADORA_ID').AsString := '';

    QUpdate.ParamByName('CONTEUDO').AsString := '';

    if (Fnc = '0') or (Fnc = '1') or (Fnc = '2') or (Fnc = '3') or (Fnc = '4') or (Fnc = '5') or (Fnc = '6') or (Fnc = '7') or (Fnc = '8') or (Fnc = '9') then
      QUpdate.ParamByName('CONTEUDO').AsString := Fnc;

    if (Fnc = '.') or (Fnc = ',')  then
      QUpdate.ParamByName('CONTEUDO').AsString := ',';

    QUpdate.Prepare;
    QUpdate.ExecSql;


  end
  else
  begin
    QUpdate.Sql.Clear;
    QUpdate.Sql.Add('UPDATE TECLADO SET ' +
                    'FUNCAO   = :FUNCAO,   FINALIZADORA_ID = :FINALIZADORA_ID, ' +
                    'CONTEUDO = :CONTEUDO ' +
                    'WHERE ' +
                    '(TECLA = :TECLA)');

    QUpdate.ParamByName('FUNCAO').AsString := Fnc;

    if Finalizadora.Text <> '' then
      QUpdate.ParamByName('FINALIZADORA_ID').AsInteger := StrToInt(Finalizadora.Text)
    else
      QUpdate.ParamByName('FINALIZADORA_ID').AsString := '';

    QUpdate.ParamByName('CONTEUDO').AsString := '';

    if (Fnc = '0') or (Fnc = '1') or (Fnc = '2') or (Fnc = '3') or (Fnc = '4') or (Fnc = '5') or (Fnc = '6') or (Fnc = '7') or (Fnc = '8') or (Fnc = '9') then
      QUpdate.ParamByName('CONTEUDO').AsString := Fnc;

    if (Fnc = '.') or (Fnc = ',')  then
      QUpdate.ParamByName('CONTEUDO').AsString := ',';

    QUpdate.ParamByName('TECLA').AsInteger := StrToInt(Tecla.Text);

    QUpdate.Prepare;
    QUpdate.ExecSql;


  end;

  QUpdate.Sql.Clear;
  QUpdate.Sql.Add('UPDATE TECLADO SET CONTEUDO = NULL');
  QUpdate.Sql.Add('WHERE');
  QUpdate.Sql.Add('(CONTEUDO = :CONTEUDO)');

  QUpdate.ParamByName('CONTEUDO').AsString := '';

  QUpdate.Prepare;
  QUpdate.ExecSql;



  FrmTecla.ModalResult := mrOK;
end;

procedure TFrmTecla.FormCreate(Sender: TObject);
begin
  if (Copy(Fnc, 1, 1) = 'F') and (Copy(Fnc, 2, 2) <> '') then
    Finalizadora.Text := Copy(Fnc, 2, 2);

  if Copy(Fnc, 1, 1) = 'F' then
    Finalizadora.Enabled := True;
end;

procedure TFrmTecla.TeclaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Sender = Tecla then
    Tecla.Text := IntToStr(Key);
end;

procedure TFrmTecla.TeclaKeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;

end.
