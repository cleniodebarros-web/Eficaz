unit ULiquidacao_Cheques;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, rxToolEdit, ExtCtrls, Buttons, DB, IBCustomDataSet,
  IBQuery, DBCtrls, rxCurrEdit, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrmLiquidacao_Cheques = class(TForm)
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    Bevel1: TBevel;
    Dt_Liquidacao: TDateEdit;
    Label1: TLabel;
    Label9: TLabel;
    BANCO_ID: TCurrencyEdit;
    btnBanco: TSpeedButton;
    DBText1: TDBText;
    DataBanco: TDataSource;
    Qbanco: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure Dt_LiquidacaoEnter(Sender: TObject);
    procedure Dt_LiquidacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnBancoClick(Sender: TObject);
    procedure BANCO_IDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BANCO_IDExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DetailSearch(Tabela: String);
  end;

var
  FrmLiquidacao_Cheques: TFrmLiquidacao_Cheques;

implementation

uses
UConsulta,Udata;

{$R *.dfm}

procedure TFrmLiquidacao_Cheques.BANCO_IDExit(Sender: TObject);
begin
Detailsearch('Banco');
end;

procedure TFrmLiquidacao_Cheques.BANCO_IDKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = BANCO_ID) then
    btnBancoClick(Self);
end;

procedure TFrmLiquidacao_Cheques.DetailSearch(Tabela: String);
begin
  if ((Tabela = '') or (Tabela = 'Banco')) and (BANCO_ID.Text <> '') then
  begin
    QBanco.Close;
    QBanco.ParamByName('BANCO_ID').AsInteger   := StrToInt(BANCO_ID.Text);
    QBanco.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
    QBanco.Prepare;
    QBanco.Open;
  end;
end;

procedure TFrmLiquidacao_Cheques.btnBancoClick(Sender: TObject);
begin
  try
    BANCO_ID.Value := GetConsulta('BANCOS', 0, 0, StrToInt(BANCO_ID.Text));
  except
    BANCO_ID.Value := GetConsulta('BANCOS', 0, 0, 0);
  end;

end;

procedure TFrmLiquidacao_Cheques.Dt_LiquidacaoEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmLiquidacao_Cheques.Dt_LiquidacaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmLiquidacao_Cheques.FormCreate(Sender: TObject);
begin
  Dt_Liquidacao.Date := date;
end;

end.
