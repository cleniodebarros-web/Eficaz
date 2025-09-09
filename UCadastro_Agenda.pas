unit UCadastro_Agenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ComCtrls, ToolWin, StdCtrls, Grids, DBGrids, Tabs, ExtCtrls,
  DB, IBCustomDataSet, IBQuery, Mask, rxToolEdit, Buttons, rxCurrEdit, DBCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmCadastro_Agenda = class(TForm)
    Panel1: TPanel;
    DataTabela: TDataSource;
    btnRetorna: TBitBtn;
    DataProfissional: TDataSource;
    QTabela: TFDQuery;
    IQuery: TFDQuery;
    QEmpresa: TFDQuery;
    QCliente: TFDQuery;
    QProfissional: TFDQuery;
    Panel3: TPanel;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    btnSave: TBitBtn;
    btnDiscard: TBitBtn;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label26: TLabel;
    Label25: TLabel;
    Label2: TLabel;
    Colors: TColorBox;
    SERVICO: TComboBox;
    FUNCIONARIO_ID: TCurrencyEdit;
    TRATAMENTO: TEdit;
    CLIENTE_ID: TCurrencyEdit;
    dt_agenda: TDateEdit;
    Label6: TLabel;
    HORA: TMaskEdit;
    Label5: TLabel;
    HORA_FIM: TMaskEdit;
    DBText6: TDBText;
    btnVendedor: TSpeedButton;
    btnCliente: TSpeedButton;
    Coluna: TCurrencyEdit;
    QId_Func: TFDQuery;
    Label24: TLabel;
    VR_SERVICO: TRxCalcEdit;
    SERVICO_ID: TCurrencyEdit;
    Label7: TLabel;
    Telefone: TEdit;
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
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EMPRESA_IDExit(Sender: TObject);
    procedure EMPRESA_IDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnPesquisaClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DESCRICAOKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure NUM_BANCOChange(Sender: TObject);
    procedure FUNCIONARIO_IDExit(Sender: TObject);
    procedure CLIENTE_IDExit(Sender: TObject);
    procedure btnClienteClick(Sender: TObject);
    procedure btnVendedorClick(Sender: TObject);
    procedure SERVICOExit(Sender: TObject);
    procedure SERVICOChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CmdSelect: String;
    CmdOrderBy: String;
    CmdSelectNull: String;
    procedure Botoes_Editing;
    procedure Botoes_Normal;
    procedure DetailSearch(Tabela: String);
    procedure Habilitar(Status: Boolean);
    procedure Insert(hora_insert:String);
    procedure Set_Campos(Vazio: Boolean);
    procedure Edit;
    function Validacao: Boolean;
  end;

Const
Intervalo = '00:30:00';

var
  FrmCadastro_Agenda: TFrmCadastro_Agenda;
  Operacao,dt_ag,h_inicio,h_fim,apelido_func: String;
  ID,tipo,Profissional: Integer;
  Hora_Loop:ttime;
  procedure Cadastro_Agenda(Tp: Integer;Apelido, data_agenda, hora_inicio,hora_fim : String);


implementation

uses
  UPrincipal, UData, UConsulta, UPesquisa;

{$R *.dfm}

procedure Cadastro_Agenda(Tp: Integer; Apelido, data_agenda, hora_inicio,hora_fim : String);
begin
  Tipo         := Tp;
  dt_ag        := data_agenda;
  h_inicio     := hora_inicio;
  h_fim        := hora_fim;
  Apelido_Func := Apelido;

  Application.CreateForm(TFrmCadastro_Agenda, FrmCadastro_Agenda);
  try
    FrmCadastro_agenda.ShowModal;
  finally
    FrmCadastro_agenda.Release;
  end;
end;


procedure TFrmCadastro_Agenda.Botoes_Editing;
bEGIN
  btnEdit.Enabled     := False;
  btnDelete.Enabled   := False;
  btnSave.Enabled     := True;
  btnDiscard.Enabled  := True;
  btnRetorna.Enabled  := False;

end;

