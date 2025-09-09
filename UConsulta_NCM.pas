unit UConsulta_NCM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Grids, DBGrids, Spin, DBTables, DB, ComCtrls,
  IBCustomDataSet, IBQuery, Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrmConsulta_NCM = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Localiz: TEdit;
    DataConsulta: TDataSource;
    CFNOTA: TMemo;
    btnRetorna: TBitBtn;
    QConsulta: TFDQuery;
    procedure LocalizKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure LocalizEnter(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsulta_NCM: TFrmConsulta_NCM;

  function GetConsulta_NCM(Vr_Atual: String): String;

implementation

uses
  UPrincipal, UData;

{$R *.DFM}

function GetConsulta_NCM(Vr_Atual: String): String;
begin
  Application.CreateForm(TFrmConsulta_NCM, FrmConsulta_NCM);
  try
    FrmConsulta_NCM.ShowModal;

    if (not FrmConsulta_NCM.QConsulta.IsEmpty) and (FrmConsulta_NCM.ModalResult = mrOK) then
      Result := FrmConsulta_NCM.QConsulta.Fields[0].AsString
    else
      Result := Vr_Atual;
  finally
    FrmConsulta_NCM.Release;
  end;
end;

procedure TFrmConsulta_NCM.LocalizKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    ModalResult := mrCancel;

  if (Key = #13) and (Localiz.Text <> '') then
  begin
    QConsulta.Sql.Clear;
    QConsulta.Sql.Add('SELECT * FROM TIPI');
    QConsulta.Sql.Add('WHERE');
    QConsulta.Sql.Add('(DESC_TIPI LIKE :DESC_TIPI)');
    QConsulta.Sql.Add('ORDER BY NCM');

    QConsulta.ParamByName('DESC_TIPI').AsString := '%' + Localiz.Text + '%';

    QConsulta.Prepare;
    QConsulta.Open;

    CFNOTA.Text := QConsulta.FieldByName('DESCRICAO').AsString;

    Perform(Wm_NextDlgctl, 0, 0);
  end;
end;

procedure TFrmConsulta_NCM.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if Length(Alltrim(QConsulta.FieldByName('NCM').AsString)) = 8 then
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

procedure TFrmConsulta_NCM.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  CFNOTA.Text := QConsulta.FieldByName('DESCRICAO').AsString;
end;

procedure TFrmConsulta_NCM.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    ModalResult := mrCancel;

  if (Key = #13) and (not TBDEDataSet(FrmConsulta_NCM.DataConsulta.DataSet).IsEmpty) then
    ModalResult := mrOK;
end;

procedure TFrmConsulta_NCM.FormShow(Sender: TObject);
begin
  QConsulta.Sql.Clear;
  DBGrid1.Columns.Clear;

  FrmConsulta_NCM.Width := 685;

  DBGrid1.Columns.Add;
  DBGrid1.Columns.Add;
  DBGrid1.Columns.Add;

  DBGrid1.Columns[0].FieldName := 'NCM';
  DBGrid1.Columns[1].FieldName := 'DESC_TIPI';
  DBGrid1.Columns[2].FieldName := 'ALIQUOTA';

  DBGrid1.Columns[0].Title.Caption := 'NCM';
  DBGrid1.Columns[1].Title.Caption := 'Descrição';
  DBGrid1.Columns[2].Title.Caption := 'Alíq.';

  DBGrid1.Columns[0].Width := 60;
  DBGrid1.Columns[1].Width := 529;
  DBGrid1.Columns[2].Width := 56;

  Localiz.Width    := (FrmConsulta_NCM.Width - 68);
  btnRetorna.Left  := (FrmConsulta_NCM.Width - 87);

  FrmConsulta_NCM.Left := Round(((Screen.WorkAreaWidth - FrmConsulta_NCM.Width) / 2));
  FrmConsulta_NCM.Top  := Round(((Screen.WorkAreaHeight - FrmConsulta_NCM.Height) / 2));

  Localiz.Text     := '';

  QConsulta.Sql.Clear;
  QConsulta.Sql.Add('SELECT * FROM TIPI');
  QConsulta.Sql.Add('ORDER BY NCM');

  QConsulta.Prepare;
  QConsulta.Open;

  CFNOTA.Text := QConsulta.FieldByName('DESCRICAO').AsString;
end;

procedure TFrmConsulta_NCM.LocalizEnter(Sender: TObject);
begin
  Localiz.Text := '';
end;

procedure TFrmConsulta_NCM.DBGrid1DblClick(Sender: TObject);
begin
  if not TBDEDataSet(FrmConsulta_NCM.DataConsulta.DataSet).IsEmpty then
    ModalResult := mrOK;
end;

end.
