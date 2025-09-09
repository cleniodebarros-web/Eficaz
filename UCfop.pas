unit UCfop;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ComCtrls, ToolWin, StdCtrls, Grids, DBGrids, Tabs, ExtCtrls,
  DB, IBCustomDataSet, IBQuery, Mask, Buttons, DBCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, RxToolEdit, RxCurrEdit;

type
  TFrmCfop = class(TForm)
    PageControl1: TPageControl;
    Panel1: TPanel;
    Consulta: TTabSheet;
    Manutencao: TTabSheet;
    DBGrid1: TDBGrid;
    DataTabela: TDataSource;
    COD_CFOP: TEdit;
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
    DESC_CFOP: TEdit;
    CFNOTA: TMemo;
    Label1: TLabel;
    CFOP_CONV: TEdit;
    Label6: TLabel;
    CST_ENTRADA: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    CST_SAIDA: TEdit;
    Comeca_Com: TLabeledEdit;
    btnComeca_Com: TSpeedButton;
    Movimento: TCheckBox;
    Label71: TLabel;
    NAT_REC: TEdit;
    btnNat_Rec: TSpeedButton;
    QTabela: TFDQuery;
    IQuery: TFDQuery;
    MOVIMENTO_PISCOFINS: TCheckBox;
    Label2: TLabel;
    btnConta: TSpeedButton;
    CONTA_ID: TCurrencyEdit;
    DBText3: TDBText;
    DataPedido: TDataSource;
    Qconta: TFDQuery;
    DataConta: TDataSource;
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
    procedure COD_CFOPKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnCFOPClick(Sender: TObject);
    procedure btnComeca_ComClick(Sender: TObject);
    procedure Comeca_ComKeyPress(Sender: TObject; var Key: Char);
    procedure btnNat_RecClick(Sender: TObject);
    procedure btnContaClick(Sender: TObject);
    procedure CONTA_IDExit(Sender: TObject);
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
  FrmCfop: TFrmCfop;
  Operacao, ID: String;

implementation

uses
  UPrincipal, UData, UConsulta_Cfop,UConsulta_Contribuicao,UConsulta;

{$R *.dfm}
procedure TFrmCfop.DetailSearch(Tabela: String);
begin
  if ((Tabela = '') or (Tabela = 'Conta')) and (conta_ID.Text <> '') then
  begin
    QConta.Close;
    QConta.ParamByName('CONTA_ID').AsInteger   := StrToInt(Conta_ID.Text);
    QConta.Prepare;
    QConta.Open;
  end;
end;

procedure TFrmCfop.Botoes_Editing;
begin
  btnPrior.Enabled   := False;
  btnNext.Enabled    := False;
  btnInsert.Enabled  := False;
  btnEdit.Enabled    := False;
  btnDelete.Enabled  := False;
  btnSave.Enabled    := True;
  btnDiscard.Enabled := True;
  btnRetorna.Enabled := False;
  btnNat_Rec.Enabled := True;
  btnConta.Enabled   := True;
end;

procedure TFrmCfop.Botoes_Normal;
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
  btnNat_Rec.Enabled := False;
  btnConta.Enabled   := False;
end;

procedure TFrmCfop.Habilitar(Status: Boolean);
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

    if Temp is TCheckBox then
      TMemo(Temp).Enabled := Status;

     if Temp is TCurrencyEdit then
      TCurrencyEdit(Temp).Enabled := Status;
  end;
end;

