unit UBoletos_Duplicatas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, rxCurrEdit, Mask, rxToolEdit, Buttons, DB,
  IBCustomDataSet, IBQuery, QRCtrls, QuickRpt, DBCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmBoletos_Duplicatas = class(TForm)
    Label1: TLabel;
    Dtmen: TDateEdit;
    Dtmai: TDateEdit;
    Label3: TLabel;
    Tipo_Boleto: TComboBox;
    Label4: TLabel;
    Local_Pagto: TEdit;
    Label2: TLabel;
    Cliente: TCurrencyEdit;
    Label5: TLabel;
    Label6: TLabel;
    Bevel1: TBevel;
    Label7: TLabel;
    Instrucoes: TMemo;
    Classe: TEdit;
    Banco: TCurrencyEdit;
    btnCliente: TSpeedButton;
    btnBanco: TSpeedButton;
    Boleto: TQuickRep;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape19: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape7: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel17: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel16: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel19: TQRLabel;
    QRMemo1: TQRMemo;
    QRLabel25: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel28: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    DataBanco: TDataSource;
    DataCliente: TDataSource;
    DBText4: TDBText;
    DBText2: TDBText;
    ChildBand1: TQRChildBand;
    QRDBText13: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel31: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel37: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRDBText20: TQRDBText;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRDBText21: TQRDBText;
    QRLabel44: TQRLabel;
    QRDBText22: TQRDBText;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRDBText26: TQRDBText;
    QRDBText28: TQRDBText;
    QRLabel53: TQRLabel;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRLabel54: TQRLabel;
    QRShape39: TQRShape;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel55: TQRLabel;
    QRMemo2: TQRMemo;
    Label8: TLabel;
    Vias: TCurrencyEdit;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    Carne: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
    QRShape49: TQRShape;
    QRShape50: TQRShape;
    QRShape51: TQRShape;
    QRShape52: TQRShape;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRShape55: TQRShape;
    QRShape56: TQRShape;
    QRShape57: TQRShape;
    QRShape58: TQRShape;
    QRShape59: TQRShape;
    QRShape60: TQRShape;
    QRShape61: TQRShape;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    QRDBText37: TQRDBText;
    QRDBText38: TQRDBText;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    QRLabel75: TQRLabel;
    QRDBText41: TQRDBText;
    QRDBText42: TQRDBText;
    QRLabel76: TQRLabel;
    QRDBText43: TQRDBText;
    Duplicata_Mercantil: TQuickRep;
    QRBand1: TQRBand;
    QRShape62: TQRShape;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel79: TQRLabel;
    QRShape63: TQRShape;
    QRLabel81: TQRLabel;
    QRLabel82: TQRLabel;
    QRLabel83: TQRLabel;
    QRLabel84: TQRLabel;
    QRLabel85: TQRLabel;
    QRShape64: TQRShape;
    QRLabel86: TQRLabel;
    QRShape65: TQRShape;
    QRShape66: TQRShape;
    QRShape67: TQRShape;
    QRShape68: TQRShape;
    QRDBText44: TQRDBText;
    QRDBText45: TQRDBText;
    QRDBText46: TQRDBText;
    QRLabel87: TQRLabel;
    QRDBText47: TQRDBText;
    QRLabel88: TQRLabel;
    QRDBText48: TQRDBText;
    QRLabel89: TQRLabel;
    QRDBText49: TQRDBText;
    QRLabel90: TQRLabel;
    QRDBText50: TQRDBText;
    QRLabel91: TQRLabel;
    QRDBText51: TQRDBText;
    QRLabel92: TQRLabel;
    QRDBText52: TQRDBText;
    QRShape69: TQRShape;
    QRLabel80: TQRLabel;
    QRLabel93: TQRLabel;
    QRShape70: TQRShape;
    QRLabel94: TQRLabel;
    QRDBText53: TQRDBText;
    QRLabel95: TQRLabel;
    QRLabel96: TQRLabel;
    QRDBText55: TQRDBText;
    QRLabel97: TQRLabel;
    QRDBText56: TQRDBText;
    QRLabel98: TQRLabel;
    QRDBText57: TQRDBText;
    QRLabel99: TQRLabel;
    QRDBText58: TQRDBText;
    QRLabel100: TQRLabel;
    QRDBText59: TQRDBText;
    QRDBText60: TQRDBText;
    QRDBText61: TQRDBText;
    QRDBText62: TQRDBText;
    QRDBText63: TQRDBText;
    QRShape71: TQRShape;
    QRLabel101: TQRLabel;
    QRShape72: TQRShape;
    QRShape73: TQRShape;
    QRLabel102: TQRLabel;
    QRLabel103: TQRLabel;
    QRShape74: TQRShape;
    QRLabel104: TQRLabel;
    QRDBText64: TQRDBText;
    QRShape75: TQRShape;
    QRLabel105: TQRLabel;
    QRDBText65: TQRDBText;
    Duplicata: TQuickRep;
    DetailBand1: TQRBand;
    QRShape76: TQRShape;
    QRShape77: TQRShape;
    QRShape78: TQRShape;
    QRShape79: TQRShape;
    QRLabel106: TQRLabel;
    QRLabel107: TQRLabel;
    QRLabel108: TQRLabel;
    QRLabel109: TQRLabel;
    QRLabel110: TQRLabel;
    QRLabel111: TQRLabel;
    QRLabel112: TQRLabel;
    QRLabel113: TQRLabel;
    QRLabel114: TQRLabel;
    QRLabel115: TQRLabel;
    QRLabel116: TQRLabel;
    QRLabel117: TQRLabel;
    QRLabel118: TQRLabel;
    QRLabel119: TQRLabel;
    QRLabel120: TQRLabel;
    QRLabel121: TQRLabel;
    QRLabel122: TQRLabel;
    QRShape80: TQRShape;
    QRDBText66: TQRDBText;
    QRDBText67: TQRDBText;
    QRLabel123: TQRLabel;
    QRLabel124: TQRLabel;
    QRDBText68: TQRDBText;
    QRLabel125: TQRLabel;
    QRLabel126: TQRLabel;
    QRDBText69: TQRDBText;
    QRDBText70: TQRDBText;
    QRDBText71: TQRDBText;
    QRDBText72: TQRDBText;
    QRDBText73: TQRDBText;
    QRDBText74: TQRDBText;
    QRDBText75: TQRDBText;
    QRDBText76: TQRDBText;
    QRShape81: TQRShape;
    QRShape82: TQRShape;
    QRShape83: TQRShape;
    QRShape84: TQRShape;
    QRLabel127: TQRLabel;
    QRShape85: TQRShape;
    QRDBText77: TQRDBText;
    QRDBText78: TQRDBText;
    QRDBText80: TQRDBText;
    QRDBText81: TQRDBText;
    QRDBText82: TQRDBText;
    QRDBText83: TQRDBText;
    QRDBText84: TQRDBText;
    QRLabel128: TQRLabel;
    QRDBText85: TQRDBText;
    QRDBText86: TQRDBText;
    QRShape86: TQRShape;
    QRShape87: TQRShape;
    QRShape88: TQRShape;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    Tratorbens: TQuickRep;
    QRBand3: TQRBand;
    QRShape89: TQRShape;
    QRLabel130: TQRLabel;
    QRLabel131: TQRLabel;
    QRShape90: TQRShape;
    QRLabel132: TQRLabel;
    QRLabel133: TQRLabel;
    QRLabel134: TQRLabel;
    QRLabel135: TQRLabel;
    QRLabel136: TQRLabel;
    QRShape91: TQRShape;
    QRLabel137: TQRLabel;
    QRShape92: TQRShape;
    QRShape93: TQRShape;
    QRShape94: TQRShape;
    QRShape95: TQRShape;
    QRDBText54: TQRDBText;
    QRLabel138: TQRLabel;
    QRLabel140: TQRLabel;
    QRLabel142: TQRLabel;
    QRLabel143: TQRLabel;
    QRShape96: TQRShape;
    QRLabel144: TQRLabel;
    QRLabel145: TQRLabel;
    QRShape97: TQRShape;
    QRLabel146: TQRLabel;
    QRDBText94: TQRDBText;
    QRLabel147: TQRLabel;
    QRLabel148: TQRLabel;
    QRDBText95: TQRDBText;
    QRLabel149: TQRLabel;
    QRDBText96: TQRDBText;
    QRLabel150: TQRLabel;
    QRDBText97: TQRDBText;
    QRLabel151: TQRLabel;
    QRDBText98: TQRDBText;
    QRLabel152: TQRLabel;
    QRDBText99: TQRDBText;
    QRDBText100: TQRDBText;
    QRDBText101: TQRDBText;
    QRDBText102: TQRDBText;
    QRDBText103: TQRDBText;
    QRShape98: TQRShape;
    QRLabel153: TQRLabel;
    QRShape99: TQRShape;
    QRShape100: TQRShape;
    QRLabel154: TQRLabel;
    QRLabel155: TQRLabel;
    QRExpr5: TQRExpr;
    QRImage1: TQRImage;
    QRShape103: TQRShape;
    QRLabel129: TQRLabel;
    QRLabel139: TQRLabel;
    QRShape104: TQRShape;
    QRDBText79: TQRDBText;
    QRLabel141: TQRLabel;
    QRShape105: TQRShape;
    QRShape106: TQRShape;
    QRLabel158: TQRLabel;
    QRLabel159: TQRLabel;
    QRLabel160: TQRLabel;
    QRLabel161: TQRLabel;
    QRLabel162: TQRLabel;
    QRShape107: TQRShape;
    QRShape108: TQRShape;
    QRShape109: TQRShape;
    QRShape110: TQRShape;
    QRLabel163: TQRLabel;
    QRLabel164: TQRLabel;
    QRLabel165: TQRLabel;
    QRLabel166: TQRLabel;
    QRLabel167: TQRLabel;
    QRLabel168: TQRLabel;
    QRLabel169: TQRLabel;
    QRLabel170: TQRLabel;
    QRLabel171: TQRLabel;
    QRLabel172: TQRLabel;
    QRLabel173: TQRLabel;
    QRLabel174: TQRLabel;
    QRLabel175: TQRLabel;
    QRLabel176: TQRLabel;
    QRLabel177: TQRLabel;
    QRLabel178: TQRLabel;
    QRLabel179: TQRLabel;
    QRLabel180: TQRLabel;
    QRLabel181: TQRLabel;
    QRLabel182: TQRLabel;
    QRLabel183: TQRLabel;
    QRLabel184: TQRLabel;
    QRLabel185: TQRLabel;
    QRLabel186: TQRLabel;
    QRel: TFDQuery;
    QBanco: TFDQuery;
    qCliente: TFDQuery;
    QOrcamento: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRetornaClick(Sender: TObject);
    procedure btnClienteClick(Sender: TObject);
    procedure btnBancoClick(Sender: TObject);
    procedure ClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnExecutaClick(Sender: TObject);
    procedure ClienteExit(Sender: TObject);
    procedure BancoExit(Sender: TObject);
    procedure DtmenEnter(Sender: TObject);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    function Validacao: Boolean;
    procedure DetailSearch(Tabela: String);
  end;

