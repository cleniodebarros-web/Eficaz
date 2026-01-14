unit UAgrupa_Orcamento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Forms, Dialogs, Controls, StdCtrls,
  Buttons, rxCurrEdit, Mask, rxToolEdit, ExtCtrls, Grids, DBGrids, DBCtrls, DB,
  IBCustomDataSet, IBQuery, IBStoredProc, Math, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmAgrupa_Orcamento = class(TForm)
    SrcList: TListBox;
    DstList: TListBox;
    SrcLabel: TLabel;
    DstLabel: TLabel;
    IncludeBtn: TSpeedButton;
    IncAllBtn: TSpeedButton;
    ExcludeBtn: TSpeedButton;
    ExAllBtn: TSpeedButton;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    btnCliente: TSpeedButton;
    Dtmen: TDateEdit;
    Dtmai: TDateEdit;
    Cliente: TCurrencyEdit;
    btnSelecao: TButton;
    Panel2: TPanel;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    DBGrid1: TDBGrid;
    DBText1: TDBText;
    DataCliente: TDataSource;
    DataItens: TDataSource;
    Vr_Quitar: TRxCalcEdit;
    Label27: TLabel;
    Vr_Soma: TRxCalcEdit;
    Label3: TLabel;
    Vr_Desconto: TRxCalcEdit;
    Label4: TLabel;
    QCliente: TFDQuery;
    QRel: TFDQuery;
    QItens: TFDQuery;
    QTributo: TFDQuery;
    QProduto: TFDQuery;
    QUpdate: TFDQuery;
    IQuery: TFDQuery;
    COND_PAGTO: TComboBox;
    Label5: TLabel;procedure IncludeBtnClick(Sender: TObject);
    procedure ExcludeBtnClick(Sender: TObject);
    procedure IncAllBtnClick(Sender: TObject);
    procedure ExcAllBtnClick(Sender: TObject);
    procedure btnRetornaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ClienteChange(Sender: TObject);
    procedure btnSelecaoClick(Sender: TObject);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DtmenEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnClienteClick(Sender: TObject);
    procedure DstListClick(Sender: TObject);
    procedure SrcListClick(Sender: TObject);
    procedure ClienteEnter(Sender: TObject);
    procedure SrcListDrawItem(Control: TWinControl; Index: Integer; Rect: TRect;
      State: TOwnerDrawState);
    procedure DstListDrawItem(Control: TWinControl; Index: Integer; Rect: TRect;
      State: TOwnerDrawState);
    procedure btnExecutaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure MoveSelected(List: TCustomListBox; Items: TStrings);
    procedure SetItem(List: TListBox; Index: Integer);
    function GetFirstSelection(List: TCustomListBox): Integer;
    procedure SetButtons;
    procedure Search_Cliente;
    procedure Soma_Agrupamento;
  end;

var
  FrmAgrupa_Orcamento: TFrmAgrupa_Orcamento;

implementation

uses
  UData, UPrincipal, UConsulta, UTrans_Venda_Estoque;

{$R *.dfm}

procedure TFrmAgrupa_Orcamento.Search_Cliente;
begin
  QCliente.Sql.Clear;
  QCliente.Sql.Add('SELECT * FROM CLIENTES');
  QCliente.Sql.Add('WHERE');
  QCliente.Sql.Add('(CLIENTE_ID = :CLIENTE_ID)');
  QCliente.Sql.Add('AND (STATUS = :STATUS)');

  QCliente.ParamByName('CLIENTE_ID').AsInteger := StrToInt(Cliente.Text);
  QCliente.ParamByName('STATUS').AsString      := 'A';

  QCliente.Prepare;
  QCliente.Open;

  if not QCliente.IsEmpty then
  begin
    btnSelecao.Enabled := True;
  end
  else
  begin
    btnSelecao.Enabled := False;

   { if QCliente.FieldByName('DIA_INI').AsInteger > 0 then
      Dtmen.Text := StrZero(QCliente.FieldByName('DIA_INI').AsString, 2, 0) + '/' +
                    Copy(DateToStr((StrToDate('01/' + Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 4, 7)) - 1)), 4, 7);

    if QCliente.FieldByName('DIA_FIM').AsInteger = 31 then
      Dtmai.Text := DateToStr(Ult_Dia_Mes(Dtmen.Date))
    else
    begin
      if QCliente.FieldByName('DIA_FIM').AsInteger > 0 then
        Dtmai.Text := StrZero(QCliente.FieldByName('DIA_FIM').AsString, 2, 0) + '/' +
                      Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 4, 7);
    end; }
  end;
end;

