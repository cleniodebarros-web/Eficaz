unit UTestSync;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, Vcl.Bind.Grid, System.Rtti,
  System.Bindings.Outputs, Vcl.Bind.Editors, Vcl.StdCtrls, Data.Bind.Components,
  Data.Bind.Grid, Vcl.Grids, Data.Bind.DBScope, Data.DB, Vcl.DBGrids,
  Vcl.ComCtrls, Vcl.Samples.Spin,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.ExtCtrls, FireDAC.Phys, FireDAC.Phys.Oracle;



 { FireDAC.Stan.Error,FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Comp.UI, FireDAC.Phys.ODBCBase,
  FireDAC.Phys.MSSQL, Vcl.ExtCtrls, FireDAC.VCLUI.Async,FireDAC.VCLUI.Error, FireDAC.Phys.PG,
  FireDAC.Moni.Base, FireDAC.Moni.Custom;}


type
  TFrmTeste = class(TForm)
    FDQuery_original: TFDQuery;
    Open: TButton;
    Label1: TLabel;
    Timer1: TTimer;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    RadioGroup1: TRadioGroup;
    ProgressBar1: TProgressBar;
    FDQuery1: TFDQuery;
    DataSource2: TDataSource;
    FDQuery2: TFDQuery;
    FDPhysOracleDriverLink1: TFDPhysOracleDriverLink;
    procedure OpenClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FDQuery_originalAfterGetRecords(DataSet: TFDDataSet);
    procedure FDQuery_originalBeforeOpen(DataSet: TDataSet);
    procedure FDQuery_originalAfterOpen(DataSet: TDataSet);
    procedure FDQuery1AfterOpen(DataSet: TDataSet);
    procedure FDQuery1AfterGetRecords(DataSet: TFDDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTeste: TFrmTeste;

implementation

uses
UPrincipal, UData;

{$R *.dfm}

procedure TFrmTeste.FDQuery1AfterGetRecords(DataSet: TFDDataSet);
begin
if RadioGroup1.ItemIndex = 1 then
  begin
    ProgressBar1.Style := pbstNormal;
  end;
end;

procedure TFrmTeste.FDQuery1AfterOpen(DataSet: TDataSet);
begin
if RadioGroup1.ItemIndex = 1 then
  begin

   // FDQuery1.ResourceOptions.CmdExecMode := amBlocking;
  end;

  DataSource1.DataSet := FDQuery1;
  ShowMessage(IntToStr(FDQuery1.FieldCount));
  FDQuery1.ResourceOptions.CmdExecMode := amBlocking;


end;

procedure TFrmTeste.FDQuery_originalAfterGetRecords(DataSet: TFDDataSet);
begin
  if RadioGroup1.ItemIndex = 1 then
  begin
    ProgressBar1.Style := pbstNormal;
  end;
end;

procedure TFrmTeste.FDQuery_originalAfterOpen(DataSet: TDataSet);
begin
  if RadioGroup1.ItemIndex = 1 then
  begin
    DataSource1.DataSet := FDQuery1;
    FDQuery1.ResourceOptions.CmdExecMode := amBlocking;
  end;
end;

procedure TFrmTeste.FDQuery_originalBeforeOpen(DataSet: TDataSet);
begin
  if RadioGroup1.ItemIndex = 1 then
  begin
    DataSource1.DataSet := nil;
  end;
end;

procedure TFrmTeste.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action := caFree;
end;

procedure TFrmTeste.OpenClick(Sender: TObject);
begin
  {case RadioGroup1.ItemIndex of
    0:
      begin
        FDQuery1.ResourceOptions.CmdExecMode := amBlocking;
        FDQuery1.ResourceOptions.CmdExecTimeout := 4294967295;
      end;
    1:
      begin
        FDQuery1.ResourceOptions.CmdExecMode := amAsync;
      end;
    2:
      begin
        FDQuery1.ResourceOptions.CmdExecMode := amCancelDialog;
      end;
  end;
  if FDQuery1.Active then
  begin
    FDQuery1.Close();
  end;
  if RadioGroup1.ItemIndex = 1 then
  begin
    FDQuery1.SQL.Clear;
    FDQuery1.SQL.Add('select produto_id, descricao from produtos where descricao like :descricao');
    FDQuery1.ParamByName('descricao').AsString := '%' + 'AR' + '%';

    ProgressBar1.Style := pbstMarquee;
  end
  else
  begin
    FDQuery1.SQL.Clear;
    FDQuery1.SQL.Add('select cliente_id, nome from clientes where nome like :nome');
    FDQuery1.ParamByName('nome').AsString := '%' + 'CAR' + '%';
  end;}

  FDQuery1.ResourceOptions.CmdExecMode := amAsync;

  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('select produto_id, descricao from produtos where descricao like :descricao');
  FDQuery1.ParamByName('descricao').AsString := '%' + 'AR' + '%';

  FDQuery1.Open();




end;

procedure TFrmTeste.Timer1Timer(Sender: TObject);
begin
  Label1.Caption := TimeToStr(Now());
end;

end.
