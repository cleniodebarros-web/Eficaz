unit UPosicao_Estoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, IBCustomDataSet, IBQuery, ExtCtrls, QRCtrls, QuickRpt,
  Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,QRExport ;

type
  TFrmPosicao_Estoque = class(TForm)
    Label1: TLabel;
    Bevel1: TBevel;
    Data: TComboBox;
    Posicao: TQuickRep;
    QRBand1: TQRBand;
    QRSysData1: TQRSysData;
    Cabec: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    QRDBText3: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRShape3: TQRShape;
    QRBand2: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRBand3: TQRBand;
    QRExpr2: TQRExpr;
    QRLabel4: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText8: TQRDBText;
    QRExpr1: TQRExpr;
    Label2: TLabel;
    Preco: TComboBox;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    btnExecuta: TBitBtn;
    btnRetorna: TBitBtn;
    Selecao: TComboBox;
    Label3: TLabel;
    QRDBText1: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel16: TQRLabel;
    GroupBox1: TGroupBox;
    Intermediario: TCheckBox;
    Consumo: TCheckBox;
    Imobilizado: TCheckBox;
    Servicos: TCheckBox;
    Insumos: TCheckBox;
    outras: TCheckBox;
    SubProduto: TCheckBox;
    Acabado: TCheckBox;
    Processo: TCheckBox;
    Embalagem: TCheckBox;
    Prima: TCheckBox;
    Revenda: TCheckBox;
    Label60: TLabel;
    TIPO_ITEM: TComboBox;
    IQuery: TFDQuery;
    chk_exportar: TCheckBox;
    Label4: TLabel;
    Status: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRetornaClick(Sender: TObject);
    procedure DataKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure PosicaoBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPosicao_Estoque: TFrmPosicao_Estoque;
  Num_Page: Integer;

implementation

uses
  UData, UPrincipal;

{$R *.dfm}

