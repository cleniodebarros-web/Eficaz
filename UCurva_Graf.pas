unit UCurva_Graf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons,DBTables, ComCtrls, ExtCtrls, VclTee.TeeGDIPlus, VCLTee.TeEngine,
  VCLTee.Series, VCLTee.TeeProcs, VCLTee.Chart, VCLTee.DBChart, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmCurva_Graf = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    DBChart1: TDBChart;
    DBChart2: TDBChart;
    DBChart3: TDBChart;
    Series1: TPieSeries;
    BarSeries1: TPieSeries;
    BarSeries2: TPieSeries;
    PrintDialog1: TPrintDialog;
    btnRetorna: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DBChart1Click(Sender: TObject);
    procedure DBChart2Click(Sender: TObject);
    procedure DBChart3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCurva_Graf: TFrmCurva_Graf;

implementation

uses
  UCurva_ABC;

{$R *.DFM}

procedure TFrmCurva_Graf.FormCreate(Sender: TObject);
begin
  //Table1.DatabaseName := ExtractFilePath(ParamStr(0));
  //Table2.DatabaseName := ExtractFilePath(ParamStr(0));
  //Table3.DatabaseName := ExtractFilePath(ParamStr(0));

 // Table1.Open;
 // Table2.Open;
 // Table3.Open;


  if Id_Opcao = 4 then
  begin
    DBChart1.Title.Text.Add('CURVA "A" DO PATR X VR. TOTAL - ' + FormatFloat('#,##0.00', VL1));
    DBChart2.Title.Text.Add('CURVA "B" DO PATR X VR. TOTAL - ' + FormatFloat('#,##0.00', VL1));
    DBChart3.Title.Text.Add('CURVA "C" DO PATR X VR. TOTAL - ' + FormatFloat('#,##0.00', VL1));
  end;

  if Id_Opcao = 5 then
  begin
    DBChart1.Title.Text.Add('CURVA "A" DO FAT X PRODUTO - ' + FormatFloat('#,##0.00', VL1));
    DBChart2.Title.Text.Add('CURVA "B" DO FAT X PRODUTO - ' + FormatFloat('#,##0.00', VL1));
    DBChart3.Title.Text.Add('CURVA "C" DO FAT X PRODUTO - ' + FormatFloat('#,##0.00', VL1));
  end;

  if Id_Opcao = 6 then
  begin
    DBChart1.Title.Text.Add('CURVA "A" DO FAT X CLIENTE - ' + FormatFloat('#,##0.00', VL1));
    DBChart2.Title.Text.Add('CURVA "B" DO FAT X CLIENTE - ' + FormatFloat('#,##0.00', VL1));
    DBChart3.Title.Text.Add('CURVA "C" DO FAT X CLIENTE - ' + FormatFloat('#,##0.00', VL1));
  end;

  if Id_Opcao = 7 then
  begin
    DBChart1.Title.Text.Add('CURVA "A" DO FAT X VENDEDOR - ' + FormatFloat('#,##0.00', VL1));
    DBChart2.Title.Text.Add('CURVA "B" DO FAT X VENDEDOR - ' + FormatFloat('#,##0.00', VL1));
    DBChart3.Title.Text.Add('CURVA "C" DO FAT X VENDEDOR - ' + FormatFloat('#,##0.00', VL1));
  end;

  if Id_Opcao = 8 then
  begin
    DBChart1.Title.Text.Add('CURVA "A" DAS COMPRAS X PRODUTO - ' + FormatFloat('#,##0.00', VL1));
    DBChart2.Title.Text.Add('CURVA "B" DAS COMPRAS X PRODUTO - ' + FormatFloat('#,##0.00', VL1));
    DBChart3.Title.Text.Add('CURVA "C" DAS COMPRAS X PRODUTO - ' + FormatFloat('#,##0.00', VL1));
  end;

  if Id_Opcao = 9 then
  begin
    DBChart1.Title.Text.Add('CURVA "A" DAS COMPRAS X FORNE - ' + FormatFloat('#,##0.00', VL1));
    DBChart2.Title.Text.Add('CURVA "B" DAS COMPRAS X FORNE - ' + FormatFloat('#,##0.00', VL1));
    DBChart3.Title.Text.Add('CURVA "C" DAS COMPRAS X FORNE - ' + FormatFloat('#,##0.00', VL1));
  end;

  if Id_Opcao = 10 then
  begin
    DBChart1.Title.Text.Add('CURVA "A" DA RECEITA X C. CUSTO - ' + FormatFloat('#,##0.00', VL1));
    DBChart2.Title.Text.Add('CURVA "B" DA RECEITA X C. CUSTO - ' + FormatFloat('#,##0.00', VL1));
    DBChart3.Title.Text.Add('CURVA "C" DA RECEITA X C. CUSTO - ' + FormatFloat('#,##0.00', VL1));
  end;

  if Id_Opcao = 11 then
  begin
    DBChart1.Title.Text.Add('CURVA "A" DA RECEITA X CONTA - ' + FormatFloat('#,##0.00', VL1));
    DBChart2.Title.Text.Add('CURVA "B" DA RECEITA X CONTA - ' + FormatFloat('#,##0.00', VL1));
    DBChart3.Title.Text.Add('CURVA "C" DA RECEITA X CONTA - ' + FormatFloat('#,##0.00', VL1));
  end;

  if Id_Opcao = 12 then
  begin
    DBChart1.Title.Text.Add('CURVA "A" DA DESPESA X C. CUSTO - ' + FormatFloat('#,##0.00', VL1));
    DBChart2.Title.Text.Add('CURVA "B" DA DESPESA X C. CUSTO - ' + FormatFloat('#,##0.00', VL1));
    DBChart3.Title.Text.Add('CURVA "C" DA DESPESA X C. CUSTO - ' + FormatFloat('#,##0.00', VL1));
  end;

  if Id_Opcao = 13 then
  begin
    DBChart1.Title.Text.Add('CURVA "A" DA DESPESA X CONTA - ' + FormatFloat('#,##0.00', VL1));
    DBChart2.Title.Text.Add('CURVA "B" DA DESPESA X CONTA - ' + FormatFloat('#,##0.00', VL1));
    DBChart3.Title.Text.Add('CURVA "C" DA DESPESA X CONTA - ' + FormatFloat('#,##0.00', VL1));
  end;
end;

procedure TFrmCurva_Graf.FormDestroy(Sender: TObject);
begin
 // Table1.Close;
 // Table2.Close;
 // Table3.Close;
end;

procedure TFrmCurva_Graf.DBChart1Click(Sender: TObject);
begin
  if PrintDialog1.Execute then
    DBChart1.Print;
end;

procedure TFrmCurva_Graf.DBChart2Click(Sender: TObject);
begin
  if PrintDialog1.Execute then
    DBChart2.Print;
end;

procedure TFrmCurva_Graf.DBChart3Click(Sender: TObject);
begin
  if PrintDialog1.Execute then
    DBChart3.Print;
end;

end.
