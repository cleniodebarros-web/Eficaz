unit UControle_Series;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, IBCustomDataSet, Grids, DBGrids, IBQuery,
  IBUpdateSQL, ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet;

type
  TFrmControle_Series = class(TForm)
    Panel1: TPanel;
    DataSub_Detail: TDataSource;
    Grid_Itens: TDBGrid;
    btnRetorna: TBitBtn;
    QRel: TFDQuery;
    QSub_Detail: TFDQuery;
    USql_Transest: TFDUpdateSQL;
    procedure QSub_Detail1NewRecord(DataSet: TDataSet);
    procedure Grid_ItensKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Grid_ItensKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure QSub_Detail1BeforePost(DataSet: TDataSet);
    procedure QSub_DetailBeforePost(DataSet: TDataSet);
    procedure QSub_DetailNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmControle_Series: TFrmControle_Series;
  Id_Trans, Id_Prod, Id_Soma,TIPO_SERIE: Integer;

  procedure Edita_Series(Transacao, Produto, Indice,TP_SERIE: Integer);

implementation

uses
  UData, UPrincipal;

{$R *.dfm}

procedure Edita_Series(Transacao, Produto, Indice,Tp_Serie: Integer);
begin
  Id_Trans   := Transacao;
  Id_Prod    := Produto;
  Id_Soma    := Indice;
  TIPO_SERIE := Tp_Serie;



  Application.CreateForm(TFrmControle_Series, FrmControle_Series);
  try
    FrmControle_Series.ShowModal;
  finally
    FrmControle_Series.Release;
  end;
end;

procedure TFrmControle_Series.FormCreate(Sender: TObject);
begin
  Grid_Itens.Columns[0].Width  := 186;
  Grid_Itens.Columns[1].Width  := 118;
end;

procedure TFrmControle_Series.FormShow(Sender: TObject);
begin

  IF TIPO_SERIE = 1 Then
  Begin

   QSub_Detail.Sql.Clear;
   QSub_Detail.Sql.Add('SELECT * FROM TRANSITENS_SERIE ');
   QSub_Detail.Sql.Add('WHERE');
   QSub_Detail.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID) AND ');
   QSub_Detail.Sql.Add('(PRODUTO_ID = :PRODUTO_ID) ');
   //QSub_Detail.ParamByName('PEDIDO_ID').AsInteger  := Id_Trans;
   //QSub_Detail.ParamByName('PRODUTO_ID').AsInteger := Id_Prod;
  End
  Else
  Begin

   QSub_Detail.Sql.Clear;
   QSub_Detail.Sql.Add('SELECT * FROM PEDITENS_SERIE ');
   QSub_Detail.Sql.Add('WHERE');
   QSub_Detail.Sql.Add('(PEDIDO_ID = :TRANSACAO_ID) AND ');
   QSub_Detail.Sql.Add('(PRODUTO_ID = :PRODUTO_ID) ');

  End;


  QSub_Detail.ParamByName('TRANSACAO_ID').AsInteger := Id_Trans;
  QSub_Detail.ParamByName('PRODUTO_ID').AsInteger   := Id_Prod;

  QSub_Detail.Prepare;
  QSub_Detail.Open;


end;

procedure TFrmControle_Series.Grid_ItensKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F4) and (QSub_Detail.State = dsBrowse) and (not QSub_Detail.IsEmpty) then
    QSub_Detail.Delete;

  if Key = VK_F9 then
    Perform(Wm_NextDlgCtl, 0, 0);

  if ((Key = Vk_Up) or (Key = Vk_Down)) and (QSub_Detail.State in [dsInsert, dsEdit]) then
    Key := 0;
end;

procedure TFrmControle_Series.Grid_ItensKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #46 then
    Key := #44;

  if Key = #13 then
    Keybd_Event(VK_TAB, 0, 0, 0);
end;

procedure TFrmControle_Series.QSub_Detail1BeforePost(DataSet: TDataSet);
begin
  if Id_Soma = -1 then
  begin
    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT * FROM SERIE_PRODUTOS');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(NUM_SERIE = :NUM_SERIE)');
    QRel.Sql.Add('AND (PRODUTO_ID = :PRODUTO_ID)');

    QRel.ParamByName('NUM_SERIE').AsString   := QSub_Detail.FieldByName('NUM_SERIE').AsString;
    QRel.ParamByName('PRODUTO_ID').AsInteger := QSub_Detail.FieldByName('PRODUTO_ID').AsInteger;

    QRel.Prepare;
    QRel.Open;

    if QRel.IsEmpty then
    begin
      Application.MessageBox('Número de Série inexistente', PChar(Msg_Title), mb_IconStop);
      Grid_Itens.SelectedIndex := 0;
      abort;
    end;
  end;
end;

procedure TFrmControle_Series.QSub_Detail1NewRecord(DataSet: TDataSet);
begin

  IF TIPO_SERIE = 0 Then
  Begin
  DataSet['TRANSACAO_ID']  := Id_Trans;
  DataSet['PRODUTO_ID']    := Id_Prod;
  DataSet['MULTIPLICADOR'] := Id_Soma;
  DataSet['QUANTIDADE']    := 1;
  End
  Else
  Begin
  DataSet['PEDIDO_ID']  := Id_Trans;
  DataSet['PRODUTO_ID']    := Id_Prod;
  DataSet['QUANTIDADE']    := 1;
  End;


end;

procedure TFrmControle_Series.QSub_DetailBeforePost(DataSet: TDataSet);
begin
if Id_Soma = -1 then
  begin
    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT * FROM SERIE_PRODUTOS');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(NUM_SERIE = :NUM_SERIE)');
    QRel.Sql.Add('AND (PRODUTO_ID = :PRODUTO_ID)');

    QRel.ParamByName('NUM_SERIE').AsString   := QSub_Detail.FieldByName('NUM_SERIE').AsString;
    QRel.ParamByName('PRODUTO_ID').AsInteger := QSub_Detail.FieldByName('PRODUTO_ID').AsInteger;

    QRel.Prepare;
    QRel.Open;

    if QRel.IsEmpty then
    begin
      Application.MessageBox('Número de Série inexistente', PChar(Msg_Title), mb_IconStop);
      Grid_Itens.SelectedIndex := 0;
      abort;
    end;
  end;
end;

procedure TFrmControle_Series.QSub_DetailNewRecord(DataSet: TDataSet);
begin

  IF TIPO_SERIE = 1 Then
  Begin
  DataSet['TRANSACAO_ID']  := Id_Trans;
  DataSet['PRODUTO_ID']    := Id_Prod;
  DataSet['MULTIPLICADOR'] := Id_Soma;
  DataSet['QUANTIDADE']    := 1;
  End
  Else
  Begin
  DataSet['PEDIDO_ID']     := Id_Trans;
  DataSet['PRODUTO_ID']    := Id_Prod;
  DataSet['QUANTIDADE']    := 1;
  End;

end;

end.
