unit UConfig_NFiscal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, StdCtrls, Mask, ExtCtrls, ComCtrls,
  Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmConfig_NFiscal = class(TForm)
    Panel1: TPanel;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label63: TLabel;
    Label32: TLabel;
    Bevel3: TBevel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    hEnt_Sai: TMaskEdit;
    hMunicipio: TMaskEdit;
    hNum_Nf: TMaskEdit;
    hUF: TMaskEdit;
    hDesc_CFOP: TMaskEdit;
    hInscricao: TMaskEdit;
    hCFOP: TMaskEdit;
    hHr_Saida: TMaskEdit;
    hNome: TMaskEdit;
    hCNPJ: TMaskEdit;
    hDt_Emissao: TMaskEdit;
    hEndereco: TMaskEdit;
    hBairro: TMaskEdit;
    hCEP: TMaskEdit;
    hDt_Saida: TMaskEdit;
    TabSheet2: TTabSheet;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    Label4: TLabel;
    Label12: TLabel;
    bCodigo: TMaskEdit;
    bDescricao: TMaskEdit;
    bCST: TMaskEdit;
    bUnidade: TMaskEdit;
    bQuantidade: TMaskEdit;
    bVr_Unitario: TMaskEdit;
    bVr_Total: TMaskEdit;
    bICMS: TMaskEdit;
    bBarras: TMaskEdit;
    bQtde: TMaskEdit;
    TabSheet3: TTabSheet;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Bevel2: TBevel;
    Label86: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    Label91: TLabel;
    Label92: TLabel;
    Label93: TLabel;
    Label94: TLabel;
    Label95: TLabel;
    Label96: TLabel;
    Label97: TLabel;
    Label98: TLabel;
    Label99: TLabel;
    Label100: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    fBase_ICMS: TMaskEdit;
    fVr_ICMS: TMaskEdit;
    fBase_St: TMaskEdit;
    fPeso_Bruto: TMaskEdit;
    fVr_St: TMaskEdit;
    fPeso_Liquido: TMaskEdit;
    fVr_Produtos: TMaskEdit;
    fInstrucoes: TMaskEdit;
    fVr_Frete: TMaskEdit;
    fNum_Nf: TMaskEdit;
    fVr_Seguro: TMaskEdit;
    fPlaca: TMaskEdit;
    fDespesas: TMaskEdit;
    fUF_Placa: TMaskEdit;
    fVr_IPI: TMaskEdit;
    fCNPJ: TMaskEdit;
    fNome_Transp: TMaskEdit;
    fEndereco: TMaskEdit;
    fResp_Frete: TMaskEdit;
    fMunicipio: TMaskEdit;
    fUF_Transp: TMaskEdit;
    fInscricao: TMaskEdit;
    fQuantidade: TMaskEdit;
    fEspecie: TMaskEdit;
    fMarca: TMaskEdit;
    fNumero: TMaskEdit;
    fVr_Nota: TMaskEdit;
    QRel: TFDQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRetornaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure hEnt_SaiKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    function Search_Campo(Txt: String): String;
    procedure GravaConfig(Campo, Linha, Coluna: String);
  end;

var
  FrmConfig_NFiscal: TFrmConfig_NFiscal;

implementation

uses
  UPrincipal, UData;

{$R *.dfm}

function TFrmConfig_NFiscal.Search_Campo(Txt: String): String;
begin
  QRel.Sql.Clear;
  QRel.Sql.Add('SELECT * FROM CONFIG_NFISCAL');
  QRel.Sql.Add('WHERE');
  QRel.Sql.Add('(CAMPO = :CAMPO)');
  QRel.ParamByName('CAMPO').AsString := Txt;
  QRel.Prepare;
  QRel.Open;

  if not QRel.IsEmpty then
    Result := QRel.FieldByName('COLUNA').AsString
  else
    Result := '';
end;

procedure TFrmConfig_NFiscal.GravaConfig(Campo, Linha, Coluna: String);
begin
  QRel.Sql.Clear;
  QRel.Sql.Add('UPDATE CONFIG_NFISCAL SET LINHA = :LINHA, COLUNA = :COLUNA');
  QRel.Sql.Add('WHERE');
  QRel.Sql.Add('(CAMPO = :CAMPO)');
  QRel.ParamByName('LINHA').AsInteger  := StrToInt(Linha);
  QRel.ParamByName('COLUNA').AsInteger := StrToInt(Coluna);
  QRel.ParamByName('CAMPO').AsString   := Campo;
  QRel.Prepare;
  QRel.ExecSql;

end;

