unit UAtualiz_Cst_Pis_Cofins;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBCustomDataSet, IBUpdateSQL, DB, IBQuery, StdCtrls, Buttons,
  ExtCtrls, Tabs, ComCtrls, Grids, DBGrids, Mask, rxToolEdit, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet;

type
  TFrmAtualiz_Cst_Pis_Cofins = class(TForm)
    Itens: TDBGrid;
    Alfabeto: TTabSet;
    Panel1: TPanel;
    btnRetorna: TBitBtn;
    DataProdutos: TDataSource;
    btnPesquisa: TBitBtn;
    StatusBar1: TStatusBar;
    QProdutos: TFDQuery;
    IQuery: TFDQuery;
    USql_Produtos: TFDUpdateSQL;
    QUpdate: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure ItensKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ItensKeyPress(Sender: TObject; var Key: Char);
    procedure AlfabetoClick(Sender: TObject);
    procedure ibqryQProdutosAfterPost(DataSet: TDataSet);
    procedure ibqryQProdutosBeforeDelete(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRetornaClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnPesquisaClick(Sender: TObject);
    procedure ibqryQProdutosNewRecord(DataSet: TDataSet);
    procedure ItensTitleClick(Column: TColumn);
    procedure ibqryQProdutosBeforePost(DataSet: TDataSet);
    procedure ItensColExit(Sender: TObject);
    procedure ItensExit(Sender: TObject);
    procedure ItensEnter(Sender: TObject);
    procedure ItensColEnter(Sender: TObject);
    procedure QProdutosAfterPost(DataSet: TDataSet);
    procedure QProdutosBeforeDelete(DataSet: TDataSet);
    procedure QProdutosBeforePost(DataSet: TDataSet);
    procedure QProdutosNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    CmdSelect: String;
    CmdOrderBy: String;
    CmdSelectNull: String;
    function Validacao: Boolean;
  end;

var
  FrmAtualiz_Cst_Pis_Cofins: TFrmAtualiz_Cst_Pis_Cofins;
  Produto: Integer;

implementation

uses
  UData, UPrincipal, UPesquisa, UConsulta_CST, UConsulta_Contribuicao,UConsulta_NCM;

{$R *.dfm}

procedure TFrmAtualiz_Cst_Pis_Cofins.AlfabetoClick(Sender: TObject);
begin
  if Alfabeto.TabIndex <> 26 then
  begin
    if FrmPrincipal.Config.FieldByName('VER_DESATIVADOS').AsString = 'True' then
      CmdSelectNull := 'WHERE (DESCRICAO LIKE ' + #39 + Chr(Alfabeto.TabIndex + 65) + '%' + #39 + ')'
    else
      CmdSelectNull := 'WHERE (DESCRICAO LIKE ' + #39 + Chr(Alfabeto.TabIndex + 65) + '%' + #39 + ') AND (STATUS = ' + #39 + 'A' + #39 + ')';
  end
  else
  begin
    if FrmPrincipal.Config.FieldByName('VER_DESATIVADOS').AsString = 'True' then
      CmdSelectNull := 'WHERE (PRODUTO_ID IS NOT NULL)'
    else
      CmdSelectNull := 'WHERE (PRODUTO_ID IS NOT NULL) AND (STATUS = ' + #39 + 'A' + #39 + ')';
  end;

  CmdSelectNull := CmdSelectNull + ' AND (EMPRESA_ID = ' + FrmData.QAcesso.FieldByName('EMPRESA_ID').AsString + ')';
  CmdOrderBy    := 'ORDER BY DESCRICAO';

  QProdutos.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

  QProdutos.Prepare;
  QProdutos.Open;
end;

procedure TFrmAtualiz_Cst_Pis_Cofins.btnPesquisaClick(Sender: TObject);
var
Condicao: String;
begin
  Condicao := GetPesquisa('PRODUTOS');

  if Condicao <> '' then
  begin
    if FrmPrincipal.Config.FieldByName('VER_DESATIVADOS').AsString = 'True' then
      CmdSelectNull := Condicao
    else
      CmdSelectNull := Condicao + ' AND (STATUS = ' + #39 + 'A' + #39 + ')';
  end;

  CmdSelectNull := CmdSelectNull + ' AND (EMPRESA_ID = ' + FrmData.QAcesso.FieldByName('EMPRESA_ID').AsString + ')';

  CmdOrderBy := 'ORDER BY PRODUTO_ID';

  QProdutos.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

  QProdutos.Prepare;
  QProdutos.Open;
end;

procedure TFrmAtualiz_Cst_Pis_Cofins.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmAtualiz_Cst_Pis_Cofins.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmAtualiz_Cst_Pis_Cofins.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if QProdutos.State in [dsInsert, dsEdit] then
  begin
    Application.MessageBox('É melhor salvar as alterações antes de continuar', PChar(Msg_Title), mb_IconStop);
    CanClose := False;
  end;
end;

procedure TFrmAtualiz_Cst_Pis_Cofins.FormCreate(Sender: TObject);
begin
  Itens.Columns[0].Width := 69;
  Itens.Columns[1].Width := 320;
  Itens.Columns[2].Width := 83;
  Itens.Columns[3].Width := 71;
  Itens.Columns[4].Width := 64;
  Itens.Columns[5].Width := 75;
  Itens.Columns[6].Width := 75;
  Itens.Columns[7].Width := 75;
  Itens.Columns[8].Width := 75;
  Itens.Columns[9].Width := 65;
  Itens.Columns[10].Width := 60;
  Itens.Columns[11].Width := 35;
  Itens.Columns[12].Width := 65;


  CmdSelect := QProdutos.Sql.Text;

  if FrmPrincipal.Config.FieldByName('MOSTRAR_CADASTROS').AsString = 'True' then
  begin
    if FrmPrincipal.Config.FieldByName('VER_DESATIVADOS').AsString = 'True' then
      CmdSelectNull := 'WHERE (PRODUTO_ID IS NOT NULL)'
    else
      CmdSelectNull := 'WHERE (PRODUTO_ID IS NOT NULL) AND (STATUS = ' + #39 + 'A' + #39 + ')';
  end
  else
  begin
    if FrmPrincipal.Config.FieldByName('VER_DESATIVADOS').AsString = 'True' then
      CmdSelectNull := 'WHERE (PRODUTO_ID IS NULL)'
    else
      CmdSelectNull := 'WHERE (PRODUTO_ID IS NULL) AND (STATUS = ' + #39 + 'A' + #39 + ')';
  end;

  CmdSelectNull := CmdSelectNull + ' AND (EMPRESA_ID = ' + FrmData.QAcesso.FieldByName('EMPRESA_ID').AsString + ')';
  CmdOrderBy    := 'ORDER BY DESCRICAO';

  QProdutos.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

  QProdutos.Prepare;
  QProdutos.Open;
end;

procedure TFrmAtualiz_Cst_Pis_Cofins.ItensColEnter(Sender: TObject);
begin
Validacao;
end;

procedure TFrmAtualiz_Cst_Pis_Cofins.ItensColExit(Sender: TObject);
begin
   Validacao;
end;

procedure TFrmAtualiz_Cst_Pis_Cofins.ItensEnter(Sender: TObject);
begin
Validacao;
end;

procedure TFrmAtualiz_Cst_Pis_Cofins.ItensExit(Sender: TObject);
begin
Validacao;
end;

procedure TFrmAtualiz_Cst_Pis_Cofins.ItensKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
InputString: String;
begin
  if Key = VK_F5 then
  begin
    InputString := InputBox('Localizar', 'Cód. de Barras:', '');

    if InputString <> '' then
    begin
      if FrmPrincipal.Config.FieldByName('VER_DESATIVADOS').AsString = 'True' then
        CmdSelectNull := 'WHERE (COD_BARRA LIKE ' + #39 + '%' + InputString + '%' + #39 + ')'
      else
        CmdSelectNull := 'WHERE (COD_BARRA LIKE ' + #39 + '%' + InputString + '%' + #39 + ') AND (STATUS = ' + #39 + 'A' + #39 + ')';

      CmdSelectNull := CmdSelectNull + ' AND (EMPRESA_ID = ' + FrmData.QAcesso.FieldByName('EMPRESA_ID').AsString + ')';
      CmdOrderBy    := 'ORDER BY COD_BARRA';

      QProdutos.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

      QProdutos.Prepare;
      QProdutos.Open;
    end;
  end;

  if QProdutos.State in [dsInsert, dsEdit] then
  begin
    if (Key = Vk_F7) and ((Itens.SelectedField.FieldName = 'CST_PIS_ENTR') or (Itens.SelectedField.FieldName = 'CST_PIS') or (Itens.SelectedField.FieldName = 'NAT_REC')or (Itens.SelectedField.FieldName = 'NCM') OR (Itens.SelectedField.FieldName = 'GRUPO_ID') ) then
    begin
      if Itens.SelectedField.FieldName = 'CST_PIS_ENTR' then
        QProdutos.FieldByName('CST_PIS_ENTR').AsString := GetConsulta_CST('CST_PIS_ENTR', QProdutos.FieldByName('CST_PIS_ENTR').AsString);

      if Itens.SelectedField.FieldName = 'CST_PIS' then
        QProdutos.FieldByName('CST_PIS').AsString := GetConsulta_CST('CST_PIS', QProdutos.FieldByName('CST_PIS_ENTR').AsString);

      if (Itens.SelectedField.FieldName = 'NAT_REC') and ((QProdutos.FieldByName('CST_PIS').AsString = '04') or (QProdutos.FieldByName('CST_PIS').AsString = '05') or (QProdutos.FieldByName('CST_PIS').AsString = '06') or (QProdutos.FieldByName('CST_PIS').AsString = '07') or (QProdutos.FieldByName('CST_PIS').AsString = '08') or (QProdutos.FieldByName('CST_PIS').AsString = '09')) then
        QProdutos.FieldByName('NAT_REC').AsString := GetConsulta_Contribuicao('CONTR' + QProdutos.FieldByName('CST_PIS').AsString, QProdutos.FieldByName('NAT_REC').AsString);

      if Itens.SelectedField.FieldName = 'NCM' then
        QProdutos.FieldByName('NCM').AsString := GetConsulta_NCM(QProdutos.FieldByName('NCM').AsString);

    end;
  end
  else
  begin
    if Key = VK_F7 then
    begin
      InputString := InputBox('Localizar', 'Descrição:', '');

      if InputString <> '' then
      begin
        if FrmPrincipal.Config.FieldByName('VER_DESATIVADOS').AsString = 'True' then
          CmdSelectNull := 'WHERE (DESCRICAO ILIKE ' + #39 + '%' + InputString + '%' + #39 + ')'
        else
          CmdSelectNull := 'WHERE (DESCRICAO ILIKE ' + #39 + '%' + InputString + '%' + #39 + ') AND (STATUS = ' + #39 + 'A' + #39 + ')';

        CmdSelectNull := CmdSelectNull + ' AND (EMPRESA_ID = ' + FrmData.QAcesso.FieldByName('EMPRESA_ID').AsString + ')';
        CmdOrderBy    := 'ORDER BY DESCRICAO';

        QProdutos.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

        QProdutos.Prepare;
        QProdutos.Open;
      end;
    end;
  end;


 if Key = VK_F8 then
 begin

  Begin
    InputString := InputBox('Localizar', 'Código do Produto:', '');
    if InputString <> '' then
    Begin
     InputString := UpperCase(InputString);
      begin
        if FrmData.QAcesso.FieldByName('DESATIVADOS').AsString  = 'True' Then
          CmdSelectNull := 'WHERE (PRODUTO_ID = :PRODUTO_ID )'
        else
          CmdSelectNull := 'WHERE (PRODUTO_ID = :PRODUTO_ID ) ' +
                           'AND (STATUS = :STATUS)';

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
  End;
 end;


  if Key = VK_F9 then
    Perform(Wm_NextDlgCtl, 0, 0);

  if ((Key = Vk_Up) or (Key = Vk_Down)) and (QProdutos.State in [dsInsert, dsEdit]) then
    Key := 0;
end;

procedure TFrmAtualiz_Cst_Pis_Cofins.ItensKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #46 then
    Key := #44;

  if Key = #13 then
    Keybd_Event(VK_TAB, 0, 0, 0);
end;

procedure TFrmAtualiz_Cst_Pis_Cofins.ItensTitleClick(Column: TColumn);
begin
  CmdOrderBy := 'ORDER BY ' + Column.FieldName;

  QProdutos.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

  QProdutos.Prepare;
  QProdutos.Open;
end;

procedure TFrmAtualiz_Cst_Pis_Cofins.QProdutosAfterPost(DataSet: TDataSet);
begin
  IQuery.SQL.Clear;
  IQuery.SQL.Add('SELECT ALIQUOTA_ICMS FROM TRIBUTOS WHERE TRIBUTO_ID = :TRIBUTO_ID');
  IQuery.ParamByName('TRIBUTO_ID').AsInteger :=  QProdutos.FieldByName('TRIBUTO_ID').AsInteger;
  IQuery.Prepare;
  IQuery.Open();

  if not IQuery.IsEmpty then
  Begin
  QUpdate.SQL.Clear;
  QUpdate.SQL.Add('UPDATE PRODUTOS SET ALIQUOTA_ICMS = :ALIQUOTA_ICMS WHERE PRODUTO_ID = :PRODUTO_ID');
  QUpdate.ParamByName('PRODUTO_ID').AsInteger  := QProdutos.FieldByName('PRODUTO_ID').AsInteger;
  QUpdate.ParamByName('ALIQUOTA_ICMS').AsFloat := IQuery.FieldByName('ALIQUOTA_ICMS').AsFloat;
  QUpdate.Prepare;
  QUpdate.ExecSQL;
  End;

  Produto := QProdutos.FieldByName('PRODUTO_ID').AsInteger;

  QProdutos.Close;

  QProdutos.Prepare;
  QProdutos.Open;

  QProdutos.Locate('PRODUTO_ID', Produto, [loCaseInsensitive]);

end;

procedure TFrmAtualiz_Cst_Pis_Cofins.QProdutosBeforeDelete(DataSet: TDataSet);
begin
  abort;
end;

procedure TFrmAtualiz_Cst_Pis_Cofins.QProdutosBeforePost(DataSet: TDataSet);
begin
  Validacao;

  QProdutos.FieldByName('CST_COFINS_ENTR').AsString := QProdutos.FieldByName('CST_PIS_ENTR').AsString;
  QProdutos.FieldByName('CST_COFINS').AsString      := QProdutos.FieldByName('CST_PIS').AsString;



  if QProdutos.FieldByName('FAMILIA_ID').AsInteger > 0 then
  begin

    QUpdate.Sql.Clear;
    QUpdate.Sql.Add('UPDATE PRODUTOS SET CST_PIS_ENTR = :CST_PIS_ENTR, CST_PIS = :CST_PIS, NAT_REC = :NAT_REC, PIS_ENTR =:PIS_ENTR, ' +
                    'PIS =:PIS , COFINS_ENTR = :COFINS_ENTR, COFINS = :COFINS, NCM = :NCM , CEST = :CEST , GRUPO_ID =:GRUPO_ID ,' +
                    'TRIBUTO_ID = :TRIBUTO_ID, FUNCIONARIO_ID = :FUNCIONARIO_ID WHERE ' +
                    '(FAMILIA_ID = :FAMILIA_ID) AND (PRODUTO_ID <> :PRODUTO_ID)');

    QUpdate.ParamByName('CST_PIS_ENTR').AsString := QProdutos.FieldByName('CST_PIS_ENTR').AsString;
    QUpdate.ParamByName('CST_PIS').AsString      := QProdutos.FieldByName('CST_PIS').AsString;
    QUpdate.ParamByName('NAT_REC').AsString      := QProdutos.FieldByName('NAT_REC').AsString;
    QUpdate.ParamByName('PIS_ENTR').AsFloat      := QProdutos.FieldByName('PIS_ENTR').AsFloat;
    QUpdate.ParamByName('PIS').AsFloat           := QProdutos.FieldByName('PIS').AsFloat;
    QUpdate.ParamByName('COFINS_ENTR').AsFloat   := QProdutos.FieldByName('COFINS_ENTR').AsFloat;
    QUpdate.ParamByName('COFINS').AsFloat        := QProdutos.FieldByName('COFINS').AsFloat;
    QUpdate.ParamByName('NCM').AsString          := QProdutos.FieldByName('NCM').AsString;
    QUpdate.ParamByName('CEST').AsString         := QProdutos.FieldByName('CEST').AsString;
    QUpdate.ParamByName('GRUPO_ID').AsInteger    := QProdutos.FieldByName('GRUPO_ID').AsInteger;
    QUpdate.ParamByName('TRIBUTO_ID').AsInteger  := QProdutos.FieldByName('TRIBUTO_ID').AsInteger;
    QUpdate.ParamByName('FAMILIA_ID').AsInteger  := QProdutos.FieldByName('FAMILIA_ID').AsInteger;

    QUpdate.ParamByName('PRODUTO_ID').AsInteger  := QProdutos.FieldByName('PRODUTO_ID').AsInteger;
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

procedure TFrmAtualiz_Cst_Pis_Cofins.QProdutosNewRecord(DataSet: TDataSet);
begin
  QProdutos.Cancel;
end;

procedure TFrmAtualiz_Cst_Pis_Cofins.ibqryQProdutosAfterPost(DataSet: TDataSet);
begin
  Produto := QProdutos.FieldByName('PRODUTO_ID').AsInteger;

  QProdutos.Close;

  QProdutos.Prepare;
  QProdutos.Open;

  QProdutos.Locate('PRODUTO_ID', Produto, [loCaseInsensitive]);
end;

procedure TFrmAtualiz_Cst_Pis_Cofins.ibqryQProdutosBeforeDelete(DataSet: TDataSet);
begin
  abort;
end;

procedure TFrmAtualiz_Cst_Pis_Cofins.ibqryQProdutosBeforePost(DataSet: TDataSet);
begin
  QProdutos.FieldByName('CST_COFINS_ENTR').AsString := QProdutos.FieldByName('CST_PIS_ENTR').AsString;
  QProdutos.FieldByName('CST_COFINS').AsString      := QProdutos.FieldByName('CST_PIS').AsString;
end;

procedure TFrmAtualiz_Cst_Pis_Cofins.ibqryQProdutosNewRecord(DataSet: TDataSet);
begin
  QProdutos.Cancel;
end;

function TFrmAtualiz_Cst_Pis_Cofins.Validacao: Boolean;
var
Cst_Valido: Boolean;
begin
  Result := False;

  if QProdutos.FieldByName('CST_PIS_ENTR').AsString <> '' then
  begin
    IQuery.Sql.Clear;
    IQuery.Sql.Add('SELECT * FROM CST_PIS');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(CODIGO = :CODIGO)');

    IQuery.ParamByName('CODIGO').AsString := QProdutos.FieldByName('CST_PIS_ENTR').AsString;

    IQuery.Prepare;
    IQuery.Open;

    if IQuery.IsEmpty then
    begin
      Application.MessageBox('Cód. CST PIS de Entrada inexistente', PChar(Msg_Title), mb_IconStop);
      exit;
    end;

    if ((Copy(QProdutos.FieldByName('NCM').AsString, 1, 4) = '0201') or (Copy(QProdutos.FieldByName('NCM').AsString, 1, 4) = '0202') or (Copy(QProdutos.FieldByName('NCM').AsString, 1, 6) = '020620')) and ((QProdutos.FieldByName('CST_PIS_ENTR').AsString < '60') or (QProdutos.FieldByName('CST_PIS_ENTR').AsString > '66')) then
    begin
      Application.MessageBox('Para NCM 0201 ou NMC 0202 ou NCM 020620 (Crédito Presumido Revenda), o CST deve ser de 60 a 66', PChar(Msg_Title), mb_IconStop);
      exit;
    end
    else
    begin
      if ((QProdutos.FieldByName('CST_PIS_ENTR').AsString >= '50') and (QProdutos.FieldByName('CST_PIS_ENTR').AsString <= '66')) or ((QProdutos.FieldByName('CST_PIS_ENTR').AsString >= '70') and (QProdutos.FieldByName('CST_PIS_ENTR').AsString <= '75')) or (QProdutos.FieldByName('CST_PIS_ENTR').AsString = '98') or (QProdutos.FieldByName('CST_PIS_ENTR').AsString = '99') then
        Cst_Valido := True
      else
        Cst_Valido := False;

      if not Cst_Valido then
      begin
        Application.MessageBox('CST de entrada/aquisição deve ser de 50 a 66, 70 a 75, 98 ou 99', PChar(Msg_Title), mb_IconStop);
        exit;
      end;
    end;
  end;

  if QProdutos.FieldByName('CST_PIS').AsString <> '' then
  begin
    IQuery.Sql.Clear;
    IQuery.Sql.Add('SELECT * FROM CST_PIS');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(CODIGO = :CODIGO)');

    IQuery.ParamByName('CODIGO').AsString := QProdutos.FieldByName('CST_PIS').AsString;

    IQuery.Prepare;
    IQuery.Open;

    if IQuery.IsEmpty then
    begin
      Application.MessageBox('Cód. CST PIS de Saída inexistente', PChar(Msg_Title), mb_IconStop);
      exit;
    end;
  end;

  if QProdutos.FieldByName('GRUPO_ID').AsString <> '' then
  begin
    IQuery.Sql.Clear;
    IQuery.Sql.Add('SELECT * FROM TABELAS ');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(TABELA_ID = :CODIGO)');
    IQuery.Sql.Add('AND TIPO_TABELA = :TIPO');

    IQuery.ParamByName('CODIGO').AsInteger := QProdutos.FieldByName('GRUPO_ID').AsInteger;
    IQuery.ParamByName('TIPO').AsString   := '7';

    IQuery.Prepare;
    IQuery.Open;

    if IQuery.IsEmpty then
    begin
      Application.MessageBox('Grupo de produtos inexistente', PChar(Msg_Title), mb_IconStop);
      exit;
    end;
  end;

  if QProdutos.FieldByName('TRIBUTO_ID').AsString <> '' then
  begin
    IQuery.Sql.Clear;
    IQuery.Sql.Add('SELECT * FROM TRIBUTOS ');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(TRIBUTO_ID = :TRIBUTO_ID)');

    IQuery.ParamByName('TRIBUTO_ID').AsInteger := QProdutos.FieldByName('TRIBUTO_ID').AsInteger;


    IQuery.Prepare;
    IQuery.Open;

    if IQuery.IsEmpty then
    begin
      Application.MessageBox('Tributo inexistente', PChar(Msg_Title), mb_IconStop);
      Abort;
    end;
  end;
  
  if (QProdutos.FieldByName('PIS').AsFloat > 0) and (QProdutos.FieldByName('CST_PIS').AsString = '') then
  begin
    Application.MessageBox('Se Alíquota PIS for maior do que 0 é obrigatório informar o CST PIS', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  if QProdutos.FieldByName('CST_COFINS_ENTR').AsString <> '' then
  begin
    IQuery.Sql.Clear;
    IQuery.Sql.Add('SELECT * FROM CST_COFINS');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(CODIGO = :CODIGO)');

    IQuery.ParamByName('CODIGO').AsString := QProdutos.FieldByName('CST_COFINS_ENTR').AsString;

    IQuery.Prepare;
    IQuery.Open;

    if IQuery.IsEmpty then
    begin
      Application.MessageBox('Cód. CST COFINS de Entrada inexistente', PChar(Msg_Title), mb_IconStop);
      exit;
    end;

    if ((Copy(QProdutos.FieldByName('NCM').AsString, 1, 4) = '0201') or (Copy(QProdutos.FieldByName('NCM').AsString, 1, 4) = '0202') or (Copy(QProdutos.FieldByName('NCM').AsString, 1, 6) = '020620')) and ((QProdutos.FieldByName('CST_COFINS_ENTR').AsString < '60') or (QProdutos.FieldByName('CST_COFINS_ENTR').AsString > '66')) then
    begin
      Application.MessageBox('Para NCM 0201 ou NMC 0202 ou NCM 020620 (Crédito Presumido Revenda), o CST deve ser de 60 a 66', PChar(Msg_Title), mb_IconStop);
      exit;
    end
    else
    begin
      if ((QProdutos.FieldByName('CST_COFINS_ENTR').AsString >= '50') and (QProdutos.FieldByName('CST_COFINS_ENTR').AsString <= '66')) or ((QProdutos.FieldByName('CST_COFINS_ENTR').AsString >= '70') and (QProdutos.FieldByName('CST_COFINS_ENTR').AsString <= '75')) or (QProdutos.FieldByName('CST_COFINS_ENTR').AsString = '98') or (QProdutos.FieldByName('CST_COFINS_ENTR').AsString = '99') then
        Cst_Valido := True
      else
        Cst_Valido := False;

      if not Cst_Valido then
      begin
        Application.MessageBox('CST de entrada/aquisição deve ser de 50 a 66, 70 a 75, 98 ou 99', PChar(Msg_Title), mb_IconStop);
        exit;
      end;
    end;
  end;

  if QProdutos.FieldByName('CST_COFINS').AsString <> '' then
  begin
    IQuery.Sql.Clear;
    IQuery.Sql.Add('SELECT * FROM CST_COFINS');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(CODIGO = :CODIGO)');

    IQuery.ParamByName('CODIGO').AsString := QProdutos.FieldByName('CST_COFINS').AsString;

    IQuery.Prepare;
    IQuery.Open;

    if IQuery.IsEmpty then
    begin
      Application.MessageBox('Cód. CST COFINS de Saída inexistente', PChar(Msg_Title), mb_IconStop);
      exit;
    end;
  end;

  if (QProdutos.FieldByName('COFINS').AsFloat > 0) and (QProdutos.FieldByName('CST_COFINS').AsString = '') then
  begin
    Application.MessageBox('Se Alíquota COFINS for maior do que 0 é obrigatório informar o CST COFINS', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  if QProdutos.FieldByName('CST_PIS').AsString <> QProdutos.FieldByName('CST_COFINS').AsString then
  begin
 //   Application.MessageBox('Cód. CST PIS de saída diferente de CST COFINS de saída', PChar(Msg_Title), mb_IconStop);
 //   exit;
  end;

  if QProdutos.FieldByName('CST_PIS_ENTR').AsString <> QProdutos.FieldByName('CST_COFINS_ENTR').AsString then
  begin
  //  Application.MessageBox('Cód. CST PIS de entrada diferente de CST COFINS de entrada', PChar(Msg_Title), mb_IconStop);
  //  exit;
  end;

  Result := True;
end;

end.
