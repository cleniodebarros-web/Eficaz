unit UComparacaoCST_PIS_COFINS;

interface


uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, rxCurrEdit, rxToolEdit, Buttons, DBCtrls,
  DB, IBCustomDataSet, IBQuery, QuickRpt, QRCtrls, RDprint, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmComparacaoCST_PIS_COFINS = class(TForm)
    Bevel1: TBevel;
    Orcamentos: TQuickRep;
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
    QRDBText2: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabel10: TQRLabel;
    QRShape4: TQRShape;
    QRLabel7: TQRLabel;
    QRDBText1: TQRDBText;
    QRExpr2: TQRExpr;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRGroup1: TQRGroup;
    QRDBText9: TQRDBText;
    QRBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr6: TQRExpr;
    QRShape2: TQRShape;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRLabel9: TQRLabel;
    QRDBText10: TQRDBText;
    RDprint1: TRDprint;
    CheckBox1: TCheckBox;
    lbl1: TLabel;
    Produto: TCurrencyEdit;
    btnProduto: TSpeedButton;
    DBText4: TDBText;
    DataProduto: TDataSource;
    QRel: TFDQuery;
    Qproduto: TFDQuery;
    procedure btnRetornaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure RDprint1NewPage(Sender: TObject; Pagina: Integer);
    procedure ProdutoExit(Sender: TObject);
    procedure ProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnProdutoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SearchProduto;
    procedure btnExecutaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmComparacaoCST_PIS_COFINS: TFrmComparacaoCST_PIS_COFINS;
  Pagina, linha, C1, C2, C3, C4, C5, C6, C7, C8 : Integer;
  Condicao : String;
  Sub_Valor_Produtos, Sub_VR_Desconto, Sub_VR_Acrescimo, Sub_Valor,
  Total_Valor_Produtos, Total_VR_Desconto, Total_VR_Acrescimo, Total_Valor: Real;

implementation

uses
  UData, UConsulta, UPrincipal;

{$R *.dfm}


procedure TFrmComparacaoCST_PIS_COFINS.btnExecutaClick(Sender: TObject);
begin
try


    if Produto.Value > 0 then
    begin
     QRel.Sql.Clear;
     QRel.Sql.Add('SELECT DISTINCT');
     QRel.Sql.Add('CST_PIS_ENTR AS CST_PIS_ENTRADA, CST_COFINS_ENTR AS CST_COFINS_ENTRADA,');
     QRel.SQL.Add('PIS_ENTR AS ALIQUOTA_PIS_ENTRADA,');
     QRel.Sql.Add('COFINS_ENTR AS ALIQUOTA_COFINS_ENTRADA, CST_PIS AS CST_PIS_SAIDA,  CST_COFINS AS CST_COFINS_SAIDA,');
     QRel.Sql.Add('PIS AS ALIQUOTA_PIS_SAIDA , COFINS AS ALIQUOTA_COFINS_SAIDA FROM PRODUTOS');

     QRel.Sql.Add('WHERE PRODUTO_ID = :PRODUTO_ID');
     QRel.ParamByName('PRODUTO_ID').AsInteger := StrToInt(Produto.Text);
    end
    else
    begin
       QRel.Sql.Clear;
       QRel.Sql.Add('SELECT DISTINCT');
       QRel.Sql.Add('CST_PIS_ENTR AS CST_PIS_ENTRADA, CST_COFINS_ENTR AS CST_COFINS_ENTRADA,');
       QRel.SQL.Add('PIS_ENTR AS ALIQUOTA_PIS_ENTRADA,');
       QRel.Sql.Add('COFINS_ENTR AS ALIQUOTA_COFINS_ENTRADA, CST_PIS AS CST_PIS_SAIDA,  CST_COFINS AS CST_COFINS_SAIDA,');
       QRel.Sql.Add('PIS AS ALIQUOTA_PIS_SAIDA , COFINS AS ALIQUOTA_COFINS_SAIDA FROM PRODUTOS');
    end;


  QRel.Prepare;
  QRel.Open;

    if(Produto.Value > 0) then
      begin
         QProduto.Sql.Clear;
         QProduto.Sql.Add('SELECT DESCRICAO FROM PRODUTOS WHERE PRODUTO_ID =:PRODUTO_ID');
         QProduto.ParamByName('PRODUTO_ID').AsInteger := StrToInt(Produto.text);
         QProduto.Prepare;
         QProduto.Open;
      end;


    if QRel.IsEmpty then
      Application.MessageBox('Não há dados para serem impressos', PChar(Msg_Title), mb_IconInformation)
    else
      Begin
          if CheckBox1.Checked = True then
          Begin
           RDprint1.Impressora := HP;
           RDprint1.FonteTamanhoPadrao := S10cpp;
          End;

          RDprint1.TamanhoQteColunas :=130;
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

        while not QRel.Eof do
        Begin

          RDprint1.ImpD(linha, C1+7, QRel.FieldByName('CST_PIS_ENTRADA').AsString,[]);
          RDprint1.Imp(linha, C2+8, QRel.FieldByName('CST_COFINS_ENTRADA').AsString);
          RDprint1.ImpVal(linha,C3-2,',###,##0.00', QRel.FieldByName('ALIQUOTA_PIS_ENTRADA').AsFloat, []);
          RDprint1.ImpVal(linha,C4,',###,##0.00', QRel.FieldByName('ALIQUOTA_COFINS_ENTRADA').AsFloat, []);

          RDprint1.ImpD(linha, C5+7, QRel.FieldByName('CST_PIS_SAIDA').AsString,[]);
          RDprint1.Imp(linha, C6+8, QRel.FieldByName('CST_COFINS_SAIDA').AsString);
          RDprint1.ImpVal(linha,C7-2,',###,##0.00', QRel.FieldByName('ALIQUOTA_PIS_SAIDA').AsFloat, []);
          RDprint1.ImpVal(linha,C8+1,',###,##0.00', QRel.FieldByName('ALIQUOTA_COFINS_SAIDA').AsFloat, []);


         if linha > 63  then
          Begin
           RDprint1.Novapagina;
           Pagina := Pagina + 1;
          End;

          Inc(linha);
          QRel.Next;
        End;

        Application.ProcessMessages;
        RDprint1.TamanhoQteLinhas:= 66;
        RDprint1.Fechar;

      End;




  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;


