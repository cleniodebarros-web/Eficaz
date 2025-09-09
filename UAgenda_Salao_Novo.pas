unit UAgenda_Salao_Novo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, Grids, DBGrids, StdCtrls, Buttons,
  ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.ComCtrls, Vcl.Samples.Calendar, Data.Bind.EngExt, Vcl.Bind.DBEngExt,
  Vcl.Bind.Grid, System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors,
  Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope, Datasnap.DBClient,
  Vcl.Menus, Vcl.ImgList,Math ;

type
  TFrmAgenda_Salao_Novo = class(TForm)
    Panel1: TPanel;
    btnRetorna: TBitBtn;
    QContas_Pagar: TFDQuery;
    QCheques_Emitidos: TFDQuery;
    QLiquida: TFDQuery;
    DataContas_Pagar: TDataSource;
    DataCheques_Emitidos: TDataSource;
    Calendario: TMonthCalendar;
    Qagenda: TFDQuery;
    QSearch: TFDQuery;
    IQuery: TFDQuery;
    PopupMenu: TPopupMenu;
    Menu_Agendar: TMenuItem;
    Modificar1: TMenuItem;
    Excluir1: TMenuItem;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    ImageList1: TImageList;
    Panel2: TPanel;
    Panel3: TPanel;
    QId_Func: TFDQuery;
    QRel: TFDQuery;
    QUpdate: TFDQuery;
    QAgenda_Venda: TFDQuery;
    Panel4: TPanel;
    strGrid_Agenda: TStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure Cheques_EmitidosDblClick(Sender: TObject);
    procedure QContas_PagarAfterOpen(DataSet: TDataSet);
    procedure strGrid_AgendaDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure CalendarioClick(Sender: TObject);
    procedure strGrid_AgendaMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnRetornaClick(Sender: TObject);
    procedure Menu_AgendarClick(Sender: TObject);
    procedure Modificar1Click(Sender: TObject);
    procedure Excluir1Click(Sender: TObject);
    Procedure CalcularAgenda;


  private
    { Private declarations }
  public
    { Public declarations }
  end;

Const
Intervalo = '00:30:00';

var
  FrmAgenda_Salao_Novo: TFrmAgenda_Salao_Novo;


implementation

uses
  UPrincipal, UData, ULiquidacao_Cheques,UCadastro_Agenda,UTrans_Venda_Estoque;

{$R *.dfm}

Procedure TFrmAgenda_Salao_Novo.CalcularAgenda;
var
i,Linha:Integer;
Hora:TTime;
begin

 for linha:= 0 to strGrid_Agenda.RowCount -1 do
 begin
    strGrid_Agenda.Rows[linha].Clear;
 End;

 Panel3.Caption := DiaExtenso(Calendario.Date);
 Panel2.Caption := DatetoStr(Calendario.Date);


 QAgenda.Close;
 QAgenda.ParamByName('DT_AGENDA').AsDate := Calendario.Date;

 QAgenda.Prepare;
 QAgenda.Open;


  Linha := 1;
  Hora := StrToTime( FrmPrincipal.Config.FieldByName('H_INICIO_S').AsString );
  i:= 1;
  strGrid_Agenda.Cells[0, 0] := 'Horário';

  while Hora <= StrToTime( FrmPrincipal.Config.FieldByName('H_FIM_S').AsString ) do
  begin
    strGrid_Agenda.Cells[0, Linha] := copy(TimeToStr(Hora),1,5);

   QAgenda.First;
    While not QAgenda.Eof Do
    Begin

        i:= QAgenda.FieldByName('COLUNA').AsInteger;

        if QAgenda.FieldByName('HORA').AsString = copy(TimeToStr(Hora),1,5) Then
        Begin

          strGrid_Agenda.Cells[0, Linha] := QAgenda.FieldByName('HORA').AsString;
          strGrid_Agenda.Cells[i,0]      := QAgenda.FieldByName('APELIDO').AsString;
          strGrid_Agenda.Cells[i,linha]  := QAgenda.FieldByName('TRATAMENTO').AsString +  #13 +'Fone: ' + QAgenda.FieldByName('TELEFONE').AsString ;

        End;
       // Else
       // strGrid_Agenda.colwidths[i]:= -1;

      QAgenda.Next;



    End;

    Hora := Hora + StrToTime(INTERVALO);
    Inc( Linha );

  end;
  StrGrid_Agenda.RowCount  := Linha;
  StrGrid_Agenda.ColCount  := FrmPrincipal.Config.FieldByName('FUNC_SALAO').AsInteger;;
  StrGrid_Agenda.FixedCols := 1;
 StrGrid_Agenda.FixedRows  := 1;

