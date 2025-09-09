unit UAvisos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, StrUtils;

type
  TFrmAvisos = class(TForm)
    DBGrid1: TDBGrid;
    QSub_Detail: TFDQuery;
    IQuery: TFDQuery;
    DataTabela: TDataSource;
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    btnRetorna: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1Exit(Sender: TObject);
    procedure btnRetornaClick(Sender: TObject);
    procedure DBGrid1ColExit(Sender: TObject);
    procedure QSub_DetailBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAvisos: TFrmAvisos;

implementation

uses
  UConsulta;

{$R *.dfm}

procedure TFrmAvisos.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmAvisos.DBGrid1ColExit(Sender: TObject);
begin
  if MatchStr(DBGrid1.SelectedField.FieldName, ['aviso1_hora','aviso2_hora','aviso3_hora']) then
  begin
    QSub_Detail.FieldByName(DBGrid1.SelectedField.FieldName).AsString := StringReplace(QSub_Detail.FieldByName(DBGrid1.SelectedField.FieldName).AsString,' ','0',[rfReplaceAll]);
  end;
end;

procedure TFrmAvisos.DBGrid1Exit(Sender: TObject);
begin
  if QSub_Detail.State in [dsInsert, dsEdit] then
  begin
    QSub_Detail.Cancel;
  end;
end;

procedure TFrmAvisos.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F4) and (QSub_Detail.State = dsBrowse) and (not QSub_Detail.IsEmpty) then
    QSub_Detail.Delete;

  if (Key = Vk_F7) then
  begin
    if QSub_Detail.State = dsBrowse then
    begin
      if QSub_Detail.IsEmpty then
        QSub_Detail.Insert
      else
        QSub_Detail.Edit;
    end;

    if DBGrid1.SelectedField.FieldName = 'nome' then
    begin
      try
        QSub_Detail.FieldByName('FUNCIONARIO_ID').AsInteger := GetConsulta('PESSOAL', 0, 0, QSub_Detail.FieldByName('FUNCIONARIO_ID').AsInteger);
      except
        QSub_Detail.FieldByName('FUNCIONARIO_ID').AsInteger := GetConsulta('PESSOAL', 0, 0, 0);
      end;

      IQuery.SQL.Clear;
      IQuery.SQL.Add('SELECT NOME FROM FUNCIONARIOS WHERE FUNCIONARIO_ID = :FUNCIONARIO_ID');
      IQuery.ParamByName('FUNCIONARIO_ID').AsInteger := QSub_Detail.FieldByName('FUNCIONARIO_ID').AsInteger;
      IQuery.Prepare;
      IQuery.Open;

      QSub_Detail.FieldByName('NOME').AsString := IQuery.FieldByName('NOME').AsString;
    end;

    if DBGrid1.SelectedField.FieldName = 'razao' then
    begin
      try
        QSub_Detail.FieldByName('EMPRESA_ID').AsInteger := GetConsulta('EMPRESAS', 0, 0, QSub_Detail.FieldByName('EMPRESA_ID').AsInteger);
      except
        QSub_Detail.FieldByName('EMPRESA_ID').AsInteger := GetConsulta('EMPRESAS', 0, 0, 0);
      end;

      IQuery.SQL.Clear;
      IQuery.SQL.Add('SELECT RAZAO FROM EMPRESAS WHERE EMPRESA_ID = :EMPRESA_ID');
      IQuery.ParamByName('EMPRESA_ID').AsInteger := QSub_Detail.FieldByName('EMPRESA_ID').AsInteger;
      IQuery.Prepare;
      IQuery.Open;

      QSub_Detail.FieldByName('RAZAO').AsString := IQuery.FieldByName('RAZAO').AsString;
    end;
  end;

  if Key = VK_F9 then
  Begin
    Perform(Wm_NextDlgCtl, 0, 0);
  End;

  if ((Key = Vk_Up) or (Key = Vk_Down)) and (QSub_Detail.State in [dsInsert, dsEdit]) then
    Key := 0;
end;

procedure TFrmAvisos.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #46 then
    Key := #44;

  if Key = #13 then
    Keybd_Event(VK_TAB, 0, 0, 0);

  Key := AnsiUpperCase(Key)[1];

  Application.ProcessMessages
end;

procedure TFrmAvisos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmAvisos.FormCreate(Sender: TObject);
begin
  QSub_Detail.Prepare;
  QSub_Detail.Open;

  QSub_Detail.FieldByName('AVISO1_HORA').EditMask := '!00:00:00;1;0';
  QSub_Detail.FieldByName('AVISO2_HORA').EditMask := '!00:00:00;1;0';
  QSub_Detail.FieldByName('AVISO3_HORA').EditMask := '!00:00:00;1;0';
end;

procedure TFrmAvisos.QSub_DetailBeforePost(DataSet: TDataSet);
begin
  DBGrid1ColExit(Self);
end;

end.
