unit URel_Ordem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, rxCurrEdit, rxToolEdit, Buttons, DBCtrls,
  DB, IBCustomDataSet, IBQuery, QuickRpt, QRCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, RDprint, Printers;

type
  TFrmRel_Ordem = class(TForm)
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
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    Label4: TLabel;
    Tipo_Ordem: TComboBox;
    QRBand1: TQRBand;
    QRDBText11: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRel: TFDQuery;
    Servico: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Produto: TCurrencyEdit;
    btnProduto: TSpeedButton;
    DBText1: TDBText;
    QProduto: TFDQuery;
    DataProduto: TDataSource;
    Itens: TQRSubDetail;
    QRDBText1: TQRDBText;
    QItens: TFDQuery;
    RDprint1: TRDprint;
    QAtendente: TFDQuery;
    procedure btnRetornaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnExecutaClick(Sender: TObject);
    procedure DtmenEnter(Sender: TObject);
    procedure Tipo_OrdemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnProdutoClick(Sender: TObject);
    procedure ProdutoChange(Sender: TObject);
    procedure ProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RDprint1NewPage(Sender: TObject; Pagina: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SearchProduto;
  end;

var
  FrmRel_Ordem: TFrmRel_Ordem;
  linha, Pagina, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11: Integer;
  total_serv, total_pecas, total_geral, total_desconto : Real;

implementation

uses
  UData, UConsulta, UPrincipal;

{$R *.dfm}

procedure TFrmRel_Ordem.btnExecutaClick(Sender: TObject);
var
Vr_P, Vr_S, Quant_P, Quant_S:Real;
Descricao_P, Descricao_S: string;
begin
// 125, 325
  try
    Itens.Height := 0;
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT ORDEM_SERVICO.*, FUNCIONARIOS.NOME');
    QRel.Sql.Add('FROM ORDEM_SERVICO');
    QRel.Sql.Add('INNER JOIN FUNCIONARIOS');
    QRel.Sql.Add('ON (ORDEM_SERVICO.FUNCIONARIO = FUNCIONARIOS.FUNCIONARIO_ID)');
    if (Servico.ItemIndex <> 0) or (Produto.Value <> 0) then
    begin
      QRel.Sql.Add('INNER JOIN ORDEM_ITENS');
      QRel.Sql.Add('ON (ORDEM_SERVICO.ORDEM_ID = ORDEM_ITENS.ORDEM_ID)');
    end;

    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(ORDEM_SERVICO.DT_ORDEM BETWEEN :DT_INICIAL AND :DT_FINAL)');
    QRel.Sql.Add('AND (ORDEM_SERVICO.EMPRESA_ID = :EMPRESA_ID)');

    if Tipo_Ordem.Text <> 'TODOS' then
      QRel.Sql.Add('AND (ORDEM_SERVICO.STATUS = :STATUS )');

    if Servico.ItemIndex <> 0 then
    begin
      QRel.SQL.Add('AND ((CODIGO_ITEM = :CODIGO_ITEM_S AND TP_PROD_SERV = :TP_PROD_SERV_S)');
      QRel.ParamByName('CODIGO_ITEM_S').AsInteger := StrToInt(Copy(Servico.Text,0,Pos(' ',Servico.Text)-1));
      QRel.ParamByName('TP_PROD_SERV_S').AsString := 'S';
    end;

    if (Servico.ItemIndex <> 0) and (Produto.Value <> 0) then
      QRel.SQL.Add(' OR ')
    else
    if (Servico.ItemIndex <> 0) and (Produto.Value = 0) then
      QRel.SQL.Add(')')
    else
    if (Servico.ItemIndex = 0) and (Produto.Value <> 0) then
      QRel.SQL.Add('AND (');

    if Produto.Value <> 0 then
    begin
      QRel.SQL.Add('(CODIGO_ITEM = :CODIGO_ITEM_P AND TP_PROD_SERV = :TP_PROD_SERV_P))');
      QRel.ParamByName('CODIGO_ITEM_P').AsInteger := StrToInt(Produto.Text);
      QRel.ParamByName('TP_PROD_SERV_P').AsString := 'P';
    end;

    if (Servico.ItemIndex <> 0) and (Produto.Value <> 0) then
    begin
      QRel.SQL.Add('group by ORDEM_SERVICO.ORDEM_ID,DT_ORDEM,NOME_CLIENTE,DT_FECHAMENTO,H_FECHAMENTO,ORDEM_SERVICO.STATUS, FUNCIONARIOS.NOME');
      QRel.SQL.Add('having count(*) > 1');
    end;

    QRel.Sql.Add('ORDER BY ORDEM_SERVICO.DT_ORDEM, ORDEM_SERVICO.ORDEM_ID, ORDEM_SERVICO.STATUS, ORDEM_SERVICO.NOME_CLIENTE');

    QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
    QRel.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    if Tipo_Ordem.Text <> 'TODOS' then
      QRel.ParamByName('STATUS').AsString  := Tipo_ordem.Text;

    QRel.Prepare;
    QRel.Open;

    if QRel.IsEmpty then
    begin
      Application.MessageBox('Não há dados para os parâmetros informados', PChar(Msg_Title), mb_IconInformation);
      Exit;
    end;


    RDprint1.Orientacao := poLandscape;
    RDprint1.TamanhoQteColunas:= 180;
    RDprint1.OpcoesPreview.Preview     := True;
    RDprint1.MostrarProgresso          := True;
    RDprint1.Acentuacao                := SemAcento;
    RDprint1.TamanhoQteLinhas          := 1;

    RDprint1.Abrir;

    if linha > 66 then
    begin
      RDprint1.novapagina;
      Pagina := Pagina + 1;
    end;

    Pagina:= 1;
    total_serv := 0;
    total_pecas := 0;
    total_geral := 0;
    Vr_P := 0;
    Vr_S := 0;
    Quant_P := 0;
    Quant_S := 0;

    while not QRel.Eof do
    Begin

      //consulta nome do atendente
      QAtendente.SQL.Clear;
      QAtendente.SQL.Add('SELECT NOME FROM FUNCIONARIOS WHERE FUNCIONARIO_ID = :FUNCIONARIO_ID');
      QAtendente.ParamByName('FUNCIONARIO_ID').AsInteger :=  QRel.FieldByName('ATENDENTE').AsInteger;
      QAtendente.Prepare;
      QAtendente.Open;

      RDprint1.Imp(linha, p1, QRel.FieldByName('ORDEM_ID').AsString);
      RDprint1.Imp(linha, p2, QRel.FieldByName('DT_ORDEM').AsString);
      RDprint1.Imp(linha, p3, Copy(QRel.FieldByName('NOME_CLIENTE').AsString, 1, 35));
      RDprint1.ImpVal(linha, p4, ',###,##0.00', QRel.FieldByName('VALOR_SERVICOS').AsFloat,[]);
      RDprint1.ImpVal(linha, p5, ',###,##0.00', QRel.FieldByName('VALOR_PECAS').AsFloat,[]);
      RDprint1.ImpVal(linha, p6, ',###,##0.00', QRel.FieldByName('VALOR').AsFloat,[]);
      RDprint1.Imp(linha, p7, Copy(QRel.FieldByName('TIPO_ATENDIMENTO').AsString, 1, 20));
      RDprint1.Imp(linha, p8, QRel.FieldByName('PREV_ATEND').AsString);
      RDprint1.Imp(linha, p9, QRel.FieldByName('DT_MOVIMENTO').AsString);
      RDprint1.Imp(linha, p10, Copy(QAtendente.FieldByName('NOME').AsString, 1, 27));
      RDprint1.Imp(linha, p11, QRel.FieldByName('STATUS').AsString);


      QItens.SQL.Clear;
      QItens.SQL.Add('SELECT * FROM ORDEM_ITENS  WHERE ORDEM_ITENS.ORDEM_ID=:ORDEM_ID');

      if Servico.ItemIndex <> 0 then
      begin
        QItens.SQL.Add('AND ((CODIGO_ITEM = :CODIGO_ITEM_S AND TP_PROD_SERV = :TP_PROD_SERV_S)');
        QItens.ParamByName('CODIGO_ITEM_S').AsInteger := StrToInt(Copy(Servico.Text,0,Pos(' ',Servico.Text)-1));
        QItens.ParamByName('TP_PROD_SERV_S').AsString := 'S';
      end;

      if (Servico.ItemIndex <> 0) and (Produto.Value <> 0) then
        QItens.SQL.Add(' OR ')
      else
      if (Servico.ItemIndex <> 0) and (Produto.Value = 0) then
        QItens.SQL.Add(')')
      else
      if (Servico.ItemIndex = 0) and (Produto.Value <> 0) then
        QItens.SQL.Add('AND (');

      if Produto.Value <> 0 then
      begin
        QItens.SQL.Add('(CODIGO_ITEM = :CODIGO_ITEM_P AND TP_PROD_SERV = :TP_PROD_SERV_P))');
        QItens.ParamByName('CODIGO_ITEM_P').AsInteger := StrToInt(Produto.Text);
        QItens.ParamByName('TP_PROD_SERV_P').AsString := 'P';
      end;

      if (Servico.ItemIndex = 0) and (Produto.Value = 0) then
        QItens.ParamByName('ORDEM_ID').AsInteger :=  0
      else
        QItens.ParamByName('ORDEM_ID').AsInteger :=  QRel.FieldByName('ORDEM_ID').AsInteger;

      QItens.Prepare;
      QItens.Open;

      if QItens.RecordCount > 0 then
      begin
        Inc(linha);
        Inc(linha);
        //RDprint1.LinhaH(linha, p2, p6,0,false);  Inc(linha);
        RDprint1.ImpF(linha, p2,'Peça / Serviço',[negrito]);
        RDprint1.ImpF(linha, p4+5,'Quant.',[negrito]);
        RDprint1.ImpF(linha, p5+2,'Vr. unit.',[negrito]);
        RDprint1.ImpF(linha, p6+6,'Total',[negrito]);
        Inc(linha);
      end;

      QItens.First;
      while not QItens.Eof do
      begin
        RDprint1.Imp(linha, p2, QItens.FieldByName('DESCRICAO').AsString);
        RDprint1.ImpVal(linha, p4, ',###,##0.00', QItens.FieldByName('QUANTIDADE').AsFloat,[]);
        RDprint1.ImpVal(linha, p5, ',###,##0.00', QItens.FieldByName('VR_UNITARIO').AsFloat,[]);
        RDprint1.ImpVal(linha, p6, ',###,##0.00', QItens.FieldByName('VR_TOTAL').AsFloat,[]);

        if QItens.FieldByName('TP_PROD_SERV').AsString = 'S' then
        begin
          Vr_S := Vr_S + QItens.FieldByName('VR_TOTAL').AsFloat;
          Quant_S := Quant_S + QItens.FieldByName('QUANTIDADE').AsFloat;
          Descricao_S := QItens.FieldByName('DESCRICAO').AsString;
        end
        else
        if QItens.FieldByName('TP_PROD_SERV').AsString = 'P' then
        begin
          Vr_P := Vr_P + QItens.FieldByName('VR_TOTAL').AsFloat;
          Quant_P := Quant_P + QItens.FieldByName('QUANTIDADE').AsFloat;
          Descricao_P := QItens.FieldByName('DESCRICAO').AsString;
        end;

        Inc(linha);
        QItens.Next;
      end;

      if QItens.RecordCount > 0 then
      begin
        RDprint1.LinhaH(linha, p2, p7-1,0,false);  Inc(linha);
        Inc(linha);
      end;

      total_serv  := total_serv  + QRel.FieldByName('VALOR_SERVICOS').AsFloat;
      total_pecas := total_pecas + QRel.FieldByName('VALOR_PECAS').AsFloat;
      total_geral := total_geral + QRel.FieldByName('VALOR').AsFloat;
      total_desconto :=   total_desconto + QRel.FieldByName('DESCONTO').AsFloat;


      Inc(linha);

      if linha > 63 then
      begin
        RDprint1.novapagina;
        Pagina := Pagina + 1;
      end;
        QRel.Next;
    End;

    RDprint1.LinhaH(linha, 01, 180, 0,false);
    Inc(linha);

    if (Vr_P > 0) or (Vr_S > 0) then
    begin
      RDprint1.ImpF(linha, p2, 'Total',[negrito]);
      RDprint1.ImpF(linha, p4+5,'Quant.',[negrito]);
      RDprint1.ImpF(linha, p5+2,'Vr. médio',[negrito]);
      RDprint1.ImpF(linha, p6+6,'Total',[negrito]);
      Inc(linha);
    end;

    if Vr_P > 0 then
    begin
      RDprint1.ImpF(linha, p2, Descricao_P,[negrito]);
      RDprint1.ImpVal(linha, p4, ',###,##0.00', Quant_P,[negrito]);
      RDprint1.ImpVal(linha, p5, ',###,##0.00', Vr_P / Quant_P,[negrito]);
      RDprint1.ImpVal(linha, p6, ',###,##0.00', Vr_P,[negrito]);
      Inc(linha);
    end;

    if Vr_S > 0 then
    begin
      RDprint1.ImpF(linha, p2, Descricao_S,[negrito]);
      RDprint1.ImpVal(linha, p4, ',###,##0.00', Quant_S,[negrito]);
      RDprint1.ImpVal(linha, p5, ',###,##0.00', Vr_S / Quant_S,[negrito]);
      RDprint1.ImpVal(linha, p6, ',###,##0.00', Vr_S,[negrito]);
      Inc(linha);
    end;

    if (Vr_P > 0) or (Vr_S > 0) then
    begin
      RDprint1.LinhaH(linha, 01, 180, 0,false);
      Inc(linha);
      Inc(linha);
    end;


    RDprint1.ImpF(linha, p3, 'Total Serviços => ',[negrito]);
    RDprint1.ImpVal(linha, p4, ',###,##0.00', total_serv,[negrito]);

    Inc(linha);
    RDprint1.ImpF(linha, p3+3, 'Total Peças => ',[negrito]);
    RDprint1.ImpVal(linha, p4, ',###,##0.00', total_pecas,[negrito]);

    Inc(linha);
    RDprint1.ImpF(linha, p3, 'Total Desconto => ',[negrito]);
    RDprint1.ImpVal(linha, p4, ',###,##0.00', total_desconto,[negrito]);

    Inc(linha);
    RDprint1.ImpF(linha, p3+3, 'Total Geral => ',[negrito]);
    RDprint1.ImpVal(linha, p4, ',###,##0.00', total_geral,[negrito]);

    total_serv  := 0;
    total_pecas := 0;
    total_geral := 0;
    total_desconto := 0;

    Application.ProcessMessages;
    RDprint1.TamanhoQteLinhas:= 66;
    RDprint1.Fechar;


    //QRLabel1.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;

    //if QRel.IsEmpty then
    //  Application.MessageBox('Não há dados para os parâmetros informados', PChar(Msg_Title), mb_IconInformation)
    //else
    //  Orcamentos.PreviewModal;
  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;

procedure TFrmRel_Ordem.btnProdutoClick(Sender: TObject);
begin
  try
    Produto.Value := GetConsulta('ESTOQUE', FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger, 0 , StrToInt(Produto.Text));
  except
    Produto.Value := GetConsulta('ESTOQUE', 0, 0, 0);
  end;
end;

procedure TFrmRel_Ordem.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRel_Ordem.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmRel_Ordem.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
   // Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmRel_Ordem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmRel_Ordem.FormCreate(Sender: TObject);
begin
  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);


  Tipo_Ordem.Items.Clear;
  Tipo_Ordem.Items.Add('TODOS');

  QRel.SQL.Clear;
  QRel.SQL.Add('select DESCRICAO from TABELAS where TIPO_TABELA = ''S'' AND STATUS = ''A''');
  QRel.Prepare;
  QRel.Open;

  while not QRel.Eof do
  begin
    Tipo_Ordem.Items.Add(QRel.FieldByName('DESCRICAO').AsString);
    QRel.Next;
  end;
  Tipo_Ordem.ItemIndex := 0;


  Servico.Items.Clear;
  Servico.Items.Add('TODOS');

  QRel.SQL.Clear;
  QRel.SQL.Add('SELECT SERVICO_ID, DESCRICAO FROM SERVICOS WHERE STATUS = ''A'' ORDER BY DESCRICAO');
  QRel.Prepare;
  QRel.Open;

  while not QRel.Eof do
  begin
    Servico.Items.Add(QRel.FieldByName('SERVICO_ID').AsString + ' - ' + QRel.FieldByName('DESCRICAO').AsString);
    QRel.Next;
  end;
  Servico.ItemIndex := 0;