end;


procedure TFrmAgenda_Salao_Novo.btnRetornaClick(Sender: TObject);
begin
Close;
end;

procedure TFrmAgenda_Salao_Novo.CalendarioClick(Sender: TObject);
var
i,Linha:Integer;
Hora:TTime;
begin

 for linha:= 0 to strGrid_Agenda.RowCount -1 do
 begin
    strGrid_Agenda.Rows[linha].Clear;
 End;

 Panel3.Caption := DiaExtenso(Calendario.Date);
 Panel2.Caption := DatetoStr(Calendario.Date);


 QAgenda.Close;
 QAgenda.ParamByName('DT_AGENDA').AsDate := Calendario.Date;

 QAgenda.Prepare;
 QAgenda.Open;


  Linha := 1;
  Hora := StrToTime( FrmPrincipal.Config.FieldByName('H_INICIO_S').AsString );
  i:= 1;
  strGrid_Agenda.Cells[0, 0] := 'Horário';

  while Hora <= StrToTime( FrmPrincipal.Config.FieldByName('H_FIM_S').AsString ) do
  begin
    strGrid_Agenda.Cells[0, Linha] := copy(TimeToStr(Hora),1,5);

   QAgenda.First;
    While not QAgenda.Eof Do
    Begin

        i:= QAgenda.FieldByName('COLUNA').AsInteger;

        if QAgenda.FieldByName('HORA').AsString = copy(TimeToStr(Hora),1,5) Then
        Begin

          strGrid_Agenda.Cells[0, Linha] := QAgenda.FieldByName('HORA').AsString;
          strGrid_Agenda.Cells[i,0]      := QAgenda.FieldByName('APELIDO').AsString;
          strGrid_Agenda.Cells[i,linha]  := QAgenda.FieldByName('TRATAMENTO').AsString +  #13 +'Fone: ' + QAgenda.FieldByName('TELEFONE').AsString ;

        End;
       // Else
       // strGrid_Agenda.colwidths[i]:= -1;

      QAgenda.Next;



    End;

    Hora := Hora + StrToTime(INTERVALO);
    Inc( Linha );

  end;
  StrGrid_Agenda.RowCount   := Linha;
  StrGrid_Agenda.ColCount   := FrmPrincipal.Config.FieldByName('FUNC_SALAO').AsInteger;;
  StrGrid_Agenda.FixedCols  := 1;
  StrGrid_Agenda.FixedRows  := 1;

end;

procedure TFrmAgenda_Salao_Novo.Cheques_EmitidosDblClick(Sender: TObject);
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

