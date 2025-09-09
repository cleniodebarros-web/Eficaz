unit UCartao_Consumo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBTables, DB, IBCustomDataSet, IBQuery, Buttons, ExtCtrls,
  rxCurrEdit, Mask, rxToolEdit, QRCtrls, QuickRpt, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmCartao_Consumo = class(TForm)
    Dtmen: TDateEdit;
    Label1: TLabel;
    Dtmai: TDateEdit;
    Label2: TLabel;
    Vendedor: TCurrencyEdit;
    btnVendedor: TSpeedButton;
    Bevel1: TBevel;
    btnRetorna: TBitBtn;
    DataVendedor: TDataSource;
    btnExecuta: TBitBtn;
    Label4: TLabel;
    Tipo: TComboBox;
    Extrato_Cartao_Analitico: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    QRSysData1: TQRSysData;
    Cabec: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape2: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel9: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText8: TQRDBText;
    QRGroup1: TQRGroup;
    QRDBText3: TQRDBText;
    QRBand1: TQRBand;
    QRShape3: TQRShape;
    QRBand2: TQRBand;
    QRShape4: TQRShape;
    QRExpr1: TQRExpr;
    QRExpr3: TQRExpr;
    Extrato_Cartao_Sintetico: TQuickRep;
    QRBand3: TQRBand;
    QRSysData3: TQRSysData;
    QRLabel1: TQRLabel;
    QRSysData4: TQRSysData;
    QRLabel2: TQRLabel;
    QRShape5: TQRShape;
    QRLabel7: TQRLabel;
    QRShape6: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel12: TQRLabel;
    QRBand4: TQRBand;
    QRDBText7: TQRDBText;
    QRBand6: TQRBand;
    QRShape8: TQRShape;
    QRExpr4: TQRExpr;
    QRDBText11: TQRDBText;
    QRDBText6: TQRDBText;
    QRExpr2: TQRExpr;
    QRShape7: TQRShape;
    Extrato_Cartao_Itens: TQuickRep;
    QRBand5: TQRBand;
    QRSysData5: TQRSysData;
    QRLabel4: TQRLabel;
    QRSysData6: TQRSysData;
    QRLabel14: TQRLabel;
    QRShape9: TQRShape;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape10: TQRShape;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel19: TQRLabel;
    QRBand7: TQRBand;
    QRDBText10: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRGroup2: TQRGroup;
    QRDBText14: TQRDBText;
    QRBand8: TQRBand;
    QRShape11: TQRShape;
    QRExpr5: TQRExpr;
    QRBand9: TQRBand;
    QRShape12: TQRShape;
    QRExpr6: TQRExpr;
    QRLabel20: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel22: TQRLabel;
    QRDBText19: TQRDBText;
    QRel: TFDQuery;
    QVendedor: TFDQuery;
    procedure btnVendedorClick(Sender: TObject);
    procedure VendedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnExecutaClick(Sender: TObject);
    procedure DtmenEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnRetornaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCartao_Consumo: TFrmCartao_Consumo;

implementation

uses
  UPrincipal, UData, UConsulta;

{$R *.dfm}

