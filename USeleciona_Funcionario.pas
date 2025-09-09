unit USeleciona_Funcionario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, rxToolEdit, rxCurrEdit, ExtCtrls, Buttons, DB,
  IBCustomDataSet, IBQuery, QRCtrls, QuickRpt, RDprint, DBCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmSeleciona_Funcionario = class(TForm)
    btnExecuta: TBitBtn;
    btnRetorna: TBitBtn;
    Bevel1: TBevel;
    Label1: TLabel;
    Inicio: TCurrencyEdit;
    Fim: TCurrencyEdit;
    Label2: TLabel;
    Ordem: TComboBox;
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
    QRBand4: TQRBand;
    QRDBText9: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText16: TQRDBText;
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
    QRLabel36: TQRLabel;
    QRDBText30: TQRDBText;
    QRShape6: TQRShape;
    QRDBText31: TQRDBText;
    QRExpr2: TQRExpr;
    QRLabel38: TQRLabel;
    QRDBText33: TQRDBText;
    QRLabel40: TQRLabel;
    QRDBText35: TQRDBText;
    QRLabel41: TQRLabel;
    QRDBText36: TQRDBText;
    Label8: TLabel;
    Funcionario: TCurrencyEdit;
    DBText1: TDBText;
    btnCliente: TSpeedButton;
    DataCliente: TDataSource;
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
    CheckBox1: TCheckBox;
    RDprint1: TRDprint;
    Label9: TLabel;
    Filtrar_por_id: TEdit;
    QCliente: TFDQuery;
    QRel: TFDQuery;
    QFuncionario: TFDQuery;
    DataFuncionario: TDataSource;
    QRLabel35: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText13: TQRDBText;
    procedure btnExecutaClick(Sender: TObject);
    procedure InicioKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ClasseKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure RelatorioChange(Sender: TObject);
    procedure btnClienteClick(Sender: TObject);
    procedure FuncionarioChange(Sender: TObject);
    procedure SearchCliente;
    procedure RDprint1NewPage(Sender: TObject; Pagina: Integer);
    procedure FormCreate(Sender: TObject);
    procedure Filtrar_por_idKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSeleciona_Funcionario: TFrmSeleciona_Funcionario;
  Txt_Sql: String;
  Pagina, line: Integer;

procedure Sel_Func(Sql: String);


implementation

uses
  UData, UPrincipal,UConsulta;

{$R *.dfm}

procedure Sel_Func(Sql: String);
begin
  Txt_Sql := Sql;

  Application.CreateForm(TFrmSeleciona_Funcionario, FrmSeleciona_Funcionario);
  try
    FrmSeleciona_Funcionario.ShowModal;
  finally
    FrmSeleciona_Funcionario.Release;
  end;
end;
procedure TFrmSeleciona_Funcionario.SearchCliente;
begin
  QFuncionario.Close;
  QFuncionario.ParamByName('FUNCIONARIO_ID').AsInteger := StrToInt(Funcionario.Text);
  QFuncionario.Prepare;
  QFuncionario.Open;
end;



procedure TFrmSeleciona_Funcionario.btnClienteClick(Sender: TObject);
begin
  try
    Funcionario.Value := GetConsulta('PESSOAL', 0, 0, StrToInt(Funcionario.Text));
  except
    Funcionario.Value := GetConsulta('PESSOAL', 0, 0, 0);
  end;

end;

procedure TFrmSeleciona_Funcionario.btnExecutaClick(Sender: TObject);
var
Linha,Etiquetas_Impressas: Integer;

