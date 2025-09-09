unit UConhecimentos_Emitidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBCustomDataSet, IBUpdateSQL, DB, IBQuery, StdCtrls, Buttons,
  ExtCtrls, Tabs, ComCtrls, Grids, DBGrids, Mask, rxToolEdit, Menus,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmConhecimentos_Emitidos = class(TForm)
    Notas: TDBGrid;
    Panel1: TPanel;
    btnRetorna: TBitBtn;
    DataNotas: TDataSource;
    Panel2: TPanel;
    Label1: TLabel;
    Dtmen: TDateEdit;
    StatusBar1: TStatusBar;
    Dtmai: TDateEdit;
    btnSelecionar: TSpeedButton;
    PopupMenu1: TPopupMenu;
    Alterar_NFe: TMenuItem;
    QNotas: TFDQuery;
    QRel: TFDQuery;
    IQuery: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRetornaClick(Sender: TObject);
    procedure NotasKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DtmaiKeyPress(Sender: TObject; var Key: Char);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure NotasDblClick(Sender: TObject);
    procedure NotasKeyPress(Sender: TObject; var Key: Char);
    procedure btnSelecionarClick(Sender: TObject);
    procedure DtmenEnter(Sender: TObject);
    procedure Alterar_NFeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConhecimentos_Emitidos: TFrmConhecimentos_Emitidos;

implementation

uses
  UData, UPrincipal, UTrans_Venda_Estoque, UTrans_Compra_Estoque, UTrans_Devolucao_Compra,
  UTrans_Transferencia_Estoque,UAltera_CTe;

{$R *.dfm}

procedure TFrmConhecimentos_Emitidos.btnSelecionarClick(Sender: TObject);
begin
  QNotas.Sql.Clear;
  QNotas.Sql.Add('SELECT * FROM COMPL_CTEFISCAL');
  QNotas.Sql.Add('WHERE');
  QNotas.Sql.Add('(DT_SAIDA BETWEEN :DT_INICIAL AND :DT_FINAL)');
  QNotas.Sql.Add('AND (EMPRESA_ID = :EMPRESA_ID)');

  QNotas.Sql.Add('ORDER BY NO_DOC_FISCAL');

  QNotas.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
  QNotas.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
  QNotas.ParamByName('EMPRESA_ID').AsInteger  := FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger;

  QNotas.Prepare;
  QNotas.Open;

  Notas.SetFocus;
end;

procedure TFrmConhecimentos_Emitidos.Alterar_NFeClick(Sender: TObject);
begin
  IQuery.Sql.Clear;
  IQuery.Sql.Add('SELECT CFOP, COUNT(*)');
  IQuery.Sql.Add('FROM TRANSITENS');
  IQuery.Sql.Add('WHERE');
  IQuery.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
  IQuery.Sql.Add('GROUP BY CFOP');
  IQuery.Sql.Add('ORDER BY 2');

  IQuery.ParamByName('TRANSACAO_ID').AsInteger := QNotas.FieldByName('TRANSACAO_ID').AsInteger;

  IQuery.Prepare;
  IQuery.Open;

  IQuery.Last;

  Altera_Cte(QNotas.FieldByName('TRANSACAO_ID').AsInteger, IQuery.FieldByName('CFOP').AsString);
end;

procedure TFrmConhecimentos_Emitidos.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmConhecimentos_Emitidos.DtmaiKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    btnSelecionarClick(Sender);
end;

procedure TFrmConhecimentos_Emitidos.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmConhecimentos_Emitidos.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
   // Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmConhecimentos_Emitidos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmConhecimentos_Emitidos.FormCreate(Sender: TObject);
begin
  Dtmen.Date := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
  Dtmai.Date := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;

  Notas.Columns[0].Width := 64;
  Notas.Columns[1].Width := 64;
  Notas.Columns[2].Width := 67;
  Notas.Columns[3].Width := 48;
  Notas.Columns[4].Width := 272;
  Notas.Columns[5].Width := 100;
  Notas.Columns[6].Width := 100;
  Notas.Columns[7].Width := 40;

  QNotas.Sql.Clear;
  QNotas.Sql.Add('SELECT * FROM COMPL_CTEFISCAL');
  QNotas.Sql.Add('WHERE');
  QNotas.Sql.Add('(DT_SAIDA = :DT_SAIDA)');
  QNotas.Sql.Add('AND (EMPRESA_ID = :EMPRESA_ID)');

  QNotas.Sql.Add('ORDER BY NO_DOC_FISCAL');

  QNotas.ParamByName('DT_SAIDA').AsDateTime  := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
  QNotas.ParamByName('EMPRESA_ID').AsInteger := FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger;

  QNotas.Prepare;
  QNotas.Open;
end;

