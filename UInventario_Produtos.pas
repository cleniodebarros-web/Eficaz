unit UInventario_Produtos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBCustomDataSet, IBUpdateSQL, DB, IBQuery, StdCtrls, Buttons,
  ExtCtrls, Tabs, ComCtrls, Grids, DBGrids, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet, StrUtils;

type
  TFrmInventario_Produtos = class(TForm)
    Itens: TDBGrid;
    Alfabeto: TTabSet;
    Panel1: TPanel;
    btnRetorna: TBitBtn;
    DataProdutos: TDataSource;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    Cod_Scan: TEdit;
    Add_Quantidade: TSpeedButton;
    btnPesquisa: TBitBtn;
    QProdutos: TFDQuery;
    QRel: TFDQuery;
    U_Sql: TFDUpdateSQL;
    procedure FormCreate(Sender: TObject);
    procedure ItensKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ItensKeyPress(Sender: TObject; var Key: Char);
    procedure AlfabetoClick(Sender: TObject);
    procedure QProdutosBeforeDelete(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRetornaClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure QProdutosNewRecord(DataSet: TDataSet);
    procedure ItensTitleClick(Column: TColumn);
    procedure Add_QuantidadeClick(Sender: TObject);
    procedure Cod_ScanExit(Sender: TObject);
    procedure Cod_ScanKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnPesquisaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CmdSelect: String;
    CmdOrderBy: String;
    CmdSelectNull: String;
  end;

var
  FrmInventario_Produtos: TFrmInventario_Produtos;

implementation

uses
  UData, UPrincipal, UPesquisa;

{$R *.dfm}

procedure TFrmInventario_Produtos.Add_QuantidadeClick(Sender: TObject);
var
Qtd: Real;
begin
  if Cod_Scan.Text <> '' then
  begin
    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT * FROM INVENTARIO_PRODUTOS');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(COD_BARRA = :COD_BARRA)');
    QRel.Sql.Add('AND (ST_INVENTARIO = :ST_INVENTARIO)');
    QRel.Sql.Add('AND (EMPRESA_ID = :EMPRESA_ID)');

    QRel.ParamByName('COD_BARRA').AsString     := StrZero(Cod_Scan.Text, FrmPrincipal.Config.FieldByName('TAM_BARRAS').AsInteger, 0);
    QRel.ParamByName('ST_INVENTARIO').AsString := 'A';
    QRel.ParamByName('EMPRESA_ID').AsInteger   := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;

    QRel.Prepare;
    QRel.Open;

    if QRel.IsEmpty then
      Application.MessageBox('Código inexistente', PChar(Msg_Title), mb_IconStop)
    else
    begin
      Qtd := QRel.FieldByName('QUANTIDADE_A').AsFloat;

      QRel.Sql.Clear;
      QRel.Sql.Add('UPDATE INVENTARIO_PRODUTOS SET QUANTIDADE_A = :QUANTIDADE_A');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(COD_BARRA = :COD_BARRA)');
      QRel.Sql.Add('AND (ST_INVENTARIO = :ST_INVENTARIO)');
      QRel.Sql.Add('AND (EMPRESA_ID = :EMPRESA_ID)');

      QRel.ParamByName('QUANTIDADE_A').AsFloat   := Qtd + 1;
      QRel.ParamByName('COD_BARRA').AsString     := StrZero(Cod_Scan.Text, FrmPrincipal.Config.FieldByName('TAM_BARRAS').AsInteger, 0);
      QRel.ParamByName('ST_INVENTARIO').AsString := 'A';
      QRel.ParamByName('EMPRESA_ID').AsInteger   := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;

      QRel.Prepare;
      QRel.ExecSql;



      CmdSelectNull := 'WHERE (COD_BARRA LIKE ' + #39 + '%' + StrZero(Cod_Scan.Text, FrmPrincipal.Config.FieldByName('TAM_BARRAS').AsInteger, 0) + '%' + #39 + ') AND (ST_INVENTARIO = ' + #39 + 'A' + #39 + ')';

      CmdSelectNull := CmdSelectNull + ' AND (EMPRESA_ID = ' + FrmData.QAcesso.FieldByName('EMPRESA_ID').AsString + ')';
      CmdOrderBy    := 'ORDER BY COD_BARRA';

      QProdutos.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

      QProdutos.Prepare;
      QProdutos.Open;

      Cod_Scan.Text := '';
      Cod_Scan.SetFocus
    end;
  end;
