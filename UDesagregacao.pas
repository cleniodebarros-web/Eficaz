unit UDesagregacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, RxToolEdit, RxCurrEdit,System.Math,
  frxClass, Vcl.ComCtrls;

type
  TFrmDesagregacao = class(TForm)
    btnExecuta: TBitBtn;
    btnRetorna: TBitBtn;
    DBGrid1: TDBGrid;
    btnIncluir: TBitBtn;
    QProdutos: TFDQuery;
    DataProdutos: TDataSource;
    DataDesagregacao: TDataSource;
    FdDesagregacao: TFDMemTable;
    FdDesagregacaocodigo: TIntegerField;
    FdDesagregacaoDescricao: TStringField;
    FdDesagregacaoCategoria: TStringField;
    FdDesagregacaoQuantidade_perda: TFloatField;
    FdDesagregacaoQuantidade_Total: TFloatField;
    Label4: TLabel;
    Quantidade: TRxCalcEdit;
    FdQuery: TFDQuery;
    IQuery: TFDQuery;
    QRel: TFDQuery;
    QTributo: TFDQuery;
    QUPDATE: TFDQuery;
    FdDesagregacaoQuantidade: TFloatField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label3: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit4: TDBEdit;
    DBEdit2: TDBEdit;
    Produto_ID: TCurrencyEdit;
    btnProduto: TSpeedButton;
    Label5: TLabel;
    Perda_id: TCurrencyEdit;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    btnperda: TSpeedButton;
    QPerda: TFDQuery;
    DataPerda: TDataSource;
    StatusBar6: TStatusBar;
    QSearch: TFDQuery;
    procedure btnProdutoClick(Sender: TObject);
    procedure Produto_IDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Produto_IDExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRetornaClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure Perda_idExit(Sender: TObject);
    procedure btnperdaClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDesagregacao: TFrmDesagregacao;

implementation
uses
  UPrincipal, UData, UConsulta;

{$R *.dfm}