procedure TFrmAgrupa_Orcamento.Soma_Agrupamento;
var
I: Integer;
begin
  Vr_Quitar.Value := 0;

  for I := 0 to (DstList.Items.Count - 1) do
  begin
    if DstList.Items.Strings[I] <> '' then
    begin
      QRel.Sql.Clear;
      QRel.Sql.Add('SELECT SUM(VR_TOTAL) VALOR');
      QRel.Sql.Add('FROM ORCITENS');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(ORCAMENTO_ID = :ORCAMENTO_ID)');

      QRel.ParamByName('ORCAMENTO_ID').AsInteger := StrToInt(Copy(DstList.Items.Strings[I], (length(DstList.Items.Strings[I]) - 10), 11));

      QRel.Prepare;
      QRel.Open;

      Vr_Quitar.Value := Vr_QUitar.Value + QRel.FieldByName('VALOR').AsFloat;
    end;
  end;

  if (Vr_Quitar.Value > 0)  then
    Begin
    btnExecuta.Enabled := True;
    Cond_pagto.enabled := True;
    End
  else
  Begin
    btnExecuta.Enabled := False;
    Cond_pagto.enabled := False;
  End;
end;

procedure TFrmAgrupa_Orcamento.IncludeBtnClick(Sender: TObject);
var
Index: Integer;
begin
  QItens.Close;

  Index := GetFirstSelection(SrcList);
  MoveSelected(SrcList, DstList.Items);
  SetItem(SrcList, Index);
  Soma_Agrupamento;
end;

procedure TFrmAgrupa_Orcamento.ExcludeBtnClick(Sender: TObject);
var
Index: Integer;
begin
  QItens.Close;

  Index := GetFirstSelection(DstList);
  MoveSelected(DstList, SrcList.Items);
  SetItem(DstList, Index);
  Soma_Agrupamento;
end;

procedure TFrmAgrupa_Orcamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmAgrupa_Orcamento.FormCreate(Sender: TObject);
begin
  DBGrid1.Columns[0].Width := 64;
  DBGrid1.Columns[1].Width := 264;
  DBGrid1.Columns[2].Width := 90;
  DBGrid1.Columns[3].Width := 90;
  DBGrid1.Columns[4].Width := 90;
  DBGrid1.Columns[5].Width := 90;

  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);

  SrcList.Style := lbOwnerDrawFixed;
  DstList.Style := lbOwnerDrawFixed;
end;

procedure TFrmAgrupa_Orcamento.IncAllBtnClick(Sender: TObject);
var
I: Integer;
begin
  QItens.Close;

  for I := 0 to SrcList.Items.Count - 1 do
    DstList.Items.AddObject(SrcList.Items[I], SrcList.Items.Objects[I]);

  SrcList.Items.Clear;
  SetItem(SrcList, 0);
  Soma_Agrupamento;
end;

procedure TFrmAgrupa_Orcamento.btnClienteClick(Sender: TObject);
begin
  try
    Cliente.Value := GetConsulta('CLIENTES', 0, 0, StrToInt(Cliente.Text));
  except
    Cliente.Value := GetConsulta('CLIENTES', 0, 0, 0);
  end;
end;

