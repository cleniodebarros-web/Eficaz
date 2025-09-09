unit UEmpresas_conexao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ComCtrls, ToolWin, StdCtrls, Grids, DBGrids, Tabs, ExtCtrls,
  DB, IBCustomDataSet, IBQuery, Mask, rxToolEdit, Buttons, rxCurrEdit,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmEmpresas = class(TForm)
    PageControl1: TPageControl;
    Panel1: TPanel;
    Consulta: TTabSheet;
    Manutencao: TTabSheet;
    Alfabeto: TTabSet;
    StatusBar1: TStatusBar;
    DBGrid1: TDBGrid;
    DataTabela: TDataSource;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label7: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label1: TLabel;
    RAZAO: TEdit;
    PROPRIETARIO: TEdit;
    COD_ATIVIDADE: TEdit;
    INSCR_MUNICIPAL: TEdit;
    INSCR_ESTADUAL: TEdit;
    ENDERECO: TEdit;
    NUMERO: TEdit;
    BAIRRO: TEdit;
    MUNICIPIO: TEdit;
    URL: TEdit;
    EMAIL: TEdit;
    DT_ULT_FOLHA: TDateEdit;
    DT_ULT_BALANCO: TDateEdit;
    CEP: TMaskEdit;
    ESTADO: TComboBox;
    TELEFONE: TMaskEdit;
    Label2: TLabel;
    CNPJ: TMaskEdit;
    btnRetorna: TBitBtn;
    Panel2: TPanel;
    btnPrior: TBitBtn;
    btnNext: TBitBtn;
    btnInsert: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    btnSave: TBitBtn;
    btnDiscard: TBitBtn;
    Label20: TLabel;
    TIPO_EMPRESA: TComboBox;
    Label21: TLabel;
    IBGE: TEdit;
    btnIBGE: TSpeedButton;
    Label22: TLabel;
    FANTASIA: TEdit;
    Label23: TLabel;
    CPF_DIRETOR: TMaskEdit;
    CRT: TComboBox;
    Label33: TLabel;
    SUFRAMA: TEdit;
    Label34: TLabel;
    Label57: TLabel;
    PIS: TRxCalcEdit;
    COFINS: TRxCalcEdit;
    btnAtividade: TSpeedButton;
    Label35: TLabel;
    CARGA: TComboBox;
    Label36: TLabel;
    btnlicenca: TButton;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Qibge: TFDQuery;
    IQuery: TFDQuery;
    QTabela: TFDQuery;
    Label41: TLabel;
    tipo_atividade: TComboBox;
    COD_EMPRESA_SPED: TEdit;
    CELULAR: TMaskEdit;
    PageControl2: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label15: TLabel;
    Label24: TLabel;
    CPF_CONTABILISTA: TMaskEdit;
    CONTABILISTA: TEdit;
    Label26: TLabel;
    END_CONTABILISTA: TEdit;
    Label28: TLabel;
    COMPL_CONTABILISTA: TEdit;
    Label30: TLabel;
    EMAIL_CONTABILISTA: TEdit;
    Label32: TLabel;
    IBGE_CONTABILISTA: TEdit;
    btnIBGE_Cont: TSpeedButton;
    Label40: TLabel;
    RNTRC: TEdit;
    Label31: TLabel;
    FONE_CONTABILISTA: TMaskEdit;
    Label29: TLabel;
    BAIRRO_CONTABILISTA: TEdit;
    Label27: TLabel;
    NUM_CONTABILISTA: TEdit;
    Label25: TLabel;
    CNPJ_CONTABILISTA: TMaskEdit;
    Label16: TLabel;
    CRC_CONTABILISTA: TEdit;
    Label42: TLabel;
    senha: TEdit;
    Label43: TLabel;
    usuario: TEdit;
    Label44: TLabel;
    ip: TEdit;
    Label45: TLabel;
    banco: TEdit;
    porta: TEdit;
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
    procedure TIPO_EMPRESAChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure TIPO_EMPRESAKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RAZAOKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnIBGEClick(Sender: TObject);
    procedure IBGEExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DT_ULT_FOLHAEnter(Sender: TObject);
    procedure btnIBGE_ContClick(Sender: TObject);
    procedure CRTChange(Sender: TObject);
    procedure PISKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure COFINSKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnAtividadeClick(Sender: TObject);
    procedure btnlicencaClick(Sender: TObject);
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
  FrmEmpresas: TFrmEmpresas;
  Operacao: String;
  ID: Integer;

