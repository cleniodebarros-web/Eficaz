unit UTributacaoDeProdutos;

interface


uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, rxCurrEdit, rxToolEdit, Buttons, DBCtrls,
  DB, IBCustomDataSet, IBQuery, QuickRpt, QRCtrls, RDprint, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmTributacaoDeProdutos = class(TForm)
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
    QProduto: TFDQuery;
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
  FrmTributacaoDeProdutos: TFrmTributacaoDeProdutos;
  Pagina, linha, C1, C2, C3, C4, C5, C6, C7, C8 : Integer;
  Condicao : String;
  Sub_Valor_Produtos, Sub_VR_Desconto, Sub_VR_Acrescimo, Sub_Valor,
  Total_Valor_Produtos, Total_VR_Desconto, Total_VR_Acrescimo, Total_Valor: Real;

implementation

uses
  UData, UConsulta, UPrincipal;

{$R *.dfm}


procedure TFrmTributacaoDeProdutos.btnExecutaClick(Sender: TObject);
begin
try


     QRel.Sql.Clear;
     QRel.Sql.Add('SELECT DISTINCT');
     QRel.Sql.Add('TRIM(DESCRICAO) AS DESCRICAO,');
     QRel.Sql.Add('(SELECT TRIBUTACAO FROM TRIBUTOS WHERE TRIBUTO_ID=PRODUTOS.TRIBUTO_ID) AS CST_ICMS,');
     QRel.SQL.Add('ALIQUOTA_ICMS, REDUCAO_ICMS, CST_PIS_ENTR AS CST_PIS_COFINS_ENTRADA, CST_PIS AS CST_PIS_COFINS_SAIDA');
     QRel.Sql.Add('FROM PRODUTOS');

      if Produto.Value > 0 then
      begin
       QRel.Sql.Add('WHERE PRODUTO_ID = :PRODUTO_ID');
       QRel.ParamByName('PRODUTO_ID').AsInteger := StrToInt(Produto.Text);
      end
      else
      begin
        QRel.Sql.Add('WHERE PRODUTO_ID <> :PRODUTO_ID');
        QRel.ParamByName('PRODUTO_ID').AsInteger := 0;
      end;

      if StrToInt(LeIni(Arq_Ini, 'Sistema', 'Localização')) > 0 then
      begin
        QRel.Sql.Add('AND (LOCALIZACAO_ID = :LOCALIZACAO_ID)');
        QRel.ParamByName('LOCALIZACAO_ID').AsInteger := StrToInt(LeIni(Arq_Ini, 'Sistema', 'Localização'));
      end;

      if StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Fornecedor')) > 0 then
      begin
        QRel.Sql.Add('AND (FORNECEDOR_ID = :FORNECEDOR_ID)');
        QRel.ParamByName('FORNECEDOR_ID').AsInteger := StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Fornecedor'));
      end;

      if StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Grupo')) > 0 then
      begin
        QRel.Sql.Add('AND (GRUPO_ID = :GRUPO_ID)');
        QRel.ParamByName('GRUPO_ID').AsInteger := StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Grupo'));
      end;

      if StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'SubTipo')) > 0 then
      begin
        QRel.Sql.Add('AND (SUBTIPO_ID = :SUBTIPO_ID)');
        QRel.ParamByName('SUBTIPO_ID').AsInteger := StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'SubTipo'));
      end;

      if StrToInt(LeIni(Arq_Ini, 'Sistema', 'Localização')) = 0 then
      begin
        if StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Localização')) > 0 then
        begin
          QRel.Sql.Add('AND (LOCALIZACAO_ID = :LOCALIZACAO_ID)');
          QRel.ParamByName('LOCALIZACAO_ID').AsInteger := StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Localização'));
        end;
      end;

      if StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Produto Inicial')) > 0 then
      begin
        QRel.Sql.Add('AND (PRODUTO_ID BETWEEN :PRODUTO_INICIAL AND :PRODUTO_FINAL)');
        QRel.ParamByName('PRODUTO_INICIAL').AsInteger := StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Produto Inicial'));
        QRel.ParamByName('PRODUTO_FINAL').AsInteger   := StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Produto Final'));
      end;


      QRel.Sql.Add('ORDER BY TRIM(PRODUTOS.DESCRICAO)');
      QRel.Prepare;
      QRel.Open;

    if QRel.IsEmpty then
      Application.MessageBox('Não há dados para serem impressos', PChar(Msg_Title), mb_IconInformation)
    else
      Begin
          if CheckBox1.Checked = True then
          Begin
           RDprint1.Impressora := HP;
           RDprint1.FonteTamanhoPadrao := S10cpp;
          End;

          RDprint1.TamanhoQteColunas :=150;
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
         RDprint1.Imp(linha,C1, Copy(QRel.FieldByName('DESCRICAO').AsString, 1,40));
         RDprint1.Imp(linha,C2, Copy(QRel.FieldByName('CST_ICMS').AsString, 1,30));
         RDprint1.ImpVal(linha,C3+1,',###,##0.00', QRel.FieldByName('ALIQUOTA_ICMS').AsFloat,[]);
         RDprint1.ImpVal(linha,C4+1,',###,##0.00', QRel.FieldByName('REDUCAO_ICMS').AsFloat,[]);
         RDprint1.Imp(linha,C5+8, QRel.FieldByName('CST_PIS_COFINS_ENTRADA').AsString);
         RDprint1.Imp(linha,C6+8, QRel.FieldByName('CST_PIS_COFINS_SAIDA').AsString);

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


