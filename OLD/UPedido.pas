unit UPedido;
                                                                      
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
  TFrmPedido = class(TForm)
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
    FORNECEDOR_ID: TCurrencyEdit;
    DataEmpresa: TDataSource;
    DBText1: TDBText;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    DT_MOVIMENTO: TDateEdit;
    Panel3: TPanel;
    Label14: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    StatusBar1: TStatusBar;
    btnEmpresa: TSpeedButton;
    btnFornecedor: TSpeedButton;
    VALOR_PRODUTOS: TRxCalcEdit;
    VR_ICMS_ST: TRxCalcEdit;
    VR_IPI: TRxCalcEdit;
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
    Label32: TLabel;
    DBText4: TDBText;
    lbl1: TLabel;
    btn_importar: TSpeedButton;
    OpenDialog1: TOpenDialog;
    DT_CONFERENCIA: TDateEdit;
    Conferencia: TDBGrid;
    Data_Confere: TDataSource;
    Relatorio_Divergencia: TQuickRep;
    QRBand3: TQRBand;
    QRShape4: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel20: TQRLabel;
    QRDBText19: TQRDBText;
    QRShape6: TQRShape;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRShape7: TQRShape;
    QRLabel24: TQRLabel;
    QRLabel27: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel30: TQRLabel;
    QRSysData4: TQRSysData;
    QRLabel31: TQRLabel;
    QRDBText20: TQRDBText;
    QRLabel32: TQRLabel;
    QRDBText21: TQRDBText;
    QRLabel33: TQRLabel;
    QRBand4: TQRBand;
    QRDBText22: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRBand5: TQRBand;
    QRShape8: TQRShape;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    btnDivergencia: TBitBtn;
    lbl2: TLabel;
    lbl_conferencia: TLabel;
    Relatorio_Conferencia: TQuickRep;
    QRBand6: TQRBand;
    QRShape9: TQRShape;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRLabel37: TQRLabel;
    QRLabel40: TQRLabel;
    QRDBText34: TQRDBText;
    QRShape10: TQRShape;
    QRLabel43: TQRLabel;
    QRShape11: TQRShape;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRSysData5: TQRSysData;
    QRLabel46: TQRLabel;
    QRSysData6: TQRSysData;
    QRLabel47: TQRLabel;
    QRDBText35: TQRDBText;
    QRLabel48: TQRLabel;
    QRDBText36: TQRDBText;
    QRLabel49: TQRLabel;
    QRBand7: TQRBand;
    QRDBText37: TQRDBText;
    QRDBText38: TQRDBText;
    QRDBText39: TQRDBText;
    QRDBText42: TQRDBText;
    QRBand8: TQRBand;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel41: TQRLabel;
    QRDBText40: TQRDBText;
    btnconferencia: TBitBtn;
    QRDBText41: TQRDBText;
    QRLabel42: TQRLabel;
    QTabela: TFDQuery;
    QUpdate: TFDQuery;
    IQuery: TFDQuery;
    QEmpresa: TFDQuery;
    QSub_Detail: TFDQuery;
    QFornecedor: TFDQuery;
    QProduto: TFDQuery;
    QTributo: TFDQuery;
    QFuncionario: TFDQuery;
    USql_PedItens: TFDUpdateSQL;
    QPedido_Confere: TFDQuery;
    QArq: TFDQuery;
    QRel: TFDQuery;
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
    procedure btnFuncionarioClick(Sender: TObject);
    procedure Funcionario_idExit(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btn_importarClick(Sender: TObject);
    procedure btnDivergenciaClick(Sender: TObject);
    procedure btnconferenciaClick(Sender: TObject);
    procedure QSub_DetailAfterOpen(DataSet: TDataSet);
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
    procedure Calculo_Rodape;
  end;

var
  FrmPedido: TFrmPedido;
  Operacao, InputString: String;
  ID,Pagina,Linha,Linha2,linha3: Integer;

implementation

uses
  UPrincipal, UData, UConsulta, UParcelas, UPesquisa,UProdutos,UAguarde;

{$R *.dfm}

procedure TFrmPedido.Calculo_Rodape;
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


procedure TFrmPedido.FORNECEDOR_IDExit(Sender: TObject);
begin
  DetailSearch('Fornecedor');
end;

procedure TFrmPedido.Funcionario_idExit(Sender: TObject);
begin
DetailSearch('Funcionario');
end;

procedure TFrmPedido.Botoes_Disable;
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
  btn_importar.Enabled   := False;
  btnConferencia.Enabled :=False;
  btnDivergencia.Enabled :=False
end;

procedure TFrmPedido.Botoes_Editing;
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
  btn_importar.Enabled   := True;
  btnConferencia.Enabled := True;
  btnDivergencia.Enabled := True;
end;

procedure TFrmPedido.Botoes_Normal;
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
    btnEdit.Enabled           := True;
    btnDelete.Enabled         := True;
    btnPedido.Enabled         := True;
    btnconferencia.Enabled    := True;
  end
  else
  begin
    btnEdit.Enabled        := False;
    btnDelete.Enabled      := False;
    btnPedido.Enabled      := False;
    btnconferencia.Enabled := False;
  end;

  if not QPedido_confere.IsEmpty then
  btnDivergencia.Enabled    := True
  Else
  btnDivergencia.Enabled    := False;


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
  btn_importar.Enabled   := False;

end;

procedure TFrmPedido.DetailSearch(Tabela: String);
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

  if ((Tabela = '') or (Tabela = 'Fornecedor')) and (FORNECEDOR_ID.Text <> '') then
  begin
    QFornecedor.Close;
    QFornecedor.ParamByName('FORNECEDOR_ID').AsInteger := StrToInt(FORNECEDOR_ID.Text);
    QFornecedor.Prepare;
    QFornecedor.Open;

    if not QFornecedor.IsEmpty then
    begin
      NOME.Text      := Copy(QFornecedor.FieldByName('NOME').AsString,1,50);
      ENDERECO.Text  := Copy(QFornecedor.FieldByName('ENDERECO').AsString,1,40);
      BAIRRO.Text    := QFornecedor.FieldByName('BAIRRO').AsString;
      MUNICIPIO.Text := QFornecedor.FieldByName('MUNICIPIO').AsString;
      ESTADO.Text    := QFornecedor.FieldByName('ESTADO').AsString;
      CEP.Text       := QFornecedor.FieldByName('CEP').AsString;
    end;
  end;
end;

procedure TFrmPedido.DiasClick(Sender: TObject);
begin
  if Dias.TabIndex <> (Dias.Tabs.Count - 1) then
  begin
    CmdSelectNull := 'WHERE (PEDIDO_ID IS NOT NULL) AND (TP_PEDIDO = 0) AND (DT_MOVIMENTO = :DT_MOVIMENTO) AND (EMPRESA_ID = :EMPRESA_ID)';
    CmdOrderBy    := 'ORDER BY PEDIDO_ID';

    QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

    QTabela.ParamByName('DT_MOVIMENTO').AsDateTime := StrToDate(StrZero(IntToStr(Dias.TabIndex + 1), 2, 0) + '/' + Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 4, 7));
    QTabela.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  end
  else
  begin
    CmdSelectNull := 'WHERE (PEDIDO_ID IS NOT NULL) AND (TP_PEDIDO = 0) AND (DT_MOVIMENTO <= :DT_MOVIMENTO) AND (EMPRESA_ID = :EMPRESA_ID)';
    CmdOrderBy    := 'ORDER BY PEDIDO_ID';

    QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

    QTabela.ParamByName('DT_MOVIMENTO').AsDateTime := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
    QTabela.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  end;

  QTabela.Open;
  Botoes_Normal;