implementation

uses
  UPrincipal, UData, UConsulta, UConsulta_CST, URegistrolicenca,UPasswordDlg;

{$R *.dfm}

procedure TFrmEmpresas.AlfabetoClick(Sender: TObject);
begin
  if Alfabeto.TabIndex <> 26 then
  begin
    if FrmPrincipal.Config.FieldByName('VER_DESATIVADOS').AsString = 'True' then
      CmdSelectNull := 'WHERE (RAZAO LIKE ' + #39 + Chr(Alfabeto.TabIndex + 65) + '%' + #39 + ')'
    else
      CmdSelectNull := 'WHERE (RAZAO LIKE ' + #39 + Chr(Alfabeto.TabIndex + 65) + '%' + #39 + ') AND (STATUS = ' + #39 + 'A' + #39 + ')';
  end
  else
  begin
    if FrmPrincipal.Config.FieldByName('VER_DESATIVADOS').AsString = 'True' then
      CmdSelectNull := 'WHERE (EMPRESA_ID IS NOT NULL)'
    else
      CmdSelectNull := 'WHERE (EMPRESA_ID IS NOT NULL) AND (STATUS = ' + #39 + 'A' + #39 + ')';
  end;

  CmdOrderBy := 'ORDER BY RAZAO';

  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

  QTabela.Open;
end;

procedure TFrmEmpresas.DetailSearch(Tabela: String);
begin
  if (Tabela = '') or (Tabela = 'IBGE') then
  begin
    QIBGE.Close;
    QIBGE.ParamByName('IBGE').AsString := IBGE.Text;
    QIBGE.Prepare;
    QIBGE.Open;
  end;
end;

procedure TFrmEmpresas.DT_ULT_FOLHAEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmEmpresas.Botoes_Editing;
begin
  btnPrior.Enabled     := False;
  btnNext.Enabled      := False;
  btnInsert.Enabled    := False;
  btnEdit.Enabled      := False;
  btnDelete.Enabled    := False;
  btnSave.Enabled      := True;
  btnDiscard.Enabled   := True;
  btnRetorna.Enabled   := False;
  btnIBGE.Enabled      := True;
  btnIBGE_Cont.Enabled := True;
  btnAtividade.Enabled := True;
  btnlicenca.Enabled   := True;
end;

procedure TFrmEmpresas.Botoes_Normal;
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

  btnSave.Enabled      := False;
  btnDiscard.Enabled   := False;
  btnRetorna.Enabled   := True;
  btnIBGE.Enabled      := False;
  btnIBGE_Cont.Enabled := False;
  btnAtividade.Enabled := False;
  btnLicenca.Enabled   := False;
end;

procedure TFrmEmpresas.Habilitar(Status: Boolean);
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

    if Temp is TRxCalcEdit then
      TCurrencyEdit(Temp).Enabled := Status;
  end;
end;

procedure TFrmEmpresas.IBGEExit(Sender: TObject);
begin
  DetailSearch('IBGE');
  MUNICIPIO.Text :=Qibge.FieldByName('DESCRICAO').AsString;
end;


