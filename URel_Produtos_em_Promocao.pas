unit URel_Produtos_em_Promocao;

interface


uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, rxCurrEdit, rxToolEdit, Buttons, DBCtrls,
  DB, IBCustomDataSet, IBQuery, QuickRpt, QRCtrls, RDprint, Printers,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmRel_Produtos_em_Promocao = class(TForm)
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
    Label8: TLabel;
    Dtmen: TDateEdit;
    Dtmai: TDateEdit;
    QGrupo: TFDQuery;
    QProduto_final: TFDQuery;
    QSubTipo: TFDQuery;
    QProduto_Inicial: TFDQuery;
    QRel: TFDQuery;
    QProduto: TFDQuery;
    QFornecedor: TFDQuery;
    QLocalizacao: TFDQuery;
    QTributos: TFDQuery;
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
    procedure FormCreate(Sender: TObject);
  private
    procedure DetailSearch(Tabela: String);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Produtos_em_Promocao: TFrmRel_Produtos_em_Promocao;
  Pagina, linha, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15 : Integer;
  Condicao : String;
  Sub_Valor_Produtos, Sub_VR_Desconto, Sub_VR_Acrescimo, Sub_Valor,
  Total_Valor_Produtos, Total_VR_Desconto, Total_VR_Acrescimo, Total_Valor: Real;

implementation

uses
  UData, UConsulta, UPrincipal;

{$R *.dfm}


procedure TFrmRel_Produtos_em_Promocao.btnExecutaClick(Sender: TObject);
begin
try

      QRel.Sql.Clear;
      QRel.Sql.Add('SELECT PRODUTO_ID, DESCRICAO, COD_BARRA, PRECO_VAREJO, PRECO_PROMOCAO, PROMO_INICIAL, PROMO_FINAL');
      QRel.Sql.Add('FROM PRODUTOS WHERE PROMO_INICIAL >= :DT_INICIAL AND PROMO_FINAL  <= :DT_FINAL');

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


      QRel.ParamByName('DT_INICIAL').AsDateTime   :=  Dtmen.Date;
      QRel.ParamByName('DT_FINAL').AsDateTime     :=  Dtmai.Date;

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
          if CheckBox1.Checked = True then
          Begin
           RDprint1.Impressora := HP;
           RDprint1.FonteTamanhoPadrao := S10cpp;
          End;

          RDprint1.TamanhoQteColunas :=100;
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


        QRel.First;
        while not QRel.Eof do
        Begin
         RDprint1.ImpF(linha, C1, QRel.FieldByName('PRODUTO_ID').AsString, []);
         RDprint1.ImpF(linha, C2, Copy(QRel.FieldByName('DESCRICAO').AsString, 1, 35), []);
         RDprint1.ImpVal(linha,C3-6,',###,##0.00',QRel.FieldByName('PRECO_VAREJO').AsFloat,[]);
         RDprint1.ImpVal(linha,C4-3,',###,##0.00',QRel.FieldByName('PRECO_PROMOCAO').AsFloat,[]);
         RDprint1.ImpF(linha, C5, QRel.FieldByName('PROMO_INICIAL').AsString, [] );
         RDprint1.ImpF(linha, C6, QRel.FieldByName('PROMO_FINAL').AsString, [] );

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


procedure TFrmRel_Produtos_em_Promocao.RDprint1NewPage(Sender: TObject;
  Pagina: Integer);
begin
  //posição das colulas
       C1  := 01;
       C2  := 08;
       C3  := 51;
       C4  := 60;
       C5  := 75;
       C6  := 90;


      RDprint1.Imp(01, 01, FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString);
      RDprint1.ImpDir(01, (length(FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString)), 100, 'Sistema de Automação de empresas Eficaz', []);
      RDprint1.Imp(02, 01, 'Data/Hora: ' + DateToStr(date) + ' - ' + TimeToStr(now));
      RDprint1.impDir(02, 80, 100, 'Página: ' + IntToStr(Pagina), []);
      RDprint1.impF(03, 36, '*** PRODUTOS EM PROMOÇÃO ***',[negrito]);
      RDprint1.imp(04, 01, 'Período:'+ datetoStr(dtmen.date) + ' à ' + datetoStr(dtmai.date));
      RDprint1.LinhaH(05,01,100,0,false);
      RDprint1.ImpF(06, C1, 'Id',[negrito]);
      RDprint1.ImpF(06, C2, 'Descrição', [negrito]);
      RDprint1.ImpF(06, C3, 'Preco', [negrito]);
      RDprint1.ImpF(06, C4, 'Promoção', [negrito]);
      RDprint1.ImpF(06, C5, 'Dt. Início', [negrito]);
      RDprint1.ImpF(06, C6, 'Dt. Fim', [negrito]);

      RDprint1.LinhaH(07,01,100,0,false);
      linha := 08;
