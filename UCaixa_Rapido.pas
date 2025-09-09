unit UCaixa_Rapido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, Mask, rxToolEdit, rxCurrEdit, jpeg,
  ExtCtrls, DB, IBCustomDataSet, IBQuery, IBUpdateSQL, Math, ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, FireDAC.Comp.DataSet;

type
  TFrmCaixa_Rapido = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Lbl_Preco_Quantidade: TLabel;
    Panel3: TPanel;
    Lbl_Descricao: TLabel;
    Panel4: TPanel;
    Image1: TImage;
    Panel5: TPanel;
    Lbl_Sub_Total: TLabel;
    Sub_Tot: TCurrencyEdit;
    Produto: TEdit;
    ibqry1: TIBQuery;
    DBGrid2: TDBGrid;
    DataLog_Itens: TDataSource;
    Lbl_Codigo_Produto: TLabel;
    StatusBar1: TStatusBar;
    Comandas: TMemo;
    IBquery1: TFDQuery;
    QProduto: TFDQuery;
    QRel: TFDQuery;
    QLog_Itens: TFDQuery;
    QInsert: TFDQuery;
    USql_Log_Itens: TFDUpdateSQL;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure ProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure ProdutoExit(Sender: TObject);
    procedure ProdutoEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ProdutoChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ProdutoSearch;
    procedure Soma;
    function Validacao: Boolean;
  end;

var
  FrmCaixa_Rapido: TFrmCaixa_Rapido;
  Qtde, Preco_Venda: Real;
  Operacao, Cod_Alternativo, Cod_Reduzido, Num_Comanda: String;
  Orcamento: Integer;

  function BloqueiaEntrada(Bloquear: Boolean): Boolean;

implementation

uses
  UData, UPrincipal, UConsulta, UQuantidade, UPagamento, UComanda;

{$R *.dfm}

function TFrmCaixa_Rapido.Validacao: Boolean;
begin
  Result := False;

  if LeIni(Arq_Ini, 'Sistema', 'Permitir Estoque Negativo') = 'False' then
  begin
    if QLog_Itens.Locate('PRODUTO_ID;CUPOM', VarArrayOf([QProduto.FieldByName('PRODUTO_ID').AsInteger, SerialNum('C')]), [loCaseInsensitive]) then
    begin
      if (Qtde + QLog_Itens.FieldByName('QUANTIDADE').AsFloat) > (QProduto.FieldByName('QUANTIDADE_G').AsFloat - QProduto.FieldByName('QUANTIDADE_C').AsFloat) then
      begin
        Application.MessageBox('Produto com estoque insuficiente', PChar(Msg_Title), MB_IconStop);
        Lbl_Preco_Quantidade.Caption := '';
        exit;
      end;
    end
    else
    begin
      if Qtde > (QProduto.FieldByName('QUANTIDADE_G').AsFloat - QProduto.FieldByName('QUANTIDADE_C').AsFloat) then
      begin
        Application.MessageBox('Produto com estoque insuficiente', PChar(Msg_Title), MB_IconStop);
        Lbl_Preco_Quantidade.Caption := '';
        exit;
      end;
    end;
  end;

  if (QProduto.FieldByName('PESAVEL').AsString <> 'SIM') and (Frac(Qtde) > 0) then
  begin
    Qtde := 1;
    Application.MessageBox('Produto não permite quantidade fracionada', PChar(Msg_Title), MB_IconStop);
    Lbl_Preco_Quantidade.Caption := '';
    exit;
  end;

  if (QProduto.FieldByName('PROVQT').AsString <> 'SIM') and (Qtde > 1) and (Operacao <> 'Cancelando') then
  begin
    Qtde := 1;
    Application.MessageBox('Produto não permite multiplicação', PChar(Msg_Title), MB_IconStop);
    Lbl_Preco_Quantidade.Caption := '';
    exit;
  end;

  Result := True;
end;

procedure TFrmCaixa_Rapido.Soma;
begin
  QRel.Sql.Clear;
  QRel.Sql.Add('SELECT SUM(VR_TOTAL) AS VALOR');
  QRel.Sql.Add('FROM LOG_ITENS');
  QRel.Sql.Add('WHERE');
  QRel.Sql.Add('(CUPOM = :CUPOM)');

  QRel.ParamByName('CUPOM').AsString := SerialNum('C');

  QRel.Prepare;
  QRel.Open;

  Sub_Tot.Value         := QRel.FieldByName('VALOR').AsFloat;
  Lbl_Sub_Total.Caption := 'Sub-Total: R$ ' + FormatFloat('#,##0.00', QRel.FieldByName('VALOR').AsFloat);
