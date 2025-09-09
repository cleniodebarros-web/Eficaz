unit UTransf_Caixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ComCtrls, ToolWin, StdCtrls, Grids, DBGrids, Tabs, ExtCtrls,
  DB, IBCustomDataSet, IBQuery, Mask, Buttons, DBCtrls, rxCurrEdit, rxToolEdit,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmTransf_Caixa = class(TForm)
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
    BALANCO: TComboBox;
    Label2: TLabel;
    Label9: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label18: TLabel;
    Label11: TLabel;
    Label1: TLabel;
    DT_TRANS: TDateEdit;
    EMPRESA_ID: TCurrencyEdit;
    BANCO_ID: TCurrencyEdit;
    BANCO_ID_TRANSF: TCurrencyEdit;
    HISTORICO: TEdit;
    COMPLEMENTO: TEdit;
    NUM_DOC: TEdit;
    DataEmpresa: TDataSource;
    DataOrigem: TDataSource;
    DataDestino: TDataSource;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    CONDUTA: TEdit;
    DEPTO: TEdit;
    TPCTB: TEdit;
    btnEmpresa: TSpeedButton;
    btnOrigem: TSpeedButton;
    btnDestino: TSpeedButton;
    VALOR: TRxCalcEdit;
    DT_MOVIMENTO: TDateEdit;
    Dias: TTabSet;
    AUTORIZ_ID: TCurrencyEdit;
    btnPesquisa: TBitBtn;
    Label33: TLabel;
    DT_ENT_SAI: TDateEdit;
    Label7: TLabel;
    Label8: TLabel;
    QDestino: TFDQuery;
    QOrigem: TFDQuery;
    QEmpresa: TFDQuery;
    IQuery: TFDQuery;
    QTabela: TFDQuery;
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
    procedure EMPRESA_IDExit(Sender: TObject);
    procedure BANCO_IDExit(Sender: TObject);
    procedure BANCO_ID_TRANSFExit(Sender: TObject);
    procedure EMPRESA_IDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnEmpresaClick(Sender: TObject);
    procedure btnOrigemClick(Sender: TObject);
    procedure btnDestinoClick(Sender: TObject);
    procedure DiasClick(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DT_TRANSKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure DT_TRANSEnter(Sender: TObject);
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
  FrmTransf_Caixa: TFrmTransf_Caixa;
  Operacao: String;
  ID: Integer;

implementation

uses
  UPrincipal, UData, UConsulta, UPesquisa;

{$R *.dfm}

procedure TFrmTransf_Caixa.BANCO_IDExit(Sender: TObject);
begin
  DetailSearch('Origem');
end;

procedure TFrmTransf_Caixa.BANCO_ID_TRANSFExit(Sender: TObject);
begin
  DetailSearch('Destino');
end;

procedure TFrmTransf_Caixa.Botoes_Editing;
begin
  btnPrior.Enabled := False;
  btnNext.Enabled := False;
  btnInsert.Enabled := False;
  btnEdit.Enabled := False;
  btnDelete.Enabled := False;
  btnSave.Enabled := True;
  btnDiscard.Enabled := True;
  btnRetorna.Enabled := False;
  btnEmpresa.Enabled := True;
  btnOrigem.Enabled := True;
  btnDestino.Enabled := True;
  btnPesquisa.Enabled := False;
end;

procedure TFrmTransf_Caixa.Botoes_Normal;
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
  btnEmpresa.Enabled := False;
  btnOrigem.Enabled := False;
  btnDestino.Enabled := False;
  btnPesquisa.Enabled := True;
end;

procedure TFrmTransf_Caixa.DetailSearch(Tabela: String);
begin
  if ((Tabela = '') or (Tabela = 'Empresa')) and (EMPRESA_ID.Text <> '') then
  begin
    QEmpresa.Close;
    QEmpresa.ParamByName('EMPRESA_ID').AsInteger := StrToInt(EMPRESA_ID.Text);
    QEmpresa.Prepare;
    QEmpresa.Open;
  end;

  if ((Tabela = '') or (Tabela = 'Origem')) and (BANCO_ID.Text <> '') then
  begin
    QOrigem.Close;
    QOrigem.ParamByName('BANCO_ID').AsInteger := StrToInt(BANCO_ID.Text);
    QOrigem.ParamByName('EMPRESA_ID').AsInteger := StrToInt(EMPRESA_ID.Text);
    QOrigem.Prepare;
    QOrigem.Open;
  end;

  if ((Tabela = '') or (Tabela = 'Destino')) and (BANCO_ID_TRANSF.Text <> '') then
  begin
    QDestino.Close;
    QDestino.ParamByName('BANCO_ID').AsInteger := StrToInt(BANCO_ID_TRANSF.Text);
    QDestino.ParamByName('EMPRESA_ID').AsInteger := StrToInt(EMPRESA_ID.Text);
    QDestino.Prepare;
    QDestino.Open;
  end;
end;

procedure TFrmTransf_Caixa.DiasClick(Sender: TObject);
begin
  if Dias.TabIndex <> (Dias.Tabs.Count - 1) then
  begin
    CmdSelectNull := 'WHERE (TRANSACAO_ID IS NOT NULL) AND (DT_MOVIMENTO = :DT_MOVIMENTO) AND (CONDUTA = :CONDUTA) AND (DEPTO = :DEPTO) AND (TPCTB = :TPCTB) AND (EMPRESA_ID = :EMPRESA_ID)';
    CmdOrderBy    := 'ORDER BY TRANSACAO_ID';

    QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

    QTabela.ParamByName('DT_MOVIMENTO').AsDateTime := StrToDate(StrZero(IntToStr(Dias.TabIndex + 1), 2, 0) + '/' + Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 4, 7));
    QTabela.ParamByName('CONDUTA').AsString        := '02';
    QTabela.ParamByName('DEPTO').AsString          := '04';
    QTabela.ParamByName('TPCTB').AsString          := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    QTabela.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  end
  else
  begin
    CmdSelectNull := 'WHERE (TRANSACAO_ID IS NOT NULL) AND (DT_MOVIMENTO <= :DT_MOVIMENTO) AND (CONDUTA = :CONDUTA) AND (DEPTO = :DEPTO) AND (TPCTB = :TPCTB) AND (EMPRESA_ID = :EMPRESA_ID)';
    CmdOrderBy    := 'ORDER BY TRANSACAO_ID';

    QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

    QTabela.ParamByName('DT_MOVIMENTO').AsDateTime := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
    QTabela.ParamByName('CONDUTA').AsString        := '02';
    QTabela.ParamByName('DEPTO').AsString          := '04';
    QTabela.ParamByName('TPCTB').AsString          := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    QTabela.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  end;
  QTabela.Prepare;
  QTabela.Open;
