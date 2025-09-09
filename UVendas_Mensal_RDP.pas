unit UVendas_Mensal_RDP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, StdCtrls, Buttons, ExtCtrls, DBCtrls,
  rxCurrEdit, Mask, rxToolEdit, QRCtrls, QuickRpt, RDprint, Printers,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmVendas_Mensal_RDP = class(TForm)
    Label1: TLabel;
    Dtmen: TDateEdit;
    Dtmai: TDateEdit;                        
    Label2: TLabel;
    Cliente: TCurrencyEdit;
    btnCliente: TSpeedButton;
    DBText1: TDBText;
    Bevel1: TBevel;
    btnExecuta: TBitBtn;
    btnRetorna: TBitBtn;
    DataCliente: TDataSource;
    Rel_Vendas_Mensal_Analitico: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    QRSysData1: TQRSysData;
    Cabec: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    QRLabel7: TQRLabel;
    QRShape2: TQRShape;
    QRLabel10: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRDBText19: TQRDBText;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    QRDBText3: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRShape3: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape4: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel14: TQRLabel;
    QRBand2: TQRBand;
    QRLabel11: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRShape5: TQRShape;
    QRDBText5: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRShape6: TQRShape;
    QRLabel19: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText18: TQRDBText;
    QRMemo2: TQRMemo;
    QRBand3: TQRBand;
    QRSysData3: TQRSysData;
    QRExpr2: TQRExpr;
    QRLabel31: TQRLabel;
    QRLabel23: TQRLabel;
    QRDBText20: TQRDBText;
    Label3: TLabel;
    Cond_Pagto: TComboBox;
    Rel_Vendas_Mensal_Sintetico: TQuickRep;
    QRBand4: TQRBand;
    QRDBText21: TQRDBText;
    QRSysData4: TQRSysData;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRLabel26: TQRLabel;
    QRSysData5: TQRSysData;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRDBText22: TQRDBText;
    QRLabel39: TQRLabel;
    QRBand5: TQRBand;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    SummaryBand1: TQRBand;
    QRShape9: TQRShape;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRSysData6: TQRSysData;
    Label4: TLabel;
    Tipo_Rel: TComboBox;
    Label5: TLabel;
    Tipo: TComboBox;
    Label6: TLabel;
    Caixa_Banco: TCurrencyEdit;
    btnCaixa_Banco: TSpeedButton;
    CheckBox1: TCheckBox;
    RDprint1: TRDprint;
    Label7: TLabel;
    Ordem: TComboBox;
    QVencimento: TFDQuery;
    QParcelas: TFDQuery;
    QItens: TFDQuery;
    QCliente: TFDQuery;
    QRel: TFDQuery;
    IQuery: TFDQuery;
    Chk_Cliente_Zero: TCheckBox;
    Label8: TLabel;
    SrcList: TListBox;
    IncludeBtn: TSpeedButton;
    IncAllBtn: TSpeedButton;
    ExcludeBtn: TSpeedButton;
    ExAllBtn: TSpeedButton;
    DstList: TListBox;
    QCfop: TFDQuery;
    Label9: TLabel;
    Fornecedor: TCurrencyEdit;
    btnFornecedor: TSpeedButton;
    DBText2: TDBText;
    DataFornecedor: TDataSource;
    Qfornecedor: TFDQuery;
    Label10: TLabel;
    Vendedor: TCurrencyEdit;
    btnVendedor: TSpeedButton;
    DBText3: TDBText;
    Qvendedor: TFDQuery;
    DataVendedor: TDataSource;
    CHK_EXIBIR_VENDEDORES: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnClienteClick(Sender: TObject);
    procedure btnRetornaClick(Sender: TObject);
    procedure DtmenEnter(Sender: TObject);
    procedure ClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ClienteChange(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure btnCaixa_BancoClick(Sender: TObject);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure RDprint1NewPage(Sender: TObject; Pagina: Integer);
    procedure Tipo_RelChange(Sender: TObject);
    procedure TipoChange(Sender: TObject);
    procedure IncludeBtnClick(Sender: TObject);
    procedure IncAllBtnClick(Sender: TObject);
    procedure ExcludeBtnClick(Sender: TObject);
    procedure ExAllBtnClick(Sender: TObject);
    procedure btnFornecedorClick(Sender: TObject);
    procedure btnVendedorClick(Sender: TObject);
    procedure VendedorExit(Sender: TObject);
  private
  procedure MoveSelected(List: TCustomListBox; Items: TStrings);
  procedure SetItem(List: TListBox; Index: Integer);
  procedure SetButtons;
  function GetFirstSelection(List: TCustomListBox): Integer;
    { Private declarations }
  public
    { Public declarations }
    procedure SearchCliente;


  end;

var
  FrmVendas_Mensal_RDP: TFrmVendas_Mensal_RDP;
  linha, pagina: integer;
  Total, Subtotal, Total_IPI, Total_Frete, Total_Subtotal, Total_Desconto, Total_Acrescimo, Total_Geral, Soma: Real;
  contaQuebra: string;

implementation

uses
  UConsulta, UPrincipal, UData;

{$R *.dfm}

procedure TFrmVendas_Mensal_RDP.MoveSelected(List: TCustomListBox; Items: TStrings);
var
I: Integer;
begin
  for I := List.Items.Count - 1 downto 0 do
  begin
    if List.Selected[I] then
    begin
      Items.AddObject(List.Items[I], List.Items.Objects[I]);
      List.Items.Delete(I);
    end;
  end;
end;

function TFrmVendas_Mensal_RDP.GetFirstSelection(List: TCustomListBox): Integer;
begin
  for Result := 0 to List.Items.Count - 1 do
  begin
    if List.Selected[Result] then
      exit;
  end;
  Result := LB_ERR;
end;

procedure TFrmVendas_Mensal_RDP.SetButtons;
var
SrcEmpty, DstEmpty: Boolean;
begin
  SrcEmpty           := SrcList.Items.Count = 0;
  DstEmpty           := DstList.Items.Count = 0;
  IncludeBtn.Enabled := not SrcEmpty;
  IncAllBtn.Enabled  := not SrcEmpty;
  ExcludeBtn.Enabled := not DstEmpty;
  ExAllBtn.Enabled   := not DstEmpty;
end;


procedure TFrmVendas_Mensal_RDP.SetItem(List: TListBox; Index: Integer);
var
MaxIndex: Integer;
begin
  with List do
  begin
    SetFocus;
    MaxIndex := List.Items.Count - 1;

    if Index = LB_ERR then
      Index := 0
    else if Index > MaxIndex then
      Index := MaxIndex;

    Selected[Index] := True;
  end;

  SetButtons;
end;




procedure TFrmVendas_Mensal_RDP.SearchCliente;
begin
  try

    if Cliente.value > 0 Then
    Begin

     QCliente.Sql.Clear;
     QCliente.Sql.Add('SELECT * FROM CLIENTES');
     QCliente.Sql.Add('WHERE');
     QCliente.Sql.Add('(CLIENTE_ID = :CLIENTE_ID)');
     QCliente.Sql.Add('AND (STATUS = :STATUS)');

     QCliente.ParamByName('CLIENTE_ID').AsInteger := StrToInt(Cliente.Text);
     QCliente.ParamByName('STATUS').AsString      := 'A';

     QCliente.Prepare;
     QCliente.Open;



    End;
    if fornecedor.value > 0 Then
    Begin

     QFornecedor.Sql.Clear;
     QFornecedor.Sql.Add('SELECT * FROM FORNECEDORES');
     QFornecedor.Sql.Add('WHERE');
     QFornecedor.Sql.Add('(FORNECEDOR_ID = :FORNECEDOR_ID)');
     QFornecedor.Sql.Add('AND (STATUS = :STATUS)');

     QFornecedor.ParamByName('FORNECEDOR_ID').AsInteger := StrToInt(FORNECEDOR.Text);
     QFornecedor.ParamByName('STATUS').AsString      := 'A';

     QFornecedor.Prepare;
     QFornecedor.Open;



    End;

  except



  end;
end;

procedure TFrmVendas_Mensal_RDP.TipoChange(Sender: TObject);
begin
  if Tipo.Text = 'Cfop' then
  begin
  SrcList.Enabled    := True;
  DstList.Enabled    := True;
  IncludeBtn.Enabled := True;
  IncAllBtn.Enabled  := True;
  ExcludeBtn.Enabled := True;
  ExAllBtn.Enabled   := True;
  end
  else
  begin
  SrcList.Enabled    := False;
  DstList.Enabled    := False;
  IncludeBtn.Enabled := False;
  IncAllBtn.Enabled  := False;
  ExcludeBtn.Enabled := False;
  ExAllBtn.Enabled   := False;
  DstList.Items.Clear;
  end;


end;

procedure TFrmVendas_Mensal_RDP.Tipo_RelChange(Sender: TObject);
begin

    Ordem.Items.Clear;

    if Tipo_Rel.Text = 'Analítico' then
    begin
        Ordem.Items.Add('Data');
        Ordem.Items.Add('NFe');
        Ordem.Items.Add('Cliente');
        Ordem.Items.Add('Valor');
    end
    else
    begin
        Ordem.Items.Add('Data');
        Ordem.Items.Add('NFe');
        Ordem.Items.Add('Cliente');
        Ordem.Items.Add('Valor');
        Ordem.Items.Add('Cliente, Valor');
    end;

    Ordem.ItemIndex := 0;

end;

procedure TFrmVendas_Mensal_RDP.VendedorExit(Sender: TObject);
begin

    QVendedor.Close;
    QVendedor.ParamByName('FUNCIONARIO_ID').AsInteger := StrToInt(VENDEDOR.Text);
    QVendedor.Prepare;
    QVendedor.Open;


end;

procedure TFrmVendas_Mensal_RDP.btnCaixa_BancoClick(Sender: TObject);
begin
  try
    Caixa_Banco.Value := GetConsulta('BANCOS', 0, 0, StrToInt(Caixa_Banco.Text));
  except
    Caixa_Banco.Value := GetConsulta('BANCOS', 0, 0, 0);
  end;
end;

procedure TFrmVendas_Mensal_RDP.btnClienteClick(Sender: TObject);
begin
  try
    Cliente.Value := GetConsulta('CLIENTES', 0, 0, StrToInt(CLIENTE.Text));
  except
    Cliente.Value := GetConsulta('CLIENTES', 0, 0, 0);
  end;
end;

procedure TFrmVendas_Mensal_RDP.btnExecutaClick(Sender: TObject);
var
 Nome_Cliente, Primeiro,Parametro : string;
 Ag_IPI, Ag_Frete, Ag_Subtotal, Ag_Desconto, Ag_Acrescimo, Ag_Geral, Total_qtd, Total_vr, markup,vr_lucro : Real;
 I,ticket:Integer;
begin
// 229, 325
  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    QRel.Sql.Clear;

    if Ordem.Text = 'Cliente, Valor' then
    begin
       QRel.Sql.Add('SELECT NOME_CLIENTE, MAX(DT_TRANS) DT_TRANS, MAX(NUM_DOC) NUM_DOC, MAX(SERIE) SERIE,');
       QRel.Sql.Add('MAX(MODELO) MODELO, SUM(VR_IPI) VR_IPI, SUM(VR_FRETE) VR_FRETE, SUM(VALOR) VALOR,');
       QRel.Sql.Add('SUM(VR_DESCONTO) VR_DESCONTO, SUM(VR_ACRESCIMO) VR_ACRESCIMO FROM(');
    end;

    QRel.Sql.Add('SELECT TRANSACOES.*, FUNCIONARIOS.NOME, TRIM(CLIENTES.NOME) NOME_CLIENTE');
    QRel.Sql.Add('FROM TRANSACOES');

     IF Chk_Exibir_Vendedores.Checked Then
     QRel.Sql.Add('INNER JOIN FUNCIONARIOS ON (TRANSACOES.VENDEDOR_ID = FUNCIONARIOS.FUNCIONARIO_ID) AND (FUNCIONARIOS.CARGO_ID = (SELECT TABELA_ID FROM TABELAS WHERE DESCRICAO = ''VENDEDOR'' )) ')
     Else
     QRel.Sql.Add('LEFT JOIN FUNCIONARIOS ON (TRANSACOES.VENDEDOR_ID = FUNCIONARIOS.FUNCIONARIO_ID) ');

    QRel.Sql.Add('LEFT JOIN CLIENTES');
    QRel.Sql.Add('ON (TRANSACOES.CLIENTE_ID = CLIENTES.CLIENTE_ID)');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(TRANSACOES.DT_ENT_SAI BETWEEN :DT_INICIAL AND :DT_FINAL)');
    QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');

    //Alterado dia 06/02/2021
    if FrmData.QAcesso.FieldByName('TPCTB').AsString = '2' then
    begin
      QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
      QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    end
    else
    begin
        if FrmPrincipal.config.FieldByName('TOTALIZADOR_G').AsString <> 'True'  then
        begin
          QRel.Sql.Add('AND (TRANSACOES.TPCTB = :TPCTB)');
          QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
        end;
    end;

    //alterado dia 23/11 chamado 378
    QRel.Sql.Add('AND (TRANSACOES.HISTORICO <> :STR_SANGRIA AND TRANSACOES.HISTORICO <> :STR_SUPRIMENTO)');
    QRel.ParamByName('STR_SANGRIA').AsString     :=  'SANGRIA';
    QRel.ParamByName('STR_SUPRIMENTO').AsString  :=  'SUPRIMENTO';

    if Tipo.Text = 'NFe - Notas Inutilizadas' then
       QRel.Sql.Add('AND (TRANSACAO_ID IN(SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS WHERE RECIBO = :RECIBO))')
    else if Tipo.Text = 'NFe - Notas Denegadas' then
       QRel.Sql.Add('AND (TRANSACAO_ID IN(SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS WHERE RECIBO = :RECIBO))')
    else if Tipo.Text = 'NFe - Notas Canceladas' then
       QRel.Sql.Add('AND (TRANSACAO_ID IN(SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS WHERE RECIBO <> :RECIBO ))')
    Else if Tipo.Text = 'CTe - Notas Inutilizadas' then
       QRel.Sql.Add('AND (TRANSACAO_ID IN(SELECT TRANSACAO_ID FROM CTES_CANCELADAS WHERE RECIBO = :RECIBO))')
    else if Tipo.Text = 'CTe - Notas Denegadas' then
       QRel.Sql.Add('AND (TRANSACAO_ID IN(SELECT TRANSACAO_ID FROM CTES_CANCELADAS WHERE RECIBO = :RECIBO))')
    else if Tipo.Text = 'CTe - Notas Canceladas' then
       QRel.Sql.Add('AND (TRANSACAO_ID IN(SELECT TRANSACAO_ID FROM CTES_CANCELADAS))')
    Else if Tipo.Text = 'NFC-e - Notas Inutilizadas' then
       QRel.Sql.Add('AND (TRANSACAO_ID IN(SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE WHERE RECIBO = :RECIBO))')
    else if Tipo.Text = 'NFC-e - Notas Denegadas' then
       QRel.Sql.Add('AND (TRANSACAO_ID IN(SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE WHERE RECIBO = :RECIBO))')
    else if Tipo.Text = 'NFC-e - Notas Canceladas' then
       QRel.Sql.Add('AND (TRANSACAO_ID IN(SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE WHERE RECIBO <> :RECIBO ))')
    else
    Begin
       if (Tipo.Text = 'NFe') Then
       QRel.Sql.Add('AND (TRANSACAO_ID IN (SELECT TRANSACAO_ID FROM COMPL_NFISCAL WHERE PROTOCOLO <> '' '' AND RECIBO <> '' ''))')
       Else if (Tipo.Text = 'CTe') Then
       QRel.Sql.Add('AND (TRANSACAO_ID IN (SELECT TRANSACAO_ID FROM COMPL_CTEFISCAL))')
       Else if (Tipo.Text = 'NFC-e') Then
       QRel.Sql.Add('AND (TRANSACAO_ID IN (SELECT TRANSACAO_ID FROM COMPL_NFCEFISCAL))');
    End;

    if Caixa_Banco.Value > 0 then
      QRel.Sql.Add('AND (TRANSACOES.BANCO_ID = :BANCO_ID)');

   if Vendedor.Value > 0 then
      QRel.Sql.Add('AND (TRANSACOES.VENDEDOR_ID = :VENDEDOR_ID)');



    if Tipo.Text = 'Todas as Vendas' then
    Begin
      QRel.Sql.Add('AND (TRANSACOES.BALANCO <> :BALANCO)');
      QRel.Sql.Add('AND (TRANSACOES.TIPO_VENDA = :TIPO_VENDA)');
      QRel.Sql.Add('AND (TRANSACOES.MODELO <> ''57'')');

     // QRel.Sql.Add('AND (TRANSACOES.MODELO IN (:MODELO, :MODELO2))');


      if FrmData.QAcesso.FieldByName('TPCTB').AsString = '2' Then
      Begin

      QRel.Sql.Add('AND ((TRANSACAO_ID IN(SELECT TRANSACAO_ID FROM COMPL_NFISCAL))');
      QRel.Sql.Add('OR  (TRANSACAO_ID IN(SELECT TRANSACAO_ID FROM COMPL_NFCEFISCAL)))');
      // POISLER início 03/06/2023
      // retirado compl_nfce para ficar igual ao extrato de comissão
      // mesmo não tendo compl_nfce, a venda foi feita e ela é válida, a menos que tenha
      // a transação nas canceladas, mas já vai ser desconsiderado abaixo.
      // no modelo foi adicionado pra verificar 65 junto com 2D para que puxe as nfce sem compl
      // que não estão canceladas
      //QRel.Sql.Add('OR  (TRANSACAO_ID IN(SELECT TRANSACAO_ID FROM COMPL_NFCEFISCAL))');
      //QRel.Sql.Add('OR  (TRANSACOES.MODELO IN (:MODELO, :MODELO2)))');
      //QRel.Sql.Add('AND  (TRANSACOES.MODELO IN (:MODELO, :MODELO2))');
      End;
      // garantindo se por algum problema a transação constar na compl e nas canceladas
      // vai considerar como cancelada e não vai aparecer em todas as vendas
      // obs: fora do "if" pra não misturar no relatório gerencial também
     // QRel.Sql.Add('AND TRANSACAO_ID NOT IN(SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS)');
     // QRel.Sql.Add('AND TRANSACAO_ID NOT IN(SELECT TRANSACAO_ID FROM CTES_CANCELADAS)');
     // QRel.Sql.Add('AND TRANSACAO_ID NOT IN(SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE)');
      // POISLER fim 03/06/2023

    End
    ELSE if Tipo.Text = 'Cfop' then
    begin

      if ( DstList.Items.Count > 0 ) then
        begin
          QRel.Sql.Add('AND((');

            for I := 0 to (DstList.Items.Count - 1) do
            begin
                if DstList.Items.Strings[I] <> '' then
                begin

                   {
                     if I = 0 then
                      begin
                       QRel.Sql.Add('TRANSITENS.CFOP = :CODIGO');
                       QRel.ParamByName('CODIGO').AsString := Copy( DstList.Items.Strings[I], 1, 4 );
                      end
                     else
                      Begin
                       QRel.Sql.Add('OR (TRANSITENS.CFOP = :CODIGO)');
                       QRel.ParamByName('CODIGO').AsString := Copy( DstList.Items.Strings[I], 1, 4 );
                     End;
                    }

                     Parametro := 'CODIGO_'+IntToStr(I);

                     if I = 0 then
                      begin
                       QRel.Sql.Add('(TRANSACOES.CFOP= :'+Parametro+') ');
                       QRel.ParamByName(Parametro).AsString := Copy( DstList.Items.Strings[I], 1, 4 );
                      end
                     else
                     begin
                       QRel.Sql.Add( 'OR (TRANSACOES.CFOP=:'+ Parametro + ')');
                       QRel.ParamByName(Parametro).AsString := Copy( DstList.Items.Strings[I], 1, 4 );
                     End;

                end;
            end;

            QRel.Sql.Add('))');
        end;

    end

    else if Tipo.Text = 'Cupom Fiscal' then
    begin
      QRel.Sql.Add('AND (TRANSACOES.MODELO = :MODELO)');
      QRel.Sql.Add('AND (TRANSACOES.BALANCO <> :BALANCO)');
      QRel.Sql.Add('AND (TRANSACOES.TIPO_VENDA = :TIPO_VENDA)');


    end
    else if (Tipo.Text = 'NFe') then
      Begin
      QRel.Sql.Add('AND ((TRANSACOES.MODELO = :MODELO1) OR (TRANSACOES.MODELO = :MODELO2) OR (TRANSACOES.MODELO = :MODELO3) OR (TRANSACOES.MODELO = :MODELO4))');
      QRel.Sql.Add('AND (TRANSACOES.BALANCO <> :BALANCO)');
      QRel.Sql.Add('AND (TRANSACOES.TIPO_VENDA = :TIPO_VENDA)');
      End
    else if (Tipo.Text ='NFe - Todas Emitidas(Válidas)') Then
    Begin
      QRel.Sql.Add('AND (TRANSACOES.MODELO = :MODELO4)');
     // QRel.Sql.Add('AND (TRANSACOES.TIPO_VENDA IN (''AVARIA'',''BONIFICACAO'',''REMESSA'',''VENDA'',''CONSUMO'',''TRANSFERÊNCIA''))');
     // QRel.Sql.Add('AND (TRANSACOES.TIPO_VENDA = :TIPO_VENDA)');
      QRel.Sql.Add('AND ((TRANSACOES.CONDUTA = ''01'' AND TRANSACOES.DEPTO = ''07'') OR (TRANSACOES.DEPTO = ''10''))');
      QRel.Sql.Add('AND TRANSACAO_ID NOT IN(SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS)');
      QRel.Sql.Add('AND TRANSACAO_ID NOT IN(SELECT TRANSACAO_ID FROM CTES_CANCELADAS)');
      QRel.Sql.Add('AND TRANSACAO_ID NOT IN(SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE)');
      QRel.Sql.Add('AND (TRANSACAO_ID IN (SELECT TRANSACAO_ID FROM COMPL_NFISCAL WHERE PROTOCOLO <> '' '' AND RECIBO <> '' ''))')
    End
    else if (Tipo.Text = 'CTe') then
      Begin
      QRel.Sql.Add('AND ((TRANSACOES.MODELO = :MODELO1) OR (TRANSACOES.MODELO = :MODELO2))');
      QRel.Sql.Add('AND (TRANSACOES.BALANCO <> :BALANCO)');
      QRel.Sql.Add('AND (TRANSACOES.TIPO_VENDA = :TIPO_VENDA)');
      End
    else if (Tipo.Text = 'NFC-e') then
      Begin
      QRel.Sql.Add('AND ((TRANSACOES.MODELO = :MODELO5))');
      QRel.Sql.Add('AND (TRANSACOES.BALANCO <> :BALANCO)');
      QRel.Sql.Add('AND (TRANSACOES.TIPO_VENDA = :TIPO_VENDA)');
      End
    else if Tipo.Text = 'Vendas Agrupadas' then
      Begin
        QRel.Sql.Add('AND (TRANSACOES.BALANCO = :BALANCO)');
        QRel.Sql.Add('AND (TRANSACOES.TIPO_VENDA = :TIPO_VENDA)');
      End
    else if Tipo.Text = 'Serviços' then
      Begin
        QRel.Sql.Add('AND (TRANSACOES.MODELO = :MODELO_S)');
        QRel.Sql.Add('AND (TRANSACOES.TIPO_VENDA = :TIPO_VENDA)');
      End;

    if Cliente.Value > 0  then
       QRel.Sql.Add('AND (TRANSACOES.CLIENTE_ID = :CLIENTE_ID)')
    else
    begin
       if (Cliente.Value = 0) AND (Chk_Cliente_Zero.Checked) then
       begin
         QRel.Sql.Add('AND (TRANSACOES.CLIENTE_ID = 0)');
       end;
    end;

    if Fornecedor.Value > 0  then
    Begin
       QRel.Sql.Add('AND (TRANSACOES.FORNECEDOR_ID = :FORNECEDOR_ID)');
       QRel.ParamByName('FORNECEDOR_ID').AsInteger := StrToInt(Fornecedor.Text);
    End;


    if (Cond_Pagto.Text <> '') then
    Begin
      QRel.Sql.Add('AND (TRANSACOES.COND_PAGTO = :COND_PAGTO)');
      QRel.Sql.Add('AND (TRANSACOES.BALANCO <> :BALANCO)');
      QRel.Sql.Add('AND (TRANSACOES.TIPO_VENDA = :TIPO_VENDA)');

    End;

    if  Tipo.Text <> 'NFe - Notas Inutilizadas' then
    QRel.Sql.Add('AND ((TRANSACOES.CONDUTA = :CONDUTA) OR (TRANSACOES.CONDUTA = :CONDUTA_02) )');
//   QRel.Sql.Add('AND (TRANSACOES.DEPTO = :DEPTO)');

    if Ordem.Text = 'Data' then
      QRel.Sql.Add('ORDER BY TRANSACOES.DT_ENT_SAI')
    else if Ordem.Text = 'NFe' then
      QRel.Sql.Add('ORDER BY TRANSACOES.NUM_DOC')
    else if Ordem.Text = 'Cliente' then
      QRel.Sql.Add('ORDER BY NOME_CLIENTE')
    else if Ordem.Text = 'Valor' then
      QRel.Sql.Add('ORDER BY VALOR DESC')
    else if Ordem.Text = 'Cliente, Valor' then
      QRel.SQL.Add('ORDER BY NOME_CLIENTE, VALOR DESC')
    Else
      QRel.SQL.Add('ORDER BY TRANSACOES.TRANSACAO_ID');


    if Ordem.Text = 'Cliente, Valor' then
    begin
       QRel.Sql.Add(') AS consulta GROUP BY NOME_CLIENTE ORDER BY VALOR DESC');
    end;

    QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
    QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    //QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;

    if (Tipo.Text = 'NFe - Notas Canceladas') OR (Tipo.Text = 'NFe - Notas Inutilizadas') OR  (Tipo.Text = 'CTe - Notas Inutilizadas') OR  (Tipo.Text = 'NFC-e - Notas Inutilizadas') OR (Tipo.Text = 'NFC-e - Notas Canceladas') then
    QRel.ParamByName('RECIBO').AsString        := 'INUTILIZADA';

    if  (Tipo.Text = 'NFe - Notas Denegadas') OR (Tipo.Text = 'CTe - Notas Denegadas') OR (Tipo.Text = 'NFC-e - Notas Denegadas') then
    QRel.ParamByName('RECIBO').AsString        := 'DENEGADA';

    if Tipo.Text = 'Todas as Vendas' then
    Begin
      QRel.ParamByName('BALANCO').AsString      := 'AGRUPADO';
      QRel.ParamByName('TIPO_VENDA').AsString   := 'VENDA';
      {
      if FrmData.QAcesso.FieldByName('TPCTB').AsString = '2' Then
      begin
        QRel.ParamByName('MODELO').AsString     := '2D';
        // POISLER 03/06/2023
        QRel.ParamByName('MODELO2').AsString    := '65';
      end;
      }
    End
    else if Tipo.Text = 'Cupom Fiscal' then
    begin
      QRel.ParamByName('MODELO').AsString       := '2D';
      QRel.ParamByName('BALANCO').AsString      := 'AGRUPADO';
      QRel.ParamByName('TIPO_VENDA').AsString   := 'VENDA';

      if Caixa_Banco.Value > 0 then
        Begin
        QRel.ParamByName('BANCO_ID').AsInteger    := StrToInt(Caixa_Banco.Text);
        QRel.ParamByName('TIPO_VENDA').AsString   := 'VENDA';

        End;
    end
    else if (Tipo.Text = 'NFe')  then
    Begin
      QRel.ParamByName('MODELO1').AsString      := '01';
      QRel.ParamByName('MODELO2').AsString      := '1B';
      QRel.ParamByName('MODELO3').AsString      := '04';
      QRel.ParamByName('MODELO4').AsString      := '55';
      QRel.ParamByName('BALANCO').AsString      := 'AGRUPADO';
      QRel.ParamByName('TIPO_VENDA').AsString   := 'VENDA';
    end
    else if (Tipo.Text ='NFe - Todas Emitidas(Válidas)') Then
    Begin

     //QRel.ParamByName('MODELO1').AsString      := '01';
     //QRel.ParamByName('MODELO2').AsString      := '1B';
      QRel.ParamByName('MODELO4').AsString      := '55';

    End
    else if (Tipo.Text = 'CTe') then
    Begin
      QRel.ParamByName('MODELO1').AsString      := '57';
      QRel.ParamByName('MODELO2').AsString      := '67';
      QRel.ParamByName('BALANCO').AsString      := 'AGRUPADO';
      QRel.ParamByName('TIPO_VENDA').AsString   := 'VENDA';
    end
    else if (Tipo.Text = 'NFC-e') then
    Begin
      QRel.ParamByName('MODELO5').AsString      := '65';
      QRel.ParamByName('BALANCO').AsString      := 'AGRUPADO';
      QRel.ParamByName('TIPO_VENDA').AsString   := 'VENDA';
    end
    Else if Tipo.Text = 'Vendas Agrupadas' then
    Begin
      QRel.ParamByName('BALANCO').AsString      := 'AGRUPADO';
      QRel.ParamByName('TIPO_VENDA').AsString   := 'REMESSA';
    End

     Else if Tipo.Text = 'Serviços' then
    Begin
      QRel.ParamByName('MODELO_S').AsString     := '99';
      QRel.ParamByName('TIPO_VENDA').AsString   := 'VENDA';
    End;

    if Cliente.Value > 0 then
    Begin
      QRel.ParamByName('CLIENTE_ID').AsInteger := StrToInt(Cliente.Text);
     // QRel.ParamByName('BALANCO').AsString      := 'AGRUPADO';
     // QRel.ParamByName('TIPO_VENDA').AsString   := 'VENDA';
    End;

    if Cond_Pagto.Text <> '' then
    Begin
      QRel.ParamByName('COND_PAGTO').AsString := Cond_Pagto.Text;
      QRel.ParamByName('BALANCO').AsString      := 'AGRUPADO';
      QRel.ParamByName('TIPO_VENDA').AsString   := 'VENDA';
    End;

    if  Tipo.Text <> 'NFe - Notas Inutilizadas' then
    Begin
    QRel.ParamByName('CONDUTA').AsString      := '01';
    QRel.ParamByName('CONDUTA_02').AsString   := '02';
    End;

    if Caixa_Banco.Value > 0 then
    QRel.ParamByName('BANCO_ID').AsInteger       := StrToInt(Caixa_Banco.Text);

    if Vendedor.Value > 0 then
    QRel.ParamByName('VENDEDOR_ID').AsInteger    := StrToInt(VENDEDOR.Text);


    QRel.Prepare;
    QRel.Open;

    QRLabel21.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;
    QRLabel25.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;


    if QRel.IsEmpty then
      Application.MessageBox('Não há dados para os parâmetros informados', PChar(Msg_Title), mb_IconInformation)
    else
   begin
      if Tipo_Rel.Text = 'Analítico' then
      //Rel_Vendas_Mensal_Analitico.PreviewModal
      //RELATÓRIO ANALÍTICO
      begin
         if CheckBox1.Checked = True then
         Begin
          RDprint1.Impressora := HP;
          RDprint1.FonteTamanhoPadrao := S10cpp;
         End;

        RDprint1.TamanhoQteColunas         := 100;
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

             QRel.First;
             while not Qrel.Eof do
             Begin

              RDprint1.Imp(linha,1, Qrel.FieldByName('TRANSACAO_ID').AsString);
              RDprint1.Imp(linha,10, Qrel.FieldByName('DT_ENT_SAI').AsString);
              RDprint1.Imp(linha,21, Qrel.FieldByName('NUM_DOC').AsString);
              RDprint1.Imp(linha,30, Copy(Qrel.FieldByName('HISTORICO').AsString,0,36));

               if Qrel.FieldByName('CLIENTE_ID').AsString > '0' then
                begin
                  RDprint1.ImpF(linha,70, Copy(Qrel.FieldByName('NOME_CLIENTE').AsString, 1,36), [comp12]);
                end;

               IQuery.Sql.Clear;
               IQuery.Sql.Add('SELECT * FROM TRANSITENS WHERE TRANSACAO_ID=:TRANSACAO_ID');
               IQuery.ParamByName('TRANSACAO_ID').AsInteger :=  Qrel.FieldByName('TRANSACAO_ID').AsInteger;
               IQuery.Prepare;
               IQuery.Open;

               Inc(linha);

               RDprint1.impC(linha, 38, '****** ITENS ******',[negrito]);

               Inc(linha);
               RDprint1.LinhaH(linha,01,100,0,false);
               Inc(linha);

               RDprint1.ImpF(linha,05, 'ID',[negrito]);
               RDprint1.ImpF(linha,08, 'DESCRICAO',[negrito]);
               RDprint1.ImpF(linha,56, 'Qtd',[negrito]);
               RDprint1.ImpF(linha,66, 'Vr. Uni.',[negrito]);
               RDprint1.ImpF(linha,80, 'Vr. Desc.',[negrito]);
               RDprint1.ImpF(linha,91, 'Vr. Total',[negrito]);

               Inc(linha);
               RDprint1.LinhaH(linha,01,100,0,false);
               Inc(linha);

               Subtotal:= 0;


                while not IQuery.Eof do
                Begin
                   RDprint1.Imp(linha,01, IQuery.FieldByName('TRANSACAO_ID').AsString);
                   RDprint1.ImpF(linha,08, Copy(IQuery.FieldByName('DESCRICAO').AsString, 1, 40), [comp12]);
                   RDprint1.ImpVal(linha,48,',#,##0.00',IQuery.FieldByName('QUANTIDADE').AsFloat,[]);
                   RDprint1.ImpVal(linha,63,',#,##0.00',IQuery.FieldByName('VR_UNITARIO').AsFloat,[]);
                   RDprint1.ImpVal(linha,77,',#,##0.00',IQuery.FieldByName('DESC_RODAPE').AsFloat,[]);
                   RDprint1.ImpVal(linha,89,',#,##0.00',IQuery.FieldByName('VR_TOTAL').AsFloat,[]);


                   //atualiza o valor da variável
                   Subtotal := Subtotal + (IQuery.FieldByName('VR_TOTAL').AsFloat);

                   if linha > 60 then
                   begin
                     RDprint1.novapagina;
                     Pagina := Pagina + 1;
                   end;

                   Inc(linha) ;
                   IQuery.Next;
                End;

                 if linha > 61 then
                 begin
                  RDprint1.novapagina;
                  Pagina := Pagina + 1;
                 end;

                  RDprint1.LinhaH(linha,88,100,0,false);

                  Inc(linha) ;
                  RDprint1.ImpF(linha,78, 'Subtotal =>',[negrito]);
                  RDprint1.ImpVal(linha,89,',###,##0.00',Subtotal,[negrito]);

                  Inc(linha);
                  RDprint1.ImpF(linha,78, 'Vr. ICM EST. =>',[]);
                  RDprint1.ImpVal(linha,89,',###,##0.00',Qrel.FieldByName('VR_ICMS_NORMAL').AsFloat,[]);

                  Inc(linha);
                  RDprint1.ImpF(linha,78, 'IPI =>',[]);
                  RDprint1.ImpVal(linha,89,',###,##0.00',Qrel.FieldByName('VR_IPI').AsFloat,[]);

                  Inc(linha);
                  RDprint1.ImpF(linha,78, 'Acréscimo =>',[]);
                  RDprint1.ImpVal(linha,89,',###,##0.00',Qrel.FieldByName('VR_ACRESCIMO').AsFloat,[]);

                  Inc(linha);
                  RDprint1.ImpF(linha,78, 'Frete =>',[]);
                  RDprint1.ImpVal(linha,89,',###,##0.00',Qrel.FieldByName('VR_FRETE').AsFloat,[]);

                  if linha > 63 then
                  begin
                    RDprint1.novapagina;
                    Pagina := Pagina + 1;
                  end;


                  Inc(linha);
                  RDprint1.ImpF(linha,78, 'Desconto =>',[]);
                  RDprint1.ImpVal(linha,89,',###,##0.00',Qrel.FieldByName('VR_DESCONTO').AsFloat,[]);

                  Soma:= Subtotal;

                  Inc(linha);
                  RDprint1.LinhaH(linha,78,100,0,false);
                  Inc(linha);
                  RDprint1.ImpF(linha,78, 'Total =>',[negrito]);
                  RDprint1.ImpVal(linha,89,',###,##0.00',Qrel.FieldByName('VALOR').AsFloat,[negrito]);


                 Inc(linha);
                 Inc(linha);

                 Qrel.Next;
                 Application.ProcessMessages;

                 if linha > 66 then
                 begin
                  RDprint1.novapagina;
                  Pagina := Pagina + 1;
                 end;


             End;

        RDprint1.TamanhoQteLinhas:= 66;
        RDprint1.Fechar;
      end
      else if Tipo_Rel.Text ='Sintético' then
      //RELATÓRIO SINTÉTICO
      begin
      if CheckBox1.Checked = True then
       Begin
        RDprint1.Impressora := HP;
        RDprint1.FonteTamanhoPadrao := S10cpp;
       End;

      RDprint1.Orientacao:= poLandscape;
      RDprint1.TamanhoQteColunas:=132;
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

          Pagina          := 1;
          Total_IPI       := 0;
          Total_Frete     := 0;
          Total_Subtotal  := 0;
          Total_Desconto  := 0;
          Total_Acrescimo := 0;
          Total_Geral     := 0;
          Total_qtd       := 0;
          Total_vr        := 0;
          Ticket          := 0;

          while not Qrel.Eof do
          begin
            RDprint1.ImpF(linha,1, Qrel.FieldByName('DT_TRANS').AsString,[comp12]);
            RDprint1.ImpF(linha,10, Copy(Qrel.FieldByName('NOME_CLIENTE').AsString, 1, 30),[comp12]);
            RDprint1.Imp(linha,38, Qrel.FieldByName('NUM_DOC').AsString);
            RDprint1.Imp(linha, 52, Qrel.FieldByName('SERIE').AsString);
            RDprint1.Imp(linha,59, Qrel.FieldByName('MODELO').AsString);
            RDprint1.ImpVal(linha,64,',#,##0.00',Qrel.FieldByName('VR_IPI').AsFloat,[]);
            RDprint1.ImpVal(linha,76,',#,##0.00',Qrel.FieldByName('VR_FRETE').AsFloat,[]);
            RDprint1.ImpVal(linha,89,',#,##0.00',(Qrel.FieldByName('VALOR').AsFloat + Qrel.FieldByName('VR_DESCONTO').AsFloat - Qrel.FieldByName('VR_ACRESCIMO').AsFloat) ,[]);
            RDprint1.ImpVal(linha,100,',#,##0.00',Qrel.FieldByName('VR_DESCONTO').AsFloat,[]);
            RDprint1.ImpVal(linha,111,',#,##0.00',Qrel.FieldByName('VR_ACRESCIMO').AsFloat,[]);
            RDprint1.ImpVal(linha,122,',#,##0.00',Qrel.FieldByName('VALOR').AsFloat,[]);


            Total_IPI := Total_IPI + Qrel.FieldByName('VR_IPI').AsFloat;
            Total_Frete := Total_Frete + Qrel.FieldByName('VR_FRETE').AsFloat;
            Total_Subtotal := Total_Subtotal + Qrel.FieldByName('VALOR').AsFloat + Qrel.FieldByName('VR_DESCONTO').AsFloat - Qrel.FieldByName('VR_ACRESCIMO').AsFloat ;
            Total_Desconto := Total_Desconto + Qrel.FieldByName('VR_DESCONTO').AsFloat;
            Total_Acrescimo := Total_Acrescimo + Qrel.FieldByName('VR_ACRESCIMO').AsFloat;
            Total_Geral := Total_Geral + Qrel.FieldByName('VALOR').AsFloat;

            if linha > 65 then
            begin
              RDprint1.novapagina;
              Pagina := Pagina + 1;
            end;


             if Ordem.Text <> 'Cliente, Valor' then
             begin
                 if Qrel.FieldByName('PARCELA_ID').AsString = 'F' then
                 begin
                     Total_qtd := Total_qtd + 1;
                     Total_vr  := Total_vr + Qrel.FieldByName('VALOR').AsFloat;
                 end;
             end;



            inc(ticket);
            Inc(linha);
            Qrel.next;
          end;

          if linha > 65 then
            begin
              RDprint1.novapagina;
              Pagina := Pagina + 1;
            end;


           //rodape com valores totais
          RDprint1.LinhaH(linha,64,132,0,false);
          Inc(linha);
          RDprint1.ImpVal(linha,64,',#,##0.00',Total_IPI,[negrito]);
          RDprint1.ImpVal(linha,76,',#,##0.00',Total_Frete,[negrito]);
          RDprint1.ImpVal(linha,91,',#,##0.00',Total_Subtotal,[negrito]);
          RDprint1.ImpVal(linha,102,',#,##0.00',Total_Desconto,[negrito]);
          RDprint1.ImpVal(linha,111,',#,##0.00',Total_Acrescimo,[negrito]);
          RDprint1.ImpVal(linha,123,',#,##0.00',Total_Geral,[negrito]);

          Inc(Linha);
          Inc(Linha);


          RDprint1.ImpF(linha,05, 'Total valor do Ticket Médio =>',[negrito]);
          RDprint1.ImpVal(linha,34,',###,##0.00',Total_Geral / ticket,[negrito]);

          Inc(Linha);
          Inc(Linha);


          if linha > 65 then
            begin
              RDprint1.novapagina;
              Pagina := Pagina + 1;
            end;



          if Chk_Cliente_Zero.Checked then
            RDprint1.ImpF(linha, 01, 'Total de Vendas Multi Pagamento (Sem vínculo com cliente):', [negrito])
          else
            RDprint1.ImpF(linha, 01, 'Total de Vendas Multi Pagamento:', [negrito]);

          if Ordem.Text <> 'Cliente, Valor' then
          begin
              Inc(linha);
              RDprint1.Imp(linha, 05, 'Quantidade: ' + FormatFloat('###,##0.00', Total_qtd));
              Inc(linha);
              RDprint1.Imp(linha, 05, '     Valor: ' + FormatFloat('###,##0.00', Total_vr));
          end;



          Application.ProcessMessages;
          RDprint1.TamanhoQteLinhas:= 66;
          RDprint1.Fechar;

      end
      else if Tipo_Rel.Text ='Sintético(Formas de Pagamento)' then
      begin


       if CheckBox1.Checked = True then
       Begin
        RDprint1.Impressora := HP;
        RDprint1.FonteTamanhoPadrao := S10cpp;
       End;

        RDprint1.Orientacao:= poLandscape;
        RDprint1.TamanhoQteColunas:=132;
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

        Pagina          := 1;
        Total_IPI       := 0;
        Total_Frete     := 0;
        Total_Subtotal  := 0;
        Total_Desconto  := 0;
        Total_Acrescimo := 0;
        Total_Geral     := 0;
        Total_qtd       := 0;
        Total_vr        := 0;
        markup          := 0;
        vr_lucro        := 0;


        while not Qrel.Eof do
        begin
          IQuery.SQL.Clear;
          IQuery.SQL.Add('SELECT SUM((PRODUTOS.CUSTO_COMPRA - VR_DESCONTO + VR_ACRESCIMO) * TRANSITENS.QUANTIDADE) VR_CUSTO ');
          IQuery.SQL.Add('FROM TRANSITENS');
          IQuery.SQL.Add('INNER JOIN PRODUTOS ON PRODUTOS.PRODUTO_ID = TRANSITENS.PRODUTO_ID');
          IQuery.SQL.Add('WHERE TRANSACAO_ID = :TRANSACAO_ID');

          IQuery.ParamByName('TRANSACAO_ID').AsInteger := Qrel.FieldByName('TRANSACAO_ID').AsInteger;
          IQuery.Prepare;
          IQuery.Open();


           markup := (((Qrel.FieldByName('VALOR').AsFloat + Qrel.FieldByName('VR_DESCONTO').AsFloat - Qrel.FieldByName('VR_ACRESCIMO').AsFloat) - IQuery.FieldByName('VR_CUSTO').AsFloat) / Qrel.FieldByName('VALOR').AsFloat) * 100;
           vr_lucro := (Qrel.FieldByName('VALOR').AsFloat + Qrel.FieldByName('VR_DESCONTO').AsFloat - Qrel.FieldByName('VR_ACRESCIMO').AsFloat) - IQuery.FieldByName('VR_CUSTO').AsFloat;

          RDprint1.ImpF(linha,1, Qrel.FieldByName('DT_TRANS').AsString,[comp12]);
          RDprint1.ImpF(linha,10, Copy(Qrel.FieldByName('NOME_CLIENTE').AsString, 1, 30),[comp12]);
          RDprint1.Imp(linha,38, Qrel.FieldByName('NUM_DOC').AsString);
          RDprint1.Imp(linha,52, Qrel.FieldByName('COND_PAGTO').AsString);
          RDprint1.Imp(linha,64, Qrel.FieldByName('MODELO').AsString);
         //RDprint1.ImpVal(linha,64,',#,##0.00',Qrel.FieldByName('VR_IPI').AsFloat,[]);
         //RDprint1.ImpVal(linha,76,',#,##0.00',Qrel.FieldByName('VR_FRETE').AsFloat,[]);
         //RDprint1.ImpVal(linha,89,',#,##0.00',(Qrel.FieldByName('VALOR').AsFloat + Qrel.FieldByName('VR_DESCONTO').AsFloat - Qrel.FieldByName('VR_ACRESCIMO').AsFloat) ,[]);
          RDprint1.ImpVal(linha,76,',#,##0.00',(Qrel.FieldByName('VALOR').AsFloat),[]);
          RDprint1.ImpVal(linha,88,',#,##0.00',IQuery.FieldByName('VR_CUSTO').AsFloat,[]);
          RDprint1.ImpVal(linha,100,',#,##0.00',markup,[]);
          RDprint1.ImpVal(linha,119,',#,##0.00',vr_lucro,[]);



          Total_IPI := Total_IPI + Qrel.FieldByName('VR_IPI').AsFloat;
          Total_Frete := Total_Frete + Qrel.FieldByName('VR_FRETE').AsFloat;
          Total_Subtotal := Total_Subtotal + Qrel.FieldByName('VALOR').AsFloat;
          Total_Desconto := Total_Desconto + IQuery.FieldByName('VR_CUSTO').AsFloat;
          Total_Acrescimo := Total_Acrescimo + Qrel.FieldByName('VR_ACRESCIMO').AsFloat;
          Total_Geral := Total_Geral + vr_lucro;

          if linha > 65 then
          begin
            RDprint1.novapagina;
            Pagina := Pagina + 1;
          end;

           {
           if Ordem.Text <> 'Cliente, Valor' then
           begin
               if Qrel.FieldByName('PARCELA_ID').AsString = 'F' then
               begin
                   Total_qtd := Total_qtd + 1;
                   Total_vr  := Total_vr + Qrel.FieldByName('VALOR').AsFloat;
               end;
           end;
            }

          Inc(linha);
          Qrel.next;
        end;

         //rodape com valores totais
        RDprint1.LinhaH(linha,64,132,0,false);
        Inc(linha);
       // RDprint1.ImpVal(linha,64,',#,##0.00',Total_IPI,[negrito]);
        RDprint1.ImpVal(linha,76,',#,##0.00',Total_Subtotal,[negrito]);
        RDprint1.ImpVal(linha,88,',#,##0.00',Total_Desconto,[negrito]);
        //RDprint1.ImpVal(linha,100,',#,##0.00',Total_Desconto,[negrito]);
       // RDprint1.ImpVal(linha,111,',#,##0.00',Total_Acrescimo,[negrito]);
        RDprint1.ImpVal(linha,119,',#,##0.00',Total_Geral,[negrito]);

        Inc(Linha);
        Inc(Linha);

       {
        if Chk_Cliente_Zero.Checked then
          RDprint1.ImpF(linha, 01, 'Total de Vendas Multi Pagamento (Sem vínculo com cliente):', [negrito])
        else
          RDprint1.ImpF(linha, 01, 'Total de Vendas Multi Pagamento:', [negrito]);

        if Ordem.Text <> 'Cliente, Valor' then
        begin
            Inc(linha);
            RDprint1.Imp(linha, 05, 'Quantidade: ' + FormatFloat('###,##0.00', Total_qtd));
            Inc(linha);
            RDprint1.Imp(linha, 05, '     Valor: ' + FormatFloat('###,##0.00', Total_vr));
        end;
         }

        Application.ProcessMessages;
        RDprint1.TamanhoQteLinhas:= 66;
        RDprint1.Fechar;

      end;

   end;


  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;

procedure TFrmVendas_Mensal_RDP.btnFornecedorClick(Sender: TObject);
begin
try
    Fornecedor.Value := GetConsulta('FORNECEDORES', 0, 0, StrToInt(Fornecedor.Text));
  except
    Fornecedor.Value := GetConsulta('FORNECEDORES', 0, 0, 0);
  end;
end;

procedure TFrmVendas_Mensal_RDP.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmVendas_Mensal_RDP.btnVendedorClick(Sender: TObject);
begin
 try
    Vendedor.Value := GetConsulta('PESSOAL', 0, 0, StrToInt(Vendedor.Text));
  except
    Vendedor.Value := GetConsulta('PESSOAL', 0, 0, 0);
  end;

end;

procedure TFrmVendas_Mensal_RDP.ClienteChange(Sender: TObject);
begin

  SearchCliente;

end;

procedure TFrmVendas_Mensal_RDP.ClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = Cliente) then
    btnClienteClick(Self);

  if (Key = Vk_F7) and (Sender = Fornecedor) then
    btnFornecedorClick(Self);

  if (Key = Vk_F7) and (Sender = Caixa_Banco) then
    btnCaixa_BancoClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmVendas_Mensal_RDP.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRMemo2.Lines.Clear;

  QItens.Sql.Clear;
  QItens.Sql.Add('SELECT * FROM TRANSITENS');
  QItens.Sql.Add('WHERE');
  QItens.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

  QItens.ParamByName('TRANSACAO_ID').AsInteger := QRel.FieldByName('TRANSACAO_ID').AsInteger;

  QItens.Prepare;
  QItens.Open;

  if QRel.FieldByName('COND_PAGTO').AsString = 'A PRAZO' then
  begin
    QParcelas.Sql.Clear;
    QParcelas.Sql.Add('SELECT * FROM TRANSPARCELAS');
    QParcelas.Sql.Add('WHERE');
    QParcelas.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
    QParcelas.Sql.Add('AND (TIPO_TRANSACAO = :TIPO_TRANSACAO)');

    QParcelas.ParamByName('TRANSACAO_ID').AsInteger  := QRel.FieldByName('TRANSACAO_ID').AsInteger;
    QParcelas.ParamByName('TIPO_TRANSACAO').AsString := 'T';

    QParcelas.Prepare;
    QParcelas.Open;

    if not QParcelas.IsEmpty then
    begin
      QRMemo2.Lines.Clear;
      QRMemo2.Lines.Add('Parcelamento');
      QRMemo2.Lines.Add('============');

      QParcelas.First;
      while not QParcelas.Eof do
      begin
        if QParcelas.FieldByName('VALOR').AsFloat = 0 then
        begin
          QVencimento.Sql.Clear;
          QVencimento.Sql.Add('SELECT * FROM TRANSACOES');
          QVencimento.Sql.Add('WHERE');
          QVencimento.Sql.Add('(SAIDA_ID = :SAIDA_ID)');

          QVencimento.ParamByName('SAIDA_ID').AsInteger := QRel.FieldByName('TRANSACAO_ID').AsInteger;

          QVencimento.Prepare;
          QVencimento.Open;

          if QVencimento.FieldByName('DT_ENT_SAI').AsDateTime > QParcelas.FieldByName('DT_VENCIMENTO').AsDateTime then
            QRMemo2.Lines.Add('Venc.: ' + QParcelas.FieldByName('DT_VENCIMENTO').AsString + ' - ' +
                              FormatFloat('#,##0.00', QVencimento.FieldByName('VALOR_PARCELA').AsFloat) + ' Pagto.: ' +
                              QVencimento.FieldByName('DT_ENT_SAI').AsString + ' - ' + FormatFloat('#,##0.00', QVencimento.FieldByName('VALOR').AsFloat) +
                              ' Atr.: ' + FloatToStr((QVencimento.FieldByName('DT_ENT_SAI').AsDateTime - QParcelas.FieldByName('DT_VENCIMENTO').AsDateTime)) + ' dias')
          else
            QRMemo2.Lines.Add('Venc.: ' + QParcelas.FieldByName('DT_VENCIMENTO').AsString + ' - ' +
                              FormatFloat('#,##0.00', QVencimento.FieldByName('VALOR_PARCELA').AsFloat) + ' Pagto.: ' +
                              QVencimento.FieldByName('DT_ENT_SAI').AsString + ' - ' + FormatFloat('#,##0.00', QVencimento.FieldByName('VALOR').AsFloat));
        end
        else
        begin
          if QParcelas.FieldByName('DT_VENCIMENTO').AsDateTime <= FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime then
            QRMemo2.Lines.Add('Venc.: ' + QParcelas.FieldByName('DT_VENCIMENTO').AsString + ' - ' +
                              FormatFloat('#,##0.00', QParcelas.FieldByName('VALOR').AsFloat) +
                              ' Atr.: ' + FloatToStr((FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime - QParcelas.FieldByName('DT_VENCIMENTO').AsDateTime)) + ' dias')
          else
            QRMemo2.Lines.Add('Venc.: ' + QParcelas.FieldByName('DT_VENCIMENTO').AsString + ' - ' + FormatFloat('#,##0.00', QParcelas.FieldByName('VALOR').AsFloat));
        end;

        Application.ProcessMessages;

        QParcelas.Next;
      end;
    end;
  end;
