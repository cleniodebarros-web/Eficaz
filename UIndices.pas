unit UIndices;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, Grids, DBGrids, IBUpdateSQL, IBQuery, ExtCtrls,
  StdCtrls, Buttons, DBCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet;

type
  TFrmIndices = class(TForm)
    Panel1: TPanel;
    DataTabela: TDataSource;
    Itens: TDBGrid;
    btnRetorna: TBitBtn;
    DBNavigator1: TDBNavigator;
    QTabela: TFDQuery;
    USql_Transest: TFDUpdateSQL;
    procedure FormCreate(Sender: TObject);
    procedure ItensKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ItensKeyPress(Sender: TObject; var Key: Char);
    procedure ItensExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure QTabelaBeforeEdit(DataSet: TDataSet);
    procedure QTabelaBeforeInsert(DataSet: TDataSet);
    procedure btnRetornaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmIndices: TFrmIndices;

implementation

uses
  UData, UPrincipal;

{$R *.dfm}

procedure TFrmIndices.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmIndices.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmIndices.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if QTabela.State in [dsInsert, dsEdit] then
  begin
    Application.MessageBox('É melhor salvar as alterações antes de continuar', PChar(Msg_Title), mb_IconStop);
    CanClose := False;
  end;
end;

procedure TFrmIndices.FormCreate(Sender: TObject);
begin
  Itens.Columns[0].Width := 267;
  Itens.Columns[1].Width := 76;
  QTabela.Open;
end;

procedure TFrmIndices.ItensExit(Sender: TObject);
begin
  if QTabela.State in [dsInsert, dsEdit] then
  begin
    QTabela.Cancel;

  end;
end;

procedure TFrmIndices.ItensKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F9 then
    Perform(Wm_NextDlgCtl, 0, 0);

  if ((Key = Vk_Up) or (Key = Vk_Down)) and (QTabela.State in [dsInsert, dsEdit]) then
    Key := 0;
end;

procedure TFrmIndices.ItensKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #46 then
    Key := #44;
    
  if Key = #13 then
    Keybd_Event(VK_TAB, 0, 0, 0);
end;

procedure TFrmIndices.QTabelaBeforeEdit(DataSet: TDataSet);
begin
  Itens.Columns[0].ReadOnly := True;
end;

procedure TFrmIndices.QTabelaBeforeInsert(DataSet: TDataSet);
begin
  Itens.Columns[0].ReadOnly := False;
end;

end.
