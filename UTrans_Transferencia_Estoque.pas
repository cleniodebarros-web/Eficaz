unit UTrans_Transferencia_Estoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ComCtrls, ToolWin, StdCtrls, Grids, DBGrids, Tabs, ExtCtrls,
  DB, IBCustomDataSet, IBQuery, Mask, Buttons, DBCtrls, rxCurrEdit, rxToolEdit,
  IBUpdateSQL, Math, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, FireDAC.Comp.DataSet;

type
  TFrmTrans_Transferencia_Estoque = class(TForm)
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
    DT_TRANS: TDateEdit;
    EMPRESA_ID: TCurrencyEdit;
    CONTA_ID: TCurrencyEdit;
    HISTORICO: TEdit;
    NUM_DOC: TEdit;
    DataEmpresa: TDataSource;
    DBText1: TDBText;
    DBText3: TDBText;
    C_CUSTO_ID: TCurrencyEdit;
    DBText5: TDBText;
    Label1: TLabel;
    Label2: TLabel;
    Label15: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    DT_MOVIMENTO: TDateEdit;
    CONDUTA: TEdit;
    DEPTO: TEdit;
    TPCTB: TEdit;
    Panel3: TPanel;
    Label21: TLabel;
    StatusBar1: TStatusBar;
    Itens: TDBGrid;
    btnEmpresa: TSpeedButton;
    btnConta: TSpeedButton;
    btnCentro_Custo: TSpeedButton;
    VALOR: TRxCalcEdit;
    DataConta: TDataSource;
    DataCusto: TDataSource;
    DataSub_Detail: TDataSource;
    Dias: TTabSet;
    AUTORIZ_ID: TCurrencyEdit;
    btnPesquisa: TBitBtn;
    Label3: TLabel;
    CONTAAUX_ID: TCurrencyEdit;
    btnContaAux: TSpeedButton;
    DBText2: TDBText;
    DataConta_Aux: TDataSource;
    SERIE: TEdit;
    Label5: TLabel;
    CFOP: TEdit;
    Label4: TLabel;
    Label7: TLabel;
    EMPRESAAUX_ID: TCurrencyEdit;
    btnEmpresa_Destino: TSpeedButton;
    DBText4: TDBText;
    DataEmpresa_Destino: TDataSource;
    btnNotaFiscal: TBitBtn;
    MODELO: TEdit;
    DataLocalizacao: TDataSource;
    DBText6: TDBText;
    btnLocalizacao: TSpeedButton;
    LOCALIZACAO_ID: TCurrencyEdit;
    Label8: TLabel;
    QConta: TFDQuery;
    QConta_Aux: TFDQuery;
    QLimite: TFDQuery;
    QEmpresa: TFDQuery;
    IQuery: TFDQuery;
    QTabela: TFDQuery;
    QLocalizacao: TFDQuery;
    QSub_Detail: TFDQuery;
    QCfop: TFDQuery;
    QTributo: TFDQuery;
    QProduto: TFDQuery;
    QEmpresa_Destino: TFDQuery;
    QCusto: TFDQuery;
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
    procedure EMPRESA_IDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnEmpresaClick(Sender: TObject);
    procedure btnContaClick(Sender: TObject);
    procedure btnCentro_CustoClick(Sender: TObject);
    procedure CONTA_IDExit(Sender: TObject);
    procedure C_CUSTO_IDExit(Sender: TObject);
    procedure QSub_DetailNewRecord(DataSet: TDataSet);
    procedure ItensKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ItensKeyPress(Sender: TObject; var Key: Char);
    procedure QSub_DetailBeforePost(DataSet: TDataSet);
    procedure ItensColEnter(Sender: TObject);
    procedure ItensColExit(Sender: TObject);
    procedure ItensEnter(Sender: TObject);
    procedure ItensExit(Sender: TObject);
    procedure QSub_DetailBeforeDelete(DataSet: TDataSet);
    procedure QSub_DetailBeforeEdit(DataSet: TDataSet);
    procedure QSub_DetailBeforeInsert(DataSet: TDataSet);
    procedure DiasClick(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
    procedure ConsultaShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnContaAuxClick(Sender: TObject);
    procedure CONTAAUX_IDExit(Sender: TObject);
    procedure CFOPExit(Sender: TObject);
    procedure btnEmpresa_DestinoClick(Sender: TObject);
    procedure DT_TRANSKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EMPRESAAUX_IDExit(Sender: TObject);
    procedure btnNotaFiscalClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DT_TRANSEnter(Sender: TObject);
    procedure btnLocalizacaoClick(Sender: TObject);
    procedure LOCALIZACAO_IDExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CmdSelect: String;
    CmdOrderBy: String;
    CmdSelectNull: String;
    procedure Botoes_Disable;
    procedure Botoes_Editing;
    procedure Botoes_Normal;
    procedure DetailSearch(Tabela: String);
    procedure Habilitar(Status: Boolean);
    procedure Insert;
    procedure Set_Campos(Vazio: Boolean);
    procedure Edit;
    function Validacao: Boolean;
    procedure ProdutoSearch;
    procedure TributoSearch;
  end;

var
  FrmTrans_Transferencia_Estoque: TFrmTrans_Transferencia_Estoque;
  Operacao: String;
  ID, Id_Trans: Integer;

  procedure Trans_Transferencia_Estoque(Transacao: Integer);

implementation

uses
  UPrincipal, UData, UConsulta, UPesquisa, UEmite_Nota, UNFe, UConsulta_CFOP, UConsulta_CST;

{$R *.dfm}

procedure Trans_Transferencia_Estoque(Transacao: Integer);
begin
  Id_Trans := Transacao;

  if not ThereIs('Trans. de Estoque - Transferência') then
    TFrmTrans_Transferencia_Estoque.Create(Application);

  if LeIni(Arq_Ini, 'Sistema', 'Organizar Janelas Automaticamente') = 'True' then
    FrmPrincipal.Cascade;
end;

procedure TFrmTrans_Transferencia_Estoque.CFOPExit(Sender: TObject);
begin
  DetailSearch('CFOP');
end;

procedure TFrmTrans_Transferencia_Estoque.ConsultaShow(Sender: TObject);
begin
  Botoes_Normal;
end;

procedure TFrmTrans_Transferencia_Estoque.CONTAAUX_IDExit(Sender: TObject);
begin
  DetailSearch('Conta Consumo');
end;

procedure TFrmTrans_Transferencia_Estoque.CONTA_IDExit(Sender: TObject);
begin
  DetailSearch('Conta');
end;

procedure TFrmTrans_Transferencia_Estoque.C_CUSTO_IDExit(Sender: TObject);
begin
  DetailSearch('C. Custo');
end;

procedure TFrmTrans_Transferencia_Estoque.Botoes_Disable;
begin
  btnPrior.Enabled           := False;
  btnNext.Enabled            := False;
  btnInsert.Enabled          := False;
  btnEdit.Enabled            := False;
  btnDelete.Enabled          := False;
  btnSave.Enabled            := False;
  btnDiscard.Enabled         := False;
  btnRetorna.Enabled         := False;
  btnEmpresa.Enabled         := False;
  btnEmpresa_Destino.Enabled := False;
  btnConta.Enabled           := False;
  btnContaAux.Enabled        := False;
  btnCentro_Custo.Enabled    := False;
  btnPesquisa.Enabled        := False;
  btnNotaFiscal.Enabled      := False;
  btnLocalizacao.Enabled     := False;
end;

procedure TFrmTrans_Transferencia_Estoque.Botoes_Editing;
begin
  btnPrior.Enabled           := False;
  btnNext.Enabled            := False;
  btnInsert.Enabled          := False;
  btnEdit.Enabled            := False;
  btnDelete.Enabled          := False;
  btnSave.Enabled            := True;
  btnDiscard.Enabled         := True;
  btnRetorna.Enabled         := False;
  btnEmpresa.Enabled         := True;
  btnEmpresa_Destino.Enabled := True;
  btnConta.Enabled           := True;
  btnContaAux.Enabled        := True;
  btnCentro_Custo.Enabled    := True;
  btnPesquisa.Enabled        := False;
  btnNotaFiscal.Enabled      := False;
  btnLocalizacao.Enabled     := True;
end;

procedure TFrmTrans_Transferencia_Estoque.Botoes_Normal;
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
    btnEdit.Enabled       := True;
    btnDelete.Enabled     := True;
    btnNotaFiscal.Enabled := True;
  end
  else
  begin
    btnEdit.Enabled       := False;
    btnDelete.Enabled     := False;
    btnNotaFiscal.Enabled := False;
  end;

  btnSave.Enabled            := False;
  btnDiscard.Enabled         := False;
  btnRetorna.Enabled         := True;
  btnEmpresa.Enabled         := False;
  btnEmpresa_Destino.Enabled := False;
  btnConta.Enabled           := False;
  btnContaAux.Enabled        := False;
  btnCentro_Custo.Enabled    := False;
  btnPesquisa.Enabled        := True;
  btnLocalizacao.Enabled     := False;
end;

procedure TFrmTrans_Transferencia_Estoque.DetailSearch(Tabela: String);
begin
  if ((Tabela = '') or (Tabela = 'C. Custo')) and (C_CUSTO_ID.Text <> '') then
  begin
    QCusto.Close;

    QCusto.ParamByName('TABELA_ID').AsInteger := StrToInt(C_CUSTO_ID.Text);

    QCusto.Prepare;
    QCusto.Open;
  end;

  if ((Tabela = '') or (Tabela = 'Conta')) and (CONTA_ID.Text <> '') then
  begin
    QConta.Close;

    QConta.ParamByName('TABELA_ID').AsInteger := StrToInt(CONTA_ID.Text);

    QConta.Prepare;
    QConta.Open;
  end;

  if ((Tabela = '') or (Tabela = 'CFOP')) and (CFOP.Text <> '') then
  begin
    QCFOP.Close;

    QCFOP.ParamByName('COD_CFOP').AsString := CFOP.Text;

    QCFOP.Prepare;
    QCFOP.Open;
  end;

  if ((Tabela = '') or (Tabela = 'Conta Consumo')) and (CONTAAUX_ID.Text <> '') then
  begin
    QConta_Aux.Close;

    QConta_Aux.ParamByName('TABELA_ID').AsInteger := StrToInt(CONTAAUX_ID.Text);

    QConta_Aux.Prepare;
    QConta_Aux.Open;
  end;

  if ((Tabela = '') or (Tabela = 'Empresa')) and (EMPRESA_ID.Text <> '') then
  begin
    QEmpresa.Close;

    QEmpresa.ParamByName('EMPRESA_ID').AsInteger := StrToInt(EMPRESA_ID.Text);

    QEmpresa.Prepare;
    QEmpresa.Open;
  end;

  if ((Tabela = '') or (Tabela = 'Empresa Destino')) and (EMPRESAAUX_ID.Text <> '') then
  begin
    QEmpresa_Destino.Close;

    QEmpresa_Destino.ParamByName('EMPRESA_ID').AsInteger := StrToInt(EMPRESAAUX_ID.Text);

    QEmpresa_Destino.Prepare;
    QEmpresa_Destino.Open;
  end;

  if ((Tabela = '') or (Tabela = 'Localização')) and (LOCALIZACAO_ID.Text <> '') then
  begin
    QLocalizacao.Close;

    QLocalizacao.ParamByName('TABELA_ID').AsInteger := StrToInt(LOCALIZACAO_ID.Text);

    QLocalizacao.Prepare;
    QLocalizacao.Open;
  end;
end;

procedure TFrmTrans_Transferencia_Estoque.DiasClick(Sender: TObject);
begin
  if Dias.TabIndex <> (Dias.Tabs.Count - 1) then
  begin
    CmdSelectNull := 'WHERE (TRANSACAO_ID IS NOT NULL) AND (DT_MOVIMENTO = :DT_MOVIMENTO) AND (CONDUTA = :CONDUTA) AND (DEPTO = :DEPTO) AND (TPCTB = :TPCTB) AND (EMPRESA_ID = :EMPRESA_ID)';
    CmdOrderBy    := 'ORDER BY TRANSACAO_ID';

    QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

    QTabela.ParamByName('DT_MOVIMENTO').AsDateTime := StrToDate(StrZero(IntToStr(Dias.TabIndex + 1), 2, 0) + '/' + Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 4, 7));
    QTabela.ParamByName('CONDUTA').AsString        := '20';
    QTabela.ParamByName('DEPTO').AsString          := '07';
    QTabela.ParamByName('TPCTB').AsString          := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    QTabela.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  end
  else
  begin
    CmdSelectNull := 'WHERE (TRANSACAO_ID IS NOT NULL) AND (DT_MOVIMENTO <= :DT_MOVIMENTO) AND (CONDUTA = :CONDUTA) AND (DEPTO = :DEPTO) AND (TPCTB = :TPCTB) AND (EMPRESA_ID = :EMPRESA_ID)';
    CmdOrderBy := 'ORDER BY TRANSACAO_ID';

    QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

    QTabela.ParamByName('DT_MOVIMENTO').AsDateTime := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
    QTabela.ParamByName('CONDUTA').AsString        := '20';
    QTabela.ParamByName('DEPTO').AsString          := '07';
    QTabela.ParamByName('TPCTB').AsString          := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    QTabela.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  end;

  QTabela.Prepare;
  QTabela.Open;
  Botoes_Normal;
