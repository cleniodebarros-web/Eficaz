unit URel_Sangria_Suprimento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, rxCurrEdit, rxToolEdit, Buttons, DBCtrls,
  DB, IBCustomDataSet, IBQuery, QuickRpt, QRCtrls, DBTables, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, RDprint;

type
  TFrmRel_Sangria_Suprimento = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    Dtmen: TDateEdit;
    Caixa_Banco: TCurrencyEdit;
    Dtmai: TDateEdit;
    btnCaixa_Banco: TSpeedButton;
    DataBanco: TDataSource;
    DBText1: TDBText;
    Flash: TQuickRep;
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
    QRDBText2: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabel10: TQRLabel;
    QRShape4: TQRShape;
    QRLabel6: TQRLabel;
    QRDBText6: TQRDBText;
    QRGroup2: TQRGroup;
    QRDBText7: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText1: TQRDBText;
    QRBand1: TQRBand;
    QRShape2: TQRShape;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    QRLabel2: TQRLabel;
    QRDBText4: TQRDBText;
    QRShape5: TQRShape;
    QRExpr3: TQRExpr;
    QRShape6: TQRShape;
    QRExpr4: TQRExpr;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QBanco: TFDQuery;
    QRel: TFDQuery;
    Label3: TLabel;
    Tipo: TComboBox;
    Ordem: TComboBox;
    Label4: TLabel;
    RDprint1: TRDprint;
    CheckBox1: TCheckBox;
    procedure btnRetornaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnCaixa_BancoClick(Sender: TObject);
    procedure Caixa_BancoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Caixa_BancoChange(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure DtmenEnter(Sender: TObject);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure RDprint1NewPage(Sender: TObject; Pagina: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SearchBanco;
  end;

var
  FrmRel_Sangria_Suprimento: TFrmRel_Sangria_Suprimento;
  Pagina, Linha : Integer;
  Total_Sangria, Total_Suprimento : Real;

implementation

uses
  UData, UConsulta, UPrincipal;

{$R *.dfm}

procedure TFrmRel_Sangria_Suprimento.SearchBanco;
begin
  QBanco.Close;
  QBanco.ParamByName('BANCO_ID').AsInteger   := StrToInt(Caixa_Banco.Text);
  QBanco.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  QBanco.Prepare;
  QBanco.Open;
end;

procedure TFrmRel_Sangria_Suprimento.btnCaixa_BancoClick(Sender: TObject);
begin
  try
    Caixa_Banco.Value := GetConsulta('BANCOS', 0, 0, StrToInt(Caixa_Banco.Text));
  except
    Caixa_Banco.Value := GetConsulta('BANCOS', 0, 0, 0);
  end;
end;

procedure TFrmRel_Sangria_Suprimento.btnExecutaClick(Sender: TObject);
begin
// 123, 325
  try

    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT FECHAMENTO_CUPOM.DATA, FECHAMENTO_CUPOM.CAIXA_ID, OPERADORES.NOME, FECHAMENTO_CUPOM.VALOR_CUPOM,');
    QRel.Sql.Add('TRANSACOES.HISTORICO,TRANSACOES.COMPLEMENTO,FECHAMENTO_CUPOM.HORA FROM FECHAMENTO_CUPOM');
    QRel.Sql.Add('INNER JOIN TRANSACOES');
    QRel.Sql.Add('ON((TRANSACOES.TRANSACAO_ORIGEM) = (CAST(FECHAMENTO_CUPOM.CUPOM AS INTEGER))) AND (TRANSACOES.BANCO_ID = FECHAMENTO_CUPOM.CAIXA_ID)');

    //QRel.Sql.Add('ON( CAST(TRANSACOES.NUM_DOC AS TEXT) = CAST( SUBSTRING(FECHAMENTO_CUPOM.CUPOM FROM 2 FOR 8) AS TEXT) AND (TRANSACOES.BANCO_ID = FECHAMENTO_CUPOM.CAIXA_ID))');

    QRel.Sql.Add('INNER JOIN OPERADORES ON( CAST(OPERADORES.OPERADOR_ID AS INTEGER) = CAST(FECHAMENTO_CUPOM.OPERADOR_ID AS INTEGER))');
    QRel.Sql.Add('WHERE FECHAMENTO_CUPOM.FISCAL = :FISCAL');
    QRel.Sql.Add('AND FECHAMENTO_CUPOM.DATA BETWEEN :DT_INICIAL AND :DT_FINAL');
    QRel.Sql.Add('AND (FECHAMENTO_CUPOM.LEGENDA <> :LEGENDA)');

    if Caixa_Banco.Value > 0 then
       QRel.Sql.Add('AND FECHAMENTO_CUPOM.CAIXA_ID = :CAIXA_ID');

    if Tipo.Text <> 'Todos' then
       QRel.Sql.Add('AND TRANSACOES.HISTORICO = :TIPO');

    QRel.ParamByName('FISCAL').AsString    := 'N';
    QRel.ParamByName('DT_INICIAL').AsDate  := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDate    := Dtmai.Date;
    QRel.ParamByName('LEGENDA').AsString   := 'Cancelado';

    if Caixa_Banco.Value > 0 then
       QRel.ParamByName('CAIXA_ID').AsInteger := StrToInt(Caixa_Banco.Text);

    if Tipo.Text <> 'Todos' then
       QRel.ParamByName('TIPO').AsString := Tipo.Text;


    if Ordem.Text = 'Data' then
       QRel.Sql.Add('ORDER BY FECHAMENTO_CUPOM.DATA');

    if Ordem.Text = 'Operador' then
       QRel.Sql.Add('ORDER BY OPERADORES.NOME');

    if Ordem.Text = 'Caixa' then
       QRel.Sql.Add('ORDER BY FECHAMENTO_CUPOM.CAIXA_ID');

    if Ordem.Text = 'Valor' then
       QRel.Sql.Add('ORDER BY FECHAMENTO_CUPOM.VALOR_CUPOM');


    QRel.Prepare;
    QRel.Open;


    if QRel.IsEmpty then
      Application.MessageBox('Não há dados para os parâmetros informados', PChar(Msg_Title), mb_IconInformation)
    else
    begin

          if CheckBox1.Checked = True then
          Begin
           RDprint1.Impressora := HP;
           RDprint1.FonteTamanhoPadrao := S10cpp;
          End;

          RDprint1.TamanhoQteColunas       := 100;
          RDprint1.OpcoesPreview.Preview   := True;
          RDprint1.MostrarProgresso        := True;
          RDprint1.Acentuacao              := SemAcento;
          RDprint1.TamanhoQteLinhas        := 1;
          RDprint1.Abrir;

          if linha > 66  then
          Begin
           RDprint1.Novapagina;
           Pagina := Pagina + 1;
          End;

          Total_Sangria     := 0;
          Total_Suprimento  := 0;

          QRel.First;
          while not QRel.Eof do
          begin

            RDprint1.ImpF(linha, 01, QRel.FieldByName('DATA').AsString, []);
            RDprint1.ImpF(linha, 14, QRel.FieldByName('HORA').AsString, []);
            RDprint1.ImpF(linha, 26, QRel.FieldByName('CAIXA_ID').AsString, []);
            RDprint1.ImpF(linha, 32, QRel.FieldByName('NOME').AsString, []);
            RDprint1.ImpVal(linha,43,',#,##0.00',QRel.FieldByName('VALOR_CUPOM').AsFloat,[]);
            RDprint1.ImpF(linha, 58, Copy(QRel.FieldByName('COMPLEMENTO').AsString,1,22), [] );
            RDprint1.ImpF(linha, 81, QRel.FieldByName('HISTORICO').AsString, [] );



              if linha > 66  then
              Begin
               RDprint1.Novapagina;
               Pagina := Pagina + 1;
              End;

              if AllTrim(QRel.FieldByName('HISTORICO').AsString) = 'SUPRIMENTO' then
                 Total_Suprimento := Total_Suprimento  +  QRel.FieldByName('VALOR_CUPOM').AsFloat;

              if AllTrim(QRel.FieldByName('HISTORICO').AsString) = 'SANGRIA' then
                 Total_Sangria := Total_Sangria  +  QRel.FieldByName('VALOR_CUPOM').AsFloat;

           Inc(Linha);
           QRel.Next;
          end;

         RDprint1.LinhaH(Linha,01,100,0,false);
         Inc(Linha);


         if Total_Suprimento > 0 then
         begin
            RDprint1.ImpF(linha, 60, 'Total Suprimento: ' + FormatFloat('#,##0.00',Total_Suprimento), [negrito]);
            Inc(linha);
         end;

         if Total_Sangria < 0 then
         begin
            RDprint1.ImpF(linha, 60, '   Total Sangria: ' + FormatFloat('#,##0.00',Total_Sangria), [negrito]);
         end;


         Application.ProcessMessages;
         RDprint1.TamanhoQteLinhas:= 66;
         RDprint1.Fechar;
    end;

  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;

procedure TFrmRel_Sangria_Suprimento.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRel_Sangria_Suprimento.Caixa_BancoChange(Sender: TObject);
begin
  if Caixa_Banco.Value > 0 then
    SearchBanco;
end;

procedure TFrmRel_Sangria_Suprimento.Caixa_BancoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = Caixa_Banco) then
    btnCaixa_BancoClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmRel_Sangria_Suprimento.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLabel8.Caption := FormatFloat('#,##0.00', QRel.FieldByName('CUSTO_COMPRA').AsFloat);
  QRLabel9.Caption := FormatFloat('#,##0.00', QRel.FieldByName('ICMS_RETIDO').AsFloat);
end;

procedure TFrmRel_Sangria_Suprimento.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmRel_Sangria_Suprimento.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
   // Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmRel_Sangria_Suprimento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmRel_Sangria_Suprimento.FormCreate(Sender: TObject);
begin
  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);
