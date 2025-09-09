unit UCheques_Recebidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ComCtrls, ToolWin, StdCtrls, Grids, DBGrids, Tabs, ExtCtrls,
  DB, IBCustomDataSet, IBQuery, Mask, Buttons, DBCtrls, rxCurrEdit, rxToolEdit,
  Menus, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmCheques_Recebidos = class(TForm)
    PageControl1: TPageControl;
    Panel1: TPanel;
    Consulta: TTabSheet;
    Manutencao: TTabSheet;
    DBGrid1: TDBGrid;
    DataTabela: TDataSource;
    btnRetorna: TBitBtn;
    Panel2: TPanel;
    btnPrior: TBitBtn;
    btnNext: TBitBtn;
    btnInsert: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    btnSave: TBitBtn;
    btnDiscard: TBitBtn;
    Label2: TLabel;
    Label9: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label11: TLabel;
    DT_CHEQUE: TDateEdit;
    EMPRESA_ID: TCurrencyEdit;
    CLIENTE_ID: TCurrencyEdit;
    NOME_BANCO: TEdit;
    DataEmpresa: TDataSource;
    DataCliente: TDataSource;
    DBText1: TDBText;
    DBText2: TDBText;
    btnEmpresa: TSpeedButton;
    btnCliente: TSpeedButton;
    VALOR: TRxCalcEdit;
    DT_MOVIMENTO: TDateEdit;
    Dias: TTabSet;
    AUTORIZ_ID: TCurrencyEdit;
    Label7: TLabel;
    btnPesquisa: TBitBtn;
    Label1: TLabel;
    DT_VENCIMENTO: TDateEdit;
    Label4: TLabel;
    CPF_CNPJ: TCurrencyEdit;
    Label8: TLabel;
    NOME_CLIENTE: TEdit;
    Label10: TLabel;
    ENDERECO: TEdit;
    Label12: TLabel;
    BAIRRO: TEdit;
    Label13: TLabel;
    MUNICIPIO: TEdit;
    Label14: TLabel;
    CEP: TMaskEdit;
    Label15: TLabel;
    DDD: TMaskEdit;
    TELEFONE: TMaskEdit;
    NUM_CHEQUE: TCurrencyEdit;
    LIQUIDADO: TEdit;
    Label22: TLabel;
    BLOQUEADO: TComboBox;
    Terceiros: TCheckBox;
    NOME_TER: TEdit;
    Observacao: TMemo;
    Label16: TLabel;
    Label17: TLabel;
    PopupMenu1: TPopupMenu;
    Liquida_Cheque: TMenuItem;
    CHEQUE_ID: TCurrencyEdit;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Dt_liquidacao: TDateEdit;
    Label21: TLabel;
    BANCO_ID: TCurrencyEdit;
    DBText3: TDBText;
    DataBanco: TDataSource;
    lbl1: TLabel;
    Operador: TEdit;
    lbl2: TLabel;
    ecf: TCurrencyEdit;
    lbl3: TLabel;
    num_doc: TEdit;
    QBanco: TFDQuery;
    QLiquida: TFDQuery;
    iQuery2: TFDQuery;
    QCliente: TFDQuery;
    QEmpresa: TFDQuery;
    IQuery: TFDQuery;
    QTabela: TFDQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRetornaClick(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDiscardClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure ManutencaoShow(Sender: TObject);
    procedure btnPriorClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure EMPRESA_IDExit(Sender: TObject);
    procedure CLIENTE_IDExit(Sender: TObject);
    procedure EMPRESA_IDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnEmpresaClick(Sender: TObject);
    procedure btnClienteClick(Sender: TObject);
    procedure DiasClick(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DT_CHEQUEKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure DT_CHEQUEEnter(Sender: TObject);
    procedure TerceirosClick(Sender: TObject);
    procedure Liquida_ChequeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CmdSelect: String;
    CmdOrderBy: String;
    CmdSelectNull: String;
    procedure Botoes_Editing;
    procedure Botoes_Normal;
    procedure DetailSearch(Tabela: String);
    procedure Habilitar(Status: Boolean);
    procedure Insert;
    procedure Set_Campos(Vazio: Boolean);
    procedure Edit;
    function Validacao: Boolean;
  end;

var
  FrmCheques_Recebidos: TFrmCheques_Recebidos;
  Operacao: String;
  ID: Integer;

implementation

uses
  UPrincipal, UData, UConsulta, UPesquisa,Uliquidacao_cheques;

{$R *.dfm}

procedure TFrmCheques_Recebidos.TerceirosClick(Sender: TObject);
begin
if Terceiros.Checked then
  Begin
  Nome_Ter.Enabled        := True;
  Observacao.Enabled      := True;
  End
  Else
  Begin
  Nome_Ter.Enabled        := False;
  Observacao.Enabled      := False;
  End;
end;

procedure TFrmCheques_Recebidos.CLIENTE_IDExit(Sender: TObject);
begin
  DetailSearch('Cliente');
end;

procedure TFrmCheques_Recebidos.Liquida_ChequeClick(Sender: TObject);
begin
 if QTabela.FieldByName('LIQUIDADO').AsString <> 'SIM' then
 Begin
      Application.CreateForm(TFrmLiquidacao_Cheques, FrmLiquidacao_Cheques);
  try
    if FrmLiquidacao_Cheques.ShowModal = mrOK then
    begin
      ID       := QTabela.FieldByName('CHEQUE_ID').AsInteger;

      QLiquida.Sql.Clear;
      QLiquida.Sql.Add('UPDATE CHEQUES_RECEBIDOS SET LIQUIDADO = :LIQUIDADO, DT_LIQUIDACAO = :DT_LIQUIDACAO, BANCO_ID = :BANCO_ID ');
      QLiquida.Sql.Add('WHERE');
      QLiquida.Sql.Add('(CHEQUE_ID = :CHEQUE_ID)');

      QLiquida.ParamByName('LIQUIDADO').AsString       := 'SIM';
      QLiquida.ParamByName('DT_LIQUIDACAO').AsDateTime := FrmLiquidacao_Cheques.Dt_Liquidacao.Date;
      QLiquida.ParamByName('CHEQUE_ID').AsInteger      := ID;

      if  FrmLiquidacao_Cheques.BANCO_ID.Value = 0 then
      QLiquida.ParamByName('BANCO_ID').AsInteger       := StrToInt(LeIni(Arq_Ini, 'Sistema', 'Caixa'))
      Else
      QLiquida.ParamByName('BANCO_ID').AsInteger       := StrToInt(FrmLiquidacao_Cheques.BANCO_ID.Text);


      QLiquida.Prepare;
      QLiquida.ExecSql;

     // MessageDlg(QLiquida.SQL.Text,mtinformation,[mbok],0);



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
      QLiquida.ParamByName('CLIENTE_ID').AsInteger     := QTabela.FieldByName('CLIENTE_ID').AsInteger;
      QLiquida.ParamByName('NUM_DOC').AsString         := StrZero(QTabela.FieldByName('CHEQUE_ID').AsString, 6, 0);
      QLiquida.ParamByName('CONTA_ID').AsInteger       := FrmPrincipal.Config.FieldByName('CONTA_ESTOQUE').AsInteger;

      if  FrmLiquidacao_Cheques.BANCO_ID.Value = 0 then
      QLiquida.ParamByName('BANCO_ID').AsInteger       := StrToInt(LeIni(Arq_Ini, 'Sistema', 'Caixa'))
      Else
      QLiquida.ParamByName('BANCO_ID').AsInteger       := StrToInt(FrmLiquidacao_Cheques.BANCO_ID.Text);

      QLiquida.ParamByName('C_CUSTO_ID').AsInteger     := 1;
      QLiquida.ParamByName('PATRIMONIO_ID').AsInteger  := 0;
      QLiquida.ParamByName('ODOMETRO').AsFloat         := 0;
      QLiquida.ParamByName('QUANTIDADE').AsFloat       := 0;
      QLiquida.ParamByName('VALOR').AsFloat            := QTabela.FieldByName('VALOR').AsFloat;
      QLiquida.ParamByName('BALANCO').AsString         := 'LIBERADO';
      QLiquida.ParamByName('COND_PAGTO').AsString      := 'A VISTA';
      QLiquida.ParamByName('FLUXO_CAIXA_ID').AsInteger := 1;
      QLiquida.ParamByName('HISTORICO').AsString       := 'Vr. Baixa Cheque - ' + QTabela.FieldByName('NOME_CLIENTE').AsString;
      QLiquida.ParamByName('AUTORIZ_ID').AsInteger     := FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger;
      QLiquida.ParamByName('CONDUTA').AsString         := '01';
      QLiquida.ParamByName('DEPTO').AsString           := '03';
      QLiquida.ParamByName('TPCTB').AsString           := FrmData.QAcesso.FieldByName('TPCTB').AsString;

      QLiquida.Prepare;
      QLiquida.ExecSql;



      QTabela.Close;
      QTabela.Open;
      QTabela.Locate('CHEQUE_ID', ID, [loCaseInsensitive]);
      Habilitar(False);
      ManutencaoShow(Manutencao);
    end;
  finally
    FrmLiquidacao_Cheques.Release;
  end;

  if (not QTabela.IsEmpty) and (FrmPrincipal.QEmpresa.FieldByName('CARGA').AsString = 'SIM') then
    Carga_PDV_Off_Line(0, QTabela.FieldByName('CLIENTE_ID').AsInteger);

 End
 Else
 Begin
 Application.MessageBox('Cheque liquidado!','Eficaz', MB_IconStop + MB_OK);
 Abort;
 End;



 end;

procedure TFrmCheques_Recebidos.Botoes_Editing;
begin
  btnPrior.Enabled    := False;
  btnNext.Enabled     := False;
  btnInsert.Enabled   := False;
  btnEdit.Enabled     := False;
  btnDelete.Enabled   := False;
  btnSave.Enabled     := True;
  btnDiscard.Enabled  := True;
  btnRetorna.Enabled  := False;
  btnEmpresa.Enabled  := True;
  btnCliente.Enabled  := True;
  btnPesquisa.Enabled := False;
end;

procedure TFrmCheques_Recebidos.Botoes_Normal;
begin
  if not QTabela.Bof then
    btnPrior.Enabled := True
  else
    btnPrior.Enabled := False;

  if not QTabela.Eof then
    btnNext.Enabled := True
  else
    btnNext.Enabled := False;

  btnInsert.Enabled := True;

  if not QTabela.IsEmpty then
  begin
    btnEdit.Enabled := True;
    btnDelete.Enabled := True;
  end
  else
  begin
    btnEdit.Enabled := False;
    btnDelete.Enabled := False;
  end;

  btnSave.Enabled     := False;
  btnDiscard.Enabled  := False;
  btnRetorna.Enabled  := True;
  btnEmpresa.Enabled  := False;
  btnCliente.Enabled  := False;
  btnPesquisa.Enabled := True;
end;

procedure TFrmCheques_Recebidos.DetailSearch(Tabela: String);
begin
  if ((Tabela = '') or (Tabela = 'Empresa')) and (EMPRESA_ID.Text <> '') then
  begin
    QEmpresa.Close;
    QEmpresa.ParamByName('EMPRESA_ID').AsInteger := StrToInt(EMPRESA_ID.Text);
    QEmpresa.Prepare;
    QEmpresa.Open;
  end;

  if ((Tabela = '') or (Tabela = 'Banco')) and (BANCO_ID.Text <> '') then
  begin
    QBanco.Close;
    QBanco.ParamByName('BANCO_ID').AsInteger   := StrToInt(BANCO_ID.Text);
    QBanco.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    QBanco.Prepare;
    QBanco.Open;
  end; 

  if ((Tabela = '') or (Tabela = 'Cliente')) and (CLIENTE_ID.Text <> '') then
  begin
    QCliente.Close;
    QCliente.ParamByName('CLIENTE_ID').AsInteger := StrToInt(CLIENTE_ID.Text);
    QCliente.Prepare;
    QCliente.Open;

    if not QCliente.IsEmpty then
    begin
      CPF_CNPJ.Text     := SemMascara(QCliente.FieldByName('CNPJ').AsString);
      NOME_CLIENTE.Text := Copy(QCliente.FieldByName('NOME').AsString, 1, 40);
      ENDERECO.Text     := Copy(QCliente.FieldByName('ENDERECO').AsString, 1, 40);
      BAIRRO.Text       := Copy(QCliente.FieldByName('BAIRRO').AsString, 1, 20);
      MUNICIPIO.Text    := Copy(QCliente.FieldByName('MUNICIPIO').AsString, 1, 30);
      CEP.Text          := QCliente.FieldByName('CEP').AsString;
      DDD.Text          := QCliente.FieldByName('DDD').AsString;
      TELEFONE.Text     := QCliente.FieldByName('TELEFONE_1').AsString;
    end;
  end;
end;

procedure TFrmCheques_Recebidos.DiasClick(Sender: TObject);
begin
  if Dias.TabIndex <> (Dias.Tabs.Count - 1) then
  begin
    CmdSelectNull    := 'WHERE (CHEQUE_ID IS NOT NULL) AND (DT_MOVIMENTO = :DT_MOVIMENTO) AND (EMPRESA_ID = :EMPRESA_ID)';
    CmdOrderBy       := 'ORDER BY CHEQUE_ID';
    QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

    QTabela.ParamByName('DT_MOVIMENTO').AsDateTime := StrToDate(StrZero(IntToStr(Dias.TabIndex + 1), 2, 0) + '/' + Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 4, 7));
    QTabela.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  end
  else
  begin
    CmdSelectNull    := 'WHERE (CHEQUE_ID IS NOT NULL) AND (DT_MOVIMENTO <= :DT_MOVIMENTO) AND (EMPRESA_ID = :EMPRESA_ID)';
    CmdOrderBy       := 'ORDER BY CHEQUE_ID';

    QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

    QTabela.ParamByName('DT_MOVIMENTO').AsDateTime := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
    QTabela.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  end;

  QTabela.Open;
  Botoes_Normal;
end;

procedure TFrmCheques_Recebidos.DT_CHEQUEEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmCheques_Recebidos.DT_CHEQUEKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmCheques_Recebidos.Habilitar(Status: Boolean);
var
I: Integer;
Temp: TComponent;
begin
  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
      TEdit(Temp).Enabled := Status;

    if Temp is TMaskEdit then
      TMaskEdit(Temp).Enabled := Status;

    if Temp is TDateEdit then
      TDateEdit(Temp).Enabled := Status;

    if Temp is TCurrencyEdit then
      TCurrencyEdit(Temp).Enabled := Status;

    if Temp is TRxCalcEdit then
      TRxCalcEdit(Temp).Enabled := Status;

    if Temp is TComboBox then
      TComboBox(Temp).Enabled := Status;

    if Temp is TCheckBox then
      TCheckBox(Temp).Enabled := Status;

    if Temp is TMemo then
      TMemo(Temp).Enabled := Status;
  end;
end;

procedure TFrmCheques_Recebidos.Insert;
var
I: Integer;
Temp: TComponent;
Sql, Par: String;
begin
  Sql := 'INSERT INTO CHEQUES_RECEBIDOS(';
  Par := '';

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
    begin
      if Sql = 'INSERT INTO CHEQUES_RECEBIDOS(' then
        Sql := Sql + TEdit(Temp).Name
      else
        Sql := Sql + ', ' + TEdit(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TEdit(Temp).Name
      else
        Par := Par + ', :' + TEdit(Temp).Name;
    end;

    if Temp is TMaskEdit then
    begin
      if Sql = 'INSERT INTO CHEQUES_RECEBIDOS(' then
        Sql := Sql + TMaskEdit(Temp).Name
      else
        Sql := Sql + ', ' + TMaskEdit(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TMaskEdit(Temp).Name
      else
        Par := Par + ', :' + TMaskEdit(Temp).Name;
    end;

    if (Temp is TDateEdit) AND (TDateEdit(Temp).Text <>  '  /  /    ')  then
    begin
      if Sql = 'INSERT INTO CHEQUES_RECEBIDOS(' then
        Sql := Sql + TDateEdit(Temp).Name
      else
        Sql := Sql + ', ' + TDateEdit(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TDateEdit(Temp).Name
      else
        Par := Par + ', :' + TDateEdit(Temp).Name;
    end;

    if Temp is TCurrencyEdit then
    begin
      if Sql = 'INSERT INTO CHEQUES_RECEBIDOS(' then
        Sql := Sql + TCurrencyEdit(Temp).Name
      else
        Sql := Sql + ', ' + TCurrencyEdit(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TCurrencyEdit(Temp).Name
      else
        Par := Par + ', :' + TCurrencyEdit(Temp).Name;
    end;

    if Temp is TRxCalcEdit then
    begin
      if Sql = 'INSERT INTO CHEQUES_RECEBIDOS(' then
        Sql := Sql + TRxCalcEdit(Temp).Name
      else
        Sql := Sql + ', ' + TRxCalcEdit(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TRxCalcEdit(Temp).Name
      else
        Par := Par + ', :' + TRxCalcEdit(Temp).Name;
    end;

    if Temp is TComboBox then
    begin
      if Sql = 'INSERT INTO CHEQUES_RECEBIDOS(' then
        Sql := Sql + TComboBox(Temp).Name
      else
        Sql := Sql + ', ' + TComboBox(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TComboBox(Temp).Name
      else
        Par := Par + ', :' + TComboBox(Temp).Name;
    end;

  if Temp is TCheckBox then
    begin
      if Sql = 'INSERT INTO CHEQUES_RECEBIDOS(' then
        Sql := Sql + TCheckBox(Temp).Name
      else
        Sql := Sql + ', ' + TCheckBox(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TCheckBox(Temp).Name
      else
        Par := Par + ', :' + TCheckBox(Temp).Name;
    end;

    if Temp is TMemo then
    begin
      if Sql = 'INSERT INTO CHEQUES_RECEBIDOS(' then
        Sql := Sql + TMemo(Temp).Name
      else
        Sql := Sql + ', ' + TMemo(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TMemo(Temp).Name
      else
        Par := Par + ', :' + TMemo(Temp).Name;
    end;


  end;

  Sql := Sql + ') VALUES(' + Par + ')';

  

  IQuery.Sql.Clear;
  IQuery.Sql.Add(Sql);

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
      IQuery.ParamByName(TEdit(Temp).Name).AsString := TEdit(Temp).Text;

    if Temp is TMaskEdit then
      IQuery.ParamByName(TMaskEdit(Temp).Name).AsString := TMaskEdit(Temp).Text;

    if Temp is TDateEdit then
       if TDateEdit(Temp).Text <> '  /  /    ' then
       IQuery.ParamByName(TDateEdit(Temp).Name).AsDateTime := TDateEdit(Temp).Date;

    if Temp is TCurrencyEdit then
      IQuery.ParamByName(TCurrencyEdit(Temp).Name).AsFloat := TCurrencyEdit(Temp).Value;

    if Temp is TRxCalcEdit then
      IQuery.ParamByName(TRxCalcEdit(Temp).Name).AsFloat := TRxcalcEdit(Temp).Value;

    if Temp is TComboBox then
      IQuery.ParamByName(TComboBox(Temp).Name).AsString := TComboBox(Temp).Text;

    if Temp is TMemo then
      IQuery.ParamByName(TMemo(Temp).Name).AsByteStr := TMemo(Temp).Text;

    if Temp is TCheckBox then
    begin
      if TCheckBox(Temp).Checked then
        IQuery.ParamByName(TCheckBox(Temp).Name).AsString := 'True'
      else
        IQuery.ParamByName(TCheckBox(Temp).Name).AsString := 'False';
    end;

  end;

  IQuery.Prepare;
  IQuery.ExecSql;

  Habilitar(False);
end;

procedure TFrmCheques_Recebidos.Edit;
var
I: Integer;
Temp: TComponent;
Sql: String;
begin
  Sql := 'UPDATE CHEQUES_RECEBIDOS SET ';

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
    begin
      if Sql = 'UPDATE CHEQUES_RECEBIDOS SET ' then
        Sql := Sql + TEdit(Temp).Name + ' = :' + TEdit(Temp).Name
      else
        Sql := Sql + ', ' + TEdit(Temp).Name + ' = :' + TEdit(Temp).Name;
    end;

    if Temp is TMaskEdit then
    begin
      if Sql = 'UPDATE CHEQUES_RECEBIDOS SET ' then
        Sql := Sql + TMaskEdit(Temp).Name + ' = :' + TMaskEdit(Temp).Name
      else
        Sql := Sql + ', ' + TMaskEdit(Temp).Name + ' = :' + TMaskEdit(Temp).Name;
    end;

    if (Temp is TDateEdit) AND (TDateEdit(Temp).Text <>  '  /  /    ')  then
    begin
      if Sql = 'UPDATE CHEQUES_RECEBIDOS SET ' then
        Sql := Sql + TDateEdit(Temp).Name + ' = :' + TDateEdit(Temp).Name
      else
        Sql := Sql + ', ' + TDateEdit(Temp).Name + ' = :' + TDateEdit(Temp).Name;
    end;

    if Temp is TCurrencyEdit then
    begin
      if Sql = 'UPDATE CHEQUES_RECEBIDOS SET ' then
        Sql := Sql + TCurrencyEdit(Temp).Name + ' = :' + TCurrencyEdit(Temp).Name
      else
        Sql := Sql + ', ' + TCurrencyEdit(Temp).Name + ' = :' + TCurrencyEdit(Temp).Name;
    end;

    if Temp is TRxCalcEdit then
    begin
      if Sql = 'UPDATE CHEQUES_RECEBIDOS SET ' then
        Sql := Sql + TRxCalcEdit(Temp).Name + ' = :' + TRxCalcEdit(Temp).Name
      else
        Sql := Sql + ', ' + TRxCalcEdit(Temp).Name + ' = :' + TRxCalcEdit(Temp).Name;
    end;

    if Temp is TComboBox then
    begin
      if Sql = 'UPDATE CHEQUES_RECEBIDOS SET ' then
        Sql := Sql + TComboBox(Temp).Name + ' = :' + TComboBox(Temp).Name
      else
        Sql := Sql + ', ' + TComboBox(Temp).Name + ' = :' + TComboBox(Temp).Name;
    end;

   if Temp is TCheckBox then
    begin
      if Sql = 'UPDATE CHEQUES_RECEBIDOS SET ' then
        Sql := Sql + TCheckBox(Temp).Name + ' = :' + TCheckBox(Temp).Name
      else
        Sql := Sql + ', ' + TCheckBox(Temp).Name + ' = :' + TCheckBox(Temp).Name;
    end;

    if Temp is TMemo  then
    begin
      if Sql = 'UPDATE CHEQUES_RECEBIDOS SET ' then
        Sql := Sql + TMemo(Temp).Name + ' = :' + TMemo(Temp).Name
      else
        Sql := Sql + ', ' + TMemo(Temp).Name + ' = :' + TMemo(Temp).Name;
    end;


  end;

  Sql := Sql + ' WHERE (CHEQUE_ID = :ID)';

  
  IQuery.Sql.Clear;
  IQuery.Sql.Add(Sql);

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];
    if Temp is TEdit then
      IQuery.ParamByName(TEdit(Temp).Name).AsString := TEdit(Temp).Text;

    if Temp is TMaskEdit then
      IQuery.ParamByName(TMaskEdit(Temp).Name).AsString := TMaskEdit(Temp).Text;

     if Temp is TDateEdit then
       if TDateEdit(Temp).Text <> '  /  /    ' then
       IQuery.ParamByName(TDateEdit(Temp).Name).AsDateTime := TDateEdit(Temp).Date;

    if Temp is TCurrencyEdit then
      IQuery.ParamByName(TCurrencyEdit(Temp).Name).AsFloat := TCurrencyEdit(Temp).Value;

    if Temp is TRxCalcEdit then
      IQuery.ParamByName(TRxCalcEdit(Temp).Name).AsFloat := TRxCalcEdit(Temp).Value;

    if Temp is TComboBox then
      IQuery.ParamByName(TComboBox(Temp).Name).AsString := TComboBox(Temp).Text;

     if Temp is TMemo then
      IQuery.ParamByName(TMemo(Temp).Name).AsByteStr := TMemo(Temp).Text;

    if Temp is TCheckBox then
    begin
      if TCheckBox(Temp).Checked then
        IQuery.ParamByName(TCheckBox(Temp).Name).AsString := 'True'
      else
        IQuery.ParamByName(TCheckBox(Temp).Name).AsString := 'False';
    end;


  end;

  IQuery.ParamByName('ID').AsInteger := QTabela.FieldByName('CHEQUE_ID').AsInteger;

  IQuery.Prepare;
  IQuery.ExecSql;

  QTabela.Close;
  QTabela.Open;
  QTabela.Locate('CHEQUE_ID', ID, [loCaseInsensitive]);
  Habilitar(False);
end;

procedure TFrmCheques_Recebidos.EMPRESA_IDExit(Sender: TObject);
begin
  DetailSearch('Empresa');
end;

procedure TFrmCheques_Recebidos.EMPRESA_IDKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = EMPRESA_ID) then
    btnEmpresaClick(Self);

  if (Key = Vk_F7) and (Sender = CLIENTE_ID) then
    btnClienteClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

function TFrmCheques_Recebidos.Validacao: Boolean;
var
Cpf_Valido, Cnpj_Valido: Boolean;
begin
  Result := False;
  
  CLIENTE_ID.Color := clWindow;
  EMPRESA_ID.Color := clWindow;
  VALOR.Color      := clWindow;
  CPF_CNPJ.Color   := clWindow;

  if QEmpresa.IsEmpty then
  begin
    Application.MessageBox('Empresa inexistente', PChar(Msg_Title), mb_IconStop);
    EMPRESA_ID.Color := clYellow;
    EMPRESA_ID.SetFocus;
    exit;
  end;

  if (CLIENTE_ID.Value > 0) and (QCliente.IsEmpty) then
  begin
    Application.MessageBox('Cliente inexistente', PChar(Msg_Title), mb_IconSTop);
    CLIENTE_ID.Color := clYellow;
    CLIENTE_ID.SetFocus;
    exit;
  end;

  if not ValidCpf(StrZero(CPF_CNPJ.Text, 11, 0)) then
    Cpf_Valido := False
  else
    Cpf_Valido := True;

  if not Cpf_Valido then
  begin
    if not ValidCgc(StrZero(CPF_CNPJ.Text, 14, 0)) then
      Cnpj_Valido := False
    else
      Cnpj_Valido := True;
  end;

  if (not Cpf_Valido) and (not Cnpj_Valido) then
  begin
    Application.MessageBox('Não é um CPF nem um CNPJ válido', PChar(Msg_Title), mb_IconStop);
    CPF_CNPJ.Color := clYellow;
    CPF_CNPJ.SetFocus;
    exit;
  end;

  if VALOR.Value <= 0 then
  begin
    Application.MessageBox('Valor inválido', PChar(Msg_Title), mb_IconStop);
    VALOR.Color := clYellow;
    VALOR.SetFocus;
    exit;
  end;

  if (Terceiros.Checked) AND (Nome_Ter.Text = '') then
  begin
    Application.MessageBox('Favor Informar nome do portador do cheque caso Cheque Terceiros marcado', PChar(Msg_Title), mb_IconStop);
    Nome_Ter.Color := clYellow;
    Nome_ter.SetFocus;
    exit;
  end;



  Result := True;
end;

procedure TFrmCheques_Recebidos.ManutencaoShow(Sender: TObject);
begin
  Set_Campos(False);
  Botoes_Normal;
end;

procedure TFrmCheques_Recebidos.Set_Campos(Vazio: Boolean);
var
I: Integer;
Temp: TComponent;
begin
  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];
    if Vazio then
    begin
      if Temp is TEdit then
        TEdit(Temp).Text := '';

      if Temp is TMaskEdit then
        TMaskEdit(Temp).Text := '';

      if Temp is TDateEdit then
        TDateEdit(Temp).Text := '';

      if Temp is TCurrencyEdit then
        TCurrencyEdit(Temp).Value := 0;

      if Temp is TRxCalcEdit then
        TRxCalcEdit(Temp).Value := 0;

      if Temp is TComboBox then
        TComboBox(Temp).Text := '';
    end
    else
    begin
      if Temp is TEdit then
        TEdit(Temp).Text := QTabela.FieldByName(TEdit(Temp).Name).AsString;

      if Temp is TMaskEdit then
        TMaskEdit(Temp).Text := QTabela.FieldByName(TMaskEdit(Temp).Name).AsString;

      if Temp is TDateEdit then
        TDateEdit(Temp).Text := QTabela.FieldByName(TDateEdit(Temp).Name).AsString;

      if Temp is TCurrencyEdit then
        TCurrencyEdit(Temp).Value := QTabela.FieldByName(TCurrencyEdit(Temp).Name).AsFloat;

      if Temp is TRxCalcEdit then
        TRxCalcEdit(Temp).Value := QTabela.FieldByName(TRxCalcEdit(Temp).Name).AsFloat;

      if Temp is TComboBox then
        TComboBox(Temp).Text := QTabela.FieldByName(TComboBox(Temp).Name).AsString;

      if Temp is TMemo then
        TMemo(Temp).Text := QTabela.FieldByName(TMemo(Temp).Name).AsString;
    end;
  end;
  DetailSearch('');
end;

procedure TFrmCheques_Recebidos.btnClienteClick(Sender: TObject);
begin
  try
    CLIENTE_ID.Value := GetConsulta('CLIENTES', 0, 0, StrToInt(CLIENTE_ID.Text));
  except
    CLIENTE_ID.Value := GetConsulta('CLIENTES', 0, 0, 0);
  end;
end;

procedure TFrmCheques_Recebidos.btnDeleteClick(Sender: TObject);
begin
  if FrmData.QAcesso.FieldByName('EXCLUSAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para exclusão', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  if QTabela.FieldByName('DT_MOVIMENTO').AsDateTime < FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime then
  begin
    Application.MessageBox('Movimento já encerrado', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  if Application.MessageBox('Deseja realmente excluir?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = IDYES then
  begin

    IQuery.Sql.Clear;
    IQuery.Sql.Add('DELETE FROM CHEQUES_RECEBIDOS');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(CHEQUE_ID = :ID)');
    IQuery.ParamByName('ID').AsInteger := QTabela.FieldByName('CHEQUE_ID').AsInteger;
    IQuery.Prepare;
    IQuery.ExecSql;


    QTabela.Close;
    QTabela.Open;
    Set_Campos(False);
    Botoes_Normal;

  end;

  if QTabela.IsEmpty then
  begin
    QEmpresa.Close;
    QCliente.Close;
  end;
end;

procedure TFrmCheques_Recebidos.btnDiscardClick(Sender: TObject);
begin
  Botoes_Normal;
  Set_Campos(False);

  if QTabela.IsEmpty then
  begin
    QEmpresa.Close;
    QCliente.Close;
  end;

  Habilitar(False);
  Operacao := '';
  Consulta.TabVisible := True;
end;

procedure TFrmCheques_Recebidos.btnEditClick(Sender: TObject);
begin
  if FrmData.QAcesso.FieldByName('ALTERACAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para alteração', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  if QTabela.FieldByName('DT_MOVIMENTO').AsDateTime < FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime then
  begin
    Application.MessageBox('Movimento já encerrado', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  Operacao := 'Alterando';
  ID       := QTabela.FieldByName('CHEQUE_ID').AsInteger;

  Botoes_Editing;
  Habilitar(True);

  Consulta.TabVisible := False;
  
  DT_CHEQUE.SetFocus;
end;

procedure TFrmCheques_Recebidos.btnEmpresaClick(Sender: TObject);
begin
  try
    EMPRESA_ID.Value := GetConsulta('EMPRESAS', 0, 0, StrToInt(EMPRESA_ID.Text));
  except
    EMPRESA_ID.Value := GetConsulta('EMPRESAS', 0, 0, 0);
  end;
end;

procedure TFrmCheques_Recebidos.btnInsertClick(Sender: TObject);
begin
  if FrmData.QAcesso.FieldByName('INCLUSAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para inclusão', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  Operacao := 'Inserindo';
  Botoes_Editing;
  Set_Campos(True);
  Habilitar(True);
  Nome_Ter.Enabled   := False;
  Observacao.Enabled := False;

  QEmpresa.Close;
  QCliente.Close;

  DT_CHEQUE.Date    := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
  DT_MOVIMENTO.Date := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
  EMPRESA_ID.Value  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  AUTORIZ_ID.Value  := FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger;
  LIQUIDADO.Text    := 'NÃO';

  Consulta.TabVisible := False;
  
  DT_CHEQUE.SetFocus;
end;

procedure TFrmCheques_Recebidos.btnNextClick(Sender: TObject);
begin
  if not QTabela.Eof then
  begin
    QTabela.Next;
    Set_Campos(False);
  end;

  Botoes_Normal;
end;

procedure TFrmCheques_Recebidos.btnPesquisaClick(Sender: TObject);
var
Condicao: String;
begin
  Condicao := GetPesquisa('CHEQUES RECEBIDOS');

  if Condicao <> '' then
  begin
    CmdSelectNull := Condicao + ' AND (EMPRESA_ID = :EMPRESA_ID)';
    
    QTabela.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  end;

  CmdOrderBy := 'ORDER BY CHEQUE_ID';

  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

  QTabela.Prepare;
  QTabela.Open;

  Set_Campos(False);
  Botoes_Normal;
end;

procedure TFrmCheques_Recebidos.btnPriorClick(Sender: TObject);
begin
  if not QTabela.Bof then
  begin
    QTabela.Prior;
    Set_Campos(False);
  end;

  Botoes_Normal;
end;

procedure TFrmCheques_Recebidos.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCheques_Recebidos.btnSaveClick(Sender: TObject);
begin
  DetailSearch('');

  if Validacao then
  begin

    if Operacao = 'Inserindo' then
    begin
      Insert;
      if Bloqueado.Text = 'SIM' then
      Begin
      IQuery.SQL.Clear;
      IQuery.SQL.Add('UPDATE CLIENTES SET BLOQ_CHEQUE = :BLOQ_CHEQUE WHERE CLIENTE_ID = :CLIENTE_ID');
      IQuery.ParamByName('BLOQ_CHEQUE').AsString := Bloqueado.Text;
      IQuery.ParamByName('CLIENTE_ID').AsInteger := StrToInt(Cliente_id.Text);
      IQuery.Prepare;
      IQuery.ExecSQL;

      End
      Else
      Begin
      IQuery2.SQL.Clear;
      IQuery2.SQL.Add('SELECT * FROM CHEQUES_RECEBIDOS ');
      IQuery2.SQL.Add('WHERE CLIENTE_ID = :CLIENTE_ID AND BLOQUEADO = :BLOQUEADO ');
      IQuery2.ParamByName('CLIENTE_ID').AsInteger := StrToInt(Cliente_id.Text);
      IQuery2.ParamByName('BLOQUEADO').AsString     := 'SIM';
      IQuery2.Prepare;
      IQuery2.Open;

      if IQuery2.IsEmpty then
        Begin
           IQuery.SQL.Clear;
           IQuery.SQL.Add('UPDATE CLIENTES SET BLOQ_CHEQUE = :BLOQ_CHEQUE WHERE CLIENTE_ID = :CLIENTE_ID');
           IQuery.ParamByName('BLOQ_CHEQUE').AsString := Bloqueado.Text;
           IQuery.ParamByName('CLIENTE_ID').AsInteger := StrToInt(Cliente_id.Text);
           IQuery.Prepare;
           IQuery.ExecSQL;

        End;
      End;

      CmdOrderBy := 'ORDER BY CHEQUE_ID';

      QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

      QTabela.Open;
      QTabela.Last;
    end
    else
      Edit;
      if Bloqueado.Text = 'SIM' then
      Begin
      IQuery.SQL.Clear;
      IQuery.SQL.Add('UPDATE CLIENTES SET BLOQ_CHEQUE = :BLOQ_CHEQUE WHERE CLIENTE_ID = :CLIENTE_ID');
      IQuery.ParamByName('BLOQ_CHEQUE').AsString := Bloqueado.Text;
      IQuery.ParamByName('CLIENTE_ID').AsInteger := StrToInt(Cliente_id.Text);
      IQuery.Prepare;
      IQuery.ExecSQL;

      End
      Else
      Begin
      IQuery2.SQL.Clear;
      IQuery2.SQL.Add('SELECT * FROM CHEQUES_RECEBIDOS ');
      IQuery2.SQL.Add('WHERE CLIENTE_ID = :CLIENTE_ID AND BLOQUEADO = :BLOQUEADO ');
      IQuery2.ParamByName('CLIENTE_ID').AsInteger := StrToInt(Cliente_id.Text);
      IQuery2.ParamByName('BLOQUEADO').AsString     := 'SIM';
      IQuery2.Prepare;
      IQuery2.Open;

      if IQuery2.IsEmpty then
        Begin
           IQuery.SQL.Clear;
           IQuery.SQL.Add('UPDATE CLIENTES SET BLOQ_CHEQUE = :BLOQ_CHEQUE WHERE CLIENTE_ID = :CLIENTE_ID');
           IQuery.ParamByName('BLOQ_CHEQUE').AsString := Bloqueado.Text;
           IQuery.ParamByName('CLIENTE_ID').AsInteger := StrToInt(Cliente_id.Text);
           IQuery.Prepare;
           IQuery.ExecSQL;

        End;
      End;

    Set_Campos(False);

    if QTabela.IsEmpty then
    begin
      QEmpresa.Close;
      QCliente.Close;
    end;

    Habilitar(False);
    Botoes_Normal;

    Operacao := '';
    Consulta.TabVisible := True;

    if (not QTabela.IsEmpty) and (FrmPrincipal.QEmpresa.FieldByName('CARGA').AsString = 'SIM') then
    Carga_PDV_Off_Line(0, QTabela.FieldByName('CLIENTE_ID').AsInteger);
  end;
end;

procedure TFrmCheques_Recebidos.DBGrid1DblClick(Sender: TObject);
begin
  Manutencao.Show;
end;

procedure TFrmCheques_Recebidos.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Manutencao.Show;
end;

procedure TFrmCheques_Recebidos.DBGrid1TitleClick(Column: TColumn);
begin
  CmdOrderBy := 'ORDER BY ' + Column.FieldName;
  
  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;
  QTabela.Open;
end;

procedure TFrmCheques_Recebidos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmCheques_Recebidos.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (Operacao = 'Inserindo') or (Operacao = 'Alterando') then
  begin
    Application.MessageBox('É melhor salvar as alterações antes de continuar', PChar(Msg_Title), mb_IconStop);
    CanClose := False;
  end;
end;

procedure TFrmCheques_Recebidos.FormCreate(Sender: TObject);
var
X, Ult_Dia: Integer;
begin
  DBGrid1.Columns[0].Width := 76;
  DBGrid1.Columns[1].Width := 77;
  DBGrid1.Columns[2].Width := 78;
  DBGrid1.Columns[3].Width := 72;
  DBGrid1.Columns[4].Width := 73;
  DBGrid1.Columns[5].Width := 220;
  DBGrid1.Columns[6].Width := 72;
  DBGrid1.Columns[7].Width := 72;

  Ult_Dia := StrToInt(Copy(DateToStr(Ult_Dia_Mes(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime)), 1, 2));
  Dias.Tabs.Clear;

  for X := 1 to Ult_Dia do
    Dias.Tabs.Add(IntToStr(X));

  Dias.Tabs.Add('Todos');

  DT_MOVIMENTO.MinDate := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
  DT_MOVIMENTO.MaxDate := StrToDate('31/12/2026');

  CmdSelect        := QTabela.Sql.Text;
  CmdSelectNull    := 'WHERE (CHEQUE_ID IS NOT NULL) AND (EMPRESA_ID = :EMPRESA_ID) AND ((LIQUIDADO = :LIQUIDADO) OR (LIQUIDADO IS NULL))';
  CmdOrderBy       := 'ORDER BY CHEQUE_ID';
  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

  //QTabela.ParamByName('DT_MOVIMENTO').AsDateTime := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
  QTabela.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  QTabela.ParamByName('LIQUIDADO').AsString      := 'NÃO';
  QTabela.Open;

  Botoes_Normal;
  Consulta.Show;
end;

procedure TFrmCheques_Recebidos.FormShow(Sender: TObject);
begin
  DBGrid1.SetFocus;
end;

end.