end;

procedure TFrmTrans_Transferencia_Estoque.DT_TRANSEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmTrans_Transferencia_Estoque.DT_TRANSKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = CFOP) then
    CFOP.Text := GetConsulta_CFOP(CFOP.Text);

  if (Key = VK_F7) and (Sender = MODELO) then
    MODELO.Text := GetConsulta_CST('MODELO_DOC', MODELO.Text);

  if (Key = Vk_Return) or (Key = Vk_Down) then
 //   Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmTrans_Transferencia_Estoque.Habilitar(Status: Boolean);
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

procedure TFrmTrans_Transferencia_Estoque.Insert;
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
        Par := Par + ':' + TRxcalcEdit(Temp).Name
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

procedure TFrmTrans_Transferencia_Estoque.Edit;
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
      IQuery.ParamByName(TRxCalcEdit(Temp).Name).AsFloat := TRxCalcEdit(Temp).Value;
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

procedure TFrmTrans_Transferencia_Estoque.ProdutoSearch;
begin
  QProduto.Close;
  QProduto.ParamByName('PRODUTO_ID').AsInteger := QSub_Detail.FieldByName('PRODUTO_ID').AsInteger;
  QProduto.ParamByName('EMPRESA_ID').AsInteger := StrToInt(EMPRESA_ID.Text);
  QProduto.Prepare;
  QProduto.Open;