procedure TFrmAgrupa_Orcamento.btnExecutaClick(Sender: TObject);
var
Id_Trans, I, Itens: Integer;
Unidades, Desconto, Valor_Produtos, Base_ICMS_Normal, Vr_ICMS_Normal, Base_ICMS_ST, Vr_ICMS_ST, Vr_Isento, Vr_Unit, Vr_Desc, Vr_Item, Base_ICMS_Normal_T, Vr_ICMS_Normal_T, Base_ICMS_ST_T, Vr_ICMS_ST_T, Aliquota_Inter_Estadual: Real;
Cst, CFOP, Condicao,InputSerial: String;
begin



   InputSerial  := InputBox(PChar(Msg_Title), 'Informe a Serie do Agrupamento' , '001');

    if InputSerial = '' then
    InputSerial := '001' ;

    Label5.Caption := 'Aguarde...';



    IQuery.SQL.Clear;
    IQuery.SQL.Add('SELECT NEXTVAL(:GEN_TRANSACOES) ID');
    IQuery.ParamByName('GEN_TRANSACOES').AsString :=  'GEN_TRANSACOES';

    IQuery.Prepare;
    IQuery.Open;

    Id_Trans := IQuery.FieldByName('ID').AsInteger;


    IQuery.SQL.Clear;
    IQuery.SQL.Add('INSERT INTO COMPL_NFISCAL(TRANSACAO_ID,DT_SAIDA,NO_DOC_FISCAL,SERIE,EMPRESA_ID) values(:TRANSACAO_ID, :DT_SAIDA,:NO_DOC_FISCAL,:SERIE, :EMPRESA_ID)');
    IQuery.ParamByName('TRANSACAO_ID').AsInteger  := ID_TRANS;
    IQuery.ParamByName('NO_DOC_FISCAL').AsInteger := 0;
    IQuery.ParamByName('SERIE').AsString          := Strzero(InputSerial,3,0);
    IQuery.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    IQuery.ParamByName('DT_SAIDA').AsDatetime     := Date;

    IQuery.Prepare;
    IQuery.ExecSQL;



    IQuery.SQL.Clear;
    IQuery.SQL.Add('SELECT NO_DOC_FISCAL FROM COMPL_NFISCAL WHERE TRANSACAO_ID = :TRANSACAO_ID');
    IQuery.ParamByName('TRANSACAO_ID').AsInteger  := id_trans;


    IQuery.Prepare;
    IQuery.Open;

  QRel.Sql.Clear;
  QRel.Sql.Add('INSERT INTO TRANSACOES( ' +
               'TRANSACAO_ID,  DT_TRANS,    DT_MOVIMENTO,    CONDUTA, ' +
               'DEPTO,         EMPRESA_ID,  CONTA_ID,        C_CUSTO_ID, ' +
               'VALOR,         TPCTB,       AUTORIZ_ID,      HISTORICO, ' +
               'CONTAAUX_ID,   NUM_DOC,     BANCO_ID,        BALANCO, ' +
               'COND_PAGTO,    SERIE,       FLUXO_CAIXA_ID,  TIPO_VENDA, ' +
               'CLIENTE_ID,    MODELO,      SUB_CODIGO,      HORA) VALUES(' +
               ':TRANSACAO_ID, :DT_TRANS,   :DT_MOVIMENTO,   :CONDUTA, ' +
               ':DEPTO,        :EMPRESA_ID, :CONTA_ID,       :C_CUSTO_ID, ' +
               ':VALOR,        :TPCTB,      :AUTORIZ_ID,     :HISTORICO, ' +
               ':CONTAAUX_ID,  :NUM_DOC,    :BANCO_ID,       :BALANCO, ' +
               ':COND_PAGTO,   :SERIE,      :FLUXO_CAIXA_ID, :TIPO_VENDA, ' +
               ':CLIENTE_ID,   :MODELO,     :SUB_CODIGO,     :HORA)');

  QRel.ParamByName('TRANSACAO_ID').AsInteger   := Id_Trans;
  QRel.ParamByName('DT_TRANS').AsDateTime      := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
  QRel.ParamByName('DT_MOVIMENTO').AsDateTime  := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
  QRel.ParamByName('CONDUTA').AsString         := '01';
  QRel.ParamByName('DEPTO').AsString           := '07';
  QRel.ParamByName('EMPRESA_ID').AsInteger     := 1;
  QRel.ParamByName('CONTA_ID').AsInteger       := FrmPrincipal.Config.FieldByName('CONTA_ESTOQUE').AsInteger;
  QRel.ParamByName('C_CUSTO_ID').AsInteger     := 1;
  QRel.ParamByName('VALOR').AsFloat            := 0;
  QRel.ParamByName('TPCTB').AsString           := '2';
  QRel.ParamByName('AUTORIZ_ID').AsInteger     := 0;
  QRel.ParamByName('HISTORICO').AsString       := 'AGRUPAMENTO ORCAMENTOS PERÍODO ' + Dtmen.Text + ' A ' + Dtmai.Text;
  QRel.ParamByName('CONTAAUX_ID').AsInteger    := 0;

  QRel.ParamByName('NUM_DOC').AsString         := StrZero(IQuery.FieldByName('NO_DOC_FISCAL').AsString,9,0);

  if not QCliente.IsEmpty then
    QRel.ParamByName('BANCO_ID').AsInteger := 0
  else
    QRel.ParamByName('BANCO_ID').AsInteger := StrToInt(LeIni(Arq_Ini, 'Sistema', 'Caixa'));

  QRel.ParamByName('BALANCO').AsString         := 'LIBERADO';
  QRel.ParamByName('COND_PAGTO').AsString      := COND_PAGTO.TEXT;
   QRel.ParamByName('SERIE').AsString          := Strzero(InputSerial,3,0);
  QRel.ParamByName('FLUXO_CAIXA_ID').AsInteger := 2;
  QRel.ParamByName('TIPO_VENDA').AsString      := 'VENDA';
  QRel.ParamByName('CLIENTE_ID').AsInteger     := StrToInt(Cliente.Text);
  QRel.ParamByName('MODELO').AsString          := '55';
  QRel.ParamByName('SUB_CODIGO').AsString      := '1 - NORMAL';
  QRel.ParamByName('HORA').AsString            := TimeToStr(time);

  QRel.Prepare;
  QRel.ExecSql;



  if not QCliente.IsEmpty then
  begin
    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT * FROM ESTADOS');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(UF = :UF)');

    QRel.ParamByName('UF').AsString := QCliente.FieldByName('ESTADO').AsString;

    QRel.Prepare;
    QRel.Open;

    Aliquota_Inter_Estadual := QRel.FieldByName('ICMS').AsFloat;
  end
  else
    Aliquota_Inter_Estadual := Aliquota_ICMS_Local;

  Condicao := '(';

  for I := 0 to (DstList.Items.Count - 1) do
  begin
    if DstList.Items.Strings[I] <> '' then
    begin
      if Condicao = '(' then
        Condicao := Condicao + 'ORCAMENTO_ID = ' + IntToStr(StrToInt(Copy(DstList.Items.Strings[I], (length(DstList.Items.Strings[I]) - 10), 11)))
      else
        Condicao := Condicao + ' OR ORCAMENTO_ID = ' + IntToStr(StrToInt(Copy(DstList.Items.Strings[I], (length(DstList.Items.Strings[I]) - 10), 11)));
    end;
  end;

  Condicao := Condicao + ')';

  QRel.Sql.Clear;
  QRel.Sql.Add('SELECT PRODUTO_ID, SUM(VR_TOTAL) VALOR, SUM(QUANTIDADE) QUANTIDADE');
  QRel.Sql.Add('FROM ORCITENS');
  QRel.Sql.Add('WHERE');
  QRel.Sql.Add(Condicao);
  QRel.Sql.Add('GROUP BY PRODUTO_ID');

  QRel.Prepare;
  QRel.Open;

  Itens              := 1;
  Unidades           := 0;
  Desconto           := ((Vr_Desconto.Value * 100) / Vr_Quitar.Value);
  Valor_Produtos     := 0;
  Base_ICMS_Normal_T := 0;
  Vr_ICMS_Normal_T   := 0;
  Base_ICMS_ST_T     := 0;
  Vr_ICMS_ST_T       := 0;

  QRel.First;
  while not QRel.Eof do
  begin
    QProduto.Sql.Clear;
    QProduto.Sql.Add('SELECT * FROM PRODUTOS');
    QProduto.Sql.Add('WHERE');
    QProduto.Sql.Add('(PRODUTO_ID = :PRODUTO_ID)');

    QProduto.ParamByName('PRODUTO_ID').AsInteger := QRel.FieldByName('PRODUTO_ID').AsInteger;

    QProduto.Prepare;
    QProduto.Open;

    QTributo.Sql.Clear;
    QTributo.Sql.Add('SELECT * FROM TRIBUTOS');
    QTributo.Sql.Add('WHERE');
    QTributo.Sql.Add('(TRIBUTO_ID = :TRIBUTO_ID)');

    QTributo.ParamByName('TRIBUTO_ID').AsInteger := QProduto.FieldByName('TRIBUTO_ID').AsInteger;

    QTributo.Prepare;
    QTributo.Open;

    CFOP := QTributo.FieldByName('CFOP').AsString;

    Base_ICMS_Normal := 0;
    Vr_ICMS_Normal   := 0;
    Base_ICMS_ST     := 0;
    Vr_ICMS_ST       := 0;
    Vr_Unit          := (QRel.FieldByName('VALOR').AsFloat / QRel.FieldByName('QUANTIDADE').AsFloat);
    Vr_Desc          := ((Vr_Unit * Desconto) / 100);
    Vr_Item          := ((Vr_Unit - Vr_Desc) * QRel.FieldByName('QUANTIDADE').AsFloat);

    if QProduto.FieldByName('ALIQUOTA_ICMS').AsFloat > 0 then
    begin
      Base_ICMS_Normal := Vr_Item;
      Vr_ICMS_Normal   := ((Base_ICMS_Normal * QProduto.FieldByName('ALIQUOTA_ICMS').AsFloat) / 100);
    end
    else
    begin
      Base_ICMS_Normal := 0;
      Vr_ICMS_Normal   := 0;
    end;

    Cst := Copy(QTributo.FieldByName('ORIGEM').AsString, 1, 1) + Copy(QTributo.FieldByName('TRIBUTACAO').AsString, 1, 2);

    if (Cst = '010') or (Cst = '030') or (Cst = '060') or (Cst = '070') then
    begin
      Base_ICMS_ST := (Vr_Item + ((Vr_Item * QProduto.FieldByName('MVA').AsFloat) / 100));
      Vr_ICMS_ST   := (((Base_ICMS_ST * Aliquota_ICMS_Local) / 100) - RoundTo(((Vr_Item * Aliquota_Inter_Estadual) / 100), -2));
    end
    else
    begin
      Base_ICMS_ST := 0;
      Vr_ICMS_ST   := 0;
    end;

    if (Cst = '040') or (Cst = '041') or (Cst = '050') then
      Vr_Isento := Vr_Item
    else
      Vr_Isento := 0;

    QUpdate.Sql.Clear;
    QUpdate.Sql.Add('INSERT INTO TRANSITENS( ' +
                    'TRANSACAO_ID,   PRODUTO_ID,      TP_PROD_SERV,   CFOP, ' +
                    'DESCRICAO,      CONTA_ID,        TRIBUTO_ID,     CST, ' +
                    'MVA,            BASE_CALC_ICMS,  ALIQUOTA_ICMS,  VALOR_ICMS, ' +
                    'BASE_CALC_ST,   VALOR_ICMS_ST,   VALOR_ISENTO,   VALOR_OUTROS, ' +
                    'VR_IPI,         QUANTIDADE,      VR_UNITARIO,    VR_DESCONTO, ' +
                    'VR_TOTAL,SEQUENCIA) VALUES(' +
                    ':TRANSACAO_ID,  :PRODUTO_ID,     :TP_PROD_SERV,  :CFOP, ' +
                    ':DESCRICAO,     :CONTA_ID,       :TRIBUTO_ID,    :CST, ' +
                    ':MVA,           :BASE_CALC_ICMS, :ALIQUOTA_ICMS, :VALOR_ICMS, ' +
                    ':BASE_CALC_ST,  :VALOR_ICMS_ST,  :VALOR_ISENTO,  :VALOR_OUTROS, ' +
                    ':VR_IPI,        :QUANTIDADE,     :VR_UNITARIO,   :VR_DESCONTO, ' +
                    ':VR_TOTAL,:SEQUENCIA)');

    QUpdate.ParamByName('TRANSACAO_ID').AsInteger  := Id_Trans;
    QUpdate.ParamByName('PRODUTO_ID').AsInteger    := QRel.FieldByName('PRODUTO_ID').AsInteger;
    QUpdate.ParamByName('TP_PROD_SERV').AsString   := 'P';
    QUpdate.ParamByName('CFOP').AsString           := QTributo.FieldByName('CFOP').AsString;
    QUpdate.ParamByName('DESCRICAO').AsString      := QProduto.FieldByName('DESCRICAO').AsString;
    QUpdate.ParamByName('CONTA_ID').AsInteger      := FrmPrincipal.Config.FieldByName('CONTA_ESTOQUE').AsInteger;
    QUpdate.ParamByName('TRIBUTO_ID').AsInteger    := QProduto.FieldByName('TRIBUTO_ID').AsInteger;

    If FrmPrincipal.QEmpresa.FieldByName('CRT').AsString = '1 - SIMPLES NACIONAL' then
    QUpdate.ParamByName('CST').AsString            := QProduto.FieldByName('CSOSN').AsString
    Else
    QUpdate.ParamByName('CST').AsString            := Copy(QTributo.FieldByName('ORIGEM').AsString, 1, 1) + Copy(QTributo.FieldByName('TRIBUTACAO').AsString, 1, 2);

    QUpdate.ParamByName('MVA').AsFloat             := QProduto.FieldByName('MVA').AsFloat;

   If FrmPrincipal.QEmpresa.FieldByName('CRT').AsString = '1 - SIMPLES NACIONAL' then
   Begin
    QUpdate.ParamByName('BASE_CALC_ICMS').AsFloat  := 0;
    QUpdate.ParamByName('ALIQUOTA_ICMS').AsFloat   := 0;
    QUpdate.ParamByName('VALOR_ICMS').AsFloat      := 0;
    QUpdate.ParamByName('BASE_CALC_ST').AsFloat    := 0;
    QUpdate.ParamByName('VALOR_ICMS_ST').AsFloat   := 0;
   End
   Else
   begin
   QUpdate.ParamByName('BASE_CALC_ICMS').AsFloat  := RoundTo(Base_ICMS_Normal, -2);
   QUpdate.ParamByName('ALIQUOTA_ICMS').AsFloat   := QProduto.FieldByName('ALIQUOTA_ICMS').AsFloat;
   QUpdate.ParamByName('VALOR_ICMS').AsFloat      := RoundTo(Vr_ICMS_Normal, -2);
   QUpdate.ParamByName('BASE_CALC_ST').AsFloat    := RoundTo(Base_ICMS_ST, -2);
   QUpdate.ParamByName('VALOR_ICMS_ST').AsFloat   := RoundTo(Vr_ICMS_ST, -2);

   end;
    QUpdate.ParamByName('VALOR_ISENTO').AsFloat    := RoundTo(Vr_Isento, -2);
    QUpdate.ParamByName('VALOR_OUTROS').AsFloat    := 0;
    QUpdate.ParamByName('VR_IPI').AsFloat          := 0;
    QUpdate.ParamByName('QUANTIDADE').AsFloat      := RoundTo(QRel.FieldByName('QUANTIDADE').AsFloat, -2);
    QUpdate.ParamByName('VR_UNITARIO').AsFloat     := RoundTo(Vr_Unit, -2);
    QUpdate.ParamByName('VR_DESCONTO').AsFloat     := RoundTo(Vr_Desc, -2);
    QUpdate.ParamByName('VR_TOTAL').AsFloat        := RoundTo(Vr_Item, -2);
    QUpdate.ParamByName('SEQUENCIA').AsInteger     := Itens;

    QUpdate.Prepare;
    QUpdate.ExecSql;



    Itens              := (Itens + 1);
    Unidades           := (Unidades + QRel.FieldByName('QUANTIDADE').AsFloat);
    Valor_Produtos     := Valor_Produtos + Vr_Item;

    If FrmPrincipal.QEmpresa.FieldByName('CRT').AsString = '1 - SIMPLES NACIONAL' then
    Begin
    Base_ICMS_Normal_T := 0;
    Vr_ICMS_Normal_T   := 0;
    Base_ICMS_ST_T     := 0;
    Vr_ICMS_ST_T       := 0;
    End
    Else
    begin
    Base_ICMS_Normal_T := Base_ICMS_Normal_T + Base_ICMS_Normal;
    Vr_ICMS_Normal_T   := Vr_ICMS_Normal_T + Vr_ICMS_Normal;
    Base_ICMS_ST_T     := Base_ICMS_ST_T + Base_ICMS_ST;
    Vr_ICMS_ST_T       := Vr_ICMS_ST_T + Vr_ICMS_ST;
    end;

    Application.ProcessMessages;
    QRel.Next;
  end;

  QUpdate.Sql.Clear;
  QUpdate.Sql.Add('UPDATE TRANSACOES SET ' +
                                         'BASE_ICMS_NORMAL = :BASE_ICMS_NORMAL, VR_ICMS_NORMAL = :VR_ICMS_NORMAL, ' +
                                         'BASE_ICMS_ST     = :BASE_ICMS_ST,     VR_ICMS_ST     = :VR_ICMS_ST, ' +
                                         'ITENS            = :ITENS,            UNIDADES       = :UNIDADES, ' +
                                         'VALOR_PRODUTOS   = :VALOR_PRODUTOS,   VALOR          = :VALOR, ' +
                                         'CFOP             = :CFOP');
  QUpdate.Sql.Add('WHERE');
  QUpdate.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

  QUpdate.ParamByName('BASE_ICMS_NORMAL').AsFloat := RoundTo(Base_ICMS_Normal_T, -2);
  QUpdate.ParamByName('VR_ICMS_NORMAL').AsFloat   := RoundTo(Vr_ICMS_Normal_T, -2);
  QUpdate.ParamByName('BASE_ICMS_ST').AsFloat     := RoundTo(Base_ICMS_ST_T, -2);
  QUpdate.ParamByName('VR_ICMS_ST').AsFloat       := RoundTo(Vr_ICMS_ST_T, -2);
  QUpdate.ParamByName('ITENS').AsInteger          := Itens;
  QUpdate.ParamByName('UNIDADES').AsFloat         := RoundTo(Unidades, -2);
  QUpdate.ParamByName('VALOR_PRODUTOS').AsFloat   := RoundTo(Valor_Produtos, -2);
  QUpdate.ParamByName('VALOR').AsFloat            := RoundTo(Valor_Produtos, -2);
  QUpdate.ParamByName('CFOP').AsString            := CFOP;
  QUpdate.ParamByName('TRANSACAO_ID').AsInteger   := Id_Trans;

  QUpdate.Prepare;
  QUpdate.ExecSql;



  QRel.Sql.Clear;
  QRel.Sql.Add('UPDATE ORCAMENTOS SET TRANSACAO_ID = :TRANSACAO_ID, VR_DESCONTO_ANT = VR_DESCONTO, VALOR_ANT = VALOR, VR_DESCONTO = (VR_DESCONTO + ((VALOR * :NEW_DESCONTO) / 100)), VALOR = (VALOR - (VR_DESCONTO + ((VALOR * :NEW_DESCONTO) / 100)))');
  QRel.Sql.Add('WHERE');
  QRel.Sql.Add(Condicao);

  QRel.ParamByName('TRANSACAO_ID').AsInteger := Id_Trans;
  QRel.ParamByName('NEW_DESCONTO').AsFloat   := Desconto;

  QRel.Prepare;
  QRel.ExecSql;

  if Cliente.value > 0 then
  Begin

  QUpdate.Sql.Clear;
  QUpdate.Sql.Add('INSERT INTO TRANSPARCELAS( ' +
                  'TRANSACAO_ID,   PARCELA_ID,   TIPO_TRANSACAO,   DT_VENCIMENTO, ' +
                  'VALOR,          DUPLICATA) VALUES(' +
                  ':TRANSACAO_ID,  :PARCELA_ID,  :TIPO_TRANSACAO,  :DT_VENCIMENTO, ' +
                  ':VALOR,         :DUPLICATA)');

  QUpdate.ParamByName('TRANSACAO_ID').AsInteger   := Id_Trans;
  QUpdate.ParamByName('PARCELA_ID').AsString      := '01/01';
  QUpdate.ParamByName('TIPO_TRANSACAO').AsString  := 'T';


    if QCliente.FieldByName('VENCIMENTO').AsInteger > 0 then
    begin
      try
        QUpdate.ParamByName('DT_VENCIMENTO').AsDateTime := StrToDate(StrZero(QCliente.FieldByName('VENCIMENTO').AsString, 2, 0) + '/' + Copy(DateToStr((Ult_Dia_Mes(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime) + 1)), 4, 7));
      except
        QUpdate.ParamByName('DT_VENCIMENTO').AsDateTime := (FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime + 30);
      end;
    end
    Else
    QUpdate.ParamByName('DT_VENCIMENTO').AsDateTime := (FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime + 30);

   QUpdate.ParamByName('VALOR').AsFloat      := RoundTo(Valor_Produtos, -2);
   QUpdate.ParamByName('DUPLICATA').AsString := StrZero(IntToStr(Id_Trans), 6, 0) + '/01';


   QUpdate.Prepare;
   QUpdate.ExecSql;

  End;




  Application.MessageBox('Transação Gerada com Sucesso. Verifique as parcelas caso venda a prazo, na janela seguinte', PChar(Msg_Title), mb_IconInformation);

  Cliente.SetFocus;

  btnExecuta.Enabled := False;
  
  Trans_Venda_Estoque(Id_Trans);
