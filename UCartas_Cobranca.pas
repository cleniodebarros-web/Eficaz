unit UCartas_Cobranca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, rxCurrEdit, Mask, rxToolEdit, Buttons, DB,
  IBCustomDataSet, IBQuery, QRCtrls, QuickRpt, DBCtrls, Math, RDprint,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmCartas_Cobranca = class(TForm)
    Label1: TLabel;
    Dtmen: TDateEdit;
    Dtmai: TDateEdit;
    Label3: TLabel;
    Modelo_Carta: TComboBox;
    Label2: TLabel;
    Cliente: TCurrencyEdit;
    Label5: TLabel;
    Bevel1: TBevel;
    Classe: TEdit;
    btnCliente: TSpeedButton;
    DBText2: TDBText;
    Carta: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel10: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText4: TQRDBText;
    QRRichText1: TQRRichText;
    QRShape1: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape2: TQRShape;
    QRLabel9: TQRLabel;
    QRBand1: TQRBand;
    QRRichText2: TQRRichText;
    QRShape3: TQRShape;
    QRDBText10: TQRDBText;
    QRShape4: TQRShape;
    QRExpr1: TQRExpr;
    QRLabel8: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText11: TQRDBText;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    QRDBText12: TQRDBText;
    QRExpr3: TQRExpr;
    Imprimir_Etiquetas: TCheckBox;
    RDprint2: TRDprint;
    QRel: TFDQuery;
    QCliente: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRetornaClick(Sender: TObject);
    procedure btnClienteClick(Sender: TObject);
    procedure ClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnExecutaClick(Sender: TObject);
    procedure ClienteExit(Sender: TObject);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRBand1AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure CartaBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup1AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure DtmenEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Validacao: Boolean;
    procedure DetailSearch(Tabela: String);
  end;

var
  FrmCartas_Cobranca: TFrmCartas_Cobranca;
  TT: Real;
  PG: Integer;

implementation

uses
  UConsulta, UPrincipal, UData;

{$R *.dfm}

function TFrmCartas_Cobranca.Validacao: Boolean;
begin
  Result := False;
  
  Dtmen.Color        := clWindow;
  Dtmai.Color        := clWindow;
  Modelo_Carta.Color := clWindow;
  Cliente.Color      := clWindow;

  if Dtmai.Date < Dtmen.Date then
  begin
    Application.MessageBox('Data final inválida', PChar(Msg_Title), mb_IconStop);
    Dtmai.Color := clYellow;
    Dtmai.SetFocus;
    exit;
  end;

  if Modelo_Carta.Text = '' then
  begin
    Application.MessageBox('Informe o Tipo de Boleto', PChar(Msg_Title), mb_IconStop);
    Modelo_Carta.Color := clYellow;
    Modelo_Carta.SetFocus;
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

  Result := True;
end;

procedure TFrmCartas_Cobranca.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
Dif, Correc: Real;
begin
  if (FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime > QRel.FieldByName('DT_VENCIMENTO').AsDateTime) and (FrmPrincipal.Config.FieldByName('JUROS_MENSAL').AsFloat > 0) then
  begin
    Dif    := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime - QRel.FieldByName('DT_VENCIMENTO').AsDateTime;
    Correc := ((((QRel.FieldByName('VR_PARCELA').AsFloat * FrmPrincipal.Config.FieldByName('JUROS_MENSAL').AsFloat) / 100) / 30) * Dif);
    Correc := RoundTo(Correc, -2);
    TT     := TT + QRel.FieldByName('VR_PARCELA').AsFloat + Correc;

    QRLabel10.Caption := FormatFloat('#,##0.00', (Correc + QRel.FieldByName('VR_PARCELA').AsFloat));
    QRLabel10.Enabled := True;
  end
  else
    QRLabel10.Enabled := False;
end;