end;

procedure TFrmTrans_Transferencia_Estoque.TributoSearch;
begin
  QTributo.Close;
  QTributo.ParamByName('TRIBUTO_ID').AsInteger := QProduto.FieldByName('TRIBUTO_ID').AsInteger;
  QTributo.Prepare;
  QTributo.Open;
end;

procedure TFrmTrans_Transferencia_Estoque.EMPRESAAUX_IDExit(Sender: TObject);
begin
  DetailSearch('Empresa Destino');
end;

procedure TFrmTrans_Transferencia_Estoque.EMPRESA_IDExit(Sender: TObject);
begin
  DetailSearch('Empresa');
end;

procedure TFrmTrans_Transferencia_Estoque.EMPRESA_IDKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = EMPRESA_ID) then
    btnEmpresaClick(Self);

  if (Key = Vk_F7) and (Sender = CONTA_ID) then
    btnContaClick(Self);

  if (Key = Vk_F7) and (Sender = C_CUSTO_ID) then
    btnCentro_CustoClick(Self);

  if (Key = Vk_F7) and (Sender = CONTAAUX_ID) then
    btnContaAuxClick(Self);

  if (Key = Vk_F7) and (Sender = EMPRESAAUX_ID) then
    btnEmpresa_DestinoClick(Self);

  if (Key = Vk_F7) and (Sender = LOCALIZACAO_ID) then
    btnLocalizacaoClick(Self);
    
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

