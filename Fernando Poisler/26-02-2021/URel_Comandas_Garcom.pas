unit URel_Comandas_Garcom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBTables, DB, IBCustomDataSet, IBQuery, Buttons, ExtCtrls,
  rxCurrEdit, Mask, rxToolEdit, QRCtrls, QuickRpt, DBCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, RDprint;
  

type
  TFrmRel_Comandas_Garcom = class(TForm)
    Dtmen: TDateEdit;
    Label1: TLabel;
    Dtmai: TDateEdit;
    Bevel1: TBevel;
    btnRetorna: TBitBtn;
    DataFuncionario: TDataSource;
    btnExecuta: TBitBtn;
    DataAcesso: TDataSource;
    Rel_Comandas_Abertas: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    QRSysData1: TQRSysData;
    Cabec: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    QRLabel7: TQRLabel;
    QRShape2: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText8: TQRDBText;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText7: TQRDBText;
    QRBand1: TQRBand;
    QRShape4: TQRShape;
    QRLabel20: TQRLabel;
    QRExpr3: TQRExpr;
    QRGroup1: TQRGroup;
    QRDBText3: TQRDBText;
    QRLabel6: TQRLabel;
    QRBand2: TQRBand;
    QRShape3: TQRShape;
    QRLabel2: TQRLabel;
    QRExpr6: TQRExpr;
    QRGroup2: TQRGroup;
    QRDBText9: TQRDBText;
    QRLabel9: TQRLabel;
    QRBand3: TQRBand;
    QRLabel1: TQRLabel;
    QRExpr9: TQRExpr;
    QRShape5: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText5: TQRDBText;
    Tipo: TComboBox;
    Label2: TLabel;
    QRLabel4: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel8: TQRLabel;
    Label3: TLabel;
    Produto: TCurrencyEdit;
    btnProduto: TSpeedButton;
    DBText1: TDBText;
    DataProduto: TDataSource;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr4: TQRExpr;
    Label4: TLabel;
    Mesa: TCurrencyEdit;
    QFuncionario: TFDQuery;
    QAcesso: TFDQuery;
    QProduto: TFDQuery;
    QRel: TFDQuery;
    Hora_Inicial: TMaskEdit;
    Hora_Final: TMaskEdit;
    Label5: TLabel;
    Label6: TLabel;
    Garcom: TCurrencyEdit;
    btnGarcom: TSpeedButton;
    DBText2: TDBText;
    Ordem: TComboBox;
    Label7: TLabel;
    RDprint1: TRDprint;
    CheckBox1: TCheckBox;
    procedure FuncionarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnExecutaClick(Sender: TObject);
    procedure DtmenEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnRetornaClick(Sender: TObject);
    procedure btnProdutoClick(Sender: TObject);
    procedure ProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ProdutoChange(Sender: TObject);
    procedure btnGarcomClick(Sender: TObject);
    procedure GarcomChange(Sender: TObject);
    procedure GarcomKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RDprint1NewPage(Sender: TObject; Pagina: Integer);
    procedure DtmaiExit(Sender: TObject);
    procedure DtmenExit(Sender: TObject);
  private
    procedure SearchGarcom;
    { Private declarations }
  public
    { Public declarations }
     procedure SearchProduto;
  end;

var
  FrmRel_Comandas_Garcom: TFrmRel_Comandas_Garcom;
  Linha, Pagina: Integer;

implementation

uses
  UPrincipal, UData, UConsulta;

{$R *.dfm}

procedure TFrmRel_Comandas_Garcom.SearchProduto;
begin
    QProduto.Close;
    QProduto.ParamByName('PRODUTO_ID').AsInteger := StrToInt(Produto.Text);
    QProduto.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    QProduto.Prepare;
    QProduto.Open;

    if Qproduto.IsEmpty then
        DBText1.Visible := False
    else
        DBText1.Visible := True;

end;



procedure TFrmRel_Comandas_Garcom.SearchGarcom;
begin
  QFuncionario.Close;
  QFuncionario.ParamByName('FUNCIONARIO_ID').AsInteger := StrToInt(Garcom.Text);
  QFuncionario.Open;

  if QFuncionario.IsEmpty then
     DBText2.Visible := False
  else
     DBText2.Visible := True;