procedure TFrmAgenda_Salao_Novo.Excluir1Click(Sender: TObject);
var
lin_top,lin_bottom,Col_top,id_trans,itens:integer;
valor_produtos,unidades :Real;
begin
Lin_top    := StrGrid_Agenda.Selection.Top;
lin_bottom := StrGrid_Agenda.Selection.Bottom;
Col_top    := StrGrid_Agenda.Col;


 // Cadastro_Agenda(2,StrGrid_Agenda.Cells[Col_Top,0],DateToStr(Calendario.Date),StrGrid_Agenda.Cells[0,Lin_top],StrGrid_Agenda.Cells[0,lin_bottom])

    QId_Func.Close;
    QId_Func.ParambyName('APELIDO').AsString := StrGrid_Agenda.Cells[Col_Top,0];
    QId_Func.prepare;
    QId_Func.Open;


    QAgenda_venda.sql.Text:= 'SELECT * FROM AGENDA WHERE DT_AGENDA = :DT_AGENDA AND FUNCIONARIO_ID = :FUNCIONARIO_ID AND HORA BETWEEN :HORA_INI AND :HORA_FIM AND (TRANSACAO_ID = 0 OR TRANSACAO_ID IS NULL)';

    QAgenda_venda.ParamByName('DT_AGENDA').AsDateTime     := StrToDate(DateToStr(Calendario.Date));
    QAgenda_venda.ParamByName('FUNCIONARIO_ID').AsInteger := QId_Func.FieldByName('FUNCIONARIO_ID').AsInteger;
    QAgenda_venda.ParamByName('HORA_INI').AsString        := StrGrid_Agenda.Cells[0,Lin_top];
    QAgenda_venda.ParamByName('HORA_FIM').AsString        := StrGrid_Agenda.Cells[0,lin_bottom];

    QAgenda_venda.Prepare;
    QAgenda_venda.Open;

 IF not QAgenda_venda.isempty Then
 Begin

    IQuery.SQL.Clear;
    IQuery.SQL.Add('SELECT NEXTVAL(:GEN_TRANSACOES) ID');
    IQuery.ParamByName('GEN_TRANSACOES').AsString :=  'GEN_TRANSACOES';

    IQuery.Prepare;
    IQuery.Open;

    Id_Trans := IQuery.FieldByName('ID').AsInteger;


    QRel.Sql.Clear;
    QRel.Sql.Add('INSERT INTO TRANSACOES( ' +
                 'TRANSACAO_ID,  DT_TRANS,    DT_MOVIMENTO,    CONDUTA, ' +
                 'DEPTO,         EMPRESA_ID,  CONTA_ID,        C_CUSTO_ID, ' +
                 'VALOR,         TPCTB,       AUTORIZ_ID,      HISTORICO, ' +
                 'CONTAAUX_ID,   NUM_DOC,     BANCO_ID,        BALANCO, ' +
                 'COND_PAGTO,    SERIE,       FLUXO_CAIXA_ID,  TIPO_VENDA, ' +
                 'CLIENTE_ID,    MODELO,      SUB_CODIGO,HORA,VENDEDOR_ID) VALUES(' +
                 ':TRANSACAO_ID, :DT_TRANS,   :DT_MOVIMENTO,   :CONDUTA, ' +
                 ':DEPTO,        :EMPRESA_ID, :CONTA_ID,       :C_CUSTO_ID, ' +
                 ':VALOR,        :TPCTB,      :AUTORIZ_ID,     :HISTORICO, ' +
                 ':CONTAAUX_ID,  :NUM_DOC,    :BANCO_ID,       :BALANCO, ' +
                 ':COND_PAGTO,   :SERIE,      :FLUXO_CAIXA_ID, :TIPO_VENDA, ' +
                 ':CLIENTE_ID,   :MODELO,     :SUB_CODIGO,:HORA,:VENDEDOR_ID)');

    QRel.ParamByName('TRANSACAO_ID').AsInteger   := Id_Trans;
    QRel.ParamByName('DT_TRANS').AsDateTime      := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
    QRel.ParamByName('DT_MOVIMENTO').AsDateTime  := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
    QRel.ParamByName('CONDUTA').AsString         := '01';
    QRel.ParamByName('DEPTO').AsString           := '07';
    QRel.ParamByName('EMPRESA_ID').AsInteger     := FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger;;
    QRel.ParamByName('CONTA_ID').AsInteger       := FrmPrincipal.Config.FieldByName('CONTA_ESTOQUE').AsInteger;
    QRel.ParamByName('C_CUSTO_ID').AsInteger     := 1;
    QRel.ParamByName('VALOR').AsFloat            := 0;
    QRel.ParamByName('TPCTB').AsString           := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    QRel.ParamByName('AUTORIZ_ID').AsInteger     := 0;
    QRel.ParamByName('HISTORICO').AsString       := 'SERVIÇOS EFETUADOS NA DATA ' + DateToStr(Calendario.Date) + ' N.Doc: ' + StrZero(IntToStr(Id_Trans),9,0);
    QRel.ParamByName('CONTAAUX_ID').AsInteger    := 0;
    QRel.ParamByName('NUM_DOC').AsString         := StrZero(IntToStr(Id_Trans),9,0);
    QRel.ParamByName('BANCO_ID').AsInteger       := StrToInt(LeIni(Arq_Ini, 'Sistema', 'Caixa'));
    QRel.ParamByName('COND_PAGTO').AsString      := 'A VISTA';
    QRel.ParamByName('BALANCO').AsString         := 'LIBERADO';
    QRel.ParamByName('SERIE').AsString           := '001';
    QRel.ParamByName('FLUXO_CAIXA_ID').AsInteger := 2;
    QRel.ParamByName('TIPO_VENDA').AsString      := 'VENDA';
    QRel.ParamByName('CLIENTE_ID').AsInteger     := QAgenda_venda.FieldByName('CLIENTE_ID').AsInteger;
    QRel.ParamByName('MODELO').AsString          := '01';
    QRel.ParamByName('SUB_CODIGO').AsString      := '1 - NORMAL';
    QRel.ParamByName('HORA').AsString            := TimeToStr(time);
    QRel.ParamByName('VENDEDOR_ID').AsInteger    := QAgenda_venda.FieldByName('FUNCIONARIO_ID').AsInteger;

    QRel.Prepare;
    QRel.ExecSql;



    itens := 1;


    QAgenda_venda.Close;
    QAgenda_venda.sql.Text:= 'SELECT SERVICO_ID, SERVICO,  SUM(VR_SERVICO) VR_SERVICO FROM AGENDA WHERE DT_AGENDA = :DT_AGENDA AND FUNCIONARIO_ID = :FUNCIONARIO_ID AND HORA BETWEEN :HORA_INI AND :HORA_FIM GROUP BY SERVICO_ID,SERVICO';


    QAgenda_venda.ParamByName('DT_AGENDA').AsDateTime     := StrToDate(DateToStr(Calendario.Date));
    QAgenda_venda.ParamByName('FUNCIONARIO_ID').AsInteger := QId_Func.FieldByName('FUNCIONARIO_ID').AsInteger;
    QAgenda_venda.ParamByName('HORA_INI').AsString        := StrGrid_Agenda.Cells[0,Lin_top];
    QAgenda_venda.ParamByName('HORA_FIM').AsString        := StrGrid_Agenda.Cells[0,lin_bottom];

    QAgenda_venda.Prepare;
    QAgenda_venda.Open;
    QAgenda_venda.First;



    While not QAgenda_venda.eof do
    Begin

      QUpdate.Sql.Clear;
      QUpdate.Sql.Add('INSERT INTO TRANSITENS( ' +
                      'TRANSACAO_ID,   PRODUTO_ID,      TP_PROD_SERV,   CFOP, ' +
                      'DESCRICAO,      CONTA_ID,        TRIBUTO_ID,     CST, ' +
                      'MVA,            BASE_CALC_ICMS,  ALIQUOTA_ICMS,  VALOR_ICMS, ' +
                      'BASE_CALC_ST,   VALOR_ICMS_ST,   VALOR_ISENTO,   VALOR_OUTROS, ' +
                      'VR_IPI,         QUANTIDADE,      VR_UNITARIO,    VR_DESCONTO, ' +
                      'VR_TOTAL,CST_PIS,CST_COFINS,DESC_RODAPE,SEQUENCIA) VALUES(' +
                      ':TRANSACAO_ID,  :PRODUTO_ID,     :TP_PROD_SERV,  :CFOP, ' +
                      ':DESCRICAO,     :CONTA_ID,       :TRIBUTO_ID,    :CST, ' +
                      ':MVA,           :BASE_CALC_ICMS, :ALIQUOTA_ICMS, :VALOR_ICMS, ' +
                      ':BASE_CALC_ST,  :VALOR_ICMS_ST,  :VALOR_ISENTO,  :VALOR_OUTROS, ' +
                      ':VR_IPI,        :QUANTIDADE,     :VR_UNITARIO,   :VR_DESCONTO, ' +
                      ':VR_TOTAL,      :CST_PIS,        :CST_COFINS,    :DESC_RODAPE,:SEQUENCIA )');

      QUpdate.ParamByName('TRANSACAO_ID').AsInteger  := Id_Trans;
      QUpdate.ParamByName('PRODUTO_ID').AsInteger    := QAgenda_venda.FieldByName('SERVICO_ID').AsInteger;
      QUpdate.ParamByName('TP_PROD_SERV').AsString   := 'S';
      QUpdate.ParamByName('CFOP').AsString           := '5929'; // QTributo.FieldByName('CFOP').AsString;
      QUpdate.ParamByName('DESCRICAO').AsString      := QAgenda_venda.FieldByName('SERVICO').AsString;
      QUpdate.ParamByName('CONTA_ID').AsInteger      := FrmPrincipal.Config.FieldByName('CONTA_ESTOQUE').AsInteger;
      QUpdate.ParamByName('TRIBUTO_ID').AsInteger    := 7;//QProduto.FieldByName('TRIBUTO_ID').AsInteger;
      QUpdate.ParamByName('CST').AsString            :='000';
      QUpdate.ParamByName('MVA').AsFloat             := 0;
      QUpdate.ParamByName('BASE_CALC_ICMS').AsFloat  := 0;//RoundTo(Base_ICMS_Normal, -2);
      QUpdate.ParamByName('ALIQUOTA_ICMS').AsFloat   := 0;//QProduto.FieldByName('ALIQUOTA_ICMS').AsFloat;
      QUpdate.ParamByName('VALOR_ICMS').AsFloat      := 0;//RoundTo(Vr_ICMS_Normal, -2);
      QUpdate.ParamByName('BASE_CALC_ST').AsFloat    := 0;
      QUpdate.ParamByName('VALOR_ICMS_ST').AsFloat   := 0;
      QUpdate.ParamByName('VALOR_ISENTO').AsFloat    := 0;
      QUpdate.ParamByName('VALOR_OUTROS').AsFloat    := 0;
      QUpdate.ParamByName('VR_IPI').AsFloat          := 0;
      QUpdate.ParamByName('QUANTIDADE').AsFloat      := 1;
      QUpdate.ParamByName('VR_UNITARIO').AsFloat     := QAgenda_venda.FieldByName('VR_SERVICO').AsFloat;
      QUpdate.ParamByName('VR_DESCONTO').AsFloat     := 0;
      QUpdate.ParamByName('VR_TOTAL').AsFloat        := QAgenda_venda.FieldByName('VR_SERVICO').AsFloat;
      QUpdate.ParamByName('CST_PIS').AsString        := '49';
      QUpdate.ParamByName('CST_COFINS').AsString     := '49';
      QUpdate.ParamByName('DESC_RODAPE').AsFloat     := 0;
      QUpdate.ParamByName('SEQUENCIA').AsInteger     := Itens + 1;

      QUpdate.Prepare;
      QUpdate.ExecSql;


      Itens              := (Itens + 1);
      Unidades           := (Unidades + 1);
      Valor_Produtos     := Valor_Produtos + QAgenda_venda.FieldByName('VR_SERVICO').AsFloat;


     QAgenda_venda.next;

    End;


    QUpdate.Sql.Clear;
    QUpdate.Sql.Add('UPDATE TRANSACOES SET ' +
                                           'BASE_ICMS_NORMAL = :BASE_ICMS_NORMAL, VR_ICMS_NORMAL = :VR_ICMS_NORMAL, ' +
                                           'BASE_ICMS_ST     = :BASE_ICMS_ST,     VR_ICMS_ST     = :VR_ICMS_ST, ' +
                                           'ITENS            = :ITENS,            UNIDADES       = :UNIDADES, ' +
                                           'VALOR_PRODUTOS   = :VALOR_PRODUTOS, '+
                                           'VALOR            = :VALOR,            CFOP           = :CFOP, ' +
                                           'VR_ACRESCIMO     = :VR_ACRESCIMO, ' +
                                           'VR_DESCONTO      = :VR_DESCONTO ');
    QUpdate.Sql.Add('WHERE');
    QUpdate.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

    QUpdate.ParamByName('BASE_ICMS_NORMAL').AsFloat := 0;//RoundTo(Base_ICMS_Normal_T, -2);
    QUpdate.ParamByName('VR_ICMS_NORMAL').AsFloat   := 0;//RoundTo(Vr_ICMS_Normal_T, -2);
    QUpdate.ParamByName('BASE_ICMS_ST').AsFloat     := 0;//RoundTo(Base_ICMS_ST_T, -2);
    QUpdate.ParamByName('VR_ICMS_ST').AsFloat       := 0;//RoundTo(Vr_ICMS_ST_T, -2);
    QUpdate.ParamByName('ITENS').AsInteger          := Itens;
    QUpdate.ParamByName('UNIDADES').AsFloat         := Unidades;
    QUpdate.ParamByName('VALOR_PRODUTOS').AsFloat   := RoundTo(Valor_Produtos, -2);
    QUpdate.ParamByName('VALOR').AsFloat            := RoundTo(Valor_Produtos , -2) ;
    QUpdate.ParamByName('CFOP').AsString            := '5929'; //CFOP;
    QUpdate.ParamByName('VR_DESCONTO').AsFloat      := 0;
    QUpdate.ParamByName('VR_ACRESCIMO').AsFloat     := 0;
    QUpdate.ParamByName('TRANSACAO_ID').AsInteger   := Id_Trans;

    QUpdate.Prepare;
    QUpdate.ExecSql;



    QUpdate.SQL.Clear;
    QUpdate.SQL.Add('UPDATE AGENDA SET TRANSACAO_ID = :TRANSACAO_ID');
    QUpdate.SQL.Add('WHERE DT_AGENDA = :DT_AGENDA AND FUNCIONARIO_ID = :FUNCIONARIO_ID AND HORA BETWEEN :HORA_INI AND :HORA_FIM');

    QUpdate.ParamByName('TRANSACAO_ID').AsInteger    := Id_Trans;
    QUpdate.ParamByName('DT_AGENDA').AsDateTime     := StrToDate(DateToStr(Calendario.Date));
    QUpdate.ParamByName('FUNCIONARIO_ID').AsInteger := QId_Func.FieldByName('FUNCIONARIO_ID').AsInteger;
    QUpdate.ParamByName('HORA_INI').AsString        := StrGrid_Agenda.Cells[0,Lin_top];
    QUpdate.ParamByName('HORA_FIM').AsString        := StrGrid_Agenda.Cells[0,lin_bottom];
    QUpdate.Prepare;
    QUpdate.ExecSQL;


    Trans_Venda_Estoque(Id_Trans);
 End
 Else
 Application.MessageBox('Agendamento já convertito em venda.','Eficaz', MB_ICONINFORMATION + MB_OK);