procedure TFrmComparacaoCST_PIS_COFINS.RDprint1NewPage(Sender: TObject;
  Pagina: Integer);
begin
       //posição das colulas
       C1 := 01;
       C2 := 10;
       C3 := 25;
       C4 := 45;
       C5 := 63;
       C6 := 80;
       C7 := 100;
       C8 := 118;

      RDprint1.Imp(01, 01, FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString);
      RDprint1.ImpDir(01, (length(FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString)), 130, 'Sistema de Automação de empresas Eficaz', []);
      RDprint1.Imp(02, 01, 'Data/Hora: ' + DateToStr(date) + ' - ' + TimeToStr(now));
      RDprint1.impDir(02, 80, 130, 'Página: ' + IntToStr(Pagina), []);
      RDprint1.impC(03, 60, '*** COMPARAÇÃO DE CST - PIS - COFINS ***',[negrito]);
      RDprint1.LinhaH(04,01,130,0,false);

      if(Produto.Value > 0) then
      begin
         RDprint1.impF(05, C1, 'PRODUTO: '+QProduto.FieldByName('DESCRICAO').AsString,[negrito]);
      end;



      RDprint1.impF(06, C1, 'ENTRADA',[negrito]);
      RDprint1.LinhaH(07,C1,56,0,false);

      RDprint1.impF(06, C5, 'SAÍDA',[negrito]);
      RDprint1.LinhaH(07,C5,130,0,false);

      RDprint1.impF(08, C1, 'CST PIS',[negrito]);
      RDprint1.impF(08, C2, 'CST COFINS',[negrito]);
      RDprint1.impF(08, C3, 'ALIQ. PIS',[negrito]);
      RDprint1.impF(08, C4-1, 'ALIQ. COFINS',[negrito]);

      RDprint1.impF(08, C5, 'CST PIS',[negrito]);
      RDprint1.impF(08, C6, 'CST COFINS',[negrito]);
      RDprint1.impF(08, C7, 'ALIQ. PIS',[negrito]);
      RDprint1.impF(08, C8, 'ALIQ. COFINS',[negrito]);

      linha := 09;
end;

procedure TFrmComparacaoCST_PIS_COFINS.btnProdutoClick(Sender: TObject);
begin
try
    Produto.Value := GetConsulta('ESTOQUE', 1, 0 , StrToInt(Produto.Text));
  except
    Produto.Value := GetConsulta('ESTOQUE', 0, 0, 0);
  end;
end;

procedure TFrmComparacaoCST_PIS_COFINS.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmComparacaoCST_PIS_COFINS.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmComparacaoCST_PIS_COFINS.ProdutoExit(Sender: TObject);
begin
SearchProduto;
end;

procedure TFrmComparacaoCST_PIS_COFINS.ProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if (Key = Vk_F7) and (Sender = Produto) then
    btnProdutoClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmComparacaoCST_PIS_COFINS.SearchProduto;
begin
  if Produto.Value > 0 then
  Begin
    QProduto.SQL.Clear;
    QProduto.SQL.Add('SELECT * FROM PRODUTOS');
    QProduto.SQL.Add('WHERE');
    QProduto.SQL.Add('(PRODUTO_ID = :PRODUTO_ID)');
    QProduto.SQL.Add('AND (EMPRESA_ID = :EMPRESA_ID)');
    QProduto.SQL.Add('AND STATUS = :STATUS');

    QProduto.ParamByName('PRODUTO_ID').AsInteger := StrToInt(Produto.Text);
    QProduto.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    QProduto.ParamByName('STATUS').AsString := 'A';

    QProduto.Prepare;
    QProduto.Open;
  End;
end;


procedure TFrmComparacaoCST_PIS_COFINS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmComparacaoCST_PIS_COFINS.FormShow(Sender: TObject);
begin
 Produto.SetFocus;
end;

end.
