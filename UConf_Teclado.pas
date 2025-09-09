unit UConf_Teclado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFrmConf_Teclado = class(TForm)
    btnRetorna: TButton;
    Bevel1: TBevel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    Button21: TButton;
    Button22: TButton;
    Button23: TButton;
    Button24: TButton;
    Button25: TButton;
    Button26: TButton;
    Button27: TButton;
    Button28: TButton;
    Button29: TButton;
    Button30: TButton;
    Button31: TButton;
    Button32: TButton;
    Button33: TButton;
    Button34: TButton;
    Button35: TButton;
    Button37: TButton;
    Button39: TButton;
    Button40: TButton;
    Button41: TButton;
    Button42: TButton;
    Button43: TButton;
    Button45: TButton;
    Button46: TButton;
    Button47: TButton;
    Button36: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRetornaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConf_Teclado: TFrmConf_Teclado;
  Fnc: String;

implementation

uses
  UData, UTecla, UPrincipal;

{$R *.dfm}

procedure TFrmConf_Teclado.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmConf_Teclado.Button1Click(Sender: TObject);
begin
  Fnc := TButton(Sender).Caption;

  Application.CreateForm(TFrmTecla, FrmTecla);
  try
    FrmTecla.ShowModal;
  finally
    FrmTecla.Release;
  end;
end;

procedure TFrmConf_Teclado.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