end;

procedure TFrmPedido.DT_PEDIDOEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmPedido.DT_PEDIDOKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmPedido.Habilitar(Status: Boolean);
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
  end;
end;

procedure TFrmPedido.Insert;
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

    if (Temp is TDateEdit) AND (TDateEdit(Temp).Text <>  '  /  /    ')  then
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

    if Temp is TComboBox then
      IQuery.ParamByName(TComboBox(Temp).Name).AsString := TComboBox(Temp).Text;

    if Temp is TCurrencyEdit then
      IQuery.ParamByName(TCurrencyEdit(Temp).Name).AsFloat := TCurrencyEdit(Temp).Value;

    if Temp is TRxCalcEdit then
      IQuery.ParamByName(TRxCalcEdit(Temp).Name).AsFloat := TRxCalcEdit(Temp).Value;

    if Temp is TMemo then
      IQuery.ParamByName(TMemo(Temp).Name).AsByteStr := TMemo(Temp).Text;
  end;

  IQuery.Prepare;
  IQuery.ExecSql;


  Habilitar(False);
end;

procedure TFrmPedido.Edit;
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
      if TDateEdit(Temp).Text <> '  /  /    ' then
      IQuery.ParamByName(TDateEdit(Temp).Name).AsDateTime := TDateEdit(Temp).Date;

    if Temp is TComboBox then
      IQuery.ParamByName(TComboBox(Temp).Name).AsString := TComboBox(Temp).Text;

    if Temp is TCurrencyEdit then
      IQuery.ParamByName(TCurrencyEdit(Temp).Name).AsFloat := TCurrencyEdit(Temp).Value;

    if Temp is TRxCalcEdit then
      IQuery.ParamByName(TRxCalcEdit(Temp).Name).AsFloat := TRxCalcEdit(Temp).Value;

    if Temp is TMemo then
      IQuery.ParamByName(TMemo(Temp).Name).AsByteStr := TMemo(Temp).Text;

  end;

  IQuery.ParamByName('ID').AsInteger := QTabela.FieldByName('PEDIDO_ID').AsInteger;

  IQuery.Prepare;
  IQuery.ExecSql;



  QTabela.Close;
  QTabela.Open;
  QTabela.Locate('PEDIDO_ID', ID, [loCaseInsensitive]);
  Habilitar(False);
end;

procedure TFrmPedido.ProdutoSearch;
begin
  QProduto.Close;

  QProduto.ParamByName('PRODUTO_ID').AsInteger := QSub_Detail.FieldByName('PRODUTO_ID').AsInteger;
  QProduto.ParamByName('EMPRESA_ID').AsInteger := StrToInt(EMPRESA_ID.Text);

  QProduto.Prepare;
  QProduto.Open;
end;

procedure TFrmPedido.TributoSearch;
begin
  QTributo.Close;
  QTributo.ParamByName('TRIBUTO_ID').AsInteger := QSub_Detail.FieldByName('TRIBUTO_ID').AsInteger;
  QTributo.Prepare;
  QTributo.Open;
end;

procedure TFrmPedido.EMPRESA_IDExit(Sender: TObject);
begin
  DetailSearch('Empresa');
end;

procedure TFrmPedido.EMPRESA_IDKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = EMPRESA_ID) then
    btnEmpresaClick(Self);

  if (Key = Vk_F7) and (Sender = FORNECEDOR_ID) then
    btnFornecedorClick(Self);

    if (Key = Vk_F7) and (Sender = FUNCIONARIO_ID) then
    btnFuncionarioClick(Self);
    
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

function TFrmPedido.Validacao: Boolean;
begin
  Result := False;

  FORNECEDOR_ID.Color := clWindow;
  EMPRESA_ID.Color    := clWindow;
  COND_PAGTO.Color    := clWindow;
  ESTADO.Color        := clWindow;

  if COND_PAGTO.Text = 'A PRAZO' then
  begin
   If Fornecedor_id.value > 0 Then
   Begin
    if QFornecedor.IsEmpty then
    begin
      Application.MessageBox('Fornecedor inexistente', PChar(Msg_Title), mb_IconSTop);
      FORNECEDOR_ID.Color := clYellow;
      FORNECEDOR_ID.SetFocus;
      exit;
    end;
   End;
  end;

  if FORNECEDOR_ID.Value > 0 then
  begin
    if QFornecedor.IsEmpty then
    begin
      Application.MessageBox('Fornecedor inexistente', PChar(Msg_Title), mb_IconStop);
      FORNECEDOR_ID.Color := clYellow;
      FORNECEDOR_ID.SetFocus;
      exit;
    end;
  end;

  if QFuncionario.IsEmpty then
  begin
    Application.MessageBox('Funcionário inexistente', PChar(Msg_Title), mb_IconStop);
    FUNCIONARIO_ID.Color := clYellow;
    FUNCIONARIO_ID.SetFocus;
    exit;
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
  Result := True;
end;

procedure TFrmPedido.ManutencaoShow(Sender: TObject);
begin
  Set_Campos(False);
  Botoes_Normal;
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

procedure TFrmPedido.QSub_DetailAfterOpen(DataSet: TDataSet);
begin
TFloatField(QSub_Detail.FieldByName('VR_DESCONTO')).DisplayFormat := '#,##0.00';
TFloatField(QSub_Detail.FieldByName('VR_TOTAL')).DisplayFormat    := '#,##0.00';
TFloatField(QSub_Detail.FieldByName('QUANTIDADE')).DisplayFormat  := '#,##0.00';
TFloatField(QSub_Detail.FieldByName('VR_UNITARIO')).DisplayFormat := '#,##0.00';
end;

