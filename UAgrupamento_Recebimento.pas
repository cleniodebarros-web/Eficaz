unit UAgrupamento_Recebimento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, DB, IBCustomDataSet,
  IBQuery;

type
  TFrmAgrupamento_Recebimento = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    btnRetorna: TBitBtn;
    DataOrcamento: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAgrupamento_Recebimento: TFrmAgrupamento_Recebimento;

implementation

uses
  UTrans_Recebimento_Lote, UData, UAgrupamento_Orcamentos, UPrincipal;

{$R *.dfm}

procedure TFrmAgrupamento_Recebimento.FormCreate(Sender: TObject);
begin
  DBGrid1.Columns[0].Width := 64;
  DBGrid1.Columns[1].Width := 45;
  DBGrid1.Columns[2].Width := 145;
  DBGrid1.Columns[3].Width := 90;
  DBGrid1.Columns[4].Width := 90;
  DBGrid1.Columns[5].Width := 90;
  DBGrid1.Columns[6].Width := 90;
  DBGrid1.Columns[7].Width := 95;
end;

procedure TFrmAgrupamento_Recebimento.FormShow(Sender: TObject);
begin
  if LeIni(Arq_Ini, 'Sistema', 'Organizar Janelas Automaticamente') = 'True' then
    FrmPrincipal.Cascade;
end;

end.