end;

procedure TFrmTransf_Caixa.DT_TRANSEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmTransf_Caixa.DT_TRANSKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);
  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmTransf_Caixa.Habilitar(Status: Boolean);
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

    if Temp is TRxcalcEdit then
      TRxcalcEdit(Temp).Enabled := Status;
  end;
end;

procedure TFrmTransf_Caixa.Insert;
var
I: Integer;
Temp: TComponent;
Sql, Par: String;
begin
  Sql := 'INSERT INTO TRANSACOES(';
  Par := '';

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
    begin
      if Sql = 'INSERT INTO TRANSACOES(' then
        Sql := Sql + TEdit(Temp).Name
      else
        Sql := Sql + ', ' + TEdit(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TEdit(Temp).Name
      else
        Par := Par + ', :' + TEdit(Temp).Name;
    end;

    if Temp is TDateEdit then
    begin
      if Sql = 'INSERT INTO TRANSACOES(' then
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
      if Sql = 'INSERT INTO TRANSACOES(' then
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
      if Sql = 'INSERT INTO TRANSACOES(' then
        Sql := Sql + TCurrencyEdit(Temp).Name
      else
        Sql := Sql + ', ' + TCurrencyEdit(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TCurrencyEdit(Temp).Name
      else
        Par := Par + ', :' + TCurrencyEdit(Temp).Name;
    end;

    if Temp is TRxcalcEdit then
    begin
      if Sql = 'INSERT INTO TRANSACOES(' then
        Sql := Sql + TRxcalcEdit(Temp).Name
      else
        Sql := Sql + ', ' + TRxcalcEdit(Temp).Name;
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

    if Temp is TDateEdit then
      IQuery.ParamByName(TDateEdit(Temp).Name).AsDateTime := TDateEdit(Temp).Date;

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

procedure TFrmTransf_Caixa.Edit;
var
I: Integer;
Temp: TComponent;
Sql: String;
begin
  Sql := 'UPDATE TRANSACOES SET ';

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
    begin
      if Sql = 'UPDATE TRANSACOES SET ' then
        Sql := Sql + TEdit(Temp).Name + ' = :' + TEdit(Temp).Name
      else
        Sql := Sql + ', ' + TEdit(Temp).Name + ' = :' + TEdit(Temp).Name;
    end;

    if Temp is TDateEdit then
    begin
      if Sql = 'UPDATE TRANSACOES SET ' then
        Sql := Sql + TDateEdit(Temp).Name + ' = :' + TDateEdit(Temp).Name
      else
        Sql := Sql + ', ' + TDateEdit(Temp).Name + ' = :' + TDateEdit(Temp).Name;
    end;

    if Temp is TComboBox then
    begin
      if Sql = 'UPDATE TRANSACOES SET ' then
        Sql := Sql + TComboBox(Temp).Name + ' = :' + TComboBox(Temp).Name
      else
        Sql := Sql + ', ' + TComboBox(Temp).Name + ' = :' + TComboBox(Temp).Name;
    end;

    if Temp is TCurrencyEdit then
    begin
      if Sql = 'UPDATE TRANSACOES SET ' then
        Sql := Sql + TCurrencyEdit(Temp).Name + ' = :' + TCurrencyEdit(Temp).Name
      else
        Sql := Sql + ', ' + TCurrencyEdit(Temp).Name + ' = :' + TCurrencyEdit(Temp).Name;
    end;

    if Temp is TRxCalcEdit then
    begin
      if Sql = 'UPDATE TRANSACOES SET ' then
        Sql := Sql + TRxCalcEdit(Temp).Name + ' = :' + TRxCalcEdit(Temp).Name
      else
        Sql := Sql + ', ' + TRxCalcEdit(Temp).Name + ' = :' + TRxCalcEdit(Temp).Name;
    end;
  end;

  Sql := Sql + ' WHERE (TRANSACAO_ID = :ID)';

  

  IQuery.Sql.Clear;
  IQuery.Sql.Add(Sql);

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];
    if Temp is TEdit then
      IQuery.ParamByName(TEdit(Temp).Name).AsString := TEdit(Temp).Text;

    if Temp is TDateEdit then
      IQuery.ParamByName(TDateEdit(Temp).Name).AsDateTime := TDateEdit(Temp).Date;

    if Temp is TComboBox then
      IQuery.ParamByName(TComboBox(Temp).Name).AsString := TComboBox(Temp).Text;

    if Temp is TCurrencyEdit then
      IQuery.ParamByName(TCurrencyEdit(Temp).Name).AsFloat := TCurrencyEdit(Temp).Value;

    if Temp is TRxcalcEdit then
      IQuery.ParamByName(TRxCalcEdit(Temp).Name).AsFloat := TRxCalcEdit(Temp).Value;
  end;

  IQuery.ParamByName('ID').AsInteger := QTabela.FieldByName('TRANSACAO_ID').AsInteger;

  IQuery.Prepare;
  IQuery.ExecSql;

  QTabela.Close;
  QTabela.Prepare;
  QTabela.Open;
  QTabela.Locate('TRANSACAO_ID', ID, [loCaseInsensitive]);
  Habilitar(False);
end;

procedure TFrmTransf_Caixa.EMPRESA_IDExit(Sender: TObject);
begin
  DetailSearch('Empresa');
end;

procedure TFrmTransf_Caixa.EMPRESA_IDKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = EMPRESA_ID) then
    btnEmpresaClick(Self);
  if (Key = Vk_F7) and (Sender = BANCO_ID) then
    btnOrigemClick(Self);
  if (Key = Vk_F7) and (Sender = BANCO_ID_TRANSF) then
    btnDestinoClick(Self);
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