procedure TFrmCadastro_Agenda.Botoes_Normal;
begin

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

  btnSave.Enabled     := False;
  btnDiscard.Enabled  := False;
  btnRetorna.Enabled  := True;


end;

procedure TFrmCadastro_Agenda.DetailSearch(Tabela: String);
begin
 if ((Tabela = '') or (Tabela = 'Cliente')) and (CLIENTE_ID.Text <> '') then
  begin
    QCliente.Close;

    QCliente.ParamByName('CLIENTE_ID').AsInteger := StrToInt(CLIENTE_ID.Text);

    QCliente.Prepare;
    QCliente.Open;

    if not QCliente.IsEmpty then
      Tratamento.Text := QCliente.FieldByName('TRATAMENTO').AsString;
  end;

  if ((Tabela = '') or (Tabela = 'Vendedor')) and (FUNCIONARIO_ID.Text <> '') then
  begin
    QProfissional.Close;

    QProfissional.ParamByName('FUNCIONARIO_ID').AsInteger := StrToInt(FUNCIONARIO_ID.Text);

    QProfissional.Prepare;
    QProfissional.Open;

    Coluna.text :=  IntToStr(QProfissional.FieldByName('POSICAO_AGENDA').AsInteger);
  end;

end;

procedure TFrmCadastro_Agenda.Habilitar(Status: Boolean);
var
I: Integer;
Temp: TComponent;
begin
  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
      TEdit(Temp).Enabled := Status;

    if Temp is TDateEdit then
      TDateEdit(Temp).Enabled := Status;

    if Temp is TComboBox then
      TComboBox(Temp).Enabled := Status;

    if Temp is TCurrencyEdit then
      TCurrencyEdit(Temp).Enabled := Status;

    if Temp is TRxCalcEdit then
      TRxCalcEdit(Temp).Enabled := Status;

    if Temp is TColorBox then
      TColorBox(Temp).Enabled := Status;
  end;
end;

