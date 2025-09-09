unit UComposicao_Produtos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBUpdateSQL, IBQuery, Grids, DBGrids, StdCtrls,
  Buttons, ExtCtrls, Mask, rxToolEdit, rxCurrEdit, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet;

type
  TFrmComposicao_Produtos = class(TForm)
    Panel1: TPanel;
    btnRetorna: TBitBtn;
    Grid_Producao: TDBGrid;
    DataProducao: TDataSource;
    Label73: TLabel;
    COMPOSICAO_ID: TCurrencyEdit;
    btnComp: TSpeedButton;
    Label1: TLabel;
    NOME_COMP: TEdit;
    IQuery: TFDQuery;
    QProducao: TFDQuery;
    QProdutos: TFDQuery;
    USql_Producao: TFDUpdateSQL;
    procedure Grid_ProducaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Grid_ProducaoKeyPress(Sender: TObject; var Key: Char);
    procedure Grid_ProducaoColExit(Sender: TObject);
    procedure QProducaoAfterDelete(DataSet: TDataSet);
    procedure QProducaoAfterPost(DataSet: TDataSet);
    procedure QProducaoBeforeDelete(DataSet: TDataSet);
    procedure QProducaoBeforeEdit(DataSet: TDataSet);
    procedure QProducaoBeforePost(DataSet: TDataSet);
    procedure QProducaoNewRecord(DataSet: TDataSet);
    procedure btnCompClick(Sender: TObject);
    procedure COMPOSICAO_IDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure COMPOSICAO_IDChange(Sender: TObject);
    procedure NOME_COMPExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Atualiza_Produto;
  end;

var
  FrmComposicao_Produtos: TFrmComposicao_Produtos;

implementation

uses
  UPrincipal, UData, UConsulta;

{$R *.dfm}

procedure TFrmComposicao_Produtos.Atualiza_Produto;
var
Vr_Produto: Real;
begin




  QProdutos.Sql.Clear;
  QProdutos.Sql.Add('SELECT * FROM PRODUTOS');
  QProdutos.Sql.Add('WHERE');
  QProdutos.Sql.Add('(EMPRESA_ID = :EMPRESA_ID)');
  QProdutos.Sql.Add('AND (STATUS = :STATUS)');
  QProdutos.Sql.Add('AND (COMPOSICAO_ID = :COMPOSICAO_ID)');

  QProdutos.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  QProdutos.ParamByName('STATUS').AsString         := 'A';
  QProdutos.ParamByName('COMPOSICAO_ID').AsInteger := StrToInt(COMPOSICAO_ID.Text);

  QProdutos.Prepare;
  QProdutos.Open;

  QProdutos.First;
  while not QProdutos.Eof do
  begin
    IQuery.Sql.Clear;
    IQuery.Sql.Add('DELETE FROM PRODUCAO_ITENS');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(PRODUTO_ID = :PRODUTO_ID)');

    IQuery.ParamByName('PRODUTO_ID').AsInteger := QProdutos.FieldByName('PRODUTO_ID').AsInteger;

    IQuery.Prepare;
    IQuery.ExecSql;



    Application.ProcessMessages;
    QProdutos.Next;
  end;

  IQuery.Sql.Clear;
  IQuery.Sql.Add('INSERT INTO PRODUCAO_ITENS(PRODUTO_ID, INSUMO_ID, DESCRICAO, QUANTIDADE)');
  IQuery.Sql.Add('SELECT PRODUTOS.PRODUTO_ID, COMP_PRODUTO.INSUMO_ID, COMP_PRODUTO.DESCRICAO, COMP_PRODUTO.QUANTIDADE');
  IQuery.Sql.Add('FROM COMP_PRODUTO');
  IQuery.Sql.Add('INNER JOIN PRODUTOS');
  IQuery.Sql.Add('ON (COMP_PRODUTO.COMPOSICAO_ID = PRODUTOS.COMPOSICAO_ID)');
  IQuery.Sql.Add('WHERE');
  IQuery.Sql.Add('(COMP_PRODUTO.COMPOSICAO_ID = :COMPOSICAO_ID)');

  IQuery.ParamByName('COMPOSICAO_ID').AsInteger := StrToInt(COMPOSICAO_ID.Text);

  IQuery.Prepare;
  IQuery.ExecSql;



  QProdutos.First;
  while not QProdutos.Eof do
  begin
    IQuery.Sql.Clear;
    IQuery.Sql.Add('SELECT SUM(PRODUCAO_ITENS.QUANTIDADE * PRODUTOS.PRECO_VAREJO) VR_TOTAL');
    IQuery.Sql.Add('FROM PRODUCAO_ITENS');
    IQuery.Sql.Add('INNER JOIN PRODUTOS');
    IQuery.Sql.Add('ON (PRODUCAO_ITENS.INSUMO_ID = PRODUTOS.PRODUTO_ID)');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(PRODUCAO_ITENS.PRODUTO_ID = :PRODUTO_ID)');

    IQuery.ParamByName('PRODUTO_ID').AsInteger := QProdutos.FieldByName('PRODUTO_ID').AsInteger;

    IQuery.Prepare;
    IQuery.Open;

    Vr_Produto := IQuery.FieldByName('VR_TOTAL').AsFloat;

    if Vr_Produto = 0 then
       Vr_Produto := 0.01;

    IQuery.Sql.Clear;
    IQuery.Sql.Add('UPDATE PRODUTOS SET PRECO_VAREJO = :PRECO_VAREJO');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(PRODUTO_ID = :PRODUTO_ID)');

    IQuery.ParamByName('PRECO_VAREJO').AsFloat := Vr_Produto;
    IQuery.ParamByName('PRODUTO_ID').AsInteger := QProdutos.FieldByName('PRODUTO_ID').AsInteger;

    IQuery.Prepare;
    IQuery.ExecSql;



    Application.ProcessMessages;
    QProdutos.Next;
  end;