function TFrmTrans_Transferencia_Estoque.Validacao: Boolean;
begin
  Result := False;

  EMPRESA_ID.Color     := clWindow;
  EMPRESAAUX_ID.Color  := clWindow;
  CONTA_ID.Color       := clWindow;
  C_CUSTO_ID.Color     := clWindow;
  CONTAAUX_ID.Color    := clWindow;
  CFOP.Color           := clWindow;
  LOCALIZACAO_ID.Color := clWindow;
  MODELO.Color         := clWindow;
  DT_TRANS.Color       := clWindow;

  if DT_TRANS.Date <= FrmPrincipal.QEmpresa.FieldByName('DT_ULT_FOLHA').AsDateTime then
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

  if QCFOP.IsEmpty then
  begin
    Application.MessageBox('CFOP inexistente', PChar(Msg_Title), mb_IconStop);
    CFOP.Color := clYellow;
    CFOP.SetFocus;
    exit;
  end;

  if QEmpresa.IsEmpty then
  begin
    Application.MessageBox('Empresa inexistente', PChar(Msg_Title), mb_IconStop);
    EMPRESA_ID.Color := clYellow;
    EMPRESA_ID.SetFocus;
    exit;
  end;

  if QEmpresa_Destino.IsEmpty then
  begin
    Application.MessageBox('Empresa Destino inexistente', PChar(Msg_Title), mb_IconStop);
    EMPRESAAUX_ID.Color := clYellow;
    EMPRESAAUX_ID.SetFocus;
    exit;
  end;

  if QLocalizacao.IsEmpty then
  begin
    Application.MessageBox('Localização inexistente', PChar(Msg_Title), mb_IconStop);
    LOCALIZACAO_ID.Color := clYellow;
    LOCALIZACAO_ID.SetFocus;
    exit;
  end;

  if QCusto.IsEmpty then
  begin
    Application.MessageBox('Centro de Custo inexistente', PChar(Msg_Title), mb_IconStop);
    C_CUSTO_ID.Color := clYellow;
    C_CUSTO_ID.SetFocus;
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
    Application.MessageBox('Conta de Estoque inexistente no plano de contas. Gere o plano de contas novamente', PChar(Msg_Title), mb_IconStop);
    CONTA_ID.Color := clYellow;
    CONTA_ID.SetFocus;
    exit;
  end;

  if QConta_Aux.IsEmpty then
  begin
    Application.MessageBox('Conta Transferência inexistente', PChar(Msg_Title), mb_IconStop);
    CONTAAUX_ID.Color := clYellow;
    CONTAAUX_ID.SetFocus;
    exit;
  end;

  if not Existe_Plano(QConta_Aux.FieldByName('COD_CONTABIL').AsString) then
  begin
    Application.MessageBox('Conta de Transferência de Estoque inexistente no plano de contas. Gere o plano de contas novamente', PChar(Msg_Title), mb_IconStop);
    CONTAAUX_ID.Color := clYellow;
    CONTAAUX_ID.SetFocus;
    exit;
  end;

  if CONTAAUX_ID.Value = CONTA_ID.Value then
  begin
    Application.MessageBox('Conta Transferência não pode ser igual à Conta Estoque', PChar(Msg_Title), mb_IconStop);
    CONTAAUX_ID.Color := clYellow;
    CONTAAUX_ID.SetFocus;
    exit;
  end;

  Result := True;
end;

procedure TFrmTrans_Transferencia_Estoque.ManutencaoShow(Sender: TObject);
begin
  Set_Campos(False);
  Botoes_Normal;
end;