end;

procedure TFrmCaixa_Rapido.ProdutoSearch;
begin
  QProduto.Sql.Clear;
  QProduto.Sql.Add('SELECT PRODUTOS.*, TRIBUTOS.CODIGO_ECF, TRIBUTOS.ORIGEM, TRIBUTOS.TRIBUTACAO, TRIBUTOS.CFOP');
  QProduto.Sql.Add('FROM PRODUTOS');
  QProduto.Sql.Add('INNER JOIN TRIBUTOS');
  QProduto.Sql.Add('ON (PRODUTOS.TRIBUTO_ID = TRIBUTOS.TRIBUTO_ID)');
  QProduto.Sql.Add('WHERE');
  QProduto.Sql.Add('((PRODUTOS.COD_BARRA = :COD_BARRA) OR (PRODUTOS.COD_BARRA_AUX1 = :COD_BARRA) OR (PRODUTOS.COD_BARRA_AUX2 = :COD_BARRA) OR ' +
                   '(PRODUTOS.COD_BARRA_AUX3 = :COD_BARRA) OR (PRODUTOS.COD_BARRA_AUX4 = :COD_BARRA) OR (PRODUTOS.COD_ORIGINAL = :ALTERNATIVO) OR (PRODUTOS.REFERENCIA = :ALTERNATIVO) OR (PRODUTOS.CODRED = :CODRED))');
  QProduto.Sql.Add('AND (PRODUTOS.EMPRESA_ID = :EMPRESA_ID)');
  QProduto.Sql.Add('AND (PRODUTOS.STATUS = :STATUS)');

  if StrToInt(LeIni(Arq_Ini, 'Sistema', 'Localização')) > 0 then
  begin
    QProduto.Sql.Add('AND (PRODUTOS.LOCALIZACAO_ID = :LOCALIZACAO_ID)');

    QProduto.ParamByName('LOCALIZACAO_ID').AsInteger := StrToInt(LeIni(Arq_Ini, 'Sistema', 'Localização'));
  end;

  QProduto.ParamByName('COD_BARRA').AsString    := StrZero(Produto.Text, FrmPrincipal.Config.FieldByName('TAM_BARRAS').AsInteger, 0);
  QProduto.ParamByName('ALTERNATIVO').AsString  := Cod_Alternativo;
  QProduto.ParamByName('CODRED').AsString       := StrZero(Copy(Cod_Reduzido, 1, FrmPrincipal.Config.FieldByName('TAM_PESAVEIS').AsInteger), FrmPrincipal.Config.FieldByName('TAM_PESAVEIS').AsInteger, 0);
  QProduto.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  QProduto.ParamByName('STATUS').AsString       := 'A';

  QProduto.Prepare;
  QProduto.Open;

  if (FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime >= QProduto.FieldByName('PROMO_INICIAL').AsDateTime) and (FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime <= QProduto.FieldByName('PROMO_FINAL').AsDateTime) then
    Preco_Venda := QProduto.FieldByName('PRECO_PROMOCAO').AsFloat
  else
    Preco_Venda := QProduto.FieldByName('PRECO_VAREJO').AsFloat;
end;

procedure TFrmCaixa_Rapido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmCaixa_Rapido.FormCreate(Sender: TObject);
begin
  Qtde := 1;

  DBGrid2.Columns[0].Width := 217;
  DBGrid2.Columns[1].Width := 64;
  DBGrid2.Columns[2].Width := 64;
  DBGrid2.Columns[3].Width := 64;

  QLog_Itens.Close;
  QLog_Itens.ParamByName('CUPOM').AsString := SerialNum('C');
  QLog_Itens.Prepare;
  QLog_Itens.Open;

  Soma;

  if QLog_Itens.IsEmpty then
    Operacao := 'Livre'
  else
    Operacao := 'Vendendo';

  Num_Comanda := '';
  Orcamento   := 0;

  Lbl_Codigo_Produto.Caption := Operacao;
end;

procedure TFrmCaixa_Rapido.FormDestroy(Sender: TObject);
begin
  if LeIni(Arq_Ini, 'Sistema', 'Excluir Itens Caixa Rápido') = 'True' then
  begin
    QLog_Itens.First;
    while not QLog_Itens.Eof do
    begin
      QLog_Itens.Delete;



      Application.ProcessMessages;
    end;
  end;
end;

procedure TFrmCaixa_Rapido.FormShow(Sender: TObject);
begin
  Produto.SetFocus;
