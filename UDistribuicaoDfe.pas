unit UDistribuicaoDfe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.OleCtrls,
  SHDocVw, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Samples.Spin,
  Vcl.StdCtrls, Vcl.ExtCtrls,
  ACBrNFe, pcnConversao, ACBrUtil, ACBrNFeDANFEClass, ACBrNFeDANFeESCPOS,
  ACBrBase, ACBrDFe, XMLIntf, XMLDoc, zlib, ACBrMail, FireDAC.Stan.Async,
  FireDAC.DApt, Vcl.Buttons, Vcl.Mask, RxToolEdit, RxCurrEdit, Vcl.DBCtrls,
  Xml.xmldom, Xml.Win.msxmldom;

type
  TFrmDistribuicaoDfe = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    PageControl2: TPageControl;
    TabSheet16: TTabSheet;
    Label44: TLabel;
    Label45: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    RadioGroup1: TRadioGroup;
    Button6: TButton;
    memoConsultaDFe: TMemo;
    ed_CNPJ: TEdit;
    ed_NSU: TEdit;
    ed_Chave: TEdit;
    ed_Ult_NSU: TEdit;
    ed_UF_Autor: TEdit;
    ed_Qtd_Cons: TSpinEdit;
    TabSheet17: TTabSheet;
    Label43: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    RadioGroup2: TRadioGroup;
    ed_CNPJM: TEdit;
    ed_ChaveM: TEdit;
    ed_LoteM: TEdit;
    Button8: TButton;
    VirtualTable1: TFDMemTable;
    VirtualTable1Sserie: TStringField;
    VirtualTable1Snumero: TStringField;
    VirtualTable1sChave: TStringField;
    VirtualTable1Snome: TStringField;
    VirtualTable1siest: TStringField;
    VirtualTable1STipoNfe: TStringField;
    VirtualTable1Snsu: TStringField;
    VirtualTable1SEmissao: TStringField;
    VirtualTable1Valor: TCurrencyField;
    VirtualTable1impresso: TStringField;
    VirtualTable1sCnpj: TStringField;
    Panel4: TPanel;
    pgRespostas: TPageControl;
    TabSheet5: TTabSheet;
    MemoResp: TMemo;
    TabSheet6: TTabSheet;
    WBResposta: TWebBrowser;
    TabSheet8: TTabSheet;
    memoLog: TMemo;
    TabSheet9: TTabSheet;
    trvwNFe: TTreeView;
    TabSheet10: TTabSheet;
    memoRespWS: TMemo;
    Dados: TTabSheet;
    MemoDados: TMemo;
    TabSheet11: TTabSheet;
    TreeViewRetornoConsulta: TTreeView;
    tabConsultaDFe: TTabSheet;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    VirtualTable1dt_consulta: TDateTimeField;
    QDistribuicao: TFDQuery;
    TabSheet1: TTabSheet;
    DataDistribuicao: TDataSource;
    SpeedButton1: TSpeedButton;
    Panel5: TPanel;
    Label1: TLabel;
    Dtmen: TDateEdit;
    Dtmai: TDateEdit;
    Panel6: TPanel;
    btnExecuta: TBitBtn;
    DBGrid2: TDBGrid;
    QSearch: TFDQuery;
    QInsert: TFDQuery;
    btnEmpresa: TSpeedButton;
    DBText1: TDBText;
    Qempresa: TFDQuery;
    DataEmpresa: TDataSource;
    SpeedButton2: TSpeedButton;
    DBText2: TDBText;
    EMPRESA_ID: TCurrencyEdit;
    QDistribuicaonsu: TStringField;
    QDistribuicaonumero: TStringField;
    QDistribuicaoserie: TStringField;
    QDistribuicaochave_nfe: TStringField;
    QDistribuicaonome: TStringField;
    QDistribuicaoinscricao: TStringField;
    QDistribuicaotipo_nfe: TStringField;
    QDistribuicaodt_emissao: TDateField;
    QDistribuicaovalor: TBCDField;
    QDistribuicaoimpresso: TStringField;
    QDistribuicaocnpj: TStringField;
    QDistribuicaoarquivo_xml: TBlobField;
    QDistribuicaodt_consulta: TSQLTimeStampField;
    QDistribuicaofuncionario_id: TIntegerField;
    Qnsu: TFDQuery;
    IQuery: TFDQuery;
    FDVerificar: TFDMemTable;
    StringField5: TStringField;
    StringField10: TStringField;
    lblAtualizar: TLabel;
    Label2: TLabel;
    QDistribuicaoentrada_id: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure btnEmpresaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure QDistribuicaoAfterOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure LoadXML(RetWS: String; MyWebBrowser: TWebBrowser);
  public
    { Public declarations }
  end;

