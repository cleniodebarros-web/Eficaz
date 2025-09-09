unit UMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, Grids, DBGrids, IBUpdateSQL, IBQuery, ExtCtrls,
  StdCtrls, Buttons, DBCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrmMenu = class(TForm)
    Panel1: TPanel;
    DataTabela: TDataSource;
    USql_Transest: TIBUpdateSQL;
    Itens: TDBGrid;
    btnRetorna: TBitBtn;
    DBNavigator1: TDBNavigator;
    QTabela: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure ItensKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ItensKeyPress(Sender: TObject; var Key: Char);
    procedure ItensExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure QTabelaBeforeInsert(DataSet: TDataSet);
    procedure btnRetornaClick(Sender: TObject);
    procedure QTabelaBeforePost(DataSet: TDataSet);
    procedure ItensDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMenu: TFrmMenu;

implementation

uses
  UData, UPrincipal, USub_Menu;

{$R *.dfm}

procedure TFrmMenu.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmMenu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmMenu.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if QTabela.State in [dsInsert, dsEdit] then
  begin
    Application.MessageBox('É melhor salvar as alterações antes de continuar', PChar(Msg_Title), mb_IconStop);
    CanClose := False;
  end;
end;

procedure TFrmMenu.FormCreate(Sender: TObject);
begin
  Itens.Columns[0].Width := 293;
  Itens.Columns[1].Width := 50;
  QTabela.Open;
end;

procedure TFrmMenu.ItensDblClick(Sender: TObject);
begin
  Configuracao_Sub_Menu(QTabela.FieldByName('NOME').AsString);
end;

procedure TFrmMenu.ItensExit(Sender: TObject);
begin
  if QTabela.State in [dsInsert, dsEdit] then
  begin
    QTabela.Cancel;

  end;
end;

procedure TFrmMenu.ItensKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F9 then
    Perform(Wm_NextDlgCtl, 0, 0);

  if ((Key = Vk_Up) or (Key = Vk_Down)) and (QTabela.State in [dsInsert, dsEdit]) then
    Key := 0;
end;

procedure TFrmMenu.ItensKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Keybd_Event(VK_TAB, 0, 0, 0);
end;

procedure TFrmMenu.QTabelaBeforeInsert(DataSet: TDataSet);
begin
  abort;
end;

procedure TFrmMenu.QTabelaBeforePost(DataSet: TDataSet);
begin
  if (QTabela.FieldByName('STATUS').AsString <> 'True') and (QTabela.FieldByName('STATUS').AsString <> 'False') then
  begin
    Application.MessageBox('Status inválido', PChar(Msg_Title), mb_IconStop);
    abort;
  end;
end;

end.
