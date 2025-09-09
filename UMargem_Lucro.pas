unit UMargem_Lucro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, rxCurrEdit, rxToolEdit, Buttons, DBCtrls,
  DB, IBCustomDataSet, IBQuery, QuickRpt, QRCtrls, RDprint, Math,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmMargem_Lucro = class(TForm)
    Bevel1: TBevel;
    GRUPO_ID: TCurrencyEdit;
    btnGrupo: TSpeedButton;
    DataProduto: TDataSource;
    DBText1: TDBText;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    DataGrupo: TDataSource;
    RDprint1: TRDprint;
    CheckBox1: TCheckBox;
    btnFamilia: TSpeedButton;
    DBText2: TDBText;
    FAMILIA_ID: TCurrencyEdit;
    DataFamilia: TDataSource;
    QFamilia: TIBQuery;
    btnProd_Inicial: TSpeedButton;
    DBText4: TDBText;
    DBText3: TDBText;
    DBText5: TDBText;
    btnFornecedor: TSpeedButton;
    btnSub_Tipo: TSpeedButton;
    btnLocalizacao: TSpeedButton;
    Prod_Inicial: TCurrencyEdit;
    Label5: TLabel;
    Label4: TLabel;
    Localizacao: TCurrencyEdit;
    Label3: TLabel;
    SubTipo: TCurrencyEdit;
    Label2: TLabel;
    Fornecedor: TCurrencyEdit;
    Label6: TLabel;
    Label7: TLabel;
    btnProd_final: TSpeedButton;
    Prod_Final: TCurrencyEdit;
    Bevel2: TBevel;
    DataSubtipo: TDataSource;
    DataLocalizacao: TDataSource;
    DataFornecedor: TDataSource;
    QProduto_Inicial: TIBQuery;
    Label1: TLabel;
    BtnTributacao: TSpeedButton;
    DBText6: TDBText;
    Tributacao: TCurrencyEdit;
    QLocalizacao: TFDQuery;
    QSubtipo: TFDQuery;
    QGrupo: TFDQuery;
    QFornecedor: TFDQuery;
    QRel: TFDQuery;
    FDQuery5: TFDQuery;
    QProduto: TFDQuery;
    QProduto_Final: TFDQuery;
    procedure btnRetornaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGrupoClick(Sender: TObject);
    procedure GRUPO_IDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ProdutoChange(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ExtratoBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure DtmenEnter(Sender: TObject);
    procedure GRUPO_IDExit(Sender: TObject);
    procedure GRUPO_IDChange(Sender: TObject);
    procedure RDprint1NewPage(Sender: TObject; Pagina: Integer);
    procedure FAMILIA_IDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FAMILIA_IDChange(Sender: TObject);
    procedure btnFamiliaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFornecedorClick(Sender: TObject);
    procedure btnSub_TipoClick(Sender: TObject);
    procedure btnLocalizacaoClick(Sender: TObject);
    procedure btnProd_InicialClick(Sender: TObject);
    procedure btnProd_finalClick(Sender: TObject);
    procedure FornecedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SubTipoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LocalizacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Prod_InicialKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Prod_FinalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FornecedorChange(Sender: TObject);
    procedure SubTipoChange(Sender: TObject);
    procedure LocalizacaoChange(Sender: TObject);
    procedure Prod_InicialExit(Sender: TObject);
    procedure Prod_FinalExit(Sender: TObject);
    procedure FornecedorExit(Sender: TObject);
    procedure FAMILIA_IDExit(Sender: TObject);
    procedure SubTipoExit(Sender: TObject);
    procedure LocalizacaoExit(Sender: TObject);
    procedure BtnTributacaoClick(Sender: TObject);
  private
    procedure DetailSearch(Tabela: String);
    { Private declarations }
  public
    { Public declarations }
    procedure SearchProduto;
  end;

var
  Pagina, linha, C1, C2, C3, C4, C5, C6, C7,C8, Qtd : Integer;
  Saldo, Media_Porc, Sd: Real;

implementation

uses
  UData, UConsulta, UPrincipal;

{$R *.dfm}

procedure TFrmMargem_Lucro.SearchProduto;
begin
  QProduto.Close;
  QProduto.ParamByName('PRODUTO_ID').AsInteger := StrToInt(GRUPO_ID.Text);
  QProduto.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  QProduto.Prepare;
  QProduto.Open;

  if QProduto.IsEmpty then
    btnExecuta.Enabled := False
  else
    btnExecuta.Enabled := True;
end;

procedure TFrmMargem_Lucro.SubTipoChange(Sender: TObject);
begin
  DetailSearch('Subtipo');
end;

procedure TFrmMargem_Lucro.SubTipoExit(Sender: TObject);
begin
  DetailSearch('Subtipo');
end;

procedure TFrmMargem_Lucro.SubTipoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = FAMILIA_ID) then
    btnGrupoClick(Self);

  if (Key = Vk_F7) and (Sender = Fornecedor) then
    btnFornecedorClick(Self);

  if (Key = Vk_F7) and (Sender = GRUPO_ID) then
    btnGrupoClick(Self);

  if (Key = Vk_F7) and (Sender = SubTipo) then
    btnSub_TipoClick(Self);

  if (Key = Vk_F7) and (Sender = Localizacao) then
    btnLocalizacaoClick(Self);

  if (Key = Vk_F7) and (Sender = Prod_Inicial) then
    btnProd_InicialClick(Self);

  if (Key = Vk_F7) and (Sender = Prod_Final) then
    btnProd_FinalClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmMargem_Lucro.btnFamiliaClick(Sender: TObject);
