unit UParametros;

interface                                                                      

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, Buttons, StdCtrls, Mask, rxToolEdit, rxCurrEdit, ExtCtrls,
  DB, IBCustomDataSet, IBQuery, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrmParametros = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Bevel1: TBevel;
    Fornecedor: TCurrencyEdit;
    btnFornecedor: TSpeedButton;
    DBText1: TDBText;
    Grupo: TCurrencyEdit;
    btnGrupo: TSpeedButton;
    DBText2: TDBText;
    SubTipo: TCurrencyEdit;
    btnSub_Tipo: TSpeedButton;
    DBText3: TDBText;
    Localizacao: TCurrencyEdit;
    btnLocalizacao: TSpeedButton;
    DBText4: TDBText;
    Prod_Inicial: TCurrencyEdit;
    btnProd_Inicial: TSpeedButton;
    Prod_Final: TCurrencyEdit;
    btnProd_final: TSpeedButton;
    DataGrupo: TDataSource;
    DataSubtipo: TDataSource;
    DataLocalizacao: TDataSource;
    DataFornecedor: TDataSource;
    btnExecuta: TBitBtn;
    btnRetorna: TBitBtn;
    QRel: TFDQuery;
    QProduto_Inicial: TFDQuery;
    QFornecedor: TFDQuery;
    QProduto_Final: TFDQuery;
    QSubTipo: TFDQuery;
    QGrupo: TFDQuery;
    QLocalizacao: TFDQuery;
    Label6: TLabel;
    Tributacao: TCurrencyEdit;
    BtnTributacao: TSpeedButton;
    DBText5: TDBText;
    QTributos: TFDQuery;
    DataTributos: TDataSource;
    Label7: TLabel;
    familia: TCurrencyEdit;
    BtnFamilia: TSpeedButton;
    DBText6: TDBText;
    QFamilia: TFDQuery;
    DataFamilia: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure btnGrupoClick(Sender: TObject);
    procedure btnLocalizacaoClick(Sender: TObject);
    procedure btnSub_TipoClick(Sender: TObject);
    procedure btnFornecedorClick(Sender: TObject);
    procedure btnProd_InicialClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRetornaClick(Sender: TObject);
    procedure FornecedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FornecedorExit(Sender: TObject);
    procedure GrupoExit(Sender: TObject);
    procedure SubTipoExit(Sender: TObject);
    procedure LocalizacaoExit(Sender: TObject);
    procedure Prod_InicialExit(Sender: TObject);
    procedure Prod_FinalExit(Sender: TObject);
    procedure btnProd_finalClick(Sender: TObject);
    procedure BtnTributacaoClick(Sender: TObject);
    procedure BtnFamiliaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DetailSearch(Tabela: String);
    function Validacao: Boolean;
  end;

var
  FrmParametros: TFrmParametros;

implementation

uses
  UPrincipal, UConsulta, UData;

{$R *.dfm}

function TFrmParametros.Validacao;
begin
  Result := False;
  
  Fornecedor.Color   := clWindow;
  Grupo.Color        := clWindow;
  SubTipo.Color      := clWindow;
  Localizacao.Color  := clWindow;
  Prod_Inicial.Color := clWindow;
  Prod_Final.Color   := clWindow;
  Tributacao.Color  := clWindow;

  if (QFornecedor.IsEmpty) and (Fornecedor.Value > 0) then
  begin
    Application.MessageBox('Fornecedor inexistente', PChar(Msg_Title), mb_IconStop);
    Fornecedor.Color := clYellow;
    Fornecedor.SetFocus;
    exit;
  end;

  if (QGrupo.IsEmpty) and (Grupo.Value > 0) then
  begin
    Application.MessageBox('Grupo de Estoque inexistente', PChar(Msg_Title), mb_IconStop);
    Grupo.Color := clYellow;
    Grupo.SetFocus;
    exit;
  end;

  if (QSubtipo.IsEmpty) and (SubTipo.Value > 0) then
  begin
    Application.MessageBox('Sub-Tipo de Estoque inexistente', PChar(Msg_Title), mb_IconStop);
    SubTipo.Color := clYellow;
    SubTipo.SetFocus;
    exit;
  end;

  if (QLocalizacao.IsEmpty) and (Localizacao.Value > 0) then
  begin
    Application.MessageBox('Localização inxistente', PChar(Msg_Title), mb_IconStop);
    Localizacao.Color := clYellow;
    Localizacao.SetFocus;
    exit;
  end;

  if (QProduto_Inicial.IsEmpty) and (Prod_Inicial.Value > 0) then
  begin
    Application.MessageBox('Produto inexistente', PChar(Msg_Title), mb_IconStop);
    Prod_Inicial.Color := clYellow;
    Prod_Inicial.SetFocus;
    exit;
  end;

  if (QProduto_Final.IsEmpty) and (Prod_Final.Value > 0) then
  begin
    Application.MessageBox('Produto inexistente', PChar(Msg_Title), mb_IconStop);
    Prod_Final.Color := clYellow;
    Prod_Final.SetFocus;
    exit;
  end;

  if (QTributos.IsEmpty) and (Tributacao.Value > 0) then
  begin
    Application.MessageBox('Tributação inxistente', PChar(Msg_Title), mb_IconStop);
    Tributacao.Color := clYellow;
    Tributacao.SetFocus;
    exit;
  end;

  if Prod_Final.Value < Prod_Inicial.Value then
  begin
    Application.MessageBox('ID Produto final inválido', PChar(Msg_Title), mb_IconStop);
    Prod_Final.Color := clYellow;
    Prod_Final.SetFocus;
    exit;
  end;

  Result := True;
