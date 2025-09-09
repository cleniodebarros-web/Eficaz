unit UMapa_Mensal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, rxCurrEdit, rxToolEdit, Buttons, DBCtrls,
  DB, IBCustomDataSet, IBQuery, QuickRpt, QRCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmMapa_Mensal = class(TForm)
    Label1: TLabel;
    Bevel1: TBevel;
    Mapa: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    QRDBText3: TQRDBText;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    Cabec: TQRLabel;
    QRSysData2: TQRSysData;
    DetailBand1: TQRBand;
    QRLabel5: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel15: TQRLabel;
    Mes: TCurrencyEdit;
    Ano: TCurrencyEdit;
    QRLabel2: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText19: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    QRel: TFDQuery;
    procedure btnRetornaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure MesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMapa_Mensal: TFrmMapa_Mensal;

implementation

uses
  UData, UConsulta, UPrincipal;

{$R *.dfm}

procedure TFrmMapa_Mensal.btnExecutaClick(Sender: TObject);
var
Dtmen, Dtmai: TDate;
begin
  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    Dtmen := StrToDate('01/' + StrZero(Mes.Text, 2, 0) + '/' + StrZero(Ano.Text, 4, 0));
    Dtmai := Ult_Dia_Mes(Dtmen);

    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT PRODUTOS.PRODUTO_ID, PRODUTOS.COD_BARRA, PRODUTOS.DESCRICAO,');

    QRel.Sql.Add('(SELECT SUM(TRANSITENS.QUANTIDADE)');
    QRel.Sql.Add('FROM TRANSITENS');
    QRel.Sql.Add('INNER JOIN TRANSACOES');
    QRel.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(TRANSITENS.PRODUTO_ID = PRODUTOS.PRODUTO_ID)');
    QRel.Sql.Add('AND ((TRANSACOES.CONDUTA = :CD_ENTR1) OR (TRANSACOES.CONDUTA = :CD_ENTR2) OR (TRANSACOES.CONDUTA = :CD_ENTR3))');
    QRel.Sql.Add('AND ((TRANSACOES.DEPTO = :DP_ENTR1) OR (TRANSACOES.DEPTO = :DP_ENTR2))');
    QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
    QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
    QRel.Sql.Add('AND (TRANSACOES.DT_TRANS < :DT_INICIAL)) ENTRADA_ANT,');

    QRel.Sql.Add('(SELECT SUM(TRANSITENS.QUANTIDADE)');
    QRel.Sql.Add('FROM TRANSITENS');
    QRel.Sql.Add('INNER JOIN TRANSACOES');
    QRel.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(TRANSITENS.PRODUTO_ID = PRODUTOS.PRODUTO_ID)');
    QRel.Sql.Add('AND ((TRANSACOES.CONDUTA = :CD_SAIDA1) OR (TRANSACOES.CONDUTA = :CD_SAIDA2) OR (TRANSACOES.CONDUTA = :CD_SAIDA3))');
    QRel.Sql.Add('AND ((TRANSACOES.DEPTO = :DP_SAIDA1) OR (TRANSACOES.DEPTO = :DP_SAIDA2))');
    QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
    QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
    QRel.Sql.Add('AND (TRANSACOES.DT_TRANS < :DT_INICIAL)) SAIDA_ANT,');

    QRel.Sql.Add('(SELECT SUM(TRANSITENS.QUANTIDADE)');
    QRel.Sql.Add('FROM TRANSITENS');
    QRel.Sql.Add('INNER JOIN TRANSACOES');
    QRel.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(TRANSITENS.PRODUTO_ID = PRODUTOS.VINCULO)');
    QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :CD_TRANSF)');
    QRel.Sql.Add('AND (TRANSACOES.DEPTO = :DP_TRANSF)');
    QRel.Sql.Add('AND (TRANSACOES.EMPRESAAUX_ID = PRODUTOS.EMPRESA_ID)');
    QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
    QRel.Sql.Add('AND (TRANSACOES.DT_TRANS < :DT_INICIAL)) E_TRANSF_ANT,');

    QRel.Sql.Add('(SELECT SUM(TRANSITENS.QUANTIDADE)');
    QRel.Sql.Add('FROM TRANSITENS');
    QRel.Sql.Add('INNER JOIN TRANSACOES');
    QRel.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(TRANSITENS.PRODUTO_ID = PRODUTOS.PRODUTO_ID)');
    QRel.Sql.Add('AND ((TRANSACOES.CONDUTA = :CD_ENTR1) OR (TRANSACOES.CONDUTA = :CD_ENTR2) OR (TRANSACOES.CONDUTA = :CD_ENTR3))');
    QRel.Sql.Add('AND ((TRANSACOES.DEPTO = :DP_ENTR1) OR (TRANSACOES.DEPTO = :DP_ENTR2))');
    QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
    QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
    QRel.Sql.Add('AND (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)) ENTRADA_ATUAL,');

    QRel.Sql.Add('(SELECT SUM(TRANSITENS.QUANTIDADE)');
    QRel.Sql.Add('FROM TRANSITENS');
    QRel.Sql.Add('INNER JOIN TRANSACOES');
    QRel.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(TRANSITENS.PRODUTO_ID = PRODUTOS.PRODUTO_ID)');
    QRel.Sql.Add('AND ((TRANSACOES.CONDUTA = :CD_SAIDA1) OR (TRANSACOES.CONDUTA = :CD_SAIDA2) OR (TRANSACOES.CONDUTA = :CD_SAIDA3))');
    QRel.Sql.Add('AND ((TRANSACOES.DEPTO = :DP_SAIDA1) OR (TRANSACOES.DEPTO = :DP_SAIDA2))');
    QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
    QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
    QRel.Sql.Add('AND (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)) SAIDA_ATUAL,');

    QRel.Sql.Add('(SELECT SUM(TRANSITENS.QUANTIDADE)');
    QRel.Sql.Add('FROM TRANSITENS');
    QRel.Sql.Add('INNER JOIN TRANSACOES');
    QRel.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(TRANSITENS.PRODUTO_ID = PRODUTOS.VINCULO)');
    QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :CD_TRANSF)');
    QRel.Sql.Add('AND (TRANSACOES.DEPTO = :DP_TRANSF)');
    QRel.Sql.Add('AND (TRANSACOES.EMPRESAAUX_ID = PRODUTOS.EMPRESA_ID)');
    QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
    QRel.Sql.Add('AND (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)) E_TRANSF_ATUAL');

    QRel.Sql.Add('FROM PRODUTOS');
    QRel.Sql.Add('INNER JOIN TRANSITENS');
    QRel.Sql.Add('ON ((PRODUTOS.PRODUTO_ID = TRANSITENS.PRODUTO_ID) OR (PRODUTOS.VINCULO = TRANSITENS.PRODUTO_ID))');
    QRel.Sql.Add('INNER JOIN TRANSACOES');
    QRel.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(PRODUTOS.EMPRESA_ID = :EMPRESA_ID)');

    if StrToInt(LeIni(Arq_Ini, 'Sistema', 'Localização')) > 0 then
    begin
      QRel.Sql.Add('AND (PRODUTOS.LOCALIZACAO_ID = :LOCALIZACAO_ID)');

      QRel.ParamByName('LOCALIZACAO_ID').AsInteger := StrToInt(LeIni(Arq_Ini, 'Sistema', 'Localização'));
    end;

    QRel.Sql.Add('GROUP BY PRODUTOS.PRODUTO_ID, PRODUTOS.COD_BARRA, PRODUTOS.DESCRICAO, PRODUTOS.VINCULO, PRODUTOS.EMPRESA_ID');

    QRel.ParamByName('CD_ENTR1').AsString     := '02';
    QRel.ParamByName('CD_ENTR2').AsString     := '18';
    QRel.ParamByName('CD_ENTR3').AsString     := '19';

    QRel.ParamByName('DP_ENTR1').AsString     := '07';
    QRel.ParamByName('DP_ENTR2').AsString     := '10';

    QRel.ParamByName('CD_SAIDA1').AsString    := '01';
    QRel.ParamByName('CD_SAIDA2').AsString    := '17';
    QRel.ParamByName('CD_SAIDA3').AsString    := '20';

    QRel.ParamByName('DP_SAIDA1').AsString    := '07';
    QRel.ParamByName('DP_SAIDA2').AsString    := '10';

    QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen;
    QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai;

    QRel.ParamByName('CD_TRANSF').AsString    := '20';
    QRel.ParamByName('DP_TRANSF').AsString    := '07';

    QRel.Prepare;
    QRel.Open;

    QRLabel1.Caption := 'Mês/Ano: ' + StrZero(Mes.Text, 2, 0) + '/' + StrZero(Ano.Text, 4, 0);

    if QRel.IsEmpty then
      Application.MessageBox('Não há dados para os parâmetros informados', PChar(Msg_Title), mb_IconInformation)
    else
      Mapa.PreviewModal;
  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;

procedure TFrmMapa_Mensal.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmMapa_Mensal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmMapa_Mensal.FormCreate(Sender: TObject);
begin
  Mes.Text := Copy(DateToStr(date), 4, 2);
  Ano.Text := Copy(DateToStr(date), 7, 4);
end;

procedure TFrmMapa_Mensal.MesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

end.
