unit UConfig_Bordero;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, rxToolEdit, rxCurrEdit, ExtCtrls, DBCtrls,
  DB, IBCustomDataSet, IBQuery, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrmConfig_Bordero = class(TForm)
    Label1: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Bevel3: TBevel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label44: TLabel;
    Label103: TLabel;
    Bevel2: TBevel;
    Banco: TCurrencyEdit;
    btnCaixa_Banco: TSpeedButton;
    Imprime_Local: TCheckBox;
    Imprime_Cedente: TCheckBox;
    Imprime_Agencia: TCheckBox;
    Local_Lin: TCurrencyEdit;
    Local_Col: TCurrencyEdit;
    Local_Tam: TCurrencyEdit;
    Venc_Lin: TCurrencyEdit;
    Venc_Col: TCurrencyEdit;
    Cedente_Lin: TCurrencyEdit;
    Cedente_Col: TCurrencyEdit;
    Agencia_Lin: TCurrencyEdit;
    Agencia_Col: TCurrencyEdit;
    Data_Lin: TCurrencyEdit;
    Data_Col: TCurrencyEdit;
    Doc_Lin: TCurrencyEdit;
    Doc_Col: TCurrencyEdit;
    Valor_Lin: TCurrencyEdit;
    Valor_Col: TCurrencyEdit;
    Valor_Tam: TCurrencyEdit;
    Instrucoes_Lin: TCurrencyEdit;
    Instrucoes_Col: TCurrencyEdit;
    Instrucoes_Tam: TCurrencyEdit;
    Sacado_Lin: TCurrencyEdit;
    Sacado_Col: TCurrencyEdit;
    Ult_Lin: TCurrencyEdit;
    Largura_Papel: TCurrencyEdit;
    Altura_Papel: TCurrencyEdit;
    DataBanco: TDataSource;
    DBText4: TDBText;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    QBanco: TFDQuery;
    QRel: TFDQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRetornaClick(Sender: TObject);
    procedure btnCaixa_BancoClick(Sender: TObject);
    procedure BancoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BancoExit(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure Imprime_LocalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GravaConfig(Banco, Linha, Coluna, Campo, Tamanho: String);
    procedure DetailSearch;
  end;

var
  FrmConfig_Bordero: TFrmConfig_Bordero;

implementation

uses
  UPrincipal, UConsulta, UData;

{$R *.dfm}

procedure TFrmConfig_Bordero.DetailSearch;
begin
  QBanco.Close;
  QBanco.ParamByName('BANCO_ID').AsInteger := StrToInt(Banco.Text);
  QBanco.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  QBanco.Prepare;
  QBanco.Open;
end;

procedure TFrmConfig_Bordero.GravaConfig(Banco, Linha, Coluna, Campo, Tamanho: String);
begin
  QRel.Sql.Clear;
  QRel.Sql.Add('INSERT INTO CONFIG_BORDERO( ' +
               'BANCO_ID,  LINHA,  COLUNA,    CAMPO,  TAMANHO) VALUES(' +
               ':BANCO_ID, :LINHA, :COLUNA,   :CAMPO, :TAMANHO)');
  QRel.ParamByName('BANCO_ID').AsInteger := StrToInt(Banco);
  QRel.ParamByName('LINHA').AsInteger    := StrToInt(Linha);
  QRel.ParamByName('COLUNA').AsInteger   := StrToInt(Coluna);
  QRel.ParamByName('CAMPO').AsString     := Campo;
  QRel.ParamByName('TAMANHO').AsInteger  := StrToInt(Tamanho);
  QRel.Prepare;
  QRel.ExecSql;

end;

procedure TFrmConfig_Bordero.Imprime_LocalKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmConfig_Bordero.BancoExit(Sender: TObject);
begin
  DetailSearch;

  if not QBanco.IsEmpty then
  begin
    Largura_Papel.Text := LeIni(Arq_Ini, 'Borderô', 'Largura');
    Altura_Papel.Text  := LeIni(Arq_Ini, 'Borderô', 'Altura');

    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT * FROM CONFIG_BORDERO');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(BANCO_ID = :BANCO_ID)');
    QRel.ParamByName('BANCO_ID').AsInteger := StrToInt(Banco.Text);
    QRel.Prepare;
    QRel.Open;

    QRel.First;
    while not QRel.Eof do
    begin
      if QRel.FieldByName('CAMPO').AsString = 'LOCAL' then
      begin
        Imprime_Local.Checked := True;
        Local_Lin.Text := QRel.FieldByName('LINHA').AsString;
        Local_Col.Text := QRel.FieldByName('COLUNA').AsString;
        Local_Tam.Text := QRel.FieldByName('TAMANHO').AsString;
      end;

      if QRel.FieldByName('CAMPO').AsString = 'VENCIMENTO' then
      begin
        Venc_Lin.Text := QRel.FieldByName('LINHA').AsString;
        Venc_Col.Text := QRel.FieldByName('COLUNA').AsString;
      end;

      if QRel.FieldByName('CAMPO').AsString = 'CEDENTE' then
      begin
        Imprime_Cedente.Checked := True;
        Cedente_Lin.Text        := QRel.FieldByName('LINHA').AsString;
        Cedente_Col.Text        := QRel.FieldByName('COLUNA').AsString;
      end;

      if QRel.FieldByName('CAMPO').AsString = 'AGENCIA' then
      begin
        Imprime_Agencia.Checked := True;
        Agencia_Lin.Text        := QRel.FieldByName('LINHA').AsString;
        Agencia_Col.Text        := QRel.FieldByName('COLUNA').AsString;
      end;

      if QRel.FieldByName('CAMPO').AsString = 'DATA' then
      begin
        Data_Lin.Text := QRel.FieldByName('LINHA').AsString;
        Data_Col.Text := QRel.FieldByName('COLUNA').AsString;
      end;

      if QRel.FieldByName('CAMPO').AsString = 'DOCUMENTO' then
      begin
        Doc_Lin.Text := QRel.FieldByName('LINHA').AsString;
        Doc_Col.Text := QRel.FieldByName('COLUNA').AsString;
      end;

      if QRel.FieldByName('CAMPO').AsString = 'VALOR' then
      begin
        Valor_Lin.Text := QRel.FieldByName('LINHA').AsString;
        Valor_Col.Text := QRel.FieldByName('COLUNA').AsString;
        Valor_Tam.Text := QRel.FieldByName('TAMANHO').AsString;
      end;

      if QRel.FieldByName('CAMPO').AsString = 'INSTRUCOES' then
      begin
        Instrucoes_Lin.Text := QRel.FieldByName('LINHA').AsString;
        Instrucoes_Col.Text := QRel.FieldByName('COLUNA').AsString;
        Instrucoes_Tam.Text := QRel.FieldByName('TAMANHO').AsString;
      end;

      if QRel.FieldByName('CAMPO').AsString = 'SACADO' then
      begin
        Sacado_Lin.Text := QRel.FieldByName('LINHA').AsString;
        Sacado_Col.Text := QRel.FieldByName('COLUNA').AsString;
      end;

      if QRel.FieldByName('CAMPO').AsString = 'FIM' then
        Ult_Lin.Text := QRel.FieldByName('LINHA').AsString;

       Application.ProcessMessages;
      QRel.Next;
    end;
  end;