procedure TFrmPedido.QSub_DetailBeforeDelete(DataSet: TDataSet);
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

procedure TFrmPedido.QSub_DetailBeforeEdit(DataSet: TDataSet);
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
end;

procedure TFrmPedido.QSub_DetailBeforeInsert(DataSet: TDataSet);
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
end;

procedure TFrmPedido.QSub_DetailBeforePost(DataSet: TDataSet);
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

 { if QTributo.IsEmpty then
  begin
    Application.MessageBox('Tributo inexistente', PChar(Msg_Title), mb_IconStop);
    Itens.SelectedIndex := 2;
    abort;
  end;}

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

 { if QSub_Detail.FieldByName('VR_IPI').AsFloat < 0 then
  begin
    Application.MessageBox('Vr. IPI inválido', PChar(Msg_Title), mb_IconStop);
    Itens.SelectedIndex := 5;
    abort;
  end;}

 { if (QSub_Detail.FieldByName('ALIQUOTA_ICMS').AsFloat < 0) or (QSub_Detail.FieldByName('ALIQUOTA_ICMS').AsFloat > 100) then
  begin
    Application.MessageBox('Alíquota de ICMS inválida', PChar(Msg_Title), mb_IconStop);
    Itens.SelectedIndex := 4;
    abort;
  end;}

  {if (Copy(QSub_Detail.FieldByName('CST').AsString, 1, 1) < '0') or (Copy(QSub_Detail.FieldByName('CST').AsString, 1, 1) > '2') then
  begin
    Application.MessageBox('Código CST inválido', PChar(Msg_Title), mb_IconStop);
    Itens.SelectedIndex := 3;
    abort;
  end;

  Cst := Copy(QSub_Detail.FieldByName('CST').AsString, 2, 2);

  if (Cst <> '00') and (Cst <> '10') and (Cst <> '20') and (Cst <> '30') and (Cst <> '40') and (Cst <> '41') and (Cst <> '50') and (Cst <> '51') and (Cst <> '60') then
  begin
    Application.MessageBox('Código CST inválido', PChar(Msg_Title), mb_IconStop);
    Itens.SelectedIndex := 3;
    abort;
  end; }

  QSub_Detail.FieldByName('VR_UNITARIO').AsFloat := ((QSub_Detail.FieldByName('VR_TOTAL').AsFloat + (QSub_Detail.FieldByName('VR_DESCONTO').AsFloat * QSub_Detail.FieldByName('QUANTIDADE').AsFloat)) / QSub_Detail.FieldByName('QUANTIDADE').AsFloat);
end;

procedure TFrmPedido.QSub_DetailNewRecord(DataSet: TDataSet);
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

procedure TFrmPedido.RDprint1NewPage(Sender: TObject; Pagina: Integer);
begin

  if StrToInt(InputString) = 1 then
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
    RDprint1.Imp(06, 25, '*** PEDIDO DE COMPRA ***');
    RDprint1.Imp(07, 01, '--------------------------------------------------------------------------------');
    linha := 08;
  end
  else
  begin

      RDprint1.Impf(01, Trunc( (80 - (Length(FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString))) / 2 ) , FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString, [negrito]);
      RDprint1.Imp(02,  Trunc((80 - (Length('CNPJ:' + FrmPrincipal.QEmpresa.FieldByName('CNPJ').AsString))) / 2), 'Cnpj.:' + FrmPrincipal.QEmpresa.FieldByName('CNPJ').AsString);
      RDprint1.Imp(03,  Trunc((80 - (Length('I.E.: ' + FrmPrincipal.QEmpresa.FieldByName('INSCR_ESTADUAL').AsString))) / 2 ), 'I.E.: ' + FrmPrincipal.QEmpresa.FieldByName('INSCR_ESTADUAL').AsString);
      RDprint1.Imp(04,  Trunc((80 - (Length(Copy(FrmPrincipal.QEmpresa.FieldByName('ENDERECO').AsString +' - '+ FrmPrincipal.QEmpresa.FieldByName('BAIRRO').AsString,1,50)))) / 2), Copy(FrmPrincipal.QEmpresa.FieldByName('ENDERECO').AsString +' - '+ FrmPrincipal.QEmpresa.FieldByName('BAIRRO').AsString,1,50) );

      RDprint1.Imp(05, Trunc((80 - Length(FrmPrincipal.QEmpresa.FieldByName('MUNICIPIO').AsString)) / 2 ), Copy(FrmPrincipal.QEmpresa.FieldByName('MUNICIPIO').AsString,1,20));

      RDprint1.Imp(06,  Trunc( ( 80 - Length( 'Tel.: '+ FrmPrincipal.QEmpresa.FieldByName('TELEFONE').AsString + ' - CEP: ' + FrmPrincipal.QEmpresa.FieldByName('CEP').AsString )) / 2 ), 'Tel.: '+ FrmPrincipal.QEmpresa.FieldByName('TELEFONE').AsString + ' - CEP: ' + FrmPrincipal.QEmpresa.FieldByName('CEP').AsString );

      RDprint1.LinhaH(07,01,80,0, False);
      Inc(linha);
      RDprint1.ImpF(08, Trunc( ((80 - Length('*** PEDIDO DE COMPRA ***')) / 2) ) , '*** PEDIDO DE COMPRA ***' , [negrito] );
      Inc(linha);
      RDprint1.LinhaH(09, 01, 80, 0, False);

      Linha := 10;
  end;



end;

procedure TFrmPedido.Set_Campos(Vazio: Boolean);
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

      QPedido_confere.Close;
      QPedido_confere.ParamByName('PEDIDO_ID').AsInteger := 0;
      QPedido_confere.Prepare;
      QPedido_confere.Open;

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


      QPedido_confere.Close;
      QPedido_confere.ParamByName('PEDIDO_ID').AsInteger := QTabela.FieldByName('PEDIDO_ID').AsInteger ;
      QPedido_confere.Prepare;
      QPedido_confere.Open;

      if not QPedido_confere.IsEmpty then
      Begin

        QRel.SQL.Clear;
        QRel.SQL.Add('SELECT SUM(QUANTIDADE) QTD_COLETOR , SUM (QUANTIDADE_PEDIDO) QTD_PEDIDO FROM PEDIDO_CONFERE WHERE PEDIDO_ID = :PEDIDO_ID');
        QRel.ParamByName('PEDIDO_ID').AsInteger := QTabela.FieldByName('PEDIDO_ID').AsInteger ;
        QRel.Prepare;
        QRel.Open;

        if (QRel.FieldByName('QTD_COLETOR').AsFloat) = (QRel.FieldByName('QTD_PEDIDO').AsFloat)  then
        Begin
        lbl_conferencia.Visible := True;
        lbl_conferencia.Caption := 'CONFERÊNCIA OK';
        lbl_conferencia.Font.Color := clGreen;
        End
        Else
        Begin
        lbl_conferencia.Visible := True;
        lbl_conferencia.Caption := 'ERRO CONFERÊNCIA';
        lbl_conferencia.Font.Color := clRed;
        End;

      End
      Else
        lbl_conferencia.Visible := False;

    end;
  end;

  if QTabela.IsEmpty then
    Itens.Enabled := False
  else
    Itens.Enabled := True;

  DetailSearch('');
