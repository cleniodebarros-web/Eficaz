unit USoftware_House;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ComCtrls, ToolWin, StdCtrls, Grids, DBGrids, Tabs, ExtCtrls,
  DB, IBCustomDataSet, IBQuery, Mask, rxToolEdit, Buttons, rxCurrEdit,IdHashMessageDigest,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmSoftware_House = class(TForm)
    Panel1: TPanel;
    DataTabela: TDataSource;
    btnRetorna: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel2: TPanel;
    btnEdit: TBitBtn;
    btnSave: TBitBtn;
    btnDiscard: TBitBtn;
    VERSAO_ER: TEdit;
    COD_MD5: TEdit;
    CNPJ: TMaskEdit;
    NOME_PAF: TEdit;
    INSCR_MUNICIPAL: TEdit;
    INSCR_ESTADUAL: TEdit;
    NOME: TEdit;
    Label13: TLabel;
    Label6: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label15: TLabel;
    VERSAO_PAF: TEdit;
    Label23: TLabel;
    Label1: TLabel;
    TELEFONE: TMaskEdit;
    Label5: TLabel;
    ENDERECO: TEdit;
    Label7: TLabel;
    CONTATO: TEdit;
    IQuery: TFDQuery;
    QTabela: TFDQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRetornaClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDiscardClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure ManutencaoShow(Sender: TObject);
    procedure AlfabetoClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure NOMEKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CmdSelect: String;
    procedure Botoes_Editing;
    procedure Botoes_Normal;
    procedure Habilitar(Status: Boolean);
    procedure Set_Campos(Vazio: Boolean);
    procedure Edit;
    function Validacao: Boolean;
    procedure Gera_Md5;
  end;

var
  FrmSoftware_House: TFrmSoftware_House;
  Operacao: String;

implementation

uses
  UPrincipal, UData;

{$R *.dfm}

function LogEntry(Cmd, Msg,Dig: String): String;
begin
  Result := Format('%s%s' + '%s', [Cmd, Msg, Dig]);
end;

procedure TFrmSoftware_House.Gera_Md5;
var
X: Integer;
Linhas: TStringList;
Md5 : TIdHashMessageDigest5;

begin
  Md5 :=  TIdHashMessageDigest5.Create;
  try
    IQuery.Sql.Clear;
    IQuery.Sql.Add('SELECT * FROM SOFTWARE_HOUSE');

    IQuery.Prepare;
    IQuery.Open;

    Linhas := TStringList.Create;

    for X := 0 to (IQuery.FieldCount - 1) do
    begin
      if IQuery.Fields[X].FieldName <> 'MD5' then     
        Linhas.Add(IQuery.Fields[X].AsString);
    end;

    IQuery.Sql.Clear;
    IQuery.Sql.Add('UPDATE SOFTWARE_HOUSE SET MD5 = :MD5');

    IQuery.ParamByName('MD5').AsString       := LowerCase(LogEntry('', '', MD5.HashStringAsHex(Linhas.Text)));

    IQuery.Prepare;
    IQuery.ExecSql;


  finally
    Linhas.Free;
  end;
end;

procedure TFrmSoftware_House.AlfabetoClick(Sender: TObject);
begin
  QTabela.Sql.Text := CmdSelect;
  QTabela.Open;
end;

procedure TFrmSoftware_House.Botoes_Editing;
begin
  btnEdit.Enabled     := False;
  btnSave.Enabled     := True;
  btnDiscard.Enabled  := True;
  btnRetorna.Enabled  := False;
end;

procedure TFrmSoftware_House.Botoes_Normal;
begin
  if not QTabela.IsEmpty then
    btnEdit.Enabled := True
  else
    btnEdit.Enabled := False;

  btnSave.Enabled     := False;
  btnDiscard.Enabled  := False;
  btnRetorna.Enabled  := True;
end;

procedure TFrmSoftware_House.Habilitar(Status: Boolean);
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

    if Temp is TComboBox then
      TComboBox(Temp).Enabled := Status;

    if Temp is TRxCalcEdit then
      TRxCalcEdit(Temp).Enabled := Status;
  end;
end;

