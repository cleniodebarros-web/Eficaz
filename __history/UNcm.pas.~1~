unit UNcm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ComCtrls, ToolWin, StdCtrls, Grids, DBGrids, Tabs, ExtCtrls,
  DB, IBCustomDataSet, IBQuery, Mask, Buttons, rxToolEdit,
  rxCurrEdit, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  ACBrBase, ACBrSocket, ACBrNCMs, sEdit;

type
  TFrmNcm = class(TForm)
    PageControl1: TPageControl;
    Panel1: TPanel;
    Consulta: TTabSheet;
    Manutencao: TTabSheet;
    DBGrid1: TDBGrid;
    DataTabela: TDataSource;
    NCM: TEdit;
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
    DESC_TIPI: TEdit;
    DESCRICAO: TMemo;
    QtABELA: TFDQuery;
    IQuery: TFDQuery;
    ACBrNCMs1: TACBrNCMs;
    BitBtn1: TBitBtn;
    lbUltAtualizacao: TLabel;
    lbNumRegistros: TLabel;
    QInsert: TFDQuery;
    pCarregando: TPanel;
    BitBtn2: TBitBtn;
    Ncm_Validar: TsEdit;
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
    procedure NCMKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PRECOKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
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
  end;

var
  FrmNcm: TFrmNcm;
  Operacao, ID: String;

implementation

uses
  UPrincipal, UData;

{$R *.dfm}

procedure TFrmNcm.PRECOKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmNcm.BitBtn1Click(Sender: TObject);
VAR
ListaNCM: TACBrNCMsList;
I : INTEGER;
begin
 pCarregando.Visible := True;
 ACBrNcms1.ObterNCMs;

 ListaNcm := ACBrNcms1.NCMs;
 lbNumRegistros.Caption   := 'Numero de Registros: ' + IntToStr(ListaNCM.Count);
 lbUltAtualizacao.Caption := 'Ultima Atualizacao(Sefaz): ' + DateToStr(ACBrNcms1.UltimaAtualizacao);

 Application.ProcessMessages;

    IQuery.Sql.Clear;
    IQuery.Sql.Add('DELETE FROM TIPI');

    IQuery.Prepare;
    IQuery.ExecSql;

    QInsert.open;
    for I := 0 to ListaNCM.Count - 1 do
    begin

      QInsert.Append;
      QInsert.FieldByName('NCM').AsString        := ListaNCM[I].CodigoNcm;
      QInsert.FieldByName('DESC_TIPI').AsString  := Copy(ListaNCM[I].DescricaoNcm,1,250);
      QInsert.FieldByName('DESCRICAO').AsString  := ListaNCM[I].DescricaoNcm;
      QInsert.FieldByName('DT_ATUALIZACAO').AsDateTime := ACBrNcms1.UltimaAtualizacao;
      QInsert.Post;

      Pcarregando.Caption := 'Aguarde Carregando na Tabela : ' + IntToStr(i);

      Application.ProcessMessages;

    end;
     QInsert.Close;

 pCarregando.Visible := False;
 Qtabela.close;
 QTabela.Open;

 Application.ProcessMessages;



end;

procedure TFrmNcm.BitBtn2Click(Sender: TObject);
begin

 if not ACBrNcms1.Validar(Ncm_Validar.Text) then
 Application.MessageBox('Codigo NCM Inválido', PChar(Msg_Title), mb_IconStop)

  else
  Application.MessageBox('Codigo NCM Válido OK', PChar(Msg_Title), MB_ICONINFORMATION);

end;

procedure TFrmNcm.Botoes_Editing;
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

procedure TFrmNcm.Botoes_Normal;
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
    btnEdit.Enabled   := True;
    btnDelete.Enabled := True;
  end
  else
  begin
    btnEdit.Enabled   := False;
    btnDelete.Enabled := False;
  end;

  btnSave.Enabled := False;

  btnDiscard.Enabled := False;
  btnRetorna.Enabled := True;
