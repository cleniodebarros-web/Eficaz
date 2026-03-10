unit UParcelas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DB, IBCustomDataSet,
  IBQuery, Math, IBUpdateSQL, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrmParcelas = class(TForm)
    Panel2: TPanel;
    Panel1: TPanel;
    btnRetorna: TBitBtn;
    Parcelas: TDBGrid;
    btnGera: TBitBtn;
    DataTabela: TDataSource;
    btnEdit: TBitBtn;
    btnDuplicatas: TButton;
    QTabela: TFDQuery;
    IQuery: TFDQuery;
    QTransacao: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnGeraClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure ParcelasKeyPress(Sender: TObject; var Key: Char);
    procedure btnDuplicatasClick(Sender: TObject);
    procedure QTabelaAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Gera_Parcelas;
  end;

var
  FrmParcelas: TFrmParcelas;
  Trans: Integer;
  Tipo,Tipo_mov: String;
  Acesso: Boolean;
  Dt_Trans: TDate;
  Vr_Trans: Real;
  Vr_Atual: Real;
  
  procedure Divisao_Parcelas(Transacao: Integer; Tipo_Transacao,Tipo_Movimento: String; Habilitar: Boolean; Dt_Inicial: TDate; Valor  : Real);

implementation

uses
  UData, UParcelamento, UPrincipal, UAltera_Parcela, UBoletos_Duplicatas;

{$R *.dfm}

procedure Divisao_Parcelas(Transacao: Integer; Tipo_Transacao,Tipo_Movimento: String; Habilitar: Boolean; Dt_Inicial: TDate; Valor: Real);
begin
  Trans    := Transacao;
  Tipo     := Tipo_Transacao;
  Acesso   := Habilitar;
  Dt_Trans := Dt_Inicial;
  Vr_Trans := Valor;
  Tipo_mov := Tipo_Movimento;

  Application.CreateForm(TFrmParcelas, FrmParcelas);
  try
    FrmParcelas.ShowModal;
  finally
    FrmParcelas.Release;
  end;
end;

