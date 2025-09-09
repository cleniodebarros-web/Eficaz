unit UListagem_Inventario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, IBCustomDataSet, IBQuery, ExtCtrls, QRCtrls, QuickRpt,
  Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmListagem_Inventario = class(TForm)
    Label1: TLabel;
    Bevel1: TBevel;
    Data: TComboBox;
    Inventario: TQuickRep;
    QRBand1: TQRBand;
    QRSysData1: TQRSysData;
    Cabec: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    QRDBText3: TQRDBText;
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
    QRGroup1: TQRGroup;
    QRDBText1: TQRDBText;
    QRBand4: TQRBand;
    QRExpr3: TQRExpr;
    QRLabel1: TQRLabel;
    QRLabel9: TQRLabel;
    QRGroup2: TQRGroup;
    QRDBText9: TQRDBText;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    QRBand5: TQRBand;
    QRExpr4: TQRExpr;
    QRLabel13: TQRLabel;
    Gera_Arquivo: TCheckBox;
    Revenda: TCheckBox;
    IQuery: TFDQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRetornaClick(Sender: TObject);
    procedure DataKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure Gera_ArquivoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmListagem_Inventario: TFrmListagem_Inventario;

implementation

uses
  UData, UPrincipal;

{$R *.dfm}

procedure TFrmListagem_Inventario.btnExecutaClick(Sender: TObject);
var
F1: TextFile;
Dt_Inventario: String;
Vr_Unitario, Vr_Total: Real;
begin
  if Data.Text <> '' then
  begin
    IQuery.Sql.Clear;

    if Data.Text <> 'Hoje' then
    begin
      Dt_Inventario := Data.Text;

      QRLabel3.Caption := '*** ESTOQUE EXISTENTE EM ' + Data.Text + ' ***';

      if FrmData.QAcesso.FieldByName('TPCTB').AsString = '2' then
        IQuery.Sql.Add('SELECT POSICAO_PRODUTOS.PRODUTO_ID, POSICAO_PRODUTOS.CUSTO_COMPRA, POSICAO_PRODUTOS.VALOR_COMPRA, ' +
                       'POSICAO_PRODUTOS.CUSTOMEDIO, POSICAO_PRODUTOS.PRECO_VAREJO, POSICAO_PRODUTOS.PRECO_ATACADO, POSICAO_PRODUTOS.QUANTIDADE_C QUANTIDADE, PRODUTOS.DESCRICAO, PRODUTOS.UNIDADE_VENDA, PRODUTOS.COD_BARRA, ' +
                       'PRODUTOS.GRUPO_ID, PRODUTOS.NCM, TABELAS.DESCRICAO GRUPO, TRIBUTOS.DESCRICAO ALIQUOTA')
      else
        IQuery.Sql.Add('SELECT POSICAO_PRODUTOS.PRODUTO_ID, POSICAO_PRODUTOS.CUSTO_COMPRA, POSICAO_PRODUTOS.VALOR_COMPRA, ' +
                       'POSICAO_PRODUTOS.CUSTOMEDIO, POSICAO_PRODUTOS.PRECO_VAREJO, POSICAO_PRODUTOS.PRECO_ATACADO, POSICAO_PRODUTOS.QUANTIDADE_G QUANTIDADE, PRODUTOS.DESCRICAO, PRODUTOS.UNIDADE_VENDA, PRODUTOS.COD_BARRA, ' +
                       'PRODUTOS.GRUPO_ID, PRODUTOS.NCM, TABELAS.DESCRICAO GRUPO, TRIBUTOS.DESCRICAO ALIQUOTA');

      IQuery.Sql.Add('FROM POSICAO_PRODUTOS');
      IQuery.Sql.Add('INNER JOIN PRODUTOS');
      IQuery.Sql.Add('ON (POSICAO_PRODUTOS.PRODUTO_ID = PRODUTOS.PRODUTO_ID)');
      IQuery.Sql.Add('INNER JOIN TABELAS');
      IQuery.Sql.Add('ON (PRODUTOS.GRUPO_ID = TABELAS.TABELA_ID AND TABELAS.TIPO_TABELA = :TIPO_TABELA)');
      IQuery.Sql.Add('INNER JOIN TRIBUTOS');
      IQuery.Sql.Add('ON (PRODUTOS.TRIBUTO_ID = TRIBUTOS.TRIBUTO_ID)');
      IQuery.Sql.Add('WHERE');
      IQuery.Sql.Add('(PRODUTOS.EMPRESA_ID = :EMPRESA_ID)');
    //  IQuery.Sql.Add('AND (PRODUTOS.STATUS = :STATUS)');
      IQuery.Sql.Add('AND (POSICAO_PRODUTOS.DT_MOVIMENTO = :DT_MOVIMENTO)');

      if Revenda.Checked  then
         IQuery.Sql.Add('AND PRODUTOS.TIPO_ITEM = :TIPO');

      if FrmData.QAcesso.FieldByName('TPCTB').AsString = '2' then
        IQuery.Sql.Add('AND (POSICAO_PRODUTOS.QUANTIDADE_C > 0)')
      else
        IQuery.Sql.Add('AND (POSICAO_PRODUTOS.QUANTIDADE_G > 0)');

      IQuery.ParamByName('DT_MOVIMENTO').AsDateTime := StrToDate(Data.Text);
    end
    else
    begin
      Dt_Inventario := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString;

      QRLabel3.Caption := '*** ESTOQUE EXISTENTE EM ' + FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString + ' ***';

      if FrmData.QAcesso.FieldByName('TPCTB').AsString = '2' then
        IQuery.Sql.Add('SELECT PRODUTOS.PRODUTO_ID, PRODUTOS.DESCRICAO, PRODUTOS.CUSTO_COMPRA, PRODUTOS.VALOR_COMPRA, PRODUTOS.CUSTOMEDIO, PRODUTOS.PRECO_VAREJO, PRODUTOS.PRECO_ATACADO, PRODUTOS.UNIDADE_VENDA, PRODUTOS.QUANTIDADE_C QUANTIDADE, PRODUTOS.COD_BARRA, ' +
                       'PRODUTOS.GRUPO_ID, PRODUTOS.NCM, TABELAS.DESCRICAO GRUPO, TRIBUTOS.DESCRICAO ALIQUOTA')
      else
        IQuery.Sql.Add('SELECT PRODUTOS.PRODUTO_ID, PRODUTOS.DESCRICAO, PRODUTOS.CUSTO_COMPRA, PRODUTOS.VALOR_COMPRA, PRODUTOS.CUSTOMEDIO, PRODUTOS.PRECO_VAREJO, PRODUTOS.PRECO_ATACADO, PRODUTOS.UNIDADE_VENDA, PRODUTOS.QUANTIDADE_G QUANTIDADE, PRODUTOS.COD_BARRA, ' +
                       'PRODUTOS.GRUPO_ID, PRODUTOS.NCM, TABELAS.DESCRICAO GRUPO, TRIBUTOS.DESCRICAO ALIQUOTA');

      IQuery.Sql.Add('FROM PRODUTOS');
      IQuery.Sql.Add('INNER JOIN TABELAS');
      IQuery.Sql.Add('ON (PRODUTOS.GRUPO_ID = TABELAS.TABELA_ID AND TABELAS.TIPO_TABELA = :TIPO_TABELA)');
      IQuery.Sql.Add('INNER JOIN TRIBUTOS');
      IQuery.Sql.Add('ON (PRODUTOS.TRIBUTO_ID = TRIBUTOS.TRIBUTO_ID)');
      IQuery.Sql.Add('WHERE');
      IQuery.Sql.Add('(PRODUTOS.EMPRESA_ID = :EMPRESA_ID)');
      IQuery.Sql.Add('AND (PRODUTOS.STATUS = :STATUS)');

      if Revenda.Checked  then
         IQuery.Sql.Add('AND PRODUTOS.TIPO_ITEM = :TIPO');

      if FrmData.QAcesso.FieldByName('TPCTB').AsString = '2' then
        IQuery.Sql.Add('AND (PRODUTOS.QUANTIDADE_C > 0)')
      else
        IQuery.Sql.Add('AND (PRODUTOS.QUANTIDADE_G > 0)');
    end;

    if StrToInt(LeIni(Arq_Ini, 'Sistema', 'Localização')) > 0 then
    begin
      IQuery.Sql.Add('AND (PRODUTOS.LOCALIZACAO_ID = :LOCALIZACAO_ID)');

      IQuery.ParamByName('LOCALIZACAO_ID').AsInteger := StrToInt(LeIni(Arq_Ini, 'Sistema', 'Localização'));
    end;

    IQuery.ParamByName('TIPO_TABELA').AsString := '7';

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
      IQuery.ParamByName('PRODUTO_FINAL').AsInteger := StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Produto Final'));
    end;

    if Revenda.Checked  then
      IQuery.ParamByName('TIPO').AsString := '00 - MERCADORIA PARA REVENDA';

   // IQuery.ParamByName('STATUS').AsString      := 'A';
    IQuery.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    IQuery.Sql.Add('ORDER BY TRIBUTOS.DESCRICAO, PRODUTOS.GRUPO_ID, PRODUTOS.DESCRICAO');

    IQuery.Prepare;
    IQuery.Open;

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
      Vr_Unitario := IQuery.FieldByName('VALOR_COMPRA').AsFloat;
      Vr_Total    := (IQuery.FieldByName('VALOR_COMPRA').AsFloat * IQuery.FieldByName('QUANTIDADE').AsFloat);

      QRDBText8.DataField := 'VALOR_COMPRA';
      QRExpr1.Expression  := '(IQuery.VALOR_COMPRA * IQuery.QUANTIDADE)';
      QRExpr2.Expression  := 'Sum(IQuery.VALOR_COMPRA * IQuery.QUANTIDADE)';
      QRExpr3.Expression  := 'Sum(IQuery.VALOR_COMPRA * IQuery.QUANTIDADE)';
      QRExpr4.Expression  := 'Sum(IQuery.VALOR_COMPRA * IQuery.QUANTIDADE)';
    end
    else if Preco.Text = 'Custo Compra' then
    begin
      Vr_Unitario := IQuery.FieldByName('CUSTO_COMPRA').AsFloat;
      Vr_Total    := (IQuery.FieldByName('CUSTO_COMPRA').AsFloat * IQuery.FieldByName('QUANTIDADE').AsFloat);

      QRDBText8.DataField := 'CUSTO_COMPRA';
      QRExpr1.Expression  := '(IQuery.CUSTO_COMPRA * IQuery.QUANTIDADE)';
      QRExpr2.Expression  := 'Sum(IQuery.CUSTO_COMPRA * IQuery.QUANTIDADE)';
      QRExpr3.Expression  := 'Sum(IQuery.CUSTO_COMPRA * IQuery.QUANTIDADE)';
      QRExpr4.Expression  := 'Sum(IQuery.CUSTO_COMPRA * IQuery.QUANTIDADE)';
    end
    else if Preco.Text = 'Customédio' then
    begin
      Vr_Unitario := IQuery.FieldByName('CUSTOMEDIO').AsFloat;
      Vr_Total    := (IQuery.FieldByName('CUSTOMEDIO').AsFloat * IQuery.FieldByName('QUANTIDADE').AsFloat);

      QRDBText8.DataField := 'CUSTOMEDIO';
      QRExpr1.Expression  := '(IQuery.CUSTOMEDIO * IQuery.QUANTIDADE)';
      QRExpr2.Expression  := 'Sum(IQuery.CUSTOMEDIO * IQuery.QUANTIDADE)';
      QRExpr3.Expression  := 'Sum(IQuery.CUSTOMEDIO * IQuery.QUANTIDADE)';
      QRExpr4.Expression  := 'Sum(IQuery.CUSTOMEDIO * IQuery.QUANTIDADE)';
    end
    else if Preco.Text = 'Pr. Varejo' then
    begin
      Vr_Unitario := IQuery.FieldByName('PRECO_VAREJO').AsFloat;
      Vr_Total    := (IQuery.FieldByName('PRECO_VAREJO').AsFloat * IQuery.FieldByName('QUANTIDADE').AsFloat);

      QRDBText8.DataField := 'PRECO_VAREJO';
      QRExpr1.Expression  := '(IQuery.PRECO_VAREJO * IQuery.QUANTIDADE)';
      QRExpr2.Expression  := 'Sum(IQuery.PRECO_VAREJO * IQuery.QUANTIDADE)';
      QRExpr3.Expression  := 'Sum(IQuery.PRECO_VAREJO * IQuery.QUANTIDADE)';
      QRExpr4.Expression  := 'Sum(IQuery.PRECO_VAREJO * IQuery.QUANTIDADE)';
    end;

    if IQuery.IsEmpty then
      Application.MessageBox('Não há dados para os parâmetros informados', PChar(Msg_Title), mb_IconInformation)
    else
    begin
      Inventario.PreviewModal;

      if Gera_Arquivo.Checked then
      begin
        try
          AssignFile(F1, ExtractFilePath(ParamStr(0)) + 'Inventario.Txt');
          Rewrite(F1);

          IQuery.First;
          while not IQuery.Eof do
          begin
            if Preco.Text = 'Valor Compra' then
            begin
              Vr_Unitario := IQuery.FieldByName('VALOR_COMPRA').AsFloat;
              Vr_Total    := (IQuery.FieldByName('VALOR_COMPRA').AsFloat * IQuery.FieldByName('QUANTIDADE').AsFloat);
            end
            else if Preco.Text = 'Custo Compra' then
            begin
              Vr_Unitario := IQuery.FieldByName('CUSTO_COMPRA').AsFloat;
              Vr_Total    := (IQuery.FieldByName('CUSTO_COMPRA').AsFloat * IQuery.FieldByName('QUANTIDADE').AsFloat);
            end
            else if Preco.Text = 'Customédio' then
            begin
              Vr_Unitario := IQuery.FieldByName('CUSTOMEDIO').AsFloat;
              Vr_Total    := (IQuery.FieldByName('CUSTOMEDIO').AsFloat * IQuery.FieldByName('QUANTIDADE').AsFloat);
            end
            else if Preco.Text = 'Pr. Varejo' then
            begin
              Vr_Unitario := IQuery.FieldByName('PRECO_VAREJO').AsFloat;
              Vr_Total    := (IQuery.FieldByName('PRECO_VAREJO').AsFloat * IQuery.FieldByName('QUANTIDADE').AsFloat);
            end;

            WriteLn(F1, Copy(Dt_Inventario, 1, 2) + Copy(Dt_Inventario, 4, 2) + Copy(Dt_Inventario, 7, 4) +
                        Copy(Dt_Inventario, 4, 2) + Copy(Dt_Inventario, 9, 2) +
                        Copy(Dt_Inventario, 4, 2) + Copy(Dt_Inventario, 9, 2) +
                        ForcaComprimento(IQuery.FieldByName('PRODUTO_ID').AsString, 20, ' ') +
                        '1' +
                        '00000000000000' +
                        '                    ' +
                        '  ' +
                        StrZero(IQuery.FieldByName('QUANTIDADE').AsString, 21, 6) +
                        StrZero(FloatToStr(Vr_Unitario), 17, 4) +
                        StrZero(FloatToStr(Vr_Total), 17, 2) +
                        StrZero('0', 17, 2) +
                        ForcaComprimento('', 60, ' ') +
                        ForcaComprimento(IQuery.FieldByName('DESCRICAO').AsString, 80, ' ') +
                        StrZero(IQuery.FieldByName('GRUPO_ID').AsString, 4, 0) +
                        StrZero(IQuery.FieldByName('NCM').AsString, 10, 0) +
                        ForcaComprimento(IQuery.FieldByName('DESCRICAO').AsString, 30, ' ') +
                        ForcaComprimento(IQuery.FieldByName('UNIDADE_VENDA').AsString, 3, ' ') +
                        ForcaComprimento(IQuery.FieldByName('GRUPO').AsString, 30, ' '));

            Application.ProcessMessages;
            IQuery.Next;
          end;
        finally
          CloseFile(F1);
        end;
      end;

      Application.MessageBox(PChar('O arquivo ' + ExtractFilePath(ParamStr(0)) + 'Inventário.Txt foi criado com sucesso'), PChar(Msg_Title), mb_IconInformation);

      WinExec(PAnsiChar('NOTEPAD.EXE' + ' ' + ExtractFilePath(ParamStr(0)) + 'Inventario.Txt'), SW_SHOW);
    end;
  end
  else
    Application.MessageBox('Necessário informar uma data', PChar(Msg_Title), mb_IconInformation)
end;

procedure TFrmListagem_Inventario.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmListagem_Inventario.DataKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmListagem_Inventario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmListagem_Inventario.FormShow(Sender: TObject);
begin
  IQuery.Sql.Clear;
  IQuery.Sql.Add('SELECT DISTINCT DT_MOVIMENTO');
  IQuery.Sql.Add('FROM POSICAO_PRODUTOS');
  IQuery.Sql.Add('ORDER BY DT_MOVIMENTO');
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

procedure TFrmListagem_Inventario.Gera_ArquivoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

end.
