unit URel_Fechamento_Caixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, rxCurrEdit, rxToolEdit, Buttons, DBCtrls,
  DB, IBCustomDataSet, IBQuery, QuickRpt, QRCtrls, RDprint, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmRel_Fechamento_Caixa = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    Dtmen: TDateEdit;
    Caixa_Banco: TCurrencyEdit;
    Dtmai: TDateEdit;
    btnCaixa_Banco: TSpeedButton;
    DataBanco: TDataSource;
    DBText1: TDBText;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    RDprint1: TRDprint;
    Label3: TLabel;
    Operador: TEdit;
    btn_operador: TSpeedButton;
    DBText2: TDBText;
    DataOperador: TDataSource;
    QOperador: TFDQuery;
    QRel: TFDQuery;
    QBanco: TFDQuery;
    Chk_Impressora: TCheckBox;
    procedure btnRetornaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnCaixa_BancoClick(Sender: TObject);
    procedure Caixa_BancoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Caixa_BancoChange(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure DtmenEnter(Sender: TObject);
    procedure btn_operadorClick(Sender: TObject);
    procedure OperadorExit(Sender: TObject);
    procedure OperadorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SearchBanco;
  end;

var
  FrmRel_Fechamento_Caixa: TFrmRel_Fechamento_Caixa;

  function IniciaPorta(Porta: String): Integer; stdcall; far; external 'Mp2032.dll';
  function FechaPorta: Integer;  stdcall; far; external 'Mp2032.dll';
  function BematechTX(BufTrans: String): Integer; stdcall; far; external 'Mp2032.dll';
  function FormataTX(BufTras: String; TpoLtra:integer; Italic: Integer; Sublin: Integer; expand: Integer; enfat: Integer): Integer; stdcall; far; external 'Mp2032.dll';
  function ComandoTX (BufTrans: String; TamBufTrans: Integer): Integer; stdcall; far; external 'Mp2032.dll';
  function Status_Porta: Integer; stdcall; far; external 'Mp2032.dll';
  function AutenticaDoc(BufTras: String; Tempo: Integer): Integer; stdcall; far; external 'Mp2032.dll';
  function Le_Status: Integer; stdcall; far; external 'Mp2032.dll';
  function Le_Status_Gaveta: Integer; stdcall; far; external 'Mp2032.dll';
  function DocumentInserted: Integer; stdcall; far; external 'Mp2032.dll';
  function ConfiguraTamanhoExtrato(NumeroLinhas: Integer): Integer; stdcall; far; external 'Mp2032.dll';
  function HabilitaExtratoLongo(Flag: Integer): Integer; stdcall; far; external 'Mp2032.dll';
  function HabilitaEsperaImpressao(Flag: Integer): Integer; stdcall; far; external 'Mp2032.dll';
  function EsperaImpressao: Integer; stdcall; far; external 'Mp2032.dll';
  function ConfiguraModeloImpressora(ModeloImpressora: Integer): Integer; stdcall; far; external 'Mp2032.dll';
  function AcionaGuilhotina(Modo: Integer): Integer; stdcall; far; external 'Mp2032.dll';
  function HabilitaPresenterRetratil(Flag: Integer): Integer; stdcall; far; external 'Mp2032.dll';
  function ProgramaPresenterRetratil(Tempo: Integer): Integer; stdcall; far; external 'Mp2032.dll';
  function CaracterGrafico(Buffer: String; TamBuffer: Integer): Integer; stdcall; far; external 'Mp2032.dll';
  function VerificaPapelPresenter(): Integer; stdcall; far; external 'Mp2032.dll';

  // Funções para Impressão dos Códigos de Barras

  function ImprimeCodigoBarrasUPCA(Codigo: String): Integer; stdcall; far; external 'Mp2032.dll';
  function ImprimeCodigoBarrasUPCE(Codigo: String): Integer; stdcall; far; external 'Mp2032.dll';
  function ImprimeCodigoBarrasEAN13(Codigo: String): Integer; stdcall; far; external 'Mp2032.dll';
  function ImprimeCodigoBarrasEAN8(Codigo: String): Integer; stdcall; far; external 'Mp2032.dll';
  function ImprimeCodigoBarrasCODE39(Codigo: String): Integer; stdcall; far; external 'Mp2032.dll';
  function ImprimeCodigoBarrasCODE93(Codigo: String): Integer; stdcall; far; external 'Mp2032.dll';
  function ImprimeCodigoBarrasCODE128(Codigo: String): Integer; stdcall; far; external 'Mp2032.dll';
  function ImprimeCodigoBarrasITF(Codigo: String): Integer; stdcall; far; external 'Mp2032.dll';
  function ImprimeCodigoBarrasCODABAR(Codigo: String): Integer; stdcall; far; external 'Mp2032.dll';
  function ImprimeCodigoBarrasISBN(Codigo: String): Integer; stdcall; far; external 'Mp2032.dll';
  function ImprimeCodigoBarrasMSI(Codigo: String): Integer; stdcall; far; external 'Mp2032.dll';
  function ImprimeCodigoBarrasPLESSEY(Codigo: String): Integer; stdcall; far; external 'Mp2032.dll';
  function ImprimeCodigoBarrasPDF417(NivelCorrecaoErros , Altura , Largura , Colunas: Integer; Codigo: String): Integer; stdcall; far; external 'Mp2032.dll';
  function ConfiguraCodigoBarras(Altura, Largura, PosicaoCaracteres, Fonte, Margem: Integer): Integer; stdcall; far; external 'Mp2032.dll';

  // Função para Bitmaps

  function ImprimeBmpEspecial(Nome: String; xScale: integer; yScale: Integer; Angle: Integer): Integer; stdcall; far; external 'Mp2032.dll';
  function ImprimeBitmap(Nome: String; Mode: Integer): Integer; stdcall; far; external 'Mp2032.dll';
  function AjustaLarguraPapel(PaperWidth:  Integer): Integer; stdcall; far; external 'Mp2032.dll';
  function SelectDithering (DitherType:  Integer): Integer; stdcall; far; external 'Mp2032.dll';
  function ImprimePrn (Nome: String; Sleep:  Integer): Integer; stdcall; far; external 'Mp2032.dll';
  
implementation

uses
  UData, UConsulta, UPrincipal;

{$R *.dfm}

procedure TFrmRel_Fechamento_Caixa.SearchBanco;
begin
  QBanco.Close;
  QBanco.ParamByName('BANCO_ID').AsInteger   := StrToInt(Caixa_Banco.Text);
  QBanco.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  QBanco.Prepare;
  QBanco.Open;

  if QBanco.IsEmpty then
    btnExecuta.Enabled := False
  else
    btnExecuta.Enabled := True;
end;

procedure TFrmRel_Fechamento_Caixa.btnCaixa_BancoClick(Sender: TObject);
begin
  try
    Caixa_Banco.Value := GetConsulta('BANCOS', 0, 0, StrToInt(Caixa_Banco.Text));
  except
    Caixa_Banco.Value := GetConsulta('BANCOS', 0, 0, 0);
  end;
end;

procedure TFrmRel_Fechamento_Caixa.btnExecutaClick(Sender: TObject);
var
X, Linhas, Comando, Dividir: Integer;
MyFile: TextFile;
Vr_Fin, Vr_Troco, Meio: Real;
Buffer, Comunica, S: String;
begin
  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;


    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT DATA, CUPOM, LEGENDA , VALOR_CUPOM, VALOR_FINALIZADORA, DESCONTO, TROCO');
    QRel.Sql.Add('FROM (');
    QRel.Sql.Add('SELECT DATA, CUPOM , LEGENDA, CASE WHEN (VALOR_CUPOM + ACRESCIMO - DESCONTO) > VALOR_FINALIZADORA');
    QRel.Sql.Add('THEN (VALOR_FINALIZADORA)  ELSE (VALOR_CUPOM + ACRESCIMO - DESCONTO) END VALOR_CUPOM, VALOR_FINALIZADORA, DESCONTO, (VALOR_FINALIZADORA - VALOR_CUPOM) TROCO');
    QRel.Sql.Add('FROM FECHAMENTO_CUPOM');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(DATA BETWEEN :DT_INICIAL AND :DT_FINAL)');
    QRel.Sql.Add('AND (CAIXA_ID = :CAIXA_ID)');
    QRel.Sql.Add('AND (VALOR_FINALIZADORA > 0)');

    if Operador.Text <> '' then
    QRel.Sql.Add('AND (OPERADOR_ID  = :OPERADOR_ID)');

    QRel.Sql.Add('UNION ALL');
    QRel.Sql.Add('SELECT DATA , CUPOM , LEGENDA , VALOR_CUPOM,VALOR_FINALIZADORA, DESCONTO, 0 TROCO');
    QRel.Sql.Add('FROM FECHAMENTO_CUPOM');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(DATA BETWEEN :DT_INICIAL AND :DT_FINAL)');
    QRel.Sql.Add('AND (CAIXA_ID = :CAIXA_ID)');
    QRel.Sql.Add('AND (VALOR_CUPOM < 0)');

    if Operador.Text <> '' then
    QRel.Sql.Add('AND (OPERADOR_ID  = :OPERADOR_ID)');

    QRel.Sql.Add(')as teste');

    QRel.Sql.Add('ORDER BY DATA, CUPOM, LEGENDA');

    QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
    QRel.ParamByName('CAIXA_ID').AsInteger    := StrToInt(Caixa_Banco.Text);

    if Operador.Text <> '' then
    QRel.ParamByName('OPERADOR_ID').AsInteger    := StrToInt(OPERADOR.Text);


    QRel.Prepare;
    QRel.Open;

    if QRel.IsEmpty then
      Application.MessageBox('Não há dados para os parâmetros informados', PChar(Msg_Title), mb_IconInformation)
    else
    begin
      AssignFile(MyFile, ExtractFilePath(ParamStr(0)) + 'Caixa.Txt');
      Rewrite(MyFile);

      if LeIni(Arq_Ini, 'Sistema', 'Linha Cabeçalho') <> '' then
        WriteLn(MyFile, LeIni(Arq_Ini, 'Sistema', 'Linha Cabeçalho'))
      else
      begin
        Meio    := ((48 - Length(FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString)) / 2);
        Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));

        Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ' ) + FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString);

        Meio    := ((48 - Length(FrmPrincipal.QEmpresa.FieldByName('ENDERECO').AsString + ', ' + FrmPrincipal.QEmpresa.FieldByName('NUMERO').AsString)) / 2);
        Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));

        Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ' ) + FrmPrincipal.QEmpresa.FieldByName('ENDERECO').AsString + ', ' + FrmPrincipal.QEmpresa.FieldByName('NUMERO').AsString);

        Meio    := ((48 - Length('Telefone: ' + FrmPrincipal.QEmpresa.FieldByName('TELEFONE').AsString)) / 2);
        Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));

        Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ' ) + 'Telefone: ' + FrmPrincipal.QEmpresa.FieldByName('TELEFONE').AsString);
        Writeln(MyFile, '');
        Writeln(MyFile, '               RELATÓRIO DE CAIXA               ');
        Writeln(MyFile, '               ==================               ');
      end;

      Writeln(MyFile, '');
      Writeln(MyFile, 'Caixa: ' + StrZero(Caixa_Banco.Text, 3, 0) + ' - ' + QBanco.FieldByName('DESCRICAO').AsString);

      if  not QOperador.IsEmpty then
      Writeln(MyFile, 'Operador: '  + QOperador.FieldByName('NOME').AsString);

      Writeln(MyFile, '');

      Writeln(MyFile, '------------------------------------------------');
      Writeln(MyFile, DateToStr(date) + ' - ' + TimeToStr(now));
      Writeln(MyFile, '------------------------------------------------');
      Writeln(MyFile, 'Trans.    Descrição          Vr. Vda.      Desc.');
      Writeln(MyFile, '------------------------------------------------');

      Vr_Fin   := 0;
      Vr_Troco := 0;

      QRel.First;
      while not QRel.Eof do
      begin
        Writeln(MyFile, QRel.FieldByName('CUPOM').AsString + '  ' +
                        ForcaComprimento(QRel.FieldByName('LEGENDA').AsString, 18, ' ') +
                        ForcaComprimento(' ', (9 - Length(FormatFloat('#,##0.00', QRel.FieldByName('VALOR_CUPOM').AsFloat))), ' ') +
                        FormatFloat('#,##0.00', QRel.FieldByName('VALOR_CUPOM').AsFloat) + '  ' +
                        ForcaComprimento(' ', (9 - Length(FormatFloat('#,##0.00', QRel.FieldByName('DESCONTO').AsFloat))), ' ') +
                        FormatFloat('#,##0.00', QRel.FieldByName('DESCONTO').AsFloat));

        Vr_Fin   := Vr_Fin + QRel.FieldByName('VALOR_CUPOM').AsFloat;
        Vr_Troco := Vr_Troco + QRel.FieldByName('DESCONTO').AsFloat;

        Application.ProcessMessages;
        QRel.Next;
      end;

      Writeln(MyFile, '                           ---------------------');
      Writeln(MyFile, ForcaComprimento(' ', 28, ' ') +
                      ForcaComprimento(' ', (9 - Length(FormatFloat('#,##0.00', Vr_Fin))), ' ') +
                      FormatFloat('#,##0.00', Vr_Fin) + '  ' +
                      ForcaComprimento(' ', (9 - Length(FormatFloat('#,##0.00', Vr_Troco))), ' ') +
                      FormatFloat('#,##0.00', Vr_Troco));
      Writeln(MyFile, '');
      Writeln(MyFile, 'Vr. Líquido: ' + FormatFloat('#,##0.00',  (Vr_Fin)));
      Writeln(MyFile, '');
      Writeln(MyFile, '');
      Writeln(MyFile, '');

     { QRel.Sql.Clear;
      QRel.Sql.Add('SELECT CAIXA_ID, LEGENDA, SUM(VALOR_FINALIZADORA) VALOR');
      QRel.Sql.Add('FROM FECHAMENTO_CUPOM');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(DATA BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('AND (CAIXA_ID = :CAIXA_ID)');
      QRel.Sql.Add('GROUP BY CAIXA_ID, LEGENDA');

      QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
      QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
      QRel.ParamByName('CAIXA_ID').AsInteger    := StrToInt(Caixa_Banco.Text);}

      QRel.Sql.Clear;
      QRel.Sql.Add('SELECT CAIXA_ID, LEGENDA,NOME,SUM(VALOR) VALOR ');
      QRel.Sql.Add('FROM');
      QRel.Sql.Add('(');
      QRel.Sql.Add('SELECT CAIXA_ID, LEGENDA, OPERADORES.NOME, CASE WHEN SUM(VALOR_CUPOM + ACRESCIMO - DESCONTO) > VALOR_FINALIZADORA ');
      QRel.Sql.Add('THEN VALOR_FINALIZADORA ELSE SUM(VALOR_CUPOM + ACRESCIMO - DESCONTO) END VALOR');
      QRel.Sql.Add('FROM FECHAMENTO_CUPOM');
      QRel.Sql.Add('INNER JOIN OPERADORES ON CAST(OPERADORES.OPERADOR_ID AS INTEGER) = FECHAMENTO_CUPOM.OPERADOR_ID');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(DATA BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('AND (CAIXA_ID = :CAIXA_ID)');

      if operador.Text <> '' then
      Begin
      QRel.Sql.Add('AND (FECHAMENTO_CUPOM.OPERADOR_ID = :OPERADOR) ');
      QRel.ParamByName('OPERADOR').AsInteger := StrToInt(operador.text);
      End;

      QRel.Sql.Add('GROUP BY CAIXA_ID, LEGENDA,NOME,VALOR_FINALIZADORA,CUPOM');
      QRel.Sql.Add('UNION ALL');
      QRel.Sql.Add('SELECT BANCO_ID,' + #39 + 'QUITAÇÃO' + #39 + ' LEGENDA ,OPERADORES.NOME, SUM(VALOR)');
      QRel.Sql.Add('FROM TRANSACOES');
      QRel.SQL.Add('INNER JOIN OPERADORES ON OPERADORES.NOME = TRANSACOES.OPERADOR');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(DT_ENT_SAI BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('AND (BANCO_ID = :CAIXA_ID) AND (CONDUTA = :CONDUTA) ');

      if operador.Text <> '' then
      Begin
      QRel.Sql.Add('AND (OPERADORES.OPERADOR_ID = :OPERADORQ)');
      QRel.ParamByName('OPERADORQ').AsString := StrZero(operador.text,14,0);
      End;

      QRel.Sql.Add('GROUP BY BANCO_ID, LEGENDA,NOME');
      QRel.Sql.Add(')as teste');
      QRel.Sql.Add('GROUP BY CAIXA_ID,LEGENDA,NOME');

      QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
      QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
      QRel.ParamByName('CAIXA_ID').AsInteger    := StrToInt(Caixa_Banco.Text);
      QRel.ParamByName('CONDUTA').AsString      := '07';


      QRel.Prepare;
      QRel.Open;


      Writeln(MyFile, '                     RESUMO                     ');
      Writeln(MyFile, '                     ======                     ');
      Writeln(MyFile, '------------------------------------------------');
      Writeln(MyFile, 'Descrição                                  Valor');
      Writeln(MyFile, '------------------------------------------------');

      QRel.First;
      while not QRel.Eof do
      begin
        Writeln(MyFile, ForcaComprimento(QRel.FieldByName('LEGENDA').AsString, 39, ' ') +
                        ForcaComprimento(' ', (9 - Length(FormatFloat('#,##0.00', QRel.FieldByName('VALOR').AsFloat))), ' ') +
                        FormatFloat('#,##0.00', QRel.FieldByName('VALOR').AsFloat));
          Application.ProcessMessages;
          QRel.Next;
      end;

      Writeln(MyFile, '                                       ---------');
      Writeln(MyFile, ForcaComprimento('Sub-Total', 48 - Length(FormatFloat('#,##0.00', Vr_Fin)), ' ') + FormatFloat('#,##0.00', Vr_Fin));

      for Linhas := 1 to StrToInt(LeIni(Arq_Ini, 'Sistema', 'Linhas')) do
        Writeln(MyFile, ' ');

      CloseFile(MyFile);

    if (LeIni(Arq_Ini, 'Sistema', 'Imp. Orçamento') <> 'Driver Bematech')   then
    Begin
    AssignFile(MyFile, ExtractFilePath(ParamStr(0)) + 'Caixa.Txt');
            Reset(MyFile);

            Buffer := '';

            Linhas := 1;

            RDprint1.Abrir;

            if Chk_Impressora.Checked then
            RDprint1.Impressora        := HP
            Else
            RDprint1.Impressora        := Bobina;

            RDprint1.TamanhoQteLinhas  := 1;
            RDprint1.TamanhoQteColunas := 48;
            RDprint1.Acentuacao        := SemAcento;
            RDprint1.MostrarProgresso  := False;
            RDprint1.ImpASCII(01, 01, '27 64');

            while not Eof(MyFile) do
            begin
              ReadLn(MyFile, S);

              Buffer := S;

              RDprint1.Imp(Linhas, 01, Buffer);

              if Chk_Impressora.Checked then
              if Linhas > 66  then
              Begin
              RDprint1.Novapagina;
              Linhas := 1;
              End;

              Inc(Linhas);

              Application.ProcessMessages;
            end;
            CloseFile(MyFile);

            if Chk_Impressora.Checked then
            RDprint1.TamanhoQteLinhas  := 66
            Else
            RDprint1.TamanhoQteLinhas  := Linhas;

            RdPrint1.Fechar;
    End
    Else
    Begin
      if LeIni(Arq_Ini, 'Sistema', 'Modelo Impressora') = '0' then
        Comando := ConfiguraModeloImpressora(0)
      else if LeIni(Arq_Ini, 'Sistema', 'Modelo Impressora') = '1' then
        Comando := ConfiguraModeloImpressora(1)
      else if LeIni(Arq_Ini, 'Sistema', 'Modelo Impressora') = '2' then
        Comando := ConfiguraModeloImpressora(2)
      else if LeIni(Arq_Ini, 'Sistema', 'Modelo Impressora') = '3' then
        Comando := ConfiguraModeloImpressora(3)
      else if LeIni(Arq_Ini, 'Sistema', 'Modelo Impressora') = '4' then
        Comando := ConfiguraModeloImpressora(4)
      else if LeIni(Arq_Ini, 'Sistema', 'Modelo Impressora') = '5' then
        Comando := ConfiguraModeloImpressora(5);

      if Comando <> 1 then
        Application.MessageBox('Erro de comunicação com a impressora Bematech (Configura Impressora)', PChar(Msg_Title), mb_IconInformation);

      if LeIni(Arq_Ini, 'Sistema', 'Porta Impressora') = 'USB' then
        Comunica := 'USB'#0
      else if LeIni(Arq_Ini, 'Sistema', 'Porta Impressora') = 'COM1' then
        Comunica := 'COM1'
      else if LeIni(Arq_Ini, 'Sistema', 'Porta Impressora') = 'COM2' then
        Comunica := 'COM2'
      else if LeIni(Arq_Ini, 'Sistema', 'Porta Impressora') = 'COM3' then
        Comunica := 'COM3'
      else if LeIni(Arq_Ini, 'Sistema', 'Porta Impressora') = 'COM4' then
        Comunica := 'COM4'
      else if LeIni(Arq_Ini, 'Sistema', 'Porta Impressora') = 'COM5' then
        Comunica := 'COM5'
      else if LeIni(Arq_Ini, 'Sistema', 'Porta Impressora') = 'COM6' then
        Comunica := 'COM6'
      else if LeIni(Arq_Ini, 'Sistema', 'Porta Impressora') = 'COM7' then
        Comunica := 'COM7'
      else if LeIni(Arq_Ini, 'Sistema', 'Porta Impressora') = 'COM8' then
        Comunica := 'COM8'
      else if LeIni(Arq_Ini, 'Sistema', 'Porta Impressora') = 'COM9' then
        Comunica := 'COM9'
      else if LeIni(Arq_Ini, 'Sistema', 'Porta Impressora') = 'LPT1' then
        Comunica := 'LPT1'
      else if LeIni(Arq_Ini, 'Sistema', 'Porta Impressora') = 'LPT2' then
        Comunica := 'LPT2'
      else if LeIni(Arq_Ini, 'Sistema', 'Porta Impressora') = 'LPT3' then
        Comunica := 'LPT3'
      else if LeIni(Arq_Ini, 'Sistema', 'Porta Impressora') = 'LPT4' then
        Comunica := 'LPT4';

      Comando := IniciaPorta(Pchar(Comunica));

      if Comando <> 1 then
        Application.MessageBox('Erro de comunicação com a impressora Bematech (Inicia Porta)', PChar(Msg_Title), mb_IconInformation);

      AssignFile(MyFile, ExtractFilePath(ParamStr(0)) + 'Caixa.Txt');
      Reset(MyFile);

      Buffer := '';

      while not Eof(MyFile) do
      begin
        ReadLn(MyFile, S);

        Buffer := S + Chr(13) + Chr(10);
        Comando := FormataTX(Buffer, 3, 0, 0, 0, 0);

        Application.ProcessMessages;
      end;

      CloseFile(MyFile);

      Comando := AcionaGuilhotina(1);

      if Comando <> 1 then
        Application.MessageBox('Erro de comunicação com a impressora Bematech (Guilhotina)', PChar(Msg_Title), mb_IconInformation);

      FechaPorta();
    End;
    end;
  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;

procedure TFrmRel_Fechamento_Caixa.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRel_Fechamento_Caixa.btn_operadorClick(Sender: TObject);
begin
try
    Operador.Text := IntToStr(GetConsulta('OPERADOR', 0, 0, StrToInt(Operador.Text)));
  except
    Operador.Text := IntToStr(GetConsulta('OPERADOR', 0, 0, 0));
  end;
end;

procedure TFrmRel_Fechamento_Caixa.Caixa_BancoChange(Sender: TObject);
begin
  if Caixa_Banco.Value > 0 then
    SearchBanco;

  if QBanco.IsEmpty then
    btnExecuta.Enabled := False
  else
    btnExecuta.Enabled := True;
end;

procedure TFrmRel_Fechamento_Caixa.Caixa_BancoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = Caixa_Banco) then
    btnCaixa_BancoClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmRel_Fechamento_Caixa.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmRel_Fechamento_Caixa.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
   // Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmRel_Fechamento_Caixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmRel_Fechamento_Caixa.FormCreate(Sender: TObject);
begin
  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);
end;

procedure TFrmRel_Fechamento_Caixa.OperadorExit(Sender: TObject);
begin
if operador.Text <> '' then
  Begin
  QOperador.Close;
  QOperador.ParamByName('OPERADOR').AsString   := StrZero(Operador.text,14,0);
  QOperador.Prepare;
  QOperador.Open;
  End;

end;

procedure TFrmRel_Fechamento_Caixa.OperadorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if (Key = Vk_F7) and (Sender = Caixa_Banco) then
    btn_OperadorClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

end.