procedure TFrmPosicao_Estoque.btnExecutaClick(Sender: TObject);
begin
// 151, 325
  try


    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    if Data.Text <> '' then
    begin
      IQuery.Sql.Clear;

      if Data.Text <> 'Hoje' then
      begin
        if FrmData.QAcesso.FieldByName('TPCTB').AsString = '2' then
          IQuery.Sql.Add('SELECT POSICAO_PRODUTOS.PRODUTO_ID, POSICAO_PRODUTOS.CUSTO_COMPRA, POSICAO_PRODUTOS.VALOR_COMPRA, ' +
                         'POSICAO_PRODUTOS.CUSTOMEDIO, POSICAO_PRODUTOS.PRECO_VAREJO, POSICAO_PRODUTOS.PRECO_ATACADO, POSICAO_PRODUTOS.QUANTIDADE_C AS QUANTIDADE, PRODUTOS.DESCRICAO, PRODUTOS.UNIDADE_VENDA, PRODUTOS.COD_BARRA, STATUS')
        else
          IQuery.Sql.Add('SELECT POSICAO_PRODUTOS.PRODUTO_ID, POSICAO_PRODUTOS.CUSTO_COMPRA, POSICAO_PRODUTOS.VALOR_COMPRA, ' +
                         'POSICAO_PRODUTOS.CUSTOMEDIO, POSICAO_PRODUTOS.PRECO_VAREJO, POSICAO_PRODUTOS.PRECO_ATACADO, POSICAO_PRODUTOS.QUANTIDADE_G AS QUANTIDADE, PRODUTOS.DESCRICAO, PRODUTOS.UNIDADE_VENDA, PRODUTOS.COD_BARRA, STATUS');

        IQuery.Sql.Add('FROM POSICAO_PRODUTOS');
        IQuery.Sql.Add('INNER JOIN PRODUTOS');
        IQuery.Sql.Add('ON (POSICAO_PRODUTOS.PRODUTO_ID = PRODUTOS.PRODUTO_ID) AND (POSICAO_PRODUTOS.DT_MOVIMENTO = :DT_MOVIMENTO)');
        IQuery.Sql.Add('WHERE');
        IQuery.Sql.Add('(PRODUTOS.EMPRESA_ID = :EMPRESA_ID)');

        if Tipo_item.Text <> ''  then
        IQuery.Sql.Add('AND (PRODUTOS.TIPO_ITEM = :TIPO) ');

        if Tipo_item.Text <> ''  then
        IQuery.ParamByName('TIPO').AsString := Tipo_item.Text;

        IQuery.ParamByName('DT_MOVIMENTO').AsDateTime := StrToDate(Data.Text);

        if FrmData.QAcesso.FieldByName('TPCTB').AsString = '2' then
        begin
          if Selecao.Text = 'Igual a 0' then
            IQuery.Sql.Add('AND (POSICAO_PRODUTOS.QUANTIDADE_C = 0)')
          else if Selecao.Text = 'Maior do que 0' then
            IQuery.Sql.Add('AND (POSICAO_PRODUTOS.QUANTIDADE_C > 0)')
          else if Selecao.Text = 'Menor do que 0' then
            IQuery.Sql.Add('AND (POSICAO_PRODUTOS.QUANTIDADE_C < 0)')
          else if Selecao.Text = 'Todos' then
            IQuery.Sql.Add('AND ((POSICAO_PRODUTOS.QUANTIDADE_C < 0) OR (POSICAO_PRODUTOS.QUANTIDADE_C = 0) OR (POSICAO_PRODUTOS.QUANTIDADE_C > 0))')
          else
            IQuery.Sql.Add('AND (POSICAO_PRODUTOS.QUANTIDADE_C <> 0)');
        end
        else
        begin
          if Selecao.Text = 'Igual a 0' then
            IQuery.Sql.Add('AND (POSICAO_PRODUTOS.QUANTIDADE_G = 0)')
          else if Selecao.Text = 'Maior do que 0' then
            IQuery.Sql.Add('AND (POSICAO_PRODUTOS.QUANTIDADE_G > 0)')
          else if Selecao.Text = 'Menor do que 0' then
            IQuery.Sql.Add('AND (POSICAO_PRODUTOS.QUANTIDADE_G < 0)')
          else if Selecao.Text = 'Todos' then
            IQuery.Sql.Add('AND ((POSICAO_PRODUTOS.QUANTIDADE_G < 0) OR (POSICAO_PRODUTOS.QUANTIDADE_C = 0) OR (POSICAO_PRODUTOS.QUANTIDADE_C > 0))')
          else
            IQuery.Sql.Add('AND (POSICAO_PRODUTOS.QUANTIDADE_G <> 0)');
        end;
      end
      else
      begin
        if FrmData.QAcesso.FieldByName('TPCTB').AsString = '2' then
          IQuery.Sql.Add('SELECT PRODUTO_ID, DESCRICAO, CUSTO_COMPRA, VALOR_COMPRA, CUSTOMEDIO, PRECO_VAREJO, PRECO_ATACADO, UNIDADE_VENDA, QUANTIDADE_C AS QUANTIDADE, COD_BARRA, STATUS')
        else
          IQuery.Sql.Add('SELECT PRODUTO_ID, DESCRICAO, CUSTO_COMPRA, VALOR_COMPRA, CUSTOMEDIO, PRECO_VAREJO, PRECO_ATACADO, UNIDADE_VENDA, QUANTIDADE_G AS QUANTIDADE, COD_BARRA, STATUS');

        IQuery.Sql.Add('FROM PRODUTOS');
        IQuery.Sql.Add('WHERE');
        IQuery.Sql.Add('(EMPRESA_ID = :EMPRESA_ID)');

        if Tipo_item.Text <> ''  then
         IQuery.Sql.Add('AND (PRODUTOS.TIPO_ITEM = :TIPO) ');

        if Tipo_item.Text <> ''  then
         IQuery.ParamByName('TIPO').AsString := Tipo_item.Text;


        if StrToInt(LeIni(Arq_Ini, 'Sistema', 'Localização')) > 0 then
        begin
          IQuery.Sql.Add('AND (LOCALIZACAO_ID = :LOCALIZACAO_ID)');

          IQuery.ParamByName('LOCALIZACAO_ID').AsInteger := StrToInt(LeIni(Arq_Ini, 'Sistema', 'Localização'));
        end;

        if FrmData.QAcesso.FieldByName('TPCTB').AsString = '2' then
        begin
          if Selecao.Text = 'Igual a 0' then
            IQuery.Sql.Add('AND (QUANTIDADE_C = 0)')
          else if Selecao.Text = 'Maior do que 0' then
            IQuery.Sql.Add('AND (QUANTIDADE_C > 0)')
          else if Selecao.Text = 'Menor do que 0' then
            IQuery.Sql.Add('AND (QUANTIDADE_C < 0)')
          else if Selecao.Text = 'Todos' then
            IQuery.Sql.Add('AND ((QUANTIDADE_C < 0) OR (QUANTIDADE_C = 0) OR (QUANTIDADE_C > 0))')
          else
            IQuery.Sql.Add('AND (QUANTIDADE_C <> 0)');
        end
        else
        begin
          if Selecao.Text = 'Igual a 0' then
            IQuery.Sql.Add('AND (QUANTIDADE_G = 0)')
          else if Selecao.Text = 'Maior do que 0' then
            IQuery.Sql.Add('AND (QUANTIDADE_G > 0)')
          else if Selecao.Text = 'Menor do que 0' then
            IQuery.Sql.Add('AND (QUANTIDADE_G < 0)')
          else if Selecao.Text = 'Todos' then
            IQuery.Sql.Add('AND ((QUANTIDADE_G < 0) OR (QUANTIDADE_G = 0) OR (QUANTIDADE_G > 0))')
          else
            IQuery.Sql.Add('AND (QUANTIDADE_G <> 0)');
        end;
      end;

      if StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Fornecedor')) > 0 then
      begin
        IQuery.Sql.Add('AND (PRODUTOS.FORNECEDOR_ID = :FORNECEDOR_ID)');

        IQuery.ParamByName('FORNECEDOR_ID').AsInteger := StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Fornecedor'));
      end;

      if StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Grupo')) > 0 then
      begin
        IQuery.Sql.Add('AND (PRODUTOS.GRUPO_ID = :GRUPO_ID)');

        IQuery.ParamByName('GRUPO_ID').AsInteger := StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Grupo'));
      end;

      if StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'SubTipo')) > 0 then
      begin
        IQuery.Sql.Add('AND (PRODUTOS.SUBTIPO_ID = :SUBTIPO_ID)');

        IQuery.ParamByName('SUBTIPO_ID').AsInteger := StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'SubTipo'));
      end;

      if StrToInt(LeIni(Arq_Ini, 'Sistema', 'Localização')) = 0 then
      begin
        if StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Localização')) > 0 then
        begin
          IQuery.Sql.Add('AND (PRODUTOS.LOCALIZACAO_ID = :LOCALIZACAO_ID)');

          IQuery.ParamByName('LOCALIZACAO_ID').AsInteger := StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Localização'));
        end;
      end;

      if StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Produto Inicial')) > 0 then
      begin
        IQuery.Sql.Add('AND (PRODUTOS.PRODUTO_ID BETWEEN :PRODUTO_INICIAL AND :PRODUTO_FINAL)');

        IQuery.ParamByName('PRODUTO_INICIAL').AsInteger := StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Produto Inicial'));
        IQuery.ParamByName('PRODUTO_FINAL').AsInteger   := StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Produto Final'));
      end;

      if Status.Text = 'Ativos' then
        IQuery.Sql.Add('AND PRODUTOS.STATUS = ''A''')
      else if Status.Text = 'Desativados' then
        IQuery.Sql.Add('AND PRODUTOS.STATUS = ''D''');


      IQuery.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;

      IQuery.Sql.Add('ORDER BY PRODUTOS.DESCRICAO');
      IQuery.Prepare;
      IQuery.Open;


      QRLabel1.Caption := 'Data: ' + Data.Text;
      QRLabel2.Caption := 'Preço: ' + Preco.Text;

      if LeIni(Arq_Ini, 'Parâmetros Estoque', 'Grupo') = '0' then
        QRLabel6.Caption := 'Grupo: TODOS'
      else
        QRLabel6.Caption := 'Grupo: ' + Search_Tabela(StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Grupo')), '7');

      if LeIni(Arq_Ini, 'Parâmetros Estoque', 'SubTipo') = '0' then
        QRLabel7.Caption := 'Sub-Tipo: TODOS'
      else
        QRLabel7.Caption := 'Sub-Tipo: ' + Search_Tabela(StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'SubTipo')), '5');

      if LeIni(Arq_Ini, 'Parâmetros Estoque', 'Localização') = '0' then
        QRLabel8.Caption := 'Localização: TODAS'
      else
        QRLabel8.Caption := 'Localização: ' + Search_Tabela(StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Localização')), '8');

      if Preco.Text = 'Valor Compra' then
      begin
        QRDBText8.DataField := 'VALOR_COMPRA';
        QRExpr1.Expression  := '(IQuery.VALOR_COMPRA * IQuery.QUANTIDADE)';
        QRExpr2.Expression  := 'Sum(IQuery.VALOR_COMPRA * IQuery.QUANTIDADE)';
      end
      else if Preco.Text = 'Custo Compra' then
      begin
        QRDBText8.DataField := 'CUSTO_COMPRA';
        QRExpr1.Expression  := '(IQuery.CUSTO_COMPRA * IQuery.QUANTIDADE)';
        QRExpr2.Expression  := 'Sum(IQuery.CUSTO_COMPRA * IQuery.QUANTIDADE)';
      end
      else if Preco.Text = 'Customédio' then
      begin
        QRDBText8.DataField := 'CUSTOMEDIO';
        QRExpr1.Expression  := '(IQuery.CUSTOMEDIO * IQuery.QUANTIDADE)';
        QRExpr2.Expression  := 'Sum(IQuery.CUSTOMEDIO * IQuery.QUANTIDADE)';
      end
      else if Preco.Text = 'Pr. Varejo' then
      begin
        QRDBText8.DataField := 'PRECO_VAREJO';
        QRExpr1.Expression  := '(IQuery.PRECO_VAREJO * IQuery.QUANTIDADE)';
        QRExpr2.Expression  := 'Sum(IQuery.PRECO_VAREJO * IQuery.QUANTIDADE)';
      end;

      if IQuery.IsEmpty then
        Application.MessageBox('Não há dados para os parâmetros informados', PChar(Msg_Title), mb_IconInformation)
      else
       Begin
       Posicao.Prepare;
       //Posicao.ExportToFilter(TQRXLSFilter.Create(ExtractFilePath(ParamStr(0)) + 'Exportados\Posicao_' +Data.Text + '.xls'));
       Posicao.PreviewModal;
         if chk_exportar.Checked Then
         Begin
         Posicao.ExportToFilter(TQRXLSFilter.Create(ExtractFilePath(ParamStr(0)) + 'Exportados\Inventario_' + Copy(Data.Text,1,2) + Copy(Data.Text,4,2) + Copy(Data.Text,7,4)  + '.xls'));
         Application.MessageBox(PChar('Arquivo exportado para : ' + ExtractFilePath(ParamStr(0)) + 'Exportados\Inventario_' + Copy(Data.Text,1,2) + Copy(Data.Text,4,2) + Copy(Data.Text,7,4)  + '.xls') , PChar(Msg_Title), mb_IconInformation);
         End;
       //Application.MessageBox(PChar('Arquivo exportado para : ' + ExtractFilePath(ParamStr(0)) + 'Exportados\Posicao_' +Data.Text + '.xls') , PChar(Msg_Title), mb_IconInformation)
       End;
    end
    else
      Application.MessageBox('Necessário informar uma data', PChar(Msg_Title), mb_IconInformation)
  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;

procedure TFrmPosicao_Estoque.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPosicao_Estoque.DataKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmPosicao_Estoque.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmPosicao_Estoque.FormShow(Sender: TObject);
begin
  IQuery.Sql.Clear;
  IQuery.Sql.Add('SELECT DISTINCT DT_MOVIMENTO');
  IQuery.Sql.Add('FROM POSICAO_PRODUTOS');
  IQuery.Sql.Add('ORDER BY DT_MOVIMENTO DESC');
  IQuery.Prepare;
  IQuery.Open;

  Data.Items.Clear;
  Data.Items.Add('Hoje');

  IQuery.First;
  while not IQuery.Eof do
  begin
    Data.Items.Add(IQuery.FieldByName('DT_MOVIMENTO').AsString);
    Application.ProcessMessages;
    IQuery.Next;
  end;
end;

procedure TFrmPosicao_Estoque.PosicaoBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  Num_Page := 2;
end;

procedure TFrmPosicao_Estoque.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLabel16.Caption := 'Página: ' + IntToStr(Num_Page);
  Inc(Num_Page);
end;

end.
