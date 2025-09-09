unit USql;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, Grids, DBGrids, StdCtrls, Buttons,
  ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmSql = class(TForm)
    Panel1: TPanel;
    btnRetorna: TBitBtn;
    btnTxt: TBitBtn;
    Memo1: TMemo;
    btnExecuta: TButton;
    btnAbre: TButton;
    DBGrid1: TDBGrid;
    DataTabela: TDataSource;
    QSql: TFDQuery;
    procedure btnRetornaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExecutaClick(Sender: TObject);
    procedure btnAbreClick(Sender: TObject);
    procedure btnTxtClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSql: TFrmSql;

implementation

uses
  UData, UPrincipal;

{$R *.dfm}

procedure TFrmSql.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmSql.btnTxtClick(Sender: TObject);
var
F1: TextFile;
X, Tam_Cmp: Integer;
Cmp: String;
begin
  AssignFile(F1, ExtractFilePath(ParamStr(0)) + 'TxtSql.Txt');
  Rewrite(F1);

  try
    QSql.First;
    while not QSql.Eof do
    begin
      Cmp := '';

      for X := 0 to (QSql.FieldCount - 1) do
      begin
        if (QSql.Fields[X].DataType = ftInteger) or (QSql.Fields[X].DataType = ftSmallint) or (QSql.Fields[X].DataType = ftWord) then
          Cmp := Cmp + StrZero(QSql.Fields[X].AsString, 6, 0)
        else if (QSql.Fields[X].DataType = ftFloat) or (QSql.Fields[X].DataType = ftCurrency) then
          Cmp := Cmp + StrZero(QSql.Fields[X].AsString, 12, 2)
        else
        begin
          Tam_Cmp := (QSql.Fields[X].DataSize - 1);
          Cmp := Cmp + ForcaComprimento(QSql.Fields[X].AsString, Tam_Cmp, ' ');
        end;
      end;

      WriteLn(F1, Cmp);

      Application.ProcessMessages;
      QSql.Next;
    end;
  finally
    CloseFile(F1);
  end;
end;

procedure TFrmSql.btnExecutaClick(Sender: TObject);
begin
  try
    QSql.Sql.Clear;
    QSql.Sql.Text := Memo1.Text;
    QSql.Prepare;
    QSql.ExecSql;



    if not QSql.IsEmpty then
      btnTxt.Enabled := True
    else
      btnTxt.Enabled := False;
  except
    on e:Exception do
    begin
      Application.MessageBox(PChar('Erro ao executar o comando' + #13 +
        'Erro: ' + e.Message), PChar(Msg_Title), mb_IconStop + mb_TaskModal);
    end;
  end;
end;

procedure TFrmSql.btnAbreClick(Sender: TObject);
begin
  try
    QSql.Sql.Clear;
    QSql.Sql.Text := Memo1.Text;
    QSql.Open;

    if not QSql.IsEmpty then
      btnTxt.Enabled := True
    else
      btnTxt.Enabled := False;
  except
    on e:Exception do
    begin
      Application.MessageBox(PChar('Erro ao executar o comando' + #13 +
        'Erro: ' + e.Message), PChar(Msg_Title), mb_IconStop + mb_TaskModal);
    end;
  end;
end;

procedure TFrmSql.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