begin
  try
    FAMILIA_ID.Value := GetConsulta('FAMÍLIA', FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger, 0 , StrToInt(GRUPO_ID.Text));
  except
    FAMILIA_ID.Value := GetConsulta('FAMÍLIA', 0, 0, 0);
  end;
end;

procedure TFrmMargem_Lucro.btnFornecedorClick(Sender: TObject);
begin
  try
    Fornecedor.Value := GetConsulta('FORNECEDORES', 0, 0, StrToInt(Fornecedor.Text));
  except
    Fornecedor.Value := GetConsulta('FORNECEDORES', 0, 0, 0);
  end;
end;

procedure TFrmMargem_Lucro.btnGrupoClick(Sender: TObject);
begin
  try
    GRUPO_ID.Value := GetConsulta('GRUPOS', FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger, 0 , StrToInt(GRUPO_ID.Text));
  except
    GRUPO_ID.Value := GetConsulta('GRUPOS', 0, 0, 0);
  end;
end;

procedure TFrmMargem_Lucro.btnLocalizacaoClick(Sender: TObject);
begin
  try
    Localizacao.Value := GetConsulta('LOCAIS', 0, 0, StrToInt(Localizacao.Text));
  except
    Localizacao.Value := GetConsulta('LOCAIS', 0, 0, 0);
  end;
end;

procedure TFrmMargem_Lucro.btnProd_finalClick(Sender: TObject);
begin
  try
    Prod_Final.Value := GetConsulta('ESTOQUE', FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger, 0, StrToInt(Prod_Final.Text));
  except
    Prod_Final.Value := GetConsulta('ESTOQUE', FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger, 0, 0);
  end;
end;

procedure TFrmMargem_Lucro.btnProd_InicialClick(Sender: TObject);
begin
   try
    Prod_Inicial.Value := GetConsulta('ESTOQUE', FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger, 0, StrToInt(Prod_Inicial.Text));
  except
    Prod_Inicial.Value := GetConsulta('ESTOQUE', FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger, 0, 0);
  end;
end;

procedure TFrmMargem_Lucro.btnExecutaClick(Sender: TObject);
var
Nome_Grupo:string;
Soma_Custo, Soma_Lucro, Soma_Preco_Varejo, Subtotal_Custo, Subtotal_Lucro, Subtotal_Preco_varejo,
total_Custo, total_Lucro, total_Preco_Varejo, Porcentagem_Lucro, Margem_Lucro, Valor_Lucro: Real;

