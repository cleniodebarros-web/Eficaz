unit URel_Itens_Garcom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBTables, DB, IBCustomDataSet, IBQuery, Buttons, ExtCtrls,
  rxCurrEdit, Mask, rxToolEdit, QRCtrls, QuickRpt, DBCtrls, RDprint,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;
  

type
  TFrmRel_Itens_Garcom = class(TForm)
    Dtmen: TDateEdit;
    Label1: TLabel;
    Dtmai: TDateEdit;
    Bevel1: TBevel;
    btnRetorna: TBitBtn;
    DataVendedor: TDataSource;
    btnExecuta: TBitBtn;
    DataAcesso: TDataSource;
    Rel_Comandas_Abertas: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    QRSysData1: TQRSysData;
    Cabec: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    QRLabel7: TQRLabel;
    QRShape2: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText8: TQRDBText;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText7: TQRDBText;
    QRBand1: TQRBand;
    QRShape4: TQRShape;
    QRLabel20: TQRLabel;
    QRExpr3: TQRExpr;
    QRGroup1: TQRGroup;
    QRDBText3: TQRDBText;
    QRLabel6: TQRLabel;
    QRBand2: TQRBand;
    QRShape3: TQRShape;
    QRLabel2: TQRLabel;
    QRExpr6: TQRExpr;
    QRGroup2: TQRGroup;
    QRDBText9: TQRDBText;
    QRLabel9: TQRLabel;
    QRBand3: TQRBand;
    QRLabel1: TQRLabel;
    QRExpr9: TQRExpr;
    QRShape5: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText5: TQRDBText;
    Tipo: TComboBox;
    Label2: TLabel;
    QRLabel4: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel8: TQRLabel;
    DataProduto: TDataSource;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr4: TQRExpr;
    Vendedor: TCurrencyEdit;
    Label3: TLabel;
    btnVendedor: TSpeedButton;
    RDprint1: TRDprint;
    Ordenar: TComboBox;
    Label4: TLabel;
    DBText1: TDBText;
    QRel: TFDQuery;
    QVendedor: TFDQuery;
    procedure FuncionarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnExecutaClick(Sender: TObject);
    procedure DtmenEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnRetornaClick(Sender: TObject);
    procedure VendedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnVendedorClick(Sender: TObject);
    procedure RDprint1NewPage(Sender: TObject; Pagina: Integer);
    procedure VendedorExit(Sender: TObject);
  private
    procedure DetailSearch(Tabela: String);
    { Private declarations }
  public
    { Public declarations }

  end;

var
  FrmRel_Itens_Garcom: TFrmRel_Itens_Garcom;
  Pagina, Linha: Integer;

implementation

uses
  UPrincipal, UData, UConsulta;

{$R *.dfm}

procedure TFrmRel_Itens_Garcom.DetailSearch(Tabela: String);
begin

  if ((Tabela = '') or (Tabela = 'Operador')) and (Vendedor.Text <> '') then
  begin
    Qvendedor.Close;
    Qvendedor.ParamByName('FUNCIONARIO_ID').AsInteger := StrToInt(Vendedor.Text);
    Qvendedor.Prepare;
    Qvendedor.Open;
  end;

end;


procedure TFrmRel_Itens_Garcom.VendedorExit(Sender: TObject);
begin
    DetailSearch('Operador');
end;

procedure TFrmRel_Itens_Garcom.VendedorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

  if (Key = Vk_F7) and (Sender = Vendedor) then
    btnVendedorClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);

end;

procedure TFrmRel_Itens_Garcom.btnExecutaClick(Sender: TObject);
var Nome: string;
    Soma, Quantidade : Double;
