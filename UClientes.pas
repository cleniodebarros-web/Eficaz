unit UClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ComCtrls, ToolWin, StdCtrls, Grids, DBGrids, Tabs, ExtCtrls,
  DB, IBCustomDataSet, IBQuery, Mask, rxToolEdit, Buttons, rxCurrEdit,
  IBUpdateSQL, QRCtrls, QuickRpt, ExtDlgs, DBCtrls, jpeg,IdHashMessageDigest,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, ACBrBase, ACBrSocket, ACBrConsultaCPF, ACBrConsultaCNPJ, RegularExpressions;

  {$IFDEF CONDITIONALEXPRESSIONS}
   {$IF CompilerVersion >= 20.0}
     {$DEFINE DELPHI2009_UP}
   {$IFEND}
{$ENDIF}
                                 
type
  TFrmClientes = class(TForm)
    PageControl1: TPageControl;
    Panel1: TPanel;
    Consulta: TTabSheet;
    Manutencao: TTabSheet;
    Alfabeto: TTabSet;
    StatusBar1: TStatusBar;
    DBGrid1: TDBGrid;
    DataTabela: TDataSource;
    Label3: TLabel;
    NOME: TEdit;
    FANTASIA: TEdit;
    INSCRICAO: TEdit;
    CNPJ: TMaskEdit;
    btnRetorna: TBitBtn;
    Panel2: TPanel;
    btnPrior: TBitBtn;
    btnNext: TBitBtn;
    btnInsert: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    btnSave: TBitBtn;
    btnDiscard: TBitBtn;
    Label20: TLabel;
    TIPO_CLIENTE: TComboBox;
    Label4: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label15: TLabel;
    TRATAMENTO: TEdit;
    Label2: TLabel;
    DT_FICHA: TDateEdit;
    Label21: TLabel;
    LIMITE: TRxCalcEdit;
    Label22: TLabel;
    BLOQUEADO: TComboBox;
    btnImprime: TBitBtn;
    btnPesquisa: TBitBtn;
    COD_CONTABIL: TEdit;
    Label34: TLabel;
    OBSERVACAO: TEdit;
    btnComeca_Com: TSpeedButton;
    Comeca_Com: TLabeledEdit;
    PageControl2: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label5: TLabel;
    ENDERECO: TEdit;
    Label25: TLabel;
    NUMERO: TEdit;
    Label6: TLabel;
    COMPLEMENTO: TEdit;
    Label7: TLabel;
    BAIRRO: TEdit;
    Label9: TLabel;
    MUNICIPIO: TEdit;
    Label8: TLabel;
    ESTADO: TComboBox;
    Label10: TLabel;
    CEP: TMaskEdit;
    Label24: TLabel;
    IBGE: TEdit;
    btnIBGE: TSpeedButton;
    Label27: TLabel;
    ENDERECO_COBRANCA: TEdit;
    Label28: TLabel;
    NUMERO_COBRANCA: TEdit;
    BAIRRO_COBRANCA: TEdit;
    ESTADO_COBRANCA: TComboBox;
    Label32: TLabel;
    Label30: TLabel;
    COMPL_COBRANCA: TEdit;
    Label29: TLabel;
    Label31: TLabel;
    MUNICIPIO_COBRANCA: TEdit;
    CEP_COBRANCA: TMaskEdit;
    Label33: TLabel;
    Label18: TLabel;
    URL: TEdit;
    Label19: TLabel;
    EMAIL: TEdit;
    Label35: TLabel;
    COD_PAIS: TEdit;
    btnPais: TSpeedButton;
    Label1: TLabel;
    Label11: TLabel;
    TELEFONE_2: TMaskEdit;
    FAX: TMaskEdit;
    TabSheet3: TTabSheet;
    Label12: TLabel;
    PAI: TEdit;
    Label37: TLabel;
    MAE: TEdit;
    Label38: TLabel;
    NASCIMENTO: TDateEdit;
    Label39: TLabel;
    SEXO: TComboBox;
    Label40: TLabel;
    ESTADO_CIVIL: TComboBox;
    Label41: TLabel;
    CONJUGE: TEdit;
    TabSheet4: TTabSheet;
    Label42: TLabel;
    BANCO_PAGTO: TEdit;
    Label43: TLabel;
    TRANSPORTADORA: TEdit;
    Label44: TLabel;
    DIA_INI: TCurrencyEdit;
    DIA_FIM: TCurrencyEdit;
    Label23: TLabel;
    VENCIMENTO: TCurrencyEdit;
    Label58: TLabel;
    CARTAO_IDENT1: TEdit;
    CARTAO_IDENT2: TEdit;
    Label59: TLabel;
    CARTAO_IDENT3: TEdit;
    Label60: TLabel;
    CARTAO_IDENT4: TEdit;
    Label61: TLabel;
    Label62: TLabel;
    SENHA: TEdit;
    TabSheet6: TTabSheet;
    ANOTACOES: TMemo;
    Label64: TLabel;
    DataAutorizados: TDataSource;
    TabSheet7: TTabSheet;
    Grid_Autorizados: TDBGrid;
    TabSheet8: TTabSheet;
    StatusBar2: TStatusBar;
    StatusBar3: TStatusBar;
    Grid_Seriais: TDBGrid;
    DataSeriais: TDataSource;
    DDD: TMaskEdit;
    Label63: TLabel;
    Label65: TLabel;
    Label67: TLabel;
    QTD_LICENCA: TCurrencyEdit;
    Rel_Series: TQuickRep;
    QRBand4: TQRBand;
    QRShape6: TQRShape;
    QRLabel17: TQRLabel;
    QRDBText17: TQRDBText;
    QRSysData5: TQRSysData;
    QRLabel21: TQRLabel;
    QRSysData6: TQRSysData;
    QRShape8: TQRShape;
    QRBand5: TQRBand;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    LICENCA: TEdit;
    Label66: TLabel;
    N_Empresas: TCurrencyEdit;
    Label68: TLabel;
    EIX_OE_PT: TEdit;
    Repetir_Endereco: TCheckBox;
    Label13: TLabel;
    btn_load_image: TButton;
    OpenImage: TOpenPictureDialog;
    Foto: TImage;
    Shape1: TShape;
    Label36: TLabel;
    Licenca_t: TEdit;
    btnGerar: TBitBtn;
    Serial: TEdit;
    Label69: TLabel;
    Label70: TLabel;
    CIL_OE_PT: TEdit;
    Label71: TLabel;
    lbl1: TLabel;
    lbl2: TLabel;
    Limite_Cheque: TRxCalcEdit;
    QTabela: TFDQuery;
    IQuery: TFDQuery;
    QIbge: TFDQuery;
    Qautorizados: TFDQuery;
    QSeriais: TFDQuery;
    Usql_Seriais: TFDUpdateSQL;
    Btn_GerarOn: TBitBtn;
    chk_0800: TCheckBox;
    TELEFONE_1: TMaskEdit;
    TabSheet5: TTabSheet;
    Anot_Inadimplencia: TRichEdit;
    btn_Incluir_Inadimplencia: TBitBtn;
    QInadimplencia: TFDQuery;
    Label26: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Contato: TEdit;
    Label49: TLabel;
    Label17: TLabel;
    TabSheet9: TTabSheet;
    Grid_DadosPet: TDBGrid;
    QDadosPet: TFDQuery;
    Datapet: TDataSource;
    funcionario_id: TCurrencyEdit;
    QPlano: TFDQuery;
    Label47: TLabel;
    spc_serasa: TComboBox;
    chk_produtor: TCheckBox;
    Produtor_r: TCurrencyEdit;
    Atividade: TComboBox;
    Termo_Autorizacao: TQuickRep;
    QRBand7: TQRBand;
    QRSysData1: TQRSysData;
    QRLabel27: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel28: TQRLabel;
    QRShape5: TQRShape;
    QRDBText15: TQRDBText;
    QRBand8: TQRBand;
    QRLabel29: TQRLabel;
    QRDBText24: TQRDBText;
    QRLabel30: TQRLabel;
    QRDBText25: TQRDBText;
    QRLabel31: TQRLabel;
    QRDBText26: TQRDBText;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRDBText27: TQRDBText;
    QRLabel34: TQRLabel;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRDBText30: TQRDBText;
    QRShape1: TQRShape;
    QRDBText31: TQRDBText;
    QRExpr2: TQRExpr;
    QRLabel37: TQRLabel;
    QRDBText32: TQRDBText;
    QRLabel38: TQRLabel;
    QRDBText33: TQRDBText;
    QRLabel39: TQRLabel;
    QRDBText34: TQRDBText;
    QRLabel40: TQRLabel;
    QRDBText35: TQRDBText;
    QRLabel41: TQRLabel;
    QRDBText36: TQRDBText;
    QRLabel42: TQRLabel;
    QRDBText37: TQRDBText;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRMemo1: TQRMemo;
    QRDBText5: TQRDBText;
    QTermo: TFDQuery;
    ACBrConsultaCPF1: TACBrConsultaCPF;
    Timer1: TTimer;
    ACBrConsultaCNPJ1: TACBrConsultaCNPJ;
    Btnhistorico: TBitBtn;
    BtnRecebimento: TBitBtn;
    TabSheet11: TTabSheet;
    QProdutos_Contrato: TFDQuery;
    DataProdutosContrato: TDataSource;
    Label48: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    MODALIDADE_CONTRATO: TComboBox;
    DT_CONTRATO_INI: TDateEdit;
    DT_CONTRATO_FIM: TDateEdit;
    Panel4: TPanel;
    Grid_Produtos_Contrato: TDBGrid;
    stat1: TStatusBar;
    btntermo: TBitBtn;
    Dt_Juros: TDateEdit;
    calcula_juros: TComboBox;
    Label53: TLabel;
    Label54: TLabel;
    SALDO_CONTA: TRxCalcEdit;
    Label55: TLabel;
    btn_add_saldo: TButton;
    btnCNPJ: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRetornaClick(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDiscardClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure ManutencaoShow(Sender: TObject);
    procedure AlfabetoClick(Sender: TObject);
    procedure btnPriorClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure TIPO_CLIENTEChange(Sender: TObject);
    procedure btnImprimeClick(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure TIPO_CLIENTEKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure NOMEKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnIBGEClick(Sender: TObject);
    procedure IBGEExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DT_FICHAEnter(Sender: TObject);
    procedure btnPaisClick(Sender: TObject);
    procedure btnComeca_ComClick(Sender: TObject);
    procedure Comeca_ComKeyPress(Sender: TObject; var Key: Char);
    procedure Comeca_ComEnter(Sender: TObject);
    procedure Grid_AutorizadosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Grid_AutorizadosKeyPress(Sender: TObject; var Key: Char);
    procedure ibqryQAutorizadosBeforeEdit(DataSet: TDataSet);
    procedure ibqryQAutorizadosBeforePost(DataSet: TDataSet);
    procedure ibqryQAutorizadosNewRecord(DataSet: TDataSet);
    procedure Grid_SeriaisKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Grid_SeriaisKeyPress(Sender: TObject; var Key: Char);
    procedure ibqryQSeriaisBeforeEdit(DataSet: TDataSet);
    procedure ibqryQSeriaisBeforePost(DataSet: TDataSet);
    procedure ibqryQSeriaisNewRecord(DataSet: TDataSet);
    procedure DDDChange(Sender: TObject);
    procedure QTD_LICENCAExit(Sender: TObject);
    procedure Repetir_EnderecoClick(Sender: TObject);
    procedure Grid_SeriaisKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_load_imageClick(Sender: TObject);
    procedure btnGerarClick(Sender: TObject);
    procedure SerialExit(Sender: TObject);
    procedure pgqryQAutorizadosBeforeEdit(DataSet: TDataSet);
    procedure pgqryQAutorizadosBeforePost(DataSet: TDataSet);
    procedure pgqryQAutorizadosNewRecord(DataSet: TDataSet);
    procedure QautorizadosBeforeEdit(DataSet: TDataSet);
    procedure QautorizadosBeforePost(DataSet: TDataSet);
    procedure QautorizadosNewRecord(DataSet: TDataSet);
    procedure QSeriaisBeforeEdit(DataSet: TDataSet);
    procedure QSeriaisBeforePost(DataSet: TDataSet);
    procedure QSeriaisNewRecord(DataSet: TDataSet);
    procedure Btn_GerarOnClick(Sender: TObject);
    procedure chk_0800Click(Sender: TObject);
    procedure PageControl2DrawTab(Control: TCustomTabControl; TabIndex: Integer;
      const Rect: TRect; Active: Boolean);
    procedure FDEventAlerter1Alert(ASender: TFDCustomEventAlerter;
      const AEventName: string; const AArgument: Variant);
    procedure btn_Incluir_InadimplenciaClick(Sender: TObject);
    procedure TabSheet5Show(Sender: TObject);
    procedure QautorizadosAfterPost(DataSet: TDataSet);
    procedure QautorizadosAfterOpen(DataSet: TDataSet);
    procedure Grid_DadosPetKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Grid_DadosPetKeyPress(Sender: TObject; var Key: Char);
    procedure QDadosPetAfterOpen(DataSet: TDataSet);
    procedure QDadosPetAfterPost(DataSet: TDataSet);
    procedure QDadosPetBeforeEdit(DataSet: TDataSet);
    procedure QDadosPetBeforePost(DataSet: TDataSet);
    procedure QDadosPetNewRecord(DataSet: TDataSet);
    procedure chk_produtorClick(Sender: TObject);
    procedure btntermoClick(Sender: TObject);
    procedure QRBand8BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnConsultarClick(Sender: TObject);
    procedure LabAtualizarCaptchaClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure CaptchaKeyPress(Sender: TObject; var Key: Char);
    procedure TabSheet10Show(Sender: TObject);
    procedure BtnhistoricoClick(Sender: TObject);
    procedure BtnRecebimentoClick(Sender: TObject);
    procedure TabSheet11Show(Sender: TObject);
    procedure Grid_Produtos_ContratoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure QProdutos_ContratoBeforeDelete(DataSet: TDataSet);
    procedure QProdutos_ContratoBeforeEdit(DataSet: TDataSet);
    procedure QProdutos_ContratoBeforePost(DataSet: TDataSet);
    procedure Grid_Produtos_ContratoColExit(Sender: TObject);
    procedure Grid_Produtos_ContratoKeyPress(Sender: TObject; var Key: Char);
    procedure QProdutos_ContratoNewRecord(DataSet: TDataSet);
    procedure QProdutos_ContratoAfterOpen(DataSet: TDataSet);
    procedure Anot_InadimplenciaKeyPress(Sender: TObject; var Key: Char);
    procedure calcula_jurosChange(Sender: TObject);
    procedure btn_add_saldoClick(Sender: TObject);
    procedure btnCNPJClick(Sender: TObject);


  private

    { Private declarations }
  public
    { Public declarations }
    CmdSelect: String;
    CmdOrderBy: String;
    CmdSelectNull: String;
    procedure Botoes_Editing;
    procedure Botoes_Normal;
    procedure Habilitar(Status: Boolean);
    procedure Insert;
    procedure Set_Campos(Vazio: Boolean);
    procedure Edit;
    procedure ConsultaCheque;
    procedure Licenca_Liberada;
    function Validacao: Boolean;

    procedure DetailSearch(Tabela: String);
    procedure VerificarInadimplencia;
    procedure GravaPlano(Codigo, Descricao, Altsaldo, Chave: String);


  end;

var
  FrmClientes: TFrmClientes;
  Operacao: String;
  ID: Integer;
  Tem_Anotacao, Is_Upload: Boolean;
  Imagem: TFileStream;
  Md5 : TIdHashMessageDigest5;



implementation

uses
  UPrincipal, UData, USeleciona_Clientes, UPesquisa, UConsulta,UAnot_Inadimplencia,
  pngimage,UHistorico_Clientes,UTrans_Recebimento_Lote, UInclui_Saldo, UConsultaCNPJ;

{$R *.dfm}

procedure TFrmClientes.GravaPlano(Codigo, Descricao, Altsaldo, Chave: String);
begin
  IQuery.Sql.Clear;
  IQuery.Sql.Add('INSERT INTO PLANO( ' +
                 'CODIGO,    DESCRICAO,    ALTSALDO,    CHAVE) VALUES(' +
                 ':CODIGO,   :DESCRICAO,   :ALTSALDO,   :CHAVE)');

  IQuery.ParamByName('CODIGO').AsString    := Codigo;
  IQuery.ParamByName('DESCRICAO').AsString := Descricao;
  IQuery.ParamByName('ALTSALDO').AsString  := Altsaldo;
  IQuery.ParamByName('CHAVE').AsString     := Chave;

  IQuery.Prepare;
  IQuery.ExecSql;

end;


function LogEntry(Cmd, Msg: String; Dig: String): String;
begin
  Result := Format('%s%s' + '%s', [Cmd, Msg, Dig]);
end;


procedure TFrmClientes.VerificarInadimplencia;
Var
I_Data,I_Historico,I_Funcionario : String;
begin
 Anot_Inadimplencia.Lines.Clear;

 QInadimplencia.close;
 QInadimplencia.ParamByName('CLIENTE_ID').AsInteger := QTabela.FieldByname('CLIENTE_ID').AsInteger;
 QInadimplencia.prepare;
 QInadimplencia.Open;

 QInadimplencia.First;

 if not QInadimplencia.IsEmpty then
 Begin
  Anot_Inadimplencia.Lines.Clear;
  while  not QInadimplencia.Eof do
  Begin
   I_Data        := DateToStr(QInadimplencia.FieldByName('DT_CADASTRO').AsDateTime);
   I_Historico   := QInadimplencia.FieldByName('HISTORICO').AsString;
   I_Funcionario := QInadimplencia.FieldByName('FUNCIONARIO').AsString;

    ANot_Inadimplencia.Lines.Add(I_data + '   ' +  ForcaComprimento(Copy(I_Historico,1,70) ,90 + (90 -Length(Copy(I_Historico,1,70))) ,' ')  + (Copy(I_Funcionario,1,20)));

    if Length(I_Historico) > 70 then
    ANot_Inadimplencia.Lines.Add(ForcaComprimento(Copy(I_Historico,71,70), 60 +(60- Length(Copy(I_Historico,71,70))) ,' '));

    QInadimplencia.Next;

  End;
 End;
end;

procedure TFrmClientes.ConsultaCheque;
Begin
if QTabela.FieldByName('BLOQ_CHEQUE').AsString = 'SIM' then
  Begin

    Label63.Visible := True;
    Label63.Caption := 'Cliente com Bloqueio de Cheques!' ;
  End
  Else
    Label63.Visible := False;
End;

procedure TFrmClientes.btnCNPJClick(Sender: TObject);
begin
  ConsultaCNPJ(NOME, FANTASIA, INSCRICAO, ENDERECO, NUMERO, COMPLEMENTO, IBGE, MUNICIPIO, BAIRRO, COD_PAIS, CNPJ, CEP, ESTADO, TIPO_CLIENTE);
end;

procedure TFrmClientes.LabAtualizarCaptchaClick(Sender: TObject);
var
    Stream: TMemoryStream;
    ImgArq: String;
    png: TPngImage;

begin
  {

  if TIPO_CLIENTE.Text = 'PESSOA FÍSICA' Then
  begin
    Stream := TMemoryStream.Create;
    try
      ACBrConsultaCPF1.Captcha(Stream);
      ImgArq := ExtractFilePath(ParamStr(0))+PathDelim+'captch.png';
      Stream.SaveToFile( ImgArq );
      Image1.Picture.LoadFromFile( ImgArq );

      Captcha.Clear;
      //Captcha.SetFocus;
    finally
      Stream.Free;
    end;
  end
  Else
  begin
   Stream:= TMemoryStream.Create;
  try
    ACBrConsultaCNPJ1.Captcha(Stream);


    ShowMessage('Atenção: Seu Delphi não dá suporte nativo a imagens PNG. Queira verificar o código fonte deste exemplo para saber como proceder.');
    // COMO PROCEDER:
    //
    // 1) Caso o site da receita esteja utilizando uma imagem do tipo JPG, você pode utilizar o código comentado abaixo.
    //    * Comente ou apague o código que trabalha com PNG, incluindo o IFDEF/ENDIF;
    //    * descomente a declaração da variável jpg
    //    * descomente o código abaixo;
    // 2) Caso o site da receita esteja utilizando uma imagem do tipo PNG, você terá que utilizar uma biblioteca de terceiros para
    //conseguir trabalhar com imagens PNG.
    //  Neste caso, recomendamos verificar o manual da biblioteca em como fazer a implementação. Algumas sugestões:
    //    * Procure no Fórum do ACBr sobre os erros que estiver recebendo. Uma das maneiras mais simples está no link abaixo:
    //      - http://www.projetoacbr.com.br/forum/topic/20087-imagem-png-delphi-7/
    //    * O exemplo acima utiliza a biblioteca GraphicEX. Mas existem outras bibliotecas, caso prefira:
    //      - http://synopse.info/forum/viewtopic.php?id=115
    //      - http://graphics32.org/wiki/
    //      - http://cc.embarcadero.com/Item/25631
    //      - Várias outras: http://torry.net/quicksearchd.php?String=png&Title=Yes
  {$ENDIF}

    //Use esse código quando a imagem do site for do tipo JPG
    //Jpg:= TJPEGImage.Create;
    //try
    //  Jpg.LoadFromStream(Stream);
    //  Image1.Picture.Assign(Jpg);
    //   //    EditCaptcha.Clear;
    //  EditCaptcha.SetFocus;
    //finally
    //  Jpg.Free;
   //end;

 // finally
  //  Stream.Free;
  //end;

 // end;


end;

procedure TFrmClientes.licenca_liberada;
Begin
  IQuery.SQL.Clear;
  IQuery.Sql.Add('SELECT COUNT(*) SOMA FROM SERIAIS');
  IQuery.Sql.Add('WHERE CLIENTE_ID = :CLIENTE_ID');
  IQuery.ParambyName('CLIENTE_ID').AsInteger := QTabela.FieldByName('CLIENTE_ID').AsInteger;
  IQuery.Prepare;
  IQuery.Open;


   if IQuery.FieldByName('SOMA').AsInteger <= QTabela.FieldByName('QTD_LICENCA').AsInteger then
    Begin
      Label67.Visible := True;
      Label67.Font.Color := clWindowText;
      Label67.Caption := 'Licenças Liberadas: ' + IntToStr(IQuery.FieldByName('SOMA').AsInteger);
    End;
    if IQuery.FieldByName('SOMA').AsInteger > QTabela.FieldByName('QTD_LICENCA').AsInteger then
    Begin
      Label67.Visible := True;
      Label67.Font.Color := ClRed;
      Label67.Caption := 'Licenças Liberadas: ' + IntToStr(IQuery.FieldByName('SOMA').AsInteger);
    End;

    if IQuery.FieldByName('SOMA').AsInteger = 0 Then
       Label67.Visible := False;

End;

procedure TFrmClientes.DetailSearch(Tabela: String);
begin
  if (Tabela = '') or (Tabela = 'IBGE') then
  begin
    QIBGE.Close;

    QIBGE.ParamByName('IBGE').AsString := IBGE.Text;

    QIBGE.Prepare;
    QIBGE.Open;
  end;
end;

procedure TFrmClientes.DT_FICHAEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmClientes.AlfabetoClick(Sender: TObject);
begin
  if Alfabeto.TabIndex <> 26 then
  begin
    if FrmData.QAcesso.FieldByName('DESATIVADOS').AsString  = 'True' Then
      CmdSelectNull := 'WHERE (NOME LIKE ' + #39 + Chr(Alfabeto.TabIndex + 65) + '%' + #39 + ') AND (STATUS <> ' + #39 + 'I' + #39 + ')'
    else
      CmdSelectNull := 'WHERE (NOME LIKE ' + #39 + Chr(Alfabeto.TabIndex + 65) + '%' + #39 + ') AND (STATUS = ' + #39 + 'A' + #39 + ')';
  end
  else
  begin
    if FrmData.QAcesso.FieldByName('DESATIVADOS').AsString  = 'True' Then
      CmdSelectNull := 'WHERE (CLIENTE_ID IS NOT NULL) AND (STATUS <> ' + #39 + 'I' + #39 + ')'
    else
      CmdSelectNull := 'WHERE (CLIENTE_ID IS NOT NULL) AND (STATUS = ' + #39 + 'A' + #39 + ')';
  end;

  CmdOrderBy := 'ORDER BY NOME';
  
  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

  QTabela.Prepare;
  QTabela.Open;
end;

procedure TFrmClientes.btntermoClick(Sender: TObject);
begin
QTermo.Close;
QTermo.ParamByName('CLIENTE_ID').AsInteger := QTabela.FieldByName('CLIENTE_ID').AsInteger;
QTermo.Prepare;
QTermo.Open();


Termo_Autorizacao.Prepare;
Termo_Autorizacao.Preview;
end;

procedure TFrmClientes.btn_add_saldoClick(Sender: TObject);
begin
  IncluiSaldo(QTabela.FieldByName('CLIENTE_ID').asInteger,FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger, SALDO_CONTA.Value);
  QTabela.Refresh;
  SALDO_CONTA.Value := QTabela.FieldByName('SALDO_CONTA').AsFloat;
end;

procedure TFrmClientes.Anot_InadimplenciaKeyPress(Sender: TObject;
 var Key: Char);
var
  caracter : string; // variável q vai receber a letra em maiúsculo
begin
  caracter := UpperCase(key); // passa a letra para maiúsculo
  key := caracter[1]; // passa a letra pra ser escrita no memo
end;

procedure TFrmClientes.Botoes_Editing;
begin
  btnPrior.Enabled       := False;
  btnNext.Enabled        := False;
  btnInsert.Enabled      := False;
  btnEdit.Enabled        := False;
  btnDelete.Enabled      := False;
  btnSave.Enabled        := True;
  btnDiscard.Enabled     := True;
  btnRetorna.Enabled     := False;
  btnImprime.Enabled     := False;
  btnPesquisa.Enabled    := False;
  btnIBGE.Enabled        := True;
  btnPais.Enabled        := True;
  btnComeca_Com.Enabled  := False;
  Comeca_Com.Enabled     := False;
  btn_load_image.Enabled := True;
  btnGerar.Enabled       := True;
  btn_geraron.enabled    := True;
  Btn_Incluir_Inadimplencia.enabled := True;
  btntermo.enabled       := True;
 // Captcha.enabled        := True;
 // btnConsultar.Enabled   := True;
  Btnhistorico.Enabled   := True;
  BtnRecebimento.Enabled := True;
  btnCNPJ.Enabled        := True;
  if Operacao = 'Alterando' then
    btn_add_saldo.Enabled  := True;
end;

procedure TFrmClientes.Botoes_Normal;
begin

  if not QTabela.Bof then
    btnPrior.Enabled := True
  else
    btnPrior.Enabled := False;

  if not QTabela.Eof then
    btnNext.Enabled := True
  else
    btnNext.Enabled := False;

  btnInsert.Enabled := True;

  if not QTabela.IsEmpty then
  begin
    btnEdit.Enabled := True;
    btnDelete.Enabled := True;
  end
  else
  begin
    btnEdit.Enabled := False;
    btnDelete.Enabled := False;
  end;

 { if QTabela.FieldByName('TIPO_CLIENTE').AsString = 'PESSOA FÍSICA' then
    TabSheet3.TabVisible := True
  else
    TabSheet3.TabVisible := False;}

  btnSave.Enabled       := False;
  btn_add_saldo.Enabled := False;
  btnGerar.Enabled      := False;
  btn_geraron.enabled   := False;
  btnDiscard.Enabled    := False;
  btnRetorna.Enabled    := True;
  btnImprime.Enabled    := True;
  btnPesquisa.Enabled   := True;
  btnIBGE.Enabled       := False;
  btnPais.Enabled       := False;
  btnComeca_Com.Enabled := True;
  Comeca_Com.Enabled    := True;
  Btn_Incluir_Inadimplencia.enabled := False;
  btntermo.Enabled      := False;
  //Captcha.enabled       := False;
  //btnConsultar.Enabled  := False;
  Btnhistorico.Enabled  := False;
  BtnRecebimento.Enabled := False;
  btnCNPJ.Enabled       := False;

   if   Caso(Copy(FrmData.QAcesso.FieldByName('OPCOES').AsString, 66, 1))  = True Then
   Begin
   btnEdit.Enabled        := True;
   btnDelete.Enabled      := False;
   btnhistorico.Visible   := False;
   BtnRecebimento.Visible := False;
   btntermo.Visible       := False;
   LImite.ReadOnly        := True;
   limite_Cheque.ReadOnly := True;
  // TabSheet10.TabVisible  :=False;
   TabSheet5.TabVisible  :=False;
   TabSheet6.TabVisible  :=False;
   TabSheet7.TabVisible  :=False;
   TabSheet8.TabVisible  :=False;
   TabSheet9.TabVisible  :=False;
   //TabSheet10.TabVisible  :=False;
   End;


end;

procedure TFrmClientes.Habilitar(Status: Boolean);
var
I: Integer;
Temp: TComponent;
begin
  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
      TEdit(Temp).Enabled := Status;

    if Temp is TMaskEdit then
      TMaskEdit(Temp).Enabled := Status;

    if Temp is TComboBox then
      TComboBox(Temp).Enabled := Status;

    if Temp is TDateEdit then
      TDateEdit(Temp).Enabled := Status;

    if Temp is TRxCalcEdit then
      TRxCalcEdit(Temp).Enabled := Status;

    if Temp is TCurrencyEdit then
      TCurrencyEdit(Temp).Enabled := Status;

    if Temp is TCheckBox then
      TCheckBox(Temp).Enabled := Status;

    if Tem_Anotacao then
    begin
      if Temp is TMemo then
        TMemo(Temp).Enabled := Status;
    end;

    if STATUS then
    Bloqueado.Enabled := Caso(Copy(FrmData.QAcesso.FieldByName('OPCOES').AsString, 61, 1));
  end;
end;

procedure TFrmClientes.IBGEExit(Sender: TObject);
begin
  DetailSearch('IBGE');

  if Municipio.Text <> 'EXTERIOR' then
  Begin
  Municipio.Text := QIbge.FieldByName('DESCRICAO').AsString;
  Estado.Text    := QIbge.FieldByName('UF_SIGLA').AsString;
  Cod_Pais.Text  := '01058';
  End;
end;

procedure TFrmClientes.Insert;
var
I: Integer;
Temp: TComponent;
Sql, Par: String;
begin
  Sql := 'INSERT INTO CLIENTES(';
  Par := '';

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
    begin
      if Sql = 'INSERT INTO CLIENTES(' then
        Sql := Sql + TEdit(Temp).Name
      else
        Sql := Sql + ', ' + TEdit(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TEdit(Temp).Name
      else
        Par := Par + ', :' + TEdit(Temp).Name;
    end;

    if Temp is TMaskEdit then
    begin
      if Sql = 'INSERT INTO CLIENTES(' then
        Sql := Sql + TMaskEdit(Temp).Name
      else
        Sql := Sql + ', ' + TMaskEdit(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TMaskEdit(Temp).Name
      else
        Par := Par + ', :' + TMaskEdit(Temp).Name;
    end;

    if Temp is TComboBox then
    begin
      if Sql = 'INSERT INTO CLIENTES(' then
        Sql := Sql + TComboBox(Temp).Name
      else
        Sql := Sql + ', ' + TComboBox(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TComboBox(Temp).Name
      else
        Par := Par + ', :' + TComboBox(Temp).Name;
    end;

    if Temp is TDateEdit then
    begin
      if Sql = 'INSERT INTO CLIENTES(' then
        Sql := Sql + TDateEdit(Temp).Name
      else
        Sql := Sql + ', ' + TDateEdit(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TDateEdit(Temp).Name
      else
        Par := Par + ', :' + TDateEdit(Temp).Name;
    end;

    if Temp is TRxCalcEdit then
    begin
      if Sql = 'INSERT INTO CLIENTES(' then
        Sql := Sql + TRxCalcEdit(Temp).Name
      else
        Sql := Sql + ', ' + TRxCalcEdit(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TRxCalcEdit(Temp).Name
      else
        Par := Par + ', :' + TRxCalcEdit(Temp).Name;
    end;

    if Temp is TCurrencyEdit then
    begin
      if Sql = 'INSERT INTO CLIENTES(' then
        Sql := Sql + TCurrencyEdit(Temp).Name
      else
        Sql := Sql + ', ' + TCurrencyEdit(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TCurrencyEdit(Temp).Name
      else
        Par := Par + ', :' + TCurrencyEdit(Temp).Name;
    end;

   if (Temp is TImage) AND (FrmPrincipal.Config.FieldByName('EXIBE_FOTO').AsString = 'True') AND (Is_Upload = True) then
    begin
      if Sql = 'INSERT INTO CLIENTES(' then
        Sql := Sql + TImage(Temp).Name
      else
        Sql := Sql + ', ' + TImage(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TImage(Temp).Name
      else
        Par := Par + ', :' + TImage(Temp).Name;
    end;




    if Tem_Anotacao then
    begin
      if Temp is TMemo then
      begin
        if Sql = 'INSERT INTO CLIENTES(' then
          Sql := Sql + TMemo(Temp).Name
        else
          Sql := Sql + ', ' + TMemo(Temp).Name;
        if Par = '' then
          Par := Par + ':' + TMemo(Temp).Name
        else
          Par := Par + ', :' + TMemo(Temp).Name;
      end;
    end;
  end;

  Sql := Sql + ') VALUES(' + Par + ')';

  

  IQuery.Sql.Clear;
  IQuery.Sql.Add(Sql);

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
      IQuery.ParamByName(TEdit(Temp).Name).AsString := TEdit(Temp).Text;

    if Temp is TMaskEdit then
      IQuery.ParamByName(TMaskEdit(Temp).Name).AsString := TMaskEdit(Temp).Text;

    if Temp is TComboBox then
      IQuery.ParamByName(TComboBox(Temp).Name).AsString := TComboBox(Temp).Text;

    if Temp is TDateEdit then
      IQuery.ParamByName(TDateEdit(Temp).Name).AsDateTime := TDateEdit(Temp).Date;

    if Temp is TRxCalcEdit then
      IQuery.ParamByName(TRxCalcEdit(Temp).Name).AsFloat := TRxCalcEdit(Temp).Value;

    if Temp is TCurrencyEdit then
      IQuery.ParamByName(TCurrencyEdit(Temp).Name).AsFloat := TCurrencyEdit(Temp).Value;


   if (Temp is TImage) AND (FrmPrincipal.Config.FieldByName('EXIBE_FOTO').AsString = 'True') AND (Is_Upload = True) then
   Begin
      IQuery.ParamByName('FOTO').LoadFromStream(Imagem, FTBlob);
   End;


    if Tem_Anotacao then
    begin
      if Temp is TMemo then
        IQuery.ParamByName(TMemo(Temp).Name).AsByteStr := TMemo(Temp).Text;
    end;

  end;

  IQuery.Prepare;
  IQuery.ExecSql;


  Is_Upload := False;

  Habilitar(False);
end;

procedure TFrmClientes.Edit;
var
I: Integer;
Temp: TComponent;
Sql: String;
begin
  Sql := 'UPDATE CLIENTES SET ';

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
    begin
      if Sql = 'UPDATE CLIENTES SET ' then
        Sql := Sql + TEdit(Temp).Name + ' = :' + TEdit(Temp).Name
      else
        Sql := Sql + ', ' + TEdit(Temp).Name + ' = :' + TEdit(Temp).Name;
    end;

    if Temp is TMaskEdit then
    begin
      if Sql = 'UPDATE CLIENTES SET ' then
        Sql := Sql + TMaskEdit(Temp).Name + ' = :' + TMaskEdit(Temp).Name
      else
        Sql := Sql + ', ' + TMaskEdit(Temp).Name + ' = :' + TMaskEdit(Temp).Name;
    end;

    if Temp is TComboBox then
    begin
      if Sql = 'UPDATE CLIENTES SET ' then
        Sql := Sql + TComboBox(Temp).Name + ' = :' + TComboBox(Temp).Name
      else
        Sql := Sql + ', ' + TComboBox(Temp).Name + ' = :' + TComboBox(Temp).Name;
    end;

    if Temp is TDateEdit then
    begin
      if Sql = 'UPDATE CLIENTES SET ' then
        Sql := Sql + TDateEdit(Temp).Name + ' = :' + TDateEdit(Temp).Name
      else
        Sql := Sql + ', ' + TDateEdit(Temp).Name + ' = :' + TDateEdit(Temp).Name;
    end;

    if Temp is TRxCalcEdit then
    begin
      if Sql = 'UPDATE CLIENTES SET ' then
        Sql := Sql + TRxCalcEdit(Temp).Name + ' = :' + TRxCalcEdit(Temp).Name
      else
        Sql := Sql + ', ' + TRxCalcEdit(Temp).Name + ' = :' + TRxCalcEdit(Temp).Name;
    end;


    if (Temp is TImage) AND (FrmPrincipal.Config.FieldByName('EXIBE_FOTO').AsString = 'True') AND (Is_Upload = True) then
    begin
      if Sql = 'UPDATE CLIENTES SET ' then
        Sql := Sql + TImage(Temp).Name + ' = :' + TImage(Temp).Name
      else
        Sql := Sql + ', ' + TImage(Temp).Name + ' = :' + TImage(Temp).Name;
    end;

    if Temp is TCurrencyEdit then
    begin
      if Sql = 'UPDATE CLIENTES SET ' then
        Sql := Sql + TCurrencyEdit(Temp).Name + ' = :' + TCurrencyEdit(Temp).Name
      else
        Sql := Sql + ', ' + TCurrencyEdit(Temp).Name + ' = :' + TCurrencyEdit(Temp).Name;
    end;

    if Tem_Anotacao then
    begin
      if Temp is TMemo then
      begin
        if Sql = 'UPDATE CLIENTES SET ' then
          Sql := Sql + TMemo(Temp).Name + ' = :' + TMemo(Temp).Name
        else
          Sql := Sql + ', ' + TMemo(Temp).Name + ' = :' + TMemo(Temp).Name;
      end;
    end;
  end;

  Sql := Sql + ' WHERE (CLIENTE_ID = :ID)';

  

  IQuery.Sql.Clear;
  IQuery.Sql.Add(Sql);

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];
    if Temp is TEdit then
      IQuery.ParamByName(TEdit(Temp).Name).AsString := TEdit(Temp).Text;

    if Temp is TMaskEdit then
      IQuery.ParamByName(TMaskEdit(Temp).Name).AsString := TMaskEdit(Temp).Text;

    if Temp is TComboBox then
      IQuery.ParamByName(TComboBox(Temp).Name).AsString := TComboBox(Temp).Text;

    if Temp is TDateEdit then
      IQuery.ParamByName(TDateEdit(Temp).Name).AsDateTime := TDateEdit(Temp).Date;

    if Temp is TRxCalcEdit then
      IQuery.ParamByName(TRxCalcEdit(Temp).Name).AsFloat := TRxCalcEdit(Temp).Value;

    if Temp is TCurrencyEdit then
      IQuery.ParamByName(TCurrencyEdit(Temp).Name).AsFloat := TCurrencyEdit(Temp).Value;

    if (Temp is TImage) AND (FrmPrincipal.Config.FieldByName('EXIBE_FOTO').AsString = 'True') AND (Is_Upload = True) then
       IQuery.ParamByName(TImage(Temp).Name).LoadFromStream(Imagem, FTBlob);

    if Tem_Anotacao then
    begin
      if Temp is TMemo then
        IQuery.ParamByName(TMemo(Temp).Name).AsByteStr := TMemo(Temp).Text;
    end;

   If  (FrmPrincipal.Config.FieldByName('AUDITORIA').AsString = 'True') Then
   Begin
    if Temp is TEdit Then  //or (Temp is TComboBox) or (Temp is TCurrencyEdit) or (Temp is TRxCalcEdit) or (Temp is TDateEdit) then
    Begin
     if (QTabela.FieldbyName(TEdit(Temp).Name).AsString <> TEdit(Temp).Text)  Then
     GravarLog('CLIENTE','EDITAR',DateToStr(date),TimeToStr(time),TEdit(Temp).Name,TEdit(Temp).Text,QTabela.FieldbyName(TEdit(Temp).Name).AsString,FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger,QTabela.FieldByName('CLIENTE_ID').AsInteger);
    End;
    if Temp is TComboBox   Then
    Begin
     if (QTabela.FieldbyName(TComboBox(Temp).Name).AsString <> TComboBox(Temp).Text)  Then
     GravarLog('CLIENTE','EDITAR',DateToStr(date),TimeToStr(time),TComboBox(Temp).Name,TComboBox(Temp).Text,QTabela.FieldbyName(TComboBox(Temp).Name).AsString,FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger,QTabela.FieldByName('CLIENTE_ID').AsInteger);
    End;
    if Temp is TCurrencyEdit   Then
    Begin
     if  FloatToStr(QTabela.FieldbyName(TCurrencyEdit(Temp).Name).AsFloat) <> (TCurrencyEdit(Temp).Text) Then
     GravarLog('CLIENTE','EDITAR',DateToStr(date),TimeToStr(time),TCurrencyEdit(Temp).Name,FloatToStr(TCurrencyEdit(Temp).Value),FloatToStr(QTabela.FieldbyName(TCurrencyEdit(Temp).Name).AsFloat),FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger,QTabela.FieldByName('CLIENTE_ID').AsInteger);
    End;
    if Temp is TRxCalcEdit   Then
    Begin
     if  FloatToStr(QTabela.FieldbyName(TRxCalcEdit(Temp).Name).AsFloat) <> (TRxCalcEdit(Temp).Text)  Then
     GravarLog('CLIENTE','EDITAR',DateToStr(date),TimeToStr(time),TRxCalcEdit(Temp).Name,TRxCalcEdit(Temp).Text,QTabela.FieldbyName(TRxCalcEdit(Temp).Name).AsString,FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger,QTabela.FieldByName('CLIENTE_ID').AsInteger);
    End;
    if Temp is TDateEdit   Then
    Begin
     if (QTabela.FieldbyName(TDateEdit(Temp).Name).AsDateTime <> TDateEdit(Temp).Date) Then
     GravarLog('CLIENTE','EDITAR',DateToStr(date),TimeToStr(time),TDateEdit(Temp).Name,DateToStr(TDateEdit(Temp).Date),DateToStr(QTabela.FieldbyName(TDateEdit(Temp).Name).AsDateTime),FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger,QTabela.FieldByName('CLIENTE_ID').AsInteger);
    End;
    if Temp is TMaskEdit   Then
    Begin
     GravarLog('CLIENTE','EDITAR',DateToStr(date),TimeToStr(time),TMaskEdit(Temp).Name,TMaskEdit(Temp).Text,'',FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger,QTabela.FieldByName('CLIENTE_ID').AsInteger);
    End;
   End;

  end;

  IQuery.ParamByName('ID').AsInteger := QTabela.FieldByName('CLIENTE_ID').AsInteger;


  IQuery.Prepare;
  IQuery.ExecSql;

  QTabela.Close;

  QTabela.Prepare;
  QTabela.Open;

  Is_Upload := False;

  QTabela.Locate('CLIENTE_ID', ID, [loCaseInsensitive]);

  Habilitar(False);

end;

function TFrmClientes.Validacao: Boolean;
var
LibHandle: THandle;
ConsisteInscricaoEstadual: TConsisteInscricaoEstadual;

begin

  Result := False;

  CNPJ.Color         := clWindow;
  TIPO_CLIENTE.Color := clWindow;
  ESTADO.Color       := clWindow;
  BLOQUEADO.Color    := clWindow;
  INSCRICAO.Color    := clWindow;
  NOME.Color         := clWindow;
  ENDERECO.Color     := clWindow;
  BAIRRO.Color       := clWindow;
  IBGE.Color         := clWindow;
  EMAIL.Color        := clWindow;
  COD_PAIS.Color     := clWindow;

  if (COD_PAIS.Text = '01058') and (FrmPrincipal.Config.FieldByName('SPED').AsString = 'True') and  (not chk_produtor.Checked) then
  begin
    if (Operacao = 'Inserindo') and (Alltrim(SemMascara(CNPJ.Text)) <> '') then
    begin
      IQuery.Sql.Clear;
      IQuery.Sql.Add('SELECT * FROM CLIENTES');
      IQuery.Sql.Add('WHERE');
      IQuery.Sql.Add('(CNPJ = :CNPJ)');

      IQuery.ParamByName('CNPJ').AsString := CNPJ.Text;

      IQuery.Prepare;
      IQuery.Open;

      if not IQuery.IsEmpty then
      begin
        Application.MessageBox('Já existe um CPF/CNPJ com este número cadastrado', PChar(Msg_Title), mb_IconStop);
        CNPJ.Color := clYellow;
        CNPJ.SetFocus;
        exit;
      end;
    end;

    if (Operacao = 'Alterando') and (Alltrim(SemMascara(CNPJ.Text)) <> '') and  (not chk_produtor.Checked) then
    begin
      IQuery.Sql.Clear;
      IQuery.Sql.Add('SELECT * FROM CLIENTES');
      IQuery.Sql.Add('WHERE');
      IQuery.Sql.Add('(CNPJ = :CNPJ)');
      IQuery.Sql.Add('AND (CLIENTE_ID <> :CLIENTE_ID)');

      IQuery.ParamByName('CNPJ').AsString := CNPJ.Text;
      IQuery.ParamByName('CLIENTE_ID').AsInteger := QTabela.FieldByName('CLIENTE_ID').AsInteger;

      IQuery.Prepare;
      IQuery.Open;

      if not IQuery.IsEmpty then
      begin
        Application.MessageBox('Já existe um CPF/CNPJ com este número cadastrado', PChar(Msg_Title), mb_IconStop);
        CNPJ.Color := clYellow;
        CNPJ.SetFocus;
        exit;
      end;
    end;
  end;

  if NOME.Text = '' then
  begin
    Application.MessageBox('Nome Inválido', PChar(Msg_Title), mb_IconStop);
    NOME.Color := clYellow;
    NOME.SetFocus;
    exit;
  end;

  if Numero.Text = '' then
  begin
    Application.MessageBox('Informar Número do endereço', PChar(Msg_Title), mb_IconStop);
    Numero.Color := clYellow;
    Numero.SetFocus;
    exit;
  end;

  if Inscricao.Text = '' then
  begin
    Application.MessageBox('Informar Inscrição/RG', PChar(Msg_Title), mb_IconStop);
    Inscricao.Color := clYellow;
    Inscricao.SetFocus;
    exit;
  end;

  if LeIni(Arq_Ini, 'Sistema', 'Cadastro obrigatório do telefone do cliente') = 'True' then
  begin
    if (Length(Telefone_1.Text) < 9)   then
    begin
      Application.MessageBox('Telefone Inválido, Favor informar número do Telefone (xx) xxxxxxxxx!', PChar(Msg_Title), mb_IconStop);
      Telefone_1.Color := clYellow;
      Telefone_1.SetFocus;
      exit;
    end;
  end;


  if (TIPO_CLIENTE.Text <> 'PESSOA FÍSICA') and (TIPO_CLIENTE.Text <> 'PESSOA JURÍDICA') then
  begin
    Application.MessageBox('Tipo Cliente inválido', PChar(Msg_Title), mb_IconStop);
    TIPO_CLIENTE.Color := clYellow;
    TIPO_CLIENTE.SetFocus;
    exit;
  end;

  if ENDERECO.Text = '' then
  begin
    Application.MessageBox('Endereço Inválido', PChar(Msg_Title), mb_IconStop);
    ENDERECO.Color := clYellow;

    if ENDERECO.CanFocus then
      ENDERECO.SetFocus;

    exit;
  end;

  if BAIRRO.Text = '' then
  begin
    Application.MessageBox('Bairro Inválido', PChar(Msg_Title), mb_IconStop);
    BAIRRO.Color := clYellow;

    if BAIRRO.CanFocus then
      BAIRRO.SetFocus;

    exit;
  end;

  if not ChecaEstado(ESTADO.Text) then
  begin
    Application.MessageBox('Estado inválido', PChar(Msg_Title), mb_IconStop);
    ESTADO.Color := clYellow;

    if ESTADO.CanFocus then
      ESTADO.SetFocus;

    exit;
  end;

  if (COD_PAIS.Text = '01058') and (FrmPrincipal.Config.FieldByName('SPED').AsString = 'True') then
  begin
    if QIBGE.IsEmpty then
    begin
      Application.MessageBox('IBGE inexistente', PChar(Msg_Title), mb_IconStop);
      IBGE.Color := clYellow;

      if IBGE.CanFocus then
         IBGE.SetFocus;

      exit;
    end;
  end;

  if FrmPrincipal.Config.FieldByName('SPED').AsString = 'True' then
  begin
    IQuery.Sql.Clear;
    IQuery.Sql.Add('SELECT * FROM PAISES');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(CODIGO = :CODIGO)');

    IQuery.ParamByName('CODIGO').AsString := COD_PAIS.Text;

    IQuery.Prepare;
    IQuery.Open;

    if IQuery.IsEmpty then
    begin
      Application.MessageBox('Cód.País inexistente', PChar(Msg_Title), mb_IconStop);

      COD_PAIS.Color := clYellow;

      if COD_PAIS.CanFocus then
        COD_PAIS.SetFocus;

      exit;
    end;
  end;

  if (COD_PAIS.Text = '01058') and (FrmPrincipal.Config.FieldByName('SPED').AsString = 'True') then
  begin

     if MUNICIPIO.Text = '' then
     begin
        Application.MessageBox('Município inválido', PChar(Msg_Title), mb_IconStop);
        MUNICIPIO.Color := clYellow;
        MUNICIPIO.SetFocus;
        exit;
     end;

     if CEP.Text = '' then
     begin
        Application.MessageBox('CEP inválido', PChar(Msg_Title), mb_IconStop);
        CEP.Color := clYellow;
        CEP.SetFocus;
        exit;
     end;



    if TIPO_CLIENTE.Text = 'PESSOA FÍSICA' then
    begin
      if Alltrim(SemMascara(CNPJ.Text)) = '' then
      begin
        Application.MessageBox('CPF inválido', PChar(Msg_Title), mb_IconStop);
        CNPJ.Color := clYellow;
        CNPJ.SetFocus;
        exit;
      end;

      if not ValidCpf(StrZero(SemMascara(CNPJ.Text), 11, 0)) then
      begin
        Application.MessageBox('Dígito Verificador do CPF inválido', PChar(Msg_Title), mb_IconStop);
        CNPJ.Color := clYellow;
        CNPJ.SetFocus;
        exit;
      end;
    end
    else
    begin
      if Alltrim(SemMascara(CNPJ.Text)) = '' then
      begin
        Application.MessageBox('CNPJ inválido', PChar(Msg_Title), mb_IconStop);
        CNPJ.Color := clYellow;
        CNPJ.SetFocus;
        exit;
      end;

      if not ValidCgc(StrZero(SemMascara(CNPJ.Text), 14, 0)) then
      begin
        Application.MessageBox('Dígito Verificador do CNPJ inválido', PChar(Msg_Title), mb_IconStop);
        CNPJ.Color := clYellow;
        CNPJ.SetFocus;
        exit;
      end;

      if Alltrim(SemMascara(INSCRICAO.Text)) <> '' then
      begin
        LibHandle :=  LoadLibrary(PChar(Trim('DllInscE32.Dll')));
        try
          if  LibHandle <= HINSTANCE_ERROR then
            raise Exception.Create ('Dll não carregada');

          @ConsisteInscricaoEstadual := GetProcAddress(LibHandle, 'ConsisteInscricaoEstadual');

          if  @ConsisteInscricaoEstadual  = nil then
            raise Exception.Create('Entrypoint Download não encontrado na Dll');

          if TRegEx.IsMatch(SemMascara(INSCRICAO.Text), '[0-9]+') then
          begin
            if ESTADO.Text = 'MG' then
            begin
              INSCRICAO.Text := StrZero(INSCRICAO.Text,13,0);
            end
            else
            if ESTADO.Text = 'SP' then
            begin
              INSCRICAO.Text := StrZero(INSCRICAO.Text,12,0);
            end
            else
            if ESTADO.Text = 'SC' then
            begin
              INSCRICAO.Text := StrZero(INSCRICAO.Text,9,0);
            end;
          end;

          if ConsisteInscricaoEstadual(Alltrim(SemMascara(INSCRICAO.Text)), ESTADO.Text) = 1 then
          begin
           // Application.MessageBox('Inscrição Estadual inválida', PChar(Msg_Title), mb_IconStop);
           // INSCRICAO.Color := clYellow;
           // INSCRICAO.SetFocus;
           // exit;
          end;
        finally
          FreeLibrary(LibHandle);
        end;
      end;
    end;
  end;

  if TRegEx.IsMatch(INSCRICAO.Text, ' *[iI].*[sSzZ][eE][nN][tT] *') then
    INSCRICAO.Text := 'ISENTO';

  if (EMAIL.Text <> '') and (not ValidaEmail(PChar(EMAIL.Text))) and (Pos(';',Email.Text) = 0) then
  begin
    Application.MessageBox('e-mail Inválido', PChar(Msg_Title), mb_IconStop);
    EMAIL.Color := clYellow;

    if EMAIL.CanFocus then
      EMAIL.SetFocus;

    exit;
  end;

  if (BLOQUEADO.Text <> 'SIM') and (BLOQUEADO.Text <> 'NÃO') and (BLOQUEADO.Text <> '') then
  begin
    Application.MessageBox('Tipo de Bloqueio inválido', PChar(Msg_Title), mb_IconStop);
    BLOQUEADO.Color := clYellow;
    BLOQUEADO.SetFocus;
    exit;
  end;

  IQuery.SQL.Clear;
  IQuery.SQL.Add('select funcionario_id, substr(opcoes,69,1) from acesso where length(opcoes) >= 69 and substr(opcoes,69,1) = ''S''');
  IQuery.Prepare;
  IQuery.Open;

  if not IQuery.IsEmpty then
  begin
    if (Limite.Value <> QTabela.FieldByName('LIMITE').AsFloat) and (Copy(FrmData.QAcesso.FieldByName('OPCOES').AsString,69,1) = 'N') then
    begin
      Application.MessageBox('Usuário sem permissão para alterar limite do cliente', PChar(Msg_Title), mb_IconStop);
      LIMITE.Value := QTabela.FieldByName('LIMITE').AsFloat;
      exit;
    end;
  end;


  Result := True;
end;

procedure TFrmClientes.ManutencaoShow(Sender: TObject);
begin
  Set_Campos(False);
  Botoes_Normal;
  ConsultaCheque;
  licenca_liberada;
end;

procedure TFrmClientes.NOMEKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = IBGE) then
    btnIBGEClick(Self);

  if (Key = Vk_F7) and (Sender = COD_PAIS) then
    btnPaisClick(Self);

  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmClientes.PageControl2DrawTab(Control: TCustomTabControl;
  TabIndex: Integer; const Rect: TRect; Active: Boolean);
begin

 QInadimplencia.close;
 QInadimplencia.ParamByName('CLIENTE_ID').AsInteger := QTabela.FieldByname('CLIENTE_ID').AsInteger;
 QInadimplencia.prepare;
 QInadimplencia.Open;


 If (QTabela.FieldByName('ANOTACOES').ASSTRING <> '') or (Not QInadimplencia.IsEmpty) Then
 BEgin

  case TabIndex of
   0 : Control.Canvas.brush.Color:=clScrollBar;
   1 : Control.Canvas.brush.Color:=clScrollBar;
   2 : Control.Canvas.brush.Color:=clScrollBar;
   3 : Control.Canvas.brush.Color:=clScrollBar;
   4 : Control.Canvas.brush.Color:=clScrollBar;
   5 :
   Begin
    if (QTabela.FieldByName('ANOTACOES').ASSTRING <> '')  then
    Control.Canvas.brush.Color:=clred
    Else
    Control.Canvas.brush.Color:=clScrollBar;
   End;
   6 : Control.Canvas.brush.Color:=clScrollBar;
   7 :
    Begin
    if (Not QInadimplencia.IsEmpty) then
    Control.Canvas.brush.Color:=clYellow
    Else
    Control.Canvas.brush.Color:=clScrollBar;
   End;
   8 :Control.Canvas.brush.Color:=clScrollBar;
   9 :Control.Canvas.brush.Color:=clScrollBar;

  end;

  Control.Canvas.FillRect( Rect );

  PageControl2.canvas.font.color:=clblack;     //cor da aba do tabsheet

  Control.Canvas.TextOut(Rect.left+2,Rect.top+2,TTabSheet(PageControl2.Pages[tabindex]).Caption);

 End;
end;

procedure TFrmClientes.ibqryQAutorizadosBeforeEdit(DataSet: TDataSet);
begin
  if FrmData.QAcesso.FieldByName('ALTERACAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para alteração', PChar(Msg_Title), mb_IconStop);
    exit;
  end;
end;

procedure TFrmClientes.ibqryQAutorizadosBeforePost(DataSet: TDataSet);
begin
  if QAutorizados.FieldByName('NOME').AsString = '' then
  begin
    Application.MessageBox('Nome inválido', PChar(Msg_Title), mb_IconStop);

    Grid_Autorizados.SelectedIndex := 0;

    abort;
  end;
end;

procedure TFrmClientes.ibqryQAutorizadosNewRecord(DataSet: TDataSet);
begin
  DataSet['CLIENTE_ID']    := QTabela.FieldByName('CLIENTE_ID').AsInteger;
  DataSet['AUTORIZADO_ID'] := 0;
end;

procedure TFrmClientes.ibqryQSeriaisBeforeEdit(DataSet: TDataSet);
begin
  if FrmData.QAcesso.FieldByName('ALTERACAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para alteração', PChar(Msg_Title), mb_IconStop);
    exit;
  end;
end;

procedure TFrmClientes.ibqryQSeriaisBeforePost(DataSet: TDataSet);
begin
 Md5 :=  TIdHashMessageDigest5.Create;

  if QSeriais.FieldByName('SERIAL').AsString = '' then
  begin
    Application.MessageBox('Serial inválido', PChar(Msg_Title), mb_IconStop);

    Grid_Seriais.SelectedIndex := 0;

    abort;
  end;
  QSeriais.FieldByName('SERIAL').AsString      := UpperCase(Qseriais.FieldByName('SERIAL').AsString);
  QSeriais.FieldByName('LICENCA').AsString     := LogEntry('', '', LowerCase(MD5.HashStringAsHex('AMO A DEUS E MINHA FAMILIA3' + Copy(DateToStr(date),1,2) + Copy(DateToStr(date),10, 1)+ CNPJ.Text + QSeriais.FieldByName('SERIAL').AsString)));
  QSeriais.FieldByName('P_TRIMESTRE').AsString := LogEntry('', '', LowerCase(MD5.HashStringAsHex('AMO A DEUS E MINHA FAMILIA331/03/' + Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 7, 4) + QSeriais.FieldByName('SERIAL').AsString)));
  QSeriais.FieldByName('S_TRIMESTRE').AsString := LogEntry('', '', LowerCase(MD5.HashStringAsHex('AMO A DEUS E MINHA FAMILIA330/06/' + Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 7, 4) + QSeriais.FieldByName('SERIAL').AsString)));
  QSeriais.FieldByName('T_TRIMESTRE').AsString := LogEntry('', '', LowerCase(MD5.HashStringAsHex('AMO A DEUS E MINHA FAMILIA330/09/' + Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 7, 4) + QSeriais.FieldByName('SERIAL').AsString)));
  QSeriais.FieldByName('Q_TRIMESTRE').AsString := LogEntry('', '', LowerCase(MD5.HashStringAsHex('AMO A DEUS E MINHA FAMILIA331/12/' + Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 7, 4) + QSeriais.FieldByName('SERIAL').AsString)));
  Label13.Caption := UpperCase(Qseriais.FieldByName('SERIAL').AsString);
end;

procedure TFrmClientes.ibqryQSeriaisNewRecord(DataSet: TDataSet);
begin
  DataSet['CLIENTE_ID'] := QTabela.FieldByName('CLIENTE_ID').AsInteger;
end;

procedure TFrmClientes.pgqryQAutorizadosBeforeEdit(DataSet: TDataSet);
begin
  if FrmData.QAcesso.FieldByName('ALTERACAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para alteração', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

end;

procedure TFrmClientes.pgqryQAutorizadosBeforePost(DataSet: TDataSet);
begin
  if QAutorizados.FieldByName('NOME').AsString = '' then
  begin
    Application.MessageBox('Nome inválido', PChar(Msg_Title), mb_IconStop);

    Grid_Autorizados.SelectedIndex := 0;

    abort;
  end;

end;

procedure TFrmClientes.pgqryQAutorizadosNewRecord(DataSet: TDataSet);
begin
  DataSet['CLIENTE_ID']    := QTabela.FieldByName('CLIENTE_ID').AsInteger;
  DataSet['AUTORIZADO_ID'] := 0;
end;

procedure TFrmClientes.QautorizadosAfterOpen(DataSet: TDataSet);
begin
TFloatField(QAutorizados.FieldByName('DT_NASCIMENTO')).EditMask    :='!99/99/0000;1;_';
end;

procedure TFrmClientes.QautorizadosAfterPost(DataSet: TDataSet);
begin
 if FrmData.QAcesso.FieldByName('ALTERACAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para alteração', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

end;

procedure TFrmClientes.QautorizadosBeforeEdit(DataSet: TDataSet);
begin
  if FrmData.QAcesso.FieldByName('ALTERACAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para alteração', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

end;

procedure TFrmClientes.QautorizadosBeforePost(DataSet: TDataSet);
begin
  if QAutorizados.FieldByName('NOME').AsString = '' then
  begin
    Application.MessageBox('Nome inválido', PChar(Msg_Title), mb_IconStop);

    Grid_Autorizados.SelectedIndex := 0;

    abort;
  end;

end;

procedure TFrmClientes.QautorizadosNewRecord(DataSet: TDataSet);
begin
  DataSet['CLIENTE_ID']    := QTabela.FieldByName('CLIENTE_ID').AsInteger;
  DataSet['AUTORIZADO_ID'] := 0;
end;

procedure TFrmClientes.QDadosPetAfterOpen(DataSet: TDataSet);
begin
TFloatField(QDadosPet.FieldByName('DT_NASCIMENTO')).EditMask    :='!99/99/0000;1;_';
end;

procedure TFrmClientes.QDadosPetAfterPost(DataSet: TDataSet);
begin
  if FrmData.QAcesso.FieldByName('ALTERACAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para alteração', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

end;

procedure TFrmClientes.QDadosPetBeforeEdit(DataSet: TDataSet);
begin
  if FrmData.QAcesso.FieldByName('ALTERACAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para alteração', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

end;

procedure TFrmClientes.QDadosPetBeforePost(DataSet: TDataSet);
begin
 if QDadosPet.FieldByName('NOME').AsString = '' then
  begin
    Application.MessageBox('Nome inválido', PChar(Msg_Title), mb_IconStop);

    Grid_DadosPet.SelectedIndex := 0;

    abort;
  end;

end;

procedure TFrmClientes.QDadosPetNewRecord(DataSet: TDataSet);
begin
  DataSet['CLIENTE_ID']    := QTabela.FieldByName('CLIENTE_ID').AsInteger;
end;

procedure TFrmClientes.QProdutos_ContratoAfterOpen(DataSet: TDataSet);
begin
 TFloatField(QProdutos_Contrato.FieldByName('DT_CADASTRO')).EditMask             :='!99/99/0000;1;_';
 TFloatField(QProdutos_Contrato.FieldByName('PRECO_VENDA')).DisplayFormat        := '#,##0.00';
end;

procedure TFrmClientes.QProdutos_ContratoBeforeDelete(DataSet: TDataSet);
begin
  if FrmData.QAcesso.FieldByName('EXCLUSAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para exclusão', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  if Application.MessageBox('Deseja realmente excluir?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = IDNO then
    abort;

end;

procedure TFrmClientes.QProdutos_ContratoBeforeEdit(DataSet: TDataSet);
begin
if FrmData.QAcesso.FieldByName('ALT_PRODUTOS').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para alteração', PChar(Msg_Title), mb_IconStop);
    exit;
  end;


end;

procedure TFrmClientes.QProdutos_ContratoBeforePost(DataSet: TDataSet);
begin
{
if QProdutos_Contrato.FieldByName('DESCRICAO').AsString = '' then
  begin
    Application.MessageBox('Produto inválido', PChar(Msg_Title), mb_IconStop);

    Grid_Produtos_Contrato.SelectedIndex := 1;

    abort;
  end;
  }
end;

procedure TFrmClientes.QProdutos_ContratoNewRecord(DataSet: TDataSet);
begin
DataSet['CLIENTE_ID']  := QTabela.FieldByName('CLIENTE_ID').AsInteger;
DataSet['DT_CADASTRO'] := DATE;

end;

procedure TFrmClientes.QRBand8BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
FrmPrincipal.config.Refresh;
QRMemo1.Lines.Text := FrmPrincipal.Config.FieldByName('AUTORIZACAO').AsString;
end;

procedure TFrmClientes.QSeriaisBeforeEdit(DataSet: TDataSet);
begin
  if FrmData.QAcesso.FieldByName('ALTERACAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para alteração', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

end;

procedure TFrmClientes.QSeriaisBeforePost(DataSet: TDataSet);
begin
 Md5 :=  TIdHashMessageDigest5.Create;

  if QSeriais.FieldByName('SERIAL').AsString = '' then
  begin
    Application.MessageBox('Serial inválido', PChar(Msg_Title), mb_IconStop);

    Grid_Seriais.SelectedIndex := 0;

    abort;
  end;
  QSeriais.FieldByName('SERIAL').AsString      := UpperCase(Qseriais.FieldByName('SERIAL').AsString);
  QSeriais.FieldByName('LICENCA').AsString     := LogEntry('', '', LowerCase(MD5.HashStringAsHex('AMO A DEUS E MINHA FAMILIA3' + Copy(DateToStr(date),1,2) + Copy(DateToStr(date),10, 1)+ CNPJ.Text + QSeriais.FieldByName('SERIAL').AsString)));
  QSeriais.FieldByName('P_TRIMESTRE').AsString := LogEntry('', '', LowerCase(MD5.HashStringAsHex('AMO A DEUS E MINHA FAMILIA331/03/' + Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 7, 4) + QSeriais.FieldByName('SERIAL').AsString)));
  QSeriais.FieldByName('S_TRIMESTRE').AsString := LogEntry('', '', LowerCase(MD5.HashStringAsHex('AMO A DEUS E MINHA FAMILIA330/06/' + Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 7, 4) + QSeriais.FieldByName('SERIAL').AsString)));
  QSeriais.FieldByName('T_TRIMESTRE').AsString := LogEntry('', '', LowerCase(MD5.HashStringAsHex('AMO A DEUS E MINHA FAMILIA330/09/' + Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 7, 4) + QSeriais.FieldByName('SERIAL').AsString)));
  QSeriais.FieldByName('Q_TRIMESTRE').AsString := LogEntry('', '', LowerCase(MD5.HashStringAsHex('AMO A DEUS E MINHA FAMILIA331/12/' + Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 7, 4) + QSeriais.FieldByName('SERIAL').AsString)));
  Label13.Caption := UpperCase(Qseriais.FieldByName('SERIAL').AsString);

end;

procedure TFrmClientes.QSeriaisNewRecord(DataSet: TDataSet);
begin
  DataSet['CLIENTE_ID'] := QTabela.FieldByName('CLIENTE_ID').AsInteger;
end;

procedure TFrmClientes.QTD_LICENCAExit(Sender: TObject);
begin
Md5 :=  TIdHashMessageDigest5.Create;
if (N_empresas.Value = 0) AND (TabSheet8.Visible = True) then
Begin
Application.MessageBox('Quantidade de empresas liberadas não pode ser = 0', PChar(Msg_Title), mb_IconStop);
N_empresas.SetFocus;
End
Else
Licenca.Text := LogEntry('', '', LowerCase(MD5.HashStringAsHex('AMO A DEUS E MINHA FAMILIA' + StrZero(N_Empresas.Text,2,0) + StrZero(QTD_LICENCA.Text,3,0) + CNPJ.Text)));
end;

procedure TFrmClientes.SerialExit(Sender: TObject);
begin
Serial.Text := UpperCase(Serial.Text);
end;

procedure TFrmClientes.Set_Campos(Vazio: Boolean);
var
I: Integer;
Temp: TComponent;
Foto1: TStream;
Imagem: TJpegImage;
begin
  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];
    if Vazio then
    begin
      if Temp is TEdit then
        TEdit(Temp).Text := '';

      if Temp is TMaskEdit then
        TMaskEdit(Temp).Text := '';

      if Temp is TComboBox then
        TComboBox(Temp).Text := '';

      if Temp is TDateEdit then
        TDateEdit(Temp).Text := '';

      if Temp is TRxCalcEdit then
        TRxCalcEdit(Temp).Value := 0;

      if Temp is TCurrencyEdit then
        TCurrencyEdit(Temp).Value := 0;

        //if Temp is TImage then
        //Imagem.Free;


      if Tem_Anotacao then
      begin
        if Temp is TMemo then
          TMemo(Temp).Lines.Clear;
      end;

      try
        QAutorizados.Close;

        QAutorizados.ParamByName('CLIENTE_ID').AsInteger := 0;

        QAutorizados.Prepare;
        QAutorizados.Open;
      except
        TabSheet7.Visible := False;
      end;

      if FrmPrincipal.Config.FieldByName('OBJETO_ORDEM').AsString = 'Pet Shop' Then
      Begin
        try
          QDadosPet.Close;

          QDadosPet.ParamByName('CLIENTE_ID').AsInteger := 0;

          QDadosPet.Prepare;
          QDadosPet.Open;
        except
          TabSheet9.Visible := False;
        end;
      End;


      try
        QSeriais.Close;

        QSeriais.ParamByName('CLIENTE_ID').AsInteger := 0;

        QSeriais.Prepare;
        QSeriais.Open;
      except
        TabSheet8.Visible := False;
      end;

    end
    else
    begin
      if Temp is TEdit then
        TEdit(Temp).Text := QTabela.FieldByName(TEdit(Temp).Name).AsString;

      if Temp is TMaskEdit then
        TMaskEdit(Temp).Text := QTabela.FieldByName(TMaskEdit(Temp).Name).AsString;

      if Temp is TComboBox then
        TComboBox(Temp).Text := QTabela.FieldByName(TComboBox(Temp).Name).AsString;

      if Temp is TDateEdit then
        TDateEdit(Temp).Date := QTabela.FieldByName(TDateEdit(Temp).Name).AsDateTime;

      if Temp is TRxCalcEdit then
        TRxCalcEdit(Temp).Value := QTabela.FieldByName(TRxCalcEdit(Temp).Name).AsFloat;

      if Temp is TCurrencyEdit then
        TCurrencyEdit(Temp).Value := QTabela.FieldByName(TCurrencyEdit(Temp).Name).AsFloat;

      if (Temp is TImage) AND (FrmPrincipal.Config.FieldByName('EXIBE_FOTO').AsString = 'True') then
      begin

       Foto1 := QTabela.CreateBlobStream(QTabela.FieldByName('FOTO'), BMREAD);
       Foto1.Position := 0;
       Imagem := TJpegImage.Create;
       Imagem.loadFromStream(Foto1);

       if Length(QTabela.FieldByName('FOTO').AsWideString) <> 0 then
       Begin
       Foto.Visible := true;
       Foto.Picture.Bitmap.Assign(Imagem);
       End
       else
       Begin
       Foto.Picture.Bitmap := NIL;
       End;
      end;

      if Tem_Anotacao then
      begin
        if Temp is TMemo then
          TMemo(Temp).Text := QTabela.FieldByName(TMemo(Temp).Name).AsString;
      end;

      if QTabela.FieldByName('TIPO_CLIENTE').AsString = 'PESSOA JURÍDICA' then
        CNPJ.EditMask := '99.999.999/9999-99;1;_'
      else
        CNPJ.EditMask := '999.999.999-99;1;_';

      if TComboBox(Temp).Name = 'Atividade' then
      Atividade.ItemIndex := Atividade.Items.IndexOf(QTabela.FieldByName(TComboBox(Temp).Name).AsString);

    end;
  end;


  try
    QAutorizados.Close;

    QAutorizados.ParamByName('CLIENTE_ID').AsInteger := QTabela.FieldByName('CLIENTE_ID').AsInteger;

    QAutorizados.Prepare;
    QAutorizados.Open;
  except
    TabSheet7.Visible := False;
  end;

  try
    QSeriais.Close;

    QSeriais.ParamByName('CLIENTE_ID').AsInteger := QTabela.FieldByName('CLIENTE_ID').AsInteger;

    QSeriais.Prepare;
    QSeriais.Open;
  except
    TabSheet8.Visible := False;
  end;

  try
    QSeriais.Close;

    QSeriais.ParamByName('CLIENTE_ID').AsInteger := QTabela.FieldByName('CLIENTE_ID').AsInteger;

    QSeriais.Prepare;
    QSeriais.Open;
  except
    TabSheet8.Visible := False;
  end;


  try
    QProdutos_Contrato.Close;

    QProdutos_Contrato.ParamByName('CLIENTE_ID').AsInteger := QTabela.FieldByName('CLIENTE_ID').AsInteger;

    QProdutos_Contrato.Prepare;
    QProdutos_Contrato.Open;
  except
    TabSheet11.Visible := False;
  end;


  if FrmPrincipal.Config.FieldByName('OBJETO_ORDEM').AsString = 'Pet Shop' Then
  Begin
    try
      QDadosPet.Close;

      QDadosPet.ParamByName('CLIENTE_ID').AsInteger := QTabela.FieldByName('CLIENTE_ID').AsInteger;

      QDadosPet.Prepare;
      QDadosPet.Open;
    except
      TabSheet9.Visible := False;
    end;
  End;



  if QTabela.FieldByName('PRODUTOR_R').AsInteger = 1 then
  chk_produtor.Checked := True
  Else
  chk_produtor.Checked := False;


  if QTabela.FieldByName('LICENCA_T').AsString <> '' then
  Label71.Caption := 'Limite: ' +  DecryptMsg(UpperCase(Copy(QTabela.FieldByName('LICENCA_T').AsString,33,10)),39)
  Else
  Label71.Caption := 'Limite:';

  if QTabela.IsEmpty then
    Grid_Autorizados.Enabled := False
  else
    Grid_Autorizados.Enabled := True;

  if QTabela.IsEmpty then
  Begin
    Grid_Seriais.Enabled := False;
    Grid_Produtos_Contrato.Enabled := False;
  End
  else
  Begin
    Grid_Seriais.Enabled := True;
    Grid_Produtos_Contrato.Enabled := True;
  End;

  VerificarInadimplencia;

  If (QTabela.FieldByName('ANOTACOES').ASSTRING <> '') or (not QInadimplencia.IsEmpty) Then
    PageControl2.OwnerDraw := True
  Else
    PageControl2.OwnerDraw := False;

 // Dados_Empresa.Clear;
 // Dados_Empresa.Visible := False;

  if TIPO_CLIENTE.Text = 'PESSOA JURÍDICA' then
    btnCNPJ.Visible := True
  else
    btnCNPJ.Visible := False;

end;

procedure TFrmClientes.TabSheet10Show(Sender: TObject);
begin
 Timer1.Enabled := True;
 //Captcha.SetFocus;
end;

procedure TFrmClientes.TabSheet11Show(Sender: TObject);
begin

  QProdutos_Contrato.Close;

  QProdutos_Contrato.ParamByName('CLIENTE_ID').AsInteger := QTabela.FieldByName('CLIENTE_ID').AsInteger;

  QProdutos_Contrato.Prepare;
  QProdutos_Contrato.Open;


end;

procedure TFrmClientes.TabSheet5Show(Sender: TObject);
begin
  VerificarInadimplencia;

End;

procedure TFrmClientes.Timer1Timer(Sender: TObject);
begin
 //Timer1.Enabled := False;
 //LabAtualizarCaptchaClick(LabAtualizarCaptcha);
 //Captcha.SetFocus;
end;

procedure TFrmClientes.TIPO_CLIENTEChange(Sender: TObject);
begin
  if TIPO_CLIENTE.Text = 'PESSOA JURÍDICA' then
  begin
    CNPJ.EditMask := '99.999.999/9999-99;1;_';
    TabSheet3.TabVisible := False;
    btnCNPJ.Visible := True;
  end
  else
  begin
    CNPJ.EditMask := '999.999.999-99;1;_';
    TabSheet3.TabVisible := True;
    btnCNPJ.Visible := False;
  end;
end;

procedure TFrmClientes.TIPO_CLIENTEKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmClientes.btnComeca_ComClick(Sender: TObject);
begin
  if Comeca_Com.Text <> '' then
  UpperCase(Comeca_Com.Text);
  begin
    if FrmData.QAcesso.FieldByName('DESATIVADOS').AsString  = 'True' Then
      CmdSelectNull := 'WHERE (NOME ilike ' + #39 + Comeca_Com.Text + '%'  + #39 + ')'
    else
      CmdSelectNull := 'WHERE (NOME ilike ' + #39 + Comeca_Com.Text + '%'  + #39 + ') AND (STATUS = ' + #39 + 'A' + #39 + ')';

    CmdOrderBy := 'ORDER BY NOME';

    QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

    QTabela.Prepare;
    QTabela.Open;
  end;
end;

procedure TFrmClientes.btnConsultarClick(Sender: TObject);
begin
  {
  if Captcha.Text <> '' then
  begin

   if TIPO_CLIENTE.Text = 'PESSOA FÍSICA' then
   Begin
    if ACBrConsultaCPF1.Consulta(CNPJ.Text, NASCIMENTO.Text, Captcha.Text) then
    begin

      Application.MessageBox(PChar('Nome:' + ACBrConsultaCPF1.Nome + #13 + 'Situação: ' + ACBrConsultaCPF1.Situacao
                                   + 'Emissão: ' + ACBrConsultaCPF1.Emissao + 'Inscrição: ' + ACBrConsultaCPF1.DataInscricao), PChar(Msg_Title), MB_ICONINFORMATION);



    end;
   end
   else
   begin
    if ACBrConsultaCNPJ1.Consulta( CNPJ.Text, Captcha.Text, True ) then
    begin

      with ACBrConsultaCNPJ1 Do
      Begin

       Dados_Empresa.Visible := True;
       Dados_Empresa.Clear;
       Dados_Empresa.Lines.Add('');
       Dados_Empresa.Lines.Add('Dados:');
       Dados_Empresa.Lines.Add('');
       Dados_Empresa.Lines.Add('Razão:' + RazaoSocial);
       Dados_Empresa.Lines.Add('Fantasia: ' + FANTASIA);
       Dados_Empresa.Lines.Add('Telefone: ' + telefone);
       Dados_Empresa.Lines.Add('Situação: ' + Situacao);
       Dados_Empresa.Lines.Add('Endereço: ' + Endereco + ',' + Numero );
       Dados_Empresa.Lines.Add('Bairro: ' + Bairro);
       Dados_Empresa.Lines.Add('Cidade: ' + Cidade);
       Dados_Empresa.Lines.Add('Cidade IBGE: ' + IBGE_Municipio);
       Dados_Empresa.Lines.Add('UF: ' + uf);
       Dados_Empresa.Lines.Add('Cep: ' + cep);
       Dados_Empresa.Lines.Add('E-mail: ' + endeletronico);
       Dados_Empresa.Lines.Add('Cnae: ' + cnae1);

      end;

        if Application.MessageBox('Deseja atualizar os dados do cliente?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = IDYES then
        begin

            NOME.Text      := Copy(ACBrConsultaCNPJ1.RazaoSocial,90);
            FANTASIA.text  := Copy(ACBrConsultaCNPJ1.Fantasia,1,30);//Copy(Dados_Empresa.Lines.Strings[4].ToLower,11,length(FANTASIA)
            ENDERECO.Text  := Copy(ACBrConsultaCNPJ1.ENDERECO,1,60);
            Numero.Text    := ACBrConsultaCNPJ1.NUMERO;
            COMPLEMENTO.Text := ACBrConsultaCNPJ1.COMPLEMENTO;
            BAIRRO.Text    := ACBrConsultaCNPJ1.BAIRRO;
            MUNICIPIO.Text := ACBrConsultaCNPJ1.Cidade;

            if ACBrConsultaCNPJ1.IBGE_Municipio <> '' Then
            IBGE.Text      := ACBrConsultaCNPJ1.IBGE_Municipio;

            if  ACBrConsultaCNPJ1.EndEletronico <> '' Then
            email.Text     := ACBrConsultaCNPJ1.EndEletronico;

        end;

    end;
   end;
  end
  else
  begin

    Application.MessageBox('É necessário digitar o captcha.', PChar(Msg_Title), mb_IconStop);
    //Captcha.SetFocus;

  end;

  }
end;



procedure TFrmClientes.btnDeleteClick(Sender: TObject);
VAR
I: Integer;
Temp: TComponent;
  begin
    if FrmData.QAcesso.FieldByName('EXCLUSAO').AsString = 'NÃO' then
    begin
      Application.MessageBox('Usuário sem permissão para exclusão', PChar(Msg_Title), mb_IconStop);
      exit;
    end;

    IQuery.Sql.Clear;
    IQuery.Sql.Add('SELECT * FROM RAZAO');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(CONTA_DB = :CONTA) OR (CONTA_CR = :CONTA)');
    IQuery.ParamByName('CONTA').AsString   := COD_CONTABIL.Text;


    IQuery.Prepare;
    IQuery.Open;

    if (not IQuery.IsEmpty) AND ((IQuery.FieldByName('CONTA_CR').AsString <> '') OR (IQuery.FieldByName('CONTA_DB').AsString <> '')) then
    begin
      Application.MessageBox('Cliente com lançamento(s)', PChar(Msg_Title), mb_IconStop);
      exit;
    end;

    IQuery.Sql.Clear;
    IQuery.Sql.Add('SELECT * FROM CHEQUES_RECEBIDOS');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(CLIENTE_ID = :CLIENTE_ID)');

    IQuery.ParamByName('CLIENTE_ID').AsInteger := QTabela.FieldbyName('CLIENTE_ID').AsInteger;

    IQuery.Prepare;
    IQuery.Open;

    if not IQuery.IsEmpty then
    begin
      Application.MessageBox('Cliente com lançamento(s)', PChar(Msg_Title), mb_IconStop);
      exit;
    end;

    IQuery.Sql.Clear;
    IQuery.Sql.Add('SELECT * FROM ORCAMENTOS');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(CLIENTE_ID = :CLIENTE_ID)');

    IQuery.ParamByName('CLIENTE_ID').AsInteger := QTabela.FieldbyName('CLIENTE_ID').AsInteger;

    IQuery.Prepare;
    IQuery.Open;

    if not IQuery.IsEmpty then
    begin
      Application.MessageBox('Cliente com lançamento(s)', PChar(Msg_Title), mb_IconStop);
      exit;
    end;

    IQuery.Sql.Clear;
    IQuery.Sql.Add('SELECT * FROM ORDEM_SERVICO');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(CLIENTE_ID = :CLIENTE_ID)');

    IQuery.ParamByName('CLIENTE_ID').AsInteger := QTabela.FieldbyName('CLIENTE_ID').AsInteger;

    IQuery.Prepare;
    IQuery.Open;

    if not IQuery.IsEmpty then
    begin
      Application.MessageBox('Cliente com lançamento(s)', PChar(Msg_Title), mb_IconStop);
      exit;
    end;

    IQuery.Sql.Clear;
    IQuery.Sql.Add('SELECT * FROM TRANSACOES');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(CLIENTE_ID = :CLIENTE_ID)');

    IQuery.ParamByName('CLIENTE_ID').AsInteger := QTabela.FieldbyName('CLIENTE_ID').AsInteger;

    IQuery.Prepare;
    IQuery.Open;

    if not IQuery.IsEmpty then
    begin
      Application.MessageBox('Cliente com lançamento(s)', PChar(Msg_Title), mb_IconStop);
      exit;
    end;

    if Application.MessageBox('Deseja realmente excluir?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = IDYES then
    begin


     If  (FrmPrincipal.Config.FieldByName('AUDITORIA').AsString = 'True') Then
     Begin

       for I := 0 to (ComponentCount - 1) do
      begin
        Temp := Components[I];
        if Temp is TEdit Then  //or (Temp is TComboBox) or (Temp is TCurrencyEdit) or (Temp is TRxCalcEdit) or (Temp is TDateEdit) then
        Begin
         //if (QTabela.FieldbyName(TEdit(Temp).Name).AsString <> TEdit(Temp).Text)  Then
         GravarLog('CLIENTE','DELETAR',DateToStr(date),TimeToStr(time),TEdit(Temp).Name,TEdit(Temp).Text,QTabela.FieldbyName(TEdit(Temp).Name).AsString,FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger,QTabela.FieldByName('CLIENTE_ID').AsInteger);
        End;
        if Temp is TComboBox   Then
        Begin
         //if (QTabela.FieldbyName(TComboBox(Temp).Name).AsString <> TComboBox(Temp).Text)  Then
         GravarLog('CLIENTE','DELETAR',DateToStr(date),TimeToStr(time),TComboBox(Temp).Name,TComboBox(Temp).Text,QTabela.FieldbyName(TComboBox(Temp).Name).AsString,FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger,QTabela.FieldByName('CLIENTE_ID').AsInteger);
        End;
        if Temp is TCurrencyEdit   Then
        Begin
         //if  FloatToStr(QTabela.FieldbyName(TCurrencyEdit(Temp).Name).AsFloat) <> (TCurrencyEdit(Temp).Text) Then
         GravarLog('CLIENTE','DELETAR',DateToStr(date),TimeToStr(time),TCurrencyEdit(Temp).Name,FloatToStr(TCurrencyEdit(Temp).Value),FloatToStr(QTabela.FieldbyName(TCurrencyEdit(Temp).Name).AsFloat),FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger,QTabela.FieldByName('CLIENTE_ID').AsInteger);
        End;
        if Temp is TRxCalcEdit   Then
        Begin
         //if  FloatToStr(QTabela.FieldbyName(TRxCalcEdit(Temp).Name).AsFloat) <> (TRxCalcEdit(Temp).Text)  Then
         GravarLog('CLIENTE','DELETAR',DateToStr(date),TimeToStr(time),TRxCalcEdit(Temp).Name,TRxCalcEdit(Temp).Text,QTabela.FieldbyName(TRxCalcEdit(Temp).Name).AsString,FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger,QTabela.FieldByName('CLIENTE_ID').AsInteger);
        End;
        if Temp is TDateEdit   Then
        Begin
         //if (QTabela.FieldbyName(TDateEdit(Temp).Name).AsDateTime <> TDateEdit(Temp).Date) Then
         GravarLog('CLIENTE','DELETAR',DateToStr(date),TimeToStr(time),TDateEdit(Temp).Name,DateToStr(TDateEdit(Temp).Date),DateToStr(QTabela.FieldbyName(TDateEdit(Temp).Name).AsDateTime),FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger,QTabela.FieldByName('CLIENTE_ID').AsInteger);
        End;
      end;
     End;


      funcionario_id.value := FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger;

      IQuery.Sql.Clear;
      IQuery.Sql.Add('DELETE FROM CLIENTES');
      IQuery.Sql.Add('WHERE');
      IQuery.Sql.Add('(CLIENTE_ID = :ID)');

      IQuery.ParamByName('ID').AsInteger := QTabela.FieldByName('CLIENTE_ID').AsInteger;

      IQuery.Prepare;
      IQuery.ExecSql;


      if (FrmPrincipal.Config.FieldByName('AUDITORIA').AsString = 'True') Then
      GravarLogSistema('Clientes',DatetimeToStr(now), QTabela,'Delete',StrToint(funcionario_id.Text));

      QTabela.Close;

      Qtabela.Prepare;
      QTabela.Open;

      Set_Campos(False);
      Botoes_Normal;
    end;
  end;

procedure TFrmClientes.btnDiscardClick(Sender: TObject);
begin
  Botoes_Normal;
  Set_Campos(False);
  Habilitar(False);
  Operacao := '';
  Consulta.TabVisible := True;
end;

procedure TFrmClientes.btnEditClick(Sender: TObject);
begin
  if FrmData.QAcesso.FieldByName('ALTERACAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para alteração', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  IQuery.Sql.Clear;
  IQuery.Sql.Add('SELECT * FROM RAZAO');
  IQuery.Sql.Add('WHERE');
  IQuery.Sql.Add('(CONTA_DB = :CONTA) OR (CONTA_CR = :CONTA)');

  IQuery.ParamByName('CONTA').AsString := COD_CONTABIL.Text;

  IQuery.Prepare;
  IQuery.Open;

  if not IQuery.IsEmpty then
    COD_CONTABIL.ReadOnly := True;
  
  Operacao := 'Alterando';
  ID := QTabela.FieldByName('CLIENTE_ID').AsInteger;
  Botoes_Editing;
  Habilitar(True);
  Consulta.TabVisible      := False;
  Grid_Autorizados.Enabled := False;
  Grid_Seriais.Enabled     := False;



  if telefone_1.Text = '' then
  Telefone_1.EditMask := '9999-9999;1;_';


  NOME.SetFocus;
end;

procedure TFrmClientes.btnGerarClick(Sender: TObject);
begin
Md5 :=  TIdHashMessageDigest5.Create;
  if ((Serial.Text = '') or (Cil_oe_pt.text = '')) and (TabSheet8.Visible = True) then
  Begin
  Application.MessageBox('Favor informar Serial/Dias para  gerar a chave temporária!', PChar(Msg_Title), mb_IconStop);
  Serial.SetFocus;
  End
  Else
   Licenca_t.Text := LogEntry('', '', LowerCase(MD5.HashStringAsHex('AMO A DEUS E MINHA FAMILIA3' + Copy(DateToStr(date), 1, 2) + Copy(DateToStr(date), 10, 1)+ Serial.Text))) + EncryptMsg(DateToStr(Date + StrToInt(Cil_oe_pt.text)),39) ;
end;

procedure TFrmClientes.BtnhistoricoClick(Sender: TObject);
begin
Historico(QTabela.FieldByName('CLIENTE_ID').AsInteger);
end;

procedure TFrmClientes.btnIBGEClick(Sender: TObject);
begin
  try
    IBGE.Text := IntToStr(GetConsulta('IBGE', 0, 0, StrToInt(IBGE.Text)));
  except
    IBGE.Text := IntToStr(GetConsulta('IBGE', 0, 0, 0));
  end;
end;

procedure TFrmClientes.btnImprimeClick(Sender: TObject);                       
begin
  Sel_Cli(QTabela.Sql.Text);
end;

procedure TFrmClientes.btnInsertClick(Sender: TObject);
begin
  if FrmData.QAcesso.FieldByName('INCLUSAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para inclusão', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  Operacao := 'Inserindo';
  Botoes_Editing;
  Set_Campos(True);
  Habilitar(True);

  Grid_Autorizados.Enabled := False;
  Grid_Seriais.Enabled     := False;


  ESTADO.Text       := '  ';
  TIPO_CLIENTE.Text := 'PESSOA FÍSICA';
  CNPJ.EditMask     := '999.999.999-99;1;_';
  DT_FICHA.Date     := Date;
  chk_produtor.Checked := False;
  BLOQUEADO.Text  := 'NÃO';
  spc_serasa.Text := 'NÃO';
  Atividade.ItemIndex := -1;
  Atividade.Refresh;


  Consulta.TabVisible := False;

  Telefone_1.EditMask := '9999-9999;1;_';

  Foto.Picture.Bitmap := NIL;
  NOME.SetFocus;
end;

procedure TFrmClientes.btnNextClick(Sender: TObject);
begin
  if not QTabela.Eof then
  begin

    QTabela.Next;
    Set_Campos(False);
    ConsultaCheque; 
  end;

  Botoes_Normal;
end;

procedure TFrmClientes.btnPaisClick(Sender: TObject);
begin
  try
    COD_PAIS.Text := StrZero(IntToStr(GetConsulta('PAISES', 0, 0, StrToInt(COD_PAIS.Text))), 5, 0);
  except
    COD_PAIS.Text := StrZero(IntToStr(GetConsulta('PAISES', 0, 0, 0)), 5, 0);
  end;
end;

procedure TFrmClientes.btnPesquisaClick(Sender: TObject);
var
Condicao: String;
begin
  Condicao := GetPesquisa('CLIENTES');

  if Condicao <> '' then
  begin
    if FrmData.QAcesso.FieldByName('DESATIVADOS').AsString  = 'True' Then
      CmdSelectNull := Condicao
    else
      CmdSelectNull := Condicao + ' AND (STATUS = ' + #39 + 'A' + #39 + ')';
  end;

  CmdOrderBy := 'ORDER BY CLIENTE_ID';

  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

  QTabela.Prepare;
  QTabela.Open;

  Set_Campos(False);
  Botoes_Normal;
end;

procedure TFrmClientes.btnPriorClick(Sender: TObject);
begin
  if not QTabela.Bof then
  begin
     
    QTabela.Prior;
    Set_Campos(False);
    ConsultaCheque;

  end;

  Botoes_Normal;
end;

procedure TFrmClientes.BtnRecebimentoClick(Sender: TObject);
begin
Recebimentos(QTabela.FieldByName('CLIENTE_ID').AsInteger);
end;

procedure TFrmClientes.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmClientes.btnSaveClick(Sender: TObject);
var
Grau:String;
I: Integer;
Temp: TComponent;
begin
  DetailSearch('');

  if COD_PAIS.Text = '01058' then
    MUNICIPIO.Text := QIBGE.FieldByName('DESCRICAO').AsString;


   { IQuery.SQL.Clear;
    IQuery.SQL.Add('UPDATE CLIENTES SET FUNCIONARIO_ID = :FUNCIONARIO_ID WHERE CLIENTE_ID = :CLIENTE_ID');
    IQuery.ParamByName('FUNCIONARIO_ID').AsInteger := FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger;
    IQuery.ParamByName('CLIENTE_ID').AsInteger     := QTabela.FieldByName('CLIENTE_ID').AsInteger;

    IQuery.Prepare;
    IQuery.ExecSQL;}

  if Validacao then
  begin
    funcionario_id.value := FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger;

    if Operacao = 'Inserindo' then
    begin
      Insert;
      if (FrmPrincipal.Config.FieldByName('PLANO_PROPRIO').AsString = 'False') and (FrmPrincipal.Config.FieldByName('SPED').AsString = 'True') and (not chk_produtor.Checked) then
      begin
        QPlano.Sql.Clear;
        QPlano.Sql.Add('SELECT * FROM BANCOS');
        QPlano.Sql.Add('WHERE');
        QPlano.Sql.Add('(STATUS = :STATUS)');

        QPlano.ParamByName('STATUS').AsString := 'A';

        QPlano.Prepare;
        QPlano.Open;

        QPlano.First;
        while not QPlano.Eof do
        begin
          if QPlano.FieldByName('TIPO').AsString = 'CAIXA' then
            Grau := '1'
          else if QPlano.FieldByName('TIPO').AsString = 'BANCO' then
            Grau := '2'
          else if QPlano.FieldByName('TIPO').AsString = 'APLICAÇÃO' then
            Grau := '3';
         QPlano.Next;
        End;


        QPlano.Sql.Clear;
        QPlano.Sql.Add('SELECT * FROM CLIENTES');
        QPlano.Sql.Add('WHERE');
        QPlano.Sql.Add('(STATUS = :STATUS) AND (CNPJ = :CNPJ)');

        QPlano.ParamByName('STATUS').AsString := 'A';
        QPlano.ParamByName('CNPJ').AsString   := CNPJ.Text;

        QPlano.Prepare;
        QPlano.Open;

        If not QPlano.IsEmpty Then
        begin
           try
           GravaPlano('1.1.2.1' + Grau + '.' + StrZero(QPlano.FieldByName('CLIENTE_ID').AsString, 4, 0),
                                 Copy(QPlano.FieldByName('NOME').AsString, 1, 70), 'SIM', 'C' +
                                 StrZero(QPlano.FieldByName('CLIENTE_ID').AsString, 4, 0));


            IQuery.Sql.Clear;
            IQuery.Sql.Add('UPDATE CLIENTES SET COD_CONTABIL = :COD_CONTABIL');
            IQuery.Sql.Add('WHERE');
            IQuery.Sql.Add('(CLIENTE_ID = :CLIENTE_ID)');

            IQuery.ParamByName('COD_CONTABIL').AsString := '1.1.2.1' + Grau + '.' + StrZero(QPlano.FieldByName('CLIENTE_ID').AsString, 4, 0);
            IQuery.ParamByName('CLIENTE_ID').AsInteger  := QPlano.FieldByName('CLIENTE_ID').AsInteger;

            IQuery.Prepare;
            IQuery.ExecSql;

           // Panel3.Caption := QPlano.FieldByName('NOME').AsString;

            Application.ProcessMessages;
           Except

               on e:Exception do
            begin
              Application.MessageBox(PChar('Erro ao inserir o plano de contas.' + #13 +
                'Erro: ' + e.Message), 'Erro', MB_ICONSTOP + MB_TASKMODAL);
            end;


           end;

        end;
      end;


      CmdSelectNull := 'WHERE (CNPJ = :CNPJ)';
      CmdOrderBy    := 'ORDER BY CLIENTE_ID';

      QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

      QTabela.ParamByName('CNPJ').AsString := CNPJ.Text;

      QTabela.Prepare;
      QTabela.Open;

      If  (FrmPrincipal.Config.FieldByName('AUDITORIA').AsString = 'True') Then
      Begin

       for I := 0 to (ComponentCount - 1) do
       begin
        Temp := Components[I];

        if Temp is TEdit Then  //or (Temp is TComboBox) or (Temp is TCurrencyEdit) or (Temp is TRxCalcEdit) or (Temp is TDateEdit) then
        Begin
         GravarLog('CLIENTE','INSERIR',DateToStr(date),TimeToStr(time),TEdit(Temp).Name,TEdit(Temp).Text,'',FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger,QTabela.FieldByName('CLIENTE_ID').AsInteger);
        End;
        if Temp is TComboBox   Then
        Begin
         GravarLog('CLIENTE','INSERIR',DateToStr(date),TimeToStr(time),TComboBox(Temp).Name,TComboBox(Temp).Text,'',FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger,QTabela.FieldByName('CLIENTE_ID').AsInteger);
        End;
        if Temp is TCurrencyEdit   Then
        Begin
         GravarLog('CLIENTE','INSERIR',DateToStr(date),TimeToStr(time),TCurrencyEdit(Temp).Name,TCurrencyEdit(Temp).Text,'',FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger,QTabela.FieldByName('CLIENTE_ID').AsInteger);
        End;
        if Temp is TRxCalcEdit   Then
        Begin
         GravarLog('CLIENTE','INSERIR',DateToStr(date),TimeToStr(time),TRxCalcEdit(Temp).Name,TRxCalcEdit(Temp).Text,'',FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger,QTabela.FieldByName('CLIENTE_ID').AsInteger);
        End;
        if Temp is TDateEdit   Then
        Begin
         GravarLog('CLIENTE','INSERIR',DateToStr(date),TimeToStr(time),TDateEdit(Temp).Name,DateToStr(TDateEdit(Temp).Date),'',FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger,QTabela.FieldByName('CLIENTE_ID').AsInteger);
        End;
        if Temp is TMaskEdit   Then
        Begin
         GravarLog('CLIENTE','INSERIR',DateToStr(date),TimeToStr(time),TMaskEdit(Temp).Name,TMaskEdit(Temp).Text,'',FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger,QTabela.FieldByName('CLIENTE_ID').AsInteger);
        End;

       End;
      end;
    end
    else
    begin
      Edit;

      if (FrmPrincipal.Config.FieldByName('PLANO_PROPRIO').AsString = 'False') and (FrmPrincipal.Config.FieldByName('SPED').AsString = 'True') and (not chk_produtor.Checked) and (COD_CONTABIL.Text = '') then
      begin
        QPlano.Sql.Clear;
        QPlano.Sql.Add('SELECT * FROM BANCOS');
        QPlano.Sql.Add('WHERE');
        QPlano.Sql.Add('(STATUS = :STATUS)');

        QPlano.ParamByName('STATUS').AsString := 'A';

        QPlano.Prepare;
        QPlano.Open;

        QPlano.First;
        while not QPlano.Eof do
        begin
          if QPlano.FieldByName('TIPO').AsString = 'CAIXA' then
            Grau := '1'
          else if QPlano.FieldByName('TIPO').AsString = 'BANCO' then
            Grau := '2'
          else if QPlano.FieldByName('TIPO').AsString = 'APLICAÇÃO' then
            Grau := '3';
         QPlano.Next;
        End;


        QPlano.Sql.Clear;
        QPlano.Sql.Add('SELECT * FROM CLIENTES');
        QPlano.Sql.Add('WHERE');
        QPlano.Sql.Add('(STATUS = :STATUS) AND (CNPJ = :CNPJ)');

        QPlano.ParamByName('STATUS').AsString := 'A';
        QPlano.ParamByName('CNPJ').AsString   := CNPJ.Text;

        QPlano.Prepare;
        QPlano.Open;

        If not QPlano.IsEmpty Then
        begin
           try
           GravaPlano('1.1.2.1' + Grau + '.' + StrZero(QPlano.FieldByName('CLIENTE_ID').AsString, 4, 0),
                                 Copy(QPlano.FieldByName('NOME').AsString, 1, 70), 'SIM', 'C' +
                                 StrZero(QPlano.FieldByName('CLIENTE_ID').AsString, 4, 0));


            IQuery.Sql.Clear;
            IQuery.Sql.Add('UPDATE CLIENTES SET COD_CONTABIL = :COD_CONTABIL');
            IQuery.Sql.Add('WHERE');
            IQuery.Sql.Add('(CLIENTE_ID = :CLIENTE_ID)');

            IQuery.ParamByName('COD_CONTABIL').AsString := '1.1.2.1' + Grau + '.' + StrZero(QPlano.FieldByName('CLIENTE_ID').AsString, 4, 0);
            IQuery.ParamByName('CLIENTE_ID').AsInteger  := QPlano.FieldByName('CLIENTE_ID').AsInteger;

            IQuery.Prepare;
            IQuery.ExecSql;

           // Panel3.Caption := QPlano.FieldByName('NOME').AsString;

            Application.ProcessMessages;
           Except

               on e:Exception do
            begin
              Application.MessageBox(PChar('Erro ao inserir o plano de contas.' + #13 +
                'Erro: ' + e.Message), 'Erro', MB_ICONSTOP + MB_TASKMODAL);
            end;


           end;

        end;
      end;
    end;



    if FrmPrincipal.Config.FieldByName('PLANO_PROPRIO').AsString = 'False' then
      COD_CONTABIL.ReadOnly := True
    else
      COD_CONTABIL.ReadOnly := False;

    Set_Campos(False);
    Habilitar(False);
    Botoes_Normal;
    Operacao := '';
    Consulta.TabVisible := True;

   TRY
     if (FrmPrincipal.QEmpresa.FieldByName('CNPJ').asstring ='03.744.921/0001-57') or
      (FrmPrincipal.QEmpresa.FieldByName('CNPJ').asstring ='18.278.820/0004-58') or
      (FrmPrincipal.QEmpresa.FieldByName('CNPJ').asstring ='18.278.820/0007-09') or
      (FrmPrincipal.QEmpresa.FieldByName('CNPJ').asstring ='18.278.820/0006-10') or
      (FrmPrincipal.QEmpresa.FieldByName('CNPJ').asstring ='05.835.195/0001-03') or
      (FrmPrincipal.QEmpresa.FieldByName('CNPJ').asstring ='18.278.820/0008-81') or
      (FrmPrincipal.QEmpresa.FieldByName('CNPJ').asstring ='18.278.820/0001-05') then
     Begin
     AtualizarHelpDesk(Semmascara(cnpj.Text),Bloqueado.text,FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsString);
     End;
   Except

   END;



  end;
end;

procedure TFrmClientes.Btn_GerarOnClick(Sender: TObject);
begin
Md5 :=  TIdHashMessageDigest5.Create;
Licenca_t.text := LogEntry('', '', MD5.HashStringAsHex(CNPJ.TEXT + DateToStr(Date)  + 'LIBERADO CLENIO BARROS'));
end;

procedure TFrmClientes.btn_Incluir_InadimplenciaClick(Sender: TObject);
begin
Inadimplencia(QTabela.FieldByName('CLIENTE_ID').asInteger,FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger);
VerificarInadimplencia;
end;

procedure TFrmClientes.btn_load_imageClick(Sender: TObject);
var
CaminhoFoto: String;
begin
  if OpenImage.Execute then
  Begin

  CaminhoFoto := OpenImage.FileName;
  Imagem := TFileStream.Create(OpenImage.FileName, fmShareDenyWrite );

   if (ExtractFileExt(CaminhoFoto) = '.jpg') OR (ExtractFileExt(CaminhoFoto) = '.JPG') then
   Begin
     Foto.Picture.LoadFromFile(CaminhoFoto);
     Foto.Visible := True;
     Is_Upload := True;
   End
   Else
     Application.MessageBox('Formato de Arquivo Inválido. Utilize somente imagens JPG !', PChar(Msg_Title), mb_IconInformation);

 End;


 {try
    //IQuery.Active := False;
     IQuery.SQL.Clear;
     IQuery.SQL.Add('UPDATE CLIENTES  SET FOTO=:FOTO WHERE CLIENTE_ID= :CLIENTE_ID');
     IQuery.ParamByName('FOTO').LoadFromStream( Imagem, ftBlob );
     IQuery.ParamByName('CLIENTE_ID').AsInteger := QTabela.fieldByName('CLIENTE_ID').AsInteger;
    // IQuery.Active := True;

    Iquery.ExecSQL;




 finally
         //Imagem.Free;
 end; }








 { try
  if OpenImage.Execute then
    begin
      CaminhoFoto := OpenImage.FileName;
      Foto.Picture.LoadFromFile(CaminhoFoto);
    end;

    Imagem:= TFileStream.Create(OpenImage.FileName, FMShareDenyWrite);

  Except

end;  }

end;

procedure TFrmClientes.calcula_jurosChange(Sender: TObject);
begin
if (Calcula_Juros.Text = 'NÃO') and (dt_juros.Date = null) Then
dt_juros.Date := now;

end;

procedure TFrmClientes.CaptchaKeyPress(Sender: TObject; var Key: Char);
var
  caracter : string; // variável q vai receber a letra em maiúsculo
begin
  caracter := UpperCase(key); // passa a letra para maiúsculo
  key := caracter[1]; // passa a letra pra ser escrita no memo
end;

procedure TFrmClientes.chk_0800Click(Sender: TObject);
begin
if chk_0800.Checked then
TELEFONE_1.EditMask := ''
else
TELEFONE_1.EditMask := '9999-9999;1;_';
end;

procedure TFrmClientes.chk_produtorClick(Sender: TObject);
begin
   If chk_produtor.Checked then
   Produtor_r.Text := '1'
   else
   Produtor_r.Text := '0';
end;

procedure TFrmClientes.Repetir_EnderecoClick(Sender: TObject);
begin
if Repetir_Endereco.Checked then
Begin
  Endereco_cobranca.Text  := Endereco.Text;
  Compl_cobranca.Text     := Complemento.Text;
  Municipio_Cobranca.Text := Municipio.Text;
  Cep_cobranca.Text       := Cep.Text;
  Numero_cobranca.Text    := Numero.Text;
  Bairro_cobranca.Text    := Bairro.Text;
  Estado_cobranca.Text    := Estado.Text;   
End;

end;



procedure TFrmClientes.Comeca_ComEnter(Sender: TObject);
begin
  Comeca_Com.Text := '';
end;

procedure TFrmClientes.Comeca_ComKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    btnComeca_ComClick(Sender);
end;

procedure TFrmClientes.DBGrid1DblClick(Sender: TObject);
begin
  Manutencao.Show;
end;

procedure TFrmClientes.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
 if QTabela.FieldByName('SPC_SERASA').AsString = 'SIM'  then
    TDBGrid(Sender).Canvas.Font.Color := clRed;

 {if gdSelected in State then
  begin
      with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color := $004080FF;
      FillRect(Rect);
      Font.Style := [fsBold];
    End;
  end;
  }
 TDBGrid(Sender).DefaultDrawDataCell(Rect, TDBGrid(Sender).Columns[DataCol].Field, State);
end;

procedure TFrmClientes.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
InputString: String;
begin
  if (Key = Vk_F3) and (QTabela.FieldByName('STATUS').AsString = 'A') then
  begin
    if Application.MessageBox('Deseja realmente desativar o cliente?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = IDYES then
  begin
    ID := QTabela.FieldByName('CLIENTE_ID').AsInteger;

    

    IQuery.Sql.Clear;
    IQuery.Sql.Add('UPDATE CLIENTES SET STATUS = :STATUS');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(CLIENTE_ID = :CLIENTE_ID)');

    IQuery.ParamByName('STATUS').AsString      := 'D';
    IQuery.ParamByName('CLIENTE_ID').AsInteger := QTabela.FieldByName('CLIENTE_ID').AsInteger;

    IQuery.Prepare;
    IQuery.ExecSql;



    QTabela.Close;

    QTabela.Prepare;
    QTabela.Open;

    QTabela.Locate('CLIENTE_ID', ID, [loCaseInsensitive]);
  end;
  end;

  if (Key = Vk_F4) and (QTabela.FieldByName('STATUS').AsString = 'D') then
  begin
    ID := QTabela.FieldByName('CLIENTE_ID').AsInteger;



    IQuery.Sql.Clear;
    IQuery.Sql.Add('UPDATE CLIENTES SET STATUS = :STATUS');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(CLIENTE_ID = :CLIENTE_ID)');

    IQuery.ParamByName('STATUS').AsString      := 'A';
    IQuery.ParamByName('CLIENTE_ID').AsInteger := QTabela.FieldByName('CLIENTE_ID').AsInteger;

    IQuery.Prepare;
    IQuery.ExecSql;



    QTabela.Close;
    QTabela.Open;

    QTabela.Locate('CLIENTE_ID', ID, [loCaseInsensitive]);
  end;

  if Key = VK_F5 then
  begin
    try
      InputString := InputBox('Localizar', 'ID:', '');

      if InputString <> '' then
      begin
        if FrmData.QAcesso.FieldByName('DESATIVADOS').AsString  = 'True' Then
          CmdSelectNull := 'WHERE (CLIENTE_ID = ' + InputString + ')'
        else
          CmdSelectNull := 'WHERE (CLIENTE_ID = ' + InputString + ') AND (STATUS = ' + #39 + 'A' + #39 + ')';

        CmdOrderBy := 'ORDER BY CLIENTE_ID';

        QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

        QTabela.Prepare;
        QTabela.Open;
      end;
    except
  end;
  end;

  if Key = VK_F7 then
  begin
    InputString := InputBox('Localizar', 'Nome:', '');

    if InputString <> '' then
    begin
     InputString := UpperCase(InputString);

     if FrmData.QAcesso.FieldByName('DESATIVADOS').AsString  = 'True' Then
        CmdSelectNull := 'WHERE (NOME LIKE ' + #39 + '%' +  InputString + '%'+ #39 + ')'
      else
        CmdSelectNull := 'WHERE (NOME LIKE ' + #39 + '%'+  InputString + '%' + #39 + ') AND (STATUS = ' + #39 + 'A' + #39 + ')';

      CmdOrderBy := 'ORDER BY NOME';

      QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

      QTabela.Prepare;
      QTabela.Open;
    end;
  end;
end;

procedure TFrmClientes.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Manutencao.Show;
end;

procedure TFrmClientes.DBGrid1TitleClick(Column: TColumn);
begin
  CmdOrderBy       := 'ORDER BY ' + Column.FieldName;
  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

  QTabela.Prepare;
  QTabela.Open;
end;

procedure TFrmClientes.DDDChange(Sender: TObject);
begin
if Copy((Sender as TMaskEdit).Text,3,1) >= '1'  then
    Perform(WM_NEXTDLGCTL,0,0);
end;

procedure TFrmClientes.FDEventAlerter1Alert(ASender: TFDCustomEventAlerter;
  const AEventName: string; const AArgument: Variant);
begin
showmessage ('Recebento evento do banco: ' + AEventName);
end;

procedure TFrmClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmClientes.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (Operacao = 'Inserindo') or (Operacao = 'Alterando') then
  begin
    Application.MessageBox('É melhor salvar as alterações antes de continuar', PChar(Msg_Title), mb_IconStop);
    CanClose := False;
  end;
end;

procedure TFrmClientes.FormCreate(Sender: TObject);
begin
  DBGrid1.Columns[0].Width := 64;
  DBGrid1.Columns[1].Width := 94;
  DBGrid1.Columns[2].Width := 304;
  DBGrid1.Columns[3].Width := 112;
  DBGrid1.Columns[4].Width := 59;
  DBGrid1.Columns[5].Width := 38;

  Grid_Autorizados.Columns[0].Width := 212;
  Grid_Autorizados.Columns[1].Width := 64;
  Grid_Autorizados.Columns[2].Width := 212;
  Grid_Autorizados.Columns[3].Width := 40;
  Grid_Autorizados.Columns[4].Width := 123;


  if FrmPrincipal.Config.FieldByName('EXIBE_FOTO').AsString = 'False' then
  Begin
    Foto.Visible := False;
    Shape1.Visible := False;
    btn_load_image.Visible := False;
    TIPO_CLIENTE.Left := 536;
    CNPJ.Left         := 536;
    CONTATO.Left      := 536;
    LIMITE.Left       := 536;
    Tratamento.Left   := 536;
    //DT_FICHA.Left     := 556;
    SALDO_CONTA.Left  := 536;
    btn_add_saldo.Left:= 632;
    Label20.Left      := 450;
    Label15.Left      := 450;
    Label49.Left      := 450;
    Label21.Left      := 450;
    //Label2.Left       := 470;
    Label17.Left      := 450;
    Label55.Left      := 450;
  End
  else
  Begin
    Foto.Visible := True;
    Shape1.Visible := True;
    btn_load_image.Visible := True;
  End;


  if (FrmPrincipal.QEmpresa.FieldByName('CNPJ').AsString = '18.278.820/0001-05') and
  ((FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger = 1) OR (FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger = 120) OR (FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger = 25) )
  and ((SerialNum('C') =  '22DFAF3F')) Then

    TabSheet8.TabVisible := True
  else
    TabSheet8.TabVisible := False;



  if FrmPrincipal.Config.FieldByName('SPED').AsString = 'False' then
  begin
   // TELEFONE_1.EditMask  := '';
   // TELEFONE_2.EditMask  := '';
    TELEFONE_1.MaxLength := 15;
    TELEFONE_2.MaxLength := 15;
  end;

  CmdSelect := QTabela.Sql.Text;

  if FrmPrincipal.Config.FieldByName('PLANO_PROPRIO').AsString = 'False' then
    COD_CONTABIL.ReadOnly := True
  else
    COD_CONTABIL.ReadOnly := False;

  if FrmPrincipal.Config.FieldByName('MOSTRAR_CADASTROS').AsString = 'True' then
  begin
     if FrmData.QAcesso.FieldByName('DESATIVADOS').AsString = 'True' then
      CmdSelectNull := 'WHERE (CLIENTE_ID IS NOT NULL) AND (STATUS <> ' + #39 + 'I' + #39 + ') '
    else
      CmdSelectNull := 'WHERE (CLIENTE_ID IS NOT NULL) AND (STATUS = ' + #39 + 'A' + #39 + ')';
  end
  else
  begin
    if FrmData.QAcesso.FieldByName('DESATIVADOS').AsString = 'True' then
      CmdSelectNull := 'WHERE (CLIENTE_ID IS NULL)'
    else
      CmdSelectNull := 'WHERE (CLIENTE_ID IS NULL) AND (STATUS = ' + #39 + 'A' + #39 + ')';
  end;

  CmdOrderBy := 'ORDER BY NOME';
  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

  QTabela.Prepare;
  QTabela.Open;


  {if FrmPrincipal.Config.FieldByName('OBJETO_ORDEM').AsString = 'Salão' Then
  Begin
  Label48.Visible := True;
  Limite_Cr.Visible := True;
  End
  Else
  Begin
  Label48.Visible := False;
  Limite_Cr.Visible := False;
  End;
  }

  if FrmPrincipal.Config.FieldByName('OBJETO_ORDEM').AsString = 'Pet Shop' Then
  TabSheet9.TabVisible := True
  Else
  TabSheet9.TabVisible := False;



  Consulta.Show;
  PageControl2.ActivePage := TabSheet1;


  IQuery.Sql.Clear;
  IQuery.Sql.Add('SELECT DESCRICAO ');
  IQuery.Sql.Add('FROM TABELAS WHERE TIPO_TABELA = :TIPO_TABELA ORDER BY DESCRICAO');
  IQuery.ParamByName('TIPO_TABELA').AsString := 'A';
  IQuery.Prepare;
  IQuery.Open();

  Atividade.Items.Clear;
  Atividade.Items.Add(' ');
  while not IQuery.Eof do
  begin

  Atividade.Items.Add(IQuery.FieldByName('DESCRICAO').AsString);
  IQuery.Next;
  end;


  IQuery.Prepare;
  IQuery.Open;

  Tem_Anotacao := True;

  try
    IQuery.Sql.Clear;
    IQuery.Sql.Add('SELECT ANOTACOES');
    IQuery.Sql.Add('FROM CLIENTES');

    IQuery.Prepare;
    IQuery.Open;
  except
    Tem_Anotacao := False;
  end;

end;

procedure TFrmClientes.FormShow(Sender: TObject);
begin
  DBGrid1.SetFocus;
end;

procedure TFrmClientes.Grid_AutorizadosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F4) and (QAutorizados.State = dsBrowse) and (not QAutorizados.IsEmpty) then
    QAutorizados.Delete;

  if Key = VK_F9 then
    Perform(Wm_NextDlgCtl, 0, 0);

  if ((Key = Vk_Up) or (Key = Vk_Down)) and (QAutorizados.State in [dsInsert, dsEdit]) then
    Key := 0;
end;

procedure TFrmClientes.Grid_AutorizadosKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Keybd_Event(VK_TAB, 0, 0, 0);
end;

procedure TFrmClientes.Grid_DadosPetKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F4) and (QAutorizados.State = dsBrowse) and (not QAutorizados.IsEmpty) then
    QAutorizados.Delete;

  if Key = VK_F9 then
    Perform(Wm_NextDlgCtl, 0, 0);

  if ((Key = Vk_Up) or (Key = Vk_Down)) and (QAutorizados.State in [dsInsert, dsEdit]) then
    Key := 0;
end;

procedure TFrmClientes.Grid_DadosPetKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Keybd_Event(VK_TAB, 0, 0, 0);
end;

procedure TFrmClientes.Grid_Produtos_ContratoColExit(Sender: TObject);
begin
if QProdutos_contrato.State in [dsInsert, dsEdit] then
  begin
    if Grid_Produtos_contrato.SelectedField.FieldName = 'produto_id' then
    begin

      IQuery.Sql.Clear;
      IQuery.Sql.Add('SELECT * FROM PRODUTOS_CONTRATO');
      IQuery.Sql.Add('WHERE');
      IQuery.Sql.Add('(PRODUTO_ID = :PRODUTO_ID)');
      IQuery.Sql.Add('AND (CLIENTE_ID = :CLIENTE_ID)');


      IQuery.ParamByName('CLIENTE_ID').AsInteger := QTabela.FieldByName('CLIENTE_ID').AsInteger;
      IQuery.ParamByName('PRODUTO_ID').AsInteger := QProdutos_contrato.FieldByName('PRODUTO_ID').AsInteger;

      IQuery.Prepare;
      IQuery.Open;

      if NOT IQuery.IsEmpty then
       begin
        Application.MessageBox('Produto Contrato já lançado', PChar(Msg_Title), mb_IconStop);
        Grid_Produtos_Contrato.SelectedIndex := 1;
        Abort;
       end;

      IQuery.Sql.Clear;
      IQuery.Sql.Add('SELECT * FROM PRODUTOS');
      IQuery.Sql.Add('WHERE');
      IQuery.Sql.Add('(PRODUTO_ID = :PRODUTO_ID)');
      IQuery.Sql.Add('AND (EMPRESA_ID = :EMPRESA_ID)');
      IQuery.Sql.Add('AND (STATUS = :STATUS)');

      IQuery.ParamByName('PRODUTO_ID').AsInteger := QProdutos_contrato.FieldByName('produto_ID').AsInteger;
      IQuery.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
      IQuery.ParamByName('STATUS').AsString      := 'A';

      IQuery.Prepare;
      IQuery.Open;

      if IQuery.IsEmpty then
      begin

        QProdutos_contrato.FieldByName('DESCRICAO').AsString := '';

        Application.MessageBox('Produto inexistente', PChar(Msg_Title), mb_IconStop);
        Grid_Produtos_contrato.SelectedIndex := 1;


      end
      else
      Begin
       
        QProdutos_contrato.FieldByName('DESCRICAO').AsString   := IQuery.FieldByName('DESCRICAO').AsString;
        QProdutos_contrato.FieldByName('PRECO_VENDA').AsFloat  := IQuery.FieldByName('PRECO_VAREJO').AsFloat;
        //QProdutos_contrato.FieldByName('MARCA').AsString     := IQuery.FieldByName('MARCA').AsString;
        //QProdutos_contrato.FieldByName('QUANTIDADE').AsFloat := IQuery.FieldByName('QUANTIDADE_C').AsFloat;

      End;
    end;


  end;

end;

procedure TFrmClientes.Grid_Produtos_ContratoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if (Key = Vk_F4) and (QProdutos_Contrato.State = dsBrowse) and (not QProdutos_Contrato.IsEmpty) then
    QProdutos_Contrato.Delete;

  if (Key = Vk_F7) and (Grid_Produtos_Contrato.SelectedField.FieldName = 'produto_id') and (QProdutos_Contrato.State in [dsInsert, dsEdit]) then
    QProdutos_Contrato.FieldByName('produto_id').AsInteger := GetConsulta('ESTOQUE', FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger, 0, QProdutos_Contrato.FieldByName('produto_id').AsInteger);

  if Key = VK_F9 then
    Perform(Wm_NextDlgCtl, 0, 0);

  if ((Key = Vk_Up) or (Key = Vk_Down)) and (QProdutos_Contrato.State in [dsInsert, dsEdit]) then
    Key := 0;


end;

procedure TFrmClientes.Grid_Produtos_ContratoKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key = #13 then
    Keybd_Event(VK_TAB, 0, 0, 0);

  Key := AnsiUpperCase(Key)[1];

end;

procedure TFrmClientes.Grid_SeriaisKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
InputString: String;
begin
  if (Key = Vk_F4) and (QSeriais.State = dsBrowse) and (not QSeriais.IsEmpty) then
    QSeriais.Delete;

  if Key = VK_F9 then
    Perform(Wm_NextDlgCtl, 0, 0);

  if ((Key = Vk_Up) or (Key = Vk_Down)) and (QSeriais.State in [dsInsert, dsEdit]) then
    Key := 0;

  if (Key = Vk_F10) and (QSeriais.State = dsBrowse) and (not QSeriais.IsEmpty) then
  begin

    InputString := InputBox('Localizar', 'Liberações clientes, digite o código do HD:', '');

    IQuery.Sql.Clear;
    IQuery.Sql.Add('SELECT SERIAIS.*, CLIENTES.NOME ');
    IQuery.Sql.Add('FROM SERIAIS');
    IQuery.Sql.Add('INNER JOIN CLIENTES');
    IQuery.Sql.Add('ON (CLIENTES.CLIENTE_ID = SERIAIS.CLIENTE_ID)');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(SERIAIS.SERIAL = :SERIAL)');
    IQuery.Sql.Add('ORDER BY CLIENTES.NOME, SERIAIS.SERIAL');

    IQuery.ParamByName('SERIAL').AsString    := InputString;

    IQuery.Prepare;
    IQuery.Open;

    if not IQuery.IsEmpty then
      Rel_Series.PreviewModal;
  end;

  Label13.Visible := True;
  Label13.Caption := 'HD: ' + UpperCase(Qseriais.FieldByName('SERIAL').AsString);

end;

procedure TFrmClientes.Grid_SeriaisKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Keybd_Event(VK_TAB, 0, 0, 0);
end;



procedure TFrmClientes.Grid_SeriaisKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
Label13.Visible := True;
Label13.Caption := 'HD: ' + UpperCase(Qseriais.FieldByName('SERIAL').AsString);

end;

end.