end;

procedure TFrmParametros.DetailSearch(Tabela: String);
begin
  if ((Tabela = '') or (Tabela = 'Fornecedor')) and (Fornecedor.Text <> '') then
  begin
    QFornecedor.Close;
    QFornecedor.ParamByName('FORNECEDOR_ID').AsInteger := StrToInt(Fornecedor.Text);
    QFornecedor.Prepare;
    QFornecedor.Open;
  end;

  if ((Tabela = '') or (Tabela = 'Grupo')) and (Grupo.Text <> '') then
  begin
    QGrupo.Close;
    QGrupo.ParamByName('TABELA_ID').AsInteger := StrToInt(Grupo.Text);
    QGrupo.Prepare;
    QGrupo.Open;
  end;

  if ((Tabela = '') or (Tabela = 'Subtipo')) and (SubTipo.Text <> '') then
  begin
    QSubtipo.Close;
    QSubtipo.ParamByName('TABELA_ID').AsInteger := StrToInt(SubTipo.Text);
    QSubtipo.Prepare;
    QSubtipo.Open;
  end;

  if ((Tabela = '') or (Tabela = 'Localização')) and (Localizacao.Text <> '') then
  begin
    QLocalizacao.Close;
    QLocalizacao.ParamByName('TABELA_ID').AsInteger := StrToInt(Localizacao.Text);
    QLocalizacao.Prepare;
    QLocalizacao.Open;
  end;

  if ((Tabela = '') or (Tabela = 'Produto Inicial')) and (Prod_Inicial.Text <> '') then
  begin
    QProduto_Inicial.Close;
    QProduto_Inicial.ParamByName('PRODUTO_ID').AsInteger := StrToInt(Prod_Inicial.Text);
    QProduto_Inicial.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    QProduto_Inicial.Prepare;
    QProduto_Inicial.Open;
  end;

  if ((Tabela = '') or (Tabela = 'Produto Final')) and (Prod_Final.Text <> '') then
  begin
    QProduto_Final.Close;
    QProduto_Final.ParamByName('PRODUTO_ID').AsInteger := StrToInt(Prod_Final.Text);
    QProduto_Final.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    QProduto_Final.Prepare;
    QProduto_Final.Open;
  end;

  if ((Tabela = '') or (Tabela = 'Tributação')) and (Tributacao.Text <> '') then
  begin
    QTributos.Close;
    QTributos.ParamByName('TRIBUTO_ID').AsInteger := StrToInt(Tributacao.Text);
    QTributos.Prepare;
    QTributos.Open;
  end;
end;

procedure TFrmParametros.btnExecutaClick(Sender: TObject);
begin
  DetailSearch('');

  if Validacao then
  begin
    GravaIni(Arq_Ini, 'Parâmetros Estoque', 'Fornecedor', Fornecedor.Text);
    GravaIni(Arq_Ini, 'Parâmetros Estoque', 'Grupo', Grupo.Text);
    GravaIni(Arq_Ini, 'Parâmetros Estoque', 'SubTipo', SubTipo.Text);
    GravaIni(Arq_Ini, 'Parâmetros Estoque', 'Localização', Localizacao.Text);
    GravaIni(Arq_Ini, 'Parâmetros Estoque', 'Produto Inicial', Prod_Inicial.Text);
    GravaIni(Arq_Ini, 'Parâmetros Estoque', 'Produto Final', Prod_Final.Text);
    GravaIni(Arq_Ini, 'Parâmetros Estoque', 'Tributação', Tributacao.Text);
    GravaIni(Arq_Ini, 'Parâmetros Estoque', 'Familia', Familia.Text);
    Close;
  end;
end;

procedure TFrmParametros.BtnFamiliaClick(Sender: TObject);
begin
try
    Familia.Value := GetConsulta('FAMÍLIA', 0, 0, StrToInt(Localizacao.Text));
  except
    Familia.Value := GetConsulta('FAMÍLIA', 0, 0, 0);
  end;
end;

procedure TFrmParametros.btnFornecedorClick(Sender: TObject);
begin
  try
    Fornecedor.Value := GetConsulta('FORNECEDORES', 0, 0, StrToInt(Fornecedor.Text));
  except
    Fornecedor.Value := GetConsulta('FORNECEDORES', 0, 0, 0);
  end;
end;