var
  FrmBoletos_Duplicatas: TFrmBoletos_Duplicatas;
  ID_Trans: Integer;
  Tp_Trans: String;

  procedure Duplicatas(Transacao: Integer; Tipo: String);

implementation

uses
  UConsulta, UPrincipal, UData, UBoleto;

{$R *.dfm}

procedure Duplicatas(Transacao: Integer; Tipo: String);
begin
  ID_Trans := Transacao;
  Tp_Trans := Tipo;

  Application.CreateForm(TFrmBoletos_Duplicatas, FrmBoletos_Duplicatas);
  try
    FrmBoletos_Duplicatas.ShowModal;
  finally
    FrmBoletos_Duplicatas.Release;
  end;
end;

function TFrmBoletos_Duplicatas.Validacao: Boolean;
begin
  Result := False;

  Dtmen.Color       := clWindow;
  Dtmai.Color       := clWindow;
  Tipo_Boleto.Color := clWindow;
  Banco.Color       := clWindow;
  Cliente.Color     := clWindow;

  if Dtmai.Date < Dtmen.Date then
  begin
    Application.MessageBox('Data final inválida', PChar(Msg_Title), mb_IconStop);
    Dtmai.Color := clYellow;
    Dtmai.SetFocus;
    exit;
  end;

  if Tipo_Boleto.Text = '' then
  begin
    Application.MessageBox('Informe o Tipo de Boleto', PChar(Msg_Title), mb_IconStop);
    Tipo_Boleto.Color := clYellow;
    Tipo_Boleto.SetFocus;
    exit;
  end;

  if Cliente.Value > 0 then
  begin
    if QCliente.IsEmpty then
    begin
      Application.MessageBox('Cliente inexistente', PChar(Msg_Title), mb_IconSTop);
      Cliente.Color := clYellow;
      Cliente.SetFocus;
      exit;
    end
  end;

  if Banco.Value > 0 then
  begin
    if QBanco.IsEmpty then
    begin
      Application.MessageBox('Banco inexistente', PChar(Msg_Title), mb_IconStop);
      Banco.Color := clYellow;
      Banco.SetFocus;
      exit;
    end;
  end;

  Result := True;
