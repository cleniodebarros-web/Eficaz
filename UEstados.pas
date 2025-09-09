unit UEstados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ComCtrls, ToolWin, StdCtrls, Grids, DBGrids, Tabs, ExtCtrls,
  DB, IBCustomDataSet, IBQuery, Mask, Buttons, DBCtrls, rxToolEdit, rxCurrEdit,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmEstados = class(TForm)
    PageControl1: TPageControl;
    Panel1: TPanel;
    Consulta: TTabSheet;
    Manutencao: TTabSheet;
    DBGrid1: TDBGrid;
    DataTabela: TDataSource;
    ESTADO: TEdit;
    btnRetorna: TBitBtn;
    Panel2: TPanel;
    btnPrior: TBitBtn;
    btnNext: TBitBtn;
    btnInsert: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    btnSave: TBitBtn;
    btnDiscard: TBitBtn;
    ICMS: TCurrencyEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    UF: TComboBox;
    IQuery: TFDQuery;
    QTabela: TFDQuery;
    Label2: TLabel;
    Label6: TLabel;
    ALIQ_FCP: TCurrencyEdit;
    ICMS_PARTILHA: TCurrencyEdit;
    Label1: TLabel;
    ICMS_INTERNO: TCurrencyEdit;
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
    procedure UFKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ESTADOKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
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
  FrmEstados: TFrmEstados;
  Operacao, ID: String;

implementation

uses
  UPrincipal, UData;

{$R *.dfm}

procedure TFrmEstados.Botoes_Editing;
begin
  btnPrior.Enabled := False;
  btnNext.Enabled := False;
  btnInsert.Enabled := False;
  btnEdit.Enabled := False;
  btnDelete.Enabled := False;
  btnSave.Enabled := True;
  btnDiscard.Enabled := True;
  btnRetorna.Enabled := False;
end;

procedure TFrmEstados.Botoes_Normal;
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

procedure TFrmEstados.Habilitar(Status: Boolean);
var
I: Integer;
Temp: TComponent;
begin
  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
      TEdit(Temp).Enabled := Status;

    if Temp is TComboBox then
      TComboBox(Temp).Enabled := Status;

    if Temp is TCurrencyEdit then
      TCurrencyEdit(Temp).Enabled := Status;
  end;
end;

