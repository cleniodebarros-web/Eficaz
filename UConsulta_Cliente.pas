unit UConsulta_Cliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DB, IBCustomDataSet, IBQuery, DBCtrls,
  Mask, rxToolEdit, rxCurrEdit, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrmConsulta_Cliente = class(TForm)
    Label1: TLabel;
    Cliente: TCurrencyEdit;
    btnCliente: TSpeedButton;
    DBText1: TDBText;
    DataCliente: TDataSource;
    Cond_Pagto: TComboBox;
    Label16: TLabel;
    btnExecuta: TBitBtn;
    Bevel1: TBevel;
    QCliente: TFDQuery;
    FINALIZADORA_ID: TDBLookupComboBox;
    Label34: TLabel;
    QFinalizadora: TFDQuery;
    DataFinalizadora: TDataSource;
    procedure btnClienteClick(Sender: TObject);
    procedure ClienteChange(Sender: TObject);
    procedure Cond_PagtoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnExecutaClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Cond_PagtoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ClienteSearch;
  end;

var
  FrmConsulta_Cliente: TFrmConsulta_Cliente;

implementation

uses
  UData, UPrincipal, UConsulta;

{$R *.dfm}

procedure TFrmConsulta_Cliente.btnClienteClick(Sender: TObject);
begin
  try
    Cliente.Value := GetConsulta('CLIENTES', 0, 0, StrToInt(Cliente.Text));
  except
    Cliente.Value := GetConsulta('CLIENTES', 0, 0, 0);
  end;
end;

procedure TFrmConsulta_Cliente.btnExecutaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmConsulta_Cliente.ClienteChange(Sender: TObject);
begin
  if Cliente.Value > 0 then
    ClienteSearch;
end;

procedure TFrmConsulta_Cliente.ClienteSearch;
begin
  QCliente.Close;
  QCliente.ParamByName('CLIENTE_ID').AsInteger := StrToInt(Cliente.Text);
  QCliente.Prepare;
  QCliente.Open;
end;

procedure TFrmConsulta_Cliente.Cond_PagtoChange(Sender: TObject);
begin
    if (COND_PAGTO.Text = 'A VISTA') OR (COND_PAGTO.Text = 'CHEQUE') then
    begin

      QFinalizadora.Close;
      QFinalizadora.SQL.Clear;
      QFinalizadora.Sql.Add('SELECT * FROM FINALIZADORAS WHERE TIPO_TRANSACAO = 1');
      QFinalizadora.Prepare;
      QFinalizadora.Open;

      Finalizadora_id.KeyValue := 1;
      Finalizadora_id.Enabled  := True;

    end;

    if COND_PAGTO.Text = 'A PRAZO' then
    begin

      QFinalizadora.Close;
      QFinalizadora.SQL.Clear;
      QFinalizadora.Sql.Add('SELECT * FROM FINALIZADORAS WHERE TIPO_TRANSACAO = 2');
      QFinalizadora.Prepare;
      QFinalizadora.Open;

      Finalizadora_id.KeyValue := QFinalizadora.FieldByName('FINALIZADORA_ID').AsInteger;
      Finalizadora_id.Enabled  := True;

      //DetailSearch('');
    end;

    if Cond_pagto.Text = 'CARTAO' then
    Begin
      QFinalizadora.SQL.Clear;
      QFinalizadora.Sql.Add('SELECT * FROM FINALIZADORAS WHERE CLIENTE_ID > 0');
      QFinalizadora.Prepare;
      QFinalizadora.Open;


       Finalizadora_id.KeyValue := QFinalizadora.FieldByName('FINALIZADORA_ID').AsInteger;

       Finalizadora_id.Enabled := True;
    End;
end;

procedure TFrmConsulta_Cliente.Cond_PagtoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = Cliente) then
    btnClienteClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmConsulta_Cliente.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (Cond_Pagto.Text = 'A PRAZO') and (QCliente.IsEmpty) then
  begin
    Application.MessageBox('Para condição a prazo é necessário informar o cliente', PChar(Msg_Title), mb_IconStop);
    CanClose := False;
  end
  else
    CanClose := True;  
end;

procedure TFrmConsulta_Cliente.FormCreate(Sender: TObject);
begin
      QFinalizadora.Close;
      QFinalizadora.SQL.Clear;
      QFinalizadora.Sql.Add('SELECT * FROM FINALIZADORAS WHERE TIPO_TRANSACAO = 1');
      QFinalizadora.Prepare;
      QFinalizadora.Open;

      Finalizadora_id.KeyValue := 1;
      Finalizadora_id.Enabled  := True;

end;

end.
