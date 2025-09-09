unit UConferirXml;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Xml.xmldom, Xml.XMLIntf,
  Data.DB, Xml.Win.msxmldom, Xml.XMLDoc, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, RxToolEdit,
  Vcl.Grids, Vcl.DBGrids, acDBGrid,Math;

type
  TFrmConferirxml = class(TForm)
    sDBGrid1: TsDBGrid;
    Label1: TLabel;
    Dtmen: TDateEdit;
    Dtmai: TDateEdit;
    btnExecuta: TBitBtn;
    QDados: TFDQuery;
    FDMemTable1: TFDMemTable;
    XML: TXMLDocument;
    FDMemTable1Transacao_id: TIntegerField;
    FDMemTable1Chave_Nfce: TStringField;
    FDMemTable1Valor_Transacao: TFloatField;
    FDMemTable1Base_Transacao: TFloatField;
    FDMemTable1Icms_Transacao: TFloatField;
    FDMemTable1Valor_xml: TFloatField;
    FDMemTable1Base_Xml: TFloatField;
    FDMemTable1Icms_xml: TFloatField;
    DataSource1: TDataSource;
    FDMemTable1Data: TDateField;
    lblCaixa: TLabel;
    CaixaCb: TComboBox;
    Label2: TLabel;
    FDMemTable1situacao: TStringField;
    FDMemTable1Caixa: TIntegerField;
    btnRetorna: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExecutaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnRetornaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConferirxml: TFrmConferirxml;

implementation

uses
  UData, UPrincipal;

{$R *.dfm}

function RecursiveFindNode(
  ANode: IXMLNode; const SearchNodeName: string): IXMLNode;
var
  I: Integer;
begin
  Result := nil;
  if not Assigned(ANode) then
    exit;

  if CompareText(ANode.NodeName, SearchNodeName) = 0 then
    Result := ANode
  else
    if Assigned(ANode.ChildNodes) then
      for I := 0 to ANode.ChildNodes.Count - 1 do
      begin
        Result := RecursiveFindNode(ANode.ChildNodes[I], SearchNodeName);
        if Result <> nil then
          Exit;
      end;
end;

procedure TFrmConferirxml.btnExecutaClick(Sender: TObject);
var
i:integer;
node_principal : IXMLNode;
node_nfeproc: IXMLNode;
node_total : IXMLNode;
Valor_node: IXMLNode;
begin
QDados.Sql.Clear;
QDados.Sql.Add('SELECT TRANSMISSAO,TRANSACOES.BANCO_ID,TRANSACOES.TRANSACAO_ID,COMPL_NFCEFISCAL.CHAVE_NFCE, DT_TRANS,TRANSACOES.VALOR,BASE_ICMS_NORMAL,VR_ICMS_NORMAL, ARQUIVO_XML');
QDados.Sql.Add('FROM TRANSACOES');
QDados.Sql.Add('INNER JOIN COMPL_NFCEFISCAL ON TRANSACOES.TRANSACAO_ID = COMPL_NFCEFISCAL.TRANSACAO_ID');
QDados.Sql.Add('WHERE DT_TRANS BETWEEN :DT_INI AND :DT_FIM');

 if CaixaCb.Text <> '' Then
 Begin
 QDados.Sql.Add('AND BANCO_ID = :BANCO_ID');
 QDados.ParamByName('BANCO_ID').AsInteger := StrToINt(CaixaCb.Text);
 End;

QDados.Sql.Add('AND CONDUTA =''01'' AND DEPTO =''07'' AND MODELO = ''65'' ORDER BY DT_TRANS ');





