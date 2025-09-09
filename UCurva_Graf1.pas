unit UCurva_Graf1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ExtCtrls, StdCtrls, Buttons, VclTee.TeeGDIPlus, VCLTee.TeEngine,
  VCLTee.Series, VCLTee.TeeProcs, VCLTee.Chart, VCLTee.DBChart;

type
  TFrmCurva_Graf1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBChart1: TDBChart;
    Series1: TFastLineSeries;
    PrintDialog1: TPrintDialog;
    btnRetorna: TBitBtn;
    procedure DBChart1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCurva_Graf1: TFrmCurva_Graf1;

implementation

uses
  UCurva_ABC;

{$R *.DFM}

procedure TFrmCurva_Graf1.DBChart1Click(Sender: TObject);
begin
  if PrintDialog1.Execute then
    DBChart1.Print;
end;

end.
