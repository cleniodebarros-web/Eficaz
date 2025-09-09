unit UFecha_Orcamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, rxCurrEdit, Buttons, DBCtrls, StdCtrls, Mask, rxToolEdit, ExtCtrls,
  DB, IBCustomDataSet, IBQuery, IBStoredProc, QRCtrls, QuickRpt, RDprint,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,Math,
  ACBrBase, ACBrPosPrinter;

type
  TFrmFecha_Orcamento = class(TForm)
    VENDEDOR_ID: TCurrencyEdit;
    COND_PAGTO: TComboBox;
    Label16: TLabel;
    CEP: TMaskEdit;
    Label10: TLabel;
    ESTADO: TComboBox;
    Label8: TLabel;
    MUNICIPIO: TEdit;
    Label9: TLabel;
    BAIRRO: TEdit;
    Label7: TLabel;
    ENDERECO: TEdit;
    Label5: TLabel;
    NOME: TEdit;
    Label4: TLabel;
    DBText2: TDBText;
    btnCliente: TSpeedButton;
    CLIENTE_ID: TCurrencyEdit;
    Label3: TLabel;
    COMISSAO: TRxCalcEdit;
    Label27: TLabel;
    DBText6: TDBText;
    btnVendedor: TSpeedButton;
    Label26: TLabel;
    DataVendedor: TDataSource;
    DataCliente: TDataSource;
    Panel1: TPanel;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    Orcamento: TQuickRep;
    QRBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText15: TQRDBText;
    QRShape2: TQRShape;
    QRLabel18: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape3: TQRShape;
    QRLabel15: TQRLabel;
    QRLabel14: TQRLabel;
    QRSysData1: TQRSysData;
    Cabec: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText10: TQRDBText;
    QRBand2: TQRBand;
    QRShape5: TQRShape;
    QRExpr1: TQRExpr;
    QRLabel5: TQRLabel;
    QRDBText11: TQRDBText;
    OBSERVACAO: TMemo;
    Label1: TLabel;
    QRLabel22: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel21: TQRLabel;
    QRMemo1: TQRMemo;
    QRMemo2: TQRMemo;
    QRLabel26: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel19: TQRLabel;
    QRDBText24: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel24: TQRLabel;
    QRDBText18: TQRDBText;
    Label2: TLabel;
    VR_DESCONTO: TRxCalcEdit;
    RDprint1: TRDprint;
    QRel: TFDQuery;
    QInsert: TFDQuery;
    QVendedor: TFDQuery;
    QCliente: TFDQuery;
    QSelect: TFDQuery;
    QDelete: TFDQuery;
    Label6: TLabel;
    vr_desc_itens: TRxCalcEdit;
    IQuery: TFDQuery;
    Finalizadora_id: TCurrencyEdit;
    RDprint2: TRDprint;
    ACBrPosPrinter1: TACBrPosPrinter;
    Chk_visualizar: TCheckBox;
    QRLabel72: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    Impressora_Matricial: TCheckBox;
    procedure btnVendedorClick(Sender: TObject);
    procedure btnClienteClick(Sender: TObject);
    procedure VENDEDOR_IDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure NOMEKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure CLIENTE_IDExit(Sender: TObject);
    procedure VENDEDOR_IDExit(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure RDprint1BeforeNewPage(Sender: TObject; Pagina: Integer);
    procedure RDprint1NewPage(Sender: TObject; Pagina: Integer);
    procedure RDprint1AfterPrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Validacao: Boolean;
    procedure DetailSearch(Tabela: String);
  end;

var
  FrmFecha_Orcamento: TFrmFecha_Orcamento;
  Num_Terminal: String;
  Linha,Linha_e: Integer;

  procedure Fecha_Orcamento(Pagto, Autoriz_Por, Cod_Cupom: String; Cliente,Finalizadora: Integer;desc_orcamento:Real);

implementation

uses
  UData, UPrincipal, UConsulta, UParcelas, UGerente;

{$R *.dfm}

procedure Fecha_Orcamento(Pagto, Autoriz_Por, Cod_Cupom: String; Cliente,Finalizadora: Integer;desc_orcamento:Real);
begin
  Num_Terminal := Cod_Cupom;

  Application.CreateForm(TFrmFecha_Orcamento, FrmFecha_Orcamento);
  try
    FrmFecha_Orcamento.COND_PAGTO.Text      := Pagto;
    FrmFecha_Orcamento.CLIENTE_ID.Text      := IntToStr(Cliente);
    FrmFecha_Orcamento.OBSERVACAO.Text      := Autoriz_Por;
    FrmFecha_Orcamento.Finalizadora_id.Text := IntToStr(Finalizadora);

    if (desc_orcamento > 0) then
    begin
     FrmFecha_Orcamento.vr_desc_itens.Value    := desc_orcamento ;
     FrmFecha_Orcamento.Vr_Desconto.ReadOnly   := True;
    end
    else
    Begin
    FrmFecha_Orcamento.vr_desc_itens.Value    := 0;
    FrmFecha_Orcamento.Vr_Desconto.ReadOnly   := False;
    End;

    if  (FrmPrincipal.Config.FieldByName('DESC_ORC_USU').AsString <> 'True')   then
    FrmFecha_Orcamento.Vr_Desconto.ReadOnly   := False;

    FrmFecha_Orcamento.DetailSearch('Cliente');

    FrmFecha_Orcamento.ShowModal;
  finally
    FrmFecha_Orcamento.Release;
  end;
end;

function TFrmFecha_Orcamento.Validacao: Boolean;
var
Desc_por ,Vr_total:Real;
begin
  Result := False;

  CLIENTE_ID.Color  := clWindow;
  COND_PAGTO.Color  := clWindow;
  VENDEDOR_ID.Color := clWindow;
  ESTADO.Color      := clWindow;

  if COND_PAGTO.Text = 'A PRAZO' then
  begin
    if QCliente.IsEmpty then
    begin
      Application.MessageBox('Cliente inexistente', PChar(Msg_Title), mb_IconSTop);
      CLIENTE_ID.Color := clYellow;
      CLIENTE_ID.SetFocus;
      exit;
    end;
  end;

  if CLIENTE_ID.Value > 0 then
  begin
    if QCliente.IsEmpty then
    begin
      Application.MessageBox('Cliente inexistente', PChar(Msg_Title), mb_IconStop);
      CLIENTE_ID.Color := clYellow;
      CLIENTE_ID.SetFocus;
      exit;
    end;
  end;

  if VENDEDOR_ID.Value > 0 then
  begin
    if QVendedor.IsEmpty then
    begin
      Application.MessageBox('Vendedor inexistente', PChar(Msg_Title), mb_IconStop);
      VENDEDOR_ID.Color := clYellow;
      VENDEDOR_ID.SetFocus;
      exit;
    end;
  end;

  if (COND_PAGTO.Text <> 'A VISTA') and (COND_PAGTO.Text <> 'A PRAZO') and (COND_PAGTO.Text <> 'CARTAO') and (COND_PAGTO.Text <> 'CHEQUE') then
  begin
    Application.MessageBox('Cond. de Pagto. inválida', PChar(Msg_Title), mb_IconStop);
    COND_PAGTO.Color := clYellow;
    COND_PAGTO.SetFocus;
    exit;
  end;

  if not ChecaEstado(ESTADO.Text) then
  begin
    Application.MessageBox('Estado inválido', PChar(Msg_Title), mb_IconStop);
    ESTADO.Color := clYellow;
    ESTADO.SetFocus;
    exit;
  end;

  if FrmPrincipal.Config.FieldByName('DESC_ORC_USU').AsString = 'True' then
    Begin
    Result := False;
    Desc_por := 0;

      QRel.Sql.Clear;
      QRel.Sql.Add('SELECT SUM(VR_TOTAL) VR_TOTAL');
      QRel.Sql.Add('FROM LOG_ORCAMENTO');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(CUPOM = :CUPOM)');

      QRel.ParamByName('CUPOM').AsString := Num_Terminal; // SerialNum('C');

      QRel.Prepare;
      QRel.Open;

      Vr_total := QRel.FieldByName('VR_TOTAL').AsFloat ;

      if Vr_Desconto.Value > 0 then
         Desc_Por := RoundTo(((Vr_Desconto.Value * 100) / (Vr_total)), -2)
      else
          Desc_Por  := 0;

       if VR_Desconto.Value > Vr_total then
        begin
        Application.MessageBox('Desconto acima do valor total do orçamento', 'Orçamento', MB_IconStop + MB_OK);
        VR_Desconto.Color := clYellow;
        VR_Desconto.SetFocus;
        Exit;
        end;

          IQuery.SQL.Clear;
          IQuery.SQL.Add('SELECT * FROM OPERADORES WHERE FUNCIONARIO_ID = :FUNCIONARIO_ID');
          IQuery.ParamByName('FUNCIONARIO_ID').AsInteger := StrToInt(VENDEDOR_ID.Text);
          IQuery.Prepare;
          IQuery.Open;

     { if (IQuery.FieldByName('DESCONTO_MAX_SUBTOTAL').AsFloat = 0) and (Vr_Desconto.Value > 0) then
      begin
          Application.MessageBox(Pchar('Vr. Desconto máximo permitido para ' +  IQuery.FieldByName('NOME').AsString + ' ' + ': '+ IQuery.FieldByName('DESCONTO_MAX_SUBTOTAL').AsString +'%') , PChar(Msg_Title), mb_IconStop);
          VR_DESCONTO.Color := clYellow;
          VR_DESCONTO.SetFocus;
          abort;
      end; }

        if IQuery.FieldByName('DESCONTO_MAX_SUBTOTAL').AsFloat >= 0 then
        begin
          if  VR_Desconto.Value > (((Vr_total) * IQuery.FieldByName('DESCONTO_MAX_SUBTOTAL').AsFloat) / 100) then
         // Vr_Desconto.Value > IQuery.FieldByName('DESCONTO_MAX_SUBTOTAL').AsFloat then
          begin
            Application.MessageBox(Pchar('Vr. Desconto máximo permitido para ' +  IQuery.FieldByName('NOME').AsString + ' ' + ': '+ IQuery.FieldByName('DESCONTO_MAX_SUBTOTAL').AsString +'%') , PChar(Msg_Title), mb_IconStop);

            if FrmGerente = Nil then
            begin
              Application.CreateForm(TFrmGerente, FrmGerente);
              try
                if FrmGerente.ShowModal = mrOK then
                 begin
                  if Desc_Por > FrmGerente.QOperador.FieldByName('DESCONTO_MAX_SUBTOTAL').AsFloat then
                  begin
                   Application.MessageBox('Desconto acima do máximo permitido', 'Orçamento', MB_IconStop + MB_OK);
                   VR_Desconto.Color := clYellow;
                   VR_Desconto.SetFocus;
                   Exit;
                  end;
                 Result := True;
                end
                else
                  VR_Desconto.Color := clYellow;
                  VR_Desconto.SetFocus;
                  Exit;
              finally

              end;
            end
            else
            begin
              if FrmGerente.ShowModal = mrOK then
              begin
                if Desc_Por > FrmGerente.QOperador.FieldByName('DESCONTO_MAX_SUBTOTAL').AsFloat then
                begin
                  Application.MessageBox('Desconto acima do máximo permitido', 'Orçamento', MB_IconStop + MB_OK);
                  VR_Desconto.Color := clYellow;
                  VR_Desconto.SetFocus;
                  Exit;
                end;
                Result := True;
              end
              else
                VR_Desconto.Color := clYellow;
                VR_Desconto.SetFocus;
                Exit;
            end;
          end;
        end;

        Result := True;
    End;

  Result := True;
end;

procedure TFrmFecha_Orcamento.DetailSearch(Tabela: String);
begin
  if ((Tabela = '') or (Tabela = 'Cliente')) and (CLIENTE_ID.Text <> '') then
  begin
    QCliente.Close;
    QCliente.ParamByName('CLIENTE_ID').AsInteger := StrToInt(CLIENTE_ID.Text);
    QCliente.Prepare;
    QCliente.Open;

    if not QCliente.IsEmpty then
    begin
      NOME.Text      := Copy(QCliente.FieldByName('NOME').AsString, 1, 40);
      ENDERECO.Text  := Copy(QCliente.FieldByName('ENDERECO').AsString + ', ' + QCliente.FieldByName('NUMERO').AsString, 1, 40);
      BAIRRO.Text    := Copy(QCliente.FieldByName('BAIRRO').AsString, 1, 20);
      MUNICIPIO.Text := Copy(QCliente.FieldByName('MUNICIPIO').AsString, 1, 30);
      ESTADO.Text    := QCliente.FieldByName('ESTADO').AsString;
      CEP.Text       := QCliente.FieldByName('CEP').AsString;
    end
    Else
    begin
    MUNICIPIO.Text := FrmPrincipal.QEmpresa.FieldByName('MUNICIPIO').AsString;
    Estado.Text    := FrmPrincipal.QEmpresa.FieldByName('ESTADO').AsString;
    CEP.Text       := FrmPrincipal.QEmpresa.FieldByName('CEP').AsString;
    end;
  end;

  if ((Tabela = '') or (Tabela = 'Vendedor')) and (VENDEDOR_ID.Text <> '') then
  begin
    QVendedor.Close;
    QVendedor.ParamByName('FUNCIONARIO_ID').AsInteger := StrToInt(VENDEDOR_ID.Text);
    QVendedor.Prepare;
    QVendedor.Open;
  end;
end;

procedure TFrmFecha_Orcamento.VENDEDOR_IDExit(Sender: TObject);
begin
  DetailSearch('Vendedor');
end;

procedure TFrmFecha_Orcamento.VENDEDOR_IDKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = CLIENTE_ID) then
    btnClienteClick(Self);

  if (Key = Vk_F7) and (Sender = VENDEDOR_ID) then
    btnVendedorClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmFecha_Orcamento.btnClienteClick(Sender: TObject);
