unit UCurva_ABC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, rxToolEdit, rxCurrEdit, ExtCtrls, DB,
  IBCustomDataSet, IBQuery, DBTables, Buttons, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmCurva_ABC = class(TForm)
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Perc_A: TCurrencyEdit;
    Perc_B: TCurrencyEdit;
    Perc_C: TCurrencyEdit;
    Label3: TLabel;
    Ano: TCurrencyEdit;
    Label4: TLabel;
    Base: TComboBox;
    Dtmen: TDateEdit;
    Dtmai: TDateEdit;
    Panel1: TPanel;
    Label5: TLabel;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    QRel: TFDQuery;
    Table3: TFDMemTable;
    Table4: TFDMemTable;
    Table4DESCR: TStringField;
    Table4PERCENTUAL: TFloatField;
    Table5: TFDMemTable;
    StringField1: TStringField;
    FloatField1: TFloatField;
    Table7: TFDMemTable;
    Table3MES: TStringField;
    Table3VALOR: TFloatField;
    Table3MES2: TStringField;
    Table3VALOR2: TFloatField;
    procedure Perc_AKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnExecutaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRetornaClick(Sender: TObject);
    procedure DtmenEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCurva_ABC: TFrmCurva_ABC;
  Id_Opcao: Integer;
  VL1: Real;

  procedure Planejamento_FinanceiroABC(Opcao: Integer);

implementation

uses
  UPrincipal, UData, UCurva_Graf, UCurva_Graf1;

{$R *.dfm}

procedure Planejamento_FinanceiroABC(Opcao: Integer);
begin
  Id_Opcao := Opcao;

  if not ThereIs('Planejamento Financeiro') then
    TFrmCurva_ABC.Create(Application);

  if LeIni(Arq_Ini, 'Sistema', 'Organizar Janelas Automaticamente') = 'True' then
    FrmPrincipal.Cascade;
end;