procedure TFrmDesagregacao.btnExecutaClick(Sender: TObject);
var
id_trans,itens:integer;
Unidades, Desconto, Valor_Produtos, Base_ICMS_Normal, Vr_ICMS_Normal, Base_ICMS_ST, Vr_ICMS_ST, Vr_Isento, Vr_Unit,Vr_Unit_p, Vr_Desc, Vr_Item, Base_ICMS_Normal_T, Vr_ICMS_Normal_T, Base_ICMS_ST_T, Vr_ICMS_ST_T, Aliquota_Inter_Estadual: Real;
Cst, CFOP, Condicao,List_cupom, InputSerial,List_Chave: String;
VALOR_BASE_CBS_IBS , Valor_CBS , VALOR_IBSUF, VALOR_IBSMUNIC  :real;
Vr_bccbsibs_T, Vr_cbs_t, Vr_IBS_t, Vr_ibsmunic_t :real;
begin

    Produto_id.Color := clWindow;
    Perda_id.Color   := clWindow;
    Quantidade.Color := clWindow;

    if QProdutos.IsEmpty then
    begin
      Application.MessageBox('Favor indicar o produto a ser desagregado.', PChar(Msg_Title), mb_IconStop);

      Produto_id.Color := clYellow;
      Produto_id.SetFocus;

      exit;
    end;

    if QPerda.IsEmpty then
    begin
      Application.MessageBox('Favor indicar o produto para perda.', PChar(Msg_Title), mb_IconStop);

      TabSheet2.Show;
      Perda_id.Color := clYellow;
      Perda_id.SetFocus;

      exit;
    end;

    if Quantidade.value <= 0 then
    begin
      Application.MessageBox('Quandidade a ser desagregada deve ser maior do que 0.', PChar(Msg_Title), mb_IconStop);

      Quantidade.Color := clYellow;
      Quantidade.SetFocus;

      exit;
    end;



  if Application.MessageBox('Confirma a desagregação do(s) produto(s)?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = IDYES then
  Begin
   FdDesagregacao.First;

     while not FdDesagregacao.Eof Do
     Begin
        // nota de saida quantidade normal
        IQuery.SQL.Clear;
        IQuery.SQL.Add('SELECT NEXTVAL(:GEN_TRANSACOES) ID');
        IQuery.ParamByName('GEN_TRANSACOES').AsString :=  'GEN_TRANSACOES';

        IQuery.Prepare;
        IQuery.Open;

        Id_Trans := IQuery.FieldByName('ID').AsInteger;

        IQuery.SQL.Clear;
        IQuery.SQL.Add('INSERT INTO COMPL_NFISCAL(TRANSACAO_ID,DT_SAIDA,NO_DOC_FISCAL,SERIE,EMPRESA_ID) values(:TRANSACAO_ID, :DT_SAIDA,:NO_DOC_FISCAL,:SERIE, :EMPRESA_ID)');
        IQuery.ParamByName('TRANSACAO_ID').AsInteger  := ID_TRANS;
        IQuery.ParamByName('NO_DOC_FISCAL').AsInteger := 0;
        IQuery.ParamByName('SERIE').AsString          := '001';
        IQuery.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
        IQuery.ParamByName('DT_SAIDA').AsDatetime     := Date;

        IQuery.Prepare;
        IQuery.ExecSQL;



        IQuery.SQL.Clear;
        IQuery.SQL.Add('SELECT NO_DOC_FISCAL FROM COMPL_NFISCAL WHERE TRANSACAO_ID = :TRANSACAO_ID');
        IQuery.ParamByName('TRANSACAO_ID').AsInteger  := id_trans;


        IQuery.Prepare;
        IQuery.Open;

        QSearch.Sql.Clear;
        QSearch.sql.add('SELECT CLIENTE_ID FROM CLIENTES WHERE CNPJ = :CNPJ');
        QSearch.ParambyName('CNPJ').AsString := FrmPrincipal.QEmpresa.FieldbyName('CNPJ').AsString;
        QSearch.Prepare;
        QSearch.Open;


        QRel.Sql.Clear;
        QRel.Sql.Add('INSERT INTO TRANSACOES( ' +
                     'TRANSACAO_ID,  DT_TRANS,    DT_MOVIMENTO,    CONDUTA, ' +
                     'DEPTO,         EMPRESA_ID,  CONTA_ID,        C_CUSTO_ID, ' +
                     'VALOR,         TPCTB,       AUTORIZ_ID,      HISTORICO, ' +
                     'CONTAAUX_ID,   NUM_DOC,     BANCO_ID,        BALANCO, ' +
                     'COND_PAGTO,    SERIE,       FLUXO_CAIXA_ID,  TIPO_VENDA, ' +
                     'MODELO,      SUB_CODIGO,HORA,DT_SPED,CLIENTE_ID) VALUES(' +
                     ':TRANSACAO_ID, :DT_TRANS,   :DT_MOVIMENTO,   :CONDUTA, ' +
                     ':DEPTO,        :EMPRESA_ID, :CONTA_ID,       :C_CUSTO_ID, ' +
                     ':VALOR,        :TPCTB,      :AUTORIZ_ID,     :HISTORICO, ' +
                     ':CONTAAUX_ID,  :NUM_DOC,    :BANCO_ID,       :BALANCO, ' +
                     ':COND_PAGTO,   :SERIE,      :FLUXO_CAIXA_ID, :TIPO_VENDA, ' +
                     ':MODELO,     :SUB_CODIGO,:HORA,:DT_SPED,:CLIENTE_ID)');

        QRel.ParamByName('TRANSACAO_ID').AsInteger   := Id_Trans;
        QRel.ParamByName('DT_TRANS').AsDateTime      := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
        QRel.ParamByName('DT_MOVIMENTO').AsDateTime  := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
        QRel.ParamByName('DT_SPED').AsDateTime       := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
        QRel.ParamByName('CONDUTA').AsString         := '01';
        QRel.ParamByName('DEPTO').AsString           := '07';
        QRel.ParamByName('EMPRESA_ID').AsInteger     := FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger;;
        QRel.ParamByName('CONTA_ID').AsInteger       := FrmPrincipal.Config.FieldByName('CONTA_ESTOQUE').AsInteger;
        QRel.ParamByName('C_CUSTO_ID').AsInteger     := 1;
        QRel.ParamByName('VALOR').AsFloat            := 0;
        QRel.ParamByName('TPCTB').AsString           := '2';
        QRel.ParamByName('AUTORIZ_ID').AsInteger     := 0;
        QRel.ParamByName('HISTORICO').AsString       := 'VENDA REFERENTE DESAGREGAÇÃO ' + StrZero(IQuery.FieldByName('NO_DOC_FISCAL').AsString,9,0);
        QRel.ParamByName('CONTAAUX_ID').AsInteger    := 0;
        QRel.ParamByName('NUM_DOC').AsString         := StrZero(IQuery.FieldByName('NO_DOC_FISCAL').AsString,9,0);
        QRel.ParamByName('BANCO_ID').AsInteger       := StrToInt(LeIni(Arq_Ini, 'Sistema', 'Caixa'));
        QRel.ParamByName('BALANCO').AsString         := 'LIBERADO';
        QRel.ParamByName('COND_PAGTO').AsString      := 'A VISTA';
        QRel.ParamByName('SERIE').AsString           := '001';
        QRel.ParamByName('FLUXO_CAIXA_ID').AsInteger := 2;
        QRel.ParamByName('TIPO_VENDA').AsString      := 'VENDA';
        QRel.ParamByName('MODELO').AsString          := '55';
        QRel.ParamByName('SUB_CODIGO').AsString      := '1 - NORMAL';
        QRel.ParamByName('HORA').AsString            := TimeToStr(time);

        IF  QSearch.FieldbyName('CLIENTE_ID').AsInteger > 0 Then
        QRel.ParamByName('CLIENTE_ID').AsInteger  := QSearch.FieldbyName('CLIENTE_ID').AsInteger
        Else
        QRel.ParamByName('CLIENTE_ID').AsInteger  := 0;

        QRel.Prepare;
        QRel.ExecSql;


       {
        IQuery.SQL.Clear;
        IQuery.SQL.Add('INSERT INTO COMPL_NFISCAL(TRANSACAO_ID,DT_SAIDA,NO_DOC_FISCAL,SERIE,EMPRESA_ID) values(:TRANSACAO_ID, :DT_SAIDA,:NO_DOC_FISCAL,:SERIE, :EMPRESA_ID)');
        IQuery.ParamByName('TRANSACAO_ID').AsInteger  := ID_TRANS;
        IQuery.ParamByName('NO_DOC_FISCAL').AsInteger := 0;
        IQuery.ParamByName('SERIE').AsString          := '001';
        IQuery.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
        IQuery.ParamByName('DT_SAIDA').AsDatetime     := Date;

        IQuery.Prepare;
        IQuery.ExecSQL;
        }

        QSearch.Sql.Clear;
        QSearch.Sql.Add('SELECT * ');
        QSearch.Sql.Add('FROM PRODUTOS ');
        QSearch.Sql.Add('WHERE');
        QSearch.Sql.Add('PRODUTO_ID = :PRODUTO_ID');

        QSearch.ParamByName('PRODUTO_ID').AsInteger :=  StrToInt(Produto_id.text); //QProdutos.FieldByName('PRODUTO_ID').AsInteger;

        QSearch.Prepare;
        QSearch.Open;


        QRel.Sql.Clear;
        QRel.Sql.Add('SELECT * ');
        QRel.Sql.Add('FROM DESAGREGACAO_ITENS ');
        QRel.Sql.Add('WHERE');
        QRel.Sql.Add('INSUMO_ID = :INSUMO_ID');
        QRel.ParamByName('INSUMO_ID').AsInteger :=  StrToInt(Perda_Id.Text);//QPerda.FieldByName('PRODUTO_ID').AsInteger;

        QRel.Prepare;
        QRel.Open;



          QTributo.Sql.Clear;
          QTributo.Sql.Add('SELECT * FROM TRIBUTOS');
          QTributo.Sql.Add('WHERE');
          QTributo.Sql.Add('(TRIBUTO_ID = :TRIBUTO_ID)');

          QTributo.ParamByName('TRIBUTO_ID').AsInteger := QSearch.FieldByName('TRIBUTO_ID').AsInteger;

          QTributo.Prepare;
          QTributo.Open;

          CFOP := QTributo.FieldByName('CFOP').AsString;

          Itens            := 0;
          Base_ICMS_Normal := 0;
          Vr_ICMS_Normal   := 0;
          Base_ICMS_ST     := 0;
          Vr_ICMS_ST       := 0;
          Vr_Unit          := QSearch.FieldByName('CUSTO_COMPRA').AsFloat;
          Vr_Desc          := 0;
          Vr_Item          := RoundTo(Vr_Unit * FdDesagregacao.FieldByName('QUANTIDADE_PERDA').AsFloat,-2) ;//Vr_Unit * RoundTo(((FdDesagregacao.FieldByname('QUANTIDADE').AsFloat * QRel.FieldByName('QUANTIDADE_FIM').AsFloat) /100), -2);//RoundTo(QRel.FieldByName('CUSTO_COMPRA').AsFloat * FdDesagregacao.FieldByName('QUANTIDADE').AsFloat,-2) ; //((Vr_Unit - Vr_Desc) * QRel.FieldByName('QUANTIDADE').AsFloat);
          Vr_unit_p        := Vr_Unit;// * RoundTo(((FdDesagregacao.FieldByname('QUANTIDADE').AsFloat * QRel.FieldByName('QUANTIDADE_FIM').AsFloat) /100), -2);//Vr_Unit ;


          VALOR_BASE_CBS_IBS := 0;
          Valor_CBS          := 0;
          VALOR_IBSUF        := 0;
          VALOR_IBSMUNIC     := 0;

          Vr_bccbsibs_T      := 0;
          Vr_cbs_t           := 0;
          Vr_IBS_t           := 0;
          Vr_ibsmunic_t      := 0;




          if QSearch.FieldByName('ALIQUOTA_ICMS').AsFloat > 0 then
          begin
            Base_ICMS_Normal := Vr_Item;
            Vr_ICMS_Normal   := 0;//((Base_ICMS_Normal * QProduto.FieldByName('ALIQUOTA_ICMS').AsFloat) / 100);
          end
          else
          begin
            Base_ICMS_Normal := 0;
            Vr_ICMS_Normal   := 0;
          end;

          Cst := Copy(QTributo.FieldByName('ORIGEM').AsString, 1, 1) + Copy(QTributo.FieldByName('TRIBUTACAO').AsString, 1, 2);

          if (Cst = '010') or (Cst = '030') or (Cst = '060') or (Cst = '070') then
          begin
            Base_ICMS_ST := 0; //(Vr_Item + ((Vr_Item * QProduto.FieldByName('MVA').AsFloat) / 100));
            Vr_ICMS_ST   := 0; //(((Base_ICMS_ST * Aliquota_ICMS_Local) / 100) - RoundTo(((Vr_Item * Aliquota_Inter_Estadual) / 100), -2));
          end
          else
          begin
            Base_ICMS_ST := 0;
            Vr_ICMS_ST   := 0;
          end;

          if (Cst = '040') or (Cst = '041') or (Cst = '050') then
            Vr_Isento := Vr_Item
          else
            Vr_Isento := 0;

          QUpdate.Sql.Clear;
          QUpdate.Sql.Add('INSERT INTO TRANSITENS( ' +
                          'TRANSACAO_ID,   PRODUTO_ID,      TP_PROD_SERV,   CFOP, ' +
                          'DESCRICAO,      CONTA_ID,        TRIBUTO_ID,     CST, ' +
                          'MVA,            BASE_CALC_ICMS,  ALIQUOTA_ICMS,  VALOR_ICMS, ' +
                          'BASE_CALC_ST,   VALOR_ICMS_ST,   VALOR_ISENTO,   VALOR_OUTROS, ' +
                          'VR_IPI,         QUANTIDADE,      VR_UNITARIO,    VR_DESCONTO, ' +
                          'VR_TOTAL,CST_PIS,CST_COFINS,DESC_RODAPE,SEQUENCIA, ' +
                          'COD_CLASSTRIB,  CST_CBSIBS,       ALIQ_CBS,      ALIQ_IBSUF , ' +
                          'ALIQ_EF_IBSUF,  ALIQ_EF_CBS,     REDUCAO_CBS_IBS , ALIQ_IBSMUNIC)' +
                          'VALUES(' +
                          ':TRANSACAO_ID,  :PRODUTO_ID,     :TP_PROD_SERV,  :CFOP, ' +
                          ':DESCRICAO,     :CONTA_ID,       :TRIBUTO_ID,    :CST, ' +
                          ':MVA,           :BASE_CALC_ICMS, :ALIQUOTA_ICMS, :VALOR_ICMS, ' +
                          ':BASE_CALC_ST,  :VALOR_ICMS_ST,  :VALOR_ISENTO,  :VALOR_OUTROS, ' +
                          ':VR_IPI,        :QUANTIDADE,     :VR_UNITARIO,   :VR_DESCONTO, ' +
                          ':VR_TOTAL,      :CST_PIS,        :CST_COFINS,    :DESC_RODAPE,:SEQUENCIA , + ' +
                          ':COD_CLASSTRIB, :CST_CBSIBS,     :ALIQ_CBS,      :ALIQ_IBSUF , ' +
                          ':ALIQ_EF_IBSUF,  :ALIQ_EF_CBS,   :REDUCAO_CBS_IBS , :ALIQ_IBSMUNIC)');


          QUpdate.ParamByName('TRANSACAO_ID').AsInteger  := Id_Trans;
          QUpdate.ParamByName('PRODUTO_ID').AsInteger    := QPerda.FieldByName('PRODUTO_ID').AsInteger;
          QUpdate.ParamByName('TP_PROD_SERV').AsString   := 'P';
          QUpdate.ParamByName('CFOP').AsString           := '5927'; // QTributo.FieldByName('CFOP').AsString;
          QUpdate.ParamByName('DESCRICAO').AsString      := QPerda.FieldByName('DESCRICAO').AsString;
          QUpdate.ParamByName('CONTA_ID').AsInteger      := FrmPrincipal.Config.FieldByName('CONTA_ESTOQUE').AsInteger;
          QUpdate.ParamByName('TRIBUTO_ID').AsInteger    := QSearch.FieldByName('TRIBUTO_ID').AsInteger;

          if FrmPrincipal.QEmpresa.FieldByName('CRT').AsString <> '1 - SIMPLES NACIONAL' then
          QUpdate.ParamByName('CST').AsString            := '041'//Copy(QTributo.FieldByName('ORIGEM').AsString, 1, 1) + Copy(QTributo.FieldByName('TRIBUTACAO').AsString, 1, 2)
          Else
          QUpdate.ParamByName('CST').AsString            := QSearch.FieldByName('CSOSN').AsString;

          QUpdate.ParamByName('MVA').AsFloat             := QSearch.FieldByName('MVA').AsFloat;
          QUpdate.ParamByName('BASE_CALC_ICMS').AsFloat  := 0;//RoundTo(Base_ICMS_Normal, -2);
          QUpdate.ParamByName('ALIQUOTA_ICMS').AsFloat   := 0;//QProduto.FieldByName('ALIQUOTA_ICMS').AsFloat;
          QUpdate.ParamByName('VALOR_ICMS').AsFloat      := 0;//RoundTo(Vr_ICMS_Normal, -2);
          QUpdate.ParamByName('BASE_CALC_ST').AsFloat    := RoundTo(Base_ICMS_ST, -2);
          QUpdate.ParamByName('VALOR_ICMS_ST').AsFloat   := RoundTo(Vr_ICMS_ST, -2);
          QUpdate.ParamByName('VALOR_ISENTO').AsFloat    := RoundTo(Vr_Isento, -2);
          QUpdate.ParamByName('VALOR_OUTROS').AsFloat    := 0;
          QUpdate.ParamByName('VR_IPI').AsFloat          := 0;
          QUpdate.ParamByName('QUANTIDADE').AsFloat      := FdDesagregacao.FieldByname('QUANTIDADE_PERDA').AsFloat; //RoundTo(((FdDesagregacao.FieldByname('QUANTIDADE_PERDA').AsFloat * QRel.FieldByName('QUANTIDADE_FIM').AsFloat) /100), -2);//RoundTo(FdDesagregacao.FieldByName('QUANTIDADE').AsFloat, -2);
          QUpdate.ParamByName('VR_UNITARIO').AsFloat     := RoundTo(Vr_Unit, -2);
          QUpdate.ParamByName('VR_DESCONTO').AsFloat     := 0;
          QUpdate.ParamByName('VR_TOTAL').AsFloat        := RoundTo(Vr_Item, -2);
          QUpdate.ParamByName('CST_PIS').AsString        := '49';
          QUpdate.ParamByName('CST_COFINS').AsString     := '49';
          QUpdate.ParamByName('DESC_RODAPE').AsFloat     := RoundTo(Vr_Desc, -2);
          QUpdate.ParamByName('SEQUENCIA').AsInteger     := Itens + 1;
          QUpdate.ParamByName('COD_CLASSTRIB').AsString := QSearch.FieldByName('CLASSTRIBUTARIA').AsString;
          QUpdate.ParamByName('CST_CBSIBS').AsInteger   := QSearch.FieldByName('CST_CBS_IBS').AsInteger;



          if QSearch.FieldByName('REDUCAO_CBS_IBS').AsFloat = 60 then
          Begin
          QUpdate.ParamByName('REDUCAO_CBS_IBS').AsFloat   := QSearch.FieldByName('REDUCAO_CBS_IBS').AsFloat;
          QUpdate.ParamByName('ALIQ_CBS').AsFloat          := QSearch.FieldByName('ALIQUOTA_CBS').AsFloat;
          QUpdate.ParamByName('ALIQ_IBSUF').AsFloat        := QSearch.FieldByName('ALIQUOTA_IBS_UF').AsFloat;
          QUpdate.ParamByName('ALIQ_EF_CBS').AsFloat       := 0.36;
          QUpdate.ParamByName('ALIQ_EF_IBSUF').AsFloat     := 0.04;
          End
          Else if QSearch.FieldByName('REDUCAO_CBS_IBS').AsFloat = 100 Then
          Begin
          QUpdate.ParamByName('ALIQ_CBS').AsFloat        := QSearch.FieldByName('ALIQUOTA_CBS').AsFloat;
          QUpdate.ParamByName('ALIQ_IBSUF').AsFloat      := QSearch.FieldByName('ALIQUOTA_IBS_UF').AsFloat;
          QUpdate.ParamByName('REDUCAO_CBS_IBS').AsFloat := QSearch.FieldByName('REDUCAO_CBS_IBS').AsFloat;
          QUpdate.ParamByName('ALIQ_EF_CBS').AsFloat     := 0;
          QUpdate.ParamByName('ALIQ_EF_IBSUF').AsFloat   := 0
          End
          Else
          Begin
          QUpdate.ParamByName('ALIQ_CBS').AsFloat        := QSearch.FieldByName('ALIQUOTA_CBS').AsFloat;
          QUpdate.ParamByName('ALIQ_IBSUF').AsFloat      := QSearch.FieldByName('ALIQUOTA_IBS_UF').AsFloat;
          QUpdate.ParamByName('REDUCAO_CBS_IBS').AsFloat := QSearch.FieldByName('REDUCAO_CBS_IBS').AsFloat;
          QUpdate.ParamByName('ALIQ_EF_CBS').AsFloat     := 0;
          QUpdate.ParamByName('ALIQ_EF_IBSUF').AsFloat   := 0;

          End;

          QUpdate.ParamByName('ALIQ_IBSMUNIC').AsFloat  := QSearch.FieldByName('ALIQUOTA_IBS_MUNIC').AsFloat;

           QUpdate.Prepare;
           QUpdate.ExecSql;



         if (QSearch.FieldByName('ALIQUOTA_CBS').AsFloat > 0)   then
         begin


           VALOR_BASE_CBS_IBS := (QRel.FieldByName('VALOR').AsFloat - QRel.FieldByName('DESCONTO').AsFloat);

           if (QSearch.FieldByName('REDUCAO_CBS_IBS').AsFloat = 60) Then
           Begin
           Valor_CBS      := RoundTo(((VALOR_BASE_CBS_IBS * 0.36) / 100), -2);
           VALOR_IBSUF    := RoundTo(((VALOR_BASE_CBS_IBS * 0.04) / 100), -2);
           VALOR_IBSMUNIC := RoundTo(((VALOR_BASE_CBS_IBS * QSearch.FieldByName('ALIQUOTA_IBS_MUNIC').AsFloat) / 100), -2);
           End
           Else  if (QSearch.FieldByName('REDUCAO_CBS_IBS').AsFloat = 100) Then
           Begin
           Valor_CBS      := RoundTo(((VALOR_BASE_CBS_IBS * 0) / 100), -2);
           VALOR_IBSUF    := RoundTo(((VALOR_BASE_CBS_IBS * 0) / 100), -2);
           VALOR_IBSMUNIC := RoundTo(((VALOR_BASE_CBS_IBS * QSearch.FieldByName('ALIQUOTA_IBS_MUNIC').AsFloat) / 100), -2);
           End
           Else
           Begin
           Valor_CBS      := RoundTo(((VALOR_BASE_CBS_IBS * QSearch.FieldByName('ALIQUOTA_CBS').AsFloat) / 100), -2);
           VALOR_IBSUF    := RoundTo(((VALOR_BASE_CBS_IBS * QSearch.FieldByName('ALIQUOTA_IBS_UF').AsFloat) / 100), -2);
           VALOR_IBSMUNIC := RoundTo(((VALOR_BASE_CBS_IBS * QSearch.FieldByName('ALIQUOTA_IBS_MUNIC').AsFloat) / 100), -2);

           End;

          Vr_bccbsibs_t := Vr_bccbsibs_t + VALOR_BASE_CBS_IBS;
          Vr_cbs_t      := vr_cbs_t + Valor_CBS ;
          Vr_IBS_t      := vr_IBS_t + VALOR_IBSUF ;
          Vr_ibsmunic_t := Vr_ibsmunic_t + VALOR_IBSMUNIC;

         end
         Else
         Begin

          VALOR_BASE_CBS_IBS := 0;
          Valor_CBS          := 0 ;
          VALOR_IBSUF        := 0;
          VALOR_IBSMUNIC     := 0;

          Vr_bccbsibs_t := Vr_bccbsibs_t + VALOR_BASE_CBS_IBS;
          Vr_cbs_t      := vr_cbs_t + Valor_CBS ;
          Vr_IBS_t      := vr_IBS_t + VALOR_IBSUF ;
          Vr_ibsmunic_t := Vr_ibsmunic_t + VALOR_IBSMUNIC;

         End;


        IQuery.Sql.Clear;
        IQuery.Sql.Add('UPDATE TRANSITENS SET VR_BASE_CBSIBS = :VR_BASE_CBSIBS, VR_CBS = :VR_CBS, VR_IBSUF = :VR_IBSUF, VR_IBSMUNIC = :VR_IBSMUNIC');
        IQuery.Sql.Add('WHERE');
        IQuery.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
        IQuery.Sql.Add('AND (PRODUTO_ID = :PRODUTO_ID)');

        IQuery.ParamByName('VR_BASE_CBSIBS').AsFloat := RoundTo(VALOR_BASE_CBS_IBS, -2);
        IQuery.ParamByName('VR_CBS').AsFloat         := RoundTo(Valor_CBS, -2);
        IQuery.ParamByName('VR_IBSUF').AsFloat       := RoundTo(VALOR_IBSUF, -2);
        IQuery.ParamByName('VR_IBSMUNIC').AsFloat    := RoundTo(VALOR_IBSMUNIC, -2);

        IQuery.ParamByName('TRANSACAO_ID').AsInteger := Id_Trans;
        IQuery.ParamByName('PRODUTO_ID').AsInteger   := QSearch.FieldByName('PRODUTO_ID').AsInteger;

        IQuery.Prepare;
        IQuery.ExecSql;






          Unidades           := 1;
          Valor_Produtos     := Valor_Produtos + Vr_Item;
          Base_ICMS_Normal_T := Base_ICMS_Normal_T + Base_ICMS_Normal;
          Vr_ICMS_Normal_T   := Vr_ICMS_Normal_T + Vr_ICMS_Normal;
          Base_ICMS_ST_T     := Base_ICMS_ST_T + Base_ICMS_ST;
          Vr_ICMS_ST_T       := Vr_ICMS_ST_T + Vr_ICMS_ST;


          QUpdate.Sql.Clear;
          QUpdate.Sql.Add('UPDATE TRANSACOES SET ' +
                                                 'BASE_ICMS_NORMAL = :BASE_ICMS_NORMAL, VR_ICMS_NORMAL = :VR_ICMS_NORMAL, ' +
                                                 'BASE_ICMS_ST     = :BASE_ICMS_ST,     VR_ICMS_ST     = :VR_ICMS_ST, ' +
                                                 'ITENS            = :ITENS,            UNIDADES       = :UNIDADES, ' +
                                                 'VALOR_PRODUTOS   = :VALOR_PRODUTOS, '+
                                                 'VALOR            = :VALOR,            CFOP           = :CFOP, ' +
                                                 'VR_ACRESCIMO     = :VR_ACRESCIMO, ' +
                                                 'VR_DESCONTO      = :VR_DESCONTO, DESCONTO_ESPECIAL = :DESCONTO_ESPECIAL,'  +
                                                 'VR_BCCBSIBS      = :VR_BCCBSIBS, VR_IBSMUNIC = :VR_IBSMUNIC, VR_IBS = :VR_IBS, '  +
                                                 'VR_CBS           = :VR_CBS, VR_NFTOT = :VR_NFTOT' );
          QUpdate.Sql.Add('WHERE');
          QUpdate.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

          QUpdate.ParamByName('BASE_ICMS_NORMAL').AsFloat := 0;//RoundTo(Base_ICMS_Normal_T, -2);
          QUpdate.ParamByName('VR_ICMS_NORMAL').AsFloat   := 0;//RoundTo(Vr_ICMS_Normal_T, -2);
          QUpdate.ParamByName('BASE_ICMS_ST').AsFloat     := 0;//RoundTo(Base_ICMS_ST_T, -2);
          QUpdate.ParamByName('VR_ICMS_ST').AsFloat       := 0;//RoundTo(Vr_ICMS_ST_T, -2);
          QUpdate.ParamByName('ITENS').AsInteger          := Itens;
          QUpdate.ParamByName('UNIDADES').AsFloat         := RoundTo(Unidades, -2);
          QUpdate.ParamByName('VALOR_PRODUTOS').AsFloat   := RoundTo(Valor_Produtos, -2);
          QUpdate.ParamByName('VALOR').AsFloat            := RoundTo(Valor_Produtos , -2)  ;
          QUpdate.ParamByName('CFOP').AsString            := '5927'; //CFOP;
          QUpdate.ParamByName('VR_DESCONTO').AsFloat      := 0;
          QUpdate.ParamByName('DESCONTO_ESPECIAL').AsFloat:= 0;
          QUpdate.ParamByName('VR_ACRESCIMO').AsFloat     := 0;
          QUpdate.ParamByName('TRANSACAO_ID').AsInteger   := Id_Trans;


          QUpdate.ParamByName('VR_BCCBSIBS').AsFloat     := Vr_bccbsibs_t;
          QUpdate.ParamByName('VR_IBSMUNIC').AsFloat     := Vr_ibsmunic_t;
          QUpdate.ParamByName('VR_IBS').AsFloat          := Vr_IBS_t;
          QUpdate.ParamByName('VR_CBS').AsFloat          := Vr_cbs_t;
          QUpdate.ParamByName('VR_NFTOT').AsFloat        := Vr_bccbsibs_t;


          QUpdate.Prepare;
          QUpdate.ExecSql;



        /// ENTRADA NOS ITENS DESAGREGADOS
        IQuery.SQL.Clear;
        IQuery.SQL.Add('SELECT NEXTVAL(:GEN_TRANSACOES) ID');
        IQuery.ParamByName('GEN_TRANSACOES').AsString :=  'GEN_TRANSACOES';

        IQuery.Prepare;
        IQuery.Open;

        Id_Trans := IQuery.FieldByName('ID').AsInteger;

        IQuery.SQL.Clear;
        IQuery.SQL.Add('INSERT INTO COMPL_NFISCAL(TRANSACAO_ID,DT_SAIDA,NO_DOC_FISCAL,SERIE,EMPRESA_ID) values(:TRANSACAO_ID, :DT_SAIDA,:NO_DOC_FISCAL,:SERIE, :EMPRESA_ID)');
        IQuery.ParamByName('TRANSACAO_ID').AsInteger  := ID_TRANS;
        IQuery.ParamByName('NO_DOC_FISCAL').AsInteger := 0;
        IQuery.ParamByName('SERIE').AsString          := '001';
        IQuery.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
        IQuery.ParamByName('DT_SAIDA').AsDatetime     := Date;

        IQuery.Prepare;
        IQuery.ExecSQL;



        IQuery.SQL.Clear;
        IQuery.SQL.Add('SELECT NO_DOC_FISCAL FROM COMPL_NFISCAL WHERE TRANSACAO_ID = :TRANSACAO_ID');
        IQuery.ParamByName('TRANSACAO_ID').AsInteger  := id_trans;


        IQuery.Prepare;
        IQuery.Open;

        QSearch.Sql.Clear;
        QSearch.sql.add('SELECT FORNECEDOR_ID FROM FORNECEDORES WHERE CNPJ = :CNPJ');
        QSearch.ParambyName('CNPJ').AsString := FrmPrincipal.QEmpresa.FieldbyName('CNPJ').AsString;
        QSearch.Prepare;
        QSearch.Open;


        QRel.Sql.Clear;
        QRel.Sql.Add('INSERT INTO TRANSACOES( ' +
                     'TRANSACAO_ID,  DT_TRANS,    DT_MOVIMENTO,    CONDUTA, ' +
                     'DEPTO,         EMPRESA_ID,  CONTA_ID,        C_CUSTO_ID, ' +
                     'VALOR,         TPCTB,       AUTORIZ_ID,      HISTORICO, ' +
                     'CONTAAUX_ID,   NUM_DOC,     BANCO_ID,        BALANCO, ' +
                     'COND_PAGTO,    SERIE,       FLUXO_CAIXA_ID,  TIPO_COMPRA, ' +
                     'MODELO,      SUB_CODIGO,HORA,DT_SPED,CFOP,FORNECEDOR_ID,SUB_SERIE) VALUES(' +
                     ':TRANSACAO_ID, :DT_TRANS,   :DT_MOVIMENTO,   :CONDUTA, ' +
                     ':DEPTO,        :EMPRESA_ID, :CONTA_ID,       :C_CUSTO_ID, ' +
                     ':VALOR,        :TPCTB,      :AUTORIZ_ID,     :HISTORICO, ' +
                     ':CONTAAUX_ID,  :NUM_DOC,    :BANCO_ID,       :BALANCO, ' +
                     ':COND_PAGTO,   :SERIE,      :FLUXO_CAIXA_ID, :TIPO_COMPRA, ' +
                     ':MODELO,     :SUB_CODIGO,:HORA,:DT_SPED, :CFOP,:FORNECEDOR_ID,:SUB_SERIE)');

        QRel.ParamByName('TRANSACAO_ID').AsInteger   := Id_Trans;
        QRel.ParamByName('DT_TRANS').AsDateTime      := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
        QRel.ParamByName('DT_MOVIMENTO').AsDateTime  := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
        QRel.ParamByName('DT_SPED').AsDateTime       := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
        QRel.ParamByName('CONDUTA').AsString         := '02';
        QRel.ParamByName('DEPTO').AsString           := '07';
        QRel.ParamByName('EMPRESA_ID').AsInteger     := FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger;;
        QRel.ParamByName('CONTA_ID').AsInteger       := FrmPrincipal.Config.FieldByName('CONTA_ESTOQUE').AsInteger;
        QRel.ParamByName('C_CUSTO_ID').AsInteger     := 1;
        QRel.ParamByName('VALOR').AsFloat            := 0;
        QRel.ParamByName('TPCTB').AsString           := '2';
        QRel.ParamByName('AUTORIZ_ID').AsInteger     := 0;
        QRel.ParamByName('HISTORICO').AsString       := 'ENTRADA REFERENTE DESAGREGAÇÃO DE PRODUTO ' + StrZero(IQuery.FieldByName('NO_DOC_FISCAL').AsString,9,0);
        QRel.ParamByName('CONTAAUX_ID').AsInteger    := 0;
        QRel.ParamByName('NUM_DOC').AsString         := StrZero(IQuery.FieldByName('NO_DOC_FISCAL').AsString,9,0);
        QRel.ParamByName('BANCO_ID').AsInteger       := StrToInt(LeIni(Arq_Ini, 'Sistema', 'Caixa'));
        QRel.ParamByName('BALANCO').AsString         := 'LIBERADO';
        QRel.ParamByName('COND_PAGTO').AsString      := 'A VISTA';
        QRel.ParamByName('SERIE').AsString           := '001';
        QRel.ParamByName('FLUXO_CAIXA_ID').AsInteger := 3;
        QRel.ParamByName('TIPO_COMPRA').AsString     := 'COMPRA';
        QRel.ParamByName('MODELO').AsString          := '55';
        QRel.ParamByName('SUB_CODIGO').AsString      := '1 - NORMAL';
        QRel.ParamByName('HORA').AsString            := TimeToStr(time);
        QRel.ParamByName('CFOP').AsString            := '1926';

        IF  QSearch.FieldbyName('FORNECEDOR_ID').AsInteger > 0 Then
        QRel.ParamByName('FORNECEDOR_ID').AsInteger  := QSearch.FieldbyName('FORNECEDOR_ID').AsInteger
        Else
        QRel.ParamByName('FORNECEDOR_ID').AsInteger  := 0;

        QRel.ParamByName('SUB_SERIE').AsString       := 'P';



        QRel.Prepare;
        QRel.ExecSql;

       { IQuery.SQL.Clear;
        IQuery.SQL.Add('INSERT INTO COMPL_NFISCAL(TRANSACAO_ID,DT_SAIDA,NO_DOC_FISCAL,SERIE,EMPRESA_ID) values(:TRANSACAO_ID, :DT_SAIDA,:NO_DOC_FISCAL,:SERIE, :EMPRESA_ID)');
        IQuery.ParamByName('TRANSACAO_ID').AsInteger  := ID_TRANS;
        IQuery.ParamByName('NO_DOC_FISCAL').AsInteger := 0;
        IQuery.ParamByName('SERIE').AsString          := '001';
        IQuery.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
        IQuery.ParamByName('DT_SAIDA').AsDatetime     := Date;

        IQuery.Prepare;
        IQuery.ExecSQL;

        }

        QRel.Sql.Clear;
        QRel.Sql.Add('SELECT * ');
        QRel.Sql.Add('FROM DESAGREGACAO_ITENS ');
        QRel.Sql.Add('WHERE');
        QRel.Sql.Add('PRODUTO_ID = :PRODUTO_ID');
        QRel.ParamByName('PRODUTO_ID').AsInteger :=  FdDesagregacao.FieldByName('CODIGO').AsInteger;

        QRel.Prepare;
        QRel.Open;

        Itens              := 0;
        Unidades           := 0;
        Desconto           := 0;
        Valor_Produtos     := 0;
        Base_ICMS_Normal_T := 0;
        Vr_ICMS_Normal_T   := 0;
        Base_ICMS_ST_T     := 0;
        Vr_ICMS_ST_T       := 0;

        Valor_Produtos     := 0;
        Base_ICMS_Normal_T := 0;
        Vr_ICMS_Normal_T   := 0;
        Base_ICMS_ST_T     := 0;
        Vr_ICMS_ST_T       := 0;


        VALOR_BASE_CBS_IBS := 0;
        Valor_CBS          := 0;
        VALOR_IBSUF        := 0;
        VALOR_IBSMUNIC     := 0;

        Vr_bccbsibs_T      := 0;
        Vr_cbs_t           := 0;
        Vr_IBS_t           := 0;
        Vr_ibsmunic_t      := 0;



        QRel.First;
        while not QRel.Eof do
        begin

          IQuery.Sql.Clear;
          IQuery.Sql.Add('SELECT * ');
          IQuery.Sql.Add('FROM PRODUTOS ');
          IQuery.Sql.Add('WHERE');
          IQuery.Sql.Add('PRODUTO_ID = :PRODUTO_ID');

          IQuery.ParamByName('PRODUTO_ID').AsInteger :=  QRel.FieldByName('INSUMO_ID').AsInteger;

          IQuery.Prepare;
          IQuery.Open;


          QTributo.Sql.Clear;
          QTributo.Sql.Add('SELECT * FROM TRIBUTOS');
          QTributo.Sql.Add('WHERE');
          QTributo.Sql.Add('(TRIBUTO_ID = :TRIBUTO_ID)');

          QTributo.ParamByName('TRIBUTO_ID').AsInteger := IQuery.FieldByName('TRIBUTO_ID').AsInteger;

          QTributo.Prepare;
          QTributo.Open;

          CFOP := QTributo.FieldByName('CFOP').AsString;

          Base_ICMS_Normal := 0;
          Vr_ICMS_Normal   := 0;
          Base_ICMS_ST     := 0;
          Vr_ICMS_ST       := 0;
          Vr_Unit          := Vr_unit_p; //IQuery.FieldByName('CUSTO_COMPRA').AsFloat; // (((FdDesagregacao.FieldByname('QUANTIDADE_TOTAL').AsFloat * QRel.FieldByName('QUANTIDADE_FIM').AsFloat) /100)), -2);
          Vr_Desc          := 0; //((Vr_Unit * Desconto) / 100);
          Vr_Item          := Vr_Unit * RoundTo(((FdDesagregacao.FieldByname('QUANTIDADE').AsFloat * QRel.FieldByName('QUANTIDADE_FIM').AsFloat) /100), -2); //((Vr_Unit - Vr_Desc) * QRel.FieldByName('QUANTIDADE').AsFloat);


          if IQuery.FieldByName('ALIQUOTA_ICMS').AsFloat > 0 then
          begin
            Base_ICMS_Normal := Vr_Item;
            Vr_ICMS_Normal   := 0;//((Base_ICMS_Normal * QProduto.FieldByName('ALIQUOTA_ICMS').AsFloat) / 100);
          end
          else
          begin
            Base_ICMS_Normal := 0;
            Vr_ICMS_Normal   := 0;
          end;

          Cst := Copy(QTributo.FieldByName('ORIGEM').AsString, 1, 1) + Copy(QTributo.FieldByName('TRIBUTACAO').AsString, 1, 2);

          if (Cst = '010') or (Cst = '030') or (Cst = '060') or (Cst = '070') then
          begin
            Base_ICMS_ST := 0; //(Vr_Item + ((Vr_Item * QProduto.FieldByName('MVA').AsFloat) / 100));
            Vr_ICMS_ST   := 0; //(((Base_ICMS_ST * Aliquota_ICMS_Local) / 100) - RoundTo(((Vr_Item * Aliquota_Inter_Estadual) / 100), -2));
          end
          else
          begin
            Base_ICMS_ST := 0;
            Vr_ICMS_ST   := 0;
          end;

          if (Cst = '040') or (Cst = '041') or (Cst = '050') then
            Vr_Isento := Vr_Item
          else
            Vr_Isento := 0;

          QUpdate.Sql.Clear;
          QUpdate.Sql.Add('INSERT INTO TRANSITENS( ' +
                          'TRANSACAO_ID,   PRODUTO_ID,      TP_PROD_SERV,   CFOP, ' +
                          'DESCRICAO,      CONTA_ID,        TRIBUTO_ID,     CST, ' +
                          'MVA,            BASE_CALC_ICMS,  ALIQUOTA_ICMS,  VALOR_ICMS, ' +
                          'BASE_CALC_ST,   VALOR_ICMS_ST,   VALOR_ISENTO,   VALOR_OUTROS, ' +
                          'VR_IPI,         QUANTIDADE,      VR_UNITARIO,    VR_DESCONTO, ' +
                          'VR_TOTAL,CST_PIS,CST_COFINS,DESC_RODAPE,SEQUENCIA,DESAGREGACAO) VALUES(' +
                          ':TRANSACAO_ID,  :PRODUTO_ID,     :TP_PROD_SERV,  :CFOP, ' +
                          ':DESCRICAO,     :CONTA_ID,       :TRIBUTO_ID,    :CST, ' +
                          ':MVA,           :BASE_CALC_ICMS, :ALIQUOTA_ICMS, :VALOR_ICMS, ' +
                          ':BASE_CALC_ST,  :VALOR_ICMS_ST,  :VALOR_ISENTO,  :VALOR_OUTROS, ' +
                          ':VR_IPI,        :QUANTIDADE,     :VR_UNITARIO,   :VR_DESCONTO, ' +
                          ':VR_TOTAL,      :CST_PIS,        :CST_COFINS,    :DESC_RODAPE,:SEQUENCIA,:DESAGREGACAO )');

          QUpdate.ParamByName('TRANSACAO_ID').AsInteger  := Id_Trans;
          QUpdate.ParamByName('PRODUTO_ID').AsInteger    := QRel.FieldByName('INSUMO_ID').AsInteger;
          QUpdate.ParamByName('TP_PROD_SERV').AsString   := 'P';
          QUpdate.ParamByName('CFOP').AsString           := '1926'; // QTributo.FieldByName('CFOP').AsString;
          QUpdate.ParamByName('DESCRICAO').AsString      := IQuery.FieldByName('DESCRICAO').AsString;
          QUpdate.ParamByName('CONTA_ID').AsInteger      := FrmPrincipal.Config.FieldByName('CONTA_ESTOQUE').AsInteger;
          QUpdate.ParamByName('TRIBUTO_ID').AsInteger    := IQuery.FieldByName('TRIBUTO_ID').AsInteger;
          QUpdate.ParamByName('CST').AsString            := IQuery.FieldByName('CSOSN').AsString;
          QUpdate.ParamByName('MVA').AsFloat             := IQuery.FieldByName('MVA').AsFloat;
          QUpdate.ParamByName('BASE_CALC_ICMS').AsFloat  := 0;//RoundTo(Base_ICMS_Normal, -2);
          QUpdate.ParamByName('ALIQUOTA_ICMS').AsFloat   := 0;//QProduto.FieldByName('ALIQUOTA_ICMS').AsFloat;
          QUpdate.ParamByName('VALOR_ICMS').AsFloat      := 0;//RoundTo(Vr_ICMS_Normal, -2);
          QUpdate.ParamByName('BASE_CALC_ST').AsFloat    := RoundTo(Base_ICMS_ST, -2);
          QUpdate.ParamByName('VALOR_ICMS_ST').AsFloat   := RoundTo(Vr_ICMS_ST, -2);
          QUpdate.ParamByName('VALOR_ISENTO').AsFloat    := RoundTo(Vr_Isento, -2);
          QUpdate.ParamByName('VALOR_OUTROS').AsFloat    := 0;
          QUpdate.ParamByName('VR_IPI').AsFloat          := 0;
          QUpdate.ParamByName('QUANTIDADE').AsFloat      := RoundTo(((FdDesagregacao.FieldByname('QUANTIDADE').AsFloat * QRel.FieldByName('QUANTIDADE_FIM').AsFloat) /100), -2);
          QUpdate.ParamByName('VR_UNITARIO').AsFloat     := RoundTo(Vr_Unit, -2);
          QUpdate.ParamByName('VR_DESCONTO').AsFloat     := 0;
          QUpdate.ParamByName('VR_TOTAL').AsFloat        := RoundTo(Vr_Item, -2);
          QUpdate.ParamByName('CST_PIS').AsString        := '49';
          QUpdate.ParamByName('CST_COFINS').AsString     := '49';
          QUpdate.ParamByName('DESC_RODAPE').AsFloat     :=RoundTo(Vr_Desc, -2);
          QUpdate.ParamByName('SEQUENCIA').AsInteger     := Itens + 1;
          QUpdate.ParamByName('DESAGREGACAO').AsFloat    := QRel.FieldByName('QUANTIDADE_FIM').AsFloat;
          QUpdate.ParamByName('COD_CLASSTRIB').AsString := IQuery.FieldByName('CLASSTRIBUTARIA').AsString;
          QUpdate.ParamByName('CST_CBSIBS').AsInteger   := IQuery.FieldByName('CST_CBS_IBS').AsInteger;



          if IQuery.FieldByName('REDUCAO_CBS_IBS').AsFloat = 60 then
          Begin
          QUpdate.ParamByName('REDUCAO_CBS_IBS').AsFloat   := IQuery.FieldByName('REDUCAO_CBS_IBS').AsFloat;
          QUpdate.ParamByName('ALIQ_CBS').AsFloat          := IQuery.FieldByName('ALIQUOTA_CBS').AsFloat;
          QUpdate.ParamByName('ALIQ_IBSUF').AsFloat        := IQuery.FieldByName('ALIQUOTA_IBS_UF').AsFloat;
          QUpdate.ParamByName('ALIQ_EF_CBS').AsFloat       := 0.36;
          QUpdate.ParamByName('ALIQ_EF_IBSUF').AsFloat     := 0.04;
          End
          Else if IQuery.FieldByName('REDUCAO_CBS_IBS').AsFloat = 100 Then
          Begin
          QUpdate.ParamByName('ALIQ_CBS').AsFloat        := IQuery.FieldByName('ALIQUOTA_CBS').AsFloat;
          QUpdate.ParamByName('ALIQ_IBSUF').AsFloat      := IQuery.FieldByName('ALIQUOTA_IBS_UF').AsFloat;
          QUpdate.ParamByName('REDUCAO_CBS_IBS').AsFloat := IQuery.FieldByName('REDUCAO_CBS_IBS').AsFloat;
          QUpdate.ParamByName('ALIQ_EF_CBS').AsFloat     := 0;
          QUpdate.ParamByName('ALIQ_EF_IBSUF').AsFloat   := 0
          End
          Else
          Begin
          QUpdate.ParamByName('ALIQ_CBS').AsFloat        := IQuery.FieldByName('ALIQUOTA_CBS').AsFloat;
          QUpdate.ParamByName('ALIQ_IBSUF').AsFloat      := IQuery.FieldByName('ALIQUOTA_IBS_UF').AsFloat;
          QUpdate.ParamByName('REDUCAO_CBS_IBS').AsFloat := IQuery.FieldByName('REDUCAO_CBS_IBS').AsFloat;
          QUpdate.ParamByName('ALIQ_EF_CBS').AsFloat     := 0;
          QUpdate.ParamByName('ALIQ_EF_IBSUF').AsFloat   := 0;

          End;

          QUpdate.ParamByName('ALIQ_IBSMUNIC').AsFloat  := IQuery.FieldByName('ALIQUOTA_IBS_MUNIC').AsFloat;

          QUpdate.Prepare;
          QUpdate.ExecSql;


         if (QSearch.FieldByName('ALIQUOTA_CBS').AsFloat > 0)   then
         begin


           VALOR_BASE_CBS_IBS := (QRel.FieldByName('VALOR').AsFloat - QRel.FieldByName('DESCONTO').AsFloat);

           if (QSearch.FieldByName('REDUCAO_CBS_IBS').AsFloat = 60) Then
           Begin
           Valor_CBS      := RoundTo(((VALOR_BASE_CBS_IBS * 0.36) / 100), -2);
           VALOR_IBSUF    := RoundTo(((VALOR_BASE_CBS_IBS * 0.04) / 100), -2);
           VALOR_IBSMUNIC := RoundTo(((VALOR_BASE_CBS_IBS * QSearch.FieldByName('ALIQUOTA_IBS_MUNIC').AsFloat) / 100), -2);
           End
           Else  if (QSearch.FieldByName('REDUCAO_CBS_IBS').AsFloat = 100) Then
           Begin
           Valor_CBS      := RoundTo(((VALOR_BASE_CBS_IBS * 0) / 100), -2);
           VALOR_IBSUF    := RoundTo(((VALOR_BASE_CBS_IBS * 0) / 100), -2);
           VALOR_IBSMUNIC := RoundTo(((VALOR_BASE_CBS_IBS * QSearch.FieldByName('ALIQUOTA_IBS_MUNIC').AsFloat) / 100), -2);
           End
           Else
           Begin
           Valor_CBS      := RoundTo(((VALOR_BASE_CBS_IBS * QSearch.FieldByName('ALIQUOTA_CBS').AsFloat) / 100), -2);
           VALOR_IBSUF    := RoundTo(((VALOR_BASE_CBS_IBS * QSearch.FieldByName('ALIQUOTA_IBS_UF').AsFloat) / 100), -2);
           VALOR_IBSMUNIC := RoundTo(((VALOR_BASE_CBS_IBS * QSearch.FieldByName('ALIQUOTA_IBS_MUNIC').AsFloat) / 100), -2);

           End;

          Vr_bccbsibs_t := Vr_bccbsibs_t + VALOR_BASE_CBS_IBS;
          Vr_cbs_t      := vr_cbs_t + Valor_CBS ;
          Vr_IBS_t      := vr_IBS_t + VALOR_IBSUF ;
          Vr_ibsmunic_t := Vr_ibsmunic_t + VALOR_IBSMUNIC;

         end
         Else
         Begin

          VALOR_BASE_CBS_IBS := 0;
          Valor_CBS          := 0 ;
          VALOR_IBSUF        := 0;
          VALOR_IBSMUNIC     := 0;

          Vr_bccbsibs_t := Vr_bccbsibs_t + VALOR_BASE_CBS_IBS;
          Vr_cbs_t      := vr_cbs_t + Valor_CBS ;
          Vr_IBS_t      := vr_IBS_t + VALOR_IBSUF ;
          Vr_ibsmunic_t := Vr_ibsmunic_t + VALOR_IBSMUNIC;

         End;

          IQuery.Sql.Clear;
          IQuery.Sql.Add('UPDATE TRANSITENS SET VR_BASE_CBSIBS = :VR_BASE_CBSIBS, VR_CBS = :VR_CBS, VR_IBSUF = :VR_IBSUF, VR_IBSMUNIC = :VR_IBSMUNIC');
          IQuery.Sql.Add('WHERE');
          IQuery.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
          IQuery.Sql.Add('AND (PRODUTO_ID = :PRODUTO_ID)');

          IQuery.ParamByName('VR_BASE_CBSIBS').AsFloat := RoundTo(VALOR_BASE_CBS_IBS, -2);
          IQuery.ParamByName('VR_CBS').AsFloat         := RoundTo(Valor_CBS, -2);
          IQuery.ParamByName('VR_IBSUF').AsFloat       := RoundTo(VALOR_IBSUF, -2);
          IQuery.ParamByName('VR_IBSMUNIC').AsFloat    := RoundTo(VALOR_IBSMUNIC, -2);

          IQuery.ParamByName('TRANSACAO_ID').AsInteger := Id_Trans;
          IQuery.ParamByName('PRODUTO_ID').AsInteger   := QSearch.FieldByName('PRODUTO_ID').AsInteger;

          IQuery.Prepare;
          IQuery.ExecSql;



          Itens              := (Itens + 1);
          Unidades           := (Unidades + 1);
          Valor_Produtos     := Valor_Produtos + Vr_Item;
          Base_ICMS_Normal_T := Base_ICMS_Normal_T + Base_ICMS_Normal;
          Vr_ICMS_Normal_T   := Vr_ICMS_Normal_T + Vr_ICMS_Normal;
          Base_ICMS_ST_T     := Base_ICMS_ST_T + Base_ICMS_ST;
          Vr_ICMS_ST_T       := Vr_ICMS_ST_T + Vr_ICMS_ST;




          Application.ProcessMessages;

          QRel.Next;
        end;




          IQuery.Sql.Clear;
          IQuery.Sql.Add('SELECT * ');
          IQuery.Sql.Add('FROM PRODUTOS ');
          IQuery.Sql.Add('WHERE');
          IQuery.Sql.Add('PRODUTO_ID = :PRODUTO_ID');

          IQuery.ParamByName('PRODUTO_ID').AsInteger :=  QPerda.FieldByName('PRODUTO_ID').AsInteger;

          IQuery.Prepare;
          IQuery.Open;


          QTributo.Sql.Clear;
          QTributo.Sql.Add('SELECT * FROM TRIBUTOS');
          QTributo.Sql.Add('WHERE');
          QTributo.Sql.Add('(TRIBUTO_ID = :TRIBUTO_ID)');

          QTributo.ParamByName('TRIBUTO_ID').AsInteger := IQuery.FieldByName('TRIBUTO_ID').AsInteger;

          QTributo.Prepare;
          QTributo.Open;

          CFOP := QTributo.FieldByName('CFOP').AsString;

          Base_ICMS_Normal := 0;
          Vr_ICMS_Normal   := 0;
          Base_ICMS_ST     := 0;
          Vr_ICMS_ST       := 0;
          Vr_Unit          := Vr_unit_p; //IQuery.FieldByName('CUSTO_COMPRA').AsFloat; // (((FdDesagregacao.FieldByname('QUANTIDADE_TOTAL').AsFloat * QRel.FieldByName('QUANTIDADE_FIM').AsFloat) /100)), -2);
          Vr_Desc          := 0; //((Vr_Unit * Desconto) / 100);
          Vr_Item          := RoundTo(Vr_Unit * FdDesagregacao.FieldByName('QUANTIDADE_PERDA').AsFloat,-2) ; //((Vr_Unit - Vr_Desc) * QRel.FieldByName('QUANTIDADE').AsFloat);


          if IQuery.FieldByName('ALIQUOTA_ICMS').AsFloat > 0 then
          begin
            Base_ICMS_Normal := Vr_Item;
            Vr_ICMS_Normal   := 0;//((Base_ICMS_Normal * QProduto.FieldByName('ALIQUOTA_ICMS').AsFloat) / 100);
          end
          else
          begin
            Base_ICMS_Normal := 0;
            Vr_ICMS_Normal   := 0;
          end;

          Cst := Copy(QTributo.FieldByName('ORIGEM').AsString, 1, 1) + Copy(QTributo.FieldByName('TRIBUTACAO').AsString, 1, 2);

          if (Cst = '010') or (Cst = '030') or (Cst = '060') or (Cst = '070') then
          begin
            Base_ICMS_ST := 0; //(Vr_Item + ((Vr_Item * QProduto.FieldByName('MVA').AsFloat) / 100));
            Vr_ICMS_ST   := 0; //(((Base_ICMS_ST * Aliquota_ICMS_Local) / 100) - RoundTo(((Vr_Item * Aliquota_Inter_Estadual) / 100), -2));
          end
          else
          begin
            Base_ICMS_ST := 0;
            Vr_ICMS_ST   := 0;
          end;

          if (Cst = '040') or (Cst = '041') or (Cst = '050') then
            Vr_Isento := Vr_Item
          else
            Vr_Isento := 0;

          QUpdate.Sql.Clear;
          QUpdate.Sql.Add('INSERT INTO TRANSITENS( ' +
                          'TRANSACAO_ID,   PRODUTO_ID,      TP_PROD_SERV,   CFOP, ' +
                          'DESCRICAO,      CONTA_ID,        TRIBUTO_ID,     CST, ' +
                          'MVA,            BASE_CALC_ICMS,  ALIQUOTA_ICMS,  VALOR_ICMS, ' +
                          'BASE_CALC_ST,   VALOR_ICMS_ST,   VALOR_ISENTO,   VALOR_OUTROS, ' +
                          'VR_IPI,         QUANTIDADE,      VR_UNITARIO,    VR_DESCONTO, ' +
                          'VR_TOTAL,CST_PIS,CST_COFINS,DESC_RODAPE,SEQUENCIA,DESAGREGACAO) VALUES(' +
                          ':TRANSACAO_ID,  :PRODUTO_ID,     :TP_PROD_SERV,  :CFOP, ' +
                          ':DESCRICAO,     :CONTA_ID,       :TRIBUTO_ID,    :CST, ' +
                          ':MVA,           :BASE_CALC_ICMS, :ALIQUOTA_ICMS, :VALOR_ICMS, ' +
                          ':BASE_CALC_ST,  :VALOR_ICMS_ST,  :VALOR_ISENTO,  :VALOR_OUTROS, ' +
                          ':VR_IPI,        :QUANTIDADE,     :VR_UNITARIO,   :VR_DESCONTO, ' +
                          ':VR_TOTAL,      :CST_PIS,        :CST_COFINS,    :DESC_RODAPE,:SEQUENCIA,:DESAGREGACAO )');

          QUpdate.ParamByName('TRANSACAO_ID').AsInteger  := Id_Trans;
          QUpdate.ParamByName('PRODUTO_ID').AsInteger    := QPerda.FieldByName('PRODUTO_ID').AsInteger;
          QUpdate.ParamByName('TP_PROD_SERV').AsString   := 'P';
          QUpdate.ParamByName('CFOP').AsString           := '1926'; // QTributo.FieldByName('CFOP').AsString;
          QUpdate.ParamByName('DESCRICAO').AsString      := IQuery.FieldByName('DESCRICAO').AsString;
          QUpdate.ParamByName('CONTA_ID').AsInteger      := FrmPrincipal.Config.FieldByName('CONTA_ESTOQUE').AsInteger;
          QUpdate.ParamByName('TRIBUTO_ID').AsInteger    := IQuery.FieldByName('TRIBUTO_ID').AsInteger;
          QUpdate.ParamByName('CST').AsString            := IQuery.FieldByName('CSOSN').AsString;
          QUpdate.ParamByName('MVA').AsFloat             := IQuery.FieldByName('MVA').AsFloat;
          QUpdate.ParamByName('BASE_CALC_ICMS').AsFloat  := 0;//RoundTo(Base_ICMS_Normal, -2);
          QUpdate.ParamByName('ALIQUOTA_ICMS').AsFloat   := 0;//QProduto.FieldByName('ALIQUOTA_ICMS').AsFloat;
          QUpdate.ParamByName('VALOR_ICMS').AsFloat      := 0;//RoundTo(Vr_ICMS_Normal, -2);
          QUpdate.ParamByName('BASE_CALC_ST').AsFloat    := RoundTo(Base_ICMS_ST, -2);
          QUpdate.ParamByName('VALOR_ICMS_ST').AsFloat   := RoundTo(Vr_ICMS_ST, -2);
          QUpdate.ParamByName('VALOR_ISENTO').AsFloat    := RoundTo(Vr_Isento, -2);
          QUpdate.ParamByName('VALOR_OUTROS').AsFloat    := 0;
          QUpdate.ParamByName('VR_IPI').AsFloat          := 0;
          QUpdate.ParamByName('QUANTIDADE').AsFloat      := RoundTo(FdDesagregacao.FieldByName('QUANTIDADE_PERDA').AsFloat, -2);
          QUpdate.ParamByName('VR_UNITARIO').AsFloat     := RoundTo(Vr_Unit, -2);
          QUpdate.ParamByName('VR_DESCONTO').AsFloat     := 0;
          QUpdate.ParamByName('VR_TOTAL').AsFloat        := RoundTo(Vr_Item, -2);
          QUpdate.ParamByName('CST_PIS').AsString        := '49';
          QUpdate.ParamByName('CST_COFINS').AsString     := '49';
          QUpdate.ParamByName('DESC_RODAPE').AsFloat     :=RoundTo(Vr_Desc, -2);
          QUpdate.ParamByName('SEQUENCIA').AsInteger     := Itens + 1;
          QUpdate.ParamByName('DESAGREGACAO').AsFloat    :=FdDesagregacao.FieldByName('QUANTIDADE_PERDA').AsFloat;
          QUpdate.ParamByName('COD_CLASSTRIB').AsString := IQuery.FieldByName('CLASSTRIBUTARIA').AsString;
          QUpdate.ParamByName('CST_CBSIBS').AsInteger   := IQuery.FieldByName('CST_CBS_IBS').AsInteger;


          if IQuery.FieldByName('REDUCAO_CBS_IBS').AsFloat = 60 then
          Begin
          QUpdate.ParamByName('REDUCAO_CBS_IBS').AsFloat   := IQuery.FieldByName('REDUCAO_CBS_IBS').AsFloat;
          QUpdate.ParamByName('ALIQ_CBS').AsFloat          := IQuery.FieldByName('ALIQUOTA_CBS').AsFloat;
          QUpdate.ParamByName('ALIQ_IBSUF').AsFloat        := IQuery.FieldByName('ALIQUOTA_IBS_UF').AsFloat;
          QUpdate.ParamByName('ALIQ_EF_CBS').AsFloat       := 0.36;
          QUpdate.ParamByName('ALIQ_EF_IBSUF').AsFloat     := 0.04;
          End
          Else if IQuery.FieldByName('REDUCAO_CBS_IBS').AsFloat = 100 Then
          Begin
          QUpdate.ParamByName('ALIQ_CBS').AsFloat        := IQuery.FieldByName('ALIQUOTA_CBS').AsFloat;
          QUpdate.ParamByName('ALIQ_IBSUF').AsFloat      := IQuery.FieldByName('ALIQUOTA_IBS_UF').AsFloat;
          QUpdate.ParamByName('REDUCAO_CBS_IBS').AsFloat := IQuery.FieldByName('REDUCAO_CBS_IBS').AsFloat;
          QUpdate.ParamByName('ALIQ_EF_CBS').AsFloat     := 0;
          QUpdate.ParamByName('ALIQ_EF_IBSUF').AsFloat   := 0
          End
          Else
          Begin
          QUpdate.ParamByName('ALIQ_CBS').AsFloat        := IQuery.FieldByName('ALIQUOTA_CBS').AsFloat;
          QUpdate.ParamByName('ALIQ_IBSUF').AsFloat      := IQuery.FieldByName('ALIQUOTA_IBS_UF').AsFloat;
          QUpdate.ParamByName('REDUCAO_CBS_IBS').AsFloat := IQuery.FieldByName('REDUCAO_CBS_IBS').AsFloat;
          QUpdate.ParamByName('ALIQ_EF_CBS').AsFloat     := 0;
          QUpdate.ParamByName('ALIQ_EF_IBSUF').AsFloat   := 0;

          End;

          QUpdate.ParamByName('ALIQ_IBSMUNIC').AsFloat  := IQuery.FieldByName('ALIQUOTA_IBS_MUNIC').AsFloat;

          QUpdate.Prepare;
          QUpdate.ExecSql;


          if (IQuery.FieldByName('ALIQUOTA_CBS').AsFloat > 0)   then
         begin


           VALOR_BASE_CBS_IBS := (QRel.FieldByName('VALOR').AsFloat - QRel.FieldByName('DESCONTO').AsFloat);

           if (IQuery.FieldByName('REDUCAO_CBS_IBS').AsFloat = 60) Then
           Begin
           Valor_CBS      := RoundTo(((VALOR_BASE_CBS_IBS * 0.36) / 100), -2);
           VALOR_IBSUF    := RoundTo(((VALOR_BASE_CBS_IBS * 0.04) / 100), -2);
           VALOR_IBSMUNIC := RoundTo(((VALOR_BASE_CBS_IBS * IQuery.FieldByName('ALIQUOTA_IBS_MUNIC').AsFloat) / 100), -2);
           End
           Else  if (IQuery.FieldByName('REDUCAO_CBS_IBS').AsFloat = 100) Then
           Begin
           Valor_CBS      := RoundTo(((VALOR_BASE_CBS_IBS * 0) / 100), -2);
           VALOR_IBSUF    := RoundTo(((VALOR_BASE_CBS_IBS * 0) / 100), -2);
           VALOR_IBSMUNIC := RoundTo(((VALOR_BASE_CBS_IBS * IQuery.FieldByName('ALIQUOTA_IBS_MUNIC').AsFloat) / 100), -2);
           End
           Else
           Begin
           Valor_CBS      := RoundTo(((VALOR_BASE_CBS_IBS * IQuery.FieldByName('ALIQUOTA_CBS').AsFloat) / 100), -2);
           VALOR_IBSUF    := RoundTo(((VALOR_BASE_CBS_IBS * IQuery.FieldByName('ALIQUOTA_IBS_UF').AsFloat) / 100), -2);
           VALOR_IBSMUNIC := RoundTo(((VALOR_BASE_CBS_IBS * IQuery.FieldByName('ALIQUOTA_IBS_MUNIC').AsFloat) / 100), -2);

           End;

          Vr_bccbsibs_t := Vr_bccbsibs_t + VALOR_BASE_CBS_IBS;
          Vr_cbs_t      := vr_cbs_t + Valor_CBS ;
          Vr_IBS_t      := vr_IBS_t + VALOR_IBSUF ;
          Vr_ibsmunic_t := Vr_ibsmunic_t + VALOR_IBSMUNIC;

         end
         Else
         Begin

          VALOR_BASE_CBS_IBS := 0;
          Valor_CBS          := 0 ;
          VALOR_IBSUF        := 0;
          VALOR_IBSMUNIC     := 0;

          Vr_bccbsibs_t := Vr_bccbsibs_t + VALOR_BASE_CBS_IBS;
          Vr_cbs_t      := vr_cbs_t + Valor_CBS ;
          Vr_IBS_t      := vr_IBS_t + VALOR_IBSUF ;
          Vr_ibsmunic_t := Vr_ibsmunic_t + VALOR_IBSMUNIC;

         End;



          Itens              := (Itens + 1);
          Unidades           := (Unidades + 1);
          Valor_Produtos     := Valor_Produtos + Vr_Item;
          Base_ICMS_Normal_T := Base_ICMS_Normal_T + Base_ICMS_Normal;
          Vr_ICMS_Normal_T   := Vr_ICMS_Normal_T + Vr_ICMS_Normal;
          Base_ICMS_ST_T     := Base_ICMS_ST_T + Base_ICMS_ST;
          Vr_ICMS_ST_T       := Vr_ICMS_ST_T + Vr_ICMS_ST;






          QUpdate.Sql.Clear;
          QUpdate.Sql.Add('UPDATE TRANSACOES SET ' +
                                                 'BASE_ICMS_NORMAL = :BASE_ICMS_NORMAL, VR_ICMS_NORMAL = :VR_ICMS_NORMAL, ' +
                                                 'BASE_ICMS_ST     = :BASE_ICMS_ST,     VR_ICMS_ST     = :VR_ICMS_ST, ' +
                                                 'ITENS            = :ITENS,            UNIDADES       = :UNIDADES, ' +
                                                 'VALOR_PRODUTOS   = :VALOR_PRODUTOS, '+
                                                 'VALOR            = :VALOR,            CFOP           = :CFOP, ' +
                                                 'VR_ACRESCIMO     = :VR_ACRESCIMO, ' +
                                                 'VR_DESCONTO      = :VR_DESCONTO, DESCONTO_ESPECIAL = :DESCONTO_ESPECIAL,'+
                                                 'VR_BCCBSIBS      = :VR_BCCBSIBS, VR_IBSMUNIC = :VR_IBSMUNIC, VR_IBS = :VR_IBS, '  +
                                                 'VR_CBS           = :VR_CBS, VR_NFTOT = :VR_NFTOT' );
          QUpdate.Sql.Add('WHERE');
          QUpdate.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

          QUpdate.ParamByName('BASE_ICMS_NORMAL').AsFloat := 0;//RoundTo(Base_ICMS_Normal_T, -2);
          QUpdate.ParamByName('VR_ICMS_NORMAL').AsFloat   := 0;//RoundTo(Vr_ICMS_Normal_T, -2);
          QUpdate.ParamByName('BASE_ICMS_ST').AsFloat     := 0;//RoundTo(Base_ICMS_ST_T, -2);
          QUpdate.ParamByName('VR_ICMS_ST').AsFloat       := 0;//RoundTo(Vr_ICMS_ST_T, -2);
          QUpdate.ParamByName('ITENS').AsInteger          := Itens;
          QUpdate.ParamByName('UNIDADES').AsFloat         := RoundTo(Unidades, -2);
          QUpdate.ParamByName('VALOR_PRODUTOS').AsFloat   := RoundTo(Valor_Produtos, -2);
          QUpdate.ParamByName('VALOR').AsFloat            := RoundTo(Valor_Produtos , -2)  ;
          QUpdate.ParamByName('CFOP').AsString            := '1926'; //CFOP;
          QUpdate.ParamByName('VR_DESCONTO').AsFloat      := 0;
          QUpdate.ParamByName('DESCONTO_ESPECIAL').AsFloat:= 0;
          QUpdate.ParamByName('VR_ACRESCIMO').AsFloat     := 0;
          QUpdate.ParamByName('TRANSACAO_ID').AsInteger   := Id_Trans;

          QUpdate.ParamByName('VR_BCCBSIBS').AsFloat     := Vr_bccbsibs_t;
          QUpdate.ParamByName('VR_IBSMUNIC').AsFloat     := Vr_ibsmunic_t;
          QUpdate.ParamByName('VR_IBS').AsFloat          := Vr_IBS_t;
          QUpdate.ParamByName('VR_CBS').AsFloat          := Vr_cbs_t;
          QUpdate.ParamByName('VR_NFTOT').AsFloat        := Vr_bccbsibs_t;


          QUpdate.Prepare;
          QUpdate.ExecSql;




     FdDesagregacao.Next;
     End;

     Application.MessageBox('Transações Geradas com Sucesso. Favor transmitir as notas.', PChar(Msg_Title), mb_IconInformation);

     FdDesagregacao.EmptyDataSet;
     QProdutos.Close;
     QPerda.Close;
     Produto_id.Text := '0';
     Perda_id.Text   := '0';


  End;



end;

procedure TFrmDesagregacao.btnIncluirClick(Sender: TObject);
begin
    Produto_id.Color := clWindow;
    Perda_id.Color   := clWindow;
    Quantidade.Color := clWindow;

    if QProdutos.IsEmpty then
    begin
      Application.MessageBox('Favor indicar o produto a ser desagregado.', PChar(Msg_Title), mb_IconStop);

      Produto_id.Color := clYellow;
      Produto_id.SetFocus;

      exit;
    end;

    if QPerda.IsEmpty then
    begin
      Application.MessageBox('Favor indicar o produto para perda.', PChar(Msg_Title), mb_IconStop);

      TabSheet2.Show;
      Perda_id.Color := clYellow;
      Perda_id.SetFocus;

      exit;
    end;

    if Quantidade.value <= 0 then
    begin
      Application.MessageBox('Quandidade a ser desagregada deve ser maior do que 0.', PChar(Msg_Title), mb_IconStop);

      Quantidade.Color := clYellow;
      Quantidade.SetFocus;

      exit;
    end;



  FdQuery.sql.Clear;
  FdQuery.Sql.add('SELECT SUM(QUANTIDADE_FIM) QUANTIDADE_FIM , SUM(QUANTIDADE) QUANTIDADE  FROM DESAGREGACAO_ITENS WHERE PRODUTO_ID = :PRODUTO_ID');
  FdQuery.ParamByName('PRODUTO_ID').Asinteger := QProdutos.FieldByName('PRODUTO_ID').AsInteger;
  FdQuery.Prepare;
  FdQuery.Open;

 if FdQuery.FieldByName('QUANTIDADE_FIM').AsFloat > 0  Then
 Begin
   FdDesagregacao.open;
   IF NOT FdDesagregacao.Locate('CODIGO' ,QProdutos.FieldByName('PRODUTO_ID').AsInteger, [] ) Then
   Begin
   FdDesagregacao.Append;
   FdDesagregacao.FieldByName('CODIGO').AsInteger    := QProdutos.FieldByName('PRODUTO_ID').AsInteger;
   FdDesagregacao.FieldByName('DESCRICAO').AsString  := QProdutos.FieldByName('DESCRICAO').AsString;
   FdDesagregacao.FieldByName('CATEGORIA').AsString  := QProdutos.FieldByName('CATEGORIA').AsString;
   FdDesagregacao.FieldByName('QUANTIDADE').AsFloat  := Quantidade.Value;
   FdDesagregacao.FieldByName('QUANTIDADE_PERDA').AsFloat  := (RoundTo(Quantidade.Value * (100 - FdQuery.FieldByName('QUANTIDADE_FIM').AsFloat) / 100, -2));
   FdDesagregacao.FieldByName('QUANTIDADE_TOTAL').AsFloat  := FdDesagregacao.FieldByName('QUANTIDADE').AsFloat - FdDesagregacao.FieldByName('QUANTIDADE_PERDA').AsFloat; //(Quantidade.Value - RoundTo((FdDesagregacao.FieldByName('QUANTIDADE_PERDA').AsFloat *  Quantidade.Value) / 100,-2));

   FdDesagregacao.Post;
   End
   Else
   Application.MessageBox('Produto já lançado favor verificar.', PChar(Msg_Title), MB_ICONINFORMATION);
 End
 Else
 Application.MessageBox('Produto não possui peças cadastradas para realizar a desagregação.', PChar(Msg_Title), MB_ICONINFORMATION);

end;

procedure TFrmDesagregacao.btnProdutoClick(Sender: TObject);
begin
try
    Produto_ID.Value := GetConsulta('ESTOQUE', 0, 0, StrToInt(PRODUTO_ID.Text));
  except
    Produto_ID.Value := GetConsulta('ESTOQUE', 0, 0, 0);
  end;
end;

procedure TFrmDesagregacao.btnRetornaClick(Sender: TObject);
begin
Close;
end;

procedure TFrmDesagregacao.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (Key = Vk_F4) and (FdDESAGREGACAO.State = dsBrowse) and (not FdDESAGREGACAO.IsEmpty) then
    FdDESAGREGACAO.Delete;

  if Key = VK_F9 then
    Perform(Wm_NextDlgCtl, 0, 0);

  if ((Key = Vk_Up) or (Key = Vk_Down)) and (FdDESAGREGACAO.State in [dsInsert, dsEdit]) then
    Key := 0;

end;

procedure TFrmDesagregacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action := caFree;
end;

procedure TFrmDesagregacao.FormShow(Sender: TObject);
begin
   TabSheet1.Show;
end;

procedure TFrmDesagregacao.Perda_idExit(Sender: TObject);
begin
QPerda.close;
QPerda.ParamByName('PRODUTO_ID').AsInteger := StrToInt(Perda_id.Text);
QPerda.Prepare;
QPerda.Open;
end;

procedure TFrmDesagregacao.Produto_IDExit(Sender: TObject);
begin
QProdutos.close;
QProdutos.ParamByName('PRODUTO_ID').AsInteger := StrToInt(Produto_id.Text);
QProdutos.Prepare;
QProdutos.Open;
end;

procedure TFrmDesagregacao.Produto_IDKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (Key = VK_F7) and (Sender = Produto_id) then
    btnProdutoClick(Sender);

if (Key = VK_F7) and (Sender = Perda_id) then
    btnPerdaClick(Sender);

  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);


end;

procedure TFrmDesagregacao.btnperdaClick(Sender: TObject);
begin
try
    Perda_ID.Value := GetConsulta('ESTOQUE', 0, 0, StrToInt(Perda_ID.Text));
  except
    Perda_ID.Value := GetConsulta('ESTOQUE', 0, 0, 0);
  end;
end;

end.
