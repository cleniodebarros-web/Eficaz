unit UEstoque_Parcial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Mask, rxToolEdit, rxCurrEdit;

type
  TFrmEstoque_Parcial = class(TForm)
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    btnRetorna: TBitBtn;
    Bevel1: TBevel;
    Estoque: TRxCalcEdit;
    Pedidos: TRxCalcEdit;
    Orcamentos: TRxCalcEdit;
    Parcial: TRxCalcEdit;
    DT_PEDIDO: TDateEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEstoque_Parcial: TFrmEstoque_Parcial;

implementation

{$R *.dfm}

end.
