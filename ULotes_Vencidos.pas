unit ULotes_Vencidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, IBCustomDataSet, IBQuery, StdCtrls, Buttons, Grids,
  DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmLotes_Vencidos = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    btnRetorna: TBitBtn;
    DataTabela: TDataSource;
    QTabela: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLotes_Vencidos: TFrmLotes_Vencidos;
  Funcionario: Integer;

  procedure Ver_Agenda_Ordem_Servico(Tecnico: Integer);

implementation

uses
  UData;

{$R *.dfm}

procedure Ver_Agenda_Ordem_Servico(Tecnico: Integer);
begin
  Funcionario := Tecnico;

  Application.CreateForm(TFrmAgenda_Ordem_Servico, FrmAgenda_Ordem_Servico);
  try
    FrmAgenda_Ordem_Servico.ShowModal;
  finally
    FrmAgenda_Ordem_Servico.Release;
  end;
end;

procedure TFrmLotes_Vencidos.DBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    FrmAgenda_Ordem_Servico.ModalResult := mrOK;
    
  if Key = #27 then
    FrmAgenda_Ordem_Servico.ModalResult := mrCancel;
end;

procedure TFrmLotes_Vencidos.FormCreate(Sender: TObject);
begin
  QTabela.Close;

  QTabela.ParamByName('FUNCIONARIO').AsInteger := Funcionario;

  QTabela.Prepare;
  QTabela.Open;

  DBGrid1.Columns[0].Width := 83;
  DBGrid1.Columns[1].Width := 34;
  DBGrid1.Columns[2].Width := 335;
end;

end.