end;

procedure TFrmAgrupa_Orcamento.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmAgrupa_Orcamento.btnSelecaoClick(Sender: TObject);
begin

  btnSelecao.Enabled := False;

  QRel.Sql.Clear;
  QRel.Sql.Add('SELECT ORCAMENTOS.ORCAMENTO_ID, ORCAMENTOS.DT_ORCAMENTO, ORCAMENTOS.NOME, SUM(ORCITENS.VR_TOTAL) VALOR');
  QRel.Sql.Add('FROM ORCAMENTOS');
  QRel.Sql.Add('INNER JOIN ORCITENS');
  QRel.Sql.Add('ON (ORCAMENTOS.ORCAMENTO_ID = ORCITENS.ORCAMENTO_ID)');
  QRel.Sql.Add('WHERE');
  QRel.Sql.Add('(ORCAMENTOS.DT_ORCAMENTO BETWEEN :DT_INICIAL AND :DT_FINAL)');

  if StrToInt(Cliente.Text) > 0 then
    QRel.Sql.Add('AND (ORCAMENTOS.CLIENTE_ID = :CLIENTE_ID)');

  QRel.Sql.Add('AND (ORCAMENTOS.EMPRESA_ID = :EMPRESA_ID)');
  //QRel.Sql.Add('AND (ORCAMENTOS.COND_PAGTO = :COND_PAGTO)');
  QRel.Sql.Add('AND (ORCAMENTOS.TRANSACAO_ID = 0 OR ORCAMENTOS.TRANSACAO_ID IS NULL)');
  QRel.Sql.Add('GROUP BY ORCAMENTOS.ORCAMENTO_ID, ORCAMENTOS.DT_ORCAMENTO, ORCAMENTOS.NOME');
  QRel.Sql.Add('ORDER BY ORCAMENTOS.DT_ORCAMENTO');

  QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
  QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;

  if StrToInt(Cliente.Text) > 0 then
    QRel.ParamByName('CLIENTE_ID').AsInteger := StrToInt(Cliente.Text);

  QRel.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  //QRel.ParamByName('COND_PAGTO').AsString  := 'A PRAZO';

  QRel.Prepare;
  QRel.Open;

  Vr_Soma.Value := 0;

  QRel.First;
  while not QRel.Eof do
  begin
    SrcList.Items.Add(ForcaComprimento(QRel.FieldByName('NOME').AsString,17,' ') + ' - ' + ' R$ ' +
                      FormatFloat('#,##0.00', QRel.FieldByName('VALOR').AsFloat) + ' - ' +
                      QRel.FieldByName('DT_ORCAMENTO').AsString + ' - ' +
                      StrZero(QRel.FieldByName('ORCAMENTO_ID').AsString, 10, 0));

    Vr_Soma.Value := Vr_Soma.Value + QRel.FieldByName('VALOR').AsFloat;

    Application.ProcessMessages;
    QRel.Next;
  end;

  if not QRel.IsEmpty then
  begin
    IncludeBtn.Enabled := True;
    IncAllBtn.Enabled  := True;
    SrcList.Enabled    := True;
    DstList.Enabled    := True;
    DBGrid1.Enabled    := True;

    SrcList.SetFocus;
    Keybd_Event(VK_LEFT, 0, 0, 0);

  end
  else
  begin
     Application.MessageBox('Não há dados com esses parâmetros', PChar(Msg_Title), mb_IconInformation);
     Qcliente.close;
     Cliente.SetFocus;

  end;
