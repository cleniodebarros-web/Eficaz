unit UConfig_Etiqueta_ttp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, rxToolEdit, rxCurrEdit, ExtCtrls, DB,
  IBCustomDataSet, IBQuery, Buttons;

type
  TFrmConfig_Etiqueta_ttp = class(TForm)
    Label107: TLabel;
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
    Bevel3: TBevel;
    Bevel2: TBevel;
    Col_Direita: TCurrencyEdit;
    Linha_Id_Etiqueta_Superior: TCurrencyEdit;
    Linha_Desc_Etiqueta_Superior: TCurrencyEdit;
    Linha_Preco_Etiqueta_Superior: TCurrencyEdit;
    Linha_Cod_Barra_Etiq_Superior: TCurrencyEdit;
    Linha_Barra_Etiq_Superior: TCurrencyEdit;
    Linha_ID_Etiq_Inferior: TCurrencyEdit;
    Linha_Desc_Etiq_Inferior: TCurrencyEdit;
    Linha_Preco_Etiq_Inferior: TCurrencyEdit;
    Col_Esquerda: TCurrencyEdit;
    QRel: TIBQuery;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRetornaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure Col_EsquerdaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GravaConfig(Linha, Coluna, Campo, Tamanho: String);
  end;

var
  FrmConfig_Etiqueta_ttp: TFrmConfig_Etiqueta_ttp;

implementation

uses
  UPrincipal, UData;

{$R *.dfm}

procedure TFrmConfig_Etiqueta_ttp.GravaConfig(Linha, Coluna, Campo, Tamanho: String);
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

procedure TFrmConfig_Etiqueta_ttp.Col_EsquerdaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmConfig_Etiqueta_ttp.btnExecutaClick(Sender: TObject);
begin
  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;


    GravaIni(Arq_Ini, 'TSC TTP-244 Plus', 'Coluna Esquerda', Col_Esquerda.Text);
    GravaIni(Arq_Ini, 'TSC TTP-244 Plus', 'Coluna Direita', Col_Direita.Text);
    GravaIni(Arq_Ini, 'TSC TTP-244 Plus', 'Linha ID Etiq. Superior', Linha_Id_Etiqueta_Superior.Text);
    GravaIni(Arq_Ini, 'TSC TTP-244 Plus', 'Linha Descr. Etiq. Superior', Linha_Desc_Etiqueta_Superior.Text);
    GravaIni(Arq_Ini, 'TSC TTP-244 Plus', 'Linha Preço Etiq. Superior', Linha_Preco_Etiqueta_Superior.Text);
    GravaIni(Arq_Ini, 'TSC TTP-244 Plus', 'Linha Cód. Barra Etiq. Superior', Linha_Cod_Barra_Etiq_Superior.Text);
    GravaIni(Arq_Ini, 'TSC TTP-244 Plus', 'Linha Barra Etiq. Superior', Linha_Barra_Etiq_Superior.Text);
    GravaIni(Arq_Ini, 'TSC TTP-244 Plus', 'Linha ID Etiq. Inferior', Linha_ID_Etiq_Inferior.Text);
    GravaIni(Arq_Ini, 'TSC TTP-244 Plus', 'Linha Descr. Etiq. Inferior', Linha_Desc_Etiq_Inferior.Text);
    GravaIni(Arq_Ini, 'TSC TTP-244 Plus', 'Linha Preço Etiq. Inferior', Linha_Preco_Etiq_Inferior.Text);

    Application.MessageBox('Operação realizada com sucesso', PChar(Msg_Title), mb_IconInformation);
    Close;
  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;

procedure TFrmConfig_Etiqueta_ttp.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmConfig_Etiqueta_ttp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmConfig_Etiqueta_ttp.FormShow(Sender: TObject);
Begin
  Col_Esquerda.Text                  := LeIni(Arq_Ini, 'TSC TTP-244 Plus', 'Coluna Esquerda');
  Col_Direita.Text                   := LeIni(Arq_Ini, 'TSC TTP-244 Plus', 'Coluna Direita');
  Linha_Id_Etiqueta_Superior.Text    := LeIni(Arq_Ini, 'TSC TTP-244 Plus', 'Linha ID Etiq. Superior');
  Linha_Desc_Etiqueta_Superior.Text  := LeIni(Arq_Ini, 'TSC TTP-244 Plus', 'Linha Descr. Etiq. Superior');
  Linha_Preco_Etiqueta_Superior.Text := LeIni(Arq_Ini, 'TSC TTP-244 Plus', 'Linha Preço Etiq. Superior');
  Linha_Cod_Barra_Etiq_Superior.Text := LeIni(Arq_Ini, 'TSC TTP-244 Plus', 'Linha Cód. Barra Etiq. Superior');
  Linha_Barra_Etiq_Superior.Text     := LeIni(Arq_Ini, 'TSC TTP-244 Plus', 'Linha Barra Etiq. Superior');
  Linha_ID_Etiq_Inferior.Text        := LeIni(Arq_Ini, 'TSC TTP-244 Plus', 'Linha ID Etiq. Inferior');
  Linha_Desc_Etiq_Inferior.Text      := LeIni(Arq_Ini, 'TSC TTP-244 Plus', 'Linha Descr. Etiq. Inferior');
  Linha_Preco_Etiq_Inferior.Text     := LeIni(Arq_Ini, 'TSC TTP-244 Plus', 'Linha Preço Etiq. Inferior');
End;

end.
