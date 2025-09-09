unit URel_Conferencia_Tributaria;

interface


uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, rxCurrEdit, rxToolEdit, Buttons, DBCtrls,
  DB, IBCustomDataSet, IBQuery, QuickRpt, QRCtrls, RDprint, Printers,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, QRExport,
  frxClass, frxExportBaseDialog, frxExportXLSX, frxDBSet, frxExportBIFF,
  frxExportXLS, frxExportCSV;

type
  TFrmRel_Conferencia_Tributaria = class(TForm)
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
    DataProduto: TDataSource;
    Label2: TLabel;
    Ordem: TComboBox;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    btnFornecedor: TSpeedButton;
    DBText1: TDBText;
    btnGrupo: TSpeedButton;
    DBText2: TDBText;
    btnSub_Tipo: TSpeedButton;
    DBText3: TDBText;
    btnLocalizacao: TSpeedButton;
    DBText4: TDBText;
    btnProd_Inicial: TSpeedButton;
    btnProd_final: TSpeedButton;
    Label7: TLabel;
    BtnTributacao: TSpeedButton;
    DBText5: TDBText;
    Fornecedor: TCurrencyEdit;
    Grupo: TCurrencyEdit;
    SubTipo: TCurrencyEdit;
    Localizacao: TCurrencyEdit;
    Prod_Inicial: TCurrencyEdit;
    Prod_Final: TCurrencyEdit;
    Tributacao: TCurrencyEdit;
    DataGrupo: TDataSource;
    DataFornecedor: TDataSource;
    DataSubtipo: TDataSource;
    DataTributos: TDataSource;
    DataLocalizacao: TDataSource;
    QTributos: TFDQuery;
    QProduto_Final: TFDQuery;
    QProduto_Inicial: TFDQuery;
    QFornecedor: TFDQuery;
    QLocalizacao: TFDQuery;
    Qsubtipo: TFDQuery;
    QGrupo: TFDQuery;
    QProduto: TFDQuery;
    QRel: TFDQuery;
    Relatorio_Principal: TfrxReport;
    DadosRelatorio: TFDMemTable;
    Relatorio_Editar: TfrxReport;
    QLayoutFastReport: TFDQuery;
    FrxDSCredito: TfrxDBDataset;
    frxXLSXExport1: TfrxXLSXExport;
    DadosRelatorioPRODUTO_ID: TIntegerField;
    DadosRelatorioCOD_BARRA: TStringField;
    DadosRelatorioDESCRICAO_PRODUTO: TStringField;
    DadosRelatorioCSOSN: TStringField;
    DadosRelatorioNCM: TStringField;
    DadosRelatorioCEST: TStringField;
    DadosRelatorioTRIBUTO_ID: TIntegerField;
    DadosRelatorioTRIBUTO: TStringField;
    DadosRelatorioCST_PIS_ENTRADA: TStringField;
    DadosRelatorioCST_COFINS_ENTRADA: TStringField;
    DadosRelatorioALIQUOTA_PIS_ENTRADA: TFloatField;
    DadosRelatorioALIQUOTA_COFINS_ENTRADA: TFloatField;
    DadosRelatorioCST_PIS_SAIDA: TStringField;
    DadosRelatorioCST_COFINS_SAIDA: TStringField;
    DadosRelatorioALIQUOTA_PIS_SAIDA: TFloatField;
    DadosRelatorioALIQUOTA_COFINS_SAIDA: TFloatField;
    DadosRelatorioNAT_REC: TStringField;
    procedure btnRetornaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RDprint1NewPage(Sender: TObject; Pagina: Integer);
    procedure btnExecutaClick(Sender: TObject);
    procedure FornecedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FornecedorExit(Sender: TObject);
    procedure GrupoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GrupoExit(Sender: TObject);
    procedure btnGrupoClick(Sender: TObject);
    procedure SubTipoExit(Sender: TObject);
    procedure btnSub_TipoClick(Sender: TObject);
    procedure LocalizacaoExit(Sender: TObject);
    procedure btnLocalizacaoClick(Sender: TObject);
    procedure TributacaoExit(Sender: TObject);
    procedure BtnTributacaoClick(Sender: TObject);
    procedure btnProd_InicialClick(Sender: TObject);
    procedure btnProd_finalClick(Sender: TObject);
    procedure btnFornecedorClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Relatorio_PrincipalLoadTemplate(Report: TfrxReport;
      const TemplateName: string);
  private
    procedure DetailSearch(Tabela: String);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Conferencia_Tributaria: TFrmRel_Conferencia_Tributaria;
  Pagina, linha, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15 : Integer;
  Condicao : String;
  Sub_Valor_Produtos, Sub_VR_Desconto, Sub_VR_Acrescimo, Sub_Valor,
  Total_Valor_Produtos, Total_VR_Desconto, Total_VR_Acrescimo, Total_Valor: Real;

