unit UEtiq_Laser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Spin, Mask, rxToolEdit, rxCurrEdit, DB,
  DBTables, IBCustomDataSet, IBQuery,  QRCtrls, QuickRpt, ACBrBarCode,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmEtiq_Laser = class(TForm)
    Label4: TLabel;
    Compr_Folha: TCurrencyEdit;
    Label5: TLabel;
    Altura_Folha: TCurrencyEdit;
    Margem_Esquerda: TCurrencyEdit;
    Margem_Inferior: TCurrencyEdit;
    Espacamento: TCurrencyEdit;
    Label3: TLabel;
    Label9: TLabel;
    Label7: TLabel;
    Altura_Etiqueta: TCurrencyEdit;
    Colunas: TSpinEdit;
    Margem_Superior: TCurrencyEdit;
    Margem_Direita: TCurrencyEdit;
    Label6: TLabel;
    Label8: TLabel;
    Label2: TLabel;
    Label10: TLabel;
    Label1: TLabel;
    Label11: TLabel;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    Bevel1: TBevel;
    Codigo_Inicial: TCurrencyEdit;
    btnProduto1: TSpeedButton;
    Codigo_Final: TCurrencyEdit;
    btnProduto2: TSpeedButton;
    Forne: TCurrencyEdit;
    btnForne_Cliente: TSpeedButton;
    Etiq_Laser: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    Etiq_Jato: TQuickRep;
    QRBand1: TQRBand;
    QRShape5: TQRShape;
    QRShape4: TQRShape;
    QRShape2: TQRShape;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    Label12: TLabel;
    Dtmen: TDateEdit;
    Dtmai: TDateEdit;
    Image1: TImage;
    QRDBImage1: TQRDBImage;
    QRDBText8: TQRDBText;
    QRDBImage2: TQRDBImage;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBImage3: TQRDBImage;
    QRDBText11: TQRDBText;
    QRDBImage4: TQRDBImage;
    QRDBText12: TQRDBText;
    QRDBImage5: TQRDBImage;
    QRDBText13: TQRDBText;
    QRDBImage6: TQRDBImage;
    ACBrBarCode1: TACBrBarCode;
    QEstoque: TFDQuery;
    Table_Temp: TFDMemTable;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRetornaClick(Sender: TObject);
    procedure btnProduto1Click(Sender: TObject);
    procedure btnProduto2Click(Sender: TObject);
    procedure btnForne_ClienteClick(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure Compr_FolhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Seleciona_Produtos;
  end;

var
  FrmEtiq_Laser: TFrmEtiq_Laser;

implementation

uses
  UPrincipal, UData, UConsulta;

{$R *.dfm}

procedure TFrmEtiq_Laser.Seleciona_Produtos;
begin
  QEstoque.Sql.Clear;
  QEstoque.Sql.Add('SELECT * FROM PRODUTOS');
  QEstoque.Sql.Add('WHERE');
  QEstoque.Sql.Add('((DT_ATUALIZACAO BETWEEN :DT_INICIAL AND :DT_FINAL) OR (DT_PRECO BETWEEN :DT_INICIAL AND :DT_FINAL))');

  if (Codigo_Inicial.Value > 0) and (Codigo_Final.Value >= Codigo_Inicial.Value) then
  begin
    QEstoque.Sql.Add('AND (PRODUTO_ID BETWEEN :CODIGO_INICIAL AND :CODIGO_FINAL)');

    QEstoque.ParamByName('CODIGO_INICIAL').AsInteger := StrToInt(Codigo_Inicial.Text);
    QEstoque.ParamByName('CODIGO_FINAL').AsInteger   := StrToInt(Codigo_Final.Text);
  end;

  if Forne.Value > 0 then
  begin
    QEstoque.Sql.Add('AND (FORNECEDOR_ID = :FORNECEDOR_ID)');

    QEstoque.ParamByName('FORNECEDOR_ID').AsInteger := StrToInt(Forne.Text);
  end;

  QEstoque.Sql.Add('AND (STATUS = :STATUS)');
  QEstoque.Sql.Add('ORDER BY DESCRICAO');

  QEstoque.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
  QEstoque.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
  QEstoque.ParamByName('STATUS').AsString       := 'A';

  QEstoque.Prepare;
  QEstoque.Open;
end;

procedure TFrmEtiq_Laser.btnExecutaClick(Sender: TObject);
var
X, Qtde: Integer;
Temp_Name: String;
begin
// 281, 345

  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    Seleciona_Produtos;

    with Table_Temp do
    begin

      Temp_Name    := Copy(TimeToStr(time), 1, 2) + Copy(TimeToStr(time), 4, 2) + Copy(TimeToStr(time), 7, 2);


      with FieldDefs do
      begin
        Clear;
        Add('COD_BARRA', ftString, 13, False);
        Add('DESCRICAO', ftString, 24, False);
        Add('PRECO_VAREJO', ftFloat, 0, False);
        Add('IMAGEM', ftBlob, 0, False);
      end;

      with IndexDefs do
      begin
        Clear;
      end;


      Open;
    end;

    QEstoque.First;
    while not QEstoque.Eof do
    begin
      if FrmData.QAcesso.FieldByName('TPCTB').AsString = '2' then
      Qtde := QEstoque.FieldByName('QUANTIDADE_C').AsInteger
      Else
      Qtde := QEstoque.FieldByName('QUANTIDADE_G').AsInteger;

      if Qtde = 0 then
        Qtde := 1;

      for X := 1 to Qtde do
      begin
        acbrBarcode1.Text := QEstoque.FieldByName('COD_BARRA').AsString;
        acbrBarcode1.DrawBarcode(Image1.Canvas);

        Table_Temp.Append;
        Table_Temp.FieldByName('COD_BARRA').AsString    := QEstoque.FieldByName('COD_BARRA').AsString;
        Table_Temp.FieldByName('DESCRICAO').AsString    := QEstoque.FieldByName('DESCRICAO').AsString;
        Table_Temp.FieldByName('PRECO_VAREJO').AsString := QEstoque.FieldByName('PRECO_VAREJO').AsString;
        Table_Temp.FieldByName('IMAGEM').Assign(Image1.Picture);
        Table_Temp.Post;
      end;

      Application.ProcessMessages;
      QEstoque.Next;
    end;

    Table_Temp.First;

    if Colunas.Value = 0 then
    begin
      Etiq_Jato.Page.BottomMargin := Margem_Inferior.Value;
      Etiq_Jato.Page.LeftMargin   := Margem_Esquerda.Value;
      Etiq_Jato.Page.Length       := Altura_Folha.Value;
      Etiq_Jato.Page.RightMargin  := Margem_Direita.Value;
      Etiq_Jato.Page.TopMargin    := Margem_Superior.Value;
      Etiq_Jato.Page.Width        := Compr_Folha.Value;
      QRBand1.Size.Height         := Altura_Etiqueta.Value;

      Etiq_Jato.PreviewModal;
    end
    else
    begin
      Etiq_Laser.Page.BottomMargin := Margem_Inferior.Value;
      Etiq_Laser.Page.Columns      := StrToInt(Colunas.Text);
      Etiq_Laser.Page.ColumnSpace  := Espacamento.Value;
      Etiq_Laser.Page.LeftMargin   := Margem_Esquerda.Value;
      Etiq_Laser.Page.Length       := Altura_Folha.Value;
      Etiq_Laser.Page.RightMargin  := Margem_Direita.Value;
      Etiq_Laser.Page.TopMargin    := Margem_Superior.Value;
      Etiq_Laser.Page.Width        := Compr_Folha.Value;
      DetailBand1.Size.Height      := Altura_Etiqueta.Value;

      Etiq_Laser.PreviewModal;
    end;

    Table_Temp.Close;

  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;

procedure TFrmEtiq_Laser.btnForne_ClienteClick(Sender: TObject);
begin
  try
    Forne.Value := GetConsulta('FORNECEDORES', 0, 0, StrToInt(Forne.Text));
  except
    Forne.Value := GetConsulta('FORNECEDORES', 0, 0, 0);
  end;
end;

procedure TFrmEtiq_Laser.btnProduto1Click(Sender: TObject);
begin
  try
    Codigo_Inicial.Value := GetConsulta('ESTOQUE', 0, 0, StrToInt(Codigo_Inicial.Text));
  except
    Codigo_Inicial.Value := GetConsulta('ESTOQUE', 0, 0, 0);
  end;
end;

procedure TFrmEtiq_Laser.btnProduto2Click(Sender: TObject);
begin
  try
    Codigo_Final.Value := GetConsulta('ESTOQUE', 0, 0, StrToInt(Codigo_Final.Text));
  except
    Codigo_Final.Value := GetConsulta('ESTOQUE', 0, 0, 0);
  end;
end;

procedure TFrmEtiq_Laser.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmEtiq_Laser.Compr_FolhaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmEtiq_Laser.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
   // Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmEtiq_Laser.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmEtiq_Laser.FormCreate(Sender: TObject);
begin
  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);
end;

end.
