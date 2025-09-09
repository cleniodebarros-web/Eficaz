unit USeleciona_Credores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, Grids, DBGrids, StdCtrls, Buttons,
  ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmSeleciona_Credores = class(TForm)
    Panel1: TPanel;
    btnRetorna: TBitBtn;
    Contas: TDBGrid;
    DataTabela: TDataSource;
    btnPesquisa: TBitBtn;
    QTabela: TFDQuery;
    procedure btnPesquisaClick(Sender: TObject);
    procedure ContasKeyPress(Sender: TObject; var Key: Char);
    procedure ContasDblClick(Sender: TObject);
    procedure ContasKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure QTabelaAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSeleciona_Credores: TFrmSeleciona_Credores;

implementation

uses
  UData, UPrincipal;

{$R *.dfm}

procedure TFrmSeleciona_Credores.btnPesquisaClick(Sender: TObject);
var
Tx: String;
ClicOK: Boolean;
codigo :Integer;
begin
  Tx := '';

  ClicOK := InputQuery(PChar(Msg_Title), 'Digite o Nome ou Código:', Tx);

  if ClicOK then
  begin
   try

    CODIGO := StrToInt(tx);

    QTabela.Sql.Clear;
    QTabela.Sql.Add('SELECT FORNECEDORES.NOME, FORNECEDORES.CNPJ, TRANSACOES.NUM_DOC, TRANSACOES.HISTORICO, TRANSACOES.FORNECEDOR_ID, TRANSACOES.CONTA_ID, TRANSACOES.EMPRESA_ID, ' +
                    'TRANSPARCELAS.TRANSACAO_ID, TRANSPARCELAS.PARCELA_ID, TRANSPARCELAS.DUPLICATA, TRANSPARCELAS.DT_VENCIMENTO, TRANSPARCELAS.VALOR, TRANSPARCELAS.ESPECIE');
    QTabela.Sql.Add('FROM TRANSPARCELAS');
    QTabela.Sql.Add('INNER JOIN TRANSACOES');
    QTabela.Sql.Add('ON (TRANSPARCELAS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
    QTabela.Sql.Add('INNER JOIN FORNECEDORES');
    QTabela.Sql.Add('ON (TRANSACOES.FORNECEDOR_ID = FORNECEDORES.FORNECEDOR_ID)');
    QTabela.Sql.Add('WHERE');
    QTabela.Sql.Add('(FORNECEDORES.FORNECEDOR_ID = :FORNECEDOR_ID)');
    QTabela.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
    QTabela.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
    QTabela.Sql.Add('AND (TRANSACOES.CONDUTA = :CONDUTA)');
    QTabela.Sql.Add('AND (TRANSACOES.COND_PAGTO = :COND_PAGTO)');
    QTabela.Sql.Add('AND (TRANSPARCELAS.TIPO_TRANSACAO = :TIPO_TRANSACAO)');
    QTabela.Sql.Add('AND (TRANSPARCELAS.VALOR > 0)');
    QTabela.Sql.Add('AND (TRANSPARCELAS.BANCO_ID = 0)');
    QTabela.Sql.Add('AND ((TRANSPARCELAS.AGRUPAMENTO = 0) OR (TRANSPARCELAS.AGRUPAMENTO IS NULL))');
    QTabela.Sql.Add('ORDER BY TRANSPARCELAS.DT_VENCIMENTO, FORNECEDORES.NOME');


    QTabela.ParamByName('FORNECEDOR_ID').AsInteger := codigo;
    QTabela.ParamByName('EMPRESA_ID').AsInteger    :=  FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    QTabela.ParamByName('TPCTB').AsString          := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    QTabela.ParamByName('CONDUTA').AsString        := '02';
    QTabela.ParamByName('COND_PAGTO').AsString     := 'A PRAZO';
    QTabela.ParamByName('TIPO_TRANSACAO').AsString := 'T';

    QTabela.Prepare;
    QTabela.Open;


    except


    QTabela.Sql.Clear;
    QTabela.Sql.Add('SELECT FORNECEDORES.NOME, FORNECEDORES.CNPJ, TRANSACOES.NUM_DOC, TRANSACOES.HISTORICO, TRANSACOES.FORNECEDOR_ID, TRANSACOES.CONTA_ID, TRANSACOES.EMPRESA_ID, ' +
                    'TRANSPARCELAS.TRANSACAO_ID, TRANSPARCELAS.PARCELA_ID, TRANSPARCELAS.DUPLICATA, TRANSPARCELAS.DT_VENCIMENTO, TRANSPARCELAS.VALOR, TRANSPARCELAS.ESPECIE');
    QTabela.Sql.Add('FROM TRANSPARCELAS');
    QTabela.Sql.Add('INNER JOIN TRANSACOES');
    QTabela.Sql.Add('ON (TRANSPARCELAS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
    QTabela.Sql.Add('INNER JOIN FORNECEDORES');
    QTabela.Sql.Add('ON (TRANSACOES.FORNECEDOR_ID = FORNECEDORES.FORNECEDOR_ID)');
    QTabela.Sql.Add('WHERE');
    QTabela.Sql.Add('(FORNECEDORES.NOME LIKE :NOME)');
    QTabela.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
    QTabela.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
    QTabela.Sql.Add('AND (TRANSACOES.CONDUTA = :CONDUTA)');
    QTabela.Sql.Add('AND (TRANSACOES.COND_PAGTO = :COND_PAGTO)');
    QTabela.Sql.Add('AND (TRANSPARCELAS.TIPO_TRANSACAO = :TIPO_TRANSACAO)');
    QTabela.Sql.Add('AND (TRANSPARCELAS.VALOR > 0)');
    QTabela.Sql.Add('AND (TRANSPARCELAS.BANCO_ID = 0)');
    QTabela.Sql.Add('AND ((TRANSPARCELAS.AGRUPAMENTO = 0) OR (TRANSPARCELAS.AGRUPAMENTO IS NULL))');
    QTabela.Sql.Add('ORDER BY TRANSPARCELAS.DT_VENCIMENTO, FORNECEDORES.NOME');

    QTabela.ParamByName('NOME').AsString := '%' + UpperCase(TX) + '%';
    QTabela.ParamByName('EMPRESA_ID').AsInteger    :=  FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    QTabela.ParamByName('TPCTB').AsString          := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    QTabela.ParamByName('CONDUTA').AsString        := '02';
    QTabela.ParamByName('COND_PAGTO').AsString     := 'A PRAZO';
    QTabela.ParamByName('TIPO_TRANSACAO').AsString := 'T';

    QTabela.Prepare;
    QTabela.Open;


    end;




    Contas.SetFocus;
  end;
end;

procedure TFrmSeleciona_Credores.ContasDblClick(Sender: TObject);
begin
    ModalResult := mrOk;
end;

procedure TFrmSeleciona_Credores.ContasKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_F7 then
    btnPesquisaClick(Self);
end;

procedure TFrmSeleciona_Credores.ContasKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    ModalResult := mrOk;

  if Key = #27 then
    ModalResult := mrCancel;
end;

procedure TFrmSeleciona_Credores.FormCreate(Sender: TObject);
begin
  Contas.Columns[0].Width := 43;
  Contas.Columns[1].Width := 216;
  Contas.Columns[2].Width := 110;
  Contas.Columns[3].Width := 90;
  Contas.Columns[4].Width := 90;
  Contas.Columns[5].Width := 67;
  Contas.Columns[6].Width := 82;
end;

procedure TFrmSeleciona_Credores.FormShow(Sender: TObject);
begin
  btnPesquisaClick(Self);
end;

procedure TFrmSeleciona_Credores.QTabelaAfterOpen(DataSet: TDataSet);
begin
  TFloatField(QTabela.FieldByName('VALOR')).DisplayFormat  := '#,##0.00';
end;

end.




