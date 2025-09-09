unit UClientes_Ligth;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ComCtrls, ToolWin, StdCtrls, Grids, DBGrids, Tabs, ExtCtrls,
  DB, IBCustomDataSet, IBQuery, Mask, rxToolEdit, Buttons, rxCurrEdit,
  IBUpdateSQL, QRCtrls, QuickRpt, ExtDlgs, DBCtrls, jpeg,IdHashMessageDigest,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet;
                                 
type
  TFrmClientes_ligth = class(TForm)
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
    ATIVIDADE: TEdit;
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
    StatusBar2: TStatusBar;
    DataSeriais: TDataSource;
    DDD: TMaskEdit;
    Label63: TLabel;
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
    Repetir_Endereco: TCheckBox;
    btn_load_image: TButton;
    OpenImage: TOpenPictureDialog;
    Foto: TImage;
    Shape1: TShape;
    lbl2: TLabel;
    Limite_Cheque: TRxCalcEdit;
    QTabela: TFDQuery;
    IQuery: TFDQuery;
    QIbge: TFDQuery;
    Qautorizados: TFDQuery;
    QSeriais: TFDQuery;
    Usql_Seriais: TFDUpdateSQL;
    chk_0800: TCheckBox;
    TELEFONE_1: TMaskEdit;
    TabSheet5: TTabSheet;
    Anot_Inadimplencia: TRichEdit;
    btn_Incluir_Inadimplencia: TBitBtn;
    QInadimplencia: TFDQuery;
    Label26: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    funcionario_id: TCurrencyEdit;
    Contato: TEdit;
    Limite_cr: TRxCalcEdit;
    Label48: TLabel;
    Label49: TLabel;
    Label17: TLabel;
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
    procedure ibqryQSeriaisNewRecord(DataSet: TDataSet);
    procedure DDDChange(Sender: TObject);
    procedure Repetir_EnderecoClick(Sender: TObject);
    procedure btn_load_imageClick(Sender: TObject);
    procedure pgqryQAutorizadosBeforeEdit(DataSet: TDataSet);
    procedure pgqryQAutorizadosBeforePost(DataSet: TDataSet);
    procedure pgqryQAutorizadosNewRecord(DataSet: TDataSet);
    procedure QautorizadosBeforeEdit(DataSet: TDataSet);
    procedure QautorizadosBeforePost(DataSet: TDataSet);
    procedure QautorizadosNewRecord(DataSet: TDataSet);
    procedure QSeriaisBeforeEdit(DataSet: TDataSet);
    procedure QSeriaisNewRecord(DataSet: TDataSet);
    procedure chk_0800Click(Sender: TObject);
    procedure PageControl2DrawTab(Control: TCustomTabControl; TabIndex: Integer;
      const Rect: TRect; Active: Boolean);
    procedure FDEventAlerter1Alert(ASender: TFDCustomEventAlerter;
      const AEventName: string; const AArgument: Variant);
    procedure btn_Incluir_InadimplenciaClick(Sender: TObject);
    procedure TabSheet5Show(Sender: TObject);
    procedure QautorizadosAfterPost(DataSet: TDataSet);
    procedure QautorizadosAfterOpen(DataSet: TDataSet);
    
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
  end;

var
  FrmClientes_ligth: TFrmClientes_ligth;
  Operacao: String;
  ID: Integer;
  Tem_Anotacao, Is_Upload: Boolean;
  Imagem: TFileStream;
  Md5 : TIdHashMessageDigest5;


implementation

uses
  UPrincipal, UData, USeleciona_Clientes, UPesquisa, UConsulta,UAnot_Inadimplencia;

{$R *.dfm}

function LogEntry(Cmd, Msg: String; Dig: String): String;
begin
  Result := Format('%s%s' + '%s', [Cmd, Msg, Dig]);
end;


procedure TFrmClientes_ligth.VerificarInadimplencia;
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