end;

procedure TFrmCaixa_Rapido.ProdutoChange(Sender: TObject);
begin
  Lbl_Codigo_Produto.Caption := Produto.Text;
end;

procedure TFrmCaixa_Rapido.ProdutoEnter(Sender: TObject);
begin
  Produto.Text := '';
end;

procedure TFrmCaixa_Rapido.ProdutoExit(Sender: TObject);
var
Vr_Produto: Real;
begin
  if Produto.Text <> '' then
  begin
    try
      Produto.Enabled := False;

      Cod_Alternativo := Produto.Text;
      Cod_Reduzido    := Produto.Text;

      if Operacao <> 'Cancelando' then
      begin
        Vr_Produto := 0;

        if (Copy(Produto.Text, 1, 1) = '2') and (FrmPrincipal.Config.FieldByName('TEM_BALANCA').AsString = 'True') then
        begin
          if (Copy(Produto.Text, 1, 1) = '2') and (FrmPrincipal.Config.FieldByName('TEM_BALANCA').AsString = 'True') then
          begin
            if LeIni(Arq_Ini, 'Sistema', 'Retorno Etiqueta') = 'Peso' then
            begin
              if LeIni(Arq_Ini, 'Sistema', 'Formato Etiqueta') = '1' then
                Qtde := StrToFloat(Copy(Produto.Text, 8, 3) + ',' + Copy(Produto.Text, 11, 2))
              else
                Qtde := StrToFloat(Copy(Produto.Text, 8, 2) + ',' + Copy(Produto.Text, 10, 3))
            end
            else
            begin
              if LeIni(Arq_Ini, 'Sistema', 'Formato Etiqueta') = '1' then
                Vr_Produto := StrToFloat(Copy(Produto.Text, 8, 3) + ',' + Copy(Produto.Text, 11, 2))
              else
                Vr_Produto := StrToFloat(Copy(Produto.Text, 8, 2) + ',' + Copy(Produto.Text, 10, 3));
            end;
          end;

          Produto.Text := Copy(Produto.Text, 2, FrmPrincipal.Config.FieldByName('TAM_PESAVEIS').AsInteger);

          if FrmPrincipal.Config.FieldByName('GERA_DIGITO').AsString = 'True' then
            Produto.Text := Dig(Produto.Text);

          Cod_Reduzido := Produto.Text;

          Produto.Text := StrZero(Produto.Text, FrmPrincipal.Config.FieldByName('TAM_BARRAS').AsInteger, 0);
        end;

        Produto.Text := StrZero(Produto.Text, FrmPrincipal.Config.FieldByName('TAM_BARRAS').AsInteger, 0);

        ProdutoSearch;

        if QProduto.IsEmpty then
        begin
          Application.MessageBox('Produto inválido ou inexistente', PChar(Msg_Title), MB_IconStop);
          Produto.Enabled := True;
          Produto.SetFocus;
        end
        else
        begin
          if Validacao then
          begin
            if QLog_Itens.Locate('PRODUTO_ID;CUPOM', VarArrayOf([QProduto.FieldByName('PRODUTO_ID').AsInteger, SerialNum('C')]), [loCaseInsensitive]) then
              QLog_Itens.Edit
            else
              QLog_Itens.Append;

            try
              QLog_Itens.FieldByName('CUPOM').AsString        := SerialNum('C');
              QLog_Itens.FieldByName('PRODUTO_ID').AsInteger  := QProduto.FieldByName('PRODUTO_ID').AsInteger;
              QLog_Itens.FieldByName('COD_BARRA').AsString    := QProduto.FieldByName('COD_BARRA').AsString;
              QLog_Itens.FieldByName('DESCRICAO').AsString    := QProduto.FieldByName('DESCRICAO').AsString;
              QLog_Itens.FieldByName('TRIBUTO_ID').AsInteger  := QProduto.FieldByName('TRIBUTO_ID').AsInteger;
              QLog_Itens.FieldByName('ALIQUOTA_ICMS').AsFloat := QProduto.FieldByName('ALIQUOTA_ICMS').AsFloat;
              QLog_Itens.FieldByName('IPI').AsFloat           := QProduto.FieldByName('IPI').AsFloat;
              QLog_Itens.FieldByName('VR_UNITARIO').AsFloat   := Preco_Venda;
              QLog_Itens.FieldByName('VR_DESCONTO').AsFloat   := 0;
              QLog_Itens.FieldByName('CFOP').AsString         := QProduto.FieldByName('CFOP').AsString;

              if Vr_Produto > 0 then
                QLog_Itens.FieldByName('QUANTIDADE').AsFloat := (QLog_Itens.FieldByName('QUANTIDADE').AsFloat + (Vr_Produto / Preco_Venda))
              else
                QLog_Itens.FieldByName('QUANTIDADE').AsFloat := QLog_Itens.FieldByName('QUANTIDADE').AsFloat + Qtde;

              QLog_Itens.FieldByName('VR_TOTAL').AsFloat := (QLog_Itens.FieldByName('QUANTIDADE').AsFloat * QLog_Itens.FieldByName('VR_UNITARIO').AsFloat);
              QLog_Itens.FieldByName('MVA').AsFloat      := QProduto.FieldByName('MVA').AsFloat;
              QLog_Itens.FieldByName('CST').AsString     := Copy(QProduto.FieldByName('ORIGEM').AsString, 1, 1) + Copy(QProduto.FieldByName('TRIBUTACAO').AsString, 1, 2);
              QLog_Itens.Post;



              Soma;

              Qtde                         := 1;
              Lbl_Descricao.Caption        := QProduto.FieldByName('DESCRICAO').AsString;
              Lbl_Preco_Quantidade.Caption := FormatFloat('#,###0.000', Qtde) + ' x ' + FormatFloat('#,##0.00', Preco_Venda);
              Application.ProcessMessages;
            except
              QLog_Itens.Cancel;
            end;
          end;
        end;
      end
      else if Operacao = 'Cancelando' then
      begin
        if (Copy(Produto.Text, 1, 1) = '2') and (FrmPrincipal.Config.FieldByName('TEM_BALANCA').AsString = 'True') then
        begin
          if (Copy(Produto.Text, 1, 1) = '2') and (FrmPrincipal.Config.FieldByName('TEM_BALANCA').AsString = 'True') then
          begin
            if LeIni(Arq_Ini, 'Sistema', 'Retorno Etiqueta') = 'Peso' then
            begin
              if LeIni(Arq_Ini, 'Sistema', 'Formato Etiqueta') = '1' then
                Qtde := StrToFloat(Copy(Produto.Text, 8, 3) + ',' + Copy(Produto.Text, 11, 2))
              else
                Qtde := StrToFloat(Copy(Produto.Text, 8, 2) + ',' + Copy(Produto.Text, 10, 3))
            end
            else
            begin
              if LeIni(Arq_Ini, 'Sistema', 'Formato Etiqueta') = '1' then
                Vr_Produto := StrToFloat(Copy(Produto.Text, 8, 3) + ',' + Copy(Produto.Text, 11, 2))
              else
                Vr_Produto := StrToFloat(Copy(Produto.Text, 8, 2) + ',' + Copy(Produto.Text, 10, 3));
            end;
          end;

          Produto.Text := Copy(Produto.Text, 2, FrmPrincipal.Config.FieldByName('TAM_PESAVEIS').AsInteger);

          if FrmPrincipal.Config.FieldByName('GERA_DIGITO').AsString = 'True' then
            Produto.Text := Dig(Produto.Text);

          Produto.Text := StrZero(Produto.Text, FrmPrincipal.Config.FieldByName('TAM_BARRAS').AsInteger, 0);
        end;

        Produto.Text := StrZero(Produto.Text, FrmPrincipal.Config.FieldByName('TAM_BARRAS').AsInteger, 0);

        ProdutoSearch;

        if QLog_Itens.Locate('COD_BARRA;CUPOM', VarArrayOf([QProduto.FieldByName('COD_BARRA').AsString, SerialNum('C')]), [loCaseInsensitive]) then
        begin
          ProdutoSearch;

          if Vr_Produto > 0 then
            Qtde := (Vr_Produto / Preco_Venda);

          if Validacao then
          begin
            if Qtde < QLog_Itens.FieldByName('QUANTIDADE').AsFloat then
            begin
              QLog_Itens.Edit;
              QLog_Itens.FieldByName('QUANTIDADE').AsFloat := (QLog_Itens.FieldByName('QUANTIDADE').AsFloat - Qtde);
              QLog_Itens.FieldByName('VR_TOTAL').AsFloat   := (QLog_Itens.FieldByName('QUANTIDADE').AsFloat * QLog_Itens.FieldByName('VR_UNITARIO').AsFloat);
              QLog_Itens.Post;


              Soma;
              Qtde := 1;
            end
            else if Qtde = QLog_Itens.FieldByName('QUANTIDADE').AsFloat then
            begin
              QLog_Itens.Delete;

              Soma;
              Qtde := 1;
            end
            else if Qtde > QLog_Itens.FieldByName('QUANTIDADE').AsFloat then
              Application.MessageBox('Quantidade inválida', PChar(Msg_Title), MB_IconStop);
          end;

          if QLog_Itens.IsEmpty then
          begin
            Operacao := 'Livre';
            lbl_Descricao.Caption := '';
            lbl_Preco_Quantidade.Caption := '';
          end
          else
            Operacao := 'Vendendo';

          Lbl_Codigo_Produto.Caption := Operacao;
        end
        else
        begin
          Application.MessageBox('Produto inexistente', PChar(Msg_Title), MB_IconStop);
          Operacao := 'Vendendo';
          Lbl_Codigo_Produto.Caption := Operacao;
        end;
      end;
    finally
      Produto.Enabled := True;
      Produto.SetFocus;
    end;
  end
  else
    Produto.SetFocus;
