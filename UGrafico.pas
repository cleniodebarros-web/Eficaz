unit UGrafico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, DBTables, StdCtrls, Buttons, ExtCtrls, VclTee.TeeGDIPlus,
  VCLTee.TeEngine, VCLTee.Series,  VCLTee.TeeProcs, VCLTee.Chart, VCLTee.DBChart,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmGrafico_Pie = class(TForm)
    Panel1: TPanel;
    PrintDialog1: TPrintDialog;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBChart1: TDBChart;
    Series1: TPieSeries;
    TabSheet2: TTabSheet;
    DBChart2: TDBChart;
    BarSeries1: TPieSeries;
    TabSheet3: TTabSheet;
    DBChart3: TDBChart;
    BarSeries2: TPieSeries;
    btnRetorna: TBitBtn;
    Table3: TFDMemTable;
    table1: TFDMemTable;
    Table2: TFDMemTable;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmGrafico_Pie: TFrmGrafico_Pie;

implementation

{$R *.dfm}

end.