end;

procedure TFrmInventario_Produtos.AlfabetoClick(Sender: TObject);
begin
  if Alfabeto.TabIndex <> 26 then
    CmdSelectNull := 'WHERE (DESCRICAO LIKE ' + #39 + Chr(Alfabeto.TabIndex + 65) + '%' + #39 + ') AND (ST_INVENTARIO = ' + #39 + 'A' + #39 + ')'
  else
    CmdSelectNull := 'WHERE (PRODUTO_ID IS NOT NULL) AND (ST_INVENTARIO = ' + #39 + 'A' + #39 + ')';

  CmdSelectNull := CmdSelectNull + ' AND (EMPRESA_ID = ' + FrmData.QAcesso.FieldByName('EMPRESA_ID').AsString + ')';
  CmdOrderBy    := 'ORDER BY DESCRICAO';

  QProdutos.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

  QProdutos.Prepare;
  QProdutos.Open;
end;

procedure TFrmInventario_Produtos.btnPesquisaClick(Sender: TObject);
var
Condicao, Cond2: String;
X: Integer;
begin
  Condicao := GetPesquisa('PRODUTOS');
  Cond2    := '';

  if Condicao <> '' then
  begin
    for X := 1 to Length(Condicao) do
    begin
      if (Copy(Condicao, X, 1) = '(') and (Copy(Condicao, X+1, 1) <> '1') then
        Cond2 := Cond2 + Copy(Condicao, X, 1) + 'PRODUTOS.'
      else
        Cond2 := Cond2 + Copy(Condicao, X, 1);
    end;

    Condicao := Cond2;
    
    if FrmPrincipal.Config.FieldByName('VER_DESATIVADOS').AsString = 'True' then
      CmdSelectNull := Condicao
    else
      CmdSelectNull := Condicao + ' AND (PRODUTOS.STATUS = ' + #39 + 'A' + #39 + ')';
  end;

  if StrToInt(LeIni(Arq_Ini, 'Sistema', 'Localização')) > 0 then
    CmdSelectNull := CmdSelectNull + ' AND (PRODUTOS.LOCALIZACAO_ID = ' + LeIni(Arq_Ini, 'Sistema', 'Localização') + ')';

  CmdSelectNull := CmdSelectNull + ' AND (ST_INVENTARIO = ' + #39 + 'A' + #39 + ') AND (PRODUTOS.EMPRESA_ID = ' + FrmData.QAcesso.FieldByName('EMPRESA_ID').AsString + ')';
  CmdOrderBy    := 'ORDER BY INVENTARIO_PRODUTOS.DESCRICAO';

  QProdutos.Sql.Text := 'SELECT INVENTARIO_PRODUTOS.* FROM INVENTARIO_PRODUTOS INNER JOIN PRODUTOS ON (INVENTARIO_PRODUTOS.PRODUTO_ID = PRODUTOS.PRODUTO_ID)' + #13 + CmdSelectNull + #13 + CmdOrderBy;

  QProdutos.Prepare;
  QProdutos.Open;
end;

procedure TFrmInventario_Produtos.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmInventario_Produtos.Cod_ScanExit(Sender: TObject);
begin
  Add_QuantidadeClick(Sender);
end;

procedure TFrmInventario_Produtos.Cod_ScanKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmInventario_Produtos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmInventario_Produtos.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if QProdutos.State in [dsInsert, dsEdit] then
  begin
    Application.MessageBox('É melhor salvar as alterações antes de continuar', PChar(Msg_Title), mb_IconStop);
    CanClose := False;
  end;
end;

