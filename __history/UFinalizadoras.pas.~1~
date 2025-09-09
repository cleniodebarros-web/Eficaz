unit UFinalizadoras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ComCtrls, ToolWin, StdCtrls, Grids, DBGrids, Tabs, ExtCtrls,
  DB, IBCustomDataSet, IBQuery, Mask, Buttons, rxToolEdit, rxCurrEdit, DBCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmFinalizadoras = class(TForm)
    PageControl1: TPageControl;
    Panel1: TPanel;
    Consulta: TTabSheet;
    Manutencao: TTabSheet;
    DBGrid1: TDBGrid;
    DataTabela: TDataSource;
    DESCRICAO: TEdit;
    LEGENDA: TEdit;
    btnRetorna: TBitBtn;
    Panel2: TPanel;
    btnPrior: TBitBtn;
    btnNext: TBitBtn;
    btnInsert: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    btnSave: TBitBtn;
    btnDiscard: TBitBtn;
    COMISSAO: TCurrencyEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label5: TLabel;
    Label10: TLabel;
    Label7: TLabel;
    Label1: TLabel;
    Label6: TLabel;
    Label11: TLabel;
    REDE: TEdit;
    btnTEF: TSpeedButton;
    FATOR: TCurrencyEdit;
    NUMAUT: TCurrencyEdit;
    PONTOS: TCurrencyEdit;
    FINTROCO: TCurrencyEdit;
    PARCELAS: TCurrencyEdit;
    F_TROCO: TRadioGroup;
    F_CHEQUE: TCheckBox;
    F_DIG_VALOR: TCheckBox;
    F_AUTO: TCheckBox;
    GAVETA: TCheckBox;
    TIPO_TRANSACAO: TRadioGroup;
    LIMITE: TRxCalcEdit;
    LIMTROCO: TRxCalcEdit;
    Label12: TLabel;
    T_TEF: TCurrencyEdit;
    ENTRADA_PARCELA: TCheckBox;
    C_Debito: TCheckBox;
    C_Credito: TCheckBox;
    CLIENTE_ID: TCurrencyEdit;
    btnCliente: TSpeedButton;
    DBText2: TDBText;
    Label13: TLabel;
    DataCliente: TDataSource;
    Label14: TLabel;
    FinCartaoEcf: TCurrencyEdit;
    QCliente: TFDQuery;
    IQuery: TFDQuery;
    QTabela: TFDQuery;
    Label15: TLabel;
    TX_ADM: TCurrencyEdit;
    Alfabeto: TTabSet;
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
    procedure DESCRICAOKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LIMITEKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure C_DebitoClick(Sender: TObject);
    procedure C_CreditoClick(Sender: TObject);
    procedure btnClienteClick(Sender: TObject);
    procedure CLIENTE_IDExit(Sender: TObject);
    procedure CLIENTE_IDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AlfabetoClick(Sender: TObject);
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
    procedure DetailSearch(Tabela: String);
  end;

var
  FrmFinalizadoras: TFrmFinalizadoras;
  Operacao: String;
  ID: Integer;

implementation

uses
  UPrincipal, UData,UConsulta;

{$R *.dfm}

procedure TFrmFinalizadoras.AlfabetoClick(Sender: TObject);
begin
if Alfabeto.TabIndex <> 26 then
  Begin
    if FrmData.QAcesso.FieldByName('DESATIVADOS').AsString  = 'True' Then
      CmdSelectNull := 'WHERE (DESCRICAO LIKE ' + #39 + Chr(Alfabeto.TabIndex + 65) + '%' + #39 + ')'
    else
      CmdSelectNull := 'WHERE (DESCRICAO LIKE ' + #39 + Chr(Alfabeto.TabIndex + 65) + '%' + #39 + ') AND (STATUS = ' + #39 + 'A' + #39 + ')';
  end
  else
  begin
    if FrmData.QAcesso.FieldByName('DESATIVADOS').AsString  = 'True' Then
      CmdSelectNull := 'WHERE (FINALIZADORA_ID IS NOT NULL)'
    else
      CmdSelectNull := 'WHERE (FINALIZADORA_ID IS NOT NULL) AND (STATUS = ' + #39 + 'A' + #39 + ')';
  end;

  CmdOrderBy    := 'ORDER BY DESCRICAO';

  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

  QTabela.Prepare;
  QTabela.Open;
