unit UConsulta_CFOP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Grids, DBGrids, Spin, DBTables, DB, ComCtrls,
  IBCustomDataSet, IBQuery, Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrmConsulta_CFOP = class(TForm)
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsulta_CFOP: TFrmConsulta_CFOP;

  function GetConsulta_CFOP(Vr_Atual: String): String;

implementation

uses
  UPrincipal, UData;

{$R *.DFM}

function GetConsulta_CFOP(Vr_Atual: String): String;
begin
  Application.CreateForm(TFrmConsulta_CFOP, FrmConsulta_CFOP);
  try
    FrmConsulta_CFOP.ShowModal;

    if (not FrmConsulta_CFOP.QConsulta.IsEmpty) and (FrmConsulta_CFOP.ModalResult = mrOK) then
      Result := FrmConsulta_CFOP.QConsulta.Fields[0].AsString
    else
      Result := Vr_Atual;
  finally
    FrmConsulta_CFOP.Release;
  end;
end;

procedure TFrmConsulta_CFOP.LocalizKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    ModalResult := mrCancel;

  if (Key = #13) and (Localiz.Text <> '') then
  begin
    QConsulta.Sql.Clear;
    QConsulta.Sql.Add('SELECT * FROM CFOP');
    QConsulta.Sql.Add('WHERE');
    QConsulta.Sql.Add('((DESC_CFOP LIKE :DESC_CFOP) OR (COD_CFOP = :COD_CFOP))');
    QConsulta.Sql.Add('ORDER BY DESC_CFOP');

    QConsulta.ParamByName('DESC_CFOP').AsString := '%' + Localiz.Text + '%';
    QConsulta.ParamByName('COD_CFOP').AsString  := Copy(Localiz.Text, 1, 4);

    QConsulta.Prepare;
    QConsulta.Open;

    CFNOTA.Text := QConsulta.FieldByName('CFNOTA').AsString;

    Perform(Wm_NextDlgctl, 0, 0);
  end;
end;

procedure TFrmConsulta_CFOP.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  CFNOTA.Text := QConsulta.FieldByName('CFNOTA').AsString;
end;

procedure TFrmConsulta_CFOP.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    ModalResult := mrCancel;

  if (Key = #13) and (not TBDEDataSet(FrmConsulta_CFOP.DataConsulta.DataSet).IsEmpty) then
    ModalResult := mrOK;
end;

procedure TFrmConsulta_CFOP.FormShow(Sender: TObject);
begin
  QConsulta.Sql.Clear;
  DBGrid1.Columns.Clear;

  FrmConsulta_CFOP.Width := 700;

  DBGrid1.Columns.Add;
  DBGrid1.Columns.Add;

  DBGrid1.Columns[0].FieldName := 'COD_CFOP';
  DBGrid1.Columns[1].FieldName := 'DESC_CFOP';

  DBGrid1.Columns[0].Title.Caption := 'CFOP';
  DBGrid1.Columns[1].Title.Caption := 'Descrição';

  DBGrid1.Columns[0].Width := 59;
  DBGrid1.Columns[1].Width := 602;

  Localiz.Width    := (FrmConsulta_CFOP.Width - 68);
  btnRetorna.Left  := (FrmConsulta_CFOP.Width - 87);

  FrmConsulta_CFOP.Left := Round(((Screen.WorkAreaWidth - FrmConsulta_CFOP.Width) / 2));
  FrmConsulta_CFOP.Top  := Round(((Screen.WorkAreaHeight - FrmConsulta_CFOP.Height) / 2));
  
  Localiz.Text     := '';

  QConsulta.Sql.Clear;
  QConsulta.Sql.Add('SELECT * FROM CFOP');
  QConsulta.Sql.Add('ORDER BY DESC_CFOP');

  QConsulta.Prepare;
  QConsulta.Open;

  CFNOTA.Text := QConsulta.FieldByName('CFNOTA').AsString;
end;

procedure TFrmConsulta_CFOP.LocalizEnter(Sender: TObject);
begin
  Localiz.Text := '';
end;

procedure TFrmConsulta_CFOP.DBGrid1DblClick(Sender: TObject);
begin
  if not TBDEDataSet(FrmConsulta_CFOP.DataConsulta.DataSet).IsEmpty then
    ModalResult := mrOK;
end;

end.
