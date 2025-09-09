unit UMde;

interface                                                 

uses                                       
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DBCtrls, rxCurrEdit, Mask, rxToolEdit, DB,
  IBCustomDataSet, IBQuery, Math, Buttons, IniFiles, Menus, IBStoredProc,
  ComCtrls, Grids, DBGrids, IBUpdateSQL, RDprint, Tabs,ACBrMDFe,
  ACBrMDFeDAMDFeClass,ACBrBase, ACBrDFe,pmdfeConversaoMDFe, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet, QRCtrls, QuickRpt;



type
  TFrmMde = class(TForm)
    DataNotas: TDataSource;
    Bevel1: TBevel;
    PageControl1: TPageControl;
    Consulta: TTabSheet;
    Manutencao: TTabSheet;
    Label3: TLabel;
    Label46: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label17: TLabel;
    Label33: TLabel;
    Label36: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    lbl1: TLabel;
    btnIBGE: TSpeedButton;
    Label15: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Bevel5: TBevel;
    Label28: TLabel;
    Bevel8: TBevel;
    Label29: TLabel;
    Label30: TLabel;
    Bevel9: TBevel;
    Bevel6: TBevel;
    DT_SAIDA: TDateEdit;
    TARA: TRxCalcEdit;
    NO_DOC_FISCAL: TCurrencyEdit;
    FORMA_EMISSAO: TComboBox;
    Empresa_id: TCurrencyEdit;
    TIPO_TRANSPORTE: TComboBox;
    DT_PREVISAO: TDateEdit;
    HR_PREVISAO: TMaskEdit;
    Grid_Notas: TDBGrid;
    StatusBar2: TStatusBar;
    NOME_TRANSPORTADOR: TEdit;
    PLACA_VEICULO: TEdit;
    INSCRICAO_TRANSPORTADOR: TEdit;
    UF_VEICULO: TComboBox;
    UF_TRANSPORTADOR: TComboBox;
    CNPJ_TRANSPORTADOR: TEdit;
    CIOT: TEdit;
    IBGE_CARREGA: TEdit;
    TIPO_VEICULO: TComboBox;
    SERIE: TEdit;
    MODELO: TEdit;
    TIPO_EMITENTE: TComboBox;
    UF_CARREGA: TComboBox;
    UF_DESCARREGA: TComboBox;
    btnPrior: TBitBtn;
    btnNext: TBitBtn;
    btnInsert: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    btnSave: TBitBtn;
    btnDiscard: TBitBtn;
    HR_SAIDA: TMaskEdit;
    municipio_carrega: TComboBox;
    RNTRC: TEdit;
    ListBox1: TListBox;
    DBGrid1: TDBGrid;
    DataTabela: TDataSource;
    Panel1: TPanel;
    btnGera: TButton;
    btnRetorna: TBitBtn;
    Valor_carga: TRxCalcEdit;
    Label2: TLabel;
    Label4: TLabel;
    Peso_Carga: TRxCalcEdit;
    Dias: TTabSet;
    Unidade: TComboBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    STATUS: TEdit;
    Label11: TLabel;
    Chave_Mdf: TEdit;
    Label13: TLabel;
    Bevel3: TBevel;
    Grid_Notas_Uf: TDBGrid;
    StatusBar1: TStatusBar;
    Datauf: TDataSource;
    ListBox2: TListBox;
    btnPesquisa: TBitBtn;
    QSearch: TFDQuery;
    iquery: TFDQuery;
    QCfop: TFDQuery;
    QTabela: TFDQuery;
    QDetalhe: TFDQuery;
    QNotas: TFDQuery;
    Qnotas_uf: TFDQuery;
    usql_uf: TFDUpdateSQL;
    usql_notas: TFDUpdateSQL;
    instrucoes: TMemo;
    btnImprime: TBitBtn;
    RDprint1: TRDprint;
    Rel_MdeFiscal: TQuickRep;
    QRBand1: TQRBand;
    QRSysData1: TQRSysData;
    Cabec: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    QRDBText3: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape3: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRBand2: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText5: TQRDBText;
    Grid_Notas_Motorista: TDBGrid;
    QNotas_Motorista: TFDQuery;
    DataMotorista: TDataSource;
    USql_Motorista: TFDUpdateSQL;
    StatusBar3: TStatusBar;
    procedure DT_SAIDAKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CNPJ_TRANSPORTADORKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnGeraClick(Sender: TObject);
    procedure CFOP_COMPLExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFornecedorClick(Sender: TObject);
    procedure DT_SAIDAEnter(Sender: TObject);
    procedure GerarXMLClick(Sender: TObject);
    procedure QNotasNewRecord(DataSet: TDataSet);
    procedure Grid_NotasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Grid_NotasKeyPress(Sender: TObject; var Key: Char);
    procedure QNotasBeforeEdit(DataSet: TDataSet);
    procedure QNotasBeforePost(DataSet: TDataSet);
    procedure COND_PAGTOExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DT_SAIDAExit(Sender: TObject);
    procedure btnIBGEClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure btnPriorClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnDiscardClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnRetornaClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UF_CARREGAExit(Sender: TObject);
    procedure Grid_NotasExit(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure ManutencaoShow(Sender: TObject);
    procedure DiasClick(Sender: TObject);
    procedure Grid_NotasEnter(Sender: TObject);
    procedure Grid_NotasColExit(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure QNotas_UFAfterPost(DataSet: TDataSet);
    procedure QNotas_UFBeforeEdit(DataSet: TDataSet);
    procedure QNotas_UFNewRecord(DataSet: TDataSet);
    procedure Grid_Notas_UfKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Grid_Notas_UfKeyPress(Sender: TObject; var Key: Char);
    procedure Grid_Notas_UfEnter(Sender: TObject);
    procedure Grid_Notas_UfExit(Sender: TObject);
    procedure QNotas_UFPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure QNotas_UFUpdateError(DataSet: TDataSet; E: EDatabaseError;
      UpdateKind: TUpdateKind; var UpdateAction: TIBUpdateAction);
    procedure QNotasPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure QNotasUpdateError(DataSet: TDataSet; E: EDatabaseError;
      UpdateKind: TUpdateKind; var UpdateAction: TIBUpdateAction);
    procedure QNotas_UFBeforePost(DataSet: TDataSet);
    procedure btnPesquisaClick(Sender: TObject);
    procedure FDQuery13BeforeEdit(DataSet: TDataSet);
    procedure FDQuery13BeforePost(DataSet: TDataSet);
    procedure FDQuery13NewRecord(DataSet: TDataSet);
    procedure FDQuery13PostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure FDQuery13UpdateError(ASender: TDataSet; AException: EFDException;
      ARow: TFDDatSRow; ARequest: TFDUpdateRequest;
      var AAction: TFDErrorAction);
    procedure FDQuery12BeforeEdit(DataSet: TDataSet);
    procedure FDQuery12BeforePost(DataSet: TDataSet);
    procedure FDQuery12NewRecord(DataSet: TDataSet);
    procedure FDQuery12PostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure FDQuery12UpdateError(ASender: TDataSet; AException: EFDException;
      ARow: TFDDatSRow; ARequest: TFDUpdateRequest;
      var AAction: TFDErrorAction);
    procedure btnImprimeClick(Sender: TObject);
    procedure TIPO_EMITENTEClick(Sender: TObject);
    procedure FORMA_EMISSAOClick(Sender: TObject);
    procedure UF_CARREGAClick(Sender: TObject);
    procedure UF_DESCARREGAClick(Sender: TObject);
    procedure UF_VEICULOClick(Sender: TObject);
    procedure TIPO_VEICULOClick(Sender: TObject);
    procedure UnidadeClick(Sender: TObject);
    procedure Grid_Notas_MotoristaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Grid_Notas_MotoristaKeyPress(Sender: TObject; var Key: Char);
    procedure Grid_Notas_MotoristaColExit(Sender: TObject);
    procedure Grid_Notas_MotoristaEnter(Sender: TObject);
    procedure Grid_Notas_MotoristaExit(Sender: TObject);
    procedure QNotas_MotoristaBeforeEdit(DataSet: TDataSet);
    procedure QNotas_MotoristaBeforePost(DataSet: TDataSet);
    procedure QNotas_MotoristaAfterOpen(DataSet: TDataSet);
    procedure QNotas_MotoristaPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure QNotas_MotoristaUpdateError(ASender: TDataSet;
      AException: EFDException; ARow: TFDDatSRow; ARequest: TFDUpdateRequest;
      var AAction: TFDErrorAction);
    procedure QNotas_MotoristaNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public }
    CmdSelect: String;
    CmdOrderBy: String;
    CmdSelectNull: String;
    procedure Botoes_Disable;
    function Search_Campo(Txt: String): Integer;
    procedure ProdutoSearch(ID: Integer);
    function Validacao: Boolean;
    procedure DetailSearch(Tabela: String);
    procedure Set_Campos(Vazio: Boolean);
    procedure Insert;
    procedure Edit;
    procedure Botoes_Editing;
    procedure Habilitar(Status: Boolean);
    procedure Botoes_Normal;
  end;

var
  FrmMde: TFrmMde;
  ID,ID_TRANS,id_lacre: Integer;
  GeraXML,e_mail: Boolean;
  Cod_CFOP,Operacao: String;

implementation

uses
  UPrincipal, UData, pcnConversao, pcteConversaoCTe, UConsulta,UPesquisa,
  UConsulta_CFOP,UPasswordDlg,UAcesso,UConsulta_CST;

{$R *.dfm}

procedure TFrmMde.Botoes_Disable;
begin
  btnPrior.Enabled        := False;
  btnNext.Enabled         := False;
  btnInsert.Enabled       := False;
  btnEdit.Enabled         := False;
  btnDelete.Enabled       := False;
  btnSave.Enabled         := False;
  btnDiscard.Enabled      := False;
  btnRetorna.Enabled      := False;
end;

procedure TFrmMde.Botoes_Normal;
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
    btnEdit.Enabled   := True;
    btnDelete.Enabled := True;
  end
  else
  begin
    btnEdit.Enabled   := False;
    btnDelete.Enabled := False;
  end;


  btnSave.Enabled         := False;
  btnDiscard.Enabled      := False;
  btnRetorna.Enabled      := True;
  btnIBGE.Enabled         := False;

end;

procedure TFrmMde.Habilitar(Status: Boolean);
var
I: Integer;
Temp: TComponent;
begin
  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
      TEdit(Temp).Enabled := Status;

    if Temp is TDateEdit then
      TDateEdit(Temp).Enabled := Status;

    if Temp is TComboBox then
      TComboBox(Temp).Enabled := Status;

    if Temp is TCurrencyEdit then
      TCurrencyEdit(Temp).Enabled := Status;

    if Temp is TRxCalcEdit then
      TRxCalcEdit(Temp).Enabled := Status;

    if Temp is TMaskEdit then
      TMaskEdit(Temp).Enabled := Status;

    if Temp is TMemo then
      TMemo(Temp).Enabled := Status;
  end;
end;

procedure TFrmMde.Botoes_Editing;
begin
  btnPrior.Enabled        := False;
  btnNext.Enabled         := False;
  btnInsert.Enabled       := False;
  btnEdit.Enabled         := False;
  btnDelete.Enabled       := False;
  btnSave.Enabled         := True;
  btnDiscard.Enabled      := True;
  btnRetorna.Enabled      := False;
  btnIBGE.Enabled         := True;

end;

procedure TFrmMde.Set_Campos(Vazio: Boolean);
var
I: Integer;
Temp: TComponent;
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

      if Temp is TDateEdit then
        TDateEdit(Temp).Text := '';

      if Temp is TComboBox then
        TComboBox(Temp).Text := '';

      if Temp is TRadioGroup then
        TRadioGroup(Temp).ItemIndex := -1;

      if Temp is TCurrencyEdit then
        TCurrencyEdit(Temp).Value := 0;

      if Temp is TRxCalcEdit then
        TRxCalcEdit(Temp).Value := 0;

      if Temp is TMemo then
        TMemo(Temp).Lines.Text := '';
    end
    else
    begin
      if Temp is TEdit then
        TEdit(Temp).Text := QTabela.FieldByName(TEdit(Temp).Name).AsString;

      if Temp is TMaskEdit then
        TMaskEdit(Temp).Text := QTabela.FieldByName(TMaskEdit(Temp).Name).AsString;

      if Temp is TDateEdit then
        TDateEdit(Temp).Text := QTabela.FieldByName(TDateEdit(Temp).Name).AsString;

      if Temp is TComboBox then
        TComboBox(Temp).Text := QTabela.FieldByName(TComboBox(Temp).Name).AsString;

      if Temp is TRadioGroup then
        TRadioGroup(Temp).ItemIndex := QTabela.FieldByName(TRadioGroup(Temp).Name).AsInteger;

      if Temp is TCurrencyEdit then
        TCurrencyEdit(Temp).Value := QTabela.FieldByName(TCurrencyEdit(Temp).Name).AsFloat;

      if Temp is TRxCalcEdit then
        TRxCalcEdit(Temp).Value := QTabela.FieldByName(TRxCalcEdit(Temp).Name).AsFloat;

      if Temp is TMemo then
        TMemo(Temp).Lines.Text := QTabela.FieldByName(TMemo(Temp).Name).AsString;


      QNotas.Close;
      QNotas.ParamByName('MDEFISCAL_ID').AsInteger := QTabela.FieldByName('MDEFISCAL_ID').AsInteger;
      QNotas.Prepare;
      QNotas.Open;
      QNotas.Last;

      if not QNotas.IsEmpty then
      Begin
      id_lacre := StrToInt(QNotas.FieldByName('LACRE').AsString);
      End;


      QNotas_UF.Close;
      QNotas_UF.ParamByName('MDEFISCAL_ID').AsInteger := QTabela.FieldByName('MDEFISCAL_ID').AsInteger;
      QNotas_UF.Prepare;
      QNotas_UF.Open;

      QNotas_Motorista.Close;
      QNotas_Motorista.ParamByName('MDEFISCAL_ID').AsInteger := QTabela.FieldByName('MDEFISCAL_ID').AsInteger;
      QNotas_Motorista.Prepare;
      QNotas_Motorista.Open;
      
    end;
  end;

  if QTabela.IsEmpty then
  Begin
   Grid_Notas.Enabled           := False;
   Grid_Notas_UF.Enabled        := False;
   Grid_Notas_Motorista.Enabled := False;
  End
  else if (not QTabela.IsEmpty) and ((Operacao ='Alterando') or (Operacao ='Inserindo')) then
  Begin
   Grid_Notas.Enabled           := True;
   Grid_Notas_UF.Enabled        := True;
   Grid_Notas_Motorista.Enabled := True;
  End;
  
end;

procedure TFrmMde.TIPO_EMITENTEClick(Sender: TObject);
begin
Tipo_emitente.Style := csDropDownList;
end;

procedure TFrmMde.TIPO_VEICULOClick(Sender: TObject);
begin
Tipo_veiculo.Style := csDropDownList;
end;

procedure TFrmMde.UF_CARREGAClick(Sender: TObject);
begin
uf_carrega.Style := csDropDownList;
end;

procedure TFrmMde.UF_CARREGAExit(Sender: TObject);
begin
QSearch.SQL.Clear;
QSearch.sql.Add('SELECT * FROM IBGE WHERE UF_SIGLA =:UF ORDER BY DESCRICAO');
QSearch.ParamByName('UF').AsString := UF_CARREGA.Text;
QSearch.Prepare;
QSearch.Open;
QSearch.First;

municipio_carrega.Items.Clear;

  while not QSearch.Eof do
  begin
   municipio_carrega.Items.Add(QSearch.FieldByName('DESCRICAO').AsString);
   QSearch.Next;
  end;

  if UF_CARREGA.Text = '' then
  begin

    Application.MessageBox('Favor preencher UF Carregamento.', PChar(Msg_Title), mb_IconStop);
    UF_CARREGA.Color := clYellow;
    UF_CARREGA.SetFocus;

  end;
end;

procedure TFrmMde.UF_DESCARREGAClick(Sender: TObject);
begin
uf_descarrega.Style := csDropDownList;
end;

procedure TFrmMde.UF_VEICULOClick(Sender: TObject);
begin
uf_veiculo.Style := csDropDownList;
end;

procedure TFrmMde.UnidadeClick(Sender: TObject);
begin
unidade.Style := csDropDownList;
end;

procedure TFrmMde.Insert;
var
I: Integer;
Temp: TComponent;
Sql, Par: String;
begin
  Sql := 'INSERT INTO COMPL_MDEFISCAL(';
  Par := '';

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
    begin
      if Sql = 'INSERT INTO COMPL_MDEFISCAL(' then
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
      if Sql = 'INSERT INTO COMPL_MDEFISCAL(' then
        Sql := Sql + TMaskEdit(Temp).Name
      else
        Sql := Sql + ', ' + TMaskEdit(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TMaskEdit(Temp).Name
      else
        Par := Par + ', :' + TMaskEdit(Temp).Name;
    end;

    if Temp is TDateEdit then
    begin
      if Sql = 'INSERT INTO COMPL_MDEFISCAL(' then
        Sql := Sql + TDateEdit(Temp).Name
      else
        Sql := Sql + ', ' + TDateEdit(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TDateEdit(Temp).Name
      else
        Par := Par + ', :' + TDateEdit(Temp).Name;
    end;

    if Temp is TComboBox then
    begin
      if Sql = 'INSERT INTO COMPL_MDEFISCAL(' then
        Sql := Sql + TComboBox(Temp).Name
      else
        Sql := Sql + ', ' + TComboBox(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TComboBox(Temp).Name
      else
        Par := Par + ', :' + TComboBox(Temp).Name;
    end;

    if Temp is TCurrencyEdit then
    begin
      if Sql = 'INSERT INTO COMPL_MDEFISCAL(' then
        Sql := Sql + TCurrencyEdit(Temp).Name
      else
        Sql := Sql + ', ' + TCurrencyEdit(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TCurrencyEdit(Temp).Name
      else
        Par := Par + ', :' + TCurrencyEdit(Temp).Name;
    end;

    if Temp is TRxCalcEdit then
    begin
      if Sql = 'INSERT INTO COMPL_MDEFISCAL(' then
        Sql := Sql + TRxCalcEdit(Temp).Name
      else
        Sql := Sql + ', ' + TRxCalcEdit(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TRxcalcEdit(Temp).Name
      else
        Par := Par + ', :' + TRxCalcEdit(Temp).Name;
    end;

    if Temp is TRadioGroup then
    begin
      if Sql = 'INSERT INTO COMPL_MDEFISCAL(' then
        Sql := Sql + TRadioGroup(Temp).Name
      else
        Sql := Sql + ', ' + TRadioGroup(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TRadioGroup(Temp).Name
      else
        Par := Par + ', :' + TRadioGroup(Temp).Name;
    end;

    if Temp is TMemo then
    begin
      if Sql = 'INSERT INTO COMPL_MDEFISCAL(' then
        Sql := Sql + TMemo(Temp).Name
      else
        Sql := Sql + ', ' + TMemo(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TMemo(Temp).Name
      else
        Par := Par + ', :' + TMemo(Temp).Name;
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

    if Temp is TCurrencyEdit then
      IQuery.ParamByName(TCurrencyEdit(Temp).Name).AsFloat := TCurrencyEdit(Temp).Value;

    if Temp is TRxCalcEdit then
      IQuery.ParamByName(TRxcalcEdit(Temp).Name).AsFloat := TRxCalcEdit(Temp).Value;

    if Temp is TRadioGroup then
      IQuery.ParamByName(TRadioGroup(Temp).Name).AsInteger := TRadioGroup(Temp).ItemIndex;

    if Temp is TDateEdit then
      IQuery.ParamByName(TDateEdit(Temp).Name).AsDateTime := TDateEdit(Temp).Date;

    if Temp is TComboBox then
      IQuery.ParamByName(TComboBox(Temp).Name).AsString := TComboBox(Temp).Text;

    if Temp is TMemo then
      IQuery.ParamByName(TMemo(Temp).Name).AsByteStr := TMemo(Temp).Lines.Text;
  end;

  IQuery.Prepare;
  IQuery.ExecSql;



  Habilitar(False);
end;

procedure TFrmMde.ManutencaoShow(Sender: TObject);
begin
Set_Campos(False);
  Botoes_Normal;

   ListBox1.Clear;

     IQuery.Sql.Clear;
     IQuery.Sql.Add('SELECT DESCRICAO FROM IBGE WHERE UF_SIGLA = :UF_SIGLA');
     IQuery.ParamByName('UF_SIGLA').AsString := UF_DESCARREGA.Text;
     IQuery.Prepare;

     IQuery.Open;

     IQuery.First;

     while not IQuery.Eof do
     Begin

      ListBox1.Items.Add(IQuery.FieldByName('DESCRICAO').AsString);
      IQuery.Next;
     End;
     Grid_Notas.Columns[0].PickList:= ListBox1.Items;

     ListBox2.Clear;

     IQuery.Sql.Clear;
     IQuery.Sql.Add('SELECT DISTINCT UF_SIGLA FROM IBGE ');
     IQuery.Prepare;

     IQuery.Open;

     IQuery.First;

     while not IQuery.Eof do
     Begin

      ListBox2.Items.Add(IQuery.FieldByName('UF_SIGLA').AsString);
      IQuery.Next;
     End;

     Grid_Notas_UF.Columns[0].PickList:= ListBox2.Items;
end;

procedure TFrmMde.Edit;
var
I: Integer;
Temp: TComponent;
Sql: String;
begin
  Sql := 'UPDATE COMPL_MDEFISCAL SET ';

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
    begin
      if Sql = 'UPDATE COMPL_MDEFISCAL SET ' then
        Sql := Sql + TEdit(Temp).Name + ' = :' + TEdit(Temp).Name
      else
        Sql := Sql + ', ' + TEdit(Temp).Name + ' = :' + TEdit(Temp).Name;
    end;

    if Temp is TMaskEdit then
    begin
      if Sql = 'UPDATE COMPL_MDEFISCAL SET ' then
        Sql := Sql + TMaskEdit(Temp).Name + ' = :' + TMaskEdit(Temp).Name
      else
        Sql := Sql + ', ' + TMaskEdit(Temp).Name + ' = :' + TMaskEdit(Temp).Name;
    end;

    if Temp is TDateEdit then
    begin
      if Sql = 'UPDATE COMPL_MDEFISCAL SET ' then
        Sql := Sql + TDateEdit(Temp).Name + ' = :' + TDateEdit(Temp).Name
      else
        Sql := Sql + ', ' + TDateEdit(Temp).Name + ' = :' + TDateEdit(Temp).Name;
    end;

    if Temp is TCurrencyEdit then
    begin
      if Sql = 'UPDATE COMPL_MDEFISCAL SET ' then
        Sql := Sql + TCurrencyEdit(Temp).Name + ' = :' + TCurrencyEdit(Temp).Name
      else
        Sql := Sql + ', ' + TCurrencyEdit(Temp).Name + ' = :' + TCurrencyEdit(Temp).Name;
    end;

    if Temp is TRxCalcEdit then
    begin
      if Sql = 'UPDATE COMPL_MDEFISCAL SET ' then
        Sql := Sql + TRxCalcEdit(Temp).Name + ' = :' + TRxCalcEdit(Temp).Name
      else
        Sql := Sql + ', ' + TRxCalcEdit(Temp).Name + ' = :' + TRxCalcEdit(Temp).Name;
    end;

    if Temp is TRadioGroup then
    begin
      if Sql = 'UPDATE COMPL_MDEFISCAL SET ' then
        Sql := Sql + TRadioGroup(Temp).Name + ' = :' + TRadioGroup(Temp).Name
      else
        Sql := Sql + ', ' + TRadioGroup(Temp).Name + ' = :' + TRadioGroup(Temp).Name;
    end;

    if Temp is TComboBox then
    begin
      if Sql = 'UPDATE COMPL_MDEFISCAL SET ' then
        Sql := Sql + TComboBox(Temp).Name + ' = :' + TComboBox(Temp).Name
      else
        Sql := Sql + ', ' + TComboBox(Temp).Name + ' = :' + TComboBox(Temp).Name;
    end;

    if Temp is TMemo then
    begin
      if Sql = 'UPDATE COMPL_MDEFISCAL SET ' then
        Sql := Sql + TMemo(Temp).Name + ' = :' + TMemo(Temp).Name
      else
        Sql := Sql + ', ' + TMemo(Temp).Name + ' = :' + TMemo(Temp).Name;
    end;
  end;

  Sql := Sql + ' WHERE (MDEFISCAL_ID = :ID)';

 //Showmessage(QTransacao.FieldByName('NUM_DOC').AsString + ' ' + QTransacao.FieldByName('TRANSACAO_ID').AsString  );
 


  IQuery.Sql.Clear;
  IQuery.Sql.Add(Sql);

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];
    if Temp is TEdit then
      IQuery.ParamByName(TEdit(Temp).Name).AsString := TEdit(Temp).Text;

    if Temp is TMaskEdit then
      IQuery.ParamByName(TMaskEdit(Temp).Name).AsString := TMaskEdit(Temp).Text;

    if Temp is TDateEdit then
      IQuery.ParamByName(TDateEdit(Temp).Name).AsDateTime := TDateEdit(Temp).Date;

    if Temp is TComboBox then
      IQuery.ParamByName(TComboBox(Temp).Name).AsString := TComboBox(Temp).Text;

    if Temp is TCurrencyEdit then
      IQuery.ParamByName(TCurrencyEdit(Temp).Name).AsFloat := TCurrencyEdit(Temp).Value;

    if Temp is TRxCalcEdit then
      IQuery.ParamByName(TRxCalcEdit(Temp).Name).AsFloat := TRxCalcEdit(Temp).Value;

    if Temp is TRadioGroup then
      IQuery.ParamByName(TRadioGroup(Temp).Name).AsInteger := TRadioGroup(Temp).ItemIndex;

    if Temp is TMemo then
      IQuery.ParamByName(TMemo(Temp).Name).AsByteStr := TMemo(Temp).Lines.Text;
  end;

  IQuery.ParamByName('ID').AsInteger       := QTABELA.FieldByName('MDEFISCAL_ID').AsInteger;


  IQuery.Prepare;
  IQuery.ExecSql;


  QTabela.Close;
  QTabela.Open;
  QTabela.Locate('MDEFISCAL_ID', ID, [loCaseInsensitive]);

  Habilitar(False);
end;

function TFrmMde.Validacao: Boolean;
begin
  Result := False;

  UF_VEICULO.Color         := clWindow;
  UF_CARREGA.Color         := clWindow;
  CIOT.Color               := clWindow;
  DT_SAIDA.Color           := clWindow;
  HR_SAIDA.Color           := clWindow;
  UF_CARREGA.Color         := clWindow;
  UF_DESCARREGA.Color      := clWindow;
  MUNICIPIO_CARREGA.Color  := clWindow;
  IBGE_CARREGA.Color       := clWindow;
  Instrucoes.Color         := clWindow;
  TARA.Color               := clWindow;
  PLACA_VEICULO.Color      := clWindow;
  FORMA_EMISSAO.Color      := clWindow;


  if (UF_VEICULO.Text = '') then
  begin
    Application.MessageBox('Favor preencher UF Veículo.', PChar(Msg_Title), mb_IconStop);
    UF_VEICULO.Color := clYellow;
    UF_VEICULO.SetFocus;
    exit;
  end;

  if FrmPrincipal.config.FieldByName('VERSAO_MDFE').AsString = '3.06' then
  Begin
    if (CIOT.Text = '') then
    begin
      Application.MessageBox('Favor preencher CIOT.', PChar(Msg_Title), mb_IconStop);
      CIOT.Color := clYellow;
      CIOT.SetFocus;
      exit;
    end;

  End;

  if (UF_CARREGA.Text = '') then
  begin
    Application.MessageBox('Favor preencher UF Carregamento.', PChar(Msg_Title), mb_IconStop);
    UF_CARREGA.Color := clYellow;
    UF_CARREGA.SetFocus;
    exit;
  end;

  if (UF_DESCARREGA.Text = '') then
  begin
    Application.MessageBox('Favor preencher UF Descarregamento.', PChar(Msg_Title), mb_IconStop);
    UF_DESCARREGA.Color := clYellow;
    UF_DESCARREGA.SetFocus;
    exit;
  end;

  if (MUNICIPIO_CARREGA.Text = '') then
  begin
    Application.MessageBox('Favor preencher município carregamento.', PChar(Msg_Title), mb_IconStop);
    MUNICIPIO_CARREGA.Color := clYellow;
    MUNICIPIO_CARREGA.SetFocus;
    exit;
  end;


  if (IBGE_CARREGA.Text = '') then
  begin
    Application.MessageBox('Código IBGE inexistente.', PChar(Msg_Title), mb_IconStop);
    IBGE_CARREGA.Color := clYellow;
    IBGE_CARREGA.SetFocus;
    exit;
  end;

  if (TIPO_VEICULO.Text = '') then
  begin
    Application.MessageBox('Favor informar o tipo do Veículo.', PChar(Msg_Title), mb_IconStop);
    TIPO_VEICULO.Color := clYellow;
    TIPO_VEICULO.SetFocus;
    exit;
  end;

   if (TARA.Value = 0 ) then
  begin
    Application.MessageBox('Favor preencher valor da Tara do Veículo.', PChar(Msg_Title), mb_IconStop);
    TARA.Color := clYellow;
    TARA.SetFocus;
    exit;
  end;

  if (PLACA_VEICULO.Text = '') then
  begin
    Application.MessageBox('Favor preehcher Placa do veículo.', PChar(Msg_Title), mb_IconStop);
    PLACA_VEICULO.Color := clYellow;
    PLACA_VEICULO.SetFocus;
    exit;
  end;


  {if ( SemMascara(CPF_MOTORISTA.Text) = '') then
  begin
    Application.MessageBox('Favor preehcher CPF do motorista.', PChar(Msg_Title), mb_IconStop);
    CPF_MOTORISTA.Color := clYellow;
    CPF_MOTORISTA.SetFocus;
    exit;
  end;

  if (not ValidCpf(StrZero(SemMascara(CPF_MOTORISTA.Text),11,0)))  then
  begin
      Application.MessageBox('Dígito Verificador do CPF Motorista inválido', PChar(Msg_Title), mb_IconStop);
      CPF_MOTORISTA.Color := clYellow;
      CPF_MOTORISTA.SetFocus;
      exit;

  end; }

  if (FORMA_EMISSAO.Text <> 'NORMAL') and (FORMA_EMISSAO.Text <> 'CONTINGÊNCIA FS') then
  begin
    Application.MessageBox('Forma de Emissão inválida', PChar(Msg_Title), mb_IconStop);
    FORMA_EMISSAO.Color := clYellow;
    FORMA_EMISSAO.SetFocus;
    exit;
  end;

  if Peso_Carga.Value = 0 then
  begin
    Application.MessageBox('Peso da carga não informado.', PChar(Msg_Title), mb_IconStop);
    Peso_Carga.Color := clYellow;
    Peso_Carga.SetFocus;
    exit;
  end;

  if Valor_carga.value = 0 then
  begin
    Application.MessageBox('Valor da carga não informado.', PChar(Msg_Title), mb_IconStop);
    Valor_carga.Color := clYellow;
    Valor_carga.SetFocus;
    exit;
  end;

  if unidade.Text = '' then
  begin
    Application.MessageBox('Código da unidade de medida não informado.', PChar(Msg_Title), mb_IconStop);
    unidade.Color := clYellow;
    unidade.SetFocus;
    exit;
  end;
  Result := True;
end;

procedure TFrmMde.DBGrid1DblClick(Sender: TObject);
begin
Manutencao.Show;
end;

procedure TFrmMde.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
Begin
  IQuery.Sql.Clear;
  IQuery.Sql.Add('SELECT MDEFISCAL_ID, STATUS,PROTOCOLO, RECIBO FROM COMPL_MDEFISCAL WHERE MDEFISCAL_ID = :MDEFISCAL_ID');
  IQuery.ParamByName('MDEFISCAL_ID').AsInteger := QTabela.FieldByName('MDEFISCAL_ID').AsInteger;
  IQuery.Prepare;
  IQuery.Open;

  if (not IQuery.IsEmpty)  AND (IQuery.FieldByname('PROTOCOLO').AsString <> '') AND (Copy(IQuery.FieldByname('RECIBO').AsString,1,1) = '3')  then
  TDBGrid(Sender).Canvas.Font.Color := clGreen;

  if (not IQuery.IsEmpty)  AND (IQuery.FieldByname('STATUS').AsString = 'CANCELADO') then
  TDBGrid(Sender).Canvas.Font.Color := clRed;

  if (not IQuery.IsEmpty)  AND (IQuery.FieldByname('STATUS').AsString = 'ENCERRADO') then
  TDBGrid(Sender).Canvas.Font.Color := clBlack;

  if gdSelected in State then
  begin
    with (Sender as TDBGrid).Canvas do
    begin
      if  TDBGrid(Sender).Canvas.Font.Color = clRed Then
      Brush.Color := clAqua //$004080FF
      else if TDBGrid(Sender).Canvas.Font.Color = clPurple Then
      Brush.Color := clYellow //$004080FF
      Else if TDBGrid(Sender).Canvas.Font.Color = clGreen Then
      Brush.Color := clYellow //$004080FF
      Else if TDBGrid(Sender).Canvas.Font.Color = clMoneyGreen  Then
       Brush.Color := clWhite //$004080FF
      else
        Brush.Color := $004080FF;
      FillRect(Rect);
      Font.Style := [fsBold];
    end;
  end;

 End;
  TDBGrid(Sender).DefaultDrawDataCell(Rect, TDBGrid(Sender).Columns[DataCol].Field, State);
end;

procedure TFrmMde.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
    Manutencao.Show;
end;

procedure TFrmMde.DBGrid1TitleClick(Column: TColumn);
begin
CmdOrderBy := 'ORDER BY ' + Column.FieldName;

  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

  QTabela.Prepare;
  QTabela.Open;
end;

procedure TFrmMde.Grid_Notas_MotoristaColExit(Sender: TObject);
begin
if QNotas_motorista.State in [dsInsert, dsEdit] then
  begin
   try
    if Grid_notas_motorista.SelectedField.FieldName = 'cpf_motorista' then
    begin
     if (not ValidCpf(StrZero(SemMascara(QNotas_Motorista.FieldByName('cpf_motorista').AsString),11,0)))  then
     begin
      Application.MessageBox('Dígito Verificador do CPF Motorista inválido', PChar(Msg_Title), mb_IconStop);
      Grid_Notas_Motorista.SelectedIndex := 1;
      abort;
     end;
    end;
   finally

   end;
  end;
end;

procedure TFrmMde.Grid_Notas_MotoristaEnter(Sender: TObject);
begin
Botoes_Disable;
Consulta.TabVisible := False;
end;

procedure TFrmMde.Grid_Notas_MotoristaExit(Sender: TObject);
begin
if FrmData.QAcesso.FieldByName('ALTERACAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para alteração', PChar(Msg_Title), mb_IconStop);
    Botoes_Normal;
    Consulta.TabVisible := True;
    exit;
  end;

  if QTabela.FieldByName('DT_SAIDA').AsDateTime < FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime then
  begin
    Application.MessageBox('Movimento já encerrado', PChar(Msg_Title), mb_IconStop);
    Botoes_Normal;
    Consulta.TabVisible := True;
    exit;
  end;

  if Existe_Mdfe(QTabela.FieldByName('MDEFISCAL_ID').AsInteger) then
  begin
    Botoes_Normal;
    Consulta.TabVisible := True;
    exit;
  end;

  btnEditClick(Self);
end;

procedure TFrmMde.Grid_Notas_MotoristaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (Key = Vk_F4) and (QNotas_Motorista.State = dsBrowse) and (not QNotas_Motorista.IsEmpty) then
    QNotas_Motorista.Delete;

  if Key = VK_F9 then
    Perform(Wm_NextDlgCtl, 0, 0);

  if ((Key = Vk_Up) or (Key = Vk_Down)) and (QNotas_Motorista.State in [dsInsert, dsEdit]) then
    Key := 0;
end;

procedure TFrmMde.Grid_Notas_MotoristaKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #46 then
    Key := #44;

  if Key = #13 then
    Keybd_Event(VK_TAB, 0, 0, 0);

  Key := AnsiUpperCase(Key)[1];

end;

procedure TFrmMde.Grid_Notas_UfEnter(Sender: TObject);
begin
Botoes_Disable;
Consulta.TabVisible := False;
end;

procedure TFrmMde.Grid_Notas_UfExit(Sender: TObject);
begin
  if FrmData.QAcesso.FieldByName('ALTERACAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para alteração', PChar(Msg_Title), mb_IconStop);
    Botoes_Normal;
    Consulta.TabVisible := True;
    exit;
  end;

  if QTabela.FieldByName('DT_SAIDA').AsDateTime < FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime then
  begin
    Application.MessageBox('Movimento já encerrado', PChar(Msg_Title), mb_IconStop);
    Botoes_Normal;
    Consulta.TabVisible := True;
    exit;
  end;

  if Existe_Mdfe(QTabela.FieldByName('MDEFISCAL_ID').AsInteger) then
  begin
    Botoes_Normal;
    Consulta.TabVisible := True;
    exit;
  end;

  btnEditClick(Self);
end;

procedure TFrmMde.Grid_Notas_UfKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (Key = Vk_F4) and (QNotas_uf.State = dsBrowse) and (not QNotas_uf.IsEmpty) then
    QNotas_uf.Delete;

  if Key = VK_F9 then
    Perform(Wm_NextDlgCtl, 0, 0);

  if ((Key = Vk_Up) or (Key = Vk_Down)) and (QNotas_uf.State in [dsInsert, dsEdit]) then
    Key := 0;
end;

procedure TFrmMde.Grid_Notas_UfKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #46 then
    Key := #44;

  if Key = #13 then
    Keybd_Event(VK_TAB, 0, 0, 0);

  Key := AnsiUpperCase(Key)[1];
end;

procedure TFrmMde.DetailSearch(Tabela: String);
begin

end;

procedure TFrmMde.DiasClick(Sender: TObject);
begin
if Dias.TabIndex <> (Dias.Tabs.Count - 1) then
  begin
    CmdSelectNull := 'WHERE (MDEFISCAL_ID IS NOT NULL) AND (DT_SAIDA = :DT_SAIDA) AND (EMPRESA_ID = :EMPRESA_ID)';


    CmdOrderBy    := 'ORDER BY MDEFISCAL_ID';

    QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

    QTabela.ParamByName('DT_SAIDA').AsDateTime := StrToDate(StrZero(IntToStr(Dias.TabIndex + 1), 2, 0) + '/' + Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 4, 7));
    QTabela.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  end
  else
  begin
    CmdSelectNull := 'WHERE (MDEFISCAL_ID IS NOT NULL) AND (DT_SAIDA <= :DT_SAIDA) AND (EMPRESA_ID = :EMPRESA_ID)'; 

    CmdOrderBy    := 'ORDER BY MDEFISCAL_ID';

    QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

    QTabela.ParamByName('DT_SAIDA').AsDateTime     := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
    QTabela.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  end;

  QTabela.Prepare;
  QTabela.Open;
  Botoes_Normal;
end;

function TFrmMde.Search_Campo(Txt: String): Integer;
begin

end;

procedure CTe(Transacao_Id: Integer; CFOP: String);
begin

end;

procedure TFrmMde.ProdutoSearch(ID: Integer);
begin

end;

procedure TFrmMde.QNotasBeforeEdit(DataSet: TDataSet);
begin
if FrmData.QAcesso.FieldByName('ALTERACAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para alteração', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

end;

procedure TFrmMde.QNotasBeforePost(DataSet: TDataSet);
begin

  if (QNotas.FieldByName('MUNICIPIO_DESCARREGA').AsString = '')  then
  begin
    Application.MessageBox('Favor informar municipio para descarregamento.', PChar(Msg_Title), mb_IconStop);
    Grid_Notas.SelectedIndex := 0;
    abort;
  end;

  if (QNotas.FieldByName('LACRE').AsString = '')  then
  begin
    Application.MessageBox('Favor número do lacre.', PChar(Msg_Title), mb_IconStop);
    Grid_Notas.SelectedIndex := 3;
    abort;
  end;

  if (TIPO_EMITENTE.Text = 'PRESTADOR DE SERVIÇO DE TRANSPORTE') then
  Begin
    if (not Verifica_ChaveNfe(StrZero(AllTrim(QNotas.FieldByName('CTE').AsString),0,44))) then
    Begin
      Application.MessageBox('Dígito Verificador da Chave CtE incorreto favor verificar a digitação!', PChar(Msg_Title), mb_IconStop);
      Grid_Notas.SelectedIndex := 2;
      abort;
    End;
  End;

  if (TIPO_EMITENTE.Text ='NÃO PRESTADOR DE SERVIÇO DE TRANSPORTE') then
  begin
    if (not Verifica_ChaveNfe(StrZero(AllTrim(QNotas.FieldByName('NFE').AsString),0,44))) then
    Begin
     Application.MessageBox('Dígito Verificador da Chave Nfe incorreto favor verificar a digitação!', PChar(Msg_Title), mb_IconStop);
     Grid_Notas.SelectedIndex := 3;
     abort;
    End;
  end;

    IQuery.Sql.Clear;
    IQuery.Sql.Add('SELECT * FROM COMPL_MDEFISCAL_NOTAS');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(MDEFISCAL_ID = :MDEFISCAL_ID)');
    IQuery.Sql.Add('AND (IBGE = :IBGE)');

    IQuery.ParamByName('MDEFISCAL_ID').AsInteger := QTabela.FieldByName('MDEFISCAL_ID').AsInteger;
    IQuery.ParamByName('IBGE').AsString   := QNotas.FieldByName('IBGE').AsString;

    IQuery.Prepare;
    IQuery.Open;

    if (Not IQuery.IsEmpty)  then
    begin
      Application.MessageBox('Municipio descarregamento já lançado.!', PChar(Msg_Title), mb_IconStop);
      Grid_Notas.SelectedIndex := 0;
      abort;
    end;

    if Existe_Mdfe(QTabela.FieldByName('MDEFISCAL_ID').AsInteger) then
    begin
      Application.MessageBox('Mdf-e já foi impressa. Impossível continuar.', PChar(Msg_Title), mb_IconStop);
      Grid_Notas.SelectedIndex := 0;
      abort;
    end;



end;

procedure TFrmMde.QNotasNewRecord(DataSet: TDataSet);
begin
DataSet['MDEFISCAL_ID']         := QTabela.FieldByName('MDEFISCAL_ID').AsInteger;
DataSet['MUNICIPIO_DESCARREGA'] := ' ';
DataSet['CTE']                  := ' ';
DataSet['NFE']                  := ' ';
DataSet['TP_TRANSPORTE']        := ' ';
DataSet['ID_TRANSPORTE']        := ' ';
DataSet['LACRE']                := ' ';
DataSet['IBGE']                 := ' ';
end;

procedure TFrmMde.QNotasPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
TRY
Application.MessageBox(Pchar('Dados Duplicados favor Verificar!'),'MDF-e', MB_IconStop + MB_OK);
except

END;
end;

procedure TFrmMde.QNotasUpdateError(DataSet: TDataSet; E: EDatabaseError;
  UpdateKind: TUpdateKind; var UpdateAction: TIBUpdateAction);
begin
TRY
Application.MessageBox(Pchar('Dados Duplicados favor Verificar!'),'MDF-e', MB_IconStop + MB_OK);
except

END;
end;

procedure TFrmMde.QNotas_MotoristaAfterOpen(DataSet: TDataSet);
begin
TFloatField(QNotas_MOTORISTA.FieldByName('CPF_MOTORISTA')).EditMask  := '999.999.999-99;1;_';
end;

procedure TFrmMde.QNotas_MotoristaBeforeEdit(DataSet: TDataSet);
begin
  if FrmData.QAcesso.FieldByName('ALTERACAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para alteração', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

end;

procedure TFrmMde.QNotas_MotoristaBeforePost(DataSet: TDataSet);
begin

     if (not ValidCpf(StrZero(SemMascara(QNotas_Motorista.FieldByName('cpf_motorista').AsString),11,0)))  then
     begin
      Application.MessageBox('Dígito Verificador do CPF Motorista inválido', PChar(Msg_Title), mb_IconStop);
      Grid_Notas_Motorista.SelectedIndex := 1;
      abort;
     end;


    if Existe_Mdfe(QTabela.FieldByName('MDEFISCAL_ID').AsInteger) then
    begin
      Application.MessageBox('Mdf-e já foi impressa. Impossível continuar.', PChar(Msg_Title), mb_IconStop);
      Grid_Notas_Uf.SelectedIndex := 0;
      abort;
    end;

end;

procedure TFrmMde.QNotas_MotoristaNewRecord(DataSet: TDataSet);
begin
DataSet['MDEFISCAL_ID']         := QTabela.FieldByName('MDEFISCAL_ID').AsInteger;
end;

procedure TFrmMde.QNotas_MotoristaPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  Try
  Application.MessageBox(Pchar('Dados Duplicados favor Verificar!'),'MDF-e', MB_IconStop + MB_OK);
  except

  end;
end;

procedure TFrmMde.QNotas_MotoristaUpdateError(ASender: TDataSet;
  AException: EFDException; ARow: TFDDatSRow; ARequest: TFDUpdateRequest;
  var AAction: TFDErrorAction);
begin
  Try
  Application.MessageBox(Pchar('Dados Duplicados favor Verificar!'),'MDF-e', MB_IconStop + MB_OK);
  except

  end;
end;


procedure TFrmMde.QNotas_UFAfterPost(DataSet: TDataSet);
begin
 try

 except

 end;

 end;

procedure TFrmMde.QNotas_UFBeforeEdit(DataSet: TDataSet);
begin
  if FrmData.QAcesso.FieldByName('ALTERACAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para alteração', PChar(Msg_Title), mb_IconStop);
    exit;
  end;
end;

procedure TFrmMde.QNotas_UFBeforePost(DataSet: TDataSet);
begin
    IQuery.Sql.Clear;
    IQuery.Sql.Add('SELECT * FROM COMPL_MDEFISCAL_UF');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(MDEFISCAL_ID = :MDEFISCAL_ID)');
    IQuery.Sql.Add('AND (UF_PERCURSO = :UF_PERCURSO)');

    IQuery.ParamByName('MDEFISCAL_ID').AsInteger := QTabela.FieldByName('MDEFISCAL_ID').AsInteger;
    IQuery.ParamByName('UF_PERCURSO').AsString   := QNotas_UF.FieldByName('UF_PERCURSO').AsString;

    IQuery.Prepare;
    IQuery.Open;

    if (Not IQuery.IsEmpty)  then
    begin
      Application.MessageBox('UF de Percurso já lançada.!', PChar(Msg_Title), mb_IconStop);
      Grid_Notas_Uf.SelectedIndex := 0;
      abort;
    end;

    if Existe_Mdfe(QTabela.FieldByName('MDEFISCAL_ID').AsInteger) then
    begin
      Application.MessageBox('Mdf-e já foi impressa. Impossível continuar.', PChar(Msg_Title), mb_IconStop);
      Grid_Notas_Uf.SelectedIndex := 0;
      abort;
    end;
end;

procedure TFrmMde.QNotas_UFNewRecord(DataSet: TDataSet);
begin
DataSet['MDEFISCAL_ID']         := QTabela.FieldByName('MDEFISCAL_ID').AsInteger;
end;

procedure TFrmMde.QNotas_UFPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
try
Application.MessageBox(Pchar('Dados Duplicados favor Verificar!'),'MDF-e', MB_IconStop + MB_OK);
except

end;
end;

procedure TFrmMde.QNotas_UFUpdateError(DataSet: TDataSet; E: EDatabaseError;
  UpdateKind: TUpdateKind; var UpdateAction: TIBUpdateAction);
begin
try
Application.MessageBox(Pchar('Dados Duplicados favor Verificar!'),'MDF-e', MB_IconStop + MB_OK);
except

end;
end;

procedure TFrmMde.btnDeleteClick(Sender: TObject);
begin
if FrmData.QAcesso.FieldByName('EXCLUSAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para exclusão', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  if QTabela.FieldByName('DT_SAIDA').AsDateTime < FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime then
  begin
    Application.MessageBox('Movimento já encerrado', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

   if Existe_Mdfe(QTabela.FieldByName('MDEFISCAL_ID').AsInteger) then
  begin
    Application.MessageBox('Mdf-e já foi impressa. Impossível continuar.', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  if (QTabela.FieldByName('DT_SAIDA').AsDateTime <= FrmPrincipal.QEmpresa.FieldByName('DT_ULT_FOLHA').AsDateTime) then
  begin
    Application.MessageBox('Movimento já encerrado', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  if Application.MessageBox('Deseja realmente excluir?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = IDYES then
  begin

    IQuery.Sql.Clear;
    IQuery.Sql.Add('DELETE FROM COMPL_MDEFISCAL');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(MDEFISCAL_ID = :ID)');

    IQuery.ParamByName('ID').AsInteger := QTabela.FieldByName('MDEFISCAL_ID').AsInteger;

    IQuery.Prepare;
    IQuery.ExecSql;


    QTabela.Close;

    QTabela.Prepare;
    QTabela.Open;

    Set_Campos(False);

    Botoes_Normal;
  end;

end;

procedure TFrmMde.btnDiscardClick(Sender: TObject);
begin
Botoes_Normal;
  Set_Campos(False);

  {if QTabela.IsEmpty then
  begin
    QEmpresa.Close;
    QBanco.Close;
    QCliente.Close;
    QConta.Close;
    QCusto.Close;
  end; }

  Habilitar(False);
  Operacao := '';
  Consulta.TabVisible := True;
end;

procedure TFrmMde.btnEditClick(Sender: TObject);
begin
if FrmData.QAcesso.FieldByName('ALTERACAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para alteração', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  if QTabela.FieldByName('DT_SAIDA').AsDateTime < FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime then
  begin
    Application.MessageBox('Movimento já encerrado', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  if Existe_Mdfe(QTabela.FieldByName('MDEFISCAL_ID').AsInteger) then
  begin
    Application.MessageBox('Mdf-e já foi impressa. Impossível continuar.', PChar(Msg_Title), mb_IconStop);
    exit;
  end;


  Operacao := 'Alterando';
  ID       := QTabela.FieldByName('MDEFISCAL_ID').AsInteger;

  NOME_TRANSPORTADOR.Text      := FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString;
  CNPJ_TRANSPORTADOR.Text      := FrmPrincipal.QEmpresa.FieldByName('CNPJ').AsString;
  INSCRICAO_TRANSPORTADOR.Text := FrmPrincipal.QEmpresa.FieldByName('INSCR_ESTADUAL').AsString;

  Botoes_Editing;

  Habilitar(True);
  Consulta.TabVisible           := False;
  Grid_Notas.Enabled            := False;
  Grid_Notas_UF.Enabled         := False;
  Grid_Notas_Motorista.Enabled  := False;

end;

procedure TFrmMde.btnFornecedorClick(Sender: TObject);
var
Forne: Integer;
begin

end;

procedure TFrmMde.btnGeraClick(Sender: TObject);
var
Id_Trans,Item: Integer;
Cond_origem,Dpt_origem,IniFile, edtSmtpHost, edtSmtpPort, edtSmtpUser, edtSmtpPass, edtEmailAssunto, Insc_Dest: String;
cbEmailSSL, ok: Boolean;
Ini: TIniFile;
StreamMemo: TMemoryStream;
Vr_trib_acum,Vl_Trans :Real;

begin
  if FORMA_EMISSAO.Text = 'NORMAL' then
     FrmPrincipal.ACBrMDFe1.Configuracoes.Geral.FormaEmissao := teNormal
  else if FORMA_EMISSAO.Text = 'CONTINGÊNCIA FS' then
     FrmPrincipal.ACBrMDFe1.Configuracoes.Geral.FormaEmissao := teContingencia;


  FrmPrincipal.ACBrMDFe1.Manifestos.Clear;

  with FrmPrincipal.ACBrMDFe1.Manifestos.Add.MDFe do
  begin
   //
   // Dados de Identificação do MDF-e
   //
   Ide.cUF := StrToInt(Copy(FrmPrincipal.QEmpresa.FieldByName('IBGE').AsString, 1, 2));



   // TMDFeTpEmitente = ( teTransportadora, teTranspCargaPropria );

   if TIPO_EMITENTE.Text = 'PRESTADOR DE SERVIÇO DE TRANSPORTE' then
   Ide.tpEmit  := teTransportadora
   Else
   Ide.tpEmit  := teTranspCargaPropria;

   Ide.modelo  := '58';

   Ide.serie   := StrToInt(SERIE.Text);
   
   Ide.nMDF    := StrToIntDef(NO_DOC_FISCAL.Text, 0);
   Ide.cMDF    := 1;  // Código Aleatório
   // TMDFeModal = ( moRodoviario, moAereo, moAquaviario, moFerroviario );


   if TIPO_TRANSPORTE.Text = 'RODOVIÁRIO' then
   Ide.modal   := moRodoviario
   Else if TIPO_TRANSPORTE.Text = 'AQUAVIÁRIO' Then
   Ide.modal   := moAquaviario;


   Ide.dhEmi   := StrToDateTime(Qtabela.FieldByName('DT_SAIDA').AsString +  QTabela.FieldByName('HR_SAIDA').AsString) ;

   // TpcnTipoEmissao = (teNormal, teContingencia, teSCAN, teDPEC, teFSDA);

   if FORMA_EMISSAO.Text = 'NORMAL' then
   Ide.tpEmis  := teNormal
   else if FORMA_EMISSAO.Text = 'CONTINGÊNCIA FS' then
   Ide.tpEmis  := teContingencia;


   // TpcnProcessoEmissao = (peAplicativoContribuinte, peAvulsaFisco, peAvulsaContribuinte, peContribuinteAplicativoFisco);
   Ide.procEmi := peAplicativoContribuinte;

   Ide.verProc := '2.0';


   Ide.UFIni   := UF_CARREGA.Text;
   Ide.UFFim   := UF_DESCARREGA.Text;

   with Ide.infMunCarrega.Add do
    begin
     cMunCarrega := StrToInt(IBGE_CARREGA.Text);
     xMunCarrega := municipio_carrega.Text;
    end;

    QNotas_uf.Close;
    QNotas_uf.ParamByName('MDEFISCAL_ID').AsInteger := QTabela.FieldByName('MDEFISCAL_ID').AsInteger;
    QNotas_uf.Prepare;
    QNotas_uf.Open;
    QNotas_uf.First;

    while not QNotas_UF.Eof do
    begin
      with Ide.infPercurso.Add do
      begin
       UFPer := QNotas_uf.FieldByName('UF_PERCURSO').AsString;
      end;
    QNotas_UF.Next;
    end;

   //
   // Dados do Emitente
   //
   Emit.CNPJ  := CNPJ_TRANSPORTADOR.Text;
   Emit.IE    := INSCRICAO_TRANSPORTADOR.Text;
   Emit.xNome := NOME_TRANSPORTADOR.Text;
   Emit.xFant := NOME_TRANSPORTADOR.Text;

   Emit.EnderEmit.xLgr    := FrmPrincipal.QEmpresa.FieldByName('ENDERECO').AsString;
   Emit.EnderEmit.nro     := FrmPrincipal.QEmpresa.FieldByName('NUMERO').AsString;
   Emit.EnderEmit.xCpl    := '';
   Emit.EnderEmit.xBairro := FrmPrincipal.QEmpresa.FieldByName('BAIRRO').AsString;
   Emit.EnderEmit.cMun    := FrmPrincipal.QEmpresa.FieldByName('IBGE').AsInteger;
   Emit.EnderEmit.xMun    := FrmPrincipal.QEmpresa.FieldByName('MUNICIPIO').AsString;
   Emit.EnderEmit.CEP     := StrToInt(SemMascara(FrmPrincipal.QEmpresa.FieldByName('CEP').AsString));
   Emit.EnderEmit.UF      := FrmPrincipal.QEmpresa.FieldByName('ESTADO').AsString;
   Emit.EnderEmit.fone    := FrmPrincipal.QEmpresa.FieldByName('TELEFONE').AsString;
   Emit.enderEmit.email   := FrmPrincipal.QEmpresa.FieldByName('EMAIL').AsString;


   if TIPO_TRANSPORTE.Text = 'RODOVIÁRIO' then
   bEGIN
     rodo.RNTRC := RNTRC.Text;
     rodo.infANTT.RNTRC := RNTRC.Text;

    with  rodo.infANTT.infCIOT.Add  do
    begin
      CIOT    := QTabela.FieldByName('CIOT').AsString;
      CNPJCPF := CNPJ_TRANSPORTADOR.Text;
    end;


     if TIPO_VEICULO.Text = 'TRAÇÃO'   then
     bEGIN

       rodo.veicTracao.cInt    := '001';
       rodo.veicTracao.placa   := PLACA_VEICULO.Text;
       rodo.veicTracao.RENAVAM := '';
       rodo.veicTracao.tara    := StrToInt(TARA.text);
       rodo.veicTracao.capKG   := 0;
       rodo.veicTracao.capM3   := 0;

       // TpcteTipoRodado = (trNaoAplicavel, trTruck, trToco, trCavaloMecanico, trVAN, trUtilitario, trOutros);
       // Para o MDF-e não utilizar o trNaoAplicavel.


       rodo.veicTracao.tpRod := trTruck;

       // TpcteTipoCarroceria = (tcNaoAplicavel, tcAberta, tcFechada, tcGraneleira, tcPortaContainer, tcSider);
       rodo.veicTracao.tpCar := tcFechada;

       rodo.veicTracao.UF := UF_VEICULO.Text;

      IQuery.sql.Clear;
      IQuery.Sql.Add('SELECT * FROM COMPL_MDEFISCAL_MOTORISTA');
      IQuery.Sql.Add('WHERE MDEFISCAL_ID = :MDEFISCAL_ID');
      IQuery.ParamByName('MDEFISCAL_ID').AsInteger := QTabela.FieldByName('MDEFISCAL_ID').AsInteger;

      IQuery.Prepare;
      IQuery.Open;
      IQuery.First;

      while not IQuery.Eof do
      bEGIN
       with rodo.veicTracao.condutor.Add do
        begin
         xNome := iquery.FieldByName('NOME_MOTORISTA').AsString;
         CPF   := SemMascara(iquery.FieldByName('CPF_MOTORISTA').AsString);
        end;
       IQuery.Next;
      end;

     end;
     if TIPO_VEICULO.Text = 'REBOQUE'   then
     bEGIN

      with rodo.veicReboque.Add do
      begin
       cInt    := '002';
       placa   := PLACA_VEICULO.Text;
       RENAVAM := '';
       capKG   := 0;
       capM3   := 0;

       // TpcteTipoCarroceria = (tcNaoAplicavel, tcAberta, tcFechada, tcGraneleira, tcPortaContainer, tcSider);
       tpCar := tcFechada;

       UF := UF_VEICULO.Text;
      end;
     end;
   end;

   {

   with rodo.valePed.disp.Add do
    begin
     CNPJForn := '12345678000199';
     CNPJPg   := '21543876000188';
     nCompra  := '789';
    end;


    QNotas.Close;
    QNotas.ParamByName('MDEFISCAL_ID').AsInteger := QTabela.FieldByName('MDEFISCAL_ID').AsInteger;
    QNotas.Prepare;
    QNotas.Open;
    QNotas.First;  }

    IQuery.sql.Clear;
    IQuery.Sql.Add('SELECT DISTINCT IBGE, MUNICIPIO_DESCARREGA FROM COMPL_MDEFISCAL_NOTAS');
    IQuery.Sql.Add('WHERE MDEFISCAL_ID = :MDEFISCAL_ID');
    IQuery.ParamByName('MDEFISCAL_ID').AsInteger := QTabela.FieldByName('MDEFISCAL_ID').AsInteger;

    IQuery.Prepare;
    IQuery.Open;


   while not IQuery.Eof do
   bEGIN
    with infDoc.infMunDescarga.Add do
    begin
     cMunDescarga := StrToInt(IQuery.FieldByName('IBGE').AsString);
     xMunDescarga := IQuery.FieldByName('MUNICIPIO_DESCARREGA').AsString;

     QDetalhe.sql.clear;
     QDetalhe.Sql.ADD('SELECT * FROM COMPL_MDEFISCAL_NOTAS');
     QDetalhe.Sql.ADD('WHERE MDEFISCAL_ID = :MDEFISCAL_ID AND IBGE = :IBGE');

     QDetalhe.ParamByName('MDEFISCAL_ID').AsInteger := QTabela.FieldByName('MDEFISCAL_ID').AsInteger;
     QDetalhe.ParamByName('IBGE').AsString          := IQuery.FieldByName('IBGE').AsString;

     QDetalhe.Prepare;
     QDetalhe.Open;

     While not QDetalhe.Eof Do
     Begin

       if Length(AllTrim(QDetalhe.FieldByName('CTE').AsString)) = 44 then
       Begin
        with infCTe.Add do
        begin
         chCTe := QDetalhe.FieldByName('CTE').AsString;
          Indreentrega := '';
        // Informações das Unidades de Transporte (Carreta/Reboque/Vagão)

         {with infUnidTransp.Add do
         begin
          //TpcnUnidTransp = ( utRodoTracao, utRodoReboque, utNavio, utBalsa, utAeronave, utVagao, utOutros );

          if TIPO_VEICULO.Text = 'TRAÇÃO'   then
          tpUnidTransp := utRodoTracao
          else if TIPO_VEICULO.Text = 'REBOQUE' then
          tpUnidTransp := utRodoReboque;

           if TIPO_TRANSPORTE.Text = 'RODOVIÁRIO' then
           idUnidTransp := PLACA_VEICULO.Text; // informar a placa se rodoviário

          with lacUnidTransp.Add do
           begin
            nLacre := QDetalhe.FieldByName('LACRE').AsString;
           end;
          // Informações das Unidades de carga (Containeres/ULD/Outros)

         { with infUnidCarga.Add do
           begin
            // TpcnUnidCarga  = ( ucContainer, ucULD, ucPallet, ucOutros );
            tpUnidCarga := ucOutros;
            idUnidCarga := 'AB45'; // informar o numero da unidade da carga
            with lacUnidCarga.Add do
             begin
              nLacre := '123';
             end;
            qtdRat := 1.0;
           end;
          qtdRat := 1.0;
         end; }

        end; // fim do with

       End;


       if Length(AllTrim(QDetalhe.FieldByName('NFE').AsString)) = 44 then
       Begin
        with infNFe.Add do
        begin

         chNFe := QDetalhe.FieldByName('NFE').AsString;;

        // Informações das Unidades de Transporte (Carreta/Reboque/Vagão)

         {with infUnidTransp.Add do
         begin
          //TpcnUnidTransp = ( utRodoTracao, utRodoReboque, utNavio, utBalsa, utAeronave, utVagao, utOutros );

          if TIPO_VEICULO.Text = 'TRAÇÃO'   then
          tpUnidTransp := utRodoTracao
          else if TIPO_VEICULO.Text = 'REBOQUE' then
          tpUnidTransp := utRodoReboque;

           if TIPO_TRANSPORTE.Text = 'RODOVIÁRIO' then
           idUnidTransp := PLACA_VEICULO.Text; // informar a placa se rodoviário

          with lacUnidTransp.Add do
           begin
            nLacre := QDetalhe.FieldByName('LACRE').AsString;
           end;
          // Informações das Unidades de carga (Containeres/ULD/Outros)

          { with infUnidCarga.Add do
           begin
            // TpcnUnidCarga  = ( ucContainer, ucULD, ucPallet, ucOutros );
            tpUnidCarga := ucOutros;
            idUnidCarga := 'AB45'; // informar o numero da unidade da carga
            with lacUnidCarga.Add do
             begin
              nLacre := '123';
             end;
            qtdRat := 1.0;
           end;
          qtdRat := 1.0;
         end; }
        end; // fim do with

       End;





       QDetalhe.Next;

     End;

    end;
    IQuery.Next;
   end;



   with seg.Add do
   begin
    respSeg := rsEmitente;
    xSeg := '123';
    nApol :='123456';
    aver.Add.nAver := '1111';
    CNPJCPF :=   CNPJ_TRANSPORTADOR.Text;
    CNPJ    :=   CNPJ_TRANSPORTADOR.Text;

   end;

   QSearch.SQL.Clear;
   QSearch.SQL.Add('SELECT COUNT(*) TOTAL_NFE FROM COMPL_MDEFISCAL_NOTAS');
   QSearch.SQL.Add('WHERE MDEFISCAL_ID = :MDEFISCAL_ID AND  LENGTH(TRIM(NFE)) = 44 ');
   QSearch.ParamByName('MDEFISCAL_ID').AsInteger := QTabela.FieldByName('MDEFISCAL_ID').AsInteger;

   QSearch.Prepare;
   QSearch.Open;

   tot.qNFe := QSearch.FieldByName('TOTAL_NFE').AsInteger;

   QSearch.SQL.Clear;
   QSearch.SQL.Add('SELECT COUNT(*) TOTAL_CTE FROM COMPL_MDEFISCAL_NOTAS');
   QSearch.SQL.Add('WHERE MDEFISCAL_ID = :MDEFISCAL_ID AND LENGTH(TRIM(CTE)) = 44');
   QSearch.ParamByName('MDEFISCAL_ID').AsInteger := QTabela.FieldByName('MDEFISCAL_ID').AsInteger;

   QSearch.Prepare;
   QSearch.Open;

   tot.qCTe := QSearch.FieldByName('TOTAL_CTE').AsInteger;
   tot.vCarga := Valor_carga.Value;
   // UnidMed = (uM3,uKG, uTON, uUNIDADE, uLITROS);

   if UNIDADE.Text = 'KG' then
   tot.cUnid  :=  uKG
   else if UNIDADE.Text = 'TON' then
   tot.cUnid  :=  uTON
   else if UNIDADE.Text = 'UN' then
   tot.cUnid  :=  uUNIDADE
   else if UNIDADE.Text = 'M3' then
   tot.cUnid  :=  uM3
   else if UNIDADE.Text = 'LT' then
   tot.cUnid  :=  uLITROS;
        
   tot.qCarga := Peso_Carga.Value;

  { with lacres.Add do
    begin
     nLacre := '123';
    end;}

   infAdic.infCpl     := Instrucoes.Text;
   infAdic.infAdFisco := '';
  end;

  //FrmPrincipal.ACBrMDFe1.Manifestos.GerarMDFe;

  if FrmPrincipal.ACBrMDFe1.Enviar(0, True) then
  begin
    IQuery.Sql.Clear;
    IQuery.Sql.Add('UPDATE COMPL_MDEFISCAL SET RECIBO = :RECIBO, PROTOCOLO = :PROTOCOLO, CHAVE_MDF = :CHAVE_MDF');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(MDEFISCAL_ID = :MDEFISCAL_ID)');

    IQuery.ParamByName('RECIBO').AsString        := FrmPrincipal.ACBrMDFe1.WebServices.Retorno.Recibo;
    IQuery.ParamByName('PROTOCOLO').AsString     := FrmPrincipal.ACBrMDFe1.WebServices.Retorno.Protocolo;
    IQuery.ParamByName('CHAVE_MDF').AsString     := FrmPrincipal.ACBrMDFe1.WebServices.Retorno.ChaveMDFe;
    IQuery.ParamByName('MDEFISCAL_ID').AsInteger := QTabela.FieldByName('MDEFISCAL_ID').AsInteger;;

    IQuery.Prepare;
    IQuery.ExecSql;

    Chave_mdf.text := FrmPrincipal.ACBrMDFe1.WebServices.Retorno.ChaveMDFe;

    ShowMessage('Nº do Protocolo: ' + FrmPrincipal.ACBrMDFe1.WebServices.Retorno.Protocolo);
    ShowMessage('Nº do Recibo: ' + FrmPrincipal.ACBrMDFe1.WebServices.Retorno.Recibo);

    Close;

  end;

end;

procedure TFrmMde.btnIBGEClick(Sender: TObject);
begin
  try
    IBGE_CARREGA.Text := IntToStr(GetConsulta('IBGE', 0, 0, StrToInt(IBGE_CARREGA.Text)));
  except
    IBGE_CARREGA.Text := IntToStr(GetConsulta('IBGE', 0, 0, 0));
  end;

end;

procedure TFrmMde.btnImprimeClick(Sender: TObject);
var
ID,Linha,PAGINA: Integer;
InputString:string;
begin
  if Application.MessageBox('Deseja usar a seleção atual?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = IDYES then
  begin
    IQuery.Sql.Clear;
    IQuery.Sql.Text := QTabela.Sql.Text;

    if Id_Trans = 0 then
    IQuery.ParamByName('DT_SAIDA').AsDateTime := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;

    IQuery.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  end
  else
  begin
    IQuery.Sql.Clear;
    IQuery.Sql.Add('SELECT * FROM COMPL_MDEFISCAL');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(EMPRESA_ID = :EMPRESA_ID)');
    IQuery.Sql.Add('ORDER BY DT_SAIDA');

    IQuery.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;


  end;

  IQuery.Prepare;
  IQuery.Open;


  if NOT iquery.IsEmpty then
  Rel_MdeFiscal.PreviewModal
  Else
  Begin
   Application.MessageBox('Sem dados para o Relatório.', PChar(Msg_Title), mb_IconStop);
    exit;
  End;
end;


procedure TFrmMde.btnInsertClick(Sender: TObject);
begin
Operacao := 'Inserindo';

  Botoes_Editing;

  Set_Campos(True);
  Habilitar(True);
  QNotas.Close;
  QNotas_UF.Close;
  QNotas_Motorista.Close;
  Grid_Notas.Enabled           := False;
  Grid_Notas_UF.Enabled        := False;
  Grid_Notas_Motorista.Enabled := False;

  NOME_TRANSPORTADOR.Text      := FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString;
  CNPJ_TRANSPORTADOR.Text      := FrmPrincipal.QEmpresa.FieldByName('CNPJ').AsString;
  INSCRICAO_TRANSPORTADOR.Text := FrmPrincipal.QEmpresa.FieldByName('INSCR_ESTADUAL').AsString;
  DT_SAIDA.Date                := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
  HR_SAIDA.Text                := TimeToStr(Time);
  HR_PREVISAO.Text             := TimeToStr(Time);
  MODELO.Text                  :='58';
  Serie.Text                   :='001';
  TIPO_EMITENTE.Text           :='PRESTADOR DE SERVIÇO DE TRANSPORTE';
  UF_TRANSPORTADOR.Text        := 'MG';
  Empresa_id.Text              := FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsString;
  TIPO_TRANSPORTE.Text         := 'RODOVIÁRIO';
  TIPO_VEICULO.Text            := 'TRAÇÃO';
  STATUS.Text                  := 'NORMAL';
  DT_PREVISAO.SetFocus;
  ID_LACRE := 0;

  Consulta.TabVisible := False;


end;

procedure TFrmMde.btnNextClick(Sender: TObject);
begin
 if not QTabela.Eof then
  begin
    QTabela.Next;
    Set_Campos(False);
  end;

  Botoes_Normal;
end;

procedure TFrmMde.BtnOkClick(Sender: TObject);
begin
if Validacao then
  begin
    if NO_DOC_FISCAL.Value > 0 then
      Edit
    else
      Insert;





  end;
end;

procedure TFrmMde.btnPesquisaClick(Sender: TObject);
var
Condicao: String;
begin
  Condicao := GetPesquisa('MDFE');

  if Condicao <> '' then
  begin
    CmdSelectNull := Condicao + ' AND (EMPRESA_ID = :EMPRESA_ID)';

    QTabela.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  end;

  CmdOrderBy := 'ORDER BY MDEFISCAL_ID';

  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

  QTabela.Prepare;
  QTabela.Open;

  Set_Campos(False);
  Botoes_Normal;
end;


procedure TFrmMde.btnPriorClick(Sender: TObject);
begin
if not QTabela.Bof then
  begin
    QTabela.Prior;
    Set_Campos(False);
  end;

  Botoes_Normal;
end;

procedure TFrmMde.btnRetornaClick(Sender: TObject);
begin
 Close;
end;

procedure TFrmMde.btnSaveClick(Sender: TObject);
begin
DetailSearch('');

 QSearch.SQL.Clear;
 QSearch.sql.Add('SELECT * FROM IBGE WHERE DESCRICAO =:DESCRICAO');
 QSearch.ParamByName('DESCRICAO').AsString := municipio_carrega.Text;
 QSearch.Prepare;
 QSearch.Open;

  IBGE_CARREGA.Text := QSearch.FieldByName('CODIGO').AsString; 

  Serie.Text   := StrZero(Serie.Text, 3, 0);

  if Validacao then
  begin

      if Operacao = 'Inserindo' then
      begin

        Insert;

        if Id_Trans = 0 then
          CmdSelectNull := 'WHERE (MDEFISCAL_ID IS NOT NULL) AND (DT_SAIDA = :DT_SAIDA) AND (EMPRESA_ID = :EMPRESA_ID)'
        else
          CmdSelectNull := 'WHERE (MDEFISCAL_ID = ' + IntToStr(Id_Trans) + ') AND (EMPRESA_ID = :EMPRESA_ID)';


        CmdOrderBy := 'ORDER BY MDEFISCAL_ID';

        QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

        if Id_Trans = 0 then
          QTabela.ParamByName('DT_SAIDA').AsDateTime := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;

        QTabela.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;

        QTabela.Prepare;
        QTabela.Open;
        QTabela.Last;

      end
      else
      bEGIN

      Edit;
      end; 

    QNotas.Close;
    QNotas.ParamByName('MDEFISCAL_ID').AsInteger      := QTabela.FieldByName('MDEFISCAL_ID').AsInteger;
    QNotas.Prepare;
    QNotas.Open;

    QNotas_UF.Close;
    QNotas_UF.ParamByName('MDEFISCAL_ID').AsInteger      := QTabela.FieldByName('MDEFISCAL_ID').AsInteger;
    QNotas_UF.Prepare;
    QNotas_UF.Open;


     ListBox1.Clear;

     IQuery.Sql.Clear;
     IQuery.Sql.Add('SELECT DESCRICAO FROM IBGE WHERE UF_SIGLA = :UF_SIGLA');
     IQuery.ParamByName('UF_SIGLA').AsString := UF_DESCARREGA.Text;
     IQuery.Prepare;

     IQuery.Open;

     IQuery.First;

     while not IQuery.Eof do
     Begin

      ListBox1.Items.Add(IQuery.FieldByName('DESCRICAO').AsString);
      IQuery.Next;
     End;

    Grid_Notas.Columns[0].PickList:= ListBox1.Items;
    Set_Campos(False);
    Habilitar(False);
    Botoes_Normal;
    Consulta.TabVisible := True;
    Operacao := '';

  end; 
end;

procedure TFrmMde.Button1Click(Sender: TObject);
var
MyFile: TextFile;
InputString, Buffer,S : String;
copias, Dividir,Linhas,Lin : Integer;
meio : Real;
begin
if not QTabela.IsEmpty then
Begin
{ if Application.MessageBox('Deseja imprimir o comprovante?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = idYes then
          begin
            InputString := InputBox(PChar(Msg_Title), 'Cópias', '1');

            AssignFile(MyFile, ExtractFilePath(ParamStr(0)) + 'Recibo.Txt');
            Rewrite(MyFile);

            for Copias := 1 to StrToInt(InputString) do
            begin
              if LeIni(Arq_Ini, 'Sistema', 'Linha Cabeçalho') <> '' then
                WriteLn(MyFile, LeIni(Arq_Ini, 'Sistema', 'Linha Cabeçalho'))
              else
              begin
                Meio    := ((48 - Length(FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString)) / 2);
                Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));

                Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ') + FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString);

                Meio    := ((48 - Length(FrmPrincipal.QEmpresa.FieldByName('TELEFONE').AsString)) / 2);
                Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));

                Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ') + FrmPrincipal.QEmpresa.FieldByName('TELEFONE').AsString);

                Meio    := ((48 - Length(FrmPrincipal.QEmpresa.FieldByName('ENDERECO').AsString)) / 2);
                Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));

                Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ') + FrmPrincipal.QEmpresa.FieldByName('ENDERECO').AsString);

                Meio    := ((48 - Length(FrmPrincipal.QEmpresa.FieldByName('BAIRRO').AsString + ' - ' + FrmPrincipal.QEmpresa.FieldByName('MUNICIPIO').AsString)) / 2);
                Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));

                Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ') + FrmPrincipal.QEmpresa.FieldByName('BAIRRO').AsString + ' - ' + FrmPrincipal.QEmpresa.FieldByName('MUNICIPIO').AsString);

                Meio    := ((48 - Length('CEP: ' + FrmPrincipal.QEmpresa.FieldByName('CEP').AsString + ' - ' + 'CNPJ: ' + FrmPrincipal.QEmpresa.FieldByName('CNPJ').AsString)) / 2);
                Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));

                Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ') + 'CEP: ' + FrmPrincipal.QEmpresa.FieldByName('CEP').AsString + ' - ' + 'CNPJ: ' + FrmPrincipal.QEmpresa.FieldByName('CNPJ').AsString);

                Meio    := ((48 - Length('Hora: ' + TimeToStr(now) + '  Data: ' + DateToStr(date))) / 2);
                Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));


              end;
              Writeln(MyFile, '------------------------------------------------');
              Writeln(MyFile, '       R E C I B O  N Ã O  F I S C A L          ');
              Writeln(MyFile, '------------------------------------------------');
              Writeln(MyFile, 'Nº: '+ NO_DOC_FISCAL.Text + ' Data: ' + DateToStr(Date));
              Writeln(MyFile, '------------------------------------------------');
              Writeln(MyFile, 'CTE:'+ QTransacao.FieldByName('CHAVE_NFE').AsString);
              Writeln(MyFile, '------------------------------------------------');
              Writeln(MyFile, 'Valor: R$'+ (FormatFloat('#,##0.00', QTransacao.FieldByName('VALOR').AsFloat)));
              Writeln(MyFile, '------------------------------------------------');
              Writeln(MyFile, '            Relação das Notas Fiscais           ');
              Writeln(MyFile, '------------------------------------------------');
              Writeln(MyFile, 'Data          /    Nota Fiscal             Valor ');
              Writeln(MyFile, '------------------------------------------------');

              QNotas.First;
              while not QNotas.Eof do
              begin
                Writeln(MyFile, QNotas.FieldByName('DT_EMISSAO').AsString  + '   /      ' +
                                ForcaComprimento(QNotas.FieldByName('NUM_DOC').AsString, 13, ' ') +
                                ForcaComprimento(' ', 14 - Length(FormatFloat('#,##0.00', QNotas.FieldByName('VALOR').AsFloat)), ' ') +
                                FormatFloat('#,##0.00', QNotas.FieldByName('VALOR').AsFloat));

                Application.ProcessMessages;

                QNotas.Next;
              end;

              Writeln(MyFile, '                                       ---------');


              if (QTransacao.FieldByName('COND_PAGTO').AsString = 'A PRAZO') then
              begin
                Writeln(MyFile, 'Cliente: ' + QParceiro.FieldByName('NOME').AsString);
                Writeln(MyFile, 'CPF/CNPJ: ' + QParceiro.FieldByName('CNPJ').AsString);
                Writeln(MyFile, 'Endereco: ' + QParceiro.FieldByName('ENDERECO').AsString + ', ' + QParceiro.FieldByName('NUMERO').AsString);
                Writeln(MyFile, 'Bairro/Cidade: ' + QParceiro.FieldByName('BAIRRO').AsString + ', ' + QParceiro.FieldByName('MUNICIPIO').AsString);
                Writeln(MyFile, 'CEP: ' + QParceiro.FieldByName('CEP').AsString);
                Writeln(MyFile, '');

                QParcelas.Sql.Clear;
                QParcelas.Sql.Add('SELECT * FROM TRANSPARCELAS');
                QParcelas.Sql.Add('WHERE');
                QParcelas.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
                QParcelas.Sql.Add('AND (TIPO_TRANSACAO = :TIPO_TRANSACAO)');
                QParcelas.Sql.Add('AND (BANCO_ID = 0)');

                QParcelas.ParamByName('TRANSACAO_ID').AsInteger  := ID;
                QParcelas.ParamByName('TIPO_TRANSACAO').AsString := 'T';

                QParcelas.Prepare;
                QParcelas.Open;

                QParcelas.First;

                while not QParcelas.Eof do
                begin
                  Writeln(MyFile, 'Vencimento: ' + QParcelas.FieldByName('DT_VENCIMENTO').AsString +
                                                   '          Valor : ' + FormatFloat('#,##0.00', QParcelas.FieldByName('VALOR').AsFloat));
                  Application.ProcessMessages;
                  QParcelas.Next;
                end;

                Writeln(MyFile, '');
                Writeln(MyFile, '');
                Writeln(MyFile, '       _________________________________        ');
                Writeln(MyFile, '             Assinatura do Cliente              ');
              end
              else
              begin
                if Nome_Transportador.Text <> '' then
                begin
                  Writeln(MyFile, 'Cliente: ' + Nome_Transportador.Text);
                  Writeln(MyFile, 'Endereço: ' + Endereco_Transportador.Text + ', ' + N_Transportador.text);
                  Writeln(MyFile, 'Bairro: ' + Bairro_Transportador.Text);
                  Writeln(MyFile, 'Cidade: ' + Municipio_Transportador.Text);
                end;

                Writeln(MyFile, '');
                Writeln(MyFile, '');
                Writeln(MyFile, '       _________________________________        ');
                Writeln(MyFile, '             Assinatura do Cliente              ');
              end;


              Writeln(MyFile, '');
              Writeln(MyFile, '');
              Writeln(MyFile, '------------------------------------------------');
              Writeln(MyFile, '             NAO É DOCUMENTO FISCAL             ');
              Writeln(MyFile, ' NÃO E VÁLIDO COMO RECIBO E COMO GARANTIA DE    ');
              Writeln(MyFile, '       SERVIÇO - NÃO COMPROVA PAGAMENTO.        ');
              Writeln(MyFile, '        EXIGIR  EMISSÃO CTe ELETRÔNICO          ');
              Writeln(MyFile, '------------------------------------------------');


              for Linhas := 1 to StrToInt(LeIni(Arq_Ini, 'Sistema', 'Linhas')) do
                Writeln(MyFile, ' ');
            end;

            CloseFile(MyFile);

            AssignFile(MyFile, ExtractFilePath(ParamStr(0)) + 'Recibo.Txt');
            Reset(MyFile);

            Buffer := '';

            Lin := 1;

            RDprint1.Abrir;

            RDprint1.Impressora        := BOBINA;
            RDprint1.TamanhoQteLinhas  := 1;
            RDprint1.TamanhoQteColunas := 48;
            RDprint1.Acentuacao        := SemAcento;
            RDprint1.MostrarProgresso  := True;
            RDprint1.ImpASCII(01, 01, '27 64');

            while not Eof(MyFile) do
            begin
              ReadLn(MyFile, S);

              Buffer := S;

              RDprint1.Imp(Lin, 01, Buffer);

              Inc(Lin);


              Application.ProcessMessages;
            end;

            CloseFile(MyFile);
            RDprint1.TamanhoQteLinhas  := lin;
            RDprint1.OpcoesPreview.Preview := true;

            RDprint1.Fechar;
          end; }
End
Else 
Application.MessageBox('Não existe CT-e Gerado, favor Verificar!', PChar(Msg_Title), mb_IconInformation);
end;

procedure TFrmMde.CFOP_COMPLExit(Sender: TObject);
begin
  DetailSearch('CFOP');
end;

procedure TFrmMde.CNPJ_TRANSPORTADORKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmMde.COND_PAGTOExit(Sender: TObject);
begin
 DetailSearch('');

  if Validacao then
  begin
    if NO_DOC_FISCAL.Value > 0 then
    Begin
    //  Edit;
      Grid_Notas.Enabled := True;
      Grid_Notas.SetFocus;
    End
    else
    Begin
     // Insert;
      Grid_Notas.Enabled := True;
      Grid_Notas.SetFocus;
    End;
  end
  Else
  Grid_Notas.Enabled := False;

end;

procedure TFrmMde.DT_SAIDAEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmMde.DT_SAIDAExit(Sender: TObject);
begin
 HR_SAIDA.Text            := TimeToStr(time);
end;

procedure TFrmMde.DT_SAIDAKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if (Key = Vk_F7) and (Sender = CNPJ_TRANSPORTADOR) then
    btnFornecedorClick(Sender);

  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmMde.FDQuery12BeforeEdit(DataSet: TDataSet);
begin
if FrmData.QAcesso.FieldByName('ALTERACAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para alteração', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

end;

procedure TFrmMde.FDQuery12BeforePost(DataSet: TDataSet);
begin

  if (QNotas.FieldByName('MUNICIPIO_DESCARREGA').AsString = '')  then
  begin
    Application.MessageBox('Favor informar municipio para descarregamento.', PChar(Msg_Title), mb_IconStop);
    Grid_Notas.SelectedIndex := 0;
    abort;
  end;

  if (QNotas.FieldByName('LACRE').AsString = '')  then
  begin
    Application.MessageBox('Favor número do lacre.', PChar(Msg_Title), mb_IconStop);
    Grid_Notas.SelectedIndex := 3;
    abort;
  end;

  if (TIPO_EMITENTE.Text = 'PRESTADOR DE SERVIÇO DE TRANSPORTE') then
  Begin
    if (not Verifica_ChaveNfe(StrZero(AllTrim(QNotas.FieldByName('CTE').AsString),0,44))) then
    Begin
      Application.MessageBox('Dígito Verificador da Chave CtE incorreto favor verificar a digitação!', PChar(Msg_Title), mb_IconStop);
      Grid_Notas.SelectedIndex := 2;
      abort;
    End;
  End;

  if (TIPO_EMITENTE.Text ='NÃO PRESTADOR DE SERVIÇO DE TRANSPORTE') then
  begin
    if (not Verifica_ChaveNfe(StrZero(AllTrim(QNotas.FieldByName('NFE').AsString),0,44))) then
    Begin
     Application.MessageBox('Dígito Verificador da Chave Nfe incorreto favor verificar a digitação!', PChar(Msg_Title), mb_IconStop);
     Grid_Notas.SelectedIndex := 3;
     abort;
    End;
  end;

  if not QNotas.FieldByName('LACRE').IsNull then
  Inc(id_lacre);
  QNotas.FieldByName('LACRE').AsString := IntToStr(id_lacre);

  {  IQuery.Sql.Clear;
    IQuery.Sql.Add('SELECT * FROM COMPL_MDEFISCAL_NOTAS');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(MDEFISCAL_ID = :MDEFISCAL_ID)');
    IQuery.Sql.Add('AND (IBGE = :IBGE)');

    IQuery.ParamByName('MDEFISCAL_ID').AsInteger := QTabela.FieldByName('MDEFISCAL_ID').AsInteger;
    IQuery.ParamByName('IBGE').AsString   := QNotas.FieldByName('IBGE').AsString;

    IQuery.Prepare;
    IQuery.Open;

    if (Not IQuery.IsEmpty)  then
    begin
      Application.MessageBox('Municipio descarregamento já lançado.!', PChar(Msg_Title), mb_IconStop);
      Grid_Notas.SelectedIndex := 0;
      abort;
    end; }

    if Existe_Mdfe(QTabela.FieldByName('MDEFISCAL_ID').AsInteger) then
    begin
      Application.MessageBox('Mdf-e já foi impressa. Impossível continuar.', PChar(Msg_Title), mb_IconStop);
      Grid_Notas.SelectedIndex := 0;
      abort;
    end;


end;

procedure TFrmMde.FDQuery12NewRecord(DataSet: TDataSet);
begin
DataSet['MDEFISCAL_ID']         := QTabela.FieldByName('MDEFISCAL_ID').AsInteger;
DataSet['MUNICIPIO_DESCARREGA'] := ' ';
DataSet['CTE']                  := ' ';
DataSet['NFE']                  := ' ';
DataSet['TP_TRANSPORTE']        := ' ';
DataSet['ID_TRANSPORTE']        := ' ';
DataSet['LACRE']                := ' ';
DataSet['IBGE']                 := ' ';

end;

procedure TFrmMde.FDQuery12PostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
Application.MessageBox(Pchar('Dados Duplicados favor Verificar!'),'MDF-e', MB_IconStop + MB_OK);
end;

procedure TFrmMde.FDQuery12UpdateError(ASender: TDataSet;
  AException: EFDException; ARow: TFDDatSRow; ARequest: TFDUpdateRequest;
  var AAction: TFDErrorAction);
begin
Application.MessageBox(Pchar('Dados Duplicados favor Verificar!'),'MDF-e', MB_IconStop + MB_OK);
end;

procedure TFrmMde.FDQuery13BeforeEdit(DataSet: TDataSet);
begin
  if FrmData.QAcesso.FieldByName('ALTERACAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para alteração', PChar(Msg_Title), mb_IconStop);
    exit;
  end;
end;

procedure TFrmMde.FDQuery13BeforePost(DataSet: TDataSet);
begin
    IQuery.Sql.Clear;
    IQuery.Sql.Add('SELECT * FROM COMPL_MDEFISCAL_UF');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(MDEFISCAL_ID = :MDEFISCAL_ID)');
    IQuery.Sql.Add('AND (UF_PERCURSO = :UF_PERCURSO)');

    IQuery.ParamByName('MDEFISCAL_ID').AsInteger := QTabela.FieldByName('MDEFISCAL_ID').AsInteger;
    IQuery.ParamByName('UF_PERCURSO').AsString   := QNotas_UF.FieldByName('UF_PERCURSO').AsString;

    IQuery.Prepare;
    IQuery.Open;

    if (Not IQuery.IsEmpty)  then
    begin
      Application.MessageBox('UF de Percurso já lançada.!', PChar(Msg_Title), mb_IconStop);
      Grid_Notas_Uf.SelectedIndex := 0;
      abort;
    end;

    if Existe_Mdfe(QTabela.FieldByName('MDEFISCAL_ID').AsInteger) then
    begin
      Application.MessageBox('Mdf-e já foi impressa. Impossível continuar.', PChar(Msg_Title), mb_IconStop);
      Grid_Notas_Uf.SelectedIndex := 0;
      abort;
    end;
end;

procedure TFrmMde.FDQuery13NewRecord(DataSet: TDataSet);
begin
DataSet['MDEFISCAL_ID']         := QTabela.FieldByName('MDEFISCAL_ID').AsInteger;
end;

procedure TFrmMde.FDQuery13PostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
try
Application.MessageBox(Pchar('Dados Duplicados favor Verificar!'),'MDF-e', MB_IconStop + MB_OK);
except

end;

end;

procedure TFrmMde.FDQuery13UpdateError(ASender: TDataSet;
  AException: EFDException; ARow: TFDDatSRow; ARequest: TFDUpdateRequest;
  var AAction: TFDErrorAction);
begin
try
Application.MessageBox(Pchar('Dados Duplicados favor Verificar!'),'MDF-e', MB_IconStop + MB_OK);
except

end;

end;

procedure TFrmMde.FORMA_EMISSAOClick(Sender: TObject);
begin
Forma_Emissao.Style := csDropDownList;
end;

procedure TFrmMde.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action := caFree;
end;

procedure TFrmMde.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
if (Operacao = 'Inserindo') or (Operacao = 'Alterando') or (QNotas.State in [dsInsert, dsEdit]) then
  begin
    Application.MessageBox('É melhor salvar as alterações antes de continuar', PChar(Msg_Title), mb_IconStop);
    CanClose := False;
  end;
end;

procedure TFrmMde.FormCreate(Sender: TObject);
begin
CmdSelect := QTabela.Sql.Text;

  if Id_Trans = 0 then
    CmdSelectNull := 'WHERE (MDEFISCAL_ID IS NOT NULL) AND (DT_SAIDA = :DT_SAIDA) AND (EMPRESA_ID = :EMPRESA_ID)'
  else
    CmdSelectNull := 'WHERE (MDEFISCAL_ID = ' + IntToStr(Id_Trans) + ') AND (EMPRESA_ID = :EMPRESA_ID)';


  CmdOrderBy := 'ORDER BY MDEFISCAL_ID';


  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

  if Id_Trans = 0 then
    QTabela.ParamByName('DT_SAIDA').AsDateTime := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;


  QTabela.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;

  QTabela.Prepare;
  QTabela.Open;



  QNotas.Close;
  QNotas.ParamByName('MDEFISCAL_ID').AsInteger              := QTabela.FieldByName('MDEFISCAL_ID').AsInteger;
  QNotas.Prepare;
  QNotas.Open;


  QNotas_UF.Close;
  QNotas_UF.ParamByName('MDEFISCAL_ID').AsInteger           := QTabela.FieldByName('MDEFISCAL_ID').AsInteger;
  QNotas_UF.Prepare;
  QNotas_UF.Open;


  QNotas_Motorista.Close;
  QNotas_Motorista.ParamByName('MDEFISCAL_ID').AsInteger    := QTabela.FieldByName('MDEFISCAL_ID').AsInteger;
  QNotas_Motorista.Prepare;
  QNotas_Motorista.Open;




  Set_Campos(False);

  Consulta.Show;

end;

procedure TFrmMde.FormShow(Sender: TObject);
var
IniFile: String;
Ini: TIniFile;
StreamMemo: TMemoryStream;
begin
  Set_Campos(False);
  Botoes_Normal;
end;

procedure TFrmMde.GerarXMLClick(Sender: TObject);
begin
  Application.CreateForm(TFrmPasswordDlg, FrmPasswordDlg);
  try
    if FrmPasswordDlg.ShowModal = mrOk then
    begin
      if FrmPasswordDlg.Password.Text = Senha_Suporte then
      begin
         GeraXML := True;
         btnGeraClick(Sender);
         GeraXML := False;

        if LeIni(Arq_Ini, 'Sistema', 'Organizar Janelas Automaticamente') = 'True' then
          Cascade;
      end
      else
        Application.MessageBox('Acesso negado', PChar(Msg_Title), mb_IconStop);
    end;
  finally
    FrmPasswordDlg.Release;
  end;

end;

procedure TFrmMde.Grid_NotasColExit(Sender: TObject);
begin
if QNotas.State in [dsInsert, dsEdit] then
  begin
   try
    if Grid_notas.SelectedField.FieldName = 'municipio_descarrega' then
    begin

    IQuery.SQL.Clear;
    IQuery.SQL.Add('SELECT CODIGO FROM IBGE WHERE DESCRICAO = :DESCRICAO AND UF_SIGLA = :UF_SIGLA');
    IQuery.ParamByName('DESCRICAO').AsString := QNotas.FieldByName('MUNICIPIO_DESCARREGA').AsString;
    IQuery.ParamByName('UF_SIGLA').AsString  := QTabela.FieldByName('UF_DESCARREGA').AsString;
    IQuery.Prepare;
    IQuery.Open;

    QNotas.FieldByName('IBGE').AsString := IQuery.FieldByName('CODIGO').AsString;

    end;
   finally

   end;
  end;

end;

procedure TFrmMde.Grid_NotasEnter(Sender: TObject);
begin
Botoes_Disable;
Consulta.TabVisible := False;
end;

procedure TFrmMde.Grid_NotasExit(Sender: TObject);
begin
 if FrmData.QAcesso.FieldByName('ALTERACAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para alteração', PChar(Msg_Title), mb_IconStop);
    Botoes_Normal;
    Consulta.TabVisible := True;
    exit;
  end;

  if QTabela.FieldByName('DT_SAIDA').AsDateTime < FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime then
  begin
    Application.MessageBox('Movimento já encerrado', PChar(Msg_Title), mb_IconStop);
    Botoes_Normal;
    Consulta.TabVisible := True;
    exit;
  end;

  if Existe_Mdfe(QTabela.FieldByName('MDEFISCAL_ID').AsInteger) then
  begin
    Botoes_Normal;
    Consulta.TabVisible := True;
    exit;
  end;

  btnEditClick(Self);
 //Botoes_Normal;

end;

procedure TFrmMde.Grid_NotasKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
InputString: String;
begin
  if (Key = Vk_F4) and (QNotas.State = dsBrowse) and (not QNotas.IsEmpty) then
    QNotas.Delete;

  if (Key = Vk_F7) and (QNotas.State = dsBrowse) and (not QNotas.IsEmpty) then
  begin
    InputString := InputBox('Localizar', 'Num. de Chave Nfe:', '');

    if InputString <> '' then
      QNotas.Locate('NFE', InputString, [loCaseInsensitive]);
  end;

  if (Key = Vk_F8) and (QNotas.State = dsBrowse) and (not QNotas.IsEmpty) then
  begin
    InputString := InputBox('Localizar', 'Num. de Chave CTe:', '');

    if InputString <> '' then
      QNotas.Locate('CTE', InputString, [loCaseInsensitive]);
  end;


  if Key = VK_F9 then
    Perform(Wm_NextDlgCtl, 0, 0);

  if ((Key = Vk_Up) or (Key = Vk_Down)) and (QNotas.State in [dsInsert, dsEdit]) then
    Key := 0;

end;

procedure TFrmMde.Grid_NotasKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #46 then
    Key := #44;

  if Key = #13 then
    Keybd_Event(VK_TAB, 0, 0, 0);

  Key := AnsiUpperCase(Key)[1];
end;

end.