procedure TFrmEstados.Insert;
var
I: Integer;
Temp: TComponent;
Sql, Par: String;
begin
  Sql := 'INSERT INTO ESTADOS(';
  Par := '';

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
    begin
      if Sql = 'INSERT INTO ESTADOS(' then
        Sql := Sql + TEdit(Temp).Name
      else
        Sql := Sql + ', ' + TEdit(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TEdit(Temp).Name
      else
        Par := Par + ', :' + TEdit(Temp).Name;
    end;

    if Temp is TComboBox then
    begin
      if Sql = 'INSERT INTO ESTADOS(' then
        Sql := Sql + TComboBox(Temp).Name
      else
        Sql := Sql + ', ' + TComboBox(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TComboBox(Temp).Name
      else
        Par := Par + ', :' + TComboBox(Temp).Name;
    end;

    if Temp is TCurrencyEdit then
    begin
      if Sql = 'INSERT INTO ESTADOS(' then
        Sql := Sql + TCurrencyEdit(Temp).Name
      else
        Sql := Sql + ', ' + TCurrencyEdit(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TCurrencyEdit(Temp).Name
      else
        Par := Par + ', :' + TCurrencyEdit(Temp).Name;
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

    if Temp is TComboBox then
      IQuery.ParamByName(TComboBox(Temp).Name).AsString := TComboBox(Temp).Text;

    if Temp is TCurrencyEdit then
      IQuery.ParamByName(TCurrencyEdit(Temp).Name).AsFloat := TCurrencyEdit(Temp).Value;
  end;

  IQuery.Prepare;
  IQuery.ExecSql;

  Habilitar(False);
end;

procedure TFrmEstados.Edit;
var
I: Integer;
Temp: TComponent;
Sql: String;
begin
  Sql := 'UPDATE ESTADOS SET ';

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
    begin
      if Sql = 'UPDATE ESTADOS SET ' then
        Sql := Sql + TEdit(Temp).Name + ' = :' + TEdit(Temp).Name
      else
        Sql := Sql + ', ' + TEdit(Temp).Name + ' = :' + TEdit(Temp).Name;
    end;

    if Temp is TComboBox then
    begin
      if Sql = 'UPDATE ESTADOS SET ' then
        Sql := Sql + TComboBox(Temp).Name + ' = :' + TComboBox(Temp).Name
      else
        Sql := Sql + ', ' + TComboBox(Temp).Name + ' = :' + TComboBox(Temp).Name;
    end;

    if Temp is TCurrencyEdit then
    begin
      if Sql = 'UPDATE ESTADOS SET ' then
        Sql := Sql + TCurrencyEdit(Temp).Name + ' = :' + TCurrencyEdit(Temp).Name
      else
        Sql := Sql + ', ' + TCurrencyEdit(Temp).Name + ' = :' + TCurrencyEdit(Temp).Name;
    end;
  end;

  Sql := Sql + ' WHERE (UF = :ID)';


  IQuery.Sql.Clear;
  IQuery.Sql.Add(Sql);

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];
    if Temp is TEdit then
      IQuery.ParamByName(TEdit(Temp).Name).AsString := TEdit(Temp).Text;

    if Temp is TComboBox then
      IQuery.ParamByName(TComboBox(Temp).Name).AsString := TComboBox(Temp).Text;

    if Temp is TCurrencyEdit then
      IQuery.ParamByName(TCurrencyEdit(Temp).Name).AsFloat := TCurrencyEdit(Temp).Value;
  end;

  IQuery.ParamByName('ID').AsString := QTabela.FieldByName('UF').AsString;

  IQuery.Prepare;
  IQuery.ExecSql;

  QTabela.Close;
  QTabela.Open;
  QTabela.Locate('UF', ID, [loCaseInsensitive]);
  Habilitar(False);
end;

procedure TFrmEstados.ESTADOKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);
  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

function TFrmEstados.Validacao: Boolean;
begin
  Result := False;

  ESTADO.Color := clWindow;
  UF.Color     := clWindow;

  if not ChecaEstado(UF.Text) then
  begin
    Application.MessageBox('UF inválida', PChar(Msg_Title), mb_IconStop);
    UF.Color := clYellow;
    UF.SetFocus;
    exit;
  end;

  if ESTADO.Text = '' then
  begin
    Application.MessageBox('Informe o Nome do Estado', PChar(Msg_Title), mb_IconStop);
    ESTADO.Color := clYellow;
    ESTADO.SetFocus;
    exit;
  end;
  Result := True;
end;

procedure TFrmEstados.ManutencaoShow(Sender: TObject);
begin
  Set_Campos(False);
  Botoes_Normal;
end;

procedure TFrmEstados.Set_Campos(Vazio: Boolean);
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

      if Temp is TComboBox then
        TComboBox(Temp).Text := '';

      if Temp is TCurrencyEdit then
        TCurrencyEdit(Temp).Value := 0;
    end
    else
    begin
      if Temp is TEdit then
        TEdit(Temp).Text := QTabela.FieldByName(TEdit(Temp).Name).AsString;

      if Temp is TComboBox then
        TComboBox(Temp).Text := QTabela.FieldByName(TComboBox(Temp).Name).AsString;

      if Temp is TCurrencyEdit then
        TCurrencyEdit(Temp).Value := QTabela.FieldByName(TCurrencyEdit(Temp).Name).AsFloat;
    end;
  end;
end;

procedure TFrmEstados.UFKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmEstados.btnDeleteClick(Sender: TObject);
begin
  if FrmData.QAcesso.FieldByName('EXCLUSAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para exclusão', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  if Application.MessageBox('Deseja realmente excluir?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = IDYES then
  begin

    IQuery.Sql.Clear;
    IQuery.Sql.Add('DELETE FROM ESTADOS');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(UF = :ID)');
    IQuery.ParamByName('ID').AsString := QTabela.FieldByName('UF').AsString;
    IQuery.Prepare;
    IQuery.ExecSql;

    QTabela.Close;
    QTabela.Open;
    Set_Campos(False);
    Botoes_Normal;
  end;
end;

procedure TFrmEstados.btnDiscardClick(Sender: TObject);
begin
  Botoes_Normal;
  Set_Campos(False);
  Habilitar(False);
  Operacao := '';
  Consulta.TabVisible := True;
end;

procedure TFrmEstados.btnEditClick(Sender: TObject);
begin
  if FrmData.QAcesso.FieldByName('ALTERACAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para alteração', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  Operacao := 'Alterando';
  ID := QTabela.FieldByName('UF').AsString;
  Botoes_Editing;
  Habilitar(True);

  Consulta.TabVisible := False;
  
  UF.SetFocus;
end;

procedure TFrmEstados.btnInsertClick(Sender: TObject);
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
  
  UF.SetFocus;
end;

procedure TFrmEstados.btnNextClick(Sender: TObject);
begin
  if not QTabela.Eof then
  begin
    QTabela.Next;
    Set_Campos(False);
  end;
  Botoes_Normal;
end;

procedure TFrmEstados.btnPriorClick(Sender: TObject);
begin
  if not QTabela.Bof then
  begin
    QTabela.Prior;
    Set_Campos(False);
  end;
  Botoes_Normal;
end;

procedure TFrmEstados.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmEstados.btnSaveClick(Sender: TObject);
begin
  if Validacao then
  begin
    if Operacao = 'Inserindo' then
    begin
      Insert;

      CmdSelectNull := 'WHERE (UF = :UF)';
      CmdOrderBy    := 'ORDER BY UF';

      QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

      QTabela.ParamByName('UF').AsString := UF.Text;

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

procedure TFrmEstados.DBGrid1DblClick(Sender: TObject);
begin
  Manutencao.Show;
end;

procedure TFrmEstados.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Manutencao.Show;
end;

procedure TFrmEstados.DBGrid1TitleClick(Column: TColumn);
begin
  CmdOrderBy := 'ORDER BY ' + Column.FieldName;
  
  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;
  QTabela.Open;
end;

procedure TFrmEstados.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmEstados.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (Operacao = 'Inserindo') or (Operacao = 'Alterando') then
  begin
    Application.MessageBox('É melhor salvar as alterações antes de continuar', PChar(Msg_Title), mb_IconStop);
    CanClose := False;
  end;
end;

procedure TFrmEstados.FormCreate(Sender: TObject);
begin
  DBGrid1.Columns[0].Width := 35;
  DBGrid1.Columns[1].Width := 400;
  DBGrid1.Columns[2].Width := 104;

  CmdSelect     := QTabela.Sql.Text;
  CmdSelectNull := 'WHERE (UF IS NOT NULL)';
  CmdOrderBy    := 'ORDER BY ESTADO';

  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;
  QTabela.Open;
end;

procedure TFrmEstados.FormShow(Sender: TObject);
begin
  DBGrid1.SetFocus;
end;

end.
