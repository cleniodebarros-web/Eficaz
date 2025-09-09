unit UOrcamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ComCtrls, ToolWin, StdCtrls, Grids, DBGrids, Tabs, ExtCtrls,
  DB, IBCustomDataSet, IBQuery, Mask, Buttons, DBCtrls, rxCurrEdit, rxToolEdit,
  IBUpdateSQL, Math, QRCtrls, QuickRpt, RDprint, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet, Vcl.Imaging.jpeg, ACBrBase,
  ACBrPosPrinter;


type

  TFrmOrcamento = class(TForm)
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
    DT_ORCAMENTO: TDateEdit;
    EMPRESA_ID: TCurrencyEdit;
    CLIENTE_ID: TCurrencyEdit;
    DataEmpresa: TDataSource;
    DataCliente: TDataSource;
    DBText1: TDBText;
    DBText2: TDBText;
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
    btnCliente: TSpeedButton;
    VALOR_PRODUTOS: TRxCalcEdit;
    DataSub_Detail: TDataSource;
    Label22: TLabel;
    VALOR: TRxCalcEdit;
    Label24: TLabel;
    VR_DESCONTO: TRxCalcEdit;
    Label25: TLabel;
    VR_ACRESCIMO: TRxCalcEdit;
    COND_PAGTO: TComboBox;
    btnParcelas: TSpeedButton;
    Dias: TTabSet;
    Label26: TLabel;
    VENDEDOR_ID: TCurrencyEdit;
    btnVendedor: TSpeedButton;
    DBText6: TDBText;
    Label27: TLabel;
    DataVendedor: TDataSource;
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
    CEP: TMaskEdit;
    btnPesquisa: TBitBtn;
    btnOrcamento: TBitBtn;
    Orcamento_Reduzido: TQuickRep;
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
    btnLog: TButton;
    QRLabel1: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    Reduzido: TQuickRep;
    QRBand6: TQRBand;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRBand8: TQRBand;
    QRLabel59: TQRLabel;
    QRSysData6: TQRSysData;
    QRLabel60: TQRLabel;
    QRShape13: TQRShape;
    QRDBText38: TQRDBText;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRShape14: TQRShape;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRShape15: TQRShape;
    QRBand9: TQRBand;
    QRDBText39: TQRDBText;
    QRShape16: TQRShape;
    QRLabel68: TQRLabel;
    QRDBText40: TQRDBText;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel20: TQRLabel;
    NUMERO: TEdit;
    Label6: TLabel;
    CONTATO: TEdit;
    Label23: TLabel;
    OBSERVACAO: TMemo;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRMemo1: TQRMemo;
    QRMemo2: TQRMemo;
    QRLabel23: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel24: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel27: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel30: TQRLabel;
    QRDBText20: TQRDBText;
    QRLabel31: TQRLabel;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRLabel32: TQRLabel;
    RDprint1: TRDprint;
    CheckBox1: TCheckBox;
    Orcamento: TQuickRep;
    QRBand3: TQRBand;
    QRShape4: TQRShape;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText34: TQRDBText;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRDBText35: TQRDBText;
    QRShape6: TQRShape;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRShape7: TQRShape;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel43: TQRLabel;
    QRSysData4: TQRSysData;
    QRLabel44: TQRLabel;
    QRDBText36: TQRDBText;
    QRLabel45: TQRLabel;
    QRDBText37: TQRDBText;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRDBText41: TQRDBText;
    QRLabel50: TQRLabel;
    QRDBText42: TQRDBText;
    QRLabel51: TQRLabel;
    QRDBText43: TQRDBText;
    QRLabel52: TQRLabel;
    QRDBText44: TQRDBText;
    QRLabel53: TQRLabel;
    QRDBText45: TQRDBText;
    QRDBText46: TQRDBText;
    QRLabel54: TQRLabel;
    QRBand4: TQRBand;
    QRDBText47: TQRDBText;
    QRDBText48: TQRDBText;
    QRDBText49: TQRDBText;
    QRDBText50: TQRDBText;
    QRDBText51: TQRDBText;
    QRDBText52: TQRDBText;
    QRBand5: TQRBand;
    QRLabel55: TQRLabel;
    QRDBText53: TQRDBText;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRDBText54: TQRDBText;
    QRDBText55: TQRDBText;
    QRShape8: TQRShape;
    QRExpr2: TQRExpr;
    QRLabel58: TQRLabel;
    QRLabel72: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    QRDBText56: TQRDBText;
    QRLabel75: TQRLabel;
    QRLabel76: TQRLabel;
    QRMemo3: TQRMemo;
    QRMemo4: TQRMemo;
    RDprint2: TRDprint;
    QCliente: TFDQuery;
    QVendedor: TFDQuery;
    Qempresa: TFDQuery;
    IQuery: TFDQuery;
    QTabela: TFDQuery;
    QVencimento: TFDQuery;
    QTributo: TFDQuery;
    QProduto: TFDQuery;
    QSub_Detail: TFDQuery;
    USql_OrcItens: TFDUpdateSQL;
    QServico: TFDQuery;
    QrLogo: TQRImage;
    QrLogo2: TQRImage;
    QSearch: TFDQuery;
    Label11: TLabel;
    Lanc_Futuro: TComboBox;
    QUpdate: TFDQuery;
    VENDEDOR_ID_2: TCurrencyEdit;
    btnVendedor_2: TSpeedButton;
    DBText3: TDBText;
    QVendedor_2: TFDQuery;
    DataVendedor_2: TDataSource;
    ACBrPosPrinter1: TACBrPosPrinter;
    QSelect: TFDQuery;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    QRDBText57: TQRDBText;
    QRLabel40: TQRLabel;
    QRLabel79: TQRLabel;
    QRDBText58: TQRDBText;
    Itens: TDBGrid;
    QRLabel81: TQRLabel;
    QRDBText60: TQRDBText;
    QRLabel82: TQRLabel;
    QRDBText61: TQRDBText;
    Label13: TLabel;
    TELEFONE: TMaskEdit;
    Label10: TLabel;
    Setor: TComboBox;
    QRDBText62: TQRDBText;
    QRLabel80: TQRLabel;
    QRDBText59: TQRDBText;
    QRLabel83: TQRLabel;
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
    procedure btnVendedorClick(Sender: TObject);
    procedure VENDEDOR_IDExit(Sender: TObject);
    procedure btnParcelasClick(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ConsultaShow(Sender: TObject);
    procedure DT_ORCAMENTOKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnOrcamentoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnLogClick(Sender: TObject);
    procedure QSub_DetailBeforeEdit(DataSet: TDataSet);
    procedure DT_ORCAMENTOEnter(Sender: TObject);
    procedure QSub_DetailBeforeInsert(DataSet: TDataSet);
    procedure RDprint1NewPage(Sender: TObject; Pagina: Integer);
    procedure RDprint1BeforeNewPage(Sender: TObject; Pagina: Integer);
    procedure VR_DESCONTOExit(Sender: TObject);
    procedure OBSERVACAOEnter(Sender: TObject);
    procedure RDprint2BeforeNewPage(Sender: TObject; Pagina: Integer);
    procedure QSub_DetailAfterOpen(DataSet: TDataSet);
    procedure QTabelaAfterOpen(DataSet: TDataSet);
    procedure OrcamentoBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure Orcamento_ReduzidoBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnVendedor_2Click(Sender: TObject);

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
    procedure Ordenar(Valores: tStrings);
    procedure ServicoSearch;
  end;



var
  FrmOrcamento: TFrmOrcamento;
  Operacao: String;
  ID , linha ,linha2,linha3, pagina,Tamanho_pagina: Integer;
  Desc_por:Real;

implementation

uses
  UPrincipal, UData, UConsulta, UParcelas, UPesquisa,UGerente,UAcesso;

{$R *.dfm}

procedure TFrmOrcamento.ServicoSearch;
begin
  QServico.Close;
  QServico.ParamByName('SERVICO_ID').AsInteger := QSub_Detail.FieldByName('PRODUTO_ID').AsInteger;
  QServico.Prepare;
  QServico.Open;
end;


procedure TFrmOrcamento.OrcamentoBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
 if FileExists(ExtractFilePath(ParamStr(0)) + 'Logo_Danfe.Jpg') then
QrLogo.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Logo_Danfe.Jpg');
//LabelEndereco.Caption := FrmPrincipal.QEmpresa.FieldByName('ENDERECO').AsString + ',' + FrmPrincipal.QEmpresa.FieldByName('NUMERO').AsString + ' - ' + FrmPrincipal.QEmpresa.FieldByName('BAIRRO').AsString + ' - ' + FrmPrincipal.QEmpresa.FieldByName('MUNICIPIO').AsString;
end;

procedure TFrmOrcamento.Orcamento_ReduzidoBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
 if FileExists(ExtractFilePath(ParamStr(0)) + 'Logo_Orcamento.jpg') then
QrLogo2.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Logo_Orcamento.jpg');
//LabelEndereco.Caption := FrmPrincipal.QEmpresa.FieldByName('ENDERECO').AsString + ',' + FrmPrincipal.QEmpresa.FieldByName('NUMERO').AsString + ' - ' + FrmPrincipal.QEmpresa.FieldByName('BAIRRO').AsString + ' - ' + FrmPrincipal.QEmpresa.FieldByName('MUNICIPIO').AsString;

end;

procedure  TFrmOrcamento.Ordenar(Valores: tStrings);
var i, j : integer;
    temp : string;
begin
  for i := 0 to Valores.Count - 1 do
    for j := 0 to Valores.Count - 2 do
    begin
      if ansiUpperCase(Valores[j]) > ansiUpperCase(Valores[j + 1]) then
      begin
        TEmp := Valores[j];
        Valores[j] := Valores[j + 1];
        Valores[j + 1 ] := TEmp;
      end;
    end;
end;

procedure TFrmOrcamento.CLIENTE_IDExit(Sender: TObject);
begin
  DetailSearch('Cliente');
end;

procedure TFrmOrcamento.ConsultaShow(Sender: TObject);
begin
  Botoes_Normal;
end;

procedure TFrmOrcamento.Botoes_Disable;
begin
  btnPrior.Enabled     := False;
  btnNext.Enabled      := False;
  btnInsert.Enabled    := False;
  btnEdit.Enabled      := False;
  btnDelete.Enabled    := False;
  btnSave.Enabled      := False;
  btnDiscard.Enabled   := False;
  btnRetorna.Enabled   := False;
  btnEmpresa.Enabled   := False;
  btnCliente.Enabled   := False;
  btnVendedor.Enabled  := False;
  btnParcelas.Enabled  := False;
  btnPesquisa.Enabled  := False;
  btnOrcamento.Enabled := False;
  btnLog.Enabled       := False;
  CheckBox1.Enabled    := False;
  end;

procedure TFrmOrcamento.Botoes_Editing;
begin
  btnPrior.Enabled     := False;
  btnNext.Enabled      := False;
  btnInsert.Enabled    := False;
  btnEdit.Enabled      := False;
  btnDelete.Enabled    := False;
  btnSave.Enabled      := True;
  btnDiscard.Enabled   := True;
  btnRetorna.Enabled   := False;
  btnEmpresa.Enabled   := True;
  btnCliente.Enabled   := True;
  btnVendedor.Enabled  := True;
  btnParcelas.Enabled  := False;
  btnPesquisa.Enabled  := False;
  btnOrcamento.Enabled := False;
  btnLog.Enabled       := False;
end;

procedure TFrmOrcamento.Botoes_Normal;
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
    btnEdit.Enabled      := True;
    btnDelete.Enabled    := True;
    btnOrcamento.Enabled := True;
    btnLog.Enabled       := True;
    CheckBox1.Enabled    := True;
  end
  else
  begin
    btnEdit.Enabled      := False;
    btnDelete.Enabled    := False;
    btnOrcamento.Enabled := False;
    btnLog.Enabled       := False;
    CheckBox1.Enabled    := False;
  end;

  if QTabela.FieldByName('COND_PAGTO').AsString = 'A PRAZO' then
    btnParcelas.Enabled := True
  else
    btnParcelas.Enabled := False;

  btnSave.Enabled     := False;
  btnDiscard.Enabled  := False;
  btnRetorna.Enabled  := True;
  btnEmpresa.Enabled  := False;
  btnCliente.Enabled  := False;
  btnVendedor.Enabled := False;
  btnPesquisa.Enabled := True;
end;

procedure TFrmOrcamento.DetailSearch(Tabela: String);
begin
  if ((Tabela = '') or (Tabela = 'Empresa')) and (EMPRESA_ID.Text <> '') then
  begin
    QEmpresa.Close;
    QEmpresa.ParamByName('EMPRESA_ID').AsInteger := StrToInt(EMPRESA_ID.Text);
    QEmpresa.Prepare;
    QEmpresa.Open;
  end;

  if ((Tabela = '') or (Tabela = 'Cliente')) and (CLIENTE_ID.Text <> '') then
  begin
    QCliente.Close;
    QCliente.ParamByName('CLIENTE_ID').AsInteger := StrToInt(CLIENTE_ID.Text);
    QCliente.Prepare;
    QCliente.Open;

    if not QCliente.IsEmpty then
    begin
      NOME.Text      := Copy(QCliente.FieldByName('NOME').AsString, 1, 40);
      ENDERECO.Text  := Copy(QCliente.FieldByName('ENDERECO').AsString, 1, 40);
      NUMERO.Text    := QCliente.FieldByName('NUMERO').AsString;
      BAIRRO.Text    := Copy(QCliente.FieldByName('BAIRRO').AsString, 1, 20);
      MUNICIPIO.Text := QCliente.FieldByName('MUNICIPIO').AsString;
      ESTADO.Text    := QCliente.FieldByName('ESTADO').AsString;
      CEP.Text       := QCliente.FieldByName('CEP').AsString;
      CONTATO.Text   := QCliente.FieldByName('CONTATO').AsString;
      Telefone.Text  := QCliente.FieldByName('TELEFONE_1').AsString;
    end;
  end;

  if ((Tabela = '') or (Tabela = 'Vendedor')) and (VENDEDOR_ID.Text <> '') then
  begin
    QVendedor.Close;
    QVendedor.ParamByName('FUNCIONARIO_ID').AsInteger := StrToInt(VENDEDOR_ID.Text);
    QVendedor.Prepare;
    QVendedor.Open;

    QVendedor_2.Close;
    QVendedor_2.ParamByName('FUNCIONARIO_ID').AsInteger := StrToInt(VENDEDOR_ID_2.Text);
    QVendedor_2.Prepare;
    QVendedor_2.Open;
  end;
end;

procedure TFrmOrcamento.DiasClick(Sender: TObject);
begin
  if Dias.TabIndex <> (Dias.Tabs.Count - 1) then
  begin
    CmdSelectNull := 'WHERE (ORCAMENTO_ID IS NOT NULL) AND (DT_MOVIMENTO = :DT_MOVIMENTO) AND (EMPRESA_ID = :EMPRESA_ID) AND (COMANDA IS NULL)';
    CmdOrderBy    := 'ORDER BY ORCAMENTO_ID';

    QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

    QTabela.ParamByName('DT_MOVIMENTO').AsDateTime := StrToDate(StrZero(IntToStr(Dias.TabIndex + 1), 2, 0) + '/' + Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 4, 7));
    QTabela.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  end
  else
  begin
    CmdSelectNull := 'WHERE (ORCAMENTO_ID IS NOT NULL) AND (DT_MOVIMENTO <= :DT_MOVIMENTO) AND (EMPRESA_ID = :EMPRESA_ID) AND (COMANDA IS NULL)';
    CmdOrderBy    := 'ORDER BY ORCAMENTO_ID';

    QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

    QTabela.ParamByName('DT_MOVIMENTO').AsDateTime := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
    QTabela.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  end;

  QTabela.Open;
  QTabela.Last;
  Botoes_Normal;
end;

procedure TFrmOrcamento.DT_ORCAMENTOEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmOrcamento.DT_ORCAMENTOKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmOrcamento.Habilitar(Status: Boolean);
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

procedure TFrmOrcamento.Insert;
var
I: Integer;
Temp: TComponent;
Sql, Par: String;
begin
  Sql := 'INSERT INTO ORCAMENTOS(';
  Par := '';

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
    begin
      if Sql = 'INSERT INTO ORCAMENTOS(' then
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
      if Sql = 'INSERT INTO ORCAMENTOS(' then
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
      if Sql = 'INSERT INTO ORCAMENTOS(' then
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
      if Sql = 'INSERT INTO ORCAMENTOS(' then
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
      if Sql = 'INSERT INTO ORCAMENTOS(' then
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
      if Sql = 'INSERT INTO ORCAMENTOS(' then
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
      if Sql = 'INSERT INTO ORCAMENTOS(' then
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

    if (Temp is TDateEdit)  AND (TDateEdit(Temp).Text <> '  /  /    ') then
      IQuery.ParamByName(TDateEdit(Temp).Name).AsDateTime := TDateEdit(Temp).Date;

    if Temp is TComboBox then
      IQuery.ParamByName(TComboBox(Temp).Name).AsString := TComboBox(Temp).Text;

    if Temp is TCurrencyEdit then
      IQuery.ParamByName(TCurrencyEdit(Temp).Name).AsFloat := TCurrencyEdit(Temp).Value;

    if Temp is TRxCalcEdit then
      IQuery.ParamByName(TRxCalcEdit(Temp).Name).AsFloat := TRxCalcEdit(Temp).Value;

    if Temp is TMemo then
      IQuery.ParamByName(TMemo(Temp).Name).AsByteStr := TMemo(Temp).Lines.Text;
  end;

  IQuery.Prepare;
  IQuery.ExecSql;


  Habilitar(False);
end;

