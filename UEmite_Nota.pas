unit UEmite_Nota;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DBCtrls, rxCurrEdit, Mask, rxToolEdit, DB,
  IBCustomDataSet, IBQuery, Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrmEmite_Nota = class(TForm)
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
    btnExecuta: TButton;
    DT_SAIDA: TDateEdit;
    HR_SAIDA: TMaskEdit;
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
    Imprimir_Emitente: TCheckBox;
    btnRetorna: TBitBtn;
    Empresa_id: TCurrencyEdit;
    IQuery: TFDQuery;
    QTabela: TFDQuery;
    QCfop: TFDQuery;
    QProdutos: TFDQuery;
    QParceiro: TFDQuery;
    QNatOper: TFDQuery;
    QTransacao: TFDQuery;
    QItens: TFDQuery;
    QConfig_Nfiscal: TFDQuery;
    procedure DT_SAIDAKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CNPJ_TRANSPORTADORKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnExecutaClick(Sender: TObject);
    procedure CFOP_COMPLExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RESP_FRETEClick(Sender: TObject);
    procedure DT_SAIDAEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Search_Campo(Txt: String): Integer;
    procedure ProdutoSearch(ID: Integer);
    function Validacao: Boolean;
    procedure DetailSearch(Tabela: String);
    procedure Set_Campos(Vazio: Boolean);
    procedure Insert;
  end;

var
  FrmEmite_Nota: TFrmEmite_Nota;
  ID: Integer;
  procedure Nota_Fiscal(Transacao_Id: Integer);

implementation

uses
  UPrincipal, UData;

{$R *.dfm}

procedure TFrmEmite_Nota.Set_Campos(Vazio: Boolean);
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

procedure TFrmEmite_Nota.Insert;
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

end;

function TFrmEmite_Nota.Validacao: Boolean;
begin
  Result := False;

  CFOP_COMPL.Color         := clWindow;
  CNPJ_Transportador.Color := clWindow;
  UF_VEICULO.Color         := clWindow;
  UF_TRANSPORTADOR.Color   := clWindow;

  if (QCfop.IsEmpty) and (CFOP_COMPL.Text <> '') then
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

  if not ChecaEstado(UF_VEICULO.Text) then
  begin
    Application.MessageBox('Estado inválido', PChar(Msg_Title), mb_IconStop);
    UF_VEICULO.Color := clYellow;
    UF_VEICULO.SetFocus;
    exit;
  end;

  if not ChecaEstado(UF_TRANSPORTADOR.Text) then
  begin
    Application.MessageBox('Estado inválido', PChar(Msg_Title), mb_IconStop);
    UF_TRANSPORTADOR.Color := clYellow;
    UF_TRANSPORTADOR.SetFocus;
    exit;
  end;

  Result := True;
end;

procedure TFrmEmite_Nota.DetailSearch(Tabela: String);
begin
  if ((Tabela = '') or (Tabela = 'CFOP')) and (CFOP_COMPL.Text <> '') then
  begin
    QCfop.Close;
    QCfop.ParamByName('COD_CFOP').AsString := CFOP_COMPL.Text;
    QCfop.Prepare;
    QCfop.Open;
  end;
end;

function TFrmEmite_Nota.Search_Campo(Txt: String): Integer;
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

procedure Nota_Fiscal(Transacao_Id: Integer);
begin
  ID := Transacao_Id;
  Application.CreateForm(TFrmEmite_Nota, FrmEmite_Nota);
  try
    FrmEmite_Nota.ShowModal;
  finally
    FrmEmite_Nota.Release;
  end;
end;

procedure TFrmEmite_Nota.ProdutoSearch(ID: Integer);
begin
  QProdutos.Sql.Clear;
  QProdutos.Sql.Add('SELECT * FROM PRODUTOS');
  QProdutos.Sql.Add('WHERE');
  QProdutos.Sql.Add('(PRODUTO_ID = :PRODUTO_ID)');

  if StrToInt(LeIni(Arq_Ini, 'Sistema', 'Localização')) > 0 then
  begin
    QProdutos.Sql.Add('AND (LOCALIZACAO_ID = :LOCALIZACAO_ID)');

    QProdutos.ParamByName('LOCALIZACAO_ID').AsInteger := StrToInt(LeIni(Arq_Ini, 'Sistema', 'Localização'));
  end;

  QProdutos.ParamByName('PRODUTO_ID').AsInteger := ID;

  QProdutos.Prepare;
  QProdutos.Open;
end;

