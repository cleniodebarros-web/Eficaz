unit UConfig_Etiqueta_RDprint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, rxToolEdit, rxCurrEdit, ExtCtrls, DB,
  IBCustomDataSet, IBQuery, Buttons;

type
  TFrmConfig_Etiqueta_RDprint = class(TForm)
    Label107: TLabel;
    Label110: TLabel;
    Label111: TLabel;
    Label112: TLabel;
    Label113: TLabel;
    Label114: TLabel;
    Label115: TLabel;
    Label116: TLabel;
    Label117: TLabel;
    Label118: TLabel;
    Label106: TLabel;
    Bevel3: TBevel;
    Bevel2: TBevel;
    RD_Quantidade_Linhas: TCurrencyEdit;
    RD_Qtd_Colunas: TCurrencyEdit;
    RD_Margem_Sup: TCurrencyEdit;
    RD_Margem_Inf: TCurrencyEdit;
    RD_Margem_Esquerda: TCurrencyEdit;
    RD_Margem_Direita: TCurrencyEdit;
    RD_Linha: TCurrencyEdit;
    RD_Coluna_Estoque_col1: TCurrencyEdit;
    RD_Coluna_Cod_Original_col1: TCurrencyEdit;
    RD_Fonte: TCurrencyEdit;
    QRel: TIBQuery;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    RD_Coluna_Estoque_col2: TCurrencyEdit;
    RD_Coluna_Cod_Original_col2: TCurrencyEdit;
    RD_Coluna_Cod_Interno_col2: TCurrencyEdit;
    RD_Linha2: TCurrencyEdit;
    RD_Descricao_col1: TCurrencyEdit;
    RD_Descricao_col2: TCurrencyEdit;
    RD_Linha3: TCurrencyEdit;
    RD_Localizacao_col1: TCurrencyEdit;
    RD_Localizacao_col2: TCurrencyEdit;
    RD_Coluna_Cod_Interno_col1: TCurrencyEdit;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    RD_Fornecedor_col1: TCurrencyEdit;
    RD_Nota_Fiscal_col1: TCurrencyEdit;
    RD_Data_Nota_Fiscal_col1: TCurrencyEdit;
    RD_Fornecedor_col2: TCurrencyEdit;
    RD_Nota_Fiscal_col2: TCurrencyEdit;
    RD_Linha5: TCurrencyEdit;
    RD_Preco_Custo_col1: TCurrencyEdit;
    RD_Preco_Venda_col1: TCurrencyEdit;
    RD_Preco_Custo_col2: TCurrencyEdit;
    RD_Linha4: TCurrencyEdit;
    Label21: TLabel;
    RD_Preco_Venda_col2: TCurrencyEdit;
    Label22: TLabel;
    RD_Salto_de_Linhas: TCurrencyEdit;
    RD_Data_Notal_Fiscal_col2: TCurrencyEdit;
    Label23: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRetornaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure RD_FonteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GravaConfig(Linha, Coluna, Campo, Tamanho: String);
  end;

var
  FrmConfig_Etiqueta_RDprint: TFrmConfig_Etiqueta_RDprint;

implementation

uses
  UPrincipal, UData;

{$R *.dfm}

procedure TFrmConfig_Etiqueta_RDprint.GravaConfig(Linha, Coluna, Campo, Tamanho: String);
begin
  QRel.Sql.Clear;
  QRel.Sql.Add('INSERT INTO CONFIG_DUPLICATA( ' +
               'LINHA,  COLUNA,    CAMPO,  TAMANHO) VALUES(' +
               ':LINHA, :COLUNA,   :CAMPO, :TAMANHO)');
  QRel.ParamByName('LINHA').AsInteger   := StrToInt(Linha);
  QRel.ParamByName('COLUNA').AsInteger  := StrToInt(Coluna);
  QRel.ParamByName('CAMPO').AsString    := Campo;
  QRel.ParamByName('TAMANHO').AsInteger := StrToInt(Tamanho);
  QRel.Prepare;
  QRel.ExecSql;

end;