end;

procedure TFrmVendas_Mensal_RDP.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmVendas_Mensal_RDP.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    //Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmVendas_Mensal_RDP.ExAllBtnClick(Sender: TObject);
var
I: Integer;
begin

  QCfop.Close;

  for I := 0 to DstList.Items.Count - 1 do
    SrcList.Items.AddObject(DstList.Items[I], DstList.Items.Objects[I]);

  DstList.Items.Clear;
  SetItem(DstList, 0);

end;

procedure TFrmVendas_Mensal_RDP.ExcludeBtnClick(Sender: TObject);
var
Index: Integer;
begin
    QCfop.Close;
    Index := GetFirstSelection(DstList);
    MoveSelected(DstList, SrcList.Items);
    SetItem(DstList, Index);
end;

procedure TFrmVendas_Mensal_RDP.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmVendas_Mensal_RDP.FormCreate(Sender: TObject);
begin
  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);

  QCfop.Prepare;
  QCfop.Open;

  QCfop.First;

  while not QCfop.Eof do
  begin
     SrcList.Items.Add(QCfop.FieldByName('COD_CFOP').AsString + ' - ' + Copy(QCfop.FieldByName('DESC_CFOP').AsString, 1,35));

     QCfop.Next;
  end;
end;

procedure TFrmVendas_Mensal_RDP.IncAllBtnClick(Sender: TObject);
var
I: Integer;
begin
    QCfop.Close;
    for I := 0 to SrcList.Items.Count - 1 do
      DstList.Items.AddObject(SrcList.Items[I], SrcList.Items.Objects[I]);

    SrcList.Items.Clear;
    SetItem(SrcList, 0);