end;


procedure TFrmRel_Comandas_Garcom.btnExecutaClick(Sender: TObject);
var
  vr_total,qt_total: Real;
begin
// 125, 327
     btnExecuta.Enabled := False;

    try
        Hora_Inicial.EditMask := '!90:00;0;_';
        Hora_Final.EditMask := '!90:00;0;_';

        QRel.Close;
        QRel.SQL.Clear;
        QRel.SQL.Add('SELECT');
        QRel.SQL.Add('	BAR.DATA,');
        QRel.SQL.Add('	BAR.HORA,');
        QRel.SQL.Add('	BAR.MESA,');
        QRel.SQL.Add('	BAR.GARCOM,');
        QRel.SQL.Add('	( SELECT NOME FROM FUNCIONARIOS WHERE FUNCIONARIO_ID = BAR.GARCOM ) AS NOME,');
        QRel.SQL.Add('	BAR.COD_PRODUTO,');
        QRel.SQL.Add('	BAR.DESCRICAO,');
        QRel.SQL.Add('	BAR.QUANTIDADE,');
        QRel.SQL.Add('	BAR.VR_UNITARIO,');
        QRel.SQL.Add('	BAR.VR_TOTAL ');
        QRel.SQL.Add('FROM');
        QRel.SQL.Add('	BAR');
        QRel.SQL.Add('	INNER JOIN TRANSACOES ON ( BAR.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID )');
        QRel.SQL.Add('WHERE');
        QRel.SQL.Add('BAR.DATA BETWEEN :DT_INICIAL AND :DT_FINAL');

        if (AllTrim(Hora_Inicial.Text) <> '') and (AllTrim(Hora_Final.Text) <> '') then
        begin

            Hora_Inicial.EditMask := '!90:00;1;_';
            Hora_Final.EditMask := '!90:00;1;_';

            if (Length(Hora_Inicial.Text) = 5) and (Length(Hora_Final.Text) = 5) then
            begin
                try
                    QRel.SQL.Add('AND CAST(BAR.HORA AS TIME) BETWEEN :HORA_INICIAL AND :HORA_FINAL ');
                    QRel.ParamByName('HORA_INICIAL').AsTime := StrToTime(Hora_Inicial.Text + ':00');
                    QRel.ParamByName('HORA_FINAL').AsTime := StrToTime(Hora_Final.Text + ':59');
                except
                     //
                end;
            end;
        end;

        QRel.SQL.Add('	AND ( BAR.STATUS = :STATUS ) ');
        QRel.SQL.Add('	AND ( BAR.MESA < 600 ) ');

        if Mesa.Value > 0 then
        begin
            QRel.SQL.Add('	AND ( BAR.MESA = :MESA ) ');
            QRel.ParamByName('MESA').AsInteger := StrToInt(Mesa.Text);
        end;

        if Garcom.Value > 0 then
        begin
            QRel.SQL.Add('	AND ( BAR.GARCOM = :GARCOM ) ');
            QRel.ParamByName('GARCOM').AsInteger := StrToInt(Garcom.Text);
        end;

        QRel.SQL.Add('	AND ( BAR.CANCELADO = :CANCELADO ) ');
        QRel.SQL.Add('	AND ( BAR.TRANSACAO_ID > 0 ) ');
        QRel.SQL.Add('	AND TRANSACOES.TPCTB = :TCPTB');

        if Produto.Value > 0 then
        begin
            QRel.SQL.Add('AND BAR.COD_PRODUTO = :COD_PRODUTO');
            QRel.ParamByName('COD_PRODUTO').AsInteger := StrToInt(Produto.Text);
        end;

        if Ordem.Text = 'Data, Hora' then
        begin
            QRel.SQL.Add('ORDER BY BAR.DATA, BAR.HORA, BAR.MESA');
        end;

        if Ordem.Text = 'Mesa' then
        begin
            QRel.SQL.Add('ORDER BY BAR.MESA, BAR.DATA, BAR.HORA');
        end;

        if Ordem.Text = 'Garçom' then
        begin
            QRel.SQL.Add('ORDER BY NOME, BAR.DATA, BAR.HORA');
        end;

        if Ordem.Text = 'Produto' then
        begin
            QRel.SQL.Add('ORDER BY BAR.DESCRICAO, BAR.DATA, BAR.HORA');
        end;

        QRel.ParamByName('DT_INICIAL').AsDate := Dtmen.Date;
        QRel.ParamByName('DT_FINAL').AsDate := Dtmai.Date;

        if Tipo.Text = 'Fechada' then
            QRel.ParamByName('STATUS').AsString := 'F'
        else
            QRel.ParamByName('STATUS').AsString := 'A';

        QRel.ParamByName('CANCELADO').AsString := '0';
        QRel.ParamByName('TCPTB').AsString := '3';

        QRel.Prepare;
        QRel.Open();

        if QRel.IsEmpty then
            Application.MessageBox('Não há dados para os parâmetros informados', PChar(Msg_Title), mb_IconInformation)
        else
        begin

            if CheckBox1.Checked = True then
            begin
                RDprint1.Impressora := HP;
                RDprint1.FonteTamanhoPadrao := S10cpp;
            end;

            RDprint1.TamanhoQteColunas := 120;
            RDprint1.OpcoesPreview.Preview := True;
            RDprint1.MostrarProgresso := True;
            RDprint1.Acentuacao := SemAcento;
            RDprint1.TamanhoQteLinhas := 1;
            RDprint1.Abrir;

            if linha > 66 then
            begin
                RDprint1.novapagina;
                Pagina := Pagina + 1;
            end;

            QRel.First;
            vr_total := 0;
            while not Qrel.Eof do
            begin

                RDprint1.ImpF(linha, 01, Qrel.FieldByName('DATA').AsString, []);
                RDprint1.ImpF(linha, 13, Copy(Qrel.FieldByName('HORA').AsString, 1, 5), []);
                RDprint1.ImpF(linha, 20, Copy(Qrel.FieldByName('NOME').AsString, 1, 15), []);
                RDprint1.ImpF(linha, 41, StrZero(Qrel.FieldByName('MESA').AsString, 3, 0), []);
                RDprint1.ImpF(linha, 50, Copy(Qrel.FieldByName('DESCRICAO').AsString, 1, 30), []);
                RDprint1.ImpVal(linha, 82, ',#,##0.00', Qrel.FieldByName('QUANTIDADE').AsFloat, []);
                RDprint1.ImpVal(linha, 95, ',#,##0.00', Qrel.FieldByName('VR_UNITARIO').AsFloat, []);
                RDprint1.ImpVal(linha, 110, ',#,##0.00', Qrel.FieldByName('VR_TOTAL').AsFloat, []);

                vr_total := vr_total + Qrel.FieldByName('VR_TOTAL').AsFloat;
                qt_total := qt_total + Qrel.FieldByName('QUANTIDADE').AsFloat;

                if linha > 63 then
                begin
                    RDprint1.novapagina;
                    Pagina := Pagina + 1;
                end;

                Inc(Linha);
                QRel.Next;
            end;

            {
            if (Produto.Value > 0) or (Garcom.Value > 0) or (Mesa.Value > 0) then
            begin
                Inc(linha);
                RDprint1.LinhaH(linha, 105, 120, 0, false);
                RDprint1.LinhaH(linha, 77, 92, 0, false);
                Inc(linha);
                RDprint1.ImpVal(linha, 110, ',#,##0.00', vr_total, [negrito]);
                RDprint1.ImpVal(linha, 82, ',#,##0.00', qt_total, [negrito]);
            end;
            }
            Inc(linha);
            RDprint1.LinhaH(linha, 105, 120, 0, false);
            RDprint1.LinhaH(linha, 77, 92, 0, false);
            Inc(linha);
            RDprint1.ImpVal(linha, 110, ',#,##0.00', vr_total, [negrito]);
            RDprint1.ImpVal(linha, 82, ',#,##0.00', qt_total, [negrito]);

            RDprint1.TamanhoQteLinhas := 66;
            RDprint1.Fechar;

        end;
    finally
       begin
           btnExecuta.Enabled := True;
       end;
    end;


