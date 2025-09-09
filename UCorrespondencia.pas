unit UCorrespondencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ComCtrls, ToolWin, StdCtrls, Grids, DBGrids, Tabs, ExtCtrls,
  DB, IBCustomDataSet, IBQuery, Mask, Buttons, DBCtrls, rxToolEdit, rxCurrEdit,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmCorrespondencia = class(TForm)
    PageControl1: TPageControl;
    Panel1: TPanel;
    Consulta: TTabSheet;
    Manutencao: TTabSheet;
    DBGrid1: TDBGrid;
    DataTabela: TDataSource;
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
    Label5: TLabel;
    DESC_CARTA: TEdit;
    OBSERVACAO: TMemo;
    Label1: TLabel;
    REMETENTE: TCurrencyEdit;
    btnFornecedor: TSpeedButton;
    DESTINATARIO: TCurrencyEdit;
    btnCliente: TSpeedButton;
    DBText2: TDBText;
    DataCliente: TDataSource;
    DataFornecedor: TDataSource;
    DBText1: TDBText;
    Label2: TLabel;
    REM_ENDERECO: TEdit;
    Label25: TLabel;
    REM_NUMERO: TEdit;
    Label7: TLabel;
    REM_BAIRRO: TEdit;
    Label10: TLabel;
    REM_CEP: TMaskEdit;
    REM_MUNICIPIO: TEdit;
    btnIBGE_REM: TSpeedButton;
    Label24: TLabel;
    Bevel1: TBevel;
    Label6: TLabel;
    DEST_ENDERECO: TEdit;
    Label8: TLabel;
    DEST_NUMERO: TEdit;
    Label9: TLabel;
    DEST_BAIRRO: TEdit;
    Label11: TLabel;
    DEST_MUNICIPIO: TEdit;
    SpeedButton1: TSpeedButton;
    DEST_CEP: TMaskEdit;
    Label12: TLabel;
    QCliente: TFDQuery;
    IQuery: TFDQuery;
    QTabela: TFDQuery;
    QFornecedor: TFDQuery;
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
    procedure FormShow(Sender: TObject);
    procedure btnFornecedorClick(Sender: TObject);
    procedure btnClienteClick(Sender: TObject);
    procedure DESTINATARIOExit(Sender: TObject);
    procedure REMETENTEExit(Sender: TObject);
    procedure REM_ENDERECOKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnIBGE_REMClick(Sender: TObject);
    procedure REMETENTEKeyDown(Sender: TObject; var Key: Word;
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
    function Validacao: Boolean;
    procedure DetailSearch(Tabela: String);
  end;

var
  FrmCorrespondencia: TFrmCorrespondencia;
  Operacao, ID: String;

implementation

uses
  UPrincipal, UData, UConsulta;

{$R *.dfm}

procedure TFrmCorrespondencia.Botoes_Editing;
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

procedure TFrmCorrespondencia.Botoes_Normal;
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

procedure TFrmCorrespondencia.Habilitar(Status: Boolean);
var
I: Integer;
Temp: TComponent;
begin
  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
      TEdit(Temp).Enabled := Status;

    if Temp is TMaskEdit then
      TMaskEdit(Temp).Enabled := Status;

    if Temp is TCurrencyEdit then
      TCurrencyEdit(Temp).Enabled := Status;

    if Temp is TMemo then
      TMemo(Temp).Enabled := Status;
  end;
end;

procedure TFrmCorrespondencia.Insert;
var
I: Integer;
Temp: TComponent;
Sql, Par: String;
begin
  Sql := 'INSERT INTO CARTAS(';
  Par := '';

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
    begin
      if Sql = 'INSERT INTO CARTAS(' then
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
      if Sql = 'INSERT INTO CARTAS(' then
        Sql := Sql + TCurrencyEdit(Temp).Name
      else
        Sql := Sql + ', ' + TCurrencyEdit(Temp).Name;

      if Par = '' then
        Par := Par + ':' + TCurrencyEdit(Temp).Name
      else
        Par := Par + ', :' + TCurrencyEdit(Temp).Name;
    end;

    if Temp is TMaskEdit then
    begin
      if Sql = 'INSERT INTO CARTAS(' then
        Sql := Sql + TMaskEdit(Temp).Name
      else
        Sql := Sql + ', ' + TMaskEdit(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TMaskEdit(Temp).Name
      else
        Par := Par + ', :' + TMaskEdit(Temp).Name;
    end;

    if Temp is TMemo then
    begin
      if Sql = 'INSERT INTO CARTAS(' then
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

    if Temp is TCurrencyEdit then
      IQuery.ParamByName(TCurrencyEdit(Temp).Name).AsFloat := TCurrencyEdit(Temp).Value;

    if Temp is TMaskEdit then
      IQuery.ParamByName(TMaskEdit(Temp).Name).AsString := TMaskEdit(Temp).Text;

    if Temp is TMemo then
      IQuery.ParamByName(TMemo(Temp).Name).AsString := TMemo(Temp).Text;
  end;

  IQuery.Prepare;
  IQuery.ExecSql;



  Habilitar(False);
end;

procedure TFrmCorrespondencia.Edit;
var
I: Integer;
Temp: TComponent;
Sql: String;
begin
  Sql := 'UPDATE CARTAS SET ';

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
    begin
      if Sql = 'UPDATE CARTAS SET ' then
        Sql := Sql + TEdit(Temp).Name + ' = :' + TEdit(Temp).Name
      else
        Sql := Sql + ', ' + TEdit(Temp).Name + ' = :' + TEdit(Temp).Name;
    end;

    if Temp is TCurrencyEdit then
    begin
      if Sql = 'UPDATE CARTAS SET ' then
        Sql := Sql + TCurrencyEdit(Temp).Name + ' = :' + TCurrencyEdit(Temp).Name
      else
        Sql := Sql + ', ' + TCurrencyEdit(Temp).Name + ' = :' + TCurrencyEdit(Temp).Name;
    end;

    if Temp is TMaskEdit then
    begin
      if Sql = 'UPDATE CARTAS SET ' then
        Sql := Sql + TMaskEdit(Temp).Name + ' = :' + TMaskEdit(Temp).Name
      else
        Sql := Sql + ', ' + TMaskEdit(Temp).Name + ' = :' + TMaskEdit(Temp).Name;
    end;

    if Temp is TMemo then
    begin
      if Sql = 'UPDATE CARTAS SET ' then
        Sql := Sql + TMemo(Temp).Name + ' = :' + TMemo(Temp).Name
      else
        Sql := Sql + ', ' + TMemo(Temp).Name + ' = :' + TMemo(Temp).Name;
    end;
  end;

  Sql := Sql + ' WHERE (CARTA_ID = :ID)';

  
  IQuery.Sql.Clear;
  IQuery.Sql.Add(Sql);

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];
    if Temp is TEdit then
      IQuery.ParamByName(TEdit(Temp).Name).AsString := TEdit(Temp).Text;

    if Temp is TCurrencyEdit then
      IQuery.ParamByName(TCurrencyEdit(Temp).Name).AsFloat := TCurrencyEdit(Temp).Value;

    if Temp is TMaskEdit then
      IQuery.ParamByName(TMaskEdit(Temp).Name).AsString := TMaskEdit(Temp).Text;

    if Temp is TMemo then
      IQuery.ParamByName(TMemo(Temp).Name).AsString := TMemo(Temp).Text;
  end;

  IQuery.ParamByName('ID').AsInteger := QTabela.FieldByName('CARTA_ID').AsInteger;

  IQuery.Prepare;
  IQuery.ExecSql;



  QTabela.Close;
  QTabela.Open;

  QTabela.Locate('CARTA_ID', ID, [loCaseInsensitive]);

  Habilitar(False);
end;

procedure TFrmCorrespondencia.REM_ENDERECOKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = REM_MUNICIPIO) then
    btnIBGE_REMClick(Self);

  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

