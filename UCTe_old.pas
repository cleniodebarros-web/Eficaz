unit UCTe;

interface

uses                                       
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DBCtrls, rxCurrEdit, Mask, rxToolEdit, DB,
  IBCustomDataSet, IBQuery, Math, Buttons, IniFiles, Menus, IBStoredProc,
  ComCtrls, Grids, DBGrids, IBUpdateSQL, RDprint;

type
  TFrmCTe = class(TForm)
    Label3: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    Label41: TLabel;
    Label46: TLabel;
    Label1: TLabel;
    Bevel2: TBevel;
    btnGera: TButton;
    DT_SAIDA: TDateEdit;
    HR_SAIDA: TMaskEdit;
    CFOP_COMPL: TEdit;
    PESO_LIQUIDO: TRxCalcEdit;
    QUANTIDADE_VOLUMES: TCurrencyEdit;
    QConfig_CTEFiscal: TIBQuery;
    QItens: TIBQuery;
    QTransacao: TIBQuery;
    QNatoper: TIBQuery;
    QParceiro: TIBQuery;
    QProdutos: TIBQuery;
    QCFOP: TIBQuery;
    QTabela: TIBQuery;
    IQuery: TIBQuery;
    TRANSACAO_ID: TCurrencyEdit;
    NO_DOC_FISCAL: TCurrencyEdit;
    Label5: TLabel;
    FORMA_EMISSAO: TComboBox;
    Label6: TLabel;
    FINALIDADE_EMISSAO: TComboBox;
    btnRetorna: TBitBtn;
    QParcelas: TIBQuery;
    Menu_GeraXML: TPopupMenu;
    GerarXML: TMenuItem;
    QDetalhe: TIBQuery;
    LOCAL_EMBARQUE: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    UF_EMBARQUE: TComboBox;
    Label9: TLabel;
    COND_PAGTO: TComboBox;
    ID_Transacao: TIBStoredProc;
    Empresa_id: TCurrencyEdit;
    INSTRUCOES_2: TMemo;
    Label10: TLabel;
    TIPO_SERVICO: TComboBox;
    Label11: TLabel;
    Label12: TLabel;
    TIPO_TRANSPORTE: TComboBox;
    Label13: TLabel;
    TOMADOR_SERVICO: TComboBox;
    Label16: TLabel;
    PROD_PRINCIPAL: TEdit;
    Label17: TLabel;
    DT_PREVISAO: TDateEdit;
    Label18: TLabel;
    HR_PREVISAO: TMaskEdit;
    Grid_Notas: TDBGrid;
    Label14: TLabel;
    QNotas: TIBQuery;
    DataNotas: TDataSource;
    StatusBar2: TStatusBar;
    USql_Notas: TIBUpdateSQL;
    RDprint1: TRDprint;
    Button1: TButton;
    Label33: TLabel;
    Label36: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    btnFornecedor: TSpeedButton;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    NOME_TRANSPORTADOR: TEdit;
    PLACA_VEICULO: TEdit;
    ENDERECO_TRANSPORTADOR: TEdit;
    MUNICIPIO_TRANSPORTADOR: TEdit;
    INSCRICAO_TRANSPORTADOR: TEdit;
    UF_VEICULO: TComboBox;
    UF_TRANSPORTADOR: TComboBox;
    CNPJ_TRANSPORTADOR: TEdit;
    BAIRRO_TRANSPORTADOR: TEdit;
    N_TRANSPORTADOR: TEdit;
    EMAIL_TRANSPORTADOR: TEdit;
    lbl1: TLabel;
    IBGE: TEdit;
    btnIBGE: TSpeedButton;
    lbl2: TLabel;
    Lotacao: TComboBox;
    lbl3: TLabel;
    lbl4: TLabel;
    Motorista: TEdit;
    lbl5: TLabel;
    CPF_MOTORISTA: TEdit;
    Unidade: TComboBox;
    lbl6: TLabel;
    CEP_TRANSPORTADOR: TMaskEdit;
    Bevel1: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Instrucoes: TComboBox;
    procedure DT_SAIDAKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CNPJ_TRANSPORTADORKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnGeraClick(Sender: TObject);
    procedure CFOP_COMPLExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFornecedorClick(Sender: TObject);
    procedure DT_SAIDAEnter(Sender: TObject);
    procedure GerarXMLClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure QNotasAfterPost(DataSet: TDataSet);
    procedure QNotasNewRecord(DataSet: TDataSet);
    procedure Grid_NotasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Grid_NotasKeyPress(Sender: TObject; var Key: Char);
    procedure QNotasBeforeEdit(DataSet: TDataSet);
    procedure QNotasBeforePost(DataSet: TDataSet);
    procedure QNotasAfterOpen(DataSet: TDataSet);
    procedure COND_PAGTOExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DT_SAIDAExit(Sender: TObject);
    procedure btnIBGEClick(Sender: TObject);
    procedure btnBtn_embcpClick(Sender: TObject);
    procedure LotacaoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public }
    function Search_Campo(Txt: String): Integer;
    procedure ProdutoSearch(ID: Integer);
    function Validacao: Boolean;
    procedure DetailSearch(Tabela: String);
    procedure Set_Campos(Vazio: Boolean);
    procedure Insert;
    procedure Edit;
  end;

var
  FrmCTe: TFrmCTe;
  ID: Integer;
  GeraXML,e_mail: Boolean;
  Cod_CFOP: String;

  procedure CTe(Transacao_Id: Integer; CFOP: String);

implementation

uses
  UPrincipal, UData, pcnConversao, UConsulta, UConsulta_CFOP,UPasswordDlg,UAcesso,UConsulta_CST;

{$R *.dfm}

procedure TFrmCTe.Set_Campos(Vazio: Boolean);
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

      if Temp is TRadioGroup then
        TRadioGroup(Temp).ItemIndex := -1;

      if Temp is TCurrencyEdit then
        TCurrencyEdit(Temp).Value := 0;

      if Temp is TRxCalcEdit then
        TRxCalcEdit(Temp).Value := 0;

      if Temp is TMemo then
        TMemo(Temp).Lines.Text := '';
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

      if Temp is TRadioGroup then
        TRadioGroup(Temp).ItemIndex := QTabela.FieldByName(TRadioGroup(Temp).Name).AsInteger;

      if Temp is TCurrencyEdit then
        TCurrencyEdit(Temp).Value := QTabela.FieldByName(TCurrencyEdit(Temp).Name).AsFloat;

      if Temp is TRxCalcEdit then
        TRxCalcEdit(Temp).Value := QTabela.FieldByName(TRxCalcEdit(Temp).Name).AsFloat;

      if Temp is TMemo then
        TMemo(Temp).Lines.Text := QTabela.FieldByName(TMemo(Temp).Name).AsString;
    end;
  end;
end;

