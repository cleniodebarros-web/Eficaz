unit UAgenda_Salao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, Grids, DBGrids, StdCtrls, Buttons,
  ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.ComCtrls, Vcl.Samples.Calendar ;

type
  TFrmAgenda_Salao = class(TForm)
    Panel1: TPanel;
    btnRetorna: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    Contas_Pagar: TDBGrid;
    QContas_Pagar: TFDQuery;
    QCheques_Emitidos: TFDQuery;
    QLiquida: TFDQuery;
    DataContas_Pagar: TDataSource;
    DataCheques_Emitidos: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure Cheques_EmitidosDblClick(Sender: TObject);
    procedure QContas_PagarAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAgenda_Salao: TFrmAgenda_Salao;

implementation

uses
  UPrincipal, UData, ULiquidacao_Cheques;

{$R *.dfm}

procedure TFrmAgenda_Salao.Cheques_EmitidosDblClick(Sender: TObject);
begin
  Application.CreateForm(TFrmLiquidacao_Cheques, FrmLiquidacao_Cheques);
  try
    if FrmLiquidacao_Cheques.ShowModal = mrOK then
    begin
      QLiquida.Sql.Clear;
      QLiquida.Sql.Add('UPDATE CHEQUES_EMITIDOS SET LIQUIDADO = :LIQUIDADO, DT_LIQUIDACAO = :DT_LIQUIDACAO');
      QLiquida.Sql.Add('WHERE');
      QLiquida.Sql.Add('(NUM_CHEQUE = :NUM_CHEQUE)');

      QLiquida.ParamByName('LIQUIDADO').AsString       := 'SIM';
      QLiquida.ParamByName('DT_LIQUIDACAO').AsDateTime := FrmLiquidacao_Cheques.Dt_Liquidacao.Date;
      QLiquida.ParamByName('NUM_CHEQUE').AsInteger     := QCheques_Emitidos.FieldByName('NUM_CHEQUE').AsInteger;

      QLiquida.Prepare;
      QLiquida.ExecSql;



      QLiquida.Sql.Clear;
      QLiquida.Sql.Add('INSERT INTO TRANSACOES( ' +
                       'DT_TRANS,         DT_MOVIMENTO,    EMPRESA_ID,        FORNECEDOR_ID, ' +
                       'NUM_DOC,          SERIE,           MODELO,            CFOP, ' +
                       'CONTA_ID,         BANCO_ID,        VALOR,             NUM_CHEQUE, ' +
                       'BALANCO,          C_CUSTO_ID,      COND_PAGTO,        PATRIMONIO_ID, ' +
                       'ODOMETRO,         QUANTIDADE,      BASE_ICMS_NORMAL,  CST_ICMS, ' +
                       'ALIQUOTA_ICMS,    VR_ICMS_NORMAL,  BASE_CALC_PIS,     CST_PIS, ' +
                       'ALIQUOTA_PIS,     VR_PIS,          BASE_CALC_COFINS,  CST_COFINS, ' +
                       'ALIQUOTA_COFINS,  VR_COFINS,       VALOR_OUTROS,      VALOR_ISENTO, ' +
                       'FLUXO_CAIXA_ID,   HISTORICO,       AUTORIZ_ID,        CONDUTA, ' +
                       'DEPTO,            TPCTB) VALUES(' +
                       ':DT_TRANS,        :DT_MOVIMENTO,   :EMPRESA_ID,       :FORNECEDOR_ID, ' +
                       ':NUM_DOC,         :SERIE,          :MODELO,           :CFOP, ' +
                       ':CONTA_ID,        :BANCO_ID,       :VALOR,            :NUM_CHEQUE, ' +
                       ':BALANCO,         :C_CUSTO_ID,     :COND_PAGTO,       :PATRIMONIO_ID, ' +
                       ':ODOMETRO,        :QUANTIDADE,     :BASE_ICMS_NORMAL, :CST_ICMS, ' +
                       ':ALIQUOTA_ICMS,   :VR_ICMS_NORMAL, :BASE_CALC_PIS,    :CST_PIS, ' +
                       ':ALIQUOTA_PIS,    :VR_PIS,         :BASE_CALC_COFINS, :CST_COFINS, ' +
                       ':ALIQUOTA_COFINS, :VR_COFINS,      :VALOR_OUTROS,     :VALOR_ISENTO, ' +
                       ':FLUXO_CAIXA_ID,  :HISTORICO,      :AUTORIZ_ID,       :CONDUTA, ' +
                       ':DEPTO,           :TPCTB)');

      QLiquida.ParamByName('DT_TRANS').AsDateTime      := FrmLiquidacao_Cheques.Dt_Liquidacao.Date;
      QLiquida.ParamByName('DT_MOVIMENTO').AsDateTime  := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
      QLiquida.ParamByName('EMPRESA_ID').AsInteger     := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
      QLiquida.ParamByName('FORNECEDOR_ID').AsInteger  := 0;
      QLiquida.ParamByName('NUM_DOC').AsString         := '';
      QLiquida.ParamByName('SERIE').AsString           := '';
      QLiquida.ParamByName('MODELO').AsString          := '';
      QLiquida.ParamByName('CFOP').AsString            := '';
      QLiquida.ParamByName('CONTA_ID').AsInteger       := FrmPrincipal.Config.FieldByName('CONTA_ESTOQUE').AsInteger;
      QLiquida.ParamByName('BANCO_ID').AsInteger       := QCheques_Emitidos.FieldByName('BANCO_ID').AsInteger;
      QLiquida.ParamByName('VALOR').AsFloat            := QCheques_Emitidos.FieldByName('VALOR').AsFloat;
      QLiquida.ParamByName('NUM_CHEQUE').AsString      := StrZero(QCheques_Emitidos.FieldByName('NUM_CHEQUE').AsString, 6, 0);
      QLiquida.ParamByName('BALANCO').AsString         := 'LIBERADO';
      QLiquida.ParamByName('C_CUSTO_ID').AsInteger     := 1;
      QLiquida.ParamByName('COND_PAGTO').AsString      := 'A VISTA';
      QLiquida.ParamByName('PATRIMONIO_ID').AsInteger  := 0;
      QLiquida.ParamByName('ODOMETRO').AsFloat         := 0;
      QLiquida.ParamByName('QUANTIDADE').AsFloat       := 0;
      QLiquida.ParamByName('BASE_ICMS_NORMAL').AsFloat := 0;
      QLiquida.ParamByName('CST_ICMS').AsString        := '';
      QLiquida.ParamByName('ALIQUOTA_ICMS').AsFloat    := 0;
      QLiquida.ParamByName('VR_ICMS_NORMAL').AsFloat   := 0;
      QLiquida.ParamByName('BASE_CALC_PIS').AsFloat    := 0;
      QLiquida.ParamByName('CST_PIS').AsString         := '';
      QLiquida.ParamByName('ALIQUOTA_PIS').AsFloat     := 0;
      QLiquida.ParamByName('VR_PIS').AsFloat           := 0;
      QLiquida.ParamByName('ALIQUOTA_ICMS').AsFloat    := 0;
      QLiquida.ParamByName('BASE_CALC_COFINS').AsFloat := 0;
      QLiquida.ParamByName('CST_COFINS').AsString      := '';
      QLiquida.ParamByName('ALIQUOTA_COFINS').AsFloat  := 0;
      QLiquida.ParamByName('VR_COFINS').AsFloat        := 0;
      QLiquida.ParamByName('VALOR_OUTROS').AsFloat     := 0;
      QLiquida.ParamByName('VALOR_ISENTO').AsFloat     := 0;
      QLiquida.ParamByName('FLUXO_CAIXA_ID').AsInteger := 3;
      QLiquida.ParamByName('HISTORICO').AsString       := QCheques_Emitidos.FieldByName('HISTORICO').AsString;
      QLiquida.ParamByName('AUTORIZ_ID').AsInteger     := FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger;
      QLiquida.ParamByName('CONDUTA').AsString         := '02';
      QLiquida.ParamByName('DEPTO').AsString           := '02';
      QLiquida.ParamByName('TPCTB').AsString           := FrmData.QAcesso.FieldByName('TPCTB').AsString;

      QLiquida.Prepare;
      QLiquida.ExecSql;



      FormCreate(Sender);
    end;
  finally
    FrmLiquidacao_Cheques.Release;
  end;