begin
  try
    CLIENTE_ID.Value := GetConsulta('CLIENTES', 0, 0, StrToInt(CLIENTE_ID.Text));
  except
    CLIENTE_ID.Value := GetConsulta('CLIENTES', 0, 0, 0);
  end;
end;

procedure TFrmFecha_Orcamento.btnExecutaClick(Sender: TObject);
var
Copias,Linhas,Dividir:Integer;
ID,Coluna_e,Coluna_e2,Linha_P,i,Vias: Integer;
Vr_Orcamento, Vr_Produtos,meio: Real;
F1: TextFile;
InputString,Buffer,S: String;
MyFile: TextFile;
begin
// 235, 725
  DetailSearch('');

  if Validacao then
  begin
    QRel.SQL.Clear;
    QRel.SQL.Add('SELECT NEXTVAL(:GEN_TRANSACOES) ID');
    QRel.ParamByName('GEN_TRANSACOES').AsString :=  'GEN_ORCAMENTOS';

    QRel.Prepare;
    QRel.Open;

    ID := QRel.Fields[0].AsInteger;



    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT SUM(VR_TOTAL) VR_TOTAL');
    QRel.Sql.Add('FROM LOG_ORCAMENTO');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(CUPOM = :CUPOM)');

    QRel.ParamByName('CUPOM').AsString := Num_Terminal; // SerialNum('C');

    QRel.Prepare;
    QRel.Open;

    Vr_Orcamento := (QRel.FieldByName('VR_TOTAL').AsFloat - VR_DESCONTO.Value);

    QInsert.Sql.Clear;
    QInsert.Sql.Add('INSERT INTO ORCAMENTOS(ORCAMENTO_ID,      DT_ORCAMENTO,   DT_MOVIMENTO,    EMPRESA_ID, ' +
                                            'CLIENTE_ID,       VENDEDOR_ID,    COMISSAO,        NOME, ' +
                                            'ENDERECO,         BAIRRO,         MUNICIPIO,       ESTADO, ' +
                                            'CEP,              COND_PAGTO,     VALOR_PRODUTOS,  BASE_ICMS_NORMAL, ' +
                                            'VR_ICMS_NORMAL,   BASE_ICMS_ST,   VR_ICMS_ST,      VR_IPI, ' +
                                            'VR_FRETE,         VR_DESCONTO,    VR_ACRESCIMO,    VALOR, ' +
                                            'AUTORIZ_ID,       OBSERVACAO,     FINALIZADORA_ID) VALUES( ' +
                                            ':ORCAMENTO_ID,    :DT_ORCAMENTO,  :DT_MOVIMENTO,   :EMPRESA_ID, ' +
                                            ':CLIENTE_ID,      :VENDEDOR_ID,   :COMISSAO,       :NOME, ' +
                                            ':ENDERECO,        :BAIRRO,        :MUNICIPIO,      :ESTADO, ' +
                                            ':CEP,             :COND_PAGTO,    :VALOR_PRODUTOS, :BASE_ICMS_NORMAL, ' +
                                            ':VR_ICMS_NORMAL,  :BASE_ICMS_ST,  :VR_ICMS_ST,     :VR_IPI, ' +
                                            ':VR_FRETE,        :VR_DESCONTO,   :VR_ACRESCIMO,   :VALOR, ' +
                                            ':AUTORIZ_ID,      :OBSERVACAO,    :FINALIZADORA_ID)');

    QInsert.ParamByName('ORCAMENTO_ID').AsInteger   := ID;
    QInsert.ParamByName('DT_ORCAMENTO').AsDateTime  := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
    QInsert.ParamByName('DT_MOVIMENTO').AsDateTime  := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
    QInsert.ParamByName('EMPRESA_ID').AsInteger     := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    QInsert.ParamByName('CLIENTE_ID').AsInteger     := StrToInt(CLIENTE_ID.Text);
    QInsert.ParamByName('VENDEDOR_ID').AsInteger    := StrToInt(VENDEDOR_ID.Text);
    QInsert.ParamByName('COMISSAO').AsFloat         := COMISSAO.Value;
    QInsert.ParamByName('NOME').AsString            := NOME.Text;
    QInsert.ParamByName('ENDERECO').AsString        := ENDERECO.Text;
    QInsert.ParamByName('BAIRRO').AsString          := BAIRRO.Text;
    QInsert.ParamByName('MUNICIPIO').AsString       := MUNICIPIO.Text;
    QInsert.ParamByName('ESTADO').AsString          := ESTADO.Text;
    QInsert.ParamByName('CEP').AsString             := CEP.Text;
    QInsert.ParamByName('COND_PAGTO').AsString      := COND_PAGTO.Text;
    QInsert.ParamByName('VALOR_PRODUTOS').AsFloat   := QRel.FieldByName('VR_TOTAL').AsFloat;
    QInsert.ParamByName('BASE_ICMS_NORMAL').AsFloat := 0;
    QInsert.ParamByName('VR_ICMS_NORMAL').AsFloat   := 0;
    QInsert.ParamByName('BASE_ICMS_ST').AsFloat     := 0;
    QInsert.ParamByName('VR_ICMS_ST').AsFloat       := 0;
    QInsert.ParamByName('VR_IPI').AsFloat           := 0;
    QInsert.ParamByName('VR_FRETE').AsFloat         := 0;
    QInsert.ParamByName('VR_DESCONTO').AsFloat      := VR_DESCONTO.Value;
    QInsert.ParamByName('VR_ACRESCIMO').AsFloat     := 0;
    QInsert.ParamByName('VALOR').AsFloat            := (QRel.FieldByName('VR_TOTAL').AsFloat - VR_DESCONTO.Value);
    QInsert.ParamByName('AUTORIZ_ID').AsInteger     := FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger;
    QInsert.ParamByName('OBSERVACAO').AsByteStr     := OBSERVACAO.Text;
    QInsert.ParamByName('FINALIZADORA_ID').AsInteger     := StrToInt(FINALIZADORA_ID.Text);

    QInsert.Prepare;
    QInsert.ExecSql;



    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT * FROM LOG_ORCAMENTO');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(CUPOM = :CUPOM)');

    QRel.ParamByName('CUPOM').AsString := Num_Terminal; // SerialNum('C');

    QRel.Prepare;
    QRel.Open;

    QRel.First;
    while not QRel.Eof do
    begin
      QInsert.Sql.Clear;
      QInsert.Sql.Add('INSERT INTO ORCITENS(ORCAMENTO_ID,      PRODUTO_ID,     TP_PROD_SERV,    DESCRICAO, ' +
                                            'QUANTIDADE,       VR_UNITARIO,    VR_TOTAL,        TRIBUTO_ID, ' +
                                            'CST,              MVA,            BASE_CALC_ICMS,  ALIQUOTA_ICMS, '+
                                            'VR_IPI,           VR_DESCONTO, SEQUENCIA) VALUES( ' +
                                            ':ORCAMENTO_ID,    :PRODUTO_ID,    :TP_PROD_SERV,   :DESCRICAO, ' +
                                            ':QUANTIDADE,      :VR_UNITARIO,   :VR_TOTAL,       :TRIBUTO_ID, ' +
                                            ':CST,             :MVA,           :BASE_CALC_ICMS, :ALIQUOTA_ICMS, '+
                                            ':VR_IPI,          :VR_DESCONTO, :SEQUENCIA)');

      QInsert.ParamByName('ORCAMENTO_ID').AsInteger := ID;
      QInsert.ParamByName('PRODUTO_ID').AsInteger   := QRel.FieldByName('PRODUTO_ID').AsInteger;
      QInsert.ParamByName('TP_PROD_SERV').AsString  := 'P';
      QInsert.ParamByName('DESCRICAO').AsString     := QRel.FieldByName('DESCRICAO').AsString;
      QInsert.ParamByName('QUANTIDADE').AsFloat     := QRel.FieldByName('QUANTIDADE').AsFloat;
      QInsert.ParamByName('VR_UNITARIO').AsFloat    := QRel.FieldByName('VR_UNITARIO').AsFloat;
      QInsert.ParamByName('VR_TOTAL').AsFloat       := QRel.FieldByName('VR_TOTAL').AsFloat;
      QInsert.ParamByName('TRIBUTO_ID').AsInteger   := QRel.FieldByName('TRIBUTO_ID').AsInteger;
      QInsert.ParamByName('CST').AsString           := QRel.FieldByName('CST').AsString;
      QInsert.ParamByName('MVA').AsFloat            := QRel.FieldByName('MVA').AsFloat;
      QInsert.ParamByName('BASE_CALC_ICMS').AsFloat := QRel.FieldByName('VR_TOTAL').AsFloat;
      QInsert.ParamByName('ALIQUOTA_ICMS').AsFloat  := QRel.FieldByName('ALIQUOTA_ICMS').AsFloat;
      QInsert.ParamByName('VR_IPI').AsFloat         := QRel.FieldByName('IPI').AsFloat;
      QInsert.ParamByName('VR_DESCONTO').AsFloat    := QRel.FieldByName('VR_DESCONTO').AsFloat;
      QInsert.ParamByName('SEQUENCIA').AsInteger    := QRel.FieldByName('SEQUENCIA').AsInteger;

      QInsert.Prepare;
      QInsert.ExecSql;



      Application.ProcessMessages;
      QRel.Next;
    end;

    if COND_PAGTO.Text = 'A PRAZO' then
      Divisao_Parcelas(ID, 'O','', True, FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime, Vr_Orcamento);

    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT ORCAMENTOS.*, FINALIZADORAS.LEGENDA NOME_FINALIZADORA FROM ORCAMENTOS');
    QRel.Sql.Add('LEFT JOIN FINALIZADORAS ON FINALIZADORAS.FINALIZADORA_ID = ORCAMENTOS.FINALIZADORA_ID');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(ORCAMENTO_ID = :ORCAMENTO_ID)');

    QRel.ParamByName('ORCAMENTO_ID').AsInteger := ID;

    QRel.Prepare;
    QRel.Open;

    QInsert.Sql.Clear;
    QInsert.Sql.Add('SELECT * FROM ORCITENS');
    QInsert.Sql.Add('WHERE');
    QInsert.Sql.Add('(ORCAMENTO_ID = :ORCAMENTO_ID) ORDER BY SEQUENCIA');

    QInsert.ParamByName('ORCAMENTO_ID').AsInteger := ID;

    QInsert.Prepare;
    QInsert.Open;

    if LeIni(Arq_Ini, 'Sistema', 'Imp. Orçamento') = 'RDPrint MP-4200' then
    begin
     { if Application.MessageBox('Deseja imprimir o comprovante?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = idYes then
      begin
        InputString := InputBox(PChar(Msg_Title), 'Cópias', '1');}

        AssignFile(MyFile, ExtractFilePath(ParamStr(0)) + 'Orcamento.Txt');
        Rewrite(MyFile);

       { for Copias := 1 to StrToInt(InputString) do
        begin}
        if LeIni(Arq_Ini, 'Sistema', 'Linha Cabeçalho') <> '' then
          WriteLn(MyFile, LeIni(Arq_Ini, 'Sistema', 'Linha Cabeçalho'))
        else
        begin
          Meio    := ((48 - Length(FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString)) / 2);
          Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));

          Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ') + FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString);

          Meio    := ((48 - Length(FrmPrincipal.QEmpresa.FieldByName('TELEFONE').AsString)) / 2);
          Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));

          Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ') + FrmPrincipal.QEmpresa.FieldByName('TELEFONE').AsString);

          Meio    := ((48 - Length(FrmPrincipal.QEmpresa.FieldByName('ENDERECO').AsString)) / 2);
          Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));

          Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ') + FrmPrincipal.QEmpresa.FieldByName('ENDERECO').AsString);

          Meio    := ((48 - Length(FrmPrincipal.QEmpresa.FieldByName('BAIRRO').AsString + ' - ' + FrmPrincipal.QEmpresa.FieldByName('MUNICIPIO').AsString)) / 2);
          Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));

          Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ') + FrmPrincipal.QEmpresa.FieldByName('BAIRRO').AsString + ' - ' + FrmPrincipal.QEmpresa.FieldByName('MUNICIPIO').AsString);

          Meio    := ((48 - Length('CEP: ' + FrmPrincipal.QEmpresa.FieldByName('CEP').AsString + ' - ' + 'CNPJ: ' + FrmPrincipal.QEmpresa.FieldByName('CNPJ').AsString)) / 2);
          Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));

          Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ') + 'CEP: ' + FrmPrincipal.QEmpresa.FieldByName('CEP').AsString + ' - ' + 'CNPJ: ' + FrmPrincipal.QEmpresa.FieldByName('CNPJ').AsString);

          Meio    := ((48 - Length('Hora: ' + TimeToStr(now) + '  Data: ' + DateToStr(date))) / 2);
          Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));

          Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ') + 'Hora: ' + TimeToStr(now) + '  Data: ' + DateToStr(date));
          Writeln(MyFile, '------------------------------------------------');

          Meio    := ((48 - Length('Orçamento: ' + IntToStr(ID))) / 2);
          Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));

          Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ') + 'Orçamento: ' + IntToStr(QRel.FieldByName('ORCAMENTO_ID').AsInteger));

          Meio    := ((48 - Length('At.: ' + Copy(QVendedor.FieldByName('NOME').AsString, 1, 20))) / 2);
          Dividir := StrToInt(StrZero(FloatToStr(Meio), 12, 0));

          Writeln(MyFile, ForcaComprimento(' ', Dividir, ' ') + 'At.: ' + Copy(QVendedor.FieldByName('NOME').AsString, 1, 20));
        end;
        Writeln(MyFile, '------------------------------------------------');
        Writeln(MyFile, 'Código / Produto             Valor  Qtde   Total');
        Writeln(MyFile, '------------------------------------------------');



        while not QInsert.Eof do
        begin

          Writeln(MyFile, StrZero(QInsert.FieldByName('PRODUTO_ID').AsString, 6, 0) + ' / ' +
                          ForcaComprimento(QInsert.FieldByName('DESCRICAO').AsString, 19, ' ') +
                          ForcaComprimento(' ', 7 - Length(FormatFloat('#,##0.00', QInsert.FieldByName('VR_UNITARIO').AsFloat)), ' ') +
                          FormatFloat('#,##0.00', QInsert.FieldByName('VR_UNITARIO').AsFloat) + ' ' +
                          ForcaComprimento(' ', 5 - Length(FormatFloat('#,##0.000', QInsert.FieldByName('QUANTIDADE').AsFloat)), ' ') +
                          FormatFloat('#,##0.00', QInsert.FieldByName('QUANTIDADE').AsFloat) + ' ' +
                          ForcaComprimento(' ', 7 - Length(FormatFloat('#,##0.00', QInsert.FieldByName('VR_TOTAL').AsFloat)), ' ') +
                          FormatFloat('#,##0.00', QInsert.FieldByName('VR_TOTAL').AsFloat));

          Application.ProcessMessages;

          QInsert.Next;
        end;

        Writeln(MyFile, '                                       ---------');

        if (QRel.FieldByName('VR_DESCONTO').AsFloat  > 0) or (QRel.FieldByName('VR_ACRESCIMO').AsFloat > 0) then
        begin
          Writeln(MyFile, ForcaComprimento('Sub-Total', 48 - Length(FormatFloat('#,##0.00', QRel.FieldByName('VALOR').AsFloat )), ' ') + FormatFloat('#,##0.00', QRel.FieldByName('VALOR').AsFloat));

          if QRel.FieldByName('VR_ACRESCIMO').AsFloat > 0 then
            Writeln(MyFile, ForcaComprimento('Acrescimo', 48 - Length(FormatFloat('#,##0.00', QRel.FieldByName('VR_ACRESCIMO').AsFloat)), ' ') + FormatFloat('#,##0.00', QRel.FieldByName('VR_ACRESCIMO').AsFloat));

          if QRel.FieldByName('VR_DESCONTO').AsFloat > 0 then
            Writeln(MyFile, ForcaComprimento('Desconto', 48 - Length(FormatFloat('#,##0.00', Vr_Desconto.value)), ' ') + FormatFloat('#,##0.00', Vr_Desconto.value));

          if (QRel.FieldByName('VR_DESCONTO').AsFloat > 0) or (QRel.FieldByName('VR_ACRESCIMO').AsFloat > 0) then
            Writeln(MyFile, '                                       =========');

          Writeln(MyFile, ForcaComprimento('Total', 48 - Length(FormatFloat('#,##0.00', QRel.FieldByName('VALOR').AsFloat)), ' ') + FormatFloat('#,##0.00', QRel.FieldByName('VALOR').AsFloat ));
        end
        else
          Writeln(MyFile, ForcaComprimento('Total', 48 - Length(FormatFloat('#,##0.00', QRel.FieldByName('VALOR').AsFloat )), ' ') + FormatFloat('#,##0.00', QRel.FieldByName('VALOR').AsFloat ));



        Writeln(MyFile, '');
        Writeln(MyFile, 'Forma Pagamento: ' + QRel.FieldByName('COND_PAGTO').AsString);
        Writeln(MyFile, '');
        Writeln(MyFile, '');

        if QRel.FieldByName('OBSERVACAO').AsString <> '' then
        Begin
        Writeln(MyFile, 'Obs.:');
        Writeln(MyFile,COPY(QRel.FieldByName('OBSERVACAO').AsString,1,48));
        if COPY(QRel.FieldByName('OBSERVACAO').AsString,49,48) <> '' then
        Writeln(MyFile,COPY(QRel.FieldByName('OBSERVACAO').AsString,49,48));
        if COPY(QRel.FieldByName('OBSERVACAO').AsString,97,48) <> '' then
        Writeln(MyFile,COPY(QRel.FieldByName('OBSERVACAO').AsString,97,48));
        if COPY(QRel.FieldByName('OBSERVACAO').AsString,145,48) <> '' then
        Writeln(MyFile,COPY(QRel.FieldByName('OBSERVACAO').AsString,145,48));
        if COPY(QRel.FieldByName('OBSERVACAO').AsString,169,48) <> '' then
        Writeln(MyFile,COPY(QRel.FieldByName('OBSERVACAO').AsString,169,48));
        if COPY(QRel.FieldByName('OBSERVACAO').AsString,289,48) <> '' then
        Writeln(MyFile,COPY(QRel.FieldByName('OBSERVACAO').AsString,289,48));
        End;

        if QRel.FieldByName('CLIENTE_ID').AsInteger > 0 then
        begin

         IQuery.Sql.Clear;
         IQuery.Sql.Add('SELECT ORCAMENTOS.* , CLIENTES.*');
         IQuery.Sql.Add('FROM ORCAMENTOS');
         IQuery.Sql.Add('INNER JOIN CLIENTES ON (ORCAMENTOS.CLIENTE_ID = CLIENTES.CLIENTE_ID)');
         IQuery.Sql.Add('WHERE  ORCAMENTOS.ORCAMENTO_ID = :ORCAMENTO_ID');
         IQuery.ParamByName('ORCAMENTO_ID').AsInteger := QRel.FieldByName('ORCAMENTO_ID').AsInteger;
         IQuery.Prepare;
         IQuery.Open;

          Writeln(MyFile, '');
          Writeln(MyFile,'Dados do Cliente:');
          Writeln(MyFile, Copy(IQuery.FieldByName('NOME').AsString,1,30));
          Writeln(MyFile, IQuery.FieldByName('CNPJ').AsString);
          Writeln(MyFile, IQuery.FieldByName('ENDERECO').AsString + ', ' + IQuery.FieldByName('NUMERO').AsString);
          Writeln(MyFile, IQuery.FieldByName('BAIRRO').AsString);
          Writeln(MyFile, IQuery.FieldByName('MUNICIPIO').AsString);
          Writeln(MyFile, IQuery.FieldByName('CEP').AsString);
          Writeln(MyFile, '');

          IQuery.Sql.Clear;
          IQuery.Sql.Add('SELECT * FROM TRANSPARCELAS');
          IQuery.Sql.Add('WHERE');
          IQuery.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
          IQuery.Sql.Add('AND (TIPO_TRANSACAO = :TIPO_TRANSACAO)');

          IQuery.ParamByName('TRANSACAO_ID').AsInteger  := QRel.FieldByName('ORCAMENTO_ID').AsInteger;
          IQuery.ParamByName('TIPO_TRANSACAO').AsString := 'O';

          IQuery.Prepare;
          IQuery.Open;

          IQuery.First;

          while not IQuery.Eof do
          begin
            Writeln(MyFile, 'Vencimento: ' + IQuery.FieldByName('DT_VENCIMENTO').AsString +
                                             '     Valor : ' + FormatFloat('#,##0.00', IQuery.FieldByName('VALOR').AsFloat));
            Application.ProcessMessages;
            IQuery.Next;
          end;

          Writeln(MyFile, '');
          Writeln(MyFile, '');
          Writeln(MyFile, '');
          Writeln(MyFile, '');
          Writeln(MyFile, '');
          Writeln(MyFile, '          ___________________________           ');
          Writeln(MyFile, '            Assinatura do Cliente               ');

        end
        Else
          if Nome.Text <> '' then
          Begin
          Writeln(MyFile, '');
          Writeln(MyFile,'Dados do Cliente:');
          Writeln(MyFile, Copy(NOME.Text,1,30));
          Writeln(MyFile, Endereco.Text + ', ' + QRel.FieldByName('NUMERO').AsString);
          Writeln(MyFile, Bairro.Text);
          Writeln(MyFile, Municipio.Text);
          Writeln(MyFile, Cep.Text);
          Writeln(MyFile, '');
          End;


        for Linhas := 1 to StrToInt(LeIni(Arq_Ini, 'Sistema', 'Linhas')) do
          Writeln(MyFile, ' ');


      CloseFile(MyFile);

      AssignFile(MyFile, ExtractFilePath(ParamStr(0)) + 'Orcamento.Txt');
      Reset(MyFile);



      Buffer := '';

      Linha := 1;

     // ACBrPosPrinter1.Porta := 'RAW:' + LeIni(Arq_Ini, 'Sistema', 'Porta Impressora');
     // ACBrPosPrinter1.CortarPapel(True);
     // ACBrPosPrinter1.Ativar;

      RDprint2.Abrir;

      RDprint2.Impressora        := EPSON;

      if Chk_visualizar.Checked then
      RDprint2.OpcoesPreview.Preview := True;

      RDprint2.TamanhoQteLinhas  := 1;
      RDprint2.TamanhoQteColunas := 48;
      RDprint2.Acentuacao        := SemAcento;
      RDprint2.MostrarProgresso  := True;
      RDprint2.ImpASCII(01, 01, '27 64');

    //if ACBrPosPrinter1.ativo  Then
    //Begin
      while not Eof(MyFile) do
      begin
        ReadLn(MyFile, S);

        Buffer := S;

        RDprint2.Imp(Linha, 01, Buffer);

        //ACBrPosPrinter1.ImprimirLinha(S);

        Inc(Linha);

        Application.ProcessMessages;
      end;
   // End;

      CloseFile(MyFile);

      RDprint2.TamanhoQteLinhas      := Linha;
      RDprint2.Fechar;

      if RDprint2.OpcoesPreview.Preview = False then
         Application.MessageBox(Pchar('Orçamento: ' + IntToStr(QRel.FieldByName('ORCAMENTO_ID').AsInteger) + ' impresso com sucesso.'), PChar(Msg_Title), mb_IconInformation);

      RDprint2.OpcoesPreview.Preview := False;

     // ACBrPosPrinter1.CortarPapel(False);
     // ACBrPosPrinter1.Desativar;

    end
    else if (Impressora_Matricial.Checked)  then
    begin
      RDprint1.OpcoesPreview.Preview     := True;
     // RDprint1.OpcoesPreview.PreviewZoom := -1;
      RDprint1.MostrarProgresso          := True;
      RDprint1.Abrir;
     {
      if RDprint1.Setup = False then
      begin
        QDelete.Sql.Clear;
        QDelete.Sql.Add('DELETE FROM ORCAMENTOS');
        QDelete.Sql.Add('WHERE');
        QDelete.Sql.Add('(ORCAMENTO_ID = :ORCAMENTO_ID)');

        QDelete.ParamByName('ORCAMENTO_ID').AsInteger := ID;

        QDelete.Prepare;
        QDelete.ExecSql;

        Application.MessageBox('Cancelado pelo usuário...', PChar(Msg_Title), mb_IconInformation);
        exit;
      end;
      }

      try
       Vias :=  StrToInt(LeIni(Arq_Ini, 'Sistema', 'Vias'));
      except
       Vias := 1;
      end;

      for i := 1 to Vias do
      Begin
        if i > 1 then
        begin
          RDprint1.Imp(Linha, 01, '================================================================================');
          Inc(Linha);
          RDprint1.Imp(Linha, 31, '*** ORÇAMENTO ***');
          Inc(Linha);
          RDprint1.Imp(Linha, 01, '================================================================================');
          Inc(Linha);
          RDprint1.Imp(Linha, 01, 'Num. Orc.:');
          RDprint1.Imp(Linha, 12, StrZero(QRel.FieldByName('ORCAMENTO_ID').AsString, 6, 0));
          RDprint1.Imp(Linha, 27, 'Cond. Pagto/Fin.:');
          RDprint1.Imp(Linha, 44, QRel.FieldByName('COND_PAGTO').AsString);
          RDprint1.Imp(Linha, 44 + Length(QRel.FieldByName('COND_PAGTO').AsString), '/'+ Copy(QRel.FieldByName('NOME_FINALIZADORA').AsString,1,15));
          RDprint1.Imp(Linha, 65, 'Data:');
          RDprint1.Imp(Linha, 71, QRel.FieldByName('DT_ORCAMENTO').AsString);
          Inc(Linha);
          RDprint1.Imp(Linha, 01, 'Cliente/Cod.:');
          RDprint1.Imp(Linha, 16, Copy(QRel.FieldByName('NOME').AsString, 1, 40) + ' / ' + QRel.FieldByName('CLIENTE_ID').AsString);
          RDprint1.Imp(Linha, 65, 'Fone:');
          RDprint1.Imp(Linha, 71, QCliente.FieldByName('TELEFONE_1').AsString);
          Inc(Linha);
          RDprint1.Imp(Linha, 01, 'Endereço:');
          RDprint1.Imp(Linha, 10, Copy(QRel.FieldByName('ENDERECO').AsString, 1, 31));
          RDprint1.Imp(Linha, 65, 'Nº: ' + QRel.FieldByName('NUMERO').AsString);
          Inc(Linha);
          RDprint1.Imp(Linha, 01, 'Bairro:');
          RDprint1.Imp(Linha, 09, Copy(QRel.FieldByName('BAIRRO').AsString, 1, 23));
          RDprint1.Imp(Linha, 34, 'Cidade:');
          RDprint1.Imp(Linha, 42, Copy(QRel.FieldByName('MUNICIPIO').AsString, 1, 23));
          RDprint1.Imp(Linha, 65, 'CEP:');
          RDprint1.Imp(Linha, 71, QRel.FieldByName('CEP').AsString);
          Inc(Linha);
          RDprint1.Imp(Linha, 01, '================================================================================');
          Inc(Linha);
          RDprint1.Imp(Linha, 01, 'Cód.   Descrição                                    Qtd. Pr.Unit  Desc. Pr.Total');
          Inc(Linha);
          RDprint1.Imp(Linha, 01, '================================================================================');
          Inc(Linha);
        end;

        Vr_Produtos := 0;

        QInsert.First;
        while not QInsert.eof do
        begin
          if Linha >= 66 then
            RDprint1.Novapagina;

          RDprint1.Imp(Linha, 01, StrZero(QInsert.FieldByName('PRODUTO_ID').AsString, 6, 0));
          RDprint1.Imp(Linha, 08, Copy(QInsert.FieldByName('DESCRICAO').AsString, 1, 40));
          RDprint1.ImpVal(Linha, 51, '##0.00', QInsert.FieldByName('QUANTIDADE').AsFloat, []);
          RDprint1.ImpVal(Linha, 58, '##0.00', QInsert.FieldByName('VR_UNITARIO').AsFloat, []);
          RDprint1.ImpVal(linha,64,'#,##0.00',QInsert.FieldByName('VR_DESCONTO').AsFloat,[]);
          RDprint1.ImpVal(Linha, 73, '#,##0.00', QInsert.FieldByName('VR_TOTAL').AsFloat, []);

          Inc(Linha);

          Vr_Produtos := Vr_Produtos + QInsert.FieldByName('VR_TOTAL').AsFloat;

          Application.ProcessMessages;
          QInsert.next;
        end;

        RDprint1.Imp(Linha, 67, '--------------');

        Inc(Linha);

        RDprint1.Imp(Linha, 01, 'Vendedor:');
        RDprint1.Imp(Linha, 11, QVendedor.FieldByName('NOME').AsString);
        RDprint1.Imp(Linha, 47, 'Total dos Produtos');
        RDprint1.ImpVal(Linha, 67, '###,###,##0.00', Vr_Produtos, []);

        Linha_E :=  Linha + 1;

        Inc(Linha);

        RDprint1.Imp(Linha, 01, Copy(QRel.FieldByName('OBSERVACAO').AsString, 1, 45));
        RDprint1.Imp(Linha, 47, 'Acréscimo');
        RDprint1.ImpVal(Linha, 67, '###,###,##0.00', QRel.FieldByName('VR_ACRESCIMO').AsFloat, []);

        Inc(Linha);

        RDprint1.Imp(Linha, 01, Copy(QRel.FieldByName('OBSERVACAO').AsString, 46, 45));
        RDprint1.Imp(Linha, 47, 'Desconto');
        RDprint1.ImpVal(Linha, 67, '###,###,##0.00', QRel.FieldByName('VR_DESCONTO').AsFloat, []);

        Inc(Linha);

        RDprint1.Imp(Linha, 01, Copy(QRel.FieldByName('OBSERVACAO').AsString, 91, 45));
        RDprint1.Imp(Linha, 47, 'Total do Orçamento');
        RDprint1.ImpVal(Linha, 67, '###,###,##0.00', QRel.FieldByName('VALOR').AsFloat, [negrito]);

        Inc(Linha);
        RDprint1.Imp(Linha, 01, Copy(QRel.FieldByName('OBSERVACAO').AsString, 136, 45));
        Inc(Linha);
        RDprint1.Imp(Linha, 01, Copy(QRel.FieldByName('OBSERVACAO').AsString, 181, 45));
        Inc(Linha);
        RDprint1.Imp(Linha, 01, Copy(QRel.FieldByName('OBSERVACAO').AsString, 226, 45));
        Inc(Linha);
        RDprint1.Imp(Linha, 01, Copy(QRel.FieldByName('OBSERVACAO').AsString, 271, 45));



        QSelect.Sql.Clear;
        QSelect.Sql.Add('SELECT * FROM TRANSPARCELAS');
        QSelect.Sql.Add('WHERE');
        QSelect.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
        QSelect.Sql.Add('AND (TIPO_TRANSACAO = :TIPO_TRANSACAO)');

        QSelect.ParamByName('TRANSACAO_ID').AsInteger  := QRel.FieldByName('ORCAMENTO_ID').AsInteger;
        QSelect.ParamByName('TIPO_TRANSACAO').AsString := 'O';

        QSelect.Prepare;
        QSelect.Open;

        if not QSelect.IsEmpty then
        begin

          Inc(Linha_E);
          RDprint1.Imp(Linha_E, 01, 'Parcelamento');
          Inc(Linha_E);
          RDprint1.Imp(Linha_E, 01, '============');
          Inc(Linha_E);

          Linha_p := Linha_e;
          Coluna_e  := 01;
          Coluna_e2 := 23;

          IF  Copy(QSelect.FieldByName('PARCELA_ID').AsString,4,2) < '05' Then
          Begin
          QSelect.First;
           while not QSelect.Eof do
            begin
             if i  = 1 then
             Begin
              if Linha_e <= 26 then
              Begin
              RDprint1.Imp(Linha_E, Coluna_e,'Venc.: ' + QSelect.FieldByName('DT_VENCIMENTO').AsString + ' - ');
              RDprint1.ImpVal(Linha_E, Coluna_e2,'#,##0.00',QSelect.FieldByName('VALOR').AsFloat,[negrito]);
              Inc(Linha_E);
              End
              else
              Begin
              RDprint1.Imp(Linha_P, Coluna_e,'Venc.: ' + QSelect.FieldByName('DT_VENCIMENTO').AsString + ' - ');
              RDprint1.ImpVal(Linha_P, Coluna_e2,'#,##0.00',QSelect.FieldByName('VALOR').AsFloat,[negrito]);
              Inc(Linha_P);
              End;

              if (Linha_e > 26)   then
              Begin
              Coluna_e  := 47;
              Coluna_e2 := 70;
              End;
             End
             Else
             begin

              if Linha_e <= 49 then
              Begin
              RDprint1.Imp(Linha_E, Coluna_e,'Venc.: ' + QSelect.FieldByName('DT_VENCIMENTO').AsString + ' - ');
              RDprint1.ImpVal(Linha_E, Coluna_e2,'#,##0.00',QSelect.FieldByName('VALOR').AsFloat,[negrito]);
              Inc(Linha_E);
              End
              else
              Begin
              RDprint1.Imp(Linha_P, Coluna_e,'Venc.: ' + QSelect.FieldByName('DT_VENCIMENTO').AsString + ' - ');
              RDprint1.ImpVal(Linha_P, Coluna_e2,'#,##0.00',QSelect.FieldByName('VALOR').AsFloat,[negrito]);
              Inc(Linha_P);
              End;

              if (Linha_e > 49)   then
              Begin
              Coluna_e  := 47;
              Coluna_e2 := 70;
              End;
             end;

              Application.ProcessMessages;
              QSelect.Next;

            end;
          End
          Else
          begin
             Coluna_e2 := 50;
             Inc(Linha_E);
             if i  = 1 then
             Begin
              if Linha_e <= 26 then
              Begin
              RDprint1.Imp(Linha_E, Coluna_e,'Parcelado em: ' + Copy(QSelect.FieldByName('PARCELA_ID').AsString,4,2) + 'X 1º Vencimento - ' + QSelect.FieldByName('DT_VENCIMENTO').AsString + ' - R$');
              RDprint1.ImpVal(Linha_E, Coluna_e2,'#,##0.00',QSelect.FieldByName('VALOR').AsFloat,[negrito]);
              Inc(Linha_E);
              End;

             End
             else
             begin
              if Linha_e <= 49 then
              Begin
              RDprint1.Imp(Linha_E, Coluna_e,'Parcelado em: ' + Copy(QSelect.FieldByName('PARCELA_ID').AsString,4,2) + 'X 1º Vencimento - ' + QSelect.FieldByName('DT_VENCIMENTO').AsString  + ' - R$');
              RDprint1.ImpVal(Linha_E, Coluna_e2,'#,##0.00',QSelect.FieldByName('VALOR').AsFloat,[negrito]);
              Inc(Linha_E);
              End
             end;

          end;
        end;
      End;

      if Vias = 1 then
      RDprint1.TamanhoQteLinhas := 66
      Else
      RDprint1.TamanhoQteLinhas := Linha;

       if LeIni(Arq_Ini, 'Sistema', 'Rdprint Meia Página') = 'True' then
       RDprint1.TamanhoQteLinhas := 32;

      RDprint1.Fechar;
    end
    Else
    Begin


      QRLabel7.Caption   := FrmPrincipal.QEmpresa.FieldByName('ENDERECO').AsString + ', ' + FrmPrincipal.QEmpresa.FieldByName('NUMERO').AsString + ' - ' +
                            FrmPrincipal.QEmpresa.FieldByName('BAIRRO').AsString + ' - ' +
                            FrmPrincipal.QEmpresa.FieldByName('MUNICIPIO').AsString + ' - CEP ' +
                            FrmPrincipal.QEmpresa.FieldByName('CEP').AsString;
      QRLabel8.Caption   := 'CNPJ: ' + FrmPrincipal.QEmpresa.FieldByName('CNPJ').AsString + ' - I. E. ' +
                            FrmPrincipal.QEmpresa.FieldByName('INSCR_ESTADUAL').AsString + ' - Fone: ' +
                            FrmPrincipal.QEmpresa.FieldByName('TELEFONE').AsString;

      if (LeIni(Arq_Ini, 'Sistema', 'Largura Papel') > '0') and (LeIni(Arq_Ini, 'Sistema', 'Altura Papel') > '0') then
      begin
        Orcamento.Page.Width     := StrToFloat(LeIni(Arq_Ini, 'Sistema', 'Largura Papel'));
        Orcamento.Page.Length    := StrToFloat(LeIni(Arq_Ini, 'Sistema', 'Altura Papel'));
      end;

      if LeIni(Arq_Ini, 'Orçamento', 'Endereço Cliente') = 'False' then
      begin
        QRLabel9.Enabled   := False;
        QRDBText12.Enabled := False;
        QRLabel10.Enabled  := False;
        QRDBText13.Enabled := False;
        QRLabel11.Enabled  := False;
        QRDBText14.Enabled := False;
        QRLabel12.Enabled  := False;
        QRDBText15.Enabled := False;
      end;

      if LeIni(Arq_Ini, 'Orçamento', 'Acréscimo/Desconto') = 'False' then
      begin
        QRLabel28.Enabled := False;
        QRLabel29.Enabled := False;
        QRBand2.Height    := 22;
      end;

      QSelect.Sql.Clear;
      QSelect.Sql.Add('SELECT * FROM TRANSPARCELAS');
      QSelect.Sql.Add('WHERE');
      QSelect.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
      QSelect.Sql.Add('AND (TIPO_TRANSACAO = :TIPO_TRANSACAO)');

      QSelect.ParamByName('TRANSACAO_ID').AsInteger  := QRel.FieldByName('ORCAMENTO_ID').AsInteger;
      QSelect.ParamByName('TIPO_TRANSACAO').AsString := 'O';

      QSelect.Prepare;
      QSelect.Open;

      if not QSelect.IsEmpty then
      begin
        QRMemo2.Lines.Clear;
        QRMemo2.Lines.Add('Parcelamento');
        QRMemo2.Lines.Add('============');

        QSelect.First;
        while not QSelect.Eof do
        begin
          QRMemo2.Lines.Add('Venc.: ' + QSelect.FieldByName('DT_VENCIMENTO').AsString + ' - ' + FormatFloat('#,##0.00', QSelect.FieldByName('VALOR').AsFloat));

          Application.ProcessMessages;
          QSelect.Next;
        end;
      end;

      QRMemo1.Lines.Clear;
      QRMemo1.Lines.Text := QRel.FieldByName('OBSERVACAO').AsString;

      Orcamento.PreviewModal;
    end;

    if LeIni(Arq_Ini, 'Sistema', 'Path Orçamento') <> '' then
    begin
      QRel.Sql.Clear;
      QRel.Sql.Add('SELECT * FROM LOG_ORCAMENTO');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(CUPOM = :CUPOM)');

      QRel.ParamByName('CUPOM').AsString := Num_Terminal; // SerialNum('C');

      QRel.Prepare;
      QRel.Open;

      try
        AssignFile(F1, LeIni(Arq_Ini, 'Sistema', 'Path Orçamento') + 'OR' + StrZero(IntToStr(ID), 6, 0) + '.Txt');
        Rewrite(F1);

        QRel.First;
        while not QRel.Eof do
        begin
          WriteLn(F1, '1' + ForcaComprimento(QRel.FieldByName('COD_BARRA').AsString, 14, ' ') +
                      StrZero(QRel.FieldByName('QUANTIDADE').AsString, 12, 2) +
                      StrZero(QRel.FieldByName('VR_UNITARIO').AsString, 12, 2) +
                      StrZero(QRel.FieldByName('VR_DESCONTO').AsString, 12, 2));

          Application.ProcessMessages;
          QRel.Next;
        end;

        QRel.Sql.Clear;
        QRel.Sql.Add('SELECT * FROM TRANSPARCELAS');
        QRel.Sql.Add('WHERE');
        QRel.Sql.Add('(TRANSACAO_ID = :ORCAMENTO_ID)');
        QRel.Sql.Add('AND (TIPO_TRANSACAO = :TIPO_TRANSACAO)');
        QRel.Sql.Add('ORDER BY DT_VENCIMENTO, PARCELA_ID DESC');

        QRel.ParamByName('ORCAMENTO_ID').AsInteger  := ID;
        QRel.ParamByName('TIPO_TRANSACAO').AsString := 'O';

        QRel.Prepare;
        QRel.Open;

        QRel.First;
        while not QRel.Eof do
        begin
          WriteLn(F1, '2' + StrZero(Copy(QRel.FieldByName('PARCELA_ID').AsString, 4, 2), 2, 0) + StrZero(Copy(QRel.FieldByName('PARCELA_ID').AsString, 1, 2), 2, 0) +
                      Copy(QRel.FieldByName('DT_VENCIMENTO').AsString, 1, 2) +
                      Copy(QRel.FieldByName('DT_VENCIMENTO').AsString, 4, 2) +
                      Copy(QRel.FieldByName('DT_VENCIMENTO').AsString, 7, 4) +
                      StrZero(QRel.FieldByName('VALOR').AsString, 12, 2) +
                      StrZero(QRel.FieldByName('BANCO_ID').AsString, 2, 0));

          Application.ProcessMessages;
          QRel.Next;
        end;

        WriteLn(F1, '301' + 'D' + StrZero(VR_DESCONTO.Text, 12, 2) +
                    StrZero(VENDEDOR_ID.Text, 5, 0) +
                    StrZero(CLIENTE_ID.Text, 5, 0));

        Application.MessageBox(PChar('Log ' + StrZero(IntToStr(ID), 6, 0) + ' criado com sucesso'), PChar(Msg_Title), mb_IconInformation);
      finally
        CloseFile(F1);
      end;
    end;

    QRel.Sql.Clear;
    QRel.Sql.Add('DELETE FROM LOG_ORCAMENTO');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(CUPOM = :CUPOM)');

    QRel.ParamByName('CUPOM').AsString := Num_Terminal; // SerialNum('C');

    QRel.Prepare;
    QRel.ExecSql;

    ModalResult := mrOK;
  end;
