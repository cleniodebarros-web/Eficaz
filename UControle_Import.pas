unit UControle_Import;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, IBCustomDataSet, Grids, DBGrids, IBQuery,
  IBUpdateSQL, ExtCtrls, rxToolEdit, Mask, rxCurrEdit, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmControle_Import = class(TForm)
    Panel1: TPanel;
    btnRetorna: TBitBtn;
    Label1: TLabel;
    Produto_id: TCurrencyEdit;
    Transacao_id: TCurrencyEdit;
    Label2: TLabel;
    Label3: TLabel;
    N_DI: TEdit;
    Label4: TLabel;
    C_Exportador: TEdit;
    btnOk: TBitBtn;
    IQuery: TFDQuery;
    QTabela: TFDQuery;
    procedure Grid_ItensKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Insert;
    procedure Edit;
  end;

var
  FrmControle_Import: TFrmControle_Import;
  Id_Trans, Id_Prod, Id_Soma: Integer;
  Desc_Prod:String;
  Altera: Boolean;

  procedure Edita_Import(Transacao, Produto: Integer; Descricao: String);

implementation

uses
  UData, UPrincipal;

{$R *.dfm}

procedure Edita_Import(Transacao, Produto: Integer ; Descricao :String);
begin
  Id_Trans  := Transacao;
  Id_Prod   := Produto;
  Desc_prod := Descricao;

  Application.CreateForm(TFrmControle_Import, FrmControle_Import);
  try
    FrmControle_Import.ShowModal;
  finally
    FrmControle_Import.Release;
  end;
end;

procedure TFrmControle_Import.Insert;
var
I: Integer;
Temp: TComponent;
Sql, Par: String;
begin
  Sql := 'INSERT INTO TRANSITENS_EXPORT(';
  Par := '';

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
    begin
      if Sql = 'INSERT INTO TRANSITENS_EXPORT(' then
        Sql := Sql + TEdit(Temp).Name
      else
        Sql := Sql + ', ' + TEdit(Temp).Name;

      if Par = '' then
        Par := Par + ':' + TEdit(Temp).Name
      else
        Par := Par + ', :' + TEdit(Temp).Name;
    end;

    if Temp is TComboBox then
    begin
      if Sql = 'INSERT INTO TRANSITENS_EXPORT(' then
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
      if Sql = 'INSERT INTO TRANSITENS_EXPORT(' then
        Sql := Sql + TCurrencyEdit(Temp).Name
      else
        Sql := Sql + ', ' + TCurrencyEdit(Temp).Name;

      if Par = '' then
        Par := Par + ':' + TCurrencyEdit(Temp).Name
      else
        Par := Par + ', :' + TCurrencyEdit(Temp).Name;
    end;

    if Temp is TDateEdit then
    begin
      if Sql = 'INSERT INTO TRANSITENS_EXPORT(' then
        Sql := Sql + TDateEdit(Temp).Name
      else
        Sql := Sql + ', ' + TDateEdit(Temp).Name;

      if Par = '' then
        Par := Par + ':' + TDateEdit(Temp).Name
      else
        Par := Par + ', :' + TDateEdit(Temp).Name;
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

    if Temp is TComboBox then
      IQuery.ParamByName(TComboBox(Temp).Name).AsString := TComboBox(Temp).Text;

    if Temp is TCurrencyEdit then
      IQuery.ParamByName(TCurrencyEdit(Temp).Name).AsFloat := TCurrencyEdit(Temp).Value;


    if Temp is TDateEdit then
      IQuery.ParamByName(TDateEdit(Temp).Name).AsDateTime := TDateEdit(Temp).Date;

  end;

  IQuery.Prepare;
  IQuery.ExecSql;



end;