end;

procedure TFrmAgrupa_Orcamento.ClienteChange(Sender: TObject);
begin
  if Cliente.Value > 0 then
    Search_Cliente;
end;

procedure TFrmAgrupa_Orcamento.ClienteEnter(Sender: TObject);
begin
  btnSelecao.Enabled := True;

  SrcList.Items.Clear;
  DstList.Items.Clear;

  Cliente.Value     := 0;
  Vr_Soma.Value     := 0;
  Vr_Quitar.Value   := 0;
  Vr_Desconto.Value := 0;

  SrcList.Enabled    := False;
  DstList.Enabled    := False;
  DBGrid1.Enabled    := False;
  IncludeBtn.Enabled := False;
  IncAllBtn.Enabled  := False;
  ExcludeBtn.Enabled := False;
  ExAllBtn.Enabled   := False;

  QItens.Close;
  
  Keybd_Event(VK_RIGHT, 0, 0, 0);
end;

procedure TFrmAgrupa_Orcamento.ClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = Cliente) then
    btnClienteClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmAgrupa_Orcamento.DstListClick(Sender: TObject);
var
I: Integer;
begin
  for I := 0 to (DstList.Items.Count - 1) do
  begin
    if DstList.Selected[I] then
    begin
      if DstList.Items.Strings[I] <> '' then
      begin
        QItens.Sql.Clear;
        QItens.Sql.Add('SELECT * FROM ORCITENS');
        QItens.Sql.Add('WHERE');
        QItens.Sql.Add('(ORCAMENTO_ID = :ORCAMENTO_ID)');

        QItens.ParamByName('ORCAMENTO_ID').AsInteger := StrToInt(Copy(DstList.Items.Strings[I], (length(DstList.Items.Strings[I]) - 10), 11));

        QItens.Prepare;
        QItens.Open;
      end;
    end;
  end;