end;

procedure TFrmRel_Sangria_Suprimento.RDprint1NewPage(Sender: TObject;
  Pagina: Integer);
begin

      RDprint1.Imp(01, 01, FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString);
      RDprint1.ImpDir(01, (length(FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString)), 100, 'Sistema de Automação de empresas Eficaz', []);
      RDprint1.Imp(02, 01, 'Data/Hora: ' + DateToStr(date) + ' - ' + TimeToStr(now));
      RDprint1.impDir(02, 80, 100, 'Página: ' + IntToStr(Pagina), []);
      RDprint1.impF(03, 36, '*** Sangria / Suprimento ***',[negrito]);
      RDprint1.imp(04, 01, 'Período:'+ datetoStr(dtmen.date) + ' à ' + datetoStr(dtmai.date));
      RDprint1.LinhaH(05,01,100,0,false);
      RDprint1.ImpF(06, 01, 'Data',[negrito]);
      RDprint1.ImpF(06, 16, 'Hora',[negrito]);
      RDprint1.ImpF(06, 25, 'Caixa', [negrito]);
      RDprint1.ImpF(06, 33, 'Operador', [negrito]);
      RDprint1.ImpF(06, 47, 'Valor', [negrito]);
      RDprint1.ImpF(06, 57, 'Descrição', [negrito]);
      RDprint1.ImpF(06, 81, 'Histórico', [negrito]);
      RDprint1.LinhaH(07,01,100,0,false);
      Linha := 08;


end;

end.
