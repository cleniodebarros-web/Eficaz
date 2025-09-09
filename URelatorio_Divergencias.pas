unit URelatorio_Divergencias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, IBCustomDataSet, IBQuery, ExtCtrls, QRCtrls, QuickRpt,
  Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmRelatorio_Divergencias = class(TForm)
    Label1: TLabel;
    Bevel1: TBevel;
    Data: TComboBox;
    Label2: TLabel;
    Tipo_Relatorio: TComboBox;
    Divergencias: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    ColumnHeaderBand1: TQRBand;
    QRSysData1: TQRSysData;
    Cabec: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel9: TQRLabel;
    QRShape2: TQRShape;
    QRDBText8: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRBand1: TQRBand;
    QRExpr3: TQRExpr;
    QRLabel11: TQRLabel;
    btnExecuta: TBitBtn;
    btnRetorna: TBitBtn;
    IQuery: TFDQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRetornaClick(Sender: TObject);
    procedure DataKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelatorio_Divergencias: TFrmRelatorio_Divergencias;

implementation

uses
  UData, UPrincipal;

{$R *.dfm}

procedure TFrmRelatorio_Divergencias.btnExecutaClick(Sender: TObject);
begin
  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    if Data.Text <> '' then
    begin
      if Tipo_Relatorio.Text = 'Divergências' then
      begin
        IQuery.Sql.Clear;

        if FrmData.QAcesso.FieldByName('TPCTB').AsString = '2' then
        begin
          IQuery.Sql.Add('SELECT PRODUTO_ID, COD_BARRA, DESCRICAO, QUANTIDADE_C QUANTIDADE, QUANTIDADE_A, CUSTOMEDIO');
          IQuery.Sql.Add('FROM INVENTARIO_PRODUTOS');
          IQuery.Sql.Add('WHERE');
          IQuery.Sql.Add('(QUANTIDADE_A IS NOT NULL)');
          IQuery.Sql.Add('AND (QUANTIDADE_A <> QUANTIDADE_C)');
          IQuery.Sql.Add('AND (DT_INVENTARIO = :DT_INVENTARIO)');
          IQuery.Sql.Add('ORDER BY DESCRICAO');

          IQuery.ParamByName('DT_INVENTARIO').AsDateTime := StrToDate(Data.Text);
        end
        else
        begin
          IQuery.Sql.Add('SELECT PRODUTO_ID, COD_BARRA, DESCRICAO, QUANTIDADE_G QUANTIDADE, QUANTIDADE_A, CUSTOMEDIO');
          IQuery.Sql.Add('FROM INVENTARIO_PRODUTOS');
          IQuery.Sql.Add('WHERE');
          IQuery.Sql.Add('(QUANTIDADE_A IS NOT NULL 0)');
          IQuery.Sql.Add('AND (QUANTIDADE_A <> QUANTIDADE_G)');
          IQuery.Sql.Add('AND (DT_INVENTARIO = :DT_INVENTARIO)');
          IQuery.Sql.Add('ORDER BY DESCRICAO');

          IQuery.ParamByName('DT_INVENTARIO').AsDateTime := StrToDate(Data.Text);
        end;

        IQuery.Prepare;
        IQuery.Open;

        QRLabel3.Caption := '*** RELATÓRIO DE DIVERGÊNCIAS ***';
      end;

      if Tipo_Relatorio.Text = 'Produtos Contados' then
      begin
        IQuery.Sql.Clear;

        if FrmData.QAcesso.FieldByName('TPCTB').AsString = '2' then
        begin
          IQuery.Sql.Add('SELECT PRODUTO_ID, COD_BARRA, DESCRICAO, QUANTIDADE_C QUANTIDADE, QUANTIDADE_A, CUSTOMEDIO');
          IQuery.Sql.Add('FROM INVENTARIO_PRODUTOS');
          IQuery.Sql.Add('WHERE');
          IQuery.Sql.Add('(QUANTIDADE_A IS NOT NULL)');
          IQuery.Sql.Add('AND (DT_INVENTARIO = :DT_INVENTARIO)');
          IQuery.Sql.Add('ORDER BY DESCRICAO');

          IQuery.ParamByName('DT_INVENTARIO').AsDateTime := StrToDate(Data.Text);
        end
        else
        begin
          IQuery.Sql.Add('SELECT PRODUTO_ID, COD_BARRA, DESCRICAO, QUANTIDADE_G QUANTIDADE, QUANTIDADE_A, CUSTOMEDIO');
          IQuery.Sql.Add('FROM INVENTARIO_PRODUTOS');
          IQuery.Sql.Add('WHERE');
          IQuery.Sql.Add('(QUANTIDADE_A IS NOT NULL)');
          IQuery.Sql.Add('AND (DT_INVENTARIO = :DT_INVENTARIO)');
          IQuery.Sql.Add('ORDER BY DESCRICAO');

          IQuery.ParamByName('DT_INVENTARIO').AsDateTime := StrToDate(Data.Text);
        end;

        IQuery.Prepare;
        IQuery.Open;

        QRLabel3.Caption := '*** RELATÓRIO DE DIVERGÊNCIAS - ' + Tipo_Relatorio.Text + ' ***';
      end;

      if Tipo_Relatorio.Text = 'Produtos não Contados' then
      begin
        IQuery.Sql.Clear;

        if FrmData.QAcesso.FieldByName('TPCTB').AsString = '2' then
        begin
          IQuery.Sql.Add('SELECT PRODUTO_ID, COD_BARRA, DESCRICAO, QUANTIDADE_C QUANTIDADE, QUANTIDADE_A, CUSTOMEDIO');
          IQuery.Sql.Add('FROM INVENTARIO_PRODUTOS');
          IQuery.Sql.Add('WHERE');
          IQuery.Sql.Add('(QUANTIDADE_A IS NULL)');
          IQuery.Sql.Add('AND (QUANTIDADE_C <> 0)');
          IQuery.Sql.Add('AND (DT_INVENTARIO = :DT_INVENTARIO)');
          IQuery.Sql.Add('ORDER BY DESCRICAO');

          IQuery.ParamByName('DT_INVENTARIO').AsDateTime := StrToDate(Data.Text);
        end
        else
        begin
          IQuery.Sql.Add('SELECT PRODUTO_ID, COD_BARRA, DESCRICAO, QUANTIDADE_G QUANTIDADE, QUANTIDADE_A, CUSTOMEDIO');
          IQuery.Sql.Add('FROM INVENTARIO_PRODUTOS');
          IQuery.Sql.Add('WHERE');
          IQuery.Sql.Add('(QUANTIDADE_A IS NULL)');
          IQuery.Sql.Add('AND (QUANTIDADE_G <> 0)');
          IQuery.Sql.Add('AND (DT_INVENTARIO = :DT_INVENTARIO)');
          IQuery.Sql.Add('ORDER BY DESCRICAO');

          IQuery.ParamByName('DT_INVENTARIO').AsDateTime := StrToDate(Data.Text);
        end;

        IQuery.Prepare;
        IQuery.Open;

        QRLabel3.Caption := '*** RELATÓRIO DE DIVERGÊNCIAS - ' + Tipo_Relatorio.Text + ' ***';
      end;

      if IQuery.IsEmpty then
        Application.MessageBox('Não há dados para os parâmetros informados', PChar(Msg_Title), mb_IconInformation)
      else
        Divergencias.PreviewModal;
    end
    else
      Application.MessageBox('Necessário informar uma data', PChar(Msg_Title), mb_IconInformation)
  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;

procedure TFrmRelatorio_Divergencias.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRelatorio_Divergencias.DataKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmRelatorio_Divergencias.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmRelatorio_Divergencias.FormShow(Sender: TObject);
begin
  IQuery.Sql.Clear;
  IQuery.Sql.Add('SELECT DISTINCT DT_INVENTARIO');
  IQuery.Sql.Add('FROM INVENTARIO_PRODUTOS');
  IQuery.Sql.Add('ORDER BY DT_INVENTARIO DESC');
  IQuery.Prepare;
  IQuery.Open;

  Data.Items.Clear;

  IQuery.First;
  while not IQuery.Eof do
  begin
    Data.Items.Add(IQuery.FieldByName('DT_INVENTARIO').AsString);

    Application.ProcessMessages;
    IQuery.Next;
  end;
end;

end.
