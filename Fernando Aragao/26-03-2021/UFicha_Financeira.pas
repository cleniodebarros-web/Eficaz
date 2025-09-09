unit UFicha_Financeira;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, DBCtrls, Buttons, StdCtrls, Mask,
  rxToolEdit, rxCurrEdit, Grids, VCLTEE.TeEngine, VCLTEE.TeeFunci, VCLTEE.Series, VCLTEE.TeeProcs, VCLTEE.Chart,
  ExtCtrls, VclTee.TeeGDIPlus, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrmFicha_Financeira = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Graf: TChart;
    Series1: TBarSeries;
    TeeFunction1: TAddTeeFunction;
    Series2: TBarSeries;
    Series3: TBarSeries;
    Series4: TBarSeries;
    Ent_Sai: TStringGrid;
    Label1: TLabel;
    Produto: TCurrencyEdit;
    btnProduto: TSpeedButton;
    DBText1: TDBText;
    DataProduto: TDataSource;
    Label2: TLabel;
    Label38: TLabel;
    DBText3: TDBText;
    DBText5: TDBText;
    Label4: TLabel;
    Label37: TLabel;
    DBText2: TDBText;
    DBText7: TDBText;
    Label6: TLabel;
    Label3: TLabel;
    Label13: TLabel;
    btnExecuta: TBitBtn;
    btnRetorna: TBitBtn;
    Label7: TLabel;
    DBText8: TDBText;
    DBText4: TDBText;
    DBText6: TDBText;
    QProduto: TFDQuery;
    QRel: TFDQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRetornaClick(Sender: TObject);
    procedure btnProdutoClick(Sender: TObject);
    procedure ProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ProdutoChange(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ProdutoSearch;
    procedure Display;
  end;

var
  FrmFicha_Financeira: TFrmFicha_Financeira;
  ID: Integer;

  procedure Ficha_Produto(Produto: Integer);
  
implementation

uses
  Udata, UPrincipal, UConsulta;

{$R *.dfm}

procedure Ficha_Produto(Produto: Integer);
begin
  ID := Produto;

  if not ThereIs('Ficha Financeira') then
    TFrmFicha_Financeira.Create(Application);

  if LeIni(Arq_Ini, 'Sistema', 'Organizar Janelas Automaticamente') = 'True' then
    FrmPrincipal.Cascade;
end;

procedure TFrmFicha_Financeira.ProdutoSearch;
begin
  QProduto.Close;
  QProduto.ParamByName('PRODUTO_ID').AsInteger := StrToInt(Produto.Text);
  QProduto.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  QProduto.Prepare;
  QProduto.Open;
end;

procedure TFrmFicha_Financeira.Display;
var
X, AA, BB, I, J, DIA: Integer;
MES: array[1..6] of String;
S1, S2, S3, S4, CP: array[1..6] of Real;
Sugestao: Real;
begin
  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT TRANSITENS.QUANTIDADE, TRANSACOES.DT_TRANS, TRANSACOES.CONDUTA');
    QRel.Sql.Add('FROM TRANSITENS');
    QRel.Sql.Add('INNER JOIN TRANSACOES');
    QRel.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(TRANSITENS.PRODUTO_ID = :PRODUTO_ID)');
    QRel.Sql.Add('AND (TRANSACOES.EMPRESA_ID = :EMPRESA_ID)');
    QRel.Sql.Add('AND ((TRANSACOES.CONDUTA = :CD_VENDA) OR (TRANSACOES.CONDUTA = :CD_COMPRA) OR (TRANSACOES.CONDUTA = :CD_CONSUMO))');
    QRel.Sql.Add('AND (TRANSACOES.DEPTO = :DEPTO)');
    QRel.Sql.Add('AND (TRANSACOES.TPCTB <= :TPCTB)');
    QRel.Sql.Add('AND (TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');

    QRel.ParamByName('PRODUTO_ID').AsInteger  := StrToInt(Produto.Text);
    QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    QRel.ParamByName('CD_VENDA').AsString     := '01';
    QRel.ParamByName('CD_COMPRA').AsString    := '02';
    QRel.ParamByName('CD_CONSUMO').AsString   := '17';
    QRel.ParamByName('DEPTO').AsString        := '07';
    QRel.ParamByName('TPCTB').AsString        := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    QRel.ParamByName('DT_INICIAL').AsDateTime := (FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime - 180);
    QRel.ParamByName('DT_FINAL').AsDateTime   := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;

    QRel.Sql.Add('ORDER BY TRANSACOES.DT_TRANS');
    QRel.Prepare;
    QRel.Open;

    Ent_Sai.Cells[0, 0] := 'Mês/Ano';
    Ent_Sai.Cells[1, 0] := 'Vd. 1ª Sem.';
    Ent_Sai.Cells[2, 0] := 'Vd. 2ª Sem.';
    Ent_Sai.Cells[3, 0] := 'Vd. 3ª Sem.';
    Ent_Sai.Cells[4, 0] := 'Vd. 4ª Sem.';
    Ent_Sai.Cells[5, 0] := 'Vd. Total';
    Ent_Sai.Cells[6, 0] := 'Compras';

    AA := StrToInt(Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 4, 2));
    BB := StrToInt(Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 7, 4));

    for X := 6 downto 1 do
    begin
      Ent_Sai.Cells[0, X] := StrZero(IntToStr(AA), 2, 0) + '/' + StrZero(IntToStr(BB), 4, 0) + ' ->';
      MES[X]              := StrZero(IntToStr(AA), 2, 0) + '/' + StrZero(IntToStr(BB), 4, 0);
      S1[X]               := 0;
      S2[X]               := 0;
      S3[X]               := 0;
      S4[X]               := 0;
      CP[X]               := 0;
      AA                  := AA - 1;

      if AA = 0 then
      begin
        AA := 12;
        BB := BB - 1;
      end;
    end;

    QRel.First;
    while not QRel.Eof do
    begin
      DIA := StrToInt(Copy(QRel.FieldByName('DT_TRANS').AsString, 1, 2));

      if Copy(QRel.FieldByName('DT_TRANS').AsString, 4, 7) = MES[1] then
      begin
        if (QRel.FieldByName('CONDUTA').AsString = '01') or (QRel.FieldByName('CONDUTA').AsString = '17') then
        begin
          if DIA <= 7 then
            S1[1] := S1[1] + QRel.FieldByName('QUANTIDADE').AsFloat
          else if (DIA > 7) and (DIA <= 14) then
            S2[1] := S2[1] + QRel.FieldByName('QUANTIDADE').AsFloat
          else if (DIA > 14) and (DIA <= 21) then
            S3[1] := S3[1] + QRel.FieldByName('QUANTIDADE').AsFloat
          else if DIA > 21 then
            S4[1] := S4[1] + QRel.FieldByName('QUANTIDADE').AsFloat;
        end;

        if QRel.FieldByName('CONDUTA').AsString = '02' then
          CP[1] := CP[1] + QRel.FieldByName('QUANTIDADE').AsFloat;
      end;

      if Copy(QRel.FieldByName('DT_TRANS').AsString, 4, 7) = MES[2] then
      begin
        if (QRel.FieldByName('CONDUTA').AsString = '01') or (QRel.FieldByName('CONDUTA').AsString = '17') then
        begin
          if DIA <= 7 then
            S1[2] := S1[2] + QRel.FieldByName('QUANTIDADE').AsFloat
          else if (DIA > 7) and (DIA <= 14) then
            S2[2] := S2[2] + QRel.FieldByName('QUANTIDADE').AsFloat
          else if (DIA > 14) and (DIA <= 21) then
             S3[2] := S3[2] + QRel.FieldByName('QUANTIDADE').AsFloat
          else if DIA > 21 then
            S4[2] := S4[2] + QRel.FieldByName('QUANTIDADE').AsFloat;
        end;
        if QRel.FieldByName('CONDUTA').AsString = '02' then
          CP[2] := CP[2] + QRel.FieldByName('QUANTIDADE').AsFloat;
      end;

      if Copy(QRel.FieldByName('DT_TRANS').AsString, 4, 7) = MES[3] then
      begin
        if (QRel.FieldByName('CONDUTA').AsString = '01') or (QRel.FieldByName('CONDUTA').AsString = '17') then
        begin
          if DIA <= 7 then
            S1[3] := S1[3] + QRel.FieldByName('QUANTIDADE').AsFloat
          else if (DIA > 7) and (DIA <= 14) then
            S2[3] := S2[3] + QRel.FieldByName('QUANTIDADE').AsFloat
          else if (DIA > 14) and (DIA <= 21) then
            S3[3] := S3[3] + QRel.FieldByName('QUANTIDADE').AsFloat
          else if DIA > 21 then
            S4[3] := S4[3] + QRel.FieldByName('QUANTIDADE').AsFloat;
        end;

        if QRel.FieldByName('CONDUTA').AsString = '02' then
          CP[3] := CP[3] + QRel.FieldByName('QUANTIDADE').AsFloat;
      end;

      if Copy(QRel.FieldByName('DT_TRANS').AsString, 4, 7) = MES[4] then
      begin
        if (QRel.FieldByName('CONDUTA').AsString = '01') or (QRel.FieldByName('CONDUTA').AsString = '17') then
        begin
          if DIA <= 7 then
            S1[4] := S1[4] + QRel.FieldByName('QUANTIDADE').AsFloat
          else if (DIA > 7) and (DIA <= 14) then
            S2[4] := S2[4] + QRel.FieldByName('QUANTIDADE').AsFloat
          else if (DIA > 14) and (DIA <= 21) then
            S3[4] := S3[4] + QRel.FieldByName('QUANTIDADE').AsFloat
          else if DIA > 21 then
            S4[4] := S4[4] + QRel.FieldByName('QUANTIDADE').AsFloat;
        end;

        if QRel.FieldByName('CONDUTA').AsString = '02' then
          CP[4] := CP[4] + QRel.FieldByName('QUANTIDADE').AsFloat;
      end;

      if Copy(QRel.FieldByName('DT_TRANS').AsString, 4, 7) = MES[5] then
      begin
        if (QRel.FieldByName('CONDUTA').AsString = '01') or (QRel.FieldByName('CONDUTA').AsString = '17') then
        begin
          if DIA <= 7 then
            S1[5] := S1[5] + QRel.FieldByName('QUANTIDADE').AsFloat
          else if (DIA > 7) and (DIA <= 14) then
            S2[5] := S2[5] + QRel.FieldByName('QUANTIDADE').AsFloat
          else if (DIA > 14) and (DIA <= 21) then
            S3[5] := S3[5] + QRel.FieldByName('QUANTIDADE').AsFloat
          else if DIA > 21 then
            S4[5] := S4[5] + QRel.FieldByName('QUANTIDADE').AsFloat;
        end;

        if QRel.FieldByName('CONDUTA').AsString = '02' then
          CP[5] := CP[5] + QRel.FieldByName('QUANTIDADE').AsFloat;
      end;

      if Copy(QRel.FieldByName('DT_TRANS').AsString, 4, 7) = MES[6] then
      begin
        if (QRel.FieldByName('CONDUTA').AsString = '01') or (QRel.FieldByName('CONDUTA').AsString = '17') then
        begin
          if DIA <= 7 then
            S1[6] := S1[6] + QRel.FieldByName('QUANTIDADE').AsFloat
          else if (DIA > 7) and (DIA <= 14) then
            S2[6] := S2[6] + QRel.FieldByName('QUANTIDADE').AsFloat
          else if (DIA > 14) and (DIA <= 21) then
            S3[6] := S3[6] + QRel.FieldByName('QUANTIDADE').AsFloat
          else if DIA > 21 then
            S4[6] := S4[6] + QRel.FieldByName('QUANTIDADE').AsFloat;
        end;

        if QRel.FieldByName('CONDUTA').AsString = '02' then
          CP[6] := CP[6] + QRel.FieldByName('QUANTIDADE').AsFloat;
      end;

      Application.ProcessMessages;
      QRel.Next;
    end;

    Ent_Sai.Cells[1, 1] := FormatFloat('0.00', S1[1]);
    Ent_Sai.Cells[1, 2] := FormatFloat('0.00', S1[2]);
    Ent_Sai.Cells[1, 3] := FormatFloat('0.00', S1[3]);
    Ent_Sai.Cells[1, 4] := FormatFloat('0.00', S1[4]);
    Ent_Sai.Cells[1, 5] := FormatFloat('0.00', S1[5]);
    Ent_Sai.Cells[1, 6] := FormatFloat('0.00', S1[6]);
    Ent_Sai.Cells[2, 1] := FormatFloat('0.00', S2[1]);
    Ent_Sai.Cells[2, 2] := FormatFloat('0.00', S2[2]);
    Ent_Sai.Cells[2, 3] := FormatFloat('0.00', S2[3]);
    Ent_Sai.Cells[2, 4] := FormatFloat('0.00', S2[4]);
    Ent_Sai.Cells[2, 5] := FormatFloat('0.00', S2[5]);
    Ent_Sai.Cells[2, 6] := FormatFloat('0.00', S2[6]);
    Ent_Sai.Cells[3, 1] := FormatFloat('0.00', S3[1]);
    Ent_Sai.Cells[3, 2] := FormatFloat('0.00', S3[2]);
    Ent_Sai.Cells[3, 3] := FormatFloat('0.00', S3[3]);
    Ent_Sai.Cells[3, 4] := FormatFloat('0.00', S3[4]);
    Ent_Sai.Cells[3, 5] := FormatFloat('0.00', S3[5]);
    Ent_Sai.Cells[3, 6] := FormatFloat('0.00', S3[6]);
    Ent_Sai.Cells[4, 1] := FormatFloat('0.00', S4[1]);
    Ent_Sai.Cells[4, 2] := FormatFloat('0.00', S4[2]);
    Ent_Sai.Cells[4, 3] := FormatFloat('0.00', S4[3]);
    Ent_Sai.Cells[4, 4] := FormatFloat('0.00', S4[4]);
    Ent_Sai.Cells[4, 5] := FormatFloat('0.00', S4[5]);
    Ent_Sai.Cells[4, 6] := FormatFloat('0.00', S4[6]);
    Ent_Sai.Cells[5, 1] := FormatFloat('0.00', S1[1] + S2[1] + S3[1] + S4[1]);
    Ent_Sai.Cells[5, 2] := FormatFloat('0.00', S1[2] + S2[2] + S3[2] + S4[2]);
    Ent_Sai.Cells[5, 3] := FormatFloat('0.00', S1[3] + S2[3] + S3[3] + S4[3]);
    Ent_Sai.Cells[5, 4] := FormatFloat('0.00', S1[4] + S2[4] + S3[4] + S4[4]);
    Ent_Sai.Cells[5, 5] := FormatFloat('0.00', S1[5] + S2[5] + S3[5] + S4[5]);
    Ent_Sai.Cells[5, 6] := FormatFloat('0.00', S1[6] + S2[6] + S3[6] + S4[6]);
    Ent_Sai.Cells[6, 1] := FormatFloat('0.00', CP[1]);
    Ent_Sai.Cells[6, 2] := FormatFloat('0.00', CP[2]);
    Ent_Sai.Cells[6, 3] := FormatFloat('0.00', CP[3]);
    Ent_Sai.Cells[6, 4] := FormatFloat('0.00', CP[4]);
    Ent_Sai.Cells[6, 5] := FormatFloat('0.00', CP[5]);
    Ent_Sai.Cells[6, 6] := FormatFloat('0.00', CP[6]);

    for I := 1 to 4 do
    begin
      Graf.Series[I-1].Clear;

      for J := 1 to 6 do
        Graf.Series[I-1].Add(StrToInt(Copy(Ent_Sai.Cells[I, J], 1, length(Ent_Sai.Cells[I, J]) - 3)),
        '', Graf.Series[I-1].SeriesColor);
        

    end;

    Graf.Title.Text.Clear;
    Graf.Title.Text.Add(Copy(QProduto.FieldByName('DESCRICAO').AsString, 1, 50));

    Sugestao := ((S1[4] + S2[4] + S3[4] + S4[4] + S1[5] + S2[5] + S3[5] + S4[5] +
                S1[6] + S2[6] + S3[6] + S4[6]) / 90) * 30;

    if FrmData.QAcesso.FieldByName('TPCTB').AsString = '3' then
    begin
      if Sugestao > (QProduto.FieldByName('QUANTIDADE_C').AsFloat + QProduto.FieldByName('QUANTIDADE_G').AsFloat) then
        Label13.Caption := FormatFloat('#,##0.00', Round(Sugestao - (QProduto.FieldByName('QUANTIDADE_C').AsFloat +
                                                        QProduto.FieldByName('QUANTIDADE_G').AsFloat)))
      else
        Label13.Caption := '0,00';
    end
    else
    begin
      if Sugestao > QProduto.FieldByName('QUANTIDADE_C').AsFloat then
        Label13.Caption := FormatFloat('#,##0.00', Round(Sugestao - QProduto.FieldByName('QUANTIDADE_C').AsFloat))
      else
        Label13.Caption := '0,00';
    end; 

    Graf.Visible := True;
  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;

procedure TFrmFicha_Financeira.btnExecutaClick(Sender: TObject);
begin
  if Produto.Value > 0 then  
    Display;
end;

procedure TFrmFicha_Financeira.btnProdutoClick(Sender: TObject);
begin
  try
    Produto.Value := GetConsulta('ESTOQUE', FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger, 0, StrToInt(Produto.Text));
  except
    Produto.Value := GetConsulta('ESTOQUE', FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger, 0, 0);
  end;
end;

procedure TFrmFicha_Financeira.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmFicha_Financeira.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmFicha_Financeira.FormCreate(Sender: TObject);
begin
  Produto.Text := IntToStr(ID);
end;

procedure TFrmFicha_Financeira.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    Close;
end;

procedure TFrmFicha_Financeira.FormShow(Sender: TObject);
begin
  if Produto.Value > 0 then
  begin
    btnExecutaClick(Self);
    btnRetorna.SetFocus;
  end;
end;

procedure TFrmFicha_Financeira.ProdutoChange(Sender: TObject);
begin
  if Produto.Value > 0 then
    ProdutoSearch;
end;

procedure TFrmFicha_Financeira.ProdutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = Produto) then
    btnProdutoClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

end.
