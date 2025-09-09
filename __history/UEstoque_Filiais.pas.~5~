unit UEstoque_Filiais;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, IBCustomDataSet, Grids, DBGrids, IBQuery,
  IBUpdateSQL, ExtCtrls, rxToolEdit, Mask, rxCurrEdit, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,pcnConversaoNFe,pcnConversao;

type
  TFrmEstoque_Filiais = class(TForm)
    Panel1: TPanel;
    btnRetorna: TBitBtn;
    Produto_id: TCurrencyEdit;
    Transacao_id: TCurrencyEdit;
    btnOk: TBitBtn;
    IQuery: TFDQuery;
    QTabela: TFDQuery;
    NUM_SERIE: TEdit;
    Panel2: TPanel;
    Label2: TLabel;
    Panel4: TPanel;
    QSearch: TFDQuery;
    QFuncionario: TFDQuery;
    Qlocalizacao_Estoque: TFDQuery;
    Data_LocalizacaoEstoque: TDataSource;
    Grid_Localizacao_Estoque: TDBGrid;
    Panel3: TPanel;
    Label1: TLabel;
    procedure Grid_ItensKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Insert;
    procedure Edit;
  end;

var
  FrmEstoque_Filiais: TFrmEstoque_Filiais;
  Id_Trans, Id_Prod, Id_Soma,tp_manifesto,tp_gravacao,produto_id_matriz: Integer;
  Desc_Prod,chave,descricao_matriz:String;
  Altera: Boolean;

  procedure Estoque_Filiais(produto_matriz: Integer;descricao :string);

implementation

uses
  UData, UPrincipal;

{$R *.dfm}

procedure Estoque_Filiais(produto_matriz: Integer;descricao:String);
begin
  produto_id_matriz     := produto_matriz;
  descricao_matriz      := descricao;

  Application.CreateForm(TFrmEstoque_Filiais, FrmEstoque_Filiais);
  try

   {
   if tp_manifesto = 0 then
   Begin
   FrmManifesto_destinatario.ComboBox1.enabled    := true;
   FrmManifesto_destinatario.LblStatus.Font.Color := clred;
   FrmManifesto_destinatario.LblStatus.Caption    := 'Nota Fiscal sem Manifesto de Recebimento';
   FrmManifesto_destinatario.btnOk.enabled        := True;
   End
   else if tp_manifesto = 1 then
   Begin
   FrmManifesto_destinatario.ComboBox1.enabled    := False;
   FrmManifesto_destinatario.LblStatus.Font.Color := clGreen;
   FrmManifesto_destinatario.LblStatus.Caption    := 'Ciência de operação';
   FrmManifesto_destinatario.btnOk.enabled        := False;
   End
   else if tp_manifesto = 2 then
   Begin
   FrmManifesto_destinatario.ComboBox1.enabled    := True;
   FrmManifesto_destinatario.LblStatus.Font.Color := clBlue;
   FrmManifesto_destinatario.LblStatus.Caption    := 'Confirmação de operação';
   FrmManifesto_destinatario.btnOk.enabled        := True;
   End
   else if  tp_manifesto = 3 then
   Begin
   FrmManifesto_destinatario.ComboBox1.enabled    := False;
   FrmManifesto_destinatario.LblStatus.Font.Color := clred;
   FrmManifesto_destinatario.LblStatus.Caption    := 'Desconhecimento de operação';
   FrmManifesto_destinatario.btnOk.enabled        := False;
   End
   else if tp_manifesto = 4 then
   Begin
   FrmManifesto_destinatario.ComboBox1.enabled    := False;
   FrmManifesto_destinatario.LblStatus.Font.Color := clred;
   FrmManifesto_destinatario.LblStatus.Caption    := 'Operação não realizada';
   FrmManifesto_destinatario.btnOk.enabled        := False;
   End;
  }
    FrmEstoque_Filiais.ShowModal;
  finally
    FrmEstoque_Filiais.Release;
  end;
end;