end;

procedure TFrmAgenda_Salao_Novo.FormCreate(Sender: TObject);
var
i,w: integer;
begin
  {Label1.Caption := 'Agenda Salão: ' + FrmPrincipal.QEmpresa.FieldByName('FANTASIA').AsString + ' Dia: ' + DateToStr(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime);

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
  QContas_Pagar.Open;  }


 

End;




procedure TFrmAgenda_Salao_Novo.FormShow(Sender: TObject);
var
i , LINHA:integer;
Hora,hora_linha:ttime;
begin

 Panel3.Caption := DiaExtenso(Date);
 Panel2.Caption := DatetoStr(date);

 Calendario.Date := Date;

 QAgenda.Close;
 QAgenda.ParamByName('DT_AGENDA').AsDate := Calendario.Date;


 QAgenda.Prepare;
 QAgenda.Open;


  Linha := 1;
  Hora := StrToTime( FrmPrincipal.Config.FieldByName('H_INICIO_S').AsString );
  i:= 1;
  strGrid_Agenda.Cells[0, 0] := 'Horário';

  while Hora <= StrToTime( FrmPrincipal.Config.FieldByName('H_FIM_S').AsString ) do
  begin
    strGrid_Agenda.Cells[0, Linha] := copy(TimeToStr(Hora),1,5);

  //  if  QAgenda.Locate( 'HORA', copy(TimeToStr(Hora),1,5), [] ) then
   QAgenda.First;
    While not QAgenda.Eof Do
    Begin
       // showmessage( strGrid_Agenda.Cells[i,0] + ' = ' + QAgenda.FieldByName('APELIDO').AsString);

        //if  QAgenda.Locate( 'HORA', copy(TimeToStr(Hora),1,5), [] ) then

       // strGrid_Agenda.Cells[0, Linha] := copy(TimeToStr(Hora),1,5);


        i:= QAgenda.FieldByName('COLUNA').AsInteger;

        if QAgenda.FieldByName('HORA').AsString = copy(TimeToStr(Hora),1,5) Then
        Begin

          strGrid_Agenda.Cells[0, Linha] := QAgenda.FieldByName('HORA').AsString;
          strGrid_Agenda.Cells[i,0]      := QAgenda.FieldByName('APELIDO').AsString;
          strGrid_Agenda.Cells[i,linha]  := QAgenda.FieldByName('TRATAMENTO').AsString +  #13 +'Fone: ' + QAgenda.FieldByName('TELEFONE').AsString ;

          //
         { if strGrid_Agenda.Cells[i -1,0] = QAgenda.FieldByName('APELIDO').AsString Then
          Begin
          i := i -1;
          strGrid_Agenda.Cells[0, Linha] := QAgenda.FieldByName('HORA').AsString;
          strGrid_Agenda.Cells[i,0]      := QAgenda.FieldByName('APELIDO').AsString;
          strGrid_Agenda.Cells[i,linha]  := QAgenda.FieldByName('TRATAMENTO').AsString;
          End
          Else
          Begin
          strGrid_Agenda.Cells[0, Linha] := QAgenda.FieldByName('HORA').AsString;
          strGrid_Agenda.Cells[i,0]      := QAgenda.FieldByName('APELIDO').AsString;
          strGrid_Agenda.Cells[i,linha]  := QAgenda.FieldByName('TRATAMENTO').AsString;
          inc(i);
          End; }
          //inc(i);
        End;





      //  showmessage( strGrid_Agenda.Cells[i - 1,0] + ' = ' + QAgenda.FieldByName('APELIDO').AsString);

       {  if strGrid_Agenda.Cells[i -1,0] = QAgenda.FieldByName('APELIDO').AsString Then
         Begin
         i := i -1;
         inc(linha);
         End;
        Else
        Begin
         inc(linha);
         Hora := Hora + StrToTime(INTERVALO);
        End; }


        // Hora := Hora + StrToTime(INTERVALO);
        // Inc( Linha );



       // if strGrid_Agenda.Cells[i - 1,0] <> QAgenda.FieldByName('APELIDO').AsString Then



       // inc(i);
      // Inc( Linha );

      QAgenda.Next;
    End;

    Hora := Hora + StrToTime(INTERVALO);
    Inc( Linha );

  end;
  StrGrid_Agenda.RowCount := Linha;
  StrGrid_Agenda.ColCount := FrmPrincipal.Config.FieldByName('FUNC_SALAO').AsInteger;;
  //StrGrid_Agenda.Width    := (StrGrid_Agenda.DefaultColWidth * i);



 {
 while not QAgenda.Eof Do
 Begin
  strGrid_Agenda.Cells[i,0] := QAgenda.FieldByName('APELIDO').AsString ;
  strGrid_Agenda.Cells[0,i] := QAgenda.FieldByName('HORA').AsString ;
  inc(i);
 QAgenda.next;
 End;

 }

 StrGrid_Agenda.FixedCols := 1;
 StrGrid_Agenda.FixedRows := 1;