procedure TFrmClientes_ligth.ConsultaCheque;
Begin
if QTabela.FieldByName('BLOQ_CHEQUE').AsString = 'SIM' then
  Begin

    Label63.Visible := True;
    Label63.Caption := 'Cliente com Bloqueio de Cheques!' ;
  End
  Else
    Label63.Visible := False;
End;

procedure TFrmClientes_ligth.licenca_liberada;
Begin

End;

procedure TFrmClientes_ligth.DetailSearch(Tabela: String);
begin
  if (Tabela = '') or (Tabela = 'IBGE') then
  begin
    QIBGE.Close;

    QIBGE.ParamByName('IBGE').AsString := IBGE.Text;

    QIBGE.Prepare;
    QIBGE.Open;
  end;
end;

procedure TFrmClientes_ligth.DT_FICHAEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmClientes_ligth.AlfabetoClick(Sender: TObject);
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

procedure TFrmClientes_ligth.Botoes_Editing;
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
  Btn_Incluir_Inadimplencia.enabled := True;
end;

procedure TFrmClientes_ligth.Botoes_Normal;
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
  btnDiscard.Enabled    := False;
  btnRetorna.Enabled    := True;
  btnImprime.Enabled    := True;
  btnPesquisa.Enabled   := True;
  btnIBGE.Enabled       := False;
  btnPais.Enabled       := False;
  btnComeca_Com.Enabled := True;
  Comeca_Com.Enabled    := True;
  Btn_Incluir_Inadimplencia.enabled := False;
  end;

procedure TFrmClientes_ligth.Habilitar(Status: Boolean);
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

    if Tem_Anotacao then
    begin
      if Temp is TMemo then
        TMemo(Temp).Enabled := Status;
    end;

    if STATUS then
    Bloqueado.Enabled := Caso(Copy(FrmData.QAcesso.FieldByName('OPCOES').AsString, 61, 1));
  end;
end;

procedure TFrmClientes_ligth.IBGEExit(Sender: TObject);
begin
  DetailSearch('IBGE');

  if Municipio.Text <> 'EXTERIOR' then
  Begin
  Municipio.Text := QIbge.FieldByName('DESCRICAO').AsString;
  Estado.Text    := QIbge.FieldByName('UF_SIGLA').AsString;
  Cod_Pais.Text  := '01058';
  End;
end;

procedure TFrmClientes_ligth.Insert;
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

procedure TFrmClientes_ligth.Edit;
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

function TFrmClientes_ligth.Validacao: Boolean;
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

  if (COD_PAIS.Text = '01058') and (FrmPrincipal.Config.FieldByName('SPED').AsString = 'True') then
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

    if (Operacao = 'Alterando') and (Alltrim(SemMascara(CNPJ.Text)) <> '') then
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
    if (Length(Telefone_1.Text) < 9) or (Pos('_',telefone_1.text) = 1)  then
    begin
      Application.MessageBox('Tefefone Inválido, Favor informar número do Telefone (xx) xxxx-xxxx!', PChar(Msg_Title), mb_IconStop);
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

          if ConsisteInscricaoEstadual(Alltrim(SemMascara(INSCRICAO.Text)), ESTADO.Text) = 1 then
          begin
            Application.MessageBox('Inscrição Estadual inválida', PChar(Msg_Title), mb_IconStop);
            INSCRICAO.Color := clYellow;
            INSCRICAO.SetFocus;
            exit;
          end;
        finally
          FreeLibrary(LibHandle);
        end;
      end;
    end;
  end;

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

  Result := True;
end;

procedure TFrmClientes_ligth.ManutencaoShow(Sender: TObject);
begin
  Set_Campos(False);
  Botoes_Normal;
  ConsultaCheque;
  licenca_liberada;
end;

