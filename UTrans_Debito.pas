unit UTrans_Debito;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ComCtrls, ToolWin, StdCtrls, Grids, DBGrids, Tabs, ExtCtrls,
  DB, IBCustomDataSet, IBQuery, Mask, Buttons, DBCtrls, rxCurrEdit, rxToolEdit,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmTrans_Debito = class(TForm)
    PageControl1: TPageControl;
    Panel1: TPanel;
    Consulta: TTabSheet;
    Manutencao: TTabSheet;
    DBGrid1: TDBGrid;
    btnRetorna: TBitBtn;
    Panel2: TPanel;
    btnPrior: TBitBtn;
    btnNext: TBitBtn;
    btnInsert: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    btnSave: TBitBtn;
    btnDiscard: TBitBtn;
    BALANCO: TComboBox;
    Label2: TLabel;
    Label9: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label18: TLabel;
    Label11: TLabel;
    EMPRESA_ID: TCurrencyEdit;
    FORNECEDOR_ID: TCurrencyEdit;
    CONTA_ID: TCurrencyEdit;
    HISTORICO: TEdit;
    NUM_DOC: TEdit;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    CONDUTA: TEdit;
    DEPTO: TEdit;
    TPCTB: TEdit;
    Label12: TLabel;
    BANCO_ID: TCurrencyEdit;
    DBText4: TDBText;
    Label1: TLabel;
    C_CUSTO_ID: TCurrencyEdit;
    DBText5: TDBText;
    Label13: TLabel;
    NUM_CHEQUE: TEdit;
    btnEmpresa: TSpeedButton;
    btnFornecedor: TSpeedButton;
    btnConta: TSpeedButton;
    btnBanco: TSpeedButton;
    btnCentro_Custo: TSpeedButton;
    VALOR: TRxCalcEdit;
    Dias: TTabSet;
    AUTORIZ_ID: TCurrencyEdit;
    Label16: TLabel;
    COND_PAGTO: TComboBox;
    btnParcelas: TSpeedButton;
    btnPesquisa: TBitBtn;
    Label8: TLabel;
    FLUXO_CAIXA_ID: TCurrencyEdit;
    btnFluxoCaixa: TSpeedButton;
    DBText6: TDBText;
    SERIE: TEdit;
    MODELO: TEdit;
    Label10: TLabel;
    CFOP: TEdit;
    btnCFOP: TSpeedButton;
    PageControl2: TPageControl;
    TabSheet1: TTabSheet;
    Label15: TLabel;
    CST_ICMS: TEdit;
    ALIQUOTA_ICMS: TRxCalcEdit;
    Label23: TLabel;
    VR_ICMS_NORMAL: TRxCalcEdit;
    Label24: TLabel;
    BASE_CALC_PIS: TRxCalcEdit;
    Label25: TLabel;
    CST_PIS: TEdit;
    ALIQUOTA_PIS: TRxCalcEdit;
    Label26: TLabel;
    VR_PIS: TRxCalcEdit;
    Label28: TLabel;
    BASE_CALC_COFINS: TRxCalcEdit;
    Label27: TLabel;
    CST_COFINS: TEdit;
    ALIQUOTA_COFINS: TRxCalcEdit;
    Label29: TLabel;
    VR_COFINS: TRxCalcEdit;
    Label19: TLabel;
    VALOR_OUTROS: TRxCalcEdit;
    Label17: TLabel;
    VALOR_ISENTO: TRxCalcEdit;
    Label14: TLabel;
    BASE_ICMS_NORMAL: TRxCalcEdit;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label34: TLabel;
    VENDEDOR_ID: TCurrencyEdit;
    btnVendedor: TSpeedButton;
    DBText8: TDBText;
    TabSheet2: TTabSheet;
    Label20: TLabel;
    PATRIMONIO_ID: TCurrencyEdit;
    btnPatrimonio: TSpeedButton;
    DBText7: TDBText;
    Label21: TLabel;
    ODOMETRO: TRxCalcEdit;
    Label22: TLabel;
    QUANTIDADE: TRxCalcEdit;
    btnCst_Pis: TSpeedButton;
    btnCst_Cofins: TSpeedButton;
    btnCst_Icms: TSpeedButton;
    Label35: TLabel;
    CHAVE_NFE: TEdit;
    QVendedor: TFDQuery;
    DataVendedor: TDataSource;
    QPatrimonio: TFDQuery;
    DataPatrimonio: TDataSource;
    QFluxo_Caixa: TFDQuery;
    DataFluxo_Caixa: TDataSource;
    QTabela: TFDQuery;
    DataTabela: TDataSource;
    IQuery: TFDQuery;
    QEmpresa: TFDQuery;
    DataEmpresa: TDataSource;
    QBanco: TFDQuery;
    DataBanco: TDataSource;
    QFornecedor: TFDQuery;
    DataCliente: TDataSource;
    QConta: TFDQuery;
    DataConta: TDataSource;
    QCusto: TFDQuery;
    DataCusto: TDataSource;
    QLimite: TFDQuery;
    QCfop: TFDQuery;
    Btn_Cheque: TSpeedButton;
    DT_TRANS: TDateEdit;
    Label7: TLabel;
    DT_ENT_SAI: TDateEdit;
    Label33: TLabel;
    DT_MOVIMENTO: TDateEdit;
    Label40: TLabel;
    DT_SPED: TDateEdit;
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
    procedure FORNECEDOR_IDExit(Sender: TObject);
    procedure EMPRESA_IDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BANCO_IDExit(Sender: TObject);
    procedure btnEmpresaClick(Sender: TObject);
    procedure btnFornecedorClick(Sender: TObject);
    procedure btnContaClick(Sender: TObject);
    procedure btnBancoClick(Sender: TObject);
    procedure btnCentro_CustoClick(Sender: TObject);
    procedure CONTA_IDExit(Sender: TObject);
    procedure C_CUSTO_IDExit(Sender: TObject);
    procedure DiasClick(Sender: TObject);
    procedure btnParcelasClick(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DT_TRANSKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FLUXO_CAIXA_IDExit(Sender: TObject);
    procedure btnFluxoCaixaClick(Sender: TObject);
    procedure CFOPExit(Sender: TObject);
    procedure btnCFOPClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DT_TRANSEnter(Sender: TObject);
    procedure PATRIMONIO_IDExit(Sender: TObject);
    procedure btnPatrimonioClick(Sender: TObject);
    procedure CST_PISChange(Sender: TObject);
    procedure CST_COFINSChange(Sender: TObject);
    procedure VENDEDOR_IDExit(Sender: TObject);
    procedure btnVendedorClick(Sender: TObject);
    procedure btnCst_IcmsClick(Sender: TObject);
    procedure btnCst_PisClick(Sender: TObject);
    procedure btnCst_CofinsClick(Sender: TObject);
    procedure BASE_CALC_PISExit(Sender: TObject);
    procedure BASE_CALC_COFINSExit(Sender: TObject);
    procedure Btn_ChequeClick(Sender: TObject);
    procedure QTabelaAfterOpen(DataSet: TDataSet);
    procedure NUM_DOCKeyPress(Sender: TObject; var Key: Char);
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
  FrmTrans_Debito: TFrmTrans_Debito;
  Operacao,Liquidado: String;
  ID: Integer;
  Vl_Trans_Cheque,Vl_Cheque :Real;

implementation

uses
  UPrincipal, UData, UConsulta, UParcelas, UPesquisa, UConsulta_CFOP, UConsulta_CST;

{$R *.dfm}

procedure TFrmTrans_Debito.FORNECEDOR_IDExit(Sender: TObject);
begin
  DetailSearch('Fornecedor');
end;

procedure TFrmTrans_Debito.CFOPExit(Sender: TObject);
begin
  DetailSearch('CFOP');
end;

procedure TFrmTrans_Debito.CONTA_IDExit(Sender: TObject);
begin
  DetailSearch('Conta');
end;

procedure TFrmTrans_Debito.CST_COFINSChange(Sender: TObject);
begin
  CST_PIS.Text := CST_COFINS.Text;
end;

procedure TFrmTrans_Debito.CST_PISChange(Sender: TObject);
begin
  CST_COFINS.Text := CST_PIS.Text;
end;

procedure TFrmTrans_Debito.C_CUSTO_IDExit(Sender: TObject);
begin
  DetailSearch('C. Custo');
end;

procedure TFrmTrans_Debito.BANCO_IDExit(Sender: TObject);
begin
  DetailSearch('Banco');
end;

procedure TFrmTrans_Debito.BASE_CALC_COFINSExit(Sender: TObject);
begin
Base_Calc_pis.Value := Base_Calc_Cofins.Value;
end;

procedure TFrmTrans_Debito.BASE_CALC_PISExit(Sender: TObject);
begin
Base_Calc_Cofins.Value := Base_calc_pis.Value;
end;

procedure TFrmTrans_Debito.Botoes_Editing;
begin
  btnPrior.Enabled        := False;
  btnNext.Enabled         := False;
  btnInsert.Enabled       := False;
  btnEdit.Enabled         := False;
  btnDelete.Enabled       := False;
  btnSave.Enabled         := True;
  btnDiscard.Enabled      := True;
  btnRetorna.Enabled      := False;
  btnEmpresa.Enabled      := True;
  btnFornecedor.Enabled   := True;
  btnConta.Enabled        := True;
  btnBanco.Enabled        := True;
  btnCentro_Custo.Enabled := True;
  btnPatrimonio.Enabled   := True;
  btnParcelas.Enabled     := False;
  btnPesquisa.Enabled     := False;
  btnFluxoCaixa.Enabled   := True;
  btnCFOP.Enabled         := True;
  btnVendedor.Enabled     := True;
  btnCst_Icms.Enabled     := True;
  btnCst_Pis.Enabled      := True;
  btnCst_Cofins.Enabled   := True;
end;

procedure TFrmTrans_Debito.Botoes_Normal;
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
    btnEdit.Enabled   := True;
    btnDelete.Enabled := True;
  end
  else
  begin
    btnEdit.Enabled   := False;
    btnDelete.Enabled := False;
  end;

  if QTabela.FieldByName('COND_PAGTO').AsString = 'A PRAZO' then
    btnParcelas.Enabled := True
  else
    btnParcelas.Enabled := False;

  btnSave.Enabled         := False;
  btnDiscard.Enabled      := False;
  btnRetorna.Enabled      := True;
  btnEmpresa.Enabled      := False;
  btnFornecedor.Enabled   := False;
  btnConta.Enabled        := False;
  btnBanco.Enabled        := False;
  btnCentro_Custo.Enabled := False;
  btnPatrimonio.Enabled   := False;
  btnPesquisa.Enabled     := True;
  btnBanco.Enabled        := False;
  btnCFOP.Enabled         := False;
  btnFluxoCaixa.Enabled   := False;
  btnVendedor.Enabled     := False;
  btnCst_Icms.Enabled     := False;
  btnCst_Pis.Enabled      := False;
  btnCst_Cofins.Enabled   := False;
end;

procedure TFrmTrans_Debito.DetailSearch(Tabela: String);
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
    QBanco.ParamByName('EMPRESA_ID').AsInteger := StrToInt(EMPRESA_ID.Text);

    QBanco.Prepare;
    QBanco.Open;
  end;

  if ((Tabela = '') or (Tabela = 'Fornecedor')) and (FORNECEDOR_ID.Text <> '') then
  begin
    QFornecedor.Close;

    QFornecedor.ParamByName('FORNECEDOR_ID').AsInteger := StrToInt(FORNECEDOR_ID.Text);

    QFornecedor.Prepare;
    QFornecedor.Open;
  end;

  if ((Tabela = '') or (Tabela = 'CFOP')) and (CFOP.Text <> '') then
  begin
    QCFOP.Close;

    QCFOP.ParamByName('COD_CFOP').AsString := CFOP.Text;

    QCFOP.Prepare;
    QCFOP.Open;
  end;

  if ((Tabela = '') or (Tabela = 'Conta')) and (CONTA_ID.Text <> '') then
  begin
    QConta.Close;

    QConta.ParamByName('TABELA_ID').AsInteger := StrToInt(CONTA_ID.Text);

    QConta.Prepare;
    QConta.Open;
  end;

  if ((Tabela = '') or (Tabela = 'C. Custo')) and (C_CUSTO_ID.Text <> '') then
  begin
    QCusto.Close;

    QCusto.ParamByName('TABELA_ID').AsInteger := StrToInt(C_CUSTO_ID.Text);

    QCusto.Prepare;
    QCusto.Open;
  end;

  if ((Tabela = '') or (Tabela = 'Patrimônio')) and (PATRIMONIO_ID.Text <> '') then
  begin
    QPatrimonio.Close;

    QPatrimonio.ParamByName('PATRIMONIO_ID').AsInteger := StrToInt(PATRIMONIO_ID.Text);

    QPatrimonio.Prepare;
    QPatrimonio.Open;
  end;

  if ((Tabela = '') or (Tabela = 'Fluxo Caixa')) and (FLUXO_CAIXA_ID.Text <> '') then
  begin
    QFluxo_Caixa.Close;

    QFluxo_Caixa.ParamByName('FLUXO_CAIXA_ID').AsInteger := StrToInt(FLUXO_CAIXA_ID.Text);

    QFluxo_Caixa.Prepare;
    QFluxo_Caixa.Open;
  end;

  if ((Tabela = '') or (Tabela = 'Vendedor')) and (VENDEDOR_ID.Text <> '') then
  begin
    QVendedor.Close;
    QVendedor.ParamByName('FUNCIONARIO_ID').AsInteger := StrToInt(VENDEDOR_ID.Text);
    QVendedor.Prepare;
    QVendedor.Open;
  end;
end;

procedure TFrmTrans_Debito.DiasClick(Sender: TObject);
begin
  if Dias.TabIndex <> (Dias.Tabs.Count - 1) then
  begin
    CmdSelectNull := 'WHERE (TRANSACAO_ID IS NOT NULL) AND (DT_MOVIMENTO = :DT_MOVIMENTO) AND (CONDUTA = :CONDUTA) AND (DEPTO = :DEPTO) AND (TPCTB = :TPCTB) AND (EMPRESA_ID = :EMPRESA_ID)';
    CmdOrderBy    := 'ORDER BY TRANSACAO_ID';

    QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

    QTabela.ParamByName('DT_MOVIMENTO').AsDateTime := StrToDate(StrZero(IntToStr(Dias.TabIndex + 1), 2, 0) + '/' + Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 4, 7));
    QTabela.ParamByName('CONDUTA').AsString        := '02';
    QTabela.ParamByName('DEPTO').AsString          := '02';
    QTabela.ParamByName('TPCTB').AsString          := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    QTabela.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  end
  else
  begin
    CmdSelectNull := 'WHERE (TRANSACAO_ID IS NOT NULL) AND (DT_MOVIMENTO <= :DT_MOVIMENTO) AND (CONDUTA = :CONDUTA) AND (DEPTO = :DEPTO) AND (TPCTB = :TPCTB) AND (EMPRESA_ID = :EMPRESA_ID)';
    CmdOrderBy    := 'ORDER BY TRANSACAO_ID';

    QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

    QTabela.ParamByName('DT_MOVIMENTO').AsDateTime := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
    QTabela.ParamByName('CONDUTA').AsString        := '02';
    QTabela.ParamByName('DEPTO').AsString          := '02';
    QTabela.ParamByName('TPCTB').AsString          := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    QTabela.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  end;

  QTabela.Prepare;
  QTabela.Open;
