unit UDados_Itens_Nfe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  TFrmDados_Itens_Nfe = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDados_Itens_Nfe: TFrmDados_Itens_Nfe;
  Transacao, Produto: Integer;
  procedure Complemento_Itens(Transacao_Id, Produto_Id: Integer);

implementation

uses
  UPrincipal, UData;

{$R *.dfm}

procedure Complemento_Itens(Transacao_Id, Produto_Id: Integer);
begin
  Transacao := Transacao_Id;
  Produto := Produto_Id;
  Application.CreateForm(TFrmDados_Itens_Nfe, FrmDados_Itens_Nfe);
  try
    FrmDados_Itens_Nfe.ShowModal;
  finally
    FrmDados_Itens_Nfe.Release;
  end;
end;

end.
