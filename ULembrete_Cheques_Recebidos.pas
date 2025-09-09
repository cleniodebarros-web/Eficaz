unit ULembrete_Cheques_Recebidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, Grids, DBGrids, StdCtrls, Buttons,
  ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmLembrete_Cheques_Recebidos = class(TForm)
    Panel1: TPanel;
    btnRetorna: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    Contas_Pagar: TDBGrid;
    DataCheques_Recebidos: TDataSource;
    Qcheques_recebidos: TFDQuery;
    QLiquida: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Contas_PagarDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLembrete_Cheques_Recebidos: TFrmLembrete_Cheques_Recebidos;

implementation

uses
  UPrincipal, UData, ULiquidacao_Cheques;

{$R *.dfm}

procedure TFrmLembrete_Cheques_Recebidos.Contas_PagarDblClick(Sender: TObject);
begin
  Application.CreateForm(TFrmLiquidacao_Cheques, FrmLiquidacao_Cheques);
  try
    if FrmLiquidacao_Cheques.ShowModal = mrOK then
    begin
      QLiquida.Sql.Clear;
      QLiquida.Sql.Add('UPDATE CHEQUES_RECEBIDOS SET LIQUIDADO = :LIQUIDADO, DT_LIQUIDACAO = :DT_LIQUIDACAO');
      QLiquida.Sql.Add('WHERE');
      QLiquida.Sql.Add('(CHEQUE_ID = :CHEQUE_ID)');

      QLiquida.ParamByName('LIQUIDADO').AsString       := 'SIM';
      QLiquida.ParamByName('DT_LIQUIDACAO').AsDateTime := FrmLiquidacao_Cheques.Dt_Liquidacao.Date;
      QLiquida.ParamByName('CHEQUE_ID').AsInteger      := QCheques_Recebidos.FieldByName('CHEQUE_ID').AsInteger;

      QLiquida.Prepare;
      QLiquida.ExecSql;



      QLiquida.Sql.Clear;
      QLiquida.Sql.Add('INSERT INTO TRANSACOES( ' +
                       'DT_TRANS,       DT_MOVIMENTO,  EMPRESA_ID,      CLIENTE_ID, '+
                       'NUM_DOC,        CONTA_ID,      BANCO_ID,        C_CUSTO_ID, ' +
                       'PATRIMONIO_ID,  ODOMETRO,      QUANTIDADE,      VALOR, ' +
                       'BALANCO,        COND_PAGTO,    FLUXO_CAIXA_ID,  HISTORICO, ' +
                       'AUTORIZ_ID,     CONDUTA,       DEPTO,           TPCTB) VALUES(' +
                       ':DT_TRANS,      :DT_MOVIMENTO, :EMPRESA_ID,     :CLIENTE_ID, '+
                       ':NUM_DOC,       :CONTA_ID,     :BANCO_ID,       :C_CUSTO_ID, ' +
                       ':PATRIMONIO_ID, :ODOMETRO,     :QUANTIDADE,     :VALOR, ' +
                       ':BALANCO,       :COND_PAGTO,   :FLUXO_CAIXA_ID, :HISTORICO, ' +
                       ':AUTORIZ_ID,    :CONDUTA,      :DEPTO,          :TPCTB)');

      QLiquida.ParamByName('DT_TRANS').AsDateTime      := FrmLiquidacao_Cheques.Dt_Liquidacao.Date;
      QLiquida.ParamByName('DT_MOVIMENTO').AsDateTime  := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
      QLiquida.ParamByName('EMPRESA_ID').AsInteger     := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
      QLiquida.ParamByName('CLIENTE_ID').AsInteger     := QCheques_Recebidos.FieldByName('CLIENTE_ID').AsInteger;
      QLiquida.ParamByName('NUM_DOC').AsString         := StrZero(QCheques_Recebidos.FieldByName('CHEQUE_ID').AsString, 6, 0);
      QLiquida.ParamByName('CONTA_ID').AsInteger       := FrmPrincipal.Config.FieldByName('CONTA_ESTOQUE').AsInteger;
      QLiquida.ParamByName('BANCO_ID').AsInteger       := StrToInt(LeIni(Arq_Ini, 'Sistema', 'Caixa'));
      QLiquida.ParamByName('C_CUSTO_ID').AsInteger     := 1;
      QLiquida.ParamByName('PATRIMONIO_ID').AsInteger  := 0;
      QLiquida.ParamByName('ODOMETRO').AsFloat         := 0;
      QLiquida.ParamByName('QUANTIDADE').AsFloat       := 0;
      QLiquida.ParamByName('VALOR').AsFloat            := QCheques_Recebidos.FieldByName('VALOR').AsFloat;
      QLiquida.ParamByName('BALANCO').AsString         := 'LIBERADO';
      QLiquida.ParamByName('COND_PAGTO').AsString      := 'A VISTA';
      QLiquida.ParamByName('FLUXO_CAIXA_ID').AsInteger := 1;
      QLiquida.ParamByName('HISTORICO').AsString       := 'Vr. Baixa Cheque - ' + QCheques_Recebidos.FieldByName('NOME_CLIENTE').AsString;
      QLiquida.ParamByName('AUTORIZ_ID').AsInteger     := FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger;
      QLiquida.ParamByName('CONDUTA').AsString         := '01';
      QLiquida.ParamByName('DEPTO').AsString           := '03';
      QLiquida.ParamByName('TPCTB').AsString           := FrmData.QAcesso.FieldByName('TPCTB').AsString;

      QLiquida.Prepare;
      QLiquida.ExecSql;



      FormCreate(Sender);
    end;
  finally
    FrmLiquidacao_Cheques.Release;
  end;

end;

procedure TFrmLembrete_Cheques_Recebidos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GravaIni(Arq_Ini, 'Sistema', 'Mostrar Lembrete', 'False');
end;

procedure TFrmLembrete_Cheques_Recebidos.FormCreate(Sender: TObject);
begin
  QCheques_Recebidos.Sql.Clear;
  QCheques_Recebidos.Sql.Add('SELECT * FROM CHEQUES_RECEBIDOS');
  QCheques_Recebidos.Sql.Add('WHERE');
  QCheques_Recebidos.Sql.Add('(DT_VENCIMENTO <= :DATA)');
  QCheques_Recebidos.Sql.Add('AND (LIQUIDADO <> :LIQUIDADO)');

  QCheques_Recebidos.ParamByName('DATA').AsDateTime    := (FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime + 3);
  QCheques_Recebidos.ParamByName('LIQUIDADO').AsString := 'SIM';

  QCheques_Recebidos.Prepare;
  QCheques_Recebidos.Open;
end;

end.
