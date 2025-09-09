unit UQuiosque_Consulta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, RXCtrls, StdCtrls, Mask, rxToolEdit,
  rxCurrEdit, jpeg, ExtCtrls, ACBrBase, ACBrFala, IBDatabase, FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Moni.FlatFile, FireDAC.Comp.UI, FireDAC.Moni.Base,
  FireDAC.Moni.RemoteClient, FireDAC.Phys.PG,IdHashMessageDigest;

type
  TFrmConsulta_Preco = class(TForm)
    Image1: TImage;
    mDescricao: TLabel;
    mPreco: TLabel;
    mTotal: TLabel;
    GetProduto: TEdit;
    ACBrFala1: TACBrFala;
    Cabecalho: TLabel;
    Label_Cupom: TLabel;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    FDMoniRemoteClientLink1: TFDMoniRemoteClientLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDMoniFlatFileClientLink1: TFDMoniFlatFileClientLink;
    DbF_Eficaz: TFDConnection;
    QEmpresa: TFDQuery;
    qConfig: TFDQuery;
    QProduto: TFDQuery;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GetProdutoChange(Sender: TObject);
    procedure GetProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GetProdutoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsulta_Preco: TFrmConsulta_Preco;
  Md5 : TIdHashMessageDigest5;
  Arq_Ini:String;
  Procedure EnDecryptFile(pathin, pathout : String; Chave : Word);
  function WinVersion: string;


implementation

uses
  Funcoes, UConsulta_Quiosque;

{$R *.dfm}

function WinVersion: string;
var
  VersionInfo: TOSVersionInfo;
begin
  VersionInfo.dwOSVersionInfoSize:=SizeOf(VersionInfo);
  GetVersionEx(VersionInfo);
  Result:='';
  with VersionInfo do
  begin
    case dwPlatformId of
      1:
        case dwMinorVersion of
          0: Result:='Windows 95';
          10: Result:='Windows 98';
          90: Result:='Windows Me';
        end;
      2:
        case dwMajorVersion of
          3: Result:='Windows NT 3.51';
          4: Result:='Windows NT 4.0';
          5:
            case dwMinorVersion of
              0: Result:='Windows 2000';
              1: Result:='Windows XP';
            end;
        end;
    end;
   Result := INtToStr(dwPlatformId);
  end;
 // if (Result='') then
 //   Result:= 'Sistema operacional desconhecido.';
end;

Procedure EnDecryptFile(pathin, pathout : String; Chave : Word);
var
   InMS, OutMS : TMemoryStream;
   I : Integer;
   C : byte;
begin
  InMS := TMemoryStream.Create;
  OutMS := TMemoryStream.Create;

    try
        InMS.LoadFromFile(pathin);
        InMS.Position := 0;

        for I := 0 to InMS.Size - 1 do
          begin
              InMS.Read(C, 1);
              C := (C xor not(ord(chave shr I)));
              OutMS.Write(C,1);
          end;

          OutMS.SaveToFile(pathout);

   finally

       InMS.Free;
       OutMS.Free;
   end;
end;


procedure TFrmConsulta_Preco.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    Close;
end;

