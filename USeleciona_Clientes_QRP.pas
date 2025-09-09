unit USeleciona_Clientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, rxToolEdit, rxCurrEdit, ExtCtrls, Buttons, DB,
  IBCustomDataSet, IBQuery, QRCtrls, QuickRpt, RDprint, DBCtrls;

type
  TFrmSeleciona_Clientes = class(TForm)
    btnExecuta: TBitBtn;
    btnRetorna: TBitBtn;
    Bevel1: TBevel;
    Label1: TLabel;
    Inicio: TCurrencyEdit;
    Fim: TCurrencyEdit;
    Label2: TLabel;
    Ordem: TComboBox;
    Tipo: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    Classe: TEdit;
    QRel: TIBQuery;
    Completo_Autorizados: TQuickRep;
    QRBand1: TQRBand;
    QRSysData1: TQRSysData;
    Cabec: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    QRDBText3: TQRDBText;
    Resumido: TQuickRep;
    QRBand3: TQRBand;
    QRSysData3: TQRSysData;
    QRLabel1: TQRLabel;
    QRSysData4: TQRSysData;
    QRLabel2: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRDBText8: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRBand4: TQRBand;
    QRDBText9: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText18: TQRDBText;
    Relatorio: TComboBox;
    Label5: TLabel;
    Label6: TLabel;
    Selecao: TComboBox;
    QRLabel18: TQRLabel;
    RDprint2: TRDprint;
    municipio: TEdit;
    Label7: TLabel;
    QRBand5: TQRBand;
    QRShape2: TQRShape;
    QRBand2: TQRBand;
    QRLabel5: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel7: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel9: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText20: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText22: TQRDBText;
    QRLabel24: TQRLabel;
    QRDBText23: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText17: TQRDBText;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel22: TQRLabel;
    QRDBText21: TQRDBText;
    QRDBText19: TQRDBText;
    QRBand6: TQRBand;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    Completo: TQuickRep;
    QRBand7: TQRBand;
    QRSysData5: TQRSysData;
    QRLabel27: TQRLabel;
    QRSysData6: TQRSysData;
    QRLabel28: TQRLabel;
    QRShape5: TQRShape;
    QRDBText15: TQRDBText;
    QRBand8: TQRBand;
    QRLabel29: TQRLabel;
    QRDBText24: TQRDBText;
    QRLabel30: TQRLabel;
    QRDBText25: TQRDBText;
    QRLabel31: TQRLabel;
    QRDBText26: TQRDBText;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRDBText27: TQRDBText;
    QRLabel34: TQRLabel;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRDBText30: TQRDBText;
    QRShape6: TQRShape;
    QRDBText31: TQRDBText;
    QRExpr2: TQRExpr;
    QRLabel37: TQRLabel;
    QRDBText32: TQRDBText;
    QRLabel38: TQRLabel;
    QRDBText33: TQRDBText;
    QRLabel39: TQRLabel;
    QRDBText34: TQRDBText;
    QRLabel40: TQRLabel;
    QRDBText35: TQRDBText;
    QRLabel41: TQRLabel;
    QRDBText36: TQRDBText;
    QRLabel42: TQRLabel;
    QRDBText37: TQRDBText;
    Label8: TLabel;
    Cliente: TCurrencyEdit;
    DBText1: TDBText;
    btnCliente: TSpeedButton;
    QCliente: TIBQuery;
    DataCliente: TDataSource;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    Resumido_email: TQuickRep;
    QRBand9: TQRBand;
    QRSysData7: TQRSysData;
    QRLabel45: TQRLabel;
    QRSysData8: TQRSysData;
    QRLabel46: TQRLabel;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRDBText38: TQRDBText;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRBand10: TQRBand;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    procedure btnExecutaClick(Sender: TObject);
    procedure InicioKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ClasseKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure RelatorioChange(Sender: TObject);
    procedure btnClienteClick(Sender: TObject);
    procedure ClienteChange(Sender: TObject);
    procedure SearchCliente;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSeleciona_Clientes: TFrmSeleciona_Clientes;
  Txt_Sql: String;

procedure Sel_Cli(Sql: String);


implementation

uses
  UData, UPrincipal,UConsulta;

{$R *.dfm}

procedure Sel_Cli(Sql: String);
begin
  Txt_Sql := Sql;

  Application.CreateForm(TFrmSeleciona_Clientes, FrmSeleciona_Clientes);
  try
    FrmSeleciona_Clientes.ShowModal;
  finally
    FrmSeleciona_Clientes.Release;
  end;
