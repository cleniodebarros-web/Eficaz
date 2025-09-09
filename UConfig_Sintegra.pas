unit UConfig_Sintegra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Spin, ComCtrls, DB, DBTables, IBCustomDataSet,
  IBQuery, Mask, rxToolEdit, rxCurrEdit;

type
  TFrmConfig_Sintegra = class(TForm)
    Panel1: TPanel;
    Registro_50: TCheckBox;
    Registro_53: TCheckBox;
    Registro_60A: TCheckBox;
    Registro_60M: TCheckBox;
    Registro_60D: TCheckBox;
    Registro_54: TCheckBox;
    Registro_51: TCheckBox;
    Registro_70: TCheckBox;
    Registro_60I: TCheckBox;
    Registro_60R: TCheckBox;
    Registro_74: TCheckBox;
    Excluir_75: TCheckBox;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    Registro_75: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRetornaClick(Sender: TObject);
    procedure Registro_50KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConfig_Sintegra: TFrmConfig_Sintegra;

implementation

uses
  UPrincipal;

{$R *.DFM}

procedure TFrmConfig_Sintegra.FormCreate(Sender: TObject);
begin
  if LeIni(Arq_Ini, 'Sintegra', 'Registro 50') = 'True' then
    Registro_50.Checked := True
  else
    Registro_50.Checked := False;

  if LeIni(Arq_Ini, 'Sintegra', 'Registro 51') = 'True' then
    Registro_51.Checked := True
  else
    Registro_51.Checked := False;

  if LeIni(Arq_Ini, 'Sintegra', 'Registro 53') = 'True' then
    Registro_53.Checked := True
  else
    Registro_53.Checked := False;

  if LeIni(Arq_Ini, 'Sintegra', 'Registro 54') = 'True' then
    Registro_54.Checked := True
  else
    Registro_54.Checked := False;

  if LeIni(Arq_Ini, 'Sintegra', 'Registro 60M') = 'True' then
    Registro_60M.Checked := True
  else
    Registro_60M.Checked := False;

  if LeIni(Arq_Ini, 'Sintegra', 'Registro 60A') = 'True' then
    Registro_60A.Checked := True
  else
    Registro_60A.Checked := False;

  if LeIni(Arq_Ini, 'Sintegra', 'Registro 60D') = 'True' then
    Registro_60D.Checked := True
  else
    Registro_60D.Checked := False;

  if LeIni(Arq_Ini, 'Sintegra', 'Registro 60I') = 'True' then
    Registro_60I.Checked := True
  else
    Registro_60I.Checked := False;

  if LeIni(Arq_Ini, 'Sintegra', 'Registro 60R') = 'True' then
    Registro_60R.Checked := True
  else
    Registro_60R.Checked := False;

  if LeIni(Arq_Ini, 'Sintegra', 'Registro 70') = 'True' then
    Registro_70.Checked := True
  else
    Registro_70.Checked := False;

  if LeIni(Arq_Ini, 'Sintegra', 'Registro 74') = 'True' then
    Registro_74.Checked := True
  else
    Registro_74.Checked := False;


  if LeIni(Arq_Ini, 'Sintegra', 'Registro 75') = 'True' then
    Registro_75.Checked := True
  else
    Registro_75.Checked := False;

  if LeIni(Arq_Ini, 'Sintegra', 'Excluir Registro 75') = 'True' then
    Excluir_75.Checked := True
  else
    Excluir_75.Checked := False;
end;

procedure TFrmConfig_Sintegra.Registro_50KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmConfig_Sintegra.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmConfig_Sintegra.btnExecutaClick(Sender: TObject);
begin
  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    if Registro_50.Checked then
      GravaIni(Arq_Ini, 'Sintegra', 'Registro 50', 'True')
    else
      GravaIni(Arq_Ini, 'Sintegra', 'Registro 50', 'False');

    if Registro_51.Checked then
      GravaIni(Arq_Ini, 'Sintegra', 'Registro 51', 'True')
    else
      GravaIni(Arq_Ini, 'Sintegra', 'Registro 51', 'False');

    if Registro_53.Checked then
      GravaIni(Arq_Ini, 'Sintegra', 'Registro 53', 'True')
    else
      GravaIni(Arq_Ini, 'Sintegra', 'Registro 53', 'False');

    if Registro_54.Checked then
      GravaIni(Arq_Ini, 'Sintegra', 'Registro 54', 'True')
    else
      GravaIni(Arq_Ini, 'Sintegra', 'Registro 54', 'False');

    if Registro_60M.Checked then
      GravaIni(Arq_Ini, 'Sintegra', 'Registro 60M', 'True')
    else
      GravaIni(Arq_Ini, 'Sintegra', 'Registro 60M', 'False');

    if Registro_60A.Checked then
      GravaIni(Arq_Ini, 'Sintegra', 'Registro 60A', 'True')
    else
      GravaIni(Arq_Ini, 'Sintegra', 'Registro 60A', 'False');

    if Registro_60D.Checked then
      GravaIni(Arq_Ini, 'Sintegra', 'Registro 60D', 'True')
    else
      GravaIni(Arq_Ini, 'Sintegra', 'Registro 60D', 'False');

    if Registro_60I.Checked then
      GravaIni(Arq_Ini, 'Sintegra', 'Registro 60I', 'True')
    else
      GravaIni(Arq_Ini, 'Sintegra', 'Registro 60I', 'False');

    if Registro_60R.Checked then
      GravaIni(Arq_Ini, 'Sintegra', 'Registro 60R', 'True')
    else
      GravaIni(Arq_Ini, 'Sintegra', 'Registro 60R', 'False');

    if Registro_70.Checked then
      GravaIni(Arq_Ini, 'Sintegra', 'Registro 70', 'True')
    else
      GravaIni(Arq_Ini, 'Sintegra', 'Registro 70', 'False');

     if Registro_74.Checked then
      GravaIni(Arq_Ini, 'Sintegra', 'Registro 74', 'True')
    else
      GravaIni(Arq_Ini, 'Sintegra', 'Registro 74', 'False');


    if Registro_75.Checked then
      GravaIni(Arq_Ini, 'Sintegra', 'Registro 75', 'True')
    else
      GravaIni(Arq_Ini, 'Sintegra', 'Registro 75', 'False');

    if Excluir_75.Checked then
      GravaIni(Arq_Ini, 'Sintegra', 'Excluir Registro 75', 'True')
    else
      GravaIni(Arq_Ini, 'Sintegra', 'Excluir Registro 75', 'False');
  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;

    Close;
  end;
end;

procedure TFrmConfig_Sintegra.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
