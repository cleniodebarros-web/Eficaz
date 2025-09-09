unit UEtiquetas_Laser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Spin, Mask, rxToolEdit, rxCurrEdit, DB,
  DBTables, IBCustomDataSet, IBQuery,  QRCtrls, QuickRpt,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, ACBrBarCode;

type
  TFrmEtiquetas_Laser = class(TForm)
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
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    Bevel1: TBevel;
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
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    Impr_Legenda: TCheckBox;
    Label1: TLabel;
    Chk_alterar_tamanho_fonte: TCheckBox;
    Chk_nao_imprimir_preco: TCheckBox;
    Chk_nao_imprimir_cod_barras: TCheckBox;
    Tamanho_Fonte: TEdit;
    Label11: TLabel;
    Tamanho_etiqueta: TEdit;
    QRShape6: TQRShape;
    Table_Temp: TFDMemTable;
    Data_Temp: TDataSource;
    ACBrBarCode1: TACBrBarCode;
    Label12: TLabel;
    Altura_Barras: TCurrencyEdit;
    Label13: TLabel;
    espaco_linha: TCurrencyEdit;
    QRSubDetail1: TQRSubDetail;
    Label14: TLabel;
    linha_preco: TCurrencyEdit;
    QRDBText19: TQRDBText;
    Label15: TLabel;
    Linha_descricao: TCurrencyEdit;
    Label16: TLabel;
    Linha_barra: TCurrencyEdit;
    Label18: TLabel;
    coluna_preco: TCurrencyEdit;
    procedure btnExecutaClick(Sender: TObject);
    procedure Compr_FolhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure Chk_alterar_tamanho_fonteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Chk_nao_imprimir_cod_barrasClick(Sender: TObject);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEtiquetas_Laser: TFrmEtiquetas_Laser;

implementation

uses
  UPrincipal, UData, UEtiq_Zebra;

{$R *.dfm}

