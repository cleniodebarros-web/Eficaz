unit UBoleto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ACBrBoleto, ACBrBoletoFCFortesFr, ACBrBase, StdCtrls, ExtCtrls, Mask,
  ACBrUtil, DB, IBCustomDataSet, IBQuery, Buttons, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client ;

type
  TFrmBoleto = class(TForm)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtEspecieDoc: TEdit;
    edtEspecieMod: TEdit;
    cbxAceite: TComboBox;
    edtCarteira: TEdit;
    GroupBox3: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    memMensagem: TMemo;
    edtInstrucoes1: TEdit;
    edtInstrucoes2: TEdit;
    Panel2: TPanel;
    Panel3: TPanel;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    Gerar_HTML: TCheckBox;
    Gerar_PDF: TCheckBox;
    Gerar_Remessa: TCheckBox;
    Imprimir: TCheckBox;
    ACBrBoleto1: TACBrBoleto;
    ACBrBoletoFCFortes1: TACBrBoletoFCFortes;
    QRel: TFDQuery;
    QBanco: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
     AString: Array[0..5] of AnsiString;
  public
    { Public declarations }
  end;

var
  FrmBoleto: TFrmBoleto;

  procedure Boleto_Bancario(Dt_Inicial, Dt_Final: TDate; Cliente: Integer; Classe: String; Banco: Integer);

implementation

uses
  UPrincipal, UData;

{$R *.dfm}

