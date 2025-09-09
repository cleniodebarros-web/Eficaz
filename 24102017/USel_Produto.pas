unit USel_Produto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DBCtrls, Buttons, Mask, rxToolEdit, rxCurrEdit,
  DB, IBCustomDataSet, IBQuery, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrmSel_Produto = class(TForm)
    Label2: TLabel;
    Produto: TCurrencyEdit;
    btnProduto: TSpeedButton;
    DBText1: TDBText;
    Bevel1: TBevel;
    DataProduto: TDataSource;
    Label1: TLabel;
    btnExecuta: TBitBtn;
    btnRetorna: TBitBtn;
    QProduto: TFDQuery;
    BitBtn1: TBitBtn;
    procedure btnProdutoClick(Sender: TObject);
    procedure ProdutoChange(Sender: TObject);
    procedure ProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SearchProduto;
  end;

var
  FrmSel_Produto: TFrmSel_Produto;
  function Seleciona_Produto_Xml(Produto: String): Integer;

implementation

uses
  UPrincipal, UConsulta, UData, UCadastro_Produtos,UTrans_Compra_Estoque;

{$R *.dfm}

function Seleciona_Produto_Xml(Produto: String): Integer;
begin
  Application.CreateForm(TFrmSel_Produto, FrmSel_Produto);
  try
    FrmSel_Produto.Label1.Caption := Copy(Produto,1,60);

    FrmSel_Produto.ShowModal;

    if FrmSel_Produto.Produto.Value > 0 then
      Result := StrToInt(FrmSel_Produto.Produto.Text)
    else
      Result := 0;
  finally
    FrmSel_Produto.Release;
  end;
end;

procedure TFrmSel_Produto.SearchProduto;
begin
  QProduto.Close;
  QProduto.ParamByName('PRODUTO_ID').AsInteger := StrToInt(Produto.Text);
  QProduto.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  QProduto.Prepare;
  QProduto.Open;

  if QProduto.IsEmpty then
    btnExecuta.Enabled := False
  else
    btnExecuta.Enabled := True;
end;

procedure TFrmSel_Produto.BitBtn1Click(Sender: TObject);
begin
Seleciona_Produtos_Nfe := False;
end;

procedure TFrmSel_Produto.btnProdutoClick(Sender: TObject);
begin
  try
    //MODIFICADO DIA 02-10-2017 a pedido de Regivaldo.
    //Produto.Value := GetConsulta('ESTOQUE', 0, 0, StrToInt(Produto.Text));
    Produto.Value := GetConsulta('ESTOQUE', FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger, 0, StrToInt(Produto.Text));

  except
    //Produto.Value := GetConsulta('ESTOQUE', 0, 0, 0);
    Produto.Value := GetConsulta('ESTOQUE', FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger, 0, 0);
  end;
end;

procedure TFrmSel_Produto.ProdutoChange(Sender: TObject);
begin
  if Produto.Value > 0 then
    SearchProduto;
end;

procedure TFrmSel_Produto.ProdutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F2) and (Sender = Produto) then
  begin
    Application.CreateForm(TFrmCadastro_Produtos, FrmCadastro_Produtos);
    try
      FrmCadastro_Produtos.ShowModal;
      Produto.Value := FrmCadastro_Produtos.QTabela.FieldByName('PRODUTO_ID').AsInteger;
    finally
      FrmCadastro_Produtos.Release;
    end;
  end;

  if (Key = Vk_F7) and (Sender = Produto) then
    btnProdutoClick(Self);

  if (Key = Vk_Return) and (not QProduto.IsEmpty) then
    Perform(Wm_NextDlgctl, 0, 0);
end;

end.