begin
// 125, 325
    try
      btnExecuta.Enabled := False;
      btnRetorna.Enabled := False;

        QRel.SQL.Clear;
        QRel.SQL.Add('SELECT PRODUTO_ID, PRODUTOS.DESCRICAO, MARGEM_LUCRO, CUSTO_COMPRA,');
        QRel.SQL.Add('PRECO_VAREJO AS PRECO_VENDA,');
        QRel.SQL.Add('(PRECO_VAREJO - CUSTO_COMPRA) AS LUCRO');
        QRel.SQL.Add('FROM PRODUTOS');
        QRel.SQL.Add('WHERE PRODUTO_ID  >= 0 AND CUSTO_COMPRA > 0');

         //FILTRO POR GRUPO
        if StrToInt(GRUPO_ID.Text) > 0 then
        begin
          QRel.SQL.Add('AND GRUPO_ID =:GRUPO_ID');
          QRel.ParamByName('GRUPO_ID').AsInteger := StrToInt(GRUPO_ID.Text);
        end;


        //FILTRO POR FORNECEDOR
        if StrToInt(Fornecedor.Text) > 0 then
        begin
          QRel.SQL.Add('AND FORNECEDOR_ID =:FORNECEDOR_ID');
          QRel.ParamByName('FORNECEDOR_ID').AsInteger := StrToInt(Fornecedor.Text);
        end;


         //FILTRO POR FAMILIA
        if StrToInt(FAMILIA_ID.Text) > 0 then
        begin
          QRel.SQL.Add('AND FAMILIA_ID=:FAMILIA_ID');
          QRel.ParamByName('FAMILIA_ID').AsInteger := StrToInt(FAMILIA_ID.Text);
        end;


         //FILTRO POR SUBTIPO
        if StrToInt(SubTipo.Text) > 0 then
        begin
          QRel.SQL.Add('AND SUBTIPO_ID =:SUBTIPO_ID');
          QRel.ParamByName('SUBTIPO_ID').AsInteger := StrToInt(SubTipo.Text);
        end;


        // FILTRO TRIBUTAÇÃO
        if StrToInt(Tributacao.Text) > 0 then
        begin
          QRel.Sql.Add('AND (PRODUTOS.TRIBUTO_ID = :TRIBUTO_ID)');
          QRel.ParamByName('TRIBUTO_ID').AsInteger := StrToInt(Tributacao.Text);
        end;


         //FILTRO POR LOCALIZAÇÃO
        if StrToInt(Localizacao.Text) > 0 then
        begin
          QRel.SQL.Add('AND LOCALIZACAO_ID =:LOCALIZACAO_ID');
          QRel.ParamByName('LOCALIZACAO_ID').AsInteger := StrToInt(Localizacao.Text);
        end;


         //FILTRO POR INTERVALO
        if  (StrToInt(Prod_Inicial.Text) >= 0) AND ( StrToInt(Prod_Final.Text) > 0 )  then
        begin
          QRel.SQL.Add('AND PRODUTO_ID BETWEEN :PRODUTO_INICIAL AND :PRODUTO_FINAL');
          QRel.ParamByName('PRODUTO_INICIAL').AsInteger := StrToInt(Prod_Inicial.Text);
          QRel.ParamByName('PRODUTO_FINAL').AsInteger := StrToInt(Prod_Final.Text);
        end;


        QRel.SQL.Add('ORDER BY PRODUTOS.DESCRICAO');
                          
      QRel.Prepare;
      QRel.Open;


      if QRel.IsEmpty then
          Application.MessageBox('Não há dados para serem impressos', PChar(Msg_Title), mb_IconInformation)
      else
      begin

        if CheckBox1.Checked = True then
          Begin
           RDprint1.Impressora := HP;
           RDprint1.FonteTamanhoPadrao := S10cpp;
          End;

          RDprint1.TamanhoQteColunas         := 130;
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

        QRel.First;
        Nome_Grupo := '';
        Media_Porc := 0;

        QRel.Last;
        Qtd := QRel.RecordCount;


        QRel.First;
        while not QRel.Eof do
        Begin

          Valor_Lucro :=   QRel.FieldByName('PRECO_VENDA').AsFloat -  QRel.FieldByName('CUSTO_COMPRA').AsFloat;
          Margem_Lucro :=  ((Valor_Lucro) * 100) / QRel.FieldByName('CUSTO_COMPRA').AsFloat ;

          if Margem_Lucro < 0 then
             Margem_Lucro := 0;


          RDprint1.ImpD(linha, C1+6, QRel.FieldByName('PRODUTO_ID').AsString,[]);
          RDprint1.Imp(linha, C2, Copy(QRel.FieldByName('DESCRICAO').AsString, 1,40));
          RDprint1.ImpVal(linha,C3+5,'###,##0.00', QRel.FieldByName('CUSTO_COMPRA').AsFloat,[]);
          RDprint1.ImpVal(linha,C4+2,'###,##0.00', Margem_Lucro,[]);
          RDprint1.ImpVal(linha,C5+2,'###,##0.00', QRel.FieldByName('PRECO_VENDA').AsFloat,[]);
          RDprint1.ImpVal(linha,C6,'###,##0.00', Valor_Lucro,[]);


          Subtotal_Custo          := Subtotal_Custo  + QRel.FieldByName('CUSTO_COMPRA').AsFloat;
          Subtotal_Preco_varejo   := Subtotal_Preco_varejo + QRel.FieldByName('PRECO_VENDA').AsFloat;
          Subtotal_Lucro          := Subtotal_Lucro  + Valor_Lucro;


          total_Custo          :=  (total_Custo + QRel.FieldByName('CUSTO_COMPRA').AsFloat);
          total_Preco_Varejo   :=  (total_Preco_Varejo  + QRel.FieldByName('PRECO_VENDA').AsFloat);
          total_Lucro          :=  (total_Lucro + Valor_Lucro);
          Media_Porc           :=  (Media_Porc + Margem_Lucro);


          if linha > 63  then
          Begin
           RDprint1.Novapagina;
           Pagina := Pagina + 1;
          End;
          Inc(linha);

          QRel.Next;
        End;


              if linha > 63 then
              begin
                RDprint1.Novapagina;
                Pagina := Pagina + 1;
              end;

              RDprint1.LinhaH(linha,C3,66,0,false);
              RDprint1.LinhaH(linha,C4,81,0,false);
              RDprint1.LinhaH(linha,C5,103,0,false);
              RDprint1.LinhaH(linha,C6,117,0,false);
              Inc(linha);
              RDprint1.ImpVal(linha,C3+5,'###,##0.00', Subtotal_Custo,[negrito]);
              RDprint1.ImpVal(linha,C4+2,'###,##0.00', (Media_Porc / Qtd),[negrito]);
              RDprint1.ImpVal(linha,C5+2,'###,##0.00', Subtotal_Preco_varejo,[negrito]);
              RDprint1.ImpVal(linha,C6,'###,##0.00',   Subtotal_Lucro,[negrito]);

              Subtotal_Custo          := 0;
              Subtotal_Preco_varejo   := 0;
              Subtotal_Lucro          := 0;

              if linha > 63 then
              begin
                RDprint1.Novapagina;
                Pagina := Pagina + 1;
              end;

              Inc(linha);
              Inc(linha);

              RDprint1.LinhaH(linha,C3,66,0,false);
              RDprint1.LinhaH(linha,C4,81,0,false);
              RDprint1.LinhaH(linha,C5,101,0,false);
              RDprint1.LinhaH(linha,C6,117,0,false);
              Inc(linha); 

              RDprint1.ImpD(linha,C3+15, FormatFloat('###,##0.00', total_Custo),[]);
              RDprint1.ImpVal(linha,C4+2,'###,##0.00', (Media_Porc / Qtd),[negrito]);
              RDprint1.ImpD(linha,C5+12, FormatFloat('###,##0.00', total_Preco_Varejo),[]);
              RDprint1.ImpD(linha,C6+10, FormatFloat('###,##0.00', total_Lucro),[]);

              if linha > 63 then
              begin
                RDprint1.Novapagina;
                Pagina := Pagina + 1;
              end;


              inc(linha);
              inc(linha);


              // CALCULO SOBRE O PREÇO FINAL AO CONSUMIDOR
              Porcentagem_Lucro := RoundTo( ((total_Lucro * 100) / total_Preco_Varejo), -2 );
              RDprint1.ImpF(linha, C5,'  Lucro Bruto: '+ FormatFloat('###,##0.00', Porcentagem_Lucro)+'%',[negrito]);


                inc(linha);
                inc(linha);


              // CALCULO SOBRE O CUSTO
              Porcentagem_Lucro := RoundTo( ((total_Lucro * 100) / total_Custo), -2 );
              RDprint1.ImpF(linha, C5,'Lucro Líquido: '+ FormatFloat('###,##0.00', Porcentagem_Lucro)+'%',[negrito]);
             

              Porcentagem_Lucro  := 0;
              total_Custo        := 0;
              total_Preco_Varejo := 0;
              total_Lucro        := 0;
              Porcentagem_Lucro  := 0;

       Application.ProcessMessages;
       RDprint1.TamanhoQteLinhas:= 66;
       RDprint1.Fechar;
      end;

    finally
      btnExecuta.Enabled := True;
      btnRetorna.Enabled := True;
    end;   
