unit UConfig_Duplicata;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, rxToolEdit, rxCurrEdit, ExtCtrls, DB,
  IBCustomDataSet, IBQuery, Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrmConfig_Duplicata = class(TForm)
    Label107: TLabel;
    Label108: TLabel;
    Label121: TLabel;
    Label122: TLabel;
    Label110: TLabel;
    Label111: TLabel;
    Label112: TLabel;
    Label113: TLabel;
    Label114: TLabel;
    Label115: TLabel;
    Label116: TLabel;
    Label117: TLabel;
    Label118: TLabel;
    Label106: TLabel;
    Label119: TLabel;
    Label120: TLabel;
    Label124: TLabel;
    Label125: TLabel;
    Label126: TLabel;
    Label127: TLabel;
    Label128: TLabel;
    Label129: TLabel;
    Label123: TLabel;
    Bevel3: TBevel;
    Bevel2: TBevel;
    Emissao_Lin: TCurrencyEdit;
    Emissao_Col: TCurrencyEdit;
    NotaFisc_Lin: TCurrencyEdit;
    NotaFisc_Col: TCurrencyEdit;
    ValorNf_Lin: TCurrencyEdit;
    ValorNf_Col: TCurrencyEdit;
    Fatura_Lin: TCurrencyEdit;
    Fatura_Col: TCurrencyEdit;
    ValorDp_Lin: TCurrencyEdit;
    ValorDp_Col: TCurrencyEdit;
    NumDp_Lin: TCurrencyEdit;
    NumDp_Col: TCurrencyEdit;
    Vencimento_Lin: TCurrencyEdit;
    Vencimento_Col: TCurrencyEdit;
    Sacado_Lin: TCurrencyEdit;
    Sacado_Col: TCurrencyEdit;
    Endereco_Lin: TCurrencyEdit;
    Endereco_Col: TCurrencyEdit;
    Ult_Lin: TCurrencyEdit;
    Largura_Papel: TCurrencyEdit;
    Altura_Papel: TCurrencyEdit;
    Observa_Lin: TCurrencyEdit;
    Observa_Col: TCurrencyEdit;
    Municipio_Lin: TCurrencyEdit;
    Municipio_Col: TCurrencyEdit;
    Estado_Lin: TCurrencyEdit;
    Estado_Col: TCurrencyEdit;
    Cep_Lin: TCurrencyEdit;
    Cep_Col: TCurrencyEdit;
    Praca_Lin: TCurrencyEdit;
    Praca_Col: TCurrencyEdit;
    Cpf_Lin: TCurrencyEdit;
    Cpf_Col: TCurrencyEdit;
    Incest_Lin: TCurrencyEdit;
    Incest_Col: TCurrencyEdit;
    Extenso_Lin: TCurrencyEdit;
    Extenso_Col: TCurrencyEdit;
    Label109: TLabel;
    Observa_Tam: TCurrencyEdit;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    QRel: TFDQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRetornaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure Observa_LinKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GravaConfig(Linha, Coluna, Campo, Tamanho: String);
  end;

var
  FrmConfig_Duplicata: TFrmConfig_Duplicata;

implementation

uses
  UPrincipal, UData;

{$R *.dfm}

procedure TFrmConfig_Duplicata.GravaConfig(Linha, Coluna, Campo, Tamanho: String);
begin
  QRel.Sql.Clear;
  QRel.Sql.Add('INSERT INTO CONFIG_DUPLICATA( ' +
               'LINHA,  COLUNA,    CAMPO,  TAMANHO) VALUES(' +
               ':LINHA, :COLUNA,   :CAMPO, :TAMANHO)');
  QRel.ParamByName('LINHA').AsInteger   := StrToInt(Linha);
  QRel.ParamByName('COLUNA').AsInteger  := StrToInt(Coluna);
  QRel.ParamByName('CAMPO').AsString    := Campo;
  QRel.ParamByName('TAMANHO').AsInteger := StrToInt(Tamanho);
  QRel.Prepare;
  QRel.ExecSql;

end;