end;

procedure TFrmConfig_Bordero.BancoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = Banco) then
    btnCaixa_BancoClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmConfig_Bordero.btnCaixa_BancoClick(Sender: TObject);
begin
  try
    Banco.Value := GetConsulta('BANCOS', 0, 0, StrToInt(Banco.Text));
  except
    Banco.Value := GetConsulta('BANCOS', 0, 0, 0);
  end;
end;

procedure TFrmConfig_Bordero.btnExecutaClick(Sender: TObject);
begin
  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    DetailSearch;

    if not QBanco.IsEmpty then
    begin
      QRel.Sql.Clear;
      QRel.Sql.Add('DELETE FROM CONFIG_BORDERO');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(BANCO_ID = :BANCO_ID)');
      QRel.ParamByName('BANCO_ID').AsInteger := StrToInt(Banco.Text);

      QRel.Prepare;
      QRel.ExecSql;



      if Imprime_Local.Checked then
        GravaConfig(Banco.Text, Local_Lin.Text, Local_Col.Text, 'LOCAL', Local_Tam.Text);

      GravaConfig(Banco.Text, Venc_Lin.Text, Venc_Col.Text, 'VENCIMENTO', '0');

      if Imprime_Cedente.Checked then
        GravaConfig(Banco.Text, Cedente_Lin.Text, Cedente_Col.Text, 'CEDENTE', '0');

      if Imprime_Agencia.Checked then
        GravaConfig(Banco.Text, Agencia_Lin.Text, Agencia_Col.Text, 'AGENCIA', '0');

      GravaConfig(Banco.Text, Data_Lin.Text, Data_Col.Text, 'DATA', '0');
      GravaConfig(Banco.Text, Doc_Lin.Text, Doc_Col.Text, 'DOCUMENTO', '0');
      GravaConfig(Banco.Text, Valor_Lin.Text, Valor_Col.Text, 'VALOR', Valor_Tam.Text);
      GravaConfig(Banco.Text, Instrucoes_Lin.Text, Instrucoes_Col.Text, 'INSTRUCOES', Instrucoes_Tam.Text);
      GravaConfig(Banco.Text, Sacado_Lin.Text, Sacado_Col.Text, 'SACADO', '0');
      GravaConfig(Banco.Text, Ult_Lin.Text, '0', 'FIM', '0');

      GravaIni(Arq_Ini, 'Borderô', 'Largura', Largura_Papel.Text);
      GravaIni(Arq_Ini, 'Borderô', 'Altura', Altura_Papel.Text);

      Application.MessageBox('Operação realizada com sucesso', PChar(Msg_Title), mb_IconInformation);
      Close;
    end
    else
      Application.MessageBox('Banco inválido', PChar(Msg_Title), mb_IconStop);
  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;

procedure TFrmConfig_Bordero.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmConfig_Bordero.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