end;

procedure TFrmCaixa_Rapido.ProdutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
Operador: String;
X: Integer;
begin
  if Key = VK_Return then
    Perform(Wm_NextDlgCtl, 0, 0);

  if (Key = VK_F4) and (Sub_Tot.Value > 0) then
  begin
    Operacao := 'Cancelando';
    Lbl_Codigo_Produto.Caption := Operacao;
  end;

  if Key = VK_F5 then
  begin
    Orcamento := GetConsulta('ORÇAMENTO', 0, 0, 0);

    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT ORCITENS.*, PRODUTOS.COD_BARRA');
    QRel.Sql.Add('FROM ORCITENS');
    QRel.Sql.Add('INNER JOIN ORCAMENTOS');
    QRel.Sql.Add('ON (ORCITENS.ORCAMENTO_ID = ORCAMENTOS.ORCAMENTO_ID)');
    QRel.Sql.Add('INNER JOIN PRODUTOS');
    QRel.Sql.Add('ON (ORCITENS.PRODUTO_ID = PRODUTOS.PRODUTO_ID)');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(ORCITENS.ORCAMENTO_ID = :ORCAMENTO_ID)');
    QRel.Sql.Add('AND (ORCAMENTOS.EMPRESA_ID = :EMPRESA_ID)');

    QRel.ParamByName('ORCAMENTO_ID').AsInteger := Orcamento;
    QRel.ParamByName('EMPRESA_ID').AsInteger   := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;

    QRel.Prepare;
    QRel.Open;

    QRel.First;
    while not QRel.Eof do
    begin
      Produto.Text    := QRel.FieldByName('COD_BARRA').AsString;
      Cod_Alternativo := Produto.Text;
      Cod_Reduzido    := Produto.Text;

      ProdutoSearch;

      if QProduto.IsEmpty then
      begin
        Produto.Text := '';
        exit;
      end;

      if QLog_Itens.Locate('PRODUTO_ID;CUPOM', VarArrayOf([QProduto.FieldByName('PRODUTO_ID').AsInteger, SerialNum('C')]), [loCaseInsensitive]) then
        QLog_Itens.Edit
      else
        QLog_Itens.Append;

      try
        QLog_Itens.FieldByName('CUPOM').AsString        := SerialNum('C');
        QLog_Itens.FieldByName('PRODUTO_ID').AsInteger  := QProduto.FieldByName('PRODUTO_ID').AsInteger;
        QLog_Itens.FieldByName('COD_BARRA').AsString    := QProduto.FieldByName('COD_BARRA').AsString;
        QLog_Itens.FieldByName('DESCRICAO').AsString    := QProduto.FieldByName('DESCRICAO').AsString;
        QLog_Itens.FieldByName('TRIBUTO_ID').AsInteger  := QProduto.FieldByName('TRIBUTO_ID').AsInteger;
        QLog_Itens.FieldByName('ALIQUOTA_ICMS').AsFloat := QProduto.FieldByName('ALIQUOTA_ICMS').AsFloat;
        QLog_Itens.FieldByName('IPI').AsFloat           := QProduto.FieldByName('IPI').AsFloat;
        QLog_Itens.FieldByName('VR_UNITARIO').AsFloat   := QRel.FieldByName('VR_UNITARIO').AsFloat;
        QLog_Itens.FieldByName('VR_DESCONTO').AsFloat   := 0;
        QLog_Itens.FieldByName('QUANTIDADE').AsFloat    := (QLog_Itens.FieldByName('QUANTIDADE').AsFloat + QRel.FieldByName('QUANTIDADE').AsFloat);
        QLog_Itens.FieldByName('VR_TOTAL').AsFloat      := (QLog_Itens.FieldByName('QUANTIDADE').AsFloat * QLog_Itens.FieldByName('VR_UNITARIO').AsFloat);
        QLog_Itens.FieldByName('MVA').AsFloat           := QProduto.FieldByName('MVA').AsFloat;
        QLog_Itens.FieldByName('CST').AsString          := Copy(QProduto.FieldByName('ORIGEM').AsString, 1, 1) + Copy(QProduto.FieldByName('TRIBUTACAO').AsString, 1, 2);
        QLog_Itens.FieldByName('CFOP').AsString         := QProduto.FieldByName('CFOP').AsString;

        QLog_Itens.Post;



        Lbl_Descricao.Caption        := QProduto.FieldByName('DESCRICAO').AsString;
        Lbl_Preco_Quantidade.Caption := FormatFloat('#,###0.000', QRel.FieldByName('QUANTIDADE').AsFloat) + ' x ' + FormatFloat('#,##0.00', QRel.FieldByName('VR_UNITARIO').AsFloat);
      except
        QLog_Itens.Cancel;
      end;

      Application.ProcessMessages;
      QRel.Next;
    end;

    Soma;

    Produto.Text := '';
    Produto.SetFocus;
  end;

  if Key = VK_F7 then
  begin
    QProduto.Sql.Clear;
    QProduto.Sql.Add('SELECT * FROM PRODUTOS');
    QProduto.Sql.Add('WHERE');
    QProduto.Sql.Add('(PRODUTO_ID = :PRODUTO_ID)');
    QProduto.Sql.Add('AND (EMPRESA_ID = :EMPRESA_ID)');
    QProduto.Sql.Add('AND (STATUS = :STATUS)');

    if StrToInt(LeIni(Arq_Ini, 'Sistema', 'Localização')) > 0 then
    begin
      QProduto.Sql.Add('AND (LOCALIZACAO_ID = :LOCALIZACAO_ID)');

      QProduto.ParamByName('LOCALIZACAO_ID').AsInteger := StrToInt(LeIni(Arq_Ini, 'Sistema', 'Localização'));
    end;

    QProduto.ParamByName('PRODUTO_ID').AsInteger := GetConsulta('ESTOQUE', FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger, 0, 0);
    Qproduto.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    QProduto.ParamByName('STATUS').AsString      := 'A';

    QProduto.Prepare;
    QProduto.Open;

    Produto.Text := QProduto.FieldByName('COD_BARRA').AsString;

    Keybd_Event(VK_RETURN, 0, 0, 0);
  end;

  if Key = VK_F8 then
  begin
    Application.CreateForm(TFrmComanda, FrmComanda);
    try
      if FrmComanda.ShowModal = mrOK then
      begin
        if FrmComanda.Comanda.Text <> '' then
        begin
          Num_Comanda := FrmComanda.Comanda.Text;

          QRel.Sql.Clear;
          QRel.Sql.Add('SELECT ORCITENS.*, PRODUTOS.COD_BARRA');
          QRel.Sql.Add('FROM ORCITENS');
          QRel.Sql.Add('INNER JOIN ORCAMENTOS');
          QRel.Sql.Add('ON (ORCITENS.ORCAMENTO_ID = ORCAMENTOS.ORCAMENTO_ID)');
          QRel.Sql.Add('INNER JOIN PRODUTOS');
          QRel.Sql.Add('ON (ORCITENS.PRODUTO_ID = PRODUTOS.PRODUTO_ID)');
          QRel.Sql.Add('WHERE');
          QRel.Sql.Add('(ORCAMENTOS.COMANDA = :COMANDA)');
          QRel.Sql.Add('AND (ORCAMENTOS.EMPRESA_ID = :EMPRESA_ID)');

          QRel.ParamByName('COMANDA').AsString     := FrmComanda.Comanda.Text;
          QRel.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;

          QRel.Prepare;
          QRel.Open;

          if QRel.IsEmpty then
          begin
            QInsert.Sql.Clear;
            QInsert.Sql.Add('INSERT INTO ORCAMENTOS(DT_ORCAMENTO,   DT_MOVIMENTO,  EMPRESA_ID,  COMANDA,  CONTATO) VALUES( ' +
                                                    ':DT_ORCAMENTO, :DT_MOVIMENTO, :EMPRESA_ID, :COMANDA, :CONTATO)');

            QInsert.ParamByName('DT_ORCAMENTO').AsDateTime  := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
            QInsert.ParamByName('DT_MOVIMENTO').AsDateTime  := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
            QInsert.ParamByName('EMPRESA_ID').AsInteger     := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
            QInsert.ParamByName('COMANDA').AsString         := FrmComanda.Comanda.Text;;
            QInsert.ParamByName('CONTATO').AsString         := TimeToStr(Time);

            QInsert.Prepare;
            QInsert.ExecSql;



            Application.MessageBox('Cartão sem consumo', PChar(Msg_Title), MB_IconStop);
            exit;
          end;

          QRel.First;
          while not QRel.Eof do
          begin
            Produto.Text    := QRel.FieldByName('COD_BARRA').AsString;
            Cod_Alternativo := Produto.Text;
            Cod_Reduzido    := Produto.Text;

            ProdutoSearch;

            if QProduto.IsEmpty then
            begin
              Produto.Text := '';
              exit;
            end;

            if QLog_Itens.Locate('PRODUTO_ID;CUPOM', VarArrayOf([QProduto.FieldByName('PRODUTO_ID').AsInteger, SerialNum('C')]), [loCaseInsensitive]) then
              QLog_Itens.Edit
            else
              QLog_Itens.Append;

            try
              QLog_Itens.FieldByName('CUPOM').AsString        := SerialNum('C');
              QLog_Itens.FieldByName('PRODUTO_ID').AsInteger  := QProduto.FieldByName('PRODUTO_ID').AsInteger;
              QLog_Itens.FieldByName('COD_BARRA').AsString    := QProduto.FieldByName('COD_BARRA').AsString;
              QLog_Itens.FieldByName('DESCRICAO').AsString    := QProduto.FieldByName('DESCRICAO').AsString;
              QLog_Itens.FieldByName('TRIBUTO_ID').AsInteger  := QProduto.FieldByName('TRIBUTO_ID').AsInteger;
              QLog_Itens.FieldByName('ALIQUOTA_ICMS').AsFloat := QProduto.FieldByName('ALIQUOTA_ICMS').AsFloat;
              QLog_Itens.FieldByName('IPI').AsFloat           := QProduto.FieldByName('IPI').AsFloat;
              QLog_Itens.FieldByName('VR_UNITARIO').AsFloat   := QRel.FieldByName('VR_UNITARIO').AsFloat;
              QLog_Itens.FieldByName('VR_DESCONTO').AsFloat   := 0;
              QLog_Itens.FieldByName('QUANTIDADE').AsFloat    := (QLog_Itens.FieldByName('QUANTIDADE').AsFloat + QRel.FieldByName('QUANTIDADE').AsFloat);
              QLog_Itens.FieldByName('VR_TOTAL').AsFloat      := (QLog_Itens.FieldByName('QUANTIDADE').AsFloat * QLog_Itens.FieldByName('VR_UNITARIO').AsFloat);
              QLog_Itens.FieldByName('MVA').AsFloat           := QProduto.FieldByName('MVA').AsFloat;
              QLog_Itens.FieldByName('CST').AsString          := Copy(QProduto.FieldByName('ORIGEM').AsString, 1, 1) + Copy(QProduto.FieldByName('TRIBUTACAO').AsString, 1, 2);
              QLog_Itens.FieldByName('CFOP').AsString         := QProduto.FieldByName('CFOP').AsString;

              QLog_Itens.Post;



              Lbl_Descricao.Caption        := QProduto.FieldByName('DESCRICAO').AsString;
              Lbl_Preco_Quantidade.Caption := FormatFloat('#,###0.000', QLog_Itens.FieldByName('QUANTIDADE').AsFloat) + ' x ' + FormatFloat('#,##0.00', QRel.FieldByName('VR_UNITARIO').AsFloat);
            except
              QLog_Itens.Cancel;
            end;

            Application.ProcessMessages;
            QRel.Next;
          end;

          Comandas.Lines.Add(Num_Comanda);

          Soma;

          Produto.Text := '';
          Produto.SetFocus;
        end;
      end;
    finally
      FrmComanda.Release;
    end;
  end;

  if Key = VK_F10 then
  begin
    if Sub_Tot.Value > 0 then
    begin
      if FrmPrincipal.Config.FieldByName('TURNO').AsString = 'True' then
      begin
        QRel.Sql.Clear;
        QRel.Sql.Add('SELECT * FROM TURNO');
        QRel.Sql.Add('WHERE');
        QRel.Sql.Add('(STATUS = :STATUS)');
        QRel.Sql.Add('AND (CAIXA_ID = :CAIXA_ID)');

        QRel.ParamByName('STATUS').AsString    := 'A';
        QRel.ParamByName('CAIXA_ID').AsInteger := StrToInt(LeIni(Arq_Ini, 'Sistema', 'Caixa'));

        QRel.Prepare;
        QRel.Open;

        Operador := QRel.FieldByName('OPERADOR').AsString;
      end
      else
        Operador := '';

      QRel.Sql.Clear;
      QRel.Sql.Add('SELECT CFOP, COUNT(*)');
      QRel.Sql.Add('FROM LOG_ITENS');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(CUPOM = :CUPOM)');
      QRel.Sql.Add('GROUP BY CFOP');
      QRel.Sql.Add('ORDER BY 2');

      QRel.ParamByName('CUPOM').AsString := SerialNum('C');

      QRel.Prepare;
      QRel.Open;

      QRel.Last;

      Pagamento(Sub_Tot.Value, Operador, Num_Comanda, QRel.FieldByName('CFOP').AsString, Orcamento);

      QLog_Itens.Close;

      QLog_Itens.ParamByName('CUPOM').AsString := SerialNum('C');

      QLog_Itens.Prepare;
      QLog_Itens.Open;

      Soma;

      if QLog_Itens.IsEmpty then
      begin
        Operacao                     := 'Livre';
        lbl_Descricao.Caption        := '';
        lbl_Preco_Quantidade.Caption := '';
        Orcamento                    := 0;

        for X := 0 to (Comandas.Lines.Count - 1) do
        begin
          QRel.Sql.Clear;
          QRel.Sql.Add('UPDATE ORCAMENTOS SET COMANDA = :NEW_COMANDA');
          QRel.Sql.Add('WHERE');
          QRel.Sql.Add('(COMANDA = :COMANDA)');
          QRel.Sql.Add('AND (EMPRESA_ID = :EMPRESA_ID)');

          QRel.ParamByName('NEW_COMANDA').AsString := 'A-' + Comandas.Lines.Strings[X];
          QRel.ParamByName('COMANDA').AsString     := Comandas.Lines.Strings[X];
          QRel.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;

          QRel.Prepare;
          QRel.ExecSql;


        end;

        Comandas.Lines.Clear;
      end
      else
        Operacao := 'Vendendo';
    end;
  end;
