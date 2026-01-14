unit UCarta_Correcao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, rxToolEdit, rxCurrEdit, pcnConversao,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrmCarta_Correcao = class(TForm)
    Bevel1: TBevel;
    btnExecuta: TBitBtn;
    btnRetorna: TBitBtn;
    Label1: TLabel;
    Chave: TEdit;
    Label2: TLabel;
    Lote: TCurrencyEdit;
    Orgao: TCurrencyEdit;
    Label3: TLabel;
    CNPJ_CPF: TEdit;
    Label4: TLabel;
    Seq_Evento: TCurrencyEdit;
    Label5: TLabel;
    Label6: TLabel;
    btnChaveNfe: TSpeedButton;
    CORRECAO: TMemo;
    procedure btnRetornaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ChaveKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure LoteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ChaveChange(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure btnChaveNfeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCarta_Correcao: TFrmCarta_Correcao;

implementation

uses
  UPrincipal;

{$R *.dfm}

procedure TFrmCarta_Correcao.btnChaveNfeClick(Sender: TObject);
begin
  FrmPrincipal.OpenDialog1.Title      := 'Selecione a NFE';
  FrmPrincipal.OpenDialog1.DefaultExt := '*-nfe.XML';
  FrmPrincipal.OpenDialog1.Filter     := 'Arquivos NFE (*-nfe.XML)|*-nfe.XML|Arquivos XML (*.XML)|*.XML|Todos os Arquivos (*.*)|*.*';
  FrmPrincipal.OpenDialog1.InitialDir := FrmPrincipal.ACBrNFe1.Configuracoes.Arquivos.GetPathNFe;

  if FrmPrincipal.OpenDialog1.Execute then
  Begin

    if (FrmPrincipal.ACBrNFe1.Configuracoes.Arquivos.SepararPorCNPJ) and (FrmPrincipal.ACBrNFe1.Configuracoes.Arquivos.SepararPorMes)   then
      CHAVE.Text := COPY(FrmPrincipal.OpenDialog1.FileName,length(FrmPrincipal.ACBrNFe1.Configuracoes.Arquivos.GetPathNFe) +2 , 44)

    Else if (FrmPrincipal.ACBrNFe1.Configuracoes.Arquivos.SepararPorCNPJ) then
      CHAVE.Text := COPY(FrmPrincipal.OpenDialog1.FileName,length(FrmPrincipal.ACBrNFe1.Configuracoes.Arquivos.GetPathNFe) +2 , 44)

    Else if (FrmPrincipal.ACBrNFe1.Configuracoes.Arquivos.SepararPorMes) then
      CHAVE.Text := COPY(FrmPrincipal.OpenDialog1.FileName,length(FrmPrincipal.ACBrNFe1.Configuracoes.Arquivos.GetPathNFe) +2 , 44)

    Else
      CHAVE.Text := COPY(FrmPrincipal.OpenDialog1.FileName,length(FrmPrincipal.ACBrNFe1.Configuracoes.Arquivos.GetPathNFe) +1, 44);

    FrmPrincipal.ACBrNFe1.Configuracoes.WebServices.Visualizar := False;
    try
      FrmPrincipal.ACBrNFe1.NotasFiscais.Clear;
      FrmPrincipal.ACBrNFe1.Consultar(CHAVE.Text);
    except

    end;
    try
      Seq_evento.Text := IntToStr(FrmPrincipal.ACBrNFe1.WebServices.Consulta.procEventoNFe.Items[0].RetEventoNFe.retEvento.Items[0].RetInfEvento.nSeqEvento + 1);
    except
      Seq_evento.Text := '1';
    end;
    FrmPrincipal.ACBrNFe1.Configuracoes.WebServices.Visualizar := True;

  End;
end;

procedure TFrmCarta_Correcao.btnExecutaClick(Sender: TObject);
var
valido:boolean;
begin
  try
    //FrmPrincipal.ACBrNFe1.DANFE := FrmPrincipal.ACBrNFeDANFERL1;
    Valido := True;

    if Length(Chave.Text) < 44 then
    Begin
     Application.MessageBox('Chave Nfe invalida favor verificar!', PChar(Msg_Title), mb_IconInformation);
      Valido:=False;
      abort;
    End;

    if Seq_Evento.Value = 0 then
    Begin
     Application.MessageBox('Evento nao pode ser 0 favor verificar!', PChar(Msg_Title), mb_IconInformation);
     Valido:=False;
      abort;
    End;

    if (Correcao.Text = '') or (Length(Correcao.Text) < 15)   then
    Begin
     Application.MessageBox('Motivo da correção sem informação ou inferior a 15 caracteres favor verificar!', PChar(Msg_Title), mb_IconInformation);
     Valido:=False;
      abort;
    End;

    FrmPrincipal.ACBrNFe1.EventoNFe.Evento.Clear;

    with FrmPrincipal.ACBrNFe1.EventoNFe.Evento.Add do
    begin
      infEvento.chNFe               := Chave.Text;
      infEvento.CNPJ                := CNPJ_CPF.Text;
      infEvento.dhEvento            := now;
      infEvento.tpEvento            := teCCe;
      infEvento.nSeqEvento          := StrToInt(Seq_Evento.Text);
      infEvento.detEvento.xCorrecao := Correcao.Text;
    end;

    FrmPrincipal.ACBrNFe1.EnviarEvento(StrToInt(Lote.Text));

   { FrmPrincipal.OpenDialog1.Title      := 'Selecione a NFE';
    FrmPrincipal.OpenDialog1.DefaultExt := '*.XML';
    FrmPrincipal.OpenDialog1.Filter     := 'Arquivos XML (*.XML)|*.XML|Todos os Arquivos (*.*)|*.*';

    FrmPrincipal.OpenDialog1.InitialDir := FrmPrincipal.ACBrNFe1.Configuracoes.Arquivos.GetPathNFe;

    if FrmPrincipal.OpenDialog1.Execute then
    begin  }

      FrmPrincipal.ACBrNFe1.NotasFiscais.Clear;
     // showmessage(FrmPrincipal.ACBrNFe1.Configuracoes.Arquivos.GetPathNFe + '\' + CHAVE.Text + '-nfe.xml');

     // FrmPrincipal.ACBrNFe1.NotasFiscais.LoadFromFile(FrmPrincipal.ACBrNFe1.Configuracoes.Arquivos.GetPathNFe + '\' + CHAVE.Text + '-nfe.xml');
      FrmPrincipal.ACBrNFe1.NotasFiscais.LoadFromFile(FrmPrincipal.OpenDialog1.FileName);
  //  end;  }

    FrmPrincipal.OpenDialog1.Title      := 'Selecione o Evento';
    FrmPrincipal.OpenDialog1.DefaultExt := '*procEventoNFe.XML';
    FrmPrincipal.OpenDialog1.Filter     := 'Arquivos XML (*procEventoNFe.XML)|*procEventoNFe.XML|Todos os Arquivos (*.*)|*.*';
    FrmPrincipal.OpenDialog1.InitialDir := FrmPrincipal.ACBrNFe1.Configuracoes.Arquivos.GetPathEvento(teCCe);

    FrmPrincipal.ACBrNFe1.EventoNFe.Evento.Clear;

    if (FrmPrincipal.ACBrNFe1.Configuracoes.Arquivos.SepararPorCNPJ) and (Not FrmPrincipal.ACBrNFe1.Configuracoes.Arquivos.SepararPorMes) Then
    FrmPrincipal.ACBrNFe1.EventoNFe.LerXML(FrmPrincipal.ACBrNFe1.Configuracoes.Arquivos.PathNfe + SemMascara(FrmPrincipal.QEmpresa.FieldbyName('CNPJ').AsString) +  '\110110' + Chave.Text + StrZero(Seq_evento.Text,2,0) + '-procEventoNFe.xml')
    Else if (FrmPrincipal.ACBrNFe1.Configuracoes.Arquivos.SepararPorMes) and (Not FrmPrincipal.ACBrNFe1.Configuracoes.Arquivos.SepararPorCNPJ) Then
    FrmPrincipal.ACBrNFe1.EventoNFe.LerXML(FrmPrincipal.ACBrNFe1.Configuracoes.Arquivos.PathNfe  + Copy(DateToStr(date),7,4) + Copy(DateToStr(date),4,2) + '\110110' + Chave.Text + StrZero(Seq_evento.Text,2,0) + '-procEventoNFe.xml')
    Else if (FrmPrincipal.ACBrNFe1.Configuracoes.Arquivos.SepararPorCNPJ) and (FrmPrincipal.ACBrNFe1.Configuracoes.Arquivos.SepararPorMes) Then
    FrmPrincipal.ACBrNFe1.EventoNFe.LerXML(FrmPrincipal.ACBrNFe1.Configuracoes.Arquivos.PathNfe + SemMascara(FrmPrincipal.QEmpresa.FieldbyName('CNPJ').AsString) + '\' + Copy(DateToStr(date),7,4) + Copy(DateToStr(date),4,2) + '\110110' + Chave.Text + StrZero(Seq_evento.Text,2,0) + '-procEventoNFe.xml')
    Else
    FrmPrincipal.ACBrNFe1.EventoNFe.LerXML(FrmPrincipal.ACBrNFe1.Configuracoes.Arquivos.PathNfe + '110110' + Chave.Text + StrZero(Seq_evento.Text,2,0) + '-procEventoNFe.xml');

    FrmPrincipal.ACBrNFe1.ImprimirEvento;
  finally
    //FrmPrincipal.ACBrNFe1.DANFE := FrmPrincipal.ACBrNFeDANFERL1;

    if Valido Then
    Close;
  end;
end;

procedure TFrmCarta_Correcao.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCarta_Correcao.ChaveChange(Sender: TObject);
begin
  try
    Orgao.Value := StrToInt(Copy(Chave.Text, 1, 2));
  except

  end;

  CNPJ_CPF.Text := Copy(Chave.Text, 7, 14);
end;

procedure TFrmCarta_Correcao.ChaveKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmCarta_Correcao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmCarta_Correcao.LoteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

end.
