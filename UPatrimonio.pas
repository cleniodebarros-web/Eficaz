unit UPatrimonio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ComCtrls, ToolWin, StdCtrls, Grids, DBGrids, Tabs, ExtCtrls,
  DB, IBCustomDataSet, IBQuery, Mask, rxToolEdit, Buttons, rxCurrEdit, DBCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmPatrimonio = class(TForm)
    PageControl1: TPageControl;
    Panel1: TPanel;
    Consulta: TTabSheet;
    Manutencao: TTabSheet;
    Alfabeto: TTabSet;
    StatusBar1: TStatusBar;
    DBGrid1: TDBGrid;
    DataTabela: TDataSource;
    DESCRICAO: TEdit;
    COMPLEMENTO: TEdit;
    OBSERVACAO: TEdit;
    DT_AQUISICAO: TDateEdit;
    DT_INCORPORA: TDateEdit;
    ESTADO: TComboBox;
    btnRetorna: TBitBtn;
    Panel2: TPanel;
    btnPrior: TBitBtn;
    btnNext: TBitBtn;
    btnInsert: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    btnSave: TBitBtn;
    btnDiscard: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label5: TLabel;
    Label10: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label27: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    NFISCAL: TEdit;
    EMPRESA_ID: TCurrencyEdit;
    LOCALIZACAO_ID: TCurrencyEdit;
    CONTA_ATIVO: TCurrencyEdit;
    DataEmpresa: TDataSource;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    btnEmpresa: TSpeedButton;
    btnLocalizacao: TSpeedButton;
    btnConta_Imob: TSpeedButton;
    VR_AQUISICAO: TRxCalcEdit;
    btnPesquisa: TBitBtn;
    DT_CORRECAO: TDateEdit;
    VR_CORRIGIDO: TRxCalcEdit;
    TX_DEPRECIACAO: TRxCalcEdit;
    CTA_DEPRECIACAO: TCurrencyEdit;
    btnConta_Depr: TSpeedButton;
    DBText4: TDBText;
    Label1: TLabel;
    VIDA_UTIL: TCurrencyEdit;
    DataLocalizacao: TDataSource;
    DataConta_Imob: TDataSource;
    DataConta_Depr: TDataSource;
    Qconta_Depr: TFDQuery;
    QConta_Imob: TFDQuery;
    QLocalizacao: TFDQuery;
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
    procedure AlfabetoClick(Sender: TObject);
    procedure btnPriorClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DESCRICAOKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EMPRESA_IDExit(Sender: TObject);
    procedure LOCALIZACAO_IDExit(Sender: TObject);
    procedure CONTA_ATIVOExit(Sender: TObject);
    procedure btnEmpresaClick(Sender: TObject);
    procedure btnLocalizacaoClick(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure EMPRESA_IDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure DT_AQUISICAOEnter(Sender: TObject);
    procedure btnConta_ImobClick(Sender: TObject);
    procedure btnConta_DeprClick(Sender: TObject);
    procedure CTA_DEPRECIACAOExit(Sender: TObject);
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
  FrmPatrimonio: TFrmPatrimonio;
  Operacao: String;
  ID: Integer;

implementation

uses
  UPrincipal, UData, UConsulta, UPesquisa;

{$R *.dfm}

procedure TFrmPatrimonio.AlfabetoClick(Sender: TObject);
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
      CmdSelectNull := 'WHERE (PATRIMONIO_ID IS NOT NULL)'
    else
      CmdSelectNull := 'WHERE (PATRIMONIO_ID IS NOT NULL) AND (STATUS = ' + #39 + 'A' + #39 + ')';
  end;

  CmdOrderBy := 'ORDER BY DESCRICAO';

  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;
  
  QTabela.Open;
end;

procedure TFrmPatrimonio.Botoes_Editing;
begin
  btnPrior.Enabled        := False;
  btnNext.Enabled         := False;
  btnInsert.Enabled       := False;
  btnEdit.Enabled         := False;
  btnDelete.Enabled       := False;
  btnSave.Enabled         := True;
  btnDiscard.Enabled      := True;
  btnRetorna.Enabled      := False;
  btnEmpresa.Enabled      := True;
  btnConta_Imob.Enabled   := True;
  btnConta_Depr.Enabled   := True;
  btnLocalizacao.Enabled  := True;
  btnPesquisa.Enabled     := False;
end;

procedure TFrmPatrimonio.Botoes_Normal;
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

  btnSave.Enabled         := False;
  btnDiscard.Enabled      := False;
  btnRetorna.Enabled      := True;
  btnEmpresa.Enabled      := False;
  btnConta_Imob.Enabled   := False;
  btnConta_Depr.Enabled   := False;
  btnLocalizacao.Enabled  := False;
  btnPesquisa.Enabled     := True;
end;

procedure TFrmPatrimonio.DetailSearch(Tabela: String);
begin
  if ((Tabela = '') or (Tabela = 'Empresa')) and (EMPRESA_ID.Text <> '') then
  begin
    QEmpresa.Close;
    QEmpresa.ParamByName('EMPRESA_ID').AsInteger := StrToInt(EMPRESA_ID.Text);
    QEmpresa.Prepare;
    QEmpresa.Open;
  end;

  if ((Tabela = '') or (Tabela = 'Conta Imobilizado')) and (CONTA_ATIVO.Text <> '') then
  begin
    QConta_Imob.Close;
    QConta_Imob.ParamByName('TABELA_ID').AsInteger := StrToInt(CONTA_ATIVO.Text);
    QConta_Imob.Prepare;
    QConta_Imob.Open;
  end;

  if ((Tabela = '') or (Tabela = 'Conta Depreciação')) and (CTA_DEPRECIACAO.Text <> '') then
  begin
    QConta_Depr.Close;
    QConta_Depr.ParamByName('TABELA_ID').AsInteger := StrToInt(CTA_DEPRECIACAO.Text);
    QConta_Depr.Prepare;
    QConta_Depr.Open;
  end;

  if ((Tabela = '') or (Tabela = 'Localização')) and (LOCALIZACAO_ID.Text <> '') then
  begin
    QLocalizacao.Close;
    QLocalizacao.ParamByName('TABELA_ID').AsInteger := StrToInt(LOCALIZACAO_ID.Text);
    QLocalizacao.Prepare;
    QLocalizacao.Open;
  end;
end;

procedure TFrmPatrimonio.Habilitar(Status: Boolean);
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

    if Temp is TDateEdit then
      TDateEdit(Temp).Enabled := Status;

    if Temp is TComboBox then
      TComboBox(Temp).Enabled := Status;

    if Temp is TCurrencyEdit then
      TCurrencyEdit(Temp).Enabled := Status;

    if Temp is TRxCalcEdit then
      TRxCalcEdit(Temp).Enabled := Status;
  end;
end;

procedure TFrmPatrimonio.Insert;
var
I: Integer;
Temp: TComponent;
Sql, Par: String;
begin
  Sql := 'INSERT INTO PATRIMONIO(';
  Par := '';

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
    begin
      if Sql = 'INSERT INTO PATRIMONIO(' then
        Sql := Sql + TEdit(Temp).Name
      else
        Sql := Sql + ', ' + TEdit(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TEdit(Temp).Name
      else
        Par := Par + ', :' + TEdit(Temp).Name;
    end;

    if Temp is TMaskEdit then
    begin
      if Sql = 'INSERT INTO PATRIMONIO(' then
        Sql := Sql + TMaskEdit(Temp).Name
      else
        Sql := Sql + ', ' + TMaskEdit(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TMaskEdit(Temp).Name
      else
        Par := Par + ', :' + TMaskEdit(Temp).Name;
    end;

    if Temp is TDateEdit then
    begin
      if Sql = 'INSERT INTO PATRIMONIO(' then
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
      if Sql = 'INSERT INTO PATRIMONIO(' then
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
      if Sql = 'INSERT INTO PATRIMONIO(' then
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
      if Sql = 'INSERT INTO PATRIMONIO(' then
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

    if Temp is TMaskEdit then
      IQuery.ParamByName(TMaskEdit(Temp).Name).AsString := TMaskEdit(Temp).Text;

    if Temp is TDateEdit then
      IQuery.ParamByName(TDateEdit(Temp).Name).AsDateTime := TDateEdit(Temp).Date;

    if Temp is TComboBox then
      IQuery.ParamByName(TComboBox(Temp).Name).AsString := TComboBox(Temp).Text;

    if Temp is TCurrencyEdit then
      IQuery.ParamByName(TCurrencyEdit(Temp).Name).AsFloat := TCurrencyEdit(Temp).Value;

    if Temp is TRxCalcEdit then
      IQuery.ParamByName(TRxCalcEdit(Temp).Name).AsFloat := TRxcalcEdit(Temp).Value;
  end;

  IQuery.Prepare;
  IQuery.ExecSql;

  Habilitar(False);
end;

procedure TFrmPatrimonio.Edit;
var
I: Integer;
Temp: TComponent;
Sql: String;
begin
  Sql := 'UPDATE PATRIMONIO SET ';

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
    begin
      if Sql = 'UPDATE PATRIMONIO SET ' then
        Sql := Sql + TEdit(Temp).Name + ' = :' + TEdit(Temp).Name
      else
        Sql := Sql + ', ' + TEdit(Temp).Name + ' = :' + TEdit(Temp).Name;
    end;

    if Temp is TMaskEdit then
    begin
      if Sql = 'UPDATE PATRIMONIO SET ' then
        Sql := Sql + TMaskEdit(Temp).Name + ' = :' + TMaskEdit(Temp).Name
      else
        Sql := Sql + ', ' + TMaskEdit(Temp).Name + ' = :' + TMaskEdit(Temp).Name;
    end;

    if Temp is TDateEdit then
    begin
      if Sql = 'UPDATE PATRIMONIO SET ' then
        Sql := Sql + TDateEdit(Temp).Name + ' = :' + TDateEdit(Temp).Name
      else
        Sql := Sql + ', ' + TDateEdit(Temp).Name + ' = :' + TDateEdit(Temp).Name;
    end;

    if Temp is TComboBox then
    begin
      if Sql = 'UPDATE PATRIMONIO SET ' then
        Sql := Sql + TComboBox(Temp).Name + ' = :' + TComboBox(Temp).Name
      else
        Sql := Sql + ', ' + TComboBox(Temp).Name + ' = :' + TComboBox(Temp).Name;
    end;

    if Temp is TCurrencyEdit then
    begin
      if Sql = 'UPDATE PATRIMONIO SET ' then
        Sql := Sql + TCurrencyEdit(Temp).Name + ' = :' + TCurrencyEdit(Temp).Name
      else
        Sql := Sql + ', ' + TCurrencyEdit(Temp).Name + ' = :' + TCurrencyEdit(Temp).Name;
    end;

    if Temp is TRxcalcEdit then
    begin
      if Sql = 'UPDATE PATRIMONIO SET ' then
        Sql := Sql + TRxCalcEdit(Temp).Name + ' = :' + TRxCalcEdit(Temp).Name
      else
        Sql := Sql + ', ' + TRxCalcEdit(Temp).Name + ' = :' + TRxcalcEdit(Temp).Name;
    end;
  end;

  Sql := Sql + ' WHERE (PATRIMONIO_ID = :ID)';

  

  IQuery.Sql.Clear;
  IQuery.Sql.Add(Sql);

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];
    if Temp is TEdit then
      IQuery.ParamByName(TEdit(Temp).Name).AsString := TEdit(Temp).Text;

    if Temp is TMaskEdit then
      IQuery.ParamByName(TMaskEdit(Temp).Name).AsString := TMaskEdit(Temp).Text;

    if Temp is TDateEdit then
      IQuery.ParamByName(TDateEdit(Temp).Name).AsDateTime := TDateEdit(Temp).Date;

    if Temp is TComboBox then
      IQuery.ParamByName(TComboBox(Temp).Name).AsString := TComboBox(Temp).Text;

    if Temp is TCurrencyEdit then
      IQuery.ParamByName(TCurrencyEdit(Temp).Name).AsFloat := TCurrencyEdit(Temp).Value;

    if Temp is TRxcalcEdit then
      IQuery.ParamByName(TRxCalcEdit(Temp).Name).AsFloat := TRxCalcEdit(Temp).Value;
  end;

  IQuery.ParamByName('ID').AsInteger := QTabela.FieldByName('PATRIMONIO_ID').AsInteger;

  IQuery.Prepare;
  IQuery.ExecSql;



  QTabela.Close;
  QTabela.Open;
  QTabela.Locate('PATRIMONIO_ID', ID, [loCaseInsensitive]);
  Habilitar(False);
end;

procedure TFrmPatrimonio.EMPRESA_IDExit(Sender: TObject);
begin
  DetailSearch('Empresa');
end;

procedure TFrmPatrimonio.EMPRESA_IDKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = EMPRESA_ID) then
    btnEmpresaClick(Self);

  if (Key = Vk_F7) and (Sender = CONTA_ATIVO) then
    btnConta_ImobClick(Self);

  if (Key = Vk_F7) and (Sender = CTA_DEPRECIACAO) then
    btnConta_DeprClick(Self);

  if (Key = Vk_F7) and (Sender = LOCALIZACAO_ID) then
    btnLocalizacaoClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

function TFrmPatrimonio.Validacao: Boolean;
begin
  Result := False;

  DESCRICAO.Color       := clWindow;
  CONTA_ATIVO.COlor     := clWindow;
  ESTADO.Color          := clWindow;
  CTA_DEPRECIACAO.COlor := clWindow;
  EMPRESA_ID.Color      := clWindow;
  LOCALIZACAO_ID.Color  := clWindow;

  if DESCRICAO.Text = '' then
  begin
    Application.MessageBox('Descrição inválida', PChar(Msg_Title), mb_IconStop);
    DESCRICAO.Color := clYellow;
    DESCRICAO.SetFocus;
    exit;
  end;

  if QConta_Imob.IsEmpty then
  begin
    Application.MessageBox('Conta Imobilizado inexistente', PChar(Msg_Title), mb_IconStop);
    CONTA_ATIVO.Color := clYellow;
    CONTA_ATIVO.SetFocus;
    exit;
  end;

  if (ESTADO.Text <> 'BOM') and (ESTADO.Text <> 'ÓTIMO') and (ESTADO.Text <> 'REGULAR') and (ESTADO.Text <> 'PÉSSIMO') then
  begin
    Application.MessageBox('Estado inválido', PChar(Msg_Title), mb_IconStop);
    ESTADO.Color := clYellow;
    ESTADO.SetFocus;
    exit;
  end;

  if QConta_Depr.IsEmpty then
  begin
    Application.MessageBox('Conta Depreciação inexistente', PChar(Msg_Title), mb_IconStop);
    CTA_DEPRECIACAO.Color := clYellow;
    CTA_DEPRECIACAO.SetFocus;
    exit;
  end;

  if QEmpresa.IsEmpty then
  begin
    Application.MessageBox('Empresa inexistente', PChar(Msg_Title), mb_IconStop);
    EMPRESA_ID.Color := clYellow;
    EMPRESA_ID.SetFocus;
    exit;
  end;

  if QLocalizacao.IsEmpty then
  begin
    Application.MessageBox('Localizacao inexistente', PChar(Msg_Title), mb_IconStop);
    LOCALIZACAO_ID.Color := clYellow;
    LOCALIZACAO_ID.SetFocus;
    exit;
  end;

  Result := True;
end;

procedure TFrmPatrimonio.ManutencaoShow(Sender: TObject);
begin
  Set_Campos(False);
  Botoes_Normal;
end;

procedure TFrmPatrimonio.DT_AQUISICAOEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmPatrimonio.DESCRICAOKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);
  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmPatrimonio.Set_Campos(Vazio: Boolean);
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

      if Temp is TMaskEdit then
        TMaskEdit(Temp).Text := '';

      if Temp is TDateEdit then
        TDateEdit(Temp).Text := '';

      if Temp is TComboBox then
        TComboBox(Temp).Text := '';

      if Temp is TCurrencyEdit then
        TCurrencyEdit(Temp).Value := 0;

      if Temp is TRxcalcEdit then
        TRxCalcEdit(Temp).Value := 0;
    end
    else
    begin
      if Temp is TEdit then
        TEdit(Temp).Text := QTabela.FieldByName(TEdit(Temp).Name).AsString;

      if Temp is TMaskEdit then
        TMaskEdit(Temp).Text := QTabela.FieldByName(TMaskEdit(Temp).Name).AsString;

      if Temp is TDateEdit then
        TDateEdit(Temp).Text := QTabela.FieldByName(TDateEdit(Temp).Name).AsString;

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