end;

procedure TFrmAgenda_Salao_Novo.Menu_AgendarClick(Sender: TObject);
var
lin_top,lin_bottom:integer;
Hora_fim:string;
begin

    Lin_top    := StrGrid_Agenda.Selection.Top;
    lin_bottom := StrGrid_Agenda.Selection.Bottom;
    Hora_fim   := TimetoStr(StrTotime(StrGrid_Agenda.Cells[0,lin_bottom])+ StrToTime(intervalo));

 Cadastro_Agenda(1,'',DateToStr(Calendario.Date),StrGrid_Agenda.Cells[0,Lin_top],Hora_fim);
 CalcularAgenda;
end;

procedure TFrmAgenda_Salao_Novo.Modificar1Click(Sender: TObject);
var
lin_top,lin_bottom,col_top:integer;
begin
    Lin_top    := StrGrid_Agenda.Selection.Top;
    lin_bottom := StrGrid_Agenda.Selection.Bottom;
    Col_top    := StrGrid_Agenda.Col;

 Cadastro_Agenda(2,StrGrid_Agenda.Cells[Col_Top,0],DateToStr(Calendario.Date),StrGrid_Agenda.Cells[0,Lin_top],StrGrid_Agenda.Cells[0,lin_bottom]);
 CalcularAgenda;
