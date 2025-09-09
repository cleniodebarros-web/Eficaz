unit UAtualiz_Precos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBCustomDataSet, IBUpdateSQL, DB, IBQuery, StdCtrls, Buttons,
  ExtCtrls, Tabs, ComCtrls, Grids, DBGrids, Mask, rxToolEdit, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet;

type
  TFrmAtualiz_Precos = class(TForm)
    Itens: TDBGrid;
    Alfabeto: TTabSet;
    Panel1: TPanel;
    btnRetorna: TBitBtn;
    btnPesquisa: TBitBtn;
    StatusBar1: TStatusBar;
    QProdutos: TFDQuery;
    DataProdutos: TDataSource;
    USql_Produtos: TFDUpdateSQL;
    QUpdate: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure ItensKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ItensKeyPress(Sender: TObject; var Key: Char);
    procedure AlfabetoClick(Sender: TObject);
    procedure QProdutosAfterPost(DataSet: TDataSet);
    procedure QProdutosBeforeDelete(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRetornaClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnPesquisaClick(Sender: TObject);
    procedure QProdutosNewRecord(DataSet: TDataSet);
    procedure QProdutosBeforePost(DataSet: TDataSet);
    procedure ItensTitleClick(Column: TColumn);
    procedure QProdutosAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    CmdSelect: String;
    CmdOrderBy: String;
    CmdSelectNull: String;
  end;

var
  FrmAtualiz_Precos: TFrmAtualiz_Precos;
  Produto: Integer;

implementation

uses
  UData, UPrincipal, UPesquisa;

{$R *.dfm}

procedure TFrmAtualiz_Precos.AlfabetoClick(Sender: TObject);
begin
  if Alfabeto.TabIndex <> 26 then
  begin
    if FrmData.QAcesso.FieldByName('DESATIVADOS').AsString = 'True' then
      CmdSelectNull := 'WHERE (DESCRICAO LIKE ' + #39 + Chr(Alfabeto.TabIndex + 65) + '%' + #39 + ')'
    else
      CmdSelectNull := 'WHERE (DESCRICAO LIKE ' + #39 + Chr(Alfabeto.TabIndex + 65) + '%' + #39 + ') AND (PRODUTOS.STATUS = ' + #39 + 'A' + #39 + ')';
  end
  else
  begin
    if FrmData.QAcesso.FieldByName('DESATIVADOS').AsString = 'True' then
      CmdSelectNull := 'WHERE (PRODUTO_ID IS NOT NULL)'
    else
      CmdSelectNull := 'WHERE (PRODUTO_ID IS NOT NULL) AND (PRODUTOS.STATUS = ' + #39 + 'A' + #39 + ')';
  end;

  CmdSelectNull := CmdSelectNull + ' AND (EMPRESA_ID = ' + FrmData.QAcesso.FieldByName('EMPRESA_ID').AsString + ')';
  CmdOrderBy    := 'ORDER BY DESCRICAO';

  QProdutos.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

  QProdutos.Prepare;
  QProdutos.Open;
end;

procedure TFrmAtualiz_Precos.btnPesquisaClick(Sender: TObject);
var
Condicao: String;
begin
  Condicao := GetPesquisa('PRODUTOS');

  if Condicao <> '' then
  begin
    if FrmData.QAcesso.FieldByName('DESATIVADOS').AsString = 'True' then
      CmdSelectNull := Condicao
    else
      CmdSelectNull := Condicao + ' AND (PRODUTOS.STATUS = ' + #39 + 'A' + #39 + ')';
  end;

  CmdSelectNull := CmdSelectNull + ' AND (EMPRESA_ID = ' + FrmData.QAcesso.FieldByName('EMPRESA_ID').AsString + ')';

  CmdOrderBy := 'ORDER BY PRODUTO_ID';

  QProdutos.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

  QProdutos.Prepare;
  QProdutos.Open;
end;

procedure TFrmAtualiz_Precos.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmAtualiz_Precos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmAtualiz_Precos.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if QProdutos.State in [dsInsert, dsEdit] then
  begin
    Application.MessageBox('É melhor salvar as alterações antes de continuar', PChar(Msg_Title), mb_IconStop);
    CanClose := False;
  end;
end;

procedure TFrmAtualiz_Precos.FormCreate(Sender: TObject);
begin
  Itens.Columns[0].Width := 69;
  Itens.Columns[1].Width := 260;
  Itens.Columns[2].Width := 200;
  Itens.Columns[3].Width := 75;
  Itens.Columns[4].Width := 70;
  Itens.Columns[5].Width := 75;
  Itens.Columns[6].Width := 75;
  Itens.Columns[7].Width := 87;

  CmdSelect := QProdutos.Sql.Text;

  if FrmPrincipal.Config.FieldByName('MOSTRAR_CADASTROS').AsString = 'True' then
  begin
    if FrmData.QAcesso.FieldByName('DESATIVADOS').AsString = 'True' then
      CmdSelectNull := 'WHERE (PRODUTO_ID IS NOT NULL)'
    else
      CmdSelectNull := 'WHERE (PRODUTO_ID IS NOT NULL) AND (PRODUTOS.STATUS = ' + #39 + 'A' + #39 + ')';
  end
  else
  begin
    if FrmData.QAcesso.FieldByName('DESATIVADOS').AsString = 'True' then
      CmdSelectNull := 'WHERE (PRODUTO_ID IS NULL)'
    else
      CmdSelectNull := 'WHERE (PRODUTO_ID IS NULL) AND (PRODUTOS.STATUS = ' + #39 + 'A' + #39 + ')';
  end;

  CmdSelectNull := CmdSelectNull + ' AND (EMPRESA_ID = ' + FrmData.QAcesso.FieldByName('EMPRESA_ID').AsString + ')';
  CmdOrderBy    := 'ORDER BY DESCRICAO';

  QProdutos.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

  QProdutos.Prepare;
  QProdutos.Open;
end;

procedure TFrmAtualiz_Precos.ItensKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
InputString: String;
begin
  if Key = VK_F5 then
  begin
    InputString := InputBox('Localizar', 'Cód. de Barras:', '');

    if InputString <> '' then
    begin
      if FrmData.QAcesso.FieldByName('DESATIVADOS').AsString = 'True' then
        CmdSelectNull := 'WHERE (COD_BARRA LIKE ' + #39 + '%' + InputString + '%' + #39 + ')'
      else
        CmdSelectNull := 'WHERE (COD_BARRA LIKE ' + #39 + '%' + InputString + '%' + #39 + ') AND (PRODUTOS.STATUS = ' + #39 + 'A' + #39 + ')';

      CmdSelectNull := CmdSelectNull + ' AND (EMPRESA_ID = ' + FrmData.QAcesso.FieldByName('EMPRESA_ID').AsString + ')';
      CmdOrderBy    := 'ORDER BY COD_BARRA';

      QProdutos.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

      QProdutos.Prepare;
      QProdutos.Open;
    end;
  end;

  if Key = VK_F7 then
  begin
    InputString := InputBox('Localizar', 'Descrição:', '');

    if InputString <> '' then
    begin
      if FrmData.QAcesso.FieldByName('DESATIVADOS').AsString = 'True' then
        CmdSelectNull := 'WHERE (DESCRICAO ILIKE ' + #39 + '%' + InputString + '%' + #39 + ')'
      else
        CmdSelectNull := 'WHERE (DESCRICAO ILIKE ' + #39 + '%' + InputString + '%' + #39 + ') AND (PRODUTOS.STATUS = ' + #39 + 'A' + #39 + ')';

      CmdSelectNull := CmdSelectNull + ' AND (EMPRESA_ID = ' + FrmData.QAcesso.FieldByName('EMPRESA_ID').AsString + ')';
      CmdOrderBy    := 'ORDER BY DESCRICAO';

      QProdutos.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;
      //ShowMessage(QProdutos.Sql.Text);
      QProdutos.Prepare;
      QProdutos.Open;
    end;
  end;

 if Key = VK_F8 then
 begin
    InputString := InputBox('Localizar', 'Código do Produto:', '');
    if InputString <> '' then
    Begin
     InputString := UpperCase(InputString);
      begin
        if FrmData.QAcesso.FieldByName('DESATIVADOS').AsString  = 'True' Then
          CmdSelectNull := 'WHERE (PRODUTO_ID = :PRODUTO_ID )'
        else
          CmdSelectNull := 'WHERE (PRODUTO_ID = :PRODUTO_ID ) ' +
                           'AND (PRODUTOS.STATUS = :STATUS)';

       CmdSelectNull := CmdSelectNull + ' AND (EMPRESA_ID = ' + FrmData.QAcesso.FieldByName('EMPRESA_ID').AsString + ')';

      if StrToInt(LeIni(Arq_Ini, 'Sistema', 'Localização')) > 0 then
        CmdSelectNull := CmdSelectNull + ' AND (LOCALIZACAO_ID = ' + LeIni(Arq_Ini, 'Sistema', 'Localização') + ')';

      CmdOrderBy := 'ORDER BY PRODUTO_ID';

      QProdutos.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;


      QProdutos.ParamByName('PRODUTO_ID').AsInteger := StrToInt(InputString);


       if (FrmData.QAcesso.FieldByName('DESATIVADOS').AsString  <> 'True')  Then
        QProdutos.ParamByName('STATUS').AsString := 'A';


      QProdutos.Prepare;
      QProdutos.Open;
      end;
    End;
 end;

  if Key = VK_F9 then
    Perform(Wm_NextDlgCtl, 0, 0);

  if ((Key = Vk_Up) or (Key = Vk_Down)) and (QProdutos.State in [dsInsert, dsEdit]) then
    Key := 0;
end;

procedure TFrmAtualiz_Precos.ItensKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #46 then
    Key := #44;

  if Key = #13 then
    Keybd_Event(VK_TAB, 0, 0, 0);
end;

procedure TFrmAtualiz_Precos.ItensTitleClick(Column: TColumn);
begin
  CmdOrderBy := 'ORDER BY ' + Column.FieldName;

  QProdutos.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

  QProdutos.Prepare;
  QProdutos.Open;
end;

procedure TFrmAtualiz_Precos.QProdutosAfterOpen(DataSet: TDataSet);
begin
TFloatField(QProdutos.FieldByName('PRECO_VAREJO')).DisplayFormat  := '#,##0.00';
TFloatField(QProdutos.FieldByName('PRECO_PRAZO')).DisplayFormat   := '#,##0.00';
TFloatField(QProdutos.FieldByName('CUSTO_COMPRA')).DisplayFormat  := '#,##0.00';
end;

procedure TFrmAtualiz_Precos.QProdutosAfterPost(DataSet: TDataSet);
begin

 { QProdutos.Close;

  QProdutos.Prepare;
  QProdutos.Open;

  QProdutos.Locate('produto_id', Produto, [loCaseInsensitive]);}

  Itens.SelectedIndex := 4 ;


end;

procedure TFrmAtualiz_Precos.QProdutosBeforeDelete(DataSet: TDataSet);
begin
  abort;
end;

procedure TFrmAtualiz_Precos.QProdutosBeforePost(DataSet: TDataSet);
begin


  Produto := QProdutos.FieldByName('PRODUTO_ID').AsInteger;

  QProdutos.FieldByName('DT_PRECO').AsDateTime := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;

  if QProdutos.FieldByName('FAMILIA_ID').AsInteger > 0 then
  begin

    QUpdate.Sql.Clear;
    QUpdate.Sql.Add('UPDATE PRODUTOS SET PRECO_VAREJO = :PRECO_VAREJO, PRECO_PRAZO = :PRECO_PRAZO, DT_PRECO = :DT_PRECO, FUNCIONARIO_ID = :FUNCIONARIO_ID ' +
                                         'WHERE ' +
                                         '(FAMILIA_ID = :FAMILIA_ID)' +
                                         'AND (PRODUTO_ID <> :PRODUTO_ID)');

    QUpdate.ParamByName('PRECO_VAREJO').AsFloat := QProdutos.FieldByName('PRECO_VAREJO').AsFloat;
    QUpdate.ParamByName('PRECO_PRAZO').AsFloat  := QProdutos.FieldByName('PRECO_PRAZO').AsFloat;
    QUpdate.ParamByName('DT_PRECO').AsDateTime  := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
    QUpdate.ParamByName('FAMILIA_ID').AsInteger := QProdutos.FieldByName('FAMILIA_ID').AsInteger;
    QUpdate.ParamByName('PRODUTO_ID').AsInteger := QProdutos.FieldByName('PRODUTO_ID').AsInteger;
    QUpdate.ParamByName('FUNCIONARIO_ID').AsInteger := FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger;

    QUpdate.Prepare;
    QUpdate.ExecSql;


  end
  Else
  Begin

    QUpdate.Sql.Clear;
    QUpdate.Sql.Add('UPDATE PRODUTOS SET  FUNCIONARIO_ID = :FUNCIONARIO_ID ' +
                                         'WHERE ' +
                                         '(PRODUTO_ID = :PRODUTO_ID)');

    QUpdate.ParamByName('PRODUTO_ID').AsInteger := QProdutos.FieldByName('PRODUTO_ID').AsInteger;
    QUpdate.ParamByName('FUNCIONARIO_ID').AsInteger := FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger;

    QUpdate.Prepare;
    QUpdate.ExecSql;

  end;

end;

procedure TFrmAtualiz_Precos.QProdutosNewRecord(DataSet: TDataSet);
begin
  QProdutos.Cancel;
end;

end.
