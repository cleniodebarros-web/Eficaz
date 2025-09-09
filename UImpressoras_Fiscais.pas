unit UImpressoras_Fiscais;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ComCtrls, ToolWin, StdCtrls, Grids, DBGrids, Tabs, ExtCtrls,
  DB,  Mask, rxToolEdit, Buttons, rxCurrEdit,IdHashMessageDigest,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys,
  FireDAC.VCLUI.Wait,  FireDAC.Phys.PG, FireDAC.Comp.UI,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, Bde.DBTables;

type
  TFrmImpressoras_Fiscais = class(TForm)
    PageControl1: TPageControl;
    Panel1: TPanel;
    Consulta: TTabSheet;
    Manutencao: TTabSheet;
    DBGrid1: TDBGrid;
    DataTabela: TDataSource;
    Label3: TLabel;
    SERIAL: TEdit;
    TIPO_ECF: TEdit;
    VERSAO_SB: TEdit;
    IE: TEdit;
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
    Label4: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    NUM_ECF: TEdit;
    NUM_VERSAO: TEdit;
    DT_INST_SB: TDateEdit;
    Label21: TLabel;
    GRANDE_TOTAL: TRxCalcEdit;
    Label22: TLabel;
    Label26: TLabel;
    MARCA_ECF: TEdit;
    MODELO: TEdit;
    Label36: TLabel;
    Label45: TLabel;
    HR_INST_SB: TMaskEdit;
    CNI: TEdit;
    Label1: TLabel;
    LICENCA: TEdit;
    btnCNI: TSpeedButton;
    QTabela: TFDQuery;
    IQuery: TFDQuery;
    Label5: TLabel;
    Label6: TLabel;
    ip: TEdit;
    usuario: TEdit;
    senha: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    banco: TEdit;
    StatusBar1: TStatusBar;
    Label9: TLabel;
    Label10: TLabel;
    BitBtn1: TBitBtn;
    VerificaPdvs: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    IdTCPClient1: TIdTCPClient;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    porta: TEdit;
    Tab_AtivarPdvs: TTabSheet;
    btn_exportar_cliente: TButton;
    btn_tributos: TButton;
    btn_exportar_produto: TButton;
    btn_operadores: TButton;
    btn_finalizadoras: TButton;
    Btn_Ibtp: TButton;
    Btn_Configuracoes: TButton;
    Chk_Total: TCheckBox;
    QUpdate: TFDQuery;
    EventoRetornoImpressora: TFDEventAlerter;
    GroupBox1: TGroupBox;
    Ecf001: TCheckBox;
    Ecf011: TCheckBox;
    Ecf021: TCheckBox;
    Ecf022: TCheckBox;
    Ecf012: TCheckBox;
    Ecf002: TCheckBox;
    Ecf003: TCheckBox;
    Ecf013: TCheckBox;
    Ecf023: TCheckBox;
    Ecf024: TCheckBox;
    Ecf014: TCheckBox;
    Ecf004: TCheckBox;
    Ecf025: TCheckBox;
    Ecf015: TCheckBox;
    Ecf005: TCheckBox;
    Ecf026: TCheckBox;
    Ecf016: TCheckBox;
    Ecf006: TCheckBox;
    Ecf007: TCheckBox;
    Ecf017: TCheckBox;
    Ecf027: TCheckBox;
    Ecf028: TCheckBox;
    Ecf018: TCheckBox;
    Ecf008: TCheckBox;
    Ecf009: TCheckBox;
    Ecf019: TCheckBox;
    Ecf029: TCheckBox;
    Ecf030: TCheckBox;
    Ecf020: TCheckBox;
    Ecf010: TCheckBox;
    Todas_Ecfs: TCheckBox;
    Ecf031: TCheckBox;
    Ecf032: TCheckBox;
    Ecf033: TCheckBox;
    Ecf034: TCheckBox;
    Ecf035: TCheckBox;
    Ecf036: TCheckBox;
    Ecf037: TCheckBox;
    Ecf038: TCheckBox;
    Ecf039: TCheckBox;
    Ecf040: TCheckBox;
    Gerar_Sped: TCheckBox;
    Btn_ReiniciaSync: TButton;
    ProgressBar1: TProgressBar;
    Label11: TLabel;
    Label2: TLabel;
    pathnfce_local: TEdit;
    Label12: TLabel;
    Label18: TLabel;
    pathnfce_servidor: TEdit;
    BatchMove1: TBatchMove;
    BatchMove2: TBatchMove;
    dt_sync: TDateEdit;
    dt_sync_cli: TDateEdit;
    Label19: TLabel;
    pathnfce_servidor_env: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRetornaClick(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDiscardClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure ManutencaoShow(Sender: TObject);
    procedure btnPriorClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SERIALKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure DT_INST_SBEnter(Sender: TObject);
    procedure btnCNIClick(Sender: TObject);
    procedure CNIExit(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure Todas_EcfsClick(Sender: TObject);
    procedure Tab_AtivarPdvsShow(Sender: TObject);
    procedure btn_exportar_clienteClick(Sender: TObject);
    procedure btn_exportar_produtoClick(Sender: TObject);
    procedure btn_finalizadorasClick(Sender: TObject);
    procedure Btn_ConfiguracoesClick(Sender: TObject);
    procedure btn_tributosClick(Sender: TObject);
    procedure btn_operadoresClick(Sender: TObject);
    procedure Btn_IbtpClick(Sender: TObject);
    procedure EventoRetornoImpressoraAlert(ASender: TFDCustomEventAlerter;
      const AEventName: string; const AArgument: Variant);
    procedure Btn_ReiniciaSyncClick(Sender: TObject);
    procedure Ecf001Click(Sender: TObject);
    procedure Imp_Registros60Show(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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
    function Validacao: Boolean;
    Procedure VerificarConexao;
  end;

var
  FrmImpressoras_Fiscais: TFrmImpressoras_Fiscais;
  Operacao, ID: String;
  Abertura:Integer;
  DateEdit : TDateEdit;
  procedure Carga_Sync(TP:INTEGER);


implementation

uses
  UPrincipal, UData, UConsulta_CST ;

{$R *.dfm}

procedure Carga_sync(TP:INTEGER);
begin
  Abertura := tp;

  if not ThereIs('Impressoras Fiscais') then
  Begin
    TFrmImpressoras_fiscais.Create(Application);
  End;

  if LeIni(Arq_Ini, 'Sistema', 'Organizar Janelas Automaticamente') = 'True' then
    FrmPrincipal.Cascade;
end;

Procedure TFrmImpressoras_Fiscais.VerificarConexao;
Begin
  If Banco.Text <> '' Then
  Begin
     try
       if IdTCPClient1.Connected Then
       IdTCPClient1.Disconnect;
               
       IdTCPClient1.Host := ip.Text;
       IdTCPClient1.Port := StrToInt(porta.text);
       IdTCPClient1.ConnectTimeout := 1000;
       IdTCPClient1.Connect;       

        if IdTCPClient1.Connected Then 
        Begin
        TRY
           VerificaPdvs.Connected := False;
           VerificaPdvs.Params.Clear;
           VerificaPdvs.Params.Add('Database= ' +  banco.Text);
           VerificaPdvs.Params.Add('User_Name= ' + USUARIO.Text);
           VerificaPdvs.Params.Add('Password= ' + senha.Text);
           VerificaPdvs.Params.Add('Server= ' +  ip.Text);
           VerificaPdvs.Params.Add('Port=' + porta.Text);
           VerificaPdvs.Params.Add('MonitorBy=Remote');
           VerificaPdvs.Params.Add('DriverID=PG');
           VerificaPdvs.Params.Add('LoginTimeout=500');
           VerificaPdvs.Connected :=True;

           IF VerificaPdvs.Connected Then
           begin
           Label10.Font.Color := clGreen;
           Label10.Caption := banco.Text +' - CONECTADO!';  
           end;

           EXCEPT
            Label10.Font.Color := clRed;
            Label10.Caption := banco.Text +' - NÃO CONECTADO!';
           END;
       
        End;
     except
      Label10.Font.Color := clRed;
      Label10.Caption := banco.Text +' - NÃO CONECTADO!';
      raise;
     end;  
  
  End
  
  

End;

function LogEntry(Cmd, Msg: String; Dig: String): String;
begin
  Result := Format('%s%s' + '%s', [Cmd, Msg, Dig]);
end;

procedure TFrmImpressoras_Fiscais.DT_INST_SBEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmImpressoras_Fiscais.BitBtn1Click(Sender: TObject);
begin
VerificarConexao;
end;

procedure TFrmImpressoras_Fiscais.Botoes_Editing;
begin
  btnPrior.Enabled       := False;
  btnNext.Enabled        := False;
  btnInsert.Enabled      := False;
  btnEdit.Enabled        := False;
  btnDelete.Enabled      := False;
  btnSave.Enabled        := True;
  btnDiscard.Enabled     := True;
  btnRetorna.Enabled     := False;
  btnCNI.Enabled         := True;
end;

procedure TFrmImpressoras_Fiscais.Botoes_Normal;
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

  btnSave.Enabled       := False;
  btnDiscard.Enabled    := False;
  btnRetorna.Enabled    := True;
  btnCNI.Enabled        := False;
end;

procedure TFrmImpressoras_Fiscais.Habilitar(Status: Boolean);
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
    if TCheckBox(Temp).Name = 'Gerar_Sped' then
      TCheckBox(Temp).Enabled := Status;
  end;
end;

procedure TFrmImpressoras_Fiscais.Insert;
var
I: Integer;
Temp: TComponent;
Sql, Par: String;
begin
  Sql := 'INSERT INTO LICENCA_IF(';
  Par := '';

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
    begin
      if Sql = 'INSERT INTO LICENCA_IF(' then
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
      if Sql = 'INSERT INTO LICENCA_IF(' then
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
      if Sql = 'INSERT INTO LICENCA_IF(' then
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
      if Sql = 'INSERT INTO LICENCA_IF(' then
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
      if Sql = 'INSERT INTO LICENCA_IF(' then
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
      if Sql = 'INSERT INTO LICENCA_IF(' then
        Sql := Sql + TCurrencyEdit(Temp).Name
      else
        Sql := Sql + ', ' + TCurrencyEdit(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TCurrencyEdit(Temp).Name
      else
        Par := Par + ', :' + TCurrencyEdit(Temp).Name;
    end;

    if Temp is TCheckBox then
    begin
     if TCheckBox(Temp).Name = 'Gerar_Sped' then
     Begin
      if Sql = 'INSERT INTO LICENCA_IF(' then
        Sql := Sql + TCheckBox(Temp).Name
      else
        Sql := Sql + ', ' + TCheckBox(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TCheckBox(Temp).Name
      else
        Par := Par + ', :' + TCheckBox(Temp).Name;
     End;
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

     if Temp is TCheckBox then
      begin
       if TCheckBox(Temp).Name = 'Gerar_Sped' then
       Begin
        if TCheckBox(Temp).Checked then
          IQuery.ParamByName(TCheckBox(Temp).Name).AsInteger := 1
        else
          IQuery.ParamByName(TCheckBox(Temp).Name).AsInteger := 0;
       End;
      end;

  end;

  IQuery.Prepare;
  IQuery.ExecSql;



  Habilitar(False);
end;

procedure TFrmImpressoras_Fiscais.Ecf001Click(Sender: TObject);
begin
 btn_exportar_cliente.enabled := True;
 btn_tributos.enabled         :=  True;
 btn_exportar_produto.Enabled := True;
 btn_operadores.Enabled       := true;
 btn_finalizadoras.Enabled    := True;
 Btn_Ibtp.Enabled             := True;
 Btn_Configuracoes.enabled    := True;

end;

procedure TFrmImpressoras_Fiscais.Edit;
var
I: Integer;
Temp: TComponent;
Sql: String;
begin
  Sql := 'UPDATE LICENCA_IF SET ';

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
    begin
      if Sql = 'UPDATE LICENCA_IF SET ' then
        Sql := Sql + TEdit(Temp).Name + ' = :' + TEdit(Temp).Name
      else
        Sql := Sql + ', ' + TEdit(Temp).Name + ' = :' + TEdit(Temp).Name;
    end;

    if Temp is TMaskEdit then
    begin
      if Sql = 'UPDATE LICENCA_IF SET ' then
        Sql := Sql + TMaskEdit(Temp).Name + ' = :' + TMaskEdit(Temp).Name
      else
        Sql := Sql + ', ' + TMaskEdit(Temp).Name + ' = :' + TMaskEdit(Temp).Name;
    end;

    if Temp is TComboBox then
    begin
      if Sql = 'UPDATE LICENCA_IF SET ' then
        Sql := Sql + TComboBox(Temp).Name + ' = :' + TComboBox(Temp).Name
      else
        Sql := Sql + ', ' + TComboBox(Temp).Name + ' = :' + TComboBox(Temp).Name;
    end;

    if Temp is TDateEdit then
    begin
      if Sql = 'UPDATE LICENCA_IF SET ' then
        Sql := Sql + TDateEdit(Temp).Name + ' = :' + TDateEdit(Temp).Name
      else
        Sql := Sql + ', ' + TDateEdit(Temp).Name + ' = :' + TDateEdit(Temp).Name;
    end;

    if Temp is TRxCalcEdit then
    begin
      if Sql = 'UPDATE LICENCA_IF SET ' then
        Sql := Sql + TRxCalcEdit(Temp).Name + ' = :' + TRxCalcEdit(Temp).Name
      else
        Sql := Sql + ', ' + TRxCalcEdit(Temp).Name + ' = :' + TRxCalcEdit(Temp).Name;
    end;

    if Temp is TCurrencyEdit then
    begin
      if Sql = 'UPDATE LICENCA_IF SET ' then
        Sql := Sql + TCurrencyEdit(Temp).Name + ' = :' + TCurrencyEdit(Temp).Name
      else
        Sql := Sql + ', ' + TCurrencyEdit(Temp).Name + ' = :' + TCurrencyEdit(Temp).Name;
    end;

    if Temp is TCheckBox then
    begin
     if TCheckBox(Temp).Name = 'Gerar_Sped' then
     Begin
        if Sql = 'UPDATE LICENCA_IF SET ' then
          Sql := Sql + TCheckBox(Temp).Name + ' = :' + TCheckBox(Temp).Name
        else
          Sql := Sql + ', ' + TCheckBox(Temp).Name + ' = :' + TCheckBox(Temp).Name;
     End;
    end;

  end;

  Sql := Sql + ' WHERE (SERIAL = :ID)';
  

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

    if Temp is TCheckBox then
    begin
      if TCheckBox(Temp).Name = 'Gerar_Sped' then
      Begin
        if TCheckBox(Temp).Checked then
          IQuery.ParamByName(TCheckBox(Temp).Name).AsInteger := 1
        else
          IQuery.ParamByName(TCheckBox(Temp).Name).AsInteger := 0;
      End;
    end;

  end;

  IQuery.ParamByName('ID').AsString := QTabela.FieldByName('SERIAL').AsString;

  IQuery.Prepare;
  IQuery.ExecSql;



  QTabela.Close;

  QTabela.Prepare;
  QTabela.Open;

  QTabela.Locate('SERIAL', ID, [loCaseInsensitive]);
  Habilitar(False);
end;

procedure TFrmImpressoras_Fiscais.EventoRetornoImpressoraAlert(
  ASender: TFDCustomEventAlerter; const AEventName: string;
  const AArgument: Variant);
var
Temp:TComponent;
i:Integer;
begin

  if (AEventName = 'reiniciosync_ok') then
  Begin
     FrmPrincipal.Abertura.Refresh;
     Progressbar1.Visible := False;
     Label11.Caption := 'Data/Hora último reinicio do EficazSync: ' + DateToStr(FrmPrincipal.Abertura.FieldByname('DT_SYNC').AsDateTime) + ' - ' + TimeToStr(FrmPrincipal.Abertura.FieldbyName('HR_SYNC').AsDateTime);
     Application.MessageBox('EficazSync reiniciado com sucesso!!','Eficaz', MB_ICONINFORMATION + MB_OK);
  End;

  if (AEventName = 'clientes_ok') then
  Begin
     IQuery.SQL.Clear;
     IQuery.SQL.Add('SELECT * FROM LICENCA_IF WHERE STATUS = :STATUS AND IMPORTACAO = :IMPORTACAO');
     IQuery.ParamByName('STATUS').AsString := 'A';
     IQuery.ParamByName('IMPORTACAO').AsInteger := 10;
     IQuery.Prepare;
     IQuery.Open;

     if IQuery.IsEmpty then
     Begin
       Progressbar1.Visible := False;
       Application.MessageBox('Arquivo de clientes transferido para o destino!!','Eficaz', MB_ICONINFORMATION + MB_OK);
       btn_exportar_cliente.enabled := True;
       btn_tributos.enabled         := True;
       btn_exportar_produto.Enabled := True;
       btn_operadores.Enabled       := True;
       btn_finalizadoras.Enabled    := True;
       Btn_Ibtp.Enabled             := True;
       Btn_Configuracoes.enabled    := True;
       Todas_Ecfs.Checked := False;
       FrmImpressoras_Fiscais.Refresh;

     End;

  End;

  if (AEventName = 'produtos_ok') then
  Begin
     IQuery.SQL.Clear;
     IQuery.SQL.Add('SELECT * FROM LICENCA_IF WHERE STATUS = :STATUS AND IMPORTACAO = :IMPORTACAO');
     IQuery.ParamByName('STATUS').AsString := 'A';
     IQuery.ParamByName('IMPORTACAO').AsInteger := 11;
     IQuery.Prepare;
     IQuery.Open;

     if IQuery.IsEmpty then
     Begin
       Progressbar1.Visible := False;
       Application.MessageBox('Arquivo de produtos transferido para o destino!!','Eficaz', MB_ICONINFORMATION + MB_OK);
       btn_exportar_cliente.enabled := True;
       btn_tributos.enabled         := True;
       btn_exportar_produto.Enabled := True;
       btn_operadores.Enabled       := True;
       btn_finalizadoras.Enabled    := True;
       Btn_Ibtp.Enabled             := True;
       Btn_Configuracoes.enabled    := True;
       Todas_Ecfs.Checked := False;
       FrmImpressoras_Fiscais.Refresh;
     End;

  End;

  if (AEventName = 'finalizadoras_ok') then
  Begin
     IQuery.SQL.Clear;
     IQuery.SQL.Add('SELECT * FROM LICENCA_IF WHERE STATUS = :STATUS AND IMPORTACAO = :IMPORTACAO');
     IQuery.ParamByName('STATUS').AsString := 'A';
     IQuery.ParamByName('IMPORTACAO').AsInteger := 12;
     IQuery.Prepare;
     IQuery.Open;

     if IQuery.IsEmpty then
     Begin
       Progressbar1.Visible := False;
       Application.MessageBox('Arquivo de finalizadoras transferido para o destino!!','Eficaz', MB_ICONINFORMATION + MB_OK);

       btn_exportar_cliente.enabled := True;
       btn_tributos.enabled         := True;
       btn_exportar_produto.Enabled := True;
       btn_operadores.Enabled       := True;
       btn_finalizadoras.Enabled    := True;
       Btn_Ibtp.Enabled             := True;
       Btn_Configuracoes.enabled    := True;
       Todas_Ecfs.Checked := False;
     End;

  End;

  if (AEventName = 'configuracoes_ok') then
  Begin
     IQuery.SQL.Clear;
     IQuery.SQL.Add('SELECT * FROM LICENCA_IF WHERE STATUS = :STATUS AND IMPORTACAO = :IMPORTACAO');
     IQuery.ParamByName('STATUS').AsString := 'A';
     IQuery.ParamByName('IMPORTACAO').AsInteger := 13;
     IQuery.Prepare;
     IQuery.Open;

     if IQuery.IsEmpty then
     Begin
       Progressbar1.Visible := False;

       Application.MessageBox('Arquivo de configuracoes transferido para o destino!!','Eficaz', MB_ICONINFORMATION + MB_OK);

       btn_exportar_cliente.enabled := True;
       btn_tributos.enabled         := True;
       btn_exportar_produto.Enabled := True;
       btn_operadores.Enabled       := True;
       btn_finalizadoras.Enabled    := True;
       Btn_Ibtp.Enabled             := True;
       Btn_Configuracoes.enabled    := True;
       Todas_Ecfs.Checked := False;
     End;


  End;



  if (AEventName = 'tributos_ok') then
  Begin
     IQuery.SQL.Clear;
     IQuery.SQL.Add('SELECT * FROM LICENCA_IF WHERE STATUS = :STATUS AND IMPORTACAO = :IMPORTACAO');
     IQuery.ParamByName('STATUS').AsString := 'A';
     IQuery.ParamByName('IMPORTACAO').AsInteger := 14;
     IQuery.Prepare;
     IQuery.Open;

     if IQuery.IsEmpty then
     Begin
       Progressbar1.Visible := False;

       Application.MessageBox('Arquivo de tributos transferido para o destino!!','Eficaz', MB_ICONINFORMATION + MB_OK);

       btn_exportar_cliente.enabled := True;
       btn_tributos.enabled         := True;
       btn_exportar_produto.Enabled := True;
       btn_operadores.Enabled       := True;
       btn_finalizadoras.Enabled    := True;
       Btn_Ibtp.Enabled             := True;
       Btn_Configuracoes.enabled    := True;
       Todas_Ecfs.Checked := False;
     End;

  End;

  if (AEventName = 'operadores_ok') then
  Begin
     IQuery.SQL.Clear;
     IQuery.SQL.Add('SELECT * FROM LICENCA_IF WHERE STATUS = :STATUS AND IMPORTACAO = :IMPORTACAO');
     IQuery.ParamByName('STATUS').AsString := 'A';
     IQuery.ParamByName('IMPORTACAO').AsInteger := 15;
     IQuery.Prepare;
     IQuery.Open;

     if IQuery.IsEmpty then
     Begin

       Progressbar1.Visible := False;

       Application.MessageBox('Arquivo de operadores transferido para o destino!!','Eficaz', MB_ICONINFORMATION + MB_OK);

       btn_exportar_cliente.enabled := True;
       btn_tributos.enabled         := True;
       btn_exportar_produto.Enabled := True;
       btn_operadores.Enabled       := True;
       btn_finalizadoras.Enabled    := True;
       Btn_Ibtp.Enabled             := True;
       Btn_Configuracoes.enabled    := True;
       Todas_Ecfs.Checked := False;
     End;

  End;

  if (AEventName = 'ibpt_ok') then
  Begin
     IQuery.SQL.Clear;
     IQuery.SQL.Add('SELECT * FROM LICENCA_IF WHERE STATUS = :STATUS AND IMPORTACAO = :IMPORTACAO');
     IQuery.ParamByName('STATUS').AsString := 'A';
     IQuery.ParamByName('IMPORTACAO').AsInteger := 15;
     IQuery.Prepare;
     IQuery.Open;

     if IQuery.IsEmpty then
     Begin
       Progressbar1.Visible := False;

       Application.MessageBox('Arquivo Ibpt(impostos) transferido para o destino!!','Eficaz', MB_ICONINFORMATION + MB_OK);

       btn_exportar_cliente.enabled := True;
       btn_tributos.enabled         := True;
       btn_exportar_produto.Enabled := True;
       btn_operadores.Enabled       := True;
       btn_finalizadoras.Enabled    := True;
       Btn_Ibtp.Enabled             := True;
       Btn_Configuracoes.enabled    := True;
       Todas_Ecfs.Checked := False;
     End;

  End;

  //EventoRetornoImpressora.Active := False;


end;

function TFrmImpressoras_Fiscais.Validacao: Boolean;
var
LibHandle: THandle;
ConsisteInscricaoEstadual: TConsisteInscricaoEstadual;
begin
  Result := False;

  CNI.Color    := clWindow;
  CNPJ.Color   := clWindow;
  IE.Color     := clWindow;
  SERIAL.Color := clWindow;

  IQuery.Sql.Clear;
  IQuery.Sql.Add('SELECT * FROM CNIEE');
  IQuery.Sql.Add('WHERE');
  IQuery.Sql.Add('(CNI = :CNI)');

  IQuery.ParamByName('CNI').AsString := CNI.Text;

  IQuery.Prepare;
  IQuery.Open;

  if IQuery.IsEmpty then
  begin
    Application.MessageBox('CNI inexistente', PChar(Msg_Title), mb_IconStop);
    CNI.Color := clYellow;
    CNI.SetFocus;
    exit;
  end;

  TIPO_ECF.Text  := IQuery.FieldByName('TIPO').AsString;
  MARCA_ECF.Text := IQuery.FieldByName('DESC_MARCA').AsString;
  MODELO.Text    := IQuery.FieldByName('DESC_MODELO').AsString;
 // VERSAO_SB.Text := IQuery.FieldByName('VERSAO_SB').AsString;

  if SERIAL.Text = '' then
  begin
    Application.MessageBox('Serial Inválido', PChar(Msg_Title), mb_IconStop);
    SERIAL.Color := clYellow;
    SERIAL.SetFocus;
    exit;
  end;

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

  LibHandle :=  LoadLibrary(PChar(Trim('DllInscE32.Dll')));
  try
    if  LibHandle <= HINSTANCE_ERROR then
      raise Exception.Create ('Dll não carregada');

    @ConsisteInscricaoEstadual := GetProcAddress(LibHandle, 'ConsisteInscricaoEstadual');

    if  @ConsisteInscricaoEstadual  = nil then
      raise Exception.Create('Entrypoint Download não encontrado na Dll');

    if ConsisteInscricaoEstadual(Alltrim(SemMascara(IE.Text)), FrmPrincipal.QEmpresa.FieldByName('ESTADO').AsString) = 1 then
    begin
      Application.MessageBox('Inscrição Estadual inválida', PChar(Msg_Title), mb_IconStop);
      IE.Color := clYellow;
      IE.SetFocus;
      exit;
    end;
  finally
    FreeLibrary(LibHandle);
  end;

  Result := True;
end;

procedure TFrmImpressoras_Fiscais.ManutencaoShow(Sender: TObject);
begin
  Set_Campos(False);
  Botoes_Normal;
  Label10.Font.Color := clBlack;
  label10.Caption    := 'Conexão Pdv';
end;

procedure TFrmImpressoras_Fiscais.SERIALKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = CNI) then
    btnCNIClick(Self);

  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmImpressoras_Fiscais.Set_Campos(Vazio: Boolean);
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

      if Temp is TComboBox then
        TComboBox(Temp).Text := '';

      if Temp is TDateEdit then
        TDateEdit(Temp).Text := '';

      if Temp is TRxCalcEdit then
        TRxCalcEdit(Temp).Value := 0;

      if Temp is TCurrencyEdit then
        TCurrencyEdit(Temp).Value := 0;

      if Temp is TCheckBox then
      if TCheckBox(Temp).Name = 'Gerar_Sped' then
        TCheckBox(Temp).Checked := False;
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

      if Temp is TCheckBox then
      Begin
        if TCheckBox(Temp).Name = 'Gerar_Sped' then
        Begin
          if QTabela.FieldByName(TCheckBox(Temp).Name).AsInteger = 1 then
          TCheckBox(Temp).Checked := True
          Else
          TCheckBox(Temp).Checked := False;
        End;
      End;


    end;

    if QTabela.FieldByName('STATUS').AsString = 'A' then
    begin
     Label9.Visible := True;
     Label9.Font.Color := clGreen;
     Label9.Caption :='ATIVO';
    end
    else
    begin
     Label9.Visible := True;
     Label9.Font.Color := clRed;
     Label9.Caption :='DESATIVADO';
    end;

    


  end;
end;

procedure TFrmImpressoras_Fiscais.Tab_AtivarPdvsShow(Sender: TObject);
var
X:integer;
Temp: TComponent;
begin
  for X := 1 to ComponentCount - 1 do
  Begin
   Temp := Components[X];
   if Temp is TCheckBox then
   Begin
    TcheckBox(Temp).Checked := False;
    TcheckBox(Temp).Enabled := False;
   End;
  end;
 QTabela.first;
 while not QTabela.eof do
 Begin
  if QTabela.fieldByName('STATUS').AsString = 'A' then
  Begin
    for X := 1 to ComponentCount - 1 do
    Begin
     Temp := Components[X];
     if Temp is TCheckBox then
     Begin
      if QTabela.fieldByName('NUM_ECF').AsString = Copy(TcheckBox(Temp).Name,4,3) then
      Begin
      TcheckBox(Temp).Enabled := True;
      //TcheckBox(Temp).Checked := True;
      End;

     End;
    end;
    Todas_Ecfs.enabled := True;
    Chk_total.Enabled  := True;
  End;
  QTabela.next;
 End;
 FrmPrincipal.Abertura.Refresh;
 Label11.Caption := 'Data/Hora último reinicio do EficazSync: ' + DateToStr(FrmPrincipal.Abertura.FieldByname('DT_SYNC').AsDateTime) + ' - ' + TimeToStr(FrmPrincipal.Abertura.FieldbyName('HR_SYNC').AsDateTime);


end;

procedure TFrmImpressoras_Fiscais.Todas_EcfsClick(Sender: TObject);
var
i:Integer;
begin
inherited;
  if Todas_Ecfs.Checked then
  Begin
  for I := 0 to ComponentCount - 1 do
    if (Components[I] is TCheckBox) and (Components[I].GetParentComponent.Name = 'GroupBox1') AND (TCheckBox(Components[I]).Enabled) then
        TCheckBox(Components[I]).Checked := True;

  End
  Else
  Begin
  for I := 0 to ComponentCount - 1 do
    if (Components[I] is TCheckBox) and (Components[I].GetParentComponent.Name = 'GroupBox1') AND (TCheckBox(Components[I]).Enabled) then
        TCheckBox(Components[I]).Checked := False;
  End;
end;


procedure TFrmImpressoras_Fiscais.Imp_Registros60Show(Sender: TObject);
var
X:integer;
Temp: TComponent;
begin


end;

procedure TFrmImpressoras_Fiscais.btnCNIClick(Sender: TObject);
begin
  CNI.Text := GetConsulta_CST('CNI', CNI.Text);

  IQuery.Sql.Clear;
  IQuery.Sql.Add('SELECT * FROM CNIEE');
  IQuery.Sql.Add('WHERE');
  IQuery.Sql.Add('(CNI = :CNI)');

  IQuery.ParamByName('CNI').AsString := CNI.Text;

  IQuery.Prepare;
  IQuery.Open;

  if IQuery.IsEmpty then
  begin
    Application.MessageBox('CNI inexistente', PChar(Msg_Title), mb_IconStop);
    CNI.Color := clYellow;
    CNI.SetFocus;
    exit;
  end;

  TIPO_ECF.Text  := IQuery.FieldByName('TIPO').AsString;
  MARCA_ECF.Text := IQuery.FieldByName('DESC_MARCA').AsString;
  MODELO.Text    := IQuery.FieldByName('DESC_MODELO').AsString;
  VERSAO_SB.Text := IQuery.FieldByName('VERSAO_SB').AsString;
end;

procedure TFrmImpressoras_Fiscais.btnDeleteClick(Sender: TObject);
begin
  if FrmData.QAcesso.FieldByName('EXCLUSAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para exclusão', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  if Application.MessageBox('Deseja realmente excluir?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = IDYES then
  begin


    IQuery.Sql.Clear;
    IQuery.Sql.Add('DELETE FROM LICENCA_IF');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(SERIAL = :SERIAL)');

    IQuery.ParamByName('SERIAL').AsString := QTabela.FieldByName('SERIAL').AsString;

    IQuery.Prepare;
    IQuery.ExecSql;



    QTabela.Close;

    Qtabela.Prepare;
    QTabela.Open;

    Set_Campos(False);
    Botoes_Normal;
  end;
end;

procedure TFrmImpressoras_Fiscais.btnDiscardClick(Sender: TObject);
begin
  Botoes_Normal;
  Set_Campos(False);
  Habilitar(False);
  Operacao := '';
  Consulta.TabVisible := True;
end;

procedure TFrmImpressoras_Fiscais.btnEditClick(Sender: TObject);
begin
  if FrmData.QAcesso.FieldByName('ALTERACAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para alteração', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  Operacao := 'Alterando';

  ID := QTabela.FieldByName('SERIAL').AsString;

  SERIAL.ReadOnly := True;

  Botoes_Editing;
  Habilitar(True);

  Consulta.TabVisible := False;

  SERIAL.SetFocus;
end;

procedure TFrmImpressoras_Fiscais.btnInsertClick(Sender: TObject);
begin
  if FrmData.QAcesso.FieldByName('INCLUSAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para inclusão', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  Operacao := 'Inserindo';

  SERIAL.ReadOnly := False;

  Botoes_Editing;
  Set_Campos(True);
  Habilitar(True);

  CNPJ.Text       := FrmPrincipal.QEmpresa.FieldByName('CNPJ').AsString;
  IE.Text         := FrmPrincipal.QEmpresa.FieldByName('INSCR_ESTADUAL').AsString;
  DT_INST_SB.Date := date;
  HR_INST_SB.Text := TimeToStr(time);
  DT_sync.Date    := date;
  dt_sync_cli.Date := date;


  Consulta.TabVisible := False;

  SERIAL.SetFocus;
end;

procedure TFrmImpressoras_Fiscais.btnNextClick(Sender: TObject);
begin
  if not QTabela.Eof then
  begin
    QTabela.Next;
    Set_Campos(False);
  end;

  Botoes_Normal;
  Label10.Font.Color := clBlack;
  label10.Caption    := 'Conexão Pdv'
end;

procedure TFrmImpressoras_Fiscais.btnPriorClick(Sender: TObject);
begin
  if not QTabela.Bof then
  begin
    QTabela.Prior;
    Set_Campos(False);
  end;

  Botoes_Normal;
  Label10.Font.Color := clBlack;
  label10.Caption    := 'Conexão Pdv'
end;

procedure TFrmImpressoras_Fiscais.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmImpressoras_Fiscais.btnSaveClick(Sender: TObject);
var
Md5 : TIdHashMessageDigest5;
begin
  if Validacao then
  begin
    Md5 :=  TIdHashMessageDigest5.Create;
    LICENCA.Text := EncryptMsg(LogEntry('', '', MD5.HashStringAsHex('comdeusvencerei' + SERIAL.Text)), 65);

    if Operacao = 'Inserindo' then
    begin
      Insert;

      CmdSelectNull := 'WHERE (SERIAL = :SERIAL)';
      CmdOrderBy    := 'ORDER BY SERIAL';

      QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

      QTabela.ParamByName('SERIAL').AsString := SERIAL.Text;

      QTabela.Prepare;
      QTabela.Open;
    end
    else
      Edit;

    Set_Campos(False);
    Habilitar(False);
    Botoes_Normal;
    Operacao := '';
    Consulta.TabVisible := True;
    VerificarConexao;
  end;
end;

procedure TFrmImpressoras_Fiscais.Btn_ConfiguracoesClick(Sender: TObject);
var
i,Num_ecf:Integer;
Temp: TComponent;

begin
   EventoRetornoImpressora.Active := True;
   ProgressBar1.Style := pbstMarquee;
   ProgressBar1.MarqueeInterval := 15;
   Progressbar1.Visible := True;

   for i := 1 to ComponentCount - 1 do
    Begin
     Temp := Components[i];
     if Temp is TCheckBox then
     Begin
      if TcheckBox(Temp).Checked then
      Begin
      try
       Num_Ecf := StrToInt(Copy(TcheckBox(Temp).Name,4,3));

       QUpdate.Sql.text := 'UPDATE LICENCA_IF SET IMPORTACAO = 13 ,CARGA_TOTAL = 0  WHERE CAST(NUM_ECF AS INTEGER) = ' + IntToStr(NUM_ECF);
       QUpdate.Prepare;
       QUpdate.ExecSQL;
       TcheckBox(Temp).Checked := False;

      Except

      end;

      End;

     End;
    end;

   btn_exportar_cliente.enabled := False;
   btn_tributos.enabled         := False;
   btn_exportar_produto.Enabled := False;
   btn_operadores.Enabled       := False;
   btn_finalizadoras.Enabled    := False;
   Btn_Ibtp.Enabled             := False;
   Btn_Configuracoes.enabled    := False;

end;

procedure TFrmImpressoras_Fiscais.btn_exportar_clienteClick(Sender: TObject);
var
i,NUM_ECF:Integer;
Temp: TComponent;
begin

   EventoRetornoImpressora.Active := True;
   ProgressBar1.Style := pbstMarquee;
   ProgressBar1.MarqueeInterval := 15;
   Progressbar1.Visible := True;

    if Todas_ecfs.Checked then
    Begin
     IQuery.Sql.Clear;
     IQuery.Sql.Add('SELECT * FROM LICENCA_IF WHERE STATUS = '+ #39 + 'A' + #39 + ' ORDER BY NUM_ECF');
     IQuery.prepare;
     IQuery.open;

     if chk_total.Checked then
     Begin
     QUpdate.Sql.text := 'UPDATE LICENCA_IF SET IMPORTACAO = 10, CARGA_TOTAL = 1, TODAS_ECFS = 1  WHERE  NUM_ECF = :NUM_ECF';
     QUpdate.ParamByName('NUM_ECF').AsString := IQuery.FieldByName('NUM_ECF').AsString;
     QUpdate.Prepare;
     QUpdate.ExecSQL;
     End
     Else
     Begin
     QUpdate.Sql.text := 'UPDATE LICENCA_IF SET IMPORTACAO = 10, CARGA_TOTAL = 0, TODAS_ECFS = 1 WHERE  NUM_ECF = :NUM_ECF';
     QUpdate.ParamByName('NUM_ECF').AsString := IQuery.FieldByName('NUM_ECF').AsString;
     QUpdate.Prepare;
     QUpdate.ExecSQL;
     End;

     for i := 1 to ComponentCount - 1 do
     Begin
     Temp := Components[i];
      if Temp is TCheckBox then
      Begin
       if (TcheckBox(Temp).Checked) and (TcheckBox(Temp).Name <> 'Todas_Ecfs') then
       Begin
        TcheckBox(Temp).Checked := False;
       End;
      End;
     End;
     TcheckBox(Temp).Checked := False;
    End
    Else
    Begin
    for i := 1 to ComponentCount - 1 do
    Begin
     Temp := Components[i];
     if Temp is TCheckBox then
     Begin
      if (TcheckBox(Temp).Checked) and (TcheckBox(Temp).Name <> 'Todas_Ecfs') then
      Begin
       try
         Num_ecf := StrtoInt(Copy(TcheckBox(Temp).Name,4,3));

         if chk_total.Checked then
         Begin
         QUpdate.Sql.text := 'UPDATE LICENCA_IF SET IMPORTACAO = 10 ,CARGA_TOTAL = 1  WHERE CAST(NUM_ECF AS INTEGER) = ' + IntToStr(NUM_ECF);
         QUpdate.Prepare;
         QUpdate.ExecSQL;
         End
         Else
         Begin
         QUpdate.Sql.text := 'UPDATE LICENCA_IF SET IMPORTACAO = 10 ,CARGA_TOTAL = 0  WHERE CAST(NUM_ECF AS INTEGER) = ' + IntToStr(NUM_ECF);
         QUpdate.Prepare;
         QUpdate.ExecSQL;
         End;
         TcheckBox(Temp).Checked := False;

       Except

       end;
       TcheckBox(Temp).Checked := False;
      End;
     End;
    end;
    End;

   btn_exportar_cliente.enabled := False;
   btn_tributos.enabled         := False;
   btn_exportar_produto.Enabled := False;
   btn_operadores.Enabled       := False;
   btn_finalizadoras.Enabled    := False;
   Btn_Ibtp.Enabled             := False;
   Btn_Configuracoes.enabled    := False;


end;

procedure TFrmImpressoras_Fiscais.btn_exportar_produtoClick(Sender: TObject);
var
i,Num_ecf:Integer;
Temp: TComponent;

begin

 //  ProgressBar1.Style := pbstMarquee;
 //  ProgressBar1.MarqueeInterval := 15;
 //  Progressbar1.Visible := True;

    for i := 1 to ComponentCount - 1 do
    Begin
     Temp := Components[i];
     if Temp is TCheckBox then
     Begin
      if TcheckBox(Temp).Checked then
      Begin
       try
         Num_ecf := StrtoInt(Copy(TcheckBox(Temp).Name,4,3));

         if Chk_Total.Checked then
         Begin
         QUpdate.Sql.text := 'UPDATE LICENCA_IF SET IMPORTACAO = 11, CARGA_TOTAL = 1  WHERE  CAST(NUM_ECF AS INTEGER) = ' + IntToStr(NUM_ECF);
         QUpdate.Prepare;
         QUpdate.ExecSQL;
         TcheckBox(Temp).Checked := False;
         End
         Else
         Begin
         showmessage('rodando comando');
         QUpdate.Sql.text := 'UPDATE LICENCA_IF SET IMPORTACAO = 11 ,CARGA_TOTAL = 0  WHERE CAST(NUM_ECF AS INTEGER) = ' + IntToStr(NUM_ECF);
         QUpdate.Prepare;
         QUpdate.ExecSQL;
         TcheckBox(Temp).Checked := False;
         End;
       except

       end;

       TcheckBox(Temp).Checked := False;

      End;

     End;
    end;

    Application.MessageBox('Arquivo de produtos transferido para o destino!!','Eficaz', MB_ICONINFORMATION + MB_OK);

 { btn_exportar_cliente.enabled := False;
   btn_tributos.enabled         := False;
   btn_exportar_produto.Enabled := False;
   btn_operadores.Enabled       := False;
   btn_finalizadoras.Enabled    := False;
   Btn_Ibtp.Enabled             := False;
   Btn_Configuracoes.enabled    := False;
  }

end;

procedure TFrmImpressoras_Fiscais.btn_finalizadorasClick(Sender: TObject);
var
i,Num_Ecf:Integer;
Temp: TComponent;
begin
   EventoRetornoImpressora.Active := True;
   ProgressBar1.Style := pbstMarquee;
   ProgressBar1.MarqueeInterval := 15;
   Progressbar1.Visible := True;

   for i := 1 to ComponentCount - 1 do
    Begin
     Temp := Components[i];
     if Temp is TCheckBox then
     Begin
      if TcheckBox(Temp).Checked then
      Begin
       try
       Num_Ecf := StrToInt(Copy(TcheckBox(Temp).Name,4,3));

       QUpdate.Sql.text := 'UPDATE LICENCA_IF SET IMPORTACAO = 12 ,CARGA_TOTAL = 0  WHERE CAST(NUM_ECF AS INTEGER) = ' + IntToStr(NUM_ECF);
       QUpdate.Prepare;
       QUpdate.ExecSQL;
       TcheckBox(Temp).Checked := False;
       Except

       end;


      End;

     End;
    end;

   btn_exportar_cliente.enabled := False;
   btn_tributos.enabled         := False;
   btn_exportar_produto.Enabled := False;
   btn_operadores.Enabled       := False;
   btn_finalizadoras.Enabled    := False;
   Btn_Ibtp.Enabled             := False;
   Btn_Configuracoes.enabled    := False;

end;

procedure TFrmImpressoras_Fiscais.Btn_IbtpClick(Sender: TObject);
var
i,Num_Ecf:Integer;
Temp: TComponent;

begin

   EventoRetornoImpressora.Active := True;
   ProgressBar1.Style := pbstMarquee;
   ProgressBar1.MarqueeInterval := 15;
   Progressbar1.Visible := True;

   for i := 1 to ComponentCount - 1 do
    Begin
     Temp := Components[i];
     if Temp is TCheckBox then
     Begin
      if TcheckBox(Temp).Checked then
      Begin
       try
         Num_Ecf := StrToInt(Copy(TcheckBox(Temp).Name,4,3));

         QUpdate.Sql.text := 'UPDATE LICENCA_IF SET IMPORTACAO = 16 ,CARGA_TOTAL = 0  WHERE CAST(NUM_ECF AS INTEGER) = ' + IntToStr(NUM_ECF);
         QUpdate.Prepare;
         QUpdate.ExecSQL;
         TcheckBox(Temp).Checked := False;
       Except

       end;


      End;

     End;
    end;

   btn_exportar_cliente.enabled := False;
   btn_tributos.enabled         := False;
   btn_exportar_produto.Enabled := False;
   btn_operadores.Enabled       := False;
   btn_finalizadoras.Enabled    := False;
   Btn_Ibtp.Enabled             := False;
   Btn_Configuracoes.enabled    := False;

end;

procedure TFrmImpressoras_Fiscais.btn_operadoresClick(Sender: TObject);
var
i,Num_Ecf:Integer;
Temp: TComponent;

begin
   EventoRetornoImpressora.Active := True;
   ProgressBar1.Style := pbstMarquee;
   ProgressBar1.MarqueeInterval := 15;
   Progressbar1.Visible := True;



   for i := 1 to ComponentCount - 1 do
    Begin
     Temp := Components[i];
     if Temp is TCheckBox then
     Begin
      if TcheckBox(Temp).Checked then
      Begin
        Try
         Num_Ecf := StrtoInt(Copy(TcheckBox(Temp).Name,4,3));

         QUpdate.Sql.text := 'UPDATE LICENCA_IF SET IMPORTACAO = 15 ,CARGA_TOTAL = 0  WHERE CAST(NUM_ECF AS INTEGER) = ' + IntToStr(NUM_ECF);
         QUpdate.Prepare;
         QUpdate.ExecSQL;
         TcheckBox(Temp).Checked := False;
        Except

        End;


      End;

     End;
    end;

   btn_exportar_cliente.enabled := False;
   btn_tributos.enabled         := False;
   btn_exportar_produto.Enabled := False;
   btn_operadores.Enabled       := False;
   btn_finalizadoras.Enabled    := False;
   Btn_Ibtp.Enabled             := False;
   Btn_Configuracoes.enabled    := False;

end;

procedure TFrmImpressoras_Fiscais.Btn_ReiniciaSyncClick(Sender: TObject);
begin
   EventoRetornoImpressora.Active := True;
   ProgressBar1.Style := pbstMarquee;
   ProgressBar1.MarqueeInterval := 15;
   Progressbar1.Visible := True;

QUpdate.Sql.Clear;
QUpdate.Sql.Add('UPDATE ABERTURA SET DT_MOVIMENTO =:DATA, RESET = 1');
QUpdate.ParamByName('DATA').AsDateTime := Date;
QUpdate.Prepare;
QUpdate.ExecSQL;


QUpdate.Sql.Clear;
QUpdate.Sql.Add('UPDATE LICENCA_IF SET IMPORTACAO =0');
QUpdate.Prepare;
QUpdate.ExecSQL;

end;

procedure TFrmImpressoras_Fiscais.btn_tributosClick(Sender: TObject);
var
i,Num_Ecf:Integer;
Temp: TComponent;

begin
   EventoRetornoImpressora.Active := True;
  for i := 1 to ComponentCount - 1 do
  Begin
   Temp := Components[i];
   if Temp is TCheckBox then
   Begin
    if TcheckBox(Temp).Checked then
    Begin
      try

       Num_Ecf := StrToInt(Copy(TcheckBox(Temp).Name,4,3));

       QUpdate.Sql.text := 'UPDATE LICENCA_IF SET IMPORTACAO = 14 ,CARGA_TOTAL = 0  WHERE CAST(NUM_ECF AS INTEGER) = ' + IntToStr(NUM_ECF);
       QUpdate.Prepare;
       QUpdate.ExecSQL;

       TcheckBox(Temp).Checked := False;

      Except

      end;
    End;
   End;
  end;
end;

procedure TFrmImpressoras_Fiscais.Button1Click(Sender: TObject);
var
I,Num_ecf: Integer;
Temp: TComponent;
begin


end;

procedure TFrmImpressoras_Fiscais.CNIExit(Sender: TObject);
begin
  IQuery.Sql.Clear;
  IQuery.Sql.Add('SELECT * FROM CNIEE');
  IQuery.Sql.Add('WHERE');
  IQuery.Sql.Add('(CNI = :CNI)');

  IQuery.ParamByName('CNI').AsString := CNI.Text;

  IQuery.Prepare;
  IQuery.Open;

  if IQuery.IsEmpty then
  begin
    Application.MessageBox('CNI inexistente', PChar(Msg_Title), mb_IconStop);
    CNI.Color := clYellow;
    CNI.SetFocus;
    exit;
  end;

  TIPO_ECF.Text  := IQuery.FieldByName('TIPO').AsString;
  MARCA_ECF.Text := IQuery.FieldByName('DESC_MARCA').AsString;
  MODELO.Text    := IQuery.FieldByName('DESC_MODELO').AsString;
  VERSAO_SB.Text := IQuery.FieldByName('VERSAO_SB').AsString;

end;

procedure TFrmImpressoras_Fiscais.DBGrid1DblClick(Sender: TObject);
begin
  Manutencao.Show;
end;

procedure TFrmImpressoras_Fiscais.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F3) and (QTabela.FieldByName('STATUS').AsString = 'A') then
  begin
    ID := QTabela.FieldByName('NUM_ECF').AsString;


    IQuery.Sql.Clear;
    IQuery.Sql.Add('UPDATE LICENCA_IF SET STATUS = :STATUS');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(NUM_ECF = :NUM_ECF)');
    IQuery.ParamByName('STATUS').AsString := 'D';
    IQuery.ParamByName('NUM_ECF').AsString := QTabela.FieldByName('NUM_ECF').AsString;
    IQuery.Prepare;
    IQuery.ExecSql;

    QTabela.Close;
    QTabela.Open;
    QTabela.Locate('NUM_ECF', ID, [loCaseInsensitive]);
  end;
  if (Key = Vk_F4) and (QTabela.FieldByName('STATUS').AsString = 'D') then
  begin
     ID := QTabela.FieldByName('NUM_ECF').AsString;


    IQuery.Sql.Clear;
    IQuery.Sql.Add('UPDATE LICENCA_IF SET STATUS = :STATUS');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(NUM_ECF = :NUM_ECF)');
    IQuery.ParamByName('STATUS').AsString := 'A';
    IQuery.ParamByName('NUM_ECF').AsString := QTabela.FieldByName('NUM_ECF').AsString;
    IQuery.Prepare;
    IQuery.ExecSql;


    QTabela.Close;
    QTabela.Open;
    QTabela.Locate('NUM_ECF', ID, [loCaseInsensitive]);
  end;

end;

procedure TFrmImpressoras_Fiscais.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Manutencao.Show;
end;

procedure TFrmImpressoras_Fiscais.DBGrid1TitleClick(Column: TColumn);
begin
  CmdOrderBy := 'ORDER BY ' + Column.FieldName;

  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

  QTabela.Prepare;
  QTabela.Open;
end;

procedure TFrmImpressoras_Fiscais.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Abertura := 0;
  Action := caFree;
end;

procedure TFrmImpressoras_Fiscais.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (Operacao = 'Inserindo') or (Operacao = 'Alterando') then
  begin
    Application.MessageBox('É melhor salvar as alterações antes de continuar', PChar(Msg_Title), mb_IconStop);
    CanClose := False;
  end;
end;

procedure TFrmImpressoras_Fiscais.FormCreate(Sender: TObject);
begin
 FDPhysPgDriverLink1.VendorLib := ExtractFilePath(ParamStr(0))+ '\DllsPG\libpq.dll';

  CmdSelect     := QTabela.Sql.Text;
  CmdSelectNull := 'WHERE (SERIAL IS NOT NULL)';
  CmdOrderBy    := 'ORDER BY NUM_ECF';

  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

  FrmData.QAcesso.Refresh;

  QTabela.Prepare;
  QTabela.Open;

  if Abertura = 1 then
  Begin
  Consulta.TabVisible   := False;
  Manutencao.TabVisible := False;
  Tab_Ativarpdvs.TabVisible := True;
  Tab_Ativarpdvs.Show;
  End
  Else
  Begin
  DBGrid1.Columns[0].Width := 180;
  DBGrid1.Columns[1].Width := 100;
  DBGrid1.Columns[2].Width := 200;
  DBGrid1.Columns[3].Width := 130;
  DBGrid1.Columns[4].Width := 42;
  DBGrid1.Columns[4].Width := 40;

    if Copy(FrmData.QAcesso.FieldByName('OPCOES').AsString, 65, 1) = 'S' then
    Tab_Ativarpdvs.TabVisible := True
    Else
    Tab_Ativarpdvs.TabVisible := False;

  Consulta.Show;
  End;

end;

procedure TFrmImpressoras_Fiscais.FormShow(Sender: TObject);
begin

  if Abertura <> 1 then
  Begin
    DBGrid1.SetFocus;
    Consulta.Show;
  End;


end;

end.