procedure TFrmConfig_Etiqueta_RDprint.RD_FonteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmConfig_Etiqueta_RDprint.btnExecutaClick(Sender: TObject);
begin
  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;


    GravaIni(Arq_Ini, 'Etiqueta RDPrint', 'Fonte', RD_Fonte.Text);
    GravaIni(Arq_Ini, 'Etiqueta RDPrint', 'Quantidade de Linhas', RD_Quantidade_Linhas.Text);
    GravaIni(Arq_Ini, 'Etiqueta RDPrint', 'Quantidade de Colunas', RD_Qtd_Colunas.Text);
    GravaIni(Arq_Ini, 'Etiqueta RDPrint', 'Margem Superior', RD_Margem_Sup.Text);
    GravaIni(Arq_Ini, 'Etiqueta RDPrint', 'Margem Inferior', RD_Margem_Inf.Text);
    GravaIni(Arq_Ini, 'Etiqueta RDPrint', 'Margem Esquerda', RD_Margem_Esquerda.Text);
    GravaIni(Arq_Ini, 'Etiqueta RDPrint', 'Margem Direita', RD_Margem_Direita.Text);
    GravaIni(Arq_Ini, 'Etiqueta RDPrint', 'Linha 1', RD_Linha.Text);
    GravaIni(Arq_Ini, 'Etiqueta RDPrint', 'Coluna Estoque (Coluna 1)', RD_Coluna_Estoque_col1.Text);
    GravaIni(Arq_Ini, 'Etiqueta RDPrint', 'Coluna Cód. Original (Coluna 1)', RD_Coluna_Cod_Original_col1.Text);
    GravaIni(Arq_Ini, 'Etiqueta RDPrint', 'Coluna Cód. Interno (Coluna 1)', RD_Coluna_Cod_Interno_col1.Text);
    GravaIni(Arq_Ini, 'Etiqueta RDPrint', 'Coluna Estoque (Coluna 2)', RD_Coluna_Estoque_col2.Text);
    GravaIni(Arq_Ini, 'Etiqueta RDPrint', 'Coluna Cód. Original (Coluna 2)', RD_Coluna_Cod_Original_col2.Text);
    GravaIni(Arq_Ini, 'Etiqueta RDPrint', 'Coluna Cód. Interno (Coluna 2)', RD_Coluna_Cod_Interno_col2.Text);
    GravaIni(Arq_Ini, 'Etiqueta RDPrint', 'Linha 2', RD_Linha2.Text);
    GravaIni(Arq_Ini, 'Etiqueta RDPrint', 'Descricao (Coluna 1)', RD_Descricao_col1.Text);
    GravaIni(Arq_Ini, 'Etiqueta RDPrint', 'Descricao (Coluna 2)', RD_Descricao_col2.Text);
    GravaIni(Arq_Ini, 'Etiqueta RDPrint', 'Linha 3', RD_Linha3.Text);
    GravaIni(Arq_Ini, 'Etiqueta RDPrint', 'Localização (Coluna 1)', RD_Localizacao_col1.Text);
    GravaIni(Arq_Ini, 'Etiqueta RDPrint', 'Localização (Coluna 2)', RD_Localizacao_col2.Text);
    GravaIni(Arq_Ini, 'Etiqueta RDPrint', 'Linha 4', RD_Linha4.Text);
    GravaIni(Arq_Ini, 'Etiqueta RDPrint', 'Fornecedor (Coluna 1)', RD_Fornecedor_col1.Text);
    GravaIni(Arq_Ini, 'Etiqueta RDPrint', 'Nota Fiscal (Coluna 1)', RD_Nota_Fiscal_col1.Text);
    GravaIni(Arq_Ini, 'Etiqueta RDPrint', 'Data N. Fiscal (Coluna 1)', RD_Data_Nota_Fiscal_col1.Text);
    GravaIni(Arq_Ini, 'Etiqueta RDPrint', 'Fornecedor (Coluna 2)', RD_Fornecedor_col2.Text);
    GravaIni(Arq_Ini, 'Etiqueta RDPrint', 'Nota Fiscal (Coluna 2)', RD_Nota_Fiscal_col2.Text);
    GravaIni(Arq_Ini, 'Etiqueta RDPrint', 'Data N. Fiscal (Coluna 2)', RD_Data_Notal_Fiscal_col2.Text);
    GravaIni(Arq_Ini, 'Etiqueta RDPrint', 'Linha 5', RD_Linha5.Text);
    GravaIni(Arq_Ini, 'Etiqueta RDPrint', 'Preço Custo (Coluna 1)', RD_Preco_Custo_col1.Text);
    GravaIni(Arq_Ini, 'Etiqueta RDPrint', 'Preço Venda (Coluna 1)', RD_Preco_Venda_col1.Text);
    GravaIni(Arq_Ini, 'Etiqueta RDPrint', 'Preço Custo (Coluna 2)', RD_Preco_Custo_col2.Text);
    GravaIni(Arq_Ini, 'Etiqueta RDPrint', 'Preço Venda (Coluna 2)', RD_Preco_Venda_col2.Text);
    GravaIni(Arq_Ini, 'Etiqueta RDPrint', 'Salto de linhas', RD_Salto_de_Linhas.Text);

    Application.MessageBox('Operação realizada com sucesso', PChar(Msg_Title), mb_IconInformation);
    Close;
  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;