end;


procedure TFrmRel_Produtos_em_Promocao.DetailSearch(Tabela: String);
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


procedure TFrmRel_Produtos_em_Promocao.SubTipoExit(Sender: TObject);
begin
     DetailSearch('Subtipo');
end;

procedure TFrmRel_Produtos_em_Promocao.TributacaoExit(Sender: TObject);
begin
  DetailSearch('Tributação');
end;

procedure TFrmRel_Produtos_em_Promocao.btnFornecedorClick(Sender: TObject);
begin
   try
    Fornecedor.Value := GetConsulta('FORNECEDORES', 0, 0, StrToInt(Fornecedor.Text));
  except
    Fornecedor.Value := GetConsulta('FORNECEDORES', 0, 0, 0);
  end;
end;

procedure TFrmRel_Produtos_em_Promocao.btnGrupoClick(Sender: TObject);
begin
 try
    Grupo.Value := GetConsulta('GRUPOS', 0, 0, StrToInt(Grupo.Text));
  except
    Grupo.Value := GetConsulta('GRUPOS', 0, 0, 0);
  end;
end;

procedure TFrmRel_Produtos_em_Promocao.btnLocalizacaoClick(Sender: TObject);
begin
  try
    Localizacao.Value := GetConsulta('LOCAIS', 0, 0, StrToInt(Localizacao.Text));
  except
    Localizacao.Value := GetConsulta('LOCAIS', 0, 0, 0);
  end;
end;

procedure TFrmRel_Produtos_em_Promocao.btnProd_finalClick(Sender: TObject);
begin
    try
    Prod_Final.Value := GetConsulta('ESTOQUE', FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger, 0, StrToInt(Prod_Final.Text));
  except
    Prod_Final.Value := GetConsulta('ESTOQUE', FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger, 0, 0);
  end;
end;

procedure TFrmRel_Produtos_em_Promocao.btnProd_InicialClick(Sender: TObject);
begin
  try
    Prod_Inicial.Value := GetConsulta('ESTOQUE', FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger, 0, StrToInt(Prod_Inicial.Text));
  except
    Prod_Inicial.Value := GetConsulta('ESTOQUE', FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger, 0, 0);
  end;
end;

procedure TFrmRel_Produtos_em_Promocao.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRel_Produtos_em_Promocao.btnSub_TipoClick(Sender: TObject);
begin
 try
    SubTipo.Value := GetConsulta('SUBTIPOS', 0, 0, StrToInt(SubTipo.Text));
  except
    SubTipo.Value := GetConsulta('SUBTIPOS', 0, 0, 0);
  end;
end;

procedure TFrmRel_Produtos_em_Promocao.BtnTributacaoClick(Sender: TObject);
begin
  try
    Tributacao.Value := GetConsulta('TRIBUTOS', 0, 0, StrToInt(Localizacao.Text));
  except
    Tributacao.Value := GetConsulta('TRIBUTOS', 0, 0, 0);
  end; 
end;

procedure TFrmRel_Produtos_em_Promocao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmRel_Produtos_em_Promocao.FormCreate(Sender: TObject);
begin
     Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
     Dtmai.Date := Ult_Dia_Mes(date);
end;

procedure TFrmRel_Produtos_em_Promocao.FormShow(Sender: TObject);
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

procedure TFrmRel_Produtos_em_Promocao.FornecedorExit(Sender: TObject);
begin
 DetailSearch('Fornecedor');
end;

procedure TFrmRel_Produtos_em_Promocao.FornecedorKeyDown(Sender: TObject;
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

procedure TFrmRel_Produtos_em_Promocao.GrupoExit(Sender: TObject);
begin
 DetailSearch('Grupo');
end;

procedure TFrmRel_Produtos_em_Promocao.GrupoKeyDown(Sender: TObject;
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

procedure TFrmRel_Produtos_em_Promocao.LocalizacaoExit(Sender: TObject);
begin
 DetailSearch('Localização');
end;

end.