var
  FrmDistribuicaoDfe: TFrmDistribuicaoDfe;

implementation
uses
UPrincipal,Udata,UConsulta;

{$R *.dfm}

procedure TFrmDistribuicaoDfe.LoadXML(RetWS: String; MyWebBrowser: TWebBrowser);
begin
  ACBrUtil.WriteToTXT( PathWithDelim(ExtractFileDir(application.ExeName))+'temp.xml',
                        ACBrUtil.ConverteXMLtoUTF8( RetWS ), False, False);
  MyWebBrowser.Navigate(PathWithDelim(ExtractFileDir(application.ExeName))+'temp.xml');

  if FrmPrincipal.ACBrNFe1.NotasFiscais.Count > 0then
    MemoResp.Lines.Add('Empresa: '+ FrmPrincipal.ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.xNome);
end;


procedure TFrmDistribuicaoDfe.QDistribuicaoAfterOpen(DataSet: TDataSet);
begin
 TFloatField(QDistribuicao.FieldByName('VALOR')).DisplayFormat    := '#,##0.00';
end;

procedure TFrmDistribuicaoDfe.SpeedButton2Click(Sender: TObject);
begin
try
    EMPRESA_ID.Value := GetConsulta('EMPRESAS', 0, 0, StrToInt(EMPRESA_ID.Text));
  except
    EMPRESA_ID.Value := GetConsulta('EMPRESAS', 0, 0, 0);
  end;

  QEmpresa.Close;
  QEmpresa.ParamByName('EMPRESA_ID').AsInteger := StrToInt(EMPRESA_ID.Text);
  QEmpresa.Prepare;
  QEmpresa.Open;

  ed_CNPJm.Text     := QEmpresa.FieldByName('CNPJ').AsString;


end;

procedure TFrmDistribuicaoDfe.btnEmpresaClick(Sender: TObject);
begin

  try
    EMPRESA_ID.Value := GetConsulta('EMPRESAS', 0, 0, StrToInt(EMPRESA_ID.Text));
  except
    EMPRESA_ID.Value := GetConsulta('EMPRESAS', 0, 0, 0);
  end;

  QEmpresa.Close;
  QEmpresa.ParamByName('EMPRESA_ID').AsInteger := StrToInt(EMPRESA_ID.Text);
  QEmpresa.Prepare;
  QEmpresa.Open;

  ed_CNPJ.Text     := QEmpresa.FieldByName('CNPJ').AsString;
  ed_UF_Autor.Text := Copy(QEmpresa.FieldByName('IBGE').AsString,1,2);

end;

procedure TFrmDistribuicaoDfe.btnExecutaClick(Sender: TObject);
begin

Qdistribuicao.close;
Qdistribuicao.Params[0].AsDate := dtmen.Date;
Qdistribuicao.Params[1].AsDate := dtmai.Date;
Qdistribuicao.Params[2].AsInteger := FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger;
Qdistribuicao.prepare;
Qdistribuicao.open;

QDistribuicao.First;



end;

procedure TFrmDistribuicaoDfe.Button6Click(Sender: TObject);
var
   CNPJ, Impresso, sChave, sEmissao, sCNPJ, sNome, sNumero, sSerie,
   sIEst, sNSU, sTipoNFe, sStat, sMotivo, sUltimoNSU: String;
   Valor: Double;
   i, j, k: integer;
   bTemMais: Boolean;
