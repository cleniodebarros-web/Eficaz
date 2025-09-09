unit URel_Saidas_Nfce;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, rxToolEdit, DB, IBCustomDataSet, IBQuery,
  QuickRpt, QRCtrls, Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrmRel_Saidas_Nfce = class(TForm)
    Label1: TLabel;
    Dtmen: TDateEdit;
    Dtmai: TDateEdit;
    Bevel1: TBevel;
    Fim: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    QRSysData1: TQRSysData;
    Cabec: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape2: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRBand1: TQRBand;
    QRShape4: TQRShape;
    QRGroup1: TQRGroup;
    QRBand2: TQRBand;
    QRShape3: TQRShape;
    QRLabel2: TQRLabel;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRDBText3: TQRDBText;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    QRLabel25: TQRLabel;
    QRel: TFDQuery;
    QRLabel1: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRExpr7: TQRExpr;
    QRLabel18: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel19: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel20: TQRLabel;
    QRExpr3: TQRExpr;
    QRLabel21: TQRLabel;
    QRExpr8: TQRExpr;
    procedure FormCreate(Sender: TObject);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure OrdemKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRetornaClick(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure DtmenEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Saidas_Nfce: TFrmRel_Saidas_Nfce;

implementation

uses
  UData, UPrincipal;

{$R *.dfm}

procedure TFrmRel_Saidas_Nfce.btnExecutaClick(Sender: TObject);
begin
// 200, 325
  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT TRANSACOES.DT_ENT_SAI,TRANSITENS.CFOP,PRODUTOS.ALIQUOTA_ICMS,PRODUTOS.PIS,PRODUTOS.COFINS,');
    QRel.Sql.Add('SUM(BASE_CALC_ICMS) BASE_CALC_ICMS , SUM(VALOR_ICMS) VALOR_ICMS, SUM(TRANSITENS.BASE_CALC_COFINS) BASE_CALC_COFINS,');
    QRel.Sql.Add('SUM(TRANSITENS.VR_COFINS) VR_COFINS, SUM(TRANSITENS.BASE_CALC_PIS) BASE_CALC_PIS, SUM(TRANSITENS.VR_PIS) VR_PIS, ');
    QRel.Sql.Add('SUM(TRANSITENS.VR_TOTAL + TRANSITENS.VALOR_ICMS_ST + TRANSITENS.VR_FRETE + TRANSITENS.VR_ACRESCIMO + TRANSITENS.VR_IPI - TRANSITENS.DESC_RODAPE) VR_VENDA ');
    QRel.Sql.Add('FROM TRANSITENS ');
    QRel.Sql.Add('INNER JOIN TRANSACOES ON TRANSACOES.TRANSACAO_ID = TRANSITENS.TRANSACAO_ID ');
    QRel.Sql.Add('INNER JOIN PRODUTOS ON PRODUTOS.PRODUTO_ID = TRANSITENS.PRODUTO_ID ');
    QRel.Sql.Add('INNER JOIN COMPL_NFCEFISCAL ON COMPL_NFCEFISCAL.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID ');
    QRel.Sql.Add('WHERE (TRANSACOES.DT_ENT_SAI BETWEEN :DT_INICIAL AND :DT_FINAL) ');
    QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN(SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');
    QRel.Sql.Add('AND ((TRANSACOES.BALANCO <> :BALANCO) OR (TRANSACOES.BALANCO IS NULL))');
    QRel.Sql.Add('AND (TRANSACOES.MODELO = :MODELO1) ');
    QRel.Sql.Add('GROUP BY TRANSACOES.DT_ENT_SAI, TRANSITENS.CFOP,  PRODUTOS.ALIQUOTA_ICMS,PRODUTOS.PIS, PRODUTOS.COFINS ');

    QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
    QRel.ParamByName('BALANCO').AsString      := 'AGRUPADO';
    QRel.ParamByName('MODELO1').AsString      := '65';
    QRel.Prepare;
    QRel.Open;

    {
    if Tipo_Rel.Text = 'Analítico' then
    begin
      if (Dtmen.Date = FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime) and (Dtmai.Date = FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime) then
      begin
        if Preco.Text = 'Custo de Compra' then
          QRel.Sql.Add('SELECT TRANSITENS.PRODUTO_ID, PRODUTOS.DESCRICAO, PRODUTOS.COD_BARRA, TABELAS.DESCRICAO GRUPO, SUM(TRANSITENS.QUANTIDADE) QTD_VENDA, ' +
                       'SUM(TRANSITENS.VR_TOTAL + TRANSITENS.VALOR_ICMS_ST + TRANSITENS.VR_FRETE + TRANSITENS.VR_ACRESCIMO + TRANSITENS.VR_IPI - TRANSITENS.DESC_RODAPE) VR_VENDA, SUM(TRANSITENS.QUANTIDADE * PRODUTOS.CUSTO_COMPRA) CUSTO, SUM(DESC_RODAPE) DESCONTO')
        else if Preco.Text = 'Valor de Compra' then
          QRel.Sql.Add('SELECT TRANSITENS.PRODUTO_ID, PRODUTOS.DESCRICAO, PRODUTOS.COD_BARRA, TABELAS.DESCRICAO GRUPO, SUM(TRANSITENS.QUANTIDADE) QTD_VENDA, ' +
                       'SUM(TRANSITENS.VR_TOTAL + TRANSITENS.VALOR_ICMS_ST + TRANSITENS.VR_FRETE + TRANSITENS.VR_ACRESCIMO + TRANSITENS.VR_IPI - TRANSITENS.DESC_RODAPE) VR_VENDA, SUM(TRANSITENS.QUANTIDADE * PRODUTOS.VALOR_COMPRA) CUSTO, SUM(DESC_RODAPE) DESCONTO')
        else if Preco.Text = 'Customédio' then
          QRel.Sql.Add('SELECT TRANSITENS.PRODUTO_ID, PRODUTOS.DESCRICAO, PRODUTOS.COD_BARRA, TABELAS.DESCRICAO GRUPO, SUM(TRANSITENS.QUANTIDADE) QTD_VENDA, ' +
                       'SUM(TRANSITENS.VR_TOTAL + TRANSITENS.VALOR_ICMS_ST + TRANSITENS.VR_FRETE + TRANSITENS.VR_ACRESCIMO + TRANSITENS.VR_IPI - TRANSITENS.DESC_RODAPE) VR_VENDA, SUM(TRANSITENS.QUANTIDADE * PRODUTOS.CUSTOMEDIO) CUSTO, SUM(DESC_RODAPE) DESCONTO')
        else
          QRel.Sql.Add('SELECT TRANSITENS.PRODUTO_ID, PRODUTOS.DESCRICAO, PRODUTOS.COD_BARRA, TABELAS.DESCRICAO GRUPO, SUM(TRANSITENS.QUANTIDADE) QTD_VENDA, ' +
                       'SUM(TRANSITENS.VR_TOTAL + TRANSITENS.VALOR_ICMS_ST + TRANSITENS.VR_FRETE + TRANSITENS.VR_ACRESCIMO + TRANSITENS.VR_IPI - TRANSITENS.DESC_RODAPE) VR_VENDA, SUM(TRANSITENS.QUANTIDADE * PRODUTOS.CUSTOMEDIO) CUSTO, SUM(DESC_RODAPE) DESCONTO');

        QRel.Sql.Add('FROM TRANSITENS');
        QRel.Sql.Add('INNER JOIN TRANSACOES');
        QRel.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
        QRel.Sql.Add('INNER JOIN PRODUTOS');
        QRel.Sql.Add('ON (TRANSITENS.PRODUTO_ID = PRODUTOS.PRODUTO_ID)');
        QRel.Sql.Add('INNER JOIN TABELAS');
        QRel.Sql.Add('ON (PRODUTOS.GRUPO_ID = TABELAS.TABELA_ID AND TABELAS.TIPO_TABELA = :TIPO_TABELA)');
        QRel.Sql.Add('WHERE');
        QRel.Sql.Add('(TRANSACOES.DT_ENT_SAI BETWEEN :DT_INICIAL AND :DT_FINAL)');
        QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :CONDUTA)');
        QRel.Sql.Add('AND (TRANSACOES.DEPTO = :DEPTO)');
        QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
        QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
        QRel.Sql.Add('AND (TRANSACOES.BALANCO <> :BALANCO)');
        QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN(SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');

        if Tipo_Venda.Text <> '' then
        begin
          QRel.Sql.Add('AND (TRANSACOES.TIPO_VENDA = :TIPO_VENDA)');
          QRel.ParamByName('TIPO_VENDA').AsString  := Tipo_Venda.Text;
        end;
      end
      else
      begin
        QRel.Sql.Add('SELECT PRODUTO_ID,  DESCRICAO, COD_BARRA,GRUPO, SUM(QTD_VENDA) QTD_VENDA, SUM(VR_VENDA) VR_VENDA, SUM(CUSTO) CUSTO, SUM(DESCONTO) DESCONTO');
        QRel.Sql.Add('FROM(');

        if Preco.Text = 'Custo de Compra' then
          QRel.Sql.Add('SELECT  TRANSITENS.PRODUTO_ID, PRODUTOS.DESCRICAO,  PRODUTOS.COD_BARRA, TABELAS.DESCRICAO GRUPO,(TRANSITENS.QUANTIDADE) QTD_VENDA,' +
                       '(TRANSITENS.VR_TOTAL + TRANSITENS.VALOR_ICMS_ST + TRANSITENS.VR_FRETE + TRANSITENS.VR_ACRESCIMO + TRANSITENS.VR_IPI - TRANSITENS.DESC_RODAPE) VR_VENDA, ' +
                       'CASE WHEN ((POSICAO_PRODUTOS.CUSTO_COMPRA IS NULL) or (POSICAO_PRODUTOS.CUSTO_COMPRA = 0)) THEN (TRANSITENS.QUANTIDADE * PRODUTOS.CUSTO_COMPRA) ' +
                       'ELSE (TRANSITENS.QUANTIDADE * POSICAO_PRODUTOS.CUSTO_COMPRA) END CUSTO, (DESC_RODAPE) DESCONTO')
        else if Preco.Text = 'Valor de Compra' then
          QRel.Sql.Add('SELECT  TRANSITENS.PRODUTO_ID, PRODUTOS.DESCRICAO, PRODUTOS.COD_BARRA, TABELAS.DESCRICAO GRUPO, (TRANSITENS.QUANTIDADE) QTD_VENDA,  ' +
                      '(TRANSITENS.VR_TOTAL + TRANSITENS.VALOR_ICMS_ST + TRANSITENS.VR_FRETE + TRANSITENS.VR_ACRESCIMO + TRANSITENS.VR_IPI - TRANSITENS.DESC_RODAPE) VR_VENDA, ' +
                      'CASE WHEN ((POSICAO_PRODUTOS.VALOR_COMPRA IS NULL) or (POSICAO_PRODUTOS.VALOR_COMPRA = 0)) THEN (TRANSITENS.QUANTIDADE * PRODUTOS.VALOR_COMPRA) ' +
                      'ELSE (TRANSITENS.QUANTIDADE * POSICAO_PRODUTOS.VALOR_COMPRA) END CUSTO, (DESC_RODAPE) DESCONTO')
        else if Preco.Text = 'Customédio' then
          QRel.Sql.Add('SELECT TRANSITENS.PRODUTO_ID, PRODUTOS.DESCRICAO, PRODUTOS.COD_BARRA, TABELAS.DESCRICAO GRUPO, (TRANSITENS.QUANTIDADE) QTD_VENDA, ' +
                       '(TRANSITENS.VR_TOTAL + TRANSITENS.VALOR_ICMS_ST + TRANSITENS.VR_FRETE + TRANSITENS.VR_ACRESCIMO + TRANSITENS.VR_IPI - TRANSITENS.DESC_RODAPE) VR_VENDA, ' +
                       'CASE WHEN ((POSICAO_PRODUTOS.CUSTOMEDIO IS NULL) or (POSICAO_PRODUTOS.CUSTOMEDIO = 0)) THEN (TRANSITENS.QUANTIDADE * PRODUTOS.CUSTOMEDIO) ' +
                       'ELSE (TRANSITENS.QUANTIDADE * POSICAO_PRODUTOS.CUSTOMEDIO) END CUSTO, (DESC_RODAPE) DESCONTO')
        else
          QRel.Sql.Add('SELECT TRANSITENS.PRODUTO_ID, PRODUTOS.DESCRICAO, PRODUTOS.COD_BARRA, TABELAS.DESCRICAO GRUPO, (TRANSITENS.QUANTIDADE) QTD_VENDA,  ' +
                       '(TRANSITENS.VR_TOTAL + TRANSITENS.VALOR_ICMS_ST + TRANSITENS.VR_FRETE + TRANSITENS.VR_ACRESCIMO + TRANSITENS.VR_IPI - TRANSITENS.DESC_RODAPE) VR_VENDA, ' +
                       'CASE WHEN ((POSICAO_PRODUTOS.CUSTOMEDIO IS NULL) or (POSICAO_PRODUTOS.CUSTOMEDIO = 0)) THEN SUM(TRANSITENS.QUANTIDADE * PRODUTOS.CUSTOMEDIO) ' +
                       'ELSE (TRANSITENS.QUANTIDADE * POSICAO_PRODUTOS.CUSTOMEDIO) END CUSTO, (DESC_RODAPE) DESCONTO');

        QRel.Sql.Add('FROM TRANSITENS');
        QRel.Sql.Add('INNER JOIN TRANSACOES');
        QRel.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
        QRel.Sql.Add('LEFT JOIN PRODUTOS');
        QRel.Sql.Add('ON (TRANSITENS.PRODUTO_ID = PRODUTOS.PRODUTO_ID)');
        QRel.Sql.Add('LEFT JOIN TABELAS');
        QRel.Sql.Add('ON (PRODUTOS.GRUPO_ID = TABELAS.TABELA_ID AND TABELAS.TIPO_TABELA = :TIPO_TABELA)');
        QRel.Sql.Add('LEFT JOIN POSICAO_PRODUTOS');
        QRel.Sql.Add('ON (TRANSITENS.PRODUTO_ID = POSICAO_PRODUTOS.PRODUTO_ID AND POSICAO_PRODUTOS.DT_MOVIMENTO = TRANSACOES.DT_ENT_SAI)');
        QRel.Sql.Add('WHERE');
        QRel.Sql.Add('(TRANSACOES.DT_ENT_SAI BETWEEN :DT_INICIAL AND :DT_FINAL)');
        QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :CONDUTA)');
        QRel.Sql.Add('AND (TRANSACOES.DEPTO = :DEPTO)');
        QRel.Sql.Add('AND (TRANSACOES.TPCTB  <= :TPCTB)');
        QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
        QRel.Sql.Add('AND (TRANSACOES.BALANCO <> :BALANCO)');
        QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN(SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');

        if Tipo_Venda.Text <> '' then
        begin
          QRel.Sql.Add('AND (TRANSACOES.TIPO_VENDA = :TIPO_VENDA)');
          QRel.ParamByName('TIPO_VENDA').AsString  := Tipo_Venda.Text;
        end;
      end;

      if StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Fornecedor')) > 0 then
      begin
        QRel.Sql.Add('AND (PRODUTOS.FORNECEDOR_ID = :FORNECEDOR_ID)');

        QRel.ParamByName('FORNECEDOR_ID').AsInteger := StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Fornecedor'));
      end;

      if StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Grupo')) > 0 then
      begin
        QRel.Sql.Add('AND (PRODUTOS.GRUPO_ID = :GRUPO_ID)');

        QRel.ParamByName('GRUPO_ID').AsInteger := StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Grupo'));
      end;

      if StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'SubTipo')) > 0 then
      begin
        QRel.Sql.Add('AND (PRODUTOS.SUBTIPO_ID = :SUBTIPO_ID)');

        QRel.ParamByName('SUBTIPO_ID').AsInteger := StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'SubTipo'));
      end;

      if StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Localização')) > 0 then
      begin
        QRel.Sql.Add('AND (PRODUTOS.LOCALIZACAO_ID = :LOCALIZACAO_ID)');

        QRel.ParamByName('LOCALIZACAO_ID').AsInteger := StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Localização'));
      end;

      if StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Produto Inicial')) > 0 then
      begin
        QRel.Sql.Add('AND (PRODUTOS.PRODUTO_ID BETWEEN :PRODUTO_INICIAL AND :PRODUTO_FINAL)');

        QRel.ParamByName('PRODUTO_INICIAL').AsInteger := StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Produto Inicial'));
        QRel.ParamByName('PRODUTO_FINAL').AsInteger   := StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Produto Final'));
      end;


       if (Dtmen.Date <> FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime)  OR (Dtmai.Date <> FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime) then
       Begin
       QRel.Sql.Add(') AS TESTE');
       QRel.Sql.Add('GROUP BY PRODUTO_ID, DESCRICAO, COD_BARRA, GRUPO');
       End
       Else
       Begin
       if Preco.Text = 'Custo de Compra' then
       QRel.Sql.Add('GROUP BY TRANSITENS.PRODUTO_ID, PRODUTOS.DESCRICAO, PRODUTOS.COD_BARRA, TABELAS.DESCRICAO')
       else if Preco.Text = 'Valor de Compra' then
       QRel.Sql.Add('GROUP BY TRANSITENS.PRODUTO_ID, PRODUTOS.DESCRICAO, PRODUTOS.COD_BARRA, TABELAS.DESCRICAO')
       else if Preco.Text = 'Customédio' then
        QRel.Sql.Add('GROUP BY TRANSITENS.PRODUTO_ID, PRODUTOS.DESCRICAO, PRODUTOS.COD_BARRA, TABELAS.DESCRICAO')
       else
       QRel.Sql.Add('GROUP BY TRANSITENS.PRODUTO_ID, PRODUTOS.DESCRICAO, PRODUTOS.COD_BARRA, TABELAS.DESCRICAO');
       End;


      if Ordem.Text = 'CÓDIGO' then
        QRel.Sql.Add('ORDER BY 4, 1')
      else if Ordem.Text = 'DESCRIÇÃO' then
        QRel.Sql.Add('ORDER BY 4, 2')
      else if Ordem.Text = 'QTD. VENDA' then
        QRel.Sql.Add('ORDER BY 4, 5 DESC')
      else if Ordem.Text = 'VALOR VENDA' then
        QRel.Sql.Add('ORDER BY 4, 6 DESC')
      else
        QRel.Sql.Add('ORDER BY 4, 2');

      QRel.ParamByName('TIPO_TABELA').AsString  := '7';
      QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
      QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
      QRel.ParamByName('CONDUTA').AsString      := '01';
      QRel.ParamByName('DEPTO').AsString        := '07';
      QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
      QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
      QRel.ParamByName('BALANCO').AsString      := 'AGRUPADO';

      QRLabel13.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;
    end
    else
    begin
      if (Dtmen.Date = FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime) and (Dtmai.Date = FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime) then
      begin
        if Preco.Text = 'Custo de Compra' then
          QRel.Sql.Add('SELECT TABELAS.DESCRICAO GRUPO, SUM(TRANSITENS.QUANTIDADE) QTD_VENDA, ' +
                       'SUM(TRANSITENS.VR_TOTAL + TRANSITENS.VALOR_ICMS_ST + TRANSITENS.VR_FRETE + TRANSITENS.VR_ACRESCIMO + TRANSITENS.VR_IPI - TRANSITENS.DESC_RODAPE) VR_VENDA, SUM(TRANSITENS.QUANTIDADE * PRODUTOS.CUSTO_COMPRA) CUSTO, SUM(DESC_RODAPE) DESCONTO')
        else if Preco.Text = 'Valor de Compra' then
          QRel.Sql.Add('SELECT TABELAS.DESCRICAO GRUPO, SUM(TRANSITENS.QUANTIDADE) QTD_VENDA, ' +
                       'SUM(TRANSITENS.VR_TOTAL + TRANSITENS.VALOR_ICMS_ST + TRANSITENS.VR_FRETE + TRANSITENS.VR_ACRESCIMO + TRANSITENS.VR_IPI - TRANSITENS.DESC_RODAPE) VR_VENDA, SUM(TRANSITENS.QUANTIDADE * PRODUTOS.VALOR_COMPRA) CUSTO, SUM(DESC_RODAPE) DESCONTO')
        else if Preco.Text = 'Customédio' then
          QRel.Sql.Add('SELECT TABELAS.DESCRICAO GRUPO, SUM(TRANSITENS.QUANTIDADE) QTD_VENDA, ' +
                       'SUM(TRANSITENS.VR_TOTAL + TRANSITENS.VALOR_ICMS_ST + TRANSITENS.VR_FRETE + TRANSITENS.VR_ACRESCIMO + TRANSITENS.VR_IPI - TRANSITENS.DESC_RODAPE) VR_VENDA, SUM(TRANSITENS.QUANTIDADE * PRODUTOS.CUSTOMEDIO) CUSTO, SUM(DESC_RODAPE) DESCONTO')
        else
          QRel.Sql.Add('SELECT TABELAS.DESCRICAO GRUPO, SUM(TRANSITENS.QUANTIDADE) QTD_VENDA, ' +
                       'SUM(TRANSITENS.VR_TOTAL + TRANSITENS.VALOR_ICMS_ST + TRANSITENS.VR_FRETE + TRANSITENS.VR_ACRESCIMO + TRANSITENS.VR_IPI - TRANSITENS.DESC_RODAPE) VR_VENDA, SUM(TRANSITENS.QUANTIDADE * PRODUTOS.CUSTOMEDIO) CUSTO, SUM(DESC_RODAPE) DESCONTO');

        QRel.Sql.Add('FROM TRANSITENS');
        QRel.Sql.Add('INNER JOIN TRANSACOES');
        QRel.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
        QRel.Sql.Add('INNER JOIN PRODUTOS');
        QRel.Sql.Add('ON (TRANSITENS.PRODUTO_ID = PRODUTOS.PRODUTO_ID)');
        QRel.Sql.Add('INNER JOIN TABELAS');
        QRel.Sql.Add('ON (PRODUTOS.GRUPO_ID = TABELAS.TABELA_ID AND TABELAS.TIPO_TABELA = :TIPO_TABELA)');
        QRel.Sql.Add('WHERE');
        QRel.Sql.Add('(TRANSACOES.DT_ENT_SAI BETWEEN :DT_INICIAL AND :DT_FINAL)');
        QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :CONDUTA)');
        QRel.Sql.Add('AND (TRANSACOES.DEPTO = :DEPTO)');
        QRel.Sql.Add('AND (TRANSACOES.TPCTB  <= :TPCTB)');
        QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
        QRel.Sql.Add('AND (TRANSACOES.BALANCO <> :BALANCO)');
        QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN(SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');

        if Tipo_Venda.Text <> '' then
        begin
          QRel.Sql.Add('AND (TRANSACOES.TIPO_VENDA = :TIPO_VENDA)');
          QRel.ParamByName('TIPO_VENDA').AsString  := Tipo_Venda.Text;
        end;
      end
      else
      begin
        QRel.Sql.Add('SELECT GRUPO, SUM(QTD_VENDA) QTD_VENDA, SUM(VR_VENDA) VR_VENDA, SUM (CUSTO) CUSTO, SUM(DESCONTO) DESCONTO');
        QRel.Sql.Add('FROM(');

        if Preco.Text = 'Custo de Compra' then
          QRel.Sql.Add('SELECT  TRANSITENS.PRODUTO_ID, TABELAS.DESCRICAO GRUPO, (TRANSITENS.QUANTIDADE) QTD_VENDA, ' +
                       '(TRANSITENS.VR_TOTAL + TRANSITENS.VALOR_ICMS_ST + TRANSITENS.VR_FRETE + TRANSITENS.VR_ACRESCIMO + TRANSITENS.VR_IPI - TRANSITENS.DESC_RODAPE) VR_VENDA, ' +
                       'CASE WHEN ((POSICAO_PRODUTOS.CUSTO_COMPRA IS NULL) or (POSICAO_PRODUTOS.CUSTO_COMPRA = 0)) THEN (TRANSITENS.QUANTIDADE * PRODUTOS.CUSTO_COMPRA) ' +
                       'ELSE (TRANSITENS.QUANTIDADE * POSICAO_PRODUTOS.CUSTO_COMPRA) END CUSTO, (DESC_RODAPE) DESCONTO')
        else if Preco.Text = 'Valor de Compra' then
          QRel.Sql.Add('SELECT  TRANSITENS.PRODUTO_ID, TABELAS.DESCRICAO GRUPO, (TRANSITENS.QUANTIDADE) QTD_VENDA, ' +
                       '(TRANSITENS.VR_TOTAL + TRANSITENS.VALOR_ICMS_ST + TRANSITENS.VR_FRETE + TRANSITENS.VR_ACRESCIMO + TRANSITENS.VR_IPI - TRANSITENS.DESC_RODAPE) VR_VENDA, ' +
                       'CASE WHEN ((POSICAO_PRODUTOS.VALOR_COMPRA IS NULL) or (POSICAO_PRODUTOS.VALOR_COMPRA = 0)) THEN (TRANSITENS.QUANTIDADE * PRODUTOS.VALOR_COMPRA) ' +
                       'ELSE (TRANSITENS.QUANTIDADE * POSICAO_PRODUTOS.VALOR_COMPRA) END CUSTO, (DESC_RODAPE) DESCONTO')
        else if Preco.Text = 'Customédio' then
          QRel.Sql.Add('SELECT TRANSITENS.PRODUTO_ID, TABELAS.DESCRICAO GRUPO, (TRANSITENS.QUANTIDADE) QTD_VENDA,' +
                       '(TRANSITENS.VR_TOTAL + TRANSITENS.VALOR_ICMS_ST + TRANSITENS.VR_FRETE + TRANSITENS.VR_ACRESCIMO + TRANSITENS.VR_IPI - TRANSITENS.DESC_RODAPE) VR_VENDA, ' +
                       'CASE WHEN ((POSICAO_PRODUTOS.CUSTOMEDIO IS NULL) or (POSICAO_PRODUTOS.CUSTOMEDIO = 0)) THEN (TRANSITENS.QUANTIDADE * PRODUTOS.CUSTOMEDIO) ' +
                       'ELSE (TRANSITENS.QUANTIDADE * POSICAO_PRODUTOS.CUSTOMEDIO) END CUSTO, (DESC_RODAPE) DESCONTO')
        else
          QRel.Sql.Add('SELECT  TRANSITENS.PRODUTO_ID, TABELAS.DESCRICAO GRUPO, (TRANSITENS.QUANTIDADE) QTD_VENDA,' +
                       '(TRANSITENS.VR_TOTAL + TRANSITENS.VALOR_ICMS_ST + TRANSITENS.VR_FRETE + TRANSITENS.VR_ACRESCIMO + TRANSITENS.VR_IPI - TRANSITENS.DESC_RODAPE) VR_VENDA, ' +
                       'CASE WHEN ((POSICAO_PRODUTOS.CUSTOMEDIO IS NULL) or (POSICAO_PRODUTOS.CUSTOMEDIO = 0)) THEN (TRANSITENS.QUANTIDADE * PRODUTOS.CUSTOMEDIO) ' +
                       'ELSE (TRANSITENS.QUANTIDADE * POSICAO_PRODUTOS.CUSTOMEDIO) END CUSTO, (DESC_RODAPE) DESCONTO');

        QRel.Sql.Add('FROM TRANSITENS');
        QRel.Sql.Add('INNER JOIN TRANSACOES');
        QRel.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
        QRel.Sql.Add('LEFT JOIN PRODUTOS');
        QRel.Sql.Add('ON (TRANSITENS.PRODUTO_ID = PRODUTOS.PRODUTO_ID)');
        QRel.Sql.Add('LEFT JOIN TABELAS');
        QRel.Sql.Add('ON (PRODUTOS.GRUPO_ID = TABELAS.TABELA_ID AND TABELAS.TIPO_TABELA = :TIPO_TABELA)');
        QRel.Sql.Add('LEFT JOIN POSICAO_PRODUTOS');
        QRel.Sql.Add('ON (TRANSITENS.PRODUTO_ID = POSICAO_PRODUTOS.PRODUTO_ID AND POSICAO_PRODUTOS.DT_MOVIMENTO = TRANSACOES.DT_ENT_SAI)');
        QRel.Sql.Add('WHERE');
        QRel.Sql.Add('(TRANSACOES.DT_ENT_SAI BETWEEN :DT_INICIAL AND :DT_FINAL)');
        QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :CONDUTA)');
        QRel.Sql.Add('AND (TRANSACOES.DEPTO = :DEPTO)');
        QRel.Sql.Add('AND (TRANSACOES.TPCTB  <= :TPCTB)');
        QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
        QRel.Sql.Add('AND (TRANSACOES.BALANCO <> :BALANCO)');
        QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN(SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');

        if Tipo_Venda.Text <> '' then
        begin
          QRel.Sql.Add('AND (TRANSACOES.TIPO_VENDA = :TIPO_VENDA)');
          QRel.ParamByName('TIPO_VENDA').AsString  := Tipo_Venda.Text;
        end;
      end;

      if StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Fornecedor')) > 0 then
      begin
        QRel.Sql.Add('AND (PRODUTOS.FORNECEDOR_ID = :FORNECEDOR_ID)');

        QRel.ParamByName('FORNECEDOR_ID').AsInteger := StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Fornecedor'));
      end;

      if StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Grupo')) > 0 then
      begin
        QRel.Sql.Add('AND (PRODUTOS.GRUPO_ID = :GRUPO_ID)');

        QRel.ParamByName('GRUPO_ID').AsInteger := StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Grupo'));
      end;

      if StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'SubTipo')) > 0 then
      begin
        QRel.Sql.Add('AND (PRODUTOS.SUBTIPO_ID = :SUBTIPO_ID)');

        QRel.ParamByName('SUBTIPO_ID').AsInteger := StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'SubTipo'));
      end;

      if StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Localização')) > 0 then
      begin
        QRel.Sql.Add('AND (PRODUTOS.LOCALIZACAO_ID = :LOCALIZACAO_ID)');

        QRel.ParamByName('LOCALIZACAO_ID').AsInteger := StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Localização'));
      end;

      if StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Produto Inicial')) > 0 then
      begin
        QRel.Sql.Add('AND (PRODUTOS.PRODUTO_ID BETWEEN :PRODUTO_INICIAL AND :PRODUTO_FINAL)');

        QRel.ParamByName('PRODUTO_INICIAL').AsInteger := StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Produto Inicial'));
        QRel.ParamByName('PRODUTO_FINAL').AsInteger   := StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Produto Final'));
      end;



      if (Dtmen.Date <> FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime)  OR (Dtmai.Date <> FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime) then
      QRel.Sql.Add(') AS TESTE');

      QRel.Sql.Add('GROUP BY GRUPO');

      QRel.Sql.Add('ORDER BY 1');

      QRel.ParamByName('TIPO_TABELA').AsString  := '7';
      QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
      QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
      QRel.ParamByName('CONDUTA').AsString      := '01';
      QRel.ParamByName('DEPTO').AsString        := '07';
      QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
      QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
      QRel.ParamByName('BALANCO').AsString      := 'AGRUPADO';

      QRLabel16.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;
    end;


    QRel.Prepare;
    QRel.Open;
     }
    if QRel.IsEmpty then
      Application.MessageBox('Não há dados para os parâmetros informados', PChar(Msg_Title), mb_IconInformation)
    else
      Fim.PreviewModal;

  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;

procedure TFrmRel_Saidas_Nfce.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRel_Saidas_Nfce.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmRel_Saidas_Nfce.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    //Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmRel_Saidas_Nfce.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmRel_Saidas_Nfce.FormCreate(Sender: TObject);
begin
  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);
end;

procedure TFrmRel_Saidas_Nfce.OrdemKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

end.