procedure TFrmOrcamento.Edit;
var
I: Integer;
Temp: TComponent;
Sql: String;
begin
  Sql := 'UPDATE ORCAMENTOS SET ';

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
    begin
      if Sql = 'UPDATE ORCAMENTOS SET ' then
        Sql := Sql + TEdit(Temp).Name + ' = :' + TEdit(Temp).Name
      else
        Sql := Sql + ', ' + TEdit(Temp).Name + ' = :' + TEdit(Temp).Name;
    end;

    if Temp is TMaskEdit then
    begin
      if Sql = 'UPDATE FORNECEDORES SET ' then
        Sql := Sql + TMaskEdit(Temp).Name + ' = :' + TMaskEdit(Temp).Name
      else
        Sql := Sql + ', ' + TMaskEdit(Temp).Name + ' = :' + TMaskEdit(Temp).Name;
    end;

    if (Temp is TDateEdit) and (TDateEdit(Temp).Text <> '  /  /    ') then
    begin
      if Sql = 'UPDATE ORCAMENTOS SET ' then
        Sql := Sql + TDateEdit(Temp).Name + ' = :' + TDateEdit(Temp).Name
      else
        Sql := Sql + ', ' + TDateEdit(Temp).Name + ' = :' + TDateEdit(Temp).Name;
    end;

    if Temp is TComboBox then
    begin
      if Sql = 'UPDATE ORCAMENTOS SET ' then
        Sql := Sql + TComboBox(Temp).Name + ' = :' + TComboBox(Temp).Name
      else
        Sql := Sql + ', ' + TComboBox(Temp).Name + ' = :' + TComboBox(Temp).Name;
    end;

    if Temp is TCurrencyEdit then
    begin
      if Sql = 'UPDATE ORCAMENTOS SET ' then
        Sql := Sql + TCurrencyEdit(Temp).Name + ' = :' + TCurrencyEdit(Temp).Name
      else
        Sql := Sql + ', ' + TCurrencyEdit(Temp).Name + ' = :' + TCurrencyEdit(Temp).Name;
    end;

    if Temp is TRxCalcEdit then
    begin
      if Sql = 'UPDATE ORCAMENTOS SET ' then
        Sql := Sql + TRxCalcEdit(Temp).Name + ' = :' + TRxCalcEdit(Temp).Name
      else
        Sql := Sql + ', ' + TRxCalcEdit(Temp).Name + ' = :' + TRxCalcEdit(Temp).Name;
    end;

    if Temp is TMemo then
    begin
      if Sql = 'UPDATE ORCAMENTOS SET ' then
        Sql := Sql + TMemo(Temp).Name + ' = :' + TMemo(Temp).Name
      else
        Sql := Sql + ', ' + Tmemo(Temp).Name + ' = :' + TMemo(Temp).Name;
    end;
  end;

  Sql := Sql + ' WHERE (ORCAMENTO_ID = :ID)';

  

  IQuery.Sql.Clear;
  IQuery.Sql.Add(Sql);

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
      IQuery.ParamByName(TEdit(Temp).Name).AsString := TEdit(Temp).Text;

    if Temp is TMaskEdit then
      IQuery.ParamByName(TMaskEdit(Temp).Name).AsString := TMaskEdit(Temp).Text;

    if (Temp is TDateEdit)  AND (TDateEdit(Temp).Text <> '  /  /    ')then
      IQuery.ParamByName(TDateEdit(Temp).Name).AsDateTime := TDateEdit(Temp).Date;

    if Temp is TComboBox then
      IQuery.ParamByName(TComboBox(Temp).Name).AsString := TComboBox(Temp).Text;

    if Temp is TCurrencyEdit then
      IQuery.ParamByName(TCurrencyEdit(Temp).Name).AsFloat := TCurrencyEdit(Temp).Value;

    if Temp is TRxCalcEdit then
      IQuery.ParamByName(TRxCalcEdit(Temp).Name).AsFloat := TRxCalcEdit(Temp).Value;

    if Temp is TMemo then
      IQuery.ParamByName(TMemo(Temp).Name).AsByteStr:= TMemo(Temp).Lines.Text;
  end;

  IQuery.ParamByName('ID').AsInteger := QTabela.FieldByName('ORCAMENTO_ID').AsInteger;

  IQuery.Prepare;
  IQuery.ExecSql;



  QTabela.Close;
  QTabela.Open;
  QTabela.Locate('ORCAMENTO_ID', ID, [loCaseInsensitive]);
  Habilitar(False);
end;

procedure TFrmOrcamento.ProdutoSearch;
begin
  QProduto.Close;
  QProduto.ParamByName('PRODUTO_ID').AsInteger := QSub_Detail.FieldByName('PRODUTO_ID').AsInteger;
  QProduto.ParamByName('EMPRESA_ID').AsInteger := StrToInt(EMPRESA_ID.Text);
  QProduto.Prepare;
  QProduto.Open;
end;

procedure TFrmOrcamento.TributoSearch;
begin
  QTributo.Close;
  QTributo.ParamByName('TRIBUTO_ID').AsInteger := QSub_Detail.FieldByName('TRIBUTO_ID').AsInteger;
  QTributo.Prepare;
  QTributo.Open;
end;

procedure TFrmOrcamento.EMPRESA_IDExit(Sender: TObject);
begin
  DetailSearch('Empresa');
end;

