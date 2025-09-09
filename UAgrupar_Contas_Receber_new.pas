unit UAgrupar_Contas_Receber;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, StdCtrls, Tabs, ComCtrls, Grids,
  DBGrids, Buttons, rxCurrEdit, Mask, rxToolEdit, ExtCtrls, DBTables, QRCtrls,
  QuickRpt, IBStoredProc,Math, Menus;

type
  TFrmAgrupar_Contas_Receber = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Dtmen: TDateEdit;
    Dtmai: TDateEdit;
    Label2: TLabel;
    Cliente: TCurrencyEdit;
    btnCliente: TSpeedButton;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    Alfabeto: TTabSet;
    btnExecuta: TButton;
    btnRetorna: TButton;
    DataContas: TDataSource;
    QContas: TIBQuery;
    Label3: TLabel;
    btnSoma: TButton;
    Vr_Agrupar: TRxCalcEdit;
    Label27: TLabel;
    Vr_Soma: TRxCalcEdit;
    Table_Temp: TTable;
    QRel: TIBQuery;
    Especie: TComboBox;
    Label8: TLabel;
    ID_Transacao: TIBStoredProc;
    DBGrid1: TDBGrid;
    PopupMenu1: TPopupMenu;
    Consulta_Valores: TMenuItem;
    GroupBox1: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Aguarde: TPanel;
    Vr_Total: TRxCalcEdit;
    Label7: TLabel;
    Label10: TLabel;
    Vr_Juros: TRxCalcEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnClienteClick(Sender: TObject);
    procedure ClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ClienteExit(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnRetornaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AlfabetoClick(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure btnSomaClick(Sender: TObject);
    procedure DtmenEnter(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Consulta_ValoresClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Seleciona;
    procedure Soma;
    procedure Cria_Dados_Temporarios;
  end;

var
  FrmAgrupar_Contas_Receber: TFrmAgrupar_Contas_Receber;
  Individual,Dif,Correc: Real;

implementation

uses
  UPrincipal, UData, UConsulta;

{$R *.dfm}

procedure TFrmAgrupar_Contas_Receber.Cria_Dados_Temporarios;
begin
 QContas.First;
  while not QContas.Eof do
  begin

    Dif    := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime - QContas.FieldByName('DT_VENCIMENTO').AsDateTime;
    Correc := ((((QContas.FieldByName('VALOR').AsFloat * FrmPrincipal.Config.FieldByName('JUROS_MENSAL').AsFloat) / 100) / 30) * Dif);
    Correc := RoundTo(Correc, -2);

    Table_Temp.Append;
    Table_Temp.FieldByName('NOME').AsString             := Copy(QContas.FieldByName('NOME').AsString, 1, 70);
    Table_Temp.FieldByName('ENDERECO').AsString         := Copy(QContas.FieldByName('ENDERECO').AsString, 1, 60);
    Table_Temp.FieldByName('NUMERO').AsString           := QContas.FieldByName('NUMERO').AsString;
    Table_Temp.FieldByName('TRANSACAO_ID').AsInteger    := QContas.FieldByName('TRANSACAO_ID').AsInteger;
    Table_Temp.FieldByName('PARCELA_ID').AsString       := QContas.FieldByName('PARCELA_ID').AsString;
    Table_Temp.FieldByName('TIPO_TRANSACAO').AsString   := QContas.FieldByName('TIPO_TRANSACAO').AsString;
    Table_Temp.FieldByName('DT_VENCIMENTO').AsDateTime  := QContas.FieldByName('DT_VENCIMENTO').AsDateTime;
    Table_Temp.FieldByName('BANCO_ID').AsInteger        := QContas.FieldByName('BANCO_ID').AsInteger;
    Table_Temp.FieldByName('VALOR').AsFloat             := QContas.FieldByName('VALOR').AsFloat;
    Table_Temp.FieldByName('PAGTO').AsString            := QContas.FieldByName('PAGTO').AsString;
    Table_Temp.FieldByName('DUPLICATA').AsString        := QContas.FieldByName('DUPLICATA').AsString;
    Table_Temp.FieldByName('ESPECIE').AsString          := QContas.FieldByName('ESPECIE').AsString;
    Table_Temp.FieldByName('HISTORICO').AsString        := QContas.FieldByName('HISTORICO').AsString;
    Table_Temp.FieldByName('NUM_DOC').AsString          := QContas.FieldByName('NUM_DOC').AsString;
    Table_Temp.FieldByName('CONTA_ID').AsInteger        := QContas.FieldByName('CONTA_ID').AsInteger;
    Table_Temp.FieldByName('VENDEDOR_ID').AsInteger     := QContas.FieldByName('VENDEDOR_ID').AsInteger;
    Table_Temp.FieldByName('EMPRESA_ID').AsInteger      := QContas.FieldByName('EMPRESA_ID').AsInteger;
    Table_Temp.FieldByName('TPCTB').AsString            := QContas.FieldByName('TPCTB').AsString;
    Table_Temp.FieldByName('C_CUSTO_ID').AsInteger      := QContas.FieldByName('C_CUSTO_ID').AsInteger;
    Table_Temp.FieldByName('CLIENTE_ID').AsInteger      := QContas.FieldByName('CLIENTE_ID').AsInteger;
    Table_Temp.FieldByName('VALOR_DESPESAS').AsFloat    := QContas.FieldByName('VALOR_DESPESAS').AsFloat ;
    Table_Temp.FieldByName('DT_VENC_ORI').AsDateTime    := QContas.FieldByName('DT_VENC_ORI').AsDateTime;
    Table_Temp.FieldByName('VALOR_ORI').AsFloat         := QContas.FieldByName('VALOR_ORI').AsFloat ;

    if (QContas.FieldByName('DT_VENCIMENTO').AsDateTime < Date) AND (QContas.FieldByName('DESPESA_ID').AsInteger = 0) then
    Begin
    Table_Temp.FieldByName('JUROS').AsFloat             := Correc;
    Table_Temp.FieldByName('VALOR_TOTAL').AsFloat       := QContas.FieldByName('VALOR').AsFloat + Correc;
    End
    Else
    Begin
    Table_Temp.FieldByName('JUROS').AsFloat             := 0;
    Table_Temp.FieldByName('VALOR_TOTAL').AsFloat       := QContas.FieldByName('VALOR').AsFloat;
    End;

    Table_Temp.Post;

    Application.ProcessMessages;
    QContas.Next;
  end;
  Table_temp.Open;
  end;

procedure TFrmAgrupar_Contas_Receber.Seleciona;
begin
  QContas.Sql.Clear;
  QContas.Sql.Add('SELECT CLIENTES.NOME, CLIENTES.ENDERECO, CLIENTES.NUMERO, TRANSPARCELAS.*, TRANSACOES.HISTORICO, TRANSACOES.NUM_DOC, TRANSACOES.CONTA_ID, TRANSACOES.VENDEDOR_ID, TRANSACOES.EMPRESA_ID, ' +
                  'TRANSACOES.TPCTB, TRANSACOES.C_CUSTO_ID, TRANSACOES.CLIENTE_ID ');
  QContas.Sql.Add('FROM CLIENTES');
  QContas.Sql.Add('INNER JOIN TRANSACOES');
  QContas.Sql.Add('ON (CLIENTES.CLIENTE_ID = TRANSACOES.CLIENTE_ID)');
  QContas.Sql.Add('INNER JOIN TRANSPARCELAS');
  QContas.Sql.Add('ON (TRANSACOES.TRANSACAO_ID = TRANSPARCELAS.TRANSACAO_ID)');
  QContas.Sql.Add('WHERE');
  QContas.Sql.Add('(TRANSACOES.COND_PAGTO = :COND_PAGTO) ');

  if Cliente.Value > 0 then
  begin
    QContas.Sql.Add('AND (TRANSACOES.CLIENTE_ID = :CLIENTE_ID)');

    QContas.ParamByName('CLIENTE_ID').AsInteger := StrToInt(Cliente.Text);
  end;

  if Especie.Text <> '' then
  begin
    QContas.Sql.Add('AND (TRANSPARCELAS.ESPECIE = :ESPECIE)');
    QContas.ParamByName('ESPECIE').AsString := Especie.Text;
  end;

  {if Cod_Contabil.Text <> '' then
  begin
    QContas.Sql.Add('AND (CLIENTES.COD_CONTABIL = :COD_CONTABIL)');
    QContas.ParamByName('COD_CONTABIL').AsString := Cod_Contabil.Text;
  end;

  if Valor.Value > 0 then
  begin
    QContas.Sql.Add('AND (TRANSPARCELAS.VALOR = :VALOR)');
    QContas.ParamByName('VALOR').AsFloat := Valor.Value;
  end; }

  if LeIni(Arq_Ini, 'Sistema', 'Exibir vendas TPCTB') = 'True' then
  begin
    QContas.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
    QContas.ParamByName('TPCTB').AsString := FrmData.QAcesso.FieldByName('TPCTB').AsString;
  end;

  QContas.Sql.Add('AND (TRANSPARCELAS.DT_VENCIMENTO BETWEEN :DT_INICIAL AND :DT_FINAL)');
  QContas.Sql.Add('AND (TRANSPARCELAS.VALOR > 0)');
  QContas.Sql.Add('AND (TRANSPARCELAS.BANCO_ID = 0)');
  QContas.Sql.Add('AND (TRANSPARCELAS.TIPO_TRANSACAO = :TIPO_TRANSACAO)');
  QContas.Sql.Add('AND ((TRANSPARCELAS.AGRUPAMENTO = 0) OR (TRANSPARCELAS.AGRUPAMENTO IS NULL))');

  QContas.Sql.Add('ORDER BY CLIENTES.NOME, TRANSPARCELAS.DT_VENCIMENTO, TRANSPARCELAS.PARCELA_ID');

  QContas.ParamByName('COND_PAGTO').AsString     := 'A PRAZO';
  QContas.ParamByName('DT_INICIAL').AsDateTime   := Dtmen.Date;
  QContas.ParamByName('DT_FINAL').AsDateTime     := Dtmai.Date;
  QContas.ParamByName('TIPO_TRANSACAO').AsString := 'T';


  QContas.Prepare;
  QContas.Open;

  if not QContas.IsEmpty then
  Consulta_Valores.Enabled := True
  Else
  Consulta_Valores.Enabled := True;
  



  Cria_Dados_Temporarios;

  Soma;

  DBGrid1.SetFocus;
end;

procedure TFrmAgrupar_Contas_Receber.Soma;
begin
   try
    Aguarde.Visible := True;

    Vr_Soma.Value     := 0;
   // Vr_Despesas.Value := 0;
    Vr_Total.Value    := 0;
    Vr_Juros.Value    := 0;
   // Dias.Value        := 0;

    QContas.First;
    while not QContas.Eof do
    begin
      Vr_Soma.Value     := (Vr_Soma.Value + QContas.FieldByName('VALOR').AsFloat);
    //  Vr_Despesas.Value := (Vr_Despesas.Value + QContas.FieldByName('VALOR_DESPESAS').AsFloat);

      if (FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime > QContas.FieldByName('DT_VENCIMENTO').AsDateTime) and (FrmPrincipal.Config.FieldByName('JUROS_MENSAL').AsFloat > 0) then
      begin
        Dif    := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime - QContas.FieldByName('DT_VENCIMENTO').AsDateTime;
        Correc := ((((QContas.FieldByName('VALOR').AsFloat * FrmPrincipal.Config.FieldByName('JUROS_MENSAL').AsFloat) / 100) / 30) * Dif);
        Correc := RoundTo(Correc, -2);
        Vr_Juros.Value := Correc + Vr_Juros.Value;

       // if Dias.value < Dif then
       // Dias.Value := Dif;

        Label10.Visible  := True;
        Vr_Juros.Visible := True;
       // Label11.Visible  := True;
       // Dias.Visible     := True;
      end;

      Application.ProcessMessages;
      QContas.Next;
    end;

    Vr_Total.Value := (Vr_Soma.Value + Vr_Juros.Value);

    QContas.First;
  finally
    Aguarde.Visible := False;
  end;
end;

procedure TFrmAgrupar_Contas_Receber.AlfabetoClick(Sender: TObject);
begin
  QContas.Sql.Clear;
  QContas.Sql.Add('SELECT CLIENTES.NOME, CLIENTES.ENDERECO, CLIENTES.NUMERO, TRANSPARCELAS.*, TRANSACOES.HISTORICO, TRANSACOES.NUM_DOC, TRANSACOES.CONTA_ID, TRANSACOES.VENDEDOR_ID, TRANSACOES.EMPRESA_ID, TRANSACOES.TPCTB, TRANSACOES.C_CUSTO_ID, TRANSACOES.CLIENTE_ID');
  QContas.Sql.Add('FROM CLIENTES');
  QContas.Sql.Add('INNER JOIN TRANSACOES');
  QContas.Sql.Add('ON (CLIENTES.CLIENTE_ID = TRANSACOES.CLIENTE_ID)');
  QContas.Sql.Add('INNER JOIN TRANSPARCELAS');
  QContas.Sql.Add('ON (TRANSACOES.TRANSACAO_ID = TRANSPARCELAS.TRANSACAO_ID)');
  QContas.Sql.Add('WHERE');
  QContas.Sql.Add('(CLIENTES.NOME LIKE :NOME)');
  QContas.Sql.Add('AND (TRANSACOES.COND_PAGTO = :COND_PAGTO)');
  QContas.Sql.Add('AND (TRANSACOES.CLIENTE_ID = :CLIENTE_ID)');

  if Especie.Text <> '' then
  begin
    QContas.Sql.Add('AND (TRANSPARCELAS.ESPECIE = :ESPECIE)');
    QContas.ParamByName('ESPECIE').AsString := Especie.Text;
  end;

  QContas.Sql.Add('AND (TRANSPARCELAS.DT_VENCIMENTO BETWEEN :DT_INICIAL AND :DT_FINAL)');
  QContas.Sql.Add('AND (TRANSPARCELAS.VALOR > 0)');
  QContas.Sql.Add('AND (TRANSPARCELAS.BANCO_ID = 0)');
  QContas.Sql.Add('AND (TRANSPARCELAS.TIPO_TRANSACAO = :TIPO_TRANSACAO)');
  QContas.Sql.Add('AND ((TRANSPARCELAS.AGRUPAMENTO = 0) OR (TRANSPARCELAS.AGRUPAMENTO IS NULL))');
  QContas.Sql.Add('ORDER BY CLIENTES.NOME, TRANSPARCELAS.DT_VENCIMENTO, TRANSPARCELAS.PARCELA_ID');

  QContas.ParamByName('NOME').AsString           := Chr(Alfabeto.TabIndex + 65) + '%';
  QContas.ParamByName('COND_PAGTO').AsString     := 'A PRAZO';
  QContas.ParamByName('CLIENTE_ID').AsInteger    := StrToInt(Cliente.Text);
  QContas.ParamByName('DT_INICIAL').AsDateTime   := Dtmen.Date;
  QContas.ParamByName('DT_FINAL').AsDateTime     := Dtmai.Date;
  QContas.ParamByName('TIPO_TRANSACAO').AsString := 'T';

  QContas.Prepare;
  QContas.Open;

  Soma;

  DBGrid1.SetFocus;
end;

procedure TFrmAgrupar_Contas_Receber.btnExecutaClick(Sender: TObject);
var
Id_Trans: Integer;
begin
  if QContas.IsEmpty then
    exit;

  if Vr_Agrupar.Value > 0 then
  begin
    ID_Transacao.Prepare;
    ID_Transacao.ExecProc;

    Id_Trans   := ID_Transacao.Params[0].Value;

    FrmData.Trans_Eficaz.CommitRetaining;

    QRel.Sql.Clear;
    QRel.Sql.Add('INSERT INTO TRANSACOES( ' +
                 'TRANSACAO_ID,  DT_TRANS,    DT_MOVIMENTO,  CONDUTA, ' +
                 'DEPTO,         EMPRESA_ID,  CONTA_ID,      C_CUSTO_ID, ' +
                 'VALOR,         TPCTB,       AUTORIZ_ID,    HISTORICO, ' +
                 'CONTAAUX_ID,   NUM_DOC,     BANCO_ID,      BALANCO, ' +
                 'COND_PAGTO,    CLIENTE_ID) VALUES(' +
                 ':TRANSACAO_ID, :DT_TRANS,   :DT_MOVIMENTO, :CONDUTA, ' +
                 ':DEPTO,        :EMPRESA_ID, :CONTA_ID,     :C_CUSTO_ID, ' +
                 ':VALOR,        :TPCTB,      :AUTORIZ_ID,   :HISTORICO, ' +
                 ':CONTAAUX_ID,  :NUM_DOC,    :BANCO_ID,     :BALANCO, ' +
                 ':COND_PAGTO,   :CLIENTE_ID)');

    QRel.ParamByName('TRANSACAO_ID').AsInteger  := Id_Trans;
    QRel.ParamByName('DT_TRANS').AsDateTime     := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
    QRel.ParamByName('DT_MOVIMENTO').AsDateTime := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
    QRel.ParamByName('CONDUTA').AsString        := '01';
    QRel.ParamByName('DEPTO').AsString          := '03';
    QRel.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    QRel.ParamByName('CONTA_ID').AsInteger      := 0;
    QRel.ParamByName('C_CUSTO_ID').AsInteger    := 1;
    QRel.ParamByName('VALOR').AsFloat           := Vr_Agrupar.Value;
    QRel.ParamByName('TPCTB').AsString          := '2';
    QRel.ParamByName('AUTORIZ_ID').AsInteger    := 0;
    QRel.ParamByName('HISTORICO').AsString      := 'AGRUPAMENTO CONTAS DIVERSAS';
    QRel.ParamByName('CONTAAUX_ID').AsInteger   := 0;
    QRel.ParamByName('NUM_DOC').AsString        := '0000000';
    QRel.ParamByName('BANCO_ID').AsInteger      := 0;
    QRel.ParamByName('BALANCO').AsString        := 'AGRUPADO';
    QRel.ParamByName('COND_PAGTO').AsString     := 'A PRAZO';
    QRel.ParamByName('CLIENTE_ID').AsInteger    := StrToInt(Cliente.Text);

    QRel.Prepare;
    QRel.ExecSql;

    FrmData.Trans_Eficaz.CommitRetaining;

    Table_Temp.First;
    while not Table_Temp.Eof do
    begin
      QRel.Sql.Clear;
      QRel.Sql.Add('UPDATE TRANSPARCELAS SET AGRUPAMENTO = :AGRUPAMENTO');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
      QRel.Sql.Add('AND (PARCELA_ID = :PARCELA_ID)');

      QRel.ParamByName('AGRUPAMENTO').AsInteger  := Id_Trans;
      QRel.ParamByName('TRANSACAO_ID').AsInteger := Table_Temp.FieldByName('TRANSACAO_ID').AsInteger;
      QRel.ParamByName('PARCELA_ID').AsString    := Table_Temp.FieldByName('PARCELA_ID').AsString;

      QRel.Prepare;
      QRel.ExecSql;

      FrmData.Trans_Eficaz.CommitRetaining;

      Application.ProcessMessages;
      Table_Temp.Next;
    end;
  end;

  QContas.Close;
  QContas.Open;

  Soma;

  Application.MessageBox('Procedimento executado com sucesso', PChar(Msg_Title), mb_IconInformation);

  Close;
end;

procedure TFrmAgrupar_Contas_Receber.btnClienteClick(Sender: TObject);
begin
  try
    Cliente.Value := GetConsulta('CLIENTES', 0, 0, StrToInt(Cliente.Text));
  except
    Cliente.Value := GetConsulta('CLIENTES', 0, 0, 0);
  end;

  Seleciona;
end;

procedure TFrmAgrupar_Contas_Receber.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmAgrupar_Contas_Receber.btnSomaClick(Sender: TObject);
begin
  Vr_Agrupar.Value := 0;
  
  Table_Temp.First;
  while not Table_Temp.Eof do
  begin
    Vr_Agrupar.Value := Vr_Agrupar.Value + Table_Temp.FieldByName('VALOR_TOTAL').AsFloat;

    Application.ProcessMessages;
    Table_Temp.Next;
  end;

  Table_Temp.First;
end;

procedure TFrmAgrupar_Contas_Receber.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  OldBkMode: Integer;
begin
  if Table_Temp.FieldByName('DT_VENCIMENTO').AsDatetime > Date then
    TDBGrid(Sender).Canvas.Font.Color := clGreen

  else if  Table_Temp.FieldByName('DT_VENCIMENTO').AsDateTime < Date then
    TDBGrid(Sender).Canvas.Font.Color := clRed

  Else if Table_Temp.FieldByName('DT_VENCIMENTO').AsDateTime = Date then
    TDBGrid(Sender).Canvas.Font.Color := clBlue;

  TDBGrid(Sender).DefaultDrawDataCell(Rect, TDBGrid(Sender).Columns[DataCol].Field, State);

end;

procedure TFrmAgrupar_Contas_Receber.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F3 then
  begin
    if not Table_Temp.Locate('TRANSACAO_ID;PARCELA_ID', VarArrayOf([QContas.FieldByName('TRANSACAO_ID').AsInteger, QContas.FieldByName('PARCELA_ID').AsString]), [loCaseInsensitive]) then
      Cria_Dados_Temporarios;

    btnSomaClick(Sender);

    QContas.Next;
  end;

  if Key = VK_F4 then
  begin
    Table_Temp.First;
    while not Table_Temp.Eof do
      Table_Temp.Delete;

    btnSomaClick(Sender);  
  end;

  if Key = VK_F9 then
    Perform(Wm_NextDlgCtl, 0, 0);
end;

procedure TFrmAgrupar_Contas_Receber.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmAgrupar_Contas_Receber.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmAgrupar_Contas_Receber.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmAgrupar_Contas_Receber.FormCreate(Sender: TObject);
var
Temp_Name: String;
begin
  with Table_Temp do
  begin
    DatabaseName := ExtractFilePath(ParamStr(0));
    Temp_Name    := Copy(TimeToStr(time), 1, 2) + Copy(TimeToStr(time), 4, 2) + Copy(TimeToStr(time), 7, 2);
    TableName    := Temp_Name;

    with FieldDefs do
    begin
      Clear;
      Add('ACESSO', ftAutoInc, 0, False);
      Add('NOME', ftString, 70, False);
      Add('ENDERECO', ftString, 60, False);
      Add('NUMERO', ftString, 6, False);
      Add('TRANSACAO_ID', ftInteger, 0, False);
      Add('PARCELA_ID', ftString, 5, False);
      Add('TIPO_TRANSACAO', ftString, 1, False);
      Add('DT_VENCIMENTO', ftDate, 0, False);
      Add('BANCO_ID', ftInteger, 0, False);
      Add('VALOR', ftFloat, 0, False);
      Add('PAGTO', ftString, 1, False);
      Add('DUPLICATA', ftString, 10, False);
      Add('ESPECIE', ftString, 10, False);
      Add('HISTORICO', ftString, 150, False);
      Add('NUM_DOC', ftString, 7, False);
      Add('CONTA_ID', ftInteger, 0, False);
      Add('VENDEDOR_ID', ftInteger, 0, False);
      Add('EMPRESA_ID', ftInteger, 0, False);
      Add('TPCTB', ftString, 0, False);
      Add('C_CUSTO_ID', ftInteger, 0, False);
      Add('CLIENTE_ID', ftInteger, 0, False);
      Add('MES_ANO', ftString, 7, False);
      Add('JUROS', ftFloat, 0, False);
      Add('VALOR_TOTAL', ftFloat, 0, False);
      Add('VALOR_DESPESAS', ftFloat, 0, False);
      Add('DT_VENC_ORI', ftDate, 0, False);
      Add('VALOR_ORI', ftFloat, 0, False);

    end;

    with IndexDefs do
    begin
      Clear;
      Add('', 'ACESSO', [ixPrimary, ixUnique]);
      Add('TEMP', 'NOME;DT_VENCIMENTO', [ixCaseInsensitive]);
    end;

    CreateTable;
    IndexName := 'TEMP';
    Open;
  end;

  Dtmen.Date := StrToDate('01/01/1900');
  Dtmai.Date := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;

 { DBGrid1.Columns[0].Width := 268;
  DBGrid1.Columns[1].Width := 90;
  DBGrid1.Columns[2].Width := 90;
  DBGrid1.Columns[3].Width := 40;
  DBGrid1.Columns[4].Width := 64;
  DBGrid1.Columns[5].Width := 90; }
end;

procedure TFrmAgrupar_Contas_Receber.FormDestroy(Sender: TObject);
begin
  Table_Temp.IndexName := '';
  Table_Temp.Close;
  Table_Temp.DeleteTable;
end;

procedure TFrmAgrupar_Contas_Receber.ClienteExit(Sender: TObject);
begin
  Seleciona;
end;

procedure TFrmAgrupar_Contas_Receber.ClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = Cliente) then
    btnClienteClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmAgrupar_Contas_Receber.Consulta_ValoresClick(Sender: TObject);
var
Vencimento:String;
begin
if DateToStr(DBGrid1.DataSource.DataSet.FieldByName('DT_VENC_ORI').AsDateTime) = '30/12/1899' then
Vencimento := 'Conta Original'
Else
Vencimento := DateToStr(DBGrid1.DataSource.DataSet.FieldByName('DT_VENC_ORI').AsDateTime);


MessageDlg(Pchar('Documento Número: ' + DBGrid1.DataSource.DataSet.FieldByName('DUPLICATA').AsString + #13 +
                                          'Valor Principal: ' + FloatToStr(DBGrid1.DataSource.DataSet.FieldByName('VALOR_ORI').AsFloat)  + #13 +
                                          'Vencimento Anterior: ' + Vencimento),mtinformation,[mbok],0);


end;

end.