end;
procedure TFrmSeleciona_Clientes.SearchCliente;
begin
  QCliente.Close;
  QCliente.ParamByName('CLIENTE_ID').AsInteger := StrToInt(Cliente.Text);
  QCliente.Prepare;
  QCliente.Open;
end;



procedure TFrmSeleciona_Clientes.btnClienteClick(Sender: TObject);
begin
  try
    Cliente.Value := GetConsulta('CLIENTES', 0, 0, StrToInt(Cliente.Text));
  except
    Cliente.Value := GetConsulta('CLIENTES', 0, 0, 0);
  end;

end;

procedure TFrmSeleciona_Clientes.btnExecutaClick(Sender: TObject);
var
Linha,Etiquetas_Impressas: Integer;

begin
// 229, 318
  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    QRel.Sql.Clear;

    if Selecao.Text = 'Atual' then
    begin
      QRel.Sql.Add('SELECT CLIENTES.* , AUTORIZADOS.NOME AUTORIZADOS');
      QRel.Sql.Add('FROM CLIENTES');
      QRel.Sql.Add('LEFT JOIN AUTORIZADOS ON AUTORIZADOS.CLIENTE_ID =  CLIENTES.CLIENTE_ID');
      QRel.Sql.Add('WHERE');

      if Relatorio.Text = 'Completo com Autorizados' then
         QRel.Sql.Add('(CLIENTES.CLIENTE_ID  = :CLIENTE_ID)')
      Else
         QRel.Sql.Add('(CLIENTES.CLIENTE_ID BETWEEN :INICIO AND :FIM)');

      if Tipo.Text = 'Pessoa Física' then
      begin
        QRel.Sql.Add('AND (TIPO_CLIENTE = :TIPO_CLIENTE)');

        QRel.ParamByName('TIPO_CLIENTE').AsString := 'PESSOA FÍSICA';
      end;

      if Tipo.Text = 'Pessoa Jurídica' then
      begin
        QRel.Sql.Add('AND (TIPO_CLIENTE = :TIPO_CLIENTE)');

        QRel.ParamByName('TIPO_CLIENTE').AsString := 'PESSOA JURÍDICA';
      end;

      if Municipio.Text <> '' then
      begin
        QRel.Sql.Add('AND (MUNICIPIO = :MUNICIPIO)');
        QRel.ParamByName('MUNICIPIO').AsString := Municipio.Text;
      end;

      if Classe.Text <> '' then
      begin
        QRel.Sql.Add('AND (TIPO = :TIPO)');
        QRel.ParamByName('TIPO').AsString := Classe.Text;
      end;

      if Relatorio.Text = 'Resumido - Email' then
      begin
        QRel.Sql.Add('AND (EMAIL <> :EMAIL)');
        QRel.ParamByName('EMAIL').AsString := '';
      end;


      QRel.Sql.Add('AND (STATUS = :STATUS)');

      if Relatorio.Text = 'Completo com Autorizados' then
      QRel.ParamByName('CLIENTE_ID').AsInteger := StrToInt(CLIENTE.Text)
      Else
      Begin
      QRel.ParamByName('INICIO').AsInteger := StrToInt(Inicio.Text);
      QRel.ParamByName('FIM').AsInteger    := StrToInt(Fim.Text);
      End;
      QRel.ParamByName('STATUS').AsString  := 'A';

      if Ordem.Text = 'Alfabética' then
        QRel.Sql.Add('ORDER BY CLIENTES.NOME')
      else
        QRel.Sql.Add('ORDER BY CLIENTES.CLIENTE_ID');

      if Relatorio.Text = 'Completo com Autorizados' then
      QRel.ParamByName('CLIENTE_ID').AsInteger := StrToInt(CLIENTE.Text);
    end

    else
    QRel.Sql.Text := Txt_Sql;
    QRel.Prepare;
    QRel.Open;

    if not QRel.IsEmpty then
    begin
      if Relatorio.Text = 'Completo' then
        Completo.PreviewModal
      else if Relatorio.Text = 'Completo com Autorizados' then
        Completo_autorizados.PreviewModal
      else if Relatorio.Text = 'Resumido - Email' then
        Resumido_EMAIL.PreviewModal
      else if Relatorio.Text = 'Resumido' then
        Resumido.PreviewModal
      else if Relatorio.Text = 'Etiqueta' then
      begin
        Linha := 3;

        RDPrint2.Abrir;
        RDprint2.FonteTamanhoPadrao := S05cpp;
        QRel.First;
        while not QRel.Eof do
        begin
          RDPrint2.Impf(Linha + 1, 03, QRel.FieldByName('NOME').AsString, [comp12]);
          RDPrint2.Imp(Linha + 2, 03, QRel.FieldByName('ENDERECO').AsString + ', ' + QRel.FieldByName('NUMERO').AsString);
          RDPrint2.Imp(Linha + 3, 03, QRel.FieldByName('MUNICIPIO').AsString + ' - ' + QRel.FieldByName('ESTADO').AsString);
          RDPrint2.Imp(Linha + 4, 03, QRel.FieldByName('CEP').AsString);
          RDPrint2.Impf(Linha + 5, 28, 'Código: ' + QRel.FieldByName('CLIENTE_ID').AsString, [comp20]);

          QRel.Next;

          if not QRel.Eof then
          begin
            RDPrint2.Impf(Linha + 1, 43, QRel.FieldByName('NOME').AsString, [comp12]);
            RDPrint2.Imp(Linha + 2, 43, QRel.FieldByName('ENDERECO').AsString + ', ' + QRel.FieldByName('NUMERO').AsString);
            RDPrint2.Imp(Linha + 3, 43, QRel.FieldByName('MUNICIPIO').AsString + ' - ' + QRel.FieldByName('ESTADO').AsString);
            RDPrint2.Impf(Linha + 4, 43, QRel.FieldByName('CEP').AsString, [negrito]);
            RDPrint2.Impf(Linha + 5, 68, 'Código: ' + QRel.FieldByName('CLIENTE_ID').AsString, [comp20]);

            QRel.Next;
          end;

          Linha := Linha + 6;

          if Linha >= 62 then
          begin
            RDPrint2.Novapagina;
            Linha := 3;
          end;
        end;

        RDPrint2.Fechar;
      end
      else if Relatorio.Text = 'Etiqueta Personalizada' then
       begin
          try
            RDprint2.OpcoesPreview.Preview       := True;
            RDprint2.OpcoesPreview.PaginaZebrada := True;
            RDprint2.MostrarProgresso            := True;
            RDprint2.Acentuacao                  := SemAcento;

            RDprint2.Impressora := HP;

            if LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Fonte') = '' then
            RDprint2.FonteTamanhoPadrao := S12cpp;

            if LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Fonte') = '05' then
            RDprint2.FonteTamanhoPadrao := S05cpp;

            if LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Fonte') = '10' then
            RDprint2.FonteTamanhoPadrao := S10cpp;

            if LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Fonte') = '17' then
            RDprint2.FonteTamanhoPadrao := S17cpp;

            if LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Fonte') = '20' then
            RDprint2. FonteTamanhoPadrao := S20cpp;

            RDprint2.TamanhoQteLinhas   :=StrToInt(LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Quantidade de Linhas'));
            RDprint2.TamanhoQteColunas  := StrToInt(LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Quantidade de Colunas'));

            if LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Polegadas LPP') = '' then
            RDprint2.TamanhoQteLPP      := Seis
            Else
            RDprint2.TamanhoQteLPP      := Oito;

            RDprint2.Margens.Top        := StrToInt(LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Margem Superior'));
            RDprint2.Margens.Bottom     := StrToInt(LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Margem Inferior'));
            RDprint2.Margens.Left       := StrToInt(LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Margem Esquerda'));
            RDprint2.Margens.Right      := StrToInt(LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Margem Direita'));
          except

          end;

          Linha               := 3;
          Etiquetas_Impressas := 0;
          RDprint2.Abrir;

          QRel.First;
          while not QRel.Eof do
          begin

            RDprint2.Imp(Linha + StrToInt(LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Linha 1')), StrToInt(LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Nome (Coluna 1)')), Copy(QRel.FieldByName('NOME').AsString,1,30));
            RDprint2.Imp(Linha + StrToInt(LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Linha 2')), StrToInt(LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Endereço (Coluna 1)')), Copy(QRel.FieldByName('ENDERECO').AsString,1,30));
            RDprint2.Imp(Linha + StrToInt(LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Linha 2')), StrToInt(LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Número (Coluna 1)')), QRel.FieldByName('NUMERO').AsString);
            RDprint2.Imp(Linha + StrToInt(LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Linha 3')), StrToInt(LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Bairro (Coluna 1)')), Copy(QRel.FieldByName('BAIRRO').AsString,1,20));
            RDprint2.Imp(Linha + StrToInt(LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Linha 4')), StrToInt(LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Municipio (Coluna 1)')), Copy(QRel.FieldByName('MUNICIPIO').AsString,1,20));
            RDprint2.Imp(Linha + StrToInt(LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Linha 4')), StrToInt(LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Estado (Coluna 1)')), QRel.FieldByName('ESTADO').AsString);
            RDprint2.Imp(Linha + StrToInt(LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Linha 5')), StrToInt(LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Cep (Coluna 1)')), QRel.FieldByName('CEP').AsString);

            Application.ProcessMessages;
            QRel.Next;

            if LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Colunas') > '1' then
            begin
              if not QRel.Eof then
              begin

              RDprint2.Imp(Linha + StrToInt(LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Linha 1')), StrToInt(LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Nome (Coluna 2)')), Copy(QRel.FieldByName('NOME').AsString,1,30));
              RDprint2.Imp(Linha + StrToInt(LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Linha 2')), StrToInt(LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Endereço (Coluna 2)')), Copy(QRel.FieldByName('ENDERECO').AsString,1,30));
              RDprint2.Imp(Linha + StrToInt(LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Linha 2')), StrToInt(LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Número (Coluna 2)')), QRel.FieldByName('NUMERO').AsString);
              RDprint2.Imp(Linha + StrToInt(LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Linha 3')), StrToInt(LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Bairro (Coluna 2)')), Copy(QRel.FieldByName('BAIRRO').AsString,1,20));
              RDprint2.Imp(Linha + StrToInt(LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Linha 4')), StrToInt(LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Municipio (Coluna 2)')), Copy(QRel.FieldByName('MUNICIPIO').AsString,1,20));
              RDprint2.Imp(Linha + StrToInt(LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Linha 4')), StrToInt(LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Estado (Coluna 2)')), QRel.FieldByName('ESTADO').AsString);
              RDprint2.Imp(Linha + StrToInt(LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Linha 5')), StrToInt(LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Cep (Coluna 2)')), QRel.FieldByName('CEP').AsString);

                Application.ProcessMessages;
                QRel.Next;
              end;
            end;

            if LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Colunas') > '2' then
            begin
              if not QRel.Eof then
              begin

              RDprint2.Imp(Linha + StrToInt(LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Linha 1')), StrToInt(LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Nome (Coluna 3)')), Copy(QRel.FieldByName('NOME').AsString,1,30));
              RDprint2.Imp(Linha + StrToInt(LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Linha 2')), StrToInt(LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Endereço (Coluna 3)')), Copy(QRel.FieldByName('ENDERECO').AsString,1,30));
              RDprint2.Imp(Linha + StrToInt(LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Linha 2')), StrToInt(LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Número (Coluna 3)')), QRel.FieldByName('NUMERO').AsString);
              RDprint2.Imp(Linha + StrToInt(LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Linha 3')), StrToInt(LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Bairro (Coluna 3)')), Copy(QRel.FieldByName('BAIRRO').AsString,1,20));
              RDprint2.Imp(Linha + StrToInt(LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Linha 4')), StrToInt(LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Municipio (Coluna 3)')), Copy(QRel.FieldByName('MUNICIPIO').AsString,1,20));
              RDprint2.Imp(Linha + StrToInt(LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Linha 4')), StrToInt(LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Estado (Coluna 3)')), QRel.FieldByName('ESTADO').AsString);
              RDprint2.Imp(Linha + StrToInt(LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Linha 5')), StrToInt(LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Cep (Coluna 3)')), QRel.FieldByName('CEP').AsString);

              Application.ProcessMessages;
              QRel.Next;
              end;
            end;

            Linha := (Linha + StrToInt(LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Linha 5')) + StrToInt(LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Salto de Linhas')));

            Inc(Etiquetas_Impressas);

            if Etiquetas_Impressas =  StrToInt(LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Linhas de Etiquetas')) then
            begin
              Linha               := 3;
              Etiquetas_Impressas := 0;

              RDprint2.Novapagina;

            end;
          end;

          RDprint2.Fechar;
        end;

    end
    else
      Application.MessageBox('Não há dados para os parâmetros informados', PChar(Msg_Title), mb_IconStop);
  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;

procedure TFrmSeleciona_Clientes.ClasseKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);
  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmSeleciona_Clientes.ClienteChange(Sender: TObject);
begin
  if Cliente.Value > 0 then
    SearchCliente;
end;

procedure TFrmSeleciona_Clientes.InicioKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmSeleciona_Clientes.RelatorioChange(Sender: TObject);
begin
if Relatorio.Text = 'Completo com Autorizados' then
  Begin
   label8.Visible     := True;
   Cliente.Visible    := True;
   btnCliente.Visible := True;
   btncliente.Visible := True;
   Selecao.Text       := 'Atual';
   DBtext1.Visible    := True;
   Selecao.Enabled    := False;
  End
  Else
  Begin
   label8.Visible     := False;
   Cliente.Visible    := False;
   btnCliente.Visible := False;
   btncliente.Visible := False;
   DBtext1.Visible    := False;
   Selecao.Enabled    := True;

  End;


end;

end.