procedure TFrmCTe.Insert;
var
I: Integer;
Temp: TComponent;
Sql, Par: String;
begin
  Sql := 'INSERT INTO COMPL_CTEFISCAL(';
  Par := '';

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
    begin
      if Sql = 'INSERT INTO COMPL_CTEFISCAL(' then
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
      if Sql = 'INSERT INTO COMPL_CTEFISCAL(' then
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
      if Sql = 'INSERT INTO COMPL_CTEFISCAL(' then
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
      if Sql = 'INSERT INTO COMPL_CTEFISCAL(' then
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
      if Sql = 'INSERT INTO COMPL_CTEFISCAL(' then
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
      if Sql = 'INSERT INTO COMPL_CTEFISCAL(' then
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
      if Sql = 'INSERT INTO COMPL_CTEFISCAL(' then
        Sql := Sql + TRadioGroup(Temp).Name
      else
        Sql := Sql + ', ' + TRadioGroup(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TRadioGroup(Temp).Name
      else
        Par := Par + ', :' + TRadioGroup(Temp).Name;
    end;

    if Temp is TMemo then
    begin
      if Sql = 'INSERT INTO COMPL_CTEFISCAL(' then
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

  if not FrmData.Trans_Eficaz.InTransaction then
    FrmData.Trans_Eficaz.StartTransaction;

  IQuery.Sql.Clear;
  IQuery.Sql.Add(Sql);

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
      IQuery.ParamByName(TEdit(Temp).Name).AsString := TEdit(Temp).Text;

    if Temp is TMaskEdit then
      IQuery.ParamByName(TMaskEdit(Temp).Name).AsString := TMaskEdit(Temp).Text;

    if Temp is TCurrencyEdit then
      IQuery.ParamByName(TCurrencyEdit(Temp).Name).AsFloat := TCurrencyEdit(Temp).Value;

    if Temp is TRxCalcEdit then
      IQuery.ParamByName(TRxcalcEdit(Temp).Name).AsFloat := TRxCalcEdit(Temp).Value;

    if Temp is TRadioGroup then
      IQuery.ParamByName(TRadioGroup(Temp).Name).AsInteger := TRadioGroup(Temp).ItemIndex;

    if Temp is TDateEdit then
      IQuery.ParamByName(TDateEdit(Temp).Name).AsDateTime := TDateEdit(Temp).Date;

    if Temp is TComboBox then
      IQuery.ParamByName(TComboBox(Temp).Name).AsString := TComboBox(Temp).Text;

    if Temp is TMemo then
      IQuery.ParamByName(TMemo(Temp).Name).AsMemo := TMemo(Temp).Lines.Text;
  end;

  IQuery.Prepare;
  IQuery.ExecSql;

  FrmData.Trans_Eficaz.CommitRetaining;
end;

procedure TFrmCTe.LotacaoChange(Sender: TObject);
begin
if Lotacao.Text =  'SIM' then
bEGIN
Motorista.Enabled     := True;
CPF_MOTORISTA.Enabled := True;
PLACA_VEICULO.Enabled := True;
UF_VEICULO.Enabled    := True;
INSTRUCOES.Enabled    := True;
INSTRUCOES_2.Enabled  := True;
end
eLSE
bEGIN
Motorista.Enabled     := False;
CPF_MOTORISTA.Enabled := False;
PLACA_VEICULO.Enabled := False;
UF_VEICULO.Enabled    := False;
INSTRUCOES.Enabled    := False;
INSTRUCOES_2.Enabled  := False;
end;
end;

procedure TFrmCTe.Edit;
var
I: Integer;
Temp: TComponent;
Sql: String;
begin
  Sql := 'UPDATE COMPL_CTEFISCAL SET ';

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
    begin
      if Sql = 'UPDATE COMPL_CTEFISCAL SET ' then
        Sql := Sql + TEdit(Temp).Name + ' = :' + TEdit(Temp).Name
      else
        Sql := Sql + ', ' + TEdit(Temp).Name + ' = :' + TEdit(Temp).Name;
    end;

    if Temp is TMaskEdit then
    begin
      if Sql = 'UPDATE COMPL_CTEFISCAL SET ' then
        Sql := Sql + TMaskEdit(Temp).Name + ' = :' + TMaskEdit(Temp).Name
      else
        Sql := Sql + ', ' + TMaskEdit(Temp).Name + ' = :' + TMaskEdit(Temp).Name;
    end;

    if Temp is TDateEdit then
    begin
      if Sql = 'UPDATE COMPL_CTEFISCAL SET ' then
        Sql := Sql + TDateEdit(Temp).Name + ' = :' + TDateEdit(Temp).Name
      else
        Sql := Sql + ', ' + TDateEdit(Temp).Name + ' = :' + TDateEdit(Temp).Name;
    end;

    if Temp is TCurrencyEdit then
    begin
      if Sql = 'UPDATE COMPL_CTEFISCAL SET ' then
        Sql := Sql + TCurrencyEdit(Temp).Name + ' = :' + TCurrencyEdit(Temp).Name
      else
        Sql := Sql + ', ' + TCurrencyEdit(Temp).Name + ' = :' + TCurrencyEdit(Temp).Name;
    end;

    if Temp is TRxCalcEdit then
    begin
      if Sql = 'UPDATE COMPL_CTEFISCAL SET ' then
        Sql := Sql + TRxCalcEdit(Temp).Name + ' = :' + TRxCalcEdit(Temp).Name
      else
        Sql := Sql + ', ' + TRxCalcEdit(Temp).Name + ' = :' + TRxCalcEdit(Temp).Name;
    end;

    if Temp is TRadioGroup then
    begin
      if Sql = 'UPDATE COMPL_CTEFISCAL SET ' then
        Sql := Sql + TRadioGroup(Temp).Name + ' = :' + TRadioGroup(Temp).Name
      else
        Sql := Sql + ', ' + TRadioGroup(Temp).Name + ' = :' + TRadioGroup(Temp).Name;
    end;

    if Temp is TComboBox then
    begin
      if Sql = 'UPDATE COMPL_CTEFISCAL SET ' then
        Sql := Sql + TComboBox(Temp).Name + ' = :' + TComboBox(Temp).Name
      else
        Sql := Sql + ', ' + TComboBox(Temp).Name + ' = :' + TComboBox(Temp).Name;
    end;

    if Temp is TMemo then
    begin
      if Sql = 'UPDATE COMPL_CTEFISCAL SET ' then
        Sql := Sql + TMemo(Temp).Name + ' = :' + TMemo(Temp).Name
      else
        Sql := Sql + ', ' + TMemo(Temp).Name + ' = :' + TMemo(Temp).Name;
    end;
  end;

  Sql := Sql + ' WHERE (TRANSACAO_ID = :ID) AND (NO_DOC_FISCAL = :NUM_DOC)';

 //Showmessage(QTransacao.FieldByName('NUM_DOC').AsString + ' ' + QTransacao.FieldByName('TRANSACAO_ID').AsString  );
 
  if not FrmData.Trans_Eficaz.InTransaction then
    FrmData.Trans_Eficaz.StartTransaction;

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
      IQuery.ParamByName(TRxCalcEdit(Temp).Name).AsFloat := TRxCalcEdit(Temp).Value;

    if Temp is TRadioGroup then
      IQuery.ParamByName(TRadioGroup(Temp).Name).AsInteger := TRadioGroup(Temp).ItemIndex;

    if Temp is TMemo then
      IQuery.ParamByName(TMemo(Temp).Name).AsMemo := TMemo(Temp).Lines.Text;
  end;

  IQuery.ParamByName('ID').AsInteger       := QTransacao.FieldByName('TRANSACAO_ID').AsInteger;
  IQuery.ParamByName('NUM_DOC').AsString   := NO_DOC_FISCAL.Text;

  IQuery.Prepare;
  IQuery.ExecSql;


  FrmData.Trans_Eficaz.CommitRetaining;
  
  QTabela.Close;
  QTabela.Open;
end;

function TFrmCTe.Validacao: Boolean;
begin
  Result := False;

  CFOP_COMPL.Color         := clWindow;
  CNPJ_Transportador.Color := clWindow;
  UF_VEICULO.Color         := clWindow;
  UF_TRANSPORTADOR.Color   := clWindow;
  FORMA_EMISSAO.Color      := clWindow;
  FINALIDADE_EMISSAO.Color := clWindow;

  if (QCFOP.IsEmpty) and (CFOP_COMPL.Text <> '') then
  begin
    Application.MessageBox('CFOP inexistente', PChar(Msg_Title), mb_IconStop);
    CFOP_COMPL.Color := clYellow;
    CFOP_COMPL.SetFocus;
    exit;
  end;

  if (IBGE.Text = '') then
  begin
    Application.MessageBox('Código IBGE inexistente', PChar(Msg_Title), mb_IconStop);
    IBGE.Color := clYellow;
    IBGE.SetFocus;
    exit;
  end;

  if length(CNPJ_TRANSPORTADOR.Text) <= 11 then
  begin
    if not ValidCpf(StrZero(CNPJ_TRANSPORTADOR.Text, 11, 0)) then
    begin
      Application.MessageBox('Dígito Verificador do CPF inválido', PChar(Msg_Title), mb_IconStop);
      CNPJ_TRANSPORTADOR.Color := clYellow;
      CNPJ_TRANSPORTADOR.SetFocus;
      exit;
    end;
  end
  else
  begin
    if not ValidCgc(StrZero(CNPJ_TRANSPORTADOR.Text, 14, 0)) then
    begin
      Application.MessageBox('Dígito Verificador do CNPJ inválido', PChar(Msg_Title), mb_IconStop);
      CNPJ_TRANSPORTADOR.Color := clYellow;
      CNPJ_TRANSPORTADOR.SetFocus;
      exit;
    end;
  end;

  if (UF_VEICULO.Text <> '  ') and (not ChecaEstado(UF_VEICULO.Text)) then
  begin
    Application.MessageBox('Estado inválido', PChar(Msg_Title), mb_IconStop);
    UF_VEICULO.Color := clYellow;
    UF_VEICULO.SetFocus;
    exit;
  end;

  if (UF_TRANSPORTADOR.Text <> '  ') and (not ChecaEstado(UF_TRANSPORTADOR.Text)) then
  begin
    Application.MessageBox('Estado inválido', PChar(Msg_Title), mb_IconStop);
    UF_TRANSPORTADOR.Color := clYellow;
    UF_TRANSPORTADOR.SetFocus;
    exit;
  end;

  if (FORMA_EMISSAO.Text <> 'NORMAL') and (FORMA_EMISSAO.Text <> 'CONTINGÊNCIA FS') and (FORMA_EMISSAO.Text <> 'CONTINGÊNCIA C/ SCAN') and (FORMA_EMISSAO.Text <> 'CONTINGÊNCIA VIA DPEC') and (FORMA_EMISSAO.Text <> 'CONTINGÊNCIA FS-DA') then
  begin
    Application.MessageBox('Forma de Emissão inválida', PChar(Msg_Title), mb_IconStop);
    FORMA_EMISSAO.Color := clYellow;
    FORMA_EMISSAO.SetFocus;
    exit;
  end;

  if (FINALIDADE_EMISSAO.Text <> '1-NFE NORMAL') and (FINALIDADE_EMISSAO.Text <> '2-NFE COMPLEMENTAR') and (FINALIDADE_EMISSAO.Text <> '3-NFE DE AJUSTE') then
  begin
    Application.MessageBox('Finalidade de Emissão inválida', PChar(Msg_Title), mb_IconStop);
    FINALIDADE_EMISSAO.Color := clYellow;
    FINALIDADE_EMISSAO.SetFocus;
    exit;
  end;

  if (TIPO_TRANSPORTE.Text <> 'RODOVIÁRIO') and (TIPO_TRANSPORTE.Text <> 'AÉREO') and (TIPO_TRANSPORTE.Text <> 'AQUAVIÁRIO') and (TIPO_TRANSPORTE.Text <> 'FERROVIÁRIO') and (TIPO_TRANSPORTE.Text <> 'DUTOVIÁRIO') then
  begin
    Application.MessageBox('Tipo de Transporte inválido', PChar(Msg_Title), mb_IconStop);
    TIPO_TRANSPORTE.Color := clYellow;
    TIPO_TRANSPORTE.SetFocus;
    exit;
  end;

  if (TOMADOR_SERVICO.Text <> 'REMETENTE') and (TOMADOR_SERVICO.Text <> 'DESTINATÁRIO') and (TOMADOR_SERVICO.Text <> 'RECEBEDOR') and (TOMADOR_SERVICO.Text <> 'EXPEDIDOR') and (TOMADOR_SERVICO.Text <> 'OURTOS') then
  begin
    Application.MessageBox('Tomador de Serviço inválido', PChar(Msg_Title), mb_IconStop);
    TOMADOR_SERVICO.Color := clYellow;
    TOMADOR_SERVICO.SetFocus;
    exit;
  end;

  if (TIPO_SERVICO.Text <> 'NORMAL') and (TIPO_SERVICO.Text <> 'SUBCONTRATAÇÃO') and (TIPO_SERVICO.Text <> 'REDESPACHO') and (TIPO_SERVICO.Text <> 'INTERMEDIÁRIO')  then
  begin
    Application.MessageBox('Tipo de Serviço inválido', PChar(Msg_Title), mb_IconStop);
    TIPO_SERVICO.Color := clYellow;
    TIPO_SERVICO.SetFocus;
    exit;
  end;


  if Lotacao.Text = 'SIM' then
  begin
   if (PLACA_VEICULO.Text = '')  then
   begin
    Application.MessageBox('Placa do Veículo inválida', PChar(Msg_Title), mb_IconStop);
    PLACA_VEICULO.Color := clYellow;
    PLACA_VEICULO.SetFocus;
    exit;
   end;

   if (UF_VEICULO.Text = '')  then
   begin
    Application.MessageBox('Uf do Veículo inválido ', PChar(Msg_Title), mb_IconStop);
    UF_VEICULO.Color := clYellow;
    UF_VEICULO.SetFocus;
    exit;
   end;

   if (INSTRUCOES_2.Text = '')  then
   begin
    Application.MessageBox('RNTRC do veículo inválido ', PChar(Msg_Title), mb_IconStop);
    INSTRUCOES_2.Color := clYellow;
    INSTRUCOES_2.SetFocus;
    exit;
   end;

   if (INSTRUCOES.Text = '')  then
   begin
    Application.MessageBox('Tipo do veículo inválido ', PChar(Msg_Title), mb_IconStop);
    INSTRUCOES.Color := clYellow;
    INSTRUCOES.SetFocus;
    exit;
   end;

   if (CPF_MOTORISTA.Text = '')  then
   begin
    Application.MessageBox('Documento do motorista inválido ', PChar(Msg_Title), mb_IconStop);
    CPF_MOTORISTA.Color := clYellow;
    CPF_MOTORISTA.SetFocus;
    exit;
   end;


   if (MOTORISTA.Text = '')  then
   begin
    Application.MessageBox('Nome do motorista inválido ', PChar(Msg_Title), mb_IconStop);
    MOTORISTA.Color := clYellow;
    MOTORISTA.SetFocus;
    exit;
   end;

  end;
  Result := True;
end;

procedure TFrmCTe.DetailSearch(Tabela: String);
begin
  if ((Tabela = '') or (Tabela = 'CFOP')) and (CFOP_COMPL.Text <> '') then
  begin
    QCFOP.Close;

    QCFOP.ParamByName('COD_CFOP').AsString := CFOP_COMPL.Text;
    QCFOP.Prepare;

    QCFOP.Open;
  end;
end;

function TFrmCTe.Search_Campo(Txt: String): Integer;
begin
  QConfig_CTEFISCAL.Sql.Clear;
  QConfig_CTEFISCAL.Sql.Add('SELECT * FROM CONFIG_CTEFISCAL');
  QConfig_CTEFISCAL.Sql.Add('WHERE');
  QConfig_CTEFISCAL.Sql.Add('(CAMPO = :CAMPO)');

  QConfig_CTEFISCAL.ParamByName('CAMPO').AsString := Txt;

  QConfig_CTEFISCAL.Prepare;
  QConfig_CTEFISCAL.Open;

  if not QConfig_CTEFISCAL.IsEmpty then
    Result := QConfig_CTEFISCAL.FieldByName('COLUNA').AsInteger
  else
    Result := 0;
end;

procedure CTe(Transacao_Id: Integer; CFOP: String);
begin
  ID       := Transacao_Id;
  Cod_CFOP := CFOP;

  Application.CreateForm(TFrmCTe, FrmCTe);
  try
    FrmCTe.ShowModal;
  finally
    FrmCTe.Release;
  end;
end;

procedure TFrmCTe.ProdutoSearch(ID: Integer);
begin
  QProdutos.Sql.Clear;
  QProdutos.Sql.Add('SELECT PRODUTOS.*, TRIBUTOS.ORIGEM, TRIBUTOS.TRIBUTACAO,IBTP.ALIQNAC,IBTP.ALIQIMP');
  QProdutos.Sql.Add('FROM PRODUTOS');
  QProdutos.Sql.Add('INNER JOIN TRIBUTOS');
  QProdutos.Sql.Add('ON (PRODUTOS.TRIBUTO_ID = TRIBUTOS.TRIBUTO_ID)');
  QProdutos.Sql.Add('LEFT JOIN IBTP');
  QProdutos.Sql.Add('ON (PRODUTOS.NCM = IBTP.CODIGO)');
  QProdutos.Sql.Add('WHERE');
  QProdutos.Sql.Add('(PRODUTOS.PRODUTO_ID = :PRODUTO_ID)');

  if StrToInt(LeIni(Arq_Ini, 'Sistema', 'Localização')) > 0 then
  begin
    QProdutos.Sql.Add('AND (PRODUTOS.LOCALIZACAO_ID = :LOCALIZACAO_ID)');

    QProdutos.ParamByName('LOCALIZACAO_ID').AsInteger := StrToInt(LeIni(Arq_Ini, 'Sistema', 'Localização'));
  end;

  QProdutos.ParamByName('PRODUTO_ID').AsInteger := ID;

  QProdutos.Prepare;
  QProdutos.Open;
end;

procedure TFrmCTe.QNotasAfterOpen(DataSet: TDataSet);
begin
TFloatField(QNotas.FieldByName('BASE_ICMS_NORMAL')).DisplayFormat  := '#,##0.00';
TFloatField(QNotas.FieldByName('VR_ICMS_NORMAL')).DisplayFormat    := '#,##0.00';
TFloatField(QNotas.FieldByName('BASE_ICMS_ST')).DisplayFormat      := '#,##0.00';
TFloatField(QNotas.FieldByName('VR_ICMS_ST')).DisplayFormat        := '#,##0.00';
TFloatField(QNotas.FieldByName('VALOR_PRODUTOS')).DisplayFormat    := '#,##0.00';
TFloatField(QNotas.FieldByName('VALOR')).DisplayFormat             := '#,##0.00';
TFloatField(QNotas.FieldByName('DT_EMISSAO')).EditMask             :='!99/99/0000;1;_';
end;

procedure TFrmCTe.QNotasAfterPost(DataSet: TDataSet);
begin
  FrmData.Trans_Eficaz.CommitRetaining;
end;

procedure TFrmCTe.QNotasBeforeEdit(DataSet: TDataSet);
begin
if FrmData.QAcesso.FieldByName('ALTERACAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para alteração', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

end;

procedure TFrmCTe.QNotasBeforePost(DataSet: TDataSet);
begin
  if (QNotas.FieldByName('VALOR').AsFloat = 0)  then
  begin
    Application.MessageBox('Valor da Nota não pode ser Zero!', PChar(Msg_Title), mb_IconStop);
    Grid_Notas.SelectedIndex := 10;
    abort;
  end;

  if (QNotas.FieldByName('VALOR_PRODUTOS').AsFloat = 0)  then
  begin
    Application.MessageBox('Valor dos Produtos não pode ser Zero!', PChar(Msg_Title), mb_IconStop);
    Grid_Notas.SelectedIndex := 9;
    abort;
  end;

  if (QNotas.FieldByName('CFOP').AsString = '')  then
  begin
    Application.MessageBox('Favor informar CFOP!', PChar(Msg_Title), mb_IconStop);
    Grid_Notas.SelectedIndex := 4;
    abort;
  end;
end;

procedure TFrmCTe.QNotasNewRecord(DataSet: TDataSet);
begin
DataSet['TRANSACAO_ID']     := QTransacao.FieldByName('TRANSACAO_ID').AsInteger;
DataSet['BASE_ICMS_NORMAL'] := 0;
DataSet['VR_ICMS_NORMAL']   := 0;
DataSet['BASE_ICMS_ST']     := 0;
DataSet['VR_ICMS_ST']       := 0;
DataSet['VALOR_PRODUTOS']   := 0;
DataSet['VALOR']            := 0;
DataSet['ROMANEIO']         := ' ';
DataSet['PEDIDO']           := ' ';
DataSet['CHAVE_NFE']        := ' ';
end;

procedure TFrmCTe.btnBtn_embcpClick(Sender: TObject);
begin
  UNIDADE.Text := GetConsulta_CST('EMBALAGEM', UNIDADE.Text);
end;

procedure TFrmCTe.btnFornecedorClick(Sender: TObject);
var
Forne: Integer;
begin
  Forne := GetConsulta('CLIENTES', 0, 0, 0);

  IQuery.Sql.Clear;
  IQuery.Sql.Add('SELECT * FROM CLIENTES');
  IQuery.Sql.Add('WHERE');
  IQuery.Sql.Add('(CLIENTE_ID = :CLIENTE_ID)');

  IQuery.ParamByName('CLIENTE_ID').AsInteger := Forne;

  IQuery.Prepare;
  IQuery.Open;

  if not IQuery.IsEmpty then
  begin
    NOME_TRANSPORTADOR.Text      := IQuery.FieldByName('NOME').AsString;
    CNPJ_TRANSPORTADOR.Text      := SemMascara(IQuery.FieldByName('CNPJ').AsString);
    ENDERECO_TRANSPORTADOR.Text  := IQuery.FieldByName('ENDERECO').AsString;
    MUNICIPIO_TRANSPORTADOR.Text := IQuery.FieldByName('MUNICIPIO').AsString;
    N_TRANSPORTADOR.Text         := IQuery.FieldByName('NUMERO').AsString;
    BAIRRO_TRANSPORTADOR.Text    := IQuery.FieldByName('BAIRRO').AsString;
    UF_TRANSPORTADOR.Text        := IQuery.FieldByName('ESTADO').AsString;
    IBGE.Text                    := IQuery.FieldByName('IBGE').AsString;
    CEP_TRANSPORTADOR.Text       := IQuery.FieldByName('CEP').AsString;


    if IQuery.FieldByName('INSCRICAO').AsString = '' then
    INSCRICAO_TRANSPORTADOR.Text := 'ISENTO'
    Else
    INSCRICAO_TRANSPORTADOR.Text := IQuery.FieldByName('INSCRICAO').AsString;

    Email_TRANSPORTADOR.Text     := IQuery.FieldByName('EMAIL').AsString;
  end;
end;

procedure TFrmCTe.btnGeraClick(Sender: TObject);
var
Id_Trans,Item: Integer;
Cond_origem,Dpt_origem,IniFile, edtSmtpHost, edtSmtpPort, edtSmtpUser, edtSmtpPass, edtEmailAssunto, Insc_Dest: String;
cbEmailSSL, ok: Boolean;
Ini: TIniFile;
StreamMemo: TMemoryStream;
Vr_trib_acum,Vl_Trans :Real;

begin

  DetailSearch('');

  IQuery.SQL.Clear;
  IQuery.Sql.Add('SELECT * FROM TRANSITENS_NOTAS');
  IQuery.Sql.Add('WHERE TRANSACAO_ID = :TRANSACAO_ID');

  IQuery.ParamByName('TRANSACAO_ID').AsInteger := QTransacao.FieldByName('TRANSACAO_ID').AsInteger;

  IQuery.Prepare;
  IQuery.Open;

  if IQuery.IsEmpty then
  Begin
  MessageDlg('Favor informar o documento fiscal para o transporte',MTINFORMATION,[MBOK],0);
  Grid_Notas.SetFocus;
  Abort
  End;

  if Validacao then
  begin
    if NO_DOC_FISCAL.Value > 0 then
      Edit
    else
      Insert;

    QTabela.Sql.Clear;
    QTabela.Sql.Add('SELECT * FROM COMPL_CTEFISCAL');
    QTabela.Sql.Add('WHERE');
    QTabela.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

    QTabela.ParamByName('TRANSACAO_ID').AsInteger := ID;

    QTabela.Prepare;
    QTabela.Open;

    Set_Campos(False);

    btnGera.Enabled    := False;
    btnRetorna.Enabled := False;

    try
      if ((QTransacao.FieldByName('CONDUTA').AsString = '02') and (QTransacao.FieldByName('DEPTO').AsString = '10')) or ((QTransacao.FieldByName('CONDUTA').AsString = '01') and (QTransacao.FieldByName('DEPTO').AsString = '07')) then
      begin
        QParceiro.Sql.Clear;
        QParceiro.Sql.Add('SELECT * FROM CLIENTES');
        QParceiro.Sql.Add('WHERE');
        QParceiro.Sql.Add('(CLIENTE_ID = :CLIENTE_ID)');

        QParceiro.ParamByName('CLIENTE_ID').AsInteger := QTransacao.FieldByName('CLIENTE_ID').AsInteger;

        QParceiro.Prepare;
        QParceiro.Open;

        if (QParceiro.FieldByName('TIPO_CLIENTE').AsString = 'PESSOA FÍSICA') AND (Copy(QParceiro.FieldByName('INSCRICAO').AsString ,1,2) <> 'PR') then
          Insc_Dest := 'ISENTO'
        else
          Insc_Dest := QParceiro.FieldByName('INSCRICAO').AsString;
      end;

      if ((QTransacao.FieldByName('CONDUTA').AsString = '01') and (QTransacao.FieldByName('DEPTO').AsString = '10')) or ((QTransacao.FieldByName('CONDUTA').AsString = '02') and (QTransacao.FieldByName('DEPTO').AsString = '07')) then
      begin
        QParceiro.Sql.Clear;
        QParceiro.Sql.Add('SELECT * FROM FORNECEDORES');
        QParceiro.Sql.Add('WHERE');
        QParceiro.Sql.Add('(FORNECEDOR_ID = :FORNECEDOR_ID)');

        QParceiro.ParamByName('FORNECEDOR_ID').AsInteger := QTransacao.FieldByName('FORNECEDOR_ID').AsInteger;

        QParceiro.Prepare;
        QParceiro.Open;

        if (QParceiro.FieldByName('TIPO_FORNECEDOR').AsString = 'PESSOA FÍSICA') AND (Copy(QParceiro.FieldByName('INSCRICAO').AsString ,1,2) <> 'PR') then
          Insc_Dest := 'ISENTO'
        else
          Insc_Dest := QParceiro.FieldByName('INSCRICAO').AsString;
      end;

      if (QTransacao.FieldByName('CONDUTA').AsString = '20') and (QTransacao.FieldByName('DEPTO').AsString = '07') then
      begin
        QParceiro.Sql.Clear;
        QParceiro.Sql.Add('SELECT RAZAO AS NOME, CNPJ, ENDERECO, NUMERO, BAIRRO, CEP, MUNICIPIO, ESTADO, INSCR_ESTADUAL AS INSCRICAO');
        QParceiro.Sql.Add('FROM EMPRESAS');
        QParceiro.Sql.Add('WHERE');
        QParceiro.Sql.Add('(EMPRESA_ID = :EMPRESA_ID)');

        QParceiro.ParamByName('EMPRESA_ID').AsInteger := QTransacao.FieldByName('EMPRESAAUX_ID').AsInteger;

        QParceiro.Prepare;
        QParceiro.Open;

        Insc_Dest := QParceiro.FieldByName('INSCRICAO').AsString;
      end;

      QNatoper.Sql.Clear;
      QNatoper.Sql.Add('SELECT * FROM CFOP');
      QNatoper.Sql.Add('WHERE');
      QNatoper.Sql.Add('(COD_CFOP = :COD_CFOP)');

      QNatoper.ParamByName('COD_CFOP').AsString := QTransacao.FieldByName('CFOP').AsString;

      QNatoper.Prepare;
      QNatoper.Open;

      QItens.Sql.Clear;
      QItens.Sql.Add('SELECT * FROM TRANSITENS');
      QItens.Sql.Add('WHERE');
      QItens.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

      QItens.ParamByName('TRANSACAO_ID').AsInteger := ID;

      QItens.Prepare;
      QItens.Open;



      if FORMA_EMISSAO.Text = 'NORMAL' then
        FrmPrincipal.ACBrCte1.Configuracoes.Geral.FormaEmissao := teNormal
      else if FORMA_EMISSAO.Text = 'CONTINGÊNCIA FS' then
        FrmPrincipal.ACBrCte1.Configuracoes.Geral.FormaEmissao := teContingencia
      else if FORMA_EMISSAO.Text = 'CONTINGÊNCIA C/ SCAN' then
        FrmPrincipal.ACBrCTe1.Configuracoes.Geral.FormaEmissao := teSCAN
      else if FORMA_EMISSAO.Text = 'CONTINGÊNCIA VIA DPEC' then
        FrmPrincipal.ACBrCTe1.Configuracoes.Geral.FormaEmissao := teDPEC
      else if FORMA_EMISSAO.Text = 'CONTINGÊNCIA FS-DA' then
        FrmPrincipal.ACBrCTe1.Configuracoes.Geral.FormaEmissao := teFSDA;

      FrmPrincipal.ACBrCTe1.Conhecimentos.Clear;

      with FrmPrincipal.ACBrCTe1.Conhecimentos.Add.CTe do
      begin
       // InfCTe.
        infCTE.ID    := NO_DOC_FISCAL.Text;


        Ide.cUF   := StrToInt(Copy(FrmPrincipal.QEmpresa.FieldByName('IBGE').AsString, 1, 2));
        Ide.cCT   := StrToInt(NO_DOC_FISCAL.Text);
        Ide.natOp := Copy(QNatoper.FieldByName('DESC_CFOP').AsString, 1, 60);
        Ide.CFOP  := StrToInt(QTransacao.FieldByName('CFOP').AsString);
        Ide.natOp := 'PRESTAÇÃO DE SERVIÇO';

        if COND_PAGTO.ItemIndex = 0 then
          Ide.forPag := fpPago
        else if COND_PAGTO.ItemIndex = 1 then
          Ide.forPag := fpAPagar;

        //else
        //  Ide.forPag := fpOutras;


        Ide.modelo   := '57';
        Ide.serie    := QTransacao.FieldByName('SERIE').AsInteger;
        Ide.nCT      := StrToInt(NO_DOC_FISCAL.Text);
       // Ide.dhCont   := QTransacao.FieldByName('DT_TRANS').AsDateTime;
        Ide.dhEmi    := DT_SAIDA.Date;
        //Ide.  := StrToTime(hr_saida.Text);

       { if (QTransacao.FieldByName('CONDUTA').AsString = '01') or (QTransacao.FieldByName('CONDUTA').AsString = '20') then
          Ide.tpCTe := tnSaida
        else}

//        Ide.refNFP
//        Ide.tpImp
//        Ide.tpEmis
//        Ide.cDV
//        Ide.tpAmb

        if FORMA_EMISSAO.Text = 'NORMAL' then
          Ide.tpEmis := teNormal
        else if FORMA_EMISSAO.Text = 'CONTINGÊNCIA FS' then
          Ide.tpEmis := teFSDA
        else if FORMA_EMISSAO.Text = 'CONTINGÊNCIA C/ SCAN' then
          Ide.tpEmis := teSCAN
        else if FORMA_EMISSAO.Text = 'CONTINGÊNCIA VIA DPEC' then
          Ide.tpEmis := teSVCSP
        else if FORMA_EMISSAO.Text = 'CONTINGÊNCIA FS-DA' then
          Ide.tpEmis := teFSDA;


          if LeIni(ExtractFilePath(ParamStr(0)) + 'NFe.Ini', 'NFe', 'Ambiente') = 'Produção' then

          Ide.tpAmb := taProducao
          Else
          Ide.tpAmb := taHomologacao;



        if FINALIDADE_EMISSAO.Text = 'NORMAL' then
          Ide.tpCTe := tcNormal

        else if FINALIDADE_EMISSAO.Text = 'COMPLEMENTO' then
          Ide.tpCTe := tcComplemento

        else if FINALIDADE_EMISSAO.Text = 'ANULAÇÃO' then
          Ide.tpCTe := tcAnulacao

        else if FINALIDADE_EMISSAO.Text = 'SUBISTITUDO' then
          Ide.tpCTe := tcSubstituto;
//
        Ide.procEmi := peAplicativoContribuinte;
        Ide.verProc  := '2.0';
//
       { if (FORMA_EMISSAO.Text <> 'NORMAL')  then
        Begin
          Ide.dhCont           := Now();
          Ide.xJust            := 'SERVIDOR INDISPONÍVEL OU INOPERANTE';
        End;}


         if TIPO_TRANSPORTE.Text = 'RODOVIÁRIO' then
           Ide.modal           := mdRodoviario
         Else if TIPO_TRANSPORTE.Text = 'AÉREO' then
           Ide.modal           := mdAereo
         Else if TIPO_TRANSPORTE.Text = 'AQUAVIÁRIO' then
           Ide.modal           := mdAquaviario
         Else if TIPO_TRANSPORTE.Text = 'FERROVIÁRIO' then
           Ide.modal           := mdFerroviario
         Else if TIPO_TRANSPORTE.Text = 'DUTOVIÁRIO' then
           Ide.modal           := mdDutoviario;

         if TIPO_SERVICO.Text = 'NORMAL' then
           Ide.tpServ           := tsNormal
         Else if TIPO_SERVICO.Text = 'SUBCONTRATAÇÃO' then
           Ide.tpServ           := tsSubcontratacao
         Else if TIPO_SERVICO.Text = 'REDESPACHO' then
           Ide.tpServ           := tsRedespacho
         Else if TIPO_SERVICO.Text = 'INTERMEDIÁRIO' then
           Ide.tpServ           := tsIntermediario;

         Ide.cMunEnv :=  FrmPrincipal.QEmpresa.FieldByName('IBGE').AsInteger;
         ide.xMunEnv :=  FrmPrincipal.QEmpresa.FieldByName('MUNICIPIO').AsString;
         ide.UFEnv   :=  FrmPrincipal.QEmpresa.FieldByName('ESTADO').AsString;

        // Origem da Prestação
         Ide.cMunIni  := QParceiro.FieldByName('IBGE').AsInteger;
         Ide.xMunIni  := QParceiro.FieldByName('MUNICIPIO').AsString;
         Ide.UFIni    := QParceiro.FieldByName('ESTADO').AsString;

        // Destino da Prestação
         Ide.cMunFim  := StrToInt(IBGE.Text);
         Ide.xMunFim  := MUNICIPIO_TRANSPORTADOR.Text;
         Ide.UFFim    := UF_TRANSPORTADOR.Text;
         // TpcteRetira = (rtSim, rtNao);
        Ide.retira:=rtSim;
        Ide.xdetretira:='';



         // Totamdor do Serviço no CTe

         if TOMADOR_SERVICO.Text = 'REMETENTE' then
           Ide.Toma03.Toma           := tmRemetente
         Else if TOMADOR_SERVICO.Text = 'EXPEDIDOR' then
           Ide.Toma03.Toma           := tmExpedidor
         Else if TOMADOR_SERVICO.Text = 'RECEBEDOR' then
           Ide.Toma03.Toma           := tmRecebedor
         Else if TOMADOR_SERVICO.Text = 'DESTINATÁRIO' then
           Ide.Toma03.Toma           := tmDestinatario
         Else if TOMADOR_SERVICO.Text = 'OUTROS' then
           Ide.Toma03.Toma           := tmOutros;

      // Totamdor do Serviço no CTe 4 = Outros
  { if DM_CNT.Conhec2TomadorServico.AsInteger=4
    then begin
     DM_CTA.PessoaFJ.Close;
     DM_CTA.PessoaFJ.SQL.Clear;
     DM_CTA.PessoaFJ.SQL.Add('Select * From Sis_PessoaFJ');
     DM_CTA.PessoaFJ.SQL.Add('Where CGC = :xCGC');
     DM_CTA.PessoaFJ.Params[0].AsString:=DM_CNT.Conhec2Outros.AsString;
     DM_CTA.PessoaFJ.Active:=True;
     DM_CTA.PessoaFJ.Open;

     Ide.Toma4.Toma:=tmOutros;
     if copy(DM_CTA.PessoaFJCGC.AsString,10,4)<>'0000'
          then begin
           Ide.Toma4.CNPJCPF := Copy(DM_CTA.PessoaFJCGC.AsString, 2, 14);
           IE := DM_CTA.PessoaFJIEstadual.AsString;
          end
          else begin
           Ide.Toma4.CNPJCPF := Copy(DM_CTA.PessoaFJCGC.AsString, 1, 9) +
                                   Copy(DM_CTA.PessoaFJCGC.AsString, 14, 2);
           IE := 'ISENTO';
          end;
     Ide.Toma4.IE:=IE;
     Ide.Toma4.xNome:=DM_CTA.PessoaFJRSocial.AsString;
     Ide.Toma4.xFant:=DM_CTA.PessoaFJFantasia.AsString;
     Ide.Toma4.fone:=DM_CTA.PessoaFJTelefone.AsString;
     Ide.Toma4.EnderToma.xLgr:=DM_CTA.PessoaFJEndereco.AsString;
     Ide.Toma4.EnderToma.xNum:=DM_CTA.PessoaFJNumero.AsString;
     Ide.Toma4.EnderToma.xCpl:=DM_CTA.PessoaFJComplemento.AsString;
     Ide.Toma4.EnderToma.xBairro:=DM_CTA.PessoaFJBairro.AsString;

     CodigoMunicipio:=DM_CTA.PessoaFJCodigoEstado.AsInteger * 100000 +
                      DM_CTA.PessoaFJCodigoMunicipio.AsInteger;
     Ide.Toma4.EnderToma.cMun:=CodigoMunicipio;
     Ide.Toma4.EnderToma.xMun:=DM_CTA.PessoaFJCidade.AsString;
     Ide.Toma4.EnderToma.CEP:=StrToIntDef(DM_CTA.PessoaFJCEP.AsString, 0);
     Ide.Toma4.EnderToma.UF:=DM_CTA.PessoaFJEstado.AsString;
     Ide.Toma4.EnderToma.cPais:=DM_CTA.PessoaFJCodigoPais.AsInteger;
     Ide.Toma4.EnderToma.xPais:=DM_CTA.PessoaFJPais.AsString;
    end; }





    //  Informações Complementares do CTe


       compl.xCaracAd  := '' ;//Instrucoes.Text;
       compl.xCaracSer := ''; //Instrucoes_2.Text;
       compl.xEmi      := ''; //Copy(FrmData.QAcesso.FieldByName('NOME').AsString,1,20);


     {compl.fluxo.xOrig := Trim(DM_CNT.Conhec2FluxoOrigem.AsString);
     if Trim(DM_CNT.Conhec2FluxoPassagem.AsString)<>''
      then begin
       with compl.fluxo.pass.Add do
        begin
         xPass := Trim(DM_CNT.Conhec2FluxoPassagem.AsString);
        end;
      end;
     compl.fluxo.xDest := Trim(DM_CNT.Conhec2FluxoDestino.AsString);
     compl.fluxo.xRota := Trim(DM_CNT.Conhec2FluxoRota.AsString);
     compl.Entrega.TipoHora:=StrToTpHorarioIntervalo(okConversao, IntToStr(DM_CNT.Conhec2EntregaTipoHora.AsInteger));
     case DM_CNT.Conhec2EntregaTipoHora.AsInteger of
          0: compl.Entrega.semHora.tpHor:=thSemHorario;
      1,2,3: begin
              compl.Entrega.comHora.tpHor:=StrToTpHorarioIntervalo(okConversao, IntToStr(DM_CNT.Conhec2EntregaTipoHora.AsInteger));
              compl.Entrega.comHora.hProg:=StrToTime(DM_CNT.Conhec2EntregaHoraI.AsString);
             end;
          4: begin
              compl.Entrega.noInter.tpHor:=thNoIntervalo;
              compl.Entrega.noInter.hIni:=StrToTime(DM_CNT.Conhec2EntregaHoraI.AsString);
              compl.Entrega.noInter.hFim:=StrToTime(DM_CNT.Conhec2EntregaHoraF.AsString);
             end;
     end; }



        if FrmPrincipal.QEmpresa.FieldByName('CRT').AsString = '1 - SIMPLES NACIONAL' then
        compl.xObs := 'Documento emitido por ME ou EPP optante pelo Simples Nacional ' +
                      'Nao gera direito a credito fiscal de ICMS';



     {  // Obs do Contribuinte
       if (trim(DM_CNT.Conhec2ObsContCampo.AsString)<>'') and
          (trim(DM_CNT.Conhec2ObsContTexto.AsString)<>'')
        then begin
         with compl.ObsCont.Add do
          begin
           xCampo:=DM_CNT.Conhec2ObsContCampo.AsString;
           xTexto:=DM_CNT.Conhec2ObsContTexto.AsString;
          end;
        end;

       // Obs para o Fisco
       if (trim(DM_CNT.Conhec2ObsFiscoCampo.AsString)<>'') and
          (trim(DM_CNT.Conhec2ObsFiscoTexto.AsString)<>'')
        then begin
         with compl.ObsFisco.Add do
          begin
           xCampo:=DM_CNT.Conhec2ObsFiscoCampo.AsString;
           xTexto:=DM_CNT.Conhec2ObsFiscoTexto.AsString;
          end;
        end;  }


       // Dados do Emitente



        Emit.CNPJ              := FrmPrincipal.QEmpresa.FieldByName('CNPJ').AsString;
        Emit.xNome             := FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString;
        Emit.xFant             := FrmPrincipal.QEmpresa.FieldByName('FANTASIA').AsString;
        Emit.EnderEmit.xLgr    := FrmPrincipal.QEmpresa.FieldByName('ENDERECO').AsString;
        Emit.EnderEmit.nro     := FrmPrincipal.QEmpresa.FieldByName('NUMERO').AsString;
        Emit.EnderEmit.xCpl    := '';
        Emit.EnderEmit.xBairro := FrmPrincipal.QEmpresa.FieldByName('BAIRRO').AsString;
        Emit.EnderEmit.cMun    := FrmPrincipal.QEmpresa.FieldByName('IBGE').AsInteger;
        Emit.EnderEmit.xMun    := FrmPrincipal.QEmpresa.FieldByName('MUNICIPIO').AsString;
        Emit.EnderEmit.UF      := FrmPrincipal.QEmpresa.FieldByName('ESTADO').AsString;
        Emit.EnderEmit.CEP     := StrToInt(SemMascara(FrmPrincipal.QEmpresa.FieldByName('CEP').AsString));
        Emit.EnderEmit.fone    := FrmPrincipal.QEmpresa.FieldByName('TELEFONE').AsString;
        Emit.IE                := FrmPrincipal.QEmpresa.FieldByName('INSCR_ESTADUAL').AsString;



        //Dados Remetente

        Rem.xNome             := QParceiro.FieldByName('NOME').AsString;
        Rem.xFant             := QParceiro.FieldByName('NOME').AsString;
        Rem.CNPJCPF           := QParceiro.FieldByName('CNPJ').AsString;
        Rem.IE                := Insc_Dest;
        Rem.EnderReme.xLgr    := QParceiro.FieldByName('ENDERECO').AsString;
        Rem.EnderReme.nro     := QParceiro.FieldByName('NUMERO').AsString;
        Rem.EnderReme.xCpl    := QParceiro.FieldByName('COMPLEMENTO').AsString;
        Rem.EnderReme.xBairro := QParceiro.FieldByName('BAIRRO').AsString;
        Rem.EnderReme.cMun    := StrToInt(QParceiro.FieldByName('IBGE').AsString);
        Rem.EnderReme.xMun    := QParceiro.FieldByName('MUNICIPIO').AsString;;
        Rem.EnderReme.CEP     := StrToIntDef(QParceiro.FieldByName('CEP').AsString, 0);
        Rem.EnderReme.UF      := QParceiro.FieldByName('ESTADO').AsString;;
        Rem.EnderReme.cPais   := StrToInt(QParceiro.FieldByName('COD_PAIS').AsString);
        Rem.EnderReme.xPais   := QParceiro.FieldByName('PAIS').AsString;



        {if FrmPrincipal.QEmpresa.FieldByName('CRT').AsString = '1 - SIMPLES NACIONAL' then
          Emit. CRT := crtSimplesNacional
        else if FrmPrincipal.QEmpresa.FieldByName('CRT').AsString = '2 - SIMPLES NACIONAL - EXC. REC. BRUTA' then
          Emit.CRT := crtSimplesExcessoReceita
        else
          Emit.CRT := crtRegimeNormal;}


        // Dados do Destinatario


        Dest.CNPJCPF           := CNPJ_TRANSPORTADOR.Text;
        Dest.xNome             := NOME_TRANSPORTADOR.TEXT;
        Dest.enderDest.xLgr    := ENDERECO_TRANSPORTADOR.TEXT;
        Dest.EnderDest.nro     := N_TRANSPORTADOR.TEXT;
        Dest.EnderDest.xCpl    := '';
        Dest.EnderDest.xBairro := BAIRRO_TRANSPORTADOR.TEXT;

        try
          Dest.EnderDest.cMun := StrToInt(IBGE.Text);
        except
          Dest.EnderDest.cMun := 0;
        end;

        Dest.EnderDest.xMun    := MUNICIPIO_TRANSPORTADOR.Text;
        Dest.EnderDest.UF      := UF_TRANSPORTADOR.Text;

        try
          Dest.EnderDest.CEP := StrToInt(SemMascara(CEP_TRANSPORTADOR.Text));
        except
          Dest.EnderDest.CEP := 0;
        end;

        Dest.EnderDest.cPais := QParceiro.FieldByName('COD_PAIS').AsInteger;

        QDetalhe.Sql.Clear;
        QDetalhe.Sql.Add('SELECT * FROM PAISES');
        QDetalhe.Sql.Add('WHERE');
        QDetalhe.Sql.Add('(CODIGO = :CODIGO)');

        QDetalhe.ParamByName('CODIGO').AsString := QParceiro.FieldByName('COD_PAIS').AsString;

        QDetalhe.Prepare;
        QDetalhe.Open;

        Dest.EnderDest.xPais := QDetalhe.FieldByName('DESCRICAO').AsString;
        Dest.IE              := INSCRICAO_TRANSPORTADOR.TEXT;
        Dest.ISUF            := '';
        Dest.Email           := EMAIL_transportador.TEXT;


     //  Local de Entrega

      { Dest.locEnt.CNPJCPF := CNPJ_TRANSPORTADOR.Text;
       Dest.locEnt.xNome   := NOME_TRANSPORTADOR.TEXT;
       Dest.locEnt.xLgr    := ENDERECO_TRANSPORTADOR.TEXT;
       Dest.locEnt.nro     := N_TRANSPORTADOR.TEXT;
       Dest.locEnt.xCpl    := '';
       Dest.locEnt.xBairro := BAIRRO_TRANSPORTADOR.TEXT;
       Dest.locEnt.cMun    := QParceiro.FieldByName('IBGE').AsInteger;
       Dest.locEnt.xMun    := QParceiro.FieldByName('MUNICIPIO').AsString;
       Dest.locEnt.UF      := QParceiro.FieldByName('ESTADO').AsString; }




        // Relação das Notas Fiscais




       QNotas.Close;

       QNotas.ParamByName('TRANSACAO_ID').AsInteger := ID;

       QNotas.Prepare;

       QNotas.Open;
       QNotas.First;

       
       While not QNotas.Eof do
       Begin
        if QNOTAS.FieldByName('MODELO').AsString = '55' then
        begin
         with infCTeNorm.infDoc.infNFE.Add do
         begin
          chave := QNotas.FieldByName('CHAVE_NFE').AsString;
          dPrev := DT_PREVISAO.DATE;
          //  PIN   := DM_CNT.NotasPinSuframa.AsString;
         end;
        end
        else
        bEGIN
         with infCTeNorm.infDoc.infNF.Add do
         begin
          nRoma := QNotas.FieldByName('ROMANEIO').AsString;
          nPed  := QNotas.FieldByName('PEDIDO').AsString;
          serie := QNotas.FieldByName('SERIE').AsString;
          nDoc  := QNotas.FieldByName('NUM_DOC').AsString;
          dEmi  := QNotas.FieldByName('DT_EMISSAO').AsDateTime;
          vBC   := RoundTo(QNotas.FieldByName('BASE_ICMS_NORMAL').AsFloat, -2);
          vICMS := RoundTo(QNotas.FieldByName('VR_ICMS_NORMAL').AsFloat, -2);
          vBCST := RoundTo(QNotas.FieldByName('BASE_ICMS_ST').AsFloat, -2);
          vST   := RoundTo(QNotas.FieldByName('VR_ICMS_ST').AsFloat, -2);
          vProd := RoundTo(QNotas.FieldByName('VALOR_PRODUTOS').AsFloat, -2);
          vNF   := RoundTo(QNotas.FieldByName('VALOR').AsFloat, -2);
          nCFOP := StrToInt(QNotas.FieldByName('CFOP').AsString);
          nPeso := RoundTo(Peso_liquido.Value, -3);
          dPrev := DT_PREVISAO.DATE;
          //  PIN   := DM_CNT.NotasPinSuframa.AsString;
         end;
        end;

       QNotas.Next

       End;

       //  Valores da Prestação de Serviço

        vPrest.vTPrest             := RoundTo(QTransacao.FieldByName('VALOR').AsFloat, -2);
        vPrest.vRec                := RoundTo(QTransacao.FieldByName('VALOR').AsFloat, -2);

        IQuery.SQL.Clear;
        IQuery.SQL.Add('SELECT * FROM TRANSITENS WHERE TRANSACAO_ID = :TRANSACAO_ID');
        IQuery.ParamByName('TRANSACAO_ID').AsInteger := ID;
        IQuery.Prepare;
        IQuery.Open;
        IQuery.First;

        while NOT IQuery.Eof DO
        begin

          with vPrest.comp.Add do
          begin
           xNome:= Copy(IQuery.FieldByName('DESCRICAO').AsString,1,15);
           vComp:= RoundTo(IQuery.FieldByName('VR_UNITARIO').AsFloat, -2);
          end;

          case StrToInt(IQuery.FieldByName('CST').AsString) of

          00:  begin
                Imp.ICMS.SituTrib     := cst40;
                Imp.ICMS.ICMS00.CST   := cst40; // Tributação Normal ICMS
                Imp.ICMS.ICMS00.vBC   := RoundTo(IQuery.FieldByName('BASE_CALC_ICMS').AsFloat, -2);
                Imp.ICMS.ICMS00.pICMS := RoundTo(IQuery.FieldByName('ALIQUOTA_ICMS').AsFloat, -2);
                Imp.ICMS.ICMS00.vICMS := RoundTo(IQuery.FieldByName('VALOR_ICMS').AsFloat, -2);
               end;
          20:  begin
                Imp.ICMS.SituTrib     := cst20;
                Imp.ICMS.ICMS20.CST    := cst20; // Tributação com BC reduzida do ICMS
                Imp.ICMS.ICMS20.pRedBC := RoundTo(IQuery.FieldByName('VR_REDUCAO_BC').AsFloat, -2);
                Imp.ICMS.ICMS20.vBC    := RoundTo(IQuery.FieldByName('BASE_CALC_ICMS').AsFloat, -2);
                Imp.ICMS.ICMS20.pICMS  := RoundTo(IQuery.FieldByName('ALIQUOTA_ICMS').AsFloat, -2);
                Imp.ICMS.ICMS20.vICMS  := RoundTo(IQuery.FieldByName('VALOR_ICMS').AsFloat, -2);
               end;
          40:  begin
                Imp.ICMS.SituTrib   := cst40;
                Imp.ICMS.ICMS45.CST := cst40; // ICMS Isento 
               end;
          41:  begin
                Imp.ICMS.SituTrib  := cst41;
                Imp.ICMS.ICMS45.CST := cst41; // ICMS não Tributada
               end;
          {051: begin
                Imp.ICMS.SituTrib  := cst51;
                Imp.ICMS.' CST := cst51; // ICMS diferido
               end;}
          {080: begin
                Imp.ICMS.SituTrib    := cst80;
                Imp.ICMS.CST80.CST   := cst90; // Tributação atribuida ao tomador ou 3. por ST
                Imp.ICMS.CST80.vBC   := RoundTo(IQuery.FieldByName('BASE_CALC_ICMS').AsFloat, -2);
                Imp.ICMS.CST80.pICMS := RoundTo(IQuery.FieldByName('ALIQUOTA_ICMS').AsFloat, -2);
                Imp.ICMS.CST80.vICMS := RoundTo(IQuery.FieldByName('VALOR_ICMS').AsFloat, -2);
                Imp.ICMS.CST80.vCred := 0;
               end;
          081: begin
                Imp.ICMS.SituTrib     := cst81;
                Imp.ICMS. CST81.CST    := cst90; // Tributação devido a outra UF
                Imp.ICMS.CST81.pRedBC := RoundTo(IQuery.FieldByName('VR_REDUCAO_BC').AsFloat, -2);
                Imp.ICMS.CST81.vBC    := RoundTo(IQuery.FieldByName('BASE_CALC_ICMS').AsFloat, -2);
                Imp.ICMS.CST81.pICMS  := RoundTo(IQuery.FieldByName('ALIQUOTA_ICMS').AsFloat, -2);
                Imp.ICMS.CST81.vICMS  := RoundTo(IQuery.FieldByName('VALOR_ICMS').AsFloat, -2);
               end; }
          90:  begin
                Imp.ICMS.SituTrib      := cst90;
                Imp.ICMS.ICMS90.CST    := cst90; // ICMS Outros
                Imp.ICMS.ICMS90.pRedBC := RoundTo(IQuery.FieldByName('VR_REDUCAO_BC').AsFloat, -2);
                Imp.ICMS.ICMS90.vBC    := RoundTo(IQuery.FieldByName('BASE_CALC_ICMS').AsFloat, -2);
                Imp.ICMS.ICMS90.pICMS  := RoundTo(IQuery.FieldByName('ALIQUOTA_ICMS').AsFloat, -2);
                Imp.ICMS.ICMS90.vICMS  := RoundTo(IQuery.FieldByName('ALIQUOTA_ICMS').AsFloat, -2);
                Imp.ICMS.ICMS90.vCred  := 0;
               end;
          end;

          IQuery.Next;

        end;


      //  case QItens.FieldByName('CST').AsInteger of
      //   00: begin
            //  Imp.ICMS.SituTrib     := cst40;
             // Imp.ICMS. ICMS00.CST   := cst40; // Tributação Normal ICMS
             // Imp.ICMS.ICMS00.vBC   := RoundTo(QTransacao.FieldByName('BASE_ICMS_NORMAL').AsFloat, -2);
             // Imp.ICMS.ICMS00.pICMS := RoundTo(QTransacao.FieldByName('ALIQUOTA_ICMS').AsFloat, -2);
              //Imp.ICMS.ICMS00.vICMS := RoundTo(QTransacao.FieldByName('VR_ICMS_NORMAL').AsFloat, -2);
      //      end;
        { 20: begin
              Imp.ICMS.SituTrib     := cst20;
              Imp.ICMS.ICMS20.CST    := cst20; // Tributação com BC reduzida do ICMS
              Imp.ICMS.ICMS20.pRedBC := RoundTo(DM_CNT.Conhec2ReducaoICMS.AsFloat, -2);
              Imp.ICMS.ICMS20.vBC    := RoundTo(DM_CNT.Conhec2BaseCalc.AsFloat, -2);
              Imp.ICMS.ICMS20.pICMS  := RoundTo(DM_CNT.Conhec2AliqICMS.AsFloat, -2);
              Imp.ICMS.ICMS20.vICMS  := RoundTo(DM_CNT.Conhec2ValorICMS.AsFloat, -2);
             end;
         40: begin  }
              Imp.ICMS.SituTrib  := cst40;
              Imp.ICMS.ICMS45.CST := cst40; // ICMS Isento
        {     end;
         41: begin
              Imp.ICMS.SituTrib  := cst41;
              Imp.ICMS.CST45.CST := cst41; // ICMS não Tributada
             end;
         51: begin
              Imp.ICMS.SituTrib  := cst51;
              Imp.ICMS.CST45.CST := cst51; // ICMS diferido
             end;
         80: begin
              Imp.ICMS.SituTrib    := cst80;
              Imp.ICMS.CST80.CST   := cst90; // Tributação atribuida ao tomador ou 3. por ST
              Imp.ICMS.CST80.vBC   := RoundTo(DM_CNT.Conhec2BaseCalc.AsFloat, -2);
              Imp.ICMS.CST80.pICMS := RoundTo(DM_CNT.Conhec2AliqICMS.AsFloat, -2);
              Imp.ICMS.CST80.vICMS := RoundTo(DM_CNT.Conhec2ValorICMS.AsFloat, -2);
              Imp.ICMS.CST80.vCred := RoundTo(DM_CNT.Conhec2CreditoICMS.AsFloat, -2);
             end;
         81: begin
              Imp.ICMS.SituTrib     := cst81;
              Imp.ICMS.CST81.CST    := cst90; // Tributação devido a outra UF
              Imp.ICMS.CST81.pRedBC := RoundTo(DM_CNT.Conhec2ReducaoICMS.AsFloat, -2);
              Imp.ICMS.CST81.vBC    := RoundTo(DM_CNT.Conhec2BaseCalc.AsFloat, -2);
              Imp.ICMS.CST81.pICMS  := RoundTo(DM_CNT.Conhec2AliqICMS.AsFloat, -2);
              Imp.ICMS.CST81.vICMS  := RoundTo(DM_CNT.Conhec2ValorICMS.AsFloat, -2);
             end;
         90: begin
              Imp.ICMS.SituTrib     := cst90;
              Imp.ICMS.CST90.CST    := cst90; // ICMS Outros
              Imp.ICMS.CST90.pRedBC := RoundTo(DM_CNT.Conhec2ReducaoICMS.AsFloat, -2);
              Imp.ICMS.CST90.vBC    := RoundTo(DM_CNT.Conhec2BaseCalc.AsFloat, -2);
              Imp.ICMS.CST90.pICMS  := RoundTo(DM_CNT.Conhec2AliqICMS.AsFloat, -2);
              Imp.ICMS.CST90.vICMS  := RoundTo(DM_CNT.Conhec2ValorICMS.AsFloat, -2);
              Imp.ICMS.CST90.vCred  := RoundTo(DM_CNT.Conhec2CreditoICMS.AsFloat, -2);
             end;
         end;}

       //  Informações da Carga

        With infCTeNorm.infCarga.infQ.Add do
        Begin
         if unidade.Text  = 'KG' then
         bEGIN
          cUnid  :=  uKG ;
          tpMed  :=  'KILO';
         end
         else if unidade.Text  = 'M3' then
         begin
          cUnid  :=  uM3;
          tpMed   :=  'M3';
         end
         else IF unidade.Text  = 'UN' then
         begin
          cUnid  :=  uUNIDADE;
          tpMed   :=  'UNIDADE';
         end;
         qCarga :=  PESO_LIQUIDO.Value;
        End;


        infCTeNorm.infCarga.vCarga   := RoundTo(QNotas.FieldByName('VALOR').AsFloat , -2);
        infCTeNorm.infCarga.proPred  := Prod_Principal.Text;
        infCTeNorm.infCarga.xOutCat  := LOCAL_EMBARQUE.Text;


       //  Dados do Modal Rodoviário

        infCTeNorm.Rodo.RNTRC := FrmPrincipal.QEmpresa.FieldByName('RNTRC').AsString;;
        infCTeNorm.Rodo.dPrev := DT_PREVISAO.DATE;

        if Lotacao.Text = 'SIM' then
        Begin
          Ok := True;
          infCTeNorm.Rodo.Lota  := ltSIM;
          with infCTeNorm.rodo.veic.Add  do
          Begin
           placa        := PLACA_VEICULO.Text;
           uf           := UF_VEICULO.Text;
           RENAVAM      := '123456789';

           if INSTRUCOES.Text = 'REBOQUE' then
           tpVeic       := tvReboque
           else
           tpVeic       := tvTracao;

           tpRod := trOutros; //trTruck;trToco;trCavaloMecanico;trVAN;trUtilitario;trOutros;
           tpCar := tcNaoAplicavel; //tcAberta;tcFechada;cGraneleira;tcPortaContainer;tcSider;

           Prop.RNTRC   := INSTRUCOES_2.Text;
           Prop.xNome   := motorista.Text;
           Prop.UF      := UF_VEICULO.Text;
           Prop.CNPJCPF := CPF_MOTORISTA.TEXT;
           Prop.tpProp  := StrToTpProp(ok,'OUTROS');
           Prop.IE      := 'ISENTO';


          End;
          with infCTeNorm.rodo.moto.Add do
          begin
            xnome := motorista.Text;
            cpf   := CPF_MOTORISTA.TEXT;
          end;
        End
        else
        infCTeNorm.Rodo.Lota  := ltNao;

      // iNFORMAÇAO TRANSPORTADOR




      //Informações do Seguro

        with infCTeNorm.seg.Add do
        Begin
        respSeg := rsRemetente;
        xSeg  :='';
        nApol := '';
        nAver := '';
        End;



        if COND_PAGTO.ItemIndex = 1 then
        begin
          infCTeNorm.Cobr.Fat.nFat  := StrZero(NO_DOC_FISCAL.Text, 9, 0);
          infCTeNorm.Cobr.Fat.vOrig := QTransacao.FieldByName('VALOR').AsFloat;
          infCTeNorm.Cobr.Fat.vDesc := 0;
          infCTeNorm.Cobr.Fat.vLiq  := QTransacao.FieldByName('VALOR').AsFloat;

          QParcelas.Sql.Clear;
          QParcelas.Sql.Add('SELECT * FROM TRANSPARCELAS');
          QParcelas.Sql.Add('WHERE');
          QParcelas.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
          QParcelas.Sql.Add('AND (TIPO_TRANSACAO = :TIPO_TRANSACAO)');

          QParcelas.ParamByName('TRANSACAO_ID').AsInteger  := ID;
          QParcelas.ParamByName('TIPO_TRANSACAO').AsString := 'U';

          QParcelas.Prepare;
          QParcelas.Open;

          while not QParcelas.Eof do
          begin
            with infCTeNorm.Cobr.Dup.Add do
             begin
               nDup  := QParcelas.FieldByName('DUPLICATA').AsString;
               dVenc := QParcelas.FieldByName('DT_VENCIMENTO').AsDateTime;
               vDup  := QParcelas.FieldByName('VALOR').AsFloat;
             end;

             Application.ProcessMessages;
             QParcelas.Next;
          end;
        end;



        if not GeraXML then
        begin
          if FrmPrincipal.ACBrCTe1.Enviar(0, True) then
          begin

            IQuery.Sql.Clear;
            IQuery.Sql.Add('UPDATE TRANSACOES SET NUM_DOC = :NUM_DOC, CHAVE_NFE = :CHAVE_NFE');
            IQuery.Sql.Add('WHERE');
            IQuery.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

            IQuery.ParamByName('NUM_DOC').AsString       := StrZero(NO_DOC_FISCAL.Text, 9, 0);
            IQuery.ParamByName('TRANSACAO_ID').AsInteger := ID;
           // IQuery.ParamByName('HISTORICO').AsString     := QTransacao.FieldByName('HISTORICO').AsString  + StrZero(NO_DOC_FISCAL.Text, 9, 0);
            IQuery.ParamByName('CHAVE_NFE').AsString     := FrmPrincipal.ACBrCTe1.WebServices.Retorno.ChaveCTe;

            IQuery.Prepare;
            IQuery.ExecSql;

            FrmData.Trans_Eficaz.CommitRetaining;

            IQuery.Sql.Clear;
            IQuery.Sql.Add('UPDATE COMPL_CTEFISCAL SET RECIBO = :RECIBO, PROTOCOLO = :PROTOCOLO, CHAVE_NFE = :CHAVE_NFE');
            IQuery.Sql.Add('WHERE');
            IQuery.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

            IQuery.ParamByName('RECIBO').AsString        := FrmPrincipal.ACBrCTe1.WebServices.Retorno.Recibo;
            IQuery.ParamByName('PROTOCOLO').AsString     := FrmPrincipal.ACBrCTe1.WebServices.Retorno.Protocolo;
            IQuery.ParamByName('CHAVE_NFE').AsString     := FrmPrincipal.ACBrCTe1.WebServices.Retorno.ChaveCTe;
            IQuery.ParamByName('TRANSACAO_ID').AsInteger := ID;

            IQuery.Prepare;
            IQuery.ExecSql;

            FrmData.Trans_Eficaz.CommitRetaining;

           if Application.MessageBox('Deseja enviar email do DACTE para o destinatário?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = IDYES then
           begin
            try
              if EMAIL_TRANSPORTADOR.Text <> '' then
              begin
                IniFile := ChangeFileExt(ExtractFilePath(ParamStr(0)) + 'NFe', '.Ini');

                Ini := TIniFile.Create(IniFile);
                try
                  edtSmtpHost     := Ini.ReadString('Email', 'Host',    '');
                  edtSmtpPort     := Ini.ReadString('Email', 'Port',    '');
                  edtSmtpUser     := Ini.ReadString('Email', 'User',    '');
                  edtSmtpPass     := Ini.ReadString('Email', 'Pass',    '');
                  edtSmtpPass     := DecryptMsg(edtSmtpPass, 65);
                  edtEmailAssunto := Ini.ReadString('Email', 'Assunto', '');
                  cbEmailSSL      := Ini.ReadBool('Email', 'SSL', False);
                  StreamMemo      := TMemoryStream.Create;

                  Ini.ReadBinaryStream('Email', 'Mensagem', StreamMemo);
                  FrmPrincipal.MemoResp.Lines.LoadFromStream(StreamMemo);
                  StreamMemo.Free;
                finally
                  Ini.Free;
                end;
                if edtEmailAssunto = '' then
                edtEmailAssunto := FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString + ' CT-e: ' + StrZero(NO_DOC_FISCAL.Text, 9, 0) + ' Data: ' + DateToStr(QTransacao.FieldByName('DT_ENT_SAI').AsDateTime);

                FrmPrincipal.MemoResp.Lines.Add('Segue em anexo : CT-e Nº: ' + StrZero(NO_DOC_FISCAL.Text, 9, 0));
                FrmPrincipal.MemoResp.Lines.Add('');
                FrmPrincipal.MemoResp.Lines.Add('Empresa: ' + FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString + ' CNPJ: ' + FrmPrincipal.QEmpresa.FieldByName('CNPJ').AsString );
                FrmPrincipal.MemoResp.Lines.Add('');
                FrmPrincipal.MemoResp.Lines.Add('Cliente: ' + NOME_TRANSPORTADOR.Text + ' CNPJ/CPF: ' + CNPJ_TRANSPORTADOR.Text);
                FrmPrincipal.MemoResp.Lines.Add('');
                FrmPrincipal.MemoResp.Lines.Add('Chave da CT-e: ' + FrmPrincipal.ACBrCTe1.WebServices.Retorno.ChaveCTe);
                FrmPrincipal.MemoResp.Lines.Add('');
                FrmPrincipal.MemoResp.Lines.Add('');
                FrmPrincipal.MemoResp.Lines.Add('');
                FrmPrincipal.MemoResp.Lines.Add('**********************Sistema Eficaz(38)37411478**********************');


               FrmPrincipal.ACBrCTe1.Conhecimentos.Items[0].EnviarEmail(edtSmtpHost, edtSmtpPort, edtSmtpUser, edtSmtpPass, edtSmtpUser, EMAIL_TRANSPORTADOR.Text , edtEmailAssunto, FrmPrincipal.MemoResp.Lines, cbEmailSSL,True //Enviar PDF junto
                , nil {Lista com emails que serão enviado cópias - TStrings}
                , nil { Lista de anexos - TStrings}
                , False {Pede confirmação de leitura do email}
                , True  {Aguarda Envio do Email(não usa thread)}
                , FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString //NOME do Rementente}
                , True ); // Auto TLS););

                FrmPrincipal.MemoResp.Lines.Clear;
                E_mail := True;
              end;
            except
              Application.MessageBox('Não foi possível enviar o email verifique as configurações.', PChar(Msg_Title), mb_IconInformation);
              e_mail := False;
            end;

            if e_mail then
            Application.MessageBox(Pchar('E-mail enviado com sucesso para: ' + EMAIL_TRANSPORTADOR.Text), PChar(Msg_Title), mb_IconInformation);

              {try
                if QParceiro.FieldByName('EMAIL').AsString <> '' then
                begin
                  IniFile := ChangeFileExt(ExtractFilePath(ParamStr(0)) + 'NFe', '.Ini');

                  Ini := TIniFile.Create(IniFile);
                  try
                    edtSmtpHost     := Ini.ReadString('Email', 'Host',    '');
                    edtSmtpPort     := Ini.ReadString('Email', 'Port',    '');
                    edtSmtpUser     := Ini.ReadString('Email', 'User',    '');
                    edtSmtpPass     := Ini.ReadString('Email', 'Pass',    '');
                    edtSmtpPass     := DecryptMsg(edtSmtpPass, 65);
                    edtEmailAssunto := Ini.ReadString('Email', 'Assunto', '');
                    cbEmailSSL      := Ini.ReadBool('Email', 'SSL', False);
                    StreamMemo      := TMemoryStream.Create;

                    Ini.ReadBinaryStream('Email', 'Mensagem', StreamMemo);
                    FrmPrincipal.MemoResp.Lines.LoadFromStream(StreamMemo);
                    StreamMemo.Free;
                  finally
                    Ini.Free;
                  end;

                  FrmPrincipal.ACBrCTe1.Conhecimentos.Items[0].EnviarEmail(edtSmtpHost, edtSmtpPort, edtSmtpUser, edtSmtpPass, edtSmtpUser, QParceiro.FieldByName('EMAIL').AsString, edtEmailAssunto, FrmPrincipal.MemoResp.Lines, cbEmailSSL);
                  Application.MessageBox('E-mail enviado com sucesso!', PChar(Msg_Title), mb_IconInformation);
                  FrmPrincipal.MemoResp.Lines.Clear;
                end;
              except
                Application.MessageBox('Não foi possível enviar o email', PChar(Msg_Title), mb_IconInformation);
              end;}
           end;
            ShowMessage('Nº do Protocolo: ' + FrmPrincipal.ACBrCTe1.WebServices.Retorno.Protocolo);
            ShowMessage('Nº do Recibo: ' + FrmPrincipal.ACBrCTe1.WebServices.Retorno.Recibo);

          end
          else
          begin

           {IQuery.Sql.Clear;
            IQuery.Sql.Add('DELETE FROM COMPL_CTEFISCAL');
            IQuery.Sql.Add('WHERE');
            IQuery.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

            IQuery.ParamByName('TRANSACAO_ID').AsInteger := ID;

            IQuery.Prepare;
            IQuery.ExecSql;

            FrmData.Trans_Eficaz.CommitRetaining;

            if FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger = 1 then
            Begin
            IQuery.Sql.Clear;
            IQuery.Sql.Add('SET GENERATOR GEN_CTEFISCAL TO ' + IntToStr(StrToInt(NO_DOC_FISCAL.Text) - 1));

            IQuery.Prepare;
            IQuery.ExecSql;

            FrmData.Trans_Eficaz.CommitRetaining;
            End;

            if FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger = 2 then
            Begin
            IQuery.Sql.Clear;
            IQuery.Sql.Add('SET GENERATOR GEN_CTEFISCAL02 TO ' + IntToStr(StrToInt(NO_DOC_FISCAL.Text) - 1));

            IQuery.Prepare;
            IQuery.ExecSql;

            FrmData.Trans_Eficaz.CommitRetaining;
            End;

            if FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger = 3 then
            Begin
            IQuery.Sql.Clear;
            IQuery.Sql.Add('SET GENERATOR GEN_CTEFISCAL03 TO ' + IntToStr(StrToInt(NO_DOC_FISCAL.Text) - 1));

            IQuery.Prepare;
            IQuery.ExecSql;

            FrmData.Trans_Eficaz.CommitRetaining;
            End;

            if FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger = 4 then
            Begin
            IQuery.Sql.Clear;
            IQuery.Sql.Add('SET GENERATOR GEN_CTEFISCAL04 TO ' + IntToStr(StrToInt(NO_DOC_FISCAL.Text) - 1));

            IQuery.Prepare;
            IQuery.ExecSql;

            FrmData.Trans_Eficaz.CommitRetaining;
            End;

            if FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger = 5 then
            Begin
            IQuery.Sql.Clear;
            IQuery.Sql.Add('SET GENERATOR GEN_CTEFISCAL05 TO ' + IntToStr(StrToInt(NO_DOC_FISCAL.Text) - 1));

            IQuery.Prepare;
            IQuery.ExecSql;

            FrmData.Trans_Eficaz.CommitRetaining;
            End; }


            Application.MessageBox('Não foi possível enviar a NFe', PChar(Msg_Title), mb_IconInformation);
            Close;
          end;
        end
        else
        begin
          FrmPrincipal.ACBrCTe1.Conhecimentos.Assinar;

          FrmPrincipal.ACBrCTe1.Conhecimentos.Items[0].SaveToFile;
          Application.MessageBox(PChar('Arquivo gerado em: ' + FrmPrincipal.ACBrCTe1.Conhecimentos.Items[0].NomeArq), PChar(Msg_Title), mb_IconInformation);

          FrmPrincipal.ACBrCTe1.Conhecimentos.Imprimir;


        end;
      end;
    finally

        if (FrmPrincipal.ACBrCTe1.Conhecimentos.Items[0].CTe.ProcCTe.cStat = 110) OR
           (FrmPrincipal.ACBrCTe1.Conhecimentos.Items[0].CTe.ProcCTe.cStat = 310) OR
           (FrmPrincipal.ACBrCTe1.Conhecimentos.Items[0].CTe.ProcCTe.cStat = 301) OR
           (FrmPrincipal.ACBrCTe1.Conhecimentos.Items[0].CTe.ProcCTe.cStat = 302) OR
           (FrmPrincipal.ACBrCTe1.Conhecimentos.Items[0].CTe.ProcCTe.cStat = 320) then
        Begin

          Cond_origem := QTransacao.FieldByName('CONDUTA').AsString;
          Dpt_origem  := QTransacao.FieldByName('DEPTO').AsString;
          Vl_Trans    := QTransacao.FieldByName('VALOR').AsFloat;

          IQuery.Sql.Clear;
          IQuery.Sql.Add('INSERT INTO NOTAS_CANCELADAS(TRANSACAO_ID, EMPRESA_ID, NO_DOC_FISCAL, DT_SAIDA, HR_SAIDA, CFOP_COMPL, RESP_FRETE, NOME_TRANSPORTADOR, CNPJ_TRANSPORTADOR, ' +
                        'PLACA_VEICULO, ENDERECO_TRANSPORTADOR, MUNICIPIO_TRANSPORTADOR, UF_TRANSPORTADOR, INSCRICAO_TRANSPORTADOR, QUANTIDADE_VOLUMES, ESPECIE_VOLUMES, ' +
                        'MARCA_VOLUMES, NUMERO_VOLUMES, PESO_BRUTO, PESO_LIQUIDO, INSTRUCOES, RECIBO, PROTOCOLO, CHAVE_NFE)');
          IQuery.Sql.Add('SELECT TRANSACAO_ID, EMPRESA_ID, NO_DOC_FISCAL, DT_SAIDA, HR_SAIDA, CFOP_COMPL, RESP_FRETE, NOME_TRANSPORTADOR, CNPJ_TRANSPORTADOR, ' +
                        'PLACA_VEICULO, ENDERECO_TRANSPORTADOR, MUNICIPIO_TRANSPORTADOR, UF_TRANSPORTADOR, INSCRICAO_TRANSPORTADOR, QUANTIDADE_VOLUMES, ESPECIE_VOLUMES, ' +
                        'MARCA_VOLUMES, NUMERO_VOLUMES, PESO_BRUTO, PESO_LIQUIDO, INSTRUCOES, RECIBO, PROTOCOLO, CHAVE_NFE');
          IQuery.Sql.Add('FROM COMPL_CTEFISCAL');
          IQuery.Sql.Add('WHERE');
          IQuery.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

          IQuery.ParamByName('TRANSACAO_ID').AsInteger := ID;

          IQuery.Prepare;
          IQuery.ExecSql;

          FrmData.Trans_Eficaz.CommitRetaining;

          IQuery.Sql.Clear;
          IQuery.Sql.Add('DELETE FROM COMPL_CTEFISCAL');
          IQuery.Sql.Add('WHERE');
          IQuery.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

          IQuery.ParamByName('TRANSACAO_ID').AsInteger := ID;

          IQuery.Prepare;
          IQuery.ExecSql;

          FrmData.Trans_Eficaz.CommitRetaining;


          IQuery.Sql.Clear;
          IQuery.Sql.Add('UPDATE TRANSPARCELAS SET AGRUPAMENTO = 989898');
          IQuery.Sql.Add('WHERE');
          IQuery.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

          IQuery.ParamByName('TRANSACAO_ID').AsInteger := ID;

          IQuery.Prepare;
          IQuery.ExecSql;

          FrmData.Trans_Eficaz.CommitRetaining;


          IQuery.Sql.Clear;
          IQuery.Sql.Add('ALTER TRIGGER PRODUTOS_UP INACTIVE');

          IQuery.Prepare;
          IQuery.ExecSql;

          FrmData.Trans_Eficaz.CommitRetaining;


          IQuery.Sql.Clear;
          IQuery.Sql.Add('UPDATE TRANSACOES SET COMPLEMENTO = :COMPLEMENTO');
          IQuery.Sql.Add('WHERE');
          IQuery.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

          IQuery.ParamByName('TRANSACAO_ID').AsInteger := ID;
          IQuery.ParamByName('COMPLEMENTO').AsString   := 'DENEGADA';

          IQuery.Prepare;
          IQuery.ExecSql;

          FrmData.Trans_Eficaz.CommitRetaining;

          IQuery.Sql.Clear;
          IQuery.Sql.Add('ALTER TRIGGER PRODUTOS_UP ACTIVE');

          IQuery.Prepare;
          IQuery.ExecSql;

          FrmData.Trans_Eficaz.CommitRetaining;


          ID_Transacao.Prepare;
          ID_Transacao.ExecProc;

          Id_Trans := ID_Transacao.Params[0].Value;

          FrmData.Trans_Eficaz.CommitRetaining;

          IQuery.Sql.Clear;
          IQuery.Sql.Add('INSERT INTO TRANSACOES( ' +
                       'TRANSACAO_ID, DT_TRANS,   DT_MOVIMENTO, CONDUTA, ' +
                       'DEPTO,        EMPRESA_ID, CONTA_ID,     C_CUSTO_ID, ' +
                       'VALOR,        TPCTB,      AUTORIZ_ID,   HISTORICO, ' +
                       'CONTAAUX_ID) VALUES(' +
                       ':TRANSACAO_ID, :DT_TRANS,   :DT_MOVIMENTO, :CONDUTA, :DEPTO,      :EMPRESA_ID, ' +
                       ':CONTA_ID,     :C_CUSTO_ID, :VALOR,        :TPCTB,   :AUTORIZ_ID, :HISTORICO, ' +
                       ':CONTAAUX_ID)');

          IQuery.ParamByName('TRANSACAO_ID').AsInteger  := Id_Trans;
          IQuery.ParamByName('DT_TRANS').AsDateTime     := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
          IQuery.ParamByName('DT_MOVIMENTO').AsDateTime := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;

          if ((Cond_Origem = '01') and (Dpt_Origem = '07')) or ((Cond_Origem = '01') and (Dpt_Origem = '10')) then
          begin
            IQuery.ParamByName('CONDUTA').AsString := '18';
            IQuery.ParamByName('DEPTO').AsString   := '07';
          end;

          if ((Cond_Origem = '02') and (Dpt_Origem = '07')) or ((Cond_Origem = '02') and (Dpt_Origem = '10')) then
          begin
            IQuery.ParamByName('CONDUTA').AsString := '17';
            IQuery.ParamByName('DEPTO').AsString   := '07';
          end;

          IQuery.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
          IQuery.ParamByName('CONTA_ID').AsInteger    := FrmPrincipal.Config.FieldByName('CONTA_ESTOQUE').AsInteger;
          IQuery.ParamByName('C_CUSTO_ID').AsInteger  := 1;
          IQuery.ParamByName('VALOR').AsFloat         := Vl_Trans;
          IQuery.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
          IQuery.ParamByName('AUTORIZ_ID').AsInteger  := FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger;
          IQuery.ParamByName('HISTORICO').AsString    := 'NFe DENEGADA ' + StrZero(IntToStr(FrmPrincipal.ACBrCTe1.Conhecimentos.Items[0].CTe.Ide.nCT), 6, 0);
          IQuery.ParamByName('CONTAAUX_ID').AsInteger := 0;

          IQuery.Prepare;
          IQuery.ExecSql;

          FrmData.Trans_Eficaz.CommitRetaining;

          IQuery.Sql.Clear;
          IQuery.Sql.Add('INSERT INTO TRANSITENS(TRANSACAO_ID, PRODUTO_ID, TP_PROD_SERV, DESCRICAO, TRIBUTO_ID, CFOP, QUANTIDADE, VR_UNITARIO, VR_DESCONTO, VR_TOTAL)');
          IQuery.Sql.Add('SELECT :ID_TRANS, PRODUTO_ID, TP_PROD_SERV, DESCRICAO, TRIBUTO_ID, :CFOP, QUANTIDADE, VR_UNITARIO, VR_DESCONTO, VR_TOTAL');
          IQuery.Sql.Add('FROM TRANSITENS');
          IQuery.Sql.Add('WHERE');
          IQuery.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

          IQuery.ParamByName('ID_TRANS').AsInteger     := Id_Trans;
          IQuery.ParamByName('TRANSACAO_ID').AsInteger := ID;

          if ((Cond_Origem = '02') and (Dpt_Origem = '07')) or ((Cond_Origem = '02') and (Dpt_Origem = '10')) then
          IQuery.ParamByName('CFOP').AsString  := '1556';

          if ((Cond_Origem = '01') and (Dpt_Origem = '07')) or ((Cond_Origem = '01') and (Dpt_Origem = '10')) then
          IQuery.ParamByName('CFOP').AsString  := '5556';


          IQuery.Prepare;
          IQuery.ExecSql;

          FrmData.Trans_Eficaz.CommitRetaining;

          MessageDlg(PChar('Nota: ' + IntToStr(FrmPrincipal.ACBrCTe1.Conhecimentos.Items[0].CTe.Ide.nCT) + ' Denegada!! Favor Verificar junto ao Fisco Emitente ou Emissor!'),mtinformation,[MBOK],0);

        end;
      btnGera.Enabled    := True;
      btnRetorna.Enabled := True;
    end;
    Close;
  end;
end;

procedure TFrmCTe.btnIBGEClick(Sender: TObject);
begin
  try
    IBGE.Text := IntToStr(GetConsulta('IBGE', 0, 0, StrToInt(IBGE.Text)));
  except
    IBGE.Text := IntToStr(GetConsulta('IBGE', 0, 0, 0));
  end;

end;

procedure TFrmCTe.Button1Click(Sender: TObject);
var
MyFile: TextFile;
InputString, Buffer,S : String;
copias, Dividir,Linhas,Lin : Integer;
meio : Real;
begin
if not QTabela.IsEmpty then
Begin
if Application.MessageBox('Deseja imprimir o comprovante?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = idYes then
          begin
            InputString := InputBox(PChar(Msg_Title), 'Cópias', '1');

            AssignFile(MyFile, ExtractFilePath(ParamStr(0)) + 'Recibo.Txt');
            Rewrite(MyFile);

            for Copias := 1 to StrToInt(InputString) do
            begin
              if LeIni(Arq_Ini, 'Sistema', 'Linha Cabeçalho') <> '' then
                WriteLn(MyFile, LeIni(Arq_Ini, 'Sistema', 'Linha Cabeçalho'))
              else
              begin
                Meio    := ((48 - Length(FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString)) / 2);
                Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));

                Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ') + FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString);

                Meio    := ((48 - Length(FrmPrincipal.QEmpresa.FieldByName('TELEFONE').AsString)) / 2);
                Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));

                Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ') + FrmPrincipal.QEmpresa.FieldByName('TELEFONE').AsString);

                Meio    := ((48 - Length(FrmPrincipal.QEmpresa.FieldByName('ENDERECO').AsString)) / 2);
                Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));

                Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ') + FrmPrincipal.QEmpresa.FieldByName('ENDERECO').AsString);

                Meio    := ((48 - Length(FrmPrincipal.QEmpresa.FieldByName('BAIRRO').AsString + ' - ' + FrmPrincipal.QEmpresa.FieldByName('MUNICIPIO').AsString)) / 2);
                Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));

                Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ') + FrmPrincipal.QEmpresa.FieldByName('BAIRRO').AsString + ' - ' + FrmPrincipal.QEmpresa.FieldByName('MUNICIPIO').AsString);

                Meio    := ((48 - Length('CEP: ' + FrmPrincipal.QEmpresa.FieldByName('CEP').AsString + ' - ' + 'CNPJ: ' + FrmPrincipal.QEmpresa.FieldByName('CNPJ').AsString)) / 2);
                Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));

                Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ') + 'CEP: ' + FrmPrincipal.QEmpresa.FieldByName('CEP').AsString + ' - ' + 'CNPJ: ' + FrmPrincipal.QEmpresa.FieldByName('CNPJ').AsString);

                Meio    := ((48 - Length('Hora: ' + TimeToStr(now) + '  Data: ' + DateToStr(date))) / 2);
                Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));

                {Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ') + 'Hora: ' + TimeToStr(now) + '  Data: ' + DateToStr(date));
                Writeln(MyFile, '----------------------------------------------');

                Meio    := ((48 - Length('Venda: ' + IntToStr(ID))) / 2);
                Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));

                Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ') + 'Venda: ' + IntToStr(ID));

                Meio    := ((48 - Length('At.: ' + Copy(QVendedor.FieldByName('NOME').AsString, 1, 15))) / 2);
                Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));

                Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ') + 'At.: ' + Copy(QVendedor.FieldByName('NOME').AsString, 1, 15));}
              end;
              Writeln(MyFile, '------------------------------------------------');
              Writeln(MyFile, '       R E C I B O  N Ã O  F I S C A L          ');
              Writeln(MyFile, '------------------------------------------------');
              Writeln(MyFile, 'Nº: '+ NO_DOC_FISCAL.Text + ' Data: ' + DateToStr(Date));
              Writeln(MyFile, '------------------------------------------------');
              Writeln(MyFile, 'CTE:'+ QTransacao.FieldByName('CHAVE_NFE').AsString);
              Writeln(MyFile, '------------------------------------------------');
              Writeln(MyFile, 'Valor: R$'+ (FormatFloat('#,##0.00', QTransacao.FieldByName('VALOR').AsFloat)));
              Writeln(MyFile, '------------------------------------------------');
              Writeln(MyFile, '            Relação das Notas Fiscais           ');
              Writeln(MyFile, '------------------------------------------------');
              Writeln(MyFile, 'Data          /    Nota Fiscal             Valor ');
              Writeln(MyFile, '------------------------------------------------');

              QNotas.First;
              while not QNotas.Eof do
              begin
                Writeln(MyFile, QNotas.FieldByName('DT_EMISSAO').AsString  + '   /      ' +
                                ForcaComprimento(QNotas.FieldByName('NUM_DOC').AsString, 13, ' ') +
                                ForcaComprimento(' ', 14 - Length(FormatFloat('#,##0.00', QNotas.FieldByName('VALOR').AsFloat)), ' ') +
                                FormatFloat('#,##0.00', QNotas.FieldByName('VALOR').AsFloat));

                Application.ProcessMessages;

                QNotas.Next;
              end;

              Writeln(MyFile, '                                       ---------');


              if (QTransacao.FieldByName('COND_PAGTO').AsString = 'A PRAZO') then
              begin
                Writeln(MyFile, 'Cliente: ' + QParceiro.FieldByName('NOME').AsString);
                Writeln(MyFile, 'CPF/CNPJ: ' + QParceiro.FieldByName('CNPJ').AsString);
                Writeln(MyFile, 'Endereco: ' + QParceiro.FieldByName('ENDERECO').AsString + ', ' + QParceiro.FieldByName('NUMERO').AsString);
                Writeln(MyFile, 'Bairro/Cidade: ' + QParceiro.FieldByName('BAIRRO').AsString + ', ' + QParceiro.FieldByName('MUNICIPIO').AsString);
                Writeln(MyFile, 'CEP: ' + QParceiro.FieldByName('CEP').AsString);
                Writeln(MyFile, '');

                QParcelas.Sql.Clear;
                QParcelas.Sql.Add('SELECT * FROM TRANSPARCELAS');
                QParcelas.Sql.Add('WHERE');
                QParcelas.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
                QParcelas.Sql.Add('AND (TIPO_TRANSACAO = :TIPO_TRANSACAO)');
                QParcelas.Sql.Add('AND (BANCO_ID = 0)');

                QParcelas.ParamByName('TRANSACAO_ID').AsInteger  := ID;
                QParcelas.ParamByName('TIPO_TRANSACAO').AsString := 'T';

                QParcelas.Prepare;
                QParcelas.Open;

                QParcelas.First;

                while not QParcelas.Eof do
                begin
                  Writeln(MyFile, 'Vencimento: ' + QParcelas.FieldByName('DT_VENCIMENTO').AsString +
                                                   '          Valor : ' + FormatFloat('#,##0.00', QParcelas.FieldByName('VALOR').AsFloat));
                  Application.ProcessMessages;
                  QParcelas.Next;
                end;

                Writeln(MyFile, '');
                Writeln(MyFile, '');
                Writeln(MyFile, '       _________________________________        ');
                Writeln(MyFile, '             Assinatura do Cliente              ');
              end
              else
              begin
                if Nome_Transportador.Text <> '' then
                begin
                  Writeln(MyFile, 'Cliente: ' + Nome_Transportador.Text);
                  Writeln(MyFile, 'Endereço: ' + Endereco_Transportador.Text + ', ' + N_Transportador.text);
                  Writeln(MyFile, 'Bairro: ' + Bairro_Transportador.Text);
                  Writeln(MyFile, 'Cidade: ' + Municipio_Transportador.Text);
                end;

                Writeln(MyFile, '');
                Writeln(MyFile, '');
                Writeln(MyFile, '       _________________________________        ');
                Writeln(MyFile, '             Assinatura do Cliente              ');
              end;

              {IQuery.SQL.Clear;
              IQuery.SQL.Add('SELECT NOME FROM OPERADORES WHERE OPERADOR_ID = :OPERADOR');
              IQuery.ParamByName('OPERADOR').AsString := StrZero(IntToStr(operador_caixa), 14, 0);
              IQuery.Prepare;
              IQuery.Open;

              Writeln(MyFile, '');
              Writeln(MyFile, '');
              Writeln(MyFile, '------------------------------------------------');
              Writeln(MyFile, 'Equipamento: ' + LeIni(Arq_Ini, 'Sistema', 'Caixa'));
              Writeln(MyFile, '');
              Writeln(MyFile, 'Operador: ' + StrZero(IQuery.FieldByName('NOME').AsString,3,0));  }
              Writeln(MyFile, '');
              Writeln(MyFile, '');
              Writeln(MyFile, '------------------------------------------------');
              Writeln(MyFile, '             NAO É DOCUMENTO FISCAL             ');
              Writeln(MyFile, ' NÃO E VÁLIDO COMO RECIBO E COMO GARANTIA DE    ');
              Writeln(MyFile, '       SERVIÇO - NÃO COMPROVA PAGAMENTO.        ');
              Writeln(MyFile, '        EXIGIR  EMISSÃO CTe ELETRÔNICO          ');
              Writeln(MyFile, '------------------------------------------------');


              for Linhas := 1 to StrToInt(LeIni(Arq_Ini, 'Sistema', 'Linhas')) do
                Writeln(MyFile, ' ');
            end;

            CloseFile(MyFile);

            AssignFile(MyFile, ExtractFilePath(ParamStr(0)) + 'Recibo.Txt');
            Reset(MyFile);

            Buffer := '';

            Lin := 1;

            RDprint1.Abrir;

            RDprint1.Impressora        := BOBINA;
            RDprint1.TamanhoQteLinhas  := 1;
            RDprint1.TamanhoQteColunas := 48;
            RDprint1.Acentuacao        := SemAcento;
            RDprint1.MostrarProgresso  := True;
            RDprint1.ImpASCII(01, 01, '27 64');

            while not Eof(MyFile) do
            begin
              ReadLn(MyFile, S);

              Buffer := S;

              RDprint1.Imp(Lin, 01, Buffer);

              Inc(Lin);


              Application.ProcessMessages;
            end;

            CloseFile(MyFile);
            RDprint1.TamanhoQteLinhas  := lin;
            RDprint1.OpcoesPreview.Preview := true;

            RDprint1.Fechar;
          end;
