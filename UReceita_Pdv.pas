unit UReceita_Pdv;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, RxCurrEdit, Vcl.DBCtrls,
  Vcl.Buttons, Vcl.Mask, RxToolEdit, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ExtCtrls;

type
  TFrmDebito_Pontos_Parceiro = class(TForm)
    Label2: TLabel;
    Cliente: TCurrencyEdit;
    btnCliente: TSpeedButton;
    DBText2: TDBText;
    Label3: TLabel;
    Valor: TRxCalcEdit;
    btnExecuta: TButton;
    btnRetorna: TButton;
    QFuncionario: TFDQuery;
    DataFuncionario: TDataSource;
    Panel1: TPanel;
    Label5: TLabel;
    QUpdate: TFDQuery;
    IQuery: TFDQuery;
    Label1: TLabel;
    Descricao: TEdit;
    Query: TFDQuery;
    Label4: TLabel;
    DT_TRANS: TDateEdit;
    procedure ClienteExit(Sender: TObject);
    procedure EntidadeExit(Sender: TObject);
    procedure ClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnClienteClick(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure FinalizadoraExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DetailSearch(Tabela: String);
  end;

var
  FrmDebito_Pontos_Parceiro: TFrmDebito_Pontos_Parceiro;

  vr_troco:real;
  cupom,num_ecf,hora_d,cupom_receita:string;
  operador,dia,mes,ano,parcelas:integer;
  Dt_Venc: TDate;

  procedure Receita_Pdv(ecf,hora :string;id_operador:integer );

implementation

{$R *.dfm}

Uses
UVenda,UConsulta,Funcoes;


procedure TFrmDebito_Pontos_Parceiro.DetailSearch(Tabela: String);
begin


  if ((Tabela = '') or (Tabela = 'Cliente')) and (cliente.Text <> '') then
  begin
    Qcliente.Close;
    Qcliente.ParamByName('CLIENTE').AsInteger   := StrToInt(CLIENTE.Text);
    Qcliente.Prepare;
    Qcliente.Open;


    if QCliente.IsEmpty then
    Begin
     Application.MessageBox('Necessário informar o código do cliente',  'PDVEficaz', mb_IconStop + mb_ok);
     Cliente.SetFocus;
    End;


   end;

  end;


procedure Receita_Pdv(ecf, hora :string;id_operador:integer );
begin


  num_ecf          := Ecf;
  hora_d           := hora;
  operador         := id_operador;

  Application.CreateForm(TFrmREceita_Pdv, FrmReceita_Pdv);
  try
    FrmReceita_Pdv.ShowModal;
  finally
    FrmReceita_Pdv.Release;
  end;

end;


procedure TFrmDebito_Pontos_Parceiro.btnClienteClick(Sender: TObject);
begin
try
    Cliente.Value := GetConsulta('PARCEIRO', 0, 0, StrToInt(Cliente.Text));
  except
    Cliente.Value := GetConsulta('PARCEIRO', 0, 0, 0);
  end;
end;

procedure TFrmDebito_Pontos_Parceiro.btnExecutaClick(Sender: TObject);
begin



  if Qcliente.IsEmpty then
  Begin

   Application.MessageBox('Favor informar o cliente para a inclusão do  Débito.', PChar(Msg_Title), mb_IconInformation);

   Cliente.Color := clYellow;
   Cliente.SetFocus;
   exit;

  End;


  if Descricao.Text =  ''  then
  Begin

   Application.MessageBox('Favor informar descrição para incluião do débito.', PChar(Msg_Title), mb_IconInformation);

   Descricao.Color := clYellow;
   Descricao.SetFocus;
   exit;

  End;


   if valor.value <= 0 then
  Begin

   Application.MessageBox('Valor para o Débido nao pode ser Zero.', PChar(Msg_Title), mb_IconInformation);

   valor.Color := clYellow;
   valor.SetFocus;
   exit;

  End;


 if  Application.MessageBox(Pchar('Confirma o valor do Débito?' + #13 + 'Cliente: ' + QCliente.FieldByName('NOME').AsString + #13 +
                                  'Valor: R$' + FloatToStrF(Valor.Value, FFnumber, 15, 2)), 'PdvEficaz', mb_YesNo + mb_IconQuestion + mb_DefButton1) = IDYES then

 Begin

    //try

      try
      IQuery.SQL.Clear;
      IQuery.SQL.Add('SELECT NEXTVAL(:GEN_TRANSACOES) ID');
      IQuery.ParamByName('GEN_TRANSACOES').AsString := 'GEN_TRANSACOES';

      IQuery.Prepare;
      IQuery.Open;

      Cupom_receita := StrZero(intToStr(IQuery.FieldByName('ID').AsInteger), 8, 0);


      QUpdate.SQL.Clear;
      QUpdate.SQL.Add('INSERT INTO FECHAMENTO_CUPOM(' +
        'CUPOM,               CAIXA_ID,            OPERADOR_ID, ' +
        'FINALIZADORA_ID,     LEGENDA,             DATA, ' +
        'HORA,                VALOR_CUPOM,         ACRESCIMO, ' +
        'DESCONTO,            VALOR_FINALIZADORA,  FISCAL, EXPORTADO) VALUES(' +
        ':CUPOM,              :CAIXA_ID,           :OPERADOR_ID, ' +
        ':FINALIZADORA_ID,    :LEGENDA,            :DATA, ' +
        ':HORA,               :VALOR_CUPOM,        :ACRESCIMO, ' +
        ':DESCONTO,           :VALOR_FINALIZADORA, :FISCAL ,:EXPORTADO)');

      QUpdate.ParamByName('CUPOM').AsString             := Cupom_receita;
      QUpdate.ParamByName('CAIXA_ID').AsInteger         := StrToInt(num_ecf);
      QUpdate.ParamByName('OPERADOR_ID').AsInteger      := operador;
      QUpdate.ParamByName('FINALIZADORA_ID').AsInteger  := 2;
      QUpdate.ParamByName('LEGENDA').AsString           := 'A PRAZO';
      QUpdate.ParamByName('DATA').AsDateTime            := Date;
      QUpdate.ParamByName('HORA').AsString              := hora_d;
      QUpdate.ParamByName('VALOR_CUPOM').AsFloat        := StrToFloat(Valor.Text);
      QUpdate.ParamByName('ACRESCIMO').AsFloat          := 0;
      QUpdate.ParamByName('DESCONTO').AsFloat           := 0;
      QUpdate.ParamByName('VALOR_FINALIZADORA').AsFloat := StrToFloat(Valor.Text);
      QUpdate.ParamByName('FISCAL').AsString            := 'S';
      QUpdate.ParamByName('EXPORTADO').AsInteger        := 0;

      QUpdate.Prepare;
      QUpdate.ExecSQL;
      except


      on E: Exception do
          begin
            Application.MessageBox
              (PChar('Erro 1:' + #13 + 'Erro: Incluir fechamento ' + E.Message), 'Erro', mb_IconStop + MB_TASKMODAL);
          end;

      end;


      try

        QUpdate.Sql.Clear;
        QUpdate.Sql.Add('INSERT INTO TRANSACOES( ' +
          'TRANSACAO_ID,  DT_TRANS,    DT_MOVIMENTO,  CONDUTA, ' +
          'DEPTO,         EMPRESA_ID,  CONTA_ID,      C_CUSTO_ID, ' +
          'VALOR,         TPCTB,       AUTORIZ_ID,    HISTORICO, ' +
          'CONTAAUX_ID,   NUM_DOC,     BANCO_ID,      BALANCO, ' +
          'COND_PAGTO,    FLUXO_CAIXA_ID,COMPLEMENTO,TRANSACAO_ORIGEM,FINALIZADORA_ID,FUNCIONARIO_ID,CLIENTE_ID,MODELO,OPERADOR) VALUES(' +
          ':TRANSACAO_ID, :DT_TRANS,   :DT_MOVIMENTO, :CONDUTA, ' +
          ':DEPTO,        :EMPRESA_ID, :CONTA_ID,     :C_CUSTO_ID, ' +
          ':VALOR,        :TPCTB,      :AUTORIZ_ID,   :HISTORICO, ' +
          ':CONTAAUX_ID,  :NUM_DOC,    :BANCO_ID,     :BALANCO, ' +
          ':COND_PAGTO,   :FLUXO_CAIXA_ID,:COMPLEMENTO,:TRANSACAO_ORIGEM,:FINALIZADORA_ID,:FUNCIONARIO_ID,:CLIENTE_ID,:MODELO,:OPERADOR)');

        QUpdate.ParamByName('TRANSACAO_ID').AsInteger   := IQuery.FieldByName('ID').AsInteger;
        QUpdate.ParamByName('DT_TRANS').AsDateTime      := Date;
        QUpdate.ParamByName('DT_MOVIMENTO').AsDateTime  := Date;
        QUpdate.ParamByName('CONDUTA').AsString         := '01';
        QUpdate.ParamByName('DEPTO').AsString           := '03';
        QUpdate.ParamByName('EMPRESA_ID').AsInteger     := FrmVenda.QEmpresa.FieldByName('EMPRESA_ID').AsInteger;
        QUpdate.ParamByName('CONTA_ID').AsInteger       := FrmVenda.Config.FieldByName('CONTA_ESTOQUE').AsInteger;
        QUpdate.ParamByName('C_CUSTO_ID').AsInteger     := 1;
        QUpdate.ParamByName('VALOR').AsFloat            := Valor.Value;
        QUpdate.ParamByName('TPCTB').AsString           := '2';
        QUpdate.ParamByName('AUTORIZ_ID').AsInteger     := 0;
        QUpdate.ParamByName('HISTORICO').AsString       := 'Inclusão de Débito para o Cliente no  Pdv: ' + num_ecf + ' em : ' + DateToStr(Date) +' as: ' + hora_d;
        QUpdate.ParamByName('CONTAAUX_ID').AsInteger    := 0;
        QUpdate.ParamByName('NUM_DOC').AsString         := Cupom_receita;
        QUpdate.ParamByName('BANCO_ID').AsInteger       := StrToInt(num_ecf);
        QUpdate.ParamByName('BALANCO').AsString         := 'LIBERADO';
        QUpdate.ParamByName('COND_PAGTO').AsString      := 'A PRAZO';
        QUpdate.ParamByName('FLUXO_CAIXA_ID').AsInteger := 2;
        QUpdate.ParamByName('COMPLEMENTO').AsString     := DESCRICAO.Text;
        QUpdate.ParamByName('TRANSACAO_ORIGEM').AsInteger   := IQuery.FieldByName('ID').AsInteger;
        QUpdate.ParamByName('FINALIZADORA_ID').AsInteger := 2;
        QUpdate.ParamByName('FUNCIONARIO_ID').AsInteger  := Operador_Sup;
        QUpdate.ParamByName('CLIENTE_ID').AsInteger      := QCliente.FieldByName('CLIENTE_ID').AsInteger;
        QUpdate.ParamByName('MODELO').AsString           := '30';
        QUpdate.ParamByName('OPERADOR').AsString         := IntToStr(Id_Operador);

        QUpdate.Prepare;
        QUpdate.ExecSql;

       except
        on e: Exception do
        begin
          Application.MessageBox(PChar('Erro ao Gravar Transação' + #13 +
            'Erro: ' + e.Message), PChar(Msg_Title),
            mb_IconStop + mb_TaskModal);
        end;

      end;


              TRY

         Dia := StrToInt(Copy(DateToStr(Date), 1, 2));
         Mes := StrToInt(Copy(DateToStr(Date), 4, 2));
         Ano := StrToInt(Copy(DateToStr(Date), 7, 4));

         Parcelas :=   1;

          QUpdate.SQL.Clear;
          QUpdate.SQL.Add('INSERT INTO TRANSPARCELAS(TRANSACAO_ID, PARCELA_ID, TIPO_TRANSACAO, DT_VENCIMENTO, BANCO_ID, VALOR, DUPLICATA,ECF,DATA) VALUES(:TRANSACAO_ID, :PARCELA_ID, :TIPO_TRANSACAO, :DT_VENCIMENTO, :BANCO_ID, :VALOR, :DUPLICATA,:ECF,:DATA)');
          QUpdate.ParamByName('TRANSACAO_ID').AsInteger := IQuery.FieldByName('ID').AsInteger;
          QUpdate.ParamByName('PARCELA_ID').AsString    := StrZero(IntToStr(1), 2, 0) + '/' + StrZero(IntToStr(Num_Parcelas), 2, 0);
          QUpdate.ParamByName('TIPO_TRANSACAO').AsString := 'T';
          QUpdate.ParamByName('BANCO_ID').AsInteger := 0;
          QUpdate.ParamByName('ECF').AsInteger   := StrToInt(num_ecf);
          QUpdate.ParamByName('DATA').AsDateTime := Date;

           begin
            Mes := Mes + 1;

            if Mes > 12 then
            begin
              Mes := 1;
              Ano := Ano + 1;
            end;
          end;

          try
            Dt_Venc := StrToDate(StrZero(IntToStr(Dia), 2, 0) + '/' + StrZero(IntToStr(Mes), 2, 0) + '/' + StrZero(IntToStr(Ano), 4, 0));
          except
            Dt_Venc := StrToDate('01/' + StrZero(IntToStr(Mes + 1), 2, 0) + '/' + StrZero(IntToStr(Ano), 4, 0));
          end;

          QUpdate.ParamByName('DT_VENCIMENTO').AsDateTime := Dt_Venc;


          QUpdate.ParamByName('VALOR').AsFloat :=  Valor.Value;

          QUpdate.ParamByName('DUPLICATA').AsString := StrZero(Cupom_receita, 7, 0) + '/' + StrZero(IntToStr(Parcelas), 2, 0);

          QUpdate.Prepare;
          QUpdate.ExecSQL;


          FrmVenda.InformaServidor(StrZero(IntToStr(StrToInt(num_ecf)), 3,0), '');

        EXCEPT
          on E: Exception do
          begin
            Application.MessageBox
              (PChar('Erro 1:' + #13 + 'Erro: Incluir Parcela da Receita ' + E.Message), 'Erro', mb_IconStop + MB_TASKMODAL);
          end;

        END;


     Application.MessageBox('Confirmado valor da débito ! ', PChar(Msg_Title), mb_IconInformation);

     Application.ProcessMessages;

     Close;

     if Application.MessageBox('Deseja imprimir o comprovante das parcelas?','PDVEficaz', mb_YesNo + mb_IconQuestion + mb_DefButton1) = idYes then
    begin

       FrmVenda.ACBrPosPrinter1.Buffer.Clear;
       FrmVenda.ACBrPosPrinter1.Buffer.Add(' '                                    );
       if LeIni(ExtractFilePath(ParamStr(0)) + 'PDVEficaz.Ini', 'VirtualNfce','Modelo') <> 'Bematech' then
       FrmVenda.ACBrPosPrinter1.Buffer.Add('</corte>'                             );
       FrmVenda.ACBrPosPrinter1.Buffer.Add('</c>' + FrmVenda.QEmpresa.FieldByName('RAZAO').AsString);
       FrmVenda.ACBrPosPrinter1.Buffer.Add(FrmVenda.QEmpresa.FieldByName('ENDERECO').AsString + ',' + FrmVenda.QEmpresa.FieldByName('NUMERO').AsString);
       FrmVenda.ACBrPosPrinter1.Buffer.Add(FrmVenda.QEmpresa.FieldByName('BAIRRO').AsString +  '- ' + FrmVenda.QEmpresa.FieldByName('MUNICIPIO').AsString);
       FrmVenda.ACBrPosPrinter1.Buffer.Add(FrmVenda.QEmpresa.FieldByName('ESTADO').AsString +  '- ' + FrmVenda.QEmpresa.FieldByName('CEP').AsString);
       FrmVenda.ACBrPosPrinter1.Buffer.Add('                                    ');
       FrmVenda.ACBrPosPrinter1.Buffer.Add('COO do Documento de compra: ' + FrmVenda.AcbrEcf1.NumCOO);
       FrmVenda.ACBrPosPrinter1.Buffer.Add('Valor Total da Compra: R$'+FloatToStrf(Valor_Cupom,ffNumber,15,2));
       FrmVenda.ACBrPosPrinter1.Buffer.Add('                                    ');


       FrmVenda.ACBrPosPrinter1.Buffer.Add('                                    ');
       FrmVenda.ACBrPosPrinter1.Buffer.Add('                                    ');
       FrmVenda.ACBrPosPrinter1.Buffer.Add('                                    ');
       FrmVenda.ACBrPosPrinter1.Buffer.Add('Reconheco a exatidao do DEBITO acima');
       FrmVenda.ACBrPosPrinter1.Buffer.Add('e me comprometo a liquida-lo no pra-');
       FrmVenda.ACBrPosPrinter1.Buffer.Add('zo de vencimento. O nao  cumprimento');
       FrmVenda.ACBrPosPrinter1.Buffer.Add('na data prevista, me  responsabilizo');
       FrmVenda.ACBrPosPrinter1.Buffer.Add('pelo pagamento da multa e juros con-');
       FrmVenda.ACBrPosPrinter1.Buffer.Add('forme a lei, sob pena de inclusao do');
       FrmVenda.ACBrPosPrinter1.Buffer.Add('nome junto ao SPC                   ');
       FrmVenda.ACBrPosPrinter1.Buffer.Add('                                    ');
       FrmVenda.ACBrPosPrinter1.Buffer.Add('                                    ');
       FrmVenda.ACBrPosPrinter1.Buffer.Add('            PARCELAMENTO            ');
       FrmVenda.ACBrPosPrinter1.Buffer.Add('====================================');

        QUpdate.SQL.Clear;
        QUpdate.SQL.Add('SELECT * FROM TRANSPARCELAS');
        QUpdate.SQL.Add('WHERE');
        QUpdate.SQL.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
        QUpdate.SQL.Add('AND (BANCO_ID = 0) ORDER BY PARCELA_ID');

        QUpdate.ParamByName('TRANSACAO_ID').AsInteger := IQuery.FieldByName('ID').AsInteger;

        QUpdate.Prepare;
        QUpdate.Open;

        QUpdate.First;
        while not QUpdate.Eof do
        begin
           FrmVenda.ACBrPosPrinter1.Buffer.Add(QUpdate.FieldByName('PARCELA_ID').AsString + ' - Venc.: ' + QUpdate.FieldByName('DT_VENCIMENTO').AsString + ' - Valor: ' + FormatFloat('#,##0.00', QUpdate.FieldByName('VALOR').AsFloat));

          Application.ProcessMessages;

          QUpdate.Next;
        end;

       FrmVenda.ACBrPosPrinter1.Buffer.Add('                                    ');
       FrmVenda.ACBrPosPrinter1.Buffer.Add('                                    ');
       FrmVenda.ACBrPosPrinter1.Buffer.Add('                                    ');
       FrmVenda.ACBrPosPrinter1.Buffer.Add('   RECONHECO E  PAGAREI A  DIVIDA   ');
       FrmVenda.ACBrPosPrinter1.Buffer.Add('          AQUI APRESENTADA          ');
       FrmVenda.ACBrPosPrinter1.Buffer.Add('                                    ');
       FrmVenda.ACBrPosPrinter1.Buffer.Add('                                    ');
       FrmVenda.ACBrPosPrinter1.Buffer.Add('                                    ');
       FrmVenda.ACBrPosPrinter1.Buffer.Add('____________________________________');
       FrmVenda.ACBrPosPrinter1.Buffer.Add('                                    ');
       FrmVenda.ACBrPosPrinter1.Buffer.Add('                                    ');
       FrmVenda.ACBrPosPrinter1.Buffer.Add(ForcaComprimento(QCliente.FieldByName('NOME').AsString, 36, ' '));
       FrmVenda.ACBrPosPrinter1.Buffer.Add('CPF: ' + QCliente.FieldByName('CNPJ').AsString);
       FrmVenda.ACBrPosPrinter1.Buffer.Add('                                    ');
       FrmVenda.ACBrPosPrinter1.Buffer.Add('                                    ');
       if LeIni(ExtractFilePath(ParamStr(0)) + 'PDVEficaz.Ini', 'VirtualNfce','Modelo') <> 'Bematech' then
       FrmVenda.ACBrPosPrinter1.Buffer.Add('                        </corte>');
       FrmVenda.ACBrPosPrinter1.Buffer.Add('                        </c>');


       FrmVenda.ACBrPosPrinter1.CortarPapel(true);

       End;

   {
    except

    on e:Exception do
        begin
          Application.MessageBox(PChar('Erro gravar débito para o cliente:' + #13 +
            'Erro: ' + e.Message), 'Erro', MB_ICONSTOP + MB_TASKMODAL);
        end;

    end;
     }
 End
 Else
 Exit;


end;

procedure TFrmDebito_Pontos_Parceiro.ClienteExit(Sender: TObject);
begin
 DetailSearch('Cliente');
end;

procedure TFrmDebito_Pontos_Parceiro.ClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

if (Key = Vk_F7) and (Sender = cliente) then
    btnclienteClick(Self);

 if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);

if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);

end;

procedure TFrmDebito_Pontos_Parceiro.FinalizadoraExit(Sender: TObject);
begin
 DetailSearch('Forma');
end;

procedure TFrmDebito_Pontos_Parceiro.EntidadeExit(Sender: TObject);
begin
DetailSearch('Entidade');
end;

end.