end;

procedure TFrmRel_Ordem.ProdutoChange(Sender: TObject);
begin
  if Produto.Value > 0 then
    SearchProduto;
end;

procedure TFrmRel_Ordem.ProdutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = Produto) then
    btnProdutoClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmRel_Ordem.RDprint1NewPage(Sender: TObject; Pagina: Integer);
begin

  RDprint1.Imp(01, 01, FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString);
  RDprint1.ImpDir(01, (length(FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString)), 180, 'Sistema de Automação de empresas Eficaz', []);
  RDprint1.Imp(02, 01, 'Data/Hora: ' + DateToStr(date) + ' - ' + TimeToStr(now));
  RDprint1.impDir(02, 80, 180, 'Página: ' + IntToStr(Pagina), []);
  RDprint1.impC(03, 80, '*** RELATÓRIO FECHAMENTO MENSAL DE SERVIÇOS/PEÇAS ***',[negrito]);
  RDprint1.imp(04, 01, 'Período:'+ datetoStr(dtmen.date) + ' à ' + datetoStr(dtmai.date));
  RDprint1.LinhaH(05,01,180,0,false);

  //POSICAO DAS COLUNAS
  p1 := 01;
  p2 := 08;
  p3 := 23;
  p4 := 62;
  p5 := 73;
  p6 := 84;
  p7 := 96;
  p8 := 113;
  p9 := 128;
  p10 := 140;
  p11 := 170;

  RDprint1.imp(06, p1, 'Núm.');
  RDprint1.imp(06, p2, 'Data');
  RDprint1.imp(06, p3, 'Cliente');
  RDprint1.imp(06, p4+3, 'Serviços');
  RDprint1.imp(06, p5+6, 'Peças');
  RDprint1.imp(06, p6+6, 'Total');
  RDprint1.imp(06, p7, 'Atendimento');
  RDprint1.imp(06, p8, 'D.P. Ent.');
  RDprint1.imp(06, p9, 'Dt. Ent.');
  RDprint1.imp(06, p10, 'Atendente');
  RDprint1.imp(06, p11, 'Situação');

  RDprint1.LinhaH(07,01,180,0,false);
  linha:= 08;

end;

procedure TFrmRel_Ordem.SearchProduto;
begin
  QProduto.Close;
  QProduto.ParamByName('PRODUTO_ID').AsInteger := StrToInt(Produto.Text);
  QProduto.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  QProduto.Prepare;
  QProduto.Open;
end;

procedure TFrmRel_Ordem.Tipo_OrdemKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

end.