end;

procedure TFrmAgrupa_Orcamento.DstListDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
X: Integer;
Txt: String;
begin
  with DstList do
  begin
    Canvas.FillRect(Rect);
    Txt := Items[Index];
    X   := Rect.Right - Canvas.TextWidth(Txt) - 4;
    Canvas.TextOut(X, Rect.Top, Txt);
  end;
end;

procedure TFrmAgrupa_Orcamento.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmAgrupa_Orcamento.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
  //  Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmAgrupa_Orcamento.ExcAllBtnClick(Sender: TObject);
var
I: Integer;
begin
  QItens.Close;

  for I := 0 to DstList.Items.Count - 1 do
    SrcList.Items.AddObject(DstList.Items[I], DstList.Items.Objects[I]);

  DstList.Items.Clear;
  SetItem(DstList, 0);
  Soma_Agrupamento;
end;

procedure TFrmAgrupa_Orcamento.MoveSelected(List: TCustomListBox; Items: TStrings);
var
I: Integer;
begin
  for I := List.Items.Count - 1 downto 0 do
  begin
    if List.Selected[I] then
    begin
      Items.AddObject(List.Items[I], List.Items.Objects[I]);
      List.Items.Delete(I);
    end;
  end;
end;

procedure TFrmAgrupa_Orcamento.SetButtons;
var
SrcEmpty, DstEmpty: Boolean;
begin
  SrcEmpty           := SrcList.Items.Count = 0;
  DstEmpty           := DstList.Items.Count = 0;
  IncludeBtn.Enabled := not SrcEmpty;
  IncAllBtn.Enabled  := not SrcEmpty;
  ExcludeBtn.Enabled := not DstEmpty;
  ExAllBtn.Enabled   := not DstEmpty;