end;

procedure TFrmTrans_Debito.DT_TRANSEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmTrans_Debito.DT_TRANSKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = CFOP) then
    btnCFOPClick(Self);

  if (Key = VK_F7) and (Sender = MODELO) then
    MODELO.Text := GetConsulta_CST('MODELO_DOC', MODELO.Text);

  if (Key = VK_F7) and (Sender = CST_ICMS) then
    btnCst_IcmsClick(Self);

  if (Key = VK_F7) and (Sender = CST_PIS) then
    btnCst_PisClick(Self);

  if (Key = VK_F7) and (Sender = CST_COFINS) then
    btnCst_CofinsClick(Self);

  if (Key = Vk_Return) or (Key = Vk_Down) then
   // Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmTrans_Debito.Habilitar(Status: Boolean);
var
I: Integer;
Temp: TComponent;
begin
  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
      TEdit(Temp).Enabled := Status;

    if Temp is TDateEdit then
      TDateEdit(Temp).Enabled := Status;

    if Temp is TComboBox then
      TComboBox(Temp).Enabled := Status;

    if Temp is TCurrencyEdit then
      TCurrencyEdit(Temp).Enabled := Status;

    if Temp is TRxCalcEdit then
      TRxcalcEdit(Temp).Enabled := Status;
  end;
