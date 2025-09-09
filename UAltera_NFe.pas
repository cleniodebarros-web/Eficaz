unit UAltera_NFe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DBCtrls, rxCurrEdit, Mask, rxToolEdit, DB,
  IBCustomDataSet, IBQuery, Math, Buttons, IniFiles, Menus, IBStoredProc,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmAltera_NFe = class(TForm)
    Label3: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    Label33: TLabel;
    Label36: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label1: TLabel;
    Bevel2: TBevel;
    btnGera: TButton;
    DT_SAIDA: TDateEdit;
    CFOP_COMPL: TEdit;
    NOME_TRANSPORTADOR: TEdit;
    PLACA_VEICULO: TEdit;
    ENDERECO_TRANSPORTADOR: TEdit;
    MUNICIPIO_TRANSPORTADOR: TEdit;
    INSCRICAO_TRANSPORTADOR: TEdit;
    PESO_BRUTO: TRxCalcEdit;
    PESO_LIQUIDO: TRxCalcEdit;
    QUANTIDADE_VOLUMES: TCurrencyEdit;
    UF_VEICULO: TComboBox;
    UF_TRANSPORTADOR: TComboBox;
    ESPECIE_VOLUMES: TEdit;
    MARCA_VOLUMES: TEdit;
    NUMERO_VOLUMES: TEdit;
    INSTRUCOES: TMemo;
    TRANSACAO_ID: TCurrencyEdit;
    NO_DOC_FISCAL: TCurrencyEdit;
    CNPJ_TRANSPORTADOR: TEdit;
    RESP_FRETE: TRadioGroup;
    Label5: TLabel;
    FORMA_EMISSAO: TComboBox;
    Label6: TLabel;
    FINALIDADE_EMISSAO: TComboBox;
    btnFornecedor: TSpeedButton;
    btnRetorna: TBitBtn;
    Menu_GeraXML: TPopupMenu;
    GerarXML: TMenuItem;
    LOCAL_EMBARQUE: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    UF_EMBARQUE: TComboBox;
    Label9: TLabel;
    CHAVE_NFE: TEdit;
    Label10: TLabel;
    RECIBO: TEdit;
    Label11: TLabel;
    PROTOCOLO: TEdit;
    Label12: TLabel;
    COND_PAGTO: TComboBox;
    EMPRESA_ID: TCurrencyEdit;
    INSTRUCOES_2: TMemo;
    lbl1: TLabel;
    HR_SAIDA: TMaskEdit;
    QConfig_Nfiscal: TFDQuery;
    QItens: TFDQuery;
    QTransacao: TFDQuery;
    QNatOper: TFDQuery;
    QParceiro: TFDQuery;
    QTabela: TFDQuery;
    IQuery: TFDQuery;
    QParcelas: TFDQuery;
    QCfop: TFDQuery;
    QProdutos: TFDQuery;
    QOrigem: TFDQuery;
    QDetalhe_Import: TFDQuery;
    QDetalhe: TFDQuery;
    QNotas: TFDQuery;
    Label13: TLabel;
    RNTC: TEdit;
    procedure DT_SAIDAKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CNPJ_TRANSPORTADORKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnGeraClick(Sender: TObject);
    procedure CFOP_COMPLExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RESP_FRETEClick(Sender: TObject);
    procedure btnFornecedorClick(Sender: TObject);
    procedure DT_SAIDAEnter(Sender: TObject);
    procedure GerarXMLClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
  FrmAltera_NFe: TFrmAltera_NFe;
  ID: Integer;
  GeraXML: Boolean;
  Cod_CFOP: String;

  procedure Altera_NFe(Transacao_Id: Integer; CFOP: String);

implementation

uses
  UPrincipal, UData, pcnConversao,pcnConversaoNfe, UConsulta, UConsulta_CFOP;

{$R *.dfm}

procedure TFrmAltera_NFe.Set_Campos(Vazio: Boolean);
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

procedure TFrmAltera_NFe.Insert;
var
I: Integer;
Temp: TComponent;
Sql, Par: String;
begin
  Sql := 'INSERT INTO COMPL_NFISCAL(';
  Par := '';

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
    begin
      if Sql = 'INSERT INTO COMPL_NFISCAL(' then
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
      if Sql = 'INSERT INTO COMPL_NFISCAL(' then
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
      if Sql = 'INSERT INTO COMPL_NFISCAL(' then
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
      if Sql = 'INSERT INTO COMPL_NFISCAL(' then
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
      if Sql = 'INSERT INTO COMPL_NFISCAL(' then
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
      if Sql = 'INSERT INTO COMPL_NFISCAL(' then
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
      if Sql = 'INSERT INTO COMPL_NFISCAL(' then
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
      if Sql = 'INSERT INTO COMPL_NFISCAL(' then
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


end;

procedure TFrmAltera_NFe.Edit;
var
I: Integer;
Temp: TComponent;
Sql: String;
begin
  Sql := 'UPDATE COMPL_NFISCAL SET ';

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
    begin
      if Sql = 'UPDATE COMPL_NFISCAL SET ' then
        Sql := Sql + TEdit(Temp).Name + ' = :' + TEdit(Temp).Name
      else
        Sql := Sql + ', ' + TEdit(Temp).Name + ' = :' + TEdit(Temp).Name;
    end;

    if Temp is TMaskEdit then
    begin
      if Sql = 'UPDATE COMPL_NFISCAL SET ' then
        Sql := Sql + TMaskEdit(Temp).Name + ' = :' + TMaskEdit(Temp).Name
      else
        Sql := Sql + ', ' + TMaskEdit(Temp).Name + ' = :' + TMaskEdit(Temp).Name;
    end;

    if Temp is TDateEdit then
    begin
      if Sql = 'UPDATE COMPL_NFISCAL SET ' then
        Sql := Sql + TDateEdit(Temp).Name + ' = :' + TDateEdit(Temp).Name
      else
        Sql := Sql + ', ' + TDateEdit(Temp).Name + ' = :' + TDateEdit(Temp).Name;
    end;

    if Temp is TCurrencyEdit then
    begin
      if Sql = 'UPDATE COMPL_NFISCAL SET ' then
        Sql := Sql + TCurrencyEdit(Temp).Name + ' = :' + TCurrencyEdit(Temp).Name
      else
        Sql := Sql + ', ' + TCurrencyEdit(Temp).Name + ' = :' + TCurrencyEdit(Temp).Name;
    end;

    if Temp is TRxCalcEdit then
    begin
      if Sql = 'UPDATE COMPL_NFISCAL SET ' then
        Sql := Sql + TRxCalcEdit(Temp).Name + ' = :' + TRxCalcEdit(Temp).Name
      else
        Sql := Sql + ', ' + TRxCalcEdit(Temp).Name + ' = :' + TRxCalcEdit(Temp).Name;
    end;

    if Temp is TRadioGroup then
    begin
      if Sql = 'UPDATE COMPL_NFISCAL SET ' then
        Sql := Sql + TRadioGroup(Temp).Name + ' = :' + TRadioGroup(Temp).Name
      else
        Sql := Sql + ', ' + TRadioGroup(Temp).Name + ' = :' + TRadioGroup(Temp).Name;
    end;

    if Temp is TComboBox then
    begin
      if Sql = 'UPDATE COMPL_NFISCAL SET ' then
        Sql := Sql + TComboBox(Temp).Name + ' = :' + TComboBox(Temp).Name
      else
        Sql := Sql + ', ' + TComboBox(Temp).Name + ' = :' + TComboBox(Temp).Name;
    end;

    if Temp is TMemo then
    begin
      if Sql = 'UPDATE COMPL_NFISCAL SET ' then
        Sql := Sql + TMemo(Temp).Name + ' = :' + TMemo(Temp).Name
      else
        Sql := Sql + ', ' + TMemo(Temp).Name + ' = :' + TMemo(Temp).Name;
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
      IQuery.ParamByName(TMemo(Temp).Name).AsByteStr := TMemo(Temp).Lines.Text;
  end;

  IQuery.ParamByName('ID').AsInteger := QTabela.FieldByName('TRANSACAO_ID').AsInteger;

  IQuery.Prepare;
  IQuery.ExecSql;


  
  QTabela.Close;
  QTabela.Open;
end;

function TFrmAltera_NFe.Validacao: Boolean;
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

  if (FORMA_EMISSAO.Text <> 'NORMAL') and (FORMA_EMISSAO.Text <> 'CONTINGÊNCIA FS') and (FORMA_EMISSAO.Text <> 'CONTINGÊNCIA C/ SVCAN') and (FORMA_EMISSAO.Text <> 'CONTINGÊNCIA VIA DPEC') and (FORMA_EMISSAO.Text <> 'CONTINGÊNCIA FS-DA') then
  begin
    Application.MessageBox('Forma de Emissão inválida', PChar(Msg_Title), mb_IconStop);
    FORMA_EMISSAO.Color := clYellow;
    FORMA_EMISSAO.SetFocus;
    exit;
  end;

  if (FINALIDADE_EMISSAO.Text <> '1-NFE NORMAL') and (FINALIDADE_EMISSAO.Text <> '2-NFE COMPLEMENTAR') and (FINALIDADE_EMISSAO.Text <> '3-NFE DE AJUSTE') and (FINALIDADE_EMISSAO.Text <> '4-DEVOLUÇÃO/RETORNO') then
  begin
    Application.MessageBox('Finalidade de Emissão inválida', PChar(Msg_Title), mb_IconStop);
    FINALIDADE_EMISSAO.Color := clYellow;
    FINALIDADE_EMISSAO.SetFocus;
    exit;
  end;

  Result := True;
end;

procedure TFrmAltera_NFe.DetailSearch(Tabela: String);
begin
  if ((Tabela = '') or (Tabela = 'CFOP')) and (CFOP_COMPL.Text <> '') then
  begin
    QCFOP.Close;

    QCFOP.ParamByName('COD_CFOP').AsString := CFOP_COMPL.Text;
    QCFOP.Prepare;

    QCFOP.Open;
  end;
end;

function TFrmAltera_NFe.Search_Campo(Txt: String): Integer;
begin
  QConfig_NFiscal.Sql.Clear;
  QConfig_NFiscal.Sql.Add('SELECT * FROM CONFIG_NFISCAL');
  QConfig_NFiscal.Sql.Add('WHERE');
  QConfig_NFiscal.Sql.Add('(CAMPO = :CAMPO)');

  QConfig_NFiscal.ParamByName('CAMPO').AsString := Txt;

  QConfig_NFiscal.Prepare;
  QConfig_NFiscal.Open;

  if not QConfig_NFiscal.IsEmpty then
    Result := QConfig_NFiscal.FieldByName('COLUNA').AsInteger
  else
    Result := 0;
end;

procedure Altera_NFe(Transacao_Id: Integer; CFOP: String);
begin
  ID       := Transacao_Id;
  Cod_CFOP := CFOP;

  Application.CreateForm(TFrmAltera_NFe, FrmAltera_NFe);
  try
    FrmAltera_NFe.ShowModal;
  finally
    FrmAltera_NFe.Release;
  end;
end;

procedure TFrmAltera_NFe.ProdutoSearch(ID: Integer);
begin
  QProdutos.Sql.Clear;
  QProdutos.Sql.Add('SELECT PRODUTOS.*, TRIBUTOS.ORIGEM, TRIBUTOS.TRIBUTACAO,IBTP.ALIQNAC,IBTP.ALIQIMP,IBTP.ALIQEST');
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

