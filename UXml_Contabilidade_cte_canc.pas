unit UXml_Contabilidade_cte_canc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, rxToolEdit, ZipMstr, DB,
  IBCustomDataSet, IBQuery, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,System.zip,FileCtrl;

type
  TFrmXml_Contabilidade_cte_cancelada = class(TForm)
    Label1: TLabel;
    Dtmen: TDateEdit;
    Dtmai: TDateEdit;
    Bevel1: TBevel;
    btnExecuta: TBitBtn;
    btnRetorna: TBitBtn;
    QNotas: TFDQuery;
    OpenDialog1: TOpenDialog;
    procedure btnRetornaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DtmenEnter(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
  private
    { Private declarations }
    procedure procura;
  public
    { Public declarations }
  end;

var
  FrmXml_Contabilidade_cte_cancelada: TFrmXml_Contabilidade_cte_cancelada;
  ZipFile: TZipFile;
  dir,dest_dir:string;

implementation

uses
  UPrincipal, UData;

{$R *.dfm}

procedure TFrmXml_Contabilidade_cte_cancelada.Procura;

begin
  QNotas.Sql.Clear;
  QNotas.Sql.Add('SELECT * FROM CTES_CANCELADAS');
  QNotas.Sql.Add('WHERE');
  QNotas.Sql.Add('(DT_SAIDA BETWEEN :DT_INICIAL AND :DT_FINAL) AND (RECIBO <> :INUTILIZADA)');

  QNotas.Sql.Add('ORDER BY NO_DOC_FISCAL');

  QNotas.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
  QNotas.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
  QNotas.ParamByName('INUTILIZADA').AsString  := 'INUTILIZADA';

  QNotas.Prepare;
  QNotas.Open;


  QNotas.First;
  while not QNotas.Eof do
  begin

   if QNotas.FieldByName('ARQUIVO_XML').AsString <> '' then
   Begin
   FrmPrincipal.ACBrCTE1.Conhecimentos.Clear;
   FrmPrincipal.ACBrCTE1.Conhecimentos.LoadFromString(QNotas.FieldByName('ARQUIVO_XML').AsString,True);
   FrmPrincipal.ACBrCTE1.Conhecimentos.GravarXML(FrmPrincipal.ACBrCTE1.Configuracoes.Arquivos.PathCTe +'\'+ QNotas.FieldByName('CHAVE_NFE').AsString + '-cte.Xml' );
   End;

   QNotas.Next;

  end;


  QNotas.First;
  while not QNotas.Eof do
  begin

    if   FileExists(FrmPrincipal.ACBrCte1.Configuracoes.Arquivos.Pathcte +'\' + QNotas.FieldByName('CHAVE_NFE').AsString + '-cte.Xml') then
   // FileExists(ExtractFilePath(ParamStr(0)) + 'NFe\' + QNotas.FieldByName('CHAVE_NFE').AsString + '-nfe.Xml') then
      ZipFile.Add(FrmPrincipal.ACBrCte1.Configuracoes.Arquivos.Pathcte +'\' + QNotas.FieldByName('CHAVE_NFE').AsString + '-cte.Xml');

    Application.ProcessMessages;
    QNotas.Next;
  end;


  QNotas.First;
  while not QNotas.Eof do
  begin
    DeleteFile(FrmPrincipal.ACBrcte1.Configuracoes.Arquivos.Pathcte +'\' + QNotas.FieldByName('CHAVE_NFE').AsString + '-cte.Xml');
    QNotas.Next;
  end;

end;

procedure TFrmXml_Contabilidade_cte_cancelada.btnExecutaClick(Sender: TObject);
begin

   DIR := FrmPrincipal.ACBrcte1.Configuracoes.Arquivos.Pathcte;
   OpenDialog1.InitialDir := DIR;

   if  (OpenDialog1.Execute)  then
   //if SelectDirectory(Dir,[sdAllowCreate, sdPerformCreate, sdPrompt],0) then
   Begin
     dir := OpenDialog1.FileName;

     ZipFile := TZipFile.Create;
   // ZipFile.
   // ZipMaster1.TempDir      := ExtractFilePath(ParamStr(0));
   // ZipMaster1.SFXPath      := ExtractFilePath(ParamStr(0)) + 'ZipSFX.bin';
   // ZipMaster1.DLLDirectory := ExtractFilePath(ParamStr(0));
   // ZipMaster1. ZipFileName  := ExtractFilePath(ParamStr(0)) + 'Bck_Nfe_' + FormatDateTime('ddmmyyyy', Dtmen.Date) + '_' + FormatDateTime('ddmmyyyy', Dtmen.Date) + '.Zip';

    //Application.MessageBox('Selecione o local destino do arquivo.', PChar(Msg_Title), MB_ICONINFORMATION);
    //if SelectDirectory(dest_dir,[sdAllowCreate, sdPerformCreate, sdPrompt],0) then
    ZipFile.Open(DIR + '_' + FormatDateTime('ddmmyyyy', Dtmen.Date) + '.Zip',zmWrite);
   // ZipMaster1.FSpecArgs.Clear;


    Procura;

    if not QNotas.IsEmpty then
    begin

      if ZipFile.FileCount >= 1then
        Begin
        Application.MessageBox(PChar('Arquivo gerado com sucesso ('+ DIR + '_' + FormatDateTime('ddmmyyyy', Dtmen.Date) + '.Zip' + ')'), PChar(Msg_Title), mb_IconInformation);
        ZipFile.Free;
        End
      else
      Begin
        Application.MessageBox('Erro ao gerar arquivo, arquivo não encontrado. Tente novamente', PChar(Msg_Title), mb_IconStop);
         ZipFile.Free;
      End;
    end
    Else
    Begin
     Application.MessageBox('Não existem notas neste período', PChar(Msg_Title), MB_ICONINFORMATION);
     ZipFile.Free;
     DeleteFile(dir + '_' + FormatDateTime('ddmmyyyy', Dtmen.Date) + '.Zip');
    End;
   End;
   close;
end;

procedure TFrmXml_Contabilidade_cte_cancelada.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmXml_Contabilidade_cte_cancelada.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmXml_Contabilidade_cte_cancelada.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
   // Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmXml_Contabilidade_cte_cancelada.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmXml_Contabilidade_cte_cancelada.FormCreate(Sender: TObject);
begin
  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);
end;

end.
