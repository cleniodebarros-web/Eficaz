unit UAnot_Inadimplencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, IBCustomDataSet, Grids, DBGrids, IBQuery,
  IBUpdateSQL, ExtCtrls, rxToolEdit, Mask, rxCurrEdit, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ComCtrls;

type
  TFrmAnot_Inadimplencia = class(TForm)
    Panel1: TPanel;
    btnRetorna: TBitBtn;
    IQuery: TFDQuery;
    QTabela: TFDQuery;
    Grid_Inadimplencia: TDBGrid;
    StatusBar2: TStatusBar;
    Data_Inadimplencia: TDataSource;
    procedure Grid_ItensKeyPress(Sender: TObject; var Key: Char);
    procedure QTabelaBeforeDelete(DataSet: TDataSet);
    procedure QTabelaBeforeEdit(DataSet: TDataSet);
    procedure QTabelaNewRecord(DataSet: TDataSet);
    procedure Grid_InadimplenciaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  FrmAnot_Inadimplencia: TFrmAnot_Inadimplencia;
  Id_Trans, Id_cli, Id_fun: Integer;
  Desc_Prod,Nome_Funcionario:String;
  Altera: Boolean;

  procedure Inadimplencia(cliente_id,funcionario_id: Integer);

implementation

uses
  UData, UPrincipal;

{$R *.dfm}

procedure Inadimplencia(cliente_id,funcionario_id: Integer );
begin

  Id_Cli    := cliente_id;
  id_fun    := funcionario_id;

  Application.CreateForm(TFrmAnot_Inadimplencia, FrmAnot_Inadimplencia);
  try
    FrmAnot_Inadimplencia.ShowModal;
  finally
    FrmAnot_Inadimplencia.Release;
  end;
end;


procedure TFrmAnot_Inadimplencia.QTabelaBeforeDelete(DataSet: TDataSet);
begin
 if FrmData.QAcesso.FieldByName('EXCLUSAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para exclusão', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  if Application.MessageBox('Deseja realmente excluir?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = IDNO then
    abort;
end;

procedure TFrmAnot_Inadimplencia.QTabelaBeforeEdit(DataSet: TDataSet);
begin
  if FrmData.QAcesso.FieldByName('ALTERACAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para alteração', PChar(Msg_Title), mb_IconStop);
    exit;
  end;
end;

procedure TFrmAnot_Inadimplencia.QTabelaNewRecord(DataSet: TDataSet);
begin
DataSet['DT_CADASTRO'] := date;
DataSet['CLIENTE_ID']  := ID_CLI;
DataSet['FUNCIONARIO'] := NOME_FUNCIONARIO;
end;

procedure TFrmAnot_Inadimplencia.FormShow(Sender: TObject);
begin
 QTabela.Close;
 QTabela.ParamByName('CLIENTE_ID').AsInteger := id_cli;
 QTabela.Open;

 IQuery.Sql.Clear;
 IQuery.Sql.Add('SELECT NOME FROM FUNCIONARIOS WHERE FUNCIONARIO_ID = :FUNCIONARIO_ID');
 IQuery.ParamByName('FUNCIONARIO_ID').AsInteger := ID_FUN;
 IQuery.Prepare;
 IQuery.Open;

 Nome_Funcionario := IQuery.FieldByName('NOME').ASsTRING;


end;

procedure TFrmAnot_Inadimplencia.Grid_InadimplenciaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if Key = VK_F9 then
    Perform(Wm_NextDlgCtl, 0, 0);
end;

procedure TFrmAnot_Inadimplencia.Grid_ItensKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #46 then
    Key := #44;

  if Key = #13 then
    Keybd_Event(VK_TAB, 0, 0, 0);
end;

end.
