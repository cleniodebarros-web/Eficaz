unit URel_mapa_controle_movim_mensal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, IBCustomDataSet, IBQuery, Buttons, ExtCtrls, Mask,
  rxToolEdit, QuickRpt, QRCtrls, RDprint, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmRel_mapa_controle_movim_mensal = class(TForm)
    Label2: TLabel;
    Bevel1: TBevel;
    btnExecuta: TBitBtn;
    btnRetorna: TBitBtn;
    Mes: TComboBox;
    Ano: TComboBox;
    Label1: TLabel;
    RDprint1: TRDprint;
    CheckBox1: TCheckBox;
    Numero: TEdit;
    Label3: TLabel;
    QRel: TFDQuery;
    QRel_Saida: TFDQuery;
    QRel_Total: TFDQuery;
    procedure btnExecutaClick(Sender: TObject);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRetornaClick(Sender: TObject);
    procedure MesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DtmenEnter(Sender: TObject);
    procedure RDprint1BeforeNewPage(Sender: TObject; Pagina: Integer);
    procedure RDprint1NewPage(Sender: TObject; Pagina: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_mapa_controle_movim_mensal: TFrmRel_mapa_controle_movim_mensal;
  Linha,Pagina: Integer ;

implementation

uses
  UData, UPrincipal;

{$R *.dfm}

procedure TFrmRel_mapa_controle_movim_mensal.btnExecutaClick(Sender: TObject);
var
P02_ANT,P02_COM,P02_VDA,P05_ANT,P05_COM,P05_VDA,P08_ANT,P08_COM,P08_VDA : INTEGER;
P13_ANT,P13_COM,P13_VDA,P20_ANT,P20_COM,P20_VDA,P45_ANT,P45_COM,P45_VDA,ID : INTEGER;

begin
// 125, 327

 P02_ANT := 0;
 P02_COM := 0;
 P02_VDA := 0;

 P05_ANT := 0;
 P05_COM := 0;
 P05_VDA := 0;

 P08_ANT := 0;
 P08_COM := 0;
 P08_VDA := 0;

 P13_ANT := 0;
 P13_COM := 0;
 P13_VDA := 0;

 P20_ANT := 0;
 P20_COM := 0;
 P20_VDA := 0;

 P45_ANT := 0;
 P45_COM := 0;
 P45_VDA := 0;
 ID      := 0;


  QRel.Sql.Clear;
  QRel.Sql.Add('SELECT TRANSACOES.TRANSACAO_ID, PRODUTOS.MARCA ,NUM_DOC, DT_ENT_SAI, TRANSITENS.QUANTIDADE SALDO');
  QRel.Sql.Add('FROM TRANSACOES');
  QRel.Sql.Add('INNER JOIN TRANSITENS ON TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID');
  QRel.Sql.Add('INNER JOIN PRODUTOS ON PRODUTOS.PRODUTO_ID = TRANSITENS.PRODUTO_ID');
  QRel.Sql.Add('WHERE DT_ENT_SAI BETWEEN :DT_INI AND :DT_FIM');
  QRel.Sql.Add('AND ((CONDUTA= :COND_CPR AND  DEPTO = :DEPTO) OR (CONDUTA = :COND_VDA AND DEPTO= :DEPTO_DEV))');
  QRel.Sql.Add('AND ((PRODUTOS.MARCA = :P02) OR (PRODUTOS.MARCA = :P05) OR (PRODUTOS.MARCA = :P08) OR (PRODUTOS.MARCA = :P13)');
  QRel.Sql.Add('OR (PRODUTOS.MARCA = :P20) OR (PRODUTOS.MARCA = :P45))');
  QRel.Sql.Add('ORDER BY TRANSACOES.TRANSACAO_ID,MARCA,DT_ENT_SAI');

  if Mes.Text = 'Janeiro'  then
  Begin
  QRel.ParamByName('DT_INI').AsDateTime   := StrToDate('01/01/' + Copy(Ano.Text,3,2) + ' ');
  QRel.ParamByName('DT_FIM').AsDateTime   := StrToDate('31/01/' + Copy(Ano.Text,3,2) + ' ');
  End;
  if Mes.Text = 'Fevereiro'  then
  Begin
  QRel.ParamByName('DT_INI').AsDateTime   := StrToDate('01/02/' + Copy(Ano.Text,3,2) + ' ');
  QRel.ParamByName('DT_FIM').AsDateTime   := StrToDate('28/02/' + Copy(Ano.Text,3,2) + ' ');
  End;
  if Mes.Text = 'Março'  then
  Begin
  QRel.ParamByName('DT_INI').AsDateTime   := StrToDate('01/03/' + Copy(Ano.Text,3,2) + ' ');
  QRel.ParamByName('DT_FIM').AsDateTime   := StrToDate('31/03/' + Copy(Ano.Text,3,2) + ' ');
  End;
   if Mes.Text = 'Abril' then
  Begin
  QRel.ParamByName('DT_INI').AsDateTime  :=  StrToDate('01/04/' + Copy(Ano.Text,3,2) + ' ');
  QRel.ParamByName('DT_FIM').AsDateTime  :=  StrToDate('30/04/' + Copy(Ano.Text,3,2) + ' ');
  End;
  if Mes.Text = 'Maio' then
  Begin
  QRel.ParamByName('DT_INI').AsDateTime  :=  StrToDate('01/05/' + Copy(Ano.Text,3,2) + ' ');
  QRel.ParamByName('DT_FIM').AsDateTime  :=  StrToDate('31/05/' + Copy(Ano.Text,3,2) + ' ');
  End;
  if Mes.Text = 'Junho' then
  Begin
  QRel.ParamByName('DT_INI').AsDateTime  :=  StrToDate('01/06/' + Copy(Ano.Text,3,2) + ' ');
  QRel.ParamByName('DT_FIM').AsDateTime  :=  StrToDate('30/06/' + Copy(Ano.Text,3,2) + ' ');
  End;
  if Mes.Text = 'Julho' then
  Begin
  QRel.ParamByName('DT_INI').AsDateTime  :=  StrToDate('01/07/' + Copy(Ano.Text,3,2) + ' ');
  QRel.ParamByName('DT_FIM').AsDateTime  :=  StrToDate('31/07/' + Copy(Ano.Text,3,2) + ' ');
  End;
  if Mes.Text = 'Agosto' then
  Begin
  QRel.ParamByName('DT_INI').AsDateTime  :=  StrToDate('01/08/' + Copy(Ano.Text,3,2) + ' ');
  QRel.ParamByName('DT_FIM').AsDateTime  :=  StrToDate('31/08/' + Copy(Ano.Text,3,2) + ' ');
  End;
  if Mes.Text = 'Setembro' then
  Begin
  QRel.ParamByName('DT_INI').AsDateTime  :=  StrToDate('01/09/' + Copy(Ano.Text,3,2) + ' ');
  QRel.ParamByName('DT_FIM').AsDateTime  :=  StrToDate('30/09/' + Copy(Ano.Text,3,2) + ' ');
  End;
  if Mes.Text = 'Outubro' then
  Begin
  QRel.ParamByName('DT_INI').AsDateTime  :=  StrToDate('01/10/' + Copy(Ano.Text,3,2) + ' ');
  QRel.ParamByName('DT_FIM').AsDateTime  :=  StrToDate('31/10/' + Copy(Ano.Text,3,2) + ' ');
  End;
  if Mes.Text = 'Novembro' then
  Begin
  QRel.ParamByName('DT_INI').AsDateTime  :=  StrToDate('01/11/' + Copy(Ano.Text,3,2) + ' ');
  QRel.ParamByName('DT_FIM').AsDateTime  :=  StrToDate('30/11/' + Copy(Ano.Text,3,2) + ' ');
  End;
  if Mes.Text = 'Dezembro' then
  Begin
  QRel.ParamByName('DT_INI').AsDateTime  :=  StrToDate('01/12/' + Copy(Ano.Text,3,2) + ' ');
  QRel.ParamByName('DT_FIM').AsDateTime  :=  StrToDate('31/12/' + Copy(Ano.Text,3,2) + ' ');
  End;



  QRel.ParamByName('COND_CPR').AsString   := '02';
  QRel.ParamByName('DEPTO').AsString      := '07';
  QRel.ParamByName('COND_VDA').AsString   := '01';
  QRel.ParamByName('DEPTO_DEV').AsString  := '10';
  QRel.ParamByName('P02').AsString     := 'P-02';
  QRel.ParamByName('P05').AsString     := 'P-05';
  QRel.ParamByName('P08').AsString     := 'P-08';
  QRel.ParamByName('P13').AsString     := 'P-13';
  QRel.ParamByName('P20').AsString     := 'P-20';
  QRel.ParamByName('P45').AsString     := 'P-45';



  QRel.Prepare;
  QRel.Open;

  QRel_Total.Sql.Clear;
  QRel_Total.Sql.Add('SELECT PRODUTOS.MARCA , SUM(TRANSITENS.QUANTIDADE) TOTAL_COMPRA');
  QRel_Total.Sql.Add('FROM TRANSACOES');
  QRel_Total.Sql.Add('INNER JOIN TRANSITENS ON TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID');
  QRel_Total.Sql.Add('INNER JOIN PRODUTOS ON PRODUTOS.PRODUTO_ID = TRANSITENS.PRODUTO_ID');
  QRel_Total.Sql.Add('WHERE DT_ENT_SAI BETWEEN :DT_INI AND :DT_FIM');
  QRel_Total.Sql.Add('AND ((CONDUTA= :COND_CPR AND  DEPTO = :DEPTO) OR (CONDUTA = :COND_VDA AND DEPTO= :DEPTO_DEV))');
  QRel_Total.Sql.Add('AND ((PRODUTOS.MARCA = :P02) OR (PRODUTOS.MARCA = :P05) OR (PRODUTOS.MARCA = :P08) OR (PRODUTOS.MARCA = :P13)');
  QRel_Total.Sql.Add('OR (PRODUTOS.MARCA = :P20) OR (PRODUTOS.MARCA = :P45))');
  QRel_Total.Sql.Add('GROUP BY MARCA');
  QRel_Total.Sql.Add('ORDER BY MARCA');

  if Mes.Text = 'Janeiro'  then
  Begin
  QRel_Total.ParamByName('DT_INI').AsDateTime   := StrToDate('01/01/' + Copy(Ano.Text,3,2) + ' ');
  QRel_Total.ParamByName('DT_FIM').AsDateTime   := StrToDate('31/01/' + Copy(Ano.Text,3,2) + ' ');
  End;
  if Mes.Text = 'Fevereiro'  then
  Begin
  QRel_Total.ParamByName('DT_INI').AsDateTime   := StrToDate('01/02/' + Copy(Ano.Text,3,2) + ' ');
  QRel_Total.ParamByName('DT_FIM').AsDateTime   := StrToDate('28/02/' + Copy(Ano.Text,3,2) + ' ');
  End;
  if Mes.Text = 'Março'  then
  Begin
  QRel_Total.ParamByName('DT_INI').AsDateTime   := StrToDate('01/03/' + Copy(Ano.Text,3,2) + ' ');
  QRel_Total.ParamByName('DT_FIM').AsDateTime   := StrToDate('31/03/' + Copy(Ano.Text,3,2) + ' ');
  End;
  if Mes.Text = 'Abril' then
  Begin
  QRel_Total.ParamByName('DT_INI').AsDateTime   := StrToDate('01/04/' + Copy(Ano.Text,3,2) + ' ');
  QRel_Total.ParamByName('DT_FIM').AsDateTime   := StrToDate('30/04/' + Copy(Ano.Text,3,2) + ' ');
  End;
  if Mes.Text = 'Maio' then
  Begin
  QRel_Total.ParamByName('DT_INI').AsDateTime   := StrToDate('01/05/' + Copy(Ano.Text,3,2) + ' ');
  QRel_Total.ParamByName('DT_FIM').AsDateTime   := StrToDate('31/05/' + Copy(Ano.Text,3,2) + ' ');
  End;
  if Mes.Text = 'Junho' then
  Begin
  QRel_Total.ParamByName('DT_INI').AsDateTime   := StrToDate('01/06/' + Copy(Ano.Text,3,2) + ' ');
  QRel_Total.ParamByName('DT_FIM').AsDateTime   := StrToDate('30/06/' + Copy(Ano.Text,3,2) + ' ');
  End;
  if Mes.Text = 'Julho' then
  Begin
  QRel_Total.ParamByName('DT_INI').AsDateTime   := StrToDate('01/07/' + Copy(Ano.Text,3,2) + ' ');
  QRel_Total.ParamByName('DT_FIM').AsDateTime   := StrToDate('31/07/' + Copy(Ano.Text,3,2) + ' ');
  End;
  if Mes.Text = 'Agosto' then
  Begin
  QRel_Total.ParamByName('DT_INI').AsDateTime   := StrToDate('01/08/' + Copy(Ano.Text,3,2) + ' ');
  QRel_Total.ParamByName('DT_FIM').AsDateTime   := StrToDate('31/08/' + Copy(Ano.Text,3,2) + ' ');
  End;
  if Mes.Text = 'Setembro' then
  Begin
  QRel_Total.ParamByName('DT_INI').AsDateTime   := StrToDate('01/09/' + Copy(Ano.Text,3,2) + ' ');
  QRel_Total.ParamByName('DT_FIM').AsDateTime   := StrToDate('30/09/' + Copy(Ano.Text,3,2) + ' ');
  End;
  if Mes.Text = 'Outubro' then
  Begin
  QRel_Total.ParamByName('DT_INI').AsDateTime   := StrToDate('01/10/' + Copy(Ano.Text,3,2) + ' ');
  QRel_Total.ParamByName('DT_FIM').AsDateTime   := StrToDate('31/10/' + Copy(Ano.Text,3,2) + ' ');
  End;
  if Mes.Text = 'Novembro' then
  Begin
  QRel_Total.ParamByName('DT_INI').AsDateTime   := StrToDate('01/11/' + Copy(Ano.Text,3,2) + ' ');
  QRel_Total.ParamByName('DT_FIM').AsDateTime   := StrToDate('30/11/' + Copy(Ano.Text,3,2) + ' ');
  End;
  if Mes.Text = 'Dezembro' then
  Begin
  QRel_Total.ParamByName('DT_INI').AsDateTime   := StrToDate('01/12/' + Copy(Ano.Text,3,2) + ' ');
  QRel_Total.ParamByName('DT_FIM').AsDateTime   := StrToDate('31/12/' + Copy(Ano.Text,3,2) + ' ');
  End;



  QRel_Total.ParamByName('COND_CPR').AsString   := '02';
  QRel_Total.ParamByName('DEPTO').AsString      := '07';
  QRel_Total.ParamByName('COND_VDA').AsString   := '01';
  QRel_Total.ParamByName('DEPTO_DEV').AsString  := '10';
  QRel_Total.ParamByName('P02').AsString     := 'P-02';
  QRel_Total.ParamByName('P05').AsString     := 'P-05';
  QRel_Total.ParamByName('P08').AsString     := 'P-08';
  QRel_Total.ParamByName('P13').AsString     := 'P-13';
  QRel_Total.ParamByName('P20').AsString     := 'P-20';
  QRel_Total.ParamByName('P45').AsString     := 'P-45';

  QRel_Total.Prepare;
  QRel_Total.Open;



  QRel_Saida.SQL.Clear;
  QRel_Saida.Sql.Add('SELECT MARCA, SUM(SALDO) SALDO , SUM(SALDO_ANTERIOR) SALDO_ANTERIOR');
  QRel_Saida.Sql.Add('FROM(');
  QRel_Saida.Sql.Add('SELECT PRODUTOS.MARCA, TRANSITENS.QUANTIDADE SALDO, 0 SALDO_ANTERIOR');
  QRel_Saida.Sql.Add('FROM TRANSACOES');
  QRel_Saida.Sql.Add('INNER JOIN TRANSITENS ON TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID');
  QRel_Saida.Sql.Add('INNER JOIN PRODUTOS ON PRODUTOS.PRODUTO_ID = TRANSITENS.PRODUTO_ID');
  QRel_Saida.Sql.Add('WHERE DT_ENT_SAI BETWEEN :DT_INI AND :DT_FIM');
  QRel_Saida.Sql.Add('AND ((CONDUTA= :COND_VDA  AND  DEPTO = :DEPTO) OR (CONDUTA = :COND_CPR AND DEPTO = :DEPTO_DEV))');
  QRel_Saida.Sql.Add('AND ((PRODUTOS.MARCA = :P02) OR (PRODUTOS.MARCA = :P05) OR (PRODUTOS.MARCA = :P08) OR (PRODUTOS.MARCA = :P13)');
  QRel_Saida.Sql.Add('OR (PRODUTOS.MARCA = :P20) OR (PRODUTOS.MARCA = :P45))');
  QRel_Saida.Sql.Add('UNION ALL');
  QRel_Saida.Sql.Add('SELECT MARCA, 0 SALDO, (SALDO_COMPRA -  SALDO_VENDA) SALDO_ANTERIOR');
  QRel_Saida.Sql.Add('FROM(');
  QRel_Saida.Sql.Add('SELECT MARCA, SUM(SALDO_VENDA) SALDO_VENDA, SUM(SALDO_COMPRA) SALDO_COMPRA');
  QRel_Saida.Sql.Add('FROM(');
  QRel_Saida.Sql.Add('SELECT PRODUTOS.MARCA,(TRANSITENS.QUANTIDADE) SALDO_VENDA , 0 SALDO_COMPRA');
  QRel_Saida.Sql.Add('FROM TRANSACOES');
  QRel_Saida.Sql.Add('INNER JOIN TRANSITENS ON TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID');
  QRel_Saida.Sql.Add('INNER JOIN PRODUTOS ON PRODUTOS.PRODUTO_ID = TRANSITENS.PRODUTO_ID');
  QRel_Saida.Sql.Add('WHERE DT_ENT_SAI BETWEEN :DT_INI_ANT AND :DT_FIM_ANT');
  QRel_Saida.Sql.Add('AND ((CONDUTA = :COND_VDA AND  DEPTO = :DEPTO) OR (CONDUTA = :COND_CPR  AND DEPTO= :DEPTO_DEV))');
  QRel_Saida.Sql.Add('AND ((PRODUTOS.MARCA = :P02) OR (PRODUTOS.MARCA = :P05) OR (PRODUTOS.MARCA = :P08) OR (PRODUTOS.MARCA = :P13)');
  QRel_Saida.Sql.Add('OR (PRODUTOS.MARCA = :P20) OR (PRODUTOS.MARCA = :P45))');
  QRel_Saida.Sql.Add('UNION ALL');
  QRel_Saida.Sql.Add('SELECT PRODUTOS.MARCA, 0 SALDO_VENDA , (TRANSITENS.QUANTIDADE) SALDO_COMPRA');
  QRel_Saida.Sql.Add('FROM TRANSACOES');
  QRel_Saida.Sql.Add('INNER JOIN TRANSITENS ON TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID');
  QRel_Saida.Sql.Add('INNER JOIN PRODUTOS ON PRODUTOS.PRODUTO_ID = TRANSITENS.PRODUTO_ID');
  QRel_Saida.Sql.Add('WHERE DT_ENT_SAI BETWEEN :DT_INI_ANT AND :DT_FIM_ANT');
  QRel_Saida.Sql.Add('AND ((CONDUTA = :COND_CPR AND  DEPTO = :DEPTO) OR (CONDUTA = :COND_VDA  AND DEPTO= :DEPTO_DEV))');
  QRel_Saida.Sql.Add('AND ((PRODUTOS.MARCA = :P02) OR (PRODUTOS.MARCA = :P05) OR (PRODUTOS.MARCA = :P08) OR (PRODUTOS.MARCA = :P13)');
  QRel_Saida.Sql.Add('OR (PRODUTOS.MARCA = :P20) OR (PRODUTOS.MARCA = :P45))');
  QRel_Saida.Sql.Add(')as teste');
  QRel_Saida.Sql.Add('GROUP BY MARCA');
  QRel_Saida.Sql.Add(') as teste1 ');
  QRel_Saida.Sql.Add(')as teste2');
  QRel_Saida.Sql.Add('GROUP BY MARCA');
  QRel_Saida.Sql.Add('ORDER BY MARCA');

  if Mes.Text = 'Janeiro'  then
  Begin
  QRel_Saida.ParamByName('DT_INI').AsDateTime   := StrToDate('01/01/' + Copy(Ano.Text,3,2) + ' ');
  QRel_Saida.ParamByName('DT_FIM').AsDateTime   := StrToDate('31/01/' + Copy(Ano.Text,3,2) + ' ');
  End;
  if Mes.Text = 'Fevereiro'  then
  Begin
  QRel_Saida.ParamByName('DT_INI').AsDateTime   := StrToDate('01/02/' + Copy(Ano.Text,3,2) + ' ');
  QRel_Saida.ParamByName('DT_FIM').AsDateTime   := StrToDate('28/02/' + Copy(Ano.Text,3,2) + ' ');
  End;
  if Mes.Text = 'Março'  then
  Begin
  QRel_Saida.ParamByName('DT_INI').AsDateTime   := StrToDate('01/03/' + Copy(Ano.Text,3,2) + ' ');
  QRel_Saida.ParamByName('DT_FIM').AsDateTime   := StrToDate('31/03/' + Copy(Ano.Text,3,2) + ' ');
  End;
  if Mes.Text = 'Abril' then
  Begin
  QRel_Saida.ParamByName('DT_INI').AsDateTime   := StrToDate('01/04/' + Copy(Ano.Text,3,2) + ' ');
  QRel_Saida.ParamByName('DT_FIM').AsDateTime   := StrToDate('30/04/' + Copy(Ano.Text,3,2) + ' ');
  End;
  if Mes.Text = 'Maio' then
  Begin
  QRel_Saida.ParamByName('DT_INI').AsDateTime   := StrToDate('01/05/' + Copy(Ano.Text,3,2) + ' ');
  QRel_Saida.ParamByName('DT_FIM').AsDateTime   := StrToDate('31/05/' + Copy(Ano.Text,3,2) + ' ');
  End;
  if Mes.Text = 'Junho' then
  Begin
  QRel_Saida.ParamByName('DT_INI').AsDateTime   := StrToDate('01/06/' + Copy(Ano.Text,3,2) + ' ');
  QRel_Saida.ParamByName('DT_FIM').AsDateTime   := StrToDate('30/06/' + Copy(Ano.Text,3,2) + ' ');
  End;
  if Mes.Text = 'Julho' then
  Begin
  QRel_Saida.ParamByName('DT_INI').AsDateTime   := StrToDate('01/07/' + Copy(Ano.Text,3,2) + ' ');
  QRel_Saida.ParamByName('DT_FIM').AsDateTime   := StrToDate('31/07/' + Copy(Ano.Text,3,2) + ' ');
  End;
  if Mes.Text = 'Agosto' then
  Begin
  QRel_Saida.ParamByName('DT_INI').AsDateTime   := StrToDate('01/08/' + Copy(Ano.Text,3,2) + ' ');
  QRel_Saida.ParamByName('DT_FIM').AsDateTime   := StrToDate('31/08/' + Copy(Ano.Text,3,2) + ' ');
  End;
  if Mes.Text = 'Setembro' then
  Begin
  QRel_Saida.ParamByName('DT_INI').AsDateTime   := StrToDate('01/09/' + Copy(Ano.Text,3,2) + ' ');
  QRel_Saida.ParamByName('DT_FIM').AsDateTime   := StrToDate('30/09/' + Copy(Ano.Text,3,2) + ' ');
  End;
  if Mes.Text = 'Outubro' then
  Begin
  QRel_Saida.ParamByName('DT_INI').AsDateTime   := StrToDate('01/10/' + Copy(Ano.Text,3,2) + ' ');
  QRel_Saida.ParamByName('DT_FIM').AsDateTime   := StrToDate('31/10/' + Copy(Ano.Text,3,2) + ' ');
  End;
  if Mes.Text = 'Novembro' then
  Begin
  QRel_Saida.ParamByName('DT_INI').AsDateTime   := StrToDate('01/11/' + Copy(Ano.Text,3,2) + ' ');
  QRel_Saida.ParamByName('DT_FIM').AsDateTime   := StrToDate('30/11/' + Copy(Ano.Text,3,2) + ' ');
  End;
  if Mes.Text = 'Dezembro' then
  Begin
  QRel_Saida.ParamByName('DT_INI').AsDateTime   := StrToDate('01/12/' + Copy(Ano.Text,3,2) + ' ');
  QRel_Saida.ParamByName('DT_FIM').AsDateTime   := StrToDate('31/12/' + Copy(Ano.Text,3,2) + ' ');
  End;

  QRel_Saida.ParamByName('COND_CPR').AsString  := '02';
  QRel_Saida.ParamByName('DEPTO').AsString     := '07';
  QRel_Saida.ParamByName('COND_VDA').AsString  := '01';
  QRel_Saida.ParamByName('DEPTO_DEV').AsString := '10';
  QRel_Saida.ParamByName('P02').AsString     := 'P-02';
  QRel_Saida.ParamByName('P05').AsString     := 'P-05';
  QRel_Saida.ParamByName('P08').AsString     := 'P-08';
  QRel_Saida.ParamByName('P13').AsString     := 'P-13';
  QRel_Saida.ParamByName('P20').AsString     := 'P-20';
  QRel_Saida.ParamByName('P45').AsString     := 'P-45';

  if Mes.Text = 'Janeiro' then
  Begin
  QRel_Saida.ParamByName('DT_INI_ANT').AsDateTime :=  StrToDate('01/01/01');
  QRel_Saida.ParamByName('DT_FIM_ANT').AsDateTime :=  StrToDate('31/12/' + StrZero(IntToStr(StrToInt(Copy(Ano.Text,3,2)) -1),2,0) + ' ');
  End;
  if Mes.Text = 'Fevereiro' then
  Begin
  QRel_Saida.ParamByName('DT_INI_ANT').AsDateTime  :=  StrToDate('01/01/01');
  QRel_Saida.ParamByName('DT_FIM_ANT').AsDateTime  :=  StrToDate('31/01/' + Copy(Ano.Text,3,2) + ' ');
  End;
  if Mes.Text = 'Março' then
  Begin
  QRel_Saida.ParamByName('DT_INI_ANT').AsDateTime  :=  StrToDate('01/01/01');
  QRel_Saida.ParamByName('DT_FIM_ANT').AsDateTime  :=  StrToDate('28/02/' + Copy(Ano.Text,3,2) + ' ');
  End;
  if Mes.Text = 'Abril' then
  Begin
  QRel_Saida.ParamByName('DT_INI_ANT').AsDateTime  :=  StrToDate('01/01/01');
  QRel_Saida.ParamByName('DT_FIM_ANT').AsDateTime  :=  StrToDate('31/03/' + Copy(Ano.Text,3,2) + ' ');
  End;
  if Mes.Text = 'Maio' then
  Begin
  QRel_Saida.ParamByName('DT_INI_ANT').AsDateTime  :=  StrToDate('01/01/01');
  QRel_Saida.ParamByName('DT_FIM_ANT').AsDateTime  :=  StrToDate('30/04/' + Copy(Ano.Text,3,2) + ' ');
  End;
  if Mes.Text = 'Junho' then
  Begin
  QRel_Saida.ParamByName('DT_INI_ANT').AsDateTime  :=  StrToDate('01/01/01');
  QRel_Saida.ParamByName('DT_FIM_ANT').AsDateTime  :=  StrToDate('31/05/' + Copy(Ano.Text,3,2) + ' ');
  End;
  if Mes.Text = 'Julho' then
  Begin
  QRel_Saida.ParamByName('DT_INI_ANT').AsDateTime  :=  StrToDate('01/01/01');
  QRel_Saida.ParamByName('DT_FIM_ANT').AsDateTime  :=  StrToDate('30/06/' + Copy(Ano.Text,3,2) + ' ');
  End;
  if Mes.Text = 'Agosto' then
  Begin
  QRel_Saida.ParamByName('DT_INI_ANT').AsDateTime  :=  StrToDate('01/01/01');
  QRel_Saida.ParamByName('DT_FIM_ANT').AsDateTime  :=  StrToDate('31/07/' + Copy(Ano.Text,3,2) + ' ');
  End;
  if Mes.Text = 'Setembro' then
  Begin
  QRel_Saida.ParamByName('DT_INI_ANT').AsDateTime  :=  StrToDate('01/01/01');
  QRel_Saida.ParamByName('DT_FIM_ANT').AsDateTime  :=  StrToDate('31/08/' + Copy(Ano.Text,3,2) + ' ');
  End;
  if Mes.Text = 'Outubro' then
  Begin
  QRel_Saida.ParamByName('DT_INI_ANT').AsDateTime  :=  StrToDate('01/01/01');
  QRel_Saida.ParamByName('DT_FIM_ANT').AsDateTime  :=  StrToDate('30/09/' + Copy(Ano.Text,3,2) + ' ');
  End;
  if Mes.Text = 'Novembro' then
  Begin
  QRel_Saida.ParamByName('DT_INI_ANT').AsDateTime  :=  StrToDate('01/01/01');
  QRel_Saida.ParamByName('DT_FIM_ANT').AsDateTime  :=  StrToDate('31/10/' + Copy(Ano.Text,3,2) + ' ');
  End;
  if Mes.Text = 'Dezembro' then
  Begin
  QRel_Saida.ParamByName('DT_INI_ANT').AsDateTime  :=  StrToDate('01/01/01');
  QRel_Saida.ParamByName('DT_FIM_ANT').AsDateTime  :=  StrToDate('30/11/' + Copy(Ano.Text,3,2) + ' ');
  End;



  QRel_Saida.Prepare;
  QRel_Saida.Open;


  if (QRel.IsEmpty) and (QRel_Saida.IsEmpty) then
    Application.MessageBox('Não há dados para serem impressos', PChar(Msg_Title), mb_IconInformation)
  else
  begin
      RDprint1.Impressora := Epson;
      RDprint1.FonteTamanhoPadrao := S10cpp;

    if CheckBox1.Checked = True then
    Begin
      RDprint1.Impressora := HP;
      RDprint1.FonteTamanhoPadrao := S10cpp;
    End;

    RDprint1.OpcoesPreview.Preview     := True;
    RDprint1.MostrarProgresso          := True;
    RDprint1.Acentuacao                := SemAcento;
    RDprint1.TamanhoQteLinhas          := 1;
    RDprint1.Abrir;
    Pagina  := 1;



    RDprint1.Impf(Linha,02,'Saldo mês anterior:',[negrito]);

    QRel_Saida.First;
    while not QRel_Saida.Eof do
    Begin
     if QRel_Saida.FieldByName('MARCA').AsString = 'P-02' then
     Begin
     RDprint1.Imp(Linha,29,StrZero(QRel_Saida.FieldByName('SALDO_ANTERIOR').AsString,4,0));
     P02_ANT := StrToInt(QRel_Saida.FieldByName('SALDO_ANTERIOR').AsString);
     End
     else if QRel_Saida.FieldByName('MARCA').AsString = 'P-05' then
     Begin
     RDprint1.Imp(Linha,38,StrZero(QRel_Saida.FieldByName('SALDO_ANTERIOR').AsString,4,0));
     P05_ANT := StrToInt(QRel_Saida.FieldByName('SALDO_ANTERIOR').AsString);
     End
     else if QRel_Saida.FieldByName('MARCA').AsString = 'P-08' then
     Begin
     RDprint1.Imp(Linha,47,StrZero(QRel_Saida.FieldByName('SALDO_ANTERIOR').AsString,4,0));
     P08_ANT := StrToInt(QRel_Saida.FieldByName('SALDO_ANTERIOR').AsString);
     End
     else if QRel_Saida.FieldByName('MARCA').AsString = 'P-13' then
     Begin
     RDprint1.Imp(Linha,56,StrZero(QRel_Saida.FieldByName('SALDO_ANTERIOR').AsString,4,0));
     P13_ANT := StrToInt(QRel_Saida.FieldByName('SALDO_ANTERIOR').AsString);
     End
     else if QRel_Saida.FieldByName('MARCA').AsString = 'P-20' then
     Begin
     RDprint1.Imp(Linha,65,StrZero(QRel_Saida.FieldByName('SALDO_ANTERIOR').AsString,4,0));
     P20_ANT := StrToInt(QRel_Saida.FieldByName('SALDO_ANTERIOR').AsString);
     End
     else if QRel_Saida.FieldByName('MARCA').AsString = 'P-45' then
     Begin
     RDprint1.Imp(Linha,74,StrZero(QRel_Saida.FieldByName('SALDO_ANTERIOR').AsString,4,0));
     P45_ANT := StrToInt(QRel_Saida.FieldByName('SALDO_ANTERIOR').AsString);
     End;

     QRel_Saida.Next;
    End;

    RDprint1.LinhaV(01,(Linha - 1),(Linha + 1),1,False);
    RDprint1.LinhaV(26,(Linha - 1),(Linha + 1),3,False);
    RDprint1.LinhaV(35,(Linha - 1),(Linha + 1),3,False);
    RDprint1.LinhaV(44,(Linha - 1),(Linha + 1),3,False);
    RDprint1.LinhaV(53,(Linha - 1),(Linha + 1),3,False);
    RDprint1.LinhaV(62,(Linha - 1),(Linha + 1),3,False);
    RDprint1.LinhaV(71,(Linha - 1),(Linha + 1),3,False);
    RDprint1.LinhaV(80,(Linha - 1),(Linha + 1),2,False);

    inc(Linha);
    RDprint1.LinhaH(linha,02,79,0,False);
    inc(Linha);

    RDprint1.Impf(Linha,02,'Documentos Fiscais(entrada):',[negrito]);
    RDprint1.LinhaV(01,(Linha - 1),(Linha + 1),1,False);
    RDprint1.LinhaV(80,(Linha - 1),(Linha + 1),2,False);

    inc(Linha);
    RDprint1.LinhaH(linha,02,79,0,False);
    inc(Linha);

    QRel.First;

    while not QRel.Eof do
    begin

      if linha >= 66  then
      Begin
      RDprint1.Novapagina;
      Pagina := Pagina + 1;
      End;

      if id = QRel.FieldByName('TRANSACAO_ID').AsInteger  then
      Linha:= Linha - 2;

     if QRel.FieldByName('MARCA').AsString = 'P-02' then
     Begin
     if ID <> QRel.FieldByName('TRANSACAO_ID').AsInteger  then
     RDprint1.Imp(Linha,02,'Doc-' + QRel.FieldByName('NUM_DOC').AsString + '-' + DateToStr(Qrel.FieldByName('DT_ENT_SAI').AsDateTime));
     RDprint1.Imp(Linha,29,StrZero(QRel.FieldByName('SALDO').AsString,4,0));
     End
     else if QRel.FieldByName('MARCA').AsString = 'P-05' then
     Begin
     if ID <> QRel.FieldByName('TRANSACAO_ID').AsInteger  then
     RDprint1.Imp(Linha,02,'Doc-' + QRel.FieldByName('NUM_DOC').AsString + '-' + DateToStr(Qrel.FieldByName('DT_ENT_SAI').AsDateTime));
     RDprint1.Imp(Linha,38,StrZero(QRel.FieldByName('SALDO').AsString,4,0));
     End
     else if QRel.FieldByName('MARCA').AsString = 'P-08' then
     Begin
     if ID <> QRel.FieldByName('TRANSACAO_ID').AsInteger  then
     RDprint1.Imp(Linha,02,'Doc-' + QRel.FieldByName('NUM_DOC').AsString + '-' + DateToStr(Qrel.FieldByName('DT_ENT_SAI').AsDateTime));
     RDprint1.Imp(Linha,47,StrZero(QRel.FieldByName('SALDO').AsString,4,0));
     End
     else if QRel.FieldByName('MARCA').AsString = 'P-13' then
     Begin
     if ID <> QRel.FieldByName('TRANSACAO_ID').AsInteger  then
     RDprint1.Imp(Linha,02,'Doc-' + QRel.FieldByName('NUM_DOC').AsString + '-' + DateToStr(Qrel.FieldByName('DT_ENT_SAI').AsDateTime));
     RDprint1.Imp(Linha,56,StrZero(QRel.FieldByName('SALDO').AsString,4,0));
     End
     else if QRel.FieldByName('MARCA').AsString = 'P-20' then
     Begin
     if ID <> QRel.FieldByName('TRANSACAO_ID').AsInteger  then
     RDprint1.Imp(Linha,02,'Doc-' + QRel.FieldByName('NUM_DOC').AsString + '-' + DateToStr(Qrel.FieldByName('DT_ENT_SAI').AsDateTime));
     RDprint1.Imp(Linha,65,StrZero(QRel.FieldByName('SALDO').AsString,4,0));
     End
     else if QRel.FieldByName('MARCA').AsString = 'P-45' then
     Begin
     if ID <> QRel.FieldByName('TRANSACAO_ID').AsInteger  then
     RDprint1.Imp(Linha,02,'Doc-' + QRel.FieldByName('NUM_DOC').AsString + '-' + DateToStr(Qrel.FieldByName('DT_ENT_SAI').AsDateTime));
     RDprint1.Imp(Linha,74,StrZero(QRel.FieldByName('SALDO').AsString,4,0));
     End;



      RDprint1.LinhaV(01,(Linha - 1),(Linha + 1),1,False);
      RDprint1.LinhaV(26,(Linha - 1),(Linha + 1),3,False);
      RDprint1.LinhaV(35,(Linha - 1),(Linha + 1),3,False);
      RDprint1.LinhaV(44,(Linha - 1),(Linha + 1),3,False);
      RDprint1.LinhaV(53,(Linha - 1),(Linha + 1),3,False);
      RDprint1.LinhaV(62,(Linha - 1),(Linha + 1),3,False);
      RDprint1.LinhaV(71,(Linha - 1),(Linha + 1),3,False);
      RDprint1.LinhaV(80,(Linha - 1),(Linha + 1),2,False);


      inc(Linha);
      RDprint1.LinhaH(linha,02,79,0,False);
      inc(Linha);


      ID :=  QRel.FieldByName('TRANSACAO_ID').AsInteger;

      QRel.Next;
    end;


    if linha >= 66  then
    Begin
    RDprint1.Novapagina;
    Pagina := Pagina + 1;
    End;

    RDprint1.Impf(Linha,02,'Total Compra:',[negrito]);

    QRel_Total.First;
    while not QRel_Total.Eof do
    Begin

     if QRel_Total.FieldByName('MARCA').AsString = 'P-02' then
     Begin
     RDprint1.Imp(Linha,29,StrZero(QRel_Total.FieldByName('TOTAL_COMPRA').AsString,4,0));
     P02_COM := StrToInt(QRel_Total.FieldByName('TOTAL_COMPRA').AsString);
     End
     else if QRel_Total.FieldByName('MARCA').AsString = 'P-05' then
     begin
     RDprint1.Imp(Linha,38,StrZero(QRel_Total.FieldByName('TOTAL_COMPRA').AsString,4,0));
     P05_COM := StrToInt(QRel_Total.FieldByName('TOTAL_COMPRA').AsString);
     end
     else if QRel_Total.FieldByName('MARCA').AsString = 'P-08' then
     Begin
     RDprint1.Imp(Linha,47,StrZero(QRel_Total.FieldByName('TOTAL_COMPRA').AsString,4,0));
     P08_COM := StrToInt(QRel_Total.FieldByName('TOTAL_COMPRA').AsString);
     End
     else if QRel_Total.FieldByName('MARCA').AsString = 'P-13' then
     Begin
     RDprint1.Imp(Linha,56,StrZero(QRel_Total.FieldByName('TOTAL_COMPRA').AsString,4,0));
     P13_COM := StrToInt(QRel_Total.FieldByName('TOTAL_COMPRA').AsString);
     End
     else if QRel_Total.FieldByName('MARCA').AsString = 'P-20' then
     Begin
     RDprint1.Imp(Linha,65,StrZero(QRel_Total.FieldByName('TOTAL_COMPRA').AsString,4,0));
     P20_COM := StrToInt(QRel_Total.FieldByName('TOTAL_COMPRA').AsString);
     End
     else if QRel_Total.FieldByName('MARCA').AsString = 'P-45' then
     begin
     RDprint1.Imp(Linha,74,StrZero(QRel_Total.FieldByName('TOTAL_COMPRA').AsString,4,0));
     P45_COM := StrToInt(QRel_Total.FieldByName('TOTAL_COMPRA').AsString);
     end;

     QRel_Total.Next;
    End;

    RDprint1.LinhaV(01,(Linha - 1),(Linha + 1),1,False);
    RDprint1.LinhaV(26,(Linha - 1),(Linha + 1),3,False);
    RDprint1.LinhaV(35,(Linha - 1),(Linha + 1),3,False);
    RDprint1.LinhaV(44,(Linha - 1),(Linha + 1),3,False);
    RDprint1.LinhaV(53,(Linha - 1),(Linha + 1),3,False);
    RDprint1.LinhaV(62,(Linha - 1),(Linha + 1),3,False);
    RDprint1.LinhaV(71,(Linha - 1),(Linha + 1),3,False);
    RDprint1.LinhaV(80,(Linha - 1),(Linha + 1),2,False);

    inc(Linha);
    RDprint1.LinhaH(linha,02,79,0,False);
    inc(Linha);

    if linha >= 66  then
    Begin
    RDprint1.Novapagina;
    Pagina := Pagina + 1;
    End;

    RDprint1.Impf(Linha,02,'Vendas no Período:',[negrito]);

    QRel_Saida.First;
    while not QRel_Saida.Eof do
    Begin
     if QRel_Saida.FieldByName('MARCA').AsString = 'P-02' then
     Begin
     RDprint1.Imp(Linha,29,StrZero(QRel_Saida.FieldByName('SALDO').AsString,4,0));
     P02_VDA := StrToInt(QRel_Saida.FieldByName('SALDO').AsString);
     End
     else if QRel_Saida.FieldByName('MARCA').AsString = 'P-05' then
     Begin
     RDprint1.Imp(Linha,38,StrZero(QRel_Saida.FieldByName('SALDO').AsString,4,0));
     P05_VDA := StrToInt(QRel_Saida.FieldByName('SALDO').AsString);
     End
     else if QRel_Saida.FieldByName('MARCA').AsString = 'P-08' then
     Begin
     RDprint1.Imp(Linha,47,StrZero(QRel_Saida.FieldByName('SALDO').AsString,4,0));
     P08_VDA := StrToInt(QRel_Saida.FieldByName('SALDO').AsString);
     End
     else if QRel_Saida.FieldByName('MARCA').AsString = 'P-13' then
     begin
     RDprint1.Imp(Linha,56,StrZero(QRel_Saida.FieldByName('SALDO').AsString,4,0));
     P13_VDA := StrToInt(QRel_Saida.FieldByName('SALDO').AsString);
     end
     else if QRel_Saida.FieldByName('MARCA').AsString = 'P-20' then
     begin
     RDprint1.Imp(Linha,65,StrZero(QRel_Saida.FieldByName('SALDO').AsString,4,0));
     P20_VDA := StrToInt(QRel_Saida.FieldByName('SALDO').AsString);
     end
     else if QRel_Saida.FieldByName('MARCA').AsString = 'P-45' then
     Begin
     RDprint1.Imp(Linha,74,StrZero(QRel_Saida.FieldByName('SALDO').AsString,4,0));
     P45_VDA := StrToInt(QRel_Saida.FieldByName('SALDO').AsString);
     End;

     QRel_Saida.Next;
    End;

    RDprint1.LinhaV(01,(Linha - 1),(Linha + 1),1,False);
    RDprint1.LinhaV(26,(Linha - 1),(Linha + 1),3,False);
    RDprint1.LinhaV(35,(Linha - 1),(Linha + 1),3,False);
    RDprint1.LinhaV(44,(Linha - 1),(Linha + 1),3,False);
    RDprint1.LinhaV(53,(Linha - 1),(Linha + 1),3,False);
    RDprint1.LinhaV(62,(Linha - 1),(Linha + 1),3,False);
    RDprint1.LinhaV(71,(Linha - 1),(Linha + 1),3,False);
    RDprint1.LinhaV(80,(Linha - 1),(Linha + 1),2,False);

    inc(Linha);
    RDprint1.LinhaH(linha,02,79,0,False);
    inc(Linha);


     RDprint1.Impf(Linha,02,'Saldo P/ Mês Seguinte:',[negrito]);

    QRel_Saida.First;
    while not QRel_Saida.Eof do
    Begin
     if QRel_Saida.FieldByName('MARCA').AsString = 'P-02' then
     RDprint1.Imp(Linha,29,StrZero(IntToStr((P02_ANT + P02_COM) - P02_VDA),4,0))
     else if QRel_Saida.FieldByName('MARCA').AsString = 'P-05' then
     RDprint1.Imp(Linha,38,StrZero(IntToStr((P05_ANT + P05_COM) - P05_VDA),4,0))
     else if QRel_Saida.FieldByName('MARCA').AsString = 'P-08' then
     RDprint1.Imp(Linha,47,StrZero(IntToStr((P08_ANT + P08_COM) - P08_VDA),4,0))
     else if QRel_Saida.FieldByName('MARCA').AsString = 'P-13' then
     RDprint1.Imp(Linha,56,StrZero(IntToStr((P13_ANT + P13_COM) - P13_VDA),4,0))
     else if QRel_Saida.FieldByName('MARCA').AsString = 'P-20' then
     RDprint1.Imp(Linha,65,StrZero(IntToStr((P20_ANT + P20_COM) - P20_VDA),4,0))
     else if QRel_Saida.FieldByName('MARCA').AsString = 'P-45' then
     RDprint1.Imp(Linha,74,StrZero(IntToStr((P45_ANT + P45_COM) - P45_VDA),4,0));
     QRel_Saida.Next;
    End;

    RDprint1.LinhaV(01,(Linha - 1),(Linha + 1),1,False);
    RDprint1.LinhaV(26,(Linha - 1),(Linha + 1),3,False);
    RDprint1.LinhaV(35,(Linha - 1),(Linha + 1),3,False);
    RDprint1.LinhaV(44,(Linha - 1),(Linha + 1),3,False);
    RDprint1.LinhaV(53,(Linha - 1),(Linha + 1),3,False);
    RDprint1.LinhaV(62,(Linha - 1),(Linha + 1),3,False);
    RDprint1.LinhaV(71,(Linha - 1),(Linha + 1),3,False);
    RDprint1.LinhaV(80,(Linha - 1),(Linha + 1),2,False);

    inc(Linha);
    RDprint1.LinhaH(linha,02,79,0,False);
    inc(Linha);
    inc(Linha);

    RDprint1.Imp(Linha,01,'Local_______________________________________   Data__/__/__');
    inc(Linha);
    inc(Linha);
    inc(Linha);
    RDprint1.Imp(Linha,01,'_____________________________________________ ');
    inc(Linha);
    RDprint1.Imp(Linha,01,'              Visto do Gerente');



    Application.ProcessMessages;

    RDprint1.TamanhoQteLinhas          := 66;
    RDprint1.Fechar;


  End;


end;


procedure TFrmRel_mapa_controle_movim_mensal.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRel_mapa_controle_movim_mensal.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmRel_mapa_controle_movim_mensal.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
   // Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmRel_mapa_controle_movim_mensal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmRel_mapa_controle_movim_mensal.MesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmRel_mapa_controle_movim_mensal.RDprint1BeforeNewPage(
  Sender: TObject; Pagina: Integer);
