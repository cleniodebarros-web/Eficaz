unit UFornecedor_Cotacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Mask, rxToolEdit, rxCurrEdit;

type
  TFrmFornecedor_Cotacao = class(TForm)
    Label2: TLabel;
    Fornecedor: TCurrencyEdit;
    btnFornecedor: TSpeedButton;
    Bevel1: TBevel;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    procedure btnFornecedorClick(Sender: TObject);
    procedure FornecedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFornecedor_Cotacao: TFrmFornecedor_Cotacao;

implementation

uses
  UConsulta;

{$R *.dfm}

procedure TFrmFornecedor_Cotacao.btnFornecedorClick(Sender: TObject);
begin
  try
    Fornecedor.Value := GetConsulta('FORNECEDORES', 0, 0, StrToInt(Fornecedor.Text));
  except
    Fornecedor.Value := GetConsulta('FORNECEDORES', 0, 0, 0);
  end;
end;

procedure TFrmFornecedor_Cotacao.FornecedorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_F7 then
    btnFornecedorClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

end.