end;

procedure TFrmBoletos_Duplicatas.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLabel122.Caption := 'Reconheço a exatidão desta DUPLICATA DE VENDA MERCANTIL, na importância acima que pagarei a ' +
                       FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString + ', ou a sua ordem no local e vencimento acima indicados.';
  QRLabel127.Caption := Extenso(QRel.FieldByName('VR_PARCELA').AsFloat);
end;

procedure TFrmBoletos_Duplicatas.DetailSearch(Tabela: String);
begin
  if ((Tabela = '') or (Tabela = 'Banco')) and (Banco.Text <> '') then
  begin
    QBanco.Close;
    QBanco.ParamByName('BANCO_ID').AsInteger   := StrToInt(Banco.Text);
    QBanco.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    QBanco.Prepare;
    QBanco.Open;
  end;

  if ((Tabela = '') or (Tabela = 'Cliente')) and (Cliente.Text <> '') then
  begin
    QCliente.Close;
    QCliente.ParamByName('CLIENTE_ID').AsInteger := StrToInt(Cliente.Text);
    QCliente.Prepare;
    QCliente.Open;
  end;
end;

procedure TFrmBoletos_Duplicatas.BancoExit(Sender: TObject);
begin
  DetailSearch('Banco');
end;

procedure TFrmBoletos_Duplicatas.btnBancoClick(Sender: TObject);
begin
  try
    Banco.Value := GetConsulta('BANCOS', 0, 0, StrToInt(Banco.Text));
  except
    Banco.Value := GetConsulta('BANCOS', 0, 0, 0);
  end;
end;

procedure TFrmBoletos_Duplicatas.btnClienteClick(Sender: TObject);
begin
  try
    Cliente.Value := GetConsulta('CLIENTES', 0, 0, StrToInt(Cliente.Text));
  except
    Cliente.Value := GetConsulta('CLIENTES', 0, 0, 0);
  end;
end;

