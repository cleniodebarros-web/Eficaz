unit UProgramar_Terminais;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Gauges, StdCtrls, Buttons, ExtCtrls, DB, IBCustomDataSet, IBQuery,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmProgramar_Terminais = class(TForm)
    Bevel1: TBevel;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    GroupBox1: TGroupBox;
    Pdv01: TCheckBox;
    Pdv02: TCheckBox;
    Pdv03: TCheckBox;
    Pdv04: TCheckBox;
    Pdv05: TCheckBox;
    Pdv06: TCheckBox;                        
    Pdv07: TCheckBox;
    Pdv08: TCheckBox;
    Pdv09: TCheckBox;
    Pdv10: TCheckBox;
    Pdv11: TCheckBox;
    Pdv12: TCheckBox;
    Pdv13: TCheckBox;
    Pdv14: TCheckBox;
    Pdv15: TCheckBox;
    Pdv16: TCheckBox;
    Pdv17: TCheckBox;
    Pdv18: TCheckBox;
    Pdv19: TCheckBox;
    Pdv20: TCheckBox;
    Pdv21: TCheckBox;
    Pdv22: TCheckBox;
    Pdv23: TCheckBox;
    Pdv24: TCheckBox;
    Pdv25: TCheckBox;
    Pdv26: TCheckBox;
    Pdv27: TCheckBox;
    Pdv28: TCheckBox;
    Pdv29: TCheckBox;
    Pdv30: TCheckBox;
    Pdv31: TCheckBox;
    Pdv32: TCheckBox;
    Pdv33: TCheckBox;
    Pdv34: TCheckBox;
    Pdv35: TCheckBox;
    Pdv36: TCheckBox;
    Pdv37: TCheckBox;
    Pdv38: TCheckBox;
    Pdv39: TCheckBox;
    Pdv40: TCheckBox;
    GroupBox2: TGroupBox;
    Produtos: TCheckBox;
    Alterados: TCheckBox;
    Formas: TCheckBox;
    Operadores: TCheckBox;
    Clientes: TCheckBox;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Gauge1: TGauge;
    Timer1: TTimer;
    Tributos: TCheckBox;
    ECF: TCheckBox;
    Teclado: TCheckBox;
    TCD: TCheckBox;
    NCM: TCheckBox;
    TCD_GERTEC: TCheckBox;
    Chk_Config: TCheckBox;
    Pdv41: TCheckBox;
    Pdv42: TCheckBox;
    Pdv43: TCheckBox;
    Pdv44: TCheckBox;
    Pdv45: TCheckBox;
    Pdv46: TCheckBox;
    Pdv47: TCheckBox;
    Pdv48: TCheckBox;
    Pdv49: TCheckBox;
    Pdv50: TCheckBox;
    Pdv60: TCheckBox;
    Pdv59: TCheckBox;
    Pdv58: TCheckBox;
    Pdv57: TCheckBox;
    Pdv56: TCheckBox;
    Pdv55: TCheckBox;
    Pdv54: TCheckBox;
    Pdv53: TCheckBox;
    Pdv52: TCheckBox;
    Pdv51: TCheckBox;
    QTabela: TFDQuery;
    QSaldo: TFDQuery;
    QVencimento: TFDQuery;
    QRel: TFDQuery;
    QSearch: TFDQuery;
    procedure btnRetornaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExecutaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Pdv01KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ProdutosClick(Sender: TObject);
    procedure AlteradosClick(Sender: TObject);
    procedure ClientesClick(Sender: TObject);
  private
    { Private declarations }
  public
  procedure Verifica_Arquivos;

    { Public declarations }

  end;

var
  FrmProgramar_Terminais: TFrmProgramar_Terminais;
  Dir_Destino,Nm_Arq: String;

implementation

uses
  UData, UPrincipal;

{$R *.dfm}

procedure TFrmProgramar_Terminais.AlteradosClick(Sender: TObject);
begin
if Alterados.Checked then
Begin
Produtos.Enabled := False;
Clientes.Enabled := False;
End
else
Begin
Produtos.Enabled := True;
Clientes.Enabled := True;
End;
end;

