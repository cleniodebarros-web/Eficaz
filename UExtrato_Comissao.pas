unit UExtrato_Comissao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBTables, DB, IBCustomDataSet, IBQuery, Buttons, ExtCtrls,
  rxCurrEdit, Mask, rxToolEdit, QRCtrls, QuickRpt, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmExtrato_Comissao = class(TForm)
    Dtmen: TDateEdit;
    Label1: TLabel;
    Dtmai: TDateEdit;
    Label2: TLabel;
    Vendedor: TCurrencyEdit;
    btnVendedor: TSpeedButton;
    Bevel1: TBevel;
    btnRetorna: TBitBtn;
    DataVendedor: TDataSource;
    btnExecuta: TBitBtn;
    Label3: TLabel;
    Comissao: TCurrencyEdit;
    Label4: TLabel;
    Vendas: TComboBox;
    Extrato_Comissao: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    QRSysData1: TQRSysData;
    Cabec: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape2: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRGroup1: TQRGroup;
    QRDBText3: TQRDBText;
    QRBand1: TQRBand;
    QRShape3: TQRShape;
    QRShape5: TQRShape;
    QRBand2: TQRBand;
    QRShape4: TQRShape;
    QRShape6: TQRShape;
    QRExpr5: TQRExpr;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QExterno: TFDQuery;
    QRel: TFDQuery;
    QVendedor: TFDQuery;
    Relat: TFDMemTable;
    procedure btnVendedorClick(Sender: TObject);
    procedure VendedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnExecutaClick(Sender: TObject);
    procedure DtmenEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnRetornaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmExtrato_Comissao: TFrmExtrato_Comissao;

implementation

uses
  UPrincipal, UData, UConsulta;

{$R *.dfm}