end;

procedure TFrmPedido.StatusChange(Sender: TObject);
begin
if Status.Text = 'CANCELADO' then
   Begin
     Label18.Visible      := True;
     Cancelamento.Visible := True;
   End;
end;

procedure TFrmPedido.btnFuncionarioClick(Sender: TObject);
begin
  try
    FUNCIONARIO_ID.Value := GetConsulta('PESSOAL', 0, 0, StrToInt(FUNCIONARIO_ID.Text));
  except
    FUNCIONARIO_ID.Value := GetConsulta('PESSOAL', 0, 0, 0);
  end;

end;

procedure TFrmPedido.btnDivergenciaClick(Sender: TObject);
begin
 Relatorio_Divergencia.PreviewModal;
end;

procedure TFrmPedido.btnconferenciaClick(Sender: TObject);
begin
Relatorio_Conferencia.PreviewModal;
end;

procedure TFrmPedido.btnDeleteClick(Sender: TObject);
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
    QFornecedor.Close;
  end;
end;

procedure TFrmPedido.btnDiscardClick(Sender: TObject);
begin
  Botoes_Normal;
  Set_Campos(False);

  if QTabela.IsEmpty then
  begin
    QEmpresa.Close;
    QFornecedor.Close;
  end;

  Habilitar(False);
  Operacao := '';
  Consulta.TabVisible := True;
end;

procedure TFrmPedido.btnEditClick(Sender: TObject);
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

procedure TFrmPedido.btnEmpresaClick(Sender: TObject);
begin
  try
    EMPRESA_ID.Value := GetConsulta('EMPRESAS', 0, 0, StrToInt(EMPRESA_ID.Text));
  except
    EMPRESA_ID.Value := GetConsulta('EMPRESAS', 0, 0, 0);
  end;
end;

procedure TFrmPedido.btnFornecedorClick(Sender: TObject);
begin
  try
    FORNECEDOR_ID.Value := GetConsulta('FORNECEDORES', 0, 0, StrToInt(FORNECEDOR_ID.Text));
  except
    FORNECEDOR_ID.Value := GetConsulta('FORNECEDORES', 0, 0, 0);
  end;
end;

procedure TFrmPedido.btnInsertClick(Sender: TObject);
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
  QFornecedor.Close;

  ESTADO.Text          := '  ';
  DT_PEDIDO.Date       := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
  DT_MOVIMENTO.Date    := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
  DT_Solicitacao.Date  := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
  DT_Entrega.Date      := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
  COND_PAGTO.Text      := 'A VISTA';
  EMPRESA_ID.Value     := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  AUTORIZ_ID.Value     := FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger;
  Status.Text          := 'AGUARD. RECEB.';
  Label18.Visible      := False;
  Cancelamento.Visible := False;
  Consulta.TabVisible  := False;
  TP_PEDIDO.Value      := 0;
  DT_PEDIDO.SetFocus;
  lbl_conferencia.Visible := False;
  
end;

procedure TFrmPedido.btnNextClick(Sender: TObject);
begin
  if not QTabela.Eof then
  begin
    QTabela.Next;
    Set_Campos(False);
     ManutencaoShow(manutencao);
  end;

  Botoes_Normal;
end;

procedure TFrmPedido.btnParcelasClick(Sender: TObject);
begin
  if QTabela.FieldByName('VALOR').AsFloat > 0 then
    Divisao_Parcelas(QTabela.FieldByName('PEDIDO_ID').AsInteger, 'P', True, QTabela.FieldByName('DT_PEDIDO').AsDateTime, QTabela.FieldByName('VALOR').AsFloat);
end;

