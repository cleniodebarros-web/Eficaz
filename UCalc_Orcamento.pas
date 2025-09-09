unit UCalc_Orcamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, IBCustomDataSet, Grids, DBGrids, IBQuery,
  IBUpdateSQL, ExtCtrls, rxToolEdit, Mask, rxCurrEdit, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, sMaskEdit, sCustomComboEdit,
  sCurrEdit;

type
  TFrmCalc_Orcamento = class(TForm)
    Panel1: TPanel;
    btnRetorna: TBitBtn;
    btnOk: TBitBtn;
    IQuery: TFDQuery;
    QTabela: TFDQuery;
    NUM_SERIE: TEdit;
    Transacao_id: TCurrencyEdit;
    Panel2: TPanel;
    Label2: TLabel;
    Produto_id: TCurrencyEdit;
    Label1: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Area2: TsCalcEdit;
    Area1: TsCalcEdit;
    BtnQuadrado: TBitBtn;
    btnlinear: TBitBtn;
    Vr_Calculo: TsCalcEdit;
    Label3: TLabel;
    procedure Grid_ItensKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnRetornaClick(Sender: TObject);
    procedure BtnQuadradoClick(Sender: TObject);
    procedure btnlinearClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Insert;
    procedure Edit;
  end;

var
  FrmCalc_Orcamento: TFrmCalc_Orcamento;
  Id_Trans, Id_Prod, Id_Soma,Tipo: Integer;
  Desc_Prod:String;
  Altera: Boolean;

  Function CalculaOrcamento(Transacao, Produto: Integer; Descricao: String):Real;

  procedure Edita_AddProd(Transacao, Produto: Integer; Descricao: String;tp:integer);

  procedure Edita_AddAnvisa(Transacao, Produto: Integer; Descricao: String;tp:integer);

implementation

uses
  UData, UPrincipal;

{$R *.dfm}

Function CalculaOrcamento(Transacao, Produto: Integer; Descricao: String):Real;
Begin
  Result := 0;
  Id_Trans  := Transacao;
  Id_Prod   := Produto;
  Desc_prod := Descricao;

  Application.CreateForm(TFrmCalc_Orcamento, FrmCalc_Orcamento);
  try
    FrmCalc_Orcamento.ShowModal;

    Result := FrmCalc_Orcamento.Vr_Calculo.Value;

  finally
    FrmCalc_Orcamento.Release;
  end;

End;

procedure Edita_AddProd(Transacao, Produto: Integer ; Descricao :String;tp:integer);
begin
  {
  Id_Trans  := Transacao;
  Id_Prod   := Produto;
  Desc_prod := Descricao;

  Application.CreateForm(TFrmInfo_Add_Prod, FrmInfo_Add_Prod);
  try
   FrmInfo_Add_Prod.Panel2.Height := 90;
   FrmInfo_Add_Prod.Panel3.Visible := False;

   if tp = 1 then
   FrmInfo_Add_Prod.Label4.Caption := 'Informe o código do item do pedido:'
   else
   FrmInfo_Add_Prod.Label4.Caption := 'Informações Adicionais';

    FrmInfo_Add_Prod.ShowModal;
  finally
    FrmInfo_Add_Prod.Release;
  end;
  }
end;

procedure Edita_AddAnvisa(Transacao, Produto: Integer ; Descricao :String;tp:integer);
begin
  {
  Id_Trans  := Transacao;
  Id_Prod   := Produto;
  Desc_prod := Descricao;
  Tipo      := tp ;

  Application.CreateForm(TFrmInfo_Add_Prod, FrmInfo_Add_Prod);
  try
   FrmInfo_Add_Prod.Caption := 'Informações adcionais Anvisa';

   FrmInfo_Add_Prod.Panel2.Height  := 40;
   FrmInfo_Add_Prod.Panel3.Visible := True;
   //FrmInfo_Add_Prod.LOTE.SetFocus;


    FrmInfo_Add_Prod.ShowModal;
  finally
    FrmInfo_Add_Prod.Release;
  end;
  }
end;

procedure TFrmCalc_Orcamento.Insert;
var
I: Integer;
Temp: TComponent;
Sql, Par: String;
begin
  {
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

  }

end;

procedure TFrmCalc_Orcamento.BtnQuadradoClick(Sender: TObject);
begin
Vr_Calculo.value := Area1.Value * Area2.Value;
end;

procedure TFrmCalc_Orcamento.btnRetornaClick(Sender: TObject);
begin
Close;
end;

procedure TFrmCalc_Orcamento.Edit;
var
I: Integer;
Temp: TComponent;
Sql: String;
begin
{
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
  }
end;



procedure TFrmCalc_Orcamento.btnlinearClick(Sender: TObject);
begin
Vr_Calculo.value := (Area1.Value + Area2.Value) * 2;
end;

procedure TFrmCalc_Orcamento.btnOkClick(Sender: TObject);
begin
 {
  if (AddProd.Text = '') and (tipo <> 3) then
  begin
    Application.MessageBox('Informações adicionais não preenchidas.', PChar(Msg_Title), mb_IconStop);

    AddProd.Color := clYellow;
    AddProd.SetFocus;

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
   }
 Close;
end;

procedure TFrmCalc_Orcamento.FormCreate(Sender: TObject);
begin
Altera := False;
Label1.Caption    := Desc_prod;
Produto_id.Value   := Id_prod;
Transacao_id.Value := Id_Trans;
  {
  IQuery.Sql.Clear;
  IQuery.Sql.Add('SELECT * FROM TRANSITENS_SERIE');
  IQuery.Sql.Add('WHERE');
  IQuery.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
  IQuery.Sql.Add('AND (PRODUTO_ID = :PRODUTO_ID)');

  IQuery.ParamByName('TRANSACAO_ID').AsInteger := Id_Trans;
  IQuery.ParamByName('PRODUTO_ID').AsInteger   := Id_prod;

  IQuery.Prepare;
  IQuery.Open;

  if not IQuery.IsEmpty then
  Begin
   // N_di.Text        := IQuery.FieldByName('N_DI').AsString;
   // Dt_DI.Date       := IQuery.FieldByName('DT_DI').AsDateTime;
    AddProd.Text       := IQuery.FieldByName('addprod').AsString;
   //Uf_Desemb.Text    := IQuery.FieldByName('UF_DESEMB').AsString;
   //Loc_Desemb.Text   := IQuery.FieldByName('LOC_DESEMB').AsString;
   //Dt_Desemb.Date    := IQuery.FieldByName('DT_Desemb').AsDateTime;
    Altera := True;
  End;


//Dt_DI.Date      := Date;
//Dt_Desemb.Date  := Date;
}
end;

procedure TFrmCalc_Orcamento.Grid_ItensKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #46 then
    Key := #44;

  if Key = #13 then
    Keybd_Event(VK_TAB, 0, 0, 0);
end;

end.