end;


procedure TFrmRel_Comandas_Garcom.RDprint1NewPage(Sender: TObject;
  Pagina: Integer);
begin


      RDprint1.Imp(01, 01, FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString);
      RDprint1.ImpDir(01, (length(FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString)), 120, 'Sistema de Automação de empresas Eficaz', []);
      RDprint1.Imp(02, 01, 'Data/Hora: ' + DateToStr(date) + ' - ' + TimeToStr(now));
      RDprint1.impDir(02, 80, 120, 'Página: ' + IntToStr(Pagina), []);
      RDprint1.impC(03, 48, '*** Comandas por Garçom: '+Tipo.Text+' ***',[negrito]);
      RDprint1.imp(04, 01, 'Período:'+ datetoStr(dtmen.date) + ' à ' + datetoStr(dtmai.date));
      RDprint1.imp(04,50, 'Cliente:');
      RDprint1.LinhaH(05,01,120,0,false);
      RDprint1.Imp(06, 01, 'Data');
      RDprint1.Imp(06, 13, 'Hora');
      RDprint1.Imp(06, 20, 'Garçom');
      RDprint1.Imp(06, 40, 'Mesa');
      RDprint1.Imp(06, 50, 'Produto');
      RDprint1.Imp(06, 85, 'Quant.');
      RDprint1.Imp(06, 96, 'Vr Unit.');
      RDprint1.Imp(06, 114, 'Total');
      RDprint1.LinhaH(07,01,120,0,false);
      linha := 08;


