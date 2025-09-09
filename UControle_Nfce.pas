unit UControle_Nfce;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls,IniFiles, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, ACBrDANFCeFortesFr, ACBrNFeDANFEClass,
  ACBrNFeDANFeRLClass, ACBrBase, ACBrDFe, ACBrNFe,pcnConversaoNFe,pcnConversao,
  ACBrMail, Vcl.Menus, Vcl.Buttons, ACBrDFeReport, ACBrDFeDANFeReport, Vcl.Mask,
  RxToolEdit,ACBrDFeSSL,  Vcl.ImgList,Math, Vcl.ComCtrls, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys;

type
  TFrmControle_Nfce = class(TForm)
    DBgrid_recebidas: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    QNfce_Recebidas: TFDQuery;
    QNfce_Erro: TFDQuery;
    Data_Recebidas: TDataSource;
    Data_Enviadas: TDataSource;
    Data_erro: TDataSource;
    QNfce_Enviadas: TFDQuery;
    DBGrid_Enviadas: TDBGrid;
    DBGrid2: TDBGrid;
    config: TFDTable;
    QEmpresa: TFDQuery;
    QRel: TFDQuery;
    QUpdate: TFDQuery;
    MainMenu1: TMainMenu;
    Nfce1: TMenuItem;
    ImprimirNfce1: TMenuItem;
    OpenDialog1: TOpenDialog;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Msg_If: TLabel;
    Chk_exibir: TCheckBox;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BtnAtualizar: TBitBtn;
    Label4: TLabel;
    Dtmen: TDateEdit;
    Dtmai: TDateEdit;
    IQuery: TFDQuery;
    btnRetorna: TButton;
    BitBtn7: TBitBtn;
    Memoresp: TMemo;
    QCancelamento: TFDQuery;
    QArq: TFDQuery;
    BitBtn8: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn9: TBitBtn;
    QSearch: TFDQuery;
    ImageList1: TImageList;
    QNfce_Enviadastransacao_id: TIntegerField;
    QNfce_Enviadasdt_saida: TDateField;
    QNfce_Enviadashr_saida: TStringField;
    QNfce_Enviadasrecibo: TStringField;
    QNfce_Enviadasprotocolo: TStringField;
    QNfce_Enviadaschave_nfce: TStringField;
    QNfce_Enviadasempresa_id: TIntegerField;
    QNfce_Enviadasecf: TStringField;
    QNfce_Enviadastransmissao: TStringField;
    QNfce_Enviadaspathnfce_servidor: TStringField;
    QNfce_Enviadaspathnfce_local: TStringField;
    QNfce_Enviadasdt_emissao: TDateField;
    QNfce_Enviadasdt_transmissao: TDateField;
    QNfce_Enviadasexportado: TIntegerField;
    QNfce_Enviadasvalor: TBCDField;
    QNfce_Enviadasno_doc_fiscal: TIntegerField;
    QNfce_Enviadassintegra: TStringField;
    QNfce_Enviadascond_pagto: TStringField;
    QNfce_Enviadaspathnfce_servidor_env: TStringField;
    QNfce_Enviadasarquivo_xml: TBlobField;
    QNfce_Recebidastransacao_id: TIntegerField;
    QNfce_Recebidasdt_saida: TDateField;
    QNfce_Recebidashr_saida: TStringField;
    QNfce_Recebidasrecibo: TStringField;
    QNfce_Recebidasprotocolo: TStringField;
    QNfce_Recebidaschave_nfce: TStringField;
    QNfce_Recebidasempresa_id: TIntegerField;
    QNfce_Recebidasecf: TStringField;
    QNfce_Recebidastransmissao: TStringField;
    QNfce_Recebidaspathnfce_servidor: TStringField;
    QNfce_Recebidaspathnfce_local: TStringField;
    QNfce_Recebidasdt_emissao: TDateField;
    QNfce_Recebidasdt_transmissao: TDateField;
    QNfce_Recebidasexportado: TIntegerField;
    QNfce_Recebidasvalor: TBCDField;
    QNfce_Recebidasno_doc_fiscal: TIntegerField;
    QNfce_Recebidassintegra: TStringField;
    QNfce_Recebidascond_pagto: TStringField;
    QNfce_Recebidaspathnfce_servidor_env: TStringField;
    QNfce_Recebidasarquivo_xml: TBlobField;
    ACBrNFeDANFCeFortes1: TACBrNFeDANFCeFortes;
    ACBrNFe1: TACBrNFe;
    ACBrNFeDANFeRL1: TACBrNFeDANFeRL;
    ACBrMail1: TACBrMail;
    QItens: TFDQuery;
    QProdutos: TFDQuery;
    BitBtn10: TBitBtn;
    Label5: TLabel;
    Label6: TLabel;
    ChaveRec_Edt: TEdit;
    Label7: TLabel;
    ChaveEnv_edt: TEdit;
    BitBtn11: TBitBtn;
    Monitor: TRichEdit;
    QSearchPdv: TFDQuery;
    QInsert: TFDQuery;
    Eficaz_pdv: TFDConnection;
    Fdac_Temp: TFDMemTable;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EventoVendaNfceAlert(ASender: TFDCustomEventAlerter;
      const AEventName: string; const  AArgument: Variant);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure QNfce_RecebidasAfterOpen(DataSet: TDataSet);
    procedure QNfce_EnviadasAfterOpen(DataSet: TDataSet);
    procedure QNfce_ErroAfterOpen(DataSet: TDataSet);
    procedure ACBrNFe1StatusChange(Sender: TObject);
    procedure DBGrid_EnviadasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const  Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ImprimirNfce1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure TrataErros(Sender: TObject; E: Exception);
    procedure BitBtn3Click(Sender: TObject);
    procedure BtnAtualizarClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure btnRetornaClick(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure QNfce_Enviadasarquivo_xmlGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure DBgrid_recebidasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure QNfce_Recebidasarquivo_xmlGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure BitBtn10Click(Sender: TObject);
    procedure DBGrid_EnviadasCellClick(Column: TColumn);
    procedure DBgrid_recebidasCellClick(Column: TColumn);
    procedure BitBtn11Click(Sender: TObject);




  private
    { Private declarations }
     procedure Localiz_Produto(ID: Integer);

  public
    { Public declarations }
    Procedure EnviarNfces;
  end;

var
  FrmControle_Nfce: TFrmControle_Nfce;

  Msg_Title, Arq_Ini:String;
  Preco_venda:Real;
  Eficaz_Pdv01,Eficaz_Pdv02,Eficaz_Pdv: TFDConnection;

  function LeIni(Arq, Secao, Item: String): String;
  procedure GravaIni(Arq, Secao, Item, Vl: String);
  function EncryptMsg(Msg1: String; EncryptNo: Integer): String;
  function DecryptMsg(Msg1: String; DecryptNo: Integer): String;
  Procedure Controle_nfce;
  function Formata_CNPJ(Txt: String): String;
  function StrZero(TX: String; TAM, DEC: Integer): String;
  function Formata_CPF(Txt: String): String;
  function ValidaEMail(Const EMailIn: String): Boolean;


implementation
uses
  UData,ustatus,UPrincipal, UGerente;

 {$R *.dfm}

 procedure TFrmControle_Nfce.Localiz_Produto(ID: Integer);
begin
  QProdutos.SQL.Clear;
  QProdutos.SQL.Add('SELECT PRODUTOS.*, TRIBUTOS.DESCRICAO DESCRICAO_TRIBUTO, TRIBUTOS.CODIGO_ECF, TRIBUTOS.ORIGEM, TRIBUTOS.TRIBUTACAO, TRIBUTOS.CFOP,IBTP.ALIQNAC,IBTP.ALIQIMP,IBTP.ALIQEST');
  QProdutos.SQL.Add('FROM PRODUTOS');
  QProdutos.SQL.Add('INNER JOIN TRIBUTOS');
  QProdutos.SQL.Add('ON (PRODUTOS.TRIBUTO_ID = TRIBUTOS.TRIBUTO_ID)');
  QProdutos.SQL.Add('LEFT JOIN IBTP');
  QProdutos.SQL.Add('ON (PRODUTOS.NCM = IBTP.CODIGO)');
  QProdutos.SQL.Add('WHERE');
  QProdutos.SQL.Add('(PRODUTO_ID = :PRODUTO_ID)');
  QProdutos.SQL.Add('AND (STATUS = :STATUS)');

  QProdutos.ParamByName('PRODUTO_ID').AsInteger := ID;
  QProdutos.ParamByName('STATUS').AsString := 'A';

  QProdutos.Prepare;
  QProdutos.Open;

  if (Date >= QProdutos.FieldByName('PROMO_INICIAL').AsDateTime) and
    (Date <= QProdutos.FieldByName('PROMO_FINAL').AsDateTime) then

    Preco_Venda := QProdutos.FieldByName('PRECO_PROMOCAO').AsFloat

  else

    Preco_Venda := QProdutos.FieldByName('PRECO_VAREJO').AsFloat;

end;


function ValidaEMail(Const EMailIn: String): Boolean;
const
CaraEsp: array[1..40] of string[1] = ( '!','#','$','%','¨','&','*', '(',')','+','=','§','¬','¢','¹','²', '³','£','´','`','ç','Ç',',',';',':', '<','>','~','^','?','/','','|','[',']','{','}', 'º','ª','°');
var
I, Cont: Integer;
EMail: string;
begin
  EMail := EMailIn;
  Result := True;
  Cont := 0;

  if EMail <> '' then
  begin
    if (Pos('@', EMail) <> 0) and (Pos('.', EMail) <> 0) then    // existe @ .
    begin
      if (Pos('@', EMail) = 1) or (Pos('@', EMail) = Length(EMail)) or (Pos('.', EMail) = 1) or (Pos('.', EMail) = Length(EMail)) or (Pos(' ', EMail) <> 0) then
        Result := False
      else                                   // @ seguido de . e vice-versa
        if (abs(Pos('@', EMail) - Pos('.', EMail)) = 1) then
          Result := False
        else
        begin
          for I := 1 to 40 do                // se existe Caracter Especial
          begin
            if Pos(CaraEsp[I], EMail) <> 0 then
              Result := False;
          end;

          for I := 1 to length(EMail) do
          begin                              // se existe apenas 1 @
            if EMail[I] = '@' then
              Cont := Cont + 1;              // . seguidos de .

            if (EMail[I] = '.') and (EMail[I + 1] = '.') then
              Result := False;
          end;
                                             // . no f, 2ou+ @, . no i, - no i, _ no i
          if (cont >= 2) or (EMail[length(EMail)] = '.') or (EMail[1]= '.') or (EMail[1]= '_') or (EMail[1]= '-')  then
            Result := False;
                                             // @ seguido de COM e vice-versa
                                             //Comentato por exemplo @comercial, @compania
         { if (abs(Pos('@', EMail) - Pos('com', EMail)) = 1) then
            Result := False;}
                                             // @ seguido de - e vice-versa
          if (abs(Pos('@', EMail) - Pos('-', EMail)) = 1) then
            Result := False;
                                             // @ seguido de _ e vice-versa
          if (abs(Pos('@', EMail) - Pos('_', EMail)) = 1) then
            Result := False;
        end;
    end
    else
      Result := False;
  end;
end;

function Formata_CPF(Txt: String): String;
begin
  Result := Copy(Txt, 1, 3) + '.' + Copy(Txt, 4, 3) + '.' + Copy(Txt, 7, 3) + '-' + Copy(Txt, 10, 2);
end;


function StrZero(TX: String; TAM, DEC: Integer): String;
var
X: Integer;
VIRG: Boolean;
AA, BB: String;
begin
  VIRG := False;
  AA := '';
  BB := '';

  for X := 1 to length(TX) do
  begin
    if Copy(TX, X, 1) = ',' then
      VIRG := True;

    if (not VIRG) and (Copy(TX, X, 1) <> ',') then
      AA := AA + Copy(TX, X, 1)
    else
    begin
      if (length(BB) < DEC) and (Copy(TX, X, 1) <> ',') then
        BB := BB + Copy(TX, X, 1);
    end;
  end;

  if length(BB) < DEC then
  begin
    for X := 1 to (DEC - length(BB)) do
      BB := BB + '0';
  end;

  Result := AA + BB;
  for X := 1 to TAM - length(RESULT) do
    Result := '0' + Result;
end;


 function Formata_CNPJ(Txt: String): String;
begin
  Result := Copy(Txt, 1, 2) + '.' + Copy(Txt, 3, 3) + '.' + Copy(Txt, 6, 3) + '/' + Copy(Txt, 9, 4) + '-' + Copy(Txt, 13, 2);
end;

procedure Controle_nfce;
begin
  Application.CreateForm(TFrmControle_Nfce, FrmControle_Nfce);
  try
      FrmControle_Nfce.ShowModal;
  finally
    FrmControle_Nfce.Release;
  end;
end;


Procedure TFrmControle_Nfce.EnviarNfces;
Var
Vr_Desonerado,Base_ICMS_Normal_Acum,Vr_ICMS_Normal_Acum,Base_ICMS_ST_Acum,Vr_ICMS_ST_Acum,Vr_Pis_Acum,Vr_Cofins_Acum :REAL;
Begin

QNfce_Recebidas.Close;
QNfce_Recebidas.Params[0].AsDate := Dtmai.Date;
QNfce_Recebidas.Params[1].AsDate := Dtmen.Date;
QNfce_Recebidas.Prepare;
QNfce_Recebidas.Open();

QNfce_Enviadas.Close;
QNfce_Enviadas.Params[0].AsDate := Dtmai.Date;
QNfce_Enviadas.Params[1].AsDate := Dtmen.Date;
QNfce_Enviadas.Prepare;
QNfce_Enviadas.Open();

QNfce_Erro.Close;
QNfce_Erro.Params[0].AsDate := Dtmai.Date;
QNfce_Erro.Params[1].AsDate := Dtmen.Date;
QNfce_Erro.Prepare;
QNfce_Erro.Open();



  if not QNfce_Recebidas.isempty Then
  Begin
    while not QNfce_Recebidas.eof do
    Begin
     try
       Msg_If.Caption := '';

      // FrmControle_Nfce.ACBrNFe1.Configuracoes.Arquivos.PathSalvar     := ExtractFilePath(ParamStr(0)) + 'TRANSMITIR_NFCE\' + FrmControle_Nfce.QNfce_Recebidas.FieldByName('ECF').AsString +'\ENVIADAS\';
      // FrmControle_Nfce.ACBrNFe1.Configuracoes.Arquivos.PathNfe        := ExtractFilePath(ParamStr(0)) + 'TRANSMITIR_NFCE\' + FrmControle_Nfce.QNfce_Recebidas.FieldByName('ECF').AsString +'\ENVIADAS\';

      ACBrNFe1.NotasFiscais.Clear;
       //FrmPrincipal.ACBrNFe1.NotasFiscais.LoadFromFile(FrmControle_Nfce.QNfce_Recebidas.FieldByName('PATHNFCE_LOCAL').AsString + FrmControle_Nfce.QNfce_Recebidas.FieldByName('CHAVE_NFCE').AsString +'-nfe.xml');

      ACBrNFe1.NotasFiscais.LoadFromString(QNfce_Recebidas.FieldByName('ARQUIVO_XML').AsString);


      with FrmControle_Nfce.ACBrNFe1.NotasFiscais.Items[0].NFe do
      Begin
      Emit.CNPJCPF           := FrmControle_Nfce.QEmpresa.FieldByName('CNPJ').AsString;
      Emit.xNome             := FrmControle_Nfce.QEmpresa.FieldByName('RAZAO').AsString;
      Emit.xFant             := FrmControle_Nfce.QEmpresa.FieldByName('RAZAO').AsString;
      Emit.EnderEmit.xLgr    := FrmControle_Nfce.QEmpresa.FieldByName('ENDERECO').AsString;
      Emit.EnderEmit.nro     := FrmControle_Nfce.QEmpresa.FieldByName('NUMERO').AsString;
      Emit.EnderEmit.xCpl    := '';
      Emit.EnderEmit.xBairro := FrmControle_Nfce.QEmpresa.FieldByName('BAIRRO').AsString;
      Emit.EnderEmit.cMun    := FrmControle_Nfce.QEmpresa.FieldByName('IBGE').AsInteger;
      Emit.EnderEmit.xMun    := FrmControle_Nfce.QEmpresa.FieldByName('MUNICIPIO').AsString;
      Emit.EnderEmit.UF      := FrmControle_Nfce.QEmpresa.FieldByName('ESTADO').AsString;
      Emit.EnderEmit.CEP     := StrToInt(SemMascara(FrmControle_Nfce.QEmpresa.FieldByName('CEP').AsString));
      Emit.EnderEmit.cPais   := 1058;
      Emit.EnderEmit.xPais   := 'BRASIL';
      Emit.EnderEmit.fone    := FrmControle_Nfce.QEmpresa.FieldByName('TELEFONE').AsString;

      Emit.IE                := FrmControle_Nfce.QEmpresa.FieldByName('INSCR_ESTADUAL').AsString;
      //        Emit.IEST
      Emit.IM                := FrmControle_Nfce.QEmpresa.FieldByName('INSCR_MUNICIPAL').AsString;
      Emit.CNAE              := SemMascara(FrmControle_Nfce.QEmpresa.FieldByName('COD_ATIVIDADE').AsString);

      if FrmControle_Nfce.QEmpresa.FieldByName('CRT').AsString = '1 - SIMPLES NACIONAL' then
        Emit.CRT := crtSimplesNacional
      else if FrmControle_Nfce.QEmpresa.FieldByName('CRT').AsString = '2 - SIMPLES NACIONAL - EXC. REC. BRUTA' then
        Emit.CRT := crtSimplesExcessoReceita
      else
        Emit.CRT := crtRegimeNormal;
      End;


      with FrmControle_Nfce.ACBrNFe1.NotasFiscais.Items[0].NFe.Ide do
      Begin
      dEmi := StrToDateTime(DateToStr(date) +  TimeToStr(time)) ;
      End;

      FrmControle_Nfce.QSearch.SQL.Clear;
      FrmControle_Nfce.QSearch.SQL.Add('SELECT CLIENTE_ID FROM TRANSACOES WHERE TRANSACAO_ID = :TRANSACAO_ID ');
      FrmControle_Nfce.QSearch.ParamByName('TRANSACAO_ID').AsInteger := FrmControle_Nfce.QNfce_Recebidas.FieldByName('TRANSACAO_ID').AsInteger;
      FrmControle_Nfce.QSearch.Prepare;
      FrmControle_Nfce.QSearch.Open();

      if FrmControle_Nfce.QSearch.FieldByName('CLIENTE_ID').AsInteger >= 0  then
      Begin


      FrmControle_Nfce.IQuery.Sql.Clear;
      FrmControle_Nfce.IQuery.Sql.Text := 'SELECT * FROM CLIENTES WHERE CLIENTE_ID = :CLIENTE_ID';
      FrmControle_Nfce.IQuery.ParamByName('CLIENTE_ID').AsInteger := FrmControle_Nfce.QSearch.FieldByName('CLIENTE_ID').AsInteger;
      FrmControle_Nfce.IQuery.Prepare;
      FrmControle_Nfce.IQuery.Open();
      End;


      if not FrmControle_Nfce.IQuery.IsEmpty then
      Begin
        with FrmControle_Nfce.ACBrNFe1.NotasFiscais.Items[0].NFe do
        Begin

            TRY
            Dest.IE                := '';
            Dest.indIEDest         := inNaoContribuinte;
            Dest.Email             := FrmControle_Nfce.IQuery.FieldByName('EMAIL').AsString;
            Dest.CNPJCPF           := FrmControle_Nfce.IQuery.FieldByName('CNPJ').AsString;
            Dest.xNome             := FrmControle_Nfce.IQuery.FieldByName('NOME').AsString;

            Dest.EnderDest.xLgr    := FrmControle_Nfce.IQuery.FieldByName('ENDERECO').AsString;
            Dest.EnderDest.nro     := FrmControle_Nfce.IQuery.FieldByName('NUMERO').AsString;
            Dest.EnderDest.xCpl    := FrmControle_Nfce.IQuery.FieldByName('COMPLEMENTO').AsString;;
            Dest.EnderDest.xBairro := FrmControle_Nfce.IQuery.FieldByName('BAIRRO').AsString;
            Dest.EnderDest.xMun    := FrmControle_Nfce.IQuery.FieldByName('MUNICIPIO').AsString;
            Dest.EnderDest.UF      := FrmControle_Nfce.IQuery.FieldByName('ESTADO').AsString;


            if FrmControle_Nfce.IQuery.FieldByName('BAIRRO').AsString = '' then
            Dest.EnderDest.xBairro := 'Não Informado.';

            if FrmControle_Nfce.IQuery.FieldByName('ENDERECO').AsString = '' Then
            Dest.EnderDest.xLgr    := 'Não Informado.';

            if FrmControle_Nfce.IQuery.FieldByName('NUMERO').AsString = '' Then
            Dest.EnderDest.nro     := '0';

            if FrmControle_Nfce.IQuery.FieldByName('MUNICIPIO').AsString = '' then
            Dest.EnderDest.xMun    := 'Não Informado.';

            if FrmControle_Nfce.IQuery.FieldByName('ESTADO').AsString = '' then
            Dest.EnderDest.UF      := FrmControle_Nfce.IQuery.FieldByName('ESTADO').AsString;


              try
                Dest.EnderDest.cMun := FrmControle_Nfce.IQuery.FieldByName('IBGE').AsInteger;
              except
                Dest.EnderDest.cMun := StrToInt(FrmControle_Nfce.QEmpresa.FieldByName('IBGE').AsString);
              end;



              try
                Dest.EnderDest.CEP := StrToInt(SemMascara(FrmControle_Nfce.IQuery.FieldByName('CEP').AsString));
              except
                Dest.EnderDest.CEP := StrToInt(SemMascara(FrmControle_Nfce.QEmpresa.FieldByName('CEP').AsString));;
              end;

            Dest.EnderDest.cPais := 1058;
            Dest.EnderDest.xPais := 'BRASIL';
            Dest.EnderDest.Fone  := FrmControle_Nfce.IQuery.FieldByName('DDD').AsString + FrmControle_Nfce.IQuery.FieldByName('TELEFONE_1').AsString;

            Dest.ISUF            := FrmControle_Nfce.IQuery.FieldByName('SUFRAMA').AsString;


            EXCEPT
            {on e:Exception do
                  begin
                    Application.MessageBox(PChar('Erro parceiro:' + #13 +
                      'Erro: ' + e.Message), 'Erro', MB_ICONSTOP + MB_TASKMODAL);
                  end;

             }
            END;

        End;

      End;




      with ACBrNFe1.NotasFiscais.Items[0].NFe.Det do
      Begin
        Clear;

         QItens.SQL.Clear;
         QItens.SQL.Add('SELECT * FROM TRANSITENS WHERE TRANSACAO_ID = :TRANSACAO_ID ORDER BY SEQUENCIA');
         QItens.ParamByName('TRANSACAO_ID').AsInteger := QNfce_Recebidas.FieldByName('TRANSACAO_ID').AsInteger;
         QItens.Prepare;
         QItens.Open();


        QItens.First;

        Vr_Desonerado := 0;
        Base_ICMS_Normal_Acum := 0;
        Vr_ICMS_Normal_Acum := 0;
        Base_ICMS_ST_Acum := 0;
        Vr_ICMS_ST_Acum   := 0;
        Vr_Pis_Acum       := 0;
        Vr_Cofins_Acum    := 0;



        while not QItens.Eof do
        begin
          Localiz_Produto(QItens.FieldByName('PRODUTO_ID').AsInteger);

          with Add do
          begin


            Prod.cProd   := QItens.FieldByName('PRODUTO_ID').AsString;
            Prod.nItem   := QItens.FieldByName('SEQUENCIA').AsInteger;

            if QProdutos.FieldByName('COD_BARRA').AsString <> '' then
            Prod.cEAN := StrZero(QProdutos.FieldByName('COD_BARRA').AsString, 13, 0)
            Else
            Prod.cEAN :='SEM GTIN';

            if LeIni(Arq_Ini, 'Sistema', 'Enviar Código EAN Nfe') = 'False' then
            Prod.cEAN :='SEM GTIN';

            //if LeIni(Arq_Ini, 'Sistema', 'Enviar Código EAN Nfe') = 'False' then
            //Prod.cEAN :='';

            Prod.xProd    := QItens.FieldByName('DESCRICAO').AsString;
            Prod.NCM      := QProdutos.FieldByName('NCM').AsString;
            Prod.CEST     := QProdutos.FieldByName('CEST').AsString;
            Prod.EXTIPI   := '';
            Prod.CFOP     := QItens.FieldByName('CFOP').AsString;
            Prod.uCom     := QProdutos.FieldByName('UNIDADE_VENDA').AsString;
            Prod.qCom     := QItens.FieldByName('QUANTIDADE').AsFloat;
            Prod.vUnCom   := QItens.FieldByName('VR_UNITARIO').AsFloat;
            Prod.vProd    := QItens.FieldByName('VR_TOTAL').AsFloat;
            Prod.nItem    := QItens.FieldByName('SEQUENCIA').AsInteger;

            if QProdutos.FieldByName('COD_BARRA').AsString <> '' then
            Prod.cEANTrib := StrZero(QProdutos.FieldByName('COD_BARRA').AsString, 13, 0)
            Else
            Prod.cEANTrib :='SEM GTIN';

            if LeIni(Arq_Ini, 'Sistema', 'Enviar Código EAN Nfe') = 'False' then
            Prod.cEANTrib :='SEM GTIN';

            IF QProdutos.FieldByName('UNIDADE_TRIB').AsString <> '' Then
            Prod.uTrib    := QProdutos.FieldByName('UNIDADE_TRIB').AsString
            Else
            Prod.uTrib    := QProdutos.FieldByName('UNIDADE_VENDA').AsString;

            Prod.qTrib    := QItens.FieldByName('QUANTIDADE').AsFloat;

            Prod.vUnTrib  := QItens.FieldByName('VR_UNITARIO').AsFloat;
            Prod.vUnCom   := QItens.FieldByName('VR_UNITARIO').AsFloat;
            Prod.vFrete   := QItens.FieldByName('VR_FRETE').AsFloat;
            Prod.vSeg     := 0;
            Prod.vDesc    := QItens.FieldByName('DESC_RODAPE').AsFloat;
            Prod.vOutro   := QItens.FieldByName('VR_ACRESCIMO').AsFloat;
            Prod.comb.cProdANP       := QProdutos.FieldByName('COD_ANP').AsInteger;
            Prod.comb.descANP        := QProdutos.FieldByName('DESCRICAO').AsString;
            Prod.comb.CODIF          := QProdutos.FieldByName('CODIF').AsString;
           // Prod.comb.UFcons         := QParceiro.FieldByName('ESTADO').AsString;
            Prod.comb.CIDE.qBCProd   := QProdutos.FieldByName('BC_CIDE').AsFloat;
            Prod.comb.CIDE.vAliqProd := QProdutos.FieldByName('ALIQ_CIDE').AsFloat;
            Prod.comb.CIDE.vCIDE     := QProdutos.FieldByName('CIDE').AsFloat;
            Prod.comb.pGLP           := 25.000;
            Prod.comb.pGNn           := 30.000;
            Prod.Comb.pGNi           := 45.000;
            Prod.Comb.vPart          := 50.000;

            with Imposto do
            begin
              with ICMS do
              begin
                if QProdutos.FieldByName('ORIGEM').AsString = '0-NACIONAL' then
                  orig := oeNacional
                else if QProdutos.FieldByName('ORIGEM').AsString = '1-ESTRANGEIRA-IMPORTAÇÃO DIRETA' then
                  orig := oeEstrangeiraImportacaoDireta
                else if QProdutos.FieldByName('ORIGEM').AsString = '2-ESTRANGEIRA-ADQUIRIDA NO MERCADO INTER' then
                  orig := oeEstrangeiraAdquiridaBrasil
                else if QProdutos.FieldByName('ORIGEM').AsString = '3-NACIONAL- MERCADORIA OU BEM  COM CONT.' then
                  orig  := oeNacionalConteudoImportacaoSuperior40
                else if QProdutos.FieldByName('ORIGEM').AsString = '4-NACIONAL-DECRETO 288/67 E LEIS 8248/91' then
                  orig  := oeNacionalProcessosBasicos
                else if QProdutos.FieldByName('ORIGEM').AsString = '5-NACIONAL-CONTEUDO IMPORTÇÃO INFERIOR O' then
                  orig  := oeNacionalConteudoImportacaoInferiorIgual40
                else if QProdutos.FieldByName('ORIGEM').AsString = '6-ESTRANGEIRA-IMP. DIRETA SEM SIMILAR NA' then
                  orig  := oeEstrangeiraImportacaoDiretaSemSimilar
                else if QProdutos.FieldByName('ORIGEM').AsString = '7-ESTRANGEIRA-ADQ. MERCAD. INTERNO SEM S' then
                  orig  := oeEstrangeiraAdquiridaBrasilSemSimilar
                else if QProdutos.FieldByName('ORIGEM').AsString = '8-NACIONAL-CONTEUDO IMPORTÇÃO SUPERIOR A' then
                  orig  := oeNacionalConteudoImportacaoSuperior70;

               if FrmPrincipal.QEmpresa.FieldByName('CRT').AsString = '1 - SIMPLES NACIONAL' then
               Begin

                if QProdutos.FieldByName('CSOSN').AsString = '101' then
                  CSOSN := csosn101
                else if QProdutos.FieldByName('CSOSN').AsString = '102' then
                  CSOSN := csosn102
                else if QProdutos.FieldByName('CSOSN').AsString = '103' then
                  CSOSN := csosn103
                else if QProdutos.FieldByName('CSOSN').AsString = '201' then
                  CSOSN := csosn201
                else if QProdutos.FieldByName('CSOSN').AsString = '202' then
                  CSOSN := csosn202
                else if QProdutos.FieldByName('CSOSN').AsString = '203' then
                  CSOSN := csosn203
                else if QProdutos.FieldByName('CSOSN').AsString = '300' then
                  CSOSN := csosn300
                else if QProdutos.FieldByName('CSOSN').AsString = '400' then
                  CSOSN := csosn400
                else if QProdutos.FieldByName('CSOSN').AsString = '500' then
                  CSOSN := csosn500
                else if QProdutos.FieldByName('CSOSN').AsString = '900' then
                  CSOSN := csosn900
                else
                  CSOSN := csosnVazio;

               End;


                if Copy(QItens.FieldByName('CST').AsString, 2, 2) = '00' then
                begin
                  CST := cst00;

                  if QProdutos.FieldByName('MOD_ICMS').AsString = 'MVA' then
                    modBC  := dbiMargemValorAgregado
                  else if QProdutos.FieldByName('MOD_ICMS').AsString = 'PAUTA' then
                    modBC  := dbiPauta
                  else if QProdutos.FieldByName('MOD_ICMS').AsString = 'PR. TABELADO' then
                    modBC  := dbiPrecoTabelado
                  else if QProdutos.FieldByName('MOD_ICMS').AsString = 'VALOR DA OPERAÇÃO' then
                    modBC  := dbiValorOperacao
                  else
                    modBC  := dbiValorOperacao;

                  vBC    := QItens.FieldByName('BASE_CALC_ICMS').AsFloat;
                  pICMS  := QItens.FieldByName('ALIQUOTA_ICMS').AsFloat;
                  vICMS  := QItens.FieldByName('VALOR_ICMS').AsFloat;

                  if QItens.FieldByName('VR_REDUCAO_BC').AsFloat > 0 then
                    pRedBC := SimpleRoundTo((QItens.FieldByName('VR_REDUCAO_BC').AsFloat * 100) / (QItens.FieldByName('VR_TOTAL').AsFloat) , -2);

                  if QItens.FieldByName('BASE_CALC_ICMS').AsFloat > 0 then
                    vBC := QItens.FieldByName('BASE_CALC_ICMS').AsFloat;

                  if QItens.FieldByName('ALIQUOTA_ICMS').AsFloat > 0 then
                    pICMS := QItens.FieldByName('ALIQUOTA_ICMS').AsFloat;

                  if QItens.FieldByName('VALOR_ICMS').AsFloat > 0 then
                    vICMS := QItens.FieldByName('VALOR_ICMS').AsFloat;

                  if QItens.FieldByName('VR_BASE_FCP').AsFloat > 0 then
                      vBCFCP := QItens.FieldByName('VR_BASE_FCP').AsFloat ;

                  if QItens.FieldByName('VR_FCP').AsFloat > 0 then
                    vFCP  := QItens.FieldByName('VR_FCP').AsFloat;

                  if QItens.FieldByName('P_FCP').AsFloat  > 0  Then
                    pFCP  :=  QItens.FieldByName('P_FCP').AsFloat;


                end
                else if Copy(QItens.FieldByName('CST').AsString, 2, 2) = '02' then
                begin
                  //CST := cst10;

                  if QProdutos.FieldByName('MOD_ICMS').AsString = 'MVA' then
                    modBC  := dbiMargemValorAgregado
                  else if QProdutos.FieldByName('MOD_ICMS').AsString = 'PAUTA' then
                    modBC  := dbiPauta
                  else if QProdutos.FieldByName('MOD_ICMS').AsString = 'PR. TABELADO' then
                    modBC  := dbiPrecoTabelado
                  else if QProdutos.FieldByName('MOD_ICMS').AsString = 'VALOR DA OPERACAO' then
                    modBC  := dbiValorOperacao
                  else
                    modBC  := dbiValorOperacao;

                  vBC   := QItens.FieldByName('BASE_CALC_ICMS').AsFloat;
                  pICMS := QItens.FieldByName('ALIQUOTA_ICMS').AsFloat;
                  vICMS := QItens.FieldByName('VALOR_ICMS').AsFloat;

                  if QProdutos.FieldByName('MOD_ICMS_ST').AsString = 'PR. TABELADO' then
                    modBCST := dbisPrecoTabelado
                  else if QProdutos.FieldByName('MOD_ICMS_ST').AsString = 'LISTA NEGATIVA' then
                    modBCST := dbisListaNegativa
                  else if QProdutos.FieldByName('MOD_ICMS_ST').AsString = 'LISTA POSITIVA' then
                    modBCST := dbisListaPositiva
                  else if QProdutos.FieldByName('MOD_ICMS_ST').AsString = 'LISTA NEUTRA' then
                    modBCST := dbisListaNeutra
                  else if QProdutos.FieldByName('MOD_ICMS_ST').AsString = 'MVA' then
                    modBCST := dbisMargemValorAgregado
                  else if QProdutos.FieldByName('MOD_ICMS_ST').AsString = 'PAUTA' then
                    modBCST := dbisPauta
                  else
                    modBCST := dbisMargemValorAgregado;

                  pMVAST   := QItens.FieldByName('MVA').AsFloat;
                  pRedBCST := SimpleRoundTo((QItens.FieldByName('VR_REDUCAO_BC').AsFloat * 100) / (QItens.FieldByName('VR_TOTAL').AsFloat),-2);


                  vBCST    := QItens.FieldByName('BASE_CALC_ST').AsFloat;
                  pICMSST  := QItens.FieldByName('ALIQUOTA_ST').AsFloat;
                  vICMSST  := QItens.FieldByName('VALOR_ICMS_ST').AsFloat;

                  if QItens.FieldByName('VR_BASE_FCPST').AsFloat > 0 then
                     vBCFCPST := QItens.FieldByName('VR_BASE_FCPST').AsFloat ;

                  if QItens.FieldByName('VR_FCPST').AsFloat > 0 then
                    vFCPSt  := QItens.FieldByName('VR_FCPST').AsFloat;

                  if QItens.FieldByName('P_FCPST').AsFloat > 0  Then
                    pFCPST  :=  QItens.FieldByName('P_FCPST').AsFloat;

                end
                else if Copy(QItens.FieldByName('CST').AsString, 2, 2) = '10' then
                begin
                  CST := cst10;

                  if QProdutos.FieldByName('MOD_ICMS').AsString = 'MVA' then
                    modBC  := dbiMargemValorAgregado
                  else if QProdutos.FieldByName('MOD_ICMS').AsString = 'PAUTA' then
                    modBC  := dbiPauta
                  else if QProdutos.FieldByName('MOD_ICMS').AsString = 'PR. TABELADO' then
                    modBC  := dbiPrecoTabelado
                  else if QProdutos.FieldByName('MOD_ICMS').AsString = 'VALOR DA OPERACAO' then
                    modBC  := dbiValorOperacao
                  else
                    modBC  := dbiValorOperacao;

                  vBC   := QItens.FieldByName('BASE_CALC_ICMS').AsFloat;
                  pICMS := QItens.FieldByName('ALIQUOTA_ICMS').AsFloat;
                  vICMS := QItens.FieldByName('VALOR_ICMS').AsFloat;

                  if QProdutos.FieldByName('MOD_ICMS_ST').AsString = 'PR. TABELADO' then
                    modBCST := dbisPrecoTabelado
                  else if QProdutos.FieldByName('MOD_ICMS_ST').AsString = 'LISTA NEGATIVA' then
                    modBCST := dbisListaNegativa
                  else if QProdutos.FieldByName('MOD_ICMS_ST').AsString = 'LISTA POSITIVA' then
                    modBCST := dbisListaPositiva
                  else if QProdutos.FieldByName('MOD_ICMS_ST').AsString = 'LISTA NEUTRA' then
                    modBCST := dbisListaNeutra
                  else if QProdutos.FieldByName('MOD_ICMS_ST').AsString = 'MVA' then
                    modBCST := dbisMargemValorAgregado
                  else if QProdutos.FieldByName('MOD_ICMS_ST').AsString = 'PAUTA' then
                    modBCST := dbisPauta
                  else
                    modBCST := dbisMargemValorAgregado;

                  pMVAST   := QItens.FieldByName('MVA').AsFloat;
                  pRedBCST := SimpleRoundTo((QItens.FieldByName('VR_REDUCAO_BC').AsFloat * 100) / (QItens.FieldByName('VR_TOTAL').AsFloat),-2);


                  vBCST    := QItens.FieldByName('BASE_CALC_ST').AsFloat;
                  pICMSST  := QItens.FieldByName('ALIQUOTA_ST').AsFloat;
                  vICMSST  := QItens.FieldByName('VALOR_ICMS_ST').AsFloat;

                  if QItens.FieldByName('VR_BASE_FCPST').AsFloat > 0 then
                     vBCFCPST := QItens.FieldByName('VR_BASE_FCPST').AsFloat ;

                  if QItens.FieldByName('VR_FCPST').AsFloat > 0 then
                    vFCPSt  := QItens.FieldByName('VR_FCPST').AsFloat;

                  if QItens.FieldByName('P_FCPST').AsFloat > 0  Then
                    pFCPST  :=  QItens.FieldByName('P_FCPST').AsFloat;


                end
                else if Copy(QItens.FieldByName('CST').AsString, 2, 2) = '20' then
                begin
                  CST := cst20;

                  if QProdutos.FieldByName('MOD_ICMS').AsString = 'MVA' then
                    modBC  := dbiMargemValorAgregado
                  else if QProdutos.FieldByName('MOD_ICMS').AsString = 'PAUTA' then
                    modBC  := dbiPauta
                  else if QProdutos.FieldByName('MOD_ICMS').AsString = 'PR. TABELADO' then
                    modBC  := dbiPrecoTabelado
                  else if QProdutos.FieldByName('MOD_ICMS').AsString = 'VALOR DA OPERACAO' then
                    modBC  := dbiValorOperacao
                  else
                    modBC  := dbiValorOperacao;


                  pRedBC  := SimpleRoundTo((QItens.FieldByName('VR_REDUCAO_BC').AsFloat * 100) / (QItens.FieldByName('VR_TOTAL').AsFloat),-2);


                  vBC     := QItens.FieldByName('BASE_CALC_ICMS').AsFloat;
                  pICMS   := QItens.FieldByName('ALIQUOTA_ICMS').AsFloat;
                  vICMS   := QItens.FieldByName('VALOR_ICMS').AsFloat;

                  if (QItens.FieldByName('VR_REDUCAO_BC').AsFloat > 0)  then
                      pRedBC := SimpleRoundTo((QItens.FieldByName('VR_REDUCAO_BC').AsFloat * 100) / (QItens.FieldByName('VR_TOTAL').AsFloat),-2)
                  Else
                      pRedBC  := 0;
// alteracao da linha anterior a pedido de comercial bras nao enviar pRedBc percentual e sim valor
// descomentado a linha a pedido da Arilmaq 15/08/13 para enviar percentual e nao valor

                  if QItens.FieldByName('BASE_CALC_ICMS').AsFloat > 0 then
                    vBC := QItens.FieldByName('BASE_CALC_ICMS').AsFloat;

                  if QItens.FieldByName('ALIQUOTA_ICMS').AsFloat > 0 then
                    pICMS := QItens.FieldByName('ALIQUOTA_ICMS').AsFloat;

                  if QItens.FieldByName('VALOR_ICMS').AsFloat > 0 then
                    vICMS := QItens.FieldByName('VALOR_ICMS').AsFloat;
                end
                else if Copy(QItens.FieldByName('CST').AsString, 2, 2) = '30' then
                begin
                  CST := cst30;

                  if QProdutos.FieldByName('MOD_ICMS_ST').AsString = 'PR. TABELADO' then
                    modBCST := dbisPrecoTabelado
                  else if QProdutos.FieldByName('MOD_ICMS_ST').AsString = 'LISTA NEGATIVA' then
                    modBCST := dbisListaNegativa
                  else if QProdutos.FieldByName('MOD_ICMS_ST').AsString = 'LISTA POSITIVA' then
                    modBCST := dbisListaPositiva
                  else if QProdutos.FieldByName('MOD_ICMS_ST').AsString = 'LISTA NEUTRA' then
                    modBCST := dbisListaNeutra
                  else if QProdutos.FieldByName('MOD_ICMS_ST').AsString = 'MVA' then
                    modBCST := dbisMargemValorAgregado
                  else if QProdutos.FieldByName('MOD_ICMS_ST').AsString = 'PAUTA' then
                    modBCST := dbisPauta
                  else
                    modBCST := dbisMargemValorAgregado;

                  pMVAST   := QItens.FieldByName('MVA').AsFloat;


                  pRedBCST := SimpleRoundTo((QItens.FieldByName('VR_REDUCAO_BC').AsFloat * 100) / (QItens.FieldByName('VR_TOTAL').AsFloat),-2);


                  vBCST    := QItens.FieldByName('BASE_CALC_ST').AsFloat;
                  pICMSST  := QItens.FieldByName('ALIQUOTA_ST').AsFloat;
                  vICMSST  := QItens.FieldByName('VALOR_ICMS_ST').AsFloat;

                  if QItens.FieldByName('VR_REDUCAO_BC').AsFloat > 0 then
                    pRedBC := SimpleRoundTo((QItens.FieldByName('VR_REDUCAO_BC').AsFloat * 100) / (QItens.FieldByName('VR_TOTAL').AsFloat),-2);

                  if QItens.FieldByName('BASE_CALC_ICMS').AsFloat > 0 then
                    vBC := QItens.FieldByName('BASE_CALC_ICMS').AsFloat;

                  if QItens.FieldByName('ALIQUOTA_ICMS').AsFloat > 0 then
                    pICMS := QItens.FieldByName('ALIQUOTA_ICMS').AsFloat;

                  if QItens.FieldByName('VALOR_ICMS').AsFloat > 0 then
                    vICMS := QItens.FieldByName('VALOR_ICMS').AsFloat;
                end
                else if (Copy(QItens.FieldByName('CST').AsString, 2, 2) = '40') or (Copy(QItens.FieldByName('CST').AsString, 2, 2) = '41') or (Copy(QItens.FieldByName('CST').AsString, 2, 2) = '50') then
                begin
                  if Copy(QItens.FieldByName('CST').AsString, 2, 2) = '40' then
                    CST := cst40
                  else if Copy(QItens.FieldByName('CST').AsString, 2, 2) = '41' then
                    CST := cst41
                  else if Copy(QItens.FieldByName('CST').AsString, 2, 2) = '50' then
                    CST := cst50;

                  vICMS := QItens.FieldByName('VALOR_ICMS').AsFloat;
                  // motDesICMS :=


                    pRedBC := SimpleRoundTo((QItens.FieldByName('VR_REDUCAO_BC').AsFloat * 100) / (QItens.FieldByName('VR_TOTAL').AsFloat),-2);


                  if QItens.FieldByName('VR_REDUCAO_BC').AsFloat > 0 then

                  if QItens.FieldByName('BASE_CALC_ICMS').AsFloat > 0 then
                    vBC := QItens.FieldByName('BASE_CALC_ICMS').AsFloat;

                  if QItens.FieldByName('ALIQUOTA_ICMS').AsFloat > 0 then
                    pICMS := QItens.FieldByName('ALIQUOTA_ICMS').AsFloat;

                  if QItens.FieldByName('VALOR_ICMS').AsFloat > 0 then
                    vICMS := QItens.FieldByName('VALOR_ICMS').AsFloat;
                end
                else if Copy(QItens.FieldByName('CST').AsString, 2, 2) = '51' then
                begin
                  CST := cst51;

                  if QProdutos.FieldByName('MOD_ICMS').AsString = 'MVA' then
                    modBC  := dbiMargemValorAgregado
                  else if QProdutos.FieldByName('MOD_ICMS').AsString = 'PAUTA' then
                    modBC  := dbiPauta
                  else if QProdutos.FieldByName('MOD_ICMS').AsString = 'PR. TABELADO' then
                    modBC  := dbiPrecoTabelado
                  else if QProdutos.FieldByName('MOD_ICMS').AsString = 'VALOR DA OPERACAO' then
                    modBC  := dbiValorOperacao
                  else
                    modBC  := dbiValorOperacao;


                  pRedBC := SimpleRoundTo((QItens.FieldByName('VR_REDUCAO_BC').AsFloat * 100) / (QItens.FieldByName('VR_TOTAL').AsFloat),-2);

                  vBC    := QItens.FieldByName('BASE_CALC_ICMS').AsFloat;
                  pICMS  := QItens.FieldByName('ALIQUOTA_ICMS').AsFloat;
                  vICMS  := QItens.FieldByName('VALOR_ICMS').AsFloat;

                  if QItens.FieldByName('VR_REDUCAO_BC').AsFloat > 0 then
                    pRedBC := SimpleRoundTo((QItens.FieldByName('VR_REDUCAO_BC').AsFloat * 100) / (QItens.FieldByName('VR_TOTAL').AsFloat),-2);

                  if QItens.FieldByName('BASE_CALC_ICMS').AsFloat > 0 then
                    vBC := QItens.FieldByName('BASE_CALC_ICMS').AsFloat;

                  if QItens.FieldByName('ALIQUOTA_ICMS').AsFloat > 0 then
                    pICMS := QItens.FieldByName('ALIQUOTA_ICMS').AsFloat;

                  if QItens.FieldByName('VALOR_ICMS').AsFloat > 0 then
                    vICMS := QItens.FieldByName('VALOR_ICMS').AsFloat;
                end
                else if Copy(QItens.FieldByName('CST').AsString, 2, 2) = '60' then
                begin
                  CST        := cst60;

                  if QProdutos.FieldByName('COD_ANP').AsInteger > 0  Then
                  Begin
                   CST         := cstRep60;
                   vBCSTRet    := QItens.FieldByName('BASE_CALC_ST').AsFloat;
                   vICMSSTRet  := QItens.FieldByName('VALOR_ICMS_ST').AsFloat;
                   vBCSTDest   := QItens.FieldByName('BASE_CALC_ST').AsFloat;
                   vICMSSTDest := QItens.FieldByName('VALOR_ICMS_ST').AsFloat;
                   pST         := QItens.FieldByName('ALIQUOTA_ST').AsFloat;
                  End;

                  if QItens.FieldByName('VR_REDUCAO_BC').AsFloat > 0 then
                    pRedBC := SimpleRoundTo((QItens.FieldByName('VR_REDUCAO_BC').AsFloat * 100) / (QItens.FieldByName('VR_TOTAL').AsFloat),-2);

                  if QItens.FieldByName('BASE_CALC_ICMS').AsFloat > 0 then
                    vBC := QItens.FieldByName('BASE_CALC_ICMS').AsFloat;

                  if QItens.FieldByName('ALIQUOTA_ICMS').AsFloat > 0 then
                    pICMS := QItens.FieldByName('ALIQUOTA_ICMS').AsFloat;

                  if QItens.FieldByName('VALOR_ICMS').AsFloat > 0 then
                    vICMS := QItens.FieldByName('VALOR_ICMS').AsFloat;
                end
                else if Copy(QItens.FieldByName('CST').AsString, 2, 2) = '70' then
                begin
                  CST := cst70;

                  if QProdutos.FieldByName('MOD_ICMS').AsString = 'MVA' then
                    modBC  := dbiMargemValorAgregado
                  else if QProdutos.FieldByName('MOD_ICMS').AsString = 'PAUTA' then
                    modBC  := dbiPauta
                  else if QProdutos.FieldByName('MOD_ICMS').AsString = 'PR. TABELADO' then
                    modBC  := dbiPrecoTabelado
                  else if QProdutos.FieldByName('MOD_ICMS').AsString = 'VALOR DA OPERACAO' then
                    modBC  := dbiValorOperacao
                  else
                    modBC  := dbiValorOperacao;


                    pRedBC := SimpleRoundTo((QItens.FieldByName('VR_REDUCAO_BC').AsFloat * 100) / (QItens.FieldByName('VR_TOTAL').AsFloat),-2);


// alteracao da linha anterior a pedido de comercial bras nao enviar pRedBc percentual e sim valor
// descomentado a linha a pedido da Arilmaq 15/08/13 para enviar percentual e nao valor


                  vBC    := QItens.FieldByName('BASE_CALC_ICMS').AsFloat;
                  pICMS  := QItens.FieldByName('ALIQUOTA_ICMS').AsFloat;
                  vICMS  := QItens.FieldByName('VALOR_ICMS').AsFloat;

                  if QProdutos.FieldByName('MOD_ICMS_ST').AsString = 'PR. TABELADO' then
                    modBCST := dbisPrecoTabelado
                  else if QProdutos.FieldByName('MOD_ICMS_ST').AsString = 'LISTA NEGATIVA' then
                    modBCST := dbisListaNegativa
                  else if QProdutos.FieldByName('MOD_ICMS_ST').AsString = 'LISTA POSITIVA' then
                    modBCST := dbisListaPositiva
                  else if QProdutos.FieldByName('MOD_ICMS_ST').AsString = 'LISTA NEUTRA' then
                    modBCST := dbisListaNeutra
                  else if QProdutos.FieldByName('MOD_ICMS_ST').AsString = 'MVA' then
                    modBCST := dbisMargemValorAgregado
                  else if QProdutos.FieldByName('MOD_ICMS_ST').AsString = 'PAUTA' then
                    modBCST := dbisPauta
                  else
                    modBCST := dbisMargemValorAgregado;

                  pMVAST   := QItens.FieldByName('MVA').AsFloat;
                  pRedBCST := SimpleRoundTo((QItens.FieldByName('VR_REDUCAO_BC').AsFloat * 100) / (QItens.FieldByName('VR_TOTAL').AsFloat),-2);

                  vBCST    := QItens.FieldByName('BASE_CALC_ST').AsFloat;
                  pICMSST  := QItens.FieldByName('ALIQUOTA_ST').AsFloat;
                  vICMSST  := QItens.FieldByName('VALOR_ICMS_ST').AsFloat;

                  if QItens.FieldByName('VR_REDUCAO_BC').AsFloat > 0 then//
                  pRedBC := SimpleRoundTo((QItens.FieldByName('VR_REDUCAO_BC').AsFloat * 100) / (QItens.FieldByName('VR_TOTAL').AsFloat),-2);

                end
                else if Copy(QItens.FieldByName('CST').AsString, 2, 2) = '90' then
                begin
                  CST := cst90;

                  if QProdutos.FieldByName('MOD_ICMS').AsString = 'MVA' then
                    modBC  := dbiMargemValorAgregado
                  else if QProdutos.FieldByName('MOD_ICMS').AsString = 'PAUTA' then
                    modBC  := dbiPauta
                  else if QProdutos.FieldByName('MOD_ICMS').AsString = 'PR. TABELADO' then
                    modBC  := dbiPrecoTabelado
                  else if QProdutos.FieldByName('MOD_ICMS').AsString = 'VALOR DA OPERACAO' then
                    modBC  := dbiValorOperacao
                  else
                    modBC  := dbiValorOperacao;

                  vBC     := QItens.FieldByName('BASE_CALC_ICMS').AsFloat;
                  pRedBC  := SimpleRoundTo((QItens.FieldByName('VR_REDUCAO_BC').AsFloat * 100) / (QItens.FieldByName('VR_TOTAL').AsFloat),-2);
                  pICMS   := QItens.FieldByName('ALIQUOTA_ICMS').AsFloat;
                  vICMS   := QItens.FieldByName('VALOR_ICMS').AsFloat;

                  if QProdutos.FieldByName('MOD_ICMS_ST').AsString = 'PR. TABELADO' then
                    modBCST := dbisPrecoTabelado
                  else if QProdutos.FieldByName('MOD_ICMS_ST').AsString = 'LISTA NEGATIVA' then
                    modBCST := dbisListaNegativa
                  else if QProdutos.FieldByName('MOD_ICMS_ST').AsString = 'LISTA POSITIVA' then
                    modBCST := dbisListaPositiva
                  else if QProdutos.FieldByName('MOD_ICMS_ST').AsString = 'LISTA NEUTRA' then
                    modBCST := dbisListaNeutra
                  else if QProdutos.FieldByName('MOD_ICMS_ST').AsString = 'MVA' then
                    modBCST := dbisMargemValorAgregado
                  else if QProdutos.FieldByName('MOD_ICMS_ST').AsString = 'PAUTA' then
                    modBCST := dbisPauta
                  else
                    modBCST := dbisMargemValorAgregado;

                  pMVAST   := QItens.FieldByName('MVA').AsFloat;
                  pRedBCST := SimpleRoundTo((QItens.FieldByName('VR_REDUCAO_BC').AsFloat * 100) / (QItens.FieldByName('VR_TOTAL').AsFloat),-2);

                  vBCST    := QItens.FieldByName('BASE_CALC_ST').AsFloat;
                  pICMSST  := QItens.FieldByName('ALIQUOTA_ST').AsFloat;
                  vICMSST  := QItens.FieldByName('VALOR_ICMS_ST').AsFloat;
                end;

                Base_ICMS_ST_Acum := (Base_ICMS_ST_Acum + vBCST);
                Vr_ICMS_ST_Acum   := (vICMSST + Vr_ICMS_ST_Acum);

                if (FrmPrincipal.QEmpresa.FieldByName('CRT').AsString <> '1 - SIMPLES NACIONAL')   Then
                Begin
                  Base_ICMS_Normal_Acum := (Base_ICMS_Normal_Acum + vBC);
                  Vr_ICMS_Normal_Acum   := (vICMS + Vr_ICMS_Normal_Acum);
                End;

              End;


              if (QItens.FieldByName('VR_IPI').AsFloat > 0) then
              begin

                // IPI.clEnq    :=
                // IPI.CNPJProd :=
                // IPI.cSelo    :=
                // IPI.qSelo    :=
                // IPI.cEnq     :=

                if QItens.FieldByName('CST_IPI').AsString = '00' then
                  IPI.CST := ipi00
                else if QItens.FieldByName('CST_IPI').AsString = '01' then
                  IPI.CST := ipi01
                else if QItens.FieldByName('CST_IPI').AsString = '02' then
                  IPI.CST := ipi02
                else if QItens.FieldByName('CST_IPI').AsString = '03' then
                  IPI.CST := ipi03
                else if QItens.FieldByName('CST_IPI').AsString = '04' then
                  IPI.CST := ipi04
                else if QItens.FieldByName('CST_IPI').AsString = '05' then
                  IPI.CST := ipi05
                else if QItens.FieldByName('CST_IPI').AsString = '49' then
                  IPI.CST := ipi49
                else if QItens.FieldByName('CST_IPI').AsString = '50' then
                  IPI.CST := ipi50
                else if QItens.FieldByName('CST_IPI').AsString = '51' then
                  IPI.CST := ipi51
                else if QItens.FieldByName('CST_IPI').AsString = '52' then
                  IPI.CST := ipi52
                else if QItens.FieldByName('CST_IPI').AsString = '53' then
                  IPI.CST := ipi53
                else if QItens.FieldByName('CST_IPI').AsString = '54' then
                  IPI.CST := ipi54
                else if QItens.FieldByName('CST_IPI').AsString = '55' then
                  IPI.CST := ipi55
                else if QItens.FieldByName('CST_IPI').AsString = '99' then
                  IPI.CST := ipi99;

              end;


            end;


            if (FrmPrincipal.QEmpresa.FieldByName('CRT').AsString <> '1 - SIMPLES NACIONAL')   Then
            Begin
              if QProdutos.FieldByName('ALIQUOTA_ICMS').AsFloat = 0 Then
              Begin
                if (Prod.CFOP = '5102') Then
                Begin
                   if Copy(QProdutos.FieldByName('TRIBUTACAO').AsString, 1, 2) = '20' then
                      Imposto.ICMS.CST := cst20
                   else if Copy(QProdutos.FieldByName('TRIBUTACAO').AsString, 1, 2) = '30' then
                      Imposto.ICMS.CST  := cst30
                   else if Copy(QProdutos.FieldByName('TRIBUTACAO').AsString, 1, 2) = '40' then
                      Imposto.ICMS.CST := cst40
                    else if Copy(QProdutos.FieldByName('TRIBUTACAO').AsString, 1, 2) = '41' then
                      Imposto.ICMS.CST  := cst41
                    else if Copy(QProdutos.FieldByName('TRIBUTACAO').AsString, 1, 2) = '50' then
                      Imposto.ICMS.CST  := cst50;

                     //showmessage(FloatToSTr(((Preco_Venda - Desconto_Item) * Quantidade_Item)));

                 if (Imposto.ICMS.CST = cst20) or (Imposto.ICMS.CST = cst30) or
                    (Imposto.ICMS.CST = cst40) or (Imposto.ICMS.CST = cst41) or
                    (Imposto.ICMS.CST = cst50) then
                  Begin

                    Imposto.ICMS.vBC   := 0; //((Preco_Venda - Desconto_Item) * Quantidade_Item); //RoundABNT((ItemCupom.Qtd * ItemCupom.ValorUnit) + ItemCupom.DescAcres, 2);
                    Imposto.ICMS.vICMSDeson := Roundto((QItens.FieldByName('VR_TOTAL').AsFloat  + (QItens.FieldByName('VR_DESCONTO').AsFloat * QItens.FieldByName('QUANTIDADE').AsFloat )),-2); //RoundABNT((ItemCupom.Qtd * ItemCupom.ValorUnit) + ItemCupom.DescAcres, 2);
                    Imposto.ICMS.motDesICMS := mdiOutros;
                    vr_Desonerado           := Roundto(Vr_Desonerado + Imposto.ICMS.vICMSDeson,-2)


                  End;


                End
                Else
                Begin
                    Imposto.ICMS.CST := cst60;
                    Imposto.ICMS.vBC := 0;
                End;
              End;

               With  Imposto do
               Begin

                if QProdutos.FieldByName('CST_PIS').AsString = '01' then
                  PIS.CST := pis01
                else if QProdutos.FieldByName('CST_PIS').AsString = '02' then
                  PIS.CST := pis02
                else if QProdutos.FieldByName('CST_PIS').AsString = '03' then
                  PIS.CST := pis03
                else if QProdutos.FieldByName('CST_PIS').AsString = '04' then
                  PIS.CST := pis04
                else if QProdutos.FieldByName('CST_PIS').AsString = '05' then
                  PIS.CST := pis05
                else if QProdutos.FieldByName('CST_PIS').AsString = '06' then
                  PIS.CST := pis06
                else if QProdutos.FieldByName('CST_PIS').AsString = '07' then
                  PIS.CST := pis07
                else if QProdutos.FieldByName('CST_PIS').AsString = '08' then
                  PIS.CST := pis08
                else if QProdutos.FieldByName('CST_PIS').AsString = '09' then
                  PIS.CST := pis09
                else if QProdutos.FieldByName('CST_PIS').AsString = '49' then
                  PIS.CST := pis49
                else if QProdutos.FieldByName('CST_PIS').AsString = '50' then
                  PIS.CST := pis50
                else if QProdutos.FieldByName('CST_PIS').AsString = '51' then
                  PIS.CST := pis51
                else if QProdutos.FieldByName('CST_PIS').AsString = '52' then
                  PIS.CST := pis52
                else if QProdutos.FieldByName('CST_PIS').AsString = '53' then
                  PIS.CST := pis53
                else if QProdutos.FieldByName('CST_PIS').AsString = '54' then
                  PIS.CST := pis54
                else if QProdutos.FieldByName('CST_PIS').AsString = '55' then
                  PIS.CST := pis55
                else if QProdutos.FieldByName('CST_PIS').AsString = '56' then
                  PIS.CST := pis56
                else if QProdutos.FieldByName('CST_PIS').AsString = '60' then
                  PIS.CST := pis60
                else if QProdutos.FieldByName('CST_PIS').AsString = '61' then
                  PIS.CST := pis61
                else if QProdutos.FieldByName('CST_PIS').AsString = '62' then
                  PIS.CST := pis62
                else if QProdutos.FieldByName('CST_PIS').AsString = '63' then
                  PIS.CST := pis63
                else if QProdutos.FieldByName('CST_PIS').AsString = '64' then
                  PIS.CST := pis64
                else if QProdutos.FieldByName('CST_PIS').AsString = '65' then
                  PIS.CST := pis65
                else if QProdutos.FieldByName('CST_PIS').AsString = '66' then
                  PIS.CST := pis66
                else if QProdutos.FieldByName('CST_PIS').AsString = '67' then
                  PIS.CST := pis67
                else if QProdutos.FieldByName('CST_PIS').AsString = '70' then
                  PIS.CST := pis70
                else if QProdutos.FieldByName('CST_PIS').AsString = '71' then
                  PIS.CST := pis71
                else if QProdutos.FieldByName('CST_PIS').AsString = '72' then
                  PIS.CST := pis72
                else if QProdutos.FieldByName('CST_PIS').AsString = '73' then
                  PIS.CST := pis73
                else if QProdutos.FieldByName('CST_PIS').AsString = '74' then
                  PIS.CST := pis74
                else if QProdutos.FieldByName('CST_PIS').AsString = '75' then
                  PIS.CST := pis75
                else if QProdutos.FieldByName('CST_PIS').AsString = '98' then
                  PIS.CST := pis98
                else if QProdutos.FieldByName('CST_PIS').AsString = '99' then
                  PIS.CST := pis99;

                if (QProdutos.FieldByName('CST_PIS').AsString = '01')   Then
                Begin
                PIS.vBC       := RoundTo(((QItens.FieldByName('VR_TOTAL').AsFloat   * QItens.FieldByName('QUANTIDADE').AsFloat  ) - QItens.FieldByName('VR_DESCONTO').AsFloat ),2);;
                PIS.pPis      := QProdutos.FieldByName('PIS').AsFloat;
                PIS.vPIS      := RoundTo((PIS.vBC  * PIS.pPis) /100 , 2);
                PIS.qBCProd   := PIS.vBC ;
                PIS.vAliqProd := PIS.pPis ;
                PIS.qBCProd   := 0;
                vr_pis_acum :=  vr_pis_acum + PIS.vPIS
                End;

                if QProdutos.FieldByName('CST_COFINS').AsString = '01' then
                  COFINS.CST := cof01
                else if QProdutos.FieldByName('CST_COFINS').AsString = '02' then
                  COFINS.CST := cof02
                else if QProdutos.FieldByName('CST_COFINS').AsString = '03' then
                  COFINS.CST := cof03
                else if QProdutos.FieldByName('CST_COFINS').AsString = '04' then
                  COFINS.CST := cof04
                else if QProdutos.FieldByName('CST_COFINS').AsString = '05' then
                  COFINS.CST := cof05
                else if QProdutos.FieldByName('CST_COFINS').AsString = '06' then
                  COFINS.CST := cof06
                else if QProdutos.FieldByName('CST_COFINS').AsString = '07' then
                  COFINS.CST := cof07
                else if QProdutos.FieldByName('CST_COFINS').AsString = '08' then
                  COFINS.CST := cof08
                else if QProdutos.FieldByName('CST_COFINS').AsString = '09' then
                  COFINS.CST := cof09
                else if QProdutos.FieldByName('CST_COFINS').AsString = '49' then
                  COFINS.CST := cof49
                else if QProdutos.FieldByName('CST_COFINS').AsString = '50' then
                  COFINS.CST := cof50
                else if QProdutos.FieldByName('CST_COFINS').AsString = '51' then
                  COFINS.CST := cof51
                else if QProdutos.FieldByName('CST_COFINS').AsString = '52' then
                  COFINS.CST := cof52
                else if QProdutos.FieldByName('CST_COFINS').AsString = '53' then
                  COFINS.CST := cof53
                else if QProdutos.FieldByName('CST_COFINS').AsString = '54' then
                  COFINS.CST := cof54
                else if QProdutos.FieldByName('CST_COFINS').AsString = '55' then
                  COFINS.CST := cof55
                else if QProdutos.FieldByName('CST_COFINS').AsString = '56' then
                  COFINS.CST := cof56
                else if QProdutos.FieldByName('CST_COFINS').AsString = '60' then
                  COFINS.CST := cof60
                else if QProdutos.FieldByName('CST_COFINS').AsString = '61' then
                  COFINS.CST := cof61
                else if QProdutos.FieldByName('CST_COFINS').AsString = '62' then
                  COFINS.CST := cof62
                else if QProdutos.FieldByName('CST_COFINS').AsString = '63' then
                  COFINS.CST := cof63
                else if QProdutos.FieldByName('CST_COFINS').AsString = '64' then
                  COFINS.CST := cof64
                else if QProdutos.FieldByName('CST_COFINS').AsString = '65' then
                  COFINS.CST := cof65
                else if QProdutos.FieldByName('CST_COFINS').AsString = '66' then
                  COFINS.CST := cof66
                else if QProdutos.FieldByName('CST_COFINS').AsString = '67' then
                  COFINS.CST := cof67
                else if QProdutos.FieldByName('CST_COFINS').AsString = '70' then
                  COFINS.CST := cof70
                else if QProdutos.FieldByName('CST_COFINS').AsString = '71' then
                  COFINS.CST := cof71
                else if QProdutos.FieldByName('CST_COFINS').AsString = '72' then
                  COFINS.CST := cof72
                else if QProdutos.FieldByName('CST_COFINS').AsString = '73' then
                  COFINS.CST := cof73
                else if QProdutos.FieldByName('CST_COFINS').AsString = '74' then
                  COFINS.CST := cof74
                else if QProdutos.FieldByName('CST_COFINS').AsString = '75' then
                  COFINS.CST := cof75
                else if QProdutos.FieldByName('CST_COFINS').AsString = '98' then
                  COFINS.CST := cof98
                else if QProdutos.FieldByName('CST_COFINS').AsString = '99' then
                  COFINS.CST := cof99;

                if (QProdutos.FieldByName('CST_COFINS').AsString = '01')   Then
                Begin
                COFINS.vBC       := RoundTo(((QItens.FieldByName('VR_TOTAL').AsFloat   * QItens.FieldByName('QUANTIDADE').AsFloat  ) - QItens.FieldByName('VR_DESCONTO').AsFloat ),2);;
                COFINS.pCofins   := QProdutos.FieldByName('COFINS').AsFloat;
                COFINS.vCOFINS   := RoundTo((COFINS.vBC  * COFINS.pCofins) /100,2);
                COFINS.qBCProd   := COFINS.pCOFINS;
                COFINS.vAliqProd := Cofins.qBCProd;
                COFINS.qBCProd   := 0;
                vr_cofins_acum :=  vr_cofins_acum + Cofins.vcofins;
                End;

               End;

            End;

          end;

          Application.ProcessMessages;
          QItens.Next;
        end;
      End;

      with ACBrNFe1.NotasFiscais.Items[0].NFe.Total.ICMSTot do
      Begin
       vICMSDeson := Vr_Desonerado;
       vBC        := Base_ICMS_Normal_Acum;
       vICMS      := Vr_ICMS_Normal_Acum;
       vBCST      := Base_ICMS_ST_Acum;
       vST        := Vr_ICMS_ST_Acum;
       vCOFINS    := Vr_Cofins_Acum;
       vPis       := Vr_Pis_Acum;
      End;

      ACBrNFe1.NotasFiscais.GerarNFe;
      ACBrNFe1.NotasFiscais.Assinar;
      ACBrNFe1.NotasFiscais.Validar;

      if  AcbrNfe1.Enviar(1,False,True,False) Then
      Begin

       if AcbrNfe1.WebServices.Enviar.cStat <> 100 then
       begin

       QUpdate.SQL.Clear;
       QUpdate.SQL.Text :='UPDATE COMPL_NFCEFISCAL SET TRANSMISSAO = :TRANSMISSAO, PATHNFCE_SERVIDOR = :PROTOCOLO WHERE TRANSACAO_ID = :TRANSACAO_ID';
       QUpdate.ParamByName('TRANSMISSAO').AsString   := 'ERRO';
       QUpdate.ParamByName('TRANSACAO_ID').AsInteger := QNfce_Recebidas.FieldByName('TRANSACAO_ID').AsInteger;
       QUpdate.ParamByName('PROTOCOLO').AsString     := AcbrNfe1.WebServices.Enviar.xMotivo;
       QUpdate.Prepare;
       QUpdate.ExecSQL;

       End
       Else
       Begin

       ACBrNFe1.WebServices.Consulta.NFeChave := ACBrNFe1.NotasFiscais.Items[0].NumID;
       ACBrNFe1.WebServices.Consulta.Executar;

       QUpdate.SQL.Clear;
       QUpdate.SQL.Text :='UPDATE COMPL_NFCEFISCAL SET TRANSMISSAO = :TRANSMISSAO, PROTOCOLO = :PROTOCOLO, ARQUIVO_XML = :ARQUIVO_XML WHERE TRANSACAO_ID = :TRANSACAO_ID';
       QUpdate.ParamByName('TRANSMISSAO').AsString   := 'SIM';
       QUpdate.ParamByName('TRANSACAO_ID').AsInteger := QNfce_Recebidas.FieldByName('TRANSACAO_ID').AsInteger;
       QUpdate.ParamByName('PROTOCOLO').AsString     := ACBrNFe1.WebServices.Consulta.Protocolo;
       QUpdate.ParamByName('ARQUIVO_XML').AsByteStr  := ACBrNFe1.NotasFiscais[0].XML;

       QUpdate.Prepare;
       QUpdate.ExecSQL;

        //CopyFile(PChar(pathlocal+ Copy(FrmPrincipal.ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID, 4, 44) +'-nfe.xml'),
        //PChar(pathservidor_env + Copy(FrmPrincipal.ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID, 4, 44) +'-nfe.xml'),True);

        //CopyFile(PChar(pathlocal + Copy(FrmPrincipal.ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID, 4, 44) +'-nfe.xml'),
        //Pchar(ExtractFilePath(ParamStr(0)) + 'NFce\ENVIADAS\' + Copy(FrmPrincipal.ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID, 4, 44) + '-nfe.xml') ,True);

       End;

      End;

     except
       //Application.MessageBox('Site da Sefaz nao responde ou sem conexão com internet.'+ #13'Favor verificar!', PChar(Msg_Title), mb_IconInformation);



        on e:Exception do
        begin
         if Chk_exibir.checked then
         Begin

            Application.MessageBox(PChar('Erro ao enviar Nfce:' + #13 +
              'Erro: ' + e.Message), 'Erro', MB_ICONSTOP + MB_TASKMODAL);

          end;

        End;

       {

       FrmControle_Nfce.QUpdate.SQL.Clear;
       FrmControle_Nfce.QUpdate.SQL.Text :='UPDATE COMPL_NFCEFISCAL SET TRANSMISSAO = :TRANSMISSAO, PATHNFCE_SERVIDOR = :PROTOCOLO WHERE TRANSACAO_ID = :TRANSACAO_ID';
       FrmControle_Nfce.QUpdate.ParamByName('TRANSMISSAO').AsString   := 'NAO';
       FrmControle_Nfce.QUpdate.ParamByName('TRANSACAO_ID').AsInteger := FrmControle_Nfce.QNfce_Recebidas.FieldByName('TRANSACAO_ID').AsInteger;
       FrmControle_Nfce.QUpdate.ParamByName('PROTOCOLO').AsString     := FrmControle_Nfce.AcbrNfe1.WebServices.Enviar.xMotivo;

       FrmControle_Nfce.QUpdate.Prepare;
       FrmControle_Nfce.QUpdate.ExecSQL;

       }


     end;

     QNfce_Recebidas.next;
    End;
  End;

   QNfce_Recebidas.Close;
   QNfce_Recebidas.Prepare;
   QNfce_Recebidas.Open();

   QNfce_Enviadas.Close;
   QNfce_Enviadas.Prepare;
   QNfce_Enviadas.Open();

   QNfce_Erro.Close;
   QNfce_Erro.Prepare;
   QNfce_Erro.Open();

End;

function LeIni(Arq, Secao, Item: String): String;
var
IniConf: TIniFile;
begin
  IniConf := TIniFile.Create(Arq);
  Result := IniConf.ReadString(Secao, Item, '');
  IniConf.Free;
end;

procedure GravaIni(Arq, Secao, Item, Vl: String);
var
IniConf: TIniFile;
begin
  IniConf := TIniFile.Create(Arq);
  IniConf.WriteString(Secao, Item, Vl);
  IniConf.Free;
end;

function SerialNum(FDrive: String): String;
var
Serial: DWord;
DirLen, Flags: DWord;
DLabel: array [0..11] of char;
begin
  try
    GetVolumeInformation(PChar(FDrive + ':\'), dLabel, 12, @Serial, DirLen, Flags, nil, 0);
    Result := IntToHex(Serial, 8);
  except
    Result := '';
  end;
end;

function EncryptMsg(Msg1: String; EncryptNo: Integer): String;
var
ResultStr: String;
Temp: Char;
I, EncryptIndex: Integer;
begin
  ResultStr := '';
  Temp      := ' ';

  for I := 1 to length(Msg1) do
  begin
    for EncryptIndex := 1 to EncryptNo do
    begin
      Temp    := Succ(Msg1[I]);
      Msg1[I] := Temp;
    end;

    ResultStr := ResultStr + Temp;
  end;

  EncryptMsg := ResultStr;
end;

function DecryptMsg(Msg1: String; DecryptNo: Integer): String;
var
ResultStr: String;
Temp: Char;
I, DecryptIndex: Integer;
begin
  ResultStr := '';
  Temp      := ' ';

  for I := 1 to length(Msg1) do
  begin
    for DecryptIndex := 1 to DecryptNo do
    begin
      Temp    := Pred(Msg1[I]);
      Msg1[I] := Temp;
    end;

    ResultStr := ResultStr + Temp;
  end;

  DecryptMsg := ResultStr;
end;




procedure TFrmControle_Nfce.TrataErros(Sender: TObject; E: Exception);
begin
   Msg_If.Caption := StringReplace(E.Message, sLineBreak, ' ', [rfReplaceAll]);
  // if not Reducao then
  // Application.MessageBox(Pchar('ATENÇÃO FAVOR INFORMAR ERRO AO SUPORTE EFICAZ,' + #13 + 'A GRAVAÇÃO DA VENDA OU PROCECIMENTO ESTA COMPROMETIDO!!' + #13 + 'ERRO: ' + StringReplace(E.Message, sLineBreak, ' ', [rfReplaceAll])),'PdvEficaz', MB_IconStop + MB_OK);
  //pMensagem.visible := False;

end;


procedure TFrmControle_Nfce.ACBrNFe1StatusChange(Sender: TObject);
begin
case FrmPrincipal.ACBrNFe1.Status of
    stIdle:
    begin
      if (FrmStatus <> nil) then
        FrmStatus.Hide;
    end;

    stNFeStatusServico:
    begin
      if (FrmStatus = nil) then
        FrmStatus := TFrmStatus.Create(Application);

      FrmStatus.lbl1.caption := 'Status da Nfc-e';
      FrmStatus.lblStatus.Caption := 'Verificando Status do servico...';
      FrmStatus.Show;
      FrmStatus.BringToFront;
    end;

    stNFeRecepcao:
    begin
      if (FrmStatus = nil) then
        FrmStatus := TFrmStatus.Create(Application);

      FrmStatus.lbl1.caption := 'Status da Nfc-e';
      FrmStatus.lblStatus.Caption := 'Enviando dados da NFc-e...';
      FrmStatus.Show;
      FrmStatus.BringToFront;
    end;

    stNfeRetRecepcao:
    begin
      if (FrmStatus = nil) then
        FrmStatus := TFrmStatus.Create(Application);

      FrmStatus.lbl1.caption := 'Status da Nfc-e';
      FrmStatus.lblStatus.Caption := 'Recebendo dados da NFc-e...';
      FrmStatus.Show;
      FrmStatus.BringToFront;
    end;

    stNfeConsulta:
    begin
      if (FrmStatus = nil) then
        FrmStatus := TFrmStatus.Create(Application);

      FrmStatus.lbl1.caption := 'Status da Nfc-e';
      FrmStatus.lblStatus.Caption := 'Consultando NFc-e...';
      FrmStatus.Show;
      FrmStatus.BringToFront;
    end;

    stNfeCancelamento:
    begin
      if (FrmStatus = nil) then
        FrmStatus := TFrmStatus.Create(Application);

      FrmStatus.lbl1.caption := 'Status da Nfc-e';
      FrmStatus.lblStatus.Caption := 'Enviando cancelamento de NFc-e...';
      FrmStatus.Show;
      FrmStatus.BringToFront;
    end;

    stNfeInutilizacao:
    begin
      if (FrmStatus = nil) then
        FrmStatus := TFrmStatus.Create(Application);

      FrmStatus.lbl1.caption := 'Status da Nfc-e';
      FrmStatus.lblStatus.Caption := 'Enviando pedido de Inutilização...';
      FrmStatus.Show;
      FrmStatus.BringToFront;
    end;

    stNFeRecibo:
    begin
      if (FrmStatus = nil) then
        FrmStatus := TFrmStatus.Create(Application);

      FrmStatus.lbl1.caption := 'Status da Nfc-e';
      FrmStatus.lblStatus.Caption := 'Consultando Recibo de Lote...';
      FrmStatus.Show;
      FrmStatus.BringToFront;
    end;

    stNFeCadastro:
    begin
      if (FrmStatus = nil) then
        FrmStatus := TFrmStatus.Create(Application);

      FrmStatus.lbl1.caption := 'Status da Nfc-e';
      FrmStatus.lblStatus.Caption := 'Consultando Cadastro...';
      FrmStatus.Show;
      FrmStatus.BringToFront;
    end;

   { stNFeEnvDPEC:
    begin
      if (FrmStatus = nil) then
        FrmStatus := TFrmStatus.Create(Application);

      FrmStatus.lblStatus.Caption := 'Enviando DPEC...';
      FrmStatus.Show;
      FrmStatus.BringToFront;
    end;

    stNFeConsultaDPEC:
    begin
      if (FrmStatus = nil) then
        FrmStatus := TFrmStatus.Create(Application);

      FrmStatus.lblStatus.Caption := 'Consultando DPEC...';
      FrmStatus.Show;
      FrmStatus.BringToFront;
    end; }

    stNFeEmail:
    begin
      if (FrmStatus = nil) then
        FrmStatus := TFrmStatus.Create(Application);

      FrmStatus.lbl1.caption := 'Status da Nfe';
      FrmStatus.lblStatus.Caption := 'Enviando Email...';
      FrmStatus.Show;
      FrmStatus.BringToFront;
    end;


    stNFeEvento:
    begin
      if (FrmStatus = nil) then
        FrmStatus := TFrmStatus.Create(Application);

      FrmStatus.lbl1.caption := 'Status da Nfe';
      FrmStatus.lblStatus.Caption := 'Enviando dados do Evento NFe...';
      FrmStatus.Show;
      FrmStatus.BringToFront;
    end;

  end;

  Application.ProcessMessages;

end;

procedure TFrmControle_Nfce.BitBtn10Click(Sender: TObject);
begin

ACBrNFe1.NotasFiscais.Clear;
ACBrNFe1.NotasFiscais.LoadFromString(QNfce_Recebidas.FieldByName('ARQUIVO_XML').AsString);
ACBrNFe1.DANFE := FrmPrincipal.ACBrNFeDANFCeFortes1;
ACBrNFe1.NotasFiscais.Imprimir;

end;

procedure TFrmControle_Nfce.BitBtn11Click(Sender: TObject);
begin

   Fdac_Temp.First;
   Monitor.Clear;
   while not Fdac_Temp.Eof do
   Begin
    try
    QSearch.SQL.Clear;
    QSearch.SQL.Add('SELECT * FROM LICENCA_IF WHERE NUM_ECF = :NUM_ECF AND STATUS = :STATUS');
    QSearch.ParamByName('NUM_ECF').AsString := Fdac_Temp.FieldByName('ECF').AsString;
    QSearch.ParamByName('STATUS').AsString  :=  'A';
    QSearch.Prepare;
    QSearch.Open();


      IF not QSearch.IsEmpty Then
      Begin

        Eficaz_Pdv.Free;
        Eficaz_Pdv := TFDConnection.Create(nil);

        Eficaz_Pdv.Params.Clear;
        Eficaz_Pdv.Params.Add('Database= ' + QSearch.FieldByName('BANCO').AsString );
        Eficaz_Pdv.Params.Add('User_Name= ' + QSearch.FieldByName('USUARIO').AsString );
        Eficaz_Pdv.Params.Add('Password='+ QSearch.FieldByName('SENHA').AsString );
        Eficaz_Pdv.Params.Add('Server= ' +  QSearch.FieldByName('IP').AsString );
        Eficaz_Pdv.Params.Add('Port= ' + QSearch.FieldByName('PORTA').AsString);
        Eficaz_Pdv.Params.Add('DriverID=PG');
        Eficaz_Pdv.Params.Add('MonitorBy=Remote');
        Eficaz_Pdv.Connected:=True;
        Eficaz_Pdv.Open();


        QSearchPdv.Connection := Eficaz_Pdv;

        QSearchPdv.SQL.Text := 'SELECT * FROM  COMPL_NFCEFISCAL WHERE TRANSACAO_ID = :TRANSACAO_ID';
        QSearchPdv.ParamByName('TRANSACAO_ID').AsInteger := Fdac_Temp.FieldByName('TRANSACAO_ORIGEM').AsInteger;
        QSearchPdv.Prepare;
        QSearchPdv.Open();

       if not QSearchPdv.IsEmpty then
       begin
         QInsert.SQL.Text := 'INSERT INTO COMPL_NFCEFISCAL(TRANSACAO_ID,' +
                        'DT_SAIDA, HR_SAIDA , RECIBO, PROTOCOLO, CHAVE_NFCE, ' +
                        'EMPRESA_ID, ECF, TRANSMISSAO,  PATHNFCE_SERVIDOR, PATHNFCE_LOCAL, DT_EMISSAO, DT_TRANSMISSAO, VALOR,NO_DOC_FISCAL,COND_PAGTO,ARQUIVO_XML )VALUES(' +
                        ':TRANSACAO_ID, :DT_SAIDA, :HR_SAIDA, :RECIBO, :PROTOCOLO, :CHAVE_NFCE, :EMPRESA_ID, :ECF, :TRANSMISSAO, ' +
                        ':PATHNFCE_SERVIDOR,         :PATHNFCE_LOCAL,      :DT_EMISSAO, :DT_TRANSMISSAO, :VALOR,:NO_DOC_FISCAL,:COND_PAGTO,:ARQUIVO_XML)';

        QInsert.ParamByName('DT_SAIDA').AsDateTime        := QSearchPdv.FieldByName('DT_SAIDA').AsDateTime;
        QInsert.ParamByName('HR_SAIDA').AsString          := QSearchPdv.FieldByName('HR_SAIDA').AsString;
        QInsert.ParamByName('RECIBO').AsString            := QSearchPdv.FieldByName('RECIBO').AsString;
        QInsert.ParamByName('PROTOCOLO').AsString         := QSearchPdv.FieldByName('PROTOCOLO').AsString;
        QInsert.ParamByName('CHAVE_NFCE').AsString        := QSearchPdv.FieldByName('CHAVE_NFCE').AsString;
        QInsert.ParamByName('EMPRESA_ID').AsInteger       := QSearchPdv.FieldByName('EMPRESA_ID').AsInteger;
        QInsert.ParamByName('ECF').AsString               := QSearchPdv.FieldByName('ECF').AsString;
        QInsert.ParamByName('TRANSMISSAO').AsString       := QSearchPdv.FieldByName('TRANSMISSAO').AsString;
        QInsert.ParamByName('PATHNFCE_SERVIDOR').AsString := QSearchPdv.FieldByName('PATHNFCE_SERVIDOR').AsString;
        QInsert.ParamByName('PATHNFCE_LOCAL').AsString    := QSearchPdv.FieldByName('PATHNFCE_LOCAL').AsString;
        QInsert.ParamByName('DT_EMISSAO').AsDateTime      := QSearchPdv.FieldByName('DT_EMISSAO').AsDateTime;
        QInsert.ParamByName('DT_TRANSMISSAO').AsDateTime  := QSearchPdv.FieldByName('DT_TRANSMISSAO').AsDateTime;
        QInsert.ParamByName('VALOR').AsFloat              := QSearchPdv.FieldByName('VALOR').AsFloat;
        QInsert.ParamByName('NO_DOC_FISCAL').AsInteger    := QSearchPdv.FieldByName('NO_DOC_FISCAL').AsInteger;
        QInsert.ParamByName('COND_PAGTO').AsString        := QSearchPdv.FieldByName('COND_PAGTO').AsString;
        QInsert.ParamByName('ARQUIVO_XML').AsByteStr      := QSearchPdv.FieldByName('ARQUIVO_XML').AsString;
        QInsert.ParamByName('TRANSACAO_ID').AsInteger     := Fdac_Temp.FieldByName('TRANSACAO_ID').AsInteger;

        QInsert.Prepare;
        QInsert.ExecSQL;

        Monitor.SelAttributes.Color := clGreen;
        Monitor.Lines.Add('Pdv' + Fdac_Temp.FieldByName('ECF').AsString + ' Transação: '+ Fdac_Temp.FieldByName('TRANSACAO_ID').AsString + ' - Corrigido' );

        Application.ProcessMessages;

       end;

        QSearchPdv.SQL.Text := 'SELECT * FROM  NOTAS_CANCELADAS_NFCE WHERE TRANSACAO_ID = :TRANSACAO_ID';
        QSearchPdv.ParamByName('TRANSACAO_ID').AsInteger := Fdac_Temp.FieldByName('TRANSACAO_ORIGEM').AsInteger;
        QSearchPdv.Prepare;
        QSearchPdv.Open();

       if not QSearchPdv.IsEmpty then
       begin

        QInsert.Sql.Clear;
        QInsert.Sql.Add('INSERT INTO NOTAS_CANCELADAS_NFCE(TRANSACAO_ID, EMPRESA_ID, NO_DOC_FISCAL, DT_SAIDA, HR_SAIDA,  ' +
                        'RECIBO, PROTOCOLO, VALOR, CHAVE_NFCE,ECF,EXPORTADO,ARQUIVO_XML)VALUES(');
        QInsert.Sql.Add(':TRANSACAO_ID, :EMPRESA_ID, :NO_DOC_FISCAL, :DT_SAIDA, :HR_SAIDA, ' +
                        ':RECIBO, :PROTOCOLO, :VALOR, :CHAVE_NFCE,:ECF,0,:ARQUIVO_XML)');


         QInsert.ParamByName('DT_SAIDA').AsDateTime        := QSearchPdv.FieldByName('DT_SAIDA').AsDateTime;
         QInsert.ParamByName('HR_SAIDA').AsString          := QSearchPdv.FieldByName('HR_SAIDA').AsString;
         QInsert.ParamByName('RECIBO').AsString            := QSearchPdv.FieldByName('RECIBO').AsString;
         QInsert.ParamByName('PROTOCOLO').AsString         := QSearchPdv.FieldByName('PROTOCOLO').AsString;
         QInsert.ParamByName('CHAVE_NFCE').AsString        := QSearchPdv.FieldByName('CHAVE_NFCE').AsString;
         QInsert.ParamByName('EMPRESA_ID').AsInteger       := QSearchPdv.FieldByName('EMPRESA_ID').AsInteger;
         QInsert.ParamByName('ECF').AsString               := QSearchPdv.FieldByName('ECF').AsString;
         QInsert.ParamByName('VALOR').AsFloat              := QSearchPdv.FieldByName('VALOR').AsFloat;
         QInsert.ParamByName('NO_DOC_FISCAL').AsInteger    := QSearchPdv.FieldByName('NO_DOC_FISCAL').AsInteger;
         QInsert.ParamByName('ARQUIVO_XML').AsByteStr      := QSearchPdv.FieldByName('ARQUIVO_XML').AsString;
         QInsert.ParamByName('TRANSACAO_ID').AsInteger     := Fdac_Temp.FieldByName('TRANSACAO_ID').AsInteger;

        QInsert.Prepare;
        QInsert.ExecSQL;

        Monitor.SelAttributes.Color := clGreen;
        Monitor.Lines.Add('Pdv' + Fdac_Temp.FieldByName('ECF').AsString + ' Transação: '+ Fdac_Temp.FieldByName('TRANSACAO_ID').AsString + ' - Corrigido' );

        Application.ProcessMessages;

       end;


      end;
    Except

    on e:Exception do
          begin
            Application.MessageBox(PChar('Erro !' + #13 +
              'Erro: ' + e.Message), 'Erro', MB_ICONSTOP + MB_TASKMODAL);
          end;



    end;
    Fdac_Temp.Next;
   End;

    BtnAtualizarClick(SELF);


end;

procedure TFrmControle_Nfce.BitBtn1Click(Sender: TObject);
begin
//EnviarNfces;
QNfce_Recebidas.Close;
QNfce_Recebidas.Params[0].AsDate := Date;
QNfce_Recebidas.Params[1].AsDate := Dtmen.Date;
QNfce_Recebidas.Prepare;
QNfce_Recebidas.Open();

  if not QNfce_Recebidas.isempty Then
  Begin
    while not QNfce_Recebidas.eof do
    Begin

      if QNfce_Recebidas.FieldByName('ARQUIVO_XML').AsString = '' then
      Begin
      OpenDialog1.Title      := 'Selecione a NFcE';
      OpenDialog1.DefaultExt := '*-nfe.XML';
      OpenDialog1.Filter     := 'Arquivos NFE (*-nfe.XML)|*-nfe.XML|Arquivos XML (*.XML)|*.XML|Todos os Arquivos (*.*)|*.*';
      OpenDialog1.InitialDir := ACBrNFe1.Configuracoes.Arquivos.GetPathNFe;

      ACBrNFe1.NotasFiscais.Clear;
      ACBrNFe1.NotasFiscais.LoadFromFile(OpenDialog1.FileName);

      End
      Else
      Begin
      ACBrNFe1.NotasFiscais.Clear;
      ACBrNFe1.NotasFiscais.LoadFromString(QNfce_Recebidas.FieldByName('ARQUIVO_XML').AsString);
      End;

      //FrmPrincipal.ACBrNFe1.Configuracoes.WebServices.Visualizar := True;
       try
        ACBrNFe1.Consultar;
       Except
         Application.MessageBox('Consulta não realizada verificar conexção.', 'PDVEficaz', mb_IconStop + mb_ok);
       end;

        //ShowMessage('Nº do Protocolo: ' + FrmPrincipal.ACBrNFe1.WebServices.Consulta.Protocolo);
        //ShowMessage('Data da Nota: ' + DateToStr(FrmPrincipal.ACBrNFe1.WebServices.Consulta.DhRecbto));

        ACBrNFe1.Configuracoes.WebServices.Visualizar := False;


        QSearch.Sql.Clear;
        QSearch.Sql.Add('SELECT TRANSACAO_ID, NO_DOC_FISCAL FROM COMPL_NFCEFISCAL');
        QSearch.Sql.Add('WHERE');
        QSearch.Sql.Add('(CHAVE_NFCE = :CHAVE_NFCE)');

        QSearch.ParamByName('CHAVE_NFCE').AsString := ACBrNFe1.WebServices.Consulta.NFeChave;

        QSearch.Prepare;
        QSearch.Open;


        if ACBrNFe1.WebServices.Consulta.cStat = 101 then
        Begin

         try
          QRel.Sql.Clear;
          QRel.Sql.Add('INSERT INTO NOTAS_CANCELADAS_NFCE(TRANSACAO_ID, EMPRESA_ID, NO_DOC_FISCAL, DT_SAIDA, HR_SAIDA,  ' +
                       ' RECIBO, PROTOCOLO, CHAVE_NFCE,ECF,VALOR)');
          QRel.Sql.Add('SELECT TRANSACAO_ID, EMPRESA_ID, NO_DOC_FISCAL, DT_SAIDA, HR_SAIDA, ' +
                       'RECIBO, PROTOCOLO, CHAVE_NFCE,ECF,VALOR');
          QRel.Sql.Add('FROM COMPL_NFCEFISCAL');
          QRel.Sql.Add('WHERE');
          QRel.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

          QRel.ParamByName('TRANSACAO_ID').AsInteger := QSearch.FieldByName('TRANSACAO_ID').AsInteger;

          QRel.Prepare;
          QRel.ExecSql;

         except

         on e:Exception do
          begin
            Application.MessageBox(PChar('Erro:' + #13 +
              'Erro: ' + e.Message), 'Erro', MB_ICONSTOP + MB_TASKMODAL);
          end;

           end;



          QRel.Sql.Clear;
          QRel.Sql.Add('DELETE FROM COMPL_NFCEFISCAL');
          QRel.Sql.Add('WHERE');
          QRel.Sql.Add('(CHAVE_NFCE = :CHAVE_NFCE)');

          QRel.ParamByName('CHAVE_NFCE').AsString := ACBrNFe1.WebServices.Consulta.NFeChave;

          QRel.Prepare;
          QRel.ExecSql;


          QRel.SQL.Clear;
          QRel.SQL.Add('SELECT NUM_DOC,BANCO_ID FROM TRANSACOES WHERE TRANSACAO_ID = :TRANSACAO_ID');
          QRel.ParamByName('TRANSACAO_ID').AsInteger :=  QSearch.FieldByName('TRANSACAO_ID').AsInteger;
          QRel.Prepare;
          QRel.Open();


          QUpdate.SQL.Clear;
          QUpdate.SQL.Add('UPDATE FECHAMENTO_CUPOM SET LEGENDA = :LEGENDA ,FINALIZADORA_ID = 0,EXPORTADO = 0');
          QUpdate.SQL.Add('WHERE');
          QUpdate.SQL.Add('(CUPOM = :CUPOM)');
          QUpdate.SQL.Add('AND (CAIXA_ID = :CAIXA_ID)');

          QUpdate.ParamByName('CUPOM').AsString     := StrZero(QSearch.FieldByName('NUM_DOC').AsString, 8, 0);
          QUpdate.ParamByName('CAIXA_ID').AsInteger := QRel.FieldByName('BANCO_ID').AsInteger;
          QUpdate.ParamByName('LEGENDA').AsString   := 'Cancelado';

          QUpdate.Prepare;
          QUpdate.ExecSQL;


        End
        Else
        Begin
         if ACBrNFe1.WebServices.Consulta.cStat = 100 then
         Begin
         QUpdate.SQL.Text := 'UPDATE COMPL_NFCEFISCAL SET ARQUIVO_XML = :ARQUIVO_XML, TRANSMISSAO = :TRANSMISSAO WHERE TRANSACAO_ID = :TRANSACAO_ID';
         QUpdate.ParamByName('TRANSACAO_ID').AsInteger  := QSearch.FieldByName('TRANSACAO_ID').AsInteger;
         QUpdate.ParamByName('ARQUIVO_XML').AsByteStr   := ACBrNFe1.NotasFiscais[0].XML;
         QUpdate.ParamByName('TRANSMISSAO').AsString    := 'SIM';
         QUpdate.Prepare;
         QUpdate.ExecSQL;
         End;

        End;

      QNfce_Recebidas.Next;
    End;


  QNfce_Recebidas.Close;
  QNfce_Recebidas.Params[0].AsDate := Dtmai.Date;
  QNfce_Recebidas.Params[1].AsDate := FrmControle_Nfce.Dtmen.Date;
  QNfce_Recebidas.Prepare;
  QNfce_Recebidas.Open();

  QNfce_Enviadas.Close;
  QNfce_Enviadas.Params[0].AsDate := Dtmai.Date;
  QNfce_Enviadas.Params[1].AsDate := Dtmen.Date;
  QNfce_Enviadas.Prepare;
  QNfce_Enviadas.Open();

  End;
end;

procedure TFrmControle_Nfce.BitBtn2Click(Sender: TObject);
begin
Msg_If.Caption := '';
ACBrNFe1.Configuracoes.WebServices.Visualizar := True;
ACBrNFe1.WebServices.StatusServico.Executar;
ACBrNFe1.Configuracoes.WebServices.Visualizar := False;
end;

procedure TFrmControle_Nfce.BitBtn3Click(Sender: TObject);
begin

  if Application.MessageBox('Deseja realmente excluir a(s) Nfc-e(s) selecionadas?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = IDYES then
  Begin

    DBGrid_Recebidas.DataSource.DataSet.First;
    while not DBGrid_Recebidas.DataSource.DataSet.Eof do
    begin
     if DBGrid_Recebidas.SelectedRows.CurrentRowSelected = True then
     Begin

     QUpdate.SQL.Text := 'DELETE FROM COMPL_NFCEFISCAL WHERE TRANSACAO_ID = :TRANSACAO_ID';
     QUpdate.ParamByName('TRANSACAO_ID').AsInteger := DBGrid_Recebidas.DataSource.DataSet.FieldByName('TRANSACAO_ID').AsInteger;
     QUpdate.Prepare;
     QUpdate.ExecSQL;


     End;
     DBGrid_Recebidas.DataSource.DataSet.Next;
    end;

    QNfce_Recebidas.Refresh;

  End;
end;

procedure TFrmControle_Nfce.BitBtn5Click(Sender: TObject);
var
IniFile, edtSmtpHost, edtSmtpPort, edtSmtpUser, edtSmtpPass, edtEmailAssunto,InputString,email_enviar,Nome_Cliente,Cpf_Cliente: String;
cbEmailSSL,E_MAIL: Boolean;
Ini: TIniFile;
StreamMemo: TMemoryStream;
begin
  if QNfce_Enviadas.FieldByName('ARQUIVO_XML').AsString = '' then
  Begin

  OpenDialog1.Title      := 'Selecione a NFC-e';
  OpenDialog1.DefaultExt := '*-nfe.XML';
  OpenDialog1.Filter     := 'Arquivos NFE (*-nfe.XML)|*-nfe.XML|Arquivos XML (*.XML)|*.XML|Todos os Arquivos (*.*)|*.*';
  OpenDialog1.InitialDir := FrmPrincipal.ACBrNFe1.Configuracoes.Arquivos.PathNFe;

  FrmPrincipal.ACBrNFe1.NotasFiscais.Clear;
  FrmPrincipal.ACBrNFe1.NotasFiscais.LoadFromFile(OpenDialog1.FileName);
  End
  Else
  Begin
  FrmPrincipal.ACBrNFe1.NotasFiscais.Clear;
  FrmPrincipal.ACBrNFe1.NotasFiscais.LoadFromString(QNfce_Enviadas.FieldByName('ARQUIVO_XML').AsString);
  End;

  if OpenDialog1.Execute then
  begin
    IniFile := ChangeFileExt(ExtractFilePath(ParamStr(0)) + 'NFe', '.Ini');

    Ini := TIniFile.Create(IniFile);
    try
      edtSmtpHost     := Ini.ReadString('Email', 'Host',    '');
      edtSmtpPort     := Ini.ReadString('Email', 'Port',    '');
      edtSmtpUser     := Ini.ReadString('Email', 'User',    '');
      edtSmtpPass     := Ini.ReadString('Email', 'Pass',    '');
      edtSmtpPass     := DecryptMsg(edtSmtpPass, 5);
      edtEmailAssunto := Ini.ReadString('Email', 'Assunto', '');
      cbEmailSSL      := Ini.ReadBool('Email', 'SSL', False);
      StreamMemo      := TMemoryStream.Create;

      Ini.ReadBinaryStream('Email', 'Mensagem', StreamMemo);
      FrmPrincipal.MemoResp.Lines.LoadFromStream(StreamMemo);
      StreamMemo.Free;
    finally
      Ini.Free;
    end;


    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT * FROM TRANSACOES');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(NUM_DOC = :NUM_DOC)');
    QRel.Sql.Add('AND (CONDUTA = :CONDUTA)');
    QRel.Sql.Add('AND ((DEPTO   = :DEPTO) OR (DEPTO = :DEPTO_DEV))');

    QRel.ParamByName('NUM_DOC').AsString   := StrZero(IntToStr(FrmPrincipal.ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.nNF), 7, 0);
    QRel.ParamByName('CONDUTA').AsString   := '01';
    QRel.ParamByName('DEPTO').AsString     := '07';
    QRel.ParamByName('DEPTO_DEV').AsString := '10';


    QRel.Prepare;
    QRel.Open;

    if QRel.IsEmpty then
    begin
      Application.MessageBox('Nota Fiscal não localizada no Banco de Dados.' +#13 + '  Envio de e-mail somente para Saidas ou Devoluções de Compra.', PChar(Msg_Title), mb_IconStop);
      abort;
    end
    else
    begin

    end;
   try
    if (QRel.FieldByName('CONDUTA').AsString = '01') and (QRel.FieldByName('DEPTO').AsString = '07') then
    begin
      IQuery.Sql.Clear;
      IQuery.Sql.Add('SELECT * FROM CLIENTES');
      IQuery.Sql.Add('WHERE');
      IQuery.Sql.Add('(CNPJ = :CNPJ)');

      if length(FrmPrincipal.ACBrNFe1.NotasFiscais.Items[0].NFe.Dest.CNPJCPF) = 14 then
        IQuery.ParamByName('CNPJ').AsString := Formata_CNPJ(FrmPrincipal.ACBrNFe1.NotasFiscais.Items[0].NFe.Dest.CNPJCPF)
      else
        IQuery.ParamByName('CNPJ').AsString := Formata_CPF(FrmPrincipal.ACBrNFe1.NotasFiscais.Items[0].NFe.Dest.CNPJCPF);

      IQuery.Prepare;
      IQuery.Open;
    end;


    if IQuery.IsEmpty then
    Begin
    InputString := InputBox('Digite o e-mail do destinatario.', 'e-mail', '');
    email_enviar := InputString;

      if not ValidaEMail(email_enviar) then
      Begin
      Application.MessageBox('O e-mail digitado é inválido', PChar(Msg_Title), mb_IconStop);
      Abort;
      End;

    End;

    if (not IQuery.IsEmpty) or ValidaEMail(email_enviar) then
    begin
       if (not IQuery.IsEmpty) then
       Begin
        Nome_Cliente :=  IQuery.FieldByName('NOME').AsString;
        Cpf_Cliente  :=  IQuery.FieldByName('CNPJ').AsString;

        if ValidaEMail(IQuery.FieldByName('EMAIL').AsString) then
            email_enviar := IQuery.FieldByName('EMAIL').AsString;
       End;


     //   Application.MessageBox('O e-mail cadastrado para este cliente é inválido', PChar(Msg_Title), mb_IconStop)
     // else
       //Begin
        Try
        if edtEmailAssunto = '' then
        edtEmailAssunto := FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString + ' Nfc-e: ' + QRel.FieldByName('NUM_DOC').AsString + ' Data: ' + DateToStr(QRel.FieldByName('DT_ENT_SAI').AsDateTime);

        FrmPrincipal.MemoResp.Lines.Add('Segue em anexo : Nfc-e Nº: ' + QRel.FieldByName('NUM_DOC').AsString);
        FrmPrincipal.MemoResp.Lines.Add('');
        FrmPrincipal.MemoResp.Lines.Add('Empresa: ' + QEmpresa.FieldByName('RAZAO').AsString + ' CNPJ: ' + IQuery.FieldByName('CNPJ').AsString );
        FrmPrincipal.MemoResp.Lines.Add('');
        FrmPrincipal.MemoResp.Lines.Add('Cliente: ' + Nome_Cliente + ' CPF: ' + Cpf_Cliente  );
        FrmPrincipal.MemoResp.Lines.Add('');
        FrmPrincipal.MemoResp.Lines.Add('Chave da NFc-e: ' + QRel.FieldByName('CHAVE_NFE').AsString);
        FrmPrincipal.MemoResp.Lines.Add('');
        FrmPrincipal.MemoResp.Lines.Add('');
        FrmPrincipal.MemoResp.Lines.Add('');
        FrmPrincipal.MemoResp.Lines.Add('**********************Sistema Eficaz(38)37411478**********************');

                FrmPrincipal.ACBrMail1.Host      := edtSmtpHost;
                FrmPrincipal.ACBrMail1.Port      := edtSmtpPort;
                FrmPrincipal.ACBrMail1.Username  := edtSmtpUser;
                FrmPrincipal.ACBrMail1.Password  := edtSmtpPass;
                FrmPrincipal.ACBrMail1.From      := edtSmtpUser;
                FrmPrincipal.ACBrMail1.SetSSL    := cbEmailSSL; // SSL - ConexÃ£o Segura
                FrmPrincipal.ACBrMail1.SetTLS    := True; // Auto TLS
                FrmPrincipal.ACBrMail1.UseThread := False;           //Aguarda Envio do Email(nÃ£o usa thread)
                FrmPrincipal.ACBrMail1.FromName  := 'Sistema Eficaz Automação Ltda.';

                FrmPrincipal.ACBrNFe1.NotasFiscais.Items[0].EnviarEmail(email_enviar , edtEmailAssunto ,
                                                         FrmPrincipal.MemoResp.Lines
                                                         ,True  // Enviar PDF junto
                                                         ,nil //CC  Lista com emails que serÃ£o enviado cÃ³pias - TStrings
                                                         ,nil); // Lista de anexos - TStrings

        //ACBrNFe1.NotasFiscais.Items[0].EnviarEmail(edtSmtpHost, edtSmtpPort, edtSmtpUser, edtSmtpPass, edtSmtpUser,
        //IQuery.FieldByName('EMAIL').AsString, edtEmailAssunto, MemoResp.Lines, cbEmailSSL, True //Enviar PDF junto
        //, nil {Lista com emails que serão enviado cópias - TStrings}
        //, nil { Lista de anexos - TStrings}
        //, False {Pede confirmação de leitura do email}
        //, True  {Aguarda Envio do Email(não usa thread)}
        //, QEmpresa.FieldByName('RAZAO').AsString //NOME do Rementente}
        //, True ); // Auto TLS);

         FrmPrincipal.MemoResp.Lines.Clear;


            E_mail := True;

        except
             Application.MessageBox('Não foi possível enviar o email verifique as configurações.', PChar(Msg_Title), mb_IconInformation);
              e_mail := False;

         { on e:Exception do
          begin
            Application.MessageBox(PChar('Erro ao enviar email!' + #13 +
              'Erro: ' + e.Message), 'Erro', MB_ICONSTOP + MB_TASKMODAL);
          end;
          }

        End;

        if e_mail then
          Application.MessageBox(Pchar('E-mail enviado com sucesso para :' + email_enviar), PChar(Msg_Title), mb_IconInformation);

      // End;

    end
    else
      Application.MessageBox('Cliente  não localizado no Banco de Dados', PChar(Msg_Title), mb_IconStop);

    FrmPrincipal.MemoResp.Lines.Clear;
   Except
   on e:Exception do
       {on e:Exception do
        begin
          Application.MessageBox(PChar('Erro ao enviar email!' + #13 +
            'Erro: ' + e.Message), 'Erro', MB_ICONSTOP + MB_TASKMODAL);
        end; }

      begin
        Application.MessageBox(PChar('Dados do Cliente não conferem com os dados da Nfe!'), 'Erro', MB_ICONSTOP + MB_TASKMODAL);
      end;
   end;
  end;


end;

procedure TFrmControle_Nfce.BitBtn6Click(Sender: TObject);
begin

  if Application.MessageBox('Deseja realmente marcar como não enviadas a(s) Nfc-e(s) selecionadas?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = IDYES then
  Begin

    DBGrid_Enviadas.DataSource.DataSet.First;
    while not DBGrid_Enviadas.DataSource.DataSet.Eof do
    begin
     if DBGrid_Enviadas.SelectedRows.CurrentRowSelected = True then
     Begin

     QUpdate.SQL.Text := 'UPDATE COMPL_NFCEFISCAL SET TRANSMISSAO = :TRANSMISSAO WHERE TRANSACAO_ID = :TRANSACAO_ID';
     QUpdate.ParamByName('TRANSACAO_ID').AsInteger := DBGrid_Enviadas.DataSource.DataSet.FieldByName('TRANSACAO_ID').AsInteger;
     QUpdate.ParamByName('TRANSMISSAO').AsString   := 'NAO';
     QUpdate.Prepare;
     QUpdate.ExecSQL;


     End;
     DBGrid_Enviadas.DataSource.DataSet.Next;
    end;

    QNfce_Enviadas.Refresh;
    QNfce_Recebidas.Refresh;

  End;
end;

procedure TFrmControle_Nfce.BtnAtualizarClick(Sender: TObject);
var
x:Integer;
begin

  QNfce_Recebidas.Close;
  QNfce_Recebidas.Params[0].AsDate := Dtmai.Date;
  QNfce_Recebidas.Params[1].AsDate := Dtmen.Date;
  QNfce_Recebidas.Prepare;
  QNfce_Recebidas.Open();

  QNfce_Enviadas.Close;
  QNfce_Enviadas.Params[0].AsDate := Dtmai.Date;
  QNfce_Enviadas.Params[1].AsDate := Dtmen.Date;
  QNfce_Enviadas.Prepare;
  QNfce_Enviadas.Open();

  QNfce_Erro.SQL.Clear;
  QNfce_Erro.SQL.Add('SELECT TRANSACOES.TRANSACAO_ID,DT_TRANS,HORA,SERIE,NUM_DOC,CHAVE_NFE CHAVE_NFCE,');
  QNfce_Erro.SQL.Add('TRANSACOES.VALOR,TRANSACAO_ORIGEM');
  QNfce_Erro.SQL.Add('FROM TRANSACOES');
  QNfce_Erro.SQL.Add('WHERE DT_TRANS BETWEEN :DT_INICIO AND :DT_FIM');
  QNfce_Erro.SQL.Add('AND MODELO = :MODELO');
  QNfce_Erro.SQL.Add('AND TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM  COMPL_NFCEFISCAL');
  QNfce_Erro.SQL.Add('WHERE DT_SAIDA BETWEEN :DT_INICIO AND :DT_FIM )');
  QNfce_Erro.SQL.Add('ORDER BY TRANSACOES.TRANSACAO_ID');
  QNfce_Erro.Params[0].AsDate   := Dtmai.Date;
  QNfce_Erro.Params[1].AsDate   := Dtmen.Date;
  QNfce_Erro.Params[2].AsString := '65';

  QNfce_Erro.Prepare;
  QNfce_Erro.Open;

  QNfce_Erro.First;

  Fdac_Temp.EmptyDataset;

  while not QNfce_Erro.Eof do
  begin
   Fdac_Temp.Append;

   Fdac_Temp.FieldByName('TRANSACAO_ID').AsInteger := QNfce_Erro.FieldByName('TRANSACAO_ID').AsInteger;
   Fdac_Temp.FieldByName('DATA').AsDateTime        := QNfce_Erro.FieldByName('DT_TRANS').AsDateTime;
   Fdac_Temp.FieldByName('HORA').AsString          := QNfce_Erro.FieldByName('HORA').AsString;
   Fdac_Temp.FieldByName('ECF').AsString           := QNfce_Erro.FieldByName('SERIE').AsString;
   Fdac_Temp.FieldByName('NUM_DOC').AsString       := QNfce_Erro.FieldByName('NUM_DOC').AsString;
   Fdac_Temp.FieldByName('CHAVE_NFCE').AsString    := QNfce_Erro.FieldByName('CHAVE_NFCE').AsString;
   Fdac_Temp.FieldByName('VALOR').AsFloat          := QNfce_Erro.FieldByName('VALOR').AsFloat;
   Fdac_Temp.FieldByName('TRANSACAO_ORIGEM').AsInteger := QNfce_Erro.FieldByName('TRANSACAO_ORIGEM').AsInteger;


   Fdac_Temp.Post;

   QNfce_Erro.Next;

   Application.ProcessMessages;

  end;

  QNfce_Erro.SQL.Clear;
  QNfce_Erro.SQL.Add('SELECT TRANSACOES.TRANSACAO_ID,DT_TRANS,HORA,SERIE,NUM_DOC,CHAVE_NFE CHAVE_NFCE,');
  QNfce_Erro.SQL.Add('TRANSACOES.VALOR,TRANSACAO_ORIGEM');
  QNfce_Erro.SQL.Add('FROM TRANSACOES');
  QNfce_Erro.SQL.Add('WHERE DT_TRANS BETWEEN :DT_INICIO AND :DT_FIM');
  QNfce_Erro.SQL.Add('AND MODELO = :MODELO');
  QNfce_Erro.SQL.Add('AND TRANSACAO_ID IN (SELECT TRANSACAO_ID FROM  NOTAS_CANCELADAS_NFCE');
  QNfce_Erro.SQL.Add('WHERE DT_SAIDA BETWEEN :DT_INICIO AND :DT_FIM )');
  QNfce_Erro.SQL.Add('ORDER BY TRANSACOES.TRANSACAO_ID');
  QNfce_Erro.Params[0].AsDate   := Dtmai.Date;
  QNfce_Erro.Params[1].AsDate   := Dtmen.Date;
  QNfce_Erro.Params[2].AsString := '65';

  QNfce_Erro.Prepare;
  QNfce_Erro.Open;

  QNfce_Erro.First;
  while not QNfce_Erro.Eof do
  begin

  Fdac_Temp.Locate('TRANSACAO_ID', QNfce_Erro.FieldByName('TRANSACAO_ID').AsInteger, []);
  Fdac_Temp.Delete;
  QNfce_Erro.Next;

  end;

  Fdac_Temp.Open;



 if not Fdac_Temp.IsEmpty Then
 Begin
   Fdac_Temp.First;

   x:=0;

   while not Fdac_Temp.Eof do
   begin
     inc(X);
     Fdac_Temp.Next;
   end;

   Label3.Caption := 'Pendências Nfc-e('+ IntToStr(X) +')';
 End;

end;

procedure TFrmControle_Nfce.BitBtn7Click(Sender: TObject);
var
vAux, Cond_Origem, Dpt_Origem,CodEv,Arquivo_xml: String;
ID, Id_Trans,IdEv: Integer;
Vl_Trans: Real;
Gerencial: Boolean;

begin

  if QNfce_Enviadas.FieldByName('ARQUIVO_XML').AsString = '' then
  Begin

  OpenDialog1.Title      := 'Selecione a NFC-e';
  OpenDialog1.DefaultExt := '*-nfe.XML';
  OpenDialog1.Filter     := 'Arquivos NFE (*-nfe.XML)|*-nfe.XML|Arquivos XML (*.XML)|*.XML|Todos os Arquivos (*.*)|*.*';
  OpenDialog1.InitialDir := FrmPrincipal.ACBrNFe1.Configuracoes.Arquivos.PathNFe;

  FrmPrincipal.ACBrNFe1.NotasFiscais.Clear;
  FrmPrincipal.ACBrNFe1.NotasFiscais.LoadFromFile(OpenDialog1.FileName);
  End
  Else
  Begin
  FrmPrincipal.ACBrNFe1.NotasFiscais.Clear;
  FrmPrincipal.ACBrNFe1.NotasFiscais.LoadFromString(QNfce_Enviadas.FieldByName('ARQUIVO_XML').AsString);
  End;

  QCancelamento.Sql.Clear;
  QCancelamento.Sql.Add('SELECT * FROM TRANSACOES');
  QCancelamento.Sql.Add('WHERE');
  QCancelamento.Sql.Add('(NUM_DOC = :NUM_DOC)');
  QCancelamento.Sql.Add('AND (CONDUTA = :CONDUTA) AND (SERIE = :SERIE) AND (MODELO = :MODELO)');

  QCancelamento.ParamByName('NUM_DOC').AsString := StrZero(IntToStr(FrmPrincipal.ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.nNF), 7, 0);
  QCancelamento.ParamByName('SERIE').AsString   := StrZero(IntToStr(FrmPrincipal.ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.serie), 3, 0);
  QCancelamento.ParamByName('CONDUTA').AsString :=  '01';
  QCancelamento.ParamByName('MODELO').AsString  :=  '65';


  QCancelamento.Prepare;
  QCancelamento.Open;

  if QCancelamento.IsEmpty then
  begin
    Application.MessageBox('Nota Fiscal não localizada no Banco de Dados', PChar(Msg_Title), mb_IconStop);
    abort
  end
  else
  begin
    ID          := QCancelamento.FieldByName('TRANSACAO_ID').AsInteger;
    Vl_Trans    := QCancelamento.FieldByName('VALOR').AsFloat;
    Cond_origem := QCancelamento.FieldByName('CONDUTA').AsString;
    Dpt_origem  := QCancelamento.FieldByName('DEPTO').AsString;
    vAux := 'Cancelamento de venda efetuada pelo usuario.';

    if (not(InputQuery('WebServices Cancelamento Por Evento', 'Justificativa', vAux))) or (Length(vAux) < 15) then
     Begin
        Begin
         Application.MessageBox('Justificativa sem informação ou inferior a 15 caracteres favor verificar!', PChar(Msg_Title), mb_IconInformation);
         Abort;
        End;
     End
    Else
    Begin
      FrmPrincipal.ACBrNFe1.EventoNFe.Evento.Clear;
      FrmPrincipal.ACBrNFe1.EventoNFe.idLote := ID;

      CodEv := IntToStr(1);
     // if not(InputQuery('WebServices Cancelamento Por Evento', 'Sequência do Evento', CodEv)) then
      IdEv := 1;
     // Else
     // IdEv := StrToINT(CodEv);

      with FrmPrincipal.ACBrNFe1.EventoNFe.Evento.Add do
      begin
      infEvento.dhEvento        := Now;
      infEvento.tpEvento        := teCancelamento;
      infEvento.detEvento.xJust := vAux;
      infEvento.nSeqEvento      := IdEv;
      end;

      if FrmPrincipal.ACBrNFe1.EnviarEvento(ID) then
      begin
        with FrmPrincipal.ACBrNFe1.WebServices.EnvEvento do
        begin
         if (EventoRetorno.retEvento.Items[0].RetInfEvento.cStat = 573) Then
         begin

           if QNfce_Enviadas.FieldByName('ARQUIVO_XML').AsString = '' then
           FrmPrincipal.ACBrNFe1.NotasFiscais.LoadFromFile(OpenDialog1.FileName)
           Else
           FrmPrincipal.ACBrNFe1.NotasFiscais.LoadFromString(QNfce_Enviadas.FieldByName('ARQUIVO_XML').AsString);


           FrmPrincipal.ACBrNFe1.Consultar;
           MoveFile(PChar(FrmPrincipal.ACBrNFe1.Configuracoes.Arquivos.PathNFe + '\' + Copy(FrmPrincipal.ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID, 4, 44)+'-nfeDFe.xml'), PChar(ExtractFilePath(ParamStr(0)) + '\Can\'  + Copy(FrmPrincipal.ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID, 4, 44)+'-nfeDFe.xml'));
           MoveFile(PChar(OpenDialog1.FileName), PChar(ExtractFilePath(ParamStr(0)) + '\Can\'  + Copy(FrmPrincipal.ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID, 4, 44)+'-nfe.xml'));

         end;

         if (EventoRetorno.retEvento.Items[0].RetInfEvento.cStat <> 135) then
         begin

          raise Exception.CreateFmt(

          'Ocorreu o seguinte erro ao cancelar a nota fiscal eletrônica:'  + sLineBreak +
          'Código:%d' + sLineBreak +
          'Motivo: %s', [
           EventoRetorno.retEvento.Items[0].RetInfEvento.cStat,
           EventoRetorno.retEvento.Items[0].RetInfEvento.xMotivo ]);

         end;

         if (EventoRetorno.retEvento.Items[0].RetInfEvento.cStat = 135) OR (EventoRetorno.retEvento.Items[0].RetInfEvento.cStat = 136) then
         begin

          try

            QRel.Sql.Clear;
            QRel.Sql.Add('INSERT INTO NOTAS_CANCELADAS_NFCE(TRANSACAO_ID, EMPRESA_ID, NO_DOC_FISCAL, DT_SAIDA, HR_SAIDA,  ' +
                         ' RECIBO, PROTOCOLO, CHAVE_NFCE,ECF,VALOR,ARQUIVO_XML)');
            QRel.Sql.Add('SELECT TRANSACAO_ID, EMPRESA_ID, NO_DOC_FISCAL, DT_SAIDA, HR_SAIDA, ' +
                         'RECIBO, PROTOCOLO, CHAVE_NFCE,ECF,VALOR,ARQUIVO_XML');
            QRel.Sql.Add('FROM COMPL_NFCEFISCAL');
            QRel.Sql.Add('WHERE');
            QRel.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

            QRel.ParamByName('TRANSACAO_ID').AsInteger := ID;


            QRel.Prepare;
            QRel.ExecSql;

           except

           on e:Exception do
            begin
              Application.MessageBox(PChar('Erro:' + #13 +
                'Erro: ' + e.Message), 'Erro', MB_ICONSTOP + MB_TASKMODAL);
            end;

           end;



            QRel.Sql.Clear;
            QRel.Sql.Add('DELETE FROM COMPL_NFCEFISCAL');
            QRel.Sql.Add('WHERE');
            QRel.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

            QRel.ParamByName('TRANSACAO_ID').AsInteger := ID;

            QRel.Prepare;
            QRel.ExecSql;



            QRel.Sql.Clear;
            QRel.Sql.Add('UPDATE TRANSPARCELAS SET AGRUPAMENTO = 989898');
            QRel.Sql.Add('WHERE');
            QRel.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

            QRel.ParamByName('TRANSACAO_ID').AsInteger := ID;

            QRel.Prepare;
            QRel.ExecSql;


            IQuery.SQL.Clear;
            IQuery.SQL.Add('SELECT NEXTVAL(:GEN_TRANSACOES) ID');
            IQuery.ParamByName('GEN_TRANSACOES').AsString :=  'GEN_TRANSACOES';

            IQuery.Prepare;
            IQuery.Open;

            Id_Trans := IQuery.FieldByName('ID').AsInteger;


            QRel.Sql.Clear;
            QRel.Sql.Add('INSERT INTO TRANSACOES( ' +
                         'TRANSACAO_ID, DT_TRANS,   DT_MOVIMENTO, CONDUTA, ' +
                         'DEPTO,        EMPRESA_ID, CONTA_ID,     C_CUSTO_ID, BANCO_ID, ' +
                         'VALOR,        TPCTB,      AUTORIZ_ID,   HISTORICO, ' +
                         'CONTAAUX_ID) VALUES(' +
                         ':TRANSACAO_ID, :DT_TRANS,   :DT_MOVIMENTO, :CONDUTA, :DEPTO,      :EMPRESA_ID, ' +
                         ':CONTA_ID,     :C_CUSTO_ID, :BANCO_ID, :VALOR,        :TPCTB,   :AUTORIZ_ID, :HISTORICO, ' +
                         ':CONTAAUX_ID)');

            QRel.ParamByName('TRANSACAO_ID').AsInteger  := Id_Trans;
            QRel.ParamByName('DT_TRANS').AsDateTime     := Date;
            QRel.ParamByName('DT_MOVIMENTO').AsDateTime := Date;
            QRel.ParamByName('CONDUTA').AsString        := '18';
            QRel.ParamByName('DEPTO').AsString          := '07';
            QRel.ParamByName('EMPRESA_ID').AsInteger    := FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger;
            QRel.ParamByName('CONTA_ID').AsInteger      := Config.FieldByName('CONTA_ESTOQUE').AsInteger;
            QRel.ParamByName('C_CUSTO_ID').AsInteger    := 1;
            QRel.ParamByName('VALOR').AsFloat           := Vl_Trans;
            QRel.ParamByName('TPCTB').AsString          := '2';
            QRel.ParamByName('AUTORIZ_ID').AsInteger    := FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger;
            QRel.ParamByName('HISTORICO').AsString      := 'CANCELAMENTO NFCe ' + StrZero(IntToStr(FrmPrincipal.ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.nNF), 6, 0);
            QRel.ParamByName('CONTAAUX_ID').AsInteger   := 0;
            QRel.ParamByName('BANCO_ID').AsInteger      := QCancelamento.FieldByName('BANCO_ID').AsInteger;

            QRel.Prepare;
            QRel.ExecSql;



            QRel.Sql.Clear;
            QRel.Sql.Add('INSERT INTO TRANSITENS(TRANSACAO_ID, PRODUTO_ID, CONTA_ID, TP_PROD_SERV, CFOP, DESCRICAO, TRIBUTO_ID, QUANTIDADE, VR_UNITARIO, VR_DESCONTO, VR_TOTAL)');
            QRel.Sql.Add('SELECT :ID_TRANS, PRODUTO_ID, CONTA_ID, TP_PROD_SERV, :CFOP, DESCRICAO, TRIBUTO_ID, QUANTIDADE, VR_UNITARIO, VR_DESCONTO, VR_TOTAL');
            QRel.Sql.Add('FROM TRANSITENS');
            QRel.Sql.Add('WHERE');
            QRel.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

            QRel.ParamByName('ID_TRANS').AsInteger     := Id_Trans;
            QRel.ParamByName('TRANSACAO_ID').AsInteger := ID;
            QRel.ParamByName('CFOP').AsString         := '5556';


            QRel.Prepare;
            QRel.ExecSql;

            if QNfce_Enviadas.FieldByName('ARQUIVO_XML').AsString = '' then
            FrmPrincipal.ACBrNFe1.NotasFiscais.LoadFromFile(OpenDialog1.FileName)
            Else
            FrmPrincipal.ACBrNFe1.NotasFiscais.LoadFromString(QNfce_Enviadas.FieldByName('ARQUIVO_XML').AsString);

            FrmPrincipal.ACBrNFe1.Consultar;


            Arquivo_xml := FrmPrincipal.ACBrNFe1.Configuracoes.Arquivos.GetPathNFe + '\' + Copy(FrmPrincipal.ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID, 4, 44)+'-NfeDfe.xml';
            FrmPrincipal.ACBrNFe1.NotasFiscais.Clear;
            FrmPrincipal.ACBrNFe1.NotasFiscais.LoadFromFile(Arquivo_xml);



            QUpdate.SQL.Text := 'UPDATE NOTAS_CANCELADAS_NFCE SET ARQUIVO_XML = :ARQUIVO_XML WHERE TRANSACAO_ID = :TRANSACAO_ID';
            QUpdate.ParamByName('TRANSACAO_ID').AsInteger  := ID;
            QUpdate.ParamByName('ARQUIVO_XML').AsByteStr   := FrmPrincipal.ACBrNFe1.NotasFiscais[0].XML;
            QUpdate.Prepare;
            QUpdate.ExecSQL;

            MoveFile(PChar(FrmPrincipal.ACBrNFe1.Configuracoes.Arquivos.GetPathNFe + '\' + Copy(FrmPrincipal.ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID, 4, 44)+'-nfe.xml'), PChar(ExtractFilePath(ParamStr(0)) + '\Can\'  + Copy(FrmPrincipal.ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID, 4, 44)+'-nfeDFe.xml'));

         end;


         Application.MessageBox(PChar('Status: ' + IntToStr(EventoRetorno.retEvento.Items[0].RetInfEvento.cStat)), PChar(Msg_Title), mb_IconInformation);
         Application.MessageBox(PChar('Nº do Protocolo: ' + EventoRetorno.retEvento.Items[0].RetInfEvento.nProt), PChar(Msg_Title), mb_IconInformation);

         Application.MessageBox('Cancelamento Nfc-e efetuado com sucesso.', PChar(Msg_Title), mb_IconInformation);

        end;
      end
      else
      begin
        with FrmPrincipal.ACBrNFe1.WebServices.EnvEvento do
        begin
          raise Exception.Create(
            'Ocorreram erros ao tentar efetuar o cancelamento:' + sLineBreak +
            'Lote: '     + IntToStr(EventoRetorno.idLote) + sLineBreak +
            'Ambiente: ' + TpAmbToStr(EventoRetorno.tpAmb) + sLineBreak +
            'Orgao: '    + IntToStr(EventoRetorno.cOrgao) + sLineBreak +
            sLineBreak +
            'Status: '   + IntToStr(EventoRetorno.cStat) + sLineBreak +
            'Motivo: '   + EventoRetorno.xMotivo
          );
        end;

      end;
     // Application.MessageBox(PChar('Status: ' + IntToStr(ACBrNFe1.WebServices.Cancelamento.cStat)), PChar(Msg_Title), mb_IconInformation);
     // Application.MessageBox(PChar('Nº do Protocolo: ' + ACBrNFe1.WebServices.Cancelamento.Protocolo), PChar(Msg_Title), mb_IconInformation);
    end;
  end;
  BtnAtualizarClick(SELF);
end;

procedure TFrmControle_Nfce.BitBtn8Click(Sender: TObject);
begin

  if QNfce_Enviadas.FieldByName('ARQUIVO_XML').AsString = '' then
  Begin
  OpenDialog1.Title      := 'Selecione a NFcE';
  OpenDialog1.DefaultExt := '*-nfe.XML';
  OpenDialog1.Filter     := 'Arquivos NFE (*-nfe.XML)|*-nfe.XML|Arquivos XML (*.XML)|*.XML|Todos os Arquivos (*.*)|*.*';
  OpenDialog1.InitialDir := FrmPrincipal.ACBrNFe1.Configuracoes.Arquivos.GetPathNFe;

  FrmPrincipal.ACBrNFe1.NotasFiscais.Clear;
  FrmPrincipal.ACBrNFe1.NotasFiscais.LoadFromFile(OpenDialog1.FileName);

  End
  Else
  Begin
  FrmPrincipal.ACBrNFe1.NotasFiscais.Clear;
  FrmPrincipal.ACBrNFe1.NotasFiscais.LoadFromString(QNfce_Enviadas.FieldByName('ARQUIVO_XML').AsString);
  End;


    FrmPrincipal.ACBrNFe1.Configuracoes.WebServices.Visualizar := True;
    FrmPrincipal.ACBrNFe1.Consultar;

    ShowMessage('Nº do Protocolo: ' + FrmPrincipal.ACBrNFe1.WebServices.Consulta.Protocolo);
    ShowMessage('Data da Nota: ' + DateToStr(FrmPrincipal.ACBrNFe1.WebServices.Consulta.DhRecbto));

    FrmPrincipal.ACBrNFe1.Configuracoes.WebServices.Visualizar := False;

    if FrmPrincipal.ACBrNFe1.WebServices.Consulta.cStat = 101 then
    Begin

     QSearch.Sql.Clear;
     QSearch.Sql.Add('SELECT TRANSACAO_ID FROM COMPL_NFCEFISCAL');
     QSearch.Sql.Add('WHERE');
     QSearch.Sql.Add('(CHAVE_NFCE = :CHAVE_NFCE)');

     QSearch.ParamByName('CHAVE_NFCE').AsString := FrmPrincipal.ACBrNFe1.WebServices.Consulta.NFeChave;

     QSearch.Prepare;
     QSearch.Open;


     try
      QRel.Sql.Clear;
      QRel.Sql.Add('INSERT INTO NOTAS_CANCELADAS_NFCE(TRANSACAO_ID, EMPRESA_ID, NO_DOC_FISCAL, DT_SAIDA, HR_SAIDA,  ' +
                   ' RECIBO, PROTOCOLO, CHAVE_NFCE,ECF,VALOR)');
      QRel.Sql.Add('SELECT TRANSACAO_ID, EMPRESA_ID, NO_DOC_FISCAL, DT_SAIDA, HR_SAIDA, ' +
                   'RECIBO, PROTOCOLO, CHAVE_NFCE,ECF,VALOR');
      QRel.Sql.Add('FROM COMPL_NFCEFISCAL');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

      QRel.ParamByName('TRANSACAO_ID').AsInteger := QSearch.FieldByName('TRANSACAO_ID').AsInteger;

      QRel.Prepare;
      QRel.ExecSql;

     except

     on e:Exception do
      begin
        Application.MessageBox(PChar('Erro:' + #13 +
          'Erro: ' + e.Message), 'Erro', MB_ICONSTOP + MB_TASKMODAL);
      end;

       end;



      QRel.Sql.Clear;
      QRel.Sql.Add('DELETE FROM COMPL_NFCEFISCAL');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(CHAVE_NFCE = :CHAVE_NFCE)');

      QRel.ParamByName('CHAVE_NFCE').AsString := FrmPrincipal.ACBrNFe1.WebServices.Consulta.NFeChave;

      QRel.Prepare;
      QRel.ExecSql;



      QNfce_Enviadas.Refresh;
      QNfce_Recebidas.Refresh;


    End;

end;

procedure TFrmControle_Nfce.BitBtn9Click(Sender: TObject);
begin

  if Application.MessageBox('Deseja realmente marcar como enviadas a(s) Nfc-e(s) selecionadas?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = IDYES then
  Begin

    DBGrid_Recebidas.DataSource.DataSet.First;
    while not DBGrid_Recebidas.DataSource.DataSet.Eof do
    begin
     if DBGrid_Recebidas.SelectedRows.CurrentRowSelected = True then
     Begin

     QUpdate.SQL.Text := 'UPDATE COMPL_NFCEFISCAL SET TRANSMISSAO = :TRANSMISSAO WHERE TRANSACAO_ID = :TRANSACAO_ID';
     QUpdate.ParamByName('TRANSACAO_ID').AsInteger := DBGrid_Recebidas.DataSource.DataSet.FieldByName('TRANSACAO_ID').AsInteger;
     QUpdate.ParamByName('TRANSMISSAO').AsString   := 'SIM';
     QUpdate.Prepare;
     QUpdate.ExecSQL;


     End;
     DBGrid_Recebidas.DataSource.DataSet.Next;
    end;

    QNfce_Enviadas.Refresh;
    QNfce_Recebidas.Refresh;

  End;

end;

procedure TFrmControle_Nfce.btnRetornaClick(Sender: TObject);
begin
Close;
end;

procedure TFrmControle_Nfce.DBGrid_EnviadasCellClick(Column: TColumn);
begin
ChaveEnv_edt.Text := dbgrid_enviadas.SelectedField.DataSet.FieldByName('Chave_Nfce').AsString;
end;

procedure TFrmControle_Nfce.DBGrid_EnviadasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
 Var
 Bmp   : TBitmap;
  RecF  : TRect;
  BmpX  : Integer;
  Indice: Integer;
begin
//TDBGrid(Sender).Canvas.Font.Color := clGREEN;
//TDBGrid(Sender).DefaultDrawDataCell(Rect, TDBGrid(Sender).Columns[DataCol].Field, State);

  RecF := Rect;

  If Column.FieldName = 'arquivo_xml' then
  begin

    If not (QNfce_Enviadas.FieldByName('ARQUIVO_XML').IsNull)  then
      Begin
       Indice := 0;
       Bmp := TBitmap.Create;
        try
          ImageList1.GetBitmap(Indice, Bmp);
          BmpX := (Rect.Bottom - Rect.Top);
          RecF.Right := Rect.Left + BmpX;
          DBGrid_Enviadas.Canvas.StretchDraw(RecF, Bmp);
        finally
          Bmp.Free;
        end;

        RecF := Rect;
        RecF.Left := RecF.Left + BmpX;
        DBGrid_Enviadas.DefaultDrawColumnCell(RecF, DataCol, Column, State);
      End
    else
       Indice := 1;



  end;
end;



procedure TFrmControle_Nfce.DBgrid_recebidasCellClick(Column: TColumn);
begin
ChaveREc_edt.Text := dbgrid_Recebidas.SelectedField.DataSet.FieldByName('Chave_Nfce').AsString;
end;

procedure TFrmControle_Nfce.DBgrid_recebidasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);

var
  Bmp   : TBitmap;
  RecF  : TRect;
  BmpX  : Integer;
  Indice: Integer;
begin
  RecF := Rect;

  If Column.FieldName = 'arquivo_xml' then
  begin
    If QNfce_Enviadas.FieldByName('ARQUIVO_XML').AsString <> ''  then
       Indice := 0
    else
       Indice := 1;

    if QNfce_Enviadas.FieldCount > 0 then
    Begin

      Bmp := TBitmap.Create;
      try
        ImageList1.GetBitmap(Indice, Bmp);
        BmpX := (Rect.Bottom - Rect.Top);
        RecF.Right := Rect.Left + BmpX;
        DBGrid_Enviadas.Canvas.StretchDraw(RecF, Bmp);
      finally
        Bmp.Free;
      end;
    End;

    RecF := Rect;
    RecF.Left := RecF.Left + BmpX;
    DBGrid_Enviadas.DefaultDrawColumnCell(RecF, DataCol, Column, State)
  end;
//
end;

procedure TFrmControle_Nfce.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
TDBGrid(Sender).Canvas.Font.Color := clRed;
//TDBGrid(Sender).DefaultDrawDataCell(Rect, TDBGrid(Sender).Columns[DataCol].Field, State);
end;

procedure TFrmControle_Nfce.EventoVendaNfceAlert(ASender: TFDCustomEventAlerter;
  const AEventName: string; const  AArgument: Variant);
begin

if AEventName = 'processa_nfce' then
  Begin

   EnviarNfces;

  End;

end;

procedure TFrmControle_Nfce.FormClose(Sender: TObject; var Action: TCloseAction);
var
Janela: HWND;
begin
  Janela := FindWindow('AfxFrameOrView42S', nil);

  if Janela <> 0 then
    PostMessage(Janela, WM_QUIT, 0, 0);

end;


procedure TFrmControle_Nfce.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 if MDIChildCount = 0 then
  begin
    if Application.MessageBox('Deseja realmente encerrar a aplicação?', PChar('EficazSync'), mb_YesNo + mb_IconQuestion + mb_DefButton2) = IDYES then
    begin
      CanClose := True;
    end
    else
      CanClose := False;
  end
  else
  begin
   { if (FrmConversor = nil) then
      Application.MessageBox('Existe janela aberta. Seria melhor fechá-la antes de encerrar', PChar('EficazSync'), mb_IconStop)
    else  }
      Application.MessageBox('Existem janelas abertas. Seria melhor fechá-las antes de encerrar', PChar('EficazSync'), mb_IconStop);

    CanClose := False;
  end;
end;

procedure TFrmControle_Nfce.FormCreate(Sender: TObject);
begin

  Config.Open();

  QRel.SQL.Clear;
  QRel.SQL.Add('SELECT * FROM EMPRESAS WHERE STATUS = :STATUS ORDER BY EMPRESA_ID');
  QRel.ParamByName('STATUS').AsString := 'A';
  QRel.Prepare;
  QRel.Open;

  QEmpresa.Close;
  QEmpresa.ParamByName('EMPRESA_ID').AsInteger := QRel.FieldByName('EMPRESA_ID').AsInteger;
  QEmpresa.Open;


  //Fdac_Temp.Free;
 // Fdac_Temp := TFDMemTable.Create(nil);

  TRY
    with Fdac_Temp.FieldDefs do
    begin
      Clear;
      Add('TRANSACAO_ID', ftInteger, 0, False);
      Add('TRANSACAO_ORIGEM', ftInteger, 0, False);
      Add('ECF', ftString, 3, False);
      Add('HORA', ftString, 8, False);
      Add('DATA', ftDate, 0, False);
      Add('CHAVE_NFCE', ftString, 44, False);
      Add('VALOR', ftFloat, 0, False);
      Add('NUM_DOC', ftInteger, 0, False);
    end;

    with Fdac_Temp.IndexDefs do
    begin
      Clear;
      Add('TEMP', 'TRANSACAO_ID;DATA', [ixCaseInsensitive]);
    end;
    Fdac_Temp.IndexName := 'TEMP';
    Fdac_Temp.CreateDataSet;
    Fdac_Temp.Open;

    except on E: Exception do
     ShowMessage( E.Message );
  end;


end;

procedure TFrmControle_Nfce.FormShow(Sender: TObject);
begin

     ACBrNFe1.Configuracoes.Geral.VersaoDF := ve400;

    //Configurações NFE

     ACBrNFe1.Configuracoes.Arquivos.PathSalvar      := ExtractFilePath(ParamStr(0)) + 'NFce\';
     ACBrNFe1.Configuracoes.Arquivos.PathNfe        := ExtractFilePath(ParamStr(0)) + 'NFce\';
     ACBrNFe1.Configuracoes.Arquivos.PathSchemas    := ExtractFilePath(ParamStr(0)) + 'Schemas\Nfce';
     ACBrNFe1.Configuracoes.Arquivos.PathInu        := ExtractFilePath(ParamStr(0)) + 'Inu\';
     ACBrNFe1.Configuracoes.Arquivos.PathEvento     := ExtractFilePath(ParamStr(0)) + 'Evento\';



     if LeIni(ExtractFilePath(ParamStr(0)) + 'NFe.Ini', 'NFe', 'Ambiente') = 'Produção' then
        ACBrNFe1.Configuracoes.WebServices.Ambiente := taProducao
      else
        ACBrNFe1.Configuracoes.WebServices.Ambiente := taHomologacao;

      if LeIni(ExtractFilePath(ParamStr(0)) + 'NFe.Ini', 'Proxy', 'Host') <> '' then
        ACBrNFe1.Configuracoes.WebServices.ProxyHost := LeIni(ExtractFilePath(ParamStr(0)) + 'NFe.Ini', 'Proxy', 'Host')
      else
        ACBrNFe1.Configuracoes.WebServices.ProxyHost := '';

      if LeIni(ExtractFilePath(ParamStr(0)) + 'NFe.Ini', 'Proxy', 'Pass') <> '' then
        ACBrNFe1.Configuracoes.WebServices.ProxyPass := LeIni(ExtractFilePath(ParamStr(0)) + 'NFe.Ini', 'Proxy', 'Pass')
      else
        ACBrNFe1.Configuracoes.WebServices.ProxyPass := '';

      if LeIni(ExtractFilePath(ParamStr(0)) + 'NFe.Ini', 'Proxy', 'Porta') <> '' then
        ACBrNFe1.Configuracoes.WebServices.ProxyPort := LeIni(ExtractFilePath(ParamStr(0)) + 'NFe.Ini', 'Proxy', 'Porta')
      else
        ACBrNFe1.Configuracoes.WebServices.ProxyPort := '';

      if LeIni(ExtractFilePath(ParamStr(0)) + 'NFe.Ini', 'Proxy', 'User') <> '' then
        ACBrNFe1.Configuracoes.WebServices.ProxyUser := LeIni(ExtractFilePath(ParamStr(0)) + 'NFe.Ini', 'Proxy', 'User')
      else
        ACBrNFe1.Configuracoes.WebServices.ProxyUser := '';

        ACBrNFe1.Configuracoes.WebServices.UF           := QEmpresa.FieldByName('ESTADO').AsString;
        ACBrNFe1.Configuracoes.Certificados.NumeroSerie := LeIni(ExtractFilePath(ParamStr(0)) + 'NFe.Ini', 'Certificado', 'NumSerie');
        ACBrNFe1.Configuracoes.Certificados.Senha       := LeIni(ExtractFilePath(ParamStr(0)) + 'NFe.Ini', 'Certificado', 'Senha');
        ACBrNFe1.Configuracoes.Geral.IdCSC              := LeIni(ExtractFilePath(ParamStr(0)) + 'NFe.Ini', 'Certificado', 'IdCSC');
        ACBrNFe1.Configuracoes.Geral.CSC                := LeIni(ExtractFilePath(ParamStr(0)) + 'NFe.Ini', 'Certificado', 'CSC');

      if LeIni(ExtractFilePath(ParamStr(0)) + 'NFe.Ini', 'Certificado', 'Tipo Certificado') = 'A1' Then
      begin
       ACBrNFe1.Configuracoes.Geral.SSLCryptLib :=  cryOpenSSL;
       ACBrNFe1.Configuracoes.Geral.SSLLib      :=  libOpenSSL;
       ACBrNFe1.Configuracoes.Geral.SSLHttpLib  :=  httpOpenSSL;
       ACBrNFe1.Configuracoes.Certificados.ArquivoPFX := LeIni(ExtractFilePath(ParamStr(0)) + 'NFe.Ini', 'Certificado', 'Caminho');
       ACBrNFe1.Configuracoes.Certificados.ArquivoPFX := LeIni(ExtractFilePath(ParamStr(0)) + 'NFe.Ini', 'Certificado', 'Caminho');
      end
      else if LeIni(ExtractFilePath(ParamStr(0)) + 'NFe.Ini', 'Certificado', 'Tipo Certificado') = 'A3' Then
      Begin
      ACBrNFe1.Configuracoes.Geral.SSLCryptLib :=  cryWinCrypt;
      ACBrNFe1.Configuracoes.Geral.SSLLib      :=  libWinCrypt;
      ACBrNFe1.Configuracoes.Geral.SSLHttpLib  :=  httpWinHttp;
      End
      else if LeIni(ExtractFilePath(ParamStr(0)) + 'NFe.Ini', 'Certificado', 'Tipo Certificado') = 'USB/TOKEN' Then
      Begin
      ACBrNFe1.Configuracoes.Geral.SSLCryptLib :=  cryWinCrypt;
      ACBrNFe1.Configuracoes.Geral.SSLLib      :=  libWinCrypt;
      ACBrNFe1.Configuracoes.Geral.SSLHttpLib  :=  httpWinHttp;
      End
      ELSE
      Begin
      ACBrNFe1.Configuracoes.Geral.SSLCryptLib :=  cryWinCrypt;
      ACBrNFe1.Configuracoes.Geral.SSLLib      :=  libWinCrypt;
      ACBrNFe1.Configuracoes.Geral.SSLHttpLib  :=  httpWinHttp;
      End;



  FrmPrincipal.QConfig_Nfiscal.Open;
  if not FrmPrincipal.QConfig_Nfiscal.IsEmpty then
  Begin

    if FrmPrincipal.QConfig_Nfiscal.FieldByName('TP_CERTIFICADO').AsString = 'A1' Then
    begin
     ACBrNFe1.Configuracoes.Geral.SSLCryptLib        := cryWinCrypt; //cryOpenSSL;
     ACBrNFe1.Configuracoes.Geral.SSLLib             := libWinCrypt; //libOpenSSL;
     ACBrNFe1.Configuracoes.Geral.SSLHttpLib         := httpWinHttp; //httpOpenSSL;
     ACBrNFe1.Configuracoes.Certificados.DadosPFX    := FrmPrincipal.QConfig_Nfiscal.FieldByName('CERTIFICADO').AsString;
     ACBrNFe1.Configuracoes.Certificados.Senha       := FrmPrincipal.QConfig_Nfiscal.FieldByName('SENHA_CERTIFICADO').AsString;
     ACBrNFe1.Configuracoes.Geral.IdCSC              := FrmPrincipal.QConfig_Nfiscal.FieldByName('IDCSC').AsString;
     ACBrNFe1.Configuracoes.Geral.CSC                := FrmPrincipal.QConfig_Nfiscal.FieldByName('CSC').AsString;
    end
    else if FrmPrincipal.QConfig_Nfiscal.FieldByName('TP_CERTIFICADO').AsString = 'A3' Then
    Begin
    ACBrNFe1.Configuracoes.Geral.SSLCryptLib :=  cryWinCrypt;
    ACBrNFe1.Configuracoes.Geral.SSLLib      :=  libCustom;
    ACBrNFe1.Configuracoes.Geral.SSLHttpLib  :=  httpindy;

    End
    else if FrmPrincipal.QConfig_Nfiscal.FieldByName('TP_CERTIFICADO').AsString = 'USB/TOKEN' Then
    Begin
    ACBrNFe1.Configuracoes.Geral.SSLCryptLib :=  cryWinCrypt;
    ACBrNFe1.Configuracoes.Geral.SSLLib      :=  libWinCrypt;
    ACBrNFe1.Configuracoes.Geral.SSLHttpLib  :=  httpWinHttp;
    ACBrNFe1.Configuracoes.Certificados.Senha       := FrmPrincipal.QConfig_Nfiscal.FieldByName('SENHA_CERTIFICADO').AsString;
    ACBrNFe1.Configuracoes.Geral.IdCSC              := FrmPrincipal.QConfig_Nfiscal.FieldByName('IDCSC').AsString;
    ACBrNFe1.Configuracoes.Geral.CSC                := FrmPrincipal.QConfig_Nfiscal.FieldByName('CSC').AsString;
    ACBrNFe1.Configuracoes.Certificados.NumeroSerie := FrmPrincipal.QConfig_Nfiscal.FieldByName('NUMERO').AsString;
    ACBrNFe1.Configuracoes.Certificados.DadosPFX   := '';

    End
    ELSE
    Begin
    ACBrNFe1.Configuracoes.Geral.SSLCryptLib :=  cryWinCrypt;
    ACBrNFe1.Configuracoes.Geral.SSLLib      :=  libWinCrypt;
    ACBrNFe1.Configuracoes.Geral.SSLHttpLib  :=  httpWinHttp;
    End;


  if FrmPrincipal.QConfig_Nfiscal.FieldByName('AMBIENTE').AsString = 'Produção' Then
   Begin
    Label5.Visible := True;
    Label5.Font.Color :=  clGreen ;
    Label5.Caption := 'Sitema em modo Produção';
   End
   Else
   Begin
    Label5.Visible    := True;
    Label5.Font.Color := clRed ;
    Label5.Caption    := 'Sitema em modo Homologação';

   End;



  End;



    //Danfe
    ACBrNfeDANFceFortes1.Email                       := QEmpresa.FieldByName('EMAIL').AsString;
    //ACBrNfeDANFceFortes1.Fax                         := QEmpresa.FieldByName('TELEFONE').AsString;
    ACBrNfeDANFceFortes1.Site                        := QEmpresa.FieldByName('URL').AsString;
    ACBrNfeDANFceFortes1.Usuario                     := QEmpresa.FieldByName('RAZAO').AsString;
    ACBrNfeDANFceFortes1.PathPDF                     := ExtractFilePath(ParamStr(0)) + 'PDf\';
    ACBrNfeDANFceFortes1.Sistema                     := 'Eficaz Atumomação e Sistemas (38)-37411478';


 Dtmai.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
 Dtmen.Date := Ult_Dia_Mes(date);

  QNfce_Recebidas.Close;
  QNfce_Recebidas.Params[0].AsDate := Dtmai.Date;
  QNfce_Recebidas.Params[1].AsDate := Dtmen.Date;
  QNfce_Recebidas.Prepare;
  QNfce_Recebidas.Open();

  QNfce_Enviadas.Close;
  QNfce_Enviadas.Params[0].AsDate := Dtmai.Date;
  QNfce_Enviadas.Params[1].AsDate := Dtmen.Date;
  QNfce_Enviadas.Prepare;
  QNfce_Enviadas.Open();


  QNfce_Erro.SQL.Clear;
  QNfce_Erro.SQL.Add('SELECT TRANSACOES.TRANSACAO_ID,DT_TRANS,HORA,SERIE,NUM_DOC,CHAVE_NFE CHAVE_NFCE,');
  QNfce_Erro.SQL.Add('TRANSACOES.VALOR,TRANSACAO_ORIGEM');
  QNfce_Erro.SQL.Add('FROM TRANSACOES');
  QNfce_Erro.SQL.Add('WHERE DT_TRANS BETWEEN :DT_INICIO AND :DT_FIM');
  QNfce_Erro.SQL.Add('AND MODELO = :MODELO');
  QNfce_Erro.SQL.Add('AND TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM  COMPL_NFCEFISCAL');
  QNfce_Erro.SQL.Add('WHERE DT_SAIDA BETWEEN :DT_INICIO AND :DT_FIM )');
  QNfce_Erro.SQL.Add('ORDER BY TRANSACOES.TRANSACAO_ID');
  QNfce_Erro.Params[0].AsDate   := Dtmai.Date;
  QNfce_Erro.Params[1].AsDate   := Dtmen.Date;
  QNfce_Erro.Params[2].AsString := '65';

  QNfce_Erro.Prepare;
  QNfce_Erro.Open;

  QNfce_Erro.First;

  while not QNfce_Erro.Eof do
  begin
   Fdac_Temp.Append;

   Fdac_Temp.FieldByName('TRANSACAO_ID').AsInteger := QNfce_Erro.FieldByName('TRANSACAO_ID').AsInteger;
   Fdac_Temp.FieldByName('DATA').AsDateTime        := QNfce_Erro.FieldByName('DT_TRANS').AsDateTime;
   Fdac_Temp.FieldByName('HORA').AsString          := QNfce_Erro.FieldByName('HORA').AsString;
   Fdac_Temp.FieldByName('ECF').AsString           := QNfce_Erro.FieldByName('SERIE').AsString;
   Fdac_Temp.FieldByName('NUM_DOC').AsString       := QNfce_Erro.FieldByName('NUM_DOC').AsString;
   Fdac_Temp.FieldByName('CHAVE_NFCE').AsString    := QNfce_Erro.FieldByName('CHAVE_NFCE').AsString;
   Fdac_Temp.FieldByName('VALOR').AsFloat          := QNfce_Erro.FieldByName('VALOR').AsFloat;
   Fdac_Temp.FieldByName('TRANSACAO_ORIGEM').AsInteger := QNfce_Erro.FieldByName('TRANSACAO_ORIGEM').AsInteger;


   Fdac_Temp.Post;

   QNfce_Erro.Next;

   Application.ProcessMessages;

  end;

  QNfce_Erro.SQL.Clear;
  QNfce_Erro.SQL.Add('SELECT TRANSACOES.TRANSACAO_ID,DT_TRANS,HORA,SERIE,NUM_DOC,CHAVE_NFE CHAVE_NFCE,');
  QNfce_Erro.SQL.Add('TRANSACOES.VALOR,TRANSACAO_ORIGEM');
  QNfce_Erro.SQL.Add('FROM TRANSACOES');
  QNfce_Erro.SQL.Add('WHERE DT_TRANS BETWEEN :DT_INICIO AND :DT_FIM');
  QNfce_Erro.SQL.Add('AND MODELO = :MODELO');
  QNfce_Erro.SQL.Add('AND TRANSACAO_ID IN (SELECT TRANSACAO_ID FROM  NOTAS_CANCELADAS_NFCE');
  QNfce_Erro.SQL.Add('WHERE DT_SAIDA BETWEEN :DT_INICIO AND :DT_FIM )');
  QNfce_Erro.SQL.Add('ORDER BY TRANSACOES.TRANSACAO_ID');
  QNfce_Erro.Params[0].AsDate   := Dtmai.Date;
  QNfce_Erro.Params[1].AsDate   := Dtmen.Date;
  QNfce_Erro.Params[2].AsString := '65';

  QNfce_Erro.Prepare;
  QNfce_Erro.Open;

  QNfce_Erro.First;
  while not QNfce_Erro.Eof do
  begin

  Fdac_Temp.Locate('TRANSACAO_ID', QNfce_Erro.FieldByName('TRANSACAO_ID').AsInteger, []);
  Fdac_Temp.Delete;
  QNfce_Erro.Next;

  end;

  Fdac_Temp.Open;


end;

procedure TFrmControle_Nfce.ImprimirNfce1Click(Sender: TObject);
begin
 if QNfce_Enviadas.FieldByName('ARQUIVO_XML').AsString = '' then
 Begin

  OpenDialog1.Title      := 'Selecione a NFE';
  OpenDialog1.DefaultExt := '*-nfe.XML';
  OpenDialog1.Filter     := 'Arquivos NFE (*-nfe.XML)|*-nfe.XML|Arquivos XML (*.XML)|*.XML|Todos os Arquivos (*.*)|*.*';
  OpenDialog1.InitialDir := FrmPrincipal.ACBrNFe1.Configuracoes.Arquivos.PathNFe;


  if OpenDialog1.Execute then
  begin

    FrmPrincipal.ACBrNFe1.NotasFiscais.Clear;
    FrmPrincipal.ACBrNFe1.NotasFiscais.LoadFromFile(OpenDialog1.FileName);

    if copy(OpenDialog1.FileName,Length(OpenDialog1.FileName) -9, Length(OpenDialog1.FileName)) = 'nfeDFe.xml' then
    FrmPrincipal.ACBrNFe1.NotasFiscais.ImprimirCancelado
    Else
    FrmPrincipal.ACBrNFe1.NotasFiscais.Imprimir;

  end;

 End;
 Begin

    FrmPrincipal.ACBrNFe1.NotasFiscais.Clear;
    FrmPrincipal.ACBrNFe1.NotasFiscais.LoadFromString(QNfce_Enviadas.FieldByName('ARQUIVO_XML').AsString);
    FrmPrincipal.ACBrNFe1.DANFE := FrmPrincipal.ACBrNFeDANFCeFortes1;
    FrmPrincipal.ACBrNFe1.NotasFiscais.Imprimir;
 End;

 //FrmPrincipal.ACBrNFe1.DANFE := FrmPrincipal.ACBrNFeDANFeRL1;

end;

procedure TFrmControle_Nfce.QNfce_EnviadasAfterOpen(DataSet: TDataSet);
begin
TFloatField(QNfce_Enviadas.FieldByName('VALOR')).DisplayFormat  := '#,##0.00';
end;

procedure TFrmControle_Nfce.QNfce_Enviadasarquivo_xmlGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
Text := EmptyStr;
end;

procedure TFrmControle_Nfce.QNfce_ErroAfterOpen(DataSet: TDataSet);
begin
TFloatField(QNfce_Erro.FieldByName('VALOR')).DisplayFormat  := '#,##0.00';
end;

procedure TFrmControle_Nfce.QNfce_RecebidasAfterOpen(DataSet: TDataSet);
begin
TFloatField(QNfce_Recebidas.FieldByName('VALOR')).DisplayFormat  := '#,##0.00';
end;

procedure TFrmControle_Nfce.QNfce_Recebidasarquivo_xmlGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
Text := EmptyStr;
end;

end.