procedure TFrmCartao_Consumo.btnExecutaClick(Sender: TObject);
var
Vl_Venda, Per_Com, Per_Acr: Double;
begin
// 151, 327
  try
    if Tipo.Text = 'Analítico' then
    begin
      QRel.Sql.Clear;
      QRel.Sql.Add('SELECT FUNCIONARIOS.NOME, ORCAMENTOS.DT_ORCAMENTO, ORCAMENTOS.COMANDA, ORCAMENTOS.VALOR, ORCAMENTOS.CONTATO');
      QRel.Sql.Add('FROM ORCAMENTOS');
      QRel.Sql.Add('LEFT JOIN FUNCIONARIOS');
      QRel.Sql.Add('ON (ORCAMENTOS.VENDEDOR_ID = FUNCIONARIOS.FUNCIONARIO_ID)');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(ORCAMENTOS.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (ORCAMENTOS.DT_ORCAMENTO BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('AND (ORCAMENTOS.COMANDA IS NOT NULL)');

      if Vendedor.Value > 0 then
      begin
        QRel.Sql.Add('AND (ORCAMENTOS.VENDEDOR_ID = :VENDEDOR_ID)');

        QRel.ParamByName('VENDEDOR_ID').AsInteger := StrToInt(Vendedor.Text);
      end
      else
        QRel.Sql.Add('AND (ORCAMENTOS.VENDEDOR_ID >= 0)');

      QRel.Sql.Add('ORDER BY FUNCIONARIOS.NOME, ORCAMENTOS.DT_ORCAMENTO, ORCAMENTOS.CONTATO');

      QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
      QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
      QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;

      QRel.Prepare;
      QRel.Open;

      QRLabel13.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;

      if QRel.IsEmpty then
        Application.MessageBox('Sem dados para imprimir', PChar(Msg_Title), MB_IconStop)
      else
        Extrato_Cartao_Analitico.PreviewModal;
    end
    else if Tipo.Text = 'Sintético' then
    begin
      QRel.Sql.Clear;
      QRel.Sql.Add('SELECT FUNCIONARIOS.NOME, COUNT(*) QUANTIDADE, SUM(ORCAMENTOS.VALOR) VALOR');
      QRel.Sql.Add('FROM ORCAMENTOS');
      QRel.Sql.Add('LEFT JOIN FUNCIONARIOS');
      QRel.Sql.Add('ON (ORCAMENTOS.VENDEDOR_ID = FUNCIONARIOS.FUNCIONARIO_ID)');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(ORCAMENTOS.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (ORCAMENTOS.DT_ORCAMENTO BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('AND (ORCAMENTOS.COMANDA IS NOT NULL)');
      QRel.Sql.Add('GROUP BY FUNCIONARIOS.NOME');

      QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
      QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
      QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;

      QRel.Prepare;
      QRel.Open;

      QRLabel11.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;

      if QRel.IsEmpty then
        Application.MessageBox('Sem dados para imprimir', PChar(Msg_Title), MB_IconStop)
      else
        Extrato_Cartao_Sintetico.PreviewModal;
    end
    else if Tipo.Text = 'Itens' then
    begin
      QRel.Sql.Clear;
      QRel.Sql.Add('SELECT FUNCIONARIOS.NOME, ORCAMENTOS.DT_ORCAMENTO, ORCAMENTOS.COMANDA, ORCITENS.*');
      QRel.Sql.Add('FROM ORCITENS');
      QRel.Sql.Add('INNER JOIN PRODUTOS');
      QRel.Sql.Add('ON (ORCITENS.PRODUTO_ID = PRODUTOS.PRODUTO_ID)');
      QRel.Sql.Add('INNER JOIN ORCAMENTOS');
      QRel.Sql.Add('ON (ORCITENS.ORCAMENTO_ID = ORCAMENTOS.ORCAMENTO_ID)');
      QRel.Sql.Add('INNER JOIN FUNCIONARIOS');
      QRel.Sql.Add('ON (ORCAMENTOS.VENDEDOR_ID = FUNCIONARIOS.FUNCIONARIO_ID)');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(ORCAMENTOS.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (ORCAMENTOS.DT_ORCAMENTO BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('AND (ORCAMENTOS.COMANDA IS NOT NULL)');

      if Vendedor.Value > 0 then
      begin
        QRel.Sql.Add('AND (ORCAMENTOS.VENDEDOR_ID = :VENDEDOR_ID)');

        QRel.ParamByName('VENDEDOR_ID').AsInteger := StrToInt(Vendedor.Text);
      end
      else
        QRel.Sql.Add('AND (ORCAMENTOS.VENDEDOR_ID > 0)');

      QRel.Sql.Add('ORDER BY FUNCIONARIOS.NOME, ORCAMENTOS.DT_ORCAMENTO, ORCAMENTOS.COMANDA');

      QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
      QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
      QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;

      QRel.Prepare;
      QRel.Open;

      QRLabel18.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;

      if QRel.IsEmpty then
        Application.MessageBox('Sem dados para imprimir', PChar(Msg_Title), MB_IconStop)
      else
        Extrato_Cartao_Itens.PreviewModal;
    end;
  finally

  end;
end;

procedure TFrmCartao_Consumo.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCartao_Consumo.btnVendedorClick(Sender: TObject);
begin
  try
    Vendedor.Value := GetConsulta('PESSOAL', 0, 0, StrToInt(Vendedor.Text));
  except
    Vendedor.Value := GetConsulta('PESSOAL', 0, 0, 0);
  end;
end;

procedure TFrmCartao_Consumo.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmCartao_Consumo.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
   // Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmCartao_Consumo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmCartao_Consumo.FormCreate(Sender: TObject);
begin
  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);
end;

procedure TFrmCartao_Consumo.VendedorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = Vendedor) then
    btnVendedorClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

end.