implementation

uses
  UData, UConsulta, UPrincipal;

{$R *.dfm}


procedure TFrmRel_Conferencia_Tributaria.btnExecutaClick(Sender: TObject);
begin
  try

    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT PRODUTO_ID, COD_BARRA, PRODUTOS.DESCRICAO AS DESCRICAO_PRODUTO, PRODUTOS.CSOSN, NCM, CEST, PRODUTOS.TRIBUTO_ID, TRIBUTOS.DESCRICAO AS TRIBUTO,TRIBUTOS.CFOP, NAT_REC,');
    QRel.Sql.Add('CST_PIS_ENTR AS CST_PIS_ENTRADA, CST_COFINS_ENTR AS CST_COFINS_ENTRADA,');
    QRel.SQL.Add('PIS_ENTR AS ALIQUOTA_PIS_ENTRADA,');
    QRel.Sql.Add('COFINS_ENTR AS ALIQUOTA_COFINS_ENTRADA, CST_PIS AS CST_PIS_SAIDA,  CST_COFINS AS CST_COFINS_SAIDA,');
    QRel.Sql.Add('PIS AS ALIQUOTA_PIS_SAIDA , COFINS AS ALIQUOTA_COFINS_SAIDA FROM PRODUTOS');
    QRel.SQL.Add('INNER JOIN TRIBUTOS ON TRIBUTOS.TRIBUTO_ID = PRODUTOS.TRIBUTO_ID');
    QRel.Sql.Add('WHERE PRODUTOS.PRODUTO_ID > 0');


       //FILTRO FORNECEDOR
    if StrToInt(Fornecedor.Text) > 0 then
    begin
      QRel.Sql.Add('AND (PRODUTOS.FORNECEDOR_ID = :FORNECEDOR_ID)');
      QRel.ParamByName('FORNECEDOR_ID').AsInteger := StrToInt(Fornecedor.Text);
    end;

    //FILTRO GRUPO
    if StrToInt(Grupo.Text) > 0 then
    begin
      QRel.Sql.Add('AND (PRODUTOS.GRUPO_ID = :GRUPO_ID)');
      QRel.ParamByName('GRUPO_ID').AsInteger := StrToInt(Grupo.Text);
    end;

    // FILTRO TRIBUTAÇÃO
    if StrToInt(Tributacao.Text) > 0 then
    begin
      QRel.Sql.Add('AND (PRODUTOS.TRIBUTO_ID = :TRIBUTO_ID)');
      QRel.ParamByName('TRIBUTO_ID').AsInteger := StrToInt(Tributacao.Text);
    end;

    //FILTRO SUBTIPO
    if StrToInt(SubTipo.Text) > 0 then
    begin
      QRel.Sql.Add('AND (PRODUTOS.SUBTIPO_ID = :SUBTIPO_ID)');
      QRel.ParamByName('SUBTIPO_ID').AsInteger := StrToInt(SubTipo.Text);
    end;

    //FILTRO LOCALIZAÇÃO
    if StrToInt(Localizacao.Text) > 0 then
    begin
      QRel.Sql.Add('AND (PRODUTOS.LOCALIZACAO_ID = :LOCALIZACAO_ID)');
      QRel.ParamByName('LOCALIZACAO_ID').AsInteger := StrToInt(Localizacao.Text);
    end;

     //FILTRO INTERVALO
    if  (StrToInt(Prod_Inicial.Text) >= 0) AND ( StrToInt(Prod_Final.Text) > 0 )  then
    begin
      QRel.Sql.Add('AND (PRODUTOS.PRODUTO_ID BETWEEN :PRODUTO_INICIAL AND :PRODUTO_FINAL)');
      QRel.ParamByName('PRODUTO_INICIAL').AsInteger := StrToInt(Prod_Inicial.Text);
      QRel.ParamByName('PRODUTO_FINAL').AsInteger   := StrToInt(Prod_Final.Text);
    end;


    QRel.Sql.Add('AND STATUS = :STATUS');
    QRel.ParamByName('STATUS').AsString  := 'A';

    if Ordem.ItemIndex = 0 then
       QRel.Sql.Add('ORDER BY PRODUTOS.PRODUTO_ID');

    if Ordem.ItemIndex = 1 then
       QRel.Sql.Add('ORDER BY PRODUTOS.DESCRICAO');


    QRel.Prepare;
    QRel.Open;

    if QRel.IsEmpty then
      Application.MessageBox('Não há dados para serem impressos', PChar(Msg_Title), mb_IconInformation)
    else
    Begin
      {
      if CheckBox1.Checked = True then
      Begin
       RDprint1.Impressora := HP;
       RDprint1.FonteTamanhoPadrao := S10cpp;
      End;

      RDprint1.TamanhoQteColunas :=180;
      RDprint1.OpcoesPreview.Preview     := True;
      RDprint1.MostrarProgresso          := True;
      RDprint1.Acentuacao                := SemAcento;
      RDprint1.TamanhoQteLinhas          := 1;
      RDprint1.Abrir;
      RDprint1.Orientacao:= poLandscape;

      if linha > 66  then
      Begin
       RDprint1.Novapagina;
       Pagina := Pagina + 1;
      End;
      }

      try
        QLayoutFastReport.SQL.Clear;
        QLayoutFastReport.SQL.Add('SELECT NOME_ARQUIVO, ARQUIVO_RELATORIO FROM CONFIG_RELATORIOS');
        QLayoutFastReport.SQL.Add('WHERE NOME_RELATORIO = :NOME_RELATORIO');
        QLayoutFastReport.SQL.Add('OR NOME_RELATORIO = :BASE;');
        QLayoutFastReport.ParamByName('NOME_RELATORIO').AsString := 'URel_Conferencia_Tributaria';
        QLayoutFastReport.ParamByName('BASE').AsString := 'base';
        QLayoutFastReport.Open();
      Except
      on e:Exception do
      begin
        Application.MessageBox(PChar('Erro:' + #13 +
          'Erro: ' + e.Message), 'Erro', MB_ICONSTOP + MB_TASKMODAL);
      end;
      end;

      Relatorio_Principal.Clear;
      DadosRelatorio.Open;
      DadosRelatorio.EmptyDataSet;

      QRel.First;
      while not QRel.Eof do
      Begin
        DadosRelatorio.Append;

        DadosRelatorio.FieldByName('PRODUTO_ID').AsInteger            := QRel.FieldByName('PRODUTO_ID').AsInteger;
        DadosRelatorio.FieldByName('COD_BARRA').AsString              := QRel.FieldByName('COD_BARRA').AsString;
        DadosRelatorio.FieldByName('DESCRICAO_PRODUTO').AsString      := QRel.FieldByName('DESCRICAO_PRODUTO').AsString;
        DadosRelatorio.FieldByName('CSOSN').AsString                  := QRel.FieldByName('CSOSN').AsString;
        DadosRelatorio.FieldByName('NCM').AsString                    := QRel.FieldByName('NCM').AsString;
        DadosRelatorio.FieldByName('CEST').AsString                   := QRel.FieldByName('CEST').AsString;
        DadosRelatorio.FieldByName('TRIBUTO_ID').AsInteger            := QRel.FieldByName('TRIBUTO_ID').AsInteger;
        DadosRelatorio.FieldByName('TRIBUTO').AsString                := QRel.FieldByName('TRIBUTO').AsString;
        DadosRelatorio.FieldByName('CST_PIS_ENTRADA').AsString        := QRel.FieldByName('CST_PIS_ENTRADA').AsString;
        DadosRelatorio.FieldByName('CST_COFINS_ENTRADA').AsString     := QRel.FieldByName('CST_COFINS_ENTRADA').AsString;
        DadosRelatorio.FieldByName('ALIQUOTA_PIS_ENTRADA').AsFloat    := QRel.FieldByName('ALIQUOTA_PIS_ENTRADA').AsFloat;
        DadosRelatorio.FieldByName('ALIQUOTA_COFINS_ENTRADA').AsFloat := QRel.FieldByName('ALIQUOTA_COFINS_ENTRADA').AsFloat;
        DadosRelatorio.FieldByName('CST_PIS_SAIDA').AsString          := QRel.FieldByName('CST_PIS_SAIDA').AsString;
        DadosRelatorio.FieldByName('CST_COFINS_SAIDA').AsString       := QRel.FieldByName('CST_COFINS_SAIDA').AsString;
        DadosRelatorio.FieldByName('ALIQUOTA_PIS_SAIDA').AsFloat      := QRel.FieldByName('ALIQUOTA_PIS_SAIDA').AsFloat;
        DadosRelatorio.FieldByName('ALIQUOTA_COFINS_SAIDA').AsFloat   := QRel.FieldByName('ALIQUOTA_COFINS_SAIDA').AsFloat;
        DadosRelatorio.FieldByName('NAT_REC').AsString                := QRel.FieldByName('NAT_REC').AsString;

        DadosRelatorio.Post;

        {
        RDprint1.ImpF(linha, C1, Copy(QRel.FieldByName('PRODUTO_ID').AsString, 1 ,8), []);
        RDprint1.ImpF(linha, C2, Copy(QRel.FieldByName('COD_BARRA').AsString, 1, 14), []);
        RDprint1.ImpF(linha, C3, Copy(QRel.FieldByName('DESCRICAO_PRODUTO').AsString, 1, 25), []);
        RDprint1.ImpF(linha, C4, QRel.FieldByName('CSOSN').AsString, [] );
        RDprint1.ImpF(linha, C5, QRel.FieldByName('NCM').AsString, [] );
        RDprint1.ImpF(linha, C6, QRel.FieldByName('CEST').AsString, [] );
        RDprint1.ImpF(linha, C6+9, QRel.FieldByName('TRIBUTO_ID').AsString, [] );
        RDprint1.ImpF(linha, C7, Copy(QRel.FieldByName('TRIBUTO').AsString, 1, 17 ), [] );
        RDprint1.ImpF(linha, C7 + 23, QRel.FieldByName('CFOP').AsString, [] );
        RDprint1.ImpD(linha, C8+6, QRel.FieldByName('CST_PIS_ENTRADA').AsString,[]);
        RDprint1.Imp(linha, C9+4, QRel.FieldByName('CST_COFINS_ENTRADA').AsString);
        RDprint1.ImpVal(linha,C10-7,',##,##0.00', QRel.FieldByName('ALIQUOTA_PIS_ENTRADA').AsFloat, []);
        RDprint1.ImpVal(linha,C11-5,',##,##0.00', QRel.FieldByName('ALIQUOTA_COFINS_ENTRADA').AsFloat, []);
        RDprint1.ImpD(linha, C12+5, QRel.FieldByName('CST_PIS_SAIDA').AsString,[]);
        RDprint1.Imp(linha, C13 +4, QRel.FieldByName('CST_COFINS_SAIDA').AsString);
        RDprint1.ImpVal(linha,C14-5,',##,0.00', QRel.FieldByName('ALIQUOTA_PIS_SAIDA').AsFloat, []);
        RDprint1.ImpVal(linha,C14+4,',##,0.00', QRel.FieldByName('ALIQUOTA_COFINS_SAIDA').AsFloat, []);
        RDprint1.ImpF(linha, C15+1, QRel.FieldByName('NAT_REC').AsString, [] );

        if linha > 63  then
        Begin
         RDprint1.Novapagina;
         Pagina := Pagina + 1;
        End;

        Inc(linha);
        }
        QRel.Next;
      End;
      {
      Application.ProcessMessages;
      RDprint1.TamanhoQteLinhas:= 66;
      RDprint1.Fechar;
      }
      QRel.First;

      Relatorio_Principal.Clear;
      Relatorio_Principal.InheritFromTemplate('URel_Conferencia_Tributaria_Sintetico.fr3');
      Relatorio_Principal := FrmPrincipal.Configura_Relatorio_FastReport(Relatorio_Principal, DateToStr(Now), 'Relatório de Conferência Tributária');

      Relatorio_Principal.ShowReport(true);
    End;

  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;


