unit UConsulta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Grids, DBGrids, Spin, DBTables, DB, ComCtrls,
  Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmConsulta = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Localiz: TEdit;
    btnRetorna: TBitBtn;
    Label3: TLabel;
    QConsulta: TFDQuery;
    QProdutos: TFDQuery;
    QOrcamento: TFDQuery;
    QPedido: TFDQuery;
    QPedidoVenda: TFDQuery;
    QOrdem: TFDQuery;
    QPedido1: TFDQuery;
    DataConsulta: TDataSource;
    procedure LocalizKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure LocalizEnter(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure LocalizChange(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ChaveConsulta: String;
  Emp, Forn, Atual,Codigo: Integer;
  FrmConsulta: TFrmConsulta;

  function GetConsulta(Tabela: String; Empresa, Fornecedor, Vr_Atual: Integer): Integer;

implementation

uses
  UPrincipal, UData, UFicha_Financeira, UDetalhes_Produto, UDetalhes_Cliente;

{$R *.DFM}

function GetConsulta(Tabela: String; Empresa, Fornecedor, Vr_Atual: Integer): Integer;
begin
  ChaveConsulta := Tabela;
  Emp           := Empresa;
  Forn          := Fornecedor;
  Atual         := Vr_Atual;

  Application.CreateForm(TFrmConsulta, FrmConsulta);
  try
    FrmConsulta.ShowModal;

    if ChaveConsulta = 'ESTOQUE' then
    begin
      if (not FrmConsulta.QProdutos.IsEmpty) and (FrmConsulta.ModalResult = mrOK) then
        Result := FrmConsulta.QProdutos.Fields[0].AsInteger
      else
        Result := Vr_Atual;
    end
    else
    begin
      if (not FrmConsulta.QConsulta.IsEmpty) and (FrmConsulta.ModalResult = mrOK) then
      begin
        if ChaveConsulta = 'PLANO' then
        begin
          if Copy(FrmConsulta.QConsulta.FieldByName('CHAVE').AsString, 1, 1) = 'A' then
            Result := StrToInt(Copy(FrmConsulta.QConsulta.FieldByName('CHAVE').AsString, 2, 4));
        end
        else
          Result := FrmConsulta.QConsulta.Fields[0].AsInteger;
      end
      else
        Result := Vr_Atual;
    end;
  finally
    FrmConsulta.Release;
  end;
end;

procedure TFrmConsulta.LocalizKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    ModalResult := mrCancel;

  if (Key = #13) and (Localiz.Text <> '') then
  begin
    if ChaveConsulta = 'BANCOS' then
    begin
      QConsulta.Sql.Clear;
      QConsulta.Sql.Add('SELECT * FROM BANCOS');
      QConsulta.Sql.Add('WHERE');
      QConsulta.Sql.Add('(DESCRICAO LIKE :DESCRICAO)');
      QConsulta.Sql.Add('AND (STATUS = :STATUS)');
      QConsulta.Sql.Add('ORDER BY DESCRICAO');

      QConsulta.ParamByName('DESCRICAO').AsString := '%' + Localiz.Text + '%';
      QConsulta.ParamByName('STATUS').AsString    := 'A';

      QConsulta.Prepare;
      QConsulta.Open;
    end;

    if ChaveConsulta = 'CARGOS' then
    begin
      QConsulta.Sql.Clear;
      QConsulta.Sql.Add('SELECT * FROM TABELAS');
      QConsulta.Sql.Add('WHERE');
      QConsulta.Sql.Add('(TIPO_TABELA = :TIPO_TABELA)');
      QConsulta.Sql.Add('AND (DESCRICAO LIKE :DESCRICAO)');
      QConsulta.Sql.Add('AND (STATUS = :STATUS)');
      QConsulta.Sql.Add('ORDER BY DESCRICAO');

      QConsulta.ParamByName('TIPO_TABELA').AsString := '6';
      QConsulta.ParamByName('DESCRICAO').AsString   := '%' + Localiz.Text + '%';
      QConsulta.ParamByName('STATUS').AsString      := 'A';

      QConsulta.Prepare;
      QConsulta.Open;
    end;

    if ChaveConsulta = 'CCUSTO' then
    begin
      QConsulta.Sql.Clear;
      QConsulta.Sql.Add('SELECT * FROM TABELAS');
      QConsulta.Sql.Add('WHERE');
      QConsulta.Sql.Add('(TIPO_TABELA = :TIPO_TABELA)');
      QConsulta.Sql.Add('AND (DESCRICAO LIKE :DESCRICAO)');
      QConsulta.Sql.Add('AND (STATUS = :STATUS)');
      QConsulta.Sql.Add('ORDER BY DESCRICAO');

      QConsulta.ParamByName('TIPO_TABELA').AsString := '2';
      QConsulta.ParamByName('DESCRICAO').AsString   := '%' + Localiz.Text + '%';
      QConsulta.ParamByName('STATUS').AsString      := 'A';

      QConsulta.Prepare;
      QConsulta.Open;
    end;

    if ChaveConsulta = 'CLIENTES' then
    begin
      QConsulta.Sql.Clear;
      QConsulta.Sql.Add('SELECT * FROM CLIENTES');
      QConsulta.Sql.Add('WHERE');
      QConsulta.Sql.Add('((NOME LIKE :NOME) OR (CNPJ LIKE :CPF) OR (CNPJ LIKE :CNPJ))');

     If FrmPrincipal.Config.FieldByName('VER_DESATIVADOS').AsString = 'False' Then
      QConsulta.Sql.Add('AND (STATUS = :STATUS)');

      QConsulta.Sql.Add('ORDER BY NOME');

      QConsulta.ParamByName('CPF').AsString    := '%' + Copy(Formata_CPF(SemMascara(Localiz.Text)), 1, 16) + '%';
      QConsulta.ParamByName('CNPJ').AsString   := '%' + Copy(Formata_CNPJ(SemMascara(Localiz.Text)), 1, 16) + '%';
      QConsulta.ParamByName('NOME').AsString   := '%' + Localiz.Text + '%';

      IF FrmPrincipal.Config.FieldByName('VER_DESATIVADOS').AsString = 'False' Then
      QConsulta.ParamByName('STATUS').AsString := 'A';

      QConsulta.Prepare;
      QConsulta.Open;
    end;

    if ChaveConsulta = 'COMP_PRODUTO' then
    begin
      QConsulta.Sql.Clear;
      QConsulta.Sql.Add('SELECT DISTINCT COMPOSICAO_ID, NOME_COMP FROM COMP_PRODUTO');
      QConsulta.Sql.Add('WHERE');
      QConsulta.Sql.Add('(NOME_COMP LIKE :NOME_COMP)');
      QConsulta.Sql.Add('ORDER BY NOME_COMP');

      QConsulta.ParamByName('NOME_COMP').AsString   := '%' + Localiz.Text + '%';

      QConsulta.Prepare;
      QConsulta.Open;
    end;

    if ChaveConsulta = 'CONTAS' then
    begin
      QConsulta.Sql.Clear;
      QConsulta.Sql.Add('SELECT * FROM TABELAS');
      QConsulta.Sql.Add('WHERE');
      QConsulta.Sql.Add('(TIPO_TABELA = :TIPO_TABELA)');
      QConsulta.Sql.Add('AND (NIVEL = :NIVEL)');
      QConsulta.Sql.Add('AND (DESCRICAO LIKE :DESCRICAO)');
      QConsulta.Sql.Add('AND (STATUS = :STATUS)');
      QConsulta.Sql.Add('ORDER BY DESCRICAO');

      QConsulta.ParamByName('TIPO_TABELA').AsString := '4';
      QConsulta.ParamByName('NIVEL').AsString       := 'ANALÍTICA';
      QConsulta.ParamByName('DESCRICAO').AsString   := '%' + Localiz.Text + '%';
      QConsulta.ParamByName('STATUS').AsString      := 'A';

      QConsulta.Prepare;
      QConsulta.Open;
    end;

    if ChaveConsulta = 'CONTAS_TOTAL' then
    begin
      QConsulta.Sql.Clear;
      QConsulta.Sql.Add('SELECT * FROM TABELAS');
      QConsulta.Sql.Add('WHERE');
      QConsulta.Sql.Add('(TIPO_TABELA = :TIPO_TABELA)');
    //  QConsulta.Sql.Add('AND (NIVEL = :NIVEL)');
      QConsulta.Sql.Add('AND (DESCRICAO LIKE :DESCRICAO)');
      QConsulta.Sql.Add('AND (STATUS = :STATUS)');
      QConsulta.Sql.Add('ORDER BY DESCRICAO');

      QConsulta.ParamByName('TIPO_TABELA').AsString := '4';
     // QConsulta.ParamByName('NIVEL').AsString       := 'ANALÍTICA';
      QConsulta.ParamByName('DESCRICAO').AsString   := '%' + Localiz.Text + '%';
      QConsulta.ParamByName('STATUS').AsString      := 'A';

      QConsulta.Prepare;
      QConsulta.Open;
    end;




    if ChaveConsulta = 'CONTASSIN' then
    begin
      QConsulta.Sql.Clear;
      QConsulta.Sql.Add('SELECT * FROM TABELAS');
      QConsulta.Sql.Add('WHERE');
      QConsulta.Sql.Add('(TIPO_TABELA = :TIPO_TABELA)');
      QConsulta.Sql.Add('AND (NIVEL = :NIVEL)');
      QConsulta.Sql.Add('AND (DESCRICAO LIKE :DESCRICAO)');
      QConsulta.Sql.Add('AND (STATUS = :STATUS)');
      QConsulta.Sql.Add('ORDER BY DESCRICAO');

      QConsulta.ParamByName('TIPO_TABELA').AsString := '4';
      QConsulta.ParamByName('NIVEL').AsString       := 'SINTÉTICA';
      QConsulta.ParamByName('DESCRICAO').AsString   := '%' + Localiz.Text + '%';
      QConsulta.ParamByName('STATUS').AsString      := 'A';

      QConsulta.Prepare;
      QConsulta.Open;
    end;

    if ChaveConsulta = 'EMPRESAS' then
    begin
      QConsulta.Sql.Clear;
      QConsulta.Sql.Add('SELECT * FROM EMPRESAS');
      QConsulta.Sql.Add('WHERE');
      QConsulta.Sql.Add('(RAZAO LIKE :RAZAO)');
      QConsulta.Sql.Add('AND (STATUS = :STATUS)');
      QConsulta.Sql.Add('ORDER BY RAZAO');

      QConsulta.ParamByName('RAZAO').AsString  := '%' + Localiz.Text + '%';
      QConsulta.ParamByName('STATUS').AsString := 'A';

      QConsulta.Prepare;
      QConsulta.Open;
    end;

    if ChaveConsulta = 'ESTOQUE' then
    begin
      QProdutos.Sql.Clear;
      QProdutos.Sql.Add('SELECT * FROM PRODUTOS');
      QProdutos.Sql.Add('WHERE');
      QProdutos.Sql.Add('((DESCRICAO LIKE :DESCRICAO) OR (COD_BARRA LIKE :COD_BARRA OR ' +
                        'COD_BARRA_AUX1 LIKE :COD_BARRA OR COD_BARRA_AUX2 LIKE :COD_BARRA OR COD_BARRA_AUX3 LIKE :COD_BARRA OR COD_BARRA_AUX4 LIKE :COD_BARRA OR COD_ORIGINAL LIKE :COD_ORIGINAL OR REFERENCIA LIKE :REFERENCIA))');

      if Emp > 0 then
      begin
        QProdutos.Sql.Add('AND (EMPRESA_ID = :EMPRESA_ID)');

        QProdutos.ParamByName('EMPRESA_ID').AsInteger := Emp;
      end;

      if StrToInt(LeIni(Arq_Ini, 'Sistema', 'Localização')) > 0 then
      begin
        QProdutos.Sql.Add('AND (LOCALIZACAO_ID = :LOCALIZACAO_ID)');

        QProdutos.ParamByName('LOCALIZACAO_ID').AsInteger := StrToInt(LeIni(Arq_Ini, 'Sistema', 'Localização'));
      end;

      QProdutos.Sql.Add('AND (STATUS = :STATUS)');
      QProdutos.Sql.Add('ORDER BY DESCRICAO');

      QProdutos.ParamByName('DESCRICAO').AsString    := '%' + UpperCase(Localiz.Text) + '%';
      QProdutos.ParamByName('COD_BARRA').AsString    := '%' + Copy(Localiz.Text, 1, 11) + '%';
      QProdutos.ParamByName('COD_ORIGINAL').AsString := '%' + Copy(Localiz.Text, 1, 18) + '%';
      QProdutos.ParamByName('REFERENCIA').AsString   := '%' + Copy(Localiz.Text, 1, 11) + '%';
      QProdutos.ParamByName('STATUS').AsString       := 'A';

      QProdutos.Prepare;
      QProdutos.Open;
    end;

    if ChaveConsulta = 'FAMÍLIA' then
    begin
      QConsulta.Sql.Clear;
      QConsulta.Sql.Add('SELECT * FROM TABELAS');
      QConsulta.Sql.Add('WHERE');
      QConsulta.Sql.Add('(TIPO_TABELA = :TIPO_TABELA)');
      QConsulta.Sql.Add('AND (DESCRICAO LIKE :DESCRICAO)');
      QConsulta.Sql.Add('AND (STATUS = :STATUS)');
      QConsulta.Sql.Add('ORDER BY DESCRICAO');

      QConsulta.ParamByName('TIPO_TABELA').AsString := 'F';
      QConsulta.ParamByName('DESCRICAO').AsString   := '%' + UpperCase(Localiz.Text) + '%';
      QConsulta.ParamByName('STATUS').AsString      := 'A';

      QConsulta.Prepare;
      QConsulta.Open;
    end;

    if ChaveConsulta = 'FLUXO_CAIXA' then
    begin
      QConsulta.Sql.Clear;
      QConsulta.Sql.Add('SELECT * FROM FLUXO_CAIXA');
      QConsulta.Sql.Add('WHERE');
      QConsulta.Sql.Add('(DESCRICAO LIKE :DESCRICAO)');
      QConsulta.Sql.Add('ORDER BY DESCRICAO');

      QConsulta.ParamByName('DESCRICAO').AsString := '%' + UpperCase(Localiz.Text) + '%';

      QConsulta.Prepare;
      QConsulta.Open;
    end;

    if ChaveConsulta = 'FORMAS' then
    begin
      QConsulta.Sql.Clear;
      QConsulta.Sql.Add('SELECT * FROM FINALIZADORAS');
      QConsulta.Sql.Add('WHERE');
      QConsulta.Sql.Add('(DESCRICAO LIKE :DESCRICAO)');
      QConsulta.Sql.Add('ORDER BY DESCRICAO');

      QConsulta.ParamByName('DESCRICAO').AsString := '%' + UpperCase(Localiz.Text) + '%';

      QConsulta.Prepare;
      QConsulta.Open;
    end;

     if ChaveConsulta = 'OPERADOR' then
    begin
      QConsulta.Sql.Clear;
      QConsulta.Sql.Add('SELECT OPERADOR_ID, NOME FROM OPERADORES');
      QConsulta.Sql.Add('WHERE');
      QConsulta.Sql.Add('(NOME LIKE :DESCRICAO)');
      QConsulta.Sql.Add('ORDER BY NOME');

      QConsulta.ParamByName('DESCRICAO').AsString := '%' + Localiz.Text + '%';

      QConsulta.Prepare;
      QConsulta.Open;
    end;



    if ChaveConsulta = 'FORNECEDORES' then
    begin
      QConsulta.Sql.Clear;
      QConsulta.Sql.Add('SELECT * FROM FORNECEDORES');
      QConsulta.Sql.Add('WHERE');
      QConsulta.Sql.Add('((NOME LIKE :NOME) OR (CNPJ LIKE :CPF) OR (CNPJ LIKE :CNPJ))');
      QConsulta.Sql.Add('AND (STATUS = :STATUS)');
      QConsulta.Sql.Add('ORDER BY NOME');

      QConsulta.ParamByName('CPF').AsString    := '%' + Copy(Formata_CPF(SemMascara(Localiz.Text)), 1, 16) + '%';
      QConsulta.ParamByName('CNPJ').AsString   := '%' + Copy(Formata_CNPJ(SemMascara(Localiz.Text)), 1, 16) + '%';
      QConsulta.ParamByName('NOME').AsString   := '%' + UpperCase(Localiz.Text) + '%';
      QConsulta.ParamByName('STATUS').AsString := 'A';

      QConsulta.Prepare;
      QConsulta.Open;
    end;

    if ChaveConsulta = 'GENEROS' then
    begin
      QConsulta.Sql.Clear;
      QConsulta.Sql.Add('SELECT * FROM GENERO_PRODUTOS');
      QConsulta.Sql.Add('WHERE');
      QConsulta.Sql.Add('(DESCRICAO LIKE :DESCRICAO)');
      QConsulta.Sql.Add('ORDER BY CODIGO');

      QConsulta.ParamByName('DESCRICAO').AsString   := '%' + UpperCase(Localiz.Text) + '%';

      QConsulta.Prepare;
      QConsulta.Open;
    end;

    if ChaveConsulta = 'GRUPOS' then
    begin
      QConsulta.Sql.Clear;
      QConsulta.Sql.Add('SELECT * FROM TABELAS');
      QConsulta.Sql.Add('WHERE');
      QConsulta.Sql.Add('(TIPO_TABELA = :TIPO_TABELA)');
      QConsulta.Sql.Add('AND (DESCRICAO LIKE :DESCRICAO)');
      QConsulta.Sql.Add('AND (STATUS = :STATUS)');
      QConsulta.Sql.Add('ORDER BY DESCRICAO');

      QConsulta.ParamByName('TIPO_TABELA').AsString := '7';
      QConsulta.ParamByName('DESCRICAO').AsString   := '%' + UpperCase(Localiz.Text) + '%';
      QConsulta.ParamByName('STATUS').AsString      := 'A';

      QConsulta.Prepare;
      QConsulta.Open;
    end;

    if ChaveConsulta = 'HISTORICO' then
    begin
      QConsulta.Sql.Clear;
      QConsulta.Sql.Add('SELECT * FROM TABELAS');
      QConsulta.Sql.Add('WHERE');
      QConsulta.Sql.Add('(TIPO_TABELA = :TIPO_TABELA)');
      QConsulta.Sql.Add('AND (DESCRICAO LIKE :DESCRICAO)');
      QConsulta.Sql.Add('AND (STATUS = :STATUS)');
      QConsulta.Sql.Add('ORDER BY DESCRICAO');

      QConsulta.ParamByName('TIPO_TABELA').AsString := '9';
      QConsulta.ParamByName('DESCRICAO').AsString   := '%' + UpperCase(Localiz.Text) + '%';
      QConsulta.ParamByName('STATUS').AsString      := 'A';

      QConsulta.Prepare;
      QConsulta.Open;
    end;

    if ChaveConsulta = 'IBGE' then
    begin
      QConsulta.Sql.Clear;
      QConsulta.Sql.Add('SELECT * FROM IBGE');
      QConsulta.Sql.Add('WHERE');
      QConsulta.Sql.Add('(DESCRICAO LIKE :DESCRICAO)');
      QConsulta.Sql.Add('ORDER BY DESCRICAO');

      QConsulta.ParamByName('DESCRICAO').AsString := '%' + UpperCase(Localiz.Text) + '%'; ;

      QConsulta.Prepare;
      QConsulta.Open;
    end;

    if ChaveConsulta = 'LOCAIS' then
    begin
      QConsulta.Sql.Clear;
      QConsulta.Sql.Add('SELECT * FROM TABELAS');
      QConsulta.Sql.Add('WHERE');
      QConsulta.Sql.Add('(TIPO_TABELA = :TIPO_TABELA)');
      QConsulta.Sql.Add('AND (DESCRICAO LIKE :DESCRICAO)');
      QConsulta.Sql.Add('AND (STATUS = :STATUS)');
      QConsulta.Sql.Add('ORDER BY DESCRICAO');

      QConsulta.ParamByName('TIPO_TABELA').AsString := '8';
      QConsulta.ParamByName('DESCRICAO').AsString   := '%' + UpperCase(Localiz.Text) + '%';
      QConsulta.ParamByName('STATUS').AsString      := 'A';

      QConsulta.Prepare;
      QConsulta.Open;
    end;

    if ChaveConsulta = 'ORÇAMENTO' then
    begin
      Try
      Codigo := StrToInt(Localiz.Text);

      QConsulta.Sql.Clear;
      QConsulta.Sql.Add('SELECT * FROM ORCAMENTOS');
      QConsulta.Sql.Add('WHERE');
      QConsulta.Sql.Add('(ORCAMENTO_ID = :ORCAMENTO_ID)');
      QConsulta.Sql.Add('ORDER BY DT_ORCAMENTO,NOME');

      QConsulta.ParamByName('ORCAMENTO_ID').AsInteger := Codigo;

      QConsulta.Prepare;
      QConsulta.Open;

      except

      QConsulta.Sql.Clear;
      QConsulta.Sql.Add('SELECT * FROM ORCAMENTOS');
      QConsulta.Sql.Add('WHERE');
      QConsulta.Sql.Add('(NOME LIKE :NOME)');
      QConsulta.Sql.Add('AND (TRANSACAO_ID = 0 OR TRANSACAO_ID IS NULL)');
      QConsulta.Sql.Add('ORDER BY DT_ORCAMENTO, NOME');

      QConsulta.ParamByName('NOME').AsString := '%' + UpperCase(Localiz.Text) + '%';

      QConsulta.Prepare;
      QConsulta.Open;
    end;
    TFloatField(QConsulta.FieldByName('VALOR')).DisplayFormat  := '#,##0.00';
    end;

    if ChaveConsulta = 'PEDIDO_VENDA' then
    begin
      Try
      Codigo := StrToInt(Localiz.Text);

      QConsulta.Sql.Clear;
      QConsulta.Sql.Add('SELECT * FROM PEDIDOS');
      QConsulta.Sql.Add('WHERE');
      QConsulta.Sql.Add('(PEDIDO_ID = :PEDIDO_ID)');
      QConsulta.Sql.Add('AND (TP_PEDIDO = 1)');
      QConsulta.Sql.Add('AND ((STATUS <> :STATUS) AND (STATUS <> :STATUS1))');
      QConsulta.Sql.Add('AND (TRANSACAO_ID = 0 OR TRANSACAO_ID IS NULL)');
      QConsulta.Sql.Add('ORDER BY DT_PEDIDO,NOME');

      QConsulta.ParamByName('PEDIDO_ID').AsInteger := Codigo;
      QConsulta.ParamByName('STATUS').AsString  := 'FATURADO';
      QConsulta.ParamByName('STATUS1').AsString := 'CANCELADO';

      QConsulta.Prepare;
      QConsulta.Open;

      except

      QConsulta.Sql.Clear;
      QConsulta.Sql.Add('SELECT * FROM PEDIDOS');
      QConsulta.Sql.Add('WHERE');
      QConsulta.Sql.Add('(NOME LIKE :NOME)');
      QConsulta.Sql.Add('AND (TP_PEDIDO = 1)');
      QConsulta.Sql.Add('AND ((STATUS <> :STATUS) AND (STATUS <> :STATUS1))');
      QConsulta.Sql.Add('AND (TRANSACAO_ID = 0 OR TRANSACAO_ID IS NULL)');
      QConsulta.Sql.Add('ORDER BY DT_PEDIDO, NOME');

      QConsulta.ParamByName('NOME').AsString    := '%' + UpperCase(Localiz.Text) + '%';
      QConsulta.ParamByName('STATUS').AsString  := 'FATURADO';
      QConsulta.ParamByName('STATUS1').AsString := 'CANCELADO';

      QConsulta.Prepare;
      QConsulta.Open;
    end;
    TFloatField(QConsulta.FieldByName('VALOR')).DisplayFormat  := '#,##0.00';
    end;

    if ChaveConsulta = 'ORDEM_SERVICO' then
    begin
      Try
      Codigo := StrToInt(Localiz.Text);

      QConsulta.Sql.Clear;
      QConsulta.Sql.Add('SELECT * FROM ORDEM_SERVICO');
      QConsulta.Sql.Add('WHERE');
      QConsulta.Sql.Add('(ORDEM_ID = :ORDEM_ID)');
      QConsulta.Sql.Add('AND (STATUS = :STATUS)');
      QConsulta.Sql.Add('AND (TRANSACAO_ID = 0 OR TRANSACAO_ID IS NULL)');
      QConsulta.Sql.Add('ORDER BY DT_FECHAMENTO,NOME_CLIENTE');

      QConsulta.ParamByName('ORDEM_ID').AsInteger := Codigo;
      QConsulta.ParamByName('STATUS').AsString  := 'EXECUTADA';


      QConsulta.Prepare;
      QConsulta.Open;

      except


      QConsulta.Sql.Clear;
      QConsulta.Sql.Add('SELECT * FROM ORDEM_SERVICO');
      QConsulta.Sql.Add('WHERE');
      QConsulta.Sql.Add('(NOME_CLIENTE LIKE :NOME)');
      QConsulta.Sql.Add('AND (STATUS = :STATUS)');
      QConsulta.Sql.Add('AND (TRANSACAO_ID = 0 OR TRANSACAO_ID IS NULL)');
      QConsulta.Sql.Add('ORDER BY DT_FECHAMENTO, NOME_CLIENTE');

      QConsulta.ParamByName('NOME').AsString   := '%' + UpperCase(Localiz.Text) + '%';
      QConsulta.ParamByName('STATUS').AsString := 'EXECUTADA';

      QConsulta.Prepare;
      QConsulta.Open;
    end;
    TFloatField(QConsulta.FieldByName('VALOR')).DisplayFormat  := '#,##0.00';
    end;



    if ChaveConsulta = 'PAISES' then
    begin
      QConsulta.Sql.Clear;
      QConsulta.Sql.Add('SELECT * FROM PAISES');
      QConsulta.Sql.Add('WHERE');
      QConsulta.Sql.Add('(DESCRICAO LIKE :DESCRICAO)');
      QConsulta.Sql.Add('ORDER BY DESCRICAO');

      QConsulta.ParamByName('DESCRICAO').AsString := '%' + UpperCase(Localiz.Text) + '%';

      QConsulta.Prepare;
      QConsulta.Open;
    end;

    if ChaveConsulta = 'PATRIMÔNIO' then
    begin
      QConsulta.Sql.Clear;
      QConsulta.Sql.Add('SELECT * FROM PATRIMONIO');
      QConsulta.Sql.Add('WHERE');
      QConsulta.Sql.Add('(DESCRICAO LIKE :DESCRICAO)');
      QConsulta.Sql.Add('AND (STATUS = :STATUS)');
      QConsulta.Sql.Add('ORDER BY DESCRICAO');

      QConsulta.ParamByName('DESCRICAO').AsString := '%' + UpperCase(Localiz.Text) + '%';
      QConsulta.ParamByName('STATUS').AsString    := 'A';

      QConsulta.Prepare;
      QConsulta.Open;
    end;

    if ChaveConsulta = 'PEDIDO' then
    begin
      Try
      Codigo := StrToInt(Localiz.Text);

      QConsulta.Sql.Clear;
      QConsulta.Sql.Add('SELECT * FROM PEDIDOS');
      QConsulta.Sql.Add('WHERE');
      QConsulta.Sql.Add('(PEDIDO_ID = :PEDIDO_ID)');
      QConsulta.Sql.Add('AND (TP_PEDIDO = 0)');
      QConsulta.Sql.Add('AND ((STATUS <> :STATUS) AND (STATUS <> :STATUS1))');
      QConsulta.Sql.Add('AND (TRANSACAO_ID = 0 OR TRANSACAO_ID IS NULLL)');
      QConsulta.Sql.Add('ORDER BY DT_PEDIDO,NOME');

      QConsulta.ParamByName('PEDIDO_ID').AsInteger := Codigo;
      QConsulta.ParamByName('STATUS').AsString  := 'RECEBIDO';
      QConsulta.ParamByName('STATUS1').AsString := 'CANCELADO';

      QConsulta.Prepare;
      QConsulta.Open;

      except

      QConsulta.Sql.Clear;
      QConsulta.Sql.Add('SELECT * FROM PEDIDOS');
      QConsulta.Sql.Add('WHERE');
      QConsulta.Sql.Add('(NOME LIKE :NOME)');
      QConsulta.Sql.Add('AND (TP_PEDIDO = 0)');
      QConsulta.Sql.Add('AND ((STATUS <> :STATUS) AND (STATUS <> :STATUS1))');
      QConsulta.Sql.Add('AND (TRANSACAO_ID = 0 OR TRANSACAO_ID IS NULL)');
      QConsulta.Sql.Add('ORDER BY NOME');

      QConsulta.ParamByName('NOME').AsString    := '%' + UpperCase(Localiz.Text) + '%';
      QConsulta.ParamByName('STATUS').AsString  := 'RECEBIDO';
      QConsulta.ParamByName('STATUS1').AsString := 'CANCELADO';

      QConsulta.Prepare;
      QConsulta.Open;
    end;
    TFloatField(QConsulta.FieldByName('VALOR')).DisplayFormat  := '#,##0.00';
    end;

    if ChaveConsulta = 'PESSOAL' then
    begin
      QConsulta.Sql.Clear;
      QConsulta.Sql.Add('SELECT * FROM FUNCIONARIOS');
      QConsulta.Sql.Add('WHERE');
      QConsulta.Sql.Add('(NOME LIKE :NOME)');
      QConsulta.Sql.Add('AND (STATUS = :STATUS)');
      QConsulta.Sql.Add('ORDER BY NOME');

      QConsulta.ParamByName('NOME').AsString   := '%' + UpperCase(Localiz.Text) + '%';
      QConsulta.ParamByName('STATUS').AsString := 'A';

      QConsulta.Prepare;
      QConsulta.Open;
    end;

    if ChaveConsulta = 'SERVIÇOS' then
    begin
      QConsulta.Sql.Clear;
      QConsulta.Sql.Add('SELECT * FROM SERVICOS');
      QConsulta.Sql.Add('WHERE');
      QConsulta.Sql.Add('(DESCRICAO LIKE :DESCRICAO)');
      QConsulta.Sql.Add('AND (STATUS = :STATUS)');
      QConsulta.Sql.Add('ORDER BY DESCRICAO');

      QConsulta.ParamByName('DESCRICAO').AsString := '%' + UpperCase(Localiz.Text) + '%';
      QConsulta.ParamByName('STATUS').AsString    := 'A';

      QConsulta.Prepare;
      QConsulta.Open;

      TFloatField(QConsulta.FieldByName('PRECO')).DisplayFormat  := '#,##0.00';
    end;

    if ChaveConsulta = 'SUBTIPOS' then
    begin
      QConsulta.Sql.Clear;
      QConsulta.Sql.Add('SELECT * FROM TABELAS');
      QConsulta.Sql.Add('WHERE');
      QConsulta.Sql.Add('(TIPO_TABELA = :TIPO_TABELA)');
      QConsulta.Sql.Add('AND (DESCRICAO LIKE :DESCRICAO)');
      QConsulta.Sql.Add('AND (STATUS = :STATUS)');
      QConsulta.Sql.Add('ORDER BY DESCRICAO');

      QConsulta.ParamByName('TIPO_TABELA').AsString := '5';
      QConsulta.ParamByName('DESCRICAO').AsString   := '%' + UpperCase(Localiz.Text) + '%';
      QConsulta.ParamByName('STATUS').AsString      := 'A';

      QConsulta.Prepare;
      QConsulta.Open;
    end;

    if (ChaveConsulta = 'TRANS_COMPRA') or (ChaveConsulta = 'TRANS_VENDA') then
    begin
      QConsulta.Sql.Clear;
      QConsulta.Sql.Add('SELECT * FROM TRANSACOES');
      QConsulta.Sql.Add('WHERE');
      QConsulta.Sql.Add('((HISTORICO LIKE :HISTORICO) OR (NUM_DOC = :NUM_DOC))');
      QConsulta.Sql.Add('AND (CONDUTA = :CONDUTA)');
      QConsulta.Sql.Add('AND (DEPTO = :DEPTO)');
      QConsulta.Sql.Add('AND (TPCTB = :TPCTB)');
      QConsulta.Sql.Add('AND (EMPRESA_ID = :EMPRESA_ID)');

      if (Forn > 0) and (ChaveConsulta = 'TRANS_COMPRA') then
        QConsulta.Sql.Add('AND (FORNECEDOR_ID = :FORNECEDOR_ID)');

      if (Forn > 0) and (ChaveConsulta = 'TRANS_VENDA') then
        QConsulta.Sql.Add('AND (CLIENTE_ID = :CLIENTE_ID)');

      QConsulta.Sql.Add('ORDER BY HISTORICO');

      QConsulta.ParamByName('HISTORICO').AsString := '%' + UpperCase(Localiz.Text) + '%';
      QConsulta.ParamByName('NUM_DOC').AsString   := Copy(Localiz.Text, 1, 7);

      if ChaveConsulta = 'TRANS_COMPRA' then
        QConsulta.ParamByName('CONDUTA').AsString := '02'
      else
        QConsulta.ParamByName('CONDUTA').AsString := '01';

      QConsulta.ParamByName('DEPTO').AsString       := '07';
      QConsulta.ParamByName('TPCTB').AsString       := FrmData.QAcesso.FieldByName('TPCTB').AsString;
      QConsulta.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;

      if (Forn > 0) and (ChaveConsulta = 'TRANS_COMPRA') then
        QConsulta.ParamByName('FORNECEDOR_ID').AsInteger := Forn;

      if (Forn > 0) and (ChaveConsulta = 'TRANS_VENDA') then
        QConsulta.ParamByName('CLIENTE_ID').AsInteger := Forn;

      QConsulta.Prepare;
      QConsulta.Open;
    end;

    if ChaveConsulta = 'TRIBUTOS' then
    begin
      QConsulta.Sql.Clear;
      QConsulta.Sql.Add('SELECT * FROM TRIBUTOS');
      QConsulta.Sql.Add('WHERE');
      QConsulta.Sql.Add('(DESCRICAO LIKE :DESCRICAO)');
      QConsulta.Sql.Add('ORDER BY DESCRICAO');

      QConsulta.ParamByName('DESCRICAO').AsString := '%' + UpperCase(Localiz.Text) + '%';

      QConsulta.Prepare;
      QConsulta.Open;
    end;

    Perform(Wm_NextDlgctl, 0, 0);
  end;
end;

procedure TFrmConsulta.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
 VAR
 OldBkMode: Integer;
 begin
     DBGrid1.Canvas.Brush.Color := clInfoBk;

  if QConsulta.FieldByName('STATUS').AsString = 'D' then
      TDBGrid(Sender).Canvas.Font.Color := clgreen
      else
      TDBGrid(Sender).Canvas.Font.Color := clRed;

//      if gdSelected in State then
// begin
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color := clYellow;

      FillRect(Rect);

      Brush.Color := clYellow;
      OldBkMode   := SetBkMode(Handle, TRANSPARENT);

      SetBkMode(Handle, OldBkMode);

      Font.Style := [fsBold];
    end;
 // end;

  TDBGrid(Sender).DefaultDrawDataCell(Rect, TDBGrid(Sender).Columns[DataCol].Field, State);
end;





procedure TFrmConsulta.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
Pedido_Venda,Orcamento:real;
begin
  if ChaveConsulta = 'ESTOQUE' then
  begin
    FrmDetalhes_Produto.Label5.Caption := QProdutos.FieldByName('COD_ORIGINAL').AsString;
    FrmDetalhes_Produto.Label6.Caption := QProdutos.FieldByName('MARCA').AsString;
    FrmDetalhes_Produto.Label7.Caption := QProdutos.FieldByName('MODELO_POSICAO').AsString;
    FrmDetalhes_Produto.Label8.Caption := QProdutos.FieldByName('APLICACAO').AsString;

    Label3.Visible := False;

    if FrmPrincipal.Config.FieldByName('CALC_EST_PED_VDA').AsString = 'True' then
    Begin
      QPedidoVenda.Sql.Clear;
      QPedidoVenda.Sql.Add('SELECT (CASE WHEN SUM(QUANTIDADE) IS NULL THEN 0 ELSE SUM(QUANTIDADE) END) QTD_PEDIDOVDA ');
      QPedidoVenda.Sql.Add('FROM PEDITENS');
      QPedidoVenda.Sql.Add('INNER JOIN PEDIDOS ON PEDIDOS.PEDIDO_ID = PEDITENS.PEDIDO_ID');
      QPedidoVenda.Sql.Add('WHERE');
      QPedidoVenda.Sql.Add('(PRODUTO_ID = :PRODUTO_ID)');
      QPedidoVenda.Sql.Add('AND (TP_PROD_SERV = :TP_PROD_SERV)');
      QPedidoVenda.Sql.Add('AND (TP_PEDIDO = 1)');
      QPedidoVenda.Sql.Add('AND ((PEDIDOS.STATUS <> :STATUS) AND (PEDIDOS.STATUS <> :STATUS1))');
      QPedidoVenda.Sql.Add('GROUP BY PEDITENS.PRODUTO_ID');

      QPedidoVenda.ParamByName('PRODUTO_ID').AsInteger  := QProdutos.FieldByName('PRODUTO_ID').AsInteger;
      QPedidoVenda.ParamByName('TP_PROD_SERV').AsString := 'P';
      QPedidoVenda.ParamByName('STATUS').AsString       := 'CANCELADO';
      QPedidoVenda.ParamByName('STATUS1').AsString       := 'FATURADO';

      QPedidoVenda.Prepare;
      QPedidoVenda.Open;

      Pedido_venda := QPedidoVenda.FieldByName('QTD_PEDIDOVDA').AsFloat;
      Orcamento    := 0;
    End
    Else
    Begin
      QOrcamento.Sql.Clear;
      QOrcamento.Sql.Add('SELECT (CASE WHEN SUM(QUANTIDADE) IS NULL THEN 0 ELSE SUM(QUANTIDADE) END) QTD_ORCAMENTO');
      QOrcamento.Sql.Add('FROM ORCITENS');
      QOrcamento.Sql.Add('INNER JOIN ORCAMENTOS');
      QOrcamento.Sql.Add('ON (ORCITENS.ORCAMENTO_ID = ORCAMENTOS.ORCAMENTO_ID)');
      QOrcamento.Sql.Add('WHERE');
      QOrcamento.Sql.Add('(ORCITENS.PRODUTO_ID = :PRODUTO_ID)');
      QOrcamento.Sql.Add('AND (ORCITENS.TP_PROD_SERV = :TP_PROD_SERV)');
      QOrcamento.Sql.Add('AND (ORCAMENTOS.TRANSACAO_ID = 0 OR ORCAMENTOS.TRANSACAO_ID IS NULL)');
      QOrcamento.Sql.Add('AND (ORCAMENTOS.DT_MOVIMENTO = :DT_MOVIMENTO)');

      QOrcamento.ParamByName('PRODUTO_ID').AsInteger    := QProdutos.FieldByName('PRODUTO_ID').AsInteger;
      QOrcamento.ParamByName('TP_PROD_SERV').AsString   := 'P';
      QOrcamento.ParamByName('DT_MOVIMENTO').AsDateTime := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;

      QOrcamento.Prepare;
      QOrcamento.Open;
      Pedido_venda := 0;
      Orcamento    := QOrcamento.FieldByName('QTD_ORCAMENTO').AsFloat;
    End;

    QOrdem.Sql.Clear;
    QOrdem.Sql.Add('SELECT (CASE WHEN SUM(QUANTIDADE) IS NULL THEN 0 ELSE SUM(QUANTIDADE) END) QTD_ORDEM');
    QOrdem.Sql.Add('FROM ORDEM_ITENS');
    QOrdem.Sql.Add('INNER JOIN ORDEM_SERVICO');
    QOrdem.Sql.Add('ON (ORDEM_ITENS.ORDEM_ID = ORDEM_SERVICO.ORDEM_ID)');
    QOrdem.Sql.Add('WHERE');
    QOrdem.Sql.Add('(ORDEM_ITENS.CODIGO_ITEM = :PRODUTO_ID)');
    QOrdem.Sql.Add('AND (ORDEM_ITENS.TP_PROD_SERV = :TP_PROD_SERV)');
    QOrdem.Sql.Add('AND ((ORDEM_SERVICO.STATUS <> :EXECUTADA) AND (ORDEM_SERVICO.STATUS <> :ENTREGUE) AND (ORDEM_SERVICO.STATUS <> :FATURADO)) ');

    QOrdem.ParamByName('PRODUTO_ID').AsInteger  := QProdutos.FieldByName('PRODUTO_ID').AsInteger;
    QOrdem.ParamByName('TP_PROD_SERV').AsString := 'P';
    QOrdem.ParamByName('ENTREGUE').AsString     := 'ENTREGUE';
    QOrdem.ParamByName('EXECUTADA').AsString    := 'EXECUTADA';
    QOrdem.ParamByName('FATURADO').AsString     := 'FATURADO';



    QOrdem.Prepare;
    QOrdem.Open;

    QPedido.Sql.Clear;
    QPedido.Sql.Add('SELECT (CASE WHEN SUM(QUANTIDADE) IS NULL THEN 0 ELSE SUM(QUANTIDADE) END) QTD_PEDIDO');
    QPedido.Sql.Add('FROM PEDITENS');
    QPedido.Sql.Add('INNER JOIN PEDIDOS ON PEDIDOS.PEDIDO_ID = PEDITENS.PEDIDO_ID');
    QPedido.Sql.Add('WHERE');
    QPedido.Sql.Add('(PRODUTO_ID = :PRODUTO_ID)');
    QPedido.Sql.Add('AND (TP_PROD_SERV = :TP_PROD_SERV)');
    QPedido.Sql.Add('AND (TP_PEDIDO = 0)');
    QPedido.Sql.Add('AND (PEDITENS.IMPORTADO = :IMPORTADO)');
    QPedido.Sql.Add('GROUP BY PEDITENS.PRODUTO_ID');


    QPedido.ParamByName('PRODUTO_ID').AsInteger  := QProdutos.FieldByName('PRODUTO_ID').AsInteger;
    QPedido.ParamByName('TP_PROD_SERV').AsString := 'P';
    QPedido.ParamByName('IMPORTADO').AsString    := 'N';

    QPedido.Prepare;
    QPedido.Open;

    QPedido1.Sql.Clear;
    QPedido1.Sql.Add('SELECT (CASE WHEN SUM(QUANTIDADE) IS NULL THEN 0 ELSE SUM(QUANTIDADE) END) QTD_PEDIDO, PEDIDOS.DT_ENTREGA');
    QPedido1.Sql.Add('FROM PEDITENS');
    QPedido1.Sql.Add('INNER JOIN PEDIDOS ON PEDIDOS.PEDIDO_ID = PEDITENS.PEDIDO_ID');
    QPedido1.Sql.Add('WHERE');
    QPedido1.Sql.Add('(PRODUTO_ID = :PRODUTO_ID)');
    QPedido1.Sql.Add('AND (TP_PROD_SERV = :TP_PROD_SERV)');
    QPedido1.Sql.Add('AND (TP_PEDIDO = 0)');
    QPedido1.Sql.Add('AND (PEDITENS.IMPORTADO = :IMPORTADO)');
    QPedido1.Sql.Add('AND (PEDIDOS.STATUS <> :STATUS)');
    QPedido1.Sql.Add('GROUP BY PEDIDOS.DT_ENTREGA');
    QPedido1.Sql.Add('ORDER BY PEDIDOS.DT_ENTREGA');

    QPedido1.ParamByName('PRODUTO_ID').AsInteger  := QProdutos.FieldByName('PRODUTO_ID').AsInteger;
    QPedido1.ParamByName('TP_PROD_SERV').AsString := 'P';
    QPedido1.ParamByName('IMPORTADO').AsString    := 'N';
    QPedido1.ParamByName('STATUS').AsString       := 'CANCELADO';


    QPedido1.Prepare;
    QPedido1.Open;


    if (Orcamento > 0) OR (Pedido_Venda > 0) OR (QPedido.FieldByName('QTD_PEDIDO').AsFloat > 0) OR
       (QOrdem.FieldByName('QTD_ORDEM').AsFloat > 0)then
    begin
      Label3.Visible := True;

      if FrmData.QAcesso.FieldByName('TPCTB').AsString = '2' then
      Begin
        if FrmPrincipal.Config.FieldByName('CALC_EST_PED_VDA').AsString = 'True' then
        Begin
        Label3.Caption := 'Estoque Atual: ' + FormatFloat('#,##0.00', QProdutos.FieldByName('QUANTIDADE_C').AsFloat) +
                          ' - Pedido de Venda: ' + FormatFloat('#,##0.00', QPedidoVenda.FieldByName('QTD_PEDIDOVDA').AsFloat) +
                          ' - Ordem de Serviço: ' + FormatFloat('#,##0.00', QOrdem.FieldByName('QTD_ORDEM').AsFloat) +
                          ' = Est. Disponível: ' + FormatFloat('#,##0.00', (QProdutos.FieldByName('QUANTIDADE_C').AsFloat  - (QPedidoVenda.FieldByName('QTD_PEDIDOVDA').AsFloat + QOrdem.FieldByName('QTD_ORDEM').AsFloat)));
       if QPedido1.FieldByName('DT_ENTREGA').AsDateTime <> StrToDate('30/12/1899')  then
       Label3.caption := Label3.Caption + ' (Pedidos: ' + FormatFloat('#,##0.00', QPedido.FieldByName('QTD_PEDIDO').AsFloat) +  ' Previsão de entrega Pedido: ' + DateToStr(QPedido1.FieldByName('DT_ENTREGA').AsDateTime) + ')';
        End
        Else
        Begin
        Label3.Caption := 'Estoque Atual: ' + FormatFloat('#,##0.00', QProdutos.FieldByName('QUANTIDADE_C').AsFloat) +
                          ' - Orçamentos: ' + FormatFloat('#,##0.00', QOrcamento.FieldByName('QTD_ORCAMENTO').AsFloat) +
                          ' = Est. Disponível: ' + FormatFloat('#,##0.00', (QProdutos.FieldByName('QUANTIDADE_C').AsFloat - QOrcamento.FieldByName('QTD_ORCAMENTO').AsFloat));
       if QPedido1.FieldByName('DT_ENTREGA').AsDateTime <> StrToDate('30/12/1899')  then
        Label3.caption := Label3.Caption + ' (Pedidos: ' + FormatFloat('#,##0.00', QPedido.FieldByName('QTD_PEDIDO').AsFloat) +  ' Previsão de entrega Pedido: ' + DateToStr(QPedido1.FieldByName('DT_ENTREGA').AsDateTime) + ')';
        End;
      End
        Else
        Begin
        if FrmPrincipal.Config.FieldByName('CALC_EST_PED_VDA').AsString = 'True' then
        Begin
        Label3.Caption := 'Estoque Atual: ' + FormatFloat('#,##0.00', QProdutos.FieldByName('QUANTIDADE_G').AsFloat) +
                          ' - Pedido de Venda: ' + FormatFloat('#,##0.00', QPedidoVenda.FieldByName('QTD_PEDIDOVDA').AsFloat) +
                          ' - Ordem de Serviço: ' + FormatFloat('#,##0.00', QOrdem.FieldByName('QTD_ORDEM').AsFloat) +
                          ' = Est. Disponível: ' + FormatFloat('#,##0.00', (QProdutos.FieldByName('QUANTIDADE_G').AsFloat - (QPedidoVenda.FieldByName('QTD_PEDIDOVDA').AsFloat + QOrdem.FieldByName('QTD_ORDEM').AsFloat)));
        if QPedido1.FieldByName('DT_ENTREGA').AsDateTime <> StrToDate('30/12/1899') then
         Label3.caption := Label3.Caption + ' (Pedidos: ' + FormatFloat('#,##0.00', QPedido.FieldByName('QTD_PEDIDO').AsFloat) +  ' Previsão de entrega Pedido: ' + DateToStr(QPedido1.FieldByName('DT_ENTREGA').AsDateTime) + ')';
        End
        Else
        Begin
        Label3.Caption := 'Estoque Atual: ' + FormatFloat('#,##0.00', QProdutos.FieldByName('QUANTIDADE_G').AsFloat) +
                          ' - Orçamentos: ' + FormatFloat('#,##0.00', QOrcamento.FieldByName('QTD_ORCAMENTO').AsFloat) +
                          ' = Est. Disponível: ' + FormatFloat('#,##0.00', (QProdutos.FieldByName('QUANTIDADE_G').AsFloat - QOrcamento.FieldByName('QTD_ORCAMENTO').AsFloat));
        if QPedido1.FieldByName('DT_ENTREGA').AsDateTime <> StrToDate('30/12/1899') then
         Label3.caption := Label3.Caption + ' (Pedidos: ' + FormatFloat('#,##0.00', QPedido.FieldByName('QTD_PEDIDO').AsFloat) +  ' Previsão de entrega Pedido: ' + DateToStr(QPedido1.FieldByName('DT_ENTREGA').AsDateTime) + ')';
        End;
        End;
    end;

    if Key = VK_F6 then
      Ficha_Produto(QProdutos.FieldByName('PRODUTO_ID').AsInteger);
  end;

  if ChaveConsulta = 'CLIENTES' then
  begin
    FrmDetalhes_Cliente.Label5.Caption  := QConsulta.FieldByName('FANTASIA').AsString;
    FrmDetalhes_Cliente.Label6.Caption  := QConsulta.FieldByName('INSCRICAO').AsString;
    FrmDetalhes_Cliente.Label7.Caption  := QConsulta.FieldByName('ENDERECO').AsString + ', ' + QConsulta.FieldByName('NUMERO').AsString;
    FrmDetalhes_Cliente.Label8.Caption  := QConsulta.FieldByName('BAIRRO').AsString;
    FrmDetalhes_Cliente.Label10.Caption := QConsulta.FieldByName('CEP').AsString;
    FrmDetalhes_Cliente.Label12.Caption := Copy(QConsulta.FieldByName('OBSERVACAO').AsString,1,75);
    FrmDetalhes_Cliente.Label13.Caption := Copy(QConsulta.FieldByName('OBSERVACAO').AsString,76,75);
  end;
end;

procedure TFrmConsulta.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    ModalResult := mrCancel;

  if (Key = #13) and (not TBDEDataSet(FrmConsulta.DataConsulta.DataSet).IsEmpty) then
    ModalResult := mrOK;
end;

procedure TFrmConsulta.FormCreate(Sender: TObject);
begin
  if ChaveConsulta = 'ESTOQUE' then
    DataConsulta.DataSet := QProdutos
  else
    DataConsulta.DataSet := QConsulta;
end;

procedure TFrmConsulta.FormShow(Sender: TObject);
begin
  DBGrid1.Columns.Clear;

  if ChaveConsulta = 'BANCOS' then
  begin
    QConsulta.Sql.Clear;
    QConsulta.Sql.Add('SELECT * FROM BANCOS');
    QConsulta.Sql.Add('WHERE');
    QConsulta.Sql.Add('(STATUS = :STATUS)');
    QConsulta.Sql.Add('ORDER BY DESCRICAO');

    QConsulta.ParamByName('STATUS').AsString := 'A';

    QConsulta.Prepare;
    QConsulta.Open;
  end;

  if ChaveConsulta = 'CARGOS' then
  begin
    QConsulta.Sql.Clear;
    QConsulta.Sql.Add('SELECT * FROM TABELAS');
    QConsulta.Sql.Add('WHERE');
    QConsulta.Sql.Add('(TIPO_TABELA = :TIPO_TABELA)');
    QConsulta.Sql.Add('AND (STATUS = :STATUS)');
    QConsulta.Sql.Add('ORDER BY DESCRICAO');

    QConsulta.ParamByName('TIPO_TABELA').AsString := '6';
    QConsulta.ParamByName('STATUS').AsString      := 'A';

    QConsulta.Prepare;
    QConsulta.Open;
  end;

  if ChaveConsulta = 'CCUSTO' then
  begin
    QConsulta.Sql.Clear;
    QConsulta.Sql.Add('SELECT * FROM TABELAS');
    QConsulta.Sql.Add('WHERE');
    QConsulta.Sql.Add('(TIPO_TABELA = :TIPO_TABELA)');
    QConsulta.Sql.Add('AND (STATUS = :STATUS)');
    QConsulta.Sql.Add('ORDER BY DESCRICAO');

    QConsulta.ParamByName('TIPO_TABELA').AsString := '2';
    QConsulta.ParamByName('STATUS').AsString      := 'A';

    QConsulta.Prepare;
    QConsulta.Open;
  end;

  if ChaveConsulta = 'COMP_PRODUTO' then
  begin
    QConsulta.Sql.Clear;
    QConsulta.Sql.Add('SELECT DISTINCT COMPOSICAO_ID, NOME_COMP FROM COMP_PRODUTO');
    QConsulta.Sql.Add('ORDER BY NOME_COMP');

    QConsulta.Prepare;
    QConsulta.Open;
  end;

  if ChaveConsulta = 'EMPRESAS' then
  begin
    QConsulta.Sql.Clear;
    QConsulta.Sql.Add('SELECT * FROM EMPRESAS');
    QConsulta.Sql.Add('WHERE');
    QConsulta.Sql.Add('(STATUS = :STATUS)');
    QConsulta.Sql.Add('ORDER BY RAZAO');

    QConsulta.ParamByName('STATUS').AsString := 'A';

    QConsulta.Prepare;
    QConsulta.Open;
  end;

  if (ChaveConsulta = 'ESTOQUE') and (Forn > 0) then
  begin
    QProdutos.Sql.Clear;
    QProdutos.Sql.Add('SELECT * FROM PRODUTOS');
    QProdutos.Sql.Add('WHERE');
    QProdutos.Sql.Add('(FORNECEDOR_ID = :FORNECEDOR_ID)');

    if Emp > 0 then
    begin
      QProdutos.Sql.Add('AND (EMPRESA_ID = :EMPRESA_ID)');
      QProdutos.ParamByName('EMPRESA_ID').AsInteger := Emp;
    end;

    if StrToInt(LeIni(Arq_Ini, 'Sistema', 'Localização')) > 0 then
    begin
      QProdutos.Sql.Add('AND (LOCALIZACAO_ID = :LOCALIZACAO_ID)');

      QProdutos.ParamByName('LOCALIZACAO_ID').AsInteger := StrToInt(LeIni(Arq_Ini, 'Sistema', 'Localização'));
    end;

    QProdutos.Sql.Add('AND (STATUS = :STATUS)');
    QProdutos.Sql.Add('ORDER BY DESCRICAO');

    QProdutos.ParamByName('FORNECEDOR_ID').AsInteger := Forn;
    QProdutos.ParamByName('STATUS').AsString         := 'A';

    QProdutos.Prepare;
    QProdutos.Open;
  end;

  if ChaveConsulta = 'FAMÍLIA' then
  begin
    QConsulta.Sql.Clear;
    QConsulta.Sql.Add('SELECT * FROM TABELAS');
    QConsulta.Sql.Add('WHERE');
    QConsulta.Sql.Add('(TIPO_TABELA = :TIPO_TABELA)');
    QConsulta.Sql.Add('AND (STATUS = :STATUS)');
    QConsulta.Sql.Add('ORDER BY DESCRICAO');

    QConsulta.ParamByName('TIPO_TABELA').AsString := 'F';
    QConsulta.ParamByName('STATUS').AsString      := 'A';

    QConsulta.Prepare;
    QConsulta.Open;
  end;

  if ChaveConsulta = 'FLUXO_CAIXA' then
  begin
    QConsulta.Sql.Clear;
    QConsulta.Sql.Add('SELECT * FROM FLUXO_CAIXA');
    QConsulta.Sql.Add('ORDER BY DESCRICAO');

    QConsulta.Prepare;
    QConsulta.Open;
  end;

  if ChaveConsulta = 'FORMAS' then
  begin
    QConsulta.Sql.Clear;
    QConsulta.Sql.Add('SELECT * FROM FINALIZADORAS');
    QConsulta.Sql.Add('ORDER BY LEGENDA');

    QConsulta.Prepare;
    QConsulta.Open;
  end;

  if ChaveConsulta = 'GENEROS' then
  begin
    QConsulta.Sql.Clear;
    QConsulta.Sql.Add('SELECT * FROM GENERO_PRODUTOS');
    QConsulta.Sql.Add('ORDER BY CODIGO');

    QConsulta.Prepare;
    QConsulta.Open;
  end;

  if ChaveConsulta = 'GRUPOS' then
  begin
    QConsulta.Sql.Clear;
    QConsulta.Sql.Add('SELECT * FROM TABELAS');
    QConsulta.Sql.Add('WHERE');
    QConsulta.Sql.Add('(TIPO_TABELA = :TIPO_TABELA)');
    QConsulta.Sql.Add('AND (STATUS = :STATUS)');
    QConsulta.Sql.Add('ORDER BY DESCRICAO');

    QConsulta.ParamByName('TIPO_TABELA').AsString := '7';
    QConsulta.ParamByName('STATUS').AsString      := 'A';

    QConsulta.Prepare;
    QConsulta.Open;
  end;

  if ChaveConsulta = 'LOCAIS' then
  begin
    QConsulta.Sql.Clear;
    QConsulta.Sql.Add('SELECT * FROM TABELAS');
    QConsulta.Sql.Add('WHERE');
    QConsulta.Sql.Add('(TIPO_TABELA = :TIPO_TABELA)');
    QConsulta.Sql.Add('AND (STATUS = :STATUS)');
    QConsulta.Sql.Add('ORDER BY DESCRICAO');

    QConsulta.ParamByName('TIPO_TABELA').AsString := '8';
    QConsulta.ParamByName('STATUS').AsString      := 'A';

    QConsulta.Prepare;
    QConsulta.Open;
  end;

  if ChaveConsulta = 'PAISES' then
  begin
    QConsulta.Sql.Clear;
    QConsulta.Sql.Add('SELECT * FROM PAISES');
    QConsulta.Sql.Add('ORDER BY DESCRICAO');

    QConsulta.Prepare;
    QConsulta.Open;
  end;

  if ChaveConsulta = 'PLANO' then
  begin
    QConsulta.Sql.Clear;
    QConsulta.Sql.Add('SELECT * FROM PLANO');
    QConsulta.Sql.Add('WHERE');
    QConsulta.Sql.Add('(CHAVE LIKE :CHAVE1 OR CHAVE IS NULL OR CHAVE = :CHAVE2)');
    QConsulta.Sql.Add('ORDER BY DESCRICAO,CODIGO');

    QConsulta.ParamByName('CHAVE1').AsString := 'A%';
    QConsulta.ParamByName('CHAVE2').AsString := '';

    QConsulta.Prepare;
    QConsulta.Open;
  end;

  if ChaveConsulta = 'SERVIÇOS' then
  begin
    QConsulta.Sql.Clear;
    QConsulta.Sql.Add('SELECT * FROM SERVICOS');
    QConsulta.Sql.Add('WHERE');
    QConsulta.Sql.Add('(STATUS = :STATUS)');
    QConsulta.Sql.Add('ORDER BY DESCRICAO');

    QConsulta.ParamByName('STATUS').AsString := 'A';

    QConsulta.Prepare;
    QConsulta.Open;
  end;

  if ChaveConsulta = 'SUBTIPOS' then
  begin
    QConsulta.Sql.Clear;
    QConsulta.Sql.Add('SELECT * FROM TABELAS');
    QConsulta.Sql.Add('WHERE');
    QConsulta.Sql.Add('(TIPO_TABELA = :TIPO_TABELA)');
    QConsulta.Sql.Add('AND (STATUS = :STATUS)');
    QConsulta.Sql.Add('ORDER BY DESCRICAO');

    QConsulta.ParamByName('TIPO_TABELA').AsString := '5';
    QConsulta.ParamByName('STATUS').AsString      := 'A';

    QConsulta.Prepare;
    QConsulta.Open;
  end;

  if ChaveConsulta = 'TRIBUTOS' then
  begin
    QConsulta.Sql.Clear;
    QConsulta.Sql.Add('SELECT * FROM TRIBUTOS');
    QConsulta.Sql.Add('ORDER BY DESCRICAO');

    QConsulta.Prepare;
    QConsulta.Open;
  end;

  if ChaveConsulta = 'BANCOS' then
  begin
    FrmConsulta.Width := 471;

    DBGrid1.Columns.Add;
    DBGrid1.Columns.Add;

    DBGrid1.Columns[0].FieldName := 'BANCO_ID';
    DBGrid1.Columns[1].FieldName := 'DESCRICAO';

    DBGrid1.Columns[0].Title.Caption := 'Código';
    DBGrid1.Columns[1].Title.Caption := 'Descrição';

    DBGrid1.Columns[0].Width := 64;
    DBGrid1.Columns[1].Width := 368;

    DBGrid1.Columns[0].Title.Alignment := taRightJustify;
    DBGrid1.Columns[1].Title.Alignment := taLeftJustify;
  end;

  if ChaveConsulta = 'COMP_PRODUTO' then
  begin
    FrmConsulta.Width := 471;

    DBGrid1.Columns.Add;
    DBGrid1.Columns.Add;

    DBGrid1.Columns[0].FieldName := 'COMPOSICAO_ID';
    DBGrid1.Columns[1].FieldName := 'NOME_COMP';

    DBGrid1.Columns[0].Title.Caption := 'Código';
    DBGrid1.Columns[1].Title.Caption := 'Descrição';

    DBGrid1.Columns[0].Width := 64;
    DBGrid1.Columns[1].Width := 368;

    DBGrid1.Columns[0].Title.Alignment := taRightJustify;
    DBGrid1.Columns[1].Title.Alignment := taLeftJustify;
  end;

  if (ChaveConsulta = 'CCUSTO') or (ChaveConsulta = 'CONTAS') or (ChaveConsulta = 'CONTAS_TOTAL')  or (ChaveConsulta = 'CONTASSIN') or (ChaveConsulta = 'FAMÍLIA') or
     (ChaveConsulta = 'SUBTIPOS') or (ChaveConsulta = 'CARGOS') or (ChaveConsulta = 'GRUPOS') or (ChaveConsulta = 'LOCAIS') or
     (ChaveConsulta = 'HISTORICO') then
  begin
    FrmConsulta.Width := 471;

    DBGrid1.Columns.Add;
    DBGrid1.Columns.Add;

    DBGrid1.Columns[0].FieldName := 'TABELA_ID';
    DBGrid1.Columns[1].FieldName := 'DESCRICAO';

    DBGrid1.Columns[0].Title.Caption := 'Código';
    DBGrid1.Columns[1].Title.Caption := 'Descrição';

    DBGrid1.Columns[0].Width := 64;
    DBGrid1.Columns[1].Width := 368;

    DBGrid1.Columns[0].Title.Alignment := taRightJustify;
    DBGrid1.Columns[1].Title.Alignment := taLeftJustify;
  end;

  if ChaveConsulta = 'CLIENTES' then
  begin
    FrmDetalhes_Cliente.Show;

    FrmConsulta.Width := 707;

    DBGrid1.Columns.Add;
    DBGrid1.Columns.Add;
    DBGrid1.Columns.Add;
    DBGrid1.Columns.Add;

    DBGrid1.Columns[0].FieldName := 'CLIENTE_ID';
    DBGrid1.Columns[1].FieldName := 'NOME';
    DBGrid1.Columns[2].FieldName := 'CNPJ';
    DBGrid1.Columns[3].FieldName := 'MUNICIPIO';

    DBGrid1.Columns[0].Title.Caption := 'Código';
    DBGrid1.Columns[1].Title.Caption := 'Nome';
    DBGrid1.Columns[2].Title.Caption := 'CNPJ';
    DBGrid1.Columns[3].Title.Caption := 'Município';

    DBGrid1.Columns[0].Width := 64;
    DBGrid1.Columns[1].Width := 330;
    DBGrid1.Columns[2].Width := 140;
    DBGrid1.Columns[3].Width := 126;

    DBGrid1.Columns[0].Title.Alignment := taRightJustify;
    DBGrid1.Columns[1].Title.Alignment := taLeftJustify;
    DBGrid1.Columns[2].Title.Alignment := taLeftJustify;
    DBGrid1.Columns[3].Title.Alignment := taLeftJustify;
  end;

  if ChaveConsulta = 'EMPRESAS' then
  begin
    FrmConsulta.Width := 707;

    DBGrid1.Columns.Add;
    DBGrid1.Columns.Add;
    DBGrid1.Columns.Add;
    DBGrid1.Columns.Add;

    DBGrid1.Columns[0].FieldName := 'EMPRESA_ID';
    DBGrid1.Columns[1].FieldName := 'RAZAO';
    DBGrid1.Columns[2].FieldName := 'CNPJ';
    DBGrid1.Columns[3].FieldName := 'MUNICIPIO';

    DBGrid1.Columns[0].Title.Caption := 'Código';
    DBGrid1.Columns[1].Title.Caption := 'Razão Social';
    DBGrid1.Columns[2].Title.Caption := 'CNPJ';
    DBGrid1.Columns[3].Title.Caption := 'Município';

    DBGrid1.Columns[0].Width := 64;
    DBGrid1.Columns[1].Width := 368;
    DBGrid1.Columns[0].Width := 64;
    DBGrid1.Columns[1].Width := 368;
    DBGrid1.Columns[2].Width := 108;
    DBGrid1.Columns[3].Width := 126;

    DBGrid1.Columns[0].Title.Alignment := taRightJustify;
    DBGrid1.Columns[1].Title.Alignment := taLeftJustify;
    DBGrid1.Columns[2].Title.Alignment := taLeftJustify;
    DBGrid1.Columns[3].Title.Alignment := taLeftJustify;
  end;


  if ChaveConsulta = 'OPERADOR' then
  begin
    FrmConsulta.Width := 471;

    DBGrid1.Columns.Add;
    DBGrid1.Columns.Add;



    DBGrid1.Columns[1].FieldName := 'NOME';
    DBGrid1.Columns[1].Title.Caption := 'Nome do Operador';

    DBGrid1.Columns[1].Width := 368;

    DBGrid1.Columns[1].Title.Alignment := taLeftJustify;
  end;





  if ChaveConsulta = 'FLUXO_CAIXA' then
  begin
    FrmConsulta.Width := 471;

    DBGrid1.Columns.Add;
    DBGrid1.Columns.Add;

    DBGrid1.Columns[0].FieldName := 'FLUXO_CAIXA_ID';
    DBGrid1.Columns[1].FieldName := 'DESCRICAO';

    DBGrid1.Columns[0].Title.Caption := 'Código';
    DBGrid1.Columns[1].Title.Caption := 'Descrição';

    DBGrid1.Columns[0].Width := 64;
    DBGrid1.Columns[1].Width := 368;

    DBGrid1.Columns[0].Title.Alignment := taRightJustify;
    DBGrid1.Columns[1].Title.Alignment := taLeftJustify;
  end;

  if ChaveConsulta = 'FORMAS' then
  begin
    FrmConsulta.Width := 471;

    DBGrid1.Columns.Add;
    DBGrid1.Columns.Add;

    DBGrid1.Columns[0].FieldName := 'FINALIZADORA_ID';
    DBGrid1.Columns[1].FieldName := 'DESCRICAO';

    DBGrid1.Columns[0].Title.Caption := 'Código';
    DBGrid1.Columns[1].Title.Caption := 'Descrição';

    DBGrid1.Columns[0].Width := 64;
    DBGrid1.Columns[1].Width := 368;

    DBGrid1.Columns[0].Title.Alignment := taRightJustify;
    DBGrid1.Columns[1].Title.Alignment := taLeftJustify;
  end;

  if ChaveConsulta = 'FORNECEDORES' then
  begin
    FrmConsulta.Width := 707;

    DBGrid1.Columns.Add;
    DBGrid1.Columns.Add;
    DBGrid1.Columns.Add;
    DBGrid1.Columns.Add;

    DBGrid1.Columns[0].FieldName := 'FORNECEDOR_ID';
    DBGrid1.Columns[1].FieldName := 'NOME';
    DBGrid1.Columns[2].FieldName := 'CNPJ';
    DBGrid1.Columns[3].FieldName := 'MUNICIPIO';

    DBGrid1.Columns[0].Title.Caption := 'Código';
    DBGrid1.Columns[1].Title.Caption := 'Nome';
    DBGrid1.Columns[2].Title.Caption := 'CNPJ';
    DBGrid1.Columns[3].Title.Caption := 'Município';

    DBGrid1.Columns[0].Width := 64;
    DBGrid1.Columns[1].Width := 330;
    DBGrid1.Columns[2].Width := 140;
    DBGrid1.Columns[3].Width := 126;

    DBGrid1.Columns[0].Title.Alignment := taRightJustify;
    DBGrid1.Columns[1].Title.Alignment := taLeftJustify;
    DBGrid1.Columns[2].Title.Alignment := taLeftJustify;
    DBGrid1.Columns[3].Title.Alignment := taLeftJustify;
  end;

  if ChaveConsulta = 'IBGE' then
  begin
    FrmConsulta.Width := 564;

    DBGrid1.Columns.Add;
    DBGrid1.Columns.Add;
    DBGrid1.Columns.Add;
    DBGrid1.Columns.Add;

    DBGrid1.Columns[0].FieldName := 'CODIGO';
    DBGrid1.Columns[1].FieldName := 'DESCRICAO';
    DBGrid1.Columns[2].FieldName := 'UF';
    DBGrid1.Columns[3].FieldName := 'UF_SIGLA';

    DBGrid1.Columns[0].Title.Caption := 'Cód. IBGE';
    DBGrid1.Columns[1].Title.Caption := 'Descrição';
    DBGrid1.Columns[2].Title.Caption := 'UF';
    DBGrid1.Columns[3].Title.Caption := 'Sigla UF';

    DBGrid1.Columns[0].Width := 53;
    DBGrid1.Columns[1].Width := 304;
    DBGrid1.Columns[2].Width := 124;
    DBGrid1.Columns[3].Width := 42;
  end;

  if ChaveConsulta = 'PAISES' then
  begin
    FrmConsulta.Width := 471;

    DBGrid1.Columns.Add;
    DBGrid1.Columns.Add;

    DBGrid1.Columns[0].FieldName := 'CODIGO';
    DBGrid1.Columns[1].FieldName := 'DESCRICAO';

    DBGrid1.Columns[0].Title.Caption := 'Código';
    DBGrid1.Columns[1].Title.Caption := 'Descrição';

    DBGrid1.Columns[0].Width := 64;
    DBGrid1.Columns[1].Width := 368;
  end;

  if ChaveConsulta = 'PATRIMÔNIO' then
  begin
    FrmConsulta.Width := 471;

    DBGrid1.Columns.Add;
    DBGrid1.Columns.Add;

    DBGrid1.Columns[0].FieldName := 'PATRIMONIO_ID';
    DBGrid1.Columns[1].FieldName := 'DESCRICAO';

    DBGrid1.Columns[0].Title.Caption := 'Código';
    DBGrid1.Columns[1].Title.Caption := 'Descrição';

    DBGrid1.Columns[0].Width := 64;
    DBGrid1.Columns[1].Width := 368;

    DBGrid1.Columns[0].Title.Alignment := taRightJustify;
    DBGrid1.Columns[1].Title.Alignment := taLeftJustify;
  end;

  if ChaveConsulta = 'PESSOAL' then
  begin
    FrmConsulta.Width := 471;

    DBGrid1.Columns.Add;
    DBGrid1.Columns.Add;

    DBGrid1.Columns[0].FieldName := 'FUNCIONARIO_ID';
    DBGrid1.Columns[1].FieldName := 'NOME';

    DBGrid1.Columns[0].Title.Caption := 'Código';
    DBGrid1.Columns[1].Title.Caption := 'Nome';

    DBGrid1.Columns[0].Width := 64;
    DBGrid1.Columns[1].Width := 368;

    DBGrid1.Columns[0].Title.Alignment := taRightJustify;
    DBGrid1.Columns[1].Title.Alignment := taLeftJustify;
  end;

  if ChaveConsulta = 'ESTOQUE' then
  begin
    FrmDetalhes_Produto.Show;

    if FrmData.QAcesso.FieldByName('TPCTB').AsString = '2' then
    begin
      FrmConsulta.Width := 886;

      DBGrid1.Columns.Add;
      DBGrid1.Columns.Add;
      DBGrid1.Columns.Add;
      DBGrid1.Columns.Add;
      DBGrid1.Columns.Add;
      DBGrid1.Columns.Add;
    IF not (FrmPrincipal.Config.FieldByName('CONSULTA_SIMPLES').AsString = 'True') Then
    Begin
      DBGrid1.Columns.Add;
      DBGrid1.Columns.Add;
      DBGrid1.Columns.Add;
      DBGrid1.Columns.Add;
    End;

      DBGrid1.Columns[0].FieldName := 'PRODUTO_ID';
      DBGrid1.Columns[1].FieldName := 'COD_BARRA';
      DBGrid1.Columns[2].FieldName := 'DESCRICAO';
      DBGrid1.Columns[3].FieldName := 'QUANTIDADE_C';
      DBGrid1.Columns[4].FieldName := 'PRECO_VAREJO';
      DBGrid1.Columns[5].FieldName := 'PRECO_PRAZO';
    IF not (FrmPrincipal.Config.FieldByName('CONSULTA_SIMPLES').AsString = 'True') Then
    Begin
      DBGrid1.Columns[5].FieldName := 'PRECO_ATACADO';
      DBGrid1.Columns[6].FieldName := 'CUSTO_COMPRA';
      DBGrid1.Columns[7].FieldName := 'MARGEM_LUCRO';
      DBGrid1.Columns[8].FieldName := 'QUANT_MINIMA';
    End;

      DBGrid1.Columns[0].Title.Caption := 'Código';
      DBGrid1.Columns[1].Title.Caption := 'Cód. Barra';
      DBGrid1.Columns[2].Title.Caption := 'Descrição';
      DBGrid1.Columns[3].Title.Caption := 'Quantidade';
      DBGrid1.Columns[4].Title.Caption := 'Pr. Varejo';
      DBGrid1.Columns[5].Title.Caption := 'Pr. Prazo';
    IF not (FrmPrincipal.Config.FieldByName('CONSULTA_SIMPLES').AsString = 'True') Then
    Begin
      DBGrid1.Columns[5].Title.Caption := 'Pr. Atacado';
      DBGrid1.Columns[6].Title.Caption := 'Pr. Custo';
      DBGrid1.Columns[7].Title.Caption := 'Mgl. Lucro';
      DBGrid1.Columns[8].Title.Caption := 'Qtd. Mínima';
    End;

      DBGrid1.Columns[0].Width := 64;
      DBGrid1.Columns[1].Width := 100;
      DBGrid1.Columns[2].Width := 325;
      DBGrid1.Columns[3].Width := 70;
      DBGrid1.Columns[4].Width := 70;
    IF not (FrmPrincipal.Config.FieldByName('CONSULTA_SIMPLES').AsString = 'True') Then
    Begin
      DBGrid1.Columns[5].Width := 70;
      DBGrid1.Columns[6].Width := 70;
      DBGrid1.Columns[7].Width := 70;
      DBGrid1.Columns[8].Width := 70;
    End;

      DBGrid1.Columns[0].Title.Alignment := taRightJustify;
      DBGrid1.Columns[1].Title.Alignment := taRightJustify;
      DBGrid1.Columns[2].Title.Alignment := taLeftJustify;
      DBGrid1.Columns[3].Title.Alignment := taRightJustify;
      DBGrid1.Columns[4].Title.Alignment := taRightJustify;
      DBGrid1.Columns[5].Title.Alignment := taRightJustify;
    IF not (FrmPrincipal.Config.FieldByName('CONSULTA_SIMPLES').AsString = 'True') Then
    Begin
      DBGrid1.Columns[5].Title.Alignment := taRightJustify;
      DBGrid1.Columns[6].Title.Alignment := taRightJustify;
      DBGrid1.Columns[7].Title.Alignment := taRightJustify;
      DBGrid1.Columns[8].Title.Alignment := taRightJustify;
    End;
    end
    else
    begin
      FrmConsulta.Width := 886;

      DBGrid1.Columns.Add;
      DBGrid1.Columns.Add;
      DBGrid1.Columns.Add;
      DBGrid1.Columns.Add;
      DBGrid1.Columns.Add;
      DBGrid1.Columns.Add;
      DBGrid1.Columns.Add;
    IF not (FrmPrincipal.Config.FieldByName('CONSULTA_SIMPLES').AsString = 'True') Then
    Begin
      DBGrid1.Columns.Add;
      DBGrid1.Columns.Add;
      DBGrid1.Columns.Add;
      DBGrid1.Columns.Add;
    End;

      DBGrid1.Columns[0].FieldName := 'PRODUTO_ID';
      DBGrid1.Columns[1].FieldName := 'COD_BARRA';
      DBGrid1.Columns[2].FieldName := 'DESCRICAO';
      DBGrid1.Columns[3].FieldName := 'QUANTIDADE_C';
      DBGrid1.Columns[4].FieldName := 'QUANTIDADE_G';
      DBGrid1.Columns[5].FieldName := 'PRECO_VAREJO';
      DBGrid1.Columns[6].FieldName := 'PRECO_PRAZO';
    IF not (FrmPrincipal.Config.FieldByName('CONSULTA_SIMPLES').AsString = 'True') Then
    Begin
      DBGrid1.Columns[6].FieldName := 'PRECO_ATACADO';
      DBGrid1.Columns[7].FieldName := 'CUSTO_COMPRA';
      DBGrid1.Columns[8].FieldName := 'MARGEM_LUCRO';
      DBGrid1.Columns[9].FieldName := 'QUANT_MINIMA';
    End;

      DBGrid1.Columns[0].Title.Caption := 'Código';
      DBGrid1.Columns[1].Title.Caption := 'Cód. Barra';
      DBGrid1.Columns[2].Title.Caption := 'Descrição';
      DBGrid1.Columns[3].Title.Caption := 'Quant. Cont.';
      DBGrid1.Columns[4].Title.Caption := 'Ped. Compra';
      DBGrid1.Columns[5].Title.Caption := 'Pr. Varejo';
      DBGrid1.Columns[6].Title.Caption := 'Pr. Prazo';
    IF not (FrmPrincipal.Config.FieldByName('CONSULTA_SIMPLES').AsString = 'True') Then
    Begin
      DBGrid1.Columns[6].Title.Caption := 'Pr. Atacado';
      DBGrid1.Columns[7].Title.Caption := 'Pr. Custo';
      DBGrid1.Columns[8].Title.Caption := 'Mgl. Lucro';
      DBGrid1.Columns[9].Title.Caption := 'Qtd. Mínima';
    End;

      DBGrid1.Columns[0].Width := 64;
      DBGrid1.Columns[1].Width := 180;
      DBGrid1.Columns[2].Width := 244;
      DBGrid1.Columns[3].Width := 80;
      DBGrid1.Columns[4].Width := 80;
      DBGrid1.Columns[5].Width := 80;
    IF not (FrmPrincipal.Config.FieldByName('CONSULTA_SIMPLES').AsString = 'True') Then
    Begin
      DBGrid1.Columns[6].Width := 80;
      DBGrid1.Columns[7].Width := 80;
      DBGrid1.Columns[8].Width := 80;
      DBGrid1.Columns[9].Width := 80;
    End;

      DBGrid1.Columns[0].Title.Alignment := taRightJustify;
      DBGrid1.Columns[1].Title.Alignment := taRightJustify;
      DBGrid1.Columns[2].Title.Alignment := taLeftJustify;
      DBGrid1.Columns[3].Title.Alignment := taRightJustify;
      DBGrid1.Columns[4].Title.Alignment := taRightJustify;
      DBGrid1.Columns[5].Title.Alignment := taRightJustify;
    IF not (FrmPrincipal.Config.FieldByName('CONSULTA_SIMPLES').AsString = 'True') Then
    Begin
      DBGrid1.Columns[6].Title.Alignment := taRightJustify;
      DBGrid1.Columns[7].Title.Alignment := taRightJustify;
      DBGrid1.Columns[8].Title.Alignment := taRightJustify;
      DBGrid1.Columns[9].Title.Alignment := taRightJustify;
    End;
    end;
  end;

  if ChaveConsulta = 'ORÇAMENTO' then
  begin
    FrmConsulta.Width := 527;

    DBGrid1.Columns.Add;
    DBGrid1.Columns.Add;
    DBGrid1.Columns.Add;
    DBGrid1.Columns.Add;

    DBGrid1.Columns[0].FieldName := 'ORCAMENTO_ID';
    DBGrid1.Columns[1].FieldName := 'DT_ORCAMENTO';
    DBGrid1.Columns[2].FieldName := 'NOME';
    DBGrid1.Columns[3].FieldName := 'VALOR';

    DBGrid1.Columns[0].Title.Caption := 'Código';
    DBGrid1.Columns[1].Title.Caption := 'Data';
    DBGrid1.Columns[2].Title.Caption := 'Nome';
    DBGrid1.Columns[3].Title.Caption := 'Valor';

    DBGrid1.Columns[0].Width := 55;
    DBGrid1.Columns[1].Width := 112;
    DBGrid1.Columns[2].Width := 244;
    DBGrid1.Columns[3].Width := 66;

    DBGrid1.Columns[0].Title.Alignment := taRightJustify;
    DBGrid1.Columns[1].Title.Alignment := taLeftJustify;
  end;

  if (ChaveConsulta = 'PEDIDO') OR (ChaveConsulta = 'PEDIDO_VENDA') then
  begin
    FrmConsulta.Width := 527;

    DBGrid1.Columns.Add;
    DBGrid1.Columns.Add;
    DBGrid1.Columns.Add;
    DBGrid1.Columns.Add;

    DBGrid1.Columns[0].FieldName := 'PEDIDO_ID';
    DBGrid1.Columns[1].FieldName := 'DT_PEDIDO';
    DBGrid1.Columns[2].FieldName := 'NOME';
    DBGrid1.Columns[3].FieldName := 'VALOR';

    DBGrid1.Columns[0].Title.Caption := 'Código';
    DBGrid1.Columns[1].Title.Caption := 'Data';
    DBGrid1.Columns[2].Title.Caption := 'Nome';
    DBGrid1.Columns[3].Title.Caption := 'Valor';

    DBGrid1.Columns[0].Width := 55;
    DBGrid1.Columns[1].Width := 112;
    DBGrid1.Columns[2].Width := 244;
    DBGrid1.Columns[3].Width := 66;

    DBGrid1.Columns[0].Title.Alignment := taRightJustify;
    DBGrid1.Columns[1].Title.Alignment := taLeftJustify;
    DBGrid1.Columns[2].Title.Alignment := taLeftJustify;
    DBGrid1.Columns[3].Title.Alignment := taRightJustify;
  end;

  if (ChaveConsulta = 'ORDEM_SERVICO') then
  begin
    FrmConsulta.Width := 527;

    DBGrid1.Columns.Add;
    DBGrid1.Columns.Add;
    DBGrid1.Columns.Add;
    DBGrid1.Columns.Add;

    DBGrid1.Columns[0].FieldName := 'ORDEM_ID';
    DBGrid1.Columns[1].FieldName := 'DT_FECHAMENTO';
    DBGrid1.Columns[2].FieldName := 'NOME_CLIENTE';
    DBGrid1.Columns[3].FieldName := 'VALOR';

    DBGrid1.Columns[0].Title.Caption := 'Código';
    DBGrid1.Columns[1].Title.Caption := 'Data Fechamento';
    DBGrid1.Columns[2].Title.Caption := 'Nome';
    DBGrid1.Columns[3].Title.Caption := 'Valor';

    DBGrid1.Columns[0].Width := 55;
    DBGrid1.Columns[1].Width := 112;
    DBGrid1.Columns[2].Width := 244;
    DBGrid1.Columns[3].Width := 66;

    DBGrid1.Columns[0].Title.Alignment := taRightJustify;
    DBGrid1.Columns[1].Title.Alignment := taLeftJustify;
    DBGrid1.Columns[2].Title.Alignment := taLeftJustify;
    DBGrid1.Columns[3].Title.Alignment := taRightJustify;
  end;


  if ChaveConsulta = 'PLANO' then
  begin
    FrmConsulta.Width  := 600;
    FrmConsulta.Height := 600;

    DBGrid1.Columns.Add;
    DBGrid1.Columns.Add;

    DBGrid1.Columns[0].FieldName := 'CODIGO';
    DBGrid1.Columns[1].FieldName := 'DESCRICAO';

    DBGrid1.Columns[0].Title.Caption := 'Código';
    DBGrid1.Columns[1].Title.Caption := 'Descrição';

    DBGrid1.Columns[0].Width := 100;
    DBGrid1.Columns[1].Width := 461;
  end;

  if ChaveConsulta = 'SERVIÇOS' then
  begin
    FrmConsulta.Width := 467;

    DBGrid1.Columns.Add;
    DBGrid1.Columns.Add;
    DBGrid1.Columns.Add;

    DBGrid1.Columns[0].FieldName := 'SERVICO_ID';
    DBGrid1.Columns[1].FieldName := 'DESCRICAO';
    DBGrid1.Columns[2].FieldName := 'PRECO';

    DBGrid1.Columns[0].Title.Caption := 'Código';
    DBGrid1.Columns[1].Title.Caption := 'Descrição';
    DBGrid1.Columns[2].Title.Caption := 'Preço';

    DBGrid1.Columns[0].Width := 65;
    DBGrid1.Columns[1].Width := 244;
    DBGrid1.Columns[2].Width := 118;

    DBGrid1.Columns[0].Title.Alignment := taRightJustify;
    DBGrid1.Columns[1].Title.Alignment := taLeftJustify;
    DBGrid1.Columns[2].Title.Alignment := taRightJustify;
  end;

  if (ChaveConsulta = 'TRANS_COMPRA') or (ChaveConsulta = 'TRANS_VENDA') then
  begin
    FrmConsulta.Width := 721;

    DBGrid1.Columns.Add;
    DBGrid1.Columns.Add;
    DBGrid1.Columns.Add;
    DBGrid1.Columns.Add;
    DBGrid1.Columns.Add;
    DBGrid1.Columns.Add;
    DBGrid1.Columns.Add;

    DBGrid1.Columns[0].FieldName := 'TRANSACAO_ID';
    DBGrid1.Columns[1].FieldName := 'DT_TRANS';
    DBGrid1.Columns[2].FieldName := 'DT_MOVIMENTO';
    DBGrid1.Columns[3].FieldName := 'NUM_DOC';
    DBGrid1.Columns[4].FieldName := 'VALOR';
    DBGrid1.Columns[5].FieldName := 'BALANCO';
    DBGrid1.Columns[6].FieldName := 'HISTORICO';

    DBGrid1.Columns[0].Title.Caption := 'Código';
    DBGrid1.Columns[1].Title.Caption := 'Dt. Transação';
    DBGrid1.Columns[2].Title.Caption := 'Dt. Movimento';
    DBGrid1.Columns[3].Title.Caption := 'Nº Documento';
    DBGrid1.Columns[4].Title.Caption := 'Valor';
    DBGrid1.Columns[5].Title.Caption := 'Balanço';
    DBGrid1.Columns[6].Title.Caption := 'Histórico';

    DBGrid1.Columns[0].Width := 54;
    DBGrid1.Columns[1].Width := 76;
    DBGrid1.Columns[2].Width := 77;
    DBGrid1.Columns[3].Width := 78;
    DBGrid1.Columns[4].Width := 72;
    DBGrid1.Columns[5].Width := 73;
    DBGrid1.Columns[6].Width := 247;

    DBGrid1.Columns[0].Title.Alignment := taRightJustify;
    DBGrid1.Columns[1].Title.Alignment := taLeftJustify;
    DBGrid1.Columns[2].Title.Alignment := taLeftJustify;
    DBGrid1.Columns[3].Title.Alignment := taLeftJustify;
    DBGrid1.Columns[4].Title.Alignment := taRightJustify;
    DBGrid1.Columns[5].Title.Alignment := taLeftJustify;
    DBGrid1.Columns[6].Title.Alignment := taLeftJustify;
  end;

  if ChaveConsulta = 'TRIBUTOS' then
  begin
    FrmConsulta.Width := 471;

    DBGrid1.Columns.Add;
    DBGrid1.Columns.Add;

    DBGrid1.Columns[0].FieldName := 'TRIBUTO_ID';
    DBGrid1.Columns[1].FieldName := 'DESCRICAO';

    DBGrid1.Columns[0].Title.Caption := 'Código';
    DBGrid1.Columns[1].Title.Caption := 'Descrição';

    DBGrid1.Columns[0].Width := 64;
    DBGrid1.Columns[1].Width := 368;

    DBGrid1.Columns[0].Title.Alignment := taRightJustify;
    DBGrid1.Columns[1].Title.Alignment := taLeftJustify;
  end;

  Localiz.Width    := (FrmConsulta.Width - 68);
  btnRetorna.Left  := (FrmConsulta.Width - 87);

  FrmConsulta.Left := Round(((Screen.WorkAreaWidth - FrmConsulta.Width) / 2));
  FrmConsulta.Top  := Round(((Screen.WorkAreaHeight - FrmConsulta.Height) / 2));
  Localiz.Text     := '';

  {if (not QConsulta.IsEmpty) and (ChaveConsulta <> 'PLANO') then
    DBGrid1.SetFocus
  else
    Localiz.SetFocus;}

  if ChaveConsulta = 'ESTOQUE' then
    Localiz.SetFocus;
end;

procedure TFrmConsulta.LocalizChange(Sender: TObject);
begin
  if ChaveConsulta = 'PLANO' then
    QConsulta.Locate('DESCRICAO', Localiz.Text, [loPartialKey]);
end;

procedure TFrmConsulta.LocalizEnter(Sender: TObject);
begin
  Localiz.Text := '';
end;

procedure TFrmConsulta.DBGrid1DblClick(Sender: TObject);
begin
  if not TBDEDataSet(FrmConsulta.DataConsulta.DataSet).IsEmpty then
    ModalResult := mrOK;
end;

end.