procedure TFrmConfig_Etiqueta_RDprint.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmConfig_Etiqueta_RDprint.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmConfig_Etiqueta_RDprint.FormShow(Sender: TObject);
begin


  RD_Fonte.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint', 'Fonte');
  RD_Salto_de_Linhas.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint', 'Salto de linhas');
  RD_Preco_Venda_col2.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint', 'Preço Venda (Coluna 2)');
  RD_Preco_Custo_col2.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint', 'Preço Custo (Coluna 2)');
  RD_Preco_Venda_col1.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint', 'Preço Venda (Coluna 1)');
  RD_Preco_Custo_col1.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint', 'Preço Custo (Coluna 1)');
  RD_Linha5.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint', 'Linha 5');
  RD_Data_Notal_Fiscal_col2.Text  := LeIni(Arq_Ini, 'Etiqueta RDPrint', 'Data N. Fiscal (Coluna 2)');
  RD_Nota_Fiscal_col2.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint', 'Nota Fiscal (Coluna 2)');
  RD_Fornecedor_col2.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint', 'Fornecedor (Coluna 2)');
  RD_Data_Nota_Fiscal_col1.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint', 'Data N. Fiscal (Coluna 1)');
  RD_Nota_Fiscal_col1.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint', 'Nota Fiscal (Coluna 1)');
  RD_Fornecedor_col1.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint', 'Fornecedor (Coluna 1)');
  RD_Linha4.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint', 'Linha 4');
  RD_Localizacao_col2.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint', 'Localização (Coluna 2)');
  RD_Localizacao_col1.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint', 'Localização (Coluna 1)');
  RD_Linha3.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint', 'Linha 3');
  RD_Descricao_col2.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint', 'Descricao (Coluna 2)');
  RD_Descricao_col1.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint', 'Descricao (Coluna 1)');
  RD_Linha2.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint', 'Linha 2');
  RD_Coluna_Cod_Interno_col2.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint', 'Coluna Cód. Interno (Coluna 2)');
  RD_Coluna_Cod_Original_col2.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint', 'Coluna Cód. Original (Coluna 2)');
  RD_Coluna_Estoque_col2.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint', 'Coluna Estoque (Coluna 2)');
  RD_Coluna_Cod_Interno_col1.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint', 'Coluna Cód. Interno (Coluna 1)');
  RD_Coluna_Cod_Original_col1.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint', 'Coluna Cód. Original (Coluna 1)');
  RD_Coluna_Estoque_col1.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint', 'Coluna Estoque (Coluna 1)');
  RD_Linha.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint', 'Linha 1');
  RD_Margem_Direita.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint', 'Margem Direita');
  RD_Margem_Esquerda.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint', 'Margem Esquerda');
  RD_Margem_Inf.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint', 'Margem Inferior');
  RD_Margem_Sup.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint', 'Margem Superior');
  RD_Qtd_Colunas.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint', 'Quantidade de Colunas');
  RD_Quantidade_Linhas.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint', 'Quantidade de Linhas');




end;

end.