procedure TFrmRel_Conferencia_Tributaria.RDprint1NewPage(Sender: TObject;
  Pagina: Integer);
begin
  //posição das colulas
       C1  := 01;
       C2  := 07;
       C3  := 22;
       C4  := 48;
       C5  := 54;
       C6  := 63;
       C7  := 75;
       C8  := 104;
       C9  := 112;
       C10 := 125;
       C11 := 134;
       C12 := 141;
       C13 := 151;
       C14 := 164;
       C15 := 177;

      RDprint1.Imp(01, 01, FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString);
      RDprint1.ImpDir(01, (length(FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString)), 180, 'Sistema de Automação de empresas Eficaz', []);
      RDprint1.Imp(02, 01, 'Data/Hora: ' + DateToStr(date) + ' - ' + TimeToStr(now));
      RDprint1.impDir(02, 80, 180, 'Página: ' + IntToStr(Pagina), []);
      RDprint1.impC(03, 80, '*** CONFERÊNCIA TRIBUTÁRIA ***',[negrito]);
      RDprint1.LinhaH(04,01,180,0,false);
      RDprint1.ImpF(05, C1, 'ID',[negrito]);
      RDprint1.ImpF(05, C2, 'COD. BARRAS', [negrito]);
      RDprint1.ImpF(05, C3, 'DESCRIÇÃO', [negrito]);
      RDprint1.ImpF(05, C4, 'CSOSN', [negrito]);
      RDprint1.ImpF(05, C5, 'NCM', [negrito]);
      RDprint1.ImpF(05, C6, 'CEST', [negrito]);
      RDprint1.ImpF(05, C6+9, 'CD', [negrito]);
      RDprint1.ImpF(05, C7, 'TRIBUTAÇÃO', [negrito]);
      RDprint1.ImpF(05, C7+23, 'CFOP', [negrito]);
      RDprint1.impF(05, C8, 'CST/PIS',[negrito]);
      RDprint1.impF(05, C9, 'CST/COFINS',[negrito]);
      RDprint1.impF(05, C10, 'PIS',[negrito]);
      RDprint1.impF(05, C11, 'COFINS',[negrito]);
      RDprint1.impF(05, C12, 'CST/PIS',[negrito]);
      RDprint1.impF(05, C13, 'CST/COFINS',[negrito]);
      RDprint1.impF(05, C14, 'PIS',[negrito]);
      RDprint1.impF(05, C14+6, 'COFINS',[negrito]);
      RDprint1.ImpF(05, C15,'NAT.', [negrito]);

      RDprint1.LinhaH(06,01,180,0,false);
      linha := 07;
