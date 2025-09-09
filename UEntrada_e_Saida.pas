unit UEntrada_e_Saida;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, StdCtrls, Buttons, ExtCtrls, DBCtrls,
  rxCurrEdit, Mask, rxToolEdit, QRCtrls, QuickRpt, RDprint, Printers,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmEntrada_e_Saida = class(TForm)
    Label1: TLabel;
    Dtmen: TDateEdit;
    Dtmai: TDateEdit;
    Bevel1: TBevel;
    btnExecuta: TBitBtn;
    btnRetorna: TBitBtn;
    DataCliente: TDataSource;
    Rel_Vendas_Mensal_Analitico: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    QRSysData1: TQRSysData;
    Cabec: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    QRLabel7: TQRLabel;
    QRShape2: TQRShape;
    QRLabel10: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRDBText19: TQRDBText;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    QRDBText3: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRShape3: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape4: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel14: TQRLabel;
    QRBand2: TQRBand;
    QRLabel11: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRShape5: TQRShape;
    QRDBText5: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRShape6: TQRShape;
    QRLabel19: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText18: TQRDBText;
    QRMemo2: TQRMemo;
    QRBand3: TQRBand;
    QRSysData3: TQRSysData;
    QRExpr2: TQRExpr;
    QRLabel31: TQRLabel;
    QRLabel23: TQRLabel;
    QRDBText20: TQRDBText;
    Rel_Vendas_Mensal_Sintetico: TQuickRep;
    QRBand4: TQRBand;
    QRDBText21: TQRDBText;
    QRSysData4: TQRSysData;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRLabel26: TQRLabel;
    QRSysData5: TQRSysData;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRDBText22: TQRDBText;
    QRLabel39: TQRLabel;
    QRBand5: TQRBand;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    SummaryBand1: TQRBand;
    QRShape9: TQRShape;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRSysData6: TQRSysData;
    CheckBox1: TCheckBox;
    RDprint1: TRDprint;
    Tipo: TComboBox;
    Label2: TLabel;
    QParcelas: TFDQuery;
    QItens: TFDQuery;
    QCliente: TFDQuery;
    IQuery: TFDQuery;
    QRel: TFDQuery;
    QVenciemento: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    procedure btnRetornaClick(Sender: TObject);
    procedure DtmenEnter(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure RDprint1NewPage(Sender: TObject; Pagina: Integer);

  private
    { Private declarations }
  public
    { Public declarations }



  end;

var
  FrmEntrada_e_Saida: TFrmEntrada_e_Saida;
  linha, pagina: integer;
  Total, Subtotal, Total_IPI, Total_Frete, Total_Subtotal, Total_Desconto, Total_Acrescimo, Total_Geral, Soma: Real;
  contaQuebra: string;

implementation

uses
  UConsulta, UPrincipal, UData;

{$R *.dfm}






procedure TFrmEntrada_e_Saida.btnExecutaClick(Sender: TObject);
var
Total_Entrada, Total_Saida: Real;
begin
// 229, 325
  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;
           

          QRel.Sql.Clear;
          QRel.SQL.Add('SELECT DATAS, NUM_DOC , SUM(ENTRADA) ENTRADA, SUM(SAIDA) SAIDA');
          QRel.SQL.Add('FROM (');
          QRel.SQL.Add('SELECT NUM_DOC, DT_ENT_SAI DATAS,');
          QRel.SQL.Add('SUM(TRANSITENS.VR_TOTAL + TRANSITENS.VALOR_ICMS_ST + TRANSITENS.VR_FRETE + TRANSITENS.VR_ACRESCIMO + TRANSITENS.VR_IPI - TRANSITENS.DESC_RODAPE) SAIDA, 0 ENTRADA');
          QRel.SQL.Add('FROM TRANSITENS');
          QRel.SQL.Add('INNER JOIN TRANSACOES');
          QRel.SQL.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
          QRel.SQL.Add('INNER JOIN PRODUTOS');
          QRel.SQL.Add('ON (TRANSITENS.PRODUTO_ID = PRODUTOS.PRODUTO_ID)');
         // QRel.SQL.Add('INNER JOIN TABELAS');
         // QRel.SQL.Add('ON  (CAST (PRODUTOS.GRUPO_ID AS VARCHAR(1))  = CAST (TABELAS.TABELA_ID AS VARCHAR(1)) AND TABELAS.TIPO_TABELA   = :TIPO_TABELA)');
          QRel.SQL.Add('LEFT JOIN NOTAS_CANCELADAS');
          QRel.SQL.Add('ON (TRANSACOES.TRANSACAO_ID = NOTAS_CANCELADAS.TRANSACAO_ID)');
          QRel.SQL.Add('WHERE');
          QRel.SQL.Add('(TRANSACOES.DT_ENT_SAI BETWEEN :DT_INICIAL AND :DT_FINAL)');
          QRel.SQL.Add('AND (TRANSACOES.CONDUTA = :CONDUTA)');
          QRel.SQL.Add('AND (TRANSACOES.TIPO_VENDA = :TIPO_VENDA)');
          QRel.SQL.Add('AND (TRANSACOES.DEPTO = :DEPTO)');
          QRel.SQL.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
          QRel.SQL.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
          QRel.SQL.Add('AND (NOTAS_CANCELADAS.TRANSACAO_ID IS NULL)');
          QRel.SQL.Add('GROUP BY NUM_DOC, DT_ENT_SAI');
          QRel.SQL.Add('UNION ALL');
          QRel.SQL.Add('SELECT NUM_DOC, DT_ENT_SAI DATAS, 0 SAIDA, SUM(TRANSITENS.VR_TOTAL + TRANSITENS.VALOR_ICMS_ST + TRANSITENS.VR_FRETE + TRANSITENS.VR_ACRESCIMO + TRANSITENS.VR_IPI - TRANSITENS.DESC_RODAPE) ENTRADA');
          QRel.SQL.Add('FROM TRANSITENS');
          QRel.SQL.Add('INNER JOIN TRANSACOES');
          QRel.SQL.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
          QRel.SQL.Add('INNER JOIN PRODUTOS');
          QRel.SQL.Add('ON (TRANSITENS.PRODUTO_ID = PRODUTOS.PRODUTO_ID)');
        //  QRel.SQL.Add('INNER JOIN TABELAS');
        //  QRel.SQL.Add('ON (CAST(PRODUTOS.GRUPO_ID AS VARCHAR(1))  = CAST(TABELAS.TABELA_ID AS VARCHAR(1)) AND TABELAS.TIPO_TABELA  = :TIPO_TABELA)');
          QRel.SQL.Add('LEFT JOIN NOTAS_CANCELADAS');
          QRel.SQL.Add('ON (TRANSACOES.TRANSACAO_ID = NOTAS_CANCELADAS.TRANSACAO_ID)');
          QRel.SQL.Add('WHERE');
          QRel.SQL.Add('(TRANSACOES.DT_ENT_SAI BETWEEN :DT_INICIAL AND :DT_FINAL)');
          QRel.SQL.Add('AND (TRANSACOES.CONDUTA = :CONDUTA_DOIS)');
          QRel.SQL.Add('AND (TRANSACOES.DEPTO = :DEPTO)');
          QRel.SQL.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
          QRel.SQL.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
          QRel.SQL.Add('AND (TRANSACOES.TIPO_COMPRA = :TIPO_COMPRA)');
          QRel.SQL.Add('AND (NOTAS_CANCELADAS.TRANSACAO_ID IS NULL)');
          QRel.SQL.Add('GROUP BY NUM_DOC, DT_ENT_SAI');
          QRel.SQL.Add(') AS TESTE ');
          QRel.SQL.Add('GROUP BY DATAS, NUM_DOC');

          QRel.ParamByName('DT_INICIAL').AsDateTime  := Dtmen.Date;
          QRel.ParamByName('DT_FINAL').AsDateTime    := Dtmai.Date;
          QRel.ParamByName('CONDUTA').AsString       := '01';
          QRel.ParamByName('DEPTO').AsString         := '07';
         // QRel.ParamByName('TIPO_TABELA').AsString   := '7';
          QRel.ParamByName('CONDUTA_DOIS').AsString  := '02';
          QRel.ParamByName('TIPO_VENDA').AsString    := 'VENDA';
          QRel.ParamByName('TIPO_COMPRA').AsString   := 'COMPRA';
          QRel.ParamByName('TPCTB').AsString         := FrmData.QAcesso.FieldByName('TPCTB').AsString;;
          QRel.ParamByName('EMPRESA_ID').AsInteger   := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;

          QRel.Prepare;
          QRel.Open;


      if QRel.IsEmpty then
       Application.MessageBox('Não há dados para os parâmetros informados', PChar(Msg_Title), mb_IconInformation)
      else
      begin

          if Tipo.Text  = 'Analítico' then
          begin

                if CheckBox1.Checked = True then
                Begin
                 RDprint1.Impressora := HP;
                 RDprint1.FonteTamanhoPadrao := S10cpp;
                End;

                RDprint1.TamanhoQteColunas := 80;
                RDprint1.OpcoesPreview.Preview     := True;
                RDprint1.MostrarProgresso          := True;
                RDprint1.Acentuacao                := SemAcento;
                RDprint1.TamanhoQteLinhas          := 1;
                RDprint1.Abrir;

                QRel.First;
                while not QRel.Eof do
                begin

                    RDprint1.ImpF(linha,01, DateToStr( QRel.FieldByName('DATAS').AsDateTime ), []);
                    RDprint1.ImpVal(linha,20,'###,##0.00', QRel.FieldByName('ENTRADA').AsFloat,[]);
                    RDprint1.ImpVal(linha,36,'###,##0.00', QRel.FieldByName('SAIDA').AsFloat,[]);

                    if QRel.FieldByName('SAIDA').AsFloat > 0 then                    
                       RDprint1.ImpF(linha,54, QRel.FieldByName('NUM_DOC').AsString, []);

                    Total_Entrada := Total_Entrada + QRel.FieldByName('ENTRADA').AsFloat;
                    Total_Saida   := Total_Saida   + QRel.FieldByName('SAIDA').AsFloat;


                    if linha > 63  then
                    Begin
                     RDprint1.Novapagina;
                     Pagina := Pagina + 1;
                    End;


                 Inc(linha);
                 QRel.Next;
                end;

                    if linha > 66  then
                    Begin
                     RDprint1.Novapagina;
                     Pagina := Pagina + 1;
                    End;

                RDprint1.LinhaH(linha, 20, 30, 0, False);
                RDprint1.LinhaH(linha, 36, 46, 0, False);
                Inc(linha);


                RDprint1.ImpVal(linha,20,'###,##0.00', Total_Entrada, []);
                RDprint1.ImpVal(linha,36,'###,##0.00', Total_Saida, []);

                Total_Entrada := 0;
                Total_Saida   := 0;                

                Application.ProcessMessages;
                RDprint1.TamanhoQteLinhas:= 66;
                RDprint1.Fechar;

          end
          else if Tipo.Text = 'Sintético' then
          begin
                if CheckBox1.Checked = True then
                Begin
                 RDprint1.Impressora := HP;
                 RDprint1.FonteTamanhoPadrao := S10cpp;
                End;

                
                RDprint1.TamanhoQteColunas :=80;
                RDprint1.OpcoesPreview.Preview     := True;
                RDprint1.MostrarProgresso          := True;
                RDprint1.Acentuacao                := SemAcento;
                RDprint1.TamanhoQteLinhas          := 1;
                RDprint1.Abrir;

                if linha > 66  then
                Begin
                 RDprint1.Novapagina;
                 Pagina := Pagina + 1;
                End;

                Total_Entrada := 0;
                Total_Saida   := 0;

                QRel.First;
                while not QRel.Eof do
                begin
                    Total_Entrada := Total_Entrada + QRel.FieldByName('ENTRADA').AsFloat;
                    Total_Saida   := Total_Saida   + QRel.FieldByName('SAIDA').AsFloat;

                  QRel.Next;
                end;

                RDprint1.ImpF(linha,20, 'Entrada '+ FormatFloat('#,##0.00', Total_Entrada), []);
                RDprint1.ImpF(linha,50, 'Saída '+ FormatFloat('#,##0.00', Total_Saida), []);

                Application.ProcessMessages;
                RDprint1.TamanhoQteLinhas:= 66;
                RDprint1.Fechar;
          end;

      end;

  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;

procedure TFrmEntrada_e_Saida.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmEntrada_e_Saida.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmEntrada_e_Saida.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
   // Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmEntrada_e_Saida.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmEntrada_e_Saida.FormCreate(Sender: TObject);
begin
  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);