procedure TFrmAltera_NFe.RESP_FRETEClick(Sender: TObject);
begin
  if (RESP_FRETE.ItemIndex = 0) and (NO_DOC_FISCAL.Value = 0) then
  begin
    if Application.MessageBox('O transportador é o próprio emitente?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = IDYES then
    begin
      IQuery.Sql.Clear;
      IQuery.Sql.Add('SELECT * FROM EMPRESAS');
      IQuery.Sql.Add('WHERE');
      IQuery.Sql.Add('(EMPRESA_ID = :EMPRESA_ID)');

      IQuery.ParamByName('EMPRESA_ID').AsInteger := QTransacao.FieldByName('EMPRESA_ID').AsInteger;

      IQuery.Prepare;
      IQuery.Open;

      NOME_TRANSPORTADOR.Text      := IQuery.FieldByName('RAZAO').AsString;
      CNPJ_TRANSPORTADOR.Text      := SemMascara(IQuery.FieldByName('CNPJ').AsString);
      ENDERECO_TRANSPORTADOR.Text  := IQuery.FieldByName('ENDERECO').AsString;
      MUNICIPIO_TRANSPORTADOR.Text := IQuery.FieldByName('MUNICIPIO').AsString;
      UF_TRANSPORTADOR.Text        := IQuery.FieldByName('ESTADO').AsString;
      INSCRICAO_TRANSPORTADOR.Text := IQuery.FieldByName('INSCR_ESTADUAL').AsString;
    end;
  end;

  if (RESP_FRETE.ItemIndex = 1) and (NO_DOC_FISCAL.Value = 0) then
  begin
    if (QTransacao.FieldByName('CONDUTA').AsString = '01') and (QTransacao.FieldByName('DEPTO').AsString = '07') then
    begin
      if Application.MessageBox('O transportador é o próprio cliente?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = IDYES then
      begin
        IQuery.Sql.Clear;
        IQuery.Sql.Add('SELECT * FROM CLIENTES');
        IQuery.Sql.Add('WHERE');
        IQuery.Sql.Add('(CLIENTE_ID = :CLIENTE_ID)');

        IQuery.ParamByName('CLIENTE_ID').AsInteger := QTransacao.FieldByName('CLIENTE_ID').AsInteger;

        IQuery.Prepare;
        IQuery.Open;

        NOME_TRANSPORTADOR.Text      := IQuery.FieldByName('NOME').AsString;
        CNPJ_TRANSPORTADOR.Text      := SemMascara(IQuery.FieldByName('CNPJ').AsString);
        ENDERECO_TRANSPORTADOR.Text  := IQuery.FieldByName('ENDERECO').AsString;
        MUNICIPIO_TRANSPORTADOR.Text := IQuery.FieldByName('MUNICIPIO').AsString;
        UF_TRANSPORTADOR.Text        := IQuery.FieldByName('ESTADO').AsString;
        INSCRICAO_TRANSPORTADOR.Text := IQuery.FieldByName('INSCRICAO').AsString;
      end;
    end;

    if (QTransacao.FieldByName('CONDUTA').AsString = '01') and (QTransacao.FieldByName('DEPTO').AsString = '10') then
    begin
      if Application.MessageBox('O transportador é o próprio fornecedor?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = IDYES then
      begin
        IQuery.Sql.Clear;
        IQuery.Sql.Add('SELECT * FROM FORNECEDORES');
        IQuery.Sql.Add('WHERE');
        IQuery.Sql.Add('(FORNECEDOR_ID = :FORNECEDOR_ID)');

        IQuery.ParamByName('FORNECEDOR_ID').AsInteger := QTransacao.FieldByName('FORNECEDOR_ID').AsInteger;

        IQuery.Prepare;
        IQuery.Open;

        NOME_TRANSPORTADOR.Text      := IQuery.FieldByName('NOME').AsString;
        CNPJ_TRANSPORTADOR.Text      := SemMascara(IQuery.FieldByName('CNPJ').AsString);
        ENDERECO_TRANSPORTADOR.Text  := IQuery.FieldByName('ENDERECO').AsString;
        MUNICIPIO_TRANSPORTADOR.Text := IQuery.FieldByName('MUNICIPIO').AsString;
        UF_TRANSPORTADOR.Text        := IQuery.FieldByName('ESTADO').AsString;
        INSCRICAO_TRANSPORTADOR.Text := IQuery.FieldByName('INSCRICAO').AsString;
      end;
    end;

    if (QTransacao.FieldByName('CONDUTA').AsString = '20') and (QTransacao.FieldByName('DEPTO').AsString = '07') then
    begin
      if Application.MessageBox('O transportador é o próprio emitente?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = IDYES then
      begin
        IQuery.Sql.Clear;
        IQuery.Sql.Add('SELECT * FROM EMPRESAS');
        IQuery.Sql.Add('WHERE');
        IQuery.Sql.Add('(EMPRESA_ID = :EMPRESA_ID)');

        IQuery.ParamByName('EMPRESA_ID').AsInteger := QTransacao.FieldByName('EMPRESAAUX_ID').AsInteger;

        IQuery.Prepare;
        IQuery.Open;

        NOME_TRANSPORTADOR.Text      := IQuery.FieldByName('RAZAO').AsString;
        CNPJ_TRANSPORTADOR.Text      := SemMascara(IQuery.FieldByName('CNPJ').AsString);
        ENDERECO_TRANSPORTADOR.Text  := IQuery.FieldByName('ENDERECO').AsString;
        MUNICIPIO_TRANSPORTADOR.Text := IQuery.FieldByName('MUNICIPIO').AsString;
        UF_TRANSPORTADOR.Text        := IQuery.FieldByName('ESTADO').AsString;
        INSCRICAO_TRANSPORTADOR.Text := IQuery.FieldByName('INSCR_ESTADUAL').AsString;
      end;
    end;
  end;
end;

procedure TFrmAltera_NFe.btnFornecedorClick(Sender: TObject);
var
Forne: Integer;
begin
  Forne := GetConsulta('FORNECEDORES', 0, 0, 0);

  IQuery.Sql.Clear;
  IQuery.Sql.Add('SELECT * FROM FORNECEDORES');
  IQuery.Sql.Add('WHERE');
  IQuery.Sql.Add('(FORNECEDOR_ID = :FORNECEDOR_ID)');

  IQuery.ParamByName('FORNECEDOR_ID').AsInteger := Forne;

  IQuery.Prepare;
  IQuery.Open;

  if not IQuery.IsEmpty then
  begin
    NOME_TRANSPORTADOR.Text      := IQuery.FieldByName('NOME').AsString;
    CNPJ_TRANSPORTADOR.Text      := SemMascara(IQuery.FieldByName('CNPJ').AsString);
    ENDERECO_TRANSPORTADOR.Text  := IQuery.FieldByName('ENDERECO').AsString;
    MUNICIPIO_TRANSPORTADOR.Text := IQuery.FieldByName('MUNICIPIO').AsString;
    UF_TRANSPORTADOR.Text        := IQuery.FieldByName('ESTADO').AsString;
    INSCRICAO_TRANSPORTADOR.Text := IQuery.FieldByName('INSCRICAO').AsString;
  end;
end;

procedure TFrmAltera_NFe.btnGeraClick(Sender: TObject);
var
Id_Trans,Item,cup,I,Qt_Parc: Integer;
Cond_origem,Dpt_origem,IniFile, edtSmtpHost, edtSmtpPort, edtSmtpUser, edtSmtpPass, edtEmailAssunto, Insc_Dest: String;
cbEmailSSL: Boolean;
Ini: TIniFile;
StreamMemo: TMemoryStream;
Vr_trib_acum,Vl_Trans,VR_Trib_Acum_fed, VR_Trib_Acum_Est,VTotTrib_fed,VTotTrib_Est,Icms_Total_remet,Icms_Total_Dest,Aliq_Int_Dest,Aliq_Fcp :Real;
Part_Uf_Dest,Aliq_int,Part_Uf_Orig,Icms_Orig,Icms_Dest,Difal:Real;

begin
  DetailSearch('');

  if Validacao then
  begin
    if NO_DOC_FISCAL.Value > 0 then
      Edit
    else
      Insert;

    QTabela.Sql.Clear;
    QTabela.Sql.Add('SELECT * FROM COMPL_NFISCAL');
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

        if QParceiro.FieldByName('TIPO_FORNECEDOR').AsString = 'PESSOA FÍSICA' then
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
        FrmPrincipal.ACBrNFe1.Configuracoes.Geral.FormaEmissao := teNormal
      else if FORMA_EMISSAO.Text = 'CONTINGÊNCIA FS' then
        FrmPrincipal.ACBrNFe1.Configuracoes.Geral.FormaEmissao := teContingencia
      else if FORMA_EMISSAO.Text = 'CONTINGÊNCIA C/ SVCAN' then
        FrmPrincipal.ACBrNFe1.Configuracoes.Geral.FormaEmissao := teSVCAN
      else if FORMA_EMISSAO.Text = 'CONTINGÊNCIA VIA DPEC' then
        FrmPrincipal.ACBrNFe1.Configuracoes.Geral.FormaEmissao := teDPEC
      else if FORMA_EMISSAO.Text = 'CONTINGÊNCIA FS-DA' then
        FrmPrincipal.ACBrNFe1.Configuracoes.Geral.FormaEmissao := teFSDA;


      FrmPrincipal.ACBrNFe1.NotasFiscais.Clear;

      with FrmPrincipal.ACBrNFe1.NotasFiscais.Add.NFe do
      begin
        infNFe.ID    := NO_DOC_FISCAL.Text;
//        infNFe.Versao
//        infNFe.VersaoStr

        Ide.cUF   := StrToInt(Copy(FrmPrincipal.QEmpresa.FieldByName('IBGE').AsString, 1, 2));
        Ide.cNF   := StrToInt(NO_DOC_FISCAL.Text);
        Ide.natOp := Copy(QNatoper.FieldByName('DESC_CFOP').AsString, 1, 60);


        {if COND_PAGTO.ItemIndex = 0 then
         // Ide.indPag := ipVista
        else if COND_PAGTO.ItemIndex = 1 then
         // Ide.indPag := ipPrazo
        else
         // Ide.indPag := ipOutras;
        }
        With Pag.Add do
        Begin

         if COND_PAGTO.ItemIndex = 0 then
         Begin
         indPag := ipVista;
         tPag   := fpDinheiro;
         vpag   := QTransacao.FieldByName('VALOR').AsFloat;
         End
         else if COND_PAGTO.ItemIndex = 1 then
         Begin
         indPag := ipPrazo;
         tPag := fpDuplicataMercantil;
         vpag := QTransacao.FieldByName('VALOR').AsFloat;
         End
         else if COND_PAGTO.ItemIndex = 2 then
         Begin
         indPag := ipPrazo;
         tPag := fpCartaoCredito;
         vpag := QTransacao.FieldByName('VALOR').AsFloat;
         End
         else if COND_PAGTO.ItemIndex = 3 then
         Begin
         indPag := ipPrazo;
         tPag   := fpCheque;
         vpag   := QTransacao.FieldByName('VALOR').AsFloat;
         End
         else if COND_PAGTO.ItemIndex = 4 then
         Begin
         indPag := ipVista;
         tPag   := fpOutro;
         vpag   := QTransacao.FieldByName('VALOR').AsFloat;
         End
         else if COND_PAGTO.ItemIndex = 5 then
         Begin
         indPag := ipNenhum;
         tPag   := fpSemPagamento;
         vpag   := QTransacao.FieldByName('VALOR').AsFloat;
         End;

         IF FINALIDADE_EMISSAO.Text = '4-DEVOLUÇÃO/RETORNO' Then
         Begin
         indPag := ipNenhum ;
         tPag   := fpSemPagamento;
         vpag   := QTransacao.FieldByName('VALOR').AsFloat;
         End;

        End;

        Ide.modelo   := QTransacao.FieldByName('MODELO').AsInteger;
        Ide.serie    := QTransacao.FieldByName('SERIE').AsInteger;
        Ide.nNF      := StrToInt(NO_DOC_FISCAL.Text);
        Ide.dEmi     := StrToDateTime(QTransacao.FieldByName('DT_TRANS').AsString +  QTransacao.FieldByName('HORA').AsString) ;
        Ide.dSaiEnt  := StrToDateTime(QTransacao.FieldByName('DT_ENT_SAI').AsString + TimeToSTr(StrToTime(hr_saida.Text))) ;
        //Ide.hSaiEnt  := StrToTime(hr_saida.Text);


        if (QTransacao.FieldByName('CONDUTA').AsString = '01') or (QTransacao.FieldByName('CONDUTA').AsString = '20') then
          Ide.tpNF := tnSaida
        else
          Ide.tpNF := tnEntrada;

          Ide.cMunFG := FrmPrincipal.QEmpresa.FieldByName('IBGE').AsInteger;

        if (QParceiro.FieldByName('ESTADO').AsString) = (FrmPrincipal.QEmpresa.FieldByName('ESTADO').AsString) then
          Ide.idDest := doInterna
        Else
          Ide.idDest := doInterestadual;

        if (QParceiro.FieldByName('COD_PAIS').AsString) <> '01058' then
          Ide.idDest := doExterior;

          if Insc_Dest = 'ISENTO' then
          Ide.indFinal := cfConsumidorFinal
          Else
          Ide.indFinal :=cfNao;


       { if (QParceiro.FieldByName('PAIS').AsString) <> '01058' then
          Ide.idDest := doExterior; }
//        Ide.tpImp
//        Ide.tpEmis
//        Ide.cDV
//        Ide.tpAmb


        if FINALIDADE_EMISSAO.Text = '1-NFE NORMAL' then
          Ide.finNFe := fnNormal
        else if FINALIDADE_EMISSAO.Text = '2-NFE COMPLEMENTAR' then
          Ide.finNFe := fnComplementar
        else if FINALIDADE_EMISSAO.Text = '3-NFE DE AJUSTE' then
          Ide.finNFe := fnAjuste

        else if FINALIDADE_EMISSAO.Text = '4-DEVOLUÇÃO/RETORNO' then
          Ide.finNFe := fnDevolucao;

       if (FINALIDADE_EMISSAO.Text = '4-DEVOLUÇÃO/RETORNO')  then
       Begin
        With  Ide.NFref.Add do
        Begin
          if QOrigem.FieldByName('MODELO').AsString = '55'  then
          refNFe    := QOrigem.FieldByName('CHAVE_NFE').AsString
          Else if QOrigem.FieldByName('MODELO').AsString = '04' Then
          Begin
            With RefNFP do
            Begin
            cUF     := StrToInt(Copy(Alltrim(QParceiro.FieldByName('IBGE').AsString),1,2));
            AAMM    := FormatDateTime('yymm', QTransacao.FieldByName('DT_TRANS').AsDateTime); // Copy(QTransacao.FieldByName('DT_TRANS').AsString,9,2) +  Copy(QTransacao.FieldByName('DT_TRANS').AsString,4,2);
            CNPJCPF := QParceiro.FieldByName('CNPJ').AsString;
            IE      := Insc_Dest;
            nNF     := StrToInt(QTransacao.FieldByName('CHAVE_NFE_REF').AsString);
            serie   := 001;
            modelo  := '04';
            End;
           Application.ProcessMessages;
          End
          Else if QOrigem.FieldByName('MODELO').AsString = '2D' Then
          Begin
            With RefECF do
            Begin
            nEcf   := QOrigem.FieldbyName('BANCO_ID').AsString;
            nCOO   := QOrigem.FieldByName('NUM_DOC').AsString;
            modelo := ECFModRef2D;
            End;
           Application.ProcessMessages;
          End
          Else
          Begin
          With RefNF do
            Begin
            cUF    := StrToInt(Copy(Alltrim(QParceiro.FieldByName('IBGE').AsString),1,2));
            AAMM   := FormatDateTime('yymm', QTransacao.FieldByName('DT_TRANS').AsDateTime); // Copy(QTransacao.FieldByName('DT_TRANS').AsString,9,2) +  Copy(QTransacao.FieldByName('DT_TRANS').AsString,4,2);
            CNPJ   := QParceiro.FieldByName('CNPJ').AsString;
            nNF    := StrToInt(QTransacao.FieldByName('CHAVE_NFE_REF').AsString);
            serie  := 001;
            modelo := 01;
            End;
          End;
        End;
       End;

        if FINALIDADE_EMISSAO.Text = '2-NFE COMPLEMENTAR' then
        With  Ide.NFref.Add do
        Begin
        refNFe    := QTransacao.FieldByName('CHAVE_NFE_REF').AsString;
        ShowMessage(QTransacao.FieldByName('CHAVE_NFE_REF').AsString);
        End;

       if (Copy(QTransacao.FieldByName('CFOP').AsString,1,1) = '3') or (QTransacao.FieldByName('CFOP').AsString = '7501') then
       Begin

         QNotas.Close;

         QNotas.ParamByName('TRANSACAO_ID').AsInteger := ID;

         QNotas.Prepare;

         QNotas.Open;
         QNotas.First;

         While not QNotas.Eof do
         Begin

           with Ide.NFref.Add do
           begin
            refNFe := QNotas.FieldByName('CHAVE_NFE').AsString;
           end;
            QNotas.next;
         end;
       End;


        If (QTransacao.FieldByName('CFOP').AsString = '5929') OR (QTransacao.FieldByName('CFOP').AsString = '6929') then
        Begin
          Cup := 8 ;
           for I := 0 to 20 - 1 do
         Begin
           if Copy(QTransacao.FieldByName('COMPLEMENTO').AsString,cup,7) <> '' then
           Begin
            With  Ide.NFref.Add do
            Begin
              With RefECF do
              Begin
              nEcf   := Copy(QTransacao.FieldByName('COMPLEMENTO').AsString,(Cup + 8),2);
              nCOO   := Copy(QTransacao.FieldByName('COMPLEMENTO').AsString,cup,7);
              modelo := ECFModRef2D;
              End;
            End;
           End;
           if  Copy(QTransacao.FieldByName('COMPLEMENTO').AsString,(cup + 7),1) = '-' Then
            Cup := Cup + 11
           Else
            Cup := Cup + 8;
         End;
         Application.ProcessMessages;
        End;

//        Ide.procEmi
        Ide.verProc  := '7.1.1.6';
//
        if (FORMA_EMISSAO.Text <> 'NORMAL')  then
        Begin
          Ide.dhCont           := Now();
          Ide.xJust            := 'SERVIDOR INDISPONÍVEL OU INOPERANTE';
        End;

        Emit.CNPJCPF           := FrmPrincipal.QEmpresa.FieldByName('CNPJ').AsString;
        Emit.xNome             := FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString;
        Emit.xFant             := FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString;
        Emit.EnderEmit.xLgr    := FrmPrincipal.QEmpresa.FieldByName('ENDERECO').AsString;
        Emit.EnderEmit.nro     := FrmPrincipal.QEmpresa.FieldByName('NUMERO').AsString;
        Emit.EnderEmit.xCpl    := '';
        Emit.EnderEmit.xBairro := FrmPrincipal.QEmpresa.FieldByName('BAIRRO').AsString;
        Emit.EnderEmit.cMun    := FrmPrincipal.QEmpresa.FieldByName('IBGE').AsInteger;
        Emit.EnderEmit.xMun    := FrmPrincipal.QEmpresa.FieldByName('MUNICIPIO').AsString;
        Emit.EnderEmit.UF      := FrmPrincipal.QEmpresa.FieldByName('ESTADO').AsString;
        Emit.EnderEmit.CEP     := StrToInt(SemMascara(FrmPrincipal.QEmpresa.FieldByName('CEP').AsString));
        Emit.EnderEmit.cPais   := 1058;
        Emit.EnderEmit.xPais   := 'BRASIL';
        Emit.EnderEmit.fone    := FrmPrincipal.QEmpresa.FieldByName('TELEFONE').AsString;

        Emit.IE                := FrmPrincipal.QEmpresa.FieldByName('INSCR_ESTADUAL').AsString;
//        Emit.IEST
        Emit.IM                := FrmPrincipal.QEmpresa.FieldByName('INSCR_MUNICIPAL').AsString;
        Emit.CNAE              := SemMascara(FrmPrincipal.QEmpresa.FieldByName('COD_ATIVIDADE').AsString);

        if FrmPrincipal.QEmpresa.FieldByName('CRT').AsString = '1 - SIMPLES NACIONAL' then
          Emit.CRT := crtSimplesNacional
        else if FrmPrincipal.QEmpresa.FieldByName('CRT').AsString = '2 - SIMPLES NACIONAL - EXC. REC. BRUTA' then
          Emit.CRT := crtSimplesExcessoReceita
        else
          Emit.CRT := crtRegimeNormal;

        Dest.CNPJCPF           := QParceiro.FieldByName('CNPJ').AsString;
        Dest.xNome             := QParceiro.FieldByName('NOME').AsString;

        if (Insc_Dest = 'EXTERIOR') AND (QParceiro.FieldByName('CNPJ').AsString = '')  then
        Begin
         if QParceiro.FieldByName('OBSERVACAO').AsString <> '' then
          Dest.idEstrangeiro     := Copy(QParceiro.FieldByName('OBSERVACAO').AsString,1,20)
         Else
          Dest.idEstrangeiro     := '000000';
        End;

        Dest.EnderDest.xLgr    := QParceiro.FieldByName('ENDERECO').AsString;
        Dest.EnderDest.nro     := QParceiro.FieldByName('NUMERO').AsString;
        Dest.EnderDest.xCpl    := QParceiro.FieldByName('COMPLEMENTO').AsString;;
        Dest.EnderDest.xBairro := QParceiro.FieldByName('BAIRRO').AsString;


        try
          Dest.EnderDest.cMun := QParceiro.FieldByName('IBGE').AsInteger;
        except
          Dest.EnderDest.cMun := 0;
        end;

        Dest.EnderDest.xMun    := QParceiro.FieldByName('MUNICIPIO').AsString;
        Dest.EnderDest.UF      := QParceiro.FieldByName('ESTADO').AsString;

        try
          Dest.EnderDest.CEP := StrToInt(SemMascara(QParceiro.FieldByName('CEP').AsString));
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
        Dest.EnderDest.Fone  := QParceiro.FieldByName('DDD').AsString + QParceiro.FieldByName('TELEFONE_1').AsString;


        if Insc_Dest = 'ISENTO' then
        Begin
        Dest.indIEDest :=  inNaoContribuinte;//inIsento;
        Dest.IE        := '';
        End
        Else
        Begin
        Dest.indIEDest := inContribuinte;
        Dest.IE        := Insc_Dest; //QParceiro.FieldByName('INSCRICAO').AsString;
        End;

        if (Insc_Dest = 'EXTERIOR') or ((Ide.idDest = doInterestadual) and (Insc_Dest = 'ISENTO'))  then
        Begin
        Dest.indIEDest := inNaoContribuinte;
        Dest.IE        := ''
        End;



        Dest.ISUF            := QParceiro.FieldByName('SUFRAMA').AsString;
        Dest.Email           := QParceiro.FieldByName('EMAIL').AsString;


        if  FrmPrincipal.QEmpresa.FieldByName('ESTADO').AsString = 'BA'   Then
        Begin
         With autXML.Add Do
         Begin
          CNPJCPF :=  SemMascara(FrmPrincipal.QEmpresa.FieldByName('CNPJ_CONTABILISTA').AsString);
         End;
        End;

        Item := 1;
        Vr_trib_acum     := 0;
        Vr_trib_acum_fed := 0;
        Vr_trib_acum_est := 0;
        VTotTrib_Fed     := 0;
        VTotTrib_Est     := 0;
        Icms_Total_remet := 0;
        Icms_Total_Dest  := 0;

        QItens.First;
        while not QItens.Eof do
        begin
          ProdutoSearch(QItens.FieldByName('PRODUTO_ID').AsInteger);

          with Det.Add do
          begin

            Prod.cProd   := QItens.FieldByName('PRODUTO_ID').AsString;
            Prod.nItem   := QItens.FieldByName('SEQUENCIA').AsInteger;

            if QProdutos.FieldByName('COD_BARRA').AsString <> '' then
            Prod.cEAN := StrZero(QProdutos.FieldByName('COD_BARRA').AsString, 13, 0)
            Else
            Prod.cEAN :='SEM GTIN';

            if LeIni(Arq_Ini, 'Sistema', 'Enviar Código EAN Nfe') = 'False' then
            Prod.cEAN :='SEM GTIN';

            //if LeIni(Arq_Ini, 'Sistema', 'Enviar Código EAN Nfe') = 'False' then
            //Prod.cEAN :='';

            Prod.xProd    := QItens.FieldByName('DESCRICAO').AsString;
            Prod.NCM      := QProdutos.FieldByName('NCM').AsString;
            Prod.CEST     := QProdutos.FieldByName('CEST').AsString;
            Prod.EXTIPI   := '';
            Prod.CFOP     := QItens.FieldByName('CFOP').AsString;
            Prod.uCom     := QProdutos.FieldByName('UNIDADE_VENDA').AsString;
            Prod.qCom     := QItens.FieldByName('QUANTIDADE').AsFloat;

           { IQuery.Sql.Clear;
            IQuery.Sql.Add('SELECT CAST(SUM((VR_UNITARIO - VR_DESCONTO) * QUANTIDADE) AS NUMERIC(15,2)) TOTAL, SUM(VR_TOTAL) VR_TOTAL FROM TRANSITENS');
            IQuery.Sql.Add('WHERE TRANSACAO_ID = :TRANSACAO_ID AND PRODUTO_ID = :PRODUTO_ID ');

            IQuery.ParamByName('TRANSACAO_ID').AsInteger := QTransacao.FieldByName('TRANSACAO_ID').AsInteger;
            IQuery.ParamByName('PRODUTO_ID').AsInteger   := QItens.FieldByName('PRODUTO_ID').AsInteger;


            IQuery.Prepare;
            IQuery.Open;

            if IQuery.FieldByName('TOTAL').AsFloat <> IQuery.FieldByName('VR_TOTAL').AsFloat then
            Prod.vUnCom   := RoundTo((QItens.FieldByName('VR_TOTAL').AsFloat / QItens.FieldByName('QUANTIDADE').AsFloat), -2)
            Else
            Prod.vUnCom   := QItens.FieldByName('VR_UNITARIO').AsFloat - QItens.FieldByName('VR_DESCONTO').AsFloat;}


            if QTransacao.FieldByName('SUB_SERIE').AsString = 'C' then
            Prod.vUnCom   := QItens.FieldByName('VR_UNITARIO').AsFloat
            Else
            Prod.vUnCom   := (QItens.FieldByName('VR_TOTAL').AsFloat / QItens.FieldByName('QUANTIDADE').AsFloat);

            Prod.vProd    := QItens.FieldByName('VR_TOTAL').AsFloat;


            if QProdutos.FieldByName('COD_BARRA').AsString <> '' then
            Prod.cEANTrib := StrZero(QProdutos.FieldByName('COD_BARRA').AsString, 13, 0)
            Else
            Prod.cEANTrib :='SEM GTIN';

            if LeIni(Arq_Ini, 'Sistema', 'Enviar Código EAN Nfe') = 'False' then
            Prod.cEANTrib :='SEM GTIN';

            IF QProdutos.FieldByName('UNIDADE_TRIB').AsString <> '' Then
            Prod.uTrib    := QProdutos.FieldByName('UNIDADE_TRIB').AsString
            Else
            Prod.uTrib    := QProdutos.FieldByName('UNIDADE_VENDA').AsString;

            Prod.qTrib    := QItens.FieldByName('QUANTIDADE').AsFloat;

            if QTransacao.FieldByName('SUB_SERIE').AsString = 'C' then
            Prod.vUnTrib  :=  QItens.FieldByName('QUANTIDADE').AsFloat
            Else
            Prod.vUnTrib  := (QItens.FieldByName('VR_TOTAL').AsFloat / QItens.FieldByName('QUANTIDADE').AsFloat);

            Prod.vFrete   := QItens.FieldByName('VR_FRETE').AsFloat;
            Prod.vSeg     := 0;
            Prod.vDesc    := QItens.FieldByName('DESC_RODAPE').AsFloat;
            Prod.vOutro   := QItens.FieldByName('VR_ACRESCIMO').AsFloat;


//            Prod.IndTot   :=
           //Dados para Importacao no item
           if (Insc_Dest = 'EXTERIOR') Then
           Begin
            IF (Insc_Dest = 'EXTERIOR') AND (QTransacao.FieldByName('CONDUTA').AsString = '02') then
            Begin
            QDetalhe_Import.Sql.Clear;
            QDetalhe_Import.Sql.Add('SELECT * FROM TRANSITENS_IMPORT');
            QDetalhe_Import.Sql.Add('WHERE');
            QDetalhe_Import.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
            QDetalhe_Import.Sql.Add('AND (PRODUTO_ID = :PRODUTO_ID)');

            QDetalhe_Import.ParamByName('TRANSACAO_ID').AsInteger := QTransacao.FieldByName('TRANSACAO_ID').AsInteger;
            QDetalhe_Import.ParamByName('PRODUTO_ID').AsInteger   := QItens.FieldByName('PRODUTO_ID').AsInteger;

            QDetalhe_Import.Prepare;
            QDetalhe_Import.Open;
            End
            Else  IF (Insc_Dest = 'EXTERIOR') AND (QTransacao.FieldByName('CONDUTA').AsString = '01') then
            Begin
            QDetalhe_Import.Sql.Clear;
            QDetalhe_Import.Sql.Add('SELECT * FROM TRANSITENS_EXPORT');
            QDetalhe_Import.Sql.Add('WHERE');
            QDetalhe_Import.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
            QDetalhe_Import.Sql.Add('AND (PRODUTO_ID = :PRODUTO_ID)');

            QDetalhe_Import.ParamByName('TRANSACAO_ID').AsInteger := QTransacao.FieldByName('TRANSACAO_ID').AsInteger;
            QDetalhe_Import.ParamByName('PRODUTO_ID').AsInteger   := QItens.FieldByName('PRODUTO_ID').AsInteger;

            QDetalhe_Import.Prepare;
            QDetalhe_Import.Open;

            End;

            QDetalhe_Import.First;

            while not QDetalhe_Import.Eof do
            begin
              if (Insc_Dest = 'EXTERIOR') AND (QTransacao.FieldByName('CONDUTA').AsString = '02') then
              Begin
                With Prod.Di.ADD Do
                Begin
                nDi         := QDetalhe_Import.FieldByName('N_DI').AsString;
                dDi         := QDetalhe_Import.FieldByName('DT_DI').AsDateTime;
                xLocDesemb  := QDetalhe_Import.FieldByName('LOC_DESEMB').AsString;
                UFDesemb    := QDetalhe_Import.FieldByName('UF_DESEMB').AsString;
                dDesemb     := QDetalhe_Import.FieldByName('DT_DESEMB').AsDateTime;
                cExportador := QDetalhe_Import.FieldByName('C_EXPORTADOR').AsString;

                with adi.Add do
                 begin
                   nAdicao     := 1;
                   nSeqAdi     := 1;
                   cFabricante := 'OUTROS';
                   vDescDI     := 0;
                 end;
                End;
              End
              Else  IF (Insc_Dest = 'EXTERIOR') AND (QTransacao.FieldByName('CONDUTA').AsString = '01') then
              Begin
                With Prod.Detexport.ADD Do
                Begin
                Nre     := QDetalhe_Import.FieldByName('N_DI').AsString;
                ChNfe   := QDetalhe_Import.FieldByName('C_EXPORTADOR').AsString; ;
                qExport := QItens.FieldByName('QUANTIDADE').AsFloat;
                End;
              End;
            Application.ProcessMessages;
            QDetalhe_Import.Next;
            end;
           End;

            if QTransacao.FieldByName('NUM_CHEQUE').AsString <> '' then
            Begin
            Prod.xPed     := QTransacao.FieldByName('NUM_CHEQUE').AsString;
            Prod.nItemPed := IntToStr(item * 10);
            End;


//            Prod.veicProd
//            Prod.med
//            Prod.arma

            Prod.comb.cProdANP       := QProdutos.FieldByName('COD_ANP').AsInteger;
            Prod.comb.descANP        := QProdutos.FieldByName('DESCRICAO').AsString;
            Prod.comb.CODIF          := QProdutos.FieldByName('CODIF').AsString;
            Prod.comb.UFcons         := QParceiro.FieldByName('ESTADO').AsString;
            Prod.comb.CIDE.qBCProd   := QProdutos.FieldByName('BC_CIDE').AsFloat;
            Prod.comb.CIDE.vAliqProd := QProdutos.FieldByName('ALIQ_CIDE').AsFloat;
            Prod.comb.CIDE.vCIDE     := QProdutos.FieldByName('CIDE').AsFloat;
            Prod.comb.pGLP           := 25.000;
            Prod.comb.pGNn           := 30.000;
            Prod.Comb.pGNi           := 45.000;
            Prod.Comb.vPart          := 50.000;

            QDetalhe.Sql.Clear;
            QDetalhe.Sql.Add('SELECT * FROM TRANSITENS_SERIE');
            QDetalhe.Sql.Add('WHERE');
            QDetalhe.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
            QDetalhe.Sql.Add('AND (PRODUTO_ID = :PRODUTO_ID)');

            QDetalhe.ParamByName('TRANSACAO_ID').AsInteger := QTransacao.FieldByName('TRANSACAO_ID').AsInteger;
            QDetalhe.ParamByName('PRODUTO_ID').AsInteger   := QItens.FieldByName('PRODUTO_ID').AsInteger;

            QDetalhe.Prepare;
            QDetalhe.Open;

            QDetalhe.First;
            while not QDetalhe.Eof do
            begin
              if infAdProd = '' then
                infAdProd := 'Nº de Série: ' + QDetalhe.FieldByName('NUM_SERIE').AsString
              else
                infAdProd := infAdProd + '; Nº de Série: ' + QDetalhe.FieldByName('NUM_SERIE').AsString;

              if QDetalhe.FieldByName('ADDPROD').AsString <> '' Then
              Begin
               infAdProd :='';
               infAdProd := QDetalhe.FieldByName('ADDPROD').AsString;
              End;

              Application.ProcessMessages;
              QDetalhe.Next;
            end;

            with Imposto do
            begin
              with ICMS do
              begin
                if QProdutos.FieldByName('ORIGEM').AsString = '0-NACIONAL' then
                  orig := oeNacional
                else if QProdutos.FieldByName('ORIGEM').AsString = '1-ESTRANGEIRA-IMPORTAÇÃO DIRETA' then
                  orig := oeEstrangeiraImportacaoDireta
                else if QProdutos.FieldByName('ORIGEM').AsString = '2-ESTRANGEIRA-ADQUIRIDA NO MERCADO INTER' then
                  orig := oeEstrangeiraAdquiridaBrasil
                else if QProdutos.FieldByName('ORIGEM').AsString = '3-NACIONAL- MERCADORIA OU BEM  COM CONT.' then
                  orig  := oeNacionalConteudoImportacaoSuperior40
                else if QProdutos.FieldByName('ORIGEM').AsString = '4-NACIONAL-DECRETO 288/67 E LEIS 8248/91' then
                  orig  := oeNacionalProcessosBasicos
                else if QProdutos.FieldByName('ORIGEM').AsString = '5-NACIONAL-CONTEUDO IMPORTÇÃO INFERIOR O' then
                  orig  := oeNacionalConteudoImportacaoInferiorIgual40
                else if QProdutos.FieldByName('ORIGEM').AsString = '6-ESTRANGEIRA-IMP. DIRETA SEM SIMILAR NA' then
                  orig  := oeEstrangeiraImportacaoDiretaSemSimilar
                else if QProdutos.FieldByName('ORIGEM').AsString = '7-ESTRANGEIRA-ADQ. MERCAD. INTERNO SEM S' then
                  orig  := oeEstrangeiraAdquiridaBrasilSemSimilar
                else if QProdutos.FieldByName('ORIGEM').AsString = '8-NACIONAL-CONTEUDO IMPORTÇÃO SUPERIOR A' then
                  orig  := oeNacionalConteudoImportacaoSuperior70;

               if FrmPrincipal.QEmpresa.FieldByName('CRT').AsString = '1 - SIMPLES NACIONAL' then
               Begin

                if QItens.FieldByName('CST').AsString = '101' then
                  CSOSN := csosn101
                else if QItens.FieldByName('CST').AsString = '102' then
                  CSOSN := csosn102
                else if QItens.FieldByName('CST').AsString = '103' then
                  CSOSN := csosn103
                else if QItens.FieldByName('CST').AsString = '201' then
                  CSOSN := csosn201
                else if QItens.FieldByName('CST').AsString = '202' then
                  CSOSN := csosn202
                else if QItens.FieldByName('CST').AsString = '203' then
                  CSOSN := csosn203
                else if QItens.FieldByName('CST').AsString = '300' then
                  CSOSN := csosn300
                else if QItens.FieldByName('CST').AsString = '400' then
                  CSOSN := csosn400
                else if QItens.FieldByName('CST').AsString = '500' then
                  CSOSN := csosn500
                else if QItens.FieldByName('CST').AsString = '900' then
                  CSOSN := csosn900
                else
                  CSOSN := csosnVazio;

               End
               Else
               Begin
                if QProdutos.FieldByName('CSOSN').AsString = '101' then
                  CSOSN := csosn101
                else if QProdutos.FieldByName('CSOSN').AsString = '102' then
                  CSOSN := csosn102
                else if QProdutos.FieldByName('CSOSN').AsString = '103' then
                  CSOSN := csosn103
                else if QProdutos.FieldByName('CSOSN').AsString = '201' then
                  CSOSN := csosn201
                else if QProdutos.FieldByName('CSOSN').AsString = '202' then
                  CSOSN := csosn202
                else if QProdutos.FieldByName('CSOSN').AsString = '203' then
                  CSOSN := csosn203
                else if QProdutos.FieldByName('CSOSN').AsString = '300' then
                  CSOSN := csosn300
                else if QProdutos.FieldByName('CSOSN').AsString = '400' then
                  CSOSN := csosn400
                else if QProdutos.FieldByName('CSOSN').AsString = '500' then
                  CSOSN := csosn500
                else if QProdutos.FieldByName('CSOSN').AsString = '900' then
                  CSOSN := csosn900
                else
                  CSOSN := csosnVazio;

               End;


                if Copy(QItens.FieldByName('CST').AsString, 2, 2) = '00' then
                begin
                  CST := cst00;
                  {if ((QTransacao.FieldByName('CONDUTA').AsString = '02') and (QTransacao.FieldByName('DEPTO').AsString = '10')) or ((QTransacao.FieldByName('CONDUTA').AsString = '01') and (QTransacao.FieldByName('DEPTO').AsString = '07')) then
                  Begin
                  if (FrmPrincipal.QEmpresa.FieldByName('CRT').AsString = '1 - SIMPLES NACIONAL')
                     AND  (QParceiro.FieldByName('TIPO_CLIENTE').AsString = 'PESSOA FÍSICA')  then
                  CSOSN := csosn102
                  ELSE if (FrmPrincipal.QEmpresa.FieldByName('CRT').AsString = '1 - SIMPLES NACIONAL')
                     AND  (QParceiro.FieldByName('TIPO_CLIENTE').AsString = 'PESSOA JURÍDICA')  then
                  CSOSN := csosn101;
                  End
                  Else
                  Begin
                  if (FrmPrincipal.QEmpresa.FieldByName('CRT').AsString = '1 - SIMPLES NACIONAL')
                     AND  (QParceiro.FieldByName('TIPO_FORNECEDOR').AsString = 'PESSOA FÍSICA')  then
                  CSOSN := csosn102
                  ELSE if (FrmPrincipal.QEmpresa.FieldByName('CRT').AsString = '1 - SIMPLES NACIONAL')
                     AND  (QParceiro.FieldByName('TIPO_FORNECEDOR').AsString = 'PESSOA JURÍDICA')  then
                  CSOSN := csosn101;
                  End; }

                  if QProdutos.FieldByName('MOD_ICMS').AsString = 'MVA' then
                    modBC  := dbiMargemValorAgregado
                  else if QProdutos.FieldByName('MOD_ICMS').AsString = 'PAUTA' then
                    modBC  := dbiPauta
                  else if QProdutos.FieldByName('MOD_ICMS').AsString = 'PR. TABELADO' then
                    modBC  := dbiPrecoTabelado
                  else if QProdutos.FieldByName('MOD_ICMS').AsString = 'VALOR DA OPERAÇÃO' then
                    modBC  := dbiValorOperacao
                  else
                    modBC  := dbiValorOperacao;

                  vBC    := QItens.FieldByName('BASE_CALC_ICMS').AsFloat;
                  pICMS  := QItens.FieldByName('ALIQUOTA_ICMS').AsFloat;
                  vICMS  := QItens.FieldByName('VALOR_ICMS').AsFloat;

                  if QItens.FieldByName('VR_REDUCAO_BC').AsFloat > 0 then
                    pRedBC := SimpleRoundTo((QItens.FieldByName('VR_REDUCAO_BC').AsFloat * 100) / (QItens.FieldByName('VR_TOTAL').AsFloat) , -2);

                  if QItens.FieldByName('BASE_CALC_ICMS').AsFloat > 0 then
                    vBC := QItens.FieldByName('BASE_CALC_ICMS').AsFloat;

                  if QItens.FieldByName('ALIQUOTA_ICMS').AsFloat > 0 then
                    pICMS := QItens.FieldByName('ALIQUOTA_ICMS').AsFloat;

                  if QItens.FieldByName('VALOR_ICMS').AsFloat > 0 then
                    vICMS := QItens.FieldByName('VALOR_ICMS').AsFloat;
                end
                else if Copy(QItens.FieldByName('CST').AsString, 2, 2) = '10' then
                begin
                  CST := cst10;

                  if QProdutos.FieldByName('MOD_ICMS').AsString = 'MVA' then
                    modBC  := dbiMargemValorAgregado
                  else if QProdutos.FieldByName('MOD_ICMS').AsString = 'PAUTA' then
                    modBC  := dbiPauta
                  else if QProdutos.FieldByName('MOD_ICMS').AsString = 'PR. TABELADO' then
                    modBC  := dbiPrecoTabelado
                  else if QProdutos.FieldByName('MOD_ICMS').AsString = 'VALOR DA OPERACAO' then
                    modBC  := dbiValorOperacao
                  else
                    modBC  := dbiValorOperacao;

                  vBC   := QItens.FieldByName('BASE_CALC_ICMS').AsFloat;
                  pICMS := QItens.FieldByName('ALIQUOTA_ICMS').AsFloat;
                  vICMS := QItens.FieldByName('VALOR_ICMS').AsFloat;

                  if QProdutos.FieldByName('MOD_ICMS_ST').AsString = 'PR. TABELADO' then
                    modBCST := dbisPrecoTabelado
                  else if QProdutos.FieldByName('MOD_ICMS_ST').AsString = 'LISTA NEGATIVA' then
                    modBCST := dbisListaNegativa
                  else if QProdutos.FieldByName('MOD_ICMS_ST').AsString = 'LISTA POSITIVA' then
                    modBCST := dbisListaPositiva
                  else if QProdutos.FieldByName('MOD_ICMS_ST').AsString = 'LISTA NEUTRA' then
                    modBCST := dbisListaNeutra
                  else if QProdutos.FieldByName('MOD_ICMS_ST').AsString = 'MVA' then
                    modBCST := dbisMargemValorAgregado
                  else if QProdutos.FieldByName('MOD_ICMS_ST').AsString = 'PAUTA' then
                    modBCST := dbisPauta
                  else
                    modBCST := dbisMargemValorAgregado;

                  pMVAST   := QItens.FieldByName('MVA').AsFloat;
                  pRedBCST := SimpleRoundTo((QItens.FieldByName('VR_REDUCAO_BC').AsFloat * 100) / (QItens.FieldByName('VR_TOTAL').AsFloat),-2);
                  vBCST    := QItens.FieldByName('BASE_CALC_ST').AsFloat;
                  pICMSST  := QItens.FieldByName('ALIQUOTA_ST').AsFloat;
                  vICMSST  := QItens.FieldByName('VALOR_ICMS_ST').AsFloat;
                end
                else if Copy(QItens.FieldByName('CST').AsString, 2, 2) = '20' then
                begin
                  CST := cst20;
                 {if ((QTransacao.FieldByName('CONDUTA').AsString = '02') and (QTransacao.FieldByName('DEPTO').AsString = '10')) or ((QTransacao.FieldByName('CONDUTA').AsString = '01') and (QTransacao.FieldByName('DEPTO').AsString = '07')) then
                 Begin
                  if (FrmPrincipal.QEmpresa.FieldByName('CRT').AsString = '1 - SIMPLES NACIONAL')
                     AND  (QParceiro.FieldByName('TIPO_CLIENTE').AsString = 'PESSOA FÍSICA')  then
                  CSOSN := csosn102
                  ELSE if (FrmPrincipal.QEmpresa.FieldByName('CRT').AsString = '1 - SIMPLES NACIONAL')
                     AND  (QParceiro.FieldByName('TIPO_CLIENTE').AsString = 'PESSOA JURÍDICA')  then
                  CSOSN := csosn101;
                 End
                 Else
                 Begin
                  if (FrmPrincipal.QEmpresa.FieldByName('CRT').AsString = '1 - SIMPLES NACIONAL')
                     AND  (QParceiro.FieldByName('TIPO_FORNECEDOR').AsString = 'PESSOA FÍSICA')  then
                  CSOSN := csosn102
                  ELSE if (FrmPrincipal.QEmpresa.FieldByName('CRT').AsString = '1 - SIMPLES NACIONAL')
                     AND  (QParceiro.FieldByName('TIPO_FORNECEDOR').AsString = 'PESSOA JURÍDICA')  then
                  CSOSN := csosn101;
                 End;}

                  if QProdutos.FieldByName('MOD_ICMS').AsString = 'MVA' then
                    modBC  := dbiMargemValorAgregado
                  else if QProdutos.FieldByName('MOD_ICMS').AsString = 'PAUTA' then
                    modBC  := dbiPauta
                  else if QProdutos.FieldByName('MOD_ICMS').AsString = 'PR. TABELADO' then
                    modBC  := dbiPrecoTabelado
                  else if QProdutos.FieldByName('MOD_ICMS').AsString = 'VALOR DA OPERACAO' then
                    modBC  := dbiValorOperacao
                  else
                    modBC  := dbiValorOperacao;

                    pRedBC  := SimpleRoundTo((QItens.FieldByName('VR_REDUCAO_BC').AsFloat * 100) / (QItens.FieldByName('VR_TOTAL').AsFloat),-2);
   // alteracao da linha anterior a pedido de comercial bras nao enviar pRedBc
   // descomentado a linha a pedido da Arilmaq 15/08/13

                  vBC     := QItens.FieldByName('BASE_CALC_ICMS').AsFloat;
                  pICMS   := QItens.FieldByName('ALIQUOTA_ICMS').AsFloat;
                  vICMS   := QItens.FieldByName('VALOR_ICMS').AsFloat;

                  if QItens.FieldByName('VR_REDUCAO_BC').AsFloat > 0 then
                    //pRedBC := QItens.FieldByName('VR_REDUCAO_BC').AsFloat;
                      pRedBC := SimpleRoundTo((QItens.FieldByName('VR_REDUCAO_BC').AsFloat * 100) / (QItens.FieldByName('VR_TOTAL').AsFloat),-2);
// alteracao da linha anterior a pedido de comercial bras nao enviar pRedBc percentual e sim valor
// descomentado a linha a pedido da Arilmaq 15/08/13 para enviar percentual e nao valor

                  if QItens.FieldByName('BASE_CALC_ICMS').AsFloat > 0 then
                    vBC := QItens.FieldByName('BASE_CALC_ICMS').AsFloat;

                  if QItens.FieldByName('ALIQUOTA_ICMS').AsFloat > 0 then
                    pICMS := QItens.FieldByName('ALIQUOTA_ICMS').AsFloat;

                  if QItens.FieldByName('VALOR_ICMS').AsFloat > 0 then
                    vICMS := QItens.FieldByName('VALOR_ICMS').AsFloat;
                end
                else if Copy(QItens.FieldByName('CST').AsString, 2, 2) = '30' then
                begin
                  CST := cst30;

                  if QProdutos.FieldByName('MOD_ICMS_ST').AsString = 'PR. TABELADO' then
                    modBCST := dbisPrecoTabelado
                  else if QProdutos.FieldByName('MOD_ICMS_ST').AsString = 'LISTA NEGATIVA' then
                    modBCST := dbisListaNegativa
                  else if QProdutos.FieldByName('MOD_ICMS_ST').AsString = 'LISTA POSITIVA' then
                    modBCST := dbisListaPositiva
                  else if QProdutos.FieldByName('MOD_ICMS_ST').AsString = 'LISTA NEUTRA' then
                    modBCST := dbisListaNeutra
                  else if QProdutos.FieldByName('MOD_ICMS_ST').AsString = 'MVA' then
                    modBCST := dbisMargemValorAgregado
                  else if QProdutos.FieldByName('MOD_ICMS_ST').AsString = 'PAUTA' then
                    modBCST := dbisPauta
                  else
                    modBCST := dbisMargemValorAgregado;

                  pMVAST   := QItens.FieldByName('MVA').AsFloat;
                  pRedBCST := SimpleRoundTo((QItens.FieldByName('VR_REDUCAO_BC').AsFloat * 100) / (QItens.FieldByName('VR_TOTAL').AsFloat),-2);
                  vBCST    := QItens.FieldByName('BASE_CALC_ST').AsFloat;
                  pICMSST  := QItens.FieldByName('ALIQUOTA_ST').AsFloat;
                  vICMSST  := QItens.FieldByName('VALOR_ICMS_ST').AsFloat;

                  if QItens.FieldByName('VR_REDUCAO_BC').AsFloat > 0 then
                    pRedBC := SimpleRoundTo((QItens.FieldByName('VR_REDUCAO_BC').AsFloat * 100) / (QItens.FieldByName('VR_TOTAL').AsFloat),-2);

                  if QItens.FieldByName('BASE_CALC_ICMS').AsFloat > 0 then
                    vBC := QItens.FieldByName('BASE_CALC_ICMS').AsFloat;

                  if QItens.FieldByName('ALIQUOTA_ICMS').AsFloat > 0 then
                    pICMS := QItens.FieldByName('ALIQUOTA_ICMS').AsFloat;

                  if QItens.FieldByName('VALOR_ICMS').AsFloat > 0 then
                    vICMS := QItens.FieldByName('VALOR_ICMS').AsFloat;
                end
                else if (Copy(QItens.FieldByName('CST').AsString, 2, 2) = '40') or (Copy(QItens.FieldByName('CST').AsString, 2, 2) = '41') or (Copy(QItens.FieldByName('CST').AsString, 2, 2) = '50') then
                begin
                  if Copy(QItens.FieldByName('CST').AsString, 2, 2) = '40' then
                    CST := cst40
                  else if Copy(QItens.FieldByName('CST').AsString, 2, 2) = '41' then
                    CST := cst41
                  else if Copy(QItens.FieldByName('CST').AsString, 2, 2) = '50' then
                    CST := cst50;

                  vICMS := QItens.FieldByName('VALOR_ICMS').AsFloat;
                  // motDesICMS :=

                    pRedBC := SimpleRoundTo((QItens.FieldByName('VR_REDUCAO_BC').AsFloat * 100) / (QItens.FieldByName('VR_TOTAL').AsFloat),-2);
                  if QItens.FieldByName('VR_REDUCAO_BC').AsFloat > 0 then

                  if QItens.FieldByName('BASE_CALC_ICMS').AsFloat > 0 then
                    vBC := QItens.FieldByName('BASE_CALC_ICMS').AsFloat;

                  if QItens.FieldByName('ALIQUOTA_ICMS').AsFloat > 0 then
                    pICMS := QItens.FieldByName('ALIQUOTA_ICMS').AsFloat;

                  if QItens.FieldByName('VALOR_ICMS').AsFloat > 0 then
                    vICMS := QItens.FieldByName('VALOR_ICMS').AsFloat;
                end
                else if Copy(QItens.FieldByName('CST').AsString, 2, 2) = '51' then
                begin
                  CST := cst51;

                  if QProdutos.FieldByName('MOD_ICMS').AsString = 'MVA' then
                    modBC  := dbiMargemValorAgregado
                  else if QProdutos.FieldByName('MOD_ICMS').AsString = 'PAUTA' then
                    modBC  := dbiPauta
                  else if QProdutos.FieldByName('MOD_ICMS').AsString = 'PR. TABELADO' then
                    modBC  := dbiPrecoTabelado
                  else if QProdutos.FieldByName('MOD_ICMS').AsString = 'VALOR DA OPERACAO' then
                    modBC  := dbiValorOperacao
                  else
                    modBC  := dbiValorOperacao;

                  pRedBC := SimpleRoundTo((QItens.FieldByName('VR_REDUCAO_BC').AsFloat * 100) / (QItens.FieldByName('VR_TOTAL').AsFloat),-2);
                  vBC    := QItens.FieldByName('BASE_CALC_ICMS').AsFloat;
                  pICMS  := QItens.FieldByName('ALIQUOTA_ICMS').AsFloat;
                  vICMS  := QItens.FieldByName('VALOR_ICMS').AsFloat;

                  if QItens.FieldByName('VR_REDUCAO_BC').AsFloat > 0 then
                    pRedBC := SimpleRoundTo((QItens.FieldByName('VR_REDUCAO_BC').AsFloat * 100) / (QItens.FieldByName('VR_TOTAL').AsFloat),-2);

                  if QItens.FieldByName('BASE_CALC_ICMS').AsFloat > 0 then
                    vBC := QItens.FieldByName('BASE_CALC_ICMS').AsFloat;

                  if QItens.FieldByName('ALIQUOTA_ICMS').AsFloat > 0 then
                    pICMS := QItens.FieldByName('ALIQUOTA_ICMS').AsFloat;

                  if QItens.FieldByName('VALOR_ICMS').AsFloat > 0 then
                    vICMS := QItens.FieldByName('VALOR_ICMS').AsFloat;
                end
                else if Copy(QItens.FieldByName('CST').AsString, 2, 2) = '60' then
                begin
                  CST        := cst60;

                  if QProdutos.FieldByName('COD_ANP').AsInteger > 0 Then
                  Begin
                   CST         := cstRep60;
                   vBCSTRet    := QItens.FieldByName('BASE_CALC_ST').AsFloat;
                   vICMSSTRet  := QItens.FieldByName('VALOR_ICMS_ST').AsFloat;
                   vBCSTDest   := QItens.FieldByName('BASE_CALC_ST').AsFloat;
                   vICMSSTDest := QItens.FieldByName('VALOR_ICMS_ST').AsFloat;
                  End;

                  if QItens.FieldByName('VR_REDUCAO_BC').AsFloat > 0 then
                    pRedBC := SimpleRoundTo((QItens.FieldByName('VR_REDUCAO_BC').AsFloat * 100) / (QItens.FieldByName('VR_TOTAL').AsFloat),-2);

                  if QItens.FieldByName('BASE_CALC_ICMS').AsFloat > 0 then
                    vBC := QItens.FieldByName('BASE_CALC_ICMS').AsFloat;

                  if QItens.FieldByName('ALIQUOTA_ICMS').AsFloat > 0 then
                    pICMS := QItens.FieldByName('ALIQUOTA_ICMS').AsFloat;

                  if QItens.FieldByName('VALOR_ICMS').AsFloat > 0 then
                    vICMS := QItens.FieldByName('VALOR_ICMS').AsFloat;
                end
                else if Copy(QItens.FieldByName('CST').AsString, 2, 2) = '70' then
                begin
                  CST := cst70;

                  if QProdutos.FieldByName('MOD_ICMS').AsString = 'MVA' then
                    modBC  := dbiMargemValorAgregado
                  else if QProdutos.FieldByName('MOD_ICMS').AsString = 'PAUTA' then
                    modBC  := dbiPauta
                  else if QProdutos.FieldByName('MOD_ICMS').AsString = 'PR. TABELADO' then
                    modBC  := dbiPrecoTabelado
                  else if QProdutos.FieldByName('MOD_ICMS').AsString = 'VALOR DA OPERACAO' then
                    modBC  := dbiValorOperacao
                  else
                    modBC  := dbiValorOperacao;

                    pRedBC := SimpleRoundTo((QItens.FieldByName('VR_REDUCAO_BC').AsFloat * 100) / (QItens.FieldByName('VR_TOTAL').AsFloat),-2);
// alteracao da linha anterior a pedido de comercial bras nao enviar pRedBc percentual e sim valor
// descomentado a linha a pedido da Arilmaq 15/08/13 para enviar percentual e nao valor


                  vBC    := QItens.FieldByName('BASE_CALC_ICMS').AsFloat;
                  pICMS  := QItens.FieldByName('ALIQUOTA_ICMS').AsFloat;
                  vICMS  := QItens.FieldByName('VALOR_ICMS').AsFloat;

                  if QProdutos.FieldByName('MOD_ICMS_ST').AsString = 'PR. TABELADO' then
                    modBCST := dbisPrecoTabelado
                  else if QProdutos.FieldByName('MOD_ICMS_ST').AsString = 'LISTA NEGATIVA' then
                    modBCST := dbisListaNegativa
                  else if QProdutos.FieldByName('MOD_ICMS_ST').AsString = 'LISTA POSITIVA' then
                    modBCST := dbisListaPositiva
                  else if QProdutos.FieldByName('MOD_ICMS_ST').AsString = 'LISTA NEUTRA' then
                    modBCST := dbisListaNeutra
                  else if QProdutos.FieldByName('MOD_ICMS_ST').AsString = 'MVA' then
                    modBCST := dbisMargemValorAgregado
                  else if QProdutos.FieldByName('MOD_ICMS_ST').AsString = 'PAUTA' then
                    modBCST := dbisPauta
                  else
                    modBCST := dbisMargemValorAgregado;

                  pMVAST   := QItens.FieldByName('MVA').AsFloat;
                  pRedBCST := SimpleRoundTo((QItens.FieldByName('VR_REDUCAO_BC').AsFloat * 100) / (QItens.FieldByName('VR_TOTAL').AsFloat),-2);
                  vBCST    := QItens.FieldByName('BASE_CALC_ST').AsFloat;
                  pICMSST  := QItens.FieldByName('ALIQUOTA_ST').AsFloat;
                  vICMSST  := QItens.FieldByName('VALOR_ICMS_ST').AsFloat;

                  if QItens.FieldByName('VR_REDUCAO_BC').AsFloat > 0 then
//                    pRedBC := QItens.FieldByName('VR_REDUCAO_BC').AsFloat;
                      pRedBC := SimpleRoundTo((QItens.FieldByName('VR_REDUCAO_BC').AsFloat * 100) / (QItens.FieldByName('VR_TOTAL').AsFloat),-2);
// alteracao da linha anterior a pedido de comercial bras nao enviar pRedBc percentual e sim valor
                   // descomentado a linha a pedido da Arilmaq 15/08/13 para enviar percentual e nao valor

                end
                else if Copy(QItens.FieldByName('CST').AsString, 2, 2) = '90' then
                begin
                  CST := cst90;

                  {if ((QTransacao.FieldByName('CONDUTA').AsString = '02') and (QTransacao.FieldByName('DEPTO').AsString = '10')) or ((QTransacao.FieldByName('CONDUTA').AsString = '01') and (QTransacao.FieldByName('DEPTO').AsString = '07')) then
                  bEGIN
                   if (FrmPrincipal.QEmpresa.FieldByName('CRT').AsString = '1 - SIMPLES NACIONAL')
                     AND  (QParceiro.FieldByName('TIPO_CLIENTE').AsString = 'PESSOA FÍSICA')  then
                   CSOSN := csosn102
                   ELSE if (FrmPrincipal.QEmpresa.FieldByName('CRT').AsString = '1 - SIMPLES NACIONAL')
                     AND  (QParceiro.FieldByName('TIPO_CLIENTE').AsString = 'PESSOA JURÍDICA')  then
                   CSOSN := csosn101;
                  end
                  Else
                  Begin
                   if (FrmPrincipal.QEmpresa.FieldByName('CRT').AsString = '1 - SIMPLES NACIONAL')
                     AND  (QParceiro.FieldByName('TIPO_FORNECEDOR').AsString = 'PESSOA FÍSICA')  then
                   CSOSN := csosn102
                   ELSE if (FrmPrincipal.QEmpresa.FieldByName('CRT').AsString = '1 - SIMPLES NACIONAL')
                     AND  (QParceiro.FieldByName('TIPO_FORNECEDOR').AsString = 'PESSOA JURÍDICA')  then
                   CSOSN := csosn101;

                  End; }

                  if QProdutos.FieldByName('MOD_ICMS').AsString = 'MVA' then
                    modBC  := dbiMargemValorAgregado
                  else if QProdutos.FieldByName('MOD_ICMS').AsString = 'PAUTA' then
                    modBC  := dbiPauta
                  else if QProdutos.FieldByName('MOD_ICMS').AsString = 'PR. TABELADO' then
                    modBC  := dbiPrecoTabelado
                  else if QProdutos.FieldByName('MOD_ICMS').AsString = 'VALOR DA OPERACAO' then
                    modBC  := dbiValorOperacao
                  else
                    modBC  := dbiValorOperacao;

                  vBC     := QItens.FieldByName('BASE_CALC_ICMS').AsFloat;
                  pRedBC  := SimpleRoundTo((QItens.FieldByName('VR_REDUCAO_BC').AsFloat * 100) / (QItens.FieldByName('VR_TOTAL').AsFloat),-2);
                  pICMS   := QItens.FieldByName('ALIQUOTA_ICMS').AsFloat;
                  vICMS   := QItens.FieldByName('VALOR_ICMS').AsFloat;

                  if QProdutos.FieldByName('MOD_ICMS_ST').AsString = 'PR. TABELADO' then
                    modBCST := dbisPrecoTabelado
                  else if QProdutos.FieldByName('MOD_ICMS_ST').AsString = 'LISTA NEGATIVA' then
                    modBCST := dbisListaNegativa
                  else if QProdutos.FieldByName('MOD_ICMS_ST').AsString = 'LISTA POSITIVA' then
                    modBCST := dbisListaPositiva
                  else if QProdutos.FieldByName('MOD_ICMS_ST').AsString = 'LISTA NEUTRA' then
                    modBCST := dbisListaNeutra
                  else if QProdutos.FieldByName('MOD_ICMS_ST').AsString = 'MVA' then
                    modBCST := dbisMargemValorAgregado
                  else if QProdutos.FieldByName('MOD_ICMS_ST').AsString = 'PAUTA' then
                    modBCST := dbisPauta
                  else
                    modBCST := dbisMargemValorAgregado;

                  pMVAST   := QItens.FieldByName('MVA').AsFloat;
                  pRedBCST := SimpleRoundTo((QItens.FieldByName('VR_REDUCAO_BC').AsFloat * 100) / (QItens.FieldByName('VR_TOTAL').AsFloat),-2);
                  vBCST    := QItens.FieldByName('BASE_CALC_ST').AsFloat;
                  pICMSST  := QItens.FieldByName('ALIQUOTA_ST').AsFloat;
                  vICMSST  := QItens.FieldByName('VALOR_ICMS_ST').AsFloat;
                end;


              End;


              if (QItens.FieldByName('VR_IPI').AsFloat > 0) then
              begin

                // IPI.clEnq    :=
                // IPI.CNPJProd :=
                // IPI.cSelo    :=
                // IPI.qSelo    :=
                // IPI.cEnq     :=

                if QItens.FieldByName('CST_IPI').AsString = '00' then
                  IPI.CST := ipi00
                else if QItens.FieldByName('CST_IPI').AsString = '01' then
                  IPI.CST := ipi01
                else if QItens.FieldByName('CST_IPI').AsString = '02' then
                  IPI.CST := ipi02
                else if QItens.FieldByName('CST_IPI').AsString = '03' then
                  IPI.CST := ipi03
                else if QItens.FieldByName('CST_IPI').AsString = '04' then
                  IPI.CST := ipi04
                else if QItens.FieldByName('CST_IPI').AsString = '05' then
                  IPI.CST := ipi05
                else if QItens.FieldByName('CST_IPI').AsString = '49' then
                  IPI.CST := ipi49
                else if QItens.FieldByName('CST_IPI').AsString = '50' then
                  IPI.CST := ipi50
                else if QItens.FieldByName('CST_IPI').AsString = '51' then
                  IPI.CST := ipi51
                else if QItens.FieldByName('CST_IPI').AsString = '52' then
                  IPI.CST := ipi52
                else if QItens.FieldByName('CST_IPI').AsString = '53' then
                  IPI.CST := ipi53
                else if QItens.FieldByName('CST_IPI').AsString = '54' then
                  IPI.CST := ipi54
                else if QItens.FieldByName('CST_IPI').AsString = '55' then
                  IPI.CST := ipi55
                else if QItens.FieldByName('CST_IPI').AsString = '99' then
                  IPI.CST := ipi99;

                // IPI.vBC      := QItens.FieldByName('VR_TOTAL').AsFloat;
                // IPI.qUnid    :=
                // IPI.vUnid    :=

                IPI.pIPI     := ((QItens.FieldByName('VR_IPI').AsFloat * 100) / QItens.FieldByName('VR_TOTAL').AsFloat);
                IPI.vIPI     := QItens.FieldByName('VR_IPI').AsFloat;
              end
              Else
              Begin
                if  (NOT QDetalhe_Import.IsEmpty)  then
                Begin
                 IPI.CST  := ipi99;
                 IPI.pIPI := 0.001;
                 IPI.vIPI := 0.001;
                End;
              End;


             if FrmPrincipal.QEmpresa.FieldByName('CRT').AsString <> '1 - SIMPLES NACIONAL' then
             Begin

              if QItens.FieldByName('CST_PIS').AsString = '01' then
                PIS.CST := pis01
              else if QItens.FieldByName('CST_PIS').AsString = '02' then
                PIS.CST := pis02
              else if QItens.FieldByName('CST_PIS').AsString = '03' then
                PIS.CST := pis03
              else if QItens.FieldByName('CST_PIS').AsString = '04' then
                PIS.CST := pis04
              else if QItens.FieldByName('CST_PIS').AsString = '05' then
                PIS.CST := pis05
              else if QItens.FieldByName('CST_PIS').AsString = '06' then
                PIS.CST := pis06
              else if QItens.FieldByName('CST_PIS').AsString = '07' then
                PIS.CST := pis07
              else if QItens.FieldByName('CST_PIS').AsString = '08' then
                PIS.CST := pis08
              else if QItens.FieldByName('CST_PIS').AsString = '09' then
                PIS.CST := pis09
              else if QItens.FieldByName('CST_PIS').AsString = '49' then
                PIS.CST := pis49
              else if QItens.FieldByName('CST_PIS').AsString = '50' then
                PIS.CST := pis50
              else if QItens.FieldByName('CST_PIS').AsString = '51' then
                PIS.CST := pis51
              else if QItens.FieldByName('CST_PIS').AsString = '52' then
                PIS.CST := pis52
              else if QItens.FieldByName('CST_PIS').AsString = '53' then
                PIS.CST := pis53
              else if QItens.FieldByName('CST_PIS').AsString = '54' then
                PIS.CST := pis54
              else if QItens.FieldByName('CST_PIS').AsString = '55' then
                PIS.CST := pis55
              else if QItens.FieldByName('CST_PIS').AsString = '56' then
                PIS.CST := pis56
              else if QItens.FieldByName('CST_PIS').AsString = '60' then
                PIS.CST := pis60
              else if QItens.FieldByName('CST_PIS').AsString = '61' then
                PIS.CST := pis61
              else if QItens.FieldByName('CST_PIS').AsString = '62' then
                PIS.CST := pis62
              else if QItens.FieldByName('CST_PIS').AsString = '63' then
                PIS.CST := pis63
              else if QItens.FieldByName('CST_PIS').AsString = '64' then
                PIS.CST := pis64
              else if QItens.FieldByName('CST_PIS').AsString = '65' then
                PIS.CST := pis65
              else if QItens.FieldByName('CST_PIS').AsString = '66' then
                PIS.CST := pis66
              else if QItens.FieldByName('CST_PIS').AsString = '67' then
                PIS.CST := pis67
              else if QItens.FieldByName('CST_PIS').AsString = '70' then
                PIS.CST := pis70
              else if QItens.FieldByName('CST_PIS').AsString = '71' then
                PIS.CST := pis71
              else if QItens.FieldByName('CST_PIS').AsString = '72' then
                PIS.CST := pis72
              else if QItens.FieldByName('CST_PIS').AsString = '73' then
                PIS.CST := pis73
              else if QItens.FieldByName('CST_PIS').AsString = '74' then
                PIS.CST := pis74
              else if QItens.FieldByName('CST_PIS').AsString = '75' then
                PIS.CST := pis75
              else if QItens.FieldByName('CST_PIS').AsString = '98' then
                PIS.CST := pis98
              else if QItens.FieldByName('CST_PIS').AsString = '99' then
                PIS.CST := pis99;

              PIS.vBC       := QItens.FieldByName('BASE_CALC_PIS').AsFloat;
              PIS.pPis      := QItens.FieldByName('ALIQUOTA_PIS').AsFloat;
              PIS.vPIS      := QItens.FieldByName('VR_PIS').AsFloat;
              PIS.qBCProd   := QItens.FieldByName('BASE_CALC_PIS').AsFloat;
              PIS.vAliqProd := QItens.FieldByName('ALIQUOTA_PIS').AsFloat;
              PIS.qBCProd   := 0;

              if QItens.FieldByName('CST_COFINS').AsString = '01' then
                COFINS.CST := cof01
              else if QItens.FieldByName('CST_COFINS').AsString = '02' then
                COFINS.CST := cof02
              else if QItens.FieldByName('CST_COFINS').AsString = '03' then
                COFINS.CST := cof03
              else if QItens.FieldByName('CST_COFINS').AsString = '04' then
                COFINS.CST := cof04
              else if QItens.FieldByName('CST_COFINS').AsString = '05' then
                COFINS.CST := cof05
              else if QItens.FieldByName('CST_COFINS').AsString = '06' then
                COFINS.CST := cof06
              else if QItens.FieldByName('CST_COFINS').AsString = '07' then
                COFINS.CST := cof07
              else if QItens.FieldByName('CST_COFINS').AsString = '08' then
                COFINS.CST := cof08
              else if QItens.FieldByName('CST_COFINS').AsString = '09' then
                COFINS.CST := cof09
              else if QItens.FieldByName('CST_COFINS').AsString = '49' then
                COFINS.CST := cof49
              else if QItens.FieldByName('CST_COFINS').AsString = '50' then
                COFINS.CST := cof50
              else if QItens.FieldByName('CST_COFINS').AsString = '51' then
                COFINS.CST := cof51
              else if QItens.FieldByName('CST_COFINS').AsString = '52' then
                COFINS.CST := cof52
              else if QItens.FieldByName('CST_COFINS').AsString = '53' then
                COFINS.CST := cof53
              else if QItens.FieldByName('CST_COFINS').AsString = '54' then
                COFINS.CST := cof54
              else if QItens.FieldByName('CST_COFINS').AsString = '55' then
                COFINS.CST := cof55
              else if QItens.FieldByName('CST_COFINS').AsString = '56' then
                COFINS.CST := cof56
              else if QItens.FieldByName('CST_COFINS').AsString = '60' then
                COFINS.CST := cof60
              else if QItens.FieldByName('CST_COFINS').AsString = '61' then
                COFINS.CST := cof61
              else if QItens.FieldByName('CST_COFINS').AsString = '62' then
                COFINS.CST := cof62
              else if QItens.FieldByName('CST_COFINS').AsString = '63' then
                COFINS.CST := cof63
              else if QItens.FieldByName('CST_COFINS').AsString = '64' then
                COFINS.CST := cof64
              else if QItens.FieldByName('CST_COFINS').AsString = '65' then
                COFINS.CST := cof65
              else if QItens.FieldByName('CST_COFINS').AsString = '66' then
                COFINS.CST := cof66
              else if QItens.FieldByName('CST_COFINS').AsString = '67' then
                COFINS.CST := cof67
              else if QItens.FieldByName('CST_COFINS').AsString = '70' then
                COFINS.CST := cof70
              else if QItens.FieldByName('CST_COFINS').AsString = '71' then
                COFINS.CST := cof71
              else if QItens.FieldByName('CST_COFINS').AsString = '72' then
                COFINS.CST := cof72
              else if QItens.FieldByName('CST_COFINS').AsString = '73' then
                COFINS.CST := cof73
              else if QItens.FieldByName('CST_COFINS').AsString = '74' then
                COFINS.CST := cof74
              else if QItens.FieldByName('CST_COFINS').AsString = '75' then
                COFINS.CST := cof75
              else if QItens.FieldByName('CST_COFINS').AsString = '98' then
                COFINS.CST := cof98
              else if QItens.FieldByName('CST_COFINS').AsString = '99' then
                COFINS.CST := cof99;

              COFINS.vBC       := QItens.FieldByName('BASE_CALC_COFINS').AsFloat;
              COFINS.pCOFINS   := QItens.FieldByName('ALIQUOTA_COFINS').AsFloat;
              COFINS.vCOFINS   := QItens.FieldByName('VR_COFINS').AsFloat;
              COFINS.vBCProd   := QItens.FieldByName('BASE_CALC_COFINS').AsFloat;
              COFINS.vAliqProd := QItens.FieldByName('ALIQUOTA_COFINS').AsFloat;
              COFINS.qBCProd   := 0;


             End;

              //Configuração DIFAL


              if ((Ide.idDest = doInterestadual) or (Ide.idDest = doExterior)) and (Dest.indIEDest = inNaoContribuinte) and (Ide.indFinal <> cfConsumidorFinal)   then
              Begin
               QDetalhe.SQL.Clear;
               QDetalhe.SQL.Add('SELECT * FROM ESTADOS WHERE UF = :UF');
               QDetalhe.ParamByName('UF').AsString := QParceiro.FieldByName('ESTADO').AsString;
               QDetalhe.Prepare;
               QDetalhe.Open;

               Aliq_Int_Dest := QDetalhe.FieldByName('ICMS').AsFloat;
               Aliq_Fcp      := QDetalhe.FieldByName('ALIQ_FCP').AsFloat;
               Part_Uf_Dest  := QDetalhe.FieldByName('ICMS_PARTILHA').AsFloat;

               QDetalhe.SQL.Clear;
               QDetalhe.SQL.Add('SELECT * FROM ESTADOS WHERE UF = :UF');
               QDetalhe.ParamByName('UF').AsString := FrmPrincipal.QEmpresa.FieldByName('ESTADO').AsString;
               QDetalhe.Prepare;
               QDetalhe.Open;

               Aliq_int      := QDetalhe.FieldByName('ICMS').AsFloat;
               Part_Uf_Orig  := QDetalhe.FieldByName('ICMS_PARTILHA').AsFloat;

               if (Ide.idDest = doExterior) then
               Begin
               Aliq_Int_Dest := 0.00;
               Aliq_Fcp      := 0.00;
               Part_Uf_Dest  := 0.00;
               Aliq_int      := 4.00;
               Part_Uf_Orig  := 0.00;
               End;

               With ICMSUFDest do
               begin

                pFCPufdest     := Aliq_Fcp;
                pIcmsufdest    := Aliq_Int_Dest;
                pIcmsInter     := Aliq_int;
                PIcmsInterPart := Part_Uf_Dest;

                vBCUFDest    := (Qitens.FieldByName('BASE_CALC_ICMS').AsFloat /((100 - ( Aliq_int +  Aliq_Fcp) ) /100));
                vFCPUFDEST   := ((vBCUFDest * Aliq_Fcp) /100);

                Icms_Orig := ((vBCUFDest * Aliq_int) /100);
                Icms_Dest := ((vBCUFDest * Aliq_Int_Dest) /100);

                if Icms_Orig > Icms_Dest  then
                Difal :=  Icms_Orig -  Icms_Dest
                Else
                Difal := Icms_Dest - Icms_Orig;

                vicmsufremet := (difal * Part_Uf_Orig) /100;
                VicmsufDest  := (difal * Part_Uf_Dest) /100;

                Icms_Total_remet :=  SimpleRoundTo(vicmsufremet + Icms_Total_remet, -2);
                Icms_Total_Dest  :=  SimpleRoundTo(VicmsufDest + Icms_Total_Dest, -2);
               end;
              End;

                // NOVO CAMPO PARA TOTALIZACAO DOS TRIBUTOS



             if (FORMA_EMISSAO.Text = 'NORMAL')  then
             Begin
              if (QProdutos.FieldByName('ORIGEM').AsString) = '0-NACIONAL' then
              Begin


               VTotTrib_Fed := SimpleRoundTo(((QItens.FieldByName('VR_TOTAL').AsFloat -
                            QItens.FieldByName('DESC_RODAPE').AsFloat) *
                            (QProdutos.FieldByName('ALIQNAC').AsFloat ) / 100),-2);

               VTotTrib_Est := SimpleRoundTo(((QItens.FieldByName('VR_TOTAL').AsFloat -
                            QItens.FieldByName('DESC_RODAPE').AsFloat) *
                            (QProdutos.FieldByName('ALIQEST').AsFloat ) / 100),-2);


               End
               Else
               Begin
               VTotTrib := SimpleRoundTo(((QItens.FieldByName('VR_TOTAL').AsFloat -
                             QItens.FieldByName('DESC_RODAPE').AsFloat) *
                             (QProdutos.FieldByName('ALIQIMP').AsFloat ) / 100),-2);
               End;


              if (VTotTrib_fed > 0) or (VTotTrib_Est > 0) then
                 infAdProd := 'Trib. aprox. : ' + 'R$'+ FloatToStrF(VTotTrib_Fed,ffNumber,4,2)+ ' Federal, ' +  'R$'+
                 FloatToStrF(VTotTrib_Est,ffNumber,4,2) + ' Estadual ' + ' Fonte: IBPT/FECOMERCIO ('+FrmPrincipal.QEmpresa.FieldByname('ESTADO').AsString +') Xe67Eq' + #13 + #10 + infAdProd;

                 VTotTrib := SimpleRoundTo( VTotTrib_Fed + VTotTrib_Est,-2 );
                 Vr_trib_acum := VTotTrib + Vr_trib_acum;

                 Vr_trib_acum_Fed := SimpleRoundTo(Vr_trib_acum_Fed + VTotTrib_Fed,-2);
                 Vr_trib_acum_Est := SimpleRoundTo(Vr_trib_acum_Est + VTotTrib_Est,-2);

             End;
            end;
          end;

          Inc(Item);

          Application.ProcessMessages;
          QItens.Next;

        end;


        if COND_PAGTO.ItemIndex = 1 then
        begin
          Cobr.Fat.nFat  := StrZero(NO_DOC_FISCAL.Text, 9, 0);
          Cobr.Fat.vOrig := QTransacao.FieldByName('VALOR').AsFloat;
          //Cobr.Fat.vDesc := 0.00;
          Cobr.Fat.vLiq  := QTransacao.FieldByName('VALOR').AsFloat;



          QParcelas.Sql.Clear;
          QParcelas.Sql.Add('SELECT * FROM TRANSPARCELAS');
          QParcelas.Sql.Add('WHERE');
          QParcelas.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
          QParcelas.Sql.Add('AND (TIPO_TRANSACAO = :TIPO_TRANSACAO) ORDER BY DT_VENCIMENTO ');

          QParcelas.ParamByName('TRANSACAO_ID').AsInteger  := ID;
          QParcelas.ParamByName('TIPO_TRANSACAO').AsString := 'T';

          QParcelas.Prepare;
          QParcelas.Open;
          Qt_Parc := 1;

         while not QParcelas.Eof do
          begin
            with Cobr.Dup.Add do
             begin
               nDup  := Strzero(IntToStr(Qt_parc),3,0);//StrZero(NO_DOC_FISCAL.Text, 9, 0) + '/' + Copy(QParcelas.FieldByName('PARCELA_ID').AsString,1,2);
               dVenc := QParcelas.FieldByName('DT_VENCIMENTO').AsDateTime;
               vDup  := QParcelas.FieldByName('VALOR').AsFloat;
             end;

             Application.ProcessMessages;
             Qt_parc := Qt_parc + 1 ;
             QParcelas.Next;
          end;
        end;



        InfAdic.infCpl := Instrucoes.Lines.Text + ' ' + Instrucoes_2.Lines.Text;

        if QParceiro.FieldByName('COD_PAIS').AsString <> '01058' then
        begin
          exporta.UFembarq    := UF_EMBARQUE.Text;
          exporta.xLocEmbarq  := LOCAL_EMBARQUE.Text;
          Exporta.UFSaidaPais := UF_EMBARQUE.Text;
          Exporta.xLocExporta := LOCAL_EMBARQUE.Text;
        end;

        if RESP_FRETE.ItemIndex = 0 then
          Transp.modFrete := mfContaEmitente
        else if RESP_FRETE.ItemIndex = 1 then
          Transp.modFrete := mfContaDestinatario
        else if RESP_FRETE.ItemIndex = 2 then
          Transp.modFrete := mfContaTerceiros
        else if RESP_FRETE.ItemIndex = 3 then
          Transp.modFrete := mfSemFrete
        else
          Transp.modFrete := mfSemFrete;

        Transp.Transporta.CNPJCPF := CNPJ_TRANSPORTADOR.Text;
        Transp.Transporta.xNome   := NOME_TRANSPORTADOR.Text;
        Transp.Transporta.IE      := INSCRICAO_TRANSPORTADOR.Text;
        Transp.Transporta.xEnder  := ENDERECO_TRANSPORTADOR.Text;
        Transp.Transporta.xMun    := MUNICIPIO_TRANSPORTADOR.Text;
        Transp.Transporta.UF      := UF_TRANSPORTADOR.Text;

       //Nao aceito na nfe 4.0

       if (FrmPrincipal.QEmpresa.FieldByName('IBGE').AsString = QParceiro.FieldByName('IBGE').AsString) Then
       Begin
        Transp.veicTransp.placa   := PLACA_VEICULO.Text;
        Transp.veicTransp.UF      := UF_VEICULO.Text;
        Transp.veicTransp.RNTC    := RNTC.Text;
       End;


        if QUANTIDADE_VOLUMES.Value > 0 then
        begin
          with Transp.Vol.Add do
          begin
            qVol  := StrToInt(QUANTIDADE_VOLUMES.Text);
            esp   := ESPECIE_VOLUMES.Text;
            marca := MARCA_VOLUMES.Text;
            nVol  := NUMERO_VOLUMES.Text;
            pesoL := PESO_LIQUIDO.Value;
            pesoB := PESO_BRUTO.Value;
          end;
        end;

        Total.ICMSTot.vBC     := QTransacao.FieldByName('BASE_ICMS_NORMAL').AsFloat;
        Total.ICMSTot.vICMS   := QTransacao.FieldByName('VR_ICMS_NORMAL').AsFloat;
        Total.ICMSTot.vBCST   := QTransacao.FieldByName('BASE_ICMS_ST').AsFloat;
        Total.ICMSTot.vST     := QTransacao.FieldByName('VR_ICMS_ST').AsFloat;
        Total.ICMSTot.vProd   := QTransacao.FieldByName('VALOR_PRODUTOS').AsFloat;
        Total.ICMSTot.vFrete  := QTransacao.FieldByName('VR_FRETE').AsFloat;
        Total.ICMSTot.vSeg    := 0;
        Total.ICMSTot.vDesc   := QTransacao.FieldByName('VR_DESCONTO').AsFloat;
        Total.ICMSTot.vII     := 0;
        Total.ICMSTot.vIPI    := QTransacao.FieldByName('VR_IPI').AsFloat;

        if FrmPrincipal.QEmpresa.FieldByName('CRT').AsString <> '1 - SIMPLES NACIONAL' then
        Begin
        Total.ICMSTot.vPIS    := QTransacao.FieldByName('VR_PIS').AsFloat;
        Total.ICMSTot.vCOFINS := QTransacao.FieldByName('VR_COFINS').AsFloat;
        End;

        Total.ICMSTot.vOutro  := QTransacao.FieldByName('VR_ACRESCIMO').AsFloat;
        Total.ICMSTot.vNF     := QTransacao.FieldByName('VALOR').AsFloat;
        Total.ICMSTot.vICMSUFDest  := Icms_Total_dest;
        Total.ICMSTot.vICMSUFRemet := Icms_Total_Remet;

        //NOVO CAMPO PARA TOTALIZACAO DOS TRIBUTOS

        if  (VTotTrib_fed > 0) or (VTotTrib_Est > 0) then
        Begin
           Total.IcmsTot.vTotTrib := Vr_trib_acum;

           InfAdic.infCpl := 'Trib. aprox. Tot. : ' + 'R$'+ FloatToStr(Vr_trib_acum_fed)+ ' Federal, ' +  'R$'+
               FloatToStr(Vr_trib_acum_est) + 'Estadual' + ' Fonte: IBPT/FECOMERCIO ('+ FrmPrincipal.QEmpresa.FieldByname('ESTADO').AsString +') Xe67Eq' + #13 + #10 + InfAdic.infCpl;
        End;

      end;


      if not GeraXML then
      begin
        if FrmPrincipal.ACBrNFe1.Enviar(0, True) then
        begin
          IQuery.Sql.Clear;
          IQuery.Sql.Add('UPDATE TRANSACOES SET NUM_DOC = :NUM_DOC, CHAVE_NFE = :CHAVE_NFE');
          IQuery.Sql.Add('WHERE');
          IQuery.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

          IQuery.ParamByName('NUM_DOC').AsString       := StrZero(NO_DOC_FISCAL.Text, 9, 0);
          IQuery.ParamByName('TRANSACAO_ID').AsInteger := ID;
         // IQuery.ParamByName('HISTORICO').AsString     := QTransacao.FieldByName('HISTORICO').AsString  + StrZero(NO_DOC_FISCAL.Text, 9, 0);
          IQuery.ParamByName('CHAVE_NFE').AsString     := FrmPrincipal.ACBrNFe1.WebServices.Retorno.ChaveNFe;

          IQuery.Prepare;
          IQuery.ExecSql;



          IQuery.Sql.Clear;
          IQuery.Sql.Add('UPDATE COMPL_NFISCAL SET RECIBO = :RECIBO, PROTOCOLO = :PROTOCOLO, CHAVE_NFE = :CHAVE_NFE');
          IQuery.Sql.Add('WHERE');
          IQuery.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

          IQuery.ParamByName('RECIBO').AsString        := FrmPrincipal.ACBrNFe1.WebServices.Retorno.Recibo;
          IQuery.ParamByName('PROTOCOLO').AsString     := FrmPrincipal.ACBrNFe1.WebServices.Retorno.Protocolo;
          IQuery.ParamByName('CHAVE_NFE').AsString     := FrmPrincipal.ACBrNFe1.WebServices.Retorno.ChaveNFe;
          IQuery.ParamByName('TRANSACAO_ID').AsInteger := ID;

          IQuery.Prepare;
          IQuery.ExecSql;



          try
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

              //FrmPrincipal.ACBrNFe1.NotasFiscais.Items[0].EnviarEmail(edtSmtpHost, edtSmtpPort, edtSmtpUser, edtSmtpPass, edtSmtpUser, QParceiro.FieldByName('EMAIL').AsString, edtEmailAssunto, FrmPrincipal.MemoResp.Lines, cbEmailSSL);

              FrmPrincipal.MemoResp.Lines.Clear;
            end;
          except
            Application.MessageBox('Não foi possível enviar o email', PChar(Msg_Title), mb_IconInformation);
          end;

          ShowMessage('Nº do Protocolo: ' + FrmPrincipal.ACBrNFe1.WebServices.Retorno.Protocolo);
          ShowMessage('Nº do Recibo: ' + FrmPrincipal.ACBrNFe1.WebServices.Retorno.Recibo);
        end
        else
        begin
          IQuery.Sql.Clear;
          IQuery.Sql.Add('DELETE FROM COMPL_NFISCAL');
          IQuery.Sql.Add('WHERE');
          IQuery.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

          IQuery.ParamByName('TRANSACAO_ID').AsInteger := ID;

          IQuery.Prepare;
          IQuery.ExecSql;



          if FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger = 1 then
          Begin
          IQuery.Sql.Clear;
          IQuery.Sql.Add('SET GENERATOR GEN_NFISCAL TO ' + IntToStr(StrToInt(NO_DOC_FISCAL.Text) - 1));

          IQuery.Prepare;
          IQuery.ExecSql;


          End;

          if FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger = 2 then
          Begin
          IQuery.Sql.Clear;
          IQuery.Sql.Add('SET GENERATOR GEN_NFISCAL02 TO ' + IntToStr(StrToInt(NO_DOC_FISCAL.Text) - 1));

          IQuery.Prepare;
          IQuery.ExecSql;


          End;

          if FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger = 3 then
          Begin
          IQuery.Sql.Clear;
          IQuery.Sql.Add('SET GENERATOR GEN_NFISCAL03 TO ' + IntToStr(StrToInt(NO_DOC_FISCAL.Text) - 1));

          IQuery.Prepare;
          IQuery.ExecSql;


          End;

          if FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger = 4 then
          Begin
          IQuery.Sql.Clear;
          IQuery.Sql.Add('SET GENERATOR GEN_NFISCAL04 TO ' + IntToStr(StrToInt(NO_DOC_FISCAL.Text) - 1));

          IQuery.Prepare;
          IQuery.ExecSql;


          End;

          if FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger = 5 then
          Begin
          IQuery.Sql.Clear;
          IQuery.Sql.Add('SET GENERATOR GEN_NFISCAL05 TO ' + IntToStr(StrToInt(NO_DOC_FISCAL.Text) - 1));

          IQuery.Prepare;
          IQuery.ExecSql;


          End;

          Application.MessageBox('Não foi possível enviar a NFe', PChar(Msg_Title), mb_IconInformation);
          Close;
        end;
      end
      else
      begin

        FrmPrincipal.ACBrNFe1.NotasFiscais.Assinar;
        FrmPrincipal.ACBrNFe1.NotasFiscais.Items[0].GravarXML();
        Application.MessageBox(PChar('Arquivo gerado em: ' + FrmPrincipal.ACBrNFe1.NotasFiscais.Items[0].NomeArq), PChar(Msg_Title), mb_IconInformation);

        FrmPrincipal.ACBrNFe1.NotasFiscais.LoadFromFile(FrmPrincipal.ACBrNFe1.Configuracoes.Arquivos.GetPathNFe + '\' + Copy(FrmPrincipal.ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID, 4, 44)+'-nfe.xml');
        FrmPrincipal.ACBrNFe1.Consultar;
        FrmPrincipal.ACBrNFe1.NotasFiscais.Imprimir;

        if FrmPrincipal.ACBrNFe1.WebServices.Consulta.Protocolo <> '' then
        Begin
          ShowMessage('Nº do Protocolo: ' + FrmPrincipal.ACBrNFe1.WebServices.Consulta.Protocolo);
          ShowMessage('Data da Nota: ' + DateToStr(FrmPrincipal.ACBrNFe1.WebServices.Consulta.DhRecbto));


          IQuery.Sql.Clear;
          IQuery.Sql.Add('UPDATE COMPL_NFISCAL SET CHAVE_NFE = :CHAVE_NFE, RECIBO = :RECIBO, PROTOCOLO = :PROTOCOLO');
          IQuery.Sql.Add('WHERE');
          IQuery.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

          IQuery.ParamByName('CHAVE_NFE').AsString     := Copy(FrmPrincipal.ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID, 4, 44);
          IQuery.ParamByName('RECIBO').AsString        := '3' + DateToStr(FrmPrincipal.ACBrNFe1.WebServices.Consulta.DhRecbto);
          IQuery.ParamByName('PROTOCOLO').AsString     := FrmPrincipal.ACBrNFe1.WebServices.Consulta.Protocolo;

          IQuery.ParamByName('TRANSACAO_ID').AsInteger := ID;

          IQuery.Prepare;
          IQuery.ExecSql;


                                                 

         // FrmPrincipal.ACBrNFe1.NotasFiscais.Imprimir;
        End
        Else
        Begin
        Application.MessageBox('Nfe não consta na base de dados do Sefaz ou não pode ser efetuada!', PChar(Msg_Title), mb_IconInformation);
        Close;
        End;



        if (QTransacao.FieldByName('COND_PAGTO').AsString = 'A PRAZO') and (StrZero(QTransacao.FieldByName('NUM_DOC').AsString, 6, 0) = '000000') then
        begin
          IQuery.Sql.Clear;
          IQuery.Sql.Add('UPDATE TRANSPARCELAS SET TIPO_TRANSACAO = :TIPO_TRANSACAO');
          IQuery.Sql.Add('WHERE');
          IQuery.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

          IQuery.ParamByName('TIPO_TRANSACAO').AsString := 'U';
          IQuery.ParamByName('TRANSACAO_ID').AsInteger  := QTransacao.FieldByName('TRANSACAO_ID').AsInteger;

          IQuery.Prepare;
          IQuery.ExecSql;


        end;

        if StrZero(QTransacao.FieldByName('NUM_DOC').AsString, 9, 0) = '000000000' then
        begin
          IQuery.Sql.Clear;
          IQuery.Sql.Add('UPDATE TRANSACOES SET NUM_DOC = :NUM_DOC, CHAVE_NFE = :CHAVE_NFE');
          IQuery.Sql.Add('WHERE');
          IQuery.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

          IQuery.ParamByName('NUM_DOC').AsString       := StrZero(NO_DOC_FISCAL.Text, 9, 0);
          IQuery.ParamByName('TRANSACAO_ID').AsInteger := ID;
         // IQuery.ParamByName('HISTORICO').AsString     := Copy(QTransacao.FieldByName('HISTORICO').AsString, 1,17)  + StrZero(NO_DOC_FISCAL.Text, 9, 0);
          IQuery.ParamByName('CHAVE_NFE').AsString     := FrmPrincipal.ACBrNFe1.WebServices.Retorno.ChaveNFe;

          IQuery.Prepare;
          IQuery.ExecSql;



        end;

        if (QTransacao.FieldByName('COND_PAGTO').AsString = 'A PRAZO') and (StrZero(QTransacao.FieldByName('NUM_DOC').AsString, 6, 0) = '000000') then
        begin
          IQuery.Sql.Clear;
          IQuery.Sql.Add('UPDATE TRANSPARCELAS SET TIPO_TRANSACAO = :TIPO_TRANSACAO');
          IQuery.Sql.Add('WHERE');
          IQuery.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

          IQuery.ParamByName('TIPO_TRANSACAO').AsString := 'T';
          IQuery.ParamByName('TRANSACAO_ID').AsInteger  := QTransacao.FieldByName('TRANSACAO_ID').AsInteger;

          IQuery.Prepare;
          IQuery.ExecSql;


        end;
      end;
    finally
      btnGera.Enabled    := True;
      btnRetorna.Enabled := True;
    end;

    Close;
  end;
end;

procedure TFrmAltera_NFe.CFOP_COMPLExit(Sender: TObject);
begin
  DetailSearch('CFOP');
end;

procedure TFrmAltera_NFe.CNPJ_TRANSPORTADORKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmAltera_NFe.DT_SAIDAEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmAltera_NFe.DT_SAIDAKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = CFOP_COMPL) then
    CFOP_COMPL.Text := GetConsulta_CFOP(CFOP_COMPL.Text);

  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmAltera_NFe.FormCreate(Sender: TObject);
begin
  GeraXML := True;
end;

procedure TFrmAltera_NFe.FormShow(Sender: TObject);
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

  if QTransacao.FieldByName('SAIDA_ID').AsInteger <> 0 then
  Begin
  QOrigem.Sql.Clear;
  QOrigem.Sql.Add('SELECT * FROM TRANSACOES');
  QOrigem.Sql.Add('WHERE');
  QOrigem.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

  QOrigem.ParamByName('TRANSACAO_ID').AsInteger := QTransacao.FieldByName('SAIDA_ID').AsInteger;

  QOrigem.Prepare;
  QOrigem.Open;
  End;

  if QTransacao.FieldByName('ENTRADA_ID').AsInteger <> 0 then
  Begin
  QOrigem.Sql.Clear;
  QOrigem.Sql.Add('SELECT * FROM TRANSACOES');
  QOrigem.Sql.Add('WHERE');
  QOrigem.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

  QOrigem.ParamByName('TRANSACAO_ID').AsInteger := QTransacao.FieldByName('ENTRADA_ID').AsInteger;

  QOrigem.Prepare;
  QOrigem.Open;
  End;

  if (not QOrigem.IsEmpty) then
  Begin
  Finalidade_Emissao.Clear;
  Finalidade_Emissao.Items.Add('1-NFE NORMAL');
  Finalidade_Emissao.Items.Add('4-DEVOLUÇÃO/RETORNO');
  Finalidade_Emissao.ItemIndex := 0;
  End;


  QTabela.Sql.Clear;
  QTabela.Sql.Add('SELECT * FROM COMPL_NFISCAL');
  QTabela.Sql.Add('WHERE');
  QTabela.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

  QTabela.ParamByName('TRANSACAO_ID').AsInteger := ID;

  QTabela.Prepare;
  QTabela.Open;

  if QTransacao.FieldByName('COND_PAGTO').AsString = 'A VISTA' then
    COND_PAGTO.ItemIndex := 0
  else
    COND_PAGTO.ItemIndex := 1;

  if QTabela.IsEmpty then
  begin
    Set_Campos(True);

    UF_VEICULO.Text          := '  ';
    UF_TRANSPORTADOR.Text    := '  ';
    DT_SAIDA.Date            := date;
    HR_SAIDA.Text            := Copy(TimeToStr(time), 1, 8);
    TRANSACAO_ID.Value       := ID;
    NO_DOC_FISCAL.Value      := 0;
    QUANTIDADE_VOLUMES.Value := QTransacao.FieldByName('UNIDADES').AsFloat;
    ESPECIE_VOLUMES.Text     := 'CAIXA';
    Empresa_id.Value         := FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger;

    QItens.Sql.Clear;
    QItens.Sql.Add('SELECT * FROM TRANSITENS');
    QItens.Sql.Add('WHERE');
    QItens.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

    QItens.ParamByName('TRANSACAO_ID').AsInteger := ID;

    QItens.Prepare;
    QItens.Open;

    PESO_BRUTO.Value   := 0;
    PESO_LIQUIDO.Value := 0;

    QItens.First;
    while not QItens.Eof do
    begin
      ProdutoSearch(QItens.FieldByName('PRODUTO_ID').AsInteger);

      PESO_BRUTO.Value   := PESO_BRUTO.Value + (QProdutos.FieldByName('PESO').AsFloat * QItens.FieldByName('QUANTIDADE').AsFloat);
      PESO_LIQUIDO.Value := PESO_LIQUIDO.Value + (QProdutos.FieldByName('PESO_UNITARIO').AsFloat * QItens.FieldByName('QUANTIDADE').AsFloat);

      Application.ProcessMessages;
      QItens.Next;
    end;
  end
  else
    Set_Campos(False);

  if INSTRUCOES.Lines.Text = '' then
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

    if FrmPrincipal.QEmpresa.FieldByName('CRT').AsString =  '1 - SIMPLES NACIONAL' then
      INSTRUCOES.Lines.Add('PERMITE O APROVEITAMENTO DO CRÉDITO DE ICMS NO VALOR DE R$ ' + FormatFloat('#,##0.00', (QTransacao.FieldByName('VALOR').AsFloat * FrmPrincipal.Config.FieldByName('ALIQ_SIMPLES').AsFloat) / 100) +
                           ' CORRESPONDENTE À ALÍQUOTA DE ' + FormatFloat('#,##0.00', FrmPrincipal.Config.FieldByName('ALIQ_SIMPLES').AsFloat) + '%, NOS TERMOS DO ART. 23 DA LC 123/2006');
  end;

  CFOP_COMPL.Text      := Cod_CFOP;
  Resp_Frete.ItemIndex := 3;
end;

procedure TFrmAltera_NFe.GerarXMLClick(Sender: TObject);
begin
  btnGeraClick(Sender);
end;

end.