procedure TFrmBoletos_Duplicatas.btnExecutaClick(Sender: TObject);
var
Lin, Col, Tam, Larg, Alt: Integer;
Device: array[0..255] of char;
Driver: array[0..255] of char;
Port: array[0..255] of char;
hDMode: THandle;
PDMode: PDEVMODE;
begin
// 307, 327
  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    DetailSearch('');

    if Validacao then
    begin

      Dtmen.Color       := clWindow;
      Dtmai.Color       := clWindow;
      Tipo_Boleto.Color := clWindow;
      Banco.Color       := clWindow;
      Cliente.Color     := clWindow;

      QRel.Sql.Clear;
      QRel.Sql.Add('SELECT CLIENTES.CLIENTE_ID, CLIENTES.NOME, CLIENTES.ENDERECO, CLIENTES.NUMERO, CLIENTES.MUNICIPIO, CLIENTES.CNPJ, ' +
                   'CLIENTES.BAIRRO, CLIENTES.CEP, CLIENTES.ESTADO, CLIENTES.TELEFONE_1, ' +
                   'CLIENTES.INSCRICAO, TRANSACOES.DT_TRANS, TRANSACOES.NUM_DOC, TRANSACOES.VALOR, TRANSACOES.TRANSACAO_ID, ' +
                   'TRANSPARCELAS.DT_VENCIMENTO, TRANSPARCELAS.VALOR AS VR_PARCELA, TRANSPARCELAS.DUPLICATA, TRANSPARCELAS.PARCELA_ID, ' +
                   'TRANSPARCELAS.DT_DESCONTO, TRANSPARCELAS.VALOR_DESCONTO');
      QRel.Sql.Add('FROM TRANSPARCELAS');
      QRel.Sql.Add('INNER JOIN TRANSACOES');
      QRel.Sql.Add('ON (TRANSPARCELAS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
      QRel.Sql.Add('INNER JOIN CLIENTES');
      QRel.Sql.Add('ON (TRANSACOES.CLIENTE_ID = CLIENTES.CLIENTE_ID)');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSPARCELAS.TRANSACAO_ID = :TRANSACAO_ID)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :CONDUTA)');
      QRel.Sql.Add('AND (TRANSACOES.COND_PAGTO = :COND_PAGTO)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');

      QRel.ParamByName('TRANSACAO_ID').AsInteger := ID_Trans;

      if Cliente.Value > 0 then
      begin
        QRel.Sql.Add('AND (CLIENTES.CLIENTE_ID = :CLIENTE_ID)');
        QRel.ParamByName('CLIENTE_ID').AsInteger := StrToInt(Cliente.Text);
      end;

      QRel.Sql.Add('AND (TRANSPARCELAS.VALOR > 0)');
      QRel.Sql.Add('AND (TRANSPARCELAS.BANCO_ID = 0)');
      QRel.Sql.Add('AND (TRANSPARCELAS.DT_VENCIMENTO BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('AND (TRANSPARCELAS.TIPO_TRANSACAO = :TIPO_TRANSACAO)');
      QRel.Sql.Add('AND ((TRANSPARCELAS.AGRUPAMENTO = 0) OR (TRANSPARCELAS.AGRUPAMENTO IS NULL))');

      if Classe.Text <> '' then
      begin
        QRel.Sql.Add('AND (CLIENTES.TIPO = :CLASSE)');
        QRel.ParamByName('CLASSE').AsString := Classe.Text;
      end;

      QRel.Sql.Add('ORDER BY TRANSPARCELAS.DT_VENCIMENTO, CLIENTES.NOME');

      QRel.ParamByName('TIPO_TRANSACAO').AsString := Tp_Trans;
      QRel.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
      QRel.ParamByName('CONDUTA').AsString        := '01';
      QRel.ParamByName('COND_PAGTO').AsString     := 'A PRAZO';
      QRel.ParamByName('TPCTB').AsString          := FrmData.QAcesso.FieldByName('TPCTB').AsString;
      QRel.ParamByName('DT_INICIAL').AsDateTime   := Dtmen.Date;
      QRel.ParamByName('DT_FINAL').AsDateTime     := Dtmai.Date;

      QRel.Prepare;
      QRel.Open;

      if Tipo_Boleto.Text = 'Boleto Simples' then
      begin
        QRMemo1.Lines     := Instrucoes.Lines;
        QRMemo2.Lines     := Instrucoes.Lines;
        QRLabel2.Caption  := Local_Pagto.Text;
        QRLabel29.Caption := Local_Pagto.Text;

        if Vias.Value = 1 then
        begin
          QRLabel54.Enabled  := False;
          QRShape39.Enabled  := False;
          ChildBand1.Enabled := False;
        end
        else
        begin
          QRLabel54.Enabled  := True;
          QRShape39.Enabled  := True;
          ChildBand1.Enabled := True;
        end;

        Boleto.PreviewModal;
      end;

      if Tipo_Boleto.Text = 'Carnê' then
        Carne.PreviewModal;

      if Tipo_Boleto.Text = 'Boleto Bancário' then
      begin
        if Banco.Value > 0 then
          Boleto_Bancario(Dtmen.Date, Dtmai.Date, StrToInt(Cliente.Text), Classe.Text, StrToInt(Banco.Text))
        else
        begin
          Application.MessageBox('É necessário informar o Banco', PChar(Msg_Title), mb_IconStop);
          Banco.SetFocus;
        end;
      end;

      if Tipo_Boleto.Text = 'Duplicata Mercantil Mod. 1' then
        Duplicata.PreviewModal;

      if Tipo_Boleto.Text = 'Duplicata Mercantil Mod. 2' then
        Duplicata_Mercantil.PreviewModal;

      if Tipo_Boleto.Text = 'Duplicata Mercantil Mod. 3' then
        Tratorbens.PreviewModal;

{
      if ComboBox1.Text = 'Borderô' then
      begin
        Larg := StrToInt(LeIni(Arq_Ini, 'Borderô', 'Largura'));
        Alt := StrToInt(LeIni(Arq_Ini, 'Borderô', 'Altura'));
        if PrintDialog1.Execute then
        begin
          Printer.Orientation := poPortrait;
          Printer.Canvas.Pen.Width := 5;
          if FontDialog1.Execute then
          begin
            Printer.Canvas.Font.Name := FontDialog1.Font.Name;
            Printer.Canvas.Font.Size := FontDialog1.Font.Size;
          end
          else
          begin
            Printer.Canvas.Font.Name := 'Draft 10cpi';
            Printer.Canvas.Font.Size := 10;
          end;
          Printer.GetPrinter(Device, Driver, Port, hDMode);
          if hDMode <> 0 then
          begin
            pDMode := GlobalLock(hDMode);
            if pDMode <> nil then
            begin
              pDMode^.dmPaperSize := DMPAPER_USER;
              pDMode^.dmPaperWidth := Larg;
              pDMode^.dmPaperLength := Alt;
              pDMode^.dmFields := pDMode^.dmFields or DM_PAPERSIZE;
              GlobalUnlock(hDMode);
            end;
          end;
          Bordero.Filter := 'BANCO = ' + QBancos.FieldByName('CODIGO').AsString;
          Bordero.Open;
          QRel.First;
          while not QRel.Eof do
          begin
            Printer.BeginDoc;
            try
              Bordero.First;
              while not Bordero.Eof do
              begin
                Lin := Bordero.FieldByName('LINHA').AsInteger;
                Col := Bordero.FieldByName('COLUNA').AsInteger;
                Tam := Bordero.FieldByName('TAM_MAX').AsInteger;
                if Bordero.FieldByName('CAMPO').AsString = 'LOCAL' then
                  Printer.Canvas.TextOut(Col, Lin, Copy(Edit1.Text, 1, Tam));
                if Bordero.FieldByName('CAMPO').AsString = 'VENCI' then
                  Printer.Canvas.TextOut(Col, Lin, QRel.FieldByName('DT_VENCIMENTO').AsString);
                if Bordero.FieldByName('CAMPO').AsString = 'CEDENTE' then
                  Printer.Canvas.TextOut(Col, Lin, Form_Menu.QEmpresa.FieldByName('RAZAO').AsString);
                if Bordero.FieldByName('CAMPO').AsString = 'AGENCIA' then
                  Printer.Canvas.TextOut(Col, Lin, QBancos.FieldByName('NUM_AGENCIA').AsString + '-' +
                                                   QBancos.FieldByName('NUM_CONTA').AsString);
                if Bordero.FieldByName('CAMPO').AsString = 'DATA' then
                  Printer.Canvas.TextOut(Col, Lin, QRel.FieldByName('DATA').AsString);
                if Bordero.FieldByName('CAMPO').AsString = 'NUMDOC' then
                  Printer.Canvas.TextOut(Col, Lin, QRel.FieldByName('NUM_DOC').AsString);
                if Bordero.FieldByName('CAMPO').AsString = 'VALOR' then
                  Printer.Canvas.TextOut(Col, Lin, FormatFloat('#,##0.00', QRel.FieldByName('VALOR_1').AsFloat));
                if Bordero.FieldByName('CAMPO').AsString = 'INSTRU' then
                begin
                  Printer.Canvas.TextOut(Col, Lin, Copy(Memo1.Lines[1], 1, Tam));
                  Lin := Lin - Printer.Canvas.Font.Height + 5;
                 Printer.Canvas.TextOut(Col, Lin, Copy(Memo1.Lines[2], 1, Tam));
                end;
                if Bordero.FieldByName('CAMPO').AsString = 'SACADO' then
                begin
                  Printer.Canvas.TextOut(Col, Lin, QRel.FieldByName('NOME').AsString);
                  Lin := Lin - Printer.Canvas.Font.Height + 5;
                  Printer.Canvas.TextOut(Col, Lin, 'CPF/CGC: ' + QRel.FieldByName('CNPJ').AsString);
                  Lin := Lin - Printer.Canvas.Font.Height + 5;
                  Printer.Canvas.TextOut(Col, Lin, QRel.FieldByName('ENDERECO').AsString + ' - CEP : ' +
                                                   QRel.FieldByName('CEP').AsString + ' - ' +
                                                   QRel.FieldByName('CIDADE').AsString + ' - ' +
                                                   QRel.FieldByName('UF').AsString);
                end;
                if Bordero.FieldByName('CAMPO').AsString = 'FIM' then
                  Printer.Canvas.TextOut(Col, Lin, ' ');
                Application.ProcessMessages;
                Bordero.Next;
              end;
            finally
              Printer.EndDoc;
            end;
            Application.ProcessMessages;
            QRel.Next;
          end;
          Bordero.Close;
        end;
      end;
      if ComboBox1.Text = 'Duplicata Pré-Impressa' then
      begin
        Larg := StrToInt(LeIni(Arq_Ini, 'Duplicata', 'Largura'));
        Alt := StrToInt(LeIni(Arq_Ini, 'Duplicata', 'Altura'));
        if PrintDialog1.Execute then
        begin
          Printer.Orientation := poPortrait;
          Printer.Canvas.Pen.Width := 5;
          Printer.Canvas.Font.Name := 'Arial';
          Printer.Canvas.Font.Size := 10;
          Printer.GetPrinter(Device, Driver, Port, hDMode);
          if hDMode <> 0 then
          begin
            pDMode := GlobalLock(hDMode);
            if pDMode <> nil then
            begin
              pDMode^.dmPaperSize := DMPAPER_USER;
              pDMode^.dmPaperWidth := Larg;
              pDMode^.dmPaperLength := Alt;
              pDMode^.dmFields := pDMode^.dmFields or DM_PAPERSIZE;
              GlobalUnlock(hDMode);
            end;
          end;
          Duplicata.Open;
          QRel.First;
          while not QRel.Eof do
          begin
            Printer.BeginDoc;
            try
              Duplicata.First;
              while not Duplicata.Eof do
              begin
                Lin := Duplicata.FieldByName('LINHA').AsInteger;
                Col := Duplicata.FieldByName('COLUNA').AsInteger;
                Tam := Duplicata.FieldByName('TAM_MAX').AsInteger;
                if Duplicata.FieldByName('CAMPO').AsString = 'EMISSAO' then
                  Printer.Canvas.TextOut(Col, Lin, QRel.FieldByName('DATA').AsString);
                if Duplicata.FieldByName('CAMPO').AsString = 'NOTAFISC' then
                  Printer.Canvas.TextOut(Col, Lin, QRel.FieldByName('NUM_DOC').AsString);
                if Duplicata.FieldByName('CAMPO').AsString = 'VALORNF' then
                  Printer.Canvas.TextOut(Col, Lin, FormatFloat('#,##0.00', QRel.FieldByName('VALOR').AsFloat));
                if Duplicata.FieldByName('CAMPO').AsString = 'FATURA' then
                  Printer.Canvas.TextOut(Col, Lin, QRel.FieldByName('PARCELA').AsString);
                if Duplicata.FieldByName('CAMPO').AsString = 'VALORDP' then
                  Printer.Canvas.TextOut(Col, Lin, FormatFloat('#,##0.00', QRel.FieldByName('VALOR_1').AsFloat));
                if Duplicata.FieldByName('CAMPO').AsString = 'NUMDP' then
                  Printer.Canvas.TextOut(Col, Lin, Qrel.FieldByName('DUPLICATA').AsString);
                if Duplicata.FieldByName('CAMPO').AsString = 'VENCIMENTO' then
                  Printer.Canvas.TextOut(Col, Lin, QRel.FieldByName('DT_VENCIMENTO').AsString);
                if Duplicata.FieldByName('CAMPO').AsString = 'SACADO' then
                  Printer.Canvas.TextOut(Col, Lin, QRel.FieldByName('NOME').AsString);
                if Duplicata.FieldByName('CAMPO').AsString = 'ENDERECO' then
                  Printer.Canvas.TextOut(Col, Lin, QRel.FieldByName('ENDERECO').AsString);
                if Duplicata.FieldByName('CAMPO').AsString = 'MUNICÍPIO' then
                  Printer.Canvas.TextOut(Col, Lin, QRel.FieldByName('CIDADE').AsString);
                if Duplicata.FieldByName('CAMPO').AsString = 'UF_CLI' then
                  Printer.Canvas.TextOut(Col, Lin, QRel.FieldByName('UF').AsString);
                if Duplicata.FieldByName('CAMPO').AsString = 'CEP' then
                  Printer.Canvas.TextOut(Col, Lin, QRel.FieldByName('CEP').AsString);
                if Duplicata.FieldByName('CAMPO').AsString = 'PRAÇA' then
                  Printer.Canvas.TextOut(Col, Lin, Edit1.Text);
                if Duplicata.FieldByName('CAMPO').AsString = 'CPFCNPJ' then
                  Printer.Canvas.TextOut(Col, Lin, QRel.FieldByName('CNPJ').AsString);
                if Duplicata.FieldByName('CAMPO').AsString = 'INSCEST' then
                  Printer.Canvas.TextOut(Col, Lin, QRel.FieldByName('INSCRICAO').AsString);
                if Duplicata.FieldByName('CAMPO').AsString = 'EXTENSO_1' then
                  Printer.Canvas.TextOut(Col, Lin, Copy(Extenso(QRel.FieldByName('VALOR_1').AsFloat), 1, TAM));
                if Duplicata.FieldByName('CAMPO').AsString = 'EXTENSO_2' then
                  Printer.Canvas.TextOut(Col, Lin, Copy(Extenso(QRel.FieldByName('VALOR_1').AsFloat), TAM + 1, TAM));
                if Duplicata.FieldByName('CAMPO').AsString = 'EXTENSO_3' then
                  Printer.Canvas.TextOut(Col, Lin, Copy(Extenso(QRel.FieldByName('VALOR_1').AsFloat), ((TAM * 2) + 1), TAM));
                if Duplicata.FieldByName('CAMPO').AsString = 'INSTRU_1' then
                  Printer.Canvas.TextOut(Col, Lin, Copy(Memo1.Lines[1], 1, Tam));
                if Duplicata.FieldByName('CAMPO').AsString = 'INSTRU_2' then
                  Printer.Canvas.TextOut(Col, Lin, Copy(Memo1.Lines[2], 1, Tam));
                if Duplicata.FieldByName('CAMPO').AsString = 'INSTRU_3' then
                  Printer.Canvas.TextOut(Col, Lin, Copy(Memo1.Lines[3], 1, Tam));
                if Duplicata.FieldByName('CAMPO').AsString = 'INSTRU_4' then
                  Printer.Canvas.TextOut(Col, Lin, Copy(Memo1.Lines[4], 1, Tam));
                if Duplicata.FieldByName('CAMPO').AsString = 'INSTRU_5' then
                  Printer.Canvas.TextOut(Col, Lin, Copy(Memo1.Lines[5], 1, Tam));
                if Duplicata.FieldByName('CAMPO').AsString = 'INSTRU_6' then
                  Printer.Canvas.TextOut(Col, Lin, Copy(Memo1.Lines[6], 1, Tam));
                if Duplicata.FieldByName('CAMPO').AsString = 'INSTRU_7' then
                  Printer.Canvas.TextOut(Col, Lin, Copy(Memo1.Lines[7], 1, Tam));
                if Duplicata.FieldByName('CAMPO').AsString = 'INSTRU_8' then
                  Printer.Canvas.TextOut(Col, Lin, Copy(Memo1.Lines[8], 1, Tam));
                if Duplicata.FieldByName('CAMPO').AsString = 'FIM' then
                  Printer.Canvas.TextOut(Col, Lin, ' ');
                Application.ProcessMessages;
                Duplicata.Next;
              end;
            finally
              Printer.EndDoc;
            end;
            Application.ProcessMessages;
            QRel.Next;
          end;
        end;
      end;
}
    end;
  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;

procedure TFrmBoletos_Duplicatas.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmBoletos_Duplicatas.ClienteExit(Sender: TObject);
begin
  DetailSearch('Cliente');
end;

procedure TFrmBoletos_Duplicatas.ClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = Cliente) then
    btnClienteClick(Self);

  if (Key = Vk_F7) and (Sender = Banco) then
    btnBancoClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmBoletos_Duplicatas.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmBoletos_Duplicatas.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
   // Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmBoletos_Duplicatas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmBoletos_Duplicatas.FormCreate(Sender: TObject);