end;

procedure TFrmNcm.Habilitar(Status: Boolean);
var
I: Integer;
Temp: TComponent;
begin
  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if TEdit(Temp).name <> 'Ncm_Validar' Then
    if Temp is TEdit then
      TEdit(Temp).Enabled := Status;

    if Temp is TMemo then
      TMemo(Temp).Enabled := Status;
  end;
end;

procedure TFrmNcm.Insert;
var
I: Integer;
Temp: TComponent;
Sql, Par: String;
begin
  Sql := 'INSERT INTO TIPI(';
  Par := '';

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if TEdit(Temp).name <> 'Ncm_Validar' Then
    if Temp is TEdit then
    begin
      if Sql = 'INSERT INTO TIPI(' then
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
      if Sql = 'INSERT INTO TIPI(' then
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

    if TEdit(Temp).name <> 'Ncm_Validar' Then
    if Temp is TEdit then
      IQuery.ParamByName(TEdit(Temp).Name).AsString := TEdit(Temp).Text;

    if Temp is TMemo then
      IQuery.ParamByName(TMemo(Temp).Name).AsByteStr := TMemo(Temp).Text;
  end;

  IQuery.Prepare;
  IQuery.ExecSql;



  Habilitar(False);
end;

procedure TFrmNcm.Edit;
var
I: Integer;
Temp: TComponent;
Sql: String;
begin
  Sql := 'UPDATE TIPI SET ';

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if TEdit(Temp).name <> 'Ncm_Validar' Then
    if Temp is TEdit then
    begin
      if Sql = 'UPDATE TIPI SET ' then
        Sql := Sql + TEdit(Temp).Name + ' = :' + TEdit(Temp).Name
      else
        Sql := Sql + ', ' + TEdit(Temp).Name + ' = :' + TEdit(Temp).Name;
    end;

    if Temp is TMemo then
    begin
      if Sql = 'UPDATE TIPI SET ' then
        Sql := Sql + TMemo(Temp).Name + ' = :' + TMemo(Temp).Name
      else
        Sql := Sql + ', ' + TMemo(Temp).Name + ' = :' + TMemo(Temp).Name;
    end;
  end;

  Sql := Sql + ' WHERE (NCM = :NCM)';

  
  IQuery.Sql.Clear;
  IQuery.Sql.Add(Sql);

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if TEdit(Temp).name <> 'Ncm_Validar' Then
    if Temp is TEdit then
      IQuery.ParamByName(TEdit(Temp).Name).AsString := TEdit(Temp).Text;

    if Temp is TMemo then
      IQuery.ParamByName(TMemo(Temp).Name).AsByteStr := TMemo(Temp).Text;
  end;

  IQuery.ParamByName('NCM').AsString := QTabela.FieldByName('NCM').AsString;

  IQuery.Prepare;
  IQuery.ExecSql;



  QTabela.Close;
  QTabela.Open;

  QTabela.Locate('NCM', ID, [loCaseInsensitive]);

  Habilitar(False);
end;

function TFrmNcm.Validacao: Boolean;
begin
  Result := False;

  DESCRICAO.Color  := clWindow;

  if DESCRICAO.Text = '' then
  begin
    Application.MessageBox('Informe a Descrição', PChar(Msg_Title), mb_IconStop);
    DESCRICAO.Color := clYellow;
    DESCRICAO.SetFocus;
    exit;
  end;

  Result := True;
end;

procedure TFrmNcm.ManutencaoShow(Sender: TObject);
begin
  Set_Campos(False);
  Botoes_Normal;
end;

procedure TFrmNcm.Set_Campos(Vazio: Boolean);
var
I: Integer;
Temp: TComponent;
begin
  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];


      if Vazio then
      begin
        if Temp is  TEdit then
          TEdit(Temp).Text := '';

        if Temp is TMemo then
          TMemo(Temp).Lines.Clear;
      end
      else
      begin
        if TEdit(Temp).name <> 'Ncm_Validar' Then
        if Temp is TEdit then
          TEdit(Temp).Text := QTabela.FieldByName(TEdit(Temp).Name).AsString;

        if Temp is TMemo then
          TMemo(Temp).Text := QTabela.FieldByName(TMemo(Temp).Name).AsString;
      end;

  end;