begin

  lblAtualizar.visible := True;
  LblAtualizar.Caption := 'Iniciando Atualização...';

  IQuery.Sql.Clear;
  IQuery.Sql.Add('SELECT TRANSACAO_ID,CHAVE_NFE FROM TRANSACOES WHERE (CONDUTA  = ''02'') AND (DEPTO = ''07'')');
  IQuery.Sql.Add('AND DT_ENT_SAI BETWEEN :DT_INI AND :DT_FIM');
  IQuery.ParamByName('DT_INI').AsDate :=  IncMonth(Date, - 3);
  IQuery.ParamByName('DT_FIM').AsDate :=  Date;
  IQuery.Prepare;
  IQuery.Open;

  IQuery.First;
  while not IQuery.eof do
  Begin

   FDVerificar.Open;
   FDVerificar.append;
   FDVerificar.FieldByName('ENTRADA_ID').AsInteger := IQuery.FieldByName('TRANSACAO_ID').AsInteger;
   FDVerificar.FieldByName('CHAVE_NFE').AsString   := IQuery.FieldByName('CHAVE_NFE').AsString;
   FDVerificar.Post;

   LblAtualizar.Caption := 'Importando: ' + IQuery.FieldByName('CHAVE_NFE').AsString;
   Application.ProcessMessages;
   IQuery.Next;
  End;




  // FrmPrincipal.ACBrNFe1.NotasFiscais.Clear;
   FrmPrincipal.ACBrNFe1.Configuracoes.WebServices.Visualizar := False;

   FrmPrincipal.ACBrNFe1.NotasFiscais.Clear;

   memoConsultaDFe.Clear;

   CNPJ := SemMascara(ed_CNPJ.Text);

   memoConsultaDFe.Lines.Add('------------------------------------------------------');
   memoConsultaDFe.Lines.Add(' =>  Consultando NFe Destinadas');
   memoConsultaDFe.Lines.Add('------------------------------------------------------');

   //Memo1.Text := '';

   k := 0;

  // VirtualTable1.Delete;
  // VirtualTable1.Cl;


   if VirtualTable1.Active Then
   Begin
   VirtualTable1.EmptyDataSet;
   VirtualTable1.close;
   VirtualTable1.Open
   End
   Else
   VirtualTable1.Open;

   repeat
     inc(k);

     try
       case RadioGroup1.ItemIndex of

         0: FrmPrincipal.ACBrNFe1.DistribuicaoDFe(StrToInt(ed_UF_Autor.Text), CNPJ, ed_Ult_NSU.Text, ed_NSU.Text);
         1: FrmPrincipal.ACBrNFe1.DistribuicaoDFePorChaveNFe(StrToInt(ed_UF_Autor.Text), CNPJ, ed_Chave.Text);
         2: FrmPrincipal.ACBrNFe1.DistribuicaoDFePorUltNSU(StrToInt(ed_UF_Autor.Text), CNPJ, ed_Ult_NSU.Text);
         3: FrmPrincipal.ACBrNFe1.DistribuicaoDFePorNSU(StrToInt(ed_UF_Autor.Text), CNPJ, ed_NSU.Text);

       end;
      except on E: Exception do
       begin

             if FrmPrincipal.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.cStat = 656 then
             Begin

                //showmessage (FrmPrincipal.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.ultNSU);
                try
                QInsert.sql.clear;
                QInsert.sql.add('INSERT INTO distribuicaonotas(ult_nsu, nsu, numero, serie, chave_nfe, nome, inscricao, tipo_nfe, dt_emissao, valor, impresso, cnpj, arquivo_xml, dt_consulta, funcionario_id,entrada_id,empresa_id) ');
                QInsert.sql.add('VALUES(:ult_nsu,:nsu, :numero, :serie, :chave_nfe, :nome, :inscricao, :tipo_nfe, :dt_emissao, :valor, :impresso, :cnpj, :arquivo_xml, :dt_consulta, :funcionario_id,:entrada_id,:empresa_id)');

                QInsert.ParamByName('ULT_NSU').AsString         := FrmPrincipal.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.ultNSU;
                QInsert.ParamByName('NSU').AsString             := '0';
                QInsert.ParamByName('NUMERO').AsString          := '0';
                QInsert.ParamByName('cnpj').AsString            := '0';
                QInsert.ParamByName('serie').AsString           := '0';
                QInsert.ParamByName('chave_nfe').AsString       := '0';
                QInsert.ParamByName('NOME').AsString            := '0';
                QInsert.ParamByName('inscricao').AsString       := '0';
                QInsert.ParamByName('tipo_nfe').AsString        := '0';
                QInsert.ParamByName('dt_emissao').AsDate        := date;
                QInsert.ParamByName('valor').AsCurrency         := 0;
                QInsert.ParamByName('impresso').AsString        := ' ';
                QInsert.ParamByName('cnpj').AsString            := '0';
                QInsert.ParamByName('dt_consulta').AsDateTime   := DATE() + TIME;
                QInsert.ParamByName('FUNCIONARIO_ID').AsInteger := FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger;
                QInsert.ParamByName('ARQUIVO_XML').AsByteStr    := '';//FrmPrincipal.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].XML;
                QInsert.ParamByName('ENTRADA_ID').AsInteger := 0;
                QInsert.ParamByName('EMPRESA_ID').AsInteger := FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger;


                QInsert.prepare;
                QInsert.ExecSQL;

                except

                  on e:Exception do
                  begin
                    Application.MessageBox(PChar('Erro ao inserir envinto 656:' + #13 +
                      'Erro: ' + e.Message), 'Erro', MB_ICONSTOP + MB_TASKMODAL);
                  end;


                end;
             End;


          memoConsultaDFe.Lines.Add('------------------------------------------------------');
          memoConsultaDFe.Lines.Add(' =>  Ocorreu um Erro ao Consultar.');
          memoConsultaDFe.Lines.Add(E.Message);
          memoConsultaDFe.Lines.Add('------------------------------------------------------');
          lblAtualizar.visible := False;
          exit;

       end;
     end;

     sStat   := IntToStr(FrmPrincipal.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.cStat);
     sMotivo := FrmPrincipal.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.xMotivo;

     if FrmPrincipal.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.cStat = 137 then
       bTemMais    := False
     else bTemMais := True;

     sUltimoNSU := FrmPrincipal.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.ultNSU;

     ed_Ult_NSU.Text := sUltimoNSU;

     if FrmPrincipal.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.cStat = 138 then
       begin
          memoConsultaDFe.Lines.Add(' Documento Localizado para o Destinatário');
          memoConsultaDFe.Lines.Add(' Utilizar o número que esta no campo: Último NSU');
          memoConsultaDFe.Lines.Add(' Para uma nova pesquisa.');
          memoConsultaDFe.Lines.Add(' ');

          j := FrmPrincipal.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Count - 1;

            for i := 0 to j do
            begin
               sSerie   := '';
               sNumero  := '';
               sCNPJ    := '';
               sNome    := '';
               sIEst    := '';
               sNSU     := '';
               sEmissao := '';
               sTipoNFe := '';
               Valor    := 0.0;
               Impresso := ' ';

                 if FrmPrincipal.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].resDFe.chDFe <> '' then
                 begin
                    // Conjunto de informações resumo da NF-e localizadas.
                    // Este conjunto de informação será gerado quando a NF-e for autorizada ou denegada.
                    sChave   := FrmPrincipal.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].resDFe.chDFe;
                    sSerie   := Copy(sChave, 23, 3);
                    sNumero  := Copy(sChave, 26, 9);
                    sCNPJ    := FrmPrincipal.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].resDFe.CNPJCPF;
                    sNome    := FrmPrincipal.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].resDFe.xNome;
                    sIEst    := FrmPrincipal.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].resDFe.IE;

                    case FrmPrincipal.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].resDFe.tpNF of
                      tnEntrada: sTipoNFe := 'Entrada';
                      tnSaida: sTipoNFe   := 'Saida';
                    end;

                    sNSU     := FrmPrincipal.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].NSU;
                    sEmissao := DateToStr(FrmPrincipal.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].resDFe.dhEmi);
                    Valor    := FrmPrincipal.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].resDFe.vNF;

                    case FrmPrincipal.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].resDFe.cSitDFe of
                      snAutorizado: Impresso := 'Autorizado';
                      snDenegado: Impresso   := 'Denegado';
                      snCancelado: Impresso  := 'Cancelado';
                    end;

                 end;

                 if FrmPrincipal.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].XML <> '' Then
                 Begin
                    try
                     FrmPrincipal.ACBrNFe1.EventoNFe.Evento.Clear;

                    with FrmPrincipal.ACBrNFe1.EventoNFe.Evento.New do
                      begin
                         infEvento.cOrgao   := 91;
                         infEvento.chNFe    := sChave;
                         infEvento.CNPJ     := scnpj;
                         infEvento.dhEvento := Now;
                         infEvento.tpEvento := teManifDestConfirmacao;

                         {case RadioGroup2.ItemIndex of
                           0 : infEvento.tpEvento := teManifDestCiencia;
                           1 : infEvento.tpEvento := teManifDestDesconhecimento;
                           2 : infEvento.tpEvento := teManifDestConfirmacao;
                           3 : infEvento.tpEvento := teManifDestOperNaoRealizada;
                         end;
                         }
                      end;
                    FrmPrincipal.ACBrNFe1.EnviarEvento(1);
                    except

                    end;


                  QSearch.Sql.Clear;
                  QSearch.Sql.Add('SELECT * FROM DISTRIBUICAONOTAS WHERE NSU = :NSU');
                  QSearch.ParamByName('NSU').AsString := sNSU;
                  QSearch.Prepare;
                  QSearch.Open;



                  if QSearch.IsEmpty Then
                  Begin



                    QInsert.sql.clear;
                    QInsert.sql.add('INSERT INTO distribuicaonotas(ult_nsu, nsu, numero, serie, chave_nfe, nome, inscricao, tipo_nfe, dt_emissao, valor, impresso, cnpj, arquivo_xml, dt_consulta, funcionario_id,entrada_id,empresa_id) ');
                    QInsert.sql.add('VALUES(:ult_nsu,:nsu, :numero, :serie, :chave_nfe, :nome, :inscricao, :tipo_nfe, :dt_emissao, :valor, :impresso, :cnpj, :arquivo_xml, :dt_consulta, :funcionario_id,:entrada_id,:empresa_id)');

                    QInsert.ParamByName('ULT_NSU').AsString         := sUltimoNSU;
                    QInsert.ParamByName('NSU').AsString             := sNSU;
                    QInsert.ParamByName('NUMERO').AsString          := sNumero;
                    QInsert.ParamByName('cnpj').AsString            := scnpj;
                    QInsert.ParamByName('serie').AsString           := sserie;
                    QInsert.ParamByName('chave_nfe').AsString       := sChave;
                    QInsert.ParamByName('NOME').AsString            := sNOME;
                    QInsert.ParamByName('inscricao').AsString       := sIEst;
                    QInsert.ParamByName('tipo_nfe').AsString        := sTipoNFe;

                    if sEmissao <> '' Then
                    QInsert.ParamByName('dt_emissao').AsDate        := StrTodate(sEmissao)
                    Else
                     QInsert.ParamByName('dt_emissao').AsDate        := date;

                    QInsert.ParamByName('valor').AsCurrency         := Valor;
                    QInsert.ParamByName('impresso').AsString        := Impresso;
                    QInsert.ParamByName('cnpj').AsString            := sCNPJ;
                    QInsert.ParamByName('dt_consulta').AsDateTime   := DATE() + TIME;
                    QInsert.ParamByName('FUNCIONARIO_ID').AsInteger := FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger;
                    QInsert.ParamByName('ARQUIVO_XML').AsByteStr    := FrmPrincipal.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].XML;

                    if FDVerificar.Locate('chave_nfe', VarArrayOf([sChave]), [loCaseInsensitive]) then
                    QInsert.ParamByName('ENTRADA_ID').AsInteger := FDVerificar.FieldByName('ENTRADA_ID').AsInteger
                    Else
                    QInsert.ParamByName('ENTRADA_ID').AsInteger := 0;

                    QInsert.ParamByName('EMPRESA_ID').AsInteger := FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger;

                    QInsert.prepare;
                    QInsert.ExecSQL;


                  End
                  Else
                  Begin

                    QInsert.Sql.Clear;
                    QInsert.Sql.Add('UPDATE DISTRIBUICAONOTAS SET ENTRADA_ID = :ENTRADA_ID WHERE CHAVE_NFE = :CHAVE_NFE');
                    QInsert.ParamByName('ENTRADA_ID').AsInteger := IQuery.FieldByname('TRANSACAO_ID').AsInteger;
                    QInsert.ParamByName('CHAVE_NFE').AsString   :=  sChave;
                    QInsert.Prepare;
                    QInsert.ExecSQL;

                  End;

                 End;

               // Registra em Tabela Virtual as Notas Retornadas da Consulta
               VirtualTable1.Append;
               VirtualTable1.FieldByName('sSerie').AsString   := sSerie;
               VirtualTable1.FieldByName('sNumero').AsString  := sNumero;
               VirtualTable1.FieldByName('sChave').AsString   := sChave;
               VirtualTable1.FieldByName('sCNPJ').AsString    := sCNPJ;
               VirtualTable1.FieldByName('sNome').AsString    := sNome;
               VirtualTable1.FieldByName('sIEst').AsString    := sIEst;
               VirtualTable1.FieldByName('sTipoNFe').AsString := sTipoNFe;
               VirtualTable1.FieldByName('sNSU').AsString     := sNSU;
               VirtualTable1.FieldByName('sEmissao').AsString := sEmissao;
               VirtualTable1.FieldByName('Valor').AsCurrency  := Valor;
               VirtualTable1.FieldByName('Impresso').AsString := Impresso;
               VirtualTable1.FieldByName('dt_consulta').AsDateTime := DATE() + TIME;
               VirtualTable1.Post;

             LblAtualizar.Caption := 'Importando: ' + sChave;

            end; // Fim do For


       end
     else
     begin // Nenhum Documento Localizado para o Destinatário

        if FrmPrincipal.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.cStat = 137 then
         begin
            memoConsultaDFe.Lines.Add(' Nenhum Documento Localizado para o Destinatário');
            memoConsultaDFe.Lines.Add(' Utilizar o número que esta no campo: Último NSU');
            memoConsultaDFe.Lines.Add(' Para uma nova pesquisa (' + ed_Ult_NSU.Text + ').');
            memoConsultaDFe.Lines.Add(' ');
         end
        else
         begin
            memoConsultaDFe.Lines.Add(' Falha ao realizar a consulta.');
            memoConsultaDFe.Lines.Add(' cStat: ' + sStat);
            memoConsultaDFe.Lines.Add(' xMotivo: ' + sMotivo);
            memoConsultaDFe.Lines.Add(' ');
         end;
     end;
   until (k = ed_Qtd_Cons.Value) or (not bTemMais);

   if bTemMais then
     memoConsultaDFe.Lines.Add(' ' + IntToStr(k) + ' Consultas Realizadas e tem mais Documentos.')
   else memoConsultaDFe.Lines.Add(' ' + IntToStr(k) + ' Consultas Realizadas e não tem mais Documentos.');

    FrmPrincipal.ACBrNFe1.Configuracoes.WebServices.Visualizar := False;
    lblAtualizar.visible := False;