procedure TFrmTrans_Transferencia_Estoque.QSub_DetailBeforeDelete(DataSet: TDataSet);
begin
  if FrmData.QAcesso.FieldByName('EXCLUSAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para exclusão', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  if QTabela.FieldByName('DT_MOVIMENTO').AsDateTime < FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime then
  begin
    Application.MessageBox('Movimento já encerrado', PChar(Msg_Title), mb_IconStop);
    abort;
  end;

  if Application.MessageBox('Deseja realmente excluir?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = IDNO then
    abort;
end;

procedure TFrmTrans_Transferencia_Estoque.QSub_DetailBeforeEdit(DataSet: TDataSet);
begin
  if FrmData.QAcesso.FieldByName('ALTERACAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para alteração', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  if QTabela.FieldByName('DT_MOVIMENTO').AsDateTime < FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime then
  begin
    Application.MessageBox('Movimento já encerrado', PChar(Msg_Title), mb_IconStop);
    abort;
  end;
end;

procedure TFrmTrans_Transferencia_Estoque.QSub_DetailBeforeInsert(DataSet: TDataSet);
begin
  if QTabela.FieldByName('DT_MOVIMENTO').AsDateTime < FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime then
  begin
    Application.MessageBox('Movimento já encerrado', PChar(Msg_Title), mb_IconStop);
    abort;
  end;
end;

procedure TFrmTrans_Transferencia_Estoque.QSub_DetailBeforePost(DataSet: TDataSet);
begin
  ProdutoSearch;
  TributoSearch;

  if QProduto.IsEmpty then
  begin
    Application.MessageBox('Produto inexistente', PChar(Msg_Title), mb_IconStop);
    Itens.SelectedIndex := 0;
    abort;
  end;

  if (QProduto.FieldByName('LOCALIZACAO_ID').AsInteger = QTabela.FieldByName('LOCALIZACAO_ID').AsInteger) and (QTabela.FieldByName('EMPRESA_ID').AsInteger = QTabela.FieldByName('EMPRESAAUX_ID').AsInteger) then
  begin
    Application.MessageBox('Impossível realizar a transferência. Setores iguais', PChar(Msg_Title), mb_IconStop);
    Itens.SelectedIndex := 0;
    abort;
  end;

  if (QSub_Detail.FieldByName('QUANTIDADE').AsFloat <= 0) or (QSub_Detail.FieldByName('QUANTIDADE').AsFloat > 99999) then
  begin
    Application.MessageBox('Quantidade inválida', PChar(Msg_Title), mb_IconStop);
    Itens.SelectedIndex := 2;
    abort;
  end;

  if QSub_Detail.FieldByName('VR_UNITARIO').AsFloat <= 0 then
  begin
    Application.MessageBox('Vr. Unitário inválido', PChar(Msg_Title), mb_IconStop);
    Itens.SelectedIndex := 3;
    abort;
  end;

  if QSub_Detail.FieldByName('VR_TOTAL').AsFloat <= 0 then
  begin
    Application.MessageBox('Vr. Total inválido', PChar(Msg_Title), mb_IconStop);
    Itens.SelectedIndex := 4;
    abort;
  end;

  if QSub_Detail.State = dsInsert then
  begin
    IQuery.Sql.Clear;
    IQuery.Sql.Add('SELECT * FROM TRANSITENS');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
    IQuery.Sql.Add('ORDER BY SEQUENCIA');

    IQuery.ParamByName('TRANSACAO_ID').AsInteger := QTabela.FieldByName('TRANSACAO_ID').AsInteger;

    IQuery.Prepare;
    IQuery.Open;

    IQuery.Last;

    QSub_Detail.FieldByName('SEQUENCIA').AsInteger := (IQuery.FieldByName('SEQUENCIA').AsInteger + 1);
  end;
  
  QSub_Detail.FieldByName('VR_UNITARIO').AsFloat := RoundTo((QSub_Detail.FieldByName('VR_TOTAL').AsFloat / QSub_Detail.FieldByName('QUANTIDADE').AsFloat), -2);
end;

procedure TFrmTrans_Transferencia_Estoque.QSub_DetailNewRecord(DataSet: TDataSet);
begin
  DataSet['TRANSACAO_ID']   := QTabela.FieldByName('TRANSACAO_ID').AsInteger;
  DataSet['CONTA_ID']       := QTabela.FieldByName('CONTA_ID').AsInteger;
  DataSet['CFOP']           := QTabela.FieldByName('CFOP').AsString;
  DataSet['TP_PROD_SERV']   := 'P';
  DataSet['TRIBUTO_ID']     := 0;
  DataSet['MVA']            := 0;
  DataSet['BASE_CALC_ICMS'] := 0;
  DataSet['ALIQUOTA_ICMS']  := 0;
  DataSet['VR_IPI']         := 0;
  DataSet['QUANTIDADE']     := 0;
  DataSet['VR_UNITARIO']    := 0;
  DataSet['VR_DESCONTO']    := 0;
  DataSet['VR_TOTAL']       := 0;
end;

procedure TFrmTrans_Transferencia_Estoque.Set_Campos(Vazio: Boolean);
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

      QSub_Detail.Close;
      QSub_Detail.ParamByName('TRANSACAO_ID').AsInteger := 0;
      QSub_Detail.Prepare;
      QSub_Detail.Open;
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
        TRxCalcEdit(Temp).Value := QTabela.FieldByName(TRxCalcEdit(Temp).Name).AsFloat;

      QSub_Detail.Close;
      QSub_Detail.ParamByName('TRANSACAO_ID').AsInteger := QTabela.FieldByName('TRANSACAO_ID').AsInteger;
      QSub_Detail.Prepare;
      QSub_Detail.Open;
    end;
  end;

  if QTabela.IsEmpty then
    Itens.Enabled := False
  else
    Itens.Enabled := True;

  DetailSearch('');

  CONDUTA.Text := '20';
  DEPTO.Text   := '07';
  TPCTB.Text   := FrmData.QAcesso.FieldByName('TPCTB').AsString;
end;

procedure TFrmTrans_Transferencia_Estoque.btnCentro_CustoClick(Sender: TObject);
begin
  try
    C_CUSTO_ID.Value := GetConsulta('CCUSTO', 0, 0, StrToInt(C_CUSTO_ID.Text));
  except
    C_CUSTO_ID.Value := GetConsulta('CCUSTO', 0, 0, 0);
  end;
end;

procedure TFrmTrans_Transferencia_Estoque.btnContaAuxClick(Sender: TObject);
begin
  try
    CONTAAUX_ID.Value := GetConsulta('PLANO', 0, 0, 0);
  except

  end;
end;

procedure TFrmTrans_Transferencia_Estoque.btnContaClick(Sender: TObject);
begin
  try
    CONTA_ID.Value := GetConsulta('PLANO', 0, 0, StrToInt(CONTA_ID.Text));
  except
    CONTA_ID.Value := GetConsulta('PLANO', 0, 0, 0);
  end;
end;

procedure TFrmTrans_Transferencia_Estoque.btnDeleteClick(Sender: TObject);
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

  if Existe_Nota(QTabela.FieldByName('TRANSACAO_ID').AsInteger) then
  begin
    Application.MessageBox('Nota Fiscal já foi impressa. Impossível continuar', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  if QTabela.FieldByName('DT_TRANS').AsDateTime <= FrmPrincipal.QEmpresa.FieldByName('DT_ULT_FOLHA').AsDateTime then
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



    QTabela.Close;
    QTabela.Prepare;
    QTabela.Open;
    Set_Campos(False);
    Botoes_Normal;
  end;

  if QTabela.IsEmpty then
  begin
    QEmpresa.Close;
    QConta.Close;
    QCusto.Close;
    QConta_Aux.Close;
    QEmpresa_Destino.Close;
  end;
end;

procedure TFrmTrans_Transferencia_Estoque.btnDiscardClick(Sender: TObject);
begin
  Botoes_Normal;
  Set_Campos(False);

  if QTabela.IsEmpty then
  begin
    QEmpresa.Close;
    QConta.Close;
    QCusto.Close;
    QConta_Aux.Close;
    QEmpresa_Destino.Close;
  end;

  Habilitar(False);
  Operacao := '';

  Consulta.TabVisible := True;
end;

procedure TFrmTrans_Transferencia_Estoque.btnEditClick(Sender: TObject);
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

  if Existe_Nota(QTabela.FieldByName('TRANSACAO_ID').AsInteger) then
  begin
    Application.MessageBox('Nota Fiscal já foi impressa. Impossível continuar', PChar(Msg_Title), mb_IconStop);
    exit;
  end;
  
  Operacao := 'Alterando';
  ID := QTabela.FieldByName('TRANSACAO_ID').AsInteger;
  Botoes_Editing;
  Habilitar(True);
  Itens.Enabled := False;

  Consulta.TabVisible := False;
  
  DT_TRANS.SetFocus;
end;

procedure TFrmTrans_Transferencia_Estoque.btnEmpresaClick(Sender: TObject);
begin
  try
    EMPRESA_ID.Value := GetConsulta('EMPRESAS', 0, 0, StrToInt(EMPRESA_ID.Text));
  except
    EMPRESA_ID.Value := GetConsulta('EMPRESAS', 0, 0, 0);
  end;
end;

procedure TFrmTrans_Transferencia_Estoque.btnEmpresa_DestinoClick(
  Sender: TObject);
begin
  try
    EMPRESAAUX_ID.Value := GetConsulta('EMPRESAS', 0, 0, StrToInt(EMPRESAAUX_ID.Text));
  except
    EMPRESAAUX_ID.Value := GetConsulta('EMPRESAS', 0, 0, 0);
  end;
end;

procedure TFrmTrans_Transferencia_Estoque.btnInsertClick(Sender: TObject);
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
  Itens.Enabled := False;

  QEmpresa.Close;
  QConta.Close;
  QCusto.Close;
  QConta_Aux.Close;
  QEmpresa_Destino.Close;

  DT_TRANS.Date     := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
  DT_MOVIMENTO.Date := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
  EMPRESA_ID.Value  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  AUTORIZ_ID.Value  := FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger;
  CONTA_ID.Value    := FrmPrincipal.Config.FieldByName('CONTA_ESTOQUE').AsInteger;
  CONTAAUX_ID.Value := FrmPrincipal.Config.FieldByName('CONTA_CONSUMO').AsInteger;

  Consulta.TabVisible := False;
  
  DT_TRANS.SetFocus;
end;

procedure TFrmTrans_Transferencia_Estoque.btnLocalizacaoClick(Sender: TObject);
begin
  try
    LOCALIZACAO_ID.Value := GetConsulta('LOCAIS', 0, 0, StrToInt(LOCALIZACAO_ID.Text));
  except
    LOCALIZACAO_ID.Value := GetConsulta('LOCAIS', 0, 0, 0);
  end;
end;

procedure TFrmTrans_Transferencia_Estoque.btnNextClick(Sender: TObject);
begin
  Botoes_Disable;

  if not QTabela.Eof then
  begin
    QTabela.Next;
    Set_Campos(False);
  end;

  Botoes_Normal;
end;

procedure TFrmTrans_Transferencia_Estoque.btnNotaFiscalClick(Sender: TObject);
begin
  if EMPRESA_ID.Value <> EMPRESAAUX_ID.Value then
  begin
    if not QEmpresa_Destino.IsEmpty then
      begin
        Set_Campos(False);
        Botoes_Normal;

      if LeIni(Arq_Ini, 'Sistema', 'Nf. Pré-Impressa') = 'True' then
        Nota_Fiscal(QTabela.FieldByName('TRANSACAO_ID').AsInteger);

      if LeIni(ExtractFilePath(ParamStr(0)) + 'NFe.Ini', 'NFe', 'NFe') = 'True' then
      begin
        if DecryptMsg(FrmPrincipal.Config.FieldByName('VERSAO').AsString, 65) = 'LIGHT' then
          Nota_Fiscal(QTabela.FieldByName('TRANSACAO_ID').AsInteger)
        else
        begin
          IQuery.Sql.Clear;
          IQuery.Sql.Add('SELECT CFOP, COUNT(*)');
          IQuery.Sql.Add('FROM TRANSITENS');
          IQuery.Sql.Add('WHERE');
          IQuery.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
          IQuery.Sql.Add('GROUP BY CFOP');
          IQuery.Sql.Add('ORDER BY 2');

          IQuery.ParamByName('TRANSACAO_ID').AsInteger := QTabela.FieldByName('TRANSACAO_ID').AsInteger;

          IQuery.Prepare;
          IQuery.Open;

          IQuery.Last;

          NFe(QTabela.FieldByName('TRANSACAO_ID').AsInteger,0, IQuery.FieldByName('CFOP').AsString);
        end;
      end
    end
    else
      Application.MessageBox('Informe a Empresa de Destino', PChar(Msg_Title), mb_IconStop);
  end
  else
    Application.MessageBox('Empresa de Destino não pode ser igual à Empresa de Origem', PChar(Msg_Title), mb_IconStop);
end;

procedure TFrmTrans_Transferencia_Estoque.btnPesquisaClick(Sender: TObject);
var
Condicao: String;
begin
  Condicao := GetPesquisa('TRANSFERÊNCIA ESTOQUE');

  if Condicao <> '' then
  begin
    CmdSelectNull := Condicao + ' AND (CONDUTA = :CONDUTA) AND (DEPTO = :DEPTO) AND (TPCTB = :TPCTB) AND (EMPRESA_ID = :EMPRESA_ID)';

    QTabela.ParamByName('CONDUTA').AsString     := '20';
    QTabela.ParamByName('DEPTO').AsString       := '07';
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

procedure TFrmTrans_Transferencia_Estoque.btnPriorClick(Sender: TObject);
begin
  Botoes_Disable;

  if not QTabela.Bof then
  begin
    QTabela.Prior;
    Set_Campos(False);
  end;

  Botoes_Normal;
end;

procedure TFrmTrans_Transferencia_Estoque.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmTrans_Transferencia_Estoque.btnSaveClick(Sender: TObject);
begin
  DetailSearch('');

  if Validacao then
  begin

    if HISTORICO.Text = '' then
      HISTORICO.Text := 'Vr. N. Fiscal nº ' + NUM_DOC.Text;

    if Operacao = 'Inserindo' then
    begin
      Insert;

      CmdSelectNull := 'WHERE (TRANSACAO_ID IS NOT NULL) AND (DT_MOVIMENTO = :DT_MOVIMENTO) AND (CONDUTA = :CONDUTA) AND (DEPTO = :DEPTO) AND (TPCTB = :TPCTB) AND (EMPRESA_ID = :EMPRESA_ID)';
      CmdOrderBy    := 'ORDER BY TRANSACAO_ID';

      QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

      QTabela.ParamByName('DT_MOVIMENTO').AsDateTime := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
      QTabela.ParamByName('CONDUTA').AsString        := '20';
      QTabela.ParamByName('DEPTO').AsString          := '07';
      QTabela.ParamByName('TPCTB').AsString          := FrmData.QAcesso.FieldByName('TPCTB').AsString;
      QTabela.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;

      QTabela.Prepare;
      QTabela.Open;
      QTabela.Last;
    end
    else
      Edit;
    Set_Campos(False);

    if QTabela.IsEmpty then
    begin
      QEmpresa.Close;
      QConta.Close;
      QCusto.Close;
      QConta_Aux.Close;
      QEmpresa_Destino.Close;
    end;

    Habilitar(False);
    Botoes_Normal;

    Operacao := '';
    Consulta.TabVisible := True;

    if (not QSub_Detail.IsEmpty) and (LeIni(Arq_Ini, 'Sistema', 'Carga Automática de Produtos') = 'True') and (FrmPrincipal.QEmpresa.FieldByName('CARGA').AsString = 'SIM') then
      Carga_PDV_Movimento(QTabela.FieldByName('TRANSACAO_ID').AsInteger);
  end;
end;

procedure TFrmTrans_Transferencia_Estoque.DBGrid1DblClick(Sender: TObject);
begin
  Manutencao.Show;
end;

procedure TFrmTrans_Transferencia_Estoque.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Manutencao.Show;
end;

procedure TFrmTrans_Transferencia_Estoque.DBGrid1TitleClick(Column: TColumn);
begin
  CmdOrderBy := 'ORDER BY ' + Column.FieldName;

  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;
  QTabela.Prepare;
  QTabela.Open;
end;

procedure TFrmTrans_Transferencia_Estoque.ItensColEnter(Sender: TObject);
begin
  if QSub_Detail.State in [dsInsert, dsEdit] then
  begin
    ProdutoSearch;
    TributoSearch;

    if (Itens.SelectedField.FieldName = 'quantidade') and (QProduto.IsEmpty) then
      Itens.SelectedIndex := 0;

    if (Itens.SelectedField.FieldName = 'vr_unitario') and (QSub_Detail.FieldByName('QUANTIDADE').AsFloat = 0) then
      Itens.SelectedIndex := 2;

    if (Itens.SelectedField.FieldName = 'vr_total') and (QSub_Detail.FieldByName('VR_UNITARIO').AsFloat = 0) then
      Itens.SelectedIndex := 3;
  end;
end;

procedure TFrmTrans_Transferencia_Estoque.ItensColExit(Sender: TObject);
begin
  if QSub_Detail.State in [dsInsert, dsEdit] then
  begin
    if Itens.SelectedField.FieldName = 'produto_id' then
    begin
      ProdutoSearch;

      if QProduto.IsEmpty then
      begin
        QSub_Detail.FieldByName('DESCRICAO').AsString    := '';
        QSub_Detail.FieldByName('TRIBUTO_ID').AsInteger  := 0;
        QSub_Detail.FieldByName('ALIQUOTA_ICMS').AsFloat := 0;
        QSub_Detail.FieldByName('VR_UNITARIO').AsFloat   := 0;

        Application.MessageBox('Produto inexistente', PChar(Msg_Title), mb_IconStop);

        Itens.SelectedIndex := 0;
      end
      else
      begin
        TributoSearch;

        QSub_Detail.FieldByName('DESCRICAO').AsString    := QProduto.FieldByName('DESCRICAO').AsString;
        QSub_Detail.FieldByName('TRIBUTO_ID').AsInteger  := QProduto.FieldByName('TRIBUTO_ID').AsInteger;
        QSub_Detail.FieldByName('ALIQUOTA_ICMS').AsFloat := QProduto.FieldByName('ALIQUOTA_ICMS').AsFloat;
        QSub_Detail.FieldByName('VR_UNITARIO').AsFloat   := RoundTo(QProduto.FieldByName('CUSTOMEDIO').AsFloat, -2);
        QSub_Detail.FieldByName('CST').AsString          := Copy(QTributo.FieldByName('ORIGEM').AsString, 1, 1) + Copy(QTributo.FieldByName('TRIBUTACAO').AsString, 1, 2);
      end;
    end;

    if (Itens.SelectedField.FieldName = 'vr_unitario') or (Itens.SelectedField.FieldName = 'quantidade') or (Itens.SelectedField.FieldName = 'vr_desconto') then
    begin
      if Itens.SelectedField.FieldName = 'quantidade' then
      begin
        ProdutoSearch;

        if QProduto.FieldbyName('FRACAO_VENDA').AsFloat > 0 then
          QSub_Detail.FieldByName('QUANTIDADE').AsFloat := (QSub_Detail.FieldByName('QUANTIDADE').AsFloat * QProduto.FieldByName('FRACAO_VENDA').AsFloat);
      end;

      QSub_Detail.FieldByName('VR_TOTAL').AsFloat := RoundTo((QSub_Detail.FieldByName('QUANTIDADE').AsFloat * (QSub_Detail.FieldByName('VR_UNITARIO').AsFloat - QSub_Detail.FieldByName('VR_DESCONTO').AsFloat)), -2);
    end;
  end;
end;

procedure TFrmTrans_Transferencia_Estoque.ItensEnter(Sender: TObject);
begin
  Botoes_Disable;
  Consulta.TabVisible := False;
end;

procedure TFrmTrans_Transferencia_Estoque.ItensExit(Sender: TObject);
begin
  if QSub_Detail.State in [dsInsert, dsEdit] then
  begin
    QSub_Detail.Cancel;

  end;

  if FrmData.QAcesso.FieldByName('ALTERACAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para alteração', PChar(Msg_Title), mb_IconStop);
    Botoes_Normal;
    Consulta.TabVisible := True;
    exit;
  end;

  if QTabela.FieldByName('DT_MOVIMENTO').AsDateTime < FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime then
  begin
    Application.MessageBox('Movimento já encerrado', PChar(Msg_Title), mb_IconStop);
    Botoes_Normal;
    Consulta.TabVisible := True;
    exit;
  end;
  
  btnEditClick(Self);

  VALOR.Value := 0;

  QSub_Detail.First;
  while not QSub_Detail.Eof do
  begin
    VALOR.Value := VALOR.Value + QSub_Detail.FieldByName('VR_TOTAL').AsFloat;
    Application.ProcessMessages;
    QSub_Detail.Next;
  end;

  btnSaveClick(Self);
  
  if VALOR.CanFocus then
    VALOR.SetFocus
  else
    Botoes_Normal;  
end;

procedure TFrmTrans_Transferencia_Estoque.ItensKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F4) and (QSub_Detail.State = dsBrowse) and (not QSub_Detail.IsEmpty) then
    QSub_Detail.Delete;

  if (Key = Vk_F7) and ((Itens.SelectedField.FieldName = 'produto_id') or (Itens.SelectedField.FieldName = 'tributo_id')) and (QSub_Detail.State in [dsInsert, dsEdit]) then
  begin
    if Itens.SelectedField.FieldName = 'produto_id' then
      QSub_Detail.FieldByName('PRODUTO_ID').AsInteger := GetConsulta('ESTOQUE', StrToInt(EMPRESA_ID.Text), 0, QSub_Detail.FieldByName('PRODUTO_ID').AsInteger);

    if Itens.SelectedField.FieldName = 'tributo_id' then
      QSub_Detail.FieldByName('TRIBUTO_ID').AsInteger := GetConsulta('TRIBUTOS', 0, 0, QSub_Detail.FieldByName('TRIBUTO_ID').AsInteger);
  end;

  if Key = VK_F9 then
    Perform(Wm_NextDlgCtl, 0, 0);

  if ((Key = Vk_Up) or (Key = Vk_Down)) and (QSub_Detail.State in [dsInsert, dsEdit]) then
    Key := 0;
end;

procedure TFrmTrans_Transferencia_Estoque.ItensKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #46 then
    Key := #44;

  if Key = #13 then
    Keybd_Event(VK_TAB, 0, 0, 0);

  Key := AnsiUpperCase(Key)[1];
end;

procedure TFrmTrans_Transferencia_Estoque.LOCALIZACAO_IDExit(Sender: TObject);
begin
  DetailSearch('Localização');
end;

procedure TFrmTrans_Transferencia_Estoque.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmTrans_Transferencia_Estoque.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (Operacao = 'Inserindo') or (Operacao = 'Alterando') or (QSub_Detail.State in [dsInsert, dsEdit]) then
  begin
    Application.MessageBox('É melhor salvar as alterações antes de continuar', PChar(Msg_Title), mb_IconStop);
    CanClose := False;
  end;
end;

procedure TFrmTrans_Transferencia_Estoque.FormCreate(Sender: TObject);
var
X, Ult_Dia: Integer;
begin
  

  DBGrid1.Columns[0].Width := 54;
  DBGrid1.Columns[1].Width := 76;
  DBGrid1.Columns[2].Width := 77;
  DBGrid1.Columns[3].Width := 78;
  DBGrid1.Columns[4].Width := 72;
  DBGrid1.Columns[5].Width := 331;

  Ult_Dia := StrToInt(Copy(DateToStr(Ult_Dia_Mes(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime)), 1, 2));
  Dias.Tabs.Clear;

  for X := 1 to Ult_Dia do
    Dias.Tabs.Add(IntToStr(X));

  Dias.Tabs.Add('Todos');

  DT_MOVIMENTO.MinDate := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
  DT_MOVIMENTO.MaxDate := StrToDate('31/12/2026');

  Itens.Columns[0].Width := 63;
  Itens.Columns[1].Width := 365;
  Itens.Columns[2].Width := 83;
  Itens.Columns[3].Width := 83;
  Itens.Columns[4].Width := 83;

  CmdSelect     := QTabela.Sql.Text;

  if Id_Trans = 0 then
    CmdSelectNull := 'WHERE (TRANSACAO_ID IS NOT NULL) AND (DT_MOVIMENTO = :DT_MOVIMENTO) AND (CONDUTA = :CONDUTA) AND (DEPTO = :DEPTO) AND (TPCTB = :TPCTB) AND (EMPRESA_ID = :EMPRESA_ID)'
  else
    CmdSelectNull := 'WHERE (TRANSACAO_ID = ' + IntToStr(Id_Trans) + ') AND (CONDUTA = :CONDUTA) AND (DEPTO = :DEPTO) AND (TPCTB = :TPCTB) AND (EMPRESA_ID = :EMPRESA_ID)';

  CmdOrderBy    := 'ORDER BY TRANSACAO_ID';

  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

  if Id_Trans = 0 then
    QTabela.ParamByName('DT_MOVIMENTO').AsDateTime := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;

  QTabela.ParamByName('CONDUTA').AsString        := '20';
  QTabela.ParamByName('DEPTO').AsString          := '07';
  QTabela.ParamByName('TPCTB').AsString          := FrmData.QAcesso.FieldByName('TPCTB').AsString;
  QTabela.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;

  QTabela.Prepare;
  QTabela.Open;
end;

procedure TFrmTrans_Transferencia_Estoque.FormShow(Sender: TObject);
begin
  DBGrid1.SetFocus;
end;

end.