end;

procedure TFrmEntrada_e_Saida.RDprint1NewPage(Sender: TObject; Pagina: Integer);
begin

      if Tipo.Text = 'Analítico' then
      begin
            RDprint1.Imp(01, 01, FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString);
            RDprint1.ImpDir(01, (length(FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString)), 80, 'Sistema de Automação de empresas Eficaz', []);
            RDprint1.Imp(02, 01, 'Data/Hora: ' + DateToStr(date) + ' - ' + TimeToStr(now));
            RDprint1.impDir(02, 80, 80, 'Página: ' + IntToStr(Pagina), []);
            RDprint1.imp(03, 01, 'Período:'+ datetoStr(dtmen.date) + ' à ' + datetoStr(dtmai.date));
            RDprint1.impF(04, 26, '*** Rel. Entrada e Saída ***',[negrito]);

            RDprint1.LinhaH(05, 01, 80, 0, False);
             RDprint1.impF(06, 01, 'Data',[]);
             RDprint1.impF(06, 25, 'Entrada',[]);
             RDprint1.impF(06, 41, 'Saída',[]);
             RDprint1.impF(06, 54, 'Num. Doc.',[]);
            RDprint1.LinhaH(07, 01, 80, 0, False);

            Linha := 08;

      end
      else if Tipo.Text = 'Sintético' then
      begin
              RDprint1.Imp(01, 01, FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString);
              RDprint1.ImpDir(01, (length(FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString)), 80, 'Sistema de Automação de empresas Eficaz', []);
              RDprint1.Imp(02, 01, 'Data/Hora: ' + DateToStr(date) + ' - ' + TimeToStr(now));
              RDprint1.impDir(02, 80, 80, 'Página: ' + IntToStr(Pagina), []);
              RDprint1.imp(03, 01, 'Período:'+ datetoStr(dtmen.date) + ' à ' + datetoStr(dtmai.date));
              RDprint1.impF(04, 26, '*** Rel. Entrada e Saída ***',[negrito]);
              RDprint1.LinhaH(05, 01, 80, 0, false);
              Linha := 07;
      end;



end;

end.