function TFrmCorrespondencia.Validacao: Boolean;
begin
  Result := False;

  DESC_CARTA.Color := clWindow;

  if DESC_CARTA.Text = '' then
  begin
    Application.MessageBox('Informe a Descrição', PChar(Msg_Title), mb_IconStop);
    DESC_CARTA.Color := clYellow;
    DESC_CARTA.SetFocus;
    exit;
  end;

  Result := True;
end;

procedure TFrmCorrespondencia.ManutencaoShow(Sender: TObject);
begin
  Set_Campos(False);
  Botoes_Normal;
end;

procedure TFrmCorrespondencia.REMETENTEExit(Sender: TObject);
begin
  DetailSearch('Fornecedor');
end;

procedure TFrmCorrespondencia.REMETENTEKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = REMETENTE) then
    btnFornecedorClick(Self);

  if (Key = Vk_F7) and (Sender = DESTINATARIO) then
    btnClienteClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmCorrespondencia.Set_Campos(Vazio: Boolean);
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

      if Temp is TMaskEdit then
        TMaskEdit(Temp).Text := '';

      if Temp is TMemo then
        TMemo(Temp).Lines.Clear;
    end
    else
    begin
      if Temp is TEdit then
        TEdit(Temp).Text := QTabela.FieldByName(TEdit(Temp).Name).AsString;

      if Temp is TCurrencyEdit then
        TCurrencyEdit(Temp).Value := QTabela.FieldByName(TCurrencyEdit(Temp).Name).AsFloat;

      if Temp is TMaskEdit then
        TMaskEdit(Temp).Text := QTabela.FieldByName(TMaskEdit(Temp).Name).AsString;
        
      if Temp is TMemo then
        TMemo(Temp).Text := QTabela.FieldByName(TMemo(Temp).Name).AsString;
    end;
  end;

  DetailSearch('');