procedure TFrmConfig_Duplicata.Observa_LinKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmConfig_Duplicata.btnExecutaClick(Sender: TObject);
begin
  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    QRel.Sql.Clear;
    QRel.Sql.Add('DELETE FROM CONFIG_DUPLICATA');

    QRel.Prepare;
    QRel.ExecSql;



    GravaConfig(Emissao_Lin.Text, Emissao_Col.Text, 'EMISSAO', '0');
    GravaConfig(Notafisc_Lin.Text, Notafisc_Col.Text, 'NOTAFISC', '0');
    GravaConfig(Valornf_Lin.Text, Valornf_Col.Text, 'VALORNF', '0');
    GravaConfig(Fatura_Lin.Text, Fatura_Col.Text, 'FATURA', '0');
    GravaConfig(Valordp_Lin.Text, Valordp_Col.Text, 'VALORDP', '0');
    GravaConfig(Numdp_Lin.Text, Numdp_Col.Text, 'NUMDP', '0');
    GravaConfig(Vencimento_Lin.Text, Vencimento_Col.Text, 'VENCIMENTO', '0');
    GravaConfig(Sacado_Lin.Text, Sacado_Col.Text, 'SACADO', '0');
    GravaConfig(Endereco_Lin.Text, Endereco_Col.Text, 'ENDERECO', '0');
    GravaConfig(Municipio_Lin.Text, Municipio_Col.Text, 'MUNICIPIO', '0');
    GravaConfig(Estado_Lin.Text, Estado_Col.Text, 'UF_CLI', '0');
    GravaConfig(Cep_Lin.Text, Cep_Col.Text, 'CEP', '0');
    GravaConfig(Praca_Lin.Text, Praca_Col.Text, 'PRACA', '0');
    GravaConfig(Cpf_Lin.Text, Cpf_Col.Text, 'CPFCNPJ', '0');
    GravaConfig(Incest_Lin.Text, Incest_Col.Text, 'INCEST', '0');
    GravaConfig(Extenso_Lin.Text, Extenso_Col.Text, 'EXTENSO_1', Observa_Tam.Text);
//    GravaConfig(Extenso_Lin.Text + 20, Extenso_Col.Text, 'EXTENSO_2', Observa_Tam.Text);
//    GravaConfig(Extenso_Lin.Text + 40, Extenso_Col.Text, 'EXTENSO_3', Observa_Tam.Text);
    GravaConfig(Observa_Lin.Text, Observa_Col.Text, 'INSTRU_1', Observa_Tam.Text);
//    GravaConfig(Observa_Lin.Text + 20, Observa_Col.Text, 'INSTRU_2', Observa_Tam.Text);
//    GravaConfig(Observa_Lin.Text + 40, Observa_Col.Text, 'INSTRU_3', Observa_Tam.Text);
//    GravaConfig(Observa_Lin.Text + 60, Observa_Col.Text, 'INSTRU_4', Observa_Tam.Text);
//    GravaConfig(Observa_Lin.Text + 80, Observa_Col.Text, 'INSTRU_5', Observa_Tam.Text);
//    GravaConfig(Observa_Lin.Text + 100, Observa_Col.Text, 'INSTRU_6', Observa_Tam.Text);
//    GravaConfig(Observa_Lin.Text + 120, Observa_Col.Text, 'INSTRU_7', Observa_Tam.Text);
//    GravaConfig(Observa_Lin.Text + 140, Observa_COl.Text, 'INSTRU_8', Observa_Tam.Text);
    GravaConfig(Ult_Lin.Text, '0', 'FIM', '0');

    GravaIni(Arq_Ini, 'Duplicata', 'Largura', Largura_Papel.Text);
    GravaIni(Arq_Ini, 'Duplicata', 'Altura', Altura_Papel.Text);

    Application.MessageBox('Operação realizada com sucesso', PChar(Msg_Title), mb_IconInformation);
    Close;
  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;