QDados.ParamByName('DT_INI').AsDatetime := DtMEN.date;
QDados.ParamByName('DT_FIM').AsDatetime := DtMAI.date;
QDados.Prepare;
QDAdos.Open;

 QDados.first;

 if not QDados.IsEmpty Then
 Begin
  {
    for I := 0 to XML.DocumentElement.ChildNodes.Count - 1 do
    Begin
     with XML.DocumentElement.ChildNodes[I] do
      begin
      Memo1.Lines.Add('Base: '+ ChildNodes['nfeProc'].ChildNodes['nfe'].ChildNodes['infnfe'].ChildNodes['ICMSTot'].ChildNodes['VBc'].Text);
      Memo1.Lines.Add('icms: '+ ChildNodes['nfeProc'].ChildNodes['nfe'].ChildNodes['infnfe'].ChildNodes['ICMSTot'].ChildNodes['VIcms'].Text);
      Memo1.Lines.Add('Valor Icms: '+ ChildNodes['nfeProc'].ChildNodes['nfe'].ChildNodes['infnfe'].ChildNodes['ICMSTot'].ChildNodes['VNf'].Text);
      end;
    End;

     XML.Active := False;
      }
      i := 0;
      QDados.First;
      while not Qdados.Eof do
      Begin
       inc(i);
       QDados.next;
      End;
      QDados.First;

   FdMemtable1.Open;
   FdMemtable1.EmptyDataSet;

   Label2.Caption := 'Notas Fiscais Eletronicas: ' + IntToStr(i);

   i := 0;
   while not QDados.Eof do
   Begin

       XMl.LoadFromXML(QDados.FieldByName('ARQUIVO_XML').AsString);
       XML.Active     := True;
       node_principal := XML.DocumentElement;
       node_total     := RecursiveFindNode(node_principal, 'total');


      // Memo1.Lines.Add('Base: ' + node_total.ChildNodes['ICMSTot'].ChildNodes['vBC'].Text);
      // Memo1.Lines.Add('icms: '+ node_total.ChildNodes['ICMSTot'].ChildNodes['vICMS'].Text);
      // Memo1.Lines.Add('Valor: '+node_total.ChildNodes['ICMSTot'].ChildNodes['vNF'].Text);

    if  Roundto(QDados.FieldByName('BASE_ICMS_NORMAL').AsFloat,-2) <>  roundto(StrToFloat(StringReplace(node_total.ChildNodes['ICMSTot'].ChildNodes['vBC'].Text,'.',',',[])),-2) Then
    Begin
       inc(i);
    FdMemtable1.Append;
    FdMemtable1.FieldByName('CAIXA').AsInteger         := QDados.FieldByName('BANCO_ID').Asinteger;
    FdMemtable1.FieldByName('TRANSACAO_id').AsInteger  := QDados.FieldByName('TRANSACAO_ID').AsInteger;
    FdMemtable1.FieldByName('DATA').AsDateTime         := QDados.FieldByName('DT_TRANS').AsDateTime;
    FdMemtable1.FieldByName('CHAVE_NFCE').AsString     := QDados.FieldByName('CHAVE_NFCE').AsString;

    IF QDados.FieldByName('TRANSMISSAO').AsString = 'SIM' Then
    FdMemtable1.FieldByName('SITUACAO').AsString       := 'Enviada'
    Else
    FdMemtable1.FieldByName('SITUACAO').AsString       := 'Pendente';

    FdMemtable1.FieldByName('VALOR_TRANSACAO').AsFloat := QDados.FieldByName('VALOR').AsFloat;
    FdMemtable1.FieldByName('BASE_TRANSACAO').AsFloat  := QDados.FieldByName('BASE_ICMS_NORMAL').AsFloat;
    FdMemtable1.FieldByName('ICMS_TRANSACAO').AsFloat  := QDados.FieldByName('VR_ICMS_NORMAL').AsFloat;
    FdMemtable1.FieldByName('VALOR_XML').AsFloat       := StrToFloat(StringReplace(node_total.ChildNodes['ICMSTot'].ChildNodes['vNF'].Text,'.',',',[]));
    FdMemtable1.FieldByName('BASE_XML').AsFloat        := StrToFloat(StringReplace(node_total.ChildNodes['ICMSTot'].ChildNodes['vBC'].Text,'.',',',[]));
    FdMemtable1.FieldByName('ICMS_XML').AsFloat        := StrToFloat(StringReplace(node_total.ChildNodes['ICMSTot'].ChildNodes['vICMS'].Text,'.',',',[]));
    FdMemtable1.Post;

    XML.Active := False;
    End;

    {
    if Node_Principal.NodeName <> 'nfeProc' Then
    Begin
    FdMemtable1.Append;
    FdMemtable1.FieldByName('CAIXA').AsInteger         := QDados.FieldByName('BANCO_ID').Asinteger;
    FdMemtable1.FieldByName('TRANSACAO_id').AsInteger  := QDados.FieldByName('TRANSACAO_ID').AsInteger;
    FdMemtable1.FieldByName('DATA').AsDateTime         := QDados.FieldByName('DT_TRANS').AsDateTime;
    FdMemtable1.FieldByName('CHAVE_NFCE').AsString     := QDados.FieldByName('CHAVE_NFCE').AsString;
    FdMemtable1.FieldByName('SITUACAO').AsString       := 'sem nfeProc';


    FdMemtable1.FieldByName('VALOR_TRANSACAO').AsFloat := QDados.FieldByName('VALOR').AsFloat;
    FdMemtable1.FieldByName('BASE_TRANSACAO').AsFloat  := QDados.FieldByName('BASE_ICMS_NORMAL').AsFloat;
    FdMemtable1.FieldByName('ICMS_TRANSACAO').AsFloat  := QDados.FieldByName('VR_ICMS_NORMAL').AsFloat;
    FdMemtable1.FieldByName('VALOR_XML').AsFloat       := StrToFloat(StringReplace(node_total.ChildNodes['ICMSTot'].ChildNodes['vNF'].Text,'.',',',[]));
    FdMemtable1.FieldByName('BASE_XML').AsFloat        := StrToFloat(StringReplace(node_total.ChildNodes['ICMSTot'].ChildNodes['vBC'].Text,'.',',',[]));
    FdMemtable1.FieldByName('ICMS_XML').AsFloat        := StrToFloat(StringReplace(node_total.ChildNodes['ICMSTot'].ChildNodes['vICMS'].Text,'.',',',[]));
    FdMemtable1.Post;

    XML.Active := False;
    End;
    }

    QDados.next;
    Application.ProcessMessages;

   End;
   Label2.Caption := Label2.Caption + '   Notas com divergência:' + IntToStr(i);

 End;
end;

procedure TFrmConferirxml.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmConferirxml.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action := caFree;
end;

procedure TFrmConferirxml.FormCreate(Sender: TObject);
begin
  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);

  QDados.Sql.Clear;
  Qdados.Sql.Add('SELECT * FROM LICENCA_IF WHERE STATUS = ''A'' ORDER BY NUM_ECF');
  QDados.Prepare;
  QDados.Open;

  while not QDados.eof do
  Begin
    CaixaCb.Items.Add(QDados.FieldbyName('NUM_ECF').AsString);
   QDados.Next;
  End;


end;

end.