end;


procedure TFrmRel_Conferencia_Tributaria.Relatorio_PrincipalLoadTemplate(
  Report: TfrxReport; const TemplateName: string);
var
  BlobStream: TStream;
begin
  QLayoutFastReport.First;
  while not QLayoutFastReport.Eof do
  begin
    //ShowMessage(TemplateName + ' ' + QLayoutFastReport.FieldByName('NOME_RELATORIO').AsString);
    if AnsiCompareText(QLayoutFastReport.FieldByName('NOME_ARQUIVO').AsString, TemplateName) = 0 then
    begin
      //ShowMessage(TemplateName + ' ' + QLayoutFastReport.FieldByName('NOME_ARQUIVO').AsString);
      //ShowMessage('Cheguei aqui');
      BlobStream := TMemoryStream.Create;
      TBlobField(QLayoutFastReport.FieldByName('ARQUIVO_RELATORIO')).SaveToStream(BlobStream);
      BlobStream.Position := 0;
      Report.LoadFromStream(BlobStream);
      BlobStream.Free;
      break;
    end;
    QLayoutFastReport.Next;
  end;
end;

procedure TFrmRel_Conferencia_Tributaria.DetailSearch(Tabela: String);
begin
  if ((Tabela = '') or (Tabela = 'Fornecedor')) and (Fornecedor.Text <> '') then
  begin
    QFornecedor.Close;
    QFornecedor.ParamByName('FORNECEDOR_ID').AsInteger := StrToInt(Fornecedor.Text);
    QFornecedor.Prepare;
    QFornecedor.Open;
  end;

  if ((Tabela = '') or (Tabela = 'Grupo')) and (Grupo.Text <> '') then
  begin
    QGrupo.Close;
    QGrupo.ParamByName('TABELA_ID').AsInteger := StrToInt(Grupo.Text);
    QGrupo.Prepare;
    QGrupo.Open;
  end;

  if ((Tabela = '') or (Tabela = 'Subtipo')) and (SubTipo.Text <> '') then
  begin
    QSubtipo.Close;
    QSubtipo.ParamByName('TABELA_ID').AsInteger := StrToInt(SubTipo.Text);
    QSubtipo.Prepare;
    QSubtipo.Open;
  end;

  if ((Tabela = '') or (Tabela = 'Localização')) and (Localizacao.Text <> '') then
  begin
    QLocalizacao.Close;
    QLocalizacao.ParamByName('TABELA_ID').AsInteger := StrToInt(Localizacao.Text);
    QLocalizacao.Prepare;
    QLocalizacao.Open;
  end;

  if ((Tabela = '') or (Tabela = 'Tributação')) and (Tributacao.Text <> '') then
  begin
    QTributos.Close;
    QTributos.ParamByName('TRIBUTO_ID').AsInteger := StrToInt(Tributacao.Text);
    QTributos.Prepare;
    QTributos.Open;
  end;

  if ((Tabela = '') or (Tabela = 'Produto Inicial')) and (Prod_Inicial.Text <> '') then
  begin
    QProduto_Inicial.Close;
    QProduto_Inicial.ParamByName('PRODUTO_ID').AsInteger := StrToInt(Prod_Inicial.Text);
    QProduto_Inicial.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    QProduto_Inicial.Prepare;
    QProduto_Inicial.Open;
  end;

  if ((Tabela = '') or (Tabela = 'Produto Final')) and (Prod_Final.Text <> '') then
  begin
    QProduto_Final.Close;
    QProduto_Final.ParamByName('PRODUTO_ID').AsInteger := StrToInt(Prod_Final.Text);
    QProduto_Final.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    QProduto_Final.Prepare;
    QProduto_Final.Open;
  end;
