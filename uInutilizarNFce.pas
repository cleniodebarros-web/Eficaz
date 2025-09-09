unit uInutilizarNFce;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ACBrBase, ACBrDFe, ACBrNFe,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, ShellApi, Vcl.Buttons;

type
  TfrmInutilizarNfce = class(TForm)
    lblSerie: TLabel;
    edtSerie: TEdit;
    lblMotivo: TLabel;
    edtMotivo: TEdit;
    lblCuponsInutilizacao: TLabel;
    consulta_sql_classe: TFDQuery;
    memoCuponsInutilizacao: TMemo;
    btnInutilizar: TButton;
    procedure valida_numeracao_inutiliacao();
    procedure inutiliza_nfce_sefaz(lista_nfce: Tstringlist; cnpj: String; serie_nfce: String; ano_inutilizacao: String; conecta: TFDQuery);
    procedure inutiliza_bd(num_doc: String; serie: String);
    function consulta_status_sefaz():Boolean;
    procedure relatorio_inutilizacoes(lista_resultado_inutilizacoes: TStringlist);
    procedure mensagem_status(mensagem: String);
    procedure mensagem_status_configura_barra(maximo: Integer; inicio: Integer);
    procedure mensagem_status_atualiza_barra(valor: Integer);
    procedure FormActivate(Sender: TObject);
    procedure memoCuponsInutilizacaoChange(Sender: TObject);
    procedure btnInutilizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    string_teste: String;
    AcbrInutilizacao: TACBrNFe;
    cnpj: String;
    serie_inutilizacao: String;
    ano_inutilizacao: String;
    conexao_postgres_classe: TFDQuery;
    empresa_id_unutilizacao: String;
  end;

var
  frmInutilizarNfce: TfrmInutilizarNfce;

implementation

{$R *.dfm}

uses uMensagemStatus;

procedure TfrmInutilizarNfce.mensagem_status_atualiza_barra(valor: Integer);
begin
  frmMensagemStatus.ProgressBar1.Position := valor;
  Application.ProcessMessages;
  frmMensagemStatus.BringToFront;
end;

procedure TfrmInutilizarNfce.mensagem_status_configura_barra(maximo: Integer; inicio: Integer);
begin
  if (maximo = 0) and (inicio = 0) then
    begin

      //frmMensagemStatus.ProgressBar1.Hide;
      frmMensagemStatus.ProgressBar1.Max := 100;
      frmMensagemStatus.ProgressBar1.Position := 100;
      //frmMensagemStatus.Gif.Show;
      Application.ProcessMessages;
    end
  else
    begin
      frmMensagemStatus.ProgressBar1.Show;
      //frmMensagemStatus.Gif.Hide;
      frmMensagemStatus.ProgressBar1.Max := maximo;
      frmMensagemStatus.ProgressBar1.Position := inicio;
      Application.ProcessMessages;
    end;



end;

procedure TfrmInutilizarNfce.mensagem_status(mensagem: String);

begin

  if not Assigned(frmMensagemStatus) then
    begin
      frmMensagemStatus := TfrmMensagemStatus.Create(Application);
      frmMensagemStatus.BringToFront;
    end;

  if mensagem = '' then
    frmMensagemStatus.Hide
  else
    begin
      frmMensagemStatus.Show;
      frmMensagemStatus.lblStatus.Caption := mensagem;
      Application.ProcessMessages;
      frmMensagemStatus.BringToFront;
    end;

end;

procedure TfrmInutilizarNfce.btnInutilizarClick(Sender: TObject);
var
  motivo_inutilizacao: String;

begin

  Self.mensagem_status('Validando mensagem da inutilização.');
  Self.mensagem_status_configura_barra(0, 0);

  if not consulta_status_sefaz() then
    begin
      Abort;
    end;

  motivo_inutilizacao := Trim(edtMotivo.Text);

  if (motivo_inutilizacao.Length < 15) or (motivo_inutilizacao.Length > 255) then
    begin
      Self.mensagem_status('');
      Application.MessageBox(PChar('O motivo da inutilização deve ter entre 15 a 255 letras.'), 'Erro', MB_ICONHAND + MB_OK + MB_TASKMODAL);
      //lblStatus.Caption := '';
      Abort;
    end;

  if (edtSerie.Text = '') or  (StrToInt(edtSerie.Text) <= 0) then
    begin
      Self.mensagem_status('');
      Application.MessageBox(PChar('Série Inválida.'), 'Erro', MB_ICONHAND + MB_OK + MB_TASKMODAL);
      //lblStatus.Caption := '';
      Abort;
    end;

  valida_numeracao_inutiliacao();

end;

