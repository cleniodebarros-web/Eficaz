unit UAtualiz_Tabelas_Apuracao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, DB, IBCustomDataSet, IBQuery,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmAtualiz_Tabelas_Apuracao = class(TForm)
    btnExecuta: TBitBtn;
    btnRetorna: TBitBtn;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Tabela: TComboBox;
    IQuery: TFDQuery;
    QRel: TFDQuery;
    procedure btnRetornaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TabelaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnExecutaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAtualiz_Tabelas_Apuracao: TFrmAtualiz_Tabelas_Apuracao;

implementation

uses
  UPrincipal, UData;

{$R *.dfm}

procedure TFrmAtualiz_Tabelas_Apuracao.btnExecutaClick(Sender: TObject);
var
F1: TextFile;
S,Data_Fim: String;
Colunas: TStringList;
J: Integer;

begin
  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    FrmPrincipal.OpenDialog1.Title      := 'Selecione o Arquivo';
    FrmPrincipal.OpenDialog1.DefaultExt := '*.Txt';
    FrmPrincipal.OpenDialog1.Filter     := 'Arquivos TXT (*.Txt)|*.Txt|Todos os Arquivos (*.*)|*.*';
    FrmPrincipal.OpenDialog1.InitialDir := ExtractFilePath(ParamStr(0));

    if FrmPrincipal.OpenDialog1.Execute then
    begin

      IQuery.SQL.Clear;
      IQuery.SQL.Add('DELETE FROM COD_CRED WHERE TABELA = :TABELA');
      IQuery.ParamByName('TABELA').AsString := Copy(Tabela.Text, 8, 6);
      IQuery.Prepare;
      IQuery.ExecSQL;





      AssignFile(F1, FrmPrincipal.OpenDialog1.FileName);
      Reset(F1);

      while not Eof(F1) do
      begin
        ReadLn(F1, S);

        try
          Colunas := TStringList.Create;

          Colunas.Text := StringReplace(S, '|', #13, [rfReplaceAll]);

           if (Tabela.Text = 'Tabela 4.3.10')  OR
             (Tabela.Text = 'Tabela 4.3.11')  OR
             (Tabela.Text = 'Tabela 4.3.12')  OR
             (Tabela.Text = 'Tabela 4.3.13')  OR
             (Tabela.Text = 'Tabela 4.3.14')  OR
             (Tabela.Text = 'Tabela 4.3.15')  OR
             (Tabela.Text = 'Tabela 4.3.16')  OR
             (Tabela.Text = 'Tabela 4.3.17') then
           Begin
             if Colunas.Strings[3] <> '' then
             Begin
             
             Data_Fim := Copy(Colunas.Strings[3],1,2) + '/' + Copy(Colunas.Strings[3],3,2) + '/' + Copy(Colunas.Strings[3],5,4);

               if   StrToDate(Data_fim) > Date then
               Begin

                  try
                    QRel.Sql.Clear;
                    QRel.Sql.Add('INSERT INTO COD_CRED(' +
                                 'TABELA,             CODIGO,   DESCRICAO, ' +
                                 'DT_INI,             DT_FIN,   NCM, ' +
                                 'NCM_EX,             EX_IPI,   ALIQUOTA_PIS, ' +
                                 'ALIQUOTA_COFINS,    UNIDADE,  ALIQUOTA_PI_R, ' +
                                 'ALIQUOTA_COFINS_R) VALUES(' +
                                 ':TABELA,            :CODIGO,  :DESCRICAO, ' +
                                 ':DT_INI,            :DT_FIN,  :NCM, ' +
                                 ':NCM_EX,            :EX_IPI,  :ALIQUOTA_PIS, ' +
                                 ':ALIQUOTA_COFINS,   :UNIDADE, :ALIQUOTA_PI_R, ' +
                                 ':ALIQUOTA_COFINS_R)');

                    QRel.ParamByName('TABELA').AsString           := Copy(Tabela.Text, 8, 6);
                    QRel.ParamByName('CODIGO').AsString           := Colunas.Strings[0];
                    QRel.ParamByName('DESCRICAO').AsString        := Colunas.Strings[1];
                    QRel.ParamByName('DT_INI').AsDateTime         := StrToDate(Copy(Colunas.Strings[2],1,2) + '/' + Copy(Colunas.Strings[2],3,2) + '/' + Copy(Colunas.Strings[2],5,4));
                    QRel.ParamByName('DT_FIN').AsDateTime         := StrToDate(Data_fim);
                    QRel.ParamByName('NCM').AsString              := '';
                    QRel.ParamByName('NCM_EX').AsString           := '';
                    QRel.ParamByName('EX_IPI').AsString           := '';
                    QRel.ParamByName('ALIQUOTA_PIS').AsFloat      := 0;
                    QRel.ParamByName('ALIQUOTA_COFINS').AsFloat   := 0;
                    QRel.ParamByName('UNIDADE').AsString          := '';
                    QRel.ParamByName('ALIQUOTA_PI_R').AsFloat     := 0;
                    QRel.ParamByName('ALIQUOTA_COFINS_R').AsFloat := 0;

                    QRel.Prepare;
                    QRel.ExecSql;


                  except

                  end;

               End;
             End
             else
             begin
             try
                QRel.Sql.Clear;
                QRel.Sql.Add('INSERT INTO COD_CRED(' +
                             'TABELA,             CODIGO,   DESCRICAO, ' +
                             'DT_INI,             DT_FIN,   NCM, ' +
                             'NCM_EX,             EX_IPI,   ALIQUOTA_PIS, ' +
                             'ALIQUOTA_COFINS,    UNIDADE,  ALIQUOTA_PI_R, ' +
                             'ALIQUOTA_COFINS_R) VALUES(' +
                             ':TABELA,            :CODIGO,  :DESCRICAO, ' +
                             ':DT_INI,            :DT_FIN,  :NCM, ' +
                             ':NCM_EX,            :EX_IPI,  :ALIQUOTA_PIS, ' +
                             ':ALIQUOTA_COFINS,   :UNIDADE, :ALIQUOTA_PI_R, ' +
                             ':ALIQUOTA_COFINS_R)');

                QRel.ParamByName('TABELA').AsString           := Copy(Tabela.Text, 8, 6);
                QRel.ParamByName('CODIGO').AsString           := Colunas.Strings[0];
                QRel.ParamByName('DESCRICAO').AsString        := Colunas.Strings[1];
                QRel.ParamByName('DT_INI').AsDateTime         := date;
                QRel.ParamByName('DT_FIN').AsDateTime         := date;
                QRel.ParamByName('NCM').AsString              := '';
                QRel.ParamByName('NCM_EX').AsString           := '';
                QRel.ParamByName('EX_IPI').AsString           := '';
                QRel.ParamByName('ALIQUOTA_PIS').AsFloat      := 0;
                QRel.ParamByName('ALIQUOTA_COFINS').AsFloat   := 0;
                QRel.ParamByName('UNIDADE').AsString          := '';
                QRel.ParamByName('ALIQUOTA_PI_R').AsFloat     := 0;
                QRel.ParamByName('ALIQUOTA_COFINS_R').AsFloat := 0;

                QRel.Prepare;
                QRel.ExecSql;


              except

              end;

             end;
           End
           else
           begin
              try
                QRel.Sql.Clear;
                QRel.Sql.Add('INSERT INTO COD_CRED(' +
                             'TABELA,             CODIGO,   DESCRICAO, ' +
                             'DT_INI,             DT_FIN,   NCM, ' +
                             'NCM_EX,             EX_IPI,   ALIQUOTA_PIS, ' +
                             'ALIQUOTA_COFINS,    UNIDADE,  ALIQUOTA_PI_R, ' +
                             'ALIQUOTA_COFINS_R) VALUES(' +
                             ':TABELA,            :CODIGO,  :DESCRICAO, ' +
                             ':DT_INI,            :DT_FIN,  :NCM, ' +
                             ':NCM_EX,            :EX_IPI,  :ALIQUOTA_PIS, ' +
                             ':ALIQUOTA_COFINS,   :UNIDADE, :ALIQUOTA_PI_R, ' +
                             ':ALIQUOTA_COFINS_R)');

                QRel.ParamByName('TABELA').AsString           := Copy(Tabela.Text, 8, 6);
                QRel.ParamByName('CODIGO').AsString           := Colunas.Strings[0];
                QRel.ParamByName('DESCRICAO').AsString        := Colunas.Strings[1];
                QRel.ParamByName('DT_INI').AsDateTime         := date;
                QRel.ParamByName('DT_FIN').AsDateTime         := date;
                QRel.ParamByName('NCM').AsString              := '';
                QRel.ParamByName('NCM_EX').AsString           := '';
                QRel.ParamByName('EX_IPI').AsString           := '';
                QRel.ParamByName('ALIQUOTA_PIS').AsFloat      := 0;
                QRel.ParamByName('ALIQUOTA_COFINS').AsFloat   := 0;
                QRel.ParamByName('UNIDADE').AsString          := '';
                QRel.ParamByName('ALIQUOTA_PI_R').AsFloat     := 0;
                QRel.ParamByName('ALIQUOTA_COFINS_R').AsFloat := 0;

                QRel.Prepare;
                QRel.ExecSql;


              except

              end;

           end;
        finally
          Colunas.Free;
        end;

        Application.ProcessMessages;
      end;
      CloseFile(f1);
    end;

    Application.MessageBox('Procedimento executado com sucesso', PChar(Msg_Title), mb_IconInformation);
  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;

procedure TFrmAtualiz_Tabelas_Apuracao.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmAtualiz_Tabelas_Apuracao.TabelaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmAtualiz_Tabelas_Apuracao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
