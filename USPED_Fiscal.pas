unit USPED_Fiscal;

{$IFDEF FPC}
  {$mode objfpc}{$H+}
{$ENDIF}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, ACBrEFDBlocos,
  Dialogs, StdCtrls, ACBrSpedFiscal, ExtCtrls, ComCtrls, ACBrUtil, ACBrTXTClass,
  Mask, rxToolEdit, Buttons, DB, IBCustomDataSet, IBQuery, ACBrEAD, Math,ShellApi,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  ACBrBase;

type

  { TFrmSPEDFiscal }

  TFrmSPED_Fiscal = class(TForm)
    ACBrSPEDFiscal1: TACBrSPEDFiscal;
    Label2: TLabel;
    Dtmen: TDateEdit;
    Dtmai: TDateEdit;
    Label1: TLabel;
    edtFile: TEdit;
    Bevel1: TBevel;
    btnExecuta: TBitBtn;
    btnRetorna: TBitBtn;
    ACBrEAD1: TACBrEAD;
    Label3: TLabel;
    Versao: TComboBox;
    Label10: TLabel;
    Finalidade_Arquivo: TComboBox;
    Label5: TLabel;
    Label4: TLabel;
    Perfil: TComboBox;
    Forcar_Reg_H: TCheckBox;
    Label6: TLabel;
    Data: TComboBox;
    Label7: TLabel;
    Label8: TLabel;
    Preco: TComboBox;
    SaveDialog1: TSaveDialog;
    QVendaBruta_a: TFDQuery;
    QVendaBruta: TFDQuery;
    Q470Qt: TFDQuery;
    Q113: TFDQuery;
    QItens: TFDQuery;
    QTributo: TFDQuery;
    Q490: TFDQuery;
    Q470: TFDQuery;
    Q460: TFDQuery;
    QRel: TFDQuery;
    QDetalhe: TFDQuery;
    IQuery: TFDQuery;
    Q405: TFDQuery;
    Venda_Bruta_a: TFDQuery;
    QSearch: TFDQuery;
    Btn_Verifica_SPED: TButton;
    QRelVa: TFDQuery;
    Label9: TLabel;
    Dt_Blocok: TComboBox;
    chk_todos: TCheckBox;
    Label11: TLabel;
    Motivo: TComboBox;
    procedure edtFileChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnRetornaClick(Sender: TObject);
    procedure DtmenEnter(Sender: TObject);
    procedure VersaoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Forcar_Reg_HClick(Sender: TObject);
    procedure Btn_Verifica_SPEDClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Registros_Bloco_0;
    procedure Registros_Bloco_B;
    procedure Registros_Bloco_C;
    procedure Registros_Bloco_D;
    procedure Registros_Bloco_E;
    procedure Registros_Bloco_H;
    procedure Registros_Bloco_K;
    procedure Registros_Bloco_1;
    procedure Registros_Bloco_9;

  end;

var
  FrmSPED_Fiscal: TFrmSPED_Fiscal;
  Laudo, Prd_425, Und_425,Arquivo: String;
  Deb_ICMS, Cred_ICMS, Vr_ICMS_ST, Aj_Cred: Real;

implementation

uses
  UData, UPrincipal,UVerifica_SPED;

{$IFDEF FPC}
  {$R *.lfm}
{$ELSE}
  {$R *.dfm}
{$ENDIF}

procedure TFrmSPED_Fiscal.Registros_Bloco_0;
begin
  with ACBrSpedFiscal1 do
  begin
    DT_INI := Dtmen.Date;
    DT_FIN := Dtmai.Date;

    LinhasBuffer := 1000;

    IniciaGeracao;
  end;

  with ACBrSpedFiscal1.Bloco_0 do
  begin
    // Dados da Empresa

    with Registro0000New do
    begin
      if Versao.Text = '100' then
        COD_VER := vlVersao100
      else if Versao.Text = '101' then
        COD_VER := vlVersao101
      else if Versao.Text = '102' then
        COD_VER := vlVersao102
      else if Versao.Text = '103' then
        COD_VER := vlVersao103
      else if Versao.Text = '104' then
        COD_VER := vlVersao104
      else if Versao.Text = '105' then
        COD_VER := vlVersao105
      else if Versao.Text = '106' then
        COD_VER := vlVersao106
      else if Versao.Text = '107' then
        COD_VER := vlVersao107
      else if Versao.Text = '108' then
        COD_VER := vlVersao108
      else if Versao.Text = '109' then
        COD_VER := vlVersao109
      else if Versao.Text = '110' then
        COD_VER := vlVersao110
      else if Versao.Text = '111' then
        COD_VER := vlVersao111
      else if Versao.Text = '112' then
        COD_VER := vlVersao112
      else if Versao.Text = '113' then
        COD_VER := vlVersao113
      else if Versao.Text = '114' then
        COD_VER := vlVersao114
       else if Versao.Text = '115' then
        COD_VER := vlVersao115
        else if Versao.Text = '116' then
        COD_VER := vlVersao116
        else if Versao.Text = '117' then
        COD_VER := vlVersao117
        else if Versao.Text = '118' then
        COD_VER := vlVersao118
        else if Versao.Text = '119' then
        COD_VER := vlVersao119
      else
        COD_VER := vlVersao119;





      if Finalidade_Arquivo.Text = '1 - Normal' then
        COD_FIN := raOriginal
      else if Finalidade_Arquivo.Text = '2 - Retificação Total de Arquivo' then
        COD_FIN := raSubstituto
      else
        COD_FIN := raOriginal;

      DT_INI  := Dtmen.Date;
      DT_FIN  := Dtmai.Date;
      NOME    := FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString;
      CNPJ    := SemMascara(FrmPrincipal.QEmpresa.FieldByName('CNPJ').AsString);
      CPF     := SemMascara(FrmPrincipal.QEmpresa.FieldByName('CPF_DIRETOR').AsString);
      UF      := FrmPrincipal.QEmpresa.FieldByName('ESTADO').AsString;
      IE      := SemMascara(FrmPrincipal.QEmpresa.FieldByName('INSCR_ESTADUAL').AsString);
      COD_MUN := FrmPrincipal.QEmpresa.FieldByName('IBGE').AsInteger;
      IM      := SemMascara(FrmPrincipal.QEmpresa.FieldByName('INSCR_MUNICIPAL').AsString);
      SUFRAMA := FrmPrincipal.QEmpresa.FieldByName('SUFRAMA').AsString;

      if Perfil.Text = 'Perfil A' then
        IND_PERFIL := pfPerfilA
      else if Perfil.Text = 'Perfil B' then
        IND_PERFIL := pfPerfilB
      else
        IND_PERFIL := pfPerfilB;

      IND_ATIV   := atOutros;

      if FrmPrincipal.QEmpresa.FieldByName('TIPO_ATIVIDADE').AsString = '0 - INDUSTRIAL OU EQUIPARADO' Then
      IND_ATIV := atIndustrial
      Else
      IND_ATIV := atOutros;

    end;

    with Registro0001New do
    begin
      IND_MOV := imComDados;

      // Dados complementares da Empresa
      if ACBrSpedFiscal1.Bloco_0.Registro0000.IND_ATIV = atIndustrial then
        with Registro0002New do
        begin
          CLAS_ESTAB_IND := '09';
        end;

      with Registro0005New do
      begin
        FANTASIA := FrmPrincipal.QEmpresa.FieldByName('FANTASIA').AsString;
        CEP      := SemMascara(FrmPrincipal.QEmpresa.FieldByName('CEP').AsString);
        ENDERECO := FrmPrincipal.QEmpresa.FieldByName('ENDERECO').AsString;
        NUM      := FrmPrincipal.QEmpresa.FieldByName('NUMERO').AsString;
        COMPL    := '';
        BAIRRO   := FrmPrincipal.QEmpresa.FieldByName('BAIRRO').AsString;
        FONE     := SemMascara(FrmPrincipal.QEmpresa.FieldByName('TELEFONE').AsString);
        FAX      := '';
        EMAIL    := FrmPrincipal.QEmpresa.FieldByName('EMAIL').AsString;
      end;

