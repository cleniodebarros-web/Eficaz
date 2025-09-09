unit UVendas_Mensal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, StdCtrls, Buttons, ExtCtrls, DBCtrls,
  rxCurrEdit, Mask, rxToolEdit, QRCtrls, QuickRpt;

type
  TFrmVendas_Mensal = class(TForm)
    Label1: TLabel;
    Dtmen: TDateEdit;
    Dtmai: TDateEdit;
    Label2: TLabel;
    Cliente: TCurrencyEdit;
    btnCliente: TSpeedButton;
    DBText1: TDBText;
    Bevel1: TBevel;
    btnExecuta: TBitBtn;
    btnRetorna: TBitBtn;
    DataCliente: TDataSource;
    QRel: TIBQuery;
    QCliente: TIBQuery;
    Rel_Vendas_Mensal_Analitico: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    QRSysData1: TQRSysData;
    Cabec: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    QRLabel7: TQRLabel;
    QRShape2: TQRShape;
    QRLabel10: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRDBText19: TQRDBText;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    QRDBText3: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRShape3: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape4: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel14: TQRLabel;
    QRBand2: TQRBand;
    QRLabel11: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRShape5: TQRShape;
    QRDBText5: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRShape6: TQRShape;
    QRLabel19: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText18: TQRDBText;
    QRMemo2: TQRMemo;
    QRBand3: TQRBand;
    QRSysData3: TQRSysData;
    QRExpr2: TQRExpr;
    QRLabel31: TQRLabel;
    QItens: TIBQuery;
    QParcelas: TIBQuery;
    QParcelasPARCELA_ID: TIBStringField;
    QParcelasDT_VENCIMENTO: TDateField;
    QParcelasBANCO_ID: TIntegerField;
    QParcelasVALOR: TIBBCDField;
    QParcelasDUPLICATA: TIBStringField;
    QParcelasESPECIE: TIBStringField;
    QVencimento: TIBQuery;
    QRLabel23: TQRLabel;
    QRDBText20: TQRDBText;
    Label3: TLabel;
    Cond_Pagto: TComboBox;
    Rel_Vendas_Mensal_Sintetico: TQuickRep;
    QRBand4: TQRBand;
    QRDBText21: TQRDBText;
    QRSysData4: TQRSysData;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRLabel26: TQRLabel;
    QRSysData5: TQRSysData;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRDBText22: TQRDBText;
    QRLabel39: TQRLabel;
    QRBand5: TQRBand;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    SummaryBand1: TQRBand;
    QRShape9: TQRShape;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRSysData6: TQRSysData;
    Label4: TLabel;
    Tipo_Rel: TComboBox;
    Label5: TLabel;
    Tipo: TComboBox;
    Label6: TLabel;
    Caixa_Banco: TCurrencyEdit;
    btnCaixa_Banco: TSpeedButton;
    QItensPRODUTO_ID: TIntegerField;
    QItensDESCRICAO: TIBStringField;
    QItensQUANTIDADE: TIBBCDField;
    QItensVR_UNITARIO: TIBBCDField;
    QItensVR_DESCONTO: TIBBCDField;
    QItensVR_TOTAL: TIBBCDField;
    Label7: TLabel;
    Ordem: TComboBox;
    Chk_Sintetico: TCheckBox;
    Rel_Vendas_Mensal_Sintetico_Total: TQuickRep;
    QRBand6: TQRBand;
    QRDBText34: TQRDBText;
    QRSysData7: TQRSysData;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRLabel42: TQRLabel;
    QRSysData8: TQRSysData;
    QRLabel44: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRBand7: TQRBand;
    QRDBText37: TQRDBText;
    QRDBText38: TQRDBText;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    QRDBText44: TQRDBText;
    QRDBText45: TQRDBText;
    QRDBText46: TQRDBText;
    QRBand8: TQRBand;
    QRShape12: TQRShape;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRSysData9: TQRSysData;
    QRLabel43: TQRLabel;
    procedure FormCreate(Sender: TObject);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnClienteClick(Sender: TObject);
    procedure btnRetornaClick(Sender: TObject);
    procedure DtmenEnter(Sender: TObject);
    procedure ClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ClienteChange(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure btnCaixa_BancoClick(Sender: TObject);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure TipoChange(Sender: TObject);
    procedure Chk_SinteticoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SearchCliente;
  end;

var
  FrmVendas_Mensal: TFrmVendas_Mensal;

implementation

uses
  UConsulta, UPrincipal, UData;

{$R *.dfm}

procedure TFrmVendas_Mensal.SearchCliente;
begin
  try
    QCliente.Sql.Clear;
    QCliente.Sql.Add('SELECT * FROM CLIENTES');
    QCliente.Sql.Add('WHERE');
    QCliente.Sql.Add('(CLIENTE_ID = :CLIENTE_ID)');
    QCliente.Sql.Add('AND (STATUS = :STATUS)');

    QCliente.ParamByName('CLIENTE_ID').AsInteger := StrToInt(Cliente.Text);
    QCliente.ParamByName('STATUS').AsString      := 'A';

    QCliente.Prepare;
    QCliente.Open;
  except

  end;
end;

procedure TFrmVendas_Mensal.TipoChange(Sender: TObject);
begin
if Tipo.Text = 'Todas as Vendas' then
   Chk_sintetico.Visible := True
   Else
   Begin
   Chk_Sintetico.Visible := False;
   Tipo_rel.Enabled      := True;
   Ordem.Enabled         := True;
   End;
end;

procedure TFrmVendas_Mensal.btnCaixa_BancoClick(Sender: TObject);
begin
  try
    Caixa_Banco.Value := GetConsulta('BANCOS', 0, 0, StrToInt(Caixa_Banco.Text));
  except
    Caixa_Banco.Value := GetConsulta('BANCOS', 0, 0, 0);
  end;
end;

procedure TFrmVendas_Mensal.btnClienteClick(Sender: TObject);
begin
  try
    Cliente.Value := GetConsulta('CLIENTES', 0, 0, StrToInt(Cliente.Text));
  except
    Cliente.Value := GetConsulta('CLIENTES', 0, 0, 0);
  end;
end;

procedure TFrmVendas_Mensal.btnExecutaClick(Sender: TObject);
begin
// 229, 325
  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

   if Chk_Sintetico.Checked then
   Begin
    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT MODELO, SUM(VR_FRETE) VR_FRETE, SUM(VR_IPI) VR_IPI, SUM(VALOR_PRODUTOS) VALOR_PRODUTOS,');
    QRel.Sql.Add('SUM(VR_ACRESCIMO) VR_ACRESCIMO, SUM(VR_DESCONTO) VR_DESCONTO,   SUM(VALOR) VALOR');
    QRel.Sql.Add('FROM TRANSACOES');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(TRANSACOES.DT_ENT_SAI BETWEEN :DT_INICIAL AND :DT_FINAL)');
    QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
    QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
    QRel.Sql.Add('AND (TRANSACAO_ID NOT IN(SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
    QRel.Sql.Add('AND (TRANSACOES.TIPO_VENDA = :TIPO_VENDA)');
   End
   Else
   Begin
    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT TRANSACOES.*, FUNCIONARIOS.NOME, CLIENTES.NOME NOME_CLIENTE');
    QRel.Sql.Add('FROM TRANSACOES');
    QRel.Sql.Add('LEFT JOIN FUNCIONARIOS');
    QRel.Sql.Add('ON (TRANSACOES.VENDEDOR_ID = FUNCIONARIOS.FUNCIONARIO_ID)');
    QRel.Sql.Add('LEFT JOIN CLIENTES');
    QRel.Sql.Add('ON (TRANSACOES.CLIENTE_ID = CLIENTES.CLIENTE_ID)');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(TRANSACOES.DT_ENT_SAI BETWEEN :DT_INICIAL AND :DT_FINAL)');
    QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
    QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
    QRel.Sql.Add('AND (TRANSACAO_ID NOT IN(SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
    QRel.Sql.Add('AND (TRANSACOES.TIPO_VENDA = :TIPO_VENDA)');
   End;

    if Caixa_Banco.Value > 0 then
        QRel.Sql.Add('AND (TRANSACOES.BANCO_ID = :BANCO_ID)');

    if Tipo.Text = 'Todas as Vendas' then
      QRel.Sql.Add('AND (TRANSACOES.BALANCO <> :BALANCO)')

    else if Tipo.Text = 'Cupom Fiscal' then
    begin
      QRel.Sql.Add('AND (TRANSACOES.MODELO = :MODELO)');
      QRel.Sql.Add('AND (TRANSACOES.BALANCO <> :BALANCO)');
    end
    else if Tipo.Text = 'NFe' then
      Begin
      QRel.Sql.Add('AND ((TRANSACOES.MODELO = :MODELO1) OR (TRANSACOES.MODELO = :MODELO2) OR (TRANSACOES.MODELO = :MODELO3) OR (TRANSACOES.MODELO = :MODELO4))');
      QRel.Sql.Add('AND (TRANSACOES.BALANCO <> :BALANCO)');
      End
    else if Tipo.Text = 'Vendas Agrupadas' then
      Begin
        QRel.Sql.Add('AND (TRANSACOES.BALANCO = :BALANCO)');
      End;

    if Cliente.Value > 0  then
      Begin
      QRel.Sql.Add('AND (TRANSACOES.CLIENTE_ID = :CLIENTE_ID)');
      QRel.Sql.Add('AND (TRANSACOES.BALANCO <> :BALANCO)')

      End;

    if (Cond_Pagto.Text <> '') then
    Begin
      QRel.Sql.Add('AND (TRANSACOES.COND_PAGTO = :COND_PAGTO)');
      QRel.Sql.Add('AND (TRANSACOES.BALANCO <> :BALANCO)');

    End;

    QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :CONDUTA)');
    QRel.Sql.Add('AND (TRANSACOES.DEPTO = :DEPTO)');

    if Chk_Sintetico.Checked then
    QRel.Sql.Add('GROUP BY MODELO')
    Else
    Begin
    if (Ordem.Text = 'Data')  Then
    QRel.Sql.Add('ORDER BY TRANSACOES.DT_TRANS')

    Else if Ordem.Text = 'Número Documento' Then
    QRel.Sql.Add('ORDER BY TRANSACOES.NUM_DOC')

    Else if Ordem.Text = 'Cliente' Then
    QRel.Sql.Add('ORDER BY NOME_CLIENTE')

     Else if Ordem.Text = 'Data e Número documento' Then
    QRel.Sql.Add('ORDER BY DT_TRANS, NUM_DOC');
    End;

    QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
    QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;

    if Caixa_Banco.Value > 0 then
        Begin
        QRel.ParamByName('BANCO_ID').AsInteger    := StrToInt(Caixa_Banco.Text);
        QRel.ParamByName('TIPO_VENDA').AsString   := 'VENDA';
        End;


    if Tipo.Text = 'Todas as Vendas' then
    Begin
      QRel.ParamByName('BALANCO').AsString      := 'AGRUPADO';
      QRel.ParamByName('TIPO_VENDA').AsString   := 'VENDA'
    End
    else if Tipo.Text = 'Cupom Fiscal' then
    begin
      QRel.ParamByName('MODELO').AsString       := '2D';
      QRel.ParamByName('BALANCO').AsString      := 'AGRUPADO';
      QRel.ParamByName('TIPO_VENDA').AsString   := 'VENDA';


    end
    else if Tipo.Text = 'NFe' then
    begin
      QRel.ParamByName('MODELO1').AsString      := '01';
      QRel.ParamByName('MODELO2').AsString      := '1B';
      QRel.ParamByName('MODELO3').AsString      := '04';
      QRel.ParamByName('MODELO4').AsString      := '55';
      QRel.ParamByName('BALANCO').AsString      := 'AGRUPADO';
      QRel.ParamByName('TIPO_VENDA').AsString   := 'VENDA';
    end
    Else if Tipo.Text = 'Vendas Agrupadas' then
    Begin
      QRel.ParamByName('BALANCO').AsString      := 'AGRUPADO';
      QRel.ParamByName('TIPO_VENDA').AsString   := 'REMESSA';
    End;

    if Cliente.Value > 0 then
    Begin
      QRel.ParamByName('CLIENTE_ID').AsInteger := StrToInt(Cliente.Text);
      QRel.ParamByName('BALANCO').AsString      := 'AGRUPADO';
      QRel.ParamByName('TIPO_VENDA').AsString   := 'VENDA';
    End;

    if Cond_Pagto.Text <> '' then
    Begin
      QRel.ParamByName('COND_PAGTO').AsString := Cond_Pagto.Text;
      QRel.ParamByName('BALANCO').AsString      := 'AGRUPADO';
      QRel.ParamByName('TIPO_VENDA').AsString   := 'VENDA';
    End;

    QRel.ParamByName('CONDUTA').AsString := '01';
    QRel.ParamByName('DEPTO').AsString   := '07';

    QRel.Prepare;
    QRel.Open;

    QRLabel21.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;
    QRLabel25.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;
    QRLabel41.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;

    if QRel.IsEmpty then
      Application.MessageBox('Não há dados para os parâmetros informados', PChar(Msg_Title), mb_IconInformation)
    else
    begin
      if (Tipo_Rel.Text = 'Analítico') and (not Chk_Sintetico.Checked) then
        Rel_Vendas_Mensal_Analitico.PreviewModal
     else if (Tipo_Rel.Text = 'Sintético')  and (not Chk_Sintetico.Checked) then
        Rel_Vendas_Mensal_Sintetico.PreviewModal;
      if Chk_Sintetico.Checked then
         Rel_Vendas_Mensal_Sintetico_Total.PreviewModal;
    end;
  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;

procedure TFrmVendas_Mensal.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmVendas_Mensal.Chk_SinteticoClick(Sender: TObject);
begin
if chk_sintetico.Checked then
  Begin
  Tipo_rel.Enabled := False;
  Ordem.Enabled    := False;
  End
  Else
  Begin
  Tipo_rel.Enabled := True;
  Ordem.Enabled    := True;
  End;
end;

procedure TFrmVendas_Mensal.ClienteChange(Sender: TObject);
begin
  SearchCliente;
end;

procedure TFrmVendas_Mensal.ClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = Cliente) then
    btnClienteClick(Self);

  if (Key = Vk_F7) and (Sender = Caixa_Banco) then
    btnCaixa_BancoClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmVendas_Mensal.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRMemo2.Lines.Clear;

  QItens.Sql.Clear;
  QItens.Sql.Add('SELECT * FROM TRANSITENS');
  QItens.Sql.Add('WHERE');
  QItens.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

  QItens.ParamByName('TRANSACAO_ID').AsInteger := QRel.FieldByName('TRANSACAO_ID').AsInteger;

  QItens.Prepare;
  QItens.Open;

  if QRel.FieldByName('COND_PAGTO').AsString = 'A PRAZO' then
  begin
    QParcelas.Sql.Clear;
    QParcelas.Sql.Add('SELECT * FROM TRANSPARCELAS');
    QParcelas.Sql.Add('WHERE');
    QParcelas.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
    QParcelas.Sql.Add('AND (TIPO_TRANSACAO = :TIPO_TRANSACAO)');

    QParcelas.ParamByName('TRANSACAO_ID').AsInteger  := QRel.FieldByName('TRANSACAO_ID').AsInteger;
    QParcelas.ParamByName('TIPO_TRANSACAO').AsString := 'T';

    QParcelas.Prepare;
    QParcelas.Open;

    if not QParcelas.IsEmpty then
    begin
      QRMemo2.Lines.Clear;
      QRMemo2.Lines.Add('Parcelamento');
      QRMemo2.Lines.Add('============');

      QParcelas.First;
      while not QParcelas.Eof do
      begin
          QVencimento.Sql.Clear;
          QVencimento.Sql.Add('SELECT * FROM TRANSACOES');
          QVencimento.Sql.Add('WHERE');
          QVencimento.Sql.Add('(SAIDA_ID = :SAIDA_ID)');

          QVencimento.ParamByName('SAIDA_ID').AsInteger := QRel.FieldByName('TRANSACAO_ID').AsInteger;

          QVencimento.Prepare;
          QVencimento.Open;

        if QParcelas.FieldByName('VALOR').AsFloat = 0 then
        begin

          if QVencimento.FieldByName('DT_ENT_SAI').AsDateTime > QParcelas.FieldByName('DT_VENCIMENTO').AsDateTime  then
            QRMemo2.Lines.Add('Venc.: ' + QParcelas.FieldByName('DT_VENCIMENTO').AsString + ' - ' +
                              FormatFloat('#,##0.00', QVencimento.FieldByName('VALOR_PARCELA').AsFloat) + ' Pagto.: ' +
                              QVencimento.FieldByName('DT_ENT_SAI').AsString + ' - ' + FormatFloat('#,##0.00', QVencimento.FieldByName('VALOR').AsFloat) +
                              ' Atr.: ' + FloatToStr((QVencimento.FieldByName('DT_ENT_SAI').AsDateTime - QParcelas.FieldByName('DT_VENCIMENTO').AsDateTime)) + ' dias')
          else
            QRMemo2.Lines.Add('Venc.: ' + QParcelas.FieldByName('DT_VENCIMENTO').AsString + ' - ' +
                              FormatFloat('#,##0.00', QVencimento.FieldByName('VALOR_PARCELA').AsFloat) + ' Pagto.: ' +
                              QVencimento.FieldByName('DT_ENT_SAI').AsString + ' - ' + FormatFloat('#,##0.00', QVencimento.FieldByName('VALOR').AsFloat));
        end
        else
        begin
          if (QParcelas.FieldByName('DT_VENCIMENTO').AsDateTime <= FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime) and (QParcelas.FieldByName('BANCO_ID').AsInteger = 0) then
            QRMemo2.Lines.Add('Venc.: ' + QParcelas.FieldByName('DT_VENCIMENTO').AsString + ' - ' +
                              FormatFloat('#,##0.00', QParcelas.FieldByName('VALOR').AsFloat) +
                              ' Atr.: ' + FloatToStr((FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime - QParcelas.FieldByName('DT_VENCIMENTO').AsDateTime)) + ' dias')

          Else if (QParcelas.FieldByName('DT_VENCIMENTO').AsDateTime = QRel.FieldByName('DT_ENT_SAI').AsDateTime) and (QParcelas.FieldByName('BANCO_ID').AsInteger > 0)  Then
             QRMemo2.Lines.Add('Venc.: ' + QParcelas.FieldByName('DT_VENCIMENTO').AsString + ' - ' +
                              FormatFloat('#,##0.00', QParcelas.FieldByName('VALOR').AsFloat) + ' Pagto.: ' +
                              QVencimento.FieldByName('DT_ENT_SAI').AsString + ' - ' + FormatFloat('#,##0.00', QParcelas.FieldByName('VALOR').AsFloat) +  ' Entrada a Vista. ')

          else
             QRMemo2.Lines.Add('Venc.: ' + QParcelas.FieldByName('DT_VENCIMENTO').AsString + ' - ' + FormatFloat('#,##0.00', QParcelas.FieldByName('VALOR').AsFloat));
        end;

        Application.ProcessMessages;

        QParcelas.Next;
      end;
    end;
  end;
end;

procedure TFrmVendas_Mensal.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmVendas_Mensal.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmVendas_Mensal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmVendas_Mensal.FormCreate(Sender: TObject);
begin
  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);
end;

end.