begin

  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    QRel.Sql.Clear;

    if Selecao.Text = 'Atual' then
    begin
      QRel.Sql.Add('SELECT FUNCIONARIOS.* ');
      QRel.Sql.Add('FROM FUNCIONARIOS');
      QRel.Sql.Add('WHERE');



        if (Filtrar_por_id.Text <> '') then
           QRel.Sql.Add('(FUNCIONARIOS.FUNCIONARIO_ID IN (' +Filtrar_por_id.Text+ '))')
        else
        Begin

          if Relatorio.Text <> 'Completo com Autorizados'  then
          Begin
           QRel.Sql.Add('(FUNCIONARIOS.FUNCIONARIO_ID BETWEEN :INICIO AND :FIM)');
           QRel.ParamByName('INICIO').AsInteger := StrToInt(Inicio.Text);
           QRel.ParamByName('FIM').AsInteger    := StrToInt(Fim.Text);
          End;
        End;


        if Relatorio.Text = 'Completo com Autorizados' then
         Begin

          if StrToInt(FUNCIONARIO.Text) <> 0 then
          Begin
            QRel.Sql.Add('(FUNCIONARIOS.FUNCIONARIO_ID  = :FUNCIONARIO_ID)');
            QRel.ParamByName('FUNCIONARIO_ID').AsInteger := StrToInt(FUNCIONARIO.Text);
          End
          Else if (StrToInt(FUNCIONARIO.Text) = 0) AND (Filtrar_por_id.Text = '') then
            Begin
              QRel.Sql.Add('(FUNCIONARIOS.FUNCIONARIO_ID BETWEEN :INICIO AND :FIM)');
              QRel.ParamByName('INICIO').AsInteger := StrToInt(Inicio.Text);
              QRel.ParamByName('FIM').AsInteger    := StrToInt(Fim.Text);
            End


         End;


      if Municipio.Text <> '' then
      begin
        QRel.Sql.Add('AND (MUNICIPIO = :MUNICIPIO)');
        QRel.ParamByName('MUNICIPIO').AsString := Municipio.Text;
      end;


      if Relatorio.Text = 'Resumido - Email' then
      begin
        QRel.Sql.Add('AND (EMAIL <> :EMAIL)');
        QRel.ParamByName('EMAIL').AsString := '';
      end;


      QRel.Sql.Add('AND (STATUS = :STATUS)');
      QRel.ParamByName('STATUS').AsString  := 'A';

      if Ordem.Text = 'Alfabética' then
        QRel.Sql.Add('ORDER BY FUNCIONARIOS.NOME')
      else
        QRel.Sql.Add('ORDER BY FUNCIONARIOS.FUNCIONARIO_ID');


    // QRel.SQL.SaveToFile('C:\consulta_sql.sql');

    end
    else
    QRel.Sql.Text := Txt_Sql;
    QRel.Prepare;
    QRel.Open;



    if not QRel.IsEmpty then
    begin
      if Relatorio.Text = 'Completo' then
      Completo.PreviewModal;
     {   Begin
         if CheckBox1.Checked = True then
           Begin
            RDprint1.Impressora := HP;
            RDprint1.FonteTamanhoPadrao := S10cpp;
           End;


        RDprint1.TamanhoQteColunas:=130;
        RDprint1.OpcoesPreview.Preview     := True;
        RDprint1.MostrarProgresso          := True;
        RDprint1.Acentuacao                := SemAcento;
        RDprint1.TamanhoQteLinhas          := 1;
        RDprint1.Abrir;

            if line > 66 then
             begin
              RDprint1.novapagina;
              Pagina := Pagina + 1;
             end;

      Pagina:= 1;

      QRel.First;
      while not QRel.Eof do
      Begin
        RDprint1.Imp(line, 01, 'Nome: '+ QRel.FieldByName('NOME').AsString);
        RDprint1.Imp(line, 120, 'ID ' + QRel.FieldByName('FUNCIONARIO_ID').AsString);

        Inc(line);
        RDprint1.Imp(line, 01, 'Endereço: ' + QRel.FieldByName('ENDERECO').AsString + ', ' + QRel.FieldByName('NUMERO').AsString);
        RDprint1.Imp(line, 80, 'Telefone: ' + QRel.FieldByName('TELEFONE').AsString);

        Inc(line);
        RDprint1.Imp(line,01, 'Município: ' + QRel.FieldByName('MUNICIPIO').AsString);
        RDprint1.Imp(line, 80, 'CPF: ' + QRel.FieldByName('CPF').AsString);

        Inc(line);
        RDprint1.Imp(line, 01, 'Carteira: ' + QRel.FieldByName('CTPS').AsString);
        RDprint1.Imp(line, 80, 'Pis: ' + QRel.FieldByName('PIS').AsString);



        Inc(line);
        RDprint1.Imp(line, 01, 'E-mail: ' + QRel.FieldByName('EMAIL').AsString);
       // RDprint1.Imp(line, 80, 'Identidade: ' + QRel.FieldByName('INSCRICAO').AsString);

        Inc(line);
        RDprint1.Imp(line, 01, 'Data Admissão: ' + QRel.FieldByName('DT_ADMISSAO').AsString);
        Inc(line);
        Inc(line);

        RDprint1.impF(line, 01, 'Assinatura Responsável:__________________________________________________________________________________________________ ',[negrito]);
        Inc(line);
        Inc(line);
        RDprint1.LinhaH(line,01,130,0,false);
        Inc(line);
        Inc(line);



       if line > 54 then
             begin
              RDprint1.novapagina;
              Pagina := Pagina + 1;
             end;

      Inc(line);
      QRel.Next;
      End;

      Application.ProcessMessages;
      RDprint1.TamanhoQteLinhas:= 66;
      RDprint1.Fechar;

      End
      }

       if Relatorio.Text = 'Completo com Autorizados' then
        Completo_autorizados.PreviewModal;
        {Begin
          if CheckBox1.Checked = True then
           Begin
            RDprint1.Impressora := HP;
            RDprint1.FonteTamanhoPadrao := S10cpp;
           End;


        RDprint1.TamanhoQteColunas:=130;
        RDprint1.OpcoesPreview.Preview     := True;
        RDprint1.MostrarProgresso          := True;
        RDprint1.Acentuacao                := SemAcento;
        RDprint1.TamanhoQteLinhas          := 1;
        RDprint1.Abrir;

            if line > 66 then
             begin
              RDprint1.novapagina;
              Pagina := Pagina + 1;
             end;

      Pagina:= 1;


      QRel.First;
      while not QRel.Eof do
      Begin

      RDprint1.Imp(line, 01, 'Nome: '+ QRel.FieldByName('NOME').AsString);
        RDprint1.Imp(line, 120, 'ID ' + QRel.FieldByName('FUNCIONARIO_ID').AsString);

        Inc(line);
        RDprint1.Imp(line, 01, 'Endereço: ' + QRel.FieldByName('ENDERECO').AsString + ', ' + QRel.FieldByName('NUMERO').AsString);
        RDprint1.Imp(line, 80, 'Telefone: ' + QRel.FieldByName('TELEFONE').AsString);

        Inc(line);
        RDprint1.Imp(line,01, 'Município: ' + QRel.FieldByName('MUNICIPIO').AsString);


        Inc(line);
        RDprint1.Imp(line, 01, 'PIS: ' + QRel.FieldByName('PIS').AsString);
        RDprint1.Imp(line, 80, 'CPF: ' + QRel.FieldByName('CPF').AsString);



        Inc(line);
        RDprint1.Imp(line, 01, 'E-mail: ' + QRel.FieldByName('EMAIL').AsString);
        RDprint1.Imp(line, 80, 'Identidade: ' + QRel.FieldByName('RG').AsString);

        Inc(line);
        RDprint1.Imp(line, 01, 'Data Admissão: ' + QRel.FieldByName('DT_ADMISSAO').AsString);
        Inc(line);
        Inc(line);

        RDprint1.impF(line, 01, 'Assinatura Responsável:__________________________________________________________________________________________________ ',[negrito]);
        Inc(line);
        Inc(line);
        RDprint1.LinhaH(line,01,130,0,false);
        Inc(line);
        Inc(line);
      Inc(line);
      QRel.Next;
      End;



      Application.ProcessMessages;
      RDprint1.TamanhoQteLinhas:= 66;
      RDprint1.Fechar;

      End
     }
       if Relatorio.Text = 'Resumido - Email' then
       Resumido_EMAIL.PreviewModal;
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
       { Begin
          if CheckBox1.Checked = True then
           Begin
            RDprint1.Impressora := HP;
            RDprint1.FonteTamanhoPadrao := S10cpp;
           End;


        RDprint1.TamanhoQteColunas:=130;
        RDprint1.OpcoesPreview.Preview     := True;
        RDprint1.MostrarProgresso          := True;
        RDprint1.Acentuacao                := SemAcento;
        RDprint1.TamanhoQteLinhas          := 1;
        RDprint1.Abrir;

            if line > 64 then
             begin
              RDprint1.novapagina;
              Pagina := Pagina + 1;
             end;

       Pagina:= 1;

        while not QRel.Eof do
        Begin

          if Length(QRel.FieldByName('EMAIL').AsString) > 3 then
          Begin
          RDprint1.ImpD(line, 08, QRel.FieldByName('FUNCIONARIO_ID').AsString,[]);
          RDprint1.Imp(line, 11, QRel.FieldByName('NOME').AsString);
          RDprint1.Imp(line, 80, QRel.FieldByName('EMAIL').AsString);

          Inc(line);
          if line > 64 then
                 begin
                 RDprint1.novapagina;
                 Pagina := Pagina + 1;
                 end;

          End;
          QRel.Next;
        End;



        Application.ProcessMessages;
        RDprint1.TamanhoQteLinhas:= 66;
        RDprint1.Fechar;
       End
        }


       if Relatorio.Text = 'Resumido' then
       Resumido.PreviewModal;
      {  Begin
           if CheckBox1.Checked = True then
           Begin
            RDprint1.Impressora := HP;
            RDprint1.FonteTamanhoPadrao := S10cpp;
           End;


        RDprint1.TamanhoQteColunas:=130;
        RDprint1.OpcoesPreview.Preview     := True;
        RDprint1.MostrarProgresso          := True;
        RDprint1.Acentuacao                := SemAcento;
        RDprint1.TamanhoQteLinhas          := 1;
        RDprint1.Abrir;

            if line > 66 then
             begin
              RDprint1.novapagina;
              Pagina := Pagina + 1;
             end;

      Pagina:= 1;

      while not QRel.Eof do
      Begin
        RDprint1.ImpD(line, 09, QRel.FieldByName('FUNCIONARIO_ID').AsString, []);
        RDprint1.Imp(line, 11, Copy(QRel.FieldByName('NOME').AsString, 1, 48));
        RDprint1.Imp(line, 66, QRel.FieldByName('TELEFONE').AsString);
        RDprint1.Imp(line, 81, QRel.FieldByName('CPF').AsString);



        if line > 64 then
             begin
              RDprint1.novapagina;
              Pagina := Pagina + 1;
             end;

        Inc(line);
        QRel.Next;
      End;


      Application.ProcessMessages;
      RDprint1.TamanhoQteLinhas:= 66;
      RDprint1.Fechar;

        End

       }
      if Relatorio.Text = 'Etiqueta' then
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
          RDPrint2.Impf(Linha + 5, 28, 'Código: ' + QRel.FieldByName('FUNCIONARIO_ID').AsString, [comp20]);

          QRel.Next;

          if not QRel.Eof then
          begin
            RDPrint2.Impf(Linha + 1, 43, QRel.FieldByName('NOME').AsString, [comp12]);
            RDPrint2.Imp(Linha + 2, 43, QRel.FieldByName('ENDERECO').AsString + ', ' + QRel.FieldByName('NUMERO').AsString);
            RDPrint2.Imp(Linha + 3, 43, QRel.FieldByName('MUNICIPIO').AsString + ' - ' + QRel.FieldByName('ESTADO').AsString);
            RDPrint2.Impf(Linha + 4, 43, QRel.FieldByName('CEP').AsString, [negrito]);
            RDPrint2.Impf(Linha + 5, 68, 'Código: ' + QRel.FieldByName('FUNCIONARIO_ID').AsString, [comp20]);

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