end;

procedure TFrmMargem_Lucro.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmMargem_Lucro.btnSub_TipoClick(Sender: TObject);
begin
    try
    SubTipo.Value := GetConsulta('SUBTIPOS', 0, 0, StrToInt(SubTipo.Text));
  except
    SubTipo.Value := GetConsulta('SUBTIPOS', 0, 0, 0);
  end;
end;

procedure TFrmMargem_Lucro.BtnTributacaoClick(Sender: TObject);
begin
   try
    Tributacao.Value := GetConsulta('TRIBUTOS', 0, 0, StrToInt(Localizacao.Text));
  except
    Tributacao.Value := GetConsulta('TRIBUTOS', 0, 0, 0);
  end;
end;

procedure TFrmMargem_Lucro.ProdutoChange(Sender: TObject);
begin
  if GRUPO_ID.Value > 0 then
    SearchProduto;
end;

procedure TFrmMargem_Lucro.Prod_FinalExit(Sender: TObject);
begin
  DetailSearch('Produto Final');
end;

procedure TFrmMargem_Lucro.Prod_FinalKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = FAMILIA_ID) then
    btnGrupoClick(Self);

  if (Key = Vk_F7) and (Sender = Fornecedor) then
    btnFornecedorClick(Self);

  if (Key = Vk_F7) and (Sender = GRUPO_ID) then
    btnGrupoClick(Self);

  if (Key = Vk_F7) and (Sender = SubTipo) then
    btnSub_TipoClick(Self);

  if (Key = Vk_F7) and (Sender = Localizacao) then
    btnLocalizacaoClick(Self);

  if (Key = Vk_F7) and (Sender = Prod_Inicial) then
    btnProd_InicialClick(Self);

  if (Key = Vk_F7) and (Sender = Prod_Final) then
    btnProd_FinalClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmMargem_Lucro.Prod_InicialExit(Sender: TObject);
