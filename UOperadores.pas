unit UOperadores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ComCtrls, ToolWin, StdCtrls, Grids, DBGrids, Tabs, ExtCtrls,
  DB, IBCustomDataSet, IBQuery, Mask, Buttons, rxToolEdit, rxCurrEdit,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmOperadores = class(TForm)
    PageControl1: TPageControl;
    Panel1: TPanel;
    Consulta: TTabSheet;
    Manutencao: TTabSheet;
    DBGrid1: TDBGrid;
    DataTabela: TDataSource;
    OPERADOR_ID: TEdit;
    NOME: TEdit;
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
    Label2: TLabel;
    DESCONTO_MAX_SUB_TOTAL: TLabel;
    ENTRADA_OPERADOR: TCheckBox;
    SAIDA_SISTEMA: TCheckBox;
    DESLIGAR: TCheckBox;
    SAIDA_VENDA: TCheckBox;
    DESCONTO_MAX_ITEM: TRxCalcEdit;
    DESCONTO_MAX_SUBTOTAL: TRxCalcEdit;
    Label5: TLabel;
    LIMITE_APROVA: TRxCalcEdit;
    CANCELA_CUPOM: TCheckBox;
    CANCELA_ITEM: TCheckBox;
    LEITURA_Z: TCheckBox;
    SAIDA_OPERADOR: TCheckBox;
    ENTRADA_SISTEMA: TCheckBox;
    ENTRADA_VENDA: TCheckBox;
    Funcionario_id: TCurrencyEdit;
    btnFuncionario: TSpeedButton;
    Status_os: TCheckBox;
    Terminal_Garcom: TCheckBox;
    QFuncionario: TFDQuery;
    IQuery: TFDQuery;
    QTabela: TFDQuery;
    RECEBIMENTO_PDV: TCheckBox;
    GERENCIAR_NFCE: TCheckBox;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    Label6: TLabel;
    acrescimo_max_item: TRxCalcEdit;
    acrescimo_max_subtotal: TRxCalcEdit;
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
    procedure OPERADOR_IDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DESCONTO_MAX_ITEMKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnFuncionarioClick(Sender: TObject);
    procedure Funcionario_idExit(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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
    procedure DetailSearch(Tabela:String);
    function Validacao: Boolean;

  end;

var
  FrmOperadores: TFrmOperadores;
  Operacao, ID: String;

  Procedure Cadastra_Operador(Nome:String);

implementation

uses
  UPrincipal, UData,UConsulta;

{$R *.dfm}

procedure Cadastra_Operador(Nome: String);
begin
  Application.CreateForm(TFrmOperadores, FrmOperadores);
  try

    FrmOperadores.IQuery.SQL.Clear;
    FrmOperadores.IQuery.SQL.Add('SELECT * FROM OPERADORES WHERE NOME LIKE :NOME');
    FrmOperadores.IQuery.ParamByName('NOME').AsString :=  Copy(Nome,1,19) + '%' ;
    FrmOperadores.IQuery.prepare;
    FrmOperadores.IQuery.Open;

    if FrmOperadores.IQuery.IsEmpty then
    Begin
    Application.MessageBox('Favor efetuar o cadastro do Operador.', PChar(Msg_Title), MB_ICONINFORMATION);
    FrmOperadores.btnInsertClick(FrmOperadores.btnInsert);
    FrmOperadores.NOME.Text := Copy(Nome,1,20);
    FrmOperadores.NOME.Enabled := False;
    FrmOperadores.Manutencao.Show;
    End
    Else
    Begin
    FrmOperadores.QTabela.Close;
    FrmOperadores.QTabela.Sql.Clear;
    FrmOperadores.QTabela.Sql.Add('SELECT * FROM OPERADORES WHERE NOME LIKE :NOME');
    FrmOperadores.QTabela.ParamByName('NOME').AsString := Copy(Nome,1,19) + '%' ;
    FrmOperadores.QTabela.Prepare;
    FrmOperadores.QTabela.Open;
    FrmOperadores.Consulta.Show;
    End;

  finally
   // FrmOperadores.Release;
  end;
end;



procedure TFrmOperadores.Botoes_Editing;
begin
  btnPrior.Enabled   := False;
  btnNext.Enabled    := False;
  btnInsert.Enabled  := False;
  btnEdit.Enabled    := False;
  btnDelete.Enabled  := False;
  btnSave.Enabled    := True;
  btnDiscard.Enabled := True;
  btnRetorna.Enabled := False;
  btnFuncionario.Enabled := True;
end;

procedure TFrmOperadores.Botoes_Normal;
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
  btnFuncionario.Enabled := True;

  if not QTabela.IsEmpty then
  begin
    btnEdit.Enabled   := True;
    btnDelete.Enabled := True;
  end
  else
  begin
    btnEdit.Enabled   := False;
    btnDelete.Enabled := False;

  end;

  btnSave.Enabled    := False;
  btnDiscard.Enabled := False;
  btnFuncionario.Enabled := False;
  btnRetorna.Enabled := True;
end;

procedure TFrmOperadores.Habilitar(Status: Boolean);
var
I: Integer;
Temp: TComponent;
begin
  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
      TEdit(Temp).Enabled := Status;

    if Temp is TRxCalcEdit then
      TRxCalcEdit(Temp).Enabled := Status;

    if Temp is TCheckBox then
      TCheckBox(Temp).Enabled := Status;
  end;
end;

procedure TFrmOperadores.DetailSearch(Tabela: String);
begin
if ((Tabela = '') or (Tabela = 'Funcionario')) and (FUNCIONARIO_ID.Text <> '') then
  begin
    QFuncionario.Close;
    QFuncionario.ParamByName('FUNCIONARIO_ID').AsInteger := StrToInt(FUNCIONARIO_ID.Text);
    QFuncionario.Prepare;
    QFuncionario.Open;
  end;
end;


procedure TFrmOperadores.Insert;
var
I: Integer;
Temp: TComponent;
Sql, Par: String;
begin
  Sql := 'INSERT INTO OPERADORES(';
  Par := '';

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
    begin
      if Sql = 'INSERT INTO OPERADORES(' then
        Sql := Sql + TEdit(Temp).Name
      else
        Sql := Sql + ', ' + TEdit(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TEdit(Temp).Name
      else
        Par := Par + ', :' + TEdit(Temp).Name;
    end;

    if Temp is TRxCalcEdit then
    begin
      if Sql = 'INSERT INTO OPERADORES(' then
        Sql := Sql + TRxCalcEdit(Temp).Name
      else
        Sql := Sql + ', ' + TRxCalcEdit(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TRxcalcEdit(Temp).Name
      else
        Par := Par + ', :' + TRxCalcEdit(Temp).Name;
    end;

    if Temp is TCurrencyEdit then
    begin
      if Sql = 'INSERT INTO OPERADORES(' then
        Sql := Sql + TCurrencyEdit(Temp).Name
      else
        Sql := Sql + ', ' + TCurrencyEdit(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TCurrencyEdit(Temp).Name
      else
        Par := Par + ', :' + TCurrencyEdit(Temp).Name;
    end;


    if Temp is TCheckBox then
    begin
      if Sql = 'INSERT INTO OPERADORES(' then
        Sql := Sql + TCheckBox(Temp).Name
      else
        Sql := Sql + ', ' + TCheckBox(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TCheckBox(Temp).Name
      else
        Par := Par + ', :' + TCheckBox(Temp).Name;
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

    if Temp is TRxCalcEdit then
      IQuery.ParamByName(TRxcalcEdit(Temp).Name).AsFloat := TRxCalcEdit(Temp).Value;

    if Temp is TCurrencyEdit then
      IQuery.ParamByName(TRxcalcEdit(Temp).Name).AsFloat := TCurrencyEdit(Temp).Value;

    if Temp is TCheckBox then
    begin
      if TCheckBox(Temp).Checked then
        IQuery.ParamByName(TCheckBox(Temp).Name).AsString := 'True'
      else
        IQuery.ParamByName(TCheckBox(Temp).Name).AsString := 'False';
    end;
  end;

  IQuery.Prepare;
  IQuery.ExecSql;



  Habilitar(False);
end;

procedure TFrmOperadores.DESCONTO_MAX_ITEMKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmOperadores.Edit;
var
I: Integer;
Temp: TComponent;
Sql: String;
begin
  Sql := 'UPDATE OPERADORES SET ';

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
    begin
      if Sql = 'UPDATE OPERADORES SET ' then
        Sql := Sql + TEdit(Temp).Name + ' = :' + TEdit(Temp).Name
      else
        Sql := Sql + ', ' + TEdit(Temp).Name + ' = :' + TEdit(Temp).Name;
    end;

    if Temp is TRxCalcEdit then
    begin
      if Sql = 'UPDATE OPERADORES SET ' then
        Sql := Sql + TRxcalcEdit(Temp).Name + ' = :' + TRxcalcEdit(Temp).Name
      else
        Sql := Sql + ', ' + TRxcalcEdit(Temp).Name + ' = :' + TRxcalcEdit(Temp).Name;
    end;


    if Temp is TCurrencyEdit then
    begin
      if Sql = 'UPDATE OPERADORES SET ' then
        Sql := Sql + TCurrencyEdit(Temp).Name + ' = :' + TCurrencyEdit(Temp).Name
      else
        Sql := Sql + ', ' + TCurrencyEdit(Temp).Name + ' = :' + TCurrencyEdit(Temp).Name;
    end;

    if Temp is TCheckBox then
    begin
      if Sql = 'UPDATE OPERADORES SET ' then
        Sql := Sql + TCheckBox(Temp).Name + ' = :' + TCheckBox(Temp).Name
      else
        Sql := Sql + ', ' + TCheckBox(Temp).Name + ' = :' + TCheckBox(Temp).Name;
    end;
  end;

  Sql := Sql + ' WHERE (OPERADOR_ID = :ID)';

  
  IQuery.Sql.Clear;
  IQuery.Sql.Add(Sql);

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];
    if Temp is TEdit then
      IQuery.ParamByName(TEdit(Temp).Name).AsString := TEdit(Temp).Text;

    if Temp is TRxcalcEdit then
      IQuery.ParamByName(TRxcalcEdit(Temp).Name).AsFloat := TRxCalcEdit(Temp).Value;

     if Temp is TCurrencyEdit then
      IQuery.ParamByName(TCurrencyEdit(Temp).Name).AsFloat := TCurrencyEdit(Temp).Value;

    if Temp is TCheckBox then
    begin
      if TCheckBox(Temp).Checked then
        IQuery.ParamByName(TCheckBox(Temp).Name).AsString := 'True'
      else
        IQuery.ParamByName(TCheckBox(Temp).Name).AsString := 'False';
    end;
  end;

  IQuery.ParamByName('ID').AsString := QTabela.FieldByName('OPERADOR_ID').AsString;

  IQuery.Prepare;
  IQuery.ExecSql;



  QTabela.Close;

  QTabela.Prepare;
  QTabela.Open;

  QTabela.Locate('OPERADOR_ID', ID, [loCaseInsensitive]);
  Habilitar(False);
end;

function TFrmOperadores.Validacao: Boolean;
var
Int_Val: Integer;
begin
  Result := False;

  OPERADOR_ID.Color := clWindow;
  NOME.Color        := clWindow;

  if OPERADOR_ID.Text = '' then
  begin
    Application.MessageBox('Informe o Código', PChar(Msg_Title), mb_IconStop);

    OPERADOR_ID.Color := clYellow;
    OPERADOR_ID.SetFocus;

    exit;
  end;

  try
    Int_Val := StrToInt(StrZero(OPERADOR_ID.Text,14,0));
  except
    Application.MessageBox('Código do operador precisa ser um número inteiro válido', PChar(Msg_Title), mb_IconStop);

    OPERADOR_ID.Color := clYellow;
    OPERADOR_ID.SetFocus;

    exit;
  end;

  if NOME.Text = '' then
  begin
    Application.MessageBox('Informe o Nome', PChar(Msg_Title), mb_IconStop);

    NOME.Color := clYellow;
    NOME.SetFocus;

    exit;
  end;

  IF QFuncionario.IsEmpty Then
  Begin
    Application.MessageBox('Funcionário não cadastrado favor inserir um funcionário cadastrado no sistema.', PChar(Msg_Title), mb_IconStop);

    Nome.Color := clYellow;
    BtnFuncionario.Click;
    exit;

  End;

  Result := True;
end;

procedure TFrmOperadores.ManutencaoShow(Sender: TObject);
begin
  Set_Campos(False);
  Botoes_Normal;
end;

procedure TFrmOperadores.Set_Campos(Vazio: Boolean);
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

      if Temp is TRxCalcEdit then
        TRxcalcEdit(Temp).Value := 0;

      if Temp is TCurrencyEdit then
        TCurrencyEdit(Temp).Value := 0;

      if Temp is TCheckBox then
        TCheckBox(Temp).Checked := False;
    end
    else
    begin
      if Temp is TEdit then
        TEdit(Temp).Text := QTabela.FieldByName(TEdit(Temp).Name).AsString;

      if Temp is TCurrencyEdit then
        TCurrencyEdit(Temp).Value := QTabela.FieldByName(TCurrencyEdit(Temp).Name).AsFloat;

      if Temp is TRxCalcEdit then
        TRxCalcEdit(Temp).Value := QTabela.FieldByName(TRxcalcEdit(Temp).Name).AsFloat;

      if Temp is TCheckBox then
        TCheckBox(Temp).Checked := QTabela.FieldByName(TCheckBox(Temp).Name).AsBoolean;


    end;
  end;
end;

procedure TFrmOperadores.btnDeleteClick(Sender: TObject);
begin
  if FrmData.QAcesso.FieldByName('EXCLUSAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para exclusão', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  if Application.MessageBox('Deseja realmente excluir?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = IDYES then
  begin
    

    IQuery.Sql.Clear;
    IQuery.Sql.Add('DELETE FROM OPERADORES');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(OPERADOR_ID = :ID)');

    IQuery.ParamByName('ID').AsString := QTabela.FieldByName('OPERADOR_ID').AsString;

    IQuery.Prepare;
    IQuery.ExecSql;



    QTabela.Close;

    QTabela.Prepare;
    QTabela.Open;

    Set_Campos(False);
    Botoes_Normal
  end;
end;

procedure TFrmOperadores.btnDiscardClick(Sender: TObject);
begin
  Botoes_Normal;
  Set_Campos(False);
  Habilitar(False);
  Operacao := '';
  Consulta.TabVisible := TRue;
end;

procedure TFrmOperadores.btnEditClick(Sender: TObject);
begin
  if FrmData.QAcesso.FieldByName('ALTERACAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para alteração', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  Operacao := 'Alterando';
  ID := QTabela.FieldByName('OPERADOR_ID').AsString;
  Botoes_Editing;
  Habilitar(True);
  Nome.Enabled := False;

  Consulta.TabVisible := False;

  OPERADOR_ID.SetFocus;
end;

procedure TFrmOperadores.btnFuncionarioClick(Sender: TObject);
begin
  try
    FUNCIONARIO_ID.Value := GetConsulta('PESSOAL', 0, 0, StrToInt(FUNCIONARIO_ID.Text));
  except
    FUNCIONARIO_ID.Value := GetConsulta('PESSOAL', 0, 0, 0);
  end;

  Funcionario_idExit(Funcionario_id);
  Nome.Text := Copy(QFuncionario.FieldByName('NOME').AsString,1,20);
end;

procedure TFrmOperadores.btnInsertClick(Sender: TObject);
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

  OPERADOR_ID.SetFocus;
end;

procedure TFrmOperadores.btnNextClick(Sender: TObject);
begin
  if not QTabela.Eof then
  begin
    QTabela.Next;
    Set_Campos(False);
  end;

  Botoes_Normal;
end;

procedure TFrmOperadores.btnPriorClick(Sender: TObject);
begin
  if not QTabela.Bof then
  begin
    QTabela.Prior;
    Set_Campos(False);
  end;

  Botoes_Normal;
end;

procedure TFrmOperadores.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmOperadores.btnSaveClick(Sender: TObject);
begin
  DetailSearch('');

  OPERADOR_ID.Text        := StrZero(OPERADOR_ID.Text, 14, 0);
  ENTRADA_SISTEMA.Checked := True;

  if Validacao then
  begin
    if Operacao = 'Inserindo' then
    begin
      Insert;

      CmdSelectNull := 'WHERE (NOME = :NOME)';
      CmdOrderBy    := 'ORDER BY OPERADOR_ID';

      QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

      QTabela.ParamByName('NOME').AsString := NOME.Text;

      QTabela.Prepare;
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

procedure TFrmOperadores.DBGrid1DblClick(Sender: TObject);
begin
  Manutencao.Show;
end;

procedure TFrmOperadores.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
VAR
ID_OPERADOR : INTEGER;
begin

  if (Key = Vk_F3) and (QTabela.FieldByName('STATUS').AsString = 'A') then
  begin
    ID_OPERADOR := QTabela.FieldByName('FUNCIONARIO_ID').AsInteger;


    IQuery.Sql.Clear;
    IQuery.Sql.Add('UPDATE OPERADORES SET STATUS = :STATUS');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(FUNCIONARIO_ID = :FUNCIONARIO_ID)');
    IQuery.ParamByName('STATUS').AsString := 'D';
    IQuery.ParamByName('FUNCIONARIO_ID').AsInteger := QTabela.FieldByName('FUNCIONARIO_ID').AsInteger;
    IQuery.Prepare;
    IQuery.ExecSql;


    QTabela.Close;
    QTabela.Open;
    QTabela.Locate('FUNCIONARIO_ID', ID_OPERADOR, [loCaseInsensitive]);
  end;
  if (Key = Vk_F4) and (QTabela.FieldByName('STATUS').AsString = 'D') then
  begin
    ID_OPERADOR := QTabela.FieldByName('FUNCIONARIO_ID').AsInteger;



    IQuery.Sql.Clear;
    IQuery.Sql.Add('UPDATE OPERADORES SET STATUS = :STATUS');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(FUNCIONARIO_ID = :FUNCIONARIO_ID)');
    IQuery.ParamByName('STATUS').AsString := 'A';
    IQuery.ParamByName('FUNCIONARIO_ID').AsInteger := QTabela.FieldByName('FUNCIONARIO_ID').AsInteger;
    IQuery.Prepare;
    IQuery.ExecSql;


    QTabela.Close;
    QTabela.Open;
    QTabela.Locate('FUNCIONARIO_ID', ID_OPERADOR, [loCaseInsensitive]);
  end;

end;

procedure TFrmOperadores.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Manutencao.Show;
end;

procedure TFrmOperadores.DBGrid1TitleClick(Column: TColumn);
begin
  CmdOrderBy := 'ORDER BY ' + Column.FieldName;
  
  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

  QTabela.Prepare;
  QTabela.Open;
end;

procedure TFrmOperadores.OPERADOR_IDKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmOperadores.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmOperadores.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (Operacao = 'Inserindo') or (Operacao = 'Alterando') then
  begin
    Application.MessageBox('É melhor salvar as alterações antes de continuar', PChar(Msg_Title), mb_IconStop);
    CanClose := False;
  end;
end;

procedure TFrmOperadores.FormCreate(Sender: TObject);
begin
  DBGrid1.Columns[0].Width := 251;
  DBGrid1.Columns[1].Width := 84;
  DBGrid1.Columns[2].Width := 84;
  DBGrid1.Columns[3].Width := 84;
  DBGrid1.Columns[4].Width := 84;
  DBGrid1.Columns[5].Width := 84;

  CmdSelect     := QTabela.Sql.Text;
  CmdSelectNull := 'WHERE (OPERADOR_ID IS NOT NULL)';
  CmdOrderBy    := 'ORDER BY NOME';
  
  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

  QTabela.Prepare;
  QTabela.Open;


  if FrmPrincipal.Config.FieldByName('OBJETO_ORDEM').AsString = 'SoftBeer'  then
  Terminal_garcom.Visible := True
  Else
  Terminal_Garcom.Visible := False;

  Consulta.Show;

end;

procedure TFrmOperadores.FormShow(Sender: TObject);
begin
 // DBGrid1.SetFocus;
end;

procedure TFrmOperadores.Funcionario_idExit(Sender: TObject);
begin
DetailSearch('Funcionario');
end;

end.