End
Else
Application.MessageBox('Não existe CT-e Gerado, favor Verificar!', PChar(Msg_Title), mb_IconInformation);
end;

procedure TFrmCTe.CFOP_COMPLExit(Sender: TObject);
begin
  DetailSearch('CFOP');
end;

procedure TFrmCTe.CNPJ_TRANSPORTADORKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmCTe.COND_PAGTOExit(Sender: TObject);
begin
 DetailSearch('');

  if Validacao then
  begin
    if NO_DOC_FISCAL.Value > 0 then
    Begin
    //  Edit;
      Grid_Notas.Enabled := True;
      Grid_Notas.SetFocus;
    End
    else
    Begin
     // Insert;
      Grid_Notas.Enabled := True;
      Grid_Notas.SetFocus;
    End;
  end
  Else
  Grid_Notas.Enabled := False;

end;

procedure TFrmCTe.DT_SAIDAEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmCTe.DT_SAIDAExit(Sender: TObject);
begin
 HR_SAIDA.Text            := Copy(TimeToStr(time), 1, 5);
end;

procedure TFrmCTe.DT_SAIDAKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = CFOP_COMPL) then
    CFOP_COMPL.Text := GetConsulta_CFOP(CFOP_COMPL.Text);

  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmCTe.FormCreate(Sender: TObject);
