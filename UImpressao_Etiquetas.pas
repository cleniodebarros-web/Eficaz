unit UImpressao_Etiquetas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, StdCtrls, ExtCtrls, Buttons, Mask,
  rxToolEdit, rxCurrEdit, DBCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrmImpressao_Etiquetas = class(TForm)
    Label2: TLabel;
    Produto: TCurrencyEdit;
    btnProduto: TSpeedButton;
    Bevel1: TBevel;
    DataTabela: TDataSource;
    DBText1: TDBText;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    QTabela: TFDQuery;
    procedure btnExecutaClick(Sender: TObject);
    procedure ProdutoChange(Sender: TObject);
    procedure ProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnProdutoClick(Sender: TObject);
    procedure btnRetornaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmImpressao_Etiquetas: TFrmImpressao_Etiquetas;

implementation

uses
  Udata, UConsulta;

{$R *.dfm}

procedure TFrmImpressao_Etiquetas.btnExecutaClick(Sender: TObject);
var
F: TextFile;
LcLinha: String;
begin
  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    if not QTabela.IsEmpty then
    begin
      AssignFile(F, 'LPT1');
      Rewrite(F);
      try
        LcLinha := Chr(2) + 'qA';
        WriteLn(F, lcLinha );
        LcLinha := Chr(2) + 'c0000';
        WriteLn(F, lcLinha );
        LcLinha := Chr(2) + 'KI503';
        WriteLn(F, lcLinha );
        LcLinha := Chr(2) + 'O0220';
        WriteLn(F, lcLinha );
        LcLinha := Chr(2) + 'f220';
        WriteLn(F, lcLinha );
        LcLinha := Chr(2) + 'KW0797';
        WriteLn(F, lcLinha );
        LcLinha := Chr(2) + 'KI7' + chr(2);
        WriteLn(F, lcLinha );
        LcLinha := Chr(2) + 'V0';
        WriteLn(F, lcLinha );
        LcLinha := Chr(2) + 'L';
        WriteLn(F, lcLinha );
        LcLinha := 'H12';
        WriteLn(F, lcLinha );
        LcLinha := 'PC';
        WriteLn(F, lcLinha );
        LcLinha := 'A2';
        WriteLn(F, lcLinha );
        LcLinha := 'D11';
        WriteLn(F, lcLinha );
        LcLinha := '141100000800130' + QTabela.FieldByName('DESCRICAO').AsString;
        WriteLn(F, lcLinha );
        LcLinha := '421100000140048' + '';
        WriteLn(F, lcLinha );
        LcLinha := '421100000140064' + '';
        WriteLn(F, lcLinha );
        LcLinha := '161100000020150R$ ' + FormatFloat('#,##0.00', QTabela.FieldByName('PRECO_VAREJO').AsFloat);
        WriteLn(F, lcLinha );
        LcLinha := '421100000140082INT.: ' + QTabela.FieldByName('COD_ORIGINAL').AsString;
        WriteLn(F, lcLinha );
        LcLinha := '1F2302300400150' + QTabela.FieldByName('COD_BARRA').AsString;
        WriteLn(F, lcLinha );
        LcLinha := Chr(94) + '01';
        WriteLn(F, lcLinha );
        LcLinha := 'Q0001';
        WriteLn(F, lcLinha );
        LcLinha := 'E';
        WriteLn(F, lcLinha );
      finally
        CloseFile(F);
      end;
    end;
  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;

procedure TFrmImpressao_Etiquetas.btnProdutoClick(Sender: TObject);
begin
  try
    Produto.Value := GetConsulta('ESTOQUE', FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger, 0, StrToInt(Produto.Text));
  except
    Produto.Value := GetConsulta('ESTOQUE', FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger, 0, 0);
  end;
end;

procedure TFrmImpressao_Etiquetas.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmImpressao_Etiquetas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmImpressao_Etiquetas.ProdutoChange(Sender: TObject);
begin
  try
    QTabela.Close;
    QTabela.ParamByName('PRODUTO_ID').AsInteger := StrToInt(Produto.Text);

    QTabela.Prepare;
    QTabela.Open;
  except

  end;
end;

procedure TFrmImpressao_Etiquetas.ProdutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = Produto) then
    btnProdutoClick(Self);
    
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

end.
