unit UGerente_vel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, IBCustomDataSet, IBQuery, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmGerente_vel = class(TForm)
    Label1: TLabel;
    GetOperador: TEdit;
    QTeclado: TFDQuery;
    QOperador: TFDQuery;
    procedure GetOperadorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GetOperadorKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Search_Teclado(Key: Word);
    procedure Search_Operador(Operador: String);
  end;

var
  FrmGerente_vel: TFrmGerente_vel;

implementation

uses
  UData, UPrincipal;

{$R *.dfm}

procedure TFrmGerente_vel.Search_Teclado(Key: Word);
begin
  QTeclado.Sql.Clear;
  QTeclado.Sql.Add('SELECT * FROM TECLADO');
  QTeclado.Sql.Add('WHERE');
  QTeclado.Sql.Add('(TECLA = :TECLA)');

  QTeclado.ParamByName('TECLA').AsInteger := Key;

  QTeclado.Prepare;
  QTeclado.Open;
end;

procedure TFrmGerente_vel.Search_Operador(Operador: String);
begin
  QOperador.Sql.Clear;
  QOperador.Sql.Add('SELECT * FROM OPERADORES');
  QOperador.Sql.Add('WHERE');
  QOperador.Sql.Add('(OPERADOR_ID = :OPERADOR_ID)');

  QOperador.ParamByName('OPERADOR_ID').AsString := Operador;

  QOperador.Prepare;
  QOperador.Open;
end;

procedure TFrmGerente_vel.FormCreate(Sender: TObject);
begin
  GetOperador.Text := '';
end;

procedure TFrmGerente_vel.GetOperadorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Search_Teclado(Key);

  if QTeclado.IsEmpty then
    exit;

  if QTeclado.FieldByName('CONTEUDO').AsString <> '' then
  begin
    if Key in [96..105] then
    else
      GetOperador.Text := GetOperador.Text + QTeclado.FieldByName('CONTEUDO').AsString
  end;

  if (GetOperador.Text <> '') then
  begin
    Search_Operador(StrZero(GetOperador.Text, 14, 0));

    if not QOperador.IsEmpty then
      FrmGerente.ModalResult := mrOK
    else
      Label1.Caption := 'Cód. inválido. Digite Limpa';
  end;

  if QTeclado.FieldByName('FUNCAO').AsString = 'ESC' then
    FrmGerente.ModalResult := mrCancel;

  if QTeclado.FieldByName('FUNCAO').AsString = 'LIMPA' then
  begin
    Label1.Caption := 'Passe o cartão do supervisor';
    GetOperador.Text := '';
  end;
end;

procedure TFrmGerente_vel.GetOperadorKeyPress(Sender: TObject; var Key: Char);
begin
  if Key in ['0'..'9'] then
  else
    Key := #0;
end;

end.
