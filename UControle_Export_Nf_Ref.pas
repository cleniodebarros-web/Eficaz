unit UControle_Export_Nf_Ref;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, IBCustomDataSet, Grids, DBGrids, IBQuery,
  IBUpdateSQL, ExtCtrls, rxToolEdit, Mask, rxCurrEdit, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmControle_Export_Nf_Ref = class(TForm)
    Panel1: TPanel;
    btnRetorna: TBitBtn;
    btnOk: TBitBtn;
    IQuery: TFDQuery;
    QTabela: TFDQuery;
    Grid_Notas: TDBGrid;
    QNotas: TFDQuery;
    DataNotas: TDataSource;
    Label1: TLabel;
    procedure Grid_ItensKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure QNotasAfterOpen(DataSet: TDataSet);
    procedure QNotasBeforeEdit(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure QNotasNewRecord(DataSet: TDataSet);
    procedure Grid_NotasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Insert;
    procedure Edit;
  end;

var
  FrmControle_Export_Nf_Ref: TFrmControle_Export_Nf_Ref;
  Id_Trans, Id_Prod, Id_Soma: Integer;
  Desc_Prod:String;
  Altera: Boolean;

  procedure Edita_Exporta_Nf_Ref(Transacao:Integer);

implementation

uses
  UData, UPrincipal;

{$R *.dfm}

procedure Edita_Exporta_NF_Ref(Transacao:Integer);
begin
  Id_Trans  := Transacao;
  //Id_Prod   := Produto;
  //Desc_prod := Descricao;

  Application.CreateForm(TFrmControle_Export_Nf_Ref, FrmControle_Export_Nf_Ref);
  try
    FrmControle_Export_Nf_Ref.ShowModal;
  finally
    FrmControle_Export_Nf_Ref.Release;
  end;
end;

procedure TFrmControle_Export_Nf_Ref.Insert;
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

procedure TFrmControle_Export_Nf_Ref.QNotasAfterOpen(DataSet: TDataSet);
begin
TFloatField(QNotas.FieldByName('BASE_ICMS_NORMAL')).DisplayFormat  := '#,##0.00';
TFloatField(QNotas.FieldByName('VR_ICMS_NORMAL')).DisplayFormat    := '#,##0.00';
TFloatField(QNotas.FieldByName('BASE_ICMS_ST')).DisplayFormat      := '#,##0.00';
TFloatField(QNotas.FieldByName('VR_ICMS_ST')).DisplayFormat        := '#,##0.00';
TFloatField(QNotas.FieldByName('VALOR_PRODUTOS')).DisplayFormat    := '#,##0.00';
TFloatField(QNotas.FieldByName('VALOR')).DisplayFormat             := '#,##0.00';
TFloatField(QNotas.FieldByName('DT_EMISSAO')).EditMask             :='!99/99/0000;1;_';
end;

procedure TFrmControle_Export_Nf_Ref.QNotasBeforeEdit(DataSet: TDataSet);
begin
 if FrmData.QAcesso.FieldByName('ALTERACAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para alteração', PChar(Msg_Title), mb_IconStop);
    exit;
  end;
end;

procedure TFrmControle_Export_Nf_Ref.QNotasNewRecord(DataSet: TDataSet);
begin
DataSet['TRANSACAO_ID']     := id_trans;
DataSet['BASE_ICMS_NORMAL'] := 0;
DataSet['VR_ICMS_NORMAL']   := 0;
DataSet['BASE_ICMS_ST']     := 0;
DataSet['VR_ICMS_ST']       := 0;
DataSet['VALOR_PRODUTOS']   := 0;
DataSet['VALOR']            := 0;
DataSet['ROMANEIO']         := '';
DataSet['PEDIDO']           := '';
DataSet['CHAVE_NFE']        := '';

end;

procedure TFrmControle_Export_Nf_Ref.Edit;
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



procedure TFrmControle_Export_Nf_Ref.btnOkClick(Sender: TObject);
begin
 { if N_DI.Text = '' then
  begin
    Application.MessageBox('Código DI inválido', PChar(Msg_Title), mb_IconStop);

    N_DI.Color := clYellow;
    N_DI.SetFocus;

    exit;
  end;

  if C_Exportador.Text = '' then
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
  end;

  if not Altera then
  Begin
  Insert;
  Close;
  End
  Else
  Begin
  Edit;
  Close;
  End; }

  Close;

end;

procedure TFrmControle_Export_Nf_Ref.FormCreate(Sender: TObject);
begin
{Altera := False;
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
//Dt_Desemb.Date  := Date;  }
end;

procedure TFrmControle_Export_Nf_Ref.FormShow(Sender: TObject);
begin

  QNotas.Close;

  QNotas.ParamByName('TRANSACAO_ID').AsInteger := Id_Trans;

  QNotas.Prepare;
  QNotas.Open;
end;

procedure TFrmControle_Export_Nf_Ref.Grid_ItensKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #46 then
    Key := #44;

  if Key = #13 then
    Keybd_Event(VK_TAB, 0, 0, 0);
end;

procedure TFrmControle_Export_Nf_Ref.Grid_NotasKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
InputString: String;
begin
  if (Key = Vk_F4) and (QNotas.State = dsBrowse) and (not QNotas.IsEmpty) then
    QNotas.Delete;

  if (Key = Vk_F7) and (QNotas.State = dsBrowse) and (not QNotas.IsEmpty) then
  begin
    InputString := InputBox('Localizar', 'Num. de Nota:', '');

    if InputString <> '' then
      QNotas.Locate('NUM_SERIE', InputString, [loCaseInsensitive]);
  end;

  if Key = VK_F9 then
    Perform(Wm_NextDlgCtl, 0, 0);

  if ((Key = Vk_Up) or (Key = Vk_Down)) and (QNotas.State in [dsInsert, dsEdit]) then
    Key := 0;

end;

end.
