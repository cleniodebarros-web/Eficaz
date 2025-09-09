unit UConsulta_Plano;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Grids, DBGrids, Spin, DBTables, DB, ComCtrls,
  IBCustomDataSet, IBQuery, Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrmConsulta_Plano = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Localiz: TEdit;
    DataConsulta: TDataSource;
    btnRetorna: TBitBtn;
    QProdutos: TFDQuery;
    QConsulta: TFDQuery;
    procedure LocalizKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure LocalizEnter(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure LocalizChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsulta_Plano: TFrmConsulta_Plano;
  function GetPlano(Retorno: String): String;

implementation

uses
  UPrincipal, UData;

{$R *.DFM}

function GetPlano(Retorno: String): String;
begin
  Application.CreateForm(TFrmConsulta_Plano, FrmConsulta_Plano);
  try
    FrmConsulta_Plano.ShowModal;

    if Retorno = 'Chave' then
      Result := FrmConsulta_Plano.QConsulta.FieldByName('CHAVE').AsString
    else
      Result := FrmConsulta_Plano.QConsulta.FieldByName('CODIGO').AsString;
  finally
    FrmConsulta_Plano.Release;
  end;
end;

procedure TFrmConsulta_Plano.LocalizKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    ModalResult := mrCancel;

  if (Key = #13) and (Localiz.Text <> '') then
  begin

    Perform(Wm_NextDlgctl, 0, 0);
  end;
end;

procedure TFrmConsulta_Plano.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if QConsulta.FieldByName('CHAVE').AsString <> '' then
    DBGrid1.Canvas.Brush.Color := $00B9FFFF
  else
    DBGrid1.Canvas.Brush.Color := clCream;

  TDBGrid(Sender).Canvas.Font.Color := clBlack;

  if gdSelected in State then
  begin
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color := $004080FF;
      FillRect(Rect);
      Font.Style := [fsBold];
    end;
  end;

  TDBGrid(Sender).DefaultDrawDataCell(Rect, TDBGrid(Sender).Columns[DataCol].Field, State);
end;

procedure TFrmConsulta_Plano.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    ModalResult := mrCancel;

  if (Key = #13) and (not TBDEDataSet(FrmConsulta_Plano.DataConsulta.DataSet).IsEmpty) then
    ModalResult := mrOK;
end;

procedure TFrmConsulta_Plano.FormCreate(Sender: TObject);
begin
  DataConsulta.DataSet := QConsulta;
end;

procedure TFrmConsulta_Plano.FormShow(Sender: TObject);
begin
  QConsulta.Sql.Clear;
  DBGrid1.Columns.Clear;

  FrmConsulta_Plano.Width  := 600;
  FrmConsulta_Plano.Height := 600;

  DBGrid1.Columns.Add;
  DBGrid1.Columns.Add;

  DBGrid1.Columns[0].FieldName := 'CODIGO';
  DBGrid1.Columns[1].FieldName := 'DESCRICAO';

  DBGrid1.Columns[0].Title.Caption := 'Código';
  DBGrid1.Columns[1].Title.Caption := 'Descrição';

  DBGrid1.Columns[0].Width := 100;
  DBGrid1.Columns[1].Width := 461;

  Localiz.Width    := (FrmConsulta_Plano.Width - 68);
  btnRetorna.Left  := (FrmConsulta_Plano.Width - 87);

  FrmConsulta_Plano.Left := Round(((Screen.WorkAreaWidth - FrmConsulta_Plano.Width) / 2));
  FrmConsulta_Plano.Top  := Round(((Screen.WorkAreaHeight - FrmConsulta_Plano.Height) / 2));

  Localiz.Text     := '';

  QConsulta.Sql.Clear;
  QConsulta.Sql.Add('SELECT * FROM PLANO');
  QConsulta.Sql.Add('ORDER BY CODIGO');

  QConsulta.Prepare;
  QConsulta.Open;

  if not QConsulta.IsEmpty then
    DBGrid1.SetFocus
  else
    Localiz.SetFocus;
end;

procedure TFrmConsulta_Plano.LocalizChange(Sender: TObject);
begin
  QConsulta.Locate('DESCRICAO', Localiz.Text, [loPartialKey]);
end;

procedure TFrmConsulta_Plano.LocalizEnter(Sender: TObject);
begin
  Localiz.Text := '';
end;

procedure TFrmConsulta_Plano.DBGrid1DblClick(Sender: TObject);
begin
  if not TBDEDataSet(FrmConsulta_Plano.DataConsulta.DataSet).IsEmpty then
    ModalResult := mrOK;
end;

end.