end;


procedure TFrmRel_Conferencia_Tributaria.SubTipoExit(Sender: TObject);
begin
     DetailSearch('Subtipo');
end;

procedure TFrmRel_Conferencia_Tributaria.TributacaoExit(Sender: TObject);
begin
  DetailSearch('Tributação');
end;

procedure TFrmRel_Conferencia_Tributaria.btnFornecedorClick(Sender: TObject);
begin
   try
    Fornecedor.Value := GetConsulta('FORNECEDORES', 0, 0, StrToInt(Fornecedor.Text));
  except
    Fornecedor.Value := GetConsulta('FORNECEDORES', 0, 0, 0);
  end;
end;

procedure TFrmRel_Conferencia_Tributaria.btnGrupoClick(Sender: TObject);
begin
 try
    Grupo.Value := GetConsulta('GRUPOS', 0, 0, StrToInt(Grupo.Text));
  except
    Grupo.Value := GetConsulta('GRUPOS', 0, 0, 0);
  end;
end;

procedure TFrmRel_Conferencia_Tributaria.btnLocalizacaoClick(Sender: TObject);
begin
  try
    Localizacao.Value := GetConsulta('LOCAIS', 0, 0, StrToInt(Localizacao.Text));
  except
    Localizacao.Value := GetConsulta('LOCAIS', 0, 0, 0);
  end;