begin
  DetailSearch('Produto Inicial');
end;

procedure TFrmMargem_Lucro.Prod_InicialKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = FAMILIA_ID) then
    btnGrupoClick(Self);

  if (Key = Vk_F7) and (Sender = Fornecedor) then
    btnFornecedorClick(Self);

  if (Key = Vk_F7) and (Sender = GRUPO_ID) then
    btnGrupoClick(Self);

  if (Key = Vk_F7) and (Sender = SubTipo) then
    btnSub_TipoClick(Self);

  if (Key = Vk_F7) and (Sender = Localizacao) then
    btnLocalizacaoClick(Self);

  if (Key = Vk_F7) and (Sender = Prod_Inicial) then
    btnProd_InicialClick(Self);

  if (Key = Vk_F7) and (Sender = Prod_Final) then
    btnProd_FinalClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmMargem_Lucro.GRUPO_IDChange(Sender: TObject);
begin
  DetailSearch('Grupo');
end;

procedure TFrmMargem_Lucro.GRUPO_IDExit(Sender: TObject);
begin
    DetailSearch('Grupo');
end;


procedure TFrmMargem_Lucro.DetailSearch(Tabela: String);
begin

 if ((Tabela = '') or (Tabela = 'Fornecedor')) and (Fornecedor.Text <> '') then
  begin
    QFornecedor.Close;
    QFornecedor.ParamByName('FORNECEDOR_ID').AsInteger := StrToInt(Fornecedor.Text);
    QFornecedor.Prepare;
    QFornecedor.Open;
  end;

  if ((Tabela = '') or (Tabela = 'Grupo')) and (GRUPO_ID.Text <> '') then
  begin
    QGrupo.Close;
    QGrupo.ParamByName('TABELA_ID').AsInteger := StrToInt(GRUPO_ID.Text);
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

  if ((Tabela = '') or (Tabela = 'Familia')) and (FAMILIA_ID.Text <> '') then
  begin
    QFamilia.Close;
    QFamilia.ParamByName('TABELA_ID').AsInteger := StrToInt(FAMILIA_ID.Text);
    QFamilia.Prepare;
    QFamilia.Open;
  end;


end;