procedure TFrmEmite_Nota.RESP_FRETEClick(Sender: TObject);
begin
  if RESP_FRETE.ItemIndex = 0 then
  begin
    IQuery.Sql.Clear;
    IQuery.Sql.Add('SELECT * FROM EMPRESAS');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(EMPRESA_ID = :EMPRESA_ID)');
    IQuery.ParamByName('EMPRESA_ID').AsInteger := QTransacao.FieldByName('EMPRESA_ID').AsInteger;
    IQuery.Prepare;
    IQuery.Open;

    NOME_TRANSPORTADOR.Text := IQuery.FieldByName('RAZAO').AsString;
    CNPJ_TRANSPORTADOR.Text := SemMascara(IQuery.FieldByName('CNPJ').AsString);
    ENDERECO_TRANSPORTADOR.Text := IQuery.FieldByName('ENDERECO').AsString;
    MUNICIPIO_TRANSPORTADOR.Text := IQuery.FieldByName('MUNICIPIO').AsString;
    UF_TRANSPORTADOR.Text := IQuery.FieldByName('ESTADO').AsString;
    INSCRICAO_TRANSPORTADOR.Text := IQuery.FieldByName('INSCR_ESTADUAL').AsString;
  end;

  if RESP_FRETE.ItemIndex = 1 then
  begin
    if (QTransacao.FieldByName('CONDUTA').AsString = '01') and (QTransacao.FieldByName('DEPTO').AsString = '07') then
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

    if (QTransacao.FieldByName('CONDUTA').AsString = '01') and (QTransacao.FieldByName('DEPTO').AsString = '10') then
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

    if (QTransacao.FieldByName('CONDUTA').AsString = '20') and (QTransacao.FieldByName('DEPTO').AsString = '07') then
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

