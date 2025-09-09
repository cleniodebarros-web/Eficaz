unit UPre_Venda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls, Mask, rxToolEdit, rxCurrEdit, DB,
  IBCustomDataSet, IBQuery, QRCtrls, QuickRpt, ComCtrls, DBCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmPre_Venda = class(TForm)
    Label1: TLabel;
    Comanda: TEdit;
    Label2: TLabel;
    Cod_Barras: TEdit;
    Label3: TLabel;
    Quantidade: TCurrencyEdit;
    Label4: TLabel;
    Descricao: TEdit;
    Preco: TCurrencyEdit;
    Label5: TLabel;
    btnProduto: TSpeedButton;
    Label6: TLabel;
    StatusBar1: TStatusBar;
    Orcamento: TQuickRep;
    QRBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel18: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape3: TQRShape;
    QRLabel15: TQRLabel;
    QRLabel14: TQRLabel;
    QRSysData1: TQRSysData;
    Cabec: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    DetailBand1: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRBand2: TQRBand;
    QRLabel26: TQRLabel;
    QRShape5: TQRShape;
    QRExpr1: TQRExpr;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    Label26: TLabel;
    Vendedor: TCurrencyEdit;
    btnVendedor: TSpeedButton;
    DBText6: TDBText;
    DataVendedor: TDataSource;
    Panel1: TPanel;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    QProduto: TFDQuery;
    QRel: TFDQuery;
    QInsert: TFDQuery;
    QVendedor: TFDQuery;
    procedure btnRetornaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ComandaExit(Sender: TObject);
    procedure btnProdutoClick(Sender: TObject);
    procedure Cod_BarrasExit(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure Cod_BarrasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComandaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PrecoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnVendedorClick(Sender: TObject);
    procedure VendedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure VendedorChange(Sender: TObject);
    procedure VendedorExit(Sender: TObject);
    procedure VendedorEnter(Sender: TObject);
    procedure btnRetornaMouseEnter(Sender: TObject);
    procedure btnRetornaMouseLeave(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Autoriza: Boolean;
  end;

var
  FrmPre_Venda: TFrmPre_Venda;
  ID: Integer;
  Pode_Sair: Boolean;

implementation

uses
  UData, UPrincipal, UConsulta, UComanda, UCancela_Comanda;

{$R *.dfm}

function TFrmPre_Venda.Autoriza: Boolean;
var
InputString: String;
begin
  InputString := InputBox(PChar(Msg_Title), 'Supervisor:' , '');

  QRel.Sql.Clear;
  QRel.Sql.Add('SELECT * FROM OPERADORES');
  QRel.Sql.Add('WHERE');
  QRel.Sql.Add('(OPERADOR_ID = :OPERADOR_ID)');

  QRel.ParamByName('OPERADOR_ID').AsString := StrZero(InputString, 14, 0);

  QRel.Prepare;
  QRel.Open;

  if QRel.IsEmpty then
    Result := False
  else
    Result := QRel.FieldByName('CANCELA_ITEM').AsBoolean;
end;

procedure TFrmPre_Venda.btnExecutaClick(Sender: TObject);
begin
// 248, 428

  if (not QProduto.IsEmpty) and (not QVendedor.IsEmpty) then
  begin
    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT * FROM ORCITENS');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(ORCAMENTO_ID = :ORCAMENTO_ID)');
    QRel.Sql.Add('AND (PRODUTO_ID = :PRODUTO_ID)');
    QRel.Sql.Add('AND (TP_PROD_SERV = :TP_PROD_SERV)');

    QRel.ParamByName('ORCAMENTO_ID').AsInteger := ID;
    QRel.ParamByName('PRODUTO_ID').AsInteger   := QProduto.FieldByName('PRODUTO_ID').AsInteger;
    QRel.ParamByName('TP_PROD_SERV').AsString  := 'P';

    QRel.Prepare;
    QRel.Open;

    if QRel.IsEmpty then
    begin
      QInsert.Sql.Clear;
      QInsert.Sql.Add('INSERT INTO ORCITENS(ORCAMENTO_ID,      PRODUTO_ID,     TP_PROD_SERV,    DESCRICAO, ' +
                                            'QUANTIDADE,       VR_UNITARIO,    VR_TOTAL,        TRIBUTO_ID) VALUES( ' +
                                            ':ORCAMENTO_ID,    :PRODUTO_ID,    :TP_PROD_SERV,   :DESCRICAO, ' +
                                            ':QUANTIDADE,      :VR_UNITARIO,   :VR_TOTAL,       :TRIBUTO_ID)');

      QInsert.ParamByName('ORCAMENTO_ID').AsInteger := ID;
      QInsert.ParamByName('PRODUTO_ID').AsInteger   := QProduto.FieldByName('PRODUTO_ID').AsInteger;
      QInsert.ParamByName('TP_PROD_SERV').AsString  := 'P';
      QInsert.ParamByName('DESCRICAO').AsString     := QProduto.FieldByName('DESCRICAO').AsString;
      QInsert.ParamByName('QUANTIDADE').AsFloat     := Quantidade.Value;
      QInsert.ParamByName('VR_UNITARIO').AsFloat    := QProduto.FieldByName('PRECO_VAREJO').AsFloat;
      QInsert.ParamByName('VR_TOTAL').AsFloat       := (QProduto.FieldByName('PRECO_VAREJO').AsFloat * Quantidade.Value);
      QInsert.ParamByName('TRIBUTO_ID').AsInteger   := 1;

      QInsert.Prepare;
      QInsert.ExecSql;


    end
    else
    begin

      QInsert.Sql.Clear;
      QInsert.Sql.Add('UPDATE ORCITENS SET QUANTIDADE = :QUANTIDADE, VR_TOTAL = :VR_TOTAL');
      QInsert.Sql.Add('WHERE');
      QInsert.Sql.Add('(ORCAMENTO_ID = :ORCAMENTO_ID)');
      QInsert.Sql.Add('AND (PRODUTO_ID = :PRODUTO_ID)');
      QInsert.Sql.Add('AND (TP_PROD_SERV = :TP_PROD_SERV)');

      QInsert.ParamByName('QUANTIDADE').AsFloat     := (QRel.FieldByName('QUANTIDADE').AsFloat +  Quantidade.Value);
      QInsert.ParamByName('VR_TOTAL').AsFloat       := ((QRel.FieldByName('QUANTIDADE').AsFloat +  Quantidade.Value) * QRel.FieldByName('VR_UNITARIO').AsFloat);
      QInsert.ParamByName('ORCAMENTO_ID').AsInteger := ID;
      QInsert.ParamByName('PRODUTO_ID').AsInteger   := QProduto.FieldByName('PRODUTO_ID').AsInteger;
      QInsert.ParamByName('TP_PROD_SERV').AsString  := 'P';

      QInsert.Prepare;
      QInsert.ExecSql;


    end;

    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT SUM(VR_TOTAL) VR_TOTAL');
    QRel.Sql.Add('FROM ORCITENS');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(ORCAMENTO_ID = :ORCAMENTO_ID)');

    QRel.ParamByName('ORCAMENTO_ID').AsInteger := ID;

    QRel.Prepare;
    QRel.Open;

    QInsert.Sql.Clear;
    QInsert.Sql.Add('UPDATE ORCAMENTOS SET VALOR = :VALOR');
    QInsert.Sql.Add('WHERE');
    QInsert.Sql.Add('(ORCAMENTO_ID = :ORCAMENTO_ID)');

    QInsert.ParamByName('VALOR').AsFloat          := QRel.FieldByName('VR_TOTAL').AsFloat;
    QInsert.ParamByName('ORCAMENTO_ID').AsInteger := ID;

    QInsert.Prepare;
    QInsert.ExecSql;



    Cod_Barras.Text  := '';
    Descricao.Text   := '';
    Preco.Value      := 0;
    Quantidade.Value := 1;

    Cod_Barras.SetFocus;
  end;
end;

procedure TFrmPre_Venda.btnProdutoClick(Sender: TObject);
begin
  QProduto.Sql.Clear;
  QProduto.Sql.Add('SELECT * FROM PRODUTOS');
  QProduto.Sql.Add('WHERE');
  QProduto.Sql.Add('(PRODUTO_ID = :PRODUTO_ID)');
  QProduto.Sql.Add('AND (EMPRESA_ID = :EMPRESA_ID)');
  QProduto.Sql.Add('AND (STATUS = :STATUS)');

  if StrToInt(LeIni(Arq_Ini, 'Sistema', 'Localização')) > 0 then
  begin
    QProduto.Sql.Add('AND (LOCALIZACAO_ID = :LOCALIZACAO_ID)');

    QProduto.ParamByName('LOCALIZACAO_ID').AsInteger := StrToInt(LeIni(Arq_Ini, 'Sistema', 'Localização'));
  end;

  QProduto.ParamByName('PRODUTO_ID').AsInteger := GetConsulta('ESTOQUE', FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger, 0, 0);
  QProduto.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  QProduto.ParamByName('STATUS').AsString      := 'A';

  QProduto.Prepare;
  QProduto.Open;

  Cod_Barras.Text := QProduto.FieldByName('COD_BARRA').AsString;
  Descricao.Text  := QProduto.FieldByName('DESCRICAO').AsString;

  if (FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime >= QProduto.FieldByName('PROMO_INICIAL').AsDateTime) and (FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime <= QProduto.FieldByName('PROMO_FINAL').AsDateTime) then
    Preco.Value := QProduto.FieldByName('PRECO_PROMOCAO').AsFloat
  else
    Preco.Value := QProduto.FieldByName('PRECO_VAREJO').AsFloat;

  Keybd_Event(VK_RETURN, 0, 0, 0);
end;

procedure TFrmPre_Venda.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPre_Venda.btnRetornaMouseEnter(Sender: TObject);
begin
  Pode_Sair := True;
end;

procedure TFrmPre_Venda.btnRetornaMouseLeave(Sender: TObject);
begin
  Pode_Sair := False;
end;

procedure TFrmPre_Venda.btnVendedorClick(Sender: TObject);
begin
  try
    Vendedor.Value := GetConsulta('PESSOAL', 0, 0, StrToInt(Vendedor.Text));
  except
    Vendedor.Value := GetConsulta('PESSOAL', 0, 0, 0);
  end;
end;

procedure TFrmPre_Venda.Cod_BarrasExit(Sender: TObject);
var
Vr_Produto, Vr_Quantidade: Real;
Cod_Alternativo, Cod_Reduzido: String;
begin
  if (Cod_Barras.Text <> '') and (Cod_Barras.Text <> 'NOVO') then
  begin

    Cod_Alternativo := Cod_Barras.Text;
    Cod_Reduzido    := Cod_Barras.Text;
    Vr_Produto      := 0;
    Vr_Quantidade   := 0;

    if (Copy(Cod_Barras.Text, 1, 1) = '2') and (FrmPrincipal.Config.FieldByName('TEM_BALANCA').AsString = 'True') then
    begin
      if LeIni(Arq_Ini, 'Sistema', 'Retorno Etiqueta') = 'Peso' then
      begin
        if LeIni(Arq_Ini, 'Sistema', 'Formato Etiqueta') = '1' then
          Vr_Quantidade := StrToFloat(Copy(Cod_Barras.Text, 8, 3) + ',' + Copy(Cod_Barras.Text, 11, 2))
        else
          Vr_Quantidade := StrToFloat(Copy(Cod_Barras.Text, 8, 2) + ',' + Copy(Cod_Barras.Text, 10, 3))
      end
      else
      begin
        if LeIni(Arq_Ini, 'Sistema', 'Formato Etiqueta') = '1' then
          Vr_Produto := StrToFloat(Copy(Cod_Barras.Text, 8, 3) + ',' + Copy(Cod_Barras.Text, 11, 2))
        else
          Vr_Produto := StrToFloat(Copy(Cod_Barras.Text, 8, 2) + ',' + Copy(Cod_Barras.Text, 10, 3));
      end;

      Cod_Barras.Text := Copy(Cod_Barras.Text, 2, FrmPrincipal.Config.FieldByName('TAM_PESAVEIS').AsInteger);
      Cod_Alternativo := Copy(Cod_Barras.Text, 2, (length(Cod_Barras.Text) - 1));
      Cod_Reduzido    := StrZero(Copy(Cod_Reduzido, 2, FrmPrincipal.Config.FieldByName('TAM_PESAVEIS').AsInteger), FrmPrincipal.Config.FieldByName('TAM_PESAVEIS').AsInteger, 0);

      if FrmPrincipal.Config.FieldByName('GERA_DIGITO').AsString = 'True' then
        Cod_Barras.Text := Dig(Cod_Barras.Text);

      Cod_Barras.Text := StrZero(Cod_Barras.Text, FrmPrincipal.Config.FieldByName('TAM_BARRAS').AsInteger, 0);
    end
    else
      Cod_Reduzido := StrZero(Copy(Cod_Reduzido, 1, FrmPrincipal.Config.FieldByName('TAM_PESAVEIS').AsInteger), FrmPrincipal.Config.FieldByName('TAM_PESAVEIS').AsInteger, 0);

    Cod_Barras.Text := StrZero(Cod_Barras.Text, FrmPrincipal.Config.FieldByName('TAM_BARRAS').AsInteger, 0);

    QProduto.Sql.Clear;
    QProduto.Sql.Add('SELECT * FROM PRODUTOS');
    QProduto.Sql.Add('WHERE');
    QProduto.Sql.Add('(COD_BARRA = :COD_BARRA OR COD_BARRA_AUX1 = :COD_BARRA OR COD_BARRA_AUX2 = :COD_BARRA OR ' +
                     'COD_BARRA_AUX3 = :COD_BARRA OR COD_BARRA_AUX4 = :COD_BARRA OR COD_ORIGINAL = :ALTERNATIVO OR REFERENCIA = :ALTERNATIVO OR CODRED = :CODRED)');
    QProduto.Sql.Add('AND (EMPRESA_ID = :EMPRESA_ID)');
    QProduto.Sql.Add('AND (STATUS = :STATUS)');

    if StrToInt(LeIni(Arq_Ini, 'Sistema', 'Localização')) > 0 then
    begin
      QProduto.Sql.Add('AND (LOCALIZACAO_ID = :LOCALIZACAO_ID)');

      QProduto.ParamByName('LOCALIZACAO_ID').AsInteger := StrToInt(LeIni(Arq_Ini, 'Sistema', 'Localização'));
    end;

    QProduto.ParamByName('COD_BARRA').AsString   := StrZero(Cod_Barras.Text, FrmPrincipal.Config.FieldByName('TAM_BARRAS').AsInteger, 0);
    QProduto.ParamByName('ALTERNATIVO').AsString := Cod_Alternativo;
    QProduto.ParamByName('CODRED').AsString      := Cod_Reduzido;
    QProduto.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    QProduto.ParamByName('STATUS').AsString      := 'A';

    QProduto.Prepare;
    QProduto.Open;

    if QProduto.IsEmpty then
    begin
      Application.MessageBox('Produto inexistente', PChar(Msg_Title), mb_IconStop);
      Cod_Barras.SetFocus;
    end
    else
    begin
      Cod_Barras.Text := QProduto.FieldByName('COD_BARRA').AsString;
      Descricao.Text  := QProduto.FieldByName('DESCRICAO').AsString;

      if Vr_Produto = 0 then
      begin
        if (FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime >= QProduto.FieldByName('PROMO_INICIAL').AsDateTime) and (FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime <= QProduto.FieldByName('PROMO_FINAL').AsDateTime) then
          Preco.Value := QProduto.FieldByName('PRECO_PROMOCAO').AsFloat
        else
          Preco.Value := QProduto.FieldByName('PRECO_VAREJO').AsFloat;
      end
      else
        Preco.Value := Vr_Produto;

      if Vr_Quantidade = 0 then
      begin
        if Vr_Produto > 0 then
          Quantidade.Value := (Vr_Produto / Preco.Value);
      end
      else
        Quantidade.Value := Vr_Quantidade;
    end;
  end
  else
  begin
    if Cod_Barras.Text = 'NOVO' then
    begin
      Cod_Barras.Text  := '';
      Vendedor.Enabled := True;
      Vendedor.SetFocus;
    end
    else
    begin
      if not Pode_Sair then      
        Cod_Barras.SetFocus;
    end;
  end;
end;

procedure TFrmPre_Venda.Cod_BarrasKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F7 then
    btnProdutoClick(Sender);

  if Key = Vk_Return then
    Quantidade.SetFocus;

  if Key = Vk_Down then
    Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmPre_Venda.ComandaExit(Sender: TObject);
begin
  if Comanda.Text <> '' then
  begin
    QRel.Sql.Clear;
    QRel.Sql.Add('SELECT * FROM ORCAMENTOS');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(COMANDA = :COMANDA)');
    QRel.Sql.Add('AND (ORCAMENTOS.EMPRESA_ID = :EMPRESA_ID)');

    QRel.ParamByName('COMANDA').AsString     := Comanda.Text;
    QRel.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;

    QRel.Prepare;
    QRel.Open;

    if QRel.IsEmpty then
    begin
      QInsert.Sql.Clear;
      QInsert.Sql.Add('INSERT INTO ORCAMENTOS(DT_ORCAMENTO,   DT_MOVIMENTO,  EMPRESA_ID,  COMANDA,  VENDEDOR_ID, CONTATO) VALUES( ' +
                                              ':DT_ORCAMENTO, :DT_MOVIMENTO, :EMPRESA_ID, :COMANDA, :VENDEDOR_ID, :CONTATO)');

      QInsert.ParamByName('DT_ORCAMENTO').AsDateTime  := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
      QInsert.ParamByName('DT_MOVIMENTO').AsDateTime  := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
      QInsert.ParamByName('EMPRESA_ID').AsInteger     := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
      QInsert.ParamByName('COMANDA').AsString         := Comanda.Text;
      QInsert.ParamByName('VENDEDOR_ID').AsInteger    := StrToInt(Vendedor.Text);
      QInsert.ParamByName('CONTATO').AsString         := TimeToStr(Time);

      QInsert.Prepare;
      QInsert.ExecSql;



      QRel.Sql.Clear;
      QRel.Sql.Add('SELECT * FROM ORCAMENTOS');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(COMANDA = :COMANDA)');
      QRel.Sql.Add('AND (ORCAMENTOS.EMPRESA_ID = :EMPRESA_ID)');

      QRel.ParamByName('COMANDA').AsString     := Comanda.Text;
      QRel.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;

      QRel.Prepare;
      QRel.Open;

      ID := QRel.FieldByName('ORCAMENTO_ID').AsInteger;
    end
    else
      ID := QRel.FieldByName('ORCAMENTO_ID').AsInteger;

    Vendedor.Enabled   := False;
    Comanda.Enabled    := False;
    Cod_Barras.Enabled := True;
    Descricao.Enabled  := True;
    Preco.Enabled      := True;
    Quantidade.Enabled := True;
    btnProduto.Enabled := True;

    Cod_Barras.SetFocus;
  end
  else
  begin
    if not Pode_Sair then
      Comanda.SetFocus;
  end;
end;

procedure TFrmPre_Venda.ComandaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmPre_Venda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmPre_Venda.FormCreate(Sender: TObject);
begin
  Pode_Sair := False;
end;

procedure TFrmPre_Venda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
InputString: String;
begin
  if Key = VK_F2 then
  begin
    if Cod_Barras.Focused then
      Cod_Barras.Text := 'NOVO';

    Vendedor.Enabled := True;
    Vendedor.SetFocus;
  end;

  if Key = VK_F3 then
  begin
    if Autoriza then
    begin
      Application.CreateForm(TFrmComanda, FrmComanda);
      try
        if FrmComanda.ShowModal = mrOK then
        begin
          if FrmComanda.Comanda.Text <> '' then
          begin
            QRel.Sql.Clear;
            QRel.Sql.Add('SELECT ORCITENS.*, PRODUTOS.COD_BARRA');
            QRel.Sql.Add('FROM ORCITENS');
            QRel.Sql.Add('INNER JOIN ORCAMENTOS');
            QRel.Sql.Add('ON (ORCITENS.ORCAMENTO_ID = ORCAMENTOS.ORCAMENTO_ID)');
            QRel.Sql.Add('INNER JOIN PRODUTOS');
            QRel.Sql.Add('ON (ORCITENS.PRODUTO_ID = PRODUTOS.PRODUTO_ID)');
            QRel.Sql.Add('WHERE');
            QRel.Sql.Add('(ORCAMENTOS.COMANDA = :COMANDA)');
            QRel.Sql.Add('AND (ORCAMENTOS.EMPRESA_ID = :EMPRESA_ID)');

            QRel.ParamByName('COMANDA').AsString     := FrmComanda.Comanda.Text;
            QRel.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;

            QRel.Prepare;
            QRel.Open;

            if not QRel.IsEmpty then
            begin
              Exclui_Comanda(FrmComanda.Comanda.Text);

              QRel.Sql.Clear;
              QRel.Sql.Add('SELECT SUM(VR_TOTAL) VR_TOTAL');
              QRel.Sql.Add('FROM ORCITENS');
              QRel.Sql.Add('WHERE');
              QRel.Sql.Add('(ORCAMENTO_ID = :ORCAMENTO_ID)');

              QRel.ParamByName('ORCAMENTO_ID').AsInteger := ID;

              QRel.Prepare;
              QRel.Open;

              if QRel.FieldByName('VR_TOTAL').AsFloat = 0 then
              begin
                QInsert.Sql.Clear;
                QInsert.Sql.Add('DELETE FROM ORCAMENTOS');
                QInsert.Sql.Add('WHERE');
                QInsert.Sql.Add('(ORCAMENTO_ID = :ORCAMENTO_ID)');

                QInsert.ParamByName('ORCAMENTO_ID').AsInteger := ID;

                QInsert.Prepare;
                QInsert.ExecSql;



                if Cod_Barras.Focused then
                  Cod_Barras.Text := 'NOVO';

                Vendedor.Enabled := True;
                Vendedor.SetFocus;
              end
              else
              begin
                QInsert.Sql.Clear;
                QInsert.Sql.Add('UPDATE ORCAMENTOS SET VALOR = :VALOR');
                QInsert.Sql.Add('WHERE');
                QInsert.Sql.Add('(ORCAMENTO_ID = :ORCAMENTO_ID)');

                QInsert.ParamByName('VALOR').AsFloat          := QRel.FieldByName('VR_TOTAL').AsFloat;
                QInsert.ParamByName('ORCAMENTO_ID').AsInteger := ID;

                QInsert.Prepare;
                QInsert.ExecSql;


              end;
            end
            else
              Application.MessageBox('Cartão sem lançamentos', PChar(Msg_Title), mb_IconStop);
          end;
        end;
      finally
        FrmComanda.Release;
      end;
    end
    else
      Application.MessageBox('Operador inexistente ou não autorizado para cancelar itens', PChar(Msg_Title), mb_IconStop);
  end;

  if Key = VK_F5 then
  begin
    InputString := InputBox(PChar(Msg_Title), 'Nº Cartão:' , '');

    try
      QRel.Sql.Clear;
      QRel.Sql.Add('SELECT ORCITENS.*');
      QRel.Sql.Add('FROM ORCITENS');
      QRel.Sql.Add('INNER JOIN ORCAMENTOS');
      QRel.Sql.Add('ON (ORCITENS.ORCAMENTO_ID = ORCAMENTOS.ORCAMENTO_ID)');
      QRel.Sql.Add('WHERE');
      QRel.Sql.Add('(ORCAMENTOS.COMANDA = :COMANDA)');
      QRel.Sql.Add('AND (ORCAMENTOS.EMPRESA_ID = :EMPRESA_ID)');
      QRel.Sql.Add('ORDER BY ORCITENS.DESCRICAO');

      QRel.ParamByName('COMANDA').AsString     := InputString;
      QRel.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;

      QRel.Prepare;
      QRel.Open;

      if not QRel.IsEmpty then
        Orcamento.PreviewModal
      else
        Application.MessageBox('Sem dados para o Cartão informado', PChar(Msg_Title), mb_IconInformation);
    except
      Application.MessageBox('Cartão inválido', PChar(Msg_Title), mb_IconStop);
    end;
  end;
end;

procedure TFrmPre_Venda.PrecoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmPre_Venda.VendedorChange(Sender: TObject);
begin
  try
    QVendedor.Close;

    QVendedor.ParamByName('FUNCIONARIO_ID').AsInteger := StrToInt(Vendedor.Text);

    QVendedor.Prepare;
    QVendedor.Open;
  except

  end;
end;

procedure TFrmPre_Venda.VendedorEnter(Sender: TObject);
begin
  Comanda.Text       := '';
  Vendedor.Value     := 0;
  Comanda.Enabled    := False;
  Cod_Barras.Enabled := False;
  Descricao.Enabled  := False;
  Preco.Enabled      := False;
  Quantidade.Enabled := False;
  btnProduto.Enabled := False;

  Keybd_Event(VK_RIGHT, 0, 0, 0);
end;

procedure TFrmPre_Venda.VendedorExit(Sender: TObject);
begin
  if not Pode_Sair then
  begin
    VendedorChange(Sender);

    if QVendedor.IsEmpty then
    begin
      Application.MessageBox('Vendedor inexistente', PChar(Msg_Title), mb_IconStop);
      Vendedor.SetFocus;
    end
    else
    begin
      Comanda.Enabled := True;
      Comanda.SetFocus;
    end;
  end;
end;

procedure TFrmPre_Venda.VendedorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = Vendedor) then
    btnVendedorClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

end.
