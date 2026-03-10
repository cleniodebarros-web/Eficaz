unit UInfo_Produtos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, frxClass, frxExportBaseDialog, frxExportXLSX, frxDBSet;

type
  TFrmInfo_Produtos = class(TForm)
    SrcList: TListBox;
    IncludeBtn: TSpeedButton;
    IncAllBtn: TSpeedButton;
    ExcludeBtn: TSpeedButton;
    ExAllBtn: TSpeedButton;
    DstList: TListBox;
    btnExecuta: TBitBtn;
    btnRetorna: TBitBtn;
    lbl1: TLabel;
    Localiz: TEdit;
    QProdutos: TFDQuery;
    QLayoutFastReport: TFDQuery;
    FrxDSCredito: TfrxDBDataset;
    DadosRelatorio: TFDMemTable;
    DadosRelatorioDATA: TDateField;
    DadosRelatorioNOME: TStringField;
    DadosRelatorioDESCRICAO: TStringField;
    DadosRelatorioQUANTIDADE: TFloatField;
    DadosRelatorioVR_UNITARIO: TFloatField;
    frxXLSXExport1: TfrxXLSXExport;
    Relatorio_Principal: TfrxReport;
    Relatorio_Editar: TfrxReport;
    DadosRelatorioPRODUTO_ID: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LocalizKeyPress(Sender: TObject; var Key: Char);
    procedure IncludeBtnClick(Sender: TObject);
    procedure btnRetornaClick(Sender: TObject);
    procedure IncAllBtnClick(Sender: TObject);
    procedure ExcludeBtnClick(Sender: TObject);
    procedure ExAllBtnClick(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure Relatorio_PrincipalLoadTemplate(Report: TfrxReport;
      const TemplateName: string);
  private
    procedure MoveSelected(List: TCustomListBox; Items: TStrings);
    procedure SetItem(List: TListBox; Index: Integer);
    procedure SetButtons;
    function GetFirstSelection(List: TCustomListBox): Integer;
  public
    { Public declarations }
  end;

var
  FrmInfo_Produtos: TFrmInfo_Produtos;

implementation

uses
  UPrincipal, UData;

{$R *.dfm}

procedure TFrmInfo_Produtos.MoveSelected(List: TCustomListBox; Items: TStrings);
var
I: Integer;
begin
  for I := List.Items.Count - 1 downto 0 do
  begin
    if List.Selected[I] then
    begin
      Items.AddObject(List.Items[I], List.Items.Objects[I]);
      List.Items.Delete(I);
    end;
  end;
end;

procedure TFrmInfo_Produtos.Relatorio_PrincipalLoadTemplate(Report: TfrxReport;
  const TemplateName: string);
var
  BlobStream: TStream;
begin
  QLayoutFastReport.First;
  while not QLayoutFastReport.Eof do
  begin
    //ShowMessage(TemplateName + ' ' + QLayoutFastReport.FieldByName('NOME_RELATORIO').AsString);
    if AnsiCompareText(QLayoutFastReport.FieldByName('NOME_ARQUIVO').AsString, TemplateName) = 0 then
    begin
      //ShowMessage(TemplateName + ' ' + QLayoutFastReport.FieldByName('NOME_ARQUIVO').AsString);
      //ShowMessage('Cheguei aqui');
      BlobStream := TMemoryStream.Create;
      TBlobField(QLayoutFastReport.FieldByName('ARQUIVO_RELATORIO')).SaveToStream(BlobStream);
      BlobStream.Position := 0;
      Report.LoadFromStream(BlobStream);
      BlobStream.Free;
      break;
    end;
    QLayoutFastReport.Next;
  end;
end;

function TFrmInfo_Produtos.GetFirstSelection(List: TCustomListBox): Integer;
begin
  for Result := 0 to List.Items.Count - 1 do
  begin
    if List.Selected[Result] then
      exit;
  end;
  Result := LB_ERR;
end;

procedure TFrmInfo_Produtos.SetButtons;
var
SrcEmpty, DstEmpty: Boolean;
begin
  SrcEmpty           := SrcList.Items.Count = 0;
  DstEmpty           := DstList.Items.Count = 0;
  IncludeBtn.Enabled := not SrcEmpty;
  IncAllBtn.Enabled  := not SrcEmpty;
  ExcludeBtn.Enabled := not DstEmpty;
  ExAllBtn.Enabled   := not DstEmpty;
end;


procedure TFrmInfo_Produtos.SetItem(List: TListBox; Index: Integer);
var
MaxIndex: Integer;
begin
  with List do
  begin
    SetFocus;
    MaxIndex := List.Items.Count - 1;

    if Index = LB_ERR then
      Index := 0
    else if Index > MaxIndex then
      Index := MaxIndex;

    Selected[Index] := True;
  end;

  SetButtons;
end;

procedure TFrmInfo_Produtos.btnExecutaClick(Sender: TObject);
var
I: Integer;
Produtos: String;
begin
  if DstList.Items.Count = 0 then
  begin
    Application.MessageBox('Favor selecionar pelo menos um produto.', PChar(Msg_Title), MB_ICONWARNING);
    Exit;
  end;

  Produtos := '';

  for I := 0 to DstList.Items.Count - 1 do
  begin
    Produtos := Produtos + Copy(DstList.Items[I],1,Pos(' ',DstList.Items[I])-1) + ',';
  end;
  Delete(Produtos, Length(Produtos),1);

  QProdutos.Sql.Clear;
  QProdutos.Sql.Add('SELECT PRODUTOS.PRODUTO_ID, PRODUTOS.DESCRICAO, PRODUTOS.QUANTIDADE_C, PRODUTOS.CUSTO_COMPRA, FORNECEDORES.NOME, PRODUTOS.DT_COMPRA');
  QProdutos.Sql.Add('FROM PRODUTOS');
  QProdutos.Sql.Add('INNER JOIN FORNECEDORES ON FORNECEDORES.FORNECEDOR_ID = PRODUTOS.FORNECEDOR_ID');
  QProdutos.Sql.Add('WHERE');
  QProdutos.Sql.Add('PRODUTOS.PRODUTO_ID IN (&PRODUTOS_ARRAY)');
  QProdutos.Sql.Add('ORDER BY PRODUTOS.DESCRICAO');
  QProdutos.MacroByName('PRODUTOS_ARRAY').AsRaw := Produtos;

  QProdutos.Prepare;
  QProdutos.Open;

  try

    QLayoutFastReport.SQL.Clear;
    QLayoutFastReport.SQL.Add('SELECT NOME_ARQUIVO, ARQUIVO_RELATORIO FROM CONFIG_RELATORIOS');
    QLayoutFastReport.SQL.Add('WHERE NOME_RELATORIO = :NOME_RELATORIO');
    QLayoutFastReport.SQL.Add('OR NOME_RELATORIO = :BASE;');
    QLayoutFastReport.ParamByName('NOME_RELATORIO').AsString := 'UInfo_Produtos';
    QLayoutFastReport.ParamByName('BASE').AsString := 'base';
    QLayoutFastReport.Open();


  Except
  on e:Exception do
  begin
    Application.MessageBox(PChar('Erro:' + #13 +
      'Erro: ' + e.Message), 'Erro', MB_ICONSTOP + MB_TASKMODAL);
  end;
  end;

  Relatorio_Principal.Clear;
  DadosRelatorio.Open;
  DadosRelatorio.EmptyDataSet;
  while not QProdutos.Eof do
  begin
    DadosRelatorio.Append;

    DadosRelatorio.FieldByName('PRODUTO_ID').AsInteger := QProdutos.FieldByName('PRODUTO_ID').AsInteger;
    DadosRelatorio.FieldByName('DESCRICAO').AsString   := QProdutos.FieldByName('DESCRICAO').AsString;
    DadosRelatorio.FieldByName('QUANTIDADE_C').AsFloat := QProdutos.FieldByName('QUANTIDADE_C').AsFloat;
    DadosRelatorio.FieldByName('CUSTO_COMPRA').AsFloat := QProdutos.FieldByName('CUSTO_COMPRA').AsFloat;
    DadosRelatorio.FieldByName('NOME').AsString        := QProdutos.FieldByName('NOME').AsString;
    DadosRelatorio.FieldByName('DT_COMPRA').AsString   := QProdutos.FieldByName('DT_COMPRA').AsString;

    DadosRelatorio.Post;

    QProdutos.Next;
  end;

  Relatorio_Principal.Clear;
  Relatorio_Principal.InheritFromTemplate('UInfo_Produtos.fr3');
  Relatorio_Principal := FrmPrincipal.Configura_Relatorio_FastReport(Relatorio_Principal, '', 'Relatório de Informações de Produtos');
  Relatorio_Principal.ShowReport(true);
end;

procedure TFrmInfo_Produtos.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmInfo_Produtos.ExAllBtnClick(Sender: TObject);
var
I: Integer;
begin
  for I := 0 to DstList.Items.Count - 1 do
    SrcList.Items.AddObject(DstList.Items[I], DstList.Items.Objects[I]);

  DstList.Items.Clear;
  SetItem(DstList, 0);
end;

procedure TFrmInfo_Produtos.ExcludeBtnClick(Sender: TObject);
var
Index: Integer;
begin
    Index := GetFirstSelection(DstList);
    MoveSelected(DstList, SrcList.Items);
    SetItem(DstList, Index);
end;

procedure TFrmInfo_Produtos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmInfo_Produtos.IncAllBtnClick(Sender: TObject);
var
I: Integer;
begin
    for I := 0 to SrcList.Items.Count - 1 do
      DstList.Items.AddObject(SrcList.Items[I], SrcList.Items.Objects[I]);

    SrcList.Items.Clear;
    SetItem(SrcList, 0);
end;

procedure TFrmInfo_Produtos.IncludeBtnClick(Sender: TObject);
var
Index: Integer;
begin
    Index := GetFirstSelection(SrcList);
    MoveSelected(SrcList, DstList.Items);
    SetItem(SrcList, Index);
end;

procedure TFrmInfo_Produtos.LocalizKeyPress(Sender: TObject; var Key: Char);
begin
  TRY
    if (Key = #27) OR (Key = #09) then
      ModalResult := mrCancel;

    if Key = #13 then
    begin
      SrcList.Items.Clear;

      if (Localiz.Text <> '') and (Localiz.Text <> ' ') then
      begin
        QProdutos.Sql.Clear;
        QProdutos.Sql.Add('SELECT PRODUTO_ID, DESCRICAO FROM PRODUTOS');
        QProdutos.Sql.Add('WHERE');
        QProdutos.Sql.Add('DESCRICAO LIKE :DESCRICAO');
        QProdutos.Sql.Add('AND EMPRESA_ID = :EMPRESA_ID');
        QProdutos.Sql.Add('AND STATUS = :STATUS');
        QProdutos.Sql.Add('ORDER BY DESCRICAO');

        QProdutos.ParamByName('DESCRICAO').AsString    := '%' + UpperCase(Localiz.Text) + '%';
      end
      else
      begin
        QProdutos.Sql.Clear;
        QProdutos.Sql.Add('SELECT PRODUTO_ID, DESCRICAO FROM PRODUTOS');
        QProdutos.Sql.Add('WHERE');
        QProdutos.Sql.Add('EMPRESA_ID = :EMPRESA_ID');
        QProdutos.Sql.Add('AND STATUS = :STATUS');
        QProdutos.Sql.Add('ORDER BY DESCRICAO');
      end;
      QProdutos.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
      QProdutos.ParamByName('STATUS').AsString       := 'A';

      QProdutos.Prepare;
      QProdutos.Open;

      QProdutos.First;
      while not QProdutos.Eof do
      begin
        SrcList.Items.Add(QProdutos.FieldByName('PRODUTO_ID').AsString + ' - ' + QProdutos.FieldByName('DESCRICAO').AsString);
        QProdutos.Next;
      end;
    end;
  EXCEPT

  END;
end;

end.
