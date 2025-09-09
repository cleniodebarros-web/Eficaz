unit UReducaoZ;

interface                                           

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Spin, ComCtrls, DB, DBTables, IBCustomDataSet,
  IBQuery, Mask, rxToolEdit, rxCurrEdit, Grids, DBGrids, AppEvnts,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmReducaoZ = class(TForm)
    Panel1: TPanel;
    btnRetorna: TBitBtn;
    btnPrior: TBitBtn;
    btnNext: TBitBtn;
    btnInsert: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    btnSave: TBitBtn;
    btnDiscard: TBitBtn;
    PageControl: TPageControl;
    REGISTRO_60M: TTabSheet;
    Label2: TLabel;
    DT_EMISSAO: TDateEdit;
    NUM_SERIE: TEdit;
    Label9: TLabel;
    Label6: TLabel;
    CRO: TEdit;
    Label5: TLabel;
    CRZ: TEdit;
    Label3: TLabel;
    COO_INICIAL: TEdit;
    Label4: TLabel;
    COO_FINAL: TEdit;
    Label7: TLabel;
    VENDA_BRUTA: TCurrencyEdit;
    Label12: TLabel;
    GRANDE_TOTAL: TCurrencyEdit;
    Label13: TLabel;
    NUM_ORDEM: TEdit;
    Label14: TLabel;
    MODELO_DOC: TEdit;
    REGISTRO_60A: TTabSheet;
    SIT_TRIBUTARIA: TEdit;
    Label1: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    DT_EMISSAO1: TDateEdit;
    NUM_SERIE1: TEdit;
    VALOR_TOTALIZADOR: TCurrencyEdit;
    btnPesquisa: TBitBtn;
    DataTabela: TDataSource;
    DBGrid1: TDBGrid;
    ApplicationEvents1: TApplicationEvents;
    btnMostrarTodos: TBitBtn;
    IQuery: TFDQuery;
    QTabela: TFDQuery;
    QArq: TFDQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRetornaClick(Sender: TObject);
    procedure btnPriorClick(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnDiscardClick(Sender: TObject);
    procedure REGISTRO_60MShow(Sender: TObject);
    procedure REGISTRO_60AShow(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure NUM_ORDEMKeyPress(Sender: TObject; var Key: Char);
    procedure COO_INICIALKeyPress(Sender: TObject; var Key: Char);
    procedure COO_FINALKeyPress(Sender: TObject; var Key: Char);
    procedure CROKeyPress(Sender: TObject; var Key: Char);
    procedure CRZKeyPress(Sender: TObject; var Key: Char);
    procedure btnPesquisaClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ApplicationEvents1Message(var Msg: tagMSG; var Handled: Boolean);
    procedure QTabelaAfterOpen(DataSet: TDataSet);
    procedure btnMostrarTodosClick(Sender: TObject);
    procedure CROExit(Sender: TObject);
    procedure CRZExit(Sender: TObject);
    procedure COO_INICIALExit(Sender: TObject);
    procedure COO_FINALExit(Sender: TObject);
    procedure NUM_ORDEMExit(Sender: TObject);
    procedure NUM_SERIEKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CROKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure CRZKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure COO_INICIALKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure COO_FINALKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure VENDA_BRUTAKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GRANDE_TOTALKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure NUM_ORDEMKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1CellClick(Column: TColumn);


  private
    procedure Habilitar(Status: Boolean);
    procedure Insert;
    procedure Set_Campos(Vazio: Boolean);
    procedure Botoes_Normal;
    procedure Botoes_Editing;
    procedure Edit;


    { Private declarations }
  public
    { Public declarations }
    CmdSelect: String;
    CmdOrderBy: String;
    CmdSelectNull: String;


  end;

var
  FrmReducaoZ: TFrmReducaoZ;
  Operacao, Tp_Tabela, Tabela, Ativo: String;
  prox: Boolean;

implementation

uses
  UPrincipal, UConsulta, UData, UPasswordDlg, UEficaz_ini, UPesquisa;

{$R *.DFM}


function GetPesquisa(Nm_Form: String): String;
begin
  Par_Sql := Nm_Form;

  Application.CreateForm(TFrmPesquisa, FrmPesquisa);
  try
    FrmPesquisa.ShowModal;

    if (not FrmPesquisa.QTabela.IsEmpty) and (FrmPesquisa.ModalResult = mrOK) then
      Result := ChavePesquisa
    else
      Result := '';
  finally
    FrmPesquisa.Release;
  end;
end;


procedure TFrmReducaoZ.btnRetornaClick(Sender: TObject);
begin
 Close;
end;

procedure TFrmReducaoZ.btnSaveClick(Sender: TObject);
begin

   if REGISTRO_60M.Showing then
   Begin
    if (length(NUM_SERIE.Text) = 0) or (length(NUM_SERIE.Text) < 20) then
     Begin
       ShowMessage('Preenchimento Inválido! O campo Número de Série deve ter 20 caracteres.');
       NUM_SERIE.SetFocus;
       Abort;
     End;



    if CRO.Text = '' then
     Begin
       ShowMessage('Campo obrigatório!');
       CRO.SetFocus;
       Abort;
     End;


    if CRZ.Text = '' then
     Begin
      ShowMessage('Campo obrigatório!');
      CRZ.SetFocus;
      Abort;
     End;


    if trim(COO_INICIAL.text) = '' then
     Begin
       ShowMessage('Campo obrigatório!');
       COO_INICIAL.SetFocus;
       Abort;
     End;


    if Alltrim(COO_FINAL.Text) = '' then
     Begin
        if StrToInt(COO_FINAL.text) = 0 then
         Begin
           ShowMessage('Campo obrigatório!');
           COO_FINAL.SetFocus;
           Abort;
         end;
     End;


    if Trim(NUM_ORDEM.Text) = '' then
     Begin
       ShowMessage('Campo Obrigatório');
       NUM_ORDEM.SetFocus;
       Abort;
     End;

   End;


    if REGISTRO_60A.Showing then
     begin
      if (NUM_SERIE1.Text = '') OR (length(NUM_SERIE1.Text) < 20) then
      Begin
       MessageDlg('O campo Número de Série deve ter 20 caracteres.', mtError, [mbOK], 0);
       NUM_SERIE1.SetFocus;
       Abort;
      End;

      if AllTrim(SIT_TRIBUTARIA.Text) = '' then
       Begin
        ShowMessage('Campo Obrigatório');
        SIT_TRIBUTARIA.SetFocus;
        Abort;
       End;
     end;

      if Operacao = 'Inserindo' then
       begin
        Insert;
        QTabela.Open;
        QTabela.Last;
       end
      else
       Edit;

     Set_Campos(False);
     Habilitar(False);
     Botoes_Normal;
     Operacao := '';
end;


procedure TFrmReducaoZ.COO_FINALExit(Sender: TObject);
begin

  if COO_FINAL.Text <> '' then
  Begin
    if Length(trim(COO_FINAL.text)) < 6 then
    COO_FINAL.Text := FormatFloat('000000', StrToInt(COO_FINAL.text));
  End;

end;

procedure TFrmReducaoZ.COO_FINALKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = Vk_Up then
        Perform(Wm_NextDlgctl, 1, 0);

     if (Key = Vk_Return) or (Key = Vk_Down) then
        Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmReducaoZ.COO_FINALKeyPress(Sender: TObject; var Key: Char);
begin
      if Alltrim(COO_FINAL.Text) <> '' then
      Begin
      if Not (key in ['0'..'9',#8]) then
      key := #0;
      End;
end;

procedure TFrmReducaoZ.COO_INICIALExit(Sender: TObject);
begin
    if COO_INICIAL.text <> '' then
    begin
       if Length(trim(COO_INICIAL.text)) < 6 then
       COO_INICIAL.Text := FormatFloat('000000', StrToInt(COO_INICIAL.text));
    end;
end;

procedure TFrmReducaoZ.COO_INICIALKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = Vk_Up then
        Perform(Wm_NextDlgctl, 1, 0);

     if (Key = Vk_Return) or (Key = Vk_Down) then
        Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmReducaoZ.COO_INICIALKeyPress(Sender: TObject; var Key: Char);
begin
    if Not (key in ['0'..'9',#8]) then
    key := #0;
end;

procedure TFrmReducaoZ.CROExit(Sender: TObject);
begin
  if CRO.Text <> '' then
  Begin
    if Length(CRO.Text) <= 3 then
       CRO.Text := FormatFloat('000', StrToInt(CRO.Text));

    if (Length(CRO.Text) > 3) AND (Length(CRO.Text) < 6)then
      CRO.Text := FormatFloat('000000', StrToInt(CRO.Text));
  End;
end;



procedure TFrmReducaoZ.CROKeyPress(Sender: TObject; var Key: Char);
begin
      if Not (key in ['0'..'9',#8]) then
      key := #0;
end;

procedure TFrmReducaoZ.CRZExit(Sender: TObject);
begin
  if CRZ.Text <> '' then
  Begin
      if Length(CRZ.Text) <= 3 then
       CRZ.Text := FormatFloat('000', StrToInt(CRZ.Text));

      if (Length(CRZ.Text) > 3) AND (Length(CRZ.Text) < 6)then
       CRZ.Text := FormatFloat('000000', StrToInt(CRZ.Text));
  End;
end;

procedure TFrmReducaoZ.CRZKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = Vk_Up then
        Perform(Wm_NextDlgctl, 1, 0);

     if (Key = Vk_Return) or (Key = Vk_Down) then
        Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmReducaoZ.CRZKeyPress(Sender: TObject; var Key: Char);
begin
      if Not (key in ['0'..'9',#8]) then
      key := #0;
end;

procedure TFrmReducaoZ.DBGrid1CellClick(Column: TColumn);
begin
     Set_Campos(False);
     Botoes_Normal;
end;

procedure TFrmReducaoZ.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

if btnSave.Enabled = False then
 Begin
  if (key = vk_down) or (key=VK_RIGHT) then
  Begin
     Key := 0;
    if not QTabela.Eof then
    begin
     QTabela.Next;
     Set_Campos(False);
    end;
  End
  else if (key = vk_up) or (key=VK_LEFT) then
  Begin
   Key := 0;
    if not QTabela.Bof then
    begin
     QTabela.Prior;
     Set_Campos(False);
    end;
  End;
 End;
End;



procedure TFrmReducaoZ.Edit;
var
I: Integer;
Temp: TComponent;
Sql: String;
begin
    Sql := 'UPDATE '+Tabela+' SET ';

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit and (TEdit(Temp).Tag = PageControl.TabIndex ) then
    begin

     if TEdit(Temp).Name = 'NUM_SERIE1' then
     begin
      if Sql = 'UPDATE '+Tabela+' SET ' then
        Sql := Sql + 'NUM_SERIE = :' + TEdit(Temp).Name
      else
        Sql := Sql + ', NUM_SERIE = :' + TEdit(Temp).Name;
     end
     else
     Begin
      if Sql = 'UPDATE '+Tabela+' SET ' then
        Sql := Sql + TEdit(Temp).Name + ' = :' + TEdit(Temp).Name
      else
        Sql := Sql + ', ' + TEdit(Temp).Name + ' = :' + TEdit(Temp).Name;
     End;

    end;


    if Temp is TCurrencyEdit and (TCurrencyEdit(Temp).Tag = PageControl.TabIndex ) then
    begin
      if Sql = 'UPDATE '+Tabela+' SET ' then
        Sql := Sql + TCurrencyEdit(Temp).Name + ' = :' + TCurrencyEdit(Temp).Name
      else
        Sql := Sql + ', ' + TCurrencyEdit(Temp).Name + ' = :' + TCurrencyEdit(Temp).Name;
    end;


    if Temp is TDateEdit  and (TDateEdit(Temp).Tag = PageControl.TabIndex ) then
    begin

       if TDateEdit(Temp).Name = 'DT_EMISSAO1' then
       Begin
          if Sql = 'UPDATE '+Tabela+' SET ' then
           Sql := Sql + 'DT_EMISSAO = :' + TDateEdit(Temp).Name
         else
           Sql := Sql + ', DT_EMISSAO = :' + TDateEdit(Temp).Name;
       End
       else
       Begin
         if Sql = 'UPDATE '+Tabela+' SET ' then
           Sql := Sql + TDateEdit(Temp).Name + ' = :' + TDateEdit(Temp).Name
         else
           Sql := Sql + ', ' + TDateEdit(Temp).Name + ' = :' + TDateEdit(Temp).Name;
       End;

    end;
end;

  if Tabela = 'REGISTRO_60A' then
  Sql := Sql + ' WHERE (DT_EMISSAO = :DT) AND (NUM_SERIE = :NUM) AND (SIT_TRIBUTARIA = :SIT) AND (VALOR_TOTALIZADOR = :VALOR)'
  Else
  Sql := Sql + ' WHERE (COO_INICIAL = :CI) AND (COO_FINAL = :CF)';


  

  IQuery.Sql.Clear;
  IQuery.Sql.Add(Sql);

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit and (TDateEdit(Temp).Tag = PageControl.TabIndex ) then
    Begin

      if TEdit(Temp).Name = 'NUM_SERIE1' then
         IQuery.ParamByName('NUM_SERIE1').AsString := TEdit(Temp).Text
      else
         IQuery.ParamByName(TEdit(Temp).Name).AsString := TEdit(Temp).Text; 
    End;

    if Temp is TCurrencyEdit and(TCurrencyEdit(Temp).Tag = PageControl.TabIndex ) then
      IQuery.ParamByName(TCurrencyEdit(Temp).Name).AsFloat := TCurrencyEdit(Temp).Value;

     if Temp is TDateEdit and (TDateEdit(Temp).Tag = PageControl.TabIndex ) then
     Begin
       if TDateEdit(Temp).Name = 'DT_EMISSAO1' then
        IQuery.ParamByName('DT_EMISSAO1').AsDateTime := StrToDate(TDateEdit(Temp).Text)
       else
        IQuery.ParamByName(TDateEdit(Temp).Name).AsDateTime := StrToDate(TDateEdit(Temp).Text);
     End;

  end;


  if Tabela = 'REGISTRO_60A' then
  Begin
   IQuery.ParamByName('DT').AsDateTime     := QTabela.FieldByName('DT_EMISSAO').AsDateTime;
   IQuery.ParamByName('NUM').AsString      := QTabela.FieldByName('NUM_SERIE').AsString;
   IQuery.ParamByName('SIT').AsString      := QTabela.FieldByName('SIT_TRIBUTARIA').AsString;
   IQuery.ParamByName('VALOR').AsFloat     := QTabela.FieldByName('VALOR_TOTALIZADOR').AsFloat;
  End
  else
  Begin
   IQuery.ParamByName('CI').AsString      := QTabela.FieldByName('COO_INICIAL').AsString;
   IQuery.ParamByName('CF').AsString      := QTabela.FieldByName('COO_FINAL').AsString;
  End;


  IQuery.Prepare;

  IQuery.ExecSql;

  QTabela.Close;
  QTabela.Open;


  Habilitar(False);
end;


procedure TFrmReducaoZ.FormClose(Sender: TObject; var Action: TCloseAction);
begin 
  Action := caFree;
end;


procedure TFrmReducaoZ.FormShow(Sender: TObject);
begin
    QTabela.Active := True;
end;

procedure TFrmReducaoZ.GRANDE_TOTALKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = Vk_Up then
        Perform(Wm_NextDlgctl, 1, 0);

     if (Key = Vk_Return) or (Key = Vk_Down) then
        Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmReducaoZ.Habilitar(Status: Boolean);
var
I: Integer;
Temp: TComponent;
begin
  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit AND (TEdit(Temp).Tag = PageControl.TabIndex) then
      TEdit(Temp).Enabled := Status;

    if Temp is TDateEdit AND (TDateEdit(Temp).Tag = PageControl.TabIndex) then
      TDateEdit(Temp).Enabled := Status;

    if Temp is TCurrencyEdit AND (TCurrencyEdit(Temp).Tag = PageControl.TabIndex) then
      TCurrencyEdit(Temp).Enabled := Status;

  end;
end;

procedure TFrmReducaoZ.Insert;
var
I: Integer;
Temp: TComponent;
Sql, Par: String;
begin

  Sql := 'INSERT INTO '+Tabela+'(';
  Par := '';

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit and (TEdit(Temp).Tag = PageControl.TabIndex ) then
    begin

    if TEdit(Temp).Name = 'NUM_SERIE1' then
    Begin
      if Sql = 'INSERT INTO '+Tabela+'(' then
        Sql := Sql + 'NUM_SERIE'
      else
        Sql := Sql + ', ' +  'NUM_SERIE';
      if Par = '' then
        Par := Par + ':' +   TEdit(Temp).Name
      else
        Par := Par + ', :' + TEdit(Temp).Name;
    End
    else
    Begin
      if Sql = 'INSERT INTO '+Tabela+'(' then
        Sql := Sql + TEdit(Temp).Name
      else
        Sql := Sql + ', ' +  TEdit(Temp).Name;
      if Par = '' then
        Par := Par + ':' +   TEdit(Temp).Name
      else
        Par := Par + ', :' + TEdit(Temp).Name;
    End;

    end;

    if Temp is TDateEdit and (TDateEdit(Temp).Tag = PageControl.TabIndex ) then
    begin

      if TDateEdit(Temp).Name = 'DT_EMISSAO1' then
      Begin
        if Sql = 'INSERT INTO '+Tabela+'(' then
        Sql := Sql + 'DT_EMISSAO'
        else
        Sql := Sql + ', ' + 'DT_EMISSAO';
        if Par = '' then
        Par := Par + ':' + TDateEdit(Temp).Name
        else
        Par := Par + ', :' + TDateEdit(Temp).Name;
      End
      else
      Begin
        if Sql = 'INSERT INTO '+Tabela+'(' then
        Sql := Sql + TDateEdit(Temp).Name
        else
        Sql := Sql + ', ' + TDateEdit(Temp).Name;
        if Par = '' then
        Par := Par + ':' + TDateEdit(Temp).Name
        else
        Par := Par + ', :' + TDateEdit(Temp).Name;
      End;



    end;

     if Temp is TCurrencyEdit and (TCurrencyEdit(Temp).Tag = PageControl.TabIndex ) then
    begin
      if Sql = 'INSERT INTO '+Tabela+'(' then
        Sql := Sql + TCurrencyEdit(Temp).Name
      else
        Sql := Sql + ', ' + TCurrencyEdit(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TCurrencyEdit(Temp).Name
      else
        Par := Par + ', :' + TCurrencyEdit(Temp).Name;
    end;



  end;

  Sql := Sql + ') VALUES(' + Par + ')';

 

  IQuery.Sql.Clear;
  IQuery.Sql.Add(Sql);

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit and (TEdit(Temp).Tag = PageControl.TabIndex ) then
     IQuery.ParamByName(TEdit(Temp).Name).AsString := TEdit(Temp).Text;

    if Temp is TDateEdit and (TDateEdit(Temp).Tag = PageControl.TabIndex ) then
     IQuery.ParamByName(TDateEdit(Temp).Name).AsDateTime := StrToDate(TDateEdit(Temp).Text);

    if Temp is TCurrencyEdit and (TCurrencyEdit(Temp).Tag = PageControl.TabIndex ) then
     IQuery.ParamByName(TCurrencyEdit(Temp).Name).AsFloat := TCurrencyEdit(Temp).Value;

  end;

  IQuery.Prepare;
  IQuery.ExecSql;

  Habilitar(False);
end;



procedure TFrmReducaoZ.NUM_ORDEMExit(Sender: TObject);
begin
  if NUM_ORDEM.Text <> '' then
    Begin
      if (Length(Trim(NUM_ORDEM.Text)) > 0) AND (Length(Trim(NUM_ORDEM.Text)) < 3) then
      NUM_ORDEM.Text := FormatFloat('000', StrToInt(NUM_ORDEM.Text));
    End;
end;

procedure TFrmReducaoZ.NUM_ORDEMKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = Vk_Up then
        Perform(Wm_NextDlgctl, 1, 0);

     if (Key = Vk_Return) or (Key = Vk_Down) then
        Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmReducaoZ.NUM_ORDEMKeyPress(Sender: TObject; var Key: Char);
begin
    if Not (key in ['0'..'9', #8]) then
    key := #0;
end;


procedure TFrmReducaoZ.NUM_SERIEKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 

    if Key = Vk_Up then
        Perform(Wm_NextDlgctl, 1, 0);

     if (Key = Vk_Return) or (Key = Vk_Down) then
        Perform(Wm_NextDlgctl, 0, 0);

end;

procedure TFrmReducaoZ.QTabelaAfterOpen(DataSet: TDataSet);
begin
    if (Tabela = 'REGISTRO_60M') and (REGISTRO_60M.Showing) then
    Begin
     TFloatField(QTabela.FieldByName('VENDA_BRUTA')).DisplayFormat  := '#,##0.00';
     TFloatField(QTabela.FieldByName('GRANDE_TOTAL')).DisplayFormat  := '#,##0.00';
    End;

    if (Tabela = 'REGISTRO_60A') and (REGISTRO_60A.Showing) then
    TFloatField(QTabela.FieldByName('VALOR_TOTALIZADOR')).DisplayFormat  := '#,##0.00';

end;

procedure TFrmReducaoZ.Set_Campos(Vazio: Boolean);
var
      I: Integer;
      Temp: TComponent;
begin


 QTabela.Open;


for I := 0 to (ComponentCount - 1) do
  begin
     Temp := Components[I];

  if Vazio then
    begin
      if Temp is TEdit then
        TEdit(Temp).Text := '';

      if Temp is TCurrencyEdit then
        TCurrencyEdit(Temp).Value := 0;
  end
  else
    begin
         if Temp is TEdit and (TEdit(Temp).Tag = PageControl.TabIndex ) then
         Begin
          if TEdit(Temp).Name = 'NUM_SERIE1' then
            TEdit(Temp).Text             := QTabela.FieldByName('NUM_SERIE').AsString
          else
            TEdit(Temp).Text             := QTabela.FieldByName(TEdit(Temp).Name).AsString;
         End;

         if Temp is TCurrencyEdit and (TCurrencyEdit(Temp).Tag = PageControl.TabIndex ) then
          TCurrencyEdit(Temp).Value    := QTabela.FieldByName(TCurrencyEdit(Temp).Name).AsFloat;


         if Temp is TDateEdit and (TDateEdit(Temp).Tag = PageControl.TabIndex ) then
         Begin
         if TDateEdit(Temp).Name = 'DT_EMISSAO1' then
          TDateEdit(Temp).Text         := QTabela.FieldByName('DT_EMISSAO').AsString
         else
          TDateEdit(Temp).Text         := QTabela.FieldByName(TDateEdit(Temp).Name).AsString;

         End;
    End;

  end;

end;



procedure TFrmReducaoZ.VENDA_BRUTAKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = Vk_Up then
        Perform(Wm_NextDlgctl, 1, 0);

     if (Key = Vk_Return) or (Key = Vk_Down) then
        Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmReducaoZ.REGISTRO_60MShow(Sender: TObject);
begin
    QTabela.SQL.Clear;
    Tabela := 'REGISTRO_60M';
    QTabela.SQL.Add('SELECT * FROM '+ Tabela);
    QTabela.Prepare;
    Set_Campos(false);
    Botoes_Normal;

    DBGrid1.Columns.clear;

    DBGrid1.Columns[0].FieldName := 'DT_EMISSAO';
    DBGrid1.Columns[0].Title.Caption  := 'Data';

    DBGrid1.Columns[1].FieldName := 'NUM_SERIE';
    DBGrid1.Columns[1].Title.Caption  := 'Num. Série';

    DBGrid1.Columns[2].FieldName := 'NUM_ORDEM';
    DBGrid1.Columns[2].Title.Caption  := 'Num Ordem';

    DBGrid1.Columns[3].FieldName := 'MODELO_DOC';
    DBGrid1.Columns[3].Title.Caption  := 'Modelo DOC';

    DBGrid1.Columns[4].FieldName := 'COO_INICIAL';
    DBGrid1.Columns[4].Title.Caption  := 'Núm. Cupom Inicial';

    DBGrid1.Columns[5].FieldName := 'COO_FINAL';
    DBGrid1.Columns[5].Title.Caption  := 'Núm. Cupom Final';

    DBGrid1.Columns[6].FieldName := 'CRZ';
    DBGrid1.Columns[6].Title.Caption  := 'CRZ';

    DBGrid1.Columns[7].FieldName := 'CRO';
    DBGrid1.Columns[7].Title.Caption  := 'CRO';

    DBGrid1.Columns[8].FieldName := 'VENDA_BRUTA';
    DBGrid1.Columns[8].Title.Caption  := 'VENDA BRUTA';

    DBGrid1.Columns[9].FieldName := 'GRANDE_TOTAL';
    DBGrid1.Columns[9].Title.Caption  := 'TOTAL';
end;


procedure TFrmReducaoZ.REGISTRO_60AShow(Sender: TObject);
begin

     QTabela.SQL.Clear;
     Tabela := 'REGISTRO_60A';
     QTabela.SQL.Add('SELECT * FROM '+Tabela);
     QTabela.Prepare;
     Set_Campos(false);

     DBGrid1.Columns.clear;

     DBGrid1.Columns[0].FieldName := 'DT_EMISSAO';
     DBGrid1.Columns[0].Title.Caption  := 'Data';
     DBGrid1.Columns[0].Width := 120;

     DBGrid1.Columns[1].FieldName := 'NUM_SERIE';
     DBGrid1.Columns[1].Title.Caption  := 'Num. Série';
     DBGrid1.Columns[1].Width := 200;

     DBGrid1.Columns[2].FieldName := 'SIT_TRIBUTARIA';
     DBGrid1.Columns[2].Title.Caption  := 'Sit. Tributária';

     DBGrid1.Columns[3].FieldName := 'VALOR_TOTALIZADOR';
     DBGrid1.Columns[3].Title.Caption  := 'Valor Totalizador';

     Botoes_Normal;

end;

procedure TFrmReducaoZ.Botoes_Normal;
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

  btnSave.Enabled     := False;
  btnDiscard.Enabled  := False;
  btnRetorna.Enabled  := True;

end;


procedure TFrmReducaoZ.ApplicationEvents1Message(var Msg: tagMSG;
  var Handled: Boolean);
  var
  i: Smallint;
begin
  if Msg.message = WM_MOUSEWHEEL then
   begin
     Msg.message := WM_KEYDOWN;
     Msg.lParam := 0;
     i := HiWord(Msg.wParam);
     if i > 0 then
       Msg.wParam := VK_UP
     else
       Msg.wParam := VK_DOWN;

     Handled := False;
   end;
end;

procedure TFrmReducaoZ.Botoes_Editing;
begin
  btnPrior.Enabled    := False;
  btnNext.Enabled     := False;
  btnInsert.Enabled   := False;
  btnEdit.Enabled     := False;
  btnDelete.Enabled   := False;
  btnSave.Enabled     := True;
  btnDiscard.Enabled  := True;
  btnRetorna.Enabled  := False;
end;

procedure TFrmReducaoZ.btnDeleteClick(Sender: TObject);
begin
   if FrmData.QAcesso.FieldByName('EXCLUSAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para exclusão', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  if Application.MessageBox('Deseja realmente excluir?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = IDYES then
  begin


    IQuery.Sql.Clear;
    IQuery.Sql.Add('DELETE FROM '+Tabela+'');
    IQuery.Sql.Add('WHERE');

    if Tabela = 'REGISTRO_60M' then
    Begin
     IQuery.Sql.Add('(COO_INICIAL = :CI)');
     IQuery.Sql.Add('AND (COO_FINAL = :CF)');
     IQuery.ParamByName('CI').AsString      := QTabela.FieldByName('COO_INICIAL').AsString;
     IQuery.ParamByName('CF').AsString      := QTabela.FieldByName('COO_FINAL').AsString;
    End
    else
    Begin
      IQuery.Sql.Add('(DT_EMISSAO = :DT)');
      IQuery.Sql.Add('AND (NUM_SERIE = :NUM)');
      IQuery.Sql.Add('AND (SIT_TRIBUTARIA = :SIT)');
      IQuery.Sql.Add('AND (VALOR_TOTALIZADOR = :VALOR)');

      IQuery.ParamByName('DT').AsDateTime     := QTabela.FieldByName('DT_EMISSAO').AsDateTime;
      IQuery.ParamByName('NUM').AsString      := QTabela.FieldByName('NUM_SERIE').AsString;
      IQuery.ParamByName('SIT').AsString      := QTabela.FieldByName('SIT_TRIBUTARIA').AsString;
      IQuery.ParamByName('VALOR').AsFloat     := QTabela.FieldByName('VALOR_TOTALIZADOR').AsFloat;
    End;

    IQuery.Prepare;
    IQuery.ExecSql;



    QTabela.Close;

    QTabela.Prepare;
    QTabela.Open;

    Set_Campos(False);
    Botoes_Normal;
  end;
end;


procedure TFrmReducaoZ.btnDiscardClick(Sender: TObject);
begin
     Botoes_Normal;
     Set_Campos(False);
     Habilitar(False);
     Operacao := '';

end;

procedure TFrmReducaoZ.btnEditClick(Sender: TObject);
begin
     if FrmData.QAcesso.FieldByName('ALTERACAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para alteração', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  Operacao := 'Alterando';
  MODELO_DOC.ReadOnly := True;

  Botoes_Editing;
  Habilitar(True);

end;

procedure TFrmReducaoZ.btnInsertClick(Sender: TObject);
begin

  if FrmData.QAcesso.FieldByName('INCLUSAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para inclusão', PChar(Msg_Title), mb_IconStop);
    exit;
  end;
  
  DT_EMISSAO.Text := DateToStr(Date);

  if REGISTRO_60A.Showing then
     DT_EMISSAO1.Text := DateToStr(Date);

  Operacao := 'Inserindo';
  Botoes_Editing;
  Set_Campos(True);
  Habilitar(True);

  MODELO_DOC.Text := '2D';
  MODELO_DOC.Enabled := False;

end;


procedure TFrmReducaoZ.btnMostrarTodosClick(Sender: TObject);
begin
    QTabela.SQL.Clear;

    if REGISTRO_60M.Showing then    
     Tabela := 'REGISTRO_60M'
    else
     Tabela := 'REGISTRO_60A';


    QTabela.SQL.Add('SELECT * FROM '+ Tabela);
    QTabela.Prepare;
    Set_Campos(false);
    Botoes_Normal;
    btnMostrarTodos.Visible := False;
end;

procedure TFrmReducaoZ.btnNextClick(Sender: TObject);
begin
 if not QTabela.Eof then
  begin
    QTabela.Next;
    Set_Campos(False);
  end;
  Botoes_Normal;
end;

procedure TFrmReducaoZ.btnPesquisaClick(Sender: TObject);
var
Condicao, cmdSelect: String;

begin
    Condicao := GetPesquisa(PageControl.ActivePage.Name);
    cmdSelect:= 'SELECT * FROM '+PageControl.ActivePage.Name+' ';
    QTabela.Sql.Text := cmdSelect+Condicao;
    QTabela.Prepare;
    QTabela.Open;
    Set_Campos(False);
    Botoes_Normal;
    btnMostrarTodos.Visible := True;

    if REGISTRO_60A.Showing then
    begin
     DBGrid1.Columns.clear;

     DBGrid1.Columns[0].FieldName := 'DT_EMISSAO';
     DBGrid1.Columns[0].Title.Caption  := 'Data';
     DBGrid1.Columns[0].Width := 120;

     DBGrid1.Columns[1].FieldName := 'NUM_SERIE';
     DBGrid1.Columns[1].Title.Caption  := 'Num. Série';
     DBGrid1.Columns[1].Width := 200;

     DBGrid1.Columns[2].FieldName := 'SIT_TRIBUTARIA';
     DBGrid1.Columns[2].Title.Caption  := 'Sit. Tributária';

     DBGrid1.Columns[3].FieldName := 'VALOR_TOTALIZADOR';
     DBGrid1.Columns[3].Title.Caption  := 'Valor Totalizador';
    end;


    if REGISTRO_60M.Showing then
    begin
      DBGrid1.Columns.clear;

    DBGrid1.Columns[0].FieldName := 'DT_EMISSAO';
    DBGrid1.Columns[0].Title.Caption  := 'Data';

    DBGrid1.Columns[1].FieldName := 'NUM_SERIE';
    DBGrid1.Columns[1].Title.Caption  := 'Num. Série';

    DBGrid1.Columns[2].FieldName := 'NUM_ORDEM';
    DBGrid1.Columns[2].Title.Caption  := 'Num Ordem';

    DBGrid1.Columns[3].FieldName := 'MODELO_DOC';
    DBGrid1.Columns[3].Title.Caption  := 'Modelo DOC';

    DBGrid1.Columns[4].FieldName := 'COO_INICIAL';
    DBGrid1.Columns[4].Title.Caption  := 'Núm. Cupom Inicial';

    DBGrid1.Columns[5].FieldName := 'COO_FINAL';
    DBGrid1.Columns[5].Title.Caption  := 'Núm. Cupom Final';

    DBGrid1.Columns[6].FieldName := 'CRZ';
    DBGrid1.Columns[6].Title.Caption  := 'CRZ';

    DBGrid1.Columns[7].FieldName := 'CRO';
    DBGrid1.Columns[7].Title.Caption  := 'CRO';

    DBGrid1.Columns[8].FieldName := 'VENDA_BRUTA';
    DBGrid1.Columns[8].Title.Caption  := 'VENDA BRUTA';

    DBGrid1.Columns[9].FieldName := 'GRANDE_TOTAL';
    DBGrid1.Columns[9].Title.Caption  := 'TOTAL';
    end;



end;

procedure TFrmReducaoZ.btnPriorClick(Sender: TObject);
begin
     if not QTabela.Bof then
      begin
       QTabela.Prior;
       Set_Campos(False);
      end;
      Botoes_Normal;
end;

procedure TFrmReducaoZ.CROKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = Vk_Up then
        Perform(Wm_NextDlgctl, 1, 0);

     if (Key = Vk_Return) or (Key = Vk_Down) then
        Perform(Wm_NextDlgctl, 0, 0);
end;

end.
