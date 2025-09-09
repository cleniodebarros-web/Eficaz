unit UExtrato_Comissao_Orcamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBTables, DB, IBCustomDataSet, IBQuery, Buttons, ExtCtrls,
  rxCurrEdit, Mask, rxToolEdit, QRCtrls, QuickRpt, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmExtrato_Comissao_Orcamento = class(TForm)
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
    Label3: TLabel;
    Comissao: TCurrencyEdit;
    Extrato_Comissao: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    QRSysData1: TQRSysData;
    Cabec: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape2: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRGroup1: TQRGroup;
    QRDBText3: TQRDBText;
    QRBand1: TQRBand;
    QRShape3: TQRShape;
    QRShape5: TQRShape;
    QRBand2: TQRBand;
    QRShape4: TQRShape;
    QRShape6: TQRShape;
    QRExpr5: TQRExpr;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    Label4: TLabel;
    Tipo_Orcamento: TComboBox;
    QExterno: TFDQuery;
    QVendedor: TFDQuery;
    QREl: TFDQuery;
    Relat: TFDMemTable;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
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
  FrmExtrato_Comissao_Orcamento: TFrmExtrato_Comissao_Orcamento;

implementation

uses
  UPrincipal, UData, UConsulta;

{$R *.dfm}

procedure TFrmExtrato_Comissao_Orcamento.btnExecutaClick(Sender: TObject);
var
Vl_Venda, Per_Com, Per_Acr: Double;
Temp_Name: String;
begin
// 151, 327
  try
    with Relat do
    begin

      Temp_Name    := Copy(TimeToStr(time), 1, 2) + Copy(TimeToStr(time), 4, 2) + Copy(TimeToStr(time), 7, 2);


      with FieldDefs do
      begin
        Clear;
        Add('CODIGO', ftAutoInc, 0, False);
        Add('NOME', ftString, 40, False);
        Add('DATA', ftDate, 0, False);
        Add('NUM_DOC', ftString, 6, False);
        Add('HISTORICO', ftString, 40, False);
        Add('VR_VENDA', ftFloat, 0, False);
        Add('PERCENT', ftFloat, 0, False);
        Add('VR_COMISSAO', ftFloat, 0, False);
      end;

      with IndexDefs do
      begin
        Clear;
        Add('', 'CODIGO', [ixPrimary, ixUnique]);
        Add('TEMP', 'NOME;DATA', [ixCaseInsensitive]);
      end;
      IndexName := 'TEMP';
      Open;
    end;

    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT ORCAMENTOS.*, FUNCIONARIOS.NOME VENDEDOR');
    QRel.Sql.Add('FROM ORCAMENTOS');
    QRel.Sql.Add('INNER JOIN FUNCIONARIOS');
    QRel.Sql.Add('ON (FUNCIONARIOS.FUNCIONARIO_ID = ORCAMENTOS.VENDEDOR_ID)');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(ORCAMENTOS.EMPRESA_ID = :EMPRESA_ID)');
    QRel.Sql.Add('AND (ORCAMENTOS.DT_ORCAMENTO BETWEEN :DT_INICIAL AND :DT_FINAL)');
    QRel.Sql.Add('AND (ORCAMENTOS.COMANDA IS NULL)');

    if Vendedor.Value > 0 then
    begin
      QRel.Sql.Add('AND (ORCAMENTOS.VENDEDOR_ID = :VENDEDOR_ID)');
      QRel.ParamByName('VENDEDOR_ID').AsInteger := StrToInt(Vendedor.Text);
    end
    else
      QRel.Sql.Add('AND (ORCAMENTOS.VENDEDOR_ID > 0)');

    if Tipo_Orcamento.Text = 'Orc. Agrupados' then
      QRel.Sql.Add('AND (ORCAMENTOS.TRANSACAO_ID > 0)');

    if Tipo_Orcamento.Text = 'Orc. n/ Agrupados' then
      QRel.Sql.Add('AND ((ORCAMENTOS.TRANSACAO_ID = 0) OR (ORCAMENTOS.TRANSACAO_ID IS NULL))');

    QRel.Sql.Add('ORDER BY FUNCIONARIOS.NOME, ORCAMENTOS.DT_ORCAMENTO');

    QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;

    QRel.Prepare;
    QRel.Open;

    QRel.First;
    while not QRel.Eof do
    begin
      if Comissao.Value = 0 then
        Per_Com := QRel.FieldByName('COMISSAO').AsFloat
      else
        Per_Com := Comissao.Value;

      Vl_Venda := QRel.FieldByName('VALOR').AsFloat - QRel.FieldByName('VR_ACRESCIMO').AsFloat;

      if (Vl_Venda * Per_Com) <> 0 then
      begin
        Relat.Append;
        Relat.FieldByName('NOME').AsString       := QRel.FieldByName('VENDEDOR').AsString;
        Relat.FieldByName('DATA').AsString       := QRel.FieldByName('DT_ORCAMENTO').AsString;
        Relat.FieldByName('NUM_DOC').AsString    := StrZero(QRel.FieldByName('ORCAMENTO_ID').AsString, 6, 0);
        Relat.FieldByName('HISTORICO').AsString  := QRel.FieldByName('NOME').AsString;
        Relat.FieldByName('VR_VENDA').AsFloat    := Vl_Venda;
        Relat.FieldByName('PERCENT').AsFloat     := Per_Com;
        Relat.FieldByName('VR_COMISSAO').AsFloat := ((Relat.FieldByName('VR_VENDA').AsFloat * Relat.FieldByName('PERCENT').AsFloat) / 100);
        Relat.Post;
      end;

      Application.ProcessMessages;
      QRel.Next;
    end;       

    QRLabel13.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;

    if Relat.IsEmpty then
      Application.MessageBox('Não há dados para serem impressos', PChar(Msg_Title), mb_IconInformation)
    else
      Extrato_Comissao.PreviewModal;
  finally
    Relat.IndexName := '';
    Relat.Close;

  end;
end;

procedure TFrmExtrato_Comissao_Orcamento.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmExtrato_Comissao_Orcamento.btnVendedorClick(Sender: TObject);
begin
  try
    Vendedor.Value := GetConsulta('PESSOAL', 0, 0, StrToInt(Vendedor.Text));
  except
    Vendedor.Value := GetConsulta('PESSOAL', 0, 0, 0);
  end;
end;

procedure TFrmExtrato_Comissao_Orcamento.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmExtrato_Comissao_Orcamento.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    //Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmExtrato_Comissao_Orcamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmExtrato_Comissao_Orcamento.FormCreate(Sender: TObject);
begin
  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);
end;

procedure TFrmExtrato_Comissao_Orcamento.VendedorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = Vendedor) then
    btnVendedorClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

end.
