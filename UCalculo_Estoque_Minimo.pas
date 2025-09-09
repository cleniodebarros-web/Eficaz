unit UCalculo_Estoque_Minimo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, rxCurrEdit, Mask, rxToolEdit, DB,
  IBCustomDataSet, IBQuery, Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrmCalculo_Estoque_Minimo = class(TForm)
    Label1: TLabel;
    Dtmen: TDateEdit;
    Dtmai: TDateEdit;
    Label2: TLabel;
    Dias: TCurrencyEdit;
    Bevel1: TBevel;
    Tipo_Venda: TComboBox;
    Label3: TLabel;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    QUpdate: TFDQuery;
    QRel: TFDQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRetornaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DiasKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnExecutaClick(Sender: TObject);
    procedure DtmenEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Validacao: Boolean;
  end;

var
  FrmCalculo_Estoque_Minimo: TFrmCalculo_Estoque_Minimo;

implementation

uses
  UData, UPrincipal;

{$R *.dfm}

function TFrmCalculo_Estoque_Minimo.Validacao: Boolean;
begin
  Result := False;

  Dtmen.Color      := clWindow;
  Dtmai.Color      := clWindow;
  Tipo_Venda.Color := clWindow;

  if Dtmai.Date < Dtmen.Date then
  begin
    Application.MessageBox('Data final inválida', PChar(Msg_Title), mb_IconStop);
    Dtmai.Color := clYellow;
    Dtmai.SetFocus;
    exit;
  end;

  if Tipo_Venda.Text = '' then
  begin
    Application.MessageBox('Informe o Tipo de Venda', PChar(Msg_Title), mb_IconStop);
    Tipo_Venda.Color := clYellow;
    Tipo_Venda.SetFocus;
    exit;
  end;

  Result := True;
end;

procedure TFrmCalculo_Estoque_Minimo.btnExecutaClick(Sender: TObject);
begin
  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    if Validacao then
    begin
      QRel.Sql.Clear;
      QRel.Sql.Add('ALTER TABLE PRODUTOS DISABLE TRIGGER PRODUTOS_UP');
      QRel.ExecSql;

      QRel.Sql.Clear;
      QRel.Sql.Add('ALTER TABLE PRODUTOS DISABLE TRIGGER mobile_sync_produtos');
      QRel.ExecSql;

      Dtmen.Color      := clWindow;
      Dtmai.Color      := clWindow;
      Tipo_Venda.Color := clWindow;

      QRel.Sql.Clear;
      QRel.Sql.Add('SELECT TRANSITENS.PRODUTO_ID, SUM(TRANSITENS.QUANTIDADE) AS QUANTIDADE');
      QRel.Sql.Add('FROM TRANSITENS');
      QRel.Sql.Add('INNER JOIN TRANSACOES');
      QRel.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(TRANSACOES.DT_TRANS BETWEEN :DT_INICIAL AND :DT_FINAL)');

      if Tipo_Venda.Text = 'VENDAS' then
        QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :CONDUTA_VENDA)');

      if Tipo_Venda.Text = 'VENDAS E CONSUMO' then
      begin
        QRel.Sql.Add('AND (TRANSACOES.CONDUTA = :CONDUTA_VENDA OR TRANSACOES.CONDUTA = :CONDUTA_CONSUMO)');
        QRel.ParamByName('CONDUTA_CONSUMO').AsString := '17';
      end;

      QRel.Sql.Add('AND (TRANSACOES.TIPO_VENDA = :TIPO_VENDA)');
      QRel.Sql.Add('AND (TRANSACOES.DEPTO = :DEPTO)');
      QRel.Sql.Add('GROUP BY TRANSITENS.PRODUTO_ID');

      QRel.ParamByName('DT_INICIAL').AsDateTime  := Dtmen.Date;
      QRel.ParamByName('DT_FINAL').AsDateTime    := Dtmai.Date;
      QRel.ParamByName('CONDUTA_VENDA').AsString := '01';
      QRel.ParamByName('DEPTO').AsString         := '07';
      QRel.ParamByName('TIPO_VENDA').AsString    := 'VENDA';

      QRel.Prepare;
      QRel.Open;

      QUpdate.Sql.Clear;
      QUpdate.Sql.Add('UPDATE PRODUTOS SET QUANT_MINIMA = 0');
      QUpdate.Prepare;
      QUpdate.ExecSql;

      QRel.First;
      while not QRel.Eof do
      begin
        QUpdate.Sql.Clear;
        QUpdate.Sql.Add('UPDATE PRODUTOS SET QUANT_MINIMA = :MINIMO');
        QUpdate.Sql.Add('WHERE');
        QUpdate.Sql.Add('(PRODUTO_ID = :PRODUTO_ID)');

        QUpdate.ParamByName('MINIMO').AsFloat       := (QRel.FieldByName('QUANTIDADE').AsFloat * Dias.Value);
        QUpdate.ParamByName('PRODUTO_ID').AsInteger := QRel.FieldByName('PRODUTO_ID').AsInteger;

        QUpdate.Prepare;
        QUpdate.ExecSql;


        Application.ProcessMessages;
        QRel.Next;
      end;

      QRel.Sql.Clear;
      QRel.Sql.Add('ALTER TABLE PRODUTOS ENABLE TRIGGER PRODUTOS_UP ');

      QRel.ExecSql;

      QRel.Sql.Clear;
      QRel.Sql.Add('ALTER TABLE PRODUTOS ENABLE TRIGGER mobile_sync_produtos ');

      QRel.ExecSql;


    end;
  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;

    Application.MessageBox('Cálculo encerrado', PChar(Msg_Title), mb_IconInformation);
  end;
end;

procedure TFrmCalculo_Estoque_Minimo.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCalculo_Estoque_Minimo.DiasKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmCalculo_Estoque_Minimo.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmCalculo_Estoque_Minimo.DtmenKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
   // Perform(Wm_NextDlgctl, 0, 0);
    
  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmCalculo_Estoque_Minimo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmCalculo_Estoque_Minimo.FormCreate(Sender: TObject);
begin
  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);
end;

end.
