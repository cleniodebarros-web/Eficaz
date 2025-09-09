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
    Chk_PorHora: TCheckBox;
    Label4: TLabel;
    HoraInicial: TMaskEdit;
    HoraFinal: TMaskEdit;
    Label5: TLabel;
    QBanco: TFDQuery;
    QOperador: TFDQuery;
    QRel: TFDQuery;
    Chk_Sintetico: TCheckBox;
    QSangriaSuprimentoSintetico: TFDQuery;
    chk_recebimento: TCheckBox;
    Label34: TLabel;
    chk_finalizadora: TCheckBox;
    DataFinalizadora: TDataSource;
    QFinalizadora: TFDQuery;
    FINALIZADORA_ID: TDBLookupComboBox;
    chk_caixas_separados: TCheckBox;
    QFechamento: TFDQuery;
    procedure btnRetornaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnCaixa_BancoClick(Sender: TObject);
    procedure Caixa_BancoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Caixa_BancoChange(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure CabecalhoCaixas;
    procedure RodapeCaixas(Finalizadora, Troco: Real);
    procedure DtmenEnter(Sender: TObject);
    procedure btn_operadorClick(Sender: TObject);
    procedure OperadorExit(Sender: TObject);
    procedure OperadorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Chk_PorHoraClick(Sender: TObject);
    procedure HoraInicialKeyPress(Sender: TObject; var Key: Char);
    procedure HoraFinalKeyPress(Sender: TObject; var Key: Char);
    procedure chk_finalizadoraClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SearchBanco;
  end;

var
  FrmRel_Fechamento_Caixa: TFrmRel_Fechamento_Caixa;
  Linhas,Linhas_pag:Integer;
  MyFile: TextFile;

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

  function ValidaHora(Hora: String): Boolean;
  
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
  begin
    btnExecuta.Enabled := False;
    DBText1.Caption := '';
  end
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

function ValidaHora(Hora: String): Boolean;
var
H, M : Integer;
begin

      H := StrToInt(Copy(Hora, 1, 2));
      M := StrToInt(Copy(Hora, 4, 2));

      if ( H <= 23 ) AND ( M <= 59 ) then
         Result := True
      else
         Result:= False;
end;

procedure TFrmRel_Fechamento_Caixa.btnExecutaClick(Sender: TObject);
var
X,  Comando, Dividir,CX,CX2: Integer;
Vr_Fin, Vr_Troco, Meio, Valor,VLC, Vr_Sangria_Resumida, Vr_Suprimento_Resumido,vlr: Real;
Buffer, Comunica, S, Legenda, Ult_Legenda: String;
begin
  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    if Chk_PorHora.Checked then
    begin

      if not ValidaHora(HoraInicial.Text) then
      begin
        ShowMessage('Hora Inicial inválida.');
        HoraInicial.SetFocus;
        Abort;
      end;

      if not ValidaHora(HoraFinal.Text) then
      begin
        ShowMessage('Hora Final inválida.');
        HoraFinal.SetFocus;
        Abort;
      end;

    end;

    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT CAIXA,DATA, CAST(HORA as TIME) AS HORA, CUPOM, LEGENDA, SUM(VALOR_CUPOM), SUM(VALOR_FINALIZADORA) VALOR_FINALIZADORA, SUM(DESCONTO) DESCONTO, SUM(TROCO) TROCO');
    QRel.Sql.Add('FROM (');
    QRel.Sql.Add('SELECT CAIXA_ID CAIXA ,DATA, HORA, CUPOM, LEGENDA, CASE WHEN (VALOR_CUPOM ) = VALOR_FINALIZADORA');
    QRel.Sql.Add('THEN (VALOR_CUPOM + ACRESCIMO - DESCONTO) WHEN (VALOR_CUPOM + ACRESCIMO - DESCONTO) > VALOR_FINALIZADORA');
    QRel.Sql.Add('THEN (VALOR_FINALIZADORA) ELSE (VALOR_CUPOM + ACRESCIMO  - DESCONTO) END VALOR_CUPOM, VALOR_FINALIZADORA, DESCONTO, (VALOR_FINALIZADORA - VALOR_CUPOM) TROCO');
    QRel.Sql.Add('FROM FECHAMENTO_CUPOM');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(DATA BETWEEN :DT_INICIAL AND :DT_FINAL)');

    IF chk_finalizadora.Checked Then
    Begin
      QRel.Sql.Add('AND (CAST(FECHAMENTO_CUPOM.FINALIZADORA_ID AS INTEGER) = :FINALIZADORA_ID)');
      QRel.ParamByName('FINALIZADORA_ID').AsInteger := QFinalizadora.FieldByName('FINALIZADORA_ID').AsInteger;
    End;

    QRel.Sql.Add('AND (CAIXA_ID IN (SELECT BANCO_ID FROM BANCOS WHERE TIPO_LIMITE <> ' +#39 + 'EXCLUSO DO SALDO' + #39' ))');

    if (Chk_PorHora.Checked) then
       QRel.Sql.Add('AND CAST(HORA AS TIME) BETWEEN CAST(:H_INICIAL AS TIME) AND CAST(:H_FINAL AS TIME)');

    if Caixa_Banco.Value > 0 then
    QRel.Sql.Add('AND (CAIXA_ID = :CAIXA_ID)');

    QRel.Sql.Add('AND (VALOR_FINALIZADORA > 0)');
    QRel.Sql.Add('AND ((FISCAL = :FISCAL) OR (FISCAL = :FISCAL1))');

    if Operador.Text <> '' then
       QRel.Sql.Add('AND (OPERADOR_ID  = :OPERADOR_ID)');

    QRel.Sql.Add('UNION ALL');

    QRel.Sql.Add('SELECT CAIXA_ID CAIXA ,DATA, HORA, CUPOM, LEGENDA,CASE WHEN (VALOR_CUPOM) = VALOR_FINALIZADORA ');
    QRel.Sql.Add('THEN (VALOR_CUPOM + ACRESCIMO - DESCONTO) WHEN (VALOR_CUPOM + ACRESCIMO - DESCONTO) > VALOR_FINALIZADORA ');
    QRel.Sql.Add('THEN (VALOR_FINALIZADORA) ELSE (VALOR_CUPOM + ACRESCIMO - DESCONTO) END VALOR_CUPOM , VALOR_FINALIZADORA,DESCONTO,0 TROCO');
    QRel.Sql.Add('FROM FECHAMENTO_CUPOM');
    QRel.Sql.Add('LEFT JOIN OPERADORES ON (CAST(OPERADORES.OPERADOR_ID AS INTEGER) = FECHAMENTO_CUPOM.OPERADOR_ID)');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(DATA BETWEEN :DT_INICIAL AND :DT_FINAL)');

    IF chk_finalizadora.Checked Then
    Begin
      QRel.Sql.Add('AND (CAST(FECHAMENTO_CUPOM.FINALIZADORA_ID AS INTEGER) = :FINALIZADORA_ID)');
      QRel.ParamByName('FINALIZADORA_ID').AsInteger := QFinalizadora.FieldByName('FINALIZADORA_ID').AsInteger;
    End;


    QRel.Sql.Add('AND (CAIXA_ID IN (SELECT BANCO_ID FROM BANCOS WHERE TIPO_LIMITE <> ' +#39 + 'EXCLUSO DO SALDO' + #39' ))');

    if (Chk_PorHora.Checked) then
    Begin
       QRel.Sql.Add('AND CAST(HORA AS TIME) BETWEEN CAST(:H_INICIAL AS TIME) AND CAST(:H_FINAL AS TIME)');
       QRel.ParamByName('H_INICIAL').AsTime := StrToTime(HoraInicial.Text+':00');
       QRel.ParamByName('H_FINAL').AsTime   := StrToTime(HoraFinal.Text+':00');
    End;

    if Caixa_Banco.Value > 0 then
    QRel.Sql.Add('AND (CAIXA_ID = :CAIXA_ID)');


    QRel.Sql.Add('AND (VALOR_FINALIZADORA < 0)');
    QRel.Sql.Add('AND ((FISCAL = :FISCAL) OR (FISCAL = :FISCAL1))');


    if Operador.Text <> '' then
    QRel.Sql.Add('AND (FECHAMENTO_CUPOM.OPERADOR_ID  = :OPERADOR_ID)');

    QRel.Sql.Add(') AS TESTE');

    QRel.Sql.Add('GROUP BY CAIXA, DATA ,CUPOM ,LEGENDA, HORA ');

    QRel.Sql.Add('ORDER BY CAIXA, DATA, CUPOM, LEGENDA');

    QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;

    if Caixa_Banco.Value > 0 then
    QRel.ParamByName('CAIXA_ID').AsInteger    := StrToInt(Caixa_Banco.Text);

    QRel.ParamByName('FISCAL').AsString       :=  'S';
    if FrmData.QAcesso.FieldByName('TPCTB').AsString = '3' then
      QRel.ParamByName('FISCAL1').AsString    :=  'O'
    else
      QRel.ParamByName('FISCAL1').AsString    :=  'S';


    if Operador.Text <> '' then
    QRel.ParamByName('OPERADOR_ID').AsInteger    := StrToInt(OPERADOR.Text);

    QRel.Prepare;
    QRel.Open;

    if QRel.IsEmpty then
      Application.MessageBox('Não há dados para os parâmetros informados', PChar(Msg_Title), mb_IconInformation)
    else
    begin
      QRel.First;
      AssignFile(MyFile, ExtractFilePath(ParamStr(0)) + 'Caixa.Txt');
      Rewrite(MyFile);

      //Início Cabeçalho fixo
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
      //Fim Cabeçalho fixo

      CabecalhoCaixas();

      if Not Chk_Sintetico.Checked then
      begin

        Vr_Fin   := 0;
        Vr_Troco := 0;
        VLC      := 0;

        while not QRel.Eof do
        begin
          if chk_caixas_separados.Checked and (QBanco.FieldByName('BANCO_ID').AsInteger <> QRel.FieldByName('CAIXA').AsInteger) then
          begin
            RodapeCaixas(Vr_Fin, Vr_Troco);
            Vr_Fin   := 0;
            Vr_Troco := 0;
            CabecalhoCaixas();
          end;

          Writeln(MyFile, QRel.FieldByName('CUPOM').AsString + '  ' +
                          ForcaComprimento(QRel.FieldByName('LEGENDA').AsString, 10, ' ') + '  '+
                          Copy(QRel.FieldByName('HORA').AsString, 1,5) + '  '+
                          ForcaComprimento(' ', (8 - Length(FormatFloat('#,##0.00', QRel.FieldByName('VALOR_FINALIZADORA').AsFloat))), ' ') +
                          FormatFloat('#,##0.00', QRel.FieldByName('VALOR_FINALIZADORA').AsFloat) + '  ' +
                          ForcaComprimento(' ', (9 - Length(FormatFloat('#,##0.00', QRel.FieldByName('DESCONTO').AsFloat))), ' ') +
                          FormatFloat('#,##0.00', QRel.FieldByName('DESCONTO').AsFloat));

          Vr_Fin   := Vr_Fin + QRel.FieldByName('VALOR_FINALIZADORA').AsFloat;
          Vr_Troco := Vr_Troco + QRel.FieldByName('DESCONTO').AsFloat;

          Application.ProcessMessages;
          QRel.Next;
        end;
      end;

      RodapeCaixas(Vr_Fin, Vr_Troco);

      if chk_caixas_separados.Checked then
      begin
        chk_caixas_separados.Checked := False;
        RodapeCaixas(0,0);
      end;

      CloseFile(MyFile);

      if (LeIni(Arq_Ini, 'Sistema', 'Imp. Orçamento') <> 'Driver Bematech')   then
      Begin
        AssignFile(MyFile, ExtractFilePath(ParamStr(0)) + 'Caixa.Txt');
        Reset(MyFile);

        Buffer := '';

        Linhas     := 1;
        Linhas_pag := 1;

        RDprint1.Abrir;

        RDprint1.Impressora        := BOBINA;
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

          Inc(Linhas);


          if linhas = 66 then
          Begin
          RDprint1.Novapagina;
          Linhas     := 1;
          End;


          Application.ProcessMessages;

        end;
        CloseFile(MyFile);
        RDprint1.TamanhoQteLinhas  := 66;
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

        Comando :=   AcionaGuilhotina(1);

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

procedure TFrmRel_Fechamento_Caixa.CabecalhoCaixas;
begin
  Writeln(MyFile, '');
  if (Caixa_Banco.Value > 0) or (chk_caixas_separados.Checked) then
  begin
    if chk_caixas_separados.Checked then
    begin
      QBanco.Close;
      QBanco.ParamByName('BANCO_ID').AsInteger   := QRel.FieldByName('CAIXA').AsInteger;
      QBanco.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
      QBanco.Prepare;
      QBanco.Open;
    end;
    Writeln(MyFile, 'Caixa: ' + StrZero(QBanco.FieldByName('BANCO_ID').AsString, 3, 0) + ' - ' + QBanco.FieldByName('DESCRICAO').AsString)
  end
  Else
    Writeln(MyFile, 'Caixa:     T O D O S');// + StrZero(Caixa_Banco.Text, 3, 0) + ' - ' + QBanco.FieldByName('DESCRICAO').AsString)

  Writeln(MyFile, '');
  Writeln(MyFile, 'Período: '+ DateToStr(Dtmen.Date)+' a '+DateToStr(Dtmai.Date));

  if Chk_PorHora.Checked then
     Writeln(MyFile, 'Horário: De '+ HoraInicial.Text+':00 as '+HoraFinal.Text+':00');



  if  not QOperador.IsEmpty then
  Writeln(MyFile, 'Operador: '  + QOperador.FieldByName('NOME').AsString);

  Writeln(MyFile, '');

  Writeln(MyFile, '------------------------------------------------');
  Writeln(MyFile, DateToStr(date) + ' - ' + TimeToStr(now));

  if Not Chk_Sintetico.Checked then
  begin
    Writeln(MyFile, '------------------------------------------------');
    Writeln(MyFile, 'Trans.    Descrição   Hora   Vr. Vda.      Desc.');
    Writeln(MyFile, '------------------------------------------------');
  end;
end;

procedure TFrmRel_Fechamento_Caixa.RodapeCaixas(Finalizadora, Troco: Real);
var
  Vr_Fin, Vr_Troco, Vr_Sangria_Resumida, Vr_Suprimento_Resumido, Valor, VLC, VLR, Vr_Caixa: Real;
  Legenda: string;
begin
  Vr_Fin := Finalizadora;
  Vr_Troco := Troco;
  Vr_Caixa := 0;

  if (not Chk_Sintetico.Checked) and (Vr_Fin > 0) then
  begin
    Writeln(MyFile, '                           ---------------------');
    Writeln(MyFile, ForcaComprimento(' ', 28, ' ') +
                    ForcaComprimento(' ', (9 - Length(FormatFloat('#,##0.00', Vr_Fin))), ' ') +
                    FormatFloat('#,##0.00', Vr_Fin) + '  ' +
                    ForcaComprimento(' ', (9 - Length(FormatFloat('#,##0.00', Vr_Troco))), ' ') +
                    FormatFloat('#,##0.00', Vr_Troco));
    Writeln(MyFile, '');
    Writeln(MyFile, 'Vr. Líquido: ' + FormatFloat('#,##0.00',  (Vr_Fin)));
    Writeln(MyFile, '');
  end;

  QFechamento.Sql.Clear;
  QFechamento.Sql.Add('SELECT LEGENDA, TIPO_TRANSACAO, SUM(VALOR) VALOR, SUM(VALOR_FINALIZADORA) VALOR_FINALIZADORA');
  QFechamento.Sql.Add('FROM');
  QFechamento.Sql.Add('(');
  QFechamento.Sql.Add('SELECT FECHAMENTO_CUPOM.LEGENDA, TIPO_TRANSACAO, CASE WHEN (VALOR_CUPOM + ACRESCIMO - DESCONTO) > VALOR_FINALIZADORA ');
  QFechamento.Sql.Add('THEN (VALOR_FINALIZADORA) ELSE (VALOR_CUPOM) END VALOR , VALOR_FINALIZADORA');
  QFechamento.Sql.Add('FROM FECHAMENTO_CUPOM');
  QFechamento.Sql.Add('INNER JOIN FINALIZADORAS ON FINALIZADORAS.FINALIZADORA_ID = FECHAMENTO_CUPOM.FINALIZADORA_ID::INTEGER');
  QFechamento.Sql.Add('LEFT JOIN OPERADORES ON (CAST(OPERADORES.OPERADOR_ID AS INTEGER) = FECHAMENTO_CUPOM.OPERADOR_ID)');
  QFechamento.Sql.Add('WHERE');
  QFechamento.Sql.Add('(DATA BETWEEN :DT_INICIAL AND :DT_FINAL)');

  IF chk_finalizadora.Checked Then
  Begin
    QFechamento.Sql.Add('AND (CAST(FECHAMENTO_CUPOM.FINALIZADORA_ID AS INTEGER) = :FINALIZADORA_ID)');
    QFechamento.ParamByName('FINALIZADORA_ID').AsInteger :=  1; //QFinalizadora.FieldByName('FINALIZADORA_ID').AsInteger;
  End;

  QFechamento.Sql.Add('AND (CAIXA_ID IN (SELECT BANCO_ID FROM BANCOS WHERE TIPO_LIMITE <> ' +#39 + 'EXCLUSO DO SALDO' + #39' ))');

  if (Chk_PorHora.Checked) then
     QFechamento.Sql.Add('AND (CAST(HORA AS TIME) BETWEEN CAST(:H_INICIAL AS TIME) AND CAST(:H_FINAL AS TIME))');

  if (Caixa_Banco.Value > 0) or (chk_caixas_separados.Checked) then
  QFechamento.Sql.Add('AND (CAIXA_ID = :CAIXA_ID)');

  QFechamento.Sql.Add('AND (VALOR_FINALIZADORA > 0)');
  QFechamento.Sql.Add('AND (FECHAMENTO_CUPOM.LEGENDA <> :LEGENDA)');
  QFechamento.Sql.Add('AND ((FISCAL = :FISCAL) OR (FISCAL = :FISCAL1))');

  if operador.Text <> '' then
  QFechamento.Sql.Add('AND (FECHAMENTO_CUPOM.OPERADOR_ID = :OPERADOR) ');
  {
  QFechamento.Sql.Add('UNION ALL');
  QFechamento.Sql.Add('SELECT FECHAMENTO_CUPOM.LEGENDA, TIPO_TRANSACAO, CASE WHEN (VALOR_CUPOM) = VALOR_FINALIZADORA ');
  QFechamento.Sql.Add('THEN (VALOR_CUPOM + ACRESCIMO - DESCONTO) WHEN (VALOR_CUPOM + ACRESCIMO - DESCONTO) > VALOR_FINALIZADORA ');
  QFechamento.Sql.Add('THEN (VALOR_FINALIZADORA) ELSE (VALOR_CUPOM + ACRESCIMO - DESCONTO) END VALOR , VALOR_FINALIZADORA');
  QFechamento.Sql.Add('FROM FECHAMENTO_CUPOM');
  QFechamento.Sql.Add('INNER JOIN FINALIZADORAS ON FINALIZADORAS.FINALIZADORA_ID = FECHAMENTO_CUPOM.FINALIZADORA_ID::INTEGER');
  QFechamento.Sql.Add('LEFT JOIN OPERADORES ON (CAST(OPERADORES.OPERADOR_ID AS INTEGER) = FECHAMENTO_CUPOM.OPERADOR_ID)');
  QFechamento.Sql.Add('WHERE');
  QFechamento.Sql.Add('(DATA BETWEEN :DT_INICIAL AND :DT_FINAL)');

  IF chk_finalizadora.Checked Then
  Begin
    QFechamento.Sql.Add('AND (CAST(FECHAMENTO_CUPOM.FINALIZADORA_ID AS INTEGER) = :FINALIZADORA_ID)');
    QFechamento.ParamByName('FINALIZADORA_ID').AsInteger := 1; //QFinalizadora.FieldByName('FINALIZADORA_ID').AsInteger;
  End;

  QFechamento.Sql.Add('AND (CAIXA_ID IN (SELECT BANCO_ID FROM BANCOS WHERE TIPO_LIMITE <> ' +#39 + 'EXCLUSO DO SALDO' + #39' ))');

  if (Chk_PorHora.Checked) then
     QFechamento.Sql.Add('AND (CAST(HORA AS TIME) BETWEEN CAST(:H_INICIAL AS TIME) AND CAST(:H_FINAL AS TIME))');

  if (Caixa_Banco.Value > 0) or (chk_caixas_separados.Checked) then
  QFechamento.Sql.Add('AND (CAIXA_ID = :CAIXA_ID)');

  QFechamento.Sql.Add('AND (VALOR_FINALIZADORA < 0)');
  QFechamento.Sql.Add('AND (FECHAMENTO_CUPOM.LEGENDA <> :LEGENDA)');
  QFechamento.Sql.Add('AND ((FISCAL = :FISCAL) OR (FISCAL = :FISCAL1))');

  if operador.Text <> '' then
  QFechamento.Sql.Add('AND (FECHAMENTO_CUPOM.OPERADOR_ID = :OPERADOR) ');
  }
  QFechamento.Sql.Add('UNION ALL');

  //if chk_recebimento.Checked Then
  QFechamento.Sql.Add('SELECT FINALIZADORAS.LEGENDA || '' Recebimento'' LEGENDA, TIPO_TRANSACAO, SUM(VALOR) VALOR_FINALIZADORA, 0 VALOR ');
  //Else
  //QFechamento.Sql.Add('SELECT FINALIZADORAS.LEGENDA, TIPO_TRANSACAO, SUM(VALOR) VALOR_FINALIZADORA, VALOR ');

  QFechamento.Sql.Add('FROM TRANSACOES');
  QFechamento.SQL.Add('INNER JOIN FINALIZADORAS ON FINALIZADORAS.FINALIZADORA_ID = TRANSACOES.FINALIZADORA_ID');
  QFechamento.SQL.Add('LEFT JOIN OPERADORES ON OPERADORES.NOME = TRANSACOES.OPERADOR');
  QFechamento.Sql.Add('WHERE');
  QFechamento.Sql.Add('(DT_ENT_SAI BETWEEN :DT_INICIAL AND :DT_FINAL)');
  QFechamento.Sql.Add(' AND (CONDUTA = :CONDUTA) ');

  if (Caixa_Banco.Value > 0) or (chk_caixas_separados.Checked) then
  QFechamento.SQL.Add('AND (BANCO_ID = :CAIXA_ID)');

  IF chk_finalizadora.Checked Then
  Begin
    QFechamento.Sql.Add('AND (TRANSACOES.FINALIZADORA_ID = :FINALIZADORA_ID)');
    QFechamento.ParamByName('FINALIZADORA_ID').AsInteger := QFinalizadora.FieldByName('FINALIZADORA_ID').AsInteger;
  End;

   if operador.Text <> '' then
  QFechamento.Sql.Add('AND (OPERADORES.OPERADOR_ID = :OPERADORQ)');

  QFechamento.Sql.Add('GROUP BY LEGENDA, TIPO_TRANSACAO');
  QFechamento.Sql.Add(') AS TESTE');
  QFechamento.Sql.Add('GROUP BY LEGENDA, TIPO_TRANSACAO');

  if (Chk_PorHora.Checked) then
  Begin
     QFechamento.ParamByName('H_INICIAL').AsTime := StrToTime(HoraInicial.Text+':00');
     QFechamento.ParamByName('H_FINAL').AsTime   := StrToTime(HoraFinal.Text+':00');
  End;

  QFechamento.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
  QFechamento.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;

  if (Caixa_Banco.Value > 0) or (chk_caixas_separados.Checked) then
  QFechamento.ParamByName('CAIXA_ID').AsInteger    := QBanco.FieldByName('BANCO_ID').AsInteger;

  QFechamento.ParamByName('CONDUTA').AsString      := '07';
  QFechamento.ParamByName('LEGENDA').AsString      := 'Cancelado';
  QFechamento.ParamByName('FISCAL').AsString       := 'S';
  QFechamento.ParamByName('FISCAL1').AsString      := 'O';



  if operador.Text <> '' then
  QFechamento.ParamByName('OPERADOR').AsInteger := StrToInt(operador.text);

  if operador.Text <> '' then
  QFechamento.ParamByName('OPERADORQ').AsString := StrZero(operador.text,14,0);


  QFechamento.Prepare;
  QFechamento.Open;

  //Sangria e suprimento resumidos
  QSangriaSuprimentoSintetico.SQL.Clear;
  QSangriaSuprimentoSintetico.SQL.Add('SELECT LEGENDA, SUM(VALOR_CUPOM) VALOR FROM (');
  QSangriaSuprimentoSintetico.SQL.Add('SELECT CASE WHEN (VALOR_CUPOM) < 0 THEN (''Sangria'') ELSE (''Suprimento'')  END LEGENDA,');
  QSangriaSuprimentoSintetico.SQL.Add('VALOR_CUPOM');
  QSangriaSuprimentoSintetico.SQL.Add('FROM FECHAMENTO_CUPOM');
  QSangriaSuprimentoSintetico.SQL.Add('WHERE');
  QSangriaSuprimentoSintetico.SQL.Add('(DATA BETWEEN :DT_INICIAL AND :DT_FINAL)');

  if (Caixa_Banco.Value > 0) or (chk_caixas_separados.Checked) then
  QSangriaSuprimentoSintetico.SQL.Add('AND (CAIXA_ID = :CAIXA_ID)');

  if operador.Text <> '' then
  QSangriaSuprimentoSintetico.SQL.Add('AND (OPERADOR_ID = :OPERADOR_ID)');

  QSangriaSuprimentoSintetico.SQL.Add('AND FISCAL = :FISCAL');
  QSangriaSuprimentoSintetico.Sql.Add('AND (LEGENDA <> :LEGENDA)');

  QSangriaSuprimentoSintetico.SQL.Add(')AS TESTE GROUP BY LEGENDA');

  QSangriaSuprimentoSintetico.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
  QSangriaSuprimentoSintetico.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;

  if (Caixa_Banco.Value > 0) or (chk_caixas_separados.Checked) then
  QSangriaSuprimentoSintetico.ParamByName('CAIXA_ID').AsInteger    := QBanco.FieldByName('BANCO_ID').AsInteger;

  if operador.Text <> '' then
  QSangriaSuprimentoSintetico.ParamByName('OPERADOR_ID').AsInteger := StrToInt(OPERADOR.Text);;

  QSangriaSuprimentoSintetico.ParamByName('FISCAL').AsString       := 'N';
  QSangriaSuprimentoSintetico.ParamByName('LEGENDA').AsString      := 'Cancelado';

  QSangriaSuprimentoSintetico.Prepare;
  QSangriaSuprimentoSintetico.Open;
  QSangriaSuprimentoSintetico.First;

  Vr_Sangria_Resumida := 0;
  Vr_Suprimento_Resumido := 0;

  if QSangriaSuprimentoSintetico.RecordCount > 0 then
  begin
    while not QSangriaSuprimentoSintetico.Eof do
    begin
      //ShowMessage(QSangriaSuprimentoSintetico.FieldByName('LEGENDA').AsString);
      if QSangriaSuprimentoSintetico.FieldByName('LEGENDA').AsString = 'Sangria' then
        Vr_Sangria_Resumida := QSangriaSuprimentoSintetico.FieldByName('VALOR').AsFloat
      else
        Vr_Suprimento_Resumido := QSangriaSuprimentoSintetico.FieldByName('VALOR').AsFloat;

      QSangriaSuprimentoSintetico.Next
    end;
    //ShowMessage('Sangria ' + FloatToStr(Vr_Sangria_Resumida) + ' ' + 'Suprimento ' + FloatToStr(Vr_Suprimento_Resumido));
  end;

  if Vr_Fin > 0 then
  begin
    Writeln(MyFile, '                     RESUMO                     ');
    Writeln(MyFile, '                     ======                     ');
  end
  else
  begin
    Writeln(MyFile, '                  RESUMO GERAL                    ');
    Writeln(MyFile, '                  ============                    ');
  end;
  Writeln(MyFile, '------------------------------------------------');
  Writeln(MyFile, 'Descrição                                  Valor');
  Writeln(MyFile, '------------------------------------------------');

  Legenda := '';
  Valor := 0;
  Vr_Fin := 0;

  QFechamento.First;
  while not QFechamento.Eof do
  begin

    //if Chk_Sintetico.Checked then
    //begin

      //if Trim(LowerCase(QFechamento.FieldByName('LEGENDA').AsString)) = 'dinheiro' then
      //begin
      //  Writeln(MyFile, ForcaComprimento(QFechamento.FieldByName('LEGENDA').AsString, 39, ' ') +
      //    ForcaComprimento(' ', (9 - Length(FormatFloat('#,##0.00', (QFechamento.FieldByName('VALOR').AsFloat + Vr_Suprimento_Resumido + Vr_Sangria_Resumida) ))), ' ') +
      //    FormatFloat('#,##0.00', QFechamento.FieldByName('VALOR').AsFloat + Vr_Suprimento_Resumido + Vr_Sangria_Resumida));
      //end
      //else
      //begin
      // if QFechamento.FieldByName('VALOR').AsFloat > 0 Then
      //  Writeln(MyFile, ForcaComprimento(QFechamento.FieldByName('LEGENDA').AsString, 39, ' ') +
      //    ForcaComprimento(' ', (9 - Length(FormatFloat('#,##0.00', (QFechamento.FieldByName('VALOR').AsFloat) ))), ' ') +
      //    FormatFloat('#,##0.00', QFechamento.FieldByName('VALOR').AsFloat));
      //end;
      //Vr_Fin := Vr_Fin +  QFechamento.FieldByName('VALOR').AsFloat
    //end
    //else
    //begin
     if QFechamento.FieldByName('VALOR').AsFloat > 0 Then
     Writeln(MyFile, ForcaComprimento(QFechamento.FieldByName('LEGENDA').AsString, 39, ' ') +
            ForcaComprimento(' ', (9 - Length(FormatFloat('#,##0.00', QFechamento.FieldByName('VALOR').AsFloat))), ' ') +
            FormatFloat('#,##0.00', QFechamento.FieldByName('VALOR').AsFloat));


     Vr_Fin := Vr_Fin +  QFechamento.FieldByName('VALOR').AsFloat;
    //end;

    if (QFechamento.FieldByName('TIPO_TRANSACAO').AsInteger = 1) and (QFechamento.FieldByName('VALOR').AsFloat > 0) then
      Vr_Caixa := Vr_Caixa + QFechamento.FieldByName('VALOR').AsFloat;

    Application.ProcessMessages;
    QFechamento.Next;
  end;

  Vr_Caixa := Vr_Caixa + Vr_Suprimento_Resumido + Vr_Sangria_Resumida;

  Writeln(MyFile, '                                       ---------');
  if Chk_Sintetico.Checked then
  begin
    Writeln(MyFile, ForcaComprimento('Sub-Total', 48 - Length(FormatFloat('#,##0.00', Vr_Fin + Vr_Suprimento_Resumido + Vr_Sangria_Resumida)), ' ') + FormatFloat('#,##0.00', Vr_Fin + Vr_Suprimento_Resumido + Vr_Sangria_Resumida));
  end
  else
  begin
    Writeln(MyFile, ForcaComprimento('Sub-Total', 48 - Length(FormatFloat('#,##0.00', Vr_Fin)), ' ') + FormatFloat('#,##0.00', Vr_Fin));
  end;

  QFechamento.SQL.Clear;
  QFechamento.SQL.Add('SELECT DATA, HORA,CAIXA_ID, LEGENDA, VALOR_CUPOM');
  QFechamento.SQL.Add('FROM FECHAMENTO_CUPOM');
  QFechamento.SQL.Add('WHERE');
  QFechamento.SQL.Add('(DATA BETWEEN :DT_INICIAL AND :DT_FINAL)');

  if (Caixa_Banco.Value > 0) or (chk_caixas_separados.Checked) then
  QFechamento.SQL.Add('AND (CAIXA_ID = :CAIXA_ID)');

  if operador.Text <> '' then
  QFechamento.SQL.Add('AND (OPERADOR_ID = :OPERADOR_ID)');

  QFechamento.SQL.Add('AND FISCAL = :FISCAL');
  QFechamento.Sql.Add('AND (LEGENDA <> :LEGENDA)');

  QFechamento.SQL.Add('ORDER BY DATA,HORA');

  QFechamento.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
  QFechamento.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;

  if (Caixa_Banco.Value > 0) or (chk_caixas_separados.Checked) then
  QFechamento.ParamByName('CAIXA_ID').AsInteger    := QBanco.FieldByName('BANCO_ID').AsInteger;

  if operador.Text <> '' then
  QFechamento.ParamByName('OPERADOR_ID').AsInteger := StrToInt(OPERADOR.Text);;

  QFechamento.ParamByName('FISCAL').AsString       := 'N';
  QFechamento.ParamByName('LEGENDA').AsString     := 'Cancelado';

  QFechamento.Prepare;
  QFechamento.Open;
  QFechamento.First;

  if NOT QFechamento.IsEmpty Then
  Begin
   Writeln(MyFile, ' ');
   Writeln(MyFile, '------------------------------------------------');
   Writeln(MyFile, '***************Sangria/Suprimento***************');
   Writeln(MyFile, '------------------------------------------------');
  End;

  if Chk_Sintetico.Checked then
  begin
    if QSangriaSuprimentoSintetico.RecordCount > 0 then
    QSangriaSuprimentoSintetico.First;
    begin
      while not QSangriaSuprimentoSintetico.Eof do
        begin
          if QSangriaSuprimentoSintetico.FieldByName('LEGENDA').AsString = 'Sangria' then
            Writeln(MyFile,'Sangria   : ' + ' R$' + FormatFloat('#,##0.00', QSangriaSuprimentoSintetico.FieldByName('VALOR').AsFloat))
          else
            Writeln(MyFile,'Suprimento: ' + ' R$' + FormatFloat('#,##0.00', QSangriaSuprimentoSintetico.FieldByName('VALOR').AsFloat));

          Application.ProcessMessages;
          QSangriaSuprimentoSintetico.Next
        end;
    end;
  end
  else
  begin
    while not QFechamento.Eof do
    begin
      if QFechamento.FieldByName('VALOR_CUPOM').AsFloat > 0 then
      Begin
        Writeln(MyFile, 'Suprimento: ' + DateToStr(QFechamento.FieldByName('DATA').AsDateTime) + ' - ' + QFechamento.FieldByName('HORA').AsString +
          ' - R$' + FormatFloat('#,##0.00',  QFechamento.FieldByName('VALOR_CUPOM').AsFloat));

      End
      Else
      Begin
        Writeln(MyFile,'Sangria   : ' + DateToStr(QFechamento.FieldByName('DATA').AsDateTime) + ' - ' + QFechamento.FieldByName('HORA').AsString +
          ' - R$' + FormatFloat('#,##0.00',QFechamento.FieldByName('VALOR_CUPOM').AsFloat));
      End;

      Application.ProcessMessages;
      QFechamento.Next;
    end;
  end;



  QFechamento.SQL.Clear;
  QFechamento.SQL.Add('SELECT CUPOM,DATA, HORA,CAIXA_ID, LEGENDA, SUM(VALOR_FINALIZADORA) VALOR_FINALIZADORA');
  QFechamento.SQL.Add('FROM FECHAMENTO_CUPOM');
  QFechamento.SQL.Add('WHERE');
  QFechamento.SQL.Add('(DATA BETWEEN :DT_INICIAL AND :DT_FINAL)');

  if (Caixa_Banco.Value > 0) or (chk_caixas_separados.Checked) then
  QFechamento.SQL.Add('AND (CAIXA_ID = :CAIXA_ID)');

  if operador.Text <> '' then
  QFechamento.SQL.Add('AND (OPERADOR_ID = :OPERADOR_ID)' );

  QFechamento.SQL.Add('AND (LEGENDA = :LEGENDA) GROUP BY CUPOM,DATA,HORA,CAIXA_ID,LEGENDA');
  QFechamento.SQL.Add('ORDER BY DATA,HORA');

  QFechamento.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
  QFechamento.ParamByName('DT_FINAL').AsDateTime := Dtmen.Date;

  if (Caixa_Banco.Value > 0) or (chk_caixas_separados.Checked) then
  QFechamento.ParamByName('CAIXA_ID').AsInteger := QBanco.FieldByName('BANCO_ID').AsInteger;

  if operador.Text <> '' then
  QFechamento.ParamByName('OPERADOR_ID').AsInteger := StrToInt(OPERADOR.Text);;

  QFechamento.ParamByName('LEGENDA').AsString       := 'Cancelado';


  QFechamento.Prepare;
  QFechamento.Open;
  QFechamento.First;

  if NOT QFechamento.IsEmpty Then
  Begin
   Writeln(MyFile, ' ');
   Writeln(MyFile, '------------------------------------------------');
   Writeln(MyFile, '*****************Cancelados*********************');
   Writeln(MyFile, '------------------------------------------------');

    VLC := 0;
    while not QFechamento.Eof do
    begin
      if QFechamento.FieldByName('VALOR_FINALIZADORA').AsFloat > 0 then
        Writeln(MyFile, 'Cancelado: ' + QFechamento.FieldByName('CUPOM').AsString + ' - ' + QFechamento.FieldByName('HORA').AsString +
          ' - R$' + FormatFloat('#,##0.00',  QFechamento.FieldByName('VALOR_FINALIZADORA').AsFloat));

       VLC :=  QFechamento.FieldByName('VALOR_FINALIZADORA').AsFloat + VLC;

      Application.ProcessMessages;
      QFechamento.Next;
    end;

     Writeln(MyFile, ' ');
     Writeln(MyFile,'Total Cancelados: ' + FormatFloat('#,##0.00', VLC));
     Writeln(MyFile, ' ');
     Writeln(MyFile, '------------------------------------------------');
  End;

  if chk_recebimento.Checked Then
  Begin
    QFechamento.SQL.Clear;
    QFechamento.SQL.Add('SELECT TRANSACOES.TRANSACAO_ID, HORA,VALOR, FINALIZADORAS.LEGENDA ');
    QFechamento.SQL.Add('FROM TRANSACOES');
    QFechamento.SQL.Add('INNER JOIN FINALIZADORAS ON FINALIZADORAS.FINALIZADORA_ID = TRANSACOES.FINALIZADORA_ID');
    QFechamento.SQL.Add('WHERE DT_ENT_SAI BETWEEN :DT_INICIAL AND :DT_FINAL AND CONDUTA = :CONDUTA');

    if (Caixa_Banco.Value > 0) or (chk_caixas_separados.Checked) then
    QFechamento.SQL.Add('AND BANCO_ID = :BANCO_ID');

    //QRel.SQL.Add('GROUP BY FINALIZADORAS.LEGENDA ORDER BY FINALIZADORAS.LEGENDA');

    QFechamento.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
    QFechamento.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;

    if (Caixa_Banco.Value > 0) or (chk_caixas_separados.Checked) then
    QFechamento.ParamByName('BANCO_ID').AsInteger    := QBanco.FieldByName('BANCO_ID').AsInteger;

    IF chk_finalizadora.Checked Then
    Begin
      QFechamento.Sql.Add('AND (TRANSACOES.FINALIZADORA_ID = :FINALIZADORA_ID)');
      QFechamento.ParamByName('FINALIZADORA_ID').AsInteger := QFinalizadora.FieldByName('FINALIZADORA_ID').AsInteger;
    End;

    QFechamento.ParamByName('CONDUTA').AsString      := '07';

    QFechamento.Prepare;
    QFechamento.Open();


    if NOT QFechamento.IsEmpty Then
    Begin
    Writeln(MyFile, ' ');
    Writeln(MyFile, '------------------------------------------------');
    Writeln(MyFile, '******************Recebimento*******************');
    Writeln(MyFile, '------------------------------------------------');
    End;

    VLR := 0;
    while not QFechamento.Eof do
    begin

      Writeln(MyFile, QFechamento.FieldByName('LEGENDA').AsString + ': ' + QFechamento.FieldByName('TRANSACAO_ID').AsString + ' - ' + QFechamento.FieldByName('HORA').AsString +
        ' - R$' + FormatFloat('#,##0.00',  QFechamento.FieldByName('VALOR').AsFloat));

      VLR :=  QFechamento.FieldByName('VALOR').AsFloat + VLR;

      Application.ProcessMessages;
      QFechamento.Next;
    end;

    Writeln(MyFile, ' ');
    Writeln(MyFile,'Total Recebimentos: ' + FormatFloat('#,##0.00', VLR));
  End;

  if (not chk_finalizadora.Checked) or (QFinalizadora.FieldByName('TIPO_TRANSACAO').AsInteger = 1) then
  begin
    Writeln(MyFile, '------------------------------------------------');
    Writeln(MyFile, ForcaComprimento('Dinheiro em Caixa:', 48 - Length(FormatFloat('#,##0.00', Vr_Caixa)), ' ') + FormatFloat('#,##0.00', Vr_Caixa));
  end;

  for Linhas := 1 to StrToInt(LeIni(Arq_Ini, 'Sistema', 'Linhas')) do
    Writeln(MyFile, ' ');
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
  begin
    SearchBanco;
    chk_caixas_separados.Checked := False;
    chk_caixas_separados.Enabled := False;
    chk_caixas_separados.Visible := False;
  end
  else
  begin
    DBText1.Caption := '';
    chk_caixas_separados.Enabled := True;
    chk_caixas_separados.Visible := True;
  end;
end;

procedure TFrmRel_Fechamento_Caixa.Caixa_BancoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = Caixa_Banco) then
    btnCaixa_BancoClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmRel_Fechamento_Caixa.chk_finalizadoraClick(Sender: TObject);
begin
 if chk_finalizadora.Checked Then
 Begin
  QFinalizadora.Prepare;
  QFinalizadora.Open;

  Finalizadora_id.KeyValue := 1;
  Finalizadora_id.Enabled  := True;
 End
 Else
 Begin
 Qfinalizadora.Close();
 finalizadora_id.Enabled := False;
 End;

end;

procedure TFrmRel_Fechamento_Caixa.Chk_PorHoraClick(Sender: TObject);
begin
    if Chk_PorHora.Checked = True then
    begin
      HoraInicial.Enabled := True;

      if HoraInicial.CanFocus then
         HoraInicial.SetFocus;

      Label5.Enabled := True;
      HoraFinal.Enabled := True;
      Label4.Enabled := True;
    end
    else
    begin
      HoraInicial.Enabled := False;
      Label5.Enabled := False;
      HoraFinal.Enabled := False;
      Label4.Enabled := False;
    end;
end;

procedure TFrmRel_Fechamento_Caixa.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmRel_Fechamento_Caixa.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    //Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmRel_Fechamento_Caixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmRel_Fechamento_Caixa.FormCreate(Sender: TObject);
begin
  Dtmen.Date := Date;// StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Date;//Ult_Dia_Mes(date);

  HoraInicial.Text := '00:00';
  HoraFinal.Text   := '00:00';



end;

procedure TFrmRel_Fechamento_Caixa.HoraFinalKeyPress(Sender: TObject;
  var Key: Char);
begin


  if Key = #13 then
  begin
   Key:= #0;
   Perform(Wm_NextDlgCtl,0,0);
  end;

end;

procedure TFrmRel_Fechamento_Caixa.HoraInicialKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = #13 then
  begin
   Key:= #0;
   Perform(Wm_NextDlgCtl, 0, 0);
  end;

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
