unit UIntegracao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, IBCustomDataSet, IBQuery, IBStoredProc,
  IBDatabase, Buttons;

type
  TFrmIntegracao = class(TForm)
    Bevel1: TBevel;
    QUpdate: TIBQuery;
    QSearch: TIBQuery;
    Label1: TLabel;
    ID_Transacao: TIBStoredProc;
    IBStoredProc1: TIBStoredProc;
    Cadastro_Produtos: TCheckBox;
    Preco_Venda: TCheckBox;
    Preco_Custo: TCheckBox;
    Posicao_Estoque: TCheckBox;
    DB_Pharmacy: TIBDatabase;
    Trans_Pharmacy: TIBTransaction;
    QPharmacy: TIBQuery;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRetornaClick(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmIntegracao: TFrmIntegracao;
  Importando: Boolean;

implementation

uses
  UData, UPrincipal;

{$R *.dfm}

procedure TFrmIntegracao.btnExecutaClick(Sender: TObject);
var
F2: TextFile;
Lin: Integer;
S, Diretorio, Num_Loja: String;
begin
  btnExecuta.Enabled := False;
  btnRetorna.Enabled := False;

  Importando := True;

  Diretorio := LeIni(Arq_Ini, 'Integração', 'Path Importação');
  Num_Loja  := LeIni(Arq_Ini, 'Integração', 'Loja');

  try
    if Cadastro_Produtos.Checked then
    begin
      QPharmacy.Sql.Clear;
      QPharmacy.Sql.Add('SELECT * FROM PRODUTO');
      QPharmacy.Sql.Add('ORDER BY PRODUTO_ID');

      QPharmacy.Prepare;
      QPharmacy.Open;

      QPharmacy.First;
      while not QPharmacy.Eof do
      begin
        QSearch.Sql.Clear;
        QSearch.Sql.Add('SELECT * FROM PRODUTOS');
        QSearch.Sql.Add('WHERE');
        QSearch.Sql.Add('(PRODUTO_ID = :PRODUTO_ID)');
        QSearch.Sql.Add('AND (EMPRESA_ID = :EMPRESA_ID)');

        if StrToInt(LeIni(Arq_Ini, 'Sistema', 'Localização')) > 0 then
        begin
          QSearch.Sql.Add('AND (LOCALIZACAO_ID = :LOCALIZACAO_ID)');

          QSearch.ParamByName('LOCALIZACAO_ID').AsInteger := StrToInt(LeIni(Arq_Ini, 'Sistema', 'Localização'));
        end;

        QSearch.ParamByName('PRODUTO_ID').AsInteger := QPharmacy.FieldByName('PRODUTO_ID').AsInteger;
        QSearch.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;

        QSearch.Prepare;
        QSearch.Open;

        if QSearch.IsEmpty then
        begin
          QUpdate.Sql.Clear;
          QUpdate.Sql.Add('INSERT INTO PRODUTOS(' +
                          'COD_ORIGINAL,    DESCRICAO,      COD_BARRA, ' +
                          'REFERENCIA,      EMBALAGEM,      UNIDADE_VENDA, ' +
                          'IPI,             FORNECEDOR_ID,  EMPRESA_ID, ' +
                          'TRIBUTO_ID,      GRUPO_ID,       SUBTIPO_ID, ' +
                          'LOCALIZACAO_ID,  SUPERVISOR,     PROVQT, ' +
                          'PRODUTO_ID,      CUSTOMEDIO,     PRECO_VAREJO) VALUES(' +
                          ':COD_ORIGINAL,   :DESCRICAO,     :COD_BARRA, ' +
                          ':REFERENCIA,     :EMBALAGEM,     :UNIDADE_VENDA, ' +
                          ':IPI,            :FORNECEDOR_ID, :EMPRESA_ID, ' +
                          ':TRIBUTO_ID,     :GRUPO_ID,      :SUBTIPO_ID, ' +
                          ':LOCALIZACAO_ID, :SUPERVISOR,    :PROVQT, ' +
                          ':PRODUTO_ID,     :CUSTOMEDIO,    :PRECO_VAREJO)');

          QUpdate.ParamByName('COD_ORIGINAL').AsString   := QPharmacy.FieldByName('INTEGRACAO').AsString;
          QUpdate.ParamByName('DESCRICAO').AsString      := QPharmacy.FieldByName('DESCRICAO').AsString;
          QUpdate.ParamByName('COD_BARRA').AsString      := QPharmacy.FieldByName('CODBARRAS').AsString;
          QUpdate.ParamByName('REFERENCIA').AsString     := QPharmacy.FieldByName('REFERENCIA').AsString;
          QUpdate.ParamByName('UNIDADE_VENDA').AsString  := QPharmacy.FieldByName('EMB_FABRICA').AsString;
          QUpdate.ParamByName('EMBALAGEM').AsString      := QPharmacy.FieldByName('FRACAO_VENDA').AsString;
          QUpdate.ParamByName('IPI').AsString            := QPharmacy.FieldByName('ALIQUOTA_IPI').AsString;
          QUpdate.ParamByName('FORNECEDOR_ID').AsString  := '0';
          QUpdate.ParamByName('EMPRESA_ID').AsString     := '1';
          QUpdate.ParamByName('TRIBUTO_ID').AsString     := '7';
          QUpdate.ParamByName('GRUPO_ID').AsString       := '1';
          QUpdate.ParamByName('SUBTIPO_ID').AsString     := '1';
          QUpdate.ParamByName('LOCALIZACAO_ID').AsString := '1';
          QUpdate.ParamByName('SUPERVISOR').AsString     := 'NÃO';
          QUpdate.ParamByName('PROVQT').AsString         := 'NÃO';
          QUpdate.ParamByName('PRODUTO_ID').AsString     := QPharmacy.FieldByName('PRODUTO_ID').AsString;
          QUpdate.ParamByName('CUSTOMEDIO').AsString     := QPharmacy.FieldByName('CUSTO_LISTA').AsString;
          QUpdate.ParamByName('PRECO_VAREJO').AsString   := QPharmacy.FieldByName('CUSTO_LISTA').AsString;

          QUpdate.Prepare;
          QUpdate.ExecSql;


        end
        else
        begin
          QUpdate.Sql.Clear;
          QUpdate.Sql.Add('UPDATE PRODUTOS SET ' +
                          'DESCRICAO     = :DESCRICAO,     COD_BARRA = :COD_BARRA, ' +
                          'REFERENCIA    = :REFERENCIA,    EMBALAGEM = :EMBALAGEM, ' +
                          'UNIDADE_VENDA = :UNIDADE_VENDA, IPI       = :IPI ' +
                          'WHERE ' +
                          '(PRODUTO_ID = :PRODUTO_ID) AND (EMPRESA_ID = :EMPRESA_ID)');

          QUpdate.ParamByName('DESCRICAO').AsString     := QPharmacy.FieldByName('DESCRICAO').AsString;
          QUpdate.ParamByName('COD_BARRA').AsString     := QPharmacy.FieldByName('CODBARRAS').AsString;
          QUpdate.ParamByName('REFERENCIA').AsString    := QPharmacy.FieldByName('REFERENCIA').AsString;
          QUpdate.ParamByName('UNIDADE_VENDA').AsString := QPharmacy.FieldByName('EMB_FABRICA').AsString;
          QUpdate.ParamByName('EMBALAGEM').AsString     := QPharmacy.FieldByName('FRACAO_VENDA').AsString;
          QUpdate.ParamByName('IPI').AsString           := QPharmacy.FieldByName('ALIQUOTA_IPI').AsString;
          QUpdate.ParamByName('PRODUTO_ID').AsInteger   := QPharmacy.FieldByName('PRODUTO_ID').AsInteger;
          QUpdate.ParamByName('EMPRESA_ID').AsInteger   := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;

          QUpdate.Prepare;
          QUpdate.ExecSql;


        end;

        Label1.Caption := QPharmacy.FieldByName('PRODUTO_ID').AsString;

        Application.ProcessMessages;
        QPharmacy.Next;
      end;
    end;

    if Preco_Custo.Checked then
    begin
      QSearch.Sql.Clear;
      QSearch.Sql.Add('SELECT * FROM PRODUTOS');
      QSearch.Sql.Add('WHERE');
      QSearch.Sql.Add('(EMPRESA_ID = :EMPRESA_ID)');

      if StrToInt(LeIni(Arq_Ini, 'Sistema', 'Localização')) > 0 then
      begin
        QSearch.Sql.Add('AND (LOCALIZACAO_ID = :LOCALIZACAO_ID)');

        QSearch.ParamByName('LOCALIZACAO_ID').AsInteger := StrToInt(LeIni(Arq_Ini, 'Sistema', 'Localização'));
      end;

      QSearch.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;

      QSearch.Prepare;
      QSearch.Open;

      QSearch.First;
      while not QSearch.Eof do
      begin
        QPharmacy.Sql.Clear;
        QPharmacy.Sql.Add('SELECT * FROM ALOCACAO');
        QPharmacy.Sql.Add('WHERE');
        QPharmacy.Sql.Add('(PRODUTO_ID = :PRODUTO_ID)');
        QPharmacy.Sql.Add('AND (PARCEIRO_ID = :PARCEIRO_ID)');

        QPharmacy.ParamByName('PRODUTO_ID').AsInteger  := QSearch.FieldByName('PRODUTO_ID').AsInteger;
        QPharmacy.ParamByName('PARCEIRO_ID').AsInteger := StrToInt(Num_Loja);

        QPharmacy.Prepare;
        QPharmacy.Open;

        if not QPharmacy.IsEmpty then
        begin
          QUpdate.Sql.Clear;
          QUpdate.Sql.Add('UPDATE PRODUTOS SET ' +
                          'TRIBUTO_ID = :TRIBUTO_ID, CUSTOMEDIO = :CUSTOMEDIO, PRECO_VAREJO = :PRECO_VAREJO ' +
                          'WHERE ' +
                          '(PRODUTO_ID = :PRODUTO_ID) AND (EMPRESA_ID = :EMPRESA_ID)');

          QUpdate.ParamByName('TRIBUTO_ID').AsInteger := QPharmacy.FieldByName('CATEGORIA_ID').AsInteger;
          QUpdate.ParamByName('CUSTOMEDIO').AsFloat   := QPharmacy.FieldByName('PRECO_CUSTO').AsFloat;
          QUpdate.ParamByName('PRECO_VAREJO').AsFloat := QPharmacy.FieldByName('PRECO_VENDA_FIL').AsFloat;
          QUpdate.ParamByName('PRODUTO_ID').AsInteger := QSearch.FieldByName('PRODUTO_ID').AsInteger;
          QUpdate.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;

          QUpdate.Prepare;
          QUpdate.ExecSql;


        end;

        Label1.Caption := QSearch.FieldByName('PRODUTO_ID').AsString;

        Application.ProcessMessages;
        QSearch.Next;
      end;
    end;

{
    if (FileExists(Diretorio + 'PROD_EXP.PS1')) and (Cadastro_Produtos.Checked) then  // Produtos
    begin
      AssignFile(F2, Diretorio + 'PROD_EXP.PS1');
      Reset(F2);
      try
        Lin := 0;

        while not Eof(F2) do
        begin
          ReadLn(F2, S);

          if (Lin > 0) and (Copy(S, 155, 1) = 'A') then
          begin
            QSearch.Sql.Clear;
            QSearch.Sql.Add('SELECT * FROM PRODUTOS');
            QSearch.Sql.Add('WHERE');
            QSearch.Sql.Add('(COD_ORIGINAL = :INTEGRACAO)');
            QSearch.Sql.Add('AND (EMPRESA_ID = :EMPRESA_ID)');

            if StrToInt(LeIni(Arq_Ini, 'Sistema', 'Localização')) > 0 then
            begin
              Qsearch.Sql.Add('AND (LOCALIZACAO_ID = :LOCALIZACAO_ID)');

              QSearch.ParamByName('LOCALIZACAO_ID').AsInteger := StrToInt(LeIni(Arq_Ini, 'Sistema', 'Localização'));
            end;

            QSearch.ParamByName('INTEGRACAO').AsString  := Alltrim(Copy(S, 25, 6));
            QSearch.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;

            QSearch.Prepare;
            QSearch.Open;

            if QSearch.IsEmpty then
            begin
              QUpdate.Sql.Clear;
              QUpdate.Sql.Add('INSERT INTO PRODUTOS(' +
                              'COD_ORIGINAL,   DESCRICAO,     COD_BARRA, ' +
                              'REFERENCIA,     EMBALAGEM,     UNIDADE_VENDA, ' +
                              'IPI,            FORNECEDOR_ID, EMPRESA_ID, ' +
                              'TRIBUTO_ID,     GRUPO_ID,      SUBTIPO_ID, ' +
                              'LOCALIZACAO_ID, SUPERVISOR,    PROVQT) VALUES(' +
                              ':COD_ORIGINAL, :DESCRICAO,     :COD_BARRA, ' +
                              ':REFERENCIA,   :EMBALAGEM,     :UNIDADE_VENDA, ' +
                              ':IPI,          :FORNECEDOR_ID, :EMPRESA_ID, ' +
                              ':TRIBUTO_ID,   :GRUPO_ID,      :SUBTIPO_ID, ' +
                              ':LOCALIZACAO_ID, :SUPERVISOR,  :PROVQT)');

              QUpdate.ParamByName('COD_ORIGINAL').AsString   := AllTrim(Copy(S, 25, 6));
              QUpdate.ParamByName('DESCRICAO').AsString      := AllTrim(Copy(S, 1, 24));
              QUpdate.ParamByName('COD_BARRA').AsString      := AllTrim(Copy(S, 31, 13));
              QUpdate.ParamByName('REFERENCIA').AsString     := AllTrim(Copy(S, 55, 8));
              QUpdate.ParamByName('EMBALAGEM').AsString      := Copy(S, 65, 4);
              QUpdate.ParamByName('UNIDADE_VENDA').AsString  := Copy(S, 63, 2);
              QUpdate.ParamByName('IPI').AsString            := Copy(S, 69, 3) + '.' + Copy(S, 73, 2);
              QUpdate.ParamByName('FORNECEDOR_ID').AsString  := Copy(S, 99, 6);
              QUpdate.ParamByName('EMPRESA_ID').AsString     := '1';
              QUpdate.ParamByName('TRIBUTO_ID').AsString     := '7';
              QUpdate.ParamByName('GRUPO_ID').AsString       := '1';
              QUpdate.ParamByName('SUBTIPO_ID').AsString     := '1';
              QUpdate.ParamByName('LOCALIZACAO_ID').AsString := '1';
              QUpdate.ParamByName('SUPERVISOR').AsString     := 'NÃO';
              QUpdate.ParamByName('PROVQT').AsString         := 'NÃO';

              QUpdate.Prepare;
              QUpdate.ExecSql;


            end
            else
            begin
              QUpdate.Sql.Clear;
              QUpdate.Sql.Add('UPDATE PRODUTOS SET ' +
                              'DESCRICAO     = :DESCRICAO,     COD_BARRA = :COD_BARRA, ' +
                              'REFERENCIA    = :REFERENCIA,    EMBALAGEM = :EMBALAGEM, ' +
                              'UNIDADE_VENDA = :UNIDADE_VENDA, IPI       = :IPI ' +
                              'WHERE ' +
                              '(COD_ORIGINAL = :COD_ORIGINAL) AND (EMPRESA_ID = :EMPRESA_ID)');

              QUpdate.ParamByName('DESCRICAO').AsString     := AllTrim(Copy(S, 1, 24));
              QUpdate.ParamByName('COD_BARRA').AsString     := AllTrim(Copy(S, 31, 13));
              QUpdate.ParamByName('REFERENCIA').AsString    := AllTrim(Copy(S, 55, 8));
              QUpdate.ParamByName('EMBALAGEM').AsString     := Copy(S, 65, 4);
              QUpdate.ParamByName('UNIDADE_VENDA').AsString := Copy(S, 63, 2);
              QUpdate.ParamByName('IPI').AsString           := Copy(S, 69, 3) + '.' + Copy(S, 73, 2);
              QUpdate.ParamByName('COD_ORIGINAL').AsString  := AllTrim(Copy(S, 25, 6));
              QUpdate.ParamByName('EMPRESA_ID').AsInteger   := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;

              QUpdate.Prepare;
              QUpdate.ExecSql;


            end;
          end;

          Application.ProcessMessages;
          Label1.Caption := AllTrim(Copy(S, 1, 24));
          Inc(Lin);
        end;
      finally
        CloseFile(F2);
      end;
    end;

    if (FileExists(Diretorio + 'PRCV_EXP.' + Num_Loja)) and (Preco_Venda.Checked) then  // Preço de Venda/Promoção
    begin
      AssignFile(F2, Diretorio + 'PRCV_EXP.' + Num_Loja);
      Reset(F2);
      try
        Lin := 0;

        while not Eof(F2) do
        begin
          ReadLn(F2, S);

          if Lin > 0 then
          begin
            QUpdate.Sql.Clear;
            QUpdate.Sql.Add('UPDATE PRODUTOS SET ' +
                            'PRECO_VAREJO   = :PRECO_VAREJO,   DT_PRECO      = :DT_PRECO, ' +
                            'PRECO_PROMOCAO = :PRECO_PROMOCAO, PROMO_INICIAL = :PROMO_INICIAL ' +
                            'WHERE ' +
                            '(COD_ORIGINAL = :COD_ORIGINAL)');

            QUpdate.ParamByName('PRECO_VAREJO').AsString := Copy(S, 37, 7) + '.' + Copy(S, 45, 2);

            if Copy(S, 47, 8) = '00/00/00' then
              QUpdate.ParamByName('DT_PRECO').AsDateTime := Null
            else
              QUpdate.ParamByName('DT_PRECO').AsDateTime := StrToDate(Copy(S, 47, 8));

            QUpdate.ParamByName('PRECO_PROMOCAO').AsString := Copy(S, 55, 7) + '.' + Copy(S, 63, 2);

            if Copy(S, 65, 8) = '00/00/00' then
              QUpdate.ParamByName('PROMO_INICIAL').AsDateTime := Null
            else
              QUpdate.ParamByName('PROMO_INICIAL').AsDateTime := StrToDate(Copy(S, 65, 8));

            QUpdate.ParamByName('COD_ORIGINAL').AsString := Alltrim(Copy(S, 25, 6));

            QUpdate.Prepare;
            QUpdate.ExecSql;


          end;

          Label1.Caption := Alltrim(Copy(S, 1, 24));
          Application.ProcessMessages;
          Inc(Lin);
        end;
      finally
        CloseFile(F2);
      end;
    end;
}
{
    if (FileExists(Diretorio + 'CUST_EXP.PS1')) and (Preco_Custo.Checked) then  // Preço de Custo
    begin
      AssignFile(F2, Diretorio + 'CUST_EXP.PS1');
      Reset(F2);
      try
        Lin := 0;
        while not Eof(F2) do
        begin
          ReadLn(F2, S);

          if Lin > 0 then
          begin
            QUpdate.Sql.Clear;
            QUpdate.Sql.Add('UPDATE PRODUTOS SET CUSTOMEDIO = :CUSTOMEDIO');
            QUpdate.Sql.Add('WHERE');
            QUpdate.Sql.Add('(COD_ORIGINAL = :COD_ORIGINAL)');

            QUpdate.ParamByName('CUSTOMEDIO').AsString   := Copy(S, 7, 7) + '.' + Copy(S, 15, 2);
            QUpdate.ParamByName('COD_ORIGINAL').AsString := Alltrim(Copy(S, 1, 6));

            QUpdate.Prepare;
            QUpdate.ExecSql;


          end;

          Label1.Caption := Alltrim(Copy(S, 1, 6));
          Application.ProcessMessages;
          Inc(Lin);
        end;
      finally
        CloseFile(F2);
      end;
    end;

    if (FileExists(Diretorio + 'ESTOQUE.HJ')) and (Posicao_Estoque.Checked) then
    begin
      ID_Transacao.Prepare;
      ID_Transacao.ExecProc;
      Id_Trans := ID_Transacao.Params[0].Value;


      Vl_Trans := 0;

      QUpdate.Sql.Clear;
      QUpdate.Sql.Add('INSERT INTO TRANSACOES( ' +
                      'TRANSACAO_ID, DT_TRANS,   DT_MOVIMENTO, CONDUTA, ' +
                      'DEPTO,        EMPRESA_ID, CONTA_ID,     C_CUSTO_ID, ' +
                      'VALOR,        TPCTB,      AUTORIZ_ID,   HISTORICO, ' +
                      'CONTAAUX_ID) VALUES(' +
                      ':TRANSACAO_ID, :DT_TRANS,   :DT_MOVIMENTO, :CONDUTA, :DEPTO,      :EMPRESA_ID, ' +
                      ':CONTA_ID,     :C_CUSTO_ID, :VALOR,        :TPCTB,   :AUTORIZ_ID, :HISTORICO, ' +
                      ':CONTAAUX_ID)');

      QUpdate.ParamByName('TRANSACAO_ID').AsInteger  := Id_Trans;
      QUpdate.ParamByName('DT_TRANS').AsDateTime     := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
      QUpdate.ParamByName('DT_MOVIMENTO').AsDateTime := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
      QUpdate.ParamByName('CONDUTA').AsString        := '18';
      QUpdate.ParamByName('DEPTO').AsString          := '07';
      QUpdate.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
      QUpdate.ParamByName('CONTA_ID').AsInteger      := FrmPrincipal.Config.FieldByName('CONTA_ESTOQUE').AsInteger;
      QUpdate.ParamByName('C_CUSTO_ID').AsInteger    := 1;
      QUpdate.ParamByName('VALOR').AsFloat           := 0;
      QUpdate.ParamByName('TPCTB').AsString          := FrmData.QAcesso.FieldByName('TPCTB').AsString;
      QUpdate.ParamByName('AUTORIZ_ID').AsInteger    := FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger;
      QUpdate.ParamByName('HISTORICO').AsString      := 'ESTOQUE INICIAL';
      QUpdate.ParamByName('CONTAAUX_ID').AsInteger   := 0;

      QUpdate.Prepare;
      QUpdate.ExecSql;



      AssignFile(F2, Diretorio + 'ESTOQUE.HJ');
      Reset(F2);
      try
        Lin := 0;
        while not Eof(F2) do
        begin
          ReadLn(F2, S);
          if (Lin > 0) and (StrToInt(Copy(S, 82, 2) + Copy(S, 85, 3)) > 0) then
          begin

            Integr := StrToInt(Copy(S, 1, 2) + Copy(S, 4, 3));

            QSearch.Sql.Clear;
            QSearch.Sql.Add('SELECT * FROM PRODUTOS');
            QSearch.Sql.Add('WHERE');
            QSearch.Sql.Add('(COD_ORIGINAL = :INTEGRACAO)');

            if StrToInt(LeIni(Arq_Ini, 'Sistema', 'Localização')) > 0 then
            begin
              QSeach.Sql.Add('AND (LOCALIZACAO_ID = :LOCALIZACAO_ID)');

              QSearch.ParamByName('LOCALIZACAO_ID').AsInteger := StrToInt(LeIni(Arq_Ini, 'Sistema', 'Localização'));
            end;

            QSearch.ParamByName('INTEGRACAO').AsString := IntToStr(Integr);

            QSearch.Prepare;
            QSearch.Open;

            QUpdate.Sql.Clear;
            QUpdate.Sql.Add('INSERT INTO TRANSITENS( ' +
                            'TRANSACAO_ID, PRODUTO_ID, TP_PROD_SERV, DESCRICAO, ' +
                            'TRIBUTO_ID,   QUANTIDADE, VR_UNITARIO,  VR_TOTAL) VALUES(' +
                            ':TRANSACAO_ID, :PRODUTO_ID, :TP_PROD_SERV, :DESCRICAO, ' +
                            ':TRIBUTO_ID,   :QUANTIDADE, :VR_UNITARIO,  :VR_TOTAL)');

            QUpdate.ParamByName('TRANSACAO_ID').AsInteger := Id_Trans;
            QUpdate.ParamByName('PRODUTO_ID').AsInteger   := QSearch.FieldByName('PRODUTO_ID').AsInteger;
            QUpdate.ParamByName('TP_PROD_SERV').AsString  := 'P';
            QUpdate.ParamByName('DESCRICAO').AsString     := QSearch.FieldByName('DESCRICAO').AsString;
            QUpdate.ParamByName('TRIBUTO_ID').AsInteger   := QSearch.FieldByName('TRIBUTO_ID').AsInteger;
            QUpdate.ParamByName('QUANTIDADE').AsInteger   := StrToInt(Copy(S, 82, 2) + Copy(S, 85, 3));
            QUpdate.ParamByName('VR_UNITARIO').AsFloat    := QSearch.FieldByName('CUSTOMEDIO').AsFloat;
            QUpdate.ParamByName('VR_TOTAL').AsFloat       := (StrToInt(Copy(S, 82, 2) + Copy(S, 85, 3)) * QSearch.FieldByName('CUSTOMEDIO').AsFloat);

            QUpdate.Prepare;
            QUpdate.ExecSql;



            Vl_Trans := Vl_Trans + (StrToInt(Copy(S, 82, 2) + Copy(S, 85, 3)) * QSearch.FieldByName('CUSTOMEDIO').AsFloat);

          end;
          Label1.Caption := Copy(S, 1, 2) + Copy(S, 4, 3);
          Application.ProcessMessages;
          Inc(Lin);
        end;

        QUpdate.Sql.Clear;
        QUpdate.Sql.Add('UPDATE TRANSACOES SET VALOR = :VALOR');
        QUpdate.Sql.Add('WHERE');
        QUpdate.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

        QUpdate.ParamByName('VALOR').AsFloat := Vl_Trans;
        QUpdate.ParamByName('TRANSACAO_ID').AsInteger := Id_Trans;

        QUpdate.Prepare;
        QUpdate.ExecSql;



      finally
        CloseFile(F2);
      end;
    end;
}
  finally
    Label1.Caption := '';
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
    Importando := False;
  end;
end;

procedure TFrmIntegracao.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmIntegracao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if not Importando then
    Action := caFree;
end;

procedure TFrmIntegracao.FormCreate(Sender: TObject);
begin
  Importando := False;
end;

end.
