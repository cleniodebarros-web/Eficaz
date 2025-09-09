unit UConsulta_CST;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Grids, DBGrids, Spin, DBTables, DB, ComCtrls,
  IBCustomDataSet, IBQuery, Buttons, ShellApi, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmConsulta_CST = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Localiz: TEdit;
    DataConsulta: TDataSource;
    btnRetorna: TBitBtn;
    Label2: TLabel;
    QConsulta: TFDQuery;
    procedure LocalizKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure LocalizEnter(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Label2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ChaveConsulta: String;
  FrmConsulta_CST: TFrmConsulta_CST;

  function GetConsulta_CST(Tabela, Vr_Atual: String): String;

implementation

uses
  UPrincipal, UData;

{$R *.DFM}

function GetConsulta_CST(Tabela, Vr_Atual: String): String;
begin
  ChaveConsulta := Tabela;

  Application.CreateForm(TFrmConsulta_CST, FrmConsulta_CST);
  try
    FrmConsulta_CST.ShowModal;

    if (not FrmConsulta_CST.QConsulta.IsEmpty) and (FrmConsulta_CST.ModalResult = mrOK) then
      Result := FrmConsulta_CST.QConsulta.Fields[0].AsString
    else
      Result := Vr_Atual;
  finally
    FrmConsulta_CST.Release;
  end;
end;

procedure TFrmConsulta_CST.LocalizKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    ModalResult := mrCancel;

  if (Key = #13) and (Localiz.Text <> '') then
  begin
    if ChaveConsulta = 'CNAE' then
    begin
      QConsulta.Sql.Clear;
      QConsulta.Sql.Add('SELECT SUBCLASSE, SECAO, DIVISAO, GRUPO, CLASSE, DENOMINACAO');
      QConsulta.Sql.Add('FROM CNAE');
      QConsulta.Sql.Add('WHERE');
      QConsulta.Sql.Add('(DENOMINACAO LIKE :DENOMINACAO)');
      QConsulta.Sql.Add('ORDER BY SECAO, DIVISAO, GRUPO, CLASSE, SUBCLASSE');

      QConsulta.ParamByName('DENOMINACAO').AsString := '%' + Localiz.Text + '%';

      QConsulta.Prepare;
      QConsulta.Open;
    end;

    if ChaveConsulta = 'CNI' then
    begin
      QConsulta.Sql.Clear;
      QConsulta.Sql.Add('SELECT * FROM CNIEE');
      QConsulta.Sql.Add('WHERE');
      QConsulta.Sql.Add('(DESC_MARCA LIKE :DESC_MARCA)');
      QConsulta.Sql.Add('ORDER BY DESC_MARCA, CNI, DESC_MODELO');

      QConsulta.ParamByName('DESC_MARCA').AsString := '%' + Localiz.Text + '%';

      QConsulta.Prepare;
      QConsulta.Open;
    end;

    if ChaveConsulta = 'CST_COFINS' then
    begin
      QConsulta.Sql.Clear;
      QConsulta.Sql.Add('SELECT * FROM CST_COFINS');
      QConsulta.Sql.Add('WHERE');
      QConsulta.Sql.Add('(DESCRICAO LIKE :DESCRICAO)');
      QConsulta.Sql.Add('ORDER BY CODIGO');

      QConsulta.ParamByName('DESCRICAO').AsString := '%' + Localiz.Text + '%';

      QConsulta.Prepare;
      QConsulta.Open;
    end;

    if ChaveConsulta = 'CST_ICMS' then
    begin
      QConsulta.Sql.Clear;
      QConsulta.Sql.Add('SELECT * FROM CST_ICMS');
      QConsulta.Sql.Add('WHERE');
      QConsulta.Sql.Add('(DESCRICAO LIKE :DESCRICAO)');
      QConsulta.Sql.Add('ORDER BY CODIGO');

      QConsulta.ParamByName('DESCRICAO').AsString := '%' + Localiz.Text + '%';

      QConsulta.Prepare;
      QConsulta.Open;
    end;

    if ChaveConsulta = 'CST_IPI' then
    begin
      QConsulta.Sql.Clear;
      QConsulta.Sql.Add('SELECT * FROM CST_IPI');
      QConsulta.Sql.Add('WHERE');
      QConsulta.Sql.Add('(DESCRICAO LIKE :DESCRICAO)');
      QConsulta.Sql.Add('ORDER BY CODIGO');

      QConsulta.ParamByName('DESCRICAO').AsString := '%' + Localiz.Text + '%';

      QConsulta.Prepare;
      QConsulta.Open;
    end;

    if ChaveConsulta = 'CST_PIS' then
    begin
      QConsulta.Sql.Clear;
      QConsulta.Sql.Add('SELECT * FROM CST_PIS');
      QConsulta.Sql.Add('WHERE');
      QConsulta.Sql.Add('(DESCRICAO LIKE :DESCRICAO)');
      QConsulta.Sql.Add('ORDER BY CODIGO');

      QConsulta.ParamByName('DESCRICAO').AsString := '%' + Localiz.Text + '%';

      QConsulta.Prepare;
      QConsulta.Open;
    end;

    if ChaveConsulta = 'GENEROS' then
    begin
      QConsulta.Sql.Clear;
      QConsulta.Sql.Add('SELECT * FROM GENERO_PRODUTOS');
      QConsulta.Sql.Add('WHERE');
      QConsulta.Sql.Add('(DESCRICAO LIKE :DESCRICAO)');
      QConsulta.Sql.Add('ORDER BY CODIGO');

      QConsulta.ParamByName('DESCRICAO').AsString   := '%' + Localiz.Text + '%';

      QConsulta.Prepare;
      QConsulta.Open;
    end;

    if ChaveConsulta = 'MODELO_DOC' then
    begin
      QConsulta.Sql.Clear;
      QConsulta.Sql.Add('SELECT * FROM MODELO_DOC');
      QConsulta.Sql.Add('WHERE');
      QConsulta.Sql.Add('(DESCRICAO LIKE :DESCRICAO)');
      QConsulta.Sql.Add('ORDER BY CODIGO');

      QConsulta.ParamByName('DESCRICAO').AsString := '%' + Localiz.Text + '%';

      QConsulta.Prepare;
      QConsulta.Open;
    end;

    if ChaveConsulta = 'EMBALAGEM' then
    begin
      QConsulta.Sql.Clear;
      QConsulta.Sql.Add('SELECT DESCRICAO,NIVEL FROM TABELAS');
      QConsulta.Sql.Add('WHERE');
      QConsulta.Sql.Add('(DESCRICAO LIKE :DESCRICAO)');
      QConsulta.Sql.Add('AND (TIPO_TABELA = :TIPO_TABELA)');
      QConsulta.Sql.Add('AND (STATUS = :STATUS)');
      QConsulta.Sql.Add('ORDER BY DESCRICAO');

      QConsulta.ParamByName('DESCRICAO').AsString   :=  '%' + Localiz.Text + '%';
      QConsulta.ParamByName('TIPO_TABELA').AsString := '9';
      QConsulta.ParamByName('STATUS').AsString      := 'A';

      QConsulta.Prepare;
      QConsulta.Open;
    end;


    Perform(Wm_NextDlgctl, 0, 0);
  end;
end;

procedure TFrmConsulta_CST.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    ModalResult := mrCancel;

  if (Key = #13) and (not TBDEDataSet(FrmConsulta_CST.DataConsulta.DataSet).IsEmpty) then
    ModalResult := mrOK;
end;

procedure TFrmConsulta_CST.FormShow(Sender: TObject);
begin
  DBGrid1.Columns.Clear;

  if ChaveConsulta = 'CNAE' then
  begin
    QConsulta.Sql.Clear;
    QConsulta.Sql.Add('SELECT SUBCLASSE, SECAO, DIVISAO, GRUPO, CLASSE, DENOMINACAO');
    QConsulta.Sql.Add('FROM CNAE');
    QConsulta.Sql.Add('ORDER BY SECAO, DIVISAO, GRUPO, CLASSE, SUBCLASSE');

    QConsulta.Prepare;
    QConsulta.Open;
  end;

  if ChaveConsulta = 'CNI' then
  begin
    QConsulta.Sql.Clear;
    QConsulta.Sql.Add('SELECT * FROM CNIEE');
    QConsulta.Sql.Add('ORDER BY DESC_MARCA, CNI, DESC_MODELO');

    QConsulta.Prepare;
    QConsulta.Open;
  end;

  if ChaveConsulta = 'CST_COFINS' then
  begin
    QConsulta.Sql.Clear;
    QConsulta.Sql.Add('SELECT * FROM CST_COFINS');
    QConsulta.Sql.Add('ORDER BY CODIGO');

    QConsulta.Prepare;
    QConsulta.Open;
  end;

  if ChaveConsulta = 'CST_ICMS' then
  begin
    QConsulta.Sql.Clear;
    QConsulta.Sql.Add('SELECT * FROM CST_ICMS');
    QConsulta.Sql.Add('ORDER BY CODIGO');

    QConsulta.Prepare;
    QConsulta.Open;
  end;

  if ChaveConsulta = 'CST_IPI' then
  begin
    QConsulta.Sql.Clear;
    QConsulta.Sql.Add('SELECT * FROM CST_IPI');
    QConsulta.Sql.Add('ORDER BY CODIGO');

    QConsulta.Prepare;
    QConsulta.Open;
  end;

  if ChaveConsulta = 'CST_PIS' then
  begin
    QConsulta.Sql.Clear;
    QConsulta.Sql.Add('SELECT * FROM CST_PIS');
    QConsulta.Sql.Add('ORDER BY CODIGO');

    QConsulta.Prepare;
    QConsulta.Open;
  end;

  if ChaveConsulta = 'GENEROS' then
  begin
    QConsulta.Sql.Clear;
    QConsulta.Sql.Add('SELECT * FROM GENERO_PRODUTOS');
    QConsulta.Sql.Add('ORDER BY CODIGO');

    QConsulta.Prepare;
    QConsulta.Open;
  end;

  if ChaveConsulta = 'MODELO_DOC' then
  begin
    QConsulta.Sql.Clear;
    QConsulta.Sql.Add('SELECT * FROM MODELO_DOC');
    QConsulta.Sql.Add('ORDER BY CODIGO');

    QConsulta.Prepare;
    QConsulta.Open;
  end;

  if ChaveConsulta = 'EMBALAGEM' then
  begin
    QConsulta.Sql.Clear;
    QConsulta.Sql.Add('SELECT DESCRICAO, NIVEL FROM TABELAS');
    QConsulta.Sql.Add('WHERE TIPO_TABELA = :TIPO_TABELA');
    QConsulta.Sql.Add('AND (STATUS = :STATUS)');
    QConsulta.Sql.Add('ORDER BY DESCRICAO');

    QConsulta.ParamByName('TIPO_TABELA').AsString := '9';
    QConsulta.ParamByName('STATUS').AsString      := 'A';
    QConsulta.Prepare;
    QConsulta.Open;
  end;


  if ChaveConsulta = 'CNAE' then
  begin
    Label2.Visible        := True;
    FrmConsulta_CST.Width := 800;

    DBGrid1.Columns.Add;
    DBGrid1.Columns.Add;
    DBGrid1.Columns.Add;
    DBGrid1.Columns.Add;
    DBGrid1.Columns.Add;
    DBGrid1.Columns.Add;

    DBGrid1.Columns[0].FieldName := 'SECAO';
    DBGrid1.Columns[1].FieldName := 'DIVISAO';
    DBGrid1.Columns[2].FieldName := 'GRUPO';
    DBGrid1.Columns[3].FieldName := 'CLASSE';
    DBGrid1.Columns[4].FieldName := 'SUBCLASSE';
    DBGrid1.Columns[5].FieldName := 'DENOMINACAO';

    DBGrid1.Columns[0].Title.Caption := 'Seção';
    DBGrid1.Columns[1].Title.Caption := 'Divisão';
    DBGrid1.Columns[2].Title.Caption := 'Grupo';
    DBGrid1.Columns[3].Title.Caption := 'Classe';
    DBGrid1.Columns[4].Title.Caption := 'Sub-Classe';
    DBGrid1.Columns[5].Title.Caption := 'Descrição';

    DBGrid1.Columns[0].Width := 38;
    DBGrid1.Columns[1].Width := 46;
    DBGrid1.Columns[2].Width := 39;
    DBGrid1.Columns[3].Width := 46;
    DBGrid1.Columns[4].Width := 60;
    DBGrid1.Columns[5].Width := 528;
  end;

  if ChaveConsulta = 'CNI' then
  begin
    FrmConsulta_CST.Width := 638;

    DBGrid1.Columns.Add;
    DBGrid1.Columns.Add;
    DBGrid1.Columns.Add;
    DBGrid1.Columns.Add;
    DBGrid1.Columns.Add;
    DBGrid1.Columns.Add;

    DBGrid1.Columns[0].FieldName := 'CNI';
    DBGrid1.Columns[1].FieldName := 'TIPO';
    DBGrid1.Columns[2].FieldName := 'DESC_MARCA';
    DBGrid1.Columns[3].FieldName := 'DESC_MODELO';
    DBGrid1.Columns[4].FieldName := 'VERSAO_SB';

    DBGrid1.Columns[0].Title.Caption := 'CNI';
    DBGrid1.Columns[1].Title.Caption := 'Tipo ECF';
    DBGrid1.Columns[2].Title.Caption := 'Marca';
    DBGrid1.Columns[3].Title.Caption := 'Modelo';
    DBGrid1.Columns[4].Title.Caption := 'Versão SB';

    DBGrid1.Columns[0].Width := 40;
    DBGrid1.Columns[1].Width := 64;
    DBGrid1.Columns[2].Width := 184;
    DBGrid1.Columns[3].Width := 184;
    DBGrid1.Columns[4].Width := 124;
  end;

  if (ChaveConsulta = 'CST_COFINS') or (ChaveConsulta = 'CST_ICMS') or (ChaveConsulta = 'CST_PIS') or (ChaveConsulta = 'GENEROS') then
  begin
    FrmConsulta_CST.Width := 800;

    DBGrid1.Columns.Add;
    DBGrid1.Columns.Add;

    DBGrid1.Columns[0].FieldName := 'CODIGO';
    DBGrid1.Columns[1].FieldName := 'DESCRICAO';

    DBGrid1.Columns[0].Title.Caption := 'Código';
    DBGrid1.Columns[1].Title.Caption := 'Descrição';

    DBGrid1.Columns[0].Width := 45;
    DBGrid1.Columns[1].Width := 716;
  end;

  if (ChaveConsulta = 'CST_IPI') or (ChaveConsulta = 'MODELO_DOC') then
  begin
    FrmConsulta_CST.Width := 450;

    DBGrid1.Columns.Add;
    DBGrid1.Columns.Add;

    DBGrid1.Columns[0].FieldName := 'CODIGO';
    DBGrid1.Columns[1].FieldName := 'DESCRICAO';

    DBGrid1.Columns[0].Title.Caption := 'Código';
    DBGrid1.Columns[1].Title.Caption := 'Descrição';

    DBGrid1.Columns[0].Width := 64;
    DBGrid1.Columns[1].Width := 368;
  end;

  if ChaveConsulta = 'EMBALAGEM' then
  begin
    FrmConsulta_CST.Width := 200;

    DBGrid1.Columns.Add;
    DBGrid1.Columns.Add;

    DBGrid1.Columns[0].FieldName := 'DESCRICAO';
    DBGrid1.Columns[1].FieldName := 'NIVEL';

    DBGrid1.Columns[0].Title.Caption := 'Unidade';
    DBGrid1.Columns[1].Title.Caption := 'Descrição';

    DBGrid1.Columns[0].Width := 50;
    DBGrid1.Columns[1].Width := 150;
  end;

  Localiz.Width    := (FrmConsulta_CST.Width - 68);
  btnRetorna.Left  := (FrmConsulta_CST.Width - 87);

  FrmConsulta_CST.Left := Round(((Screen.WorkAreaWidth - FrmConsulta_CST.Width) / 2));
  FrmConsulta_CST.Top  := Round(((Screen.WorkAreaHeight - FrmConsulta_CST.Height) / 2));

  Localiz.Text := '';

 { if (not QConsulta.IsEmpty) then
    DBGrid1.SetFocus
  else
    Localiz.SetFocus;}
end;

procedure TFrmConsulta_CST.Label2Click(Sender: TObject);
begin
  ShellExecute(Handle, 'Open', PChar('http://www.cnae.ibge.gov.br/estrutura.asp?TabelaBusca=CNAE_200@CNAE%202.0'), nil, nil, Sw_ShowMaximized);
end;

procedure TFrmConsulta_CST.LocalizEnter(Sender: TObject);
begin
  Localiz.Text := '';
end;

procedure TFrmConsulta_CST.DBGrid1DblClick(Sender: TObject);
begin
  if not TBDEDataSet(FrmConsulta_CST.DataConsulta.DataSet).IsEmpty then
    ModalResult := mrOK;
end;

end.
