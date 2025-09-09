unit UCarta_Correcao_Cte;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, rxToolEdit, rxCurrEdit, pcnConversao,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids;

type
  TFrmCarta_Correcao_Cte = class(TForm)
    Bevel1: TBevel;
    btnExecuta: TBitBtn;
    btnRetorna: TBitBtn;
    Label1: TLabel;
    Chave: TEdit;
    Label2: TLabel;
    Lote: TCurrencyEdit;
    CNPJ_CPF: TEdit;
    Label4: TLabel;
    Seq_Evento: TCurrencyEdit;
    Label5: TLabel;
    btnChaveCTe: TSpeedButton;
    Temp_Correcao: TFDMemTable;
    Data_Correcao: TDataSource;
    Grid_Inadimplencia: TDBGrid;
    procedure btnRetornaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ChaveKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure LoteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ChaveChange(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure btnChaveCTeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCarta_Correcao_Cte: TFrmCarta_Correcao_Cte;

implementation

uses
  UPrincipal;

{$R *.dfm}

procedure TFrmCarta_Correcao_Cte.btnChaveCTeClick(Sender: TObject);
begin
    FrmPrincipal.OpenDialog1.Title      := 'Selecione a CTe';
    FrmPrincipal.OpenDialog1.DefaultExt := '*-cte.XML';
    FrmPrincipal.OpenDialog1.Filter     := 'Arquivos CTE (*-cte.XML)|*-cte.XML|Arquivos XML (*.XML)|*.XML|Todos os Arquivos (*.*)|*.*';
    FrmPrincipal.OpenDialog1.InitialDir := FrmPrincipal.ACBrCTe1.Configuracoes.Arquivos.GetPathCTe;

    if FrmPrincipal.OpenDialog1.Execute then
    Begin
     if (FrmPrincipal.ACBrCTe1.Configuracoes.Arquivos.SepararPorCNPJ) and (FrmPrincipal.ACBrCTe1.Configuracoes.Arquivos.SepararPorMes)   then
     CHAVE.Text := COPY(FrmPrincipal.OpenDialog1.FileName,length(FrmPrincipal.ACBrNFe1.Configuracoes.Arquivos.GetPathNFe) +2 , 44)

     Else if (FrmPrincipal.ACBrCTe1.Configuracoes.Arquivos.SepararPorCNPJ) then
     CHAVE.Text := COPY(FrmPrincipal.OpenDialog1.FileName,length(FrmPrincipal.ACBrCTe1.Configuracoes.Arquivos.GetPathcte) +2 , 44)

     Else if (FrmPrincipal.ACBrCTe1.Configuracoes.Arquivos.SepararPorMes) then
     CHAVE.Text := COPY(FrmPrincipal.OpenDialog1.FileName,length(FrmPrincipal.ACBrCTe1.Configuracoes.Arquivos.GetPathcte) +2 , 44)

     Else
     CHAVE.Text := COPY(FrmPrincipal.OpenDialog1.FileName,length(FrmPrincipal.ACBrCTe1.Configuracoes.Arquivos.GetPathcte) +1, 44);

    Seq_evento.Text := '1';
    End;
end;

procedure TFrmCarta_Correcao_Cte.btnExecutaClick(Sender: TObject);
begin
  try
   // FrmPrincipal.ACBrCTe1.DACTe := FrmPrincipal.ACBrCTeDACTeRL1;

    if Length(Chave.Text) < 44 then
      exit;

    if Seq_Evento.Value = 0 then
      exit;


    FrmPrincipal.ACBrCTe1.EventoCTe.Evento.Clear;

    with FrmPrincipal.ACBrCTe1.EventoCTe.Evento.Add do
    begin
      infEvento.chCTe               := Chave.Text;
      infEvento.CNPJ                := CNPJ_CPF.Text;
      infEvento.dhEvento            := now;
      infEvento.tpEvento            := teCCe;
      InfEvento.DescricaoTipoEvento(tecce);

      Temp_Correcao.first;

       While not Temp_Correcao.Eof do
       Begin
         with InfEvento.detEvento.infCorrecao.Add do
        Begin
         grupoAlterado   := Temp_Correcao.FieldByName('GRUPO_ALTERADO').AsString;
         campoAlterado   := Temp_Correcao.FieldByName('CAMPO_ALTERADO').AsString;
         valorAlterado   := Temp_Correcao.FieldByName('CORRECAO').AsString;

         if Temp_Correcao.FieldByName('ITEM_ALTERADO').AsInteger > 0 then
         nroItemAlterado := Temp_Correcao.FieldByName('ITEM_ALTERADO').AsInteger;

        End;
        Temp_Correcao.next;
       End;

      infEvento.nSeqEvento          := StrToInt(Seq_Evento.Text);
     // infEvento.detEvento. xJust     := Correcao.Text;


    end;

    FrmPrincipal.ACBrCTe1.EnviarEvento(StrToInt(Lote.Text));

    FrmPrincipal.OpenDialog1.Title      := 'Selecione a CTE';
    FrmPrincipal.OpenDialog1.DefaultExt := '*.XML';
    FrmPrincipal.OpenDialog1.Filter     := 'Arquivos XML (*.XML)|*.XML|Todos os Arquivos (*.*)|*.*';

    FrmPrincipal.OpenDialog1.InitialDir := FrmPrincipal.ACBrCTe1.Configuracoes.Arquivos.GetPathCTe;

    if FrmPrincipal.OpenDialog1.Execute then
    begin
      FrmPrincipal.ACBrCTe1.Conhecimentos.Clear;
      FrmPrincipal.ACBrCTe1.Conhecimentos.LoadFromFile(FrmPrincipal.OpenDialog1.FileName);
    end;

    FrmPrincipal.OpenDialog1.Title      := 'Selecione o Evento';
    FrmPrincipal.OpenDialog1.DefaultExt := '*procEventoCTe.XML';
    FrmPrincipal.OpenDialog1.Filter     := 'Arquivos XML (*procEventoNFe.XML)|*procEventoCTe.XML|Todos os Arquivos (*.*)|*.*';
    FrmPrincipal.OpenDialog1.InitialDir := FrmPrincipal.ACBrCTe1.Configuracoes.Arquivos.PathEvento;

    if FrmPrincipal.OpenDialog1.Execute then
    begin
      FrmPrincipal.ACBrCTe1.EventoCTe.Evento.Clear;
      FrmPrincipal.ACBrCTe1.EventoCTe.LerXML(FrmPrincipal.OpenDialog1.FileName) ;
      FrmPrincipal.ACBrCTe1.ImprimirEvento;
    end;
  finally
    //FrmPrincipal.ACBrCTe1.DACTe := FrmPrincipal.ACBrCTeDACTeRL1;
  end;
end;

procedure TFrmCarta_Correcao_Cte.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCarta_Correcao_Cte.ChaveChange(Sender: TObject);
begin
  CNPJ_CPF.Text := Copy(Chave.Text, 7, 14);
end;

procedure TFrmCarta_Correcao_Cte.ChaveKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmCarta_Correcao_Cte.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmCarta_Correcao_Cte.FormCreate(Sender: TObject);
begin
   Temp_correcao.Free;
   Temp_correcao := TFDMemTable.Create(nil);

  with Temp_correcao do
  begin
    with FieldDefs do
    begin
      Clear;
      Add('GRUPO_ALTERADO', ftString, 70, False);
      Add('CAMPO_ALTERADO', ftString, 60, False);
      Add('ITEM_ALTERADO', ftInteger, 0, False);
      Add('CORRECAO', ftString, 200, False);
    end;

    with IndexDefs do
    begin
      Clear;
      Add('', 'ITEM_ALTERADO', [ixPrimary, ixUnique]);
      Add('TEMP', 'ITEM_ALTERADO', [ixCaseInsensitive]);
    end;

   // CreateTable;
    IndexName := 'TEMP';
    Open;
  end;
  Data_Correcao.DataSet := Temp_Correcao;

end;

procedure TFrmCarta_Correcao_Cte.LoteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

end.