procedure TFrmSeleciona_Funcionario.RDprint1NewPage(Sender: TObject;
  Pagina: Integer);
begin
    if Relatorio.Text = 'Completo' then
    Begin
    RDprint1.Imp(01, 01, FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString);
    RDprint1.ImpDir(01, (length(FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString)), 130, 'Sistema de Automação de empresas Eficaz', []);
    RDprint1.Imp(02, 01, 'Data/Hora: ' + DateToStr(date) + ' - ' + TimeToStr(now));
    RDprint1.impDir(02, 80, 130, 'Página: ' + IntToStr(Pagina), []);
    RDprint1.impC(03, 66, '*** RELATÓRIO DE CLIENTES ***',[negrito]);
    RDprint1.LinhaH(04,01,130,0,false);
    RDprint1.LinhaH(04,01,130,0,false);
    line := 05;
    End
    else if Relatorio.Text = 'Completo com Autorizados' then
    Begin
    RDprint1.Imp(01, 01, FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString);
    RDprint1.ImpDir(01, (length(FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString)), 130, 'Sistema de Automação de empresas Eficaz', []);
    RDprint1.Imp(02, 01, 'Data/Hora: ' + DateToStr(date) + ' - ' + TimeToStr(now));
    RDprint1.impDir(02, 80, 130, 'Página: ' + IntToStr(Pagina), []);
    RDprint1.impC(03, 66, '*** RELATÓRIO DE CLIENTES ***',[negrito]);
    RDprint1.LinhaH(04,01,130,0,false);
    RDprint1.LinhaH(04,01,130,0,false);
    line := 05;
    End
    else if Relatorio.Text = 'Resumido' then
    Begin
    RDprint1.Imp(01, 01, FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString);
    RDprint1.ImpDir(01, (length(FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString)), 130, 'Sistema de Automação de empresas Eficaz', []);
    RDprint1.Imp(02, 01, 'Data/Hora: ' + DateToStr(date) + ' - ' + TimeToStr(now));
    RDprint1.impDir(02, 80, 130, 'Página: ' + IntToStr(Pagina), []);
    RDprint1.impC(03, 66, '*** RELATÓRIO DE FUNCIONÁRIOS ***',[negrito]);
    RDprint1.LinhaH(04,01,130,0,false);
    RDprint1.Imp(05, 07, 'ID');
    RDprint1.Imp(05, 11, 'Nome');
    RDprint1.Imp(05, 66, 'Tel');
    RDprint1.Imp(05, 81, 'CPF');
    RDprint1.LinhaH(06,01,130,0,false);
    line := 07;
    End
    else if Relatorio.Text = 'Resumido - Email' then
    Begin
    RDprint1.Imp(01, 01, FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString);
    RDprint1.ImpDir(01, (length(FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString)), 130, 'Sistema de Automação de empresas Eficaz', []);
    RDprint1.Imp(02, 01, 'Data/Hora: ' + DateToStr(date) + ' - ' + TimeToStr(now));
    RDprint1.impDir(02, 80, 130, 'Página: ' + IntToStr(Pagina), []);
    RDprint1.impC(03, 63, '*** RELATÓRIO DE FUNCIONÁRIOS  - RESUMIDO EMAIL ***',[negrito]);
    RDprint1.LinhaH(04,01,130,0,false);
    RDprint1.Imp(05, 06, 'ID');
    RDprint1.Imp(05, 11, 'Nome');
    RDprint1.Imp(05, 80, 'E-mail');
    RDprint1.LinhaH(06,01,130,0,false);
    line := 07;
    End;