end;

procedure TFrmCaixa_Rapido.ProdutoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  begin
    if Operacao <> 'Cancelando' then
      Close
    else
    begin
      if QLog_Itens.IsEmpty then
      begin
        Operacao                     := 'Livre';
        lbl_Descricao.Caption        := '';
        lbl_Preco_Quantidade.Caption := '';
      end
      else
        Operacao := 'Vendendo';

      Lbl_Codigo_Produto.Caption := Operacao;
    end;
  end;

//  if Key = #33 then
//    SendMessage(DBGrid2.Handle, WM_VSCROLL, SB_PAGEUP, 0);

//  if Key = #34 then
//    SendMessage(DBGrid2.Handle, WM_VSCROLL, SB_PAGEDOWN, 0);

//SB_LINEDOWN - Uma linha para baixo.
//SB_LINEUP - Uma linha para cima.
//SB_PAGEDOWN - Uma página para baixo.
//SB_PAGEUP - Uma página para cima.
//SB_TOP - Topo da lista.
//SB_BOTTOM - Fim da lista.

  if Key = #32 then
    Key := #0;

  if (Key = #88) or (Key = #120) then
  begin
    Key := #0;

    Application.CreateForm(TFrmQuantidade, FrmQuantidade);
    try
      FrmQuantidade.ShowModal;

      Qtde := FrmQuantidade.Quantidade.Value;

      Lbl_Preco_Quantidade.Caption := FormatFloat('#,###0.000', Qtde) + ' x ';
    finally
      FrmQuantidade.Release;
    end;
  end;
end;

function BloqueiaEntrada(Bloquear : Boolean): Boolean;
function FuncAvail(_dllnome, _funcnome: String; var _p: Pointer): Boolean;
var _lib : THandle;
begin
  Result := False;

  _p := nil;
  if LoadLibrary(Pchar(_dllnome)) = 0 then
    exit;
  _lib := GetModuleHandle(Pchar(_dllnome));
  if _lib <> 0 then
  begin
    _p := GetProcAddress(_lib, Pchar(_funcnome));
    if _p <> nil then
      Result := True;
  end;
end;

var xBlockInput: function(Block: Bool): Bool; stdcall;
begin
  if FuncAvail('USER32.DLL','BlockInput', @xBlockInput) = True then
    Result := xBlockInput(Bloquear)
  else
    Result := False;
end;

end.