begin
  QRel.Sql.Clear;
  QRel.Sql.Add('SELECT * FROM TRANSPARCELAS');
  QRel.Sql.Add('WHERE');
  QRel.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
  QRel.Sql.Add('AND (TIPO_TRANSACAO = :TIPO_TRANSACAO) ORDER BY DT_VENCIMENTO');

  QRel.ParamByName('TRANSACAO_ID').AsInteger  := ID_Trans;
  QRel.ParamByName('TIPO_TRANSACAO').AsString := Tp_Trans;

  QRel.Prepare;
  QRel.Open;

  QRel.First;

  Dtmen.Date := QRel.FieldByName('DT_VENCIMENTO').AsDateTime;

  QRel.Last;

  Dtmai.Date := QRel.FieldByName('DT_VENCIMENTO').AsDateTime;

  QRel.Sql.Clear;
  QRel.Sql.Add('SELECT * FROM TRANSACOES');
  QRel.Sql.Add('WHERE');
  QRel.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

  QRel.ParamByName('TRANSACAO_ID').AsInteger := ID_Trans;

  QRel.Prepare;
  QRel.Open;

  Cliente.Value := QRel.FieldByName('CLIENTE_ID').AsInteger;
  DetailSearch('Cliente');
end;

procedure TFrmBoletos_Duplicatas.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLabel80.Caption  := 'Desconto de R$ ' + FormatFloat('#,##0.00', QRel.FieldByName('VALOR_DESCONTO').AsFloat) +
                        ' sobre R$ ' + FormatFloat('#,##0.00', QRel.FieldByName('VR_PARCELA').AsFloat) +
                        ' até ' + QRel.FieldByName('DT_DESCONTO').AsString;
  QRLabel102.Caption := 'Reconhecemos a exatidão desta DUPLICATA DE VENDA MERCANTIL, ' +
                        'na importância acima, que pagaremos à ' + FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString + ', ou à sua ordem, na praça e ' +
                        'vencimento indicados. Não sendo paga no dia do vencimento, cobrar ' +
                        'juros de mora e despesas financeiras. Não conceder descontos mesmo ' +
                        'condicionalmente.';
  QRLabel103.Caption := Extenso(QRel.FieldByName('VR_PARCELA').AsFloat);
