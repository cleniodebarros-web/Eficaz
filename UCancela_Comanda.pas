unit UCancela_Comanda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, Grids, DBGrids, IBQuery, StdCtrls, Buttons,
  ExtCtrls, ComCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrmCancela_Comanda = class(TForm)
    Panel1: TPanel;
    btnRetorna: TBitBtn;
    DataTabela: TDataSource;
    DBGrid1: TDBGrid;
    StatusBar1: TStatusBar;
    QRel: TFDQuery;
    QTabela: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCancela_Comanda: TFrmCancela_Comanda;

  procedure Exclui_Comanda(Comanda: String);

implementation

uses
  UData, UPrincipal;

{$R *.dfm}

procedure Exclui_Comanda(Comanda: String);
begin
  Application.CreateForm(TFrmCancela_Comanda, FrmCancela_Comanda);
  try
    FrmCancela_Comanda.QTabela.Sql.Clear;
    FrmCancela_Comanda.QTabela.Sql.Add('SELECT ORCITENS.*, PRODUTOS.COD_BARRA');
    FrmCancela_Comanda.QTabela.Sql.Add('FROM ORCITENS');
    FrmCancela_Comanda.QTabela.Sql.Add('INNER JOIN ORCAMENTOS');
    FrmCancela_Comanda.QTabela.Sql.Add('ON (ORCITENS.ORCAMENTO_ID = ORCAMENTOS.ORCAMENTO_ID)');
    FrmCancela_Comanda.QTabela.Sql.Add('INNER JOIN PRODUTOS');
    FrmCancela_Comanda.QTabela.Sql.Add('ON (ORCITENS.PRODUTO_ID = PRODUTOS.PRODUTO_ID)');
    FrmCancela_Comanda.QTabela.Sql.Add('WHERE');
    FrmCancela_Comanda.QTabela.Sql.Add('(ORCAMENTOS.COMANDA = :COMANDA)');
    FrmCancela_Comanda.QTabela.Sql.Add('AND (ORCAMENTOS.EMPRESA_ID = :EMPRESA_ID)');

    FrmCancela_Comanda.QTabela.ParamByName('COMANDA').AsString     := Comanda;
    FrmCancela_Comanda.QTabela.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;

    FrmCancela_Comanda.QTabela.Prepare;
    FrmCancela_Comanda.QTabela.Open;

    FrmCancela_Comanda.ShowModal;
  finally
    FrmCancela_Comanda.Release;
  end;
end;

procedure TFrmCancela_Comanda.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    QRel.Sql.Clear;
    QRel.Sql.Add('DELETE FROM ORCITENS');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(ORCAMENTO_ID = :ORCAMENTO_ID)');
    QRel.Sql.Add('AND (PRODUTO_ID = :PRODUTO_ID)');

    QRel.ParamByName('ORCAMENTO_ID').AsInteger := QTabela.FieldByName('ORCAMENTO_ID').AsInteger;
    QRel.ParamByName('PRODUTO_ID').AsInteger   := QTabela.FieldByName('PRODUTO_ID').AsInteger;

    QRel.Prepare;
    QRel.ExecSql;

    QTabela.Close;

    QTabela.Prepare;
    QTabela.Open;
  end;
end;

procedure TFrmCancela_Comanda.FormCreate(Sender: TObject);
begin
  DBGrid1.Columns[0].Width := 70;
  DBGrid1.Columns[1].Width := 250;
  DBGrid1.Columns[2].Width := 90;
  DBGrid1.Columns[3].Width := 90;
  DBGrid1.Columns[4].Width := 90;
end;

end.
