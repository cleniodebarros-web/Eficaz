unit UAtualiza_Valores_Nulos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, rxToolEdit, DB, IBCustomDataSet,
  IBQuery, Math, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmAtualiza_Valores_Nulos = class(TForm)
    Label1: TLabel;
    Dtmen: TDateEdit;
    Dtmai: TDateEdit;
    Bevel1: TBevel;
    btnExecuta: TBitBtn;
    btnRetorna: TBitBtn;
    Label2: TLabel;
    Venda_Cupom: TCheckBox;
    Somente_Ecf: TCheckBox;
    QRel: TFDQuery;
    QUpdate: TFDQuery;
    IQuery: TFDQuery;
    QSub_Detail: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DtmenEnter(Sender: TObject);
    procedure btnRetornaClick(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure Venda_CupomClick(Sender: TObject);
    procedure Somente_EcfClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAtualiza_Valores_Nulos: TFrmAtualiza_Valores_Nulos;

implementation

uses
  UData, UPrincipal;

{$R *.dfm}

procedure TFrmAtualiza_Valores_Nulos.btnExecutaClick(Sender: TObject);
var
Per_Rateio, Soma_Rateio, Ult_Valor: Real;
Ult_Produto: Integer;
begin
  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    QRel.Sql.Clear;
    QRel.Sql.Add('ALTER TABLE PRODUTOS  DISABLE TRIGGER PRODUTOS_UP ');

    QRel.Prepare;
    QRel.ExecSql;




    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT * FROM TRANSACOES');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(DT_ENT_SAI BETWEEN :DT_INICIAL AND :DT_FINAL)');

    if Venda_Cupom.Checked then
    begin
      QRel.Sql.Add('AND (MODELO <> :MODELO)');

      QRel.ParamByName('MODELO').AsString := '2D';
    end;

    if Somente_Ecf.Checked then
    begin
      QRel.Sql.Add('AND (MODELO = :MODELO)');

      QRel.ParamByName('MODELO').AsString := '2D';
    end;

    QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;

    QRel.Prepare;
    QRel.Open;

    QRel.First;
    while not QRel.Eof do
    begin
      QUpdate.Sql.Clear;
      QUpdate.Sql.Add('UPDATE TRANSITENS SET BASE_CALC_ICMS = 0');
      QUpdate.Sql.Add('WHERE');
      QUpdate.Sql.Add('(BASE_CALC_ICMS IS NULL)');
      QUpdate.Sql.Add('AND (TRANSACAO_ID = :TRANSACAO_ID)');

      QUpdate.ParamByName('TRANSACAO_ID').AsInteger := QRel.FieldByName('TRANSACAO_ID').AsInteger;

      QUpdate.Prepare;
      QUpdate.ExecSql;



      QUpdate.Sql.Clear;
      QUpdate.Sql.Add('UPDATE TRANSITENS SET BASE_CALC_ST = 0');
      QUpdate.Sql.Add('WHERE');
      QUpdate.Sql.Add('(BASE_CALC_ST IS NULL)');
      QUpdate.Sql.Add('AND (TRANSACAO_ID = :TRANSACAO_ID)');

      QUpdate.ParamByName('TRANSACAO_ID').AsInteger := QRel.FieldByName('TRANSACAO_ID').AsInteger;

      QUpdate.Prepare;
      QUpdate.ExecSql;



      QUpdate.Sql.Clear;
      QUpdate.Sql.Add('UPDATE TRANSITENS SET VALOR_ISENTO = 0');
      QUpdate.Sql.Add('WHERE');
      QUpdate.Sql.Add('(VALOR_ISENTO IS NULL)');
      QUpdate.Sql.Add('AND (TRANSACAO_ID = :TRANSACAO_ID)');

      QUpdate.ParamByName('TRANSACAO_ID').AsInteger := QRel.FieldByName('TRANSACAO_ID').AsInteger;

      QUpdate.Prepare;
      QUpdate.ExecSql;



      QUpdate.Sql.Clear;
      QUpdate.Sql.Add('UPDATE TRANSITENS SET VALOR_OUTROS = 0');
      QUpdate.Sql.Add('WHERE');
      QUpdate.Sql.Add('(VALOR_OUTROS IS NULL)');
      QUpdate.Sql.Add('AND (TRANSACAO_ID = :TRANSACAO_ID)');

      QUpdate.ParamByName('TRANSACAO_ID').AsInteger := QRel.FieldByName('TRANSACAO_ID').AsInteger;

      QUpdate.Prepare;
      QUpdate.ExecSql;



      QUpdate.Sql.Clear;
      QUpdate.Sql.Add('UPDATE TRANSITENS SET VALOR_ICMS = 0');
      QUpdate.Sql.Add('WHERE');
      QUpdate.Sql.Add('(VALOR_ICMS IS NULL)');
      QUpdate.Sql.Add('AND (TRANSACAO_ID = :TRANSACAO_ID)');

      QUpdate.ParamByName('TRANSACAO_ID').AsInteger := QRel.FieldByName('TRANSACAO_ID').AsInteger;

      QUpdate.Prepare;
      QUpdate.ExecSql;



      QUpdate.Sql.Clear;
      QUpdate.Sql.Add('UPDATE TRANSITENS SET VALOR_ICMS_ST = 0');
      QUpdate.Sql.Add('WHERE');
      QUpdate.Sql.Add('(VALOR_ICMS_ST IS NULL)');
      QUpdate.Sql.Add('AND (TRANSACAO_ID = :TRANSACAO_ID)');

      QUpdate.ParamByName('TRANSACAO_ID').AsInteger := QRel.FieldByName('TRANSACAO_ID').AsInteger;

      QUpdate.Prepare;
      QUpdate.ExecSql;



      QUpdate.Sql.Clear;
      QUpdate.Sql.Add('UPDATE TRANSITENS SET VR_FRETE = 0');
      QUpdate.Sql.Add('WHERE');
      QUpdate.Sql.Add('(VR_FRETE IS NULL)');
      QUpdate.Sql.Add('AND (TRANSACAO_ID = :TRANSACAO_ID)');

      QUpdate.ParamByName('TRANSACAO_ID').AsInteger := QRel.FieldByName('TRANSACAO_ID').AsInteger;

      QUpdate.Prepare;
      QUpdate.ExecSql;



      QUpdate.Sql.Clear;
      QUpdate.Sql.Add('UPDATE TRANSITENS SET VR_ACRESCIMO = 0');
      QUpdate.Sql.Add('WHERE');
      QUpdate.Sql.Add('(VR_ACRESCIMO IS NULL)');
      QUpdate.Sql.Add('AND (TRANSACAO_ID = :TRANSACAO_ID)');

      QUpdate.ParamByName('TRANSACAO_ID').AsInteger := QRel.FieldByName('TRANSACAO_ID').AsInteger;

      QUpdate.Prepare;
      QUpdate.ExecSql;



      QUpdate.Sql.Clear;
      QUpdate.Sql.Add('UPDATE TRANSITENS SET VR_IPI = 0');
      QUpdate.Sql.Add('WHERE');
      QUpdate.Sql.Add('(VR_IPI IS NULL)');
      QUpdate.Sql.Add('AND (TRANSACAO_ID = :TRANSACAO_ID)');

      QUpdate.ParamByName('TRANSACAO_ID').AsInteger := QRel.FieldByName('TRANSACAO_ID').AsInteger;

      QUpdate.Prepare;
      QUpdate.ExecSql;



      QUpdate.Sql.Clear;
      QUpdate.Sql.Add('UPDATE TRANSITENS SET DESC_RODAPE = 0');
      QUpdate.Sql.Add('WHERE');
      QUpdate.Sql.Add('(DESC_RODAPE IS NULL)');
      QUpdate.Sql.Add('AND (TRANSACAO_ID = :TRANSACAO_ID)');

      QUpdate.ParamByName('TRANSACAO_ID').AsInteger := QRel.FieldByName('TRANSACAO_ID').AsInteger;

      QUpdate.Prepare;
      QUpdate.ExecSql;



      if (QRel.FieldByName('VR_DESCONTO').AsFloat > 0) or (QRel.FieldByName('VR_FRETE').AsFloat > 0) or (QRel.FieldByName('VR_ACRESCIMO').AsFloat > 0) then
      begin
        IQuery.Sql.Clear;
        IQuery.Sql.Add('SELECT SUM((VR_UNITARIO * QUANTIDADE)) VR_TOTAL');
        IQuery.Sql.Add('FROM TRANSITENS');
        IQuery.Sql.Add('WHERE');
        IQuery.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

        IQuery.ParamByName('TRANSACAO_ID').AsInteger := QRel.FieldByName('TRANSACAO_ID').AsInteger;

        IQuery.Prepare;
        IQuery.Open;

        QSub_Detail.Sql.Clear;
        QSub_Detail.Sql.Add('SELECT * FROM TRANSITENS');
        QSub_Detail.Sql.Add('WHERE');
        QSub_Detail.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

        QSub_Detail.ParamByName('TRANSACAO_ID').AsInteger := QRel.FieldByName('TRANSACAO_ID').AsInteger;

        QSub_Detail.Prepare;
        QSub_Detail.Open;
      end;

      Soma_Rateio := 0;

      if QRel.FieldByName('VR_DESCONTO').AsFloat > 0 then
      begin
        Per_Rateio := RoundTo(((QRel.FieldByName('VR_DESCONTO').AsFloat * 100) / IQuery.FieldByName('VR_TOTAL').AsFloat), -4);

        QSub_Detail.First;
        while not QSub_Detail.Eof do
        begin
          QUpdate.Sql.Clear;
          QUpdate.Sql.Add('UPDATE TRANSITENS SET DESC_RODAPE = :DESC_RODAPE');
          QUpdate.Sql.Add('WHERE');
          QUpdate.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
          QUpdate.Sql.Add('AND (PRODUTO_ID = :PRODUTO_ID)');

          QUpdate.ParamByName('DESC_RODAPE').AsFloat    := RoundTo((((QSub_Detail.FieldByName('VR_UNITARIO').AsFloat * QSub_Detail.FieldByName('QUANTIDADE').AsFloat) * Per_Rateio) / 100), -2);
          QUpdate.ParamByName('TRANSACAO_ID').AsInteger := QRel.FieldByName('TRANSACAO_ID').AsInteger;
          QUpdate.ParamByName('PRODUTO_ID').AsInteger   := QSub_Detail.FieldByName('PRODUTO_ID').AsInteger;

          QUpdate.Prepare;
          QUpdate.ExecSql;



          Soma_Rateio := Soma_Rateio + RoundTo((((QSub_Detail.FieldByName('VR_UNITARIO').AsFloat * QSub_Detail.FieldByName('QUANTIDADE').AsFloat) * Per_Rateio) / 100), -2);
          Ult_Valor   := RoundTo((((QSub_Detail.FieldByName('VR_UNITARIO').AsFloat * QSub_Detail.FieldByName('QUANTIDADE').AsFloat) * Per_Rateio) / 100), -2);
          Ult_Produto := QSub_Detail.FieldByName('PRODUTO_ID').AsInteger;

          Application.ProcessMessages;
          QSub_Detail.Next;
        end;
      end
      else
      begin
        QUpdate.Sql.Clear;
        QUpdate.Sql.Add('UPDATE TRANSITENS SET DESC_RODAPE = 0');
        QUpdate.Sql.Add('WHERE');
        QUpdate.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

        QUpdate.ParamByName('TRANSACAO_ID').AsInteger := QRel.FieldByName('TRANSACAO_ID').AsInteger;

        QUpdate.Prepare;
        QUpdate.ExecSql;


      end;

      if (Soma_Rateio > 0) and (QRel.FieldByName('VR_DESCONTO').AsFloat <> Soma_Rateio) then
      begin
        QUpdate.Sql.Clear;
        QUpdate.Sql.Add('UPDATE TRANSITENS SET DESC_RODAPE = :DESC_RODAPE');
        QUpdate.Sql.Add('WHERE');
        QUpdate.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
        QUpdate.Sql.Add('AND (PRODUTO_ID = :PRODUTO_ID)');

        QUpdate.ParamByName('DESC_RODAPE').AsFloat    := (QRel.FieldByName('VR_DESCONTO').AsFloat - (Soma_Rateio - Ult_Valor));
        QUpdate.ParamByName('TRANSACAO_ID').AsInteger := QRel.FieldByName('TRANSACAO_ID').AsInteger;
        QUpdate.ParamByName('PRODUTO_ID').AsInteger   := Ult_Produto;

        QUpdate.Prepare;
        QUpdate.ExecSql;


      end;

      Soma_Rateio := 0;

      if QRel.FieldByName('VR_FRETE').AsFloat > 0 then
      begin
        Per_Rateio := RoundTo(((QRel.FieldByName('VR_FRETE').AsFloat * 100) / IQuery.FieldByName('VR_TOTAL').AsFloat), -4);

        QSub_Detail.First;
        while not QSub_Detail.Eof do
        begin
          QUpdate.Sql.Clear;
          QUpdate.Sql.Add('UPDATE TRANSITENS SET VR_FRETE = :VR_FRETE');
          QUpdate.Sql.Add('WHERE');
          QUpdate.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
          QUpdate.Sql.Add('AND (PRODUTO_ID = :PRODUTO_ID)');

          QUpdate.ParamByName('VR_FRETE').AsFloat       := RoundTo((((QSub_Detail.FieldByName('VR_UNITARIO').AsFloat * QSub_Detail.FieldByName('QUANTIDADE').AsFloat) * Per_Rateio) / 100), -2);
          QUpdate.ParamByName('TRANSACAO_ID').AsInteger := QRel.FieldByName('TRANSACAO_ID').AsInteger;
          QUpdate.ParamByName('PRODUTO_ID').AsInteger   := QSub_Detail.FieldByName('PRODUTO_ID').AsInteger;

          QUpdate.Prepare;
          QUpdate.ExecSql;



          Soma_Rateio := Soma_Rateio + RoundTo((((QSub_Detail.FieldByName('VR_UNITARIO').AsFloat * QSub_Detail.FieldByName('QUANTIDADE').AsFloat) * Per_Rateio) / 100), -2);
          Ult_Valor   := RoundTo((((QSub_Detail.FieldByName('VR_UNITARIO').AsFloat * QSub_Detail.FieldByName('QUANTIDADE').AsFloat) * Per_Rateio) / 100), -2);

          Ult_Produto := QSub_Detail.FieldByName('PRODUTO_ID').AsInteger;

          Application.ProcessMessages;
          QSub_Detail.Next;
        end;
      end
      else
      begin
        QUpdate.Sql.Clear;
        QUpdate.Sql.Add('UPDATE TRANSITENS SET VR_FRETE = 0');
        QUpdate.Sql.Add('WHERE');
        QUpdate.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

        QUpdate.ParamByName('TRANSACAO_ID').AsInteger := QRel.FieldByName('TRANSACAO_ID').AsInteger;

        QUpdate.Prepare;
        QUpdate.ExecSql;


      end;

      if (Soma_Rateio > 0) and (QRel.FieldByName('VR_FRETE').AsFloat <> Soma_Rateio) then
      begin
        QUpdate.Sql.Clear;
        QUpdate.Sql.Add('UPDATE TRANSITENS SET VR_FRETE = :VR_FRETE');
        QUpdate.Sql.Add('WHERE');
        QUpdate.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
        QUpdate.Sql.Add('AND (PRODUTO_ID = :PRODUTO_ID)');

        QUpdate.ParamByName('VR_FRETE').AsFloat       := (QRel.FieldByName('VR_FRETE').AsFloat - (Soma_Rateio - Ult_Valor));
        QUpdate.ParamByName('TRANSACAO_ID').AsInteger := QRel.FieldByName('TRANSACAO_ID').AsInteger;
        QUpdate.ParamByName('PRODUTO_ID').AsInteger   := Ult_Produto;

        QUpdate.Prepare;
        QUpdate.ExecSql;


      end;

      Soma_Rateio := 0;

      if QRel.FieldByName('VR_ACRESCIMO').AsFloat > 0 then
      begin
        Per_Rateio := RoundTo(((QRel.FieldByName('VR_ACRESCIMO').AsFloat * 100) / IQuery.FieldByName('VR_TOTAL').AsFloat), -4);

        QSub_Detail.First;
        while not QSub_Detail.Eof do
        begin
          QUpdate.Sql.Clear;
          QUpdate.Sql.Add('UPDATE TRANSITENS SET VR_ACRESCIMO = :VR_ACRESCIMO');
          QUpdate.Sql.Add('WHERE');
          QUpdate.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
          QUpdate.Sql.Add('AND (PRODUTO_ID = :PRODUTO_ID)');

          QUpdate.ParamByName('VR_ACRESCIMO').AsFloat   := RoundTo((((QSub_Detail.FieldByName('VR_UNITARIO').AsFloat * QSub_Detail.FieldByName('QUANTIDADE').AsFloat) * Per_Rateio) / 100), -2);
          QUpdate.ParamByName('TRANSACAO_ID').AsInteger := QRel.FieldByName('TRANSACAO_ID').AsInteger;
          QUpdate.ParamByName('PRODUTO_ID').AsInteger   := QSub_Detail.FieldByName('PRODUTO_ID').AsInteger;

          QUpdate.Prepare;
          QUpdate.ExecSql;



          Soma_Rateio := Soma_Rateio + RoundTo((((QSub_Detail.FieldByName('VR_UNITARIO').AsFloat * QSub_Detail.FieldByName('QUANTIDADE').AsFloat) * Per_Rateio) / 100), -2);
          Ult_Valor   := RoundTo((((QSub_Detail.FieldByName('VR_UNITARIO').AsFloat * QSub_Detail.FieldByName('QUANTIDADE').AsFloat) * Per_Rateio) / 100), -2);

          Ult_Produto := QSub_Detail.FieldByName('PRODUTO_ID').AsInteger;

          Application.ProcessMessages;
          QSub_Detail.Next;
        end;
      end
      else
      begin
        QUpdate.Sql.Clear;
        QUpdate.Sql.Add('UPDATE TRANSITENS SET VR_ACRESCIMO = 0');
        QUpdate.Sql.Add('WHERE');
        QUpdate.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

        QUpdate.ParamByName('TRANSACAO_ID').AsInteger := QRel.FieldByName('TRANSACAO_ID').AsInteger;

        QUpdate.Prepare;
        QUpdate.ExecSql;


      end;

      if (Soma_Rateio > 0) and (QRel.FieldByName('VR_ACRESCIMO').AsFloat <> Soma_Rateio) then
      begin
        QUpdate.Sql.Clear;
        QUpdate.Sql.Add('UPDATE TRANSITENS SET VR_ACRESCIMO = :VR_ACRESCIMO');
        QUpdate.Sql.Add('WHERE');
        QUpdate.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
        QUpdate.Sql.Add('AND (PRODUTO_ID = :PRODUTO_ID)');

        QUpdate.ParamByName('VR_ACRESCIMO').AsFloat   := (QRel.FieldByName('VR_ACRESCIMO').AsFloat - (Soma_Rateio - Ult_Valor));
        QUpdate.ParamByName('TRANSACAO_ID').AsInteger := QRel.FieldByName('TRANSACAO_ID').AsInteger;
        QUpdate.ParamByName('PRODUTO_ID').AsInteger   := Ult_Produto;

        QUpdate.Prepare;
        QUpdate.ExecSql;


      end;

      Label2.Caption := QRel.FieldByName('TRANSACAO_ID').AsString;

      Application.ProcessMessages;
      QRel.Next;
    end;

    Application.MessageBox('Procedimento executado com sucesso', PChar(Msg_Title), mb_IconInformation)
  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
    QRel.Sql.Clear;
    QRel.Sql.Add('ALTER TABLE PRODUTOS ENABLE TRIGGER PRODUTOS_UP');

    QRel.Prepare;
    QRel.ExecSql;


end;

procedure TFrmAtualiza_Valores_Nulos.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmAtualiza_Valores_Nulos.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmAtualiza_Valores_Nulos.DtmenKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    //Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmAtualiza_Valores_Nulos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmAtualiza_Valores_Nulos.FormCreate(Sender: TObject);
begin
  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);
end;

procedure TFrmAtualiza_Valores_Nulos.Somente_EcfClick(Sender: TObject);
begin
  if Somente_Ecf.Checked then
    Venda_Cupom.Checked := False;
end;

procedure TFrmAtualiza_Valores_Nulos.Venda_CupomClick(Sender: TObject);
begin
  if Venda_Cupom.Checked then
    Somente_Ecf.Checked := False;
end;

end.