begin
  if linha <= 62  then
  Begin
  RDprint1.Imp(64, 01, '================================================================================');
  RDprint1.Imp(65, 01, 'Eficaz Automação e Sistemas Ltda');
  RDprint1.ImpDir(65, 33, 80, 'http://www.eficazautomacao.com.br', []);
  RDprint1.Imp(66,01,' ');
  End;

end;

procedure TFrmRel_mapa_controle_movim_mensal.RDprint1NewPage(Sender: TObject;
  Pagina: Integer);
begin
  RDprint1.LinhaH(01,02,79,0,False);
  RDprint1.impDir(02, 79, 79, 'Página: ' + IntToStr(Pagina), []);
  RDprint1.Imp(03, 02, 'Mapa de Controle de Movimento Mensal');
  RDprint1.ImpDir(03,(length('Mapa de Controle de Movimento Mensal')), 78, 'Eficaz Automação e Sistemas Ltda - ME', []);
  RDprint1.Imp(04,02, FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString);
  RDprint1.ImpDir(04,(length(FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString)), 78, 'Nº ' + numero.Text , []);
  RDprint1.LinhaH(05,02,79,0,False);
  RDprint1.Imp(06,02, 'Tipo das Instalações: ( )DEP.O ( )DEP.R ( )PRT ( ) PPR ( ) PRD');
  RDprint1.LinhaH(07,02,79,0,False);
  RDprint1.Imp(08,02, 'Endereço:' + Copy(FrmPrincipal.QEmpresa.FieldByName('ENDERECO').AsString,1,30));
  RDprint1.Imp(08, 40, 'Nº:' + FrmPrincipal.QEmpresa.FieldByName('NUMERO').AsString);
  RDprint1.Imp(08, 48, Copy (FrmPrincipal.QEmpresa.FieldByName('BAIRRO').AsString,1,15));
  RDprint1.Imp(09, 02, 'Cidade: ' + Copy(FrmPrincipal.QEmpresa.FieldByName('MUNICIPIO').AsString,1,20));
  RDprint1.Imp(09, 40, 'UF: ' + FrmPrincipal.QEmpresa.FieldByName('ESTADO').AsString);
  RDprint1.Imp(09, 47, 'Cnpj.:' + FrmPrincipal.QEmpresa.FieldByName('CNPJ').AsString);
  RDprint1.LinhaH(10,02,79,0,False);
  RDprint1.Impf(11, 02, 'Movimento mes/ano: ' + Mes.Text + '/' + Ano.Text,[negrito]);
  RDprint1.LinhaH(12,02,79,0,False);
  RDprint1.Imp(13,02,'Especie de Recipientes:');

  RDprint1.Imp(13,29,'P-02');
  RDprint1.Imp(13,38,'P-05');
  RDprint1.Imp(13,47,'P-08');
  RDprint1.Imp(13,56,'P-13');
  RDprint1.Imp(13,65,'P-20');
  RDprint1.Imp(13,74,'P-45');

  RDprint1.LinhaV(01,01,05,1,False);
  RDprint1.LinhaV(01,05,07,1,False);
  RDprint1.LinhaV(01,07,10,1,False);
  RDprint1.LinhaV(01,10,12,1,False);
  RDprint1.LinhaV(01,12,14,1,False);
  RDprint1.LinhaV(26,12,14,3,False);
  RDprint1.LinhaV(35,12,14,3,False);
  RDprint1.LinhaV(44,12,14,3,False);
  RDprint1.LinhaV(53,12,14,3,False);
  RDprint1.LinhaV(62,12,14,3,False);
  RDprint1.LinhaV(71,12,14,3,False);
  RDprint1.LinhaV(80,01,05,2,False);
  RDprint1.LinhaV(80,05,07,2,False);
  RDprint1.LinhaV(80,07,10,2,False);
  RDprint1.LinhaV(80,10,12,2,False);
  RDprint1.LinhaV(80,12,14,2,False);
  RDprint1.LinhaH(14,02,79,0,False);

  linha := 15;
end;

end.