begin
// 125, 327

    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT BAR.GARCOM FUNCIONARIO_ID, FUNCIONARIOS.NOME GARCOM, COD_PRODUTO, DESCRICAO AS PRODUTO,');
    //QRel.Sql.Add('COUNT(COD_PRODUTO) QUANTIDADE, VR_UNITARIO, SUM(VR_TOTAL) AS TOTAL');
    QRel.Sql.Add('SUM(QUANTIDADE) QUANTIDADE, VR_UNITARIO, SUM(VR_TOTAL) AS TOTAL');
    QRel.Sql.Add('FROM BAR');
    QRel.Sql.Add('INNER JOIN FUNCIONARIOS ON (FUNCIONARIOS.FUNCIONARIO_ID = BAR.GARCOM)');
    QRel.Sql.Add('WHERE GARCOM > 0 AND');
    QRel.Sql.Add('(BAR.MESA < 600) AND ');
    QRel.Sql.Add('(BAR.CANCELADO = ''0'') AND ');
    QRel.Sql.Add('DATA BETWEEN :DT_INICIAL AND :DT_FINAL AND');
    QRel.Sql.Add('BAR.STATUS = :STATUS');


    try

      if Vendedor.Value > 0 then
      begin
          QRel.Sql.Add('AND BAR.GARCOM =:GARCOM');
          QRel.ParamByName('GARCOM').AsInteger := StrToInt(Vendedor.Text);
      end;

    except
      Vendedor.Text := '0';
    end;


    QRel.Sql.Add('GROUP BY FUNCIONARIOS.FUNCIONARIO_ID, GARCOM, COD_PRODUTO, PRODUTO, VR_UNITARIO');

    if Ordenar.Text = 'Quantidade' then
       QRel.Sql.Add('ORDER BY GARCOM, QUANTIDADE DESC, PRODUTO');

    if Ordenar.Text = 'Produto' then
       QRel.Sql.Add('ORDER BY GARCOM, PRODUTO, QUANTIDADE DESC');



    if Tipo.Text = 'Fechada' then
       QRel.ParamByName('STATUS').AsString := 'F'
    else
       QRel.ParamByName('STATUS').AsString := 'A';


    QRel.ParamByName('DT_INICIAL').AsDate := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDate   := Dtmai.Date;


    QRel.Prepare;
    QRel.Open;


    if QRel.IsEmpty then
        Application.MessageBox('Não há dados para os parâmetros informados', PChar(Msg_Title), mb_IconInformation)
    else
    begin

        RDprint1.TamanhoQteColunas     := 80;
        RDprint1.OpcoesPreview.Preview := True;
        RDprint1.MostrarProgresso      := True;
        RDprint1.Acentuacao            := SemAcento;
        RDprint1.TamanhoQteLinhas      := 1;
        RDprint1.Abrir;

        if linha > 66 then
        begin
            RDprint1.novapagina;
            Pagina := Pagina + 1;
        end;

        Pagina := 1;
        Nome   := '';
        Soma   := 0;
        Quantidade   := 0;

        QRel.First;
        while not QRel.Eof do
        begin

           if (Nome = '') or (Nome <> QRel.FieldByName('GARCOM').AsString) then
           begin

              if(Nome <> '') then
              begin
                RDprint1.LinhaH(linha, 38, 48, 0, False);
                RDprint1.LinhaH(linha, 70, 80, 0, False);
                Inc(linha);
                RDprint1.impval(Linha, 35, '###,###,##0.00', Quantidade, [negrito]);
                RDprint1.impval(Linha, 67, '###,###,##0.00', Soma, [negrito]);
                Soma       := 0;
                Quantidade := 0;
              end;


              Inc(linha);
              RDprint1.impF(Linha, 01, QRel.FieldByName('GARCOM').AsString,[negrito]);
              Inc(linha);
              RDprint1.LinhaH(linha, 01, 80, 0, False);
              Inc(linha);
           end;


           RDprint1.impF(Linha, 05, QRel.FieldByName('PRODUTO').AsString,[]);
           RDprint1.impval(Linha, 35, '###,###,##0.00', QRel.FieldByName('QUANTIDADE').AsFloat, []);
           RDprint1.impval(Linha, 50, '###,###,##0.00', QRel.FieldByName('VR_UNITARIO').AsFloat, []);
           RDprint1.impval(Linha, 67, '###,###,##0.00', QRel.FieldByName('TOTAL').AsFloat, []);




           if linha > 65 then
           begin
              RDprint1.novapagina;
              Pagina := Pagina + 1;
           end;

           Soma       := Soma + QRel.FieldByName('TOTAL').AsFloat;
           Quantidade := Quantidade + QRel.FieldByName('QUANTIDADE').AsFloat;
           Nome       := QRel.FieldByName('GARCOM').AsString;

           Inc(Linha);
           QRel.Next;
        end;

        RDprint1.LinhaH(linha, 38, 48, 0, False);
        RDprint1.LinhaH(linha, 70, 80, 0, False);
        Inc(linha);
        RDprint1.impval(Linha, 35, '###,###,##0.00', Quantidade, [negrito]);
        RDprint1.impval(Linha, 67, '###,###,##0.00', Soma, [negrito]);

        Application.ProcessMessages;
        RDprint1.TamanhoQteLinhas:= 66;
        RDprint1.Fechar;

    end;

end;

procedure TFrmRel_Itens_Garcom.RDprint1NewPage(Sender: TObject;
  Pagina: Integer);
begin

    RDprint1.Imp(01, 01, FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString);
    RDprint1.ImpDir(01, (length(FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString)), 80, 'Sistema de Automação de empresas Eficaz', []);
    RDprint1.Imp(02, 01, 'Data/Hora: ' + DateToStr(date) + ' - ' + TimeToStr(now));
    RDprint1.impDir(02, 80, 80, 'Página: ' + IntToStr(Pagina), []);
    RDprint1.impF(03, 20, '*** RELATÓRIO ÍTENS COMANDADADOS POR GARCOM ***',[negrito]);
    RDprint1.imp(04, 01, 'Período:'+ DateToStr(dtmen.date) + ' à ' + DateToStr(dtmai.date));
    RDprint1.LinhaH(05, 01, 80, 0, False);
    RDprint1.impF(06, 05, 'Produto',[negrito]);
    RDprint1.impF(06, 39, 'Quantidade',[negrito]);
    RDprint1.impF(06, 56, 'Vr. Unit.',[negrito]);
    RDprint1.impF(06, 76, 'Total',[negrito]);
    Linha := 07;

end;


procedure TFrmRel_Itens_Garcom.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRel_Itens_Garcom.btnVendedorClick(Sender: TObject);
begin

  try
    Vendedor.Value := GetConsulta('PESSOAL', 0, 0, StrToInt(Vendedor.Text));
  except
    Vendedor.Value := GetConsulta('PESSOAL', 0, 0, 0);
  end;

end;

procedure TFrmRel_Itens_Garcom.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmRel_Itens_Garcom.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
   // Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmRel_Itens_Garcom.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmRel_Itens_Garcom.FormCreate(Sender: TObject);
begin
  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);
end;

procedure TFrmRel_Itens_Garcom.FuncionarioKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;



end.