procedure Boleto_Bancario(Dt_Inicial, Dt_Final: TDate; Cliente: Integer; Classe: String; Banco: Integer);
begin
  try
    Application.CreateForm(TFrmBoleto, FrmBoleto);
    FrmBoleto.QBanco.Sql.Clear;
    FrmBoleto.QBanco.Sql.Add('SELECT * FROM BANCOS');
    FrmBoleto.QBanco.Sql.Add('WHERE');
    FrmBoleto.QBanco.Sql.Add('(BANCO_ID = :BANCO_ID)');
    FrmBoleto.QBanco.Sql.Add('AND (EMPRESA_ID = :EMPRESA_ID)');
    FrmBoleto.QBanco.Sql.Add('AND (STATUS = :STATUS)');

    FrmBoleto.QBanco.ParamByName('BANCO_ID').AsInteger   := Banco;
    FrmBoleto.QBanco.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    FrmBoleto.QBanco.ParamByName('STATUS').AsString      := 'A';

    FrmBoleto.QBanco.Prepare;
    FrmBoleto.QBanco.Open;

    FrmBoleto.QRel.Sql.Clear;
    FrmBoleto.QRel.Sql.Add('SELECT CLIENTES.CLIENTE_ID, CLIENTES.NOME, CLIENTES.ENDERECO, CLIENTES.NUMERO, CLIENTES.MUNICIPIO, CLIENTES.CNPJ, ' +
                           'CLIENTES.BAIRRO, CLIENTES.CEP, CLIENTES.ESTADO, CLIENTES.TELEFONE_1, ' +
                           'CLIENTES.INSCRICAO, TRANSACOES.DT_TRANS, TRANSACOES.NUM_DOC, TRANSACOES.VALOR, TRANSACOES.TRANSACAO_ID, ' +
                           'TRANSPARCELAS.DT_VENCIMENTO, TRANSPARCELAS.VALOR AS VR_PARCELA, TRANSPARCELAS.DUPLICATA, TRANSPARCELAS.PARCELA_ID, ' +
                           'TRANSPARCELAS.DT_MULTA_JUROS, TRANSPARCELAS.DT_DESCONTO, TRANSPARCELAS.DT_ABATIMENTO, TRANSPARCELAS.DT_PROTESTO, ' +
                           'TRANSPARCELAS.VALOR_DESCONTO, TRANSPARCELAS.VALOR_ABATIMENTO');
    FrmBoleto.QRel.Sql.Add('FROM TRANSPARCELAS');
    FrmBoleto.QRel.Sql.Add('INNER JOIN TRANSACOES');
    FrmBoleto.QRel.Sql.Add('ON (TRANSPARCELAS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
    FrmBoleto.QRel.Sql.Add('INNER JOIN CLIENTES');
    FrmBoleto.QRel.Sql.Add('ON (TRANSACOES.CLIENTE_ID = CLIENTES.CLIENTE_ID)');
    FrmBoleto.QRel.Sql.Add('WHERE');
    FrmBoleto.QRel.Sql.Add('(TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
    FrmBoleto.QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :CONDUTA)');
    FrmBoleto.QRel.Sql.Add('AND (TRANSACOES.COND_PAGTO = :COND_PAGTO)');
    FrmBoleto.QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');

    if Cliente > 0 then
    begin
      FrmBoleto.QRel.Sql.Add('AND (CLIENTES.CLIENTE_ID = :CLIENTE_ID)');
      FrmBoleto.QRel.ParamByName('CLIENTE_ID').AsInteger := Cliente;
    end;

    FrmBoleto.QRel.Sql.Add('AND (TRANSPARCELAS.VALOR > 0)');
    FrmBoleto.QRel.Sql.Add('AND (TRANSPARCELAS.BANCO_ID = 0)');
    FrmBoleto.QRel.Sql.Add('AND (TRANSPARCELAS.DT_VENCIMENTO BETWEEN :DT_INICIAL AND :DT_FINAL)');
    FrmBoleto.QRel.Sql.Add('AND (TRANSPARCELAS.TIPO_TRANSACAO = :TIPO_TRANSACAO)');
    FrmBoleto.QRel.Sql.Add('AND ((TRANSPARCELAS.AGRUPAMENTO = 0) OR (TRANSPARCELAS.AGRUPAMENTO IS NULL))');

    if Classe <> '' then
    begin
      FrmBoleto.QRel.Sql.Add('AND (CLIENTES.TIPO = :CLASSE)');
      FrmBoleto.QRel.ParamByName('CLASSE').AsString := Classe;
    end;

    FrmBoleto.QRel.Sql.Add('ORDER BY TRANSPARCELAS.DT_VENCIMENTO, CLIENTES.NOME');

    FrmBoleto.QRel.ParamByName('TIPO_TRANSACAO').AsString := 'T';
    FrmBoleto.QRel.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    FrmBoleto.QRel.ParamByName('CONDUTA').AsString        := '01';
    FrmBoleto.QRel.ParamByName('COND_PAGTO').AsString     := 'A PRAZO';
    FrmBoleto.QRel.ParamByName('TPCTB').AsString          := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    FrmBoleto.QRel.ParamByName('DT_INICIAL').AsDateTime   := Dt_Inicial;
    FrmBoleto.QRel.ParamByName('DT_FINAL').AsDateTime     := Dt_Final;

    FrmBoleto.QRel.Prepare;
    FrmBoleto.QRel.Open;

    FrmBoleto.ShowModal;
  finally
    FrmBoleto.Release;
  end;
end;

procedure TFrmBoleto.btnExecutaClick(Sender: TObject);
var
Titulo: TACBrTitulo;
I, NrTitulos: Integer;
NrTitulosStr: String;
Convertido: Boolean;
begin
  ACBrBoleto1.ListadeBoletos.Clear;

  NrTitulos := 0;

  QRel.First;
  while not QRel.Eof do
  begin
    NrTitulos := NrTitulos + 1;

    Application.ProcessMessages;
    QRel.Next;
  end;

  Convertido := True;

  repeat
    NrTitulosStr := IntToStr(NrTitulos);
    try
      NrTitulos := StrToInt(NrTitulosStr);
    except
      Convertido := False;
    end;
  until Convertido;

  QRel.First;
  while not QRel.Eof do
  begin
    Titulo := ACBrBoleto1.CriarTituloNaLista;

    with Titulo do
    begin
      Vencimento              := QRel.FieldByName('DT_VENCIMENTO').AsDateTime;
      DataDocumento           := QRel.FieldByName('DT_TRANS').AsDateTime;
      NumeroDocumento         := QRel.FieldByName('TRANSACAO_ID').AsString;
      EspecieDoc              := edtEspecieDoc.Text;
     // Aceite                  := atSim;
      DataProcessamento       := Now;
      NossoNumero             := StrZero(Copy(SemMascara(QRel.FieldByName('DUPLICATA').AsString),1,ACBrBoleto1.Banco.TamanhoMaximoNossoNum), ACBrBoleto1.Banco.TamanhoMaximoNossoNum, 0);
      Carteira                := edtCarteira.Text;
      ValorDocumento          := QRel.FieldByName('VR_PARCELA').AsFloat;
      Sacado.NomeSacado       := QRel.FieldByName('NOME').AsString;
      Sacado.CNPJCPF          := RemoveStrings(QRel.FieldByName('CNPJ').AsString, AString);
      Sacado.Logradouro       := QRel.FieldByName('ENDERECO').AsString;
      Sacado.Numero           := QRel.FieldByName('NUMERO').AsString;
      Sacado.Bairro           := QRel.FieldByName('BAIRRO').AsString;
      Sacado.Cidade           := QRel.FieldByName('MUNICIPIO').AsString;
      Sacado.UF               := QRel.FieldByName('ESTADO').AsString;
      Sacado.CEP              := RemoveStrings(QRel.FieldByName('CEP').AsString, AString);
      ValorAbatimento         := QRel.FieldByName('VALOR_ABATIMENTO').AsFloat;
      LocalPagamento          := 'PAGAR PREFERENCIALMENTE NAS AGÊNCIAS DO(A) ' + QBanco.FieldByName('DESCRICAO').AsString;
      ValorMoraJuros          := (FrmPrincipal.Config.FieldByName('JUROS_MENSAL').AsFloat / 30);
      ValorDesconto           := QRel.FieldByName('VALOR_DESCONTO').AsFloat;
      DataMoraJuros           := QRel.FieldByName('DT_MULTA_JUROS').AsDateTime;
      DataDesconto            := QRel.FieldByName('DT_DESCONTO').AsDateTime;
      DataAbatimento          := QRel.FieldByName('DT_ABATIMENTO').AsDateTime;
      DataProtesto            := QRel.FieldByName('DT_PROTESTO').AsDateTime;
      PercentualMulta         := FrmPrincipal.Config.FieldByName('MULTA').AsFloat;
      Mensagem.Text           := memMensagem.Text;
      OcorrenciaOriginal.Tipo := toRemessaBaixar;
      Instrucao1              := trim(edtInstrucoes1.Text);
      Instrucao2              := trim(edtInstrucoes2.Text);
    end;

    Application.ProcessMessages;
    QRel.Next;
  end;

  if Imprimir.Checked then
    ACBrBoleto1.Imprimir;

  if Gerar_HTML.Checked then
  begin
    ACBrBoleto1.ACBrBoletoFC.NomeArquivo := ExtractFilePath(Application.ExeName) +  ACBrBoletoFCFortes1.NomeArquivo + '.html';
    ACBrBoleto1.GerarHTML;
  end;

  if Gerar_PDF.Checked then
  begin
    ACBrBoleto1.ACBrBoletoFC.NomeArquivo := ExtractFilePath(Application.ExeName) + ACBrBoletoFCfortes1.NomeArquivo + '.pdf';
    ACBrBoleto1.GerarPDF;
  end;

  if Gerar_Remessa.Checked then
    ACBrBoleto1.GerarRemessa(1);
end;

procedure TFrmBoleto.FormCreate(Sender: TObject);
begin
  AString[0] := '.';
  AString[1] := '-';
  AString[2] := '/';
  AString[3] := '(';
  AString[4] := ')';
  AString[5] := ' ';
end;

procedure TFrmBoleto.FormShow(Sender: TObject);
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

  ACBrBoleto1.Cedente.Nome              := FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString;
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
   // ACBrBoleto1.Cedente.ResponEmissao := tbBancoEmite
  else if LeIni(Arq_Ini, 'Boleto', 'Responsável Emissão') = 'Banco não Reemite' then
    //ACBrBoleto1.Cedente.ResponEmissao := tbBancoNaoReemite
  else if LeIni(Arq_Ini, 'Boleto', 'Responsável Emissão') = 'Banco Reemite' then
   // ACBrBoleto1.Cedente.ResponEmissao := tbBancoReemite
  else if LeIni(Arq_Ini, 'Boleto', 'Responsável Emissão') = 'Cliente Emite' then
  //  ACBrBoleto1.Cedente.ResponEmissao := tbCliEmite;

  if FrmPrincipal.QEmpresa.FieldByName('TIPO_EMPRESA').AsString = 'PESSOA FÍSICA' then
   // ACBrBoleto1.Cedente.TipoInscricao := pFisica
  else if FrmPrincipal.QEmpresa.FieldByName('TIPO_EMPRESA').AsString = 'PESSOA JURÍDICA' then
  //  ACBrBoleto1.Cedente.TipoInscricao := pJuridica;
//  else
//    ACBrBoleto1.Cedente.TipoInscricao := pOutras;

  ACBrBoleto1.NomeArqRemessa  := LeIni(Arq_Ini, 'Boleto', 'Nome Arq. Remessa');
  ACBrBoleto1.DirArqRemessa   := LeIni(Arq_Ini, 'Boleto', 'Dir. Arq. Remessa');
  ACBrBoleto1.NomeArqRetorno  := LeIni(Arq_Ini, 'Boleto', 'Nome Arq. Retorno');
  ACBrBoleto1.DirArqRetorno   := LeIni(Arq_Ini, 'Boleto', 'Dir. Arq. Retorno');
  ACBrBoleto1.NumeroArquivo   := 1;
  ACBrBoleto1.DataArquivo     := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
  ACBrBoleto1.DataCreditoLanc := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;

  if LeIni(Arq_Ini, 'Boleto', 'Imprimir Mensagem Padrão') = 'True' then
    ACBrBoleto1.ImprimirMensagemPadrao := True
  else
    ACBrBoleto1.ImprimirMensagemPadrao := False;

  if LeIni(Arq_Ini, 'Boleto', 'Layout Remessa') = '240' then
    ACBrBoleto1.LayoutRemessa := c240
  else
    ACBrBoleto1.LayoutRemessa := c400;

  ACBrBoletoFCfortes1.DirLogo   := LeIni(Arq_Ini, 'Boleto', 'Dir. Arq. Logo');
  ACBrBoletoFCfortes1.NumCopias := StrToInt(LeIni(Arq_Ini, 'Boleto', 'Número Cópias'));

  if LeIni(Arq_Ini, 'Boleto', 'Layout Impressão') = 'Carnê' then
   // ACBrBoleto1.ACBrBoletoFC.LayOut := TACBrBolLayOut(1)
  else if LeIni(Arq_Ini, 'Boleto', 'Layout Impressão') = 'Entrega' then
   // ACBrBoleto1.ACBrBoletoFC.LayOut := TACBrBolLayOut(3)
  else if LeIni(Arq_Ini, 'Boleto', 'Layout Impressão') = 'Fatura' then
   // ACBrBoleto1.ACBrBoletoFC.LayOut := TACBrBolLayOut(2)
  else if LeIni(Arq_Ini, 'Boleto', 'Layout Impressão') = 'Padrão' then
   // ACBrBoleto1.ACBrBoletoFC.LayOut := TACBrBolLayOut(0);

  ACBrBoletoFCfortes1.NomeArquivo := LeIni(Arq_Ini, 'Boleto', 'Nome Arquivo');
end;

end.
