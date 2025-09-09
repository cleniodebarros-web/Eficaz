unit UCorrige_Cod_Barras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, rxCurrEdit, rxToolEdit, Buttons, DBCtrls,
  DB, IBCustomDataSet, IBQuery, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrmCorrige_Cod_Barras = class(TForm)
    Bevel1: TBevel;
    DataProduto: TDataSource;
    DBText1: TDBText;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    Label1: TLabel;
    Prefixo: TEdit;
    Label2: TLabel;
    Sufixo: TEdit;
    QProduto: TFDQuery;
    QUpdate: TFDQuery;
    QRel: TFDQuery;
    procedure btnRetornaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExecutaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCorrige_Cod_Barras: TFrmCorrige_Cod_Barras;

implementation

uses
  UData, UPrincipal;

{$R *.dfm}

procedure TFrmCorrige_Cod_Barras.btnExecutaClick(Sender: TObject);
var
New_Codigo: String;
begin
  try
    QRel.Sql.Clear;
    QRel.Sql.Add('ALTER TABLE PRODUTOS DISABLE TRIGGER PRODUTOS_UP');

    QRel.ExecSql;




    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    QProduto.Sql.Clear;
    QProduto.Sql.Add('SELECT * FROM PRODUTOS');
    QProduto.Sql.Add('WHERE');
    QProduto.Sql.Add('(EMPRESA_ID = :EMPRESA_ID)');
    QProduto.Sql.Add('AND (STATUS = :STATUS)');

    QProduto.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    QProduto.ParamByName('STATUS').AsString      := 'A';

    QProduto.Prepare;
    QProduto.Open;

    QProduto.First;
    while not QProduto.Eof do
    begin
     try
      if QProduto.FieldByName('COD_BARRA').AsString = '' then
      begin
         New_Codigo := QProduto.FieldByName('PRODUTO_ID').AsString;

        if Prefixo.Text <> '' then
          New_Codigo := Prefixo.Text + New_Codigo;

        if Sufixo.Text <> '' then
          New_Codigo := New_Codigo + Sufixo.Text;

        QUpdate.Sql.Clear;
        QUpdate.Sql.Add('UPDATE PRODUTOS SET COD_BARRA = :COD_BARRA');
        QUpdate.Sql.Add('WHERE');
        QUpdate.Sql.Add('(PRODUTO_ID = :PRODUTO_ID)');

        QUpdate.ParamByName('COD_BARRA').AsString   := StrZero(Dig(New_Codigo), FrmPrincipal.Config.FieldByName('TAM_BARRAS').AsInteger, 0);
        QUpdate.ParamByName('PRODUTO_ID').AsInteger := QProduto.FieldByName('PRODUTO_ID').AsInteger;

        QUpdate.Prepare;
        QUpdate.ExecSql;


      end
      Else if (QProduto.FieldByName('COD_BARRA').AsString ='0000000000000') or  (Length(QProduto.FieldByName('COD_BARRA').AsString) < 13) then
       begin

          New_Codigo := QProduto.FieldByName('PRODUTO_ID').AsString;

          if Prefixo.Text <> '' then
            New_Codigo := Prefixo.Text + New_Codigo;

          if Sufixo.Text <> '' then
            New_Codigo := New_Codigo + Sufixo.Text;

          QUpdate.Sql.Clear;
          QUpdate.Sql.Add('UPDATE PRODUTOS SET COD_BARRA = :COD_BARRA');
          QUpdate.Sql.Add('WHERE');
          QUpdate.Sql.Add('(PRODUTO_ID = :PRODUTO_ID)');

          QUpdate.ParamByName('COD_BARRA').AsString   := StrZero(Dig(New_Codigo), FrmPrincipal.Config.FieldByName('TAM_BARRAS').AsInteger, 0);
          QUpdate.ParamByName('PRODUTO_ID').AsInteger := QProduto.FieldByName('PRODUTO_ID').AsInteger;

          QUpdate.Prepare;
          QUpdate.ExecSql;



       end
      else
      begin
        if (QProduto.FieldByName('COD_BARRA').AsInteger = QProduto.FieldByName('PRODUTO_ID').AsInteger) and (StrToInt(Dig(QProduto.FieldByName('PRODUTO_ID').AsString)) <> QProduto.FieldByName('COD_BARRA').AsInteger) then
        begin
           New_Codigo := QProduto.FieldByName('PRODUTO_ID').AsString;

          if Prefixo.Text <> '' then
            New_Codigo := Prefixo.Text + New_Codigo;

          if Sufixo.Text <> '' then
            New_Codigo := New_Codigo + Sufixo.Text;

          QUpdate.Sql.Clear;
          QUpdate.Sql.Add('UPDATE PRODUTOS SET COD_BARRA = :COD_BARRA');
          QUpdate.Sql.Add('WHERE');
          QUpdate.Sql.Add('(PRODUTO_ID = :PRODUTO_ID)');

          QUpdate.ParamByName('COD_BARRA').AsString   := StrZero(Dig(New_Codigo), FrmPrincipal.Config.FieldByName('TAM_BARRAS').AsInteger, 0);
          QUpdate.ParamByName('PRODUTO_ID').AsInteger := QProduto.FieldByName('PRODUTO_ID').AsInteger;

          QUpdate.Prepare;
          QUpdate.ExecSql;


        end;
      end;

     except

     end;

      Application.ProcessMessages;

      QProduto.Next;
    end;

    QProduto.Close;

    QRel.Sql.Clear;
    QRel.Sql.Add('ALTER TABLE PRODUTOS DISABLE TRIGGER PRODUTOS_UP');

    QRel.ExecSql;

    Application.MessageBox('Procedimento finalizado com sucesso', PChar(Msg_Title), mb_IconInformation);
  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;

procedure TFrmCorrige_Cod_Barras.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCorrige_Cod_Barras.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmCorrige_Cod_Barras.FormShow(Sender: TObject);
begin
  Prefixo.SetFocus;
end;

end.