procedure TFrmClientes_ligth.NOMEKeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmClientes_ligth.PageControl2DrawTab(Control: TCustomTabControl;
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
   4 :
   Begin
    if (QTabela.FieldByName('ANOTACOES').ASSTRING <> '')  then
    Control.Canvas.brush.Color:=clred
    Else
    Control.Canvas.brush.Color:=clScrollBar;
   End;
   5 : Control.Canvas.brush.Color:=clScrollBar;
   6 :
    Begin
    if (Not QInadimplencia.IsEmpty) then
    Control.Canvas.brush.Color:=clYellow
    Else
    Control.Canvas.brush.Color:=clScrollBar;
   End;
   7 :Control.Canvas.brush.Color:=clScrollBar;

  end;

  Control.Canvas.FillRect( Rect );

  PageControl2.canvas.font.color:=clblack;     //cor da aba do tabsheet

  Control.Canvas.TextOut(Rect.left+2,Rect.top+2,TTabSheet(PageControl2.Pages[tabindex]).Caption);

 End;
end;

procedure TFrmClientes_ligth.ibqryQAutorizadosBeforeEdit(DataSet: TDataSet);
begin
  if FrmData.QAcesso.FieldByName('ALTERACAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para alteração', PChar(Msg_Title), mb_IconStop);
    exit;
  end;
end;

procedure TFrmClientes_ligth.ibqryQAutorizadosBeforePost(DataSet: TDataSet);
begin
  if QAutorizados.FieldByName('NOME').AsString = '' then
  begin
    Application.MessageBox('Nome inválido', PChar(Msg_Title), mb_IconStop);

    Grid_Autorizados.SelectedIndex := 0;

    abort;
  end;
end;

procedure TFrmClientes_ligth.ibqryQAutorizadosNewRecord(DataSet: TDataSet);
begin
  DataSet['CLIENTE_ID']    := QTabela.FieldByName('CLIENTE_ID').AsInteger;
  DataSet['AUTORIZADO_ID'] := 0;
end;

procedure TFrmClientes_ligth.ibqryQSeriaisBeforeEdit(DataSet: TDataSet);
begin
  if FrmData.QAcesso.FieldByName('ALTERACAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para alteração', PChar(Msg_Title), mb_IconStop);
    exit;
  end;
end;

procedure TFrmClientes_ligth.ibqryQSeriaisNewRecord(DataSet: TDataSet);
begin
  DataSet['CLIENTE_ID'] := QTabela.FieldByName('CLIENTE_ID').AsInteger;
end;

procedure TFrmClientes_ligth.pgqryQAutorizadosBeforeEdit(DataSet: TDataSet);
begin
  if FrmData.QAcesso.FieldByName('ALTERACAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para alteração', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

end;

procedure TFrmClientes_ligth.pgqryQAutorizadosBeforePost(DataSet: TDataSet);
begin
  if QAutorizados.FieldByName('NOME').AsString = '' then
  begin
    Application.MessageBox('Nome inválido', PChar(Msg_Title), mb_IconStop);

    Grid_Autorizados.SelectedIndex := 0;

    abort;
  end;

end;

procedure TFrmClientes_ligth.pgqryQAutorizadosNewRecord(DataSet: TDataSet);
begin
  DataSet['CLIENTE_ID']    := QTabela.FieldByName('CLIENTE_ID').AsInteger;
  DataSet['AUTORIZADO_ID'] := 0;
end;

procedure TFrmClientes_ligth.QautorizadosAfterOpen(DataSet: TDataSet);
begin
TFloatField(QAutorizados.FieldByName('DT_NASCIMENTO')).EditMask    :='!99/99/0000;1;_';
end;

procedure TFrmClientes_ligth.QautorizadosAfterPost(DataSet: TDataSet);
begin
 if FrmData.QAcesso.FieldByName('ALTERACAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para alteração', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

end;

procedure TFrmClientes_ligth.QautorizadosBeforeEdit(DataSet: TDataSet);
begin
  if FrmData.QAcesso.FieldByName('ALTERACAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para alteração', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

end;

procedure TFrmClientes_ligth.QautorizadosBeforePost(DataSet: TDataSet);
begin
  if QAutorizados.FieldByName('NOME').AsString = '' then
  begin
    Application.MessageBox('Nome inválido', PChar(Msg_Title), mb_IconStop);

    Grid_Autorizados.SelectedIndex := 0;

    abort;
  end;

end;

procedure TFrmClientes_ligth.QautorizadosNewRecord(DataSet: TDataSet);
begin
  DataSet['CLIENTE_ID']    := QTabela.FieldByName('CLIENTE_ID').AsInteger;
  DataSet['AUTORIZADO_ID'] := 0;
end;

procedure TFrmClientes_ligth.QSeriaisBeforeEdit(DataSet: TDataSet);
begin
  if FrmData.QAcesso.FieldByName('ALTERACAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para alteração', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

end;

procedure TFrmClientes_ligth.QSeriaisNewRecord(DataSet: TDataSet);
begin
  DataSet['CLIENTE_ID'] := QTabela.FieldByName('CLIENTE_ID').AsInteger;
end;

procedure TFrmClientes_ligth.Set_Campos(Vazio: Boolean);
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

      try
        QSeriais.Close;

        QSeriais.ParamByName('CLIENTE_ID').AsInteger := 0;

        QSeriais.Prepare;
        QSeriais.Open;
      except

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

      if QTabela.FieldByName('TIPO_CLIENTE').AsString = 'PESSOA JURÍDICA' then
        CNPJ.EditMask := '99.999.999/9999-99;1;_'
      else
        CNPJ.EditMask := '999.999.999-99;1;_';


      if Tem_Anotacao then
      begin
        if Temp is TMemo then
          TMemo(Temp).Text := QTabela.FieldByName(TMemo(Temp).Name).AsString;
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

      end;

      try
        QSeriais.Close;

        QSeriais.ParamByName('CLIENTE_ID').AsInteger := QTabela.FieldByName('CLIENTE_ID').AsInteger;

        QSeriais.Prepare;
        QSeriais.Open;
      except

      end;


    end;
  end;

  if QTabela.IsEmpty then
    Grid_Autorizados.Enabled := False
  else
    Grid_Autorizados.Enabled := True;

  VerificarInadimplencia;

  If (QTabela.FieldByName('ANOTACOES').ASSTRING <> '') or (not QInadimplencia.IsEmpty) Then
    PageControl2.OwnerDraw := True
  Else
    PageControl2.OwnerDraw := False;

end;

procedure TFrmClientes_ligth.TabSheet5Show(Sender: TObject);
begin
  VerificarInadimplencia;

End;

procedure TFrmClientes_ligth.TIPO_CLIENTEChange(Sender: TObject);
begin
  if TIPO_CLIENTE.Text = 'PESSOA JURÍDICA' then
  begin
    CNPJ.EditMask := '99.999.999/9999-99;1;_';
    TabSheet3.TabVisible := False;
  end
  else
  begin
    CNPJ.EditMask := '999.999.999-99;1;_';
    TabSheet3.TabVisible := True;
  end;
end;

procedure TFrmClientes_ligth.TIPO_CLIENTEKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmClientes_ligth.btnComeca_ComClick(Sender: TObject);
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

procedure TFrmClientes_ligth.btnDeleteClick(Sender: TObject);
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
    

    IQuery.Sql.Clear;
    IQuery.Sql.Add('DELETE FROM CLIENTES');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(CLIENTE_ID = :ID)');

    IQuery.ParamByName('ID').AsInteger := QTabela.FieldByName('CLIENTE_ID').AsInteger;

    IQuery.Prepare;
    IQuery.ExecSql;



    QTabela.Close;

    Qtabela.Prepare;
    QTabela.Open;

    Set_Campos(False);
    Botoes_Normal;
  end;
end;

procedure TFrmClientes_ligth.btnDiscardClick(Sender: TObject);
begin
  Botoes_Normal;
  Set_Campos(False);
  Habilitar(False);
  Operacao := '';
  Consulta.TabVisible := True;
end;

procedure TFrmClientes_ligth.btnEditClick(Sender: TObject);
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


  if telefone_1.Text = '' then
  Telefone_1.EditMask := '9999-9999;1;_';


  NOME.SetFocus;
end;

procedure TFrmClientes_ligth.btnIBGEClick(Sender: TObject);
begin
  try
    IBGE.Text := IntToStr(GetConsulta('IBGE', 0, 0, StrToInt(IBGE.Text)));
  except
    IBGE.Text := IntToStr(GetConsulta('IBGE', 0, 0, 0));
  end;
end;

procedure TFrmClientes_ligth.btnImprimeClick(Sender: TObject);
begin
  Sel_Cli(QTabela.Sql.Text);
end;

procedure TFrmClientes_ligth.btnInsertClick(Sender: TObject);
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

  ESTADO.Text       := '  ';
  TIPO_CLIENTE.Text := 'PESSOA FÍSICA';
  CNPJ.EditMask     := '999.999.999-99;1;_';
  DT_FICHA.Date     := Date;


  Consulta.TabVisible := False;

  Telefone_1.EditMask := '9999-9999;1;_';

  Foto.Picture.Bitmap := NIL;
  NOME.SetFocus;
end;

procedure TFrmClientes_ligth.btnNextClick(Sender: TObject);
begin
  if not QTabela.Eof then
  begin

    QTabela.Next;
    Set_Campos(False);
    ConsultaCheque; 
  end;

  Botoes_Normal;
end;

procedure TFrmClientes_ligth.btnPaisClick(Sender: TObject);
begin
  try
    COD_PAIS.Text := StrZero(IntToStr(GetConsulta('PAISES', 0, 0, StrToInt(COD_PAIS.Text))), 5, 0);
  except
    COD_PAIS.Text := StrZero(IntToStr(GetConsulta('PAISES', 0, 0, 0)), 5, 0);
  end;
end;

procedure TFrmClientes_ligth.btnPesquisaClick(Sender: TObject);
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

procedure TFrmClientes_ligth.btnPriorClick(Sender: TObject);
begin
  if not QTabela.Bof then
  begin
     
    QTabela.Prior;
    Set_Campos(False);
    ConsultaCheque;

  end;

  Botoes_Normal;
end;

procedure TFrmClientes_ligth.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmClientes_ligth.btnSaveClick(Sender: TObject);
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

      CmdSelectNull := 'WHERE (CNPJ = :CNPJ)';
      CmdOrderBy    := 'ORDER BY CLIENTE_ID';

      QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

      QTabela.ParamByName('CNPJ').AsString := CNPJ.Text;

      QTabela.Prepare;
      QTabela.Open;
    end
    else
      Edit;

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

procedure TFrmClientes_ligth.btn_Incluir_InadimplenciaClick(Sender: TObject);
begin
Inadimplencia(QTabela.FieldByName('CLIENTE_ID').asInteger,FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger);
VerificarInadimplencia;
end;

procedure TFrmClientes_ligth.btn_load_imageClick(Sender: TObject);
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

procedure TFrmClientes_ligth.chk_0800Click(Sender: TObject);
begin
if chk_0800.Checked then
TELEFONE_1.EditMask := ''
else
TELEFONE_1.EditMask := '9999-9999;1;_';
end;

procedure TFrmClientes_ligth.Repetir_EnderecoClick(Sender: TObject);
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



procedure TFrmClientes_ligth.Comeca_ComEnter(Sender: TObject);
begin
  Comeca_Com.Text := '';
end;

procedure TFrmClientes_ligth.Comeca_ComKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    btnComeca_ComClick(Sender);
end;

procedure TFrmClientes_ligth.DBGrid1DblClick(Sender: TObject);
begin
  Manutencao.Show;
end;

procedure TFrmClientes_ligth.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmClientes_ligth.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Manutencao.Show;
end;

procedure TFrmClientes_ligth.DBGrid1TitleClick(Column: TColumn);
begin
  CmdOrderBy       := 'ORDER BY ' + Column.FieldName;
  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

  QTabela.Prepare;
  QTabela.Open;
end;

procedure TFrmClientes_ligth.DDDChange(Sender: TObject);
begin
if Copy((Sender as TMaskEdit).Text,3,1) >= '1'  then
    Perform(WM_NEXTDLGCTL,0,0);
end;

procedure TFrmClientes_ligth.FDEventAlerter1Alert(ASender: TFDCustomEventAlerter;
  const AEventName: string; const AArgument: Variant);
begin
showmessage ('Recebento evento do banco: ' + AEventName);
end;

procedure TFrmClientes_ligth.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmClientes_ligth.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (Operacao = 'Inserindo') or (Operacao = 'Alterando') then
  begin
    Application.MessageBox('É melhor salvar as alterações antes de continuar', PChar(Msg_Title), mb_IconStop);
    CanClose := False;
  end;
end;

procedure TFrmClientes_ligth.FormCreate(Sender: TObject);
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


    Foto.Visible := False;
    Shape1.Visible := False;
    btn_load_image.Visible := False;
    TIPO_CLIENTE.Left := 556;
    CNPJ.Left := 556;
    CONTATO.Left := 556;
    DT_FICHA.Left := 556;
    Label20.Left := 470;
    Label15.Left := 470;
    Label49.Left := 470;
    Label2.Left  := 470;
    Label17.Left  := 470;

{
  if FrmPrincipal.Config.FieldByName('EXIBE_FOTO').AsString = 'False' then
  Begin
    Foto.Visible := False;
    Shape1.Visible := False;
    btn_load_image.Visible := False;
    TIPO_CLIENTE.Left := 556;
    CNPJ.Left := 556;
    CONTATO.Left := 556;
    LIMITE.Left := 556;
    Tratamento.Left := 556;
    DT_FICHA.Left := 556;
    Label20.Left := 470;
    Label15.Left := 470;
    Label49.Left := 470;
    Label21.Left := 470;
    Label2.Left  := 470;
    Label17.Left  := 470;

  End
  else
  Begin
    Foto.Visible := True;
    Shape1.Visible := True;
    btn_load_image.Visible := True;
  End;
  }

  if FrmPrincipal.Config.FieldByName('SPED').AsString = 'False' then
  begin
    TELEFONE_1.EditMask  := '';
    TELEFONE_2.EditMask  := '';
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


  if FrmPrincipal.Config.FieldByName('OBJETO_ORDEM').AsString = 'Salão' Then
  Begin
  Label48.Visible := True;
  Limite_Cr.Visible := True;
  End
  Else
  Begin
  Label48.Visible := False;
  Limite_Cr.Visible := False;
  End;

  Consulta.Show;
  PageControl2.ActivePage := TabSheet1;

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

procedure TFrmClientes_ligth.FormShow(Sender: TObject);
begin
  DBGrid1.SetFocus;


end;

procedure TFrmClientes_ligth.Grid_AutorizadosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F4) and (QAutorizados.State = dsBrowse) and (not QAutorizados.IsEmpty) then
    QAutorizados.Delete;

  if Key = VK_F9 then
    Perform(Wm_NextDlgCtl, 0, 0);

  if ((Key = Vk_Up) or (Key = Vk_Down)) and (QAutorizados.State in [dsInsert, dsEdit]) then
    Key := 0;
end;

procedure TFrmClientes_ligth.Grid_AutorizadosKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Keybd_Event(VK_TAB, 0, 0, 0);
end;

procedure TFrmClientes_ligth.Grid_SeriaisKeyDown(Sender: TObject; var Key: Word;
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

end;

procedure TFrmClientes_ligth.Grid_SeriaisKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Keybd_Event(VK_TAB, 0, 0, 0);
end;

end.
