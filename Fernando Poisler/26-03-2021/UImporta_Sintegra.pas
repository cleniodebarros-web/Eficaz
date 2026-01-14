unit UImporta_Sintegra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, DB, IBCustomDataSet, IBQuery,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmImporta_Sintegra = class(TForm)
    Bevel1: TBevel;
    Label1: TLabel;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    QRel: TFDQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRetornaClick(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmImporta_Sintegra: TFrmImporta_Sintegra;

implementation

uses
  UData, UPrincipal;

{$R *.dfm}

procedure TFrmImporta_Sintegra.btnExecutaClick(Sender: TObject);
var
F1: TextFile;
S: String;
Linha: Integer;
begin
  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    Linha := 0;

    FrmPrincipal.OpenDialog1.Title      := 'Selecione o Arquivo';
    FrmPrincipal.OpenDialog1.DefaultExt := '*.TXT';
    FrmPrincipal.OpenDialog1.Filter     := 'Arquivos TXT (*.TXT)|*.TXT|Todos os Arquivos (*.*)|*.*';
    FrmPrincipal.OpenDialog1.InitialDir := ExtractFilePath(ParamStr(0));

    if FrmPrincipal.OpenDialog1.Execute then
    begin
      AssignFile(F1, FrmPrincipal.OpenDialog1.FileName);
      Reset(F1);

      try
        while not Eof(F1) do
        begin
          ReadLn(F1, S);

          if Copy(S, 1, 3) = '60M' then
          begin
            QRel.Sql.Clear;
            QRel.Sql.Add('INSERT INTO  REGISTRO_60M(' +
                         'DT_EMISSAO,  NUM_SERIE,    NUM_ORDEM, ' +
                         'MODELO_DOC,  COO_INICIAL,  COO_FINAL, ' +
                         'CRZ,         CRO,          VENDA_BRUTA, ' +
                         'GRANDE_TOTAL) VALUES(' +
                         ':DT_EMISSAO, :NUM_SERIE,   :NUM_ORDEM, ' +
                         ':MODELO_DOC, :COO_INICIAL, :COO_FINAL, ' +
                         ':CRZ,        :CRO,         :VENDA_BRUTA, ' +
                         ':GRANDE_TOTAL)');

            QRel.ParamByName('DT_EMISSAO').AsDateTime := StrToDate(Copy(S, 10, 2) + '/' + Copy(S, 8, 2) + '/' + Copy(S, 4, 4));
            QRel.ParamByName('NUM_SERIE').AsString    := Copy(S, 12, 20);
            QRel.ParamByName('NUM_ORDEM').AsString    := Copy(S, 32, 3);
            QRel.ParamByName('MODELO_DOC').AsString   := Copy(S, 35, 2);
            QRel.ParamByName('COO_INICIAL').AsString  := Copy(S, 37, 6);
            QRel.ParamByName('COO_FINAL').AsString    := Copy(S, 43, 6);
            QRel.ParamByName('CRZ').AsString          := Copy(S, 49, 6);
            QRel.ParamByName('CRO').AsString          := Copy(S, 55, 3);
            QRel.ParamByName('VENDA_BRUTA').AsFloat   := (StrToFloat(Copy(S, 58, 16)) / 100);
            QRel.ParamByName('GRANDE_TOTAL').AsFloat  := (StrToFloat(Copy(S, 74, 16)) / 100);

            QRel.Prepare;
            QRel.ExecSql;


          end
          else if Copy(S, 1, 3) = '60A' then
          begin
            QRel.Sql.Clear;
            QRel.Sql.Add('INSERT INTO REGISTRO_60A(DT_EMISSAO,   NUM_SERIE,  SIT_TRIBUTARIA,  VALOR_TOTALIZADOR) VALUES(' +
                                                   ':DT_EMISSAO, :NUM_SERIE, :SIT_TRIBUTARIA, :VALOR_TOTALIZADOR)');

            QRel.ParamByName('DT_EMISSAO').AsDateTime     := StrToDate(Copy(S, 10, 2) + '/' + Copy(S, 8, 2) + '/' + Copy(S, 4, 4));
            QRel.ParamByName('NUM_SERIE').AsString        := Copy(S, 12, 20);
            QRel.ParamByName('SIT_TRIBUTARIA').AsString   := Copy(S, 32, 4);
            QRel.ParamByName('VALOR_TOTALIZADOR').AsFloat := (StrToFloat(Copy(S, 36, 12)) / 100);

            QRel.Prepare;
            QRel.ExecSql;


          end
          else if Copy(S, 1, 3) = '60D' then
          begin
            QRel.Sql.Clear;
            QRel.Sql.Add('INSERT INTO REGISTRO_60D(' +
                         'DT_EMISSAO,      NUM_SERIE,    COD_PRODUTO, ' +
                         'QUANTIDADE,      VR_UNITARIO,  BASE_CALC_ICMS, ' +
                         'SIT_TRIBUTARIA,  VALOR_ICMS) VALUES(' +
                         ':DT_EMISSAO,     :NUM_SERIE,   :COD_PRODUTO, ' +
                         ':QUANTIDADE,     :VR_UNITARIO, :BASE_CALC_ICMS, ' +
                         ':SIT_TRIBUTARIA, :VALOR_ICMS)');

            QRel.ParamByName('DT_EMISSAO').AsDateTime   := StrToDate(Copy(S, 10, 2) + '/' + Copy(S, 8, 2) + '/' + Copy(S, 4, 4));
            QRel.ParamByName('NUM_SERIE').AsString      := Copy(S, 12, 20);
            QRel.ParamByName('COD_PRODUTO').AsString    := Alltrim(Copy(S, 32, 14));
            QRel.ParamByName('QUANTIDADE').AsFloat      := (StrToFloat(Copy(S, 46, 13)) / 1000);
            QRel.ParamByName('VR_UNITARIO').AsFloat     := (StrToFloat(Copy(S, 59, 16)) / 100);
            QRel.ParamByName('BASE_CALC_ICMS').AsFloat  := (StrToFloat(Copy(S, 75, 16)) / 100);
            QRel.ParamByName('SIT_TRIBUTARIA').AsString := Copy(S, 91, 4);
            QRel.ParamByName('VALOR_ICMS').AsFloat      := (StrToFloat(Copy(S, 95, 13)) / 100);

            QRel.Prepare;
            QRel.ExecSql;


          end
          else if Copy(S, 1, 3) = '60I' then
          begin
            QRel.Sql.Clear;
            QRel.Sql.Add('INSERT INTO REGISTRO_60I(' +
                         'DT_EMISSAO,      NUM_SERIE,    MODELO_DOC, ' +
                         'NUM_ORDEM,       NUM_ITEM,     COD_PRODUTO, ' +
                         'QUANTIDADE,      VR_UNITARIO,  BASE_CALC_ICMS, ' +
                         'SIT_TRIBUTARIA,  VALOR_ICMS) VALUES(' +
                         ':DT_EMISSAO,     :NUM_SERIE,   :MODELO_DOC, ' +
                         ':NUM_ORDEM,      :NUM_ITEM,    :COD_PRODUTO, ' +
                         ':QUANTIDADE,     :VR_UNITARIO, :BASE_CALC_ICMS, ' +
                         ':SIT_TRIBUTARIA, :VALOR_ICMS)');

            QRel.ParamByName('DT_EMISSAO').AsDateTime   := StrToDate(Copy(S, 10, 2) + '/' + Copy(S, 8, 2) + '/' + Copy(S, 4, 4));
            QRel.ParamByName('NUM_SERIE').AsString      := Copy(S, 12, 20);
            QRel.ParamByName('MODELO_DOC').AsString     := Copy(S, 32, 2);
            QRel.ParamByName('NUM_ORDEM').AsString      := Copy(S, 34, 6);
            QRel.ParamByName('NUM_ITEM').AsString       := Copy(S, 40, 3);
            QRel.ParamByName('COD_PRODUTO').AsString    := Alltrim(Copy(S, 43, 14));
            QRel.ParamByName('QUANTIDADE').AsFloat      := (StrToFloat(Copy(S, 57, 13)) / 1000);
            QRel.ParamByName('VR_UNITARIO').AsFloat     := (StrToFloat(Copy(S, 70, 13)) / 100);
            QRel.ParamByName('BASE_CALC_ICMS').AsFloat  := (StrToFloat(Copy(S, 83, 12)) / 100);
            QRel.ParamByName('SIT_TRIBUTARIA').AsString := Copy(S, 95, 4);
            QRel.ParamByName('VALOR_ICMS').AsFloat      := (StrToFloat(Copy(S, 99, 12)) / 100);

            QRel.Prepare;
            QRel.ExecSql;


          end
          else if Copy(S, 1, 3) = '60R' then
          begin
            QRel.Sql.Clear;
            QRel.Sql.Add('INSERT INTO REGISTRO_60R(' +
                         'MES_ANO,      COD_PRODUTO,     QUANTIDADE, ' +
                         'VR_UNITARIO,  BASE_CALC_ICMS,  SIT_TRIBUTARIA) VALUES(' +
                         ':MES_ANO,     :COD_PRODUTO,    :QUANTIDADE, ' +
                         ':VR_UNITARIO, :BASE_CALC_ICMS, :SIT_TRIBUTARIA)');

            QRel.ParamByName('MES_ANO').AsString        := Copy(S, 4, 2) + '/' + Copy(S, 6, 4);
            QRel.ParamByName('COD_PRODUTO').AsString    := Alltrim(Copy(S, 10, 14));
            QRel.ParamByName('QUANTIDADE').AsFloat      := (StrToFloat(Copy(S, 24, 13)) / 1000);
            QRel.ParamByName('VR_UNITARIO').AsFloat     := (StrToFloat(Copy(S, 37, 16)) / 100);
            QRel.ParamByName('BASE_CALC_ICMS').AsFloat  := (StrToFloat(Copy(S, 53, 16)) / 100);
            QRel.ParamByName('SIT_TRIBUTARIA').AsString := Copy(S, 69, 4);

            QRel.Prepare;
            QRel.ExecSql;


          end
          else if Copy(S, 1, 2) = '75' then
          begin
            QRel.Sql.Clear;
            QRel.Sql.Add('SELECT * FROM REGISTRO_75');
            QRel.Sql.Add('WHERE');
            QRel.Sql.Add('(DT_INICIAL = :DT_INICIAL)');
            QRel.Sql.Add('AND (DT_FINAL = :DT_FINAL)');
            QRel.Sql.Add('AND (COD_PRODUTO = :COD_PRODUTO)');

            QRel.ParamByName('DT_INICIAL').AsDateTime := StrToDate(Copy(S, 9, 2) + '/' + Copy(S, 7, 2) + '/' + Copy(S, 3, 4));
            QRel.ParamByName('DT_FINAl').AsDateTime   := StrToDate(Copy(S, 17, 2) + '/' + Copy(S, 15, 2) + '/' + Copy(S, 11, 4));
            QRel.ParamByName('COD_PRODUTO').AsString  := Copy(S, 19, 14);

            QRel.Prepare;
            QRel.Open;

            if QRel.IsEmpty then
            begin
              QRel.Sql.Clear;
              QRel.Sql.Add('INSERT INTO REGISTRO_75(' +
                           'DT_INICIAL,    DT_FINAL,       COD_PRODUTO, ' +
                           'NCM,           DESCRICAO,      UNIDADE, ' +
                           'ALIQUOTA_IPI,  ALIQUOTA_ICMS,  REDUCAO_BASE_ICMS, ' +
                           'BASE_CALC_ST) VALUES(' +
                           ':DT_INICIAL,   :DT_FINAL,      :COD_PRODUTO, ' +
                           ':NCM,          :DESCRICAO,     :UNIDADE, ' +
                           ':ALIQUOTA_IPI, :ALIQUOTA_ICMS, :REDUCAO_BASE_ICMS, ' +
                           ':BASE_CALC_ST)');

              QRel.ParamByName('DT_INICIAL').AsDateTime     := StrToDate(Copy(S, 9, 2) + '/' + Copy(S, 7, 2) + '/' + Copy(S, 3, 4));
              QRel.ParamByName('DT_FINAL').AsDateTime       := StrToDate(Copy(S, 17, 2) + '/' + Copy(S, 15, 2) + '/' + Copy(S, 11, 4));
              QRel.ParamByName('COD_PRODUTO').AsString      := Alltrim(Copy(S, 19, 14));
              QRel.ParamByName('NCM').AsString              := Copy(S, 33, 8);
              QRel.ParamByName('DESCRICAO').AsString        := Copy(S, 41, 53);
              QRel.ParamByName('UNIDADE').AsString          := Copy(S, 94, 6);
              QRel.ParamByName('ALIQUOTA_IPI').AsFloat      := (StrToFloat(Copy(S, 100, 5)) / 1000);
              QRel.ParamByName('ALIQUOTA_ICMS').AsFloat     := (StrToFloat(Copy(S, 105, 4)) / 100);
              QRel.ParamByName('REDUCAO_BASE_ICMS').AsFloat := (StrToFloat(Copy(S, 109, 5)) / 100);
              QRel.ParamByName('BASE_CALC_ST').AsFloat      := (StrToFloat(Copy(S, 114, 13)) / 100);

              QRel.Prepare;
              QRel.ExecSql;


            end;
          end;

          Inc(Linha);

          Label1.Caption := 'Importa Linha: ' + IntToStr(Linha);

          Application.ProcessMessages;
        end;

        Application.MessageBox('Procedimento executado com sucesso', PChar(Msg_Title), mb_IconInformation);
      finally
        CloseFile(F1);
      end;
    end;
  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;

procedure TFrmImporta_Sintegra.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmImporta_Sintegra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
