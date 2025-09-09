unit USub_Menu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBCustomDataSet, IBUpdateSQL, DB, IBQuery, DBCtrls, Grids, DBGrids,
  StdCtrls, Buttons, ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet;

type
  TFrmSub_Menu = class(TForm)
    Panel1: TPanel;
    btnRetorna: TBitBtn;
    Itens: TDBGrid;
    DBNavigator1: TDBNavigator;
    DataTabela: TDataSource;
    QTabela: TFDQuery;
    USql_Transest: TFDUpdateSQL;
    procedure btnRetornaClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure ItensExit(Sender: TObject);
    procedure ItensKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ItensKeyPress(Sender: TObject; var Key: Char);
    procedure QTabelaBeforeInsert(DataSet: TDataSet);
    procedure QTabelaBeforePost(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSub_Menu: TFrmSub_Menu;
  Nome_Menu: String;
  procedure Configuracao_Sub_Menu(Menu: String);

implementation

uses
  UData, UPrincipal, UMenu;

{$R *.dfm}

procedure Configuracao_Sub_Menu(Menu: String);
begin
  Nome_Menu := Menu;

  Application.CreateForm(TFrmSub_Menu, FrmSub_Menu);
  try
    FrmSub_Menu.ShowModal;
  finally
    FrmSub_Menu.Release;
  end;
end;

procedure TFrmSub_Menu.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmSub_Menu.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if QTabela.State in [dsInsert, dsEdit] then
  begin
    Application.MessageBox('É melhor salvar as alterações antes de continuar', PChar(Msg_Title), mb_IconStop);
    CanClose := False;
  end;
end;

procedure TFrmSub_Menu.FormCreate(Sender: TObject);
begin
  Itens.Columns[0].Width := 293;
  Itens.Columns[1].Width := 50;

  QTabela.ParamByName('MENU').AsString := Nome_Menu;
  QTabela.Open;
end;

procedure TFrmSub_Menu.FormShow(Sender: TObject);
begin
  Itens.SetFocus;
end;

procedure TFrmSub_Menu.ItensExit(Sender: TObject);
begin
  if QTabela.State in [dsInsert, dsEdit] then
  begin
    QTabela.Cancel;

  end;
end;

procedure TFrmSub_Menu.ItensKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F9 then
    Perform(Wm_NextDlgCtl, 0, 0);

  if ((Key = Vk_Up) or (Key = Vk_Down)) and (QTabela.State in [dsInsert, dsEdit]) then
    Key := 0;
end;

procedure TFrmSub_Menu.ItensKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Keybd_Event(VK_TAB, 0, 0, 0);
end;

procedure TFrmSub_Menu.QTabelaBeforeInsert(DataSet: TDataSet);
begin
  abort;
end;

procedure TFrmSub_Menu.QTabelaBeforePost(DataSet: TDataSet);
begin
  if (QTabela.FieldByName('STATUS').AsString <> 'True') and (QTabela.FieldByName('STATUS').AsString <> 'False') then
  begin
    Application.MessageBox('Status inválido', PChar(Msg_Title), mb_IconStop);
    abort;
  end;
end;

end.
