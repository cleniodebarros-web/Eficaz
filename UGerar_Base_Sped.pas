unit UGerar_Base_Sped;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, Mask, rxToolEdit, StdCtrls, ExtCtrls,
  Buttons, Math;

type
  TFrmGerar_Base_Sped = class(TForm)
    Label2: TLabel;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    Bevel1: TBevel;
    Num_Recibo_Ant: TEdit;
    Label6: TLabel;
    Situacao_Especial: TComboBox;
    Label4: TLabel;
    Tipo_Escrituracao: TComboBox;
    Label5: TLabel;
    Versao: TComboBox;
    Label10: TLabel;
    Dtmai: TDateEdit;
    Dtmen: TDateEdit;
    QSped: TIBQuery;
    QRel: TIBQuery;
    QSub_Detalhe: TIBQuery;
    QDetalhe: TIBQuery;
    Panel1: TPanel;
    Label1: TLabel;
    QRel_Sped: TIBQuery;
    QProduto: TIBQuery;
    procedure FormCreate(Sender: TObject);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure VersaoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DtmenEnter(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmGerar_Base_Sped: TFrmGerar_Base_Sped;

implementation

uses
  UData, UPrincipal;
  
{$R *.dfm}

procedure TFrmGerar_Base_Sped.btnExecutaClick(Sender: TObject);
var
Id, Id_Pai, Id_Detalhe, Id_Sub_Detalhe, Num_Item: Integer;
Doc_Cancelado: Boolean;
Chave_NFe, Ind_Oper, Ind_Emit, Cod_Part, Cod_Sit: String;
begin
  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;
    Panel1.Visible     := True;

    QSped.Sql.Clear;
    QSped.Sql.Add('SELECT * FROM REG_0000');
    QSped.Sql.Add('WHERE');
    QSped.Sql.Add('(DT_INI = :DT_INI)');
    QSped.Sql.Add('AND (DT_FIN = :DT_FIN)');
    QSped.Sql.Add('AND (CNPJ = :CNPJ)');

    QSped.ParamByName('DT_INI').AsDateTime := Dtmen.Date;
    QSped.ParamByName('DT_FIN').AsDateTime := Dtmai.Date;
    QSped.ParamByName('CNPJ').AsString     := SemMascara(FrmPrincipal.QEmpresa.FieldByName('CNPJ').AsString);

    QSped.Prepare;
    QSped.Open;

    if not QSped.IsEmpty then
    begin
      if Application.MessageBox('Existe uma escrituração para esse período. Deseja excluir?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = IDYES then
      begin
        QSped.Sql.Clear;
        QSped.Sql.Add('DELETE FROM REG_0000');
        QSped.Sql.Add('WHERE');
        QSped.Sql.Add('(DT_INI = :DT_INI)');
        QSped.Sql.Add('AND (DT_FIN = :DT_FIN)');
        QSped.Sql.Add('AND (CNPJ = :CNPJ)');

        QSped.ParamByName('DT_INI').AsDateTime := Dtmen.Date;
        QSped.ParamByName('DT_FIN').AsDateTime := Dtmai.Date;
        QSped.ParamByName('CNPJ').AsString     := SemMascara(FrmPrincipal.QEmpresa.FieldByName('CNPJ').AsString);

        QSped.Prepare;
        QSped.ExecSql;


      end
      else
        exit;
    end;

    QDetalhe.Sql.Clear;
    QDetalhe.Sql.Add('SELECT DISTINCT REGISTRO_60D.COD_PRODUTO, PRODUTOS.DESCRICAO');
    QDetalhe.Sql.Add('FROM REGISTRO_60D');
    QDetalhe.Sql.Add('LEFT JOIN PRODUTOS');
    QDetalhe.Sql.Add('ON (REGISTRO_60D.COD_PRODUTO = PRODUTOS.COD_BARRA)');
    QDetalhe.Sql.Add('ORDER BY PRODUTOS.DESCRICAO');

    QDetalhe.Prepare;
    QDetalhe.Open;

    QDetalhe.First;
    while not QDetalhe.Eof do
    begin
      if QDetalhe.FieldByName('DESCRICAO').AsString = '' then
      begin
        QRel.Sql.Clear;
        QRel.Sql.Add('INSERT INTO PRODUTOS(EMPRESA_ID,    TIPO,       DESCRICAO,        FANTASIA,        UNIDADE, ' +
                                          'COD_BARRA,     GRUPO_ID,   SUBTIPO_ID,       LOCALIZACAO_ID,  TRIBUTO_ID, ' +
                                          'STATUS,        CST_PIS,    PIS,              CST_COFINS,      COFINS, ' +
                                          'CST_PIS_ENTR,  PIS_ENTR,   CST_COFINS_ENTR,  COFINS_ENTR,     UNIDADE_VENDA) VALUES(' +
                                          ':EMPRESA_ID,   :TIPO,      :DESCRICAO,       :FANTASIA,       :UNIDADE, ' +
                                          ':COD_BARRA,    :GRUPO_ID,  :SUBTIPO_ID,      :LOCALIZACAO_ID, :TRIBUTO_ID, ' +
                                          ':STATUS,       :CST_PIS,   :PIS,             :CST_COFINS,     :COFINS, ' +
                                          ':CST_PIS_ENTR, :PIS_ENTR,  :CST_COFINS_ENTR, :COFINS_ENTR,    :UNIDADE_VENDA)');

        QRel.ParamByName('EMPRESA_ID').AsInteger     := 1;
        QRel.ParamByName('TIPO').AsString            := 'MERCADORIA';
        QRel.ParamByName('DESCRICAO').AsString       := 'RECUPERADO SPED PIS COFINS';
        QRel.ParamByName('FANTASIA').AsString        := 'RECUPERADO SPED PIS COFINS';
        QRel.ParamByName('UNIDADE').AsString         := 'UN';
        QRel.ParamByName('COD_BARRA').AsString       := QDetalhe.FieldByName('COD_PRODUTO').AsString;
        QRel.ParamByName('GRUPO_ID').AsInteger       := 1;
        QRel.ParamByName('SUBTIPO_ID').AsInteger     := 1;
        QRel.ParamByName('LOCALIZACAO_ID').AsInteger := 1;
        QRel.ParamByName('TRIBUTO_ID').AsInteger     := 6;
        QRel.ParamByName('STATUS').AsString          := 'D';
        QRel.ParamByName('CST_PIS').AsString         := '01';
        QRel.ParamByName('PIS').AsFloat              := 1.65;
        QRel.ParamByName('CST_COFINS').AsString      := '01';
        QRel.ParamByName('COFINS').AsFloat           := 7.6;
        QRel.ParamByName('CST_PIS_ENTR').AsString    := '50';
        QRel.ParamByName('PIS_ENTR').AsFloat         := 1.65;
        QRel.ParamByName('CST_COFINS_ENTR').AsString := '50';
        QRel.ParamByName('COFINS_ENTR').AsFloat      := 7.6;
        QRel.ParamByName('UNIDADE_VENDA').AsString   := 'UN';

        QRel.Prepare;
        QRel.ExecSql;


      end;

      Label1.Caption := QDetalhe.FieldByName('COD_PRODUTO').AsString;

      Application.ProcessMessages;
      QDetalhe.Next;
    end;

    Label1.Caption := 'Aguarde...';

    QRel.Sql.Clear;
    QRel.Sql.Add('UPDATE PRODUTOS SET SPED = 0');

    QRel.Prepare;
    QRel.ExecSql;



    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT DISTINCT PRODUTOS.*');
    QRel.Sql.Add('FROM PRODUTOS');
    QRel.Sql.Add('INNER JOIN TRANSITENS');
    QRel.Sql.Add('ON (PRODUTOS.PRODUTO_ID = TRANSITENS.PRODUTO_ID)');
    QRel.Sql.Add('INNER JOIN TRANSACOES');
    QRel.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
    QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
    QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
    QRel.Sql.Add('AND ((TRANSACOES.MODELO = :MODELO1) OR (TRANSACOES.MODELO = :MODELO2) OR (TRANSACOES.MODELO = :MODELO3) OR (TRANSACOES.MODELO = :MODELO4))');
    QRel.Sql.Add('ORDER BY PRODUTOS.DESCRICAO');

    QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
    QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    QRel.ParamByName('MODELO1').AsString      := '01';
    QRel.ParamByName('MODELO2').AsString      := '1B';
    QRel.ParamByName('MODELO3').AsString      := '04';
    QRel.ParamByName('MODELO4').AsString      := '55';

    QRel.Prepare;
    QRel.Open;

    QRel.First;
    while not QRel.Eof do
    begin
      QDetalhe.Sql.Clear;
      QDetalhe.Sql.Add('UPDATE PRODUTOS SET SPED = 1');
      QDetalhe.Sql.Add('WHERE');
      QDetalhe.Sql.Add('(PRODUTO_ID = :PRODUTO_ID)');

      QDetalhe.ParamByName('PRODUTO_ID').AsInteger := QRel.FieldByName('PRODUTO_ID').AsInteger;

      QDetalhe.Prepare;
      QDetalhe.ExecSql;



      Label1.Caption := QRel.FieldByName('DESCRICAO').AsString;

      Application.ProcessMessages;
      QRel.Next;
    end;

    Label1.Caption := 'Aguarde...';

    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT DISTINCT PRODUTOS.*');
    QRel.Sql.Add('FROM PRODUTOS');
    QRel.Sql.Add('INNER JOIN REGISTRO_60D');
    QRel.Sql.Add('ON (PRODUTOS.COD_BARRA = REGISTRO_60D.COD_PRODUTO)');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(PRODUTOS.EMPRESA_ID = :EMPRESA_ID)');
    QRel.Sql.Add('AND (REGISTRO_60D.DT_EMISSAO BETWEEN :DT_INICIAL AND :DT_FINAL)');
    QRel.Sql.Add('ORDER BY PRODUTOS.DESCRICAO');

    QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;

    QRel.Prepare;
    QRel.Open;

    QRel.First;
    while not QRel.Eof do
    begin
      QDetalhe.Sql.Clear;
      QDetalhe.Sql.Add('UPDATE PRODUTOS SET SPED = 1');
      QDetalhe.Sql.Add('WHERE');
      QDetalhe.Sql.Add('(PRODUTO_ID = :PRODUTO_ID)');

      QDetalhe.ParamByName('PRODUTO_ID').AsInteger := QRel.FieldByName('PRODUTO_ID').AsInteger;

      QDetalhe.Prepare;
      QDetalhe.ExecSql;



      Label1.Caption := QRel.FieldByName('DESCRICAO').AsString;

      Application.ProcessMessages;
      QRel.Next;
    end;

    Label1.Caption := 'Aguarde...';

    QSped.Sql.Clear;
    QSped.Sql.Add('INSERT INTO REG_0000(' +
                  'REG,          COD_VER,           TIPO_ESCRIT, ' +
                  'IND_SIT_ESP,  NUM_REC_ANTERIOR, ' +
                  'DT_INI,       DT_FIN,            NOME, ' +
                  'CNPJ,         UF,                COD_MUN, ' +
                  'SUFRAMA,      IND_NAT_PJ,        IND_ATIV, ' +
                  'ID_PAI) VALUES(' +
                  ':REG,         :COD_VER,          :TIPO_ESCRIT, ' +
                  ':IND_SIT_ESP, :NUM_REC_ANTERIOR, ' +
                  ':DT_INI,      :DT_FIN,           :NOME, ' +
                  ':CNPJ,        :UF,               :COD_MUN, ' +
                  ':SUFRAMA,     :IND_NAT_PJ,       :IND_ATIV, ' +
                  ':ID_PAI)');

    QSped.ParamByName('ID_PAI').AsInteger := 0;
    QSped.ParamByName('REG').AsString     := '0000';
    QSped.ParamByName('COD_VER').AsString := Versao.Text;

    if Tipo_Escrituracao.Text = 'Original' then
      QSped.ParamByName('TIPO_ESCRIT').AsString := '0'
    else if Tipo_escrituracao.Text = 'Retificadora' then
      QSped.ParamByName('TIPO_ESCRIT').AsString := '1'
    else
      QSped.ParamByName('TIPO_ESCRIT').AsString := '0';

    QSped.ParamByName('IND_SIT_ESP').AsString      := Copy(Situacao_Especial.Text, 1, 1);
    QSped.ParamByName('NUM_REC_ANTERIOR').AsString := Num_Recibo_Ant.Text;
    QSped.ParamByName('DT_INI').AsDateTime         := Dtmen.Date;
    QSped.ParamByName('DT_FIN').AsDateTime         := Dtmai.Date;
    QSped.ParamByName('NOME').AsString             := FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString;
    QSped.ParamByName('CNPJ').AsString             := SemMascara(FrmPrincipal.QEmpresa.FieldByName('CNPJ').AsString);
    QSped.ParamByName('UF').AsString               := FrmPrincipal.QEmpresa.FieldByName('ESTADO').AsString;
    QSped.ParamByName('COD_MUN').AsString          := FrmPrincipal.QEmpresa.FieldByName('IBGE').AsString;
    QSped.ParamByName('SUFRAMA').AsString          := FrmPrincipal.QEmpresa.FieldByName('SUFRAMA').AsString;
    QSped.ParamByName('IND_NAT_PJ').AsString       := Copy(FrmPrincipal.QEmpresa.FieldByName('NATUREZA_PJ').AsString, 1, 2);
    QSped.ParamByName('IND_ATIV').AsString         := Copy(FrmPrincipal.QEmpresa.FieldByName('TIPO_ATIVIDADE').AsString, 1, 1);

    QSped.Prepare;
    QSped.ExecSql;



    QSped.Sql.Clear;
    QSped.Sql.Add('SELECT * FROM REG_0000');
    QSped.Sql.Add('WHERE');
    QSped.Sql.Add('(DT_INI = :DT_INI)');
    QSped.Sql.Add('AND (DT_FIN = :DT_FIN)');
    QSped.Sql.Add('AND (CNPJ = :CNPJ)');

    QSped.ParamByName('DT_INI').AsDateTime := Dtmen.Date;
    QSped.ParamByName('DT_FIN').AsDateTime := Dtmai.Date;
    QSped.ParamByName('CNPJ').AsString     := SemMascara(FrmPrincipal.QEmpresa.FieldByName('CNPJ').AsString);

    QSped.Prepare;
    QSped.Open;

    Id_Pai := QSped.FieldByName('ID').AsInteger;

    QSped.Sql.Clear;
    QSped.Sql.Add('INSERT INTO REG_0100(' +
                  'ID_PAI,  REG,     NOME, ' +
                  'CPF,     CRC,     CNPJ, ' +
                  'CEP,     ENDER,   NUM, ' +
                  'COMPL,   BAIRRO,  FONE, ' +
                  'FAX,     EMAIL,   COD_MUN) VALUES(' +
                  ':ID_PAI, :REG,    :NOME, ' +
                  ':CPF,    :CRC,    :CNPJ, ' +
                  ':CEP,    :ENDER,  :NUM, ' +
                  ':COMPL,  :BAIRRO, :FONE, ' +
                  ':FAX,    :EMAIL,  :COD_MUN)');

    QSped.ParamByName('ID_PAI').AsInteger := Id_Pai;
    QSped.ParamByName('REG').AsString     := '0100';
    QSped.ParamByName('NOME').AsString    := FrmPrincipal.QEmpresa.FieldByName('CONTABILISTA').AsString;
    QSped.ParamByName('CPF').AsString     := SemMascara(FrmPrincipal.QEmpresa.FieldByName('CPF_CONTABILISTA').AsString);
    QSped.ParamByName('CRC').AsString     := FrmPrincipal.QEmpresa.FieldByName('CRC_CONTABILISTA').AsString;
    QSped.ParamByName('CNPJ').AsString    := SemMascara(FrmPrincipal.QEmpresa.FieldByName('CNPJ_CONTABILISTA').AsString);
    QSped.ParamByName('CEP').AsString     := SemMascara(FrmPrincipal.QEmpresa.FieldByName('CEP').AsString);
    QSped.ParamByName('ENDER').AsString   := FrmPrincipal.QEmpresa.FieldByName('END_CONTABILISTA').AsString;
    QSped.ParamByName('NUM').AsString     := FrmPrincipal.QEmpresa.FieldByName('NUM_CONTABILISTA').AsString;
    QSped.ParamByName('COMPL').AsString   := FrmPrincipal.QEmpresa.FieldByName('COMPL_CONTABILISTA').AsString;
    QSped.ParamByName('BAIRRO').AsString  := FrmPrincipal.QEmpresa.FieldByName('BAIRRO_CONTABILISTA').AsString;
    QSped.ParamByName('FONE').AsString    := SemMascara(FrmPrincipal.QEmpresa.FieldByName('FONE_CONTABILISTA').AsString);
    QSped.ParamByName('FAX').AsString     := FrmPrincipal.QEmpresa.FieldByName('FAX_CONTABILISTA').AsString;
    QSped.ParamByName('EMAIL').AsString   := FrmPrincipal.QEmpresa.FieldByName('EMAIL_CONTABILISTA').AsString;
    QSped.ParamByName('COD_MUN').AsString := FrmPrincipal.QEmpresa.FieldByName('IBGE_CONTABILISTA').AsString;

    QSped.Prepare;
    QSped.ExecSql;



    QSped.Sql.Clear;
    QSped.Sql.Add('INSERT INTO REG_0110(' +
                  'ID_PAI,         REG,           COD_INC_TRIB, ' +
                  'IND_APRO_CRED,                 COD_TIPO_CONT) VALUES(' +
                  ':ID_PAI,        :REG,          :COD_INC_TRIB, ' +
                  ':IND_APRO_CRED, :COD_TIPO_CONT)');

    QSped.ParamByName('ID_PAI').AsInteger       := Id_Pai;
    QSped.ParamByName('REG').AsString           := '0140';
    QSped.ParamByName('COD_INC_TRIB').AsString  := '1';
    QSped.ParamByName('IND_APRO_CRED').AsString := '1';
    QSped.ParamByName('COD_TIPO_CONT').AsString := '1';

    QSped.Prepare;
    QSped.ExecSql;



    QSped.Sql.Clear;
    QSped.Sql.Add('INSERT INTO REG_0140(' +
                  'ID_PAI,   REG,      COD_EST, ' +
                  'NOME,     CNPJ,     UF, ' +
                  'IE,       COD_MUN,  IM, ' +
                  'SUFRAMA) VALUES(' +
                  ':ID_PAI,  :REG,     :COD_EST, ' +
                  ':NOME,    :CNPJ,    :UF, ' +
                  ':IE,      :COD_MUN, :IM, ' +
                  ':SUFRAMA)');

    QSped.ParamByName('ID_PAI').AsInteger := Id_Pai;
    QSped.ParamByName('REG').AsString     := '0140';
    QSped.ParamByName('COD_EST').AsString := Copy(SemMascara(FrmPrincipal.QEmpresa.FieldByName('CNPJ').AsString), 1, 8);
    QSped.ParamByName('NOME').AsString    := FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString;
    QSped.ParamByName('CNPJ').AsString    := SemMascara(FrmPrincipal.QEmpresa.FieldByName('CNPJ').AsString);
    QSped.ParamByName('UF').AsString      := FrmPrincipal.QEmpresa.FieldByName('ESTADO').AsString;
    QSped.ParamByName('IE').AsString      := SemMascara(FrmPrincipal.QEmpresa.FieldByName('INSCR_ESTADUAL').AsString);
    QSped.ParamByName('COD_MUN').AsString := FrmPrincipal.QEmpresa.FieldByName('IBGE').AsString;
    QSped.ParamByName('IM').AsString      := SemMascara(FrmPrincipal.QEmpresa.FieldByName('INSCR_MUNICIPAL').AsString);
    QSped.ParamByName('SUFRAMA').AsString := FrmPrincipal.QEmpresa.FieldByName('SUFRAMA').AsString;

    QSped.Prepare;
    QSped.ExecSql;



    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT DISTINCT FORNECEDORES.*');
    QRel.Sql.Add('FROM FORNECEDORES');
    QRel.Sql.Add('INNER JOIN TRANSACOES');
    QRel.Sql.Add('ON (FORNECEDORES.FORNECEDOR_ID = TRANSACOES.FORNECEDOR_ID)');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
    QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
    QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
    QRel.Sql.Add('AND ((TRANSACOES.MODELO = :MODELO1) OR (TRANSACOES.MODELO = :MODELO2) OR (TRANSACOES.MODELO = :MODELO3) OR (TRANSACOES.MODELO = :MODELO4) OR ' +
                 '(TRANSACOES.MODELO = :MODELO5) OR (TRANSACOES.MODELO = :MODELO6) OR (TRANSACOES.MODELO = :MODELO7) OR (TRANSACOES.MODELO = :MODELO8) OR ' +
                 '(TRANSACOES.MODELO = :MODELO9) OR (TRANSACOES.MODELO = :MODELOA) OR (TRANSACOES.MODELO = :MODELOB) OR (TRANSACOES.MODELO = :MODELOC) OR ' +
                 '(TRANSACOES.MODELO = :MODELOD) OR (TRANSACOES.MODELO = :MODELOE) OR (TRANSACOES.MODELO = :MODELOF) OR (TRANSACOES.MODELO = :MODELOG) OR (TRANSACOES.MODELO = :MODELOH) OR (TRANSACOES.MODELO = :MODELOI))');
    QRel.Sql.Add('AND (TRANSACOES.FORNECEDOR_ID > 0)');
    QRel.Sql.Add('ORDER BY FORNECEDORES.NOME');

    QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
    QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    QRel.ParamByName('MODELO1').AsString      := '01';
    QRel.ParamByName('MODELO2').AsString      := '1B';
    QRel.ParamByName('MODELO3').AsString      := '04';
    QRel.ParamByName('MODELO4').AsString      := '55';
    QRel.ParamByName('MODELO5').AsString      := '07';
    QRel.ParamByName('MODELO6').AsString      := '08';
    QRel.ParamByName('MODELO7').AsString      := '8B';
    QRel.ParamByName('MODELO8').AsString      := '09';
    QRel.ParamByName('MODELO9').AsString      := '10';
    QRel.ParamByName('MODELOA').AsString      := '11';
    QRel.ParamByName('MODELOB').AsString      := '26';
    QRel.ParamByName('MODELOC').AsString      := '27';
    QRel.ParamByName('MODELOD').AsString      := '57';
    QRel.ParamByName('MODELOE').AsString      := '21';
    QRel.ParamByName('MODELOF').AsString      := '22';
    QRel.ParamByName('MODELOG').AsString      := '06';
    QRel.ParamByName('MODELOH').AsString      := '28';
    QRel.ParamByName('MODELOI').AsString      := '29';

    QRel.Prepare;
    QRel.Open;

    QRel.First;
    while not QRel.Eof do
    begin
      QSped.Sql.Clear;
      QSped.Sql.Add('INSERT INTO REG_0150(' +
                    'ID_PAI,    REG,       COD_PART, ' +
                    'NOME,      COD_PAIS,  CNPJ, ' +
                    'CPF,       IE,        COD_MUN, ' +
                    'SUFRAMA,   ENDER,     NUM, ' +
                    'COMPL,     BAIRRO) VALUES(' +
                    ':ID_PAI,   :REG,      :COD_PART, ' +
                    ':NOME,     :COD_PAIS, :CNPJ, ' +
                    ':CPF,      :IE,       :COD_MUN, ' +
                    ':SUFRAMA,  :ENDER,    :NUM, ' +
                    ':COMPL,     :BAIRRO)');

      QSped.ParamByName('ID_PAI').AsInteger  := Id_Pai;
      QSped.ParamByName('REG').AsString      := '0150';
      QSped.ParamByName('COD_PART').AsString := 'F' + StrZero(QRel.FieldByName('FORNECEDOR_ID').AsString, 6, 0);
      QSped.ParamByName('NOME').AsString     := Alltrim(QRel.FieldByName('NOME').AsString);
      QSped.ParamByName('COD_PAIS').AsString := QRel.FieldByName('COD_PAIS').AsString;

      if QRel.FieldByName('TIPO_FORNECEDOR').AsString = 'PESSOA JURÍDICA' then
      begin
        QSped.ParamByName('CNPJ').AsString := SemMascara(QRel.FieldByName('CNPJ').AsString);
        QSped.ParamByName('CPF').AsString  := '';
      end
      else
      begin
        QSped.ParamByName('CNPJ').AsString := '';
        QSped.ParamByName('CPF').AsString  := SemMascara(QRel.FieldByName('CNPJ').AsString);
      end;

      QSped.ParamByName('IE').AsString       := SemMascara(QRel.FieldByName('INSCRICAO').AsString);
      QSped.ParamByName('COD_MUN').AsString  := QRel.FieldByName('IBGE').AsString;
      QSped.ParamByName('SUFRAMA').AsString  := QRel.FieldByName('SUFRAMA').AsString;
      QSped.ParamByName('ENDER').AsString    := Alltrim(QRel.FieldByName('ENDERECO').AsString);
      QSped.ParamByName('NUM').AsString      := QRel.FieldByName('NUMERO').AsString;
      QSped.ParamByName('COMPL').AsString    := Alltrim(QRel.FieldByName('COMPLEMENTO').AsString);
      QSped.ParamByName('BAIRRO').AsString   := QRel.FieldByName('BAIRRO').AsString;

      QSped.Prepare;
      QSped.ExecSql;



      Label1.Caption := QRel.FieldByName('NOME').AsString;

      Application.ProcessMessages;
      QRel.Next;
    end;

    Label1.Caption := 'Aguarde...';

    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT DISTINCT CLIENTES.*');
    QRel.Sql.Add('FROM CLIENTES');
    QRel.Sql.Add('INNER JOIN TRANSACOES');
    QRel.Sql.Add('ON (CLIENTES.CLIENTE_ID = TRANSACOES.CLIENTE_ID)');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
    QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
    QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
    QRel.Sql.Add('AND ((TRANSACOES.MODELO = :MODELO1) OR (TRANSACOES.MODELO = :MODELO2) OR (TRANSACOES.MODELO = :MODELO3) OR (TRANSACOES.MODELO = :MODELO4))');
    QRel.Sql.Add('AND (TRANSACOES.CLIENTE_ID > 0)');
    QRel.Sql.Add('ORDER BY CLIENTES.NOME');

    QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
    QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    QRel.ParamByName('MODELO1').AsString      := '01';
    QRel.ParamByName('MODELO2').AsString      := '1B';
    QRel.ParamByName('MODELO3').AsString      := '04';
    QRel.ParamByName('MODELO4').AsString      := '55';

    QRel.Prepare;
    QRel.Open;

    QRel.First;
    while not QRel.Eof do
    begin
      QSped.Sql.Clear;
      QSped.Sql.Add('INSERT INTO REG_0150(' +
                    'ID_PAI,    REG,       COD_PART, ' +
                    'NOME,      COD_PAIS,  CNPJ, ' +
                    'CPF,       IE,        COD_MUN, ' +
                    'SUFRAMA,   ENDER,     NUM, ' +
                    'COMPL,     BAIRRO) VALUES(' +
                    ':ID_PAI,   :REG,      :COD_PART, ' +
                    ':NOME,     :COD_PAIS, :CNPJ, ' +
                    ':CPF,      :IE,       :COD_MUN, ' +
                    ':SUFRAMA,  :ENDER,    :NUM, ' +
                    ':COMPL,    :BAIRRO)');

      QSped.ParamByName('ID_PAI').AsInteger  := Id_Pai;
      QSped.ParamByName('REG').AsString      := '0150';
      QSped.ParamByName('COD_PART').AsString := 'C' + StrZero(QRel.FieldByName('CLIENTE_ID').AsString, 6, 0);
      QSped.ParamByName('NOME').AsString     := Alltrim(QRel.FieldByName('NOME').AsString);
      QSped.ParamByName('COD_PAIS').AsString := QRel.FieldByName('COD_PAIS').AsString;

      if QRel.FieldByName('TIPO_CLIENTE').AsString = 'PESSOA JURÍDICA' then
      begin
        QSped.ParamByName('CNPJ').AsString := SemMascara(QRel.FieldByName('CNPJ').AsString);
        QSped.ParamByName('CPF').AsString  := '';
      end
      else
      begin
        QSped.ParamByName('CNPJ').AsString := '';
        QSped.ParamByName('CPF').AsString  := SemMascara(QRel.FieldByName('CNPJ').AsString);
      end;

      QSped.ParamByName('IE').AsString       := SemMascara(QRel.FieldByName('INSCRICAO').AsString);
      QSped.ParamByName('COD_MUN').AsString  := QRel.FieldByName('IBGE').AsString;
      QSped.ParamByName('SUFRAMA').AsString  := QRel.FieldByName('SUFRAMA').AsString;
      QSped.ParamByName('ENDER').AsString    := Alltrim(QRel.FieldByName('ENDERECO').AsString);
      QSped.ParamByName('NUM').AsString      := QRel.FieldByName('NUMERO').AsString;
      QSped.ParamByName('COMPL').AsString    := Alltrim(QRel.FieldByName('COMPLEMENTO').AsString);
      QSped.ParamByName('BAIRRO').AsString   := QRel.FieldByName('BAIRRO').AsString;

      QSped.Prepare;
      QSped.ExecSql;



      Label1.Caption := QRel.FieldByName('NOME').AsString;

      Application.ProcessMessages;
      QRel.Next;
    end;

    Label1.Caption := 'Aguarde...';

    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT * FROM PRODUTOS');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(EMPRESA_ID = :EMPRESA_ID)');
    QRel.Sql.Add('AND (SPED = 1)');
    QRel.Sql.Add('ORDER BY DESCRICAO, UNIDADE_VENDA');

    QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;

    QRel.Prepare;
    QRel.Open;

    QRel.First;
    while not QRel.Eof do
    begin
      QSped.Sql.Clear;
      QSped.Sql.Add('SELECT * FROM REG_0190');
      QSped.Sql.Add('WHERE');
      QSped.Sql.Add('(UNID = :UNID)');

      QSped.ParamByName('UNID').AsString := QRel.FieldByName('UNIDADE_VENDA').AsString;

      QSped.Prepare;
      QSped.Open;

      if QSped.IsEmpty then
      begin
        QSped.Sql.Clear;
        QSped.Sql.Add('INSERT INTO REG_0190(' +
                      'ID_PAI,  REG,  UNID, ' +
                      'DESCR) VALUES(' +
                      ':ID_PAI, :REG, :UNID, ' +
                      ':DESCR)');

        QSped.ParamByName('ID_PAI').AsInteger := Id_Pai;
        QSped.ParamByName('REG').AsString     := '0190';
        QSped.ParamByName('UNID').AsString    := QRel.FieldByName('UNIDADE_VENDA').AsString;
        QSped.ParamByName('DESCR').AsString   := 'UNIDADE -> ' + QRel.FieldByName('UNIDADE_VENDA').AsString;

        QSped.Prepare;
        QSped.ExecSql;


      end;

      QSped.Sql.Clear;
      QSped.Sql.Add('INSERT INTO REG_0200(' +
                    'ID_PAI,      REG,        COD_ITEM, ' +
                    'DESCR_ITEM,  COD_BARRA,  COD_ANT_ITEM, ' +
                    'UNID_INV,    TIPO_ITEM,  COD_NCM, ' +
                    'EX_IPI,      COD_GEN,    COD_LST, ' +
                    'ALIQ_ICMS) VALUES(' +
                    ':ID_PAI,     :REG,       :COD_ITEM, ' +
                    ':DESCR_ITEM, :COD_BARRA, :COD_ANT_ITEM, ' +
                    ':UNID_INV,   :TIPO_ITEM, :COD_NCM, ' +
                    ':EX_IPI,     :COD_GEN,   :COD_LST, ' +
                    ':ALIQ_ICMS)');

      QSped.ParamByName('ID_PAI').AsInteger      := Id_Pai;
      QSped.ParamByName('REG').AsString          := '0200';
      QSped.ParamByName('COD_ITEM').AsString     := StrZero(QRel.FieldByName('PRODUTO_ID').AsString, 6, 0);
      QSped.ParamByName('DESCR_ITEM').AsString   := Alltrim(QRel.FieldByName('DESCRICAO').AsString);
      QSped.ParamByName('COD_BARRA').AsString    := QRel.FieldByName('COD_BARRA').AsString;
      QSped.ParamByName('COD_ANT_ITEM').AsString := '';
      QSped.ParamByName('UNID_INV').AsString     := QRel.FieldByName('UNIDADE_VENDA').AsString;
      QSped.ParamByName('TIPO_ITEM').AsString    := Copy(QRel.FieldByName('TIPO_ITEM').AsString, 1, 2);
      QSped.ParamByName('COD_NCM').AsString      := QRel.FieldByName('NCM').AsString;
      QSped.ParamByName('EX_IPI').AsString       := '';
      QSped.ParamByName('COD_GEN').AsString      := QRel.FieldByName('COD_GEN').AsString;
      QSped.ParamByName('COD_LST').AsString      := '';
      QSped.ParamByName('ALIQ_ICMS').AsFloat     := QRel.FieldByName('ALIQUOTA_ICMS').AsFloat;

      QSped.Prepare;
      QSped.ExecSql;



      Label1.Caption := QRel.FieldByName('DESCRICAO').AsString;

      Application.ProcessMessages;
      QRel.Next;
    end;

    Label1.Caption := 'Aguarde...';

    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT * FROM TRANSACOES');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
    QRel.Sql.Add('AND (EMPRESA_ID = :EMPRESA_ID)');
    QRel.Sql.Add('AND (TPCTB <= :TPCTB)');
    QRel.Sql.Add('AND ((TRANSACOES.MODELO = :MODELO1) OR (TRANSACOES.MODELO = :MODELO2) OR (TRANSACOES.MODELO = :MODELO3) OR (TRANSACOES.MODELO = :MODELO4))');
    QRel.Sql.Add('ORDER BY NUM_DOC');

    QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
    QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    QRel.ParamByName('MODELO1').AsString      := '01';
    QRel.ParamByName('MODELO2').AsString      := '1B';
    QRel.ParamByName('MODELO3').AsString      := '04';
    QRel.ParamByName('MODELO4').AsString      := '55';

    QRel.Prepare;
    QRel.Open;

    QRel.First;
    while not QRel.Eof do
    begin
      Doc_Cancelado := False;
      Chave_NFe     := '';
      Cod_Part      := '';

      if ((QRel.FieldByName('CONDUTA').AsString = '01') and (QRel.FieldByName('DEPTO').AsString = '10')) or ((QRel.FieldByName('CONDUTA').AsString = '01') and (QRel.FieldByName('DEPTO').AsString = '07')) then
      begin
        QDetalhe.Sql.Clear;
        QDetalhe.Sql.Add('SELECT * FROM NOTAS_CANCELADAS');
        QDetalhe.Sql.Add('WHERE');
        QDetalhe.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

        QDetalhe.ParamByName('TRANSACAO_ID').AsInteger := QRel.FieldByName('TRANSACAO_ID').AsInteger;

        QDetalhe.Prepare;
        QDetalhe.Open;

        if not QDetalhe.IsEmpty then
        begin
          Doc_Cancelado := True;
          Chave_NFe     := QDetalhe.FieldByName('CHAVE_NFE').AsString;
        end;

        QDetalhe.Sql.Clear;
        QDetalhe.Sql.Add('SELECT * FROM COMPL_NFISCAL');
        QDetalhe.Sql.Add('WHERE');
        QDetalhe.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

        QDetalhe.ParamByName('TRANSACAO_ID').AsInteger := QRel.FieldByName('TRANSACAO_ID').AsInteger;

        QDetalhe.Prepare;
        QDetalhe.Open;

        if not QDetalhe.IsEmpty then
        begin
          Doc_Cancelado := False;
          Chave_NFe     := QDetalhe.FieldByName('CHAVE_NFE').AsString;
        end;

        Ind_Oper := '1';
        Ind_Emit := '0';

        if not Doc_Cancelado then
          Cod_Part := 'C' + StrZero(QRel.FieldByName('CLIENTE_ID').AsString, 6, 0);
      end
      else
      begin
        Ind_Oper := '0';
        Ind_Emit := '1';
        Cod_Part := 'F' + StrZero(QRel.FieldByName('FORNECEDOR_ID').AsString, 6, 0);

        if QRel.FieldByName('CHAVE_NFE').AsString <> '' then
          Chave_NFe := QRel.FieldByName('CHAVE_NFE').AsString;
      end;

      if Doc_Cancelado then
        Cod_Sit := '02'
      else
        Cod_Sit := '00';

      if not Doc_Cancelado then
      begin
        QSped.Sql.Clear;
        QSped.Sql.Add('SELECT GEN_ID(GEN_REG_C100, 0) FROM RDB$DATABASE');

        QSped.Prepare;
        QSped.Open;

        Id_Detalhe := (QSped.Fields[0].AsInteger + 1);

        QSped.Sql.Clear;
        QSped.Sql.Add('SET GENERATOR GEN_REG_C100 TO ' + IntToStr(Id_Detalhe));

        QSped.Prepare;
        QSped.ExecSql;



        QSped.Sql.Clear;
        QSped.Sql.Add('INSERT INTO REG_C100(' +
                      'ID,             ID_PAI,      REG, ' +
                      'IND_OPER,       IND_EMIT,    COD_PART, ' +
                      'COD_MOD,        COD_SIT,     SER, ' +
                      'NUM_DOC,        CHV_NFE,     DT_DOC, ' +
                      'DT_E_S,         VL_DOC,      IND_PGTO, ' +
                      'VL_DESC,        VL_ABAT_NT,  VL_MERC, ' +
                      'IND_FRT,        VL_FRT,      VL_SEG, ' +
                      'VL_OUT_DA,      VL_BC_ICMS,  VL_ICMS, ' +
                      'VL_BC_ICMS_ST,  VL_ICMS_ST,  VL_IPI, ' +
                      'VL_PIS,         VL_COFINS,   VL_PIS_ST, ' +
                      'VL_COFINS_ST) VALUES(' +
                      ':ID,            :ID_PAI,     :REG, ' +
                      ':IND_OPER,      :IND_EMIT,   :COD_PART, ' +
                      ':COD_MOD,       :COD_SIT,    :SER, ' +
                      ':NUM_DOC,       :CHV_NFE,    :DT_DOC, ' +
                      ':DT_E_S,        :VL_DOC,     :IND_PGTO, ' +
                      ':VL_DESC,       :VL_ABAT_NT, :VL_MERC, ' +
                      ':IND_FRT,       :VL_FRT,     :VL_SEG, ' +
                      ':VL_OUT_DA,     :VL_BC_ICMS, :VL_ICMS, ' +
                      ':VL_BC_ICMS_ST, :VL_ICMS_ST, :VL_IPI, ' +
                      ':VL_PIS,        :VL_COFINS,  :VL_PIS_ST, ' +
                      ':VL_COFINS_ST)');

        QSped.ParamByName('ID').AsInteger          := Id_Detalhe;
        QSped.ParamByName('ID_PAI').AsInteger      := Id_Pai;
        QSped.ParamByName('REG').AsString          := 'C100';
        QSped.ParamByName('IND_OPER').AsString     := Ind_Oper;
        QSped.ParamByName('IND_EMIT').AsString     := Ind_Emit;
        QSped.ParamByName('COD_PART').AsString     := Cod_Part;
        QSped.ParamByName('COD_MOD').AsString      := StrZero(QRel.FieldByName('MODELO').AsString, 2, 0);
        QSped.ParamByName('COD_SIT').AsString      := Cod_Sit;
        QSped.ParamByName('SER').AsString          := QRel.FieldByName('SERIE').AsString;
        QSped.ParamByName('NUM_DOC').AsString      := StrZero(QRel.FieldByName('NUM_DOC').AsString, 7, 0);
        QSped.ParamByName('CHV_NFE').AsString      := Chave_NFe;
        QSped.ParamByName('DT_DOC').AsDateTime     := QRel.FieldByName('DT_TRANS').AsDateTime;
        QSped.ParamByName('DT_E_S').AsDateTime     := QRel.FieldByName('DT_TRANS').AsDateTime;
        QSped.ParamByName('VL_DOC').AsFloat        := QRel.FieldByName('VALOR').AsFloat;
        QSped.ParamByName('IND_PGTO').AsString     := '0';
        QSped.ParamByName('VL_DESC').AsFloat       := QRel.FieldByName('VR_DESCONTO').AsFloat;
        QSped.ParamByName('VL_ABAT_NT').AsFloat    := 0;
        QSped.ParamByName('VL_MERC').AsFloat       := QRel.FieldByName('VALOR').AsFloat;
        QSped.ParamByName('IND_FRT').AsString      := '9';
        QSped.ParamByName('VL_FRT').AsFloat        := QRel.FieldByName('VR_FRETE').AsFloat;
        QSped.ParamByName('VL_SEG').AsFloat        := 0;
        QSped.ParamByName('VL_OUT_DA').AsFloat     := QRel.FieldByName('VR_ACRESCIMO').AsFloat;
        QSped.ParamByName('VL_BC_ICMS').AsFloat    := QRel.FieldByName('BASE_ICMS_NORMAL').AsFloat;
        QSped.ParamByName('VL_ICMS').AsFloat       := QRel.FieldByName('VR_ICMS_NORMAL').AsFloat;
        QSped.ParamByName('VL_BC_ICMS_ST').AsFloat := QRel.FieldByName('BASE_ICMS_ST').AsFloat;
        QSped.ParamByName('VL_ICMS_ST').AsFloat    := QRel.FieldByName('VR_ICMS_ST').AsFloat;
        QSped.ParamByName('VL_IPI').AsFloat        := QRel.FieldByName('VR_IPI').AsFloat;
        QSped.ParamByName('VL_PIS').AsFloat        := QRel.FieldByName('VR_PIS').AsFloat;
        QSped.ParamByName('VL_COFINS').AsFloat     := QRel.FieldByName('VR_COFINS').AsFloat;
        QSped.ParamByName('VL_PIS_ST').AsFloat     := QRel.FieldByName('VR_PIS_ST').AsFloat;
        QSped.ParamByName('VL_COFINS_ST').AsFloat  := QRel.FieldByName('VR_COFINS_ST').AsFloat;

        QSped.Prepare;
        QSped.ExecSql;



        QDetalhe.Sql.Clear;
        QDetalhe.Sql.Add('SELECT TRANSITENS.*, PRODUTOS.UNIDADE_VENDA, PRODUTOS.DESCRICAO NOME_PRODUTO');
        QDetalhe.Sql.Add('FROM TRANSITENS');
        QDetalhe.Sql.Add('INNER JOIN PRODUTOS');
        QDetalhe.Sql.Add('ON (TRANSITENS.PRODUTO_ID = PRODUTOS.PRODUTO_ID)');
        QDetalhe.Sql.Add('WHERE');
        QDetalhe.Sql.Add('(TRANSITENS.TRANSACAO_ID = :TRANSACAO_ID)');

        QDetalhe.ParamByName('TRANSACAO_ID').AsInteger := QRel.FieldByName('TRANSACAO_ID').AsInteger;

        QDetalhe.Prepare;
        QDetalhe.Open;

        Num_Item := 1;

        QDetalhe.First;
        while not QDetalhe.Eof do
        begin
          QProduto.Sql.Clear;
          QProduto.Sql.Add('SELECT * FROM PRODUTOS');
          QProduto.Sql.Add('WHERE');
          QProduto.Sql.Add('(PRODUTO_ID = :PRODUTO_ID)');

          QProduto.ParamByName('PRODUTO_ID').AsInteger := QDetalhe.FieldByName('PRODUTO_ID').AsInteger;

          QProduto.Prepare;
          QProduto.Open;

          QSped.Sql.Clear;
          QSped.Sql.Add('INSERT INTO REG_C170(' +
                        'ID_PAI,             ID_DETALHE,   REG, ' +
                        'NUM_ITEM,           COD_ITEM,     DESCR_COMPL, ' +
                        'QTD,                UNID,         VL_ITEM, ' +
                        'VL_DESC,            IND_MOV,      CST_ICMS, ' +
                        'CFOP,               COD_NAT,      VL_BC_ICMS, ' +
                        'ALIQ_ICMS,          VL_ICMS,      VL_BC_ICMS_ST, ' +
                        'ALIQ_ST,            VL_ICMS_ST,   IND_APUR, ' +
                        'CST_IPI,            COD_ENQ,      VL_BC_IPI, ' +
                        'ALIQ_IPI,           VL_IPI,       CST_PIS, ' +
                        'VL_BC_PIS,          ALIQ_PIS,     QUANT_BC_PIS, ' +
                        'ALIQ_PIS_QUANT,     VL_PIS,       CST_COFINS, ' +
                        'VL_BC_COFINS,       ALIQ_COFINS,  QUANT_BC_COFINS, ' +
                        'ALIQ_COFINS_QUANT,  VL_COFINS,    COD_CTA, ' +
                        'NAT_REC) VALUES(' +
                        ':ID_PAI,            :ID_DETALHE,  :REG, ' +
                        ':NUM_ITEM,          :COD_ITEM,    :DESCR_COMPL, ' +
                        ':QTD,               :UNID,        :VL_ITEM, ' +
                        ':VL_DESC,           :IND_MOV,     :CST_ICMS, ' +
                        ':CFOP,              :COD_NAT,     :VL_BC_ICMS, ' +
                        ':ALIQ_ICMS,         :VL_ICMS,     :VL_BC_ICMS_ST, ' +
                        ':ALIQ_ST,           :VL_ICMS_ST,  :IND_APUR, ' +
                        ':CST_IPI,           :COD_ENQ,     :VL_BC_IPI, ' +
                        ':ALIQ_IPI,          :VL_IPI,      :CST_PIS, ' +
                        ':VL_BC_PIS,         :ALIQ_PIS,    :QUANT_BC_PIS, ' +
                        ':ALIQ_PIS_QUANT,    :VL_PIS,      :CST_COFINS, ' +
                        ':VL_BC_COFINS,      :ALIQ_COFINS, :QUANT_BC_COFINS, ' +
                        ':ALIQ_COFINS_QUANT, :VL_COFINS,   :COD_CTA, ' +
                        ':NAT_REC)');

          QSped.ParamByName('ID_PAI').AsInteger      := Id_Pai;
          QSped.ParamByName('ID_DETALHE').AsInteger  := Id_Detalhe;
          QSped.ParamByName('REG').AsString          := 'C170';
          QSped.ParamByName('NUM_ITEM').AsString     := StrZero(IntToStr(Num_Item), 3, 0);
          QSped.ParamByName('COD_ITEM').AsString     := StrZero(QDetalhe.FieldByName('PRODUTO_ID').AsString, 6, 0);
          QSped.ParamByName('DESCR_COMPL').AsString  := Alltrim(QDetalhe.FieldByName('NOME_PRODUTO').AsString);
          QSped.ParamByName('QTD').AsFloat           := QDetalhe.FieldByName('QUANTIDADE').AsFloat;
          QSped.ParamByName('UNID').AsString         := QDetalhe.FieldByName('UNIDADE_VENDA').AsString;
          QSped.ParamByName('VL_ITEM').AsFloat       := (QDetalhe.FieldByName('VR_TOTAL').AsFloat + QDetalhe.FieldByName('VALOR_ICMS_ST').AsFloat + QDetalhe.FieldByName('VR_FRETE').AsFloat + QDetalhe.FieldByName('VR_ACRESCIMO').AsFloat + QDetalhe.FieldByName('VR_IPI').AsFloat - QDetalhe.FieldByName('DESC_RODAPE').AsFloat);
          QSped.ParamByName('VL_DESC').AsFloat       := 0;
          QSped.ParamByName('IND_MOV').AsString      := '0';
          QSped.ParamByName('CST_ICMS').AsString     := QDetalhe.FieldByName('CST').AsString;
          QSped.ParamByName('CFOP').AsString         := QDetalhe.FieldByName('CFOP').AsString;
          QSped.ParamByName('COD_NAT').AsString      := '';
          QSped.ParamByName('VL_BC_ICMS').AsFloat    := QDetalhe.FieldByName('BASE_CALC_ICMS').AsFloat;
          QSped.ParamByName('ALIQ_ICMS').AsFloat     := QDetalhe.FieldByName('ALIQUOTA_ICMS').AsFloat;
          QSped.ParamByName('VL_ICMS').AsFloat       := QDetalhe.FieldByName('VALOR_ICMS').AsFloat;
          QSped.ParamByName('VL_BC_ICMS_ST').AsFloat := QDetalhe.FieldByName('BASE_CALC_ST').AsFloat;
          QSped.ParamByName('ALIQ_ST').AsFloat       := QDetalhe.FieldByName('ALIQUOTA_ST').AsFloat;
          QSped.ParamByName('VL_ICMS_ST').AsFloat    := QDetalhe.FieldByName('VALOR_ICMS_ST').AsFloat;
          QSped.ParamByName('IND_APUR').AsString     := '0';
          QSped.ParamByName('CST_IPI').AsString      := QDetalhe.FieldByName('CST_IPI').AsString;
          QSped.ParamByName('COD_ENQ').AsString      := '';

          if QDetalhe.FieldByName('VR_IPI').AsFloat > 0 then
          begin
            QSped.ParamByName('VL_BC_IPI').AsFloat := QDetalhe.FieldByName('VR_TOTAL').AsFloat;
            QSped.ParamByName('ALIQ_IPI').AsFloat  := RoundTo(((QDetalhe.FieldByName('VR_IPI').AsFloat * 100) / QDetalhe.FieldByName('VR_TOTAL').AsFloat), -2);
            QSped.ParamByName('VL_IPI').AsFloat    := QDetalhe.FieldByName('VR_IPI').AsFloat;
          end
          else
          begin
            QSped.ParamByName('VL_BC_IPI').AsFloat := 0;
            QSped.ParamByName('ALIQ_IPI').AsFloat  := 0;
            QSped.ParamByName('VL_IPI').AsFloat    := 0;
          end;

          QSped.ParamByName('CST_PIS').AsString          := QDetalhe.FieldByName('CST_PIS').AsString;
          QSped.ParamByName('VL_BC_PIS').AsFloat         := QDetalhe.FieldByName('BASE_CALC_PIS').AsFloat;
          QSped.ParamByName('ALIQ_PIS').AsFloat          := QDetalhe.FieldByName('ALIQUOTA_PIS').AsFloat;
          QSped.ParamByName('QUANT_BC_PIS').AsFloat      := 0;
          QSped.ParamByName('ALIQ_PIS_QUANT').AsFloat    := 0;
          QSped.ParamByName('VL_PIS').AsFloat            := QDetalhe.FieldByName('VR_PIS').AsFloat;
          QSped.ParamByName('CST_COFINS').AsString       := QDetalhe.FieldByName('CST_COFINS').AsString;
          QSped.ParamByName('VL_BC_COFINS').AsFloat      := QDetalhe.FieldByName('BASE_CALC_COFINS').AsFloat;
          QSped.ParamByName('ALIQ_COFINS').AsFloat       := QDetalhe.FieldByName('ALIQUOTA_COFINS').AsFloat;
          QSped.ParamByName('QUANT_BC_COFINS').AsFloat   := 0;
          QSped.ParamByName('ALIQ_COFINS_QUANT').AsFloat := 0;
          QSped.ParamByName('VL_COFINS').AsFloat         := QDetalhe.FieldByName('VR_COFINS').AsFloat;
          QSped.ParamByName('COD_CTA').AsString          := '';
          QSped.ParamByName('NAT_REC').AsString          := QProduto.FieldByName('NAT_REC').AsString;

          QSped.Prepare;
          QSped.ExecSql;



          Inc(Num_Item);

          Label1.Caption := QDetalhe.FieldByName('NOME_PRODUTO').AsString;

          Application.ProcessMessages;
          QDetalhe.Next;
        end;
      end
      else
      begin
        QSped.Sql.Clear;
        QSped.Sql.Add('INSERT INTO REG_C100(' +
                      'ID_PAI,         REG,         IND_OPER, ' +
                      'IND_EMIT,       COD_PART,    COD_MOD, ' +
                      'COD_SIT,        SER,         NUM_DOC, ' +
                      'CHV_NFE,        VL_DOC,      IND_PGTO, ' +
                      'VL_DESC,        VL_ABAT_NT,  VL_MERC, ' +
                      'IND_FRT,        VL_FRT,      VL_SEG, ' +
                      'VL_OUT_DA,      VL_BC_ICMS,  VL_ICMS, ' +
                      'VL_BC_ICMS_ST,  VL_ICMS_ST,  VL_IPI, ' +
                      'VL_PIS,         VL_COFINS,   VL_PIS_ST, ' +
                      'VL_COFINS_ST) VALUES(' +
                      ':ID_PAI,        :REG,        :IND_OPER, ' +
                      ':IND_EMIT,      :COD_PART,   :COD_MOD, ' +
                      ':COD_SIT,       :SER,        :NUM_DOC, ' +
                      ':CHV_NFE,       :VL_DOC,     :IND_PGTO, ' +
                      ':VL_DESC,       :VL_ABAT_NT, :VL_MERC, ' +
                      ':IND_FRT,       :VL_FRT,     :VL_SEG, ' +
                      ':VL_OUT_DA,     :VL_BC_ICMS, :VL_ICMS, ' +
                      ':VL_BC_ICMS_ST, :VL_ICMS_ST, :VL_IPI, ' +
                      ':VL_PIS,        :VL_COFINS,  :VL_PIS_ST, ' +
                      ':VL_COFINS_ST)');

        QSped.ParamByName('ID_PAI').AsInteger      := Id_Pai;
        QSped.ParamByName('REG').AsString          := 'C100';
        QSped.ParamByName('IND_OPER').AsString     := Ind_Oper;
        QSped.ParamByName('IND_EMIT').AsString     := Ind_Emit;
        QSped.ParamByName('COD_PART').AsString     := Cod_Part;
        QSped.ParamByName('COD_MOD').AsString      := StrZero(QRel.FieldByName('MODELO').AsString, 2, 0);
        QSped.ParamByName('COD_SIT').AsString      := Cod_Sit;
        QSped.ParamByName('SER').AsString          := QRel.FieldByName('SERIE').AsString;
        QSped.ParamByName('NUM_DOC').AsString      := StrZero(QRel.FieldByName('NUM_DOC').AsString, 7, 0);
        QSped.ParamByName('CHV_NFE').AsString      := Chave_NFe;
        QSped.ParamByName('VL_DOC').AsFloat        := 0;
        QSped.ParamByName('IND_PGTO').AsString     := '';
        QSped.ParamByName('VL_DESC').AsFloat       := 0;
        QSped.ParamByName('VL_ABAT_NT').AsFloat    := 0;
        QSped.ParamByName('VL_MERC').AsFloat       := 0;
        QSped.ParamByName('IND_FRT').AsString      := '';
        QSped.ParamByName('VL_FRT').AsFloat        := 0;
        QSped.ParamByName('VL_SEG').AsFloat        := 0;
        QSped.ParamByName('VL_OUT_DA').AsFloat     := 0;
        QSped.ParamByName('VL_BC_ICMS').AsFloat    := 0;
        QSped.ParamByName('VL_ICMS').AsFloat       := 0;
        QSped.ParamByName('VL_BC_ICMS_ST').AsFloat := 0;
        QSped.ParamByName('VL_ICMS_ST').AsFloat    := 0;
        QSped.ParamByName('VL_IPI').AsFloat        := 0;
        QSped.ParamByName('VL_PIS').AsFloat        := 0;
        QSped.ParamByName('VL_COFINS').AsFloat     := 0;
        QSped.ParamByName('VL_PIS_ST').AsFloat     := 0;
        QSped.ParamByName('VL_COFINS_ST').AsFloat  := 0;

        QSped.Prepare;
        QSped.ExecSql;


      end;

      Label1.Caption := QRel.FieldByName('TRANSACAO_ID').AsString;

      Application.ProcessMessages;
      QRel.Next;
    end;

    Label1.Caption := 'Aguarde...';

    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT LICENCA_IF.*');
    QRel.Sql.Add('FROM LICENCA_IF');
    QRel.Sql.Add('INNER JOIN EMPRESAS');
    QRel.Sql.Add('ON (LICENCA_IF.CNPJ = EMPRESAS.CNPJ)');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(EMPRESAS.EMPRESA_ID = :EMPRESA_ID)');
    QRel.Sql.Add('ORDER BY LICENCA_IF.SERIAL');

    QRel.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;

    QRel.Prepare;
    QRel.Open;

    QRel.First;
    while not QRel.Eof do
    begin
      QSped.Sql.Clear;
      QSped.Sql.Add('SELECT GEN_ID(GEN_REG_C400, 0) FROM RDB$DATABASE');

      QSped.Prepare;
      QSped.Open;

      Id_Detalhe := (QSped.Fields[0].AsInteger + 1);

      QSped.Sql.Clear;
      QSped.Sql.Add('SET GENERATOR GEN_REG_C400 TO ' + IntToStr(Id_Detalhe));

      QSped.Prepare;
      QSped.ExecSql;



      QSped.Sql.Clear;
      QSped.Sql.Add('INSERT INTO REG_C400(' +
                    'ID,       ID_PAI,   REG, ' +
                    'COD_MOD,  ECF_MOD,  ECF_FAB, ' +
                    'ECF_CX) VALUES(' +
                    ':ID,      :ID_PAI,  :REG, ' +
                    ':COD_MOD, :ECF_MOD, :ECF_FAB, ' +
                    ':ECF_CX)');

      QSped.ParamByName('ID').AsInteger     := Id_Detalhe;
      QSped.ParamByName('ID_PAI').AsInteger := Id_Pai;
      QSped.ParamByName('REG').AsString     := 'C400';
      QSped.ParamByName('COD_MOD').AsString := '2D';
      QSped.ParamByName('ECF_MOD').AsString := QRel.FieldByName('MODELO').AsString;
      QSped.ParamByName('ECF_FAB').AsString := QRel.FieldByName('SERIAL').AsString;
      QSped.ParamByName('ECF_CX').AsString  := QRel.FieldByName('NUM_ECF').AsString;

      QSped.Prepare;
      QSped.ExecSql;



      QDetalhe.Sql.Clear;
      QDetalhe.Sql.Add('SELECT * FROM REGISTRO_60M');
      QDetalhe.Sql.Add('WHERE');
      QDetalhe.Sql.Add('(DT_EMISSAO BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QDetalhe.Sql.Add('AND (NUM_SERIE = :NUM_SERIE)');
      QDetalhe.Sql.Add('ORDER BY DT_EMISSAO');

      QDetalhe.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
      QDetalhe.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
      QDetalhe.ParamByName('NUM_SERIE').AsString    := QRel.FieldByName('SERIAL').AsString;

      QDetalhe.Prepare;
      QDetalhe.Open;

      while not QDetalhe.Eof do
      begin
        QSped.Sql.Clear;
        QSped.Sql.Add('SELECT GEN_ID(GEN_REG_C405, 0) FROM RDB$DATABASE');

        QSped.Prepare;
        QSped.Open;

        Id_Sub_Detalhe := (QSped.Fields[0].AsInteger + 1);

        QSped.Sql.Clear;
        QSped.Sql.Add('SET GENERATOR GEN_REG_C405 TO ' + IntToStr(Id_Sub_Detalhe));

        QSped.Prepare;
        QSped.ExecSql;



        QSped.Sql.Clear;
        QSped.Sql.Add('INSERT INTO REG_C405(' +
                      'ID,   ID_PAI,       ID_DETALHE, ' +
                      'REG,  DT_DOC,       CRO, ' +
                      'CRZ,  NUM_COO_FIN,  GT_FIN, ' +
                      'VL_BRT) VALUES(' +
                      ':ID,  :ID_PAI,      :ID_DETALHE, ' +
                      ':REG, :DT_DOC,      :CRO, ' +
                      ':CRZ, :NUM_COO_FIN, :GT_FIN, ' +
                      ':VL_BRT)');

        QSped.ParamByName('ID').AsInteger         := Id_Sub_Detalhe;
        QSped.ParamByName('ID_PAI').AsInteger     := Id_Pai;
        QSped.ParamByName('ID_DETALHE').AsInteger := Id_Detalhe;
        QSped.ParamByName('REG').AsString         := 'C405';
        QSped.ParamByName('DT_DOC').AsDateTime    := QDetalhe.FieldByName('DT_EMISSAO').AsDateTime;
        QSped.ParamByName('CRO').AsString         := QDetalhe.FieldByName('CRO').AsString;
        QSped.ParamByName('CRZ').AsString         := QDetalhe.FieldByName('CRZ').AsString;
        QSped.ParamByName('NUM_COO_FIN').AsString := QDetalhe.FieldByName('COO_FINAL').AsString;
        QSped.ParamByName('GT_FIN').AsFloat       := QDetalhe.FieldByName('GRANDE_TOTAL').AsFloat;
        QSped.ParamByName('VL_BRT').AsFloat       := QDetalhe.FieldByName('VENDA_BRUTA').AsFloat;

        QSped.Prepare;
        QSped.ExecSql;



        QSub_Detalhe.Sql.Clear;
        QSub_Detalhe.Sql.Add('SELECT PRODUTOS.PRODUTO_ID, PRODUTOS.CST_PIS, PRODUTOS.PIS, SUM(REGISTRO_60D.VR_UNITARIO) VR_UNITARIO');
        QSub_Detalhe.Sql.Add('FROM REGISTRO_60D');
        QSub_Detalhe.Sql.Add('LEFT JOIN PRODUTOS');
        QSub_Detalhe.Sql.Add('ON (REGISTRO_60D.COD_PRODUTO = PRODUTOS.COD_BARRA)');
        QSub_Detalhe.Sql.Add('WHERE');
        QSub_Detalhe.Sql.Add('(REGISTRO_60D.DT_EMISSAO = :DT_EMISSAO)');
        QSub_Detalhe.Sql.Add('AND (REGISTRO_60D.NUM_SERIE = :NUM_SERIE)');
        QSub_Detalhe.Sql.Add('AND (REGISTRO_60D.SIT_TRIBUTARIA <> :SIT_TRIBUTARIA)');
        QSub_Detalhe.Sql.Add('GROUP BY PRODUTOS.PRODUTO_ID, PRODUTOS.CST_PIS, PRODUTOS.PIS');

        QSub_Detalhe.ParamByName('DT_EMISSAO').AsDateTime   := QDetalhe.FieldByName('DT_EMISSAO').AsDateTime;
        QSub_Detalhe.ParamByName('NUM_SERIE').AsString      := QRel.FieldByName('SERIAL').AsString;
        QSub_Detalhe.ParamByName('SIT_TRIBUTARIA').AsString := 'CANC';

        QSub_Detalhe.Prepare;
        QSub_Detalhe.Open;

        QSub_Detalhe.First;
        while not QSub_Detalhe.Eof do
        begin
          QProduto.Sql.Clear;
          QProduto.Sql.Add('SELECT * FROM PRODUTOS');
          QProduto.Sql.Add('WHERE');
          QProduto.Sql.Add('(PRODUTO_ID = :PRODUTO_ID)');

          QProduto.ParamByName('PRODUTO_ID').AsInteger := QSub_Detalhe.FieldByName('PRODUTO_ID').AsInteger;

          QProduto.Prepare;
          QProduto.Open;

          QSped.Sql.Clear;
          QSped.Sql.Add('INSERT INTO REG_C481(' +
                        'ID_PAI,    ID_DETALHE,    REG, ' +
                        'CST_PIS,   VL_ITEM,       VL_BC_PIS, ' +
                        'ALIQ_PIS,  QUANT_BC_PIS,  ALIQ_PIS_QUANT, ' +
                        'VL_PIS,    COD_ITEM,      COD_CTA, ' +
                        'NAT_REC) VALUES(' +
                        ':ID_PAI,   :ID_DETALHE,   :REG, ' +
                        ':CST_PIS,  :VL_ITEM,      :VL_BC_PIS, ' +
                        ':ALIQ_PIS, :QUANT_BC_PIS, :ALIQ_PIS_QUANT, ' +
                        ':VL_PIS,   :COD_ITEM,     :COD_CTA, ' +
                        ':NAT_REC)');

          QSped.ParamByName('ID_PAI').AsInteger     := Id_Pai;
          QSped.ParamByName('ID_DETALHE').AsInteger := Id_Sub_Detalhe;
          QSped.ParamByName('REG').AsString         := 'C481';
          QSped.ParamByName('CST_PIS').AsString     := QSub_Detalhe.FieldByName('CST_PIS').AsString;
          QSped.ParamByName('VL_ITEM').AsFloat      := QSub_Detalhe.FieldByName('VR_UNITARIO').AsFloat;

          if QSub_Detalhe.FieldByName('PIS').AsFloat > 0 then
            QSped.ParamByName('VL_BC_PIS').AsFloat := QSub_Detalhe.FieldByName('VR_UNITARIO').AsFloat
          else
            QSped.ParamByName('VL_BC_PIS').AsFloat := 0;

          QSped.ParamByName('ALIQ_PIS').AsFloat       := QSub_Detalhe.FieldByName('PIS').AsFloat;
          QSped.ParamByName('QUANT_BC_PIS').AsFloat   := 0;
          QSped.ParamByName('ALIQ_PIS_QUANT').AsFloat := 0;
          QSped.ParamByName('VL_PIS').AsFloat         := RoundTo(((QSub_Detalhe.FieldByName('VR_UNITARIO').AsFloat * QSub_Detalhe.FieldByName('PIS').AsFloat) / 100), -2);
          QSped.ParamByName('COD_ITEM').AsString      := StrZero(QSub_Detalhe.FieldByName('PRODUTO_ID').AsString, 6, 0);
          QSped.ParamByName('COD_CTA').AsString       := '';
          QSped.ParamByName('NAT_REC').AsString       := QProduto.FieldByName('NAT_REC').AsString;

          QSped.Prepare;
          QSped.ExecSql;



          Label1.Caption := QSub_Detalhe.FieldByName('PRODUTO_ID').AsString;

          Application.ProcessMessages;
          QSub_Detalhe.Next;
        end;

        QSub_Detalhe.Sql.Clear;
        QSub_Detalhe.Sql.Add('SELECT PRODUTOS.PRODUTO_ID, PRODUTOS.CST_COFINS, PRODUTOS.COFINS, SUM(REGISTRO_60D.VR_UNITARIO) VR_UNITARIO');
        QSub_Detalhe.Sql.Add('FROM REGISTRO_60D');
        QSub_Detalhe.Sql.Add('LEFT JOIN PRODUTOS');
        QSub_Detalhe.Sql.Add('ON (REGISTRO_60D.COD_PRODUTO = PRODUTOS.COD_BARRA)');
        QSub_Detalhe.Sql.Add('WHERE');
        QSub_Detalhe.Sql.Add('(REGISTRO_60D.DT_EMISSAO = :DT_EMISSAO)');
        QSub_Detalhe.Sql.Add('AND (REGISTRO_60D.NUM_SERIE = :NUM_SERIE)');
        QSub_Detalhe.Sql.Add('AND (REGISTRO_60D.SIT_TRIBUTARIA <> :SIT_TRIBUTARIA)');
        QSub_Detalhe.Sql.Add('GROUP BY PRODUTOS.PRODUTO_ID, PRODUTOS.CST_COFINS, PRODUTOS.COFINS');

        QSub_Detalhe.ParamByName('DT_EMISSAO').AsDateTime   := QDetalhe.FieldByName('DT_EMISSAO').AsDateTime;
        QSub_Detalhe.ParamByName('NUM_SERIE').AsString      := QRel.FieldByName('SERIAL').AsString;
        QSub_Detalhe.ParamByName('SIT_TRIBUTARIA').AsString := 'CANC';

        QSub_Detalhe.Prepare;
        QSub_Detalhe.Open;

        QSub_Detalhe.First;
        while not QSub_Detalhe.Eof do
        begin
          QProduto.Sql.Clear;
          QProduto.Sql.Add('SELECT * FROM PRODUTOS');
          QProduto.Sql.Add('WHERE');
          QProduto.Sql.Add('(PRODUTO_ID = :PRODUTO_ID)');

          QProduto.ParamByName('PRODUTO_ID').AsInteger := QSub_Detalhe.FieldByName('PRODUTO_ID').AsInteger;

          QProduto.Prepare;
          QProduto.Open;

          QSped.Sql.Clear;
          QSped.Sql.Add('INSERT INTO REG_C485(' +
                        'ID_PAI,       ID_DETALHE,       REG, ' +
                        'CST_COFINS,   VL_ITEM,          VL_BC_COFINS, ' +
                        'ALIQ_COFINS,  QUANT_BC_COFINS,  ALIQ_COFINS_QUANT, ' +
                        'VL_COFINS,    COD_ITEM,         COD_CTA, ' +
                        'NAT_REC) VALUES(' +
                        ':ID_PAI,      :ID_DETALHE,      :REG, ' +
                        ':CST_COFINS,  :VL_ITEM,         :VL_BC_COFINS, ' +
                        ':ALIQ_COFINS, :QUANT_BC_COFINS, :ALIQ_COFINS_QUANT, ' +
                        ':VL_COFINS,   :COD_ITEM,        :COD_CTA, ' +
                        ':NAT_REC)');

          QSped.ParamByName('ID_PAI').AsInteger     := Id_Pai;
          QSped.ParamByName('ID_DETALHE').AsInteger := Id_Sub_Detalhe;
          QSped.ParamByName('REG').AsString         := 'C485';
          QSped.ParamByName('CST_COFINS').AsString  := QSub_Detalhe.FieldByName('CST_COFINS').AsString;
          QSped.ParamByName('VL_ITEM').AsFloat      := QSub_Detalhe.FieldByName('VR_UNITARIO').AsFloat;

          if QSub_Detalhe.FieldByName('COFINS').AsFloat > 0 then
            QSped.ParamByName('VL_BC_COFINS').AsFloat := QSub_Detalhe.FieldByName('VR_UNITARIO').AsFloat
          else
            QSped.ParamByName('VL_BC_COFINS').AsFloat := 0;

          QSped.ParamByName('ALIQ_COFINS').AsFloat       := QSub_Detalhe.FieldByName('COFINS').AsFloat;
          QSped.ParamByName('QUANT_BC_COFINS').AsFloat   := 0;
          QSped.ParamByName('ALIQ_COFINS_QUANT').AsFloat := 0;
          QSped.ParamByName('VL_COFINS').AsFloat         := RoundTo(((QSub_Detalhe.FieldByName('VR_UNITARIO').AsFloat * QSub_Detalhe.FieldByName('COFINS').AsFloat) / 100), -2);
          QSped.ParamByName('COD_ITEM').AsString         := StrZero(QSub_Detalhe.FieldByName('PRODUTO_ID').AsString, 6, 0);
          QSped.ParamByName('COD_CTA').AsString          := '';
          QSped.ParamByName('NAT_REC').AsString          := QProduto.FieldByName('NAT_REC').AsString;

          QSped.Prepare;
          QSped.ExecSql;



          Label1.Caption := QSub_Detalhe.FieldByName('PRODUTO_ID').AsString;

          Application.ProcessMessages;
          QSub_Detalhe.Next;
        end;

        Label1.Caption := QDetalhe.FieldByName('CRO').AsString;

        Application.ProcessMessages;
        QDetalhe.Next;
      end;

      Label1.Caption := QRel.FieldByName('SERIAL').AsString;

      Application.ProcessMessages;
      QRel.Next;
    end;

    Label1.Caption := 'Aguarde...';

    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT * FROM TRANSACOES');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
    QRel.Sql.Add('AND (EMPRESA_ID = :EMPRESA_ID)');
    QRel.Sql.Add('AND (TPCTB <= :TPCTB)');
    QRel.Sql.Add('AND ((MODELO = :MODELO1) OR (MODELO = :MODELO2) OR (MODELO = :MODELO3))');
    QRel.Sql.Add('ORDER BY NUM_DOC');

    QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
    QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    QRel.ParamByName('MODELO1').AsString      := '06';
    QRel.ParamByName('MODELO2').AsString      := '28';
    QRel.ParamByName('MODELO3').AsString      := '29';

    QRel.Prepare;
    QRel.Open;

    QRel.First;
    while not QRel.Eof do
    begin
      QSped.Sql.Clear;
      QSped.Sql.Add('SELECT GEN_ID(GEN_REG_C500, 0) FROM RDB$DATABASE');

      QSped.Prepare;
      QSped.Open;

      Id_Detalhe := (QSped.Fields[0].AsInteger + 1);

      QSped.Sql.Clear;
      QSped.Sql.Add('SET GENERATOR GEN_REG_C500 TO ' + IntToStr(Id_Detalhe));

      QSped.Prepare;
      QSped.ExecSql;



      QSped.Sql.Clear;
      QSped.Sql.Add('INSERT INTO REG_C500(' +
                    'ID,        ID_PAI,    REG, ' +
                    'COD_PART,  COD_MOD,   COD_SIT, ' +
                    'SER,       SUB,       NUM_DOC, ' +
                    'DT_DOC,    DT_E_S,    VL_DOC, ' +
                    'VL_ICMS,   COD_INF,   VL_PIS, ' +
                    'VL_COFINS) VALUES(' +
                    ':ID,       :ID_PAI,   :REG, ' +
                    ':COD_PART, :COD_MOD,  :COD_SIT, ' +
                    ':SER,      :SUB,      :NUM_DOC, ' +
                    ':DT_DOC,   :DT_E_S,   :VL_DOC, ' +
                    ':VL_ICMS,  :COD_INF,  :VL_PIS, ' +
                    ':VL_COFINS)');

      QSped.ParamByName('ID').AsInteger      := Id_Detalhe;
      QSped.ParamByName('ID_PAI').AsInteger  := Id_Pai;
      QSped.ParamByName('REG').AsString      := 'C500';
      QSped.ParamByName('COD_PART').AsString := 'F' + StrZero(QRel.FieldByName('FORNECEDOR_ID').AsString, 6, 0);
      QSped.ParamByName('COD_MOD').AsString  := QRel.FieldByName('MODELO').AsString;
      QSped.ParamByName('COD_SIT').AsString  := '00';
      QSped.ParamByName('SER').AsString      := QRel.FieldByName('SERIE').AsString;
      QSped.ParamByName('SUB').AsString      := QRel.FieldByName('SUB_SERIE').AsString;
      QSped.ParamByName('NUM_DOC').AsString  := QRel.FieldByName('NUM_DOC').AsString;
      QSped.ParamByName('DT_DOC').AsDateTime := QRel.FieldByName('DT_TRANS').AsDateTime;
      QSped.ParamByName('DT_E_S').AsDateTime := QRel.FieldByName('DT_TRANS').AsDateTime;
      QSped.ParamByName('VL_DOC').AsFloat    := QRel.FieldByName('VALOR').AsFloat;
      QSped.ParamByName('VL_ICMS').AsFloat   := QRel.FieldByName('VR_ICMS_NORMAL').AsFloat;
      QSped.ParamByName('COD_INF').AsString  := '';
      QSped.ParamByName('VL_PIS').AsFloat    := QRel.FieldByName('VR_PIS').AsFloat;
      QSped.ParamByName('VL_COFINS').AsFloat := QRel.FieldByName('VR_COFINS').AsFloat;

      QSped.Prepare;
      QSped.ExecSql;



      QSped.Sql.Clear;
      QSped.Sql.Add('INSERT INTO REG_C501(' +
                    'ID_PAI,     ID_DETALHE,  REG, ' +
                    'CST_PIS,    VL_ITEM,     NAT_BC_CRED, ' +
                    'VL_BC_PIS,  ALIQ_PIS,    VL_PIS, ' +
                    'COD_CTA) VALUES(' +
                    ':ID_PAI,    :ID_DETALHE, :REG, ' +
                    ':CST_PIS,   :VL_ITEM,    :NAT_BC_CRED, ' +
                    ':VL_BC_PIS, :ALIQ_PIS,   :VL_PIS, ' +
                    ':COD_CTA)');

      QSped.ParamByName('ID_PAI').AsInteger     := Id_Pai;
      QSped.ParamByName('ID_DETALHE').AsInteger := Id_Detalhe;
      QSped.ParamByName('REG').AsString         := 'C501';
      QSped.ParamByName('CST_PIS').AsString     := QRel.FieldByName('CST_PIS').AsString;
      QSped.ParamByName('VL_ITEM').AsFloat      := QRel.FieldByName('VALOR').AsFloat;
      QSped.ParamByName('NAT_BC_CRED').AsString := QRel.FieldByName('NAT_REC').AsString;
      QSped.ParamByName('VL_BC_PIS').AsFloat    := QRel.FieldByName('BASE_CALC_PIS').AsFloat;
      QSped.ParamByName('ALIQ_PIS').AsFloat     := QRel.FieldByName('ALIQUOTA_PIS').AsFloat;
      QSped.ParamByName('VL_PIS').AsFloat       := QRel.FieldByName('VR_PIS').AsFloat;
      QSped.ParamByName('COD_CTA').AsString     := '';

      QSped.Prepare;
      QSped.ExecSql;



      QSped.Sql.Clear;
      QSped.Sql.Add('INSERT INTO REG_C505(' +
                    'ID_PAI,        ID_DETALHE,   REG, ' +
                    'CST_COFINS,    VL_ITEM,      NAT_BC_CRED, ' +
                    'VL_BC_COFINS,  ALIQ_COFINS,  VL_COFINS, ' +
                    'COD_CTA) VALUES(' +
                    ':ID_PAI,       :ID_DETALHE,  :REG, ' +
                    ':CST_COFINS,   :VL_ITEM,     :NAT_BC_CRED, ' +
                    ':VL_BC_COFINS, :ALIQ_COFINS, :VL_COFINS, ' +
                    ':COD_CTA)');

      QSped.ParamByName('ID_PAI').AsInteger     := Id_Pai;
      QSped.ParamByName('ID_DETALHE').AsInteger := Id_Detalhe;
      QSped.ParamByName('REG').AsString         := 'C505';
      QSped.ParamByName('CST_COFINS').AsString  := QRel.FieldByName('CST_COFINS').AsString;
      QSped.ParamByName('VL_ITEM').AsFloat      := QRel.FieldByName('VALOR').AsFloat;
      QSped.ParamByName('NAT_BC_CRED').AsString := QRel.FieldByName('NAT_REC').AsString;
      QSped.ParamByName('VL_BC_COFINS').AsFloat := QRel.FieldByName('BASE_CALC_COFINS').AsFloat;
      QSped.ParamByName('ALIQ_COFINS').AsFloat  := QRel.FieldByName('ALIQUOTA_COFINS').AsFloat;
      QSped.ParamByName('VL_COFINS').AsFloat    := QRel.FieldByName('VR_COFINS').AsFloat;
      QSped.ParamByName('COD_CTA').AsString     := '';

      QSped.Prepare;
      QSped.ExecSql;



      Label1.Caption := QRel.FieldByName('TRANSACAO_ID').AsString;

      Application.ProcessMessages;
      QRel.Next;
    end;

    Label1.Caption := 'Aguarde...';

    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT * FROM TRANSACOES');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
    QRel.Sql.Add('AND (EMPRESA_ID = :EMPRESA_ID)');
    QRel.Sql.Add('AND (TPCTB <= :TPCTB)');
    QRel.Sql.Add('AND ((MODELO = :MODELO1) OR (MODELO = :MODELO2) OR (MODELO = :MODELO3) OR (MODELO = :MODELO4) OR (MODELO = :MODELO5) OR (MODELO = :MODELO6) OR (MODELO = :MODELO7) OR (MODELO = :MODELO8) OR (MODELO = :MODELO9) OR (MODELO = :MODELOA) OR (MODELO = :MODELOB))');

    QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
    QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    QRel.ParamByName('MODELO1').AsString      := '07';
    QRel.ParamByName('MODELO2').AsString      := '08';
    QRel.ParamByName('MODELO3').AsString      := '8B';
    QRel.ParamByName('MODELO4').AsString      := '09';
    QRel.ParamByName('MODELO5').AsString      := '10';
    QRel.ParamByName('MODELO6').AsString      := '11';
    QRel.ParamByName('MODELO7').AsString      := '26';
    QRel.ParamByName('MODELO8').AsString      := '27';
    QRel.ParamByName('MODELO9').AsString      := '57';
    QRel.ParamByName('MODELOA').AsString      := '21';
    QRel.ParamByName('MODELOB').AsString      := '22';

    QRel.Prepare;
    QRel.Open;

    QRel.First;
    while not QRel.Eof do
    begin
      if (QRel.FieldByName('MODELO').AsString = '07') or (QRel.FieldByName('MODELO').AsString = '08') or
         (QRel.FieldByName('MODELO').AsString = '8B') or (QRel.FieldByName('MODELO').AsString = '09') or
         (QRel.FieldByName('MODELO').AsString = '10') or (QRel.FieldByName('MODELO').AsString = '11') or
         (QRel.FieldByName('MODELO').AsString = '26') or (QRel.FieldByName('MODELO').AsString = '27') or
         (QRel.FieldByName('MODELO').AsString = '57') then
      begin
        QSped.Sql.Clear;
        QSped.Sql.Add('SELECT GEN_ID(GEN_REG_D100, 0) FROM RDB$DATABASE');

        QSped.Prepare;
        QSped.Open;

        Id_Detalhe := (QSped.Fields[0].AsInteger + 1);

        QSped.Sql.Clear;
        QSped.Sql.Add('SET GENERATOR GEN_REG_D100 TO ' + IntToStr(Id_Detalhe));

        QSped.Prepare;
        QSped.ExecSql;



        QSped.Sql.Clear;
        QSped.Sql.Add('INSERT INTO REG_D100(' +
                      'ID_PAI,    REG,         IND_OPER, ' +
                      'IND_EMIT,  COD_PART,    COD_MOD, '+
                      'COD_SIT,   SER,         SUB, ' +
                      'NUM_DOC,   CHV_CTE,     DT_DOC, ' +
                      'DT_A_P,    TP_CTE,      CHV_CTE_REF, ' +
                      'VL_DOC,    VL_DESC,     IND_FRT, ' +
                      'VL_SERV,   VL_BC_ICMS,  VL_ICMS, ' +
                      'VL_NT,     COD_INF,     COD_CTA, ' +
                      'ID) VALUES(' +
                      ':ID_PAI,   :REG,        :IND_OPER, ' +
                      ':IND_EMIT, :COD_PART,   :COD_MOD, '+
                      ':COD_SIT,  :SER,        :SUB, ' +
                      ':NUM_DOC,  :CHV_CTE,    :DT_DOC, ' +
                      ':DT_A_P,   :TP_CTE,     :CHV_CTE_REF, ' +
                      ':VL_DOC,   :VL_DESC,    :IND_FRT, ' +
                      ':VL_SERV,  :VL_BC_ICMS, :VL_ICMS, ' +
                      ':VL_NT,    :COD_INF,    :COD_CTA, ' +
                      ':ID)');

        QSped.ParamByName('ID').AsInteger         := Id_Detalhe;
        QSped.ParamByName('ID_PAI').AsInteger     := Id_Pai;
        QSped.ParamByName('REG').AsString         := 'D100';
        QSped.ParamByName('IND_OPER').AsString    := '0';
        QSped.ParamByName('IND_EMIT').AsString    := '1';
        QSped.ParamByName('COD_PART').AsString    := 'F' + StrZero(QRel.FieldByName('FORNECEDOR_ID').AsString, 6, 0);
        QSped.ParamByName('COD_MOD').AsString     := QRel.FieldByName('MODELO').AsString;
        QSped.ParamByName('COD_SIT').AsString     := '00';
        QSped.ParamByName('SER').AsString         := QRel.FieldByName('SERIE').AsString;
        QSped.ParamByName('SUB').AsString         := QRel.FieldByName('SUB_SERIE').AsString;
        QSped.ParamByName('NUM_DOC').AsString     := QRel.FieldByName('NUM_DOC').AsString;
        QSped.ParamByName('CHV_CTE').AsString     := '';
        QSped.ParamByName('DT_DOC').AsDateTime    := QRel.FieldByName('DT_TRANS').AsDateTime;
        QSped.ParamByName('DT_A_P').AsDateTime    := QRel.FieldByName('DT_TRANS').AsDateTime;
        QSped.ParamByName('TP_CTE').AsString      := '';
        QSped.ParamByName('CHV_CTE_REF').AsString := '';
        QSped.ParamByName('VL_DOC').AsFloat       := QRel.FieldByName('VALOR').AsFloat;
        QSped.ParamByName('VL_DESC').AsFloat      := 0;
        QSped.ParamByName('IND_FRT').AsString     := '9';
        QSped.ParamByName('VL_SERV').AsFloat      := QRel.FieldByName('VALOR').AsFloat;
        QSped.ParamByName('VL_BC_ICMS').AsFloat   := QRel.FieldByName('BASE_ICMS_NORMAL').AsFloat;
        QSped.ParamByName('VL_ICMS').AsFloat      := QRel.FieldByName('VR_ICMS_NORMAL').AsFloat;
        QSped.ParamByName('VL_NT').AsFloat        := 0;
        QSped.ParamByName('COD_INF').AsString     := '';
        QSped.ParamByName('COD_CTA').AsString     := '';

        QSped.Prepare;
        QSped.ExecSql;



        QSped.Sql.Clear;
        QSped.Sql.Add('INSERT INTO REG_D101(' +
                      'ID_PAI,       ID_DETALHE,  REG, ' +
                      'IND_NAT_FRT,  VL_ITEM,     CST_PIS, ' +
                      'NAT_BC_CRED,  VL_BC_PIS,   ALIQ_PIS, ' +
                      'VL_PIS,       COD_CTA) VALUES(' +
                      ':ID_PAI,      :ID_DETALHE, :REG, ' +
                      ':IND_NAT_FRT, :VL_ITEM,    :CST_PIS, ' +
                      ':NAT_BC_CRED, :VL_BC_PIS,  :ALIQ_PIS, ' +
                      ':VL_PIS,      :COD_CTA)');

        QSped.ParamByName('ID_PAI').AsInteger     := Id_Pai;
        QSped.ParamByName('ID_DETALHE').AsInteger := ID_Detalhe;
        QSped.ParamByName('REG').AsString         := 'D101';
        QSped.ParamByName('IND_NAT_FRT').AsString := '';
        QSped.ParamByName('VL_ITEM').AsFloat      := QRel.FieldByName('VALOR').AsFloat;
        QSped.ParamByName('CST_PIS').AsString     := QRel.FieldByName('CST_PIS').AsString;
        QSped.ParamByName('NAT_BC_CRED').AsString := QRel.FieldByName('NAT_REC').AsString;
        QSped.ParamByName('VL_BC_PIS').AsFloat    := QRel.FieldByName('BASE_CALC_PIS').AsFloat;
        QSped.ParamByName('ALIQ_PIS').AsFloat     := QRel.FieldByName('ALIQUOTA_PIS').AsFloat;
        QSped.ParamByName('VL_PIS').AsFloat       := QRel.FieldByName('VR_PIS').AsFloat;
        QSped.ParamByName('COD_CTA').AsString     := '';

        QSped.Prepare;
        QSped.ExecSql;



        QSped.Sql.Clear;
        QSped.Sql.Add('INSERT INTO REG_D105(' +
                      'ID_PAI,       ID_DETALHE,    REG, ' +
                      'IND_NAT_FRT,  VL_ITEM,       CST_COFINS, ' +
                      'NAT_BC_CRED,  VL_BC_COFINS,  ALIQ_COFINS, ' +
                      'VL_COFINS,    COD_CTA) VALUES(' +
                      ':ID_PAI,      :ID_DETALHE,   :REG, ' +
                      ':IND_NAT_FRT, :VL_ITEM,      :CST_COFINS, ' +
                      ':NAT_BC_CRED, :VL_BC_COFINS, :ALIQ_COFINS, ' +
                      ':VL_COFINS,   :COD_CTA)');

        QSped.ParamByName('ID_PAI').AsInteger     := Id_Pai;
        QSped.ParamByName('ID_DETALHE').AsInteger := Id_Detalhe;
        QSped.ParamByName('REG').AsString         := 'D105';
        QSped.ParamByName('IND_NAT_FRT').AsString := '';
        QSped.ParamByName('VL_ITEM').AsFloat      := QRel.FieldByName('VALOR').AsFloat;
        QSped.ParamByName('CST_COFINS').AsString  := QRel.FieldByName('CST_COFINS').AsString;
        QSped.ParamByName('NAT_BC_CRED').AsString := QRel.FieldByName('NAT_REC').AsString;
        QSped.ParamByName('VL_BC_COFINS').AsFloat := QRel.FieldByName('BASE_CALC_COFINS').AsFloat;
        QSped.ParamByName('ALIQ_COFINS').AsFloat  := QRel.FieldByName('ALIQUOTA_COFINS').AsFloat;
        QSped.ParamByName('VL_COFINS').AsFloat    := QRel.FieldByName('VR_COFINS').AsFloat;
        QSped.ParamByName('COD_CTA').AsString     := '';

        QSped.Prepare;
        QSped.ExecSql;



        QSped.Sql.Clear;
        QSped.Sql.Add('INSERT INTO REG_D200(' +
                      'ID_PAI,   ID_DETALHE,   REG, ' +
                      'COD_MOD,  COD_SIT,      SER, ' +
                      'SUB,      NUM_DOC_INI,  NUM_DOC_FIN, ' +
                      'CFOP,     DT_REF,       VL_DOC, ' +
                      'VL_DESC) VALUES(' +
                      ':ID_PAI,  :ID_DETALHE,  :REG, ' +
                      ':COD_MOD, :COD_SIT,     :SER, ' +
                      ':SUB,     :NUM_DOC_INI, :NUM_DOC_FIN, ' +
                      ':CFOP,    :DT_REF,      :VL_DOC, ' +
                      ':VL_DESC)');

        QSped.ParamByName('ID_PAI').AsInteger     := Id_Pai;
        QSped.ParamByName('ID_DETALHE').AsInteger := Id_Detalhe;
        QSped.ParamByName('REG').AsString         := 'D200';
        QSped.ParamByName('COD_MOD').AsString     := QRel.FieldByName('MODELO').AsString;
        QSped.ParamByName('COD_SIT').AsString     := '00';
        QSped.ParamByName('SER').AsString         := QRel.FieldByName('SERIE').AsString;
        QSped.ParamByName('SUB').AsString         := QRel.FieldByName('SUB_SERIE').AsString;
        QSped.ParamByName('NUM_DOC_INI').AsString := '000000001';
        QSped.ParamByName('NUM_DOC_FIN').AsString := '999999999';
        QSped.ParamByName('CFOP').AsString        := QRel.FieldByName('CFOP').AsString;
        QSped.ParamByName('DT_REF').AsDateTime    := QRel.FieldByName('DT_TRANS').AsDateTime;
        QSped.ParamByName('VL_DOC').AsFloat       := QRel.FieldByName('VALOR').AsFloat;
        QSped.ParamByName('VL_DESC').AsFloat      := 0;

        QSped.Prepare;
        QSped.ExecSql;



        QSped.Sql.Clear;
        QSped.Sql.Add('INSERT INTO REG_D201(' +
                      'ID_PAI,    ID_DETALHE,  REG, ' +
                      'CST_PIS,   VL_ITEM,     VL_BC_PIS, ' +
                      'ALIQ_PIS,  VL_PIS,      COD_CTA) VALUES(' +
                      ':ID_PAI,   :ID_DETALHE, :REG, ' +
                      ':CST_PIS,  :VL_ITEM,    :VL_BC_PIS, ' +
                      ':ALIQ_PIS, :VL_PIS,     :COD_CTA)');

        QSped.ParamByName('ID_PAI').AsInteger     := Id_Pai;
        QSped.ParamByName('ID_DETALHE').AsInteger := Id_Detalhe;
        QSped.ParamByName('REG').AsString         := 'D201';
        QSped.ParamByName('CST_PIS').AsString     := QRel.FieldByName('CST_PIS').AsString;
        QSped.ParamByName('VL_ITEM').AsFloat      := QRel.FieldByName('VALOR').AsFloat;
        QSped.ParamByName('VL_BC_PIS').AsFloat    := QRel.FieldByName('BASE_CALC_PIS').AsFloat;
        QSped.ParamByName('ALIQ_PIS').AsFloat     := QRel.FieldByName('ALIQUOTA_PIS').AsFloat;
        QSped.ParamByName('VL_PIS').AsFloat       := QRel.FieldByName('VR_PIS').AsFloat;
        QSped.ParamByName('COD_CTA').AsString     := '';

        QSped.Prepare;
        QSped.ExecSql;



        QSped.Sql.Clear;
        QSped.Sql.Add('INSERT INTO REG_D205(' +
                      'ID_PAI,       ID_DETALHE,  REG, ' +
                      'CST_COFINS,   VL_ITEM,     VL_BC_COFINS, ' +
                      'ALIQ_COFINS,  VL_COFINS,   COD_CTA) VALUES(' +
                      ':ID_PAI,      :ID_DETALHE, :REG, ' +
                      ':CST_COFINS,  :VL_ITEM,    :VL_BC_COFINS, ' +
                      ':ALIQ_COFINS, :VL_COFINS,  :COD_CTA)');

        QSped.ParamByName('ID_PAI').AsInteger     := Id_Pai;
        QSped.ParamByName('ID_DETALHE').AsInteger := Id_Detalhe;
        QSped.ParamByName('REG').AsString         := 'D205';
        QSped.ParamByName('CST_COFINS').AsString  := QRel.FieldByName('CST_COFINS').AsString;
        QSped.ParamByName('VL_ITEM').AsFloat      := QRel.FieldByName('VALOR').AsFloat;
        QSped.ParamByName('VL_BC_COFINS').AsFloat := QRel.FieldByName('BASE_CALC_COFINS').AsFloat;
        QSped.ParamByName('ALIQ_COFINS').AsFloat  := QRel.FieldByName('ALIQUOTA_COFINS').AsFloat;
        QSped.ParamByName('VL_COFINS').AsFloat    := QRel.FieldByName('VR_COFINS').AsFloat;
        QSped.ParamByName('COD_CTA').AsString     := '';

        QSped.Prepare;
        QSped.ExecSql;


      end;

      if (QRel.FieldByName('MODELO').AsString = '21') or (QRel.FieldByName('MODELO').AsString = '22') then
      begin
        QSped.Sql.Clear;
        QSped.Sql.Add('SELECT GEN_ID(GEN_REG_D500, 0) FROM RDB$DATABASE');

        QSped.Prepare;
        QSped.Open;

        Id_Detalhe := (QSped.Fields[0].AsInteger + 1);

        QSped.Sql.Clear;
        QSped.Sql.Add('SET GENERATOR GEN_REG_D500 TO ' + IntToStr(Id_Detalhe));

        QSped.Prepare;
        QSped.ExecSql;



        QSped.Sql.Clear;
        QSped.Sql.Add('INSERT INTO REG_D500(' +
                      'ID_PAI,      REG,        IND_OPER, ' +
                      'IND_EMIT,    COD_PART,   COD_MOD, ' +
                      'COD_SIT,     SER,        SUB, ' +
                      'NUM_DOC,     DT_DOC,     DT_A_P, ' +
                      'VL_DOC,      VL_DESC,    VL_SERV, ' +
                      'VL_SERV_NT,  VL_TERC,    VL_DA, ' +
                      'VL_BC_ICMS,  VL_ICMS,    COD_INF, ' +
                      'VL_PIS,      VL_COFINS,  ID) VALUES(' +
                      ':ID_PAI,     :REG,       :IND_OPER, ' +
                      ':IND_EMIT,   :COD_PART,  :COD_MOD, ' +
                      ':COD_SIT,    :SER,       :SUB, ' +
                      ':NUM_DOC,    :DT_DOC,    :DT_A_P, ' +
                      ':VL_DOC,     :VL_DESC,   :VL_SERV, ' +
                      ':VL_SERV_NT, :VL_TERC,   :VL_DA, ' +
                      ':VL_BC_ICMS, :VL_ICMS,   :COD_INF, ' +
                      ':VL_PIS,     :VL_COFINS, :ID)');

        QSped.ParamByName('ID').AsInteger       := Id_Detalhe;
        QSped.ParamByName('ID_PAI').AsInteger   := Id_Pai;
        QSped.ParamByName('REG').AsString       := 'D500';
        QSped.ParamByName('IND_OPER').AsString  := '0';
        QSped.ParamByName('IND_EMIT').AsString  := '1';
        QSped.ParamByName('COD_PART').AsString  := 'F' + StrZero(QRel.FieldByName('FORNECEDOR_ID').AsString, 6, 0);
        QSped.ParamByName('COD_MOD').AsString   := QRel.FieldByName('MODELO').AsString;
        QSped.ParamByName('COD_SIT').AsString   := '00';
        QSped.ParamByName('SER').AsString       := QRel.FieldByName('SERIE').AsString;
        QSped.ParamByName('SUB').AsString       := QRel.FieldByName('SUB_SERIE').AsString;
        QSped.ParamByName('NUM_DOC').AsString   := QRel.FieldByName('NUM_DOC').AsString;
        QSped.ParamByName('DT_DOC').AsDateTime  := QRel.FieldByName('DT_TRANS').AsDateTime;
        QSped.ParamByName('DT_A_P').AsDateTime  := QRel.FieldByName('DT_TRANS').AsDateTime;
        QSped.ParamByName('VL_DOC').AsFloat     := QRel.FieldByName('VALOR').AsFloat;
        QSped.ParamByName('VL_DESC').AsFloat    := 0;
        QSped.ParamByName('VL_SERV').AsFloat    := QRel.FieldByName('VALOR').AsFloat;
        QSped.ParamByName('VL_SERV_NT').AsFloat := 0;
        QSped.ParamByName('VL_TERC').AsFloat    := 0;
        QSped.ParamByName('VL_DA').AsFloat      := 0;
        QSped.ParamByName('VL_BC_ICMS').AsFloat := QRel.FieldByName('BASE_ICMS_NORMAL').AsFloat;
        QSped.ParamByName('VL_ICMS').AsFloat    := QRel.FieldByName('VR_ICMS_NORMAL').AsFloat;
        QSped.ParamByName('COD_INF').AsString   := '';
        QSped.ParamByName('VL_PIS').AsFloat     := QRel.FieldByName('VR_PIS').AsFloat;
        QSped.ParamByName('VL_COFINS').AsFloat  := QRel.FieldByName('VR_COFINS').AsFloat;

        QSped.Prepare;
        QSped.ExecSql;



        QSped.Sql.Clear;
        QSped.Sql.Add('INSERT INTO REG_D501(' +
                      'ID_PAI,     ID_DETALHE,  REG, ' +
                      'CST_PIS,    VL_ITEM,     NAT_BC_CRED, ' +
                      'VL_BC_PIS,  ALIQ_PIS,    VL_PIS, ' +
                      'COD_CTA) VALUES(' +
                      ':ID_PAI,    :ID_DETALHE, :REG, ' +
                      ':CST_PIS,   :VL_ITEM,    :NAT_BC_CRED, ' +
                      ':VL_BC_PIS, :ALIQ_PIS,   :VL_PIS, ' +
                      ':COD_CTA)');

        QSped.ParamByName('ID_PAI').AsInteger     := Id_Pai;
        QSped.ParamByName('ID_DETALHE').AsInteger := Id_Detalhe;
        QSped.ParamByName('REG').AsString         := 'D501';
        QSped.ParamByName('CST_PIS').AsString     := QRel.FieldByName('CST_PIS').AsString;
        QSped.ParamByName('VL_ITEM').AsFloat      := QRel.FieldByName('VALOR').AsFloat;
        QSped.ParamByName('NAT_BC_CRED').AsString := QRel.FieldByName('NAT_REC').AsString;
        QSped.ParamByName('VL_BC_PIS').AsFloat    := QRel.FieldByName('BASE_CALC_PIS').AsFloat;
        QSped.ParamByName('ALIQ_PIS').AsFloat     := QRel.FieldByName('ALIQUOTA_PIS').AsFloat;
        QSped.ParamByName('VL_PIS').AsFloat       := QRel.FieldByName('VR_PIS').AsFloat;
        QSped.ParamByName('COD_CTA').AsString     := '';

        QSped.Prepare;
        QSped.ExecSql;



        QSped.Sql.Clear;
        QSped.Sql.Add('INSERT INTO REG_D505(' +
                      'ID_PAI,        ID_DETALHE,   REG, ' +
                      'CST_COFINS,    VL_ITEM,      NAT_BC_CRED, ' +
                      'VL_BC_COFINS,  ALIQ_COFINS,  VL_COFINS, ' +
                      'COD_CTA) VALUES(' +
                      ':ID_PAI,       :ID_DETALHE,  :REG, ' +
                      ':CST_COFINS,   :VL_ITEM,     :NAT_BC_CRED, ' +
                      ':VL_BC_COFINS, :ALIQ_COFINS, :VL_COFINS, ' +
                      ':COD_CTA)');

        QSped.ParamByName('ID_PAI').AsInteger     := Id_Pai;
        QSped.ParamByName('ID_DETALHE').AsInteger := Id_Detalhe;
        QSped.ParamByName('REG').AsString         := 'D505';
        QSped.ParamByName('CST_COFINS').AsString  := QRel.FieldByName('CST_COFINS').AsString;
        QSped.ParamByName('VL_ITEM').AsFloat      := QRel.FieldByName('VALOR').AsFloat;
        QSped.ParamByName('NAT_BC_CRED').AsString := QRel.FieldByName('NAT_REC').AsString;
        QSped.ParamByName('VL_BC_COFINS').AsFloat := QRel.FieldByName('BASE_CALC_COFINS').AsFloat;
        QSped.ParamByName('ALIQ_COFINS').AsFloat  := QRel.FieldByName('ALIQUOTA_COFINS').AsFloat;
        QSped.ParamByName('VL_COFINS').AsFloat    := QRel.FieldByName('VR_COFINS').AsFloat;
        QSped.ParamByName('COD_CTA').AsString     := '';

        QSped.Prepare;
        QSped.ExecSql;



        QSped.Sql.Clear;
        QSped.Sql.Add('INSERT INTO REG_D600(' +
                      'ID_PAI,      REG,         COD_MOD, ' +
                      'COD_MUN,     SER,         SUB, ' +
                      'IND_REC,     QTD_CONS,    DT_DOC_INI, ' +
                      'DT_DOC_FIN,  VL_DOC,      VL_DESC, ' +
                      'VL_SERV,     VL_SERV_NT,  VL_TERC, ' +
                      'VL_DA,       VL_BC_ICMS,  VL_ICMS, ' +
                      'VL_PIS,      VL_COFINS,   ID_DETALHE) VALUES(' +
                      ':ID_PAI,     :REG,        :COD_MOD, ' +
                      ':COD_MUN,    :SER,        :SUB, ' +
                      ':IND_REC,    :QTD_CONS,   :DT_DOC_INI, ' +
                      ':DT_DOC_FIN, :VL_DOC,     :VL_DESC, ' +
                      ':VL_SERV,    :VL_SERV_NT, :VL_TERC, ' +
                      ':VL_DA,      :VL_BC_ICMS, :VL_ICMS, ' +
                      ':VL_PIS,     :VL_COFINS,  :ID_DETALHE)');

        QSped.ParamByName('ID_PAI').AsInteger      := Id_Pai;
        QSped.ParamByName('ID_DETALHE').AsInteger  := Id_Detalhe;
        QSped.ParamByName('REG').AsString          := 'D600';
        QSped.ParamByName('COD_MOD').AsString      := QRel.FieldByName('MODELO').AsString;
        QSped.ParamByName('COD_MUN').AsString      := '0';
        QSped.ParamByName('SER').AsString          := QRel.FieldByName('SERIE').AsString;
        QSped.ParamByName('SUB').AsString          := QRel.FieldByName('SUB_SERIE').AsString;
        QSped.ParamByName('IND_REC').AsString      := '';
        QSped.ParamByName('QTD_CONS').AsString     := '0';
        QSped.ParamByName('DT_DOC_INI').AsDateTime := Dtmen.Date;
        QSped.ParamByName('DT_DOC_FIN').AsDateTime := Dtmai.Date;
        QSped.ParamByName('VL_DOC').AsFloat        := QRel.FieldByName('VALOR').AsFloat;
        QSped.ParamByName('VL_DESC').AsFloat       := 0;
        QSped.ParamByName('VL_SERV').AsFloat       := 0;
        QSped.ParamByName('VL_SERV_NT').AsFloat    := 0;
        QSped.ParamByName('VL_TERC').AsFloat       := 0;
        QSped.ParamByName('VL_DA').AsFloat         := 0;
        QSped.ParamByName('VL_BC_ICMS').AsFloat    := QRel.FieldByName('BASE_ICMS_NORMAL').AsFloat;
        QSped.ParamByName('VL_ICMS').AsFloat       := QRel.FieldByName('VR_ICMS_NORMAL').AsFloat;
        QSped.ParamByName('VL_PIS').AsFloat        := QRel.FieldByName('VR_PIS').AsFloat;
        QSped.ParamByName('VL_COFINS').AsFloat     := QRel.FieldByName('VR_COFINS').AsFloat;

        QSped.Prepare;
        QSped.ExecSql;



        QSped.Sql.Clear;
        QSped.Sql.Add('INSERT INTO REG_D601(' +
                      'ID_PAI,     ID_DETALHE,  REG, ' +
                      'COD_CLASS,  VL_ITEM,     VL_DESC, ' +
                      'CST_PIS,    VL_BC_PIS,   ALIQ_PIS, ' +
                      'VL_PIS,     COD_CTA) VALUES(' +
                      ':ID_PAI,    :ID_DETALHE, :REG, ' +
                      ':COD_CLASS, :VL_ITEM,    :VL_DESC, ' +
                      ':CST_PIS,   :VL_BC_PIS,  :ALIQ_PIS, ' +
                      ':VL_PIS,    :COD_CTA)');

        QSped.ParamByName('ID_PAI').AsInteger     := Id_Pai;
        QSped.ParamByName('ID_DETALHE').AsInteger := Id_Detalhe;
        QSped.ParamByName('REG').AsString         := 'D601';
        QSped.ParamByName('COD_CLASS').AsString   := '';
        QSped.ParamByName('VL_ITEM').AsFloat      := QRel.FieldByName('VALOR').AsFloat;
        QSped.ParamByName('VL_DESC').AsFloat      := 0;
        QSped.ParamByName('CST_PIS').AsString     := QRel.FieldByName('CST_PIS').AsString;
        QSped.ParamByName('VL_BC_PIS').AsFloat    := QRel.FieldByName('BASE_CALC_PIS').AsFloat;
        QSped.ParamByName('ALIQ_PIS').AsFloat     := QRel.FieldByName('ALIQUOTA_PIS').AsFloat;
        QSped.ParamByName('VL_PIS').AsFloat       := QRel.FieldByName('VR_PIS').AsFloat;
        QSped.ParamByName('COD_CTA').AsString     := '';

        QSped.Prepare;
        QSped.ExecSql;



        QSped.Sql.Clear;
        QSped.Sql.Add('INSERT INTO REG_D605(' +
                      'ID_PAI,      ID_DETALHE,    REG, ' +
                      'COD_CLASS,   VL_ITEM,       VL_DESC, ' +
                      'CST_COFINS,  VL_BC_COFINS,  ALIQ_COFINS, ' +
                      'VL_COFINS,   COD_CTA) VALUES(' +
                      ':ID_PAI,     :ID_DETALHE,   :REG, ' +
                      ':COD_CLASS,  :VL_ITEM,      :VL_DESC, ' +
                      ':CST_COFINS, :VL_BC_COFINS, :ALIQ_COFINS, ' +
                      ':VL_COFINS,  :COD_CTA)');

        QSped.ParamByName('ID_PAI').AsInteger     := Id_Pai;
        QSped.ParamByName('ID_DETALHE').AsInteger := Id_Detalhe;
        QSped.ParamByName('REG').AsString         := 'D605';
        QSped.ParamByName('COD_CLASS').AsString   := '';
        QSped.ParamByName('VL_ITEM').AsFloat      := QRel.FieldByName('VALOR').AsFloat;
        QSped.ParamByName('VL_DESC').AsFloat      := 0;
        QSped.ParamByName('CST_COFINS').AsString  := QRel.FieldByName('CST_COFINS').AsString;
        QSped.ParamByName('VL_BC_COFINS').AsFloat := QRel.FieldByName('BASE_CALC_COFINS').AsFloat;
        QSped.ParamByName('ALIQ_COFINS').AsFloat  := QRel.FieldByName('ALIQUOTA_COFINS').AsFloat;
        QSped.ParamByName('VL_COFINS').AsFloat    := QRel.FieldByName('VR_COFINS').AsFloat;
        QSped.ParamByName('COD_CTA').AsString     := '';

        QSped.Prepare;
        QSped.ExecSql;


      end;

      Label1.Caption := QRel.FieldByName('TRANSACAO_ID').AsString;

      Application.ProcessMessages;
      QRel.Next;
    end;
{
    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT TRANSITENS.NAT_REC, TRANSITENS.ALIQUOTA_PIS, SUM(TRANSITENS.BASE_CALC_PIS) BASE_CALC_PIS, SUM(TRANSITENS.VR_PIS) VR_PIS');
    QRel.Sql.Add('FROM TRANSITENS');
    QRel.Sql.Add('INNER JOIN TRANSACOES');
    QRel.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(TRANSITENS.CST_PIS BETWEEN :CST_PIS1 AND :CST_PIS2)');
    QRel.Sql.Add('AND (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
    QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
    QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
    QRel.Sql.Add('AND ((TRANSACOES.MODELO = :MODELO1) OR (TRANSACOES.MODELO = :MODELO2) OR (TRANSACOES.MODELO = :MODELO3) OR (TRANSACOES.MODELO = :MODELO4))');
    QRel.Sql.Add('GROUP BY TRANSITENS.NAT_REC, TRANSITENS.ALIQUOTA_PIS');

    QRel.ParamByName('CST_PIS1').AsString     := '50';
    QRel.ParamByName('CST_PIS2').AsString     := '66';
    QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
    QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    QRel.ParamByName('MODELO1').AsString      := '01';
    QRel.ParamByName('MODELO2').AsString      := '1B';
    QRel.ParamByName('MODELO3').AsString      := '04';
    QRel.ParamByName('MODELO4').AsString      := '55';

    QRel.Prepare;
    QRel.Open;

    QRel.First;
    while not QRel.Eof do
    begin
      QSped.Sql.Clear;
      QSped.Sql.Add('SELECT GEN_ID(GEN_REG_M100, 0) FROM RDB$DATABASE');

      QSped.Prepare;
      QSped.Open;

      Id_Detalhe := (QSped.Fields[0].AsInteger + 1);

      QSped.Sql.Clear;
      QSped.Sql.Add('SET GENERATOR GEN_REG_M100 TO ' + IntToStr(Id_Detalhe));

      QSped.Prepare;
      QSped.ExecSql;



      QSped.Sql.Clear;
      QSped.Sql.Add('INSERT INTO REG_M100(' +
                    'ID_PAI,         REG,             COD_CRED, ' +
                    'IND_CRED_ORI,   VL_BC_CRED,      ALIQ_PIS, ' +
                    'QUANT_BC_PIS,   ALIQ_PIS_QUANT,  VL_CRED, ' +
                    'VL_AJUS_ACRES,  VL_AJUS_REDUC,   VL_CRED_DIF, ' +
                    'VL_CRED_DISP,   IND_DESC_CRED,   VL_CRED_DESC, ' +
                    'SLD_CRED,       ID) VALUES(' +
                    ':ID_PAI,        :REG,            :COD_CRED, ' +
                    ':IND_CRED_ORI,  :VL_BC_CRED,     :ALIQ_PIS, ' +
                    ':QUANT_BC_PIS,  :ALIQ_PIS_QUANT, :VL_CRED, ' +
                    ':VL_AJUS_ACRES, :VL_AJUS_REDUC,  :VL_CRED_DIF, ' +
                    ':VL_CRED_DISP,  :IND_DESC_CRED,  :VL_CRED_DESC, ' +
                    ':SLD_CRED,      :ID)');

      QSped.ParamByName('ID').AsInteger           := Id_Detalhe;
      QSped.ParamByName('ID_PAI').AsInteger       := Id_Pai;
      QSped.ParamByName('REG').AsString           := 'M100';
      QSped.ParamByName('COD_CRED').AsString      := QRel.FieldByName('NAT_REC').AsString;
      QSped.ParamByName('IND_CRED_ORI').AsString  := '0';
      QSped.ParamByName('VL_BC_CRED').AsFloat     := QRel.FieldByName('BASE_CALC_PIS').AsFloat;
      QSped.ParamByName('ALIQ_PIS').AsFloat       := QRel.FieldByName('ALIQUOTA_PIS').AsFloat;
      QSped.ParamByName('QUANT_BC_PIS').AsFloat   := 0;
      QSped.ParamByName('ALIQ_PIS_QUANT').AsFloat := 0;
      QSped.ParamByName('VL_CRED').AsFloat        := QRel.FieldByName('VR_PIS').AsFloat;
      QSped.ParamByName('VL_AJUS_ACRES').AsFloat  := 0;
      QSped.ParamByName('VL_AJUS_REDUC').AsFloat  := 0;
      QSped.ParamByName('VL_CRED_DIF').AsFloat    := 0;
      QSped.ParamByName('VL_CRED_DISP').AsFloat   := QRel.FieldByName('VR_PIS').AsFloat;
      QSped.ParamByName('IND_DESC_CRED').AsString := '0';
      QSped.ParamByName('VL_CRED_DESC').AsFloat   := QRel.FieldByName('VR_PIS').AsFloat;
      QSped.ParamByName('SLD_CRED').AsFloat       := 0;

      QSped.Prepare;
      QSped.ExecSql;



      QDetalhe.Sql.Clear;
      QDetalhe.Sql.Add('SELECT TRANSITENS.NAT_BC_REC, TRANSITENS.ALIQUOTA_PIS, TRANSITENS.CST_PIS, SUM(TRANSITENS.BASE_CALC_PIS) BASE_CALC_PIS, SUM(TRANSITENS.VR_PIS) VR_PIS');
      QDetalhe.Sql.Add('FROM TRANSITENS');
      QDetalhe.Sql.Add('INNER JOIN TRANSACOES');
      QDetalhe.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
      QDetalhe.Sql.Add('WHERE');
      QDetalhe.Sql.Add('(TRANSITENS.CST_PIS BETWEEN :CST_PIS1 AND :CST_PIS2)');
      QDetalhe.Sql.Add('AND (TRANSITENS.ALIQUOTA_PIS = :ALIQUOTA_PIS)');
      QDetalhe.Sql.Add('AND (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QDetalhe.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QDetalhe.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QDetalhe.Sql.Add('AND ((TRANSACOES.MODELO = :MODELO1) OR (TRANSACOES.MODELO = :MODELO2) OR (TRANSACOES.MODELO = :MODELO3) OR (TRANSACOES.MODELO = :MODELO4))');
      QDetalhe.Sql.Add('GROUP BY TRANSITENS.NAT_BC_REC, TRANSITENS.ALIQUOTA_PIS, TRANSITENS.CST_PIS');

      QDetalhe.ParamByName('CST_PIS1').AsString     := '50';
      QDetalhe.ParamByName('CST_PIS2').AsString     := '66';
      QDetalhe.ParamByName('ALIQUOTA_PIS').AsFloat  := QRel.FieldByName('ALIQUOTA_PIS').AsFloat;
      QDetalhe.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
      QDetalhe.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
      QDetalhe.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
      QDetalhe.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
      QDetalhe.ParamByName('MODELO1').AsString      := '01';
      QDetalhe.ParamByName('MODELO2').AsString      := '1B';
      QDetalhe.ParamByName('MODELO3').AsString      := '04';
      QDetalhe.ParamByName('MODELO4').AsString      := '55';

      QDetalhe.Prepare;
      QDetalhe.Open;

      QSped.Sql.Clear;
      QSped.Sql.Add('INSERT INTO REG_M105(' +
                    'ID_PAI,            ID_DETALHE,    REG, ' +
                    'NAT_BC_CRED,       CST_PIS,       VL_BC_PIS_TOT, ' +
                    'VL_BC_PIS_CUM,     VL_BC_PIS_NC,  VL_BC_PIS, ' +
                    'QUANT_BC_PIS_TOT,  QUANT_BC_PIS,  DESC_CRED) VALUES(' +
                    ':ID_PAI,           :ID_DETALHE,   :REG, ' +
                    ':NAT_BC_CRED,      :CST_PIS,      :VL_BC_PIS_TOT, ' +
                    ':VL_BC_PIS_CUM,    :VL_BC_PIS_NC, :VL_BC_PIS, ' +
                    ':QUANT_BC_PIS_TOT, :QUANT_BC_PIS, :DESC_CRED)');

      QSped.ParamByName('ID_PAI').AsInteger         := Id_Pai;
      QSped.ParamByName('REG').AsString             := 'M105';
      QSped.ParamByName('ID_DETALHE').AsInteger     := Id_Detalhe;
      QSped.ParamByName('NAT_BC_CRED').AsString     := QDetalhe.FieldByName('NAT_BC_REC').AsString;
      QSped.ParamByName('CST_PIS').AsString         := QRel.FieldByName('CST_PIS').AsString;
      QSped.ParamByName('VL_BC_PIS_TOT').AsFloat    := QRel.FieldByName('BASE_CALC_PIS').AsFloat;
      QSped.ParamByName('VL_BC_PIS_CUM').AsFloat    := 0;
      QSped.ParamByName('VL_BC_PIS_NC').AsFloat     := QRel.FieldByName('BASE_CALC_PIS').AsFloat;
      QSped.ParamByName('VL_BC_PIS').AsFloat        := QRel.FieldByName('BASE_CALC_PIS').AsFloat;
      QSped.ParamByName('QUANT_BC_PIS_TOT').AsFloat := 0;
      QSped.ParamByName('QUANT_BC_PIS').AsFloat     := 0;
      QSped.ParamByName('DESC_CRED').AsString       := '';

      Application.ProcessMessages;
      QRel.Next;
    end;
}

    QRel_Sped.Sql.Clear;
    QRel_Sped.Sql.Add('SELECT CST_PIS, NAT_REC, SUM(VALOR) VALOR FROM');
    QRel_Sped.Sql.Add('(');
    QRel_Sped.Sql.Add('SELECT REG_C481.CST_PIS, REG_C481.NAT_REC, REG_C481.VL_ITEM VALOR');
    QRel_Sped.Sql.Add('FROM REG_C481');
    QRel_Sped.Sql.Add('WHERE');
    QRel_Sped.Sql.Add('(REG_C481.ID_PAI = :ID_PAI)');
    QRel_Sped.Sql.Add('UNION ALL');
    QRel_Sped.Sql.Add('SELECT REG_C170.CST_PIS, REG_C170.NAT_REC, REG_C170.VL_ITEM VALOR');
    QRel_Sped.Sql.Add('FROM REG_C170');
    QRel_Sped.Sql.Add('WHERE');
    QRel_Sped.Sql.Add('(REG_C170.ID_PAI = :ID_PAI)');
    QRel_Sped.Sql.Add(')');
    QRel_Sped.Sql.Add('WHERE');
    QRel_Sped.Sql.Add('((CST_PIS = :CST_PIS1) or (CST_PIS = :CST_PIS2) or (CST_PIS = :CST_PIS3) or (CST_PIS = :CST_PIS4) or (CST_PIS = :CST_PIS5) or (CST_PIS = :CST_PIS6))');
    QRel_Sped.Sql.Add('GROUP BY CST_PIS, NAT_REC');
    QRel_Sped.Sql.Add('ORDER BY CST_PIS');

    QRel_Sped.ParamByName('ID_PAI').AsInteger  := Id_Pai;
    QRel_Sped.ParamByName('CST_PIS1').AsString := '04';
    QRel_Sped.ParamByName('CST_PIS2').AsString := '05';
    QRel_Sped.ParamByName('CST_PIS3').AsString := '06';
    QRel_Sped.ParamByName('CST_PIS4').AsString := '07';
    QRel_Sped.ParamByName('CST_PIS5').AsString := '08';
    QRel_Sped.ParamByName('CST_PIS6').AsString := '09';

    QRel_Sped.Prepare;
    QRel_Sped.Open;

    QRel_Sped.First;
    while not QRel_Sped.Eof do
    begin
      QSped.Sql.Clear;
      QSped.Sql.Add('SELECT GEN_ID(GEN_REG_M400, 0) FROM RDB$DATABASE');

      QSped.Prepare;
      QSped.Open;

      Id_Detalhe := (QSped.Fields[0].AsInteger + 1);

      QSped.Sql.Clear;
      QSped.Sql.Add('SET GENERATOR GEN_REG_M400 TO ' + IntToStr(Id_Detalhe));

      QSped.Prepare;
      QSped.ExecSql;



      QSped.Sql.Clear;
      QSped.Sql.Add('INSERT INTO REG_M400(' +
                    'ID,       ID_PAI,      REG, ' +
                    'CST_PIS,  VL_TOT_REC,  COD_CTA, ' +
                    'DESC_COMPL) VALUES(' +
                    ':ID,      :ID_PAI,     :REG, ' +
                    ':CST_PIS, :VL_TOT_REC, :COD_CTA, ' +
                    ':DESC_COMPL)');

      QSped.ParamByName('ID').AsInteger        := Id_Detalhe;
      QSped.ParamByName('ID_PAI').AsInteger    := Id_Pai;
      QSped.ParamByName('REG').AsString        := 'M400';
      QSped.ParamByName('CST_PIS').AsString    := QRel_Sped.FieldByName('CST_PIS').AsString;
      QSped.ParamByName('VL_TOT_REC').AsFloat  := QRel_Sped.FieldByName('VALOR').AsFloat;
      QSped.ParamByName('COD_CTA').AsString    := '';
      QSped.ParamByName('DESC_COMPL').AsString := '';

      QSped.Prepare;
      QSped.ExecSql;



      QSped.Sql.Clear;
      QSped.Sql.Add('INSERT INTO REG_M410(' +
                    'ID_PAI,   ID_DETALHE,  REG, ' +
                    'NAT_REC,  VL_REC,      COD_CTA, ' +
                    'DESC_COMPL) VALUES(' +
                    ':ID_PAI,  :ID_DETALHE, :REG, ' +
                    ':NAT_REC, :VL_REC,     :COD_CTA, ' +
                    ':DESC_COMPL)');

      QSped.ParamByName('ID_PAI').AsInteger     := Id_Pai;
      QSped.ParamByName('ID_DETALHE').AsInteger := Id_Detalhe;
      QSped.ParamByName('REG').AsString         := 'M410';
      QSped.ParamByName('NAT_REC').AsString     := QRel_Sped.FieldByName('NAT_REC').AsString;
      QSped.ParamByName('VL_REC').AsFloat       := QRel_Sped.FieldByName('VALOR').AsFloat;
      QSped.ParamByName('COD_CTA').AsString     := '';
      QSped.ParamByName('DESC_COMPL').AsString  := '';

      QSped.Prepare;
      QSped.ExecSql;



      Application.ProcessMessages;
      QRel_Sped.Next;
    end;

    QRel_Sped.Sql.Clear;
    QRel_Sped.Sql.Add('SELECT CST_COFINS, NAT_REC, SUM(VALOR) VALOR FROM');
    QRel_Sped.Sql.Add('(');
    QRel_Sped.Sql.Add('SELECT REG_C485.CST_COFINS, REG_C485.NAT_REC, REG_C485.VL_ITEM VALOR');
    QRel_Sped.Sql.Add('FROM REG_C485');
    QRel_Sped.Sql.Add('WHERE');
    QRel_Sped.Sql.Add('(REG_C485.ID_PAI = :ID_PAI)');
    QRel_Sped.Sql.Add('UNION ALL');
    QRel_Sped.Sql.Add('SELECT REG_C170.CST_COFINS, REG_C170.NAT_REC, REG_C170.VL_ITEM VALOR');
    QRel_Sped.Sql.Add('FROM REG_C170');
    QRel_Sped.Sql.Add('WHERE');
    QRel_Sped.Sql.Add('(REG_C170.ID_PAI = :ID_PAI)');
    QRel_Sped.Sql.Add(')');
    QRel_Sped.Sql.Add('WHERE');
    QRel_Sped.Sql.Add('((CST_COFINS = :CST_COFINS1) or (CST_COFINS = :CST_COFINS2) or (CST_COFINS = :CST_COFINS3) or (CST_COFINS = :CST_COFINS4) or (CST_COFINS = :CST_COFINS5) or (CST_COFINS = :CST_COFINS6))');
    QRel_Sped.Sql.Add('GROUP BY CST_COFINS, NAT_REC');
    QRel_Sped.Sql.Add('ORDER BY CST_COFINS');

    QRel_Sped.ParamByName('ID_PAI').AsInteger     := Id_Pai;
    QRel_Sped.ParamByName('CST_COFINS1').AsString := '04';
    QRel_Sped.ParamByName('CST_COFINS2').AsString := '05';
    QRel_Sped.ParamByName('CST_COFINS3').AsString := '06';
    QRel_Sped.ParamByName('CST_COFINS4').AsString := '07';
    QRel_Sped.ParamByName('CST_COFINS5').AsString := '08';
    QRel_Sped.ParamByName('CST_COFINS6').AsString := '09';

    QRel_Sped.Prepare;
    QRel_Sped.Open;

    QRel_Sped.First;
    while not QRel_Sped.Eof do
    begin
      QSped.Sql.Clear;
      QSped.Sql.Add('SELECT GEN_ID(GEN_REG_M800, 0) FROM RDB$DATABASE');

      QSped.Prepare;
      QSped.Open;

      Id_Detalhe := (QSped.Fields[0].AsInteger + 1);

      QSped.Sql.Clear;
      QSped.Sql.Add('SET GENERATOR GEN_REG_M800 TO ' + IntToStr(Id_Detalhe));

      QSped.Prepare;
      QSped.ExecSql;



      QSped.Sql.Clear;
      QSped.Sql.Add('INSERT INTO REG_M800(' +
                    'ID,          ID_PAI,      REG, ' +
                    'CST_COFINS,  VL_TOT_REC,  COD_CTA, ' +
                    'DESC_COMPL) VALUES(' +
                    ':ID,         :ID_PAI,     :REG, ' +
                    ':CST_COFINS, :VL_TOT_REC, :COD_CTA, ' +
                    ':DESC_COMPL)');

      QSped.ParamByName('ID').AsInteger        := Id_Detalhe;
      QSped.ParamByName('ID_PAI').AsInteger    := Id_Pai;
      QSped.ParamByName('REG').AsString        := 'M800';
      QSped.ParamByName('CST_COFINS').AsString := QRel_Sped.FieldByName('CST_COFINS').AsString;
      QSped.ParamByName('VL_TOT_REC').AsFloat  := QRel_Sped.FieldByName('VALOR').AsFloat;
      QSped.ParamByName('COD_CTA').AsString    := '';
      QSped.ParamByName('DESC_COMPL').AsString := '';

      QSped.Prepare;
      QSped.ExecSql;



      QSped.Sql.Clear;
      QSped.Sql.Add('INSERT INTO REG_M810(' +
                    'ID_PAI,   ID_DETALHE,  REG, ' +
                    'NAT_REC,  VL_REC,      COD_CTA, ' +
                    'DESC_COMPL) VALUES(' +
                    ':ID_PAI,  :ID_DETALHE, :REG, ' +
                    ':NAT_REC, :VL_REC,     :COD_CTA, ' +
                    ':DESC_COMPL)');

      QSped.ParamByName('ID_PAI').AsInteger     := Id_Pai;
      QSped.ParamByName('ID_DETALHE').AsInteger := Id_Detalhe;
      QSped.ParamByName('REG').AsString         := 'M810';
      QSped.ParamByName('NAT_REC').AsString     := QRel_Sped.FieldByName('NAT_REC').AsString;
      QSped.ParamByName('VL_REC').AsFloat       := QRel_Sped.FieldByName('VALOR').AsFloat;
      QSped.ParamByName('COD_CTA').AsString     := '';
      QSped.ParamByName('DESC_COMPL').AsString  := '';

      QSped.Prepare;
      QSped.ExecSql;



      Application.ProcessMessages;
      QRel_Sped.Next;
    end;

    Close;

  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
    Panel1.Visible     := False;
  end;
end;

procedure TFrmGerar_Base_Sped.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmGerar_Base_Sped.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmGerar_Base_Sped.FormCreate(Sender: TObject);
begin
  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);
end;

procedure TFrmGerar_Base_Sped.VersaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

end.
