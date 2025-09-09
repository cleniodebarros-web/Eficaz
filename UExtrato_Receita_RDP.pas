unit UExtrato_Receita_RDP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, rxCurrEdit, rxToolEdit, Buttons, DBTables,
  DB, IBCustomDataSet, IBQuery, QRCtrls, QuickRpt, RDprint, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmExtrato_Receita_RDP = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    Dtmen: TDateEdit;
    Conta: TCurrencyEdit;
    Dtmai: TDateEdit;
    btnConta: TSpeedButton;
    DataConta: TDataSource;
    Fluxo: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    QRDBText3: TQRDBText;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    Cabec: TQRLabel;
    QRSysData2: TQRSysData;
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    QRLabel10: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRGroup1: TQRGroup;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText4: TQRDBText;
    QRShape4: TQRShape;
    QRExpr2: TQRExpr;
    QRBand1: TQRBand;
    QRShape2: TQRShape;
    QRExpr1: TQRExpr;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    RDprint1: TRDprint;
    CheckBox1: TCheckBox;
    QConta: TFDQuery;
    QRel: TFDQuery;
    Table_Temp: TFDMemTable;
    procedure btnRetornaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnContaClick(Sender: TObject);
    procedure ContaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ContaChange(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure DtmenEnter(Sender: TObject);
    procedure RDprint1NewPage(Sender: TObject; Pagina: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SearchConta;
    procedure totalQuebra;
    procedure quebraConta;
  end;

var
  FrmExtrato_Receita_RDP: TFrmExtrato_Receita_RDP;
  linha, pagina: integer;
  totalGeral,subtotal: Real;
  contaQuebra, NomeConta: String;

implementation

uses
  UConsulta, UPrincipal, UData;

{$R *.dfm}

procedure TFrmExtrato_Receita_RDP.totalQuebra;
begin
  if contaQuebra = 'forca quebra' then
    begin
      contaQuebra:= Qrel.FieldByName('DESCRICAO').AsString;
      exit;
    end;

    if linha > 61 then
        begin
        RDprint1.Novapagina;
        quebraConta;
        end
     else
        begin
        RDprint1.LinhaH(linha,01,120,0,false);
        inc(linha);
        end;

     RDprint1.impf  (linha,01,'Valor total=> ',[negrito]);
     RDprint1.impval(linha,10,'###,###,##0.00',subtotal,[negrito]);
     inc(linha);

     // atualizo variaveis de controle da quebra...
     contaQuebra := Qrel.FieldByName('DESCRICAO').AsString;
     subtotal := 0;
end;

procedure TFrmExtrato_Receita_RDP.quebraConta;
begin
  if linha > 59 then
  Begin
       RDprint1.Novapagina;
       RDprint1.LinhaH(linha,01,120,0,false);
       inc(linha);
       RDprint1.impf(linha,1,'Descrição conta: ' + Copy(Qrel.FieldByName('DESCRICAO').AsString, 1, 40),[negrito]);
       inc(linha);
       RDprint1.LinhaH(linha,01,120,0,false);
       inc(linha);
  End;
end;

procedure TFrmExtrato_Receita_RDP.SearchConta;
begin
  QConta.Close;
  QConta.ParamByName('TABELA_ID').AsInteger := StrToInt(Conta.Text);
  QConta.Prepare;
  QConta.Open;
end;

procedure TFrmExtrato_Receita_RDP.btnContaClick(Sender: TObject);
begin
  try
    Conta.Value := GetConsulta('CONTAS', 0, 0, StrToInt(Conta.Text));
  except
    Conta.Value := GetConsulta('CONTAS', 0, 0, 0);
  end;
end;

procedure TFrmExtrato_Receita_RDP.btnExecutaClick(Sender: TObject);
var
Temp_Name: String;
begin
  try
    {try
      with Table_Temp do
      begin
        DatabaseName := ExtractFilePath(ParamStr(0));
        Temp_Name    := Copy(TimeToStr(time), 1, 2) + Copy(TimeToStr(time), 4, 2) + Copy(TimeToStr(time), 7, 2);
        TableName    := Temp_Name;

        with FieldDefs do
        begin
          Clear;
          Add('ID', ftAutoInc, 0, False);
          Add('CONTA', ftString, 20, False);
          Add('DESCRICAO', ftString, 40, False);
          Add('DT_TRANS', ftDate, 0, False);
          Add('HISTORICO', ftString, 50, False);
          Add('VALOR', ftFloat, 0, False);
        end;

        with IndexDefs do
        begin
          Clear;
          Add('', 'ID', [ixPrimary, ixUnique]);
          Add('TEMP', 'CONTA;DT_TRANS', [ixCaseInsensitive]);
        end;

        CreateTable;
        IndexName := 'TEMP';
        Open;
      end;
    except
     Application.MessageBox('Ocorreu um erro ao criar um arquivo temporário', PChar(Msg_Title), mb_IconStop);
     exit;
    end;}

    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT CODIGO, DESCRICAO, DT_TRANS, VALORCR, VALORDB, CONTA, HISTORICO');
    QRel.Sql.Add('FROM(');
    QRel.Sql.Add('SELECT PLANO.CODIGO, PLANO.DESCRICAO, RAZAO.DT_TRANS, RAZAO.VALOR VALORCR,  0 VALORDB,  RAZAO.CONTA_CR CONTA, RAZAO.HISTORICO');
    QRel.Sql.Add('FROM RAZAO');
    QRel.Sql.Add('INNER JOIN PLANO');
    QRel.Sql.Add('ON (RAZAO.CONTA_CR = PLANO.CODIGO)');
    QRel.Sql.Add(' WHERE (RAZAO.EMPRESA_ID = :EMPRESA_ID) AND (RAZAO.TPCTB <= :TPCTB)');
    QRel.Sql.Add('AND (RAZAO.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL) AND (PLANO.CHAVE LIKE :CHAVE)');
    QRel.Sql.Add('UNION ALL');
    QRel.Sql.Add('SELECT PLANO.CODIGO, PLANO.DESCRICAO, RAZAO.DT_TRANS, 0 VALORCR,  RAZAO.VALOR VALORDB , RAZAO.CONTA_DB CONTA , RAZAO.HISTORICO');
    QRel.Sql.Add('FROM RAZAO');
    QRel.Sql.Add('INNER JOIN PLANO');
    QRel.Sql.Add('ON (RAZAO.CONTA_DB = PLANO.CODIGO)');
    QRel.Sql.Add('WHERE (RAZAO.EMPRESA_ID = :EMPRESA_ID) AND (RAZAO.TPCTB <= :TPCTB)');
    QRel.Sql.Add('AND (RAZAO.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL) AND (PLANO.CHAVE LIKE :CHAVE)');
    QRel.Sql.Add(') ');


    if Conta.Value > 0 then
    begin
      QRel.Sql.Add('WHERE (CONTA = :CONTA)');
      QRel.ParamByName('CONTA').AsString := QConta.FieldByName('COD_CONTABIL').AsString;
    end;

    //QRel.Sql.Add('ORDER BY CODIGO');

    QRel.Sql.Add('ORDER BY CODIGO, DT_TRANS');

    QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
    QRel.ParamByName('CHAVE').AsString        := 'A%';

    QRel.Prepare;
    QRel.Open;

    QRel.First;

  {  while not QRel.Eof do
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('CONTA').AsString      := QRel.FieldByName('CODIGO').AsString;
      Table_Temp.FieldByName('DESCRICAO').AsString  := QRel.FieldByName('DESCRICAO').AsString;
      Table_Temp.FieldByName('DT_TRANS').AsDateTime := QRel.FieldByName('DT_TRANS').AsDateTime;
      Table_Temp.FieldByName('HISTORICO').AsString  := QRel.FieldByName('HISTORICO').AsString;
      Table_Temp.FieldByName('VALOR').AsFloat       := QRel.FieldByName('VALOR').AsFloat;
      Table_Temp.Post;

      Application.ProcessMessages;
      QRel.Next;
    end;

    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT PLANO.CODIGO, PLANO.DESCRICAO, RAZAO.DT_TRANS, RAZAO.VALOR, RAZAO.HISTORICO');
    QRel.Sql.Add('FROM RAZAO');
    QRel.Sql.Add('INNER JOIN PLANO');
    QRel.Sql.Add('ON (RAZAO.CONTA_DB = PLANO.CODIGO)');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(RAZAO.FLUXO_CAIXA_ID > 0)');
    QRel.Sql.Add('AND (EMPRESA_ID = :EMPRESA_ID)');
    QRel.Sql.Add('AND (TPCTB <= :TPCTB)');
    QRel.Sql.Add('AND (DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
    QRel.Sql.Add('AND (PLANO.CHAVE LIKE :CHAVE)');
    QRel.Sql.Add('ORDER BY PLANO.DESCRICAO');

    if Conta.Value > 0 then
    begin
      QRel.Sql.Add('AND (RAZAO.CONTA_DB = :CONTA)');
      QRel.ParamByName('CONTA').AsString := QConta.FieldByName('COD_CONTABIL').AsString;
    end;

    QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
    QRel.ParamByName('CHAVE').AsString        := 'A%';

    QRel.Prepare;
    QRel.Open;

    QRel.First;
    while not QRel.Eof do
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('CONTA').AsString      := QRel.FieldByName('CODIGO').AsString;
      Table_Temp.FieldByName('DESCRICAO').AsString  := QRel.FieldByName('DESCRICAO').AsString;
      Table_Temp.FieldByName('DT_TRANS').AsDateTime := QRel.FieldByName('DT_TRANS').AsDateTime;
      Table_Temp.FieldByName('HISTORICO').AsString  := QRel.FieldByName('HISTORICO').AsString;
      Table_Temp.FieldByName('VALOR').AsFloat       := (QRel.FieldByName('VALOR').AsFloat * -1);
      Table_Temp.Post;

      Application.ProcessMessages;
      QRel.Next;
    end;}

    QRLabel1.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;

    if QRel.IsEmpty then
      Application.MessageBox('Não há dados para os parâmetros informados', PChar(Msg_Title), mb_IconInformation)
    else
     begin

      if CheckBox1.Checked = True then
      Begin
        RDprint1.Impressora := HP;
        RDprint1.FonteTamanhoPadrao := S10cpp;
      End;

      RDprint1.OpcoesPreview.Preview     := True;
      RDprint1.MostrarProgresso          := True;
      RDprint1.Acentuacao                := SemAcento;
      RDprint1.TamanhoQteLinhas          := 1;
      RDprint1.Abrir;

      NomeConta := '';


      while not Qrel.Eof do
      begin

       if Qrel.FieldByName('DESCRICAO').AsString <> NomeConta then
       begin

         if linha > 63 then
          begin
           RDprint1.Novapagina;
           Pagina := Pagina + 1;
          end;


         if (NomeConta <> '') then
         begin
           RDprint1.LinhaH(linha,40,50,0,false);
           Inc(linha);

           if subtotal < 0 then
            RDprint1.ImpVal(linha,40,',###,##0.00',subtotal,[negrito],clred)
           else
            RDprint1.ImpVal(linha,40,',###,##0.00',subtotal,[negrito]);

           Inc(linha);
           Inc(linha);
           totalGeral:= totalGeral + subtotal;
           subtotal := 0;
         end;


         RDprint1.ImpF(linha,01, Qrel.FieldByName('DESCRICAO').AsString, [negrito]);
         Inc(linha);
         NomeConta :=  Qrel.FieldByName('DESCRICAO').AsString;
       end;

       //RDprint1.Imp(linha, 25, Qrel.FieldByName('DT_TRANS').AsString);
       //RDprint1.ImpVal(linha, 40,',###,##0.00',Qrel.FieldByName('VALORCR').AsFloat,[]);
       //RDprint1.Imp(linha, 58, Copy(Qrel.FieldByName('HISTORICO').AsString, 1,60));

        if Qrel.FieldByName('VALORDB').AsFloat > 0 then
         Begin
           RDprint1.Imp(linha, 25, Qrel.FieldByName('DT_TRANS').AsString);
           RDprint1.ImpVal(linha,40,',###,##0.00',(Qrel.FieldByName('VALORDB').AsFloat * -1),[], clred);
           RDprint1.Imp(linha,54, Copy(Qrel.FieldByName('HISTORICO').AsString, 1, 64));

           subtotal:= subtotal + (Qrel.FieldByName('VALORDB').AsFloat * -1);
         End
       else
        if Qrel.FieldByName('VALORCR').AsFloat > 0 then
         Begin
           RDprint1.Imp(linha, 25, Qrel.FieldByName('DT_TRANS').AsString);
           RDprint1.ImpVal(linha,40,',###,##0.00',Qrel.FieldByName('VALORCR').AsFloat,[]);
           RDprint1.Imp(linha,54, copy(Qrel.FieldByName('HISTORICO').AsString, 1, 64));

           subtotal:= subtotal + Qrel.FieldByName('VALORCR').AsFloat;
         End;

        if linha > 63 then
        begin
          RDprint1.Novapagina;
          Pagina := Pagina + 1;
        end;

      Inc(linha);
      QRel.Next;
      end;

           RDprint1.LinhaH(linha,40,50,0,false);
           Inc(linha);

           if subtotal < 0 then
            RDprint1.ImpVal(linha,40,',###,##0.00',subtotal,[negrito],clred)
           else
            RDprint1.ImpVal(linha,40,',###,##0.00',subtotal,[negrito]);

           Inc(linha);
           Inc(linha);


           if linha > 63 then
            begin
              RDprint1.Novapagina;
              Pagina := Pagina + 1;
            end;


           RDprint1.LinhaH(linha,01,120,0,false);
           Inc(linha);

           if subtotal < 0 then
            RDprint1.ImpVal(linha,40,',###,##0.00',totalGeral,[negrito],clred)
           else
            RDprint1.ImpVal(linha,40,',###,##0.00',totalGeral,[negrito]);

            totalGeral := 0;





      Application.ProcessMessages;
      RDprint1.TamanhoQteLinhas:= 66;
      RDprint1.Fechar;
    End;

  finally
    //Table_Temp.Close;
    //Table_Temp.DeleteTable;
  end;
end;


procedure TFrmExtrato_Receita_RDP.RDprint1NewPage(Sender: TObject;
  Pagina: Integer);
begin

    RDprint1.Imp(01, 01, FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString);
    RDprint1.ImpDir(01, (length(FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString)), 120, 'Sistema de Automação de empresas Eficaz', []);
    RDprint1.Imp(02, 01, 'Data/Hora: ' + DateToStr(date) + ' - ' + TimeToStr(now));
    RDprint1.impDir(02, 80, 120, 'Página: ' + IntToStr(Pagina), []);
    RDprint1.impC(03, 60, '*** EXTRATO RECEITA/DESPESAS (CAIXA/BANCO) ***',[]);
    RDprint1.imp(04, 01, 'Período:'+ datetoStr(dtmen.date) + ' à ' + datetoStr(dtmai.date));
    RDprint1.LinhaH(05,01,120,0,false);
      RDprint1.Imp(06, 01, 'Conta');
      RDprint1.Imp(06, 25, 'Data');
      RDprint1.Imp(06, 46, 'Valor');
      RDprint1.Imp(06, 54, 'Histórico');
    RDprint1.LinhaH(07,01,120,0,false);
    linha := 08;
end;



procedure TFrmExtrato_Receita_RDP.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmExtrato_Receita_RDP.ContaChange(Sender: TObject);
begin
  if Conta.Value > 0 then
    SearchConta;
end;

procedure TFrmExtrato_Receita_RDP.ContaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = Conta) then
    btnContaClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmExtrato_Receita_RDP.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmExtrato_Receita_RDP.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    //Perform(Wm_NextDlgctl, 0, 0);
    
  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmExtrato_Receita_RDP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmExtrato_Receita_RDP.FormCreate(Sender: TObject);
begin
  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);
end;





end.
