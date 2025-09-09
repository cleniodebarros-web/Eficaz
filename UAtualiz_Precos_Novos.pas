unit UAtualiz_Precos_Novos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBCustomDataSet, IBUpdateSQL, DB, IBQuery, StdCtrls, Buttons,
  ExtCtrls, Tabs, ComCtrls, Grids, DBGrids, Mask, rxToolEdit, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmAtualiz_Precos_Novos = class(TForm)
    Itens: TDBGrid;
    Panel1: TPanel;
    btnRetorna: TBitBtn;
    DataProdutos: TDataSource;
    btnRemarca: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    Dtmen: TDateEdit;
    btnSelecionar: TSpeedButton;
    Dtmai: TDateEdit;
    QProdutos: TFDQuery;
    IQuery: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRetornaClick(Sender: TObject);
    procedure btnRemarcaClick(Sender: TObject);
    procedure DtmenKeyPress(Sender: TObject; var Key: Char);
    procedure ItensDblClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure DtmenEnter(Sender: TObject);
    procedure ItensDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAtualiz_Precos_Novos: TFrmAtualiz_Precos_Novos;

implementation

uses
  UData, UPrincipal, URemarca;

{$R *.dfm}

procedure TFrmAtualiz_Precos_Novos.btnRemarcaClick(Sender: TObject);
begin
  if not QProdutos.IsEmpty then
    Remarca(QProdutos.FieldByName('TRANSACAO_ID').AsInteger);
end;

procedure TFrmAtualiz_Precos_Novos.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmAtualiz_Precos_Novos.btnSelecionarClick(Sender: TObject);
begin
  QProdutos.Sql.Clear;
  QProdutos.Sql.Add('SELECT * FROM TRANSACOES');
  QProdutos.Sql.Add('WHERE');
  QProdutos.Sql.Add('(DT_MOVIMENTO BETWEEN :DT_INICIAL AND :DT_FINAL)');
  QProdutos.Sql.Add('AND (CONDUTA = :CONDUTA)');
  QProdutos.Sql.Add('AND (DEPTO = :DEPTO)');
  QProdutos.Sql.Add('AND (TPCTB <= :TPCTB)');

  QProdutos.Sql.Add('ORDER BY TRANSACAO_ID');

  QProdutos.ParamByName('DT_INICIAL').AsDateTime   := Dtmen.Date;
  QProdutos.ParamByName('DT_FINAL').AsDateTime     := Dtmai.Date;
  QProdutos.ParamByName('CONDUTA').AsString        := '02';
  QProdutos.ParamByName('DEPTO').AsString          := '07';
  QProdutos.ParamByName('TPCTB').AsString          := FrmData.QAcesso.FieldByName('TPCTB').AsString;

  QProdutos.Prepare;
  QProdutos.Open;

  Itens.SetFocus;
end;

procedure TFrmAtualiz_Precos_Novos.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmAtualiz_Precos_Novos.DtmenKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    btnSelecionarClick(Sender);
end;

procedure TFrmAtualiz_Precos_Novos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmAtualiz_Precos_Novos.FormCreate(Sender: TObject);
begin
  Dtmen.Date := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
  Dtmai.Date := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;

  Itens.Columns[0].Width := 45;
  Itens.Columns[1].Width := 219;
  Itens.Columns[2].Width := 65;
  Itens.Columns[3].Width := 70;
  Itens.Columns[4].Width := 70;
  Itens.Columns[5].Width := 70;
  Itens.Columns[6].Width := 70;
  Itens.Columns[7].Width := 70;
  Itens.Columns[8].Width := 70;

  QProdutos.Sql.Clear;
  QProdutos.Sql.Add('SELECT * FROM TRANSACOES');
  QProdutos.Sql.Add('WHERE');
  QProdutos.Sql.Add('(DT_MOVIMENTO = :DT_MOVIMENTO)');
  QProdutos.Sql.Add('AND (CONDUTA = :CONDUTA)');
  QProdutos.Sql.Add('AND (DEPTO = :DEPTO)');
  QProdutos.Sql.Add('AND (TPCTB <= :TPCTB)');

  QProdutos.Sql.Add('ORDER BY TRANSACAO_ID');

  QProdutos.ParamByName('DT_MOVIMENTO').AsDateTime := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
  QProdutos.ParamByName('CONDUTA').AsString        := '02';
  QProdutos.ParamByName('DEPTO').AsString          := '07';
  QProdutos.ParamByName('TPCTB').AsString          := FrmData.QAcesso.FieldByName('TPCTB').AsString;

  QProdutos.Prepare;
  QProdutos.Open;
end;

procedure TFrmAtualiz_Precos_Novos.ItensDblClick(Sender: TObject);
begin
  btnRemarcaClick(Self);
end;

procedure TFrmAtualiz_Precos_Novos.ItensDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  OldBkMode: Integer;
begin

  IQuery.Sql.Clear;
  IQuery.Sql.add('SELECT COUNT(*) REMARCADOS FROM TRANSITENS WHERE REMARCA = 1 AND TRANSACAO_ID = :TRANSACAO_ID');
  IQuery.ParamByName('TRANSACAO_ID').AsInteger := QProdutos.FieldByName('TRANSACAO_ID').AsInteger;
  IQuery.prepare;
  IQuery.Open;

  if IQuery.Fieldbyname('REMARCADOS').AsInteger > 0 Then
  TDBGrid(Sender).Canvas.Font.Color := clGreen;


  if gdSelected in State then
  begin

    with (Sender as TDBGrid).Canvas do
    begin
      if  TDBGrid(Sender).Canvas.Font.Color = clRed Then
      Brush.Color := clAqua //$004080FF
      else if TDBGrid(Sender).Canvas.Font.Color = clPurple Then
      Brush.Color := clYellow //$004080FF
      Else if TDBGrid(Sender).Canvas.Font.Color = clGreen Then
      Brush.Color := clYellow //$004080FF
      Else if TDBGrid(Sender).Canvas.Font.Color = clMoneyGreen  Then
       Brush.Color := clWhite //$004080FF
      else
      Brush.Color := $004080FF;
      FillRect(Rect);
      Font.Style := [fsBold];
    End;

  end;

TDBGrid(Sender).DefaultDrawDataCell(Rect, TDBGrid(Sender).Columns[DataCol].Field, State);
end;

end.