begin
  GeraXML          := False;
  DT_PREVISAO.Date := Date;
end;

procedure TFrmCTe.FormShow(Sender: TObject);
var
IniFile: String;
Ini: TIniFile;
StreamMemo: TMemoryStream;
begin

  QTransacao.Sql.Clear;
  QTransacao.Sql.Add('SELECT * FROM TRANSACOES');
  QTransacao.Sql.Add('WHERE');
  QTransacao.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

  QTransacao.ParamByName('TRANSACAO_ID').AsInteger := ID;

  QTransacao.Prepare;
  QTransacao.Open;

  if QTransacao.FieldByName('COND_PAGTO').AsString = 'A VISTA' then
    COND_PAGTO.ItemIndex := 0
  else
    COND_PAGTO.ItemIndex := 1;

  QTabela.Sql.Clear;
  QTabela.Sql.Add('SELECT * FROM COMPL_CTEFISCAL');
  QTabela.Sql.Add('WHERE');
  QTabela.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

  QTabela.ParamByName('TRANSACAO_ID').AsInteger := ID;

  QTabela.Prepare;
  QTabela.Open;

  if (QTabela.IsEmpty) then
  begin
    Set_Campos(True);

    // UF_VEICULO.Text       := '  ';
    // UF_TRANSPORTADOR.Text := '  ';
    DT_SAIDA.Date            := date;
    HR_SAIDA.Text            := Copy(TimeToStr(time), 1, 5);
    DT_PREVISAO.Date         := date;
    TRANSACAO_ID.Value       := ID;
    NO_DOC_FISCAL.Value      := 0;
    QUANTIDADE_VOLUMES.Value := QTransacao.FieldByName('UNIDADES').AsFloat;
    // ESPECIE_VOLUMES.Text  := 'CAIXA';
    Empresa_id.Value         :=  FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger;
    Tomador_servico.Text     := 'REMETENTE';
    TIPO_SERVICO.Text        := 'NORMAL';
    FORMA_EMISSAO.Text       := 'NORMAL';
    FINALIDADE_EMISSAO.Text  := '1-NFE NORMAL';
    TIPO_TRANSPORTE.Text     := 'RODOVIÁRIO';
    PROD_PRINCIPAL.Text      := 'DIVERSOS';
    Lotacao.Text             := 'NÃO';
    Instrucoes.Text          := 'TRAÇÃO';


    QItens.Sql.Clear;
    QItens.Sql.Add('SELECT * FROM TRANSITENS');
    QItens.Sql.Add('WHERE');
    QItens.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

    QItens.ParamByName('TRANSACAO_ID').AsInteger := ID;

    QItens.Prepare;
    QItens.Open;

   // PESO_BRUTO.Value   := 0;
    PESO_LIQUIDO.Value := 0;

    QItens.First;
    while not QItens.Eof do
    begin
      ProdutoSearch(QItens.FieldByName('PRODUTO_ID').AsInteger);

   // PESO_BRUTO.Value   := PESO_BRUTO.Value + (QProdutos.FieldByName('PESO').AsFloat * QItens.FieldByName('QUANTIDADE').AsFloat);
      PESO_LIQUIDO.Value := PESO_LIQUIDO.Value + (QProdutos.FieldByName('PESO_UNITARIO').AsFloat * QItens.FieldByName('QUANTIDADE').AsFloat);

      Application.ProcessMessages;
      QItens.Next;
    end;
  end

  else
    Set_Campos(False);

  if QTabela.FieldByName('HR_SAIDA').IsNull then
  begin 
    DT_SAIDA.Date            := date;
    HR_SAIDA.Text            := Copy(TimeToStr(time), 1, 5);
    DT_PREVISAO.Date         := date;
    TRANSACAO_ID.Value       := ID;
    Empresa_id.Value         :=  FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger;
    Tomador_servico.Text     := 'REMETENTE';
    TIPO_SERVICO.Text        := 'NORMAL';
    FORMA_EMISSAO.Text       := 'NORMAL';
    FINALIDADE_EMISSAO.Text  := '1-NFE NORMAL';
    TIPO_TRANSPORTE.Text     := 'RODOVIÁRIO';
    PROD_PRINCIPAL.Text      := 'DIVERSOS';
    Lotacao.Text             := 'NÃO';
    Instrucoes.Text          := 'TRAÇÃO';
  end;

  {if INSTRUCOES.Lines.Text = '' then
  begin
    IniFile := ChangeFileExt(ExtractFilePath(ParamStr(0)) + 'NFe', '.Ini');

    Ini := TIniFile.Create(IniFile);
    try
      StreamMemo := TMemoryStream.Create;

      Ini.ReadBinaryStream('Informações Adicionais', 'Texto', StreamMemo);
      INSTRUCOES.Lines.LoadFromStream(StreamMemo);
      StreamMemo.Free;
    finally
      Ini.Free;
    end;

    if (FrmPrincipal.QEmpresa.FieldByName('CRT').AsString =  '1 - SIMPLES NACIONAL') and (INSTRUCOES.Lines.Text = '') then
      INSTRUCOES.Lines.Add('NÃO PERMITE O APROVEITAMENTO DO CRÉDITO DE ICMS NO VALOR DE R$ ' + FormatFloat('#,##0.00', (QTransacao.FieldByName('VALOR').AsFloat * FrmPrincipal.Config.FieldByName('ALIQ_SIMPLES').AsFloat) / 100) +
                           ' CORRESPONDENTE À ALÍQUOTA DE ' + FormatFloat('#,##0.00', FrmPrincipal.Config.FieldByName('ALIQ_SIMPLES').AsFloat) + '%, NOS TERMOS DO ART. 23 DA LC 123/2006');
  end;
  if Copy(QTransacao.FieldByName('COMPLEMENTO').AsString,1,7) = 'Rf.Doc:' then
  Begin
  Instrucoes.Lines.Clear;
  Instrucoes.lines.Add(QTransacao.FieldByName('COMPLEMENTO').AsString);

  if FrmPrincipal.QEmpresa.FieldByName('CRT').AsString <> '1 - SIMPLES NACIONAL' then
  Instrucoes.Enabled := False;

  End;} 


  QNotas.Close;

  QNotas.ParamByName('TRANSACAO_ID').AsInteger := QTransacao.FieldByName('TRANSACAO_ID').AsInteger;

  QNotas.Prepare;
  QNotas.Open;


  CFOP_COMPL.Text      := Cod_CFOP;

