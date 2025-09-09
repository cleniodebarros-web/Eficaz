unit UReajuste_Preco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, rxToolEdit, DB, IBCustomDataSet, IBQuery,
  Math, Buttons, sGauge, rxCurrEdit, DBCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmReajuste_Preco = class(TForm)
    Bevel1: TBevel;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    Label1: TLabel;
    combo_reajustar_por: TComboBox;
    DBText1: TDBText;
    btnLocalizacao: TSpeedButton;
    LOCALIZACAO_ID: TCurrencyEdit;
    Label2: TLabel;
    Label3: TLabel;
    SUBTIPO_ID: TCurrencyEdit;
    btnSub_Tipo: TSpeedButton;
    DBText3: TDBText;
    DBText2: TDBText;
    btnGrupo: TSpeedButton;
    GRUPO_ID: TCurrencyEdit;
    Label4: TLabel;
    Produto: TCurrencyEdit;
    btnProduto: TSpeedButton;
    Label5: TLabel;
    preco: TCurrencyEdit;
    Label6: TLabel;
    DBText4: TDBText;
    DataProduto: TDataSource;
    DataGrupo: TDataSource;
    DataSubtipo: TDataSource;
    DataLocalizacao: TDataSource;
    operacao: TComboBox;
    Label7: TLabel;
    Label8: TLabel;
    porcentagem_ajuste: TCurrencyEdit;
    QProduto: TFDQuery;
    QCalculos: TFDQuery;
    QLocalizacao: TFDQuery;
    QSubtipo: TFDQuery;
    Qgrupo: TFDQuery;
    QUpdate: TFDQuery;
    Label9: TLabel;
    Vr_Produto: TCurrencyEdit;
    Chk_Prazo: TCheckBox;
    procedure btnExecutaClick(Sender: TObject);
    procedure btnProdutoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnRetornaClick(Sender: TObject);
    procedure combo_reajustar_porChange(Sender: TObject);
    procedure btnGrupoClick(Sender: TObject);
    procedure btnSub_TipoClick(Sender: TObject);
    procedure btnLocalizacaoClick(Sender: TObject);
    procedure ProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GRUPO_IDExit(Sender: TObject);
    procedure SUBTIPO_IDExit(Sender: TObject);
    procedure LOCALIZACAO_IDExit(Sender: TObject);
    procedure operacaoChange(Sender: TObject);
    procedure ProdutoExit(Sender: TObject);
    procedure SearchProduto;

  private
    procedure DetailSearch(Tabela: String);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmReajuste_Preco: TFrmReajuste_Preco;

implementation

uses
  UData, UPrincipal, UConsulta;

{$R *.dfm}