function TFrmTransf_Caixa.Validacao: Boolean;
begin
  Result := False;

  EMPRESA_ID.Color       := clWindow;
  BANCO_ID.Color        := clWindow;
  BANCO_ID_TRANSF.Color := clWindow;
  VALOR.Color           := clWindow;
  BALANCO.Color         := clWindow;

  if QEmpresa.IsEmpty then
  begin
    Application.MessageBox('Empresa inexistente', PChar(Msg_Title), mb_IconStop);
    EMPRESA_ID.Color := clYellow;
    EMPRESA_ID.SetFocus;
    exit;
  end;

  if QOrigem.IsEmpty then
  begin
    Application.MessageBox('Conta de Origem inexistente', PChar(Msg_Title), mb_IconStop);
    BANCO_ID.Color := clYellow;
    BANCO_ID.SetFocus;
    exit;
  end;

  if not Existe_Plano(QOrigem.FieldByName('COD_CONTABIL').AsString) then
  begin
    Application.MessageBox('Caixa/Banco de Origem inexistente no plano de contas. Gere o plano de contas novamente', PChar(Msg_Title), mb_IconStop);
    BANCO_ID.Color := clYellow;
    BANCO_ID.SetFocus;
    exit;
  end;

  if QDestino.IsEmpty then
  begin
    Application.MessageBox('Conta de Destino inexistente', PChar(Msg_Title), mb_IconSTop);
    BANCO_ID_TRANSF.Color := clYellow;
    BANCO_ID_TRANSF.SetFocus;
    exit;
  end;

  if not Existe_Plano(QDestino.FieldByName('COD_CONTABIL').AsString) then
  begin
    Application.MessageBox('Caixa/Banco de Destino inexistente no plano de contas. Gere o plano de contas novamente', PChar(Msg_Title), mb_IconStop);
    BANCO_ID_TRANSF.Color := clYellow;
    BANCO_ID_TRANSF.SetFocus;
    exit;
  end;

  if (BANCO_ID.Text = BANCO_ID_TRANSF.Text) then
  begin
    Application.MessageBox('Conta de Origem não pode ser igual à Conta de Destino', PChar(Msg_Title), mb_IconStop);
    BANCO_ID.Color := clYellow;
    BANCO_ID.SetFocus;
    exit;
  end;

  if VALOR.Value <= 0 then
  begin
    Application.MessageBox('Valor inválido', PChar(Msg_Title), mb_IconStop);
    VALOR.Color := clYellow;
    VALOR.SetFocus;
    exit;
  end;

  if (BALANCO.Text <> 'LIBERADO') and (BALANCO.Text <> 'BLOQUEADO') and (BALANCO.Text <> 'AGRUPADO') then
  begin
    Application.MessageBox('Status inválido', PChar(Msg_Title), mb_IconStop);
    BALANCO.Color := clYellow;
    BALANCO.SetFocus;
    exit;
  end;

  Result := True;