procedure TFrmConfig_NFiscal.hEnt_SaiKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmConfig_NFiscal.btnExecutaClick(Sender: TObject);
begin
  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    GravaConfig('Cabeçalho NF - Col. Tipo', '0', hEnt_Sai.Text);
    GravaConfig('Cabeçalho NF - Col. Número NF', '0', hNum_Nf.Text);
    GravaConfig('Cabeçalho NF - Col. Desc. CFOP', '0', hDesc_CFOP.Text);
    GravaConfig('Cabeçalho NF - Col. CFOP', '0', hCFOP.Text);
    GravaConfig('Cabeçalho NF - Col. Razão Social', '0', hNome.Text);
    GravaConfig('Cabeçalho NF - Col. CNPJ/CPF', '0', hCNPJ.Text);
    GravaConfig('Cabeçalho NF - Col. Dt. Emissão', '0', hDt_Emissao.Text);
    GravaConfig('Cabeçalho NF - Col. Endereço', '0', hEndereco.Text);
    GravaConfig('Cabeçalho NF - Col. Bairro', '0', hBairro.Text);
    GravaConfig('Cabeçalho NF - Col. CEP', '0', hCEP.Text);
    GravaConfig('Cabeçalho NF - Col. Dt. Saída', '0', hDt_Saida.Text);
    GravaConfig('Cabeçalho NF - Col. Município', '0', hMunicipio.Text);
    GravaConfig('Cabeçalho NF - Col. UF', '0', hUF.Text);
    GravaConfig('Cabeçalho NF - Col. Inscr. Est.', '0', hInscricao.Text);
    GravaConfig('Cabeçalho NF - Col. Hr. Saída', '0', hHr_Saida.Text);
    GravaConfig('Corpo NF - Col. Cód. Produto', '0', bCodigo.Text);
    GravaConfig('Corpo NF - Col. Descr. Produto', '0', bDescricao.Text);
    GravaConfig('Corpo NF - Col. Cód. Barras', '0', bBarras.Text);
    GravaConfig('Corpo NF - Col. CST', '0', bCST.Text);
    GravaConfig('Corpo NF - Col. Unidade', '0', bUnidade.Text);
    GravaConfig('Corpo NF - Col. Quantidade', '0', bQuantidade.Text);
    GravaConfig('Corpo NF - Col. Vr. Unitário', '0', bVr_Unitario.Text);
    GravaConfig('Corpo NF - Col. Vr. Total', '0', bVr_Total.Text);
    GravaConfig('Corpo NF - Col. ICMS', '0', bICMS.Text);
    GravaConfig('Corpo NF - Quant. Itens', '0', bQtde.Text);
    GravaConfig('Rodapé NF - Col. Base ICMS', '0', fBase_ICMS.Text);
    GravaConfig('Rodapé NF - Col. Vr. ICMS', '0', fVr_ICMS.Text);
    GravaConfig('Rodapé NF - Col. Base Sub', '0', fBase_St.Text);
    GravaConfig('Rodapé NF - Col. Vr. Sub', '0', fVr_St.Text);
    GravaConfig('Rodapé NF - Col. Vr. Produtos', '0', fVr_Produtos.Text);
    GravaConfig('Rodapé NF - Col. Vr. Frete', '0', fVr_Frete.Text);
    GravaConfig('Rodapé NF - Col. Vr. Seguro', '0', fVr_Seguro.Text);
    GravaConfig('Rodapé NF - Col. Despesas', '0', fDespesas.Text);
    GravaConfig('Rodapé NF - Col. Vr. IPI', '0', fVr_IPI.Text);
    GravaConfig('Rodapé NF - Col. Vr. Nota', '0', fVr_Nota.Text);
    GravaConfig('Rodapé NF - Col. Transportador', '0', fNome_Transp.Text);
    GravaConfig('Rodapé NF - Col. Resp. Frete', '0', fResp_Frete.Text);
    GravaConfig('Rodapé NF - Col. Placa', '0', fPlaca.Text);
    GravaConfig('Rodapé NF - Col. UF Placa', '0', fUF_Placa.Text);
    GravaConfig('Rodapé NF - Col. CNPJ/CPF', '0', fCNPJ.Text);
    GravaConfig('Rodapé NF - Col. Endereço', '0', fEndereco.Text);
    GravaConfig('Rodapé NF - Col. Município', '0', fMunicipio.Text);
    GravaConfig('Rodapé NF - Col. UF', '0', fUF_Transp.Text);
    GravaConfig('Rodapé NF - Col. Inscr. Est.', '0', fInscricao.Text);
    GravaConfig('Rodapé NF - Col. Quantidade', '0', fQuantidade.Text);
    GravaConfig('Rodapé NF - Col. Espécie', '0', fEspecie.Text);
    GravaConfig('Rodapé NF - Col. Marca', '0', fMarca.Text);
    GravaConfig('Rodapé NF - Col. Número', '0', fNumero.Text);
    GravaConfig('Rodapé NF - Col. Peso Bruto', '0', fPeso_Bruto.Text);
    GravaConfig('Rodapé NF - Col. Peso Líq.', '0', fPeso_Liquido.Text);
    GravaConfig('Rodapé NF - Col. Observação', '0', fInstrucoes.Text);
    GravaConfig('Rodapé NF - Col. Número NF', '0', fNum_Nf.Text);

    Application.MessageBox('Operação realizada com sucesso', PChar(Msg_Title), mb_IconInformation);
  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;

    Close;
  end;
end;