end;

procedure TFrmComposicao_Produtos.btnCompClick(Sender: TObject);
begin
  try
    COMPOSICAO_ID.Value := GetConsulta('COMP_PRODUTO', 0, 0, StrToInt(COMPOSICAO_ID.Text));
  except
    COMPOSICAO_ID.Value := GetConsulta('COMP_PRODUTO', 0, 0, 0);
  end;
end;

procedure TFrmComposicao_Produtos.COMPOSICAO_IDChange(Sender: TObject);
begin
  IQuery.Sql.Clear;
  IQuery.Sql.Add('SELECT DISTINCT COMPOSICAO_ID, NOME_COMP FROM COMP_PRODUTO');
  IQuery.Sql.Add('WHERE');
  IQuery.Sql.Add('(COMPOSICAO_ID = :COMPOSICAO_ID)');

  try
    IQuery.ParamByName('COMPOSICAO_ID').AsInteger := StrToInt(COMPOSICAO_ID.Text);
  except
    IQuery.ParamByName('COMPOSICAO_ID').AsInteger := 0;
  end;

  IQuery.Prepare;
  IQuery.Open;

  if not IQuery.IsEmpty then
  begin
    NOME_COMP.Text := IQuery.FieldByName('NOME_COMP').AsString;

    QProducao.Close;

    QProducao.ParamByName('COMPOSICAO_ID').AsInteger := StrToInt(COMPOSICAO_ID.Text);

    QProducao.Prepare;
    QProducao.Open;

    Grid_Producao.Enabled := True;
  end
  else
  begin
    QProducao.Close;

    QProducao.ParamByName('COMPOSICAO_ID').AsInteger := 0;

    QProducao.Prepare;
    QProducao.Open;

    Grid_Producao.Enabled := False;
  end;
end;

procedure TFrmComposicao_Produtos.COMPOSICAO_IDKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = COMPOSICAO_ID) then
    btnCompClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmComposicao_Produtos.Grid_ProducaoColExit(Sender: TObject);
