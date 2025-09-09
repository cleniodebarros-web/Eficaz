unit UConsulta_Contribuicao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Grids, DBGrids, Spin, DBTables, DB, ComCtrls,
  IBCustomDataSet, IBQuery, Buttons, ShellApi, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmConsulta_Contribuicao = class(TForm)
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ChaveConsulta: String;
  FrmConsulta_Contribuicao: TFrmConsulta_Contribuicao;

  function GetConsulta_Contribuicao(Tabela, Vr_Atual: String): String;

implementation

uses
  UPrincipal, UData;

{$R *.DFM}

function GetConsulta_Contribuicao(Tabela, Vr_Atual: String): String;
begin
  ChaveConsulta := Tabela;

  Application.CreateForm(TFrmConsulta_Contribuicao, FrmConsulta_Contribuicao);
  try
    FrmConsulta_Contribuicao.ShowModal;

    if (not FrmConsulta_Contribuicao.QConsulta.IsEmpty) and (FrmConsulta_Contribuicao.ModalResult = mrOK) then
      Result := FrmConsulta_Contribuicao.QConsulta.Fields[0].AsString
    else
      Result := Vr_Atual;
  finally
    FrmConsulta_Contribuicao.Release;
  end;
end;

procedure TFrmConsulta_Contribuicao.LocalizKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    ModalResult := mrCancel;

  if (Key = #13) and (Localiz.Text <> '') then
  begin
   try
    QConsulta.Sql.Clear;
    QConsulta.Sql.Add('SELECT DISTINCT CODIGO, DESCRICAO');
    QConsulta.Sql.Add('FROM COD_CRED');
    QConsulta.Sql.Add('WHERE');
    QConsulta.Sql.Add('(DESCRICAO LIKE :DESCRICAO)');
    QConsulta.Sql.Add(' OR (CODIGO LIKE :CODIGO)');

    if  (Copy(ChaveConsulta, 6, 6) = '04') then
    begin
      QConsulta.Sql.Add('AND (TABELA = :TABELA)');
      QConsulta.Sql.Add('OR  (TABELA = :TABELA1)');

      QConsulta.ParamByName('TABELA').AsString := '4.3.10';
      QConsulta.ParamByName('TABELA1').AsString := '4.3.11';
    end;

    if (Copy(ChaveConsulta, 6, 6) = '03') then
    begin
      QConsulta.Sql.Add('AND (TABELA = :TABELA)');
      QConsulta.ParamByName('TABELA').AsString := '4.3.11';
    end;

    if Copy(ChaveConsulta, 6, 6) = '05' then
    begin
      QConsulta.Sql.Add('AND (TABELA = :TABELA)');
      QConsulta.ParamByName('TABELA').AsString := '4.3.12';
    end;

    if Copy(ChaveConsulta, 6, 6) = '06' then
    begin
      QConsulta.Sql.Add('AND (TABELA = :TABELA)');
      QConsulta.ParamByName('TABELA').AsString := '4.3.13';
    end;

    if Copy(ChaveConsulta, 6, 6) = '07' then
    begin
      QConsulta.Sql.Add('AND (TABELA = :TABELA)');
      QConsulta.ParamByName('TABELA').AsString := '4.3.14';
    end;

    if Copy(ChaveConsulta, 6, 6) = '08' then
    begin
      QConsulta.Sql.Add('AND (TABELA = :TABELA)');
      QConsulta.ParamByName('TABELA').AsString := '4.3.15';
    end;

    if Copy(ChaveConsulta, 6, 6) = '09' then
    begin
      QConsulta.Sql.Add('AND (TABELA = :TABELA)');
      QConsulta.ParamByName('TABELA').AsString := '4.3.16';
    end;

    QConsulta.Sql.Add('ORDER BY CODIGO');

    QConsulta.ParamByName('DESCRICAO').AsString :=  '%' + Localiz.Text + '%';
    QConsulta.ParamByName('CODIGO').AsString    := '%' +  Localiz.Text + '%';

    QConsulta.Prepare;
    QConsulta.Open;
   EXCEPT
    QConsulta.Sql.Clear;
    QConsulta.Sql.Add('SELECT DISTINCT CODIGO, DESCRICAO');
    QConsulta.Sql.Add('FROM COD_CRED');
    QConsulta.Sql.Add('WHERE');
    QConsulta.Sql.Add('(DESCRICAO LIKE :DESCRICAO)');

    if  (Copy(ChaveConsulta, 6, 6) = '04') then
    begin
      QConsulta.Sql.Add('AND (TABELA = :TABELA)');
      QConsulta.Sql.Add('OR  (TABELA = :TABELA1)');

      QConsulta.ParamByName('TABELA').AsString := '4.3.10';
      QConsulta.ParamByName('TABELA1').AsString := '4.3.11';
    end;

    if (Copy(ChaveConsulta, 6, 6) = '03') then
    begin
      QConsulta.Sql.Add('AND (TABELA = :TABELA)');
      QConsulta.ParamByName('TABELA').AsString := '4.3.11';
    end;

    if Copy(ChaveConsulta, 6, 6) = '05' then
    begin
      QConsulta.Sql.Add('AND (TABELA = :TABELA)');
      QConsulta.ParamByName('TABELA').AsString := '4.3.12';
    end;

    if Copy(ChaveConsulta, 6, 6) = '06' then
    begin
      QConsulta.Sql.Add('AND (TABELA = :TABELA)');
      QConsulta.ParamByName('TABELA').AsString := '4.3.13';
    end;

    if Copy(ChaveConsulta, 6, 6) = '07' then
    begin
      QConsulta.Sql.Add('AND (TABELA = :TABELA)');
      QConsulta.ParamByName('TABELA').AsString := '4.3.14';
    end;

    if Copy(ChaveConsulta, 6, 6) = '08' then
    begin
      QConsulta.Sql.Add('AND (TABELA = :TABELA)');
      QConsulta.ParamByName('TABELA').AsString := '4.3.15';
    end;

    if Copy(ChaveConsulta, 6, 6) = '09' then
    begin
      QConsulta.Sql.Add('AND (TABELA = :TABELA)');
      QConsulta.ParamByName('TABELA').AsString := '4.3.16';
    end;

    QConsulta.Sql.Add('ORDER BY CODIGO');

    QConsulta.ParamByName('DESCRICAO').AsString :=  '%' + Localiz.Text + '%';

    QConsulta.Prepare;
    QConsulta.Open;



   end;

    Perform(Wm_NextDlgctl, 0, 0);
  end;
end;

procedure TFrmConsulta_Contribuicao.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    ModalResult := mrCancel;

  if (Key = #13) and (not TBDEDataSet(FrmConsulta_Contribuicao.DataConsulta.DataSet).IsEmpty) then
    ModalResult := mrOK;
end;

procedure TFrmConsulta_Contribuicao.FormShow(Sender: TObject);
begin
  DBGrid1.Columns.Clear;

  QConsulta.Sql.Clear;
  QConsulta.Sql.Add('SELECT DISTINCT CODIGO, DESCRICAO');
  QConsulta.Sql.Add('FROM COD_CRED');

  if Copy(ChaveConsulta, 6, 6) = '04' then
  begin
    QConsulta.Sql.Add('WHERE');
    QConsulta.Sql.Add('(TABELA = :TABELA)');
    QConsulta.ParamByName('TABELA').AsString := '4.3.11';
  end;

  if Copy(ChaveConsulta, 6, 6) = '05' then
  begin
    QConsulta.Sql.Add('WHERE');
    QConsulta.Sql.Add('(TABELA = :TABELA)');
    QConsulta.ParamByName('TABELA').AsString := '4.3.12';
  end;

  if Copy(ChaveConsulta, 6, 6) = '06' then
  begin
    QConsulta.Sql.Add('WHERE');
    QConsulta.Sql.Add('(TABELA = :TABELA)');
    QConsulta.ParamByName('TABELA').AsString := '4.3.13';
  end;

  if Copy(ChaveConsulta, 6, 6) = '07' then
  begin
    QConsulta.Sql.Add('WHERE');
    QConsulta.Sql.Add('(TABELA = :TABELA)');
    QConsulta.ParamByName('TABELA').AsString := '4.3.14';
  end;

  if Copy(ChaveConsulta, 6, 6) = '08' then
  begin
    QConsulta.Sql.Add('WHERE');
    QConsulta.Sql.Add('(TABELA = :TABELA)');
    QConsulta.ParamByName('TABELA').AsString := '4.3.15';
  end;

  if Copy(ChaveConsulta, 6, 6) = '09' then
  begin
    QConsulta.Sql.Add('WHERE');
    QConsulta.Sql.Add('(TABELA = :TABELA)');
    QConsulta.ParamByName('TABELA').AsString := '4.3.16';
  end;

  QConsulta.Sql.Add('ORDER BY CODIGO');

  QConsulta.Prepare;
  QConsulta.Open;

  FrmConsulta_Contribuicao.Width := 800;

  DBGrid1.Columns.Add;
  DBGrid1.Columns.Add;

  DBGrid1.Columns[0].FieldName := 'CODIGO';
  DBGrid1.Columns[1].FieldName := 'DESCRICAO';

  DBGrid1.Columns[0].Title.Caption := 'Código';
  DBGrid1.Columns[1].Title.Caption := 'Descrição';

  DBGrid1.Columns[0].Width := 45;
  DBGrid1.Columns[1].Width := 716;

  Localiz.Width    := (FrmConsulta_Contribuicao.Width - 68);
  btnRetorna.Left  := (FrmConsulta_Contribuicao.Width - 87);

  FrmConsulta_Contribuicao.Left := Round(((Screen.WorkAreaWidth - FrmConsulta_Contribuicao.Width) / 2));
  FrmConsulta_Contribuicao.Top  := Round(((Screen.WorkAreaHeight - FrmConsulta_Contribuicao.Height) / 2));

  Localiz.Text := '';

  if not QConsulta.IsEmpty then
    DBGrid1.SetFocus
  else
    Localiz.SetFocus;
end;

procedure TFrmConsulta_Contribuicao.LocalizEnter(Sender: TObject);
begin
  Localiz.Text := '';
end;

procedure TFrmConsulta_Contribuicao.DBGrid1DblClick(Sender: TObject);
begin
  if not TBDEDataSet(FrmConsulta_Contribuicao.DataConsulta.DataSet).IsEmpty then
    ModalResult := mrOK;
end;

end.
