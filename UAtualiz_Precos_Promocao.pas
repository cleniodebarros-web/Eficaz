unit UAtualiz_Precos_Promocao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBCustomDataSet, IBUpdateSQL, DB, IBQuery, StdCtrls, Buttons,
  ExtCtrls, Tabs, ComCtrls, Grids, DBGrids, Mask, rxToolEdit, QRCtrls, QuickRpt,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, FireDAC.Comp.DataSet;

type
  TFrmAtualiz_Precos_Promocao = class(TForm)
    Itens: TDBGrid;
    Alfabeto: TTabSet;
    Panel1: TPanel;
    btnRetorna: TBitBtn;
    DataProdutos: TDataSource;
    btnPesquisa: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    Dtmen: TDateEdit;
    Dtmai: TDateEdit;
    StatusBar1: TStatusBar;
    Tabela_Produtos: TQuickRep;
    QRBand5: TQRBand;
    QRSysData7: TQRSysData;
    QRLabel32: TQRLabel;
    QRSysData8: TQRSysData;
    QRLabel33: TQRLabel;
    QRShape7: TQRShape;
    QRDBText23: TQRDBText;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRShape8: TQRShape;
    QRLabel40: TQRLabel;
    QRBand6: TQRBand;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText29: TQRDBText;
    btnImprime: TBitBtn;
    QUpdate: TFDQuery;
    QProdutos: TFDQuery;
    QRel: TFDQuery;
    USql_Produtos: TFDUpdateSQL;
    procedure FormCreate(Sender: TObject);
    procedure ItensKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ItensKeyPress(Sender: TObject; var Key: Char);
    procedure AlfabetoClick(Sender: TObject);
    procedure QProdutos1AfterPost(DataSet: TDataSet);
    procedure QProdutos1BeforeDelete(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRetornaClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnPesquisaClick(Sender: TObject);
    procedure QProdutos1NewRecord(DataSet: TDataSet);
    procedure QProdutos1BeforePost(DataSet: TDataSet);
    procedure ItensTitleClick(Column: TColumn);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DtmenEnter(Sender: TObject);
    procedure QProdutos1BeforeInsert(DataSet: TDataSet);
    procedure QProdutos1AfterEdit(DataSet: TDataSet);
    procedure btnImprimeClick(Sender: TObject);
    procedure QProdutosAfterEdit(DataSet: TDataSet);
    procedure QProdutosAfterPost(DataSet: TDataSet);
    procedure QProdutosBeforeDelete(DataSet: TDataSet);
    procedure QProdutosBeforeInsert(DataSet: TDataSet);
    procedure QProdutosBeforePost(DataSet: TDataSet);
    procedure QProdutosNewRecord(DataSet: TDataSet);
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
  FrmAtualiz_Precos_Promocao: TFrmAtualiz_Precos_Promocao;

implementation

uses
  UData, UPrincipal, UPesquisa;

{$R *.dfm}

procedure TFrmAtualiz_Precos_Promocao.AlfabetoClick(Sender: TObject);
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
  QProdutos.Open;
end;

procedure TFrmAtualiz_Precos_Promocao.btnImprimeClick(Sender: TObject);
begin
  QRel.Sql.Clear;
  QRel.Sql.Add('SELECT * FROM PRODUTOS');
  QRel.Sql.Add('WHERE');
  QRel.Sql.Add('(PROMO_INICIAL = :PROMO_INICIAL)');
  QRel.Sql.Add('AND (PROMO_FINAL = :PROMO_FINAL)');
  QRel.Sql.Add('AND (DT_ATUALIZACAO = :DT_ATUALIZACAO)');

  QRel.ParamByName('PROMO_INICIAL').AsDateTime  := Dtmen.Date;
  QRel.ParamByName('PROMO_FINAL').AsDateTime    := Dtmai.Date;
  QRel.ParamByName('DT_ATUALIZACAO').AsDateTime := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;

  QRel.Prepare;
  QRel.Open;

  QRLabel40.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;

  Tabela_Produtos.PreviewModal;
end;

procedure TFrmAtualiz_Precos_Promocao.btnPesquisaClick(Sender: TObject);
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

procedure TFrmAtualiz_Precos_Promocao.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmAtualiz_Precos_Promocao.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmAtualiz_Precos_Promocao.DtmenKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
   // Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmAtualiz_Precos_Promocao.QProdutosAfterEdit(DataSet: TDataSet);
begin
  QProdutos.FieldByName('PROMO_INICIAL').AsDateTime  := Dtmen.Date;
  QProdutos.FieldByName('PROMO_FINAL').AsDateTime    := Dtmai.Date;
  QProdutos.FieldByName('DT_ATUALIZACAO').AsDateTime := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;

end;

procedure TFrmAtualiz_Precos_Promocao.QProdutosAfterOpen(DataSet: TDataSet);
begin
TFloatField(QProdutos.FieldByName('PRECO_VAREJO')).DisplayFormat    := '#,##0.00';
TFloatField(QProdutos.FieldByName('PRECO_PRAZO')).DisplayFormat     := '#,##0.00';
TFloatField(QProdutos.FieldByName('PRECO_PROMOCAO')).DisplayFormat  := '#,##0.00';
TFloatField(QProdutos.FieldByName('VALOR_COMPRA')).DisplayFormat    := '#,##0.00';
end;

procedure TFrmAtualiz_Precos_Promocao.QProdutosAfterPost(DataSet: TDataSet);
var
Item: Integer;
begin

  Item := QProdutos.FieldByName('PRODUTO_ID').AsInteger;

  QProdutos.Close;

  QProdutos.Prepare;
  QProdutos.Open;

  QProdutos.Locate('PRODUTO_ID', Item, [loCaseInsensitive]);


  Itens.SelectedIndex := 5;




  if (LeIni(Arq_Ini, 'Sistema', 'Carga Automática de Produtos') = 'True') and (FrmPrincipal.QEmpresa.FieldByName('CARGA').AsString = 'SIM') then
    Carga_PDV_Off_Line(QProdutos.FieldByName('PRODUTO_ID').AsInteger, 0);
end;


procedure TFrmAtualiz_Precos_Promocao.QProdutosBeforeDelete(DataSet: TDataSet);
begin
 abort;
end;

procedure TFrmAtualiz_Precos_Promocao.QProdutosBeforeInsert(DataSet: TDataSet);
begin
QProdutos.Cancel;
end;

procedure TFrmAtualiz_Precos_Promocao.QProdutosBeforePost(DataSet: TDataSet);
begin
  QProdutos.FieldByName('PROMO_INICIAL').AsDateTime  := Dtmen.Date;
  QProdutos.FieldByName('PROMO_FINAL').AsDateTime    := Dtmai.Date;
  QProdutos.FieldByName('DT_ATUALIZACAO').AsDateTime := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;

  if QProdutos.FieldByName('FAMILIA_ID').AsInteger > 0 then
  begin
    QUpdate.Sql.Clear;
    QUpdate.Sql.Add('UPDATE PRODUTOS SET PRECO_PROMOCAO = :PRECO_PROMOCAO, PROMO_INICIAL = :PROMO_INICIAL, FUNCIONARIO_ID =:FUNCIONARIO_ID, PROMO_FINAL = :PROMO_FINAL, DT_ATUALIZACAO = :DT_ATUALIZACAO,QUANTIDADE_P = :QUANTIDADE_P, SUPERVISOR = :SUPERVISOR ' +
                                         'WHERE ' +
                                         '(FAMILIA_ID = :FAMILIA_ID)' +
                                         'AND (PRODUTO_ID <> :PRODUTO_ID)');

    QUpdate.ParamByName('PRECO_PROMOCAO').AsFloat    := QProdutos.FieldByName('PRECO_PROMOCAO').AsFloat;
    QUpdate.ParamByName('PROMO_INICIAL').AsDateTime  := Dtmen.Date;
    QUpdate.ParamByName('PROMO_FINAL').AsDateTime    := Dtmai.Date;
    QUpdate.ParamByName('DT_ATUALIZACAO').AsDateTime := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
    QUpdate.ParamByName('FAMILIA_ID').AsInteger      := QProdutos.FieldByName('FAMILIA_ID').AsInteger;
    QUpdate.ParamByName('PRODUTO_ID').AsInteger      := QProdutos.FieldByName('PRODUTO_ID').AsInteger;
    QUpdate.ParamByName('FUNCIONARIO_ID').AsInteger  := FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger;
    QUpdate.ParamByName('QUANTIDADE_P').AsFloat      := QProdutos.FieldByName('QUANTIDADE_P').AsFloat;
    QUpdate.ParamByName('SUPERVISOR').AsString       := QProdutos.FieldByName('SUPERVISOR').AsString;


    QUpdate.Prepare;
    QUpdate.ExecSql;


  end
  Else
  Begin
    QUpdate.Sql.Clear;
    QUpdate.Sql.Add('UPDATE PRODUTOS SET  FUNCIONARIO_ID = :FUNCIONARIO_ID ' +
                                         'WHERE ' +
                                         '(PRODUTO_ID = :PRODUTO_ID)');

    QUpdate.ParamByName('PRODUTO_ID').AsInteger     := QProdutos.FieldByName('PRODUTO_ID').AsInteger;
    QUpdate.ParamByName('FUNCIONARIO_ID').AsInteger := FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger;

    QUpdate.Prepare;
    QUpdate.ExecSql;

  end;

   IF (QProdutos.FieldByName('SUPERVISOR').AsString <> 'SIM') Then
   Itens.DataSource.DataSet.FieldByName('SUPERVISOR').AsString := 'NÃO';


end;

procedure TFrmAtualiz_Precos_Promocao.QProdutosNewRecord(DataSet: TDataSet);
begin
QProdutos.Cancel;
end;

procedure TFrmAtualiz_Precos_Promocao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmAtualiz_Precos_Promocao.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if QProdutos.State in [dsInsert, dsEdit] then
  begin
    Application.MessageBox('É melhor salvar as alterações antes de continuar', PChar(Msg_Title), mb_IconStop);
    CanClose := False;
  end;
end;

procedure TFrmAtualiz_Precos_Promocao.FormCreate(Sender: TObject);
begin
  Dtmen.Date := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
  Dtmai.Date := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;

  Itens.Columns[0].Width := 50;
  Itens.Columns[1].Width := 242;
  Itens.Columns[2].Width := 70;
  Itens.Columns[3].Width := 70;
  Itens.Columns[4].Width := 75;
  Itens.Columns[5].Width := 75;
  Itens.Columns[6].Width := 75;

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
  QProdutos.Open;
end;

procedure TFrmAtualiz_Precos_Promocao.ItensKeyDown(Sender: TObject; var Key: Word;
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

  if Key = VK_F7 then
  begin
    InputString := InputBox('Localizar', 'Descrição:', '');

    if InputString <> '' then
    begin
      if FrmPrincipal.Config.FieldByName('VER_DESATIVADOS').AsString = 'True' then
        CmdSelectNull := 'WHERE (DESCRICAO  ILIKE ' + #39 + '%' + InputString + '%' + #39 + ')'
      else
        CmdSelectNull := 'WHERE (DESCRICAO ILIKE ' + #39 + '%' + InputString + '%' + #39 + ') AND (STATUS = ' + #39 + 'A' + #39 + ')';

      CmdSelectNull := CmdSelectNull + ' AND (EMPRESA_ID = ' + FrmData.QAcesso.FieldByName('EMPRESA_ID').AsString + ')';
      CmdOrderBy    := 'ORDER BY DESCRICAO';

      QProdutos.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;
      QProdutos.Prepare;
      QProdutos.Open;
    end;
  end;

  if Key = VK_F8 then
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



  if Key = VK_F9 then
    Perform(Wm_NextDlgCtl, 0, 0);

  if ((Key = Vk_Up) or (Key = Vk_Down)) and (QProdutos.State in [dsInsert, dsEdit]) then
    Key := 0;
end;

procedure TFrmAtualiz_Precos_Promocao.ItensKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #46 then
    Key := #44;

  if Key = #13 then
    Keybd_Event(VK_TAB, 0, 0, 0);


    IF Itens.SelectedField.FieldName = 'supervisor' then
    Begin
     If not (key in['S','I','M','N','Ã','O'] ) then
     key:=#0;
    End;

end;

procedure TFrmAtualiz_Precos_Promocao.ItensTitleClick(Column: TColumn);
begin
  CmdOrderBy := 'ORDER BY ' + Column.FieldName;

  QProdutos.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;
  QProdutos.Open;
end;

procedure TFrmAtualiz_Precos_Promocao.QProdutos1AfterEdit(DataSet: TDataSet);
begin
  QProdutos.FieldByName('PROMO_INICIAL').AsDateTime  := Dtmen.Date;
  QProdutos.FieldByName('PROMO_FINAL').AsDateTime    := Dtmai.Date;
  QProdutos.FieldByName('DT_ATUALIZACAO').AsDateTime := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
end;

procedure TFrmAtualiz_Precos_Promocao.QProdutos1AfterPost(DataSet: TDataSet);
var
Item: Integer;
begin


  Item := QProdutos.FieldByName('PRODUTO_ID').AsInteger;

  QProdutos.Close;

  QProdutos.Prepare;
  QProdutos.Open;

  QProdutos.Locate('PRODUTO_ID', Item, [loCaseInsensitive]);

  if (LeIni(Arq_Ini, 'Sistema', 'Carga Automática de Produtos') = 'True') and (FrmPrincipal.QEmpresa.FieldByName('CARGA').AsString = 'SIM') then
    Carga_PDV_Off_Line(QProdutos.FieldByName('PRODUTO_ID').AsInteger, 0);
end;

procedure TFrmAtualiz_Precos_Promocao.QProdutos1BeforeDelete(DataSet: TDataSet);
begin
  abort;
end;

procedure TFrmAtualiz_Precos_Promocao.QProdutos1BeforeInsert(DataSet: TDataSet);
begin
  QProdutos.Cancel;
end;

procedure TFrmAtualiz_Precos_Promocao.QProdutos1BeforePost(DataSet: TDataSet);
begin
  QProdutos.FieldByName('PROMO_INICIAL').AsDateTime  := Dtmen.Date;
  QProdutos.FieldByName('PROMO_FINAL').AsDateTime    := Dtmai.Date;
  QProdutos.FieldByName('DT_ATUALIZACAO').AsDateTime := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;

  if QProdutos.FieldByName('FAMILIA_ID').AsInteger > 0 then
  begin
    QUpdate.Sql.Clear;
    QUpdate.Sql.Add('UPDATE PRODUTOS SET PRECO_PROMOCAO = :PRECO_PROMOCAO, PROMO_INICIAL = :PROMO_INICIAL, PROMO_FINAL = :PROMO_FINAL, DT_ATUALIZACAO = :DT_ATUALIZACAO,QUANTIDADE_P = :QUANTIDADE_P, SUPERVISOR = :SUPERVISOR ' +
                                         'WHERE ' +
                                         '(FAMILIA_ID = :FAMILIA_ID)' +
                                         'AND (PRODUTO_ID <> :PRODUTO_ID)');

    QUpdate.ParamByName('PRECO_PROMOCAO').AsFloat    := QProdutos.FieldByName('PRECO_PROMOCAO').AsFloat;
    QUpdate.ParamByName('PROMO_INICIAL').AsDateTime  := Dtmen.Date;
    QUpdate.ParamByName('PROMO_FINAL').AsDateTime    := Dtmai.Date;
    QUpdate.ParamByName('DT_ATUALIZACAO').AsDateTime := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
    QUpdate.ParamByName('FAMILIA_ID').AsInteger      := QProdutos.FieldByName('FAMILIA_ID').AsInteger;
    QUpdate.ParamByName('PRODUTO_ID').AsInteger      := QProdutos.FieldByName('PRODUTO_ID').AsInteger;
    QUpdate.ParamByName('QUANTIDADE_P').AsFloat      := QProdutos.FieldByName('QUANTIDADE_P').AsFloat;
    QUpdate.ParamByName('SUPERVISOR').AsString       := QProdutos.FieldByName('SUPERVISOR').AsString;

    QUpdate.Prepare;
    QUpdate.ExecSql;


  end;
end;

procedure TFrmAtualiz_Precos_Promocao.QProdutos1NewRecord(DataSet: TDataSet);
begin
  QProdutos.Cancel;
end;

end.