procedure TFrmEtiquetas_Laser.btnExecutaClick(Sender: TObject);
begin
// 203, 345
  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    Table_Temp.First;


    GravaIni(Arq_Ini, 'Config Etiqueta Laser','Comprimento Folha', Compr_Folha.Text);
    GravaIni(Arq_Ini, 'Config Etiqueta Laser','Altura Folha', Altura_Folha.Text);
    GravaIni(Arq_Ini, 'Config Etiqueta Laser','Margem Direita', Margem_Direita.Text);
    GravaIni(Arq_Ini, 'Config Etiqueta Laser','Margem Esquerda', Margem_Esquerda.Text);
    GravaIni(Arq_Ini, 'Config Etiqueta Laser','Margem Superior', Margem_Superior.Text);
    GravaIni(Arq_Ini, 'Config Etiqueta Laser','Margem Inferior', Margem_Inferior.Text);
    GravaIni(Arq_Ini, 'Config Etiqueta Laser','Colunas', Colunas.Text);
    GravaIni(Arq_Ini, 'Config Etiqueta Laser','Espacamento', Espacamento.Text);
    GravaIni(Arq_Ini, 'Config Etiqueta Laser','Altura Etiqueta', Altura_Etiqueta.Text);
    GravaIni(Arq_Ini, 'Config Etiqueta Laser','Altura Código Barras', Altura_Barras.Text);
    GravaIni(Arq_Ini, 'Config Etiqueta Laser','Espacamento Linhas', Espaco_Linha.Text);
    GravaIni(Arq_Ini, 'Config Etiqueta Laser','Linha Preço', linha_preco.Text);
    GravaIni(Arq_Ini, 'Config Etiqueta Laser','Linha Descrição', Linha_descricao.Text);
    GravaIni(Arq_Ini, 'Config Etiqueta Laser','Linha Barra', Linha_barra.Text);
    GravaIni(Arq_Ini, 'Config Etiqueta Laser','Coluna Preço', Coluna_preco.Text);


    if Impr_Legenda.Checked then
       GravaIni(Arq_Ini, 'Config Etiqueta Laser','Imprimir Legenda', 'True')
    else
       GravaIni(Arq_Ini, 'Config Etiqueta Laser','Imprimir Legenda', 'False');

    if Chk_nao_imprimir_cod_barras.Checked then
       GravaIni(Arq_Ini, 'Config Etiqueta Laser','Não imprimir Cod. Barras', 'True')
    else
       GravaIni(Arq_Ini, 'Config Etiqueta Laser','Não imprimir Cod. Barras', 'False');

    if Chk_nao_imprimir_preco.Checked then
       GravaIni(Arq_Ini, 'Config Etiqueta Laser','Não imprimir Preco', 'True')
    else
       GravaIni(Arq_Ini, 'Config Etiqueta Laser','Não imprimir Preco', 'False');

    if Chk_alterar_tamanho_fonte.Checked then
       GravaIni(Arq_Ini, 'Config Etiqueta Laser','Alterar Tamanho Fonte', 'True')
    else
       GravaIni(Arq_Ini, 'Config Etiqueta Laser','Alterar Tamanho Fonte', 'False');

    GravaIni(Arq_Ini, 'Config Etiqueta Laser','Tamanho Fonte', Tamanho_Fonte.Text);
    GravaIni(Arq_Ini, 'Config Etiqueta Laser','Tamanho Etiqueta', Tamanho_etiqueta.Text);


    QRShape1.Width     :=  StrToInt(LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Tamanho Etiqueta'));
    QRShape2.Width     :=  StrToInt(LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Tamanho Etiqueta'));
    QRShape3.Width     :=  StrToInt(LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Tamanho Etiqueta'));
    QRShape4.Width     :=  StrToInt(LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Tamanho Etiqueta'));
    QRShape5.Width     :=  StrToInt(LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Tamanho Etiqueta'));
    QRShape6.Width     :=  StrToInt(LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Tamanho Etiqueta'));

    QRDBText2.Width    :=  StrToInt(LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Tamanho Etiqueta'));
    QRDBText7.Width    :=  StrToInt(LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Tamanho Etiqueta'));
    QRDBText6.Width    :=  StrToInt(LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Tamanho Etiqueta'));
    QRDBText5.Width    :=  StrToInt(LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Tamanho Etiqueta'));
    QRDBText4.Width    :=  StrToInt(LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Tamanho Etiqueta'));
    QRDBText3.Width    :=  StrToInt(LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Tamanho Etiqueta'));

    QRDBText1.Width     :=  StrToInt(LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Tamanho Etiqueta')) - (QRDBText19.Width + Round(StrToInt(LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Tamanho Etiqueta'))/2));

    QRDBText18.Width    :=  StrToInt(LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Tamanho Etiqueta'));
    QRDBText17.Width    :=  StrToInt(LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Tamanho Etiqueta'));
    QRDBText16.Width    :=  StrToInt(LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Tamanho Etiqueta'));
    QRDBText15.Width    :=  StrToInt(LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Tamanho Etiqueta'));
    QRDBText14.Width    :=  StrToInt(LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Tamanho Etiqueta'));

    if (StrToInt(Tamanho_etiqueta.Text) > 129) and (StrToInt(Tamanho_etiqueta.Text) <= 500) then
    begin

     QRDBIMAGE1.Left := QRDBIMAGE1.Left +  Round((StrToInt(LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Tamanho Etiqueta')) - QRDBIMAGE1.Width) / 2 );
     QRDBText8.Left  := QRDBIMAGE1.Left  - 145 ;

     QRDBIMAGE2.Left := QRDBIMAGE2.Left +  Round((StrToInt(LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Tamanho Etiqueta')) - QRDBIMAGE2.Width) / 2 );
     QRDBText9.Left  := QRDBIMAGE2.Left  ;


     QRDBIMAGE3.Left := QRDBIMAGE3.Left +  Round((StrToInt(LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Tamanho Etiqueta')) - QRDBIMAGE3.Width) / 2 );
     QRDBText10.Left := QRDBIMAGE3.Left ;

     QRDBIMAGE4.Left :=  QRDBIMAGE4.Left + Round((StrToInt(LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Tamanho Etiqueta')) - QRDBIMAGE4.Width) / 2 );
     QRDBText11.Left := QRDBIMAGE4.Left;

     QRDBIMAGE5.Left := QRDBIMAGE5.Left + Round((StrToInt(LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Tamanho Etiqueta')) - QRDBIMAGE5.Width) / 2 );
     QRDBText12.Left := QRDBIMAGE5.Left;

     QRDBIMAGE6.Left  :=  QRDBIMAGE6.Left + Round((StrToInt(LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Tamanho Etiqueta')) - QRDBIMAGE6.Width) / 2 );
     QRDBText13.Left  := QRDBIMAGE6.Left;

    end;


    QRDBText8.Enabled  := Impr_Legenda.Checked;
    QRDBText9.Enabled  := Impr_Legenda.Checked;
    QRDBText10.Enabled := Impr_Legenda.Checked;
    QRDBText11.Enabled := Impr_Legenda.Checked;
    QRDBText12.Enabled := Impr_Legenda.Checked;
    QRDBText13.Enabled := Impr_Legenda.Checked;

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
      QRSubDetail1.Height          := StrToint(Espaco_linha.Text);
      DetailBand1.Size.Height      := Altura_Etiqueta.Value;
      QRDBIMAGE1.Size.Height       := Altura_BARRAS.Value;

      Etiq_Laser.PreviewModal;
    end;

    Table_Temp.Close;
    Close;
  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;

procedure TFrmEtiquetas_Laser.Chk_alterar_tamanho_fonteClick(Sender: TObject);
begin

   if Chk_alterar_tamanho_fonte.Checked then
   begin
     Label1.Visible         :=  True;
     Tamanho_Fonte.Visible  :=  True;

     if Tamanho_Fonte.CanFocus then
        Tamanho_Fonte.SetFocus;
   end
   else
   begin
    Label1.Visible          :=  False;
    Tamanho_Fonte.Visible   :=  False;
   end;




end;

procedure TFrmEtiquetas_Laser.Chk_nao_imprimir_cod_barrasClick(Sender: TObject);
begin
   if Chk_nao_imprimir_cod_barras.Checked then
   begin

     if LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Alterar Tamanho Fonte') = 'True' then
     begin
        Chk_alterar_tamanho_fonte.Visible := True;
        Tamanho_Fonte.Visible := True;
        Label1.Visible        := True;
     end
     else
     begin
        Chk_alterar_tamanho_fonte.Visible := True;
        Tamanho_Fonte.Visible := False;
        Label1.Visible        := False;
     end;

     
   end
   else
   begin
     Chk_alterar_tamanho_fonte.Visible := False;
     Tamanho_Fonte.Visible := False;
     Label1.Visible := False;
   end;

end;

procedure TFrmEtiquetas_Laser.Compr_FolhaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmEtiquetas_Laser.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin

    if LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Não imprimir Cod. Barras') = 'True' then
    begin

        QRDBIMAGE1.Enabled := False;

        if LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Alterar Tamanho Fonte') = 'True' then
        begin
            QRDBText2.Font.Size  := StrToInt(LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Tamanho Fonte'));
            QRDBText1.Font.Size  := StrToInt(LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Tamanho Fonte'));
            QRDBText19.Font.Size := StrToInt(LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Tamanho Fonte'));
            QRDBText8.Font.Size  := StrToInt(LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Tamanho Fonte')) -2 ;
            QRDBText1.Top        := StrToInt(LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Linha Preço'));
            QRDBText19.Top       := StrToInt(LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Linha Preço'));
            QRDBText2.Top        := StrToInt(LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Linha Descrição'));
            QRDBText8.Top        := StrToInt(LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Linha Barra'));
            QRDBText19.Left      := StrToInt(LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Coluna Preço'));
        end;
    end;


    if LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Não imprimir Preco') = 'True' then
    begin
      QRDBText1.Enabled := False;
    end;


end;

procedure TFrmEtiquetas_Laser.FormCreate(Sender: TObject);
var
Temp_Name: String;
begin
  with Table_Temp do
  begin

    Temp_Name    := Copy(TimeToStr(time), 1, 2) + Copy(TimeToStr(time), 4, 2) + Copy(TimeToStr(time), 7, 2);


    with FieldDefs do
    begin
      Clear;
      Add('COD_BARRA', ftString, 13, False);
      Add('DESCRICAO', ftString, 24, False);
      Add('PRECO_VAREJO', ftFloat, 0, False);
      Add('R$', ftString, 2, False);
      Add('IMAGEM', ftBlob, 0, False);
    end;

    with IndexDefs do
    begin
      Clear;
    end;


    Open;
  end;



end;

procedure TFrmEtiquetas_Laser.FormShow(Sender: TObject);
begin

   Compr_Folha.Text             :=   LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Comprimento Folha');
   Altura_Folha.Text            :=   LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Altura Folha');
   Margem_Direita.Text          :=   LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Margem Direita');
   Margem_Esquerda.Text         :=   LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Margem Esquerda');
   Margem_Superior.Text         :=   LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Margem Superior');
   Margem_Inferior.Text         :=   LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Margem Inferior');
   Colunas.Text                 :=   LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Colunas');
   Espacamento.Text             :=   LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Espacamento');
   Altura_Etiqueta.Text         :=   LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Altura Etiqueta');
   Altura_Barras.Text           :=   LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Altura Código Barras');
   Espaco_linha.Text            :=   LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Espacamento Linhas');
   Tamanho_etiqueta.Text        :=   LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Tamanho Etiqueta');
   linha_preco.Text             :=   LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Linha Preço');
   Linha_descricao.Text         :=   LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Linha Descrição');
   Linha_barra.Text             :=   LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Linha Barra');
   Coluna_preco.Text            :=   LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Coluna Preço');


   if LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Imprimir Legenda') = 'True' then
      Impr_Legenda.Checked := True
   else
     Impr_Legenda.Checked := False;

   if LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Não imprimir Cod. Barras') = 'True' then
   begin
      Chk_nao_imprimir_cod_barras.Checked := True;
      Chk_alterar_tamanho_fonte.Visible := True;
   end
   else
   begin
     Chk_nao_imprimir_cod_barras.Checked := False;
     Chk_alterar_tamanho_fonte.Visible := False;
   end;
    

   if LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Não imprimir Preco') = 'True' then
      Chk_nao_imprimir_preco.Checked := True
   else
     Chk_nao_imprimir_preco.Checked := False;


   if LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Alterar Tamanho Fonte') = 'True' then
    begin
      Chk_alterar_tamanho_fonte.Checked := True;
    end
   else
     Chk_alterar_tamanho_fonte.Checked := False;

   Tamanho_Fonte.Text := LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Tamanho Fonte');


end;

procedure TFrmEtiquetas_Laser.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin

    if LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Não imprimir Cod. Barras') = 'True' then
    begin

        QRDBIMAGE6.Enabled := False;
        QRDBIMAGE5.Enabled := False;
        QRDBIMAGE4.Enabled := False;
        QRDBIMAGE3.Enabled := False;
        QRDBIMAGE2.Enabled := False;


        if LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Alterar Tamanho Fonte') = 'True' then
        begin
            QRDBText7.Font.Size := StrToInt(LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Tamanho Fonte'));
            QRDBText6.Font.Size := StrToInt(LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Tamanho Fonte'));
            QRDBText5.Font.Size := StrToInt(LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Tamanho Fonte'));
            QRDBText4.Font.Size := StrToInt(LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Tamanho Fonte'));
            QRDBText3.Font.Size := StrToInt(LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Tamanho Fonte'));


            QRDBText14.Font.Size := StrToInt(LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Tamanho Fonte'));
            QRDBText15.Font.Size := StrToInt(LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Tamanho Fonte'));
            QRDBText16.Font.Size := StrToInt(LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Tamanho Fonte'));
            QRDBText17.Font.Size := StrToInt(LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Tamanho Fonte'));
            QRDBText18.Font.Size := StrToInt(LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Tamanho Fonte'));
        end;
    end;


    if LeIni(Arq_Ini, 'Config Etiqueta Laser', 'Não imprimir Preco') = 'True' then
    begin
      QRDBText18.Enabled := False;
      QRDBText17.Enabled := False;
      QRDBText16.Enabled := False;
      QRDBText15.Enabled := False;
      QRDBText14.Enabled := False;
    end;


end;

end.
