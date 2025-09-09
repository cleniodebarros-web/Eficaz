unit UAgrupamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, DB, IBCustomDataSet,
  IBQuery, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmAgrupamento = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    btnRetorna: TBitBtn;
    DataOrcamento: TDataSource;
    Qrel: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAgrupamento: TFrmAgrupamento;

implementation

uses
  UTrans_Recebimento_Lote, UData, UAgrupamento_Orcamentos, UPrincipal;

{$R *.dfm}

procedure TFrmAgrupamento.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_Return then
  begin
    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT * FROM ORCAMENTOS');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
    QRel.Sql.Add('ORDER BY DT_ORCAMENTO');

    QRel.ParamByName('TRANSACAO_ID').AsInteger := DBGrid1.DataSource.DataSet.FieldByName('TRANSACAO_ID').AsInteger;

    QRel.Prepare;
    QRel.Open;

    if not QRel.IsEmpty then
    begin
      Application.CreateForm(TFrmAgrupamento_Orcamentos, FrmAgrupamento_Orcamentos);
      try
        FrmAgrupamento_Orcamentos.ShowModal;
      finally
        FrmAgrupamento_Orcamentos.Release;
      end;
    end
    else
      Application.MessageBox('Não há agrupamento para este lançamento', PChar(Msg_Title), mb_IconInformation);
  end;
end;

procedure TFrmAgrupamento.FormCreate(Sender: TObject);
begin
  DBGrid1.Columns[0].Width := 64;
  DBGrid1.Columns[1].Width := 64;
  DBGrid1.Columns[2].Width := 315;
  DBGrid1.Columns[3].Width := 90;
end;

procedure TFrmAgrupamento.FormShow(Sender: TObject);
begin
  if LeIni(Arq_Ini, 'Sistema', 'Organizar Janelas Automaticamente') = 'True' then
    FrmPrincipal.Cascade;
end;

end.
