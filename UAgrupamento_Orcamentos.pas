unit UAgrupamento_Orcamentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, DB, IBCustomDataSet,
  IBQuery;

type
  TFrmAgrupamento_Orcamentos = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    btnRetorna: TBitBtn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAgrupamento_Orcamentos: TFrmAgrupamento_Orcamentos;

implementation

uses
  UAgrupamento, UData;

{$R *.dfm}

procedure TFrmAgrupamento_Orcamentos.FormCreate(Sender: TObject);
begin
  DBGrid1.Columns[0].Width := 64;
  DBGrid1.Columns[1].Width := 64;
  DBGrid1.Columns[2].Width := 304;
  DBGrid1.Columns[3].Width := 91;
end;

end.