end;

function TFrmAgrupa_Orcamento.GetFirstSelection(List: TCustomListBox): Integer;
begin
  for Result := 0 to List.Items.Count - 1 do
  begin
    if List.Selected[Result] then
      exit;
  end;

  Result := LB_ERR;
end;

procedure TFrmAgrupa_Orcamento.SetItem(List: TListBox; Index: Integer);
var
MaxIndex: Integer;
begin
  with List do
  begin
    SetFocus;
    MaxIndex := List.Items.Count - 1;

    if Index = LB_ERR then
      Index := 0
    else if Index > MaxIndex then
      Index := MaxIndex;

    Selected[Index] := True;
  end;

  SetButtons;
end;

procedure TFrmAgrupa_Orcamento.SrcListClick(Sender: TObject);
var
I: Integer;
begin
  for I := 0 to (SrcList.Items.Count - 1) do
  begin
    if SrcList.Selected[I] then
    begin
      if SrcList.Items.Strings[I] <> '' then
      begin
        QItens.Sql.Clear;
        QItens.Sql.Add('SELECT * FROM ORCITENS');
        QItens.Sql.Add('WHERE');
        QItens.Sql.Add('(ORCAMENTO_ID = :ORCAMENTO_ID)');

        QItens.ParamByName('ORCAMENTO_ID').AsInteger := StrToInt(Copy(SrcList.Items.Strings[I], (length(SrcList.Items.Strings[I]) - 10), 11));

        QItens.Prepare;
        QItens.Open;
      end;
    end;
  end;
end;

procedure TFrmAgrupa_Orcamento.SrcListDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
X: Integer;
Txt: String;
begin
  with SrcList do
  begin
    Canvas.FillRect(Rect);
    Txt := Items[Index];
    X   := Rect.Right - Canvas.TextWidth(Txt) - 4;
    Canvas.TextOut(X, Rect.Top, Txt);
  end;
end;

end.