end;

procedure TFrmAgenda_Salao.FormCreate(Sender: TObject);
begin
  Label1.Caption := 'Agenda Salão: ' + FrmPrincipal.QEmpresa.FieldByName('FANTASIA').AsString + ' Dia: ' + DateToStr(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime);

  QContas_Pagar.Sql.Clear;
  QContas_Pagar.Sql.Add('SELECT ORDEM_SERVICO.*, FUNCIONARIOS.NOME');
  QContas_Pagar.Sql.Add('FROM ORDEM_SERVICO');
  QContas_Pagar.Sql.Add('INNER JOIN FUNCIONARIOS');
  QContas_Pagar.Sql.Add('ON (ORDEM_SERVICO.FUNCIONARIO = FUNCIONARIOS.FUNCIONARIO_ID)');
  QContas_Pagar.Sql.Add('WHERE');
  QContas_Pagar.Sql.Add('(ORDEM_SERVICO.STATUS = :STATUS)');
  QContas_Pagar.Sql.Add('AND (ORDEM_SERVICO.PREV_ATEND >= :DATA)');
  QContas_Pagar.Sql.Add('ORDER BY ORDEM_SERVICO.PREV_ATEND');


  QContas_Pagar.ParamByName('DATA').AsDateTime        := (FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime -3 );
  QCOntas_Pagar.ParamByName('STATUS').AsString        := 'ABERTA';


  QContas_Pagar.Prepare;
  QContas_Pagar.Open;

end;

procedure TFrmAgenda_Salao.QContas_PagarAfterOpen(DataSet: TDataSet);
begin
TFloatField(QContas_Pagar.FieldByName('VALOR')).DisplayFormat  := '#,##0.00';
end;

end.