procedure TFrmPatrimonio.btnConta_DeprClick(Sender: TObject);
begin
  try
    CTA_DEPRECIACAO.Value := GetConsulta('PLANO', 0, 0, StrToInt(CTA_DEPRECIACAO.Text));
  except
    CTA_DEPRECIACAO.Value := GetConsulta('PLANO', 0, 0, 0);
  end;
end;

procedure TFrmPatrimonio.btnConta_ImobClick(Sender: TObject);
begin
  try
    CONTA_ATIVO.Value := GetConsulta('PLANO', 0, 0, StrToInt(CONTA_ATIVO.Text));
  except
    CONTA_ATIVO.Value := GetConsulta('PLANO', 0, 0, 0);
  end;
end;

procedure TFrmPatrimonio.btnLocalizacaoClick(Sender: TObject);
begin
  try
    LOCALIZACAO_ID.Value := GetConsulta('LOCAIS', 0, 0, StrToInt(LOCALIZACAO_ID.Text));
  except
    LOCALIZACAO_ID.Value := GetConsulta('LOCAIS', 0, 0, 0);
  end;
end;

procedure TFrmPatrimonio.btnDeleteClick(Sender: TObject);
begin
  if FrmData.QAcesso.FieldByName('EXCLUSAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para exclusao', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  IQuery.Sql.Clear;
  IQuery.Sql.Add('SELECT * FROM TRANSACOES');
  IQuery.Sql.Add('WHERE');
  IQuery.Sql.Add('(PATRIMONIO_ID = :PATRIMONIO_ID)');

  IQuery.ParamByName('PATRIMONIO_ID').AsInteger := QTabela.FieldByName('PATRIMONIO_ID').AsInteger;

  IQuery.Prepare;
  IQuery.Open;

  if not IQuery.IsEmpty then
  begin
    Application.MessageBox('Bem com lançamento(s)', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  if Application.MessageBox('Deseja realmente excluir?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = IDYES then
  begin
    
    IQuery.Sql.Clear;
    IQuery.Sql.Add('DELETE FROM PATRIMONIO');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(PATRIMONIO_ID = :ID)');

    IQuery.ParamByName('ID').AsInteger := QTabela.FieldByName('PATRIMONIO_ID').AsInteger;

    IQuery.Prepare;
    IQuery.ExecSql;



    QTabela.Close;
    QTabela.Open;
    Set_Campos(False);
    Botoes_Normal;
  end;

  if QTabela.IsEmpty then
  begin
    QEmpresa.Close;
    QLocalizacao.Close;
    QConta_Imob.Close;
    QConta_Depr.Close;
  end;
end;

procedure TFrmPatrimonio.btnDiscardClick(Sender: TObject);
begin
  Botoes_Normal;
  Set_Campos(False);

  if QTabela.IsEmpty then
  begin
    QEmpresa.Close;
    QLocalizacao.Close;
    QConta_Imob.Close;
    QConta_Depr.Close;
  end;

  Habilitar(False);
  Operacao := '';
  Consulta.TabVisible := True;
end;

procedure TFrmPatrimonio.btnEditClick(Sender: TObject);
begin
  if FrmData.QAcesso.FieldByName('ALTERACAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para alteração', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  Operacao := 'Alterando';
  ID := QTabela.FieldByName('PATRIMONIO_ID').AsInteger;
  Botoes_Editing;
  Habilitar(True);

  Consulta.TabVisible := False;
  
  DESCRICAO.SetFocus;
end;

procedure TFrmPatrimonio.btnEmpresaClick(Sender: TObject);
begin
  try
    EMPRESA_ID.Value := GetConsulta('EMPRESAS', 0, 0, StrToInt(EMPRESA_ID.Text));
  except
    EMPRESA_ID.Value := GetConsulta('EMPRESAS', 0, 0, 0);
  end;
end;

procedure TFrmPatrimonio.btnInsertClick(Sender: TObject);
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
  QLocalizacao.Close;
  QConta_Imob.Close;
  QConta_Depr.Close;

  ESTADO.Text := '  ';

  Consulta.TabVisible := False;
  
  DESCRICAO.SetFocus;
end;

procedure TFrmPatrimonio.btnNextClick(Sender: TObject);
begin
  if not QTabela.Eof then
  begin
    QTabela.Next;
    Set_Campos(False);
  end;
  Botoes_Normal;
end;

procedure TFrmPatrimonio.btnPesquisaClick(Sender: TObject);
var
Condicao: String;
begin
  Condicao := GetPesquisa('PATRIMONIO');

  if Condicao <> '' then
  begin
    if FrmPrincipal.Config.FieldByName('VER_DESATIVADOS').AsString = 'True' then
      CmdSelectNull := Condicao
    else
      CmdSelectNull := Condicao + ' AND (STATUS = ' + #39 + 'A' + #39 + ')';
  end;

  CmdOrderBy := 'ORDER BY PATRIMONIO_ID';

  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

  QTabela.Prepare;
  QTabela.Open;

  Set_Campos(False);
  Botoes_Normal;
end;

procedure TFrmPatrimonio.btnPriorClick(Sender: TObject);
begin
  if not QTabela.Bof then
  begin
    QTabela.Prior;
    Set_Campos(False);
  end;
  Botoes_Normal;
end;

procedure TFrmPatrimonio.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPatrimonio.btnSaveClick(Sender: TObject);
begin
  DetailSearch('');

  if Validacao then
  begin
    if Operacao = 'Inserindo' then
    begin
      Insert;

      CmdSelectNull := 'WHERE (DESCRICAO = :DESCRICAO)';
      CmdOrderBy    := 'ORDER BY PATRIMONIO_ID';

      QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

      QTabela.ParamByName('DESCRICAO').AsString := DESCRICAO.Text;

      QTabela.Open;
      QTabela.Last;
    end
    else
      Edit;

    Set_Campos(False);

    if QTabela.IsEmpty then
    begin
      QEmpresa.Close;
      QLocalizacao.Close;
      QConta_Imob.Close;
      QConta_Depr.Close;
    end;

    Habilitar(False);
    Botoes_Normal;
    Operacao := '';
    Consulta.TabVisible := True;
  end;
end;

procedure TFrmPatrimonio.CONTA_ATIVOExit(Sender: TObject);
begin
  DetailSearch('Conta Imobilizado');
end;

procedure TFrmPatrimonio.CTA_DEPRECIACAOExit(Sender: TObject);
begin
  DetailSearch('Conta Depreciação');
end;

procedure TFrmPatrimonio.LOCALIZACAO_IDExit(Sender: TObject);
begin
  DetailSearch('Localização');
end;

procedure TFrmPatrimonio.DBGrid1DblClick(Sender: TObject);
begin
  Manutencao.Show;
end;

procedure TFrmPatrimonio.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F3) and (QTabela.FieldByName('STATUS').AsString = 'A') then
  begin
    ID := QTabela.FieldByName('PATRIMONIO_ID').AsInteger;



    IQuery.Sql.Clear;
    IQuery.Sql.Add('UPDATE PATRIMONIO SET STATUS = :STATUS');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(PATRIMONIO_ID = :PATRIMONIO_ID)');

    IQuery.ParamByName('STATUS').AsString         := 'D';
    IQuery.ParamByName('PATRIMONIO_ID').AsInteger := QTabela.FieldByName('PATRIMONIO_ID').AsInteger;

    IQuery.Prepare;
    IQuery.ExecSql;



    QTabela.Close;
    QTabela.Open;
    QTabela.Locate('PATRIMONIO_ID', ID, [loCaseInsensitive]);
  end;

  if (Key = Vk_F4) and (QTabela.FieldByName('STATUS').AsString = 'D') then
  begin
    ID := QTabela.FieldByName('PATRIMONIO_ID').AsInteger;


    IQuery.Sql.Clear;
    IQuery.Sql.Add('UPDATE PATRIMONIO SET STATUS = :STATUS');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(PATRIMONIO_ID = :PATRIMONIO_ID)');

    IQuery.ParamByName('STATUS').AsString         := 'A';
    IQuery.ParamByName('PATRIMONIO_ID').AsInteger := QTabela.FieldByName('PATRIMONIO_ID').AsInteger;

    IQuery.Prepare;
    IQuery.ExecSql;



    QTabela.Close;
    QTabela.Open;
    QTabela.Locate('PATRIMONIO_ID', ID, [loCaseInsensitive]);
  end;
end;

procedure TFrmPatrimonio.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Manutencao.Show;
end;

procedure TFrmPatrimonio.DBGrid1TitleClick(Column: TColumn);
begin
  CmdOrderBy := 'ORDER BY ' + Column.FieldName;

  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;
  
  QTabela.Open;
end;

procedure TFrmPatrimonio.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmPatrimonio.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (Operacao = 'Inserindo') or (Operacao = 'Alterando') then
  begin
    Application.MessageBox('É melhor salvar as alterações antes de continuar', PChar(Msg_Title), mb_IconStop);
    CanClose := False;
  end;
end;

procedure TFrmPatrimonio.FormCreate(Sender: TObject);
begin
  DBGrid1.Columns[0].Width := 64;
  DBGrid1.Columns[1].Width := 280;
  DBGrid1.Columns[2].Width := 100;
  DBGrid1.Columns[3].Width := 95;
  DBGrid1.Columns[4].Width := 95;
  DBGrid1.Columns[5].Width := 37;

  CmdSelect := QTabela.Sql.Text;

  if FrmPrincipal.Config.FieldByName('MOSTRAR_CADASTROS').AsString = 'True' then
  begin
    if FrmPrincipal.Config.FieldByName('VER_DESATIVADOS').AsString = 'True' then
      CmdSelectNull := 'WHERE (PATRIMONIO_ID IS NOT NULL)'
    else
      CmdSelectNull := 'WHERE (PATRIMONIO_ID IS NOT NULL) AND (STATUS = ' + #39 + 'A' + #39 + ')';
  end
  else
  begin
    if FrmPrincipal.Config.FieldByName('VER_DESATIVADOS').AsString = 'True' then
      CmdSelectNull := 'WHERE (PATRIMONIO_ID IS NULL)'
    else
      CmdSelectNull := 'WHERE (PATRIMONIO_ID IS NULL) AND (STATUS = ' + #39 + 'A' + #39 + ')';
  end;

  CmdOrderBy       := 'ORDER BY DESCRICAO';
  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;
  QTabela.Open;
end;

procedure TFrmPatrimonio.FormShow(Sender: TObject);
begin
  DBGrid1.SetFocus;
end;

end.