procedure TFrmConfig_NFiscal.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmConfig_NFiscal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmConfig_NFiscal.FormShow(Sender: TObject);
begin
  hEnt_Sai.Text      := Search_Campo('Cabeçalho NF - Col. Tipo');
  hNum_Nf.Text       := Search_Campo('Cabeçalho NF - Col. Número NF');
  hDesc_CFOP.Text    := Search_Campo('Cabeçalho NF - Col. Desc. CFOP');
  hCFOP.Text         := Search_Campo('Cabeçalho NF - Col. CFOP');
  hNome.Text         := Search_Campo('Cabeçalho NF - Col. Razão Social');
  hCNPJ.Text         := Search_Campo('Cabeçalho NF - Col. CNPJ/CPF');
  hDt_Emissao.Text   := Search_Campo('Cabeçalho NF - Col. Dt. Emissão');
  hEndereco.Text     := Search_Campo('Cabeçalho NF - Col. Endereço');
  hBairro.Text       := Search_Campo('Cabeçalho NF - Col. Bairro');
  hCEP.Text          := Search_Campo('Cabeçalho NF - Col. CEP');
  hDt_Saida.Text     := Search_Campo('Cabeçalho NF - Col. Dt. Saída');
  hMunicipio.Text    := Search_Campo('Cabeçalho NF - Col. Município');
  hUF.Text           := Search_Campo('Cabeçalho NF - Col. UF');
  hInscricao.Text    := Search_Campo('Cabeçalho NF - Col. Inscr. Est.');
  hHr_Saida.Text     := Search_Campo('Cabeçalho NF - Col. Hr. Saída');
  bCodigo.Text       := Search_Campo('Corpo NF - Col. Cód. Produto');
  bDescricao.Text    := Search_Campo('Corpo NF - Col. Descr. Produto');
  bBarras.Text       := Search_Campo('Corpo NF - Col. Cód. Barras');
  bCST.Text          := Search_Campo('Corpo NF - Col. CST');
  bUnidade.Text      := Search_Campo('Corpo NF - Col. Unidade');
  bQuantidade.Text   := Search_Campo('Corpo NF - Col. Quantidade');
  bVr_Unitario.Text  := Search_Campo('Corpo NF - Col. Vr. Unitário');
  bVr_Total.Text     := Search_Campo('Corpo NF - Col. Vr. Total');
  bICMS.Text         := Search_Campo('Corpo NF - Col. ICMS');
  bQtde.Text         := Search_Campo('Corpo NF - Quant. Itens');
  fBase_ICMS.Text    := Search_Campo('Rodapé NF - Col. Base ICMS');
  fVr_ICMS.Text      := Search_Campo('Rodapé NF - Col. Vr. ICMS');
  fBase_St.Text      := Search_Campo('Rodapé NF - Col. Base Sub');
  fVr_St.Text        := Search_Campo('Rodapé NF - Col. Vr. Sub');
  fVr_Produtos.Text  := Search_Campo('Rodapé NF - Col. Vr. Produtos');
  fVr_Frete.Text     := Search_Campo('Rodapé NF - Col. Vr. Frete');
  fVr_Seguro.Text    := Search_Campo('Rodapé NF - Col. Vr. Seguro');
  fDespesas.Text     := Search_Campo('Rodapé NF - Col. Despesas');
  fVr_IPI.Text       := Search_Campo('Rodapé NF - Col. Vr. IPI');
  fVr_Nota.Text      := Search_Campo('Rodapé NF - Col. Vr. Nota');
  fNome_Transp.Text  := Search_Campo('Rodapé NF - Col. Transportador');
  fResp_Frete.Text   := Search_Campo('Rodapé NF - Col. Resp. Frete');
  fPlaca.Text        := Search_Campo('Rodapé NF - Col. Placa');
  fUF_Placa.Text     := Search_Campo('Rodapé NF - Col. UF Placa');
  fCNPJ.Text         := Search_Campo('Rodapé NF - Col. CNPJ/CPF');
  fEndereco.Text     := Search_Campo('Rodapé NF - Col. Endereço');
  fMunicipio.Text    := Search_Campo('Rodapé NF - Col. Município');
  fUF_Transp.Text    := Search_Campo('Rodapé NF - Col. UF');
  fInscricao.Text    := Search_Campo('Rodapé NF - Col. Inscr. Est.');
  fQuantidade.Text   := Search_Campo('Rodapé NF - Col. Quantidade');
  fEspecie.Text      := Search_Campo('Rodapé NF - Col. Espécie');
  fMarca.Text        := Search_Campo('Rodapé NF - Col. Marca');
  fNumero.Text       := Search_Campo('Rodapé NF - Col. Número');
  fPeso_Bruto.Text   := Search_Campo('Rodapé NF - Col. Peso Bruto');
  fPeso_Liquido.Text := Search_Campo('Rodapé NF - Col. Peso Líq.');
  fInstrucoes.Text   := Search_Campo('Rodapé NF - Col. Observação');
  fNum_Nf.Text       := Search_Campo('Rodapé NF - Col. Número NF');
end;

end.