procedure TFrmPedido.btnPedidoClick(Sender: TObject);
var
Qtd_Produtos: Integer;
begin
 if LeIni(Arq_Ini, 'Sistema', 'Imp. Orçamento') = 'RDPrint' then
  Begin

     InputString := InputBox(PChar(Msg_Title), 'Modelo 1 ou 2' , '1');

     if StrToInt(InputString) = 1 then
     begin
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
          RDprint1.Imp(linha, 01, 'Fornec.:');
          RDprint1.Imp(linha, 11, Copy(QTabela.FieldByName('NOME').AsString, 1, 40));
          inc(linha);
          RDprint1.Imp(linha, 01, 'Ins./Rg.:');
          RDprint1.Imp(linha, 11, QFornecedor.FieldByName('INSCRICAO').AsString);
          RDprint1.Imp(linha, 31, 'Cnpj/Cpf:');
          RDprint1.Imp(linha, 41, QFornecedor.FieldByName('CNPJ').AsString);
          inc(linha);
          RDprint1.Imp(linha, 01, 'Endereço:');
          RDprint1.Imp(linha, 11, Copy(QTabela.FieldByName('ENDERECO').AsString, 1, 31));
          RDprint1.Imp(linha, 46, 'Nº.:');
          //RDprint1.Imp(linha, 50, QTabela.FieldByName('NUMERO').AsString);
          RDprint1.Imp(linha, 55, 'Bairro:');
          RDprint1.Imp(linha, 62, Copy (QTabela.FieldByName('BAIRRO').AsString,1,15));
          inc(linha);
          RDprint1.Imp(linha, 01, 'Cidade:');
          RDprint1.Imp(linha, 11, Copy(QTabela.FieldByName('MUNICIPIO').AsString, 1, 31));
          RDprint1.Imp(linha, 31, 'CEP:');
          RDprint1.Imp(linha, 36, QTabela.FieldByName('CEP').AsString);
          RDprint1.Imp(linha, 46, 'Telefone:');
          RDprint1.Imp(linha, 56, QFornecedor.FieldByName('TELEFONE_1').AsString);
          inc(linha);
          RDprint1.Imp(linha, 01, 'Funci.:');
          RDprint1.Imp(linha, 11, QFuncionario.FieldByName('NOME').AsString);
          RDprint1.Imp(linha, 46, 'Solic.:');
          RDprint1.Imp(linha, 55, QTabela.FieldByName('SOLICITANTE').AsString);
          inc(linha);
          RDprint1.Imp(linha, 01, 'Status:');
          RDprint1.Imp(linha, 11, QTabela.FieldByName('STATUS').AsString);
          RDprint1.Imp(linha, 21, QTabela.FieldByName('CANCELAMENTO').AsString);
          inc(linha);
          RDprint1.Imp(linha, 01, '--------------------------------------------------------------------------------');
          inc(linha);
          RDprint1.Imp(linha, 01, 'Cód.  Descrição                                  Qtd.    Pr.Un. Desc.  Pr. Total');
          inc(linha);
          RDprint1.Imp(linha, 01, '--------------------------------------------------------------------------------');
          inc(linha);

          while not QSub_Detail.Eof do
          Begin
            RDprint1.Imp(linha,01,QSub_Detail.FieldByName('PRODUTO_ID').AsString);
            RDprint1.Imp(linha,7,Copy(QSub_Detail.FieldByName('DESCRICAO').AsString ,1,39));
            RDprint1.Imp(linha,51,QSub_Detail.FieldByName('QUANTIDADE').AsString);
            RDprint1.ImpVal(linha,51,'#,###,##0.00',QSub_Detail.FieldByName('VR_UNITARIO').AsFloat,[]);
            RDprint1.ImpVal(linha,57,'#,###,##0.00',QSub_Detail.FieldByName('VR_DESCONTO').AsFloat,[]);
            RDprint1.ImpVal(linha,67,'#,###,##0.00',QSub_Detail.FieldByName('VR_TOTAL').AsFloat,[]);
            inc(linha);
            QSub_Detail.Next;
          End;
            RDprint1.Imp(linha,70,'__________');
            inc(linha);
            RDprint1.Imp(linha,45,'Total dos Produtos');
            RDprint1.ImpVal(linha,66,'##,###,##0.00',QTabela.FieldByName('VALOR_PRODUTOS').AsFloat,[]);
            inc(linha);
            RDprint1.Imp(linha,45,'Vr. ST');
            RDprint1.ImpVal(linha,66,'##,###,##0.00',QTabela.FieldByName('VR_ICMS_ST').AsFloat,[]);
            inc(linha);
            RDprint1.Imp(linha,45,'Vr. IPI');
            RDprint1.ImpVal(linha,66,'##,###,##0.00',QTabela.FieldByName('VR_IPI').AsFloat,[]);
            inc(linha);
            RDprint1.Imp(linha,45,'Vr. Frete');
            RDprint1.ImpVal(linha,66,'##,###,##0.00',QTabela.FieldByName('VR_FRETE').AsFloat,[]);
            inc(linha);
            RDprint1.Imp(linha,45,'Acrescimo');
            RDprint1.ImpVal(linha,66,'##,###,##0.00',QTabela.FieldByName('VR_ACRESCIMO').AsFloat,[]);
            inc(linha);
            RDprint1.Imp(linha,45,'Desconto');
            RDprint1.ImpVal(linha,66,'##,###,##0.00',QTabela.FieldByName('VR_DESCONTO').AsFloat,[]);
            inc(linha);

          RDprint1.Imp(linha,45,'Total do Pedido de Compra');
          RDprint1.ImpVal(linha,66,'##,###,##0.00',QTabela.FieldByName('VALOR').AsFloat,[]);
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
          IQuery.ParamByName('TIPO_TRANSACAO').AsString := 'P';

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
           RDprint1.ImpVal(linha,66,'##,###,##0.00',IQuery.FieldByName('VALOR').AsFloat,[]);
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

         Application.ProcessMessages;

         RDprint1.TamanhoQteLinhas  := 66;
         RDprint1.Fechar;
     end
     else
     begin
         if StrToInt(InputString)  =  2 then
         begin

          if CheckBox1.Checked = True then
          Begin
            RDprint1.Impressora := HP;
            RDprint1.FonteTamanhoPadrao := S10cpp;
          End;

          RDprint1.TamanhoQteColunas := 80;
          RDprint1.OpcoesPreview.Preview     := True;
          RDprint1.MostrarProgresso          := True;
          RDprint1.Acentuacao                := SemAcento;
          RDprint1.TamanhoQteLinhas          := 1;
          RDprint1.Abrir;

          if linha > 66 then
          begin
            RDprint1.novapagina;
            Pagina := Pagina + 1;
          end;

           Pagina:= 1;

           RDprint1.Imp(linha, 01, 'Nº do Pedido   : ' + QTabela.FieldByName('PEDIDO_ID').AsString);
           Inc(linha);
           RDprint1.Imp(linha, 01, 'Data do Pedido : ' + QTabela.FieldByName('DT_PEDIDO').AsString);
           Inc(linha);
           RDprint1.Imp(linha, 01, 'Data de Entrega: ' + QTabela.FieldByName('DT_ENTREGA').AsString);
           Inc(linha);
           RDprint1.Imp(linha,01,'--------------------------------------------------------------------------------');

           Inc(linha);
           Inc(linha);

            RDprint1.Imp(linha, 01, 'ÍTEM');
            RDprint1.Imp(linha, 07, 'DESCRIÇÃO');
            RDprint1.Imp(linha, 55, 'QUANTIDADE');
            RDprint1.Imp(linha, 73, 'UNIDADE');


            Inc(linha);

            QSub_Detail.Last;
            Qtd_Produtos := 1;



            QSub_Detail.First;
            while not QSub_Detail.Eof do
            Begin
              RDprint1.Imp(linha,01, IntToStr(Qtd_Produtos) );
              RDprint1.Imp(linha,7,Copy(QSub_Detail.FieldByName('DESCRICAO').AsString ,1,39));
              RDprint1.ImpVal(linha,54,',###,##0.00',QSub_Detail.FieldByName('QUANTIDADE').AsFloat,[]);
              RDprint1.Imp(linha,75,QSub_Detail.FieldByName('UNIDADE').AsString);
              inc(linha);
              Qtd_Produtos := Qtd_Produtos + 1;
              QSub_Detail.Next;
            End;

          RDprint1.Imp(linha,01,'--------------------------------------------------------------------------------');
          inc(linha);

          RDprint1.ImpF(linha, 01, 'Total Produtos '+ IntToStr(Qtd_Produtos), []);

          Inc(linha);
          Inc(linha);


           RDprint1.Imp(linha, 2,  '__________________________________');
           RDprint1.Imp(linha, 41, '__________________________________');

           Inc(linha);

           RDprint1.Imp(linha, 7, 'Assinatura Fornecedor');
           RDprint1.Imp(linha, 47, 'Assinatura Conferente');


           RDprint1.TamanhoQteLinhas          := 66;
           RDprint1.Fechar;

         end;
     end;


    End
    Else
    Pedido.PreviewModal;
