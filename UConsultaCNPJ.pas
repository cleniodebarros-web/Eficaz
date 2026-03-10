unit UConsultaCNPJ;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons;

type
  TFrmConsultaCNPJ = class(TForm)
    Label8: TLabel;
    ESTADO: TComboBox;
    Label15: TLabel;
    CNPJ: TMaskEdit;
    btnExecuta: TBitBtn;
    btnRetorna: TBitBtn;
    procedure btnRetornaClick(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsultaCNPJ: TFrmConsultaCNPJ;
  xNome, xFantasia, xInscricao, xEndereco, xNumero, xComplemento, xIBGE, xMunicipio, xBairro, xCod_Pais: TEdit;
  xCNPJ, xCEP: TMaskEdit;
  xEstado, xTipo: TComboBox;

  function ConsultaCNPJ(var Nome, Fantasia, Inscricao, Endereco, Numero, Complemento, IBGE, Municipio, Bairro, Cod_Pais:TEdit; var CNPJ, CEP:TMaskEdit; var Estado, Tipo:TComboBox): Integer;

implementation

uses
  UPrincipal;

{$R *.dfm}

function ConsultaCNPJ(var Nome, Fantasia, Inscricao, Endereco, Numero, Complemento, IBGE, Municipio, Bairro, Cod_Pais: TEdit; var CNPJ, CEP: TMaskEdit; var Estado, Tipo: TComboBox): Integer;
begin
  Application.CreateForm(TFrmConsultaCNPJ, FrmConsultaCNPJ);

  FrmConsultaCNPJ.CNPJ.EditMask := '99.999.999/9999-99;1;_';
  FrmConsultaCNPJ.CNPJ.Text   := CNPJ.Text;
  if Estado.Text <> '  ' then
    FrmConsultaCNPJ.ESTADO.Text := Estado.Text
  else
    FrmConsultaCNPJ.ESTADO.Text := FrmPrincipal.QEmpresa.FieldByName('ESTADO').AsString;

  xNome        := Nome;
  xFantasia    := Fantasia;
  xInscricao   := Inscricao;
  xEndereco    := Endereco;
  xNumero      := Numero;
  xComplemento := Complemento;
  xIBGE        := IBGE;
  xMunicipio   := Municipio;
  xBairro      := Bairro;
  xCod_Pais    := Cod_Pais;
  xCNPJ        := CNPJ;
  xCEP         := CEP;
  xEstado      := Estado;
  xTipo        := Tipo;

  FrmConsultaCNPJ.Position    := poScreenCenter;
  FrmConsultaCNPJ.ShowModal;
end;

procedure TFrmConsultaCNPJ.btnExecutaClick(Sender: TObject);
var Documento: string;
begin
  try
    Documento := Alltrim(SemMascara(CNPJ.Text));

    FrmPrincipal.ACBrNFe1.WebServices.ConsultaCadastro.UF := UpperCase(ESTADO.Text);

    if Length(Documento) > 11 then
       FrmPrincipal.ACBrNFe1.WebServices.ConsultaCadastro.CNPJ := Documento
    else
       FrmPrincipal.ACBrNFe1.WebServices.ConsultaCadastro.CPF := Documento;

    FrmPrincipal.ACBrNFe1.WebServices.ConsultaCadastro.Executar;

    //Application.MessageBox(PChar(FrmPrincipal.ACBrNFe1.WebServices.ConsultaCadastro.xMotivo), PChar(Msg_Title), mb_IconInformation);
    if Application.MessageBox(PChar('Nome do Contribuinte: ' + FrmPrincipal.ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[0].xNome + #13 +
                                 'Fantasia: ' + FrmPrincipal.ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[0].xFant + #13 +
                                 'CNPJ: ' + FrmPrincipal.ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[0].CNPJ + #13 +
                                 'CPF: ' + FrmPrincipal.ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[0].CPF + #13 +
                                 'Inscr. Estadual: ' + FrmPrincipal.ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[0].IE + #13 +
                                 'Endereço: ' + FrmPrincipal.ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[0].xLgr + #13 +
                                 'Número: ' + FrmPrincipal.ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[0].nro + #13 +
                                 'Compl.: ' + FrmPrincipal.ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[0].xCpl + #13 +
                                 'Bairro: ' + FrmPrincipal.ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[0].xBairro + #13 +
                                 'IBGE Mun.: ' + IntToStr(FrmPrincipal.ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[0].cMun) + #13 +
                                 'Município: ' + FrmPrincipal.ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[0].xMun + #13 +
                                 'CEP: ' + (FrmPrincipal.ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[0].CEP) + #13 +
                                 'UF: ' + FrmPrincipal.ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[0].UF + #13 +
                                 'Situação: ' + IntToStr(FrmPrincipal.ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[0].cSit) + #13 +
                                 'Cred.NFe: ' + IntToStr(FrmPrincipal.ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[0].indCredNFe) + #13 +
                                 'Cred. CTe: ' + IntToStr(FrmPrincipal.ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[0].indCredCTe) + #13 +
                                 'Reg. Apuração: ' + FrmPrincipal.ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[0].xRegApur + #13 +
                                 'CNAE: ' + IntToStr(FrmPrincipal.ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[0].CNAE) + #13 +
                                 'Ini. Ativ.: ' + DateToStr(FrmPrincipal.ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[0].dIniAtiv) + #13 +
                                 'Últ. Situação: ' + DateToStr(FrmPrincipal.ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[0].dUltSit) + #13 +
                                 'Dt. Baixa: ' + DateToStr(FrmPrincipal.ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[0].dBaixa) + #13 +
                                 'IE Única: ' + FrmPrincipal.ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[0].IEUnica + #13 +
                                 'IE Atual: ' + FrmPrincipal.ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[0].IEAtual + #13#13 +
                                 'Deseja importar esses dados?'),
                                 PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = IDYES
    then
    begin
      xTipo.ItemIndex   := 1;
      xCNPJ.EditMask    := '';
      xCEP.EditMask     := '';
      xNome.Text        := FrmPrincipal.ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[0].xNome;
      xFantasia.Text    := FrmPrincipal.ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[0].xFant;
      xInscricao.Text   := FrmPrincipal.ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[0].IE;
      xEndereco.Text    := FrmPrincipal.ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[0].xLgr;
      xNumero.Text      := FrmPrincipal.ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[0].nro;
      xComplemento.Text := FrmPrincipal.ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[0].xCpl;
      xIBGE.Text        := IntToStr(FrmPrincipal.ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[0].cMun);
      xMunicipio.Text   := FrmPrincipal.ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[0].xMun;
      xBairro.Text      := FrmPrincipal.ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[0].xBairro;
      xCod_Pais.Text    := '01058';
      xCNPJ.Text        := FrmPrincipal.ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[0].CNPJ;
      xCEP.Text         := FrmPrincipal.ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[0].CEP;
      xEstado.Text      := FrmPrincipal.ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[0].UF;
      xCNPJ.EditMask    := '99.999.999/9999-99;1;_';
      xCEP.EditMask     := '99999-999;1;_';

      Close;
    end;
  except
    //Application.MessageBox('Ocorreu um erro ao realizar a consulta', PChar(Msg_Title), mb_IconInformation);
    on e:Exception do
    begin
      Application.MessageBox(PChar('Erro.' + #13 +
        'Erro: ' + e.Message), 'Erro', MB_ICONSTOP + MB_TASKMODAL);
    end;
  end;
end;

procedure TFrmConsultaCNPJ.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

end.