function TfrmInutilizarNfce.consulta_status_sefaz():Boolean;
begin
  //lblStatus.Caption := 'Consultando status Sefaz.';
  Self.mensagem_status('Consultando status Sefaz');
  Application.ProcessMessages;
  try
    AcbrInutilizacao.WebServices.StatusServico.Executar;
  except on E: Exception do
    begin
      //lblStatus.Caption := 'Sefaz não responde';
      Application.ProcessMessages;
      Self.mensagem_status('');
      Application.MessageBox(PChar(E.Message), 'Erro', MB_ICONHAND + MB_OK + MB_TASKMODAL);
      //ShowMessage(ACBrNFe.WebServices.StatusServico.xMotivo);
      Result := False;
      Abort;
    end;
  end;
  Result := True;
  //ShowMessage(AcbrInutilizacao.WebServices.StatusServico.RetWS);
  //ShowMessage(AcbrInutilizacao.WebServices.StatusServico.xMotivo);
end;

procedure TfrmInutilizarNfce.FormActivate(Sender: TObject);
begin
  edtSerie.Text := Self.serie_inutilizacao;
  memoCuponsInutilizacao.Hint := 'Separe os números com vírgula, Ex: 122, 256, 789';
  memoCuponsInutilizacao.ShowHint := True;
  memoCuponsInutilizacao.SetFocus;

end;

procedure TfrmInutilizarNfce.valida_numeracao_inutiliacao();

var
  lista_verificacao: TStringlist;
  lista_numeracao_validada: TStringlist;
  texto_inutilizacao: String;
  contador_laco_array: Integer;
  numero_cupom: String;

begin
  lista_verificacao := TStringList.Create();
  lista_numeracao_validada := TStringList.Create();
  texto_inutilizacao := edtMotivo.Text;
  Self.mensagem_status('Validando numerações para inutilização.');
  //lblStatus.Caption := 'Validando numerações para inutilização ...';
  Application.ProcessMessages;

  //ShowMessage(texto_inutilizacao);
  try
    ExtractStrings([','], [], PChar(memoCuponsInutilizacao.Lines.Text), lista_verificacao);
    //WriteLn(List.Text);
    //ReadLn;
  finally

  end;

  //ShowMessage(IntToStr(lista_numeracao_validada.Count));

  if lista_verificacao.Count > 0 then
    begin
    contador_laco_array := 0;
    //lblStatus.Caption := 'Validando numerações para inutilização ...';
    Application.ProcessMessages;
    while contador_laco_array < lista_verificacao.Count do
      begin
        numero_cupom := '';
        //OutputDebugString(Pchar(lista_verificacao[contador_laco_array]));
        numero_cupom := Trim(lista_verificacao[contador_laco_array]);
        try
          begin
            StrToInt(numero_cupom);
          end;
        except
          begin
            //lblStatus.Caption := '';
            Application.ProcessMessages;
            Self.mensagem_status('');
            Application.MessageBox(PChar('O número ->' + numero_cupom + ' está incorreto.'), 'Erro', MB_ICONHAND + MB_OK + MB_TASKMODAL);
            Abort;
          end;
        end;
        lista_numeracao_validada.Append(numero_cupom);
        Inc(contador_laco_array, 1)
      end;

    //ShowMessage(IntToStr(lista_verificacao.Count));
    inutiliza_nfce_sefaz(lista_numeracao_validada, cnpj, serie_inutilizacao, ano_inutilizacao, consulta_sql_classe);
    end
  else
    begin
      Self.mensagem_status('');
      Application.MessageBox(PChar('Insira a numeração para inutilização.'), 'Erro', MB_ICONHAND + MB_OK + MB_TASKMODAL);
      //lblStatus.Caption := '';
      Application.ProcessMessages;
    end;

  lista_numeracao_validada.Free;


end;

procedure TfrmInutilizarNfce.inutiliza_nfce_sefaz(lista_nfce: Tstringlist; cnpj: String; serie_nfce: String; ano_inutilizacao: String; conecta: TFDQuery);

var
  lista_resultado_inutilizacoes: TStringList;
  contador_laco: Integer;
  numero_inutilizacao: String;
  status_resultado_inutilizacao: Boolean;