procedure TFrmCfop.Insert;
var
I: Integer;
Temp: TComponent;
Sql, Par: String;
begin
  Sql := 'INSERT INTO CFOP(';
  Par := '';

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
    begin
      if Sql = 'INSERT INTO CFOP(' then
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
      if Sql = 'INSERT INTO CFOP(' then
        Sql := Sql + TMemo(Temp).Name
      else
        Sql := Sql + ', ' + TMemo(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TMemo(Temp).Name
      else
        Par := Par + ', :' + TMemo(Temp).Name;
    end;

    if Temp is TCheckBox then
    begin
      if Sql = 'INSERT INTO CFOP(' then
        Sql := Sql + TCheckBox(Temp).Name
      else
        Sql := Sql + ', ' + TCheckBox(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TCheckBox(Temp).Name
      else
        Par := Par + ', :' + TCheckBox(Temp).Name;
    end;

    if Temp is TCurrencyEdit then
    begin
      if Sql = 'INSERT INTO CFOP(' then
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

    if Temp is TMemo then
      IQuery.ParamByName(TMemo(Temp).Name).AsByteStr := TMemo(Temp).Text;

    if Temp is TCheckBox then
    begin
      if TCheckBox(Temp).Checked then
        IQuery.ParamByName(TCheckBox(Temp).Name).AsInteger := 1
      else
        IQuery.ParamByName(TCheckBox(Temp).Name).AsInteger := 0;
    end;

    if Temp is TCurrencyEdit then
      IQuery.ParamByName(TCurrencyEdit(Temp).Name).AsFloat := TCurrencyEdit(Temp).Value;
  end;

  IQuery.Prepare;
  IQuery.ExecSql;

  Habilitar(False);
end;

procedure TFrmCfop.Edit;
var
I: Integer;
Temp: TComponent;
Sql: String;
begin
  Sql := 'UPDATE CFOP SET ';

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
    begin
      if Sql = 'UPDATE CFOP SET ' then
        Sql := Sql + TEdit(Temp).Name + ' = :' + TEdit(Temp).Name
      else
        Sql := Sql + ', ' + TEdit(Temp).Name + ' = :' + TEdit(Temp).Name;
    end;

    if Temp is TMemo then
    begin
      if Sql = 'UPDATE CFOP SET ' then
        Sql := Sql + TMemo(Temp).Name + ' = :' + TMemo(Temp).Name
      else
        Sql := Sql + ', ' + TMemo(Temp).Name + ' = :' + TMemo(Temp).Name;
    end;

     if Temp is TCheckBox then
    begin
      if Sql = 'UPDATE CFOP SET ' then
        Sql := Sql + TMemo(Temp).Name + ' = :' + TMemo(Temp).Name
      else
        Sql := Sql + ', ' + TMemo(Temp).Name + ' = :' + TMemo(Temp).Name;
    end;

    if Temp is TCurrencyEdit then
    begin
      if Sql = 'UPDATE CFOP SET ' then
        Sql := Sql + TCurrencyEdit(Temp).Name + ' = :' + TCurrencyEdit(Temp).Name
      else
        Sql := Sql + ', ' + TCurrencyEdit(Temp).Name + ' = :' + TCurrencyEdit(Temp).Name;
    end;

  end;

  Sql := Sql + ' WHERE (COD_CFOP = :ID)';




  IQuery.Sql.Clear;
  IQuery.Sql.Add(Sql);

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];
    if Temp is TEdit then
      IQuery.ParamByName(TEdit(Temp).Name).AsString := TEdit(Temp).Text;

    if Temp is TMemo then
      IQuery.ParamByName(TMemo(Temp).Name).AsByteStr := TMemo(Temp).Text;

    if Temp is TCheckBox then
    begin
      if TCheckBox(Temp).Checked then
        IQuery.ParamByName(TCheckBox(Temp).Name).AsInteger := 1
      else
        IQuery.ParamByName(TCheckBox(Temp).Name).AsInteger := 0;
    end;

    if Temp is TCurrencyEdit then
      IQuery.ParamByName(TCurrencyEdit(Temp).Name).AsFloat := TCurrencyEdit(Temp).Value;

  end;

  IQuery.ParamByName('ID').AsString := QTabela.FieldByName('COD_CFOP').AsString;

  IQuery.Prepare;
  IQuery.ExecSql;

  QTabela.Close;
  QTabela.Open;
  QTabela.Locate('COD_CFOP', ID, [loCaseInsensitive]);
  Habilitar(False);
end;

function TFrmCfop.Validacao: Boolean;
begin
  Result := False;
  
  DESC_CFOP.Color := clWindow;
  NAT_REC.Color   := clWindow;

  if DESC_CFOP.Text = '' then
  begin
    Application.MessageBox('Informe a Descrição', PChar(Msg_Title), mb_IconStop);
    DESC_CFOP.Color := clYellow;
    DESC_CFOP.SetFocus;
    exit;
  end;
  If ((CST_SAIDA.Text = '04') or (CST_SAIDA.Text = '05') or (CST_SAIDA.Text = '06') or (CST_SAIDA.Text = '07') or (CST_SAIDA.Text = '08') or (CST_SAIDA.Text = '09')) AND (NAT_REC.Text = '') then
  begin
    Application.MessageBox('Favor informar a natureza da receita para o cst pis de saída informado.', PChar(Msg_Title), mb_IconStop);
    NAT_REC.Color := clYellow;
    NAT_REC.SetFocus;
    exit;
  end;

  Result := True;
end;

procedure TFrmCfop.ManutencaoShow(Sender: TObject);
begin
  Set_Campos(False);
  Botoes_Normal;
end;

procedure TFrmCfop.Set_Campos(Vazio: Boolean);
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

      if Temp is TCurrencyEdit then
        TCurrencyEdit(Temp).Value := 0;

    end
    else
    begin
      if Temp is TEdit then
        TEdit(Temp).Text := QTabela.FieldByName(TEdit(Temp).Name).AsString;

      if Temp is TMemo then
        TMemo(Temp).Text := QTabela.FieldByName(TMemo(Temp).Name).AsString;

      if Temp is TCheckBox  then
      begin
       if QTabela.FieldByName(TMemo(Temp).Name).AsInteger = 1 then
         TCheckBox(Temp).Checked := True
       Else
         TCheckBox(Temp).Checked := False;
      end;

      if Temp is TCurrencyEdit then
        TCurrencyEdit(Temp).Value := QTabela.FieldByName(TCurrencyEdit(Temp).Name).AsFloat;

    end;
  end;
  DetailSearch('');
end;

procedure TFrmCfop.btnCFOPClick(Sender: TObject);
begin
GetConsulta_CFOP(' ');
end;

procedure TFrmCfop.btnComeca_ComClick(Sender: TObject);
begin
  if Comeca_Com.Text <> '' then
  begin
  // Try
    if FrmData.QAcesso.FieldByName('DESATIVADOS').AsString = 'True' then
      CmdSelectNull := 'WHERE ((DESC_CFOP LIKE ' + #39 + '%' + Comeca_Com.Text  + #39 + ') OR (COD_CFOP LIKE ' + #39 + '%'  + Comeca_Com.Text  + #39 + '))'
    else
      CmdSelectNull := 'WHERE ((DESC_CFOP LIKE ' + #39 + '%' + Comeca_Com.Text  + #39 + ') OR (COD_CFOP LIKE ' + #39 + '%' + Comeca_Com.Text  + #39 + '))';

    CmdOrderBy := 'ORDER BY DESC_CFOP';

    QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

    QTabela.Prepare;
    QTabela.Open;
   {Except
    if FrmPrincipal.Config.FieldByName('VER_DESATIVADOS').AsString = 'True' then
      CmdSelectNull := 'WHERE (DE CONTAINING ' + #39 + Comeca_Com.Text  + #39 + ')'
    else
      CmdSelectNull := 'WHERE (DESC_CFOP CONTAINING ' + #39 + Comeca_Com.Text  + #39 + ') AND (STATUS = ' + #39 + 'A' + #39 + ')';

    CmdOrderBy := 'ORDER BY DESC_CFOP';

    QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

    QTabela.Prepare;
    QTabela.Open;
   End;}
  end;
end;

procedure TFrmCfop.btnContaClick(Sender: TObject);
begin
  try
    CONTA_ID.Value := GetConsulta('PLANOCONTABIL', 0, 0, StrToInt(CONTA_ID.Text));
  except
    CONTA_ID.Value := GetConsulta('PLANOCONTABIL', 0, 0, 0);
  end;
  DetailSearch('');
end;

procedure TFrmCfop.btnDeleteClick(Sender: TObject);
begin
  if FrmData.QAcesso.FieldByName('EXCLUSAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para exclusão', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  if Application.MessageBox('Deseja realmente excluir?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = IDYES then
  begin
    IQuery.Sql.Clear;
    IQuery.Sql.Add('DELETE FROM CFOP');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(COD_CFOP = :ID)');

    IQuery.ParamByName('ID').AsString := QTabela.FieldByName('COD_CFOP').AsString;

    IQuery.Prepare;
    IQuery.ExecSql;



    QTabela.Close;

    QTabela.Prepare;
    QTabela.Open;

    Set_Campos(False);
    Botoes_Normal;
    DetailSearch('');
  end;
end;

procedure TFrmCfop.btnDiscardClick(Sender: TObject);
begin
  Botoes_Normal;
  Set_Campos(False);
  Habilitar(False);
  Operacao := '';
  Consulta.TabVisible := True;
end;

procedure TFrmCfop.btnEditClick(Sender: TObject);
begin
  if FrmData.QAcesso.FieldByName('ALTERACAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para alteração', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  Operacao := 'Alterando';
  ID := QTabela.FieldByName('COD_CFOP').AsString;
  Botoes_Editing;
  Habilitar(True);

  Consulta.TabVisible := False;

  DESC_CFOP.SetFocus;
end;

procedure TFrmCfop.btnInsertClick(Sender: TObject);
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

  DESC_CFOP.SetFocus;
end;

procedure TFrmCfop.btnNat_RecClick(Sender: TObject);
begin
  if (CST_SAIDA.Text = '04') or (CST_SAIDA.Text = '05') or (CST_SAIDA.Text = '06') or (CST_SAIDA.Text = '07') or (CST_SAIDA.Text = '08') or (CST_SAIDA.Text = '09') then
    NAT_REC.Text := GetConsulta_Contribuicao('CONTR' + CST_SAIDA.Text, NAT_REC.Text);
end;

procedure TFrmCfop.btnNextClick(Sender: TObject);
begin
  if not QTabela.Eof then
  begin
    QTabela.Next;
    Set_Campos(False);
  end;

  Botoes_Normal;
  DetailSearch('');
end;

procedure TFrmCfop.btnPriorClick(Sender: TObject);
begin
  if not QTabela.Bof then
  begin
    QTabela.Prior;
    Set_Campos(False);
  end;

  Botoes_Normal;
  DetailSearch('');
end;

procedure TFrmCfop.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCfop.btnSaveClick(Sender: TObject);
begin
  if Validacao then
  begin
    if Operacao = 'Inserindo' then
    begin
      Insert;

      CmdSelectNull := 'WHERE (COD_CFOP = :COD_CFOP)';
      CmdOrderBy    := 'ORDER BY COD_CFOP';

      QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

      QTabela.ParamByName('COD_CFOP').AsString := COD_CFOP.Text;

      QTabela.Open;
      QTabela.Last;
    end
    else
      Edit;



    Set_Campos(False);
    Habilitar(False);
    Botoes_Normal;
    DetailSearch('');

    Operacao := '';
    Consulta.TabVisible := True;
  end;
end;

procedure TFrmCfop.COD_CFOPKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmCfop.Comeca_ComKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    btnComeca_ComClick(Sender);
end;

procedure TFrmCfop.CONTA_IDExit(Sender: TObject);
begin
 DetailSearch('');
end;

procedure TFrmCfop.DBGrid1DblClick(Sender: TObject);
begin
  Manutencao.Show;
end;

procedure TFrmCfop.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Manutencao.Show;
end;

procedure TFrmCfop.DBGrid1TitleClick(Column: TColumn);
begin
  CmdOrderBy := 'ORDER BY ' + Column.FieldName;
  
  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;
  QTabela.Open;
end;

procedure TFrmCfop.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmCfop.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (Operacao = 'Inserindo') or (Operacao = 'Alterando') then
  begin
    Application.MessageBox('É melhor salvar as alterações antes de continuar', PChar(Msg_Title), mb_IconStop);
    CanClose := False;
  end;
end;

procedure TFrmCfop.FormCreate(Sender: TObject);
begin
  DBGrid1.Columns[0].Width := 36;
  DBGrid1.Columns[1].Width := 504;

  CmdSelect     := QTabela.Sql.Text;
  CmdSelectNull := 'WHERE (COD_CFOP IS NOT NULL)';
  CmdOrderBy    := 'ORDER BY DESC_CFOP';

  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;
  QTabela.Open;
  Consulta.Show;
end;

procedure TFrmCfop.FormShow(Sender: TObject);
begin
  DBGrid1.SetFocus;
  
end;

end.