procedure TFrmConhecimentos_Emitidos.NotasDblClick(Sender: TObject);
begin
  QRel.Sql.Clear;
  QRel.Sql.Add('SELECT * FROM TRANSACOES');
  QRel.Sql.Add('WHERE');
  QRel.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

  QRel.ParamByName('TRANSACAO_ID').AsInteger := QNotas.FieldByName('TRANSACAO_ID').AsInteger;

  QRel.Prepare;
  QRel.Open;

  if not QRel.IsEmpty then
  begin
    if (QRel.FieldByName('CONDUTA').AsString = '01') and (QRel.FieldByName('DEPTO').AsString = '07') then
      Trans_Venda_Estoque(QNotas.FieldByName('TRANSACAO_ID').AsInteger);

    if (QRel.FieldByName('CONDUTA').AsString = '02') and (QRel.FieldByName('DEPTO').AsString = '07') then
      Trans_Compra_Estoque(QNotas.FieldByName('TRANSACAO_ID').AsInteger);

    if (QRel.FieldByName('CONDUTA').AsString = '01') and (QRel.FieldByName('DEPTO').AsString = '10') then
      Trans_Devolucao_Compra(QNotas.FieldByName('TRANSACAO_ID').AsInteger);

    if (QRel.FieldByName('CONDUTA').AsString = '20') and (QRel.FieldByName('DEPTO').AsString = '07') then
      Trans_Transferencia_Estoque(QNotas.FieldByName('TRANSACAO_ID').AsInteger);
  end;
end;

procedure TFrmConhecimentos_Emitidos.NotasKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F3) and ((QNotas.FieldByName('SINTEGRA').AsString = 'S') or (QNotas.FieldByName('SINTEGRA').AsString = '')) then
  begin
    
    QRel.Sql.Clear;
    QRel.Sql.Add('UPDATE COMPL_CTEFISCAL SET SINTEGRA = :STATUS');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
    QRel.Sql.Add('AND (NO_DOC_FISCAL = :NO_DOC_FISCAL)');

    QRel.ParamByName('STATUS').AsString         := 'N';
    QRel.ParamByName('TRANSACAO_ID').AsInteger  := QNotas.FieldByName('TRANSACAO_ID').AsInteger;
    QRel.ParamByName('NO_DOC_FISCAL').AsInteger := QNotas.FieldByName('NO_DOC_FISCAL').AsInteger;

    QRel.Prepare;
    QRel.ExecSql;



    QNotas.Close;
    QNotas.Prepare;
    QNotas.Open;
  end;

  if (Key = Vk_F4) and (QNotas.FieldByName('SINTEGRA').AsString = 'N') then
  begin
   

    QRel.Sql.Clear;
    QRel.Sql.Add('UPDATE COMPL_CTEFISCAL SET SINTEGRA = :STATUS');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
    QRel.Sql.Add('AND (NO_DOC_FISCAL = :NO_DOC_FISCAL)');

    QRel.ParamByName('STATUS').AsString         := 'S';
    QRel.ParamByName('TRANSACAO_ID').AsInteger  := QNotas.FieldByName('TRANSACAO_ID').AsInteger;
    QRel.ParamByName('NO_DOC_FISCAL').AsInteger := QNotas.FieldByName('NO_DOC_FISCAL').AsInteger;

    QRel.Prepare;
    QRel.ExecSql;



    QNotas.Close;
    QNotas.Prepare;
    QNotas.Open;
  end;
end;

procedure TFrmConhecimentos_Emitidos.NotasKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT * FROM TRANSACOES');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

    QRel.ParamByName('TRANSACAO_ID').AsInteger := QNotas.FieldByName('TRANSACAO_ID').AsInteger;

    QRel.Prepare;
    QRel.Open;

    if not QRel.IsEmpty then
    begin
      if (QRel.FieldByName('CONDUTA').AsString = '01') and (QRel.FieldByName('DEPTO').AsString = '07') then
        Trans_Venda_Estoque(QNotas.FieldByName('TRANSACAO_ID').AsInteger);

      if (QRel.FieldByName('CONDUTA').AsString = '02') and (QRel.FieldByName('DEPTO').AsString = '07') then
        Trans_Compra_Estoque(QNotas.FieldByName('TRANSACAO_ID').AsInteger);

      if (QRel.FieldByName('CONDUTA').AsString = '01') and (QRel.FieldByName('DEPTO').AsString = '10') then
        Trans_Devolucao_Compra(QNotas.FieldByName('TRANSACAO_ID').AsInteger);

      if (QRel.FieldByName('CONDUTA').AsString = '20') and (QRel.FieldByName('DEPTO').AsString = '07') then
        Trans_Transferencia_Estoque(QNotas.FieldByName('TRANSACAO_ID').AsInteger);
    end;
  end;
end;

end.