end;

procedure TFrmCorrespondencia.btnFornecedorClick(Sender: TObject);
begin
  try
    REMETENTE.Value := GetConsulta('FORNECEDORES', 0, 0, StrToInt(REMETENTE.Text));
  except
    REMETENTE.Value := GetConsulta('FORNECEDORES', 0, 0, 0);
  end;
end;

procedure TFrmCorrespondencia.btnDeleteClick(Sender: TObject);
begin
  if FrmData.QAcesso.FieldByName('EXCLUSAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para exclusão', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  if Application.MessageBox('Deseja realmente excluir?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = IDYES then
  begin


    IQuery.Sql.Clear;
    IQuery.Sql.Add('DELETE FROM CARTAS');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(CARTA_ID = :ID)');

    IQuery.ParamByName('ID').AsInteger := QTabela.FieldByName('CARTA_ID').AsInteger;

    IQuery.Prepare;
    IQuery.ExecSql;



    QTabela.Close;

    QTabela.Prepare;
    QTabela.Open;

    Set_Campos(False);
    Botoes_Normal;
  end;
end;

procedure TFrmCorrespondencia.btnDiscardClick(Sender: TObject);
begin
  Botoes_Normal;
  Set_Campos(False);
  Habilitar(False);
  Operacao := '';
  Consulta.TabVisible := True;
end;

procedure TFrmCorrespondencia.btnEditClick(Sender: TObject);
begin
  if FrmData.QAcesso.FieldByName('ALTERACAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para alteração', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  Operacao := 'Alterando';
  ID := QTabela.FieldByName('CARTA_ID').AsString;
  Botoes_Editing;
  Habilitar(True);

  Consulta.TabVisible := False;

  REMETENTE.SetFocus;
end;

procedure TFrmCorrespondencia.btnClienteClick(Sender: TObject);
begin
  try
    DESTINATARIO.Value := GetConsulta('CLIENTES', 0, 0, StrToInt(DESTINATARIO.Text));
  except
    DESTINATARIO.Value := GetConsulta('CLIENTES', 0, 0, 0);
  end;
end;

procedure TFrmCorrespondencia.btnIBGE_REMClick(Sender: TObject);
begin
  try
    REM_MUNICIPIO.Text := IntToStr(GetConsulta('IBGE', 0, 0, StrToInt(REM_MUNICIPIO.Text)));
  except
    REM_MUNICIPIO.Text := IntToStr(GetConsulta('IBGE', 0, 0, 0));
  end;
end;

procedure TFrmCorrespondencia.btnInsertClick(Sender: TObject);
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

  REMETENTE.SetFocus;
end;

procedure TFrmCorrespondencia.btnNextClick(Sender: TObject);
begin
  if not QTabela.Eof then
  begin
    QTabela.Next;
    Set_Campos(False);
  end;

  Botoes_Normal;
end;

procedure TFrmCorrespondencia.btnPriorClick(Sender: TObject);
begin
  if not QTabela.Bof then
  begin
    QTabela.Prior;
    Set_Campos(False);
  end;

  Botoes_Normal;
end;

procedure TFrmCorrespondencia.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCorrespondencia.btnSaveClick(Sender: TObject);
begin
  DetailSearch('');

  if Validacao then
  begin
    if Operacao = 'Inserindo' then
    begin
      Insert;

      CmdSelectNull := 'WHERE (DESC_CARTA = :DESC_CARTA)';
      CmdOrderBy    := 'ORDER BY CARTA_ID';

      QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

      QTabela.ParamByName('DESC_CARTA').AsString := DESC_CARTA.Text;

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

procedure TFrmCorrespondencia.DBGrid1DblClick(Sender: TObject);
begin
  Manutencao.Show;
end;

procedure TFrmCorrespondencia.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Manutencao.Show;
end;

procedure TFrmCorrespondencia.DBGrid1TitleClick(Column: TColumn);
begin
  CmdOrderBy := 'ORDER BY ' + Column.FieldName;

  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;
  QTabela.Open;
end;

procedure TFrmCorrespondencia.DESTINATARIOExit(Sender: TObject);
begin
  DetailSearch('Cliente');
end;

procedure TFrmCorrespondencia.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmCorrespondencia.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (Operacao = 'Inserindo') or (Operacao = 'Alterando') then
  begin
    Application.MessageBox('É melhor salvar as alterações antes de continuar', PChar(Msg_Title), mb_IconStop);
    CanClose := False;
  end;
end;

procedure TFrmCorrespondencia.FormCreate(Sender: TObject);
begin
  DBGrid1.Columns[0].Width := 36;
  DBGrid1.Columns[1].Width := 504;

  CmdSelect     := QTabela.Sql.Text;
  CmdSelectNull := 'WHERE (CARTA_ID IS NOT NULL)';
  CmdOrderBy    := 'ORDER BY DESC_CARTA';

  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;
  QTabela.Open;
end;

procedure TFrmCorrespondencia.FormShow(Sender: TObject);
begin
  DBGrid1.SetFocus;
end;

procedure TFrmCorrespondencia.DetailSearch(Tabela: String);
begin
  if ((Tabela = '') or (Tabela = 'Fornecedor')) and (REMETENTE.Text <> '') then
  begin
    QFornecedor.Close;

    QFornecedor.ParamByName('FORNECEDOR_ID').AsInteger := StrToInt(REMETENTE.Text);

    QFornecedor.Prepare;
    QFornecedor.Open;
  end;

  if ((Tabela = '') or (Tabela = 'Cliente')) and (DESTINATARIO.Text <> '') then
  begin
    QCliente.Close;

    QCliente.ParamByName('CLIENTE_ID').AsInteger := StrToInt(DESTINATARIO.Text);

    QCliente.Prepare;
    QCliente.Open;
  end;
end;

end.
