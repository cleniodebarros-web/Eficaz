unit UConfig_Boleto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Spin, ComCtrls, DB, DBTables, IBCustomDataSet,
  IBQuery, Mask, rxToolEdit, rxCurrEdit, ACBrBoleto, ACBrBoletoFCFortesFr,
  ACBrBase;

type
  TFrmConfig_Boleto = class(TForm)
    Panel1: TPanel;
    Imprimir_Mens_Padrao: TCheckBox;
    Label2: TLabel;
    Dir_Arq_remessa: TEdit;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    Label5: TLabel;
    Dir_Arq_Retorno: TEdit;
    Nome_Arq_Remessa: TEdit;
    Nome_Arq_Retorno: TEdit;
    Label22: TLabel;
    Label25: TLabel;
    Layout_Remessa: TComboBox;
    Label26: TLabel;
    Label27: TLabel;
    Dir_Arq_Logo: TEdit;
    Label28: TLabel;
    Layout_Impressao: TComboBox;
    Label30: TLabel;
    Num_Copias: TCurrencyEdit;
    Label21: TLabel;
    Resp_Emissao: TComboBox;
    Label1: TLabel;
    Nome_Arquivo: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRetornaClick(Sender: TObject);
    procedure Nome_BancoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Numero_BancoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConfig_Boleto: TFrmConfig_Boleto;

implementation

uses
  UPrincipal;

{$R *.DFM}

procedure TFrmConfig_Boleto.FormCreate(Sender: TObject);
begin
  Resp_Emissao.Text     := LeIni(Arq_Ini, 'Boleto', 'Responsável Emissão');
  Dir_Arq_Remessa.Text  := LeIni(Arq_Ini, 'Boleto', 'Dir. Arq. Remessa');
  Dir_Arq_Retorno.Text  := LeIni(Arq_Ini, 'Boleto', 'Dir. Arq. Retorno');
  Nome_Arq_Remessa.Text := LeIni(Arq_Ini, 'Boleto', 'Nome Arq. Remessa');
  Nome_Arq_Retorno.Text := LeIni(Arq_Ini, 'Boleto', 'Nome Arq. Retorno');
  Dir_Arq_Logo.Text     := LeIni(Arq_Ini, 'Boleto', 'Dir. Arq. Logo');

  if LeIni(Arq_Ini, 'Boleto', 'Número Cópias') <> '' then
    Num_Copias.Value := StrToInt(LeIni(Arq_Ini, 'Boleto', 'Número Cópias'));

  if LeIni(Arq_Ini, 'Boleto', 'Imprimir Mensagem Padrão') = 'True' then
    Imprimir_Mens_Padrao.Checked := True
  else
    Imprimir_Mens_Padrao.Checked := False;

  Layout_Remessa.Text   := LeIni(Arq_Ini, 'Boleto', 'Layout Remessa');
  Layout_Impressao.Text := LeIni(Arq_Ini, 'Boleto', 'Layout Impressão');
  Nome_Arquivo.Text     := LeIni(Arq_Ini, 'Boleto', 'Nome Arquivo');
end;

procedure TFrmConfig_Boleto.Nome_BancoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmConfig_Boleto.Numero_BancoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmConfig_Boleto.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmConfig_Boleto.btnExecutaClick(Sender: TObject);
begin
  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    GravaIni(Arq_Ini, 'Boleto', 'Responsável Emissão', Resp_Emissao.Text);
    GravaIni(Arq_Ini, 'Boleto', 'Dir. Arq. Remessa', Dir_Arq_Remessa.Text);
    GravaIni(Arq_Ini, 'Boleto', 'Dir. Arq. Retorno', Dir_Arq_Retorno.Text);
    GravaIni(Arq_Ini, 'Boleto', 'Nome Arq. Remessa', Nome_Arq_Remessa.Text);
    GravaIni(Arq_Ini, 'Boleto', 'Nome Arq. Retorno', Nome_Arq_Retorno.Text);
    GravaIni(Arq_Ini, 'Boleto', 'Dir. Arq. Logo', Dir_Arq_Logo.Text);
    GravaIni(Arq_Ini, 'Boleto', 'Número Cópias', Num_Copias.Text);

    if Imprimir_Mens_Padrao.Checked then
      GravaIni(Arq_Ini, 'Boleto', 'Imprimir Mensagem Padrão', 'True')
    else
      GravaIni(Arq_Ini, 'Boleto', 'Imprimir Mensagem Padrão', 'False');

    GravaIni(Arq_Ini, 'Boleto', 'Layout Remessa', Layout_Remessa.Text);
    GravaIni(Arq_Ini, 'Boleto', 'Layout Impressão', Layout_Impressao.Text);
    GravaIni(Arq_Ini, 'Boleto', 'Nome Arquivo', Nome_Arquivo.Text);

    Close;
  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;

procedure TFrmConfig_Boleto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