end;

procedure TFrmTransf_Caixa.ManutencaoShow(Sender: TObject);
begin
  Set_Campos(False);
  Botoes_Normal;
end;

procedure TFrmTransf_Caixa.Set_Campos(Vazio: Boolean);
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

      if Temp is TDateEdit then
        TDateEdit(Temp).Text := '';

      if Temp is TComboBox then
        TComboBox(Temp).Text := '';

      if Temp is TCurrencyEdit then
        TCurrencyEdit(Temp).Value := 0;

      if Temp is TRxCalcEdit then
        TRxcalcEdit(Temp).Value := 0;
    end
    else
    begin
      if Temp is TEdit then
        TEdit(Temp).Text := QTabela.FieldByName(TEdit(Temp).Name).AsString;

      if Temp is TDateEdit then
        TDateEdit(Temp).Text := QTabela.FieldByName(TDateEdit(Temp).Name).AsString;

      if Temp is TComboBox then
        TComboBox(Temp).Text := QTabela.FieldByName(TComboBox(Temp).Name).AsString;

      if Temp is TCurrencyEdit then
        TCurrencyEdit(Temp).Value := QTabela.FieldByName(TCurrencyEdit(Temp).Name).AsFloat;

      if Temp is TRxCalcEdit then
        TRxCalcEdit(Temp).Value := QTabela.FieldByName(TRxcalcEdit(Temp).Name).AsFloat;
    end;
  end;
  DetailSearch('');
  CONDUTA.Text := '02';
  DEPTO.Text := '04';
  TPCTB.Text := FrmData.QAcesso.FieldByName('TPCTB').AsString;
end;