end;

procedure TFrmSeleciona_Funcionario.ClasseKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);
  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmSeleciona_Funcionario.FuncionarioChange(Sender: TObject);
begin
  if Funcionario.Value > 0 then
     SearchCliente;
end;

procedure TFrmSeleciona_Funcionario.Filtrar_por_idKeyPress(Sender: TObject; var Key: Char);
begin
    if not (key in ['0'..'9',',', #8]) then
    key := #0;
 end;

procedure TFrmSeleciona_Funcionario.FormCreate(Sender: TObject);
begin
  QRLabel18.Visible := False;
end;

procedure TFrmSeleciona_Funcionario.InicioKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;


procedure TFrmSeleciona_Funcionario.RelatorioChange(Sender: TObject);
begin
if Relatorio.Text = 'Completo com Autorizados' then
  Begin
   label8.Visible     := True;
   Funcionario.Visible    := True;
   btnCliente.Visible := True;
   btncliente.Visible := True;
   Selecao.Text       := 'Atual';
   DBtext1.Visible    := True;
   Selecao.Enabled    := False;
  End
  Else
  Begin
   label8.Visible     := False;
   Funcionario.Visible    := False;
   btnCliente.Visible := False;
   btncliente.Visible := False;
   DBtext1.Visible    := False;
   Selecao.Enabled    := True;

  End;

  if Relatorio.Text <> 'Resumido - Email' then
    Label2.Caption := 'Ordem'
  else
    Label2.Caption := 'Email';





end;

end.