end;


procedure TFrmDistribuicaoDfe.Button8Click(Sender: TObject);
var
 Chave, idLote, CNPJ: string;
 lMsg: string;
begin
  Chave  := Trim(OnlyNumber(ed_ChaveM.Text));
  idLote := Trim(OnlyNumber(ed_LoteM.Text));
  CNPJ   := SemMascara(ed_CNPJM.Text);


  FrmPrincipal.ACBrNFe1.EventoNFe.Evento.Clear;

  with FrmPrincipal.ACBrNFe1.EventoNFe.Evento.New do
    begin
       infEvento.cOrgao   := 91;
       infEvento.chNFe    := Chave;
       infEvento.CNPJ     := CNPJ;
       infEvento.dhEvento := Now;

       case RadioGroup2.ItemIndex of
         0 : infEvento.tpEvento := teManifDestCiencia;
         1 : infEvento.tpEvento := teManifDestDesconhecimento;
         2 : infEvento.tpEvento := teManifDestConfirmacao;
         3 : infEvento.tpEvento := teManifDestOperNaoRealizada;
       end;
    end;
  FrmPrincipal.ACBrNFe1.EnviarEvento(StrToInt(IDLote));

  with FrmPrincipal.AcbrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento do
    begin
       lMsg:=
       'Id: '+Id+#13+
       'tpAmb: '+TpAmbToStr(tpAmb)+#13+
       'verAplic: '+verAplic+#13+
       'cOrgao: '+IntToStr(cOrgao)+#13+
       'cStat: '+IntToStr(cStat)+#13+
       'xMotivo: '+xMotivo+#13+
       'chNFe: '+chNFe+#13+
       'tpEvento: '+TpEventoToStr(tpEvento)+#13+
       'xEvento: '+xEvento+#13+
       'nSeqEvento: '+IntToStr(nSeqEvento)+#13+
       'CNPJDest: '+CNPJDest+#13+
       'emailDest: '+emailDest+#13+
       'dhRegEvento: '+DateTimeToStr(dhRegEvento)+#13+
       'nProt: '+nProt;
    end;
  ShowMessage(lMsg);

  MemoResp.Lines.Text   := FrmPrincipal.ACBrNFe1.WebServices.EnvEvento.RetWS;
  memoRespWS.Lines.Text := FrmPrincipal.ACBrNFe1.WebServices.EnvEvento.RetornoWS;

  FrmPrincipal.ACBrNFe1.EventoNFe.Evento.Clear;
  //ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].XXXX
 // LoadXML(FrmPrincipal.ACBrNFe1.WebServices.EnvEvento.RetornoWS, WBResposta);
