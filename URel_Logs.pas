unit URel_Logs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, rxCurrEdit, rxToolEdit, Buttons, DBCtrls,
  DB, IBCustomDataSet, IBQuery, QuickRpt, QRCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmRel_Logs = class(TForm)
    Label1: TLabel;
    Bevel1: TBevel;
    Dtmen: TDateEdit;
    Dtmai: TDateEdit;
    Orcamentos: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    QRDBText3: TQRDBText;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    Cabec: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel10: TQRLabel;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    QRLabel4: TQRLabel;
    QRLabel9: TQRLabel;
    Label4: TLabel;
    Tipo_Ordem: TComboBox;
    QRBand1: TQRBand;
    QRDBText13: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText1: TQRDBText;
    QRel: TFDQuery;
    QRShape2: TQRShape;
    QRMemo1: TQRMemo;
    QRDBText2: TQRDBText;
    QRLabel2: TQRLabel;
    HR_MAI: TMaskEdit;
    HR_MEN: TMaskEdit;
    QRDBText4: TQRDBText;
    QRLabel5: TQRLabel;
    OpenDialog1: TOpenDialog;
    Memo1: TMemo;
    procedure btnRetornaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnExecutaClick(Sender: TObject);
    procedure DtmenEnter(Sender: TObject);
    procedure Tipo_OrdemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
  //procedure ImportarCSV;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Logs: TFrmRel_Logs;


implementation

uses
  UData, UConsulta, UPrincipal;

{$R *.dfm}
{
procedure TFrmRel_Logs.ImportarCSV;
  var
    ArquivoCSV: TextFile;
    Contador, I: Integer;
    Linha: String;
    // Lê Linha e Monta os valores
    function MontaValor: String;
    var
      ValorMontado: String;
    begin
      ValorMontado := '';
      inc(I);
      While Linha[I] >= ' ' do
      begin
        If Linha[I] = '|' then // vc pode usar qualquer delimitador ... eu
          // estou usando o ";"
          break;
        ValorMontado := ValorMontado + Linha[I];
        inc(I);
      end;
      result := ValorMontado;
    end;


  begin
    // Carregando o arquivo ...

    AssignFile(ArquivoCSV, 'c:\Nome_do_Arquivo');

    try
      Reset(ArquivoCSV);
      Readln(ArquivoCSV, Linha);
      Contador := 1;

      while not Eoln(ArquivoCSV) do
      begin
        if Contador = 1 then // Primeira Linha do arquivo (Pedido);
        begin
          I := 0;
          cdsPedido.Append;
          cdsPedidoCodigoCliente.AsString := MontaValor;
          cdsPedidoNomeDoCliente.AsString := MontaValor;
          cdsPedido.Post;
        end
        else
        begin
          // Demais Linhas (Itens do Pedido )
          I := 0;

          cdsItensDoPedido.Append;
          cdsItensDoPedidoCodigoProduto.AsString := MontaValor;
          cdsItensDoPedidoNomeDoProduto.AsString := AnsiUpperCase(MontaValor);
          cdsItensDoPedidoQuantidade.AsFloat := StrToFloat(MontaValor);
          cdsItensDoPedidoPreco.AsCurrency := StrToCurr(MontaValor);
          cdsItensDoPedido.Post;
        end;

        Readln(ArquivoCSV, Linha);
        Contador := Contador + 1;
      end;

    finally
      CloseFile(ArquivoCSV);
    end;

  end;
 }

procedure TFrmRel_Logs.btnExecutaClick(Sender: TObject);
 var
  Linhas, Colunas:TStringList;
  i,j:integer;
begin
// 125, 325
  try
    OpenDialog1.Title      := 'Selecione o Arquivo';
    OpenDialog1.DefaultExt := '*.TXT';
    OpenDialog1.Filter     := 'Arquivos TXT (*.TXT)|*.TXT|Todos os Arquivos (*.*)|*.*';
    OpenDialog1.InitialDir := ExtractFilePath(ParamStr(0));


    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;
    {
    Linhas := TStringList.Create;
    Colunas := TStringList.Create;
    if OpenDialog1.Execute then
    begin

      try
        Linhas.LoadFromFile(OpenDialog1.FileName); //Carregando arquivo
        Memo1.Lines.Clear;
        for i := 0 to Pred(Linhas.Count) do
        begin
        //  Transformando os dados das colunas em Linhas
          Colunas.text := StringReplace(Linhas.Strings[i],'|','',[rfReplaceAll]);
          for j := 0 to Pred(Colunas.Count) do
          begin
            // Aqui você faz alguma coisa como colocar num Edit
            // No Meu caso aqui para exemplificar vou apenas mostrar num ShowMessage

             Memo1.Lines.Add(Colunas.Strings[j]);

            //ShowMessage('Valor "'+Colunas.Strings[j] + '" da Linha '+IntTostr(i+1) +
            //  ' Coluna '+IntToStr(j+1));
          end;
        end;
      finally
        Linhas.Free;
        Colunas.Free;
      end;

    end;

    }
    QRel.close;
    QRel.ParamByName('TABELA').AsString        := Tipo_ordem.Text;
    QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date; //+ StrToTime(hr_men.Text);
    QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date; //+ StrToTime(hr_mai.Text);

    QRel.Prepare;
    QRel.Open;

    QRLabel1.Caption   := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;


    if QRel.IsEmpty then
      Application.MessageBox('Não há dados para os parâmetros informados', PChar(Msg_Title), mb_IconInformation)
    else
      Orcamentos.PreviewModal;
  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;

procedure TFrmRel_Logs.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRel_Logs.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmRel_Logs.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
   // Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmRel_Logs.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmRel_Logs.FormCreate(Sender: TObject);
begin
  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);
end;

procedure TFrmRel_Logs.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
 QRMemo1.Lines.Text := QRel.FieldByName('ACAO').AsString;
end;

procedure TFrmRel_Logs.Tipo_OrdemKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

end.