procedure TFrmReajuste_Preco.btnExecutaClick(Sender: TObject);
var
//Base_Calc_Desc_Rodape, Vl_Prod, Perc_Desc, Perc_Frt, Perc_Desp, New_Custo, Vl_Sbt, Perc_Sub, Desc_Footer, ICMS_Sub: Real;
//New_IPI, New_Frt, New_Desp, Cst_Entr, Est_Exist, Cst_Med_Entr, Indices, New_PMZ, New_Sugestao, New_Dif_ICMS, Perc_IPI: Real;
Gerencial: Boolean;
Tipo, Valor,Valor_produto, OP : String;
Porcentagem: Real;
begin
  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;


    Tipo  := combo_reajustar_por.Text;
    Valor := preco.Text;
    OP    := operacao.Text;
    Porcentagem := (StrToFloat(porcentagem_ajuste.Text) / 100);
    Valor_produto := Vr_Produto.Text;


   if Application.MessageBox('Atenção!!!!!' + #13 + ' Confirma a alteração de preços dos produtos selecionados?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = IDYES then
   Begin


    QUpdate.Sql.Clear;


     if OP = 'Reajuste' then
     Begin
       QUpdate.Sql.Add('UPDATE PRODUTOS SET DT_PRECO = :DT_PRECO, PRECO_VAREJO = (PRECO_VAREJO + (PRECO_VAREJO * :PORCENTAGEM))');

       if Chk_Prazo.Checked  tHEN
       QUpdate.Sql.Add(',PRECO_PRAZO = (PRECO_VAREJO + (PRECO_VAREJO * :PORCENTAGEM))');

       QUpdate.ParamByName('PORCENTAGEM').AsFloat := Porcentagem;
       QUpdate.ParamByName('DT_PRECO').AsDateTime := Date;
     End;



     if OP = 'Acréscimo' then
     Begin
       QUpdate.Sql.Add('UPDATE PRODUTOS SET DT_PRECO = :DT_PRECO, PRECO_VAREJO = (PRECO_VAREJO + :VALOR_ACRESCIMO)');

       if Chk_Prazo.Checked  tHEN
       QUpdate.Sql.Add(',PRECO_PRAZO = (PRECO_VAREJO + :VALOR_ACRESCIMO)');

       QUpdate.ParamByName('VALOR_ACRESCIMO').AsFloat := StrToFloat(Valor);

       QUpdate.ParamByName('DT_PRECO').AsDateTime := Date;
     End;


     if OP = 'Valor Produto' then
     Begin
       QUpdate.Sql.Add('UPDATE PRODUTOS SET DT_PRECO = :DT_PRECO, PRECO_VAREJO = (:VALOR_PRODUTO)');

       if Chk_Prazo.Checked  tHEN
       QUpdate.Sql.Add(',PRECO_PRAZO = PRECO_VAREJO = (:VALOR_PRODUTO)');

       QUpdate.ParamByName('VALOR_PRODUTO').AsFloat := StrToFloat(Valor_Produto);
       QUpdate.ParamByName('DT_PRECO').AsDateTime := Date;
     End;


     if Tipo = 'Produto' then
      Begin
        QUpdate.Sql.Add('WHERE PRODUTOS.PRODUTO_ID = :PRODUTO_ID');
        QUpdate.ParamByName('PRODUTO_ID').AsInteger := StrToInt(Produto.Text);
      End;

     if Tipo = 'Grupo' then
     Begin
      QUpdate.Sql.Add('WHERE PRODUTOS.GRUPO_ID = :GRUPO_ID');
      QUpdate.ParamByName('GRUPO_ID').AsInteger := StrToInt(GRUPO_ID.Text);
     End;

     if Tipo = 'Sub-Tipo' then
     Begin
      QUpdate.Sql.Add('WHERE PRODUTOS.SUBTIPO_ID = :SUBTIPO_ID');
      QUpdate.ParamByName('SUBTIPO_ID').AsInteger := StrToInt(SUBTIPO_ID.Text);
     End;

     if Tipo = 'Localização' then
     Begin
      QUpdate.Sql.Add('WHERE PRODUTOS.LOCALIZACAO_ID = :LOCALIZACAO_ID');
      QUpdate.ParamByName('LOCALIZACAO_ID').AsInteger := StrToInt(LOCALIZACAO_ID.Text);
     End;

    QUpdate.Prepare;
    QUpdate.ExecSql;



    Application.MessageBox(PChar('Reajuste de Preço realizado com sucesso.'), PChar(Msg_Title), mb_IconInformation);



   End
   Else
   Application.MessageBox('Operação Cancelada.','Eficaz', MB_IconStop + MB_OK);

  finally

    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
    ModalResult := mrOk;

  end;
end;

procedure TFrmReajuste_Preco.btnGrupoClick(Sender: TObject);
begin
  try
    GRUPO_ID.Value := GetConsulta('GRUPOS', 0, 0, StrToInt(GRUPO_ID.Text));
  except
    GRUPO_ID.Value := GetConsulta('GRUPOS', 0, 0, 0);
  end;
end;

procedure TFrmReajuste_Preco.btnLocalizacaoClick(Sender: TObject);
begin
  try
    LOCALIZACAO_ID.Value := GetConsulta('LOCAIS', 0, 0, StrToInt(LOCALIZACAO_ID.Text));
  except
    LOCALIZACAO_ID.Value := GetConsulta('LOCAIS', 0, 0, 0);
  end;
end;

procedure TFrmReajuste_Preco.btnProdutoClick(Sender: TObject);
begin
  try
    Produto.Value := GetConsulta('ESTOQUE', 1, 0 , StrToInt(Produto.Text));
  except
    Produto.Value := GetConsulta('ESTOQUE', 0, 0, 0);
  end;
end;



procedure TFrmReajuste_Preco.btnRetornaClick(Sender: TObject);
begin
   Close;
end;

procedure TFrmReajuste_Preco.btnSub_TipoClick(Sender: TObject);
begin
  try
    SUBTIPO_ID.Value := GetConsulta('SUBTIPOS', 0, 0, StrToInt(SUBTIPO_ID.Text));
  except
    SUBTIPO_ID.Value := GetConsulta('SUBTIPOS', 0, 0, 0);
  end;
end;

procedure TFrmReajuste_Preco.combo_reajustar_porChange(Sender: TObject);
var
Tipo : String;
begin

    Tipo := combo_reajustar_por.Text;

    if Tipo = 'Produto' then
    Begin
      {habilita}
      Label5.Enabled     := True;
      Produto.Enabled    := True;
      btnProduto.Enabled := True;
      DBText4.Visible    := True;
      Produto.SetFocus;

      {desabilita}
      Label2.Enabled := False;
      Label3.Enabled := False;
      Label4.Enabled := False;

      SUBTIPO_ID.Enabled     := False;
      LOCALIZACAO_ID.Enabled := False;
      GRUPO_ID.Enabled       := False;

      btnSub_Tipo.Enabled    := False;
      btnLocalizacao.Enabled := False;
      btnGrupo.Enabled       := False;

      SUBTIPO_ID.Text     := '';
      LOCALIZACAO_ID.Text := '';
      GRUPO_ID.Text       := '';

      DBText2.Visible    := False;
      DBText3.Visible    := False;
      DBText1.Visible    := False;

    End;



    if Tipo = 'Grupo' then
    Begin
       {habilita}
      Label4.Enabled     := True;
      GRUPO_ID.Enabled   := True;
      btnGrupo.Enabled   := True;
      DBText2.Visible    := True;
      GRUPO_ID.SetFocus;

      {desabilita}
      Label5.Enabled := False;
      Label3.Enabled := False;
      Label2.Enabled := False;

      Produto.Enabled        := False;
      SUBTIPO_ID.Enabled     := False;
      LOCALIZACAO_ID.Enabled := False;

      btnProduto.Enabled     := False;
      btnSub_Tipo.Enabled    := False;
      btnLocalizacao.Enabled := False;

      Produto.Text        := '';
      SUBTIPO_ID.Text     := '';
      LOCALIZACAO_ID.Text := '';

      DBText4.Visible    := False;
      DBText3.Visible    := False;
      DBText1.Visible    := False;


    End;


    if Tipo = 'Sub-Tipo' then
    Begin
       {habilita}
      Label3.Enabled     := True;
      SUBTIPO_ID.Enabled   := True;
      btnSub_Tipo.Enabled   := True;
      DBText3.Visible    := True;
      SUBTIPO_ID.SetFocus;

      {desabilita}
      Label5.Enabled := False;
      Label4.Enabled := False;
      Label2.Enabled := False;


      Produto.Enabled        := False;
      GRUPO_ID.Enabled       := False;
      LOCALIZACAO_ID.Enabled := False;

      btnProduto.Enabled     := False;
      GRUPO_ID.Enabled    := False;
      btnLocalizacao.Enabled := False;

      Produto.Text        := '';
      GRUPO_ID.Text     := '';
      LOCALIZACAO_ID.Text := '';

      DBText4.Visible    := False;
      DBText2.Visible    := False;
      DBText1.Visible    := False;
    End;

    if Tipo = 'Localização' then
    Begin
      {habilita}
      Label2.Enabled     := True;
      LOCALIZACAO_ID.Enabled   := True;
      btnLocalizacao.Enabled   := True;
      DBText1.Visible    := True;
      LOCALIZACAO_ID.SetFocus;

      {desabilita}
      Label5.Enabled := False;
      Label4.Enabled := False;
      Label3.Enabled := False;


      Produto.Enabled        := False;
      GRUPO_ID.Enabled       := False;
      SUBTIPO_ID.Enabled := False;

      btnProduto.Enabled     := False;
      btnGrupo.Enabled       := False;
      btnSub_Tipo.Enabled    := False;

      Produto.Text        :='';
      GRUPO_ID.Text       :='';
      SUBTIPO_ID.Text     :='';

      DBText4.Visible    := False;
      DBText2.Visible    := False;
      DBText3.Visible    := False;
    End;

end;

procedure TFrmReajuste_Preco.FormShow(Sender: TObject);
begin
  Produto.SetFocus;
end;

procedure TFrmReajuste_Preco.GRUPO_IDExit(Sender: TObject);
begin
DetailSearch('Grupo');
end;

procedure TFrmReajuste_Preco.LOCALIZACAO_IDExit(Sender: TObject);
begin
  DetailSearch('Localização');
end;

procedure TFrmReajuste_Preco.operacaoChange(Sender: TObject);
var
op: String;
begin

     op := operacao.Text;

     if op = 'Reajuste' then
     Begin
      Label1.Caption := 'Ajustar preço por:';
      Label6.Enabled := False;
      preco.Enabled := False;
      Label8.Enabled := False;
      porcentagem_ajuste.Enabled := False;
      Label9.Enabled := False;
      Vr_Produto.Enabled := False;
      preco.Text := '0';
      Vr_produto.Text := '0';
      Label8.Enabled := True;
      porcentagem_ajuste.Enabled := True;
     End;

     if op = 'Acréscimo' then
     Begin
      Label1.Caption := 'Acrescentar preço por:';
      Label8.enabled := False;
      porcentagem_ajuste.enabled := False;
      Label9.Enabled := False;
      Vr_Produto.Enabled := False;
      porcentagem_ajuste.Text := '0';
      Vr_produto.Text := '0';
      Label6.Enabled := True;
      preco.Enabled := True;
     End;

     if op = 'Valor Produto' then
     Begin
      Label1.Caption := 'Ajustar preço por:';
      Label6.Enabled := False;
      preco.Enabled := False;
      Label8.Enabled := False;
      porcentagem_ajuste.Enabled := False;
      Label9.Enabled := True;
      Vr_Produto.Enabled := True;
      preco.Text := '0';
      porcentagem_ajuste.Text := '0';
     End;


end;

procedure TFrmReajuste_Preco.DetailSearch(Tabela: String);
begin

  if ((Tabela = '') or (Tabela = 'Grupo')) and (GRUPO_ID.Text <> '') then
  begin
    QGrupo.Close;

    QGrupo.ParamByName('TABELA_ID').AsInteger := StrToInt(GRUPO_ID.Text);

    QGrupo.Prepare;
    QGrupo.Open;
  end;

  if ((Tabela = '') or (Tabela = 'Subtipo')) and (SUBTIPO_ID.Text <> '') then
  begin
    QSubtipo.Close;

    QSubtipo.ParamByName('TABELA_ID').AsInteger := StrToInt(SUBTIPO_ID.Text);

    QSubtipo.Prepare;
    QSubtipo.Open;
  end;

  if ((Tabela = '') or (Tabela = 'Localização')) and (LOCALIZACAO_ID.Text <> '') then
  begin
    QLocalizacao.Close;

    QLocalizacao.ParamByName('TABELA_ID').AsInteger := StrToInt(LOCALIZACAO_ID.Text);

    QLocalizacao.Prepare;
    QLocalizacao.Open;
  end;

end;


procedure TFrmReajuste_Preco.SearchProduto;
begin
  if Produto.Value > 0 then
  Begin
  QProduto.SQL.Clear;
  QProduto.SQL.Add('SELECT * FROM PRODUTOS');
  QProduto.SQL.Add('WHERE');
  QProduto.SQL.Add('(PRODUTO_ID = :PRODUTO_ID)');
  QProduto.SQL.Add('AND (EMPRESA_ID = :EMPRESA_ID)');
  QProduto.SQL.Add('AND STATUS = :STATUS');

  QProduto.ParamByName('PRODUTO_ID').AsInteger := StrToInt(Produto.Text);
  QProduto.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  QProduto.ParamByName('STATUS').AsString := 'A';

  QProduto.Prepare;
  QProduto.Open;
  End;
end;


procedure TFrmReajuste_Preco.ProdutoExit(Sender: TObject);
begin
SearchProduto;
end;

procedure TFrmReajuste_Preco.ProdutoKeyDown(Sender: TObject;
var Key: Word; Shift: TShiftState);
begin
if (Key = Vk_F7) and (Sender = Produto) then
    btnProdutoClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmReajuste_Preco.SUBTIPO_IDExit(Sender: TObject);
begin
  DetailSearch('Subtipo');
end;

end.
