unit UParcelamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Mask, rxToolEdit, rxCurrEdit, DB,
  IBCustomDataSet, IBQuery, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrmParcelamento = class(TForm)
    Label1: TLabel;
    Parcelas: TCurrencyEdit;
    Label3: TLabel;
    Dias: TCurrencyEdit;
    Label2: TLabel;
    Caixa_Banco: TCurrencyEdit;
    btnCaixa_Banco: TSpeedButton;
    Bevel1: TBevel;
    btnExecuta: TBitBtn;
    btnRetorna: TBitBtn;
    QBanco: TFDQuery;
    Label4: TLabel;
    Desc_Boleto: TCurrencyEdit;
    chk_acrescimo: TCheckBox;
    procedure Caixa_BancoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCaixa_BancoClick(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure ParcelasExit(Sender: TObject);
    procedure ParcelasEnter(Sender: TObject);
    procedure chk_acrescimoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmParcelamento: TFrmParcelamento;

implementation

uses
  UConsulta, UPrincipal;

{$R *.dfm}

procedure TFrmParcelamento.btnCaixa_BancoClick(Sender: TObject);
begin
  try
    Caixa_Banco.Value := GetConsulta('BANCOS', 0, 0, StrToInt(Caixa_Banco.Text));
  except
    Caixa_Banco.Value := GetConsulta('BANCOS', 0, 0, 0);
  end;
end;

procedure TFrmParcelamento.btnExecutaClick(Sender: TObject);
begin
  QBanco.Close;

  QBanco.ParamByName('BANCO_ID').AsInteger := StrToInt(Caixa_Banco.Text);

  QBanco.Prepare;
  QBanco.Open;

  if (Caixa_Banco.Value > 0) and (QBanco.IsEmpty) then
  begin
    Application.MessageBox('Caixa/Banco inexistente', PChar(Msg_Title), mb_IconStop);

    Caixa_Banco.Color := clYellow;
    Caixa_Banco.SetFocus;

    exit;
  end;

  ModalResult := mrOk;
end;

procedure TFrmParcelamento.Caixa_BancoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = Caixa_Banco) then
    btnCaixa_BancoClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmParcelamento.chk_acrescimoClick(Sender: TObject);
begin

if chk_acrescimo.Checked then
label4.Caption := 'Acréscimo no Boleto (Compras)'
Else
label4.Caption := 'Desconto no Boleto (Compras)'

end;

procedure TFrmParcelamento.FormShow(Sender: TObject);
begin
if Desc_Boleto.Value < 0 then
Begin
Desc_Boleto.Value :=Desc_Boleto.Value * -1;
chk_acrescimo.Checked := True;
label4.Caption := 'Acréscimo no Boleto (Compras)';
End;

end;

procedure TFrmParcelamento.ParcelasEnter(Sender: TObject);
begin
  Caixa_Banco.Value      := 0;
  Caixa_Banco.ReadOnly   := True;
  btnCaixa_Banco.Enabled := False;
end;

procedure TFrmParcelamento.ParcelasExit(Sender: TObject);
begin
  if Parcelas.Value > 1 then
  begin
    Caixa_Banco.ReadOnly   := False;
    btnCaixa_Banco.Enabled := True;
  end
  else
  begin
    Caixa_Banco.ReadOnly   := True;
    btnCaixa_Banco.Enabled := False;
  end;
end;

end.
