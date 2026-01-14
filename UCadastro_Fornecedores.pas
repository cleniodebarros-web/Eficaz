unit UCadastro_Fornecedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ComCtrls, ToolWin, StdCtrls, Grids, DBGrids, Tabs, ExtCtrls,
  DB, IBCustomDataSet, IBQuery, Mask, rxToolEdit, Buttons, QRCtrls, QuickRpt,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmCadastro_Fornecedores = class(TForm)
    PageControl1: TPageControl;
    Panel1: TPanel;
    Consulta: TTabSheet;
    Manutencao: TTabSheet;
    Alfabeto: TTabSet;
    StatusBar1: TStatusBar;
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
    btnPesquisa: TBitBtn;
    btnImprime: TBitBtn;
    Fornecedores: TQuickRep;
    QRBand1: TQRBand;
    QRSysData1: TQRSysData;
    Cabec: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    QRDBText3: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape3: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRBand2: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText7: TQRDBText;
    btnComeca_Com: TSpeedButton;
    Comeca_Com: TLabeledEdit;
    Label21: TLabel;
    PageControl2: TPageControl;
    Empresa: TTabSheet;
    Label18: TLabel;
    URL: TEdit;
    Label16: TLabel;
    ATIVIDADE: TEdit;
    INSCRICAO: TEdit;
    Label12: TLabel;
    Label14: TLabel;
    FAX: TMaskEdit;
    CEP: TMaskEdit;
    Label10: TLabel;
    Label9: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    NOME: TEdit;
    FANTASIA: TEdit;
    ENDERECO: TEdit;
    COMPLEMENTO: TEdit;
    MUNICIPIO: TEdit;
    SUFRAMA: TEdit;
    TIPO: TEdit;
    COD_CONTABIL: TEdit;
    Label19: TLabel;
    EMAIL: TEdit;
    Label17: TLabel;
    CONTATO: TEdit;
    CNPJ: TMaskEdit;
    Label15: TLabel;
    Label11: TLabel;
    TELEFONE_2: TMaskEdit;
    COD_PAIS: TEdit;
    Label2: TLabel;
    btnPais: TSpeedButton;
    btnIBGE: TSpeedButton;
    IBGE: TEdit;
    Label24: TLabel;
    Label8: TLabel;
    ESTADO: TComboBox;
    BAIRRO: TEdit;
    Label7: TLabel;
    Label25: TLabel;
    NUMERO: TEdit;
    TIPO_FORNECEDOR: TComboBox;
    Label20: TLabel;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    DDD_R: TMaskEdit;
    TELEFONE_R: TMaskEdit;
    Label13: TLabel;
    Representante: TEdit;
    Label22: TLabel;
    EMAIL_REPRESENTANTE: TEdit;
    Label23: TLabel;
    DDD: TMaskEdit;
    TELEFONE_1: TMaskEdit;
    QTabela: TFDQuery;
    IQuery: TFDQuery;
    QIbge: TFDQuery;
    QPlano: TFDQuery;
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
    procedure TIPO_FORNECEDORChange(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnImprimeClick(Sender: TObject);
    procedure TIPO_FORNECEDORKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure NOMEKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnIBGEClick(Sender: TObject);
    procedure IBGEExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnPaisClick(Sender: TObject);
    procedure btnComeca_ComClick(Sender: TObject);
    procedure Comeca_ComKeyPress(Sender: TObject; var Key: Char);
    procedure Comeca_ComEnter(Sender: TObject);
    procedure DDD_RChange(Sender: TObject);
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
    procedure GravaPlano(Codigo, Descricao, Altsaldo, Chave: String);

  end;

var
  FrmCadastro_Fornecedores: TFrmCadastro_Fornecedores;
  Operacao,AA,BB,CC,DD,EE,FF,GG,HH,II,JJ,KK,LL,MM,NN,OO: String;
  ID: Integer;
  F1: TextFile;

   Procedure Cadastro_Fornecedor(A,B,C,D,E,F,G,H,I,J,K,L,M,N,O: String);

implementation

uses
  UPrincipal, UData, UPesquisa, UConsulta;

{$R *.dfm}
procedure TFrmCadastro_Fornecedores.GravaPlano(Codigo, Descricao, Altsaldo, Chave: String);
begin
  IQuery.Sql.Clear;
  IQuery.Sql.Add('INSERT INTO PLANO( ' +
                 'CODIGO,    DESCRICAO,    ALTSALDO,    CHAVE) VALUES(' +
                 ':CODIGO,   :DESCRICAO,   :ALTSALDO,   :CHAVE)');

  IQuery.ParamByName('CODIGO').AsString    := Codigo;
  IQuery.ParamByName('DESCRICAO').AsString := Descricao;
  IQuery.ParamByName('ALTSALDO').AsString  := Altsaldo;
  IQuery.ParamByName('CHAVE').AsString     := Chave;

  IQuery.Prepare;
  IQuery.ExecSql;

end;

Procedure Cadastro_Fornecedor(A,B,C,D,E,F,G,H,I,J,K,L,M,N,O: String);
Begin
     AA := A;
     BB := B;
     CC := C;
     DD := D;
     EE := E;
     FF := F;
     GG := G;
     HH := H;
     II := I;
     JJ := J;
     KK := K;
     LL := L;
     MM := M;
     NN := N;
     OO := O;

    Application.CreateForm(TFrmCadastro_Fornecedores, FrmCadastro_Fornecedores);
    try
     FrmCadastro_Fornecedores.ShowModal;
    finally
     FrmCadastro_Fornecedores.Release;
    end;

End;

procedure TFrmCadastro_Fornecedores.DetailSearch(Tabela: String);
begin
  if (Tabela = '') or (Tabela = 'IBGE') then
  begin
    QIBGE.Close;
    QIBGE.ParamByName('IBGE').AsString := IBGE.Text;
    QIBGE.Prepare;
    QIBGE.Open;
  end;
end;

procedure TFrmCadastro_Fornecedores.AlfabetoClick(Sender: TObject);
begin
  if Alfabeto.TabIndex <> 26 then
  begin
    if FrmPrincipal.Config.FieldByName('VER_DESATIVADOS').AsString = 'True' then
      CmdSelectNull := 'WHERE (NOME LIKE ' + #39 + Chr(Alfabeto.TabIndex + 65) + '%' + #39 + ')'
    else
      CmdSelectNull := 'WHERE (NOME LIKE ' + #39 + Chr(Alfabeto.TabIndex + 65) + '%' + #39 + ') AND (STATUS = ' + #39 + 'A' + #39 + ')';
  end
  else
  begin
    if FrmPrincipal.Config.FieldByName('VER_DESATIVADOS').AsString = 'True' then
      CmdSelectNull := 'WHERE (FORNECEDOR_ID IS NOT NULL)'
    else
      CmdSelectNull := 'WHERE (FORNECEDOR_ID IS NOT NULL) AND (STATUS = ' + #39 + 'A' + #39 + ')';
  end;

  CmdOrderBy := 'ORDER BY NOME';

  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

  QTabela.Prepare;
  QTabela.Open;
end;

procedure TFrmCadastro_Fornecedores.Botoes_Editing;
begin
  btnPrior.Enabled      := False;
  btnNext.Enabled       := False;
  btnInsert.Enabled     := False;
  btnEdit.Enabled       := False;
  btnDelete.Enabled     := False;
  btnSave.Enabled       := True;
  btnDiscard.Enabled    := True;
  btnRetorna.Enabled    := False;
  btnPesquisa.Enabled   := False;
  btnImprime.Enabled    := False;
  btnIBGE.Enabled       := True;
  btnPais.Enabled       := True;
  btnComeca_Com.Enabled := False;
  Comeca_Com.Enabled    := False;
end;

procedure TFrmCadastro_Fornecedores.Botoes_Normal;
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

  btnSave.Enabled       := False;
  btnDiscard.Enabled    := False;
  btnRetorna.Enabled    := True;
  btnPesquisa.Enabled   := True;
  btnImprime.Enabled    := True;
  btnIBGE.Enabled       := False;
  btnPais.Enabled       := False;
  btnComeca_Com.Enabled := True;
  Comeca_Com.Enabled    := True;
end;

procedure TFrmCadastro_Fornecedores.Habilitar(Status: Boolean);
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
  end;
end;

procedure TFrmCadastro_Fornecedores.IBGEExit(Sender: TObject);
begin
  DetailSearch('IBGE');
  DetailSearch('IBGE');
  Municipio.Text := QIbge.FieldByName('DESCRICAO').AsString;
  Estado.Text    := QIbge.FieldByName('UF_SIGLA').AsString;
  Cod_Pais.Text  := '01058';
end;

procedure TFrmCadastro_Fornecedores.Insert;
var
I: Integer;
Temp: TComponent;
Sql, Par: String;
begin
  Sql := 'INSERT INTO FORNECEDORES(';
  Par := '';

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
    begin
      if Sql = 'INSERT INTO FORNECEDORES(' then
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
      if Sql = 'INSERT INTO FORNECEDORES(' then
        Sql := Sql + TMaskEdit(Temp).Name
      else
        Sql := Sql + ', ' + TMaskEdit(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TMaskEdit(Temp).Name
      else
        Par := Par + ', :' + TMaskEdit(Temp).Name;
    end;

    if Temp is TComboBox then
    begin
      if Sql = 'INSERT INTO FORNECEDORES(' then
        Sql := Sql + TComboBox(Temp).Name
      else
        Sql := Sql + ', ' + TComboBox(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TComboBox(Temp).Name
      else
        Par := Par + ', :' + TComboBox(Temp).Name;
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

    if Temp is TComboBox then
      IQuery.ParamByName(TComboBox(Temp).Name).AsString := TComboBox(Temp).Text;
  end;

  IQuery.Prepare;
  IQuery.ExecSql;



  Habilitar(False);
end;

procedure TFrmCadastro_Fornecedores.Edit;
var
I: Integer;
Temp: TComponent;
Sql: String;
begin
  Sql := 'UPDATE FORNECEDORES SET ';

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
    begin
      if Sql = 'UPDATE FORNECEDORES SET ' then
        Sql := Sql + TEdit(Temp).Name + ' = :' + TEdit(Temp).Name
      else
        Sql := Sql + ', ' + TEdit(Temp).Name + ' = :' + TEdit(Temp).Name;
    end;

    if Temp is TMaskEdit then
    begin
      if Sql = 'UPDATE FORNECEDORES SET ' then
        Sql := Sql + TMaskEdit(Temp).Name + ' = :' + TMaskEdit(Temp).Name
      else
        Sql := Sql + ', ' + TMaskEdit(Temp).Name + ' = :' + TMaskEdit(Temp).Name;
    end;

    if Temp is TComboBox then
    begin
      if Sql = 'UPDATE FORNECEDORES SET ' then
        Sql := Sql + TComboBox(Temp).Name + ' = :' + TComboBox(Temp).Name
      else
        Sql := Sql + ', ' + TComboBox(Temp).Name + ' = :' + TComboBox(Temp).Name;
    end;
  end;

  Sql := Sql + ' WHERE (FORNECEDOR_ID = :ID)';

  

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
  end;

  IQuery.ParamByName('ID').AsInteger := QTabela.FieldByName('FORNECEDOR_ID').AsInteger;

  IQuery.Prepare;
  IQuery.ExecSql;



  QTabela.Close;

  QTabela.Prepare;
  QTabela.Open;

  QTabela.Locate('FORNECEDOR_ID', ID, [loCaseInsensitive]);

  Habilitar(False);
end;

function TFrmCadastro_Fornecedores.Validacao: Boolean;
var
LibHandle: THandle;
ConsisteInscricaoEstadual: TConsisteInscricaoEstadual;
begin
  Result := False;

  CNPJ.Color            := clWindow;
  TIPO_FORNECEDOR.Color := clWindow;
  ESTADO.Color          := clWindow;
  INSCRICAO.Color       := clWindow;
  NOME.Color            := clWindow;
  ENDERECO.Color        := clWindow;
  BAIRRO.Color          := clWindow;
  IBGE.Color            := clWindow;
  EMAIL.Color           := clWindow;
  COD_PAIS.Color        := clWindow;

  if (Operacao = 'Inserindo') and (Alltrim(SemMascara(CNPJ.Text)) <> '') then
  begin
    IQuery.Sql.Clear;
    IQuery.Sql.Add('SELECT * FROM FORNECEDORES');
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
    IQuery.Sql.Add('SELECT * FROM FORNECEDORES');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(CNPJ = :CNPJ)');
    IQuery.Sql.Add('AND (FORNECEDOR_ID <> :FORNECEDOR_ID)');

    IQuery.ParamByName('CNPJ').AsString := CNPJ.Text;
    IQuery.ParamByName('FORNECEDOR_ID').AsInteger := QTabela.FieldByName('FORNECEDOR_ID').AsInteger;

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

  if NOME.Text = '' then
  begin
    Application.MessageBox('Nome Inválido', PChar(Msg_Title), mb_IconStop);

    NOME.Color := clYellow;
    NOME.SetFocus;

    exit;
  end;

  if (TIPO_FORNECEDOR.Text <> 'PESSOA FÍSICA') and (TIPO_FORNECEDOR.Text <> 'PESSOA JURÍDICA') then
  begin
    Application.MessageBox('Tipo Cliente inválido', PChar(Msg_Title), mb_IconStop);

    TIPO_FORNECEDOR.Color := clYellow;
    TIPO_FORNECEDOR.SetFocus;

    exit;
  end;

  if ENDERECO.Text = '' then
  begin
    Application.MessageBox('Endereço Inválido', PChar(Msg_Title), mb_IconStop);

    ENDERECO.Color := clYellow;
    ENDERECO.SetFocus;

    exit;
  end;

  if BAIRRO.Text = '' then
  begin
    Application.MessageBox('Bairro Inválido', PChar(Msg_Title), mb_IconStop);

    BAIRRO.Color := clYellow;
    BAIRRO.SetFocus;

    exit;
  end;

  if (COD_PAIS.Text <> '01058') and (not ChecaEstado(ESTADO.Text)) then
  begin
    Application.MessageBox('Estado inválido', PChar(Msg_Title), mb_IconStop);

    ESTADO.Color := clYellow;
    ESTADO.SetFocus;

    exit;
  end;

  if QIBGE.IsEmpty then
  begin
    Application.MessageBox('IBGE inexistente', PChar(Msg_Title), mb_IconStop);

    IBGE.Color := clYellow;
    IBGE.SetFocus;

    exit;
  end;

  IQuery.Sql.Clear;
  IQuery.Sql.Add('SELECT * FROM PAISES');
  IQuery.Sql.Add('WHERE');
  IQuery.Sql.Add('(CODIGO = :CODIGO)');

  IQuery.ParamByName('CODIGO').AsString := COD_PAIS.Text;

  IQuery.Prepare;
  IQuery.Open;

  if IQuery.IsEmpty then
  begin
    Application.MessageBox('Cód.País inexistente', PChar(Msg_Title), mb_IconStop);

    COD_PAIS.Color := clYellow;
    COD_PAIS.SetFocus;

    exit;
  end;

  if TIPO_FORNECEDOR.Text = 'PESSOA FÍSICA' then
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

    if Alltrim(SemMascara(INSCRICAO.Text)) <> '' then
    begin
      LibHandle :=  LoadLibrary(PChar(Trim('DllInscE32.Dll')));
      try
        if  LibHandle <= HINSTANCE_ERROR then
          raise Exception.Create ('Dll não carregada');

        @ConsisteInscricaoEstadual := GetProcAddress(LibHandle, 'ConsisteInscricaoEstadual');

        if  @ConsisteInscricaoEstadual  = nil then
          raise Exception.Create('Entrypoint Download não encontrado na Dll');

        if ConsisteInscricaoEstadual(Alltrim(SemMascara(INSCRICAO.Text)), ESTADO.Text) = 1 then
        begin
          //Application.MessageBox('Inscrição Estadual inválida', PChar(Msg_Title), mb_IconStop);

          //INSCRICAO.Color := clYellow;
          //INSCRICAO.SetFocus;

          //exit;
        end;
      finally
        FreeLibrary(LibHandle);
      end;
    end
    Else
    Begin
      if FrmPrincipal.Config.FieldByName('SPED').AsString = 'True' then
      Application.MessageBox('Favor preencher Inscrição Estadual', PChar(Msg_Title), mb_IconStop);
    End;
  end;

  if ((EMAIL.Text <> '') ) and (not ValidaEmail(PChar(EMAIL.Text))) then
  begin
    Application.MessageBox('E-mail Empresa Inválido', PChar(Msg_Title), mb_IconStop);

    EMAIL.Color := clYellow;
    EMAIL.SetFocus;

    exit;
  end;

  if ((EMAIL_REPRESENTANTE.Text <> '') ) and (not ValidaEmail(PChar(EMAIL_REPRESENTANTE.Text))) then
  begin
    Application.MessageBox('E-mail Representante Inválido', PChar(Msg_Title), mb_IconStop);

    EMAIL_Representante.Color := clYellow;
    EMAIL_Representante.SetFocus;

    exit;
  end;

  Result := True;
end;

procedure TFrmCadastro_Fornecedores.ManutencaoShow(Sender: TObject);
begin
  Set_Campos(False);
  Botoes_Normal;
end;

procedure TFrmCadastro_Fornecedores.NOMEKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = IBGE) then
    btnIBGEClick(Self);

  if (Key = Vk_F7) and (Sender = COD_PAIS) then
    btnPaisClick(Self);

  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmCadastro_Fornecedores.Set_Campos(Vazio: Boolean);
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
    end
    else
    begin
      if Temp is TEdit then
        TEdit(Temp).Text := QTabela.FieldByName(TEdit(Temp).Name).AsString;

      if Temp is TMaskEdit then
        TMaskEdit(Temp).Text := QTabela.FieldByName(TMaskEdit(Temp).Name).AsString;

      if Temp is TComboBox then
        TComboBox(Temp).Text := QTabela.FieldByName(TComboBox(Temp).Name).AsString;

      if QTabela.FieldByName('TIPO_FORNECEDOR').AsString = 'PESSOA JURÍDICA' then
        CNPJ.EditMask := '99.999.999/9999-99;1;_'
      else
        CNPJ.EditMask := '999.999.999-99;1;_'; 
    end;
  end;
end;

procedure TFrmCadastro_Fornecedores.TIPO_FORNECEDORChange(Sender: TObject);
begin
  if (Operacao = 'Inserindo') or (Operacao = 'Alterando')  then
  Begin
  if TIPO_FORNECEDOR.Text = 'PESSOA JURÍDICA' then
    CNPJ.EditMask := '99.999.999/9999-99;1;_'
  else
    CNPJ.EditMask := '999.999.999-99;1;_';
  End;

end;

procedure TFrmCadastro_Fornecedores.TIPO_FORNECEDORKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmCadastro_Fornecedores.btnComeca_ComClick(Sender: TObject);
begin
  if Comeca_Com.Text <> '' then
  begin
    if FrmPrincipal.Config.FieldByName('VER_DESATIVADOS').AsString = 'True' then
      CmdSelectNull := 'WHERE (NOME LIKE ' + #39 + '%' + Comeca_Com.Text  +  #39 +  ')'
    else
      CmdSelectNull := 'WHERE (NOME LIKE ' + #39 + '%' + Comeca_Com.Text   + #39 +  ') AND (STATUS = ' + #39 + 'A' + #39 + ')';

    CmdOrderBy    := 'ORDER BY NOME';

    QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

    QTabela.Prepare;
    QTabela.Open;
  end;
end;

procedure TFrmCadastro_Fornecedores.btnDeleteClick(Sender: TObject);
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
    Application.MessageBox('Fornecedor com lançamento(s)', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  IQuery.Sql.Clear;
  IQuery.Sql.Add('SELECT * FROM TRANSACOES');
  IQuery.Sql.Add('WHERE');
  IQuery.Sql.Add('(FORNECEDOR_ID = :FORNECEDOR_ID)');

  IQuery.ParamByName('FORNECEDOR_ID').AsInteger := QTabela.FieldbyName('FORNECEDOR_ID').AsInteger;

  IQuery.Prepare;
  IQuery.Open;

  if not IQuery.IsEmpty then
  begin
    Application.MessageBox('Fornecedor com lançamento(s)', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  IQuery.Sql.Clear;
  IQuery.Sql.Add('SELECT * FROM PEDIDOS');
  IQuery.Sql.Add('WHERE');
  IQuery.Sql.Add('(FORNECEDOR_ID = :FORNECEDOR_ID)');

  IQuery.ParamByName('FORNECEDOR_ID').AsInteger := QTabela.FieldbyName('FORNECEDOR_ID').AsInteger;

  IQuery.Prepare;
  IQuery.Open;

  if not IQuery.IsEmpty then
  begin
    Application.MessageBox('Fornecedor com lançamento(s)', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  IQuery.Sql.Clear;
  IQuery.Sql.Add('SELECT * FROM INVENTARIO_PRODUTOS');
  IQuery.Sql.Add('WHERE');
  IQuery.Sql.Add('(FORNECEDOR_ID = :FORNECEDOR_ID)');

  IQuery.ParamByName('FORNECEDOR_ID').AsInteger := QTabela.FieldbyName('FORNECEDOR_ID').AsInteger;

  IQuery.Prepare;
  IQuery.Open;

  if not IQuery.IsEmpty then
  begin
    Application.MessageBox('Fornecedor com lançamento(s)', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  IQuery.Sql.Clear;
  IQuery.Sql.Add('SELECT * FROM PRODUTOS');
  IQuery.Sql.Add('WHERE');
  IQuery.Sql.Add('(FORNECEDOR_ID = :FORNECEDOR_ID)');

  IQuery.ParamByName('FORNECEDOR_ID').AsInteger := QTabela.FieldbyName('FORNECEDOR_ID').AsInteger;

  IQuery.Prepare;
  IQuery.Open;

  if not IQuery.IsEmpty then
  begin
    Application.MessageBox('Fornecedor com lançamento(s)', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  IQuery.Sql.Clear;
  IQuery.Sql.Add('SELECT * FROM SERIE_PRODUTOS');
  IQuery.Sql.Add('WHERE');
  IQuery.Sql.Add('(FORNECEDOR_ID = :FORNECEDOR_ID)');

  IQuery.ParamByName('FORNECEDOR_ID').AsInteger := QTabela.FieldbyName('FORNECEDOR_ID').AsInteger;

  IQuery.Prepare;
  IQuery.Open;

  if not IQuery.IsEmpty then
  begin
    Application.MessageBox('Fornecedor com lançamento(s)', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  if Application.MessageBox('Deseja realmente excluir?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = IDYES then
  begin
    

    IQuery.Sql.Clear;
    IQuery.Sql.Add('DELETE FROM FORNECEDORES');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(FORNECEDOR_ID = :ID)');

    IQuery.ParamByName('ID').AsInteger := QTabela.FieldByName('FORNECEDOR_ID').AsInteger;

    IQuery.Prepare;
    IQuery.ExecSql;



    QTabela.Close;

    QTabela.Prepare;
    QTabela.Open;

    Set_Campos(False);
    Botoes_Normal;
  end;
end;

procedure TFrmCadastro_Fornecedores.btnDiscardClick(Sender: TObject);
begin
  Botoes_Normal;
  Set_Campos(False);
  Habilitar(False);
  Operacao := '';
  Consulta.TabVisible := True;
end;

procedure TFrmCadastro_Fornecedores.btnEditClick(Sender: TObject);
begin
  if FrmData.QAcesso.FieldByName('ALTERACAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para alteração', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  Empresa.Show;

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

  ID := QTabela.FieldByName('FORNECEDOR_ID').AsInteger;

  Botoes_Editing;
  Habilitar(True);

  Consulta.TabVisible := False;

  NOME.SetFocus;
end;

procedure TFrmCadastro_Fornecedores.btnIBGEClick(Sender: TObject);
begin
  try
    IBGE.Text := IntToStr(GetConsulta('IBGE', 0, 0, StrToInt(IBGE.Text)));
  except
    IBGE.Text := IntToStr(GetConsulta('IBGE', 0, 0, 0));
  end;
end;

procedure TFrmCadastro_Fornecedores.btnImprimeClick(Sender: TObject);
begin

  IQuery.Sql.Clear;
  IQuery.Sql.Add('SELECT * FROM FORNECEDORES');
  IQuery.Sql.Add('ORDER BY NOME');

  IQuery.Prepare;
  IQuery.Open;

  if Application.MessageBox('Deseja gerar arquivo texto?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = IDYES then
  Begin
       AssignFile(F1, ExtractFilePath(ParamStr(0)) + 'Fornecedores.txt');
       Rewrite(F1);

      QTabela.First;

      while not QTabela.Eof do
      Begin

      Writeln(F1, QTabela.FieldByName('FORNECEDOR_ID').AsString + ';' +
                  QTabela.FieldByName('NOME').AsString + ';' +
                  QTabela.FieldByName('CNPJ').AsString + ';' +
                  QTabela.FieldByName('CONTATO').AsString + ';' +
                  QTabela.FieldByName('ENDERECO').AsString + ';' +
                  QTabela.FieldByName('NUMERO').AsString + ';' +
                  QTabela.FieldByName('BAIRRO').AsString + ';' +
                  QTabela.FieldByName('COMPLEMENTO').AsString + ';' +
                  QTabela.FieldByName('MUNICIPIO').AsString + ';' +
                  QTabela.FieldByName('ESTADO').AsString + ';' +
                  QTabela.FieldByName('CEP').AsString + ';' +
                  QTabela.FieldByName('DDD').AsString + ';' +
                  QTabela.FieldByName('TELEFONE_1').AsString + ';' +
                  QTabela.FieldByName('TELEFONE_2').AsString + ';' +
                  QTabela.FieldByName('EMAIL').AsString);

      Application.ProcessMessages;
      QTabela.Next;
      End;
      CloseFile(F1);
      Application.MessageBox('Arquivo gerado executado com sucesso', PChar(Msg_Title), mb_IconInformation);
  End
  Else
    Fornecedores.PreviewModal;
  end;

procedure TFrmCadastro_Fornecedores.btnInsertClick(Sender: TObject);
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

  ESTADO.Text          := '  ';
  TIPO_FORNECEDOR.Text := 'PESSOA JURÍDICA';
  CNPJ.EditMask        := '99.999.999/9999-99;1;_';
  COD_PAIS.Text        := '01058';

  Consulta.TabVisible := False;

  NOME.SetFocus;
end;

procedure TFrmCadastro_Fornecedores.btnNextClick(Sender: TObject);
begin
  if not QTabela.Eof then
  begin
    QTabela.Next;
    Set_Campos(False);
  end;

  Botoes_Normal;
end;

procedure TFrmCadastro_Fornecedores.btnPaisClick(Sender: TObject);
begin
  try
    COD_PAIS.Text := StrZero(IntToStr(GetConsulta('PAISES', 0, 0, StrToInt(COD_PAIS.Text))), 5, 0);
  except
    COD_PAIS.Text := StrZero(IntToStr(GetConsulta('PAISES', 0, 0, 0)), 5, 0);
  end;
end;

procedure TFrmCadastro_Fornecedores.btnPesquisaClick(Sender: TObject);
var
Condicao: String;
begin
  Condicao := GetPesquisa('FORNECEDORES');

  if Condicao <> '' then
  begin
    if FrmPrincipal.Config.FieldByName('VER_DESATIVADOS').AsString = 'True' then
      CmdSelectNull := Condicao
    else
      CmdSelectNull := Condicao + ' AND (STATUS = ' + #39 + 'A' + #39 + ')';
  end;

  CmdOrderBy := 'ORDER BY FORNECEDOR_ID';

  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

  QTabela.Open;
  Set_Campos(False);
  Botoes_Normal;
end;

procedure TFrmCadastro_Fornecedores.btnPriorClick(Sender: TObject);
begin
  if not QTabela.Bof then
  begin
    QTabela.Prior;
    Set_Campos(False);
  end;
  Botoes_Normal;
end;

procedure TFrmCadastro_Fornecedores.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadastro_Fornecedores.btnSaveClick(Sender: TObject);

var
  Grau:String;

begin
  DetailSearch('');

  MUNICIPIO.Text := QIBGE.FieldByName('DESCRICAO').AsString;

  if Validacao then
  begin
    if Operacao = 'Inserindo' then
    begin
      Insert;

      QPlano.Sql.Clear;
      QPlano.Sql.Add('SELECT * FROM BANCOS');
      QPlano.Sql.Add('WHERE');
      QPlano.Sql.Add('(STATUS = :STATUS)');

      QPlano.ParamByName('STATUS').AsString := 'A';

      QPlano.Prepare;
      QPlano.Open;

      QPlano.First;
      while not QPlano.Eof do
      begin
        if QPlano.FieldByName('TIPO').AsString = 'CAIXA' then
          Grau := '1'
        else if QPlano.FieldByName('TIPO').AsString = 'BANCO' then
          Grau := '2'
        else if QPlano.FieldByName('TIPO').AsString = 'APLICAÇÃO' then
          Grau := '3';
       QPlano.Next;
      End;


      QPlano.Sql.Clear;
      QPlano.Sql.Add('SELECT * FROM FORNECEDORES');
      QPlano.Sql.Add('WHERE');
      //QPlano.Sql.Add('(STATUS = :STATUS)');
      QPlano.Sql.Add('(STATUS = :STATUS) AND (CNPJ = :CNPJ)');

      QPlano.ParamByName('STATUS').AsString := 'A';
      QPlano.ParamByName('CNPJ').AsString   := CNPJ.Text;

      QPlano.Prepare;
      QPlano.Open;

      //if QPlano.IsEmpty Then
      If not QPlano.IsEmpty Then
      begin

        GravaPlano('2.1.2.1' + Grau + '.' + StrZero(QPlano.FieldByName('FORNECEDOR_ID').AsString, 4, 0),
                               QPlano.FieldByName('NOME').AsString, 'SIM', 'F' +
                               StrZero(QPlano.FieldByName('FORNECEDOR_ID').AsString, 4, 0));

        IQuery.Sql.Clear;
        IQuery.Sql.Add('UPDATE FORNECEDORES SET COD_CONTABIL = :COD_CONTABIL');
        IQuery.Sql.Add('WHERE');
        IQuery.Sql.Add('(FORNECEDOR_ID = :FORNECEDOR_ID)');

        IQuery.ParamByName('COD_CONTABIL').AsString   := '2.1.2.1' + Grau + '.' + StrZero(QPlano.FieldByName('FORNECEDOR_ID').AsString, 4, 0);
        IQuery.ParamByName('FORNECEDOR_ID').AsInteger := QPlano.FieldByName('FORNECEDOR_ID').AsInteger;

        IQuery.Prepare;
        IQuery.ExecSql;



        //Panel3.Caption := QPlano.FieldByName('NOME').AsString;

        Application.ProcessMessages;


      end;


      CmdSelectNull := 'WHERE (CNPJ = :CNPJ)';
      CmdOrderBy    := 'ORDER BY FORNECEDOR_ID';

      QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

      QTabela.ParamByName('CNPJ').AsString := CNPJ.Text;

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
    Habilitar(False);
    Botoes_Normal;
    Operacao := '';
    Consulta.TabVisible := True;
  end;
end;

procedure TFrmCadastro_Fornecedores.Comeca_ComEnter(Sender: TObject);
begin
  Comeca_Com.Text := '';
end;

procedure TFrmCadastro_Fornecedores.Comeca_ComKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    btnComeca_ComClick(Sender);
end;

procedure TFrmCadastro_Fornecedores.DBGrid1DblClick(Sender: TObject);
begin
  Manutencao.Show;
end;

procedure TFrmCadastro_Fornecedores.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
InputString: String;
begin
  if (Key = Vk_F3) and (QTabela.FieldByName('STATUS').AsString = 'A') then
  begin
    if Application.MessageBox('Deseja realmente desativar o Fornecedor?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = IDYES then
    begin

    ID := QTabela.FieldByName('FORNECEDOR_ID').AsInteger;

    

    IQuery.Sql.Clear;
    IQuery.Sql.Add('UPDATE FORNECEDORES SET STATUS = :STATUS');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(FORNECEDOR_ID = :FORNECEDOR_ID)');

    IQuery.ParamByName('STATUS').AsString := 'D';
    IQuery.ParamByName('FORNECEDOR_ID').AsInteger := QTabela.FieldByName('FORNECEDOR_ID').AsInteger;

    IQuery.Prepare;
    IQuery.ExecSql;



    QTabela.Close;
    QTabela.Open;

    QTabela.Locate('FORNECEDOR_ID', ID, [loCaseInsensitive]);
  end;
  end;

  if (Key = Vk_F4) and (QTabela.FieldByName('STATUS').AsString = 'D') then
  begin
    ID := QTabela.FieldByName('FORNECEDOR_ID').AsInteger;

   
    IQuery.Sql.Clear;
    IQuery.Sql.Add('UPDATE FORNECEDORES SET STATUS = :STATUS');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(FORNECEDOR_ID = :FORNECEDOR_ID)');

    IQuery.ParamByName('STATUS').AsString := 'A';
    IQuery.ParamByName('FORNECEDOR_ID').AsInteger := QTabela.FieldByName('FORNECEDOR_ID').AsInteger;

    IQuery.Prepare;
    IQuery.ExecSql;



    QTabela.Close;

    QTabela.Open;

    QTabela.Locate('FORNECEDOR_ID', ID, [loCaseInsensitive]);
  end;

  if Key = VK_F5 then
  begin
    try
      InputString := InputBox('Localizar', 'ID:', '');

      if InputString <> '' then
      begin
        if FrmPrincipal.Config.FieldByName('VER_DESATIVADOS').AsString = 'True' then
          CmdSelectNull := 'WHERE (FORNECEDOR_ID = ' + InputString + ')'
        else
          CmdSelectNull := 'WHERE (FORNECEDOR_ID = ' + InputString + ') AND (STATUS = ' + #39 + 'A' + #39 + ')';

        CmdOrderBy    := 'ORDER BY FORNECEDOR_ID';

        QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

        QTabela.Prepare;
        QTabela.Open;
      end;
    except
  end;
  end;

  if Key = VK_F7 then
  begin
    InputString := InputBox('Localizar', 'Nome:', '');

    if InputString <> '' then
    begin
      if FrmPrincipal.Config.FieldByName('VER_DESATIVADOS').AsString = 'True' then
        CmdSelectNull := 'WHERE (NOME LIKE ' + #39 + '%' + InputString + '%' +  #39 + ')'
      else
        CmdSelectNull := 'WHERE (NOME LIKE ' + #39 + '%' + InputString +'%' +   #39 + ') AND (STATUS = ' + #39 + 'A' + #39 + ')';

      CmdOrderBy    := 'ORDER BY NOME';

      QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

      QTabela.Prepare;
      QTabela.Open;
    end;
  end;
end;

procedure TFrmCadastro_Fornecedores.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Manutencao.Show;
end;

procedure TFrmCadastro_Fornecedores.DBGrid1TitleClick(Column: TColumn);
begin
  CmdOrderBy       := 'ORDER BY ' + Column.FieldName;
  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

  QTabela.Prepare;
  QTabela.Open;
end;

procedure TFrmCadastro_Fornecedores.DDD_RChange(Sender: TObject);
begin
if Copy((Sender as TMaskEdit).Text,3,1) >= '1'  then
    Perform(WM_NEXTDLGCTL,0,0);
end;

procedure TFrmCadastro_Fornecedores.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmCadastro_Fornecedores.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (Operacao = 'Inserindo') or (Operacao = 'Alterando') then
  begin
    Application.MessageBox('É melhor salvar as alterações antes de continuar', PChar(Msg_Title), mb_IconStop);
    CanClose := False;
  end;
end;

procedure TFrmCadastro_Fornecedores.FormCreate(Sender: TObject);
begin
     CmdSelect := QTabela.Sql.Text;

  if FrmPrincipal.Config.FieldByName('PLANO_PROPRIO').AsString = 'False' then
    COD_CONTABIL.ReadOnly := True
  else
    COD_CONTABIL.ReadOnly := False;

  if FrmPrincipal.Config.FieldByName('MOSTRAR_CADASTROS').AsString = 'True' then
  begin
    if FrmPrincipal.Config.FieldByName('VER_DESATIVADOS').AsString = 'True' then
      CmdSelectNull := 'WHERE (FORNECEDOR_ID IS NOT NULL)'
    else
      CmdSelectNull := 'WHERE (FORNECEDOR_ID IS NOT NULL) AND (STATUS = ' + #39 + 'A' + #39 + ')';
  end
  else
  begin
    if FrmPrincipal.Config.FieldByName('VER_DESATIVADOS').AsString = 'True' then
      CmdSelectNull := 'WHERE (FORNECEDOR_ID IS NULL)'
    else
      CmdSelectNull := 'WHERE (FORNECEDOR_ID IS NULL) AND (STATUS = ' + #39 + 'A' + #39 + ')';
  end;

  CmdOrderBy := 'ORDER BY NOME';

  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

  QTabela.Open;

  Consulta.Show;
end;

procedure TFrmCadastro_Fornecedores.FormShow(Sender: TObject);
begin
  DBGrid1.SetFocus;

   if AA <> '' then
     Begin
      Manutencao.Show;

      btnInsert.OnClick(btnInsert);

      NOME.Text            := AA;
      TIPO_FORNECEDOR.Text := 'PESSOA JURÍDICA';
      FANTASIA.Text        := BB;
      Cnpj.Text            := CC;
      ENDERECO.Text        := DD;
      NUMERO.Text          := EE;
      COMPLEMENTO.Text     := FF;
      IBGE.Text            := GG;
      Municipio.Text       := HH;
      BAIRRO.Text          := Copy(II,1,20);
      CEP.Text             := Copy(JJ,1,5) + '-' + Copy(JJ,6,3) ;
      ESTADO.Text          := KK;
      COD_PAIS.Text        := '0'+ LL;
      DDD.Text             := MM;
      Telefone_1.Text      := NN;
      INSCRICAO.Text       := OO;

     End;
end;

end.