end;

procedure TFrmCTe.GerarXMLClick(Sender: TObject);
begin
  Application.CreateForm(TFrmPasswordDlg, FrmPasswordDlg);
  try
    if FrmPasswordDlg.ShowModal = mrOk then
    begin
      if FrmPasswordDlg.Password.Text = Senha_Suporte then
      begin
         GeraXML := True;
         btnGeraClick(Sender);
         GeraXML := False;

        if LeIni(Arq_Ini, 'Sistema', 'Organizar Janelas Automaticamente') = 'True' then
          Cascade;
      end
      else
        Application.MessageBox('Acesso negado', PChar(Msg_Title), mb_IconStop);
    end;
  finally
    FrmPasswordDlg.Release;
  end;

end;

procedure TFrmCTe.Grid_NotasKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
InputString: String;
begin
  if (Key = Vk_F4) and (QNotas.State = dsBrowse) and (not QNotas.IsEmpty) then
    QNotas.Delete;

  if (Key = Vk_F7) and (QNotas.State = dsBrowse) and (not QNotas.IsEmpty) then
  begin
    InputString := InputBox('Localizar', 'Num. de Nota:', '');

    if InputString <> '' then
      QNotas.Locate('NUM_SERIE', InputString, [loCaseInsensitive]);
  end;

  if Key = VK_F9 then
    Perform(Wm_NextDlgCtl, 0, 0);

  if ((Key = Vk_Up) or (Key = Vk_Down)) and (QNotas.State in [dsInsert, dsEdit]) then
    Key := 0;

end;

procedure TFrmCTe.Grid_NotasKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Keybd_Event(VK_TAB, 0, 0, 0);

  Key := AnsiUpperCase(Key)[1];
end;

end.
