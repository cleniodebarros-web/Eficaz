unit UConsulta_Quiosque;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Grids, DBGrids, Spin, DBTables, DB, ComCtrls,
  IBCustomDataSet, IBQuery, Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrmConsulta = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Localiz: TEdit;
    DataConsulta: TDataSource;
    btnRetorna: TBitBtn;
    QProdutos: TFDQuery;
    procedure LocalizKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure LocalizEnter(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure QProdutosAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsulta: TFrmConsulta;
  function GetConsulta: String;

implementation

uses
  UQuiosque_Consulta;

{$R *.DFM}

function GetConsulta: String;
begin
  Application.CreateForm(TFrmConsulta, FrmConsulta);
  try
    FrmConsulta.ShowModal;

    if (not FrmConsulta.QProdutos.IsEmpty) and (FrmConsulta.ModalResult = mrOK) then
      Result := FrmConsulta.QProdutos.FieldByName('COD_BARRA').AsString
    else
      Result := '';
  finally
    FrmConsulta.Release;
  end;
end;

procedure TFrmConsulta.LocalizKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    ModalResult := mrCancel;

  if (Key = #13) and (Localiz.Text <> '') then
  begin
    QProdutos.Sql.Clear;
    QProdutos.Sql.Add('SELECT * FROM PRODUTOS');
    QProdutos.Sql.Add('WHERE');
    QProdutos.Sql.Add('(DESCRICAO LIKE :DESCRICAO)');
    QProdutos.Sql.Add('AND (STATUS = :STATUS)');
    QProdutos.Sql.Add('ORDER BY DESCRICAO');

    QProdutos.ParamByName('DESCRICAO').AsString := '%' + Localiz.Text + '%';
    QProdutos.ParamByName('STATUS').AsString    := 'A';

    QProdutos.Prepare;
    QProdutos.Open;

    Perform(Wm_NextDlgctl, 0, 0);
  end;
end;

procedure TFrmConsulta.QProdutosAfterOpen(DataSet: TDataSet);
begin
 TFloatField(QProdutos.FieldByName('PRECO_VAREJO')).DisplayFormat  := '#,##0.00';
 TFloatField(QProdutos.FieldByName('QUANTIDADE_C')).DisplayFormat  := '#,##0.00';
end;

procedure TFrmConsulta.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    ModalResult := mrCancel;

  if (Key = #13) and (not QProdutos.IsEmpty) then
    ModalResult := mrOK;
end;

procedure TFrmConsulta.FormShow(Sender: TObject);
begin
  DBGrid1.Columns.Clear;

  FrmConsulta.Width := 930;

  DBGrid1.Columns.Add;
  DBGrid1.Columns.Add;
  DBGrid1.Columns.Add;
  DBGrid1.Columns.Add;

  DBGrid1.Columns[0].FieldName := 'COD_BARRA';
  DBGrid1.Columns[1].FieldName := 'DESCRICAO';
  DBGrid1.Columns[2].FieldName := 'QUANTIDADE_C';
  DBGrid1.Columns[3].FieldName := 'PRECO_VAREJO';

  DBGrid1.Columns[0].Title.Caption := 'Cód. Barra';
  DBGrid1.Columns[1].Title.Caption := 'Descrição';
  DBGrid1.Columns[2].Title.Caption := 'Quantidade';
  DBGrid1.Columns[3].Title.Caption := 'Pr. Varejo';

  DBGrid1.Columns[0].Width := 120;
  DBGrid1.Columns[1].Width := 580;
  DBGrid1.Columns[2].Width := 90;
  DBGrid1.Columns[3].Width := 90;

  btnRetorna.Left := (FrmConsulta.Width - 87);

  FrmConsulta.Left := Round(((Screen.WorkAreaWidth - FrmConsulta.Width) / 2));
  FrmConsulta.Top  := Round(((Screen.WorkAreaHeight - FrmConsulta.Height) / 2));

  Localiz.Text     := '';

  Localiz.SetFocus;
end;

procedure TFrmConsulta.LocalizEnter(Sender: TObject);
begin
  Localiz.Text := '';
end;

procedure TFrmConsulta.DBGrid1DblClick(Sender: TObject);
begin
  if not QProdutos.IsEmpty then
    ModalResult := mrOK;
end;

end.
