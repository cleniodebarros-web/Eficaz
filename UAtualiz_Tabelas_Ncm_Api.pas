unit UAtualiz_Tabelas_Ncm_Api;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, DB, IBCustomDataSet, IBQuery, ACBrBase,
  ACBrSocket, ACBrIBPTax, IBTable, DBCtrls, Grids, DBGrids, Gauges,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, FireDAC.Comp.DataSet,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdFTP,System.zip,IdHTTP, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL;

type
  TFrmAtualiz_Tabelas_Ncm_Api = class(TForm)
    btnExecuta: TBitBtn;
    btnRetorna: TBitBtn;
    Label1: TLabel;
    URL: TEdit;
    Versao: TLabel;
    edArquivo: TEdit;
    sbArquivo: TSpeedButton;
    Label3: TLabel;
    Label4: TLabel;
    btDownload: TBitBtn;
    DBGrid1: TDBGrid;
    dtsCadastro: TDataSource;
    Panel1: TPanel;
    DBNavigator2: TDBNavigator;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    edNCM: TEdit;
    btnPesquisar: TBitBtn;
    OpenDialog1: TOpenDialog;
    ACBrIBPTax1: TACBrIBPTax;
    lbl1: TLabel;
    Gauge1: TGauge;
    QRel: TFDQuery;
    TmpCadastro: TFDTable;
    bDownload: TBitBtn;
    IdFTP1: TIdFTP;
    QSearch: TFDQuery;
    Texto: TMemo;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    Request: TIdHTTP;
    procedure btnRetornaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TabelaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnExecutaClick(Sender: TObject);
    procedure btDownloadClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure sbArquivoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TmpCadastroAfterOpen(DataSet: TDataSet);
    procedure bDownloadClick(Sender: TObject);
    procedure IdFTP1Work(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure IdFTP1WorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAtualiz_Tabelas_Ncm_Api: TFrmAtualiz_Tabelas_Ncm_Api;

implementation

uses
  UPrincipal, UData,UAguarde;

{$R *.dfm}

function VerificaAliquotaIbpt(codigo_ncm,codigo_interno,descricao,unidade,valor,gtin:String):Real;
var
  //Request: TIdHTTP;
  Parametros: TStringList;
  Resposta, API_KEY,url,nacional,estadual,importado,municipal,versao,fonte : string;
  texto: TMemo;
begin

    texto         := TMemo.Create(FrmAtualiz_Tabelas_Ncm_Api);
    texto.Parent  := FrmAtualiz_Tabelas_Ncm_Api;
    texto.Visible := False;

  API_KEY    := 'LxVTXyujx6LAUgulP7NXPCQGthB-rbmkZSFdIp53719lSuEFBN46ZMtaIz6mTLy8';

 // Request := TIdHTTP.Create(nil);

  FrmAtualiz_Tabelas_Ncm_Api.Request.Request.UserAgent       := 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko';
  FrmAtualiz_Tabelas_Ncm_Api.Request.Request.Method          := 'GET';
 // Request.IOHandler               := FrmAtualiz_Tabelas_Ncm_Api.IdSSLIOHandlerSocketOpenSSL1;

  //URL := 'https://apidoni.ibpt.org.br/api/v1/produtos' + '?token='+API_KEY + '&cnpj=' + '05835195000103' + '&codigo=' + codigo_ncm + '&uf=' + 'MG' + '&ex=' +  '0' + '&codigointerno=' + codigo_interno +'&descricao=' + 'arroz' + '&unidademedida=' + unidade + '&valor=' + '100' + '&gtin=' + gtin;
  //URL := 'https://apidoni.ibpt.org.br/api/v1/produtos';


  URL := 'https://apidoni.ibpt.org.br/api/v1/produtos?token=LxVTXyujx6LAUgulP7NXPCQGthB-rbmkZSFdIp53719lSuEFBN46ZMtaIz6mTLy8&cnpj=05835195000103&codigo=7897105512025&uf=MG&ex=0&codigoInterno=123456&descricao=ARROZ&unidadeMedida=KG&valor=100&gtin=7897553351511';
  try

     Showmessage(url);
     Resposta := FrmAtualiz_Tabelas_Ncm_Api.Request.get(url);
     Showmessage(Resposta);
   //  Resposta := Request.get(url,parametros);


     texto.Lines.Add(Utf8ToAnsi(Resposta));
    // ShowMessage(Texto.Text);

    nacional   :=  copy(texto.lines.text,pos('<Nacional>', texto.lines.text) + 10, pos('</Nacional>', texto.lines.text) - (pos('<Nacional>', texto.lines.text) +10));
    estadual   :=  copy(texto.lines.text,pos('<Estadual>', texto.lines.text) + 10, pos('</Estadual>', texto.lines.text) - (pos('<Estadual>', texto.lines.text) +10));
    importado  :=  copy(texto.lines.text,pos('<Importado>', texto.lines.text) + 11, pos('</Importado>', texto.lines.text) - (pos('<Importado>', texto.lines.text) +11));
    municipal  :=  copy(texto.lines.text,pos('<Municipal>', texto.lines.text) + 11, pos('</Municipal>', texto.lines.text) - (pos('<Municipal>', texto.lines.text) +11));
    versao     :=  copy(texto.lines.text,pos('<Versao>', texto.lines.text) + 8, pos('</Versao>', texto.lines.text) - (pos('<Versao>', texto.lines.text) +8));
    fonte      :=  copy(texto.lines.text,pos('<Fonte>', texto.lines.text) + 7, pos('</Fonte>', texto.lines.text) - (pos('<Fonte>', texto.lines.text) + 7));


    //showmessage('Nacional :'+nacional +#13 + 'Estadual: ' + estadual + #13 + 'Importado: ' + importado + #13 + 'Municipal: ' + municipal +#13 + 'Versao: ' + Versao + #13+ 'Fonte: ' + fonte);


    if nacional <>  '' then
     Begin
     nacional := nacional.Replace('.',',');
     Result := StrToFloat(nacional);
     End
    Else
     Result := 0;

  except

     //Application.MessageBox('Servidor help não ativo favor verificar!', PChar(Msg_Title), mb_IconInformation);

     on e:Exception do
        begin
          Application.MessageBox(PChar('Erro atualizar versao sistema:' + #13 +
            'Erro: ' + e.Message), 'Erro', MB_ICONSTOP + MB_TASKMODAL);
        end;



  end;
  FrmAtualiz_Tabelas_Ncm_Api.Request.Free;
 // Parametros.Free;
end;

procedure TFrmAtualiz_Tabelas_Ncm_Api.bDownloadClick(Sender: TObject);
var
ZipFile: TZipFile;
begin

        IdFTP1.Disconnect();

        IdFTP1.Host := DecryptMsg(LeIni(Arq_Ini, 'Atualização', 'Host'),3);
        IdFTP1.Port := StrToInt(LeIni(Arq_Ini, 'Atualização', 'Porta'));
        IdFTP1.Username := DecryptMsg(LeIni(Arq_Ini, 'Atualização', 'Usuario'),3);
        IdFTP1.Password := DecryptMsg(LeIni(Arq_Ini, 'Atualização', 'Senha'),3);
        IdFTP1.Passive := True;
        //IdFTP1. RecvBufferSize := 8192;


        try

         IdFTP1.Connect;

         if LeIni(Arq_Ini, 'Atualização', 'Diretorio') <> '' Then
         IdFTP1.ChangeDir(LeIni(Arq_Ini, 'Atualização', 'Diretorio'));

        except
        on e:Exception do
              begin
                Application.MessageBox(PChar('Erro ao conectar:' + #13 +
                  'Erro: ' + e.Message), 'Erro', MB_ICONSTOP + MB_TASKMODAL);
              end;
        end;

        try
         DeleteFile(LeIni(Arq_Ini, 'Atualização', 'Ibpt'));
         DeleteFile(Pchar(ExtractFilePath(ParamStr(0)) + '/TabelaIBPTaxMG.csv'));
        except

        end;


        if (FrmAguarde = nil) then
        FrmAguarde := TFrmAguarde.Create(Application);
        FrmAguarde.Timer1.Enabled := False;
        FrmAguarde.Label1.Caption := 'Efetuando Download nova versão, aguarde...';
        FrmAguarde.Show;
        FrmAguarde.BringToFront;
        Application.ProcessMessages;


        IdFTP1.Get('TabelaIBPTaxMG.zip', LeIni(Arq_Ini, 'Atualização', 'Ibpt'), true, True);


        IdFTP1.Disconnect();

        ZipFile := TZipFile.Create;

        Zipfile.ExtractZipFile(LeIni(Arq_Ini, 'Atualização', 'Ibpt'),ExtractFilePath(ParamStr(0)) + '/' );

        FrmAguarde.Label1.Caption := 'Download concluído com sucesso!';

        FrmAguarde.Label1.Caption := 'Atualização Concluida!';
        FrmAguarde.Close;
        FrmAguarde.Release;

        edArquivo.Text := ExtractFilePath(ParamStr(0)) + 'TabelaIBPTaxMG.csv' ;
        BtnExecuta.Click;




end;

procedure TFrmAtualiz_Tabelas_Ncm_Api.btDownloadClick(Sender: TObject);
begin
 tmpCadastro.Close;
  ACBrIBPTax1.URLDownload := Trim(URL.Text);

  if ACBrIBPTax1.DownloadTabela then
  begin
    MessageDlg('Download da tabela efetuado com sucesso.', mtInformation, [mbOK], 0);

    if MessageDlg('Deseja importar a tabela e mostrar os dados?', mtInformation, [mbYes,mbNo], 0) = mrYes then
      BtnExecuta.Click;
  end
  else
    MessageDlg('Não foi possível efetuar o download da tabela.', mtError, [mbOK], 0);
end;

procedure TFrmAtualiz_Tabelas_Ncm_Api.btnExecutaClick(Sender: TObject);
var
  I: Integer;
  Resu:string;
  Resposta, API_KEY,url,nacional,estadual,importado,municipal,versao,fonte,Tipo,codigo_ncm,codigo_interno,gtin   : string;
  Total:Integer;
  Aliq_nacional:Real;
 // Solicitar: TIdHTTP;
begin
  if MessageDlg('Deseja apagar tabela antiga e importar os novos dados?', mtInformation, [mbYes,mbNo], 0) = mrYes then
 Begin
  {
  API_KEY    := 'LxVTXyujx6LAUgulP7NXPCQGthB-rbmkZSFdIp53719lSuEFBN46ZMtaIz6mTLy8';

  ///Solicitar := TIdHTTP.Create(nil);
  Solicitar.Request.UserAgent      := 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko';
  Solicitar.Request.Method         := 'GET';
 // Solicitar.IOHandler              := IdSSLIOHandlerSocketOpenSSL1;
  Solicitar.ConnectTimeout         := 5000;
  Solicitar.RedirectMaximum        := 50;


 // URL := 'https://apidoni.ibpt.org.br/api/v1/produtos?token=LxVTXyujx6LAUgulP7NXPCQGthB-rbmkZSFdIp53719lSuEFBN46ZMtaIz6mTLy8&cnpj=05835195000103&codigo=7897105512025&uf=MG&ex=0&codigoInterno=123456&descricao=ARROZ&unidadeMedida=KG&valor=100&gtin=7897553351511';
    url := 'http://arilmaqmatriz.ddns.info:3535/Rest/api/eficaz/users/id/03744921000157/format/xml';
    ShowMessage(URL);
    Resposta  := Solicitar.get(url);
    ShowMessage(Resposta);
    texto.Lines.Add(Utf8ToAnsi(Resposta));
    ShowMessage( 'passo6');
   }

  QRel.SQL.Clear;
  QRel.Sql.Add('DELETE FROM IBTP');
  QRel.Prepare;
  QRel.ExecSQL;


  QSearch.SQL.Clear;
  QSearch.SQL.Add('SELECT DISTINCT TRIM(NCM) CODIGO_NCM FROM PRODUTOS WHERE TRIM(NCM) > :ZERO');
  QSearch.ParamByName('VAZIO').AsString := '';
  QSearch.Prepare;
  QSearch.Open();


  Total := 1910;
  I := 0;

  QSearch.First;

  while not QSearch.Eof do
  begin

   INC(I);
   texto.Clear;
   codigo_ncm      := QSearch.FieldByName('CODIGO_NCM').AsString;
   codigo_interno  := '1';
   gtin            := '1';


   Aliq_nacional := VerificaAliquotaIbpt(codigo_ncm,codigo_interno,'Diversos','UN','0',gtin);

   ShowMessage('Ncm:' + codigo_ncm +#13+ 'Aliquota: ' + FloatToStr(Aliq_nacional));


   //URL := 'https://apidoni.ibpt.org.br/api/v1/produtos' + '?token='+API_KEY + '&cnpj=' + '05835195000103' + '&codigo=' + codigo_ncm + '&uf=' + 'MG' + '&ex=' +  '0' + '&codigointerno=' + codigo_interno +'&descricao=' + 'Diversos' + '&unidademedida=' + 'UN' + '&valor=' + '100' + '&gtin=' + gtin;


   {
    nacional   :=  copy(texto.lines.text,pos('<Nacional>', texto.lines.text) + 10, pos('</Nacional>', texto.lines.text) - (pos('<Nacional>', texto.lines.text) +10));
    estadual   :=  copy(texto.lines.text,pos('<Estadual>', texto.lines.text) + 10, pos('</Estadual>', texto.lines.text) - (pos('<Estadual>', texto.lines.text) +10));
    importado  :=  copy(texto.lines.text,pos('<Importado>', texto.lines.text) + 11, pos('</Importado>', texto.lines.text) - (pos('<Importado>', texto.lines.text) +11));
    municipal  :=  copy(texto.lines.text,pos('<Municipal>', texto.lines.text) + 11, pos('</Municipal>', texto.lines.text) - (pos('<Municipal>', texto.lines.text) +11));
    versao     :=  copy(texto.lines.text,pos('<Versao>', texto.lines.text) + 8, pos('</Versao>', texto.lines.text) - (pos('<Versao>', texto.lines.text) +8));
    fonte      :=  copy(texto.lines.text,pos('<Fonte>', texto.lines.text) + 7, pos('</Fonte>', texto.lines.text) - (pos('<Fonte>', texto.lines.text) + 7));
    Tipo       :=  copy(texto.lines.text,pos('<Tipo>', texto.lines.text) + 6, pos('</Tipo>', texto.lines.text) - (pos('<Tipo>', texto.lines.text) + 6));


    nacional  := nacional.Replace('.',',');
    estadual  := estadual.Replace('.',',');
    importado := importado.Replace('.',',');
    municipal := municipal.Replace('.',',');

    QRel.SQL.Clear;
    QRel.Sql.Add('INSERT INTO IBTP(IBTP_ID, CODIGO,EX,TABELA,ALIQNAC,ALIQIMP,ALIQEST,VERSAO)');
    QRel.SQL.Add('VALUES(:IBTP_ID,:CODIGO,:EX,:TABELA,:ALIQNAC,:ALIQIMP,:ALIQEST,:VERSAO)');

    QRel.ParamByName('IBTP_ID').AsInteger  :=  I + 1;
    QRel.ParamByName('CODIGO').AsString  :=    codigo_ncm;
    QRel.ParamByName('EX').AsString      :=    '0';
    QRel.ParamByName('TABELA').AsInteger :=    StrToInt(Tipo);
    QRel.ParamByName('ALIQNAC').AsFloat  :=    StrToFloat(nacional);
    QRel.ParamByName('ALIQIMP').AsFloat  :=    StrToFloat(importado);
    QRel.ParamByName('ALIQEST').AsFloat  :=    StrToFloat(estadual);
    QRel.ParamByName('VERSAO').AsString  :=    versao;

    QRel.Prepare;
    QRel.ExecSql;

    }
    Resu := FormatFloat('0',((I * 100) / (Total)));
    Gauge1.Progress := StrToInt(Resu);
    Application.ProcessMessages;

   QSearch.Next;
  end;


  // configurar a URL do arquivo para ser baixado
  // if Trim(URL.Text) <> '' then
  //    ACBrIBPTax1.URLDownload := Trim(URL.Text);

  // se o path do arquivo não for passado, então o componente vai tentar baixar
  // a tabela no URL informado

  {
  if ACBrIBPTax1.AbrirTabela(edArquivo.Text) then
  begin
    Versao.Caption := 'Versão: ' + ACBrIBPTax1.VersaoArquivo;
    Versao.Font.Color:= clRed;

    tmpCadastro.Open;
    tmpCadastro.DisableControls;


    Gauge1.Visible  := True;
    lbl1.Visible    := True;

     QRel.SQL.Clear;
     QRel.SQL.Add('DELETE FROM IBTP');



    try
      for I := 0 to ACBrIBPTax1.Itens.Count - 1 do
      begin


        QRel.SQL.Clear;
        QRel.Sql.Add('INSERT INTO IBTP(IBTP_ID, CODIGO,EX,TABELA,ALIQNAC,ALIQIMP,ALIQEST,VERSAO)');
        QRel.SQL.Add('VALUES(:IBTP_ID,:CODIGO,:EX,:TABELA,:ALIQNAC,:ALIQIMP,:ALIQEST,:VERSAO)');

        QRel.ParamByName('IBTP_ID').AsInteger  :=  I + 1;
        QRel.ParamByName('CODIGO').AsString  :=    Copy(ACBrIBPTax1.Itens[I].NCM,1,8);
        QRel.ParamByName('EX').AsString      :=    ACBrIBPTax1.Itens[I].Excecao;
        QRel.ParamByName('TABELA').AsInteger :=    Integer(ACBrIBPTax1.Itens[I].Tabela);
        QRel.ParamByName('ALIQNAC').AsFloat  :=    ACBrIBPTax1.Itens[I].FederalNacional;
        QRel.ParamByName('ALIQIMP').AsFloat  :=    ACBrIBPTax1.Itens[I].FederalImportado;
        QRel.ParamByName('ALIQEST').AsFloat  :=    ACBrIBPTax1.Itens[I].Estadual;
        QRel.ParamByName('VERSAO').AsString  :=    ACBrIBPTax1.VersaoArquivo;

        QRel.Prepare;
        QRel.ExecSql;


        Resu := FormatFloat('0',((I * 100) / (ACBrIBPTax1.Itens.Count)));
        Gauge1.Progress := StrToInt(Resu);
        Application.ProcessMessages;

      end;

    finally
      tmpCadastro.Open;
      tmpCadastro.First;
      tmpCadastro.EnableControls;
    end;

    Application.MessageBox('Procedimento executado com sucesso', PChar(Msg_Title), mb_IconInformation);
    Gauge1.Visible  := False;
    lbl1.Visible    := False;
    end;
    }

  end;
end;


procedure TFrmAtualiz_Tabelas_Ncm_Api.btnPesquisarClick(Sender: TObject);
var
  ex, descricao, ID: String;
  tabela: Integer;
  aliqFedNac, aliqFedImp, aliqEst, aliqMun: Double;
begin
  {if ACBrIBPTax1.Procurar(edNCM.Text, ex, descricao, tabela, aliqFedNac, aliqFedImp, aliqEst, aliqMun, ckbBuscaNCMParcial.Checked) then
  begin
    ShowMessage(
      'Código: '    + edNCM.Text  + sLineBreak +
      'Exceção: '   + ex + sLineBreak +
      'Descrição: ' + descricao + sLineBreak +
      'Tabela: '    + IntToStr(tabela) + sLineBreak +
      'Aliq Federal Nacional: '  + FloatToStr(aliqFedNac) + sLineBreak +
      'Aliq Federal Importado: '  + FloatToStr(aliqFedImp) + sLineBreak +
      'Aliq Estadual: '  + FloatToStr(aliqEst) + sLineBreak +
      'Aliq Municipal: '  + FloatToStr(aliqMun)
    );
  end
  else
    showmessage('Código não encontrado!');  }


  IF  TmpCadastro.Locate('CODIGO',EDNCM.Text,[loCaseInsensitive]) Then
  Begin

   ShowMessage(
      'Código: '    + TmpCadastro.FieldByName('CODIGO').AsString  + sLineBreak +
      'Exceção: '   + TmpCadastro.FieldByName('EX').AsString + sLineBreak +
      'Tabela: '    + IntToStr(tmpCadastro.FieldByName('TABELA').AsInteger) + sLineBreak +
      'Aliq Federal Nacional: '  + FloatToStr(tmpCadastro.FieldByName('AliqNac').AsFloat) + sLineBreak +
      'Aliq Federal Importado: '  + FloatToStr(tmpCadastro.FieldByName('AliqImp').AsFloat) + sLineBreak +
      'Aliq Estadual: '  + FloatToStr(tmpCadastro.FieldByName('AliqEst').AsFloat) + sLineBreak
    );

  end
  else
    showmessage('Código não encontrado!');
end;


procedure TFrmAtualiz_Tabelas_Ncm_Api.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmAtualiz_Tabelas_Ncm_Api.TabelaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmAtualiz_Tabelas_Ncm_Api.TmpCadastroAfterOpen(DataSet: TDataSet);
begin
TFloatField(TmpCadastro.FieldByName('aliqnac')).DisplayFormat  := '#,##0.00';
TFloatField(TmpCadastro.FieldByName('aliqimp')).DisplayFormat  := '#,##0.00';
TFloatField(TmpCadastro.FieldByName('aliqest')).DisplayFormat  := '#,##0.00';
end;

procedure TFrmAtualiz_Tabelas_Ncm_Api.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmAtualiz_Tabelas_Ncm_Api.FormCreate(Sender: TObject);
begin
edArquivo.Text :=  ExtractFilePath(ParamStr(0)) + 'TabelaIBPTaxMG17.2.A.csv';
TmpCadastro.Open;
Versao.Caption := 'Versão: ' + TmpCadastro.FieldByName('VERSAO').AsString;
Versao.Font.Color:= clRed;
end;

procedure TFrmAtualiz_Tabelas_Ncm_Api.IdFTP1Work(ASender: TObject;
  AWorkMode: TWorkMode; AWorkCount: Int64);
  var
  Transferido : Integer;
begin
 FrmAguarde.Progresso.Position := AWorkCount;
 Transferido := AWorkCount div 1024;
 FrmAguarde.Label3.Caption := 'Transferido: ' + IntToStr(Transferido) + '/kb.';
 Application.ProcessMessages;
end;


procedure TFrmAtualiz_Tabelas_Ncm_Api.IdFTP1WorkBegin(ASender: TObject;
  AWorkMode: TWorkMode; AWorkCountMax: Int64);
begin
FrmAguarde.Progresso.Position := 0;
FrmAguarde.Progresso.Max := 2000;
end;

Procedure TFrmAtualiz_Tabelas_Ncm_Api.sbArquivoClick(Sender: TObject);
begin
  OpenDialog1.Title      := 'Selecione o arquivos de tabelas de imposto';
  OpenDialog1.DefaultExt := '*.csv';
  OpenDialog1.InitialDir := ExtractFilePath(ParamStr(0));

  if OpenDialog1.Execute then
  begin
    edArquivo.Text := OpenDialog1.FileName;
    BtnExecuta.Click;
  end;

end;

end.