procedure TFrmParcelas.Gera_Parcelas;
var
X, Dia, Mes, Ano: Integer;
Vl: Real;
Dt_Venc,Dt_Transacao: TDate;
Num_Doc: String;
begin
  Application.CreateForm(TFrmParcelamento, FrmParcelamento);
  try
     if Tipo_Mov = '1' Then
     FrmParcelamento.Parcelas.ReadOnly := True;

    if Tipo_Mov = '0' Then
    Begin
      IQuery.Sql.Clear;
      IQuery.Sql.Add('SELECT VR_SEGURO FROM TRANSACOES WHERE TRANSACAO_ID = :TRANSACAO_ID');
      IQuery.ParamByName('TRANSACAO_ID').AsInteger  := Trans;
      IQuery.Prepare;
      IQuery.Open;

      FrmParcelamento.Desc_Boleto.Value := IQuery.FieldByName('VR_SEGURO').AsFloat;
      FrmParcelamento.Desc_Boleto.Enabled := True;
    End
    Else
      FrmParcelamento.Desc_Boleto.Enabled := False;


    if FrmParcelamento.ShowModal = mrOK then
    begin
      Dia     := StrToInt(Copy(DateToStr(Dt_Trans), 1, 2));
      Mes     := StrToInt(Copy(DateToStr(Dt_Trans), 4, 2));
      Ano     := StrToInt(Copy(DateToStr(Dt_Trans), 7, 4));
      Dt_Venc := Dt_Trans;

      IQuery.Sql.Clear;
      IQuery.Sql.Add('DELETE FROM TRANSPARCELAS');
      IQuery.Sql.Add('WHERE');
      IQuery.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
      IQuery.Sql.Add('AND (TIPO_TRANSACAO = :TIPO_TRANSACAO)');

      IQuery.ParamByName('TRANSACAO_ID').AsInteger  := Trans;
      IQuery.ParamByName('TIPO_TRANSACAO').AsString := Tipo;

      IQuery.Prepare;
      IQuery.ExecSql;



      if Tipo = 'T' then
      begin
        IQuery.Sql.Clear;
        IQuery.Sql.Add('SELECT * FROM TRANSACOES');
        IQuery.Sql.Add('WHERE');
        IQuery.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

        IQuery.ParamByName('TRANSACAO_ID').AsInteger := Trans;

        IQuery.Prepare;
        IQuery.Open;

        Num_Doc     := IQuery.FieldByName('NUM_DOC').AsString;
        dt_transacao := IQuery.FieldByName('DT_TRANS').AsDateTime;

        if Num_Doc = '' then
          Num_Doc := StrZero(IntToStr(Trans), 6, 0);
      end
      else
        Num_Doc := StrZero(IntToStr(Trans), 6, 0);

        Vl := FrmParcelamento.Desc_Boleto.value;

        if FrmParcelamento.chk_acrescimo.Checked then
        Vl :=  Vl * -1;

      // if FrmParcelamento.Desc_Boleto.value > 0 Then
       //Begin
       //   Vl := FrmParcelamento.Desc_Boleto.value;

          IQuery.Sql.Clear;
          IQuery.Sql.Add('UPDATE TRANSACOES SET VR_SEGURO = :VR_DESC_BOLETO WHERE TRANSACAO_ID = :TRANSACAO_ID');
          IQuery.ParamByName('VR_DESC_BOLETO').AsFloat := Vl;
          IQuery.ParamByName('TRANSACAO_ID').AsInteger := Trans;
          IQuery.Prepare;
          IQuery.ExecSQL;

     //  End;


      for X := 1 to StrToInt(FrmParcelamento.Parcelas.Text) do
      begin
        IQuery.Sql.Clear;
        IQuery.Sql.Add('INSERT INTO TRANSPARCELAS(TRANSACAO_ID, PARCELA_ID, TIPO_TRANSACAO, DT_VENCIMENTO, BANCO_ID, VALOR, DUPLICATA,AGRUPAMENTO,DATA) VALUES(:TRANSACAO_ID, :PARCELA_ID, :TIPO_TRANSACAO, :DT_VENCIMENTO, :BANCO_ID, :VALOR, :DUPLICATA,:AGRUPAMENTO,:DATA)');

        IQuery.ParamByName('TRANSACAO_ID').AsInteger  := Trans;
        IQuery.ParamByName('PARCELA_ID').AsString     := StrZero(IntToStr(X), 2, 0) + '/' + StrZero(FrmParcelamento.Parcelas.Text, 2, 0);
        IQuery.ParamByName('TIPO_TRANSACAO').AsString := Tipo;
        IQuery.ParamByName('BANCO_ID').AsInteger      := 0;
        IQuery.ParamByName('AGRUPAMENTO').AsInteger   := 0;
        IQuery.ParamByName('DATA').AsDateTime         := dt_transacao;

        if FrmParcelamento.Caixa_Banco.Value > 0 then
        begin
          if X = 1 then
          begin
            IQuery.ParamByName('DT_VENCIMENTO').AsDateTime := Dt_Trans;
            IQuery.ParamByName('BANCO_ID').AsInteger       := StrToInt(FrmParcelamento.Caixa_Banco.Text);
            IQuery.ParamByName('AGRUPAMENTO').AsInteger    := Trans;
          end
          else
          begin
            Dt_Venc := Dt_Venc + FrmParcelamento.Dias.Value;
            Mes := Mes + 1;

            if Mes > 12 then
            begin
              Mes := 1;
              Ano := Ano + 1;
            end;
          end;
        end
        else
        begin
          Dt_Venc := Dt_Venc + FrmParcelamento.Dias.Value;
          Mes := Mes + 1;

          if Mes > 12 then
          begin
            Mes := 1;
            Ano := Ano + 1;
          end;
        end;

        if FrmParcelamento.Dias.Value > 0 then
          IQuery.ParamByName('DT_VENCIMENTO').AsDateTime := Dt_Venc
        else
          IQuery.ParamByName('DT_VENCIMENTO').AsDateTime := StrToDate(StrZero(IntToStr(Dia), 2, 0) + '/' + StrZero(IntToStr(Mes), 2, 0) + '/' + StrZero(IntToStr(Ano), 4, 0));

        if X <= StrToInt(FrmParcelamento.Parcelas.Text) then
        begin
          //Vl := Vl + RoundTo((Vr_Trans / FrmParcelamento.Parcelas.Value), -2);
          IQuery.ParamByName('VALOR').AsFloat := RoundTo(((Vr_Trans - vl) / FrmParcelamento.Parcelas.Value), -2);
        end
        else
          IQuery.ParamByName('VALOR').AsFloat := RoundTo(Vr_Trans - Vl, -2);

        IQuery.ParamByName('DUPLICATA').AsString := Num_Doc + '/' + StrZero(IntToStr(X), 2, 0);


         IF Copy(QTransacao.FieldByName('COMPLEMENTO').AsString,1,11) = 'MENSALIDADE' then
         IQuery.ParamByName('DUPLICATA').AsString := Copy(QTransacao.FieldByName('COMPLEMENTO').AsString,1,20)
         eLSE
         IQuery.ParamByName('DUPLICATA').AsString := Num_Doc + '/01';


        IQuery.Prepare;
        IQuery.ExecSql;


      end;

      QTabela.Close;

      QTabela.Prepare;
      QTabela.Open;

      QTabela.Last;
    end
    else
    begin
       Num_Doc := StrZero(IntToStr(Trans), 6, 0);
       Vl := FrmParcelamento.Desc_Boleto.value;

      IQuery.Sql.Clear;
      IQuery.Sql.Add('DELETE FROM TRANSPARCELAS');
      IQuery.Sql.Add('WHERE');
      IQuery.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
      IQuery.Sql.Add('AND (TIPO_TRANSACAO = :TIPO_TRANSACAO)');

      IQuery.ParamByName('TRANSACAO_ID').AsInteger  := Trans;
      IQuery.ParamByName('TIPO_TRANSACAO').AsString := 'T';

      IQuery.Prepare;
      IQuery.ExecSql;



      IQuery.Sql.Clear;
      IQuery.Sql.Add('INSERT INTO TRANSPARCELAS(TRANSACAO_ID, PARCELA_ID, TIPO_TRANSACAO, DT_VENCIMENTO, BANCO_ID, VALOR, DUPLICATA,DATA) VALUES(:TRANSACAO_ID, :PARCELA_ID, :TIPO_TRANSACAO, :DT_VENCIMENTO, :BANCO_ID, :VALOR, :DUPLICATA,:DATA)');

      IQuery.ParamByName('TRANSACAO_ID').AsInteger  := Trans;
      IQuery.ParamByName('PARCELA_ID').AsString     := '01/01';
      IQuery.ParamByName('TIPO_TRANSACAO').AsString := Tipo;
      IQuery.ParamByName('BANCO_ID').AsInteger      := 0;
      IQuery.ParamByName('DATA').AsDateTime         := dt_transacao;

      if FrmParcelamento.Dias.Value > 0 then
        IQuery.ParamByName('DT_VENCIMENTO').AsDateTime := (Dt_Trans + FrmParcelamento.Dias.Value)
      else
        IQuery.ParamByName('DT_VENCIMENTO').AsDateTime := (Dt_Trans + 30);

      IQuery.ParamByName('VALOR').AsFloat      := RoundTo(Vr_Trans - Vl, -2);
      IQuery.ParamByName('DUPLICATA').AsString := Num_Doc + '/01';

      IQuery.Prepare;
      IQuery.ExecSql;



      QTabela.Close;

      QTabela.Prepare;
      QTabela.Open;

      QTabela.Last;
    end;
  finally
    FrmParcelamento.Release;
  end;