end;

procedure TFrmRel_Conferencia_Tributaria.btnProd_finalClick(Sender: TObject);
begin
    try
    Prod_Final.Value := GetConsulta('ESTOQUE', FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger, 0, StrToInt(Prod_Final.Text));
  except
    Prod_Final.Value := GetConsulta('ESTOQUE', FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger, 0, 0);
  end;
end;

procedure TFrmRel_Conferencia_Tributaria.btnProd_InicialClick(Sender: TObject);
begin
  try
    Prod_Inicial.Value := GetConsulta('ESTOQUE', FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger, 0, StrToInt(Prod_Inicial.Text));
  except
    Prod_Inicial.Value := GetConsulta('ESTOQUE', FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger, 0, 0);
  end;
end;

procedure TFrmRel_Conferencia_Tributaria.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRel_Conferencia_Tributaria.btnSub_TipoClick(Sender: TObject);
begin
 try
    SubTipo.Value := GetConsulta('SUBTIPOS', 0, 0, StrToInt(SubTipo.Text));
  except
    SubTipo.Value := GetConsulta('SUBTIPOS', 0, 0, 0);
  end;
end;

procedure TFrmRel_Conferencia_Tributaria.BtnTributacaoClick(Sender: TObject);
begin
  try
    Tributacao.Value := GetConsulta('TRIBUTOS', 0, 0, StrToInt(Localizacao.Text));
  except
    Tributacao.Value := GetConsulta('TRIBUTOS', 0, 0, 0);
  end; 