end;

procedure TFrmFinalizadoras.Botoes_Editing;
begin
  btnPrior.Enabled := False;
  btnNext.Enabled := False;
  btnInsert.Enabled := False;
  btnEdit.Enabled := False;
  btnDelete.Enabled := False;
  btnSave.Enabled := True;
  btnDiscard.Enabled := True;
  btnRetorna.Enabled := False;
  btnCliente.Enabled := True;
end;

procedure TFrmFinalizadoras.Botoes_Normal;
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
  btnCliente.Enabled := False;
end;

procedure TFrmFinalizadoras.Habilitar(Status: Boolean);
var
I: Integer;
Temp: TComponent;
begin
  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
      TEdit(Temp).Enabled := Status;

    if Temp is TCurrencyEdit then
      TCurrencyEdit(Temp).Enabled := Status;

    if Temp is TRxCalcEdit then
      TRxCalcEdit(Temp).Enabled := Status;

    if Temp is TRadioGroup then
      TRadioGroup(Temp).Enabled := Status;

    if Temp is TCheckBox then
      TCheckBox(Temp).Enabled := Status;
  end;
end;

procedure TFrmFinalizadoras.Insert;
var
I: Integer;
Temp: TComponent;
Sql, Par: String;
begin
  Sql := 'INSERT INTO FINALIZADORAS(';
  Par := '';

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
    begin
      if Sql = 'INSERT INTO FINALIZADORAS(' then
        Sql := Sql + TEdit(Temp).Name
      else
        Sql := Sql + ', ' + TEdit(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TEdit(Temp).Name
      else
        Par := Par + ', :' + TEdit(Temp).Name;
    end;


    if Temp is TCurrencyEdit then
    begin
      if Sql = 'INSERT INTO FINALIZADORAS(' then
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
      if Sql = 'INSERT INTO FINALIZADORAS(' then
        Sql := Sql + TRxCalcEdit(Temp).Name
      else
        Sql := Sql + ', ' + TRxCalcEdit(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TRxcalcEdit(Temp).Name
      else
        Par := Par + ', :' + TRxCalcEdit(Temp).Name;
    end;

    if Temp is TRadioGroup then
    begin
      if Sql = 'INSERT INTO FINALIZADORAS(' then
        Sql := Sql + TRadioGroup(Temp).Name
      else
        Sql := Sql + ', ' + TRadioGroup(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TRadioGroup(Temp).Name
      else
        Par := Par + ', :' + TRadioGroup(Temp).Name;
    end;

    if Temp is TCheckBox then
    begin
      if Sql = 'INSERT INTO FINALIZADORAS(' then
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

    if Temp is TCurrencyEdit then
      IQuery.ParamByName(TCurrencyEdit(Temp).Name).AsFloat := TCurrencyEdit(Temp).Value;

    if Temp is TRxCalcEdit then
      IQuery.ParamByName(TRxcalcEdit(Temp).Name).AsFloat := TRxCalcEdit(Temp).Value;

    if Temp is TRadioGroup then
      IQuery.ParamByName(TRadioGroup(Temp).Name).AsInteger := TRadioGroup(Temp).ItemIndex;

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

procedure TFrmFinalizadoras.LIMITEKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmFinalizadoras.Edit;
var
I: Integer;
Temp: TComponent;
Sql: String;
begin
  Sql := 'UPDATE FINALIZADORAS SET ';

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
    begin
      if Sql = 'UPDATE FINALIZADORAS SET ' then
        Sql := Sql + TEdit(Temp).Name + ' = :' + TEdit(Temp).Name
      else
        Sql := Sql + ', ' + TEdit(Temp).Name + ' = :' + TEdit(Temp).Name;
    end;

    if Temp is TCurrencyEdit then
    begin
      if Sql = 'UPDATE FINALIZADORAS SET ' then
        Sql := Sql + TCurrencyEdit(Temp).Name + ' = :' + TCurrencyEdit(Temp).Name
      else
        Sql := Sql + ', ' + TCurrencyEdit(Temp).Name + ' = :' + TCurrencyEdit(Temp).Name;
    end;

    if Temp is TRxCalcEdit then
    begin
      if Sql = 'UPDATE FINALIZADORAS SET ' then
        Sql := Sql + TRxcalcEdit(Temp).Name + ' = :' + TRxcalcEdit(Temp).Name
      else
        Sql := Sql + ', ' + TRxcalcEdit(Temp).Name + ' = :' + TRxcalcEdit(Temp).Name;
    end;

    if Temp is TRadioGroup then
    begin
      if Sql = 'UPDATE FINALIZADORAS SET ' then
        Sql := Sql + TRadioGroup(Temp).Name + ' = :' + TRadioGroup(Temp).Name
      else
        Sql := Sql + ', ' + TRadioGroup(Temp).Name + ' = :' + TRadioGroup(Temp).Name;
    end;

    if Temp is TCheckBox then
    begin
      if Sql = 'UPDATE FINALIZADORAS SET ' then
        Sql := Sql + TCheckBox(Temp).Name + ' = :' + TCheckBox(Temp).Name
      else
        Sql := Sql + ', ' + TCheckBox(Temp).Name + ' = :' + TCheckBox(Temp).Name;
    end;
  end;

  Sql := Sql + ' WHERE (FINALIZADORA_ID = :ID)';

  

  IQuery.Sql.Clear;
  IQuery.Sql.Add(Sql);

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];
    if Temp is TEdit then
      IQuery.ParamByName(TEdit(Temp).Name).AsString := TEdit(Temp).Text;

    if Temp is TCurrencyEdit then
      IQuery.ParamByName(TCurrencyEdit(Temp).Name).AsFloat := TCurrencyEdit(Temp).Value;

    if Temp is TRxcalcEdit then
      IQuery.ParamByName(TRxcalcEdit(Temp).Name).AsFloat := TRxCalcEdit(Temp).Value;

    if Temp is TRadioGroup then
      IQuery.ParamByName(TRadioGroup(Temp).Name).AsInteger := TRadioGroup(Temp).ItemIndex;

    if Temp is TCheckBox then
    begin
      if TCheckBox(Temp).Checked then
        IQuery.ParamByName(TCheckBox(Temp).Name).AsString := 'True'
      else
        IQuery.ParamByName(TCheckBox(Temp).Name).AsString := 'False';
    end;
  end;

  IQuery.ParamByName('ID').AsInteger := QTabela.FieldByName('FINALIZADORA_ID').AsInteger;

  IQuery.Prepare;
  IQuery.ExecSql;

  QTabela.Close;
  QTabela.Open;
  QTabela.Locate('FINALIZADORA_ID', ID, [loCaseInsensitive]);
  Habilitar(False);
end;

function TFrmFinalizadoras.Validacao: Boolean;
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
  if (CLIENTE_ID.VALUE > 0) AND  (NOT C_DEBITO.Checked) AND (NOT C_CREDITO.Checked) Then
  Begin
    Application.MessageBox('Informe se operadora de cartão e Débito ou Crédito!', PChar(Msg_Title), mb_IconStop);
    Cliente_id.Color := clYellow;
    Cliente_id.SetFocus;
    exit;
  End;

   if (CLIENTE_ID.VALUE > 0) AND (FinCartaoEcf.Value = 0)Then
   Begin
    Application.MessageBox('Informe a Finalizdora referente ao Cartão no ECF!', PChar(Msg_Title), mb_IconStop);
    FinCartaoEcf.Color := clYellow;
    FinCartaoEcf.SetFocus;
    exit;
  End;


  Result := True;
end;

procedure TFrmFinalizadoras.ManutencaoShow(Sender: TObject);
begin
  Set_Campos(False);
  Botoes_Normal;
end;

procedure TFrmFinalizadoras.Set_Campos(Vazio: Boolean);
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

      if Temp is TCurrencyEdit then
        TCurrencyEdit(Temp).Value := 0;

      if Temp is TRxCalcEdit then
        TRxcalcEdit(Temp).Value := 0;

      if Temp is TRadioGroup then
        TRadioGroup(Temp).ItemIndex := -1;

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

      if Temp is TRadioGroup then
        TRadioGroup(Temp).ItemIndex := QTabela.FieldByName(TRadioGroup(Temp).Name).AsInteger;

      if Temp is TCheckBox then
        TCheckBox(Temp).Checked := QTabela.FieldByName(TCheckBox(Temp).Name).AsBoolean;
    end;
  end;
  DetailSearch('');

  end;

procedure TFrmFinalizadoras.DetailSearch(Tabela: String);
Begin
if ((Tabela = '') or (Tabela = 'Cliente')) and (CLIENTE_ID.Text <> '') then
  begin
    QCliente.Close;
    QCliente.ParamByName('CLIENTE_ID').AsInteger := StrToInt(CLIENTE_ID.Text);
    QCliente.Prepare;
    QCliente.Open;
  end;
End;

procedure TFrmFinalizadoras.btnClienteClick(Sender: TObject);
begin
  try
    CLIENTE_ID.Value := GetConsulta('CLIENTES', 0, 0, StrToInt(CLIENTE_ID.Text));
  except
    CLIENTE_ID.Value := GetConsulta('CLIENTES', 0, 0, 0);
  end;
  DetailSearch('Cliente');
end;

procedure TFrmFinalizadoras.btnDeleteClick(Sender: TObject);
begin
  if FrmData.QAcesso.FieldByName('EXCLUSAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para exclusão', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  IQuery.Sql.Clear;
  IQuery.Sql.Add('SELECT * FROM FECHAMENTO_CUPOM');
  IQuery.Sql.Add('WHERE');
  IQuery.Sql.Add('(FINALIZADORA_ID = :FINALIZADORA_ID)');

  IQuery.ParamByName('FINALIZADORA_ID').AsInteger := QTabela.FieldByName('FINALIZADORA_ID').AsInteger;

  IQuery.Prepare;
  IQuery.Open;

  if not IQuery.IsEmpty then
  begin
    Application.MessageBox('Finalizadora com lançamento(s)', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  IQuery.Sql.Clear;
  IQuery.Sql.Add('SELECT * FROM TECLADO');
  IQuery.Sql.Add('WHERE');
  IQuery.Sql.Add('(FINALIZADORA_ID = :FINALIZADORA_ID)');

  IQuery.ParamByName('FINALIZADORA_ID').AsInteger := QTabela.FieldByName('FINALIZADORA_ID').AsInteger;

  IQuery.Prepare;
  IQuery.Open;

  if not IQuery.IsEmpty then
  begin
    Application.MessageBox('Finalizadora com lançamento(s)', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  IQuery.Sql.Clear;
  IQuery.Sql.Add('SELECT * FROM TRANSACOES');
  IQuery.Sql.Add('WHERE');
  IQuery.Sql.Add('(FINALIZADORA_ID = :FINALIZADORA_ID)');

  IQuery.ParamByName('FINALIZADORA_ID').AsInteger := QTabela.FieldByName('FINALIZADORA_ID').AsInteger;

  IQuery.Prepare;
  IQuery.Open;

  if not IQuery.IsEmpty then
  begin
    Application.MessageBox('Finalizadora com lançamento(s)', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  if Application.MessageBox('Deseja realmente excluir?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = IDYES then
  begin

    IQuery.Sql.Clear;
    IQuery.Sql.Add('DELETE FROM FINALIZADORAS');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(FINALIZADORA_ID = :ID)');
    IQuery.ParamByName('ID').AsInteger := QTabela.FieldByName('FINALIZADORA_ID').AsInteger;
    IQuery.Prepare;
    IQuery.ExecSql;

    QTabela.Close;
    QTabela.Open;
    Set_Campos(False);
    Botoes_Normal
  end;
end;

procedure TFrmFinalizadoras.btnDiscardClick(Sender: TObject);
begin
  Botoes_Normal;
  Set_Campos(False);
  Habilitar(False);
  Operacao := '';
  Consulta.TabVisible := TRue;
end;

procedure TFrmFinalizadoras.btnEditClick(Sender: TObject);
begin
  if FrmData.QAcesso.FieldByName('ALTERACAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para alteração', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  Operacao := 'Alterando';
  ID := QTabela.FieldByName('FINALIZADORA_ID').AsInteger;
  Botoes_Editing;
  Habilitar(True);

  Consulta.TabVisible := False;
  
  DESCRICAO.SetFocus;
end;

procedure TFrmFinalizadoras.btnInsertClick(Sender: TObject);
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

  TIPO_TRANSACAO.ItemIndex := 1;
  F_TROCO.ItemIndex        := 0;

  Consulta.TabVisible := False;
  
  DESCRICAO.SetFocus;
end;

procedure TFrmFinalizadoras.btnNextClick(Sender: TObject);
begin
  if not QTabela.Eof then
  begin
    QTabela.Next;
    Set_Campos(False);
  end;
  Botoes_Normal;
end;

procedure TFrmFinalizadoras.btnPriorClick(Sender: TObject);
begin
  if not QTabela.Bof then
  begin
    QTabela.Prior;
    Set_Campos(False);
  end;
  Botoes_Normal;
end;

procedure TFrmFinalizadoras.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmFinalizadoras.btnSaveClick(Sender: TObject);
begin
  if Validacao then
  begin
    if Operacao = 'Inserindo' then
    begin
      Insert;

      CmdSelectNull := 'WHERE (DESCRICAO = :DESCRICAO)';
      CmdOrderBy    := 'ORDER BY FINALIZADORA_ID';

      QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

      QTabela.ParamByName('DESCRICAO').AsString := DESCRICAO.Text;

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

procedure TFrmFinalizadoras.CLIENTE_IDExit(Sender: TObject);
begin
  DetailSearch('Cliente');
end;

procedure TFrmFinalizadoras.CLIENTE_IDKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmFinalizadoras.C_CreditoClick(Sender: TObject);
begin
if C_Credito.Checked then
   C_Debito.Checked := False;

end;

procedure TFrmFinalizadoras.C_DebitoClick(Sender: TObject);
begin
if C_Debito.Checked then
   C_Credito.Checked := False;

end;

procedure TFrmFinalizadoras.DBGrid1DblClick(Sender: TObject);
begin
  Manutencao.Show;
end;

procedure TFrmFinalizadoras.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Manutencao.Show;
end;

procedure TFrmFinalizadoras.DBGrid1TitleClick(Column: TColumn);
begin
  CmdOrderBy := 'ORDER BY ' + Column.FieldName;
  
  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;
  QTabela.Open;
end;

procedure TFrmFinalizadoras.DESCRICAOKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);
  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmFinalizadoras.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmFinalizadoras.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (Operacao = 'Inserindo') or (Operacao = 'Alterando') then
  begin
    Application.MessageBox('É melhor salvar as alterações antes de continuar', PChar(Msg_Title), mb_IconStop);
    CanClose := False;
  end;
end;

procedure TFrmFinalizadoras.FormCreate(Sender: TObject);
begin
  DBGrid1.Columns[0].Width := 58;
  DBGrid1.Columns[1].Width := 154;
  DBGrid1.Columns[2].Width := 122;
  DBGrid1.Columns[3].Width := 84;
  DBGrid1.Columns[4].Width := 84;
  DBGrid1.Columns[5].Width := 84;
  DBGrid1.Columns[6].Width := 84;

  CmdSelect     := QTabela.Sql.Text;
  CmdSelectNull := 'WHERE (FINALIZADORA_ID IS NOT NULL)';
  CmdOrderBy    := 'ORDER BY FINALIZADORA_ID';
  
  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;
  QTabela.Open;
  Consulta.Show;
end;

procedure TFrmFinalizadoras.FormShow(Sender: TObject);
begin
  DBGrid1.SetFocus;
end;

end.
