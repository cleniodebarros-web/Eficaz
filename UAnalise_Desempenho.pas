unit UAnalise_Desempenho;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, rxCurrEdit, Mask, rxToolEdit, Buttons;

type
  TFrmAnalise_Desempenho = class(TForm)
    Label1: TLabel;
    Dtmen: TDateEdit;
    Dtmai: TDateEdit;
    Label2: TLabel;
    Fornecedor: TCurrencyEdit;
    Label5: TLabel;
    Ordem: TComboBox;
    Bevel1: TBevel;
    Label3: TLabel;
    Grupo: TCurrencyEdit;
    Label4: TLabel;
    Sub_Tipo: TCurrencyEdit;
    Label6: TLabel;
    Localizacao: TCurrencyEdit;
    btnFornecedor: TSpeedButton;
    btnGrupo: TSpeedButton;
    btnSub_Tipo: TSpeedButton;
    btnLocalizacao: TSpeedButton;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    procedure btnRetornaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnGrupoClick(Sender: TObject);
    procedure btnSub_TipoClick(Sender: TObject);
    procedure btnLocalizacaoClick(Sender: TObject);
    procedure btnFornecedorClick(Sender: TObject);
    procedure FornecedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DtmenEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAnalise_Desempenho: TFrmAnalise_Desempenho;

implementation

uses
  UConsulta, UPrincipal;

{$R *.dfm}

procedure TFrmAnalise_Desempenho.btnFornecedorClick(Sender: TObject);
begin
  try
    Fornecedor.Value := GetConsulta('FORNECEDORES', 0, 0, StrToInt(Fornecedor.Text));
  except
    Fornecedor.Value := GetConsulta('FORNECEDORES', 0, 0, 0);
  end;
end;

procedure TFrmAnalise_Desempenho.btnGrupoClick(Sender: TObject);
begin
  try
    Grupo.Value := GetConsulta('GRUPOS', 0, 0, StrToInt(Grupo.Text));
  except
    Grupo.Value := GetConsulta('GRUPOS', 0, 0, 0);
  end;
end;

procedure TFrmAnalise_Desempenho.btnLocalizacaoClick(Sender: TObject);
begin
  try
    Localizacao.Value := GetConsulta('LOCAIS', 0, 0, StrToInt(Localizacao.Text));
  except
    Localizacao.Value := GetConsulta('LOCAIS', 0, 0, 0);
  end;
end;

procedure TFrmAnalise_Desempenho.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmAnalise_Desempenho.btnSub_TipoClick(Sender: TObject);
begin
  try
    Sub_Tipo.Value := GetConsulta('SUBTIPOS', 0, 0, StrToInt(Sub_Tipo.Text));
  except
    Sub_Tipo.Value := GetConsulta('SUBTIPOS', 0, 0, 0);
  end;
end;

procedure TFrmAnalise_Desempenho.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmAnalise_Desempenho.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmAnalise_Desempenho.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmAnalise_Desempenho.FormCreate(Sender: TObject);
begin
  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);
end;

procedure TFrmAnalise_Desempenho.FornecedorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = Fornecedor) then
    btnFornecedorClick(Self);

  if (Key = Vk_F7) and (Sender = Grupo) then
    btnGrupoClick(Self);

  if (Key = Vk_F7) and (Sender = Sub_Tipo) then
    btnSub_TipoClick(Self);
  if (Key = Vk_F7) and (Sender = Localizacao) then
    btnLocalizacaoClick(Self);
    
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

end.