procedure TFrmMargem_Lucro.GRUPO_IDKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if (Key = Vk_F7) and (Sender = FAMILIA_ID) then
    btnGrupoClick(Self);
    
  if (Key = Vk_F7) and (Sender = Fornecedor) then
    btnFornecedorClick(Self);

  if (Key = Vk_F7) and (Sender = GRUPO_ID) then
    btnGrupoClick(Self);

  if (Key = Vk_F7) and (Sender = SubTipo) then
    btnSub_TipoClick(Self);

  if (Key = Vk_F7) and (Sender = Localizacao) then
    btnLocalizacaoClick(Self);

  if (Key = Vk_F7) and (Sender = Prod_Inicial) then
    btnProd_InicialClick(Self);

  if (Key = Vk_F7) and (Sender = Prod_Final) then
    btnProd_FinalClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmMargem_Lucro.LocalizacaoChange(Sender: TObject);
begin
  DetailSearch('Localização');
end;

procedure TFrmMargem_Lucro.LocalizacaoExit(Sender: TObject);
begin
   DetailSearch('Localização');
end;

procedure TFrmMargem_Lucro.LocalizacaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (Key = Vk_F7) and (Sender = FAMILIA_ID) then
    btnGrupoClick(Self);

  if (Key = Vk_F7) and (Sender = Fornecedor) then
    btnFornecedorClick(Self);

  if (Key = Vk_F7) and (Sender = GRUPO_ID) then
    btnGrupoClick(Self);

  if (Key = Vk_F7) and (Sender = SubTipo) then
    btnSub_TipoClick(Self);

  if (Key = Vk_F7) and (Sender = Localizacao) then
    btnLocalizacaoClick(Self);

  if (Key = Vk_F7) and (Sender = Prod_Inicial) then
    btnProd_InicialClick(Self);

  if (Key = Vk_F7) and (Sender = Prod_Final) then
    btnProd_FinalClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmMargem_Lucro.RDprint1NewPage(Sender: TObject; Pagina: Integer);
begin

    //posição das colulas
       C1 := 01;
       C2 := 09;
       C3 := 51;
       C4 := 70;
       C5 := 90;
       C6 := 108;


      RDprint1.Imp(01, 01, FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString);
      RDprint1.ImpDir(01, (length(FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString)), 130, 'Sistema de Automação de empresas Eficaz', []);
      RDprint1.Imp(02, 01, 'Data/Hora: ' + DateToStr(date) + ' - ' + TimeToStr(now));
      RDprint1.impDir(02, 80, 130, 'Página: ' + IntToStr(Pagina), []);
      RDprint1.impC(03, 60, '*** RELATÓRIO DE MARGEM DE LUCRO ***',[negrito]);



        if StrToInt(GRUPO_ID.Text) = 0 then
         RDprint1.imp(05, C1, 'Grupo: Todos')
        else
         RDprint1.Imp(05, C1, 'Grupo: '+ QGrupo.FieldByName('DESCRICAO').AsString);


        if StrToInt(FAMILIA_ID.Text) = 0 then
         RDprint1.imp(05, C3, 'Família: Todos')
        else
         RDprint1.Imp(05, C3, 'Família: '+ QFamilia.FieldByName('DESCRICAO').AsString);


         if StrToInt(Fornecedor.Text) = 0 then
         RDprint1.imp(05, C5, 'Fornecedor: Todos')
        else
         RDprint1.Imp(05, C5, 'Fornecedor: '+ Copy( QFornecedor.FieldByName('NOME').AsString, 1,20));


         if StrToInt(SubTipo.Text) = 0 then
         RDprint1.imp(06, C1, 'Subtipo: Todos')
        else
         RDprint1.Imp(06, C1, 'Subtipo: '+ QSubtipo.FieldByName('DESCRICAO').AsString);


        if StrToInt(Localizacao.Text) = 0 then
         RDprint1.imp(06, C3, 'Localização: Todos')
        else
         RDprint1.Imp(06, C3, 'Localização: '+ QLocalizacao.FieldByName('DESCRICAO').AsString);



         if (StrToInt(Prod_Inicial.Text) >= 0) AND ( StrToInt(Prod_Final.Text) > 0 )  then
             RDprint1.Imp(06, C5, 'Intervalo: ' + 'de '+ Prod_Inicial.Text +' a '+ Prod_Final.Text +'') ;



            RDprint1.LinhaH(07,01,130,0,false);
            RDprint1.impD(08, C1, 'Id',[]);
            RDprint1.imp(08, C2, 'Produto');
            RDprint1.imp(08, C3+4, 'Custo Compra');
            RDprint1.imp(08, C4, 'M. de Lucro (%)');
            RDprint1.imp(08, C5, 'Preço Varejo');
            RDprint1.imp(08, C6+5, 'Lucro');
            linha := 09;

