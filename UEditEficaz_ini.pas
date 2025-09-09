unit UEditEficaz_ini;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons;

type
  TFrmPasswordDlg = class(TForm)
    Label1: TLabel;
    Password: TEdit;
    btnExecuta: TBitBtn;
    btnRetorna: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPasswordDlg: TFrmPasswordDlg;

implementation

{$R *.dfm}

end.
 