procedure TFrmInventario_Produtos.FormCreate(Sender: TObject);
begin
  Itens.Columns[0].Width := 59;
  Itens.Columns[1].Width := 89;
  Itens.Columns[2].Width := 242;
  Itens.Columns[3].Width := 85;
  Itens.Columns[4].Width := 85;
  Itens.Columns[5].Width := 85;

  if FrmData.QAcesso.FieldByName('TPCTB').AsString = '3' then
    Itens.Columns[4].FieldName := 'QUANTIDADE_G'
  else
    Itens.Columns[4].FieldName := 'QUANTIDADE_C';

  CmdSelect := QProdutos.Sql.Text;

 { if FrmPrincipal.Config.FieldByName('MOSTRAR_CADASTROS').AsString = 'True' then
    CmdSelectNull := 'WHERE (PRODUTO_ID IS NOT NULL) AND (ST_INVENTARIO = ' + #39 + 'A' + #39 + ')'
  else
    CmdSelectNull := 'WHERE (PRODUTO_ID IS NULL) AND (ST_INVENTARIO = ' + #39 + 'A' + #39 + ')';
  }

  CmdSelectNull := 'WHERE (PRODUTO_ID IS NOT NULL) AND (ST_INVENTARIO = ' + #39 + 'A' + #39 + ')';

  CmdSelectNull := CmdSelectNull + ' AND (EMPRESA_ID = ' + FrmData.QAcesso.FieldByName('EMPRESA_ID').AsString + ')';
  CmdOrderBy    := 'ORDER BY DESCRICAO';

  QProdutos.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

  QProdutos.Prepare;
  QProdutos.Open;
end;

procedure TFrmInventario_Produtos.ItensKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
InputString: String;
begin
  if Key = VK_F5 then
  begin
    InputString := InputBox('Localizar', 'Cód. de Barras:', '');

    if InputString <> '' then
    begin
      CmdSelectNull := 'WHERE (COD_BARRA LIKE ' + #39 + '%' + InputString + '%' + #39 + ') AND (ST_INVENTARIO = ' + #39 + 'A' + #39 + ')';

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
      CmdSelectNull := 'WHERE (DESCRICAO LIKE ' + #39 + '%' + InputString + '%' + #39 + ') AND (ST_INVENTARIO = ' + #39 + 'A' + #39 + ')';

      CmdSelectNull := CmdSelectNull + ' AND (EMPRESA_ID = ' + FrmData.QAcesso.FieldByName('EMPRESA_ID').AsString + ')';
      CmdOrderBy    := 'ORDER BY DESCRICAO';

      QProdutos.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

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
        CmdSelectNull := 'WHERE (PRODUTO_ID = :PRODUTO_ID) AND (ST_INVENTARIO = ' + #39 + 'A' + #39 + ')'
      else
        CmdSelectNull := 'WHERE (PRODUTO_ID = :PRODUTO_ID ) ' +
                         'AND (STATUS = :STATUS) AND (PRODUTO_ID IS NOT NULL) AND (ST_INVENTARIO = ' + #39 + 'A' + #39 + ')';

     CmdSelectNull := CmdSelectNull + ' AND (EMPRESA_ID = ' + FrmData.QAcesso.FieldByName('EMPRESA_ID').AsString + ')';

    if StrToInt(LeIni(Arq_Ini, 'Sistema', 'Localização')) > 0 then
      CmdSelectNull := CmdSelectNull + ' AND (LOCALIZACAO_ID = ' + LeIni(Arq_Ini, 'Sistema', 'Localização') + ')';

    CmdOrderBy := 'ORDER BY PRODUTO_ID';

    QProdutos.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;


    QProdutos.ParamByName('PRODUTO_ID').AsInteger := StrToInt(InputString);


     if FrmData.QAcesso.FieldByName('DESATIVADOS').AsString  = 'False' Then
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

procedure TFrmInventario_Produtos.ItensKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #46 then
    Key := #44;

  if Key = #13 then
    Keybd_Event(VK_TAB, 0, 0, 0);
end;

procedure TFrmInventario_Produtos.ItensTitleClick(Column: TColumn);
begin
  try
    CmdOrderBy := 'ORDER BY ' + Column.FieldName;

    QProdutos.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

    QProdutos.Prepare;
    QProdutos.Open;
  except
    CmdOrderBy := 'ORDER BY ' + Column.FieldName;

    QProdutos.Sql.Text := 'SELECT INVENTARIO_PRODUTOS.* FROM INVENTARIO_PRODUTOS INNER JOIN PRODUTOS ON (INVENTARIO_PRODUTOS.PRODUTO_ID = PRODUTOS.PRODUTO_ID)' + #13 + CmdSelectNull + #13 + CmdOrderBy;

    QProdutos.Prepare;
    QProdutos.Open;
  end;
end;

procedure TFrmInventario_Produtos.QProdutosBeforeDelete(DataSet: TDataSet);
begin
  abort;
end;

procedure TFrmInventario_Produtos.QProdutosNewRecord(DataSet: TDataSet);
begin
  QProdutos.Cancel;
end;

end.
