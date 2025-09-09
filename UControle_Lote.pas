unit UControle_Lote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, IBCustomDataSet, Grids, DBGrids, IBQuery,
  IBUpdateSQL, ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet;

type
  TFrmControle_Lote = class(TForm)
    Panel1: TPanel;
    DataSub_Detail: TDataSource;
    Grid_Itens: TDBGrid;
    btnRetorna: TBitBtn;
    QRel: TFDQuery;
    QSub_Detail: TFDQuery;
    procedure QSub_Detail1NewRecord(DataSet: TDataSet);
    procedure Grid_ItensKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Grid_ItensKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure QSub_Detail1BeforePost(DataSet: TDataSet);
    procedure QSub_DetailBeforePost(DataSet: TDataSet);
    procedure QSub_DetailNewRecord(DataSet: TDataSet);
    procedure QSub_DetailAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmControle_Lote: TFrmControle_Lote;
  Id_Trans, Id_Prod, Id_Soma,id_forn: Integer;
  Id_Qtd :Real;

  procedure Edita_Lote(Transacao, Produto, Indice,Fornecedor: Integer;qtd:real);

implementation

uses
  UData, UPrincipal;

{$R *.dfm}

procedure Edita_Lote(Transacao, Produto, Indice,fornecedor: Integer;Qtd:Real);
begin
  Id_Trans := Transacao;
  Id_Prod  := Produto;
  Id_Soma  := Indice;
  Id_Qtd   := qtd;
  id_forn := Fornecedor;

  Application.CreateForm(TFrmControle_Lote, FrmControle_Lote);
  try
    FrmControle_Lote.ShowModal;
  finally
    FrmControle_Lote.Release;
  end;
end;

procedure TFrmControle_Lote.FormCreate(Sender: TObject);
begin
  Grid_Itens.Columns[0].Width  := 70;
  Grid_Itens.Columns[1].Width  := 100;
  Grid_Itens.Columns[2].Width  := 100;
  Grid_Itens.Columns[3].Width  := 100;
end;

procedure TFrmControle_Lote.FormShow(Sender: TObject);
begin
  QSub_Detail.ParamByName('TRANSACAO_ID').AsInteger := Id_Trans;
  QSub_Detail.ParamByName('PRODUTO_ID').AsInteger   := Id_Prod;

  QSub_Detail.Prepare;
  QSub_Detail.Open;
end;

procedure TFrmControle_Lote.Grid_ItensKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F4) and (QSub_Detail.State = dsBrowse) and (not QSub_Detail.IsEmpty) then
    QSub_Detail.Delete;

  if Key = VK_F9 then
    Perform(Wm_NextDlgCtl, 0, 0);

  if ((Key = Vk_Up) or (Key = Vk_Down)) and (QSub_Detail.State in [dsInsert, dsEdit]) then
    Key := 0;
end;

procedure TFrmControle_Lote.Grid_ItensKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #46 then
    Key := #44;

  if Key = #13 then
    Keybd_Event(VK_TAB, 0, 0, 0);
end;

procedure TFrmControle_Lote.QSub_Detail1BeforePost(DataSet: TDataSet);
begin
  if Id_Soma = -1 then
  begin
    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT * FROM LOTE_PRODUTOS');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(LOTE_ID = :LOTE_ID)');
    QRel.Sql.Add('AND (PRODUTO_ID = :PRODUTO_ID)');

    QRel.ParamByName('LOTE_ID').AsInteger   := QSub_Detail.FieldByName('LOTE_ID').AsInteger;
    QRel.ParamByName('PRODUTO_ID').AsInteger := QSub_Detail.FieldByName('PRODUTO_ID').AsInteger;

    QRel.Prepare;
    QRel.Open;

    if QRel.IsEmpty then
    begin
      Application.MessageBox('Número de Lote inexistente', PChar(Msg_Title), mb_IconStop);
      Grid_Itens.SelectedIndex := 0;
      abort;
    end;
  end;
end;

procedure TFrmControle_Lote.QSub_Detail1NewRecord(DataSet: TDataSet);
begin
  DataSet['TRANSACAO_ID']  := Id_Trans;
  DataSet['PRODUTO_ID']    := Id_Prod;
  DataSet['QUANTIDADE']    := Id_Qtd;
  DataSet['FORNECEDOR_ID'] := id_forn;
end;

procedure TFrmControle_Lote.QSub_DetailAfterOpen(DataSet: TDataSet);
begin
 TFloatField(QSub_Detail.FieldByName('DT_VALIDADE')).EditMask        := '!99/99/0000;1;_';
 TFloatField(QSub_Detail.FieldByName('DT_FABRICACAO')).EditMask      := '!99/99/0000;1;_';
end;

procedure TFrmControle_Lote.QSub_DetailBeforePost(DataSet: TDataSet);
begin
if Id_Soma = -1 then
  begin
    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT * FROM LOTE_PRODUTOS');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(LOTE_ID = :LOTE_ID)');
    QRel.Sql.Add('AND (PRODUTO_ID = :PRODUTO_ID)');

    QRel.ParamByName('LOTE_ID').AsInteger   := QSub_Detail.FieldByName('LOTE_ID').AsInteger;
    QRel.ParamByName('PRODUTO_ID').AsInteger := QSub_Detail.FieldByName('PRODUTO_ID').AsInteger;

    QRel.Prepare;
    QRel.Open;

    if QRel.IsEmpty then
    begin
      Application.MessageBox('Número de Lote inexistente', PChar(Msg_Title), mb_IconStop);
      Grid_Itens.SelectedIndex := 0;
      abort;
    end;
  end;
end;

procedure TFrmControle_Lote.QSub_DetailNewRecord(DataSet: TDataSet);
begin
  DataSet['TRANSACAO_ID']  := Id_Trans;
  DataSet['PRODUTO_ID']    := Id_Prod;
  DataSet['QUANTIDADE']    := Id_Qtd;
  DataSet['FORNECEDOR_ID'] := id_forn;
end;

end.