procedure TFrmConsulta_Preco.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmConsulta_Preco.FormCreate(Sender: TObject);
var
senha:string;
begin
   FDPhysPgDriverLink1.VendorLib := ExtractFilePath(ParamStr(0))+ '\DllsPG\libpq.dll';

   DbF_Eficaz.Connected := False;

   DbF_Eficaz.Params.Clear;



   Md5 :=  TIdHashMessageDigest5.Create;
  { If (WinVersion = '1') and (Copy((ExtractFilePath(ParamStr(0))),1,11) = 'C:\Eficaz7\')   Then
   Begin
   EnDecryptFile(ExtractFilePath(ParamStr(0)) + 'Eficaz.ini' , 'c:\Windows\System32\' +  Copy(DateToStr(date),1,2) + Copy(DateToStr(date),4,2) + Copy(DateToStr(date),7,4)   + 'P.sys' ,39);
   Arq_Ini          := 'c:\Windows\System32\' + LeIni(Arq_Ini, 'Conexão Postgres', 'Server Name') + Copy(DateToStr(date),1,2) + Copy(DateToStr(date),4,2) + Copy(DateToStr(date),7,4)  + 'P.sys';
   // Arq_Ini          :=  ExtractFilePath(ParamStr(0)) + 'Eficaz.ini';
   End
   Else
   Begin
   EnDecryptFile(ExtractFilePath(ParamStr(0)) + 'Eficaz.ini' , ExtractFilePath(ParamStr(0)) + '\Cce\' + Copy(DateToStr(date),1,2) + Copy(DateToStr(date),4,2) + Copy(DateToStr(date),7,4) +  'P.sys' ,39);
   Arq_Ini          := ExtractFilePath(ParamStr(0)) + '\Cce\' + LeIni(Arq_Ini, 'Conexão Postgres', 'Server Name')  + Copy(DateToStr(date),1,2) + Copy(DateToStr(date),4,2) + Copy(DateToStr(date),7,4)  +  'P.sys';
   End; }

   Arq_Ini          := ExtractFilePath(ParamStr(0))+ 'Eficaz.ini';



   Senha := 'EficazArilmaq'; //MD5.HashStringAsHex('BANCO DE DADOS CLENIO BARROS' + Copy(DateToStr(date), 1, 2) + Copy(DateToStr(date), 4, 2) + Copy(DateToStr(date), 7, 4));



  TRY



      if (LeIni(Arq_Ini, 'Conexão Postgres', 'User Name') <> '') and (LeIni( Arq_Ini, 'Conexão Postgres', 'Password') <> '') then
      Begin


         DbF_Eficaz.Params.Clear;
         DbF_Eficaz.Params.Add('Database= ' +  LeIni(Arq_Ini, 'Conexão Postgres', 'Base Name'));
         DbF_Eficaz.Params.Add('User_Name= ' + DecryptMsg(LeIni(Arq_Ini, 'Conexão Postgres', 'User Name'),3));
         DbF_Eficaz.Params.Add('Password= ' + DecryptMsg(LeIni(Arq_Ini, 'Conexão Postgres', 'Password'),3));
         DbF_Eficaz.Params.Add('Server= ' +  LeIni(Arq_Ini, 'Conexão Postgres', 'Server Name'));
         DbF_Eficaz.Params.Add('Port= ' +  LeIni(Arq_Ini, 'Conexão Postgres', 'Porta'));
         DbF_Eficaz.Params.Add('MonitorBy=Remote');
         DbF_Eficaz.Params.Add('DriverID=PG');

      End
      else
      begin

         DbF_Eficaz.Params.Clear;
         DbF_Eficaz.Params.Add('Database= ' +  LeIni(Arq_Ini, 'Conexão Postgres', 'Base Name'));
         DbF_Eficaz.Params.Add('User_Name= postgres');
         DbF_Eficaz.Params.Add('Password=' + senha );
         DbF_Eficaz.Params.Add('Server= ' +  LeIni(Arq_Ini, 'Conexão Postgres', 'Server Name'));
         DbF_Eficaz.Params.Add('Port= ' +  LeIni(Arq_Ini, 'Conexão Postgres', 'Porta'));
         DbF_Eficaz.Params.Add('MonitorBy=Custom');
         DbF_Eficaz.Params.Add('DriverID=PG');

      end;

      // ShowMessage(DbF_Eficaz.Params.Text);

         DbF_Eficaz.Connected := True;
       //  GravaIni(Arq_Ini, 'Conexão', 'Password',EncryptMsg(senha,9));
  except

  END;
end;

procedure TFrmConsulta_Preco.FormShow(Sender: TObject);
begin
  AcbrFala1.OrigemArquivos := ExtractFilePath(ParamStr(0)) + 'Sons\';

  QEmpresa.Prepare;
  QEmpresa.Open;

  Cabecalho.Caption := QEmpresa.FieldByName('RAZAO').AsString + #13 +
                       QEmpresa.FieldByName('ENDERECO').AsString + ', ' + QEmpresa.FieldByName('NUMERO').AsString + '  -  ' + QEmpresa.FieldByName('BAIRRO').AsString + '  -  ' +
                       QEmpresa.FieldByName('MUNICIPIO').AsString + '-' + QEmpresa.FieldByName('ESTADO').AsString + '  -  ' + QEmpresa.FieldByName('CEP').AsString + #13 +
                       'CNPJ: ' + QEmpresa.FieldByName('CNPJ').AsString + '    IE: ' + QEmpresa.FieldByName('INSCR_ESTADUAL').AsString;

  GetProduto.SetFocus;
end;

procedure TFrmConsulta_Preco.GetProdutoChange(Sender: TObject);
begin
  mDescricao.Caption := GetProduto.Text;
end;

procedure TFrmConsulta_Preco.GetProdutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);

  if Key = Vk_F7 then
  begin
    GetProduto.Text := GetConsulta;

    if GetProduto.Text <> '' then    
      Keybd_Event(VK_RETURN, 0, 0, 0);
  end;

  if KEY = VK_F11 then
       Application.MessageBox(PChar('Dados complementares do Produto.' + #13 +
                                         'Localização: ' + (QProduto.FieldByName('LOCALIZACAO').AsString) + #13 +
                                         'Aplicação: ' +  (QProduto.FieldByName('APLICACAO').AsString) + #13  +
                                         'Unidade de Venda: ' + (QProduto.FieldByName('UNIDADE_VENDA').AsString)),'Sistema Eficaz', MB_IconStop + MB_OK);



end;

procedure TFrmConsulta_Preco.GetProdutoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    GetProduto.Enabled := False;

    try
      QConfig.Close;
      QConfig.Prepare;
      QConfig.Open;

      QProduto.Sql.Clear;
      QProduto.Sql.Add('SELECT  PRODUTOS.*, TABELAS.DESCRICAO LOCALIZACAO');
      QProduto.Sql.Add('FROM PRODUTOS');
      QProduto.Sql.Add('LEFT JOIN TABELAS ON TABELAS.TABELA_ID = PRODUTOS.LOCALIZACAO_ID');
      QProduto.Sql.Add('WHERE');
      QProduto.Sql.Add('TABELAS.TIPO_TABELA = :TIPO_TABELA');
      QProduto.Sql.Add('AND (COD_BARRA = :COD_BARRA OR COD_BARRA_AUX1 = :COD_BARRA OR COD_BARRA_AUX2 = :COD_BARRA OR COD_BARRA_AUX3 = :COD_BARRA OR COD_BARRA_AUX4 = :COD_BARRA OR CODRED = :CODRED OR COD_ORIGINAL = :COD_ORIGINAL)');

      QProduto.ParamByName('COD_BARRA').AsString       := StrZero(GetProduto.Text, QConfig.FieldByName('TAM_BARRAS').AsInteger, 0);
      QProduto.ParamByName('CODRED').AsString          := StrZero(Copy(GetProduto.Text, 1, QConfig.FieldByName('TAM_PESAVEIS').AsInteger), QConfig.FieldByName('TAM_PESAVEIS').AsInteger, 0);
      QProduto.ParamByName('COD_ORIGINAL').AsString    := GetProduto.Text;
      QProduto.ParamByName('TIPO_TABELA').AsString     := '8';

      QProduto.Prepare;
      QProduto.Open;




      if QProduto.IsEmpty then
      begin
        mDescricao.Caption := 'Código Inexistente';
        mPreco.Caption     := '';
        mTotal.Caption     := '';

        Application.ProcessMessages;
        Sleep(2000);

        GetProduto.Enabled := True;
        GetProduto.SetFocus;
      end
      else
      begin
        mDescricao.Caption := Alltrim(QProduto.FieldByName('DESCRICAO').AsString);
        mPreco.Caption     := FormatFloat('#,##0.00', QProduto.FieldByName('PRECO_VAREJO').AsFloat);
        mTotal.Caption     := FormatFloat('#,##0.00', QProduto.FieldByName('PRECO_VAREJO').AsFloat);

        if (LeIni(Arq_Ini, 'Quiosque', 'Dados') = 'True') then
        Application.MessageBox(PChar('Dados complementares do Produto.' + #13 +
                                         'Localização: ' + (QProduto.FieldByName('LOCALIZACAO').AsString) + #13 +
                                         'Aplicação: ' +  (QProduto.FieldByName('APLICACAO').AsString) + #13  +
                                         'Quantidade: ' +  FormatFloat('#,##0.00', QProduto.FieldByName('QUANTIDADE_C').AsFloat) + #13  +
                                         'Unidade de Venda: ' + (QProduto.FieldByName('UNIDADE_VENDA').AsString)),'Sistema Eficaz', MB_ICONINFORMATION + MB_OK);


        Application.ProcessMessages;
        
        if (QProduto.FieldByName('PRECO_VAREJO').AsFloat > 0) AND (LeIni(Arq_Ini, 'Quiosque', 'Som') = 'True') then
        begin
          ACBrFala1.ValorFalar := QProduto.FieldByName('PRECO_VAREJO').AsFloat;
          ACBrFala1.Falar;
        end;

        if LeIni(Arq_Ini, 'Quiosque', 'Espera') <> '' then
        Sleep(StrToInt(LeIni(Arq_Ini, 'Quiosque', 'Espera')))
        Else
        Sleep(2000);

      end;
    finally
      GetProduto.Text    := '';
      mDescricao.Caption := 'Consulte o Preço do Produto Aqui';
      mPreco.Caption     := '';
      mTotal.Caption     := '';
      GetProduto.Enabled := True;
      GetProduto.SetFocus;
    end;
  end;
end;

end.
