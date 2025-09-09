unit UCarne_RDP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, rxCurrEdit, Mask, rxToolEdit, Buttons, DB,
  IBCustomDataSet, IBQuery, QRCtrls, QuickRpt, DBCtrls, ACBrBase, ACBrBoleto,
  RDprint, Grids, DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrmCarne_rdp = class(TForm)
    Label1: TLabel;
    Dtmen: TDateEdit;
    Dtmai: TDateEdit;
    Label2: TLabel;
    Cliente: TCurrencyEdit;
    Label6: TLabel;
    Bevel1: TBevel;
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
    Duplicata_locacao: TQuickRep;
    QRBand3: TQRBand;
    QRShape89: TQRShape;
    QRLabel129: TQRLabel;
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
    QRDBText79: TQRDBText;
    QRDBText87: TQRDBText;
    QRLabel138: TQRLabel;
    QRDBText88: TQRDBText;
    QRLabel139: TQRLabel;
    QRDBText89: TQRDBText;
    QRLabel140: TQRLabel;
    QRDBText90: TQRDBText;
    QRLabel141: TQRLabel;
    QRDBText91: TQRDBText;
    QRLabel142: TQRLabel;
    QRDBText92: TQRDBText;
    QRLabel143: TQRLabel;
    QRDBText93: TQRDBText;
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
    QRShape101: TQRShape;
    QRLabel156: TQRLabel;
    QRDBText104: TQRDBText;
    QRShape102: TQRShape;
    QRLabel157: TQRLabel;
    QRDBText105: TQRDBText;
    QRExpr5: TQRExpr;
    QRDBText106: TQRDBText;
    QRDBText107: TQRDBText;
    QRDBText108: TQRDBText;
    QRLabel158: TQRLabel;
    QRDBText109: TQRDBText;
    QRLabel159: TQRLabel;
    QRDBText110: TQRDBText;
    QRLabel160: TQRLabel;
    QRLabel161: TQRLabel;
    QRLabel162: TQRLabel;
    ACBrBoleto1: TACBrBoleto;
    OpenDialog1: TOpenDialog;
    RDprint1: TRDprint;
    DBGrid1: TDBGrid;
    Label3: TLabel;
    DataTabela: TDataSource;
    IQuery: TFDQuery;
    QCliente: TFDQuery;
    Qrel: TFDQuery;
    QBanco: TFDQuery;
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
    procedure btn1Click(Sender: TObject);
    procedure RDprint1NewPage(Sender: TObject; Pagina: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    function Validacao: Boolean;
    procedure DetailSearch(Tabela: String);
  end;

var
  FrmCarne_rdp: TFrmCarne_rdp;
  Pagina, Linha : Integer;

implementation

uses
  UConsulta, UPrincipal, UData, UBoleto;

{$R *.dfm}

function TFrmCarne_rdp.Validacao: Boolean;
begin
  Result := False;
  
  Dtmen.Color       := clWindow;
  Dtmai.Color       := clWindow;

  Banco.Color       := clWindow;
  Cliente.Color     := clWindow;

  if Dtmai.Date < Dtmen.Date then
  begin
    Application.MessageBox('Data final inválida', PChar(Msg_Title), mb_IconStop);
    Dtmai.Color := clYellow;
    Dtmai.SetFocus;
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

procedure TFrmCarne_rdp.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLabel122.Caption := 'Reconheço a exatidão desta DUPLICATA DE VENDA MERCANTIL, na importância acima que pagarei a ' +
                       FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString + ', ou a sua ordem no local e vencimento acima indicados.';
  QRLabel127.Caption := Extenso(QRel.FieldByName('VR_PARCELA').AsFloat);
end;

procedure TFrmCarne_rdp.DetailSearch(Tabela: String);
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

procedure TFrmCarne_rdp.BancoExit(Sender: TObject);
begin
  DetailSearch('Banco');
end;

procedure TFrmCarne_rdp.btn1Click(Sender: TObject);
var
x:Integer;
Titulo: TACBrTitulo;
texto: TMemo;
Linha :string;
begin

  if QBanco.IsEmpty then
  begin
    Application.MessageBox('Banco inexistente', PChar(Msg_Title), mb_IconStop);
    Banco.Color := clYellow;
    Banco.SetFocus;
    exit;
  end;



 if OpenDialog1.Execute then
  begin

    if QBanco.FieldByName('NUM_BANCO').AsInteger = 1 then
    begin
      ACBrBoleto1.Banco.Digito                := 9;
      ACBrBoleto1.Banco.Nome                  := 'Banco do Brasil';
      ACBrBoleto1.Banco.Numero                := 1;
      ACBrBoleto1.Banco.TamanhoMaximoNossoNum := 10;
      ACBrBoleto1.Banco.TipoCobranca          := cobBancoDoBrasil;
    end
    else if QBanco.FieldByName('NUM_BANCO').AsInteger = 21 then
    begin
      ACBrBoleto1.Banco.Digito                := 3;
      ACBrBoleto1.Banco.Nome                  := 'Banestes';
      ACBrBoleto1.Banco.Numero                := 21;
      ACBrBoleto1.Banco.TamanhoMaximoNossoNum := 9;
      ACBrBoleto1.Banco.TipoCobranca          := cobBanestes;
    end
    else if QBanco.FieldByName('NUM_BANCO').AsInteger = 33 then
    begin
      ACBrBoleto1.Banco.Digito                := 7;
      ACBrBoleto1.Banco.Nome                  := 'Santander';
      ACBrBoleto1.Banco.Numero                := 33;
      ACBrBoleto1.Banco.TamanhoMaximoNossoNum := 12;
      ACBrBoleto1.Banco.TipoCobranca           := cobSantander;
    end
    else if QBanco.FieldByName('NUM_BANCO').AsInteger = 41 then
    begin
      ACBrBoleto1.Banco.Digito                := 8;
      ACBrBoleto1.Banco.Nome                  := 'Banrisul';
      ACBrBoleto1.Banco.Numero                := 41;
      ACBrBoleto1.Banco.TamanhoMaximoNossoNum := 8;
      ACBrBoleto1.Banco.TipoCobranca          := cobBanrisul;
    end
    else if QBanco.FieldByName('NUM_BANCO').AsInteger = 104 then
    begin
      ACBrBoleto1.Banco.Digito                := 9;
      ACBrBoleto1.Banco.Nome                  := 'Caixa Economica Federals';
      ACBrBoleto1.Banco.Numero                := 104;
      ACBrBoleto1.Banco.TamanhoMaximoNossoNum := 15;
      ACBrBoleto1.Banco.TipoCobranca          := cobCaixaEconomica;
    end
    else if QBanco.FieldByName('NUM_BANCO').AsInteger = 237 then
    begin
      ACBrBoleto1.Banco.Digito                := 2;
      ACBrBoleto1.Banco.Nome                  := 'Bradesco';
      ACBrBoleto1.Banco.Numero                := 237;
      ACBrBoleto1.Banco.TamanhoMaximoNossoNum := 11;
      ACBrBoleto1.Banco.TipoCobranca          := cobBradesco;
    end
    else if QBanco.FieldByName('NUM_BANCO').AsInteger = 341 then
    begin
      ACBrBoleto1.Banco.Digito                := 7;
      ACBrBoleto1.Banco.Nome                  := 'Banco Itau';
      ACBrBoleto1.Banco.Numero                := 341;
      ACBrBoleto1.Banco.TamanhoMaximoNossoNum := 8;
      ACBrBoleto1.Banco.TipoCobranca          := cobItau;
    end
    else if QBanco.FieldByName('NUM_BANCO').AsInteger = 389 then
    begin
      ACBrBoleto1.Banco.Digito                := 1;
      ACBrBoleto1.Banco.Nome                  := 'Banco Mercantil';
      ACBrBoleto1.Banco.Numero                := 389;
      ACBrBoleto1.Banco.TamanhoMaximoNossoNum := 6;
      ACBrBoleto1.Banco.TipoCobranca          := cobBancoMercantil;
    end
    else if QBanco.FieldByName('NUM_BANCO').AsInteger = 399 then
    begin
      ACBrBoleto1.Banco.Digito                := 9;
      ACBrBoleto1.Banco.Nome                  := 'HSBC';
      ACBrBoleto1.Banco.Numero                := 399;
      ACBrBoleto1.Banco.TamanhoMaximoNossoNum := 13;
      ACBrBoleto1.Banco.TipoCobranca          := cobHSBC;
    end
    else if QBanco.FieldByName('NUM_BANCO').AsInteger = 748 then
    begin
      ACBrBoleto1.Banco.Digito                := 10;
      ACBrBoleto1.Banco.Nome                  := 'Sicredi';
      ACBrBoleto1.Banco.Numero                := 748;
      ACBrBoleto1.Banco.TamanhoMaximoNossoNum := 8;
      ACBrBoleto1.Banco.TipoCobranca          := cobSicred;
    end
    else if QBanco.FieldByName('NUM_BANCO').AsInteger = 756 then
    begin
      ACBrBoleto1.Banco.Digito                := 0;
      ACBrBoleto1.Banco.Nome                  := 'BANCO COOPERATIVO DO BRASIL S.A.';
      ACBrBoleto1.Banco.Numero                := 756;
      ACBrBoleto1.Banco.TamanhoMaximoNossoNum := 7;
      ACBrBoleto1.Banco.TipoCobranca          := cobBancoob;
    end;

    {ACBrBoleto1.Cedente.Nome              := FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString;
    ACBrBoleto1.Cedente.CodigoCedente     := QBanco.FieldByName('COD_CEDENTE').AsString;
    ACBrBoleto1.Cedente.CodigoTransmissao := '';
    ACBrBoleto1.Cedente.Agencia           := QBanco.FieldByName('NUM_AGENCIA').AsString;
    ACBrBoleto1.Cedente.AgenciaDigito     := QBanco.FieldByName('DIG_AGENCIA').AsString;
    ACBrBoleto1.Cedente.Conta             := QBanco.FieldByName('NUM_CONTA').AsString;
    ACBrBoleto1.Cedente.ContaDigito       := QBanco.FieldByName('DIG_CONTA').AsString;
    ACBrBoleto1.Cedente.Modalidade        := QBanco.FieldByName('MOD_CEDENTE').AsString;
    ACBrBoleto1.Cedente.Convenio          := QBanco.FieldByName('CONV_CEDENTE').AsString;
    ACBrBoleto1.Cedente.CNPJCPF           := FrmPrincipal.QEmpresa.FieldByName('CNPJ').AsString;
    ACBrBoleto1.Cedente.Logradouro        := FrmPrincipal.QEmpresa.FieldByName('ENDERECO').AsString;
    ACBrBoleto1.Cedente.NumeroRes         := QBanco.FieldByName('NUM_RES_CEDENTE').AsString;
    ACBrBoleto1.Cedente.Complemento       := '';
    ACBrBoleto1.Cedente.Bairro            := FrmPrincipal.QEmpresa.FieldByName('BAIRRO').AsString;
    ACBrBoleto1.Cedente.Cidade            := FrmPrincipal.QEmpresa.FieldByName('MUNICIPIO').AsString;
    ACBrBoleto1.Cedente.UF                := FrmPrincipal.QEmpresa.FieldByName('ESTADO').AsString;
    ACBrBoleto1.Cedente.CEP               := FrmPrincipal.QEmpresa.FieldByName('CEP').AsString;

    if LeIni(Arq_Ini, 'Boleto', 'Responsável Emissão') = 'Banco Emite' then
      ACBrBoleto1.Cedente.ResponEmissao := tbBancoEmite
    else if LeIni(Arq_Ini, 'Boleto', 'Responsável Emissão') = 'Banco não Reemite' then
      ACBrBoleto1.Cedente.ResponEmissao := tbBancoNaoReemite
    else if LeIni(Arq_Ini, 'Boleto', 'Responsável Emissão') = 'Banco Reemite' then
      ACBrBoleto1.Cedente.ResponEmissao := tbBancoReemite
    else if LeIni(Arq_Ini, 'Boleto', 'Responsável Emissão') = 'Cliente Emite' then
      ACBrBoleto1.Cedente.ResponEmissao := tbCliEmite;

    if FrmPrincipal.QEmpresa.FieldByName('TIPO_EMPRESA').AsString = 'PESSOA FÍSICA' then
      ACBrBoleto1.Cedente.TipoInscricao := pFisica
    else if FrmPrincipal.QEmpresa.FieldByName('TIPO_EMPRESA').AsString = 'PESSOA JURÍDICA' then
      ACBrBoleto1.Cedente.TipoInscricao := pJuridica;
  //  else
  //    ACBrBoleto1.Cedente.TipoInscricao := pOutras;  }

    ACBrBoleto1.NomeArqRemessa  := LeIni(Arq_Ini, 'Boleto', 'Nome Arq. Remessa');
    ACBrBoleto1.DirArqRemessa   := LeIni(Arq_Ini, 'Boleto', 'Dir. Arq. Remessa');
    ACBrBoleto1.NomeArqRetorno  := LeIni(Arq_Ini, 'Boleto', 'Nome Arq. Retorno');
    ACBrBoleto1.DirArqRetorno   := LeIni(Arq_Ini, 'Boleto', 'Dir. Arq. Retorno');
    ACBrBoleto1.NumeroArquivo   := 1;
    ACBrBoleto1.DataArquivo     := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
    ACBrBoleto1.DataCreditoLanc := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;


     ACBrBoleto1.ListadeBoletos.Clear;

     ACBrBoleto1.NomeArqRetorno        := ExtractFileName(OpenDialog1.FileName);
    // ACBrBoleto1.DirArqRetorno         := LeIni(Arq_Ini, 'Boleto', 'Dir. Arq. Retorno');

     ACBrBoleto1.LerRetorno;

     texto := TMemo.Create(FrmPrincipal);
     texto.Parent := FrmPrincipal;

      for x := 0 to ACBrBoleto1.ListadeBoletos.Count-1 do
      begin
        if ACBrBoleto1.ListadeBoletos.Objects[x].ValorRecebido > 0 then
        begin

           texto.Lines.Add(PChar(ACBrBoleto1.ListadeBoletos.Objects[x].Sacado.NomeSacado));
           texto.Lines.Add(ACBrBoleto1.ListadeBoletos.Objects[x].NumeroDocumento);
           texto.Lines.Add(ACBrBoleto1.ListadeBoletos.Objects[x].NossoNumero);
           texto.Lines.Add(ACBrBoleto1.ListadeBoletos.Objects[x].EspecieDoc);
           texto.Lines.Add(DateToStr(AcBrBoleto1.ListadeBoletos.Objects[x].Vencimento));
           texto.Lines.Add(FloatToStr(ACBrBoleto1.ListadeBoletos.Objects[x].ValorDocumento));
           texto.Lines.Add(FloatToStr(ACBrBoleto1.ListadeBoletos.Objects[x].ValorMoraJuros));
           texto.Lines.Add(FloatToStr(ACBrBoleto1.ListadeBoletos.Objects[x].ValorRecebido));
           texto.Lines.Add(DateToStr(ACBrBoleto1.ListadeBoletos.Objects[x].DataBaixa));
           texto.Lines.Add(ACBrBoleto1.ListadeBoletos.Objects[x].OcorrenciaOriginal.CodigoBanco);
           texto.Lines.Add(DateToStr(ACBrBoleto1.ListadeBoletos.Objects[x].DataOcorrencia));
           texto.Lines.Add(ACBrBoleto1.ListadeBoletos.Objects[x].OcorrenciaOriginal.Descricao);
        end;

      end;
  end;

end;

procedure TFrmCarne_rdp.btnBancoClick(Sender: TObject);
begin
  try
    Banco.Value := GetConsulta('BANCOS', 0, 0, StrToInt(Banco.Text));
  except
    Banco.Value := GetConsulta('BANCOS', 0, 0, 0);
  end;
end;

procedure TFrmCarne_rdp.btnClienteClick(Sender: TObject);
begin
  try
    Cliente.Value := GetConsulta('CLIENTES', 0, 0, StrToInt(Cliente.Text));
  except
    Cliente.Value := GetConsulta('CLIENTES', 0, 0, 0);
  end;
end;

procedure TFrmCarne_rdp.btnExecutaClick(Sender: TObject);
var
Lin, Col, Tam, Larg, Alt: Integer;
Device: array[0..255] of char;
Driver: array[0..255] of char;
Port: array[0..255] of char;
hDMode: THandle;
PDMode: PDEVMODE;
Conta : Integer;
begin
// 307, 327
  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    DetailSearch('');

          if Iquery.IsEmpty then
          begin
            Application.MessageBox('Nenhuma venda encontrada. Cliente sem parcelas pendentes.', '', MB_OK +
              MB_ICONQUESTION);

              if Cliente.CanFocus then
                 Cliente.SetFocus;

              Abort;
          end;


    if Validacao then
    begin

      Dtmen.Color       := clWindow;
      Dtmai.Color       := clWindow;
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
      QRel.Sql.Add('(TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :CONDUTA) AND (TRANSACOES.DEPTO = :DEPTO OR DEPTO = :DEPTO_DOIS)');
      QRel.Sql.Add('AND (TRANSACOES.COND_PAGTO = :COND_PAGTO)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');



      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID = :TRANSACAO_ID)');
      QRel.ParamByName('TRANSACAO_ID').AsInteger := Iquery.FieldByName('TRANSACAO_ID').AsInteger;


      if Cliente.Value > 0 then
      begin
        QRel.Sql.Add('AND (TRANSACOES.CLIENTE_ID = :CLIENTE_ID)');
        QRel.ParamByName('CLIENTE_ID').AsInteger := StrToInt(Cliente.Text);
      end;


      QRel.Sql.Add('AND (TRANSPARCELAS.VALOR > 0)');
      QRel.Sql.Add('AND (TRANSPARCELAS.BANCO_ID = 0)');
      QRel.Sql.Add('AND (TRANSPARCELAS.TIPO_TRANSACAO = :TIPO_TRANSACAO)');
      QRel.Sql.Add('AND ((TRANSPARCELAS.AGRUPAMENTO = 0) OR (TRANSPARCELAS.AGRUPAMENTO IS NULL))');


      QRel.Sql.Add('ORDER BY TRANSPARCELAS.DT_VENCIMENTO, CLIENTES.NOME');

      QRel.ParamByName('TIPO_TRANSACAO').AsString := 'T';
      QRel.ParamByName('DEPTO').AsString := '07';
      QRel.ParamByName('DEPTO_DOIS').AsString := '03';
      QRel.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
      QRel.ParamByName('CONDUTA').AsString        := '01';
      QRel.ParamByName('COND_PAGTO').AsString     := 'A PRAZO';
      QRel.ParamByName('TPCTB').AsString          := FrmData.QAcesso.FieldByName('TPCTB').AsString;


      QRel.Prepare;
      QRel.Open;

      if QRel.IsEmpty then
         Application.MessageBox('Não há dados para os parâmetros informados', PChar(Msg_Title), mb_IconInformation)
      else
      begin

         RDprint1.TamanhoQteColunas       := 85;
         RDprint1.TamanhoQteLinhas        := 22;
         RDprint1.OpcoesPreview.Preview   := True;
         RDprint1.MostrarProgresso        := True;
         RDprint1.Acentuacao              := SemAcento;
         RDprint1.TamanhoQteLinhas        := 1;

         RDprint1.Margens.Top       :=   StrToInt(LeIni(Arq_Ini, 'Carnê', 'Margem Superior'));
         RDprint1.Margens.Bottom    :=   StrToInt(LeIni(Arq_Ini, 'Carnê', 'Margem Inferior'));
         RDprint1.Margens.Left      :=   StrToInt(LeIni(Arq_Ini, 'Carnê', 'Margem Esquerda'));
         RDprint1.Margens.Right     :=   StrToInt(LeIni(Arq_Ini, 'Carnê', 'Margem Direita'));


         RDprint1.Abrir;
         Pagina  := 1;
         Linha := 1;


         while not QRel.Eof do
         Begin

            Linha := Linha + 5;
            RDprint1.ImpF(Linha + StrToInt(LeIni(Arq_Ini, 'Carnê', 'Linha Código do Cliente')), 03 + StrToInt(LeIni(Arq_Ini, 'Carnê', 'Coluna Código do Cliente')), QRel.FieldByName('CLIENTE_ID').AsString, [negrito]);
            RDprint1.ImpF(Linha + StrToInt(LeIni(Arq_Ini, 'Carnê', 'Linha Nome do Cliente')), 16 + StrToInt(LeIni(Arq_Ini, 'Carnê', 'Coluna Nome do Cliente')), Copy(QRel.FieldByName('NOME').AsString, 1, 32), [negrito]);

            Linha := Linha + 4;
            RDprint1.ImpF(Linha + StrToInt(LeIni(Arq_Ini, 'Carnê', 'Linha Carnê')), 03 + StrToInt(LeIni(Arq_Ini, 'Carnê', 'Coluna Carnê')), QRel.FieldByName('NUM_DOC').AsString, [negrito]);
            RDprint1.ImpF(Linha + StrToInt(LeIni(Arq_Ini, 'Carnê', 'Linha Parcela Número')), 12 + StrToInt(LeIni(Arq_Ini, 'Carnê', 'Coluna Parcela Número')), QRel.FieldByName('PARCELA_ID').AsString, [negrito]);
            RDprint1.ImpF(Linha + StrToInt(LeIni(Arq_Ini, 'Carnê', 'Linha Data de Vencimento')) , 20 + StrToInt(LeIni(Arq_Ini, 'Carnê', 'Coluna Data de Vencimento')), QRel.FieldByName('DT_VENCIMENTO').AsString, [negrito]);
            RDprint1.ImpVal(Linha + StrToInt(LeIni(Arq_Ini, 'Carnê', 'Linha Valor Parcela')), 34 + StrToInt(LeIni(Arq_Ini, 'Carnê', 'Coluna Valor Parcela')), ',###,##0.00', QRel.FieldByName('VR_PARCELA').AsFloat, [negrito]);

            Linha := Linha + 4;
            RDprint1.ImpF(Linha + StrToInt(LeIni(Arq_Ini, 'Carnê', 'Linha Data Emissão')), 21 + StrToInt(LeIni(Arq_Ini, 'Carnê', 'Coluna Data Emissão')), DateToStr(QRel.FieldByName('DT_TRANS').AsDateTime), [negrito]);
            RDprint1.ImpVal(Linha + StrToInt(LeIni(Arq_Ini, 'Carnê', 'Linha Valor Parcela')), 34 + StrToInt(LeIni(Arq_Ini, 'Carnê', 'Coluna Valor Parcela')), ',###,##0.00', QRel.FieldByName('VR_PARCELA').AsFloat, [negrito]);

            //CANHOTO
            RDprint1.ImpF( 5 + StrToInt(LeIni(Arq_Ini, 'Carnê', 'Linha Canhoto Cód. Cliente')),  69 + StrToInt(LeIni(Arq_Ini, 'Carnê', 'Coluna Canhoto Cód. Cliente')), QRel.FieldByName('CLIENTE_ID').AsString, [negrito]);
            RDprint1.ImpF( 7 + StrToInt(LeIni(Arq_Ini, 'Carnê', 'Linha Canhoto Cód. Cliente 2')),  69 + StrToInt(LeIni(Arq_Ini, 'Carnê', 'Coluna Canhoto Cód. Cliente 2')), QRel.FieldByName('CLIENTE_ID').AsString, [negrito]);
            RDprint1.ImpF( 9 + StrToInt(LeIni(Arq_Ini, 'Carnê', 'Linha Canhoto Parcela Número')),  69 + StrToInt(LeIni(Arq_Ini, 'Carnê', 'Coluna Canhoto Parcela Número')), QRel.FieldByName('PARCELA_ID').AsString, [negrito]);
            RDprint1.ImpF( 11 + StrToInt(LeIni(Arq_Ini, 'Carnê', 'Linha Canhoto Dt. Vencimento')), 69 + StrToInt(LeIni(Arq_Ini, 'Carnê', 'Coluna Canhoto Dt. Vencimento')), QRel.FieldByName('DT_VENCIMENTO').AsString, [negrito]);
            RDprint1.ImpVal( 13 + StrToInt(LeIni(Arq_Ini, 'Carnê', 'Linha Canhoto Vr. Parcela')), 66 + StrToInt(LeIni(Arq_Ini, 'Carnê', 'Coluna Canhoto Vr. Parcela')), ',###,##0.00', QRel.FieldByName('VR_PARCELA').AsFloat, [negrito]);
            RDprint1.ImpVal( 15 + StrToInt(LeIni(Arq_Ini, 'Carnê', 'Linha Canhoto Vr. Pago')), 66 + StrToInt(LeIni(Arq_Ini, 'Carnê', 'Coluna Canhoto Vr. Pago')), ',###,##0.00', QRel.FieldByName('VR_PARCELA').AsFloat, [negrito]);


           Pagina := Pagina + 1;
           RDprint1.Novapagina;
           QRel.Next;
         End;                              

        RDprint1.OpcoesPreview.Preview := True;
        Application.ProcessMessages;
        RDprint1.TamanhoQteLinhas:= 22;
        RDprint1.Fechar;

      end;

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

procedure TFrmCarne_rdp.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCarne_rdp.ClienteExit(Sender: TObject);
begin
  DetailSearch('Cliente');

      if(StrToInt(Cliente.text) > 0) then
      begin
          Iquery.Close;
          Iquery.SQL.Clear;
          IQuery.SQL.Add('SELECT TRANSACOES.TRANSACAO_ID, TRANSACOES.DT_TRANS, TRANSACOES.NUM_DOC, TRANSACOES.COND_PAGTO FROM TRANSACOES');
          IQuery.SQL.Add('INNER JOIN CLIENTES');
          IQuery.SQL.Add('ON (TRANSACOES.CLIENTE_ID = CLIENTES.CLIENTE_ID)');
          IQuery.SQL.Add('WHERE');
          IQuery.SQL.Add('(TRANSACOES.EMPRESA_ID  =:EMPRESA_ID)');
          IQuery.SQL.Add('AND (TRANSACOES.CONDUTA = :CONDUTA) AND (TRANSACOES.DEPTO = :DEPTO OR DEPTO = :DEPTO_DOIS)');
          IQuery.SQL.Add('AND (TRANSACOES.COND_PAGTO = :COND_PAGTO)');
          IQuery.SQL.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
          IQuery.SQL.Add('AND (TRANSACOES.CLIENTE_ID = :CLIENTE_ID)');
          IQuery.SQL.Add('AND (TRANSACOES.DT_ENT_SAI BETWEEN :DT_INICIAL AND :DT_FINAL)');
          IQuery.SQL.Add('ORDER BY TRANSACOES.DT_TRANS');

          Iquery.ParamByName('EMPRESA_ID').AsInteger      := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
          Iquery.ParamByName('CONDUTA').AsString          := '01';
          Iquery.ParamByName('COND_PAGTO').AsString       := 'A PRAZO';
          Iquery.ParamByName('TPCTB').AsString            := FrmData.QAcesso.FieldByName('TPCTB').AsString;
          Iquery.ParamByName('CLIENTE_ID').AsInteger      := StrToInt(Cliente.text);
          Iquery.ParamByName('DEPTO').AsString            := '07';
          Iquery.ParamByName('DEPTO_DOIS').AsString       := '03';
          Iquery.ParamByName('DT_INICIAL').AsDateTime     := Dtmen.Date;
          Iquery.ParamByName('DT_FINAL').AsDateTime       := Dtmai.Date;

          Iquery.Prepare;
          Iquery.Open;

      end;

end;

procedure TFrmCarne_rdp.ClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = Cliente) then
    btnClienteClick(Self);

  //if (Key = Vk_F7) and (Sender = Venda_ID) then
   // btnVendasClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmCarne_rdp.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmCarne_rdp.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
 //   Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmCarne_rdp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmCarne_rdp.FormCreate(Sender: TObject);
begin
  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);
end;

procedure TFrmCarne_rdp.QRBand1BeforePrint(Sender: TQRCustomBand;
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

procedure TFrmCarne_rdp.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLabel144.Caption  := 'Desconto de R$ ' + FormatFloat('#,##0.00', QRel.FieldByName('VALOR_DESCONTO').AsFloat) +
                        ' sobre R$ ' + FormatFloat('#,##0.00', QRel.FieldByName('VR_PARCELA').AsFloat) +
                        ' até ' + QRel.FieldByName('DT_DESCONTO').AsString;
  QRLabel154.Caption := 'A importãncia desta Duplicata de Locação, conforme discriminado ' +
                        'na importância acima, que pagaremos à ' + FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString + ', ou à sua ordem, na praça e ' +
                        'vencimento indicados. Não sendo paga no dia do vencimento, cobrar ' +
                        'juros de mora e despesas financeiras. Não conceder descontos mesmo ' +
                        'condicionalmente.';
  QRLabel155.Caption := Extenso(QRel.FieldByName('VR_PARCELA').AsFloat);

end;

procedure TFrmCarne_rdp.RDprint1NewPage(Sender: TObject; Pagina: Integer);
begin
   Linha := 1;
end;

end.
