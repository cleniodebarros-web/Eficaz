unit UAtualiz_Banco_Criptografia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, DB, IBCustomDataSet, IBQuery,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids;

type
  TFrmAtualiz_Banco_Criptografia = class(TForm)
    btnExecuta: TBitBtn;
    btnRetorna: TBitBtn;
    Bevel1: TBevel;
    Label1: TLabel;
    QUpdate: TFDQuery;
    Itens: TDBGrid;
    Label2: TLabel;
    QProdutos: TFDQuery;
    DataProdutos: TDataSource;
    QCripto: TFDQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExecutaClick(Sender: TObject);
    procedure btnRetornaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAtualiz_Banco_Criptografia: TFrmAtualiz_Banco_Criptografia;

implementation

uses
  UData, UPrincipal;

{$R *.dfm}

procedure TFrmAtualiz_Banco_Criptografia.btnExecutaClick(Sender: TObject);
var
F1: TextFile;
S: String;
X: Integer;
begin
  try

    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    {
    for X := 1 to (Estrutura.Lines.Count - 1) do
    begin
      try
        QUpdate.Sql.Clear;
        QUpdate.Sql.Add(Estrutura.Lines.Strings[X]);

        QUpdate.Prepare;
        QUpdate.ExecSql;


      except

      end;

      Application.ProcessMessages;
    end;

    if FileExists(ExtractFilePath(ParamStr(0)) + 'TabelaCNAE.Txt') then
    begin
      AssignFile(F1, ExtractFilePath(ParamStr(0)) + 'TabelaCNAE.Txt');
      Reset(F1);

      while not Eof(F1) do
      begin
        ReadLn(F1, S);

        try
          QUpdate.Sql.Clear;
          QUpdate.Sql.Add(S);

          QUpdate.Prepare;
          QUpdate.ExecSql;


        except

        end;

        Label1.Caption := S;

        Application.ProcessMessages;
      end;

      Label1.Caption := '';

      CloseFile(F1);
    end;

    if FileExists(ExtractFilePath(ParamStr(0)) + 'TabelaCNIEE.Txt') then
    begin
      AssignFile(F1, ExtractFilePath(ParamStr(0)) + 'TabelaCNIEE.Txt');
      Reset(F1);

      while not Eof(F1) do
      begin
        ReadLn(F1, S);

        try
          QUpdate.Sql.Clear;
          QUpdate.Sql.Add('INSERT INTO CNIEE(' +
                          'CNI,            MARCA,            MODELO,         VERSAO,           TIPO, ' +
                          'DESC_MARCA,     DESC_MODELO,      VERSAO_SB,      QT_LACRE_SL,      QT_LACRE_FAB, ' +
                          'MFD,            LACRE_MFD,        ATO_APROVACAO,  ATO_REGISTRO_MG,  FORMATO_NUMERO) VALUES(' +
                          ':CNI,           :MARCA,           :MODELO,        :VERSAO,          :TIPO, ' +
                          ':DESC_MARCA,    :DESC_MODELO,     :VERSAO_SB,     :QT_LACRE_SL,     :QT_LACRE_FAB, ' +
                          ':MFD,           :LACRE_MFD,       :ATO_APROVACAO, :ATO_REGISTRO_MG, :FORMATO_NUMERO)');

          QUpdate.ParamByName('CNI').AsString             := Copy(S, 1, 2) + Copy(S, 3, 2) + Copy(S, 5, 2);
          QUpdate.ParamByName('MARCA').AsString           := Copy(S, 1, 2);
          QUpdate.ParamByName('MODELO').AsString          := Copy(S, 3, 2);
          QUpdate.ParamByName('VERSAO').AsString          := Copy(S, 5, 2);
          QUpdate.ParamByName('TIPO').AsString            := Alltrim(Copy(S, 7, 10));
          QUpdate.ParamByName('DESC_MARCA').AsString      := Alltrim(Copy(S, 17, 30));
          QUpdate.ParamByName('DESC_MODELO').AsString     := Alltrim(Copy(S, 47, 30));
          QUpdate.ParamByName('VERSAO_SB').AsString       := Alltrim(Copy(S, 77, 20));
          QUpdate.ParamByName('QT_LACRE_SL').AsInteger    := StrToInt(Copy(S, 97, 3));
          QUpdate.ParamByName('QT_LACRE_FAB').AsInteger   := StrToInt(Copy(S, 100, 3));
          QUpdate.ParamByName('MFD').AsString             := Copy(S, 103, 1);
          QUpdate.ParamByName('LACRE_MFD').AsString       := Copy(S, 104, 1);
          QUpdate.ParamByName('ATO_APROVACAO').AsString   := Alltrim(Copy(S, 105, 25));
          QUpdate.ParamByName('ATO_REGISTRO_MG').AsString := Alltrim(Copy(S, 130, 25));
          QUpdate.ParamByName('FORMATO_NUMERO').AsString  := Alltrim(Copy(S, 155, 20));

          QUpdate.Prepare;
          QUpdate.ExecSql;


        except

        end;

        Label1.Caption := Copy(S, 1, 2) + Copy(S, 3, 2) + Copy(S, 5, 2);

        Application.ProcessMessages;
      end;

      Label1.Caption := '';

      CloseFile(F1);
    end;

    if FileExists(ExtractFilePath(ParamStr(0)) + 'TabelaTIPI.Txt') then
    begin
      AssignFile(F1, ExtractFilePath(ParamStr(0)) + 'TabelaTIPI.Txt');
      Reset(F1);

      while not Eof(F1) do
      begin
        ReadLn(F1, S);

        try
          QUpdate.Sql.Clear;
          QUpdate.Sql.Add(S);

          QUpdate.Prepare;
          QUpdate.ExecSql;


        except

        end;

        Label1.Caption := S;

        Application.ProcessMessages;
      end;

      Label1.Caption := '';

      CloseFile(F1);
    end;
    }


    Qupdate.sql.Clear;
    QUpdate.sql.add('SELECT PRODUTO_ID,DESCRICAO,COD_BARRA,ALIQUOTA_ICMS, TRIBUTO_ID,PRECO_VAREJO FROM PRODUTOS WHERE COD_BARRA ILIKE ''A%'' AND ENCRYPT = 0 ');
    QUpdate.Prepare;
    QUpdate.Open();

    QUpdate.First;

    While not Qupdate.eof do
    Begin

       QCripto.Sql.Clear;
       QCripto.Sql.Add('UPDATE PRODUTOS SET COD_BARRA =:COD_BARRA, DESCRICAO = :DESCRICAO, ENCRYPT = 1 WHERE PRODUTO_ID = :PRODUTO_ID ');

       QCripto.ParamByName('COD_BARRA').AsString   := EncryptMsg(QUpdate.FieldByName('COD_BARRA').AsString,23);
       QCripto.ParamByName('DESCRICAO').AsString   := EncryptMsg(QUpdate.FieldByName('DESCRICAO').AsString,23);

       //QCripto.ParamByName('COD_BARRA').AsString   := DecryptMsg(QUpdate.FieldByName('COD_BARRA').AsString,23);
       //QCripto.ParamByName('DESCRICAO').AsString   := DecryptMsg(QUpdate.FieldByName('DESCRICAO').AsString,23);

       QCripto.ParamByName('PRODUTO_ID').AsInteger := QUpdate.FieldByName('PRODUTO_ID').AsInteger;

       QCripto.Prepare;
       QCripto.ExecSQL;

       Label1.Caption := QUpdate.FieldByName('DESCRICAO').AsString;

       QUpdate.next;

       Application.ProcessMessages;

    End;


  finally

    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;

  end;
end;

procedure TFrmAtualiz_Banco_Criptografia.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmAtualiz_Banco_Criptografia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