end;

procedure TFrmBoletos_Duplicatas.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
Item: Integer;
begin
  if FileExists(ExtractFilePath(ParamStr(0)) + 'Duplicata.Jpg') then
    QRImage1.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Duplicata.Jpg');

  QRLabel138.Caption := FrmPrincipal.QEmpresa.FieldByName('ENDERECO').AsString + ', ' +
                        FrmPrincipal.QEmpresa.FieldByName('NUMERO').AsString + ' - ' +
                        FrmPrincipal.QEmpresa.FieldByName('BAIRRO').AsString;
  QRLabel142.Caption := FrmPrincipal.QEmpresa.FieldByName('CEP').AsString + ' - ' +
                        FrmPrincipal.QEmpresa.FieldByName('MUNICIPIO').AsString + ' - ' +
                        FrmPrincipal.QEmpresa.FieldByName('ESTADO').AsString;
  QRLabel130.Caption := 'Insc. no CNPJ (MF): ' + FrmPrincipal.QEmpresa.FieldByName('CNPJ').AsString;
  QRLabel131.Caption := 'Inscrição Estadual: ' + FrmPrincipal.QEmpresa.FieldByName('INSCR_ESTADUAL').AsString;
  QRLabel143.Caption := 'Telefone: ' + FrmPrincipal.QEmpresa.FieldByName('TELEFONE').AsString;
  QRLabel140.Caption := 'Data da Emissão: ' + QRel.FieldByName('DT_TRANS').AsString;
  QRLabel154.Caption := 'A duplicata com igual número desta FATURA DE VENDA MERCANTIL COM PAGAMENTO PARCELADO ' +
                        'na importância supra que deve ser paga à ' + FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString +
                        ', ou à sua ordem, na praça e vencimento indicados.';
  QRLabel144.Caption := 'Desconto de R$ ' + FormatFloat('#,##0.00', QRel.FieldByName('VALOR_DESCONTO').AsFloat) +
                        ' sobre R$ ' + FormatFloat('#,##0.00', QRel.FieldByName('VR_PARCELA').AsFloat) +
                        ' até ' + QRel.FieldByName('DT_DESCONTO').AsString;
  QRLabel155.Caption := Extenso(QRel.FieldByName('VR_PARCELA').AsFloat);

  QOrcamento.Sql.Clear;
  QOrcamento.Sql.Add('SELECT DISTINCT TRANSACOES.DT_TRANS, TRANSACOES.NUM_DOC, TRANSACOES.VALOR');
  QOrcamento.Sql.Add('FROM TRANSACOES');
  QOrcamento.Sql.Add('INNER JOIN TRANSPARCELAS');
  QOrcamento.Sql.Add('ON (TRANSACOES.TRANSACAO_ID = TRANSPARCELAS.TRANSACAO_ID)');
  QOrcamento.Sql.Add('WHERE');
  QOrcamento.Sql.Add('(TRANSPARCELAS.AGRUPAMENTO = :AGRUPAMENTO)');
  QOrcamento.Sql.Add('ORDER BY TRANSACOES.DT_TRANS');

  QOrcamento.ParamByName('AGRUPAMENTO').AsInteger := QRel.FieldByName('TRANSACAO_ID').AsInteger;

  QOrcamento.Prepare;
  QOrcamento.Open;

  Item := 0;

  QRLabel163.Caption := '';
  QRLabel164.Caption := '';
  QRLabel165.Caption := '';
  QRLabel166.Caption := '';
  QRLabel167.Caption := '';
  QRLabel168.Caption := '';
  QRLabel169.Caption := '';
  QRLabel170.Caption := '';
  QRLabel171.Caption := '';
  QRLabel172.Caption := '';
  QRLabel173.Caption := '';
  QRLabel174.Caption := '';
  QRLabel175.Caption := '';
  QRLabel176.Caption := '';
  QRLabel177.Caption := '';
  QRLabel178.Caption := '';
  QRLabel179.Caption := '';
  QRLabel180.Caption := '';
  QRLabel181.Caption := '';
  QRLabel182.Caption := '';
  QRLabel183.Caption := '';
  QRLabel184.Caption := '';
  QRLabel185.Caption := '';
  QRLabel186.Caption := '';

  QOrcamento.First;
  while not QOrcamento.Eof do
  begin
    if Item = 0 then
    begin
      QRLabel163.Caption := QOrcamento.FieldByName('DT_TRANS').AsString;
      QRLabel164.Caption := StrZero(QOrcamento.FieldByName('NUM_DOC').AsString, 6, 0);
      QRLabel165.Caption := 'R$ ' + FormatFloat('#,##0.00', QOrcamento.FieldByName('VALOR').AsFloat);
    end;

    if Item = 1 then
    begin
      QRLabel166.Caption := QOrcamento.FieldByName('DT_TRANS').AsString;
      QRLabel167.Caption := StrZero(QOrcamento.FieldByName('NUM_DOC').AsString, 6, 0);
      QRLabel168.Caption := 'R$ ' + FormatFloat('#,##0.00', QOrcamento.FieldByName('VALOR').AsFloat);
    end;

    if Item = 2 then
    begin
      QRLabel169.Caption := QOrcamento.FieldByName('DT_TRANS').AsString;
      QRLabel170.Caption := StrZero(QOrcamento.FieldByName('NUM_DOC').AsString, 6, 0);
      QRLabel171.Caption := 'R$ ' + FormatFloat('#,##0.00', QOrcamento.FieldByName('VALOR').AsFloat);
    end;

    if Item = 3 then
    begin
      QRLabel172.Caption := QOrcamento.FieldByName('DT_TRANS').AsString;
      QRLabel173.Caption := StrZero(QOrcamento.FieldByName('NUM_DOC').AsString, 6, 0);
      QRLabel174.Caption := 'R$ ' + FormatFloat('#,##0.00', QOrcamento.FieldByName('VALOR').AsFloat);
    end;

    if Item = 4 then
    begin
      QRLabel175.Caption := QOrcamento.FieldByName('DT_TRANS').AsString;
      QRLabel176.Caption := StrZero(QOrcamento.FieldByName('NUM_DOC').AsString, 6, 0);
      QRLabel177.Caption := 'R$ ' + FormatFloat('#,##0.00', QOrcamento.FieldByName('VALOR').AsFloat);
    end;

    if Item = 5 then
    begin
      QRLabel178.Caption := QOrcamento.FieldByName('DT_TRANS').AsString;
      QRLabel179.Caption := StrZero(QOrcamento.FieldByName('NUM_DOC').AsString, 6, 0);
      QRLabel180.Caption := 'R$ ' + FormatFloat('#,##0.00', QOrcamento.FieldByName('VALOR').AsFloat);
    end;

    if Item = 6 then
    begin
      QRLabel181.Caption := QOrcamento.FieldByName('DT_TRANS').AsString;
      QRLabel182.Caption := StrZero(QOrcamento.FieldByName('NUM_DOC').AsString, 6, 0);
      QRLabel183.Caption := 'R$ ' + FormatFloat('#,##0.00', QOrcamento.FieldByName('VALOR').AsFloat);
    end;

    if Item = 7 then
    begin
      QRLabel184.Caption := QOrcamento.FieldByName('DT_TRANS').AsString;
      QRLabel185.Caption := StrZero(QOrcamento.FieldByName('NUM_DOC').AsString, 6, 0);
      QRLabel186.Caption := 'R$ ' + FormatFloat('#,##0.00', QOrcamento.FieldByName('VALOR').AsFloat);
    end;

    Inc(Item);

    Application.ProcessMessages;
    QOrcamento.Next;
  end;
end;

end.