end;

procedure TFrmAgenda_Salao_Novo.QContas_PagarAfterOpen(DataSet: TDataSet);
begin
TFloatField(QContas_Pagar.FieldByName('VALOR')).DisplayFormat  := '#,##0.00';
end;

procedure TFrmAgenda_Salao_Novo.strGrid_AgendaDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  S : string;
  Format : integer;

begin
  TRY
  S := strGrid_Agenda.Cells[ACol, ARow];

    if (S <> '')  Then
    begin
     // Delete(S, 1, 1);


      IQuery.Sql.Clear;
      IQuery.Sql.Add('SELECT FUNCIONARIO_ID FROM FUNCIONARIOS WHERE APELIDO =:APELIDO ');
      IQuery.ParamByName('APELIDO').AsString := strGrid_Agenda.Cells[ACol, 0];
      IQuery.Prepare;
      IQuery.Open;


      QSearch.Sql.Clear;
      QSearch.Sql.Add('SELECT COLORS, COLUNA FROM AGENDA WHERE FUNCIONARIO_ID = :FUNCIONARIO_ID AND HORA = :HORA AND DT_AGENDA = :DT_AGENDA');
      QSearch.ParamByName('HORA').AsString            := strGrid_Agenda.Cells[0, ARow];
      QSearch.ParamByName('DT_AGENDA').AsDate         := Calendario.Date;
      QSearch.ParamByName('FUNCIONARIO_ID').AsInteger := IQuery.FieldByName('FUNCIONARIO_ID').AsInteger;
      QSearch.Prepare;
      QSearch.Open;



      if (ACol > 0) and (ARow > 0)   then
      begin
        with strGrid_Agenda.Canvas do
        begin
          Brush.color := StringToColor(QSearch.FieldByName('COLORS').AsString);
          Font.Color  :=  clBlack;
          //strGrid_Agenda.ColWidths[Acol] := TextWidth(S) + 4;
        end;


      end;
    end;

    if (ACol = 0) then // se coluna = 0 alinha ao centro
    Format := DT_CENTER
    else if (ARow = 0) then //se linha=0 alinha ao centro
    Format := DT_CENTER
    else // caso contrario a esquerda
    Format := DT_LEFT; //DT_RIGHT alinha a direita


    with strGrid_Agenda.Canvas do
    begin
     if (ACol > 0) and (ARow > 0) then
      begin
       FillRect(Rect);
       //TextRect(Rect, (Rect.Left + Rect.Right - TextWidth(S)) div 2,
       //(Rect.Top + Rect.Bottom - TextHeight(S)) div 2, S);
       //TextOut(Rect.Left+largurac-largurat,Rect.Top, S);

      //DrawText(strGrid_Agenda.Canvas.Handle,PChar(s),-1,Rect,DT_CENTER);
      DrawText(strGrid_Agenda.Canvas.Handle,PChar(S),-1,Rect,Format);
      end;
    end;
  EXCEPT

  END;

end;

procedure TFrmAgenda_Salao_Novo.strGrid_AgendaMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
r,c,Col,Row : integer;
conteudo:string;
begin
 try
 StrGrid_Agenda.MouseToCell(X, Y, C, R);

  if ((Row <> r) or (Col <> c)) then
  begin
  Row := r; Col := c;
    IF (R > 0) AND (C > 0) Then
    Begin
    conteudo :=StrGrid_Agenda.Cells[c,r];
    StrGrid_Agenda.Hint     := conteudo;
    StrGrid_Agenda.ShowHint := True;
    End;
  end
  Else
  StrGrid_Agenda.Hint :='';
 Except

 end;


end;

end.
