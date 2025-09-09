unit URelAgenda_Ordens_Servico_Filiais;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, StdCtrls, rxCurrEdit, Buttons,
  ExtCtrls, Mask, rxToolEdit, QuickRpt, QRCtrls, DBCtrls, RDprint, Printers,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys,IdTCPClient;

type
  TFrmRelAgenda_Ordens_Servico_Filiais = class(TForm)
    Dtmen: TDateEdit;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    Bevel1: TBevel;
    btnTecnico: TSpeedButton;
    Tecnico: TCurrencyEdit;
    Label2: TLabel;
    Dtmai: TDateEdit;
    Label1: TLabel;
    Label3: TLabel;
    Rel_Ordem_Tecnico: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    QRSysData1: TQRSysData;
    Cabec: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape2: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText8: TQRDBText;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRGroup1: TQRGroup;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    QRBand1: TQRBand;
    QRExpr1: TQRExpr;
    Label4: TLabel;
    Centro_Custo: TCurrencyEdit;
    btnCentro_Custo: TSpeedButton;
    Label5: TLabel;
    btnAtendente: TSpeedButton;
    Atendente: TCurrencyEdit;
    Label6: TLabel;
    Modelo: TComboBox;
    Rel_Ordem_Servico: TQuickRep;
    QRBand17: TQRBand;
    QRSysData17: TQRSysData;
    QRLabel75: TQRLabel;
    QRSysData18: TQRSysData;
    QRLabel80: TQRLabel;
    QRShape19: TQRShape;
    QRLabel81: TQRLabel;
    QRLabel82: TQRLabel;
    QRLabel83: TQRLabel;
    QRLabel85: TQRLabel;
    QRLabel86: TQRLabel;
    QRLabel87: TQRLabel;
    QRShape20: TQRShape;
    QRDBText54: TQRDBText;
    QRLabel88: TQRLabel;
    QRLabel89: TQRLabel;
    QRLabel90: TQRLabel;
    QRLabel91: TQRLabel;
    QRLabel92: TQRLabel;
    QRLabel93: TQRLabel;
    QRBand18: TQRBand;
    QRDBText55: TQRDBText;
    QRDBText56: TQRDBText;
    QRDBText57: TQRDBText;
    QRDBText58: TQRDBText;
    QRDBText59: TQRDBText;
    QRDBText61: TQRDBText;
    QRDBText62: TQRDBText;
    QRDBText63: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText11: TQRDBText;
    QRBand2: TQRBand;
    QRSysData3: TQRSysData;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    Label7: TLabel;
    Status: TDBLookupComboBox;
    DataStatus: TDataSource;
    Tipo_Atendimento: TDBLookupComboBox;
    DataAtend: TDataSource;
    Rel_Fechamento: TCheckBox;
    RDprint1: TRDprint;
    CheckBox1: TCheckBox;
    edt_cliente: TCurrencyEdit;
    btnCliente: TSpeedButton;
    label_cliente: TLabel;
    Label8: TLabel;
    Num_Ordem: TCurrencyEdit;
    QRel: TFDQuery;
    QStatus: TFDQuery;
    QAtend: TFDQuery;
    QAtendente: TFDQuery;
    QItens: TFDQuery;
    Chk_removerabertas: TCheckBox;
    chk_observacao: TCheckBox;
    Label9: TLabel;
    Aparelho: TEdit;
    QSearch: TFDQuery;
    Label10: TLabel;
    LISTA_EMPRESA: TComboBox;
    lbl_Online: TLabel;
    FilialDb: TFDConnection;
    IQuery: TFDQuery;
    QFilial_Empresa: TFDQuery;
    QCliente: TFDQuery;
    BitBtn1: TBitBtn;
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure TecnicoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnTecnicoClick(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRetornaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCentro_CustoClick(Sender: TObject);
    procedure btnAtendenteClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RDprint1NewPage(Sender: TObject; Pagina: Integer);
    procedure btnClienteClick(Sender: TObject);
    procedure Num_OrdemExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  FrmRelAgenda_Ordens_Servico_Filiais: TFrmRelAgenda_Ordens_Servico_Filiais;
  linha, Pagina, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11: Integer;
  total_serv, total_pecas, total_geral, soma_vr_pecas, total_desconto : Real;
  function VerificarFilial(ip,porta:string):boolean;

implementation

uses
  UConsultaFilial, UData, UPrincipal;

{$R *.dfm}

function VerificarFilial(ip,porta:string):boolean;
var
StatusConexao : TIdTCPClient;
Begin
   try

    STatusConexao := TIdTCPClient.Create(nil);

     try
     STatusConexao.Host := IP;
     STatusConexao.Port := StrToInt(porta);

     if FrmPrincipal.Config.FieldByName('TIMEOUT_ECFS').Asinteger > 0 then
     STatusConexao.ConnectTimeout := FrmPrincipal.Config.FieldByName('TIMEOUT_ECFS').AsInteger
     Else
     STatusConexao.ConnectTimeout := 100;

     STatusConexao.Connect;
     Application.ProcessMessages;
     Except
      Result :=False;
      STatusConexao.Free;
     end;

     IF STatusConexao.Connected then
     Begin
     Result :=True;
     STatusConexao.Free;

     End
     else
     Begin
     Result :=False;
     STatusConexao.Free;
     End;


     Result :=True
   except


     Result :=False;


   end;
EnD;

procedure TFrmRelAgenda_Ordens_Servico_Filiais.BitBtn1Click(Sender: TObject);
begin
  try
  QSearch.Sql.Clear;
  QSearch.Sql.Text := 'SELECT BANCO,USUARIO,SENHA,IP,PORTA,CNPJ FROM EMPRESAS WHERE RAZAO = :RAZAO AND STATUS = ''A''';
  QSearch.ParamByName('RAZAO').AsString := Lista_Empresa.Text;
  QSearch.Prepare;
  QSearch.Open;

  FilialDb.Connected:= False;

     if VerificarFilial(QSearch.FieldByName('IP').AsString,QSearch.FieldByName('PORTA').AsString) Then
     Begin
     try

       //FilialDb.Free;
      // FilialDb := TFDConnection.Create(nil);

      FilialDb.Params.Clear;
      FilialDb.Params.Add('Database= ' + QSearch.FieldByName('BANCO').AsString );
      FilialDb.Params.Add('User_Name= ' + QSearch.FieldByName('USUARIO').AsString );
      FilialDb.Params.Add('Password='+ QSearch.FieldByName('SENHA').AsString );
      FilialDb.Params.Add('Server= ' +  QSearch.FieldByName('IP').AsString );
      FilialDb.Params.Add('Port= ' + QSearch.FieldByName('PORTA').AsString);
      FilialDb.Params.Add('DriverID=PG');
      FilialDb.Params.Add('MonitorBy=Remote');
      FilialDb.Connected:=True;

     Except
       Application.MessageBox('Filial não conectada favor verificar1!','Eficaz', MB_ICONERROR + MB_OK);
       Abort;
     end;
     End
     Else
     Begin
     Application.MessageBox('Filial não conectada favor verificar!','Eficaz', MB_ICONERROR + MB_OK);
     Lista_Empresa.SetFocus;
     End;


    if FilialDb.Connected  Then
    Begin
    FilialDb.Open();

    lbl_online.font.color    := clgreen;
    lbl_online.Caption       := 'Filial OnLine';
    BtnExecuta.Enabled       := True;
    Dtmen.Enabled            := True;
    Dtmai.Enabled            := True;
    Status.Enabled           := True;
    Atendente.Enabled        := True;
    Tecnico.Enabled          := True;
    Edt_Cliente.Enabled      := True;
    Tipo_Atendimento.Enabled := True;
    num_ordem.Enabled        := True;
    Centro_Custo.Enabled     := True;
    btnAtendente.Enabled     := True;
    btnTecnico.Enabled      := True;
    btnCliente.Enabled      := True;
    btnCentro_Custo.Enabled := True;



    End
    Else
    Begin
    Lista_Empresa.SetFocus;
    lbl_online.font.color    := clRed;
    lbl_online.Caption       := 'Filial OffLine';
    BtnExecuta.Enabled       := False;
    Dtmen.Enabled            := False;
    Dtmai.Enabled            := False;
    Status.Enabled           := False;
    Atendente.Enabled        := False;
    Tecnico.Enabled          := False;
    Edt_Cliente.Enabled      := False;
    Tipo_Atendimento.Enabled := False;
    num_ordem.Enabled        := False;
    Centro_Custo.Enabled     := False;
    btnAtendente.Enabled     := False;
    btnTecnico.Enabled       := False;
    btnCliente.Enabled       := False;
    btnCentro_Custo.Enabled  := False;


    End;


   if FilialDb.Connected  Then
   Begin

    QRel.Connection       :=  FilialDb;
    QStatus.Connection    :=  FilialDb;
    QAtend.Connection     :=  FilialDb;
    QAtendente.Connection :=  FilialDb;
    QItens.Connection     :=  FilialDb;
    QRel.Connection       :=  FilialDb;
    QCliente.Connection   :=  FilialDb;

    QStatus.Open;
    QAtend.open;
    {
    FrmConsultaFilial.QConsulta.Connection    := FrmRelAgenda_Ordens_Servico_Filiais.FilialDb;
    FrmConsultaFilial.QProdutos.Connection    := FrmRelAgenda_Ordens_Servico_Filiais.FilialDb;
    FrmConsultaFilial.QOrcamento.Connection   := FrmRelAgenda_Ordens_Servico_Filiais.FilialDb;
    FrmConsultaFilial.QPedido.Connection      := FrmRelAgenda_Ordens_Servico_Filiais.FilialDb;
    FrmConsultaFilial.QPedidoVenda.Connection := FrmRelAgenda_Ordens_Servico_Filiais.FilialDb;
    FrmConsultaFilial.QOrdem.Connection       := FrmRelAgenda_Ordens_Servico_Filiais.FilialDb;
    FrmConsultaFilial.QPedido1.Connection     := FrmRelAgenda_Ordens_Servico_Filiais.FilialDb;
    FrmConsultaFilial.QSimilar.Connection     := FrmRelAgenda_Ordens_Servico_Filiais.FilialDb;
    }

    //QFilial.Connection :=FilialDb;
    QFilial_Empresa.Connection :=FilialDb;





    QFilial_Empresa.Sql.Text := 'SELECT * FROM EMPRESAS WHERE CNPJ = :CNPJ AND STATUS = ''A''';
    QFilial_Empresa.ParamByName('CNPJ').AsString :=  QSearch.FieldByName('CNPJ').AsString;
    QFilial_Empresa.Prepare;
    QFilial_Empresa.open;



   End
   Else
   Lista_Empresa.SetFocus;
  except

  end;

end;

procedure TFrmRelAgenda_Ordens_Servico_Filiais.btnAtendenteClick(Sender: TObject);
begin
  try
    Atendente.Value := GetConsultaFilial('PESSOAL', 0, 0, StrToInt(Atendente.Text));
  except
    Atendente.Value := GetConsultaFilial('PESSOAL', 0, 0, 0);
  end;
end;

procedure TFrmRelAgenda_Ordens_Servico_Filiais.btnCentro_CustoClick(Sender: TObject);
begin
  try
    Centro_Custo.Value := GetConsultaFilial('CCUSTO', 0, 0, StrToInt(Centro_Custo.Text));
  except
    Centro_Custo.Value := GetConsultaFilial('CCUSTO', 0, 0, 0);
  end;
end;

procedure TFrmRelAgenda_Ordens_Servico_Filiais.btnClienteClick(Sender: TObject);
begin
   try
    edt_cliente.Value := GetConsultaFilial('CLIENTES', 0, 0, StrToInt(edt_cliente.Text));
  except
    edt_cliente.Value := GetConsultaFilial('CLIENTES', 0, 0, 0);
  end;
end;

procedure TFrmRelAgenda_Ordens_Servico_Filiais.btnExecutaClick(Sender: TObject);
begin
  // 255, 325
  QRel.Sql.Clear;
  QRel.Sql.Add('SELECT ORDEM_SERVICO.*, FUNCIONARIOS.NOME');
  QRel.Sql.Add('FROM ORDEM_SERVICO');

  if Modelo.Text = 'Analítico' then
  begin
    QRel.Sql.Add('INNER JOIN FUNCIONARIOS');
    QRel.Sql.Add('ON (ORDEM_SERVICO.FUNCIONARIO = FUNCIONARIOS.FUNCIONARIO_ID)');
  end
  else
  begin
    QRel.Sql.Add('INNER JOIN FUNCIONARIOS');
    QRel.Sql.Add('ON (ORDEM_SERVICO.ATENDENTE = FUNCIONARIOS.FUNCIONARIO_ID)');
  end;

  QRel.Sql.Add('WHERE');

  if Rel_Fechamento.Checked then
    QRel.Sql.Add('(ORDEM_SERVICO.DT_FECHAMENTO BETWEEN :DT_INICIAL AND :DT_FINAL)')
  Else
    QRel.Sql.Add('(ORDEM_SERVICO.DT_ORDEM BETWEEN :DT_INICIAL AND :DT_FINAL)');

  if Atendente.Value > 0 then
  begin
    QRel.Sql.Add('AND (ORDEM_SERVICO.ATENDENTE = :ATENDENTE)');
    QRel.ParamByName('ATENDENTE').AsInteger := StrToInt(Atendente.Text);
  end;

  if Tecnico.Value > 0 then
  begin
    QRel.Sql.Add('AND (ORDEM_SERVICO.FUNCIONARIO = :FUNCIONARIO)');
    QRel.ParamByName('FUNCIONARIO').AsInteger := StrToInt(Tecnico.Text);
  end;

  if Centro_Custo.Value > 0 then
  begin
    QRel.Sql.Add('AND (ORDEM_SERVICO.C_CUSTO_ID = :C_CUSTO)');
    QRel.ParamByName('C_CUSTO').AsInteger := StrToInt(Centro_Custo.Text);
  end;

  if Status.Text <> '' then
  begin
    if Num_Ordem.Value = 0 then
    begin
      QRel.Sql.Add('AND (ORDEM_SERVICO.STATUS = :STATUS)');
      QRel.ParamByName('STATUS').AsString := Status.Text;
    end;
  end;

  if Tipo_Atendimento.Text <> '' then
  begin
    QRel.Sql.Add('AND (ORDEM_SERVICO.TIPO_ATENDIMENTO = :TIPO_ATENDIMENTO)');

    QRel.ParamByName('TIPO_ATENDIMENTO').AsString := Tipo_Atendimento.Text;
  end;

  if Aparelho.Text <> '' then
  begin
    QRel.Sql.Add('AND (ORDEM_SERVICO.APARELHO ILIKE :APARELHO)');

    QRel.ParamByName('APARELHO').AsString := Aparelho.Text + '%';
  end;


  if Num_Ordem.Value > 0 then
  begin
    QRel.Sql.Add('AND (ORDEM_SERVICO.ORDEM_ID = :NUM_ORDEM)');
    QRel.ParamByName('NUM_ORDEM').AsInteger := StrToInt(Num_Ordem.Text);
  end;


  if edt_cliente.Value > 0 then
  begin
    QRel.Sql.Add('AND (ORDEM_SERVICO.CLIENTE_ID =:CLIENTE_ID)');
    QRel.ParamByName('CLIENTE_ID').AsInteger := StrToInt(edt_cliente.Text);
  end;

  if Chk_removerabertas.Checked then
  Begin
    QRel.Sql.Add('AND (ORDEM_SERVICO.STATUS <> :STATUS)');
    QRel.ParamByName('STATUS').AsString := 'ABERTA';
  End;


  if Rel_Fechamento.Checked then
    QRel.Sql.Add('ORDER BY ORDEM_SERVICO.ORDEM_ID, FUNCIONARIOS.NOME, ORDEM_SERVICO.DT_FECHAMENTO, ORDEM_SERVICO.HORAS')
  Else
    QRel.Sql.Add('ORDER BY ORDEM_SERVICO.ORDEM_ID, FUNCIONARIOS.NOME, ORDEM_SERVICO.DT_ORDEM, ORDEM_SERVICO.HORAS');

  QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
  QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;

  QRel.Prepare;
  QRel.Open;


  QRLabel13.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;
  QRLabel93.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;

  if QRel.IsEmpty then
    Application.MessageBox('Não há dados para os parâmetros informados', PChar(Msg_Title), mb_IconInformation)
  else
  begin
    if Modelo.Text = 'Sintético' then
      //Rel_Ordem_Tecnico.PreviewModal
      Begin
       if CheckBox1.Checked = True then
           Begin
            RDprint1.Impressora := HP;
            RDprint1.FonteTamanhoPadrao := S10cpp;
           End;

          RDprint1.TamanhoQteColunas:=180;
          RDprint1.OpcoesPreview.Preview     := True;
          RDprint1.MostrarProgresso          := True;
          RDprint1.Acentuacao                := SemAcento;
          RDprint1.TamanhoQteLinhas          := 1;
          RDprint1.Abrir;

              if linha > 66 then
              begin
                RDprint1.novapagina;
                Pagina := Pagina + 1;
               end;

              Pagina:= 1;
              total_geral := 0;

           while not QRel.Eof do
            Begin


              QAtendente.SQL.Clear;
              QAtendente.SQL.Add('SELECT NOME FROM FUNCIONARIOS WHERE FUNCIONARIO_ID = :FUNCIONARIO_ID');
              QAtendente.ParamByName('FUNCIONARIO_ID').AsInteger :=  QRel.FieldByName('ATENDENTE').AsInteger;
              QAtendente.Prepare;
              QAtendente.Open;

              RDprint1.ImpF(linha, p1, QRel.FieldByName('ORDEM_ID').AsString,[negrito]);
              RDprint1.Imp(linha, p2, QRel.FieldByName('DT_ORDEM').AsString);
              RDprint1.Imp(linha, p3, Copy(QRel.FieldByName('NOME_CLIENTE').AsString, 1, 30));
              RDprint1.ImpVal(linha, p4, ',###,##0.00', QRel.FieldByName('VALOR_SERVICOS').AsFloat,[]);
              RDprint1.ImpVal(linha, p5, ',###,##0.00', QRel.FieldByName('VALOR_PECAS').AsFloat,[]);
              RDprint1.ImpVal(linha, p6, ',###,##0.00', QRel.FieldByName('VALOR').AsFloat,[]);
              RDprint1.Imp(linha, p7, QRel.FieldByName('TIPO_ATENDIMENTO').AsString);
              RDprint1.Imp(linha, p8, QRel.FieldByName('PREV_ATEND').AsString);
              RDprint1.Imp(linha, p9, QRel.FieldByName('DT_MOVIMENTO').AsString);
              RDprint1.Imp(linha, p10, Copy(QRel.FieldByName('NOME').AsString, 1, 27));
              RDprint1.Imp(linha, p11, QRel.FieldByName('STATUS').AsString);

              if chk_observacao.Checked then
              Begin
              inc(linha);
              RDprint1.Imp(linha, 01,'Observação:' );
              inc(linha);
              RDprint1.Imp(linha, 01, Copy(QRel.FieldByName('OBSERVACAO').AsString, 1, 180));
              inc(linha);
              RDprint1.Imp(linha, 01,'Aparelho:' );
              RDprint1.Imp(linha, 59,'Nº Serie:' );
              inc(linha);
              RDprint1.Imp(linha, 01,(QRel.FieldByName('APARELHO').AsString));
              RDprint1.Imp(linha, 59,(QRel.FieldByName('NUM_SERIE').AsString));
              inc(linha);
              RDprint1.LinhaH(linha,01,180,0,false);
              inc(linha);
              End;
              
              total_serv  := total_serv  + QRel.FieldByName('VALOR_SERVICOS').AsFloat;
              total_pecas := total_pecas + QRel.FieldByName('VALOR_PECAS').AsFloat;
              total_geral := total_geral + QRel.FieldByName('VALOR').AsFloat;
              total_desconto :=   total_desconto + QRel.FieldByName('DESCONTO').AsFloat ;

              Inc(linha);

              if linha > 63 then
              begin
                RDprint1.novapagina;
                Pagina := Pagina + 1;
              end;
              QRel.Next;
             End;


              RDprint1.LinhaH(linha, 01, 180, 0,false);
              Inc(linha);
              RDprint1.ImpF(linha, p3, 'Total Serviços => ',[negrito]);
              RDprint1.ImpVal(linha, p4, ',###,##0.00', total_serv,[negrito]);

              Inc(linha);
              RDprint1.ImpF(linha, p3+3, 'Total Peças => ',[negrito]);
              RDprint1.ImpVal(linha, p4, ',###,##0.00', total_pecas,[negrito]);

              Inc(linha);
              RDprint1.ImpF(linha, p3+3, 'Total Desconto => ',[negrito]);
              RDprint1.ImpVal(linha, p4, ',###,##0.00', total_desconto,[negrito]);

              Inc(linha);
              RDprint1.ImpF(linha, p3+3, 'Total Geral => ',[negrito]);
              RDprint1.ImpVal(linha, p4, ',###,##0.00', total_geral,[negrito]);

              total_serv     := 0;
              total_pecas    := 0;
              total_geral    := 0;
              total_desconto := 0;

        Application.ProcessMessages;
        RDprint1.TamanhoQteLinhas:= 66;
        RDprint1.Fechar;

      End
    else
     // Rel_Ordem_Servico.PreviewModal;
      begin
        if CheckBox1.Checked = True then
         Begin
          RDprint1.Impressora := HP;
          RDprint1.FonteTamanhoPadrao := S10cpp;
         End;

          RDprint1.Orientacao := poLandscape;
          RDprint1.TamanhoQteColunas:= 180;
          RDprint1.OpcoesPreview.Preview     := True;
          RDprint1.MostrarProgresso          := True;
          RDprint1.Acentuacao                := SemAcento;
          RDprint1.TamanhoQteLinhas          := 1;

          RDprint1.Abrir;

              if linha > 66 then
              begin
                RDprint1.novapagina;
                Pagina := Pagina + 1;
              end;

              Pagina:= 1;
              total_serv := 0;
              total_pecas := 0;
              total_geral := 0;

           while not QRel.Eof do
            Begin

              //consulta nome do atendente
              QAtendente.SQL.Clear;
              QAtendente.SQL.Add('SELECT NOME FROM FUNCIONARIOS WHERE FUNCIONARIO_ID = :FUNCIONARIO_ID');
              QAtendente.ParamByName('FUNCIONARIO_ID').AsInteger :=  QRel.FieldByName('ATENDENTE').AsInteger;
              QAtendente.Prepare;
              QAtendente.Open;

              RDprint1.Imp(linha, p1, QRel.FieldByName('ORDEM_ID').AsString);
              RDprint1.Imp(linha, p2, QRel.FieldByName('DT_ORDEM').AsString);
              RDprint1.Imp(linha, p3, Copy(QRel.FieldByName('NOME_CLIENTE').AsString, 1, 35));
              RDprint1.ImpVal(linha, p4, ',###,##0.00', QRel.FieldByName('VALOR_SERVICOS').AsFloat,[]);

              if QRel.FieldByName('VALOR_PECAS').AsFloat = 0 then
                 RDprint1.ImpVal(linha, p5, ',###,##0.00', QRel.FieldByName('VALOR_PECAS').AsFloat,[]);


              RDprint1.ImpVal(linha, p6, ',###,##0.00', QRel.FieldByName('VALOR').AsFloat,[]);
              RDprint1.Imp(linha, p7, Copy(QRel.FieldByName('TIPO_ATENDIMENTO').AsString, 1, 20));
              RDprint1.Imp(linha, p8, QRel.FieldByName('PREV_ATEND').AsString);
              RDprint1.Imp(linha, p9, QRel.FieldByName('DT_MOVIMENTO').AsString);
              RDprint1.Imp(linha, p10, Copy(QAtendente.FieldByName('NOME').AsString, 1, 27));
              RDprint1.Imp(linha, p11, QRel.FieldByName('STATUS').AsString);


              if QRel.FieldByName('VALOR_PECAS').AsFloat > 0 then
              begin

                 Inc(linha);
                 RDprint1.LinhaH(linha, p2, 79,0,false);  Inc(linha);
                 RDprint1.ImpF(linha, p2,'Peça',[negrito]);
                 RDprint1.ImpF(linha, p4+5,'Quant.',[negrito]);
                 RDprint1.ImpF(linha, p5+6,'Valor',[negrito]);
                 Inc(linha);

                QItens.SQL.Clear;
                QItens.SQL.Add('SELECT * FROM ORDEM_ITENS  WHERE ORDEM_ITENS.ORDEM_ID=:ORDEM_ID');
                QItens.SQL.Add('AND TP_PROD_SERV = :TIPO');
                QItens.ParamByName('ORDEM_ID').AsInteger :=  QRel.FieldByName('ORDEM_ID').AsInteger;
                QItens.ParamByName('TIPO').AsString :=  'P';
                QItens.Prepare;
                QItens.Open;

                soma_vr_pecas := 0;

                while not QItens.Eof do
                begin 
                  RDprint1.Imp(linha, p2, QItens.FieldByName('DESCRICAO').AsString);
                  RDprint1.ImpVal(linha, p4, ',###,##0.00', QItens.FieldByName('QUANTIDADE').AsFloat,[]);
                  RDprint1.ImpVal(linha, p5, ',###,##0.00', QItens.FieldByName('VR_UNITARIO').AsFloat,[]);

                  soma_vr_pecas := soma_vr_pecas + (QItens.FieldByName('VR_UNITARIO').AsFloat * QItens.FieldByName('QUANTIDADE').AsFloat );

                  Inc(linha);
                  QItens.Next;
                end;
                 RDprint1.LinhaH(linha, 73, p6, 0,false); Inc(linha);

                 RDprint1.ImpVal(linha, p5, ',###,##0.00', soma_vr_pecas,[negrito]);
                 Inc(linha);
                 soma_vr_pecas := 0;

                RDprint1.LinhaH(linha, p2, 79,0,false);  Inc(linha);

              end
              else
              begin
                Inc(linha);
              end;


              total_serv  := total_serv  + QRel.FieldByName('VALOR_SERVICOS').AsFloat;
              total_pecas := total_pecas + QRel.FieldByName('VALOR_PECAS').AsFloat;
              total_geral := total_geral + QRel.FieldByName('VALOR').AsFloat;
              total_desconto :=   total_desconto + QRel.FieldByName('DESCONTO').AsFloat ;


              Inc(linha);

              if linha > 63 then
              begin
                RDprint1.novapagina;
                Pagina := Pagina + 1;
              end;
                QRel.Next;
            End;

              RDprint1.LinhaH(linha, 01, 180, 0,false);
              Inc(linha);
              RDprint1.ImpF(linha, p3, 'Total Serviços => ',[negrito]);
              RDprint1.ImpVal(linha, p4, ',###,##0.00', total_serv,[negrito]);

              Inc(linha);
              RDprint1.ImpF(linha, p3+3, 'Total Peças => ',[negrito]);
              RDprint1.ImpVal(linha, p4, ',###,##0.00', total_pecas,[negrito]);

              Inc(linha);
              RDprint1.ImpF(linha, p3+3, 'Total Desconto => ',[negrito]);
              RDprint1.ImpVal(linha, p4, ',###,##0.00', total_desconto,[negrito]);

              Inc(linha);
              RDprint1.ImpF(linha, p3+3, 'Total Geral => ',[negrito]);
              RDprint1.ImpVal(linha, p4, ',###,##0.00', total_geral,[negrito]);

              total_serv  := 0;
              total_pecas := 0;
              total_geral := 0;
              total_desconto := 0;

        Application.ProcessMessages;
        RDprint1.TamanhoQteLinhas:= 66;
        RDprint1.Fechar; 
      end;
  end;
end;

procedure TFrmRelAgenda_Ordens_Servico_Filiais.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRelAgenda_Ordens_Servico_Filiais.btnTecnicoClick(Sender: TObject);
begin
  try
    Tecnico.Value := GetConsultaFilial('PESSOAL', 0, 0, StrToInt(Tecnico.Text));
  except
    Tecnico.Value := GetConsultaFilial('PESSOAL', 0, 0, 0);
  end;
end;

procedure TFrmRelAgenda_Ordens_Servico_Filiais.DtmenKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
  //  Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmRelAgenda_Ordens_Servico_Filiais.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmRelAgenda_Ordens_Servico_Filiais.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
QStatus.Open;
QAtend.Open;
end;

procedure TFrmRelAgenda_Ordens_Servico_Filiais.FormCreate(Sender: TObject);
begin
  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);
  QStatus.Open;
  QAtend.Open;