procedure TFrmEmpresas.Insert;
var
I: Integer;
Temp: TComponent;
Sql, Par: String;
begin
  Sql := 'INSERT INTO EMPRESAS(';
  Par := '';

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
    begin
      if Sql = 'INSERT INTO EMPRESAS(' then
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
      if Sql = 'INSERT INTO EMPRESAS(' then
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
      if Sql = 'INSERT INTO EMPRESAS(' then
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
      if Sql = 'INSERT INTO EMPRESAS(' then
        Sql := Sql + TComboBox(Temp).Name
      else
        Sql := Sql + ', ' + TComboBox(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TComboBox(Temp).Name
      else
        Par := Par + ', :' + TComboBox(Temp).Name;
    end;

    if Temp is TRxCalcEdit then
    begin
      if Sql = 'INSERT INTO EMPRESAS(' then
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

    if Temp is TRxCalcEdit then
      IQuery.ParamByName(TRxCalcEdit(Temp).Name).AsFloat := TRxCalcEdit(Temp).Value;
  end;

  IQuery.Prepare;
  IQuery.ExecSql;


  Habilitar(False);
end;

procedure TFrmEmpresas.Edit;
var
I: Integer;
Temp: TComponent;
Sql: String;
begin
  Sql := 'UPDATE EMPRESAS SET ';

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
    begin
      if Sql = 'UPDATE EMPRESAS SET ' then
        Sql := Sql + TEdit(Temp).Name + ' = :' + TEdit(Temp).Name
      else
        Sql := Sql + ', ' + TEdit(Temp).Name + ' = :' + TEdit(Temp).Name;
    end;

    if Temp is TMaskEdit then
    begin
      if Sql = 'UPDATE EMPRESAS SET ' then
        Sql := Sql + TMaskEdit(Temp).Name + ' = :' + TMaskEdit(Temp).Name
      else
        Sql := Sql + ', ' + TMaskEdit(Temp).Name + ' = :' + TMaskEdit(Temp).Name;
    end;

    if Temp is TDateEdit then
    begin
      if Sql = 'UPDATE EMPRESAS SET ' then
        Sql := Sql + TDateEdit(Temp).Name + ' = :' + TDateEdit(Temp).Name
      else
        Sql := Sql + ', ' + TDateEdit(Temp).Name + ' = :' + TDateEdit(Temp).Name;
    end;

    if Temp is TComboBox then
    begin
      if Sql = 'UPDATE EMPRESAS SET ' then
        Sql := Sql + TComboBox(Temp).Name + ' = :' + TComboBox(Temp).Name
      else
        Sql := Sql + ', ' + TComboBox(Temp).Name + ' = :' + TComboBox(Temp).Name;
    end;

    if Temp is TRxCalcEdit then
    begin
      if Sql = 'UPDATE EMPRESAS SET ' then
        Sql := Sql + TRxCalcEdit(Temp).Name + ' = :' + TRxCalcEdit(Temp).Name
      else
        Sql := Sql + ', ' + TRxCalcEdit(Temp).Name + ' = :' + TRxCalcEdit(Temp).Name;
    end;
  end;

  Sql := Sql + ' WHERE (EMPRESA_ID = :ID)';

  

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

    if Temp is TRxCalcEdit then
      IQuery.ParamByName(TRxCalcEdit(Temp).Name).AsFloat := TRxCalcEdit(Temp).Value;
  end;

  IQuery.ParamByName('ID').AsInteger := QTabela.FieldByName('EMPRESA_ID').AsInteger;

  IQuery.Prepare;
  IQuery.ExecSql;


  QTabela.Close;
  QTabela.Open;
  QTabela.Locate('EMPRESA_ID', ID, [loCaseInsensitive]);
  Habilitar(False);
end;

function TFrmEmpresas.Validacao: Boolean;
var
LibHandle: THandle;
ConsisteInscricaoEstadual: TConsisteInscricaoEstadual;
begin
  Result := False;

  CNPJ.Color              := clWindow;
  TIPO_EMPRESA.Color      := clWindow;
  ESTADO.Color            := clWindow;
  INSCR_ESTADUAL.Color    := clWindow;
  RAZAO.Color             := clWindow;
  ENDERECO.Color          := clWindow;
  NUMERO.Color            := clWindow;
  BAIRRO.Color            := clWindow;
  IBGE.Color              := clWindow;
  EMAIL.Color             := clWindow;
  CPF_DIRETOR.Color       := clWindow;
  CPF_CONTABILISTA.Color  := clWindow;
  CNPJ_CONTABILISTA.Color := clWindow;
  CRT.Color               := clWindow;
  COD_ATIVIDADE.Color     := clWindow;

  if COD_ATIVIDADE.Text <> '' then
  begin
    IQuery.Sql.Clear;
    IQuery.Sql.Add('SELECT * FROM CNAE');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(SUBCLASSE = :SUBCLASSE)');

    IQuery.ParamByName('SUBCLASSE').AsString := COD_ATIVIDADE.Text;

    IQuery.Prepare;
    IQuery.Open;

    if IQuery.IsEmpty then
    begin
      Application.MessageBox('Atividade Empresa inexistente', PChar(Msg_Title), mb_IconStop);

      COD_ATIVIDADE.Color := clYellow;
      COD_ATIVIDADE.SetFocus;

      exit;
    end;
  end;

  if (Operacao = 'Inserindo') and (Alltrim(SemMascara(CNPJ.Text)) <> '') then
  begin
    IQuery.Sql.Clear;
    IQuery.Sql.Add('SELECT * FROM EMPRESAS');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(CNPJ = :CNPJ)');

    IQuery.ParamByName('CNPJ').AsString := CNPJ.Text;

    IQuery.Prepare;
    IQuery.Open;

    if not IQuery.IsEmpty then
    begin
      Application.MessageBox('Já existe um CPF/CNPJ com este número cadastrado', PChar(Msg_Title), mb_IconStop);

      CNPJ.Color := clYellow;
      CNPJ.SetFocus;

      exit;
    end;
  end;

  if (Operacao = 'Alterando') and (Alltrim(SemMascara(CNPJ.Text)) <> '') then
  begin
    IQuery.Sql.Clear;
    IQuery.Sql.Add('SELECT * FROM EMPRESAS');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(CNPJ = :CNPJ)');
    IQuery.Sql.Add('AND (EMPRESA_ID <> :EMPRESA_ID)');

    IQuery.ParamByName('CNPJ').AsString := CNPJ.Text;
    IQuery.ParamByName('EMPRESA_ID').AsInteger := QTabela.FieldByName('EMPRESA_ID').AsInteger;

    IQuery.Prepare;
    IQuery.Open;

    if not IQuery.IsEmpty then
    begin
      Application.MessageBox('Já existe UM CPF/CNPJ com este número cadastrado', PChar(Msg_Title), mb_IconStop);

      CNPJ.Color := clYellow;
      CNPJ.SetFocus;

      exit;
    end;
  end;

  if RAZAO.Text = '' then
  begin
    Application.MessageBox('Razão Social inválida', PChar(Msg_Title), mb_IconStop);

    RAZAO.Color := clYellow;
    RAZAO.SetFocus;

    exit;
  end;

  if (TIPO_EMPRESA.Text <> 'PESSOA FÍSICA') and (TIPO_EMPRESA.Text <> 'PESSOA JURÍDICA') then
  begin
    Application.MessageBox('Tipo Empresa inválido', PChar(Msg_Title), mb_IconStop);

    TIPO_EMPRESA.Color := clYellow;
    TIPO_EMPRESA.SetFocus;

    exit;
  end;

  if not ValidCpf(StrZero(SemMascara(CPF_DIRETOR.Text), 11, 0)) then
  begin
    Application.MessageBox('Dígito Verificador do CPF do diretor inválido', PChar(Msg_Title), mb_IconStop);

    CPF_DIRETOR.Color := clYellow;
    CPF_DIRETOR.SetFocus;

    exit;
  end;

  if TIPO_EMPRESA.Text = 'PESSOA FÍSICA' then
  begin
    if Alltrim(SemMascara(CNPJ.Text)) = '' then
    begin
      Application.MessageBox('CPF inválido', PChar(Msg_Title), mb_IconStop);

      CNPJ.Color := clYellow;
      CNPJ.SetFocus;

      exit;
    end;

    if not ValidCpf(StrZero(SemMascara(CNPJ.Text), 11, 0)) then
    begin
      Application.MessageBox('Dígito Verificador do CPF inválido', PChar(Msg_Title), mb_IconStop);

      CNPJ.Color := clYellow;
      CNPJ.SetFocus;

      exit;
    end;
  end
  else
  begin
    if Alltrim(SemMascara(CNPJ.Text)) = '' then
    begin
      Application.MessageBox('CNPJ inválido', PChar(Msg_Title), mb_IconStop);

      CNPJ.Color := clYellow;
      CNPJ.SetFocus;

      exit;
    end;

    if not ValidCgc(StrZero(SemMascara(CNPJ.Text), 14, 0)) then
    begin
      Application.MessageBox('Dígito Verificador do CNPJ inválido', PChar(Msg_Title), mb_IconStop);

      CNPJ.Color := clYellow;
      CNPJ.SetFocus;

      exit;
    end;

    if Alltrim(SemMascara(INSCR_ESTADUAL.Text)) <> '' then
    begin
      LibHandle := LoadLibrary(PChar(Trim('DllInscE32.Dll')));

      try
        if  LibHandle <= HINSTANCE_ERROR then
          raise Exception.Create ('Dll não carregada');

        @ConsisteInscricaoEstadual := GetProcAddress(LibHandle, 'ConsisteInscricaoEstadual');

        if  @ConsisteInscricaoEstadual  = nil then
          raise Exception.Create('Entrypoint Download não encontrado na Dll');

        if ConsisteInscricaoEstadual(Alltrim(SemMascara(INSCR_ESTADUAL.Text)), ESTADO.Text) = 1 then
        begin
          Application.MessageBox('Inscrição Estadual inválida', PChar(Msg_Title), mb_IconStop);

          INSCR_ESTADUAL.Color := clYellow;
          INSCR_ESTADUAL.SetFocus;

          exit;
        end;
      finally
        FreeLibrary(LibHandle);
      end;
    end;
  end;

  if ENDERECO.Text = '' then
  begin
    Application.MessageBox('Endereço inválido', PChar(Msg_Title), mb_IconStop);

    ENDERECO.Color := clYellow;
    ENDERECO.SetFocus;

    exit;
  end;

  if NUMERO.Text = '' then
  begin
    Application.MessageBox('Número inválido', PChar(Msg_Title), mb_IconStop);

    NUMERO.Color := clYellow;
    NUMERO.SetFocus;

    exit;
  end;

  if BAIRRO.Text = '' then
  begin
    Application.MessageBox('Bairro inválido', PChar(Msg_Title), mb_IconStop);

    BAIRRO.Color := clYellow;
    BAIRRO.SetFocus;

    exit;
  end;

  if QIBGE.IsEmpty then
  begin
    Application.MessageBox('IBGE inexistente', PChar(Msg_Title), mb_IconStop);

    IBGE.Color := clYellow;
    IBGE.SetFocus;

    exit;
  end;

  if not ChecaEstado(ESTADO.Text) then
  begin
    Application.MessageBox('Estado inválido', PChar(Msg_Title), mb_IconStop);

    ESTADO.Color := clYellow;
    ESTADO.SetFocus;

    exit;
  end;

  if (CRT.Text <> '1 - SIMPLES NACIONAL') and (CRT.Text <> '2 - SIMPLES NACIONAL - EXC. REC. BRUTA') and (CRT.Text <> '3 - REGIME NORMAL - LUCRO PRESUMIDO') and (CRT.Text <> '4 - REGIME NORMAL - LUCRO REAL') then
  begin
    Application.MessageBox('Regime Tributário inválido', PChar(Msg_Title), mb_IconStop);

    CRT.Color := clYellow;
    CRT.SetFocus;

    exit;
  end;

  if (EMAIL.Text <> '') and (not ValidaEmail(PChar(EMAIL.Text))) then
  begin
    Application.MessageBox('e-mail Inválido', PChar(Msg_Title), mb_IconStop);

    EMAIL.Color := clYellow;
    EMAIL.SetFocus;

    exit;
  end;

  if not ValidCpf(StrZero(SemMascara(CPF_CONTABILISTA.Text), 11, 0)) then
  begin
    Application.MessageBox('Dígito Verificador do CPF do contabilista inválido', PChar(Msg_Title), mb_IconStop);

    CPF_CONTABILISTA.Color := clYellow;
    CPF_CONTABILISTA.SetFocus;

    exit;
  end;

  if not ValidCgc(StrZero(SemMascara(CNPJ_CONTABILISTA.Text), 14, 0)) then
  begin
    Application.MessageBox('Dígito Verificador do CNPJ do contabilista inválido', PChar(Msg_Title), mb_IconStop);

    CNPJ_CONTABILISTA.Color := clYellow;
    CNPJ_CONTABILISTA.SetFocus;

    exit;
  end;

  Result := True;
end;

procedure TFrmEmpresas.ManutencaoShow(Sender: TObject);
begin
  Set_Campos(False);
  Botoes_Normal;
  if FrmPrincipal.QEmpresa.FieldByName('LICENCA').AsString <> '' then
  Begin
    Label37.Visible := True;
    Label37.Caption := 'Contrato: ' + (Copy(DecryptMsg(FrmPrincipal.QEmpresa.FieldByName('LICENCA').AsString,65),29,3));
    Label38.Visible := True;
    Label38.Caption := 'Conectados: ' + IntToStr(usuarios);
  End
  Else
  Begin
  Label37.Visible := False;
  Label38.Visible := False;
  End;

end;

procedure TFrmEmpresas.PISKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmEmpresas.RAZAOKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = IBGE) then
    btnIBGEClick(Self);

  if (Key = Vk_F7) and (Sender = IBGE_CONTABILISTA) then
    btnIBGE_ContClick(Self);

  if (Key = Vk_F7) and (Sender = COD_ATIVIDADE) then
    btnAtividadeClick(Self);

  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmEmpresas.Set_Campos(Vazio: Boolean);
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

      if Temp is TRxCalcEdit then
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

      if Temp is TRxCalcEdit then
        TRxCalcEdit(Temp).Value := QTabela.FieldByName(TRxCalcEdit(Temp).Name).AsFloat;

      if QTabela.FieldByName('TIPO_EMPRESA').AsString = 'PESSOA JURÍDICA' then
        CNPJ.EditMask := '99.999.999/9999-99;1;_'
      else
        CNPJ.EditMask := '999.999.999-99;1;_';
    end;
  end;