procedure TFrmCurva_ABC.btnExecutaClick(Sender: TObject);
var
VL2, VPA, VPB, VPC: Real;
T1, Campo, Lc: String;
CPR: array[1..12] of Real;
X: Integer;
begin
  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    VL1 := 0;

    T1 := 'TEMP';

    {with Table3 do
    begin
      with FieldDefs do
        begin
          Clear;
          Add('VALOR', ftFloat, 0, False);
          Add('MES', ftString, 40, False);
        end;
        Open;
    end;
    with Table4 do
    begin
      with FieldDefs do
        begin
          Clear;
          Add('CDEST', ftInteger, 0, False);
          Add('VALOR', ftFloat, 0, False);
          Add('NMEST', ftString, 40, False);
          Add('CURVA', ftString, 1, False);
        end;
        Open;
    end;

    with Table5 do
    begin
      with FieldDefs do
        begin
          Clear;
          Add('CDEST', ftInteger, 0, False);
          Add('VALOR', ftFloat, 0, False);
          Add('NMEST', ftString, 40, False);
          Add('CURVA', ftString, 1, False);
        end;
        Open;
    end; }


    Table3.Close;
    Table4.Close;
    Table5.Close;
    Table7.Close;

    with Table3 do
    begin
      with FieldDefs do
      begin
      Clear;
      Add('PERCENTUAL', ftFloat, 0, False);
      Add('DESCR', ftString, 40, False);
      Add('VALOR', ftFloat, 0, False);
      Add('MES', ftString, 40, False)
      end;
    end;

     with Table4 do
    begin
      with FieldDefs do
      begin
      Clear;
      Add('PERCENTUAL', ftFloat, 0, False);
      Add('DESCR', ftString, 40, False)    ;
      end;
    end;

     with Table5 do
    begin
      with FieldDefs do
      begin
      Clear;
      Add('PERCENTUAL', ftFloat, 0, False);
      Add('DESCR', ftString, 40, False)    ;
      end;
    end;

    with Table7 do
    begin
      with FieldDefs do
      begin
      Clear;
      Add('VALOR', ftFloat, 0, False);
      Add('MES', ftString, 40, False)    ;
      end;
    end;

    Table3.Open;
    Table4.Open;
    Table5.Open;
    Table7.Open;



    if Id_Opcao = 1 then
    begin
      Table7.Close;
      with Table7 do
      begin
       // DatabaseName := ExtractFilePath(ParamStr(0));
       // TableName := T1;

        with FieldDefs do
        begin
          Clear;
          Add('CDEST', ftInteger, 0, False);
          Add('VALOR', ftFloat, 0, False);
          Add('NMEST', ftString, 40, False);
          Add('CURVA', ftString, 1, False);
        end;

        with IndexDefs do
        begin
          Clear;
          Add('', 'CDEST', [ixPrimary, ixUnique]);
          Add(T1, 'VALOR', [ixCaseInsensitive]);
        end;

        IndexName := T1;
        Open;
      end;

      QRel.Sql.Clear;
      QRel.Sql.Add('SELECT * FROM PRODUTOS');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (STATUS = :STATUS)');

      QRel.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
      QRel.ParamByName('STATUS').AsString      := 'A';

      QRel.Prepare;
      QRel.Open;

      if Base.Text = 'Compra' then
        Campo := 'VALOR_COMPRA'
      else if Base.Text = 'Custo Médio' then
        Campo := 'CUSTOMEDIO'
      else if Base.Text = 'Varejo' then
        Campo := 'PRECO_VAREJO'
      else if Base.Text = 'Atacado' then
        Campo := 'PRECO_ATACADO';

      QRel.First;
      while not QRel.Eof do
      begin
        if FrmData.QAcesso.FieldByName('TPCTB').AsString = '2' then
        begin
          VL1 := VL1 + (QRel.FieldByName(Campo).AsFloat * QRel.FieldByName('QUANTIDADE_C').AsFloat);
          VL2 := (QRel.FieldByName(Campo).AsFloat * QRel.FieldByName('QUANTIDADE_C').AsFloat);
        end
        else
        begin
          VL1 := VL1 + (QRel.FieldByName(Campo).AsFloat * QRel.FieldByName('QUANTIDADE_G').AsFloat);
          VL2 := (QRel.FieldByName(Campo).AsFloat * QRel.FieldByName('QUANTIDADE_G').AsFloat);
        end;

        if VL2 > 0 then
           Table7.AppendRecord([QRel.FieldByName('PRODUTO_ID').AsInteger, VL2, QRel.FieldByName('DESCRICAO').AsString]);

        Application.ProcessMessages;
        QRel.Next;
      end;

      VPA := ((VL1 * Perc_A.Value) / 100);
      VPB := ((VL1 * Perc_B.Value) / 100);
      VPC := ((VL1 * Perc_C.Value) / 100);
      VL2 := 0;

      Table7.Last;
      while not Table7.Bof do
      begin
        if VL2 <= VPA then
        begin
          if Table3.RecordCount <= 12 then
            Table3.AppendRecord([Table7.FieldByName('NMEST').AsString, Table7.FieldByName('VALOR').AsFloat]);

          Table7.Edit;
          Table7.FieldByName('CURVA').AsString := 'A';
          Table7.Post;

          VL2 := VL2 + Table7.FieldByName('VALOR').AsFloat;
        end;

        Application.ProcessMessages;
        Table7.Prior;
      end;

      VL2 := 0;

      Table7.Last;
      while not Table7.Bof do
      begin
        if (Table7.FieldByName('CURVA').AsString = '') and (VL2 <= VPB) then
        begin
          if Table4.RecordCount <= 12 then
            Table4.AppendRecord([Table7.FieldByName('NMEST').AsString, Table7.FieldByName('VALOR').AsFloat]);

          Table7.Edit;
          Table7.FieldByName('CURVA').AsString := 'B';
          Table7.Post;
          VL2 := VL2 + Table7.FieldByName('VALOR').AsFloat;
        end;

        Application.ProcessMessages;
        Table7.Prior;
      end;

      VL2 := 0;

      Table7.Last;
      while not Table7.Bof do
      begin
        if (Table7.FieldByName('CURVA').AsString = '') and (VL2 <= VPC) then
        begin
          if Table5.RecordCount <= 12 then
            Table5.AppendRecord([Table7.FieldByName('NMEST').AsString, Table7.FieldByName('VALOR').AsFloat]);

          VL2 := VL2 + Table7.FieldByName('VALOR').AsFloat;
        end;

        Application.ProcessMessages;
        Table7.Prior;
      end;
    end;

    if (Id_Opcao = 2) or (Id_Opcao = 3) or (Id_Opcao = 14) then
    begin
      Table3.Close;

      with Table3 do
      begin
        with FieldDefs do
        begin
        Clear;
        Add('VALOR', ftFloat, 0, False);
        Add('MES', ftString, 40, False);
        Add('PERCENTUAL', ftFloat, 0, False);
        Add('DESCR', ftString, 40, False);
        end;

        Open;
      end;

      for X := 1 to 12 do
        CPR[X] := 0;

      QRel.Sql.Clear;
      QRel.Sql.Add('SELECT * FROM TRANSACOES');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('AND (EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (CONDUTA = :CONDUTA)');
      QRel.Sql.Add('AND (DEPTO = :DEPTO)');

      QRel.ParamByName('DT_INICIAL').AsDateTime := StrToDate('01/01/' + StrZero(Ano.Text, 4, 0));
      QRel.ParamByName('DT_FINAL').AsDateTime   := StrToDate('31/12/' + StrZero(Ano.Text, 4, 0));
      QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
      QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
      QRel.ParamByName('DEPTO').AsString        := '07';

      if Id_Opcao = 2 then
        QRel.ParamByName('CONDUTA').AsString := '02'
      else if Id_Opcao = 3 then
        QRel.ParamByName('CONDUTA').AsString := '01'
      else if Id_Opcao = 14 then
        QRel.ParamByName('CONDUTA').AsString := '17';

      QRel.Prepare;
      QRel.Open;

      QRel.First;
      while not QRel.Eof do
      begin
        CPR[StrToInt(Copy(QRel.FieldByName('DT_TRANS').AsString, 4, 2))] := CPR[StrToInt(Copy(QRel.FieldByName('DT_TRANS').AsString, 4, 2))] +
                                                                            QRel.FieldByName('VALOR').AsFloat;
        Application.ProcessMessages;
        QRel.Next;
      end;

      for X := 1 to 12 do
      begin

        Table3.Append;

        if X = 1 then
          Table3.FieldByName('MES').AsString := 'JAN'
        else if X = 2 then
          Table3.FieldByName('MES').AsString := 'FEV'
        else if X = 3 then
          Table3.FieldByName('MES').AsString := 'MAR'
        else if X = 4 then
          Table3.FieldByName('MES').AsString := 'ABR'
        else if X = 5 then
          Table3.FieldByName('MES').AsString := 'MAI'
        else if X = 6 then
          Table3.FieldByName('MES').AsString := 'JUN'
        else if X = 7 then
          Table3.FieldByName('MES').AsString := 'JUL'
        else if X = 8 then
          Table3.FieldByName('MES').AsString := 'AGO'
        else if X = 9 then
          Table3.FieldByName('MES').AsString := 'SET'
        else if X = 10 then
          Table3.FieldByName('MES').AsString := 'OUT'
        else if X = 11 then
          Table3.FieldByName('MES').AsString := 'NOV'
        else if X = 12 then
          Table3.FieldByName('MES').AsString := 'DEZ';

        Table3.FieldByName('VALOR').AsFloat := CPR[X];
        Table3.Post;

      end;
    end;

    if Id_Opcao = 6 then
    begin
      Table7.Close;
      with Table7 do
      begin
        //TableName := T1;

        with FieldDefs do
        begin
          Clear;
          Add('CODIGO', ftInteger, 0, False);
          Add('VALOR', ftFloat, 0, False);
          Add('NOME', ftString, 40, False);
          Add('CURVA', ftString, 1, False);
        end;

        with IndexDefs do
        begin
          Clear;
          Add('', 'CODIGO', [ixPrimary, ixUnique]);
          Add(T1, 'VALOR', [ixCaseInsensitive]);
        end;
        IndexName := T1;
        Open;
      end;

      QRel.Sql.Clear;
      QRel.Sql.Add('SELECT TRANSACOES.CLIENTE_ID, TRANSACOES.VALOR, CLIENTES.NOME');
      QRel.Sql.Add('FROM TRANSACOES');
      QRel.Sql.Add('INNER JOIN CLIENTES');
      QRel.Sql.Add('ON (TRANSACOES.CLIENTE_ID = CLIENTES.CLIENTE_ID)');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :CONDUTA)');
      QRel.Sql.Add('AND (TRANSACOES.COND_PAGTO = :COND_PAGTO)');

      QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
      QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
      QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
      QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
      QRel.ParamByName('CONDUTA').AsString      := '01';
      QRel.ParamByName('COND_PAGTO').AsString   := 'A PRAZO';

      QRel.Sql.Add('ORDER BY TRANSACOES.VALOR DESC');

      QRel.Prepare;
      QRel.Open;

      QRel.First;
      while not QRel.Eof do
      begin
        VL1 := VL1 + QRel.FieldByName('VALOR').AsFloat;

        if Table7.FindKey([QRel.FieldByName('CLIENTE_ID').AsInteger]) then
        begin
          Table7.Edit;
          Table7.FieldByName('VALOR').AsFloat := Table7.FieldByName('VALOR').AsFloat +
                                                 QRel.FieldByName('VALOR').AsFloat;
        end
        else
        begin
          Table7.Append;
          Table7.FieldByName('CODIGO').AsInteger := QRel.FieldByName('CLIENTE_ID').AsInteger;
          Table7.FieldByName('VALOR').AsFloat    := QRel.FieldByName('VALOR').AsFloat;
          Table7.FieldByName('NOME').AsString    := Copy(QRel.FieldByName('NOME').AsString, 1, 40);
        end;

        Table7.Post;

        Application.ProcessMessages;
        QRel.Next;
      end;

      VPA := ((VL1 * Perc_A.Value) / 100);
      VPB := ((VL1 * Perc_B.Value) / 100);
      VPC := ((VL1 * Perc_C.Value) / 100);

      VL2 := 0;

      Table7.IndexName := T1;

      Table7.Last;
      while not Table7.Bof do
      begin
        if VL2 <= VPA then
        begin
          if Table3.RecordCount <= 12 then
            Table3.AppendRecord([Table7.FieldByName('NOME').AsString, Table7.FieldByName('VALOR').AsFloat]);

          Table7.Edit;
          Table7.FieldByName('CURVA').AsString := 'A';
          Table7.Post;

          VL2 := VL2 + Table7.FieldByName('VALOR').AsFloat;
        end;

        Application.ProcessMessages;
        Table7.Prior;
      end;

      VL2 := 0;

      Table7.Last;
      while not Table7.Bof do
      begin
        if (Table7.FieldByName('CURVA').AsString = '') and (VL2 <= VPB) then
        begin
          if Table4.RecordCount <= 12 then
            Table4.AppendRecord([Table7.FieldByName('NOME').AsString, Table7.FieldByName('VALOR').AsFloat]);

          Table7.Edit;
          Table7.FieldByName('CURVA').AsString := 'B';
          Table7.Post;

          VL2 := VL2 + Table7.FieldByName('VALOR').AsFloat;
        end;

        Application.ProcessMessages;
        Table7.Prior;
      end;

      VL2 := 0;

      Table7.Last;
      while not Table7.Bof do
      begin
        if (Table7.FieldByName('CURVA').AsString = '') and (VL2 <= VPC) then
        begin
          if Table5.RecordCount <= 12 then
            Table5.AppendRecord([Table7.FieldByName('NOME').AsString, Table7.FieldByName('VALOR').AsFloat]);
           VL2 := VL2 + Table7.FieldByName('VALOR').AsFloat;
        end;

        Application.ProcessMessages;
        Table7.Prior;
      end;
    end;

    if Id_Opcao = 8 then
    begin
      Table7.Close;

      with Table7 do
      begin
       // DatabaseName := ExtractFilePath(ParamStr(0));
        //TableName := T1;

        with FieldDefs do
        begin
          Clear;
          Add('CDEST', ftInteger, 0, False);
          Add('VALOR', ftFloat, 0, False);
          Add('NMEST', ftString, 40, False);
          Add('CURVA', ftString, 1, False);
        end;

        with IndexDefs do
        begin
          Clear;
          Add('', 'CDEST', [ixPrimary, ixUnique]);
          Add(T1, 'VALOR', [ixCaseInsensitive]);
        end;

        IndexName := T1;
        Open;
      end;

      QRel.Sql.Clear;
      QRel.Sql.Add('SELECT TRANSITENS.*');
      QRel.Sql.Add('FROM TRANSITENS');
      QRel.Sql.Add('INNER JOIN TRANSACOES');
      QRel.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :CONDUTA)');

      QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
      QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
      QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
      QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
      QRel.ParamByName('CONDUTA').AsString      := '02';

      QRel.Prepare;
      QRel.Open;

      QRel.First;
      while not QRel.Eof do
      begin
        VL1 := VL1 + QRel.FieldByName('VR_TOTAL').AsFloat;

        if Table7.FindKey([QRel.FieldByName('PRODUTO_ID').AsInteger]) then
        begin
          Table7.Edit;
          Table7.FieldByName('VALOR').AsFloat := Table7.FieldByName('VALOR').AsFloat +
                                                 QRel.FieldByName('VR_TOTAL').AsFloat;
        end
        else
        begin
          Table7.Append;
          Table7.FieldByName('CDEST').AsInteger := QRel.FieldByName('PRODUTO_ID').AsInteger;
          Table7.FieldByName('VALOR').AsFloat   := QRel.FieldByName('VR_TOTAL').AsFloat;
          Table7.FieldByName('NMEST').AsString  := QRel.FieldByName('DESCRICAO').AsString;
        end;

        Table7.Post;

        Application.ProcessMessages;
        QRel.Next;
      end;

      VPA := ((VL1 * Perc_A.Value) / 100);
      VPB := ((VL1 * Perc_B.Value) / 100);
      VPC := ((VL1 * Perc_C.Value) / 100);
      VL2 := 0;

      Table7.IndexName := T1;

      Table7.Last;
      while not Table7.Bof do
      begin
        if VL2 <= VPA then
        begin
          if Table3.RecordCount <= 12 then
            Table3.AppendRecord([Table7.FieldByName('NMEST').AsString, Table7.FieldByName('VALOR').AsFloat]);

          Table7.Edit;
          Table7.FieldByName('CURVA').AsString := 'A';
          Table7.Post;

          VL2 := VL2 + Table7.FieldByName('VALOR').AsFloat;
        end;

        Application.ProcessMessages;
        Table7.Prior;
      end;

      VL2 := 0;

      Table7.Last;
      while not Table7.Bof do
      begin
        if (Table7.FieldByName('CURVA').AsString = '') and (VL2 <= VPB) then
        begin
          if Table4.RecordCount <= 12 then
            Table4.AppendRecord([Table7.FieldByName('NMEST').AsString, Table7.FieldByName('VALOR').AsFloat]);

          Table7.Edit;
          Table7.FieldByName('CURVA').AsString := 'B';
          Table7.Post;

          VL2 := VL2 + Table7.FieldByName('VALOR').AsFloat;
        end;

        Application.ProcessMessages;
        Table7.Prior;
      end;

      VL2 := 0;

      Table7.Last;
      while not Table7.Bof do
      begin
        if (Table7.FieldByName('CURVA').AsString = '') and (VL2 <= VPC) then
        begin

          if Table5.RecordCount <= 12 then
            Table5.AppendRecord([Table7.FieldByName('NMEST').AsString, Table7.FieldByName('VALOR').AsFloat]);

          VL2 := VL2 + Table7.FieldByName('VALOR').AsFloat;
        end;

        Application.ProcessMessages;
        Table7.Prior;
      end;
    end;

    if Id_Opcao = 9 then
    begin
      Table7.Close;
      with Table7 do
      begin

        with FieldDefs do
        begin
          Clear;
          Add('CODIGO', ftInteger, 0, False);
          Add('VALOR', ftFloat, 0, False);
          Add('NOME', ftString, 40, False);
          Add('CURVA', ftString, 1, False);
        end;

        with IndexDefs do
        begin
          Clear;
          Add('', 'CODIGO', [ixPrimary, ixUnique]);
          Add(T1, 'VALOR', [ixCaseInsensitive]);
        end;
        IndexName := T1;
        Open;
      end;

      QRel.Sql.Clear;
      QRel.Sql.Add('SELECT TRANSACOES.FORNECEDOR_ID, TRANSACOES.VALOR, FORNECEDORES.NOME');
      QRel.Sql.Add('FROM TRANSACOES');
      QRel.Sql.Add('INNER JOIN FORNECEDORES');
      QRel.Sql.Add('ON (TRANSACOES.FORNECEDOR_ID = FORNECEDORES.FORNECEDOR_ID)');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :CONDUTA)');
      QRel.Sql.Add('AND (TRANSACOES.COND_PAGTO = :COND_PAGTO)');

      QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
      QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
      QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
      QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
      QRel.ParamByName('CONDUTA').AsString      := '02';
      QRel.ParamByName('COND_PAGTO').AsString   := 'A PRAZO';

      QRel.Sql.Add('ORDER BY TRANSACOES.VALOR DESC');

      QRel.Prepare;
      QRel.Open;

      QRel.First;
      while not QRel.Eof do
      begin
        VL1 := VL1 + QRel.FieldByName('VALOR').AsFloat;

        if Table7.FindKey([QRel.FieldByName('FORNECEDOR_ID').AsInteger]) then
        begin
          Table7.Edit;
          Table7.FieldByName('VALOR').AsFloat := Table7.FieldByName('VALOR').AsFloat +
                                                 QRel.FieldByName('VALOR').AsFloat;
        end
        else
        begin
          Table7.Append;
          Table7.FieldByName('CODIGO').AsInteger := QRel.FieldByName('FORNECEDOR_ID').AsInteger;
          Table7.FieldByName('VALOR').AsFloat    := QRel.FieldByName('VALOR').AsFloat;
          Table7.FieldByName('NOME').AsString    := QRel.FieldByName('NOME').AsString;
        end;

        Table7.Post;

        //ShowMessage(Table7.FieldByName('NOME').AsString);

        Application.ProcessMessages;
        QRel.Next;
      end;

      VPA := ((VL1 * Perc_A.Value) / 100);
      VPB := ((VL1 * Perc_B.Value) / 100);
      VPC := ((VL1 * Perc_C.Value) / 100);
      VL2 := 0;


      //Table7.IndexName := T1;

      Table7.Last;
      while not Table7.Bof do
      begin
        if VL2 <= VPA then
        begin
          if Table3.RecordCount <= 12 then
            Table3.AppendRecord([Table7.FieldByName('NOME').AsString, Table7.FieldByName('VALOR').AsFloat]);

          Table7.Edit;
          Table7.FieldByName('CURVA').AsString := 'A';
          Table7.Post;

          VL2 := VL2 + Table7.FieldByName('VALOR').AsFloat;
        end;

        Application.ProcessMessages;
        Table7.Prior;
      end;

      VL2 := 0;

      Table7.Last;
      while not Table7.Bof do
      begin
        if (Table7.FieldByName('CURVA').AsString = '') and (VL2 <= VPB) then
        begin
          if Table4.RecordCount <= 12 then
            Table4.AppendRecord([Table7.FieldByName('NOME').AsString, Table7.FieldByName('VALOR').AsFloat]);

          Table7.Edit;
          Table7.FieldByName('CURVA').AsString := 'B';
          Table7.Post;

          VL2 := VL2 + Table7.FieldByName('VALOR').AsFloat;
        end;
        Application.ProcessMessages;
        Table7.Prior;
      end;

      VL2 := 0;

      Table7.Last;
      while not Table7.Bof do
      begin
        if (Table7.FieldByName('CURVA').AsString = '') and (VL2 <= VPC) then
        begin
          if Table5.RecordCount <= 12 then
            Table5.AppendRecord([Table7.FieldByName('NOME').AsString, Table7.FieldByName('VALOR').AsFloat]);

          VL2 := VL2 + Table7.FieldByName('VALOR').AsFloat;
        end;

        Application.ProcessMessages;
        Table7.Prior;
      end;
    end;

    if (Id_Opcao = 2) or (Id_Opcao = 3) or (Id_Opcao = 14) then
    begin
      Application.CreateForm(TFrmCurva_Graf1, FrmCurva_Graf1);

      FrmCurva_Graf1.DBChart1.Title.Text.Clear;

      FrmCurva_Graf1.DBChart1.Title.Text.Add(Label5.Caption);

      try
        FrmCurva_Graf1.ShowModal;
      finally
        FrmCurva_Graf1.Release;
        Close;
      end;
    end
    else
    begin
      Application.CreateForm(TFrmCurva_Graf, FrmCurva_Graf);

      FrmCurva_Graf.DBChart1.Title.Text.Clear;
      FrmCurva_Graf.DBChart2.Title.Text.Clear;
      FrmCurva_Graf.DBChart3.Title.Text.Clear;

      if Id_Opcao = 1 then
      begin
        FrmCurva_Graf.DBChart1.Title.Text.Add('CURVA "A" DO EST X VR. TOTAL (' + Base.Text + ') - ' + FormatFloat('#,##0.00', VL1));
        FrmCurva_Graf.DBChart2.Title.Text.Add('CURVA "B" DO EST X VR. TOTAL (' + Base.Text + ') - ' + FormatFloat('#,##0.00', VL1));
        FrmCurva_Graf.DBChart3.Title.Text.Add('CURVA "C" DO EST X VR. TOTAL (' + Base.Text + ') - ' + FormatFloat('#,##0.00', VL1));
      end;

      try
        FrmCurva_Graf.ShowModal;
      finally
        FrmCurva_Graf.Release;
        Close;
      end;

      try
           Table7.IndexName := '';
           Table7.Delete;
           Table7.Close;
      except
        //
      end;

   

    end;
  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;

