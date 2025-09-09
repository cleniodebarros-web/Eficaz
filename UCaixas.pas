unit UCaixas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ComCtrls, ToolWin, StdCtrls, Grids, DBGrids, Tabs, ExtCtrls,
  DB, IBCustomDataSet, IBQuery, Mask, rxToolEdit, Buttons, rxCurrEdit, DBCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmCaixas = class(TForm)
    PageControl1: TPageControl;
    Panel1: TPanel;
    Consulta: TTabSheet;
    Manutencao: TTabSheet;
    Alfabeto: TTabSet;
    StatusBar1: TStatusBar;
    DBGrid1: TDBGrid;
    DataTabela: TDataSource;
    DESCRICAO: TEdit;
    NOME_AGENCIA: TEdit;
    NUM_AGENCIA: TEdit;
    NUM_CONTA: TEdit;
    btnRetorna: TBitBtn;
    Panel2: TPanel;
    btnPrior: TBitBtn;
    btnNext: TBitBtn;
    btnInsert: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    btnSave: TBitBtn;
    btnDiscard: TBitBtn;
    TIPO: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    TIPO_LIMITE: TComboBox;
    EMPRESA_ID: TCurrencyEdit;
    DataEmpresa: TDataSource;
    DBText1: TDBText;
    btnEmpresa: TSpeedButton;
    LIMITE: TRxCalcEdit;
    btnPesquisa: TBitBtn;
    Label1: TLabel;
    COD_CONTABIL: TEdit;
    NUM_BANCO: TCurrencyEdit;
    DIG_BANCO: TCurrencyEdit;
    DIG_AGENCIA: TEdit;
    DIG_CONTA: TEdit;
    Label11: TLabel;
    COD_CEDENTE: TEdit;
    Label12: TLabel;
    CONV_CEDENTE: TEdit;
    Label13: TLabel;
    MOD_CEDENTE: TEdit;
    Label14: TLabel;
    NUM_RES_CEDENTE: TEdit;
    QTabela: TFDQuery;
    IQuery: TFDQuery;
    QEmpresa: TFDQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRetornaClick(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDiscardClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure ManutencaoShow(Sender: TObject);
    procedure AlfabetoClick(Sender: TObject);
    procedure btnPriorClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure EMPRESA_IDExit(Sender: TObject);
    procedure EMPRESA_IDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnPesquisaClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DESCRICAOKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnEmpresaClick(Sender: TObject);
    procedure NUM_BANCOChange(Sender: TObject);
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
    procedure Insert;
    procedure Set_Campos(Vazio: Boolean);
    procedure Edit;
    function Validacao: Boolean;
  end;

var
  FrmCaixas: TFrmCaixas;
  Operacao: String;
  ID: Integer;

implementation

uses
  UPrincipal, UData, UConsulta, UPesquisa;

{$R *.dfm}

procedure TFrmCaixas.AlfabetoClick(Sender: TObject);
begin
  if Alfabeto.TabIndex <> 26 then
  begin
    if FrmPrincipal.Config.FieldByName('VER_DESATIVADOS').AsString = 'True' then
      CmdSelectNull := 'WHERE (DESCRICAO LIKE ' + #39 + Chr(Alfabeto.TabIndex + 65) + '%' + #39 + ')'
    else
      CmdSelectNull := 'WHERE (DESCRICAO LIKE ' + #39 + Chr(Alfabeto.TabIndex + 65) + '%' + #39 + ') AND (STATUS = ' + #39 + 'A' + #39 + ')';
  end
  else
  begin
    if FrmPrincipal.Config.FieldByName('VER_DESATIVADOS').AsString = 'True' then
      CmdSelectNull := 'WHERE (BANCO_ID IS NOT NULL)'
    else
      CmdSelectNull := 'WHERE (BANCO_ID IS NOT NULL) AND (STATUS = ' + #39 + 'A' + #39 + ')';
  end;

  CmdOrderBy := 'ORDER BY DESCRICAO';
  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;
  QTabela.Open;
end;

procedure TFrmCaixas.Botoes_Editing;
begin
  btnPrior.Enabled    := False;
  btnNext.Enabled     := False;
  btnInsert.Enabled   := False;
  btnEdit.Enabled     := False;
  btnDelete.Enabled   := False;
  btnSave.Enabled     := True;
  btnDiscard.Enabled  := True;
  btnRetorna.Enabled  := False;
  btnEmpresa.Enabled  := True;
  btnPesquisa.Enabled := False;
end;

procedure TFrmCaixas.Botoes_Normal;
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

  btnSave.Enabled     := False;
  btnDiscard.Enabled  := False;
  btnRetorna.Enabled  := True;
  btnEmpresa.Enabled  := False;
  btnPesquisa.Enabled := True;
end;

procedure TFrmCaixas.DetailSearch(Tabela: String);
begin
  if ((Tabela = '') or (Tabela = 'Empresa')) and (EMPRESA_ID.Text <> '') then
  begin
    QEmpresa.Close;
    QEmpresa.ParamByName('EMPRESA_ID').AsInteger := StrToInt(EMPRESA_ID.Text);
    QEmpresa.Prepare;
    QEmpresa.Open;
  end;
end;

procedure TFrmCaixas.Habilitar(Status: Boolean);
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

    if Temp is TRxCalcEdit then
      TRxCalcEdit(Temp).Enabled := Status;
  end;
end;

procedure TFrmCaixas.Insert;
var
I: Integer;
Temp: TComponent;
Sql, Par: String;
begin
  Sql := 'INSERT INTO BANCOS(';
  Par := '';

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
    begin
      if Sql = 'INSERT INTO BANCOS(' then
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
      if Sql = 'INSERT INTO BANCOS(' then
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
      if Sql = 'INSERT INTO BANCOS(' then
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
      if Sql = 'INSERT INTO BANCOS(' then
        Sql := Sql + TRxCalcEdit(Temp).Name
      else
        Sql := Sql + ', ' + TRxCalcEdit(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TRxCalcEdit(Temp).Name
      else
        Par := Par + ', :' + TRxCalcEdit(Temp).Name;
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
  end;

  IQuery.Prepare;
  IQuery.ExecSql;

  Habilitar(False);
end;

procedure TFrmCaixas.Edit;
var
I: Integer;
Temp: TComponent;
Sql: String;
begin
  Sql := 'UPDATE BANCOS SET ';

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
    begin
      if Sql = 'UPDATE BANCOS SET ' then
        Sql := Sql + TEdit(Temp).Name + ' = :' + TEdit(Temp).Name
      else
        Sql := Sql + ', ' + TEdit(Temp).Name + ' = :' + TEdit(Temp).Name;
    end;

    if Temp is TComboBox then
    begin
      if Sql = 'UPDATE BANCOS SET ' then
        Sql := Sql + TComboBox(Temp).Name + ' = :' + TComboBox(Temp).Name
      else
        Sql := Sql + ', ' + TComboBox(Temp).Name + ' = :' + TComboBox(Temp).Name;
    end;

    if Temp is TCurrencyEdit then
    begin
      if Sql = 'UPDATE BANCOS SET ' then
        Sql := Sql + TCurrencyEdit(Temp).Name + ' = :' + TCurrencyEdit(Temp).Name
      else
        Sql := Sql + ', ' + TCurrencyEdit(Temp).Name + ' = :' + TCurrencyEdit(Temp).Name;
    end;

    if Temp is TRxCalcEdit then
    begin
      if Sql = 'UPDATE BANCOS SET ' then
        Sql := Sql + TRxCalcEdit(Temp).Name + ' = :' + TRxCalcEdit(Temp).Name
      else
        Sql := Sql + ', ' + TRxCalcEdit(Temp).Name + ' = :' + TRxCalcEdit(Temp).Name;
    end;
  end;

  Sql := Sql + ' WHERE (BANCO_ID = :ID)';

  

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
  end;

  IQuery.ParamByName('ID').AsInteger := QTabela.FieldByName('BANCO_ID').AsInteger;

  IQuery.Prepare;
  IQuery.ExecSql;

  QTabela.Close;
  QTabela.Open;
  QTabela.Locate('BANCO_ID', ID, [loCaseInsensitive]);
  Habilitar(False);
end;

procedure TFrmCaixas.EMPRESA_IDExit(Sender: TObject);
begin
  DetailSearch('Empresa');
end;

procedure TFrmCaixas.EMPRESA_IDKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = EMPRESA_ID) then
    btnEmpresaClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

function TFrmCaixas.Validacao: Boolean;
begin
  Result := False;

  DESCRICAO.Color   := clWindow;
  EMPRESA_ID.Color  := clWindow;
  TIPO.Color        := clWindow;
  TIPO_LIMITE.Color := clWindow;

  if (TIPO.Text <> 'APLICAÇÃO') and (TIPO.Text <> 'BANCO') and (TIPO.Text <> 'CAIXA') then
  begin
    Application.MessageBox('Tipo Banco inválido', PChar(Msg_Title), mb_IconStop);
    TIPO.Color := clYellow;
    TIPO.SetFocus;
    exit;
  end;

  if DESCRICAO.Text = '' then
  begin
    Application.MessageBox('Informe o Nome do Banco', PChar(Msg_Title), mb_IconStop);
    DESCRICAO.Color := clYellow;
    DESCRICAO.SetFocus;
    exit;
  end;

  if (TIPO_LIMITE.Text <> 'INCLUSO NO SALDO') and (TIPO_LIMITE.Text <> 'EXCLUSO DO SALDO') then
  begin
    Application.MessageBox('Tipo de Limite inválido', PChar(Msg_Title), mb_IconStop);
    TIPO_LIMITE.Color := clYellow;
    TIPO_LIMITE.SetFocus;
    exit;
  end;

  if QEmpresa.IsEmpty then
  begin
    Application.MessageBox('Empresa inexistente', PChar(Msg_Title), mb_IconStop);
    EMPRESA_ID.Color := clYellow;
    EMPRESA_ID.SetFocus;
    exit;
  end;

  Result := True;
end;

procedure TFrmCaixas.ManutencaoShow(Sender: TObject);
begin
  Set_Campos(False);
  Botoes_Normal;
end;

procedure TFrmCaixas.NUM_BANCOChange(Sender: TObject);
begin
  try
    if StrToInt(NUM_Banco.Text) = 1 then
      DIG_BANCO.Value := 9
    else if StrToInt(NUM_Banco.Text) = 21 then
      DIG_BANCO.Value := 3
    else if StrToInt(NUM_Banco.Text) = 33 then
      DIG_BANCO.Value := 7
    else if StrToInt(NUM_Banco.Text) = 41 then
      DIG_BANCO.Value := 8
    else if StrToInt(NUM_Banco.Text) = 104 then
      DIG_BANCO.Value := 9
    else if StrToInt(NUM_Banco.Text) = 237 then
      DIG_BANCO.Value := 2
    else if StrToInt(NUM_Banco.Text) = 341 then
      DIG_BANCO.Value := 7
    else if StrToInt(NUM_Banco.Text) = 389 then
      DIG_BANCO.Value := 1
    else if StrToInt(NUM_Banco.Text) = 399 then
      DIG_BANCO.Value := 9
    else if StrToInt(NUM_Banco.Text) = 748 then
      DIG_BANCO.Value := 10
    else if StrToInt(NUM_Banco.Text) = 756 then
      DIG_BANCO.Value := 0;
  except

  end;
end;

procedure TFrmCaixas.Set_Campos(Vazio: Boolean);
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
    end;
  end;
  DetailSearch('');
end;

procedure TFrmCaixas.btnDeleteClick(Sender: TObject);
begin
  if FrmData.QAcesso.FieldByName('EXCLUSAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para exclusão', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  IQuery.Sql.Clear;
  IQuery.Sql.Add('SELECT * FROM RAZAO');
  IQuery.Sql.Add('WHERE');
  IQuery.Sql.Add('(CONTA_DB = :CONTA) OR (CONTA_CR = :CONTA)');

  IQuery.ParamByName('CONTA').AsString := COD_CONTABIL.Text;

  IQuery.Prepare;
  IQuery.Open;

  if not IQuery.IsEmpty then
  begin
    Application.MessageBox('Conta com lançamento(s)', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  IQuery.Sql.Clear;
  IQuery.Sql.Add('SELECT * FROM TRANSACOES');
  IQuery.Sql.Add('WHERE');
  IQuery.Sql.Add('(BANCO_ID = :BANCO_ID)');

  IQuery.ParamByName('BANCO_ID').AsInteger := QTabela.FieldByName('BANCO_ID').AsInteger;

  IQuery.Prepare;
  IQuery.Open;

  if not IQuery.IsEmpty then
  begin
    Application.MessageBox('Conta com lançamento(s)', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  IQuery.Sql.Clear;
  IQuery.Sql.Add('SELECT * FROM TRANSPARCELAS');
  IQuery.Sql.Add('WHERE');
  IQuery.Sql.Add('(BANCO_ID = :BANCO_ID)');

  IQuery.ParamByName('BANCO_ID').AsInteger := QTabela.FieldByName('BANCO_ID').AsInteger;

  IQuery.Prepare;
  IQuery.Open;

  if not IQuery.IsEmpty then
  begin
    Application.MessageBox('Conta com lançamento(s)', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  if Application.MessageBox('Deseja realmente excluir?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = IDYES then
  begin
    
    IQuery.Sql.Clear;
    IQuery.Sql.Add('DELETE FROM BANCOS');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(BANCO_ID = :ID)');

    IQuery.ParamByName('ID').AsInteger := QTabela.FieldByName('BANCO_ID').AsInteger;

    IQuery.Prepare;
    IQuery.ExecSql;

    QTabela.Close;
    QTabela.Open;
    Set_Campos(False);
    Botoes_Normal;
  end;

  if QTabela.IsEmpty then
    QEmpresa.Close;
end;

procedure TFrmCaixas.btnDiscardClick(Sender: TObject);
begin
  Botoes_Normal;
  Set_Campos(False);

  if QTabela.IsEmpty then
    QEmpresa.Close;

  Habilitar(False);
  Operacao := '';
  Consulta.TabVisible := True;
end;

procedure TFrmCaixas.btnEditClick(Sender: TObject);
begin
  if FrmData.QAcesso.FieldByName('ALTERACAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para alteração', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  IQuery.Sql.Clear;
  IQuery.Sql.Add('SELECT * FROM RAZAO');
  IQuery.Sql.Add('WHERE');
  IQuery.Sql.Add('(CONTA_DB = :CONTA) OR (CONTA_CR = :CONTA)');

  IQuery.ParamByName('CONTA').AsString := COD_CONTABIL.Text;

  IQuery.Prepare;
  IQuery.Open;

  if not IQuery.IsEmpty then
    COD_CONTABIL.ReadOnly := True;
  
  Operacao := 'Alterando';
  ID := QTabela.FieldByName('BANCO_ID').AsInteger;
  Botoes_Editing;
  Habilitar(True);

  Consulta.TabVisible := False;

  TIPO.SetFocus;
end;

procedure TFrmCaixas.btnEmpresaClick(Sender: TObject);
begin
  try
    EMPRESA_ID.Value := GetConsulta('EMPRESAS', 0, 0, StrToInt(EMPRESA_ID.Text));
  except
    EMPRESA_ID.Value := GetConsulta('EMPRESAS', 0, 0, 0);
  end;
end;

procedure TFrmCaixas.btnInsertClick(Sender: TObject);
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

  TIPO.Text := 'BANCO';

  Consulta.TabVisible := False;
  
  TIPO.SetFocus;
end;

procedure TFrmCaixas.btnNextClick(Sender: TObject);
begin
  if not QTabela.Eof then
  begin
    QTabela.Next;
    Set_Campos(False);
  end;
  Botoes_Normal;
end;

procedure TFrmCaixas.btnPesquisaClick(Sender: TObject);
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

procedure TFrmCaixas.btnPriorClick(Sender: TObject);
begin
  if not QTabela.Bof then
  begin
    QTabela.Prior;
    Set_Campos(False);
  end;
  Botoes_Normal;
end;

procedure TFrmCaixas.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCaixas.btnSaveClick(Sender: TObject);
begin
  DetailSearch('');

  if Validacao then
  begin
    if Operacao = 'Inserindo' then
    begin
      Insert;

      CmdSelectNull := 'WHERE (DESCRICAO = :DESCRICAO)';
      CmdOrderBy    := 'ORDER BY BANCO_ID';

      QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

      QTabela.ParamByName('DESCRICAO').AsString := DESCRICAO.Text;

      QTabela.Open;
      QTabela.Last;
    end
    else
      Edit;

    if FrmPrincipal.Config.FieldByName('PLANO_PROPRIO').AsString = 'False' then
      COD_CONTABIL.ReadOnly := True
    else
      COD_CONTABIL.ReadOnly := False;

    Set_Campos(False);

    if QTabela.IsEmpty then
      QEmpresa.Close;

    Habilitar(False);
    Botoes_Normal;

    Operacao := '';
    Consulta.TabVisible := True;
  end;
end;

procedure TFrmCaixas.DBGrid1DblClick(Sender: TObject);
begin
  Manutencao.Show;
end;

procedure TFrmCaixas.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmCaixas.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Manutencao.Show;
end;

procedure TFrmCaixas.DBGrid1TitleClick(Column: TColumn);
begin
  CmdOrderBy := 'ORDER BY ' + Column.FieldName;
  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;
  QTabela.Open;
end;

procedure TFrmCaixas.DESCRICAOKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmCaixas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmCaixas.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (Operacao = 'Inserindo') or (Operacao = 'Alterando') then
  begin
    Application.MessageBox('É melhor salvar as alterações antes de continuar', PChar(Msg_Title), mb_IconStop);
    CanClose := False;
  end;
end;

procedure TFrmCaixas.FormCreate(Sender: TObject);
begin
  DBGrid1.Columns[0].Width := 49;
  DBGrid1.Columns[1].Width := 75;
  DBGrid1.Columns[2].Width := 164;
  DBGrid1.Columns[3].Width := 153;
  DBGrid1.Columns[4].Width := 64;
  DBGrid1.Columns[5].Width := 50;
  DBGrid1.Columns[6].Width := 76;
  DBGrid1.Columns[7].Width := 38;

  CmdSelect := QTabela.Sql.Text;

  if FrmPrincipal.Config.FieldByName('PLANO_PROPRIO').AsString = 'False' then
    COD_CONTABIL.ReadOnly := True
  else
    COD_CONTABIL.ReadOnly := False;

  if FrmPrincipal.Config.FieldByName('MOSTRAR_CADASTROS').AsString = 'True' then
  begin
    if FrmPrincipal.Config.FieldByName('VER_DESATIVADOS').AsString = 'True' then
      CmdSelectNull := 'WHERE (BANCO_ID IS NOT NULL)'
    else
      CmdSelectNull := 'WHERE (BANCO_ID IS NOT NULL) AND (STATUS = ' + #39 + 'A' + #39 + ')';
  end
  else
  begin
    if FrmPrincipal.Config.FieldByName('VER_DESATIVADOS').AsString = 'True' then
      CmdSelectNull := 'WHERE (BANCO_ID IS NULL)'
    else
      CmdSelectNull := 'WHERE (BANCO_ID IS NULL) AND (STATUS = ' + #39 + 'A' + #39 + ')';
  end;

  CmdOrderBy := 'ORDER BY DESCRICAO';

  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;
  QTabela.Open;
end;

end.