procedure TFrmCadastro_Agenda.Insert(hora_Insert:String);
var
I: Integer;
Temp: TComponent;
Sql, Par,hora_inicio: String;
begin

   hora_inicio := hora_insert;

  Sql := 'INSERT INTO AGENDA(';
  Par := '';

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
    begin
      if Sql = 'INSERT INTO AGENDA(' then
        Sql := Sql + TEdit(Temp).Name
      else
        Sql := Sql + ', ' + TEdit(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TEdit(Temp).Name
      else
        Par := Par + ', :' + TEdit(Temp).Name;
    end;

    if (Temp is TDateEdit) AND (TDateEdit(Temp).Text <> '  /  /    ')  then
    begin
      if Sql = 'INSERT INTO AGENDA(' then
        Sql := Sql + TDateEdit(Temp).Name
      else
        Sql := Sql + ', ' + TDateEdit(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TDateEdit(Temp).Name
      else
        Par := Par + ', :' + TDateEdit(Temp).Name;
    end;


    if Temp is TComboBox then
    begin
      if Sql = 'INSERT INTO AGENDA(' then
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
      if Sql = 'INSERT INTO AGENDA(' then
        Sql := Sql + TCurrencyEdit(Temp).Name
      else
        Sql := Sql + ', ' + TCurrencyEdit(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TCurrencyEdit(Temp).Name
      else
        Par := Par + ', :' + TCurrencyEdit(Temp).Name;
    end;

    if Temp is TRxCalcEdit then
    begin
      if Sql = 'INSERT INTO AGENDA(' then
        Sql := Sql + TRxCalcEdit(Temp).Name
      else
        Sql := Sql + ', ' + TRxCalcEdit(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TRxCalcEdit(Temp).Name
      else
        Par := Par + ', :' + TRxCalcEdit(Temp).Name;
    end;
     if Temp is TColorBox then
    begin
      if Sql = 'INSERT INTO AGENDA(' then
        Sql := Sql + TRxCalcEdit(Temp).Name
      else
        Sql := Sql + ', ' + TColorBox(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TColorBox(Temp).Name
      else
        Par := Par + ', :' + TColorBox(Temp).Name;
    end;

    if Temp is TMaskEdit then
    begin
      if Sql = 'INSERT INTO AGENDA(' then
        Sql := Sql + TMaskEdit(Temp).Name
      else
        Sql := Sql + ', ' + TMaskEdit(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TMaskEdit(Temp).Name
      else
        Par := Par + ', :' + TMaskEdit(Temp).Name;
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

    if Temp is TRxCalcEdit then
      IQuery.ParamByName(TRxCalcEdit(Temp).Name).AsFloat := TRxCalcEdit(Temp).Value;

    if Temp is TColorBox then
      IQuery.ParamByName(TColorBox(Temp).Name).AsString := ColorToString(TColorBox(Temp).Selected);

    if Temp is TDateEdit then
      IQuery.ParamByName(TDateEdit(Temp).Name).AsDateTime := TDateEdit(Temp).Date;

    if Temp is TMaskEdit then

    if TMaskEdit(Temp).Name = 'HORA' Then
      IQuery.ParamByName(TMaskEdit(Temp).Name).AsString := hora_inicio
    Else
      IQuery.ParamByName(TMaskEdit(Temp).Name).AsString := TMaskEdit(Temp).Text;
  end;

  IQuery.Prepare;
  IQuery.ExecSql;

  Habilitar(False);
end;

procedure TFrmCadastro_Agenda.Edit;
var
I: Integer;
Temp: TComponent;
Sql: String;
begin
  Sql := 'UPDATE AGENDA SET ';

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
    begin
      if Sql = 'UPDATE AGENDA SET ' then
        Sql := Sql + TEdit(Temp).Name + ' = :' + TEdit(Temp).Name
      else
        Sql := Sql + ', ' + TEdit(Temp).Name + ' = :' + TEdit(Temp).Name;
    end;

    if (Temp is TDateEdit) AND (TDateEdit(Temp).Text <> '  /  /    ')  then
    begin
      if Sql = 'UPDATE AGENDA SET ' then
        Sql := Sql + TDateEdit(Temp).Name + ' = :' + TDateEdit(Temp).Name
      else
        Sql := Sql + ', ' + TDateEdit(Temp).Name + ' = :' + TDateEdit(Temp).Name;
    end;

    if Temp is TComboBox then
    begin
      if Sql = 'UPDATE AGENDA SET ' then
        Sql := Sql + TComboBox(Temp).Name + ' = :' + TComboBox(Temp).Name
      else
        Sql := Sql + ', ' + TComboBox(Temp).Name + ' = :' + TComboBox(Temp).Name;
    end;

    if Temp is TCurrencyEdit then
    begin
      if Sql = 'UPDATE AGENDA SET ' then
        Sql := Sql + TCurrencyEdit(Temp).Name + ' = :' + TCurrencyEdit(Temp).Name
      else
        Sql := Sql + ', ' + TCurrencyEdit(Temp).Name + ' = :' + TCurrencyEdit(Temp).Name;
    end;

    if Temp is TRxCalcEdit then
    begin
      if Sql = 'UPDATE AGENDA SET ' then
        Sql := Sql + TRxCalcEdit(Temp).Name + ' = :' + TRxCalcEdit(Temp).Name
      else
        Sql := Sql + ', ' + TRxCalcEdit(Temp).Name + ' = :' + TRxCalcEdit(Temp).Name;
    end;


    if Temp is TColorBox then
    begin
      if Sql = 'UPDATE AGENDA SET ' then
        Sql := Sql + TColorBox(Temp).Name + ' = :' + TColorBox(Temp).Name
      else
        Sql := Sql + ', ' + TColorBox(Temp).Name + ' = :' + TColorBox(Temp).Name;
    end;

    if Temp is TMaskEdit then
    begin
      if Sql = 'UPDATE AGENDA SET ' then
        Sql := Sql + TMaskEdit(Temp).Name + ' = :' + TMaskEdit(Temp).Name
      else
        Sql := Sql + ', ' + TMaskEdit(Temp).Name + ' = :' + TMaskEdit(Temp).Name;
    end;


  end;

  Sql := Sql + ' WHERE (AGENDA_ID = :ID)';

  

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

    if Temp is TRxCalcEdit then
      IQuery.ParamByName(TRxCalcEdit(Temp).Name).AsFloat := TRxCalcEdit(Temp).Value;

    if Temp is TColorBox then
      IQuery.ParamByName(TColorBox(Temp).Name).AsString := ColorToString(TColorBox(Temp).Selected );

    if Temp is TDateEdit then
      IQuery.ParamByName(TDateEdit(Temp).Name).AsDateTime := TDateEdit(Temp).Date;

    if Temp is TMaskEdit then
      IQuery.ParamByName(TMaskEdit(Temp).Name).AsString := TMaskEdit(Temp).Text;

  end;

  IQuery.ParamByName('ID').AsInteger := QTabela.FieldByName('AGENDA_ID').AsInteger;

  IQuery.Prepare;
  IQuery.ExecSql;

  QTabela.Close;
  QTabela.Open;
  QTabela.Locate('AGENDA_ID', ID, [loCaseInsensitive]);
  Habilitar(False);
end;

procedure TFrmCadastro_Agenda.EMPRESA_IDExit(Sender: TObject);
begin
  DetailSearch('Empresa');
end;

procedure TFrmCadastro_Agenda.EMPRESA_IDKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if (Key = Vk_F7) and (Sender = Cliente_ID) then
    btnClienteClick(Self);

  if (Key = Vk_F7) and (Sender = FUNCIONARIO_ID) then
    btnVendedorClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

function TFrmCadastro_Agenda.Validacao: Boolean;
begin
  Result := False;

  if Tratamento.Text = '' then
  begin
    Application.MessageBox('Informe o Nome do Cliente', PChar(Msg_Title), mb_IconStop);
    Tratamento.Color := clYellow;
    Tratamento.SetFocus;
    exit;
  end;


  Result := True;
end;

procedure TFrmCadastro_Agenda.ManutencaoShow(Sender: TObject);
begin
  Set_Campos(False);
  Botoes_Normal;
end;

procedure TFrmCadastro_Agenda.NUM_BANCOChange(Sender: TObject);
begin
  try

  except

  end;
end;

procedure TFrmCadastro_Agenda.SERVICOChange(Sender: TObject);
begin
 IQuery.Sql.Text := 'SELECT  SERVICO_ID, PRECO FROM SERVICOS WHERE DESCRICAO  = :DESCRICAO';
 IQuery.ParamByName('DESCRICAO').AsString := Servico.Text;
 IQuery.Prepare;
 IQuery.Open;

 Vr_Servico.Value := IQuery.FieldByname('PRECO').AsFloat;
 Servico_ID.Text :=  IntToStr(IQuery.FieldByName('SERVICO_ID').AsInteger);


end;

procedure TFrmCadastro_Agenda.SERVICOExit(Sender: TObject);
begin
 IQuery.Sql.Text := 'SELECT  SERVICO_ID, PRECO FROM SERVICOS WHERE DESCRICAO  = :DESCRICAO';
 IQuery.ParamByName('DESCRICAO').AsString := Servico.Text;
 IQuery.Prepare;
 IQuery.Open;

 Vr_Servico.Value := IQuery.FieldByname('PRECO').AsFloat;
 Servico_ID.Text :=  IntToStr(IQuery.FieldByName('SERVICO_ID').AsInteger);


end;

procedure TFrmCadastro_Agenda.Set_Campos(Vazio: Boolean);
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

      if Temp is TRxCalcEdit then
        TRxCalcEdit(Temp).Value := 0;

      if Temp is TDateEdit then
        TDateEdit(Temp).Text := '';

      if Temp is TMaskEdit then
        TMaskEdit(Temp).Text := '';

    end
    else
    begin
      if Temp is TEdit then
        TEdit(Temp).Text := QTabela.FieldByName(TEdit(Temp).Name).AsString;

      if Temp is TComboBox then
        TComboBox(Temp).Text := QTabela.FieldByName(TComboBox(Temp).Name).AsString;

      if Temp is TCurrencyEdit then
        TCurrencyEdit(Temp).Value := QTabela.FieldByName(TCurrencyEdit(Temp).Name).AsFloat;

      if Temp is TRxCalcEdit then
        TRxCalcEdit(Temp).Value := QTabela.FieldByName(TRxCalcEdit(Temp).Name).AsFloat;

      if Temp is TColorBox then
        TColorBox(Temp).Selected := StringToColor(QTabela.FieldByName(TColorBox(Temp).Name).AsString);

      if Temp is TDateEdit then
        TDateEdit(Temp).Text := QTabela.FieldByName(TDateEdit(Temp).Name).AsString;

      if Temp is TMaskEdit then
        TMaskEdit(Temp).Text := QTabela.FieldByName(TMaskEdit(Temp).Name).AsString;

    end;
  end;
  DetailSearch('');
end;

procedure TFrmCadastro_Agenda.btnClienteClick(Sender: TObject);
begin
  try
    CLIENTE_ID.Value := GetConsulta('CLIENTES', 0, 0, StrToInt(CLIENTE_ID.Text));
  except
    CLIENTE_ID.Value := GetConsulta('CLIENTES', 0, 0, 0);
  end;
end;

procedure TFrmCadastro_Agenda.btnDeleteClick(Sender: TObject);
begin
  if FrmData.QAcesso.FieldByName('EXCLUSAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para exclusão', PChar(Msg_Title), mb_IconStop);
    exit;
 end;


  if Application.MessageBox('Deseja realmente excluir?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = IDYES then
  begin
    try
    IQuery.Sql.Clear;
    IQuery.Sql.Add('DELETE FROM AGENDA');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(AGENDA_ID = :ID)');

    IQuery.ParamByName('ID').AsInteger := QTabela.FieldByName('AGENDA_ID').AsInteger;

    IQuery.Prepare;
    IQuery.ExecSql;

    QTabela.Close;

    Habilitar(False);
    Operacao := '';
    Close;
    Except

    end;

  end;

 // if QTabela.IsEmpty then
 //   QEmpresa.Close;
end;

procedure TFrmCadastro_Agenda.btnDiscardClick(Sender: TObject);
begin
  //Botoes_Normal;
  //Set_Campos(False);


  Habilitar(False);
  Operacao := '';
  Close;

end;

procedure TFrmCadastro_Agenda.btnEditClick(Sender: TObject);
begin
  if FrmData.QAcesso.FieldByName('ALTERACAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para alteração', PChar(Msg_Title), mb_IconStop);
    exit;
  end;


  Operacao := 'Alterando';
  ID := QTabela.FieldByName('AGENDA_ID').AsInteger;
  Botoes_Editing;
  Habilitar(True);

end;

procedure TFrmCadastro_Agenda.btnInsertClick(Sender: TObject);
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

  QEmpresa.Close;


end;

procedure TFrmCadastro_Agenda.btnNextClick(Sender: TObject);
begin
  if not QTabela.Eof then
  begin
    QTabela.Next;
    Set_Campos(False);
  end;
  Botoes_Normal;
end;

procedure TFrmCadastro_Agenda.btnPesquisaClick(Sender: TObject);
var
Condicao: String;
begin
  Condicao := GetPesquisa('BANCOS');

  if Condicao <> '' then
  begin
    if FrmPrincipal.Config.FieldByName('VER_DESATIVADOS').AsString = 'True' then
      CmdSelectNull := Condicao
    else
      CmdSelectNull := Condicao + ' AND (STATUS = ' + #39 + 'A' + #39 + ')';
  end;

  CmdOrderBy := 'ORDER BY BANCO_ID';

  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

  QTabela.Prepare;
  QTabela.Open;

  Set_Campos(False);
  Botoes_Normal;
end;

procedure TFrmCadastro_Agenda.btnPriorClick(Sender: TObject);
begin
  if not QTabela.Bof then
  begin
    QTabela.Prior;
    Set_Campos(False);
  end;
  Botoes_Normal;
end;

procedure TFrmCadastro_Agenda.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadastro_Agenda.btnSaveClick(Sender: TObject);
begin
  DetailSearch('');

  if Validacao then
  begin
    if Operacao = 'Inserindo' then
    begin

      Hora_loop := StrToTime(hora.Text);

     while Hora_loop <= StrToTime( Hora_FIM.Text ) do
     begin

      Insert(Copy(TimeToStr(Hora_loop),1,5));

      Hora_loop := Hora_loop + StrToTime(INTERVALO);
     end;


      CmdSelectNull := 'WHERE (TRATAMENTO = :TRATAMENTO)';
      CmdOrderBy    := 'ORDER BY  AGENDA_ID';

      QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

      QTabela.ParamByName('TRATAMENTO').AsString := Tratamento.Text;

      QTabela.Open;
      QTabela.Last;
    end
    else
      Edit;


    Habilitar(False);
    Botoes_Normal;

    Operacao := '';

  end;
end;

procedure TFrmCadastro_Agenda.btnVendedorClick(Sender: TObject);
begin
 try
    FUNCIONARIO_ID.Value := GetConsulta('PESSOAL', 0, 0, StrToInt(FUNCIONARIO_ID.Text));
  except
    FUNCIONARIO_ID.Value := GetConsulta('PESSOAL', 0, 0, 0);
  end;
end;

procedure TFrmCadastro_Agenda.CLIENTE_IDExit(Sender: TObject);
begin
 DetailSearch('Cliente');
end;

procedure TFrmCadastro_Agenda.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F3) and (QTabela.FieldByName('STATUS').AsString = 'A') then
  begin
    ID := QTabela.FieldByName('BANCO_ID').AsInteger;


    IQuery.Sql.Clear;
    IQuery.Sql.Add('UPDATE BANCOS SET STATUS = :STATUS');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(BANCO_ID = :BANCO_ID)');
    IQuery.ParamByName('STATUS').AsString := 'D';
    IQuery.ParamByName('BANCO_ID').AsInteger := QTabela.FieldByName('BANCO_ID').AsInteger;
    IQuery.Prepare;
    IQuery.ExecSql;


    QTabela.Close;
    QTabela.Open;
    QTabela.Locate('BANCO_ID', ID, [loCaseInsensitive]);
  end;
  if (Key = Vk_F4) and (QTabela.FieldByName('STATUS').AsString = 'D') then
  begin
    ID := QTabela.FieldByName('BANCO_ID').AsInteger;


    IQuery.Sql.Clear;
    IQuery.Sql.Add('UPDATE BANCOS SET STATUS = :STATUS');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(BANCO_ID = :BANCO_ID)');
    IQuery.ParamByName('STATUS').AsString := 'A';
    IQuery.ParamByName('BANCO_ID').AsInteger := QTabela.FieldByName('BANCO_ID').AsInteger;
    IQuery.Prepare;
    IQuery.ExecSql;


    QTabela.Close;
    QTabela.Open;
    QTabela.Locate('BANCO_ID', ID, [loCaseInsensitive]);
  end;
end;

procedure TFrmCadastro_Agenda.DBGrid1TitleClick(Column: TColumn);
begin
  CmdOrderBy := 'ORDER BY ' + Column.FieldName;
  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;
  QTabela.Open;
end;

procedure TFrmCadastro_Agenda.DESCRICAOKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmCadastro_Agenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmCadastro_Agenda.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (Operacao = 'Inserindo') or (Operacao = 'Alterando') then
  begin
    Application.MessageBox('É melhor salvar as alterações antes de continuar', PChar(Msg_Title), mb_IconStop);
    CanClose := False;
  end;
end;

procedure TFrmCadastro_Agenda.FormCreate(Sender: TObject);
begin

  if tipo = 1 Then
  Begin
    try
    CmdSelect := QTabela.Sql.Text;
    CmdSelectNull := 'WHERE (AGENDA_ID IS NOT NULL)' ;
    CmdOrderBy := 'ORDER BY HORA';

    QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;
    QTabela.Open;


    IQuery.Sql.Clear;
    IQuery.Sql.Add('SELECT DISTINCT DESCRICAO FROM SERVICOS');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(STATUS = :STATUS)');

    IQuery.ParamByName('STATUS').AsString := 'A';

    IQuery.Prepare;
    IQuery.Open;

    SERVICO.Items.Clear;

    IQuery.First;
    while not IQuery.Eof do
    begin
      SERVICO.Items.Add(Copy(IQuery.FieldByName('DESCRICAO').AsString, 1, 40));

      Application.ProcessMessages;
      IQuery.Next;
    end;


    Operacao := 'Inserindo';
    Botoes_Editing;
    Set_Campos(True);
    Habilitar(True);
    dt_agenda.Date := StrToDate(dt_ag);
    hora.text     := h_inicio;
    hora_fim.text := h_fim;

    if Profissional > 0 Then
    Begin
     Funcionario_ID.Text := IntToStr(Profissional);
     DetailSearch('Funcionario');
    End;
    except

    end;

  End;

  if tipo = 2 Then
  Begin
   try
    QId_Func.Close;
    QId_Func.ParambyName('APELIDO').AsString := Apelido_Func;
    QId_Func.prepare;
    QId_Func.Open;

    CmdSelect      := QTabela.Sql.Text;
    CmdSelectNull := 'WHERE (AGENDA_ID IS NOT NULL) AND DT_AGENDA = :DT_AGENDA AND FUNCIONARIO_ID = :FUNCIONARIO_ID AND HORA = :HORA';
    CmdOrderBy    := 'ORDER BY HORA';

    QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

    QTabela.ParamByName('FUNCIONARIO_ID').AsInteger := QId_Func.FieldByName('FUNCIONARIO_ID').AsInteger;
    QTabela.ParamByName('HORA').AsString := h_inicio;
    QTabela.ParamByName('DT_AGENDA').AsDate := StrToDate(dt_ag);
    QTabela.Prepare;

    QTabela.Open;

    IF not QTabela.IsEmpty  Then
    Begin

      IQuery.Sql.Clear;
      IQuery.Sql.Add('SELECT DISTINCT DESCRICAO FROM SERVICOS');
      IQuery.Sql.Add('WHERE');
      IQuery.Sql.Add('(STATUS = :STATUS)');

      IQuery.ParamByName('STATUS').AsString := 'A';

      IQuery.Prepare;
      IQuery.Open;

      SERVICO.Items.Clear;

      IQuery.First;
        while not IQuery.Eof do
        begin
          SERVICO.Items.Add(Copy(IQuery.FieldByName('DESCRICAO').AsString, 1, 40));

          Application.ProcessMessages;
          IQuery.Next;
        end;

      Set_Campos(False);
      Botoes_Normal;
      //Habilitar(True);
     // Operacao := 'Alterando';
     // ID := QTabela.FieldByName('AGENDA_ID').AsInteger;
     // Botoes_Normal;
      //hora.text     := h_inicio;
      //hora_fim.text := h_fim;

      if Profissional > 0 Then
      Begin
       Funcionario_ID.Text := IntToStr(Profissional);
       DetailSearch('Funcionario');
      End;
    End
    Else
    Begin
    Application.MessageBox('Agendamento não localizado.','Eficaz', MB_IconStop + MB_OK);

    End;
   except

   end;

  End;


   if tipo = 3 Then
  Begin
    Operacao := 'Alterando';
    ID := QTabela.FieldByName('AGENDA_ID').AsInteger;
    Botoes_Editing;
    Set_Campos(True);
    Habilitar(True);
   // dt_agenda.Date := StrToDate(dt_ag);
    hora.text     := h_inicio;
    hora_fim.text := h_fim;

    if Profissional > 0 Then
    Begin
     Funcionario_ID.Text := IntToStr(Profissional);
     DetailSearch('Funcionario');
    End;

  End;





end;

procedure TFrmCadastro_Agenda.FUNCIONARIO_IDExit(Sender: TObject);
begin
  DetailSearch('Vendedor');
end;

end.
