unit UNotas_Canceladas_Nfce;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBCustomDataSet, IBUpdateSQL, DB, IBQuery, StdCtrls, Buttons,
  ExtCtrls, Tabs, ComCtrls, Grids, DBGrids, Mask, rxToolEdit, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmNotas_Canceladas_Nfce = class(TForm)
    Panel1: TPanel;
    btnRetorna: TBitBtn;
    DataNotas: TDataSource;
    btnEstorna: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    Dtmen: TDateEdit;
    StatusBar1: TStatusBar;
    Dtmai: TDateEdit;
    btnSelecionar: TSpeedButton;
    Notas: TDBGrid;
    chk_Inutilizada: TCheckBox;
    QNotas: TFDQuery;
    QArq: TFDQuery;
    QRel: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRetornaClick(Sender: TObject);
    procedure btnEstornaClick(Sender: TObject);
    procedure NotasKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DtmaiKeyPress(Sender: TObject; var Key: Char);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure NotasKeyPress(Sender: TObject; var Key: Char);
    procedure NotasDblClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure DtmenEnter(Sender: TObject);
    procedure QNotasAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmNotas_Canceladas_Nfce: TFrmNotas_Canceladas_Nfce;

implementation

uses
  UData, UPrincipal, UTrans_Venda_Estoque, UTrans_Compra_Estoque, UTrans_Devolucao_Compra,
  UTrans_Transferencia_Estoque;

{$R *.dfm}