end;

procedure TFrmMargem_Lucro.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  
  Saldo := Saldo + QRel.FieldByName('COMPRA').AsFloat      + QRel.FieldByName('DEV_VENDA').AsFloat +
                   QRel.FieldByName('DEV_CONSUMO').AsFloat + QRel.FieldByName('E_TRANSF').AsFloat -
                   QRel.FieldByName('VENDA').AsFloat       - QRel.FieldByName('DEV_COMPRA').AsFloat -
                   QRel.FieldByName('CONSUMO').AsFloat     - QRel.FieldByName('S_TRANSF').AsFloat;
end;

procedure TFrmMargem_Lucro.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmMargem_Lucro.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    //Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmMargem_Lucro.ExtratoBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  Saldo := Sd;
end;

procedure TFrmMargem_Lucro.FAMILIA_IDChange(Sender: TObject);
begin
  DetailSearch('Familia');
end;

procedure TFrmMargem_Lucro.FAMILIA_IDExit(Sender: TObject);
begin
    DetailSearch('Familia');
end;

procedure TFrmMargem_Lucro.FAMILIA_IDKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin


 if (Key = Vk_F7) and (Sender = FAMILIA_ID) then
    btnGrupoClick(Self);

  if (Key = Vk_F7) and (Sender = Fornecedor) then
    btnFornecedorClick(Self);

  if (Key = Vk_F7) and (Sender = GRUPO_ID) then
    btnGrupoClick(Self);

  if (Key = Vk_F7) and (Sender = SubTipo) then
    btnSub_TipoClick(Self);

  if (Key = Vk_F7) and (Sender = Localizacao) then
    btnLocalizacaoClick(Self);

  if (Key = Vk_F7) and (Sender = Prod_Inicial) then
    btnProd_InicialClick(Self);

  if (Key = Vk_F7) and (Sender = Prod_Final) then
    btnProd_FinalClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);

end;

procedure TFrmMargem_Lucro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmMargem_Lucro.FormShow(Sender: TObject);
begin
   if LeIni(Arq_Ini, 'Parâmetros Estoque', 'Fornecedor') <> '' then
    Fornecedor.Value := StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Fornecedor'));

  if LeIni(Arq_Ini, 'Parâmetros Estoque', 'Grupo') <> '' then
    GRUPO_ID.Value := StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Grupo'));

  if LeIni(Arq_Ini, 'Parâmetros Estoque', 'SubTipo') <> '' then
    SubTipo.Value := StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'SubTipo'));

  if LeIni(Arq_Ini, 'Parâmetros Estoque', 'Família') <> '' then
     FAMILIA_ID.Value := StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Família'));

  if LeIni(Arq_Ini, 'Parâmetros Estoque', 'Localização') <> '' then
    Localizacao.Value := StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Localização'));

  if LeIni(Arq_Ini, 'Parâmetros Estoque', 'Tributação') <> '' then
    Tributacao.Value := StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Tributação'));

  if LeIni(Arq_Ini, 'Parâmetros Estoque', 'Produto Inicial') <> '' then
    Prod_Inicial.Value := StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Produto Inicial'));

  if LeIni(Arq_Ini, 'Parâmetros Estoque', 'Produto Final') <> '' then
    Prod_Final.Value := StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Produto Final'));

end;

procedure TFrmMargem_Lucro.FornecedorChange(Sender: TObject);
begin
   DetailSearch('Fornecedor');
end;

procedure TFrmMargem_Lucro.FornecedorExit(Sender: TObject);
begin
  DetailSearch('Fornecedor');
end;

procedure TFrmMargem_Lucro.FornecedorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (Key = Vk_F7) and (Sender = FAMILIA_ID) then
    btnGrupoClick(Self);

    if (Key = Vk_F7) and (Sender = Fornecedor) then
    btnFornecedorClick(Self);

  if (Key = Vk_F7) and (Sender = GRUPO_ID) then
    btnGrupoClick(Self);

  if (Key = Vk_F7) and (Sender = SubTipo) then
    btnSub_TipoClick(Self);

  if (Key = Vk_F7) and (Sender = Localizacao) then
    btnLocalizacaoClick(Self);

  if (Key = Vk_F7) and (Sender = Prod_Inicial) then
    btnProd_InicialClick(Self);

  if (Key = Vk_F7) and (Sender = Prod_Final) then
    btnProd_FinalClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

end.