end;

procedure TFrmVendas_Mensal_RDP.IncludeBtnClick(Sender: TObject);
var
Index: Integer;
begin
    QCfop.Close;
    Index := GetFirstSelection(SrcList);
    MoveSelected(SrcList, DstList.Items);
    SetItem(SrcList, Index);

end;



procedure TFrmVendas_Mensal_RDP.RDprint1NewPage(Sender: TObject; Pagina: Integer);
begin
    IF  Vendedor.Value > 0 then
    Begin
    QVendedor.Close;
    QVendedor.ParamByName('FUNCIONARIO_ID').AsInteger := StrToInt(VENDEDOR.Text);
    QVendedor.Prepare;
    QVendedor.Open;
    End;

   if Tipo_Rel.Text = 'Analítico' then
      Begin
      RDprint1.Imp(01, 01, FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString);
      RDprint1.ImpDir(01, (length(FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString)), 100, 'Sistema de Automação de empresas Eficaz', []);
      RDprint1.Imp(02, 01, 'Data/Hora: ' + DateToStr(date) + ' - ' + TimeToStr(now));
      RDprint1.impDir(02, 80, 100, 'Página: ' + IntToStr(Pagina), []);
      RDprint1.impC(03, 48, '*** VENDA MENSAL: '+Tipo.Text+' ***',[negrito]);
      RDprint1.imp(04, 01, 'Período:'+ datetoStr(dtmen.date) + ' à ' + datetoStr(dtmai.date));

       IF  Vendedor.Value > 0 then
       RDprint1.Imp(04, 50, 'Vendedor:' + QVendedor.FieldByName('NOME').AsString)
       Else
       RDprint1.Imp(04, 50, 'Cliente');

      RDprint1.LinhaH(05,01,100,0,false);
      RDprint1.Imp(06, 03, 'Id');
      RDprint1.Imp(06, 10, 'Data');
      RDprint1.Imp(06, 28, 'Histórico');
      RDprint1.Imp(06, 70, 'Cliente');
      linha := 07;
      End;

  if Tipo_Rel.Text = 'Sintético' then
      Begin
      RDprint1.Imp(01, 01, FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString);
      RDprint1.ImpDir(01, (length(FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString)), 132, 'Sistema de Automação de empresas Eficaz', []);
      RDprint1.Imp(02, 01, 'Data/Hora: ' + DateToStr(date) + ' - ' + TimeToStr(now));
      RDprint1.impDir(02, 80, 132, 'Página: ' + IntToStr(Pagina), []);
      RDprint1.impC(03, 56, '*** VENDA MENSAL: '+Tipo.Text+' ***',[negrito]);
      RDprint1.imp(04, 01, 'Período:'+ datetoStr(dtmen.date) + ' à ' + datetoStr(dtmai.date));

       IF  Vendedor.Value > 0 then
       RDprint1.Imp(04, 50, 'Vendedor:' + QVendedor.FieldByName('NOME').AsString)
       Else
       RDprint1.Imp(04, 50, 'Cliente');



      RDprint1.LinhaH(05,01,132,0,false);
      RDprint1.Imp(06, 01, 'Data');
      RDprint1.Imp(06, 10, 'Cliente');
      RDprint1.Imp(06, 38, 'Nº Nota');
      RDprint1.Imp(06, 52, 'Série');
      RDprint1.Imp(06, 59, 'Modelo');
      RDprint1.Imp(06, 69, 'Vr IPI');
      RDprint1.Imp(06, 78, 'Vr. Frete');
      RDprint1.Imp(06, 91, 'Sub-Total');
      RDprint1.Imp(06, 103, 'Desconto');
      RDprint1.Imp(06, 113, 'Acréscimo');
      RDprint1.Imp(06, 128, 'Total');
      RDprint1.LinhaH(07,01,132,0,false);
      linha := 08;
      End;

    if Tipo_Rel.Text = 'Sintético(Formas de Pagamento)' then
      Begin
      RDprint1.Imp(01, 01, FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString);
      RDprint1.ImpDir(01, (length(FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString)), 132, 'Sistema de Automação de empresas Eficaz', []);
      RDprint1.Imp(02, 01, 'Data/Hora: ' + DateToStr(date) + ' - ' + TimeToStr(now));
      RDprint1.impDir(02, 80, 132, 'Página: ' + IntToStr(Pagina), []);
      RDprint1.impC(03, 56, '*** VENDA MENSAL(Formas de Pagamento): '+Tipo.Text+' ***',[negrito]);
      RDprint1.imp(04, 01, 'Período:'+ datetoStr(dtmen.date) + ' à ' + datetoStr(dtmai.date));
      //RDprint1.Imp(04, 50, 'Cliente');
      RDprint1.LinhaH(05,01,132,0,false);
      RDprint1.Imp(06, 01, 'Data');
      RDprint1.Imp(06, 10, 'Cliente');
      RDprint1.Imp(06, 38, 'Nº Nota');
      RDprint1.Imp(06, 48, 'Cond. Pagto.');
      RDprint1.Imp(06, 62, 'Modelo');
     // RDprint1.Imp(06, 69, 'Vr IPI');
     // RDprint1.Imp(06, 78, 'Vr. Frete');
     // RDprint1.Imp(06, 91, 'Sub-Total');
      RDprint1.Imp(06, 80, 'Valor');
      RDprint1.Imp(06, 89, 'Valor Custo');
      RDprint1.Imp(06, 103, '% Markup');
      RDprint1.Imp(06, 119, 'Valor Lucro');
      RDprint1.LinhaH(07,01,132,0,false);
      linha := 08;
      End;

end;



end.