procedure TFrmEstoque_Filiais.Insert;
var
I: Integer;
Temp: TComponent;
Sql, Par: String;
begin
  Sql := 'INSERT INTO TRANSITENS_SERIE(';
  Par := '';

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
    begin
      if Sql = 'INSERT INTO TRANSITENS_SERIE(' then
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
      if Sql = 'INSERT INTO TRANSITENS_SERIE(' then
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
      if Sql = 'INSERT INTO TRANSITENS_SERIE(' then
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
      if Sql = 'INSERT INTO TRANSITENS_SERIE(' then
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

procedure TFrmEstoque_Filiais.Edit;
var
I: Integer;
Temp: TComponent;
Sql: String;
begin
  Sql := 'UPDATE TRANSITENS_SERIE SET ';

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
    begin
      if Sql = 'UPDATE TRANSITENS_SERIE SET ' then
        Sql := Sql + TEdit(Temp).Name + ' = :' + TEdit(Temp).Name
      else
        Sql := Sql + ', ' + TEdit(Temp).Name + ' = :' + TEdit(Temp).Name;
    end;

    if Temp is TComboBox then
    begin
      if Sql = 'UPDATE TRANSITENS_SERIE SET ' then
        Sql := Sql + TComboBox(Temp).Name + ' = :' + TComboBox(Temp).Name
      else
        Sql := Sql + ', ' + TComboBox(Temp).Name + ' = :' + TComboBox(Temp).Name;
    end;

    if Temp is TCurrencyEdit then
    begin
      if Sql = 'UPDATE TRANSITENS_SERIE SET ' then
        Sql := Sql + TCurrencyEdit(Temp).Name + ' = :' + TCurrencyEdit(Temp).Name
      else
        Sql := Sql + ', ' + TCurrencyEdit(Temp).Name + ' = :' + TCurrencyEdit(Temp).Name;
    end;

    if Temp is TDateEdit then
    begin
      if Sql = 'UPDATE TRANSITENS_SERIE SET ' then
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



procedure TFrmEstoque_Filiais.FormShow(Sender: TObject);
begin

 if FrmData.DBF_Nuvem.Connected then
    FrmData.DBF_Nuvem.Connected := False;

  FrmData.DBF_Nuvem.Params.Clear;
  FrmData.DBF_Nuvem.Params.Add('Database= ' +  FrmPrincipal.Config.FieldByName('BANCO_NUVEM').AsString);
  FrmData.DBF_Nuvem.Params.Add('User_Name= ' + DecryptMsg(FrmPrincipal.Config.FieldByName('USUARIO_NUVEM').AsString,3));
  FrmData.DBF_Nuvem.Params.Add('Password= ' + DecryptMsg(FrmPrincipal.Config.FieldByName('SENHA_NUVEM').AsString,3));
  FrmData.DBF_Nuvem.Params.Add('Server= ' +  FrmPrincipal.Config.FieldByName('IP_NUVEM').AsString);
  FrmData.DBF_Nuvem.Params.Add('Port= ' +  FrmPrincipal.Config.FieldByName('PORTA_NUVEM').AsString);
  FrmData.DBF_Nuvem.Params.Add('MonitorBy=Remote');
  FrmData.DBF_Nuvem.Params.Add('DriverID=PG');
  FrmData.DBF_Nuvem.Params.Add('Poled=True');

  FrmData.DBF_Nuvem.Connected := True;

  QLocalizacao_Estoque.Connection :=  FrmData.DBF_Nuvem;

  QLocalizacao_Estoque.Close;

  QLocalizacao_Estoque.ParamByName('PRODUTO_ID_MATRIZ').AsInteger := Produto_id_matriz;

  QLocalizacao_Estoque.Prepare;

  QLocalizacao_Estoque.Open;

  Label1.Caption := Descricao_Matriz;

end;

procedure TFrmEstoque_Filiais.Grid_ItensKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #46 then
    Key := #44;

  if Key = #13 then
    Keybd_Event(VK_TAB, 0, 0, 0);
end;

end.