end;

procedure TFrmRelAgenda_Ordens_Servico_Filiais.FormShow(Sender: TObject);
begin

  IQuery.Sql.Clear;
  IQuery.Sql.Add('SELECT * FROM EMPRESAS');
  IQuery.Sql.Add('ORDER BY EMPRESA_ID');
  IQuery.Prepare;
  IQuery.Open;

  Lista_Empresa.Items.Clear;


  IQuery.First;
  while not IQuery.Eof do
  begin
    Lista_Empresa.Items.Add(IQuery.FieldByName('RAZAO').AsString);
    Application.ProcessMessages;
    IQuery.Next;
  end;

end;

procedure TFrmRelAgenda_Ordens_Servico_Filiais.Num_OrdemExit(Sender: TObject);
begin
   if Num_Ordem.Value > 0 then
   begin
     Status.Enabled := False;
   end
   else
     Status.Enabled := True;
end;

procedure TFrmRelAgenda_Ordens_Servico_Filiais.RDprint1NewPage(Sender: TObject;
  Pagina: Integer);
  begin

        if Modelo.Text = 'Sintético' then
        begin

            RDprint1.Imp(01, 01, QFilial_Empresa.FieldByName('RAZAO').AsString);
            RDprint1.ImpDir(01, (length(QFilial_Empresa.FieldByName('RAZAO').AsString)), 180, 'Sistema de Automação de empresas Eficaz', []);
            RDprint1.Imp(02, 01, 'Data/Hora: ' + DateToStr(date) + ' - ' + TimeToStr(now));
            RDprint1.impDir(02, 80, 180, 'Página: ' + IntToStr(Pagina), []);
            RDprint1.impC(03, 80, '*** ORDENS DE SERVIÇO POR ATENDENTE ***',[negrito]);
            RDprint1.imp(04, 01, 'Período:'+ datetoStr(dtmen.date) + ' à ' + datetoStr(dtmai.date));

            if Tecnico.value > 0 Then
            Begin
            QCliente.Sql.Clear;
            QCliente.Sql.Add('SELECT NOME FROM FUNCIONARIOS WHERE FUNCIONARIO_ID = :FUNCIONARIO_ID');
            QCliente.ParamByName('FUNCIONARIO_ID').AsInteger := StrToInt(Tecnico.Text);
            QCliente.Prepare;
            QCliente.Open;

            RDprint1.imp(05, 01, 'Técnico: ' + QCliente.FieldByName('NOME').AsString);
            RDprint1.LinhaH(06,01,180,0,false);
            End
            Else
            //RDprint1.LinhaH(05,01,180,0,false);


            if Edt_Cliente.value > 0 Then
            Begin
            QCliente.Sql.Clear;
            QCliente.Sql.Add('SELECT NOME,CNPJ,ENDERECO,NUMERO,BAIRRO,MUNICIPIO,ESTADO FROM CLIENTES WHERE CLIENTE_ID = :CLIENTE_ID');
            QCliente.ParamByName('CLIENTE_ID').AsInteger := StrToInt(Edt_Cliente.Text);
            QCliente.Prepare;
            QCliente.Open;

            RDprint1.impc(05, 01, 'Razão: ' + QCliente.FieldByName('NOME').AsString,[negrito]);
            RDprint1.impc(06, 01, 'Cnpj: ' + QCliente.FieldByName('CNPJ').AsString,[negrito]);
            RDprint1.impc(07, 01, 'Endereço: ' + QCliente.FieldByName('ENDERECO').AsString + ',' + QCliente.FieldByName('NUMERO').AsString +' - ' + QCliente.FieldByName('BAIRRO').AsString ,[negrito]);
            RDprint1.impc(08, 01, 'Cidade: ' + QCliente.FieldByName('MUNICIPIO').AsString + ' - ' + QCliente.FieldByName('ESTADO').AsString,[negrito]);

            RDprint1.LinhaH(09,01,180,0,false);
            End
            Else
            RDprint1.LinhaH(05,01,180,0,false);


            //POSICAO DAS COLUNAS
            p1 := 01;
            p2 := 08;
            p3 := 20;
            p4 := 56;
            p5 := 68;
            p6 := 79;
            p7 := 91;
            p8 := 113;
            p9 := 128;
            p10 := 140;
            p11 := 170;

            if Tecnico.value > 0 Then
            Begin
            RDprint1.imp(07, p1, 'Núm.');
            RDprint1.imp(07, p2, 'Data');
            RDprint1.imp(07, p3, 'Cliente');
            RDprint1.imp(07, p4+3, 'Serviços');
            RDprint1.imp(07, p5+6, 'Peças');
            RDprint1.imp(07, p6+6, 'Total');
            RDprint1.imp(07, p7, 'Atendimento');
            RDprint1.imp(07, p8, 'D.P. Ent.');
            RDprint1.imp(07, p9, 'Dt. Ent.');
            RDprint1.imp(07, p10, 'Atendente');
            RDprint1.imp(07, p11, 'Situação');

            RDprint1.LinhaH(08,01,180,0,false);
            linha:= 09;
            End
            Else IF  Edt_Cliente.value > 0 Then
            Begin
            RDprint1.imp(10, p1, 'Núm.');
            RDprint1.imp(10, p2, 'Data');
            RDprint1.imp(10, p3, 'Cliente');
            RDprint1.imp(10, p4+3, 'Serviços');
            RDprint1.imp(10, p5+6, 'Peças');
            RDprint1.imp(10, p6+6, 'Total');
            RDprint1.imp(10, p7, 'Atendimento');
            RDprint1.imp(10, p8, 'D.P. Ent.');
            RDprint1.imp(10, p9, 'Dt. Ent.');
            RDprint1.imp(10, p10, 'Atendente');
            RDprint1.imp(10, p11, 'Situação');

            RDprint1.LinhaH(11,01,180,0,false);
            linha:= 12;

            End
            Else
            Begin
            RDprint1.imp(06, p1, 'Núm.');
            RDprint1.imp(06, p2, 'Data');
            RDprint1.imp(06, p3, 'Cliente');
            RDprint1.imp(06, p4+3, 'Serviços');
            RDprint1.imp(06, p5+6, 'Peças');
            RDprint1.imp(06, p6+6, 'Total');
            RDprint1.imp(06, p7, 'Atendimento');
            RDprint1.imp(06, p8, 'D.P. Ent.');
            RDprint1.imp(06, p9, 'Dt. Ent.');
            RDprint1.imp(06, p10, 'Atendente');
            RDprint1.imp(06, p11, 'Situação');

            RDprint1.LinhaH(07,01,180,0,false);
            linha:= 08;

            End;


        end
        else
        begin

            RDprint1.Imp(01, 01, QFilial_Empresa.FieldByName('RAZAO').AsString);
            RDprint1.ImpDir(01, (length(QFilial_Empresa.FieldByName('RAZAO').AsString)), 180, 'Sistema de Automação de empresas Eficaz', []);
            RDprint1.Imp(02, 01, 'Data/Hora: ' + DateToStr(date) + ' - ' + TimeToStr(now));
            RDprint1.impDir(02, 80, 180, 'Página: ' + IntToStr(Pagina), []);
            RDprint1.impC(03, 80, '*** ORDENS DE SERVIÇO POR ATENDENTE ***',[negrito]);
            RDprint1.imp(04, 01, 'Período:'+ datetoStr(dtmen.date) + ' à ' + datetoStr(dtmai.date));

            if Tecnico.value > 0 Then
            Begin
            QCliente.Sql.Clear;
            QCliente.Sql.Add('SELECT NOME FROM FUNCIONARIOS WHERE FUNCIONARIO_ID = :FUNCIONARIO_ID');
            QCliente.ParamByName('FUNCIONARIO_ID').AsInteger := StrToInt(Tecnico.Text);
            QCliente.Prepare;
            QCliente.Open;

            RDprint1.imp(05, 01, 'Técnico: ' + QCliente.FieldByName('NOME').AsString);
            RDprint1.LinhaH(06,01,180,0,false);
            End
            Else
           // RDprint1.LinhaH(05,01,180,0,false);

            if Edt_Cliente.value > 0 Then
            Begin
            QCliente.Sql.Clear;
            QCliente.Sql.Add('SELECT NOME,CNPJ,ENDERECO,NUMERO,BAIRRO,MUNICIPIO,ESTADO FROM CLIENTES WHERE CLIENTE_ID = :CLIENTE_ID');
            QCliente.ParamByName('CLIENTE_ID').AsInteger := StrToInt(Edt_Cliente.Text);
            QCliente.Prepare;
            QCliente.Open;

            RDprint1.impc(05, 01, 'Razão: ' + QCliente.FieldByName('NOME').AsString,[negrito]);
            RDprint1.impc(06, 01, 'Cnpj: ' + QCliente.FieldByName('CNPJ').AsString,[negrito]);
            RDprint1.impc(07, 01, 'Endereço: ' + QCliente.FieldByName('ENDERECO').AsString + ',' + QCliente.FieldByName('NUMERO').AsString +' - ' + QCliente.FieldByName('BAIRRO').AsString ,[negrito]);
            RDprint1.impc(08, 01, 'Cidade: ' + QCliente.FieldByName('MUNICIPIO').AsString + ' - ' + QCliente.FieldByName('ESTADO').AsString,[negrito]);

            RDprint1.LinhaH(09,01,180,0,false);
            End
            Else
            RDprint1.LinhaH(05,01,180,0,false);


            //POSICAO DAS COLUNAS
            p1 := 01;
            p2 := 08;
            p3 := 23;
            p4 := 60;
            p5 := 68;
            p6 := 79;
            p7 := 91;
            p8 := 113;
            p9 := 128;
            p10 := 140;
            p11 := 170;

            if Tecnico.value > 0 Then
            Begin
            RDprint1.imp(07, p1, 'Núm.');
            RDprint1.imp(07, p2, 'Data');
            RDprint1.imp(07, p3, 'Cliente');
            RDprint1.imp(07, p4+3, 'Serviços');
            RDprint1.imp(07, p5+6, 'Peças');
            RDprint1.imp(07, p6+6, 'Total');
            RDprint1.imp(07, p7, 'Atendimento');
            RDprint1.imp(07, p8, 'D.P. Ent.');
            RDprint1.imp(07, p9, 'Dt. Ent.');
            RDprint1.imp(07, p10, 'Atendente');
            RDprint1.imp(07, p11, 'Situação');

            RDprint1.LinhaH(08,01,180,0,false);
            linha:= 09;
            End
            Else if Edt_Cliente.value > 0 Then
            Begin

            RDprint1.imp(10, p1, 'Núm.');
            RDprint1.imp(10, p2, 'Data');
            RDprint1.imp(10, p3, 'Cliente');
            RDprint1.imp(10, p4+3, 'Serviços');
            RDprint1.imp(10, p5+6, 'Peças');
            RDprint1.imp(10, p6+6, 'Total');
            RDprint1.imp(10, p7, 'Atendimento');
            RDprint1.imp(10, p8, 'D.P. Ent.');
            RDprint1.imp(10, p9, 'Dt. Ent.');
            RDprint1.imp(10, p10, 'Atendente');
            RDprint1.imp(10, p11, 'Situação');

            RDprint1.LinhaH(11,01,180,0,false);
            linha:= 12;

            End
            Else

            Begin

            RDprint1.imp(06, p1, 'Núm.');
            RDprint1.imp(06, p2, 'Data');
            RDprint1.imp(06, p3, 'Cliente');
            RDprint1.imp(06, p4+3, 'Serviços');
            RDprint1.imp(06, p5+6, 'Peças');
            RDprint1.imp(06, p6+6, 'Total');
            RDprint1.imp(06, p7, 'Atendimento');
            RDprint1.imp(06, p8, 'D.P. Ent.');
            RDprint1.imp(06, p9, 'Dt. Ent.');
            RDprint1.imp(06, p10, 'Atendente');
            RDprint1.imp(06, p11, 'Situação');

            RDprint1.LinhaH(07,01,180,0,false);
            linha:= 08;

            End;

        end;





  end;

procedure TFrmRelAgenda_Ordens_Servico_Filiais.TecnicoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = Tecnico) then
    btnTecnicoClick(Self);

  if (Key = Vk_F7) and (Sender = Centro_Custo) then
    btnCentro_CustoClick(Self);

   if (Key = Vk_F7) and (Sender = Atendente) then
    btnAtendenteClick(Self);

   if (Key = Vk_F7) and (Sender = edt_cliente) then
    btnClienteClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

end.