end;

procedure TFrmFecha_Orcamento.btnVendedorClick(Sender: TObject);
begin
  try
    VENDEDOR_ID.Value := GetConsulta('PESSOAL', 0, 0, StrToInt(VENDEDOR_ID.Text));
  except
    VENDEDOR_ID.Value := GetConsulta('PESSOAL', 0, 0, 0);
  end;
end;

procedure TFrmFecha_Orcamento.CLIENTE_IDExit(Sender: TObject);
begin
  DetailSearch('Cliente');
end;

procedure TFrmFecha_Orcamento.NOMEKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmFecha_Orcamento.RDprint1AfterPrint(Sender: TObject);
begin
  Keybd_Event(VK_Escape, 0, 0, 0);
end;

procedure TFrmFecha_Orcamento.RDprint1BeforeNewPage(Sender: TObject;
  Pagina: Integer);
begin
  RDprint1.Imp(32, 01, '================================================================================');
  RDprint1.Imp(33, 01, 'Eficaz Automação e Sistemas Ltda');
  RDprint1.ImpDir(33, 01, 80, 'http://www.eficazautomacao.com.br', [italico]);
end;

procedure TFrmFecha_Orcamento.RDprint1NewPage(Sender: TObject; Pagina: Integer);
begin
  RDprint1.Imp(02, 01, FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString);
  RDprint1.ImpDir(02, (length(FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString)), 80, 'Eficaz Automação e Sistemas Ltda - ME', []);
  RDprint1.Imp(03, 01, Copy(FrmPrincipal.QEmpresa.FieldByName('ENDERECO').AsString,1,30));
  RDprint1.Imp(03, 30, 'Nº:' + FrmPrincipal.QEmpresa.FieldByName('NUMERO').AsString);
  RDprint1.Imp(03, 40, Copy (FrmPrincipal.QEmpresa.FieldByName('BAIRRO').AsString,1,15));
  RDprint1.Imp(03, 55, Copy(FrmPrincipal.QEmpresa.FieldByName('MUNICIPIO').AsString,1,20));
  RDprint1.Imp(03, 72, FrmPrincipal.QEmpresa.FieldByName('CEP').AsString);
  RDprint1.Imp(04, 01, 'Cnpj.:' + FrmPrincipal.QEmpresa.FieldByName('CNPJ').AsString);
  RDprint1.Imp(04, 30, 'I.E.: ' + FrmPrincipal.QEmpresa.FieldByName('INSCR_ESTADUAL').AsString);
  RDprint1.Imp(04, 55, 'Fone: ' + FrmPrincipal.QEmpresa.FieldByName('TELEFONE').AsString);
  RDprint1.Imp(05, 01, 'Data: ' + DateToStr(date) + ' - ' + TimeToStr(now));
  RDprint1.impDir(05, 28, 80, 'Página: ' + IntToStr(Pagina), [normal]);
  RDprint1.Imp(06, 31, '*** ORÇAMENTO ***');
  RDprint1.Imp(07, 01, '================================================================================');
  RDprint1.Imp(08, 01, 'Num. Orc.:');
  RDprint1.Imp(08, 12, StrZero(QRel.FieldByName('ORCAMENTO_ID').AsString, 6, 0));
  RDprint1.Imp(08, 27, 'Cond. Pagto/Fin.:');
  RDprint1.Imp(08, 44, QRel.FieldByName('COND_PAGTO').AsString);
  RDprint1.Imp(08, 44 + Length(QRel.FieldByName('COND_PAGTO').AsString), '/'+ Copy(QRel.FieldByName('NOME_FINALIZADORA').AsString,1,15));
  RDprint1.Imp(08, 65, 'Data:');
  RDprint1.Imp(08, 71, QRel.FieldByName('DT_ORCAMENTO').AsString);
  RDprint1.Imp(09, 01, 'Cliente/Cod.:');
  RDprint1.Imp(09, 16, Copy(QRel.FieldByName('NOME').AsString, 1, 40) + ' / ' + QRel.FieldByName('CLIENTE_ID').AsString);
  RDprint1.Imp(09, 65, 'Fone:');
  RDprint1.Imp(09, 71, QCliente.FieldByName('TELEFONE_1').AsString);
  RDprint1.Imp(10, 01, 'Endereço:');
  RDprint1.Imp(10, 10, Copy(QRel.FieldByName('ENDERECO').AsString, 1, 31));
  RDprint1.Imp(10, 65, 'Nº: ' + QRel.FieldByName('NUMERO').AsString);
  RDprint1.Imp(11, 01, 'Bairro:');
  RDprint1.Imp(11, 09, Copy(QRel.FieldByName('BAIRRO').AsString, 1, 23));
  RDprint1.Imp(11, 34, 'Cidade:');
  RDprint1.Imp(11, 42, Copy(QRel.FieldByName('MUNICIPIO').AsString, 1, 23));
  RDprint1.Imp(11, 65, 'CEP:');
  RDprint1.Imp(11, 71, QRel.FieldByName('CEP').AsString);
  RDprint1.Imp(12, 01, '================================================================================');
  RDprint1.Imp(13, 01, 'Cód.   Descrição                                    Qtd. Pr.Unit  Desc. Pr.Total');
  RDprint1.Imp(14, 01, '================================================================================');

  Linha := 15;
end;

end.