procedure TFrmExtrato_Comissao.btnExecutaClick(Sender: TObject);
var
Vl_Venda, Per_Com, Per_Acr: Double;
Temp_Name: String;
begin
// 203, 327
  try
    with Relat do
    begin

      Temp_Name    := Copy(TimeToStr(time), 1, 2) + Copy(TimeToStr(time), 4, 2) + Copy(TimeToStr(time), 7, 2);


      with FieldDefs do
      begin
        Clear;
        Add('CODIGO', ftAutoInc, 0, False);
        Add('NOME', ftString, 40, False);
        Add('DATA', ftDate, 0, False);
        Add('NUM_DOC', ftString, 9, False);
        Add('CLIENTE', ftString, 40, False);
        Add('VR_VENDA', ftFloat, 0, False);
        Add('PERCENT', ftFloat, 0, False);
        Add('VR_COMISSAO', ftFloat, 0, False);
      end;

      with IndexDefs do
      begin
        Clear;
        Add('', 'CODIGO', [ixPrimary, ixUnique]);
        Add('TEMP', 'NOME;DATA', [ixCaseInsensitive]);
      end;



      IndexName := 'TEMP';
      Open;
    end;

   if Vendas.Text <> 'A Liquidar' then
   Begin
    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT TRANSACOES.*, FUNCIONARIOS.NOME, CLIENTES.NOME CLIENTE');
    QRel.Sql.Add('FROM TRANSACOES');
    QRel.Sql.Add('INNER JOIN FUNCIONARIOS');
    QRel.Sql.Add('ON (FUNCIONARIOS.FUNCIONARIO_ID = TRANSACOES.VENDEDOR_ID)');
    QRel.Sql.Add('LEFT JOIN CLIENTES');
    QRel.Sql.Add('ON (CLIENTES.CLIENTE_ID = TRANSACOES.CLIENTE_ID)');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
    QRel.Sql.Add('AND ((TRANSACOES.CONDUTA = :CD_VDA AND TRANSACOES.DEPTO = :DP_VDA) OR (TRANSACOES.CONDUTA = :CD_DEV AND TRANSACOES.DEPTO = :DP_DEV))');
    QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
    QRel.Sql.Add('AND (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
    QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE)) ');

    if Vendedor.Value > 0 then
    begin
      QRel.Sql.Add('AND (TRANSACOES.VENDEDOR_ID = :VENDEDOR_ID)');
      QRel.ParamByName('VENDEDOR_ID').AsInteger := StrToInt(Vendedor.Text);
    end
    else
      QRel.Sql.Add('AND (TRANSACOES.VENDEDOR_ID > 0) ');

    QRel.Sql.Add('ORDER BY FUNCIONARIOS.NOME, TRANSACOES.DT_TRANS');

    QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    QRel.ParamByName('CD_VDA').AsString       := '01';
    QRel.ParamByName('DP_VDA').AsString       := '07';
    QRel.ParamByName('CD_DEV').AsString       := '02';
    QRel.ParamByName('DP_DEV').AsString       := '10';
    QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;

    QRel.Prepare;
    QRel.Open;

    QRel.First;
    while not QRel.Eof do
    begin
      if Comissao.Value = 0 then
        Per_Com := QRel.FieldByName('COMISSAO').AsFloat
      else
        Per_Com := Comissao.Value;

      Vl_Venda := 0;

      if QRel.FieldByName('CONDUTA').AsString = '01' then
        Vl_Venda := QRel.FieldByName('VALOR').AsFloat - QRel.FieldByName('VR_ACRESCIMO').AsFloat;

      if QRel.FieldByName('CONDUTA').AsString = '02' then
        Vl_Venda := (QRel.FieldByName('VALOR').AsFloat * -1);

      if QRel.FieldByName('COND_PAGTO').AsString = 'A PRAZO' then
      begin

        if Vendas.Text = 'Liquidadas' then
        begin

          Vl_venda := 0;

          QExterno.Sql.Clear;
          QExterno.Sql.Add('SELECT * FROM TRANSPARCELAS');
          QExterno.Sql.Add('WHERE');
          QExterno.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
          QExterno.Sql.Add('AND (BANCO_ID > 0)');
          QExterno.Sql.Add('AND (TIPO_TRANSACAO = :TIPO_TRANSACAO)');

          QExterno.ParamByName('TRANSACAO_ID').AsInteger  := QRel.FieldByName('TRANSACAO_ID').AsInteger;
          QExterno.ParamByName('TIPO_TRANSACAO').AsString := 'T';

          QExterno.Prepare;
          QExterno.Open;

          while not QExterno.Eof do
          Begin

          if QRel.FieldByName('VR_ACRESCIMO').AsFloat > 0 then
            Per_Acr := ((QRel.FieldByName('VR_ACRESCIMO').AsFloat * 100) / QRel.FieldByName('VALOR').AsFloat)
          else
            Per_Acr := 0;

          if Per_Acr > 0 then
            Vl_Venda := (QExterno.FieldByName('VALOR').AsFloat - ((QExterno.FieldByName('VALOR').AsFloat * Per_Acr) / 100))
          else

            Vl_Venda :=   QExterno.FieldByName('VALOR').AsFloat + Vl_Venda;

          QExterno.Next;
          End;

          if Comissao.Value = 0 then
            Per_Com := QExterno.FieldByName('COMISSAO').AsFloat
          else
            Per_Com := Comissao.Value;
        end
        else
          Vl_Venda := QRel.FieldByName('VALOR').AsFloat;
      end;

      if (Vl_Venda * Per_Com) <> 0  then
      begin
        Relat.Append;
        Relat.FieldByName('NOME').AsString       := QRel.FieldByName('NOME').AsString;
        Relat.FieldByName('DATA').AsString       := QRel.FieldByName('DT_TRANS').AsString;
        Relat.FieldByName('NUM_DOC').AsString    := QRel.FieldByName('NUM_DOC').AsString;
        Relat.FieldByName('CLIENTE').AsString    := QRel.FieldByName('CLIENTE').AsString;
        Relat.FieldByName('VR_VENDA').AsFloat    := Vl_Venda;
        Relat.FieldByName('PERCENT').AsFloat     := Per_Com;
        Relat.FieldByName('VR_COMISSAO').AsFloat := ((Relat.FieldByName('VR_VENDA').AsFloat * Relat.FieldByName('PERCENT').AsFloat) / 100);
        Relat.Post;
      end;

      Application.ProcessMessages;
      QRel.Next;
    end;
    QRLabel3.Caption := '*** EXTRATO DE COMISSÃO DE VENDEDOR EFETUADAS ***'
   End;


    if (Vendas.Text = 'Liquidadas')  then
    begin
      QRel.Sql.Clear;
      QRel.Sql.Add('SELECT * FROM TRANSACOES');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (CONDUTA = :CONDUTA)');
      QRel.Sql.Add('AND (TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE)) ');
      QRel.Sql.Add('ORDER BY DT_TRANS');

      QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
      QRel.ParamByName('CONDUTA').AsString      := '07';
      QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
      QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
      QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;

      QRel.Prepare;
      QRel.Open;

      QRel.First;
      while not QRel.Eof do
      begin
        QExterno.Sql.Clear;
        QExterno.Sql.Add('SELECT TRANSACOES.*, FUNCIONARIOS.NOME, CLIENTES.NOME CLIENTE');
        QExterno.Sql.Add('FROM TRANSPARCELAS');
        QExterno.Sql.Add('INNER JOIN TRANSACOES');
        QExterno.Sql.Add('ON (TRANSACOES.TRANSACAO_ID = TRANSPARCELAS.TRANSACAO_ID)');
        QExterno.Sql.Add('INNER JOIN FUNCIONARIOS');
        QExterno.Sql.Add('ON (FUNCIONARIOS.FUNCIONARIO_ID = TRANSACOES.VENDEDOR_ID)');
        QExterno.Sql.Add('INNER JOIN CLIENTES');
        QExterno.Sql.Add('ON (CLIENTES.CLIENTE_ID = TRANSACOES.CLIENTE_ID)');
        QExterno.Sql.Add('WHERE');
        QExterno.Sql.Add('(TRANSPARCELAS.TRANSACAO_ID = :SAIDA_ID)');
        QExterno.Sql.Add('AND (TRANSPARCELAS.TIPO_TRANSACAO = :TIPO_TRANSACAO)');
        QExterno.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');

        QExterno.ParamByName('SAIDA_ID').AsInteger      := QRel.FieldByName('SAIDA_ID').AsInteger;
        QExterno.ParamByName('TIPO_TRANSACAO').AsString := 'T';
        QExterno.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;

        if Vendedor.Value > 0 then
        begin
          QExterno.Sql.Add('AND (TRANSACOES.VENDEDOR_ID = :VENDEDOR_ID)');

          QExterno.ParamByName('VENDEDOR_ID').AsInteger := StrToInt(Vendedor.Text);
        end
        else
          QExterno.Sql.Add('AND (TRANSACOES.VENDEDOR_ID > 0)');

        QExterno.Open;
        if QExterno.FieldByName('NOME').AsString <> '' then
        begin
          if QExterno.FieldByName('VR_ACRESCIMO').AsFloat > 0 then
            Per_Acr := ((QExterno.FieldByName('VR_ACRESCIMO').AsFloat * 100) / QExterno.FieldByName('VALOR').AsFloat)
          else
            Per_Acr := 0;

          if Per_Acr > 0 then
            Vl_Venda := (QRel.FieldByName('VALOR').AsFloat - ((QRel.FieldByName('VALOR').AsFloat * Per_Acr) / 100))
          else
            Vl_Venda := QRel.FieldByName('VALOR').AsFloat;

          if Comissao.Value = 0 then
            Per_Com := QExterno.FieldByName('COMISSAO').AsFloat
          else
            Per_Com := Comissao.Value;

          if (Vl_Venda * Per_Com) <> 0 then
          begin
            Relat.Append;
            Relat.FieldByName('NOME').AsString       := QExterno.FieldByName('NOME').AsString;
            Relat.FieldByName('DATA').AsString       := QRel.FieldByName('DT_TRANS').AsString;
            Relat.FieldByName('NUM_DOC').AsString    := QRel.FieldByName('NUM_DOC').AsString;
            Relat.FieldByName('CLIENTE').AsString    := QExterno.FieldByName('CLIENTE').AsString;
            Relat.FieldByName('VR_VENDA').AsFloat    := Vl_Venda;
            Relat.FieldByName('PERCENT').AsFloat     := Per_Com;
            Relat.FieldByName('VR_COMISSAO').AsFloat := ((Relat.FieldByName('VR_VENDA').AsFloat * Relat.FieldByName('PERCENT').AsFloat) / 100);
            Relat.Post;
          end;
        end;

        Application.ProcessMessages;
        QRel.Next;
      end;
      QRLabel3.Caption := '*** EXTRATO DE COMISSÃO DE VENDEDOR LIQUIDADAS ***'
    end;

    if (Vendas.Text = 'A Liquidar')  then
    begin
      QRel.Sql.Clear;
      QRel.Sql.Add('SELECT * FROM TRANSACOES');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('AND (CONDUTA = :CONDUTA) AND (DEPTO = :DEPTO)');
      QRel.Sql.Add('AND (COND_PAGTO = :COND_PAGTO)');
      QRel.Sql.Add('AND (TPCTB <= :TPCTB)');
      QRel.Sql.Add('AND (DT_ENT_SAI BETWEEN :DT_INICIAL AND :DT_FINAL)');
      QRel.Sql.Add('AND (TRANSACOES.TRANSACAO_ID NOT IN (SELECT TRANSACAO_ID FROM NOTAS_CANCELADAS_NFCE)) ');
      QRel.Sql.Add('ORDER BY DT_ENT_SAI');

      QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
      QRel.ParamByName('CONDUTA').AsString      := '01';
      QRel.ParamByName('DEPTO').AsString        := '07';
      QRel.ParamByName('COND_PAGTO').AsString   := 'A PRAZO';
      QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
      QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
      QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;

      QRel.Prepare;
      QRel.Open;

      QRel.First;
      while not QRel.Eof do
      begin
        QExterno.Sql.Clear;
        QExterno.Sql.Add('SELECT TRANSACOES.*, TRANSPARCELAS.VALOR VALOR_REC, FUNCIONARIOS.NOME, CLIENTES.NOME CLIENTE');
        QExterno.Sql.Add('FROM TRANSPARCELAS');
        QExterno.Sql.Add('INNER JOIN TRANSACOES');
        QExterno.Sql.Add('ON (TRANSACOES.TRANSACAO_ID = TRANSPARCELAS.TRANSACAO_ID)');
        QExterno.Sql.Add('INNER JOIN FUNCIONARIOS');
        QExterno.Sql.Add('ON (FUNCIONARIOS.FUNCIONARIO_ID = TRANSACOES.VENDEDOR_ID)');
        QExterno.Sql.Add('INNER JOIN CLIENTES');
        QExterno.Sql.Add('ON (CLIENTES.CLIENTE_ID = TRANSACOES.CLIENTE_ID)');
        QExterno.Sql.Add('WHERE');
        QExterno.Sql.Add('(TRANSPARCELAS.TRANSACAO_ID = :TRANSACAO_ID)');
        QExterno.Sql.Add('AND (TRANSPARCELAS.BANCO_ID = 0)');
        QExterno.Sql.Add('AND (TRANSPARCELAS.VALOR  > 0)');
        QExterno.Sql.Add('AND (TRANSPARCELAS.TIPO_TRANSACAO = :TIPO_TRANSACAO)');
        QExterno.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');

        QExterno.ParamByName('TRANSACAO_ID').AsInteger  := QRel.FieldByName('TRANSACAO_ID').AsInteger;
        QExterno.ParamByName('TIPO_TRANSACAO').AsString := 'T';
        QExterno.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;

        if Vendedor.Value > 0 then
        begin
          QExterno.Sql.Add('AND (TRANSACOES.VENDEDOR_ID = :VENDEDOR_ID)');

          QExterno.ParamByName('VENDEDOR_ID').AsInteger := StrToInt(Vendedor.Text);
        end
        else
          QExterno.Sql.Add('AND (TRANSACOES.VENDEDOR_ID > 0)');

        QExterno.Open;


       while not QExterno.Eof do
       Begin

        if QExterno.FieldByName('NOME').AsString <> '' then
        begin
          {if QExterno.FieldByName('VR_ACRESCIMO').AsFloat > 0 then
            Per_Acr := ((QExterno.FieldByName('VR_ACRESCIMO').AsFloat * 100) / QExterno.FieldByName('VALOR').AsFloat)
          else
            Per_Acr := 0;

          if Per_Acr > 0 then
            Vl_Venda := (QExterno.FieldByName('VALOR_REC').AsFloat - ((QRel.FieldByName('VALOR').AsFloat * Per_Acr) / 100))
          else
            Vl_Venda := QExterno.FieldByName('VALOR_REC').AsFloat;}

          if Comissao.Value = 0 then
            Per_Com := QExterno.FieldByName('COMISSAO').AsFloat
          else
            Per_Com := Comissao.Value;

         Vl_Venda := QExterno.FieldByName('VALOR_REC').AsFloat;

          if (Vl_Venda * Per_Com) <> 0 then
          begin
            Relat.Append;
            Relat.FieldByName('NOME').AsString       := QExterno.FieldByName('NOME').AsString;
            Relat.FieldByName('DATA').AsString       := QRel.FieldByName('DT_ENT_SAI').AsString;
            Relat.FieldByName('NUM_DOC').AsString    := QRel.FieldByName('NUM_DOC').AsString;
            Relat.FieldByName('CLIENTE').AsString    := QExterno.FieldByName('CLIENTE').AsString;
            Relat.FieldByName('VR_VENDA').AsFloat    := Vl_Venda;
            Relat.FieldByName('PERCENT').AsFloat     := Per_Com;
            Relat.FieldByName('VR_COMISSAO').AsFloat := ((Relat.FieldByName('VR_VENDA').AsFloat * Relat.FieldByName('PERCENT').AsFloat) / 100);
            Relat.Post;
          end;
        end;
       QExterno.Next;
       End;

        Application.ProcessMessages;
        QRel.Next;
      end;
      QRLabel3.Caption := '*** EXTRATO DE COMISSÃO DE VENDEDOR A LIQUIDAR ***'
    end;

    QRLabel13.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;

    if Relat.IsEmpty then
      Application.MessageBox('Não há dados para serem impressos', PChar(Msg_Title), mb_IconInformation)
    else
      Extrato_Comissao.PreviewModal;
  finally
    Relat.IndexName := '';
    Relat.Close;

  end;
end;

procedure TFrmExtrato_Comissao.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmExtrato_Comissao.btnVendedorClick(Sender: TObject);
begin
  try
    Vendedor.Value := GetConsulta('PESSOAL', 0, 0, StrToInt(Vendedor.Text));
  except
    Vendedor.Value := GetConsulta('PESSOAL', 0, 0, 0);
  end;
end;

procedure TFrmExtrato_Comissao.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmExtrato_Comissao.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
   // Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmExtrato_Comissao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmExtrato_Comissao.FormCreate(Sender: TObject);
begin
  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);
end;

procedure TFrmExtrato_Comissao.VendedorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = Vendedor) then
    btnVendedorClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

end.