end;

procedure TFrmEmpresas.TIPO_EMPRESAChange(Sender: TObject);
begin
  if TIPO_EMPRESA.Text = 'PESSOA JURÍDICA' then
    CNPJ.EditMask := '99.999.999/9999-99;1;_'
  else
    CNPJ.EditMask := '999.999.999-99;1;_';
end;

procedure TFrmEmpresas.TIPO_EMPRESAKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmEmpresas.btnAtividadeClick(Sender: TObject);
begin
  COD_ATIVIDADE.Text := GetConsulta_CST('CNAE', COD_ATIVIDADE.Text);

  if Length(COD_ATIVIDADE.Text) <> 9 then
    COD_ATIVIDADE.Text := '';
end;

procedure TFrmEmpresas.btnDeleteClick(Sender: TObject);
begin
  if FrmData.QAcesso.FieldByName('EXCLUSAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para exclusão', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  if Application.MessageBox('Deseja realmente excluir?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = IDYES then
  begin
    

    IQuery.Sql.Clear;
    IQuery.Sql.Add('DELETE FROM EMPRESAS');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(EMPRESA_ID = :ID)');

    IQuery.ParamByName('ID').AsInteger := QTabela.FieldByName('EMPRESA_ID').AsInteger;

    IQuery.Prepare;
    IQuery.ExecSql;



    QTabela.Close;
    QTabela.Open;

    Set_Campos(False);
    Botoes_Normal;
  end;
end;

procedure TFrmEmpresas.btnDiscardClick(Sender: TObject);
begin
  Botoes_Normal;
  Set_Campos(False);
  Habilitar(False);
  Operacao := '';
  Consulta.TabVisible := True;
end;

procedure TFrmEmpresas.btnEditClick(Sender: TObject);
begin
Application.CreateForm(TFrmPasswordDlg, FrmPasswordDlg);
  try
    if FrmPasswordDlg.ShowModal = mrOk then
    begin
      if FrmPasswordDlg.Password.Text = Senha_Versao then
      begin
        if FrmData.QAcesso.FieldByName('ALTERACAO').AsString = 'NÃO' then
        begin
          Application.MessageBox('Usuário sem permissão para alteração', PChar(Msg_Title), mb_IconStop);
          exit;
        end;
        Operacao := 'Alterando';

        ID := QTabela.FieldByName('EMPRESA_ID').AsInteger;
        Botoes_Editing;
        Habilitar(True);

        Consulta.TabVisible := False;

        RAZAO.SetFocus;
      end
      Else
      Application.MessageBox('Senha inválida', PChar(Msg_Title), mb_IconStop);
    end;
  finally
  FrmPasswordDlg.Release;
  end;
end;

procedure TFrmEmpresas.btnIBGEClick(Sender: TObject);
begin
  try
    IBGE.Text := IntToStr(GetConsulta('IBGE', 0, 0, StrToInt(IBGE.Text)));
  except
    IBGE.Text := IntToStr(GetConsulta('IBGE', 0, 0, 0));
  end;
end;

procedure TFrmEmpresas.btnIBGE_ContClick(Sender: TObject);
begin
  try
    IBGE_CONTABILISTA.Text := IntToStr(GetConsulta('IBGE', 0, 0, StrToInt(IBGE_CONTABILISTA.Text)));
  except
    IBGE_CONTABILISTA.Text := IntToStr(GetConsulta('IBGE', 0, 0, 0));
  end;
end;

procedure TFrmEmpresas.btnInsertClick(Sender: TObject);
begin
Application.CreateForm(TFrmPasswordDlg, FrmPasswordDlg);
  try
    if FrmPasswordDlg.ShowModal = mrOk then
    begin
      if FrmPasswordDlg.Password.Text = Senha_Suporte then
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

        ESTADO.Text := '  ';
        TIPO_EMPRESA.Text := 'PESSOA JURÍDICA';
        CNPJ.EditMask := '99.999.999/9999-99;1;_';

        Consulta.TabVisible := False;

        RAZAO.SetFocus;
      end
      Else
      Application.MessageBox('Senha inválida', PChar(Msg_Title), mb_IconStop);
    end;
  finally
  FrmPasswordDlg.Release;
  end;
end;

procedure TFrmEmpresas.btnNextClick(Sender: TObject);
begin
  if not QTabela.Eof then
  begin
    QTabela.Next;
    Set_Campos(False);
  end;
  Botoes_Normal;
end;

procedure TFrmEmpresas.btnPriorClick(Sender: TObject);
begin
  if not QTabela.Bof then
  begin
    QTabela.Prior;
    Set_Campos(False);
  end;

  Botoes_Normal;
end;

procedure TFrmEmpresas.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmEmpresas.btnSaveClick(Sender: TObject);
begin
  DetailSearch('');

  MUNICIPIO.Text := QIBGE.FieldByName('DESCRICAO').AsString;

  if Validacao then
  begin
    if Operacao = 'Inserindo' then
    begin

      Insert;

      CmdSelectNull := 'WHERE (RAZAO = :RAZAO)';
      CmdOrderBy    := 'ORDER BY EMPRESA_ID';

      QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

      QTabela.ParamByName('RAZAO').AsString := RAZAO.Text;

      QTabela.Open;
      QTabela.Last;
    end
    else
      Edit;

    FrmPrincipal.QEmpresa.Close;

    FrmPrincipal.QEmpresa.Prepare;
    FrmPrincipal.QEmpresa.Open;

    Set_Campos(False);
    Habilitar(False);
    Botoes_Normal;
    Operacao := '';
    Consulta.TabVisible := True;
  end;
end;

procedure TFrmEmpresas.btnlicencaClick(Sender: TObject);
begin
Application.CreateForm(TFrmPasswordDlg, FrmPasswordDlg);
  try
    if FrmPasswordDlg.ShowModal = mrOk then
    begin
      if FrmPasswordDlg.Password.Text = Senha_Suporte then
      begin
       Application.CreateForm(TFrmRegistrolicenca, FrmRegistrolicenca);
      try
        FrmRegistrolicenca.ShowModal;
      finally
        FrmRegistrolicenca.Release;
      end;
       Application.Terminate;
      end
      else
        Application.MessageBox('Acesso negado', PChar(Msg_Title), mb_IconStop);
    end;
  finally
    FrmPasswordDlg.Release;
  end;
end;

procedure TFrmEmpresas.COFINSKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmEmpresas.CRTChange(Sender: TObject);
begin
  if CRT.Text = '3 - REGIME NORMAL - LUCRO PRESUMIDO' then
  begin
    PIS.Value    := 0.65;
    COFINS.Value := 3;
  end
  else if CRT.Text = '4 - REGIME NORMAL - LUCRO REAL' then
  begin
    PIS.Value    := 1.65;
    COFINS.Value := 7.6;
  end
  else
  begin
    PIS.Value    := 0;
    COFINS.Value := 0;
  end;
end;

procedure TFrmEmpresas.DBGrid1DblClick(Sender: TObject);
begin
  Manutencao.Show;
end;

procedure TFrmEmpresas.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F3) and (QTabela.FieldByName('STATUS').AsString = 'A') then
  begin
    ID := QTabela.FieldByName('EMPRESA_ID').AsInteger;

    
    IQuery.Sql.Clear;
    IQuery.Sql.Add('UPDATE EMPRESAS SET STATUS = :STATUS');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(EMPRESA_ID = :EMPRESA_ID)');

    IQuery.ParamByName('STATUS').AsString      := 'D';
    IQuery.ParamByName('EMPRESA_ID').AsInteger := QTabela.FieldByName('EMPRESA_ID').AsInteger;

    IQuery.Prepare;
    IQuery.ExecSql;



    QTabela.Close;
    QTabela.Open;
    QTabela.Locate('EMPRESA_ID', ID, [loCaseInsensitive]);
  end;

  if (Key = Vk_F4) and (QTabela.FieldByName('STATUS').AsString = 'D') then
  begin
    ID := QTabela.FieldByName('EMPRESA_ID').AsInteger;



    IQuery.Sql.Clear;
    IQuery.Sql.Add('UPDATE EMPRESAS SET STATUS = :STATUS');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(EMPRESA_ID = :EMPRESA_ID)');

    IQuery.ParamByName('STATUS').AsString      := 'A';
    IQuery.ParamByName('EMPRESA_ID').AsInteger := QTabela.FieldByName('EMPRESA_ID').AsInteger;

    IQuery.Prepare;
    IQuery.ExecSql;


    QTabela.Close;
    QTabela.Open;
    QTabela.Locate('EMPRESA_ID', ID, [loCaseInsensitive]);
  end;
end;

procedure TFrmEmpresas.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Manutencao.Show;
end;

procedure TFrmEmpresas.DBGrid1TitleClick(Column: TColumn);
begin
  CmdOrderBy := 'ORDER BY ' + Column.FieldName;

  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;
  
  QTabela.Open;
end;

procedure TFrmEmpresas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmEmpresas.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (Operacao = 'Inserindo') or (Operacao = 'Alterando') then
  begin
    Application.MessageBox('É melhor salvar as alterações antes de continuar', PChar(Msg_Title), mb_IconStop);
    CanClose := False;
  end;
end;

procedure TFrmEmpresas.FormCreate(Sender: TObject);
begin
  DBGrid1.Columns[0].Width := 45;
  DBGrid1.Columns[1].Width := 115;
  DBGrid1.Columns[2].Width := 259;
  DBGrid1.Columns[3].Width := 112;
  DBGrid1.Columns[4].Width := 100;
  DBGrid1.Columns[5].Width := 40;

  CmdSelect := QTabela.Sql.Text;

  if FrmPrincipal.Config.FieldByName('MOSTRAR_CADASTROS').AsString = 'True' then
  begin
    if FrmPrincipal.Config.FieldByName('VER_DESATIVADOS').AsString = 'True' then
      CmdSelectNull := 'WHERE (EMPRESA_ID IS NOT NULL)'
    else
      CmdSelectNull := 'WHERE (EMPRESA_ID IS NOT NULL) AND (STATUS = ' + #39 + 'A' + #39 + ')';
  end
  else
  begin
    if FrmPrincipal.Config.FieldByName('VER_DESATIVADOS').AsString = 'True' then
      CmdSelectNull := 'WHERE (EMPRESA_ID IS NULL)'
    else
      CmdSelectNull := 'WHERE (EMPRESA_ID IS NULL) AND (STATUS = ' + #39 + 'A' + #39 + ')';
  end;

  CmdOrderBy := 'ORDER BY RAZAO';

  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

  QTabela.Open;
  Consulta.Show;
end;

procedure TFrmEmpresas.FormShow(Sender: TObject);
begin
  DBGrid1.SetFocus;
end;

end.