procedure TFrmParametros.btnGrupoClick(Sender: TObject);
begin
  try
    Grupo.Value := GetConsulta('GRUPOS', 0, 0, StrToInt(Grupo.Text));
  except
    Grupo.Value := GetConsulta('GRUPOS', 0, 0, 0);
  end;
end;

procedure TFrmParametros.btnLocalizacaoClick(Sender: TObject);
begin
  try
    Localizacao.Value := GetConsulta('LOCAIS', 0, 0, StrToInt(Localizacao.Text));
  except
    Localizacao.Value := GetConsulta('LOCAIS', 0, 0, 0);
  end;
end;

procedure TFrmParametros.btnProd_finalClick(Sender: TObject);
begin
  try
    Prod_Final.Value := GetConsulta('ESTOQUE', FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger, 0, StrToInt(Prod_Final.Text));
  except
    Prod_Final.Value := GetConsulta('ESTOQUE', FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger, 0, 0);
  end;
end;

procedure TFrmParametros.btnProd_InicialClick(Sender: TObject);
begin
  try
    Prod_Inicial.Value := GetConsulta('ESTOQUE', FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger, 0, StrToInt(Prod_Inicial.Text));
  except
    Prod_Inicial.Value := GetConsulta('ESTOQUE', FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger, 0, 0);
  end;
end;

procedure TFrmParametros.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmParametros.btnSub_TipoClick(Sender: TObject);
begin
  try
    SubTipo.Value := GetConsulta('SUBTIPOS', 0, 0, StrToInt(SubTipo.Text));
  except
    SubTipo.Value := GetConsulta('SUBTIPOS', 0, 0, 0);
  end;
end;

procedure TFrmParametros.BtnTributacaoClick(Sender: TObject);
begin
try
    Tributacao.Value := GetConsulta('TRIBUTOS', 0, 0, StrToInt(Localizacao.Text));
  except
    Tributacao.Value := GetConsulta('TRIBUTOS', 0, 0, 0);
  end;
end;

procedure TFrmParametros.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmParametros.FormShow(Sender: TObject);
begin
  if LeIni(Arq_Ini, 'Parâmetros Estoque', 'Fornecedor') <> '' then
    Fornecedor.Value := StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Fornecedor'));

  if LeIni(Arq_Ini, 'Parâmetros Estoque', 'Grupo') <> '' then
    Grupo.Value := StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Grupo'));

  if LeIni(Arq_Ini, 'Parâmetros Estoque', 'SubTipo') <> '' then
    SubTipo.Value := StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'SubTipo'));

  if LeIni(Arq_Ini, 'Parâmetros Estoque', 'Localização') <> '' then
    Localizacao.Value := StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Localização'));

  if LeIni(Arq_Ini, 'Parâmetros Estoque', 'Tributação') <> '' then
    Tributacao.Value := StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Tributação'));

  if LeIni(Arq_Ini, 'Parâmetros Estoque', 'Familia') <> '' then
    Familia.Value := StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Familia'));

  if LeIni(Arq_Ini, 'Parâmetros Estoque', 'Produto Inicial') <> '' then
    Prod_Inicial.Value := StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Produto Inicial'));

  if LeIni(Arq_Ini, 'Parâmetros Estoque', 'Produto Final') <> '' then
    Prod_Final.Value := StrToInt(LeIni(Arq_Ini, 'Parâmetros Estoque', 'Produto Final'));


   DetailSearch('');

end;

procedure TFrmParametros.FornecedorExit(Sender: TObject);
begin
  DetailSearch('Fornecedor');
end;

procedure TFrmParametros.FornecedorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = Fornecedor) then
    btnFornecedorClick(Self);

  if (Key = Vk_F7) and (Sender = Grupo) then
    btnGrupoClick(Self);

  if (Key = Vk_F7) and (Sender = SubTipo) then
    btnSub_TipoClick(Self);

  if (Key = Vk_F7) and (Sender = Localizacao) then
    btnLocalizacaoClick(Self);

  if (Key = Vk_F7) and (Sender = Prod_Inicial) then
    btnProd_InicialClick(Self);

  if (Key = Vk_F7) and (Sender = Prod_Final) then
    btnProd_FinalClick(Self);

  if (Key = Vk_F7) and (Sender = Tributacao) then
    BtnTributacaoClick(Self);

  if (Key = Vk_F7) and (Sender = Familia) then
    BtnFamiliaClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmParametros.GrupoExit(Sender: TObject);
begin
  DetailSearch('Grupo');
end;

procedure TFrmParametros.LocalizacaoExit(Sender: TObject);
begin
  DetailSearch('Localização');
end;

procedure TFrmParametros.Prod_FinalExit(Sender: TObject);
begin
  DetailSearch('Produto Final');
end;

procedure TFrmParametros.Prod_InicialExit(Sender: TObject);
begin
  DetailSearch('Produto Inicial');
end;

procedure TFrmParametros.SubTipoExit(Sender: TObject);
begin
  DetailSearch('Subtipo');
end;

end.