procedure TFrmSoftware_House.Edit;
var
I: Integer;
Temp: TComponent;
Sql: String;
begin
  Sql := 'UPDATE SOFTWARE_HOUSE SET ';

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
    begin
      if Sql = 'UPDATE SOFTWARE_HOUSE SET ' then
        Sql := Sql + TEdit(Temp).Name + ' = :' + TEdit(Temp).Name
      else
        Sql := Sql + ', ' + TEdit(Temp).Name + ' = :' + TEdit(Temp).Name;
    end;

    if Temp is TMaskEdit then
    begin
      if Sql = 'UPDATE SOFTWARE_HOUSE SET ' then
        Sql := Sql + TMaskEdit(Temp).Name + ' = :' + TMaskEdit(Temp).Name
      else
        Sql := Sql + ', ' + TMaskEdit(Temp).Name + ' = :' + TMaskEdit(Temp).Name;
    end;

    if Temp is TComboBox then
    begin
      if Sql = 'UPDATE SOFTWARE_HOUSE SET ' then
        Sql := Sql + TComboBox(Temp).Name + ' = :' + TComboBox(Temp).Name
      else
        Sql := Sql + ', ' + TComboBox(Temp).Name + ' = :' + TComboBox(Temp).Name;
    end;

    if Temp is TRxCalcEdit then
    begin
      if Sql = 'UPDATE SOFTWARE_HOUSE SET ' then
        Sql := Sql + TRxCalcEdit(Temp).Name + ' = :' + TRxCalcEdit(Temp).Name
      else
        Sql := Sql + ', ' + TRxCalcEdit(Temp).Name + ' = :' + TRxCalcEdit(Temp).Name;
    end;
  end;



  IQuery.Sql.Clear;
  IQuery.Sql.Add(Sql);

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
      IQuery.ParamByName(TEdit(Temp).Name).AsString := TEdit(Temp).Text;

    if Temp is TMaskEdit then
      IQuery.ParamByName(TMaskEdit(Temp).Name).AsString := TMaskEdit(Temp).Text;

    if Temp is TComboBox then
      IQuery.ParamByName(TComboBox(Temp).Name).AsString := TComboBox(Temp).Text;

    if Temp is TRxCalcEdit then
      IQuery.ParamByName(TRxCalcEdit(Temp).Name).AsFloat := TRxCalcEdit(Temp).Value;
  end;

  IQuery.Prepare;
  IQuery.ExecSql;



  QTabela.Close;
  QTabela.Open;

  Habilitar(False);
end;

function TFrmSoftware_House.Validacao: Boolean;
begin
  Result := False;

  NOME.Color := clWindow;
  CNPJ.Color := clWindow;

  if NOME.Text = '' then
  begin
    Application.MessageBox('Nome inválido', PChar(Msg_Title), mb_IconStop);

    NOME.Color := clYellow;
    NOME.SetFocus;

    exit;
  end;

  if Alltrim(SemMascara(CNPJ.Text)) = '' then
  begin
    Application.MessageBox('CNPJ inválido', PChar(Msg_Title), mb_IconStop);

    CNPJ.Color := clYellow;
    CNPJ.SetFocus;

    exit;
  end;

  Result := True;
end;

procedure TFrmSoftware_House.ManutencaoShow(Sender: TObject);
begin
  Set_Campos(False);
  Botoes_Normal;
end;

procedure TFrmSoftware_House.NOMEKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmSoftware_House.Set_Campos(Vazio: Boolean);
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

      if Temp is TComboBox then
        TComboBox(Temp).Text := '';

      if Temp is TDateEdit then
        TDateEdit(Temp).Text := '';

      if Temp is TRxCalcEdit then
        TRxCalcEdit(Temp).Value := 0;
    end
    else
    begin
      if Temp is TEdit then
        TEdit(Temp).Text := QTabela.FieldByName(TEdit(Temp).Name).AsString;

      if Temp is TMaskEdit then
        TMaskEdit(Temp).Text := QTabela.FieldByName(TMaskEdit(Temp).Name).AsString;

      if Temp is TComboBox then
        TComboBox(Temp).Text := QTabela.FieldByName(TComboBox(Temp).Name).AsString;

      if Temp is TDateEdit then
        TDateEdit(Temp).Date := QTabela.FieldByName(TDateEdit(Temp).Name).AsDateTime;

      if Temp is TRxCalcEdit then
        TRxCalcEdit(Temp).Value := QTabela.FieldByName(TRxCalcEdit(Temp).Name).AsFloat;
    end;
  end;
end;

procedure TFrmSoftware_House.btnDiscardClick(Sender: TObject);
begin
  Botoes_Normal;
  Set_Campos(False);
  Habilitar(False);
  Operacao := '';
end;

procedure TFrmSoftware_House.btnEditClick(Sender: TObject);
begin
  if FrmData.QAcesso.FieldByName('ALTERACAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para alteração', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  Operacao := 'Alterando';

  Botoes_Editing;
  Habilitar(True);

  NOME.SetFocus;
end;

procedure TFrmSoftware_House.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmSoftware_House.btnSaveClick(Sender: TObject);
begin
  if Validacao then
  begin
    Edit;

    Gera_Md5;

    Set_Campos(False);
    Habilitar(False);
    Botoes_Normal;
    Operacao := '';
  end;
end;

procedure TFrmSoftware_House.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmSoftware_House.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (Operacao = 'Inserindo') or (Operacao = 'Alterando') then
  begin
    Application.MessageBox('É melhor salvar as alterações antes de continuar', PChar(Msg_Title), mb_IconStop);
    CanClose := False;
  end;
end;

procedure TFrmSoftware_House.FormCreate(Sender: TObject);
begin
  CmdSelect := QTabela.Sql.Text;

  QTabela.Sql.Text := CmdSelect;
  QTabela.Open;
end;

procedure TFrmSoftware_House.FormShow(Sender: TObject);
begin
  Botoes_Normal;
  Set_Campos(False);
  Habilitar(False);
  Operacao := '';

  btnEdit.SetFocus;
end;

end.