begin
  if QProducao.State in [dsInsert, dsEdit] then
  begin
    if Grid_Producao.SelectedField.FieldName = 'insumo_id' then
    begin
      IQuery.Sql.Clear;
      IQuery.Sql.Add('SELECT * FROM PRODUTOS');
      IQuery.Sql.Add('WHERE');
      IQuery.Sql.Add('(PRODUTO_ID = :PRODUTO_ID)');
      IQuery.Sql.Add('AND (EMPRESA_ID = :EMPRESA_ID)');
      IQuery.Sql.Add('AND (STATUS = :STATUS)');

      IQuery.ParamByName('PRODUTO_ID').AsInteger := QProducao.FieldByName('INSUMO_ID').AsInteger;
      IQuery.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
      IQuery.ParamByName('STATUS').AsString      := 'A';

      IQuery.Prepare;
      IQuery.Open;

      if IQuery.IsEmpty then
      begin
        QProducao.FieldByName('DESCRICAO').AsString := '';

        Application.MessageBox('Insumo inexistente', PChar(Msg_Title), mb_IconStop);
        Grid_Producao.SelectedIndex := 0;
      end
      else
        QProducao.FieldByName('DESCRICAO').AsString := IQuery.FieldByName('DESCRICAO').AsString;
    end;
  end;
end;

procedure TFrmComposicao_Produtos.Grid_ProducaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F4) and (QProducao.State = dsBrowse) and (not QProducao.IsEmpty) then
    QProducao.Delete;

  if (Key = Vk_F7) and (Grid_Producao.SelectedField.FieldName = 'insumo_id') and (QProducao.State in [dsInsert, dsEdit]) then
    QProducao.FieldByName('INSUMO_ID').AsInteger := GetConsulta('ESTOQUE', FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger, 0, QProducao.FieldByName('INSUMO_ID').AsInteger);

  if Key = VK_F9 then
    Perform(Wm_NextDlgCtl, 0, 0);

  if ((Key = Vk_Up) or (Key = Vk_Down)) and (QProducao.State in [dsInsert, dsEdit]) then
    Key := 0;
end;

procedure TFrmComposicao_Produtos.Grid_ProducaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    Keybd_Event(VK_TAB, 0, 0, 0);

  Key := AnsiUpperCase(Key)[1];
end;