procedure TFrmOrcamento.EMPRESA_IDKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = EMPRESA_ID) then
    btnEmpresaClick(Self);

  if (Key = Vk_F7) and (Sender = CLIENTE_ID) then
    btnClienteClick(Self);

  if (Key = Vk_F7) and (Sender = VENDEDOR_ID) then
    btnVendedorClick(Self);

  if (Key = Vk_F7) and (Sender = VENDEDOR_ID_2) then
    btnVendedor_2Click(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

function TFrmOrcamento.Validacao: Boolean;
begin
  Result := False;

  CLIENTE_ID.Color  := clWindow;
  EMPRESA_ID.Color  := clWindow;
  COND_PAGTO.Color  := clWindow;
  VENDEDOR_ID.Color := clWindow;
  ESTADO.Color      := clWindow;
  VR_DESCONTO.Color := clWindow;

  if COND_PAGTO.Text = 'A PRAZO' then
  begin
   if Cliente_id.Value > 0 then
   Begin
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
    end;

    if FrmPrincipal.Config.FieldByName('CARENCIA').AsInteger > 0 then
    Begin

      QVencimento.Close;
      QVencimento.ParamByName('CLIENTE_ID').AsInteger := StrToInt(CLIENTE_ID.Text);
      QVencimento.ParamByName('DT_VENCIMENTO').AsDateTime := Date - FrmPrincipal.Config.FieldByName('CARENCIA').AsInteger;
      QVencimento.Prepare;
      QVencimento.Open;

      //showmessage(DateToStr(QVencimento.FieldByName('DT_VENCIMENTO').AsDAteTime));

      if not QVencimento.IsEmpty then
      Begin
       Application.MessageBox('Cliente Possui Débitos vencidos e não quitados favor verificar.', PChar(Msg_Title), mb_IconStop);

          if FrmGerente = Nil then
          begin
            Application.CreateForm(TFrmGerente, FrmGerente);
            try
              // showmessage(FloatToStr(Valor_Produtos.Value));

              if FrmGerente.ShowModal = mrOK then
              begin
                if VALOR_PRODUTOS.VALUE > FrmGerente.QOperador.FieldByName('LIMITE_APROVA').AsFloat then
                begin
                 Application.MessageBox('Valor acima do máximo permitido', 'Orçamento', MB_IconStop + MB_OK);
                 CLIENTE_ID.Color := clYellow;
                 CLIENTE_ID.SetFocus;
                 Exit;
                end;
                Result := True;
              end
              else
              Begin
                CLIENTE_ID.Color := clYellow;
                CLIENTE_ID.SetFocus;
                Exit;
              End;
            finally

            end;
          end
          else
          begin

            if FrmGerente.ShowModal = mrOK then
            begin
              if VALOR_PRODUTOS.VALUE > FrmGerente.QOperador.FieldByName('LIMITE_APROVA').AsFloat then
              begin
                Application.MessageBox('Valor acima do máximo permitido', 'Orçamento', MB_IconStop + MB_OK);
                CLIENTE_ID.Color := clYellow;
                CLIENTE_ID.SetFocus;
                Exit;
              end;
              Result :=  True;
            end
            else
            Begin
              CLIENTE_ID.Color := clYellow;
              CLIENTE_ID.SetFocus;
              Exit;
            End;
          end;

       {
       if (FrmPrincipal.Config.FieldByName('OBJETO_ORDEM').AsString <> 'Madereira') Then
       Begin
       CLIENTE_ID.Color := clYellow;
       CLIENTE_ID.SetFocus;
       exit;
       End;
       }
      End;
    End;
   End;
  end;

  if CLIENTE_ID.Value > 0 then
  begin
    if QCliente.IsEmpty then
    begin
      Application.MessageBox('Cliente inexistente', PChar(Msg_Title), mb_IconStop);
      CLIENTE_ID.Color := clYellow;
      CLIENTE_ID.SetFocus;
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

  if (VENDEDOR_ID.Value > 0) OR (VENDEDOR_ID.Text <> '')  then
  begin
    if QVendedor.IsEmpty then
    begin
      Application.MessageBox('Vendedor inexistente', PChar(Msg_Title), mb_IconStop);
      VENDEDOR_ID.Color := clYellow;
      VENDEDOR_ID.SetFocus;
      exit;
    end;
  end;

  if (COND_PAGTO.Text <> 'A VISTA') AND (COND_PAGTO.Text <> 'A PRAZO') AND (COND_PAGTO.Text <> 'CHEQUE') AND (COND_PAGTO.Text <> 'CARTAO') AND (COND_PAGTO.Text <> 'PIX') then
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
        IQuery.ParamByName('NOME').AsString :=  COPY(QVendedor.FieldByName('NOME').AsString,1,19) + '%';
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

procedure TFrmOrcamento.VENDEDOR_IDExit(Sender: TObject);
begin
  DetailSearch('Vendedor');
end;

procedure TFrmOrcamento.VR_DESCONTOExit(Sender: TObject);
begin
{if FrmPrincipal.Config.FieldByName('DESC_ORC_USU').AsString = 'True' then
Begin
Desc_por := 0;

if Vr_Desconto.Value > 0 then
      Desc_Por := RoundTo(((Vr_Desconto.Value * 100) / Valor.Value), -2)
    else
      Desc_Por  := 0;

 if Vr_Desconto.Value >= Valor_Produtos.Value then
  begin
      Application.MessageBox('Desconto inválido', PChar(Msg_Title), mb_IconStop);
      Vr_desconto.SetFocus;
  end;

   IQuery.SQL.Clear;
   IQuery.SQL.Add('SELECT * FROM OPERADORES WHERE NOME LIKE :NOME');
   IQuery.ParamByName('NOME').AsString := COPY(QVendedor.FieldByName('NOME').AsString,1,20);
   IQuery.Prepare;
   IQuery.Open;

  if (IQuery.FieldByName('DESCONTO_MAX_SUBTOTAL').AsFloat = 0) and (Vr_Desconto.Value > 0) then
  begin
      Application.MessageBox(Pchar('Vr. Desconto máximo permitido para ' +  IQuery.FieldByName('NOME').AsString + ' ' + ': '+ IQuery.FieldByName('DESCONTO_MAX_SUBTOTAL').AsString +'%') , PChar(Msg_Title), mb_IconStop);
      Vr_Desconto.SetFocus;
      abort;
  end;

    if IQuery.FieldByName('DESCONTO_MAX_SUBTOTAL').AsFloat > 0 then
    begin
      if Vr_Desconto.Value > ((Valor_Produtos.Value * IQuery.FieldByName('DESCONTO_MAX_SUBTOTAL').AsFloat) / 100) then
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
               Vr_Desconto.SetFocus;
              end;
            end
            else
              Vr_Desconto.SetFocus;
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
              Vr_Desconto.SetFocus;
            end;
          end
          else
            Vr_Desconto.SetFocus;
        end;
      end;
    end;
  end; }
  VALOR.Value := VALOR_PRODUTOS.Value +  VR_ACRESCIMO.Value - VR_DESCONTO.Value;
end;

procedure TFrmOrcamento.ManutencaoShow(Sender: TObject);
begin
  QTabela.Refresh;
  Set_Campos(False);
  Botoes_Normal;

end;

procedure TFrmOrcamento.OBSERVACAOEnter(Sender: TObject);
begin
Observacao.Text := Observacao.Text + ' ';
end;

procedure TFrmOrcamento.QSub_DetailAfterOpen(DataSet: TDataSet);
begin

TFloatField(QSub_Detail.FieldByName('VR_DESCONTO')).DisplayFormat := '#,##0.00';
TFloatField(QSub_Detail.FieldByName('VR_TOTAL')).DisplayFormat    := '#,##0.00';
TFloatField(QSub_Detail.FieldByName('QUANTIDADE')).DisplayFormat  := '#,##0.00';
TFloatField(QSub_Detail.FieldByName('VR_UNITARIO')).DisplayFormat := '#,##0.00';
TFloatField(QSub_Detail.FieldByName('MT_2')).DisplayFormat        := '#,##0.00';

end;

procedure TFrmOrcamento.QSub_DetailBeforeDelete(DataSet: TDataSet);
begin
  if FrmData.QAcesso.FieldByName('EXCLUSAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para exclusão', PChar(Msg_Title), mb_IconStop);
    abort;
  end;

  if (FrmPrincipal.Config.FieldByName('OBJETO_ORDEM').AsString <> 'Madereira') and (QTabela.FieldByName('DT_MOVIMENTO').AsDateTime < FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime) then
  begin
    Application.MessageBox('Movimento já encerrado', PChar(Msg_Title), mb_IconStop);
    abort;
  end;

  if QTabela.FieldByName('TRANSACAO_ID').AsInteger > 0 then
  begin
    Application.MessageBox(PChar('Orçamento fechado na transação ' + QTabela.FieldByName('TRANSACAO_ID').AsString), PChar(Msg_Title), mb_IconStop);
    abort;
  end;

  if Application.MessageBox('Deseja realmente excluir?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = IDNO then
    abort;
end;

procedure TFrmOrcamento.QSub_DetailBeforeEdit(DataSet: TDataSet);
begin
  if FrmData.QAcesso.FieldByName('ALTERACAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para alteração', PChar(Msg_Title), mb_IconStop);
    abort;
  end;

  if (FrmPrincipal.Config.FieldByName('OBJETO_ORDEM').AsString <> 'Madereira') and (QTabela.FieldByName('DT_MOVIMENTO').AsDateTime < FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime) then
  begin
    Application.MessageBox('Movimento já encerrado', PChar(Msg_Title), mb_IconStop);
    abort;
  end;

  if QTabela.FieldByName('TRANSACAO_ID').AsInteger > 0 then
  begin
    Application.MessageBox(PChar('Orçamento fechado na transação ' + QTabela.FieldByName('TRANSACAO_ID').AsString), PChar(Msg_Title), mb_IconStop);
    abort;
  end;
end;

procedure TFrmOrcamento.QSub_DetailBeforeInsert(DataSet: TDataSet);
begin
  if (FrmPrincipal.Config.FieldByName('OBJETO_ORDEM').AsString <> 'Madereira') and (QTabela.FieldByName('DT_MOVIMENTO').AsDateTime < FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime) then
  begin
    Application.MessageBox('Movimento já encerrado', PChar(Msg_Title), mb_IconStop);
    abort;
  end;

  if QTabela.FieldByName('TRANSACAO_ID').AsInteger > 0 then
  begin
    Application.MessageBox(PChar('Orçamento fechado na transação ' + QTabela.FieldByName('TRANSACAO_ID').AsString), PChar(Msg_Title), mb_IconStop);
    abort;
  end;
end;

procedure TFrmOrcamento.QSub_DetailBeforePost(DataSet: TDataSet);
var
Cst: String;
Promocao: Boolean;
itemtemp:integer;
qtdtemp , tottemp:real;
begin
  Promocao := False;

  ProdutoSearch;
  TributoSearch;

  if QProduto.IsEmpty then
  begin
    Application.MessageBox('Produto inexistente', PChar(Msg_Title), mb_IconStop);
    Itens.SelectedIndex := 0;
    abort;
  end;

  if QTributo.IsEmpty then
  begin
    Application.MessageBox('Tributo inexistente', PChar(Msg_Title), mb_IconStop);
    Itens.SelectedIndex := 2;
    abort;
  end;

  if (QSub_Detail.FieldByName('QUANTIDADE').AsFloat <= 0) or (QSub_Detail.FieldByName('QUANTIDADE').AsFloat > 99999) then
  begin
    Application.MessageBox('Quantidade inválida', PChar(Msg_Title), mb_IconStop);
    Itens.SelectedIndex := 3;
    abort;
  end;

  if QSub_Detail.FieldByName('VR_UNITARIO').AsFloat <= 0 then
  begin
    Application.MessageBox('Vr. Unitário inválido', PChar(Msg_Title), mb_IconStop);
    Itens.SelectedIndex := 4;
    abort;
  end;

  if QSub_Detail.FieldByName('VR_DESCONTO').AsFloat < 0 then
  begin
    Application.MessageBox('Vr. Desconto inválido', PChar(Msg_Title), mb_IconStop);
    Itens.SelectedIndex := 5;
    abort;
  end;

  if QSub_Detail.FieldByName('VR_TOTAL').AsFloat <= 0 then
  begin
    Application.MessageBox('Valor Total inválido', PChar(Msg_Title), mb_IconStop);
    Itens.SelectedIndex := 4;
    abort;
  end;

  If FrmPrincipal.Config.FieldByName('OBJETO_ORDEM').AsString = 'Madereira' Then
  Begin
   if QSub_Detail.FieldByName('MT_2').AsFloat > 0 Then
   Begin
    if TruncVal(QSub_Detail.FieldByName('VR_TOTAL').AsFloat,-2) <> TruncVal(((QSub_Detail.FieldByName('VR_UNITARIO').AsFloat - QSub_Detail.FieldByName('VR_DESCONTO').AsFloat) * QSub_Detail.FieldByName('MT_2').AsFloat), -2) then
    begin
      Application.MessageBox('Valor Total inválido', PChar(Msg_Title), mb_IconStop);
      Itens.SelectedIndex := 4;
      abort;
    end;
   End
   Else
   if Roundto(QSub_Detail.FieldByName('VR_TOTAL').AsFloat,-2) <> RoundTo(((QSub_Detail.FieldByName('VR_UNITARIO').AsFloat * QSub_Detail.FieldByName('QUANTIDADE').AsFloat) - (QSub_Detail.FieldByName('VR_DESCONTO').AsFloat * QSub_Detail.FieldByName('QUANTIDADE').AsFloat)), -2) then
   begin
    Application.MessageBox('Valor Total inválido', PChar(Msg_Title), mb_IconStop);
    Itens.SelectedIndex := 4;
    abort;
   end;

  End
  Else
  if (FrmPrincipal.Config.FieldByName('REPETIR_ITENS_ORC').AsString <> 'True') and  (Roundto(QSub_Detail.FieldByName('VR_TOTAL').AsFloat,-2) <> RoundTo(((QSub_Detail.FieldByName('VR_UNITARIO').AsFloat * QSub_Detail.FieldByName('QUANTIDADE').AsFloat) - (QSub_Detail.FieldByName('VR_DESCONTO').AsFloat * QSub_Detail.FieldByName('QUANTIDADE').AsFloat)), -2)) then
  begin
    Application.MessageBox('Valor Total inválido', PChar(Msg_Title), mb_IconStop);
    Itens.SelectedIndex := 4;
    abort;
  end;


  if (FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime >= QProduto.FieldByName('PROMO_INICIAL').AsDateTime) and (FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime <= QProduto.FieldByName('PROMO_FINAL').AsDateTime) then
  begin
    Promocao := True;

    if (QSub_Detail.FieldByName('VR_UNITARIO').AsFloat <> QProduto.FieldByName('PRECO_PROMOCAO').AsFloat) then
    begin
      Application.MessageBox('Preço inválido. Produto em promoção', PChar(Msg_Title), mb_IconStop);
      Itens.SelectedIndex := 4;
      abort;
    end;
  end;

    if LeIni(Arq_Ini, 'Sistema', 'Preço Promoção Somente nos ECFs') = 'False' then
    begin
      if (FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime >= QProduto.FieldByName('PROMO_INICIAL').AsDateTime) and (FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime <= QProduto.FieldByName('PROMO_FINAL').AsDateTime) then
      begin
        Promocao := True;

        if (QSub_Detail.FieldByName('VR_UNITARIO').AsFloat <> QProduto.FieldByName('PRECO_PROMOCAO').AsFloat) then
        begin
          Application.MessageBox('Preço inválido. Produto em promoção', PChar(Msg_Title), mb_IconStop);
          Itens.SelectedIndex := 4;
          abort;
        end;
      end;
    end;


  if (QProduto.FieldByName('PRECO_ATACADO').AsFloat > 0.01) and (QProduto.FieldByName('PRECO_ATACADO').AsFloat < QProduto.FieldByName('PRECO_VAREJO').AsFloat) and (LeIni(Arq_Ini, 'Sistema', 'Comparar Preço Atacado x Preço Varejo') = 'True') and (not Promocao) then
  begin
    if (QSub_Detail.FieldByName('VR_UNITARIO').AsFloat < QProduto.FieldByName('PRECO_ATACADO').AsFloat) or (QSub_Detail.FieldByName('VR_UNITARIO').AsFloat > QProduto.FieldByName('PRECO_VAREJO').AsFloat) then
    begin
      Application.MessageBox('Preço fora da faixa determinado pelo Sistema', PChar(Msg_Title), mb_IconStop);
      Itens.SelectedIndex := 4;
      abort;
    end;
  end;

  if (QSub_Detail.FieldByName('VR_DESCONTO').AsFloat < 0) or (QSub_Detail.FieldByName('VR_DESCONTO').AsFloat > QSub_Detail.FieldByName('VR_UNITARIO').AsFloat) then
  begin
    Application.MessageBox('Vr. Desconto inválido', PChar(Msg_Title), mb_IconStop);
    Itens.SelectedIndex := 5;
    abort;
  end;

  if (Promocao) and (QSub_Detail.FieldByName('VR_DESCONTO').AsFloat > 0) then
  begin
    Application.MessageBox('Vr. Desconto inválido. Produto em promoção', PChar(Msg_Title), mb_IconStop);
    Itens.SelectedIndex := 5;
    abort;
  end;
  {
  if (QProduto.FieldByName('DESC_MAXIMO').AsFloat > 0) and
     (QSub_Detail.FieldByName('VR_DESCONTO').AsFloat > (((QSub_Detail.FieldByName('VR_UNITARIO').AsFloat * QSub_Detail.FieldByName('QUANTIDADE').AsFloat) * QProduto.FieldbyName('DESC_MAXIMO').AsFloat) / 100)) then
  begin
    Application.MessageBox('Vr. Desconto não pode ser maior do que o desconto máximo permitido para o item', PChar(Msg_Title), mb_IconStop);
    Itens.SelectedIndex := 5;
    abort;
  end;
  }
  if QSub_Detail.FieldByName('VR_TOTAL').AsFloat <= 0 then
  begin
    Application.MessageBox('Valor Total inválido', PChar(Msg_Title), mb_IconStop);
    Itens.SelectedIndex := 6;
    abort;
  end;

  if QSub_Detail.FieldByName('VR_IPI').AsFloat < 0 then
  begin
    Application.MessageBox('Vr. IPI inválido', PChar(Msg_Title), mb_IconStop);
    Itens.SelectedIndex := 6;
    abort;
  end;

  if (QSub_Detail.FieldByName('ALIQUOTA_ICMS').AsFloat < 0) or (QSub_Detail.FieldByName('ALIQUOTA_ICMS').AsFloat > 100) then
  begin
    Application.MessageBox('Alíquota de ICMS inválida', PChar(Msg_Title), mb_IconStop);
    Itens.SelectedIndex := 4;
    abort;
  end;

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

   If FrmPrincipal.Config.FieldByName('OBJETO_ORDEM').AsString = 'Madereira' Then
    Begin
     if QSub_Detail.FieldByName('MT_2').AsFloat > 0 Then
     //QSub_Detail.FieldByName('VR_UNITARIO').AsFloat := RoundTo(((QSub_Detail.FieldByName('VR_TOTAL').AsFloat + (QSub_Detail.FieldByName('VR_DESCONTO').AsFloat)) / QSub_Detail.FieldByName('MT_2').AsFloat), -2)
     Else
     QSub_Detail.FieldByName('VR_UNITARIO').AsFloat := RoundTo(((QSub_Detail.FieldByName('VR_TOTAL').AsFloat + (QSub_Detail.FieldByName('VR_DESCONTO').AsFloat)) / QSub_Detail.FieldByName('QUANTIDADE').AsFloat), -2);
    End
   Else
    QSub_Detail.FieldByName('VR_UNITARIO').AsFloat  := RoundTo(((QSub_Detail.FieldByName('VR_TOTAL').AsFloat + (QSub_Detail.FieldByName('VR_DESCONTO').AsFloat)) / QSub_Detail.FieldByName('QUANTIDADE').AsFloat), -2);

   if  FrmPrincipal.Config.FieldByName('REPETIR_ITENS_ORC').AsString = 'True' then
   Begin

    QSearch.Sql.Clear;
    QSearch.Sql.Text := 'SELECT PRODUTO_ID,QUANTIDADE,VR_TOTAL FROM ORCITENS WHERE ORCAMENTO_ID = :ORCAMENTO_ID AND PRODUTO_ID = :PRODUTO_ID';
    QSearch.ParamByName('ORCAMENTO_ID').AsInteger := QTabela.FieldByName('ORCAMENTO_ID').AsInteger;
    QSearch.ParamByName('PRODUTO_ID').AsInteger   := Itens.DataSource.DataSet.FieldByName('PRODUTO_ID').AsInteger;
    QSearch.Prepare;
    QSearch.Open;

    if not QSearch.IsEmpty then
    Begin

     itemtemp   := QSearch.FieldByName('PRODUTO_ID').ASInteger;//Itens.DataSource.DataSet.FieldByName('PRODUTO_ID').AsInteger;
     qtdtemp    := QSearch.FieldByName('QUANTIDADE').ASFloat; //Itens.DataSource.DataSet.FieldByName('QUANTIDADE').AsFloat;
     tottemp    := QSearch.FieldByName('VR_TOTAL').ASFloat; //Itens.DataSource.DataSet.FieldByName('VR_TOTAL').AsFloat;

     if Application.MessageBox('Produto já lançado deseja somar a quantidade lançada ?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = IDYES then
     Begin

       QUpdate.Sql.Clear;
       QUpdate.Sql.Add('DELETE FROM ORCITENS WHERE ORCAMENTO_ID = :ORCAMENTO_ID AND PRODUTO_ID =:PRODUTO_ID');
       QUpdate.ParamByName('ORCAMENTO_ID').AsInteger := QTabela.FieldByName('ORCAMENTO_ID').AsInteger;
       QUpdate.ParamByName('PRODUTO_ID').AsInteger   := itemtemp;
       QUpdate.Prepare;
       QUpdate.ExecSQL;


       QSub_Detail.FieldByName('QUANTIDADE').AsFloat :=  QSub_Detail.FieldByName('QUANTIDADE').AsFloat +  qtdtemp;
       QSub_Detail.FieldByName('VR_TOTAL').AsFloat   :=  QSub_Detail.FieldByName('VR_TOTAL').AsFloat   +  TOTTEMP;

      {
      if  qtdtemp >= QSearch.FieldByName('QUANTIDADE').AsFloat Then

      Begin
       QUpdate.Sql.Clear;
       QUpdate.Sql.Add('UPDATE ORCITENS SET QUANTIDADE = QUANTIDADE + :QUANTIDADE, VR_TOTAL =(((QUANTIDADE + :QUANTIDADE) * VR_UNITARIO) - VR_DESCONTO) WHERE ORCAMENTO_ID= :ORCAMENTO_ID AND PRODUTO_ID =:PRODUTO_ID');
       QUpdate.ParamByName('QUANTIDADE').AsFloat     := qtdtemp;
       QUpdate.ParamByName('ORCAMENTO_ID').AsInteger := QTabela.FieldByName('ORCAMENTO_ID').AsInteger;
       QUpdate.ParamByName('PRODUTO_ID').AsInteger   := itemtemp;
       QUpdate.Prepare;
       QUpdate.ExecSQL;
      End
      Else
      Begin
       QUpdate.Sql.Clear;
       QUpdate.Sql.Add('UPDATE ORCITENS SET QUANTIDADE = :QUANTIDADE, VR_TOTAL =(((:QUANTIDADE) * VR_UNITARIO) - VR_DESCONTO) WHERE ORCAMENTO_ID= :ORCAMENTO_ID AND PRODUTO_ID =:PRODUTO_ID');
       QUpdate.ParamByName('QUANTIDADE').AsFloat     := qtdtemp;
       QUpdate.ParamByName('ORCAMENTO_ID').AsInteger := QTabela.FieldByName('ORCAMENTO_ID').AsInteger;
       QUpdate.ParamByName('PRODUTO_ID').AsInteger   := itemtemp;
       QUpdate.Prepare;
       QUpdate.ExecSQL;

      End;
      }

       Application.MessageBox(Pchar('Produto: ' + QSub_Detail.FieldByName('DESCRICAO').AsString +#13 + 'Atualizado com sucesso!' ), PChar(Msg_Title), MB_ICONINFORMATION);

       QSub_Detail.Refresh;

      //Perform(Wm_NextDlgCtl, 0, 0);

      QSub_Detail.Last;

     End;
    End;
   End;






end;

procedure TFrmOrcamento.QSub_DetailNewRecord(DataSet: TDataSet);
begin
  DataSet['ORCAMENTO_ID'] := QTabela.FieldByName('ORCAMENTO_ID').AsInteger;
  DataSet['TP_PROD_SERV'] := 'P';
end;

procedure TFrmOrcamento.QTabelaAfterOpen(DataSet: TDataSet);
begin
TFloatField(QTabela.FieldByName('VALOR')).DisplayFormat  := '#,##0.00';
end;

procedure TFrmOrcamento.RDprint1BeforeNewPage(Sender: TObject; Pagina: Integer);
begin

  if linha <= Tamanho_pagina - 1  then
  Begin
  RDprint1.LinhaH(Tamanho_pagina -1,01,80,0,False);
  RDprint1.Imp(Tamanho_pagina , 01, 'Eficaz Automação e Sistemas Ltda');
  RDprint1.ImpDir(Tamanho_pagina, 33, 80, 'http://www.eficazautomacao.com.br', []);
  RDprint1.Imp(Tamanho_pagina,01,' ');
  End;

end;

procedure TFrmOrcamento.RDprint1NewPage(Sender: TObject; Pagina: Integer);
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
  RDprint1.Imp(06, 30, '*** ORCAMENTO ***');
  RDprint1.Imp(07, 01, '--------------------------------------------------------------------------------');
  linha := 08;
  Linha3 := 08;

end;

procedure TFrmOrcamento.RDprint2BeforeNewPage(Sender: TObject; Pagina: Integer);
begin
  if linha <= 62  then
  Begin
  RDprint1.Imp(63, 01, '==================================');
  RDprint1.Imp(64, 01, 'Eficaz Automação e Sistemas Ltda');
  RDprint1.ImpDir(64, 28, 80, 'http://www.eficazautomacao.com.br', []);
  RDprint1.Imp(66,01,' ');
  End;

end;

procedure TFrmOrcamento.Set_Campos(Vazio: Boolean);
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
        TMemo(Temp).Lines.Text := '';

      QSub_Detail.Close;

      QSub_Detail.ParamByName('ORCAMENTO_ID').AsInteger := 0;

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
        TMemo(Temp).Lines.Text := QTabela.FieldByName(Tmemo(Temp).Name).AsString;


    end;
  end;

      QSub_Detail.Close;

      QSub_Detail.ParamByName('ORCAMENTO_ID').AsInteger := QTabela.FieldByName('ORCAMENTO_ID').AsInteger;

      QSub_Detail.Prepare;
      QSub_Detail.Open;

  if QTabela.IsEmpty then
    Itens.Enabled := False
  else
    Itens.Enabled := True;

  DetailSearch('');
end;

procedure TFrmOrcamento.btnDeleteClick(Sender: TObject);
begin
  if FrmData.QAcesso.FieldByName('EXCLUSAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para exclusão', PChar(Msg_Title), mb_IconStop);
    abort;
  end;

  if (FrmPrincipal.Config.FieldByName('OBJETO_ORDEM').AsString <> 'Madereira') and (QTabela.FieldByName('DT_MOVIMENTO').AsDateTime < FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime) then
  begin
    Application.MessageBox('Movimento já encerrado', PChar(Msg_Title), mb_IconStop);
    abort;
  end;

  if QTabela.FieldByName('TRANSACAO_ID').AsInteger > 0 then
  begin
    Application.MessageBox(PChar('Orçamento fechado na transação ' + QTabela.FieldByName('TRANSACAO_ID').AsString), PChar(Msg_Title), mb_IconStop);
    abort;
  end;

  if Application.MessageBox('Deseja realmente excluir?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = IDYES then
  begin


    If (FrmPrincipal.Config.FieldByName('AUDITORIA').AsString = 'True') and (valor.value > 0) Then
       GravarLog('ORCAMENTO','DELETAR',DateToStr(date),TimeToStr(time),'Orcamento_id ' , IntToStr(QTabela.FieldByName('ORCAMENTO_ID').AsInteger),FloatToStr(Valor.Value) + ' Documento: ' + InttoStr(QTabela.FieldByName('ORCAMENTO_ID').AsInteger)  ,FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger,QTabela.FieldByName('CLIENTE_ID').AsInteger);

    IQuery.Sql.Clear;
    IQuery.Sql.Add('DELETE FROM ORCAMENTOS');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(ORCAMENTO_ID = :ID)');

    IQuery.ParamByName('ID').AsInteger := QTabela.FieldByName('ORCAMENTO_ID').AsInteger;

    IQuery.Prepare;
    IQuery.ExecSql;



    if (LeIni(Arq_Ini, 'Sistema', 'Path Orçamento') <> '') and (FileExists(LeIni(Arq_Ini, 'Sistema', 'Path Orçamento') + 'OR' + StrZero(QTabela.FieldByName('ORCAMENTO_ID').AsString, 6, 0) + '.Txt')) then
      DeleteFile(LeIni(Arq_Ini, 'Sistema', 'Path Orçamento') + 'OR' + StrZero(QTabela.FieldByName('ORCAMENTO_ID').AsString, 6, 0) + '.Txt');

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

procedure TFrmOrcamento.btnDiscardClick(Sender: TObject);
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

procedure TFrmOrcamento.btnEditClick(Sender: TObject);
begin


  if FrmData.QAcesso.FieldByName('ALTERACAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para alteração', PChar(Msg_Title), mb_IconStop);
    abort;
  end;

  if (FrmPrincipal.Config.FieldByName('OBJETO_ORDEM').AsString <> 'Madereira') and (QTabela.FieldByName('DT_MOVIMENTO').AsDateTime < FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime) then
  begin
    Application.MessageBox('Movimento já encerrado', PChar(Msg_Title), mb_IconStop);
    abort;
  end;

  if QTabela.FieldByName('TRANSACAO_ID').AsInteger > 0 then
  begin
    Application.MessageBox(PChar('Orçamento fechado na transação ' + QTabela.FieldByName('TRANSACAO_ID').AsString), PChar(Msg_Title), mb_IconStop);
    abort;
  end;

  Operacao := 'Alterando';

  ID := QTabela.FieldByName('ORCAMENTO_ID').AsInteger;

  Botoes_Editing;
  Habilitar(True);
  Itens.Enabled := False;

  Consulta.TabVisible := False;
  DT_ORCAMENTO.SetFocus;
end;

procedure TFrmOrcamento.btnEmpresaClick(Sender: TObject);
begin
  try
    EMPRESA_ID.Value := GetConsulta('EMPRESAS', 0, 0, StrToInt(EMPRESA_ID.Text));
  except
    EMPRESA_ID.Value := GetConsulta('EMPRESAS', 0, 0, 0);
  end;
end;

procedure TFrmOrcamento.btnClienteClick(Sender: TObject);
begin
  try
    CLIENTE_ID.Value := GetConsulta('CLIENTES', 0, 0, StrToInt(CLIENTE_ID.Text));
  except
    CLIENTE_ID.Value := GetConsulta('CLIENTES', 0, 0, 0);
  end;
end;

procedure TFrmOrcamento.btnInsertClick(Sender: TObject);
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

  ESTADO.Text       := '  ';
  DT_ORCAMENTO.Date := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
  DT_MOVIMENTO.Date := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
  COND_PAGTO.Text   := 'A VISTA';
  EMPRESA_ID.Value  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  AUTORIZ_ID.Value  := FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger;
  Estado.Text       := 'MG';
  Lanc_Futuro.Text  := 'NÃO';

  if LeIni(Arq_Ini, 'Sistema', 'Mensagem Orçamento') <> '' Then
  Observacao.text :=  LeIni(Arq_Ini, 'Sistema', 'Mensagem Orçamento') + ' ';
  if LeIni(Arq_Ini, 'Sistema', 'Mensagem Orçamento 1') <> '' Then
  Observacao.text := Observacao.text + LeIni(Arq_Ini, 'Sistema', 'Mensagem Orçamento 1') + ' ';
  if LeIni(Arq_Ini, 'Sistema', 'Mensagem Orçamento 2') <> '' Then
  Observacao.text := Observacao.text + LeIni(Arq_Ini, 'Sistema', 'Mensagem Orçamento 2')+ ' ';
  if LeIni(Arq_Ini, 'Sistema', 'Mensagem Orçamento 3') <> '' Then
  Observacao.text := Observacao.text + LeIni(Arq_Ini, 'Sistema', 'Mensagem Orçamento 3')+ ' ';

  Consulta.TabVisible := False;
  DT_ORCAMENTO.SetFocus;
end;

procedure TFrmOrcamento.btnLogClick(Sender: TObject);
var
F1: TextFile;
begin
   Set_Campos(False);

  Botoes_Normal;

  if not QSub_Detail.Active then
  begin
    QSub_Detail.Close;

    QSub_Detail.ParamByName('ORCAMENTO_ID').AsInteger := QTabela.FieldByName('ORCAMENTO_ID').AsInteger;

    QSub_Detail.Prepare;
    QSub_Detail.Open;
  end;

  if LeIni(Arq_Ini, 'Sistema', 'Path Orçamento') <> '' then
  begin
    try
      AssignFile(F1, LeIni(Arq_Ini, 'Sistema', 'Path Orçamento') + 'OR' + StrZero(QTabela.FieldByName('ORCAMENTO_ID').AsString, 6, 0) + '.Txt');
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
      IQuery.Sql.Add('(TRANSACAO_ID = :ORCAMENTO_ID)');
      IQuery.Sql.Add('AND (TIPO_TRANSACAO = :TIPO_TRANSACAO)');
      IQuery.Sql.Add('ORDER BY TRANSACAO_ID, PARCELA_ID');

      IQuery.ParamByName('ORCAMENTO_ID').AsInteger  := QTabela.FieldByName('ORCAMENTO_ID').AsInteger;
      IQuery.ParamByName('TIPO_TRANSACAO').AsString := 'O';

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
                    StrZero(IQuery.FieldByName('BANCO_ID').AsString, 2, 0));

        Application.ProcessMessages;
        IQuery.Next;
      end;

      if QTabela.FieldByName('VR_ACRESCIMO').AsFloat > 0 then
        WriteLn(F1, '301' + 'A' + StrZero(QTabela.FieldByName('VR_ACRESCIMO').AsString, 12, 2) +
                    StrZero(QTabela.FieldByName('VENDEDOR_ID').AsString, 5, 0) +
                    StrZero(QTabela.FieldByName('CLIENTE_ID').AsString, 5, 0))
      else
        WriteLn(F1, '301' + 'D' + StrZero(QTabela.FieldByName('VR_DESCONTO').AsString, 12, 2) +
                    StrZero(QTabela.FieldByName('VENDEDOR_ID').AsString, 5, 0) +
                    StrZero(QTabela.FieldByName('CLIENTE_ID').AsString, 5, 0));

      If FrmPrincipal.Config.FieldByName('OBJETO_ORDEM').AsString <> 'Madereira' Then
      Application.MessageBox(PChar('Log ' + StrZero(QTabela.FieldByName('ORCAMENTO_ID').AsString, 6, 0) + ' criado com sucesso'), PChar(Msg_Title), mb_IconInformation);
    finally
      CloseFile(F1);
    end;
  end;
end;

procedure TFrmOrcamento.btnNextClick(Sender: TObject);
begin
  if not QTabela.Eof then
  begin
    QTabela.Next;
    Set_Campos(False);
  end;

  Botoes_Normal;
end;

procedure TFrmOrcamento.btnOrcamentoClick(Sender: TObject);
var
Copias,Linhas,Dividir:Integer;
InputString,Buffer,S,NUM_ORCAMENTO,fracao: String;
MyFile: TextFile;
Desconto, Acrescimo, Vr_venda,Meio:Real;
Rdprint1 :  TRDprint;
begin
  Set_Campos(False);

  Botoes_Normal;

  Desconto:= QSub_Detail.FieldByName('VR_DESCONTO').AsFloat;
  Vr_Venda:= QSub_Detail.FieldByName('VR_TOTAL').AsFloat;
  NUM_ORCAMENTO := Copy(TimeToStr(now), 1, 2) + Copy(TimeToStr(now), 4, 2) + Copy(TimeToStr(now), 7, 2);

  Rdprint1.CleanupInstance;
  Rdprint1 := TRDprint.Create(Self);
  Rdprint1.TamanhoQteLinhas   := 32;
  Rdprint1.TamanhoQteColunas  := 80;
  Rdprint1.OnBeforeNewPage    := RDprint1BeforeNewPage;
  Rdprint1.OnNewPage          := RDprint1NewPage;


  if (LeIni(Arq_Ini, 'Sistema', 'Imp. Orçamento') = 'RDPrint')   then
  Begin

      RDprint1.Impressora := Epson;
      RDprint1.FonteTamanhoPadrao := S10cpp;

    if CheckBox1.Checked = True then
    Begin
      RDprint1.Impressora := HP;
      RDprint1.FonteTamanhoPadrao := S10cpp;
    End;

    RDprint1.OpcoesPreview.Preview     := True;
    RDprint1.MostrarProgresso          := True;
    RDprint1.Acentuacao                := SemAcento;
    RDprint1.TamanhoQteLinhas          := 1;
    RDprint1.Abrir;
    Pagina  := 1;

    if LeIni(Arq_Ini, 'Sistema', 'Rdprint Meia Página') = 'True' then
    Tamanho_pagina := 33
    Else
    Tamanho_pagina := 66;


    if linha > Tamanho_pagina  then
    Begin
    RDprint1.Novapagina;
    Pagina := Pagina + 1;
    End;


  {RDprint1.Imp(02, 01, FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString);
  RDprint1.ImpDir( 02, (length(FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString)), 80, 'Eficaz Automação e Sistemas Ltda - ME', []);
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
  RDprint1.Imp(06, 30, '*** ORCAMENTO ***');
  RDprint1.Imp(07, 01, '--------------------------------------------------------------------------------'); }


  RDprint1.Imp(linha, 01, 'Num. Orcamento.:');
  RDprint1.Imp(linha, 17, QTabela.FieldByName('ORCAMENTO_ID').AsString);
  RDprint1.Imp(linha, 31, 'Cond. Pagto.:');
  RDprint1.Imp(linha, 44, QTabela.FieldByName('COND_PAGTO').AsString);
  RDprint1.Imp(linha, 61, 'Data:');
  RDprint1.Imp(linha, 68, QTabela.FieldByName('DT_ORCAMENTO').AsString);
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
  RDprint1.Imp(linha, 50, QTabela.FieldByName('NUMERO').AsString);
  RDprint1.Imp(linha, 55, 'Bairro:');
  RDprint1.Imp(linha, 62, Copy (QTabela.FieldByName('BAIRRO').AsString,1,20));
  inc(linha);
  RDprint1.Imp(linha, 01, 'Cidade:');
  RDprint1.Imp(linha, 11, Copy(QTabela.FieldByName('MUNICIPIO').AsString, 1, 31));
  RDprint1.Imp(linha, 31, 'CEP:');
  RDprint1.Imp(linha, 36, QTabela.FieldByName('CEP').AsString);
  RDprint1.Imp(linha, 46, 'Telefone:');
  RDprint1.Imp(linha, 56, QTabela.FieldByName('TELEFONE').AsString);
  inc(linha);
  RDprint1.Imp(linha, 01, 'Contato:');
  RDprint1.Imp(linha, 11, QTabela.FieldByName('CONTATO').AsString);
  inc(linha);
  RDprint1.Imp(linha, 01, 'Vendedor:');
  RDprint1.Imp(linha, 11, QVendedor.FieldByName('NOME').AsString);
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

    if linha > Tamanho_pagina  then
    Begin
    RDprint1.Novapagina;
    Pagina := Pagina + 1;
    End;
  End;

   if linha > Tamanho_pagina  then
    Begin
    RDprint1.Novapagina;
    Pagina := Pagina + 1;
    End;

  RDprint1.Imp(linha,70,'__________');
  inc(linha);
  RDprint1.Imp(linha,45,'Total dos Produtos');
  RDprint1.ImpVal(linha,66,'##,###,##0.00',QTabela.FieldByName('VALOR_PRODUTOS').AsFloat,[]);
  inc(linha);
  RDprint1.Imp(linha,45,'Acrescimo');
  RDprint1.ImpVal(linha,66,'##,###,##0.00',QTabela.FieldByName('VR_ACRESCIMO').AsFloat,[]);
  inc(linha);
  RDprint1.Imp(linha,45,'Desconto');
  RDprint1.ImpVal(linha,66,'##,###,##0.00',QTabela.FieldByName('VR_DESCONTO').AsFloat,[]);
  inc(linha);

  RDprint1.Imp(linha,45,'Total do Orcamento');
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
  IQuery.Sql.Add('AND (TIPO_TRANSACAO = :TIPO_TRANSACAO) ORDER BY DT_VENCIMENTO');

  IQuery.ParamByName('TRANSACAO_ID').AsInteger  := QTabela.FieldByName('ORCAMENTO_ID').AsInteger;
  IQuery.ParamByName('TIPO_TRANSACAO').AsString := 'O';

  IQuery.Prepare;
  IQuery.Open;

   if not IQuery.IsEmpty then
   begin
    RDprint1.Imp(linha,45,'Parcelamento:');
    inc(linha);
    RDprint1.Imp(linha,45,'-------------');
    inc(linha);
    RDprint1.Imp(linha,45,'Vencimento:');
    inc(linha3);
    IQuery.First;


    while not IQuery.Eof do
    begin
     inc(linha);
     inc(linha3);
     RDprint1.Imp(linha,45,IQuery.FieldByName('DT_VENCIMENTO').AsString);
     RDprint1.Imp(linha,65,'-');
     RDprint1.ImpVal(linha,66,'##,###,##0.00',IQuery.FieldByName('VALOR').AsFloat,[]);
     IQuery.Next;

       if linha > (Tamanho_pagina - 3 ) then
      Begin
      RDprint1.Novapagina;
      Pagina := Pagina + 1;
      End;

     end;

   end;

    if linha > (Tamanho_pagina -2) then
    Begin
    RDprint1.Novapagina;
    Pagina := Pagina + 1;
    End;


  RDprint1.Imp(linha2 ,01, 'Observação:');
  inc(linha2);
  inc(linha3);
  if Copy(QTabela.FieldByName('OBSERVACAO').AsString,1,40) <> '' then
  Begin
  RDprint1.Imp(linha2,01,Copy(QTabela.FieldByName('OBSERVACAO').AsString,1,40));
  inc(linha2);
  inc(linha3);
  End;
  if Copy(QTabela.FieldByName('OBSERVACAO').AsString,41,40) <> '' then
  Begin
  RDprint1.Imp(linha2,01,Copy(QTabela.FieldByName('OBSERVACAO').AsString,41,40));
  inc(linha2);
  inc(linha3);
  End;
  if Copy(QTabela.FieldByName('OBSERVACAO').AsString,81,40) <> '' then
  Begin
  RDprint1.Imp(linha2,01,Copy(QTabela.FieldByName('OBSERVACAO').AsString,81,40));
  inc(linha2);
  inc(linha3);
  End;
  if Copy(QTabela.FieldByName('OBSERVACAO').AsString,121,40) <> '' then
  Begin
  RDprint1.Imp(linha2,01,Copy(QTabela.FieldByName('OBSERVACAO').AsString,121,40));
  inc(linha2);
  inc(linha3);
  End;
  if Copy(QTabela.FieldByName('OBSERVACAO').AsString,161,40) <> '' then
  Begin
  RDprint1.Imp(linha2,01,Copy(QTabela.FieldByName('OBSERVACAO').AsString,161,40));
  inc(linha2);
  inc(linha3);
  End;
  if Copy(QTabela.FieldByName('OBSERVACAO').AsString,201,40) <> '' then
  Begin
  RDprint1.Imp(linha2,01,Copy(QTabela.FieldByName('OBSERVACAO').AsString,201,40));
  inc(linha2);
  inc(linha3);
  End;

  if LeIni(Arq_Ini, 'Sistema', 'Rdprint Meia Página') = 'True' then
  inc(linha3)
  else
  Linha3:=  (linha2 + 8);


    if (linha >= Tamanho_pagina -2 ) or (linha2 >= Tamanho_pagina -2) or (linha3 >= Tamanho_pagina -2)   then
    Begin
    RDprint1.Novapagina;
    Pagina := Pagina + 1;

      if LeIni(Arq_Ini, 'Sistema', 'Rdprint Meia Página') = 'True' then
      Linha3 := 15
      else
      Linha3 := 30;
    End;

  RDprint1.Imp(linha3,01,'Vendedor:________________________' );
  RDprint1.Imp(linha3,45,'Cliente:__________________________' );
  inc(linha3);
  RDprint1.Imp(linha3,10,QVendedor.FieldByName('NOME').AsString);
  RDprint1.Imp(linha3,53,Copy(QTabela.FieldByName('NOME').AsString,1,25));
  
  if Copy(QTabela.FieldByName('NOME').AsString,26,25) <> '' then
  Begin
  inc(linha3);
  RDprint1.Imp(linha3,53,Copy(QTabela.FieldByName('NOME').AsString,26,25));
  End;   


  Application.ProcessMessages;

  RDprint1.TamanhoQteLinhas          := Tamanho_pagina;
  RDprint1.Fechar;

  End
 { Else if LeIni(Arq_Ini, 'Sistema', 'Imp. Orçamento') = 'RDPrint MP-4200' then
  begin


      AssignFile(MyFile, ExtractFilePath(ParamStr(0)) + 'Orcamento.Txt');
      Rewrite(MyFile);


        if LeIni(Arq_Ini, 'Sistema', 'Linha Cabeçalho') <> '' then
          WriteLn(MyFile, LeIni(Arq_Ini, 'Sistema', 'Linha Cabeçalho'))
        else
        begin
          Meio    := ((42 - Length(FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString)) / 2);
          Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));

          Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ') + FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString);

          Meio    := ((42 - Length(FrmPrincipal.QEmpresa.FieldByName('TELEFONE').AsString)) / 2);
          Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));

          Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ') + FrmPrincipal.QEmpresa.FieldByName('TELEFONE').AsString);

          Meio    := ((42 - Length(FrmPrincipal.QEmpresa.FieldByName('ENDERECO').AsString)) / 2);
          Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));

          Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ') + FrmPrincipal.QEmpresa.FieldByName('ENDERECO').AsString);

          Meio    := ((42 - Length(FrmPrincipal.QEmpresa.FieldByName('BAIRRO').AsString + ' - ' + FrmPrincipal.QEmpresa.FieldByName('MUNICIPIO').AsString)) / 2);
          Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));

          Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ') + FrmPrincipal.QEmpresa.FieldByName('BAIRRO').AsString + ' - ' + FrmPrincipal.QEmpresa.FieldByName('MUNICIPIO').AsString);

          Meio    := ((42 - Length('CEP: ' + FrmPrincipal.QEmpresa.FieldByName('CEP').AsString + ' - ' + 'CNPJ: ' + FrmPrincipal.QEmpresa.FieldByName('CNPJ').AsString)) / 2);
          Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));

          Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ') + 'CEP: ' + FrmPrincipal.QEmpresa.FieldByName('CEP').AsString + ' - ' + 'CNPJ: ' + FrmPrincipal.QEmpresa.FieldByName('CNPJ').AsString);

          Meio    := ((42 - Length('Hora: ' + TimeToStr(now) + '  Data: ' + DateToStr(date))) / 2);
          Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));

          Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ') + 'Hora: ' + TimeToStr(now) + '  Data: ' + DateToStr(date));
          Writeln(MyFile, '------------------------------------------');

          Meio    := ((42 - Length('Orçamento: ' + IntToStr(ID))) / 2);
          Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));

          Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ') + 'Orçamento: ' + IntToStr(QTabela.FieldByName('ORCAMENTO_ID').AsInteger));

          Meio    := ((48 - Length('At.: ' + Copy(QVendedor.FieldByName('NOME').AsString, 1, 20))) / 2);
          Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));

          Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ') + 'At.: ' + Copy(QVendedor.FieldByName('NOME').AsString, 1, 20));
        end;
        Writeln(MyFile, '------------------------------------------');
        Writeln(MyFile, 'Código / Produto       Valor  Qtde   Total');
        Writeln(MyFile, '------------------------------------------');



        while not QSub_Detail.Eof do
        begin

          Writeln(MyFile, StrZero(QSub_Detail.FieldByName('PRODUTO_ID').AsString, 6, 0) + ' / ' +
                          ForcaComprimento(QSub_Detail.FieldByName('DESCRICAO').AsString, 13, ' ') +
                          ForcaComprimento(' ', 7 - Length(FormatFloat('#,##0.00', QSub_Detail.FieldByName('VR_UNITARIO').AsFloat)), ' ') +
                          FormatFloat('#,##0.00', QSub_Detail.FieldByName('VR_UNITARIO').AsFloat) + ' ' +
                          ForcaComprimento(' ', 5 - Length(FormatFloat('#,##0.000', QSub_Detail.FieldByName('QUANTIDADE').AsFloat)), ' ') +
                          FormatFloat('#,##0.00', QSub_Detail.FieldByName('QUANTIDADE').AsFloat) + ' ' +
                          ForcaComprimento(' ', 7 - Length(FormatFloat('#,##0.00', QSub_Detail.FieldByName('VR_TOTAL').AsFloat)), ' ') +
                          FormatFloat('#,##0.00', QSub_Detail.FieldByName('VR_TOTAL').AsFloat));

          Application.ProcessMessages;

          QSub_Detail.Next;
        end;

        Writeln(MyFile, '                                 ---------');

        if (QTabela.FieldByName('VR_DESCONTO').AsFloat  > 0) or (QTabela.FieldByName('VR_ACRESCIMO').AsFloat > 0) then
        begin
          Writeln(MyFile, ForcaComprimento('Sub-Total', 42 - Length(FormatFloat('#,##0.00', Valor_produtos.value)), ' ') + FormatFloat('#,##0.00', Valor_produtos.value));

          if QTabela.FieldByName('VR_ACRESCIMO').AsFloat > 0 then
            Writeln(MyFile, ForcaComprimento('Acrescimo', 42 - Length(FormatFloat('#,##0.00', Vr_Acrescimo.value)), ' ') + FormatFloat('#,##0.00', Vr_Acrescimo.value));

          if QTabela.FieldByName('VR_DESCONTO').AsFloat > 0 then
            Writeln(MyFile, ForcaComprimento('Desconto', 42 - Length(FormatFloat('#,##0.00', Vr_Desconto.value)), ' ') + FormatFloat('#,##0.00', Vr_Desconto.value));

          if (QTabela.FieldByName('VR_DESCONTO').AsFloat > 0) or (QSub_Detail.FieldByName('VR_ACRESCIMO').AsFloat > 0) then
            Writeln(MyFile, '                                 =========');

          Writeln(MyFile, ForcaComprimento('Total', 42 - Length(FormatFloat('#,##0.00', Valor_produtos.value + Vr_Acrescimo.value - Vr_Desconto.value)), ' ') + FormatFloat('#,##0.00', Valor_produtos.value + Vr_Acrescimo.value - Vr_Desconto.value));
        end
        else
          Writeln(MyFile, ForcaComprimento('Total', 42 - Length(FormatFloat('#,##0.00', Valor_produtos.Value + Vr_Acrescimo.value - Vr_Desconto.value)), ' ') + FormatFloat('#,##0.00', Valor_produtos.value + Vr_Acrescimo.value - Vr_Desconto.value));



        Writeln(MyFile, '');
        Writeln(MyFile, 'Forma Pagamento: ' + QTabela.FieldByName('COND_PAGTO').AsString);
        Writeln(MyFile, '');
        Writeln(MyFile, '');

        if QTabela.FieldByName('OBSERVACAO').AsString <> '' then
        Begin
        Writeln(MyFile, 'Obs.:');
        Writeln(MyFile,COPY(QTabela.FieldByName('OBSERVACAO').AsString,1,42));
        if COPY(QTabela.FieldByName('OBSERVACAO').AsString,43,42) <> '' then
        Writeln(MyFile,COPY(QTabela.FieldByName('OBSERVACAO').AsString,43,42));
        if COPY(QTabela.FieldByName('OBSERVACAO').AsString,85,42) <> '' then
        Writeln(MyFile,COPY(QTabela.FieldByName('OBSERVACAO').AsString,85,42));
        if COPY(QTabela.FieldByName('OBSERVACAO').AsString,127,42) <> '' then
        Writeln(MyFile,COPY(QTabela.FieldByName('OBSERVACAO').AsString,127,42));
        if COPY(QTabela.FieldByName('OBSERVACAO').AsString,169,42) <> '' then
        Writeln(MyFile,COPY(QTabela.FieldByName('OBSERVACAO').AsString,169,42));
        if COPY(QTabela.FieldByName('OBSERVACAO').AsString,211,42) <> '' then
        Writeln(MyFile,COPY(QTabela.FieldByName('OBSERVACAO').AsString,211,42));
        End;

        if QTabela.FieldByName('CLIENTE_ID').AsInteger > 0 then
        begin

         IQuery.Sql.Clear;
         IQuery.Sql.Add('SELECT ORCAMENTOS.* , CLIENTES.*');
         IQuery.Sql.Add('FROM ORCAMENTOS');
         IQuery.Sql.Add('INNER JOIN CLIENTES ON (ORCAMENTOS.CLIENTE_ID = CLIENTES.CLIENTE_ID)');
         IQuery.Sql.Add('WHERE  ORCAMENTOS.ORCAMENTO_ID = :ORCAMENTO_ID');
         IQuery.ParamByName('ORCAMENTO_ID').AsInteger := QTabela.FieldByName('ORCAMENTO_ID').AsInteger;
         IQuery.Prepare;
         IQuery.Open;

          Writeln(MyFile, '');
          Writeln(MyFile,'Dados do Cliente:');
          Writeln(MyFile, Copy(IQuery.FieldByName('NOME').AsString,1,30));
          Writeln(MyFile, IQuery.FieldByName('CNPJ').AsString);
          Writeln(MyFile, IQuery.FieldByName('ENDERECO').AsString + ', ' + IQuery.FieldByName('NUMERO').AsString);
          Writeln(MyFile, IQuery.FieldByName('BAIRRO').AsString);
          Writeln(MyFile, IQuery.FieldByName('MUNICIPIO').AsString);
          Writeln(MyFile, IQuery.FieldByName('CEP').AsString);
          Writeln(MyFile, '');

          IQuery.Sql.Clear;
          IQuery.Sql.Add('SELECT * FROM TRANSPARCELAS');
          IQuery.Sql.Add('WHERE');
          IQuery.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
          IQuery.Sql.Add('AND (TIPO_TRANSACAO = :TIPO_TRANSACAO)');

          IQuery.ParamByName('TRANSACAO_ID').AsInteger  := QTabela.FieldByName('ORCAMENTO_ID').AsInteger;
          IQuery.ParamByName('TIPO_TRANSACAO').AsString := 'O';

          IQuery.Prepare;
          IQuery.Open;

          IQuery.First;

          while not IQuery.Eof do
          begin
            Writeln(MyFile, 'Vencimento: ' + IQuery.FieldByName('DT_VENCIMENTO').AsString +
                                             '     Valor : ' + FormatFloat('#,##0.00', IQuery.FieldByName('VALOR').AsFloat));
            Application.ProcessMessages;
            IQuery.Next;
          end;

          Writeln(MyFile, '');
          Writeln(MyFile, '');
          Writeln(MyFile, '');
          Writeln(MyFile, '');
          Writeln(MyFile, '');
          Writeln(MyFile, '       ___________________________        ');
          Writeln(MyFile, '         Assinatura do Cliente            ');

        end
        Else
          if Nome.Text <> '' then
          Begin
          Writeln(MyFile, '');
          Writeln(MyFile,'Dados do Cliente:');
          Writeln(MyFile, Copy(NOME.Text,1,30));
          Writeln(MyFile, Endereco.Text + ', ' + Numero.Text);
          Writeln(MyFile, Bairro.Text);
          Writeln(MyFile, Municipio.Text);
          Writeln(MyFile, Cep.Text);
          Writeln(MyFile, '');
          End;




        for Linhas := 1 to StrToInt(LeIni(Arq_Ini, 'Sistema', 'Linhas')) do
          Writeln(MyFile, ' ');


      CloseFile(MyFile);

      AssignFile(MyFile, ExtractFilePath(ParamStr(0)) + 'Orcamento.Txt');
      Reset(MyFile);

      Buffer := '';

      Linha := 1;

      RDprint2.Abrir;

      RDprint2.Impressora        := EPSON;

     // if CheckBox1.Checked then
     // RDPrint2.OpcoesPreview.Preview := True;

      RDprint2.TamanhoQteLinhas  := 1;
      RDprint2.TamanhoQteColunas := 42;
      RDprint2.Acentuacao        := SemAcento;
      RDprint2.MostrarProgresso  := True;
      RDprint2.ImpASCII(01, 01, '27 64');

      while not Eof(MyFile) do
      begin
        ReadLn(MyFile, S);

        Buffer := S;

        RDprint2.Imp(Linha, 01, Buffer);

        Inc(Linha);

        Application.ProcessMessages;
      end;

      CloseFile(MyFile);

      RDPrint2.TamanhoQteLinhas      := Linha;
      RDprint2.Fechar;

      if RDPrint2.OpcoesPreview.Preview = False then
         Application.MessageBox(Pchar('Orçamento: ' + IntToStr(QTabela.FieldByName('ORCAMENTO_ID').AsInteger) + ' impresso com sucesso.'), PChar(Msg_Title), mb_IconInformation);

    //  RDPrint2.OpcoesPreview.Preview := False;

  end }
  Else
  if (not CheckBox1.Checked) and (LeIni(Arq_Ini, 'Sistema', 'Imp. Orçamento') = 'RDPrint MP-4200') or (LeIni(Arq_Ini, 'Sistema', 'Imp. Orçamento') = 'TECTOY')then
  begin

     Begin


     { if Application.MessageBox('Deseja imprimir o comprovante?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = idYes then
      begin
        InputString := InputBox(PChar(Msg_Title), 'Cópias', '1');}

        AssignFile(MyFile, ExtractFilePath(ParamStr(0)) + '\Orcamentos\Orcamento'+ NUM_ORCAMENTO +'.Txt');
        Rewrite(MyFile);

       { for Copias := 1 to StrToInt(InputString) do
        begin}
        if LeIni(Arq_Ini, 'Sistema', 'Linha Cabeçalho') <> '' then
          WriteLn(MyFile, LeIni(Arq_Ini, 'Sistema', 'Linha Cabeçalho'))
        else
        begin
          if  FrmPrincipal.Config.FieldByName('IMPRESSAO_NORMAL_ORCAMENTO').AsString = 'True' then
          Begin
          Meio    := ((42 - Length(FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString)) / 2);
          Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));

          Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ') + FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString);

          Meio    := ((42 - Length(FrmPrincipal.QEmpresa.FieldByName('TELEFONE').AsString + '/' + FrmPrincipal.QEmpresa.FieldByName('CELULAR').AsString)) / 2);
          Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));

          Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ') + FrmPrincipal.QEmpresa.FieldByName('TELEFONE').AsString + '/' + FrmPrincipal.QEmpresa.FieldByName('CELULAR').AsString);

          Meio    := ((42 - Length(FrmPrincipal.QEmpresa.FieldByName('ENDERECO').AsString)) / 2);
          Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));

          Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ') + FrmPrincipal.QEmpresa.FieldByName('ENDERECO').AsString);

          Meio    := ((42 - Length(FrmPrincipal.QEmpresa.FieldByName('BAIRRO').AsString + ' - ' + FrmPrincipal.QEmpresa.FieldByName('MUNICIPIO').AsString)) / 2);
          Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));

          Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ') + FrmPrincipal.QEmpresa.FieldByName('BAIRRO').AsString + ' - ' + FrmPrincipal.QEmpresa.FieldByName('MUNICIPIO').AsString);

          Meio    := ((42 - Length('CEP: ' + FrmPrincipal.QEmpresa.FieldByName('CEP').AsString + ' - ' + 'CNPJ: ' + FrmPrincipal.QEmpresa.FieldByName('CNPJ').AsString)) / 2);
          Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));

          Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ') + 'CEP: ' + FrmPrincipal.QEmpresa.FieldByName('CEP').AsString + ' - ' + 'CNPJ: ' + FrmPrincipal.QEmpresa.FieldByName('CNPJ').AsString);

          Meio    := ((42 - Length('Hora: ' + TimeToStr(now) + '  Data: ' + DateToStr(date))) / 2);
          Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));

          Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ') + 'Hora: ' + TimeToStr(now) + '  Data: ' + DateToStr(date));
          Writeln(MyFile, '------------------------------------------------');

          Meio    := ((42 - Length('Orçamento: ' + IntToStr(ID))) / 2);
          Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));

          Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ') + 'Orçamento: ' + IntToStr(QTabela.FieldByName('ORCAMENTO_ID').AsInteger));

          Meio    := ((42 - Length('At.: ' + Copy(QVendedor.FieldByName('NOME').AsString, 1, 20))) / 2);
          Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));

          Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ') + 'At.: ' + Copy(QVendedor.FieldByName('NOME').AsString, 1, 20));
          End
          Else
          Begin
          Meio    := ((66 - Length(FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString)) / 2);
          Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));

          Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ') + FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString);

          Meio    := ((66 - Length(FrmPrincipal.QEmpresa.FieldByName('TELEFONE').AsString + '/' + FrmPrincipal.QEmpresa.FieldByName('CELULAR').AsString)) / 2);
          Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));

          Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ') + FrmPrincipal.QEmpresa.FieldByName('TELEFONE').AsString + '/' + FrmPrincipal.QEmpresa.FieldByName('CELULAR').AsString);

          Meio    := ((66 - Length(FrmPrincipal.QEmpresa.FieldByName('ENDERECO').AsString)) / 2);
          Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));

          Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ') + FrmPrincipal.QEmpresa.FieldByName('ENDERECO').AsString);

          Meio    := ((66 - Length(FrmPrincipal.QEmpresa.FieldByName('BAIRRO').AsString + ' - ' + FrmPrincipal.QEmpresa.FieldByName('MUNICIPIO').AsString)) / 2);
          Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));

          Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ') + FrmPrincipal.QEmpresa.FieldByName('BAIRRO').AsString + ' - ' + FrmPrincipal.QEmpresa.FieldByName('MUNICIPIO').AsString);

          Meio    := ((66 - Length('CEP: ' + FrmPrincipal.QEmpresa.FieldByName('CEP').AsString + ' - ' + 'CNPJ: ' + FrmPrincipal.QEmpresa.FieldByName('CNPJ').AsString)) / 2);
          Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));

          Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ') + 'CEP: ' + FrmPrincipal.QEmpresa.FieldByName('CEP').AsString + ' - ' + 'CNPJ: ' + FrmPrincipal.QEmpresa.FieldByName('CNPJ').AsString);

          Meio    := ((66 - Length('Hora: ' + TimeToStr(now) + '  Data: ' + DateToStr(date))) / 2);
          Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));

          Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ') + 'Hora: ' + TimeToStr(now) + '  Data: ' + DateToStr(date));
          Writeln(MyFile, '--------------------------------------------------------------');

          Meio    := ((66 - Length('Orçamento: ' + IntToStr(ID))) / 2);
          Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));

          Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ') + 'Orçamento: ' + IntToStr(QTabela.FieldByName('ORCAMENTO_ID').AsInteger));

          Meio    := ((66 - Length('At.: ' + Copy(QVendedor.FieldByName('NOME').AsString, 1, 20))) / 2);
          Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));

          Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ') + 'At.: ' + Copy(QVendedor.FieldByName('NOME').AsString, 1, 20));

          End;
        end;

        if  FrmPrincipal.Config.FieldByName('IMPRESSAO_NORMAL_ORCAMENTO').AsString = 'True' then
        Begin
        Writeln(MyFile, '------------------------------------------------');
        Writeln(MyFile, 'Código/Produto   Un.   Valor   Qtde/Fraç.  Total');
        Writeln(MyFile, '------------------------------------------------');

        End
        Else
        Begin
        Writeln(MyFile, '------------------------------------------------------------');
        Writeln(MyFile, 'Código / Produto   Un.   Valor   Qtde/Fraç.  Total      ');
        Writeln(MyFile, '------------------------------------------------------------');
        End;



        while not QSub_Detail.Eof do
        begin

          QSearch.Sql.Clear;
          QSearch.Sql.Add('SELECT UNIDADE_VENDA, FRACAO_VENDA FROM PRODUTOS WHERE PRODUTO_ID = :PRODUTO_ID');
          QSearch.ParambyName('PRODUTO_ID').AsInteger := QSub_Detail.FieldByName('PRODUTO_ID').AsInteger;
          QSearch.Prepare;
          QSearch.Open;

           if QSearch.FieldByName('FRACAO_VENDA').AsFloat > 1 Then
           fracao := '/' + ForcaComprimento(' ', 7 - Length(FormatFloat('#,0.00', QSub_Detail.FieldByName('QUANTIDADE').AsFloat * QSearch.FieldByName('FRACAO_VENDA').AsFloat )), ' ') +
                     FormatFloat('#,##0.00', QSub_Detail.FieldByName('QUANTIDADE').AsFloat * QSearch.FieldByName('FRACAO_VENDA').AsFloat)
           Else
           Fracao := '          ';


          Writeln(MyFile, StrZero(QSub_Detail.FieldByName('PRODUTO_ID').AsString, 6, 0) + '/' +
                          ForcaComprimento(QSub_Detail.FieldByName('DESCRICAO').AsString, 40, ' '));

          Writeln(MyFile,ForcaComprimento(' ', 7 - Length(QSearch.FieldByName('UNIDADE_VENDA').AsString), ' ') + QSearch.FieldByName('UNIDADE_VENDA').AsString +
          ForcaComprimento(' ', 9 - Length(FormatFloat('#,0.00', QSub_Detail.FieldByName('VR_UNITARIO').AsFloat)), ' ') +
                          FormatFloat('#,##0.00', QSub_Detail.FieldByName('VR_UNITARIO').AsFloat) + ' X ' +
                          ForcaComprimento(' ', 7 - Length(FormatFloat('#,0.00', QSub_Detail.FieldByName('QUANTIDADE').AsFloat)), ' ') +
                          FormatFloat('#,##0.00', QSub_Detail.FieldByName('QUANTIDADE').AsFloat) +
                          fracao
                          + ' = '+
                          ForcaComprimento(' ', 8 - Length(FormatFloat('#,0.00', QSub_Detail.FieldByName('VR_TOTAL').AsFloat)), ' ') +
                          FormatFloat('#,##0.00', QSub_Detail.FieldByName('VR_TOTAL').AsFloat) );




          //if QSearch.FieldByName('PESO').AsFloat > 0 Then
          //Peso_orcamento := Peso_orcamento + ( QSearch.FieldByName('PESO').AsFloat * QSub_Detail.FieldByName('QUANTIDADE').AsFloat);


          Application.ProcessMessages;

          QSub_Detail.Next;
        end;

        Writeln(MyFile, '                                        --------');

        if (QTabela.FieldByName('VR_DESCONTO').AsFloat  > 0) or (QTabela.FieldByName('VR_ACRESCIMO').AsFloat > 0) then
        begin
          Writeln(MyFile, ForcaComprimento('Sub-Total', 48 - Length(FormatFloat('#,##0.00', QTabela.FieldByName('VALOR_PRODUTOS').AsFloat)), ' ') + FormatFloat('#,##0.00', QTabela.FieldByName('VALOR_PRODUTOS').AsFloat));

          if QTabela.FieldByName('VR_ACRESCIMO').AsFloat > 0 then
            Writeln(MyFile, ForcaComprimento('Acrescimo', 48 - Length(FormatFloat('#,##0.00', QTabela.FieldByName('VR_ACRESCIMO').AsFloat)), ' ') + FormatFloat('#,##0.00', QTabela.FieldByName('VR_ACRESCIMO').AsFloat));

          if QTabela.FieldByName('VR_DESCONTO').AsFloat > 0 then
            Writeln(MyFile, ForcaComprimento('Desconto', 48 - Length(FormatFloat('#,##0.00', Vr_Desconto.value)), ' ') + FormatFloat('#,##0.00', Vr_Desconto.value));

          if (QTabela.FieldByName('VR_DESCONTO').AsFloat > 0) or (QTabela.FieldByName('VR_ACRESCIMO').AsFloat > 0) then

            Writeln(MyFile, '                                       =========');

          Writeln(MyFile, ForcaComprimento('Total', 47 - Length(FormatFloat('#,##0.00', QTabela.FieldByName('VALOR').AsFloat)), ' ') + FormatFloat('#,##0.00', QTabela.FieldByName('VALOR').AsFloat ));
        end
        else
          Writeln(MyFile, ForcaComprimento('Total', 47 - Length(FormatFloat('#,##0.00', QTabela.FieldByName('VALOR').AsFloat )), ' ') + FormatFloat('#,##0.00', QTabela.FieldByName('VALOR').AsFloat ));


      {  if peso_orcamento > 0 Then
        Begin
        Writeln(MyFile, '');
        Writeln(MyFile, ForcaComprimento('Peso Total(KG)', 48 - Length(FormatFloat('#,##0.00', Peso_orcamento )), ' ') + FormatFloat('#,##0.00', Peso_orcamento ));

        End;
       }

        Writeln(MyFile, '');
        Writeln(MyFile, 'Forma Pagamento: ' + QTabela.FieldByName('COND_PAGTO').AsString);
        Writeln(MyFile, '');
        Writeln(MyFile, '');





        if QTabela.FieldByName('OBSERVACAO').AsString <> '' then
        Begin
        Writeln(MyFile, 'Obs.:');
        Writeln(MyFile,COPY(QTabela.FieldByName('OBSERVACAO').AsString,1,48));
        if COPY(QTabela.FieldByName('OBSERVACAO').AsString,49,48) <> '' then
        Writeln(MyFile,COPY(QTabela.FieldByName('OBSERVACAO').AsString,49,48));
        if COPY(QTabela.FieldByName('OBSERVACAO').AsString,97,48) <> '' then
        Writeln(MyFile,COPY(QTabela.FieldByName('OBSERVACAO').AsString,97,48));
        if COPY(QTabela.FieldByName('OBSERVACAO').AsString,145,48) <> '' then
        Writeln(MyFile,COPY(QTabela.FieldByName('OBSERVACAO').AsString,145,48));
        if COPY(QTabela.FieldByName('OBSERVACAO').AsString,169,48) <> '' then
        Writeln(MyFile,COPY(QTabela.FieldByName('OBSERVACAO').AsString,169,48));
        if COPY(QTabela.FieldByName('OBSERVACAO').AsString,289,48) <> '' then
        Writeln(MyFile,COPY(QTabela.FieldByName('OBSERVACAO').AsString,289,48));
        End;

        if QTabela.FieldByName('CLIENTE_ID').AsInteger > 0 then
        begin

         QSearch.Sql.Clear;
         QSearch.Sql.Add('SELECT ORCAMENTOS.* , CLIENTES.*');
         QSearch.Sql.Add('FROM ORCAMENTOS');
         QSearch.Sql.Add('INNER JOIN CLIENTES ON (ORCAMENTOS.CLIENTE_ID = CLIENTES.CLIENTE_ID)');
         QSearch.Sql.Add('WHERE  ORCAMENTOS.ORCAMENTO_ID = :ORCAMENTO_ID');
         QSearch.ParamByName('ORCAMENTO_ID').AsInteger := QTabela.FieldByName('ORCAMENTO_ID').AsInteger;
         QSearch.Prepare;
         QSearch.Open;

          Writeln(MyFile, '');
          Writeln(MyFile,'Dados do Cliente:');
          Writeln(MyFile, Copy(QSearch.FieldByName('NOME').AsString,1,30));
          Writeln(MyFile, QSearch.FieldByName('CNPJ').AsString);
          Writeln(MyFile, QSearch.FieldByName('ENDERECO').AsString + ', ' + QSearch.FieldByName('NUMERO').AsString);
          Writeln(MyFile, QSearch.FieldByName('BAIRRO').AsString);
          Writeln(MyFile, QSearch.FieldByName('MUNICIPIO').AsString);
          Writeln(MyFile, QSearch.FieldByName('CEP').AsString);
          Writeln(MyFile, '');

          QSearch.Sql.Clear;
          QSearch.Sql.Add('SELECT * FROM TRANSPARCELAS');
          QSearch.Sql.Add('WHERE');
          QSearch.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
          QSearch.Sql.Add('AND (TIPO_TRANSACAO = :TIPO_TRANSACAO)');

          QSearch.ParamByName('TRANSACAO_ID').AsInteger  := QTabela.FieldByName('ORCAMENTO_ID').AsInteger;
          QSearch.ParamByName('TIPO_TRANSACAO').AsString := 'O';

          QSearch.Prepare;
          QSearch.Open;

          QSearch.First;

          while not QSearch.Eof do
          begin
            Writeln(MyFile, 'Vencimento: ' + QSearch.FieldByName('DT_VENCIMENTO').AsString +
                                             '     Valor : ' + FormatFloat('#,##0.00', QSearch.FieldByName('VALOR').AsFloat));
            Application.ProcessMessages;
            QSearch.Next;
          end;

          Writeln(MyFile, '');
          Writeln(MyFile, '');
          Writeln(MyFile, '');
          Writeln(MyFile, '');
          Writeln(MyFile, '');
          //              '------------------------------------------------');
          Writeln(MyFile, '        ___________________________                  ');
          Writeln(MyFile, '           Assinatura do Cliente                  ');

        end
        Else
          if Nome.Text <> '' then
          Begin
          Writeln(MyFile, '');
          Writeln(MyFile,'Dados do Cliente:');
          Writeln(MyFile, Copy(NOME.Text,1,30));
          Writeln(MyFile,'Telefone' +QTabela.FieldByName('TELEFONE').AsString);
          Writeln(MyFile, Endereco.Text + ', ' + QTabela.FieldByName('NUMERO').AsString);
          Writeln(MyFile, Bairro.Text);
          Writeln(MyFile, Municipio.Text);
          Writeln(MyFile, Cep.Text);
          Writeln(MyFile, '');
          End;


        for Linhas := 1 to StrToInt(LeIni(Arq_Ini, 'Sistema', 'Linhas')) do
          Writeln(MyFile, ' ');


      CloseFile(MyFile);

      AssignFile(MyFile, ExtractFilePath(ParamStr(0)) + '\Orcamentos\Orcamento'+ NUM_ORCAMENTO +'.Txt');
      Reset(MyFile);

      Buffer := '';

      Linha := 1;


       ACBrPosPrinter1.Porta := 'RAW:' + LeIni(Arq_Ini, 'Sistema', 'RAW Código Orçamento');
        //ACBrPosPrinter1.CortarPapel(True);

        if LeIni(Arq_Ini, 'Sistema', 'Impressora Orçamento Rápido') = 'Elgin' Then
        Begin
        ACBrPosPrinter1.Modelo := ppEscPosEpson;
        ACBrPosPrinter1.EspacoEntreLinhas := 2;
        ACBrPosPrinter1.LinhasEntreCupons := 2;
        End;

        IF NOT ACBrPosPrinter1.ativo Then
        ACBrPosPrinter1.Ativar;

       if ACBrPosPrinter1.ativo  Then
       Begin

        ACBrPosPrinter1.Buffer.Add('</zera>');

        if  FrmPrincipal.Config.FieldByName('IMPRESSAO_NORMAL_ORCAMENTO').AsString <> 'True'  Then
        Begin
        ACBrPosPrinter1.Buffer.Add('<c>');
        ACBrPosPrinter1.Buffer.Add('<N>');
        End;

            while not Eof(MyFile) do
            begin
              ReadLn(MyFile, S);

              Buffer := S;

             // RDprint2.Imp(Linha, 01, Buffer);
              ACBrPosPrinter1.Buffer.Add(Buffer);
              //Inc(Linha);

              Application.ProcessMessages;
            end;

         if  FrmPrincipal.Config.FieldByName('IMPRESSAO_NORMAL_ORCAMENTO').AsString <> 'True'  Then
         Begin
         ACBrPosPrinter1.Buffer.Add('<c>');
         ACBrPosPrinter1.Buffer.Add('<N>');
         End;

          if  (LeIni(Arq_Ini, 'Sistema', 'Imp. Orçamento') = 'TECTOY') Then
         ACBrPosPrinter1.Buffer.Add('</corte_parcial>');


       End;

        ACBrPosPrinter1.CortarPapel(True);
        ACBrPosPrinter1.Desativar;

        CloseFile(MyFile);

      {

      RDprint2.Abrir;

      RDprint2.Impressora        := EPSON;

      if Chk_visualizar.Checked then
      RDprint2.OpcoesPreview.Preview := True;

      RDprint2.TamanhoQteLinhas  := 1;
      RDprint2.TamanhoQteColunas := 48;
      RDprint2.Acentuacao        := SemAcento;
      RDprint2.MostrarProgresso  := True;
      RDprint2.ImpASCII(01, 01, '27 64');


      while not Eof(MyFile) do
      begin
        ReadLn(MyFile, S);

        Buffer := S;

        RDprint2.Imp(Linha, 01, Buffer);

        Inc(Linha);

        Application.ProcessMessages;
      end;


      CloseFile(MyFile);

      RDprint2.TamanhoQteLinhas      := Linha;
      RDprint2.Fechar;

      if RDprint2.OpcoesPreview.Preview = False then
         Application.MessageBox(Pchar('Orçamento: ' + IntToStr(QRel.FieldByName('ORCAMENTO_ID').AsInteger) + ' impresso com sucesso.'), PChar(Msg_Title), mb_IconInformation);


      RDprint2.OpcoesPreview.Preview := False;

      }
     End;
  end

  Else if (CheckBox1.Checked) or (LeIni(Arq_Ini, 'Sistema', 'Imp. Orçamento') = 'Normal') Then
  Begin
      QRMemo4.Lines.Clear;
      QRMemo3.Lines.Clear;

      QRLabel47.Caption   := FrmPrincipal.QEmpresa.FieldByName('ENDERECO').AsString + ', ' + FrmPrincipal.QEmpresa.FieldByName('NUMERO').AsString + ' - ' +
                            FrmPrincipal.QEmpresa.FieldByName('BAIRRO').AsString + ' - ' +
                            FrmPrincipal.QEmpresa.FieldByName('MUNICIPIO').AsString + ' - CEP ' +
                            FrmPrincipal.QEmpresa.FieldByName('CEP').AsString;
      QRLabel48.Caption   := 'CNPJ: ' + FrmPrincipal.QEmpresa.FieldByName('CNPJ').AsString + ' - I. E. ' +
                            FrmPrincipal.QEmpresa.FieldByName('INSCR_ESTADUAL').AsString;

      QRLabel77.Caption   :='Fone/Celular: ' +
                            FrmPrincipal.QEmpresa.FieldByName('TELEFONE').AsString + '/' + FrmPrincipal.QEmpresa.FieldByName('CELULAR').AsString ;

      if (LeIni(Arq_Ini, 'Sistema', 'Largura Papel') > '0') and (LeIni(Arq_Ini, 'Sistema', 'Altura Papel') > '0') then
      begin
        Orcamento.Page.Width     := StrToFloat(LeIni(Arq_Ini, 'Sistema', 'Largura Papel'));
        Orcamento.Page.Length    := StrToFloat(LeIni(Arq_Ini, 'Sistema', 'Altura Papel'));
      end;

      if LeIni(Arq_Ini, 'Orçamento', 'Endereço Cliente') = 'False' then
      begin
        QRLabel9.Enabled   := False;
        QRDBText12.Enabled := False;
        QRLabel10.Enabled  := False;
        QRDBText13.Enabled := False;
        QRLabel11.Enabled  := False;
        QRDBText14.Enabled := False;
        QRLabel12.Enabled  := False;
        QRDBText15.Enabled := False;
      end;

      if LeIni(Arq_Ini, 'Orçamento', 'Acréscimo/Desconto') = 'False' then
      begin
        QRLabel28.Enabled := False;
        QRLabel29.Enabled := False;
        QRBand2.Height    := 22;
      end;

      QSelect.Sql.Clear;
      QSelect.Sql.Add('SELECT * FROM TRANSPARCELAS');
      QSelect.Sql.Add('WHERE');
      QSelect.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
      QSelect.Sql.Add('AND (TIPO_TRANSACAO = :TIPO_TRANSACAO)');

      QSelect.ParamByName('TRANSACAO_ID').AsInteger  := QTabela.FieldByName('ORCAMENTO_ID').AsInteger;
      QSelect.ParamByName('TIPO_TRANSACAO').AsString := 'O';

      QSelect.Prepare;
      QSelect.Open;

      if not QSelect.IsEmpty then
      begin
        QRMemo4.Lines.Clear;
        QRMemo4.Lines.Add('Parcelamento');
        QRMemo4.Lines.Add('============');

        QSelect.First;
        while not QSelect.Eof do
        begin
          QRMemo4.Lines.Add('Venc.: ' + QSelect.FieldByName('DT_VENCIMENTO').AsString + ' - ' + FormatFloat('#,##0.00', QSelect.FieldByName('VALOR').AsFloat));

          Application.ProcessMessages;
          QSelect.Next;
        end;
      end;

      QRMemo3.Lines.Clear;
      QRMemo3.Lines.Text := QTabela.FieldByName('OBSERVACAO').AsString;

      Orcamento.PreviewModal;


  End;

  if (LeIni(Arq_Ini, 'Sistema', 'Imp. Orçamento') = 'Normal Reduzido') Then
  Begin



    if LeIni(Arq_Ini, 'Orçamento', 'Endereço Cliente') = 'False' then
    begin
      QRLabel34.Enabled   := False;
      QRDBText26.Enabled := False;
      QRLabel30.Enabled  := False;
      QRDBText42.Enabled := False;
      QRLabel36.Enabled  := False;
      QRDBText34.Enabled := False;
      QRLabel35.Enabled  := False;
      QRDBText25.Enabled := False;
      QRLabel37.Enabled  := False;
      QRDBText35.Enabled := False;
    end;

    if LeIni(Arq_Ini, 'Orçamento', 'Acréscimo/Desconto') = 'False' then
    begin
      QRLabel58.Enabled   := False;
      QRDBText55.Enabled := False;
      QRLabel56.Enabled  := False;
      QRDBText54.Enabled := False;
      QRLabel55.Enabled  := False;
      QRDBText53.Enabled  := False;
      QRLabel72.Enabled  := False;
      QRLabel73.Enabled  := False;
      QRBand2.Height     := 22;
    end;

    IQuery.Sql.Clear;
    IQuery.Sql.Add('SELECT * FROM TRANSPARCELAS');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
    IQuery.Sql.Add('AND (TIPO_TRANSACAO = :TIPO_TRANSACAO)');

    IQuery.ParamByName('TRANSACAO_ID').AsInteger  := QTabela.FieldByName('ORCAMENTO_ID').AsInteger;
    IQuery.ParamByName('TIPO_TRANSACAO').AsString := 'O';

    IQuery.Prepare;
    IQuery.Open;

    if not IQuery.IsEmpty then
    begin
      QRMemo2.Lines.Clear;
      QRMemo2.Lines.Add('Parcelamento');
      QRMemo2.Lines.Add('============');

      IQuery.First;
      while not IQuery.Eof do
      begin
        QRMemo2.Lines.Add('Venc.: ' + IQuery.FieldByName('DT_VENCIMENTO').AsString + ' - ' + FormatFloat('#,##0.00', IQuery.FieldByName('VALOR').AsFloat));

        Application.ProcessMessages;
        IQuery.Next;
      end;
    end
    else
      QRMemo2.Lines.Clear;

   QRMemo1.Lines.Clear;
   QRMemo1.Lines.Text := QTabela.FieldByName('OBSERVACAO').AsString;

    if  (LeIni(Arq_Ini, 'Sistema', 'Largura Papel') > '0') and (LeIni(Arq_Ini, 'Sistema', 'Altura Papel') > '0') then
    Begin
    Orcamento_Reduzido.Page.Width  := StrToFloat(LeIni(Arq_Ini, 'Sistema', 'Largura Papel'));
    Orcamento_Reduzido.Page.Length := StrToFloat(LeIni(Arq_Ini, 'Sistema', 'Altura Papel'));
    Orcamento_Reduzido.PreviewModal;
    End;

    if (LeIni(Arq_Ini, 'Sistema', 'Largura Papel') = '0') and (LeIni(Arq_Ini, 'Sistema', 'Altura Papel') = '0')    then
    begin
      //Reduzido.Page.Width  := StrToFloat(LeIni(Arq_Ini, 'Sistema', 'Largura Papel'));
      //Reduzido.Page.Length := StrToFloat(LeIni(Arq_Ini, 'Sistema', 'Altura Papel'));
      QRLabel59.Caption    := '*** ORÇAMENTO NUM. ' + StrZero(QTabela.FieldByName('ORCAMENTO_ID').AsString, 6, 0) + ' ***';
      Reduzido.PreviewModal;
    end;



  end;

   if LeIni(Arq_Ini, 'Sistema', 'Imp. Orçamento') = '40 Colunas' then
   begin
      if Application.MessageBox('Deseja imprimir o comprovante?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = idYes then
      begin
        InputString := InputBox(PChar(Msg_Title), 'Cópias', '1');

        for Copias := 1 to StrToInt(InputString) do
        begin
          if LeIni(Arq_Ini, 'Sistema', 'Path Impressora 40 Col.') <> '' then
            AssignFile(MyFile, LeIni(Arq_Ini, 'Sistema', 'Path Impressora 40 Col.'))
          else
            AssignFile(MyFile, 'LPT1');

          Rewrite(MyFile);

          if LeIni(Arq_Ini, 'Sistema', 'Linha Cabeçalho') <> '' then
            WriteLn(MyFile, LeIni(Arq_Ini, 'Sistema', 'Linha Cabeçalho'))
          else
          begin
            Writeln(MyFile, FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString);
            Writeln(MyFile, FrmPrincipal.QEmpresa.FieldByName('ENDERECO').AsString);
            Writeln(MyFile, 'Telefone: ' + FrmPrincipal.QEmpresa.FieldByName('TELEFONE').AsString);
            Writeln(MyFile, '               O R C A M E N T O                ');
            Writeln(MyFile, '               ====  ===  ======                ');
          end;

          Writeln(MyFile, '------------------------------------------------');

          if QTabela.FieldByName('COND_PAGTO').AsString = 'A PRAZO' then
            Writeln(MyFile, 'Cliente: ' + StrZero(QCliente.FieldByName('CLIENTE_ID').AsString, 5, 0) + '-' + Copy(QCliente.FieldByName('NOME').AsString, 1, 33))
          else
            Writeln(MyFile, QTabela.FieldByName('COND_PAGTO').AsString);

          Writeln(MyFile, '------------------------------------------------');
          Writeln(MyFile, DateToStr(date) + ' - ' + TimeToStr(now) + ' - ' + Copy(QVendedor.FieldByName('NOME').AsString, 1, 15));
          Writeln(MyFile, '     Qtde Descricao                        Total');

          QSub_Detail.First;
          while not QSub_Detail.Eof do
          begin
            Writeln(MyFile, ForcaComprimento(' ', 9 - Length(FormatFloat('#,##0.000', QSub_Detail.FieldByName('QUANTIDADE').AsFloat)), ' ') +
                            FormatFloat('#,##0.000', QSub_Detail.FieldByName('QUANTIDADE').AsFloat) + ' ' +
                            StrZero(QSub_Detail.FieldByName('PRODUTO_ID').AsString, 6, 0) + '-' +
                            ForcaComprimento(QSub_Detail.FieldByName('DESCRICAO').AsString, 30 - Length(FormatFloat('#,##0.00', QSub_Detail.FieldByName('VR_TOTAL').AsFloat)), ' ') + ' ' +
                            FormatFloat('#,##0.00', QSub_Detail.FieldByName('VR_TOTAL').AsFloat));

            Application.ProcessMessages;
            QSub_Detail.Next;
          end;

          Writeln(MyFile, '                                       ---------');

          if (Desconto > 0) or (Acrescimo > 0) then
          begin
            Writeln(MyFile, ForcaComprimento('Sub-Total', 48 - Length(FormatFloat('#,##0.00', Vr_Venda)), ' ') + FormatFloat('#,##0.00', Vr_Venda));

            if Acrescimo > 0 then
              Writeln(MyFile, ForcaComprimento('Acrescimo', 48 - Length(FormatFloat('#,##0.00', Acrescimo)), ' ') + FormatFloat('#,##0.00', Acrescimo));

            if Desconto > 0 then
              Writeln(MyFile, ForcaComprimento('Desconto', 48 - Length(FormatFloat('#,##0.00', Desconto)), ' ') + FormatFloat('#,##0.00', Desconto));

            if (Desconto > 0) or (Acrescimo > 0) then
              Writeln(MyFile, '                                       =========');

            Writeln(MyFile, ForcaComprimento('Total', 48 - Length(FormatFloat('#,##0.00', QTabela.FieldByName('VALOR').AsFloat + Acrescimo - Desconto)), ' ') + FormatFloat('#,##0.00', QTabela.FieldByName('VALOR').AsFloat + Acrescimo - Desconto));
          end
          else
            Writeln(MyFile, ForcaComprimento('Total', 48 - Length(FormatFloat('#,##0.00', QTabela.FieldByName('VALOR').AsFloat + Acrescimo - Desconto)), ' ') + FormatFloat('#,##0.00', QTabela.FieldByName('VALOR').AsFloat + Acrescimo - Desconto));

         { if Dinheiro.Value > 0 then
          begin
            Writeln(MyFile, ForcaComprimento('Dinheiro', 48 - Length(FormatFloat('#,##0.00', Dinheiro.Value)), ' ') + FormatFloat('#,##0.00', Dinheiro.Value));
            Writeln(MyFile, ForcaComprimento('Troco', 48 - Length(FormatFloat('#,##0.00', (Dinheiro.Value - (Vr_Venda + Acrescimo.Value - Desconto.Value)))), ' ') + FormatFloat('#,##0.00', (Dinheiro.Value - (Vr_Venda + Acrescimo.Value - Desconto.Value))));
          end;  }

          Writeln(MyFile, '');

          if QTabela.FieldByName('COND_PAGTO').AsString = 'A PRAZO' then
          begin
            IQuery.Sql.Clear;
            IQuery.Sql.Add('SELECT * FROM TRANSPARCELAS');
            IQuery.Sql.Add('WHERE');
            IQuery.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
            IQuery.Sql.Add('AND (TIPO_TRANSACAO = :TIPO_TRANSACAO)');

            IQuery.ParamByName('TRANSACAO_ID').AsInteger  := QTabela.FieldByName('ORCAMENTO_ID').AsInteger;
            IQuery.ParamByName('TIPO_TRANSACAO').AsString := 'O';

            IQuery.Prepare;
            IQuery.Open;

            IQuery.First;
            while not IQuery.Eof do
            begin
              Writeln(MyFile, 'Vencimento: ' + IQuery.FieldByName('DT_VENCIMENTO').AsString +
                                               '          Valor : ' + FormatFloat('#,##0.00', IQuery.FieldByName('VALOR').AsFloat));
              Application.ProcessMessages;
              IQuery.Next;
            end;

            Writeln(MyFile, '');
            Writeln(MyFile, '       _________________________________        ');
            Writeln(MyFile, '             Assinatura do Cliente              ');
          end;

          for Linhas := 1 to StrToInt(LeIni(Arq_Ini, 'Sistema', 'Linhas')) do
            Writeln(MyFile, ' ');

          CloseFile(MyFile);
        end;

      end;
   end;
   //Else



  if (LeIni(Arq_Ini, 'Sistema', 'Imp. Orçamento') = 'Normal') and (LeIni(Arq_Ini, 'Sistema', 'Largura Papel') = '0')
     and (LeIni(Arq_Ini, 'Sistema', 'Altura Papel') = '0')Then
  Orcamento.PreviewModal;

   {if (LeIni(Arq_Ini, 'Sistema', 'Largura Papel') > '0') and (LeIni(Arq_Ini, 'Sistema', 'Altura Papel') > '0')
      and (LeIni(Arq_Ini, 'Sistema', 'Imp. Orçamento') = 'Normal')then
   Begin
    Orcamento.Page.Width  := StrToFloat(LeIni(Arq_Ini, 'Sistema', 'Largura Papel'));
    Orcamento.Page.Length := StrToFloat(LeIni(Arq_Ini, 'Sistema', 'Altura Papel'));
    Orcamento.PreviewModal;
   End;
   }
   //Reduzido.PreviewModal;

 end;

procedure TFrmOrcamento.btnParcelasClick(Sender: TObject);
begin
  if QTabela.FieldByName('VALOR').AsFloat > 0 then
    Divisao_Parcelas(QTabela.FieldByName('ORCAMENTO_ID').AsInteger, 'O','', True, QTabela.FieldByName('DT_ORCAMENTO').AsDateTime, QTabela.FieldByName('VALOR').AsFloat);
end;

procedure TFrmOrcamento.btnPesquisaClick(Sender: TObject);
var
Condicao: String;
begin
  Condicao := GetPesquisa('ORCAMENTO');

  if Condicao <> '' then
  begin
    CmdSelectNull := Condicao + ' AND (EMPRESA_ID = :EMPRESA_ID) AND (COMANDA IS NULL)';

    QTabela.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  end;

  CmdOrderBy := 'ORDER BY ORCAMENTO_ID';

  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

  QTabela.Prepare;
  QTabela.Open;

  Set_Campos(False);
  Botoes_Normal;
end;

procedure TFrmOrcamento.btnPriorClick(Sender: TObject);
begin
  if not QTabela.Bof then
  begin
    QTabela.Prior;
    Set_Campos(False);
  end;

  Botoes_Normal;
end;

procedure TFrmOrcamento.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmOrcamento.btnSaveClick(Sender: TObject);
begin
  DetailSearch('');

  if Validacao then
  begin

    VALOR.Value := VALOR_PRODUTOS.Value +  VR_ACRESCIMO.Value - VR_DESCONTO.Value;

    if Operacao = 'Inserindo' then
    begin
      Insert;

      CmdSelectNull := 'WHERE (ORCAMENTO_ID IS NOT NULL) AND (DT_MOVIMENTO = :DT_MOVIMENTO) AND (EMPRESA_ID = :EMPRESA_ID) AND (COMANDA IS NULL)';
      CmdOrderBy    := 'ORDER BY ORCAMENTO_ID';

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
      Begin

       iF FloatToStr(QTabela.FieldByName('VALOR').AsFloat) <> Valor.Text Then
       Begin
        IQuery.Sql.Clear;
        IQuery.Sql.Add('DELETE FROM TRANSPARCELAS');
        IQuery.Sql.Add('WHERE');
        IQuery.Sql.Add('(TRANSACAO_ID = :ORCAMENTO_ID)');
        IQuery.Sql.Add('AND (TIPO_TRANSACAO = :TIPO_TRANSACAO)');

        IQuery.ParamByName('ORCAMENTO_ID').AsInteger  := QTabela.FieldByName('ORCAMENTO_ID').AsInteger;
        IQuery.ParamByName('TIPO_TRANSACAO').AsString := 'O';

        IQuery.Prepare;
        IQuery.ExecSql;

        btnParcelasClick(Self);

       End
       Else
       btnParcelasClick(Self);
      End
    else
    begin
      IQuery.Sql.Clear;
      IQuery.Sql.Add('DELETE FROM TRANSPARCELAS');
      IQuery.Sql.Add('WHERE');
      IQuery.Sql.Add('(TRANSACAO_ID = :ORCAMENTO_ID)');
      IQuery.Sql.Add('AND (TIPO_TRANSACAO = :TIPO_TRANSACAO)');

      IQuery.ParamByName('ORCAMENTO_ID').AsInteger  := QTabela.FieldByName('ORCAMENTO_ID').AsInteger;
      IQuery.ParamByName('TIPO_TRANSACAO').AsString := 'O';

      IQuery.Prepare;
      IQuery.ExecSql;


    end;

    if (FrmPrincipal.Config.FieldByName('OBJETO_ORDEM').AsString <> 'Madereira') and (LeIni(Arq_Ini, 'Sistema', 'Path Orçamento') <> '') and (not QSub_Detail.IsEmpty) then
      btnLogClick(Sender);

      If (FrmPrincipal.Config.FieldByName('AUDITORIA').AsString = 'True') and (valor.value > 0) Then
       GravarLog('ORCAMENTO','EDITAR',DateToStr(date),TimeToStr(time),'Orcamento_id ' , IntToStr(QTabela.FieldByName('ORCAMENTO_ID').AsInteger),FloatToStr(Valor.Value) + ' Documento: ' + InttoStr(QTabela.FieldByName('ORCAMENTO_ID').AsInteger)  ,FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger,QTabela.FieldByName('CLIENTE_ID').AsInteger);

    Operacao := '';
    Consulta.TabVisible := True;
  end;
end;

procedure TFrmOrcamento.btnVendedorClick(Sender: TObject);
begin
  try
    VENDEDOR_ID.Value := GetConsulta('PESSOAL', 0, 0, StrToInt(VENDEDOR_ID.Text));
  except
    VENDEDOR_ID.Value := GetConsulta('PESSOAL', 0, 0, 0);
  end;
end;

procedure TFrmOrcamento.btnVendedor_2Click(Sender: TObject);
begin
try
    VENDEDOR_ID_2.Value := GetConsulta('PARCEIRO', 0, 0, StrToInt(VENDEDOR_ID.Text));
  except
    VENDEDOR_ID_2.Value := GetConsulta('PARCEIRO', 0, 0, 0);
  end;
end;

procedure TFrmOrcamento.DBGrid1DblClick(Sender: TObject);
begin
  Manutencao.Show;
end;

procedure TFrmOrcamento.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
  var
OldBkMode: Integer;
begin
 DBGrid1.Canvas.Brush.Color := clInfoBk;

  if QTabela.FieldByName('TRANSACAO_ID').AsINTEGER > 0 then
    TDBGrid(Sender).Canvas.Font.Color := clGreen
  Else
    TDBGrid(Sender).Canvas.Font.Color := clNavy;

  if gdSelected in State then
  begin
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color := clYellow;

      FillRect(Rect);

      Brush.Color := clYellow;
      OldBkMode   := SetBkMode(Handle, TRANSPARENT);

      SetBkMode(Handle, OldBkMode);

      Font.Style := [fsBold];
    end;
  end;

  TDBGrid(Sender).DefaultDrawDataCell(Rect, TDBGrid(Sender).Columns[DataCol].Field, State);

end;

procedure TFrmOrcamento.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Manutencao.Show;
end;

procedure TFrmOrcamento.DBGrid1TitleClick(Column: TColumn);
begin
  CmdOrderBy := 'ORDER BY ' + Column.FieldName;

  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;
  QTabela.Open;
end;

procedure TFrmOrcamento.ItensColEnter(Sender: TObject);
begin
  if QSub_Detail.State in [dsInsert, dsEdit] then
  begin
    ProdutoSearch;
    TributoSearch;

    if (Itens.SelectedField.FieldName = 'tributo_id') and (QProduto.IsEmpty) then
      Itens.SelectedIndex := 0;

    if (Itens.SelectedField.FieldName = 'cst') and (QTributo.IsEmpty) then
      Itens.SelectedIndex := 2;

    if (Itens.SelectedField.FieldName = 'vr_unitario') and (QSub_Detail.FieldByName('QUANTIDADE').AsFloat = 0) then
      Itens.SelectedIndex := 4;

    if (Itens.SelectedField.FieldName = 'vr_desconto') and (QSub_Detail.FieldByName('VR_UNITARIO').AsFloat = 0) then
      Itens.SelectedIndex := 5;

  end;
end;

procedure TFrmOrcamento.ItensColExit(Sender: TObject);
begin
  if QSub_Detail.State in [dsInsert, dsEdit] then
  begin
    if Itens.SelectedField.FieldName = 'produto_id' then
    begin

      if QSub_Detail.FieldByName('TP_PROD_SERV').AsString = 'P' then
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
          QSub_Detail.FieldByName('DESCRICAO').AsString    := QProduto.FieldByName('DESCRICAO').AsString;
          QSub_Detail.FieldByName('TRIBUTO_ID').AsInteger  := QProduto.FieldByName('TRIBUTO_ID').AsInteger;
          QSub_Detail.FieldByName('ALIQUOTA_ICMS').AsFloat := QProduto.FieldByName('ALIQUOTA_ICMS').AsFloat;
          QSub_Detail.FieldByName('VR_UNITARIO').AsFloat   := QProduto.FieldByName('PRECO_VAREJO').AsFloat;
          QSub_Detail.FieldByName('UNIDADE').AsString      := QProduto.FieldByName('UNIDADE_VENDA').AsString;
        end;
      end
      Else
      Begin
         ServicoSearch;
        if QServico.IsEmpty then
        begin
          QSub_Detail.FieldByName('DESCRICAO').AsString    := '';
          QSub_Detail.FieldByName('TRIBUTO_ID').AsInteger  := 0;
          QSub_Detail.FieldByName('ALIQUOTA_ICMS').AsFloat := 0;
          QSub_Detail.FieldByName('VR_UNITARIO').AsFloat   := 0;

          Application.MessageBox('Serviço inexistente', PChar(Msg_Title), mb_IconStop);
          Itens.SelectedIndex := 0;
        end
        else
        begin
          QSub_Detail.FieldByName('DESCRICAO').AsString    := QServico.FieldByName('DESCRICAO').AsString;
          QSub_Detail.FieldByName('TRIBUTO_ID').AsInteger  := 1;
          QSub_Detail.FieldByName('ALIQUOTA_ICMS').AsFloat := QServico.FieldByName('ISS').AsFloat;
          QSub_Detail.FieldByName('VR_UNITARIO').AsFloat   := QServico.FieldByName('PRECO').AsFloat;
        end;
      End;


    end;

    {if Itens.SelectedField.FieldName = 'tributo_id' then
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
    }
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

        If FrmPrincipal.Config.FieldByName('OBJETO_ORDEM').AsString = 'Madereira' Then
        Begin
          if QProduto.FieldbyName('FRACAO_VENDA').AsFloat > 0 then
            QSub_Detail.FieldByName('MT_2').AsFloat       := RoundTo(QSub_Detail.FieldByName('QUANTIDADE').AsFloat * QProduto.FieldByName('FRACAO_VENDA').AsFloat, -2);
        End
        else
          if QProduto.FieldbyName('FRACAO_VENDA').AsFloat > 0 then
            QSub_Detail.FieldByName('QUANTIDADE').AsFloat := RoundTo(QSub_Detail.FieldByName('QUANTIDADE').AsFloat * QProduto.FieldByName('FRACAO_VENDA').AsFloat, -2);




       if (QProduto.FieldbyName('QUANT_MINIMA').AsFloat > 0) and (( QProduto.FieldByName('QUANTIDADE_C').AsFloat) <= QProduto.FieldbyName('QUANT_MINIMA').AsFloat) Then
          Application.MessageBox('Produto com estoque abaixo do mínimo.', PChar(Msg_Title), MB_ICONINFORMATION);


       QSub_Detail.FieldByName('VR_DESCONTO').AsFloat := 0;

      end;
    end;

    if Itens.SelectedField.FieldName = 'mt_2' then
    Begin
      if QProduto.FieldbyName('FRACAO_VENDA').AsFloat > 0 then
        QSub_Detail.FieldByName('QUANTIDADE').AsFloat := RoundTo(QSub_Detail.FieldByName('MT_2').AsFloat / QProduto.FieldByName('FRACAO_VENDA').AsFloat, -2);
    End;

    if Itens.SelectedField.FieldName = 'vr_desconto' then
    Begin
      if LeIni(Arq_Ini, 'Sistema', 'Desconto Percentual Orçamento') = 'True' then
      Begin
      QSub_Detail.FieldByName('VR_DESCONTO').AsFloat := RoundTo((((QSub_Detail.FieldByName('VR_UNITARIO').AsFloat * QSub_Detail.FieldByName('QUANTIDADE').AsFloat) * QSub_Detail.FieldByName('VR_DESCONTO').AsFloat) / 100) / QSub_Detail.FieldByName('QUANTIDADE').AsFloat  , - 2);
      //Application.MessageBox(Pchar('Desconto convertido para valores: ' + FloatToStrF(QSub_Detail.FieldByName('VR_DESCONTO').AsFloat ,ffNumber,15,2)), PChar(Msg_Title), MB_ICONINFORMATION);
      End;

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
            IQuery.ParamByName('NOME').AsString := Copy(Qvendedor.FieldByName('NOME').AsString,1,20) ;
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

      // Desconto por produto

      if FrmPrincipal.Config.FieldByName('DESCONTOS_PRODUTOS').AsString = 'True'  then
      Begin
      ProdutoSearch;
      Desc_por := 0;

        if QSub_Detail.FieldByName('VR_DESCONTO').AsFloat > 0 then
           Desc_Por := RoundTo(((QSub_Detail.FieldByName('VR_DESCONTO').AsFloat * 100) / (QSub_Detail.FieldByName('VR_UNITARIO').AsFloat * QSub_Detail.FieldByName('QUANTIDADE').AsFloat)), -2)
        else
           Desc_Por  := 0;

            IQuery.SQL.Clear;
            IQuery.SQL.Add('SELECT * FROM OPERADORES WHERE NOME LIKE :NOME');
            IQuery.ParamByName('NOME').AsString := Copy(Qvendedor.FieldByName('NOME').AsString,1,20) ;
            IQuery.Prepare;
            IQuery.Open;
         {
        if (IQuery.FieldByName('DESCONTO_MAX_SUBTOTAL').AsFloat = 0) and (QSub_Detail.FieldByName('VR_DESCONTO').AsFloat > 0) then
        begin
            Application.MessageBox(Pchar('Vr. Desconto máximo permitido para ' +  IQuery.FieldByName('NOME').AsString + ' ' + ': '+ IQuery.FieldByName('DESCONTO_MAX_SUBTOTAL').AsString +'%') , PChar(Msg_Title), mb_IconStop);
            Itens.SelectedIndex := 5;
            abort;
        end;
        }
          if QProduto.FieldbyName('DESC_MAXIMO').AsFloat > 0 then
          begin

            //SHOWMESSAGE('DESCONTO..');
            //SHOWMESSAGE(FloatToStr((((QSub_Detail.FieldByName('VR_UNITARIO').AsFloat * QSub_Detail.FieldByName('QUANTIDADE').AsFloat) * QProduto.FieldbyName('DESC_MAXIMO').AsFloat) / 100)));

            if QSub_Detail.FieldByName('VR_DESCONTO').AsFloat > (((QSub_Detail.FieldByName('VR_UNITARIO').AsFloat * QSub_Detail.FieldByName('QUANTIDADE').AsFloat) * QProduto.FieldbyName('DESC_MAXIMO').AsFloat) / 100) then
            begin
              Application.MessageBox(Pchar('Vr. Desconto máximo permitido para o produto:' + #13 +  QProduto.FieldByName('DESCRICAO').AsString + ' ' + ': '+ QProduto.FieldbyName('DESC_MAXIMO').AsString +'%/R$' + FloatToStr((((QSub_Detail.FieldByName('VR_UNITARIO').AsFloat * QSub_Detail.FieldByName('QUANTIDADE').AsFloat) * QProduto.FieldbyName('DESC_MAXIMO').AsFloat) / 100)) ) , PChar(Msg_Title), mb_IconStop);

              if FrmGerente = Nil then
              begin
                Application.CreateForm(TFrmGerente, FrmGerente);
                try
                  if FrmGerente.ShowModal = mrOK then
                  begin
                    if Desc_Por > FrmGerente.QOperador.FieldByName('DESCONTO_MAX_ITEM').AsFloat then
                    begin
                      Application.MessageBox('Desconto acima do máximo permitido', 'Orçamento', MB_IconStop + MB_OK);
                     Itens.SelectedIndex := 5;
                     abort;
                    end;
                  QSub_Detail.FieldByName('VR_TOTAL').AsFloat := (QSub_Detail.FieldByName('QUANTIDADE').AsFloat * (QSub_Detail.FieldByName('VR_UNITARIO').AsFloat - QSub_Detail.FieldByName('VR_DESCONTO').AsFloat));
                  Itens.SelectedIndex := 7;
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
                  if Desc_Por > FrmGerente.QOperador.FieldByName('DESCONTO_MAX_ITEM').AsFloat then
                  begin
                    Application.MessageBox('Desconto acima do máximo permitido', 'Orçamento', MB_IconStop + MB_OK);
                    Itens.SelectedIndex := 5;
                    abort;
                  end;
                QSub_Detail.FieldByName('VR_TOTAL').AsFloat := (QSub_Detail.FieldByName('QUANTIDADE').AsFloat * (QSub_Detail.FieldByName('VR_UNITARIO').AsFloat - QSub_Detail.FieldByName('VR_DESCONTO').AsFloat));
                Itens.SelectedIndex := 7;
                end
                else
                  Itens.SelectedIndex := 5;
                  abort;
              end;
            end;

            QSub_Detail.FieldByName('VR_TOTAL').AsFloat := (QSub_Detail.FieldByName('QUANTIDADE').AsFloat * (QSub_Detail.FieldByName('VR_UNITARIO').AsFloat - QSub_Detail.FieldByName('VR_DESCONTO').AsFloat));
            Itens.SelectedIndex := 7;
          end;
      End;

    End;


    If FrmPrincipal.Config.FieldByName('OBJETO_ORDEM').AsString = 'Madereira' Then
    Begin
      if QSub_Detail.FieldByName('MT_2').AsFloat > 0 then
        QSub_Detail.FieldByName('VR_TOTAL').AsFloat := RoundTo(QSub_Detail.FieldByName('MT_2').AsFloat * (QSub_Detail.FieldByName('VR_UNITARIO').AsFloat - QSub_Detail.FieldByName('VR_DESCONTO').AsFloat), -2)
      Else
        QSub_Detail.FieldByName('VR_TOTAL').AsFloat := RoundTo(QSub_Detail.FieldByName('QUANTIDADE').AsFloat * (QSub_Detail.FieldByName('VR_UNITARIO').AsFloat - QSub_Detail.FieldByName('VR_DESCONTO').AsFloat), -2);
    End
    Else
      QSub_Detail.FieldByName('VR_TOTAL').AsFloat := RoundTo(QSub_Detail.FieldByName('QUANTIDADE').AsFloat * (QSub_Detail.FieldByName('VR_UNITARIO').AsFloat - QSub_Detail.FieldByName('VR_DESCONTO').AsFloat), -2);

  end;

end;

procedure TFrmOrcamento.ItensEnter(Sender: TObject);
begin
  Botoes_Disable;
  Consulta.TabVisible := False;
end;

procedure TFrmOrcamento.ItensExit(Sender: TObject);
begin
  if QSub_Detail.State in [dsInsert, dsEdit] then
  begin
    QSub_Detail.Cancel;

  end;

  if (FrmPrincipal.Config.FieldByName('OBJETO_ORDEM').AsString <> 'Madereira') and (QTabela.FieldByName('DT_MOVIMENTO').AsDateTime < FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime) then
  begin
    Application.MessageBox('Movimento já encerrado', PChar(Msg_Title), mb_IconStop);
    Botoes_Normal;
    Consulta.TabVisible := True;
    exit;
  end;

  if FrmData.QAcesso.FieldByName('ALTERACAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para alteração', PChar(Msg_Title), mb_IconStop);
    Botoes_Normal;
    Consulta.TabVisible := True;
    exit;
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
  if Vr_Acrescimo.CanFocus then
    Vr_Acrescimo.SetFocus
  else
    Botoes_Normal;


end;

procedure TFrmOrcamento.ItensKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F4) and (QSub_Detail.State = dsBrowse) and (not QSub_Detail.IsEmpty) then
    QSub_Detail.Delete;

  if (Key = Vk_F7) and ((Itens.SelectedField.FieldName = 'produto_id') or (Itens.SelectedField.FieldName = 'tributo_id')) and (QSub_Detail.State in [dsInsert, dsEdit]) then
  begin
    if QSub_Detail.FieldByName('TP_PROD_SERV').AsString = 'P' then
    begin
      if Itens.SelectedField.FieldName = 'produto_id' then
        QSub_Detail.FieldByName('PRODUTO_ID').AsInteger := GetConsulta('ESTOQUE', StrToInt(EMPRESA_ID.Text), StrToInt(CLIENTE_ID.Text), QSub_Detail.FieldByName('PRODUTO_ID').AsInteger);
    end;

    if QSub_Detail.FieldByName('TP_PROD_SERV').AsString = 'S' then
    begin
      if Itens.SelectedField.FieldName = 'produto_id' then
        QSub_Detail.FieldByName('PRODUTO_ID').AsInteger := GetConsulta('SERVIÇOS', 0, 0, QSub_Detail.FieldByName('PRODUTO_ID').AsInteger);
    end;
  end;

  if (Key = Vk_F8) and ((Itens.SelectedField.FieldName = 'produto_id') or (Itens.SelectedField.FieldName = 'tributo_id')) and (QSub_Detail.State in [dsInsert, dsEdit]) then
  begin
    if QSub_Detail.FieldByName('TP_PROD_SERV').AsString = 'P' then
    begin
      if Itens.SelectedField.FieldName = 'produto_id' then
        QSub_Detail.FieldByName('PRODUTO_ID').AsInteger := GetConsulta('ESTOQUE_BARRA', StrToInt(EMPRESA_ID.Text), StrToInt(CLIENTE_ID.Text), QSub_Detail.FieldByName('PRODUTO_ID').AsInteger);
    end;
  end;

  if Key = VK_F9 then
    Perform(Wm_NextDlgCtl, 0, 0);

  if ((Key = Vk_Up) or (Key = Vk_Down)) and (QSub_Detail.State in [dsInsert, dsEdit]) then
    Key := 0;

end;

procedure TFrmOrcamento.ItensKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = #46 then
    Key := #44;

  if Key = #13 then
    Keybd_Event(VK_TAB, 0, 0, 0);

  Key := AnsiUpperCase(Key)[1];

  Application.ProcessMessages


end;

procedure TFrmOrcamento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmOrcamento.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (Operacao = 'Inserindo') or (Operacao = 'Alterando') or (QSub_Detail.State in [dsInsert, dsEdit]) or (Itens.Focused) then
  begin
    Application.MessageBox('É melhor salvar as alterações antes de continuar', PChar(Msg_Title), mb_IconStop);
    CanClose := False;
  end;
end;

procedure TFrmOrcamento.FormCreate(Sender: TObject);
var
X, Ult_Dia: Integer;
begin
  DBGrid1.Columns[0].Width := 50;
  DBGrid1.Columns[1].Width := 79;
  DBGrid1.Columns[2].Width := 79;
  DBGrid1.Columns[3].Width := 253;
  DBGrid1.Columns[4].Width := 70;
  DBGrid1.Columns[5].Width := 90;
  DBGrid1.Columns[6].Width := 100;


  Ult_Dia := StrToInt(Copy(DateToStr(Ult_Dia_Mes(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime)), 1, 2));
  Dias.Tabs.Clear;

  for X := 1 to Ult_Dia do
    Dias.Tabs.Add(IntToStr(X));

  Dias.Tabs.Add('Todos');

  DT_MOVIMENTO.MinDate := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
  DT_MOVIMENTO.MaxDate := StrToDate('31/12/2026');

  QRLabel7.Caption   := FrmPrincipal.QEmpresa.FieldByName('ENDERECO').AsString + ', ' + FrmPrincipal.QEmpresa.FieldByName('NUMERO').AsString + ' - ' +
                        FrmPrincipal.QEmpresa.FieldByName('BAIRRO').AsString + ' - ' +
                        FrmPrincipal.QEmpresa.FieldByName('MUNICIPIO').AsString + ' - CEP ' +
                        FrmPrincipal.QEmpresa.FieldByName('CEP').AsString;
  QRLabel8.Caption   := 'CNPJ: ' + FrmPrincipal.QEmpresa.FieldByName('CNPJ').AsString + ' - I. E. ' +
                        FrmPrincipal.QEmpresa.FieldByName('INSCR_ESTADUAL').AsString + ' - Fone: ' +
                        FrmPrincipal.QEmpresa.FieldByName('TELEFONE').AsString;
  QRLabel60.Caption  := FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString + ' - ' + FrmPrincipal.QEmpresa.FieldByName('TELEFONE').AsString;
  QRLabel20.Caption  := FrmPrincipal.QEmpresa.FieldByName('ENDERECO').AsString + ', ' + FrmPrincipal.QEmpresa.FieldByName('NUMERO').AsString + ' - ' + FrmPrincipal.QEmpresa.FieldByName('BAIRRO').AsString;

  Itens.Width             := 716;
  Itens.Columns[0].Width  := 20;
  Itens.Columns[1].Width  := 50;
  Itens.Columns[2].Width  := 300;
  Itens.Columns[3].Width  := 55;
  Itens.Columns[4].Width  := 55;
  Itens.Columns[5].Width  := 62;
  Itens.Columns[6].Width  := 62;
  Itens.Columns[7].Width  := 62;

  CmdSelect     := QTabela.Sql.Text;
  CmdSelectNull := 'WHERE (ORCAMENTO_ID IS NOT NULL) AND (DT_MOVIMENTO = :DT_MOVIMENTO) AND (EMPRESA_ID = :EMPRESA_ID) AND (COMANDA IS NULL)';

   if  Caso(Copy(FrmData.QAcesso.FieldByName('OPCOES').AsString, 66, 1))  = True Then
   CmdSelectNull :=  CmdSelectNull + ' AND (VENDEDOR_ID = :VENDEDOR_ID)';



  CmdOrderBy    := 'ORDER BY ORCAMENTO_ID';

  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

  QTabela.ParamByName('DT_MOVIMENTO').AsDateTime := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
  QTabela.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;

  if  Caso(Copy(FrmData.QAcesso.FieldByName('OPCOES').AsString, 66, 1))  = True Then
  QTabela.ParamByName('VENDEDOR_ID').AsInteger    := FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger;

  QTabela.Prepare;
  QTabela.Open;

  Botoes_Normal;
  Consulta.Show;

  //if LeIni(Arq_Ini, 'Sistema', 'Imp. Orçamento') = 'RDPrint MP-4200' then
  //CheckBox1.Caption := 'Visualizar Imp. MP-4200';

  if  QTabela.FieldByName('DT_MOVIMENTO').AsDateTime <> FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime then
  Itens.Enabled := False;

  if LeIni(Arq_Ini, 'Sistema', 'Desconto Percentual Orçamento') = 'True' then
  Itens.Columns[4].ReadOnly := True;

  IQuery.SQL.Clear;
  IQuery.SQL.Add('SELECT * FROM OPERADORES WHERE FUNCIONARIO_ID  = :FUNCIONARIO_ID');
  IQuery.ParamByName('FUNCIONARIO_ID').AsInteger := FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger;
  IQuery.Prepare;
  IQuery.Open;

  if IQuery.FieldbyName('DESCONTO_MAX_ITEM').AsFloat = 0 Then
  Itens.Columns[5].ReadOnly := True;

  if FrmPrincipal.Config.FieldByName('BLOQ_DESC_ORCAMENTO').AsString = 'True' Then
  Begin
  Itens.Columns[6].ReadOnly := True;
  Itens.Columns[5].ReadOnly := True;
  End;

  if FrmPrincipal.Config.FieldByName('DESCONTOS_PRODUTOS').AsString = 'True'  Then
  Begin
  Itens.Columns[5].ReadOnly := True;
  Itens.Columns[6].ReadOnly := False;
  End;

  If FrmPrincipal.Config.FieldByName('OBJETO_ORDEM').AsString = 'Madereira' Then
  Begin

  Itens.Columns[4].Visible := True;

  End
  Else
  Begin


  Itens.Columns[4].Visible := False;

  End;

  IQuery.Sql.Clear;
  IQuery.Sql.Text := 'SELECT DESCRICAO FROM TABELAS WHERE TIPO_TABELA = ''8'' ORDER BY DESCRICAO ';
  IQuery.Prepare;
  IQuery.Open;
  Setor.Clear;

  while not IQuery.eof do
  Begin
  Setor.Items.Add(Copy(IQuery.FieldByName('DESCRICAO').AsString,1,20));
  IQuery.Next;
  End;


   if LeIni(Arq_Ini, 'Sistema', 'Imp. Orçamento') = 'RDPrint MP-4200' then
  CheckBox1.Caption := 'Visualizar Orçamento'

end;

procedure TFrmOrcamento.FormShow(Sender: TObject);
begin
  DBGrid1.SetFocus;
end;

end.