procedure TFrmCurva_ABC.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCurva_ABC.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmCurva_ABC.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
   // Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmCurva_ABC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmCurva_ABC.FormCreate(Sender: TObject);
begin
  if (Id_Opcao = 2) or (Id_Opcao = 3) or (Id_Opcao = 14) then
  begin
    if Id_Opcao = 2 then
      Label5.Caption := 'Curva ABC - Compras X Valor Total'
    else if Id_Opcao = 3 then
      Label5.Caption := 'Curva ABC - Vendas X Valor Total'
    else if Id_Opcao = 14 then
      Label5.Caption := 'Curva ABC - Consumo X Valor Total';

    Ano.Visible      := True;
    //Table3.TableName := 'Curva_Lin';
    Label4.Caption   := 'Ano';
    Label4.Visible   := True;
  end
  else
  begin
    if (Id_Opcao = 1) or (Id_Opcao > 3) then
    begin
      if Id_Opcao > 4 then
      begin
        Dtmen.Visible  := True;
        Dtmai.Visible  := True;
        Label4.Caption := 'Período';
        Label4.Visible := True;
      end;

      if Id_Opcao = 1 then
      begin
        Label5.Caption := 'Curva ABC - Estoque X Valor Total';

        Label4.Caption := 'Preço';
        Label4.Visible := True;
        Base.Visible   := True;
      end;

      if Id_Opcao = 4 then
        Label5.Caption := 'Curva ABC - Patrimônio X Valor Total';

      if Id_Opcao = 5 then
        Label5.Caption := 'Curva ABC - Faturamento X Produto';

      if Id_Opcao = 6 then
        Label5.Caption := 'Curva ABC - Faturamento X Cliente';

      if Id_Opcao = 7 then
        Label5.Caption := 'Curva ABC - Faturamento X Vendedor';

      if Id_Opcao = 8 then
        Label5.Caption := 'Curva ABC - Compras X Produto';

      if Id_Opcao = 9 then
        Label5.Caption := 'Curva ABC - Compras X Fornecedor';

      if Id_Opcao = 10 then
        Label5.Caption := 'Curva ABC - Receita X C. de Custo';

      if Id_Opcao = 11 then
        Label5.Caption := 'Curva ABC - Receita X Conta';

      if Id_Opcao = 12 then
        Label5.Caption := 'Curva ABC - Despesa X C. de Custo';

      if Id_Opcao = 13 then
        Label5.Caption := 'Curva ABC - Despesa X Conta';
    end;
  end;

  Ano.Text   := Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 7, 4);
  Dtmen.Text := '01/' + Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 4, 7);

  if Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 4, 2) = '12' then
    Dtmai.Text := DateToStr(StrToDate('01/01/' +
                  StrZero(IntToStr(StrToInt(Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 7, 4)) + 1), 4, 0)) - 1)
  else
    Dtmai.Text := DateToStr(StrToDate('01/' +
                  StrZero(IntToStr(StrToInt(Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 4, 2)) + 1), 2, 0) +
                  '/' + Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 7, 4)) - 1);

//  Table3.DatabaseName := ExtractFilePath(ParamStr(0));
//  Table4.DatabaseName := ExtractFilePath(ParamStr(0));
//  Table5.DatabaseName := ExtractFilePath(ParamStr(0));

  //Table3.Open;
  //Table4.Open;
  //Table5.Open;
end;

procedure TFrmCurva_ABC.Perc_AKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

end.