begin
  lista_resultado_inutilizacoes := TStringList.Create();

  Self.mensagem_status_configura_barra(lista_nfce.Count, 0);
  contador_laco := 0;
  while contador_laco < lista_nfce.Count  do
    begin
      //OutputDebugString(Pchar('->' + lista_nfce[contador_laco]));
      status_resultado_inutilizacao := False;
      numero_inutilizacao := lista_nfce[contador_laco];
      lista_resultado_inutilizacoes.Append(numero_inutilizacao);
      Self.mensagem_status('Inutilizando Nfce número ' + numero_inutilizacao);
      Self.mensagem_status_atualiza_barra(contador_laco + 1);
      //lblStatus.Caption := 'Inutilizando Nfce ' + numero_inutilizacao;
      Application.ProcessMessages;

      try
        AcbrInutilizacao.WebServices.Inutiliza(cnpj, edtMotivo.Text, StrToInt(ano_inutilizacao), 65, StrToInt(serie_nfce), StrToInt(numero_inutilizacao), StrToInt(numero_inutilizacao));
        status_resultado_inutilizacao := True;
      except on E: Exception do
        begin
          status_resultado_inutilizacao := False;
          OutputDebugString(Pchar(numero_inutilizacao + '->' + E.Message));
          lista_resultado_inutilizacoes.Append('Erro');
          lista_resultado_inutilizacoes.Append(E.Message);
          //Abort;
        end;
      end;

      if status_resultado_inutilizacao then
        begin
          lista_resultado_inutilizacoes.Append('Ok');
          lista_resultado_inutilizacoes.Append('Inutilização homologada.');
        end;

      Inc(contador_laco, 1);

    end;

  Self.mensagem_status_configura_barra(lista_resultado_inutilizacoes.Count, 0);
  contador_laco := 0;
  while contador_laco < lista_resultado_inutilizacoes.Count do
    begin
      OutputDebugString(Pchar(lista_resultado_inutilizacoes[contador_laco]));
      Self.mensagem_status('Salvando inutilização Nfce N: ' + lista_resultado_inutilizacoes[contador_laco]);
      Self.mensagem_status_atualiza_barra(contador_laco + 3);
      //lblStatus.Caption := 'Salvando Inutilização N: ' + lista_resultado_inutilizacoes[contador_laco];
      Application.ProcessMessages;

      if lista_resultado_inutilizacoes[contador_laco + 1] = 'Ok' then
        inutiliza_bd(lista_resultado_inutilizacoes[contador_laco], Self.serie_inutilizacao);

      Inc(contador_laco, 3)
    end;

  Self.mensagem_status('');
  //lblStatus.Caption := 'Finalizado!';
  Application.ProcessMessages;

  Application.MessageBox(PChar('Inutilizações concluídas, será aberto relatório com o resultado do processo.'), 'Finalizado', MB_ICONINFORMATION + MB_OK + MB_TASKMODAL);

  relatorio_inutilizacoes(lista_resultado_inutilizacoes);

end;

procedure TfrmInutilizarNfce.memoCuponsInutilizacaoChange(Sender: TObject);
var
  CommaString : String;