procedure TFrmProgramar_Terminais.btnExecutaClick(Sender: TObject);
var
Caixas, Resu, Promo_Ini, Promo_Fim, Neg_Pos_C, Neg_Pos_G: String;
I, Saldo, Aliq_ICMS, Saldo_cheque: Real;
X, Y : Integer;
Temp: TComponent;
F1, F2,F3: TextFile;
Envio_prod, Envio_cli, ENVIO_IBPT : Boolean;
begin
  Dir_Destino := LeIni(Arq_Ini, 'TCPPDV', 'Path Tx');

  if not DirectoryExists(Dir_Destino) then
  begin
    Application.MessageBox(PChar('Impossível continuar. O Diretório ' + Dir_Destino + ' não existe'), PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  btnExecuta.Enabled := False;
  btnRetorna.Enabled := False;

  Caixas := '';
  Nm_Arq := Copy(DateToStr(date), 1, 2) + Copy(DateToStr(date), 4, 2) +  Copy(TimeToStr(time), 1, 2) + Copy(TimeToStr(time), 4, 2) + Copy(TimeToStr(time), 7, 2);

  try
    if (Produtos.Checked) or (Alterados.Checked) then
    begin
        Envio_prod := True;
        QRel.SQL.Clear;
        QRel.SQL.Add('SELECT * FROM PRODUTOS WHERE CARGA = 1');
        QRel.Prepare;
        QRel.Open;

        if not QRel.IsEmpty then
        begin
         Application.MessageBox('Processamento de carga pendente no banco favor aguardar.', PChar(Msg_Title), mb_IconInformation);
         Exit
        end;


        QRel.Sql.Clear;
        QRel.SQL.Add('ALTER TABLE PRODUTOS DISABLE TRIGGER PRODUTOS_UP');

        QRel.Prepare;
        QRel.ExecSQL;


      QTabela.Sql.Clear;
      QTabela.Sql.Add('SELECT PRODUTOS.*, TRIBUTOS.CODIGO_ECF');
      QTabela.Sql.Add('FROM PRODUTOS');
      QTabela.Sql.Add('INNER JOIN TRIBUTOS');
      QTabela.Sql.Add('ON (PRODUTOS.TRIBUTO_ID = TRIBUTOS.TRIBUTO_ID)');
      QTabela.Sql.Add('WHERE');
      QTabela.Sql.Add('(PRODUTOS.TRIBUTO_ID > 0)');
      QTabela.Sql.Add('AND (PRODUTOS.PRECO_VAREJO > 0.01)');
      QTabela.Sql.Add('AND (PRODUTOS.EMPRESA_ID = :EMPRESA_ID)');

      if Alterados.Checked then
        QTabela.Sql.Add('AND ((PRODUTOS.DT_ATUALIZACAO >= :DT_ATUALIZACAO) OR (PRODUTOS.DT_PRECO >= :DT_PRECO))');

      if StrToInt(LeIni(Arq_Ini, 'Sistema', 'Localização')) > 0 then
      begin
        QTabela.Sql.Add('AND (PRODUTOS.LOCALIZACAO_ID = :LOCALIZACAO_ID)');

        QTabela.ParamByName('LOCALIZACAO_ID').AsInteger := StrToInt(LeIni(Arq_Ini, 'Sistema', 'Localização'));
      end;

      QTabela.Sql.Add('ORDER BY PRODUTOS.PRODUTO_ID');

      QTabela.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;

      if Alterados.Checked then
      begin
        QTabela.ParamByName('DT_ATUALIZACAO').AsDateTime := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
        QTabela.ParamByName('DT_PRECO').AsDateTime       := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
      end;

      QTabela.Prepare;
      QTabela.Open;


      //AssignFile(F1, Dir_Destino + 'Prprd');
      //Rewrite(F1);

      if TCD.Checked then
      begin
      if FrmPrincipal.OpenDialog1.Execute then
      begin
        AssignFile(F2, FrmPrincipal.OpenDialog1.FileName);
        Rewrite(F2);

      end;
      end;

      if TCD_Gertec.Checked then
      begin
      if FrmPrincipal.OpenDialog1.Execute then
      begin
        AssignFile(F3, FrmPrincipal.OpenDialog1.FileName);
        Rewrite(F3);

      end;
      end;

      I := QTabela.RecordCount;
      X := 0;

      Gauge1.Visible := True;

      QTabela.First;
      while not QTabela.Eof do
      begin

        QRel.Sql.Clear;
        QRel.SQL.Add('UPDATE PRODUTOS SET CARGA = 1');
        QRel.SQL.Add('WHERE PRODUTO_ID = :PRODUTO_ID');

        QRel.ParamByName('PRODUTO_ID').AsInteger := QTabela.FieldByName('PRODUTO_ID').AsInteger;

        QRel.Prepare;
        QRel.ExecSQL;

        {if QTabela.FieldByName('PROMO_INICIAL').AsString = '' then
          Promo_Ini := '30/12/1899'
        else
          Promo_Ini := QTabela.FieldByName('PROMO_INICIAL').AsString;

        if QTabela.FieldByName('PROMO_FINAL').AsString = '' then
          Promo_Fim := '30/12/1899'
        else
          Promo_Fim := QTabela.FieldByName('PROMO_FINAL').AsString;

        if QTabela.FieldByName('QUANTIDADE_C').AsFloat < 0 then
          Neg_Pos_C := 'N'
        else
          Neg_Pos_C := 'P';

        if QTabela.FieldByName('QUANTIDADE_G').AsFloat < 0 then
          Neg_Pos_G := 'N'
        else
          Neg_Pos_G := 'P';

        if LeIni(Arq_Ini, 'Sistema', 'Carga de Produtos p/ Cód. ECF') = 'True' then
        begin
          if (Copy(QTabela.FieldByName('CODIGO_ECF').AsString, 1, 1) <> 'I') and (Copy(QTabela.FieldByName('CODIGO_ECF').AsString, 1, 1) <> 'F') and (Copy(QTabela.FieldByName('CODIGO_ECF').AsString, 1, 1) <> 'N') then
            Aliq_ICMS := QTabela.FieldByName('CODIGO_ECF').AsFloat
          else
            Aliq_ICMS := QTabela.FieldByName('ALIQUOTA_ICMS').AsFloat;
        end
        else
          Aliq_ICMS := QTabela.FieldByName('ALIQUOTA_ICMS').AsFloat;

        WriteLn(F1, StrZero(QTabela.FieldByName('PRODUTO_ID').AsString, 6, 0) +
                    ForcaComprimento(QTabela.FieldByName('COD_BARRA').AsString, 14, ' ') +
                    StrZero(QTabela.FieldByName('CAD_SIMPLES').AsString, 1, 0) +
                    ForcaComprimento(QTabela.FieldByName('NCM').AsString, 8, ' ') +
                    ForcaComprimento(QTabela.FieldByName('CODRED').AsString, 7, ' ') +
                    ForcaComprimento(QTabela.FieldByName('DESCRICAO').AsString, 40, ' ') +
                    ForcaComprimento(QTabela.FieldByName('FANTASIA').AsString, 24, ' ') +
                    ForcaComprimento(QTabela.FieldByName('SUPERVISOR').AsString, 3, ' ') +
                    ForcaComprimento(QTabela.FieldByName('PROVQT').AsString, 3, ' ') +
                    ForcaComprimento(QTabela.FieldByName('UNIDADE').AsString, 6, ' ') +
                    StrZero(QTabela.FieldByName('EMBALAGEM').AsString, 9, 2) +
                    ForcaComprimento(QTabela.FieldByName('UNIDADE_VENDA').AsString, 6, ' ') +
                    StrZero(QTabela.FieldByName('FRACAO_VENDA').AsString, 9, 2) +
                    ForcaComprimento(QTabela.FieldByName('IAT').AsString, 1, ' ') +
                    ForcaComprimento(QTabela.FieldByName('IPPT').AsString, 1, ' ') +
                    ForcaComprimento(QTabela.FieldByName('PESAVEL').AsString, 3, ' ') +
                    StrZero(QTabela.FieldByName('ETIQUETA').AsString, 5, 0) +
                    StrZero(QTabela.FieldByName('BALTECLA').AsString, 5, 0) +
                    StrZero(QTabela.FieldByName('BALDPT').AsString, 5, 0) +
                    StrZero(QTabela.FieldByName('BALTIPO').AsString, 5, 0) +
                    StrZero(QTabela.FieldByName('VALIDADE').AsString, 5, 0) +
                    StrZero(QTabela.FieldByName('EMPRESA_ID').AsString, 5, 0) +
                    StrZero(QTabela.FieldByName('GRUPO_ID').AsString, 5, 0) +
                    StrZero(QTabela.FieldByName('SUBTIPO_ID').AsString, 5, 0) +
                    StrZero(QTabela.FieldByName('LOCALIZACAO_ID').AsString, 5, 0) +
                    StrZero(QTabela.FieldByName('TRIBUTO_ID').AsString, 5, 0) +
                    StrZero(QTabela.FieldByName('FAMILIA_ID').AsString, 5, 0) +
                    StrZero(FloatToStr(Aliq_ICMS), 12, 2) +
                    StrZero(QTabela.FieldByName('PRECO_VAREJO').AsString, 12, 2) +
                    StrZero(QTabela.FieldByName('PRECO_ATACADO').AsString, 12, 2) +
                    StrZero(QTabela.FieldByName('PRECO_PROMOCAO').AsString, 12, 2) +
                    StrZero(QTabela.FieldByName('PRECO_PRAZO').AsString, 12, 2) +
                    Promo_Ini +
                    Promo_Fim +
                    ForcaComprimento(QTabela.FieldByName('STATUS').AsString, 1, ' ') +
                    ForcaComprimento(QTabela.FieldByName('COD_BARRA_AUX1').AsString, 14, ' ') +
                    ForcaComprimento(QTabela.FieldByName('COD_BARRA_AUX2').AsString, 14, ' ') +
                    ForcaComprimento(QTabela.FieldByName('COD_BARRA_AUX3').AsString, 14, ' ') +
                    ForcaComprimento(QTabela.FieldByName('COD_BARRA_AUX4').AsString, 14, ' ') +
                    ForcaComprimento(QTabela.FieldByName('COD_ORIGINAL').AsString, 20, ' ') +
                    ForcaComprimento(QTabela.FieldByName('REFERENCIA').AsString, 13, ' ') +
                    StrZero(FloatToStr(Abs(QTabela.FieldByName('QUANTIDADE_C').AsFloat)), 12, 2) +
                    Neg_Pos_C +
                    StrZero(FloatToStr(Abs(QTabela.FieldByName('QUANTIDADE_G').AsFloat)), 12, 2) +
                    Neg_Pos_G );
                    //EncryptMsg(IntToStr(StrToInt(Copy(DecryptMsg(FrmPrincipal.QEmpresa.FieldByName('LICENCA').AsString,65),27,3)) - Usuarios ),65)}

        if TCD.Checked then
        begin
          if (FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime >= QTabela.FieldByName('PROMO_INICIAL').AsDateTime) and
             (FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime <= QTabela.FieldByName('PROMO_INICIAL').AsDateTime) and (QTabela.FieldByName('PRECO_PROMOCAO').AsFloat > 0) then
            WriteLn(F2, ForcaComprimento(Copy(QTabela.FieldByName('COD_BARRA').AsString, 1, 13), 13, ' ') +
                        ForcaComprimento(Copy(QTabela.FieldByName('DESCRICAO').AsString, 1, 20), 20, ' ') +
                        StrZero(QTabela.FieldByName('PRECO_PROMOCAO').AsString, 12, 2))
          else
            WriteLn(F2, ForcaComprimento(Copy(QTabela.FieldByName('COD_BARRA').AsString, 1, 13), 13, ' ') +
                        ForcaComprimento(Copy(QTabela.FieldByName('DESCRICAO').AsString, 1, 20), 20, ' ') +
                        StrZero(QTabela.FieldByName('PRECO_VAREJO').AsString, 12, 2));
        end;

        if TCD_GERTEC.Checked then
        begin
          if (FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime >= QTabela.FieldByName('PROMO_INICIAL').AsDateTime) and
             (FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime <= QTabela.FieldByName('PROMO_INICIAL').AsDateTime) and (QTabela.FieldByName('PRECO_PROMOCAO').AsFloat > 0) then
            WriteLn(F3, ForcaComprimento(Copy(QTabela.FieldByName('COD_BARRA').AsString, 1, 13), 13, ' ') +
                        '|' +
                        ForcaComprimento(Copy(QTabela.FieldByName('DESCRICAO').AsString, 1, 20), 20, ' ') +
                        '|'+
                        FloatToStrF(QTabela.FieldByName('PRECO_PROMOCAO').AsFloat,ffNumber,4,2) + '|' + '40' + '|' +
                        '40' + '|' + 'RED' + '|' + '80' + '|' + '80' + '|' + 'WITE' + '|' + 'WHITE' + '|' +
                        '|' + '|' + '|' )
          else
            WriteLn(F3, ForcaComprimento(Copy(QTabela.FieldByName('COD_BARRA').AsString, 1, 13), 13, ' ') +
                        '|' +
                        ForcaComprimento(Copy(QTabela.FieldByName('DESCRICAO').AsString, 1, 20), 20, ' ') +
                        '|'+
                        FloatToStrF(QTabela.FieldByName('PRECO_VAREJO').AsFloat,ffNumber,4,2) + '|' + '40' + '|' +
                        '40' + '|' + 'RED' + '|' + '80' + '|' + '80' + '|' + 'WITE' + '|' + 'WHITE' + '|' +
                        '|' + '|' + '|' )
        end;


        Inc(X);

        Resu            := FormatFloat('0', (X * 100) / I);
        Gauge1.Progress := StrToInt(Resu);

        Application.ProcessMessages;
        QTabela.Next;

      end;



      QTabela.Close;
      Gauge1.Visible := False;
     // CloseFile(F1);

      if TCD.Checked then
        CloseFile(F2);

      if TCD_Gertec.Checked then
        CloseFile(F3);


      {for Y := 0 to (ComponentCount - 1) do
      begin


        Temp := Components[Y];

        if (Temp is TCheckBox) then
        begin
          if (Copy(Temp.Name, 1, 3) = 'Pdv') and (TCheckBox(Temp).Checked) then
          begin
            if (Produtos.Checked) or (Alterados.Checked) then
               CopyFile(PChar(Dir_Destino + 'Prprd'), PChar(Dir_Destino + 'Prprd' + Nm_Arq + '.0' + Copy(Temp.Name, 4, 2)), False);
               Caixas := Caixas + Copy(Temp.Name, 4, 2);
             TCheckBox(Temp).Font.Color := clYellow;
          end;
        end;
      end;

     // DeleteFile(Dir_Destino + 'Prprd'); }



        QRel.Sql.Clear;
        QRel.SQL.Add('ALTER TABLE PRODUTOS ENABLE TRIGGER PRODUTOS_UP');

        QRel.Prepare;
        QRel.ExecSQL;




    end;

    if Formas.Checked then
    begin
      //AssignFile(F1, Dir_Destino + 'Prfin');
      //Rewrite(F1);

      QTabela.Sql.Clear;
      QTabela.Sql.Add('SELECT * FROM FINALIZADORAS');

      QTabela.Prepare;
      QTabela.Open;

      I := QTabela.RecordCount;
      X := 0;

      Gauge1.Visible := True;

      QTabela.First;
      while not QTabela.Eof do
      begin

        QRel.Sql.Clear;
        QRel.SQL.Add('UPDATE FINALIZADORAS SET CARGA = 1');

        QRel.Prepare;
        QRel.ExecSQL;


       { WriteLn(F1, StrZero(QTabela.FieldByName('FINALIZADORA_ID').AsString, 2, 0) +
                    ForcaComprimento(QTabela.FieldByName('DESCRICAO').AsString, 24, ' ') +
                    ForcaComprimento(QTabela.FieldByName('LEGENDA').AsString, 20, ' ') +
                    StrZero(QTabela.FieldByName('LIMITE').AsString, 12, 2) +
                    StrZero(QTabela.FieldByName('FATOR').AsString, 5, 0) +
                    StrZero(QTabela.FieldByName('NUMAUT').AsString, 5, 0) +
                    StrZero(QTabela.FieldByName('COMISSAO').AsString, 12, 2) +
                    StrZero(QTabela.FieldByName('LIMTROCO').AsString, 12, 2) +
                    StrZero(QTabela.FieldByName('F_TROCO').AsString, 1, 0) +
                    ForcaComprimento(QTabela.FieldByName('F_CHEQUE').AsString, 1, ' ') +
                    ForcaComprimento(QTabela.FieldByName('F_DIG_VALOR').AsString, 1, ' ') +
                    ForcaComprimento(QTabela.FieldByName('F_AUTO').AsString, 1, ' ') +
                    ForcaComprimento(QTabela.FieldByName('GAVETA').AsString, 1, ' ') +
                    StrZero(QTabela.FieldByName('PONTOS').AsString, 9, 0) +
                    StrZero(QTabela.FieldByName('FINTROCO').AsString, 2, 0) +
                    StrZero(QTabela.FieldByName('TIPO_TRANSACAO').AsString, 1, 0) +
                    StrZero(QTabela.FieldByName('PARCELAS').AsString, 5, 0) +
                    StrZero(QTabela.FieldByName('T_TEF').AsString, 1, 0) +
                    ForcaComprimento(QTabela.FieldByName('C_DEBITO').AsString, 5, ' ') +
                    ForcaComprimento(QTabela.FieldByName('C_CREDITO').AsString, 5, ' ') +
                    StrZero(QTabela.FieldByName('CLIENTE_ID').AsString, 5, 0) +
                    StrZero(QTabela.FieldByName('FINCARTAOECF').AsString, 2, 0)); }

        Inc(X);

        Resu            := FormatFloat('0', (X * 100) / I);
        Gauge1.Progress := StrToInt(Resu);

        Application.ProcessMessages;
        QTabela.Next;
      end;


      QTabela.Close;
      Gauge1.Visible := False;
      //CloseFile(F1);

     { for Y := 0 to (ComponentCount - 1) do
      begin
        Temp := Components[Y];

        if (Temp is TCheckBox) then
        begin
          if (Copy(Temp.Name, 1, 3) = 'Pdv') and (TCheckBox(Temp).Checked) then
          begin
            CopyFile(PChar(Dir_Destino + 'Prfin'), PChar(Dir_destino + 'Prfin.0' + Copy(Temp.Name, 4, 2)), False);

            TCheckBox(Temp).Font.Color := clYellow;
          end;
        end;
      end;

     // DeleteFile(Dir_Destino + 'Prfin');}

    end;

    if Chk_Config.Checked then
    begin
      //AssignFile(F1, Dir_Destino + 'Prconf');
      //Rewrite(F1);

      QTabela.Sql.Clear;
      QTabela.Sql.Add('SELECT * FROM CONFIG');

      QTabela.Prepare;
      QTabela.Open;

      I := QTabela.RecordCount;
      X := 0;

      Gauge1.Visible := True;

      QTabela.First;
      while not QTabela.Eof do
      begin
        QRel.Sql.Clear;
        QRel.SQL.Add('UPDATE CONFIG SET CARGA = 1');

        QRel.Prepare;
        QRel.ExecSQL;



       { WriteLn(F1, StrZero(QTabela.FieldByName('CONTA_ESTOQUE').AsString, 5, 0) +
                    StrZero(QTabela.FieldByName('CONTA_CONSUMO').AsString, 5, 0) +
                    StrZero(QTabela.FieldByName('TAM_BARRAS').AsString, 5, 0) +
                    StrZero(QTabela.FieldByName('TAM_PESAVEIS').AsString, 5, 0) +
                    ForcaComprimento(QTabela.FieldByName('TEM_BALANCA').AsString, 5, ' ') +
                    ForcaComprimento(QTabela.FieldByName('VER_DESATIVADOS').AsString, 5, ' ') +
                    ForcaComprimento(QTabela.FieldByName('TIPO_REMARCA').AsString, 1, ' ') +
                    StrZero(QTabela.FieldByName('CONTA_JUROS').AsString, 5, 0) +
                    ForcaComprimento(QTabela.FieldByName('MOSTRAR_CADASTROS').AsString, 5, ' ') +
                    ForcaComprimento(QTabela.FieldByName('BLOQ_DEVEDORES').AsString, 5, ' ') +
                    ForcaComprimento(QTabela.FieldByName('GERA_DIGITO').AsString, 5, ' ') +
                    ForcaComprimento(QTabela.FieldByName('PLANO_PROPRIO').AsString, 5, ' ') +
                    ForcaComprimento(QTabela.FieldByName('UNID_EMB_PEDIDOS').AsString, 5, ' ') +
                    ForcaComprimento(QTabela.FieldByName('TURNO').AsString, 5, ' ') +
                    StrZero(QTabela.FieldByName('CARENCIA').AsString, 5, 0) +
                    StrZero(QTabela.FieldByName('JUROS_MENSAL').AsString, 12, 2) +
                    StrZero(QTabela.FieldByName('DESCONTO_MENSAL').AsString, 12, 2) +
                    StrZero(QTabela.FieldByName('MULTA').AsString, 12, 2) +
                    StrZero(QTabela.FieldByName('DESC_MAXIMO').AsString, 12, 2) +
                    StrZero(QTabela.FieldByName('ALIQ_SIMPLES').AsString, 12, 2) +
                    ForcaComprimento(QTabela.FieldByName('OBJETO_ORDEM').AsString, 20, ' ') +
                    ForcaComprimento(QTabela.FieldByName('SPED').AsString, 5, ' ') +
                    ForcaComprimento(QTabela.FieldByName('VERSAO').AsString, 20, ' ') +
                    StrZero(QTabela.FieldByName('LOCALIZACAO_ID').AsString, 5, 0) +
                    ForcaComprimento(QTabela.FieldByName('CONSULTA_SIMPLES').AsString, 5, ' ') +
                    StrZero(QTabela.FieldByName('COD_CTA').AsString, 5, 0) +
                    ForcaComprimento(QTabela.FieldByName('DEV_PAGTO').AsString, 5, ' ') +
                    ForcaComprimento(QTabela.FieldByName('VDA_PEDV').AsString, 5, ' ')); }

        Inc(X);

        Resu            := FormatFloat('0', (X * 100) / I);
        Gauge1.Progress := StrToInt(Resu);

        Application.ProcessMessages;
        QTabela.Next;
      end;



      QTabela.Close;
      Gauge1.Visible := False;
     // CloseFile(F1);

      {for Y := 0 to (ComponentCount - 1) do
      begin
        Temp := Components[Y];

        if (Temp is TCheckBox) then
        begin
          if (Copy(Temp.Name, 1, 3) = 'Pdv') and (TCheckBox(Temp).Checked) then
          begin
             CopyFile(PChar(Dir_destino + 'Prconf'), PChar(Dir_Destino + 'Prconf.0' + Copy(Temp.Name, 4, 2)), False);
             TCheckBox(Temp).Font.Color := clYellow;
          end;
        end;
      end;

      DeleteFile(Dir_Destino + 'Prconf'); }
    end;

    if Operadores.Checked then
    begin
     // AssignFile(F1, Dir_Destino + 'Propr');
     // Rewrite(F1);

      QTabela.Sql.Clear;
      QTabela.Sql.Add('SELECT * FROM OPERADORES');

      QTabela.Prepare;
      QTabela.Open;

      I := QTabela.RecordCount;
      X := 0;

      Gauge1.Visible := True;

      QTabela.First;
      while not QTabela.Eof do
      begin

        QRel.Sql.Clear;
        QRel.SQL.Add('UPDATE OPERADORES SET CARGA = 1');

        QRel.Prepare;
        QRel.ExecSQL;


        {WriteLn(F1, StrZero(QTabela.FieldByName('OPERADOR_ID').AsString, 14, 0) +
                    ForcaComprimento(QTabela.FieldByName('NOME').AsString, 20, ' ') +
                    StrZero(QTabela.FieldByName('DESCONTO_MAX_ITEM').AsString, 12, 2) +
                    StrZero(QTabela.FieldByName('DESCONTO_MAX_SUBTOTAL').AsString, 12, 2) +
                    StrZero(QTabela.FieldByName('LIMITE_APROVA').AsString, 12, 2) +
                    ForcaComprimento(QTabela.FieldByName('CANCELA_CUPOM').AsString, 5, ' ') +
                    ForcaComprimento(QTabela.FieldByName('CANCELA_ITEM').AsString, 5, ' ') +
                    ForcaComprimento(QTabela.FieldByName('LEITURA_Z').AsString, 5, ' ') +
                    ForcaComprimento(QTabela.FieldByName('SAIDA_OPERADOR').AsString, 5, ' ') +
                    ForcaComprimento(QTabela.FieldByName('ENTRADA_OPERADOR').AsString, 5, ' ') +
                    ForcaComprimento(QTabela.FieldByName('SAIDA_SISTEMA').AsString, 5, ' ') +
                    ForcaComprimento(QTabela.FieldByName('DESLIGAR').AsString, 5, ' ') +
                    ForcaComprimento(QTabela.FieldByName('SAIDA_VENDA').AsString, 5, ' ') +
                    ForcaComprimento(QTabela.FieldByName('ENTRADA_SISTEMA').AsString, 5, ' ') +
                    ForcaComprimento(QTabela.FieldByName('ENTRADA_VENDA').AsString, 5, ' '));   }

        Inc(X);

        Resu            := FormatFloat('0', (X * 100) / I);
        Gauge1.Progress := StrToInt(Resu);

        Application.ProcessMessages;
        QTabela.Next;
      end;


      QTabela.Close;
      Gauge1.Visible := False;
     // CloseFile(F1);

      {for Y := 0 to (ComponentCount - 1) do
      begin
        Temp := Components[Y];

        if (Temp is TCheckBox) then
        begin
          if (Copy(Temp.Name, 1, 3) = 'Pdv') and (TCheckBox(Temp).Checked) then
          begin
             CopyFile(PChar(Dir_destino + 'Propr'), PChar(Dir_Destino + 'Propr.0' + Copy(Temp.Name, 4, 2)), False);
             TCheckBox(Temp).Font.Color := clYellow;
          end;
        end;
      end;

      DeleteFile(Dir_Destino + 'Propr');}
    end;

    if Clientes.Checked then
    begin
      //AssignFile(F1, Dir_Destino + 'Prcli');
      //Rewrite(F1);

      Envio_Cli := True;
      Produtos.Enabled   := False;
      Alterados.Enabled  := False;

      QRel.Sql.Clear;
      QRel.SQL.Add('ALTER TABLE CLIENTES DISABLE TRIGGER CLIENTES_UP');

      QRel.Prepare;
      QRel.ExecSQL;


      QRel.Sql.Clear;
      QRel.SQL.Add('UPDATE CLIENTES SET CARGA = 1');

      QRel.Prepare;
      QRel.ExecSQL;

      QSearch.Sql.Clear;
      QSearch.SQL.Add('SELECT COUNT(CLIENTE_ID) TOTAL_CLIENTES FROM CLIENTES');

      QSearch.Prepare;
      QSearch.Open;


      QRel.Sql.Clear;
      QRel.SQL.Add('UPDATE ABERTURA SET CLIENTES = :CLIENTES');
      QRel.ParamByName('CLIENTES').AsInteger := QSearch.FieldByName('TOTAL_CLIENTES').AsInteger;
      QRel.ExecSQL;



    {
      QTabela.Sql.Clear;
      QTabela.Sql.Add('SELECT CAIXAS FROM ABERTURA');

      QTabela.Prepare;
      QTabela.Open;



      I := QTabela.RecordCount;
      X := 100;

      Gauge1.Visible := True;

      QTabela.First;
      while not QTabela.Eof do
      begin
       { QSaldo.Sql.Clear;
        QSaldo.Sql.Add('SELECT SUM(TRANSPARCELAS.VALOR) AS VALOR');
        QSaldo.Sql.Add('FROM TRANSPARCELAS');
        QSaldo.Sql.Add('INNER JOIN TRANSACOES');
        QSaldo.Sql.Add('ON (TRANSPARCELAS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
        QSaldo.Sql.Add('INNER JOIN CLIENTES');
        QSaldo.Sql.Add('ON (TRANSACOES.CLIENTE_ID = CLIENTES.CLIENTE_ID)');
        QSaldo.Sql.Add('WHERE');
        QSaldo.Sql.Add('(TRANSPARCELAS.TIPO_TRANSACAO = :TIPO_TRANSACAO)');
        QSaldo.Sql.Add('AND ((TRANSPARCELAS.AGRUPAMENTO = 0) OR (TRANSPARCELAS.AGRUPAMENTO IS NULL))');
        QSaldo.Sql.Add('AND (TRANSPARCELAS.VALOR > 0)');
        QSaldo.Sql.Add('AND (TRANSPARCELAS.BANCO_ID = 0)');
        QSaldo.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
        QSaldo.Sql.Add('AND (TRANSACOES.CONDUTA = :CONDUTA)');
        QSaldo.Sql.Add('AND (TRANSACOES.COND_PAGTO = :COND_PAGTO)');
        QSaldo.Sql.Add('AND (TRANSACOES.CLIENTE_ID = :CLIENTE_ID)');

        QSaldo.ParamByName('TIPO_TRANSACAO').AsString := 'T';
        QSaldo.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
        QSaldo.ParamByName('CONDUTA').AsString        := '01';
        QSaldo.ParamByName('COND_PAGTO').AsString     := 'A PRAZO';
        QSaldo.ParamByName('CLIENTE_ID').AsInteger    := QTabela.FieldByName('CLIENTE_ID').AsInteger;

        QSaldo.Prepare;
        QSaldo.Open;

        Saldo := QSaldo.FieldByName('VALOR').AsFloat;

        QSaldo.Sql.Clear;
        QSaldo.Sql.Add('SELECT SUM(CHEQUES_RECEBIDOS.VALOR) AS VALOR');
        QSaldo.Sql.Add('FROM CHEQUES_RECEBIDOS');
        QSaldo.Sql.Add('INNER JOIN CLIENTES');
        QSaldo.Sql.Add('ON (CHEQUES_RECEBIDOS.CLIENTE_ID = CLIENTES.CLIENTE_ID)');
        QSaldo.Sql.Add('WHERE');
        QSaldo.Sql.Add('(CLIENTES.CLIENTE_ID = :CLIENTE_ID)');
        QSaldo.Sql.Add('AND ((BANCO_ID = 0) OR (BANCO_ID IS NULL))');

        QSaldo.ParamByName('CLIENTE_ID').AsInteger    := QTabela.FieldByName('CLIENTE_ID').AsInteger;

        QSaldo.Prepare;
        QSaldo.Open;

        Saldo_Cheque := QSaldo.FieldByName('VALOR').AsFloat;


        QVencimento.Sql.Clear;
        QVencimento.Sql.Add('SELECT CLIENTES.CLIENTE_ID, TRANSPARCELAS.DT_VENCIMENTO,TRANSPARCELAS.VALOR');
        QVencimento.Sql.Add('FROM CLIENTES CLIENTES');
        QVencimento.Sql.Add('INNER JOIN TRANSACOES TRANSACOES');
        QVencimento.Sql.Add('ON (CLIENTES.CLIENTE_ID = TRANSACOES.CLIENTE_ID)');
        QVencimento.Sql.Add('INNER JOIN TRANSPARCELAS TRANSPARCELAS');
        QVencimento.Sql.Add('ON (TRANSACOES.TRANSACAO_ID = TRANSPARCELAS.TRANSACAO_ID)');
        QVencimento.Sql.Add('WHERE (CLIENTES.CLIENTE_ID = :CLIENTE_ID)');
        QVencimento.Sql.Add('AND (TRANSPARCELAS.DT_VENCIMENTO <= :DT_VENCIMENTO)');
        QVencimento.Sql.Add('AND (TRANSPARCELAS.VALOR > 0)');
        QVencimento.Sql.Add('AND (TRANSPARCELAS.BANCO_ID = 0)');
        QVencimento.Sql.Add('AND (TRANSPARCELAS.TIPO_TRANSACAO = :TIPO_TRANSACAO)');
        QVencimento.Sql.Add('AND (TRANSACOES.COND_PAGTO = :COND_PAGTO)');
        QVencimento.Sql.Add('ORDER BY DT_VENCIMENTO');

        QVencimento.ParamByName('TIPO_TRANSACAO').AsString  := 'T';
        QVencimento.ParamByName('COND_PAGTO').AsString      := 'A PRAZO';
        QVencimento.ParamByName('CLIENTE_ID').AsInteger     := QTabela.FieldByName('CLIENTE_ID').AsInteger;
        QVencimento.ParamByName('DT_VENCIMENTO').AsDateTime := date - (FrmPrincipal.Config.FieldByName('CARENCIA').AsInteger + 1);

        QVencimento.Prepare;
        QVencimento.open;





        QRel.Sql.Clear;
        QRel.SQL.Add('UPDATE CLIENTES SET CARGA = 1');

        QRel.Prepare;
        QRel.ExecSQL;




       { WriteLn(F1, StrZero(QTabela.FieldByName('CLIENTE_ID').AsString, 5, 0) +
                    ForcaComprimento(Copy(QTabela.FieldByName('NOME').AsString, 1, 70), 70, ' ') +
                    ForcaComprimento(QTabela.FieldByName('CNPJ').AsString, 18, ' ') +
                    ForcaComprimento(QTabela.FieldByName('ENDERECO').AsString, 60, ' ') +
                    ForcaComprimento(QTabela.FieldByName('BAIRRO').AsString, 40, ' ') +
                    ForcaComprimento(QTabela.FieldByName('MUNICIPIO').AsString, 30, ' ') +
                    StrZero(QTabela.FieldByName('LIMITE').AsString, 12, 2) +
                    StrZero(FloatToStr(Saldo), 12, 2) +
                    ForcaComprimento(QTabela.FieldByName('BLOQUEADO').AsString, 3, ' ') +
                    ForcaComprimento(QTabela.FieldByName('STATUS').AsString, 1, ' ') +
                    ForcaComprimento(QTabela.FieldByName('CARTAO_IDENT1').AsString, 13, ' ') +
                    ForcaComprimento(QTabela.FieldByName('CARTAO_IDENT2').AsString, 13, ' ') +
                    ForcaComprimento(QTabela.FieldByName('CARTAO_IDENT3').AsString, 13, ' ') +
                    ForcaComprimento(QTabela.FieldByName('CARTAO_IDENT4').AsString, 13, ' ') +
                    ForcaComprimento(QTabela.FieldByName('SENHA').AsString, 9, ' ') +
                    ForcaComprimento(QTabela.FieldByName('OBSERVACAO').AsString, 150, ' ') +
                    ForcaComprimento(QTabela.FieldByName('BLOQ_CHEQUE').AsString, 3, ' ') +
                    ForcaComprimento(QVencimento.FieldByName('DT_VENCIMENTO').AsString, 10, ' ') +
                    StrZero(QVencimento.FieldByName('VALOR').AsString, 12, 2) +
                    StrZero(QTabela.FieldByName('LIMITE_CHEQUE').AsString, 12, 2) +
                    StrZero(FloatToStr(Saldo_Cheque), 12, 2));

        Inc(X);

        Resu            := FormatFloat('0', (X * 100) / I);
        Gauge1.Progress := StrToInt(Resu);

        Application.ProcessMessages;
        QTabela.Next;
      end;

       }

    //  QTabela.Close;
     // Gauge1.Visible := False;
     // CloseFile(F1);

      {for Y := 0 to (ComponentCount - 1) do
      begin
        Temp := Components[Y];

        if (Temp is TCheckBox) then
        begin
          if (Copy(Temp.Name, 1, 3) = 'Pdv') and (TCheckBox(Temp).Checked) then
          begin
            CopyFile(PChar(Dir_Destino + 'Prcli'), PChar(Dir_Destino + 'Prcli' + Nm_Arq + '.0' + Copy(Temp.Name, 4, 2)), False);
            TCheckBox(Temp).Font.Color := clYellow;
          end;
        end;
      end;

      DeleteFile(Dir_Destino + 'Prcli');}

      QRel.Sql.Clear;
      QRel.SQL.Add('ALTER TABLE CLIENTES ENABLE TRIGGER CLIENTES_UP');

      QRel.Prepare;
      QRel.ExecSQL;




    end;

    if Tributos.Checked then
    begin
     // AssignFile(F1, Dir_Destino + 'Prtri');
     // Rewrite(F1);

      QTabela.Sql.Clear;
      QTabela.Sql.Add('SELECT * FROM TRIBUTOS');

      QTabela.Prepare;
      QTabela.Open;

      I := QTabela.RecordCount;
      X := 0;

      Gauge1.Visible := True;

      QTabela.First;
      while not QTabela.Eof do
      begin

        QRel.Sql.Clear;
        QRel.SQL.Add('UPDATE TRIBUTOS SET CARGA = 1');

        QRel.Prepare;
        QRel.ExecSQL;



        {WriteLn(F1, StrZero(QTabela.FieldByName('TRIBUTO_ID').AsString, 2, 0) +
                    ForcaComprimento(QTabela.FieldByName('DESCRICAO').AsString, 25, ' ') +
                    StrZero(QTabela.FieldByName('ALIQUOTA_ICMS').AsString, 12, 2) +
                    ForcaComprimento(QTabela.FieldByName('CODIGO_ECF').AsString, 3, ' ') +
                    ForcaComprimento(QTabela.FieldByName('ORIGEM').AsString, 40, ' ') +
                    ForcaComprimento(QTabela.FieldByName('TRIBUTACAO').AsString, 40, ' ') +
                    ForcaComprimento(QTabela.FieldByName('CFOP').AsString, 4, ' '));}

        Inc(X);

        Resu            := FormatFloat('0', (X * 100) / I);
        Gauge1.Progress := StrToInt(Resu);

        Application.ProcessMessages;
        QTabela.Next;
      end;


      QTabela.Close;
      Gauge1.Visible := False;
     // CloseFile(F1);

      {for Y := 0 to (ComponentCount - 1) do
      begin
        Temp := Components[Y];

        if (Temp is TCheckBox) then
        begin
          if (Copy(Temp.Name, 1, 3) = 'Pdv') and (TCheckBox(Temp).Checked) then
          begin
             CopyFile(PChar(Dir_Destino + 'Prtri'), PChar(Dir_Destino + 'Prtri.0' + Copy(Temp.Name, 4, 2)), False);
             TCheckBox(Temp).Font.Color := clYellow;
          end;
        end;
      end;

      DeleteFile(Dir_Destino + 'Prtri'); }
    end;

    if Ncm.Checked then
    begin
     // AssignFile(F1, Dir_Destino + 'Ncmib');
     // Rewrite(F1);
      ENVIO_IBPT := True;

      QTabela.Sql.Clear;
      QTabela.Sql.Add('UPDATE IBTP SET CARGA = 1');

      QTabela.Prepare;
      QTabela.Open;




     { I := QTabela.RecordCount;
      X := 0;

      Gauge1.Visible := True;

      QTabela.First;
      while not QTabela.Eof do
      begin

        QRel.Sql.Clear;
        QRel.SQL.Add('UPDATE IBTP SET CARGA = 1');

        QRel.Prepare;
        QRel.ExecSQL;


        WriteLn(F1, StrZero(QTabela.FieldByName('CODIGO').AsString, 8,0) +
                    StrZero(QTabela.FieldByName('EX').AsString, 2,0) +
                    StrZero(QTabela.FieldByName('TABELA').AsString, 2, 0) +
                    StrZero(QTabela.FieldByName('ALIQNAC').AsString, 12, 2) +
                    StrZero(QTabela.FieldByName('ALIQIMP').AsString, 12, 2) +
                    StrZero(QTabela.FieldByName('ALIQEST').AsString, 12, 2) +
                    ForcaComprimento(QTabela.FieldByName('VERSAO').AsString, 10, ' '));

        Inc(X);

        Resu            := FormatFloat('0', (X * 100) / I);
        Gauge1.Progress := StrToInt(Resu);

        Application.ProcessMessages;
        QTabela.Next;
      end;



      QTabela.Close;
      Gauge1.Visible := False;
     // CloseFile(F1);

      {for Y := 0 to (ComponentCount - 1) do
      begin
        Temp := Components[Y];

        if (Temp is TCheckBox) then
        begin
          if (Copy(Temp.Name, 1, 3) = 'Pdv') and (TCheckBox(Temp).Checked) then
          begin
             CopyFile(PChar(Dir_Destino + 'Ncmib'), PChar(Dir_Destino + 'Ncmib.0' + Copy(Temp.Name, 4, 2)), False);
             TCheckBox(Temp).Font.Color := clYellow;
          end;
        end;
      end;

      DeleteFile(Dir_Destino + 'Ncmib');}



    end;


    if Teclado.Checked then
    begin
      AssignFile(F1, Dir_Destino + 'Prtec');
      Rewrite(F1);

      QTabela.Sql.Clear;
      QTabela.Sql.Add('SELECT * FROM TECLADO');

      QTabela.Prepare;
      QTabela.Open;

      I := QTabela.RecordCount;
      X := 0;

      Gauge1.Visible := True;

      QTabela.First;
      while not QTabela.Eof do
      begin
        WriteLn(F1, StrZero(QTabela.FieldByName('TECLA').AsString, 5, 0) +
                    ForcaComprimento(QTabela.FieldByName('FUNCAO').AsString, 20, ' ') +
                    StrZero(QTabela.FieldByName('FINALIZADORA_ID').AsString, 3, 0) +
                    ForcaComprimento(QTabela.FieldByName('CONTEUDO').AsString, 1, ' '));

        Inc(X);

        Resu            := FormatFloat('0', (X * 100) / I);
        Gauge1.Progress := StrToInt(Resu);

        Application.ProcessMessages;
        QTabela.Next;
      end;

      QTabela.Close;
      Gauge1.Visible := False;
      CloseFile(F1);

      for Y := 0 to (ComponentCount - 1) do
      begin
        Temp := Components[Y];

        if (Temp is TCheckBox) then
        begin
          if (Copy(Temp.Name, 1, 3) = 'Pdv') and (TCheckBox(Temp).Checked) then
          begin
             CopyFile(PChar(Dir_Destino + 'Prtec'), PChar(Dir_Destino + 'Prtec.0' + Copy(Temp.Name, 4, 2)), False);
             TCheckBox(Temp).Font.Color := clYellow;
          end;
        end;
      end;

      DeleteFile(Dir_Destino + 'Prtec');
    end;

    if ECF.Checked then
    begin
      AssignFile(F1, Dir_Destino + 'Precf');
      Rewrite(F1);

      QTabela.Sql.Clear;
      QTabela.Sql.Add('SELECT * FROM LICENCA_IF');

      QTabela.Prepare;
      QTabela.Open;

      I := QTabela.RecordCount;
      X := 0;

      Gauge1.Visible := True;

      QTabela.First;
      while not QTabela.Eof do
      begin
        WriteLn(F1, ForcaComprimento(QTabela.FieldByName('SERIAL').AsString, 30, ' ') +
                    ForcaComprimento(QTabela.FieldByName('MF_ADICIONAL').AsString, 1, ' ') +
                    ForcaComprimento(QTabela.FieldByName('TIPO_ECF').AsString, 15, ' ') +
                    ForcaComprimento(QTabela.FieldByName('MARCA_ECF').AsString, 30, ' ') +
                    ForcaComprimento(QTabela.FieldByName('MODELO').AsString, 20, ' ') +
                    ForcaComprimento(QTabela.FieldByName('CNI').AsString, 6, ' ') +
                    ForcaComprimento(QTabela.FieldByName('VERSAO_SB').AsString, 20, ' ') +
                    QTabela.FieldByName('DT_INST_SB').AsString +
                    QTabela.FieldByName('HR_INST_SB').AsString +
                    ForcaComprimento(QTabela.FieldByName('NUM_ECF').AsString, 3, ' ') +
                    ForcaComprimento(QTabela.FieldByName('NUM_VERSAO').AsString, 10, ' ') +
                    ForcaComprimento(QTabela.FieldByName('CNPJ').AsString, 18, ' ') +
                    ForcaComprimento(QTabela.FieldByName('IE').AsString, 20, ' ') +
                    ForcaComprimento(QTabela.FieldByName('LICENCA').AsString, 32, ' ') +
                    StrZero(QTabela.FieldByName('GRANDE_TOTAL').AsString, 12, 2) +
                    ForcaComprimento(QTabela.FieldByName('MD5').AsString, 32, ' '));

        Inc(X);

        Resu            := FormatFloat('0', (X * 100) / I);
        Gauge1.Progress := StrToInt(Resu);

        Application.ProcessMessages;
        QTabela.Next;
      end;

      QTabela.Close;
      Gauge1.Visible := False;
      CloseFile(F1);

      for Y := 0 to (ComponentCount - 1) do
      begin
        Temp := Components[Y];

        if (Temp is TCheckBox) then
        begin
          if (Copy(Temp.Name, 1, 3) = 'Pdv') and (TCheckBox(Temp).Checked) then
          begin
             CopyFile(PChar(Dir_Destino + 'Precf'), PChar(Dir_Destino + 'Precf.0' + Copy(Temp.Name, 4, 2)), False);
             TCheckBox(Temp).Font.Color := clYellow;
          end;
        end;
      end;

      DeleteFile(Dir_Destino + 'Precf');
    end;



    for Y := 0 to (ComponentCount - 1) do
      begin
        Temp := Components[Y];

        if (Temp is TCheckBox) then
        begin
          if (Copy(Temp.Name, 1, 3) = 'Pdv') and (TCheckBox(Temp).Checked) then
          begin
            //CopyFile(PChar(Dir_Destino + 'Prfin'), PChar(Dir_destino + 'Prfin.0' + Copy(Temp.Name, 4, 2)), False);
            Caixas := Caixas + Copy(Temp.Name, 4, 2);
            TCheckBox(Temp).Font.Color := clYellow;
          end;
        end;
      end;



      QRel.Sql.Clear;
      QRel.SQL.Add('UPDATE ABERTURA SET CAIXAS = :CAIXAS');

      QRel.ParamByName('CAIXAS').AsString := Caixas;

      QRel.Prepare;
      QRel.ExecSQL;




      if ENVIO_CLI then
      begin
       QTabela.SQL.Clear;
       QTabela.SQL.Add('SELECT COUNT(*) TOTAL FROM CLIENTES WHERE STATUS = :STATUS');
       QTabela.ParamByName('STATUS').AsString := 'A';
       QTabela.Prepare;
       QTabela.Open;


       I := QTabela.FieldByName('TOTAL').AsInteger;

       QTabela.SQL.Clear;
       QTabela.SQL.Add('SELECT * FROM CLIENTES WHERE STATUS = :STATUS');
       QTabela.ParamByName('STATUS').AsString := 'A';
       QTabela.Prepare;
       QTabela.Open;


       X := 0;
       Gauge1.Visible := True;

       QTabela.First;

       while not QTabela.Eof do
       begin

        QRel.SQL.Clear;
        QRel.SQL.Add('SELECT CAIXAS FROM ABERTURA');
        QRel.Prepare;
        QRel.Open;

         Inc(X);
         Resu            := FormatFloat('0', (X * 100) / I);
         Gauge1.Progress := StrToInt(Resu);
         Sleep(900);

         if Qrel.FieldByName('CAIXAS').AsString = '' then
            QTabela.last;

         Application.ProcessMessages;
         QTabela.Next;
       end;
        Produtos.Enabled   := False;
        Alterados.Enabled  := False;
        QTabela.Close;
        Gauge1.Visible     := False;
      end;


      if ENVIO_PROD then
      begin
       QTabela.SQL.Clear;
       QTabela.SQL.Add('SELECT COUNT(*) TOTAL FROM PRODUTOS WHERE STATUS = :STATUS');

       if Alterados.Checked then
       Begin
       QTabela.SQL.Add('AND DT_ATUALIZACAO = :DT_ATUALIZACAO');
       QTabela.ParamByName('DT_ATUALIZACAO').AsDateTime := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
       End;

       QTabela.ParamByName('STATUS').AsString := 'A';
       QTabela.Prepare;
       QTabela.Open;


       I := QTabela.FieldByName('TOTAL').AsInteger;

       QRel.SQL.Clear;
       QRel.SQL.Add('UPDATE ABERTURA SET PRODUTOS = :PRODUTOS');
       QRel.ParamByName('PRODUTOS').AsFloat := I;
       QRel.Prepare;
       QRel.ExecSQL;


       QTabela.SQL.Clear;
       QTabela.SQL.Add('SELECT * FROM PRODUTOS WHERE STATUS = :STATUS');

       if Alterados.Checked then
       Begin
       QTabela.SQL.Add('AND DT_ATUALIZACAO = :DT_ATUALIZACAO');
       QTabela.ParamByName('DT_ATUALIZACAO').AsDateTime := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
       End;

       QTabela.ParamByName('STATUS').AsString := 'A';
       QTabela.Prepare;
       QTabela.Open;


       X := 0;
       Gauge1.Visible := True;

       QTabela.First;

       while not QTabela.Eof do
       begin

        QRel.SQL.Clear;
        QRel.SQL.Add('SELECT CAIXAS FROM ABERTURA');
        QRel.Prepare;
        QRel.Open;

         Inc(X);
         Resu            := FormatFloat('0', (X * 100) / I);
         Gauge1.Progress := StrToInt(Resu);
         Sleep(100);

         if Qrel.FieldByName('CAIXAS').AsString = '' then
            QTabela.last;

         Application.ProcessMessages;
         QTabela.Next;
       end;
        Clientes.Enabled   := False;
        QTabela.Close;
        Gauge1.Visible     := False;
      end;


      if ENVIO_IBPT then
      begin
       QTabela.SQL.Clear;
       QTabela.SQL.Add('SELECT COUNT(*) TOTAL FROM IBTP');
       QTabela.Prepare;
       QTabela.Open;


       I := QTabela.FieldByName('TOTAL').AsInteger;

       QTabela.SQL.Clear;
       QTabela.SQL.Add('SELECT * FROM IBTP');
       QTabela.Prepare;
       QTabela.Open;


       X := 0;
       Gauge1.Visible := True;

       QTabela.First;

       while not QTabela.Eof do
       begin

        QRel.SQL.Clear;
        QRel.SQL.Add('SELECT CAIXAS FROM ABERTURA');
        QRel.Prepare;
        QRel.Open;

         Inc(X);
         Resu            := FormatFloat('0', (X * 100) / I);
         Gauge1.Progress := StrToInt(Resu);
         Sleep(100);

         if Qrel.FieldByName('CAIXAS').AsString = '' then
            QTabela.last;

         Application.ProcessMessages;
         QTabela.Next;
       end;
        Clientes.Enabled   := False;
        QTabela.Close;
        Gauge1.Visible     := False;
      end;

    Application.MessageBox('Procedimento executado com sucesso', PChar(Msg_Title), mb_IconInformation);
  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;

procedure TFrmProgramar_Terminais.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmProgramar_Terminais.ClientesClick(Sender: TObject);
begin
if Clientes.Checked then
begin
  Produtos.Enabled  := False;
  Alterados.Enabled := False;
end
else
begin
  Produtos.Enabled  := True;
  Alterados.Enabled := True;
end;


end;

procedure TFrmProgramar_Terminais.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmProgramar_Terminais.FormCreate(Sender: TObject);
var
I, Lin, Col, X: Integer;
Temp: TComponent;
Cx: String;
begin
  Lin := 21;
  Col := 6;
  X   := 0;

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if (Temp is TCheckBox) then
    begin
      if Copy(Temp.Name, 1, 3) = 'Pdv' then
      begin
        Cx := 'Caixa ' + Copy(Temp.Name, 4, 2);

        if LeIni(Arq_Ini, 'Caixas', Cx) <> '' then
        begin
          TCheckBox(Temp).Top     := Lin;
          TCheckBox(Temp).Left    := Col;
          TCheckBox(Temp).Visible := True;

          Inc(X);
          Inc(Lin, 26);

          if (X = 10) or (X = 20) or (X = 30) or (X = 40) or (X = 50) or (X = 60) then
          begin
            Inc(Col, 69);
            Lin := 21;
          end;
        end
        else
          TCheckBox(Temp).Visible := False;
      end;
    end;
  end;

  if LeIni(Arq_Ini, 'Carga', 'Produtos Totais') = 'True' then
    Produtos.Enabled := True
  else
    Produtos.Enabled := False;

  if LeIni(Arq_Ini, 'Carga', 'Produtos Alterados') = 'True' then
    Alterados.Enabled := True
  else
    Alterados.Enabled := False;

  if LeIni(Arq_Ini, 'Carga', 'Finalizadoras') = 'True' then
    Formas.Enabled := True
  else
    Formas.Enabled := False;

  if LeIni(Arq_Ini, 'Carga', 'Operadores') = 'True' then
    Operadores.Enabled := True
  else
    Operadores.Enabled := False;

  if LeIni(Arq_Ini, 'Carga', 'Clientes') = 'True' then
    Clientes.Enabled := True
  else
    Clientes.Enabled := False;

  if LeIni(Arq_Ini, 'Carga', 'Tributos') = 'True' then
    Tributos.Enabled := True
  else
    Tributos.Enabled := False;

  if LeIni(Arq_Ini, 'Carga', 'Teclado') = 'True' then
    Teclado.Enabled := True
  else
    Teclado.Enabled := False;

  if LeIni(Arq_Ini, 'Carga', 'ECF') = 'True' then
    ECF.Enabled := True
  else
    ECF.Enabled := False;

    Dir_Destino := LeIni(Arq_Ini, 'TCPPDV', 'Path Tx');

  Verifica_Arquivos;
end;

procedure TFrmProgramar_Terminais.Pdv01KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmProgramar_Terminais.ProdutosClick(Sender: TObject);
begin
  if Produtos.Checked then
  Begin
    Application.MessageBox('Enviar Carga de Produtos Totais pode ocasionar lentidão no PDV', PChar(Msg_Title), mb_IconInformation);
    Alterados.Enabled := False;
    Clientes.Enabled  := False;
  End
  else
  Begin
  Alterados.Enabled := True;
  Clientes.Enabled  := True;
  End;
end;

procedure TFrmProgramar_Terminais.Timer1Timer(Sender: TObject);
begin
  Verifica_Arquivos;
end;

procedure TFrmProgramar_Terminais.Verifica_Arquivos;
var
SR_P,SR_C,SR_O: TSearchRec;
I_Arq_P,I_Arq_C,I_Arq_O: Integer;
Y: Integer;
Tem: Boolean;
Temp: TComponent;

begin
  Timer1.Enabled := False;
  try
    for Y := 0 to (ComponentCount - 1) do
    begin
      Temp := Components[Y];
      Tem  := False;

      if (Temp is TCheckBox) then
      begin
        if Copy(TCheckBox(Temp).Caption, 1, 5) = 'Caixa' then
        begin

          I_Arq_P := FindFirst(Dir_Destino + 'Prprd*.0' + Copy(Temp.Name, 4, 2) , faAnyFile, SR_P);
          I_Arq_C := FindFirst(Dir_Destino + 'Prcli*.0' + Copy(Temp.Name, 4, 2) , faAnyFile, SR_C);
          I_Arq_O := FindFirst(Dir_Destino + 'Propr*.0' + Copy(Temp.Name, 4, 2) , faAnyFile, SR_O);


          if FileExists(Dir_Destino + Copy(SR_P.Name,1,17) + Copy(Temp.Name, 4, 2) ) then
            Tem := True;

          if FileExists(Dir_Destino + Copy(SR_C.Name,1,17) + Copy(Temp.Name, 4, 2) ) then
            Tem := True;

          if FileExists(Dir_Destino + Copy(SR_O.Name,1,17) + Copy(Temp.Name, 4, 2) ) then
            Tem := True;

          if FileExists(Dir_Destino + 'Prfin.0' + Copy(Temp.Name, 4, 2)) then
            Tem := True;

          if FileExists(Dir_Destino + 'Ncmib.0' + Copy(Temp.Name, 4, 2)) then
            Tem := True;

          if FileExists(Dir_Destino + 'Prconf.0' + Copy(Temp.Name, 4, 2)) then
            Tem := True;

          if Tem then
            TCheckBox(Temp).Font.Color := clRed
          else
            TCheckBox(Temp).Font.Color := clGreen;
        end;
      end;
    end;
  finally
    Timer1.Enabled := True;
  end;
end;

end.
