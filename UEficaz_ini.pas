unit UEficaz_ini;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFrmEficaz_Ini = class(TForm)
    ListBox1: TListBox;
    Button1: TButton;
    btnRetorna: TBitBtn;

    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure ListBox1Exit(Sender: TObject);
  private
   ListEdit: TEdit;
   procedure ListEditKeyPress(Sender: TObject; var Key: Char);
  public
    { Public declarations }
  end;

var
  FrmEficaz_Ini: TFrmEficaz_Ini;
  ii : integer;

implementation

Uses
UPrincipal,UConfig;

{$R *.dfm}

procedure TFrmEficaz_Ini.Button1Click(Sender: TObject);
begin
Listbox1.Items.SaveToFile(Arq_ini) ;
end;

procedure TFrmEficaz_Ini.FormCreate(Sender: TObject);
begin

  FrmEficaz_ini.Caption := ExtractFilePath(ParamStr(0)) + 'Eficaz.ini';
  ListBox1.Items.LoadFromFile(Arq_ini);
  ListEdit := TEdit.Create(self) ;
  ListEdit.Visible := false;
  ListEdit.Ctl3D := false;
  ListEdit.BorderStyle := bsNone;
  ListEdit.Parent := ListBox1;
  ListEdit.Width := ListBox1.ClientWidth;
  ListEdit.OnKeyPress := ListEditKeyPress;

end;

procedure TFrmEficaz_Ini.ListBox1Click(Sender: TObject);
var
  lRect: TRect;
begin

  ii := ListBox1.ItemIndex;
  if ii = -1 then
  Exit;

  lRect := ListBox1.ItemRect(ii) ;
  ListEdit.Top := lRect.Top + 1;
  ListEdit.Left := lRect.Left + 1;
  ListEdit.Height := (lRect.Bottom - lRect.Top) + 1;
  ListEdit.Text := ListBox1.Items.Strings[ii];
  ListBox1.Selected[ii] := False;
  ListEdit.Visible := True;
  ListEdit.SelectAll;
  ListEdit.SetFocus;

end;

procedure TFrmEficaz_Ini.ListBox1Exit(Sender: TObject);
begin
 ListEdit.Visible := False;
end;

procedure TFrmEficaz_Ini.ListEditKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
   // ii := ListBox1.ItemIndex;
    ListBox1.Items.Delete(ii);
    ListBox1.Items.Insert(ii, ListEdit.Text) ;
    ListEdit.Visible := False;
    Key := #0;
  end;
end;


end.