end;

procedure TFrmRel_Comandas_Garcom.btnGarcomClick(Sender: TObject);
begin

    try
        Garcom.Value := GetConsulta('PESSOAL', FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger, 0, StrToInt(Garcom.Text));
    except
        Garcom.Value := GetConsulta('PESSOAL', 0, 0, 0);
    end;

end;

procedure TFrmRel_Comandas_Garcom.btnProdutoClick(Sender: TObject);
begin
  try
    Produto.Value := GetConsulta('ESTOQUE', FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger, 0 , StrToInt(Produto.Text));
  except
    Produto.Value := GetConsulta('ESTOQUE', 0, 0, 0);
  end;

end;

procedure TFrmRel_Comandas_Garcom.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRel_Comandas_Garcom.DtmaiExit(Sender: TObject);
begin

     if Dtmen.Text = Dtmai.Text then
     begin
         Hora_Inicial.Enabled := True;
         Hora_Final.Enabled   := True;
         Hora_Inicial.SetFocus;
     end
     else
     begin
         Hora_Inicial.Enabled := False;
         Hora_Final.Enabled   := False;
         Hora_Inicial.Text := '';
         Hora_Final.Text   := '';
         Produto.SetFocus;
     end;


end;

procedure TFrmRel_Comandas_Garcom.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmRel_Comandas_Garcom.DtmenExit(Sender: TObject);
begin

     if Dtmen.Text = Dtmai.Text then
     begin
         Hora_Inicial.Enabled := True;
         Hora_Final.Enabled   := True;
         Hora_Inicial.SetFocus;
     end
     else
     begin
         Hora_Inicial.Enabled := False;
         Hora_Final.Enabled   := False;
         Hora_Inicial.Text := '';
         Hora_Final.Text   := '';
         Produto.SetFocus;
     end;

end;

procedure TFrmRel_Comandas_Garcom.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
   // Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmRel_Comandas_Garcom.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmRel_Comandas_Garcom.FormCreate(Sender: TObject);
begin
  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);
end;

procedure TFrmRel_Comandas_Garcom.FuncionarioKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmRel_Comandas_Garcom.GarcomChange(Sender: TObject);
begin

    if Garcom.Value > 0 then
       SearchGarcom;

end;

procedure TFrmRel_Comandas_Garcom.GarcomKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

    if (Key = Vk_F7) and (Sender = Garcom) then
        btnGarcomClick(Self);


    if Key = Vk_Return then
        Perform(Wm_NextDlgctl, 0, 0);


end;

procedure TFrmRel_Comandas_Garcom.ProdutoChange(Sender: TObject);
begin
  if Produto.Value > 0 then
    SearchProduto;


end;

procedure TFrmRel_Comandas_Garcom.ProdutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = Produto) then
    btnProdutoClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);

end;



end.
