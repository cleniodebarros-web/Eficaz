unit UConsulta_Veiculos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Grids, DBGrids, Spin, DBTables, DB, ComCtrls,
  IBCustomDataSet, IBQuery, Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrmConsulta_Veiculos = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Localiz: TEdit;
    DataConsulta: TDataSource;
    btnRetorna: TBitBtn;
    QConsulta: TFDQuery;
    procedure LocalizKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure LocalizEnter(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsulta_Veiculos: TFrmConsulta_Veiculos;

  function GetConsulta_Veiculos(Vr_Atual: String): String;

implementation

uses
  UPrincipal, UData;

{$R *.DFM}

function GetConsulta_Veiculos(Vr_Atual: String): String;
begin
  Application.CreateForm(TFrmConsulta_Veiculos, FrmConsulta_Veiculos);
  try
    FrmConsulta_Veiculos.ShowModal;

    if (not FrmConsulta_Veiculos.QConsulta.IsEmpty) and (FrmConsulta_Veiculos.ModalResult = mrOK) then
      Result := FrmConsulta_Veiculos.QConsulta.Fields[0].AsString
    else
      Result := Vr_Atual;
  finally
    FrmConsulta_Veiculos.Release;
  end;
end;

procedure TFrmConsulta_Veiculos.LocalizKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    ModalResult := mrCancel;

  if (Key = #13) and (Localiz.Text <> '') then
  begin
   try

    QConsulta.Sql.Clear;
    QConsulta.Sql.Add('SELECT * FROM VEICULOS');
    QConsulta.Sql.Add('WHERE');
    QConsulta.Sql.Add('(PLACA ILIKE :PLACA)');
    QConsulta.Sql.Add('OR (MODELO ILIKE :DESCRICAO)');
    QConsulta.Sql.Add('ORDER BY PLACA');

    QConsulta.ParamByName('PLACA').AsString     := '%' + Localiz.Text + '%';
    QConsulta.ParamByName('DESCRICAO').AsString := '%' + Localiz.Text + '%';

    QConsulta.Prepare;
    QConsulta.Open;
   except



   end;


    Perform(Wm_NextDlgctl, 0, 0);

  end;
end;

procedure TFrmConsulta_Veiculos.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if Length(Alltrim(QConsulta.FieldByName('PLACA').AsString)) = 7 then
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

procedure TFrmConsulta_Veiculos.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    ModalResult := mrCancel;

  if (Key = #13) and (not TBDEDataSet(FrmConsulta_Veiculos.DataConsulta.DataSet).IsEmpty) then
    ModalResult := mrOK;
end;

procedure TFrmConsulta_Veiculos.FormShow(Sender: TObject);
begin
  QConsulta.Sql.Clear;
  DBGrid1.Columns.Clear;

  FrmConsulta_Veiculos.Width := 685;

  DBGrid1.Columns.Add;
  DBGrid1.Columns.Add;
  DBGrid1.Columns.Add;

  DBGrid1.Columns[0].FieldName := 'PLACA';
  DBGrid1.Columns[1].FieldName := 'MODELO';
  DBGrid1.Columns[2].FieldName := 'RNTRC';

  DBGrid1.Columns[0].Title.Caption := 'Placa';
  DBGrid1.Columns[1].Title.Caption := 'Modelo';
  DBGrid1.Columns[2].Title.Caption := 'Rntrc';

  DBGrid1.Columns[0].Width := 60;
  DBGrid1.Columns[1].Width := 529;
  DBGrid1.Columns[2].Width := 56;

  Localiz.Width    := (FrmConsulta_Veiculos.Width - 68);
  btnRetorna.Left  := (FrmConsulta_Veiculos.Width - 87);

  FrmConsulta_Veiculos.Left := Round(((Screen.WorkAreaWidth - FrmConsulta_Veiculos.Width) / 2));
  FrmConsulta_Veiculos.Top  := Round(((Screen.WorkAreaHeight - FrmConsulta_Veiculos.Height) / 2));

  Localiz.Text     := '';

  QConsulta.Sql.Clear;
  QConsulta.Sql.Add('SELECT * FROM VEICULOS');
  QConsulta.Sql.Add('ORDER BY PLACA');

  QConsulta.Prepare;
  QConsulta.Open;
end;

procedure TFrmConsulta_Veiculos.LocalizEnter(Sender: TObject);
begin
  Localiz.Text := '';
end;

procedure TFrmConsulta_Veiculos.DBGrid1DblClick(Sender: TObject);
begin
  if not TBDEDataSet(FrmConsulta_Veiculos.DataConsulta.DataSet).IsEmpty then
    ModalResult := mrOK;
end;

end.