procedure TFrmTributacaoDeProdutos.RDprint1NewPage(Sender: TObject;
  Pagina: Integer);
begin
       //posição das colulas
       C1 := 01;
       C2 := 45;
       C3 := 75;
       C4 := 90;
       C5 := 110;
       C6 := 132;

      RDprint1.Imp(01, 01, FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString);
      RDprint1.ImpDir(01, (length(FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString)), 150, 'Sistema de Automação de empresas Eficaz', []);
      RDprint1.Imp(02, 01, 'Data/Hora: ' + DateToStr(date) + ' - ' + TimeToStr(now));
      RDprint1.impDir(02, 80, 150, 'Página: ' + IntToStr(Pagina), []);
      RDprint1.impC(03, 80, '*** TRIBUTAÇÃO DE PRODUTOS ***',[negrito]);
      RDprint1.LinhaH(04,01,150,0,false);
      RDprint1.impF(05, C1, 'PRODUTO',[negrito]);
      RDprint1.impF(05, C2, 'CST ICMS',[negrito]);
      RDprint1.impF(05, C3+2, 'ALIQ. ICMS',[negrito]);
      RDprint1.impF(05, C4, 'REDUÇÃO ICMS',[negrito]);
      RDprint1.impF(05, C5, 'CST PIS/COFINS ENT.',[negrito]);
      RDprint1.impF(05, C6, 'CST PIS/COFINS SAI.',[negrito]);

      RDprint1.LinhaH(06,01,150,0,false);
      linha := 07;
end;

procedure TFrmTributacaoDeProdutos.btnProdutoClick(Sender: TObject);
begin
try
    Produto.Value := GetConsulta('ESTOQUE', 1, 0 , StrToInt(Produto.Text));
  except
    Produto.Value := GetConsulta('ESTOQUE', 0, 0, 0);
  end;
end;

procedure TFrmTributacaoDeProdutos.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmTributacaoDeProdutos.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
  //  Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmTributacaoDeProdutos.ProdutoExit(Sender: TObject);
begin
SearchProduto;
end;

procedure TFrmTributacaoDeProdutos.ProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if (Key = Vk_F7) and (Sender = Produto) then
    btnProdutoClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmTributacaoDeProdutos.SearchProduto;
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


procedure TFrmTributacaoDeProdutos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmTributacaoDeProdutos.FormShow(Sender: TObject);
begin
 Produto.SetFocus;
end;

end.