procedure TFrmConfig_Duplicata.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmConfig_Duplicata.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmConfig_Duplicata.FormShow(Sender: TObject);
begin
  Largura_Papel.Text := LeIni(Arq_Ini, 'Duplicata', 'Largura');
  Altura_Papel.Text  := LeIni(Arq_Ini, 'Duplicata', 'Altura');

  QRel.Sql.Clear;
  QRel.Sql.Add('SELECT * FROM CONFIG_DUPLICATA');
  QRel.Prepare;
  QRel.Open;

  QRel.First;
  while not QRel.Eof do
  begin
    if QRel.FieldByName('CAMPO').AsString = 'EMISSAO' then
    begin
      Emissao_Lin.Text := QRel.FieldByName('LINHA').AsString;
      Emissao_Col.Text := QRel.FieldByName('COLUNA').AsString;
    end;

    if QRel.FieldByName('CAMPO').AsString = 'NOTAFISC' then
    begin
      Notafisc_Lin.Text := QRel.FieldByName('LINHA').AsString;
      Notafisc_Col.Text := QRel.FieldByName('COLUNA').AsString;
    end;

    if QRel.FieldByName('CAMPO').AsString = 'VALORNF' then
    begin
      Valornf_Lin.Text := QRel.FieldByName('LINHA').AsString;
      Valornf_Col.Text := QRel.FieldByName('COLUNA').AsString;
    end;

    if QRel.FieldByName('CAMPO').AsString = 'FATURA' then
    begin
      Fatura_Lin.Text := QRel.FieldByName('LINHA').AsString;
      Fatura_Col.Text := QRel.FieldByName('COLUNA').AsString;
    end;

    if QRel.FieldByName('CAMPO').AsString = 'VALORDP' then
    begin
      Valordp_Lin.Text := QRel.FieldByName('LINHA').AsString;
      Valordp_Col.Text := QRel.FieldByName('COLUNA').AsString;
    end;

    if QRel.FieldByName('CAMPO').AsString = 'NUMDP' then
    begin
      Numdp_Lin.Text := QRel.FieldByName('LINHA').AsString;
      Numdp_Col.Text := QRel.FieldByName('COLUNA').AsString;
    end;

    if QRel.FieldByName('CAMPO').AsString = 'VENCIMENTO' then
    begin
      Vencimento_Lin.Text := QRel.FieldByName('LINHA').AsString;
      Vencimento_Col.Text := QRel.FieldByName('COLUNA').AsString;
    end;

    if QRel.FieldByName('CAMPO').AsString = 'SACADO' then
    begin
      Sacado_Lin.Text := QRel.FieldByName('LINHA').AsString;
      Sacado_Col.Text := QRel.FieldByName('COLUNA').AsString;
    end;

    if QRel.FieldByName('CAMPO').AsString = 'ENDERECO' then
    begin
      Endereco_lin.Text := QRel.FieldByName('LINHA').AsString;
      Endereco_Col.Text := QRel.FieldByName('COLUNA').AsString;
    end;

    if QRel.FieldByName('CAMPO').AsString = 'MUNICIPIO' then
    begin
      Municipio_Lin.Text := QRel.FieldByName('LINHA').AsString;
      Municipio_Col.Text := QRel.FieldByName('COLUNA').AsString;
    end;

    if QRel.FieldByName('CAMPO').AsString = 'UF_CLI' then
    begin
      Estado_Lin.Text := QRel.FieldByName('LINHA').AsString;
      Estado_Col.Text := QRel.FieldByName('COLUNA').AsString;
    end;

    if QRel.FieldByName('CAMPO').AsString = 'CEP' then
    begin
      Cep_Lin.Text := QRel.FieldByName('LINHA').AsString;
      Cep_Col.Text := QRel.FieldByName('COLUNA').AsString;
    end;

    if QRel.FieldByName('CAMPO').AsString = 'PRACA' then
    begin
      Praca_Lin.Text := QRel.FieldByName('LINHA').AsString;
      Praca_Col.Text := QRel.FieldByName('COLUNA').AsString;
    end;

    if QRel.FieldByName('CAMPO').AsString = 'CPFCNPJ' then
    begin
      Cpf_Lin.Text := QRel.FieldByName('LINHA').AsString;
      Cpf_Col.Text := QRel.FieldByName('COLUNA').AsString;
    end;

    if QRel.FieldByName('CAMPO').AsString = 'INCEST' then
    begin
      Incest_Lin.Text := QRel.FieldByName('LINHA').AsString;
      Incest_Col.Text := QRel.FieldByName('COLUNA').AsString;
    end;

    if QRel.FieldByName('CAMPO').AsString = 'EXTENSO_1' then
    begin
      Extenso_Lin.Text := QRel.FieldByName('LINHA').AsString;
      Extenso_Col.Text := QRel.FieldByName('COLUNA').AsString;
    end;

    if QRel.FieldByName('CAMPO').AsString = 'INSTRU_1' then
    begin
      Observa_Lin.Text := QRel.FieldByName('LINHA').AsString;
      Observa_Col.Text := QRel.FieldByName('COLUNA').AsString;
      Observa_Tam.Text := QRel.FieldByName('TAMANHO').AsString;
    end;
    
    if QRel.FieldByName('CAMPO').AsString = 'FIM' then
      Ult_Lin.Text := QRel.FieldByName('LINHA').AsString;

    Application.ProcessMessages;
    QRel.Next;
  end;
end;

end.