end;

procedure TFrmTrans_Debito.Insert;
var
I: Integer;
Temp: TComponent;
Sql, Par: String;
begin
  Sql := 'INSERT INTO TRANSACOES(';
  Par := '';

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
    begin
      if Sql = 'INSERT INTO TRANSACOES(' then
        Sql := Sql + TEdit(Temp).Name
      else
        Sql := Sql + ', ' + TEdit(Temp).Name;

      if Par = '' then
        Par := Par + ':' + TEdit(Temp).Name
      else
        Par := Par + ', :' + TEdit(Temp).Name;
    end;

    if Temp is TDateEdit then
    begin
      if Sql = 'INSERT INTO TRANSACOES(' then
        Sql := Sql + TDateEdit(Temp).Name
      else
        Sql := Sql + ', ' + TDateEdit(Temp).Name;

      if Par = '' then
        Par := Par + ':' + TDateEdit(Temp).Name
      else
        Par := Par + ', :' + TDateEdit(Temp).Name;
    end;

    if Temp is TComboBox then
    begin
      if Sql = 'INSERT INTO TRANSACOES(' then
        Sql := Sql + TComboBox(Temp).Name
      else
        Sql := Sql + ', ' + TComboBox(Temp).Name;

      if Par = '' then
        Par := Par + ':' + TComboBox(Temp).Name
      else
        Par := Par + ', :' + TComboBox(Temp).Name;
    end;

    if Temp is TCurrencyEdit then
    begin
      if Sql = 'INSERT INTO TRANSACOES(' then
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
      if Sql = 'INSERT INTO TRANSACOES(' then
        Sql := Sql + TRxCalcEdit(Temp).Name
      else
        Sql := Sql + ', ' + TRxCalcEdit(Temp).Name;

      if Par = '' then
        Par := Par + ':' + TRxCalcEdit(Temp).Name
      else
        Par := Par + ', :' + TRxCalcEdit(Temp).Name;
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

    if Temp is TDateEdit then
      IQuery.ParamByName(TDateEdit(Temp).Name).AsDateTime := TDateEdit(Temp).Date;

    if Temp is TComboBox then
      IQuery.ParamByName(TComboBox(Temp).Name).AsString := TComboBox(Temp).Text;

    if Temp is TCurrencyEdit then
      IQuery.ParamByName(TCurrencyEdit(Temp).Name).AsFloat := TCurrencyEdit(Temp).Value;

    if Temp is TRxCalcEdit then
      IQuery.ParamByName(TRxCalcEdit(Temp).Name).AsFloat := TRxCalcEdit(Temp).Value;
  end;

  IQuery.Prepare;
  IQuery.ExecSql;



  Habilitar(False);
end;

procedure TFrmTrans_Debito.Edit;
var
I: Integer;
Temp: TComponent;
Sql: String;
begin
  Sql := 'UPDATE TRANSACOES SET ';

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
    begin
      if Sql = 'UPDATE TRANSACOES SET ' then
        Sql := Sql + TEdit(Temp).Name + ' = :' + TEdit(Temp).Name
      else
        Sql := Sql + ', ' + TEdit(Temp).Name + ' = :' + TEdit(Temp).Name;
    end;

    if Temp is TDateEdit then
    begin
      if Sql = 'UPDATE TRANSACOES SET ' then
        Sql := Sql + TDateEdit(Temp).Name + ' = :' + TDateEdit(Temp).Name
      else
        Sql := Sql + ', ' + TDateEdit(Temp).Name + ' = :' + TDateEdit(Temp).Name;
    end;

    if Temp is TComboBox then
    begin
      if Sql = 'UPDATE TRANSACOES SET ' then
        Sql := Sql + TComboBox(Temp).Name + ' = :' + TComboBox(Temp).Name
      else
        Sql := Sql + ', ' + TComboBox(Temp).Name + ' = :' + TComboBox(Temp).Name;
    end;

    if Temp is TCurrencyEdit then
    begin
      if Sql = 'UPDATE TRANSACOES SET ' then
        Sql := Sql + TCurrencyEdit(Temp).Name + ' = :' + TCurrencyEdit(Temp).Name
      else
        Sql := Sql + ', ' + TCurrencyEdit(Temp).Name + ' = :' + TCurrencyEdit(Temp).Name;
    end;

    if Temp is TRxCalcEdit then
    begin
      if Sql = 'UPDATE TRANSACOES SET ' then
        Sql := Sql + TRxCalcEdit(Temp).Name + ' = :' + TRxCalcEdit(Temp).Name
      else
        Sql := Sql + ', ' + TRxCalcEdit(Temp).Name + ' = :' + TRxCalcEdit(Temp).Name;
    end;
  end;

  Sql := Sql + ' WHERE (TRANSACAO_ID = :ID)';

  

  IQuery.Sql.Clear;
  IQuery.Sql.Add(Sql);

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
      IQuery.ParamByName(TEdit(Temp).Name).AsString := TEdit(Temp).Text;

    if Temp is TDateEdit then
      IQuery.ParamByName(TDateEdit(Temp).Name).AsDateTime := TDateEdit(Temp).Date;

    if Temp is TComboBox then
      IQuery.ParamByName(TComboBox(Temp).Name).AsString := TComboBox(Temp).Text;

    if Temp is TCurrencyEdit then
      IQuery.ParamByName(TCurrencyEdit(Temp).Name).AsFloat := TCurrencyEdit(Temp).Value;

    if Temp is TRxCalcEdit then
      IQuery.ParamByName(TRxcalcEdit(Temp).Name).AsFloat := TRxCalcEdit(Temp).Value;
  end;

  IQuery.ParamByName('ID').AsInteger := QTabela.FieldByName('TRANSACAO_ID').AsInteger;

  IQuery.Prepare;
  IQuery.ExecSql;



  QTabela.Close;

  QTabela.Prepare;
  QTabela.Open;

  QTabela.Locate('TRANSACAO_ID', ID, [loCaseInsensitive]);

  Habilitar(False);
end;

procedure TFrmTrans_Debito.EMPRESA_IDExit(Sender: TObject);
begin
  DetailSearch('Empresa');
end;

procedure TFrmTrans_Debito.EMPRESA_IDKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = EMPRESA_ID) then
    btnEmpresaClick(Self);

  if (Key = Vk_F7) and (Sender = FORNECEDOR_ID) then
    btnFornecedorClick(Self);

  if (Key = Vk_F7) and (Sender = CONTA_ID) then
    btnContaClick(Self);

  if (Key = Vk_F7) and (Sender = BANCO_ID) then
    btnBancoClick(Self);

  if (Key = Vk_F7) and (Sender = C_CUSTO_ID) then
    btnCentro_CustoClick(Self);

  if (Key = Vk_F7) and (Sender = PATRIMONIO_ID) then
    btnPatrimonioClick(Self);

  if (Key = Vk_F7) and (Sender = VENDEDOR_ID) then
    btnVendedorClick(Self);

  if (Key = Vk_F7) and (Sender = FLUXO_CAIXA_ID) then
    btnFluxoCaixaClick(Self);

   if (Key = Vk_F7) and (Sender = NUM_CHEQUE) then
    Btn_ChequeClick(SELF);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

function TFrmTrans_Debito.Validacao: Boolean;

var
  LISTA_MODELO_NOTAS: TStringList;