procedure TFrmNotas_Canceladas_Nfce.btnEstornaClick(Sender: TObject);
var
Id_Trans: Integer;
Num_Doc: String;
Vl_Trans: Real;
Gerencial: Boolean;
begin
  if QNotas.IsEmpty then
    exit;

    QRel.SQL.Clear;
    QRel.SQL.Add('SELECT NEXTVAL(:GEN_TRANSACOES) ID');
    QRel.ParamByName('GEN_TRANSACOES').AsString :=  'GEN_TRANSACOES';

    QRel.Prepare;
    QRel.Open;

    Id_Trans := QRel.FieldByName('ID').AsInteger;


  QRel.Sql.Clear;
  QRel.Sql.Add('SELECT * FROM TRANSACOES');
  QRel.Sql.Add('WHERE');
  QRel.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

  QRel.ParamByName('TRANSACAO_ID').AsInteger := QNotas.FieldByName('TRANSACAO_ID').AsInteger;

  QRel.Prepare;
  QRel.Open;

  if QRel.IsEmpty then
  begin
    Application.MessageBox('Transação não localizada no Banco de Dados', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  Vl_Trans := QRel.FieldByName('VALOR').AsFloat;
  Num_Doc  := QRel.FieldByName('NUM_DOC').AsString;

  QRel.Sql.Clear;
  QRel.Sql.Add('SELECT * FROM TRANSACOES');
  QRel.Sql.Add('WHERE');
  QRel.Sql.Add('(HISTORICO = :HISTORICO)');
  QRel.Sql.Add('AND (CONDUTA = :CONDUTA)');
  QRel.Sql.Add('AND (DEPTO = :DEPTO)');

  QRel.ParamByName('HISTORICO').AsString := 'CANCELAMENTO NFe ' + StrZero(Num_Doc, 6, 0);
  QRel.ParamByName('CONDUTA').AsString   := '18';
  QRel.ParamByName('DEPTO').AsString     := '07';

  QRel.Prepare;
  QRel.Open;

  if not QRel.IsEmpty then
  begin
    Application.MessageBox('Transação já estornada', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  QArq.Sql.Clear;
  QArq.Sql.Add('INSERT INTO TRANSACOES( ' +
               'TRANSACAO_ID, DT_TRANS,   DT_MOVIMENTO, CONDUTA, ' +
               'DEPTO,        EMPRESA_ID, CONTA_ID,     C_CUSTO_ID, ' +
               'VALOR,        TPCTB,      AUTORIZ_ID,   HISTORICO, ' +
               'CONTAAUX_ID) VALUES(' +
               ':TRANSACAO_ID, :DT_TRANS,   :DT_MOVIMENTO, :CONDUTA, :DEPTO,      :EMPRESA_ID, ' +
               ':CONTA_ID,     :C_CUSTO_ID, :VALOR,        :TPCTB,   :AUTORIZ_ID, :HISTORICO, ' +
               ':CONTAAUX_ID)');

  QArq.ParamByName('TRANSACAO_ID').AsInteger  := Id_Trans;
  QArq.ParamByName('DT_TRANS').AsDateTime     := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
  QArq.ParamByName('DT_MOVIMENTO').AsDateTime := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
  QArq.ParamByName('CONDUTA').AsString        := '18';
  QArq.ParamByName('DEPTO').AsString          := '07';
  QArq.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  QArq.ParamByName('CONTA_ID').AsInteger      := FrmPrincipal.Config.FieldByName('CONTA_ESTOQUE').AsInteger;
  QArq.ParamByName('C_CUSTO_ID').AsInteger    := 1;
  QArq.ParamByName('VALOR').AsFloat           := Vl_Trans;
  QArq.ParamByName('TPCTB').AsString          := FrmData.QAcesso.FieldByName('TPCTB').AsString;
  QArq.ParamByName('AUTORIZ_ID').AsInteger    := FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger;
  QArq.ParamByName('HISTORICO').AsString      := 'CANCELAMENTO NFe ' + StrZero(Num_Doc, 6, 0);
  QArq.ParamByName('CONTAAUX_ID').AsInteger   := FrmPrincipal.Config.FieldByName('CONTA_CONSUMO').AsInteger;

  QArq.Prepare;
  QArq.ExecSql;



  Gerencial := True;

  try
    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT TPCTB');
    QRel.Sql.Add('FROM TRANSITENS');

    QRel.Prepare;
    QRel.Open;
  except
    Gerencial := False;
  end;

  if not Gerencial then  // não é Comercial Cataluna
  begin
    QRel.Sql.Clear;
    QRel.Sql.Add('INSERT INTO TRANSITENS(TRANSACAO_ID, PRODUTO_ID, TP_PROD_SERV, DESCRICAO, TRIBUTO_ID, CFOP, QUANTIDADE, VR_UNITARIO, VR_DESCONTO, VR_TOTAL)');
    QRel.Sql.Add('SELECT :ID_TRANS, PRODUTO_ID, TP_PROD_SERV, DESCRICAO, TRIBUTO_ID, :CFOP, QUANTIDADE, VR_UNITARIO, VR_DESCONTO, VR_TOTAL');
    QRel.Sql.Add('FROM TRANSITENS');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

    QRel.ParamByName('ID_TRANS').AsInteger     := Id_Trans;
    QRel.ParamByName('TRANSACAO_ID').AsInteger := QNotas.FieldByName('TRANSACAO_ID').AsInteger;
    QRel.ParamByName('CFOP').AsString          := '5556';

    QRel.Prepare;
    QRel.ExecSql;


  end
  else
  begin
    QRel.Sql.Clear;
    QRel.Sql.Add('INSERT INTO TRANSITENS(TRANSACAO_ID, PRODUTO_ID, TP_PROD_SERV, DESCRICAO, TRIBUTO_ID, CFOP ,QUANTIDADE, VR_UNITARIO, VR_DESCONTO, VR_TOTAL, TPCTB)');
    QRel.Sql.Add('SELECT :ID_TRANS, PRODUTO_ID, TP_PROD_SERV, DESCRICAO, TRIBUTO_ID, :CFOP , QUANTIDADE, VR_UNITARIO, VR_DESCONTO, VR_TOTAL, TPCTB');
    QRel.Sql.Add('FROM TRANSITENS');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

    QRel.ParamByName('ID_TRANS').AsInteger     := Id_Trans;
    QRel.ParamByName('TRANSACAO_ID').AsInteger := QNotas.FieldByName('TRANSACAO_ID').AsInteger;
    QRel.ParamByName('CFOP').AsString          := '5556';

    QRel.Prepare;
    QRel.ExecSql;


  end;
end;

procedure TFrmNotas_Canceladas_Nfce.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmNotas_Canceladas_Nfce.btnSelecionarClick(Sender: TObject);
begin
 if not chk_Inutilizada.Checked then
 Begin
  QNotas.Sql.Clear;
  QNotas.SQL.Add('SELECT NOTAS_CANCELADAS_NFCE.TRANSACAO_ID, NO_DOC_FISCAL,DT_SAIDA,HR_SAIDA, CLIENTES.NOME, TRANSACOES.CFOP, TRANSACOES.VALOR,NOTAS_CANCELADAS_NFCE.CHAVE_NFCE,PROTOCOLO,RECIBO,SINTEGRA, NOTAS_CANCELADAS_NFCE.EMPRESA_ID FROM NOTAS_CANCELADAS_NFCE ');
  QNotas.SQL.Add('INNER JOIN TRANSACOES ON TRANSACOES.TRANSACAO_ID = NOTAS_CANCELADAS_NFCE.TRANSACAO_ID');
  QNotas.SQL.Add('LEFT JOIN CLIENTES ON CLIENTES.CLIENTE_ID = TRANSACOES.CLIENTE_ID');
  QNotas.Sql.Add('WHERE ');
  QNotas.Sql.Add('(DT_SAIDA BETWEEN :DT_INICIAL AND :DT_FINAL)');
  QNotas.Sql.Add('AND (NOTAS_CANCELADAS_NFCE.EMPRESA_ID = :EMPRESA_ID)');

  QNotas.Sql.Add('ORDER BY NO_DOC_FISCAL');


  QNotas.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
  QNotas.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
  QNotas.ParamByName('EMPRESA_ID').AsInteger  := FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger;

  QNotas.Prepare;
  QNotas.Open;
 End
 else
 begin
  QNotas.Sql.Clear;
  QNotas.Sql.Add('SELECT TRANSACAO_ID, NO_DOC_FISCAL, DT_SAIDA,HR_SAIDA,CHAVE_NFCE,PROTOCOLO,RECIBO,SINTEGRA,EMPRESA_ID, 0 VALOR ');
  QNotas.SQL.Add('FROM NOTAS_CANCELADAS_NFCE');

  QNotas.Sql.Add('WHERE');
  QNotas.Sql.Add(' (DT_SAIDA BETWEEN :DT_INICIAL AND :DT_FINAL)');
  QNotas.Sql.Add('AND RECIBO = :RECIBO');
  QNotas.Sql.Add('AND (EMPRESA_ID = :EMPRESA_ID)');
  QNotas.Sql.Add('ORDER BY NO_DOC_FISCAL');

  QNotas.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
  QNotas.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
  QNotas.ParamByName('EMPRESA_ID').AsInteger  := FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger;
  QNotas.ParamByName('RECIBO').AsString       := 'INUTILIZADA';

  QNotas.Prepare;
  QNotas.Open;
 end;


  Notas.SetFocus;

end;

procedure TFrmNotas_Canceladas_Nfce.DtmaiKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    btnSelecionarClick(Sender);
end;

procedure TFrmNotas_Canceladas_Nfce.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmNotas_Canceladas_Nfce.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    //Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmNotas_Canceladas_Nfce.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmNotas_Canceladas_Nfce.FormCreate(Sender: TObject);
begin
  Dtmen.Date := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
  Dtmai.Date := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;

  Notas.Columns[0].Width := 64;
  Notas.Columns[1].Width := 64;
  Notas.Columns[2].Width := 50;
  Notas.Columns[3].Width := 67;
  Notas.Columns[4].Width := 67;
  Notas.Columns[5].Width := 350;
  Notas.Columns[6].Width := 60;
  Notas.Columns[7].Width := 272;
  Notas.Columns[8].Width := 100;
  Notas.Columns[9].Width := 100;
  Notas.Columns[10].Width := 40;

  QNotas.Sql.Clear;

  QNotas.SQL.Add('SELECT NOTAS_CANCELADAS_NFCE.TRANSACAO_ID, NO_DOC_FISCAL,DT_SAIDA,HR_SAIDA, CLIENTES.NOME, TRANSACOES.CFOP, TRANSACOES.VALOR,NOTAS_CANCELADAS_NFCE.CHAVE_NFCE,PROTOCOLO,RECIBO,SINTEGRA, NOTAS_CANCELADAS_NFCE.EMPRESA_ID FROM NOTAS_CANCELADAS_NFCE ');
  QNotas.SQL.Add('INNER JOIN TRANSACOES ON TRANSACOES.TRANSACAO_ID = NOTAS_CANCELADAS_NFCE.TRANSACAO_ID');
  QNotas.SQL.Add('LEFT JOIN CLIENTES ON CLIENTES.CLIENTE_ID = TRANSACOES.CLIENTE_ID');
  QNotas.Sql.Add('WHERE');
  QNotas.Sql.Add('(DT_SAIDA = :DT_SAIDA)');
  QNotas.Sql.Add('AND (NOTAS_CANCELADAS_NFCE.EMPRESA_ID = :EMPRESA_ID)');

  QNotas.Sql.Add('ORDER BY NO_DOC_FISCAL');

  QNotas.ParamByName('DT_SAIDA').AsDateTime  := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
  QNotas.ParamByName('EMPRESA_ID').AsInteger := FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger;

  QNotas.Prepare;
  QNotas.Open;
end;

procedure TFrmNotas_Canceladas_Nfce.NotasDblClick(Sender: TObject);
begin
  QRel.Sql.Clear;
  QRel.Sql.Add('SELECT * FROM TRANSACOES');
  QRel.Sql.Add('WHERE');
  QRel.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

  QRel.ParamByName('TRANSACAO_ID').AsInteger := QNotas.FieldByName('TRANSACAO_ID').AsInteger;

  QRel.Prepare;
  QRel.Open;

  if not QRel.IsEmpty then
  begin
    if (QRel.FieldByName('CONDUTA').AsString = '01') and (QRel.FieldByName('DEPTO').AsString = '07') then
      Trans_Venda_Estoque(QNotas.FieldByName('TRANSACAO_ID').AsInteger);

    if (QRel.FieldByName('CONDUTA').AsString = '02') and (QRel.FieldByName('DEPTO').AsString = '07') then
      Trans_Compra_Estoque(QNotas.FieldByName('TRANSACAO_ID').AsInteger);

    if (QRel.FieldByName('CONDUTA').AsString = '01') and (QRel.FieldByName('DEPTO').AsString = '10') then
      Trans_Devolucao_Compra(QNotas.FieldByName('TRANSACAO_ID').AsInteger);

    if (QRel.FieldByName('CONDUTA').AsString = '20') and (QRel.FieldByName('DEPTO').AsString = '07') then
      Trans_Transferencia_Estoque(QNotas.FieldByName('TRANSACAO_ID').AsInteger);
  end;
end;

procedure TFrmNotas_Canceladas_Nfce.NotasKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F3) and ((QNotas.FieldByName('SINTEGRA').AsString = 'S') or (QNotas.FieldByName('SINTEGRA').AsString = '')) then
  begin

    QRel.Sql.Clear;
    QRel.Sql.Add('UPDATE NOTAS_CANCELADAS SET SINTEGRA = :STATUS');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
    QRel.Sql.Add('AND (NO_DOC_FISCAL = :NO_DOC_FISCAL)');

    QRel.ParamByName('STATUS').AsString         := 'N';
    QRel.ParamByName('TRANSACAO_ID').AsInteger  := QNotas.FieldByName('TRANSACAO_ID').AsInteger;
    QRel.ParamByName('NO_DOC_FISCAL').AsInteger := QNotas.FieldByName('NO_DOC_FISCAL').AsInteger;

    QRel.Prepare;
    QRel.ExecSql;



    QNotas.Close;
    QNotas.Prepare;
    QNotas.Open;
  end;

  if (Key = Vk_F4) and (QNotas.FieldByName('SINTEGRA').AsString = 'N') then
  begin
    

    QRel.Sql.Clear;
    QRel.Sql.Add('UPDATE NOTAS_CANCELADAS SET SINTEGRA = :STATUS');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
    QRel.Sql.Add('AND (NO_DOC_FISCAL = :NO_DOC_FISCAL)');

    QRel.ParamByName('STATUS').AsString         := 'S';
    QRel.ParamByName('TRANSACAO_ID').AsInteger  := QNotas.FieldByName('TRANSACAO_ID').AsInteger;
    QRel.ParamByName('NO_DOC_FISCAL').AsInteger := QNotas.FieldByName('NO_DOC_FISCAL').AsInteger;

    QRel.Prepare;
    QRel.ExecSql;



    QNotas.Close;
    QNotas.Prepare;
    QNotas.Open;
  end;
end;

procedure TFrmNotas_Canceladas_Nfce.NotasKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT * FROM TRANSACOES');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

    QRel.ParamByName('TRANSACAO_ID').AsInteger := QNotas.FieldByName('TRANSACAO_ID').AsInteger;

    QRel.Prepare;
    QRel.Open;

    if not QRel.IsEmpty then
    begin
      if (QRel.FieldByName('CONDUTA').AsString = '01') and (QRel.FieldByName('DEPTO').AsString = '07') then
        Trans_Venda_Estoque(QNotas.FieldByName('TRANSACAO_ID').AsInteger);

      if (QRel.FieldByName('CONDUTA').AsString = '02') and (QRel.FieldByName('DEPTO').AsString = '07') then
        Trans_Compra_Estoque(QNotas.FieldByName('TRANSACAO_ID').AsInteger);

      if (QRel.FieldByName('CONDUTA').AsString = '01') and (QRel.FieldByName('DEPTO').AsString = '10') then
        Trans_Devolucao_Compra(QNotas.FieldByName('TRANSACAO_ID').AsInteger);

      if (QRel.FieldByName('CONDUTA').AsString = '20') and (QRel.FieldByName('DEPTO').AsString = '07') then
        Trans_Transferencia_Estoque(QNotas.FieldByName('TRANSACAO_ID').AsInteger);
    end;
  end;
end;

procedure TFrmNotas_Canceladas_Nfce.QNotasAfterOpen(DataSet: TDataSet);
begin
TFloatField(QNotas.FieldByName('VALOR')).DisplayFormat  := '#,##0.00';
end;

end.
