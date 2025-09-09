unit URel_Flash_de_vendas_horario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, IBCustomDataSet, IBQuery, Buttons, ExtCtrls, Mask,
  rxToolEdit, QuickRpt, QRCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, RxCurrEdit;

type
  TFrmRel_Flash_de_vendas_horario = class(TForm)
    Label1: TLabel;
    Dtmen: TDateEdit;
    Dtmai: TDateEdit;
    Bevel1: TBevel;
    btnExecuta: TBitBtn;
    btnRetorna: TBitBtn;
    Rel_Vendas_Operador: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    QRSysData1: TQRSysData;
    Cabec: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel8: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText6: TQRDBText;
    QRBand1: TQRBand;
    QRShape4: TQRShape;
    QRLabel20: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr3: TQRExpr;
    QRDBText7: TQRDBText;
    QRLabel11: TQRLabel;
    QRel: TFDQuery;
    FDQ: TFDQuery;
    Tipo_Rel: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Ano: TCurrencyEdit;
    Rel_Vendas_Operador_MES: TQuickRep;
    QRBand2: TQRBand;
    QRSysData3: TQRSysData;
    QRLabel1: TQRLabel;
    QRSysData4: TQRSysData;
    QRLabel2: TQRLabel;
    QRShape3: TQRShape;
    QRShape5: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRBand3: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRBand4: TQRBand;
    QRShape6: TQRShape;
    QRLabel9: TQRLabel;
    QRExpr2: TQRExpr;
    QRExpr4: TQRExpr;
    Rel_Vendas_Operador_MES_GRUPO: TQuickRep;
    QRBand9: TQRBand;
    QRSysData7: TQRSysData;
    QRLabel18: TQRLabel;
    QRSysData8: TQRSysData;
    QRLabel21: TQRLabel;
    QRShape11: TQRShape;
    QRLabel25: TQRLabel;
    QRDBText13: TQRDBText;
    QRBand10: TQRBand;
    QRDBText14: TQRDBText;
    QRDBText19: TQRDBText;
    QRBand11: TQRBand;
    QRShape13: TQRShape;
    QRLabel29: TQRLabel;
    QRExpr8: TQRExpr;
    QRGroup2: TQRGroup;
    QRDBText20: TQRDBText;
    QRLabel30: TQRLabel;
    QRBand12: TQRBand;
    QRShape14: TQRShape;
    QRLabel31: TQRLabel;
    QRExpr11: TQRExpr;
    QRShape16: TQRShape;
    QRLabel22: TQRLabel;
    QRLabel26: TQRLabel;
    procedure btnExecutaClick(Sender: TObject);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRetornaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure OperadorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DtmenEnter(Sender: TObject);
    procedure QRGroup2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Flash_de_vendas_horario: TFrmRel_Flash_de_vendas_horario;

implementation

uses
  UData, UPrincipal;

{$R *.dfm}

