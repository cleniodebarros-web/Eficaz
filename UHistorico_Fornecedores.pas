unit UHistorico_Fornecedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ComCtrls, DB, IBCustomDataSet, IBQuery, Buttons,
  StdCtrls, Mask, rxToolEdit, rxCurrEdit, DBCtrls, ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmHistorico_Fornecedores = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    btnFornecedor: TSpeedButton;
    DBText1: TDBText;
    Fornecedor: TCurrencyEdit;
    Panel1: TPanel;
    DataFornecedor: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGrid1: TDBGrid;
    TabSheet2: TTabSheet;
    DBGrid2: TDBGrid;
    TabSheet3: TTabSheet;
    DBGrid3: TDBGrid;
    DataCompras: TDataSource;
    DataItens: TDataSource;
    DataParcelas: TDataSource;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    QCompras: TFDQuery;
    QFornecedor: TFDQuery;
    QItens: TFDQuery;
    QParcelas: TFDQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRetornaClick(Sender: TObject);
    procedure btnFornecedorClick(Sender: TObject);
    procedure FornecedorChange(Sender: TObject);
    procedure FornecedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnExecutaClick(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure QComprasAfterOpen(DataSet: TDataSet);
    procedure QItensAfterOpen(DataSet: TDataSet);
    procedure QParcelasAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure FornecedorSearch;
  end;

var
  FrmHistorico_Fornecedores: TFrmHistorico_Fornecedores;

implementation

uses
  UData, UPrincipal, UConsulta;

{$R *.dfm}

procedure TFrmHistorico_Fornecedores.FornecedorSearch;
begin
  QFornecedor.Close;
  QFornecedor.ParamByName('FORNECEDOR_ID').AsInteger := StrToInt(Fornecedor.Text);
  QFornecedor.Prepare;
  QFornecedor.Open;
end;

procedure TFrmHistorico_Fornecedores.QComprasAfterOpen(DataSet: TDataSet);
begin
TFloatField(QCompras.FieldByName('VALOR')).DisplayFormat  := '#,##0.00';
end;

procedure TFrmHistorico_Fornecedores.QItensAfterOpen(DataSet: TDataSet);
begin
TFloatField(QItens.FieldByName('VR_UNITARIO')).DisplayFormat  := '#,##0.00';
TFloatField(QItens.FieldByName('VR_DESCONTO')).DisplayFormat  := '#,##0.00';
TFloatField(QItens.FieldByName('VR_TOTAL')).DisplayFormat  := '#,##0.00';
end;

procedure TFrmHistorico_Fornecedores.QParcelasAfterOpen(DataSet: TDataSet);
begin
TFloatField(QParcelas.FieldByName('VALOR')).DisplayFormat  := '#,##0.00';
end;

procedure TFrmHistorico_Fornecedores.btnFornecedorClick(Sender: TObject);
begin
  try
    Fornecedor.Value := GetConsulta('FORNECEDORES', 0, 0, StrToInt(Fornecedor.Text));
  except
    Fornecedor.Value := GetConsulta('FORNECEDORES', 0, 0, 0);
  end;
end;

procedure TFrmHistorico_Fornecedores.btnExecutaClick(Sender: TObject);
begin
  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    if Fornecedor.Value = 0 then
      exit;

    QCompras.Sql.Clear;
    QCompras.Sql.Add('SELECT TRANSACAO_ID, DT_TRANS, DT_MOVIMENTO, NUM_DOC, HISTORICO, VALOR');
    QCompras.Sql.Add('FROM TRANSACOES');
    QCompras.Sql.Add('WHERE');
    QCompras.Sql.Add('(TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
    QCompras.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
    QCompras.Sql.Add('AND (TRANSACOES.FORNECEDOR_ID = :FORNECEDOR_ID)');
    QCompras.Sql.Add('AND (TRANSACOES.CONDUTA = :CONDUTA)');
    QCompras.Sql.Add('AND (TRANSACOES.BALANCO <> :BALANCO)');
//    QCompras.Sql.Add('AND (TRANSACOES.COND_PAGTO = :COND_PAGTO)');
    QCompras.Sql.Add('ORDER BY TRANSACOES.DT_TRANS');

    QCompras.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    QCompras.ParamByName('TPCTB').AsString          := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    QCompras.ParamByName('FORNECEDOR_ID').AsInteger := StrToInt(Fornecedor.Text);
    QCompras.ParamByName('CONDUTA').AsString        := '02';
    QCompras.ParamByName('BALANCO').AsString        := 'AGRUPADO';
//    QCompras.ParamByName('COND_PAGTO').AsString     := 'A PRAZO';

    QCompras.Prepare;
    QCompras.Open;
  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;

procedure TFrmHistorico_Fornecedores.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmHistorico_Fornecedores.FornecedorChange(Sender: TObject);
begin
  if Fornecedor.Value > 0 then
    FornecedorSearch;
end;

procedure TFrmHistorico_Fornecedores.FornecedorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = Fornecedor) then
    btnFornecedorClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmHistorico_Fornecedores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmHistorico_Fornecedores.FormCreate(Sender: TObject);
begin
  DBGrid1.Columns[0].Width := 112;
  DBGrid1.Columns[1].Width := 112;
  DBGrid1.Columns[2].Width := 55;
  DBGrid1.Columns[3].Width := 304;
  DBGrid1.Columns[4].Width := 82;

  DBGrid2.Columns[0].Width := 64;
  DBGrid2.Columns[1].Width := 250;
  DBGrid2.Columns[2].Width := 80;
  DBGrid2.Columns[3].Width := 80;
  DBGrid2.Columns[4].Width := 80;
  DBGrid2.Columns[5].Width := 80;

  DBGrid3.Columns[0].Width := 70;
  DBGrid3.Columns[1].Width := 64;
  DBGrid3.Columns[2].Width := 131;
  DBGrid3.Columns[3].Width := 157;
  DBGrid3.Columns[4].Width := 157;
  DBGrid3.Columns[5].Width := 85;
end;

procedure TFrmHistorico_Fornecedores.TabSheet2Show(Sender: TObject);
begin
  if (QCompras.Active) and (QCompras.FieldByName('TRANSACAO_ID').AsInteger > 0) then
  begin
    QItens.Sql.Clear;
    QItens.Sql.Add('SELECT PRODUTO_ID, DESCRICAO, QUANTIDADE, VR_UNITARIO, VR_DESCONTO, VR_TOTAL');
    QItens.Sql.Add('FROM TRANSITENS');
    QItens.Sql.Add('WHERE');
    QItens.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

    QItens.ParamByName('TRANSACAO_ID').AsInteger := QCompras.FieldByName('TRANSACAO_ID').AsInteger;

    QItens.Prepare;
    QItens.Open;
  end;
end;

procedure TFrmHistorico_Fornecedores.TabSheet3Show(Sender: TObject);
begin
  if (QCompras.Active) and (QCompras.FieldByName('TRANSACAO_ID').AsInteger > 0) then
  begin
    QParcelas.Sql.Clear;
    QParcelas.Sql.Add('SELECT PARCELA_ID, BANCO_ID, DT_VENCIMENTO, ESPECIE, DUPLICATA, VALOR');
    QParcelas.Sql.Add('FROM TRANSPARCELAS');
    QParcelas.Sql.Add('WHERE');
    QParcelas.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
    QParcelas.Sql.Add('AND (TRANSPARCELAS.TIPO_TRANSACAO = :TIPO_TRANSACAO)');

    QParcelas.ParamByName('TRANSACAO_ID').AsInteger  := QCompras.FieldByName('TRANSACAO_ID').AsInteger;
    QParcelas.ParamByName('TIPO_TRANSACAO').AsString := 'T';

    QParcelas.Prepare;
    QParcelas.Open;
  end;
end;

end.