begin
    if pos(#13#10,memoCuponsInutilizacao.lines.text) > 0 then
    begin
      memoCuponsInutilizacao.Lines.Text := StringReplace(memoCuponsInutilizacao.Lines.Text, #13#10, '', [rfReplaceAll]);
    end;
end;

procedure TfrmInutilizarNfce.inutiliza_bd(num_doc: String; serie: String);

var
  serie_convertida: String;
  tamanho_serie_convertida: Integer;
  contador_zeros: String;
  numero_convertido: String;
  tamanho_numero_convertido: Integer;
  sql: STring;
  transacao_id_inutilizacao: String;
  empresa_id: String;

  begin
    //OutputDebugString(Pchar('Será inutilizado no banco->' + num_doc));

    serie_convertida := Self.serie_inutilizacao;
    empresa_id := Self.empresa_id_unutilizacao;
    tamanho_serie_convertida := serie_convertida.Length;
    contador_zeros := '';

    while contador_zeros.Length + tamanho_serie_convertida < 3 do
      contador_zeros := contador_zeros + '0';

    serie_convertida := contador_zeros + serie_convertida;

    numero_convertido := num_doc;
    tamanho_numero_convertido := numero_convertido.Length;
    contador_zeros := '';

    while contador_zeros.Length + tamanho_numero_convertido < 7 do
      contador_zeros := contador_zeros + '0';

    numero_convertido := contador_zeros + numero_convertido;

    //OutputDebugString(Pchar('Série convertida->' + serie_convertida + ' Numero convertido->' + numero_convertido))

    sql := 'select transacao_id from transacoes where modelo = ''65'' and cast(serie as integer) = %d ';
    sql := sql + 'and cast(num_doc as integer) = %d ';
    sql := sql + 'and empresa_id = %s;';

    //ShowMessage(Format(sql, [StrToInt(Self.serie_inutilizacao), StrToInt(num_doc)]));

    try
      Self.consulta_sql_classe.Open(Format(sql, [StrToInt(Self.serie_inutilizacao), StrToInt(num_doc), empresa_id]));
    except on E: Exception do
      ShowMessage('Erro ao dar o select->' + E.Message);
    end;

    transacao_id_inutilizacao := Self.consulta_sql_classe.Fields[0].AsString;

    if transacao_id_inutilizacao <> '' then
      begin
        //Se transacao_id for diferente de fazio é porque a nfce possui transacao e vamos excluir tudo
        //ShowMessage('Tentando excluir transacao, compl e notas canceladas do nfce->' + num_doc);
        sql :='delete from transacoes where transacao_id = ''%s'';';
        Self.consulta_sql_classe.ExecSQL(Format(sql, [transacao_id_inutilizacao]));

        sql :='delete from compl_nfcefiscal where transacao_id = ''%s'';';
        Self.consulta_sql_classe.ExecSQL(Format(sql, [transacao_id_inutilizacao]));

        sql :='delete from notas_canceladas_nfce where transacao_id = ''%s'';';
        Self.consulta_sql_classe.ExecSQL(Format(sql, [transacao_id_inutilizacao]));

      end;

    //ShowMessage('Tentando inserir transacao e notas_canceladas do nfce->' + num_doc);
    transacao_id_inutilizacao := '';
    sql := 'insert into transacoes (empresa_id, conduta, depto, tpctb, conta_id , tipo_venda, historico, dt_movimento, dt_trans, dt_ent_sai, dt_sped, num_doc, serie, modelo, complemento) values ';
    sql := sql + '(%s, ''01'', ''07'', 2, 335, ''VENDA'', ''DOCUMENTO INUTILIZADO'', ''Today'', ''Today'', ''Today'', ''Today'', ''%s'', ''%s'', ''65'', ''INUTILIZADA'') returning transacao_id;';
    Self.consulta_sql_classe.Open(Format(sql, [empresa_id, numero_convertido, serie_convertida]));

    transacao_id_inutilizacao := Self.consulta_sql_classe.Fields[0].AsString;

    sql :='insert into notas_canceladas_nfce (transacao_id, dt_saida, hr_saida, recibo, empresa_id, exportado, no_doc_fiscal, ecf) values ';
    sql := sql + '(%s, ''Today'', ''16:16:03'', ''INUTILIZADA'', 1, 0, ''%s'', ''%s'');';

    Self.consulta_sql_classe.ExecSQL(Format(sql, [transacao_id_inutilizacao, numero_convertido, serie_convertida]));

    //ShowMessage('Nfce->' + num_doc + ' inutilizado no sefaz e bd!');

  end;

procedure TfrmInutilizarNfce.relatorio_inutilizacoes(lista_resultado_inutilizacoes: TStringlist);
var
  arquivo_txt : TextFile;
  contador_laco : Integer;
  quantidade_problemas : Integer;
  caminho_arquivo_txt: String;

begin

  caminho_arquivo_txt := ExtractFilePath(Application.ExeName) + '\relatorio_inutilizacoes.html';

  //Associa a variável arquivo_txt ao seu nome e caminho a ser salvo no pc
  AssignFile(arquivo_txt, caminho_arquivo_txt, cp_UTF8);

  //Salva o arquivo na pasta acima
  Rewrite(arquivo_txt);

  //Escrevo a parte do cabeçaho e css
  Writeln(arquivo_txt,
  '<!DOCTYPE html>' +
        '<html>' +
        '<head>' +
            '<meta charset="utf-8"/>' +
            '<title>Relatório de pendências</title>' +
        '</head>' +
        '<style>' +

        '.tabela-container{' +
            'margin: auto;' +
            'margin-top:20px;' +
            'border: 5px solid #00bfff;' +
            'width: 210mm;' +
        '}' +
        '.erro-tabela {' +
            'align: left;' +
            'border: 2.5px solid #0396db;' +
        '}' +
        '</style>' +
        '<body>'
  );

  Writeln(arquivo_txt,
  '<table class="tabela-container">' +
  '<tr>' +
      '<td><h1>Resultado das Inutilizações</h1></td>' +
  '</tr>' +
  '<tr>' +
  '<td>' +
  '<table class="erro-tabela">' +
      '<tr>' +
          '<th>Número do cupom</th>' +
          '<th>Status</th>' +
      '</tr>'
    );

  contador_laco := 0;
  while contador_laco < lista_resultado_inutilizacoes.Count do
    begin
      Writeln(arquivo_txt,
      '<tr>' +
          '<td align="center">' +lista_resultado_inutilizacoes[contador_laco]+ '</td>' +
          '<td align="center">' +lista_resultado_inutilizacoes[contador_laco + 2]+ '</td>' +
      '</tr>'
        );
      Inc(contador_laco, 3)
    end;

  Writeln(arquivo_txt,
  '</table>' +
  '</td>' +
  '</tr>' +
  '</table>'
  );

  //Finalizo o arquivo html
  Writeln(arquivo_txt,
  '</body>' +
  '</html>');

  //Fecha o arquivo
  CloseFile(arquivo_txt);

  ShellExecute(Application.Handle, nil, Pchar(caminho_arquivo_txt) , nil, nil, SW_SHOWNORMAL);

end;

end.
