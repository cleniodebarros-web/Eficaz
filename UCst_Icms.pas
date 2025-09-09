unit UCst_Icms;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ComCtrls, ToolWin, StdCtrls, Grids, DBGrids, Tabs, ExtCtrls,
  DB, IBCustomDataSet, IBQuery, Mask, Buttons, DBCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmCST_ICMS = class(TForm)
    PageControl1: TPageControl;
    Panel1: TPanel;
    Consulta: TTabSheet;
    Manutencao: TTabSheet;
    DBGrid1: TDBGrid;
    DataTabela: TDataSource;
    CODIGO: TEdit;
    btnRetorna: TBitBtn;
    Panel2: TPanel;
    btnPrior: TBitBtn;
    btnNext: TBitBtn;
    btnInsert: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    btnSave: TBitBtn;
    btnDiscard: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    DESCRICAO: TEdit;
    Label7: TLabel;
    Comeca_Com: TLabeledEdit;
    btnComeca_Com: TSpeedButton;
    IQuery: TFDQuery;
    QTabela: TFDQuery;
    Label1: TLabel;
    CST_ICMS_CONV: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRetornaClick(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDiscardClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure ManutencaoShow(Sender: TObject);
    procedure btnPriorClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure CODIGOKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnCFOPClick(Sender: TObject);
    procedure btnComeca_ComClick(Sender: TObject);
    procedure Comeca_ComKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    CmdSelect: String;
    CmdOrderBy: String;
    CmdSelectNull: String;
    procedure Botoes_Editing;
    procedure Botoes_Normal;
    procedure Habilitar(Status: Boolean);
    procedure Insert;
    procedure Set_Campos(Vazio: Boolean);
    procedure Edit;
    function Validacao: Boolean;
  end;

var
  FrmCST_ICMS: TFrmCST_ICMS;
  Operacao, ID: String;

implementation

uses
  UPrincipal, UData, UConsulta_Cfop;

{$R *.dfm}

procedure TFrmCST_ICMS.Botoes_Editing;
begin
  btnPrior.Enabled   := False;
  btnNext.Enabled    := False;
  btnInsert.Enabled  := False;
  btnEdit.Enabled    := False;
  btnDelete.Enabled  := False;
  btnSave.Enabled    := True;
  btnDiscard.Enabled := True;
  btnRetorna.Enabled := False;
end;

procedure TFrmCST_ICMS.Botoes_Normal;
begin
  if not QTabela.Bof then
    btnPrior.Enabled := True
  else
    btnPrior.Enabled := False;

  if not QTabela.Eof then
    btnNext.Enabled := True
  else
    btnNext.Enabled := False;

  btnInsert.Enabled := True;

  if not QTabela.IsEmpty then
  begin
    btnEdit.Enabled := True;
    btnDelete.Enabled := True;
  end
  else
  begin
    btnEdit.Enabled := False;
    btnDelete.Enabled := False;
  end;

  btnSave.Enabled := False;
  btnDiscard.Enabled := False;
  btnRetorna.Enabled := True;
end;

procedure TFrmCST_ICMS.Habilitar(Status: Boolean);
var
I: Integer;
Temp: TComponent;
begin
  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
      TEdit(Temp).Enabled := Status;

    if Temp is TMemo then
      TMemo(Temp).Enabled := Status;
  end;
end;

procedure TFrmCST_ICMS.Insert;
var
I: Integer;
Temp: TComponent;
Sql, Par: String;
begin
  Sql := 'INSERT INTO CST_ICMS(';
  Par := '';

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
    begin
      if Sql = 'INSERT INTO CST_ICMS(' then
        Sql := Sql + TEdit(Temp).Name
      else
        Sql := Sql + ', ' + TEdit(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TEdit(Temp).Name
      else
        Par := Par + ', :' + TEdit(Temp).Name;
    end;

    if Temp is TMemo then
    begin
      if Sql = 'INSERT INTO CST_ICMS(' then
        Sql := Sql + TMemo(Temp).Name
      else
        Sql := Sql + ', ' + TMemo(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TMemo(Temp).Name
      else
        Par := Par + ', :' + TMemo(Temp).Name;
    end;
  end;

  Sql := Sql + ') VALUES(' + Par + ')';

 
  IQuery.Sql.Clear;
  IQuery.Sql.Add(Sql);

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
      IQuery.ParamByName(TEdit(Temp).Name).AsString := TEdit(Temp).Text;

    if Temp is TMemo then
      IQuery.ParamByName(TMemo(Temp).Name).AsString := TMemo(Temp).Text;
  end;

  IQuery.Prepare;
  IQuery.ExecSql;

  Habilitar(False);
end;

procedure TFrmCST_ICMS.Edit;
var
I: Integer;
Temp: TComponent;
Sql: String;
begin
  Sql := 'UPDATE CST_ICMS SET ';

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
    begin
      if Sql = 'UPDATE CST_ICMS SET ' then
        Sql := Sql + TEdit(Temp).Name + ' = :' + TEdit(Temp).Name
      else
        Sql := Sql + ', ' + TEdit(Temp).Name + ' = :' + TEdit(Temp).Name;
    end;

    if Temp is TMemo then
    begin
      if Sql = 'UPDATE CST_ICMS SET ' then
        Sql := Sql + TMemo(Temp).Name + ' = :' + TMemo(Temp).Name
      else
        Sql := Sql + ', ' + TMemo(Temp).Name + ' = :' + TMemo(Temp).Name;
    end;
  end;

  Sql := Sql + ' WHERE (CODIGO = :ID)';

  
  IQuery.Sql.Clear;
  IQuery.Sql.Add(Sql);

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];
    if Temp is TEdit then
      IQuery.ParamByName(TEdit(Temp).Name).AsString := TEdit(Temp).Text;

    if Temp is TMemo then
      IQuery.ParamByName(TMemo(Temp).Name).AsString := TMemo(Temp).Text;
  end;

  IQuery.ParamByName('ID').AsString := QTabela.FieldByName('CODIGO').AsString;

  IQuery.Prepare;
  IQuery.ExecSql;

  QTabela.Close;
  QTabela.Open;
  QTabela.Locate('CODIGO', ID, [loCaseInsensitive]);
  Habilitar(False);
end;

function TFrmCST_ICMS.Validacao: Boolean;
begin
  Result := False;
  
  DESCRICAO.Color := clWindow;

  if DESCRICAO.Text = '' then
  begin
    Application.MessageBox('Informe a Descrição', PChar(Msg_Title), mb_IconStop);
    DESCRICAO.Color := clYellow;
    DESCRICAO.SetFocus;
    exit;
  end;
  Result := True;
end;

procedure TFrmCST_ICMS.ManutencaoShow(Sender: TObject);
begin
  Set_Campos(False);
  Botoes_Normal;
end;

procedure TFrmCST_ICMS.Set_Campos(Vazio: Boolean);
var
I: Integer;
Temp: TComponent;
begin
  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];
    if Vazio then
    begin
      if Temp is TEdit then
        TEdit(Temp).Text := '';

      if Temp is TMemo then
        TMemo(Temp).Lines.Clear;
    end
    else
    begin
      if Temp is TEdit then
        TEdit(Temp).Text := QTabela.FieldByName(TEdit(Temp).Name).AsString;

      if Temp is TMemo then
        TMemo(Temp).Text := QTabela.FieldByName(TMemo(Temp).Name).AsString;
    end;
  end;
end;

procedure TFrmCST_ICMS.btnCFOPClick(Sender: TObject);
begin
GetConsulta_CFOP(' ');
end;

procedure TFrmCST_ICMS.btnComeca_ComClick(Sender: TObject);
begin
  if Comeca_Com.Text <> '' then
  begin
  // Try
    if FrmPrincipal.Config.FieldByName('VER_DESATIVADOS').AsString = 'True' then
      CmdSelectNull := 'WHERE ((DESCRICAO LIKE ' + #39 + '%' + Comeca_Com.Text  + #39 + ') OR (CODIGO LIKE ' + #39 + '%' + Comeca_Com.Text  + #39 + '))'
    else
      CmdSelectNull := 'WHERE ((DESCRICAO LIKE ' + #39 +  '%' + Comeca_Com.Text  + #39 + ') OR (CODIGO LIKE ' + #39 + '%' + Comeca_Com.Text  + #39 + '))';

    CmdOrderBy := 'ORDER BY DESCRICAO';

    QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

    QTabela.Prepare;
    QTabela.Open;
   
  end;
end;

procedure TFrmCST_ICMS.btnDeleteClick(Sender: TObject);
begin
  if FrmData.QAcesso.FieldByName('EXCLUSAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para exclusão', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  if Application.MessageBox('Deseja realmente excluir?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = IDYES then
  begin

    IQuery.Sql.Clear;
    IQuery.Sql.Add('DELETE FROM CST_ICMS');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(CODIGO = :ID)');

    IQuery.ParamByName('ID').AsString := QTabela.FieldByName('CODIGO').AsString;

    IQuery.Prepare;
    IQuery.ExecSql;



    QTabela.Close;

    QTabela.Prepare;
    QTabela.Open;

    Set_Campos(False);
    Botoes_Normal;
  end;
end;

procedure TFrmCST_ICMS.btnDiscardClick(Sender: TObject);
begin
  Botoes_Normal;
  Set_Campos(False);
  Habilitar(False);
  Operacao := '';
  Consulta.TabVisible := True;
end;

procedure TFrmCST_ICMS.btnEditClick(Sender: TObject);
begin
  if FrmData.QAcesso.FieldByName('ALTERACAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para alteração', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  Operacao := 'Alterando';
  ID := QTabela.FieldByName('CODIGO').AsString;
  Botoes_Editing;
  Habilitar(True);

  Consulta.TabVisible := False;

  DESCRICAO.SetFocus;
end;

procedure TFrmCST_ICMS.btnInsertClick(Sender: TObject);
begin
  if FrmData.QAcesso.FieldByName('INCLUSAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para inclusão', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  Operacao := 'Inserindo';
  Botoes_Editing;
  Set_Campos(True);
  Habilitar(True);

  Consulta.TabVisible := False;

  DESCRICAO.SetFocus;
end;

procedure TFrmCST_ICMS.btnNextClick(Sender: TObject);
begin
  if not QTabela.Eof then
  begin
    QTabela.Next;
    Set_Campos(False);
  end;

  Botoes_Normal;
end;

procedure TFrmCST_ICMS.btnPriorClick(Sender: TObject);
begin
  if not QTabela.Bof then
  begin
    QTabela.Prior;
    Set_Campos(False);
  end;

  Botoes_Normal;
end;

procedure TFrmCST_ICMS.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCST_ICMS.btnSaveClick(Sender: TObject);
begin
  if Validacao then
  begin
    if Operacao = 'Inserindo' then
    begin
      Insert;

      CmdSelectNull := 'WHERE (CODIGO = :CODIGO)';
      CmdOrderBy    := 'ORDER BY CODIGO';

      QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

      QTabela.ParamByName('CODIGO').AsString := CODIGO.Text;

      QTabela.Open;
      QTabela.Last;
    end
    else
      Edit;

    Set_Campos(False);
    Habilitar(False);
    Botoes_Normal;

    Operacao := '';
    Consulta.TabVisible := True;
  end;
end;

procedure TFrmCST_ICMS.CODIGOKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmCST_ICMS.Comeca_ComKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    btnComeca_ComClick(Sender);
end;

procedure TFrmCST_ICMS.DBGrid1DblClick(Sender: TObject);
begin
  Manutencao.Show;
end;

procedure TFrmCST_ICMS.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Manutencao.Show;
end;

procedure TFrmCST_ICMS.DBGrid1TitleClick(Column: TColumn);
begin
  CmdOrderBy := 'ORDER BY ' + Column.FieldName;
  
  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;
  QTabela.Open;
end;

procedure TFrmCST_ICMS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmCST_ICMS.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (Operacao = 'Inserindo') or (Operacao = 'Alterando') then
  begin
    Application.MessageBox('É melhor salvar as alterações antes de continuar', PChar(Msg_Title), mb_IconStop);
    CanClose := False;
  end;
end;

procedure TFrmCST_ICMS.FormCreate(Sender: TObject);
begin
  DBGrid1.Columns[0].Width := 60;
  DBGrid1.Columns[1].Width := 504;

  CmdSelect     := QTabela.Sql.Text;
  CmdSelectNull := 'WHERE (CODIGO IS NOT NULL)';
  CmdOrderBy    := 'ORDER BY CODIGO';

  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;
  QTabela.Open;
end;

procedure TFrmCST_ICMS.FormShow(Sender: TObject);
begin
  DBGrid1.SetFocus;
end;

end.