procedure TFrmRel_Flash_de_vendas_horario.btnExecutaClick(Sender: TObject);
begin
// 125, 327
  IF Tipo_Rel.Text =  'Relatório por Mês' Then
  Begin

  QRel.Sql.Clear;
  QRel.Sql.Add('SELECT MES, VALOR, CAST(CLIENTES AS INTEGER) CLIENTES');
  QRel.Sql.Add('FROM(');
  QRel.Sql.Add('SELECT  ''Janeiro''  MES,  SUM(VR_TOTAL) VALOR, COUNT(CLIENTE_ID) clientes');
  QRel.Sql.Add('FROM TRANSITENS');
  QRel.Sql.Add('INNER JOIN TRANSACOES on TRANSACOES.TRANSACAO_ID = TRANSITENS.TRANSACAO_ID');
  QRel.Sql.Add('WHERE (CONDUTA = :CONDUTA) AND (DEPTO = :DEPTO)');
  QRel.Sql.Add('AND (TIPO_VENDA = :TIPO_VENDA)');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
  QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
  QRel.Sql.Add('AND (DT_TRANS BETWEEN  :DT_INICIAL_JAN AND :DT_FINAL_JAN)');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

  QRel.Sql.Add('UNION ALL');

  QRel.Sql.Add('SELECT  ''Fevereiro''  MES,  SUM(VR_TOTAL) VALOR, COUNT(CLIENTE_ID) clientes');
  QRel.Sql.Add('FROM TRANSITENS');
  QRel.Sql.Add('INNER JOIN TRANSACOES on TRANSACOES.TRANSACAO_ID = TRANSITENS.TRANSACAO_ID');
  QRel.Sql.Add('WHERE (CONDUTA = :CONDUTA) AND (DEPTO = :DEPTO)');
  QRel.Sql.Add('AND (TIPO_VENDA = :TIPO_VENDA)');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
  QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
  QRel.Sql.Add('AND (DT_TRANS BETWEEN  :DT_INICIAL_FEV AND :DT_FINAL_FEV)');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

  QRel.Sql.Add('UNION ALL');

  QRel.Sql.Add('SELECT  ''Março''  MES,  SUM(VR_TOTAL) VALOR, COUNT(CLIENTE_ID) clientes');
  QRel.Sql.Add('FROM TRANSITENS');
  QRel.Sql.Add('INNER JOIN TRANSACOES on TRANSACOES.TRANSACAO_ID = TRANSITENS.TRANSACAO_ID');
  QRel.Sql.Add('WHERE (CONDUTA = :CONDUTA) AND (DEPTO = :DEPTO)');
  QRel.Sql.Add('AND (TIPO_VENDA = :TIPO_VENDA)');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
  QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
  QRel.Sql.Add('AND (DT_TRANS BETWEEN  :DT_INICIAL_MAR AND :DT_FINAL_MAR)');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

  QRel.Sql.Add('UNION ALL');

  QRel.Sql.Add('SELECT  ''Abril''  MES,  SUM(VR_TOTAL) VALOR, COUNT(CLIENTE_ID) clientes');
  QRel.Sql.Add('FROM TRANSITENS');
  QRel.Sql.Add('INNER JOIN TRANSACOES on TRANSACOES.TRANSACAO_ID = TRANSITENS.TRANSACAO_ID');
  QRel.Sql.Add('WHERE (CONDUTA = :CONDUTA) AND (DEPTO = :DEPTO)');
  QRel.Sql.Add('AND (TIPO_VENDA = :TIPO_VENDA)');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
  QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
  QRel.Sql.Add('AND (DT_TRANS BETWEEN  :DT_INICIAL_ABR AND :DT_FINAL_ABR)');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

  QRel.Sql.Add('UNION ALL');

  QRel.Sql.Add('SELECT  ''Maio''  MES,  SUM(VR_TOTAL) VALOR, COUNT(CLIENTE_ID) clientes');
  QRel.Sql.Add('FROM TRANSITENS');
  QRel.Sql.Add('INNER JOIN TRANSACOES on TRANSACOES.TRANSACAO_ID = TRANSITENS.TRANSACAO_ID');
  QRel.Sql.Add('WHERE (CONDUTA = :CONDUTA) AND (DEPTO = :DEPTO)');
  QRel.Sql.Add('AND (TIPO_VENDA = :TIPO_VENDA)');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
  QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
  QRel.Sql.Add('AND (DT_TRANS BETWEEN  :DT_INICIAL_MAI AND :DT_FINAL_MAI)');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

  QRel.Sql.Add('UNION ALL');

  QRel.Sql.Add('SELECT  ''Junho''  MES,  SUM(VR_TOTAL) VALOR, COUNT(CLIENTE_ID) clientes');
  QRel.Sql.Add('FROM TRANSITENS');
  QRel.Sql.Add('INNER JOIN TRANSACOES on TRANSACOES.TRANSACAO_ID = TRANSITENS.TRANSACAO_ID');
  QRel.Sql.Add('WHERE (CONDUTA = :CONDUTA) AND (DEPTO = :DEPTO)');
  QRel.Sql.Add('AND (TIPO_VENDA = :TIPO_VENDA)');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
  QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
  QRel.Sql.Add('AND (DT_TRANS BETWEEN  :DT_INICIAL_JUN AND :DT_FINAL_JUN)');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

  QRel.Sql.Add('UNION ALL');

  QRel.Sql.Add('SELECT  ''Julho''  MES,  SUM(VR_TOTAL) VALOR, COUNT(CLIENTE_ID) clientes');
  QRel.Sql.Add('FROM TRANSITENS');
  QRel.Sql.Add('INNER JOIN TRANSACOES on TRANSACOES.TRANSACAO_ID = TRANSITENS.TRANSACAO_ID');
  QRel.Sql.Add('WHERE (CONDUTA = :CONDUTA) AND (DEPTO = :DEPTO)');
  QRel.Sql.Add('AND (TIPO_VENDA = :TIPO_VENDA)');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
  QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
  QRel.Sql.Add('AND (DT_TRANS BETWEEN  :DT_INICIAL_JUL AND :DT_FINAL_JUL)');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

  QRel.Sql.Add('UNION ALL');

  QRel.Sql.Add('SELECT  ''Agosto''  MES,  SUM(VR_TOTAL) VALOR, COUNT(CLIENTE_ID) clientes');
  QRel.Sql.Add('FROM TRANSITENS');
  QRel.Sql.Add('INNER JOIN TRANSACOES on TRANSACOES.TRANSACAO_ID = TRANSITENS.TRANSACAO_ID');
  QRel.Sql.Add('WHERE (CONDUTA = :CONDUTA) AND (DEPTO = :DEPTO)');
  QRel.Sql.Add('AND (TIPO_VENDA = :TIPO_VENDA)');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
  QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
  QRel.Sql.Add('AND (DT_TRANS BETWEEN  :DT_INICIAL_AGO AND :DT_FINAL_AGO)');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

  QRel.Sql.Add('UNION ALL');

  QRel.Sql.Add('SELECT  ''Setembro''  MES,  SUM(VR_TOTAL) VALOR, COUNT(CLIENTE_ID) clientes');
  QRel.Sql.Add('FROM TRANSITENS');
  QRel.Sql.Add('INNER JOIN TRANSACOES on TRANSACOES.TRANSACAO_ID = TRANSITENS.TRANSACAO_ID');
  QRel.Sql.Add('WHERE (CONDUTA = :CONDUTA) AND (DEPTO = :DEPTO)');
  QRel.Sql.Add('AND (TIPO_VENDA = :TIPO_VENDA)');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
  QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
  QRel.Sql.Add('AND (DT_TRANS BETWEEN  :DT_INICIAL_SET AND :DT_FINAL_SET)');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

  QRel.Sql.Add('UNION ALL');

  QRel.Sql.Add('SELECT  ''Outubro''  MES,  SUM(VR_TOTAL) VALOR, COUNT(CLIENTE_ID) clientes');
  QRel.Sql.Add('FROM TRANSITENS');
  QRel.Sql.Add('INNER JOIN TRANSACOES on TRANSACOES.TRANSACAO_ID = TRANSITENS.TRANSACAO_ID');
  QRel.Sql.Add('WHERE (CONDUTA = :CONDUTA) AND (DEPTO = :DEPTO)');
  QRel.Sql.Add('AND (TIPO_VENDA = :TIPO_VENDA)');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
  QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
  QRel.Sql.Add('AND (DT_TRANS BETWEEN  :DT_INICIAL_OUT AND :DT_FINAL_OUT)');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

  QRel.Sql.Add('UNION ALL');

  QRel.Sql.Add('SELECT  ''Novembro''  MES,  SUM(VR_TOTAL) VALOR, COUNT(CLIENTE_ID) clientes');
  QRel.Sql.Add('FROM TRANSITENS');
  QRel.Sql.Add('INNER JOIN TRANSACOES on TRANSACOES.TRANSACAO_ID = TRANSITENS.TRANSACAO_ID');
  QRel.Sql.Add('WHERE (CONDUTA = :CONDUTA) AND (DEPTO = :DEPTO)');
  QRel.Sql.Add('AND (TIPO_VENDA = :TIPO_VENDA)');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
  QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
  QRel.Sql.Add('AND (DT_TRANS BETWEEN  :DT_INICIAL_NOV AND :DT_FINAL_NOV)');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

  QRel.Sql.Add('UNION ALL');

  QRel.Sql.Add('SELECT  ''Dezembro''  MES,  SUM(VR_TOTAL) VALOR, COUNT(CLIENTE_ID) clientes');
  QRel.Sql.Add('FROM TRANSITENS');
  QRel.Sql.Add('INNER JOIN TRANSACOES on TRANSACOES.TRANSACAO_ID = TRANSITENS.TRANSACAO_ID');
  QRel.Sql.Add('WHERE (CONDUTA = :CONDUTA) AND (DEPTO = :DEPTO)');
  QRel.Sql.Add('AND (TIPO_VENDA = :TIPO_VENDA)');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
  QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
  QRel.Sql.Add('AND (DT_TRANS BETWEEN  :DT_INICIAL_DEZ AND :DT_FINAL_DEZ)');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');



   QRel.Sql.Add(')AS TESTE');




  QRel.ParamByName('EMPRESA_ID').AsInteger      := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  QRel.ParamByName('TPCTB').AsString            := FrmData.QAcesso.FieldByName('TPCTB').AsString;
  QRel.ParamByName('CONDUTA').AsString          := '01';
  QRel.ParamByName('DEPTO').AsString            := '07';
  QRel.ParamByName('TIPO_VENDA').AsString       := 'VENDA';
  QRel.ParamByName('DT_INICIAL_JAN').AsDateTime := StrToDate('01/01/' + Ano.text);
  QRel.ParamByName('DT_FINAL_JAN').AsDateTime   := StrToDate('31/01/' + Ano.text);
  QRel.ParamByName('DT_INICIAL_FEV').AsDateTime := StrToDate('01/02/' + Ano.text);
  QRel.ParamByName('DT_FINAL_FEV').AsDateTime   := StrToDate('28/02/' + Ano.text);
  QRel.ParamByName('DT_INICIAL_MAR').AsDateTime := StrToDate('01/03/' + Ano.text);
  QRel.ParamByName('DT_FINAL_MAR').AsDateTime   := StrToDate('31/03/' + Ano.text);
  QRel.ParamByName('DT_INICIAL_ABR').AsDateTime := StrToDate('01/04/' + Ano.text);
  QRel.ParamByName('DT_FINAL_ABR').AsDateTime   := StrToDate('30/04/' + Ano.text);
  QRel.ParamByName('DT_INICIAL_MAI').AsDateTime := StrToDate('01/05/' + Ano.text);
  QRel.ParamByName('DT_FINAL_MAI').AsDateTime   := StrToDate('31/05/' + Ano.text);
  QRel.ParamByName('DT_INICIAL_JUN').AsDateTime := StrToDate('01/06/' + Ano.text);
  QRel.ParamByName('DT_FINAL_JUN').AsDateTime   := StrToDate('30/06/' + Ano.text);
  QRel.ParamByName('DT_INICIAL_JUL').AsDateTime := StrToDate('01/07/' + Ano.text);
  QRel.ParamByName('DT_FINAL_JUL').AsDateTime   := StrToDate('31/07/' + Ano.text);
  QRel.ParamByName('DT_INICIAL_AGO').AsDateTime := StrToDate('01/08/' + Ano.text);
  QRel.ParamByName('DT_FINAL_AGO').AsDateTime   := StrToDate('30/08/' + Ano.text);
  QRel.ParamByName('DT_INICIAL_SET').AsDateTime := StrToDate('01/09/' + Ano.text);
  QRel.ParamByName('DT_FINAL_SET').AsDateTime   := StrToDate('30/09/' + Ano.text);
  QRel.ParamByName('DT_INICIAL_OUT').AsDateTime := StrToDate('01/10/' + Ano.text);
  QRel.ParamByName('DT_FINAL_OUT').AsDateTime   := StrToDate('31/10/' + Ano.text);
  QRel.ParamByName('DT_INICIAL_NOV').AsDateTime := StrToDate('01/11/' + Ano.text);
  QRel.ParamByName('DT_FINAL_NOV').AsDateTime   := StrToDate('30/11/' + Ano.text);
  QRel.ParamByName('DT_INICIAL_DEZ').AsDateTime := StrToDate('01/12/' + Ano.text);
  QRel.ParamByName('DT_FINAL_DEZ').AsDateTime   := StrToDate('31/12/' + Ano.text);



  QRel.Prepare;
  QRel.Open;


   QRLabel5.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;

  if QRel.IsEmpty then
    Application.MessageBox('Não há dados para serem impressos', PChar(Msg_Title), mb_IconInformation)
  else
    Rel_Vendas_Operador_MES.PreviewModal;




  End
  else IF Tipo_Rel.Text =  'Relatório por Mês/Grupos' Then
  Begin

  QRel.Sql.Clear;
  QRel.Sql.Add('SELECT MES, GRUPO, VALOR');
  QRel.Sql.Add('FROM(');
  QRel.Sql.Add('SELECT  1  MES, TABELAS.DESCRICAO GRUPO, SUM(VR_TOTAL) VALOR');
  QRel.Sql.Add('FROM TRANSITENS');
  QRel.Sql.Add('INNER JOIN TRANSACOES on TRANSACOES.TRANSACAO_ID =TRANSITENS.TRANSACAO_ID');
  QRel.Sql.Add('LEFT  JOIN PRODUTOS on PRODUTOS.PRODUTO_ID  = TRANSITENS.produto_id');
  QRel.Sql.Add('INNER JOIN TABELAS  on TABELAS.TABELA_ID = PRODUTOS.grupo_id AND TABELAS.TIPO_TABELA =''7'' ');
  QRel.Sql.Add('WHERE (CONDUTA =''01'') AND (DEPTO =''07'')');
  QRel.Sql.Add('AND (TIPO_VENDA = ''VENDA'')');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
  QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
  QRel.Sql.Add('AND (DT_TRANS BETWEEN  :DT_INICIAL_JAN AND :DT_FINAL_JAN)');;
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');
  QRel.Sql.Add('GROUP BY TABELAS.DESCRICAO');

  QRel.Sql.Add('UNION ALL');

  QRel.Sql.Add('SELECT  2  MES, TABELAS.DESCRICAO GRUPO, SUM(VR_TOTAL) VALOR');
  QRel.Sql.Add('FROM TRANSITENS');
  QRel.Sql.Add('INNER JOIN TRANSACOES on TRANSACOES.TRANSACAO_ID =TRANSITENS.TRANSACAO_ID');
  QRel.Sql.Add('LEFT  JOIN PRODUTOS on PRODUTOS.PRODUTO_ID  = TRANSITENS.produto_id');
  QRel.Sql.Add('INNER JOIN TABELAS  on TABELAS.TABELA_ID = PRODUTOS.grupo_id AND TABELAS.TIPO_TABELA =''7'' ');
  QRel.Sql.Add('WHERE (CONDUTA =''01'') AND (DEPTO =''07'')');
  QRel.Sql.Add('AND (TIPO_VENDA = ''VENDA'')');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
  QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
  QRel.Sql.Add('AND (DT_TRANS BETWEEN  :DT_INICIAL_FEV AND :DT_FINAL_FEV)');;
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');
  QRel.Sql.Add('GROUP BY TABELAS.DESCRICAO');

  QRel.Sql.Add('UNION ALL');

  QRel.Sql.Add('SELECT  3  MES, TABELAS.DESCRICAO GRUPO,  SUM(VR_TOTAL) VALOR');
  QRel.Sql.Add('FROM TRANSITENS');
  QRel.Sql.Add('INNER JOIN TRANSACOES on TRANSACOES.TRANSACAO_ID =TRANSITENS.TRANSACAO_ID');
  QRel.Sql.Add('LEFT  JOIN PRODUTOS on PRODUTOS.PRODUTO_ID  = TRANSITENS.produto_id');
  QRel.Sql.Add('INNER JOIN TABELAS  on TABELAS.TABELA_ID = PRODUTOS.grupo_id AND TABELAS.TIPO_TABELA =''7'' ');
  QRel.Sql.Add('WHERE (CONDUTA =''01'') AND (DEPTO =''07'')');
  QRel.Sql.Add('AND (TIPO_VENDA = ''VENDA'')');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
  QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
  QRel.Sql.Add('AND (DT_TRANS BETWEEN  :DT_INICIAL_MAR AND :DT_FINAL_MAR)');;
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');
  QRel.Sql.Add('GROUP BY TABELAS.DESCRICAO');

  QRel.Sql.Add('UNION ALL');

  QRel.Sql.Add('SELECT  4 MES, TABELAS.DESCRICAO GRUPO, SUM(VR_TOTAL) VALOR');
  QRel.Sql.Add('FROM TRANSITENS');
  QRel.Sql.Add('INNER JOIN TRANSACOES on TRANSACOES.TRANSACAO_ID =TRANSITENS.TRANSACAO_ID');
  QRel.Sql.Add('LEFT  JOIN PRODUTOS on PRODUTOS.PRODUTO_ID  = TRANSITENS.produto_id');
  QRel.Sql.Add('INNER JOIN TABELAS  on TABELAS.TABELA_ID = PRODUTOS.grupo_id AND TABELAS.TIPO_TABELA =''7'' ');
  QRel.Sql.Add('WHERE (CONDUTA =''01'') AND (DEPTO =''07'')');
  QRel.Sql.Add('AND (TIPO_VENDA = ''VENDA'')');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
  QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
  QRel.Sql.Add('AND (DT_TRANS BETWEEN  :DT_INICIAL_ABR AND :DT_FINAL_ABR)');;
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');
  QRel.Sql.Add('GROUP BY TABELAS.DESCRICAO');

  QRel.Sql.Add('UNION ALL');

  QRel.Sql.Add('SELECT  5 MES, TABELAS.DESCRICAO GRUPO, SUM(VR_TOTAL) VALOR');
  QRel.Sql.Add('FROM TRANSITENS');
  QRel.Sql.Add('INNER JOIN TRANSACOES on TRANSACOES.TRANSACAO_ID =TRANSITENS.TRANSACAO_ID');
  QRel.Sql.Add('LEFT  JOIN PRODUTOS on PRODUTOS.PRODUTO_ID  = TRANSITENS.produto_id');
  QRel.Sql.Add('INNER JOIN TABELAS  on TABELAS.TABELA_ID = PRODUTOS.grupo_id AND TABELAS.TIPO_TABELA =''7'' ');
  QRel.Sql.Add('WHERE (CONDUTA =''01'') AND (DEPTO =''07'')');
  QRel.Sql.Add('AND (TIPO_VENDA = ''VENDA'')');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
  QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
  QRel.Sql.Add('AND (DT_TRANS BETWEEN  :DT_INICIAL_MAI AND :DT_FINAL_MAI)');;
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');
  QRel.Sql.Add('GROUP BY TABELAS.DESCRICAO');

  QRel.Sql.Add('UNION ALL');

  QRel.Sql.Add('SELECT  6 MES, TABELAS.DESCRICAO GRUPO, SUM(VR_TOTAL) VALOR');
  QRel.Sql.Add('FROM TRANSITENS');
  QRel.Sql.Add('INNER JOIN TRANSACOES on TRANSACOES.TRANSACAO_ID =TRANSITENS.TRANSACAO_ID');
  QRel.Sql.Add('LEFT  JOIN PRODUTOS on PRODUTOS.PRODUTO_ID  = TRANSITENS.produto_id');
  QRel.Sql.Add('INNER JOIN TABELAS  on TABELAS.TABELA_ID = PRODUTOS.grupo_id AND TABELAS.TIPO_TABELA =''7'' ');
  QRel.Sql.Add('WHERE (CONDUTA =''01'') AND (DEPTO =''07'')');
  QRel.Sql.Add('AND (TIPO_VENDA = ''VENDA'')');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
  QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
  QRel.Sql.Add('AND (DT_TRANS BETWEEN  :DT_INICIAL_JUN AND :DT_FINAL_JUN)');;
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');
  QRel.Sql.Add('GROUP BY TABELAS.DESCRICAO');

  QRel.Sql.Add('UNION ALL');

  QRel.Sql.Add('SELECT  7 MES, TABELAS.DESCRICAO GRUPO, SUM(VR_TOTAL) VALOR');
  QRel.Sql.Add('FROM TRANSITENS');
  QRel.Sql.Add('INNER JOIN TRANSACOES on TRANSACOES.TRANSACAO_ID =TRANSITENS.TRANSACAO_ID');
  QRel.Sql.Add('LEFT  JOIN PRODUTOS on PRODUTOS.PRODUTO_ID  = TRANSITENS.produto_id');
  QRel.Sql.Add('INNER JOIN TABELAS  on TABELAS.TABELA_ID = PRODUTOS.grupo_id AND TABELAS.TIPO_TABELA =''7'' ');
  QRel.Sql.Add('WHERE (CONDUTA =''01'') AND (DEPTO =''07'')');
  QRel.Sql.Add('AND (TIPO_VENDA = ''VENDA'')');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
  QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
  QRel.Sql.Add('AND (DT_TRANS BETWEEN  :DT_INICIAL_JUL AND :DT_FINAL_JUL)');;
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');
  QRel.Sql.Add('GROUP BY TABELAS.DESCRICAO');

  QRel.Sql.Add('UNION ALL');

  QRel.Sql.Add('SELECT  8 MES, TABELAS.DESCRICAO GRUPO, SUM(VR_TOTAL) VALOR');
  QRel.Sql.Add('FROM TRANSITENS');
  QRel.Sql.Add('INNER JOIN TRANSACOES on TRANSACOES.TRANSACAO_ID =TRANSITENS.TRANSACAO_ID');
  QRel.Sql.Add('LEFT  JOIN PRODUTOS on PRODUTOS.PRODUTO_ID  = TRANSITENS.produto_id');
  QRel.Sql.Add('INNER JOIN TABELAS  on TABELAS.TABELA_ID = PRODUTOS.grupo_id AND TABELAS.TIPO_TABELA =''7'' ');
  QRel.Sql.Add('WHERE (CONDUTA =''01'') AND (DEPTO =''07'')');
  QRel.Sql.Add('AND (TIPO_VENDA = ''VENDA'')');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
  QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
  QRel.Sql.Add('AND (DT_TRANS BETWEEN  :DT_INICIAL_AGO AND :DT_FINAL_AGO)');;
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');
  QRel.Sql.Add('GROUP BY TABELAS.DESCRICAO');

  QRel.Sql.Add('UNION ALL');

  QRel.Sql.Add('SELECT  9 MES, TABELAS.DESCRICAO GRUPO, SUM(VR_TOTAL) VALOR');
  QRel.Sql.Add('FROM TRANSITENS');
  QRel.Sql.Add('INNER JOIN TRANSACOES on TRANSACOES.TRANSACAO_ID =TRANSITENS.TRANSACAO_ID');
  QRel.Sql.Add('LEFT  JOIN PRODUTOS on PRODUTOS.PRODUTO_ID  = TRANSITENS.produto_id');
  QRel.Sql.Add('INNER JOIN TABELAS  on TABELAS.TABELA_ID = PRODUTOS.grupo_id AND TABELAS.TIPO_TABELA =''7'' ');
  QRel.Sql.Add('WHERE (CONDUTA =''01'') AND (DEPTO =''07'')');
  QRel.Sql.Add('AND (TIPO_VENDA = ''VENDA'')');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
  QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
  QRel.Sql.Add('AND (DT_TRANS BETWEEN  :DT_INICIAL_SET AND :DT_FINAL_SET)');;
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');
  QRel.Sql.Add('GROUP BY TABELAS.DESCRICAO');

  QRel.Sql.Add('UNION ALL');

  QRel.Sql.Add('SELECT  10 MES, TABELAS.DESCRICAO GRUPO, SUM(VR_TOTAL) VALOR');
  QRel.Sql.Add('FROM TRANSITENS');
  QRel.Sql.Add('INNER JOIN TRANSACOES on TRANSACOES.TRANSACAO_ID =TRANSITENS.TRANSACAO_ID');
  QRel.Sql.Add('LEFT  JOIN PRODUTOS on PRODUTOS.PRODUTO_ID  = TRANSITENS.produto_id');
  QRel.Sql.Add('INNER JOIN TABELAS  on TABELAS.TABELA_ID = PRODUTOS.grupo_id AND TABELAS.TIPO_TABELA =''7'' ');
  QRel.Sql.Add('WHERE (CONDUTA =''01'') AND (DEPTO =''07'')');
  QRel.Sql.Add('AND (TIPO_VENDA = ''VENDA'')');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
  QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
  QRel.Sql.Add('AND (DT_TRANS BETWEEN  :DT_INICIAL_OUT AND :DT_FINAL_OUT)');;
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');
  QRel.Sql.Add('GROUP BY TABELAS.DESCRICAO');

  QRel.Sql.Add('UNION ALL');

  QRel.Sql.Add('SELECT  11 MES, TABELAS.DESCRICAO GRUPO, SUM(VR_TOTAL) VALOR');
  QRel.Sql.Add('FROM TRANSITENS');
  QRel.Sql.Add('INNER JOIN TRANSACOES on TRANSACOES.TRANSACAO_ID =TRANSITENS.TRANSACAO_ID');
  QRel.Sql.Add('LEFT  JOIN PRODUTOS on PRODUTOS.PRODUTO_ID  = TRANSITENS.produto_id');
  QRel.Sql.Add('INNER JOIN TABELAS  on TABELAS.TABELA_ID = PRODUTOS.grupo_id AND TABELAS.TIPO_TABELA =''7'' ');
  QRel.Sql.Add('WHERE (CONDUTA =''01'') AND (DEPTO =''07'')');
  QRel.Sql.Add('AND (TIPO_VENDA = ''VENDA'')');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
  QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
  QRel.Sql.Add('AND (DT_TRANS BETWEEN  :DT_INICIAL_NOV AND :DT_FINAL_NOV)');;
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');
  QRel.Sql.Add('GROUP BY TABELAS.DESCRICAO');

  QRel.Sql.Add('UNION ALL');

  QRel.Sql.Add('SELECT  12 MES, TABELAS.DESCRICAO GRUPO, SUM(VR_TOTAL) VALOR');
  QRel.Sql.Add('FROM TRANSITENS');
  QRel.Sql.Add('INNER JOIN TRANSACOES on TRANSACOES.TRANSACAO_ID =TRANSITENS.TRANSACAO_ID');
  QRel.Sql.Add('LEFT  JOIN PRODUTOS on PRODUTOS.PRODUTO_ID  = TRANSITENS.produto_id');
  QRel.Sql.Add('INNER JOIN TABELAS  on TABELAS.TABELA_ID = PRODUTOS.grupo_id AND TABELAS.TIPO_TABELA =''7'' ');
  QRel.Sql.Add('WHERE (CONDUTA =''01'') AND (DEPTO =''07'')');
  QRel.Sql.Add('AND (TIPO_VENDA = ''VENDA'')');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
  QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
  QRel.Sql.Add('AND (DT_TRANS BETWEEN  :DT_INICIAL_DEZ AND :DT_FINAL_DEZ)');;
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');
  QRel.Sql.Add('GROUP BY TABELAS.DESCRICAO');



  QRel.Sql.Add(')AS TESTE');

  QRel.Sql.Add('ORDER BY MES,GRUPO');


  QRel.ParamByName('EMPRESA_ID').AsInteger      := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  QRel.ParamByName('TPCTB').AsString            := FrmData.QAcesso.FieldByName('TPCTB').AsString;
  //QRel.ParamByName('CONDUTA').AsString          := '01';
  //QRel.ParamByName('DEPTO').AsString            := '07';
  //QRel.ParamByName('TIPO_VENDA').AsString       := 'VENDA';
  QRel.ParamByName('DT_INICIAL_JAN').AsDateTime := StrToDate('01/01/' + Ano.text);
  QRel.ParamByName('DT_FINAL_JAN').AsDateTime   := StrToDate('31/01/' + Ano.text);
  QRel.ParamByName('DT_INICIAL_FEV').AsDateTime := StrToDate('01/02/' + Ano.text);
  QRel.ParamByName('DT_FINAL_FEV').AsDateTime   := StrToDate('28/02/' + Ano.text);
  QRel.ParamByName('DT_INICIAL_MAR').AsDateTime := StrToDate('01/03/' + Ano.text);
  QRel.ParamByName('DT_FINAL_MAR').AsDateTime   := StrToDate('31/03/' + Ano.text);
  QRel.ParamByName('DT_INICIAL_ABR').AsDateTime := StrToDate('01/04/' + Ano.text);
  QRel.ParamByName('DT_FINAL_ABR').AsDateTime   := StrToDate('30/04/' + Ano.text);
  QRel.ParamByName('DT_INICIAL_MAI').AsDateTime := StrToDate('01/05/' + Ano.text);
  QRel.ParamByName('DT_FINAL_MAI').AsDateTime   := StrToDate('31/05/' + Ano.text);
  QRel.ParamByName('DT_INICIAL_JUN').AsDateTime := StrToDate('01/06/' + Ano.text);
  QRel.ParamByName('DT_FINAL_JUN').AsDateTime   := StrToDate('30/06/' + Ano.text);
  QRel.ParamByName('DT_INICIAL_JUL').AsDateTime := StrToDate('01/07/' + Ano.text);
  QRel.ParamByName('DT_FINAL_JUL').AsDateTime   := StrToDate('31/07/' + Ano.text);
  QRel.ParamByName('DT_INICIAL_AGO').AsDateTime := StrToDate('01/08/' + Ano.text);
  QRel.ParamByName('DT_FINAL_AGO').AsDateTime   := StrToDate('30/08/' + Ano.text);
  QRel.ParamByName('DT_INICIAL_SET').AsDateTime := StrToDate('01/09/' + Ano.text);
  QRel.ParamByName('DT_FINAL_SET').AsDateTime   := StrToDate('30/09/' + Ano.text);
  QRel.ParamByName('DT_INICIAL_OUT').AsDateTime := StrToDate('01/10/' + Ano.text);
  QRel.ParamByName('DT_FINAL_OUT').AsDateTime   := StrToDate('31/10/' + Ano.text);
  QRel.ParamByName('DT_INICIAL_NOV').AsDateTime := StrToDate('01/11/' + Ano.text);
  QRel.ParamByName('DT_FINAL_NOV').AsDateTime   := StrToDate('30/11/' + Ano.text);
  QRel.ParamByName('DT_INICIAL_DEZ').AsDateTime := StrToDate('01/12/' + Ano.text);
  QRel.ParamByName('DT_FINAL_DEZ').AsDateTime   := StrToDate('31/12/' + Ano.text);



  QRel.Prepare;
  QRel.Open;


   QRLabel25.Caption := 'Ano: ' + ano.Text ;

  if QRel.IsEmpty then
    Application.MessageBox('Não há dados para serem impressos', PChar(Msg_Title), mb_IconInformation)
  else
    Rel_Vendas_Operador_MES_GRUPO.PreviewModal;
                                                  End
  Else   if Tipo_Rel.Text = 'Relatório por Hora' Then
  Begin


  ///



  QRel.Sql.Clear;

  QRel.Sql.Add('SELECT HORA, VALOR, CAST(CLIENTES AS INTEGER) CLIENTES');
  QRel.Sql.Add('FROM(');
  QRel.Sql.Add('SELECT ' + #39 + '00:00 a 00:59' + #39 + ' HORA,  SUM(VALOR) VALOR, COUNT(CLIENTE_ID) clientes');
  QRel.Sql.Add('FROM TRANSACOES');
  QRel.Sql.Add('WHERE (CONDUTA =:CONDUTA) AND (DEPTO =:DEPTO)');
  QRel.Sql.Add('AND (TIPO_VENDA = :TIPO_VENDA)');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');

    if FrmData.QAcesso.FieldByName('TPCTB').AsString = '2' then
    begin
      QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
      QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    end
    else
    begin
      if FrmPrincipal.config.FieldByName('TOTALIZADOR_G').AsString <> 'True'  then
      begin
        QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
        QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
      end;
    end;

  QRel.Sql.Add('AND (DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
  QRel.Sql.Add('AND (HORA BETWEEN ' + #39 + '00:00:00' + #39 + ' AND ' + #39 + '00:59:59' + #39 + ')');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

  QRel.Sql.Add('UNION ALL');
  QRel.Sql.Add('SELECT ' + #39 + '01:00 a 01:59' + #39 + ' HORA,  SUM(VALOR) VALOR, COUNT(CLIENTE_ID) clientes');
  QRel.Sql.Add('FROM TRANSACOES');
  QRel.Sql.Add('WHERE CONDUTA = :CONDUTA AND DEPTO = :DEPTO');
  QRel.Sql.Add('AND (TIPO_VENDA = :TIPO_VENDA)');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
    if FrmData.QAcesso.FieldByName('TPCTB').AsString = '2' then
    begin
      QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
      QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    end
    else
    begin
      if FrmPrincipal.config.FieldByName('TOTALIZADOR_G').AsString <> 'True'  then
      begin
        QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
        QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
      end;
    end;

  QRel.Sql.Add('AND DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL');
  QRel.Sql.Add('AND HORA BETWEEN ' + #39 + '01:00:00' + #39 + ' AND ' + #39 + '01:59:59' + #39 + '');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

  QRel.Sql.Add('UNION ALL');
  QRel.Sql.Add('SELECT ' + #39 + '02:00 a 02:59' + #39 + ' HORA,  SUM(VALOR) VALOR, COUNT(CLIENTE_ID) clientes');
  QRel.Sql.Add('FROM TRANSACOES');
  QRel.Sql.Add('WHERE CONDUTA = :CONDUTA AND DEPTO=:DEPTO');
  QRel.Sql.Add('AND (TIPO_VENDA = :TIPO_VENDA)');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
    if FrmData.QAcesso.FieldByName('TPCTB').AsString = '2' then
    begin
      QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
      QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    end
    else
    begin
      if FrmPrincipal.config.FieldByName('TOTALIZADOR_G').AsString <> 'True'  then
      begin
        QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
        QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
      end;
    end;
  QRel.Sql.Add('AND DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL');
  QRel.Sql.Add('AND HORA BETWEEN ' + #39 + '02:00:00' + #39 + ' AND ' + #39 + '02:59:59' + #39 + '');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

  QRel.Sql.Add('UNION ALL');
  QRel.Sql.Add('SELECT ' + #39 + '03:00 a 03:59' + #39 + ' HORA,  SUM(VALOR) VALOR, COUNT(CLIENTE_ID) clientes');
  QRel.Sql.Add('FROM TRANSACOES');
  QRel.Sql.Add('WHERE CONDUTA = :CONDUTA AND DEPTO= :DEPTO');
  QRel.Sql.Add('AND (TIPO_VENDA = :TIPO_VENDA)');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
    if FrmData.QAcesso.FieldByName('TPCTB').AsString = '2' then
    begin
      QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
      QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    end
    else
    begin
      if FrmPrincipal.config.FieldByName('TOTALIZADOR_G').AsString <> 'True'  then
      begin
        QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
        QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
      end;
    end;
  QRel.Sql.Add('AND DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL');
  QRel.Sql.Add('AND HORA BETWEEN ' + #39 + '03:00:00' + #39 + ' AND ' + #39 + '03:59:59' + #39 + '');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

  QRel.Sql.Add('UNION ALL');
  QRel.Sql.Add('SELECT ' + #39 + '04:00 a 04:59' + #39 + ' HORA,  SUM(VALOR) VALOR, COUNT(CLIENTE_ID) clientes');
  QRel.Sql.Add('FROM TRANSACOES');
  QRel.Sql.Add('WHERE CONDUTA = :CONDUTA AND DEPTO= :DEPTO');
  QRel.Sql.Add('AND (TIPO_VENDA = :TIPO_VENDA)');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
    if FrmData.QAcesso.FieldByName('TPCTB').AsString = '2' then
    begin
      QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
      QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    end
    else
    begin
      if FrmPrincipal.config.FieldByName('TOTALIZADOR_G').AsString <> 'True'  then
      begin
        QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
        QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
      end;
    end;
  QRel.Sql.Add('AND DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL');
  QRel.Sql.Add('AND HORA BETWEEN ' + #39 + '04:00:00' + #39 + ' AND ' + #39 + '04:59:59' + #39 + '');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

  QRel.Sql.Add('UNION ALL');
  QRel.Sql.Add('SELECT ' + #39 + '05:00 a 05:59' + #39 + ' HORA,  SUM(VALOR) VALOR, COUNT(CLIENTE_ID) clientes');
  QRel.Sql.Add('FROM TRANSACOES');
  QRel.Sql.Add('WHERE CONDUTA = :CONDUTA AND DEPTO= :DEPTO');
  QRel.Sql.Add('AND (TIPO_VENDA = :TIPO_VENDA)');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
    if FrmData.QAcesso.FieldByName('TPCTB').AsString = '2' then
    begin
      QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
      QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    end
    else
    begin
      if FrmPrincipal.config.FieldByName('TOTALIZADOR_G').AsString <> 'True'  then
      begin
        QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
        QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
      end;
    end;
  QRel.Sql.Add('AND DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL');
  QRel.Sql.Add('AND HORA BETWEEN ' + #39 + '00:05:00' + #39 + ' AND ' + #39 + '05:59:59' + #39 + '');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

  QRel.Sql.Add('UNION ALL');
  QRel.Sql.Add('SELECT ' + #39 + '06:00 a 06:59' + #39 + ' HORA,  SUM(VALOR) VALOR, COUNT(CLIENTE_ID) clientes');
  QRel.Sql.Add('FROM TRANSACOES');
  QRel.Sql.Add('WHERE CONDUTA = :CONDUTA AND DEPTO= :DEPTO');
  QRel.Sql.Add('AND (TIPO_VENDA = :TIPO_VENDA)');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
    if FrmData.QAcesso.FieldByName('TPCTB').AsString = '2' then
    begin
      QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
      QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    end
    else
    begin
      if FrmPrincipal.config.FieldByName('TOTALIZADOR_G').AsString <> 'True'  then
      begin
        QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
        QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
      end;
    end;
  QRel.Sql.Add('AND DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL');
  QRel.Sql.Add('AND HORA BETWEEN ' + #39 + '06:00:00' + #39 + ' AND ' + #39 + '06:59:59' + #39 + '');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

  QRel.Sql.Add('UNION ALL');
  QRel.Sql.Add('SELECT ' + #39 + '07:00 a 07:59' + #39 + ' HORA,  SUM(VALOR) VALOR, COUNT(CLIENTE_ID) clientes');
  QRel.Sql.Add('FROM TRANSACOES');
  QRel.Sql.Add('WHERE CONDUTA = :CONDUTA AND DEPTO= :DEPTO');
  QRel.Sql.Add('AND (TIPO_VENDA = :TIPO_VENDA)');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
    if FrmData.QAcesso.FieldByName('TPCTB').AsString = '2' then
    begin
      QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
      QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    end
    else
    begin
      if FrmPrincipal.config.FieldByName('TOTALIZADOR_G').AsString <> 'True'  then
      begin
        QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
        QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
      end;
    end;
  QRel.Sql.Add('AND DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL');
  QRel.Sql.Add('AND HORA BETWEEN ' + #39 + '07:00:00' + #39 + ' AND ' + #39 + '07:59:59' + #39 + '');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

  QRel.Sql.Add('UNION ALL');
  QRel.Sql.Add('SELECT ' + #39 + '08:00 a 08:59' + #39 + ' HORA,  SUM(VALOR) VALOR, COUNT(CLIENTE_ID) clientes');
  QRel.Sql.Add('FROM TRANSACOES');
  QRel.Sql.Add('WHERE CONDUTA = :CONDUTA AND DEPTO= :DEPTO');
  QRel.Sql.Add('AND (TIPO_VENDA = :TIPO_VENDA)');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
    if FrmData.QAcesso.FieldByName('TPCTB').AsString = '2' then
    begin
      QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
      QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    end
    else
    begin
      if FrmPrincipal.config.FieldByName('TOTALIZADOR_G').AsString <> 'True'  then
      begin
        QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
        QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
      end;
    end;
  QRel.Sql.Add('AND DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL');
  QRel.Sql.Add('AND HORA BETWEEN ' + #39 + '08:00:00' + #39 + ' AND ' + #39 + '08:59:59' + #39 + '');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

  QRel.Sql.Add('UNION ALL');
  QRel.Sql.Add('SELECT ' + #39 + '09:00 a 09:59' + #39 + ' HORA,  SUM(VALOR) VALOR, COUNT(CLIENTE_ID) clientes');
  QRel.Sql.Add('FROM TRANSACOES');
  QRel.Sql.Add('WHERE CONDUTA = :CONDUTA AND DEPTO= :DEPTO');
  QRel.Sql.Add('AND (TIPO_VENDA = :TIPO_VENDA)');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
    if FrmData.QAcesso.FieldByName('TPCTB').AsString = '2' then
    begin
      QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
      QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    end
    else
    begin
      if FrmPrincipal.config.FieldByName('TOTALIZADOR_G').AsString <> 'True'  then
      begin
        QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
        QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
      end;
    end;
  QRel.Sql.Add('AND DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL');
  QRel.Sql.Add('AND HORA BETWEEN ' + #39 + '09:00:00' + #39 + ' AND ' + #39 + '09:59:59' + #39 + '');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

  QRel.Sql.Add('UNION ALL');
  QRel.Sql.Add('SELECT ' + #39 + '10:00 a 10:59' + #39 + ' HORA,  SUM(VALOR) VALOR, COUNT(CLIENTE_ID) clientes');
  QRel.Sql.Add('FROM TRANSACOES');
  QRel.Sql.Add('WHERE CONDUTA = :CONDUTA AND DEPTO= :DEPTO');
  QRel.Sql.Add('AND (TIPO_VENDA = :TIPO_VENDA)');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
    if FrmData.QAcesso.FieldByName('TPCTB').AsString = '2' then
    begin
      QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
      QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    end
    else
    begin
      if FrmPrincipal.config.FieldByName('TOTALIZADOR_G').AsString <> 'True'  then
      begin
        QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
        QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
      end;
    end;
  QRel.Sql.Add('AND DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL');
  QRel.Sql.Add('AND HORA BETWEEN ' + #39 + '10:00:00' + #39 + ' AND ' + #39 + '10:59:59' + #39 + '');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

  QRel.Sql.Add('UNION ALL');
  QRel.Sql.Add('SELECT ' + #39 + '11:00 a 11:59' + #39 + ' HORA,  SUM(VALOR) VALOR, COUNT(CLIENTE_ID) clientes');
  QRel.Sql.Add('FROM TRANSACOES');
  QRel.Sql.Add('WHERE CONDUTA = :CONDUTA AND DEPTO= :DEPTO');
  QRel.Sql.Add('AND (TIPO_VENDA = :TIPO_VENDA)');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
    if FrmData.QAcesso.FieldByName('TPCTB').AsString = '2' then
    begin
      QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
      QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    end
    else
    begin
      if FrmPrincipal.config.FieldByName('TOTALIZADOR_G').AsString <> 'True'  then
      begin
        QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
        QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
      end;
    end;
  QRel.Sql.Add('AND DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL');
  QRel.Sql.Add('AND HORA BETWEEN ' + #39 + '11:00:00' + #39 + ' AND ' + #39 + '11:59:59' + #39 + '');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

  QRel.Sql.Add('UNION ALL');
  QRel.Sql.Add('SELECT ' + #39 + '12:00 a 12:59' + #39 + ' HORA,  SUM(VALOR) VALOR, COUNT(CLIENTE_ID) clientes');
  QRel.Sql.Add('FROM TRANSACOES');
  QRel.Sql.Add('WHERE CONDUTA = :CONDUTA AND DEPTO= :DEPTO');
  QRel.Sql.Add('AND (TIPO_VENDA = :TIPO_VENDA)');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
    if FrmData.QAcesso.FieldByName('TPCTB').AsString = '2' then
    begin
      QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
      QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    end
    else
    begin
      if FrmPrincipal.config.FieldByName('TOTALIZADOR_G').AsString <> 'True'  then
      begin
        QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
        QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
      end;
    end;
  QRel.Sql.Add('AND DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL');
  QRel.Sql.Add('AND HORA BETWEEN ' + #39 + '12:00:00' + #39 + ' AND ' + #39 + '12:59:59' + #39 + '');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

  QRel.Sql.Add('UNION ALL');
  QRel.Sql.Add('SELECT ' + #39 + '13:00 a 13:59' + #39 + ' HORA,  SUM(VALOR) VALOR, COUNT(CLIENTE_ID) clientes');
  QRel.Sql.Add('FROM TRANSACOES');
  QRel.Sql.Add('WHERE CONDUTA = :CONDUTA AND DEPTO= :DEPTO');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
    if FrmData.QAcesso.FieldByName('TPCTB').AsString = '2' then
    begin
      QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
      QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    end
    else
    begin
      if FrmPrincipal.config.FieldByName('TOTALIZADOR_G').AsString <> 'True'  then
      begin
        QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
        QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
      end;
    end;
  QRel.Sql.Add('AND (TIPO_VENDA = :TIPO_VENDA)');
  QRel.Sql.Add('AND DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL');
  QRel.Sql.Add('AND HORA BETWEEN ' + #39 + '13:00:00' + #39 + ' AND ' + #39 + '13:59:59' + #39 + '');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

  QRel.Sql.Add('UNION ALL');
  QRel.Sql.Add('SELECT ' + #39 + '14:00 a 14:59' + #39 + ' HORA,  SUM(VALOR) VALOR, COUNT(CLIENTE_ID) clientes');
  QRel.Sql.Add('FROM TRANSACOES');
  QRel.Sql.Add('WHERE CONDUTA = :CONDUTA AND DEPTO= :DEPTO');
  QRel.Sql.Add('AND (TIPO_VENDA = :TIPO_VENDA)');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
    if FrmData.QAcesso.FieldByName('TPCTB').AsString = '2' then
    begin
      QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
      QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    end
    else
    begin
      if FrmPrincipal.config.FieldByName('TOTALIZADOR_G').AsString <> 'True'  then
      begin
        QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
        QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
      end;
    end;
  QRel.Sql.Add('AND DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL');
  QRel.Sql.Add('AND HORA BETWEEN ' + #39 + '14:00:00' + #39 + ' AND ' + #39 + '14:59:59' + #39 + '');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

  QRel.Sql.Add('UNION ALL');
  QRel.Sql.Add('SELECT ' + #39 + '15:00 a 15:59' + #39 + ' HORA,  SUM(VALOR) VALOR, COUNT(CLIENTE_ID) clientes');
  QRel.Sql.Add('FROM TRANSACOES');
  QRel.Sql.Add('WHERE CONDUTA = :CONDUTA AND DEPTO= :DEPTO');
  QRel.Sql.Add('AND (TIPO_VENDA = :TIPO_VENDA)');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
    if FrmData.QAcesso.FieldByName('TPCTB').AsString = '2' then
    begin
      QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
      QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    end
    else
    begin
      if FrmPrincipal.config.FieldByName('TOTALIZADOR_G').AsString <> 'True'  then
      begin
        QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
        QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
      end;
    end;
  QRel.Sql.Add('AND DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL');
  QRel.Sql.Add('AND HORA BETWEEN ' + #39 + '15:00:00' + #39 + ' AND ' + #39 + '15:59:59' + #39 + '');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

  QRel.Sql.Add('UNION ALL');
  QRel.Sql.Add('SELECT ' + #39 + '16:00 a 16:59' + #39 + ' HORA,  SUM(VALOR) VALOR, COUNT(CLIENTE_ID) clientes');
  QRel.Sql.Add('FROM TRANSACOES');
  QRel.Sql.Add('WHERE CONDUTA = :CONDUTA AND DEPTO= :DEPTO');
  QRel.Sql.Add('AND (TIPO_VENDA = :TIPO_VENDA)');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
    if FrmData.QAcesso.FieldByName('TPCTB').AsString = '2' then
    begin
      QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
      QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    end
    else
    begin
      if FrmPrincipal.config.FieldByName('TOTALIZADOR_G').AsString <> 'True'  then
      begin
        QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
        QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
      end;
    end;
  QRel.Sql.Add('AND DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL');
  QRel.Sql.Add('AND HORA BETWEEN ' + #39 + '16:00:00' + #39 + ' AND ' + #39 + '16:59:59' + #39 + '');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

  QRel.Sql.Add('UNION ALL');
  QRel.Sql.Add('SELECT ' + #39 + '17:00 a 17:59' + #39 + ' HORA,  SUM(VALOR) VALOR, COUNT(CLIENTE_ID) clientes');
  QRel.Sql.Add('FROM TRANSACOES');
  QRel.Sql.Add('WHERE CONDUTA = :CONDUTA AND DEPTO= :DEPTO');
  QRel.Sql.Add('AND (TIPO_VENDA = :TIPO_VENDA)');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
    if FrmData.QAcesso.FieldByName('TPCTB').AsString = '2' then
    begin
      QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
      QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    end
    else
    begin
      if FrmPrincipal.config.FieldByName('TOTALIZADOR_G').AsString <> 'True'  then
      begin
        QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
        QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
      end;
    end;
  QRel.Sql.Add('AND DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL');
  QRel.Sql.Add('AND HORA BETWEEN ' + #39 + '17:00:00' + #39 + ' AND ' + #39 + '17:59:59' + #39 + '');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

  QRel.Sql.Add('UNION ALL');
  QRel.Sql.Add('SELECT ' + #39 + '18:00 a 18:59' + #39 + ' HORA,  SUM(VALOR) VALOR, COUNT(CLIENTE_ID) clientes');
  QRel.Sql.Add('FROM TRANSACOES');
  QRel.Sql.Add('WHERE CONDUTA = :CONDUTA AND DEPTO= :DEPTO');
  QRel.Sql.Add('AND (TIPO_VENDA = :TIPO_VENDA)');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
    if FrmData.QAcesso.FieldByName('TPCTB').AsString = '2' then
    begin
      QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
      QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    end
    else
    begin
      if FrmPrincipal.config.FieldByName('TOTALIZADOR_G').AsString <> 'True'  then
      begin
        QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
        QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
      end;
    end;
  QRel.Sql.Add('AND DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL');
  QRel.Sql.Add('AND HORA BETWEEN ' + #39 + '18:00:00' + #39 + ' AND ' + #39 + '18:59:59' + #39 + '');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

  QRel.Sql.Add('UNION ALL');
  QRel.Sql.Add('SELECT ' + #39 + '19:00 a 19:59' + #39 + ' HORA,  SUM(VALOR) VALOR, COUNT(CLIENTE_ID) clientes');
  QRel.Sql.Add('FROM TRANSACOES');
  QRel.Sql.Add('WHERE CONDUTA = :CONDUTA AND DEPTO= :DEPTO');
  QRel.Sql.Add('AND (TIPO_VENDA = :TIPO_VENDA)');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
    if FrmData.QAcesso.FieldByName('TPCTB').AsString = '2' then
    begin
      QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
      QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    end
    else
    begin
      if FrmPrincipal.config.FieldByName('TOTALIZADOR_G').AsString <> 'True'  then
      begin
        QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
        QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
      end;
    end;
  QRel.Sql.Add('AND DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL');
  QRel.Sql.Add('AND HORA BETWEEN ' + #39 + '19:00:00' + #39 + ' AND ' + #39 + '19:59:59' + #39 + '');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

  QRel.Sql.Add('UNION ALL');
  QRel.Sql.Add('SELECT ' + #39 + '20:00 a 20:59' + #39 + ' HORA,  SUM(VALOR) VALOR, COUNT(CLIENTE_ID) clientes');
  QRel.Sql.Add('FROM TRANSACOES');
  QRel.Sql.Add('WHERE CONDUTA = :CONDUTA AND DEPTO= :DEPTO');
  QRel.Sql.Add('AND (TIPO_VENDA = :TIPO_VENDA)');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
    if FrmData.QAcesso.FieldByName('TPCTB').AsString = '2' then
    begin
      QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
      QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    end
    else
    begin
      if FrmPrincipal.config.FieldByName('TOTALIZADOR_G').AsString <> 'True'  then
      begin
        QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
        QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
      end;
    end;
  QRel.Sql.Add('AND DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL');
  QRel.Sql.Add('AND HORA BETWEEN ' + #39 + '20:00:00' + #39 + ' AND ' + #39 + '20:59:59' + #39 + '');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

  QRel.Sql.Add('UNION ALL');
  QRel.Sql.Add('SELECT ' + #39 + '21:00 a 21:59' + #39 + ' HORA,  SUM(VALOR) VALOR, COUNT(CLIENTE_ID) clientes');
  QRel.Sql.Add('FROM TRANSACOES');
  QRel.Sql.Add('WHERE CONDUTA = :CONDUTA AND DEPTO= :DEPTO');
  QRel.Sql.Add('AND (TIPO_VENDA = :TIPO_VENDA)');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
    if FrmData.QAcesso.FieldByName('TPCTB').AsString = '2' then
    begin
      QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
      QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    end
    else
    begin
      if FrmPrincipal.config.FieldByName('TOTALIZADOR_G').AsString <> 'True'  then
      begin
        QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
        QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
      end;
    end;
  QRel.Sql.Add('AND DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL');
  QRel.Sql.Add('AND HORA BETWEEN ' + #39 + '21:00:00' + #39 + ' AND ' + #39 + '21:59:59' + #39 + '');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

  QRel.Sql.Add('UNION ALL ');
  QRel.Sql.Add('SELECT ' + #39 + '22:00 a 22:59' + #39 + ' HORA,  SUM(VALOR) VALOR, COUNT(CLIENTE_ID) clientes');
  QRel.Sql.Add('FROM TRANSACOES');
  QRel.Sql.Add('WHERE CONDUTA = :CONDUTA AND DEPTO= :DEPTO');
  QRel.Sql.Add('AND (TIPO_VENDA = :TIPO_VENDA)');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
    if FrmData.QAcesso.FieldByName('TPCTB').AsString = '2' then
    begin
      QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
      QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    end
    else
    begin
      if FrmPrincipal.config.FieldByName('TOTALIZADOR_G').AsString <> 'True'  then
      begin
        QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
        QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
      end;
    end;
  QRel.Sql.Add('AND DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL');
  QRel.Sql.Add('AND HORA BETWEEN ' + #39 + '22:00:00' + #39 + ' AND ' + #39 + '22:59:59' + #39 + '');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');

  QRel.Sql.Add('UNION ALL');
  QRel.Sql.Add('SELECT ' + #39 + '23:00 a 23:59' + #39 + ' HORA,  SUM(VALOR) VALOR, COUNT(CLIENTE_ID) clientes');
  QRel.Sql.Add('FROM TRANSACOES');
  QRel.Sql.Add('WHERE CONDUTA = :CONDUTA AND DEPTO= :DEPTO');
  QRel.Sql.Add('AND (TIPO_VENDA = :TIPO_VENDA)');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
    if FrmData.QAcesso.FieldByName('TPCTB').AsString = '2' then
    begin
      QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
      QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    end
    else
    begin
      if FrmPrincipal.config.FieldByName('TOTALIZADOR_G').AsString <> 'True'  then
      begin
        QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
        QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
      end;
    end;
  QRel.Sql.Add('AND DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL');
  QRel.Sql.Add('AND HORA BETWEEN ' + #39 + '23:00:00' + #39 + ' AND ' + #39 + '23:59:59' + #39 + '');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
  QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE))');
  QRel.Sql.Add(') AS CONSULTA');
  QRel.Sql.Add('WHERE CLIENTES > 0');
  QRel.Sql.Add('ORDER BY HORA');

  QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  QRel.ParamByName('CONDUTA').AsString      := '01';
  QRel.ParamByName('DEPTO').AsString        := '07';
  QRel.ParamByName('TIPO_VENDA').AsString   := 'VENDA';
 // QRel.ParamByName('MODELO_01').AsString    := '65';
 // QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
  QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
  QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;

  QRel.Prepare;
  QRel.Open;



  QRLabel13.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;

    if QRel.IsEmpty then
      Application.MessageBox('Não há dados para serem impressos', PChar(Msg_Title), mb_IconInformation)
    else
      Rel_Vendas_Operador.PreviewModal;
  End
  else
  Application.MessageBox('Favor selecionar o tipo do relatório', PChar(Msg_Title), mb_IconInformation);

end;

procedure TFrmRel_Flash_de_vendas_horario.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRel_Flash_de_vendas_horario.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmRel_Flash_de_vendas_horario.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
  //  Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmRel_Flash_de_vendas_horario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmRel_Flash_de_vendas_horario.FormCreate(Sender: TObject);
begin

  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);
  Ano.Value     := StrToInt(Copy(DateToStr(date), 7, 4));


end;

procedure TFrmRel_Flash_de_vendas_horario.OperadorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmRel_Flash_de_vendas_horario.QRGroup2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin

    IF QRel.FieldByName('MES').AsInteger = 1 Then
    QRlabel22.Caption := 'Janeiro'
    Else IF QRel.FieldByName('MES').AsInteger = 2 Then
    QRlabel22.Caption := 'Fevereiro'
    Else IF QRel.FieldByName('MES').AsInteger = 3 Then
    QRlabel22.Caption := 'Março'
    Else IF QRel.FieldByName('MES').AsInteger = 4 Then
    QRlabel22.Caption := 'Abril' ;

end;

end.