end;

procedure TFrmPedido.btnPesquisaClick(Sender: TObject);
var
Condicao: String;
begin
  Condicao := GetPesquisa('PEDIDOS');

  if Condicao <> '' then
  begin
    CmdSelectNull := Condicao + ' AND (TP_PEDIDO = 0) AND (EMPRESA_ID = :EMPRESA_ID)';
    QTabela.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  end;

  CmdOrderBy := 'ORDER BY PEDIDO_ID';

  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

  QTabela.Prepare;
  QTabela.Open;

  Set_Campos(False);
  Botoes_Normal;
end;

procedure TFrmPedido.btnPriorClick(Sender: TObject);
begin
  if not QTabela.Bof then
  begin
    QTabela.Prior;
    Set_Campos(False);
    ManutencaoShow(manutencao);
  end;

  Botoes_Normal;
end;

procedure TFrmPedido.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPedido.btnSaveClick(Sender: TObject);
begin
  DetailSearch('');

  if Validacao then
  begin

    VALOR.Value := VALOR_PRODUTOS.Value + VR_ICMS_ST.Value + VR_IPI.Value + VR_FRETE.Value + VR_ACRESCIMO.Value - VR_DESCONTO.Value;

    if Operacao = 'Inserindo' then
    begin
      Insert;

      CmdSelectNull := 'WHERE (PEDIDO_ID IS NOT NULL) AND (TP_PEDIDO = 0) AND (DT_MOVIMENTO = :DT_MOVIMENTO) AND (EMPRESA_ID = :EMPRESA_ID)';
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
      QFornecedor.Close;
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
      IQuery.ParamByName('TIPO_TRANSACAO').AsString := 'P';

      IQuery.Prepare;
      IQuery.ExecSql;


    end;

    Operacao := '';
    Consulta.TabVisible := True;
    Calculo_Rodape;
  end;
end;

