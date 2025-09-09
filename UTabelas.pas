unit UTabelas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ComCtrls, ToolWin, StdCtrls, Grids, DBGrids, Tabs, ExtCtrls,
  DB, IBCustomDataSet, IBQuery, Mask, rxToolEdit, Buttons, QuickRpt, QRCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmTabelas = class(TForm)
    PageControl1: TPageControl;
    Panel1: TPanel;
    Consulta: TTabSheet;
    Manutencao: TTabSheet;
    Alfabeto: TTabSet;
    StatusBar1: TStatusBar;
    DBGrid1: TDBGrid;
    DataTabela: TDataSource;
    Label3: TLabel;
    DESCRICAO: TEdit;
    btnRetorna: TBitBtn;
    Panel2: TPanel;
    btnPrior: TBitBtn;
    btnNext: TBitBtn;
    btnInsert: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    btnSave: TBitBtn;
    btnDiscard: TBitBtn;
    Lista: TTreeView;
    Label1: TLabel;
    TIPO_TABELA: TEdit;
    btnPesquisa: TBitBtn;
    Label2: TLabel;
    btnImprime: TBitBtn;
    Tabelas: TQuickRep;
    QRBand1: TQRBand;
    QRSysData1: TQRSysData;
    Cabec: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    QRDBText3: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape3: TQRShape;
    QRBand2: TQRBand;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRGroup1: TQRGroup;
    QRDBText1: TQRDBText;
    Label5: TLabel;
    Nivel: TEdit;
    Label25: TLabel;
    TIPO_ATENDIMENTO: TComboBox;
    QTabela: TFDQuery;
    IQuery: TFDQuery;
    QRel: TFDQuery;
    COD_CONTA_CONTABIL: TEdit;
    conta_ref: TEdit;
    Label4: TLabel;
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
    procedure ListaClick(Sender: TObject);
    procedure ListaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ListaKeyPress(Sender: TObject; var Key: Char);
    procedure ConsultaShow(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnImprimeClick(Sender: TObject);
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
  FrmTabelas: TFrmTabelas;
  Operacao, Tp_Tabela: String;
  ID: Integer;

implementation

uses
  UPrincipal, UData, UPesquisa, UComposicao_Produtos, UNcm,UCest;

{$R *.dfm}

procedure TFrmTabelas.AlfabetoClick(Sender: TObject);
begin
  if Alfabeto.TabIndex <> 26 then
  begin
    if FrmData.QAcesso.FieldByName('DESATIVADOS').AsString = 'True' then
      CmdSelectNull := 'WHERE (DESCRICAO LIKE ' + #39 + Chr(Alfabeto.TabIndex + 65) + '%' + #39 + ') AND (TIPO_TABELA = ' + #39 + Tp_Tabela + #39 + ')'
    else
      CmdSelectNull := 'WHERE (DESCRICAO LIKE ' + #39 + Chr(Alfabeto.TabIndex + 65) + '%' + #39 + ') AND (STATUS = ' + #39 + 'A' + #39 + ') AND (TIPO_TABELA = ' + #39 + Tp_Tabela + #39 + ')';
  end
  else
  begin
    if FrmData.QAcesso.FieldByName('DESATIVADOS').AsString = 'True' then
      CmdSelectNull := 'WHERE (TABELA_ID IS NOT NULL) AND (TIPO_TABELA = ' + #39 + Tp_Tabela + #39 + ')'
    else
      CmdSelectNull := 'WHERE (TABELA_ID IS NOT NULL) AND (STATUS = ' + #39 + 'A' + #39 + ') AND (TIPO_TABELA = ' + #39 + Tp_Tabela + #39 + ')';
  end;

  CmdOrderBy := 'ORDER BY DESCRICAO';

  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

  QTabela.Open;
end;

procedure TFrmTabelas.Botoes_Editing;
begin
  btnPrior.Enabled    := False;
  btnNext.Enabled     := False;
  btnInsert.Enabled   := False;
  btnEdit.Enabled     := False;
  btnDelete.Enabled   := False;
  btnSave.Enabled     := True;
  btnDiscard.Enabled  := True;
  btnRetorna.Enabled  := False;
  btnPesquisa.Enabled := False;
  btnImprime.Enabled  := False;
end;

procedure TFrmTabelas.Botoes_Normal;
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

  btnSave.Enabled     := False;
  btnDiscard.Enabled  := False;
  btnRetorna.Enabled  := True;
  btnPesquisa.Enabled := True;
  btnImprime.Enabled  := True;
end;

procedure TFrmTabelas.Habilitar(Status: Boolean);
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
  end;
end;

procedure TFrmTabelas.Insert;
var
I: Integer;
Temp: TComponent;
Sql, Par: String;
begin
  Sql := 'INSERT INTO TABELAS(';
  Par := '';

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
    begin
      if Sql = 'INSERT INTO TABELAS(' then
        Sql := Sql + TEdit(Temp).Name
      else
        Sql := Sql + ', ' + TEdit(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TEdit(Temp).Name
      else
        Par := Par + ', :' + TEdit(Temp).Name;
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
  end;

  IQuery.Prepare;
  IQuery.ExecSql;

  Habilitar(False);
end;

procedure TFrmTabelas.ListaClick(Sender: TObject);
begin

   COD_CONTA_CONTABIL.Visible := False;
   conta_ref.Visible          := False;
   Label25.Visible            := False;
   Label4.Visible             := False;

  PageControl1.Visible := True;
  if Lista.Selected.Text = 'Centros de Custo' then
    Tp_Tabela := '2'
  else if Lista.Selected.Text = 'Cargos e Funções' then
    Tp_Tabela := '6'
  else if Lista.Selected.Text = 'Grupos de Estoque' then
    Tp_Tabela := '7'
  else if Lista.Selected.Text = 'Sub-Tipos de Estoque' then
    Tp_Tabela := '5'
  else if Lista.Selected.Text = 'Localizações' then
    Tp_Tabela := '8'
  else if Lista.Selected.Text = 'Unidade de Medida' then
    Tp_Tabela := '9'
  else if Lista.Selected.Text = 'Família de Produtos' then
    Tp_Tabela := 'F'
  else if Lista.Selected.Text = 'Composição Produção' then
  begin
    Tp_Tabela := '';

    Keybd_Event(VK_UP, 0, 0, 0);

    PageControl1.Visible := False;

    Application.CreateForm(TFrmComposicao_Produtos, FrmComposicao_Produtos);
    try
      FrmComposicao_Produtos.ShowModal;
    finally
      FrmComposicao_Produtos.Release;

    end;


  end
  else if Lista.Selected.Text = 'NCM' then
  begin
    Tp_Tabela := '';

    Keybd_Event(VK_UP, 0, 0, 0);

    PageControl1.Visible := False;

    Application.CreateForm(TFrmNcm, FrmNcm);
    try
      FrmNcm.ShowModal;
    finally
      FrmNcm.Release;
    end;
  end

  else if Lista.Selected.Text = 'CEST' then
  begin
    Tp_Tabela := '';

    Keybd_Event(VK_UP, 0, 0, 0);

    PageControl1.Visible := False;

    Application.CreateForm(TFrmCest, FrmCest);
    try
      FrmCest.ShowModal;
    finally
      FrmCest.Release;
    end;
  end
  else if Lista.Selected.Text = 'Tipo Atend. OS' then
    Tp_Tabela := 'T'
  else if Lista.Selected.Text = 'Status OS' then
    Tp_Tabela := 'S'
  else if Lista.Selected.Text = 'Tipo Cancelamento' then
    Tp_Tabela := 'C'
  else if Lista.Selected.Text = 'Tipo de Documento' then
    Tp_Tabela := 'D'
  else if Lista.Selected.Text = 'Localização do Estoque' then
    Tp_Tabela := 'L'
  else if Lista.Selected.Text = 'Plano Contábil' then
    Tp_Tabela := 'P'
  else if Lista.Selected.Text = 'Tipo de Atividade' then
    Tp_Tabela := 'A'
  else if Lista.Selected.Text = 'Grupo Contábil DRE' Then
    Tp_Tabela := 'R';

  TIPO_TABELA.Text := Tp_Tabela;
  Label2.Caption   := Lista.Selected.Text;

  if FrmData.QAcesso.FieldByName('DESATIVADOS').AsString = 'True' then
    CmdSelectNull := 'WHERE (TABELA_ID IS NOT NULL) AND (TIPO_TABELA = ' + #39 + Tp_Tabela + #39 + ')'
  else
    CmdSelectNull := 'WHERE (TABELA_ID IS NOT NULL) AND (STATUS = ' + #39 + 'A' + #39 + ') AND (TIPO_TABELA = ' + #39 + Tp_Tabela + #39 + ')';

  CmdOrderBy := 'ORDER BY DESCRICAO';

  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

  QTabela.Open;
end;

procedure TFrmTabelas.ListaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Lista.Selected.Text = 'Centros de Custo' then
    Tp_Tabela := '2'
  else if Lista.Selected.Text = 'Cargos e Funções' then
    Tp_Tabela := '6'
  else if Lista.Selected.Text = 'Grupos de Estoque' then
    Tp_Tabela := '7'
  else if Lista.Selected.Text = 'Sub-Tipos de Estoque' then
    Tp_Tabela := '5'
  else if Lista.Selected.Text = 'Localizações' then
    Tp_Tabela := '8'
  else if Lista.Selected.Text = 'Unidade de Medida' then
    Tp_Tabela := '9'
  else if Lista.Selected.Text = 'Família de Produtos' then
    Tp_Tabela := 'F'
  else if Lista.Selected.Text = 'Composição Produção' then
  begin
    Tp_Tabela := '';

    Keybd_Event(VK_UP, 0, 0, 0);

    Application.CreateForm(TFrmComposicao_Produtos, FrmComposicao_Produtos);
    try
      FrmComposicao_Produtos.ShowModal;
    finally
      FrmComposicao_Produtos.Release;
    end;
  end
  else if Lista.Selected.Text = 'NCM' then
  begin
    Tp_Tabela := '';

    Keybd_Event(VK_UP, 0, 0, 0);

    Application.CreateForm(TFrmNcm, FrmNcm);
    try
      FrmNcm.ShowModal;
    finally
      FrmNcm.Release;
    end;
  end
  Else if Lista.Selected.Text = 'CEST' then
  begin
    Tp_Tabela := '';

    Keybd_Event(VK_UP, 0, 0, 0);

    Application.CreateForm(TFrmCEST, FrmCEST);
    try
      FrmCEST.ShowModal;
    finally
      FrmCEST.Release;
    end;
  end

  else if Lista.Selected.Text = 'Tipo Atend. OS' then
    Tp_Tabela := 'T'
  else if Lista.Selected.Text = 'Status OS' then
    Tp_Tabela := 'S'
  else if Lista.Selected.Text = 'Tipo Cancelamento' then
    Tp_Tabela := 'C'
  else if Lista.Selected.Text = 'Tipo de Documento' then
    Tp_Tabela := 'D'
   else if Lista.Selected.Text = 'Plano Contábil' then
    Tp_Tabela := 'P'
  else if Lista.Selected.Text = 'Tipo de Atividade' then
    Tp_Tabela := 'A';

  TIPO_TABELA.Text := Tp_Tabela;
  Label2.Caption   := Lista.Selected.Text;

  if FrmData.QAcesso.FieldByName('DESATIVADOS').AsString= 'True' then
    CmdSelectNull := 'WHERE (TABELA_ID IS NOT NULL) AND (TIPO_TABELA = ' + #39 + Tp_Tabela + #39 + ')'
  else
    CmdSelectNull := 'WHERE (TABELA_ID IS NOT NULL) AND (STATUS = ' + #39 + 'A' + #39 + ') AND (TIPO_TABELA = ' + #39 + Tp_Tabela + #39 + ')';

  CmdOrderBy := 'ORDER BY DESCRICAO';

  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

  QTabela.Open;
end;

procedure TFrmTabelas.ListaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    if Lista.Selected.Text = 'Centros de Custo' then
      Tp_Tabela := '2'
    else if Lista.Selected.Text = 'Cargos e Funções' then
      Tp_Tabela := '6'
    else if Lista.Selected.Text = 'Grupos de Estoque' then
      Tp_Tabela := '7'
    else if Lista.Selected.Text = 'Sub-Tipos de Estoque' then
      Tp_Tabela := '5'
    else if Lista.Selected.Text = 'Localizações' then
      Tp_Tabela := '8'
    else if Lista.Selected.Text = 'Unidade de Medida' then
      Tp_Tabela := '9'
    else if Lista.Selected.Text = 'Família de Produtos' then
      Tp_Tabela := 'F'
    else if Lista.Selected.Text = 'Plano Contábil' then
      Tp_Tabela := 'P'
    else if Lista.Selected.Text = 'Composição Produção' then
    begin
      Tp_Tabela := '';

      Keybd_Event(VK_UP, 0, 0, 0);

      Application.CreateForm(TFrmComposicao_Produtos, FrmComposicao_Produtos);
      try
        FrmComposicao_Produtos.ShowModal;
      finally
        FrmComposicao_Produtos.Release;
      end;
    end
    else if Lista.Selected.Text = 'NCM' then
    begin
      Tp_Tabela := '';

      Keybd_Event(VK_UP, 0, 0, 0);

      Application.CreateForm(TFrmNcm, FrmNcm);
      try
        FrmNcm.ShowModal;
      finally
        FrmNcm.Release;
      end;
    end

    else if Lista.Selected.Text = 'CEST' then
    begin
      Tp_Tabela := '';

      Keybd_Event(VK_UP, 0, 0, 0);

      Application.CreateForm(TFrmCEST, FrmCEST);
      try
        FrmCEST.ShowModal;
      finally
        FrmCEST.Release;
      end;
    end

    else if Lista.Selected.Text = 'Tipo Atend. OS' then
      Tp_Tabela := 'T'
    else if Lista.Selected.Text = 'Status OS' then
      Tp_Tabela := 'S'
    else if Lista.Selected.Text = 'Tipo Cancelamento' then
      Tp_Tabela := 'C'
    else if Lista.Selected.Text = 'Tipo de Documento' then
      Tp_Tabela := 'D'
    else if Lista.Selected.Text = 'Tipo de Atividade' then
      Tp_Tabela := 'A';

    TIPO_TABELA.Text := Tp_Tabela;
    Label2.Caption   := Lista.Selected.Text;

    if FrmData.QAcesso.FieldByName('DESATIVADOS').AsString = 'True' then
      CmdSelectNull := 'WHERE (TABELA_ID IS NOT NULL) AND (TIPO_TABELA = ' + #39 + Tp_Tabela + #39 + ')'
    else
      CmdSelectNull := 'WHERE (TABELA_ID IS NOT NULL) AND (STATUS = ' + #39 + 'A' + #39 + ') AND (TIPO_TABELA = ' + #39 + Tp_Tabela + #39 + ')';

    CmdOrderBy := 'ORDER BY DESCRICAO';

    QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

    QTabela.Open;
  end;
end;

procedure TFrmTabelas.Edit;
var
I: Integer;
Temp: TComponent;
Sql: String;
begin
  Sql := 'UPDATE TABELAS SET ';

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
    begin
      if Sql = 'UPDATE TABELAS SET ' then
        Sql := Sql + TEdit(Temp).Name + ' = :' + TEdit(Temp).Name
      else
        Sql := Sql + ', ' + TEdit(Temp).Name + ' = :' + TEdit(Temp).Name;
    end;
  end;

  Sql := Sql + ' WHERE (TABELA_ID = :ID) AND (TIPO_TABELA = :TIPO_TABELA)';

  

  IQuery.Sql.Clear;
  IQuery.Sql.Add(Sql);

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
      IQuery.ParamByName(TEdit(Temp).Name).AsString := TEdit(Temp).Text;
  end;

  IQuery.ParamByName('ID').AsInteger         := QTabela.FieldByName('TABELA_ID').AsInteger;
  IQuery.ParamByName('TIPO_TABELA').AsString := Tp_Tabela;

  IQuery.Prepare;
  IQuery.ExecSql;

  QTabela.Close;
  QTabela.Open;
  QTabela.Locate('TABELA_ID', ID, [loCaseInsensitive]);
  Habilitar(False);
end;

function TFrmTabelas.Validacao: Boolean;
begin
  Result := False;
  
  DESCRICAO.Color := clWindow;

  if Descricao.Text = '' then
  begin
    Application.MessageBox('Informe a Descrição', PChar(Msg_Title), mb_IconStop);
    DESCRICAO.Color := clYellow;
    DESCRICAO.SetFocus;
    exit;
  end;

  Result := True;
end;

procedure TFrmTabelas.ManutencaoShow(Sender: TObject);
begin
  Set_Campos(False);
  Botoes_Normal;
  Lista.Enabled := False;

  if (Tp_Tabela = 'T') or (Tp_Tabela = 'D')  then
    DESCRICAO.MaxLength := 25
  else if Tp_Tabela = 'S' then
    DESCRICAO.MaxLength := 15
  else
    DESCRICAO.MaxLength := 70;

  if Tp_tabela = '9' then
  Begin
  Nivel.Visible  := True;
  Label5.Visible := True;
  Label5.Caption := 'Descrição';
  Label3.Caption := 'Unidade';
  Descricao.Width := 29;
  Label25.Visible          := False;
  Tipo_atendimento.Visible := False;
  End
  Else
  Begin
  Nivel.Visible  := False;
  Label5.Visible := False;
  Label3.Caption := 'Descrição';
  Descricao.Width := 301;
  Label25.Visible          := False;
  Tipo_atendimento.Visible := False;
  End;

  if Tp_tabela = '7' then
  Begin
  Label25.Visible          := True;
  Tipo_atendimento.Visible := True;

  TIPO_ATENDIMENTO.Items.Clear;

  IQuery.Sql.Clear;
  IQuery.Sql.Add('SELECT * FROM TABELAS');
  IQuery.Sql.Add('WHERE');
  IQuery.Sql.Add('(TIPO_TABELA = :TIPO_TABELA)');

  IQuery.ParamByName('TIPO_TABELA').AsString := 'T';

  IQuery.Prepare;
  IQuery.Open;

  IQuery.First;

    while not IQuery.Eof do
    begin
      TIPO_ATENDIMENTO.Items.Add(Copy(IQuery.FieldByName('DESCRICAO').AsString, 1, 25));

      Application.ProcessMessages;
      IQuery.Next;
    end;

  End;

  if Tp_Tabela = 'P' then
  begin
   Label25.Caption := 'Código da Conta';
   Label4.Caption  := 'Código conta Ref.';
   COD_CONTA_CONTABIL.Top := 109;
   COD_CONTA_CONTABIL.Width := 61;
   COD_CONTA_CONTABIL.Left := 95;
   conta_ref.Left := 95;
   DESCRICAO.Left := 95;
   COD_CONTA_CONTABIL.Visible := True;
   conta_ref.Visible := True;
   Label25.Visible :=  True;
   Label4.Visible  :=  True;
  end;



end;

procedure TFrmTabelas.DESCRICAOKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmTabelas.Set_Campos(Vazio: Boolean);
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
    end
    else
    begin
      if Temp is TEdit then
        TEdit(Temp).Text     := QTabela.FieldByName(TEdit(Temp).Name).AsString;

      if Temp is TComboBox then
        TComboBox(Temp).Text := QTabela.FieldByName('NIVEL').AsString;
    end;
  end;

  TIPO_TABELA.Text := Tp_Tabela;
end;

procedure TFrmTabelas.btnDeleteClick(Sender: TObject);
begin
  if FrmData.QAcesso.FieldByName('EXCLUSAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para exclusão', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  if Application.MessageBox('Deseja realmente excluir?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = IDYES then
  begin
    

    IQuery.Sql.Clear;
    IQuery.Sql.Add('DELETE FROM TABELAS');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(TABELA_ID = :ID)');
    IQuery.Sql.Add('AND (TIPO_TABELA = :TIPO_TABELA)');

    IQuery.ParamByName('ID').AsInteger         := QTabela.FieldByName('TABELA_ID').AsInteger;
    IQuery.ParamByName('TIPO_TABELA').AsString := Tp_Tabela;

    IQuery.Prepare;
    IQuery.ExecSql;



    QTabela.Close;

    QTabela.Prepare;
    QTabela.Open;

    Set_Campos(False);
    Botoes_Normal;
  end;
end;

procedure TFrmTabelas.btnDiscardClick(Sender: TObject);
begin
  Botoes_Normal;
  Set_Campos(False);
  Habilitar(False);
  Operacao := '';
  Consulta.TabVisible := True;
end;

procedure TFrmTabelas.btnEditClick(Sender: TObject);
begin
  if FrmData.QAcesso.FieldByName('ALTERACAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para alteração', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  Operacao := 'Alterando';
  ID := QTabela.FieldByName('TABELA_ID').AsInteger;
  Botoes_Editing;
  Habilitar(True);

  Consulta.TabVisible := False;

  DESCRICAO.SetFocus;
end;

procedure TFrmTabelas.btnImprimeClick(Sender: TObject);
begin
  QRel.Prepare;
  QRel.Open;

  if QRel.IsEmpty then
    Application.MessageBox('Não há dados para serem impressos', PChar(Msg_Title), mb_IconInformation)
  else
    Tabelas.PreviewModal;

  QRel.Close;
end;

procedure TFrmTabelas.btnInsertClick(Sender: TObject);
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

  DESCRICAO.SetFocus;
end;

procedure TFrmTabelas.btnNextClick(Sender: TObject);
begin
  if not QTabela.Eof then
  begin
    QTabela.Next;
    Set_Campos(False);
  end;

  Botoes_Normal;
end;

procedure TFrmTabelas.btnPesquisaClick(Sender: TObject);
var
Condicao: String;
begin
  Condicao := GetPesquisa('TABELAS');

  if Condicao <> '' then
  begin
    if FrmData.QAcesso.FieldByName('DESATIVADOS').AsString = 'True' then
      CmdSelectNull := Condicao
    else
      CmdSelectNull := Condicao + ' AND (STATUS = ' + #39 + 'A' + #39 + ') AND (TIPO_TABELA = ' + #39 + Tp_Tabela + #39 + ')';
  end;

  CmdOrderBy := 'ORDER BY TABELA_ID';

  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

  QTabela.Open;
  Set_Campos(False);
  Botoes_Normal;
end;

procedure TFrmTabelas.btnPriorClick(Sender: TObject);
begin
  if not QTabela.Bof then
  begin
    QTabela.Prior;
    Set_Campos(False);
  end;

  Botoes_Normal;
end;

procedure TFrmTabelas.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmTabelas.btnSaveClick(Sender: TObject);
begin
  if Validacao then
  begin
    if Tp_tabela = '7' then
      Nivel.Text := Tipo_Atendimento.Text;

    if Operacao = 'Inserindo' then
    begin
      if Tp_tabela = '7' then
      Nivel.Text := Tipo_Atendimento.Text;

      Insert;

      CmdSelectNull := 'WHERE (DESCRICAO = :DESCRICAO) AND (STATUS = :STATUS) AND (TIPO_TABELA = :TIPO_TABELA)';
      CmdOrderBy   := 'ORDER BY TABELA_ID';

      QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

      QTabela.ParamByName('DESCRICAO').AsString   := DESCRICAO.Text;
      QTabela.ParamByName('STATUS').AsString      := 'A';
      QTabela.ParamByName('TIPO_TABELA').AsString := Tp_Tabela;

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

procedure TFrmTabelas.ConsultaShow(Sender: TObject);
begin
  Lista.Enabled := True;
end;

procedure TFrmTabelas.DBGrid1DblClick(Sender: TObject);
begin
  Manutencao.Show;
end;

procedure TFrmTabelas.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F3) and (QTabela.FieldByName('STATUS').AsString = 'A') then
  begin
    ID := QTabela.FieldByName('TABELA_ID').AsInteger;

   
    IQuery.Sql.Clear;
    IQuery.Sql.Add('UPDATE TABELAS SET STATUS = :STATUS');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(TABELA_ID = :TABELA_ID)');
    IQuery.Sql.Add('AND (TIPO_TABELA = :TIPO_TABELA)');

    IQuery.ParamByName('STATUS').AsString      := 'D';
    IQuery.ParamByName('TABELA_ID').AsInteger  := QTabela.FieldByName('TABELA_ID').AsInteger;
    IQuery.ParamByName('TIPO_TABELA').AsString := Tp_Tabela;

    IQuery.Prepare;
    IQuery.ExecSql;


    QTabela.Close;
    QTabela.Open;
    QTabela.Locate('TABELA_ID', ID, [loCaseInsensitive]);
  end;

  if (Key = Vk_F4) and (QTabela.FieldByName('STATUS').AsString = 'D') then
  begin
    ID := QTabela.FieldByName('TABELA_ID').AsInteger;



    IQuery.Sql.Clear;
    IQuery.Sql.Add('UPDATE TABELAS SET STATUS = :STATUS');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(TABELA_ID = :TABELA_ID)');
    IQuery.Sql.Add('AND (TIPO_TABELA = :TIPO_TABELA)');

    IQuery.ParamByName('STATUS').AsString      := 'A';
    IQuery.ParamByName('TABELA_ID').AsInteger  := QTabela.FieldByName('TABELA_ID').AsInteger;
    IQuery.ParamByName('TIPO_TABELA').AsString := Tp_Tabela;

    IQuery.Prepare;
    IQuery.ExecSql;


    QTabela.Close;
    QTabela.Open;
    QTabela.Locate('TABELA_ID', ID, [loCaseInsensitive]);
  end;
end;

procedure TFrmTabelas.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Manutencao.Show;
end;

procedure TFrmTabelas.DBGrid1TitleClick(Column: TColumn);
begin
  CmdOrderBy := 'ORDER BY ' + Column.FieldName;

  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;
  QTabela.Open;
end;

procedure TFrmTabelas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmTabelas.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (Operacao = 'Inserindo') or (Operacao = 'Alterando') then
  begin
    Application.MessageBox('É melhor salvar as alterações antes de continuar', PChar(Msg_Title), mb_IconStop);
    CanClose := False;
  end;
end;

procedure TFrmTabelas.FormCreate(Sender: TObject);
begin
  DBGrid1.Columns[0].Width := 64;
  DBGrid1.Columns[1].Width := 424;
  DBGrid1.Columns[2].Width := 41;

  Tp_Tabela := '2';
  CmdSelect := QTabela.Sql.Text;

  if FrmPrincipal.Config.FieldByName('MOSTRAR_CADASTROS').AsString = 'True' then
  begin
    if FrmData.QAcesso.FieldByName('DESATIVADOS').AsString = 'True' then
      CmdSelectNull := 'WHERE (TABELA_ID IS NOT NULL) AND (TIPO_TABELA = ' + #39 + Tp_Tabela + #39 + ')'
    else
      CmdSelectNull := 'WHERE (TABELA_ID IS NOT NULL) AND (STATUS = ' + #39 + 'A' + #39 + ') AND (TIPO_TABELA = ' + #39 + Tp_Tabela + #39 + ')';
  end
  else
  begin
    if FrmData.QAcesso.FieldByName('DESATIVADOS').AsString = 'True' then
      CmdSelectNull := 'WHERE (TABELA_ID IS NULL) AND (TIPO_TABELA = ' + #39 + Tp_Tabela + #39 + ')'
    else
      CmdSelectNull := 'WHERE (TABELA_ID IS NULL) AND (STATUS = ' + #39 + 'A' + #39 + ') AND (TIPO_TABELA = ' + #39 + Tp_Tabela + #39 + ')';
  end;

  CmdOrderBy := 'ORDER BY DESCRICAO';

  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;
  QTabela.Open;

  Consulta.Show;
end;

end.