procedure TFrmComposicao_Produtos.NOME_COMPExit(Sender: TObject);
begin
  if (NOME_COMP.Text <> '') and (COMPOSICAO_ID.Text <> '') then
  begin
    IQuery.Sql.Clear;
    IQuery.Sql.Add('SELECT DISTINCT COMPOSICAO_ID, NOME_COMP FROM COMP_PRODUTO');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(COMPOSICAO_ID = :COMPOSICAO_ID)');

    IQuery.ParamByName('COMPOSICAO_ID').AsInteger := StrToInt(COMPOSICAO_ID.Text);

    IQuery.Prepare;
    IQuery.Open;

    if not IQuery.IsEmpty then
      Grid_Producao.Enabled := True
    else
    begin
      if Application.MessageBox('Deseja incluir um novo registro?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = IDYES then
        Grid_Producao.Enabled := True
      else
        COMPOSICAO_ID.SetFocus;
    end;
  end;
end;

procedure TFrmComposicao_Produtos.QProducaoAfterDelete(DataSet: TDataSet);
var
Vr_Produto: Real;
begin
  IQuery.Sql.Clear;
  IQuery.Sql.Add('SELECT SUM(COMP_PRODUTO.QUANTIDADE * PRODUTOS.PRECO_VAREJO) VR_TOTAL');
  IQuery.Sql.Add('FROM COMP_PRODUTO');
  IQuery.Sql.Add('INNER JOIN PRODUTOS');
  IQuery.Sql.Add('ON (COMP_PRODUTO.INSUMO_ID = PRODUTOS.PRODUTO_ID)');
  IQuery.Sql.Add('WHERE');
  IQuery.Sql.Add('(COMP_PRODUTO.COMPOSICAO_ID = :COMPOSICAO_ID)');

  IQuery.ParamByName('COMPOSICAO_ID').AsInteger := StrToInt(COMPOSICAO_ID.Text);

  IQuery.Prepare;
  IQuery.Open;

  Vr_Produto := IQuery.FieldByName('VR_TOTAL').AsFloat;

  if Vr_Produto = 0 then
    Vr_Produto := 0.01;

  IQuery.Sql.Clear;
  IQuery.Sql.Add('UPDATE PRODUTOS SET PRECO_VAREJO = :PRECO_VAREJO');
  IQuery.Sql.Add('WHERE');
  IQuery.Sql.Add('(COMPOSICAO_ID = :COMPOSICAO_ID)');

  IQuery.ParamByName('PRECO_VAREJO').AsFloat    := Vr_Produto;
  IQuery.ParamByName('COMPOSICAO_ID').AsInteger := StrToInt(COMPOSICAO_ID.Text);

  IQuery.Prepare;
  IQuery.ExecSql;



  Atualiza_Produto;
end;

procedure TFrmComposicao_Produtos.QProducaoAfterPost(DataSet: TDataSet);
var
Vr_Produto: Real;
begin


  IQuery.Sql.Clear;
  IQuery.Sql.Add('SELECT SUM(COMP_PRODUTO.QUANTIDADE * PRODUTOS.PRECO_VAREJO) VR_TOTAL');
  IQuery.Sql.Add('FROM COMP_PRODUTO');
  IQuery.Sql.Add('INNER JOIN PRODUTOS');
  IQuery.Sql.Add('ON (COMP_PRODUTO.INSUMO_ID = PRODUTOS.PRODUTO_ID)');
  IQuery.Sql.Add('WHERE');
  IQuery.Sql.Add('(COMP_PRODUTO.COMPOSICAO_ID = :COMPOSICAO_ID)');

  IQuery.ParamByName('COMPOSICAO_ID').AsInteger := StrToInt(COMPOSICAO_ID.Text);

  IQuery.Prepare;
  IQuery.Open;

  Vr_Produto := IQuery.FieldByName('VR_TOTAL').AsFloat;

  IQuery.Sql.Clear;
  IQuery.Sql.Add('UPDATE PRODUTOS SET PRECO_VAREJO = :PRECO_VAREJO');
  IQuery.Sql.Add('WHERE');
  IQuery.Sql.Add('(COMPOSICAO_ID = :COMPOSICAO_ID)');

  IQuery.ParamByName('PRECO_VAREJO').AsFloat    := Vr_Produto;
  IQuery.ParamByName('COMPOSICAO_ID').AsInteger := StrToInt(COMPOSICAO_ID.Text);

  IQuery.Prepare;
  IQuery.ExecSql;



  Atualiza_Produto;
end;

procedure TFrmComposicao_Produtos.QProducaoBeforeDelete(DataSet: TDataSet);
begin
  if FrmData.QAcesso.FieldByName('EXCLUSAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para exclusão', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  if Application.MessageBox('Deseja realmente excluir?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = IDNO then
    abort;
end;

procedure TFrmComposicao_Produtos.QProducaoBeforeEdit(DataSet: TDataSet);
begin
  if FrmData.QAcesso.FieldByName('ALTERACAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para alteração', PChar(Msg_Title), mb_IconStop);
    exit;
  end;
end;

procedure TFrmComposicao_Produtos.QProducaoBeforePost(DataSet: TDataSet);
begin
  if (QProducao.FieldByName('QUANTIDADE').AsFloat <= 0) or (QProducao.FieldByName('QUANTIDADE').AsFloat > 9999) then
  begin
    Application.MessageBox('Quantidade inválida', PChar(Msg_Title), mb_IconStop);

    Grid_Producao.SelectedIndex := 2;

    abort;
  end;

  if QProducao.FieldByName('DESCRICAO').AsString = '' then
  begin
    Application.MessageBox('Cód. de Insumo inválido', PChar(Msg_Title), mb_IconStop);

    Grid_Producao.SelectedIndex := 0;

    abort;
  end;
end;

procedure TFrmComposicao_Produtos.QProducaoNewRecord(DataSet: TDataSet);
begin
  DataSet['COMPOSICAO_ID'] := StrToInt(COMPOSICAO_ID.Text);
  DataSet['NOME_COMP']     := NOME_COMP.Text;
end;

end.
