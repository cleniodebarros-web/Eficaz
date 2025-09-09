unit UAtualiz_Quantidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBCustomDataSet, IBUpdateSQL, DB, IBQuery, StdCtrls, Buttons,
  ExtCtrls, Tabs, ComCtrls, Grids, DBGrids, Mask, rxToolEdit, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet;

type
  TFrmAtualiz_Quantidade = class(TForm)
    Itens: TDBGrid;
    Alfabeto: TTabSet;
    Panel1: TPanel;
    btnRetorna: TBitBtn;
    DataProdutos: TDataSource;
    btnPesquisa: TBitBtn;
    StatusBar1: TStatusBar;
    QProdutos: TFDQuery;
    QUpdate: TFDQuery;
    USql_Produtos: TFDUpdateSQL;
    procedure FormCreate(Sender: TObject);
    procedure ItensKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ItensKeyPress(Sender: TObject; var Key: Char);
    procedure AlfabetoClick(Sender: TObject);
    procedure ibqryQProdutosBeforeDelete(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRetornaClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnPesquisaClick(Sender: TObject);
    procedure ibqryQProdutosNewRecord(DataSet: TDataSet);
    procedure ItensTitleClick(Column: TColumn);
    procedure QProdutosBeforeDelete(DataSet: TDataSet);
    procedure QProdutosNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    CmdSelect: String;
    CmdOrderBy: String;
    CmdSelectNull: String;
  end;

var
  FrmAtualiz_Quantidade: TFrmAtualiz_Quantidade;

implementation

uses
  UData, UPrincipal, UPesquisa;

{$R *.dfm}

procedure TFrmAtualiz_Quantidade.AlfabetoClick(Sender: TObject);
begin
  if Alfabeto.TabIndex <> 26 then
  begin
    if FrmPrincipal.Config.FieldByName('VER_DESATIVADOS').AsString = 'True' then
      CmdSelectNull := 'WHERE (DESCRICAO LIKE ' + #39 + Chr(Alfabeto.TabIndex + 65) + '%' + #39 + ')'
    else
      CmdSelectNull := 'WHERE (DESCRICAO LIKE ' + #39 + Chr(Alfabeto.TabIndex + 65) + '%' + #39 + ') AND (STATUS = ' + #39 + 'A' + #39 + ')';
  end
  else
  begin
    if FrmPrincipal.Config.FieldByName('VER_DESATIVADOS').AsString = 'True' then
      CmdSelectNull := 'WHERE (PRODUTO_ID IS NOT NULL)'
    else
      CmdSelectNull := 'WHERE (PRODUTO_ID IS NOT NULL) AND (STATUS = ' + #39 + 'A' + #39 + ')';
  end;

  CmdSelectNull := CmdSelectNull + ' AND (EMPRESA_ID = ' + FrmData.QAcesso.FieldByName('EMPRESA_ID').AsString + ')';
  CmdOrderBy    := 'ORDER BY DESCRICAO';

  QProdutos.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;
  QProdutos.Open;
end;

procedure TFrmAtualiz_Quantidade.btnPesquisaClick(Sender: TObject);
var
Condicao: String;
begin
  Condicao := GetPesquisa('PRODUTOS');

  if Condicao <> '' then
  begin
    if FrmPrincipal.Config.FieldByName('VER_DESATIVADOS').AsString = 'True' then
      CmdSelectNull := Condicao
    else
      CmdSelectNull := Condicao + ' AND (STATUS = ' + #39 + 'A' + #39 + ')';
  end;

  CmdSelectNull := CmdSelectNull + ' AND (EMPRESA_ID = ' + FrmData.QAcesso.FieldByName('EMPRESA_ID').AsString + ')';

  CmdOrderBy := 'ORDER BY PRODUTO_ID';

  QProdutos.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

  QProdutos.Prepare;
  QProdutos.Open;
end;

procedure TFrmAtualiz_Quantidade.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmAtualiz_Quantidade.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmAtualiz_Quantidade.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if QProdutos.State in [dsInsert, dsEdit] then
  begin
    Application.MessageBox('É melhor salvar as alterações antes de continuar', PChar(Msg_Title), mb_IconStop);
    CanClose := False;
  end;
end;

procedure TFrmAtualiz_Quantidade.FormCreate(Sender: TObject);
begin
  Itens.Columns[0].Width := 69;
  Itens.Columns[1].Width := 242;
  Itens.Columns[2].Width := 75;
  Itens.Columns[3].Width := 70;
  Itens.Columns[4].Width := 75;
  Itens.Columns[5].Width := 75;

  CmdSelect := QProdutos.Sql.Text;

  if FrmPrincipal.Config.FieldByName('MOSTRAR_CADASTROS').AsString = 'True' then
  begin
    if FrmPrincipal.Config.FieldByName('VER_DESATIVADOS').AsString = 'True' then
      CmdSelectNull := 'WHERE (PRODUTO_ID IS NOT NULL)'
    else
      CmdSelectNull := 'WHERE (PRODUTO_ID IS NOT NULL) AND (STATUS = ' + #39 + 'A' + #39 + ')';
  end
  else
  begin
    if FrmPrincipal.Config.FieldByName('VER_DESATIVADOS').AsString = 'True' then
      CmdSelectNull := 'WHERE (PRODUTO_ID IS NULL)'
    else
      CmdSelectNull := 'WHERE (PRODUTO_ID IS NULL) AND (STATUS = ' + #39 + 'A' + #39 + ')';
  end;

  CmdSelectNull := CmdSelectNull + ' AND (EMPRESA_ID = ' + FrmData.QAcesso.FieldByName('EMPRESA_ID').AsString + ')';
  CmdOrderBy    := 'ORDER BY DESCRICAO';

  QProdutos.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

  QProdutos.Prepare;
  QProdutos.Open;
end;

procedure TFrmAtualiz_Quantidade.ItensKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
InputString: String;
begin
  if Key = VK_F5 then
  begin
    InputString := InputBox('Localizar', 'Cód. de Barras:', '');

    if InputString <> '' then
    begin
      if FrmPrincipal.Config.FieldByName('VER_DESATIVADOS').AsString = 'True' then
        CmdSelectNull := 'WHERE (COD_BARRA LIKE ' + #39 + '%' + InputString + '%' + #39 + ')'
      else
        CmdSelectNull := 'WHERE (COD_BARRA LIKE ' + #39 + '%' + InputString + '%' + #39 + ') AND (STATUS = ' + #39 + 'A' + #39 + ')';

      CmdSelectNull := CmdSelectNull + ' AND (EMPRESA_ID = ' + FrmData.QAcesso.FieldByName('EMPRESA_ID').AsString + ')';
      CmdOrderBy    := 'ORDER BY COD_BARRA';

      QProdutos.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;
      QProdutos.Prepare;
      QProdutos.Open;
    end;
  end;

  if Key = VK_F7 then
  begin
    InputString := InputBox('Localizar', 'Descrição:', '');

    if InputString <> '' then
    begin
      if FrmPrincipal.Config.FieldByName('VER_DESATIVADOS').AsString = 'True' then
        CmdSelectNull := 'WHERE (DESCRICAO LIKE ' + #39 + '%' + InputString + '%' + #39 + ')'
      else
        CmdSelectNull := 'WHERE (DESCRICAO LIKE ' + #39 + '%' + InputString + '%' + #39 + ') AND (STATUS = ' + #39 + 'A' + #39 + ')';

      CmdSelectNull := CmdSelectNull + ' AND (EMPRESA_ID = ' + FrmData.QAcesso.FieldByName('EMPRESA_ID').AsString + ')';
      CmdOrderBy    := 'ORDER BY DESCRICAO';

      QProdutos.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;
      QProdutos.Prepare;
      QProdutos.Open;
    end;
  end;

  if Key = VK_F9 then
    Perform(Wm_NextDlgCtl, 0, 0);

  if ((Key = Vk_Up) or (Key = Vk_Down)) and (QProdutos.State in [dsInsert, dsEdit]) then
    Key := 0;
end;

procedure TFrmAtualiz_Quantidade.ItensKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #46 then
    Key := #44;

  if Key = #13 then
    Keybd_Event(VK_TAB, 0, 0, 0);
end;

procedure TFrmAtualiz_Quantidade.ItensTitleClick(Column: TColumn);
begin
  CmdOrderBy := 'ORDER BY ' + Column.FieldName;

  QProdutos.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;
  QProdutos.Open;
end;

procedure TFrmAtualiz_Quantidade.QProdutosBeforeDelete(DataSet: TDataSet);
begin
  abort;
end;

procedure TFrmAtualiz_Quantidade.QProdutosNewRecord(DataSet: TDataSet);
begin
  QProdutos.Cancel;
end;

procedure TFrmAtualiz_Quantidade.ibqryQProdutosBeforeDelete(DataSet: TDataSet);
begin
  abort;
end;

procedure TFrmAtualiz_Quantidade.ibqryQProdutosNewRecord(DataSet: TDataSet);
begin
  QProdutos.Cancel;
end;

end.