procedure TFrmControle_Import.Edit;
var
I: Integer;
Temp: TComponent;
Sql: String;
begin
  Sql := 'UPDATE TRANSITENS_EXPORT SET ';

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
    begin
      if Sql = 'UPDATE TRANSITENS_EXPORT SET ' then
        Sql := Sql + TEdit(Temp).Name + ' = :' + TEdit(Temp).Name
      else
        Sql := Sql + ', ' + TEdit(Temp).Name + ' = :' + TEdit(Temp).Name;
    end;

    if Temp is TComboBox then
    begin
      if Sql = 'UPDATE TRANSITENS_EXPORT SET ' then
        Sql := Sql + TComboBox(Temp).Name + ' = :' + TComboBox(Temp).Name
      else
        Sql := Sql + ', ' + TComboBox(Temp).Name + ' = :' + TComboBox(Temp).Name;
    end;

    if Temp is TCurrencyEdit then
    begin
      if Sql = 'UPDATE TRANSITENS_EXPORT SET ' then
        Sql := Sql + TCurrencyEdit(Temp).Name + ' = :' + TCurrencyEdit(Temp).Name
      else
        Sql := Sql + ', ' + TCurrencyEdit(Temp).Name + ' = :' + TCurrencyEdit(Temp).Name;
    end;

    if Temp is TDateEdit then
    begin
      if Sql = 'UPDATE TRANSITENS_EXPORT SET ' then
        Sql := Sql + TDateEdit(Temp).Name + ' = :' + TDateEdit(Temp).Name
      else
        Sql := Sql + ', ' + TDateEdit(Temp).Name + ' = :' + TDateEdit(Temp).Name;
    end;
  end;


  Sql := Sql + ' WHERE (PRODUTO_ID = :ID) AND (TRANSACAO_ID = :TRANSACAO_ID)';

  
  IQuery.Sql.Clear;
  IQuery.Sql.Add(Sql);

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
      IQuery.ParamByName(TEdit(Temp).Name).AsString := TEdit(Temp).Text;

    if Temp is TComboBox then
      IQuery.ParamByName(TComboBox(Temp).Name).AsString := TComboBox(Temp).Text;

    if Temp is TCurrencyEdit then
      IQuery.ParamByName(TCurrencyEdit(Temp).Name).AsFloat := TCurrencyEdit(Temp).Value;

    if Temp is TDateEdit then
      IQuery.ParamByName(TDateEdit(Temp).Name).AsDateTime := TDateEdit(Temp).Date;

  end;

  IQuery.ParamByName('ID').AsInteger           := Id_Prod;
  IQuery.ParamByName('TRANSACAO_ID').AsInteger := Id_Trans;

  IQuery.Prepare;
  IQuery.ExecSql;



  QTabela.Close;

  QTabela.Prepare;
  QTabela.Open;

  QTabela.Locate('TRANSACAO_ID', Id_Trans, [loCaseInsensitive]);

end;



procedure TFrmControle_Import.btnOkClick(Sender: TObject);
begin
  if N_DI.Text = '' then
  begin
    Application.MessageBox('Código DI inválido', PChar(Msg_Title), mb_IconStop);

    N_DI.Color := clYellow;
    N_DI.SetFocus;

    exit;
  end;

 { if C_Exportador.Text = '' then
  begin
    Application.MessageBox('Código Exportador inválido', PChar(Msg_Title), mb_IconStop);

    C_Exportador.Color := clYellow;
    C_Exportador.SetFocus;

    exit;
  end;

   if UF_DESEMB.Text = '' then
  begin
    Application.MessageBox('UF Desembarque inválido', PChar(Msg_Title), mb_IconStop);

    UF_DESEMB.Color := clYellow;
    UF_DESEMB.SetFocus;

    exit;
  end;

  if LOC_DESEMB.Text = '' then
  begin
    Application.MessageBox('Local Desembarque inválido', PChar(Msg_Title), mb_IconStop);

    LOC_DESEMB.Color := clYellow;
    LOC_DESEMB.SetFocus;

    exit;
  end;

  if DT_DESEMB.Text = '  /  /    ' then
  begin
    Application.MessageBox('Data Desembarque inválida', PChar(Msg_Title), mb_IconStop);

    LOC_DESEMB.Color := clYellow;
    LOC_DESEMB.SetFocus;

    exit;
  end;}

  if not Altera then
  Begin
  Insert;
  Close;
  End
  Else
  Begin
  Edit;
  Close;
  End;

end;

procedure TFrmControle_Import.FormCreate(Sender: TObject);
begin
Altera := False;
Label1.Caption    := Desc_prod;
Produto_id.Value   := Id_prod;
Transacao_id.Value := Id_Trans;

  IQuery.Sql.Clear;
  IQuery.Sql.Add('SELECT * FROM TRANSITENS_EXPORT');
  IQuery.Sql.Add('WHERE');
  IQuery.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
  IQuery.Sql.Add('AND (PRODUTO_ID = :PRODUTO_ID)');

  IQuery.ParamByName('TRANSACAO_ID').AsInteger := Id_Trans;
  IQuery.ParamByName('PRODUTO_ID').AsInteger   := Id_prod;

  IQuery.Prepare;
  IQuery.Open;

  if not IQuery.IsEmpty then
  Begin
    N_di.Text         := IQuery.FieldByName('N_DI').AsString;
   // Dt_DI.Date        := IQuery.FieldByName('DT_DI').AsDateTime;
    C_Exportador.Text := IQuery.FieldByName('C_EXPORTADOR').AsString;
   //Uf_Desemb.Text    := IQuery.FieldByName('UF_DESEMB').AsString;
   //Loc_Desemb.Text   := IQuery.FieldByName('LOC_DESEMB').AsString;
   //Dt_Desemb.Date    := IQuery.FieldByName('DT_Desemb').AsDateTime;
    Altera := True;
  End;


//Dt_DI.Date      := Date;
//Dt_Desemb.Date  := Date;
end;

procedure TFrmControle_Import.Grid_ItensKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #46 then
    Key := #44;

  if Key = #13 then
    Keybd_Event(VK_TAB, 0, 0, 0);
end;

end.