procedure TFrmTransf_Caixa.btnDeleteClick(Sender: TObject);
begin
  if FrmData.QAcesso.FieldByName('EXCLUSAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para exclusão', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  if QTabela.FieldByName('DT_MOVIMENTO').AsDateTime < FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime then
  begin
    Application.MessageBox('Movimento já encerrado', PChar(Msg_Title), mb_IconStop);
    exit;
  end;
  
  if Application.MessageBox('Deseja realmente excluir?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = IDYES then
  begin


    IQuery.Sql.Clear;
    IQuery.Sql.Add('DELETE FROM TRANSACOES');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(TRANSACAO_ID = :ID)');
    IQuery.ParamByName('ID').AsInteger := QTabela.FieldByName('TRANSACAO_ID').AsInteger;
    IQuery.Prepare;
    IQuery.ExecSql;


    QTabela.Close;
    QTabela.Prepare;
    QTabela.Open;
    Set_Campos(False);
    Botoes_Normal;
  end;

  if QTabela.IsEmpty then
  begin
    QEmpresa.Close;
    QOrigem.Close;
    QDestino.Close;
  end;
end;

procedure TFrmTransf_Caixa.btnDestinoClick(Sender: TObject);
begin
  try
    BANCO_ID_TRANSF.Value := GetConsulta('BANCOS', 0, 0, StrToInt(BANCO_ID_TRANSF.Text));
  except
    BANCO_ID_TRANSF.Value := GetConsulta('BANCOS', 0, 0, 0);
  end;
end;

procedure TFrmTransf_Caixa.btnDiscardClick(Sender: TObject);
begin
  Botoes_Normal;
  Set_Campos(False);

  if QTabela.IsEmpty then
  begin
    QEmpresa.Close;
    QOrigem.Close;
    QDestino.Close;
  end;

  Habilitar(False);
  Operacao := '';
  Consulta.TabVisible := True;
end;

procedure TFrmTransf_Caixa.btnEditClick(Sender: TObject);
begin
  if FrmData.QAcesso.FieldByName('ALTERACAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para alteração', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  if QTabela.FieldByName('DT_MOVIMENTO').AsDateTime < FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime then
  begin
    Application.MessageBox('Movimento já encerrado', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  Operacao := 'Alterando';
  ID := QTabela.FieldByName('TRANSACAO_ID').AsInteger;
  Botoes_Editing;
  Habilitar(True);

  Consulta.TabVisible := False;
  
  DT_TRANS.SetFocus;
end;

procedure TFrmTransf_Caixa.btnEmpresaClick(Sender: TObject);
begin
  try
    EMPRESA_ID.Value := GetConsulta('EMPRESAS', 0, 0, StrToInt(EMPRESA_ID.Text));
  except
    EMPRESA_ID.Value := GetConsulta('EMPRESAS', 0, 0, 0);
  end;
end;

procedure TFrmTransf_Caixa.btnInsertClick(Sender: TObject);
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
  QOrigem.Close;
  QDestino.Close;

  DT_TRANS.Date     := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
  DT_MOVIMENTO.Date := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
  BALANCO.Text      := 'LIBERADO';
  EMPRESA_ID.Value  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  AUTORIZ_ID.Value  := FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger;

  Consulta.TabVisible := False;
  
  DT_TRANS.SetFocus;
end;

procedure TFrmTransf_Caixa.btnNextClick(Sender: TObject);
begin
  if not QTabela.Eof then
  begin
    QTabela.Next;
    Set_Campos(False);
  end;
  Botoes_Normal;
end;

procedure TFrmTransf_Caixa.btnOrigemClick(Sender: TObject);
begin
  try
    BANCO_ID.Value := GetConsulta('BANCOS', 0, 0, StrToInt(BANCO_ID.Text));
  except
    BANCO_ID.Value := GetConsulta('BANCOS', 0, 0, 0);
  end;
end;

procedure TFrmTransf_Caixa.btnPesquisaClick(Sender: TObject);
var
Condicao: String;
begin
  Condicao := GetPesquisa('TRANS BANCOS');

  if Condicao <> '' then
  begin
    CmdSelectNull := Condicao + ' AND (CONDUTA = :CONDUTA) AND (DEPTO = :DEPTO) AND (TPCTB = :TPCTB) AND (EMPRESA_ID = :EMPRESA_ID)';

    QTabela.ParamByName('CONDUTA').AsString     := '02';
    QTabela.ParamByName('DEPTO').AsString       := '04';
    QTabela.ParamByName('TPCTB').AsString       := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    QTabela.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  end;

  CmdOrderBy := 'ORDER BY TRANSACAO_ID';

  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

  QTabela.Prepare;
  QTabela.Open;
  Set_Campos(False);
  Botoes_Normal;
end;

procedure TFrmTransf_Caixa.btnPriorClick(Sender: TObject);
begin
  if not QTabela.Bof then
  begin
    QTabela.Prior;
    Set_Campos(False);
  end;
  Botoes_Normal;
end;

procedure TFrmTransf_Caixa.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmTransf_Caixa.btnSaveClick(Sender: TObject);
begin
  DetailSearch('');

  if Validacao then
  begin

    if (HISTORICO.Text = '') and (COMPLEMENTO.Text = '') then
    begin
      HISTORICO.Text   := 'Saída p/ depósito no ' + QDestino.FieldByName('DESCRICAO').AsString;
      COMPLEMENTO.Text := 'Depósito proveniente do ' + QOrigem.FieldByName('DESCRICAO').AsString;
    end;

    if Operacao = 'Inserindo' then
    begin
      Insert;

      CmdSelectNull := 'WHERE (TRANSACAO_ID IS NOT NULL) AND (DT_MOVIMENTO = :DT_MOVIMENTO) AND (CONDUTA = :CONDUTA) AND (DEPTO = :DEPTO) AND (TPCTB = :TPCTB) AND (EMPRESA_ID = :EMPRESA_ID)';
      CmdOrderBy    := 'ORDER BY TRANSACAO_ID';

      QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

      QTabela.ParamByName('DT_MOVIMENTO').AsDateTime := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
      QTabela.ParamByName('CONDUTA').AsString        := '02';
      QTabela.ParamByName('DEPTO').AsString          := '04';
      QTabela.ParamByName('TPCTB').AsString          := FrmData.QAcesso.FieldByName('TPCTB').AsString;
      QTabela.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;

      QTabela.Prepare;
      QTabela.Open;
      QTabela.Last;
    end
    else
      Edit;

    Set_Campos(False);

    if QTabela.IsEmpty then
    begin
      QEmpresa.Close;
      QOrigem.Close;
      QDestino.Close;
    end;

    Habilitar(False);
    Botoes_Normal;
    Operacao := '';
    Consulta.TabVisible := True;
  end;
end;

procedure TFrmTransf_Caixa.DBGrid1DblClick(Sender: TObject);
begin
  Manutencao.Show;
end;

procedure TFrmTransf_Caixa.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Manutencao.Show;
end;

procedure TFrmTransf_Caixa.DBGrid1TitleClick(Column: TColumn);
begin
  CmdOrderBy := 'ORDER BY ' + Column.FieldName;

  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

  QTabela.Prepare;
  QTabela.Open;
end;

procedure TFrmTransf_Caixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmTransf_Caixa.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (Operacao = 'Inserindo') or (Operacao = 'Alterando') then
  begin
    Application.MessageBox('É melhor salvar as alterações antes de continuar', PChar(Msg_Title), mb_IconStop);
    CanClose := False;
  end;
end;

procedure TFrmTransf_Caixa.FormCreate(Sender: TObject);
var
X, Ult_Dia: Integer;
begin
  DBGrid1.Columns[0].Width := 54;
  DBGrid1.Columns[1].Width := 76;
  DBGrid1.Columns[2].Width := 77;
  DBGrid1.Columns[3].Width := 78;
  DBGrid1.Columns[4].Width := 72;
  DBGrid1.Columns[5].Width := 73;
  DBGrid1.Columns[6].Width := 105;

  Ult_Dia := StrToInt(Copy(DateToStr(Ult_Dia_Mes(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime)), 1, 2));
  Dias.Tabs.Clear;

  for X := 1 to Ult_Dia do
    Dias.Tabs.Add(IntToStr(X));

  Dias.Tabs.Add('Todos');

  DT_MOVIMENTO.MinDate := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
  DT_MOVIMENTO.MaxDate := StrToDate('31/12/2026');

  CmdSelect     := QTabela.Sql.Text;
  CmdSelectNull := 'WHERE (TRANSACAO_ID IS NOT NULL) AND (DT_MOVIMENTO = :DT_MOVIMENTO) AND (CONDUTA = :CONDUTA) AND (DEPTO = :DEPTO) AND (TPCTB = :TPCTB) AND (EMPRESA_ID = :EMPRESA_ID)';
  CmdOrderBy    := 'ORDER BY TRANSACAO_ID';

  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

  QTabela.ParamByName('DT_MOVIMENTO').AsDateTime := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
  QTabela.ParamByName('CONDUTA').AsString        := '02';
  QTabela.ParamByName('DEPTO').AsString          := '04';
  QTabela.ParamByName('TPCTB').AsString          := FrmData.QAcesso.FieldByName('TPCTB').AsString;
  QTabela.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;

  QTabela.Prepare;
  QTabela.Open;
  Consulta.Show;
end;

procedure TFrmTransf_Caixa.FormShow(Sender: TObject);
begin
  DBGrid1.SetFocus;
end;

end.