procedure TFrmPedido.btn_importarClick(Sender: TObject);
var
F1: TextFile;
S,Separador: String;
Qtd :  Real;
begin
   // ALTERADO SEPARADOR DE ';' PARA ',' POR SOLICITAÇAO DE REGIVALDO 02/08/16
    QArq.Sql.Clear;
    QArq.Sql.Add('DELETE FROM PEDIDO_CONFERE WHERE PEDIDO_ID = :PEDIDO_ID');
    QArq.ParamByName('PEDIDO_ID').AsInteger := QTabela.FieldByName('PEDIDO_ID').AsInteger;

    QArq.Prepare;
    QArq.ExecSql;



    QSub_Detail.First;
    while not QSub_Detail.Eof do
    begin
       QRel.sql.Clear;
       QRel.SQL.Add('SELECT * FROM PRODUTOS WHERE PRODUTO_ID = :PRODUTO_ID');
       QRel.ParamByName('PRODUTO_ID').AsInteger := QSub_Detail.FieldByName('PRODUTO_ID').AsInteger;
       QRel.Prepare;
       QRel.Open;

        if NOT QRel.IsEmpty then
        bEGIN
         QUpdate.SQL.Clear;
         QUpdate.SQL.Add('INSERT INTO PEDIDO_CONFERE(PEDIDO_ID, PRODUTO_ID, DESCRICAO, COD_BARRAS, UNIDADE, QUANTIDADE_PEDIDO)');
         QUpdate.SQL.Add('VALUES(:PEDIDO_ID, :PRODUTO_ID, :DESCRICAO, :COD_BARRAS, :UNIDADE, :QUANTIDADE_PEDIDO)');

         QUpdate.ParamByName('PEDIDO_ID').AsInteger  := QTabela.FieldByName('PEDIDO_ID').AsInteger;
         QUpdate.ParamByName('PRODUTO_ID').AsInteger := QRel.FieldByName('PRODUTO_ID').AsInteger;
         QUpdate.ParamByName('DESCRICAO').AsString   := COPY(QRel.FieldByName('DESCRICAO').AsString,1,40);
         QUpdate.ParamByName('COD_BARRAS').AsString  := QRel.FieldByName('COD_BARRA').AsString;;
         QUpdate.ParamByName('UNIDADE').AsString     := QRel.FieldByName('UNIDADE').AsString;
         QUpdate.ParamByName('QUANTIDADE_PEDIDO').AsFloat   := QSub_Detail.FieldByName('QUANTIDADE').AsFloat;

         QUpdate.Prepare;
         QUpdate.ExecSQL;


        end;
       QSub_Detail.Next;
    End;

  OpenDialog1.Title      := 'Selecione o Arquivo';
  OpenDialog1.DefaultExt := '*.Txt';
  OpenDialog1.Filter     := 'Arquivos TXT (*.Txt)|*.Txt|Todos os Arquivos (*.*)|*.*';
  OpenDialog1.InitialDir := ExtractFilePath(ParamStr(0));

  if OpenDialog1.Execute then
  begin
  AssignFile(F1, OpenDialog1.FileName);
  Reset(F1);

  while not Eof(F1) do
   begin
    ReadLn(F1,S);

   end;
    Reset(F1);
    try
        if (FrmAguarde = nil) then
        FrmAguarde := TFrmAguarde.Create(Application);
        FrmAguarde.Label2.Visible := True;
        FrmAguarde.Label1.Caption := 'Importando arquivo..... Favor Aguarde...';
        FrmAguarde.Show;
        FrmAguarde.BringToFront;





       while not Eof(F1) do
       begin
        Try

           ReadLn(F1, S);

           if COPY(S, 14,1) = ';' then

           Separador := ';'
           Else
           Separador := ',' ;


           QRel.sql.Clear;
           QRel.SQL.Add('SELECT * FROM PRODUTOS WHERE COD_BARRA = :COD_BARRA');
           QRel.ParamByName('COD_BARRA').AsString := Copy(S, 1, Pos(Separador, S) - 1);
           QRel.Prepare;
           QRel.Open;

           if NOT QRel.IsEmpty then
           begin
            QArq.Sql.Clear;
            QArq.Sql.Add('SELECT  * ');
            QArq.Sql.Add('FROM PEDIDO_CONFERE');
            QArq.Sql.Add('WHERE');
            QArq.Sql.Add('(COD_BARRAS = :COD_BARRAS)');
            QArq.Sql.Add(' AND (PEDIDO_ID = :PEDIDO_ID)');

            QArq.ParamByName('COD_BARRAS').AsString  := Copy(S, 1, Pos(Separador, S) - 1);
            QArq.ParamByName('PEDIDO_ID').AsInteger := QTabela.FieldByName('PEDIDO_ID').AsInteger;

            QArq.Prepare;
            QArq.Open;

            if QArq.IsEmpty then
            begin
             QUpdate.SQL.Clear;
             QUpdate.SQL.Add('INSERT INTO PEDIDO_CONFERE(PEDIDO_ID, PRODUTO_ID, DESCRICAO, COD_BARRAS, UNIDADE, QUANTIDADE)');
             QUpdate.SQL.Add('VALUES(:PEDIDO_ID, :PRODUTO_ID, :DESCRICAO, :COD_BARRAS, :UNIDADE, :QUANTIDADE)');

             QUpdate.ParamByName('PEDIDO_ID').AsInteger  := QTabela.FieldByName('PEDIDO_ID').AsInteger;
             QUpdate.ParamByName('PRODUTO_ID').AsInteger := QRel.FieldByName('PRODUTO_ID').AsInteger;
             QUpdate.ParamByName('DESCRICAO').AsString   := COPY(QRel.FieldByName('DESCRICAO').AsString,1,40);
             QUpdate.ParamByName('COD_BARRAS').AsString  := Copy(S, 1, Pos(Separador, S) - 1);
             QUpdate.ParamByName('UNIDADE').AsString     := QRel.FieldByName('UNIDADE').AsString;
             QUpdate.ParamByName('QUANTIDADE').AsFloat   := StrToFloat(Copy(S, Pos(Separador, S) + 1, 6));

             QUpdate.Prepare;
             QUpdate.ExecSQL;



            End
            Else
            begin

              Qtd := StrToFloat(Copy(S, Pos(Separador, S) + 1, 6));

              QUpdate.Sql.Clear;
              QUpdate.Sql.Add('UPDATE PEDIDO_CONFERE SET QUANTIDADE = QUANTIDADE +  :CONTAGEM');
              QUpdate.Sql.Add('WHERE');
              QUpdate.Sql.Add('(COD_BARRAS = :COD_BARRAS)');
              QUpdate.Sql.Add('AND (PEDIDO_ID = :PEDIDO_ID)');

              QUpdate.ParamByName('CONTAGEM').AsFloat         := Qtd;
              QUpdate.ParamByName('COD_BARRAS').AsString      := Copy(S, 1, Pos(Separador, S) - 1);
              QUpdate.ParamByName('PEDIDO_ID').AsInteger      := QTabela.FieldByName('PEDIDO_ID').AsInteger;

              QUpdate.Prepare;
              QUpdate.ExecSql;



              FrmAguarde.Label1.Caption := 'Pedido Código de Barras :' + Copy(S, 1, Pos(Separador, S) - 1) ;


            end;
            Application.ProcessMessages;

           end
           else
            Begin
             if Copy(S, 1, Pos(Separador, S) - 1) = '' then
              Application.MessageBox(Pchar('Arquivo contem linhas em branco favor verificar!' + Copy(S, 1, Pos(Separador, S) - 1)) , PChar(Msg_Title), mb_IconInformation)
             Else
              Application.MessageBox(Pchar('Produto não localizado Código de Barras :' + Copy(S, 1, Pos(Separador, S) - 1)) , PChar(Msg_Title), mb_IconInformation);
            End;

        Except
          on e:Exception do
            begin
              Application.MessageBox(PChar('Erro ao importar produtos do coletor verifique!' + #13 +
                'Erro: ' + e.Message + ' ' + Copy(S, 1, Pos(Separador, S) - 1) ), 'Erro', MB_ICONSTOP + MB_TASKMODAL);
            end;
        End;

       end;

       DT_CONFERENCIA.Date := Date;

       {QUpdate.SQL.Clear;
       QUpdate.sql.Add('UPDATE PEDIDOS SET DT_CONFERENCIA = :DT_CONFERENCIA');
       QUpdate.SQL.Add('WHERE PEDIDO_ID = :PEDIDO_ID');

       QUpdate.ParamByName('DT_CONFERENCIA').AsDateTime := Date;
       QUpdate.ParamByName('PEDIDO_ID').AsInteger       := QTabela.FieldByName('PEDIDO_ID').AsInteger;

       QUpdate.Prepare;
       QUpdate.ExecSql;




       QTabela.Close;
       QTabela.Open;
       QTabela.Locate('PEDIDO_ID', ID , [loCaseInsensitive]); }

    Finally
      CloseFile(F1);
      FrmAguarde.Label1.Caption                            := 'Importação Concluída!';
      FrmAguarde.Close;
    end;

    QSub_Detail.First;
    while not QSub_Detail.Eof do
    begin
      QUpdate.SQL.Clear;
      QUpdate.SQL.Add('UPDATE PEDIDO_CONFERE SET QUANTIDADE_PEDIDO = :QUANTIDADE_PEDIDO, DIVERGENCIA =  QUANTIDADE - :QUANTIDADE_PEDIDO ');
      QUpdate.SQL.Add('WHERE PEDIDO_ID = :PEDIDO_ID AND PRODUTO_ID = :PRODUTO_ID');

      QUpdate.ParamByName('QUANTIDADE_PEDIDO').AsFloat   := QSub_Detail.FieldByName('QUANTIDADE').AsFloat;
      QUpdate.ParamByName('PEDIDO_ID').AsInteger         := QTabela.FieldByName('PEDIDO_ID').AsInteger;
      QUpdate.ParamByName('PRODUTO_ID').AsInteger        := QSub_Detail.FieldByName('PRODUTO_ID').AsInteger;
      QUpdate.Prepare;
      QUpdate.ExecSQL;



     QSub_Detail.Next;
    end;

       QPedido_confere.Close;
       QPedido_confere.ParamByName('PEDIDO_ID').AsInteger := QTabela.FieldByName('PEDIDO_ID').AsInteger;
       QPedido_confere.Open;

       if not QPedido_confere.IsEmpty then
      Begin
        QRel.SQL.Clear;
        QRel.SQL.Add('SELECT SUM(QUANTIDADE) QTD_COLETOR , SUM (QUANTIDADE_PEDIDO) QTD_PEDIDO FROM PEDIDO_CONFERE WHERE PEDIDO_ID = :PEDIDO_ID');
        QRel.ParamByName('PEDIDO_ID').AsInteger := QTabela.FieldByName('PEDIDO_ID').AsInteger ;
        QRel.Prepare;
        QRel.Open;

        if (QRel.FieldByName('QTD_COLETOR').AsFloat) = (QRel.FieldByName('QTD_PEDIDO').AsFloat)  then
        Begin
        lbl_conferencia.Visible := True;
        lbl_conferencia.Caption := 'CONFERÊNCIA OK';
        lbl_conferencia.Font.Color := clGreen;
        End
        Else
        begin
        lbl_conferencia.Visible := True;
        lbl_conferencia.Caption := 'ERRO CONFERÊNCIA';
        lbl_conferencia.Font.Color := clRed;
        End

      End
      Else
        lbl_conferencia.Visible := False;

    Application.MessageBox('Processo executado com sucesso', PChar(Msg_Title), mb_IconInformation);
  end;