{
      with Registro0015New do
      begin
        // Dados da Contribuinte Substituto

        // UF_ST :=
        // IE_ST :=
      end;
}
      // Dados do Contabilista

      with Registro0100New do
      begin
        NOME     := FrmPrincipal.QEmpresa.FieldByName('CONTABILISTA').AsString;
        CPF      := SemMascara(FrmPrincipal.QEmpresa.FieldByName('CPF_CONTABILISTA').AsString);
        CRC      := FrmPrincipal.QEmpresa.FieldByName('CRC_CONTABILISTA').AsString;
        CNPJ     := SemMascara(FrmPrincipal.QEmpresa.FieldByName('CNPJ_CONTABILISTA').AsString);
        CEP      := SemMascara(FrmPrincipal.QEmpresa.FieldByName('CEP').AsString);
        ENDERECO := FrmPrincipal.QEmpresa.FieldByName('END_CONTABILISTA').AsString;
        NUM      := FrmPrincipal.QEmpresa.FieldByName('NUM_CONTABILISTA').AsString;
        COMPL    := FrmPrincipal.QEmpresa.FieldByName('COMPL_CONTABILISTA').AsString;
        BAIRRO   := FrmPrincipal.QEmpresa.FieldByName('BAIRRO_CONTABILISTA').AsString;
        FONE     := SemMascara(FrmPrincipal.QEmpresa.FieldByName('FONE_CONTABILISTA').AsString);
        FAX      := FrmPrincipal.QEmpresa.FieldByName('FAX_CONTABILISTA').AsString;
        EMAIL    := FrmPrincipal.QEmpresa.FieldByName('EMAIL_CONTABILISTA').AsString;
        COD_MUN  := FrmPrincipal.QEmpresa.FieldByName('IBGE_CONTABILISTA').AsInteger;
      end;

      QRel.Sql.Clear;
      QRel.Sql.Add('SELECT * FROM FORNECEDORES');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(SPED = 1)');
      QRel.Sql.Add('ORDER BY FORNECEDORES.FORNECEDOR_ID');

      QRel.Prepare;
      QRel.Open;

      QRel.First;
      while not QRel.Eof do
      begin
        with Registro0150New do
        begin
          // Cadastro de Participantes

          if QRel.FieldByName('IBGE').AsString <> '' then
          begin
            COD_PART := 'F' + StrZero(QRel.FieldByName('FORNECEDOR_ID').AsString, 6, 0);
            NOME     := Alltrim(QRel.FieldByName('NOME').AsString);
            COD_PAIS := QRel.FieldByName('COD_PAIS').AsString;

            if QRel.FieldByName('TIPO_FORNECEDOR').AsString = 'PESSOA JURÍDICA' then
            begin
              CNPJ := SemMascara(QRel.FieldByName('CNPJ').AsString);
              CPF  := '';
              IE   := SemMascara(QRel.FieldByName('INSCRICAO').AsString);
            end
            else
            begin
              CNPJ := '';
              CPF  := SemMascara(QRel.FieldByName('CNPJ').AsString);
              IE   := '';
            end;


            COD_MUN  := QRel.FieldByName('IBGE').AsInteger;
            SUFRAMA  := QRel.FieldByName('SUFRAMA').AsString;
            ENDERECO := Alltrim(QRel.FieldByName('ENDERECO').AsString);
            NUM      := Alltrim(QRel.FieldByName('NUMERO').AsString);
            COMPL    := Alltrim(QRel.FieldByName('COMPLEMENTO').AsString);
            BAIRRO   := Alltrim(QRel.FieldByName('BAIRRO').AsString);
{
            with Registro0175New do
            begin
              // Alteração do Cadastro de Participantes

              // DT_ALT   :=
              // NR_CAMPO :=
              // CONT_ANT :=
            end;
}
          end
          else
            Application.MessageBox(PChar('O fornecedor ' + QRel.FieldByName('NOME').AsString + ' está com cadastro incompleto'), PChar(Msg_Title), mb_IconInformation);
        end;
        Label6.Caption := 'Inserindo Fornecedores';
        Label3.Caption := StrZero(QRel.FieldByName('FORNECEDOR_ID').AsString, 6, 0);

        Application.ProcessMessages;
        QRel.Next;
      end;

      QRel.Sql.Clear;
      QRel.Sql.Add('SELECT DISTINCT * FROM');
      QRel.Sql.Add('(SELECT DISTINCT CLIENTES.* FROM CLIENTES');
      QRel.Sql.Add('INNER JOIN TRANSACOES ON CLIENTES.CLIENTE_ID = TRANSACOES.CLIENTE_ID');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(SPED = 1) AND DT_SPED BETWEEN :DT_INICIAL AND :DT_FINAL');
      QRel.Sql.Add('UNION ALL');
      QRel.Sql.Add('SELECT DISTINCT CLIENTES.* FROM TRANSACOES');
      QRel.Sql.Add('INNER JOIN FINALIZADORAS ON FINALIZADORAS.FINALIZADORA_ID = TRANSACOES.FINALIZADORA_ID');
      QRel.Sql.Add('INNER JOIN CLIENTES ON FINALIZADORAS.CLIENTE_ID = CLIENTES.CLIENTE_ID');
      QRel.Sql.Add('WHERE TRANSACOES.FINALIZADORA_ID IN (SELECT FINALIZADORA_ID FROM FINALIZADORAS WHERE ');
      QRel.Sql.Add('(FINALIZADORAS.DESCRICAO ILIKE :CARTAO) OR (FINALIZADORAS.DESCRICAO ILIKE :PIX) )');
      QRel.Sql.Add('AND DT_SPED BETWEEN :DT_INICIAL AND :DT_FINAL) AS TESTE');
      QRel.Sql.Add('ORDER BY CLIENTE_ID');
      QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
      QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
      QRel.ParamByName('CARTAO').AsString       := 'CART' + '%';
      QRel.ParamByName('PIX').AsString          := 'PIX' + '%';

      QRel.Prepare;
      QRel.Open;

      QRel.First;
      while not QRel.Eof do
      begin
        with Registro0150New do
        begin
          // Cadastro de Participantes

          if QRel.FieldByName('IBGE').AsString <> '' then
          begin
            COD_PART := 'C' + StrZero(QRel.FieldByName('CLIENTE_ID').AsString, 6, 0);
            NOME     := Alltrim(QRel.FieldByName('NOME').AsString);
            COD_PAIS := QRel.FieldByName('COD_PAIS').AsString;

            if QRel.FieldByName('TIPO_CLIENTE').AsString = 'PESSOA JURÍDICA' then
            begin
              CNPJ := SemMascara(QRel.FieldByName('CNPJ').AsString);
              CPF  := '';
              IE   := SemMascara(QRel.FieldByName('INSCRICAO').AsString);
            end
            else
            begin
              CNPJ := '';
              CPF  := SemMascara(QRel.FieldByName('CNPJ').AsString);
              IE   := '';
            end;


            COD_MUN  := QRel.FieldByName('IBGE').AsInteger;
            SUFRAMA  := QRel.FieldByName('SUFRAMA').AsString;
            ENDERECO := Alltrim(QRel.FieldByName('ENDERECO').AsString);
            NUM      := Alltrim(QRel.FieldByName('NUMERO').AsString);
            COMPL    := Alltrim(QRel.FieldByName('COMPLEMENTO').AsString);
            BAIRRO   := Alltrim(QRel.FieldByName('BAIRRO').AsString);
{
            with Registro0175New do
            begin
              // Alteração do Cadastro de Participantes

              // DT_ALT   :=
              // NR_CAMPO :=
              // CONT_ANT :=
            end;
}
          end
          else
            Application.MessageBox(PChar('O cliente ' + QRel.FieldByName('NOME').AsString + ' está com cadastro incompleto'), PChar(Msg_Title), mb_IconInformation);
        end;
        Label6.Caption := 'Inserindo Clientes';
        Label3.Caption := StrZero(QRel.FieldByName('CLIENTE_ID').AsString, 6, 0);

        Application.ProcessMessages;
        QRel.Next;
      end;


      QRel.Sql.Clear;
      QRel.Sql.Add('SELECT DISTINCT  PRODUTOS.UNIDADE_VENDA,TABELAS.NIVEL');
      QRel.Sql.Add('FROM PRODUTOS');
      QRel.Sql.Add('LEFT JOIN TABELAS ON PRODUTOS.UNIDADE_VENDA = TABELAS.DESCRICAO');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TABELAS.TIPO_TABELA = ' + #39 + '9' + #39 + ')');
      QRel.Sql.Add('AND (PRODUTOS.SPED = 1)');
      QRel.Sql.Add('ORDER BY PRODUTOS.UNIDADE_VENDA');

      QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
      QRel.Prepare;
      QRel.Open;

      QRel.First;
      while not QRel.Eof do
      begin
        with Registro0190New do
        begin
             UNID  := Alltrim(QRel.FieldByName('UNIDADE_VENDA').AsString);
             DESCR :=  QRel.FieldByName('NIVEL').AsString +  ' -> ' + Alltrim(QRel.FieldByName('UNIDADE_VENDA').AsString);
         end;
        Label6.Caption := 'Cadastradndo Unidades de Venda';
        Label3.Caption := Alltrim(QRel.FieldByName('UNIDADE_VENDA').AsString);

        Application.ProcessMessages;
        QRel.Next;
      end;

      // Dados dos Produtos

      QRel.SQL.Clear;
      QRel.SQL.Add('UPDATE PRODUTOS SET CEST = '''' where TRIBUTO_ID in (');
      QRel.SQL.Add('select TRIBUTO_ID from TRIBUTOS where substring(tributacao from 1 for 2) not in (''10'', ''30'', ''60'', ''70'')');
      QRel.SQL.Add(') and CEST != ''''');
      QRel.Prepare;
      QRel.ExecSQL;

      QRel.Sql.Clear;
      {
      QRel.Sql.Add('SELECT DISTINCT PRODUTOS.* FROM PRODUTOS');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(EMPRESA_ID = :EMPRESA_ID)654654');
      QRel.Sql.Add('AND (SPED = 1)');
      }
      QRel.Sql.Add('select * from PRODUTOS where PRODUTO_ID in (');
      QRel.Sql.Add('SELECT DISTINCT PRODUTOS.produto_id  FROM PRODUTOS');
      QRel.Sql.Add('INNER JOIN TRANSITENS ON TRANSITENS.PRODUTO_ID = PRODUTOS.PRODUTO_ID');
      QRel.Sql.Add('INNER JOIN TRANSACOES ON TRANSACOES.TRANSACAO_ID = TRANSITENS.TRANSACAO_ID');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(PRODUTOS.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (SPED = 1)');
      QRel.Sql.Add('AND DT_SPED BETWEEN :DT_INICIAL AND :DT_FINAL');
      QRel.Sql.Add('AND (QUANTIDADE_C > 0 OR CONDUTA != ''17'')');

      if FrmPrincipal.config.FieldByName('GERAR_BLOCOK').AsString = 'True' Then
      begin
        QRel.Sql.Add('union all');

        QRel.Sql.Add('SELECT POSICAO_PRODUTOS.PRODUTO_ID FROM POSICAO_PRODUTOS');
        QRel.Sql.Add('INNER JOIN PRODUTOS ON PRODUTOS.PRODUTO_ID = POSICAO_PRODUTOS.PRODUTO_ID');
        QRel.Sql.Add('WHERE');
        QRel.Sql.Add('(POSICAO_PRODUTOS.DT_MOVIMENTO = :DT_MOVIMENTOK)');
        QRel.Sql.Add('AND (POSICAO_PRODUTOS.QUANTIDADE_C > 0)');
        QRel.Sql.Add('AND ((PRODUTOS.TIPO_ITEM = :TIPO_ITEM)');
        QRel.Sql.Add('OR (PRODUTOS.TIPO_ITEM = :TIPO_ITEM1)');
        QRel.Sql.Add('OR (PRODUTOS.TIPO_ITEM = :TIPO_ITEM2)');
        QRel.Sql.Add('OR (PRODUTOS.TIPO_ITEM = :TIPO_ITEM3)');
        QRel.Sql.Add('OR (PRODUTOS.TIPO_ITEM = :TIPO_ITEM4)');
        QRel.Sql.Add('OR (PRODUTOS.TIPO_ITEM = :TIPO_ITEM5)');
        QRel.Sql.Add('OR (PRODUTOS.TIPO_ITEM = :TIPO_ITEM6)');
        QRel.Sql.Add('OR (PRODUTOS.TIPO_ITEM = :TIPO_ITEM7))');

        if Data.Text = 'Hoje' then
          QRel.ParamByName('DT_MOVIMENTOK').AsDateTime := Date
        Else
          QRel.ParamByName('DT_MOVIMENTOK').AsDateTime := StrTodate(Dt_Blocok.Text);

        QRel.ParamByName('TIPO_ITEM').AsString      := '00 - MERCADORIA PARA REVENDA';
        QRel.ParamByName('TIPO_ITEM1').AsString     := '01 - MATERIA PRIMA';
        QRel.ParamByName('TIPO_ITEM2').AsString     := '02 - EMBALAGEM';
        QRel.ParamByName('TIPO_ITEM3').AsString     := '03 - PRODUTO EM PROCESSO';
        QRel.ParamByName('TIPO_ITEM4').AsString     := '04 - PRODUTO ACABADO';
        QRel.ParamByName('TIPO_ITEM5').AsString     := '05 - SUBPRODUTO';
        QRel.ParamByName('TIPO_ITEM6').AsString     := '06 - PRODUTO INTERMEDIARIO';
        QRel.ParamByName('TIPO_ITEM7').AsString     := '10 - OUTROS INSUMOS';
      end;

      if Forcar_Reg_H.Checked Then
      begin
        QRel.Sql.Add('union all');

        QRel.Sql.Add('SELECT POSICAO_PRODUTOS.PRODUTO_ID FROM POSICAO_PRODUTOS');
        QRel.Sql.Add('INNER JOIN PRODUTOS ON PRODUTOS.PRODUTO_ID = POSICAO_PRODUTOS.PRODUTO_ID');
        QRel.Sql.Add('WHERE');
        QRel.Sql.Add('(POSICAO_PRODUTOS.DT_MOVIMENTO = :DT_MOVIMENTO)');
        QRel.Sql.Add('AND (POSICAO_PRODUTOS.QUANTIDADE_C > 0)');
        if not chk_todos.Checked then
        begin
          QRel.Sql.Add('AND ((PRODUTOS.TIPO_ITEM = :TIPO_ITEM)');
          QRel.Sql.Add('OR (PRODUTOS.TIPO_ITEM = :TIPO_ITEM1)');
          QRel.Sql.Add('OR (PRODUTOS.TIPO_ITEM = :TIPO_ITEM4))');
          QRel.ParamByName('TIPO_ITEM').AsString      := '00 - MERCADORIA PARA REVENDA';
          QRel.ParamByName('TIPO_ITEM1').AsString     := '01 - MATERIA PRIMA';
          QRel.ParamByName('TIPO_ITEM4').AsString     := '04 - PRODUTO ACABADO';
        end;

        if Data.Text = 'Hoje' then
          QRel.ParamByName('DT_MOVIMENTO').AsDateTime := Date
        Else
          QRel.ParamByName('DT_MOVIMENTO').AsDateTime := StrTodate(Data.Text);
      end;

      QRel.Sql.Add(')');

      QRel.Sql.Add('ORDER BY PRODUTOS.PRODUTO_ID');

      QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
      QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
      QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;

      QRel.Prepare;
      QRel.Open;

      QRel.First;
      while not QRel.Eof do
      begin
        with Registro0200New do
        begin
          COD_ITEM     := StrZero(QRel.FieldByName('PRODUTO_ID').AsString, 6, 0);
          DESCR_ITEM   := Alltrim(QRel.FieldByName('DESCRICAO').AsString);
          COD_BARRA    := QRel.FieldByName('COD_BARRA').AsString;
          COD_ANT_ITEM := '';
          UNID_INV     := Alltrim(QRel.FieldByName('UNIDADE_VENDA').AsString);

          if QRel.FieldByName('TIPO_ITEM').AsString = '00 - MERCADORIA PARA REVENDA' then
            TIPO_ITEM := tiMercadoriaRevenda
          else if QRel.FieldByName('TIPO_ITEM').AsString = '01 - MATERIA PRIMA' then
            TIPO_ITEM := tiMateriaPrima
          else if QRel.FieldByName('TIPO_ITEM').AsString = '02 - EMBALAGEM' then
            TIPO_ITEM := tiEmbalagem
          else if QRel.FieldByName('TIPO_ITEM').AsString = '03 - PRODUTO EM PROCESSO' then
            TIPO_ITEM := tiProdutoProcesso
          else if QRel.FieldByName('TIPO_ITEM').AsString = '04 - PRODUTO ACABADO' then
            TIPO_ITEM := tiProdutoAcabado
          else if QRel.FieldByName('TIPO_ITEM').AsString = '05 - SUBPRODUTO' then
            TIPO_ITEM := tiSubproduto
          else if QRel.FieldByName('TIPO_ITEM').AsString = '06 - PRODUTO INTERMEDIARIO' then
            TIPO_ITEM := tiProdutoIntermediario
          else if QRel.FieldByName('TIPO_ITEM').AsString = '07 - MATERIAL DE USO E CONSUMO' then
            TIPO_ITEM := tiMaterialConsumo
          else if QRel.FieldByName('TIPO_ITEM').AsString = '08 - ATIVO IMOBILIZADO' then
            TIPO_ITEM := tiAtivoImobilizado
          else if QRel.FieldByName('TIPO_ITEM').AsString = '09 - SERVICOS' then
            TIPO_ITEM := tiServicos
          else if QRel.FieldByName('TIPO_ITEM').AsString = '10 - OUTROS INSUMOS' then
            TIPO_ITEM := tiOutrosInsumos
          else if QRel.FieldByName('TIPO_ITEM').AsString = '99 - OUTRAS' then
            TIPO_ITEM := tiOutras
          else
            TIPO_ITEM := tiMercadoriaRevenda;

          COD_NCM     := QRel.FieldByName('NCM').AsString;
          EX_IPI      := '';
          COD_GEN     := QRel.FieldByName('COD_GEN').AsString;
          COD_LST     := '';
          ALIQ_ICMS   := QRel.FieldByName('ALIQUOTA_ICMS').AsFloat;
          CEST        := QRel.FieldByName('CEST').AsString;

          {
          with Registro0205New do
          begin
            // Alteração do Item

            // DESCR_ANT_ITEM :=
            // DT_INI         :=
            // DT_FIN         :=
            // COD_ANT_ITEM   :=
          end;

          with Registro0206New do
          begin
            // Produtos Conforme Tabela ANP

            // COD_COMB :=
          end;

          with Registro0220New do
          begin
            // Fatores de Conversão de Unidades

            // UNID_CONV :=
            // FAT_CONV  :=
          end;
             }
          if QRel.FieldByName('TIPO_ITEM').AsString = '00 - MERCADORIA PARA REVENDA' then
            with Registro0221New do
            begin
              COD_ITEM_ATOMICO := StrZero(QRel.FieldByName('PRODUTO_ID').AsString, 6, 0);
              QTDE_CONTIDA     := 1;
            end;
        end;
        Label6.Caption := 'Cadastrando Produtos';
        Label3.Caption := StrZero(QRel.FieldByName('PRODUTO_ID').AsString, 6, 0);

       // Prd_425 := StrZero(QRel.FieldByName('PRODUTO_ID').AsString, 6, 0);
       // Und_425 := Alltrim(QRel.FieldByName('UNIDADE_VENDA').AsString);

        Application.ProcessMessages;
        QRel.Next;
      end;


        QRel.Sql.Clear;
        QRel.Sql.Add('SELECT * FROM SERVICOS');
        QRel.Sql.Add('WHERE');
        QRel.Sql.Add('(SPED = 1)');
        QRel.Sql.Add('ORDER BY DESCRICAO');

        QRel.Prepare;
        QRel.Open;

        QRel.First;
        while not QRel.Eof do
        begin
          with Registro0200New do
          begin

            COD_ITEM     := 'S' + StrZero(QRel.FieldByName('SERVICO_ID').AsString, 6, 0);
            DESCR_ITEM   := Alltrim(QRel.FieldByName('DESCRICAO').AsString);
            COD_BARRA    := QRel.FieldByName('COD_INTERNO').AsString;
            COD_ANT_ITEM := '';
            UNID_INV     := QRel.FieldByName('UNIDADE').AsString;
            TIPO_ITEM    := tiServicos;
            COD_NCM      := QRel.FieldByName('NCM').AsString;
            EX_IPI       := '';
            COD_GEN      := QRel.FieldByName('COD_GEN').AsString;
            COD_LST      := '';
            ALIQ_ICMS    := QRel.FieldByName('ICMS').AsFloat;

          end;
          Label7.Caption := 'Inserindo serviços no arquivo!';
          Label3.Caption := StrZero(QRel.FieldByName('SERVICO_ID').AsString, 6, 0);

          Application.ProcessMessages;
          QRel.Next;
        end;

{
      with Registro0300New do
      begin
        // Cadastro de Bens ou Componentes do Ativo Imobilizado

        // COD_IND_BEM :=
        // IDENT_MERC  :=
        // DESCR_ITEM  :=
        // COD_PRNC    :=
        // COD_CTA     :=
        // NR_PARC     :=

        with Registro0305New do
        begin
          // Informação Sobre a Utilização do Bem

          // COD_CCUS  :=
          // FUNC      :=
          // VIDA_UTIL :=
        end;
      end;

      with Registro0400New do
      begin
        // Tabela de Natureza da Operação/Prestação

        // COD_NAT   :=
        // DESCR_NAT :=
      end; }

      QRel.Sql.Clear;
      QRel.Sql.Add('SELECT COMPL_NFISCAL.*,TRANSACOES.MODELO,TRANSACOES.DT_SPED,TRANSACOES.EMPRESA_ID,TRANSACOES.TPCTB,TRANSACOES.COMPLEMENTO,TRANSACOES.DEPTO ');
      QRel.Sql.Add('FROM COMPL_NFISCAL');
      QRel.Sql.Add('INNER JOIN TRANSACOES ON TRANSACOES.TRANSACAO_ID = COMPL_NFISCAL.TRANSACAO_ID');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(DT_SPED BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (((MODELO = :MODELO1) OR (MODELO = :MODELO2) OR (MODELO = :MODELO3) OR (MODELO = :MODELO4)))');
      QRel.Sql.Add('AND ((DEPTO = :DEPTO) OR (DEPTO = :DEPTO7))');
      QRel.Sql.Add('AND ((TRANSACOES.COMPLEMENTO LIKE :COMPLEMENTO) OR TRANSACOES.DEPTO = :DEPTO)');
      QRel.SQL.Add('AND TRANSACOES.HISTORICO NOT LIKE :HISTORICO');
      QRel.Sql.Add('ORDER BY COMPL_NFISCAL.NO_DOC_FISCAL');

      QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
      QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
      QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
      QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
      QRel.ParamByName('MODELO1').AsString      := '01';
      QRel.ParamByName('MODELO2').AsString      := '1B';
      QRel.ParamByName('MODELO3').AsString      := '04';
      QRel.ParamByName('MODELO4').AsString      := '55';
      QRel.ParamByName('DEPTO').AsString        := '10';
      QRel.ParamByName('DEPTO7').AsString       := '07';
      QRel.ParamByName('COMPLEMENTO').AsString  := 'Rf.Doc' + '%' ;
      QRel.ParamByName('HISTORICO').AsString    := 'AGRUPAMENTO ORÇAMENTOS' + '%' ;

      QRel.Prepare;
      QRel.Open;

      QRel.First;
      while not QRel.Eof do
      begin
       with Registro0450New do
       begin                     // Tabela de Informação Complementar do Documento Fiscal
         if Copy(QRel.FieldByName('COMPLEMENTO').AsString,1,6) = 'Rf.Doc' Then
         Begin
           COD_INF :=  StrZero(QRel.FieldByName('NO_DOC_FISCAL').AsString, 6, 0);
           TXT     :=  Copy(QRel.FieldByName('COMPLEMENTO').AsString,1,150);
         End
         else if QRel.FieldByName('DEPTO').AsString = '10' then
         begin
           COD_INF :=  StrZero(QRel.FieldByName('NO_DOC_FISCAL').AsString, 6, 0);
           QDetalhe.Sql.Clear;
           QDetalhe.Sql.Add('SELECT * FROM TRANSITENS_NOTAS WHERE TRANSACAO_ID = :TRANSACAO_ID');
           QDetalhe.ParamByName('TRANSACAO_ID').AsInteger := QRel.FieldByName('TRANSACAO_ID').AsInteger;
           QDetalhe.Prepare;
           QDetalhe.Open;
           QDetalhe.First;
           TXT := 'Rf.Doc:';
           while not QDetalhe.Eof do
           begin
             TXT := TXT + QDetalhe.FieldByName('NUM_DOC').AsString + '-' + QDetalhe.FieldByName('SERIE').AsString + ',';
             QDetalhe.Next;
           end;
           QDetalhe.First;
         end;
       end;
      QRel.Next;
      end;


      QRel.Sql.Clear;
      QRel.Sql.Add('SELECT COMPL_NFISCAL.*,TRANSACOES.MODELO,TRANSACOES.NUM_DOC,TRANSACOES.DT_SPED,TRANSACOES.EMPRESA_ID,TRANSACOES.TPCTB,TRANSACOES.OBSERVACAO ');
      QRel.Sql.Add('FROM TRANSACOES');
      QRel.Sql.Add('LEFT JOIN COMPL_NFISCAL ON TRANSACOES.TRANSACAO_ID = COMPL_NFISCAL.TRANSACAO_ID');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(DT_SPED BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TPCTB <= :TPCTB) AND ((TRANSACOES.COMPLEMENTO <> ''INUTILIZADA'') OR (TRANSACOES.COMPLEMENTO IS NULL))');
      QRel.Sql.Add('AND (((MODELO = :MODELO1) OR (MODELO = :MODELO2) OR (MODELO = :MODELO3) OR (MODELO = :MODELO4)))');
      QRel.Sql.Add('AND ((DEPTO = :DEPTO) OR (DEPTO = :DEPTO7))');
      QRel.Sql.Add('AND (LENGTH(TRANSACOES.OBSERVACAO) > 3)');
      QRel.Sql.Add('ORDER BY COMPL_NFISCAL.NO_DOC_FISCAL');

      QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
      QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
      QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
      QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
      QRel.ParamByName('MODELO1').AsString      := '01';
      QRel.ParamByName('MODELO2').AsString      := '1B';
      QRel.ParamByName('MODELO3').AsString      := '04';
      QRel.ParamByName('MODELO4').AsString      := '55';
      QRel.ParamByName('DEPTO').AsString        := '10';
      QRel.ParamByName('DEPTO7').AsString       := '07';

      QRel.Prepare;
      QRel.Open;

      QRel.First;

      while not QRel.Eof do
      begin
        if (StringReplace(QRel.FieldByName('OBSERVACAO').AsString, #13#10, '', [rfReplaceAll]) <> 'DENEGADA') or (Versao.Text <> '117') then
          with Registro0460New do
          begin
            // Tabela de Informações do Lanc. Fiscal
             COD_OBS := Copy(QRel.FieldByName('NUM_DOC').AsString,4,6);
             TXT     := StringReplace(QRel.FieldByName('OBSERVACAO').AsString, #13#10, '', [rfReplaceAll]);

          end;
        QRel.Next;
      end;

     { with Registro0500New do
      begin
        // Plano de Contas Contábeis

        // DT_ALT     :=
        // COD_NAT_CC :=
        // IND_CTA    :=
        // NIVEL      :=
        // COD_CTA    :=
        // NOME_CTA   :=
      end;

      with Registro0600New do
      begin
        // Cadastro de Centro de Custos

        // DT_ALT   :=
        // COD_CCUS :=
        // CCUS     :=
      end;
}
    end;
  end;

  ACBrSPEDFiscal1.WriteBloco_0;

end;

procedure TFrmSPED_Fiscal.Registros_Bloco_B;
begin

 with ACBrSpedFiscal1.Bloco_B do
  begin

    with RegistroB001New do
    begin
      //if not QRel.IsEmpty then
      //  IND_MOV := imComDados
      //else
        IND_MOV := imSemDados;
    end;
  end;


ACBrSPEDFiscal1.WriteBloco_B;

end;

procedure TFrmSPED_Fiscal.Registros_Bloco_C;
var
INotas, IITens,Cup,I: Integer;
Valor_ICMS,Dif_Tot,Valor_Icms_st,Dif_Item,D_Vbruta,Valor_Totalizador,Totalizador_item, Desc_base_icms, Desc_vl_icms : Real;
Doc_Cancelado: Boolean;
Chave_NFe: String;
begin
  QRel.Sql.Clear;
  QRel.Sql.Add('SELECT * FROM TRANSACOES');
  QRel.Sql.Add('WHERE');
  QRel.Sql.Add('(DT_SPED BETWEEN :DT_INICIAL AND :DT_FINAL)');
  QRel.Sql.Add('AND (EMPRESA_ID = :EMPRESA_ID)');
  QRel.Sql.Add('AND (TPCTB <= :TPCTB) AND ((COMPLEMENTO <> ''INUTILIZADA'') OR (COMPLEMENTO IS NULL)) ');


  if FrmPrincipal.Config.FieldByName('SPED_SERVICO').AsString = 'True' then
  QRel.Sql.Add('AND (((MODELO = :MODELO1) OR (MODELO = :MODELO2) OR (MODELO = :MODELO3) OR (MODELO = :MODELO4) OR (MODELO = :MODELO5) OR (MODELO =:MODELO6)))')
  else
  QRel.Sql.Add('AND (((MODELO = :MODELO1) OR (MODELO = :MODELO2) OR (MODELO = :MODELO3) OR (MODELO = :MODELO4)OR (MODELO =:MODELO6)))');    //

  QRel.Sql.Add('ORDER BY DT_TRANS, NUM_DOC');

  QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
  QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
  QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
  QRel.ParamByName('MODELO1').AsString      := '01';
  QRel.ParamByName('MODELO2').AsString      := '1B';
  QRel.ParamByName('MODELO3').AsString      := '04';
  QRel.ParamByName('MODELO4').AsString      := '55';

  if FrmPrincipal.Config.FieldByName('SPED_SERVICO').AsString = 'True' then
  QRel.ParamByName('MODELO5').AsString      := '99';

  QRel.ParamByName('MODELO6').AsString      := '65';


  QRel.Prepare;
  QRel.Open;

  INotas := 1;

  with ACBrSpedFiscal1.Bloco_C do
  begin
    with RegistroC001New do
    begin
      if not QRel.IsEmpty then
        IND_MOV := imComDados
      else
        IND_MOV := imSemDados;

      QRel.First;
      while not QRel.Eof do
      begin
        Desc_base_icms := 0;
        Desc_vl_icms   := 0;
        
        Doc_Cancelado := False;
        Chave_NFe     := '';
       //if QRel.FieldByName('CONDUTA').AsString = '02' then
       //  ShowMessage(QRel.FieldByName('NUM_DOC').AsString);
       If QRel.FieldByName('MODELO').AsString = '55' then
       Begin

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

        if (not QDetalhe.IsEmpty) or (QRel.FieldByName('MODELO').AsString = '99')  then
        begin
          Doc_Cancelado := False;
          Chave_NFe     := QDetalhe.FieldByName('CHAVE_NFE').AsString;
        end;

        if (not QDetalhe.IsEmpty) and (Qrel.FieldByName('CHAVE_NFE').AsString <> '') AND (Qrel.FieldByName('CONDUTA').AsString = '02') AND (Qrel.FieldByName('DEPTO').AsString = '10') then
          Chave_NFe     := QDetalhe.FieldByName('CHAVE_NFE').AsString;


       End
       Else
       begin

        QDetalhe.Sql.Clear;
        QDetalhe.Sql.Add('SELECT * FROM NOTAS_CANCELADAS_NFCE');
        QDetalhe.Sql.Add('WHERE');
        QDetalhe.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

        QDetalhe.ParamByName('TRANSACAO_ID').AsInteger := QRel.FieldByName('TRANSACAO_ID').AsInteger;

        QDetalhe.Prepare;
        QDetalhe.Open;

        if not QDetalhe.IsEmpty then
        begin
          Doc_Cancelado := True;
          Chave_NFe     := QDetalhe.FieldByName('CHAVE_NFCE').AsString;
        end;

        QDetalhe.Sql.Clear;
        QDetalhe.Sql.Add('SELECT * FROM COMPL_NFCEFISCAL');
        QDetalhe.Sql.Add('WHERE');
        QDetalhe.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

        QDetalhe.ParamByName('TRANSACAO_ID').AsInteger := QRel.FieldByName('TRANSACAO_ID').AsInteger;

        QDetalhe.Prepare;
        QDetalhe.Open;

        if (not QDetalhe.IsEmpty) or (QRel.FieldByName('MODELO').AsString = '99')  then
        begin
          Doc_Cancelado := False;
          Chave_NFe     := QDetalhe.FieldByName('CHAVE_NFCE').AsString;
        end;

        if (not QDetalhe.IsEmpty) and (Qrel.FieldByName('CHAVE_NFE').AsString <> '') AND (Qrel.FieldByName('CONDUTA').AsString = '02') AND (Qrel.FieldByName('DEPTO').AsString = '10') then
          Chave_NFe     := QDetalhe.FieldByName('CHAVE_NFCE').AsString;
       end;

       if (QRel.FieldByName('COMPLEMENTO').AsString <> 'DENEGADA') or (Versao.Text <> '117') then
        with RegistroC100.New do
        begin

          Valor_Icms_st := 0;

          if not Doc_Cancelado then
          begin
            if (QRel.FieldByName('CONDUTA').AsString = '02')  then
            begin
              IND_OPER := tpEntradaAquisicao;
              IND_EMIT := edTerceiros;

              if (QRel.FieldByName('DEPTO').AsString = '10') then
              IND_EMIT :=  edEmissaoPropria;


              if (Qrel.FieldByName('SUB_SERIE').AsString = 'P') and (QRel.FieldByName('DEPTO').AsString = '07') then
              IND_EMIT := edEmissaoPropria;

              if (Qrel.FieldByName('SUB_SERIE').AsString = 'P') AND (QRel.FieldByName('DEPTO').AsString = '10') then
              IND_EMIT :=  edTerceiros;

              COD_PART := 'F' + StrZero(QRel.FieldByName('FORNECEDOR_ID').AsString, 6, 0);

              if (QRel.FieldByName('CONDUTA').AsString = '02') and (QRel.FieldByName('DEPTO').AsString = '10') Then
              COD_PART := 'C' + StrZero(QRel.FieldByName('CLIENTE_ID').AsString, 6, 0);

              if (QRel.FieldByName('CONDUTA').AsString = '02') and (QRel.FieldByName('DEPTO').AsString = '07') Then
              begin
                IQuery.sql.Clear;
                IQuery.SQL.Add('SELECT SUM(BASE_CALC_ICMS) BASE_ICMS, SUM(VALOR_ICMS) VALOR_ICMS');
                IQuery.SQL.Add('FROM TRANSITENS');
                IQuery.SQL.Add('WHERE ((CST = :CST1) OR (CST = :CST2)) AND (TRANSACAO_ID = :TRANSACAO_ID)');

                IQuery.ParamByName('CST1').AsString := '010';
                IQuery.ParamByName('CST2').AsString := '070';
                IQuery.ParamByName('TRANSACAO_ID').AsInteger := QRel.FieldByName('TRANSACAO_ID').AsInteger;
                IQuery.Prepare;
                IQuery.Open;

                if not IQuery.IsEmpty then
                begin
                  Desc_base_icms := RoundTo(IQuery.FieldByName('BASE_ICMS').AsFloat, -2);
                  Desc_vl_icms   := RoundTo(IQuery.FieldByName('VALOR_ICMS').AsFloat, -2);
                end;
              end;
            end
            Else
            begin
              IND_OPER := tpSaidaPrestacao;
              IND_EMIT := edEmissaoPropria;
              Desc_base_icms := 0;
              Desc_vl_icms   := 0;
            end;

            if QRel.FieldByName('MODELO').AsString = '99' then
            COD_MOD := '01'
            else
            COD_MOD := QRel.FieldByName('MODELO').AsString;

            COD_SIT := sdRegular;
            SER     := QRel.FieldByName('SERIE').AsString;
            NUM_DOC := StrZero(QRel.FieldByName('NUM_DOC').AsString, 9, 0);
            CHV_NFE := Chave_NFe;

             IF  ((QRel.FieldByName('SERIE').AsString >= '890') and (QRel.FieldByName('SERIE').AsString <= '899')) Then
             COD_SIT := sdRegimeEspecNEsp;

            if (QRel.FieldByName('MODELO').AsString <> '65') and (((QRel.FieldByName('CONDUTA').AsString = '01') and (QRel.FieldByName('DEPTO').AsString = '10')) or ((QRel.FieldByName('CONDUTA').AsString = '01') and (QRel.FieldByName('DEPTO').AsString = '07'))) then
              Begin
               COD_PART := 'C' + StrZero(QRel.FieldByName('CLIENTE_ID').AsString, 6, 0);
               CHV_NFE := Chave_NFe;

               if (QRel.FieldByName('CONDUTA').AsString = '01') and (QRel.FieldByName('DEPTO').AsString = '10') Then
               COD_PART := 'F' + StrZero(QRel.FieldByName('FORNECEDOR_ID').AsString, 6, 0);

               if QRel.FieldByName('CFOP').AsString = '5929' then
                 COD_SIT := sdRegimeEspecNEsp;
              End
            else
            begin
              if QRel.FieldByName('CHAVE_NFE').AsString <> '' then
                 CHV_NFE := QRel.FieldByName('CHAVE_NFE').AsString;
            end;

           // Alterado a pedido  de Regivaldo 21/09/2018 as 10:20
           {if  (QRel.FieldByName('CONDUTA').AsString = '01') Then
            DT_E_S        := QRel.FieldByName('DT_ENT_SAI').AsDateTime
           Else
           }

            DT_E_S        := QRel.FieldByName('DT_SPED').AsDateTime;

            DT_DOC        := QRel.FieldByName('DT_TRANS').AsDateTime;

            if QRel.FieldByName('cond_pagto').AsString = 'A PRAZO' then
               IND_PGTO      := tpPrazo
            else if QRel.FieldByName('cond_pagto').AsString = 'A VISTA' then
               IND_PGTO      := tpVista
            else if (QRel.FieldByName('cond_pagto').AsString = 'OUTROS')  OR (QRel.FieldByName('cond_pagto').AsString = '')then
               IND_PGTO      := tpOutros ; // tpSemPagamento;

            VL_DESC       := 0;//QRel.FieldByName('VR_DESCONTO').AsFloat;
            VL_ABAT_NT    := 0;
            IND_FRT       := tfSemCobrancaFrete;
            VL_SEG        := 0;
            VL_BC_ICMS    := QRel.FieldByName('BASE_ICMS_NORMAL').AsFloat;   //desc é só de 010 e 070, retirado em 09/04/2025
            VL_ICMS       := QRel.FieldByName('VR_ICMS_NORMAL').AsFloat;
            VL_OUT_DA     := 0;
            VL_DOC        := QRel.FieldByName('VALOR_PRODUTOS').AsFloat + QRel.FieldByName('VR_IPI').AsFloat + QRel.FieldByName('VR_ICMS_ST').AsFloat + QRel.FieldByName('VR_FCP').AsFloat + QRel.FieldByName('VR_FCPST').AsFloat - QRel.FieldByName('VR_DESCONTO').AsFloat + QRel.FieldByName('VR_ACRESCIMO').AsFloat + QRel.FieldByName('VR_FRETE').AsFloat;
            VL_FRT        := 0;
            VL_MERC       := QRel.FieldByName('VALOR_PRODUTOS').AsFloat + QRel.FieldByName('VR_FCP').AsFloat + QRel.FieldByName('VR_FCPST').AsFloat - QRel.FieldByName('VR_DESCONTO').AsFloat + QRel.FieldByName('VR_ACRESCIMO').AsFloat + QRel.FieldByName('VR_FRETE').AsFloat;
            VL_IPI        := QRel.FieldByName('VR_IPI').AsFloat;

            if (FrmPrincipal.Config.FieldByName('SPED_ICMS_ST_OUTROS').AsString = 'True') and
            (QRel.FieldByName('CONDUTA').AsString = '02') and ((QRel.FieldByName('DEPTO').AsString = '10') or (QRel.FieldByName('DEPTO').AsString = '07')) then

            Begin
            VL_BC_ICMS_ST := 0;
            VL_ICMS_ST    := 0;
            VL_OUT_DA     := 0;//QRel.FieldByName('VR_ACRESCIMO').AsFloat + QRel.FieldByName('VR_ICMS_ST').AsFloat;

            {
            VL_DOC        := QRel.FieldByName('VALOR_PRODUTOS').AsFloat + QRel.FieldByName('VR_ACRESCIMO').AsFloat +
                              QRel.FieldByName('VR_IPI').AsFloat - QRel.FieldByName('VR_DESCONTO').AsFloat + QRel.FieldByName('VR_ICMS_ST').AsFloat;}

             //alterado Regivaldo 09/06/15 16:50

            Valor_Icms_st := QRel.FieldByName('VR_ACRESCIMO').AsFloat + QRel.FieldByName('VR_ICMS_ST').AsFloat;
            End
            Else
            Begin
            VL_BC_ICMS_ST := QRel.FieldByName('BASE_ICMS_ST').AsFloat;
            VL_ICMS_ST    := QRel.FieldByName('VR_ICMS_ST').AsFloat;
            End;

            if (FrmPrincipal.Config.FieldByName('SPED_ICMS_ST_IPI_MERC').AsString = 'True') and
            (QRel.FieldByName('CONDUTA').AsString = '02') and ((QRel.FieldByName('DEPTO').AsString = '10') or (QRel.FieldByName('DEPTO').AsString = '07')) then
            Begin
            VL_MERC       := QRel.FieldByName('VALOR_PRODUTOS').AsFloat + QRel.FieldByName('VR_IPI').AsFloat + QRel.FieldByName('VR_ICMS_ST').AsFloat + QRel.FieldByName('VR_FCP').AsFloat + QRel.FieldByName('VR_FCPST').AsFloat - QRel.FieldByName('VR_DESCONTO').AsFloat + QRel.FieldByName('VR_ACRESCIMO').AsFloat + QRel.FieldByName('VR_FRETE').AsFloat;
            VL_IPI        := 0;
            VL_BC_ICMS_ST := 0;
            VL_ICMS_ST    := 0;
            End;


           //Alerado 17/02/17 Solicitação Cristo Rei/Regivaldo
            VL_PIS        := 0; // QRel.FieldByName('VR_PIS').AsFloat;
            VL_COFINS     := 0; //QRel.FieldByName('VR_COFINS').AsFloat;

            VL_PIS_ST     := 0;//QRel.FieldByName('VR_PIS_ST').AsFloat;
            VL_COFINS_ST  := 0;//QRel.FieldByName('VR_COFINS_ST').AsFloat;
          end
          else
          begin
            if ((QRel.FieldByName('CONDUTA').AsString = '02') and (QRel.FieldByName('DEPTO').AsString = '10')) or ((QRel.FieldByName('CONDUTA').AsString = '02') and (QRel.FieldByName('DEPTO').AsString = '07'))     then
            begin
              IND_OPER := tpEntradaAquisicao;
              IND_EMIT := edTerceiros;
              COD_PART := '';

              if Qrel.FieldByName('SUB_SERIE').AsString = 'P' then
              IND_EMIT := edEmissaoPropria;
            end
            Else
            begin
              IND_OPER := tpSaidaPrestacao;
              IND_EMIT := edEmissaoPropria;

              if (QRel.FieldByName('MODELO').AsString <> '65') Then
              COD_PART := '';
            end;

            COD_MOD := QRel.FieldByName('MODELO').AsString;
            COD_SIT :=  sdCancelado;

            if QRel.FieldByName('COMPLEMENTO').AsString = 'INUTILIZADA' then
               COD_SIT := sdDoctoNumInutilizada;

            if QRel.FieldByName('COMPLEMENTO').AsString = 'DENEGADA' then
               COD_SIT := sdDoctoDenegado;


            SER     := QRel.FieldByName('SERIE').AsString;
            NUM_DOC := StrZero(QRel.FieldByName('NUM_DOC').AsString, 9, 0);
            CHV_NFE := Chave_NFe;

            if ((QRel.FieldByName('CONDUTA').AsString = '02') and (QRel.FieldByName('DEPTO').AsString = '10')) or ((QRel.FieldByName('CONDUTA').AsString = '01') and (QRel.FieldByName('DEPTO').AsString = '07')) then
              CHV_NFE := Chave_NFe
            else
            begin
              if QRel.FieldByName('CHAVE_NFE').AsString <> '' then
                CHV_NFE := QRel.FieldByName('CHAVE_NFE').AsString;
            end;

            if QRel.FieldByName('COMPLEMENTO').AsString = 'INUTILIZADA' then
            CHV_NFE := '';

            DT_DOC        := QRel.FieldByName('DT_ENT_SAI').AsDateTime;
            DT_E_S        := QRel.FieldByName('DT_ENT_SAI').AsDateTime;
            VL_DOC        := 0;
            IND_PGTO      := tpNenhum;
            VL_DESC       := 0;
            VL_ABAT_NT    := 0;
            VL_MERC       := 0;
            IND_FRT       := tfNenhum;
            VL_SEG        := 0;
            VL_OUT_DA     := 0;
            VL_BC_ICMS    := 0;
            VL_ICMS       := 0;
            VL_BC_ICMS_ST := 0;
            VL_ICMS_ST    := 0;
            VL_IPI        := 0;
            VL_PIS        := 0;
            VL_COFINS     := 0;
            VL_PIS_ST     := 0;
            VL_COFINS_ST  := 0;
          end;

              if ((QRel.FieldByName('CONDUTA').AsString = '01') and (QRel.FieldByName('DEPTO').AsString = '07') OR
                 (QRel.FieldByName('CONDUTA').AsString = '01') and (QRel.FieldByName('DEPTO').AsString = '10') OR
                 (QRel.FieldByName('CONDUTA').AsString = '02') and (QRel.FieldByName('DEPTO').AsString = '10')) and
                 (not Doc_Cancelado) Then

              Begin
                //if (QRel.FieldByName('CONDUTA').AsString = '02') and (QRel.FieldByName('DEPTO').AsString = '10') OR
                //   (QRel.FieldByName('CONDUTA').AsString = '01') and (QRel.FieldByName('DEPTO').AsString = '10') then
                //Begin


                  Q113.Sql.Clear;
                  Q113.Sql.Add('SELECT * FROM TRANSITENS_NOTAS WHERE TRANSACAO_ID = :TRANSACAO_ID');
                  Q113.ParamByName('TRANSACAO_ID').AsInteger := QRel.FieldByName('TRANSACAO_ID').AsInteger;
                  Q113.Prepare;
                  Q113.Open;
                  Q113.First;

                  if not Q113.IsEmpty Then
                  Begin
                   if (Copy(QRel.FieldByName('COMPLEMENTO').AsString ,1,6) = 'Rf.Doc') or (QRel.FieldByName('DEPTO').AsString = '10') then
                   Begin

                       With RegistroC110New do
                       Begin
                         COD_INF   := IntToStrZero(QDetalhe.FieldByName('NO_DOC_FISCAL').AsInteger,6);
                         if Copy(QRel.FieldByName('COMPLEMENTO').AsString ,1,6) = 'Rf.Doc' then
                           TXT_COMPL := Copy(QRel.FieldByName('COMPLEMENTO').AsString,1,150)
                         else
                         begin
                           TXT_COMPL := 'Rf.Doc:';
                           while not Q113.Eof do
                           begin
                             TXT_COMPL := TXT_COMPL + Q113.FieldByName('NUM_DOC').AsString + '-' + Q113.FieldByName('SERIE').AsString + ',';
                             Q113.Next;
                           end;
                           Q113.First;
                         end;
                       End;

                    While not Q113.eof do
                    Begin

                    With RegistroC113New do
                     Begin

                       if (QRel.FieldByName('CONDUTA').AsString = '01') and (QRel.FieldByName('DEPTO').AsString = '10')
                       OR (QRel.FieldByName('CONDUTA').AsString = '02') and (QRel.FieldByName('DEPTO').AsString = '07') then
                       Begin
                       IND_OPER := tpEntradaAquisicao;
                       IND_EMIT := edTerceiros;
                       COD_PART := 'F' + StrZero(QRel.FieldByName('FORNECEDOR_ID').AsString, 6, 0);
                       End
                       Else
                       Begin
                       IND_OPER := tpSaidaPrestacao;
                       IND_EMIT := edEmissaoPropria;
                       COD_PART := 'C' + StrZero(QRel.FieldByName('CLIENTE_ID').AsString, 6, 0);
                       End;
                       COD_MOD  := Q113.FieldByName('MODELO').AsString;
                       SER      := Q113.FieldByName('SERIE').AsString;
                       NUM_DOC  := StrZero(Copy(Q113.FieldByName('NUM_DOC').AsString,1,9), 9, 0);
                       DT_DOC   := Q113.FieldByName('DT_EMISSAO').AsDateTime;
                       CHV_DOCE := Q113.FieldByName('CHAVE_NFE').AsString;

                     End;
                      Q113.Next;
                    End;
                   End;
                  End;


                  {Q113.SQL.Clear;
                  Q113.SQL.Add('SELECT TRANSACOES.*');
                  Q113.SQL.Add('FROM TRANSACOES');
                  Q113.SQL.Add('WHERE TRANSACOES.TRANSACAO_ID = :TRANSACAO_ID');

                  if (QRel.FieldByName('CONDUTA').AsString = '02') and (QRel.FieldByName('DEPTO').AsString = '10') then
                  Q113.ParamByName('TRANSACAO_ID').AsInteger :=  QRel.FieldByName('SAIDA_ID').AsInteger;

                  if (QRel.FieldByName('CONDUTA').AsString = '01') and (QRel.FieldByName('DEPTO').AsString = '10') Then
                  Q113.ParamByName('TRANSACAO_ID').AsInteger :=  QRel.FieldByName('ENTRADA_ID').AsInteger;

                  Q113.Prepare;
                  Q113.Open;
                  }

                //End;
                {
                if not Doc_Cancelado then
                Try
                begin



                   if Copy(QDetalhe.FieldByName('INSTRUCOES').AsString ,1,6) = 'Rf.Doc'  then
                   Begin

                       With RegistroC110New do
                       Begin
                         COD_INF   := IntToStrZero(QDetalhe.FieldByName('NO_DOC_FISCAL').AsInteger,6);
                         TXT_COMPL := Copy(QDetalhe.FieldByName('INSTRUCOES').AsString,1,150);
                       End;

                     Cup := 8 ;

                     for I := 0 to 30 - 1 do
                     Begin
                     if Copy(QDetalhe.FieldByName('INSTRUCOES').AsString,cup,7) <> '' then
                     Begin
                      Q113.SQL.Clear;
                      Q113.SQL.Add('SELECT  *  ');
                      Q113.SQL.Add('FROM TRANSACOES');
                      Q113.SQL.Add('WHERE TRANSACOES.NUM_DOC = :NUM_DOC');
                      Q113.Sql.Add('AND (DT_SPED BETWEEN :DT_INICIAL AND :DT_FINAL)');
                      Q113.Sql.Add('AND (MODELO = :MODELO OR MODELO = :MODELO1)');

                      if  Copy(QDetalhe.FieldByName('INSTRUCOES').AsString,(cup + 7),1) = '-' Then
                      Q113.SQL.Add('AND BANCO_ID = :BANCO_ID');

                      Q113.Sql.Add('ORDER BY DT_SPED');

                      Q113.ParamByName('NUM_DOC').AsString := Copy(QDetalhe.FieldByName('INSTRUCOES').AsString,cup,7);
                      Q113.ParamByName('MODELO').AsString  := '65';
                      Q113.ParamByName('MODELO1').AsString := '55';

                      if  Copy(QDetalhe.FieldByName('INSTRUCOES').AsString,(cup + 7),1) = '-' Then
                      Q113.ParamByName('BANCO_ID').AsInteger  :=  StrToInt(Copy(QDetalhe.FieldByName('INSTRUCOES').AsString,(Cup + 8),2));

                      if (Copy(Dtmen.text,4,2) = '01')  then
                      Q113.ParamByName('DT_INICIAL').AsDateTime := StrToDate('01/11/' + StrZero(IntToStr(StrToInt(Copy(Dtmen.text,9,2)) -1) ,2,0))
                      Else
                      Q113.ParamByName('DT_INICIAL').AsDateTime :=  StrToDate('01/01/' + Copy(DtMen.Text,9,2));

                      Q113.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
                      Q113.Prepare;
                      Q113.Open;

                      if not Q113.IsEmpty then
                      Begin
                        With RegistroC113New do
                        Begin
                         if (QRel.FieldByName('CONDUTA').AsString = '01') and (QRel.FieldByName('DEPTO').AsString = '10')
                         OR (QRel.FieldByName('CONDUTA').AsString = '02') and (QRel.FieldByName('DEPTO').AsString = '07') then
                         Begin
                         IND_OPER := tpEntradaAquisicao;
                         IND_EMIT := edTerceiros;
                         COD_PART := 'F' + StrZero(QRel.FieldByName('FORNECEDOR_ID').AsString, 6, 0);
                         End
                         Else
                         Begin
                         IND_OPER := tpSaidaPrestacao;
                         IND_EMIT := edEmissaoPropria;
                         COD_PART := 'C' + StrZero(QRel.FieldByName('CLIENTE_ID').AsString, 6, 0);
                         End;
                             COD_MOD  := Q113.FieldByName('MODELO').AsString;
                             SER      := Q113.FieldByName('SERIE').AsString;
                             NUM_DOC  := StrZero(Copy(Q113.FieldByName('NUM_DOC').AsString,1,9), 9, 0);
                             DT_DOC   := Q113.FieldByName('DT_ENT_SAI').AsDateTime;
                             CHV_DOCE := Q113.FieldByName('CHAVE_NFE').AsString;
                        End;
                      End;

                     End;
                     if  Copy(QDetalhe.FieldByName('INSTRUCOES').AsString,(cup + 7),1) = '-' Then
                     Cup := Cup + 11
                     Else
                         Cup := Cup + 8;
                     End;

                     if (QRel.FieldByName('CONDUTA').AsString = '01') and (QRel.FieldByName('DEPTO').AsString = '07') OR
                        (QRel.FieldByName('CONDUTA').AsString = '02') and (QRel.FieldByName('DEPTO').AsString = '10')Then
                     Begin
                     Cup := 8 ;

                       for I := 0 to 20 - 1 do
                       Begin
                       if Copy(QDetalhe.FieldByName('INSTRUCOES').AsString,cup,7) <> '' then
                       Begin
                        Q113.SQL.Clear;
                        Q113.SQL.Add('SELECT TRANSACOES.*,LICENCA_IF.* ');
                        Q113.SQL.Add('FROM TRANSACOES');
                        Q113.SQL.Add('INNER JOIN LICENCA_IF ON CAST(LICENCA_IF.NUM_ECF AS INTEGER) = TRANSACOES.BANCO_ID  ');
                        Q113.SQL.Add('WHERE TRANSACOES.NUM_DOC = :NUM_DOC AND TRANSACOES.MODELO = :MODELO');
                        Q113.Sql.Add('AND (DT_SPED BETWEEN :DT_INICIAL AND :DT_FINAL)');

                        if  Copy(QDetalhe.FieldByName('INSTRUCOES').AsString,(cup + 7),1) = '-' Then
                        Q113.SQL.Add('AND BANCO_ID = :BANCO_ID');

                        Q113.Sql.Add('ORDER BY DT_SPED');

                        Q113.ParamByName('NUM_DOC').AsString := Copy(QDetalhe.FieldByName('INSTRUCOES').AsString,cup,7);
                        Q113.ParamByName('MODELO').AsString  := '2D';

                        if  Copy(QDetalhe.FieldByName('INSTRUCOES').AsString,(cup + 7),1) = '-' Then
                        Q113.ParamByName('BANCO_ID').AsInteger  :=  StrToInt(Copy(QDetalhe.FieldByName('INSTRUCOES').AsString,(Cup + 8),2));

                        if (Copy(Dtmen.text,4,2) = '01')  then
                        Q113.ParamByName('DT_INICIAL').AsDateTime := StrToDate('01/11/' + StrZero(IntToStr(StrToInt(Copy(Dtmen.text,9,2)) -1) ,2,0))
                        Else
                        Q113.ParamByName('DT_INICIAL').AsDateTime :=  StrToDate('01/01/' + Copy(DtMen.Text,9,2));

                        Q113.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
                        Q113.Prepare;
                        Q113.Open;

                        if not Q113.IsEmpty then
                        Begin
                         With RegistroC114New do
                           Begin
                            COD_MOD  := Q113.FieldByName('MODELO').AsString;
                            ECF_FAB  := Q113.FieldByName('SERIAL').AsString;
                            ECF_CX   := Q113.FieldByName('NUM_ECF').AsString;
                            NUM_DOC  := StrZero(Copy(Q113.FieldByName('NUM_DOC').AsString,3,6), 6, 0);
                            DT_DOC   := Q113.FieldByName('DT_ENT_SAI').AsDateTime;
                           End;
                        End;
                       End;
                       if  Copy(QDetalhe.FieldByName('INSTRUCOES').AsString,(cup + 7),1) = '-' Then
                       Cup := Cup + 11
                       Else
                       Cup := Cup + 8;
                       End;
                     End;

                   End;

                end;
                Except;

                End;

                }
              End;

              {if (QRel.FieldByName('CONDUTA').AsString = '01') and (QRel.FieldByName('DEPTO').AsString = '10') Then
              Begin
               if not Doc_Cancelado then
                begin
                if QRel.FieldByName('ENTRADA_ID').AsInteger > 0  then
                 Begin
                   Q113.SQL.Clear;
                   Q113.SQL.Add('SELECT TRANSACOES.*');
                   Q113.SQL.Add('FROM TRANSACOES');
                   Q113.SQL.Add('WHERE TRANSACOES.TRANSACAO_ID = :TRANSACAO_ID');
                   Q113.ParamByName('TRANSACAO_ID').AsInteger :=  QRel.FieldByName('ENTRADA_ID').AsInteger;
                   Q113.Prepare;
                   Q113.Open;

               With RegistroC110New do
                   Begin
                   COD_INF   := StrZero(QRel.FieldByName('NUM_DOC').AsString, 6, 0);
                   TXT_COMPL := Copy(QDetalhe.FieldByName('INSTRUCOES').AsString,1,47);
                   End;

                 With RegistroC113New do
                   Begin
                   IND_OPER := tpSaidaPrestacao;
                   IND_EMIT := edemissaoPropria;
                   COD_PART := 'F' + StrZero(Q113.FieldByName('FORNECEDOR_ID').AsString, 6, 0);
                   COD_MOD  := Q113.FieldByName('MODELO').AsString;
                   SER      := Q113.FieldByName('SERIE').AsString;
                   NUM_DOC  := StrZero(Q113.FieldByName('NUM_DOC').AsString, 9, 0);
                   DT_DOC   := Q113.FieldByName('DT_ENT_SAI').AsDateTime;
                  End;
                 End;
                end;
              End;

              if (QRel.FieldByName('CONDUTA').AsString = '02') and (QRel.FieldByName('DEPTO').AsString = '10') Then
              Begin
               if not Doc_Cancelado then
                begin
                if QRel.FieldByName('SAIDA_ID').AsInteger > 0  then
                 Begin
                   Q113.SQL.Clear;
                   Q113.SQL.Add('SELECT TRANSACOES.*');
                   Q113.SQL.Add('FROM TRANSACOES');
                   Q113.SQL.Add('WHERE TRANSACOES.TRANSACAO_ID = :TRANSACAO_ID');
                   Q113.ParamByName('TRANSACAO_ID').AsInteger :=  QRel.FieldByName('ENTRADA_ID').AsInteger;
                   Q113.Prepare;
                   Q113.Open;

               With RegistroC110New do
                   Begin
                   COD_INF   := StrZero(QRel.FieldByName('NUM_DOC').AsString, 6, 0);
                   TXT_COMPL := Copy(QDetalhe.FieldByName('INSTRUCOES').AsString,1,47);
                   End;

                 With RegistroC113New do
                   Begin
                   IND_OPER := tpSaidaPrestacao;
                   IND_EMIT := edemissaoPropria;
                   COD_PART := 'C' + StrZero(Q113.FieldByName('CLIENTE_ID').AsString, 6, 0);
                   COD_MOD  := Q113.FieldByName('MODELO').AsString;
                   SER      := Q113.FieldByName('SERIE').AsString;
                   NUM_DOC  := StrZero(Q113.FieldByName('NUM_DOC').AsString, 9, 0);
                   DT_DOC   := Q113.FieldByName('DT_ENT_SAI').AsDateTime;
                  End;
                 End;
                end;
              End;}
          {
           Label3.Caption := 'Documento:' + (QRel.FieldByName('NUM_DOC').AsString);

          if (QRel.FieldByName('CONDUTA').AsString = '02') and (QRel.FieldByName('DEPTO').AsString = '07')
             AND ((QRel.FieldByName('MODELO').AsString = '01') or (QRel.FieldByName('MODELO').AsString = '1A') )
             AND  (QRel.FieldByName('COND_PAGTO').AsString = 'A PRAZO')  Then
          Begin
           if not Doc_Cancelado then
            begin
             Q113.SQL.Clear;
             Q113.SQL.Add('SELECT * ');
             Q113.SQL.Add('FROM TRANSPARCELAS');
             Q113.SQL.Add('WHERE TRANSACAO_ID = :TRANSACAO_ID');
             Q113.ParamByName('TRANSACAO_ID').AsInteger :=  QRel.FieldByName('TRANSACAO_ID').AsInteger;
             Q113.Prepare;
             Q113.Open;


             With RegistroC140New do
             Begin
              if (Qrel.FieldByName('SUB_SERIE').AsString = 'P') and (QRel.FieldByName('DEPTO').AsString = '07') then
              IND_EMIT := edEmissaoPropria
              Else
              IND_EMIT := edTerceiros;

              IND_TIT := tcDuplicata;
              DESC_TIT := '';
              NUM_TIT  := Q113.FieldByName('DUPLICATA').AsString;
              QTD_PARC := StrToInt(copy(Q113.FieldByName('PARCELA_ID').AsString,4,2));
              VL_TIT   := QREl.FieldByName('VALOR').AsFloat;
             End;

             Q113.First;

             while not Q113.eof do
             Begin
              With Registroc141new do
              Begin
              NUM_PARC := Copy (Q113.FieldByName('PARCELA_ID').AsString,1,2);
              DT_VCTO  := Q113.FieldByName('DT_VENCIMENTO').AsDateTime;
              VL_PARC  := Q113.FieldByName('VALOR').AsFloat;
              End ;
              Q113.Next;
             End;
            end;
          End;
           }

          if  (((QRel.FieldByName('CONDUTA').AsString = '02') and (QRel.FieldByName('DEPTO').AsString = '07') and (Qrel.FieldByName('SUB_SERIE').AsString <> 'P') ) OR
              ((QRel.FieldByName('CONDUTA').AsString = '01') and (QRel.FieldByName('DEPTO').AsString = '07') AND
              (QRel.FieldByName('MODELO').AsString <> '55')) OR ((QRel.FieldByName('CONDUTA').AsString = '02') and
              (QRel.FieldByName('DEPTO').AsString = '10') AND (QRel.FieldByName('SUB_SERIE').AsString = 'P')) OR  ((QRel.FieldByName('CONDUTA').AsString = '01') and
              (QRel.FieldByName('DEPTO').AsString = '10') AND (QRel.FieldByName('MODELO').AsString <> '55')) AND (NOT DOC_CANCELADO)) Then


          begin

            QItens.Sql.Clear;
            QItens.Sql.Add('SELECT TRANSITENS.*, CFOP.MOVIMENTO , PRODUTOS.UNIDADE_VENDA, PRODUTOS.DESCRICAO NOME_PRODUTO, SERVICOS.UNIDADE UNIDADE, SERVICOS.DESCRICAO NOME_SERVICO');
            QItens.Sql.Add('FROM TRANSITENS');
            QItens.Sql.Add('INNER JOIN PRODUTOS');
            QItens.Sql.Add('ON (TRANSITENS.PRODUTO_ID = PRODUTOS.PRODUTO_ID)');
            QItens.Sql.Add('LEFT JOIN SERVICOS');
            QItens.Sql.Add('ON (TRANSITENS.PRODUTO_ID = SERVICOS.SERVICO_ID)');
            QItens.Sql.Add('LEFT JOIN CFOP');
            QItens.Sql.Add('ON (TRANSITENS.CFOP = CFOP.COD_CFOP)');
            QItens.Sql.Add('WHERE');
            QItens.Sql.Add('(TRANSITENS.TRANSACAO_ID = :TRANSACAO_ID)');

            QItens.ParamByName('TRANSACAO_ID').AsInteger := QRel.FieldByName('TRANSACAO_ID').AsInteger;

            QItens.Prepare;
            QItens.Open;

            IItens := 1;

            QItens.First;

            //AND (QRel.FieldByName('MODELO').AsString <> '65')

            while (not QItens.Eof)  and (NOT Doc_Cancelado) AND (QRel.FieldByName('MODELO').AsString <> '65') do
            begin
              with RegistroC170New do
              begin
                if FrmPrincipal.Config.FieldByName('SPED_SERVICO').AsString = 'True' Then
                Begin
                  if QItens.FieldByName('TP_PROD_SERV').AsString = 'P' then
                  Begin

                  COD_ITEM         := StrZero(QItens.FieldByName('PRODUTO_ID').AsString, 6, 0);
                  DESCR_COMPL      := Alltrim(QItens.FieldByName('NOME_PRODUTO').AsString);
                  UNID             := Alltrim(QItens.FieldByName('UNIDADE_VENDA').AsString);

                  End
                  else
                  begin

                  COD_ITEM         := 'S' +  StrZero(QItens.FieldByName('PRODUTO_ID').AsString, 6, 0);
                  DESCR_COMPL      := Alltrim(QItens.FieldByName('NOME_SERVICO').AsString);
                  UNID
                             := Alltrim(QItens.FieldByName('UNIDADE').AsString);
                  end;
                End
                else
                begin
                COD_ITEM         := StrZero(QItens.FieldByName('PRODUTO_ID').AsString, 6, 0);
                DESCR_COMPL      := Alltrim(QItens.FieldByName('NOME_PRODUTO').AsString);
                UNID             := Alltrim(QItens.FieldByName('UNIDADE_VENDA').AsString);
                end;

                NUM_ITEM         := StrZero(IntToStr(IItens), 3, 0);
                QTD              := QItens.FieldByName('QUANTIDADE').AsFloat;
                VL_DESC          := 0;//QItens.FieldByName('DESC_RODAPE').AsFloat;

                if QItens.FieldByName('MOVIMENTO').AsInteger = 1 then
                IND_MOV          := mfNao
                else
                IND_MOV          := mfSim;

                CST_ICMS         := QItens.FieldByName('CST').AsString;
                CFOP             := QItens.FieldByName('CFOP').AsString;
                COD_NAT          := '';
                VL_ABAT_NT       := 0;

                // A pedido de Regivaldo dia 23/12/15 /// voltou dia 09/04/2025, está sendo controlado na importação


                //if ((QItens.FieldByName('CST').AsString = '010') or (QItens.FieldByName('CST').AsString = '070')) and
                //   (QRel.FieldByName('CONDUTA').AsString = '02') then
                //Begin
                //VL_BC_ICMS       := 0;
                //ALIQ_ICMS        := 0;
                //VL_ICMS          := 0;
                //End
                //else
                //begin
                VL_BC_ICMS       := QItens.FieldByName('BASE_CALC_ICMS').AsFloat;
                ALIQ_ICMS        := QItens.FieldByName('ALIQUOTA_ICMS').AsFloat;
                VL_ICMS          := QItens.FieldByName('VALOR_ICMS').AsFloat;
                //end;

                VL_ITEM          := QItens.FieldByName('VR_TOTAL').AsFloat + QItens.FieldByName('VR_ACRESCIMO').AsFloat - QItens.FieldByName('DESC_RODAPE').AsFloat - QItens.FieldByName('VALOR_ICMS_DESON').AsFloat; //QItens.FieldByName('VR_TOTAL').AsFloat + QItens.FieldByName('VR_FCP').AsFloat + QItens.FieldByName('VR_FCPST').AsFloat;
                //VR_TOTAL + VR_FRETE + VR_ACRESCIMO + VR_FCPST + VR_FCP - DESC_RODAPE - VALOR_ICMS_DESON
                VL_IPI           := QItens.FieldByName('VR_IPI').AsFloat;


                if (FrmPrincipal.Config.FieldByName('SPED_ICMS_ST_OUTROS').AsString = 'True') Then
                Begin
                  IF  (((QRel.FieldByName('CONDUTA').AsString = '02') and (QRel.FieldByName('DEPTO').AsString = '10')) or ((QRel.FieldByName('CONDUTA').AsString = '02') and (QRel.FieldByName('DEPTO').AsString = '07'))) then
                  Begin
                    VL_BC_ICMS_ST := 0;
                    VL_ICMS_ST    := 0;
                    ALIQ_ST       := 0;
                  End
                  Else
                  Begin
                    if QRel.FieldByName('VR_ICMS_ST').AsFloat <> 0 then
                    begin
                      VL_BC_ICMS_ST := QItens.FieldByName('BASE_CALC_ST').AsFloat;
                      VL_ICMS_ST    := RoundTo(QItens.FieldByName('VALOR_ICMS_ST').AsFloat, -2);
                      ALIQ_ST       := QItens.FieldByName('ALIQUOTA_ST').AsFloat;
                    end
                    else
                    begin
                      VL_BC_ICMS_ST := 0;
                      VL_ICMS_ST    := 0;
                      ALIQ_ST       := 0;
                    end;
                  End;
                End
                Else
                Begin
                  if QRel.FieldByName('VR_ICMS_ST').AsFloat <> 0 then
                  begin
                    VL_BC_ICMS_ST := QItens.FieldByName('BASE_CALC_ST').AsFloat;
                    VL_ICMS_ST    := RoundTo(QItens.FieldByName('VALOR_ICMS_ST').AsFloat, -2);
                    ALIQ_ST       := QItens.FieldByName('ALIQUOTA_ST').AsFloat;
                  end
                  else
                  begin
                    VL_BC_ICMS_ST := 0;
                    VL_ICMS_ST    := 0;
                    ALIQ_ST       := 0;
                  end;
                End;

                if (FrmPrincipal.Config.FieldByName('SPED_ICMS_ST_IPI_MERC').AsString = 'True') Then
                Begin
                  IF  (((QRel.FieldByName('CONDUTA').AsString = '02') and (QRel.FieldByName('DEPTO').AsString = '10')) or ((QRel.FieldByName('CONDUTA').AsString = '02') and (QRel.FieldByName('DEPTO').AsString = '07'))) then
                  Begin
                    Vl_ITEM         := Vl_ITEM + QItens.FieldByName('VR_IPI').AsFloat + QItens.FieldByName('VR_FCP').AsFloat + QItens.FieldByName('VR_FCPST').AsFloat;
                    VL_IPI          := 0;
                    VL_BC_ICMS_ST   := 0;
                    VL_ICMS_ST      := 0;
                    if QRel.FieldByName('VR_ICMS_ST').AsFloat <> 0 then
                      Vl_ITEM := Vl_ITEM + RoundTo(QItens.FieldByName('VALOR_ICMS_ST').AsFloat, -2);
                  End;

                End;


                IND_APUR         := iaMensal;

                if FrmPrincipal.QEmpresa.FieldByName('TIPO_ATIVIDADE').AsString = '0 - INDUSTRIAL OU EQUIPARADO' Then
                 Begin
                    if QItens.FieldByName('CST_IPI').AsString = '00' then
                      CST_IPI := CstIpiToStr(stipiEntradaRecuperacaoCredito)
                    else if QItens.FieldByName('CST_IPI').AsString = '01' then
                      CST_IPI := CstIpiToStr(stipiEntradaTributradaZero)
                    else if QItens.FieldByName('CST_IPI').AsString = '02' then
                      CST_IPI := CstIpiToStr(stipiEntradaIsenta)
                    else if QItens.FieldByName('CST_IPI').AsString = '03' then
                    CST_IPI := CstIpiToStr(stipiEntradaNaoTributada)
                    else if QItens.FieldByName('CST_IPI').AsString = '04' then
                      CST_IPI := CstIpiToStr(stipiEntradaImune)
                    else if QItens.FieldByName('CST_IPI').AsString = '05' then
                      CST_IPI := CstIpiToStr(stipiEntradaComSuspensao)
                    else if QItens.FieldByName('CST_IPI').AsString = '49' then
                      CST_IPI := CstIpiToStr(stipiOutrasEntradas)
                    else if QItens.FieldByName('CST_IPI').AsString = '50' then
                      CST_IPI := CstIpiToStr(stipiSaidaTributada)
                    else if QItens.FieldByName('CST_IPI').AsString = '51' then
                      CST_IPI := CstIpiToStr(stipiSaidaTributadaZero)
                    else if QItens.FieldByName('CST_IPI').AsString = '52' then
                      CST_IPI := CstIpiToStr(stipiSaidaIsenta)
                    else if QItens.FieldByName('CST_IPI').AsString = '53' then
                      CST_IPI := CstIpiToStr(stipiSaidaNaoTributada)
                    else if QItens.FieldByName('CST_IPI').AsString = '54' then
                      CST_IPI := CstIpiToStr(stipiSaidaImune)
                    else if QItens.FieldByName('CST_IPI').AsString = '55' then
                      CST_IPI := CstIpiToStr(stipiSaidaComSuspensao)
                    else if QItens.FieldByName('CST_IPI').AsString = '99' then
                      CST_IPI := CstIpiToStr(stipiOutrasSaidas);


                    if QItens.FieldByName('CST_IPI').AsString = '' then
                    begin
                     if (QRel.FieldByName('CONDUTA').AsString = '02') Then
                     CST_IPI := CstIpiToStr(stipiOutrasEntradas)
                     else
                     CST_IPI := CstIpiToStr(stipiOutrasSaidas);
                    end;

                 End;

                //alterado 15/02 help - HDP84

               { if (QRel.FieldByName('CONDUTA').AsString = '02') and (QItens.FieldByName('CST_IPI').AsString = '') then
                  CST_IPI := ipiOutrasEntradas;

                if (QRel.FieldByName('CONDUTA').AsString = '01') and (QItens.FieldByName('CST_IPI').AsString = '') then
                  CST_IPI := ipiOutrasSaidas; }

               //alterado 05/01/17 help - HDP228 comentando linha e enviando campo em branco
                COD_ENQ   := '';
                VL_BC_IPI := 0;
                ALIQ_IPI  := 0;


                {if QItens.FieldByName('CST_PIS').AsString = '01' then
                  CST_PIS := pisValorAliquotaNormal
                else if QItens.FieldByName('CST_PIS').AsString = '02' then
                  CST_PIS := pisValorAliquotaDiferenciada
                else if QItens.FieldByName('CST_PIS').AsString = '03' then
                  CST_PIS := pisQtdeAliquotaUnidade
                else if QItens.FieldByName('CST_PIS').AsString = '04' then
                  CST_PIS := pisMonofaticaAliquotaZero
                else if QItens.FieldByName('CST_PIS').AsString = '06' then
                  CST_PIS := pisAliquotaZero
                else if QItens.FieldByName('CST_PIS').AsString = '07' then
                  CST_PIS := pisIsentaContribuicao
                else if QItens.FieldByName('CST_PIS').AsString = '08' then
                  CST_PIS := pisSemIncidenciaContribuicao
                else if QItens.FieldByName('CST_PIS').AsString = '09' then
                  CST_PIS := pisSuspensaoContribuicao
                else if QItens.FieldByName('CST_PIS').AsString = '49' then
                  CST_PIS := pisOutrasOperacoesSaida
                else if QItens.FieldByName('CST_PIS').AsString = '50' then
                  CST_PIS := pisOperCredExcRecTribMercInt
                else if QItens.FieldByName('CST_PIS').AsString = '70' then
                  CST_PIS := pisOperAquiSemDirCredito
                else if QItens.FieldByName('CST_PIS').AsString = '73' then
                  CST_PIS := pisOperAquiAliquotaZero
                else if QItens.FieldByName('CST_PIS').AsString = '98' then
                  CST_PIS := pisOutrasOperacoesEntrada
                else if QItens.FieldByName('CST_PIS').AsString = '99' then
                  CST_PIS := pisOutrasOperacoes
                else}
                  CST_PIS := QItens.FieldByName('CST_PIS').AsString;

                // Alterado a pedido regivaldo 10/06/13

                VL_BC_PIS     := 0; //QItens.FieldByName('BASE_CALC_PIS').AsFloat;
                ALIQ_PIS_PERC := 0; //QItens.FieldByName('ALIQUOTA_PIS').AsFloat;
                QUANT_BC_PIS  := 0;
                ALIQ_PIS_R    := 0;
                VL_PIS        := 0; //QItens.FieldByName('VR_PIS').AsFloat;


                {if QItens.FieldByName('CST_COFINS').AsString      = '01' then
                  CST_COFINS := cofinsValorAliquotaNormal
                else if QItens.FieldByName('CST_COFINS').AsString = '02' then
                  CST_COFINS := cofinsValorAliquotaDiferenciada
                else if QItens.FieldByName('CST_COFINS').AsString = '03' then
                  CST_COFINS := cofinsQtdeAliquotaUnidade
                else if QItens.FieldByName('CST_COFINS').AsString = '04' then
                  CST_COFINS := cofinsMonofaticaAliquotaZero
                else if QItens.FieldByName('CST_COFINS').AsString = '06' then
                  CST_COFINS := cofinsAliquotaZero
                else if QItens.FieldByName('CST_COFINS').AsString = '07' then
                  CST_COFINS := cofinsIsentaContribuicao
                else if QItens.FieldByName('CST_COFINS').AsString = '08' then
                  CST_COFINS := cofinsSemIncidenciaContribuicao
                else if QItens.FieldByName('CST_COFINS').AsString = '09' then
                  CST_COFINS := cofinsSuspensaoContribuicao
                else if QItens.FieldByName('CST_COFINS').AsString = '49' then
                  CST_COFINS := cofinsOutrasOperacoesSaida
                else if QItens.FieldByName('CST_COFINS').AsString = '50' then
                  CST_COFINS := cofinsOperCredExcRecTribMercInt
                else if QItens.FieldByName('CST_COFINS').AsString = '70' then
                  CST_COFINS := cofinsOperAquiSemDirCredito
                else if QItens.FieldByName('CST_COFINS').AsString = '73' then
                  CST_COFINS := cofinsOperAquiAliquotaZero
                else if QItens.FieldByName('CST_COFINS').AsString = '98' then
                  CST_COFINS := pisOutrasOperacoesEntrada
                else if QItens.FieldByName('CST_COFINS').AsString = '99' then
                  CST_COFINS := cofinsOutrasOperacoes
                else }

                  CST_COFINS := QItens.FieldByName('CST_COFINS').AsString;

                //alterado chamado 234 - 12012017


                VL_BC_COFINS     := 0;//QItens.FieldByName('BASE_CALC_COFINS').AsFloat;
                ALIQ_COFINS_PERC := 0;//QItens.FieldByName('ALIQUOTA_COFINS').AsFloat;
                QUANT_BC_COFINS  := 0;
                ALIQ_COFINS_R    := 0;
                VL_COFINS        := 0;//QItens.FieldByName('VR_COFINS').AsFloat;


                COD_CTA          := StrZero(QItens.FieldByName('CONTA_ID').AsString, 6, 0);


                Inc(IItens);
              end;
              Label6.Caption := 'Inserindo Movimentação';
              Label3.Caption := StrZero(QItens.FieldByName('PRODUTO_ID').AsString, 6, 0);

              Application.ProcessMessages;
              QItens.Next;
            end;
          end;
          //Aleterado 03/08/15 incluso VALOR_ICMS_ST cod atividade 4711-3/02 para bater com total da nota
          //valor outros

          QItens.Sql.Clear;
         { if (FrmPrincipal.QEmpresa.FieldByName('COD_ATIVIDADE').AsString ='4711-3/02') and
          ((QRel.FieldByName('CONDUTA').AsString = '02') and (QRel.FieldByName('DEPTO').AsString = '10')) or ((QRel.FieldByName('CONDUTA').AsString = '02') and (QRel.FieldByName('DEPTO').AsString = '07')) then

          QItens.Sql.Add('SELECT CST, CFOP, ALIQUOTA_ICMS, SUM(BASE_CALC_ICMS) BASE_CALC_ICMS, SUM(VALOR_ICMS) VALOR_ICMS, SUM(BASE_CALC_ST) BASE_CALC_ST,' +
                         'SUM(VALOR_ICMS_ST) VALOR_ICMS_ST, SUM(VR_TOTAL +  VR_FRETE + VR_ACRESCIMO + VR_IPI - DESC_RODAPE) VR_TOTAL, SUM(VALOR_ISENTO) VALOR_ISENTO, SUM(VALOR_OUTROS) VALOR_OUTROS, SUM(VR_IPI) VR_IPI, SUM(VR_REDUCAO_BC) VR_REDUCAO_BC')
          Else

          //Alterado a pedido de Regivaldo cst 070 e 010 aliquota/base zerada no sped 18/01/16

         }

         IF (QRel.FieldByName('CONDUTA').AsString = '02') then

          QItens.Sql.Add('SELECT CST, CFOP ,ALIQUOTA_ICMS,SUM(VR_FRETE) VR_FRETE,SUM(BASE_CALC_ICMS) BASE_CALC_ICMS ,SUM(VALOR_ICMS) VALOR_ICMS, ' +
                         'SUM(BASE_CALC_ST) BASE_CALC_ST,SUM(VALOR_ICMS_ST) VALOR_ICMS_ST, SUM(VR_TOTAL) VR_TOTAL, SUM(VALOR_ISENTO) VALOR_ISENTO, ' +
                         'SUM(VALOR_OUTROS) VALOR_OUTROS, SUM(VR_IPI) VR_IPI, SUM(VR_REDUCAO_BC) VR_REDUCAO_BC ' +
                         'FROM ('+
                         'SELECT CST,  TRANSITENS.CFOP, ALIQUOTA_ICMS, ' +
                         'VR_FRETE, BASE_CALC_ICMS, ' +
                         'VALOR_ICMS, BASE_CALC_ST, ' +
                         'VALOR_ICMS_ST, (VR_TOTAL +  VALOR_ICMS_ST + TRANSITENS.VR_FRETE + TRANSITENS.VR_ACRESCIMO + TRANSITENS.VR_IPI + VR_FCPST  + VR_FCP - DESC_RODAPE - VALOR_ICMS_DESON) VR_TOTAL,' +
                         'VALOR_ISENTO,  VALOR_OUTROS, VR_IPI, VR_REDUCAO_BC '+
                         'FROM TRANSITENS '+
                         'WHERE (TRANSACAO_ID = :TRANSACAO_ID)' +
                         ') AS TESTE')

         Else
         QItens.Sql.Add('SELECT CST, CFOP, ALIQUOTA_ICMS, SUM(BASE_CALC_ICMS) BASE_CALC_ICMS, SUM(VALOR_ICMS) VALOR_ICMS, SUM(BASE_CALC_ST) BASE_CALC_ST,SUM(VALOR_ICMS_ST) VALOR_ICMS_ST, ' +
                          'SUM(VR_FRETE) VR_FRETE, SUM(VR_TOTAL + VALOR_ICMS_ST + VR_FRETE + VR_ACRESCIMO + VR_IPI + VR_FCPST  + VR_FCP - DESC_RODAPE - VALOR_ICMS_DESON ) VR_TOTAL, SUM(VALOR_ISENTO) VALOR_ISENTO,' +
                          'SUM(VALOR_OUTROS) VALOR_OUTROS, SUM(VR_IPI) VR_IPI, SUM(VR_REDUCAO_BC) VR_REDUCAO_BC ' +
                          'FROM TRANSITENS ' +
                          'WHERE ' +
                          '(TRANSACAO_ID = :TRANSACAO_ID)');


          QItens.Sql.Add('GROUP BY CST, CFOP, ALIQUOTA_ICMS');

          QItens.ParamByName('TRANSACAO_ID').AsInteger := QRel.FieldByName('TRANSACAO_ID').AsInteger;

          //IF (QRel.FieldByName('CONDUTA').AsString = '02') then
          //Begin
          //QItens.ParamByName('070').AsString := '070';
          //QItens.ParamByName('010').AsString := '010';
          //End;

          QItens.Prepare;
          QItens.Open;

          QItens.First;
          while not QItens.Eof do
          begin
            if not Doc_Cancelado then
            begin
              with RegistroC190New do
              begin
                CST_ICMS      := QItens.FieldByName('CST').AsString;
                CFOP          := QItens.FieldByName('CFOP').AsString;

                 // A pedido de Regivaldo dia 23/12/15 //// Novo pedido para deixar os valores pois atualmente é controlado na importação de xml 09/04/2025

                //if ((QItens.FieldByName('CST').AsString = '010') or (QItens.FieldByName('CST').AsString = '070')) and
                //   (QRel.FieldByName('CONDUTA').AsString = '02')  then
                //Begin
                //ALIQ_ICMS     := 0;
                //VL_BC_ICMS    := 0;
                //VL_ICMS       := 0;
                //End
                //Else
                //begin
                ALIQ_ICMS     := QItens.FieldByName('ALIQUOTA_ICMS').AsFloat;
                VL_BC_ICMS    := QItens.FieldByName('BASE_CALC_ICMS').AsFloat;
                VL_ICMS       := RoundTo(QItens.FieldByName('VALOR_ICMS').AsFloat, -2);
                //end;


                VL_OPR        := RoundTo(QItens.FieldByName('VR_TOTAL').AsFloat, -2);
                //VL_FRT        := QItens.FieldByName('VR_FRETE').AsFloat;

                if (FrmPrincipal.Config.FieldByName('SPED_ICMS_ST_OUTROS').AsString = 'True') Then
                Begin
                  IF  (((QRel.FieldByName('CONDUTA').AsString = '02') and (QRel.FieldByName('DEPTO').AsString = '10')) or ((QRel.FieldByName('CONDUTA').AsString = '02') and (QRel.FieldByName('DEPTO').AsString = '07'))) then
                  Begin
                  VL_BC_ICMS_ST := 0;
                  VL_ICMS_ST    := 0;
                  End
                  Else
                  Begin
                  VL_BC_ICMS_ST := QItens.FieldByName('BASE_CALC_ST').AsFloat;
                  VL_ICMS_ST    := RoundTo(QItens.FieldByName('VALOR_ICMS_ST').AsFloat, -2);
                  End;
                End
                Else
                Begin
                 VL_BC_ICMS_ST := QItens.FieldByName('BASE_CALC_ST').AsFloat;
                 VL_ICMS_ST    := RoundTo(QItens.FieldByName('VALOR_ICMS_ST').AsFloat, -2);
                End;


                if (QItens.FieldByName('CST').AsString = '040') or (QItens.FieldByName('CST').AsString = '060')  then
                VL_RED_BC     := 0
                else
                VL_RED_BC     := QItens.FieldByName('VR_REDUCAO_BC').AsFloat;

                VL_IPI        := QItens.FieldByName('VR_IPI').AsFloat;
                COD_OBS       := '';

                if (FrmPrincipal.Config.FieldByName('SPED_ICMS_ST_IPI_MERC').AsString = 'True') Then
                Begin
                  IF  (((QRel.FieldByName('CONDUTA').AsString = '02') and (QRel.FieldByName('DEPTO').AsString = '10')) or ((QRel.FieldByName('CONDUTA').AsString = '02') and (QRel.FieldByName('DEPTO').AsString = '07'))) then
                  Begin
                    VL_OPR        := RoundTo(QItens.FieldByName('VR_TOTAL').AsFloat, -2);// + RoundTo(QItens.FieldByName('VALOR_ICMS_ST').AsFloat, -2) + QItens.FieldByName('VR_IPI').AsFloat ;
                    VL_IPI        := 0;
                    VL_BC_ICMS_ST := 0;
                    VL_ICMS_ST    := 0;
                  End;
                End;

                //if ((QRel.FieldByName('CONDUTA').AsString = '01') and (QRel.FieldByName('DEPTO').AsString = '10')) or ((QRel.FieldByName('CONDUTA').AsString = '02') and (QRel.FieldByName('DEPTO').AsString = '07')) then
                if (QRel.FieldByName('CONDUTA').AsString = '02') then
                  Cred_ICMS  := Cred_ICMS + RoundTo(QItens.FieldByName('VALOR_ICMS').AsFloat, -2)
                else
                  Deb_ICMS   := Deb_ICMS + RoundTo(QItens.FieldByName('VALOR_ICMS').AsFloat, -2);
                //ShowMessage(FloatToStr(Cred_ICMS) + '      ' + FloatToStr(QItens.FieldByName('VALOR_ICMS').AsFloat));
                if ((QRel.FieldByName('CONDUTA').AsString = '02') and (QRel.FieldByName('DEPTO').AsString = '10')) or ((QRel.FieldByName('CONDUTA').AsString = '01') and (QRel.FieldByName('DEPTO').AsString = '07')) then
                begin
                  Vr_ICMS_ST := Vr_ICMS_ST + QItens.FieldByName('VALOR_ICMS_ST').AsFloat;
                end;
              end;
            end;
            Label6.Caption := 'Inserindo CST/Documento';
            Label3.Caption := QItens.FieldByName('CST').AsString ;

            Application.ProcessMessages;
            QItens.Next;
            Valor_Icms_st := 0;
          end;


        end;



        if (Length(QRel.FieldByName('OBSERVACAO').AsString) > 3) and (not Doc_Cancelado) and (QRel.FieldByName('MODELO').AsString <> '65') then
        Begin

          with RegistroC195New do
          Begin
          Cod_obs   := Copy(QRel.FieldByName('NUM_DOC').AsString,4,6);
          Txt_Compl := StringReplace(QRel.FieldByName('OBSERVACAO').AsString, #13#10, '', [rfReplaceAll]);
          End;

          if (QRel.FieldByName('OBSERVACAO').AsString = 'Crédito ref. aquisições de fornecedores enquadrados no Simples Nacional.') and (not Doc_Cancelado) then
          Begin
          with RegistroC197New do
            Begin
            Cod_aj    := 'MG10990505';
            Aliq_icms := QRel.FieldByName('ALIQ_ICMS_SIMPLES').AsFloat;
            VL_ICMS   := QRel.FieldByName('VL_ICMS_SIMPLES').AsFloat;
            Aj_Cred   := Aj_Cred + QRel.FieldByName('VL_ICMS_SIMPLES').AsFloat;
            End;
          End;
        End;


        if (INotas mod ACBrSPEDFiscal1.LinhasBuffer) = 0 then
        begin

          ACBrSPEDFiscal1.WriteBloco_C(False);
          Application.ProcessMessages;
        end;

        Inc(INotas);

        Label3.Caption := QItens.FieldByName('CST').AsString +'/'+ (QRel.FieldByName('NUM_DOC').AsString);

        Application.ProcessMessages;


        QRel.Next;
      end;
    end;


    // Inicia o Bloco C300
   //Nota Fisacal modelo 02

    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT * FROM TRANSACOES');
    QRel.Sql.Add('WHERE MODELO = :MODELO AND SERIE = :SERIE');
    QRel.Sql.Add('AND (DT_SPED BETWEEN :DT_INICIAL AND :DT_FINAL)');
    QRel.Sql.Add('AND (CONDUTA = :CONDUTA) AND (DEPTO =:DEPTO)');

    QRel.ParamByName('CONDUTA').AsString :='01';
    QRel.ParamByName('DEPTO').AsString   :='07';
    QRel.ParamByName('MODELO').AsString := '02';
    QRel.ParamByName('SERIE').AsString  := 'D';
    QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;

    QRel.Prepare;
    QRel.Open;
    QRel.First;

   While not Qrel.Eof do
   Begin

    if not QRel.IsEmpty Then
    begin

     IQuery.Sql.Clear;
     IQuery.Sql.Add('SELECT CNPJ FROM CLIENTES WHERE CLIENTE_ID = :CLIENTE_ID');
     IQuery.ParamByName('CLIENTE_ID').AsInteger := QRel.FieldByName('CLIENTE_ID').AsInteger;
     IQuery.Prepare;
     IQuery.Open;



        QDetalhe.Sql.Clear;
        QDetalhe.Sql.Add('SELECT TRANSITENS.CST, TRANSITENS.CFOP, TRANSITENS.ALIQUOTA_ICMS, SUM(TRANSITENS.BASE_CALC_ICMS) BASE_CALC_ICMS, SUM(TRANSITENS.VALOR_ICMS) VALOR_ICMS, SUM(TRANSITENS.BASE_CALC_ST) BASE_CALC_ST,SUM(TRANSITENS.VALOR_ICMS_ST) VALOR_ICMS_ST, ' +
                          'SUM(TRANSITENS.VR_FRETE) VR_FRETE, SUM(TRANSITENS.VR_TOTAL + TRANSITENS.VALOR_ICMS_ST + TRANSITENS.VR_FRETE + TRANSITENS.VR_ACRESCIMO + TRANSITENS.VR_IPI + TRANSITENS.VR_FCPST  + TRANSITENS.VR_FCP - TRANSITENS.DESC_RODAPE - ' +
                          'TRANSITENS.VALOR_ICMS_DESON) VR_TOTAL, SUM(TRANSITENS.VALOR_ISENTO) VALOR_ISENTO,' +
                          'SUM(TRANSITENS.VALOR_OUTROS) VALOR_OUTROS, SUM(TRANSITENS.VR_IPI) VR_IPI, SUM(TRANSITENS.VR_REDUCAO_BC) VR_REDUCAO_BC ' +
                          'FROM TRANSITENS ' +
                          'INNER JOIN TRANSACOES ON TRANSACOES.TRANSACAO_ID = TRANSITENS.TRANSACAO_ID ' +
                          'WHERE TRANSACOES.TRANSACAO_ID = :TRANSACAO_ID ' +
                          'GROUP BY TRANSITENS.CST,TRANSITENS.CFOP,TRANSITENS.ALIQUOTA_ICMS ');

        QDetalhe.ParamByName('TRANSACAO_ID').AsInteger := QRel.FieldByName('TRANSACAO_ID').AsInteger;


        QDetalhe.Prepare;
        QDetalhe.Open;


       if Perfil.Text = 'Perfil B' then
       Begin
        with RegistroC300New do
        begin

        COD_MOD    := QRel.FieldByName('MODELO').AsString;;     /// Código do modelo do documento fiscal, conforme a Tabela 4.1.1
        SER        := QRel.FieldByName('SERIE').AsString;         /// Série do documento fiscal
        SUB        := QRel.FieldByName('SUB_SERIE').AsString;        /// Subsérie do documento fiscal
        NUM_DOC_INI:= Copy(QRel.FieldByName('NUM_DOC').AsString,4,6);  /// Número do documento fiscal inicial
        NUM_DOC_FIN:= Copy(QRel.FieldByName('NUM_DOC').AsString,4,6); /// Número do documento fiscal final
        DT_DOC     := QRel.FieldByName('DT_TRANS').AsDateTime;  /// Data da emissão dos documentos fiscais
        VL_DOC     := QRel.FieldByName('VALOR').AsFloat;
        VL_PIS     := QRel.FieldByName('VR_PIS').AsFloat;    /// Valor total do PIS
        VL_COFINS  := QRel.FieldByName('VR_COFINS').AsFloat;     /// Valor total da COFINS
        COD_CTA    := StrZero(FrmPrincipal.Config.FieldByName('COD_CTA').AsString, 6, 0);     /// Código da conta analítica contábil debitada/creditada
        end;


        QDetalhe.First;
        While not QDetalhe.Eof do
        Begin
          with RegistroC320New do
          begin
          CST_ICMS            := QDetalhe.FieldByName('CST').AsString;      /// Código da Situação Tributária, conforme a Tabela indicada no item 4.3.1
          CFOP                := QDetalhe.FieldByName('CFOP').AsString;     /// Código Fiscal de Operação e Prestação
          ALIQ_ICMS           := QDetalhe.FieldByName('ALIQUOTA_ICMS').AsFloat;  /// Alíquota do ICMS
          VL_OPR              := QDetalhe.FieldByName('VR_TOTAL').AsFloat;  /// Valor total acumulado das operações correspondentes à combinação de CST_ICMS, CFOP e alíquota do ICMS, incluídas as despesas acessórias e acréscimos.
          VL_BC_ICMS          := QDetalhe.FieldByName('BASE_CALC_ICMS').AsFloat; /// Valor acumulado da base de cálculo do ICMS, referente à combinação de CST_ICMS, CFOP, e alíquota do ICMS.
          VL_ICMS             := QDetalhe.FieldByName('VALOR_ICMS').AsFloat;  /// Valor acumulado do ICMS, referente à combinação de CST_ICMS, CFOP e alíquota do ICMS.
          VL_RED_BC           := 0;       /// Valor não tributado em função da redução da base de cálculo do ICMS, referente à combinação de CST_ICMS, CFOP, e alíquota do ICMS.
          COD_OBS             := '';      /// Código da observação do lançamento fiscal (campo 02 do Registro 0460)
          End;

          QItens.Sql.Clear;
          QItens.Sql.Add('SELECT * FROM TRANSITENS');
          QItens.Sql.Add('INNER JOIN TRANSACOES');
          QItens.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
          QItens.Sql.Add('WHERE');
          QItens.Sql.Add('(TRANSITENS.TRANSACAO_ID = :TRANSACAO_ID) AND (TRANSITENS.CFOP = :CFOP)');
          QItens.ParamByName('TRANSACAO_ID').AsInteger := QRel.FieldByName('TRANSACAO_ID').AsInteger;
          QItens.ParamByName('CFOP').AsString          := QDetalhe.FieldByName('CFOP').AsString;

          QItens.Prepare;
          QItens.Open;

          QItens.First;

          while not QItens.Eof do
          begin
            with RegistroC321New do
            Begin
             COD_ITEM            := StrZero(QItens.FieldByName('PRODUTO_ID').AsString,6,0); // String;     /// Código do item (campo 02 do Registro 0200)
             QTD                 := QItens.FieldByName('QUANTIDADE').AsFloat;          /// Quantidade acumulada do item
             UNID                := 'UN' ;         /// Unidade do item (Campo 02 do registro 0190)
             VL_ITEM             := (QItens.FieldByName('VR_TOTAL').AsFloat - QItens.FieldByName('DESC_RODAPE').AsFloat);    /// Valor acumulado do item
             VL_DESC             := QItens.FieldByName('DESC_RODAPE').AsFloat;    /// Valor do desconto acumulado
             VL_BC_ICMS          := QItens.FieldByName('BASE_CALC_ICMS').AsFloat;  /// Valor acumulado da base de cálculo do ICMS
             VL_ICMS             := QItens.FieldByName('VALOR_ICMS').AsFloat;    /// Valor acumulado do ICMS debitado
             VL_PIS              := QItens.FieldByName('VR_PIS').AsFloat;    /// Valor acumulado do PIS
             VL_COFINS           := QItens.FieldByName('VR_COFINS').AsFloat; /// Valor acumulado da COFINS

            End;
              Application.ProcessMessages;
              QItens.Next
          end;
          Application.ProcessMessages;
          QDetalhe.Next;
        End;
       End;


      if Perfil.Text = 'Perfil A' then
      Begin
        with RegistroC350New do
        begin

        SER        := QRel.FieldByName('SERIE').AsString;         /// Série do documento fiscal
        NUM_DOC    := Copy(QRel.FieldByName('NUM_DOC').AsString,4,6);
        CNPJ_CPF   := (SemMascara(IQuery.FieldByName('CNPJ').AsString));
        DT_DOC     := QRel.FieldByName('DT_TRANS').AsDateTime;  /// Data da emissão dos documentos fiscais
        VL_MERC    := QRel.FieldByName('VALOR_PRODUTOS').AsFloat;
        VL_DOC     := QRel.FieldByName('VALOR').AsFloat;
        VL_DESC    := QRel.FieldByName('VR_DESCONTO').AsFloat;
        VL_PIS     := QRel.FieldByName('VR_PIS').AsFloat;    /// Valor total do PIS
        VL_COFINS  := QRel.FieldByName('VR_COFINS').AsFloat;     /// Valor total da COFINS
        COD_CTA    := StrZero(FrmPrincipal.Config.FieldByName('COD_CTA').AsString, 6, 0);     /// Código da conta analítica contábil debitada/creditada
        end;


       QItens.Sql.Clear;
       QItens.Sql.Add('SELECT * FROM TRANSITENS');
       QItens.Sql.Add('INNER JOIN TRANSACOES');
       QItens.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
       QItens.Sql.Add('WHERE');
       QItens.Sql.Add('(TRANSITENS.TRANSACAO_ID = :TRANSACAO_ID)');
       QItens.ParamByName('TRANSACAO_ID').AsInteger := QRel.FieldByName('TRANSACAO_ID').AsInteger;


        QItens.Prepare;
        QItens.Open;



        QItens.First;
        while not QItens.Eof do
        begin
          with RegistroC370New do
          Begin

           COD_ITEM            := StrZero(QItens.FieldByName('PRODUTO_ID').AsString,6,0); // String;     /// Código do item (campo 02 do Registro 0200)
           NUM_ITEM            := QItens.FieldByName('SEQUENCIA').AsString;
           QTD                 := QItens.FieldByName('QUANTIDADE').AsFloat;          /// Quantidade acumulada do item
           UNID                := 'UN' ;         /// Unidade do item (Campo 02 do registro 0190)
           VL_ITEM             := (QItens.FieldByName('VR_TOTAL').AsFloat - QItens.FieldByName('DESC_RODAPE').AsFloat);    /// Valor acumulado do item
           VL_DESC             := QItens.FieldByName('DESC_RODAPE').AsFloat;    /// Valor do desconto acumulado

          End;
          Application.ProcessMessages;
          QItens.Next
        end;


        QItens.Sql.Clear;

        QItens.Sql.Add('SELECT CST, CFOP, ALIQUOTA_ICMS, SUM(BASE_CALC_ICMS) BASE_CALC_ICMS, SUM(VALOR_ICMS) VALOR_ICMS, SUM(BASE_CALC_ST) BASE_CALC_ST,SUM(VALOR_ICMS_ST) VALOR_ICMS_ST,' +
                            ' SUM(VR_FRETE) VR_FRETE, SUM(VR_TOTAL + VALOR_ICMS_ST + VR_FRETE + VR_ACRESCIMO + VR_IPI - DESC_RODAPE) VR_TOTAL, SUM(VALOR_ISENTO) VALOR_ISENTO, SUM(VALOR_OUTROS) VALOR_OUTROS, SUM(VR_IPI) VR_IPI, SUM(VR_REDUCAO_BC) VR_REDUCAO_BC');


        QItens.Sql.Add('FROM TRANSITENS');
        QItens.Sql.Add('WHERE');
        QItens.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
        QItens.Sql.Add('GROUP BY CST, CFOP, ALIQUOTA_ICMS');

        QItens.ParamByName('TRANSACAO_ID').AsInteger := QRel.FieldByName('TRANSACAO_ID').AsInteger;


        QItens.Prepare;
        QItens.Open;

        QItens.First;
        while not QItens.Eof do
        begin
          with RegistroC390New do
          begin
            CST_ICMS      := QItens.FieldByName('CST').AsString;
            CFOP          := QItens.FieldByName('CFOP').AsString;
            ALIQ_ICMS     := QItens.FieldByName('ALIQUOTA_ICMS').AsFloat;
            VL_BC_ICMS    := QItens.FieldByName('BASE_CALC_ICMS').AsFloat;
            VL_ICMS       := RoundTo(QItens.FieldByName('VALOR_ICMS').AsFloat, -2);
            VL_OPR        := RoundTo(QItens.FieldByName('VR_TOTAL').AsFloat, -2);


            if (QItens.FieldByName('CST').AsString = '040') or (QItens.FieldByName('CST').AsString = '060')  then
            VL_RED_BC     := 0
            else
            VL_RED_BC     := QItens.FieldByName('VR_REDUCAO_BC').AsFloat;


            COD_OBS       := '';

            //if ((QRel.FieldByName('CONDUTA').AsString = '01') and (QRel.FieldByName('DEPTO').AsString = '10')) or ((QRel.FieldByName('CONDUTA').AsString = '02') and (QRel.FieldByName('DEPTO').AsString = '07')) then
            if ((QRel.FieldByName('CONDUTA').AsString = '01') and (QRel.FieldByName('DEPTO').AsString = '10')) or (QRel.FieldByName('CONDUTA').AsString = '02') then
              Cred_ICMS  := Cred_ICMS + RoundTo(QItens.FieldByName('VALOR_ICMS').AsFloat, -2)
            else
              Deb_ICMS   := Deb_ICMS + RoundTo(QItens.FieldByName('VALOR_ICMS').AsFloat, -2);

            if ((QRel.FieldByName('CONDUTA').AsString = '02') and (QRel.FieldByName('DEPTO').AsString = '10')) or ((QRel.FieldByName('CONDUTA').AsString = '01') and (QRel.FieldByName('DEPTO').AsString = '07')) then
              Vr_ICMS_ST := Vr_ICMS_ST + QItens.FieldByName('VALOR_ICMS_ST').AsFloat;

          end;

          Label6.Caption := 'Inserindo CST VENDAS SERIE D';
          Label3.Caption := QItens.FieldByName('CST').AsString;

          Application.ProcessMessages;
          QItens.Next;
        end;

      End;
    //
    end;
    QRel.Next;
   End;


    // Inicia o Bloco C400 (Equipamentos ECF)


    Totalizador_item := 0;

    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT LICENCA_IF.*');
    QRel.Sql.Add('FROM LICENCA_IF');
    QRel.Sql.Add('INNER JOIN EMPRESAS');
    QRel.Sql.Add('ON (LICENCA_IF.CNPJ = EMPRESAS.CNPJ)');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(EMPRESAS.EMPRESA_ID = :EMPRESA_ID) AND (LICENCA_IF.GERAR_SPED = 1) AND SERIAL NOT LIKE :SERIAL');
    QRel.Sql.Add('ORDER BY LICENCA_IF.NUM_ECF');

    QRel.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    QRel.ParamByName('SERIAL').AsString     := '%%'; //'VR' + '%'; PRA ANULAR TUDO E NÃO IR NADA PRO SPED ATUALMENTE

    QRel.Prepare;
    QRel.Open;


    while not QRel.Eof do
    begin

      with RegistroC400New do
      begin
        COD_MOD := '2D';
        ECF_MOD := QRel.FieldByName('MODELO').AsString;
        ECF_FAB := QRel.FieldByName('SERIAL').AsString;
        ECF_CX  := QRel.FieldByName('NUM_ECF').AsString;
      end;

      QItens.Sql.Clear;
      QItens.Sql.Add('SELECT * FROM REGISTRO_60M');
      QItens.Sql.Add('WHERE');
      QItens.Sql.Add('(DT_EMISSAO BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QItens.Sql.Add('AND (NUM_SERIE = :NUM_SERIE)');
      QItens.Sql.Add('ORDER BY DT_EMISSAO');

      QItens.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
      QItens.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
      QItens.ParamByName('NUM_SERIE').AsString    := QRel.FieldByName('SERIAL').AsString;

      QItens.Prepare;
      QItens.Open;

      while not QItens.Eof do
      begin
        with RegistroC405New do // Redução Z
        begin
          DT_DOC      := QItens.FieldByName('DT_EMISSAO').AsDateTime;
          CRZ         := QItens.FieldByName('CRZ').AsInteger;
          CRO         := QItens.FieldByName('CRO').AsInteger;
          VL_BRT      := QItens.FieldByName('VENDA_BRUTA').AsFloat;
          NUM_COO_FIN := QItens.FieldByName('COO_FINAL').AsInteger;
          GT_FIN      := QItens.FieldByName('GRANDE_TOTAL').AsFloat;

//          with RegistroC410.New do // PIS e COFINS Totalizados no dia
//          begin
//            New.VL_PIS    := 0;
//            New.VL_COFINS := 0;
//          end;

          QVendaBruta_A.Sql.Clear;
          QVendaBruta_A.Sql.Clear;
          QVendaBruta_A.Sql.Add('SELECT SUM(VALOR_TOTALIZADOR) VENDA_BRUTA_A');
          QVendaBruta_A.Sql.Add('FROM REGISTRO_60A');
          QVendaBruta_A.Sql.Add('WHERE');
          QVendaBruta_A.Sql.Add('(DT_EMISSAO = :DT_EMISSAO)');
          QVendaBruta_A.Sql.Add('AND (NUM_SERIE = :NUM_SERIE)');

          QVendaBruta_A.ParamByName('DT_EMISSAO').AsDateTime := QItens.FieldByName('DT_EMISSAO').AsDateTime;
          QVendaBruta_A.ParamByName('NUM_SERIE').AsString    := QRel.FieldByName('SERIAL').AsString;

          QVendaBruta_A.Prepare;
          QVendaBruta_A.Open;


          QVendaBruta.Sql.Clear;
          QVendaBruta.Sql.Add('SELECT SUM (VALOR_TOTALIZADOR) VENDA_BRUTA');
          QVendaBruta.Sql.Add('FROM(SELECT DT_EMISSAO , NUM_SERIE, SIT_TRIBUTARIA , BASE_CALC_ICMS VALOR_TOTALIZADOR');
          QVendaBruta.Sql.Add('FROM REGISTRO_60I');
          QVendaBruta.Sql.Add('UNION ALL');
          QVendaBruta.Sql.Add('SELECT DT_SPED, SERIAL NUM_SERIE, CAST (' + #39 + 'DESC' + #39 + ' AS VARCHAR(4)) SIT_TRIBUTARIA , VR_DESCONTO VALOR_TOTALIZADOR');
          QVendaBruta.Sql.Add('FROM TRANSACOES');
          QVendaBruta.Sql.Add('INNER JOIN LICENCA_IF ON CAST(LICENCA_IF.NUM_ECF AS INTEGER) = TRANSACOES.BANCO_ID) AS TESTE');
          QVendaBruta.Sql.Add('WHERE');
          QVendaBruta.Sql.Add('(DT_EMISSAO = :DT_EMISSAO)');
          QVendaBruta.Sql.Add('AND (NUM_SERIE = :NUM_SERIE)');

          QVendaBruta.ParamByName('DT_EMISSAO').AsDateTime          := QItens.FieldByName('DT_EMISSAO').AsDateTime;
          QVendaBruta.ParamByName('NUM_SERIE').AsString             := QRel.FieldByName('SERIAL').AsString;

          QVendaBruta.Prepare;
          QVendaBruta.Open;



          if QItens.FieldByName('VENDA_BRUTA').AsFloat > 0 then
          begin
            D_Vbruta :=  0;

            if QItens.FieldByName('VENDA_BRUTA').AsFloat < QVendaBruta.FieldByName('VENDA_BRUTA').AsFloat  then
            D_Vbruta      := QVendaBruta.FieldByName('VENDA_BRUTA').AsFloat - QItens.FieldByName('VENDA_BRUTA').AsFloat;

            if QItens.FieldByName('VENDA_BRUTA').AsFloat > QVendaBruta.FieldByName('VENDA_BRUTA').AsFloat  then
            D_Vbruta      := QItens.FieldByName('VENDA_BRUTA').AsFloat - QVendaBruta.FieldByName('VENDA_BRUTA').AsFloat ;


            QDetalhe.Sql.Clear;
            QDetalhe.Sql.Add('SELECT SIT_TRIBUTARIA, SUM(VALOR_TOTALIZADOR) VALOR_TOTALIZADOR');
            QDetalhe.Sql.Add('FROM(');
            QDetalhe.Sql.Add('SELECT SIT_TRIBUTARIA, VALOR_TOTALIZADOR');
            QDetalhe.Sql.Add('FROM REGISTRO_60A');
            QDetalhe.Sql.Add('WHERE');
            QDetalhe.Sql.Add('(DT_EMISSAO = :DT_EMISSAO)');
            QDetalhe.Sql.Add('AND (NUM_SERIE = :NUM_SERIE)');
            QDetalhe.Sql.Add('AND (SIT_TRIBUTARIA <> :SIT_TRIBUTARIA1)');
            QDetalhe.Sql.Add('AND (SIT_TRIBUTARIA <> :SIT_TRIBUTARIA2)');
            QDetalhe.Sql.Add('UNION ALL');
            QDetalhe.Sql.Add('SELECT CAST(:SIT_TRIBUTARIA AS VARCHAR(1)) SIT_TRIBUTARIA, VALOR_TOTALIZADOR');
            QDetalhe.Sql.Add('FROM REGISTRO_60A');
            QDetalhe.Sql.Add('WHERE');
            QDetalhe.Sql.Add('(DT_EMISSAO = :DT_EMISSAO)');
            QDetalhe.Sql.Add('AND (NUM_SERIE = :NUM_SERIE)');
            QDetalhe.Sql.Add('AND ((SIT_TRIBUTARIA = :SIT_TRIBUTARIA1) OR (SIT_TRIBUTARIA = :SIT_TRIBUTARIA2))');
            QDetalhe.Sql.Add(') AS TESTE');
            QDetalhe.Sql.Add('GROUP BY SIT_TRIBUTARIA');

            QDetalhe.ParamByName('DT_EMISSAO').AsDateTime       := QItens.FieldByName('DT_EMISSAO').AsDateTime;
            QDetalhe.ParamByName('NUM_SERIE').AsString          := QRel.FieldByName('SERIAL').AsString;
            QDetalhe.ParamByName('SIT_TRIBUTARIA').AsString     := 'F';
            QDetalhe.ParamByName('SIT_TRIBUTARIA1').AsString    := 'F1';
            QDetalhe.ParamByName('SIT_TRIBUTARIA2').AsString    := 'F2';


            QDetalhe.Prepare;
            QDetalhe.Open;


            while not QDetalhe.Eof do
            begin
             Try
                Dif_Tot          := 0;
                I                := 0;
                Dif_Item         := 0;
                Totalizador_item := 0;

                if QVendaBruta_A.FieldByName('VENDA_BRUTA_A').AsFloat <  Qitens.FieldByName('VENDA_BRUTA').AsFloat then
                Begin
                if QDetalhe.FieldByName('VALOR_TOTALIZADOR').AsFloat > D_Vbruta  then
                Begin
                Valor_Totalizador := QDetalhe.FieldByName('VALOR_TOTALIZADOR').AsFloat + D_Vbruta;
                D_Vbruta := 0;
                End
                Else
                Valor_Totalizador := QDetalhe.FieldByName('VALOR_TOTALIZADOR').AsFloat;
                End;

                if QVendaBruta_A.FieldByName('VENDA_BRUTA_A').AsFloat >  Qitens.FieldByName('VENDA_BRUTA').AsFloat then
                Begin
                if QDetalhe.FieldByName('VALOR_TOTALIZADOR').AsFloat > D_Vbruta  then
                Begin
                Valor_Totalizador := QDetalhe.FieldByName('VALOR_TOTALIZADOR').AsFloat - D_Vbruta;
                D_Vbruta := 0;
                End
                Else
                Valor_Totalizador := QDetalhe.FieldByName('VALOR_TOTALIZADOR').AsFloat;
                End;

                if QVendaBruta_A.FieldByName('VENDA_BRUTA_A').AsFloat =  Qitens.FieldByName('VENDA_BRUTA').AsFloat then
                Valor_Totalizador := QDetalhe.FieldByName('VALOR_TOTALIZADOR').AsFloat;

                if LeIni(Arq_Ini, 'Sintegra', 'Alterar CFOP Gás') =  'True' Then
                 Valor_Totalizador := QDetalhe.FieldByName('VALOR_TOTALIZADOR').AsFloat;



                IF QDetalhe.FieldByName('SIT_TRIBUTARIA').AsString = 'F' Then
                Begin

                  Q405.Sql.Clear;
                  Q405.Sql.Add('SELECT   SUM(BASE_CALC_ICMS) VALOR_TOTALIZADOR');
                  Q405.Sql.Add('FROM REGISTRO_60I');
                  Q405.Sql.Add('WHERE');
                  Q405.Sql.Add('(DT_EMISSAO = :DT_EMISSAO)');
                  Q405.Sql.Add('AND (NUM_SERIE = :NUM_SERIE)');
                  Q405.Sql.Add('AND ((SIT_TRIBUTARIA = :SIT_TRIBUTARIA) or (SIT_TRIBUTARIA = :SIT_TRIBUTARIA1) or (SIT_TRIBUTARIA = :SIT_TRIBUTARIA2))');

                  Q405.ParamByName('DT_EMISSAO').AsDateTime          := QItens.FieldByName('DT_EMISSAO').AsDateTime;
                  Q405.ParamByName('NUM_SERIE').AsString             := QRel.FieldByName('SERIAL').AsString;
                  Q405.ParamByName('SIT_TRIBUTARIA').AsString        := 'F';
                  Q405.ParamByName('SIT_TRIBUTARIA1').AsString       := 'F1';
                  Q405.ParamByName('SIT_TRIBUTARIA2').AsString       := 'F2';

                  Q405.Prepare;
                  Q405.Open;
                End
                Else
                Begin
                  Q405.Sql.Clear;
                  Q405.Sql.Add('SELECT   SUM(BASE_CALC_ICMS) VALOR_TOTALIZADOR');
                  Q405.Sql.Add('FROM REGISTRO_60I');
                  Q405.Sql.Add('WHERE');
                  Q405.Sql.Add('(DT_EMISSAO = :DT_EMISSAO)');
                  Q405.Sql.Add('AND (NUM_SERIE = :NUM_SERIE)');
                  Q405.Sql.Add('AND (SIT_TRIBUTARIA = :SIT_TRIBUTARIA)');

                  Q405.ParamByName('DT_EMISSAO').AsDateTime          := QItens.FieldByName('DT_EMISSAO').AsDateTime;
                  Q405.ParamByName('NUM_SERIE').AsString             := QRel.FieldByName('SERIAL').AsString;
                  Q405.ParamByName('SIT_TRIBUTARIA').AsString        := QDetalhe.FieldByName('SIT_TRIBUTARIA').AsString;

                  Q405.Prepare;
                  Q405.Open;
                End;


                if QDetalhe.FieldByName('SIT_TRIBUTARIA').AsString = 'DESC' Then
                Begin
                Q405.Sql.Clear;
                Q405.Sql.Add('SELECT  CAST (:SIT_TRIBUTARIA AS VARCHAR(4)) SIT_TRIBUTARIA , SUM(VR_DESCONTO) VALOR_TOTALIZADOR');
                Q405.Sql.Add('FROM TRANSACOES');
                Q405.Sql.Add('INNER JOIN LICENCA_IF ON CAST(LICENCA_IF.NUM_ECF AS INTEGER) = TRANSACOES.BANCO_ID');
                Q405.Sql.Add('WHERE');
                Q405.Sql.Add('(DT_TRANS = :DT_EMISSAO)');
                Q405.Sql.Add('AND (SERIAL = :NUM_SERIE)');

                Q405.ParamByName('DT_EMISSAO').AsDateTime          := QItens.FieldByName('DT_EMISSAO').AsDateTime;
                Q405.ParamByName('NUM_SERIE').AsString             := QRel.FieldByName('SERIAL').AsString;
                Q405.ParamByName('SIT_TRIBUTARIA').AsString        := QDetalhe.FieldByName('SIT_TRIBUTARIA').AsString;

                Q405.Prepare;
                Q405.Open;

                End;
                // Corrige automaticamente o valor dos itens no c425

                If Q405.FieldByname('VALOR_TOTALIZADOR').AsFloat > Valor_Totalizador then
                Dif_Tot :=  RoundTo(Q405.FieldByname('VALOR_TOTALIZADOR').AsFloat -  Valor_Totalizador,-2);
                If Q405.FieldByname('VALOR_TOTALIZADOR').AsFloat < Valor_Totalizador then
                Dif_Tot :=  RoundTo(Valor_Totalizador - Q405.FieldByname('VALOR_TOTALIZADOR').AsFloat,-2);




              with RegistroC420.New do // Totalizadores Parciais da Redução Z
              begin
                if Alltrim(QDetalhe.FieldByName('SIT_TRIBUTARIA').AsString)  = '0700' then
                begin
                  COD_TOT_PAR := 'T0700';
                  NR_TOT      := 1;
                end
                else if Alltrim(QDetalhe.FieldByName('SIT_TRIBUTARIA').AsString)  = '1200' then
                begin
                  COD_TOT_PAR := 'T1200';
                  NR_TOT      := 2;
                end
                else if Alltrim(QDetalhe.FieldByName('SIT_TRIBUTARIA').AsString)  = '1800' then
                begin
                  COD_TOT_PAR := 'T1800';
                  NR_TOT      := 3;
                end
                else if Alltrim(QDetalhe.FieldByName('SIT_TRIBUTARIA').AsString)  = '2500' then
                begin
                  COD_TOT_PAR := 'T2500';
                  NR_TOT      := 4;
                end
                else if Alltrim(QDetalhe.FieldByName('SIT_TRIBUTARIA').AsString)  = '3000' then
                begin
                  COD_TOT_PAR := 'T3000';
                  NR_TOT      := 5;
                end
                else if Alltrim(QDetalhe.FieldByName('SIT_TRIBUTARIA').AsString)  = '0840' then
                begin
                  COD_TOT_PAR := 'T0840';
                  NR_TOT      := 6;
                  end
                  else if Alltrim(QDetalhe.FieldByName('SIT_TRIBUTARIA').AsString)  = '0720' then
                begin
                  COD_TOT_PAR := 'T0720';
                  NR_TOT      := 7;
                end
                else if Alltrim(QDetalhe.FieldByName('SIT_TRIBUTARIA').AsString)  = '1260' then
                begin
                  COD_TOT_PAR := 'T1260';
                  NR_TOT      := 8;
                end
                else if Alltrim(QDetalhe.FieldByName('SIT_TRIBUTARIA').AsString)  = '0840' then
                begin
                  COD_TOT_PAR := 'T0840';
                  NR_TOT      := 9;
                end

                else if Alltrim(QDetalhe.FieldByName('SIT_TRIBUTARIA').AsString)  = '0702' then
                begin
                  COD_TOT_PAR := 'T0702';
                  NR_TOT      := 10;
                end
                else if Alltrim(QDetalhe.FieldByName('SIT_TRIBUTARIA').AsString)  = '0560' then
                begin
                  COD_TOT_PAR := 'T0560';
                  NR_TOT      := 11;
                end

                else if Alltrim(QDetalhe.FieldByName('SIT_TRIBUTARIA').AsString)  = '0400' then
                begin
                  COD_TOT_PAR := 'T0400';
                  NR_TOT      := 12;
                end

                else if Alltrim(QDetalhe.FieldByName('SIT_TRIBUTARIA').AsString)  = '1400' then
                begin
                  COD_TOT_PAR := 'T1400';
                  NR_TOT      := 13;
                end

                 else if Alltrim(QDetalhe.FieldByName('SIT_TRIBUTARIA').AsString)  = '0332' then
                begin
                  COD_TOT_PAR := 'T0332';
                  NR_TOT      := 14;
                end

                else if Alltrim(QDetalhe.FieldByName('SIT_TRIBUTARIA').AsString)  = 'F' then
                  COD_TOT_PAR := 'F1'
                 else if Alltrim(QDetalhe.FieldByName('SIT_TRIBUTARIA').AsString) = 'F1' then
                  COD_TOT_PAR := 'F1'
                 else if Alltrim(QDetalhe.FieldByName('SIT_TRIBUTARIA').AsString) = 'F2' then
                  COD_TOT_PAR := 'F1'
                else if Alltrim(QDetalhe.FieldByName('SIT_TRIBUTARIA').AsString)  = 'I' then
                  COD_TOT_PAR := 'I1'
                else if Alltrim(QDetalhe.FieldByName('SIT_TRIBUTARIA').AsString)  = 'CANC' then
                  COD_TOT_PAR := 'Can-T'
                else if Alltrim(QDetalhe.FieldByName('SIT_TRIBUTARIA').AsString)  = 'DESC' then
                  COD_TOT_PAR := 'DT'
                else if Alltrim(QDetalhe.FieldByName('SIT_TRIBUTARIA').AsString)  = 'N' then
                  COD_TOT_PAR := 'N1';

                VLR_ACUM_TOT := Valor_totalizador;

                IQuery.Sql.Clear;
                IQuery.Sql.Add('SELECT  COUNT(*) QUANTIDADE, SUM (BASE_CALC_ICMS) VALOR_TOTALIZADOR  ');
                IQuery.Sql.Add('FROM (SELECT  PRODUTO_ID, UNIDADE_VENDA ,SIT_TRIBUTARIA, SUM(BASE_CALC_ICMS) BASE_CALC_ICMS ');
                IQuery.Sql.Add('FROM REGISTRO_60I');
                IQuery.Sql.Add('INNER JOIN PRODUTOS ON TRIM(PRODUTOS.COD_BARRA)  = TRIM(REGISTRO_60I.COD_PRODUTO)');
                IQuery.Sql.Add('WHERE');
                IQuery.Sql.Add('(DT_EMISSAO = :DT_EMISSAO)');
                IQuery.Sql.Add('AND (NUM_SERIE = :NUM_SERIE)');
                IQuery.Sql.Add('AND (SIT_TRIBUTARIA = :SIT_TRIBUTARIA)');
                IQuery.Sql.Add('GROUP BY SIT_TRIBUTARIA ,PRODUTO_ID, UNIDADE_VENDA');
                IQuery.Sql.Add(') AS TESTE');

                IQuery.ParamByName('DT_EMISSAO').AsDateTime          := QItens.FieldByName('DT_EMISSAO').AsDateTime;
                IQuery.ParamByName('NUM_SERIE').AsString             := QRel.FieldByName('SERIAL').AsString;
                IQuery.ParamByName('SIT_TRIBUTARIA').AsString        := QDetalhe.FieldByName('SIT_TRIBUTARIA').AsString;

                IQuery.Prepare;
                IQuery.Prepare;
                IQuery.Open;

                I := IQuery.FieldByName('QUANTIDADE').AsInteger;

                //Dif_Item := RoundTo(IQuery.FieldByName('VALOR_TOTALIZADOR').AsFloat - Valor_totalizador , -2);

                if QDetalhe.FieldByName('VALOR_TOTALIZADOR').AsFloat > Q405.FieldByName('VALOR_TOTALIZADOR').AsFloat then
                 Dif_Item := RoundTo(  Valor_totalizador - IQuery.FieldByName('VALOR_TOTALIZADOR').AsFloat  , -2)
               else if QDetalhe.FieldByName('VALOR_TOTALIZADOR').AsFloat <  Q405.FieldByName('VALOR_TOTALIZADOR').AsFloat then
                 Dif_Item := RoundTo(IQuery.FieldByName('VALOR_TOTALIZADOR').AsFloat - Valor_totalizador , -2)
               Else
                 Dif_Item := 0;

               if LeIni(Arq_Ini, 'Sintegra', 'Alterar CFOP Gás') =  'True' Then
                Dif_Item := 0;

                if QDetalhe.FieldByName('SIT_TRIBUTARIA').AsString = 'F' then
                Begin
                Q470.Sql.Clear;
                Q470.Sql.Add('SELECT  PRODUTO_ID, UNIDADE_VENDA , CAST (:SIT_TRIBUTARIA AS VARCHAR(1)) SIT_TRIBUTARIA , SUM(QUANTIDADE) QUANTIDADE, SUM(BASE_CALC_ICMS) VALOR_TOTALIZADOR');
                Q470.Sql.Add('FROM REGISTRO_60I');
                Q470.Sql.Add('INNER JOIN PRODUTOS ON TRIM(PRODUTOS.COD_BARRA)  = TRIM(REGISTRO_60I.COD_PRODUTO)');
                Q470.Sql.Add('WHERE');
                Q470.Sql.Add('(DT_EMISSAO = :DT_EMISSAO)');
                Q470.Sql.Add('AND (NUM_SERIE = :NUM_SERIE)');
                Q470.Sql.Add('AND ((SIT_TRIBUTARIA = :SIT_TRIBUTARIA) OR (SIT_TRIBUTARIA = :SIT_TRIBUTARIA1) OR (SIT_TRIBUTARIA = :SIT_TRIBUTARIA2))');
                Q470.Sql.Add('GROUP BY PRODUTO_ID, UNIDADE_VENDA');
                Q470.Sql.Add('ORDER BY VALOR_TOTALIZADOR');

                Q470.ParamByName('DT_EMISSAO').AsDateTime          := QItens.FieldByName('DT_EMISSAO').AsDateTime;
                Q470.ParamByName('NUM_SERIE').AsString             := QRel.FieldByName('SERIAL').AsString;
                Q470.ParamByName('SIT_TRIBUTARIA').AsString        := 'F';
                Q470.ParamByName('SIT_TRIBUTARIA1').AsString       := 'F1';
                Q470.ParamByName('SIT_TRIBUTARIA2').AsString       := 'F2';

                Q470.Prepare;
                Q470.Open;

                End
                Else
                Begin
                Q470.Sql.Clear;
                Q470.Sql.Add('SELECT  PRODUTO_ID, UNIDADE_VENDA ,SIT_TRIBUTARIA, SUM(QUANTIDADE) QUANTIDADE, SUM(BASE_CALC_ICMS) VALOR_TOTALIZADOR');
                Q470.Sql.Add('FROM REGISTRO_60I');
                Q470.Sql.Add('INNER JOIN PRODUTOS ON TRIM(PRODUTOS.COD_BARRA)  = TRIM(REGISTRO_60I.COD_PRODUTO)');
                Q470.Sql.Add('WHERE');
                Q470.Sql.Add('(DT_EMISSAO = :DT_EMISSAO)');
                Q470.Sql.Add('AND (NUM_SERIE = :NUM_SERIE)');
                Q470.Sql.Add('AND (SIT_TRIBUTARIA = :SIT_TRIBUTARIA)');
                Q470.Sql.Add('GROUP BY SIT_TRIBUTARIA ,PRODUTO_ID, UNIDADE_VENDA');
                Q470.Sql.Add('ORDER BY VALOR_TOTALIZADOR');

                Q470.ParamByName('DT_EMISSAO').AsDateTime          := QItens.FieldByName('DT_EMISSAO').AsDateTime;
                Q470.ParamByName('NUM_SERIE').AsString             := QRel.FieldByName('SERIAL').AsString;
                Q470.ParamByName('SIT_TRIBUTARIA').AsString        := QDetalhe.FieldByName('SIT_TRIBUTARIA').AsString;

                Q470.Prepare;
                Q470.Open;

                End;

                while not Q470.Eof do
                begin

                  if Totalizador_item <= QDetalhe.FieldByName('VALOR_TOTALIZADOR').AsFloat then
                 Begin

                  if ((Alltrim(Q470.FieldByName('SIT_TRIBUTARIA').AsString) = '0700') OR (Alltrim(Q470.FieldByName('SIT_TRIBUTARIA').AsString) = '1200') OR
                  (Alltrim(Q470.FieldByName('SIT_TRIBUTARIA').AsString) = '1800') OR (Alltrim(Q470.FieldByName('SIT_TRIBUTARIA').AsString) = '2500') OR
                  (Alltrim(Q470.FieldByName('SIT_TRIBUTARIA').AsString) = '3000') OR (Alltrim(Q470.FieldByName('SIT_TRIBUTARIA').AsString) = '0840') OR
                  (Alltrim(Q470.FieldByName('SIT_TRIBUTARIA').AsString) = '0702') OR (Alltrim(Q470.FieldByName('SIT_TRIBUTARIA').AsString) = '0560') OR
                  (Alltrim(Q470.FieldByName('SIT_TRIBUTARIA').AsString) = '0400') OR (Alltrim(Q470.FieldByName('SIT_TRIBUTARIA').AsString) = 'I')    OR
                  (Alltrim(Q470.FieldByName('SIT_TRIBUTARIA').AsString) = 'N') OR (Alltrim(Q470.FieldByName('SIT_TRIBUTARIA').AsString) = 'F') OR
                  (Alltrim(Q470.FieldByName('SIT_TRIBUTARIA').AsString) = '1400') OR (Alltrim(Q470.FieldByName('SIT_TRIBUTARIA').AsString) = '0332') )   Then

                  Begin
                   with RegistroC425.New do // Resumo de Itens do Mov. Diário
                   begin

                    COD_ITEM  := StrZero(Q470.FieldByName('PRODUTO_ID').AsString, 6, 0); //Prd_425;
                    QTD       := Q470.FieldByName('QUANTIDADE').AsFloat;
                    UNID      := Q470.FieldByName('UNIDADE_VENDA').AsString; //Und_425;
                    VL_ITEM   := Q470.FieldByName('VALOR_TOTALIZADOR').AsFloat;

                    IF Dif_Tot = 0 Then
                    VL_ITEM   := Q470.FieldByName('VALOR_TOTALIZADOR').AsFloat
                    Else
                    Begin
                     if QDetalhe.FieldByName('VALOR_TOTALIZADOR').AsFloat <  Q405.FieldByName('VALOR_TOTALIZADOR').AsFloat Then
                     Begin

                       IF I = 1 then
                       Begin
                        VL_ITEM     :=  Q470.FieldByName('VALOR_TOTALIZADOR').AsFloat - Dif_Item;
                        Dif_Item    := 0;
                       End
                       Else
                       Begin
                       VL_ITEM      :=  Q470.FieldByName('VALOR_TOTALIZADOR').AsFloat;
                       I := I - 1;
                       End;

                      {if Totalizador_item  < QDetalhe.FieldByName('VALOR_TOTALIZADOR').AsFloat then
                      VL_ITEM      :=  Q470.FieldByName('VALOR_TOTALIZADOR').AsFloat
                      Else
                      VL_ITEM      := 0.01; }

                     End
                     Else if QDetalhe.FieldByName('VALOR_TOTALIZADOR').AsFloat  >  Q405.FieldByName('VALOR_TOTALIZADOR').AsFloat Then
                     Begin
                      IF I = 1 then
                       Begin
                       VL_ITEM      :=  Q470.FieldByName('VALOR_TOTALIZADOR').AsFloat + Dif_Item;
                       Dif_Item    := 0;
                       End
                      Else
                      Begin
                       VL_ITEM      :=  Q470.FieldByName('VALOR_TOTALIZADOR').AsFloat;
                       I := I - 1;
                      End;
                     End;
                    End;
                    VL_PIS    := 0;
                    Totalizador_item := Totalizador_item +  VL_ITEM ;
                   End;
                  end;
                 End;
                  Application.ProcessMessages;
                  Q470.Next;
                END;
              end;

              Label6.Caption := 'Data: ' + DateToStr(QItens.FieldByName('DT_EMISSAO').AsDateTime) + ' - Inserindo Situação Tributaria' ;
              Label3.Caption := 'Ecf: ' + StrZero(QRel.FieldByName('NUM_ECF').AsString,3,0) + ' Alíquota: ' + QDetalhe.FieldByName('SIT_TRIBUTARIA').AsString;

              Application.ProcessMessages;
              QDetalhe.Next;

             Except
                  on e:Exception do
                  begin
                    Application.MessageBox(PChar('Situação Tributaria não cadastrada no sistema favor verificar os Registros_60A/Registros_60I' + #13 +
                      'Erro: ' + e.Message), 'Erro', MB_ICONSTOP + MB_TASKMODAL);
                  end;
             end;
            end;

            if Perfil.Text = 'Perfil A' then
            begin
              Q460.Sql.Clear;
              Q460.Sql.Add('SELECT NUM_ORDEM, SUM(QUANTIDADE * VR_UNITARIO) VR_TOTAL');
              Q460.Sql.Add('FROM REGISTRO_60I');
              Q460.Sql.Add('WHERE');
              Q460.Sql.Add('(NUM_SERIE = :NUM_SERIE)');
              Q460.Sql.Add('AND (DT_EMISSAO = :DT_EMISSAO)');
              Q460.Sql.Add('GROUP BY NUM_ORDEM');

              Q460.ParamByName('NUM_SERIE').AsString    := QRel.FieldByName('SERIAL').AsString;
              Q460.ParamByName('DT_EMISSAO').AsDateTime := QItens.FieldByName('DT_EMISSAO').AsDateTime;

              Q460.Prepare;
              Q460.Open;

              while not Q460.Eof do
              begin
                with RegistroC460.New do // Doc. Fiscal Emitido por ECF
                begin
                  COD_MOD   := '2D';
                  NUM_DOC   := Q460.FieldByName('NUM_ORDEM').AsString;
                  DT_DOC    := QItens.FieldByName('DT_EMISSAO').AsDateTime;
                  VL_DOC    := Q460.FieldByName('VR_TOTAL').AsFloat;
                  VL_PIS    := 0;
                  VL_COFINS := 0;
                  CPF_CNPJ  := '';
                  NOM_ADQ   := '';

                 //CASE WHEN((TRIM(SIT_TRIBUTARIA) = :SIT_01) OR (TRIM(SIT_TRIBUTARIA) = :SIT_02)) THEN 0 ELSE (CAST(SIT_TRIBUTARIA AS INTEGER) / 100 ) END ALIQUOTA_ICMS_REGISTRO

                  Q470.Sql.Clear;
                  Q470.Sql.Add('SELECT PRODUTOS.PRODUTO_ID, PRODUTOS.UNIDADE_VENDA, PRODUTOS.ALIQUOTA_ICMS,');
                  Q470.Sql.Add('TRIBUTOS.ORIGEM, TRIBUTOS.TRIBUTACAO, TRIBUTOS.CFOP, SUM(REGISTRO_60I.QUANTIDADE) QUANTIDADE, SUM(REGISTRO_60I.QUANTIDADE * REGISTRO_60I.VR_UNITARIO) VR_TOTAL');
                  Q470.Sql.Add('FROM REGISTRO_60I');
                  Q470.Sql.Add('INNER JOIN PRODUTOS');
                  Q470.Sql.Add('ON (TRIM(REGISTRO_60I.COD_PRODUTO) = TRIM(PRODUTOS.COD_BARRA))');
                  Q470.Sql.Add('INNER JOIN TRIBUTOS');
                  Q470.Sql.Add('ON (PRODUTOS.TRIBUTO_ID = TRIBUTOS.TRIBUTO_ID)');
                  Q470.Sql.Add('WHERE');
                  Q470.Sql.Add('(REGISTRO_60I.NUM_ORDEM = :NUM_ORDEM)');
                  Q470.Sql.Add('AND (REGISTRO_60I.NUM_SERIE = :NUM_SERIE)');


                  if QRel.FieldByName('MARCA_ECF').AsString = 'DARUMA' then
                   Begin
                    Q470.Sql.Add('AND (NUM_ORDEM NOT IN (SELECT NUM_ORDEM FROM REGISTRO_60I WHERE REGISTRO_60I.SIT_TRIBUTARIA = :SIT_TRIBUTARIA_DARUMA');
                   End;

                  Q470.Sql.Add('GROUP BY PRODUTOS.PRODUTO_ID, PRODUTOS.UNIDADE_VENDA, PRODUTOS.ALIQUOTA_ICMS, TRIBUTOS.ORIGEM, TRIBUTOS.TRIBUTACAO, TRIBUTOS.CFOP');

                  Q470.ParamByName('NUM_ORDEM').AsString             := Q460.FieldByName('NUM_ORDEM').AsString;
                  Q470.ParamByName('NUM_SERIE').AsString             := QRel.FieldByName('SERIAL').AsString;
                 // Q470.ParamByName('SIT_01').AsString                := 'F';
                 // Q470.ParamByName('SIT_02').AsString                := 'I';


                  if QRel.FieldByName('MARCA_ECF').AsString = 'DARUMA' then
                  Q470.ParamByName('SIT_TRIBUTARIA_DARUMA').AsString := 'CANC';

                  Q470.Prepare;
                  Q470.Open;

                  while not Q470.Eof do
                  begin
                    with RegistroC470.New do // Itnes do Doc. Fiscal Emitido por ECF
                    begin
                      COD_ITEM  := StrZero(Q470.FieldByName('PRODUTO_ID').AsString, 6, 0);
                      QTD       := Q470.FieldByName('QUANTIDADE').AsFloat;
                      QTD_CANC  := 0;
                      UNID      := Alltrim(Q470.FieldByName('UNIDADE_VENDA').AsString);
                      VL_ITEM   := Q470.FieldByName('VR_TOTAL').AsFloat;
                      CST_ICMS  := Copy(Q470.FieldByName('ORIGEM').AsString, 1, 1) + Copy(Q470.FieldByName('TRIBUTACAO').AsString, 1, 2);
                      CFOP      := Q470.FieldByName('CFOP').AsString;
                      ALIQ_ICMS := Q470.FieldByName('ALIQUOTA_ICMS').AsFloat;
                      VL_PIS    := 0;
                      VL_COFINS := 0;
                    end;
                    Label6.Caption := 'Inserindo Produtos Vendidos pela ECF';
                    Label3.Caption := Q470.FieldByName('PRODUTO_ID').AsString;

                    Application.ProcessMessages;
                    Q470.Next;
                  end;
                end;
                Label6.Caption := 'Inserindo Cupom Fiscal';
                Label3.Caption := Q460.FieldByName('NUM_ORDEM').AsString;

                Application.ProcessMessages;
                Q460.Next;
              end;
            end;
          end;

          Q490.Sql.Clear;
          Q490.Sql.Add('SELECT SIT_TRIBUTARIA, SUM(VALOR_TOTALIZADOR) VALOR_TOTALIZADOR');
          Q490.Sql.Add('FROM REGISTRO_60A');
          Q490.Sql.Add('WHERE');
          Q490.Sql.Add('(DT_EMISSAO = :DT_EMISSAO)');
          Q490.Sql.Add('AND (NUM_SERIE = :NUM_SERIE)');
          Q490.Sql.Add('AND (SIT_TRIBUTARIA <> :SIT_TRIBUTARIA1)');
          Q490.Sql.Add('AND (SIT_TRIBUTARIA <> :SIT_TRIBUTARIA2)');
          Q490.Sql.Add('GROUP BY SIT_TRIBUTARIA');

          Q490.ParamByName('DT_EMISSAO').AsDateTime    := QItens.FieldByName('DT_EMISSAO').AsDateTime;
          Q490.ParamByName('NUM_SERIE').AsString       := QRel.FieldByName('SERIAL').AsString;
          Q490.ParamByName('SIT_TRIBUTARIA1').AsString := 'CANC';
          Q490.ParamByName('SIT_TRIBUTARIA2').AsString := 'DESC';

          Q490.Prepare;
          Q490.Open;

          if QItens.FieldByName('VENDA_BRUTA').AsFloat <> QVendaBruta.FieldByName('VENDA_BRUTA').AsFloat  then
            D_Vbruta      := QVendaBruta.FieldByName('VENDA_BRUTA').AsFloat - QItens.FieldByName('VENDA_BRUTA').AsFloat;


          while not Q490.Eof do
          begin
            QTributo.Sql.Clear;
             {
            if Q490.FieldByName('VALOR_TOTALIZADOR').AsFloat > D_Vbruta  then
                Begin
                Valor_Totalizador := Q490.FieldByName('VALOR_TOTALIZADOR').AsFloat - D_Vbruta;
                D_Vbruta := 0;
                End
                Else
                Valor_Totalizador := Q490.FieldByName('VALOR_TOTALIZADOR').AsFloat;

             if QVendaBruta_A.FieldByName('VENDA_BRUTA_A').AsFloat = QItens.FieldByName('VENDA_BRUTA').AsFloat then   }
                Valor_Totalizador := Q490.FieldByName('VALOR_TOTALIZADOR').AsFloat;

            if (Q490.FieldByName('SIT_TRIBUTARIA').AsString = '0700') or (Q490.FieldByName('SIT_TRIBUTARIA').AsString = '1200') or (Q490.FieldByName('SIT_TRIBUTARIA').AsString = '0840') or
               (Q490.FieldByName('SIT_TRIBUTARIA').AsString = '0560') or (Q490.FieldByName('SIT_TRIBUTARIA').AsString = '0702') or (Q490.FieldByName('SIT_TRIBUTARIA').AsString = '0720') or
               (Q490.FieldByName('SIT_TRIBUTARIA').AsString = '1260') or (Q490.FieldByName('SIT_TRIBUTARIA').AsString = '0400') or
               (Q490.FieldByName('SIT_TRIBUTARIA').AsString = '1800') or (Q490.FieldByName('SIT_TRIBUTARIA').AsString = '2500') or (Q490.FieldByName('SIT_TRIBUTARIA').AsString = '3000') or
               (Q490.FieldByName('SIT_TRIBUTARIA').AsString = '3000') or (Q490.FieldByName('SIT_TRIBUTARIA').AsString = '1400') OR (Q490.FieldByName('SIT_TRIBUTARIA').AsString = '0332') then
            begin
              QTributo.Sql.Add('SELECT * FROM TRIBUTOS');
              QTributo.Sql.Add('WHERE');
              QTributo.Sql.Add('(ALIQUOTA_ICMS = :ALIQUOTA_ICMS)');

              if Q490.FieldByName('SIT_TRIBUTARIA').AsString = '0700' then
                QTributo.ParamByName('ALIQUOTA_ICMS').AsFloat := 7
              else if Q490.FieldByName('SIT_TRIBUTARIA').AsString = '1200' then
                QTributo.ParamByName('ALIQUOTA_ICMS').AsFloat := 12
              else if Q490.FieldByName('SIT_TRIBUTARIA').AsString = '1800' then
                QTributo.ParamByName('ALIQUOTA_ICMS').AsFloat := 18
              else if Q490.FieldByName('SIT_TRIBUTARIA').AsString = '2500' then
                QTributo.ParamByName('ALIQUOTA_ICMS').AsFloat := 25
              else if Q490.FieldByName('SIT_TRIBUTARIA').AsString = '3000' then
                QTributo.ParamByName('ALIQUOTA_ICMS').AsFloat := 30
              else if Q490.FieldByName('SIT_TRIBUTARIA').AsString = '0840' then
                QTributo.ParamByName('ALIQUOTA_ICMS').AsFloat := 8.40
              else if Q490.FieldByName('SIT_TRIBUTARIA').AsString = '1400' then
                QTributo.ParamByName('ALIQUOTA_ICMS').AsFloat := 14
              else if Q490.FieldByName('SIT_TRIBUTARIA').AsString = '0400' then
                QTributo.ParamByName('ALIQUOTA_ICMS').AsFloat := 4
              else if Q490.FieldByName('SIT_TRIBUTARIA').AsString = '0332' then
                QTributo.ParamByName('ALIQUOTA_ICMS').AsFloat := 3.32;
            end
            else if Alltrim(Q490.FieldByName('SIT_TRIBUTARIA').AsString) = 'F' then
            begin
              QTributo.Sql.Add('SELECT * FROM TRIBUTOS');
              QTributo.Sql.Add('WHERE');
              QTributo.Sql.Add('(CODIGO_ECF = :CODIGO_ECF)');

              QTributo.ParamByName('CODIGO_ECF').AsString := 'FF';
            end
            else if Alltrim(Q490.FieldByName('SIT_TRIBUTARIA').AsString) = 'F1' then
            begin
              QTributo.Sql.Add('SELECT * FROM TRIBUTOS');
              QTributo.Sql.Add('WHERE');
              QTributo.Sql.Add('(CODIGO_ECF = :CODIGO_ECF)');

              QTributo.ParamByName('CODIGO_ECF').AsString := 'F1';
            end
            else if Alltrim(Q490.FieldByName('SIT_TRIBUTARIA').AsString) = 'F2' then
            begin
              QTributo.Sql.Add('SELECT * FROM TRIBUTOS');
              QTributo.Sql.Add('WHERE');
              QTributo.Sql.Add('(CODIGO_ECF = :CODIGO_ECF)');

              QTributo.ParamByName('CODIGO_ECF').AsString := 'F2';
            end
            else if Alltrim(Q490.FieldByName('SIT_TRIBUTARIA').AsString) = 'I' then
            begin
              QTributo.Sql.Add('SELECT * FROM TRIBUTOS');
              QTributo.Sql.Add('WHERE');
              QTributo.Sql.Add('(CODIGO_ECF = :CODIGO_ECF)');

              QTributo.ParamByName('CODIGO_ECF').AsString := 'II';
            end
            else if Alltrim(Q490.FieldByName('SIT_TRIBUTARIA').AsString) = 'N' then
            begin
              QTributo.Sql.Add('SELECT * FROM TRIBUTOS');
              QTributo.Sql.Add('WHERE');
              QTributo.Sql.Add('(CODIGO_ECF = :CODIGO_ECF)');

              QTributo.ParamByName('CODIGO_ECF').AsString := 'NN';
            end;

            QTributo.Prepare;
            QTributo.Open;


            if QTributo.FieldByName('ALIQUOTA_ICMS').AsFloat > 0 then
              Valor_ICMS := TruncVal(((Valor_Totalizador * QTributo.FieldByName('ALIQUOTA_ICMS').AsFloat) / 100), 2)
            else
              Valor_ICMS := 0;

            with RegistroC490.New do // Registro Analítico do Mov. Diário
            begin
              CST_ICMS   := Copy(QTributo.FieldByName('ORIGEM').AsString, 1, 1) + Copy(QTributo.FieldByName('TRIBUTACAO').AsString, 1, 2);
              CFOP       := QTributo.FieldByName('CFOP').AsString;
              ALIQ_ICMS  := QTributo.FieldByName('ALIQUOTA_ICMS').AsFloat;
              VL_OPR     := Valor_Totalizador;
              VL_BC_ICMS := Valor_Totalizador;
              VL_ICMS    := Valor_ICMS;
              COD_OBS    := '';

              if (Copy(QTributo.FieldByName('TRIBUTACAO').AsString, 1, 2) = '30') or (Copy(QTributo.FieldByName('TRIBUTACAO').AsString, 1, 2) = '40') or (Copy(QTributo.FieldByName('TRIBUTACAO').AsString, 1, 2) = '41') or
                 (Copy(QTributo.FieldByName('TRIBUTACAO').AsString, 1, 2) = '50') or (Copy(QTributo.FieldByName('TRIBUTACAO').AsString, 1, 2) = '60') then
              begin
                ALIQ_ICMS  := 0;
                VL_BC_ICMS := 0;
                VL_ICMS    := 0;
              end;

            end;

            Deb_ICMS := Deb_ICMS + Valor_ICMS;

            Application.ProcessMessages;
            Q490.Next;
          end;
        end;
        Application.ProcessMessages;
        QItens.Next;
      end;

      if (INotas mod ACBrSPEDFiscal1.LinhasBuffer) = 0 then
      begin
        ACBrSPEDFiscal1.WriteBloco_C(False);
        Application.ProcessMessages;
      end;

      Inc(INotas);
      Label6.Caption := 'Inserindo CNI';
      Label3.Caption := QRel.FieldByName('CNI').AsString;

      Application.ProcessMessages;
      QRel.Next;
    end;



    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT * FROM TRANSACOES');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(DT_SPED BETWEEN :DT_INICIAL AND :DT_FINAL)');
    QRel.Sql.Add('AND (EMPRESA_ID = :EMPRESA_ID)');
    QRel.Sql.Add('AND (TPCTB <= :TPCTB)');
    QRel.Sql.Add('AND (CONDUTA = :CD_CPR)');
    QRel.Sql.Add('AND (DEPTO = :DEPTO)');
    QRel.Sql.Add('AND (CFOP <> :NULO)');
    QRel.Sql.Add('AND (NUM_DOC <> :NULO)');
    QRel.Sql.Add('AND ((MODELO = :MODELO)');
    QRel.Sql.Add('OR (MODELO = :MODELO1))');
    QRel.Sql.Add('ORDER BY NUM_DOC');

    QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
    QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    QRel.ParamByName('CD_CPR').AsString       := '02';
    QRel.ParamByName('DEPTO').AsString        := '02';
    QRel.ParamByName('NULO').AsString         := '';
    QRel.ParamByName('MODELO').AsString       := '06';
    QRel.ParamByName('MODELO1').AsString      := '29';


    QRel.Prepare;
    QRel.Open;

    QRel.First;
    while not QRel.Eof do
    begin

      with RegistroC500New do
      begin
        IND_OPER         := tpEntradaAquisicao;
        IND_EMIT         := edTerceiros;
        COD_PART         := 'F' + StrZero(QRel.FieldByName('FORNECEDOR_ID').AsString, 6, 0);
        COD_MOD          := QRel.FieldByName('MODELO').AsString;
        COD_SIT          := sdRegular;
        SER              := QRel.FieldByName('SERIE').AsString;
        SUB              := QRel.FieldByName('SUB_SERIE').AsString;
        COD_CONS         := '01';
        NUM_DOC          := QRel.FieldByName('NUM_DOC').AsString;
        DT_DOC           := QRel.FieldByName('DT_TRANS').AsDateTime;
        DT_E_S           := QRel.FieldByName('DT_ENT_SAI').AsDateTime;
        VL_DOC           := QRel.FieldByName('VALOR').AsFloat;
        VL_DESC          := 0;
        VL_FORN          := QRel.FieldByName('VALOR').AsFloat;
        VL_SERV_NT       := 0;
        VL_TERC          := 0;
        VL_DA            := 0;
        VL_BC_ICMS       := QRel.FieldByName('BASE_ICMS_NORMAL').AsFloat;
        VL_ICMS          := QRel.FieldByName('VR_ICMS_NORMAL').AsFloat;
        VL_BC_ICMS_ST    := QRel.FieldByName('BASE_ICMS_ST').AsFloat;
        VL_ICMS_ST       := QRel.FieldByName('VR_ICMS_ST').AsFloat;
        COD_INF          := '';
        VL_PIS           := QRel.FieldByName('VR_PIS').AsFloat;
        VL_COFINS        := QRel.FieldByName('VR_COFINS').AsFloat;
        TP_LIGACAO       := tlBifasico;
        COD_GRUPO_TENSAO := gtA1;
        Vr_ICMS_ST       := Vr_ICMS_ST + QRel.FieldByName('VR_ICMS_ST').AsFloat;
        CHV_DOCE         := QRel.FieldByName('CHAVE_NFE').AsString;
        FIN_DOCe         := fedcNormal;
        CHV_DOCe_REF     := '';
        IND_DEST         := iedaContribuinteICMS;
        //COD_MUN_DEST     := FrmPrincipal.QEmpresa.FieldByName('IBGE').AsString;
        COD_CTA          := StrZero(QRel.FieldByName('CONTA_ID').AsString, 6, 0);
{
        with RegistroC510New do
        begin
          NUM_ITEM      := 0;
          COD_ITEM      := '';
          COD_CLASS     := '';
          QTD           := 0;
          UNID          := '';
          VL_ITEM       := 0;
          VL_DESC       := 0;
          CST_ICMS      := '';
          CFOP          := '';
          VL_BC_ICMS    := 0;
          ALIQ_ICMS     := 0;
          VL_ICMS       := 0;
          VL_BC_ICMS_ST := 0;
          ALIQ_ST       := 0;
          VL_ICMS_ST    := 0;
          IND_REC       := '';
          COD_PART      := '';
          VL_PIS        := 0;
          VL_COFINS     := 0;
          COD_CTA       := '';
        end;
}
        with RegistroC590New do
        begin
          CST_ICMS      := QRel.FieldByName('CST_ICMS').AsString;
          CFOP          := QRel.FieldByName('CFOP').AsString;
          ALIQ_ICMS     := QRel.FieldByName('ALIQUOTA_ICMS').AsFloat;
          VL_OPR        := QRel.FieldByName('VALOR').AsFloat;
          VL_BC_ICMS    := QRel.FieldByName('BASE_ICMS_NORMAL').AsFloat;
          VL_ICMS       := QRel.FieldByName('VR_ICMS_NORMAL').AsFloat;
          VL_BC_ICMS_ST := QRel.FieldByName('BASE_ICMS_ST').AsFloat;
          VL_ICMS_ST    := QRel.FieldByName('VR_ICMS_ST').AsFloat;
          VL_RED_BC     := 0;
          COD_OBS       := '';

          Cred_ICMS  := Cred_ICMS + QRel.FieldByName('VR_ICMS_NORMAL').AsFloat;
        end;
      end;

      Application.ProcessMessages;
      QRel.Next;
    end;
  end;

  ACBrSPEDFiscal1.WriteBloco_C(True);
end;

procedure TFrmSPED_Fiscal.Registros_Bloco_D;
var
Tem_Dados1, Tem_Dados2, Doc_Cancelado, Cte_Cancelado: Boolean;
Ibge_Cliente, Ibge_Fornecedor, Placa: string;
begin
  Tem_Dados1 := True;
  Tem_Dados2 := True;

  QRel.Sql.Clear;
  QRel.Sql.Add('SELECT * FROM TRANSACOES');
  QRel.Sql.Add('WHERE');
  QRel.Sql.Add('(DT_SPED BETWEEN :DT_INICIAL AND :DT_FINAL)');
  QRel.Sql.Add('AND (EMPRESA_ID = :EMPRESA_ID)');
  QRel.Sql.Add('AND (TPCTB <= :TPCTB)');
  QRel.Sql.Add('AND (CONDUTA = :CD_CPR)');
  QRel.Sql.Add('AND (DEPTO = :DEPTO)');
  QRel.Sql.Add('AND (CFOP <> :NULO)');
  QRel.Sql.Add('AND ((MODELO = :MODELO1) OR (MODELO = :MODELO2))');
  QRel.Sql.Add('ORDER BY NUM_DOC');

  QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
  QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
  QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
  QRel.ParamByName('CD_CPR').AsString       := '02';
  QRel.ParamByName('DEPTO').AsString        := '02';
  QRel.ParamByName('NULO').AsString         := '';
  QRel.ParamByName('MODELO1').AsString      := '21';
  QRel.ParamByName('MODELO2').AsString      := '22';

  QRel.Prepare;
  QRel.Open;

  if QRel.IsEmpty then
    Tem_Dados1 := False;

  QRel.Sql.Clear;
  QRel.Sql.Add('SELECT TRANSACOES.*,');
  QRel.Sql.Add('CASE WHEN COMPL_CTEFISCAL.CHAVE_NFE IS NOT NULL THEN COMPL_CTEFISCAL.CHAVE_NFE ELSE CTES_CANCELADAS.CHAVE_NFE END CHAVE_CTE FROM TRANSACOES');
  QRel.Sql.Add('LEFT JOIN COMPL_CTEFISCAL ON COMPL_CTEFISCAL.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID');
  QRel.Sql.Add('LEFT JOIN CTES_CANCELADAS ON CTES_CANCELADAS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID');
  QRel.Sql.Add('WHERE');
  QRel.Sql.Add('(DT_SPED BETWEEN :DT_INICIAL AND :DT_FINAL)');
  QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
  QRel.Sql.Add('AND (TPCTB <= :TPCTB)');
  QRel.Sql.Add('AND (CFOP <> :NULO)');
  QRel.Sql.Add('AND (NUM_DOC <> :NULO)');
  QRel.Sql.Add('AND (((MODELO = :MODELO1) OR (MODELO = :MODELO2) OR (MODELO = :MODELO3) OR (MODELO = :MODELO4) OR (MODELO = :MODELO5) OR (MODELO = :MODELO6) OR (MODELO = :MODELO7) OR (MODELO = :MODELO8) OR (MODELO = :MODELO9) OR (MODELO = :MODELO10)))');
  QRel.Sql.Add('ORDER BY NUM_DOC');

  QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
  QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
  QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
  QRel.ParamByName('NULO').AsString         := '';
  QRel.ParamByName('MODELO1').AsString      := '07';
  QRel.ParamByName('MODELO2').AsString      := '08';
  QRel.ParamByName('MODELO3').AsString      := '8B';
  QRel.ParamByName('MODELO4').AsString      := '09';
  QRel.ParamByName('MODELO5').AsString      := '10';
  QRel.ParamByName('MODELO6').AsString      := '11';
  QRel.ParamByName('MODELO7').AsString      := '26';
  QRel.ParamByName('MODELO8').AsString      := '27';
  QRel.ParamByName('MODELO9').AsString      := '57';
  QRel.ParamByName('MODELO10').AsString     := '67';

  QRel.Prepare;
  QRel.Open;

  if QRel.IsEmpty then
    Tem_Dados2 := False;

  with ACBrSpedFiscal1.Bloco_D do
  begin
    with RegistroD001New do
    begin
      if (not Tem_Dados1) and (not Tem_Dados2) then
        IND_MOV := imSemDados
      else
        IND_MOV := imComDados;

      QRel.First;
      while not QRel.Eof do
      begin

        //1-Alteração dia 11/05/2021, ctes modelo 57 cancelados indo como emitidos e sem chave.
        Cte_Cancelado := False;
        if QRel.FieldByName('MODELO').AsString = '57' then
        begin
          QDetalhe.Sql.Clear;
          QDetalhe.Sql.Add('SELECT * FROM CTES_CANCELADAS');
          QDetalhe.Sql.Add('WHERE');
          QDetalhe.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

          QDetalhe.ParamByName('TRANSACAO_ID').AsInteger := QRel.FieldByName('TRANSACAO_ID').AsInteger;

          QDetalhe.Prepare;
          QDetalhe.Open;

          if not QDetalhe.IsEmpty then
          begin
            Cte_Cancelado := True;
          end;
        end;

        with RegistroD100New do
        begin
          if (QRel.FieldByName('CONDUTA').AsString = '01') AND (QRel.FieldByName('DEPTO').AsString = '03') or
             (QRel.FieldByName('CONDUTA').AsString = '01') AND (QRel.FieldByName('DEPTO').AsString = '07')   then
          Begin
          IND_OPER    := tpSaidaPrestacao;
          COD_PART    := 'C' + StrZero(QRel.FieldByName('CLIENTE_ID').AsString, 6, 0);
          IND_EMIT    := edEmissaoPropria;
          COD_MUN_ORIG := FrmPrincipal.QEmpresa.FieldByName('IBGE').AsString;

           QSearch.Sql.Clear;
           QSearch.Sql.Add('SELECT IBGE FROM CLIENTES WHERE CLIENTE_ID = :CLIENTE_ID');
           QSearch.ParamByName('CLIENTE_ID').AsInteger := QRel.FieldByName('CLIENTE_ID').AsInteger;
           QSearch.Prepare;
           QSearch.Open;

           if not QSearch.isEmpty Then
           Ibge_Cliente := QSearch.FieldByName('IBGE').AsString
           Else
           Ibge_Cliente := FrmPrincipal.QEmpresa.FieldByName('IBGE').AsString;

           COD_MUN_DEST := Ibge_Cliente;

          End
          Else
          Begin
          IND_OPER    := tpEntradaAquisicao ;
          COD_PART    := 'F' + StrZero(QRel.FieldByName('FORNECEDOR_ID').AsString, 6, 0);
          IND_EMIT    := edTerceiros;
          COD_MUN_Dest := FrmPrincipal.QEmpresa.FieldByName('IBGE').AsString;

           QSearch.Sql.Clear;
           QSearch.Sql.Add('SELECT IBGE FROM FORNECEDORES WHERE FORNECEDOR_ID = :FORNECEDOR_ID');
           QSearch.ParamByName('FORNECEDOR_ID').AsInteger := QRel.FieldByName('FORNECEDOR_ID').AsInteger;
           QSearch.Prepare;
           QSearch.Open;

           if not QSearch.isEmpty Then
           Ibge_Fornecedor := QSearch.FieldByName('IBGE').AsString
           Else
           Ibge_Fornecedor := FrmPrincipal.QEmpresa.FieldByName('IBGE').AsString;

           COD_MUN_ORIG := Ibge_Fornecedor;

          End;

          COD_MOD     := QRel.FieldByName('MODELO').AsString;

          COD_SIT     := sdRegular;
          SER         := QRel.FieldByName('SERIE').AsString;
          SUB         := QRel.FieldByName('SUB_SERIE').AsString;
          NUM_DOC     := QRel.FieldByName('NUM_DOC').AsString;

          if (QRel.FieldByName('CONDUTA').AsString = '02') Then
          CHV_CTE     := QRel.FieldByName('CHAVE_NFE').AsString
          Else
          CHV_CTE     := QRel.FieldByName('CHAVE_CTE').AsString;

          DT_DOC      := QRel.FieldByName('DT_TRANS').AsDateTime;;
          DT_A_P      := QRel.FieldByName('DT_ENT_SAI').AsDateTime;
          TP_CT_e     := '0';
          CHV_CTE_REF := '';
          VL_DOC      := QRel.FieldByName('VALOR').AsFloat;
          VL_DESC     := 0;
          IND_FRT     := tfPorContaDestinatario;
          VL_SERV     := QRel.FieldByName('VALOR').AsFloat;
          VL_BC_ICMS  := QRel.FieldByName('BASE_ICMS_NORMAL').AsFloat;
          VL_ICMS     := QRel.FieldByName('VR_ICMS_NORMAL').AsFloat;
          VL_NT       := 0;
          COD_INF     := '';
          COD_CTA     := StrZero(QRel.FieldByName('CONTA_ID').AsString, 6, 0);

          //1-Alteração dia 11/05/2021, mudança nos valores para ctes cancelados
          if Cte_Cancelado then
          begin
            if Trim(LowerCase(QDetalhe.FieldByName('recibo').AsString)) = 'inutilizada' then
              COD_SIT     := sdDoctoNumInutilizada
            else
              COD_SIT     := sdCancelado;
          //end;
            COD_PART    := '';
            DT_DOC      := 0;
            DT_A_P      := 0;
            CHV_CTE     := QDetalhe.FieldByName('CHAVE_NFE').AsString;
            TP_CT_e     := '';
            IND_FRT     := tfNenhum;
            VL_BC_ICMS  := 0;
            VL_ICMS     := 0;
            VL_DOC      := 0;
            COD_CTA     := '';
            COD_MUN_ORIG := '';
            COD_MUN_Dest := '';
            VL_SERV     := 0;
          end;

        end;

          QItens.Sql.Clear;
          QItens.Sql.Add('SELECT * FROM TRANSITENS WHERE TRANSACAO_ID = :TRANSACAO_ID');

          QItens.ParamByName('TRANSACAO_ID').AsInteger := QRel.FieldByName('TRANSACAO_ID').AsInteger;

          QItens.Prepare;
          QItens.Open;

         { QItens.First;
          while not QItens.Eof do
          begin
            with RegistroD110New do
            begin
            NUN_ITEM := StrToInt(QItens.FieldByName('SEQUENCIA').AsString);
            COD_ITEM := QItens.FieldByName('PRODUTO_ID').AsString;
            VL_SERV  := QItens.FieldByName('VR_TOTAL').AsFloat;
            VL_OUT   := 0;
            end;
            Application.ProcessMessages;
            QItens.Next;
          end;

            with RegistroD120New do
            begin
             COD_MUN_ORIG :=
             COD_MUN_DEST :=
             VEIC_ID      :=
             UF_ID        :=
            end;
//          end;
}
          {
          if (QRel.FieldByName('CONDUTA').AsString = '01') AND (QRel.FieldByName('DEPTO').AsString = '03') or
             (QRel.FieldByName('CONDUTA').AsString = '01') AND (QRel.FieldByName('DEPTO').AsString = '07')   then
          Begin
            with RegistroD130New do
            begin
              QSearch.Sql.Clear;
              QSearch.Sql.Add('SELECT * FROM COMPL_CTEFISCAL WHERE TRANSACAO_ID = :TRANSACAO_ID');
              QSearch.ParamByName('TRANSACAO_ID').AsInteger := QRel.FieldByName('TRANSACAO_ID').AsInteger;
              QSearch.Prepare;
              QSearch.Open;

              if not QSearch.IsEmpty then
              begin
                Ibge_Cliente    := QSearch.FieldByName('IBGE_DESTINO').AsString;
                Ibge_Fornecedor := QSearch.FieldByName('IBGE_ORIGEM').AsString;
                Placa           := QSearch.FieldByName('PLACA_VEICULO').AsString;
              end
              else
              begin
                Ibge_Cliente    := FrmPrincipal.QEmpresa.FieldByName('IBGE').AsString;
                Ibge_Fornecedor := FrmPrincipal.QEmpresa.FieldByName('IBGE').AsString;
                Placa           := QSearch.FieldByName('PLACA_VEICULO').AsString;
              end;


              COD_PART_CONSG := '';
              COD_PART_RED   := '';
              IND_FRT_RED    := frSemRedespacho;
              COD_MUN_ORIG   := Ibge_Fornecedor;
              COD_MUN_DEST   := Ibge_Cliente;
              VEIC_ID        := Placa;
              VL_LIQ_FRT     := QRel.FieldByName('VALOR').AsFloat;
              VL_SEC_CAT     := 0;
              VL_DESP        := 0;
              VL_PEDG        := 0;
              VL_OUT         := 0;
              VL_FRT         := QRel.FieldByName('VALOR').AsFloat;
              UF_ID          := QSearch.FieldByName('UF_TRANSPORTADOR').AsString;
            end;
          End;
          }
{
          with RegistroD140New do
          begin
            // COD_PART_CONSG   :=
            // COD_MUN_ORIG     :=
            // COD_MUN_DEST     :=
            // IND_VEIC         :=
            // VEIC_ID          :=
            // IND_NAV          :=
            // VIAGEM           :=
            // VL_FRT_LIQ       :=
            // VL_DESP_PORT     :=
            // VL_DESP_CAR_DESC :=
            // VL_OUT           :=
            // VL_FRT_BRT       :=
            // VL_FRT_MM        :=
          end;

          with RegistroD150New do
          begin
            // COD_MUN_ORIG :=
            // COD_MUN_DEST :=
            // VEIC_ID      :=
            // VIAGEM       :=
            // IND_TFA      :=
            // VL_PESO_TX   :=
            // VL_TX_TERR   :=
            // VL_TX_RED    :=
            // VL_OUT       :=
            // VL_TX_ADV    :=
          end;

          with RegistroD160New do
          begin
            // DESPACHO      :=
            // CNPJ_CPF_REM  :=
            // IE_REM        :=
            // COD_MUN_ORI   :=
            // CNPJ_CPF_DEST :=
            // IE_DEST       :=
            // COD_MUN_DEST  :=

            with RegistroD161New do
            begin
              // IND_CARGA    :=
              // CNPJ_COL     :=
              // IE_COL       :=
              // COD_MUN_COL  :=
              // CNPJ_ENTG    :=
              // IE_ENTG      :=
              // COD_MUN_ENTG :=
            end;

            if (QRel.FieldByName('CFOP').AsString <> '5359') and (QRel.FieldByName('CFOP').AsString <> '6359') then
            begin
              with RegistroD162New do
              begin
                // COD_MOD  :=
                // SER      :=
                // NUM_DOC  :=
                // DT_DOC   :=
                // VL_DOC   :=
                // VL_MERC  :=
                // QTD_VOL  :=
                // PESO_BRT :=
                // PESO_LIQ :=
              end;
            end;
          end;

          with RegistroD170New do
          begin
            // COD_PART_CONSG :=
            // COD_PART_RED   :=
            // COD_MUN_ORIG   :=
            // COD_MUN_DEST   :=
            // OTM            :=
            // IND_NAT_FRT    :=
            // VL_LIQ_FRT     :=
            // VL_GRIS        :=
            // VL_PDG         :=
            // VL_OUT         :=
            // VL_FRT         :=
            // VEIC_ID        :=
            // UF_ID          :=
          end;

          with RegistroD180New do
          begin
            // NUM_SEQ      :=
            // IND_EMIT     :=
            // CNPJ_EMIT    :=
            // UF_EMIT      :=
            // IE_EMIT      :=
            // COD_MUN_ORIG :=
            // CNPJ_CPF_TOM :=
            // UF_TOM       :=
            // IE_TOM       :=
            // COD_MUN_DEST :=
            // COD_MOD      :=
            // SER          :=
            // SUB          :=
            // NUM_DOC      :=
            // DT_DOC       :=
            // VL_DOC       :=
          end;
}
          //1-Alteração dia 11/05/2021, não gerar registro D190 caso cte cancelado
          //2025 é pra gerar de cancelado de novo  // e já voltaram atrás em 09/04/2025
          if (not Cte_Cancelado) then
          begin
            with RegistroD190New do
            begin
             if QItens.FieldByName('CST').AsString = '' then
              CST_ICMS   := QRel.FieldByName('CST_ICMS').AsString
             Else
              CST_ICMS   := QItens.FieldByName('CST').AsString;

              CFOP       := QRel.FieldByName('CFOP').AsString;
              if (QRel.FieldByName('ALIQUOTA_ICMS').AsFloat > 0) or (QRel.FieldByName('BASE_ICMS_NORMAL').AsFloat = 0) then
                ALIQ_ICMS  := QRel.FieldByName('ALIQUOTA_ICMS').AsFloat
              else
                ALIQ_ICMS  := QRel.FieldByName('VR_ICMS_NORMAL').AsFloat * 100 / QRel.FieldByName('BASE_ICMS_NORMAL').AsFloat;
              VL_OPR     := QRel.FieldByName('VALOR').AsFloat;
              VL_BC_ICMS := QRel.FieldByName('BASE_ICMS_NORMAL').AsFloat;
              VL_ICMS    := QRel.FieldByName('VR_ICMS_NORMAL').AsFloat;
              VL_RED_BC  := 0;
              COD_OBS    := '';

              if QRel.FieldByName('CONDUTA').AsString = '01' then
                Deb_ICMS  := Deb_ICMS + QRel.FieldByName('VR_ICMS_NORMAL').AsFloat
              else
                Cred_ICMS := Cred_ICMS + QRel.FieldByName('VR_ICMS_NORMAL').AsFloat;
            end;
          end;

          {
          with RegistroD190New do
          begin
           if QItens.FieldByName('CST').AsString = '' then
            CST_ICMS   := QRel.FieldByName('CST_ICMS').AsString
           Else
            CST_ICMS   := QItens.FieldByName('CST').AsString;

            CFOP       := QRel.FieldByName('CFOP').AsString;
            ALIQ_ICMS  := QRel.FieldByName('ALIQUOTA_ICMS').AsFloat;
            VL_OPR     := QRel.FieldByName('VALOR').AsFloat;
            VL_BC_ICMS := QRel.FieldByName('BASE_ICMS_NORMAL').AsFloat;
            VL_ICMS    := QRel.FieldByName('VR_ICMS_NORMAL').AsFloat;
            VL_RED_BC  := 0;
            COD_OBS    := '';
          end;
          }
        Application.ProcessMessages;
        QRel.Next;
      end;

{
      with RegistroD300New do
      begin
        // COD_MOD     :=
        // SER         :=
        // SUB         :=
        // NUM_DOC_INI :=
        // NUM_DOC_FIN :=
        // CST_ICMS    :=
        // CFOP        :=
        // ALIQ_ICMS   :=
        // DT_DOC      :=
        // VL_OPR      :=
        // VL_DESC     :=
        // VL_SERV     :=
        // VL_SEG      :=
        // VL_OUT_DESP :=
        // VL_BC_ICMS  :=
        // VL_ICMS     :=
        // VL_RED_BC   :=
        // COD_OBS     :=
        // COD_CTA     :=

        with RegistroD301New do
        begin
          // NUM_DOC_CANC :=
        end;

        with RegistroD310New do
        begin
          // COD_MUN_ORIG :=
          // VL_SERV      :=
          // VL_BC_ICMS   :=
          // VL_ICMS      :=
        end;
      end;
}
//      with RegistroD350New do
//      begin
        // COD_MOD :=
        // ECF_MOD :=
        // ECF_FAB :=
        // ECF_CX  :=

//        with RegistroD355New do
//        begin
          // DT_DOC      :=
          // CRO         :=
          // CRZ         :=
          // NUM_COO_FIN :=
          // GT_FIN      :=
          // VL_BRT      :=

//          with RegistroD360New do
//          begin
            // VL_PIS    :=
            // VL_COFINS :=
//          end;

//          with RegistroD365New do
//          begin
            // COD_TOT_PAR  :=
            // VLR_ACUM_TOT :=
            // NR_TOT       :=
            // DESCR_NR_TOT :=

//            with RegistroD370New do
//            begin
              // COD_MUN_ORIG :=
              // VL_SERV      :=
              // QTD_BILH     :=
              // VL_BC_ICMS   :=
              // VL_ICMS      :=
//            end;
//          end;

//          with RegistroD390New do
//          begin
            // CST_ICMS    :=
            // CFOP        :=
            // ALIQ_ICMS   :=
            // VL_OPR      :=
            // VL_BC_ISSQN :=
            // ALIQ_ISSQN  :=
            // VL_ISSQN    :=
            // VL_BC_ICMS  :=
            // VL_ICMS     :=
            // COD_OBS     :=
//          end;
//        end;
//      end;

//      with RegistroD400New do
//      begin
        // COD_PART   :=
        // COD_MOD    :=
        // COD_SIT    :=
        // SER        :=
        // SUB        :=
        // NUM_DOC    :=
        // DT_DOC     :=
        // VL_DOC     :=
        // VL_DESC    :=
        // VL_SERV    :=
        // VL_BC_ICMS :=
        // VL_ICMS    :=
        // VL_PIS     :=
        // VL_COFINS  :=
        // COD_CTA    :=

//        with RegistroD410New do
//        begin
          // COD_MOD     :=
          // SER         :=
          // SUB         :=
          // NUM_DOC_INI :=
          // NUM_DOC_FIN :=
          // DT_DOC      :=
          // CST_ICMS    :=
          // CFOP        :=
          // ALIQ_ICMS   :=
          // VL_OPR      :=
          // VL_DESC     :=
          // VL_SERV     :=
          // VL_BC_ICMS  :=
          // VL_ICMS     :=

//          with RegistroD411New do
//          begin
            // NUM_DOC_CANC :=
//          end;
//        end;

//        with RegistroD420New do
//        begin
          // COD_MUN_ORIG :=
          // VL_SERV      :=
          // VL_BC_ICMS   :=
          // VL_ICMS      :=
//        end;
//      end;

      QRel.Sql.Clear;
      QRel.Sql.Add('SELECT * FROM TRANSACOES');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(DT_SPED BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('AND (EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (CONDUTA = :CD_CPR)');
      QRel.Sql.Add('AND (DEPTO = :DEPTO)');
      QRel.Sql.Add('AND (CFOP <> :NULO)');
      QRel.Sql.Add('AND ((MODELO = :MODELO1) OR (MODELO = :MODELO2))');
      QRel.Sql.Add('ORDER BY NUM_DOC');

      QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
      QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
      QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
      QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
      QRel.ParamByName('CD_CPR').AsString       := '02';
      QRel.ParamByName('DEPTO').AsString        := '02';
      QRel.ParamByName('NULO').AsString         := '';
      QRel.ParamByName('MODELO1').AsString      := '21';
      QRel.ParamByName('MODELO2').AsString      := '22';

      QRel.Prepare;
      QRel.Open;

      QRel.First;
      while not QRel.Eof do
      begin
        with RegistroD500New do
        begin
          IND_OPER     := tpEntradaAquisicao;
          IND_EMIT     := edTerceiros;
          COD_PART     := 'F' + StrZero(QRel.FieldByName('FORNECEDOR_ID').AsString, 6, 0);
          COD_MOD      := QRel.FieldByName('MODELO').AsString;
          COD_SIT      := sdRegular;
          SER          := QRel.FieldByName('SERIE').AsString;
          SUB          := QRel.FieldByName('SUB_SERIE').AsString;
          NUM_DOC      := QRel.FieldByName('NUM_DOC').AsString;
          DT_DOC       := QRel.FieldByName('DT_TRANS').AsDateTime;
          DT_A_P       := QRel.FieldByName('DT_ENT_SAI').AsDateTime;
          VL_DOC       := QRel.FieldByName('VALOR').AsFloat;
          VL_DESC      := 0;
          VL_SERV      := QRel.FieldByName('VALOR').AsFloat;
          VL_SERV_NT   := 0;
          VL_TERC      := 0;
          VL_DA        := 0;
          VL_BC_ICMS   := QRel.FieldByName('BASE_ICMS_NORMAL').AsFloat;
          VL_ICMS      := QRel.FieldByName('VR_ICMS_NORMAL').AsFloat;
          COD_INF      := '';
          VL_PIS       := QRel.FieldByName('VR_PIS').AsFloat;
          VL_COFINS    := QRel.FieldByName('VR_COFINS').AsFloat;
          COD_CTA      := StrZero(QRel.FieldByName('CONTA_ID').AsString, 6, 0);
          TP_ASSINANTE := assComercialIndustrial;

//        with RegistroD510New do
//        begin
          // IND_REC :=
//        end;

//        with RegistroD530New do
//        begin
          // IND_SERV :=
//        end;

          with RegistroD590New do
          begin
            CST_ICMS      := QRel.FieldByName('CST_ICMS').AsString;
            CFOP          := QRel.FieldByName('CFOP').AsString;
            ALIQ_ICMS     := QRel.FieldByName('ALIQUOTA_ICMS').AsFloat;
            VL_OPR        := QRel.FieldByName('VALOR').AsFloat;
            VL_BC_ICMS    := QRel.FieldByName('BASE_ICMS_NORMAL').AsFloat;
            VL_ICMS       := QRel.FieldByName('VR_ICMS_NORMAL').AsFloat;
            VL_BC_ICMS_UF := QRel.FieldByName('BASE_ICMS_ST').AsFloat;
            VL_ICMS_UF    := QRel.FieldByName('VR_ICMS_ST').AsFloat;
            VL_RED_BC     := 0;
            COD_OBS       := '';
          end;
        end;

        Application.ProcessMessages;
        QRel.Next;
      end;
{
      with RegistroD600New do
      begin
        with RegistroD610New do
        begin

        end;

        with RegistroD690New do
        begin

        end;
      end;

      with RegistroD695New do
      begin
        with RegistroD696New do
        begin

        end;

        with RegistroD697New do
        begin

        end;
      end;
}
    end;
  end;

  ACBrSPEDFiscal1.WriteBloco_D;
end;

procedure TFrmSPED_Fiscal.Registros_Bloco_E;
var
Debito_ipi,Credito_ipi, Cred_ST :real;
begin
  with ACBrSpedFiscal1.Bloco_E do
  begin
    with RegistroE001New do
    begin
      IND_MOV := imComDados;

      with RegistroE100New do
      begin
        DT_INI := Dtmen.Date;
        DT_FIN := Dtmai.Date;

        with RegistroE110New do
        begin
          VL_TOT_DEBITOS            := Deb_ICMS;
          VL_AJ_DEBITOS             := 0;
          VL_TOT_AJ_DEBITOS         := 0;
          VL_ESTORNOS_CRED          := 0;
          VL_TOT_CREDITOS           := Cred_ICMS;
          VL_AJ_CREDITOS            := Aj_Cred;
          VL_TOT_AJ_CREDITOS        := 0;
          VL_ESTORNOS_DEB           := 0;
          VL_SLD_CREDOR_ANT         := 0;

          if Deb_ICMS > Cred_ICMS then
            VL_SLD_APURADO := Deb_ICMS - (Cred_ICMS + Aj_Cred)
          else
            VL_SLD_APURADO := 0;

          VL_TOT_DED := 0;

          if Deb_ICMS > Cred_ICMS then
            VL_ICMS_RECOLHER := Deb_ICMS - (Cred_ICMS + Aj_Cred)
          else
            VL_ICMS_RECOLHER := 0;

          VL_SLD_CREDOR_TRANSPORTAR := 0;

          if Cred_ICMS > Deb_ICMS then
            VL_SLD_CREDOR_TRANSPORTAR := Cred_ICMS + Aj_Cred - Deb_ICMS;

          DEB_ESP := 0;
{
          with RegistroE111New do
          begin
            // COD_AJ_APUR    :=
            // DESCR_COMPL_AJ :=
            // VL_AJ_APUR     :=

            with RegistroE112New do
            begin
              // NUM_DA    :=
              // NUM_PROC  :=
              // IND_PROC  :=
              // PROC      :=
              // TXT_COMPL :=
            end;

            with RegistroE113New do
            begin
              COD_PART   := '';
              COD_MOD    := '';
              SER        := '';
              SUB        := '';
              NUM_DOC    := '';
              // DT_DOC     :=
              CHV_NFE    := '';
              COD_ITEM   := '';
              VL_AJ_ITEM := 0;
            end;
          end;

          with RegistroE115New do
          begin
            // COD_INF_ADIC   :=
            // COD_INF_ADIC   :=
            // DESCR_COMPL_AJ :=
          end;
}
          with RegistroE116New do
          begin
            COD_OR    := '000';

            if Deb_ICMS > Cred_ICMS then
              VL_OR := Deb_ICMS - (Cred_ICMS + Aj_Cred)
            else
              VL_OR := 0;

            DT_VCTO   := (Dtmai.Date + 10);
            COD_REC   := '1206';
            NUM_PROC  := '';
            IND_PROC  := opNenhum;
            PROC      := '';
            TXT_COMPL := '';
            MES_REF   := Copy(Dtmai.Text, 4, 2) + Copy(Dtmai.Text, 7, 4);
          end;
        end;
      end;

      QDetalhe.Sql.Clear;
      {
      QDetalhe.Sql.Add('SELECT FORN.ESTADO, FORN.VALOR_ICMS_ST VALOR_ICMS_ST_ENTR, CLIE.ESTADO, CLIE.VALOR_ICMS_ST VALOR_ICMS_ST_SAI');
      QDetalhe.Sql.Add('FROM (select fornecedores.ESTADO, SUM(TRANSITENS.VALOR_ICMS_ST) VALOR_ICMS_ST from TRANSITENS');
      QDetalhe.Sql.Add('INNER JOIN TRANSACOES');
      QDetalhe.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
      QDetalhe.Sql.Add('INNER JOIN fornecedores');
      QDetalhe.Sql.Add('ON (TRANSACOES.fornecedor_id = fornecedores.fornecedor_id)');
      QDetalhe.Sql.Add('WHERE');
      QDetalhe.Sql.Add('(TRANSACOES.DT_SPED BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QDetalhe.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QDetalhe.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QDetalhe.Sql.Add('AND (((TRANSACOES.CONDUTA = :CD_CPR) AND (TRANSACOES.DEPTO = :DP_CPR)) OR ((TRANSACOES.CONDUTA = :CD_DEV_VDA) AND (TRANSACOES.DEPTO = :DP_DEV_VDA)))');
      QDetalhe.Sql.Add('AND ((TRANSACOES.MODELO = :MODELO1) OR (TRANSACOES.MODELO = :MODELO2) OR (TRANSACOES.MODELO = :MODELO3) OR (TRANSACOES.MODELO = :MODELO4))');
      QDetalhe.Sql.Add('AND ((TRANSITENS.CFOP LIKE :CFOP1) OR (TRANSITENS.CFOP LIKE :CFOP2))');
      //QDetalhe.Sql.Add('AND ((fornecedores.ESTADO = :MG) OR (fornecedores.ESTADO = :GO) OR (fornecedores.ESTADO = :SP) OR (fornecedores.ESTADO = :PR) OR (fornecedores.ESTADO = :SC)  OR (fornecedores.ESTADO = :RJ))');
      QDetalhe.SQL.Add('AND FORNECEDORES.ESTADO IN (SELECT UF FROM ESTADOS)');
      QDetalhe.Sql.Add('group by ESTADO');
      QDetalhe.Sql.Add(') as FORN,');
      QDetalhe.Sql.Add('(select clientes.ESTADO, SUM(TRANSITENS.VALOR_ICMS_ST) VALOR_ICMS_ST from TRANSITENS');
      QDetalhe.Sql.Add('INNER JOIN TRANSACOES');
      QDetalhe.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
      QDetalhe.Sql.Add('INNER JOIN clientes');
      QDetalhe.Sql.Add('ON (TRANSACOES.cliente_id = clientes.cliente_id)');
      QDetalhe.Sql.Add('WHERE');
      QDetalhe.Sql.Add('(TRANSACOES.DT_SPED BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QDetalhe.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QDetalhe.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QDetalhe.Sql.Add('AND (((TRANSACOES.CONDUTA = :CD_VDA) AND (TRANSACOES.DEPTO = :DP_VDA)) OR ((TRANSACOES.CONDUTA = :CD_DEV_CPR) AND (TRANSACOES.DEPTO = :DP_DEV_CPR)))');
      QDetalhe.Sql.Add('AND ((TRANSACOES.MODELO = :MODELO1) OR (TRANSACOES.MODELO = :MODELO2) OR (TRANSACOES.MODELO = :MODELO3) OR (TRANSACOES.MODELO = :MODELO4))');
      QDetalhe.Sql.Add('AND ((TRANSITENS.CFOP LIKE :CFOP3) OR (TRANSITENS.CFOP LIKE :CFOP4))');
      //QDetalhe.Sql.Add('AND ((clientes.ESTADO = :MG) OR (clientes.ESTADO = :GO) OR (clientes.ESTADO = :SP) OR (clientes.ESTADO = :PR) OR (clientes.ESTADO = :SC)  OR (clientes.ESTADO = :RJ))');
      QDetalhe.SQL.Add('AND CLIENTES.ESTADO IN (SELECT UF FROM ESTADOS)');
      QDetalhe.Sql.Add('group by ESTADO');
      QDetalhe.Sql.Add(') as CLIE where FORN.ESTADO = CLIE.ESTADO and (FORN.VALOR_ICMS_ST > 0 or CLIE.VALOR_ICMS_ST > 0)');
      QDetalhe.Sql.Add('ORDER BY FORN.ESTADO, CLIE.ESTADO');
      }

      QDetalhe.Sql.Add('SELECT FORN.ESTADO, FORN.VALOR_ICMS_ST VALOR_ICMS_ST_ENTR, CLIE.VALOR_ICMS_ST VALOR_ICMS_ST_SAI');
      QDetalhe.Sql.Add('FROM (select estados.uf estado, coalesce(valor_icms_st,0) valor_icms_st from estados left join');
      QDetalhe.Sql.Add('(select fornecedores.ESTADO, SUM(TRANSITENS.VALOR_ICMS_ST) VALOR_ICMS_ST from TRANSITENS');
      QDetalhe.Sql.Add('INNER JOIN TRANSACOES');
      QDetalhe.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
      QDetalhe.Sql.Add('left JOIN fornecedores');
      QDetalhe.Sql.Add('ON (TRANSACOES.fornecedor_id = fornecedores.fornecedor_id)');
      QDetalhe.Sql.Add('WHERE');
      QDetalhe.Sql.Add('(TRANSACOES.DT_SPED BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QDetalhe.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QDetalhe.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QDetalhe.Sql.Add('AND (((TRANSACOES.CONDUTA = :CD_CPR) AND (TRANSACOES.DEPTO = :DP_CPR)) OR ((TRANSACOES.CONDUTA = :CD_DEV_VDA) AND (TRANSACOES.DEPTO = :DP_DEV_VDA)))');
      QDetalhe.Sql.Add('AND ((TRANSACOES.MODELO = :MODELO1) OR (TRANSACOES.MODELO = :MODELO2) OR (TRANSACOES.MODELO = :MODELO3) OR (TRANSACOES.MODELO = :MODELO4))');
      QDetalhe.Sql.Add('AND ((TRANSITENS.CFOP LIKE :CFOP1) OR (TRANSITENS.CFOP LIKE :CFOP2))');
      QDetalhe.Sql.Add('AND FORNECEDORES.ESTADO IN (SELECT UF FROM ESTADOS)');
      QDetalhe.Sql.Add('group by ESTADO) as F');
      QDetalhe.Sql.Add('on estados.uf = f.estado order by estados.uf');
      QDetalhe.Sql.Add(') as FORN,');
      QDetalhe.Sql.Add('(select estados.uf estado, coalesce(valor_icms_st,0) valor_icms_st from estados left join');
      QDetalhe.Sql.Add('(select estados.uf, SUM(TRANSITENS.VALOR_ICMS_ST) VALOR_ICMS_ST from TRANSITENS');
      QDetalhe.Sql.Add('INNER JOIN TRANSACOES');
      QDetalhe.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
      QDetalhe.Sql.Add('left JOIN clientes');
      QDetalhe.Sql.Add('ON (TRANSACOES.cliente_id = clientes.cliente_id)');
      QDetalhe.Sql.Add('left JOIN fornecedores');
      QDetalhe.Sql.Add('ON (TRANSACOES.fornecedor_id = fornecedores.fornecedor_id)');
      QDetalhe.Sql.Add('left join estados');
      QDetalhe.Sql.Add('on ((ESTADOS.UF = fornecedores.ESTADO) or (estados.uf = clientes.estado))');
      QDetalhe.Sql.Add('WHERE');
      QDetalhe.Sql.Add('(TRANSACOES.DT_SPED BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QDetalhe.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
      QDetalhe.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
      QDetalhe.Sql.Add('AND (((TRANSACOES.CONDUTA = :CD_VDA) AND (TRANSACOES.DEPTO = :DP_VDA)) OR ((TRANSACOES.CONDUTA = :CD_DEV_CPR) AND (TRANSACOES.DEPTO = :DP_DEV_CPR)))');
      QDetalhe.Sql.Add('AND ((TRANSACOES.MODELO = :MODELO1) OR (TRANSACOES.MODELO = :MODELO2) OR (TRANSACOES.MODELO = :MODELO3) OR (TRANSACOES.MODELO = :MODELO4))');
      QDetalhe.Sql.Add('AND ((TRANSITENS.CFOP LIKE :CFOP3) OR (TRANSITENS.CFOP LIKE :CFOP4))');
      QDetalhe.Sql.Add('AND (CLIENTES.ESTADO IN (SELECT UF FROM ESTADOS) or fornecedores.estado in (select uf from estados))');
      QDetalhe.Sql.Add('AND TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS)');
      QDetalhe.Sql.Add('group by estados.uf) as C');
      QDetalhe.Sql.Add('on estados.uf = c.uf order by estados.uf');
      QDetalhe.Sql.Add(') as CLIE where FORN.ESTADO = CLIE.ESTADO and (FORN.VALOR_ICMS_ST > 0 or CLIE.VALOR_ICMS_ST > 0)');
      QDetalhe.Sql.Add('ORDER BY FORN.ESTADO');

      QDetalhe.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
      QDetalhe.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
      QDetalhe.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
      QDetalhe.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
      QDetalhe.ParamByName('CD_CPR').AsString       := '02';
      QDetalhe.ParamByName('DP_CPR').AsString       := '07';
      QDetalhe.ParamByName('CD_DEV_VDA').AsString   := '02';
      QDetalhe.ParamByName('DP_DEV_VDA').AsString   := '10';
      QDetalhe.ParamByName('CFOP1').AsString        := '1%';
      QDetalhe.ParamByName('CFOP2').AsString        := '2%';
      QDetalhe.ParamByName('MODELO1').AsString      := '01';
      QDetalhe.ParamByName('MODELO2').AsString      := '1B';
      QDetalhe.ParamByName('MODELO3').AsString      := '04';
      QDetalhe.ParamByName('MODELO4').AsString      := '55';
      QDetalhe.ParamByName('CD_VDA').AsString       := '01';
      QDetalhe.ParamByName('DP_VDA').AsString       := '07';
      QDetalhe.ParamByName('CD_DEV_CPR').AsString   := '01';
      QDetalhe.ParamByName('DP_DEV_CPR').AsString   := '10';
      QDetalhe.ParamByName('CFOP3').AsString        := '5%';
      QDetalhe.ParamByName('CFOP4').AsString        := '6%';

      QDetalhe.Prepare;
      QDetalhe.Open;

      while not QDetalhe.Eof do
      begin


        with RegistroE200New do
        begin
          UF     := QDetalhe.FieldByName('ESTADO').AsString;
          DT_INI := Dtmen.Date;
          DT_FIN := Dtmai.Date;

          with RegistroE210New do
          begin
            if FrmPrincipal.Config.FieldByName('SPED_ICMS_ST_IPI_MERC').AsString = 'True' then
              Cred_ST := 0
            else
              Cred_ST := QDetalhe.FieldByName('VALOR_ICMS_ST_ENTR').AsFloat;


            IND_MOV_ST                    := mstComOperacaoST;
            VL_SLD_CRED_ANT_ST            := 0;
            VL_DEVOL_ST                   := 0;
            VL_RESSARC_ST                 := 0;
            VL_OUT_CRED_ST                := Cred_ST;
            VL_AJ_CREDITOS_ST             := 0;
            VL_RETENCAO_ST                := QDetalhe.FieldByName('VALOR_ICMS_ST_SAI').AsFloat;
            VL_OUT_DEB_ST                 := 0;
            VL_AJ_DEBITOS_ST              := 0;
            if Cred_ST - QDetalhe.FieldByName('VALOR_ICMS_ST_SAI').AsFloat > 0 then
              VL_SLD_DEV_ANT_ST           := 0
            else
              VL_SLD_DEV_ANT_ST           := QDetalhe.FieldByName('VALOR_ICMS_ST_SAI').AsFloat - Cred_ST;
            VL_DEDUCOES_ST                := 0;
            if QDetalhe.FieldByName('VALOR_ICMS_ST_SAI').AsFloat - Cred_ST > 0 then
            begin
              VL_ICMS_RECOL_ST            := QDetalhe.FieldByName('VALOR_ICMS_ST_SAI').AsFloat - Cred_ST;
              VL_SLD_CRED_ST_TRANSPORTAR  := 0;
            end
            else
            if Cred_ST - QDetalhe.FieldByName('VALOR_ICMS_ST_SAI').AsFloat > 0 then
            begin
              VL_ICMS_RECOL_ST            := 0;
              VL_SLD_CRED_ST_TRANSPORTAR  := Cred_ST - QDetalhe.FieldByName('VALOR_ICMS_ST_SAI').AsFloat;
            end
            else
            begin
              VL_ICMS_RECOL_ST            := 0;
              VL_SLD_CRED_ST_TRANSPORTAR  := 0;
            end;
            DEB_ESP_ST                    := 0;
            {
            if (QDetalhe.FieldByName('VALOR_ICMS_ST_ENTR').AsFloat > 0) and (QDetalhe.FieldByName('ESTADO').AsString = 'MG') then
              with RegistroE220New do
              begin
                COD_AJ_APUR := 'MG129998';
                DESCR_COMPL_AJ := 'Apuração de ICMS-ST C190';
                VL_AJ_APUR := QDetalhe.FieldByName('VALOR_ICMS_ST_ENTR').AsFloat;

                with RegistroE230New do
                begin
                  // NUM_DA    :=
                  // NUM_PROC  :=
                  // IND_PROC  :=
                  // PROC      :=
                  // TXT_COMPL :=
                end;

                with RegistroE240New do
                begin
                  // COD_PART   :=
                  // COD_MOD    :=
                  // SER        :=
                  // SUB        :=
                  // NUM_DOC    :=
                  // DT_DOC     :=
                  // CHV_NFE    :=
                  // COD_ITEM   :=
                  // VL_AJ_ITEM :=
                end;

              end;
            }
            with RegistroE250New do
            begin

              if QDetalhe.FieldByName('ESTADO').AsString  = 'MG' Then
              COD_OR    := '002'
              Else
              COD_OR    := '999';

              if QDetalhe.FieldByName('VALOR_ICMS_ST_SAI').AsFloat - Cred_ST > 0 then
                VL_OR   := QDetalhe.FieldByName('VALOR_ICMS_ST_SAI').AsFloat - Cred_ST
              else
                VL_OR     := 0;
              DT_VCTO   := (Dtmai.Date + 10);

              if QDetalhe.FieldByName('ESTADO').AsString  = 'MG' Then
              COD_REC   := '3202'
              Else
              COD_REC   := '100048';

              NUM_PROC  := '';
              IND_PROC  := opNenhum;
              PROC      := '';
              TXT_COMPL := '';
              MES_REF   := Copy(Dtmai.Text, 4, 2) + Copy(Dtmai.Text, 7, 4);
            end;
          end;
        end;

        Application.ProcessMessages;
        QDetalhe.Next;
      end;

      if FrmPrincipal.QEmpresa.FieldByName('TIPO_ATIVIDADE').AsString = '0 - INDUSTRIAL OU EQUIPARADO' Then
      Begin

      QDetalhe.Sql.Clear;
      QDetalhe.Sql.Add('SELECT (case when SUM(TRANSITENS.VR_IPI) > 0 then TRANSITENS.CST_IPI else (case when TRANSITENS.CFOP::INTEGER < 4000 then ''02'' else ''52'' end) end) CST_IPI, ' +
                       'TRANSITENS.CFOP, (CASE WHEN SUM(TRANSITENS.VR_IPI) > 0 THEN SUM(TRANSITENS.VR_TOTAL + TRANSITENS.VALOR_ICMS_ST + TRANSITENS.VR_FRETE + TRANSITENS.VR_ACRESCIMO + TRANSITENS.VR_IPI - DESC_RODAPE) ELSE 0 END) BASE_CALC_IPI , ' +
                       'SUM(TRANSITENS.VR_IPI) VR_IPI, SUM(TRANSITENS.VR_TOTAL + TRANSITENS.VALOR_ICMS_ST + TRANSITENS.VR_FRETE + TRANSITENS.VR_ACRESCIMO + TRANSITENS.VR_IPI - TRANSITENS.DESC_RODAPE) VR_CONTABIL ' +
                          'FROM TRANSITENS ' +
                          'INNER JOIN TRANSACOES ON TRANSACOES.TRANSACAO_ID = TRANSITENS.TRANSACAO_ID ' +
                          'WHERE ' +
                          'TRANSACOES.DT_SPED BETWEEN :DT_INICIAL AND :DT_FINAL ' +
                          'AND TRANSACOES.EMPRESA_ID = :EMPRESA_ID ' +
                          'AND TRANSACOES.TPCTB = :TPCTB ' +
                          'AND TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS) ' +
                          'AND LENGTH(TRANSITENS.CFOP) = 4 ' +
                          'GROUP BY TRANSITENS.CFOP,TRANSITENS.CST_IPI ' +
                          'ORDER BY TRANSITENS.CFOP ');

      QDetalhe.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
      QDetalhe.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
      QDetalhe.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
      QDetalhe.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
      QDetalhe.Prepare;
      QDetalhe.open;

       if not QDetalhe.isempty Then
       Begin

        Credito_ipi := 0;
        Debito_Ipi  := 0;

        with RegistroE500New do
        begin
        IND_APUR :=  iaMensal;
        DT_INI   :=  Dtmen.Date;
        DT_FIN   :=  Dtmai.Date;
        end;


        QDetalhe.First;

        While not QDetalhe.Eof do
        Begin

          with RegistroE510New do
          begin
             CFOP        := QDetalhe.FieldByName('CFOP').AsString;
             CST_IPI     := QDetalhe.FieldByName('CST_IPI').AsString;
             VL_CONT_IPI := QDetalhe.FieldByName('VR_CONTABIL').AsFloat;
             VL_BC_IPI   := QDetalhe.FieldByName('BASE_CALC_IPI').AsFloat;
             VL_IPI      := QDetalhe.FieldByName('VR_IPI').AsFloat;
          end;

          if QDetalhe.FieldByName('CST_IPI').AsString <= '49' Then
          Credito_ipi := Credito_ipi + QDetalhe.FieldByName('VR_IPI').AsFloat
          Else
          Debito_ipi  := Debito_ipi +  QDetalhe.FieldByName('VR_IPI').AsFloat;

          QDetalhe.Next;
        End;

        with RegistroE520New do
        begin

          VL_SD_ANT_IPI := 0;
          VL_DEB_IPI    := Debito_ipi ;
          VL_CRED_IPI   := Credito_ipi;
          VL_OD_IPI     := 0;
          VL_OC_IPI     := 0;

          if Debito_ipi > Credito_ipi Then
          Begin
           VL_SC_IPI     := 0;
           VL_SD_IPI     := Debito_ipi - Credito_ipi
          End
          Else
          Begin
           VL_SC_IPI     :=  Credito_ipi - Debito_ipi;
           VL_SD_IPI     :=  0;
          End;

          //with RegistroE530New do
          //begin
            // IND_AJ   :=
            // VL_AJ    :=
            // COD_AJ   :=
            // IND_DOC  :=
            // NUM_DOC  :=
            // DESCR_AJ :=
          //end;
        end;
       End;
      End;

     {
           with RegistroE500New do
      begin
        // IND_APUR :=
        // DT_INI   :=
        // DT_FIN   :=

        with RegistroE510New do
        begin
          // CFOP        :=
          // CST_IPI     :=
          // VL_CONT_IPI :=
          // VL_BC_IPI   :=
          // VL_IPI      :=
        end;


      end;
}
    end;
  end;

  ACBrSPEDFiscal1.WriteBloco_E;
end;

procedure TFrmSPED_Fiscal.Registros_Bloco_H;
var
Vl_Inventario,Custo: Real;
begin
  QRel.Sql.Clear;
  QRel.Sql.Add('SELECT * FROM PRODUTOS');
  QRel.Sql.Add('WHERE');
  QRel.Sql.Add('(EMPRESA_ID = :EMPRESA_ID)');

  IF NOT CHK_TODOS.Checked Then
  Begin
    QRel.Sql.Add('AND ((PRODUTOS.TIPO_ITEM = :TIPO_ITEM)');
    QRel.Sql.Add('OR (PRODUTOS.TIPO_ITEM = :TIPO_ITEM1)');
    QRel.Sql.Add('OR (PRODUTOS.TIPO_ITEM = :TIPO_ITEM4))');
    QRel.ParamByName('TIPO_ITEM').AsString      := '00 - MERCADORIA PARA REVENDA';
    QRel.ParamByName('TIPO_ITEM1').AsString     := '01 - MATERIA PRIMA';
    QRel.ParamByName('TIPO_ITEM4').AsString     := '04 - PRODUTO ACABADO';
  End;

  QRel.Sql.Add('ORDER BY PRODUTOS.PRODUTO_ID');

  QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;


  QRel.Prepare;
  QRel.Open;

  with ACBrSpedFiscal1.Bloco_H do
  begin
    with RegistroH001New do
    begin
     if Forcar_Reg_H.Checked then
     Begin
      if not QRel.IsEmpty then
        IND_MOV := imComDados // 0
      else
        IND_MOV := imSemDados; // 1

      Vl_Inventario := 0;
      Custo         := 0;

      QRel.First;
      while not QRel.Eof do
      begin

        QItens.Sql.Clear;
        QItens.Sql.Add('SELECT * FROM POSICAO_PRODUTOS');
        QItens.Sql.Add('INNER JOIN PRODUTOS ON PRODUTOS.PRODUTO_ID = POSICAO_PRODUTOS.PRODUTO_ID');
        QItens.Sql.Add('WHERE');
        QItens.Sql.Add('(POSICAO_PRODUTOS.PRODUTO_ID = :PRODUTO_ID)');
        QItens.Sql.Add('AND (POSICAO_PRODUTOS.DT_MOVIMENTO = :DT_MOVIMENTO)');

        IF NOT CHK_TODOS.Checked Then
        Begin
          QItens.Sql.Add('AND ((PRODUTOS.TIPO_ITEM = :TIPO_ITEM)');
          QItens.Sql.Add('OR (PRODUTOS.TIPO_ITEM = :TIPO_ITEM1)');
          QItens.Sql.Add('OR (PRODUTOS.TIPO_ITEM = :TIPO_ITEM4))');
          QItens.ParamByName('TIPO_ITEM').AsString      := '00 - MERCADORIA PARA REVENDA';
          QItens.ParamByName('TIPO_ITEM1').AsString     := '01 - MATERIA PRIMA';
          QItens.ParamByName('TIPO_ITEM4').AsString     := '04 - PRODUTO ACABADO';
        End;



        QItens.ParamByName('PRODUTO_ID').AsInteger    := QRel.FieldByName('PRODUTO_ID').AsInteger;
        QItens.ParamByName('DT_MOVIMENTO').AsDateTime := StrTodate(data.Text);


        QItens.Prepare;
        QItens.Open;


        if PRECO.Text = 'Valor Compra'  then
        Custo  := QItens.FieldByName('VALOR_COMPRA').AsFloat
        else if PRECO.Text = 'Custo Compra' then
        Custo  := QItens.FieldByName('CUSTO_COMPRA').AsFloat
        ELSE if PRECO.Text = 'Customédio' then
        Custo  := QItens.FieldByName('CUSTOMEDIO').AsFloat;

        if (QItens.FieldByName('QUANTIDADE_C').AsFloat > 0) then
          Vl_Inventario := Vl_Inventario + (QItens.FieldByName('QUANTIDADE_C').AsFloat * Custo);

        Label6.Caption := 'Inserindo Produtos Inventário' ;
        Label3.Caption := StrZero(QRel.FieldByName('PRODUTO_ID').AsString, 6, 0) + ' R$ ' +FloatToIntStr(custo);

        Application.ProcessMessages;
        QRel.Next;
      end;

      with RegistroH005New do
      begin
        if (Copy(DateToStr(Dtmen.Date),4,2) = '02') then
          DT_INV := StrToDate('31/12/' + IntToStr(StrToInt(Copy(DateToStr(Dtmen.Date), 7, 4))-1))
        else
          DT_INV := StrTodate(data.Text);
        VL_INV := Vl_Inventario;
        MOT_INV := StrToMotInv(Copy(Motivo.Text,1,2));

        QRel.First;

        while not QRel.Eof do
        begin
          QItens.Sql.Clear;
          QItens.Sql.Add('SELECT * FROM POSICAO_PRODUTOS');
          QItens.Sql.Add('WHERE');
          QItens.Sql.Add('(PRODUTO_ID = :PRODUTO_ID)');
          QItens.Sql.Add('AND (DT_MOVIMENTO = :DT_MOVIMENTO)');

          QItens.ParamByName('PRODUTO_ID').AsInteger    := QRel.FieldByName('PRODUTO_ID').AsInteger;
          QItens.ParamByName('DT_MOVIMENTO').AsDateTime := StrTodate(data.Text);

          QItens.Prepare;
          QItens.Open;

          
          if PRECO.Text = 'Valor Compra'  then
          Custo  := QItens.FieldByName('VALOR_COMPRA').AsFloat
          else if PRECO.Text = 'Custo Compra' then
          Custo  := QItens.FieldByName('CUSTO_COMPRA').AsFloat
          ELSE if PRECO.Text = 'Customédio' then
          Custo  := QItens.FieldByName('CUSTOMEDIO').AsFloat;


          if (QItens.FieldByName('QUANTIDADE_C').AsFloat > 0)  then
          begin
            with RegistroH010New do
            begin
              COD_ITEM  := StrZero(QItens.FieldByName('PRODUTO_ID').AsString, 6, 0);
              UNID      := Alltrim(QRel.FieldByName('UNIDADE_VENDA').AsString);
              QTD       := QItens.FieldByName('QUANTIDADE_C').AsFloat;
              VL_UNIT   := Custo;
              VL_ITEM   := (QItens.FieldByName('QUANTIDADE_C').AsFloat * Custo);
              IND_PROP  := piInformante;
              COD_PART  := '';
              TXT_COMPL := '';
              COD_CTA   := StrZero(FrmPrincipal.Config.FieldByName('COD_CTA').AsString, 6, 0);

              if Pos(Copy(Motivo.Text,1,2), '02|03|04|05') > 0 then
              begin
                with RegistroH020New do
                begin
                  IQuery.SQL.Clear;
                  IQuery.SQL.Add('SELECT substring(tributos.origem from 1 for 1) || substring(tributos.tributacao from 1 for 2) as CST, CSOSN, ALIQUOTA_ICMS');
                  IQuery.SQL.Add('FROM TRIBUTOS');
                  IQuery.SQL.Add('WHERE TRIBUTO_ID = :TRIBUTO_ID');
                  IQuery.ParamByName('TRIBUTO_ID').AsInteger := QRel.FieldByName('TRIBUTO_ID').AsInteger;
                  IQuery.Prepare;
                  IQuery.Open;

                  if FrmPrincipal.QEmpresa.FieldByName('CRT').AsString <> '1 - SIMPLES NACIONAL' then
                    CST_ICMS := IQuery.FieldByName('CST').AsString
                  else
                    CST_ICMS := IQuery.FieldByName('CSOSN').AsString;
                  if IQuery.FieldByName('ALIQUOTA_ICMS').AsFloat = 0 then
                  begin
                    BC_ICMS  := 0;
                    VL_ICMS  := 0;
                  end
                  else
                  begin
                    BC_ICMS  := VL_ITEM;
                    VL_ICMS  := VL_ITEM * IQuery.FieldByName('ALIQUOTA_ICMS').AsFloat / 100;
                  end;

                end;
              end;
            end;
          end;
          Label6.Caption := 'Inserindo Produto Inventário';
          Label3.Caption := StrZero(QItens.FieldByName('PRODUTO_ID').AsString, 6, 0);

          Application.ProcessMessages;
          QRel.Next;
        end;
      end;
     End
     Else
     IND_MOV := imSemDados; // 1
    end;
  end;
  ACBrSPEDFiscal1.WriteBloco_H;
end;

procedure TFrmSPED_Fiscal.Registros_Bloco_k;
begin

  QRel.Sql.Clear;
  QRel.Sql.Add('SELECT * FROM TRANSACOES');
  QRel.Sql.Add('WHERE');
  QRel.Sql.Add('DT_SPED BETWEEN :DT_INICIAL AND :DT_FINAL');
  QRel.Sql.Add('AND ((CONDUTA = :CONDUTA) OR (CONDUTA = :CONDUTA01)) AND (DEPTO = :DEPTO)');
  QRel.Sql.Add('AND (EMPRESA_ID = :EMPRESA_ID)');
  QRel.Sql.Add('ORDER BY DT_SPED');

  QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  QRel.ParamByName('CONDUTA').AsString      := '19';
  QRel.ParamByName('CONDUTA01').AsString    := '21';
  QRel.ParamByName('DEPTO').AsString        := '07';
  QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
  QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;

  QRel.Prepare;
  QRel.Open;


  with ACBrSpedFiscal1.Bloco_k do
  begin
    with Registrok001New do
    begin
     if not QRel.IsEmpty then
        IND_MOV := imComDados // 0
     else
        IND_MOV := imComDados;//imSemDados; // 1

     with  RegistroK100New do
     begin
      DT_INI :=  Dtmen.Date;
      DT_FIN :=  Dtmai.Date;


        QDetalhe.Sql.Clear;
        QDetalhe.Sql.Add('SELECT * FROM POSICAO_PRODUTOS ');
        QDetalhe.Sql.Add('INNER JOIN PRODUTOS ON PRODUTOS.PRODUTO_ID = POSICAO_PRODUTOS.PRODUTO_ID');
        QDetalhe.Sql.Add('WHERE');
        QDetalhe.Sql.Add('(POSICAO_PRODUTOS.DT_MOVIMENTO = :DT_MOVIMENTO)');
        QDetalhe.Sql.Add('AND (POSICAO_PRODUTOS.QUANTIDADE_C > 0)');
        QDetalhe.Sql.Add('AND ((PRODUTOS.TIPO_ITEM = :TIPO_ITEM)');
        QDetalhe.Sql.Add('OR (PRODUTOS.TIPO_ITEM = :TIPO_ITEM1)');
        QDetalhe.Sql.Add('OR (PRODUTOS.TIPO_ITEM = :TIPO_ITEM2)');
        QDetalhe.Sql.Add('OR (PRODUTOS.TIPO_ITEM = :TIPO_ITEM3)');
        QDetalhe.Sql.Add('OR (PRODUTOS.TIPO_ITEM = :TIPO_ITEM4)');
        QDetalhe.Sql.Add('OR (PRODUTOS.TIPO_ITEM = :TIPO_ITEM5)');
        QDetalhe.Sql.Add('OR (PRODUTOS.TIPO_ITEM = :TIPO_ITEM6)');
        QDetalhe.Sql.Add('OR (PRODUTOS.TIPO_ITEM = :TIPO_ITEM7))');



        if Data.Text = 'Hoje' then
        QDetalhe.ParamByName('DT_MOVIMENTO').AsDateTime := Date
        Else
        QDetalhe.ParamByName('DT_MOVIMENTO').AsDateTime := StrTodate(Dt_Blocok.Text);

        QDetalhe.ParamByName('TIPO_ITEM').AsString      := '00 - MERCADORIA PARA REVENDA';
        QDetalhe.ParamByName('TIPO_ITEM1').AsString     := '01 - MATERIA PRIMA';
        QDetalhe.ParamByName('TIPO_ITEM2').AsString     := '02 - EMBALAGEM';
        QDetalhe.ParamByName('TIPO_ITEM3').AsString     := '03 - PRODUTO EM PROCESSO';
        QDetalhe.ParamByName('TIPO_ITEM4').AsString     := '04 - PRODUTO ACABADO';
        QDetalhe.ParamByName('TIPO_ITEM5').AsString     := '05 - SUBPRODUTO';
        QDetalhe.ParamByName('TIPO_ITEM6').AsString     := '06 - PRODUTO INTERMEDIARIO';
        QDetalhe.ParamByName('TIPO_ITEM7').AsString     := '10 - OUTROS INSUMOS';


        QDetalhe.Prepare;
        QDetalhe.Open;
        QDetalhe.First;

        while not QDetalhe.Eof do
        begin
         with RegistroK200New do
         begin
         DT_EST   := Dtmai.Date;
         COD_ITEM := StrZero(QDetalhe.FieldByName('PRODUTO_ID').AsString, 6, 0);
         QTD      := QDetalhe.FieldByName('QUANTIDADE_C').AsFloat;
         IND_EST  := estPropInformantePoder;
         //COD_PART
         end;

         QDetalhe.Next;
        end;



        {QRel.Sql.Clear;
        QRel.Sql.Add('SELECT DISTINCT TRANSITENS.PRODUTO_ID, QUANTIDADE_C,CONDUTA,TRANSITENS.TRANSACAO_ID,TRANSACOES.NUM_DOC ');
        QRel.Sql.Add('FROM TRANSITENS');
        QRel.Sql.Add('INNER JOIN TRANSACOES ON TRANSITENS.BANCO_ID = TRANSACOES.TRANSACAO_ID');
        QRel.Sql.Add('INNER JOIN PRODUTOS ON TRANSITENS.PRODUTO_ID = PRODUTOS.PRODUTO_ID');
        QRel.Sql.Add('WHERE');
        QRel.Sql.Add('DT_SPED BETWEEN :DT_INICIAL AND :DT_FINAL');
        QRel.Sql.Add('AND (CONDUTA = :CONDUTA OR CONDUTA = :CONDUTA01 ) AND (DEPTO = :DEPTO)');
        QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID) AND (PRODUTOS.QUANTIDADE_C > 0)');

        QRel.Sql.Add('ORDER BY TRANSITENS.PRODUTO_ID');

        QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
        QRel.ParamByName('CONDUTA').AsString      := '21';
        QRel.ParamByName('CONDUTA01').AsString    := '19';
        QRel.ParamByName('DEPTO').AsString        := '07';
        QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
        QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;

        QRel.Prepare;
        QRel.Open();
        }


        QRel.First;
        while not QRel.Eof do
        Begin

          IF QRel.FieldByName('CONDUTA').AsString = '21' then
          Begin
            //SHOWMESSAGE('GERANDO REGISTORS 21');

            QItens.Sql.Clear;
            QItens.Sql.Add('SELECT TRANSITENS.TRANSACAO_ID, DT_SPED, NUM_DOC, PRODUTO_ID,TRANSITENS.QUANTIDADE');
            QItens.Sql.Add('FROM TRANSITENS');
            QItens.Sql.Add('INNER JOIN TRANSACOES ON TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID');
            QItens.Sql.Add('WHERE');
            QItens.Sql.Add('(TRANSITENS.TRANSACAO_ID = :TRANSACAO_ID)');

            QItens.ParamByName('TRANSACAO_ID').AsInteger := QRel.FieldByName('TRANSACAO_ID').AsInteger;

            QItens.Prepare;
            QItens.Open();
            QItens.First;

            while not QItens.Eof do
            Begin

              with RegistroK210.New do
              begin

               DT_INI_OS    := QItens.FieldByName('DT_SPED').AsDateTime ;
               DT_FIN_OS    := QItens.FieldByName('DT_SPED').AsDateTime;
               COD_DOC_OS   := QItens.FieldByName('NUM_DOC').AsString;
               COD_ITEM_ORI := StrZero(QItens.FieldByName('PRODUTO_ID').AsString, 6, 0);
               QTD_ORI      := QItens.FieldByName('QUANTIDADE').AsFloat;
              end;

             QItens.Next;

            End;

              QDetalhe.SQL.Clear;
              QDetalhe.SQL.Add('SELECT PRODUTO_ID,QUANTIDADE FROM TRANSITENS');
              QDetalhe.SQL.Add('WHERE BANCO_ID = :TRANSACAO_ID');
              QDetalhe.ParamByName('TRANSACAO_ID').AsInteger := QRel.FieldByName('TRANSACAO_ID').AsInteger;
              QDetalhe.Prepare;
              QDetalhe.Open();

              QDetalhe.First;

            while not QDetalhe.Eof do
            Begin
              with RegistroK215New do
              begin
               COD_ITEM_DES := StrZero(QDetalhe.FieldByName('PRODUTO_ID').AsString, 6, 0);
               QTD_DES      := QDetalhe.FieldByName('QUANTIDADE').AsFloat;
              end;
             QDetalhe.Next;
            End;

          End;
          IF (QRel.FieldByName('CONDUTA').AsString = '19')  then
          begin

            QItens.Sql.Clear;
            QItens.Sql.Add('SELECT TRANSITENS.TRANSACAO_ID,DT_SPED, NUM_DOC, PRODUTO_ID,TRANSITENS.QUANTIDADE');
            QItens.Sql.Add('FROM TRANSITENS');
            QItens.Sql.Add('INNER JOIN TRANSACOES ON TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID');
            QItens.Sql.Add('WHERE');
            QItens.Sql.Add('(TRANSITENS.TRANSACAO_ID = :TRANSACAO_ID)');

            QItens.ParamByName('TRANSACAO_ID').AsInteger := QRel.FieldByName('TRANSACAO_ID').AsInteger;

            QItens.Prepare;
            QItens.Open();
            QItens.First;

            while not QItens.Eof do
            Begin
                with RegistroK230New do
                begin
                 DT_INI_OP   := Dtmen.Date;
                 DT_FIN_OP   := Dtmai.Date;
                 COD_DOC_OP  := QRel.FieldByName('NUM_DOC').AsString;
                 COD_ITEM    := StrZero(QItens.FieldByName('PRODUTO_ID').AsString, 6, 0);
                 QTD_ENC     := QItens.FieldByName('QUANTIDADE').AsFloat;
                end;

                QDetalhe.Sql.Clear;
                QDetalhe.Sql.Add('SELECT DT_SPED, NUM_DOC, PRODUTO_ID,TRANSITENS.QUANTIDADE');
                QDetalhe.Sql.Add('FROM TRANSITENS');
                QDetalhe.Sql.Add('INNER JOIN TRANSACOES ON TRANSITENS.BANCO_ID = TRANSACOES.TRANSACAO_ID');
                QDetalhe.Sql.Add('WHERE');
                QDetalhe.Sql.Add('(TRANSITENS.BANCO_ID = :TRANSACAO_ID)');

                QDetalhe.ParamByName('TRANSACAO_ID').AsInteger := QItens.FieldByName('TRANSACAO_ID').AsInteger;

                QDetalhe.Prepare;
                QDetalhe.Open();
                QDetalhe.First;


                while not QDetalhe.Eof do
                Begin
                  with RegistroK235New do
                  begin

                   DT_SAIDA := QRel.FieldByName('DT_SPED').AsDateTime;
                   COD_ITEM := StrZero(QDetalhe.FieldByName('PRODUTO_ID').AsString, 6, 0);
                   QTD      := QDetalhe.FieldByName('QUANTIDADE').AsFloat;
                  end;
                  QDetalhe.Next;
                End;
                 QItens.Next;
            End;


          end;

         QRel.Next;

         Label3.Caption := 'Gerando Controle da Produção' ;
         Label6.Caption := 'Produto: '  + QItens.FieldByName('PRODUTO_ID').AsString;
        End;
     end;
    end;
  end;

ACBrSPEDFiscal1.WriteBloco_k;
end;

procedure TFrmSPED_Fiscal.VersaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmSPED_Fiscal.Registros_Bloco_1;
begin
  with ACBrSpedFiscal1.Bloco_1 do
  begin
    DT_INI := Dtmen.Date;
    DT_FIN := Dtmai.Date;

   if  FrmPrincipal.Config.FieldByName('GERAR_BLOCO1400').AsString = 'True' then
   Begin

    QRelVa.SQL.Clear;
    QRelVa.Sql.Add('SELECT SUM(VALOR) VALOR,FORNECEDORES.IBGE,FORNECEDORES.PRODUTOR_R,MODELO FROM TRANSACOES ');
    QRelVa.Sql.Add('INNER JOIN FORNECEDORES ON FORNECEDORES.FORNECEDOR_ID = TRANSACOES.FORNECEDOR_ID ');
    QRelVa.Sql.Add('WHERE ((FORNECEDORES.PRODUTOR_R = 1) OR (TRANSACOES.MODELO = :MODELO01) OR (TRANSACOES.MODELO = :MODELO02))  ');
    QRelVa.Sql.Add('AND (DT_SPED BETWEEN :DT_INICIAL AND :DT_FINAL) AND (FORNECEDORES.ESTADO = :ESTADO)');
    QRelVa.Sql.Add('GROUP BY IBGE,PRODUTOR_R,MODELO');

    QRelVa.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
    QRelVa.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
    QRelVa.ParamByName('MODELO01').AsString     := '57';
    QRelVa.ParamByName('MODELO02').AsString     := '06';
    QRelVa.ParamByName('ESTADO').AsString       := FrmPrincipal.QEmpresa.FieldByName('ESTADO').AsString;



    QRelVa.Prepare;
    QRelVa.Open;

   End;
    {
    QRel.SQL.Clear;
    QRel.Sql.Add('SELECT CLIENTE_ID , NOME, SUM(DEBITO) DEBITO ,SUM(CREDITO) CREDITO ');
    QRel.Sql.Add('FROM(');
    QRel.Sql.Add('SELECT FINALIZADORAS.CLIENTE_ID,   CLIENTES.NOME, VALOR CREDITO , 0 DEBITO FROM TRANSACOES');
    QRel.Sql.Add('INNER JOIN FINALIZADORAS ON FINALIZADORAS.FINALIZADORA_ID = TRANSACOES.FINALIZADORA_ID ');
    QRel.Sql.Add('INNER JOIN CLIENTES ON FINALIZADORAS.CLIENTE_ID = CLIENTES.CLIENTE_ID ');
    QRel.Sql.Add('WHERE FINALIZADORAS.DESCRICAO LIKE :CARTAO  AND ');
    QRel.Sql.Add('FINALIZADORAS.C_CREDITO = :C_CREDITO AND ');
    QRel.Sql.Add('DT_SPED BETWEEN :DT_INICIAL AND :DT_FINAL ');
    QRel.Sql.Add('UNION ALL ');
    QRel.Sql.Add('SELECT FINALIZADORAS.CLIENTE_ID,  CLIENTES.NOME, 0 CREDITO , VALOR DEBITO FROM TRANSACOES ');
    QRel.Sql.Add('INNER JOIN FINALIZADORAS ON FINALIZADORAS.FINALIZADORA_ID = TRANSACOES.FINALIZADORA_ID ');
    QRel.Sql.Add('INNER JOIN CLIENTES ON FINALIZADORAS.CLIENTE_ID = CLIENTES.CLIENTE_ID ');
    QRel.Sql.Add('WHERE (FINALIZADORAS.DESCRICAO LIKE :CARTAO ) OR (FINALIZADORAS.DESCRICAO LIKE :PIX)  AND ');
    QRel.Sql.Add('FINALIZADORAS.C_DEBITO = :C_DEBITO AND ');
    QRel.Sql.Add('DT_SPED BETWEEN :DT_INICIAL AND :DT_FINAL');
    QRel.Sql.Add(') AS TESTE');
    QRel.Sql.Add('GROUP BY CLIENTE_ID,  NOME');

    QRel.ParamByName('CARTAO').AsString       := 'CART' + '%';
    QRel.ParamByName('PIX').AsString          := 'PIX' + '%';
    QRel.ParamByName('C_CREDITO').AsString    := 'True';
    QRel.ParamByName('C_DEBITO').AsString     := 'True';
    QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
    }


    QRel.SQL.Clear;
    QRel.Sql.Add('SELECT CLIENTE_ID , NOME, SUM(VALOR) VALOR ');
    QRel.Sql.Add('FROM(');
    QRel.Sql.Add('SELECT FINALIZADORAS.CLIENTE_ID,CLIENTES.NOME,TRANSACOES.VALOR FROM TRANSACOES');
    QRel.Sql.Add('INNER JOIN FINALIZADORAS ON FINALIZADORAS.FINALIZADORA_ID = TRANSACOES.FINALIZADORA_ID');
    QRel.Sql.Add('INNER JOIN CLIENTES ON FINALIZADORAS.CLIENTE_ID = CLIENTES.CLIENTE_ID');
    QRel.Sql.Add('WHERE TRANSACOES.FINALIZADORA_ID IN (SELECT FINALIZADORA_ID FROM FINALIZADORAS WHERE');
    QRel.Sql.Add('(FINALIZADORAS.DESCRICAO ILIKE :CARTAO) OR (FINALIZADORAS.DESCRICAO ILIKE :PIX) )');
    QRel.Sql.Add('AND DT_SPED BETWEEN :DT_INICIAL AND :DT_FINAL');
    QRel.Sql.Add(') AS TESTE');
    QRel.Sql.Add('GROUP BY CLIENTE_ID, NOME');


    QRel.ParamByName('CARTAO').AsString       := 'CART' + '%';
    QRel.ParamByName('PIX').AsString          := 'PIX' + '%';
    QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;


    QRel.Prepare;
    QRel.Open;

    with Registro1001New do
    begin
      //TODO SPED GERADO COM |1001|1| DA ERRO PEDINDO REGISTRO 1010
      //COLOCANDO O REGISTRO NO VALIDADOR DO SPED, AO EXPORTAR O REGISTRO FICA |1001|0|
      //PORTANTO MODIFIQUEI PRA SEMPRE GRAVAR |1001|0| E COM ISSO GRAVA O REGISTRO 1010 SEM ERROS

      //if (not QRel.IsEmpty) OR (not QRelVa.IsEmpty) then
      IND_MOV := imComDados;
      //Else
      //IND_MOV := imSemDados;

    with Registro1010New do
      begin
        IND_EXP   := 'N';
        IND_CCRF  := 'N';
        IND_COMB  := 'N';
        IND_USINA := 'N';

        if  (not QRelVA.IsEmpty) then
        IND_VA    := 'S'
        Else
        IND_VA    := 'N';

        IND_EE    := 'N';

        if not QRel.IsEmpty then
        IND_CART  := 'S'
        Else
        IND_CART  := 'N';

        IND_FORM  := 'N';
        IND_AER   := 'N';
        IND_GIAF1 := 'N';
        IND_GIAF3 := 'N';
        IND_GIAF4 := 'N';
        IND_REST_RESSARC_COMPL_ICMS  := 'N';

      end;



      {with Registro1100New do
      begin

      end;

      with Registro1200New do
      begin

      end;

      with Registro1300New do
      begin

      end;


      with Registro1400New do
      begin

      end;

      with Registro1500New do
      begin

      end; }

      IF (not QRelVA.IsEmpty) then
      Begin
        QRelVa.First;
        while not QRelVa.Eof do
        begin
          with Registro1400New do
          begin
           if QRelVa.FieldByName('PRODUTOR_R').AsInteger = 1 then
           COD_ITEM := 'Produtos_Agropecuarios'
           Else if QRelVa.FieldByName('MODELO').AsString = '57' then
           COD_ITEM := 'Prestacao_de_Servico_de_Transporte_Rodoviario'
           Else if QRelVa.FieldByName('MODELO').AsString = '06' then
           COD_ITEM := 'Geracao_de_Energia_Eletrica';
           MUN      := QRelVa.FieldByName('IBGE').AsString;
           VALOR    := QRelVa.FieldByName('VALOR').AsFloat;
          end;
         QRelVa.Next;
        end;
      End;

      IF  (not QRel.IsEmpty) then
      Begin
        QRel.First;
        while not QRel.Eof do
        begin
          with Registro1601New do
          begin
          COD_PART_IP    := 'C' + StrZero(QRel.FieldByName('CLIENTE_ID').AsString, 6, 0);
          COD_PART_IT    := '';
          TOT_VS         := QRel.FieldByName('VALOR').AsFloat;
          TOT_ISS        := 0;
          TOT_OUTROS     := 0;
          end;
        QRel.Next;
        end;
      End;

     // Descontinuado para ano de 2022
     {
      IF  (not QRel.IsEmpty) then
      Begin
        QRel.First;
        while not QRel.Eof do
        begin
          with Registro1600New do
          begin
          COD_PART    := 'C' + StrZero(QRel.FieldByName('CLIENTE_ID').AsString, 6, 0);
          TOT_CREDITO := QRel.FieldByName('CREDITO').AsFloat;
          TOT_DEBITO  := QRel.FieldByName('DEBITO').AsFloat;
          end;
        QRel.Next;
        end;
      End;

      with Registro1700New do
      begin

      end;

      with Registro1800New do
      begin

      end;
}

    end;

  end;

  ACBrSPEDFiscal1.WriteBloco_1;
end;

procedure TFrmSPED_Fiscal.Registros_Bloco_9;
begin
  ACBrSPEDFiscal1.WriteBloco_9;
end;

procedure TFrmSPED_Fiscal.btnExecutaClick(Sender: TObject);
begin
  try
    if (Data.Visible = True) and (Data.Text = '') then
    begin

     Application.MessageBox(PChar('Favor informar uma data para inicio do processo.'), PChar(Msg_Title), mb_IconInformation);
     Data.SetFocus;
     exit;

    end;


    if (FrmPrincipal.Config.FieldByName('GERAR_BLOCOK').AsString = 'True') and (Dt_Blocok.Text = '') then
    begin
     Application.MessageBox(PChar('Favor informar uma data BLOCO K  para inicio do processo.'), PChar(Msg_Title), mb_IconInformation);
     Dt_Blocok.SetFocus;
     exit;
    end;

    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    Deb_ICMS   := 0;
    Cred_ICMS  := 0;
    Vr_ICMS_ST := 0;
    Aj_Cred    := 0;

    QItens.Sql.Clear;
    QItens.Sql.Add('ALTER TABLE CLIENTES DISABLE TRIGGER CLIENTES_UP');

    QItens.Prepare;
    QItens.ExecSql;


    QItens.Sql.Clear;
    QItens.Sql.Add('UPDATE CLIENTES SET SPED = 0');

    QItens.Prepare;
    QItens.ExecSql;


    QItens.Sql.Clear;
    QItens.Sql.Add('UPDATE FORNECEDORES SET SPED = 0');

    QItens.Prepare;
    QItens.ExecSql;


    QItens.Sql.Clear;
    QItens.Sql.Add('UPDATE SERVICOS SET SPED = 0');

    QItens.Prepare;
    QItens.ExecSql;


    if LeIni(Arq_Ini, 'Sintegra', 'Alterar CFOP Gás') =  'True' Then
    begin

      QRel.SQL.Clear;
      QRel.SQL.Add('SELECT TRIBUTO_ID,CODIGO_ECF FROM TRIBUTOS WHERE (CODIGO_ECF = :SIT_TRIBUTARIA OR CODIGO_ECF = :SIT_TRIBUTARIA1 )  ');
      QRel.ParamByName('SIT_TRIBUTARIA').AsString  := 'F1';
      QRel.ParamByName('SIT_TRIBUTARIA1').AsString := 'F2';
      QRel.Prepare;
      QRel.Open();
      QRel.First;

      while not QRel.Eof do
      Begin

        IF QRel.FieldByName('CODIGO_ECF').AsString = 'F1' then
        Begin
        QItens.Sql.Clear;
        QItens.Sql.Add('UPDATE REGISTRO_60I SET SIT_TRIBUTARIA = :SIT_TRIBUTARIA WHERE COD_PRODUTO IN (SELECT COD_BARRA FROM PRODUTOS WHERE TRIBUTO_ID = :TRIBUTO_ID)  AND SIT_TRIBUTARIA = :SIT_TRIBUTARIA2');
        QItens.ParamByName('SIT_TRIBUTARIA').AsString  := 'F1';
        QItens.ParamByName('SIT_TRIBUTARIA2').AsString := 'F';
        QItens.ParamByName('TRIBUTO_ID').AsInteger     := QRel.FieldByName('TRIBUTO_ID').AsInteger;

        QItens.Prepare;
        QItens.ExecSql;
        End
        Else  IF QRel.FieldByName('CODIGO_ECF').AsString = 'F2' then
        Begin
        QItens.Sql.Clear;
        QItens.Sql.Add('UPDATE REGISTRO_60I SET SIT_TRIBUTARIA = :SIT_TRIBUTARIA WHERE COD_PRODUTO IN (SELECT COD_BARRA FROM PRODUTOS WHERE TRIBUTO_ID = :TRIBUTO_ID)  AND SIT_TRIBUTARIA = :SIT_TRIBUTARIA2');
        QItens.ParamByName('SIT_TRIBUTARIA').AsString  := 'F2';
        QItens.ParamByName('SIT_TRIBUTARIA2').AsString := 'F';
        QItens.ParamByName('TRIBUTO_ID').AsInteger     := QRel.FieldByName('TRIBUTO_ID').AsInteger;

        QItens.Prepare;
        QItens.ExecSql;
        End;
       QRel.Next;

      End;


      QSearch.SQL.Clear;
      QSearch.SQL.Add('DELETE FROM REGISTRO_60A WHERE DT_EMISSAO BETWEEN :DT_INICIAL AND :DT_FINAL AND SIT_TRIBUTARIA =:SIT_TRIBUTARIA');
      QSearch.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
      QSearch.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
      QSearch.ParamByName('SIT_TRIBUTARIA').AsString  := 'F';
      QSearch.Prepare;
      QSearch.ExecSQL();

      QSearch.SQL.Clear;
      QSearch.SQL.Add('DELETE FROM REGISTRO_60A WHERE DT_EMISSAO BETWEEN :DT_INICIAL AND :DT_FINAL AND (SIT_TRIBUTARIA = :SIT_TRIBUTARIA OR SIT_TRIBUTARIA = :SIT_TRIBUTARIA2)');
      QSearch.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
      QSearch.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
      QSearch.ParamByName('SIT_TRIBUTARIA').AsString   := 'F1';
      QSearch.ParamByName('SIT_TRIBUTARIA2').AsString  := 'F2';
      QSearch.Prepare;
      QSearch.ExecSQL();


      QRel.SQL.Clear;
      QRel.SQL.Add('SELECT DT_EMISSAO,NUM_SERIE,SIT_TRIBUTARIA, SUM(BASE_CALC_ICMS) VALOR_TOTALIZADOR');
      QRel.SQL.Add('FROM REGISTRO_60I');
      QRel.SQL.Add('WHERE DT_EMISSAO BETWEEN :DT_INICIAL AND :DT_FINAL AND SIT_TRIBUTARIA = :SIT_TRIBUTARIA ');
      QRel.SQL.Add('GROUP BY DT_EMISSAO,NUM_SERIE,SIT_TRIBUTARIA');
      QRel.SQL.Add('ORDER BY DT_EMISSAO');

      QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
      QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
      QRel.ParamByName('SIT_TRIBUTARIA').AsString  := 'F';

      QRel.Prepare;
      QRel.Open();

      QRel.First;

      while not QRel.Eof do
      Begin



       QItens.SQL.Clear;
       QItens.SQL.Add('INSERT INTO REGISTRO_60A(DT_EMISSAO, NUM_SERIE,SIT_TRIBUTARIA,VALOR_TOTALIZADOR,EXPORTADO)VALUES');
       QItens.SQL.Add('(:DT_EMISSAO, :NUM_SERIE, :SIT_TRIBUTARIA, :VALOR_TOTALIZADOR ,0)');
       QItens.ParamByName('DT_EMISSAO').AsDateTime     := QRel.FieldByName('DT_EMISSAO').AsDateTime;
       QItens.ParamByName('NUM_SERIE').AsString        := QRel.FieldByName('NUM_SERIE').AsString;
       QItens.ParamByName('SIT_TRIBUTARIA').AsString   := QRel.FieldByName('SIT_TRIBUTARIA').AsString;
       QItens.ParamByName('VALOR_TOTALIZADOR').AsFloat := QRel.FieldByName('VALOR_TOTALIZADOR').AsFloat;

       QItens.Prepare;
       QItens.ExecSQL;

       Label3.Caption := 'Atualizando Registros 60A' ;
       Label6.Caption := 'Sit. Tributaria: ' + QRel.FieldByName('SIT_TRIBUTARIA').AsString  + ' - ' + FloatToStr(QRel.FieldByName('VALOR_TOTALIZADOR').AsFloat);

       Application.ProcessMessages;

       QRel.Next;
      End;


      QRel.SQL.Clear;
      QRel.SQL.Add('SELECT DT_EMISSAO,NUM_SERIE,SIT_TRIBUTARIA, SUM(BASE_CALC_ICMS) VALOR_TOTALIZADOR');
      QRel.SQL.Add('FROM REGISTRO_60I');
      QRel.SQL.Add('WHERE DT_EMISSAO BETWEEN :DT_INICIAL AND :DT_FINAL AND (SIT_TRIBUTARIA = :SIT_TRIBUTARIA OR SIT_TRIBUTARIA = :SIT_TRIBUTARIA2)');
      QRel.SQL.Add('GROUP BY DT_EMISSAO,NUM_SERIE,SIT_TRIBUTARIA');
      QRel.SQL.Add('ORDER BY DT_EMISSAO');

      QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
      QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
      QRel.ParamByName('SIT_TRIBUTARIA').AsString   := 'F1';
      QRel.ParamByName('SIT_TRIBUTARIA2').AsString  := 'F2';

      QRel.Prepare;
      QRel.Open();

      QRel.First;

      while not QRel.Eof do
      Begin

       QItens.SQL.Clear;
       QItens.SQL.Add('INSERT INTO REGISTRO_60A(DT_EMISSAO, NUM_SERIE,SIT_TRIBUTARIA,VALOR_TOTALIZADOR,EXPORTADO)VALUES');
       QItens.SQL.Add('(:DT_EMISSAO, :NUM_SERIE, :SIT_TRIBUTARIA, :VALOR_TOTALIZADOR ,0)');
       QItens.ParamByName('DT_EMISSAO').AsDateTime     := QRel.FieldByName('DT_EMISSAO').AsDateTime;
       QItens.ParamByName('NUM_SERIE').AsString        := QRel.FieldByName('NUM_SERIE').AsString;
       QItens.ParamByName('SIT_TRIBUTARIA').AsString   := QRel.FieldByName('SIT_TRIBUTARIA').AsString;
       QItens.ParamByName('VALOR_TOTALIZADOR').AsFloat := QRel.FieldByName('VALOR_TOTALIZADOR').AsFloat;

       QItens.Prepare;
       QItens.ExecSQL;

       Label3.Caption := 'Atualizando Registros 60A' ;
       Label6.Caption := 'Sit. Tributária: '  + QRel.FieldByName('SIT_TRIBUTARIA').AsString  + ' - ' + FloatToStr(QRel.FieldByName('VALOR_TOTALIZADOR').AsFloat);

       Application.ProcessMessages;

       QRel.Next;
      End;


    end;

    //Inserir Transasoes para Notas Cancelasdas/Inunutilizadas

    //Novo layout do sped nao necessida destas informaçoes
    {
    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT * FROM  NOTAS_CANCELADAS_NFCE WHERE DT_SAIDA BETWEEN :DT_INICIAL AND :DT_FINAL');
    QRel.Sql.Add('AND (EMPRESA_ID = :EMPRESA_ID) AND TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM TRANSACOES');
    QRel.Sql.Add('WHERE DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');

    QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
    QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;

    QRel.Prepare;
    QRel.Open;

    QRel.First;
    while not QRel.Eof do
    begin

          QItens.Sql.Clear;
          QItens.Sql.Add('INSERT INTO TRANSACOES( ' +
                       'TRANSACAO_ID, DT_TRANS,   DT_MOVIMENTO, DT_ENT_SAI, NUM_DOC, MODELO, SERIE, ' +
                       'EMPRESA_ID, CONTA_ID,     C_CUSTO_ID, CONDUTA, DEPTO, ' +
                       'VALOR,        TPCTB,      AUTORIZ_ID,   HISTORICO,COMPLEMENTO, ' +
                       'CONTAAUX_ID, HORA,TIPO_VENDA) VALUES(' +
                       ':TRANSACAO_ID, :DT_TRANS,   :DT_MOVIMENTO, :DT_ENT_SAI, :NUM_DOC, :MODELO,  :SERIE,      :EMPRESA_ID, ' +
                       ':CONTA_ID,     :C_CUSTO_ID, :CONDUTA, :DEPTO ,:VALOR,  :TPCTB,   :AUTORIZ_ID, :HISTORICO, :COMPLEMENTO,  ' +
                       ':CONTAAUX_ID, :HORA,:TIPO_VENDA)');

          QItens.ParamByName('TRANSACAO_ID').AsInteger  := QRel.FieldByName('TRANSACAO_ID').ASInteger;
          QItens.ParamByName('DT_TRANS').AsDateTime     := QRel.FieldByName('DT_SAIDA').AsDateTime;
          QItens.ParamByName('DT_MOVIMENTO').AsDateTime := QRel.FieldByName('DT_SAIDA').AsDateTime;
          QItens.ParamByName('DT_ENT_SAI').AsDateTime   := QRel.FieldByName('DT_SAIDA').AsDateTime;
          QItens.ParamByName('NUM_DOC').AsString        := StrZero(IntToStr(QRel.FieldByName('NO_DOC_FISCAL').AsInteger),7,0);
          QItens.ParamByName('MODELO').AsString         := '65';
          QItens.ParamByName('SERIE').AsString          := QRel.FieldByName('ECF').AsString;
          QItens.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
          QItens.ParamByName('CONTA_ID').AsInteger      := FrmPrincipal.Config.FieldByName('CONTA_ESTOQUE').AsInteger;
          QItens.ParamByName('C_CUSTO_ID').AsInteger    := 1;
          QItens.ParamByName('VALOR').AsFloat           := QRel.FieldByName('VALOR').AsFloat;
          QItens.ParamByName('TPCTB').AsString          := FrmData.QAcesso.FieldByName('TPCTB').AsString;
          QItens.ParamByName('AUTORIZ_ID').AsInteger    := FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger;
          QItens.ParamByName('HISTORICO').AsString      := 'Nota Cancelada/Inutilizada por motivos diversos pelo caixa.';
          QItens.ParamByName('COMPLEMENTO').AsString    := 'ACERTO SPED';

          
          QItens.ParamByName('CONTAAUX_ID').AsInteger   := 0;
          QItens.ParamByName('CONDUTA').AsString        := '01';
          QItens.ParamByName('DEPTO').AsString          := '07';
          QItens.ParamByName('HORA').AsString           := QRel.FieldByName('HR_SAIDA').AsString;
          QItens.ParamByName('TIPO_VENDA').AsString     := 'VENDA';


          QItens.Prepare;
          QItens.ExecSql;




       Label6.Caption := 'Acertando Notas Canceladas no Sistema';
       Label3.Caption := StrZero(QRel.FieldByName('TRANSACAO_ID').AsString, 6, 0);

      Application.ProcessMessages;


     QRel.Next;

    end;
    }

    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT * FROM TRANSACOES');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(DT_SPED BETWEEN :DT_INICIAL AND :DT_FINAL)');
    QRel.Sql.Add('AND (EMPRESA_ID = :EMPRESA_ID)');
    QRel.Sql.Add('AND (TPCTB <= :TPCTB) AND ((TRANSACOES.COMPLEMENTO <> ''INUTILIZADA'') OR (TRANSACOES.COMPLEMENTO IS NULL))');
    QRel.Sql.Add('AND (TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
    //1-Alteração dia 11/05/2021, adicionado filtro para não jogar participante de cte cancelado
    QRel.Sql.Add('AND (TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM CTES_CANCELADAS))');

    if FrmPrincipal.Config.FieldByName('SPED_SERVICO').AsString = 'True' then
    QRel.Sql.Add('AND (((MODELO = :MODELO1) OR (MODELO = :MODELO2) OR (MODELO = :MODELO3) OR (MODELO = :MODELO4) OR (MODELO = :MODELO5) OR (MODELO = :MODELO6) OR (MODELO = :MODELO7) OR (MODELO = :MODELO8) OR (MODELO = :MODELO9) OR (MODELO = :MODELO10) ))')
    Else
    QRel.Sql.Add('AND (((MODELO = :MODELO1) OR (MODELO = :MODELO2) OR (MODELO = :MODELO3) OR (MODELO = :MODELO4) OR (MODELO = :MODELO5) OR (MODELO = :MODELO6) OR (MODELO = :MODELO7) OR (MODELO = :MODELO8) OR (MODELO = :MODELO9) ))');


    QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
    QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    QRel.ParamByName('MODELO1').AsString      := '01';
    QRel.ParamByName('MODELO2').AsString      := '1B';
    QRel.ParamByName('MODELO3').AsString      := '04';
    QRel.ParamByName('MODELO4').AsString      := '55';
    QRel.ParamByName('MODELO5').AsString      := '29';
    QRel.ParamByName('MODELO6').AsString      := '22';
    QRel.ParamByName('MODELO7').AsString      := '06';
    QRel.ParamByName('MODELO8').AsString      := '57';
    QRel.ParamByName('MODELO9').AsString      := '67';

    if FrmPrincipal.Config.FieldByName('SPED_SERVICO').AsString = 'True' then
    QRel.ParamByName('MODELO10').AsString      := '99';

    QRel.Prepare;
    QRel.Open;

    QRel.First;
    while not QRel.Eof do
    begin
      if ((QRel.FieldByName('CONDUTA').AsString = '01') and (QRel.FieldByName('DEPTO').AsString = '10')) or ((QRel.FieldByName('CONDUTA').AsString = '02') and (QRel.FieldByName('DEPTO').AsString = '07')) or ((QRel.FieldByName('CONDUTA').AsString = '02') and (QRel.FieldByName('DEPTO').AsString = '02'))  then
      begin



        QItens.Sql.Clear;
        QItens.Sql.Add('UPDATE FORNECEDORES SET SPED = 1');
        QItens.Sql.Add('WHERE');
        QItens.Sql.Add('(FORNECEDOR_ID = :FORNECEDOR_ID)');

        QItens.ParamByName('FORNECEDOR_ID').AsInteger := QRel.FieldByName('FORNECEDOR_ID').AsInteger;

        QItens.Prepare;
        QItens.ExecSql;

      end
      else
      begin



        QItens.Sql.Clear;
        QItens.Sql.Add('UPDATE CLIENTES SET SPED = 1');
        QItens.Sql.Add('WHERE');
        QItens.Sql.Add('(CLIENTE_ID = :CLIENTE_ID)');

        QItens.ParamByName('CLIENTE_ID').AsInteger := QRel.FieldByName('CLIENTE_ID').AsInteger;

        QItens.Prepare;
        QItens.ExecSql;


      end;
      Label6.Caption := 'Marcando Clientes com Movimentação';
      Label3.Caption := StrZero(QRel.FieldByName('TRANSACAO_ID').AsString, 6, 0);

      Application.ProcessMessages;
      QRel.Next;
    end;

      QRel.SQL.Clear;
      QRel.Sql.Add('SELECT CLIENTE_ID , NOME, SUM(DEBITO) DEBITO ,SUM(CREDITO) CREDITO ');
      QRel.Sql.Add('FROM(');
      QRel.Sql.Add('SELECT FINALIZADORAS.CLIENTE_ID,   CLIENTES.NOME, VALOR CREDITO , 0 DEBITO FROM TRANSACOES');
      QRel.Sql.Add('INNER JOIN FINALIZADORAS ON FINALIZADORAS.FINALIZADORA_ID = TRANSACOES.FINALIZADORA_ID ');
      QRel.Sql.Add('INNER JOIN CLIENTES ON FINALIZADORAS.CLIENTE_ID = CLIENTES.CLIENTE_ID ');
      QRel.Sql.Add('WHERE ((FINALIZADORAS.DESCRICAO ILIKE :CARTAO) OR (FINALIZADORAS.DESCRICAO   ILIKE :PIX) )  AND ');
      QRel.Sql.Add('FINALIZADORAS.C_CREDITO = :C_CREDITO ');
      QRel.Sql.Add('AND MODELO <> :MODELO');
      QRel.Sql.Add('AND DT_SPED BETWEEN :DT_INICIAL AND :DT_FINAL ');
      QRel.Sql.Add('UNION ALL ');
      QRel.Sql.Add('SELECT FINALIZADORAS.CLIENTE_ID,  CLIENTES.NOME, 0 CREDITO , VALOR DEBITO FROM TRANSACOES ');
      QRel.Sql.Add('INNER JOIN FINALIZADORAS ON FINALIZADORAS.FINALIZADORA_ID = TRANSACOES.FINALIZADORA_ID ');
      QRel.Sql.Add('INNER JOIN CLIENTES ON FINALIZADORAS.CLIENTE_ID = CLIENTES.CLIENTE_ID ');
      QRel.Sql.Add('WHERE ((FINALIZADORAS.DESCRICAO ILIKE :CARTAO) OR (FINALIZADORAS.DESCRICAO ILIKE :PIX))  AND ');
      QRel.Sql.Add('FINALIZADORAS.C_DEBITO = :C_DEBITO ');
      QRel.Sql.Add('AND (MODELO <> :MODELO) OR (MODELO IS NULL)');
      QRel.Sql.Add('AND DT_SPED BETWEEN :DT_INICIAL AND :DT_FINAL');

      QRel.Sql.Add(') AS TESTE');
      QRel.Sql.Add('GROUP BY CLIENTE_ID,  NOME');

      QRel.ParamByName('CARTAO').AsString       := 'CARTAO%' ;
      QRel.ParamByName('PIX').AsString          := 'PIX%';
      QRel.ParamByName('C_CREDITO').AsString    := 'True';
      QRel.ParamByName('C_DEBITO').AsString     := 'True';
      QRel.ParamByName('MODELO').AsString       := '99';
      QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
      QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;

      QRel.Prepare;
      QRel.Open;

      QRel.First;

      while not QRel.Eof do
      begin
        QItens.Sql.Clear;
        QItens.Sql.Add('UPDATE CLIENTES SET SPED = 1');
        QItens.Sql.Add('WHERE');
        QItens.Sql.Add('(CLIENTE_ID = :CLIENTE_ID)');

        QItens.ParamByName('CLIENTE_ID').AsInteger := QRel.FieldByName('CLIENTE_ID').AsInteger;

        QItens.Prepare;
        QItens.ExecSql;


        Label6.Caption := 'Marcando Clientes com Movimentação';
        Label3.Caption := StrZero(QRel.FieldByName('CLIENTE_ID').AsString, 6, 0);

        Application.ProcessMessages;
        QRel.Next;
      end;


    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT * FROM TRANSACOES');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(DT_SPED BETWEEN :DT_INICIAL AND :DT_FINAL)');
    QRel.Sql.Add('AND (EMPRESA_ID = :EMPRESA_ID)');
    QRel.Sql.Add('AND (TPCTB <= :TPCTB)');
    QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :CONDUTA)');
    QRel.Sql.Add('AND (TRANSACOES.DEPTO = :DEPTO)');
    QRel.Sql.Add('AND (TRANSACOES.CFOP <> :NULO)');
    QRel.Sql.Add('AND (TRANSACOES.NUM_DOC <> :NULO)');
    QRel.Sql.Add('AND (((MODELO = :MODELO1) OR (MODELO = :MODELO2) OR (MODELO = :MODELO3) OR (MODELO = :MODELO4) OR (MODELO = :MODELO5) ' );

                 if FrmPrincipal.Config.FieldByName('SPED_SERVICO').AsString = 'True' then
    QRel.Sql.Add('OR (MODELO = :MODELO6) OR (MODELO = :MODELO7) OR (MODELO = :MODELO8) OR (MODELO = :MODELO9) OR (MODELO = :MODELO10) OR (MODELO = :MODELO11) OR (MODELO = :MODELO12) OR (MODELO = :MODELO13)))')
                 Else
    QRel.Sql.Add('OR (MODELO = :MODELO6) OR (MODELO = :MODELO7) OR (MODELO = :MODELO8) OR (MODELO = :MODELO9) OR (MODELO = :MODELO10) OR (MODELO = :MODELO11) OR (MODELO = :MODELO12) OR (MODELO = :MODELO13) ))');

    QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
    QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    QRel.ParamByName('CONDUTA').AsString      := '02';
    QRel.ParamByName('DEPTO').AsString        := '02';
    QRel.ParamByName('NULO').AsString         := '';
    QRel.ParamByName('MODELO1').AsString      := '06';
    QRel.ParamByName('MODELO2').AsString      := '07';
    QRel.ParamByName('MODELO3').AsString      := '08';
    QRel.ParamByName('MODELO4').AsString      := '8B';
    QRel.ParamByName('MODELO5').AsString      := '09';
    QRel.ParamByName('MODELO6').AsString      := '10';
    QRel.ParamByName('MODELO7').AsString      := '11';
    QRel.ParamByName('MODELO8').AsString      := '21';
    QRel.ParamByName('MODELO9').AsString      := '22';
    QRel.ParamByName('MODELO10').AsString     := '26';
    QRel.ParamByName('MODELO11').AsString     := '27';
    QRel.ParamByName('MODELO12').AsString     := '57';
    QRel.ParamByName('MODELO13').AsString     := '67';

    if FrmPrincipal.Config.FieldByName('SPED_SERVICO').AsString = 'True' Then
    QRel.ParamByName('MODELO13').AsString     := '99';

    QRel.Prepare;
    QRel.Open;

    QRel.First;
    while not QRel.Eof do
    begin
      QItens.Sql.Clear;
      QItens.Sql.Add('UPDATE FORNECEDORES SET SPED = 1');
      QItens.Sql.Add('WHERE');
      QItens.Sql.Add('(FORNECEDOR_ID = :FORNECEDOR_ID)');

      QItens.ParamByName('FORNECEDOR_ID').AsInteger := QRel.FieldByName('FORNECEDOR_ID').AsInteger;

      QItens.Prepare;
      QItens.ExecSql;



      Label6.Caption := 'Marcando Fornecedores com Movimentação';
      Label3.Caption := StrZero(QRel.FieldByName('TRANSACAO_ID').AsString, 6, 0);

      Application.ProcessMessages;
      QRel.Next;
    end;



    QItens.Sql.Clear;
    QItens.Sql.Add('ALTER TABLE PRODUTOS DISABLE TRIGGER PRODUTOS_UP');

    QItens.Prepare;
    QItens.ExecSql;


    try

     QItens.Sql.Clear;
     QItens.Sql.Add('ALTER TABLE PRODUTOS DISABLE TRIGGER MOBILE_SYNC_PRODUTOS');

     QItens.Prepare;
     QItens.ExecSql;
    except

    end;




    QItens.Sql.Clear;
    QItens.Sql.Add('DELETE FROM PRODUTOS WHERE (DESCRICAO = ' +  #39 + 'RECUPERADO' + #39 + ') ');

    QItens.Prepare;
    QItens.ExecSql;




    QItens.Sql.Clear;
    QItens.Sql.Add('UPDATE PRODUTOS SET SPED = 0');

    QItens.Prepare;
    QItens.ExecSql;




    QItens.Sql.Clear;
    QItens.Sql.Add('SELECT DISTINCT REGISTRO_60I.COD_PRODUTO,PRODUTOS.PRODUTO_ID ,PRODUTOS.DESCRICAO');
    QItens.Sql.Add('FROM REGISTRO_60I');
    QItens.Sql.Add('LEFT JOIN PRODUTOS');
    QItens.Sql.Add('ON TRIM(PRODUTOS.COD_BARRA) = TRIM(REGISTRO_60I.COD_PRODUTO)');
    QItens.Sql.Add('WHERE (REGISTRO_60I.DT_EMISSAO BETWEEN :DT_INICIAL AND :DT_FINAL)');
    QItens.Sql.Add('AND   (REGISTRO_60I.SIT_TRIBUTARIA <> :CANC)');

    {QItens.Sql.Add('AND ((REGISTRO_60I.SIT_TRIBUTARIA = :SIT_TRIBUTARIA)  OR ');
    QItens.Sql.Add('     (REGISTRO_60I.SIT_TRIBUTARIA = :SIT_TRIBUTARIA1) OR ');
    QItens.Sql.Add('     (REGISTRO_60I.SIT_TRIBUTARIA = :SIT_TRIBUTARIA2) OR ');
    QItens.Sql.Add('     (REGISTRO_60I.SIT_TRIBUTARIA = :SIT_TRIBUTARIA3) OR ');
    QItens.Sql.Add('     (REGISTRO_60I.SIT_TRIBUTARIA = :SIT_TRIBUTARIA4) OR ');
    QItens.Sql.Add('     (REGISTRO_60I.SIT_TRIBUTARIA = :SIT_TRIBUTARIA5) OR ');
    QItens.Sql.Add('     (REGISTRO_60I.SIT_TRIBUTARIA = :SIT_TRIBUTARIA6) OR ');
    QItens.Sql.Add('     (REGISTRO_60I.SIT_TRIBUTARIA = :SIT_TRIBUTARIA7) OR ');
    QItens.Sql.Add('     (REGISTRO_60I.SIT_TRIBUTARIA = :SIT_TRIBUTARIA8) OR ');
    QItens.Sql.Add('     (REGISTRO_60I.SIT_TRIBUTARIA = :SIT_TRIBUTARIA9) OR ');
    QItens.Sql.Add('     (REGISTRO_60I.SIT_TRIBUTARIA = :SIT_TRIBUTARIA10) OR ');
    QItens.Sql.Add('     (REGISTRO_60I.SIT_TRIBUTARIA = :SIT_TRIBUTARIA11) OR ');
    QItens.Sql.Add('     (REGISTRO_60I.SIT_TRIBUTARIA = :SIT_TRIBUTARIA12))'); }


    QItens.Sql.Add('ORDER BY PRODUTOS.DESCRICAO');

    QItens.ParamByName('DT_INICIAL').AsDateTime     := Dtmen.Date;
    QItens.ParamByName('DT_FINAL').AsDateTime       := Dtmai.Date;
    QItens.ParamByName('CANC').AsString             := 'CANC';

    {QItens.ParamByName('SIT_TRIBUTARIA').AsString   := '0700';
    QItens.ParamByName('SIT_TRIBUTARIA1').AsString  := '1200';
    QItens.ParamByName('SIT_TRIBUTARIA2').AsString  := '1800';
    QItens.ParamByName('SIT_TRIBUTARIA3').AsString  := '2500';
    QItens.ParamByName('SIT_TRIBUTARIA4').AsString  := '3000';
    QItens.ParamByName('SIT_TRIBUTARIA5').AsString  := '0840';
    QItens.ParamByName('SIT_TRIBUTARIA6').AsString  := '0720';
    QItens.ParamByName('SIT_TRIBUTARIA7').AsString  := '0560';
    QItens.ParamByName('SIT_TRIBUTARIA8').AsString  := '0400';
    QItens.ParamByName('SIT_TRIBUTARIA9').AsString  := 'F';
    QItens.ParamByName('SIT_TRIBUTARIA10').AsString  := 'I';
    QItens.ParamByName('SIT_TRIBUTARIA11').AsString  := 'N';
     QItens.ParamByName('SIT_TRIBUTARIA12').AsString  := 'F1';  }

    QItens.Prepare;
    QItens.Open;

    QItens.First;

    while not QItens.Eof do
    begin
      if QItens.FieldByName('DESCRICAO').AsString = '' then
      begin
        QRel.Sql.Clear;
        QRel.Sql.Add('INSERT INTO PRODUTOS(EMPRESA_ID,    TIPO,       DESCRICAO,        FANTASIA,        UNIDADE, ' +
                                          'COD_BARRA,     GRUPO_ID,   SUBTIPO_ID,       LOCALIZACAO_ID,  TRIBUTO_ID, ' +
                                          'STATUS,        CST_PIS,    PIS,              CST_COFINS,      COFINS, ' +
                                          'CST_PIS_ENTR,  PIS_ENTR,   CST_COFINS_ENTR,  COFINS_ENTR,     UNIDADE_VENDA, SPED,SUPERVISOR) VALUES(' +
                                          ':EMPRESA_ID,   :TIPO,      :DESCRICAO,       :FANTASIA,       :UNIDADE, ' +
                                          ':COD_BARRA,    :GRUPO_ID,  :SUBTIPO_ID,      :LOCALIZACAO_ID, :TRIBUTO_ID, ' +
                                          ':STATUS,       :CST_PIS,   :PIS,             :CST_COFINS,     :COFINS, ' +
                                          ':CST_PIS_ENTR, :PIS_ENTR,  :CST_COFINS_ENTR, :COFINS_ENTR,    :UNIDADE_VENDA, :SPED,:SUPERVISOR)');

        QRel.ParamByName('EMPRESA_ID').AsInteger     := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
        QRel.ParamByName('TIPO').AsString            := 'MERCADORIA';
        QRel.ParamByName('DESCRICAO').AsString       := 'RECUPERADO';
        QRel.ParamByName('FANTASIA').AsString        := 'RECUPERADO';
        QRel.ParamByName('UNIDADE').AsString         := 'UN';
        QRel.ParamByName('COD_BARRA').AsString       := Alltrim(Copy(QItens.FieldByName('COD_PRODUTO').AsString,1,14));
        QRel.ParamByName('GRUPO_ID').AsInteger       := 1;
        QRel.ParamByName('SUBTIPO_ID').AsInteger     := 1;
        QRel.ParamByName('LOCALIZACAO_ID').AsInteger := 1;
        QRel.ParamByName('TRIBUTO_ID').AsInteger     := 6;
        QRel.ParamByName('STATUS').AsString          := 'D';
        QRel.ParamByName('CST_PIS').AsString         := '01';
        QRel.ParamByName('PIS').AsFloat              := FrmPrincipal.QEmpresa.FieldByName('PIS').AsFloat;
        QRel.ParamByName('CST_COFINS').AsString      := '01';
        QRel.ParamByName('COFINS').AsFloat           := FrmPrincipal.QEmpresa.FieldByName('COFINS').AsFloat;
        QRel.ParamByName('CST_PIS_ENTR').AsString    := '50';
        QRel.ParamByName('PIS_ENTR').AsFloat         := 1.65;
        QRel.ParamByName('CST_COFINS_ENTR').AsString := '50';
        QRel.ParamByName('COFINS_ENTR').AsFloat      := 7.6;
        QRel.ParamByName('UNIDADE_VENDA').AsString   := 'UN';
        QRel.ParamByName('SPED').AsInteger           := 1 ;
        QRel.ParamByName('SUPERVISOR').AsString      := 'NÃO';


        QRel.Prepare;
        QRel.ExecSql;


      end
      Else
      Begin
      QRel.Sql.Clear;
      QRel.Sql.Add('UPDATE PRODUTOS SET SPED = 1');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(PRODUTO_ID = :PRODUTO_ID)');

      QRel.ParamByName('PRODUTO_ID').AsInteger := QItens.FieldByName('PRODUTO_ID').AsInteger;

      QRel.Prepare;
      QRel.ExecSql;



      End;

      Application.ProcessMessages;

      QItens.Next;
      Label6.Caption := 'Marcando Produtos com Movimentação';
      Label3.Caption := QItens.FieldByName('COD_PRODUTO').AsString;
    end;

   { QRel.Sql.Clear;
    QRel.Sql.Add('UPDATE PRODUTOS SET COD_BARRA = LPAD(PRODUTOS.COD_BARRA ,13,' + #39 + '0' + #39 + ' )');
    QRel.Sql.Add('WHERE CHAR_LENGTH(PRODUTOS.COD_BARRA) < 13');

    QRel.Prepare;
    QRel.ExecSql;





   { QRel.Sql.Clear;
    QRel.Sql.Add('SELECT DISTINCT PRODUTOS.PRODUTO_ID');
    QRel.Sql.Add('FROM REGISTRO_60I');
    QRel.Sql.Add('INNER JOIN PRODUTOS ON PRODUTOS.COD_BARRA = REGISTRO_60I.COD_PRODUTO');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(REGISTRO_60I.DT_EMISSAO BETWEEN :DT_INICIAL AND :DT_FINAL)');
    QRel.Sql.Add('AND (REGISTRO_60I.SIT_TRIBUTARIA = :SIT_TRIBUTARIA)');

    QRel.ParamByName('DT_INICIAL').AsDateTime     := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime       := Dtmai.Date;
    QRel.ParamByName('SIT_TRIBUTARIA').AsString   := 'CANC';

    QRel.Prepare;
    QRel.Open;

    QRel.First;
    while not QRel.Eof do
    begin
      QItens.Sql.Clear;
      QItens.Sql.Add('UPDATE PRODUTOS SET SPED = 1');
      QItens.Sql.Add('WHERE');
      QItens.Sql.Add('(PRODUTO_ID = :PRODUTO_ID)');

      QItens.ParamByName('PRODUTO_ID').AsInteger := QRel.FieldByName('PRODUTO_ID').AsInteger;

      QItens.Prepare;
      QItens.ExecSql;


      Label6.Caption := 'Marcando Produtos vendidos pela ECF';
      Label3.Caption := StrZero(QRel.FieldByName('PRODUTO_ID').AsString, 6, 0);

      Application.ProcessMessages;
      QRel.Next;
    end; }

    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT DISTINCT PRODUTOS.* ');
    QRel.Sql.Add('FROM PRODUTOS');
    QRel.Sql.Add('INNER JOIN TRANSITENS');
    QRel.Sql.Add('ON (PRODUTOS.PRODUTO_ID = TRANSITENS.PRODUTO_ID)');
    QRel.Sql.Add('INNER JOIN TRANSACOES');
    QRel.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(TRANSACOES.DT_SPED BETWEEN :DT_INICIAL AND :DT_FINAL) AND ((TRANSACOES.COMPLEMENTO <> ''INUTILIZADA'') OR (TRANSACOES.COMPLEMENTO IS NULL))');
    QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS))');
    QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
    QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
    QRel.Sql.Add('AND (TRANSITENS.TP_PROD_SERV = :TP_PROD_SERV)');
    QRel.Sql.Add('AND ((((TRANSACOES.CONDUTA = :CD_VDA) AND (TRANSACOES.DEPTO = :DP_CPR) AND ((TRANSACOES.MODELO = :MODELO5) OR (TRANSACOES.MODELO = :MODELO1) ))');
    QRel.Sql.Add('OR  (TRANSACOES.CONDUTA = :CD_CPR) AND (TRANSACOES.DEPTO = :DP_CPR) AND ((TRANSACOES.SUB_SERIE <> :SUB_SERIE) OR (TRANSACOES.SUB_SERIE IS NULL)) ) OR ((TRANSACOES.CONDUTA = :CD_DEV_VDA) ');
    QRel.Sql.Add('AND (TRANSACOES.DEPTO = :DP_DEV_VDA) AND ((TRANSACOES.MODELO <> :MODELO4) OR (TRANSACOES.SUB_SERIE = :SUB_SERIE))))');
    QRel.Sql.Add('AND (((TRANSACOES.MODELO = :MODELO1) OR (TRANSACOES.MODELO = :MODELO2) OR (TRANSACOES.MODELO = :MODELO3) OR (TRANSACOES.MODELO = :MODELO4) OR (TRANSACOES.MODELO = :MODELO5)))');

    QRel.Sql.Add('ORDER BY PRODUTOS.PRODUTO_ID');

    QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
    QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    QRel.ParamByName('CD_CPR').AsString       := '02';
    QRel.ParamByName('CD_VDA').AsString       := '01';
    QRel.ParamByName('DP_CPR').AsString       := '07';
    QRel.ParamByName('CD_DEV_VDA').AsString   := '02';
    QRel.ParamByName('DP_DEV_VDA').AsString   := '10';
    QRel.ParamByName('TP_PROD_SERV').AsString := 'P';
    QRel.ParamByName('MODELO1').AsString      := '01';
    QRel.ParamByName('MODELO2').AsString      := '1B';
    QRel.ParamByName('MODELO3').AsString      := '04';
    QRel.ParamByName('MODELO4').AsString      := '55';
    QRel.ParamByName('MODELO5').AsString      := '02';
    QRel.ParamByName('SUB_SERIE').AsString    := 'P';


    QRel.Prepare;
    QRel.Open;

    QRel.First;
    while not QRel.Eof do
    begin

      QItens.Sql.Clear;
      QItens.Sql.Add('UPDATE PRODUTOS SET SPED = 1');
      QItens.Sql.Add('WHERE');
      QItens.Sql.Add('(PRODUTO_ID = :PRODUTO_ID)');

      QItens.ParamByName('PRODUTO_ID').AsInteger := QRel.FieldByName('PRODUTO_ID').AsInteger;

      QItens.Prepare;
      QItens.ExecSql;


      Label6.Caption := 'Marcando Produtos com Movimentação';
      Label3.Caption := StrZero(QRel.FieldByName('PRODUTO_ID').AsString, 6, 0);

      Application.ProcessMessages;
      QRel.Next;
    end;

    if  FrmPrincipal.Config.FieldByName('GERAR_BLOCOK').AsString = 'True' then
    Begin


      QRel.Sql.Clear;
      QRel.Sql.Add('SELECT * FROM POSICAO_PRODUTOS ');
      QRel.Sql.Add('INNER JOIN PRODUTOS ON PRODUTOS.PRODUTO_ID = POSICAO_PRODUTOS.PRODUTO_ID');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(POSICAO_PRODUTOS.DT_MOVIMENTO = :DT_MOVIMENTO)');
      QRel.Sql.Add('AND (POSICAO_PRODUTOS.QUANTIDADE_C > 0)');
      QRel.Sql.Add('AND ((PRODUTOS.TIPO_ITEM = :TIPO_ITEM)');
      QRel.Sql.Add('OR (PRODUTOS.TIPO_ITEM = :TIPO_ITEM1)');
      QRel.Sql.Add('OR (PRODUTOS.TIPO_ITEM = :TIPO_ITEM2)');
      QRel.Sql.Add('OR (PRODUTOS.TIPO_ITEM = :TIPO_ITEM3)');
      QRel.Sql.Add('OR (PRODUTOS.TIPO_ITEM = :TIPO_ITEM4)');
      QRel.Sql.Add('OR (PRODUTOS.TIPO_ITEM = :TIPO_ITEM5)');
      QRel.Sql.Add('OR (PRODUTOS.TIPO_ITEM = :TIPO_ITEM6)');
      QRel.Sql.Add('OR (PRODUTOS.TIPO_ITEM = :TIPO_ITEM7))');

     if Data.Text = 'Hoje' then
       QRel.ParamByName('DT_MOVIMENTO').AsDateTime := Date
     Else
       QRel.ParamByName('DT_MOVIMENTO').AsDateTime := StrTodate(Dt_Blocok.Text);

      QRel.ParamByName('TIPO_ITEM').AsString      := '00 - MERCADORIA PARA REVENDA';
      QRel.ParamByName('TIPO_ITEM1').AsString     := '01 - MATERIA PRIMA';
      QRel.ParamByName('TIPO_ITEM2').AsString     := '02 - EMBALAGEM';
      QRel.ParamByName('TIPO_ITEM3').AsString     := '03 - PRODUTO EM PROCESSO';
      QRel.ParamByName('TIPO_ITEM4').AsString     := '04 - PRODUTO ACABADO';
      QRel.ParamByName('TIPO_ITEM5').AsString     := '05 - SUBPRODUTO';
      QRel.ParamByName('TIPO_ITEM6').AsString     := '06 - PRODUTO INTERMEDIARIO';
      QRel.ParamByName('TIPO_ITEM7').AsString     := '10 - OUTROS INSUMOS';


      QRel.Prepare;
      QRel.Open;
      QRel.First;


      QRel.First;
      while not QRel.Eof do
      begin

        QItens.Sql.Clear;
        QItens.Sql.Add('UPDATE PRODUTOS SET SPED = 1');
        QItens.Sql.Add('WHERE');
        QItens.Sql.Add('(PRODUTO_ID = :PRODUTO_ID)');

        QItens.ParamByName('PRODUTO_ID').AsInteger := QRel.FieldByName('PRODUTO_ID').AsInteger;

        QItens.Prepare;
        QItens.ExecSql;


        Label6.Caption := 'Marcando Produtos com Movimentação BLOCO K';
        Label3.Caption := StrZero(QRel.FieldByName('PRODUTO_ID').AsString, 6, 0);

        Application.ProcessMessages;
        QRel.Next;
      end;


      QRel.Sql.Clear;
      QRel.Sql.Add('SELECT DISTINCT PRODUTO_ID  ');
      QRel.Sql.Add('FROM TRANSITENS');
      QRel.Sql.Add('INNER JOIN TRANSACOES ON TRANSITENS.BANCO_ID = TRANSACOES.TRANSACAO_ID');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('DT_SPED BETWEEN :DT_INICIAL AND :DT_FINAL');
      QRel.Sql.Add('AND ((TRANSACOES.COMPLEMENTO <> ''CANCELADA'') OR (TRANSACOES.COMPLEMENTO is null))');
      QRel.Sql.Add('AND (CONDUTA = :CONDUTA OR CONDUTA = :CONDUTA01) AND (DEPTO = :DEPTO)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');

      QRel.Sql.Add('ORDER BY PRODUTO_ID');

      QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
      QRel.ParamByName('CONDUTA').AsString      := '21';
      QRel.ParamByName('CONDUTA01').AsString    := '19';
      QRel.ParamByName('DEPTO').AsString        := '07';
      QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
      QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;

      QRel.Prepare;
      QRel.Open();


      QRel.First;
      while not QRel.Eof do
      begin

        QItens.Sql.Clear;
        QItens.Sql.Add('UPDATE PRODUTOS SET SPED = 1');
        QItens.Sql.Add('WHERE');
        QItens.Sql.Add('(PRODUTO_ID = :PRODUTO_ID)');

        QItens.ParamByName('PRODUTO_ID').AsInteger := QRel.FieldByName('PRODUTO_ID').AsInteger;

        QItens.Prepare;
        QItens.ExecSql;


        Label6.Caption := 'Marcando Produtos com Movimentação';
        Label3.Caption := StrZero(QRel.FieldByName('PRODUTO_ID').AsString, 6, 0);

        Application.ProcessMessages;
        QRel.Next;
      end;


      QRel.Sql.Clear;
      QRel.Sql.Add('SELECT DISTINCT PRODUTO_ID  ');
      QRel.Sql.Add('FROM TRANSITENS');
      QRel.Sql.Add('INNER JOIN TRANSACOES ON TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('DT_SPED BETWEEN :DT_INICIAL AND :DT_FINAL');
      QRel.Sql.Add('AND (CONDUTA = :CONDUTA01) AND (DEPTO = :DEPTO)');
      QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');

      QRel.Sql.Add('ORDER BY PRODUTO_ID');

      QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
     // QRel.ParamByName('CONDUTA').AsString      := '21';
      QRel.ParamByName('CONDUTA01').AsString    := '19';
      QRel.ParamByName('DEPTO').AsString        := '07';
      QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
      QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;

      QRel.Prepare;
      QRel.Open();

      QRel.Prepare;
      QRel.Open;

      QRel.First;
      while not QRel.Eof do
      begin

        QItens.Sql.Clear;
        QItens.Sql.Add('UPDATE PRODUTOS SET SPED = 1');
        QItens.Sql.Add('WHERE');
        QItens.Sql.Add('(PRODUTO_ID = :PRODUTO_ID)');

        QItens.ParamByName('PRODUTO_ID').AsInteger := QRel.FieldByName('PRODUTO_ID').AsInteger;

        QItens.Prepare;
        QItens.ExecSql;


        Label6.Caption := 'Marcando Produtos com Movimentação';
        Label3.Caption := StrZero(QRel.FieldByName('PRODUTO_ID').AsString, 6, 0);

        Application.ProcessMessages;
        QRel.Next;
      end;
    End;


   if FrmPrincipal.Config.FieldByName('SPED_SERVICO').AsString = 'True' then
   Begin

    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT DISTINCT SERVICOS.*');
    QRel.Sql.Add('FROM SERVICOS');
    QRel.Sql.Add('INNER JOIN TRANSITENS');
    QRel.Sql.Add('ON ((SERVICOS.SERVICO_ID = TRANSITENS.PRODUTO_ID) AND (TRANSITENS.TP_PROD_SERV = :TP_PROD_SERV))');
    QRel.Sql.Add('INNER JOIN TRANSACOES');
    QRel.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(TRANSACOES.DT_SPED BETWEEN :DT_INICIAL AND :DT_FINAL)');
    QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
    QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
    QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :CD_CPR OR TRANSACOES.CONDUTA = :CD_VDA)');
    QRel.Sql.Add('AND (TRANSACOES.DEPTO = :DEPTO)');
    QRel.Sql.Add('AND (TRANSACOES.MODELO = :MODELO)');
    QRel.Sql.Add('ORDER BY SERVICOS.DESCRICAO');

    QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
    QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    QRel.ParamByName('CD_CPR').AsString       := '02';
    QRel.ParamByName('CD_VDA').AsString       := '01';
    QRel.ParamByName('DEPTO').AsString        := '07';
    QRel.ParamByName('MODELO').AsString       := '99';
    QRel.ParamByName('TP_PROD_SERV').AsString := 'S';

    QRel.Prepare;
    QRel.Open;
    
    QRel.First;
    while not QRel.Eof do
    begin
      QItens.Sql.Clear;
      QItens.Sql.Add('UPDATE SERVICOS SET SPED = 1');
      QItens.Sql.Add('WHERE');
      QItens.Sql.Add('(SERVICO_ID = :SERVICO_ID)');

      QItens.ParamByName('SERVICO_ID').AsInteger := QRel.FieldByName('SERVICO_ID').AsInteger;

      QItens.Prepare;
      QItens.ExecSql;



      Label6.Caption := 'Inserindo serviços com movimentação!';
      Label3.Caption := StrZero(QRel.FieldByName('SERVICO_ID').AsString, 6, 0);

      Application.ProcessMessages;
      QRel.Next;
    end;
   End;

    if Forcar_Reg_H.Checked then
    Begin
      QRel.Sql.Clear;
      QRel.Sql.Add('SELECT * FROM POSICAO_PRODUTOS ');
      QRel.Sql.Add('INNER JOIN PRODUTOS ON PRODUTOS.PRODUTO_ID = POSICAO_PRODUTOS.PRODUTO_ID');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add(' (POSICAO_PRODUTOS.QUANTIDADE_C > 0) ');
      QRel.Sql.Add('AND (POSICAO_PRODUTOS.DT_MOVIMENTO = :DT_MOVIMENTO)');


      QRel.ParamByName('DT_MOVIMENTO').AsDateTime := StrTodate(data.Text);


      IF NOT CHK_TODOS.Checked Then
      Begin
        QRel.Sql.Add('AND ((PRODUTOS.TIPO_ITEM = :TIPO_ITEM)');
        QRel.Sql.Add('OR (PRODUTOS.TIPO_ITEM = :TIPO_ITEM1)');
        QRel.Sql.Add('OR (PRODUTOS.TIPO_ITEM = :TIPO_ITEM4))');
        QRel.ParamByName('TIPO_ITEM').AsString      := '00 - MERCADORIA PARA REVENDA';
        QRel.ParamByName('TIPO_ITEM1').AsString     := '01 - MATERIA PRIMA';
        QRel.ParamByName('TIPO_ITEM4').AsString     := '04 - PRODUTO ACABADO';
      End;

      QRel.Prepare;
      QRel.Open;
      QRel.First;

      while not QRel.Eof do
      Begin

      QItens.Sql.Clear;
      QItens.Sql.Add('UPDATE PRODUTOS SET SPED = 1');
      QItens.Sql.Add('WHERE');
      QItens.Sql.Add('(EMPRESA_ID = :EMPRESA_ID)');
      QItens.Sql.Add('AND (PRODUTO_ID = :PRODUTO_ID)');

      QItens.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
      QItens.ParamByName('PRODUTO_ID').AsInteger := QRel.FieldByName('PRODUTO_ID').AsInteger;

      QItens.Prepare;
      QItens.ExecSql;



      Label6.Caption := 'Marcando Produtos do inventário';
      Label3.Caption := StrZero(QRel.FieldByName('PRODUTO_ID').AsString, 6, 0);

      Application.ProcessMessages;
      QRel.Next;
      End;
    End;

    QItens.Sql.Clear;
    QItens.Sql.Add('ALTER TABLE PRODUTOS ENABLE TRIGGER PRODUTOS_UP');

    QItens.Prepare;
    QItens.ExecSql;


    try
     QItens.Sql.Clear;
     QItens.Sql.Add('ALTER TABLE PRODUTOS ENABLE TRIGGER MOBILE_SYNC_PRODUTOS');

     QItens.Prepare;
     QItens.ExecSql;
    except

    end;

    QItens.Sql.Clear;
    QItens.Sql.Add('ALTER TABLE CLIENTES ENABLE TRIGGER CLIENTES_UP');

    QItens.Prepare;
    QItens.ExecSql;




    try
    Registros_Bloco_0; // Abertura, Identificação e Referências

    Except
    on e:Exception do
        begin
          Application.MessageBox(PChar('Erro no cadastro da empresa! Verifique os dados!' + #13 +
            'Speed Fiscal Interrompido Erro: ' + e.Message), 'Erro', MB_ICONSTOP + MB_TASKMODAL);
         Abort;
        end;

    end;
    Registros_Bloco_C; // Documentos Fiscais I  – Mercadorias (ICMS/IPI)
    Registros_Bloco_D; // Documentos Fiscais II – Serviços (ICMS)
    Registros_Bloco_E; // Apuração do ICMS e do IPI
    //Registros_Blogo_G; // Controle do Crédito de ICMS do Ativo Permanente – CIAP – modelos “C” e “D”
    Registros_Bloco_H; // Inventário Físico

    if FrmPrincipal.config.FieldByName('GERAR_BLOCOK').AsString = 'True' Then
    Registros_Bloco_K; // Controle de Produção

    Registros_Bloco_1; // Outras Informações
    Registros_Bloco_9; // Controle e Encerramento do Arquivo Digital

    with ACBrSpedFiscal1 do
    begin
      DT_INI := Dtmen.Date;
      DT_FIN := Dtmai.Date;
    end;


    ACBrSpedFiscal1.SaveFileTXT;

    Application.MessageBox(PChar('O arquivo '  + edtFile.Text + ' foi criado com sucesso'), PChar(Msg_Title), mb_IconInformation);

    ShellExecute(handle,'open',PChar(edtFile.Text), '','',SW_SHOWNORMAL);

    Close;


  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;

procedure TFrmSPED_Fiscal.edtFileChange(Sender: TObject);
begin
  ACBrSPEDFiscal1.Arquivo := edtFile.Text;
end;

procedure TFrmSPED_Fiscal.Forcar_Reg_HClick(Sender: TObject);
begin

  if Forcar_Reg_h.Checked then
  Begin
    BtnExecuta.Enabled := False;
    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT DISTINCT DT_MOVIMENTO');
    QRel.Sql.Add('FROM POSICAO_PRODUTOS');
    QRel.Sql.Add('ORDER BY DT_MOVIMENTO');
    QRel.Prepare;
    QRel.Open;

    Data.Items.Clear;
    Data.Items.Add('Hoje');

    QRel.First;

    while not QRel.Eof do
    begin
      Data.Items.Add(QRel.FieldByName('DT_MOVIMENTO').AsString);
      Application.ProcessMessages;
      QRel.Next;
    end;
  BtnExecuta.Enabled := True;
  Data.Visible       := True;
  Preco.Visible      := True;
  Motivo.Visible     := True;
  Label8.Visible     := True;
  Label7.Visible     := True;
  Label11.Visible    := True;
  chk_todos.visible  := True;
  End
  Else
  Begin
  Data.Visible       := False;
  Preco.Visible      := False;
  Motivo.Visible     := False;
  Label8.Visible     := False;
  Label7.Visible     := False;
  Label11.Visible    := False;
  chk_todos.visible  := False;
  End;
end;

procedure TFrmSPED_Fiscal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmSPED_Fiscal.FormCreate(Sender: TObject);
begin
  SaveDialog1.InitialDir := ExtractFilePath(ParamStr(0));

  Laudo        := 'POL1462013';
  edtFile.Text := Laudo + Copy(DateToStr(date), 1, 2) + Copy(DateToStr(date), 4, 2) + Copy(DateToStr(date), 7, 4) +
                  Copy(TimeToStr(time), 1, 2) +  Copy(TimeToStr(time), 4, 2) + Copy(TimeToStr(time), 7, 2) + '.Txt';

  Dtmen.Date := IncMonth(StrToDate('01/' + Copy(DateToStr(date), 4, 7)),-1);
  Dtmai.Date := Ult_Dia_Mes(Dtmen.Date);

   SaveDialog1.FileName := edtFile.Text;

  if SaveDialog1.Execute then
  Begin
  ACBrSpedFiscal1.Path         := SaveDialog1.InitialDir;
  ACBrSpedFiscal1.Arquivo      := SaveDialog1.FileName;
  ACBrSPEDFiscal1.LinhasBuffer := 5000;
  edtFile.Text                 := SaveDialog1.FileName
  End;


end;

procedure TFrmSPED_Fiscal.FormShow(Sender: TObject);
begin
  if  FrmPrincipal.Config.FieldByName('GERAR_BLOCOK').AsString = 'True' then
  begin

    Label9.Visible := True;
    Label9.Caption := 'Data Bloco K';
    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT DISTINCT DT_MOVIMENTO');
    QRel.Sql.Add('FROM POSICAO_PRODUTOS');
    QRel.Sql.Add('ORDER BY DT_MOVIMENTO');
    QRel.Prepare;
    QRel.Open;

    Dt_Blocok.Items.Clear;
    Dt_Blocok.Items.Add('Hoje');

    QRel.First;

    while not QRel.Eof do
    begin
      Dt_Blocok.Items.Add(QRel.FieldByName('DT_MOVIMENTO').AsString);
      Application.ProcessMessages;
      QRel.Next;
    end;

   Dt_Blocok.Visible := True;
  end;

  if Copy(DateToStr(date),4,2) = '03' then
  begin

    IQuery.SQL.Clear;
    IQuery.SQL.Add('SELECT DISTINCT DT_MOVIMENTO FROM POSICAO_PRODUTOS WHERE DT_MOVIMENTO <= :DT_FIM ORDER BY DT_MOVIMENTO DESC' );
    IQuery.ParamByName('DT_FIM').AsDate := StrToDate('31/12/' + IntToStr(StrToInt(Copy(DateToStr(Dtmen.Date), 7, 4))-1));
    IQuery.Prepare;
    IQuery.Open();

    Preco.ItemIndex := 1;
    Motivo.ItemIndex := 0;
    Forcar_Reg_H.Checked := True;
    Data.Visible  := True;
    Preco.Visible := True;
    Motivo.Visible := True;
    Label7.Visible := True;
    Label8.Visible := True;
    Label11.Visible := True;

    Data.Items.Clear;
    Data.Items.Add(IQuery.FieldByName('DT_MOVIMENTO').AsString);
    Data.ItemIndex := 0;
  end;

end;

Procedure TFrmSPED_Fiscal.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmSPED_Fiscal.Btn_Verifica_SPEDClick(Sender: TObject);
begin
 Verifica(Dtmen.Date, Dtmai.Date);
end;

procedure TFrmSPED_Fiscal.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmSPED_Fiscal.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
   // Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;



end.
