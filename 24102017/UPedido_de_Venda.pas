unit UPedido_de_Venda;
                                                                      
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ComCtrls, ToolWin, StdCtrls, Grids, DBGrids, Tabs, ExtCtrls,
  DB, IBCustomDataSet, IBQuery, Mask, Buttons, DBCtrls, rxCurrEdit, rxToolEdit,
  IBUpdateSQL, Math, QRCtrls, QuickRpt, RDprint, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet;

type
  TFrmPedido_de_venda = class(TForm)
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
    DT_PEDIDO: TDateEdit;
    EMPRESA_ID: TCurrencyEdit;
    CLIENTE_ID: TCurrencyEdit;
    DataEmpresa: TDataSource;
    DBText1: TDBText;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    DT_MOVIMENTO: TDateEdit;
    Panel3: TPanel;
    Label21: TLabel;
    StatusBar1: TStatusBar;
    btnEmpresa: TSpeedButton;
    btnFornecedor: TSpeedButton;
    VALOR_PRODUTOS: TRxCalcEdit;
    DataSub_Detail: TDataSource;
    Label22: TLabel;
    VALOR: TRxCalcEdit;
    VR_FRETE: TRxCalcEdit;
    Label23: TLabel;
    Label24: TLabel;
    VR_DESCONTO: TRxCalcEdit;
    Label25: TLabel;
    VR_ACRESCIMO: TRxCalcEdit;
    COND_PAGTO: TComboBox;
    btnParcelas: TSpeedButton;
    Dias: TTabSet;
    AUTORIZ_ID: TCurrencyEdit;
    Label4: TLabel;
    NOME: TEdit;
    Label5: TLabel;
    ENDERECO: TEdit;
    Label7: TLabel;
    BAIRRO: TEdit;
    Label9: TLabel;
    MUNICIPIO: TEdit;
    Label8: TLabel;
    ESTADO: TComboBox;
    Label10: TLabel;
    CEP: TMaskEdit;
    btnPesquisa: TBitBtn;
    btnPedido: TBitBtn;
    Pedido: TQuickRep;
    QRBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText15: TQRDBText;
    QRShape2: TQRShape;
    QRLabel18: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape3: TQRShape;
    QRLabel15: TQRLabel;
    QRLabel14: TQRLabel;
    QRSysData1: TQRSysData;
    Cabec: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    DetailBand1: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRBand2: TQRBand;
    QRLabel19: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRShape5: TQRShape;
    QRExpr1: TQRExpr;
    QRLabel4: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;          
    QRLabel1: TQRLabel;
    QRDBText10: TQRDBText;
    Label6: TLabel;
    DT_ENTREGA: TDateEdit;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    DT_SOLICITACAO: TDateEdit;
    Label17: TLabel;
    Status: TComboBox;
    Label18: TLabel;
    Cancelamento: TEdit;
    Label26: TLabel;
    Itens: TDBGrid;
    Solicitante: TEdit;
    Observacao: TMemo;
    RDprint1: TRDprint;
    CheckBox1: TCheckBox;
    Label30: TLabel;
    Funcionario_id: TCurrencyEdit;
    btnFuncionario: TSpeedButton;
    DBText3: TDBText;
    DataFuncionario: TDataSource;
    TP_PEDIDO: TCurrencyEdit;
    btnLog: TButton;
    FINALIZADORA_ID: TDBLookupComboBox;
    DataFinalizadora: TDataSource;
    Label32: TLabel;
    DBText4: TDBText;
    NUMERO: TEdit;
    QVencimento: TFDQuery;
    QRel: TFDQuery;
    QLimite: TFDQuery;
    QFinalizadora: TFDQuery;
    QFuncionario: TFDQuery;
    QUpdate: TFDQuery;
    QTributo: TFDQuery;
    QProduto: TFDQuery;
    QCliente: TFDQuery;
    QSub_Detail: TFDQuery;
    QEmpresa: TFDQuery;
    IQuery: TFDQuery;
    QTabela: TFDQuery;
    USql_PedItens: TFDUpdateSQL;
    QRLabel5: TQRLabel;
    QRDBText11: TQRDBText;
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
    procedure btnFornecedorClick(Sender: TObject);
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
    procedure DiasClick(Sender: TObject);
    procedure btnParcelasClick(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ConsultaShow(Sender: TObject);
    procedure DT_PEDIDOKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnPedidoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure QSub_DetailBeforeEdit(DataSet: TDataSet);
    procedure DT_PEDIDOEnter(Sender: TObject);
    procedure QSub_DetailBeforeInsert(DataSet: TDataSet);
    procedure StatusChange(Sender: TObject);
    procedure RDprint1NewPage(Sender: TObject; Pagina: Integer);
    procedure RDprint1BeforeNewPage(Sender: TObject; Pagina: Integer);
    procedure btnFuncionarioClick(Sender: TObject);
    procedure Funcionario_idExit(Sender: TObject);
    procedure btnLogClick(Sender: TObject);
    procedure COND_PAGTOChange(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure QSub_DetailAfterOpen(DataSet: TDataSet);
    procedure QTabelaAfterOpen(DataSet: TDataSet);
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
    Procedure Calculo_Rodape;
  end;

var
  FrmPedido_de_venda: TFrmPedido_de_venda;
  Operacao: String;
  ID,Pagina,Linha,Linha2,linha3: Integer;
  Desc_por:Real;
  Qtd:Double;

implementation

uses
  UPrincipal, UData, UConsulta, UParcelas, UPesquisa,UGerente;

{$R *.dfm}


procedure TFrmPedido_de_venda.Calculo_Rodape;
var
soma_rateio,Ult_Valor ,Per_Rateio: Real;
Ult_Produto :Integer;

begin
  IQuery.Sql.Clear;
  IQuery.Sql.Add('SELECT SUM((VR_UNITARIO * QUANTIDADE)) VR_TOTAL');
  IQuery.Sql.Add('FROM PEDITENS');
  IQuery.Sql.Add('WHERE');
  IQuery.Sql.Add('(PEDIDO_ID = :PEDIDO_ID)');

  IQuery.ParamByName('PEDIDO_ID').AsInteger := QTabela.FieldByName('PEDIDO_ID').AsInteger;

  IQuery.Prepare;
  IQuery.Open;

  Soma_Rateio := 0;

  if VR_DESCONTO.Value > 0 then
  begin
    Per_Rateio := RoundTo(((VR_DESCONTO.Value * 100) / IQuery.FieldByName('VR_TOTAL').AsFloat), -4);

    QSub_Detail.First;
    while not QSub_Detail.Eof do
    begin
      QUpdate.Sql.Clear;
      QUpdate.Sql.Add('UPDATE PEDITENS SET DESC_RODAPE = :DESC_RODAPE');
      QUpdate.Sql.Add('WHERE');
      QUpdate.Sql.Add('(PEDIDO_ID = :PEDIDO_ID)');
      QUpdate.Sql.Add('AND (PRODUTO_ID = :PRODUTO_ID)');

      QUpdate.ParamByName('DESC_RODAPE').AsFloat    := RoundTo((((QSub_Detail.FieldByName('VR_UNITARIO').AsFloat * QSub_Detail.FieldByName('QUANTIDADE').AsFloat) * Per_Rateio) / 100), -2);
      QUpdate.ParamByName('PEDIDO_ID').AsInteger := QTabela.FieldByName('PEDIDO_ID').AsInteger;
      QUpdate.ParamByName('PRODUTO_ID').AsInteger   := QSub_Detail.FieldByName('PRODUTO_ID').AsInteger;

      QUpdate.Prepare;
      QUpdate.ExecSql;



      Soma_Rateio := Soma_Rateio + RoundTo((((QSub_Detail.FieldByName('VR_UNITARIO').AsFloat * QSub_Detail.FieldByName('QUANTIDADE').AsFloat) * Per_Rateio) / 100), -2);
      Ult_Valor   := RoundTo((((QSub_Detail.FieldByName('VR_UNITARIO').AsFloat * QSub_Detail.FieldByName('QUANTIDADE').AsFloat) * Per_Rateio) / 100), -2);
      Ult_Produto := QSub_Detail.FieldByName('PRODUTO_ID').AsInteger;

      Application.ProcessMessages;
      QSub_Detail.Next;
    end;
  end
  else
  begin
    QUpdate.Sql.Clear;
    QUpdate.Sql.Add('UPDATE PEDITENS SET DESC_RODAPE = 0');
    QUpdate.Sql.Add('WHERE');
    QUpdate.Sql.Add('(PEDIDO_ID = :PEDIDO_ID)');

    QUpdate.ParamByName('PEDIDO_ID').AsInteger := QTabela.FieldByName('PEDIDO_ID').AsInteger;

    QUpdate.Prepare;
    QUpdate.ExecSql;


  end;

  if (Soma_Rateio > 0) and (VR_DESCONTO.Value <> Soma_Rateio) then
  begin
    QUpdate.Sql.Clear;
    QUpdate.Sql.Add('UPDATE PEDITENS SET DESC_RODAPE = :DESC_RODAPE');
    QUpdate.Sql.Add('WHERE');
    QUpdate.Sql.Add('(PEDIDO_ID = :PEDIDO_ID)');
    QUpdate.Sql.Add('AND (PRODUTO_ID = :PRODUTO_ID)');

    QUpdate.ParamByName('DESC_RODAPE').AsFloat    := (VR_DESCONTO.Value - (Soma_Rateio - Ult_Valor));
    QUpdate.ParamByName('PEDIDO_ID').AsInteger    := QTabela.FieldByName('PEDIDO_ID').AsInteger;
    QUpdate.ParamByName('PRODUTO_ID').AsInteger   := Ult_Produto;

    QUpdate.Prepare;
    QUpdate.ExecSql;


  end;

  Soma_Rateio := 0;

End;

procedure TFrmPedido_de_venda.CLIENTE_IDExit(Sender: TObject);
begin
  DetailSearch('Cliente');
end;

procedure TFrmPedido_de_venda.COND_PAGTOChange(Sender: TObject);
begin
if (Operacao = 'Alterando') or (Operacao = 'Inserindo') then
  begin
    if COND_PAGTO.Text = 'A VISTA' then
    begin
      Finalizadora_id.KeyValue := 1;
      Finalizadora_id.Enabled := False;

    end;
    if COND_PAGTO.Text = 'A PRAZO' then
    begin
      Finalizadora_id.Enabled := False;
      Finalizadora_id.KeyValue := 2;
      DetailSearch('');
    end;
    if Cond_pagto.Text = 'CARTAO' then
       Finalizadora_id.Enabled := True;
  end;
end;

procedure TFrmPedido_de_venda.Funcionario_idExit(Sender: TObject);
begin
DetailSearch('Funcionario');
end;

procedure TFrmPedido_de_venda.Botoes_Disable;
begin
  btnPrior.Enabled      := False;
  btnNext.Enabled       := False;
  btnInsert.Enabled     := False;
  btnEdit.Enabled       := False;
  btnDelete.Enabled     := False;
  btnSave.Enabled       := False;
  btnDiscard.Enabled    := False;
  btnRetorna.Enabled    := False;
  btnEmpresa.Enabled    := False;
  btnFornecedor.Enabled := False;
  btnParcelas.Enabled   := False;
  btnPesquisa.Enabled   := False;
  btnPedido.Enabled     := False;
  btnFuncionario.Enabled := False;
end;

procedure TFrmPedido_de_venda.Botoes_Editing;
begin
  btnPrior.Enabled       := False;
  btnNext.Enabled        := False;
  btnInsert.Enabled      := False;
  btnEdit.Enabled        := False;
  btnDelete.Enabled      := False;
  btnSave.Enabled        := True;
  btnDiscard.Enabled     := True;
  btnRetorna.Enabled     := False;
  btnEmpresa.Enabled     := True;
  btnFornecedor.Enabled  := True;
  btnParcelas.Enabled    := False;
  btnPesquisa.Enabled    := False;
  btnPedido.Enabled      := False;
  btnFuncionario.Enabled := True;
end;

procedure TFrmPedido_de_venda.Botoes_Normal;
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

  if (not QTabela.IsEmpty) and (not QFuncionario.IsEmpty) then
  begin
    btnEdit.Enabled   := True;
    btnDelete.Enabled := True;
    btnPedido.Enabled := True;
    btnlog.Enabled    := True;
  end
  else
  begin
    btnEdit.Enabled   := False;
    btnDelete.Enabled := False;
    btnPedido.Enabled := False;
    btnlog.Enabled    := False;
  end;

  if QTabela.FieldByName('COND_PAGTO').AsString = 'A PRAZO' then
    btnParcelas.Enabled := True
  else
    btnParcelas.Enabled := False;

  btnSave.Enabled        := False;
  btnDiscard.Enabled     := False;
  btnRetorna.Enabled     := True;
  btnEmpresa.Enabled     := False;
  btnFornecedor.Enabled  := False;
  btnPesquisa.Enabled    := True;
  btnFuncionario.Enabled := False;
end;

procedure TFrmPedido_de_venda.DetailSearch(Tabela: String);
begin
  if ((Tabela = '') or (Tabela = 'Empresa')) and (EMPRESA_ID.Text <> '') then
  begin
    QEmpresa.Close;
    QEmpresa.ParamByName('EMPRESA_ID').AsInteger := StrToInt(EMPRESA_ID.Text);
    QEmpresa.Prepare;
    QEmpresa.Open;
  end;

  if ((Tabela = '') or (Tabela = 'Funcionario')) and (FUNCIONARIO_ID.Text <> '') then
  begin
    QFuncionario.Close;
    QFuncionario.ParamByName('FUNCIONARIO_ID').AsInteger := StrToInt(FUNCIONARIO_ID.Text);
    QFuncionario.Prepare;
    QFuncionario.Open;
  end;

  if ((Tabela = '') or (Tabela = 'Cliente')) and (Cliente_ID.Text <> '') then
  begin
    QCliente.Close;
    QCliente.ParamByName('CLIENTE_ID').AsInteger := StrToInt(Cliente_ID.Text);
    QCliente.Prepare;
    QCliente.Open;

    if not QCliente.IsEmpty then
    begin
      NOME.Text      := Copy(QCliente.FieldByName('NOME').AsString,1,50);
      ENDERECO.Text  := Copy(QCliente.FieldByName('ENDERECO').AsString,1,40);
      Numero.Text    := QCliente.FieldByName('NUMERO').AsString;
      BAIRRO.Text    := Copy(QCliente.FieldByName('BAIRRO').AsString,1,20);
      MUNICIPIO.Text := QCliente.FieldByName('MUNICIPIO').AsString;
      ESTADO.Text    := QCliente.FieldByName('ESTADO').AsString;
      CEP.Text       := QCliente.FieldByName('CEP').AsString;
    end;
  end;
end;

procedure TFrmPedido_de_venda.DiasClick(Sender: TObject);
begin
  if Dias.TabIndex <> (Dias.Tabs.Count - 1) then
  begin
    CmdSelectNull := 'WHERE (PEDIDO_ID IS NOT NULL) AND (TP_PEDIDO = 1) AND (DT_MOVIMENTO = :DT_MOVIMENTO) AND (EMPRESA_ID = :EMPRESA_ID)';
    CmdOrderBy    := 'ORDER BY PEDIDO_ID';

    QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

    QTabela.ParamByName('DT_MOVIMENTO').AsDateTime := StrToDate(StrZero(IntToStr(Dias.TabIndex + 1), 2, 0) + '/' + Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 4, 7));
    QTabela.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  end
  else
  begin
    CmdSelectNull := 'WHERE (PEDIDO_ID IS NOT NULL) AND (TP_PEDIDO = 1) AND (DT_MOVIMENTO <= :DT_MOVIMENTO) AND (EMPRESA_ID = :EMPRESA_ID)';
    CmdOrderBy    := 'ORDER BY PEDIDO_ID';

    QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

    QTabela.ParamByName('DT_MOVIMENTO').AsDateTime := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
    QTabela.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  end;

  QTabela.Open;
  Botoes_Normal;
end;

procedure TFrmPedido_de_venda.DT_PEDIDOEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmPedido_de_venda.DT_PEDIDOKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmPedido_de_venda.Habilitar(Status: Boolean);
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

    if Temp is TComboBox then
      TComboBox(Temp).Enabled := Status;

    if Temp is TCurrencyEdit then
      TCurrencyEdit(Temp).Enabled := Status;

    if Temp is TRxCalcEdit then
      TRxcalcEdit(Temp).Enabled := Status;

    if Temp is TMemo then
      TMemo(Temp).Enabled := Status;

    if Temp is TDBLookupComboBox then
      TDBLookupComboBox(Temp).Enabled := Status;
  end;
end;

procedure TFrmPedido_de_venda.Insert;
var
I: Integer;
Temp: TComponent;
Sql, Par: String;
begin
  Sql := 'INSERT INTO PEDIDOS(';
  Par := '';

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
    begin
      if Sql = 'INSERT INTO PEDIDOS(' then
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
      if Sql = 'INSERT INTO PEDIDOS(' then
        Sql := Sql + TMaskEdit(Temp).Name
      else
        Sql := Sql + ', ' + TMaskEdit(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TMaskEdit(Temp).Name
      else
        Par := Par + ', :' + TMaskEdit(Temp).Name;
    end;

    if (Temp is TDateEdit) AND (TDateEdit(Temp).Text <> '  /  /    ')  then
    begin
      if Sql = 'INSERT INTO PEDIDOS(' then
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
      if Sql = 'INSERT INTO PEDIDOS(' then
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
      if Sql = 'INSERT INTO PEDIDOS(' then
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
      if Sql = 'INSERT INTO PEDIDOS(' then
        Sql := Sql + TRxCalcEdit(Temp).Name
      else
        Sql := Sql + ', ' + TRxCalcEdit(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TRxcalcEdit(Temp).Name
      else
        Par := Par + ', :' + TRxCalcEdit(Temp).Name;
    end;

    if Temp is TMemo then
    begin
      if Sql = 'INSERT INTO PEDIDOS(' then
        Sql := Sql + TMemo(Temp).Name
      else
        Sql := Sql + ', ' + TMemo(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TMemo(Temp).Name
      else
        Par := Par + ', :' + TMemo(Temp).Name;
    end;

  if Temp is TDBLookupComboBox then
    begin
      if Sql = 'INSERT INTO PEDIDOS(' then
        Sql := Sql + TDBLookupComboBox(Temp).Name
      else
        Sql := Sql + ', ' + TDBLookupComboBox(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TDBLookupComboBox(Temp).Name
      else
        Par := Par + ', :' + TDBLookupComboBox(Temp).Name;
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
      IQuery.ParamByName(TDateEdit(Temp).Name).AsDateTime := TDateEdit(Temp).Date;

    if Temp is TComboBox then
      IQuery.ParamByName(TComboBox(Temp).Name).AsString := TComboBox(Temp).Text;

    if Temp is TCurrencyEdit then
      IQuery.ParamByName(TCurrencyEdit(Temp).Name).AsFloat := TCurrencyEdit(Temp).Value;

    if Temp is TRxCalcEdit then
      IQuery.ParamByName(TRxCalcEdit(Temp).Name).AsFloat := TRxCalcEdit(Temp).Value;

    if Temp is TMemo then
      IQuery.ParamByName(TMemo(Temp).Name).AsByteStr := TMemo(Temp).Text;

    if Temp is TDBLookupComboBox then
      IQuery.ParamByName(TDBLookupComboBox(Temp).Name).AsInteger := QFinalizadora.FieldByName('FINALIZADORA_ID').AsInteger;
  end;

  IQuery.Prepare;
  IQuery.ExecSql;


  Habilitar(False);
end;

procedure TFrmPedido_de_venda.Edit;
var
I: Integer;
Temp: TComponent;
Sql: String;
begin
  Sql := 'UPDATE PEDIDOS SET ';

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
    begin
      if Sql = 'UPDATE PEDIDOS SET ' then
        Sql := Sql + TEdit(Temp).Name + ' = :' + TEdit(Temp).Name
      else
        Sql := Sql + ', ' + TEdit(Temp).Name + ' = :' + TEdit(Temp).Name;
    end;

    if Temp is TMaskEdit then
    begin
      if Sql = 'UPDATE PEDIDOS SET ' then
        Sql := Sql + TMaskEdit(Temp).Name + ' = :' + TMaskEdit(Temp).Name
      else
        Sql := Sql + ', ' + TMaskEdit(Temp).Name + ' = :' + TMaskEdit(Temp).Name;
    end;

    if (Temp is TDateEdit) AND (TDateEdit(Temp).Text <> '  /  /    ')  then
    begin
      if Sql = 'UPDATE PEDIDOS SET ' then
        Sql := Sql + TDateEdit(Temp).Name + ' = :' + TDateEdit(Temp).Name
      else
        Sql := Sql + ', ' + TDateEdit(Temp).Name + ' = :' + TDateEdit(Temp).Name;
    end;

    if Temp is TComboBox then
    begin
      if Sql = 'UPDATE PEDIDOS SET ' then
        Sql := Sql + TComboBox(Temp).Name + ' = :' + TComboBox(Temp).Name
      else
        Sql := Sql + ', ' + TComboBox(Temp).Name + ' = :' + TComboBox(Temp).Name;
    end;

    if Temp is TCurrencyEdit then
    begin
      if Sql = 'UPDATE PEDIDOS SET ' then
        Sql := Sql + TCurrencyEdit(Temp).Name + ' = :' + TCurrencyEdit(Temp).Name
      else
        Sql := Sql + ', ' + TCurrencyEdit(Temp).Name + ' = :' + TCurrencyEdit(Temp).Name;
    end;

    if Temp is TRxCalcEdit then
    begin
      if Sql = 'UPDATE PEDIDOS SET ' then
        Sql := Sql + TRxCalcEdit(Temp).Name + ' = :' + TRxCalcEdit(Temp).Name
      else
        Sql := Sql + ', ' + TRxCalcEdit(Temp).Name + ' = :' + TRxCalcEdit(Temp).Name;
    end;

    if Temp is TMemo then
    begin
      if Sql = 'UPDATE PEDIDOS SET ' then
        Sql := Sql + TMemo(Temp).Name + ' = :' + TMemo(Temp).Name
      else
        Sql := Sql + ', ' + TMemo(Temp).Name + ' = :' + TMemo(Temp).Name;
    end;

  if Temp is TDBLookupComboBox then
    begin
      if Sql = 'UPDATE PEDIDOS SET ' then
        Sql := Sql + TDBLookupComboBox(Temp).Name + ' = :' + TDBLookupComboBox(Temp).Name
      else
        Sql := Sql + ', ' + TDBLookupComboBox(Temp).Name + ' = :' + TDBLookupComboBox(Temp).Name;
    end;
  end;

  Sql := Sql + ' WHERE (PEDIDO_ID = :ID)';

  

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
      IQuery.ParamByName(TDateEdit(Temp).Name).AsDateTime := TDateEdit(Temp).Date;

    if Temp is TComboBox then
      IQuery.ParamByName(TComboBox(Temp).Name).AsString := TComboBox(Temp).Text;

    if Temp is TCurrencyEdit then
      IQuery.ParamByName(TCurrencyEdit(Temp).Name).AsFloat := TCurrencyEdit(Temp).Value;

    if Temp is TRxCalcEdit then
      IQuery.ParamByName(TRxCalcEdit(Temp).Name).AsFloat := TRxCalcEdit(Temp).Value;

    if Temp is TMemo then
      IQuery.ParamByName(TMemo(Temp).Name).AsByteStr := TMemo(Temp).Text;

    if Temp is TDBLookupComboBox then
      IQuery.ParamByName(TDBLookupComboBox(Temp).Name).AsInteger := QFinalizadora.FieldByName('FINALIZADORA_ID').AsInteger;  

  end;

  IQuery.ParamByName('ID').AsInteger := QTabela.FieldByName('PEDIDO_ID').AsInteger;

  IQuery.Prepare;
  IQuery.ExecSql;



  QTabela.Close;
  QTabela.Open;
  QTabela.Locate('PEDIDO_ID', ID, [loCaseInsensitive]);
  Habilitar(False);
end;

procedure TFrmPedido_de_venda.ProdutoSearch;
begin
  QProduto.Close;

  QProduto.ParamByName('PRODUTO_ID').AsInteger := QSub_Detail.FieldByName('PRODUTO_ID').AsInteger;
  QProduto.ParamByName('EMPRESA_ID').AsInteger := StrToInt(EMPRESA_ID.Text);

  QProduto.Prepare;
  QProduto.Open;
end;

procedure TFrmPedido_de_venda.TributoSearch;
begin
  QTributo.Close;
  QTributo.ParamByName('TRIBUTO_ID').AsInteger := QSub_Detail.FieldByName('TRIBUTO_ID').AsInteger;
  QTributo.Prepare;
  QTributo.Open;
end;

procedure TFrmPedido_de_venda.EMPRESA_IDExit(Sender: TObject);
begin
  DetailSearch('Empresa');
end;

procedure TFrmPedido_de_venda.EMPRESA_IDKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = EMPRESA_ID) then
    btnEmpresaClick(Self);

  if (Key = Vk_F7) and (Sender = Cliente_ID) then
    btnFornecedorClick(Self);

  if (Key = Vk_F7) and (Sender = Funcionario_ID) then
    btnFuncionarioClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

function TFrmPedido_de_venda.Validacao: Boolean;
begin
  Result := False;

  Cliente_ID.Color := clWindow;
  EMPRESA_ID.Color    := clWindow;
  COND_PAGTO.Color    := clWindow;
  ESTADO.Color        := clWindow;

  if COND_PAGTO.Text = 'A PRAZO' then
  begin
    if QCliente.IsEmpty then
    begin
      Application.MessageBox('Cliente inexistente', PChar(Msg_Title), mb_IconSTop);
      CLIENTE_ID.Color := clYellow;
      CLIENTE_ID.SetFocus;
      exit;
    end
    else
    begin
      if QCliente.FieldByName('BLOQUEADO').AsString = 'SIM' then
      begin
        Application.MessageBox('Cliente bloqueado', PChar(Msg_Title), mb_IconSTop);
        CLIENTE_ID.Color := clYellow;
        CLIENTE_ID.SetFocus;
        exit;
      end;

      if QCliente.FieldByName('LIMITE').AsFloat > 0 then
      begin
        QLimite.Close;
        QLimite.ParamByName('CLIENTE_ID').AsInteger := StrToInt(CLIENTE_ID.Text);
        QLimite.ParamByName('DT_VENCIMENTO').AsDateTime := StrToDate('31/12/2026');
        QLimite.Prepare;
        QLimite.Open;

        if (QLimite.FieldByName('DEBITO').AsFloat + VALOR.Value) > QCliente.FieldByName('LIMITE').AsFloat then
        begin
          Application.MessageBox('Valor acima do limite do cliente', PChar(Msg_Title), mb_IconStop);
          VALOR.Color := clYellow;
          VALOR.SetFocus;
          exit;
        end;
      end;
    end;

    if not Existe_Plano(QCliente.FieldByName('COD_CONTABIL').AsString) then
    begin
      Application.MessageBox('Cliente inexistente no plano de contas. Gere o plano de contas novamente', PChar(Msg_Title), mb_IconStop);
      CLIENTE_ID.Color := clYellow;
      CLIENTE_ID.SetFocus;
      exit;
    end;
    if FrmPrincipal.Config.FieldByName('CARENCIA').AsInteger > 0 then
    Begin
      QVencimento.Close;
      QVencimento.ParamByName('CLIENTE_ID').AsInteger := StrToInt(CLIENTE_ID.Text);
      QVencimento.ParamByName('DT_VENCIMENTO').AsDateTime := Date - FrmPrincipal.Config.FieldByName('CARENCIA').AsInteger;
      QVencimento.Prepare;
      QVencimento.Open;

      if not QVencimento.IsEmpty then
      Begin
       Application.MessageBox('Cliente Possui Débitos vencidos e não quitados favor verificar.', PChar(Msg_Title), mb_IconStop);
       CLIENTE_ID.Color := clYellow;
       CLIENTE_ID.SetFocus;
       exit;
      End;
    End;
  end;

  if QEmpresa.IsEmpty then
  begin
    Application.MessageBox('Empresa inexistente', PChar(Msg_Title), mb_IconStop);
    EMPRESA_ID.Color := clYellow;
    EMPRESA_ID.SetFocus;
    exit;
  end;

  if (COND_PAGTO.Text <> 'A VISTA') and (COND_PAGTO.Text <> 'A PRAZO') then
  begin
    Application.MessageBox('Cond. de Pagto. inválida', PChar(Msg_Title), mb_IconStop);
    COND_PAGTO.Color := clYellow;
    COND_PAGTO.SetFocus;
    exit;
  end;

  if not ChecaEstado(ESTADO.Text) then
  begin
    Application.MessageBox('Estado inválido', PChar(Msg_Title), mb_IconStop);
    ESTADO.Color := clYellow;
    ESTADO.SetFocus;
    exit;
  end;

   if QFuncionario.IsEmpty then
  begin
    Application.MessageBox('Vendedor inexistente', PChar(Msg_Title), mb_IconStop);
    Funcionario_ID.Color := clYellow;
    Funcionario_ID.SetFocus;
    exit;
  end;

 if Status.Text = 'CANCELADO' then
  begin
    if Cancelamento.Text = '' then
    begin
      Application.MessageBox('Favor preencher o motivo do Cancelamento!', PChar(Msg_Title), mb_IconSTop);
      Cancelamento.Color := clYellow;
      Cancelamento.SetFocus;
      exit;
    end;
  end;
  if FrmPrincipal.Config.FieldByName('DESC_MAXIMO').AsFloat > 0 then
  begin
    if QSub_Detail.FieldByName('VR_DESCONTO').AsFloat > ((QSub_Detail.FieldByName('VR_UNITARIO').AsFloat * FrmPrincipal.Config.FieldByName('DESC_MAXIMO').AsFloat) / 100) then
    begin
      Application.MessageBox('Vr. Desconto maior do que o valor permitido', PChar(Msg_Title), mb_IconStop);
      VR_DESCONTO.Color := clYellow;
      VR_DESCONTO.SetFocus;
      abort;
    end;
  end;
  if FrmPrincipal.Config.FieldByName('DESC_ORC_USU').AsString = 'True' then
  Begin
  Desc_por := 0;
    if Vr_Desconto.Value > 0 then
       Desc_Por := RoundTo(((Vr_Desconto.Value * 100) / (Valor_Produtos.Value)), -2)
    else
       Desc_Por  := 0;

        IQuery.SQL.Clear;
        IQuery.SQL.Add('SELECT * FROM OPERADORES WHERE NOME LIKE :NOME');
        IQuery.ParamByName('NOME').AsString :=  COPY(QFuncionario.FieldByName('NOME').AsString,1,19) + '%';
        IQuery.Prepare;
        IQuery.Open;

   { if (IQuery.FieldByName('DESCONTO_MAX_SUBTOTAL').AsFloat = 0) and (Vr_Desconto.Value > 0) then
    begin
        Application.MessageBox(Pchar('Vr. Desconto máximo permitido para ' +  IQuery.FieldByName('NOME').AsString + ' ' + ': '+ IQuery.FieldByName('DESCONTO_MAX_SUBTOTAL').AsString +'%') , PChar(Msg_Title), mb_IconStop);
        VR_DESCONTO.Color := clYellow;
        VR_DESCONTO.SetFocus;
        abort;
    end; }

      if IQuery.FieldByName('DESCONTO_MAX_SUBTOTAL').AsFloat >= 0 then
      begin
        if Vr_Desconto.Value > (((Valor_produtos.Value) * IQuery.FieldByName('DESCONTO_MAX_SUBTOTAL').AsFloat) / 100) then
        begin
          Application.MessageBox(Pchar('Vr. Desconto máximo permitido para ' +  IQuery.FieldByName('NOME').AsString + ' ' + ': '+ IQuery.FieldByName('DESCONTO_MAX_SUBTOTAL').AsString +'%') , PChar(Msg_Title), mb_IconStop);

          if FrmGerente = Nil then
          begin
            Application.CreateForm(TFrmGerente, FrmGerente);
            try
              if FrmGerente.ShowModal = mrOK then
               begin
                if Desc_Por > FrmGerente.QOperador.FieldByName('DESCONTO_MAX_SUBTOTAL').AsFloat then
                begin
                 Application.MessageBox('Desconto acima do máximo permitido', 'Pedido de Venda', MB_IconStop + MB_OK);
                 VR_DESCONTO.Color := clYellow;
                 VR_DESCONTO.SetFocus;
                 Exit;
                end;
                Result := True;
              end
              else
                VR_DESCONTO.Color := clYellow;
                VR_DESCONTO.SetFocus;
                Exit;
            finally

            end;
          end
          else
          begin
            if FrmGerente.ShowModal = mrOK then
            begin
              if Desc_Por > FrmGerente.QOperador.FieldByName('DESCONTO_MAX_SUBTOTAL').AsFloat then
              begin
                Application.MessageBox('Desconto acima do máximo permitido', 'Orçamento', MB_IconStop + MB_OK);
                VR_DESCONTO.Color := clYellow;
                VR_DESCONTO.SetFocus;
                Exit;
              end;
              Result :=  True;
            end
            else
              VR_DESCONTO.Color := clYellow;
              VR_DESCONTO.SetFocus;
              Exit;
          end;
        end;
      end;
  End;
  Result := True;
end;

procedure TFrmPedido_de_venda.ManutencaoShow(Sender: TObject);
begin
  Set_Campos(False);
  Botoes_Normal;
  QFinalizadora.Open;
  Finalizadora_id.KeyValue := QTabela.FieldByName('FINALIZADORA_ID').AsInteger;
  if Status.Text = 'CANCELADO' then
  Begin
  Label18.Visible := True;
  Cancelamento.Visible := True;
  End
  Else
  Begin
  Label18.Visible := False;
  Cancelamento.Visible := False;
  End;
end;

procedure TFrmPedido_de_venda.QSub_DetailAfterOpen(DataSet: TDataSet);
begin
TFloatField(QSub_Detail.FieldByName('VR_DESCONTO')).DisplayFormat := '#,##0.00';
TFloatField(QSub_Detail.FieldByName('VR_TOTAL')).DisplayFormat    := '#,##0.00';
TFloatField(QSub_Detail.FieldByName('QUANTIDADE')).DisplayFormat  := '#,##0.00';
TFloatField(QSub_Detail.FieldByName('VR_UNITARIO')).DisplayFormat := '#,##0.00';
end;

procedure TFrmPedido_de_venda.QSub_DetailBeforeDelete(DataSet: TDataSet);
begin
  if FrmData.QAcesso.FieldByName('EXCLUSAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para exclusão', PChar(Msg_Title), mb_IconStop);
    abort;
  end;

  if (QTabela.FieldByName('DT_MOVIMENTO').AsDateTime < FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime) then
  begin
    Application.MessageBox('Movimento já encerrado', PChar(Msg_Title), mb_IconStop);
    abort;
  end;

  if QTabela.FieldByName('TRANSACAO_ID').AsInteger > 0 then
  begin
    Application.MessageBox(PChar('Pedido fechado na transação ' + QTabela.FieldByName('TRANSACAO_ID').AsString), PChar(Msg_Title), mb_IconStop);
    abort;
  end;

  if Application.MessageBox('Deseja realmente excluir?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = IDNO then
    abort;
end;

procedure TFrmPedido_de_venda.QSub_DetailBeforeEdit(DataSet: TDataSet);
begin

  if FrmData.QAcesso.FieldByName('ALTERACAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para alteração', PChar(Msg_Title), mb_IconStop);
    abort;
  end;

  if (QTabela.FieldByName('DT_MOVIMENTO').AsDateTime < FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime) then
  begin
    Application.MessageBox('Movimento já encerrado', PChar(Msg_Title), mb_IconStop);
    abort;
  end;

  if QTabela.FieldByName('TRANSACAO_ID').AsInteger > 0 then
  begin
    Application.MessageBox(PChar('Pedido fechado na transação ' + QTabela.FieldByName('TRANSACAO_ID').AsString), PChar(Msg_Title), mb_IconStop);
    abort;
  end;
Qtd := QSub_Detail.FieldByName('QUANTIDADE').AsFloat;
end;

procedure TFrmPedido_de_venda.QSub_DetailBeforeInsert(DataSet: TDataSet);
begin
  if (QTabela.FieldByName('DT_MOVIMENTO').AsDateTime < FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime) then
  begin
    Application.MessageBox('Movimento já encerrado', PChar(Msg_Title), mb_IconStop);
    abort;
  end;

  if QTabela.FieldByName('TRANSACAO_ID').AsInteger > 0 then
  begin
    Application.MessageBox(PChar('Pedido fechado na transação ' + QTabela.FieldByName('TRANSACAO_ID').AsString), PChar(Msg_Title), mb_IconStop);
    abort;
  end;
Qtd := 0;
end;

procedure TFrmPedido_de_venda.QSub_DetailBeforePost(DataSet: TDataSet);
var
Cst: String;
begin

  ProdutoSearch;
  TributoSearch;

  if QProduto.IsEmpty then
  begin
    Application.MessageBox('Produto inexistente', PChar(Msg_Title), mb_IconStop);
    Itens.SelectedIndex := 0;
    abort;
  end;


  if (LeIni(Arq_Ini, 'Sistema', 'Permitir Estoque Negativo') = 'False') then
  begin
    if QSub_Detail.FieldByName('QUANTIDADE').AsFloat > (QProduto.FieldByName('QUANTIDADE_C').AsFloat + Qtd) then
    begin
      Application.MessageBox('Produto com estoque insuficiente', PChar(Msg_Title), MB_IconStop);
      abort;
    end;
  end;


  if (QSub_Detail.FieldByName('QUANTIDADE').AsFloat <= 0) or (QSub_Detail.FieldByName('QUANTIDADE').AsFloat > 99999) then
  begin
    Application.MessageBox('Quantidade inválida', PChar(Msg_Title), mb_IconStop);
    Itens.SelectedIndex := 6;
    abort;
  end;

  if QSub_Detail.FieldByName('VR_UNITARIO').AsFloat <= 0 then
  begin
    Application.MessageBox('Vr. Unitário inválido', PChar(Msg_Title), mb_IconStop);
    Itens.SelectedIndex := 8;
    abort;
  end;

  if QSub_Detail.FieldByName('VR_DESCONTO').AsFloat < 0 then
  begin
    Application.MessageBox('Vr. Desconto inválido', PChar(Msg_Title), mb_IconStop);
    Itens.SelectedIndex := 9;
    abort;
  end;

  if QSub_Detail.FieldByName('VR_TOTAL').AsFloat <= 0 then
  begin
    Application.MessageBox('Vr. Total inválido', PChar(Msg_Title), mb_IconStop);
    Itens.SelectedIndex := 10;
    abort;
  end;

   if Roundto(QSub_Detail.FieldByName('VR_TOTAL').AsFloat,-2) <> RoundTo(((QSub_Detail.FieldByName('VR_UNITARIO').AsFloat * QSub_Detail.FieldByName('QUANTIDADE').AsFloat) - (QSub_Detail.FieldByName('VR_DESCONTO').AsFloat * QSub_Detail.FieldByName('QUANTIDADE').AsFloat )), -2) then
  begin

    Application.MessageBox('Vr. Total inválido', PChar(Msg_Title), mb_IconStop);
    Itens.SelectedIndex := 4;
    abort;
  end;


  QSub_Detail.FieldByName('VR_UNITARIO').AsFloat := RoundTo(((QSub_Detail.FieldByName('VR_TOTAL').AsFloat + (QSub_Detail.FieldByName('VR_DESCONTO').AsFloat * QSub_Detail.FieldByName('QUANTIDADE').AsFloat)) / QSub_Detail.FieldByName('QUANTIDADE').AsFloat), -2);


end;


procedure TFrmPedido_de_venda.QSub_DetailNewRecord(DataSet: TDataSet);
begin
  DataSet['PEDIDO_ID']      := QTabela.FieldByName('PEDIDO_ID').AsInteger;
  DataSet['TP_PROD_SERV']   := 'P';
  DataSet['MVA']            := 0;
  DataSet['BASE_CALC_ICMS'] := 0;
  DataSet['ALIQUOTA_ICMS']  := 0;
  DataSet['VR_IPI']         := 0;
  DataSet['QUANTIDADE']     := 0;
  DataSet['VR_UNITARIO']    := 0;
  DataSet['VR_DESCONTO']    := 0;
  DataSet['VR_TOTAL']       := 0;

end;

procedure TFrmPedido_de_venda.QTabelaAfterOpen(DataSet: TDataSet);
begin
TFloatField(QTabela.FieldByName('VALOR')).DisplayFormat  := '#,##0.00';
end;

procedure TFrmPedido_de_venda.RDprint1BeforeNewPage(Sender: TObject; Pagina: Integer);
begin
  if linha <= 62  then
  Begin
  RDprint1.Imp(63, 01, '================================================================================');
  RDprint1.Imp(64, 01, 'Eficaz Automação e Sistemas Ltda');
  RDprint1.ImpDir(64, 33, 80, 'http://www.eficazautomacao.com.br', []);
  RDprint1.Imp(66,01,' ');
  End;

end;

procedure TFrmPedido_de_venda.RDprint1NewPage(Sender: TObject; Pagina: Integer);
begin
  RDprint1.Imp(02, 01, FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString);
  RDprint1.ImpDir(02, (length(FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString)), 80, 'Eficaz Automação e Sistemas Ltda - ME', []);
  RDprint1.Imp(03, 01, Copy(FrmPrincipal.QEmpresa.FieldByName('ENDERECO').AsString,1,30));
  RDprint1.Imp(03, 30, 'Nº:' + FrmPrincipal.QEmpresa.FieldByName('NUMERO').AsString);
  RDprint1.Imp(03, 37, Copy (FrmPrincipal.QEmpresa.FieldByName('BAIRRO').AsString,1,15));
  RDprint1.Imp(03, 55, Copy(FrmPrincipal.QEmpresa.FieldByName('MUNICIPIO').AsString,1,20));
  RDprint1.Imp(03, 72, FrmPrincipal.QEmpresa.FieldByName('CEP').AsString);
  RDprint1.Imp(04, 01, 'Cnpj.:' + FrmPrincipal.QEmpresa.FieldByName('CNPJ').AsString);
  RDprint1.Imp(04, 30, 'I.E.: ' + FrmPrincipal.QEmpresa.FieldByName('INSCR_ESTADUAL').AsString);
  RDprint1.Imp(04, 55, 'Fone: ' + FrmPrincipal.QEmpresa.FieldByName('TELEFONE').AsString);
  RDprint1.Imp(05, 01, 'Data: ' + DateToStr(date) + ' - ' + TimeToStr(now));
  RDprint1.impDir(05, 80, 80, 'Página: ' + IntToStr(Pagina), []);
  RDprint1.Imp(06, 25, '*** PEDIDO DE VENDA ***');
  RDprint1.Imp(07, 01, '--------------------------------------------------------------------------------');
  linha := 08;

end;

procedure TFrmPedido_de_venda.Set_Campos(Vazio: Boolean);
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

      if Temp is TComboBox then
        TComboBox(Temp).Text := '';

      if Temp is TCurrencyEdit then
        TCurrencyEdit(Temp).Value := 0;

      if Temp is TRxCalcEdit then
        TRxCalcEdit(Temp).Value := 0;

      if Temp is TMemo then
        TMemo(Temp).Text := '';

      QSub_Detail.Close;

      QSub_Detail.ParamByName('PEDIDO_ID').AsInteger := 0;

      QSub_Detail.Prepare;
      QSub_Detail.Open;
    end
    else
    begin
      if Temp is TEdit then
        TEdit(Temp).Text := QTabela.FieldByName(TEdit(Temp).Name).AsString;

      if Temp is TMaskEdit then
        TMaskEdit(Temp).Text := QTabela.FieldByName(TMaskEdit(Temp).Name).AsString;

      if Temp is TDateEdit then
        TDateEdit(Temp).Text := QTabela.FieldByName(TDateEdit(Temp).Name).AsString;

      if Temp is TComboBox then
        TComboBox(Temp).Text := QTabela.FieldByName(TComboBox(Temp).Name).AsString;

      if Temp is TCurrencyEdit then
        TCurrencyEdit(Temp).Value := QTabela.FieldByName(TCurrencyEdit(Temp).Name).AsFloat;

      if Temp is TRxCalcEdit then
        TRxCalcEdit(Temp).Value := QTabela.FieldByName(TRxCalcEdit(Temp).Name).AsFloat;

      if Temp is TMemo then
        TMemo(Temp).Text := QTabela.FieldByName(TMemo(Temp).Name).AsString;

      QSub_Detail.Close;
      QSub_Detail.ParamByName('PEDIDO_ID').AsInteger := QTabela.FieldByName('PEDIDO_ID').AsInteger;
      QSub_Detail.Prepare;
      QSub_Detail.Open;
    end;
  end;

  if QTabela.IsEmpty then
    Itens.Enabled := False
  else
    Itens.Enabled := True;

  DetailSearch('');
end;

procedure TFrmPedido_de_venda.StatusChange(Sender: TObject);
begin
if Status.Text = 'CANCELADO' then
   Begin
     Label18.Visible      := True;
     Cancelamento.Visible := True;
   End;
end;

procedure TFrmPedido_de_venda.btnFuncionarioClick(Sender: TObject);
begin
  try
    FUNCIONARIO_ID.Value := GetConsulta('PESSOAL', 0, 0, StrToInt(FUNCIONARIO_ID.Text));
  except
    FUNCIONARIO_ID.Value := GetConsulta('PESSOAL', 0, 0, 0);
  end;

end;

procedure TFrmPedido_de_venda.btnDeleteClick(Sender: TObject);
begin
  if FrmData.QAcesso.FieldByName('EXCLUSAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para exclusão', PChar(Msg_Title), mb_IconStop);
    abort;
  end;

  if (QTabela.FieldByName('DT_MOVIMENTO').AsDateTime < FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime) then
  begin
    Application.MessageBox('Movimento já encerrado', PChar(Msg_Title), mb_IconStop);
    abort;
  end;

  if QTabela.FieldByName('TRANSACAO_ID').AsInteger > 0 then
  begin
    Application.MessageBox(PChar('Pedido faturado na transação ' + QTabela.FieldByName('TRANSACAO_ID').AsString), PChar(Msg_Title), mb_IconStop);
    abort;
  end;

  if Application.MessageBox('Deseja realmente excluir?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = IDYES then
  begin

    IQuery.Sql.Clear;
    IQuery.Sql.Add('DELETE FROM PEDIDOS');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(PEDIDO_ID = :ID)');

    IQuery.ParamByName('ID').AsInteger := QTabela.FieldByName('PEDIDO_ID').AsInteger;

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

procedure TFrmPedido_de_venda.btnDiscardClick(Sender: TObject);
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

procedure TFrmPedido_de_venda.btnEditClick(Sender: TObject);
begin
  if FrmData.QAcesso.FieldByName('ALTERACAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para alteração', PChar(Msg_Title), mb_IconStop);
    abort;
  end;

  if (QTabela.FieldByName('DT_MOVIMENTO').AsDateTime < FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime) then
  begin
    Application.MessageBox('Movimento já encerrado', PChar(Msg_Title), mb_IconStop);
    abort;
  end;

  if QTabela.FieldByName('TRANSACAO_ID').AsInteger > 0 then
  begin
    Application.MessageBox(PChar('Pedido fechado na transação ' + QTabela.FieldByName('TRANSACAO_ID').AsString), PChar(Msg_Title), mb_IconStop);
    abort;
  end;

  Operacao := 'Alterando';

  ID := QTabela.FieldByName('PEDIDO_ID').AsInteger;

  Botoes_Editing;
  Habilitar(True);
  Itens.Enabled := False;

  Consulta.TabVisible := False;
  DT_PEDIDO.SetFocus;
end;

procedure TFrmPedido_de_venda.btnEmpresaClick(Sender: TObject);
begin
  try
    EMPRESA_ID.Value := GetConsulta('EMPRESAS', 0, 0, StrToInt(EMPRESA_ID.Text));
  except
    EMPRESA_ID.Value := GetConsulta('EMPRESAS', 0, 0, 0);
  end;
end;

procedure TFrmPedido_de_venda.btnFornecedorClick(Sender: TObject);
begin
  try
    CLIENTE_ID.Value := GetConsulta('CLIENTES', 0, 0, StrToInt(CLIENTE_ID.Text));
  except
    CLIENTE_ID.Value := GetConsulta('CLIENTES', 0, 0, 0);
  end;
end;

procedure TFrmPedido_de_venda.btnInsertClick(Sender: TObject);
begin
  if FrmData.QAcesso.FieldByName('INCLUSAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para inclusão', PChar(Msg_Title), mb_IconStop);
    abort;
  end;

  Operacao := 'Inserindo';
  Botoes_Editing;
  Set_Campos(True);
  Habilitar(True);
  Itens.Enabled := False;

  QEmpresa.Close;
  QCliente.Close;

  ESTADO.Text          := '  ';
  DT_PEDIDO.Date       := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
  DT_MOVIMENTO.Date    := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
  DT_Solicitacao.Date  := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
  DT_Entrega.Date      := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
  COND_PAGTO.Text      := 'A VISTA';
  EMPRESA_ID.Value     := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  AUTORIZ_ID.Value     := FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger;
  Status.Text          := 'NORMAL';
  Label18.Visible      := False;
  Cancelamento.Visible := False;
  Consulta.TabVisible  := False;
  TP_PEDIDO.Value      := 1;
  DT_PEDIDO.SetFocus;
  Finalizadora_id.KeyValue := 0;

  if LeIni(Arq_Ini, 'Sistema', 'Vendedor Padrão') <> '' then
  Funcionario_id.Value    := StrToInt(LeIni(Arq_Ini, 'Sistema', 'Vendedor Padrão'));


end;

procedure TFrmPedido_de_venda.btnLogClick(Sender: TObject);
var
F1: TextFile;
begin

  Set_Campos(False);
  Botoes_Normal;

  if QTabela.FieldByName('TRANSACAO_ID').AsInteger > 0  then
     Begin
     Application.MessageBox('Pedido de Venda já Importado!', PChar(Msg_Title), mb_IconInformation);
     Exit;
     End;

  if not QSub_Detail.Active then
  begin
    QSub_Detail.Close;

    QSub_Detail.ParamByName('PEDIDO_ID').AsInteger := QTabela.FieldByName('PEDIDO_ID').AsInteger;

    QSub_Detail.Prepare;
    QSub_Detail.Open;
  end;

  if LeIni(Arq_Ini, 'Sistema', 'Path Orçamento') <> '' then
  begin
    try
      AssignFile(F1, LeIni(Arq_Ini, 'Sistema', 'Path Orçamento') + 'PDV' + StrZero(QTabela.FieldByName('PEDIDO_ID').AsString, 6, 0) + '.Txt');
      Rewrite(F1);

      QSub_Detail.First;
      while not QSub_Detail.Eof do
      begin

        IQuery.Sql.Clear;
        IQuery.Sql.Add('SELECT * FROM PRODUTOS');
        IQuery.Sql.Add('WHERE');
        IQuery.Sql.Add('(PRODUTO_ID = :PRODUTO_ID)');

        IQuery.ParamByName('PRODUTO_ID').AsInteger := QSub_Detail.FieldByName('PRODUTO_ID').AsInteger;

        IQuery.Prepare;
        IQuery.Open;

        WriteLn(F1, '1' + ForcaComprimento(IQuery.FieldByName('COD_BARRA').AsString, 14, ' ') +
                    StrZero(QSub_Detail.FieldByName('QUANTIDADE').AsString, 12, 2) +
                    StrZero(QSub_Detail.FieldByName('VR_UNITARIO').AsString, 12, 2) +
                    StrZero(QSub_Detail.FieldByName('VR_DESCONTO').AsString, 12, 2));

        Application.ProcessMessages;
        QSub_Detail.Next;
      end;

      QSub_Detail.First;

      IQuery.Sql.Clear;
      IQuery.Sql.Add('SELECT * FROM TRANSPARCELAS');
      IQuery.Sql.Add('WHERE');
      IQuery.Sql.Add('(TRANSACAO_ID = :PEDIDO_ID)');
      IQuery.Sql.Add('AND (TIPO_TRANSACAO = :TIPO_TRANSACAO)');
      IQuery.Sql.Add('ORDER BY TRANSACAO_ID, PARCELA_ID');

      IQuery.ParamByName('PEDIDO_ID').AsInteger  := QTabela.FieldByName('PEDIDO_ID').AsInteger;
      IQuery.ParamByName('TIPO_TRANSACAO').AsString := 'V';

      IQuery.Prepare;
      IQuery.Open;

      IQuery.First;
      while not IQuery.Eof do
      begin
        WriteLn(F1, '2' + StrZero(Copy(IQuery.FieldByName('PARCELA_ID').AsString, 4, 2), 2, 0) + StrZero(Copy(IQuery.FieldByName('PARCELA_ID').AsString, 1, 2), 2, 0) +
                    Copy(IQuery.FieldByName('DT_VENCIMENTO').AsString, 1, 2) +
                    Copy(IQuery.FieldByName('DT_VENCIMENTO').AsString, 4, 2) +
                    Copy(IQuery.FieldByName('DT_VENCIMENTO').AsString, 7, 4) +
                    StrZero(IQuery.FieldByName('VALOR').AsString, 12, 2) +
                    StrZero(IQuery.FieldByName('BANCO_ID').AsString, 2, 0) +
                    StrZero(FloatToStr(Cliente_ID.Value), 5, 0));

        Application.ProcessMessages;
        IQuery.Next;
      end;

      if QTabela.FieldByName('VR_ACRESCIMO').AsFloat > 0 then
        WriteLn(F1, '301' + 'A' + StrZero(QTabela.FieldByName('VR_ACRESCIMO').AsString, 12, 2) +
                    StrZero(QTabela.FieldByName('FUNCIONARIO_ID').AsString, 5, 0) +
                    StrZero(QTabela.FieldByName('CLIENTE_ID').AsString, 5, 0) +
                    StrZero(IntToStr(QFinalizadora.FieldByName('FINALIZADORA_ID').AsInteger), 2, 0))
      else
        WriteLn(F1, '301' + 'D' + StrZero(QTabela.FieldByName('VR_DESCONTO').AsString, 12, 2) +
                    StrZero(QTabela.FieldByName('FUNCIONARIO_ID').AsString, 5, 0) +
                    StrZero(QTabela.FieldByName('CLIENTE_ID').AsString, 5, 0) +
                    StrZero(IntToStr(QFinalizadora.FieldByName('FINALIZADORA_ID').AsInteger), 2, 0));

      Application.MessageBox(PChar('Log ' + StrZero(QTabela.FieldByName('PEDIDO_ID').AsString, 6, 0) + ' criado com sucesso'), PChar(Msg_Title), mb_IconInformation);
    finally
      CloseFile(F1);
    end;
  end;
end;

procedure TFrmPedido_de_venda.btnNextClick(Sender: TObject);
begin
  if not QTabela.Eof then
  begin
    QTabela.Next;
    Set_Campos(False);
     ManutencaoShow(manutencao);
  end;

  Botoes_Normal;
end;

procedure TFrmPedido_de_venda.btnParcelasClick(Sender: TObject);
begin
  if QTabela.FieldByName('VALOR').AsFloat > 0 then
    Divisao_Parcelas(QTabela.FieldByName('PEDIDO_ID').AsInteger, 'V', True, QTabela.FieldByName('DT_PEDIDO').AsDateTime, QTabela.FieldByName('VALOR').AsFloat);
end;

procedure TFrmPedido_de_venda.btnPedidoClick(Sender: TObject);
begin
ManutencaoShow(manutencao);
 if LeIni(Arq_Ini, 'Sistema', 'Imp. Orçamento') = 'RDPrint' then
  Begin
        RDprint1.Impressora := Epson;
        RDprint1.FonteTamanhoPadrao := S10cpp;

      if CheckBox1.Checked = True then
      Begin
        RDprint1.Impressora         := HP;
        RDprint1.FonteTamanhoPadrao := S10cpp;
        RDprint1.Acentuacao         :=Transliterate;
      End;

      RDprint1.OpcoesPreview.Preview     := True;
      RDprint1.MostrarProgresso          := True;
      RDprint1.Acentuacao                := SemAcento;
      RDprint1.TamanhoQteLinhas          := 1;
      RDprint1.Abrir;

    if linha > 66  then
    Begin
    RDprint1.Novapagina;
    Pagina := Pagina + 1;
    End;
    Pagina  := 1;

    RDprint1.Imp(linha, 01, 'Num. Pedido.:');
    RDprint1.Imp(linha, 17, QTabela.FieldByName('PEDIDO_ID').AsString);
    RDprint1.Imp(linha, 31, 'Cond. Pagto.:');
    RDprint1.Imp(linha, 44, QTabela.FieldByName('COND_PAGTO').AsString);
    RDprint1.Imp(linha, 61, 'Data:');
    RDprint1.Imp(linha, 68, QTabela.FieldByName('DT_PEDIDO').AsString);
    inc(linha);
    RDprint1.Imp(linha, 01, 'Cliente:');
    RDprint1.Imp(linha, 11, Copy(QTabela.FieldByName('NOME').AsString, 1, 40));
    inc(linha);
    RDprint1.Imp(linha, 01, 'Ins./Rg.:');
    RDprint1.Imp(linha, 11, QCliente.FieldByName('INSCRICAO').AsString);
    RDprint1.Imp(linha, 31, 'Cnpj/Cpf:');
    RDprint1.Imp(linha, 41, QCliente.FieldByName('CNPJ').AsString);
    inc(linha);
    RDprint1.Imp(linha, 01, 'Endereço:');
    RDprint1.Imp(linha, 11, Copy(QTabela.FieldByName('ENDERECO').AsString, 1, 31));
    RDprint1.Imp(linha, 46, 'Nº.:');
    RDprint1.Imp(linha, 50, QCliente.FieldByName('NUMERO').AsString);
    RDprint1.Imp(linha, 55, 'Bairro:');
    RDprint1.Imp(linha, 62, Copy (QTabela.FieldByName('BAIRRO').AsString,1,15));
    inc(linha);
    RDprint1.Imp(linha, 01, 'Cidade:');
    RDprint1.Imp(linha, 11, Copy(QTabela.FieldByName('MUNICIPIO').AsString, 1, 31));
    RDprint1.Imp(linha, 31, 'CEP:');
    RDprint1.Imp(linha, 36, QTabela.FieldByName('CEP').AsString);
    RDprint1.Imp(linha, 46, 'Telefone:');
    RDprint1.Imp(linha, 56, QCliente.FieldByName('DDD').AsString);
    RDprint1.Imp(linha, 60, QCliente.FieldByName('TELEFONE_1').AsString);
    inc(linha);
    RDprint1.Imp(linha, 01, 'Funci.:');
    RDprint1.Imp(linha, 11, QFuncionario.FieldByName('NOME').AsString);
    RDprint1.Imp(linha, 46, 'Solic.:');
    RDprint1.Imp(linha, 55, QTabela.FieldByName('SOLICITANTE').AsString);
    inc(linha);
    RDprint1.Imp(linha, 01, 'Status:');
    RDprint1.Imp(linha, 11, QTabela.FieldByName('STATUS').AsString);
    RDprint1.Imp(linha, 21, QTabela.FieldByName('CANCELAMENTO').AsString);
    RDprint1.Imp(linha, 31, 'E-mail:');
    RDprint1.Imp(linha, 38, QCliente.FieldByName('EMAIL').AsString);
    inc(linha);
    RDprint1.Imp(linha, 01, '--------------------------------------------------------------------------------');
    inc(linha);
    RDprint1.Imp(linha, 01, 'Cód.  Descrição                             Qtd.   Pr.Un.      Desc.   Pr. Total');
    inc(linha);
    RDprint1.Imp(linha, 01, '--------------------------------------------------------------------------------');
    inc(linha);

    while not QSub_Detail.Eof do
    Begin
    RDprint1.Imp(linha,01,QSub_Detail.FieldByName('PRODUTO_ID').AsString);
    RDprint1.Imp(linha,6,Copy(QSub_Detail.FieldByName('DESCRICAO').AsString ,1,39));
    RDprint1.Imp(linha,46,QSub_Detail.FieldByName('QUANTIDADE').AsString);
    RDprint1.ImpVal(linha,46,'#,###,##0.00',QSub_Detail.FieldByName('VR_UNITARIO').AsFloat,[]);
    RDprint1.ImpVal(linha,58,'###,##0.00',QSub_Detail.FieldByName('VR_DESCONTO').AsFloat,[]);
    RDprint1.ImpVal(linha,69,'#,###,##0.00',QSub_Detail.FieldByName('VR_TOTAL').AsFloat,[]);
    inc(linha);
    QSub_Detail.Next;
    End;
    RDprint1.Imp(linha,70,'__________');
    inc(linha);
    RDprint1.Imp(linha,45,'Total dos Produtos');
    RDprint1.ImpVal(linha,68,'##,###,##0.00',QTabela.FieldByName('VALOR_PRODUTOS').AsFloat,[]);
    inc(linha);
    RDprint1.Imp(linha,45,'Vr. Frete');
    RDprint1.ImpVal(linha,68,'##,###,##0.00',QTabela.FieldByName('VR_FRETE').AsFloat,[]);
    inc(linha);
    RDprint1.Imp(linha,45,'Acrescimo');
    RDprint1.ImpVal(linha,68,'##,###,##0.00',QTabela.FieldByName('VR_ACRESCIMO').AsFloat,[]);
    inc(linha);
    RDprint1.Imp(linha,45,'Desconto');
    RDprint1.ImpVal(linha,68,'##,###,##0.00',QTabela.FieldByName('VR_DESCONTO').AsFloat,[]);
    inc(linha);

    RDprint1.Imp(linha,45,'Total');
    RDprint1.ImpVal(linha,68,'##,###,##0.00',QTabela.FieldByName('VALOR').AsFloat,[]);
    inc(linha);
    RDprint1.Imp(linha,01,'--------------------------------------------------------------------------------');
    inc(linha);
    linha2 := linha;
    linha3 := linha;

    IQuery.Sql.Clear;
    IQuery.Sql.Add('SELECT * FROM TRANSPARCELAS');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
    IQuery.Sql.Add('AND (TIPO_TRANSACAO = :TIPO_TRANSACAO)');

    IQuery.ParamByName('TRANSACAO_ID').AsInteger  := QTabela.FieldByName('PEDIDO_ID').AsInteger;
    IQuery.ParamByName('TIPO_TRANSACAO').AsString := 'V';

    IQuery.Prepare;
    IQuery.Open;

    if not IQuery.IsEmpty then
    begin
    RDprint1.Imp(linha,45,'Parcelamento:');
    inc(linha);
    RDprint1.Imp(linha,45,'-------------');
    inc(linha);
    RDprint1.Imp(linha,45,'Vencimento:');
    IQuery.First;
    while not IQuery.Eof do
    begin
     inc(linha);
     RDprint1.Imp(linha,45,IQuery.FieldByName('DT_VENCIMENTO').AsString);
     RDprint1.Imp(linha,65,'-');
     RDprint1.ImpVal(linha,68,'##,###,##0.00',IQuery.FieldByName('VALOR').AsFloat,[]);
     IQuery.Next;
     end;

     end;

    RDprint1.Imp(linha2 ,01, 'Observação:');
    inc(linha2);
    RDprint1.Imp(linha2,01,Copy(QTabela.FieldByName('OBSERVACAO').AsString,1,40));
    inc(linha2);
    RDprint1.Imp(linha2,01,Copy(QTabela.FieldByName('OBSERVACAO').AsString,41,40));
    inc(linha2);
    RDprint1.Imp(linha2,01,Copy(QTabela.FieldByName('OBSERVACAO').AsString,81,40));
    inc(linha2);
    RDprint1.Imp(linha2,01,Copy(QTabela.FieldByName('OBSERVACAO').AsString,121,40));
    inc(linha2);
    RDprint1.Imp(linha2,01,Copy(QTabela.FieldByName('OBSERVACAO').AsString,161,40));
    inc(linha2);
    RDprint1.Imp(linha2,01,Copy(QTabela.FieldByName('OBSERVACAO').AsString,201,40));
    inc(linha2);
    RDprint1.Imp(linha2,01,Copy(QTabela.FieldByName('OBSERVACAO').AsString,241,40));
    inc(linha2);
    RDprint1.Imp(linha2,01,Copy(QTabela.FieldByName('OBSERVACAO').AsString,281,40));
    inc(linha2);
    RDprint1.Imp(linha2,01,Copy(QTabela.FieldByName('OBSERVACAO').AsString,321,40));
    inc(linha2);
    RDprint1.Imp(linha2,01,Copy(QTabela.FieldByName('OBSERVACAO').AsString,361,40));

    Linha2 :=  (linha2 + 8) ;
    RDprint1.Imp(linha2,01,'Vendedor:________________________' );
    RDprint1.Imp(linha2,45,'Cliente:__________________________' );
    inc(linha2);
    RDprint1.Imp(linha2,10,QFuncionario.FieldByName('NOME').AsString);
    RDprint1.Imp(linha2,53,Copy(QTabela.FieldByName('NOME').AsString,1,25));
    
    if Copy(QTabela.FieldByName('NOME').AsString,26,25) <> '' then
    Begin
    inc(linha2);
    RDprint1.Imp(linha2,53,Copy(QTabela.FieldByName('NOME').AsString,26,25));
    End;



    Application.ProcessMessages;

    RDprint1.TamanhoQteLinhas          := 66;
    RDprint1.Fechar;

    End
    Else
    Pedido.PreviewModal;
end;

procedure TFrmPedido_de_venda.btnPesquisaClick(Sender: TObject);
var
Condicao: String;
begin
  Condicao := GetPesquisa('PEDIDO_VENDA');

  if Condicao <> '' then
  begin
    CmdSelectNull := Condicao + ' AND (TP_PEDIDO = 1) AND (EMPRESA_ID = :EMPRESA_ID)';
    QTabela.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  end;

  CmdOrderBy := 'ORDER BY PEDIDO_ID';

  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

  QTabela.Prepare;
  QTabela.Open;

  Set_Campos(False);
  Botoes_Normal;
end;

procedure TFrmPedido_de_venda.btnPriorClick(Sender: TObject);
begin
  if not QTabela.Bof then
  begin
    QTabela.Prior;
    Set_Campos(False);
    ManutencaoShow(manutencao);
  end;

  Botoes_Normal;
end;

procedure TFrmPedido_de_venda.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPedido_de_venda.btnSaveClick(Sender: TObject);
begin
  DetailSearch('');

  if Validacao then
  begin

    VALOR.Value := VALOR_PRODUTOS.Value + VR_FRETE.Value + VR_ACRESCIMO.Value - VR_DESCONTO.Value;

    if Operacao = 'Inserindo' then
    begin
      Insert;

      CmdSelectNull := 'WHERE (PEDIDO_ID IS NOT NULL) AND (TP_PEDIDO = 1)  AND (DT_MOVIMENTO = :DT_MOVIMENTO) AND (EMPRESA_ID = :EMPRESA_ID)';
      CmdOrderBy    := 'ORDER BY PEDIDO_ID';

      QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

      QTabela.ParamByName('DT_MOVIMENTO').AsDateTime := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
      QTabela.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;

      QTabela.Open;
      QTabela.Last;


    end
    else
      Edit;

    Set_Campos(False);

    if QTabela.IsEmpty then
    begin
      QEmpresa.Close;
      QCliente.Close;
    end;

    Habilitar(False);
    Botoes_Normal;

    if COND_PAGTO.Text = 'A PRAZO' then
      btnParcelasClick(Self)
    else
    begin
      IQuery.Sql.Clear;
      IQuery.Sql.Add('DELETE FROM TRANSPARCELAS');
      IQuery.Sql.Add('WHERE');
      IQuery.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
      IQuery.Sql.Add('AND (TIPO_TRANSACAO = :TIPO_TRANSACAO)');

      IQuery.ParamByName('TRANSACAO_ID').AsInteger  := QTabela.FieldByName('PEDIDO_ID').AsInteger;
      IQuery.ParamByName('TIPO_TRANSACAO').AsString := 'V';

      IQuery.Prepare;
      IQuery.ExecSql;


    end;

    Operacao := '';
    Consulta.TabVisible := True;
    Calculo_rodape;
  end;
end;

procedure TFrmPedido_de_venda.ConsultaShow(Sender: TObject);
begin
  Botoes_Normal;
end;

procedure TFrmPedido_de_venda.DBGrid1DblClick(Sender: TObject);
begin
  Manutencao.Show;
end;

procedure TFrmPedido_de_venda.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
OldBkMode: Integer;
begin
 if QTabela.FieldByName('STATUS').AsString = 'FATURADO' then
    TDBGrid(Sender).Canvas.Font.Color := clGreen

  else if  QTabela.FieldByName('STATUS').AsString = 'CANCELADO' then
    TDBGrid(Sender).Canvas.Font.Color := clRed
  Else
    TDBGrid(Sender).Canvas.Font.Color := clBlue;

  if gdSelected in State then
  begin
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color := clInfoBk;

      FillRect(Rect);

      Brush.Color := clInfoBk;
      OldBkMode   := SetBkMode(Handle, TRANSPARENT);

      SetBkMode(Handle, OldBkMode);

      Font.Style := [fsBold];
    end;
  end;
  TDBGrid(Sender).DefaultDrawDataCell(Rect, TDBGrid(Sender).Columns[DataCol].Field, State);
end;

procedure TFrmPedido_de_venda.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Manutencao.Show;
end;

procedure TFrmPedido_de_venda.DBGrid1TitleClick(Column: TColumn);
begin
  CmdOrderBy := 'ORDER BY ' + Column.FieldName;

  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;
  QTabela.Open;
end;

procedure TFrmPedido_de_venda.ItensColEnter(Sender: TObject);
begin
  if QSub_Detail.State in [dsInsert, dsEdit] then
  begin
    ProdutoSearch;
    TributoSearch;

    if (Itens.SelectedField.FieldName = 'tributo_id') and (QProduto.IsEmpty) then
      Itens.SelectedIndex := 0;

    if (Itens.SelectedField.FieldName = 'cst') and (QTributo.IsEmpty) then
      Itens.SelectedIndex := 2;

    if (Itens.SelectedField.FieldName = 'unidaade') and (QSub_Detail.FieldByName('QUANTIDADE').AsFloat = 0) then
      Itens.SelectedIndex := 6;

    if (Itens.SelectedField.FieldName = 'vr_desconto') and (QSub_Detail.FieldByName('VR_UNITARIO').AsFloat = 0) then
      Itens.SelectedIndex := 8;
  end;
end;

procedure TFrmPedido_de_venda.ItensColExit(Sender: TObject);
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
        QSub_Detail.FieldByName('UNIDADE').AsString      := '';

        Application.MessageBox('Produto inexistente', PChar(Msg_Title), mb_IconStop);
        Itens.SelectedIndex := 0;
      end
      else
      begin
        QSub_Detail.FieldByName('DESCRICAO').AsString    := QProduto.FieldByName('DESCRICAO').AsString;
        QSub_Detail.FieldByName('TRIBUTO_ID').AsInteger  := QProduto.FieldByName('TRIBUTO_ID').AsInteger;
        QSub_Detail.FieldByName('ALIQUOTA_ICMS').AsFloat := QProduto.FieldByName('ALIQUOTA_ICMS').AsFloat;
        QSub_Detail.FieldByName('VR_UNITARIO').AsFloat   := QProduto.FieldByName('PRECO_VAREJO').AsFloat;
        QSub_Detail.FieldByName('UNIDADE').AsString      := QProduto.FieldByName('UNIDADE').AsString;

      end;
    end;

    if Itens.SelectedField.FieldName = 'tributo_id' then
    begin
      TributoSearch;

      if QTributo.IsEmpty then
      begin
        QSub_Detail.FieldByName('CST').AsString := '';
        Application.MessageBox('Tributo inexistente', PChar(Msg_Title), mb_IconStop);
        Itens.SelectedIndex := 2;
      end
      else
        QSub_Detail.FieldByName('CST').AsString := Copy(QTributo.FieldByName('ORIGEM').AsString, 1, 1) + Copy(QTributo.FieldByName('TRIBUTACAO').AsString, 1, 2);
    end;

    if (Itens.SelectedField.FieldName = 'vr_unitario') or (Itens.SelectedField.FieldName = 'quantidade') or (Itens.SelectedField.FieldName = 'vr_desconto') then
    begin
      if Itens.SelectedField.FieldName = 'quantidade' then
      begin
        ProdutoSearch;
        If QSub_Detail.FieldByName('QUANTIDADE').AsFloat = 0 Then
        Begin
          Application.MessageBox('Quantidade inválida', PChar(Msg_Title), mb_IconStop);
          Itens.SelectedIndex := 2;
          abort;
        End;

        if (QProduto.FieldbyName('EMBALAGEM').AsFloat > 0) and (FrmPrincipal.Config.FieldByName('UNID_EMB_PEDIDOS').AsString = 'True') then
          QSub_Detail.FieldByName('QUANTIDADE').AsFloat := (QSub_Detail.FieldByName('QUANTIDADE').AsFloat * QProduto.FieldByName('EMBALAGEM').AsFloat);
      end;

      QSub_Detail.FieldByName('VR_TOTAL').AsFloat := (QSub_Detail.FieldByName('QUANTIDADE').AsFloat * (QSub_Detail.FieldByName('VR_UNITARIO').AsFloat - QSub_Detail.FieldByName('VR_DESCONTO').AsFloat));
    end;

    if Itens.SelectedField.FieldName = 'vr_desconto' then
    Begin
       if (QSub_Detail.FieldByName('VR_DESCONTO').AsFloat) >= (QSub_Detail.FieldByName('VR_UNITARIO').AsFloat * QSub_Detail.FieldByName('QUANTIDADE').AsFloat ) then
        begin
            Application.MessageBox('Desconto inválido', PChar(Msg_Title), mb_IconStop);
            Itens.SelectedIndex := 5;
            abort;
        end;

        if FrmPrincipal.Config.FieldByName('DESC_MAXIMO').AsFloat > 0 then
        begin
          if QSub_Detail.FieldByName('VR_DESCONTO').AsFloat > ((QSub_Detail.FieldByName('VR_UNITARIO').AsFloat * FrmPrincipal.Config.FieldByName('DESC_MAXIMO').AsFloat) / 100) then
          begin
            Application.MessageBox('Vr. Desconto maior do que o valor permitido', PChar(Msg_Title), mb_IconStop);
            Itens.SelectedIndex := 5;
            abort;
          end;
        end;

      if FrmPrincipal.Config.FieldByName('DESC_ORC_USU').AsString = 'True' then
      Begin
      Desc_por := 0;

        if QSub_Detail.FieldByName('VR_DESCONTO').AsFloat > 0 then
           Desc_Por := RoundTo(((QSub_Detail.FieldByName('VR_DESCONTO').AsFloat * 100) / (QSub_Detail.FieldByName('VR_UNITARIO').AsFloat * QSub_Detail.FieldByName('QUANTIDADE').AsFloat)), -2)
        else
           Desc_Por  := 0;

            IQuery.SQL.Clear;
            IQuery.SQL.Add('SELECT * FROM OPERADORES WHERE NOME LIKE :NOME');
            IQuery.ParamByName('NOME').AsString := Copy(QFuncionario.FieldByName('NOME').AsString,1,20) ;
            IQuery.Prepare;
            IQuery.Open;

        if (IQuery.FieldByName('DESCONTO_MAX_SUBTOTAL').AsFloat = 0) and (QSub_Detail.FieldByName('VR_DESCONTO').AsFloat > 0) then
        begin
            Application.MessageBox(Pchar('Vr. Desconto máximo permitido para ' +  IQuery.FieldByName('NOME').AsString + ' ' + ': '+ IQuery.FieldByName('DESCONTO_MAX_SUBTOTAL').AsString +'%') , PChar(Msg_Title), mb_IconStop);
            Itens.SelectedIndex := 5;
            abort;
        end;

          if IQuery.FieldByName('DESCONTO_MAX_SUBTOTAL').AsFloat > 0 then
          begin
            if QSub_Detail.FieldByName('VR_DESCONTO').AsFloat > (((QSub_Detail.FieldByName('VR_UNITARIO').AsFloat * QSub_Detail.FieldByName('QUANTIDADE').AsFloat) * IQuery.FieldByName('DESCONTO_MAX_SUBTOTAL').AsFloat) / 100) then
            begin
              Application.MessageBox(Pchar('Vr. Desconto máximo permitido para ' +  IQuery.FieldByName('NOME').AsString + ' ' + ': '+ IQuery.FieldByName('DESCONTO_MAX_SUBTOTAL').AsString +'%') , PChar(Msg_Title), mb_IconStop);

              if FrmGerente = Nil then
              begin
                Application.CreateForm(TFrmGerente, FrmGerente);
                try
                  if FrmGerente.ShowModal = mrOK then
                  begin
                    if Desc_Por > FrmGerente.QOperador.FieldByName('DESCONTO_MAX_SUBTOTAL').AsFloat then
                    begin
                      Application.MessageBox('Desconto acima do máximo permitido', 'Orçamento', MB_IconStop + MB_OK);
                     Itens.SelectedIndex := 5;
                     abort;
                    end;
                  Itens.SelectedIndex := 6;
                  end
                  else
                    Itens.SelectedIndex := 5;
                    abort;
                finally

                end;
              end
              else
              begin
                if FrmGerente.ShowModal = mrOK then
                begin
                  if Desc_Por > FrmGerente.QOperador.FieldByName('DESCONTO_MAX_SUBTOTAL').AsFloat then
                  begin
                    Application.MessageBox('Desconto acima do máximo permitido', 'Orçamento', MB_IconStop + MB_OK);
                    Itens.SelectedIndex := 5;
                    abort;
                  end;
                Itens.SelectedIndex := 6;
                end
                else
                  Itens.SelectedIndex := 5;
                  abort;
              end;
            end;
          end;
      End;
    End;
  end;
end;

procedure TFrmPedido_de_venda.ItensEnter(Sender: TObject);
begin
  Botoes_Disable;
  Consulta.TabVisible := False;
end;

procedure TFrmPedido_de_venda.ItensExit(Sender: TObject);
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
    abort;
  end;

  btnEditClick(Self);

  VALOR_PRODUTOS.Value := 0;

  QSub_Detail.First;
  while not QSub_Detail.Eof do
  begin
    VALOR_PRODUTOS.Value := VALOR_PRODUTOS.Value + QSub_Detail.FieldByName('VR_TOTAL').AsFloat;
    Application.ProcessMessages;
    QSub_Detail.Next;
  end; 
end;

procedure TFrmPedido_de_venda.ItensKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
Orcamento: Integer;
begin
  if (Key = Vk_F4) and (QSub_Detail.State = dsBrowse) and (not QSub_Detail.IsEmpty) then
    QSub_Detail.Delete;

 if Key = Vk_F5 then
  begin
    Orcamento := GetConsulta('ORÇAMENTO', 0, 0, 0);

    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT ORCITENS.*, PRODUTOS.COD_BARRA, TRIBUTOS.CFOP,ORCAMENTOS.CLIENTE_ID,ORCAMENTOS.OBSERVACAO,ORCAMENTOS.COND_PAGTO,ORCAMENTOS.VR_DESCONTO VALOR_DESCONTO,ORCAMENTOS.VR_ACRESCIMO');
    QRel.Sql.Add('FROM ORCITENS');
    QRel.Sql.Add('INNER JOIN ORCAMENTOS');
    QRel.Sql.Add('ON (ORCITENS.ORCAMENTO_ID = ORCAMENTOS.ORCAMENTO_ID)');
    QRel.Sql.Add('INNER JOIN PRODUTOS');
    QRel.Sql.Add('ON (ORCITENS.PRODUTO_ID = PRODUTOS.PRODUTO_ID)');
    QRel.Sql.Add('INNER JOIN TRIBUTOS');
    QRel.Sql.Add('ON (PRODUTOS.TRIBUTO_ID = TRIBUTOS.TRIBUTO_ID)');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(ORCITENS.ORCAMENTO_ID = :ORCAMENTO_ID)');
    QRel.Sql.Add('AND (ORCAMENTOS.EMPRESA_ID = :EMPRESA_ID)');

    QRel.ParamByName('ORCAMENTO_ID').AsInteger := Orcamento;
    QRel.ParamByName('EMPRESA_ID').AsInteger   := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;

    QRel.Prepare;
    QRel.Open;

    QRel.First;
    while not QRel.Eof do
    begin
      QSub_Detail.Append;

      try
        QSub_Detail.FieldByName('PRODUTO_ID').AsInteger   := QRel.FieldByName('PRODUTO_ID').AsInteger;
        QSub_Detail.FieldByName('DESCRICAO').AsString     := QRel.FieldByName('DESCRICAO').AsString;
        QSub_Detail.FieldByName('TRIBUTO_ID').AsInteger   := QRel.FieldByName('TRIBUTO_ID').AsInteger;
        QSub_Detail.FieldByName('CST').AsString           := QRel.FieldByName('CST').AsString;
        QSub_Detail.FieldByName('MVA').AsFloat            := QRel.FieldByName('MVA').AsFloat;
        QSub_Detail.FieldByName('BASE_CALC_ICMS').AsFloat := QRel.FieldByName('BASE_CALC_ICMS').AsFloat;
        QSub_Detail.FieldByName('ALIQUOTA_ICMS').AsFloat  := QRel.FieldByName('ALIQUOTA_ICMS').AsFloat;
        QSub_Detail.FieldByName('VR_IPI').AsFloat         := QRel.FieldByName('VR_IPI').AsFloat;
        QSub_Detail.FieldByName('QUANTIDADE').AsFloat     := QRel.FieldByName('QUANTIDADE').AsFloat;
        QSub_Detail.FieldByName('VR_UNITARIO').AsFloat    := QRel.FieldByName('VR_UNITARIO').AsFloat;
        QSub_Detail.FieldByName('VR_DESCONTO').AsFloat    := QRel.FieldByName('VR_DESCONTO').AsFloat;
        QSub_Detail.FieldByName('VR_TOTAL').AsFloat       := QRel.FieldByName('VR_TOTAL').AsFloat;

        QSub_Detail.Post;
      except
        QSub_Detail.Cancel;
      end;

      Application.ProcessMessages;
      QRel.Next;
    end;

     if Application.MessageBox('Usar o mesmo Cliente para quem foi feita o Orçamento?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = IDYES then
      Begin
      Cliente_ID.Value  := QRel.FieldByName('CLIENTE_ID').AsInteger;
      Cliente_idExit(Cliente_id);
      End;

    Cond_pagto.Text   := QRel.FieldByName('COND_PAGTO').AsString;
    Observacao.Text   := QRel.FieldByName('OBSERVACAO').AsString;
    Vr_Desconto.Text  := FloatToStr(QRel.FieldByName('VALOR_DESCONTO').AsFloat);
    Vr_Acrescimo.Text := FloatToStr(QRel.FieldByName('VR_ACRESCIMO').AsFloat);

    IQuery.Sql.Clear;
    IQuery.Sql.Add('UPDATE ORCAMENTOS SET TRANSACAO_ID = :TRANSACAO_ID');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(ORCAMENTO_ID = :ORCAMENTO_ID)');
    IQuery.Sql.Add('AND (EMPRESA_ID = :EMPRESA_ID)');

    IQuery.ParamByName('TRANSACAO_ID').AsInteger := QTabela.FieldByName('TRANSACAO_ID').AsInteger;
    IQuery.ParamByName('ORCAMENTO_ID').AsInteger := Orcamento;
    IQuery.ParamByName('EMPRESA_ID').AsInteger   := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;

    IQuery.Prepare;
    IQuery.ExecSql;

  End;


  if (Key = Vk_F7) and ((Itens.SelectedField.FieldName = 'produto_id') or (Itens.SelectedField.FieldName = 'tributo_id')) and (QSub_Detail.State in [dsInsert, dsEdit]) then
  begin
    if Itens.SelectedField.FieldName = 'produto_id' then
      QSub_Detail.FieldByName('PRODUTO_ID').AsInteger := GetConsulta('ESTOQUE', StrToInt(EMPRESA_ID.Text), StrToInt(Cliente_ID.Text), QSub_Detail.FieldByName('PRODUTO_ID').AsInteger);

    if Itens.SelectedField.FieldName = 'tributo_id' then
      QSub_Detail.FieldByName('TRIBUTO_ID').AsInteger := GetConsulta('TRIBUTOS', 0, 0, QSub_Detail.FieldByName('TRIBUTO_ID').AsInteger);
  end;

  if Key = VK_F9 then
    Perform(Wm_NextDlgCtl, 0, 0);

  if ((Key = Vk_Up) or (Key = Vk_Down)) and (QSub_Detail.State in [dsInsert, dsEdit]) then
    Key := 0;
end;

procedure TFrmPedido_de_venda.ItensKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #46 then
    Key := #44;

  if Key = #13 then
    Keybd_Event(VK_TAB, 0, 0, 0);

  Key := AnsiUpperCase(Key)[1];
end;

procedure TFrmPedido_de_venda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmPedido_de_venda.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (Operacao = 'Inserindo') or (Operacao = 'Alterando') or (QSub_Detail.State in [dsInsert, dsEdit]) then
  begin
    Application.MessageBox('É melhor salvar as alterações antes de continuar', PChar(Msg_Title), mb_IconStop);
    CanClose := False;
  end;
end;

procedure TFrmPedido_de_venda.FormCreate(Sender: TObject);
var
X, Ult_Dia: Integer;
begin
  DBGrid1.Columns[0].Width := 35;
  DBGrid1.Columns[1].Width := 75;
  DBGrid1.Columns[2].Width := 79;
  DBGrid1.Columns[3].Width := 253;
  DBGrid1.Columns[4].Width := 180;
  DBGrid1.Columns[5].Width := 80;
  DBGrid1.Columns[6].Width := 65;
  DBGrid1.Columns[7].Width := 60;

  Ult_Dia := StrToInt(Copy(DateToStr(Ult_Dia_Mes(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime)), 1, 2));
  Dias.Tabs.Clear;

  for X := 1 to Ult_Dia do
    Dias.Tabs.Add(IntToStr(X));

  Dias.Tabs.Add('Todos');

  DT_MOVIMENTO.MinDate := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
  DT_MOVIMENTO.MaxDate := StrToDate('31/12/2026');

  Itens.Columns[0].Width  := 45;
  Itens.Columns[1].Width  := 355;
  Itens.Columns[2].Width  := 60;
  Itens.Columns[3].Width  := 43;
  Itens.Columns[4].Width  := 70;
  Itens.Columns[5].Width  := 70;
  Itens.Columns[6].Width  := 70;

  CmdSelect     := QTabela.Sql.Text;
  CmdSelectNull := 'WHERE (PEDIDO_ID IS NOT NULL) AND (TP_PEDIDO = 1) AND (DT_MOVIMENTO = :DT_MOVIMENTO) AND (EMPRESA_ID = :EMPRESA_ID)';
  CmdOrderBy    := 'ORDER BY PEDIDO_ID';

  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

  QTabela.ParamByName('DT_MOVIMENTO').AsDateTime := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
  QTabela.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  QTabela.Open;
  Botoes_Normal;
  Consulta.Show;
  QFinalizadora.Open;
  Detailsearch('');

  if Copy(FrmData.QAcesso.FieldByName('OPCOES').AsString, 63, 1) = 'S' then
  Itens.Columns[4].ReadOnly := False;

end;

procedure TFrmPedido_de_venda.FormShow(Sender: TObject);
begin
  DBGrid1.SetFocus;
end;

end.