end;

procedure TFrmPedido.ConsultaShow(Sender: TObject);
begin
  Botoes_Normal;
end;

procedure TFrmPedido.DBGrid1DblClick(Sender: TObject);
begin
  Manutencao.Show;
end;

procedure TFrmPedido.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
OldBkMode: Integer;
begin
 if QTabela.FieldByName('STATUS').AsString = 'RECEBIDO' then
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

procedure TFrmPedido.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Manutencao.Show;
end;

procedure TFrmPedido.DBGrid1TitleClick(Column: TColumn);
begin
  CmdOrderBy := 'ORDER BY ' + Column.FieldName;

  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;
  QTabela.Open;
end;

procedure TFrmPedido.ItensColEnter(Sender: TObject);
begin
  if QSub_Detail.State in [dsInsert, dsEdit] then
  begin
    ProdutoSearch;
    TributoSearch;

    if (Itens.SelectedField.FieldName = 'tributo_id') and (QProduto.IsEmpty) then
      Itens.SelectedIndex := 0;

    if (Itens.SelectedField.FieldName = 'cst') and (QTributo.IsEmpty) then
      Itens.SelectedIndex := 2;

    if (Itens.SelectedField.FieldName = 'unidade') and (QSub_Detail.FieldByName('quantidade').AsFloat = 0) then
      Itens.SelectedIndex := 6;

    if (Itens.SelectedField.FieldName = 'vr_desconto') and (QSub_Detail.FieldByName('vr_unitario').AsFloat = 0) then
      Itens.SelectedIndex := 8;
  end;
end;

procedure TFrmPedido.ItensColExit(Sender: TObject);
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
        QSub_Detail.FieldByName('VR_UNITARIO').AsFloat   := QProduto.FieldByName('CUSTO_COMPRA').AsFloat;
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
  end;
end;

procedure TFrmPedido.ItensEnter(Sender: TObject);
begin
  Botoes_Disable;
  Consulta.TabVisible := False;
end;

procedure TFrmPedido.ItensExit(Sender: TObject);
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

procedure TFrmPedido.ItensKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F4) and (QSub_Detail.State = dsBrowse) and (not QSub_Detail.IsEmpty) then
    QSub_Detail.Delete;

  if (Key = Vk_F7) and ((Itens.SelectedField.FieldName = 'produto_id') or (Itens.SelectedField.FieldName = 'tributo_id')) and (QSub_Detail.State in [dsInsert, dsEdit]) then
  begin
    if Itens.SelectedField.FieldName = 'produto_id' then
      QSub_Detail.FieldByName('PRODUTO_ID').AsInteger := GetConsulta('ESTOQUE', StrToInt(EMPRESA_ID.Text), StrToInt(FORNECEDOR_ID.Text), QSub_Detail.FieldByName('PRODUTO_ID').AsInteger);

    if Itens.SelectedField.FieldName = 'tributo_id' then
      QSub_Detail.FieldByName('TRIBUTO_ID').AsInteger := GetConsulta('TRIBUTOS', 0, 0, QSub_Detail.FieldByName('TRIBUTO_ID').AsInteger);
  end;

  if Key = VK_F9 then
    Perform(Wm_NextDlgCtl, 0, 0);

  if ((Key = Vk_Up) or (Key = Vk_Down)) and (QSub_Detail.State in [dsInsert, dsEdit]) then
    Key := 0;

  if Key = Vk_F10 then
  TFrmProdutos.Create(Application);


end;

procedure TFrmPedido.ItensKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #46 then
    Key := #44;

  if Key = #13 then
    Keybd_Event(VK_TAB, 0, 0, 0);

  Key := AnsiUpperCase(Key)[1];
end;

procedure TFrmPedido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmPedido.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (Operacao = 'Inserindo') or (Operacao = 'Alterando') or (QSub_Detail.State in [dsInsert, dsEdit]) then
  begin
    Application.MessageBox('É melhor salvar as alterações antes de continuar', PChar(Msg_Title), mb_IconStop);
    CanClose := False;
  end;
end;

procedure TFrmPedido.FormCreate(Sender: TObject);
var
X, Ult_Dia: Integer;
begin
  DBGrid1.Columns[0].Width := 50;
  DBGrid1.Columns[1].Width := 79;
  DBGrid1.Columns[2].Width := 79;
  DBGrid1.Columns[3].Width := 253;
  DBGrid1.Columns[4].Width := 100;
  DBGrid1.Columns[5].Width := 95;

  Ult_Dia := StrToInt(Copy(DateToStr(Ult_Dia_Mes(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime)), 1, 2));
  Dias.Tabs.Clear;

  for X := 1 to Ult_Dia do
    Dias.Tabs.Add(IntToStr(X));

  Dias.Tabs.Add('Todos');

  DT_MOVIMENTO.MinDate := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
  DT_MOVIMENTO.MaxDate := StrToDate('31/12/2026');

  Itens.Columns[0].Width  := 45;
  Itens.Columns[1].Width  := 400;
  Itens.Columns[2].Width  := 50;
  Itens.Columns[3].Width  := 43;
  Itens.Columns[4].Width  := 60;
  Itens.Columns[5].Width  := 60;
  Itens.Columns[6].Width  := 60;
  Itens.Columns[7].Width  := 30;

  CmdSelect     := QTabela.Sql.Text;
  CmdSelectNull := 'WHERE (PEDIDO_ID IS NOT NULL) AND (TP_PEDIDO = 0) AND (DT_MOVIMENTO = :DT_MOVIMENTO) AND (EMPRESA_ID = :EMPRESA_ID)';
  CmdOrderBy    := 'ORDER BY PEDIDO_ID';

  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

  QTabela.ParamByName('DT_MOVIMENTO').AsDateTime := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
  QTabela.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  QTabela.Open;
  Botoes_Normal;
  Consulta.Show;
  Detailsearch('');

end;

procedure TFrmPedido.FormShow(Sender: TObject);
begin
  DBGrid1.SetFocus;
  
end;

end.
