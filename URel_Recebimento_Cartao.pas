unit URel_Recebimento_Cartao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, rxToolEdit, DB, IBCustomDataSet, IBQuery,
  QuickRpt, QRCtrls, Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,QRExport, Vcl.DBLookup, Vcl.DBCtrls, qrpctrls;

type
  TFrmRel_Recebimento_Cartao = class(TForm)
    Label1: TLabel;
    Dtmen: TDateEdit;
    Dtmai: TDateEdit;
    Bevel1: TBevel;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    Label5: TLabel;
    Tipo_Rel: TComboBox;
    QRel: TFDQuery;
    RecebimentoCartaoAnalitico: TQuickRep;
    QRBand6: TQRBand;
    QRSysData5: TQRSysData;
    QRLabel15: TQRLabel;
    QRSysData6: TQRSysData;
    QRLabel24: TQRLabel;
    QRShape8: TQRShape;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRShape9: TQRShape;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRDBText10: TQRDBText;
    GrupoFinalizadoraAnalitico: TQRGroup;
    QRDBText14: TQRDBText;
    DetalherFinalizadoraAnalitico: TQRBand;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    FooterFinalizadoraAnalitico: TQRBand;
    QRExpr15: TQRExpr;
    QRLabel33: TQRLabel;
    QRExpr17: TQRExpr;
    QRShape10: TQRShape;
    lblFinalizadora: TLabel;
    DataSourceFinalizadoras: TDataSource;
    QFinalizadoras: TFDQuery;
    ComboBoxFinalizadoras: TDBLookupComboBox;
    QRBand7: TQRBand;
    QRExpr20: TQRExpr;
    QRExpr21: TQRExpr;
    QRPShape1: TQRPShape;
    QRLabel34: TQRLabel;
    RecebimentoCartaoSintetico: TQuickRep;
    QRBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRLabel2: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    QRLabel5: TQRLabel;
    QRShape2: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText1: TQRDBText;
    QRBand2: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRPShape2: TQRPShape;
    QRLabel4: TQRLabel;
    QRBand8: TQRBand;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    procedure FormCreate(Sender: TObject);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure OrdemKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRetornaClick(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure DtmenEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Recebimento_Cartao: TFrmRel_Recebimento_Cartao;

implementation

uses
  UData, UPrincipal;

{$R *.dfm}

procedure TFrmRel_Recebimento_Cartao.btnExecutaClick(Sender: TObject);
begin
// 200, 325
  try
    //ShowMessage(Tipo_Rel.Items[Tipo_Rel.ItemIndex]);
    //Exit;
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

      if Tipo_Rel.Items[Tipo_Rel.ItemIndex] = 'Analítico' then
      begin
        QRel.Sql.Clear;
        QRel.SQL.Add('select transacao_principal.transacao_id, transacao_principal.historico, finalizadoras.descricao,');
        QRel.SQL.Add('transacoes.finalizadora_id, finalizadoras.tx_adm,');
        QRel.SQL.Add('transacao_principal.valor valor_quitacao, ((transacao_principal.valor / 100) * finalizadoras.tx_adm) taxa_adm');
        QRel.SQL.Add('from transacoes transacao_principal');
        QRel.SQL.Add('inner join transacoes on transacoes.transacao_id = transacao_principal.saida_id');
        QRel.SQL.Add('inner join finalizadoras on finalizadoras.finalizadora_id = transacoes.finalizadora_id');
        QRel.SQL.Add('where transacao_principal.tipo_venda = :TIPO_VENDA');
        QRel.SQL.Add('and (transacao_principal.conduta = :CONDUTA)');
        QRel.SQL.Add('and (transacao_principal.TPCTB = :TPCTB)');

        if ComboBoxFinalizadoras.KeyValue <> null then
          begin
            QRel.SQL.Add('and transacoes.finalizadora_id = :FINALIZADORA_ID');
            QRel.ParamByName('FINALIZADORA_ID').AsInteger := StrToInt(ComboBoxFinalizadoras.KeyValue);
          end;

        QRel.SQL.Add('and (transacao_principal.dt_trans between :DT_INICIAL and :DT_FINAL) order by finalizadoras.descricao;');
      end
      else
      begin
        QRel.Sql.Clear;
        QRel.SQL.Add('select finalizadoras.descricao, sum(transacao_principal.valor) valor_quitacao,');
        QRel.SQL.Add('sum(((transacao_principal.valor / 100) * finalizadoras.tx_adm)) taxa_adm');
        QRel.SQL.Add('from transacoes transacao_principal');
        QRel.SQL.Add('inner join transacoes on transacoes.transacao_id = transacao_principal.saida_id');
        QRel.SQL.Add('inner join finalizadoras on finalizadoras.finalizadora_id = transacoes.finalizadora_id');
        QRel.SQL.Add('where transacao_principal.tipo_venda = :TIPO_VENDA');
        QRel.SQL.Add('and (transacao_principal.conduta = :CONDUTA)');
        QRel.SQL.Add('and (transacao_principal.TPCTB = :TPCTB)');

         if ComboBoxFinalizadoras.KeyValue <> null then
          begin
            QRel.SQL.Add('and transacoes.finalizadora_id = :FINALIZADORA_ID');
            QRel.ParamByName('FINALIZADORA_ID').AsInteger := StrToInt(ComboBoxFinalizadoras.KeyValue);
          end;

        QRel.SQL.Add('and (transacao_principal.dt_trans between :DT_INICIAL and :DT_FINAL) group by finalizadoras.descricao order by finalizadoras.descricao;');
      end;

    QRel.ParamByName('TIPO_VENDA').AsString := 'PAGTO CARTAO';
    QRel.ParamByName('CONDUTA').AsString    := '07';
    QRel.ParamByName('TPCTB').AsString      := FrmData.QAcesso.FieldByName('TPCTB').AsString;
    QRel.ParamByName('DT_INICIAL').AsDate   := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDate     := Dtmai.Date;

    QRel.Prepare;
    QRel.Open;

    if QRel.IsEmpty then
    begin
        Application.MessageBox('Não há dados para os parâmetros informados', PChar(Msg_Title), mb_IconInformation);
        Exit;
    end;


    QRLabel31.Caption := 'Período Analisado: ' + Dtmen.Text + ' a ' + Dtmai.Text;
    QRLabel8.Caption  := 'Período Analisado: ' + Dtmen.Text + ' a ' + Dtmai.Text;

    if Tipo_Rel.Items[Tipo_Rel.ItemIndex] = 'Analítico' then
      RecebimentoCartaoAnalitico.Preview()
    else
      RecebimentoCartaoSintetico.Preview();


  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;

procedure TFrmRel_Recebimento_Cartao.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRel_Recebimento_Cartao.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmRel_Recebimento_Cartao.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    //Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmRel_Recebimento_Cartao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmRel_Recebimento_Cartao.FormCreate(Sender: TObject);
begin
  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);
end;

procedure TFrmRel_Recebimento_Cartao.FormShow(Sender: TObject);
begin
  QFinalizadoras.Close;
  QFinalizadoras.Prepare;
  QFinalizadoras.Open();
  //ShowMessage(IntToStr(QFinalizadoras.RecordCount));

  if QFinalizadoras.IsEmpty then
    ComboBoxFinalizadoras.Enabled := False;
end;

procedure TFrmRel_Recebimento_Cartao.OrdemKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

end.
