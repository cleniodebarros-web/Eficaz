unit UImportar_Registro60;

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
  TFrmImportar_Registros60 = class(TForm)
    Panel1: TPanel;
    DataTabela: TDataSource;
    btnRetorna: TBitBtn;
    QTabela: TFDQuery;
    IQuery: TFDQuery;
    VerificaPdvs: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    IdTCPClient1: TIdTCPClient;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    QUpdate: TFDQuery;
    EventoRetornoImpressora: TFDEventAlerter;
    BatchMove1: TBatchMove;
    grp1: TGroupBox;
    Ecfi001: TCheckBox;
    Ecfi011: TCheckBox;
    Ecfi021: TCheckBox;
    Ecfi022: TCheckBox;
    Ecfi012: TCheckBox;
    Ecfi002: TCheckBox;
    Ecfi003: TCheckBox;
    Ecfi013: TCheckBox;
    Ecfi023: TCheckBox;
    Ecfi024: TCheckBox;
    Ecfi014: TCheckBox;
    Ecfi004: TCheckBox;
    Ecfi025: TCheckBox;
    Ecfi015: TCheckBox;
    Ecfi005: TCheckBox;
    Ecfi026: TCheckBox;
    Ecfi016: TCheckBox;
    Ecfi006: TCheckBox;
    Ecfi007: TCheckBox;
    Ecfi017: TCheckBox;
    Ecfi027: TCheckBox;
    Ecfi028: TCheckBox;
    Ecfi018: TCheckBox;
    Ecfi008: TCheckBox;
    Ecfi009: TCheckBox;
    Ecfi019: TCheckBox;
    Ecfi029: TCheckBox;
    Ecfi030: TCheckBox;
    Ecfi020: TCheckBox;
    Ecfi010: TCheckBox;
    Todas_ecfsi: TCheckBox;
    Ecfi031: TCheckBox;
    Ecfi032: TCheckBox;
    Ecfi033: TCheckBox;
    Ecfi034: TCheckBox;
    Ecfi035: TCheckBox;
    Ecfi036: TCheckBox;
    Ecfi037: TCheckBox;
    Ecfi038: TCheckBox;
    Ecfi039: TCheckBox;
    Ecfi040: TCheckBox;
    dtmem: TDateEdit;
    dtmai: TDateEdit;
    Button1: TButton;
    ProgressBar: TProgressBar;
    Label19: TLabel;
    IQuery_Destino_Pdv: TFDQuery;
    IQuery_update_pdv: TFDQuery;
    QTransacoes: TFDQuery;
    QTransacoes2: TFDQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRetornaClick(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure btnDiscardClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure ManutencaoShow(Sender: TObject);
    procedure btnPriorClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DT_INST_SBEnter(Sender: TObject);
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
    procedure Imp_Registros60Show(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Ecfi001Click(Sender: TObject);
    procedure Todas_ecfsiClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
  FrmImportar_Registros60: TFrmImportar_Registros60;
  Operacao,NUM_ECF_LISTA,DT_EMISSAO_LISTA: String;
  Abertura:Integer;
  DateEdit : TDateEdit;
  Eficaz_Pdv: TFDConnection;
  Registro_60i,Registro_60m,Registro_60a,Registro_60r,Registro_60d:Boolean;
  procedure Carga_Sync(TP:INTEGER);


implementation

uses
  UPrincipal, UData, UConsulta_CST ;

{$R *.dfm}

procedure Carga_sync(TP:INTEGER);
begin

end;

Procedure TFrmImportar_Registros60.VerificarConexao;
Begin

End;

function LogEntry(Cmd, Msg: String; Dig: String): String;
begin
  Result := Format('%s%s' + '%s', [Cmd, Msg, Dig]);
end;

procedure TFrmImportar_Registros60.DT_INST_SBEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmImportar_Registros60.BitBtn1Click(Sender: TObject);
begin
VerificarConexao;
end;

procedure TFrmImportar_Registros60.Botoes_Editing;
begin

end;

procedure TFrmImportar_Registros60.Botoes_Normal;
begin

end;

procedure TFrmImportar_Registros60.Habilitar(Status: Boolean);
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

procedure TFrmImportar_Registros60.Insert;
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

procedure TFrmImportar_Registros60.Ecfi001Click(Sender: TObject);
begin
Button1.Enabled := True;
dtmem.Enabled := True;
dtmai.Enabled := True;
end;

procedure TFrmImportar_Registros60.Edit;
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

  Habilitar(False);
end;

procedure TFrmImportar_Registros60.EventoRetornoImpressoraAlert(
  ASender: TFDCustomEventAlerter; const AEventName: string;
  const AArgument: Variant);
var
Temp:TComponent;
i:Integer;
begin


end;

function TFrmImportar_Registros60.Validacao: Boolean;
var
LibHandle: THandle;
ConsisteInscricaoEstadual: TConsisteInscricaoEstadual;
begin

end;

procedure TFrmImportar_Registros60.ManutencaoShow(Sender: TObject);
begin
  Set_Campos(False);
  Botoes_Normal;
end;

procedure TFrmImportar_Registros60.Set_Campos(Vazio: Boolean);
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
  end;
end;

procedure TFrmImportar_Registros60.Tab_AtivarPdvsShow(Sender: TObject);
var
X:integer;
Temp: TComponent;
begin


end;

procedure TFrmImportar_Registros60.Todas_EcfsClick(Sender: TObject);
var
i:Integer;
begin
inherited;

end;


procedure TFrmImportar_Registros60.Todas_ecfsiClick(Sender: TObject);
var
i:Integer;
begin
inherited;
  if Todas_Ecfsi.Checked then
  Begin
  for I := 0 to ComponentCount - 1 do
    if (Components[I] is TCheckBox)  AND (TCheckBox(Components[I]).Enabled) then
        TCheckBox(Components[I]).Checked := True;
  End
  Else
  Begin
  for I := 0 to ComponentCount - 1 do
    if (Components[I] is TCheckBox) AND (TCheckBox(Components[I]).Enabled) then
        TCheckBox(Components[I]).Checked := False;
  End;
end;

procedure TFrmImportar_Registros60.Imp_Registros60Show(Sender: TObject);
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
      if QTabela.fieldByName('NUM_ECF').AsString = Copy(TcheckBox(Temp).Name,5,3) then
      Begin
      TcheckBox(Temp).Enabled := True;
      //TcheckBox(Temp).Checked := True;
      End;

     End;
    end;
    Todas_Ecfsi.enabled := True;
  End;
  QTabela.next;
 End;
end;

procedure TFrmImportar_Registros60.btnDeleteClick(Sender: TObject);
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

procedure TFrmImportar_Registros60.btnDiscardClick(Sender: TObject);
begin
  Botoes_Normal;
  Set_Campos(False);
  Habilitar(False);
  Operacao := '';
end;

procedure TFrmImportar_Registros60.btnInsertClick(Sender: TObject);
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

end;

procedure TFrmImportar_Registros60.btnNextClick(Sender: TObject);
begin
  if not QTabela.Eof then
  begin
    QTabela.Next;
    Set_Campos(False);
  end;

  Botoes_Normal;

end;

procedure TFrmImportar_Registros60.btnPriorClick(Sender: TObject);
begin
  if not QTabela.Bof then
  begin
    QTabela.Prior;
    Set_Campos(False);
  end;

  Botoes_Normal;

end;

procedure TFrmImportar_Registros60.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmImportar_Registros60.btnSaveClick(Sender: TObject);
var
Md5 : TIdHashMessageDigest5;
begin

end;

procedure TFrmImportar_Registros60.Btn_ConfiguracoesClick(Sender: TObject);
var
i,Num_ecf:Integer;
Temp: TComponent;

begin

end;

procedure TFrmImportar_Registros60.btn_exportar_clienteClick(Sender: TObject);
var
i,NUM_ECF:Integer;
Temp: TComponent;
begin


end;

procedure TFrmImportar_Registros60.btn_exportar_produtoClick(Sender: TObject);
var
i,Num_ecf:Integer;
Temp: TComponent;

begin


end;

procedure TFrmImportar_Registros60.btn_finalizadorasClick(Sender: TObject);
var
i,Num_Ecf:Integer;
Temp: TComponent;
begin

end;

procedure TFrmImportar_Registros60.Btn_IbtpClick(Sender: TObject);
var
i,Num_Ecf:Integer;
Temp: TComponent;

begin


end;

procedure TFrmImportar_Registros60.btn_operadoresClick(Sender: TObject);
var
i,Num_Ecf:Integer;
Temp: TComponent;

begin

end;

procedure TFrmImportar_Registros60.btn_tributosClick(Sender: TObject);
var
i,Num_Ecf:Integer;
Temp: TComponent;

begin

end;

procedure TFrmImportar_Registros60.Button1Click(Sender: TObject);
var
I,Num_ecf: Integer;
Temp: TComponent;
begin

   ProgressBar.Style := pbstMarquee;
   ProgressBar.MarqueeInterval := 15;
   Progressbar.Visible := True;

  if Todas_ecfsi.Checked then
  Begin
   IQuery.Sql.Clear;
   IQuery.Sql.Add('SELECT * FROM LICENCA_IF WHERE STATUS = '+ #39 + 'A' + #39 + ' ORDER BY NUM_ECF');
   IQuery.prepare;
   IQuery.open;
   IQuery.First;
   while not IQuery.Eof do
   Begin

    Eficaz_Pdv.Free;
    Eficaz_Pdv := TFDConnection.Create(nil);

    Eficaz_Pdv.Params.Clear;
    Eficaz_Pdv.Params.Add('Database= ' + IQuery.FieldByName('BANCO').AsString );
    Eficaz_Pdv.Params.Add('User_Name= ' + IQuery.FieldByName('USUARIO').AsString );
    Eficaz_Pdv.Params.Add('Password='+ IQuery.FieldByName('SENHA').AsString );
    Eficaz_Pdv.Params.Add('Server= ' +  IQuery.FieldByName('IP').AsString );
    Eficaz_Pdv.Params.Add('Port= ' + IQuery.FieldByName('PORTA').AsString);
    Eficaz_Pdv.Params.Add('DriverID=PG');
    Eficaz_Pdv.Params.Add('MonitorBy=Remote');
    Eficaz_Pdv.Connected:=True;
    Eficaz_Pdv.Open();

    Registro_60i  := False;
    Registro_60m  := False;
    Registro_60r  := False;
    Registro_60a  := False;
    Registro_60d  := False;

     try

        FrmImportar_Registros60.IQuery_destino_pdv.Connection := Eficaz_Pdv;
        FrmImportar_Registros60.IQuery_Update_pdv.Connection  := Eficaz_Pdv;

        FrmImportar_Registros60.IQuery_destino_pdv.Close;
        FrmImportar_Registros60.IQuery_destino_pdv.SQL.Text := 'SELECT DT_EMISSAO,COD_PRODUTO,NUM_ORDEM,NUM_SERIE FROM REGISTRO_60I WHERE EXPORTADO = 0 ';
        FrmImportar_Registros60.IQuery_destino_pdv.Prepare;
        FrmImportar_Registros60.IQuery_destino_pdv.Open();

        IF not FrmImportar_Registros60.IQuery_destino_pdv.IsEmpty then
        Begin

        FrmImportar_Registros60.IQuery_Update_pdv.sql.Text := 'UPDATE REGISTRO_60I SET EXPORTADO =1 WHERE EXPORTADO = 0 ';
        FrmImportar_Registros60.IQuery_Update_pdv.Prepare;
        FrmImportar_Registros60.IQuery_Update_pdv.ExecSQL;

         FrmImportar_Registros60.IQuery_destino_pdv.First;
         While not FrmImportar_Registros60.IQuery_destino_pdv.Eof do
         Begin

         DT_EMISSAO_LISTA :=  DateToStr(FrmImportar_Registros60.IQuery_destino_pdv.FieldByName('DT_EMISSAO').AsDateTime);
         NUM_ECF_LISTA    := FrmImportar_Registros60.IQuery_destino_Pdv.FieldByName('NUM_SERIE').AsString;

         FrmImportar_Registros60.QUpdate.Sql.Text := 'DELETE FROM REGISTRO_60I WHERE NUM_SERIE =:NUM_SERIE AND DT_EMISSAO = :DT_EMISSAO';
         FrmImportar_Registros60.QUpdate.ParamByName('NUM_SERIE').AsString    := NUM_ECF_LISTA;
         FrmImportar_Registros60.QUpdate.ParamByName('DT_EMISSAO').AsDateTime := StrToDate(DT_EMISSAO_LISTA);
         FrmImportar_Registros60.QUpdate.Prepare;
         FrmImportar_Registros60.QUpdate.ExecSQL;



         FrmImportar_Registros60.IQuery_destino_pdv.Next;

         Application.ProcessMessages;
         End;

        Registro_60i := True;
        End;

        if Registro_60i then
        Begin


         Eficaz_Pdv.Close;
         Eficaz_Pdv.Open;


         FrmImportar_Registros60.QTransacoes.Close;
         FrmImportar_Registros60.QTransacoes.Connection         := Eficaz_Pdv;
         FrmImportar_Registros60.QTransacoes2.Connection        := FrmData.DbF_Eficaz;

         FrmImportar_Registros60.QTransacoes.sql.Text := 'SELECT DT_EMISSAO,     NUM_SERIE,   MODELO_DOC, ' +
                                          'NUM_ORDEM,      NUM_ITEM,    COD_PRODUTO, ' +
                                          'QUANTIDADE,     VR_UNITARIO, BASE_CALC_ICMS, ' +
                                          'SIT_TRIBUTARIA, VALOR_ICMS  ' +
                                 'FROM REGISTRO_60I WHERE EXPORTADO = 1 ORDER BY NUM_ORDEM';



         FrmImportar_Registros60.QTransacoes2.sql.Text := 'SELECT DT_EMISSAO,     NUM_SERIE,   MODELO_DOC, ' +
                                          'NUM_ORDEM,      NUM_ITEM,    COD_PRODUTO, ' +
                                          'QUANTIDADE,     VR_UNITARIO, BASE_CALC_ICMS, ' +
                                          'SIT_TRIBUTARIA, VALOR_ICMS  ' +
                                 'FROM REGISTRO_60I';


          FrmImportar_Registros60.QTransacoes.FetchOptions.Unidirectional := False;
          FrmImportar_Registros60.QTransacoes.FetchOptions.Mode           := fmAll;
          FrmImportar_Registros60.FDBatchMoveDataSetReader2.DataSet       := FrmImportar_Registros60.QTransacoes;
          FrmImportar_Registros60.FDBatchMoveDataSetWriter2.DataSet       := FrmImportar_Registros60.QTransacoes2;

          transferir_banco_trans_60i.Free;
          transferir_banco_trans_60i     := TFDBatchMove.Create(nil);

          FrmImportar_Registros60.IQuery_destino.Connection      := FrmImportar_Registros60.Eficaz_Server;
          FrmImportar_Registros60.IQuery_Update.Connection       := FrmImportar_Registros60.Eficaz_Server;
          FrmImportar_Registros60.IQuery_destino_Item.Connection := FrmImportar_Registros60.Eficaz_Server;

          transferir_banco_trans_60i.Reader        := FrmImportar_Registros60.FDBatchMoveDataSetReader2;
          transferir_banco_trans_60i.Writer        := FrmImportar_Registros60.FDBatchMoveDataSetWriter2;
          //transferir_banco_trans_60i.OnFindDestRecord := FrmImportar_Registros60.Transferir_banco_trans_60IFindDestRecord;
          transferir_banco_trans_60i.LogFileAction := laCreate;
          transferir_banco_trans_60i.LogFileName   := ExtractFilePath(ParamStr(0)) + 'EficazSync_Logs\Log_registro60i.log';
          transferir_banco_trans_60i.Mode          := dmAlwaysInsert;
          transferir_banco_trans_60i.Execute;

          //IQuery_Update.Connection  := TFDConnection(Temp);
          FrmImportar_Registros60.IQuery_Update_pdv.SQL.Text := 'UPDATE REGISTRO_60I SET EXPORTADO = 2 WHERE EXPORTADO =1 ';
          FrmImportar_Registros60.IQuery_Update_pdv.Prepare;
          FrmImportar_Registros60.IQuery_Update_pdv.ExecSQL;
          Application.ProcessMessages;


          //ShowMessage('finalizei 60i');
          Registro_60i := False;

        End;
     except
      {
      on e:Exception do
      begin
        Application.MessageBox(PChar('Erro registro 60i:' + #13 +
          'Erro registro 60r: ' + e.Message), 'Erro', MB_ICONSTOP + MB_TASKMODAL);
      end;

       }
     end;


     try

        FrmImportar_Registros60.IQuery_destino_pdv.Connection := Eficaz_Pdv;
        FrmImportar_Registros60.IQuery_Update_pdv.Connection  := Eficaz_Pdv;

        FrmImportar_Registros60.IQuery_destino_pdv.Close;
        FrmImportar_Registros60.IQuery_destino_pdv.SQL.Text := 'SELECT DT_EMISSAO,COD_PRODUTO,NUM_SERIE FROM REGISTRO_60D WHERE EXPORTADO = 0 ';
        FrmImportar_Registros60.IQuery_destino_pdv.Prepare;
        FrmImportar_Registros60.IQuery_destino_pdv.Open();

        IF not FrmImportar_Registros60.IQuery_destino_pdv.IsEmpty then
        Begin

        FrmImportar_Registros60.IQuery_Update_pdv.sql.Text := 'UPDATE REGISTRO_60D SET EXPORTADO =1 WHERE EXPORTADO = 0 ';
        FrmImportar_Registros60.IQuery_Update_pdv.Prepare;
        FrmImportar_Registros60.IQuery_Update_pdv.ExecSQL;

         FrmImportar_Registros60.IQuery_destino_pdv.First;
         While not FrmImportar_Registros60.IQuery_destino_pdv.Eof do
         Begin

         DT_EMISSAO_LISTA :=  DateToStr(FrmImportar_Registros60.IQuery_destino_pdv.FieldByName('DT_EMISSAO').AsDateTime);
         NUM_ECF_LISTA    := FrmImportar_Registros60.IQuery_destino_Pdv.FieldByName('NUM_SERIE').AsString;

         FrmImportar_Registros60.QUpdate.Sql.Text := 'DELETE FROM REGISTRO_60D WHERE NUM_SERIE =:NUM_SERIE AND DT_EMISSAO = :DT_EMISSAO';
         FrmImportar_Registros60.QUpdate.ParamByName('NUM_SERIE').AsString    := NUM_ECF_LISTA;
         FrmImportar_Registros60.QUpdate.ParamByName('DT_EMISSAO').AsDateTime := StrToDate(DT_EMISSAO_LISTA);
         FrmImportar_Registros60.QUpdate.Prepare;
         FrmImportar_Registros60.QUpdate.ExecSQL;



         FrmImportar_Registros60.IQuery_destino_pdv.Next;

         Application.ProcessMessages;
         End;

        Registro_60D := True;
        End;

        if Registro_60D then
        Begin


         Eficaz_Pdv.Close;
         Eficaz_Pdv.Open;


         FrmImportar_Registros60.QTransacoes.Close;
         FrmImportar_Registros60.QTransacoes.Connection         := Eficaz_Pdv;
         FrmImportar_Registros60.QTransacoes2.Connection        := FrmData.DbF_Eficaz;;

         FrmImportar_Registros60.QTransacoes.sql.Text := 'SELECT DT_EMISSAO,     NUM_SERIE, ' +
                                          'COD_PRODUTO, ' +
                                          'QUANTIDADE,     VR_UNITARIO, BASE_CALC_ICMS, ' +
                                          'SIT_TRIBUTARIA, VALOR_ICMS  ' +
                                 'FROM REGISTRO_60D WHERE EXPORTADO = 1 ';



         FrmImportar_Registros60.QTransacoes2.sql.Text := 'SELECT DT_EMISSAO,     NUM_SERIE, ' +
                                          'COD_PRODUTO, ' +
                                          'QUANTIDADE,     VR_UNITARIO, BASE_CALC_ICMS, ' +
                                          'SIT_TRIBUTARIA, VALOR_ICMS  ' +
                                 'FROM REGISTRO_60D';


          FrmImportar_Registros60.QTransacoes.FetchOptions.Unidirectional := False;
          FrmImportar_Registros60.QTransacoes.FetchOptions.Mode           := fmAll;
          FrmImportar_Registros60.FDBatchMoveDataSetReader2.DataSet       := FrmImportar_Registros60.QTransacoes;
          FrmImportar_Registros60.FDBatchMoveDataSetWriter2.DataSet       := FrmImportar_Registros60.QTransacoes2;

          transferir_banco_trans_60D.Free;
          transferir_banco_trans_60D     := TFDBatchMove.Create(nil);

          FrmImportar_Registros60.IQuery_destino.Connection      := FrmImportar_Registros60.Eficaz_Server;
          FrmImportar_Registros60.IQuery_Update.Connection       := FrmImportar_Registros60.Eficaz_Server;
          FrmImportar_Registros60.IQuery_destino_Item.Connection := FrmImportar_Registros60.Eficaz_Server;

          transferir_banco_trans_60D.Reader        := FrmImportar_Registros60.FDBatchMoveDataSetReader2;
          transferir_banco_trans_60D.Writer        := FrmImportar_Registros60.FDBatchMoveDataSetWriter2;
          //transferir_banco_trans_60i.OnFindDestRecord := FrmImportar_Registros60.Transferir_banco_trans_60IFindDestRecord;
          transferir_banco_trans_60D.LogFileAction := laCreate;
          transferir_banco_trans_60D.LogFileName   := ExtractFilePath(ParamStr(0)) + 'EficazSync_Logs\Log_registro60D.log';
          transferir_banco_trans_60D.Mode          := dmAlwaysInsert;
          transferir_banco_trans_60D.Execute;

          //IQuery_Update.Connection  := TFDConnection(Temp);
          FrmImportar_Registros60.IQuery_Update_pdv.SQL.Text := 'UPDATE REGISTRO_60D SET EXPORTADO = 2 WHERE EXPORTADO =1 ';
          FrmImportar_Registros60.IQuery_Update_pdv.Prepare;
          FrmImportar_Registros60.IQuery_Update_pdv.ExecSQL;
          Application.ProcessMessages;


          //ShowMessage('finalizei 60i');
          Registro_60D := False;

        End;
     except
      {
      on e:Exception do
      begin
        Application.MessageBox(PChar('Erro registro 60i:' + #13 +
          'Erro registro 60r: ' + e.Message), 'Erro', MB_ICONSTOP + MB_TASKMODAL);
      end;

       }
     end;




   // End;

   // if VerificarPdv(TFDConnection(Temp).Params.Values['Server']) then
   // Begin
     try
      //ShowMessage('finalizei TRANSACOES6');
      FrmImportar_Registros60.IQuery_destino_pdv.Connection := Eficaz_Pdv;
      FrmImportar_Registros60.IQuery_Update_pdv.Connection  := Eficaz_Pdv;
      FrmImportar_Registros60.IQuery_destino_pdv.Close;
      FrmImportar_Registros60.IQuery_destino_pdv.SQL.Text := 'SELECT DT_EMISSAO, NUM_SERIE FROM REGISTRO_60M WHERE EXPORTADO = 0';
      FrmImportar_Registros60.IQuery_destino_pdv.Prepare;
      FrmImportar_Registros60.IQuery_destino_pdv.Open();

      IF not FrmImportar_Registros60.IQuery_destino_pdv.IsEmpty then
      Begin
      FrmImportar_Registros60.IQuery_Update_pdv.sql.Text := 'UPDATE REGISTRO_60M SET EXPORTADO =1 WHERE EXPORTADO = 0';
      FrmImportar_Registros60.IQuery_Update_pdv.Prepare;
      FrmImportar_Registros60.IQuery_Update_pdv.ExecSQL;



         FrmImportar_Registros60.IQuery_destino_pdv.First;
         While not FrmImportar_Registros60.IQuery_destino_pdv.Eof do
         Begin

         DT_EMISSAO_LISTA :=  DateToStr(FrmImportar_Registros60.IQuery_destino_pdv.FieldByName('DT_EMISSAO').AsDateTime);
         NUM_ECF_LISTA    := FrmImportar_Registros60.IQuery_destino_Pdv.FieldByName('NUM_SERIE').AsString;

         FrmImportar_Registros60.QUpdate.Sql.Text := 'DELETE FROM REGISTRO_60M WHERE NUM_SERIE =:NUM_SERIE AND DT_EMISSAO = :DT_EMISSAO';
         FrmImportar_Registros60.QUpdate.ParamByName('NUM_SERIE').AsString    := NUM_ECF_LISTA;
         FrmImportar_Registros60.QUpdate.ParamByName('DT_EMISSAO').AsDateTime := StrToDate(DT_EMISSAO_LISTA);
         FrmImportar_Registros60.QUpdate.Prepare;
         FrmImportar_Registros60.QUpdate.ExecSQL;


         FrmImportar_Registros60.IQuery_destino_pdv.Next;
         Application.ProcessMessages;
         End;



        Registro_60m := True;
      End;


      if Registro_60M then
      Begin


       FrmImportar_Registros60.QTransacoes.Close;
       FrmImportar_Registros60.QTransacoes.Connection         := Eficaz_Pdv;
       FrmImportar_Registros60.QTransacoes2.Connection        := FrmData.DbF_Eficaz;

       FrmImportar_Registros60.QTransacoes.sql.Text := 'SELECT DT_EMISSAO, NUM_SERIE,   NUM_ORDEM, ' +
                                    'MODELO_DOC, COO_INICIAL, COO_FINAL, ' +
                                    'CRZ,        CRO,         VENDA_BRUTA, ' +
                                    'GRANDE_TOTAL ' +
                               'FROM REGISTRO_60M WHERE EXPORTADO = 1';



       FrmImportar_Registros60.QTransacoes2.sql.Text := 'SELECT DT_EMISSAO, NUM_SERIE,   NUM_ORDEM, ' +
                                    'MODELO_DOC, COO_INICIAL, COO_FINAL, ' +
                                    'CRZ,        CRO,         VENDA_BRUTA, ' +
                                    'GRANDE_TOTAL ' +
                                    'FROM REGISTRO_60M ';


        FrmImportar_Registros60.QTransacoes.FetchOptions.Unidirectional := False;
        FrmImportar_Registros60.QTransacoes.FetchOptions.Mode := fmAll;

        FrmImportar_Registros60.FDBatchMoveDataSetReader2.DataSet := FrmImportar_Registros60.QTransacoes;
        FrmImportar_Registros60.FDBatchMoveDataSetWriter2.DataSet := FrmImportar_Registros60.QTransacoes2;

        transferir_banco_trans_60m.Free;
        transferir_banco_trans_60m     := TFDBatchMove.Create(nil);

        FrmImportar_Registros60.IQuery_destino.Connection      := FrmImportar_Registros60.Eficaz_Server;
        FrmImportar_Registros60.IQuery_Update.Connection       := FrmImportar_Registros60.Eficaz_Server;
        FrmImportar_Registros60.IQuery_destino_Item.Connection := FrmImportar_Registros60.Eficaz_Server;



        transferir_banco_trans_60m.Reader        := FrmImportar_Registros60.FDBatchMoveDataSetReader2;
        transferir_banco_trans_60m.Writer        := FrmImportar_Registros60.FDBatchMoveDataSetWriter2;
        //transferir_banco_trans_60m.OnFindDestRecord := FrmImportar_Registros60.Transferir_banco_trans_60mFindDestRecord;
        transferir_banco_trans_60m.LogFileAction := laCreate;
        transferir_banco_trans_60m.LogFileName   := ExtractFilePath(ParamStr(0)) + 'EficazSync_Logs\Log_Registro60m.log';
        transferir_banco_trans_60m.Mode          := dmAlwaysInsert;
        transferir_banco_trans_60m.Execute;

        //IQuery_Update.Connection  := TFDConnection(Temp);
        FrmImportar_Registros60.IQuery_Update_pdv.SQL.Text := 'UPDATE REGISTRO_60M SET EXPORTADO = 2 WHERE EXPORTADO =1';
        FrmImportar_Registros60.IQuery_Update_pdv.Prepare;
        FrmImportar_Registros60.IQuery_Update_pdv.ExecSQL;
        Application.ProcessMessages;

       // ShowMessage('finalizei 60m');
        Registro_60M := False;

      End;
     except

      {on e:Exception do
      begin
        Application.MessageBox(PChar('Erro registro 60m:' + #13 +
          'Erro registro 60r: ' + e.Message), 'Erro', MB_ICONSTOP + MB_TASKMODAL);
      end;
      }

     end;


     try
      //ShowMessage('finalizei TRANSACOES6');
      FrmImportar_Registros60.IQuery_destino_pdv.Connection := Eficaz_Pdv;
      FrmImportar_Registros60.IQuery_Update_pdv.Connection  := Eficaz_Pdv;
      FrmImportar_Registros60.IQuery_destino_pdv.Close;
      FrmImportar_Registros60.IQuery_destino_pdv.SQL.Text   := 'SELECT MES_ANO FROM REGISTRO_60R WHERE EXPORTADO = 0';
      FrmImportar_Registros60.IQuery_destino_pdv.Prepare;
      FrmImportar_Registros60.IQuery_destino_pdv.Open();

      IF not FrmImportar_Registros60.IQuery_destino_pdv.IsEmpty then
      Begin
      FrmImportar_Registros60.IQuery_Update_pdv.sql.Text := 'UPDATE REGISTRO_60R SET EXPORTADO = 1 WHERE EXPORTADO = 0';
      FrmImportar_Registros60.IQuery_Update_pdv.Prepare;
      FrmImportar_Registros60.IQuery_Update_pdv.ExecSQL;
      Application.ProcessMessages;

      Registro_60R := True;
      End;

     if Registro_60R then
      Begin

       FrmImportar_Registros60.QTransacoes.Close;
       FrmImportar_Registros60.QTransacoes.Connection         := Eficaz_Pdv;
       FrmImportar_Registros60.QTransacoes2.Connection        := FrmData.DbF_Eficaz;

       FrmImportar_Registros60.QTransacoes.sql.Text := 'SELECT * FROM REGISTRO_60R WHERE EXPORTADO = 1';


       FrmImportar_Registros60.QTransacoes2.sql.Text := 'SELECT * FROM REGISTRO_60R';


        FrmImportar_Registros60.QTransacoes.FetchOptions.Unidirectional := False;
        FrmImportar_Registros60.QTransacoes.FetchOptions.Mode := fmAll;

        FrmImportar_Registros60.FDBatchMoveDataSetReader2.DataSet := FrmImportar_Registros60.QTransacoes;
        FrmImportar_Registros60.FDBatchMoveDataSetWriter2.DataSet := FrmImportar_Registros60.QTransacoes2;

        transferir_banco_trans_60r.Free;
        transferir_banco_trans_60r     := TFDBatchMove.Create(nil);

        {FrmImportar_Registros60.IQuery_destino.Connection      := FrmImportar_Registros60.Eficaz_Server;
        FrmImportar_Registros60.IQuery_Update.Connection       := FrmImportar_Registros60.Eficaz_Server;
        FrmImportar_Registros60.IQuery_destino_Item.Connection := FrmImportar_Registros60.Eficaz_Server; }

        transferir_banco_trans_60r.Reader        := FrmImportar_Registros60.FDBatchMoveDataSetReader2;
        transferir_banco_trans_60r.Writer        := FrmImportar_Registros60.FDBatchMoveDataSetWriter2;
        transferir_banco_trans_60r.LogFileAction := LACreate;
        transferir_banco_trans_60r.LogFileName   := ExtractFilePath(ParamStr(0)) + 'EficazSync_Logs\Log_Registro60r.log';
        transferir_banco_trans_60r.Mode          := dmAlwaysInsert;
        transferir_banco_trans_60r.Execute;

        //IQuery_Update.Connection  := TFDConnection(Temp);
        FrmImportar_Registros60.IQuery_Update_pdv.SQL.Text := 'UPDATE REGISTRO_60R SET EXPORTADO = 2 WHERE EXPORTADO = 1';
        FrmImportar_Registros60.IQuery_Update_pdv.Prepare;
        FrmImportar_Registros60.IQuery_Update_pdv.ExecSQL;
        Application.ProcessMessages;

       // ShowMessage('finalizei 60m');
        Registro_60R := False;

      End;
     except
       {
     on e:Exception do
      begin
        Application.MessageBox(PChar('Erro registro 60r:' + #13 +
          'Erro registro 60r: ' + e.Message), 'Erro', MB_ICONSTOP + MB_TASKMODAL);
      end; }


     end;



   // End;

    //if VerificarPdv(TFDConnection(Temp).Params.Values['Server']) then
   // Begin
     try

      //ShowMessage('finalizei TRANSACOES7');

      FrmImportar_Registros60.IQuery_destino_pdv.Connection := Eficaz_Pdv;
      FrmImportar_Registros60.IQuery_Update_pdv.Connection  := Eficaz_Pdv;
      FrmImportar_Registros60.IQuery_destino_pdv.Close;
      FrmImportar_Registros60.IQuery_destino_pdv.SQL.Text := 'SELECT DT_EMISSAO, NUM_SERIE FROM REGISTRO_60A WHERE EXPORTADO = 0';
      FrmImportar_Registros60.IQuery_destino_pdv.Prepare;
      FrmImportar_Registros60.IQuery_destino_pdv.Open();

      IF not FrmImportar_Registros60.IQuery_destino_pdv.IsEmpty then
      Begin
      FrmImportar_Registros60.IQuery_Update_pdv.sql.Text := 'UPDATE REGISTRO_60A SET EXPORTADO = 1 WHERE EXPORTADO = 0';
      FrmImportar_Registros60.IQuery_Update_pdv.Prepare;
      FrmImportar_Registros60.IQuery_Update_pdv.ExecSQL;


        FrmImportar_Registros60.IQuery_destino_pdv.First;
         While not FrmImportar_Registros60.IQuery_destino_pdv.Eof do
         Begin

         DT_EMISSAO_LISTA :=  DateToStr(FrmImportar_Registros60.IQuery_destino_pdv.FieldByName('DT_EMISSAO').AsDateTime);
         NUM_ECF_LISTA    := FrmImportar_Registros60.IQuery_destino_Pdv.FieldByName('NUM_SERIE').AsString;

         FrmImportar_Registros60.QUpdate.Sql.Text := 'DELETE FROM REGISTRO_60A WHERE NUM_SERIE =:NUM_SERIE AND DT_EMISSAO = :DT_EMISSAO';
         FrmImportar_Registros60.QUpdate.ParamByName('NUM_SERIE').AsString    := NUM_ECF_LISTA;
         FrmImportar_Registros60.QUpdate.ParamByName('DT_EMISSAO').AsDateTime := StrToDate(DT_EMISSAO_LISTA);
         FrmImportar_Registros60.QUpdate.Prepare;
         FrmImportar_Registros60.QUpdate.ExecSQL;

         FrmImportar_Registros60.IQuery_destino_pdv.Next;
         Application.ProcessMessages;
         End;



       Registro_60a := True;
      End;

      if Registro_60A then
      Begin

       FrmImportar_Registros60.QTransacoes.Close;
       FrmImportar_Registros60.QTransacoes.Connection         := Eficaz_Pdv;
       FrmImportar_Registros60.QTransacoes2.Connection        := FrmData.DbF_Eficaz;

       FrmImportar_Registros60.QTransacoes.sql.Text := 'SELECT DT_EMISSAO, NUM_SERIE,   SIT_TRIBUTARIA, ' +
                                    'VALOR_TOTALIZADOR ' +
                               'FROM REGISTRO_60A WHERE EXPORTADO = 1';



       FrmImportar_Registros60.QTransacoes2.sql.Text := 'SELECT DT_EMISSAO, NUM_SERIE,   SIT_TRIBUTARIA, ' +
                                    'VALOR_TOTALIZADOR ' +
                               'FROM REGISTRO_60A';


        FrmImportar_Registros60.QTransacoes.FetchOptions.Unidirectional := False;
        FrmImportar_Registros60.QTransacoes.FetchOptions.Mode := fmAll;

        FrmImportar_Registros60.FDBatchMoveDataSetReader2.DataSet := FrmImportar_Registros60.QTransacoes;
        FrmImportar_Registros60.FDBatchMoveDataSetWriter2.DataSet := FrmImportar_Registros60.QTransacoes2;

        transferir_banco_trans_60a.Free;
        transferir_banco_trans_60a     := TFDBatchMove.Create(nil);

        FrmImportar_Registros60.IQuery_destino.Connection      := FrmImportar_Registros60.Eficaz_Server;
        FrmImportar_Registros60.IQuery_Update.Connection       := FrmImportar_Registros60.Eficaz_Server;
        FrmImportar_Registros60.IQuery_destino_Item.Connection := FrmImportar_Registros60.Eficaz_Server;
        transferir_banco_trans_60a.Reader        := FrmImportar_Registros60.FDBatchMoveDataSetReader2;
        transferir_banco_trans_60a.Writer        := FrmImportar_Registros60.FDBatchMoveDataSetWriter2;

       // transferir_banco_trans_60a.OnFindDestRecord := FrmImportar_Registros60.Transferir_banco_trans_60aFindDestRecord;

        transferir_banco_trans_60a.LogFileAction := laCreate;
        transferir_banco_trans_60a.LogFileName   := ExtractFilePath(ParamStr(0)) + 'EficazSync_Logs\Registro60a.log';
        transferir_banco_trans_60a.Mode          := dmAlwaysInsert;
        transferir_banco_trans_60a.Execute;

        //IQuery_Update.Connection  := TFDConnection(Temp);
        FrmImportar_Registros60.IQuery_Update_pdv.SQL.Text := 'UPDATE REGISTRO_60A SET EXPORTADO = 2 WHERE EXPORTADO =1';
        FrmImportar_Registros60.IQuery_Update_pdv.Prepare;
        FrmImportar_Registros60.IQuery_Update_pdv.ExecSQL;

        Application.ProcessMessages;

       //ShowMessage('finalizei 60a');
        Registro_60A := False;

      End;
     Except

      {on e:Exception do
      begin
        Application.MessageBox(PChar('Erro registro 60A:' + #13 +
          'Erro registro 60r: ' + e.Message), 'Erro', MB_ICONSTOP + MB_TASKMODAL);
      end;
      }

     end;


    IQuery.next;
   End;




   for i := 1 to ComponentCount - 1 do
   Begin
   Temp := Components[i];
    if Temp is TCheckBox then
    Begin
     if (TcheckBox(Temp).Checked) and (TcheckBox(Temp).Name <> 'Todas_Ecfsi') then
     Begin
      TcheckBox(Temp).Checked := False;
     End;
    End;
   End;

  End
  Else
  Begin
    for i := 1 to ComponentCount - 1 do
    Begin
     Temp := Components[i];
     if Temp is TCheckBox then
     Begin
      if (TcheckBox(Temp).Checked) and (TcheckBox(Temp).Name <> 'Todas_Ecfsi') then
      Begin
       try
         Num_ecf := StrtoInt(Copy(TcheckBox(Temp).Name,5,3));


         QUpdate.Sql.text := 'UPDATE LICENCA_IF SET IMPORTACAO = 10 ,CARGA_TOTAL = 0  WHERE CAST(NUM_ECF AS INTEGER) = ' + IntToStr(NUM_ECF);
         QUpdate.Prepare;
         QUpdate.ExecSQL;

         TcheckBox(Temp).Checked := False;

       Except

       end;

      End;
     End;
    end;
  End;
end;

procedure TFrmImportar_Registros60.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then

end;

procedure TFrmImportar_Registros60.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Abertura := 0;
  Action := caFree;
end;

procedure TFrmImportar_Registros60.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (Operacao = 'Inserindo') or (Operacao = 'Alterando') then
  begin
    Application.MessageBox('É melhor salvar as alterações antes de continuar', PChar(Msg_Title), mb_IconStop);
    CanClose := False;
  end;
end;

procedure TFrmImportar_Registros60.FormCreate(Sender: TObject);
begin
  Dtmem.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);

 FDPhysPgDriverLink1.VendorLib := ExtractFilePath(ParamStr(0))+ '\DllsPG\libpq.dll';

  CmdSelect     := QTabela.Sql.Text;
  CmdSelectNull := 'WHERE (SERIAL IS NOT NULL)';
  CmdOrderBy    := 'ORDER BY NUM_ECF';

  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

  FrmData.QAcesso.Refresh;

  QTabela.Prepare;
  QTabela.Open;

end;

procedure TFrmImportar_Registros60.FormShow(Sender: TObject);
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
      if QTabela.fieldByName('NUM_ECF').AsString = Copy(TcheckBox(Temp).Name,5,3) then
      Begin
      TcheckBox(Temp).Enabled := True;
      //TcheckBox(Temp).Checked := True;
      End;

     End;
    end;
    Todas_Ecfsi.enabled := True;
  End;
  QTabela.next;
 End;

end;

end.