procedure TFrmEmite_Nota.btnExecutaClick(Sender: TObject);
var
MyFile: TextFile;
PG, Lin_Stru, Quantidade_Itens, Itens, X, Records: Integer;
Vr_Nota: Real;
begin
  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    DetailSearch('');

    if Validacao then
    begin
      if NO_DOC_FISCAL.Value > 0 then
      begin
        if Application.MessageBox(PChar('Esta nota já foi emitida com o número ' + StrZero(NO_DOC_FISCAL.Text, 9, 0) + '. Deseja cancelar e emitir novamente?'), PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = IDYES then
        begin
          IQuery.Sql.Clear;
          IQuery.Sql.Add('INSERT INTO NOTAS_CANCELADAS(TRANSACAO_ID,EMPRESA_ID, NO_DOC_FISCAL, DT_SAIDA, HR_SAIDA, CFOP_COMPL, RESP_FRETE, NOME_TRANSPORTADOR, CNPJ_TRANSPORTADOR, ' +
                         'PLACA_VEICULO, ENDERECO_TRANSPORTADOR, MUNICIPIO_TRANSPORTADOR, UF_TRANSPORTADOR, INSCRICAO_TRANSPORTADOR, QUANTIDADE_VOLUMES, ESPECIE_VOLUMES, ' +
                         'MARCA_VOLUMES, NUMERO_VOLUMES, PESO_BRUTO, PESO_LIQUIDO, INSTRUCOES, RECIBO, PROTOCOLO, CHAVE_NFE)');
          IQuery.Sql.Add('SELECT TRANSACAO_ID,EMPRESA_ID, NO_DOC_FISCAL, DT_SAIDA, HR_SAIDA, CFOP_COMPL, RESP_FRETE, NOME_TRANSPORTADOR, CNPJ_TRANSPORTADOR, ' +
                         'PLACA_VEICULO, ENDERECO_TRANSPORTADOR, MUNICIPIO_TRANSPORTADOR, UF_TRANSPORTADOR, INSCRICAO_TRANSPORTADOR, QUANTIDADE_VOLUMES, ESPECIE_VOLUMES, ' +
                         'MARCA_VOLUMES, NUMERO_VOLUMES, PESO_BRUTO, PESO_LIQUIDO, INSTRUCOES, RECIBO, PROTOCOLO, CHAVE_NFE');

          IQuery.Sql.Add('FROM COMPL_NFISCAL');
          IQuery.Sql.Add('WHERE');
          IQuery.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

          IQuery.ParamByName('TRANSACAO_ID').AsInteger := ID;

          IQuery.Prepare;
          IQuery.ExecSql;


          IQuery.Sql.Clear;
          IQuery.Sql.Add('DELETE FROM COMPL_NFISCAL');
          IQuery.Sql.Add('WHERE');
          IQuery.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

          IQuery.ParamByName('TRANSACAO_ID').AsInteger := ID;

          IQuery.Prepare;
          IQuery.ExecSql;


          NO_DOC_FISCAL.Value := 0;
        end
        else
          abort;
      end;

      Insert;

      QTabela.Sql.Clear;
      QTabela.Sql.Add('SELECT * FROM COMPL_NFISCAL');
      QTabela.Sql.Add('WHERE');
      QTabela.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

      QTabela.ParamByName('TRANSACAO_ID').AsInteger := ID;

      QTabela.Prepare;
      QTabela.Open;

      Set_Campos(False);

      AssignFile(MyFile, 'LPT1');
      Rewrite(MyFile);
      try
        PG               := 0;
        Quantidade_Itens := 0;
        Lin_Stru         := 0;
        Itens            := 0;

        if (QTransacao.FieldByName('CONDUTA').AsString = '01') and (QTransacao.FieldByName('DEPTO').AsString = '07') then
        begin
          QParceiro.Sql.Clear;
          QParceiro.Sql.Add('SELECT * FROM CLIENTES');
          QParceiro.Sql.Add('WHERE');
          QParceiro.Sql.Add('(CLIENTE_ID = :CLIENTE_ID)');

          QParceiro.ParamByName('CLIENTE_ID').AsInteger := QTransacao.FieldByName('CLIENTE_ID').AsInteger;

          QParceiro.Prepare;
          QParceiro.Open;
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
        end;

        if (QTransacao.FieldByName('CONDUTA').AsString = '20') and (QTransacao.FieldByName('DEPTO').AsString = '07') then
        begin
          QParceiro.Sql.Clear;
          QParceiro.Sql.Add('SELECT RAZAO AS NOME, CNPJ, ENDERECO, BAIRRO, CEP, MUNICIPIO, ESTADO, INSCR_ESTADUAL AS INSCRICAO');
          QParceiro.Sql.Add('FROM EMPRESAS');
          QParceiro.Sql.Add('WHERE');
          QParceiro.Sql.Add('(EMPRESA_ID = :EMPRESA_ID)');

          QParceiro.ParamByName('EMPRESA_ID').AsInteger := QTransacao.FieldByName('EMPRESAAUX_ID').AsInteger;

          QParceiro.Prepare;
          QParceiro.Open;
        end;

        QNatoper.Sql.Clear;
        QNatoper.Sql.Add('SELECT * FROM CFOP');
        QNatoper.Sql.Add('WHERE');
        QNatoper.Sql.Add('(COD_CFOP = :COD_CFOP)');

        QNatoper.ParamByName('COD_CFOP').AsString := QTransacao.FieldByName('CFOP').AsString;

        QNatoper.Prepare;
        QNatoper.Open;

        QItens.Sql.Clear;
        QItens.Sql.Add('SELECT COUNT(*) AS REGISTROS FROM TRANSITENS');
        QItens.Sql.Add('WHERE');
        QItens.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

        QItens.ParamByName('TRANSACAO_ID').AsInteger := ID;

        QItens.Prepare;
        QItens.Open;

        Records := QItens.FieldByName('REGISTROS').AsInteger;

        QItens.Sql.Clear;
        QItens.Sql.Add('SELECT * FROM TRANSITENS');
        QItens.Sql.Add('WHERE');
        QItens.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

        QItens.ParamByName('TRANSACAO_ID').AsInteger := ID;

        QItens.Prepare;
        QItens.Open;

        QItens.First;
        while not QItens.Eof do
        begin
          if PG = 0 then
          begin

//            Cabecalho;

            WriteLn(MyFile, #18);
            WriteLn(MyFile, ForcaComprimento(' ', Search_Campo('Cabeçalho NF - Col. Tipo'), ' ') +
                            'X' +
                            ForcaComprimento(' ', Search_Campo('Cabeçalho NF - Col. Número NF'), ' ') +
                            StrZero(NO_DOC_FISCAL.Text, 9, 0));
            WriteLn(MyFile, '');
            WriteLn(MyFile, '');
            WriteLn(MyFile, '');

            if Imprimir_Emitente.Checked then
              WriteLn(MyFile, ForcaComprimento(' ', Search_Campo('Cabeçalho NF - Col. Desc. Emit.'), ' ') +
                              FrmPrincipal.QEmpresa.FieldByName('CNPJ').AsString)
            else
              WriteLn(MyFile, '');

            WriteLn(MyFile, '');

            if Imprimir_Emitente.Checked then
              WriteLn(MyFile, ForcaComprimento(' ', Search_Campo('Cabeçalho NF - Col. Desc. CFOP'), ' ') +
                              ForcaComprimento(QNatoper.FieldByName('DESC_CFOP').AsString, 21, ' ') +
                              ForcaComprimento(' ', Search_Campo('Cabeçalho NF - Col. CFOP'), ' ') +
                              QTransacao.FieldByName('CFOP').AsString + '/' + CFOP_COMPL.Text +
                              ForcaComprimento(' ', Search_Campo('Cabeçalho NF - Col. Inscr. Emit.'), ' ') +
                              FrmPrincipal.QEmpresa.FieldByName('INSCR_ESTADUAL').AsString)
            else
              WriteLn(MyFile, ForcaComprimento(' ', Search_Campo('Cabeçalho NF - Col. Desc. CFOP'), ' ') +
                              ForcaComprimento(QNatoper.FieldByName('DESC_CFOP').AsString, 21, ' ') +
                              ForcaComprimento(' ', Search_Campo('Cabeçalho NF - Col. CFOP'), ' ') +
                              CFOP_COMPL.Text);

            WriteLn(MyFile, '');
            WriteLn(MyFile, '');
            WriteLn(MyFile, ForcaComprimento(' ', Search_Campo('Cabeçalho NF - Col. Razão Social'), ' ') +
                            ForcaComprimento(QParceiro.FieldByName('NOME').AsString, 45, ' ') +
                            ForcaComprimento(' ', Search_Campo('Cabeçalho NF - Col. CNPJ/CPF'), ' ') +
                            ForcaComprimento(QParceiro.FieldByName('CNPJ').AsString, 18, ' ') +
                            ForcaComprimento(' ', Search_Campo('Cabeçalho NF - Col. Dt. Emissão'), ' ') +
                            QTransacao.FieldByName('DT_TRANS').AsString);
            WriteLn(MyFile, '');
            WriteLn(MyFile, ForcaComprimento(' ', Search_Campo('Cabeçalho NF - Col. Endereço'), ' ') +
                            ForcaComprimento(QParceiro.FieldByName('ENDERECO').AsString, 37, ' ') +
                            ForcaComprimento(' ', Search_Campo('Cabeçalho NF - Col. Bairro'), ' ') +
                            ForcaComprimento(QParceiro.FieldByName('BAIRRO').AsString, 18, ' ') +
                            ForcaComprimento(' ', Search_Campo('Cabeçalho NF - Col. CEP'), ' ') +
                            ForcaComprimento(QParceiro.FieldByName('CEP').AsString, 9, ' ') +
                            ForcaComprimento(' ', Search_Campo('Cabeçalho NF - Col. Dt. Saída'), ' ') +
                            DT_SAIDA.Text);
            WriteLn(MyFile, '');
            WriteLn(MyFile, ForcaComprimento(' ', Search_Campo('Cabeçalho NF - Col. Município'), ' ') +
                            ForcaComprimento(QParceiro.FieldByName('MUNICIPIO').AsString, 20, ' ') +
                            ForcaComprimento(' ', Search_Campo('Cabeçalho NF - Col. UF'), ' ') +
                            ForcaComprimento(QParceiro.FieldByName('ESTADO').AsString, 18, ' ') +
                            ForcaComprimento(' ', Search_Campo('Cabeçalho NF - Col. Inscr. Est.'), ' ') +
                            ForcaComprimento(QParceiro.FieldByName('INSCRICAO').AsString, 15, ' ') +
                            ForcaComprimento(' ', Search_Campo('Cabeçalho NF - Col. Hr. Saída'), ' ') +
                            HR_SAIDA.Text);
            WriteLn(MyFile, '');
            WriteLn(MyFile, '');
            WriteLn(MyFile, #15);
            PG := 1;
          end;

          ProdutoSearch(QItens.FieldByName('PRODUTO_ID').AsInteger);

          Writeln(MyFile, ForcaComprimento(' ', Search_Campo('Corpo NF - Col. Cód. Produto'), ' ') +
                          ForcaComprimento(' ', 6 - Length(QProdutos.FieldByName('PRODUTO_ID').AsString), ' ') + QProdutos.FieldByName('PRODUTO_ID').AsString +
                          ForcaComprimento(' ', Search_Campo('Corpo NF - Col. Descr. Produto'), ' ') + ForcaComprimento(QProdutos.FieldByName('DESCRICAO').AsString, 24, ' ') +
                          ForcaComprimento(' ', Search_Campo('Corpo NF - Col. Cód. Barras'), ' ') + ForcaComprimento(QProdutos.FieldByName('COD_BARRA').AsString, 13, ' ') +
                          ForcaComprimento(' ', Search_Campo('Corpo NF - Col. CST'), ' ') + ForcaComprimento(QItens.FieldByName('CST').AsString, 3, ' ') +
                          ForcaComprimento(' ', Search_Campo('Corpo NF - Col. Unidade'), ' ') + ForcaComprimento(QProdutos.FieldByName('UNIDADE_VENDA').AsString, 2, ' ') +
                          ForcaComprimento(' ', Search_Campo('Corpo NF - Col. Quantidade'), ' ') +
                          ForcaComprimento(' ', 10 - Length(FormatFloat('0', QItens.FieldByName('QUANTIDADE').AsFloat)), ' ') + FormatFloat('0', QItens.FieldByName('QUANTIDADE').AsFloat) +
                          ForcaComprimento(' ', Search_Campo('Corpo NF - Col. Vr. Unitário'), ' ') +
                          ForcaComprimento(' ', 10 - Length(FormatFloat('#,##0.00', QItens.FieldByName('VR_UNITARIO').AsFloat)), ' ') + FormatFloat('#,##0.00', QItens.FieldByName('VR_UNITARIO').AsFloat) +
                          ForcaComprimento(' ', Search_Campo('Corpo NF - Col. Vr. Total'), ' ') +
                          ForcaComprimento(' ', 10 - Length(FormatFloat('#,##0.00', QItens.FieldByName('VR_TOTAL').AsFloat)), ' ') + FormatFloat('#,##0.00', QItens.FieldByName('VR_TOTAL').AsFloat) +
                          ForcaComprimento(' ', Search_Campo('Corpo NF - Col. ICMS') - Length(FormatFloat('0', QProdutos.FieldByName('ALIQUOTA_ICMS').AsFloat)), ' ') + FormatFloat('0', QProdutos.FieldByName('ALIQUOTA_ICMS').AsFloat));

          Inc(Quantidade_Itens);
          Inc(Itens);

          if (Quantidade_Itens = Search_Campo('Corpo NF - Quant. Itens')) and ((Records - Itens) > 0) then
          begin
            PG := 0;
            Quantidade_Itens := 0;

//            AvancaPagina;

            WriteLn(MyFile, #18);
            WriteLn(MyFile, '');
            WriteLn(MyFile, ForcaComprimento(' ', Search_Campo('Rodapé NF - Col. Base ICMS'), ' ') +
                            ForcaComprimento(' ', 10 - Length(FormatFloat('#,##0.00', 99999.99)), ' ') + 'XX.XXX,XX' +
                            ForcaComprimento(' ', Search_Campo('Rodapé NF - Col. Vr. ICMS'), ' ') +
                            ForcaComprimento(' ', 10 - Length(FormatFloat('#,##0.00', 99999.99)), ' ') + 'XX.XXX,XX' +
                            ForcaComprimento(' ', Search_Campo('Rodapé NF - Col. Base Sub'), ' ') +
                            ForcaComprimento(' ', 10 - Length(FormatFloat('#,##0.00', 99999.99)), ' ') + 'XX.XXX,XX' +
                            ForcaComprimento(' ', Search_Campo('Rodapé NF - Col. Vr. Sub'), ' ') +
                            ForcaComprimento(' ', 10 - Length(FormatFloat('#,##0.00', 99999.99)), ' ') + 'XX.XXX,XX' +
                            ForcaComprimento(' ', Search_Campo('Rodapé NF - Col. Vr. Produtos'), ' ') +
                            ForcaComprimento(' ', 10 - Length(FormatFloat('#,##0.00', 99999.99)), ' ') + 'XX.XXX,XX');
            WriteLn(MyFile, '');
            WriteLn(MyFile, ForcaComprimento(' ', Search_Campo('Rodapé NF - Col. Vr. Frete'), ' ') +
                            ForcaComprimento(' ', 10 - Length(FormatFloat('#,##0.00', 99999.99)), ' ') + 'XX.XXX,XX' +
                            ForcaComprimento(' ', Search_Campo('Rodapé NF - Col. Vr. Seguro'), ' ') +
                            ForcaComprimento(' ', 10 - Length(FormatFloat('#,##0.00', 99999.99)), ' ') + 'XX.XXX,XX' +
                            ForcaComprimento(' ', Search_Campo('Rodapé NF - Col. Despesas'), ' ') +
                            ForcaComprimento(' ', 10 - Length(FormatFloat('#,##0.00', 99999.99)), ' ') + 'XX.XXX,XX' +
                            ForcaComprimento(' ', Search_Campo('Rodapé NF - Col. Vr. IPI'), ' ') +
                            ForcaComprimento(' ', 10 - Length(FormatFloat('#,##0.00', 99999.99)), ' ') + 'XX.XXX,XX' +
                            ForcaComprimento(' ', Search_Campo('Rodapé NF - Col. Vr. Nota'), ' ') +
                            ForcaComprimento(' ', 10 - Length(FormatFloat('#,##0.00', 99999.99)), ' ') + 'XX.XXX,XX');
            WriteLn(MyFile, '');
            WriteLn(MyFile, '');

            WriteLn(MyFile, ForcaComprimento(' ', Search_Campo('Rodapé NF - Col. Transportador'), ' ') +
                            ForcaComprimento(NOME_TRANSPORTADOR.Text, 37, ' ') +
                            ForcaComprimento(' ', Search_Campo('Rodapé NF - Col. Resp. Frete'), ' ') +
                            ForcaComprimento(IntToStr(RESP_FRETE.ItemIndex), 1, ' ') +
                            ForcaComprimento(' ', Search_Campo('Rodapé NF - Col. Placa'), ' ') +
                            ForcaComprimento(PLACA_VEICULO.Text, 8, ' ') +
                            ForcaComprimento(' ', Search_Campo('Rodapé NF - Col. UF Placa'), ' ') +
                            ForcaComprimento(UF_VEICULO.Text, 2, ' ') +
                            ForcaComprimento(' ', Search_Campo('Rodapé NF - Col. CNPJ/CPF'), ' ') +
                            CNPJ_TRANSPORTADOR.Text);
            WriteLn(MyFile, '');
            WriteLn(MyFile, ForcaComprimento(' ', Search_Campo('Rodapé NF - Col. Endereço'), ' ') +
                            ForcaComprimento(ENDERECO_TRANSPORTADOR.Text, 37, ' ') +
                            ForcaComprimento(' ', Search_Campo('Rodapé NF - Col. Município'), ' ') +
                            ForcaComprimento(MUNICIPIO_TRANSPORTADOR.Text, 18, ' ') +
                            ForcaComprimento(' ', Search_Campo('Rodapé NF - Col. UF'), ' ') +
                            ForcaComprimento(UF_TRANSPORTADOR.Text, 2, ' ') +
                            ForcaComprimento(' ', Search_Campo('Rodapé NF - Col. Inscr. Est.'), ' ') +
                            INSCRICAO_TRANSPORTADOR.Text);
            WriteLn(MyFile, '');
            WriteLn(MyFile, ForcaComprimento(' ', Search_Campo('Rodapé NF - Col. Quantidade'), ' ') +
                            ForcaComprimento(QUANTIDADE_VOLUMES.Text, 10, ' ') +
                            ForcaComprimento(' ', Search_Campo('Rodapé NF - Col. Espécie'), ' ') +
                            ForcaComprimento(ESPECIE_VOLUMES.Text, 15, ' ') +
                            ForcaComprimento(' ', Search_Campo('Rodapé NF - Col. Marca'), ' ') +
                            ForcaComprimento(MARCA_VOLUMES.Text, 15, ' ') +
                            ForcaComprimento(' ', Search_Campo('Rodapé NF - Col. Número'), ' ') +
                            ForcaComprimento(NUMERO_VOLUMES.Text, 15, ' ') +
                            ForcaComprimento(' ', Search_Campo('Rodapé NF - Col. Peso Bruto'), ' ') +
                            ForcaComprimento(PESO_BRUTO.Text, 15, ' ') +
                            ForcaComprimento(' ', Search_Campo('Rodapé NF - Col. Peso Líq.'), ' ') +
                            PESO_LIQUIDO.Text);

            WriteLn(MyFile, '');
            WriteLn(MyFile, '');
            WriteLn(MyFile, ForcaComprimento(' ', Search_Campo('Rodapé NF - Col. Observação'), ' ') +
                            #15 + INSTRUCOES.Lines[Lin_Stru]);
            WriteLn(MyFile, ForcaComprimento(' ', Search_Campo('Rodapé NF - Col. Observação'), ' ') +
                            INSTRUCOES.Lines[Lin_Stru + 1]);
            WriteLn(MyFile, ForcaComprimento(' ', Search_Campo('Rodapé NF - Col. Observação'), ' ') +
                            INSTRUCOES.Lines[Lin_Stru + 2]);
            WriteLn(MyFile, ForcaComprimento(' ', Search_Campo('Rodapé NF - Col. Observação'), ' ') +
                            INSTRUCOES.Lines[Lin_Stru + 3]);
            WriteLn(MyFile, ForcaComprimento(' ', Search_Campo('Rodapé NF - Col. Observação'), ' ') +
                            INSTRUCOES.Lines[Lin_Stru + 4]);
            WriteLn(MyFile, ForcaComprimento(' ', Search_Campo('Rodapé NF - Col. Observação'), ' ') +
                            INSTRUCOES.Lines[Lin_Stru + 5] + #18);
            WriteLn(MyFile, '');
            WriteLn(MyFile, '');
            WriteLn(MyFile, '');

            Lin_Stru := Lin_Stru + 6;

            WriteLn(MyFile, ForcaComprimento(' ', Search_Campo('Rodapé NF - Col. Número NF'), ' ') + StrZero(NO_DOC_FISCAL.Text, 9, 0));
            WriteLn(MyFile, '');
            WriteLn(MyFile, '');
            WriteLn(MyFile, '');
            WriteLn(MyFile, '');
          end;

          Application.ProcessMessages;
          QItens.Next;
        end;

//        Rodape;

        Vr_Nota := QTransacao.FieldByName('VALOR').AsFloat;

        if QTransacao.FieldByName('VR_DESCONTO').AsFloat > 0 then
        begin
          Writeln(MyFile, ForcaComprimento(' ', Search_Campo('Corpo NF - Col. Cód. Produto'), ' ') +
                          ForcaComprimento(' ', 6 - Length('      '), ' ') + '      ' +
                          ForcaComprimento(' ', Search_Campo('Corpo NF - Col. Descr. Produto'), ' ') + 'Desconto -> ' + FormatFloat('#,##0.00', QTransacao.FieldByName('VR_DESCONTO').AsFloat));

          Vr_Nota := Vr_Nota - QTransacao.FieldByName('VR_DESCONTO').AsFloat;

          Inc(Quantidade_Itens);
        end;

        if QTransacao.FieldByName('VR_ACRESCIMO').AsFloat > 0 then
        begin
          Writeln(MyFile, ForcaComprimento(' ', Search_Campo('Corpo NF - Col. Cód. Produto'), ' ') +
                          ForcaComprimento(' ', 6 - Length('      '), ' ') + '      ' +
                          ForcaComprimento(' ', Search_Campo('Corpo NF - Col. Descr. Produto'), ' ') + 'Acréscimo Financeiro -> ' + FormatFloat('#,##0.00', QTransacao.FieldByName('VR_ACRESCIMO').AsFloat));

          Vr_Nota := Vr_Nota + QTransacao.FieldByName('VR_ACRESCIMO').AsFloat;

          Inc(Quantidade_Itens);
        end;

        Lin_Stru := 0;

        for X := 1 to (Search_Campo('Corpo NF - Quant. Itens') - Quantidade_Itens) do
          WriteLn(MyFile, '');

        WriteLn(MyFile, #18);
        WriteLn(MyFile, '');
        WriteLn(MyFile, ForcaComprimento(' ', Search_Campo('Rodapé NF - Col. Base ICMS'), ' ') +
                        ForcaComprimento(' ', 10 - Length(FormatFloat('#,##0.00', QTransacao.FieldByName('BASE_ICMS_NORMAL').AsFloat)), ' ') + FormatFloat('#,##0.00', QTransacao.FieldByName('BASE_ICMS_NORMAL').AsFloat) +
                        ForcaComprimento(' ', Search_Campo('Rodapé NF - Col. Vr. ICMS'), ' ') +
                        ForcaComprimento(' ', 10 - Length(FormatFloat('#,##0.00', QTransacao.FieldByName('VR_ICMS_NORMAL').AsFloat)), ' ') + FormatFloat('#,##0.00', QTransacao.FieldByName('VR_ICMS_NORMAL').AsFloat) +
                        ForcaComprimento(' ', Search_Campo('Rodapé NF - Col. Base Sub'), ' ') +
                        ForcaComprimento(' ', 10 - Length(FormatFloat('#,##0.00', QTransacao.FieldByName('BASE_ICMS_ST').AsFloat)), ' ') + FormatFloat('#,##0.00', QTransacao.FieldByName('BASE_ICMS_ST').AsFloat) +
                        ForcaComprimento(' ', Search_Campo('Rodapé NF - Col. Vr. Sub'), ' ') +
                        ForcaComprimento(' ', 10 - Length(FormatFloat('#,##0.00', QTransacao.FieldByName('VR_ICMS_ST').AsFloat)), ' ') + FormatFloat('#,##0.00', QTransacao.FieldByName('VR_ICMS_ST').AsFloat) +
                        ForcaComprimento(' ', Search_Campo('Rodapé NF - Col. Vr. Produtos'), ' ') +
                        ForcaComprimento(' ', 10 - Length(FormatFloat('#,##0.00', QTransacao.FieldByName('VALOR_PRODUTOS').AsFloat)), ' ') + FormatFloat('#,##0.00', QTransacao.FieldByName('VALOR_PRODUTOS').AsFloat));
        WriteLn(MyFile, '');
        WriteLn(MyFile, ForcaComprimento(' ', Search_Campo('Rodapé NF - Col. Vr. Frete'), ' ') +
                        ForcaComprimento(' ', 10 - Length(FormatFloat('#,##0.00', QTransacao.FieldByName('VR_FRETE').AsFloat)), ' ') + FormatFloat('#,##0.00', QTransacao.FieldByName('VR_FRETE').AsFloat) +
                        ForcaComprimento(' ', Search_Campo('Rodapé NF - Col. Vr. Seguro'), ' ') +
                        ForcaComprimento(' ', 10 - Length(FormatFloat('#,##0.00', 0)), ' ') + FormatFloat('#,##0.00', 0) +
                        ForcaComprimento(' ', Search_Campo('Rodapé NF - Col. Despesas'), ' ') +
                        ForcaComprimento(' ', 10 - Length(FormatFloat('#,##0.00', 0)), ' ') + FormatFloat('#,##0.00', 0) +
                        ForcaComprimento(' ', Search_Campo('Rodapé NF - Col. Vr. IPI'), ' ') +
                        ForcaComprimento(' ', 10 - Length(FormatFloat('#,##0.00', 0)), ' ') + FormatFloat('#,##0.00', QTransacao.FieldByName('VR_IPI').AsFloat) +
                        ForcaComprimento(' ', Search_Campo('Rodapé NF - Col. Vr. Nota'), ' ') +
                        ForcaComprimento(' ', 10 - Length(FormatFloat('#,##0.00', Vr_Nota)), ' ') + FormatFloat('#,##0.00', Vr_Nota));
        WriteLn(MyFile, '');
        WriteLn(MyFile, '');
        WriteLn(MyFile, ForcaComprimento(' ', Search_Campo('Rodapé NF - Col. Transportador'), ' ') +
                        ForcaComprimento(NOME_TRANSPORTADOR.Text, 37, ' ') +
                        ForcaComprimento(' ', Search_Campo('Rodapé NF - Col. Resp. Frete'), ' ') +
                        ForcaComprimento(IntToStr(RESP_FRETE.ItemIndex), 1, ' ') +
                        ForcaComprimento(' ', Search_Campo('Rodapé NF - Col. Placa'), ' ') +
                        ForcaComprimento(PLACA_VEICULO.Text, 8, ' ') +
                        ForcaComprimento(' ', Search_Campo('Rodapé NF - Col. UF Placa'), ' ') +
                        ForcaComprimento(UF_VEICULO.Text, 2, ' ') +
                        ForcaComprimento(' ', Search_Campo('Rodapé NF - Col. CNPJ/CPF'), ' ') +
                        CNPJ_TRANSPORTADOR.Text);
        WriteLn(MyFile, '');
        WriteLn(MyFile, ForcaComprimento(' ', Search_Campo('Rodapé NF - Col. Endereço'), ' ') +
                        ForcaComprimento(ENDERECO_TRANSPORTADOR.Text, 37, ' ') +
                        ForcaComprimento(' ', Search_Campo('Rodapé NF - Col. Município'), ' ') +
                        ForcaComprimento(MUNICIPIO_TRANSPORTADOR.Text, 18, ' ') +
                        ForcaComprimento(' ', Search_Campo('Rodapé NF - Col. UF'), ' ') +
                        ForcaComprimento(UF_TRANSPORTADOR.Text, 2, ' ') +
                        ForcaComprimento(' ', Search_Campo('Rodapé NF - Col. Inscr. Est.'), ' ') +
                        INSCRICAO_TRANSPORTADOR.Text);
        WriteLn(MyFile, '');
        WriteLn(MyFile, ForcaComprimento(' ', Search_Campo('Rodapé NF - Col. Quantidade'), ' ') +
                        ForcaComprimento(QUANTIDADE_VOLUMES.Text, 10, ' ') +
                        ForcaComprimento(' ', Search_Campo('Rodapé NF - Col. Espécie'), ' ') +
                        ForcaComprimento(ESPECIE_VOLUMES.Text, 15, ' ') +
                        ForcaComprimento(' ', Search_Campo('Rodapé NF - Col. Marca'), ' ') +
                        ForcaComprimento(MARCA_VOLUMES.Text, 15, ' ') +
                        ForcaComprimento(' ', Search_Campo('Rodapé NF - Col. Número'), ' ') +
                        ForcaComprimento(NUMERO_VOLUMES.Text, 15, ' ') +
                        ForcaComprimento(' ', Search_Campo('Rodapé NF - Col. Peso Bruto'), ' ') +
                        ForcaComprimento(PESO_BRUTO.Text, 15, ' ') +
                        ForcaComprimento(' ', Search_Campo('Rodapé NF - Col. Peso Líq.'), ' ') +
                        PESO_LIQUIDO.Text);
        WriteLn(MyFile, '');
        WriteLn(MyFile, '');
        WriteLn(MyFile, ForcaComprimento(' ', Search_Campo('Rodapé NF - Col. Observação'), ' ') +
                        #15 + INSTRUCOES.Lines[Lin_Stru]);
        WriteLn(MyFile, ForcaComprimento(' ', Search_Campo('Rodapé NF - Col. Observação'), ' ') +
                        INSTRUCOES.Lines[Lin_Stru + 1]);
        WriteLn(MyFile, ForcaComprimento(' ', Search_Campo('Rodapé NF - Col. Observação'), ' ') +
                        INSTRUCOES.Lines[Lin_Stru + 2]);
        WriteLn(MyFile, ForcaComprimento(' ', Search_Campo('Rodapé NF - Col. Observação'), ' ') +
                        INSTRUCOES.Lines[Lin_Stru + 3]);
        WriteLn(MyFile, ForcaComprimento(' ', Search_Campo('Rodapé NF - Col. Observação'), ' ') +
                        INSTRUCOES.Lines[Lin_Stru + 4]);
        WriteLn(MyFile, ForcaComprimento(' ', Search_Campo('Rodapé NF - Col. Observação'), ' ') +
                        INSTRUCOES.Lines[Lin_Stru + 5] + #18);

        WriteLn(MyFile, '');
        WriteLn(MyFile, '');
        WriteLn(MyFile, '');
        WriteLn(MyFile, ForcaComprimento(' ', Search_Campo('Rodapé NF - Col. Número NF'), ' ') + StrZero(NO_DOC_FISCAL.Text, 9, 0));
        WriteLn(MyFile, '');
        WriteLn(MyFile, '');
        WriteLn(MyFile, '');
        WriteLn(MyFile, '');

        IQuery.Sql.Clear;
        IQuery.Sql.Add('UPDATE TRANSACOES SET NUM_DOC = :NUM_DOC');
        IQuery.Sql.Add('WHERE');
        IQuery.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

        IQuery.ParamByName('NUM_DOC').AsString := StrZero(NO_DOC_FISCAL.Text, 9, 0);
        IQuery.ParamByName('TRANSACAO_ID').AsInteger := QTransacao.FieldByName('TRANSACAO_ID').AsInteger;

        IQuery.Prepare;
        IQuery.ExecSql;

      finally
        CloseFile(MyFile);
      end;
      Close;
    end;
  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;

procedure TFrmEmite_Nota.CFOP_COMPLExit(Sender: TObject);
begin
  DetailSearch('CFOP');
end;

procedure TFrmEmite_Nota.CNPJ_TRANSPORTADORKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmEmite_Nota.DT_SAIDAEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmEmite_Nota.DT_SAIDAKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmEmite_Nota.FormShow(Sender: TObject);
begin
  QTransacao.Sql.Clear;
  QTransacao.Sql.Add('SELECT * FROM TRANSACOES');
  QTransacao.Sql.Add('WHERE');
  QTransacao.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

  QTransacao.ParamByName('TRANSACAO_ID').AsInteger := ID;

  QTransacao.Prepare;
  QTransacao.Open;

  QTabela.Sql.Clear;
  QTabela.Sql.Add('SELECT * FROM COMPL_NFISCAL');
  QTabela.Sql.Add('WHERE');
  QTabela.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

  QTabela.ParamByName('TRANSACAO_ID').AsInteger := ID;
  
  QTabela.Prepare;
  QTabela.Open;

  if QTabela.IsEmpty then
  begin
    Set_Campos(True);

    UF_VEICULO.Text       := '  ';
    UF_TRANSPORTADOR.Text := '  ';
    DT_SAIDA.Date         := date;
    HR_SAIDA.Text         := Copy(TimeToStr(time), 1, 5);
    TRANSACAO_ID.Value    := ID;
    NO_DOC_FISCAL.Value   := 0;
    Empresa_id.Value      := FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger; 
  end
  else
    Set_Campos(False);
end;

end.