end;

procedure TFrmParcelas.ParcelasKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    btnEditClick(Self);
end;

procedure TFrmParcelas.QTabelaAfterOpen(DataSet: TDataSet);
begin
TFloatField(QTabela.FieldByName('VALOR')).DisplayFormat  := '#,##0.00';
end;

procedure TFrmParcelas.btnDuplicatasClick(Sender: TObject);
begin
  Duplicatas(Trans, Tipo);
end;

procedure TFrmParcelas.btnEditClick(Sender: TObject);
var
Vl, Vr_trans_ori,V_PRE, V_REST, V_PARC: Double;
P, N_PARC: Integer;
Registro: String;
begin


  if (Tipo = 'V') then
  begin
    Vr_trans_ori := Vr_trans;

    IQuery.Sql.Clear;
    IQuery.Sql.Add('SELECT * FROM PEDIDOS');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(PEDIDO_ID = :PEDIDO_ID)');

    IQuery.ParamByName('PEDIDO_ID').AsInteger := Trans;

    IQuery.Prepare;
    IQuery.Open;

  //  Vl:= IQuery.FieldByName('VR_SEGURO').AsFloat;

  //  Vr_Trans := Vr_Trans - Vl;

    if IQuery.FieldByName('DT_MOVIMENTO').AsDateTime < FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime then
    begin
      Application.MessageBox('Movimento já encerrado', PChar(Msg_Title), mb_IconStop);
      exit;
    end;
  end;

  if (Tipo = 'T') then
  begin
    Vr_trans_ori := Vr_trans;

    IQuery.Sql.Clear;
    IQuery.Sql.Add('SELECT * FROM TRANSACOES');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

    IQuery.ParamByName('TRANSACAO_ID').AsInteger := Trans;

    IQuery.Prepare;
    IQuery.Open;

    Vl:= IQuery.FieldByName('VR_SEGURO').AsFloat;

    Vr_Trans := Vr_Trans - Vl;

    if IQuery.FieldByName('DT_MOVIMENTO').AsDateTime < FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime then
    begin
      Application.MessageBox('Movimento já encerrado', PChar(Msg_Title), mb_IconStop);
      exit;
    end;
  end;

   if (Tipo = 'O') then
  begin
    Vr_trans_ori := Vr_trans;

    IQuery.Sql.Clear;
    IQuery.Sql.Add('SELECT * FROM ORCAMENTOS');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(ORCAMENTO_ID = :ORCAMENTO_ID)');

    IQuery.ParamByName('ORCAMENTO_ID').AsInteger := Trans;

    IQuery.Prepare;
    IQuery.Open;

   // Vl:= IQuery.FieldByName('VR_SEGURO').AsFloat;

   // Vr_Trans := Vr_Trans - Vl;

    if IQuery.FieldByName('DT_MOVIMENTO').AsDateTime < FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime then
    begin
      Application.MessageBox('Movimento já encerrado', PChar(Msg_Title), mb_IconStop);
      exit;
    end;
  end;

  if not QTabela.IsEmpty then
  begin

    Registro := QTabela.FieldByName('PARCELA_ID').AsString;
    Vr_Atual := QTabela.FieldByName('VALOR').AsFloat;


    Application.CreateForm(TFrmAltera_Parcela, FrmAltera_Parcela);
    try
      if FrmAltera_Parcela.ShowModal = mrOK then
      begin

        if (FrmAltera_Parcela.VALOR.Value >= Vr_Trans) and (QTabela.RecordCount > 1)  then
        begin
          Application.MessageBox('Valor não pode ser maior ou igual ao valor da transação.', PChar(Msg_Title), mb_IconStop);
          abort;
        end
        else
        begin

          IQuery.Sql.Clear;
          IQuery.Sql.Add('UPDATE TRANSPARCELAS SET DT_VENCIMENTO = :DT_VENCIMENTO, VALOR = :VALOR, ESPECIE = :ESPECIE, DUPLICATA = :DUPLICATA');
          IQuery.Sql.Add('WHERE');
          IQuery.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
          IQuery.Sql.Add('AND (TIPO_TRANSACAO = :TIPO_TRANSACAO)');
          IQuery.Sql.Add('AND (PARCELA_ID = :PARCELA_ID)');

          IQuery.ParamByName('DT_VENCIMENTO').AsDateTime := FrmAltera_Parcela.DT_VENCIMENTO.Date;
          IQuery.ParamByName('VALOR').AsFloat            := FrmAltera_Parcela.VALOR.Value;
          IQuery.ParamByName('ESPECIE').AsString         := FrmAltera_Parcela.ESPECIE.Text;
          IQuery.ParamByName('DUPLICATA').AsString       := FrmAltera_Parcela.DUPLICATA.Text;
          IQuery.ParamByName('TRANSACAO_ID').AsInteger   := Trans;
          IQuery.ParamByName('TIPO_TRANSACAO').AsString  := Tipo;
          IQuery.ParamByName('PARCELA_ID').AsString      := QTabela.FieldByName('PARCELA_ID').AsString;

          IQuery.Prepare;
          IQuery.ExecSql;

        end;

        QTabela.Close;
        QTabela.Open;

        P := 0;
        V_PRE := 0;

        QTabela.First;
        while not QTabela.Eof do
        begin
          if QTabela.FieldByName('PARCELA_ID').AsString <= Registro then
          begin
            V_PRE := V_PRE + (QTabela.FieldByName('VALOR').AsFloat);

            Inc(P);
          end;

          Application.ProcessMessages;
          QTabela.Next;
        end;

        V_REST := Vr_Trans - V_PRE;

        if V_PRE < Vr_Trans then
        begin
          N_PARC := QTabela.RecordCount - P;

          if N_PARC = 0 then
            N_PARC := 1;

          V_PARC := (V_REST / N_PARC);

          QTabela.First;
          while not QTabela.Eof do
          begin
            if QTabela.FieldByName('PARCELA_ID').AsString > Registro then
            begin

              IQuery.Sql.Clear;
              IQuery.Sql.Add('UPDATE TRANSPARCELAS SET VALOR = :VALOR');
              IQuery.Sql.Add('WHERE');
              IQuery.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
              IQuery.Sql.Add('AND (TIPO_TRANSACAO = :TIPO_TRANSACAO)');
              IQuery.Sql.Add('AND (PARCELA_ID = :PARCELA_ID)');

              IQuery.ParamByName('VALOR').AsFloat           := RoundTo(V_PARC,-2);
              IQuery.ParamByName('TRANSACAO_ID').AsInteger  := Trans;
              IQuery.ParamByName('TIPO_TRANSACAO').AsString := Tipo;
              IQuery.ParamByName('PARCELA_ID').AsString     := QTabela.FieldByName('PARCELA_ID').AsString;

              IQuery.Prepare;
              IQuery.ExecSql;


            end;

            Application.ProcessMessages;
            QTabela.Next;
          end;
        end;

        QTabela.Close;
        QTabela.Open;

        V_PRE := 0;

        QTabela.First;
        while not QTabela.Eof do
        begin
          V_PRE := V_PRE + (QTabela.FieldByName('VALOR').AsFloat);

          Application.ProcessMessages;
          QTabela.Next;
        end;

        if V_PRE <> Vr_Trans then
        begin

          QTabela.Last;

          IQuery.Sql.Clear;
          IQuery.Sql.Add('UPDATE TRANSPARCELAS SET VALOR = :VALOR');
          IQuery.Sql.Add('WHERE');
          IQuery.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
          IQuery.Sql.Add('AND (TIPO_TRANSACAO = :TIPO_TRANSACAO)');
          IQuery.Sql.Add('AND (PARCELA_ID = :PARCELA_ID)');

          if V_PRE > Vr_Trans then
            IQuery.ParamByName('VALOR').AsFloat := RoundTo((QTabela.FieldByName('VALOR').AsFloat) - Abs(V_PRE - Vr_Trans), -2)
          else
            IQuery.ParamByName('VALOR').AsFloat := RoundTo((QTabela.FieldByName('VALOR').AsFloat) + Abs(V_PRE - Vr_Trans), -2);

          IQuery.ParamByName('TRANSACAO_ID').AsInteger  := Trans;
          IQuery.ParamByName('TIPO_TRANSACAO').AsString := Tipo;
          IQuery.ParamByName('PARCELA_ID').AsString     := QTabela.FieldByName('PARCELA_ID').AsString;

          IQuery.Prepare;
          IQuery.ExecSql;


        end;

      end;
    finally
      FrmAltera_Parcela.Release;
      Vr_trans := Vr_Trans_ori;
    end;

  end;
end;

procedure TFrmParcelas.btnGeraClick(Sender: TObject);
begin
  Gera_Parcelas;
end;

procedure TFrmParcelas.FormCreate(Sender: TObject);
begin
  if (Tipo = 'O') OR (Tipo = 'D') then
    btnDuplicatas.Enabled := False;

  Parcelas.Columns[0].Width := 64;
  Parcelas.Columns[1].Width := 41;
  Parcelas.Columns[2].Width := 64;
  Parcelas.Columns[3].Width := 118;
  Parcelas.Columns[4].Width := 123;
  Parcelas.Columns[5].Width := 123;

  btnGera.Enabled := Acesso;
  btnEdit.Enabled := Acesso;

  QTabela.ParamByName('TRANSACAO_ID').AsInteger  := Trans;
  QTabela.ParamByName('TIPO_TRANSACAO').AsString := Tipo;

  QTabela.Prepare;
  QTabela.Open;

  QTransacao.ParamByName('TRANSACAO_ID').AsInteger  := Trans;

  QTransacao.Prepare;
  QTransacao.Open;

end;

procedure TFrmParcelas.FormShow(Sender: TObject);
begin
  if (QTabela.IsEmpty) and (Acesso) then
    Gera_Parcelas;
end;

end.