procedure TFrmCartas_Cobranca.DetailSearch(Tabela: String);
begin
  if ((Tabela = '') or (Tabela = 'Cliente')) and (Cliente.Text <> '') then
  begin
    QCliente.Close;
    QCliente.ParamByName('CLIENTE_ID').AsInteger := StrToInt(Cliente.Text);
    QCliente.Prepare;
    QCliente.Open;
  end;
end;

procedure TFrmCartas_Cobranca.btnClienteClick(Sender: TObject);
begin
  try
    Cliente.Value := GetConsulta('CLIENTES', 0, 0, StrToInt(Cliente.Text));
  except
    Cliente.Value := GetConsulta('CLIENTES', 0, 0, 0);
  end;
end;

procedure TFrmCartas_Cobranca.btnExecutaClick(Sender: TObject);
var
Linha: Integer;
begin
// 200, 327
  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    DetailSearch('');

    if Validacao then
    begin

      Dtmen.Color        := clWindow;
      Dtmai.Color        := clWindow;
      Modelo_Carta.Color := clWindow;
      Cliente.Color      := clWindow;

      QRel.Sql.Clear;
      QRel.Sql.Add('SELECT CLIENTES.NOME, CLIENTES.ENDERECO, CLIENTES.NUMERO, CLIENTES.MUNICIPIO, CLIENTES.CNPJ, ' +
                   'CLIENTES.BAIRRO, CLIENTES.CEP, CLIENTES.ESTADO, CLIENTES.TELEFONE_1, CLIENTES.CLIENTE_ID, ' +
                   'CLIENTES.INSCRICAO, TRANSACOES.DT_TRANS, TRANSACOES.NUM_DOC, TRANSACOES.VALOR, TRANSPARCELAS.ESPECIE, ' +
                   'TRANSPARCELAS.DT_VENCIMENTO, TRANSPARCELAS.VALOR AS VR_PARCELA, TRANSPARCELAS.DUPLICATA, TRANSPARCELAS.PARCELA_ID');
      QRel.Sql.Add('FROM TRANSPARCELAS');
      QRel.Sql.Add('INNER JOIN TRANSACOES');
      QRel.Sql.Add('ON (TRANSPARCELAS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
      QRel.Sql.Add('INNER JOIN CLIENTES');
      QRel.Sql.Add('ON (TRANSACOES.CLIENTE_ID = CLIENTES.CLIENTE_ID)');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :CONDUTA)');
      QRel.Sql.Add('AND (TRANSACOES.COND_PAGTO = :COND_PAGTO)');
      QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');

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

      QRel.Sql.Add('ORDER BY CLIENTES.NOME, TRANSPARCELAS.DT_VENCIMENTO');

      QRel.ParamByName('TIPO_TRANSACAO').AsString := 'T';
      QRel.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
      QRel.ParamByName('CONDUTA').AsString        := '01';
      QRel.ParamByName('COND_PAGTO').AsString     := 'A PRAZO';
      QRel.ParamByName('TPCTB').AsString          := FrmData.QAcesso.FieldByName('TPCTB').AsString;
      QRel.ParamByName('DT_INICIAL').AsDateTime   := Dtmen.Date;
      QRel.ParamByName('DT_FINAL').AsDateTime     := Dtmai.Date;

      QRel.Prepare;
      QRel.Open;

      QRRichText1.Lines.Clear;
      QRRichText2.Lines.Clear;

      if Modelo_Carta.Text = 'Carta de Cobrança Suave' then
      begin
        QRRichText1.Lines.Add('                              Prezado Cliente,');
        QRRichText1.Lines.Add('');
        QRRichText1.Lines.Add('');
        QRRichText1.Lines.Add('');
        QRRichText1.Lines.Add('                              Consultamos nossos ' +
                              'arquivos e verificamos  que  não consta em nossos ' +
                              'controles o pagamento da(s) fatura(s) abaixo relacionada(s):');

        QRRichText2.Lines.Add('                              Entre em contato conosco ' +
                              'para que possamos solucionar essa(s) pendência(s). Caso já ' +
                              'tenha efetuado o pagamento, favor desconsiderar este aviso.');
        QRRichText2.Lines.Add('');
        QRRichText2.Lines.Add('');
        QRRichText2.Lines.Add('');
        QRRichText2.Lines.Add('                              Atenciosamente,');
      end
      else if Modelo_Carta.Text = 'Carta de Cobrança (1º Aviso)' then
      begin
        QRRichText1.Lines.Add('                              Prezado Cliente,');
        QRRichText1.Lines.Add('');
        QRRichText1.Lines.Add('');
        QRRichText1.Lines.Add('');
        QRRichText1.Lines.Add('                              Nosso controle de cobrança ' +
                              'acusa, em sua conta, prestação(ões) vencida(s) há mais de 10 dias, ' +
                              'motivo pelo qual pedimos a V. Sa. sua imediata regularização.');

        QRRichText2.Lines.Add('                              Tendo em vista que a emissão deste ' +
                              'aviso é automática, por computador, caso V. Sa. já tenha quitado ' +
                              'até a data da entrega do mesmo, solicitamos inutilizá-lo.');
        QRRichText2.Lines.Add('');
        QRRichText2.Lines.Add('');
        QRRichText2.Lines.Add('');
        QRRichText2.Lines.Add('                              Atenciosamente,');
      end
      else if Modelo_Carta.Text = 'Carta de Cobrança (2º Aviso)' then
      begin
        QRRichText1.Lines.Add('                              Prezado Cliente,');
        QRRichText1.Lines.Add('');
        QRRichText1.Lines.Add('');
        QRRichText1.Lines.Add('');
        QRRichText1.Lines.Add('                              Nosso controle de cobrança ' +
                              'continua acusando, em sua conta, prestação(ões) vencida(s) ' +
                              'há mais de 25 dias, apesar de nosso lembrete anteriormente enviado.');

        QRRichText2.Lines.Add('                              Pedimos a V. Sa. que regularize urgentemente ' +
                              'essa situação; caso contrário, seremos obrigados a encaminhar o assunto ao nosso ' +
                              'Departamento Jurídico.');
        QRRichText2.Lines.Add('');
        QRRichText2.Lines.Add('');
        QRRichText2.Lines.Add('');
        QRRichText2.Lines.Add('                              Atenciosamente,');
      end
      else if Modelo_Carta.Text = 'Carta de Cobrança (3º Aviso)' then
      begin
        QRRichText1.Lines.Add('                              Prezado Cliente,');
        QRRichText1.Lines.Add('');
        QRRichText1.Lines.Add('');
        QRRichText1.Lines.Add('');
        QRRichText1.Lines.Add('                              Solicitamos o seu comparecimento em até 2 dias após ' +
                              'o recebimento deste em nosso escritório, a fim de efetuar o pagamento da(s) Duplicata(s), ' +
                              'de seu aceite, abaixo relacionada(s).');

        QRRichText2.Lines.Add('                              O seu não comparecimento nos obrigará a tomar medidas judiciais.');
        QRRichText2.Lines.Add('');
        QRRichText2.Lines.Add('');
        QRRichText2.Lines.Add('');
        QRRichText2.Lines.Add('                              Atenciosamente,');
      end
      else if Modelo_Carta.Text = 'Carta de Cobrança (4º Aviso)' then
      begin
        QRRichText1.Lines.Add('                              Prezado Cliente,');
        QRRichText1.Lines.Add('');
        QRRichText1.Lines.Add('');
        QRRichText1.Lines.Add('');
        QRRichText1.Lines.Add('                              Tendo em vista que V. Sa. não nos procurou no prazo estipulado em nosso ' +
                              'último aviso, comunicamos que a(s) Duplicata(s) abaixo relacionada(s) está(ão) sendo levada(s) a protesto ' +
                              'e o seu CPF será incluso no cadastro SPC/SERASA.');

        QRRichText2.Lines.Add('                              Esta medida que estamos intentando contra V. Sa., será automaticamente ' +
                              'desfeita tão logo seja efetuada a quitação da(s) referida(s) Duplicatas.');
        QRRichText2.Lines.Add('');
        QRRichText2.Lines.Add('');
        QRRichText2.Lines.Add('');
        QRRichText2.Lines.Add('                              Atenciosamente,');
      end;

      Carta.PreviewModal;

      if Imprimir_Etiquetas.Checked then
      begin
        Linha := 3;

        RDPrint2.Abrir;

        QRel.First;
        while not QRel.Eof do
        begin
          RDPrint2.Impf(Linha + 1, 03, Copy(QRel.FieldByName('NOME').AsString,1,35), [comp12]);
          RDPrint2.Imp(Linha + 2, 03, Copy(QRel.FieldByName('ENDERECO').AsString,1,30) + ',' + QRel.FieldByName('NUMERO').AsString);
          RDPrint2.Imp(Linha + 3, 03, QRel.FieldByName('MUNICIPIO').AsString + ' - ' + QRel.FieldByName('ESTADO').AsString);
          RDPrint2.Imp(Linha + 4, 03, QRel.FieldByName('CEP').AsString);
          RDPrint2.Impf(Linha + 5, 28, 'Código: ' + QRel.FieldByName('CLIENTE_ID').AsString, [comp20]);

          QRel.Next;

          if not QRel.Eof then
          begin
            RDPrint2.Impf(Linha + 1, 43, Copy(QRel.FieldByName('NOME').AsString,1,35), [comp12]);
            RDPrint2.Imp(Linha + 2, 43, Copy(QRel.FieldByName('ENDERECO').AsString,1,30) + ',' + QRel.FieldByName('NUMERO').AsString);
            RDPrint2.Imp(Linha + 3, 43, QRel.FieldByName('MUNICIPIO').AsString + ' - ' + QRel.FieldByName('ESTADO').AsString);
            RDPrint2.Impf(Linha + 4, 43, QRel.FieldByName('CEP').AsString, [negrito]);
            RDPrint2.Impf(Linha + 5, 68, 'Código: ' + QRel.FieldByName('CLIENTE_ID').AsString, [comp20]);

            QRel.Next;
          end;

          Linha := Linha + 6;

          if Linha >= 62 then
          begin
            RDPrint2.Novapagina;
            Linha := 3;
          end;
        end;

        RDPrint2.Fechar;
      end;
    end;
  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;

procedure TFrmCartas_Cobranca.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCartas_Cobranca.CartaBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  TT := 0;
  PG := 1;
end;

procedure TFrmCartas_Cobranca.ClienteExit(Sender: TObject);
begin
  DetailSearch('Cliente');
end;

procedure TFrmCartas_Cobranca.ClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = Cliente) then
    btnClienteClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmCartas_Cobranca.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmCartas_Cobranca.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
   // Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmCartas_Cobranca.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmCartas_Cobranca.FormCreate(Sender: TObject);
begin
  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);

  TT := 0;
  PG := 1;
end;

procedure TFrmCartas_Cobranca.QRBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  TT := 0;
end;

procedure TFrmCartas_Cobranca.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if TT > 0 then
  begin
    QRLabel11.Caption := FormatFloat('#,##0.00', TT);
    QRLabel11.Enabled := True;
  end
  else
    QRLabel11.Enabled := False;
end;

procedure TFrmCartas_Cobranca.QRGroup1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  Inc(PG);
end;

procedure TFrmCartas_Cobranca.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLabel2.Caption := QRel.FieldByName('MUNICIPIO').AsString + ' - ' + QRel.FieldByName('ESTADO').AsString;

  if PG > 1 then
    Carta.NewPage;
end;

end.