end;

procedure TFrmDistribuicaoDfe.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
VirtualTable1.Close;
end;

procedure TFrmDistribuicaoDfe.FormCreate(Sender: TObject);
begin

Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
Dtmai.Date := Ult_Dia_Mes(date);

end;

procedure TFrmDistribuicaoDfe.FormShow(Sender: TObject);
begin
TabSheet16.Show;
TabSheet5.Show;

  QEmpresa.Close;
  //QEmpresa.ParamByName('STATUS').AsString :=A;  //;StrToInt(EMPRESA_ID.Text);
  QEmpresa.Prepare;
  QEmpresa.Open;

  ed_CNPJ.Text     := FrmPrincipal.qEmpresa.FieldByName('CNPJ').AsString;
  ed_CNPJM.Text    := FrmPrincipal.qEmpresa.FieldByName('CNPJ').AsString;
  ED_lOTEm.Text    := '1';
  ed_UF_Autor.Text := Copy(FrmPrincipal.qEmpresa.FieldByName('IBGE').AsString,1,2);


  QNsu.Close;
  QNsu.ParamByName('EMPRESA_ID').AsInteger := FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger;
  QNsu.Prepare;
  QNsu.Open;

  if  QNsu.FieldByName('ULT_NSU').AsString <> '' Then
  ed_Ult_NSU.Text := QNsu.FieldByName('ULT_NSU').AsString
  Else
  ed_Ult_NSU.Text := '000000';

  

end;

end.