end;

procedure TFrmNcm.btnDeleteClick(Sender: TObject);
begin
  if FrmData.QAcesso.FieldByName('EXCLUSAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para exclusão', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  if Application.MessageBox('Deseja realmente excluir?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = IDYES then
  begin
    

    IQuery.Sql.Clear;
    IQuery.Sql.Add('DELETE FROM TIPI');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(NCM = :NCM)');

    IQuery.ParamByName('NCM').AsString := QTabela.FieldByName('NCM').AsString;

    IQuery.Prepare;
    IQuery.ExecSql;



    QTabela.Close;
    QTabela.Open;

    Set_Campos(False);
    Botoes_Normal;
  end;
end;

procedure TFrmNcm.btnDiscardClick(Sender: TObject);
begin
  Botoes_Normal;
  Set_Campos(False);
  Habilitar(False);
  Operacao := '';
  Consulta.TabVisible := True;
end;

procedure TFrmNcm.btnEditClick(Sender: TObject);
begin
  if FrmData.QAcesso.FieldByName('ALTERACAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para alteração', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  Operacao := 'Alterando';
  ID := QTabela.FieldByName('NCM').AsString;
  Botoes_Editing;
  Habilitar(True);

  Consulta.TabVisible := False;

  NCM.SetFocus;
end;

procedure TFrmNcm.btnInsertClick(Sender: TObject);
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

  NCM.SetFocus;
end;

procedure TFrmNcm.btnNextClick(Sender: TObject);
begin
  if not QTabela.Eof then
  begin
    QTabela.Next;
    Set_Campos(False);
  end;

  Botoes_Normal;
end;

procedure TFrmNcm.btnPriorClick(Sender: TObject);
begin
  if not QTabela.Bof then
  begin
    QTabela.Prior;
    Set_Campos(False);
  end;
  
  Botoes_Normal;
end;

procedure TFrmNcm.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmNcm.btnSaveClick(Sender: TObject);
begin
  if Validacao then
  begin
    if Operacao = 'Inserindo' then
    begin
      Insert;

      CmdSelectNull := 'WHERE (NCM IS NOT NULL)';
      CmdOrderBy    := 'ORDER BY NCM';

      QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

      QTabela.Open;
      QTabela.Last;

      QTabela.Locate('NCM', NCM.Text, [loCaseInsensitive]);
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

procedure TFrmNcm.DBGrid1DblClick(Sender: TObject);
begin
  Manutencao.Show;
end;

procedure TFrmNcm.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Manutencao.Show;
end;

procedure TFrmNcm.DBGrid1TitleClick(Column: TColumn);
begin
  CmdOrderBy := 'ORDER BY ' + Column.FieldName;

  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;
  QTabela.Open;
end;

procedure TFrmNcm.NCMKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmNcm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmNcm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (Operacao = 'Inserindo') or (Operacao = 'Alterando') then
  begin
    Application.MessageBox('É melhor salvar as alterações antes de continuar', PChar(Msg_Title), mb_IconStop);
    CanClose := False;
  end;
end;

procedure TFrmNcm.FormCreate(Sender: TObject);
begin
  DBGrid1.Columns[0].Width := 57;
  DBGrid1.Columns[1].Width := 618;

  CmdSelect     := QTabela.Sql.Text;
  CmdSelectNull := 'WHERE (NCM IS NOT NULL)';
  CmdOrderBy    := 'ORDER BY NCM';

  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;
  QTabela.Open;
end;

procedure TFrmNcm.FormShow(Sender: TObject);
begin
  DBGrid1.SetFocus;
end;

end.