begin
  Result := False;

  BANCO_ID.Color         := clWindow;
  FORNECEDOR_ID.Color    := clWindow;
  EMPRESA_ID.Color       := clWindow;
  CONTA_ID.Color         := clWindow;
  C_CUSTO_ID.Color       := clWindow;
  VALOR.Color            := clWindow;
  COND_PAGTO.Color       := clWindow;
  FLUXO_CAIXA_ID.Color   := clWindow;
  CFOP.Color             := clWindow;
  BASE_ICMS_NORMAL.Color := clWindow;
  VR_ICMS_NORMAL.Color   := clWindow;
  MODELO.Color           := clWindow;
  CST_ICMS.Color         := clWindow;
  CST_PIS.Color          := clWindow;
  CST_COFINS.Color       := clWindow;
  DT_TRANS.Color         := clWindow;
  VENDEDOR_ID.Color      := clWindow;
  BALANCO.Color          := clWindow;
  NUM_CHEQUE.Color       := clWindow;

  LISTA_MODELO_NOTAS := TStringList.Create;
  LISTA_MODELO_NOTAS.Append('55');
  LISTA_MODELO_NOTAS.Append('99');
  LISTA_MODELO_NOTAS.Append('01');
  LISTA_MODELO_NOTAS.Append('02');
  LISTA_MODELO_NOTAS.Append('04');
  LISTA_MODELO_NOTAS.Append('1B');

  Vl_Cheque       := 0;
  Vl_Trans_Cheque := 0;
  Liquidado       := '';

  if (DT_TRANS.Date <= FrmPrincipal.QEmpresa.FieldByName('DT_ULT_FOLHA').AsDateTime) OR
     (DT_ENT_SAI.Date <= FrmPrincipal.QEmpresa.FieldByName('DT_ULT_FOLHA').AsDateTime) then
  begin
    Application.MessageBox('Data inválida. Movimento já encerrado', PChar(Msg_Title), mb_IconStop);
    DT_TRANS.Color := clYellow;
    DT_TRANS.SetFocus;
    exit;
  end;

  if MODELO.Text <> '' then
  begin
    IQuery.Sql.Clear;
    IQuery.Sql.Add('SELECT * FROM MODELO_DOC');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(CODIGO = :CODIGO)');

    IQuery.ParamByName('CODIGO').AsString := MODELO.Text;

    IQuery.Prepare;
    IQuery.Open;

    if IQuery.IsEmpty then
    begin
      Application.MessageBox('Modelo de Documento inválido', PChar(Msg_Title), mb_IconStop);
      MODELO.Color := clYellow;
      MODELO.SetFocus;
      exit;
    end;
  end;

  if (CFOP.Text <> '') and (QCFOP.IsEmpty) then
  begin
    Application.MessageBox('CFOP inexistente', PChar(Msg_Title), mb_IconStop);
    CFOP.Color := clYellow;
    CFOP.SetFocus;
    exit;
  end;

  if CFOP.Text <> '' then
  begin
    if QFornecedor.IsEmpty then
    begin
      if (Copy(CFOP.Text, 1, 1) <> '1') and (Copy(CFOP.Text, 1, 1) <> '2') and (Copy(CFOP.Text, 1, 1) <> '3') then
      begin
        Application.MessageBox('CFOP inválido', PChar(Msg_Title), mb_IconStop);
        CFOP.Color := clYellow;
        CFOP.SetFocus;
        exit;
      end;
    end
    else
    begin
      if (QFornecedor.FieldByName('ESTADO').AsString = FrmPrincipal.QEmpresa.FieldByName('ESTADO').AsString) and (Copy(CFOP.Text, 1, 1) <> '1') then
      begin
        Application.MessageBox('CFOP inválido', PChar(Msg_Title), mb_IconStop);
        CFOP.Color := clYellow;
        CFOP.SetFocus;
        exit;
      end;

      if (QFornecedor.FieldByName('ESTADO').AsString <> FrmPrincipal.QEmpresa.FieldByName('ESTADO').AsString) and (Copy(CFOP.Text, 1, 1) <> '2') then
      begin
        Application.MessageBox('CFOP inválido', PChar(Msg_Title), mb_IconStop);
        CFOP.Color := clYellow;
        CFOP.SetFocus;
        exit;
      end;
    end;
  end;

  if (COND_PAGTO.Text = 'A PRAZO') OR (NUM_CHEQUE.TEXT <> '') then
  begin
    if QFornecedor.IsEmpty then
    begin
      Application.MessageBox('Fornecedor inexistente', PChar(Msg_Title), mb_IconStop);
      FORNECEDOR_ID.Color := clYellow;
      FORNECEDOR_ID.SetFocus;
      exit;
    end;

    if not Existe_Plano(QFornecedor.FieldByName('COD_CONTABIL').AsString) then
    begin
      Application.MessageBox('Fornecedor inexistente no plano de contas. Gere o plano de contas novamente', PChar(Msg_Title), mb_IconStop);
      FORNECEDOR_ID.Color := clYellow;
      FORNECEDOR_ID.SetFocus;
      exit;
    end;
  end;

  if QEmpresa.IsEmpty then
  begin
    Application.MessageBox('Empresa inexistente', PChar(Msg_Title), mb_IconStop);
    EMPRESA_ID.Color := clYellow;
    EMPRESA_ID.SetFocus;
    exit;
  end;

  if QConta.IsEmpty then
  begin
    Application.MessageBox('Conta inexistente', PChar(Msg_Title), mb_IconStop);
    CONTA_ID.Color := clYellow;
    CONTA_ID.SetFocus;
    exit;
  end;

  if not Existe_Plano(QConta.FieldByName('COD_CONTABIL').AsString) then
  begin
    Application.MessageBox('Conta Despesa inexistente no plano de contas. Gere o plano de contas novamente', PChar(Msg_Title), mb_IconStop);
    CONTA_ID.Color := clYellow;
    CONTA_ID.SetFocus;
    exit;
  end;

  if (COND_PAGTO.Text = 'A VISTA') OR (COND_PAGTO.Text = 'CHEQUE') OR (COND_PAGTO.Text = 'CARTAO') OR (COND_PAGTO.Text = 'PIX')  then
  begin
    if QBanco.IsEmpty then
    begin
      Application.MessageBox('Caixa/Banco inexistente', PChar(Msg_Title), mb_IconStop);
      BANCO_ID.Color := clYellow;
      BANCO_ID.SetFocus;
      exit;
    end;

    if not Existe_Plano(QBanco.FieldByName('COD_CONTABIL').AsString) then
    begin
      Application.MessageBox('Caixa/Banco inexistente no plano de contas. Gere o plano de contas novamente', PChar(Msg_Title), mb_IconStop);
      BANCO_ID.Color := clYellow;
      BANCO_ID.SetFocus;
      exit;
    end;

    if (QFluxo_Caixa.IsEmpty) or (Copy(QFluxo_Caixa.FieldByName('DESCRICAO').AsString, 1, 3) <> '(-)') then
    begin
      Application.MessageBox('Fluxo de Caixa inexistente ou inválido', PChar(Msg_Title), mb_IconStop);
      FLUXO_CAIXA_ID.Color := clYellow;
      FLUXO_CAIXA_ID.SetFocus;
      exit;
    end;

    if (FORNECEDOR_ID.Value > 0) and (QFornecedor.IsEmpty) then
    begin
      Application.MessageBox('Fornecedor inexistente', PChar(Msg_Title), mb_IconStop);
      FORNECEDOR_ID.Color := clYellow;
      FORNECEDOR_ID.SetFocus;
      exit;
    end;
  end
  else
  begin
    BANCO_ID.Value := 0;
    FLUXO_CAIXA_ID.Value := 0;
  end;

  if (C_CUSTO_ID.Value > 0) and (QCusto.IsEmpty) then
  begin
    Application.MessageBox('Centro de Custo inexistente', PChar(Msg_Title), mb_IconStop);
    C_CUSTO_ID.Color := clYellow;
    C_CUSTO_ID.SetFocus;
    exit;
  end;

  if PATRIMONIO_ID.Value > 0 then
  begin
    if QPatrimonio.IsEmpty then
    begin
      Application.MessageBox('Patrimônio inexistente', PChar(Msg_Title), mb_IconStop);
      PATRIMONIO_ID.Color := clYellow;

      if PATRIMONIO_ID.CanFocus then
        PATRIMONIO_ID.SetFocus;
        
      exit;
    end;
  end;

  if VENDEDOR_ID.Value > 0 then
  begin
    if QVendedor.IsEmpty then
    begin
      Application.MessageBox('Vendedor inexistente', PChar(Msg_Title), mb_IconStop);
      VENDEDOR_ID.Color := clYellow;
      VENDEDOR_ID.SetFocus;
      exit;
    end;
  end;
  
  if CST_ICMS.Text <> '' then
  begin
    IQuery.Sql.Clear;
    IQuery.Sql.Add('SELECT * FROM CST_ICMS');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(CODIGO = :CODIGO)');

    IQuery.ParamByName('CODIGO').AsString := CST_ICMS.Text;

    IQuery.Prepare;
    IQuery.Open;

    if IQuery.IsEmpty then
    begin
      Application.MessageBox('Código CST ICMS inválido', PChar(Msg_Title), mb_IconStop);
      CST_ICMS.Color := clYellow;

      if CST_ICMS.CanFocus then
        CST_ICMS.SetFocus;
        
      exit;
    end;
  end;

  if CST_PIS.Text <> '' then
  begin
    IQuery.Sql.Clear;
    IQuery.Sql.Add('SELECT * FROM CST_PIS');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(CODIGO = :CODIGO)');

    IQuery.ParamByName('CODIGO').AsString := CST_PIS.Text;

    IQuery.Prepare;
    IQuery.Open;

    if IQuery.IsEmpty then
    begin
      Application.MessageBox('Código CST PIS inválido', PChar(Msg_Title), mb_IconStop);
      CST_PIS.Color := clYellow;

      if CST_PIS.CanFocus then
        CST_PIS.SetFocus;
        
      exit;
    end;
  end;

  if CST_COFINS.Text <> '' then
  begin
    IQuery.Sql.Clear;
    IQuery.Sql.Add('SELECT * FROM CST_COFINS');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(CODIGO = :CODIGO)');

    IQuery.ParamByName('CODIGO').AsString := CST_COFINS.Text;

    IQuery.Prepare;
    IQuery.Open;

    if IQuery.IsEmpty then
    begin
      Application.MessageBox('Código CST COFINS inválido', PChar(Msg_Title), mb_IconStop);
      CST_COFINS.Color := clYellow;

      if CST_COFINS.CanFocus then
        CST_COFINS.SetFocus;
        
      exit;
    end;
  end;

  if VALOR.Value <= 0 then
  begin
    Application.MessageBox('Valor inválido', PChar(Msg_Title), mb_IconStop);
    VALOR.Color := clYellow;
    VALOR.SetFocus;
    exit;
  end;

  if BASE_ICMS_NORMAL.Value < 0 then
  begin
    Application.MessageBox('Valor da Base de Cálculo de ICMS inválido', PChar(Msg_Title), mb_IconStop);
    BASE_ICMS_NORMAL.Color := clYellow;

    if BASE_ICMS_NORMAL.CanFocus then
      BASE_ICMS_NORMAL.SetFocus;

    exit;
  end;

  if VR_ICMS_NORMAL.Value < 0 then
  begin
    Application.MessageBox('Valor do ICMS inválido', PChar(Msg_Title), mb_IconStop);
    VR_ICMS_NORMAL.Color := clYellow;

    if VR_ICMS_NORMAL.CanFocus then
      VR_ICMS_NORMAL.SetFocus;

    exit;
  end;

  if (BALANCO.Text <> 'LIBERADO') and (BALANCO.Text <> 'BLOQUEADO') and (BALANCO.Text <> 'AGRUPADO') then
  begin
    Application.MessageBox('Status inválido', PChar(Msg_Title), mb_IconStop);
    BALANCO.Color := clYellow;
    BALANCO.SetFocus;
    exit;
  end;

  if (COND_PAGTO.Text <> 'A VISTA') and (COND_PAGTO.Text <> 'A PRAZO') then
  begin
    Application.MessageBox('Cond. de Pagto. inválida', PChar(Msg_Title), mb_IconStop);
    COND_PAGTO.Color := clYellow;
    COND_PAGTO.SetFocus;
    exit;
  end;
  if Chave_Nfe.Text <> '' then
  Begin
    if Length(Chave_Nfe.Text) <> 44 then
    Begin
      Application.MessageBox('Tamanho da Chave Nfe Inválido! deve conter 44 Caracteres favor verificar', PChar(Msg_Title), mb_IconStop);
      Chave_nfe.Color := clYellow;
      Chave_nfe.SetFocus;
      exit;
    End;
    if not Verifica_ChaveNfe(Chave_Nfe.Text) then
    Begin
     Application.MessageBox('Dígito Verificador da Chave Nfe incorreto favor verificar a digitação!', PChar(Msg_Title), mb_IconStop);
     Chave_nfe.Color := clYellow;
     Chave_nfe.SetFocus;
     exit;
    End;
  End;

  if (NUM_CHEQUE.Text <> '') Then
  Begin

   IQuery.Sql.Clear;
   IQuery.Sql.Add('SELECT SUM(VALOR) VALOR FROM TRANSACOES');
   IQuery.Sql.Add('WHERE (CONDUTA = :CONDUTA) AND (DEPTO = :DEPTO)');
   IQuery.Sql.Add('AND (NUM_CHEQUE = :NUM_CHEQUE) AND (BANCO_ID =:BANCO_ID)');

   IQuery.ParamByName('CONDUTA').AsString     := '02';
   IQuery.ParamByName('DEPTO').AsString       := '02';
   IQuery.ParamByName('NUM_CHEQUE').AsString  := NUM_CHEQUE.Text;
   IQuery.ParamByName('BANCO_ID').AsInteger   := STRtOINT(BANCO_ID.Text);
   IQuery.Prepare;
   IQuery.Open;

   if Operacao = 'Alterando' Then
   Vl_Trans_Cheque :=  (IQuery.FieldByName('VALOR').AsFloat - QTabela.FieldByName('VALOR').AsFloat)
   Else
   Vl_Trans_Cheque := IQuery.FieldByName('VALOR').AsFloat;

   IQuery.Sql.Clear;
   IQuery.Sql.Add('SELECT   LIQUIDADO, VALOR FROM CHEQUES_EMITIDOS');
   IQuery.Sql.Add('WHERE (NUM_CHEQUE = :NUM_CHEQUE) AND (BANCO_ID =:BANCO_ID)');
   IQuery.ParamByName('NUM_CHEQUE').Asinteger := StrToInt(NUM_CHEQUE.Text);
   IQuery.ParamByName('BANCO_ID').AsInteger   := STRtOINT(BANCO_ID.Text);
   IQuery.Prepare;
   IQuery.Open;

   Vl_Cheque       := IQuery.FieldByName('VALOR').AsFloat;
   Liquidado       := IQuery.FieldByName('LIQUIDADO').AsString;

   IF Vl_Cheque = 0 Then
   Begin
    Application.MessageBox('Cheque não localizado.' , PChar(Msg_Title), mb_IconStop);
    NUM_CHEQUE.Color   := clYellow;
    NUM_CHEQUE.SetFocus;
    exit;
   End;


   if (vl_cheque - vl_trans_cheque) < (valor.value ) Then
   Begin
    Application.MessageBox(Pchar('Cheque indicado na despesa possui outros lançamentos.' + #13 + 'Lançamentos para o Cheque: R$' + FloatToStrf(vl_trans_cheque,ffNumber,15,2) +
    #13 + 'Valor despesa Atual: R$' + FloatToStrf(valor.Value,ffNumber,15,2) + #13 + 'Valor do Cheque: R$' + FloatToStrf(vl_cheque,ffNumber,15,2)) , PChar(Msg_Title), mb_IconStop);
    NUM_CHEQUE.Color   := clYellow;
    NUM_CHEQUE.SetFocus;
    exit;

   End;

  End;

  if (Modelo.Text = '67') or (Modelo.Text ='57') then
  Begin

    if Length(Chave_Nfe.Text) <> 44 then
    Begin
      Application.MessageBox('Tamanho da Chave Nfe Inválido! deve conter 44 Caracteres favor verificar a digitação!', PChar(Msg_Title), mb_IconStop);
      Chave_nfe.Color := clYellow;
      Chave_nfe.SetFocus;
      exit;
    End;

    if Copy(Chave_Nfe.Text,7,14) <> (SemMascara(Qfornecedor.FieldByName('CNPJ').AsString)) then
    Begin
      Application.MessageBox('Cnpj do Fornecedor informado diferente do informado na Chave Nfe, favor verificar a digitação!', PChar(Msg_Title), mb_IconStop);
      Chave_nfe.Color := clYellow;
      Chave_nfe.SetFocus;
      exit;
    End;

    if Copy(Chave_Nfe.Text,23,3) <>  (Serie.Text) then
    Begin
      Application.MessageBox('Serie da Nota fiscal informada diferente do informado na Chave Nfe, favor verificar a digitação!', PChar(Msg_Title), mb_IconStop);
      Chave_nfe.Color := clYellow;
      Chave_nfe.SetFocus;
      exit;
    End;

    if Copy(Chave_Nfe.Text,26,9) <>  (Num_doc.Text) then
    Begin
      Application.MessageBox('Número da nota fiscal informada diferente do informado na Chave Nfe, favor verificar a digitação!', PChar(Msg_Title), mb_IconStop);
      Chave_nfe.Color := clYellow;
      Chave_nfe.SetFocus;
      exit;
    End;

     if not Verifica_ChaveNfe(Chave_Nfe.Text) then
    Begin
     Application.MessageBox('Dígito Verificador da Chave Nfe incorreto favor verificar a digitação!', PChar(Msg_Title), mb_IconStop);
     Chave_nfe.Color := clYellow;
     Chave_nfe.SetFocus;
     exit;
    End;

  End;

  //Modelo da nota não pode ser 55, 99, 01, 04 ou 1B
  if LISTA_MODELO_NOTAS.IndexOf(MODELO.Text) <> -1 then
      begin
      Application.MessageBox('Modelo inválido, notas que possem itens devem ser lançadas em Compras.', PChar(Msg_Title), mb_IconSTop);
      MODELO.Color := clYellow;
      MODELO.SetFocus;
      exit;
    end;



  Result := True;
end;

procedure TFrmTrans_Debito.VENDEDOR_IDExit(Sender: TObject);
begin
  DetailSearch('Vendedor');
end;

procedure TFrmTrans_Debito.ManutencaoShow(Sender: TObject);
begin
  Set_Campos(False);
  Botoes_Normal;
end;

procedure TFrmTrans_Debito.NUM_DOCKeyPress(Sender: TObject; var Key: Char);
begin
 If not( key in['0'..'9',#08] ) then
  key:=#0;
end;

procedure TFrmTrans_Debito.PATRIMONIO_IDExit(Sender: TObject);
begin
  DetailSearch('Patrimônio');
end;

procedure TFrmTrans_Debito.QTabelaAfterOpen(DataSet: TDataSet);
begin
TFloatField(QTabela.FieldByName('Valor')).DisplayFormat  := '#,##0.00';
end;

procedure TFrmTrans_Debito.Set_Campos(Vazio: Boolean);
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

      if Temp is TDateEdit then
        TDateEdit(Temp).Text := '';

      if Temp is TComboBox then
        TComboBox(Temp).Text := '';

      if Temp is TCurrencyEdit then
        TCurrencyEdit(Temp).Value := 0;

      if Temp is TRxCalcEdit then
        TRxCalcEdit(Temp).Value := 0;
    end
    else
    begin
      if Temp is TEdit then
        TEdit(Temp).Text := QTabela.FieldByName(TEdit(Temp).Name).AsString;

      if Temp is TDateEdit then
        TDateEdit(Temp).Text := QTabela.FieldByName(TDateEdit(Temp).Name).AsString;

      if Temp is TComboBox then
        TComboBox(Temp).Text := QTabela.FieldByName(TComboBox(Temp).Name).AsString;

      if Temp is TCurrencyEdit then
        TCurrencyEdit(Temp).Value := QTabela.FieldByName(TCurrencyEdit(Temp).Name).AsFloat;

      if Temp is TRxCalcEdit then
        TRxcalcEdit(Temp).Value := QTabela.FieldByName(TRxCalcEdit(Temp).Name).AsFloat;
    end;
  end;

  DetailSearch('');

  CONDUTA.Text := '02';
  DEPTO.Text   := '02';
  TPCTB.Text   := FrmData.QAcesso.FieldByName('TPCTB').AsString;
end;

procedure TFrmTrans_Debito.btnBancoClick(Sender: TObject);
begin
  try
    BANCO_ID.Value := GetConsulta('BANCOS', 0, 0, StrToInt(BANCO_ID.Text));
  except
    BANCO_ID.Value := GetConsulta('BANCOS', 0, 0, 0);
  end;
end;

procedure TFrmTrans_Debito.btnCentro_CustoClick(Sender: TObject);
begin
  try
    C_CUSTO_ID.Value := GetConsulta('CCUSTO', 0, 0, StrToInt(C_CUSTO_ID.Text));
  except
    C_CUSTO_ID.Value := GetConsulta('CCUSTO', 0, 0, 0);
  end;
end;

procedure TFrmTrans_Debito.btnCFOPClick(Sender: TObject);
begin
  CFOP.Text := GetConsulta_CFOP(CFOP.Text);
end;

procedure TFrmTrans_Debito.btnContaClick(Sender: TObject);
begin
  if LeIni(Arq_Ini, 'Sistema', 'Exibir Todas as Contas') = 'True' then
  Begin
    try
      CONTA_ID.Value := GetConsulta('CONTAS', 0, 0, StrToInt(CONTA_ID.Text));
    except
      CONTA_ID.Value := GetConsulta('CONTAS', 0, 0, 0);
    end;
  End
  Else
  Begin
    try
      CONTA_ID.Value := GetConsulta('CONTAS', 0, 0, StrToInt(CONTA_ID.Text));
    except
      CONTA_ID.Value := GetConsulta('CONTAS', 0, 0, 0);
    end;
  End;
end;

procedure TFrmTrans_Debito.btnCst_CofinsClick(Sender: TObject);
begin
  CST_COFINS.Text := GetConsulta_CST('CST_COFINS', CST_COFINS.Text);
end;

procedure TFrmTrans_Debito.btnCst_IcmsClick(Sender: TObject);
begin
  CST_ICMS.Text := GetConsulta_CST('CST_ICMS', CST_ICMS.Text);
end;

procedure TFrmTrans_Debito.btnCst_PisClick(Sender: TObject);
begin
  CST_PIS.Text := GetConsulta_CST('CST_PIS', CST_PIS.Text);
end;

procedure TFrmTrans_Debito.btnDeleteClick(Sender: TObject);
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

  if Existe_Pagamento(QTabela.FieldByName('TRANSACAO_ID').AsInteger) then
  begin
    Application.MessageBox('Transação possui parcela quitada. Impossível continuar', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  if (QTabela.FieldByName('DT_TRANS').AsDateTime <= FrmPrincipal.QEmpresa.FieldByName('DT_ULT_FOLHA').AsDateTime)
    OR (QTabela.FieldByName('DT_ENT_SAI').AsDateTime <= FrmPrincipal.QEmpresa.FieldByName('DT_ULT_FOLHA').AsDateTime)then
  begin
    Application.MessageBox('Movimento já encerrado', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  if Application.MessageBox('Deseja realmente excluir?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = IDYES then
  begin


    IQuery.Sql.Clear;
    IQuery.Sql.Add('DELETE FROM TRANSACOES');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(TRANSACAO_ID = :ID)');

    IQuery.ParamByName('ID').AsInteger := QTabela.FieldByName('TRANSACAO_ID').AsInteger;

    IQuery.Prepare;
    IQuery.ExecSql;



    IQuery.Sql.Clear;
    IQuery.Sql.Add('UPDATE TRANSPARCELAS SET AGRUPAMENTO = 0');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(AGRUPAMENTO = :AGRUPAMENTO)');

    IQuery.ParamByName('AGRUPAMENTO').AsInteger := QTabela.FieldByName('TRANSACAO_ID').AsInteger;

    IQuery.Prepare;
    IQuery.ExecSql;



    try
      IQuery.Sql.Clear;
      IQuery.Sql.Add('UPDATE CHEQUES_EMITIDOS SET LIQUIDADO = :LIQUIDADO, DT_LIQUIDACAO = NULL');
      IQuery.Sql.Add('WHERE');
      IQuery.Sql.Add('(NUM_CHEQUE = :NUM_CHEQUE)');

      IQuery.ParamByName('LIQUIDADO').AsString   := 'NÃO';
      IQuery.ParamByName('NUM_CHEQUE').AsInteger := QTabela.FieldByName('NUM_CHEQUE').AsInteger;

      IQuery.Prepare;
      IQuery.ExecSql;


    except

    end;

    QTabela.Close;

    QTabela.Prepare;
    QTabela.Open;

    Set_Campos(False);

    Botoes_Normal;
  end;

  if QTabela.IsEmpty then
  begin
    QEmpresa.Close;
    QBanco.Close;
    QFornecedor.Close;
    QConta.Close;
    QCusto.Close;
    QPatrimonio.Close;
  end;
end;

procedure TFrmTrans_Debito.btnDiscardClick(Sender: TObject);
begin
  Botoes_Normal;
  Set_Campos(False);

  if QTabela.IsEmpty then
  begin
    QEmpresa.Close;
    QBanco.Close;
    QFornecedor.Close;
    QConta.Close;
    QCusto.Close;
    QPatrimonio.Close;
  end;

  Habilitar(False);

  Operacao := '';

  Consulta.TabVisible := True;
end;

procedure TFrmTrans_Debito.btnEditClick(Sender: TObject);
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

  if Existe_Pagamento(QTabela.FieldByName('TRANSACAO_ID').AsInteger) then
  begin
    Application.MessageBox('Transação possui parcela quitada. Impossível continuar', PChar(Msg_Title), mb_IconStop);
    exit;
  end;
  
  Operacao := 'Alterando';
  ID       := QTabela.FieldByName('TRANSACAO_ID').AsInteger;

  Botoes_Editing;

  Habilitar(True);

  Consulta.TabVisible := False;
  
  DT_TRANS.SetFocus;
end;

procedure TFrmTrans_Debito.btnEmpresaClick(Sender: TObject);
begin
  try
    EMPRESA_ID.Value := GetConsulta('EMPRESAS', 0, 0, StrToInt(EMPRESA_ID.Text));
  except
    EMPRESA_ID.Value := GetConsulta('EMPRESAS', 0, 0, 0);
  end;
end;

procedure TFrmTrans_Debito.btnFluxoCaixaClick(Sender: TObject);
begin
  try
    FLUXO_CAIXA_ID.Value := GetConsulta('FLUXO_CAIXA', 0, 0, StrToInt(FLUXO_CAIXA_ID.Text));
  except
    FLUXO_CAIXA_ID.Value := GetConsulta('FLUXO_CAIXA', 0, 0, 0);
  end;
end;

procedure TFrmTrans_Debito.btnFornecedorClick(Sender: TObject);
begin
  try
    FORNECEDOR_ID.Value := GetConsulta('FORNECEDORES', 0, 0, StrToInt(FORNECEDOR_ID.Text));
  except
    FORNECEDOR_ID.Value := GetConsulta('FORNECEDORES', 0, 0, 0);
  end;
end;

procedure TFrmTrans_Debito.btnInsertClick(Sender: TObject);
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

  QEmpresa.Close;
  QBanco.Close;
  QFornecedor.Close;
  QConta.Close;
  QCusto.Close;
  QPatrimonio.Close;

  DT_TRANS.Date     := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
  DT_MOVIMENTO.Date := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
  DT_ENT_SAI.Date   := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
  DT_SPED.Date         := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
  BALANCO.Text      := 'LIBERADO';
  EMPRESA_ID.Value  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  AUTORIZ_ID.Value  := FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger;

  Consulta.TabVisible := False;
  
  DT_TRANS.SetFocus;
end;

procedure TFrmTrans_Debito.btnNextClick(Sender: TObject);
begin
  if not QTabela.Eof then
  begin
    QTabela.Next;
    Set_Campos(False);
  end;

  Botoes_Normal;
end;

procedure TFrmTrans_Debito.btnParcelasClick(Sender: TObject);
begin
  if QTabela.FieldByName('VALOR').AsFloat > 0 then
  begin
    if (QTabela.FieldByName('DT_MOVIMENTO').AsDateTime < FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime) or (Existe_Pagamento(QTabela.FieldByName('TRANSACAO_ID').AsInteger)) then
      Divisao_Parcelas(QTabela.FieldByName('TRANSACAO_ID').AsInteger, 'T','0', False, QTabela.FieldByName('DT_TRANS').AsDateTime, QTabela.FieldByName('VALOR').AsFloat)
    else
      Divisao_Parcelas(QTabela.FieldByName('TRANSACAO_ID').AsInteger, 'T','0', True, QTabela.FieldByName('DT_TRANS').AsDateTime, QTabela.FieldByName('VALOR').AsFloat);
  end
  else
    Application.MessageBox('Valor não pode ser igual a 0', PChar(Msg_Title), mb_IconSTop);
end;

procedure TFrmTrans_Debito.btnPatrimonioClick(Sender: TObject);
begin
  try
    PATRIMONIO_ID.Value := GetConsulta('PATRIMÔNIO', 0, 0, StrToInt(PATRIMONIO_ID.Text));
  except
    PATRIMONIO_ID.Value := GetConsulta('PATRIMÔNIO', 0, 0, 0);
  end;
end;

procedure TFrmTrans_Debito.btnPesquisaClick(Sender: TObject);
var
Condicao: String;
begin
  Condicao := GetPesquisa('TRANS DEBITO');

  if Condicao <> '' then
  begin
    CmdSelectNull := Condicao + ' AND (CONDUTA = :CONDUTA) AND (DEPTO = :DEPTO) AND (TPCTB = :TPCTB) AND (EMPRESA_ID = :EMPRESA_ID)';

    QTabela.ParamByName('CONDUTA').AsString     := '02';
    QTabela.ParamByName('DEPTO').AsString       := '02';
    QTabela.ParamByName('TPCTB').AsString       := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    QTabela.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  end;

  CmdOrderBy := 'ORDER BY TRANSACAO_ID';

  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

  QTabela.Prepare;
  QTabela.Open;

  Set_Campos(False);
  Botoes_Normal;
end;

procedure TFrmTrans_Debito.btnPriorClick(Sender: TObject);
begin
  if not QTabela.Bof then
  begin
    QTabela.Prior;
    Set_Campos(False);
  end;
  Botoes_Normal;
end;

procedure TFrmTrans_Debito.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmTrans_Debito.btnSaveClick(Sender: TObject);
begin
  DetailSearch('');

  if Validacao then
  begin

    if HISTORICO.Text = '' then
      HISTORICO.Text := 'Vr. N. Fiscal nº ' + NUM_DOC.Text;

    if (BASE_CALC_PIS.Value > 0) and (ALIQUOTA_PIS.Value > 0) then
      VR_PIS.Value := ((BASE_CALC_PIS.Value * ALIQUOTA_PIS.Value) / 100);

    if (BASE_CALC_COFINS.Value > 0) and (ALIQUOTA_COFINS.Value > 0) then
      VR_COFINS.Value := ((BASE_CALC_COFINS.Value * ALIQUOTA_COFINS.Value) / 100);



    if COND_PAGTO.Text = 'A PRAZO' then
    Begin
     IQuery.SQL.Clear;
     IQuery.Sql.Add('SELECT * FROM TRANSPARCELAS WHERE TRANSACAO_ID = :TRANSACAO_ID');
     IQuery.ParamByName('TRANSACAO_ID').AsInteger  := QTabela.FieldByName('TRANSACAO_ID').AsInteger;
     IQuery.Prepare;
     IQuery.Open;

       If not IQuery.IsEmpty Then
       Begin
       IQuery.Sql.Clear;
       IQuery.Sql.Add('UPDATE TRANSPARCELAS SET TIPO_TRANSACAO = :TIPO_TRANSACAO');
       IQuery.Sql.Add('WHERE');
       IQuery.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
       IQuery.Sql.Add('AND (TIPO_TRANSACAO = :TIPO_TRANS)');

       IQuery.ParamByName('TIPO_TRANSACAO').AsString := 'U';
       IQuery.ParamByName('TRANSACAO_ID').AsInteger  := QTabela.FieldByName('TRANSACAO_ID').AsInteger;
       IQuery.ParamByName('TIPO_TRANS').AsString     := 'T';

       IQuery.Prepare;
       IQuery.ExecSql;


       End;

    End;


    if Operacao = 'Inserindo' then
    begin
      Insert;

      if COND_PAGTO.Text = 'A PRAZO' then
      Begin

      IQuery.Sql.Clear;
      IQuery.Sql.Add('UPDATE TRANSPARCELAS SET TIPO_TRANSACAO = :TIPO_TRANSACAO');
      IQuery.Sql.Add('WHERE');
      IQuery.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
      IQuery.Sql.Add('AND (TIPO_TRANSACAO = :TIPO_TRANS)');

      IQuery.ParamByName('TIPO_TRANSACAO').AsString := 'T';
      IQuery.ParamByName('TRANSACAO_ID').AsInteger  := QTabela.FieldByName('TRANSACAO_ID').AsInteger;
      IQuery.ParamByName('TIPO_TRANS').AsString     := 'U';

      IQuery.Prepare;
      IQuery.ExecSql;


      End;


      CmdSelectNull := 'WHERE (TRANSACAO_ID IS NOT NULL) AND (DT_MOVIMENTO = :DT_MOVIMENTO) AND (CONDUTA = :CONDUTA) AND (DEPTO = :DEPTO) AND (TPCTB = :TPCTB) AND (EMPRESA_ID = :EMPRESA_ID)';
      CmdOrderBy    := 'ORDER BY TRANSACAO_ID';

      QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

      QTabela.ParamByName('DT_MOVIMENTO').AsDateTime := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
      QTabela.ParamByName('CONDUTA').AsString        := '02';
      QTabela.ParamByName('DEPTO').AsString          := '02';
      QTabela.ParamByName('TPCTB').AsString          := FrmData.QAcesso.FieldByName('TPCTB').AsString;
      QTabela.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;

      QTabela.Prepare;
      QTabela.Open;
      QTabela.Last;
    end
    else
    Edit;

    if COND_PAGTO.Text = 'A PRAZO' then
    Begin

      IQuery.Sql.Clear;
      IQuery.Sql.Add('UPDATE TRANSPARCELAS SET TIPO_TRANSACAO = :TIPO_TRANSACAO');
      IQuery.Sql.Add('WHERE');
      IQuery.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
      IQuery.Sql.Add('AND (TIPO_TRANSACAO = :TIPO_TRANS)');

      IQuery.ParamByName('TIPO_TRANSACAO').AsString := 'T';
      IQuery.ParamByName('TRANSACAO_ID').AsInteger  := QTabela.FieldByName('TRANSACAO_ID').AsInteger;
      IQuery.ParamByName('TIPO_TRANS').AsString     := 'U';

      IQuery.Prepare;
      IQuery.ExecSql;

    End;

    if (NUM_CHEQUE.Text <> '') Then
    Begin
      if ((vl_cheque) = (valor.value  + vl_trans_cheque)) and (Liquidado <> 'SIM')  Then
     Begin
       IQuery.Sql.Clear;
       IQuery.Sql.Add('UPDATE CHEQUES_EMITIDOS SET LIQUIDADO = :LIQUIDADO, DT_LIQUIDACAO =:DATA');
       IQuery.Sql.Add('WHERE NUM_CHEQUE = :NUM_CHEQUE AND BANCO_ID = :BANCO_ID');

       IQuery.ParamByName('LIQUIDADO').AsString   := 'SIM';
       IQuery.ParamByName('NUM_CHEQUE').AsiNTEGER := StrToInt(NUM_CHEQUE.Text);
       IQuery.ParamByName('BANCO_ID').AsInteger   := StrToInt(BANCO_ID.TEXT);
       IQuery.ParamByName('DATA').AsDateTime      := Dt_Ent_Sai.date;


       IQuery.Prepare;
       IQuery.ExecSql;

       Application.MessageBox('Cheque Liquidado!', PChar(Msg_Title), MB_ICONINFORMATION);

     End;
    End;

    Set_Campos(False);

    if QTabela.IsEmpty then
    begin
      QEmpresa.Close;
      QBanco.Close;
      QFornecedor.Close;
      QConta.Close;
      QCusto.Close;
      QPatrimonio.Close;
    end;

    Habilitar(False);
    Botoes_Normal;

   if COND_PAGTO.Text = 'A PRAZO' then
   Begin
     IQuery.SQL.Clear;
     IQuery.Sql.Add('SELECT * FROM TRANSPARCELAS WHERE TRANSACAO_ID = :TRANSACAO_ID');
     IQuery.ParamByName('TRANSACAO_ID').AsInteger  := QTabela.FieldByName('TRANSACAO_ID').AsInteger;
     IQuery.Prepare;
     IQuery.Open;

     If IQuery.IsEmpty then
     btnParcelasClick(Self)
     Else
     If Application.MessageBox('Parcela já emitida deseja recriar a parcela?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = idYes then
     Begin
      IQuery.Sql.Clear;
      IQuery.Sql.Add('DELETE FROM TRANSPARCELAS');
      IQuery.Sql.Add('WHERE');
      IQuery.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
      IQuery.Sql.Add('AND (TIPO_TRANSACAO = :TIPO_TRANSACAO)');

      IQuery.ParamByName('TRANSACAO_ID').AsInteger  := QTabela.FieldByName('TRANSACAO_ID').AsInteger;
      IQuery.ParamByName('TIPO_TRANSACAO').AsString := 'T';

      IQuery.Prepare;
      IQuery.ExecSql;



      btnParcelasClick(Self);
     End
   else
   End
   Else
   begin
    IQuery.Sql.Clear;
    IQuery.Sql.Add('DELETE FROM TRANSPARCELAS');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
    IQuery.Sql.Add('AND (TIPO_TRANSACAO = :TIPO_TRANSACAO)');

    IQuery.ParamByName('TRANSACAO_ID').AsInteger  := QTabela.FieldByName('TRANSACAO_ID').AsInteger;
    IQuery.ParamByName('TIPO_TRANSACAO').AsString := 'T';

    IQuery.Prepare;
    IQuery.ExecSql;


   end;
    Operacao := '';
    Consulta.TabVisible := True;
  end;
end;

procedure TFrmTrans_Debito.btnVendedorClick(Sender: TObject);
begin
  try
    VENDEDOR_ID.Value := GetConsulta('PESSOAL', 0, 0, StrToInt(VENDEDOR_ID.Text));
  except
    VENDEDOR_ID.Value := GetConsulta('PESSOAL', 0, 0, 0);
  end;
end;

procedure TFrmTrans_Debito.Btn_ChequeClick(Sender: TObject);
begin
 try
    NUM_CHEQUE.Text := IntToStr( GetConsulta('CHEQUES_EMITIDOS', StrToInt(BANCO_ID.Text), 0, StrToInt(NUM_CHEQUE.Text)));
 except
    NUM_CHEQUE.Text := IntToStr(GetConsulta('CHEQUES_EMITIDOS', StrToInt(BANCO_ID.Text), 0, 0));
 end;
end;

procedure TFrmTrans_Debito.DBGrid1DblClick(Sender: TObject);
begin
  Manutencao.Show;
end;

procedure TFrmTrans_Debito.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Manutencao.Show;
end;

procedure TFrmTrans_Debito.DBGrid1TitleClick(Column: TColumn);
begin
  CmdOrderBy       := 'ORDER BY ' + Column.FieldName;
  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

  QTabela.Prepare;
  QTabela.Open;
end;

procedure TFrmTrans_Debito.FLUXO_CAIXA_IDExit(Sender: TObject);
begin
  DetailSearch('Fluxo Caixa');
end;

procedure TFrmTrans_Debito.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmTrans_Debito.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (Operacao = 'Inserindo') or (Operacao = 'Alterando') then
  begin
    Application.MessageBox('É melhor salvar as alterações antes de continuar', PChar(Msg_Title), mb_IconStop);
    CanClose := False;
  end;
end;

procedure TFrmTrans_Debito.FormCreate(Sender: TObject);
var
X, Ult_Dia: Integer;
begin
  DBGrid1.Columns[0].Width  := 54;
  DBGrid1.Columns[1].Width  := 76;
  DBGrid1.Columns[2].Width  := 77;
  DBGrid1.Columns[3].Width  := 78;
  DBGrid1.Columns[4].Width  := 35;
  DBGrid1.Columns[5].Width  := 45;
  DBGrid1.Columns[6].Width  := 40;
  DBGrid1.Columns[7].Width  := 250;
  DBGrid1.Columns[8].Width  := 318;
  DBGrid1.Columns[9].Width  := 73;
  DBGrid1.Columns[10].Width := 72;
  DBGrid1.Columns[11].Width := 75;

  Ult_Dia := StrToInt(Copy(DateToStr(Ult_Dia_Mes(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime)), 1, 2));
  Dias.Tabs.Clear;

  for X := 1 to Ult_Dia do
    Dias.Tabs.Add(IntToStr(X));

  Dias.Tabs.Add('Todos');

  DT_MOVIMENTO.MinDate := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
  DT_MOVIMENTO.MaxDate := StrToDate('31/12/2026');

  CmdSelect     := QTabela.Sql.Text;
  CmdSelectNull := 'WHERE (TRANSACAO_ID IS NOT NULL) AND (DT_MOVIMENTO = :DT_MOVIMENTO) AND (CONDUTA = :CONDUTA) AND (DEPTO = :DEPTO) AND (TPCTB = :TPCTB) AND (EMPRESA_ID = :EMPRESA_ID)';
  CmdOrderBy    := 'ORDER BY TRANSACAO_ID';

  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

  QTabela.ParamByName('DT_MOVIMENTO').AsDateTime := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
  QTabela.ParamByName('CONDUTA').AsString        := '02';
  QTabela.ParamByName('DEPTO').AsString          := '02';
  QTabela.ParamByName('TPCTB').AsString          := FrmData.QAcesso.FieldByName('TPCTB').AsString;
  QTabela.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;

  QTabela.Prepare;
  QTabela.Open;

  Consulta.Show;
end;

procedure TFrmTrans_Debito.FormShow(Sender: TObject);
begin
  DBGrid1.SetFocus;
end;

end.