end;

procedure TFrmRel_Conferencia_Tributaria.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmRel_Conferencia_Tributaria.FormShow(Sender: TObject);
begin
  if LeIni(Arq_Ini, 'Parâmetros Estoque', 'Fornecedor') <> '' then
    Fornecedor.Value := StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Fornecedor'));

  if LeIni(Arq_Ini, 'Parâmetros Estoque', 'Grupo') <> '' then
    Grupo.Value := StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Grupo'));

  if LeIni(Arq_Ini, 'Parâmetros Estoque', 'SubTipo') <> '' then
    SubTipo.Value := StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'SubTipo'));

  if LeIni(Arq_Ini, 'Parâmetros Estoque', 'Localização') <> '' then
    Localizacao.Value := StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Localização'));

  if LeIni(Arq_Ini, 'Parâmetros Estoque', 'Tributação') <> '' then
    Tributacao.Value := StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Tributação'));

  if LeIni(Arq_Ini, 'Parâmetros Estoque', 'Produto Inicial') <> '' then
    Prod_Inicial.Value := StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Produto Inicial'));

  if LeIni(Arq_Ini, 'Parâmetros Estoque', 'Produto Final') <> '' then
    Prod_Final.Value := StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Produto Final'));
end;

procedure TFrmRel_Conferencia_Tributaria.FornecedorExit(Sender: TObject);
begin
 DetailSearch('Fornecedor');
end;

procedure TFrmRel_Conferencia_Tributaria.FornecedorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if (Key = Vk_F7) and (Sender = Fornecedor) then
    btnFornecedorClick(Self);

  if (Key = Vk_F7) and (Sender = Grupo) then
    btnGrupoClick(Self);

  if (Key = Vk_F7) and (Sender = SubTipo) then
    btnSub_TipoClick(Self);

  if (Key = Vk_F7) and (Sender = Localizacao) then
    btnLocalizacaoClick(Self);

  if (Key = Vk_F7) and (Sender = Tributacao) then
    BtnTributacaoClick(Self);

  if (Key = Vk_F7) and (Sender = Prod_Inicial) then
    btnProd_InicialClick(Self);

  if (Key = Vk_F7) and (Sender = Prod_Final) then
    btnProd_FinalClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmRel_Conferencia_Tributaria.GrupoExit(Sender: TObject);
begin
 DetailSearch('Grupo');
end;

procedure TFrmRel_Conferencia_Tributaria.GrupoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = Fornecedor) then
    btnFornecedorClick(Self);

  if (Key = Vk_F7) and (Sender = Grupo) then
    btnGrupoClick(Self);

  if (Key = Vk_F7) and (Sender = SubTipo) then
    btnSub_TipoClick(Self);

  if (Key = Vk_F7) and (Sender = Localizacao) then
    btnLocalizacaoClick(Self);

  if (Key = Vk_F7) and (Sender = Tributacao) then
    BtnTributacaoClick(Self);

  if (Key = Vk_F7) and (Sender = Prod_Inicial) then
    btnProd_InicialClick(Self);

  if (Key = Vk_F7) and (Sender = Prod_Final) then
    btnProd_FinalClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmRel_Conferencia_Tributaria.LocalizacaoExit(Sender: TObject);
begin
 DetailSearch('Localização');
end;

end.
